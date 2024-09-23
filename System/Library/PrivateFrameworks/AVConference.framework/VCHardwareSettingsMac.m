@implementation VCHardwareSettingsMac

- (VCHardwareSettingsMac)init
{
  VCHardwareSettingsMac *v2;
  VCHardwareSettingsMac *v3;
  uint64_t v4;
  NSObject *v5;
  int supportHEVC;
  _BOOL4 supportVCPEncoder;
  int machineType_low;
  NSString *machineName;
  int cpuFamily;
  NSString *cpuType;
  int numProcessors;
  int isG5;
  int hardwareScore;
  int mhrtz;
  _BOOL4 isGVAEncoderAvailable;
  objc_super v18;
  uint8_t buf[4];
  uint64_t v20;
  __int16 v21;
  const char *v22;
  __int16 v23;
  int v24;
  __int16 v25;
  int v26;
  __int16 v27;
  _BOOL4 v28;
  __int16 v29;
  int v30;
  __int16 v31;
  NSString *v32;
  __int16 v33;
  int v34;
  __int16 v35;
  NSString *v36;
  __int16 v37;
  int v38;
  __int16 v39;
  int v40;
  __int16 v41;
  int v42;
  __int16 v43;
  int v44;
  __int16 v45;
  _BOOL4 v46;
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v18.receiver = self;
  v18.super_class = (Class)VCHardwareSettingsMac;
  v2 = -[VCHardwareSettings init](&v18, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_isGVAEncoderAvailable = -[VCHardwareSettingsMac canDoHiDefEncoding](v2, "canDoHiDefEncoding");
    v3->_mhrtz = VCCPUCount();
    v3->_isG5 = ProcessorSpeedMHz();
    v3->_hardwareScore = hasG5();
    v3->_cpuFamily = MachineType();
    -[VCHardwareSettingsMac setupMachineName](v3, "setupMachineName");
    v3->_numProcessors = -[VCHardwareSettingsMac _getCPUFamilyType](v3, "_getCPUFamilyType");
    v3->_cpuType = (NSString *)-[VCHardwareSettingsMac _getCPUTypeStringForMachineType:](v3, "_getCPUTypeStringForMachineType:", v3->_cpuFamily);
    v3->_boardId = (NSData *)-[VCHardwareSettingsMac queryBoardId](v3, "queryBoardId");
    -[VCHardwareSettingsMac addPixelFormat](v3, "addPixelFormat");
    -[VCHardwareSettingsMac isGVAEncoderAvailable](v3, "isGVAEncoderAvailable");
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      v4 = VRTraceErrorLogLevelToCSTR();
      v5 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        supportHEVC = v3->super._supportHEVC;
        supportVCPEncoder = v3->super._supportVCPEncoder;
        machineType_low = LOBYTE(v3->_machineType);
        machineName = v3->_machineName;
        cpuFamily = v3->_cpuFamily;
        cpuType = v3->_cpuType;
        numProcessors = v3->_numProcessors;
        isG5 = v3->_isG5;
        hardwareScore = v3->_hardwareScore;
        mhrtz = v3->_mhrtz;
        isGVAEncoderAvailable = v3->_isGVAEncoderAvailable;
        *(_DWORD *)buf = 136318466;
        v20 = v4;
        v21 = 2080;
        v22 = "-[VCHardwareSettingsMac init]";
        v23 = 1024;
        v24 = 100;
        v25 = 1024;
        v26 = supportHEVC;
        v27 = 1024;
        v28 = supportVCPEncoder;
        v29 = 1024;
        v30 = machineType_low;
        v31 = 2112;
        v32 = machineName;
        v33 = 1024;
        v34 = cpuFamily;
        v35 = 2112;
        v36 = cpuType;
        v37 = 1024;
        v38 = numProcessors;
        v39 = 1024;
        v40 = isG5;
        v41 = 1024;
        v42 = hardwareScore;
        v43 = 1024;
        v44 = mhrtz;
        v45 = 1024;
        v46 = isGVAEncoderAvailable;
        _os_log_impl(&dword_1D8A54000, v5, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d { %d, %d, %d, @\"%@\", 0x%x, @\"%@\", 0x%08x, %d, %d, %d, %d }", buf, 0x66u);
      }
    }
  }
  return v3;
}

- (id)initForDevice:(id)a3
{
  VCHardwareSettingsMac *v4;
  uint64_t v6;
  NSObject *v7;
  uint64_t v8;
  NSObject *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = -[VCHardwareSettingsMac init](self, "init");
  if (!v4)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      v6 = VRTraceErrorLogLevelToCSTR();
      v7 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCHardwareSettingsMac initForDevice:].cold.1(v6, v7);
    }
    goto LABEL_11;
  }
  v14 = 0;
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  if ((VCVirtualHardwareConfigurations_OSXConfigurationForDevice(a3, (uint64_t)&v10) & 1) == 0)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      v8 = VRTraceErrorLogLevelToCSTR();
      v9 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCHardwareSettingsMac initForDevice:].cold.2(v8, (uint64_t)a3, v9);
    }
