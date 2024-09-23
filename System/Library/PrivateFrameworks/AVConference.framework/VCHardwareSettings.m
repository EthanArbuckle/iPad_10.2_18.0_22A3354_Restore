@implementation VCHardwareSettings

+ (BOOL)retainPixelBufferForMediaRecordingEnabled
{
  return VCDefaults_GetBoolValueForKey(CFSTR("enableRetainPixelBufferForMediaRecording"), ((+[VCHardwareSettings deviceClass](VCHardwareSettings, "deviceClass") - 4) & 0xFFFFFFFFFFFFFFFBLL) != 0);
}

+ (BOOL)isViewPointCorrectionSupported
{
  return -[VCHardwareSettingsEmbedded isViewPointCorrectionSupported](+[VCHardwareSettingsEmbedded sharedInstance](VCHardwareSettingsEmbedded, "sharedInstance"), "isViewPointCorrectionSupported");
}

+ (double)previewPreferredAspectRatio
{
  double result;

  -[VCHardwareSettingsEmbedded previewPreferredAspectRatio](+[VCHardwareSettingsEmbedded sharedInstance](VCHardwareSettingsEmbedded, "sharedInstance"), "previewPreferredAspectRatio");
  return result;
}

+ (BOOL)isCaptureSIFRPreferred
{
  char v2;

  v2 = _os_feature_enabled_impl();
  return v2 & -[VCHardwareSettingsEmbedded isCaptureSIFRPreferred](+[VCHardwareSettingsEmbedded sharedInstance](VCHardwareSettingsEmbedded, "sharedInstance"), "isCaptureSIFRPreferred");
}

+ (id)virtualHardwareSettings:(id)a3
{
  uint64_t v4;
  __objc2_class *v5;

  v4 = VCVirtualHardwareConfigurations_DevicePlatform(a3);
  if (v4 == 2)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        +[VCHardwareSettings virtualHardwareSettings:].cold.1();
    }
    return 0;
  }
  if (v4 == 1)
  {
    v5 = VCHardwareSettingsMac;
    return (id)-[__objc2_class virtualHardwareSettings:](v5, "virtualHardwareSettings:", a3);
  }
  if (v4)
    return 0;
  v5 = VCHardwareSettingsEmbedded;
  return (id)-[__objc2_class virtualHardwareSettings:](v5, "virtualHardwareSettings:", a3);
}

- (VCHardwareSettings)init
{
  VCHardwareSettings *v2;
  uint64_t v3;
  uint64_t v4;
  objc_super v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v6.receiver = self;
  v6.super_class = (Class)VCHardwareSettings;
  v2 = -[VCHardwareSettings init](&v6, sel_init);
  if (!v2)
    return v2;
  v3 = objc_opt_new();
  v2->_hardwareUsageModeSettings = (NSMutableDictionary *)v3;
  if (!v3)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCHardwareSettings init].cold.1();
    }
    goto LABEL_12;
  }
  if (!-[VCHardwareSettings storeHardwareSettingsForAllOperatingModes](v2, "storeHardwareSettingsForAllOperatingModes"))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCHardwareSettings init].cold.3();
    }
LABEL_12:

    return 0;
  }
  v2->_supportHEVC = -1;
  -[VCHardwareSettings supportHEVC](v2, "supportHEVC");
  -[VCHardwareSettings vcpSupportsHEVCEncoder](v2, "vcpSupportsHEVCEncoder");
  v2->_isSiriVoicePlayoutSupported = 1;
  v4 = objc_opt_new();
  v2->_pixelFormatCollections = (NSMutableSet *)v4;
  if (!v4 && (int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      -[VCHardwareSettings init].cold.2();
  }
  return v2;
}

- (void)dealloc
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];

  v3.receiver = self;
  v3.super_class = (Class)VCHardwareSettings;
  -[VCHardwareSettings dealloc](&v3, sel_dealloc);
}

+ (id)featureListStringForPayload:(int)a3 hardwareSettingsMode:(unsigned __int8)a4 version:(int64_t)a5
{
  return -[VCHardwareSettings featureListStringForPayload:hardwareSettingsMode:version:](+[VCHardwareSettingsEmbedded sharedInstance](VCHardwareSettingsEmbedded, "sharedInstance"), "featureListStringForPayload:hardwareSettingsMode:version:", *(_QWORD *)&a3, a4, a5);
}

