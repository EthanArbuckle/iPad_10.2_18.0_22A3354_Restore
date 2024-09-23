@implementation VCHardwareSettingsEmbedded

- (double)previewPreferredAspectRatio
{
  int deviceClass;
  BOOL v3;
  double result;

  deviceClass = self->_deviceClass;
  v3 = deviceClass == 8 || deviceClass == 3;
  result = 1.77777778;
  if (v3)
    return 1.33333333;
  return result;
}

- (BOOL)isViewPointCorrectionSupported
{
  _QWORD v3[6];

  v3[5] = *MEMORY[0x1E0C80C00];
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __60__VCHardwareSettingsEmbedded_isViewPointCorrectionSupported__block_invoke;
  v3[3] = &unk_1E9E521C0;
  v3[4] = self;
  if (isViewPointCorrectionSupported_onceToken != -1)
    dispatch_once(&isViewPointCorrectionSupported_onceToken, v3);
  return isViewPointCorrectionSupported_result;
}

- (BOOL)hasAppleNeuralEngine
{
  _QWORD v4[6];

  v4[5] = *MEMORY[0x1E0C80C00];
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __50__VCHardwareSettingsEmbedded_hasAppleNeuralEngine__block_invoke;
  v4[3] = &unk_1E9E521C0;
  v4[4] = self;
  if (hasAppleNeuralEngine_onceToken != -1)
    dispatch_once(&hasAppleNeuralEngine_onceToken, v4);
  return self->_hasAppleNeuralEngine;
}

+ (int64_t)deviceClass
{
  int IntValueForKey;
  int64_t v3;
  uint64_t v4;
  NSObject *v5;
  unsigned int v6;
  int v8;
  uint64_t v9;
  __int16 v10;
  const char *v11;
  __int16 v12;
  int v13;
  __int16 v14;
  uint64_t v15;
  __int16 v16;
  const __CFString *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  IntValueForKey = VCDefaults_GetIntValueForKey(CFSTR("forceDeviceClass"), 0xFFFFFFFFLL);
  if (IntValueForKey == -1)
  {
    v6 = MGGetSInt32Answer() - 1;
    if (v6 > 0xA)
      return -1;
    else
      return qword_1D910E8B8[v6];
  }
  else
  {
    v3 = IntValueForKey;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      v4 = VRTraceErrorLogLevelToCSTR();
      v5 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v8 = 136316162;
        v9 = v4;
        v10 = 2080;
        v11 = "+[VCHardwareSettingsEmbedded deviceClass]";
        v12 = 1024;
        v13 = 652;
        v14 = 2112;
        v15 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v3);
        v16 = 2112;
        v17 = CFSTR("forceDeviceClass");
        _os_log_impl(&dword_1D8A54000, v5, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Forcing device class to %@ as specified by the '%@' preference", (uint8_t *)&v8, 0x30u);
      }
    }
  }
  return v3;
}

+ (id)sharedInstance
{
  void *v3;
  NSString *v4;
  void *v5;

  v3 = (void *)objc_opt_class();
  objc_sync_enter(v3);
  if (VRTraceIsInternalOSInstalled()
    && (v4 = -[VCDefaults virtualHardware](+[VCDefaults sharedInstance](VCDefaults, "sharedInstance"), "virtualHardware")) != 0)
  {
    v5 = (void *)objc_msgSend(a1, "virtualHardwareSettings:", v4);
    objc_sync_exit(v3);
  }
  else
  {
    if (!sharedInstance__hardwareSettings_0)
      sharedInstance__hardwareSettings_0 = objc_alloc_init(VCHardwareSettingsEmbedded);
    objc_sync_exit(v3);
    return (id)sharedInstance__hardwareSettings_0;
  }
  return v5;
}

- (BOOL)isCaptureSIFRPreferred
{
  int v3;
  int v5;
  int64_t v6;
  int v7;
  BOOL v9;
  uint64_t v10;
  NSObject *v11;
  int v12;
  uint64_t v13;
  __int16 v14;
  const char *v15;
  __int16 v16;
  int v17;
  __int16 v18;
  int v19;
  __int16 v20;
  int v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v3 = _os_feature_enabled_impl();
  if (self->_deviceClass == 4)
    return 0;
  v5 = v3;
  v6 = -[VCHardwareSettingsEmbedded chipId](+[VCHardwareSettingsEmbedded sharedInstance](VCHardwareSettingsEmbedded, "sharedInstance"), "chipId");
  v7 = 0;
  if ((unint64_t)(v6 - 0x8000) > 0x27 || ((1 << v6) & 0x810023000BLL) == 0)
  {
    v9 = (unint64_t)(v6 - 35152) > 0x10 || ((1 << (v6 - 80)) & 0x10021) == 0;
    if (v9 && (unint64_t)(v6 - 28672) >= 2)
      v7 = 1;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v10 = VRTraceErrorLogLevelToCSTR();
    v11 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v12 = 136316162;
      v13 = v10;
      v14 = 2080;
      v15 = "-[VCHardwareSettingsEmbedded isCaptureSIFRPreferred]";
      v16 = 1024;
      v17 = 488;
      v18 = 1024;
      v19 = v5;
      v20 = 1024;
      v21 = v7;
      _os_log_impl(&dword_1D8A54000, v11, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d featureFlagEnabled = %d, hardwareSupport = %d", (uint8_t *)&v12, 0x28u);
    }
  }
  return v5 & v7;
}

- (int64_t)chipId
{
  int64_t result;

  result = self->_chipId;
  if (!result)
  {
    result = MGGetSInt64Answer();
    self->_chipId = result;
  }
  return result;
}

- (VCHardwareSettingsEmbedded)init
{
  VCHardwareSettingsEmbedded *v2;
  VCHardwareSettingsEmbedded *v3;
  int v4;
  uint64_t v5;
  NSObject *v6;
  objc_super v8;
  uint8_t buf[4];
  uint64_t v10;
  __int16 v11;
  const char *v12;
  __int16 v13;
  int v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v8.receiver = self;
  v8.super_class = (Class)VCHardwareSettingsEmbedded;
  v2 = -[VCHardwareSettings init](&v8, sel_init);
  v3 = v2;
  if (v2)
  {
    -[VCHardwareSettingsEmbedded addPixelFormat](v2, "addPixelFormat");
    -[VCHardwareSettingsEmbedded setupSiriSupport](v3, "setupSiriSupport");
    *(_QWORD *)&v3->_productType = MGGetProductType();
    v4 = +[VCHardwareSettingsEmbedded deviceClass](VCHardwareSettingsEmbedded, "deviceClass");
    v3->_deviceClass = v4;
    if (v4 == -1 && (int)VRTraceGetErrorLogLevelForModule() >= 5)
    {
      v5 = VRTraceErrorLogLevelToCSTR();
      v6 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315650;
        v10 = v5;
        v11 = 2080;
        v12 = "-[VCHardwareSettingsEmbedded init]";
        v13 = 1024;
        v14 = 118;
        _os_log_impl(&dword_1D8A54000, v6, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d _deviceClass is kVCDeviceClassTypeInvalid", buf, 0x1Cu);
      }
    }
  }
  return v3;
}

- (id)initForDevice:(id)a3
{
  VCHardwareSettingsEmbedded *v4;
  __int128 v5;
  uint64_t v6;
  int64_t v7;
  char v8;
  int v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = -[VCHardwareSettingsEmbedded init](self, "init");
  if (v4)
  {
    if (a3)
    {
      *(_QWORD *)&v5 = 0xAAAAAAAAAAAAAAAALL;
      *((_QWORD *)&v5 + 1) = 0xAAAAAAAAAAAAAAAALL;
      v12 = v5;
      v13 = v5;
      v11 = v5;
      if ((VCVirtualHardwareConfigurations_EmbeddedConfigurationForDevice(a3, &v11) & 1) != 0)
      {

        v6 = objc_msgSend((id)v11, "copy");
        v4->_deviceName = (NSString *)v6;
        if (v6)
        {
          *(_QWORD *)&v4->_screenWidth = *((_QWORD *)&v11 + 1);
          v7 = v13;
          v4->_chipId = v12;
          v4->_videoEncoderType = v7;
          if (BYTE10(v13))
            v8 = BYTE11(v13);
          else
            v8 = MGGetBoolAnswer();
          v4->_hasAppleNeuralEngine = v8;
          v4->_deviceClass = DWORD2(v12);
          v4->super._supportVCPEncoderInitialized = 1;
          v4->super._supportVCPEncoder = BYTE9(v13);
          v9 = BYTE8(v13);
          v4->super._supportHEVC = BYTE8(v13);
          if (v9)
            -[NSMutableSet addObject:](v4->super._pixelFormatCollections, "addObject:", &unk_1E9EF5708);
          -[NSMutableSet addObject:](v4->super._pixelFormatCollections, "addObject:", &unk_1E9EF5720);
          -[NSMutableSet addObject:](v4->super._pixelFormatCollections, "addObject:", &unk_1E9EF5738);
          v4->_isInitialized = 1;
        }
        else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          VRTraceErrorLogLevelToCSTR();
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
            -[VCHardwareSettingsEmbedded initForDevice:].cold.3();
        }
      }
      else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCHardwareSettingsEmbedded initForDevice:].cold.4();
      }
    }
    else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCHardwareSettingsEmbedded initForDevice:].cold.2();
    }
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      -[VCHardwareSettingsEmbedded initForDevice:].cold.1();
  }
  if (!v4->_isInitialized)
  {

    return 0;
  }
  return v4;
}

