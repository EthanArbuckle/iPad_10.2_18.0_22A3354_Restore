@implementation ANEClient

void __48___ANEClient_connectionForLoadingModel_options___block_invoke(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;

  v11 = a2;
  if (objc_msgSend(a3, "containsObject:", *(_QWORD *)(a1 + 32)))
  {
    objc_msgSend(*(id *)(a1 + 40), "connections");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKeyedSubscript:", v11);
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v10 = *(void **)(v9 + 40);
    *(_QWORD *)(v9 + 40) = v8;

    *a4 = 1;
  }

}

void __44___ANEClient_doLoadModel_options_qos_error___block_invoke(uint64_t a1)
{
  void *v2;
  char v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD v12[4];
  id v13;
  int8x16_t v14;
  uint64_t v15;
  int v16;
  id v17;

  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", kANEFModelHasCacheURLIdentifierKey[0]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLValue");

  if ((v3 & 1) != 0)
  {
    v4 = 0;
LABEL_6:
    objc_msgSend(*(id *)(a1 + 48), "connectionForLoadingModel:options:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = *(_QWORD *)(a1 + 32);
    v9 = *(void **)(a1 + 40);
    v11 = *(unsigned int *)(a1 + 80);
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __44___ANEClient_doLoadModel_options_qos_error___block_invoke_2;
    v12[3] = &unk_1E9516678;
    v15 = *(_QWORD *)(a1 + 72);
    v13 = v9;
    v14 = vextq_s8(*(int8x16_t *)(a1 + 56), *(int8x16_t *)(a1 + 56), 8uLL);
    v16 = *(_DWORD *)(a1 + 80);
    objc_msgSend(v8, "loadModel:sandboxExtension:options:qos:withReply:", v13, v4, v10, v11, v12);

    goto LABEL_7;
  }
  v5 = *(_QWORD *)(a1 + 40);
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v17 = *(id *)(v6 + 40);
  +[_ANESandboxingHelper issueSandboxExtensionForModel:error:](_ANESandboxingHelper, "issueSandboxExtensionForModel:error:", v5, &v17);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong((id *)(v6 + 40), v17);
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40))
    goto LABEL_6;
  v7 = (void *)gLogger_1;
  if (os_log_type_enabled((os_log_t)gLogger_1, OS_LOG_TYPE_ERROR))
    __45___ANEClient_compileModel_options_qos_error___block_invoke_cold_1(a1, v7);
LABEL_7:

}

void __44___ANEClient_doLoadModel_options_qos_error___block_invoke_2(uint64_t a1, int a2, void *a3, uint64_t a4, uint64_t a5, uint64_t a6, void *a7, void *a8)
{
  id v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  id *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  NSObject *v26;
  uint64_t v27;
  const char *aSelector;
  char *aSelectora;
  uint8_t buf[4];
  char *v31;
  __int16 v32;
  uint64_t v33;
  __int16 v34;
  int v35;
  __int16 v36;
  uint64_t v37;
  __int16 v38;
  uint64_t v39;
  __int16 v40;
  int v41;
  __int16 v42;
  id v43;
  __int16 v44;
  id v45;
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v15 = a3;
  v16 = a7;
  v17 = a8;
  v18 = (void *)gLogger_1;
  if (os_log_type_enabled((os_log_t)gLogger_1, OS_LOG_TYPE_DEBUG))
  {
    aSelector = *(const char **)(a1 + 56);
    v26 = v18;
    NSStringFromSelector(aSelector);
    aSelectora = (char *)objc_claimAutoreleasedReturnValue();
    v27 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138414082;
    v31 = aSelectora;
    v32 = 2048;
    v33 = v27;
    v34 = 1024;
    v35 = a2;
    v36 = 2048;
    v37 = a4;
    v38 = 2048;
    v39 = a5;
    v40 = 1024;
    v41 = a6;
    v42 = 2112;
    v43 = v16;
    v44 = 2112;
    v45 = v17;
    _os_log_debug_impl(&dword_1D3352000, v26, OS_LOG_TYPE_DEBUG, "%@: model[%p] : success=%d : progamHandle=0x%llx : intermediateBufferHandle=%llu : queueDepth=%d : modelCacheIdentifier=%@ : err=%@", buf, 0x4Au);

  }
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a2;
  v20 = (id *)(a1 + 32);
  v19 = *(void **)(a1 + 32);
  if (!a2)
  {
    objc_msgSend(v19, "updateModelAttributes:state:", v15, 5);
    if (!v17)
      goto LABEL_12;
LABEL_11:
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), a8);
    goto LABEL_12;
  }
  objc_msgSend(v19, "updateModelAttributes:state:programHandle:intermediateBufferHandle:queueDepth:", v15, 3, a4, a5, a6);
  objc_msgSend(*v20, "setCacheURLIdentifier:", v16);
  +[_ANEDeviceController controllerWithProgramHandle:](_ANEDeviceController, "controllerWithProgramHandle:", a4);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  +[_ANEProgramForEvaluation programWithController:intermediateBufferHandle:queueDepth:](_ANEProgramForEvaluation, "programWithController:intermediateBufferHandle:queueDepth:", v21, a5, a6);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*v20, "setProgram:", v22);

  v23 = (void *)gLogger_1;
  if (os_log_type_enabled((os_log_t)gLogger_1, OS_LOG_TYPE_DEBUG))
    __44___ANEClient_doLoadModel_options_qos_error___block_invoke_2_cold_2(a1 + 32, v23);
  +[_ANEProgramIOSurfacesMapper mapperWithController:](_ANEProgramIOSurfacesMapper, "mapperWithController:", v21);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*v20, "setMapper:", v24);

  v25 = (void *)gLogger_1;
  if (os_log_type_enabled((os_log_t)gLogger_1, OS_LOG_TYPE_DEBUG))
    __44___ANEClient_doLoadModel_options_qos_error___block_invoke_2_cold_1(a1 + 32, v25);

  if (v17)
    goto LABEL_11;