- (id)featureListStringForPayload:(int)a3 hardwareSettingsMode:(unsigned __int8)a4 version:(int64_t)a5
{
  void *v7;

  v7 = (void *)-[NSMutableDictionary objectForKeyedSubscript:](self->_hardwareUsageModeSettings, "objectForKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", a4));
  if (a3 == 126 || a3 == 123)
  {
    if (a5 == 2)
      return (id)objc_msgSend(v7, "featureListStringFixedPositionH264");
    else
      return (id)objc_msgSend(v7, "featureListStringH264");
  }
  else if (a3 == 100)
  {
    if (a5 == 2)
      return (id)objc_msgSend(v7, "featureListStringFixedPositionHEVC");
    else
      return (id)objc_msgSend(v7, "featureListStringHEVC");
  }
  else
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCHardwareSettings featureListStringForPayload:hardwareSettingsMode:version:].cold.1();
    }
    return 0;
  }
}

+ (id)sharedInstance
{
  return +[VCHardwareSettingsMac sharedInstance](VCHardwareSettingsMac, "sharedInstance");
}

- (BOOL)supportHEVC
{
  int supportHEVC;
  int v3;

  supportHEVC = self->_supportHEVC;
  if (supportHEVC == -1)
  {
    v3 = objc_msgSend((id)-[NSMutableDictionary objectForKeyedSubscript:](self->_hardwareUsageModeSettings, "objectForKeyedSubscript:", &unk_1E9EF73A0), "vcpSupportsHEVCDecoder");
    self->_supportHEVC = v3;
  }
  else
  {
    LOBYTE(v3) = supportHEVC == 1;
  }
  return v3;
}

- (BOOL)vcpSupportsHEVCEncoder
{
  BOOL result;

  result = objc_msgSend((id)-[NSMutableDictionary objectForKeyedSubscript:](self->_hardwareUsageModeSettings, "objectForKeyedSubscript:", &unk_1E9EF73A0), "vcpSupportsHEVCEncoder");
  self->_supportVCPEncoder = result;
  return result;
}

+ (BOOL)isHEVCEncodeSupportedForHardwareSettingsMode:(unsigned __int8)a3
{
  uint64_t v3;
  void *v4;
  void *v5;

  v3 = a3;
  v4 = (void *)objc_msgSend(a1, "sharedInstance");
  if (v4)
  {
    v5 = (void *)objc_msgSend(v4, "hardwareUsageModeSettings");
    LOBYTE(v4) = objc_msgSend((id)objc_msgSend(v5, "objectForKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", v3)), "vcpSupportsHEVCEncoder");
  }
  return (char)v4;
}

+ (BOOL)isHEVCDecodeSupportedForHardwareSettingsMode:(unsigned __int8)a3
{
  uint64_t v3;
  void *v4;
  void *v5;

  v3 = a3;
  v4 = (void *)objc_msgSend(a1, "sharedInstance");
  if (v4)
  {
    v5 = (void *)objc_msgSend(v4, "hardwareUsageModeSettings");
    LOBYTE(v4) = objc_msgSend((id)objc_msgSend(v5, "objectForKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", v3)), "vcpSupportsHEVCDecoder");
  }
  return (char)v4;
}

+ (unsigned)tilesPerVideoFrameForHardwareSettingsMode:(unsigned __int8)a3 hdrMode:(unint64_t)a4
{
  uint64_t v5;
  void *v6;
  void *v7;

  v5 = a3;
  v6 = (void *)objc_msgSend(a1, "sharedInstance");
  if (!v6)
    return -1;
  v7 = (void *)objc_msgSend(v6, "hardwareUsageModeSettings");
  return objc_msgSend((id)objc_msgSend(v7, "objectForKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", v5)), "numTilesPerVideoFrameForHDRMode:", a4);
}

+ (unsigned)tilesPerVideoFrameForHardwareSettingsMode:(unsigned __int8)a3
{
  return objc_msgSend(a1, "tilesPerVideoFrameForHardwareSettingsMode:hdrMode:", a3, 0);
}