+ (id)virtualHardwareSettings:(id)a3
{
  id result;
  uint64_t v5;
  NSObject *v6;
  uint64_t v7;
  NSObject *v8;
  uint64_t v9;
  NSObject *v10;
  int v11;
  uint64_t v12;
  __int16 v13;
  const char *v14;
  __int16 v15;
  int v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  if (virtualHardwareSettings___virtualHardwareSettingsDeviceA_0)
  {
    if (objc_msgSend(a3, "isEqual:", objc_msgSend((id)virtualHardwareSettings___virtualHardwareSettingsDeviceA_0, "deviceName")))
    {
      return (id)virtualHardwareSettings___virtualHardwareSettingsDeviceA_0;
    }
    else if (virtualHardwareSettings___virtualHardwareSettingsDeviceB_0)
    {
      if (objc_msgSend(a3, "isEqual:", objc_msgSend((id)virtualHardwareSettings___virtualHardwareSettingsDeviceB_0, "deviceName")))
      {
        return (id)virtualHardwareSettings___virtualHardwareSettingsDeviceB_0;
      }
      else
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
        {
          v9 = VRTraceErrorLogLevelToCSTR();
          v10 = *MEMORY[0x1E0CF2758];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
          {
            v11 = 136315650;
            v12 = v9;
            v13 = 2080;
            v14 = "+[VCHardwareSettingsEmbedded virtualHardwareSettings:]";
            v15 = 1024;
            v16 = 196;
            _os_log_impl(&dword_1D8A54000, v10, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Clearing existing virtual hardware settings.", (uint8_t *)&v11, 0x1Cu);
          }
        }

        virtualHardwareSettings___virtualHardwareSettingsDeviceA_0 = 0;
        virtualHardwareSettings___virtualHardwareSettingsDeviceB_0 = 0;
        return +[VCHardwareSettingsEmbedded virtualHardwareSettings:](VCHardwareSettingsEmbedded, "virtualHardwareSettings:", a3);
      }
    }
    else
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        v7 = VRTraceErrorLogLevelToCSTR();
        v8 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        {
          v11 = 136315906;
          v12 = v7;
          v13 = 2080;
          v14 = "+[VCHardwareSettingsEmbedded virtualHardwareSettings:]";
          v15 = 1024;
          v16 = 186;
          v17 = 2112;
          v18 = a3;
          _os_log_impl(&dword_1D8A54000, v8, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Initializing new virtual hardware settings B for device=%@", (uint8_t *)&v11, 0x26u);
        }
      }
      result = -[VCHardwareSettingsEmbedded initForDevice:]([VCHardwareSettingsEmbedded alloc], "initForDevice:", a3);
      virtualHardwareSettings___virtualHardwareSettingsDeviceB_0 = (uint64_t)result;
    }
  }
  else
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v5 = VRTraceErrorLogLevelToCSTR();
      v6 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v11 = 136315906;
        v12 = v5;
        v13 = 2080;
        v14 = "+[VCHardwareSettingsEmbedded virtualHardwareSettings:]";
        v15 = 1024;
        v16 = 176;
        v17 = 2112;
        v18 = a3;
        _os_log_impl(&dword_1D8A54000, v6, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Initializing new virtual hardware settings A for device=%@", (uint8_t *)&v11, 0x26u);
      }
    }
    result = -[VCHardwareSettingsEmbedded initForDevice:]([VCHardwareSettingsEmbedded alloc], "initForDevice:", a3);
    virtualHardwareSettings___virtualHardwareSettingsDeviceA_0 = (uint64_t)result;
  }
  return result;
}

- (void)dealloc
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];

  v3.receiver = self;
  v3.super_class = (Class)VCHardwareSettingsEmbedded;
  -[VCHardwareSettings dealloc](&v3, sel_dealloc);
}

- (void)setupSiriSupport
{
  BOOL v3;

  v3 = +[VCHardwareSettings deviceClass](VCHardwareSettings, "deviceClass") == 8;
  self->super._isSiriVoicePlayoutSupported = v3;
  self->super._isSiriVoiceTapSupported = v3;
}

- (void)_initializeScreenDimension
{
  uint64_t v3;
  uint64_t v4;
  uint64_t IntValueForKey;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  uint64_t v13;
  int v14;
  int v15;
  uint64_t v16;
  NSObject *v17;
  int screenWidth;
  int screenHeight;
  int v20;
  uint64_t v21;
  __int16 v22;
  const char *v23;
  __int16 v24;
  int v25;
  __int16 v26;
  _BYTE v27[10];
  const __CFString *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  if (+[VCHardwareSettings deviceClass](VCHardwareSettings, "deviceClass") == 8)
  {
    if (VCDefaults_GetBoolValueForKey(CFSTR("enableHighScreenCaptureResolution"), 1))
      v3 = 1904;
    else
      v3 = 1080;
    v4 = 1920;
  }
  else
  {
    v3 = 0;
    v4 = 0;
  }
  IntValueForKey = VCDefaults_GetIntValueForKey(CFSTR("forceScreenDimensionWidth"), v4);
  if ((_DWORD)IntValueForKey)
  {
    v6 = IntValueForKey;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      v7 = VRTraceErrorLogLevelToCSTR();
      v8 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v20 = 136316162;
        v21 = v7;
        v22 = 2080;
        v23 = "-[VCHardwareSettingsEmbedded _initializeScreenDimension]";
        v24 = 1024;
        v25 = 254;
        v26 = 2112;
        *(_QWORD *)v27 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v6);
        *(_WORD *)&v27[8] = 2112;
        v28 = CFSTR("forceScreenDimensionWidth");
        _os_log_impl(&dword_1D8A54000, v8, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Forcing 'width' portion of screen dimensions to %@ as specified by the '%@' preference", (uint8_t *)&v20, 0x30u);
      }
    }
  }
  else
  {
    LODWORD(v6) = MGGetSInt32Answer();
  }
  v9 = VCDefaults_GetIntValueForKey(CFSTR("forceScreenDimensionHeight"), v3);
  if ((_DWORD)v9)
  {
    v10 = v9;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      v11 = VRTraceErrorLogLevelToCSTR();
      v12 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v13 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v10);
        v20 = 136316162;
        v21 = v11;
        v22 = 2080;
        v23 = "-[VCHardwareSettingsEmbedded _initializeScreenDimension]";
        v24 = 1024;
        v25 = 261;
        v26 = 2112;
        *(_QWORD *)v27 = v13;
        *(_WORD *)&v27[8] = 2112;
        v28 = CFSTR("forceScreenDimensionHeight");
        _os_log_impl(&dword_1D8A54000, v12, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Forcing 'height' portion of screen dimensions to %@ as specified by the '%@' preference", (uint8_t *)&v20, 0x30u);
      }
    }
  }
  else
  {
    LODWORD(v10) = MGGetSInt32Answer();
  }
  if (v6 <= v10)
    v14 = v10;
  else
    v14 = v6;
  if (v6 >= v10)
    v15 = v10;
  else
    v15 = v6;
  self->_screenWidth = v14;
  self->_screenHeight = v15;
  if ((int)VRTraceGetErrorLogLevelForModule() > 6)
  {
    v16 = VRTraceErrorLogLevelToCSTR();
    v17 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      screenWidth = self->_screenWidth;
      screenHeight = self->_screenHeight;
      v20 = 136316162;
      v21 = v16;
      v22 = 2080;
      v23 = "-[VCHardwareSettingsEmbedded _initializeScreenDimension]";
      v24 = 1024;
      v25 = 274;
      v26 = 1024;
      *(_DWORD *)v27 = screenWidth;
      *(_WORD *)&v27[4] = 1024;
      *(_DWORD *)&v27[6] = screenHeight;
      _os_log_impl(&dword_1D8A54000, v17, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d screenWidth=%d, screenHeight=%d", (uint8_t *)&v20, 0x28u);
    }
  }
}

- (NSString)deviceName
{
  uint64_t v3;
  NSObject *v4;
  NSString *deviceName;
  int v7;
  uint64_t v8;
  __int16 v9;
  const char *v10;
  __int16 v11;
  int v12;
  __int16 v13;
  NSString *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (!self->_deviceName)
  {
    self->_deviceName = (NSString *)MGCopyAnswer();
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v3 = VRTraceErrorLogLevelToCSTR();
      v4 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        deviceName = self->_deviceName;
        v7 = 136315906;
        v8 = v3;
        v9 = 2080;
        v10 = "-[VCHardwareSettingsEmbedded deviceName]";
        v11 = 1024;
        v12 = 280;
        v13 = 2112;
        v14 = deviceName;
        _os_log_impl(&dword_1D8A54000, v4, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d _deviceName=%@", (uint8_t *)&v7, 0x26u);
      }
    }
  }
  return self->_deviceName;
}