LABEL_12:
  objc_msgSend(*(id *)(a1 + 32), "string_id");
  kdebug_trace();

}

void __30___ANEClient_sharedConnection__block_invoke()
{
  _ANEClient *v0;
  void *v1;

  v0 = -[_ANEClient initWithRestrictedAccessAllowed:]([_ANEClient alloc], "initWithRestrictedAccessAllowed:", 0);
  v1 = (void *)sharedConnection_client;
  sharedConnection_client = (uint64_t)v0;

}

void __46___ANEClient_initWithRestrictedAccessAllowed___block_invoke(uint64_t a1)
{
  void *v2;

  v2 = (void *)gLogger_1;
  if (os_log_type_enabled((os_log_t)gLogger_1, OS_LOG_TYPE_DEBUG))
    __46___ANEClient_initWithRestrictedAccessAllowed___block_invoke_cold_1(a1, v2);
}

void __46___ANEClient_initWithRestrictedAccessAllowed___block_invoke_6(uint64_t a1)
{
  void *v2;

  v2 = (void *)gLogger_1;
  if (os_log_type_enabled((os_log_t)gLogger_1, OS_LOG_TYPE_DEBUG))
    __46___ANEClient_initWithRestrictedAccessAllowed___block_invoke_6_cold_1(a1, v2);
}

void __33___ANEClient_fastConnWithoutLock__block_invoke(uint64_t a1)
{
  void *v2;

  v2 = (void *)gLogger_1;
  if (os_log_type_enabled((os_log_t)gLogger_1, OS_LOG_TYPE_DEBUG))
    __46___ANEClient_initWithRestrictedAccessAllowed___block_invoke_cold_1(a1, v2);
}

void __33___ANEClient_fastConnWithoutLock__block_invoke_10(uint64_t a1)
{
  void *v2;

  v2 = (void *)gLogger_1;
  if (os_log_type_enabled((os_log_t)gLogger_1, OS_LOG_TYPE_DEBUG))
    __46___ANEClient_initWithRestrictedAccessAllowed___block_invoke_6_cold_1(a1, v2);
}

void __44___ANEClient_connectionUsedForLoadingModel___block_invoke(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;

  v11 = a2;
  if (objc_msgSend(a3, "containsObject:", *(_QWORD *)(a1 + 32)))
  {
    objc_msgSend(*(id *)(a1 + 40), "connections");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKeyedSubscript:", v11);
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v10 = *(void **)(v9 + 40);
    *(_QWORD *)(v9 + 40) = v8;

    *a4 = 1;
  }

}