- (BOOL)storeHardwareSettingsForAllOperatingModes
{
  uint64_t v3;
  VCModeSpecificHardwareSettings *v4;
  VCModeSpecificHardwareSettings *v5;
  uint64_t v6;
  BOOL v7;

  LOBYTE(v3) = 1;
  v4 = -[VCModeSpecificHardwareSettings initWithHardwareSettingsMode:]([VCModeSpecificHardwareSettings alloc], "initWithHardwareSettingsMode:", 1);
  if (v4)
  {
    v5 = v4;
    v6 = 1u;
    while (1)
    {
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_hardwareUsageModeSettings, "setObject:forKeyedSubscript:", v5, objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", v3));

      if (v6 == 7)
        return 1;
      v3 = *((unsigned __int8 *)&storeHardwareSettingsForAllOperatingModes_hardwareSettingsModes + v6);
      v5 = -[VCModeSpecificHardwareSettings initWithHardwareSettingsMode:]([VCModeSpecificHardwareSettings alloc], "initWithHardwareSettingsMode:", v3);
      ++v6;
      if (!v5)
      {
        v7 = (unint64_t)(v6 - 2) > 5;
        goto LABEL_6;
      }
    }
  }
  else
  {
    v7 = 0;
LABEL_6:
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCHardwareSettings storeHardwareSettingsForAllOperatingModes].cold.1();
    }
  }
  return v7;
}

- (unsigned)maxNetworkBitrateMultiwayAudioOnWifi:(BOOL)a3 isLowLatencyAudio:(BOOL)a4
{
  _BOOL4 v4;
  _BOOL4 v5;
  VCDefaults *v6;
  unsigned int result;
  unsigned int v8;
  BOOL v9;

  v4 = a4;
  v5 = a3;
  v6 = +[VCDefaults sharedInstance](VCDefaults, "sharedInstance");
  if (v5)
  {
    result = -[VCDefaults multiwayAudioNetworkBitrateCapWifi](v6, "multiwayAudioNetworkBitrateCapWifi");
    if (v4)
      v8 = 165600;
    else
      v8 = 73400;
    v9 = result == -1;
  }
  else
  {
    result = -[VCDefaults multiwayAudioNetworkBitrateCapCellular](v6, "multiwayAudioNetworkBitrateCapCellular");
    v9 = result == -1;
    v8 = 55000;
  }
  if (v9)
    return v8;
  return result;
}

+ (int64_t)deviceClass
{
  return +[VCHardwareSettingsEmbedded deviceClass](VCHardwareSettingsEmbedded, "deviceClass");
}

+ (unsigned)builtinMicCount
{
  const __CFNumber *v2;
  const __CFNumber *v3;
  int valuePtr;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  valuePtr = 0;
  v2 = (const __CFNumber *)MGCopyAnswer();
  if (v2)
  {
    v3 = v2;
    CFNumberGetValue(v2, kCFNumberIntType, &valuePtr);
    CFRelease(v3);
    LODWORD(v2) = valuePtr;
  }
  return v2;
}

+ (unsigned)maxRemoteParticipants30fps
{
  return -[VCHardwareSettingsEmbedded maxRemoteParticipants30fps](+[VCHardwareSettingsEmbedded sharedInstance](VCHardwareSettingsEmbedded, "sharedInstance"), "maxRemoteParticipants30fps");
}

+ (unsigned)maxFpsCameraCaptureDuringSharing
{
  return VCDefaults_GetIntValueForKey(CFSTR("maxCameraFrameRateWhenScreenIsEnabled"), -[VCHardwareSettingsEmbedded maxFpsCameraCaptureDuringSharing](+[VCHardwareSettingsEmbedded sharedInstance](VCHardwareSettingsEmbedded, "sharedInstance"), "maxFpsCameraCaptureDuringSharing"));
}

+ (BOOL)disableViewPointCorrectionForSharing
{
  return 1;
}

- (BOOL)isVideoRenderingSupported
{
  return (+[VCHardwareSettings deviceClass](VCHardwareSettings, "deviceClass") & 0xFFFFFFFFFFFFFFFELL) != 6;
}

+ (BOOL)shouldOverrideGPUMuxing
{
  return 0;
}

+ (unsigned)screenWidth
{
  return -[VCHardwareSettingsEmbedded screenWidth](+[VCHardwareSettingsEmbedded sharedInstance](VCHardwareSettingsEmbedded, "sharedInstance"), "screenWidth");
}

+ (unsigned)screenHeight
{
  return -[VCHardwareSettingsEmbedded screenHeight](+[VCHardwareSettingsEmbedded sharedInstance](VCHardwareSettingsEmbedded, "sharedInstance"), "screenHeight");
}

+ (unsigned)screenWidthForDisplayID:(unsigned int)a3
{
  return -[VCHardwareSettingsEmbedded screenWidthForDisplayID:](+[VCHardwareSettingsEmbedded sharedInstance](VCHardwareSettingsEmbedded, "sharedInstance"), "screenWidthForDisplayID:", *(_QWORD *)&a3);
}

