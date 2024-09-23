@implementation VCDefaults

- (BOOL)useVirtualCapture
{
  int IsInternalOSInstalled;

  IsInternalOSInstalled = VRTraceIsInternalOSInstalled();
  if (IsInternalOSInstalled)
    LOBYTE(IsInternalOSInstalled) = +[VCDefaults BOOLeanValueForKey:defaultValue:](VCDefaults, "BOOLeanValueForKey:defaultValue:", CFSTR("useVirtualCapture"), 0);
  return IsInternalOSInstalled;
}

+ (id)sharedInstance
{
  _QWORD v3[6];

  v3[5] = *MEMORY[0x1E0C80C00];
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __28__VCDefaults_sharedInstance__block_invoke;
  v3[3] = &unk_1E9E521C0;
  v3[4] = a1;
  if (sharedInstance_onceToken_18 != -1)
    dispatch_once(&sharedInstance_onceToken_18, v3);
  return (id)_sharedInstance;
}

+ (int64_t)integerValueForKey:(__CFString *)a3 defaultValue:(int64_t)a4
{
  return (int)VCDefaults_GetIntValueForKey(a3, a4);
}

+ (BOOL)BOOLeanValueForKey:(__CFString *)a3 defaultValue:(BOOL)a4
{
  _BOOL8 v4;

  v4 = a4;
  if (VRTraceIsInternalOSInstalled())
    return _VCDefaults_GetBoolValueForKey(a3, v4, 1);
  else
    return v4;
}

+ (BOOL)BOOLeanValueForKey:(__CFString *)a3
{
  return +[VCDefaults BOOLeanValueForKey:defaultValue:](VCDefaults, "BOOLeanValueForKey:defaultValue:", a3, 0);
}

- (BOOL)forceMirroredCapture
{
  return +[VCDefaults BOOLeanValueForKey:](VCDefaults, "BOOLeanValueForKey:", CFSTR("forceMirroredCapture"));
}

- (BOOL)forceHWI
{
  void *v3;
  void *v4;
  __int128 v5;
  int forceFramerate;
  int ErrorLogLevelForModule;
  os_log_t *v9;
  uint64_t v10;
  NSObject *v11;
  int forceCaptureWidth;
  int forceCaptureHeight;
  int v14;
  uint64_t v15;
  NSObject *v16;
  int forceEncodeWidth;
  int forceEncodeHeight;
  int v19;
  int forceBitrate;
  int forceKeyFrameInterval;
  uint8_t buf[4];
  uint64_t v23;
  __int16 v24;
  const char *v25;
  __int16 v26;
  int v27;
  __int16 v28;
  int v29;
  __int16 v30;
  int v31;
  __int16 v32;
  int v33;
  __int16 v34;
  int v35;
  __int16 v36;
  int v37;
  __int16 v38;
  char *v39;
  char v40[16];
  __int128 v41;
  uint64_t v42;
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v3 = (void *)CFPreferencesCopyAppValue(CFSTR("forceHWI"), CFSTR("com.apple.VideoConference"));
  if (v3)
  {
    v4 = (void *)MEMORY[0x1DF088A10]();
    -[VCDefaults seperateString:](self, "seperateString:", v3);
    objc_autoreleasePoolPop(v4);

    *(int32x2_t *)&v5 = vmax_s32(vmin_s32(*(int32x2_t *)&self->_forceEncodeWidth, (int32x2_t)0x80000000800), (int32x2_t)0xF000000140);
    *((_QWORD *)&v5 + 1) = v5;
    *(_OWORD *)&self->_forceCaptureWidth = v5;
    forceFramerate = self->_forceFramerate;
    if (forceFramerate >= 60)
      forceFramerate = 60;
    if (forceFramerate <= 5)
      forceFramerate = 5;
    self->_forceFramerate = forceFramerate;
    if ((int)*MEMORY[0x1E0CF2740] >= 6)
    {
      v42 = 0;
      *(_OWORD *)v40 = 0u;
      v41 = 0u;
      if (self->_forceVideoPayload != 128)
        __sprintf_chk(v40, 0, 0x28uLL, "payload: %d", self->_forceVideoPayload);
      if (self->_forceRecvVideoPayload != 128)
        __sprintf_chk(v40, 0, 0x28uLL, "receive payload: %d", self->_forceVideoPayload);
      ErrorLogLevelForModule = VRTraceGetErrorLogLevelForModule();
      v9 = (os_log_t *)MEMORY[0x1E0CF2758];
      if (ErrorLogLevelForModule >= 6)
      {
        v10 = VRTraceErrorLogLevelToCSTR();
        v11 = *v9;
        if (os_log_type_enabled(*v9, OS_LOG_TYPE_DEFAULT))
        {
          forceCaptureWidth = self->_forceCaptureWidth;
          forceCaptureHeight = self->_forceCaptureHeight;
          v14 = self->_forceFramerate;
          *(_DWORD *)buf = 136316418;
          v23 = v10;
          v24 = 2080;
          v25 = "-[VCDefaults forceHWI]";
          v26 = 1024;
          v27 = 212;
          v28 = 1024;
          v29 = forceCaptureWidth;
          v30 = 1024;
          v31 = forceCaptureHeight;
          v32 = 1024;
          v33 = v14;
          _os_log_impl(&dword_1D8A54000, v11, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Forced camera settings %dx%d@%dfps", buf, 0x2Eu);
        }
      }
      if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
      {
        v15 = VRTraceErrorLogLevelToCSTR();
        v16 = *v9;
        if (os_log_type_enabled(*v9, OS_LOG_TYPE_DEFAULT))
        {
          forceEncodeWidth = self->_forceEncodeWidth;
          forceEncodeHeight = self->_forceEncodeHeight;
          v19 = self->_forceFramerate;
          forceBitrate = self->_forceBitrate;
          forceKeyFrameInterval = self->_forceKeyFrameInterval;
          *(_DWORD *)buf = 136317186;
          v23 = v15;
          v24 = 2080;
          v25 = "-[VCDefaults forceHWI]";
          v26 = 1024;
          v27 = 215;
          v28 = 1024;
          v29 = forceEncodeWidth;
          v30 = 1024;
          v31 = forceEncodeHeight;
          v32 = 1024;
          v33 = v19;
          v34 = 1024;
          v35 = forceBitrate;
          v36 = 1024;
          v37 = forceKeyFrameInterval;
          v38 = 2080;
          v39 = v40;
          _os_log_impl(&dword_1D8A54000, v16, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Forced encoder settings: %dx%d@%dfps, %d Kbps, %d IDR/sec, %s", buf, 0x44u);
        }
      }
    }
  }
  return v3 != 0;
}

- (BOOL)forceEnablePearlCamera
{
  return +[VCDefaults BOOLeanValueForKey:](VCDefaults, "BOOLeanValueForKey:", CFSTR("forceEnablePearlCamera"));
}

- (BOOL)forceDynamicEffectsFramerate
{
  return +[VCDefaults BOOLeanValueForKey:](VCDefaults, "BOOLeanValueForKey:", CFSTR("forceDynamicEffectsFrameRate"));
}

- (float)depthFrameRateMultiplier
{
  double v2;

  +[VCDefaults getDoubleValueForKey:defaultValue:](VCDefaults, "getDoubleValueForKey:defaultValue:", CFSTR("depthFrameRateMultiplier"), 0.25);
  return v2;
}

+ (double)getDoubleValueForKey:(__CFString *)a3 defaultValue:(double)a4
{
  return VCDefaults_GetDoubleValueForKey(a3, a4);
}

- (NSString)virtualHardware
{
  CFTypeID TypeID;

  TypeID = CFStringGetTypeID();
  return (NSString *)(id)VCDefaults_CopyValueForKey(CFSTR("virtualHardware"), TypeID);
}

- (BOOL)cameraVideoStablization
{
  return +[VCDefaults BOOLeanValueForKey:defaultValue:](VCDefaults, "BOOLeanValueForKey:defaultValue:", CFSTR("CameraVideoStabilization"), 0);
}

+ (id)copyStringValueForKey:(__CFString *)a3
{
  CFTypeID TypeID;

  TypeID = CFStringGetTypeID();
  return (id)VCDefaults_CopyValueForKey(a3, TypeID);
}

- (unsigned)forceThermalLevelFramerate:(unsigned int)a3
{
  return +[VCDefaults integerValueForKey:defaultValue:](VCDefaults, "integerValueForKey:defaultValue:", CFSTR("forceThermalLevelFramerate"), a3);
}

Class *__28__VCDefaults_sharedInstance__block_invoke(Class *result)
{
  if (!_sharedInstance)
  {
    result = (Class *)objc_alloc_init(result[4]);
    _sharedInstance = (uint64_t)result;
    if (result)
    {
      CFPreferencesAppSynchronize(CFSTR("com.apple.VideoConference"));
      return (Class *)CFPreferencesSynchronize(CFSTR("com.apple.VideoConference"), (CFStringRef)*MEMORY[0x1E0C9B240], (CFStringRef)*MEMORY[0x1E0C9B230]);
    }
  }
  return result;
}

+ (int64_t)integerValueForKey:(__CFString *)a3
{
  return +[VCDefaults integerValueForKey:defaultValue:](VCDefaults, "integerValueForKey:defaultValue:", a3, 0);
}

- (VCDefaults)init
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v3.receiver = self;
  v3.super_class = (Class)VCDefaults;
  return -[VCDefaults init](&v3, sel_init);
}

- (VCDefaults)allocWithZone:(_NSZone *)a3
{
  return (VCDefaults *)_sharedInstance;
}

- (unint64_t)retainCount
{
  return -1;
}

- (BOOL)forceScreenHWI
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  NSObject *v7;
  int forceEncodeWidth;
  int forceEncodeHeight;
  int forceFramerate;
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
  __int16 v22;
  int v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v3 = (void *)CFPreferencesCopyAppValue(CFSTR("forceScreenHWI"), CFSTR("com.apple.VideoConference"));
  if (v3)
  {
    v4 = (void *)MEMORY[0x1DF088A10]();
    v5 = (void *)objc_msgSend(v3, "componentsSeparatedByString:", CFSTR(":"));
    if (objc_msgSend(v5, "count") == 3)
    {
      self->_forceEncodeWidth = objc_msgSend((id)objc_msgSend(v5, "objectAtIndexedSubscript:", 0), "intValue");
      self->_forceEncodeHeight = objc_msgSend((id)objc_msgSend(v5, "objectAtIndexedSubscript:", 1), "intValue");
      self->_forceEncodeFramerate = objc_msgSend((id)objc_msgSend(v5, "objectAtIndexedSubscript:", 2), "intValue");
    }
    objc_autoreleasePoolPop(v4);

    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v6 = VRTraceErrorLogLevelToCSTR();
      v7 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        forceEncodeWidth = self->_forceEncodeWidth;
        forceEncodeHeight = self->_forceEncodeHeight;
        forceFramerate = self->_forceFramerate;
        v12 = 136316418;
        v13 = v6;
        v14 = 2080;
        v15 = "-[VCDefaults forceScreenHWI]";
        v16 = 1024;
        v17 = 170;
        v18 = 1024;
        v19 = forceEncodeWidth;
        v20 = 1024;
        v21 = forceEncodeHeight;
        v22 = 1024;
        v23 = forceFramerate;
        _os_log_impl(&dword_1D8A54000, v7, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d VideoConferenceDefaults: Forced screen capture settings: %dx%d@%dfps", (uint8_t *)&v12, 0x2Eu);
      }
    }
  }
  return v3 != 0;
}