void __45___ANEClient_compileModel_options_qos_error___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  _QWORD v14[4];
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  int v19;
  id v20;

  v3 = a1 + 32;
  v2 = *(_QWORD *)(a1 + 32);
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v20 = *(id *)(v4 + 40);
  +[_ANESandboxingHelper issueSandboxExtensionForModel:error:](_ANESandboxingHelper, "issueSandboxExtensionForModel:error:", v2, &v20);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong((id *)(v4 + 40), v20);
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v3 + 24) + 8) + 40))
  {
    v6 = (void *)gLogger_1;
    if (os_log_type_enabled((os_log_t)gLogger_1, OS_LOG_TYPE_ERROR))
      __45___ANEClient_compileModel_options_qos_error___block_invoke_cold_1(a1, v6);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "conn");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = *(void **)(a1 + 32);
    v9 = *(_QWORD *)(a1 + 48);
    v10 = *(unsigned int *)(a1 + 80);
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __45___ANEClient_compileModel_options_qos_error___block_invoke_2;
    v14[3] = &unk_1E9516538;
    v11 = *(_QWORD *)(a1 + 64);
    v18 = *(_QWORD *)(a1 + 72);
    v16 = v11;
    v12 = v8;
    v13 = *(_QWORD *)(a1 + 56);
    v15 = v12;
    v17 = v13;
    v19 = *(_DWORD *)(a1 + 80);
    objc_msgSend(v7, "compileModel:sandboxExtension:options:qos:withReply:", v12, v5, v9, v10, v14);

  }
}

void __45___ANEClient_compileModel_options_qos_error___block_invoke_2(uint64_t a1, int a2, void *a3, void *a4, void *a5)
{
  id v9;
  id v10;
  id v11;
  void *v12;
  const char *v13;
  NSObject *v14;
  void *v15;
  int v16;
  void *v17;
  __int16 v18;
  int v19;
  __int16 v20;
  id v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = (void *)gLogger_1;
  if (os_log_type_enabled((os_log_t)gLogger_1, OS_LOG_TYPE_DEBUG))
  {
    v13 = *(const char **)(a1 + 56);
    v14 = v12;
    NSStringFromSelector(v13);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 138413058;
    v17 = v15;
    v18 = 1024;
    v19 = a2;
    v20 = 2112;
    v21 = v10;
    v22 = 2112;
    v23 = v11;
    _os_log_debug_impl(&dword_1D3352000, v14, OS_LOG_TYPE_DEBUG, "%@: success=%d : cacheURLIdentifier=%@ : err=%@", (uint8_t *)&v16, 0x26u);

  }
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a2;
  if (a2)
  {
    objc_msgSend(*(id *)(a1 + 32), "updateModelAttributes:state:", v9, 2);
    objc_msgSend(*(id *)(a1 + 32), "setCacheURLIdentifier:", v10);
  }
  if (v11)
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), a5);
  objc_msgSend(*(id *)(a1 + 32), "string_id");
  kdebug_trace();

}

void __46___ANEClient_doUnloadModel_options_qos_error___block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD v5[4];
  id v6;
  __int128 v7;
  uint64_t v8;
  int v9;

  v2 = *(void **)(a1 + 32);
  v1 = *(void **)(a1 + 40);
  v3 = *(_QWORD *)(a1 + 48);
  v4 = *(unsigned int *)(a1 + 80);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __46___ANEClient_doUnloadModel_options_qos_error___block_invoke_2;
  v5[3] = &unk_1E9516588;
  v8 = *(_QWORD *)(a1 + 72);
  v7 = *(_OWORD *)(a1 + 56);
  v9 = v4;
  v6 = v1;
  objc_msgSend(v2, "unloadModel:options:qos:withReply:", v6, v3, v4, v5);

}

void __46___ANEClient_doUnloadModel_options_qos_error___block_invoke_2(uint64_t a1, int a2, void *a3)
{
  id v6;
  void *v7;
  const char *v8;
  NSObject *v9;
  void *v10;
  int v11;
  void *v12;
  __int16 v13;
  int v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void *)gLogger_1;
  if (os_log_type_enabled((os_log_t)gLogger_1, OS_LOG_TYPE_DEBUG))
  {
    v8 = *(const char **)(a1 + 56);
    v9 = v7;
    NSStringFromSelector(v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 138412802;
    v12 = v10;
    v13 = 1024;
    v14 = a2;
    v15 = 2112;
    v16 = v6;
    _os_log_debug_impl(&dword_1D3352000, v9, OS_LOG_TYPE_DEBUG, "%@: success=%d : err=%@", (uint8_t *)&v11, 0x1Cu);

  }
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a2;
  if (v6)
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), a3);
  objc_msgSend(*(id *)(a1 + 32), "string_id");
  kdebug_trace();

}

