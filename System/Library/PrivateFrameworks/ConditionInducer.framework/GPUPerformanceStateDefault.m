@implementation GPUPerformanceStateDefault

+ (unsigned)ioAccelerator
{
  mach_port_t v2;
  const __CFDictionary *v3;
  unsigned int result;
  const __CFDictionary *v5;

  v2 = *MEMORY[0x24BDD8B20];
  v3 = IOServiceMatching("IOAccelerator");
  result = IOServiceGetMatchingService(v2, v3);
  if (!result)
  {
    v5 = IOServiceMatching("IOAcceleratorES");
    return IOServiceGetMatchingService(v2, v5);
  }
  return result;
}

+ (BOOL)supportsConsistentStateDevice:(id)a3
{
  id v3;
  char v4;

  v3 = a3;
  if (v3
    && (objc_opt_respondsToSelector() & 1) != 0
    && (objc_opt_respondsToSelector() & 1) != 0
    && (objc_opt_respondsToSelector() & 1) != 0)
  {
    v4 = objc_opt_respondsToSelector();
  }
  else
  {
    v4 = 0;
  }

  return v4 & 1;
}

+ (id)consistentStateDevice
{
  id v2;
  id v3;

  v2 = MTLCreateSystemDefaultDevice();
  if (+[GPUPerformanceStateDefault supportsConsistentStateDevice:](GPUPerformanceStateDefault, "supportsConsistentStateDevice:", v2))
  {
    v3 = v2;
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

+ (id)perfLevelEnumToGPUStateStringKey:(unsigned int)a3
{
  _BOOL8 v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  if (a3 < 4)
    return *(&off_24E471650 + (int)a3);
  v4 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_FAULT);
  if (v4)
    +[GPUPerformanceStateDefault perfLevelEnumToGPUStateStringKey:].cold.1(v4, v5, v6, v7, v8, v9, v10, v11);
  return 0;
}

- (id)identifierName
{
  __CFString *v2;
  void *v3;
  void *v4;
  void *v5;
  BOOL v6;
  uint64_t v8;

  v8 = 0;
  v2 = CFSTR("GPUPerformanceState");
  +[COConditionSession prepareInfoDictForBuiltInCondition:error:](COConditionSession, "prepareInfoDictForBuiltInCondition:error:", CFSTR("GPUPerformanceState"), &v8);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", CFSTR("ConditionIdentifierName"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
    v6 = v4 == 0;
  else
    v6 = 1;
  if (!v6)
    v2 = v4;

  return v2;
}

- (id)userFriendlyName
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v6;

  v6 = 0;
  +[COConditionSession prepareInfoDictForBuiltInCondition:error:](COConditionSession, "prepareInfoDictForBuiltInCondition:error:", CFSTR("GPUPerformanceState"), &v6);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "objectForKey:", CFSTR("ConditionUserFriendlyName"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (BOOL)isDestructive
{
  void *v2;
  void *v3;
  uint64_t v5;

  v5 = 0;
  +[COConditionSession prepareInfoDictForBuiltInCondition:error:](COConditionSession, "prepareInfoDictForBuiltInCondition:error:", CFSTR("GPUPerformanceState"), &v5);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "valueForKey:", CFSTR("ConditionIsDestructive"));

  }
  return 1;
}

- (BOOL)isInternalOnly
{
  void *v2;
  void *v3;
  uint64_t v5;

  v5 = 0;
  +[COConditionSession prepareInfoDictForBuiltInCondition:error:](COConditionSession, "prepareInfoDictForBuiltInCondition:error:", CFSTR("GPUPerformanceState"), &v5);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "valueForKey:", CFSTR("ConditionIsInternalOnly"));

  }
  return 1;
}

+ (id)description
{
  return CFSTR("Set GPU performance state to default behavior");
}

+ (id)profileFriendlyName
{
  return CFSTR("Default");
}

- (GPUPerformanceStateDefault)initWithGPUPerformanceState:(unsigned int)a3
{
  GPUPerformanceStateDefault *v4;
  GPUPerformanceStateDefault *v5;
  uint64_t v6;
  ApplePMPPerfStateControl *applePMPPerfStateControl;
  objc_super v9;
  uint8_t buf[4];
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v9.receiver = self;
  v9.super_class = (Class)GPUPerformanceStateDefault;
  v4 = -[COCondition init](&v9, sel_init);
  v5 = v4;
  if (v4)
  {
    if (!a3)
      -[GPUPerformanceStateDefault initWithGPUPerformanceState:].cold.1();
    v4->_desiredGPUPerformanceState = a3;
    v4->_acceleratorService = +[GPUPerformanceStateDefault ioAccelerator](GPUPerformanceStateDefault, "ioAccelerator");
    v5->_performanceLevel = a3;
    v6 = objc_opt_new();
    applePMPPerfStateControl = v5->_applePMPPerfStateControl;
    v5->_applePMPPerfStateControl = (ApplePMPPerfStateControl *)v6;

    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134217984;
      v11 = a3;
      _os_log_impl(&dword_21F8CF000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "Set Performance State: %lu", buf, 0xCu);
    }
  }
  return v5;
}