LABEL_11:

    return 0;
  }

  v4->_machineName = (NSString *)objc_msgSend(*((id *)&v10 + 1), "copy");
  v4->_cpuFamily = v11;
  v4->_cpuType = (NSString *)*((_QWORD *)&v11 + 1);
  v4->_numProcessors = v12;
  *(_QWORD *)&v4->_isG5 = *(_QWORD *)((char *)&v12 + 4);
  v4->_mhrtz = HIDWORD(v12);
  v4->_isGVAEncoderAvailable = v13;
  LOBYTE(v4->_machineType) = BYTE2(v10);
  *(&v4->_isGVAEncoderAvailable + 1) = 1;
  v4->_screenWidth = HIDWORD(v13);
  v4->_screenHeight = v14;
  v4->super._supportVCPEncoderInitialized = 1;
  v4->super._supportVCPEncoder = BYTE1(v10);
  v4->super._supportHEVC = v10;
  -[NSMutableSet addObject:](v4->super._pixelFormatCollections, "addObject:", &unk_1E9EF3680);
  -[NSMutableSet addObject:](v4->super._pixelFormatCollections, "addObject:", &unk_1E9EF3698);
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
  if (virtualHardwareSettings___virtualHardwareSettingsDeviceA)
  {
    if (objc_msgSend(a3, "isEqual:", objc_msgSend((id)virtualHardwareSettings___virtualHardwareSettingsDeviceA, "machineName")))
    {
      return (id)virtualHardwareSettings___virtualHardwareSettingsDeviceA;
    }
    else if (virtualHardwareSettings___virtualHardwareSettingsDeviceB)
    {
      if (objc_msgSend(a3, "isEqual:", objc_msgSend((id)virtualHardwareSettings___virtualHardwareSettingsDeviceB, "machineName")))
      {
        return (id)virtualHardwareSettings___virtualHardwareSettingsDeviceB;
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
            v14 = "+[VCHardwareSettingsMac virtualHardwareSettings:]";
            v15 = 1024;
            v16 = 177;
            _os_log_impl(&dword_1D8A54000, v10, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Clearing existing virtual hardware settings.", (uint8_t *)&v11, 0x1Cu);
          }
        }

        virtualHardwareSettings___virtualHardwareSettingsDeviceA = 0;
        virtualHardwareSettings___virtualHardwareSettingsDeviceB = 0;
        return +[VCHardwareSettingsMac virtualHardwareSettings:](VCHardwareSettingsMac, "virtualHardwareSettings:", a3);
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
          v14 = "+[VCHardwareSettingsMac virtualHardwareSettings:]";
          v15 = 1024;
          v16 = 167;
          v17 = 2112;
          v18 = a3;
          _os_log_impl(&dword_1D8A54000, v8, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Initializing new virtual hardware settings B for device=%@", (uint8_t *)&v11, 0x26u);
        }
      }
      result = -[VCHardwareSettingsMac initForDevice:]([VCHardwareSettingsMac alloc], "initForDevice:", a3);
      virtualHardwareSettings___virtualHardwareSettingsDeviceB = (uint64_t)result;
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
        v14 = "+[VCHardwareSettingsMac virtualHardwareSettings:]";
        v15 = 1024;
        v16 = 157;
        v17 = 2112;
        v18 = a3;
        _os_log_impl(&dword_1D8A54000, v6, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Initializing new virtual hardware settings A for device=%@", (uint8_t *)&v11, 0x26u);
      }
    }
    result = -[VCHardwareSettingsMac initForDevice:]([VCHardwareSettingsMac alloc], "initForDevice:", a3);
    virtualHardwareSettings___virtualHardwareSettingsDeviceA = (uint64_t)result;
  }
  return result;
}

- (void)dealloc
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];

  v3.receiver = self;
  v3.super_class = (Class)VCHardwareSettingsMac;
  -[VCHardwareSettings dealloc](&v3, sel_dealloc);
}

- (void)setupMachineName
{
  void *v3;
  NSString *machineName;
  uint64_t v5;
  _QWORD v6[5];
  uint64_t v7;
  size_t v8;
  _OWORD v9[4];
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  memset(v9, 0, sizeof(v9));
  v8 = 64;
  if (!sysctlbyname("hw.model", v9, &v8, 0, 0))
  {
    v7 = 0;
    self->_machineName = (NSString *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithUTF8String:", v9);
    v3 = (void *)objc_msgSend(MEMORY[0x1E0CB38E8], "regularExpressionWithPattern:options:error:", CFSTR("^([^0-9]+)([0-9]+),([0-9]+)$"), 0, &v7);
    machineName = self->_machineName;
    v5 = -[NSString length](machineName, "length");
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __41__VCHardwareSettingsMac_setupMachineName__block_invoke;
    v6[3] = &unk_1E9E52820;
    v6[4] = self;
    objc_msgSend(v3, "enumerateMatchesInString:options:range:usingBlock:", machineName, 0, 0, v5, v6);
  }
}

uint64_t __41__VCHardwareSettingsMac_setupMachineName__block_invoke(uint64_t a1, void *a2)
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t result;

  v4 = *(void **)(*(_QWORD *)(a1 + 32) + 80);
  v5 = objc_msgSend(a2, "rangeAtIndex:", 1);
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 112) = (id)objc_msgSend(v4, "substringWithRange:", v5, v6);
  v7 = *(void **)(*(_QWORD *)(a1 + 32) + 80);
  v8 = objc_msgSend(a2, "rangeAtIndex:", 2);
  *(_DWORD *)(*(_QWORD *)(a1 + 32) + 120) = objc_msgSend((id)objc_msgSend(v7, "substringWithRange:", v8, v9), "intValue");
  v10 = *(void **)(*(_QWORD *)(a1 + 32) + 80);
  v11 = objc_msgSend(a2, "rangeAtIndex:", 3);
  result = objc_msgSend((id)objc_msgSend(v10, "substringWithRange:", v11, v12), "intValue");
  *(_DWORD *)(*(_QWORD *)(a1 + 32) + 124) = result;
  return result;
}

- (int)_getCPUFamilyType
{
  int v2;
  int ErrorLogLevelForModule;
  uint64_t v4;
  NSObject *v5;
  _BOOL4 v6;
  int result;
  uint64_t v8;
  NSObject *v9;
  size_t v10;
  int v11;
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
  v11 = -1431655766;
  v10 = 4;
  v2 = sysctlbyname("hw.cpufamily", &v11, &v10, 0, 0);
  ErrorLogLevelForModule = VRTraceGetErrorLogLevelForModule();
  if (v2)
  {
    if (ErrorLogLevelForModule >= 7)
    {
      v4 = VRTraceErrorLogLevelToCSTR();
      v5 = *MEMORY[0x1E0CF2758];
      v6 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT);
      result = 0;
      if (!v6)
        return result;
      *(_DWORD *)buf = 136315906;
      v13 = v4;
      v14 = 2080;
      v15 = "-[VCHardwareSettingsMac _getCPUFamilyType]";
      v16 = 1024;
      v17 = 225;
      v18 = 1024;
      v19 = v11;
      _os_log_impl(&dword_1D8A54000, v5, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d VCHardwareSettingsMac: Your machine arch is CPUFAMILY_UNKNOWN, 0x%x", buf, 0x22u);
    }
    return 0;
  }
  else
  {
    if (ErrorLogLevelForModule >= 7)
    {
      v8 = VRTraceErrorLogLevelToCSTR();
      v9 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315906;
        v13 = v8;
        v14 = 2080;
        v15 = "-[VCHardwareSettingsMac _getCPUFamilyType]";
        v16 = 1024;
        v17 = 221;
        v18 = 1024;
        v19 = v11;
        _os_log_impl(&dword_1D8A54000, v9, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d VCHardwareSettingsMac: Your machine arch is 0x%x", buf, 0x22u);
      }
    }
    return v11;
  }
}