+ (unsigned)screenHeightForDisplayID:(unsigned int)a3
{
  return -[VCHardwareSettingsEmbedded screenHeightForDisplayID:](+[VCHardwareSettingsEmbedded sharedInstance](VCHardwareSettingsEmbedded, "sharedInstance"), "screenHeightForDisplayID:", *(_QWORD *)&a3);
}

+ (BOOL)supportsFilteredScreenCapture
{
  return 0;
}

+ (unint64_t)maxScreenEncodingSizeSupported
{
  return -[VCHardwareSettingsEmbedded maxScreenEncodingSizeSupported](+[VCHardwareSettingsEmbedded sharedInstance](VCHardwareSettingsEmbedded, "sharedInstance"), "maxScreenEncodingSizeSupported");
}

+ (BOOL)allowScreenShareResolutionModuloAdjustment
{
  return -[VCHardwareSettingsEmbedded allowScreenShareResolutionModuloAdjustment](+[VCHardwareSettingsEmbedded sharedInstance](VCHardwareSettingsEmbedded, "sharedInstance"), "allowScreenShareResolutionModuloAdjustment");
}

+ (unsigned)maxFrameRateSupportedScreenShare
{
  return -[VCHardwareSettingsEmbedded maxFrameRateSupportedScreenShare](+[VCHardwareSettingsEmbedded sharedInstance](VCHardwareSettingsEmbedded, "sharedInstance"), "maxFrameRateSupportedScreenShare");
}

+ (BOOL)shouldEnforceScreenFrameRateLimit
{
  return -[VCHardwareSettingsEmbedded shouldEnforceScreenFrameRateLimit](+[VCHardwareSettingsEmbedded sharedInstance](VCHardwareSettingsEmbedded, "sharedInstance"), "shouldEnforceScreenFrameRateLimit");
}

+ (unsigned)maxActiveScreenEncoders
{
  return -[VCHardwareSettingsEmbedded maxActiveScreenEncoders](+[VCHardwareSettingsEmbedded sharedInstance](VCHardwareSettingsEmbedded, "sharedInstance"), "maxActiveScreenEncoders");
}

+ (unsigned)maxFrameRateSupportedBackgroundBlur
{
  return -[VCHardwareSettingsEmbedded maxFrameRateSupportedBackgroundBlur](+[VCHardwareSettingsEmbedded sharedInstance](VCHardwareSettingsEmbedded, "sharedInstance"), "maxFrameRateSupportedBackgroundBlur");
}

+ (BOOL)isDisplayPortrait
{
  return -[VCHardwareSettingsEmbedded isDisplayPortrait](+[VCHardwareSettingsEmbedded sharedInstance](VCHardwareSettingsEmbedded, "sharedInstance"), "isDisplayPortrait");
}

+ (BOOL)isSpatialAudioSupported
{
  uint64_t v2;
  NSObject *v3;
  _BOOL4 v4;
  uint64_t v5;
  NSObject *v6;
  uint64_t v7;
  NSObject *v8;
  int v10;
  uint64_t v11;
  __int16 v12;
  const char *v13;
  __int16 v14;
  int v15;
  __int16 v16;
  _BOOL4 v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  if (VCDefaults_GetBoolValueForKey(CFSTR("enableSpatialAudio"), 0))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
    {
      v2 = VRTraceErrorLogLevelToCSTR();
      v3 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v10 = 136315650;
        v11 = v2;
        v12 = 2080;
        v13 = "+[VCHardwareSettings isSpatialAudioSupported]";
        v14 = 1024;
        v15 = 609;
        _os_log_impl(&dword_1D8A54000, v3, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Spatial audio feature force enabled", (uint8_t *)&v10, 0x1Cu);
      }
    }
    LOBYTE(v4) = 1;
  }
  else
  {
    if ((_os_feature_enabled_impl() & 1) == 0)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        v5 = VRTraceErrorLogLevelToCSTR();
        v6 = *MEMORY[0x1E0CF2758];
        LOBYTE(v4) = 0;
        if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
          return v4;
        v10 = 136315650;
        v11 = v5;
        v12 = 2080;
        v13 = "+[VCHardwareSettings isSpatialAudioSupported]";
        v14 = 1024;
        v15 = 613;
        _os_log_impl(&dword_1D8A54000, v6, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Spatial audio feature disabled", (uint8_t *)&v10, 0x1Cu);
      }
      LOBYTE(v4) = 0;
      return v4;
    }
    v4 = +[VCHardwareSettings deviceClass](VCHardwareSettings, "deviceClass") == 8
      || -[VCHardwareSettingsEmbedded isSpatialAudioSupported](+[VCHardwareSettingsEmbedded sharedInstance](VCHardwareSettingsEmbedded, "sharedInstance"), "isSpatialAudioSupported");
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v7 = VRTraceErrorLogLevelToCSTR();
      v8 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v10 = 136315906;
        v11 = v7;
        v12 = 2080;
        v13 = "+[VCHardwareSettings isSpatialAudioSupported]";
        v14 = 1024;
        v15 = 628;
        v16 = 1024;
        v17 = v4;
        _os_log_impl(&dword_1D8A54000, v8, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Spatial audio feature enabled. deviceSupportsSpatialAudio=%d", (uint8_t *)&v10, 0x22u);
      }
    }
  }
  return v4;
}