- (id)marketingName
{
  id result;

  result = self->_marketingName;
  if (!result)
  {
    result = (id)MGCopyAnswer();
    self->_marketingName = (NSString *)result;
  }
  return result;
}

- (BOOL)hasBaseband
{
  if (!self->_hasBasebandInitialized)
  {
    self->_hasBaseband = MGGetBoolAnswer();
    self->_hasBasebandInitialized = 1;
  }
  return self->_hasBaseband;
}

- (BOOL)isSpatialAudioSupportedIPhone
{
  uint64_t v2;
  BOOL result;

  v2 = -[VCHardwareSettingsEmbedded chipId](self, "chipId");
  result = 0;
  if (v2 > 33024)
  {
    if (v2 <= 35151 || v2 != 35152 && v2 != 35168)
      return 1;
  }
  else
  {
    if ((unint64_t)(v2 - 0x8000) <= 0x30)
    {
      if (((1 << v2) & 0x210009) != 0)
        return result;
      if (v2 == 32800 || v2 == 32816)
        return 1;
    }
    if (v2 != 28672)
      return 1;
  }
  return result;
}

- (BOOL)isSpatialAudioSupportedAppleTV
{
  uint64_t v2;
  BOOL v3;

  v2 = -[VCHardwareSettingsEmbedded chipId](self, "chipId");
  if (v2 > 32799)
    return 1;
  v3 = 0;
  if (v2 != 28672 && v2 != 32785)
    return 1;
  return v3;
}

- (BOOL)isHDRSupportedAppleTV
{
  -[VCHardwareSettingsEmbedded chipId](self, "chipId");
  return 1;
}

- (BOOL)isSpatialAudioSupportedIPad
{
  uint64_t v3;
  BOOL result;
  uint64_t v5;
  uint64_t v6;

  v3 = -[VCHardwareSettingsEmbedded chipId](self, "chipId");
  result = 0;
  if (v3 <= 32799)
  {
    if (v3 <= 32770)
    {
      if ((unint64_t)(v3 - 28672) >= 2 && (unint64_t)(v3 - 0x8000) >= 2)
        return 1;
      return result;
    }
    if (v3 == 32771)
      return result;
    if (v3 == 32784)
    {
      v6 = *(_QWORD *)&self->_productType;
      if (v6 == -1)
      {
        v6 = MGGetProductType();
        *(_QWORD *)&self->_productType = v6;
      }
      return v6 == 3645319985 || v6 == 228444038;
    }
    v5 = 32785;
    goto LABEL_16;
  }
  if (v3 <= 33026 || v3 <= 35156)
    return 1;
  if (v3 != 35157)
  {
    v5 = 35168;
LABEL_16:
    if (v3 != v5)
      return 1;
  }
  return result;
}

- (BOOL)supportsPSVoiceOnAP
{
  uint64_t v2;
  NSObject *v3;
  int v5;
  uint64_t v6;
  __int16 v7;
  const char *v8;
  __int16 v9;
  int v10;
  __int16 v11;
  int v12;
  __int16 v13;
  int v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (supportsPSVoiceOnAP_onceToken != -1)
    dispatch_once(&supportsPSVoiceOnAP_onceToken, &__block_literal_global_64);
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v2 = VRTraceErrorLogLevelToCSTR();
    v3 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v5 = 136316162;
      v6 = v2;
      v7 = 2080;
      v8 = "-[VCHardwareSettingsEmbedded supportsPSVoiceOnAP]";
      v9 = 1024;
      v10 = 410;
      v11 = 1024;
      v12 = 0;
      v13 = 1024;
      v14 = supportsPSVoiceOnAP_radioVendor;
      _os_log_impl(&dword_1D8A54000, v3, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d supportsPSVoiceOnAP=%d, radioVendor=%u", (uint8_t *)&v5, 0x28u);
    }
  }
  return 0;
}

uint64_t __49__VCHardwareSettingsEmbedded_supportsPSVoiceOnAP__block_invoke()
{
  uint64_t result;

  result = TelephonyRadiosGetRadioVendor();
  supportsPSVoiceOnAP_radioVendor = result;
  return result;
}

- (BOOL)supportsOptimizedHandoversForTelephony
{
  uint64_t v2;

  if (-[VCHardwareSettingsEmbedded supportsPSVoiceOnAP](self, "supportsPSVoiceOnAP")
    || VCCarrierBundle_GetPSVoiceOnAPEnabled())
  {
    v2 = VCFeatureFlagManager_UseOptimizedTelephonyHandovers();
  }
  else
  {
    v2 = 0;
  }
  return VCDefaults_GetBoolValueForKey(CFSTR("enableOptimizedTelephonyHandovers"), v2);
}

- (BOOL)isSpatialAudioSupportedIPod
{
  int64_t v2;

  v2 = -[VCHardwareSettingsEmbedded chipId](self, "chipId");
  return v2 != 28672 && v2 != 32784;
}

- (BOOL)isSpatialAudioSupported
{
  int64_t v3;
  BOOL result;

  v3 = +[VCHardwareSettingsEmbedded deviceClass](VCHardwareSettingsEmbedded, "deviceClass") - 1;
  result = 1;
  switch(v3)
  {
    case 0:
      result = -[VCHardwareSettingsEmbedded isSpatialAudioSupportedIPhone](self, "isSpatialAudioSupportedIPhone");
      break;
    case 1:
      result = -[VCHardwareSettingsEmbedded isSpatialAudioSupportedIPod](self, "isSpatialAudioSupportedIPod");
      break;
    case 2:
      result = -[VCHardwareSettingsEmbedded isSpatialAudioSupportedIPad](self, "isSpatialAudioSupportedIPad");
      break;
    case 7:
      return result;
    default:
      result = 0;
      break;
  }
  return result;
}

- (unsigned)screenWidth
{
  unsigned int result;

  result = self->_screenWidth;
  if (!result)
  {
    -[VCHardwareSettingsEmbedded _initializeScreenDimension](self, "_initializeScreenDimension");
    return self->_screenWidth;
  }
  return result;
}

- (unsigned)screenWidthForDisplayID:(unsigned int)a3
{
  unsigned int v4;
  void *v5;
  void *v6;

  v4 = -[VCHardwareSettingsEmbedded screenWidth](self, "screenWidth");
  if (!a3 && +[VCHardwareSettings deviceClass](VCHardwareSettings, "deviceClass") != 8)
  {
    v5 = (void *)objc_msgSend(MEMORY[0x1E0CD2728], "mainDisplay");
    if (v5)
    {
      v6 = v5;
      if (objc_msgSend((id)objc_msgSend(v5, "currentMode"), "width"))
        return objc_msgSend((id)objc_msgSend(v6, "currentMode"), "width");
    }
  }
  return v4;
}

- (unsigned)screenHeight
{
  unsigned int result;

  result = self->_screenHeight;
  if (!result)
  {
    -[VCHardwareSettingsEmbedded _initializeScreenDimension](self, "_initializeScreenDimension");
    return self->_screenHeight;
  }
  return result;
}

- (unsigned)screenHeightForDisplayID:(unsigned int)a3
{
  unsigned int v4;
  void *v5;
  void *v6;

  v4 = -[VCHardwareSettingsEmbedded screenHeight](self, "screenHeight");
  if (!a3 && +[VCHardwareSettings deviceClass](VCHardwareSettings, "deviceClass") != 8)
  {
    v5 = (void *)objc_msgSend(MEMORY[0x1E0CD2728], "mainDisplay");
    if (v5)
    {
      v6 = v5;
      if (objc_msgSend((id)objc_msgSend(v5, "currentMode"), "height"))
        return objc_msgSend((id)objc_msgSend(v6, "currentMode"), "height");
    }
  }
  return v4;
}

- (BOOL)isDisplayPortrait
{
  float v3;

  MGGetFloat32Answer();
  return v3 == 0.0 && ((self->_deviceClass - 4) & 0xFFFFFFFB) != 0;
}

- (unint64_t)maxScreenEncodingSizeSupported
{
  unint64_t v3;
  int64_t v4;

  v3 = 921600;
  if (+[VCHardwareSettingsEmbedded deviceClass](VCHardwareSettingsEmbedded, "deviceClass") == 8)
    return 5603328;
  v4 = -[VCHardwareSettingsEmbedded chipId](self, "chipId");
  if (((unint64_t)(v4 - 0x8000) > 0x20 || ((1 << v4) & 0x10023000BLL) == 0)
    && ((unint64_t)(v4 - 35152) > 0x10 || ((1 << (v4 - 80)) & 0x10021) == 0)
    && (unint64_t)(v4 - 28672) >= 2)
  {
    return 5603328;
  }
  return v3;
}

- (BOOL)allowScreenShareResolutionModuloAdjustment
{
  int64_t v3;
  BOOL v4;

  if (+[VCHardwareSettingsEmbedded deviceClass](VCHardwareSettingsEmbedded, "deviceClass") != 1)
    return 0;
  v3 = -[VCHardwareSettingsEmbedded chipId](self, "chipId");
  if ((unint64_t)(v3 - 0x8000) <= 0x20 && ((1 << v3) & 0x10023000BLL) != 0)
    return 0;
  if ((unint64_t)(v3 - 35152) > 0x10)
    return (unint64_t)(v3 - 28672) >= 2;
  v4 = 0;
  if (((1 << (v3 - 80)) & 0x10021) == 0)
    return (unint64_t)(v3 - 28672) >= 2;
  return v4;
}