- (BOOL)_acquireLock
{
  BOOL v2;
  _BOOL8 v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t outputStruct;

  outputStruct = 256;
  v2 = CallIO(self->_connection, &outputStruct, &outputStruct, (uint64_t)"ConsistentPerfState_Lock");
  if (!v2)
  {
    v3 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_FAULT);
    if (v3)
      -[GPUPerformanceStateDefault _acquireLock].cold.1(v3, v4, v5, v6, v7, v8, v9, v10);
  }
  return v2;
}

- (void)_cleanup
{
  OUTLINED_FUNCTION_2_3(&dword_21F8CF000, MEMORY[0x24BDACB70], a3, "Unable to reset %@ Condition", a5, a6, a7, a8, 2u);
}

- (BOOL)_setConsistentPerformanceLevel
{
  unsigned int *v2;
  _BOOL4 v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unsigned int *p_performanceLevel;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t outputStruct;

  if (!self->_consistentDevice)
  {
    outputStruct = 1;
    p_performanceLevel = &self->_performanceLevel;
    BYTE1(outputStruct) = self->_performanceLevel;
    if (!CallIO(self->_connection, &outputStruct, &outputStruct, (uint64_t)"ConsistentPerfState_Set"))
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_FAULT))
        -[GPUPerformanceStateDefault _setConsistentPerformanceLevel].cold.1((uint64_t)p_performanceLevel, v12, v13, v14, v15, v16, v17, v18);
      goto LABEL_9;
    }
    goto LABEL_6;
  }
  v2 = &self->_performanceLevel;
  if ((-[AGXConsistentStateDevice enableConsistentPerfState:](self->_consistentDevice, "enableConsistentPerfState:", self->_performanceLevel) & 1) != 0)
  {
LABEL_6:
    LOBYTE(v3) = 1;
    return v3;
  }
  v3 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_FAULT);
  if (v3)
  {
    -[GPUPerformanceStateDefault _setConsistentPerformanceLevel].cold.1((uint64_t)v2, v4, v5, v6, v7, v8, v9, v10);
LABEL_9:
    LOBYTE(v3) = 0;
  }
  return v3;
}

- (BOOL)setUp
{
  void *v3;
  AGXConsistentStateDevice *v4;
  AGXConsistentStateDevice *consistentDevice;
  void *v6;
  BOOL v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  int v16;
  GPUPerformanceStateDefault *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
  {
    v16 = 138412290;
    v17 = self;
    _os_log_impl(&dword_21F8CF000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "Starting Setup - %@ Condition", (uint8_t *)&v16, 0xCu);
  }
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCF50]), "initWithSuiteName:", CFSTR("com.apple.dt.gputools.gpuperfstate"));
  objc_msgSend(v3, "setInteger:forKey:", self->_performanceLevel, CFSTR("gpuperfstate"));
  +[GPUPerformanceStateDefault consistentStateDevice](GPUPerformanceStateDefault, "consistentStateDevice");
  v4 = (AGXConsistentStateDevice *)objc_claimAutoreleasedReturnValue();
  consistentDevice = self->_consistentDevice;
  self->_consistentDevice = v4;

  if (!self->_consistentDevice)
  {
    if (IOServiceOpen(self->_acceleratorService, *MEMORY[0x24BDAEC58], 1u, &self->_connection))
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_FAULT))
        -[GPUPerformanceStateDefault setUp].cold.1((uint64_t)self, v8, v9, v10, v11, v12, v13, v14);
      goto LABEL_12;
    }
    if (!-[GPUPerformanceStateDefault _acquireLock](self, "_acquireLock"))
      goto LABEL_13;
  }
  if (!-[GPUPerformanceStateDefault _setConsistentPerformanceLevel](self, "_setConsistentPerformanceLevel"))
  {
LABEL_12:
    -[GPUPerformanceStateDefault _cleanup](self, "_cleanup");
LABEL_13:
    v7 = 0;
    goto LABEL_14;
  }
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
  {
    v16 = 138412290;
    v17 = self;
    _os_log_impl(&dword_21F8CF000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "Finished Setup - %@ Condition", (uint8_t *)&v16, 0xCu);
  }
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[GPUPerformanceStateDefault setUp]");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[GPUPerformanceStateDefault _dumpCurrentState:](self, "_dumpCurrentState:", v6);

  if (-[ApplePMPPerfStateControl setupConnectionForPowerState:](self->_applePMPPerfStateControl, "setupConnectionForPowerState:", self->_performanceLevel - 1))
  {
    v7 = 1;
  }
  else
  {
    v7 = 1;
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
    {
      v16 = 138412290;
      v17 = self;
      _os_log_impl(&dword_21F8CF000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "Unable to Setup PMP %@ Condition", (uint8_t *)&v16, 0xCu);
    }
  }