- (id)_getCPUTypeStringForMachineType:(int)a3
{
  const __CFString *v3;
  int VectorTypeAvailable;

  if ((a3 & 0x400) != 0)
  {
LABEL_8:
    if (VCPayloadUtils_SupportsShortREDForPayload() == 80)
      return CFSTR("Intel-K65");
    else
      return CFSTR("Intel");
  }
  v3 = CFSTR("G5");
  if ((a3 & 0x100) == 0)
  {
    v3 = CFSTR("G4");
    if ((a3 & 2) == 0)
    {
      if ((a3 & 1) != 0)
        return CFSTR("G3");
      VectorTypeAvailable = GetVectorTypeAvailable();
      if (VectorTypeAvailable < 1)
        return CFSTR("G3");
      if ((VectorTypeAvailable & 1) == 0)
      {
        if ((VectorTypeAvailable & 5) == 0)
          return &stru_1E9E58EE0;
        goto LABEL_8;
      }
      if (hasG5())
        return CFSTR("G5");
    }
  }
  return (id)v3;
}

- (BOOL)_isMachineNewerThanSandybridge:(int)a3
{
  BOOL result;
  int v4;

  result = 0;
  if (a3 > 1463508715)
  {
    if (a3 > 2009171117)
    {
      if (a3 == 2009171118)
        return result;
      v4 = 2028621756;
    }
    else
    {
      if (a3 == 1463508716)
        return result;
      v4 = 1801080018;
    }
  }
  else if (a3 > -310978391)
  {
    if (a3 == -310978390)
      return result;
    v4 = 1418770316;
  }
  else
  {
    if (a3 == -1439483605)
      return result;
    v4 = -823913143;
  }
  if (a3 != v4)
    return 1;
  return result;
}

- (BOOL)_isModel:(id)a3
{
  return -[NSString compare:options:range:](-[VCHardwareSettingsMac machineName](self, "machineName"), "compare:options:range:", a3, 0, 0, objc_msgSend(a3, "length")) == NSOrderedSame;
}

- (BOOL)isGVAEncoderAvailable
{
  int *p_machineType;
  void *v4;
  void *v5;
  uint64_t (*v6)(void);
  int machineType_low;
  int ErrorLogLevelForModule;
  uint64_t v9;
  NSObject *v10;
  const char *v11;
  uint64_t v12;
  int v14;
  uint64_t v15;
  __int16 v16;
  const char *v17;
  __int16 v18;
  int v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  if (!*(&self->_isGVAEncoderAvailable + 1))
  {
    v4 = dlopen("/System/Library/PrivateFrameworks/AppleGVA.framework/Versions/Current/AppleGVA", 1);
    if (v4)
    {
      v5 = v4;
      v6 = (uint64_t (*)(void))dlsym(v4, "AVFQTXENC_GetEncodeAvailability");
      if (!dlerror())
        LOBYTE(self->_machineType) = v6();
      dlclose(v5);
    }
    p_machineType = &self->_machineType;
    machineType_low = LOBYTE(self->_machineType);
    ErrorLogLevelForModule = VRTraceGetErrorLogLevelForModule();
    if (machineType_low)
    {
      if (ErrorLogLevelForModule < 7)
        goto LABEL_15;
      v9 = VRTraceErrorLogLevelToCSTR();
      v10 = *MEMORY[0x1E0CF2758];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        goto LABEL_15;
      v14 = 136315650;
      v15 = v9;
      v16 = 2080;
      v17 = "-[VCHardwareSettingsMac isGVAEncoderAvailable]";
      v18 = 1024;
      v19 = 310;
      v11 = " [%s] %s:%d VCHardwareSettingsMac: HW encoder is available on this platform.";
    }
    else
    {
      if (ErrorLogLevelForModule < 7)
        goto LABEL_15;
      v12 = VRTraceErrorLogLevelToCSTR();
      v10 = *MEMORY[0x1E0CF2758];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        goto LABEL_15;
      v14 = 136315650;
      v15 = v12;
      v16 = 2080;
      v17 = "-[VCHardwareSettingsMac isGVAEncoderAvailable]";
      v18 = 1024;
      v19 = 312;
      v11 = " [%s] %s:%d VCHardwareSettingsMac: HW encoder is NOT available on this platform.";
    }
    _os_log_impl(&dword_1D8A54000, v10, OS_LOG_TYPE_DEFAULT, v11, (uint8_t *)&v14, 0x1Cu);
LABEL_15:
    *(&self->_isGVAEncoderAvailable + 1) = 1;
    return *(_BYTE *)p_machineType;
  }
  p_machineType = &self->_machineType;
  return *(_BYTE *)p_machineType;
}