- (BOOL)forceMultiwayHWI
{
  void *v3;
  void *v4;
  uint64_t v6;
  NSObject *v7;
  int forceEncodeWidth;
  int forceEncodeHeight;
  int forceFramerate;
  int forceBitrate;
  int forceKeyFrameInterval;
  uint8_t buf[4];
  uint64_t v14;
  __int16 v15;
  const char *v16;
  __int16 v17;
  int v18;
  __int16 v19;
  int v20;
  __int16 v21;
  int v22;
  __int16 v23;
  int v24;
  __int16 v25;
  int v26;
  __int16 v27;
  int v28;
  __int16 v29;
  char *v30;
  char v31[16];
  __int128 v32;
  uint64_t v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v3 = (void *)CFPreferencesCopyAppValue(CFSTR("forceMultiwayHWI"), CFSTR("com.apple.VideoConference"));
  if (v3)
  {
    v4 = (void *)MEMORY[0x1DF088A10]();
    -[VCDefaults seperateString:](self, "seperateString:", v3);
    objc_autoreleasePoolPop(v4);

    if ((int)*MEMORY[0x1E0CF2740] >= 6)
    {
      v33 = 0;
      *(_OWORD *)v31 = 0u;
      v32 = 0u;
      if (self->_forceVideoPayload != 128)
        __sprintf_chk(v31, 0, 0x28uLL, "payload: %d", self->_forceVideoPayload);
      if (self->_forceRecvVideoPayload != 128)
        __sprintf_chk(v31, 0, 0x28uLL, "receive payload: %d", self->_forceVideoPayload);
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        v6 = VRTraceErrorLogLevelToCSTR();
        v7 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        {
          forceEncodeWidth = self->_forceEncodeWidth;
          forceEncodeHeight = self->_forceEncodeHeight;
          forceFramerate = self->_forceFramerate;
          forceBitrate = self->_forceBitrate;
          forceKeyFrameInterval = self->_forceKeyFrameInterval;
          *(_DWORD *)buf = 136317186;
          v14 = v6;
          v15 = 2080;
          v16 = "-[VCDefaults forceMultiwayHWI]";
          v17 = 1024;
          v18 = 252;
          v19 = 1024;
          v20 = forceEncodeWidth;
          v21 = 1024;
          v22 = forceEncodeHeight;
          v23 = 1024;
          v24 = forceFramerate;
          v25 = 1024;
          v26 = forceBitrate;
          v27 = 1024;
          v28 = forceKeyFrameInterval;
          v29 = 2080;
          v30 = v31;
          _os_log_error_impl(&dword_1D8A54000, v7, OS_LOG_TYPE_ERROR, " [%s] %s:%d Forced multiway encoder settings: %dx%d@%dfps, %d Kbps, %d IDR/sec, %s", buf, 0x44u);
        }
      }
    }
  }
  return v3 != 0;
}

- (BOOL)forceDisableThermal
{
  return +[VCDefaults BOOLeanValueForKey:defaultValue:](VCDefaults, "BOOLeanValueForKey:defaultValue:", CFSTR("forceDisableThermal"), 0);
}