void __37___ANEClient_compiledModelExistsFor___block_invoke(uint64_t a1, int a2, void *a3, void *a4)
{
  id v7;
  id v8;
  void *v9;
  const char *v10;
  NSObject *v11;
  void *v12;
  int v13;
  void *v14;
  __int16 v15;
  int v16;
  __int16 v17;
  id v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = (void *)gLogger_1;
  if (os_log_type_enabled((os_log_t)gLogger_1, OS_LOG_TYPE_DEBUG))
  {
    v10 = *(const char **)(a1 + 56);
    v11 = v9;
    NSStringFromSelector(v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 138413058;
    v14 = v12;
    v15 = 1024;
    v16 = a2;
    v17 = 2112;
    v18 = v7;
    v19 = 2112;
    v20 = v8;
    _os_log_debug_impl(&dword_1D3352000, v11, OS_LOG_TYPE_DEBUG, "%@: success=%d : cacheURLIdentifier=%@ : err=%@", (uint8_t *)&v13, 0x26u);

  }
  objc_msgSend(*(id *)(a1 + 32), "setCacheURLIdentifier:", v7);
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a2;
  if (v8)
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), a4);
  objc_msgSend(*(id *)(a1 + 32), "string_id");
  kdebug_trace();

}

void __33___ANEClient_purgeCompiledModel___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v6;
  void *v7;
  const char *v8;
  NSObject *v9;
  void *v10;
  int v11;
  void *v12;
  __int16 v13;
  int v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void *)gLogger_1;
  if (os_log_type_enabled((os_log_t)gLogger_1, OS_LOG_TYPE_DEBUG))
  {
    v8 = *(const char **)(a1 + 56);
    v9 = v7;
    NSStringFromSelector(v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 138412802;
    v12 = v10;
    v13 = 1024;
    v14 = a2;
    v15 = 2112;
    v16 = v6;
    _os_log_debug_impl(&dword_1D3352000, v9, OS_LOG_TYPE_DEBUG, "%@: success=%d : err=%@", (uint8_t *)&v11, 0x1Cu);

  }
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a2;
  if (v6)
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), a3);
  objc_msgSend(*(id *)(a1 + 32), "string_id");
  kdebug_trace();

}

void __46___ANEClient_compiledModelExistsMatchingHash___block_invoke(_QWORD *a1, int a2, void *a3)
{
  id v6;
  void *v7;
  const char *v8;
  NSObject *v9;
  void *v10;
  int v11;
  void *v12;
  __int16 v13;
  int v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void *)gLogger_1;
  if (os_log_type_enabled((os_log_t)gLogger_1, OS_LOG_TYPE_DEBUG))
  {
    v8 = (const char *)a1[6];
    v9 = v7;
    NSStringFromSelector(v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 138412802;
    v12 = v10;
    v13 = 1024;
    v14 = a2;
    v15 = 2112;
    v16 = v6;
    _os_log_debug_impl(&dword_1D3352000, v9, OS_LOG_TYPE_DEBUG, "%@: success=%d : err=%@", (uint8_t *)&v11, 0x1Cu);

  }
  *(_BYTE *)(*(_QWORD *)(a1[4] + 8) + 24) = a2;
  if (v6)
    objc_storeStrong((id *)(*(_QWORD *)(a1[5] + 8) + 40), a3);
  kdebug_trace();

}

void __45___ANEClient_purgeCompiledModelMatchingHash___block_invoke(_QWORD *a1, int a2, void *a3)
{
  id v6;
  void *v7;
  const char *v8;
  NSObject *v9;
  void *v10;
  int v11;
  void *v12;
  __int16 v13;
  int v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void *)gLogger_1;
  if (os_log_type_enabled((os_log_t)gLogger_1, OS_LOG_TYPE_DEBUG))
  {
    v8 = (const char *)a1[6];
    v9 = v7;
    NSStringFromSelector(v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 138412802;
    v12 = v10;
    v13 = 1024;
    v14 = a2;
    v15 = 2112;
    v16 = v6;
    _os_log_debug_impl(&dword_1D3352000, v9, OS_LOG_TYPE_DEBUG, "%@: success=%d : err=%@", (uint8_t *)&v11, 0x1Cu);

  }
  *(_BYTE *)(*(_QWORD *)(a1[4] + 8) + 24) = a2;
  if (v6)
    objc_storeStrong((id *)(*(_QWORD *)(a1[5] + 8) + 40), a3);
  kdebug_trace();

}