- (BOOL)canDoHiDefEncoding
{
  _BOOL4 v3;

  if (!-[VCHardwareSettingsMac _isModel:](self, "_isModel:", CFSTR("MacBookAir"))
    || (v3 = -[VCHardwareSettingsMac _isMachineNewerThanSandybridge:](self, "_isMachineNewerThanSandybridge:", -[VCHardwareSettingsMac _getCPUFamilyType](self, "_getCPUFamilyType"))))
  {
    LOBYTE(v3) = -[VCHardwareSettingsMac isGVAEncoderAvailable](self, "isGVAEncoderAvailable")
              || -[VCHardwareSettingsMac _isModel:](self, "_isModel:", CFSTR("MacBookPro8"))
              || -[VCHardwareSettingsMac _isModel:](self, "_isModel:", CFSTR("MacPro"))
              && -[NSString intValue](-[NSString substringFromIndex:](-[VCHardwareSettingsMac machineName](self, "machineName"), "substringFromIndex:", objc_msgSend(CFSTR("MacPro"), "length")), "intValue") > 5|| -[VCHardwareSettingsMac _isModel:](self, "_isModel:", CFSTR("iMacPro"));
  }
  return v3;
}

- (BOOL)canDoHEVC
{
  BOOL result;
  int numProcessors;
  BOOL v5;
  int v6;

  result = 0;
  numProcessors = self->_numProcessors;
  if (numProcessors <= 1418770315)
  {
    if (numProcessors <= -310978391)
    {
      v5 = numProcessors == -1439483605;
      v6 = -823913143;
    }
    else
    {
      v5 = numProcessors == -310978390 || numProcessors == 280134364;
      v6 = 526772277;
    }
  }
  else if (numProcessors > 1801080017)
  {
    v5 = numProcessors == 1801080018 || numProcessors == 2009171118;
    v6 = 2028621756;
  }
  else
  {
    v5 = numProcessors == 1418770316 || numProcessors == 1463508716;
    v6 = 1479463068;
  }
  if (!v5 && numProcessors != v6)
    return 1;
  return result;
}

- (BOOL)canDoHiDefDecoding
{
  return -[VCHardwareSettingsMac _isModel:](self, "_isModel:", CFSTR("MacBookPro7,1"))
      || -[VCHardwareSettingsMac _isModel:](self, "_isModel:", CFSTR("MacBookPro6,2"))
      || -[VCHardwareSettingsMac _isModel:](self, "_isModel:", CFSTR("iMac10,1"))
      || -[VCHardwareSettingsMac _isModel:](self, "_isModel:", CFSTR("iMac11,1"));
}

- (BOOL)supports1080pEncoding
{
  return VCHardwareSettingsMac_CompareCPUFamilies(self->_numProcessors, 939270559) != -1;
}

- (BOOL)supports1080pDecoding
{
  return VCHardwareSettingsMac_CompareCPUFamilies(self->_numProcessors, 939270559) != -1;
}

- (BOOL)isSpatialAudioSupported
{
  BOOL v3;
  unsigned int v4;

  if (-[NSString compare:options:](self->_modelName, "compare:options:", CFSTR("MacBookPro"), 1) == NSOrderedSame)
  {
    v4 = 14;
    return self->_modelVersion > v4;
  }
  if (-[NSString compare:options:](self->_modelName, "compare:options:", CFSTR("MacBookAir"), 1) == NSOrderedSame)
    goto LABEL_8;
  if (-[NSString compare:options:](self->_modelName, "compare:options:", CFSTR("iMac"), 1) == NSOrderedSame)
  {
    v4 = 19;
    return self->_modelVersion > v4;
  }
  if (-[NSString compare:options:](self->_modelName, "compare:options:", CFSTR("Macmini"), 1) == NSOrderedSame)
  {
LABEL_8:
    v4 = 7;
    return self->_modelVersion > v4;
  }
  v3 = 1;
  if (-[NSString compare:options:](self->_modelName, "compare:options:", CFSTR("MacPro"), 1) == NSOrderedSame)
  {
    v4 = 6;
    return self->_modelVersion > v4;
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
    if (!sharedInstance__hardwareSettings)
      sharedInstance__hardwareSettings = objc_alloc_init(VCHardwareSettingsMac);
    objc_sync_exit(v3);
    return (id)sharedInstance__hardwareSettings;
  }
  return v5;
}

- (BOOL)isMacBookWVGA
{
  return -[VCHardwareSettingsMac _isModel:](self, "_isModel:", CFSTR("MacBook8"))
      || -[VCHardwareSettingsMac _isModel:](self, "_isModel:", CFSTR("MacBook9"))
      || -[VCHardwareSettingsMac _isModel:](self, "_isModel:", CFSTR("MacBook10"));
}

- (BOOL)isMacPro
{
  return -[VCHardwareSettingsMac _isModel:](self, "_isModel:", CFSTR("MacPro"));
}

- (BOOL)isIMac
{
  return -[VCHardwareSettingsMac _isModel:](self, "_isModel:", CFSTR("iMac"));
}

- (BOOL)isIMacPro
{
  return -[VCHardwareSettingsMac _isModel:](self, "_isModel:", CFSTR("iMacPro"));
}

- (BOOL)isMacBookAir
{
  return -[VCHardwareSettingsMac _isModel:](self, "_isModel:", CFSTR("MacBookAir"));
}

- (BOOL)isMacmini
{
  return -[VCHardwareSettingsMac _isModel:](self, "_isModel:", CFSTR("Macmini"));
}

- (BOOL)isAppleSiliconMac
{
  return 0;
}

- (unsigned)hwEncoderExitBitrate
{
  unsigned int result;
  int numProcessors;
  BOOL v5;
  int v6;

  result = 700000;
  numProcessors = self->_numProcessors;
  if (numProcessors <= 1463508715)
  {
    if (numProcessors > -310978391)
    {
      v5 = numProcessors == -310978390;
      v6 = 1418770316;
    }
    else
    {
      v5 = numProcessors == -1439483605;
      v6 = -823913143;
    }
    goto LABEL_13;
  }
  if (numProcessors > 1801080017)
  {
    v5 = numProcessors == 1801080018 || numProcessors == 2009171118;
    v6 = 2028621756;
LABEL_13:
    if (!v5 && numProcessors != v6)
      return 300000;
    return result;
  }
  if (numProcessors != 1463508716)
  {
    if (numProcessors == 1479463068)
      return 450000;
    return 300000;
  }
  return result;
}