- (void)seperateString:(id)a3
{
  void *v4;
  void *v5;
  int v6;
  int v7;
  int v8;

  v4 = (void *)objc_msgSend(a3, "componentsSeparatedByString:", CFSTR(":"));
  if (v4)
  {
    v5 = v4;
    if (objc_msgSend(v4, "count"))
      self->_forceEncodeWidth = objc_msgSend((id)objc_msgSend(v5, "objectAtIndexedSubscript:", 0), "intValue");
    if ((unint64_t)objc_msgSend(v5, "count") >= 2)
      self->_forceEncodeHeight = objc_msgSend((id)objc_msgSend(v5, "objectAtIndexedSubscript:", 1), "intValue");
    if ((unint64_t)objc_msgSend(v5, "count") >= 3)
      self->_forceBitrate = objc_msgSend((id)objc_msgSend(v5, "objectAtIndexedSubscript:", 2), "intValue");
    if ((unint64_t)objc_msgSend(v5, "count") >= 4)
      self->_forceFramerate = objc_msgSend((id)objc_msgSend(v5, "objectAtIndexedSubscript:", 3), "intValue");
    if ((unint64_t)objc_msgSend(v5, "count") < 5)
      v6 = 128;
    else
      v6 = objc_msgSend((id)objc_msgSend(v5, "objectAtIndexedSubscript:", 4), "intValue");
    self->_forceVideoPayload = v6;
    if ((unint64_t)objc_msgSend(v5, "count") < 6)
      v7 = 128;
    else
      v7 = objc_msgSend((id)objc_msgSend(v5, "objectAtIndexedSubscript:", 5), "intValue");
    self->_forceRecvVideoPayload = v7;
    if ((unint64_t)objc_msgSend(v5, "count") < 7)
      v8 = 1;
    else
      v8 = objc_msgSend((id)objc_msgSend(v5, "objectAtIndexedSubscript:", 6), "intValue");
    self->_forceKeyFrameInterval = v8;
  }
}

- (int)forceCaptureWidth
{
  return self->_forceCaptureWidth;
}

- (int)forceCaptureHeight
{
  return self->_forceCaptureHeight;
}

- (int)forceEncodeWidth
{
  return self->_forceEncodeWidth;
}

- (int)forceEncodeHeight
{
  return self->_forceEncodeHeight;
}

- (int)forceEncodeFramerate
{
  return self->_forceEncodeFramerate;
}

- (int)forceFramerate
{
  return self->_forceFramerate;
}

- (int)forceBitrate
{
  return self->_forceBitrate;
}

- (int)forceVideoPayload
{
  return self->_forceVideoPayload;
}

- (int)forceRecvVideoPayload
{
  return self->_forceRecvVideoPayload;
}

- (int)forceKeyFrameInterval
{
  return self->_forceKeyFrameInterval;
}

- (BOOL)forceARCapture
{
  int IsInternalOSInstalled;

  IsInternalOSInstalled = VRTraceIsInternalOSInstalled();
  if (IsInternalOSInstalled)
    LOBYTE(IsInternalOSInstalled) = +[VCDefaults BOOLeanValueForKey:](VCDefaults, "BOOLeanValueForKey:", CFSTR("ARCaptureEnabled"));
  return IsInternalOSInstalled;
}

- (BOOL)forceDisableVideoRuleWiFi1080
{
  return +[VCDefaults BOOLeanValueForKey:](VCDefaults, "BOOLeanValueForKey:", CFSTR("forceDisableVideoRuleWiFi1080"));
}

- (BOOL)forceDisableVideoRuleCell720
{
  return +[VCDefaults BOOLeanValueForKey:](VCDefaults, "BOOLeanValueForKey:", CFSTR("forceDisableVideoRuleCell720"));
}

- (BOOL)enableBitstreamCapture
{
  int IsInternalOSInstalled;

  IsInternalOSInstalled = VRTraceIsInternalOSInstalled();
  if (IsInternalOSInstalled)
    LOBYTE(IsInternalOSInstalled) = +[VCDefaults BOOLeanValueForKey:](VCDefaults, "BOOLeanValueForKey:", CFSTR("enableBitstreamCapture"));
  return IsInternalOSInstalled;
}

- (int)enableRxDecodeYUVDump
{
  int result;
  CFIndex AppIntegerValue;
  unint64_t v4;
  int ErrorLogLevelForModule;
  uint64_t v6;
  NSObject *v7;
  uint64_t v8;
  NSObject *v9;
  _BOOL4 v10;
  Boolean keyExistsAndHasValidFormat;
  uint8_t buf[4];
  uint64_t v13;
  __int16 v14;
  const char *v15;
  __int16 v16;
  int v17;
  __int16 v18;
  int v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  result = VRTraceIsInternalOSInstalled();
  if (!result)
    return result;
  keyExistsAndHasValidFormat = -86;
  AppIntegerValue = CFPreferencesGetAppIntegerValue(CFSTR("enableRxDecodeYUVDump"), CFSTR("com.apple.VideoConference"), &keyExistsAndHasValidFormat);
  if (!keyExistsAndHasValidFormat)
    return 0;
  v4 = AppIntegerValue;
  ErrorLogLevelForModule = VRTraceGetErrorLogLevelForModule();
  if (v4 > 2)
  {
    if (ErrorLogLevelForModule >= 6)
    {
      v8 = VRTraceErrorLogLevelToCSTR();
      v9 = *MEMORY[0x1E0CF2758];
      v10 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT);
      result = 0;
      if (!v10)
        return result;
      *(_DWORD *)buf = 136315906;
      v13 = v8;
      v14 = 2080;
      v15 = "-[VCDefaults enableRxDecodeYUVDump]";
      v16 = 1024;
      v17 = 385;
      v18 = 1024;
      v19 = v4;
      _os_log_impl(&dword_1D8A54000, v9, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d VideoConferenceDefaults: Found enableRxDecodeYUVDump but the value[%d] is invalid (should be 1 or 2)", buf, 0x22u);
    }
    return 0;
  }
  if (ErrorLogLevelForModule >= 6)
  {
    v6 = VRTraceErrorLogLevelToCSTR();
    v7 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315906;
      v13 = v6;
      v14 = 2080;
      v15 = "-[VCDefaults enableRxDecodeYUVDump]";
      v16 = 1024;
      v17 = 382;
      v18 = 1024;
      v19 = v4;
      _os_log_impl(&dword_1D8A54000, v7, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d VideoConferenceDefaults: Found enableRxDecodeYUVDump set to %d", buf, 0x22u);
    }
  }
  return v4;
}

- (BOOL)enableVPBLogging
{
  return +[VCDefaults BOOLeanValueForKey:](VCDefaults, "BOOLeanValueForKey:", CFSTR("enableVPBLogging"));
}

- (BOOL)enableRecvBitstreamDump
{
  return +[VCDefaults BOOLeanValueForKey:](VCDefaults, "BOOLeanValueForKey:", CFSTR("enableRecvBitstreamDump"));
}