- (unsigned)maxFrameRateSupportedScreenShare
{
  unsigned int result;
  int64_t v4;

  if (+[VCHardwareSettingsEmbedded deviceClass](VCHardwareSettingsEmbedded, "deviceClass") == 8)
    return 30;
  v4 = -[VCHardwareSettingsEmbedded chipId](self, "chipId");
  result = 30;
  if (((unint64_t)(v4 - 0x8000) > 0x20 || ((1 << v4) & 0x10023000BLL) == 0)
    && ((unint64_t)(v4 - 35152) > 0x10 || ((1 << (v4 - 80)) & 0x10021) == 0))
  {
    if ((unint64_t)(v4 - 28672) >= 2)
      return 60;
    else
      return 30;
  }
  return result;
}

- (BOOL)shouldEnforceScreenFrameRateLimit
{
  return 0;
}

- (unsigned)maxFrameRateSupportedBackgroundBlur
{
  uint64_t v3;
  unsigned int result;

  if (+[VCHardwareSettingsEmbedded deviceClass](VCHardwareSettingsEmbedded, "deviceClass") == 1)
  {
    v3 = -[VCHardwareSettingsEmbedded chipId](self, "chipId");
    result = 24;
    if (v3 > 35151)
    {
      if (v3 != 35152 && v3 != 35168)
        return 60;
    }
    else if (((unint64_t)(v3 - 0x8000) > 0x30 || ((1 << v3) & 0x1000100210009) == 0) && v3 != 28672)
    {
      return 60;
    }
  }
  else if (self->_deviceClass == 4)
  {
    return 24;
  }
  else
  {
    return 60;
  }
  return result;
}

- (int64_t)deviceClass
{
  int64_t v2;

  v2 = self;
  LODWORD(self) = *(_DWORD *)(self + 56);
  if (!(_DWORD)self)
  {
    LODWORD(self) = +[VCHardwareSettingsEmbedded deviceClass](VCHardwareSettingsEmbedded, "deviceClass");
    *(_DWORD *)(v2 + 56) = self;
  }
  return (int)self;
}

- (int64_t)videoEncoderType
{
  int64_t result;
  int64_t v4;

  if (+[VCHardwareSettingsEmbedded deviceClass](VCHardwareSettingsEmbedded, "deviceClass") == 8)
    return 2;
  result = self->_videoEncoderType;
  if (!result)
  {
    v4 = -[VCHardwareSettingsEmbedded chipId](self, "chipId");
    if ((unint64_t)(v4 - 35152) <= 0x10 && ((1 << (v4 - 80)) & 0x10021) != 0)
      result = 1;
    else
      result = 2;
    self->_videoEncoderType = result;
  }
  return result;
}

- (BOOL)useSoftFramerateSwitching
{
  return 0;
}

- (BOOL)supportsMultiway720pStream
{
  BOOL v3;
  int64_t v4;

  if (+[VCHardwareSettingsEmbedded deviceClass](VCHardwareSettingsEmbedded, "deviceClass") == 8)
    return 1;
  if (!VCDefaults_GetBoolValueForKey(CFSTR("supportsMultiway720pStream"), 1))
    return 0;
  v4 = -[VCHardwareSettingsEmbedded chipId](self, "chipId");
  if ((unint64_t)(v4 - 0x8000) <= 0x11 && ((1 << v4) & 0x3000B) != 0)
    return 0;
  if ((unint64_t)(v4 - 35152) > 0x10)
    return (unint64_t)(v4 - 28672) >= 2;
  v3 = 0;
  if (((1 << (v4 - 80)) & 0x10021) == 0)
    return (unint64_t)(v4 - 28672) >= 2;
  return v3;
}

- (BOOL)supportsMultiway1080pStreamATV
{
  int64_t v2;

  v2 = -[VCHardwareSettingsEmbedded chipId](self, "chipId");
  return v2 != 28672 && v2 != 32785;
}

- (BOOL)supportsMultiway1080pStreamEmbeddedOS
{
  uint64_t v2;
  BOOL result;

  v2 = -[VCHardwareSettingsEmbedded chipId](self, "chipId");
  result = 0;
  if (v2 > 33024)
  {
    if (((unint64_t)(v2 - 35152) > 0x10 || ((1 << (v2 - 80)) & 0x10021) == 0)
      && v2 != 33025
      && v2 != 33027)
    {
      return 1;
    }
  }
  else if (((unint64_t)(v2 - 0x8000) > 0x30 || ((1 << v2) & 0x100810023000BLL) == 0)
         && (unint64_t)(v2 - 28672) >= 2)
  {
    return 1;
  }
  return result;
}

- (BOOL)deviceSupportsMultiway1080p
{
  unint64_t v3;

  v3 = +[VCHardwareSettingsEmbedded deviceClass](VCHardwareSettingsEmbedded, "deviceClass");
  if (v3 > 7)
    return 0;
  if (((1 << v3) & 0xCE) != 0)
    return -[VCHardwareSettingsEmbedded supportsMultiway1080pStreamEmbeddedOS](self, "supportsMultiway1080pStreamEmbeddedOS");
  return v3 == 4 && -[VCHardwareSettingsEmbedded supportsMultiway1080pStreamATV](self, "supportsMultiway1080pStreamATV");
}

- (BOOL)supportsMultiway1080pStream
{
  return VCDefaults_GetBoolValueForKey(CFSTR("supportsMultiway1080pStream"), -[VCHardwareSettingsEmbedded deviceSupportsMultiway1080p](self, "deviceSupportsMultiway1080p"));
}

- (BOOL)supportsDecodingSquareCameraVideo
{
  return 0;
}

- (unsigned)maxOneToOneFramerateSupported
{
  int64_t v2;

  v2 = +[VCHardwareSettingsEmbedded deviceClass](VCHardwareSettingsEmbedded, "deviceClass");
  if ((unint64_t)(v2 - 3) > 5)
    return 30;
  else
    return dword_1D910E910[v2 - 3];
}

- (unsigned)maxMultiwayFramerateSupported
{
  unsigned int result;
  uint64_t v4;

  if (+[VCHardwareSettingsEmbedded deviceClass](VCHardwareSettingsEmbedded, "deviceClass") == 8)
    return 30;
  result = VCDefaults_GetIntValueForKey(CFSTR("MaxMultiwayFramerate"), 0xFFFFFFFFLL);
  if (result == -1)
  {
    v4 = -[VCHardwareSettingsEmbedded chipId](self, "chipId");
    result = 15;
    if (v4 > 35156)
    {
      if (v4 != 35157 && v4 != 35168)
        return 30;
    }
    else if (((unint64_t)(v4 - 0x8000) > 0x10 || ((1 << v4) & 0x1000B) == 0)
           && (unint64_t)(v4 - 28672) >= 2)
    {
      return 30;
    }
  }
  return result;
}

- (unsigned)maxDisplayRefreshRate
{
  unsigned int v2;

  v2 = 60;
  if (+[VCHardwareSettingsEmbedded deviceClass](VCHardwareSettingsEmbedded, "deviceClass") != 8)
  {
    if (MGGetBoolAnswer())
      return 120;
    else
      return 60;
  }
  return v2;
}

- (unsigned)maxActiveVideoEncoders
{
  unsigned int result;
  uint64_t v4;
  uint64_t v5;

  if (+[VCHardwareSettingsEmbedded deviceClass](VCHardwareSettingsEmbedded, "deviceClass") == 8)
    return 6;
  result = -[VCDefaults maxActiveVideoEncoders](+[VCDefaults sharedInstance](VCDefaults, "sharedInstance"), "maxActiveVideoEncoders");
  if (result == -1)
  {
    v4 = -[VCHardwareSettingsEmbedded chipId](self, "chipId");
    v5 = v4;
    if (v4 <= 35156)
    {
      if ((unint64_t)(v4 - 0x8000) <= 0x11)
      {
        if (((1 << v4) & 0xB) != 0)
          return 3;
        if (((1 << v4) & 0x30000) != 0)
          return 5;
      }
      if ((unint64_t)(v4 - 28672) < 2)
        return 3;
      return 6;
    }
    result = 1;
    if (v5 != 35157 && v5 != 35168)
      return 6;
  }
  return result;
}