void __37___ANEClient_sharedPrivateConnection__block_invoke()
{
  _ANEClient *v0;
  void *v1;

  v0 = -[_ANEClient initWithRestrictedAccessAllowed:]([_ANEClient alloc], "initWithRestrictedAccessAllowed:", 1);
  v1 = (void *)sharedPrivateConnection_client;
  sharedPrivateConnection_client = (uint64_t)v0;

}

void __31___ANEClient_beginRealTimeTask__block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5;
  void *v6;
  const char *v7;
  NSObject *v8;
  void *v9;
  int v10;
  void *v11;
  __int16 v12;
  int v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = a2;
  v6 = (void *)gLogger_1;
  if (os_log_type_enabled((os_log_t)gLogger_1, OS_LOG_TYPE_DEBUG))
  {
    v7 = *(const char **)(a1 + 40);
    v8 = v6;
    NSStringFromSelector(v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138412802;
    v11 = v9;
    v12 = 1024;
    v13 = a2;
    v14 = 2112;
    v15 = v5;
    _os_log_debug_impl(&dword_1D3352000, v8, OS_LOG_TYPE_DEBUG, "%@: success=%d : err=%@", (uint8_t *)&v10, 0x1Cu);

  }
}

void __29___ANEClient_endRealTimeTask__block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5;
  void *v6;
  const char *v7;
  NSObject *v8;
  void *v9;
  int v10;
  void *v11;
  __int16 v12;
  int v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = a2;
  v6 = (void *)gLogger_1;
  if (os_log_type_enabled((os_log_t)gLogger_1, OS_LOG_TYPE_DEBUG))
  {
    v7 = *(const char **)(a1 + 40);
    v8 = v6;
    NSStringFromSelector(v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138412802;
    v11 = v9;
    v12 = 1024;
    v13 = a2;
    v14 = 2112;
    v15 = v5;
    _os_log_debug_impl(&dword_1D3352000, v8, OS_LOG_TYPE_DEBUG, "%@: success=%d : err=%@", (uint8_t *)&v10, 0x1Cu);

  }
}

void __71___ANEClient_doLoadModelNewInstance_options_modelInstParams_qos_error___block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  void *v30;
  _QWORD v31[4];
  id v32;
  int8x16_t v33;
  uint64_t v34;
  int v35;
  id obj;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  _BYTE v45[128];
  _BYTE v46[128];
  uint64_t v47;

  v1 = a1;
  v47 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", kANEFBaseModelIdentifierKey[0]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = 0u;
  v42 = 0u;
  v43 = 0u;
  v44 = 0u;
  objc_msgSend(*(id *)(v1 + 40), "procedureArray");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v41, v46, 16);
  if (v26)
  {
    v4 = *(_QWORD *)v42;
    v5 = v1 + 64;
    v29 = v1;
    v30 = v2;
    v28 = v3;
    v25 = *(_QWORD *)v42;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v42 != v4)
          objc_enumerationMutation(v3);
        v27 = v6;
        v7 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * v6);
        v37 = 0u;
        v38 = 0u;
        v39 = 0u;
        v40 = 0u;
        objc_msgSend(v7, "weightArray", v25);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v37, v45, 16);
        if (v9)
        {
          v10 = v9;
          v11 = *(_QWORD *)v38;
          while (2)
          {
            for (i = 0; i != v10; ++i)
            {
              if (*(_QWORD *)v38 != v11)
                objc_enumerationMutation(v8);
              v13 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * i);
              objc_msgSend(v13, "weightURL");
              v14 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v14, "path");
              v15 = (void *)objc_claimAutoreleasedReturnValue();
              v16 = *(_QWORD *)(*(_QWORD *)v5 + 8);
              obj = *(id *)(v16 + 40);
              +[_ANESandboxingHelper issueSandboxExtensionForPath:error:](_ANESandboxingHelper, "issueSandboxExtensionForPath:error:", v15, &obj);
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              objc_storeStrong((id *)(v16 + 40), obj);
              objc_msgSend(v13, "setSandboxExtension:", v17);

              if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)v5 + 8) + 40))
              {
                v18 = (void *)gLogger_1;
                v1 = v29;
                if (os_log_type_enabled((os_log_t)gLogger_1, OS_LOG_TYPE_ERROR))
                  __71___ANEClient_doLoadModelNewInstance_options_modelInstParams_qos_error___block_invoke_cold_2(v29, v18);

                v2 = v30;
                v3 = v28;
                goto LABEL_20;
              }
            }
            v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v37, v45, 16);
            if (v10)
              continue;
            break;
          }
        }

        v6 = v27 + 1;
        v1 = v29;
        v2 = v30;
        v3 = v28;
        v4 = v25;
      }
      while (v27 + 1 != v26);
      v26 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v41, v46, 16);
    }
    while (v26);
  }