- (unsigned)hwEncoderEnterBitrate
{
  unsigned int result;
  int numProcessors;
  BOOL v5;
  int v6;

  result = 1000000;
  numProcessors = self->_numProcessors;
  if (numProcessors <= 1463508715)
  {
    if (numProcessors > -310978391)
    {
      v5 = numProcessors == -310978390;
      v6 = 1418770316;
    }
    else
    {
      v5 = numProcessors == -1439483605;
      v6 = -823913143;
    }
    goto LABEL_13;
  }
  if (numProcessors > 1801080017)
  {
    v5 = numProcessors == 1801080018 || numProcessors == 2009171118;
    v6 = 2028621756;
LABEL_13:
    if (!v5 && numProcessors != v6)
      return 450000;
    return result;
  }
  if (numProcessors != 1463508716)
  {
    if (numProcessors == 1479463068)
      return 600000;
    return 450000;
  }
  return result;
}

- (NSString)machineName
{
  return self->_machineName;
}

- (int)hardwareScore
{
  int result;
  _BOOL4 v4;
  int v5;
  unsigned int isG5;
  int v7;
  int v8;
  int v9;
  int v10;
  int v11;
  int v12;
  int mhrtz;
  int v14;
  BOOL v15;
  int numProcessors;
  char v17;
  int v18;

  result = *(&self->_hardwareScore + 1);
  if (!result)
  {
    v4 = -[VCHardwareSettingsMac _isMachineNewerThanSandybridge:](self, "_isMachineNewerThanSandybridge:", self->_numProcessors);
    if (!-[NSString isEqual:](self->_cpuType, "isEqual:", CFSTR("Intel")))
    {
      result = -1;
LABEL_43:
      *(&self->_hardwareScore + 1) = result;
      return result;
    }
    v5 = *(&self->_hardwareScore + 1);
    *(&self->_hardwareScore + 1) = v5 + 5;
    isG5 = self->_isG5;
    if (isG5 >= 0xBB9)
      v7 = 17;
    else
      v7 = 15;
    if (isG5 >= 0xA29)
      v8 = v7;
    else
      v8 = 13;
    if (isG5 >= 0x835)
      v9 = v8;
    else
      v9 = 11;
    if (isG5 >= 0x709)
      v10 = v9;
    else
      v10 = 9;
    if ((int)isG5 >= 801)
      v11 = v10;
    else
      v11 = 7;
    v12 = v5 + v11;
    *(&self->_hardwareScore + 1) = v12;
    mhrtz = self->_mhrtz;
    if (mhrtz <= 7)
    {
      if (mhrtz <= 3)
      {
        if (mhrtz < 2)
          goto LABEL_26;
        v14 = 2;
      }
      else
      {
        v14 = 8;
      }
    }
    else
    {
      v14 = 16;
    }
    *(&self->_hardwareScore + 1) = v12 + v14;
LABEL_26:
    v15 = -[VCHardwareSettingsMac _isModel:](self, "_isModel:", CFSTR("MacBookAir"));
    numProcessors = self->_numProcessors;
    if (v15)
    {
      v17 = numProcessors == 1418770316 || v4;
      if ((v17 & 1) != 0)
        v18 = 21;
      else
        v18 = *(&self->_hardwareScore + 1) - 2;
    }
    else if (numProcessors == 1418770316 || numProcessors == 1463508716 || numProcessors == 1801080018 || v4)
    {
      v18 = 2 * *(&self->_hardwareScore + 1);
    }
    else
    {
      if (numProcessors != 2028621756)
      {
LABEL_39:
        if (self->_isGVAEncoderAvailable)
        {
          result = 30;
        }
        else
        {
          result = *(&self->_hardwareScore + 1);
          if (result < 26)
            return result;
          result = 25;
        }
        goto LABEL_43;
      }
      v18 = (int)((double)*(&self->_hardwareScore + 1) * 1.5);
    }
    *(&self->_hardwareScore + 1) = v18;
    goto LABEL_39;
  }
  return result;
}

- (BOOL)useSoftFramerateSwitching
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  BOOL v8;
  _BYTE v10[128];
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithObjects:", CFSTR("MacBookAir4,1"), CFSTR("MacBookAir5,1"), CFSTR("MacBookPro10,2"), 0);
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v10, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v12;
    while (2)
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v12 != v6)
          objc_enumerationMutation(v3);
        if (-[NSString isEqualToString:](-[VCHardwareSettingsMac machineName](self, "machineName"), "isEqualToString:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * i)))
        {
          v8 = 1;
          goto LABEL_11;
        }
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v10, 16);
      if (v5)
        continue;
      break;
    }
  }
  v8 = 0;
LABEL_11:

  return v8;
}

- (unsigned)maxDisplayRefreshRate
{
  return 60;
}

- (unsigned)maxActiveVideoEncoders
{
  int numProcessors;
  unsigned int result;
  BOOL v4;
  int v5;

  numProcessors = self->_numProcessors;
  result = 3;
  if (numProcessors > 1418770315)
  {
    if (numProcessors > 1801080017)
    {
      v4 = numProcessors == 1801080018 || numProcessors == 2009171118;
      v5 = 2028621756;
    }
    else
    {
      v4 = numProcessors == 1418770316 || numProcessors == 1463508716;
      v5 = 1479463068;
    }
LABEL_22:
    if (!v4 && numProcessors != v5)
      return 6;
    return result;
  }
  if (numProcessors <= 280134363)
  {
    v4 = numProcessors == -1439483605 || numProcessors == -823913143;
    v5 = -310978390;
    goto LABEL_22;
  }
  if (numProcessors != 280134364 && numProcessors != 526772277)
  {
    if (numProcessors == 939270559)
      return 4;
    return 6;
  }
  return result;
}

- (BOOL)supportsMultiway720pStream
{
  return 1;
}

- (unsigned)maxOneToOneFramerateSupported
{
  return 30;
}

- (BOOL)isCaptionsSupported
{
  return 0;
}

- (unsigned)maxMultiwayFramerateSupported
{
  return 30;
}