- (unsigned)maxActiveVideoDecoders
{
  unsigned int v3;
  uint64_t v5;
  unsigned int v6;
  unsigned int v7;

  if (+[VCHardwareSettingsEmbedded deviceClass](VCHardwareSettingsEmbedded, "deviceClass") == 8)
    return 15;
  v3 = -[VCDefaults maxActiveVideoDecoders](+[VCDefaults sharedInstance](VCDefaults, "sharedInstance"), "maxActiveVideoDecoders");
  if (v3 != -1)
    return v3;
  v5 = -[VCHardwareSettingsEmbedded chipId](self, "chipId");
  if (v5 <= 32788)
  {
    if (v5 > 32770)
    {
      if ((unint64_t)(v5 - 32784) < 2)
        return 9;
      if (v5 != 32771)
        goto LABEL_25;
    }
    else if ((unint64_t)(v5 - 28672) >= 2 && (unint64_t)(v5 - 0x8000) >= 2)
    {
LABEL_25:
      v6 = 24;
      goto LABEL_26;
    }
    return 4;
  }
  if (v5 <= 32815)
  {
    if (v5 == 32789)
    {
      v7 = 10;
      v6 = 10;
      goto LABEL_27;
    }
    if (v5 != 32800 && v5 != 32807)
      goto LABEL_25;
    v6 = 12;
LABEL_26:
    v7 = 11;
LABEL_27:
    if (+[VCHardwareSettingsEmbedded deviceClass](VCHardwareSettingsEmbedded, "deviceClass") == 3)
      return v6;
    else
      return v7;
  }
  if (v5 == 32816)
  {
    v6 = 16;
    goto LABEL_26;
  }
  v3 = 1;
  if (v5 != 35157 && v5 != 35168)
    goto LABEL_25;
  return v3;
}

- (unsigned)maxActiveScreenEncoders
{
  unsigned int result;
  uint64_t v4;

  if (+[VCHardwareSettingsEmbedded deviceClass](VCHardwareSettingsEmbedded, "deviceClass") == 8)
    return 1;
  v4 = -[VCHardwareSettingsEmbedded chipId](self, "chipId");
  result = 1;
  if (v4 > 35156)
  {
    if (v4 != 35157 && v4 != 35168)
      return 2;
  }
  else if (((unint64_t)(v4 - 0x8000) > 0x20 || ((1 << v4) & 0x10023000BLL) == 0)
         && (unint64_t)(v4 - 28672) >= 2)
  {
    return 2;
  }
  return result;
}

- (BOOL)supportsCompressedPixelFormat
{
  uint64_t v2;
  BOOL result;
  unint64_t v4;

  v2 = -[VCHardwareSettingsEmbedded chipId](self, "chipId");
  result = 0;
  if (v2 > 33024)
  {
    if ((unint64_t)(v2 - 33025) > 0x11 || ((1 << (v2 - 1)) & 0x28005) == 0)
    {
      v4 = v2 - 35152;
      if (v4 > 0x10 || ((1 << v4) & 0x10021) == 0)
        return 1;
    }
  }
  else if (((unint64_t)(v2 - 0x8000) > 0x30 || ((1 << v2) & 0x100810023000BLL) == 0)
         && (unint64_t)(v2 - 28672) >= 2)
  {
    return 1;
  }
  return result;
}

- (BOOL)isDeviceLargeScreen
{
  unint64_t v2;

  v2 = -[VCHardwareSettingsEmbedded deviceClass](self, "deviceClass");
  return (v2 < 9) & (0x118u >> v2);
}

uint64_t __50__VCHardwareSettingsEmbedded_hasAppleNeuralEngine__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = MGGetBoolAnswer();
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 88) = result;
  return result;
}

- (BOOL)isCaptionsSupported
{
  int64_t v3;
  BOOL v4;

  if (!-[VCHardwareSettingsEmbedded hasAppleNeuralEngine](self, "hasAppleNeuralEngine"))
    return 0;
  if (+[VCHardwareSettingsEmbedded deviceClass](VCHardwareSettingsEmbedded, "deviceClass") != 1)
    return +[VCHardwareSettingsEmbedded deviceClass](VCHardwareSettingsEmbedded, "deviceClass") == 3
        || +[VCHardwareSettingsEmbedded deviceClass](VCHardwareSettingsEmbedded, "deviceClass") == 4
        || +[VCHardwareSettingsEmbedded deviceClass](VCHardwareSettingsEmbedded, "deviceClass") == 8;
  v3 = -[VCHardwareSettingsEmbedded chipId](self, "chipId");
  if ((unint64_t)(v3 - 0x8000) <= 0x15 && ((1 << v3) & 0x23000B) != 0)
    return 0;
  if ((unint64_t)(v3 - 35152) > 0x10)
    return (unint64_t)(v3 - 28672) >= 2;
  v4 = 0;
  if (((1 << (v3 - 80)) & 0x10021) == 0)
    return (unint64_t)(v3 - 28672) >= 2;
  return v4;
}

- (BOOL)isVoiceProcessingAt24KSupported
{
  uint64_t v3;
  BOOL result;

  if (+[VCHardwareSettingsEmbedded deviceClass](VCHardwareSettingsEmbedded, "deviceClass") != 1)
    return 0;
  v3 = -[VCHardwareSettingsEmbedded chipId](self, "chipId");
  result = 0;
  if (v3 > 33024)
  {
    if (v3 != 33025 && v3 != 35152 && v3 != 35168)
      return 1;
  }
  else if (((unint64_t)(v3 - 0x8000) > 0x30 || ((1 << v3) & 0x1000100210009) == 0) && v3 != 28672)
  {
    return 1;
  }
  return result;
}

- (BOOL)supportsHEIFEncoding
{
  BOOL v3;
  int64_t v4;

  if (+[VCHardwareSettingsEmbedded deviceClass](VCHardwareSettingsEmbedded, "deviceClass") == 8)
    return 1;
  v4 = -[VCHardwareSettingsEmbedded chipId](self, "chipId");
  if ((unint64_t)(v4 - 0x8000) <= 3 && v4 != 32770)
    return 0;
  if ((unint64_t)(v4 - 35152) > 0x10)
    return (unint64_t)(v4 - 28672) >= 2;
  v3 = 0;
  if (((1 << (v4 - 80)) & 0x10021) == 0)
    return (unint64_t)(v4 - 28672) >= 2;
  return v3;
}

- (unsigned)audioPacketLossConcealmentAlgorithmAACELD
{
  if (+[VCHardwareSettingsEmbedded deviceClass](VCHardwareSettingsEmbedded, "deviceClass") != 6)
    return 6;
  if (-[VCHardwareSettingsEmbedded chipId](self, "chipId") == 28674)
    return 3;
  return 4;
}

- (BOOL)isRemoteCameraSenderSupportediPad
{
  uint64_t v2;
  BOOL result;

  v2 = -[VCHardwareSettingsEmbedded chipId](self, "chipId");
  result = 0;
  if (v2 > 35156)
  {
    if (v2 != 35157 && v2 != 35168)
      return 1;
  }
  else if (((unint64_t)(v2 - 0x8000) > 3 || v2 == 32770) && (unint64_t)(v2 - 28672) >= 2)
  {
    return 1;
  }
  return result;
}

- (BOOL)isRemoteCameraSenderSupportediPhone
{
  uint64_t v3;
  BOOL v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  int v9;
  uint64_t v10;
  __int16 v11;
  const char *v12;
  __int16 v13;
  int v14;
  __int16 v15;
  int64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = -[VCHardwareSettingsEmbedded chipId](self, "chipId");
  if (v3 > 32815)
  {
    if (v3 == 32816 || v3 == 33040)
      return 1;
    v5 = 33025;
LABEL_8:
    if (v3 != v5 && (int)VRTraceGetErrorLogLevelForModule() >= 5)
    {
      v6 = VRTraceErrorLogLevelToCSTR();
      v7 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v9 = 136315906;
        v10 = v6;
        v11 = 2080;
        v12 = "-[VCHardwareSettingsEmbedded isRemoteCameraSenderSupportediPhone]";
        v13 = 1024;
        v14 = 1138;
        v15 = 2048;
        v16 = -[VCHardwareSettingsEmbedded chipId](self, "chipId");
        _os_log_impl(&dword_1D8A54000, v7, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Unknown chipID 0x%llx", (uint8_t *)&v9, 0x26u);
      }
    }
    return 1;
  }
  v4 = 0;
  if (v3 != 32784 && v3 != 32789)
  {
    v5 = 32800;
    goto LABEL_8;
  }
  return v4;
}

- (BOOL)isRemoteCameraSenderSupported
{
  int64_t v3;

  v3 = +[VCHardwareSettingsEmbedded deviceClass](VCHardwareSettingsEmbedded, "deviceClass");
  switch(v3)
  {
    case 4:
      return MGGetBoolAnswer();
    case 3:
      return -[VCHardwareSettingsEmbedded isRemoteCameraSenderSupportediPad](self, "isRemoteCameraSenderSupportediPad");
    case 1:
      return -[VCHardwareSettingsEmbedded isRemoteCameraSenderSupportediPhone](self, "isRemoteCameraSenderSupportediPhone");
  }
  return 0;
}