- (int)enableTxSourceYuvDump
{
  int result;
  CFIndex AppIntegerValue;
  unint64_t v4;
  int ErrorLogLevelForModule;
  uint64_t v6;
  NSObject *v7;
  uint64_t v8;
  NSObject *v9;
  _BOOL4 v10;
  Boolean keyExistsAndHasValidFormat;
  uint8_t buf[4];
  uint64_t v13;
  __int16 v14;
  const char *v15;
  __int16 v16;
  int v17;
  __int16 v18;
  int v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  result = VRTraceIsInternalOSInstalled();
  if (!result)
    return result;
  keyExistsAndHasValidFormat = -86;
  AppIntegerValue = CFPreferencesGetAppIntegerValue(CFSTR("enableTxSourceYuvDump"), CFSTR("com.apple.VideoConference"), &keyExistsAndHasValidFormat);
  if (!keyExistsAndHasValidFormat)
    return 0;
  v4 = AppIntegerValue;
  ErrorLogLevelForModule = VRTraceGetErrorLogLevelForModule();
  if (v4 > 2)
  {
    if (ErrorLogLevelForModule >= 6)
    {
      v8 = VRTraceErrorLogLevelToCSTR();
      v9 = *MEMORY[0x1E0CF2758];
      v10 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT);
      result = 0;
      if (!v10)
        return result;
      *(_DWORD *)buf = 136315906;
      v13 = v8;
      v14 = 2080;
      v15 = "-[VCDefaults enableTxSourceYuvDump]";
      v16 = 1024;
      v17 = 412;
      v18 = 1024;
      v19 = v4;
      _os_log_impl(&dword_1D8A54000, v9, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d VideoConferenceDefaults: Found enableTxSourceYuvDump but the value[%d] is invalid (should be 1 or 2)", buf, 0x22u);
    }
    return 0;
  }
  if (ErrorLogLevelForModule >= 6)
  {
    v6 = VRTraceErrorLogLevelToCSTR();
    v7 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315906;
      v13 = v6;
      v14 = 2080;
      v15 = "-[VCDefaults enableTxSourceYuvDump]";
      v16 = 1024;
      v17 = 409;
      v18 = 1024;
      v19 = v4;
      _os_log_impl(&dword_1D8A54000, v7, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d VideoConferenceDefaults: Found enableTxSourceYuvDump set to %d", buf, 0x22u);
    }
  }
  return v4;
}

- (BOOL)enableTxBitstreamDump
{
  int IsInternalOSInstalled;

  IsInternalOSInstalled = VRTraceIsInternalOSInstalled();
  if (IsInternalOSInstalled)
    LOBYTE(IsInternalOSInstalled) = +[VCDefaults BOOLeanValueForKey:](VCDefaults, "BOOLeanValueForKey:", CFSTR("enableTxBitstreamDump"));
  return IsInternalOSInstalled;
}

- (BOOL)enablePacketLogging
{
  return +[VCDefaults BOOLeanValueForKey:](VCDefaults, "BOOLeanValueForKey:", CFSTR("enablePacketLogging"));
}

- (int)extraPayloads
{
  return VCDefaults_GetIntValueForKey(CFSTR("extraPL"), 0) & 3;
}

- (BOOL)enableTxTimestampAlignmentLogs
{
  int IsInternalOSInstalled;

  IsInternalOSInstalled = VRTraceIsInternalOSInstalled();
  if (IsInternalOSInstalled)
    LOBYTE(IsInternalOSInstalled) = +[VCDefaults BOOLeanValueForKey:](VCDefaults, "BOOLeanValueForKey:", CFSTR("enableTxTimestampAlignmentLogs"));
  return IsInternalOSInstalled;
}

- (BOOL)isTransmitterTestVerificationEnabled
{
  return +[VCDefaults BOOLeanValueForKey:defaultValue:](VCDefaults, "BOOLeanValueForKey:defaultValue:", CFSTR("enableTransmitterTestVerification"), 0);
}

- (BOOL)isReceiverTestVerificationEnabled
{
  return +[VCDefaults BOOLeanValueForKey:defaultValue:](VCDefaults, "BOOLeanValueForKey:defaultValue:", CFSTR("enableReceiverTestVerification"), 0);
}

- (int)encodingScore
{
  return VCDefaults_GetIntValueForKey(CFSTR("encodingScore"), 0);
}

- (BOOL)canDecodeHD
{
  return +[VCDefaults BOOLeanValueForKey:](VCDefaults, "BOOLeanValueForKey:", CFSTR("canDecodeHD"));
}

- (BOOL)disableVAD
{
  return +[VCDefaults BOOLeanValueForKey:](VCDefaults, "BOOLeanValueForKey:", CFSTR("disableVAD"));
}

- (int)bundleAudio
{
  CFIndex AppIntegerValue;
  int v3;
  unint64_t v4;
  int ErrorLogLevelForModule;
  uint64_t v6;
  NSObject *v7;
  int result;
  uint64_t v9;
  NSObject *v10;
  _BOOL4 v11;
  Boolean keyExistsAndHasValidFormat;
  uint8_t buf[4];
  uint64_t v14;
  __int16 v15;
  const char *v16;
  __int16 v17;
  int v18;
  __int16 v19;
  int v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  keyExistsAndHasValidFormat = -86;
  AppIntegerValue = CFPreferencesGetAppIntegerValue(CFSTR("bundleAudio"), CFSTR("com.apple.VideoConference"), &keyExistsAndHasValidFormat);
  if (!keyExistsAndHasValidFormat)
    return 0;
  v3 = AppIntegerValue;
  v4 = AppIntegerValue - 1;
  ErrorLogLevelForModule = VRTraceGetErrorLogLevelForModule();
  if (v4 > 9)
  {
    if (ErrorLogLevelForModule >= 6)
    {
      v9 = VRTraceErrorLogLevelToCSTR();
      v10 = *MEMORY[0x1E0CF2758];
      v11 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT);
      result = 0;
      if (!v11)
        return result;
      *(_DWORD *)buf = 136315906;
      v14 = v9;
      v15 = 2080;
      v16 = "-[VCDefaults bundleAudio]";
      v17 = 1024;
      v18 = 477;
      v19 = 1024;
      v20 = v3;
      _os_log_impl(&dword_1D8A54000, v10, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d VideoConferenceDefaults: Found bundleAudio but the value[%d] is invalid (should be 1-10)", buf, 0x22u);
    }
    return 0;
  }
  if (ErrorLogLevelForModule >= 6)
  {
    v6 = VRTraceErrorLogLevelToCSTR();
    v7 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315906;
      v14 = v6;
      v15 = 2080;
      v16 = "-[VCDefaults bundleAudio]";
      v17 = 1024;
      v18 = 474;
      v19 = 1024;
      v20 = v3;
      _os_log_impl(&dword_1D8A54000, v7, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d VideoConferenceDefaults: Found bundleAudio. Bundling %d audio packets", buf, 0x22u);
    }
  }
  return v3;
}

