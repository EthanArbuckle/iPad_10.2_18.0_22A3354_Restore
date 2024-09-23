@implementation CAFCarDataClientProxy

void __45___CAFCarDataClientProxy_initWithCarManager___block_invoke(uint64_t a1)
{
  NSObject *v2;
  id WeakRetained;
  void *v4;
  void *v5;
  void *v6;

  CAFDataClientLogging();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    __45___CAFCarDataClientProxy_initWithCarManager___block_invoke_cold_1();

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v4 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "carManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "_closeConnectionWithReason:", CFSTR("XPC Interrupted"));

    objc_msgSend(v4, "carManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "_setupCafdConnectionIfAvailable");

  }
}

void __45___CAFCarDataClientProxy_initWithCarManager___block_invoke_206(uint64_t a1)
{
  NSObject *v2;
  id WeakRetained;
  void *v4;

  CAFDataClientLogging();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    __45___CAFCarDataClientProxy_initWithCarManager___block_invoke_206_cold_1();

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "carManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "invalidate");

}

void __45___CAFCarDataClientProxy_initWithCarManager___block_invoke_207(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  _BOOL4 v5;
  id WeakRetained;
  NSObject *v7;
  _QWORD v8[4];
  id v9;
  id v10;

  v3 = a2;
  CAFDataClientLogging();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG);
  if (v3)
  {
    if (v5)
      __45___CAFCarDataClientProxy_initWithCarManager___block_invoke_207_cold_2();

    WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    objc_msgSend(WeakRetained, "workQueue");
    v7 = objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __45___CAFCarDataClientProxy_initWithCarManager___block_invoke_208;
    v8[3] = &unk_2508FD240;
    v9 = WeakRetained;
    v10 = v3;
    v4 = WeakRetained;
    dispatch_async(v7, v8);

  }
  else if (v5)
  {
    __45___CAFCarDataClientProxy_initWithCarManager___block_invoke_207_cold_1();
  }

}

void __45___CAFCarDataClientProxy_initWithCarManager___block_invoke_208(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "setCurrentCarConfig:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "carManager");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_updateCar");

}

void __52___CAFCarDataClientProxy_didUpdateCurrentCarConfig___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;

  CAFDataClientLogging();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    __52___CAFCarDataClientProxy_didUpdateCurrentCarConfig___block_invoke_cold_1();

  objc_msgSend(*(id *)(a1 + 32), "setCurrentCarConfig:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "carManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_updateCar");

}

void __42___CAFCarDataClientProxy_didUpdateConfig___block_invoke(uint64_t a1)
{
  id *v2;
  void *v3;
  NSObject *v4;
  NSObject *v5;

  v2 = (id *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 32), "currentCarConfig");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  CAFDataClientLogging();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
      __42___CAFCarDataClientProxy_didUpdateConfig___block_invoke_cold_2(v2, a1, v5);

    objc_msgSend(*(id *)(a1 + 32), "currentCarConfig");
    v5 = objc_claimAutoreleasedReturnValue();
    -[NSObject updateConfiguration:](v5, "updateConfiguration:", *(_QWORD *)(a1 + 40));
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    __42___CAFCarDataClientProxy_didUpdateConfig___block_invoke_cold_1();
  }

}

void __51___CAFCarDataClientProxy_didUpdatePluginID_values___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  NSObject *v4;

  objc_msgSend(*(id *)(a1 + 32), "carManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "currentCar");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(v3, "didUpdatePluginID:values:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  }
  else
  {
    CAFDataClientLogging();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __51___CAFCarDataClientProxy_didUpdatePluginID_values___block_invoke_cold_1();

  }
}

void __61___CAFCarDataClientProxy_didNotifyPluginID_instanceID_value___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  NSObject *v4;

  objc_msgSend(*(id *)(a1 + 32), "carManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "currentCar");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(v3, "didNotifyPluginID:instanceID:value:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
  }
  else
  {
    CAFDataClientLogging();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __61___CAFCarDataClientProxy_didNotifyPluginID_instanceID_value___block_invoke_cold_1();

  }
}

void __75___CAFCarDataClientProxy_didRequestPluginID_instanceID_value_withResponse___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;

  objc_msgSend(*(id *)(a1 + 32), "carManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "currentCar");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(v3, "didRequestPluginID:instanceID:value:withResponse:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64));
  }
  else
  {
    CAFDataClientLogging();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __75___CAFCarDataClientProxy_didRequestPluginID_instanceID_value_withResponse___block_invoke_cold_1();

    v5 = *(_QWORD *)(a1 + 64);
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("com.apple.caraccessoryframework.cardata"), 9, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, void *))(v5 + 16))(v5, 0, v6);

  }
}

void __45___CAFCarDataClientProxy_initWithCarManager___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_16();
  OUTLINED_FUNCTION_3_1(&dword_237717000, v0, v1, "connection interupted.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_15();
}

void __45___CAFCarDataClientProxy_initWithCarManager___block_invoke_206_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_16();
  OUTLINED_FUNCTION_3_1(&dword_237717000, v0, v1, "connection invalidated.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_15();
}

void __45___CAFCarDataClientProxy_initWithCarManager___block_invoke_207_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_16();
  OUTLINED_FUNCTION_9_0(&dword_237717000, v0, v1, "No carConfig available", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_15();
}

void __45___CAFCarDataClientProxy_initWithCarManager___block_invoke_207_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_9_1(&dword_237717000, v0, v1, "fetched carConfig %@", v2);
  OUTLINED_FUNCTION_6();
}

void __52___CAFCarDataClientProxy_didUpdateCurrentCarConfig___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5[12];
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  OUTLINED_FUNCTION_18();
  v8 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(v1 + 32), "currentCarConfig");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_11();
  v6 = 2112;
  v7 = v3;
  OUTLINED_FUNCTION_5(&dword_237717000, v0, v4, "didUpdateCurrentCarConfig from %@ to %@", v5);

  OUTLINED_FUNCTION_0();
}

void __42___CAFCarDataClientProxy_didUpdateConfig___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_16();
  OUTLINED_FUNCTION_3_1(&dword_237717000, v0, v1, "Received configuration update, but current car does not exist.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_15();
}

void __42___CAFCarDataClientProxy_didUpdateConfig___block_invoke_cold_2(id *a1, uint64_t a2, NSObject *a3)
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  void *v9;
  __int16 v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*a1, "currentCarConfig");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(*(id *)(a2 + 40), "count");
  v8 = 138412546;
  v9 = v5;
  v10 = 2048;
  v11 = v6;
  OUTLINED_FUNCTION_5(&dword_237717000, a3, v7, "didUpdateCarConfig %@ with plugins.count=%lu", (uint8_t *)&v8);

  OUTLINED_FUNCTION_0();
}

void __51___CAFCarDataClientProxy_didUpdatePluginID_values___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_16();
  OUTLINED_FUNCTION_3_1(&dword_237717000, v0, v1, "Update characteristic values, but current car does not exist.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_15();
}

void __61___CAFCarDataClientProxy_didNotifyPluginID_instanceID_value___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_16();
  OUTLINED_FUNCTION_3_1(&dword_237717000, v0, v1, "Notification, but current car does not exist.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_15();
}

void __75___CAFCarDataClientProxy_didRequestPluginID_instanceID_value_withResponse___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_16();
  OUTLINED_FUNCTION_3_1(&dword_237717000, v0, v1, "Request, but current car does not exist.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_15();
}

@end