LABEL_20:

  if (v2 || !*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v1 + 64) + 8) + 40))
  {
    objc_msgSend(*(id *)(v1 + 48), "connectionForLoadingModel:options:", *(_QWORD *)(v1 + 56), *(_QWORD *)(v1 + 32));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = *(void **)(v1 + 56);
    v21 = *(_QWORD *)(v1 + 32);
    v22 = *(_QWORD *)(v1 + 40);
    v23 = *(unsigned int *)(v1 + 88);
    v31[0] = MEMORY[0x1E0C809B0];
    v31[1] = 3221225472;
    v31[2] = __71___ANEClient_doLoadModelNewInstance_options_modelInstParams_qos_error___block_invoke_27;
    v31[3] = &unk_1E9516678;
    v34 = *(_QWORD *)(v1 + 80);
    v32 = v20;
    v33 = vextq_s8(*(int8x16_t *)(v1 + 64), *(int8x16_t *)(v1 + 64), 8uLL);
    v35 = *(_DWORD *)(v1 + 88);
    objc_msgSend(v19, "loadModelNewInstance:options:modelInstParams:qos:withReply:", v32, v21, v22, v23, v31);

  }
  else
  {
    v24 = (void *)gLogger_1;
    if (os_log_type_enabled((os_log_t)gLogger_1, OS_LOG_TYPE_ERROR))
      __71___ANEClient_doLoadModelNewInstance_options_modelInstParams_qos_error___block_invoke_cold_1(v1, v24);
  }

}

