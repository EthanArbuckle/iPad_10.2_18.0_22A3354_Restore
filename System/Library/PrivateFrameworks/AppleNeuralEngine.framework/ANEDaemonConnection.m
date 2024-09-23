@implementation ANEDaemonConnection

void __73___ANEDaemonConnection_loadModel_sandboxExtension_options_qos_withReply___block_invoke_13(uint64_t a1, int a2, void *a3, uint64_t a4, uint64_t a5, uint64_t a6, void *a7, void *a8)
{
  id v12;
  id v13;
  id v14;
  NSObject *v15;
  _DWORD v16[2];
  __int16 v17;
  id v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a8;
  v14 = a7;
  +[_ANELog framework](_ANELog, "framework");
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
  {
    v16[0] = 67109634;
    v16[1] = a2;
    v17 = 2112;
    v18 = v12;
    v19 = 2112;
    v20 = v13;
    _os_log_debug_impl(&dword_1D3352000, v15, OS_LOG_TYPE_DEBUG, "[proxy loadModel:...] returned success=%d : attr=%@ : error=%@", (uint8_t *)v16, 0x1Cu);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __51___ANEDaemonConnection_beginRealTimeTaskWithReply___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  int v6;
  void *v7;
  __int16 v8;
  int v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  +[_ANELog framework](_ANELog, "framework");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    NSStringFromSelector(*(SEL *)(a1 + 32));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = 138412802;
    v7 = v5;
    v8 = 1024;
    v9 = 89;
    v10 = 2112;
    v11 = v3;
    _os_log_impl(&dword_1D3352000, v4, OS_LOG_TYPE_INFO, "%@: errorHandler %d: %@", (uint8_t *)&v6, 0x1Cu);

  }
}

uint64_t __51___ANEDaemonConnection_beginRealTimeTaskWithReply___block_invoke_6(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __49___ANEDaemonConnection_endRealTimeTaskWithReply___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  int v6;
  void *v7;
  __int16 v8;
  int v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  +[_ANELog framework](_ANELog, "framework");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    NSStringFromSelector(*(SEL *)(a1 + 32));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = 138412802;
    v7 = v5;
    v8 = 1024;
    v9 = 105;
    v10 = 2112;
    v11 = v3;
    _os_log_impl(&dword_1D3352000, v4, OS_LOG_TYPE_INFO, "%@: errorHandler %d: %@", (uint8_t *)&v6, 0x1Cu);

  }
}

uint64_t __49___ANEDaemonConnection_endRealTimeTaskWithReply___block_invoke_8(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __39___ANEDaemonConnection_echo_withReply___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  int v6;
  void *v7;
  __int16 v8;
  int v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  +[_ANELog framework](_ANELog, "framework");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    NSStringFromSelector(*(SEL *)(a1 + 32));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = 138412802;
    v7 = v5;
    v8 = 1024;
    v9 = 121;
    v10 = 2112;
    v11 = v3;
    _os_log_impl(&dword_1D3352000, v4, OS_LOG_TYPE_INFO, "%@: errorHandler %d: %@", (uint8_t *)&v6, 0x1Cu);

  }
}

uint64_t __39___ANEDaemonConnection_echo_withReply___block_invoke_9(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __76___ANEDaemonConnection_compileModel_sandboxExtension_options_qos_withReply___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  int v6;
  void *v7;
  __int16 v8;
  int v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  +[_ANELog framework](_ANELog, "framework");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    NSStringFromSelector(*(SEL *)(a1 + 32));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = 138412802;
    v7 = v5;
    v8 = 1024;
    v9 = 149;
    v10 = 2112;
    v11 = v3;
    _os_log_impl(&dword_1D3352000, v4, OS_LOG_TYPE_INFO, "%@: errorHandler %d: %@", (uint8_t *)&v6, 0x1Cu);

  }
}

void __76___ANEDaemonConnection_compileModel_sandboxExtension_options_qos_withReply___block_invoke_11(uint64_t a1, int a2, void *a3, void *a4, void *a5)
{
  id v9;
  id v10;
  id v11;
  NSObject *v12;
  _DWORD v13[2];
  __int16 v14;
  id v15;
  __int16 v16;
  id v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  +[_ANELog framework](_ANELog, "framework");
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    v13[0] = 67109890;
    v13[1] = a2;
    v14 = 2112;
    v15 = v9;
    v16 = 2112;
    v17 = v10;
    v18 = 2112;
    v19 = v11;
    _os_log_debug_impl(&dword_1D3352000, v12, OS_LOG_TYPE_DEBUG, "[proxy compileModel:...] returned success=%d : attr=%@ : cacheURLIdentifier=%@ : error=%@", (uint8_t *)v13, 0x26u);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __73___ANEDaemonConnection_loadModel_sandboxExtension_options_qos_withReply___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  int v6;
  void *v7;
  __int16 v8;
  int v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  +[_ANELog framework](_ANELog, "framework");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    NSStringFromSelector(*(SEL *)(a1 + 32));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = 138412802;
    v7 = v5;
    v8 = 1024;
    v9 = 181;
    v10 = 2112;
    v11 = v3;
    _os_log_impl(&dword_1D3352000, v4, OS_LOG_TYPE_INFO, "%@: errorHandler %d: %@", (uint8_t *)&v6, 0x1Cu);

  }
}