+ (BOOL)isCaptionsSupported
{
  return -[VCHardwareSettingsEmbedded isCaptionsSupported](+[VCHardwareSettingsEmbedded sharedInstance](VCHardwareSettingsEmbedded, "sharedInstance"), "isCaptionsSupported");
}

+ (BOOL)isVoiceProcessingAt24KSupported
{
  return -[VCHardwareSettingsEmbedded isVoiceProcessingAt24KSupported](+[VCHardwareSettingsEmbedded sharedInstance](VCHardwareSettingsEmbedded, "sharedInstance"), "isVoiceProcessingAt24KSupported");
}

+ (BOOL)supportsHEIFEncoding
{
  return -[VCHardwareSettingsEmbedded supportsHEIFEncoding](+[VCHardwareSettingsEmbedded sharedInstance](VCHardwareSettingsEmbedded, "sharedInstance"), "supportsHEIFEncoding");
}

+ (BOOL)supportsHEVCEncoding
{
  return -[VCHardwareSettings vcpSupportsHEVCEncoder](+[VCHardwareSettingsEmbedded sharedInstance](VCHardwareSettingsEmbedded, "sharedInstance"), "vcpSupportsHEVCEncoder");
}

+ (BOOL)supportsHEVCDecoding
{
  return -[VCHardwareSettings supportHEVC](+[VCHardwareSettingsEmbedded sharedInstance](VCHardwareSettingsEmbedded, "sharedInstance"), "supportHEVC");
}

+ (BOOL)supportsMultiway1080pStream
{
  return -[VCHardwareSettingsEmbedded supportsMultiway1080pStream](+[VCHardwareSettingsEmbedded sharedInstance](VCHardwareSettingsEmbedded, "sharedInstance"), "supportsMultiway1080pStream");
}

+ (BOOL)supportsDecodingSquareCameraVideo
{
  return +[VCDefaults BOOLeanValueForKey:defaultValue:](VCDefaults, "BOOLeanValueForKey:defaultValue:", CFSTR("preferDecodingSquareCameraVideo"), -[VCHardwareSettingsEmbedded supportsDecodingSquareCameraVideo](+[VCHardwareSettingsEmbedded sharedInstance](VCHardwareSettingsEmbedded, "sharedInstance"), "supportsDecodingSquareCameraVideo"));
}

+ (unsigned)maxOneToOneFramerateSupported
{
  return -[VCHardwareSettingsEmbedded maxOneToOneFramerateSupported](+[VCHardwareSettingsEmbedded sharedInstance](VCHardwareSettingsEmbedded, "sharedInstance"), "maxOneToOneFramerateSupported");
}

+ (unsigned)maxMultiwayFramerateSupported
{
  return -[VCHardwareSettingsEmbedded maxMultiwayFramerateSupported](+[VCHardwareSettingsEmbedded sharedInstance](VCHardwareSettingsEmbedded, "sharedInstance"), "maxMultiwayFramerateSupported");
}

+ (id)supportedVideoPayloads
{
  return -[VCHardwareSettingsEmbedded supportedVideoPayloads](+[VCHardwareSettingsEmbedded sharedInstance](VCHardwareSettingsEmbedded, "sharedInstance"), "supportedVideoPayloads");
}

+ (BOOL)limitCameraDownlinkBitrateDuringSharing
{
  return -[VCHardwareSettingsEmbedded limitCameraDownlinkBitrateDuringSharing](+[VCHardwareSettingsEmbedded sharedInstance](VCHardwareSettingsEmbedded, "sharedInstance"), "limitCameraDownlinkBitrateDuringSharing");
}

+ (BOOL)supportsScreenCapture
{
  return -[VCHardwareSettingsEmbedded supportsScreenCapture](+[VCHardwareSettingsEmbedded sharedInstance](VCHardwareSettingsEmbedded, "sharedInstance"), "supportsScreenCapture");
}