void __71___ANEClient_doLoadModelNewInstance_options_modelInstParams_qos_error___block_invoke_27(uint64_t a1, int a2, void *a3, uint64_t a4, uint64_t a5, uint64_t a6, void *a7, void *a8)
{
  id v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  id *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  NSObject *v26;
  uint64_t v27;
  const char *aSelector;
  char *aSelectora;
  uint8_t buf[4];
  char *v31;
  __int16 v32;
  uint64_t v33;
  __int16 v34;
  int v35;
  __int16 v36;
  uint64_t v37;
  __int16 v38;
  uint64_t v39;
  __int16 v40;
  int v41;
  __int16 v42;
  id v43;
  __int16 v44;
  id v45;
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v15 = a3;
  v16 = a7;
  v17 = a8;
  v18 = (void *)gLogger_1;
  if (os_log_type_enabled((os_log_t)gLogger_1, OS_LOG_TYPE_DEBUG))
  {
    aSelector = *(const char **)(a1 + 56);
    v26 = v18;
    NSStringFromSelector(aSelector);
    aSelectora = (char *)objc_claimAutoreleasedReturnValue();
    v27 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138414082;
    v31 = aSelectora;
    v32 = 2048;
    v33 = v27;
    v34 = 1024;
    v35 = a2;
    v36 = 2048;
    v37 = a4;
    v38 = 2048;
    v39 = a5;
    v40 = 1024;
    v41 = a6;
    v42 = 2112;
    v43 = v16;
    v44 = 2112;
    v45 = v17;
    _os_log_debug_impl(&dword_1D3352000, v26, OS_LOG_TYPE_DEBUG, "%@: model[%p] : success=%d : progamHandle=0x%llx : intermediateBufferHandle=%llu : queueDepth=%d : modelCacheIdentifier=%@ : err=%@", buf, 0x4Au);

  }
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a2;
  v20 = (id *)(a1 + 32);
  v19 = *(void **)(a1 + 32);
  if (!a2)
  {
    objc_msgSend(v19, "updateModelAttributes:state:", v15, 5);
    if (!v17)
      goto LABEL_12;
LABEL_11:
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), a8);
    goto LABEL_12;
  }
  objc_msgSend(v19, "updateModelAttributes:state:programHandle:intermediateBufferHandle:queueDepth:", v15, 3, a4, a5, a6);
  objc_msgSend(*v20, "setCacheURLIdentifier:", v16);
  +[_ANEDeviceController controllerWithProgramHandle:](_ANEDeviceController, "controllerWithProgramHandle:", a4);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  +[_ANEProgramForEvaluation programWithController:intermediateBufferHandle:queueDepth:](_ANEProgramForEvaluation, "programWithController:intermediateBufferHandle:queueDepth:", v21, a5, a6);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*v20, "setProgram:", v22);

  v23 = (void *)gLogger_1;
  if (os_log_type_enabled((os_log_t)gLogger_1, OS_LOG_TYPE_DEBUG))
    __44___ANEClient_doLoadModel_options_qos_error___block_invoke_2_cold_2(a1 + 32, v23);
  +[_ANEProgramIOSurfacesMapper mapperWithController:](_ANEProgramIOSurfacesMapper, "mapperWithController:", v21);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*v20, "setMapper:", v24);

  v25 = (void *)gLogger_1;
  if (os_log_type_enabled((os_log_t)gLogger_1, OS_LOG_TYPE_DEBUG))
    __44___ANEClient_doLoadModel_options_qos_error___block_invoke_2_cold_1(a1 + 32, v25);

  if (v17)
    goto LABEL_11;
LABEL_12:
  objc_msgSend(*(id *)(a1 + 32), "string_id");
  kdebug_trace();

}

uint64_t __71___ANEClient_doPrepareChainingWithModel_options_chainingReq_qos_error___block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD v7[4];
  __int128 v8;
  uint64_t v9;

  v2 = *(void **)(a1 + 32);
  v1 = *(_QWORD *)(a1 + 40);
  v3 = *(_QWORD *)(a1 + 48);
  v4 = *(_QWORD *)(a1 + 56);
  v5 = *(unsigned int *)(a1 + 88);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __71___ANEClient_doPrepareChainingWithModel_options_chainingReq_qos_error___block_invoke_2;
  v7[3] = &unk_1E9516628;
  v9 = *(_QWORD *)(a1 + 80);
  v8 = *(_OWORD *)(a1 + 64);
  return objc_msgSend(v2, "prepareChainingWithModel:options:chainingReq:qos:withReply:", v1, v3, v4, v5, v7);
}

void __71___ANEClient_doPrepareChainingWithModel_options_chainingReq_qos_error___block_invoke_2(_QWORD *a1, int a2, void *a3)
{
  id v6;
  void *v7;
  const char *v8;
  NSObject *v9;
  void *v10;
  int v11;
  void *v12;
  __int16 v13;
  int v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void *)gLogger_1;
  if (os_log_type_enabled((os_log_t)gLogger_1, OS_LOG_TYPE_DEBUG))
  {
    v8 = (const char *)a1[6];
    v9 = v7;
    NSStringFromSelector(v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 138412802;
    v12 = v10;
    v13 = 1024;
    v14 = a2;
    v15 = 2112;
    v16 = v6;
    _os_log_debug_impl(&dword_1D3352000, v9, OS_LOG_TYPE_DEBUG, "%@: success=%d : err=%@", (uint8_t *)&v11, 0x1Cu);

  }
  *(_BYTE *)(*(_QWORD *)(a1[4] + 8) + 24) = a2;
  if (v6)
    objc_storeStrong((id *)(*(_QWORD *)(a1[5] + 8) + 40), a3);
  kdebug_trace();

}

uint64_t __55___ANEClient_reportEvaluateFailure_failureReason_qIdx___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "reportTelemetryToPPS:playload:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