void __83___ANEDaemonConnection_loadModelNewInstance_options_modelInstParams_qos_withReply___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  int v6;
  void *v7;
  __int16 v8;
  int v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  +[_ANELog framework](_ANELog, "framework");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    NSStringFromSelector(*(SEL *)(a1 + 32));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = 138412802;
    v7 = v5;
    v8 = 1024;
    v9 = 219;
    v10 = 2112;
    v11 = v3;
    _os_log_impl(&dword_1D3352000, v4, OS_LOG_TYPE_INFO, "%@: errorHandler %d: %@", (uint8_t *)&v6, 0x1Cu);

  }
}

void __83___ANEDaemonConnection_loadModelNewInstance_options_modelInstParams_qos_withReply___block_invoke_15(uint64_t a1, int a2, void *a3, uint64_t a4, uint64_t a5, uint64_t a6, void *a7, void *a8)
{
  id v12;
  id v13;
  id v14;
  NSObject *v15;
  _DWORD v16[2];
  __int16 v17;
  id v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a8;
  v14 = a7;
  +[_ANELog framework](_ANELog, "framework");
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
  {
    v16[0] = 67109634;
    v16[1] = a2;
    v17 = 2112;
    v18 = v12;
    v19 = 2112;
    v20 = v13;
    _os_log_debug_impl(&dword_1D3352000, v15, OS_LOG_TYPE_DEBUG, "[proxy loadModelNewInstance:...] returned success=%d : attr=%@ : error=%@", (uint8_t *)v16, 0x1Cu);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __58___ANEDaemonConnection_unloadModel_options_qos_withReply___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  int v6;
  void *v7;
  __int16 v8;
  int v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  +[_ANELog framework](_ANELog, "framework");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    NSStringFromSelector(*(SEL *)(a1 + 32));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = 138412802;
    v7 = v5;
    v8 = 1024;
    v9 = 256;
    v10 = 2112;
    v11 = v3;
    _os_log_impl(&dword_1D3352000, v4, OS_LOG_TYPE_INFO, "%@: errorHandler %d: %@", (uint8_t *)&v6, 0x1Cu);

  }
}

void __58___ANEDaemonConnection_unloadModel_options_qos_withReply___block_invoke_16(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  NSObject *v5;

  v4 = a3;
  +[_ANELog framework](_ANELog, "framework");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    __58___ANEDaemonConnection_unloadModel_options_qos_withReply___block_invoke_16_cold_1();

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __54___ANEDaemonConnection_reportTelemetryToPPS_playload___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  int v6;
  void *v7;
  __int16 v8;
  int v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  +[_ANELog framework](_ANELog, "framework");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    NSStringFromSelector(*(SEL *)(a1 + 32));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = 138412802;
    v7 = v5;
    v8 = 1024;
    v9 = 273;
    v10 = 2112;
    v11 = v3;
    _os_log_impl(&dword_1D3352000, v4, OS_LOG_TYPE_INFO, "%@: errorHandler %d: %@", (uint8_t *)&v6, 0x1Cu);

  }
}

void __57___ANEDaemonConnection_compiledModelExistsFor_withReply___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  int v6;
  void *v7;
  __int16 v8;
  int v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  +[_ANELog framework](_ANELog, "framework");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    NSStringFromSelector(*(SEL *)(a1 + 32));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = 138412802;
    v7 = v5;
    v8 = 1024;
    v9 = 283;
    v10 = 2112;
    v11 = v3;
    _os_log_impl(&dword_1D3352000, v4, OS_LOG_TYPE_INFO, "%@: errorHandler %d: %@", (uint8_t *)&v6, 0x1Cu);

  }
}

void __57___ANEDaemonConnection_compiledModelExistsFor_withReply___block_invoke_17(uint64_t a1, int a2, void *a3, void *a4)
{
  id v7;
  id v8;
  NSObject *v9;
  _DWORD v10[2];
  __int16 v11;
  id v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  +[_ANELog framework](_ANELog, "framework");
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    v10[0] = 67109634;
    v10[1] = a2;
    v11 = 2112;
    v12 = v7;
    v13 = 2112;
    v14 = v8;
    _os_log_debug_impl(&dword_1D3352000, v9, OS_LOG_TYPE_DEBUG, "[proxy compiledModelExistsFor:...] returned success = %d : cacheURLIdentifier = %@ : with error = %@", (uint8_t *)v10, 0x1Cu);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __53___ANEDaemonConnection_purgeCompiledModel_withReply___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  int v6;
  void *v7;
  __int16 v8;
  int v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  +[_ANELog framework](_ANELog, "framework");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    NSStringFromSelector(*(SEL *)(a1 + 32));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = 138412802;
    v7 = v5;
    v8 = 1024;
    v9 = 298;
    v10 = 2112;
    v11 = v3;
    _os_log_impl(&dword_1D3352000, v4, OS_LOG_TYPE_INFO, "%@: errorHandler %d: %@", (uint8_t *)&v6, 0x1Cu);

  }
}