- (unsigned)maxActiveVideoDecoders
{
  unsigned int result;
  int numProcessors;
  BOOL v5;
  int v6;

  result = -[VCDefaults maxActiveVideoDecoders](+[VCDefaults sharedInstance](VCDefaults, "sharedInstance"), "maxActiveVideoDecoders");
  if (result != -1)
    return result;
  if (-[VCHardwareSettingsMac isIMacPro](self, "isIMacPro"))
    return 24;
  numProcessors = self->_numProcessors;
  result = 4;
  if (numProcessors > 1418770315)
  {
    if (numProcessors > 1801080017)
    {
      v5 = numProcessors == 1801080018 || numProcessors == 2009171118;
      v6 = 2028621756;
    }
    else
    {
      v5 = numProcessors == 1418770316 || numProcessors == 1463508716;
      v6 = 1479463068;
    }
LABEL_25:
    if (!v5 && numProcessors != v6)
      return 24;
    return result;
  }
  if (numProcessors <= 280134363)
  {
    v5 = numProcessors == -1439483605 || numProcessors == -823913143;
    v6 = -310978390;
    goto LABEL_25;
  }
  if (numProcessors != 280134364 && numProcessors != 526772277)
  {
    if (numProcessors != 939270559)
      return 24;
    return 9;
  }
  return result;
}

- (BOOL)supportsCompressedPixelFormat
{
  return 0;
}

- (BOOL)isDeviceLargeScreen
{
  return 1;
}

- (BOOL)supportsHEIFEncoding
{
  return 1;
}

- (void)addPixelFormat
{
  -[NSMutableSet addObject:](self->super._pixelFormatCollections, "addObject:", &unk_1E9EF3680);
  -[NSMutableSet addObject:](self->super._pixelFormatCollections, "addObject:", &unk_1E9EF3698);
  if (-[VCHardwareSettingsMac isAppleSiliconMac](self, "isAppleSiliconMac"))
  {
    -[NSMutableSet addObject:](self->super._pixelFormatCollections, "addObject:", &unk_1E9EF36B0);
    -[NSMutableSet addObject:](self->super._pixelFormatCollections, "addObject:", &unk_1E9EF36C8);
    -[NSMutableSet addObject:](self->super._pixelFormatCollections, "addObject:", &unk_1E9EF36E0);
    -[NSMutableSet addObject:](self->super._pixelFormatCollections, "addObject:", &unk_1E9EF36F8);
  }
}

- (BOOL)isPixelFormatAvailable
{
  return -[NSMutableSet count](self->super._pixelFormatCollections, "count") != 0;
}

+ (int64_t)deviceClass
{
  return 0;
}

- (unsigned)maxRemoteParticipants30fps
{
  unsigned int result;
  int numProcessors;
  BOOL v5;
  int v6;

  if (-[VCHardwareSettingsMac isIMacPro](self, "isIMacPro"))
    return 32;
  numProcessors = self->_numProcessors;
  result = 4;
  if (numProcessors <= 1418770315)
  {
    if (numProcessors <= -310978391)
    {
      v5 = numProcessors == -1439483605;
      v6 = -823913143;
    }
    else
    {
      v5 = numProcessors == -310978390 || numProcessors == 280134364;
      v6 = 526772277;
    }
  }
  else if (numProcessors > 1801080017)
  {
    v5 = numProcessors == 1801080018 || numProcessors == 2009171118;
    v6 = 2028621756;
  }
  else
  {
    v5 = numProcessors == 1418770316 || numProcessors == 1463508716;
    v6 = 1479463068;
  }
  if (!v5 && numProcessors != v6)
    return 32;
  return result;
}

- (unsigned)maxFpsCameraCaptureDuringSharing
{
  unsigned int v3;

  if (-[VCHardwareSettingsMac isAppleSiliconMac](self, "isAppleSiliconMac"))
    return 30;
  v3 = 30;
  if (!-[VCHardwareSettingsMac isMacPro](self, "isMacPro"))
  {
    if (-[VCHardwareSettingsMac isIMacPro](self, "isIMacPro"))
      return 30;
    else
      return 15;
  }
  return v3;
}

- (BOOL)supportsAVFCapture
{
  return 1;
}

- (BOOL)supportsMultiway1080pStream
{
  return VCDefaults_GetBoolValueForKey(CFSTR("supportsMultiway1080pStream"), -[VCHardwareSettingsMac isAppleSiliconMac](self, "isAppleSiliconMac"));
}

- (BOOL)supportsDecodingSquareCameraVideo
{
  return 0;
}

- (unsigned)screenWidth
{
  unsigned int result;

  result = self->_screenWidth;
  if (!result)
  {
    -[VCHardwareSettingsMac _initializeScreenDimension](self, "_initializeScreenDimension");
    return self->_screenWidth;
  }
  return result;
}

- (BOOL)shouldOverrideGPUMuxing
{
  return -[VCHardwareSettingsMac _isModel:](self, "_isModel:", CFSTR("MacBookPro13,3"))
      || -[VCHardwareSettingsMac _isModel:](self, "_isModel:", CFSTR("MacBookPro14,3"));
}

- (unsigned)screenHeight
{
  unsigned int result;

  result = self->_screenHeight;
  if (!result)
  {
    -[VCHardwareSettingsMac _initializeScreenDimension](self, "_initializeScreenDimension");
    return self->_screenHeight;
  }
  return result;
}

- (double)previewPreferredAspectRatio
{
  return 1.77777778;
}

- (BOOL)supportsFilteredScreenCapture
{
  BOOL result;
  int numProcessors;
  BOOL v5;
  int v6;

  result = 0;
  numProcessors = self->_numProcessors;
  if (numProcessors <= 1418770315)
  {
    if (numProcessors <= -310978391)
    {
      v5 = numProcessors == -1439483605;
      v6 = -823913143;
    }
    else
    {
      v5 = numProcessors == -310978390 || numProcessors == 280134364;
      v6 = 526772277;
    }
  }
  else if (numProcessors > 1801080017)
  {
    v5 = numProcessors == 1801080018 || numProcessors == 2009171118;
    v6 = 2028621756;
  }
  else
  {
    v5 = numProcessors == 1418770316 || numProcessors == 1463508716;
    v6 = 1479463068;
  }
  if (!v5 && numProcessors != v6)
    return 1;
  return result;
}