void __19___ANEClient_echo___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5;
  void *v6;
  const char *v7;
  NSObject *v8;
  void *v9;
  int v10;
  void *v11;
  __int16 v12;
  int v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = a2;
  v6 = (void *)gLogger_1;
  if (os_log_type_enabled((os_log_t)gLogger_1, OS_LOG_TYPE_DEBUG))
  {
    v7 = *(const char **)(a1 + 40);
    v8 = v6;
    NSStringFromSelector(v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138412802;
    v11 = v9;
    v12 = 1024;
    v13 = a2;
    v14 = 2112;
    v15 = v5;
    _os_log_debug_impl(&dword_1D3352000, v8, OS_LOG_TYPE_DEBUG, "%@: success=%d : err=%@", (uint8_t *)&v10, 0x1Cu);

  }
}

void __46___ANEClient_initWithRestrictedAccessAllowed___block_invoke_cold_1(uint64_t a1, void *a2)
{
  void *v2;
  const char *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint8_t v11;

  OUTLINED_FUNCTION_19(a1, a2);
  v3 = (const char *)OUTLINED_FUNCTION_8_1();
  NSStringFromSelector(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_9_0();
  OUTLINED_FUNCTION_5_0(&dword_1D3352000, v5, v6, "%@: interruptHandler", v7, v8, v9, v10, v11);

  OUTLINED_FUNCTION_2_2();
}

void __46___ANEClient_initWithRestrictedAccessAllowed___block_invoke_6_cold_1(uint64_t a1, void *a2)
{
  void *v2;
  const char *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint8_t v11;

  OUTLINED_FUNCTION_19(a1, a2);
  v3 = (const char *)OUTLINED_FUNCTION_8_1();
  NSStringFromSelector(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_9_0();
  OUTLINED_FUNCTION_5_0(&dword_1D3352000, v5, v6, "%@: invalidationHandler", v7, v8, v9, v10, v11);

  OUTLINED_FUNCTION_2_2();
}

void __45___ANEClient_compileModel_options_qos_error___block_invoke_cold_1(uint64_t a1, void *a2)
{
  void *v2;
  const char *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint8_t v11;

  OUTLINED_FUNCTION_27_0(a1, a2);
  v3 = (const char *)OUTLINED_FUNCTION_9_1();
  NSStringFromSelector(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_10_0(&dword_1D3352000, v5, v6, "%@: Failed to issue sandbox extension model=%@", v7, v8, v9, v10, v11);

  OUTLINED_FUNCTION_2();
}

void __44___ANEClient_doLoadModel_options_qos_error___block_invoke_2_cold_1(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  OUTLINED_FUNCTION_20_0(a1, a2);
  objc_msgSend((id)OUTLINED_FUNCTION_8_1(), "mapper");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_9_0();
  OUTLINED_FUNCTION_5_0(&dword_1D3352000, v4, v5, "mapperForModel p=%@", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_2_2();
}

void __44___ANEClient_doLoadModel_options_qos_error___block_invoke_2_cold_2(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  OUTLINED_FUNCTION_20_0(a1, a2);
  objc_msgSend((id)OUTLINED_FUNCTION_8_1(), "program");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_9_0();
  OUTLINED_FUNCTION_5_0(&dword_1D3352000, v4, v5, "evaluateOnlyProgramForModel p=%@", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_2_2();
}

void __71___ANEClient_doLoadModelNewInstance_options_modelInstParams_qos_error___block_invoke_cold_1(uint64_t a1, void *a2)
{
  void *v2;
  const char *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint8_t v11;

  OUTLINED_FUNCTION_26_0(a1, a2);
  v3 = (const char *)OUTLINED_FUNCTION_9_1();
  NSStringFromSelector(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_10_0(&dword_1D3352000, v5, v6, "%@: Failed to issue sandbox extension model=%@", v7, v8, v9, v10, v11);

  OUTLINED_FUNCTION_2();
}

void __71___ANEClient_doLoadModelNewInstance_options_modelInstParams_qos_error___block_invoke_cold_2(uint64_t a1, void *a2)
{
  void *v2;
  const char *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint8_t v11;

  OUTLINED_FUNCTION_26_0(a1, a2);
  v3 = (const char *)OUTLINED_FUNCTION_9_1();
  NSStringFromSelector(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_10_0(&dword_1D3352000, v5, v6, "%@: issueSandboxExtensionForPath error=%@", v7, v8, v9, v10, v11);

  OUTLINED_FUNCTION_2();
}

@end