- (BOOL)isSecondDisplaySupportEnabled
{
  BOOL result;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  const char *v10;
  __int16 v11;
  int v12;
  __int16 v13;
  int64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (+[VCHardwareSettingsEmbedded deviceClass](VCHardwareSettingsEmbedded, "deviceClass") == 8)
    return 1;
  if (+[VCHardwareSettingsEmbedded deviceClass](VCHardwareSettingsEmbedded, "deviceClass") != 3)
    return 0;
  v4 = -[VCHardwareSettingsEmbedded chipId](self, "chipId");
  result = 0;
  if (v4 > 33026)
  {
    if (v4 == 35168 || v4 == 35157)
      return result;
    if (v4 != 33027)
      goto LABEL_15;
    return 1;
  }
  if ((unint64_t)(v4 - 0x8000) <= 0x27)
  {
    if (((1 << v4) & 0x810003000ALL) == 0)
    {
      if (v4 == 0x8000)
        return result;
      goto LABEL_8;
    }
    return 1;
  }
LABEL_8:
  if ((unint64_t)(v4 - 28672) >= 2)
  {
LABEL_15:
    if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
    {
      v5 = VRTraceErrorLogLevelToCSTR();
      v6 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v7 = 136315906;
        v8 = v5;
        v9 = 2080;
        v10 = "-[VCHardwareSettingsEmbedded isSecondDisplaySupportEnabled]";
        v11 = 1024;
        v12 = 1177;
        v13 = 2048;
        v14 = -[VCHardwareSettingsEmbedded chipId](self, "chipId");
        _os_log_impl(&dword_1D8A54000, v6, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Unknown chipID 0x%llx", (uint8_t *)&v7, 0x26u);
      }
    }
    return 1;
  }
  return result;
}

