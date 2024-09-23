@implementation ANEDeviceController

void __34___ANEDeviceController_initialize__block_invoke()
{
  dispatch_queue_t v0;
  void *v1;
  NSObject *v2;

  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v2 = objc_claimAutoreleasedReturnValue();
  v0 = dispatch_queue_create("com.apple.ane.devicecontroller", v2);
  v1 = (void *)gANEControllerQueue;
  gANEControllerQueue = (uint64_t)v0;

}

void __29___ANEDeviceController_start__block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  NSObject *v7;
  uint64_t v8;
  NSObject *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  int v13;
  void *v14;
  uint64_t v15;
  uint8_t v16[4];
  void *v17;
  __int16 v18;
  int v19;
  __int16 v20;
  uint64_t v21;
  uint8_t buf[32];
  __int16 v23;
  int v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  +[_ANEVirtualClient sharedConnection](_ANEVirtualClient, "sharedConnection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    objc_msgSend(*(id *)(a1 + 32), "setDevice:", 0);
    +[_ANELog common](_ANELog, "common");
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      NSStringFromSelector(*(SEL *)(a1 + 40));
      objc_claimAutoreleasedReturnValue();
      __29___ANEDeviceController_start__block_invoke_cold_2();
    }

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "setUsecount:", objc_msgSend(*(id *)(a1 + 32), "usecount") + 1);
    +[_ANELog common](_ANELog, "common");
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      NSStringFromSelector(*(SEL *)(a1 + 40));
      v10 = (id)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(*(id *)(a1 + 32), "usecount");
      v12 = objc_msgSend(*(id *)(a1 + 32), "device");
      v13 = objc_msgSend(*(id *)(a1 + 32), "isPrivileged");
      *(_DWORD *)buf = 138413058;
      *(_QWORD *)&buf[4] = v10;
      *(_WORD *)&buf[12] = 2048;
      *(_QWORD *)&buf[14] = v11;
      *(_WORD *)&buf[22] = 2048;
      *(_QWORD *)&buf[24] = v12;
      v23 = 1024;
      v24 = v13;
      _os_log_debug_impl(&dword_1D3352000, v4, OS_LOG_TYPE_DEBUG, "%@: self.usecount=%lld : self.device=%p : self.isPrivileged=%d", buf, 0x26u);

    }
    if (objc_msgSend(*(id *)(a1 + 32), "usecount") == 1)
    {
      memset(buf, 0, sizeof(buf));
      if (objc_msgSend(*(id *)(a1 + 32), "isPrivileged"))
      {
        v5 = 0;
        v6 = 2;
        *(_DWORD *)buf = 2;
      }
      else
      {
        *(_DWORD *)buf = 1;
        v5 = objc_msgSend(*(id *)(a1 + 32), "programHandle");
        v6 = 1;
      }
      *(_QWORD *)&buf[8] = v5;
      *(_DWORD *)&buf[16] = 10000;
      *(_DWORD *)&buf[24] = 10000;
      +[_ANELog common](_ANELog, "common");
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      {
        NSStringFromSelector(*(SEL *)(a1 + 40));
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)v16 = 138412802;
        v17 = v14;
        v18 = 1024;
        v19 = v6;
        v20 = 2048;
        v21 = v5;
        _os_log_debug_impl(&dword_1D3352000, v7, OS_LOG_TYPE_DEBUG, "%@: Calling ANEDeviceOpen( deviceUsageType=%u : programHandle=%llu)", v16, 0x1Cu);

      }
      v15 = 0;
      v8 = *(_QWORD *)(a1 + 32);
      if (LoadDeviceNamed((uint64_t)&v15, (uint64_t)buf, v8)
        && LoadDeviceNamed((uint64_t)&v15, (uint64_t)buf, v8)
        || !v15)
      {
        +[_ANELog common](_ANELog, "common");
        v9 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        {
          NSStringFromSelector(*(SEL *)(a1 + 40));
          objc_claimAutoreleasedReturnValue();
          __29___ANEDeviceController_start__block_invoke_cold_1();
        }

        objc_msgSend(*(id *)(a1 + 32), "setDevice:", 0);
      }
      else
      {
        objc_msgSend(*(id *)(a1 + 32), "setDevice:");
      }
    }
  }
}