- (unint64_t)maxScreenEncodingSizeSupported
{
  unint64_t result;
  int numProcessors;
  BOOL v5;
  int v6;

  result = 2073600;
  numProcessors = self->_numProcessors;
  if (numProcessors > 943936838)
  {
    if (numProcessors <= 1479463067)
    {
      v5 = numProcessors == 943936839 || numProcessors == 1418770316;
      v6 = 1463508716;
    }
    else if (numProcessors > 2009171117)
    {
      v5 = numProcessors == 2009171118;
      v6 = 2028621756;
    }
    else
    {
      v5 = numProcessors == 1479463068;
      v6 = 1801080018;
    }
  }
  else if (numProcessors <= 260141637)
  {
    v5 = numProcessors == -1439483605 || numProcessors == -823913143;
    v6 = -310978390;
  }
  else if (numProcessors > 526772276)
  {
    v5 = numProcessors == 526772277;
    v6 = 939270559;
  }
  else
  {
    v5 = numProcessors == 260141638;
    v6 = 280134364;
  }
  if (!v5 && numProcessors != v6)
    return 5603328;
  return result;
}

- (unsigned)maxActiveScreenEncoders
{
  int numProcessors;
  unsigned int v3;
  BOOL v4;
  int v5;
  BOOL v6;
  uint64_t v7;
  NSObject *v8;
  int v10;
  uint64_t v11;
  __int16 v12;
  const char *v13;
  __int16 v14;
  int v15;
  __int16 v16;
  int v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  numProcessors = self->_numProcessors;
  v3 = 2;
  if (numProcessors > 943936838)
  {
    if (numProcessors <= 1479463067)
    {
      v4 = numProcessors == 943936839 || numProcessors == 1418770316;
      v5 = 1463508716;
    }
    else if (numProcessors > 2009171117)
    {
      v4 = numProcessors == 2028621756;
      v5 = 2009171118;
    }
    else
    {
      v4 = numProcessors == 1479463068;
      v5 = 1801080018;
    }
  }
  else if (numProcessors <= 260141637)
  {
    v4 = numProcessors == -1439483605 || numProcessors == -823913143;
    v5 = -310978390;
  }
  else if (numProcessors > 526772276)
  {
    v4 = numProcessors == 526772277;
    v5 = 939270559;
  }
  else
  {
    v4 = numProcessors == 260141638;
    v5 = 280134364;
  }
  v6 = v4 || numProcessors == v5;
  if (v6 && -[VCHardwareSettingsMac isMacBookAir](self, "isMacBookAir"))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() < 6)
    {
      return 1;
    }
    else
    {
      v7 = VRTraceErrorLogLevelToCSTR();
      v8 = *MEMORY[0x1E0CF2758];
      v3 = 1;
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v10 = 136315906;
        v11 = v7;
        v12 = 2080;
        v13 = "-[VCHardwareSettingsMac maxActiveScreenEncoders]";
        v14 = 1024;
        v15 = 985;
        v16 = 1024;
        v17 = 1;
        _os_log_impl(&dword_1D8A54000, v8, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Forcing max screen encoders=%d", (uint8_t *)&v10, 0x22u);
      }
    }
  }
  return v3;
}

- (unsigned)maxFrameRateSupportedScreenShare
{
  int numProcessors;
  BOOL v3;
  int v4;

  numProcessors = self->_numProcessors;
  if (numProcessors > 943936838)
  {
    if (numProcessors <= 1479463067)
    {
      if (numProcessors == 943936839)
      {
        if (!-[VCHardwareSettingsMac isMacBookAir](self, "isMacBookAir"))
          return 60;
        return 30;
      }
      v3 = numProcessors == 1418770316;
      v4 = 1463508716;
    }
    else if (numProcessors > 2009171117)
    {
      v3 = numProcessors == 2028621756;
      v4 = 2009171118;
    }
    else
    {
      v3 = numProcessors == 1479463068;
      v4 = 1801080018;
    }
    goto LABEL_20;
  }
  if (numProcessors <= 260141637)
  {
    v3 = numProcessors == -1439483605 || numProcessors == -823913143;
    v4 = -310978390;
LABEL_20:
    if (!v3 && numProcessors != v4)
      return 60;
    goto LABEL_25;
  }
  if (numProcessors > 526772276)
  {
    if (numProcessors != 526772277)
    {
      if (numProcessors != 939270559)
        return 60;
      return 30;
    }
LABEL_25:
    if (-[VCHardwareSettingsMac isMacBookAir](self, "isMacBookAir"))
      return 10;
    return 30;
  }
  if (numProcessors != 260141638)
  {
    if (numProcessors != 280134364)
      return 60;
    goto LABEL_25;
  }
  return 30;
}

- (BOOL)shouldEnforceScreenFrameRateLimit
{
  return -[VCHardwareSettingsMac _isModel:](self, "_isModel:", CFSTR("MacBookPro18"));
}