LABEL_14:

  return v7;
}

- (void)_dumpCurrentState:(id)a3
{
  id v4;
  AGXConsistentStateDevice *consistentDevice;
  void *v6;
  mach_port_t connection;
  _BOOL8 v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  _BOOL8 v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t outputStruct;
  uint8_t buf[4];
  id v26;
  __int16 v27;
  _BYTE v28[10];
  __int16 v29;
  int v30;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  consistentDevice = self->_consistentDevice;
  if (consistentDevice)
  {
    -[AGXConsistentStateDevice getConsistentPerfStateInfoAndReset:](consistentDevice, "getConsistentPerfStateInfoAndReset:", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412546;
        v26 = v4;
        v27 = 2112;
        *(_QWORD *)v28 = v6;
        _os_log_impl(&dword_21F8CF000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "%@ Consistent Perf State Status: %@", buf, 0x16u);
      }
    }
    else
    {
      v8 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_FAULT);
      if (v8)
        -[GPUPerformanceStateDefault _dumpCurrentState:].cold.1(v8, v9, v10, v11, v12, v13, v14, v15);
    }

  }
  else
  {
    connection = self->_connection;
    if (connection)
    {
      outputStruct = 2;
      if (CallIO(connection, &outputStruct, &outputStruct, (uint64_t)"ConsistentPerfState_Get"))
      {
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138413058;
          v26 = v4;
          v27 = 1024;
          *(_DWORD *)v28 = BYTE2(outputStruct);
          *(_WORD *)&v28[4] = 1024;
          *(_DWORD *)&v28[6] = BYTE3(outputStruct);
          v29 = 1024;
          v30 = BYTE4(outputStruct);
          _os_log_impl(&dword_21F8CF000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "%@ Consistent Perf State Status: is_enabled=%u was_maintained=%u level=%u", buf, 0x1Eu);
        }
      }
      else
      {
        v16 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_FAULT);
        if (v16)
          -[GPUPerformanceStateDefault _dumpCurrentState:].cold.1(v16, v17, v18, v19, v20, v21, v22, v23);
      }
    }
  }

}

- (void)tearDown
{
  void *v3;

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[GPUPerformanceStateDefault tearDown]");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[GPUPerformanceStateDefault _dumpCurrentState:](self, "_dumpCurrentState:", v3);

  -[GPUPerformanceStateDefault _cleanup](self, "_cleanup");
}

- (BOOL)active
{
  void *v3;
  void *v4;
  BOOL v5;

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCF50]), "initWithSuiteName:", CFSTR("com.apple.dt.gputools.gpuperfstate"));
  if (!self->_performanceLevel)
    -[GPUPerformanceStateDefault active].cold.1();
  v4 = v3;
  v5 = self->_performanceLevel == objc_msgSend(v3, "integerForKey:", CFSTR("gpuperfstate"));

  return v5;
}

- (unsigned)desiredGPUPerformanceState
{
  return self->_desiredGPUPerformanceState;
}

- (void)setDesiredGPUPerformanceState:(unsigned int)a3
{
  self->_desiredGPUPerformanceState = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_applePMPPerfStateControl, 0);
  objc_storeStrong((id *)&self->_consistentDevice, 0);
}

+ (void)perfLevelEnumToGPUStateStringKey:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_1(&dword_21F8CF000, MEMORY[0x24BDACB70], a3, "We should not have reached this log line! It means we got an GPUPerformanceStateLevel that is not handled in our switch!", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_6();
}

- (void)initWithGPUPerformanceState:.cold.1()
{
  __assert_rtn("-[GPUPerformanceStateDefault initWithGPUPerformanceState:]", "GPUPerformanceState.m", 281, "desiredGPUPerformanceState != GPUPerformanceStateLevelNone");
}

- (void)_acquireLock
{
  OUTLINED_FUNCTION_0_1(&dword_21F8CF000, MEMORY[0x24BDACB70], a3, "Error, fail to acquire consistent perf state SPI access!", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_6();
}

- (void)_setConsistentPerformanceLevel
{
  OUTLINED_FUNCTION_3_1(&dword_21F8CF000, MEMORY[0x24BDACB70], a3, "Error, fail to set consistent perf state to level = %u!", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_6();
}

- (void)setUp
{
  OUTLINED_FUNCTION_2_3(&dword_21F8CF000, MEMORY[0x24BDACB70], a3, "Unable to set %@ Condition", a5, a6, a7, a8, 2u);
}

- (void)_dumpCurrentState:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_1(&dword_21F8CF000, MEMORY[0x24BDACB70], a3, "Error, fail to get consistent perf state status!", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_6();
}

- (void)active
{
  __assert_rtn("-[GPUPerformanceStateDefault active]", "GPUPerformanceState.m", 420, "_performanceLevel != GPUPerformanceStateLevelNone");
}

@end
