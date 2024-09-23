@implementation MTLCreateSimulatorDevice

void __MTLCreateSimulatorDevice_block_invoke()
{
  void *v0;
  uint64_t (*v1)(void);
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _BOOL8 v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  _BOOL8 v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;

  MTLDeviceArrayInitialize();
  if (_MTLIsInternalBuild())
  {
    v0 = dlopen("/System/Library/PrivateFrameworks/MTLSimDriver.framework/MTLSimDriver", 5);
    if (v0)
    {
      v1 = (uint64_t (*)(void))dlsym(v0, "MTLCreateSimulatorDevice");
      if (v1)
      {
        v2 = (void *)v1();
        MTLCreateSimulatorDevice::device = (uint64_t)v2;
        if (v2)
          MTLAddDevice(v2, v3, v4, v5, v6, v7, v8, v9);
        return;
      }
      v18 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v18)
        __MTLCreateSimulatorDevice_block_invoke_cold_2(v18, v19, v20, v21, v22, v23, v24, v25);
    }
    else
    {
      v10 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v10)
        __MTLCreateSimulatorDevice_block_invoke_cold_1(v10, v11, v12, v13, v14, v15, v16, v17);
    }
    MTLCreateSimulatorDevice::device = 0;
  }
}

void __MTLCreateSimulatorDevice_block_invoke_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_2(&dword_182636000, MEMORY[0x1E0C81028], a3, "could not open MTLSimDriver!", a5, a6, a7, a8, 0);
}

void __MTLCreateSimulatorDevice_block_invoke_cold_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_2(&dword_182636000, MEMORY[0x1E0C81028], a3, "could not find symbol MTLCreateSimulatorDevice", a5, a6, a7, a8, 0);
}

@end
