@implementation ANEVirtualClient

void __37___ANEVirtualClient_sharedConnection__block_invoke()
{
  _ANEVirtualClient *v0;
  void *v1;

  v0 = -[_ANEVirtualClient initWithSingletonAccess]([_ANEVirtualClient alloc], "initWithSingletonAccess");
  v1 = (void *)+[_ANEVirtualClient sharedConnection]::client;
  +[_ANEVirtualClient sharedConnection]::client = (uint64_t)v0;

}

void __65___ANEVirtualClient_evaluateWithModel_options_request_qos_error___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  _BOOL4 v5;
  void (**v6)(_QWORD, _QWORD, _QWORD);
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void (**v11)(_QWORD, _QWORD, _QWORD);
  uint64_t v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = objc_msgSend(*(id *)(a1 + 32), "signaledValue");
  v5 = os_log_type_enabled((os_log_t)gLogger, OS_LOG_TYPE_DEBUG);
  if (v4 == 4097)
  {
    if (v5)
      __65___ANEVirtualClient_evaluateWithModel_options_request_qos_error___block_invoke_cold_1();
    objc_msgSend(*(id *)(a1 + 40), "completionHandler");
    v6 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    v6[2](v6, 1, 0);
    v7 = v3;
  }
  else
  {
    if (v5)
      __65___ANEVirtualClient_evaluateWithModel_options_request_qos_error___block_invoke_cold_2();
    v8 = (void *)MEMORY[0x1E0CB35C8];
    +[_ANEStrings errorDomainVirtIO](_ANEStrings, "errorDomainVirtIO");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = *MEMORY[0x1E0CB2D50];
    v13[0] = CFSTR("Failed to match value in success handler");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, &v12, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "errorWithDomain:code:userInfo:", v9, 0, v10);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 40), "completionHandler");
    v11 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, _QWORD, void *))v11)[2](v11, 0, v7);

    v6 = (void (**)(_QWORD, _QWORD, _QWORD))v3;
  }

}

void __65___ANEVirtualClient_evaluateWithModel_options_request_qos_error___block_invoke_49(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void (**v12)(_QWORD, _QWORD, _QWORD);
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint8_t buf[4];
  id v17;
  __int16 v18;
  uint64_t v19;
  __int16 v20;
  uint64_t v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = (id)gLogger;
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    v13 = objc_msgSend(*(id *)(a1 + 32), "signaledValue");
    *(_DWORD *)buf = 134218496;
    v17 = v5;
    v18 = 2048;
    v19 = a3;
    v20 = 2048;
    v21 = v13;
    _os_log_debug_impl(&dword_1D3352000, v6, OS_LOG_TYPE_DEBUG, "notifyListener failure. Sending error on completion handler: event:%p, value:%llx signaledValue %llx ", buf, 0x20u);
  }

  if (objc_msgSend(*(id *)(a1 + 32), "signaledValue") == -536870186)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%x: Program Inference timeout"), 3758097110);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[_ANEErrors timeoutErrorForMethod:](_ANEErrors, "timeoutErrorForMethod:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%llx"), objc_msgSend(*(id *)(a1 + 32), "signaledValue"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)MEMORY[0x1E0CB35C8];
    +[_ANEStrings errorDomainVirtIO](_ANEStrings, "errorDomainVirtIO");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = *MEMORY[0x1E0CB2D50];
    v15 = v7;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v15, &v14, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "errorWithDomain:code:userInfo:", v10, 0, v11);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(*(id *)(a1 + 40), "completionHandler");
  v12 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  ((void (**)(_QWORD, _QWORD, void *))v12)[2](v12, 0, v8);

}

void __65___ANEVirtualClient_evaluateWithModel_options_request_qos_error___block_invoke_56(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char v8;
  id v9;
  id v10;

  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v4 = *(_QWORD *)(a1 + 48);
  v5 = *(_QWORD *)(a1 + 56);
  v6 = *(_QWORD *)(a1 + 64);
  v7 = *(unsigned int *)(a1 + 80);
  v10 = 0;
  v8 = objc_msgSend(v2, "doEvaluateWithModel:options:request:qos:completionEvent:error:", v3, v4, v5, v7, v6, &v10);
  v9 = v10;
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = v8;

}

uint64_t __65___ANEVirtualClient_evaluateWithModel_options_request_qos_error___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "doEvaluateWithModel:options:request:qos:completionEvent:error:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(unsigned int *)(a1 + 80), 0, *(_QWORD *)(a1 + 72));
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = result;
  return result;
}

void __73___ANEVirtualClient_mapIOSurfacesWithModel_request_cacheInference_error___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char v6;
  id v7;
  void (**v8)(_QWORD, _QWORD, _QWORD);
  id v9;

  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v4 = *(_QWORD *)(a1 + 48);
  v5 = *(unsigned __int8 *)(a1 + 64);
  v9 = 0;
  v6 = objc_msgSend(v2, "doMapIOSurfacesWithModel:request:cacheInference:error:", v3, v4, v5, &v9);
  v7 = v9;
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = v6;
  objc_msgSend(*(id *)(a1 + 48), "completionHandler");
  v8 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  ((void (**)(_QWORD, _QWORD, id))v8)[2](v8, *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24), v7);

}

uint64_t __73___ANEVirtualClient_mapIOSurfacesWithModel_request_cacheInference_error___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "doMapIOSurfacesWithModel:request:cacheInference:error:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(unsigned __int8 *)(a1 + 72), *(_QWORD *)(a1 + 64));
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = result;
  return result;
}

void __65___ANEVirtualClient_evaluateWithModel_options_request_qos_error___block_invoke_cold_1()
{
  NSObject *v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_4_2(&dword_1D3352000, v0, (uint64_t)v0, "notifyListener success completion event: event:%p, 0x%llx\n", v1);
  OUTLINED_FUNCTION_6();
}

void __65___ANEVirtualClient_evaluateWithModel_options_request_qos_error___block_invoke_cold_2()
{
  NSObject *v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_4_2(&dword_1D3352000, v0, (uint64_t)v0, "Failed to match success completion signal value. Sending error on completion handler: event:%p, value: 0x%llx", v1);
  OUTLINED_FUNCTION_6();
}

@end