+ (BOOL)supportsSystemAudioTap
{
  return -[VCHardwareSettingsEmbedded supportsSystemAudioTap](+[VCHardwareSettingsEmbedded sharedInstance](VCHardwareSettingsEmbedded, "sharedInstance"), "supportsSystemAudioTap");
}

+ (BOOL)supportsDedicatedSystemAudioStream
{
  return -[VCHardwareSettingsEmbedded supportsDedicatedSystemAudioStream](+[VCHardwareSettingsEmbedded sharedInstance](VCHardwareSettingsEmbedded, "sharedInstance"), "supportsDedicatedSystemAudioStream");
}

+ (BOOL)disableMLScalarDuringSharing
{
  return -[VCHardwareSettingsEmbedded disableMLScalarDuringSharing](+[VCHardwareSettingsEmbedded sharedInstance](VCHardwareSettingsEmbedded, "sharedInstance"), "disableMLScalarDuringSharing");
}

+ (int64_t)screenShareCapabilities
{
  if (VCDefaults_GetBoolValueForKey(CFSTR("kVCDefaultForceScreenCaptureCapabilitiesSendWithCamera"), 0))
    return 2;
  else
    return -[VCHardwareSettingsEmbedded screenShareCapabilities](+[VCHardwareSettingsEmbedded sharedInstance](VCHardwareSettingsEmbedded, "sharedInstance"), "screenShareCapabilities");
}

+ (unsigned)maxActiveVideoEncoders
{
  return -[VCHardwareSettingsEmbedded maxActiveVideoEncoders](+[VCHardwareSettingsEmbedded sharedInstance](VCHardwareSettingsEmbedded, "sharedInstance"), "maxActiveVideoEncoders");
}

+ (unsigned)maxActiveVideoDecoders
{
  return -[VCHardwareSettingsEmbedded maxActiveVideoDecoders](+[VCHardwareSettingsEmbedded sharedInstance](VCHardwareSettingsEmbedded, "sharedInstance"), "maxActiveVideoDecoders");
}

+ (BOOL)isVideoRenderingSupported
{
  return -[VCHardwareSettings isVideoRenderingSupported](+[VCHardwareSettingsEmbedded sharedInstance](VCHardwareSettingsEmbedded, "sharedInstance"), "isVideoRenderingSupported");
}

+ (BOOL)preferPresentationTimestamp
{
  return 0;
}

+ (unsigned)maxVCPSupportedTemporalLayers
{
  return 4;
}

+ (BOOL)isSiriVoiceTapSupported
{
  uint64_t v3;
  NSObject *v4;
  int v5;
  uint64_t v6;
  __int16 v7;
  const char *v8;
  __int16 v9;
  int v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  if ((_os_feature_enabled_impl() & 1) != 0)
    return -[VCHardwareSettings isSiriVoiceTapSupported](+[VCHardwareSettingsEmbedded sharedInstance](VCHardwareSettingsEmbedded, "sharedInstance"), "isSiriVoiceTapSupported");
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v3 = VRTraceErrorLogLevelToCSTR();
    v4 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v5 = 136315650;
      v6 = v3;
      v7 = 2080;
      v8 = "+[VCHardwareSettings isSiriVoiceTapSupported]";
      v9 = 1024;
      v10 = 858;
      _os_log_impl(&dword_1D8A54000, v4, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Siri audio feature disabled", (uint8_t *)&v5, 0x1Cu);
    }
  }
  return 0;
}

+ (BOOL)isSiriVoicePlayoutSupported
{
  uint64_t v3;
  NSObject *v4;
  int v5;
  uint64_t v6;
  __int16 v7;
  const char *v8;
  __int16 v9;
  int v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  if ((_os_feature_enabled_impl() & 1) != 0)
    return -[VCHardwareSettings isSiriVoicePlayoutSupported](+[VCHardwareSettingsEmbedded sharedInstance](VCHardwareSettingsEmbedded, "sharedInstance"), "isSiriVoicePlayoutSupported");
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v3 = VRTraceErrorLogLevelToCSTR();
    v4 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v5 = 136315650;
      v6 = v3;
      v7 = 2080;
      v8 = "+[VCHardwareSettings isSiriVoicePlayoutSupported]";
      v9 = 1024;
      v10 = 872;
      _os_log_impl(&dword_1D8A54000, v4, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Siri audio feature disabled", (uint8_t *)&v5, 0x1Cu);
    }
  }
  return 0;
}

