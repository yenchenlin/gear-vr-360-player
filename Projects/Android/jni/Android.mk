LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)					# clean everything up to prepare for a module
LOCAL_ARM_MODE  := arm					# full speed arm instead of thumb
LOCAL_ARM_NEON  := true					# compile with neon support enabled
LOCAL_MODULE := jpeg
LOCAL_SRC_FILES := libjpeg.a

include $(PREBUILT_STATIC_LIBRARY)

include $(CLEAR_VARS)					# clean everything up to prepare for a module

include ../../../../../cflags.mk

LOCAL_MODULE    := oculus360videos		# generate oculus360videos.so
LOCAL_SRC_FILES  :=	../../../Src/Oculus360Videos.cpp \
					../../../Src/VideoBrowser.cpp \
					../../../Src/VideoMenu.cpp \
					../../../Src/VideosMetaData.cpp \
					../../../Src/OVR_TurboJpeg.cpp

LOCAL_STATIC_LIBRARIES += vrsound vrmodel vrlocale vrgui vrappframework systemutils libovrkernel jpeg stb
LOCAL_SHARED_LIBRARIES += vrapi

include $(BUILD_SHARED_LIBRARY)			# start building based on everything since CLEAR_VARS

$(call import-module,3rdParty/stb/build/androidprebuilt/jni)
$(call import-module,LibOVRKernel/Projects/AndroidPrebuilt/jni)
$(call import-module,VrApi/Projects/AndroidPrebuilt/jni)
$(call import-module,VrAppSupport/SystemUtils/Projects/AndroidPrebuilt/jni)
$(call import-module,VrAppFramework/Projects/AndroidPrebuilt/jni)
$(call import-module,VrAppSupport/VrGUI/Projects/AndroidPrebuilt/jni)
$(call import-module,VrAppSupport/VrLocale/Projects/AndroidPrebuilt/jni)
$(call import-module,VrAppSupport/VrModel/Projects/AndroidPrebuilt/jni)
$(call import-module,VrAppSupport/VrSound/Projects/AndroidPrebuilt/jni)