- (id)queryBoardId
{
  mach_port_t v2;
  io_registry_entry_t RootEntry;
  io_object_t v4;
  CFTypeRef v5;
  io_object_t v7;
  io_object_t v8;
  __int128 v9;
  io_iterator_t iterator;
  char className[23];
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _OWORD v17[2];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  iterator = 0;
  v2 = *MEMORY[0x1E0CBBAB8];
  RootEntry = IORegistryGetRootEntry(*MEMORY[0x1E0CBBAB8]);
  if (!RootEntry)
    return 0;
  v4 = RootEntry;
  if (IORegistryCreateIterator(v2, "IOService", 0, &iterator) || (v7 = IOIteratorNext(iterator)) == 0)
  {
LABEL_3:
    v5 = 0;
  }
  else
  {
    v8 = v7;
    while (1)
    {
      *(_QWORD *)&v9 = 0xAAAAAAAAAAAAAAAALL;
      *((_QWORD *)&v9 + 1) = 0xAAAAAAAAAAAAAAAALL;
      *(_OWORD *)((char *)v17 + 9) = v9;
      v16 = v9;
      v17[0] = v9;
      v14 = v9;
      v15 = v9;
      v12 = v9;
      v13 = v9;
      strcpy(className, "IOPlatformExpertDevice");
      if (IOObjectConformsTo(v8, className))
        break;
      IOObjectRelease(v8);
      v8 = IOIteratorNext(iterator);
      if (!v8)
        goto LABEL_3;
    }
    v5 = IORegistryEntrySearchCFProperty(v8, "IOService", CFSTR("board-id"), (CFAllocatorRef)*MEMORY[0x1E0C9AE00], 1u);
    IOObjectRelease(v8);
  }
  if (iterator)
    IOObjectRelease(iterator);
  IOObjectRelease(v4);
  if (v5)
    return (id)(id)CFMakeCollectable(v5);
  else
    return 0;
}

- (NSArray)supportedVideoPayloads
{
  NSArray *v3;

  v3 = (NSArray *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  -[NSArray addObject:](v3, "addObject:", &unk_1E9EF3710);
  -[NSArray addObject:](v3, "addObject:", &unk_1E9EF3728);
  if (-[VCHardwareSettings supportHEVC](self, "supportHEVC"))
    -[NSArray addObject:](v3, "addObject:", &unk_1E9EF3740);
  return v3;
}

- (BOOL)limitCameraDownlinkBitrateDuringSharing
{
  return !-[VCHardwareSettingsMac isAppleSiliconMac](self, "isAppleSiliconMac");
}

- (BOOL)supportsScreenCapture
{
  return 1;
}

- (BOOL)supportsSystemAudioTap
{
  return 1;
}

- (BOOL)supportsDedicatedSystemAudioStream
{
  _BOOL4 v3;
  int numProcessors;
  BOOL v5;
  int v6;
  uint64_t v8;
  NSObject *v9;
  _BOOL4 v10;
  int v12;
  uint64_t v13;
  __int16 v14;
  const char *v15;
  __int16 v16;
  int v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = -[VCHardwareSettingsMac supportsSystemAudioTap](self, "supportsSystemAudioTap");
  if (v3)
  {
    numProcessors = self->_numProcessors;
    LOBYTE(v3) = 1;
    if (numProcessors <= 943936838)
    {
      if (numProcessors > 260141637)
      {
        v5 = numProcessors == 260141638 || numProcessors == 280134364;
        v6 = 526772277;
      }
      else
      {
        v5 = numProcessors == -1439483605 || numProcessors == -823913143;
        v6 = -310978390;
      }
    }
    else if (numProcessors <= 1479463067)
    {
      v5 = numProcessors == 943936839 || numProcessors == 1418770316;
      v6 = 1463508716;
    }
    else if (numProcessors > 2009171117)
    {
      v5 = numProcessors == 2028621756;
      v6 = 2009171118;
    }
    else
    {
      v5 = numProcessors == 1479463068;
      v6 = 1801080018;
    }
    if (v5 || numProcessors == v6)
    {
      if (!-[VCHardwareSettingsMac isMacBookAir](self, "isMacBookAir"))
      {
        LOBYTE(v3) = 1;
        return v3;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
      {
        v8 = VRTraceErrorLogLevelToCSTR();
        v9 = *MEMORY[0x1E0CF2758];
        v10 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT);
        LOBYTE(v3) = 0;
        if (!v10)
          return v3;
        v12 = 136315650;
        v13 = v8;
        v14 = 2080;
        v15 = "-[VCHardwareSettingsMac supportsDedicatedSystemAudioStream]";
        v16 = 1024;
        v17 = 1131;
        _os_log_impl(&dword_1D8A54000, v9, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Forcing mixed in system audio", (uint8_t *)&v12, 0x1Cu);
      }
      LOBYTE(v3) = 0;
    }
  }
  return v3;
}

- (BOOL)disableMLScalarDuringSharing
{
  return 1;
}

- (int64_t)screenShareCapabilities
{
  return 2;
}

- (BOOL)preferPresentationTimestamp
{
  return 0;
}

- (BOOL)isCellularTappingSupported
{
  return 0;
}

- (BOOL)isRemoteCameraSenderSupported
{
  return 0;
}

- (BOOL)isMediaRecordingSupported
{
  return 1;
}

- (BOOL)isViewPointCorrectionSupported
{
  return 0;
}

- (BOOL)isExternalCameraSupported
{
  return 1;
}

- (BOOL)supportsOutOfProcessVideoDecoding
{
  return 1;
}

- (BOOL)supportsOutOfProcessAudioDecoding
{
  return 1;
}

- (BOOL)captureFormatPrefer16by9ForSquare
{
  return 0;
}

- (void)initForDevice:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  __int16 v4;
  const char *v5;
  __int16 v6;
  int v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v2 = 136315650;
  v3 = a1;
  v4 = 2080;
  v5 = "-[VCHardwareSettingsMac initForDevice:]";
  v6 = 1024;
  v7 = 113;
  _os_log_error_impl(&dword_1D8A54000, a2, OS_LOG_TYPE_ERROR, " [%s] %s:%d Failed to initialize", (uint8_t *)&v2, 0x1Cu);
}

- (void)initForDevice:(os_log_t)log .cold.2(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  const char *v6;
  __int16 v7;
  int v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = 136315906;
  v4 = a1;
  v5 = 2080;
  v6 = "-[VCHardwareSettingsMac initForDevice:]";
  v7 = 1024;
  v8 = 117;
  v9 = 2112;
  v10 = a2;
  _os_log_error_impl(&dword_1D8A54000, log, OS_LOG_TYPE_ERROR, " [%s] %s:%d Failed to find configuration for virtual OSX device=%@", (uint8_t *)&v3, 0x26u);
}

@end