- (BOOL)audioRecordingEnabled
{
  BOOL result;
  int AppBooleanValue;
  const __CFString *v5;
  uint64_t v6;
  NSObject *v7;
  const char *v8;
  NSObject *v9;
  uint32_t v10;
  uint64_t v11;
  NSObject *v12;
  Boolean keyExistsAndHasValidFormat;
  uint8_t buf[4];
  uint64_t v15;
  __int16 v16;
  const char *v17;
  __int16 v18;
  int v19;
  __int16 v20;
  _BYTE v21[10];
  VCDefaults *v22;
  __int16 v23;
  int v24;
  __int16 v25;
  int v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  if (audioRecordingEnabled_hasChecked == 1)
    return audioRecordingEnabled_isAudioRecordingEnabled != 0;
  keyExistsAndHasValidFormat = -86;
  AppBooleanValue = CFPreferencesGetAppBooleanValue(CFSTR("AllowAudioRecording"), CFSTR("com.apple.facetime"), &keyExistsAndHasValidFormat);
  if (keyExistsAndHasValidFormat)
  {
    if ((VCDefaults *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() < 7)
        goto LABEL_15;
      v6 = VRTraceErrorLogLevelToCSTR();
      v7 = *MEMORY[0x1E0CF2758];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        goto LABEL_15;
      *(_DWORD *)buf = 136316162;
      v15 = v6;
      v16 = 2080;
      v17 = "-[VCDefaults audioRecordingEnabled]";
      v18 = 1024;
      v19 = 494;
      v20 = 1024;
      *(_DWORD *)v21 = AppBooleanValue;
      *(_WORD *)&v21[4] = 1024;
      *(_DWORD *)&v21[6] = keyExistsAndHasValidFormat;
      v8 = " [%s] %s:%d allowAudioRecording: %d keyExists: %d";
      v9 = v7;
      v10 = 40;
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v5 = (const __CFString *)-[VCDefaults performSelector:](self, "performSelector:", sel_logPrefix);
      else
        v5 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() < 7)
        goto LABEL_15;
      v11 = VRTraceErrorLogLevelToCSTR();
      v12 = *MEMORY[0x1E0CF2758];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        goto LABEL_15;
      *(_DWORD *)buf = 136316674;
      v15 = v11;
      v16 = 2080;
      v17 = "-[VCDefaults audioRecordingEnabled]";
      v18 = 1024;
      v19 = 494;
      v20 = 2112;
      *(_QWORD *)v21 = v5;
      *(_WORD *)&v21[8] = 2048;
      v22 = self;
      v23 = 1024;
      v24 = AppBooleanValue;
      v25 = 1024;
      v26 = keyExistsAndHasValidFormat;
      v8 = " [%s] %s:%d %@(%p) allowAudioRecording: %d keyExists: %d";
      v9 = v12;
      v10 = 60;
    }
    _os_log_impl(&dword_1D8A54000, v9, OS_LOG_TYPE_DEFAULT, v8, buf, v10);
LABEL_15:
    CFPreferencesSetAppValue(CFSTR("AllowAudioRecording"), 0, CFSTR("com.apple.facetime"));
    CFPreferencesAppSynchronize(CFSTR("com.apple.facetime"));
  }
  result = 1;
  if (!AppBooleanValue)
    result = VRTraceIsInternalOSInstalled();
  audioRecordingEnabled_isAudioRecordingEnabled = result;
  audioRecordingEnabled_hasChecked = 1;
  return result;
}

- (int)forceAudioPayload
{
  return VCDefaults_GetIntValueForKey(CFSTR("forceAudioPayload"), 128);
}

- (int)forceAudioBitrate
{
  return VCDefaults_GetIntValueForKey(CFSTR("forceAudioBitrate"), 0);
}

- (int)forceAudioPacketsPerBundle
{
  return VCDefaults_GetIntValueForKey(CFSTR("forceAudioPacketsPerBundle"), 0);
}

- (int)forceAudioHardwareSampleRate
{
  return VCDefaults_GetIntValueForKey(CFSTR("forceHWAudioSampleRate"), 0);
}

- (float)forceAudioPowerThreshold
{
  return VCDefaults_GetDoubleValueForKey(CFSTR("audioPowerThreshold"), -120.0);
}

- (int)forceAudioPowerTimeInterval
{
  return VCDefaults_GetIntValueForKey(CFSTR("audioPowerTimeInterval"), 0);
}

- (BOOL)forceUseFloat
{
  return +[VCDefaults BOOLeanValueForKey:](VCDefaults, "BOOLeanValueForKey:", CFSTR("forceUseFloat"));
}

- (int)forceAudioChannelCount
{
  return VCDefaults_GetIntValueForKey(CFSTR("audioChannelCount"), 0);
}

- (BOOL)forceDisableAudioPowerSpectrumRegister
{
  return +[VCDefaults BOOLeanValueForKey:](VCDefaults, "BOOLeanValueForKey:", CFSTR("disableAudioPowerSpectrumRegister"));
}

- (BOOL)disableRed
{
  return +[VCDefaults BOOLeanValueForKey:](VCDefaults, "BOOLeanValueForKey:", CFSTR("disableRed"));
}

- (int)forceRedNumPayloads
{
  return VCDefaults_GetIntValueForKey(CFSTR("forceRedNumPayloads"), 0);
}

- (int)forceRedMaxDelay
{
  return VCDefaults_GetIntValueForKey(CFSTR("forceRedMaxDelay"), 0);
}

- (BOOL)useSBR
{
  return +[VCDefaults BOOLeanValueForKey:defaultValue:](VCDefaults, "BOOLeanValueForKey:defaultValue:", CFSTR("useSBR"), 1);
}

- (unsigned)aacBlockSize
{
  return VCDefaults_GetIntValueForKey(CFSTR("forceAACELDFrames"), 480);
}

- (int)forceVideoStreamResolution
{
  return VCDefaults_GetIntValueForKey(CFSTR("forceVideoStreamResolution"), 0xFFFFFFFFLL);
}

- (int)forceVideoStreamTxMaxBitrate
{
  return VCDefaults_GetIntValueForKey(CFSTR("forceVideoStreamTxMaxBitrate"), 0);
}

- (int)forceVideoStreamTxMinBitrate
{
  return VCDefaults_GetIntValueForKey(CFSTR("forceVideoStreamTxMinBitrate"), 0);
}

- (int)forceVideoStreamFramerate
{
  return VCDefaults_GetIntValueForKey(CFSTR("forceVideoStreamFramerate"), 0);
}

- (int)forceVideoStreamKeyFrameInterval
{
  return VCDefaults_GetIntValueForKey(CFSTR("forceVideoStreamKeyFrameInterval"), 0);
}

- (int)forceVideoStreamRxMaxBitrate
{
  return VCDefaults_GetIntValueForKey(CFSTR("forceVideoStreamRxMaxBitrate"), 0);
}

- (int)forceVideoStreamRxMinBitrate
{
  return VCDefaults_GetIntValueForKey(CFSTR("forceVideoStreamRxMinBitrate"), 0);
}

- (BOOL)forceVideoStreamDisableBitrateCap
{
  return +[VCDefaults BOOLeanValueForKey:](VCDefaults, "BOOLeanValueForKey:", CFSTR("forceVideoStreamDisableBitrateCap"));
}

- (int)forceVideoStreamPayload
{
  return +[VCDefaults integerValueForKey:](VCDefaults, "integerValueForKey:", CFSTR("forceVideoStreamPayload"));
}

- (BOOL)forceVideoStreamLowLatency
{
  return +[VCDefaults BOOLeanValueForKey:](VCDefaults, "BOOLeanValueForKey:", CFSTR("forceVideoStreamLowLatency"));
}

- (BOOL)enableHEIFAndHEVCForMoments
{
  return +[VCDefaults BOOLeanValueForKey:defaultValue:](VCDefaults, "BOOLeanValueForKey:defaultValue:", CFSTR("enableHEIFAndHEVCForMoments"), 1);
}

- (BOOL)videoStreamRateControlDumpEnabled
{
  return +[VCDefaults BOOLeanValueForKey:defaultValue:](VCDefaults, "BOOLeanValueForKey:defaultValue:", CFSTR("videoStreamRateControlDumpEnabled"), 1);
}

- (int)videoStreamRateControlAlgorithm
{
  return VCDefaults_GetIntValueForKey(CFSTR("videoStreamRateControlAlgorithm"), 0xFFFFFFFFLL);
}

- (BOOL)forceDisableMediaQueue
{
  return +[VCDefaults BOOLeanValueForKey:](VCDefaults, "BOOLeanValueForKey:", CFSTR("forceDisableMediaQueue"));
}

- (BOOL)mediaQueueDumpEnabled
{
  return +[VCDefaults BOOLeanValueForKey:defaultValue:](VCDefaults, "BOOLeanValueForKey:defaultValue:", CFSTR("enableMediaQueueDump"), VRTraceIsInternalOSInstalled());
}