+ (BOOL)isExternalCameraSupported
{
  return -[VCHardwareSettingsEmbedded isExternalCameraSupported](+[VCHardwareSettingsEmbedded sharedInstance](VCHardwareSettingsEmbedded, "sharedInstance"), "isExternalCameraSupported");
}

+ (BOOL)captureFormatPrefer16by9ForSquare
{
  return VCDefaults_GetBoolValueForKey(CFSTR("AVCapturePrefer16By9ForSquare"), 0)
      || -[VCHardwareSettingsEmbedded captureFormatPrefer16by9ForSquare](+[VCHardwareSettingsEmbedded sharedInstance](VCHardwareSettingsEmbedded, "sharedInstance"), "captureFormatPrefer16by9ForSquare");
}

void __VCHardwareSettings_FrontCameraOffsetFromDisplayCenter_block_invoke()
{
  const __CFArray *v0;
  const __CFArray *v1;
  CFTypeID v2;
  double v3;
  float v4;
  float v5;

  v0 = (const __CFArray *)MGCopyAnswer();
  if (v0)
  {
    v1 = v0;
    v2 = CFGetTypeID(v0);
    if (v2 == CFArrayGetTypeID() && CFArrayGetCount(v1) >= 2)
    {
      objc_msgSend((id)CFArrayGetValueAtIndex(v1, 0), "floatValue");
      *(double *)&VCHardwareSettings_FrontCameraOffsetFromDisplayCenter_offset_0 = (float)(v4 / -1000.0);
      objc_msgSend((id)CFArrayGetValueAtIndex(v1, 1), "floatValue");
      v3 = (float)(v5 / 1000.0);
    }
    else
    {
      VCHardwareSettings_FrontCameraOffsetFromDisplayCenter_offset_0 = 0xBFB19CCFC02D6854;
      v3 = 0.00722700031;
    }
    VCHardwareSettings_FrontCameraOffsetFromDisplayCenter_offset_1 = *(_QWORD *)&v3;
    CFRelease(v1);
  }
  else
  {
    VCHardwareSettings_FrontCameraOffsetFromDisplayCenter_offset_0 = 0xBFB19CCFC02D6854;
    VCHardwareSettings_FrontCameraOffsetFromDisplayCenter_offset_1 = 0x3F7D9A0F1FAC9276;
  }
}

- (BOOL)isSiriVoiceTapSupported
{
  return self->_isSiriVoiceTapSupported;
}

- (BOOL)isSiriVoicePlayoutSupported
{
  return self->_isSiriVoicePlayoutSupported;
}

+ (BOOL)isCellularTappingSupported
{
  return -[VCHardwareSettingsEmbedded isCellularTappingSupported](+[VCHardwareSettingsEmbedded sharedInstance](VCHardwareSettingsEmbedded, "sharedInstance"), "isCellularTappingSupported");
}

+ (BOOL)supportsMultiway720pStream
{
  return -[VCHardwareSettingsEmbedded supportsMultiway720pStream](+[VCHardwareSettingsEmbedded sharedInstance](VCHardwareSettingsEmbedded, "sharedInstance"), "supportsMultiway720pStream");
}

+ (BOOL)isRemoteCameraSenderSupported
{
  return -[VCHardwareSettingsEmbedded isRemoteCameraSenderSupported](+[VCHardwareSettingsEmbedded sharedInstance](VCHardwareSettingsEmbedded, "sharedInstance"), "isRemoteCameraSenderSupported");
}

+ (BOOL)isMediaRecordingSupported
{
  return -[VCHardwareSettingsEmbedded isMediaRecordingSupported](+[VCHardwareSettingsEmbedded sharedInstance](VCHardwareSettingsEmbedded, "sharedInstance"), "isMediaRecordingSupported");
}

+ (BOOL)isAppleSilicon
{
  return 1;
}

+ (BOOL)supportsCompressedPixelFormat
{
  return -[VCHardwareSettingsEmbedded supportsCompressedPixelFormat](+[VCHardwareSettingsEmbedded sharedInstance](VCHardwareSettingsEmbedded, "sharedInstance"), "supportsCompressedPixelFormat");
}

+ (BOOL)isDeviceLargeScreen
{
  return -[VCHardwareSettingsEmbedded isDeviceLargeScreen](+[VCHardwareSettingsEmbedded sharedInstance](VCHardwareSettingsEmbedded, "sharedInstance"), "isDeviceLargeScreen");
}