void __50___ANEDeviceController_sharedPrivilegedConnection__block_invoke()
{
  _ANEDeviceController *v0;
  void *v1;

  v0 = -[_ANEDeviceController initWithProgramHandle:priviledged:]([_ANEDeviceController alloc], "initWithProgramHandle:priviledged:", 0, 1);
  v1 = (void *)+[_ANEDeviceController sharedPrivilegedConnection]::conn;
  +[_ANEDeviceController sharedPrivilegedConnection]::conn = (uint64_t)v0;

}

void __28___ANEDeviceController_stop__block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  NSObject *v4;
  NSObject *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint8_t buf[4];
  id v13;
  __int16 v14;
  uint64_t v15;
  __int16 v16;
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "setUsecount:", objc_msgSend(*(id *)(a1 + 32), "usecount") - 1);
  +[_ANELog common](_ANELog, "common");
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    NSStringFromSelector(*(SEL *)(a1 + 40));
    v6 = (id)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(*(id *)(a1 + 32), "usecount");
    v8 = objc_msgSend(*(id *)(a1 + 32), "device");
    *(_DWORD *)buf = 138412802;
    v13 = v6;
    v14 = 2048;
    v15 = v7;
    v16 = 2048;
    v17 = v8;
    _os_log_debug_impl(&dword_1D3352000, v2, OS_LOG_TYPE_DEBUG, "%@: self.usecount=%lld : self.device=%p", buf, 0x20u);

  }
  if (!objc_msgSend(*(id *)(a1 + 32), "usecount") && objc_msgSend(*(id *)(a1 + 32), "device"))
  {
    v3 = objc_msgSend(*(id *)(a1 + 32), "device");
    if (!v3 || !*(_QWORD *)v3 || (*(unsigned int (**)(void))(*(_QWORD *)v3 + 8))())
    {
      +[_ANELog common](_ANELog, "common");
      v4 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(*(SEL *)(a1 + 40));
        objc_claimAutoreleasedReturnValue();
        __28___ANEDeviceController_stop__block_invoke_cold_1();
      }

    }
    objc_msgSend(*(id *)(a1 + 32), "setDevice:", 0);
    +[_ANELog common](_ANELog, "common");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      NSStringFromSelector(*(SEL *)(a1 + 40));
      v9 = (id)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(*(id *)(a1 + 32), "usecount");
      v11 = objc_msgSend(*(id *)(a1 + 32), "device");
      *(_DWORD *)buf = 138412802;
      v13 = v9;
      v14 = 2048;
      v15 = v10;
      v16 = 2048;
      v17 = v11;
      _os_log_debug_impl(&dword_1D3352000, v5, OS_LOG_TYPE_DEBUG, "%@: ANEDeviceClose() self.usecount=%lld : self.device=%p", buf, 0x20u);

    }
  }
}

void __29___ANEDeviceController_start__block_invoke_cold_1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  int v3;
  uint8_t *v4;
  NSObject *v5;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_37(v1, v2, v3, 5.778e-34);
  OUTLINED_FUNCTION_32(&dword_1D3352000, "%@: ANEDeviceOpen() failed : ret=%u :", v4, v5);

  OUTLINED_FUNCTION_2_0();
}

void __29___ANEDeviceController_start__block_invoke_cold_2()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  NSObject *v3;
  uint8_t *v4;

  OUTLINED_FUNCTION_5();
  *(_DWORD *)v1 = 138412290;
  *(_QWORD *)(v1 + 4) = v2;
  OUTLINED_FUNCTION_6_0(&dword_1D3352000, v3, (uint64_t)v3, "%@: ANEDeviceController not instantiated in VM", v4);

  OUTLINED_FUNCTION_2_0();
}

void __28___ANEDeviceController_stop__block_invoke_cold_1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  int v3;
  uint8_t *v4;
  NSObject *v5;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_37(v1, v2, v3, 5.778e-34);
  OUTLINED_FUNCTION_32(&dword_1D3352000, "%@: ANEDeviceClose() failed : ret=%u :", v4, v5);

  OUTLINED_FUNCTION_2_0();
}

@end