- (int)rateControllerType
{
  return +[VCDefaults integerValueForKey:defaultValue:](VCDefaults, "integerValueForKey:defaultValue:", CFSTR("rateControllerType"), 0);
}

- (int)rateControlStatisticsQueueWaitTime
{
  return +[VCDefaults integerValueForKey:defaultValue:](VCDefaults, "integerValueForKey:defaultValue:", CFSTR("rateControlStatisticsQueueWaitTime"), 0);
}

- (BOOL)bandwidthEstimationDumpEnabled
{
  return +[VCDefaults BOOLeanValueForKey:defaultValue:](VCDefaults, "BOOLeanValueForKey:defaultValue:", CFSTR("enableBWEDump"), 0);
}

- (BOOL)rateControlDumpEnabled
{
  uint64_t IsSeedOSInstalled;

  if ((VRTraceIsInternalOSInstalled() & 1) != 0)
    IsSeedOSInstalled = 1;
  else
    IsSeedOSInstalled = VRTraceIsSeedOSInstalled();
  return +[VCDefaults BOOLeanValueForKey:defaultValue:](VCDefaults, "BOOLeanValueForKey:defaultValue:", CFSTR("enableTFRCDump"), IsSeedOSInstalled);
}

- (BOOL)rateControlLogEnabled
{
  return +[VCDefaults BOOLeanValueForKey:](VCDefaults, "BOOLeanValueForKey:", CFSTR("enableTFRCLog"));
}

- (BOOL)rateControlAllowVideoStop
{
  return +[VCDefaults BOOLeanValueForKey:defaultValue:](VCDefaults, "BOOLeanValueForKey:defaultValue:", CFSTR("rateControlAllowVideoStop"), 0);
}

- (BOOL)rateControlAllowBurstyLossRampDown
{
  return +[VCDefaults BOOLeanValueForKey:defaultValue:](VCDefaults, "BOOLeanValueForKey:defaultValue:", CFSTR("rateControlAllowBurstyLossRampDown"), 1);
}

- (int)rateControlForceTxCap
{
  uint64_t ForcedCapBitrate;

  ForcedCapBitrate = VCTestMonitorManager_GetForcedCapBitrate();
  return VCDefaults_GetIntValueForKey(CFSTR("forcedTxCap"), ForcedCapBitrate);
}

- (int)rateControlForceRxCap
{
  return +[VCDefaults integerValueForKey:defaultValue:](VCDefaults, "integerValueForKey:defaultValue:", CFSTR("forcedRxCap"), (int)VCTestMonitorManager_GetForcedTargetBitrate());
}

- (int)rateControlForceTxRate
{
  uint64_t ForcedTargetBitrate;

  ForcedTargetBitrate = VCTestMonitorManager_GetForcedTargetBitrate();
  return VCDefaults_GetIntValueForKey(CFSTR("forcedTxRate"), ForcedTargetBitrate);
}

- (int)rateControlForceRxRate
{
  uint64_t ForcedTargetBitrate;

  ForcedTargetBitrate = VCTestMonitorManager_GetForcedTargetBitrate();
  return VCDefaults_GetIntValueForKey(CFSTR("forcedRxRate"), ForcedTargetBitrate);
}

- (int)rateControlBasebandSlowDownFactor
{
  return VCDefaults_GetIntValueForKey(CFSTR("basebandSlowDownFactor"), 3);
}

- (int)packetExpirationTime
{
  return +[VCDefaults integerValueForKey:defaultValue:](VCDefaults, "integerValueForKey:defaultValue:", CFSTR("forcePacketExpirationTime"), -1);
}

- (int)redundancyControlForceVideoRedundancyPercentage
{
  return +[VCDefaults integerValueForKey:defaultValue:](VCDefaults, "integerValueForKey:defaultValue:", CFSTR("forceVideoRedundancyPercentage"), -1);
}

- (int)max2GRate
{
  int IntValueForKey;
  int v4;

  IntValueForKey = VCDefaults_GetIntValueForKey(CFSTR("max2GRate"), 0xFFFFFFFFLL);
  if (IntValueForKey >= 229 || IntValueForKey == 0)
    v4 = 100;
  else
    v4 = IntValueForKey;
  if (IntValueForKey >= 0)
    return v4;
  else
    return 0;
}

- (BOOL)forceIPv6
{
  return +[VCDefaults BOOLeanValueForKey:](VCDefaults, "BOOLeanValueForKey:", CFSTR("forceIPv6"));
}

- (int)enableiRATSuggestion
{
  return VCDefaults_GetIntValueForKey(CFSTR("enableiRATSuggestion"), 0xFFFFFFFFLL);
}

- (int)localWRMLinkType
{
  unint64_t AppIntegerValue;
  Boolean keyExistsAndHasValidFormat;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  keyExistsAndHasValidFormat = -86;
  AppIntegerValue = CFPreferencesGetAppIntegerValue(CFSTR("localWRMLinkType"), CFSTR("com.apple.VideoConference"), &keyExistsAndHasValidFormat);
  if (AppIntegerValue >= 2 || keyExistsAndHasValidFormat == 0)
    LODWORD(AppIntegerValue) = -1;
  return AppIntegerValue;
}

- (int)localRATTypeOverride
{
  return VCDefaults_GetIntValueForKey(CFSTR("localRATTypeOverride"), 0xFFFFFFFFLL);
}

- (BOOL)enableGFTStatsReporting
{
  return +[VCDefaults BOOLeanValueForKey:defaultValue:](VCDefaults, "BOOLeanValueForKey:defaultValue:", CFSTR("enableGFTStatsReporting"), 0);
}

- (BOOL)enableGFTStatsReceiveThread
{
  return +[VCDefaults BOOLeanValueForKey:defaultValue:](VCDefaults, "BOOLeanValueForKey:defaultValue:", CFSTR("enableGFTStatsReceiveThread"), 0);
}

- (float)pauseHeartbeatInterval
{
  return (float)(int)VCDefaults_GetIntValueForKey(CFSTR("pauseHeartbeatInterval"), 2);
}

- (BOOL)shouldDisplayVideoInfoLayer
{
  int IsInternalOSInstalled;

  IsInternalOSInstalled = VRTraceIsInternalOSInstalled();
  if (IsInternalOSInstalled)
    LOBYTE(IsInternalOSInstalled) = _VCDefaults_GetBoolValueForKey(CFSTR("shouldDisplayVideoInfoLayer"), 0, 1);
  return IsInternalOSInstalled;
}

- (BOOL)forceWifiAssist
{
  return +[VCDefaults BOOLeanValueForKey:](VCDefaults, "BOOLeanValueForKey:", CFSTR("forceWiFiAssist"));
}

- (BOOL)forceWifiAssistOutOfBudget
{
  return +[VCDefaults BOOLeanValueForKey:](VCDefaults, "BOOLeanValueForKey:", CFSTR("kVCDefaultForceWiFiAssistOutOfBudget"));
}

- (BOOL)momentsUserPreferenceEnabled
{
  return +[VCDefaults BOOLeanValueForKey:defaultValue:](VCDefaults, "BOOLeanValueForKey:defaultValue:", CFSTR("FaceTimePhotosEnabled"), 1);
}

- (BOOL)momentsUseBestVideoRule
{
  return +[VCDefaults BOOLeanValueForKey:defaultValue:](VCDefaults, "BOOLeanValueForKey:defaultValue:", CFSTR("FaceTimePhotosUseBestVideoRule"), 1);
}