- (BOOL)isHEVC444DecodeSupported
{
  uint64_t v3;
  BOOL result;
  uint64_t v5;
  NSObject *v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  const char *v10;
  __int16 v11;
  int v12;
  __int16 v13;
  int64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (+[VCHardwareSettingsEmbedded deviceClass](VCHardwareSettingsEmbedded, "deviceClass") == 8)
    return 1;
  v3 = -[VCHardwareSettingsEmbedded chipId](self, "chipId");
  result = 0;
  if (v3 > 33024)
  {
    if (v3 <= 35156)
    {
      if (v3 == 33025 || v3 == 33027)
        return 1;
      goto LABEL_16;
    }
    if (v3 != 35157 && v3 != 35168)
      goto LABEL_16;
  }
  else
  {
    if ((unint64_t)(v3 - 0x8000) > 0x30)
      goto LABEL_12;
    if (((1 << v3) & 0x1008100230000) != 0)
      return 1;
    if (((1 << v3) & 0xB) == 0)
    {
LABEL_12:
      if ((unint64_t)(v3 - 28672) >= 2)
      {
LABEL_16:
        if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
        {
          v5 = VRTraceErrorLogLevelToCSTR();
          v6 = *MEMORY[0x1E0CF2758];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
          {
            v7 = 136315906;
            v8 = v5;
            v9 = 2080;
            v10 = "-[VCHardwareSettingsEmbedded isHEVC444DecodeSupported]";
            v11 = 1024;
            v12 = 1207;
            v13 = 2048;
            v14 = -[VCHardwareSettingsEmbedded chipId](self, "chipId");
            _os_log_impl(&dword_1D8A54000, v6, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Unknown chipID 0x%llx", (uint8_t *)&v7, 0x26u);
          }
        }
        return 1;
      }
    }
  }
  return result;
}

- (BOOL)canDo1080p
{
  uint64_t v3;
  BOOL result;

  if (+[VCHardwareSettingsEmbedded deviceClass](VCHardwareSettingsEmbedded, "deviceClass") == 8)
    return 1;
  v3 = -[VCHardwareSettingsEmbedded chipId](self, "chipId");
  result = 0;
  if (v3 > 32788)
  {
    if (v3 <= 32815)
    {
      if (v3 == 32800)
        return +[VCHardwareSettingsEmbedded deviceClass](VCHardwareSettingsEmbedded, "deviceClass") != 3;
      return 1;
    }
    if ((unint64_t)(v3 - 35152) > 0x10 || ((1 << (v3 - 80)) & 0x10021) == 0)
      return 1;
  }
  else
  {
    if (v3 > 32770)
    {
      if (v3 == 32771)
        return result;
      if (v3 == 32784)
        return +[VCHardwareSettingsEmbedded deviceClass](VCHardwareSettingsEmbedded, "deviceClass") == 1;
      return 1;
    }
    if ((unint64_t)(v3 - 28672) >= 2 && (unint64_t)(v3 - 0x8000) >= 2)
      return 1;
  }
  return result;
}

- (unsigned)maxRemoteParticipants30fps
{
  unsigned int result;
  int64_t v4;

  if (+[VCHardwareSettingsEmbedded deviceClass](VCHardwareSettingsEmbedded, "deviceClass") == 8)
    return 32;
  v4 = -[VCHardwareSettingsEmbedded chipId](self, "chipId");
  result = 4;
  if (((unint64_t)(v4 - 0x8000) > 0x15 || ((1 << v4) & 0x23000B) == 0)
    && ((unint64_t)(v4 - 35152) > 0x10 || ((1 << (v4 - 80)) & 0x10021) == 0))
  {
    if ((unint64_t)(v4 - 28672) >= 2)
      return 32;
    else
      return 4;
  }
  return result;
}

- (unsigned)maxFpsCameraCaptureDuringSharing
{
  if (+[VCHardwareSettingsEmbedded deviceClass](VCHardwareSettingsEmbedded, "deviceClass") == 8
    || +[VCHardwareSettingsEmbedded deviceClass](VCHardwareSettingsEmbedded, "deviceClass") == 3
    && +[VCHardwareSettings isAppleSilicon](VCHardwareSettings, "isAppleSilicon"))
  {
    return 30;
  }
  else
  {
    return 15;
  }
}

- (void)addPixelFormat
{
  void *v3;
  objc_super v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  -[NSMutableSet addObject:](self->super._pixelFormatCollections, "addObject:", &unk_1E9EF5720);
  -[NSMutableSet addObject:](self->super._pixelFormatCollections, "addObject:", &unk_1E9EF5738);
  v4.receiver = self;
  v4.super_class = (Class)VCHardwareSettingsEmbedded;
  if (-[VCHardwareSettings vcpSupportsHEVCEncoder](&v4, sel_vcpSupportsHEVCEncoder))
    -[NSMutableSet addObject:](self->super._pixelFormatCollections, "addObject:", &unk_1E9EF5708);
  if (-[VCHardwareSettingsEmbedded isSecondDisplaySupportEnabled](self, "isSecondDisplaySupportEnabled")
    && -[VCHardwareSettingsEmbedded isHEVC444DecodeSupported](self, "isHEVC444DecodeSupported"))
  {
    -[NSMutableSet addObject:](self->super._pixelFormatCollections, "addObject:", &unk_1E9EF5750);
LABEL_7:
    v3 = &unk_1E9EF5768;
LABEL_8:
    -[NSMutableSet addObject:](self->super._pixelFormatCollections, "addObject:", v3);
    return;
  }
  if (-[VCHardwareSettingsEmbedded deviceClass](self, "deviceClass") == 1)
    goto LABEL_7;
  if (-[VCHardwareSettingsEmbedded deviceClass](self, "deviceClass") == 4
    && -[VCHardwareSettingsEmbedded isHDRSupportedAppleTV](self, "isHDRSupportedAppleTV"))
  {
    v3 = &unk_1E9EF5780;
    goto LABEL_8;
  }
}

- (BOOL)isPixelFormatAvailable
{
  return -[NSMutableSet count](self->super._pixelFormatCollections, "count") != 0;
}

- (NSArray)supportedVideoPayloads
{
  NSArray *v3;
  int64_t v4;
  void *v5;

  v3 = (NSArray *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v4 = -[VCHardwareSettingsEmbedded deviceClass](self, "deviceClass");
  if ((unint64_t)(v4 - 1) >= 4)
  {
    if (v4 == 6)
    {
      v5 = &unk_1E9EF57B0;
      goto LABEL_8;
    }
    if (v4 != 8)
      return v3;
  }
  -[NSArray addObject:](v3, "addObject:", &unk_1E9EF5798);
  -[NSArray addObject:](v3, "addObject:", &unk_1E9EF57B0);
  if (-[VCHardwareSettings supportHEVC](self, "supportHEVC"))
  {
    v5 = &unk_1E9EF57C8;
LABEL_8:
    -[NSArray addObject:](v3, "addObject:", v5);
  }
  return v3;
}

- (BOOL)limitCameraDownlinkBitrateDuringSharing
{
  BOOL result;
  uint64_t v4;

  if (+[VCHardwareSettingsEmbedded deviceClass](VCHardwareSettingsEmbedded, "deviceClass") == 8)
    return 1;
  v4 = -[VCHardwareSettingsEmbedded chipId](self, "chipId");
  result = 1;
  if (v4 > 33024)
  {
    if (((unint64_t)(v4 - 35152) > 0x10 || ((1 << (v4 - 80)) & 0x10021) == 0) && v4 != 33025)
      return +[VCHardwareSettingsEmbedded deviceClass](VCHardwareSettingsEmbedded, "deviceClass") != 3;
  }
  else if (((unint64_t)(v4 - 0x8000) > 0x30 || ((1 << v4) & 0x100810023000BLL) == 0)
         && (unint64_t)(v4 - 28672) >= 2)
  {
    return +[VCHardwareSettingsEmbedded deviceClass](VCHardwareSettingsEmbedded, "deviceClass") != 3;
  }
  return result;
}

- (BOOL)supportsScreenCapture
{
  return (+[VCHardwareSettingsEmbedded deviceClass](VCHardwareSettingsEmbedded, "deviceClass") & 0xFFFFFFFFFFFFFFFELL) != 6;
}

- (BOOL)supportsSystemAudioTap
{
  return +[VCHardwareSettingsEmbedded deviceClass](VCHardwareSettingsEmbedded, "deviceClass") != 6;
}

- (BOOL)supportsDedicatedSystemAudioStream
{
  BOOL v3;
  int64_t v4;

  if (!-[VCHardwareSettingsEmbedded supportsSystemAudioTap](self, "supportsSystemAudioTap"))
    return 0;
  if (+[VCHardwareSettingsEmbedded deviceClass](VCHardwareSettingsEmbedded, "deviceClass") == 8)
    return 1;
  v4 = -[VCHardwareSettingsEmbedded chipId](self, "chipId");
  if ((unint64_t)(v4 - 0x8000) <= 0x20 && ((1 << v4) & 0x10023000BLL) != 0)
    return 0;
  if ((unint64_t)(v4 - 35152) > 0x10)
    return (unint64_t)(v4 - 28672) >= 2;
  v3 = 0;
  if (((1 << (v4 - 80)) & 0x10021) == 0)
    return (unint64_t)(v4 - 28672) >= 2;
  return v3;
}

- (BOOL)disableMLScalarDuringSharing
{
  if (+[VCHardwareSettingsEmbedded deviceClass](VCHardwareSettingsEmbedded, "deviceClass") != 8)
    -[VCHardwareSettingsEmbedded chipId](self, "chipId");
  return 1;
}

- (int64_t)screenShareCapabilities
{
  int64_t v3;
  int64_t result;

  v3 = +[VCHardwareSettingsEmbedded deviceClass](VCHardwareSettingsEmbedded, "deviceClass") - 1;
  result = 2;
  switch(v3)
  {
    case 0:
      result = -[VCHardwareSettingsEmbedded screenShareCapabilitiesIPhone](self, "screenShareCapabilitiesIPhone");
      break;
    case 1:
      result = -[VCHardwareSettingsEmbedded screenShareCapabilitiesIPod](self, "screenShareCapabilitiesIPod");
      break;
    case 2:
      result = -[VCHardwareSettingsEmbedded screenShareCapabilitiesIPad](self, "screenShareCapabilitiesIPad");
      break;
    case 3:
      result = -[VCHardwareSettingsEmbedded screenShareCapabilitiesATV](self, "screenShareCapabilitiesATV");
      break;
    case 7:
      return result;
    default:
      result = 0;
      break;
  }
  return result;
}

- (int64_t)screenShareCapabilitiesIPhone
{
  uint64_t v2;
  int64_t result;

  v2 = -[VCHardwareSettingsEmbedded chipId](self, "chipId");
  result = 1;
  if (v2 > 35151)
  {
    if (v2 != 35152 && v2 != 35168)
      return 2;
  }
  else if (((unint64_t)(v2 - 0x8000) > 0x30 || ((1 << v2) & 0x1000100210009) == 0) && v2 != 28672)
  {
    return 2;
  }
  return result;
}

- (int64_t)screenShareCapabilitiesIPad
{
  uint64_t v2;
  int64_t result;

  v2 = -[VCHardwareSettingsEmbedded chipId](self, "chipId");
  result = 0;
  if (v2 < 0x8000)
  {
    if (v2 != 28672)
    {
      if (v2 == 28673)
        return 1;
      return 2;
    }
  }
  else
  {
    if ((unint64_t)(v2 - 0x8000) <= 0x20 && ((1 << v2) & 0x10003000BLL) != 0)
      return 1;
    if (v2 != 35157 && v2 != 35168)
      return 2;
  }
  return result;
}

- (int64_t)screenShareCapabilitiesATV
{
  if (MGGetBoolAnswer())
    return 2;
  else
    return 1;
}

- (int64_t)screenShareCapabilitiesIPod
{
  return -[VCHardwareSettingsEmbedded chipId](self, "chipId") != 28672;
}

- (BOOL)isCellularTappingSupported
{
  return 1;
}

- (BOOL)isMediaRecordingSupported
{
  return -[VCHardwareSettingsEmbedded deviceClass](self, "deviceClass") != 6;
}

- (BOOL)isViewPointCorrectionSupportedNoDispatch
{
  int64_t v3;
  int64_t v4;
  int64_t v5;
  void *v6;
  int v7;
  uint64_t v8;
  NSObject *v9;
  NSString *deviceName;
  uint64_t v11;
  NSObject *v12;
  _BOOL4 v13;
  const char *v14;
  NSObject *v15;
  uint32_t v16;
  uint64_t v17;
  NSObject *v18;
  _BOOL4 v19;
  uint64_t v20;
  _BOOL4 v21;
  uint8_t buf[4];
  uint64_t v24;
  __int16 v25;
  const char *v26;
  __int16 v27;
  int v28;
  __int16 v29;
  int64_t v30;
  __int16 v31;
  NSString *v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  if (!-[VCHardwareSettingsEmbedded hasAppleNeuralEngine](self, "hasAppleNeuralEngine"))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v11 = VRTraceErrorLogLevelToCSTR();
      v12 = *MEMORY[0x1E0CF2758];
      v13 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT);
      LOBYTE(v3) = 0;
      if (!v13)
        return v3;
      *(_DWORD *)buf = 136315650;
      v24 = v11;
      v25 = 2080;
      v26 = "-[VCHardwareSettingsEmbedded isViewPointCorrectionSupportedNoDispatch]";
      v27 = 1024;
      v28 = 1563;
      v14 = " [%s] %s:%d No AppleNeuralEngine";
LABEL_13:
      v15 = v12;
      v16 = 28;
LABEL_17:
      _os_log_impl(&dword_1D8A54000, v15, OS_LOG_TYPE_DEFAULT, v14, buf, v16);
    }
LABEL_18:
    LOBYTE(v3) = 0;
    return v3;
  }
  v3 = +[VCHardwareSettingsEmbedded deviceClass](VCHardwareSettingsEmbedded, "deviceClass");
  if (v3 == 1)
    return v3;
  v4 = v3;
  if (v3 != 3)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v17 = VRTraceErrorLogLevelToCSTR();
      v18 = *MEMORY[0x1E0CF2758];
      v19 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT);
      LOBYTE(v3) = 0;
      if (!v19)
        return v3;
      *(_DWORD *)buf = 136315906;
      v24 = v17;
      v25 = 2080;
      v26 = "-[VCHardwareSettingsEmbedded isViewPointCorrectionSupportedNoDispatch]";
      v27 = 1024;
      v28 = 1560;
      v29 = 2048;
      v30 = v4;
      v14 = " [%s] %s:%d VCDeviceClassType=%ld is not supported";
      v15 = v18;
      v16 = 38;
      goto LABEL_17;
    }
    goto LABEL_18;
  }
  if ((_os_feature_enabled_impl() & 1) == 0)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() < 7)
      goto LABEL_18;
    v20 = VRTraceErrorLogLevelToCSTR();
    v12 = *MEMORY[0x1E0CF2758];
    v21 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT);
    LOBYTE(v3) = 0;
    if (!v21)
      return v3;
    *(_DWORD *)buf = 136315650;
    v24 = v20;
    v25 = 2080;
    v26 = "-[VCHardwareSettingsEmbedded isViewPointCorrectionSupportedNoDispatch]";
    v27 = 1024;
    v28 = 1539;
    v14 = " [%s] %s:%d iPad feature flag is off";
    goto LABEL_13;
  }
  v5 = -[VCHardwareSettingsEmbedded productType](self, "productType");
  v6 = (void *)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", &unk_1E9EF57E0, &unk_1E9EF57F8, &unk_1E9EF5810, &unk_1E9EF5828, &unk_1E9EF5840, &unk_1E9EF5858, &unk_1E9EF5870, &unk_1E9EF5888, &unk_1E9EF58A0, &unk_1E9EF58B8, &unk_1E9EF58D0, &unk_1E9EF58E8, &unk_1E9EF5900, &unk_1E9EF5918, &unk_1E9EF5930, &unk_1E9EF5948, &unk_1E9EF5960,
                 &unk_1E9EF5978,
                 &unk_1E9EF5990,
                 &unk_1E9EF59A8,
                 &unk_1E9EF59C0,
                 &unk_1E9EF59D8,
                 &unk_1E9EF59F0,
                 &unk_1E9EF5A08,
                 &unk_1E9EF5A20,
                 &unk_1E9EF5A38,
                 &unk_1E9EF5A50,
                 &unk_1E9EF5A68,
                 &unk_1E9EF5A80,
                 &unk_1E9EF5A98,
                 &unk_1E9EF5AB0,
                 &unk_1E9EF5AC8,
                 &unk_1E9EF5AE0,
                 &unk_1E9EF5AF8,
                 &unk_1E9EF5B10,
                 &unk_1E9EF5B28,
                 &unk_1E9EF5B40,
                 &unk_1E9EF5B58,
                 0);
  v7 = objc_msgSend(v6, "containsObject:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLong:", v5));
  if (v7)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v8 = VRTraceErrorLogLevelToCSTR();
      v9 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        deviceName = self->_deviceName;
        *(_DWORD *)buf = 136316162;
        v24 = v8;
        v25 = 2080;
        v26 = "-[VCHardwareSettingsEmbedded isViewPointCorrectionSupportedNoDispatch]";
        v27 = 1024;
        v28 = 1555;
        v29 = 2048;
        v30 = v5;
        v31 = 2112;
        v32 = deviceName;
        _os_log_impl(&dword_1D8A54000, v9, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d iPad productType=0x%lx, model=%@ is not supported.", buf, 0x30u);
      }
    }
  }
  LOBYTE(v3) = v7 ^ 1;
  return v3;
}