void __53___ANEDaemonConnection_purgeCompiledModel_withReply___block_invoke_19(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  NSObject *v5;

  v4 = a3;
  +[_ANELog framework](_ANELog, "framework");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    __53___ANEDaemonConnection_purgeCompiledModel_withReply___block_invoke_19_cold_1();

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __83___ANEDaemonConnection_prepareChainingWithModel_options_chainingReq_qos_withReply___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  int v6;
  void *v7;
  __int16 v8;
  int v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  +[_ANELog framework](_ANELog, "framework");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    NSStringFromSelector(*(SEL *)(a1 + 32));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = 138412802;
    v7 = v5;
    v8 = 1024;
    v9 = 327;
    v10 = 2112;
    v11 = v3;
    _os_log_impl(&dword_1D3352000, v4, OS_LOG_TYPE_INFO, "%@: errorHandler %d: %@", (uint8_t *)&v6, 0x1Cu);

  }
}

void __83___ANEDaemonConnection_prepareChainingWithModel_options_chainingReq_qos_withReply___block_invoke_20(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  NSObject *v5;

  v4 = a3;
  +[_ANELog framework](_ANELog, "framework");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    __83___ANEDaemonConnection_prepareChainingWithModel_options_chainingReq_qos_withReply___block_invoke_20_cold_1();

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __66___ANEDaemonConnection_compiledModelExistsMatchingHash_withReply___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  int v6;
  void *v7;
  __int16 v8;
  int v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  +[_ANELog framework](_ANELog, "framework");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    NSStringFromSelector(*(SEL *)(a1 + 32));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = 138412802;
    v7 = v5;
    v8 = 1024;
    v9 = 348;
    v10 = 2112;
    v11 = v3;
    _os_log_impl(&dword_1D3352000, v4, OS_LOG_TYPE_INFO, "%@: errorHandler %d: %@", (uint8_t *)&v6, 0x1Cu);

  }
}

void __66___ANEDaemonConnection_compiledModelExistsMatchingHash_withReply___block_invoke_21(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  NSObject *v5;

  v4 = a3;
  +[_ANELog framework](_ANELog, "framework");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    __66___ANEDaemonConnection_compiledModelExistsMatchingHash_withReply___block_invoke_21_cold_1();

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __65___ANEDaemonConnection_purgeCompiledModelMatchingHash_withReply___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  int v6;
  void *v7;
  __int16 v8;
  int v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  +[_ANELog framework](_ANELog, "framework");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    NSStringFromSelector(*(SEL *)(a1 + 32));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = 138412802;
    v7 = v5;
    v8 = 1024;
    v9 = 363;
    v10 = 2112;
    v11 = v3;
    _os_log_impl(&dword_1D3352000, v4, OS_LOG_TYPE_INFO, "%@: errorHandler %d: %@", (uint8_t *)&v6, 0x1Cu);

  }
}

void __65___ANEDaemonConnection_purgeCompiledModelMatchingHash_withReply___block_invoke_22(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  NSObject *v5;

  v4 = a3;
  +[_ANELog framework](_ANELog, "framework");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    __65___ANEDaemonConnection_purgeCompiledModelMatchingHash_withReply___block_invoke_22_cold_1();

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __58___ANEDaemonConnection_unloadModel_options_qos_withReply___block_invoke_16_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_0_7();
  OUTLINED_FUNCTION_1_6(&dword_1D3352000, v0, v1, "[proxy unloadModel:...] returned success = %d with error = %@");
  OUTLINED_FUNCTION_6();
}

void __53___ANEDaemonConnection_purgeCompiledModel_withReply___block_invoke_19_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_0_7();
  OUTLINED_FUNCTION_1_6(&dword_1D3352000, v0, v1, "[proxy purgeCompiledModel:...] returned success = %d with error = %@");
  OUTLINED_FUNCTION_6();
}

void __83___ANEDaemonConnection_prepareChainingWithModel_options_chainingReq_qos_withReply___block_invoke_20_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_0_7();
  OUTLINED_FUNCTION_1_6(&dword_1D3352000, v0, v1, "[proxy prepareChaining:...] returned success = %d with error = %@");
  OUTLINED_FUNCTION_6();
}

void __66___ANEDaemonConnection_compiledModelExistsMatchingHash_withReply___block_invoke_21_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_0_7();
  OUTLINED_FUNCTION_1_6(&dword_1D3352000, v0, v1, "[proxy compiledModelExistsMatchingHash:...] returned success = %d with error = %@");
  OUTLINED_FUNCTION_6();
}

void __65___ANEDaemonConnection_purgeCompiledModelMatchingHash_withReply___block_invoke_22_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_0_7();
  OUTLINED_FUNCTION_1_6(&dword_1D3352000, v0, v1, "[proxy purgeCompiledModelMatchingHash:...] returned success = %d with error = %@");
  OUTLINED_FUNCTION_6();
}

@end