- (BOOL)dumpMediaBlob
{
  return +[VCDefaults BOOLeanValueForKey:](VCDefaults, "BOOLeanValueForKey:", CFSTR("dumpMediaBlob"));
}

- (BOOL)forceOneToOneMode
{
  return +[VCDefaults BOOLeanValueForKey:defaultValue:](VCDefaults, "BOOLeanValueForKey:defaultValue:", CFSTR("ForceOneToOneMode"), 0);
}

- (BOOL)supportsOneToOneMode
{
  if (+[VCDefaults BOOLeanValueForKey:defaultValue:](VCDefaults, "BOOLeanValueForKey:defaultValue:", CFSTR("SupportsOneToOneMode"), 0))
  {
    return 1;
  }
  else
  {
    return _os_feature_enabled_impl();
  }
}

- (unsigned)maxActiveVideoEncoders
{
  return VCDefaults_GetIntValueForKey(CFSTR("MaxActiveVideoEncoders"), 0xFFFFFFFFLL);
}

- (unsigned)maxActiveVideoDecoders
{
  return VCDefaults_GetIntValueForKey(CFSTR("MaxActiveVideoDecoders"), 0xFFFFFFFFLL);
}

- (BOOL)forceEVSWideBand
{
  return +[VCDefaults BOOLeanValueForKey:](VCDefaults, "BOOLeanValueForKey:", CFSTR("ForceEVSWideBand"));
}

- (BOOL)forceMuteAtStart
{
  return +[VCDefaults BOOLeanValueForKey:](VCDefaults, "BOOLeanValueForKey:", CFSTR("forceMuteAtStart"));
}

- (unsigned)minParticipantCountSendVoiceActiveOnly
{
  return VCDefaults_GetIntValueForKey(CFSTR("minParticipantCountSendVoiceActiveOnly"), 3);
}

- (unsigned)forceVisibilityIndex
{
  return +[VCDefaults integerValueForKey:defaultValue:](VCDefaults, "integerValueForKey:defaultValue:", CFSTR("forceVisibilityIndex"), 0xFFFFFFFFLL);
}

- (BOOL)forceFECRepairStream
{
  return +[VCDefaults BOOLeanValueForKey:](VCDefaults, "BOOLeanValueForKey:", CFSTR("forceFECRepairStream"));
}

- (BOOL)enableAudioDumpParticipantRemote:(BOOL)a3
{
  return +[VCDefaults BOOLeanValueForKey:defaultValue:](VCDefaults, "BOOLeanValueForKey:defaultValue:", CFSTR("enableAudioDumpParticipantRemote"), a3);
}

- (BOOL)enableAudioDumpParticipantLocal:(BOOL)a3
{
  return +[VCDefaults BOOLeanValueForKey:defaultValue:](VCDefaults, "BOOLeanValueForKey:defaultValue:", CFSTR("enableAudioDumpParticipantLocal"), a3);
}

- (BOOL)forceDisableMediaPriority
{
  return +[VCDefaults BOOLeanValueForKey:](VCDefaults, "BOOLeanValueForKey:", CFSTR("forceDisableMediaPriority"));
}

- (unsigned)audioPriorityDecaySlow
{
  return VCDefaults_GetIntValueForKey(CFSTR("audioPriorityDecaySlow"), 20);
}

- (unsigned)audioPriorityDecayFast
{
  return VCDefaults_GetIntValueForKey(CFSTR("audioPriorityDecayFast"), 50);
}

- (unsigned)audioPriorityRampUpSpeed
{
  return VCDefaults_GetIntValueForKey(CFSTR("audioPriorityRampUp"), 50);
}

- (float)audioVoiceDetectionSensitivity
{
  return (float)(int)VCDefaults_GetIntValueForKey(CFSTR("audioVoiceDetectionSensitivity"), 6);
}

- (unsigned)silenceLevelMovingAveragePeriod
{
  return VCDefaults_GetIntValueForKey(CFSTR("silenceLevelMovingAveragePeriod"), 10);
}

- (unsigned)forceAudioPriorityValue
{
  CFIndex AppIntegerValue;
  int v3;
  uint64_t v4;
  NSObject *v5;
  Boolean keyExistsAndHasValidFormat;
  uint8_t buf[4];
  uint64_t v9;
  __int16 v10;
  const char *v11;
  __int16 v12;
  int v13;
  __int16 v14;
  const __CFString *v15;
  __int16 v16;
  int v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  keyExistsAndHasValidFormat = -86;
  AppIntegerValue = CFPreferencesGetAppIntegerValue(CFSTR("forceAudioPriorityValue"), CFSTR("com.apple.VideoConference"), &keyExistsAndHasValidFormat);
  if (keyExistsAndHasValidFormat)
  {
    if ((unint64_t)(AppIntegerValue - 256) >= 0xFFFFFFFFFFFFFF01)
      v3 = AppIntegerValue;
    else
      v3 = 0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v4 = VRTraceErrorLogLevelToCSTR();
      v5 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136316162;
        v9 = v4;
        v10 = 2080;
        v11 = "-[VCDefaults forceAudioPriorityValue]";
        v12 = 1024;
        v13 = 858;
        v14 = 2112;
        v15 = CFSTR("forceAudioPriorityValue");
        v16 = 1024;
        v17 = v3;
        _os_log_impl(&dword_1D8A54000, v5, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d VideoConferenceDefaults: %@=%d", buf, 0x2Cu);
      }
    }
  }
  else
  {
    LOBYTE(v3) = 0;
  }
  return v3;
}

- (BOOL)forceAudioPriorityEnabled
{
  return +[VCDefaults BOOLeanValueForKey:](VCDefaults, "BOOLeanValueForKey:", CFSTR("forceAudioPriorityEnabled"));
}

- (unsigned)multiwayAudioNetworkBitrateCapWifi
{
  return VCDefaults_GetIntValueForKey(CFSTR("multiwayAudioNetworkBitrateCapWifi"), 0xFFFFFFFFLL);
}

- (unsigned)multiwayAudioNetworkBitrateCapCellular
{
  return VCDefaults_GetIntValueForKey(CFSTR("multiwayAudioNetworkBitrateCapCellular"), 0xFFFFFFFFLL);
}

- (BOOL)forceDisableFaceZoom
{
  return +[VCDefaults BOOLeanValueForKey:defaultValue:](VCDefaults, "BOOLeanValueForKey:defaultValue:", CFSTR("forceDisableFaceZoom"), 1);
}

- (BOOL)forceDisableEffectsHealthCheck
{
  return +[VCDefaults BOOLeanValueForKey:](VCDefaults, "BOOLeanValueForKey:", CFSTR("forceDisableEffectsHealthCheck"));
}

- (BOOL)forceDisableVideoDegraded
{
  return +[VCDefaults BOOLeanValueForKey:](VCDefaults, "BOOLeanValueForKey:", CFSTR("forceDisableVideoDegraded"));
}

- (BOOL)forceDisableMediaStalled
{
  return +[VCDefaults BOOLeanValueForKey:](VCDefaults, "BOOLeanValueForKey:", CFSTR("forceDisableMediaStalled"));
}