+ (BOOL)isMLEnhanceOneToOneSupported
{
  return -[VCHardwareSettingsEmbedded isMLEnhanceOneToOneSupported](+[VCHardwareSettingsEmbedded sharedInstance](VCHardwareSettingsEmbedded, "sharedInstance"), "isMLEnhanceOneToOneSupported");
}

+ (unsigned)maxHighTierMLEnhanceParticipants
{
  return VCDefaults_GetIntValueForKey(CFSTR("mlEnhanceNumberMLEnhancedParticipants"), -[VCHardwareSettingsEmbedded maxHighTierMLEnhanceParticipants](+[VCHardwareSettingsEmbedded sharedInstance](VCHardwareSettingsEmbedded, "sharedInstance"), "maxHighTierMLEnhanceParticipants"));
}

+ (BOOL)supportsOutOfProcessVideoDecoding
{
  return -[VCHardwareSettingsEmbedded supportsOutOfProcessVideoDecoding](+[VCHardwareSettingsEmbedded sharedInstance](VCHardwareSettingsEmbedded, "sharedInstance"), "supportsOutOfProcessVideoDecoding");
}

+ (BOOL)supportsOutOfProcessAudioDecoding
{
  return -[VCHardwareSettingsEmbedded supportsOutOfProcessAudioDecoding](+[VCHardwareSettingsEmbedded sharedInstance](VCHardwareSettingsEmbedded, "sharedInstance"), "supportsOutOfProcessAudioDecoding");
}

+ (BOOL)isDataCollectionSupported
{
  int64_t v2;

  v2 = +[VCHardwareSettings deviceClass](VCHardwareSettings, "deviceClass");
  return ((unint64_t)(v2 + 1) > 7) | (0x36u >> (v2 + 1)) & 1;
}

+ (BOOL)supportsPSVoiceOnAP
{
  return -[VCHardwareSettingsEmbedded supportsPSVoiceOnAP](+[VCHardwareSettingsEmbedded sharedInstance](VCHardwareSettingsEmbedded, "sharedInstance"), "supportsPSVoiceOnAP");
}

+ (BOOL)supportsOptimizedHandoversForTelephony
{
  return -[VCHardwareSettingsEmbedded supportsOptimizedHandoversForTelephony](+[VCHardwareSettingsEmbedded sharedInstance](VCHardwareSettingsEmbedded, "sharedInstance"), "supportsOptimizedHandoversForTelephony");
}

+ (BOOL)supportsVideoPriority
{
  int64_t v2;

  v2 = +[VCHardwareSettings deviceClass](VCHardwareSettings, "deviceClass");
  return ((unint64_t)(v2 + 1) > 9) | (0x36u >> (v2 + 1)) & 1;
}

- (NSMutableDictionary)hardwareUsageModeSettings
{
  return self->_hardwareUsageModeSettings;
}

- (void)setHardwareUsageModeSettings:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 16);
}

- (NSSet)pixelFormatCollections
{
  return &self->_pixelFormatCollections->super;
}

- (BOOL)isMLEnhanceOneToOneSupported
{
  return self->_isMLEnhanceOneToOneSupported;
}

+ (void)virtualHardwareSettings:.cold.1()
{
  uint64_t v0;
  os_log_t v1;
  uint8_t v2[24];
  int v3;
  __int16 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4_0();
  v3 = 257;
  v4 = 2112;
  v5 = v0;
  _os_log_error_impl(&dword_1D8A54000, v1, OS_LOG_TYPE_ERROR, " [%s] %s:%d Invalid platform for device=%@", v2, 0x26u);
  OUTLINED_FUNCTION_3();
}

- (void)init
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d VCHardwareSettings: Failed to allocate store hardware settings for all VCP usage modes", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)featureListStringForPayload:hardwareSettingsMode:version:.cold.1()
{
  uint64_t v0;
  os_log_t v1;
  const char *v2;
  const char *v3;
  int v4;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_5(&dword_1D8A54000, v0, v1, " [%s] %s:%d Unexpected payload=%u", v2, v3, v4, 317);
  OUTLINED_FUNCTION_3();
}

- (void)storeHardwareSettingsForAllOperatingModes
{
  uint64_t v0;
  os_log_t v1;
  const char *v2;
  const char *v3;
  int v4;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_5(&dword_1D8A54000, v0, v1, " [%s] %s:%d VCHardwareSettings: Failed to allocate array for hardware settings, hardwareSettingsMode=%hhu", v2, v3, v4, 398);
  OUTLINED_FUNCTION_3();
}

@end