uint64_t __60__VCHardwareSettingsEmbedded_isViewPointCorrectionSupported__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "isViewPointCorrectionSupportedNoDispatch");
  isViewPointCorrectionSupported_result = result;
  return result;
}

- (BOOL)isSmartBrakeSupportedIPhone
{
  int64_t v2;
  BOOL result;
  BOOL v4;

  v2 = -[VCHardwareSettingsEmbedded chipId](self, "chipId");
  result = 0;
  v4 = (unint64_t)(v2 - 0x8000) > 0x27 || ((1 << v2) & 0x810023000BLL) == 0;
  if (v4 && ((unint64_t)(v2 - 35152) > 0x10 || ((1 << (v2 - 80)) & 0x10021) == 0))
    return (unint64_t)(v2 - 28672) >= 2;
  return result;
}

- (BOOL)isSmartBrakeSupportedIPad
{
  uint64_t v2;
  BOOL result;

  v2 = -[VCHardwareSettingsEmbedded chipId](self, "chipId");
  result = 0;
  if (v2 > 35156)
  {
    if (v2 != 35157 && v2 != 35168)
      return 1;
  }
  else if (((unint64_t)(v2 - 0x8000) > 0x20 || ((1 << v2) & 0x10003000BLL) == 0)
         && (unint64_t)(v2 - 28672) >= 2)
  {
    return 1;
  }
  return result;
}

- (BOOL)isSmartBrakeSupportedATV
{
  uint64_t v2;
  BOOL v3;

  v2 = -[VCHardwareSettingsEmbedded chipId](self, "chipId");
  if (v2 > 32799)
    return 1;
  v3 = 0;
  if (v2 != 28672 && v2 != 32785)
    return 1;
  return v3;
}

- (BOOL)isSmartBrakeSupported
{
  int64_t v3;

  v3 = -[VCHardwareSettingsEmbedded deviceClass](self, "deviceClass");
  switch(v3)
  {
    case 4:
      return -[VCHardwareSettingsEmbedded isSmartBrakeSupportedATV](self, "isSmartBrakeSupportedATV");
    case 3:
      return -[VCHardwareSettingsEmbedded isSmartBrakeSupportedIPad](self, "isSmartBrakeSupportedIPad");
    case 1:
      return -[VCHardwareSettingsEmbedded isSmartBrakeSupportedIPhone](self, "isSmartBrakeSupportedIPhone");
  }
  return 0;
}

- (BOOL)isExternalCameraSupported
{
  if (-[VCHardwareSettingsEmbedded deviceClass](self, "deviceClass") == 3)
    return _os_feature_enabled_impl();
  else
    return 0;
}

- (BOOL)isMLEnhanceOneToOneSupported
{
  uint64_t v3;
  BOOL result;

  if (-[VCHardwareSettingsEmbedded deviceClass](self, "deviceClass") != 3)
    return 0;
  v3 = -[VCHardwareSettingsEmbedded chipId](self, "chipId");
  result = 0;
  if (v3 > 33024)
  {
    if (((unint64_t)(v3 - 35152) > 0x10 || ((1 << (v3 - 80)) & 0x10021) == 0)
      && v3 != 33025
      && v3 != 33040)
    {
      return 1;
    }
  }
  else if (((unint64_t)(v3 - 0x8000) > 0x30 || ((1 << v3) & 0x100810023000BLL) == 0)
         && (unint64_t)(v3 - 28672) >= 2)
  {
    return 1;
  }
  return result;
}

- (unsigned)maxHighTierMLEnhanceParticipants
{
  int64_t v3;
  int64_t v4;
  unsigned int result;
  uint64_t v6;
  uint64_t v7;

  v3 = -[VCHardwareSettingsEmbedded deviceClass](self, "deviceClass");
  if (v3 != 1)
  {
    if (v3 != 4)
      return 2;
    v4 = -[VCHardwareSettingsEmbedded chipId](self, "chipId");
    result = 1;
    if (((unint64_t)(v4 - 0x8000) > 0x20 || ((1 << v4) & 0x10023000BLL) == 0)
      && ((unint64_t)(v4 - 35152) > 0x10 || ((1 << (v4 - 80)) & 0x10021) == 0))
    {
      if ((unint64_t)(v4 - 28672) >= 2)
        return 2;
      else
        return 1;
    }
    return result;
  }
  v6 = -[VCHardwareSettingsEmbedded chipId](self, "chipId");
  result = 0;
  if (v6 <= 33024)
  {
    if ((unint64_t)(v6 - 0x8000) <= 0x30 && ((1 << v6) & 0x1000100210009) != 0 || v6 == 28672)
      return result;
    return 1;
  }
  if (v6 > 35151)
  {
    if (v6 == 35152)
      return result;
    v7 = 35168;
  }
  else
  {
    if (v6 == 33025)
      return result;
    v7 = 33040;
  }
  if (v6 != v7)
    return 1;
  return result;
}

- (BOOL)supportsOutOfProcessDecoding
{
  int64_t v3;
  _BOOL4 v4;

  v3 = -[VCHardwareSettingsEmbedded deviceClass](self, "deviceClass");
  LOBYTE(v4) = 1;
  switch(v3)
  {
    case -1:
      if ((int)VRTraceGetErrorLogLevelForModule() < 3)
        goto LABEL_2;
      VRTraceErrorLogLevelToCSTR();
      v4 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR);
      if (v4)
      {
        -[VCHardwareSettingsEmbedded supportsOutOfProcessDecoding].cold.1();
        goto LABEL_2;
      }
      break;
    case 0:
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCHardwareSettingsEmbedded supportsOutOfProcessDecoding].cold.2();
      }
      LOBYTE(v4) = 1;
      break;
    case 1:
      LOBYTE(v4) = -[VCHardwareSettingsEmbedded iPhoneSupportsOutOfProcessDecoding](self, "iPhoneSupportsOutOfProcessDecoding");
      break;
    case 2:
    case 5:
    case 8:
LABEL_2:
      LOBYTE(v4) = 0;
      break;
    case 3:
      LOBYTE(v4) = -[VCHardwareSettingsEmbedded iPadSupportsOutOfProcessDecoding](self, "iPadSupportsOutOfProcessDecoding");
      break;
    default:
      return v4;
  }
  return v4;
}

- (BOOL)iPhoneSupportsOutOfProcessDecoding
{
  uint64_t v2;
  BOOL result;

  v2 = -[VCHardwareSettingsEmbedded chipId](self, "chipId");
  result = 0;
  if (v2 > 33024)
  {
    if (((unint64_t)(v2 - 35152) > 0x10 || ((1 << (v2 - 80)) & 0x10021) == 0)
      && v2 != 33025
      && v2 != 33027)
    {
      return 1;
    }
  }
  else if (((unint64_t)(v2 - 0x8000) > 0x30 || ((1 << v2) & 0x100810023000BLL) == 0)
         && (unint64_t)(v2 - 28672) >= 2)
  {
    return 1;
  }
  return result;
}

- (BOOL)iPadSupportsOutOfProcessDecoding
{
  uint64_t v2;
  BOOL result;

  v2 = -[VCHardwareSettingsEmbedded chipId](self, "chipId");
  result = 0;
  if (v2 > 35156)
  {
    if (v2 != 35157 && v2 != 35168)
      return 1;
  }
  else if (((unint64_t)(v2 - 0x8000) > 0x10 || ((1 << v2) & 0x1000B) == 0)
         && (unint64_t)(v2 - 28672) >= 2)
  {
    return 1;
  }
  return result;
}

- (BOOL)captureFormatPrefer16by9ForSquare
{
  return -[VCHardwareSettingsEmbedded deviceClass](self, "deviceClass") == 1;
}

- (int)productType
{
  return *(_QWORD *)&self->_productType;
}

- (void)initForDevice:.cold.1()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to initialize", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)initForDevice:.cold.2()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Attempting to initialize with NULL device code", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)initForDevice:.cold.3()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to copy device name", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)initForDevice:.cold.4()
{
  __int16 v0;
  uint64_t v1;
  os_log_t v2;
  uint8_t v3[12];
  __int16 v4;
  const char *v5;
  __int16 v6;
  int v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_2();
  v4 = v0;
  v5 = "-[VCHardwareSettingsEmbedded initForDevice:]";
  v6 = 1024;
  v7 = 132;
  v8 = 2112;
  v9 = v1;
  _os_log_error_impl(&dword_1D8A54000, v2, OS_LOG_TYPE_ERROR, " [%s] %s:%d Failed to find configuration for virtual embedded device=%@", v3, 0x26u);
  OUTLINED_FUNCTION_3();
}

- (void)supportsOutOfProcessDecoding
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d VCHardwareSettingsEmbedded called on kVCDeviceClassTypeMac", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

@end