- (BOOL)shouldOverrideEffectsFramerate:(unsigned int *)a3
{
  unsigned int AppIntegerValue;
  int v5;
  unsigned int v6;
  uint64_t v7;
  NSObject *v8;
  Boolean keyExistsAndHasValidFormat;
  uint8_t buf[4];
  uint64_t v12;
  __int16 v13;
  const char *v14;
  __int16 v15;
  int v16;
  __int16 v17;
  const __CFString *v18;
  __int16 v19;
  unsigned int v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  keyExistsAndHasValidFormat = -86;
  AppIntegerValue = CFPreferencesGetAppIntegerValue(CFSTR("effectsFrameRate"), CFSTR("com.apple.VideoConference"), &keyExistsAndHasValidFormat);
  v5 = keyExistsAndHasValidFormat;
  if (a3 && keyExistsAndHasValidFormat)
  {
    v6 = AppIntegerValue;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v7 = VRTraceErrorLogLevelToCSTR();
      v8 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136316162;
        v12 = v7;
        v13 = 2080;
        v14 = "-[VCDefaults shouldOverrideEffectsFramerate:]";
        v15 = 1024;
        v16 = 904;
        v17 = 2112;
        v18 = CFSTR("effectsFrameRate");
        v19 = 1024;
        v20 = v6;
        _os_log_impl(&dword_1D8A54000, v8, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d VideoConferenceDefaults: %@=%d", buf, 0x2Cu);
      }
    }
    *a3 = v6;
    v5 = keyExistsAndHasValidFormat;
  }
  return v5 != 0;
}

- (BOOL)forceDisableMediaEncryption
{
  int IsInternalOSInstalled;

  IsInternalOSInstalled = VRTraceIsInternalOSInstalled();
  if (IsInternalOSInstalled)
    LOBYTE(IsInternalOSInstalled) = +[VCDefaults BOOLeanValueForKey:](VCDefaults, "BOOLeanValueForKey:", CFSTR("forceDisableMediaEncryption"));
  return IsInternalOSInstalled;
}

- (BOOL)forceDisableMessageEncryption
{
  int IsInternalOSInstalled;

  IsInternalOSInstalled = VRTraceIsInternalOSInstalled();
  if (IsInternalOSInstalled)
    LOBYTE(IsInternalOSInstalled) = +[VCDefaults BOOLeanValueForKey:](VCDefaults, "BOOLeanValueForKey:", CFSTR("forceDisableMessageEncryption"));
  return IsInternalOSInstalled;
}

- (BOOL)forceDisableReporting
{
  return +[VCDefaults BOOLeanValueForKey:](VCDefaults, "BOOLeanValueForKey:", CFSTR("forceDisableReporting"));
}

- (BOOL)forceUseAvconferenced
{
  return +[VCDefaults BOOLeanValueForKey:](VCDefaults, "BOOLeanValueForKey:", CFSTR("useAvconferenced"));
}

- (BOOL)forceDisableSSRCCollisionDetection
{
  int IsInternalOSInstalled;

  IsInternalOSInstalled = VRTraceIsInternalOSInstalled();
  if (IsInternalOSInstalled)
    LOBYTE(IsInternalOSInstalled) = +[VCDefaults BOOLeanValueForKey:](VCDefaults, "BOOLeanValueForKey:", CFSTR("forceDisableSSRCCollisionDetection"));
  return IsInternalOSInstalled;
}

- (unsigned)cannedVideoPacketMode
{
  return +[VCDefaults integerValueForKey:defaultValue:](VCDefaults, "integerValueForKey:defaultValue:", CFSTR("cannedVideoPacketMode"), 0);
}

- (BOOL)useCannedVideoPackets
{
  return -[VCDefaults cannedVideoPacketMode](self, "cannedVideoPacketMode") != 0;
}

- (unsigned)prominenceActiveProbabilityThreshold
{
  unsigned int AppBooleanValue;
  unsigned int v3;
  uint64_t v4;
  NSObject *v5;
  Boolean keyExistsAndHasValidFormat;
  uint8_t buf[4];
  uint64_t v9;
  __int16 v10;
  const char *v11;
  __int16 v12;
  int v13;
  __int16 v14;
  const __CFString *v15;
  __int16 v16;
  unsigned int v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  keyExistsAndHasValidFormat = -86;
  AppBooleanValue = CFPreferencesGetAppBooleanValue(CFSTR("prominenceActiveProbabilityThreshold"), CFSTR("com.apple.VideoConference"), &keyExistsAndHasValidFormat);
  if (!keyExistsAndHasValidFormat)
    return 127;
  v3 = AppBooleanValue;
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v4 = VRTraceErrorLogLevelToCSTR();
    v5 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316162;
      v9 = v4;
      v10 = 2080;
      v11 = "-[VCDefaults prominenceActiveProbabilityThreshold]";
      v12 = 1024;
      v13 = 972;
      v14 = 2112;
      v15 = CFSTR("prominenceActiveProbabilityThreshold");
      v16 = 1024;
      v17 = v3;
      _os_log_impl(&dword_1D8A54000, v5, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d VideoConferenceDefaults: %@=%u", buf, 0x2Cu);
    }
  }
  return v3;
}

- (unsigned)prominenceActiveAccumulationThreshold
{
  return VCDefaults_GetIntValueForKey(CFSTR("prominenceActiveAccumulationThreshold"), 15);
}

- (unsigned)prominenceInactiveProbabilityThreshold
{
  return VCDefaults_GetIntValueForKey(CFSTR("prominenceInactiveProbabilityThreshold"), 128);
}

- (unsigned)prominenceInactiveAccumulationThreshold
{
  return VCDefaults_GetIntValueForKey(CFSTR("prominenceInactiveAccumulationThreshold"), 50);
}

- (double)remoteMediaStallTimeout
{
  return VCDefaults_GetDoubleValueForKey(CFSTR("remoteMediaStallTimeout"), 5.0);
}

- (BOOL)forceUseInternalRTPThreadingWithDefaultValue:(BOOL)a3
{
  return +[VCDefaults BOOLeanValueForKey:defaultValue:](VCDefaults, "BOOLeanValueForKey:defaultValue:", CFSTR("forceUseInternalRTPThreading"), a3);
}

- (BOOL)forceEnableAudioHALPluginMockInput
{
  return +[VCDefaults BOOLeanValueForKey:](VCDefaults, "BOOLeanValueForKey:", CFSTR("forceEnableAudioHALPluginMockInput"));
}

- (BOOL)startAudioHALPluginNullDevice
{
  return +[VCDefaults BOOLeanValueForKey:](VCDefaults, "BOOLeanValueForKey:", CFSTR("startAudioHALPluginNullDevice"));
}

- (BOOL)startAirPlayAudioHALPluginNullDevice
{
  return +[VCDefaults BOOLeanValueForKey:](VCDefaults, "BOOLeanValueForKey:", CFSTR("startAirPlayAudioHALPluginNullDevice"));
}

+ (BOOL)forceEnableScreenVirtualDisplayLabel
{
  return +[VCDefaults BOOLeanValueForKey:](VCDefaults, "BOOLeanValueForKey:", CFSTR("forceEnableScreenVirtualDisplayLabel"));
}

+ (id)screenVirtualDisplayLabelName
{
  CFTypeID TypeID;

  TypeID = CFStringGetTypeID();
  return (id)(id)VCDefaults_CopyValueForKey(CFSTR("screenVirtualDisplayLabelName"), TypeID);
}

+ (BOOL)enableAudioHALPluginCaptureSource
{
  return +[VCDefaults BOOLeanValueForKey:](VCDefaults, "BOOLeanValueForKey:", CFSTR("enableAudioHALPluginCaptureSource"));
}

- (BOOL)isFECVersion2Enabled
{
  return self->_isFECVersion2Enabled;
}

- (BOOL)forceWiFiAssist
{
  return self->_forceWiFiAssist;
}

- (BOOL)forceWiFiAssistOutOfBudget
{
  return self->_forceWiFiAssistOutOfBudget;
}

@end
