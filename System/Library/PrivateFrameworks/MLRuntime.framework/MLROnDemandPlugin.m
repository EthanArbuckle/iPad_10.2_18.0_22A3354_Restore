@implementation MLROnDemandPlugin

+ (id)_locateWithExtensionID:(id)a3
{
  id v3;
  void *v4;
  id v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  void *v10;
  char v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  if (v3)
  {
    objc_msgSend(MEMORY[0x24BDC79E8], "extensionPointIdentifierQuery:", CFSTR("com.apple.mlruntime.extension-point-ondemand"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDC79F0], "executeQuery:", v4);
    v13 = 0u;
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    v5 = (id)objc_claimAutoreleasedReturnValue();
    v6 = (id)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v6)
    {
      v7 = *(_QWORD *)v14;
      while (2)
      {
        for (i = 0; i != v6; i = (char *)i + 1)
        {
          if (*(_QWORD *)v14 != v7)
            objc_enumerationMutation(v5);
          v9 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i);
          objc_msgSend(v9, "bundleIdentifier", (_QWORD)v13);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v11 = objc_msgSend(v10, "isEqualToString:", v3);

          if ((v11 & 1) != 0)
          {
            v6 = v9;
            goto LABEL_12;
          }
        }
        v6 = (id)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
        if (v6)
          continue;
        break;
      }
    }
LABEL_12:

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

+ (id)_createXPCConnection:(id)a3 error:(id *)a4
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "_locateWithExtensionID:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "makeXPCConnectionWithError:", a4);
    a4 = (id *)objc_claimAutoreleasedReturnValue();
    if (a4)
    {
      objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_254AABA58);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a4, "setRemoteObjectInterface:", v7);

      objc_msgSend(a4, "resume");
    }
  }
  else if (a4)
  {
    v8 = (void *)MEMORY[0x24BDD1540];
    v9 = *MEMORY[0x24BE2D188];
    v12 = *MEMORY[0x24BDD0FC8];
    v13[0] = CFSTR("Fail to find matched plugin.");
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v13, &v12, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "errorWithDomain:code:userInfo:", v9, 8013, v10);
    *a4 = (id)objc_claimAutoreleasedReturnValue();

    a4 = 0;
  }

  return a4;
}

+ (void)_performTask:(id)a3 forPluginID:(id)a4 isSynchronous:(BOOL)a5 completionHandler:(id)a6
{
  _BOOL4 v7;
  id v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  uint64_t v15;
  id *v16;
  uint64_t v17;
  NSObject *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  _QWORD v23[4];
  id v24;
  id v25;
  uint64_t v26;
  _QWORD v27[4];
  id v28;
  char v29;
  _QWORD v30[4];
  id v31;
  BOOL v32;
  id v33;

  v7 = a5;
  v10 = a3;
  v11 = a4;
  v12 = a6;
  objc_msgSend(MEMORY[0x24BE2D108], "sendEventEvaluationSessionStartForBundleID:", v11);
  v33 = 0;
  objc_msgSend(a1, "_createXPCConnection:error:", v11, &v33);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v33;
  if (v13)
  {
    v15 = MEMORY[0x24BDAC760];
    if (v7)
    {
      v30[0] = MEMORY[0x24BDAC760];
      v30[1] = 3221225472;
      v30[2] = __78__MLROnDemandPlugin__performTask_forPluginID_isSynchronous_completionHandler___block_invoke;
      v30[3] = &unk_24CB92608;
      v16 = &v31;
      v31 = v11;
      v32 = v7;
      objc_msgSend(v13, "synchronousRemoteObjectProxyWithErrorHandler:", v30);
      v17 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v27[0] = MEMORY[0x24BDAC760];
      v27[1] = 3221225472;
      v27[2] = __78__MLROnDemandPlugin__performTask_forPluginID_isSynchronous_completionHandler___block_invoke_55;
      v27[3] = &unk_24CB92608;
      v16 = &v28;
      v28 = v11;
      v29 = 0;
      objc_msgSend(v13, "remoteObjectProxyWithErrorHandler:", v27);
      v17 = objc_claimAutoreleasedReturnValue();
    }
    v19 = (void *)v17;

    objc_msgSend(MEMORY[0x24BDD1760], "processInfo");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "systemUptime");
    v22 = v21;

    v23[0] = v15;
    v23[1] = 3221225472;
    v23[2] = __78__MLROnDemandPlugin__performTask_forPluginID_isSynchronous_completionHandler___block_invoke_57;
    v23[3] = &unk_24CB92630;
    v26 = v22;
    v24 = v11;
    v25 = v12;
    objc_msgSend(v19, "performTask:completionHandler:", v10, v23);

  }
  else
  {
    objc_msgSend(MEMORY[0x24BE2D120], "coreChannel");
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      +[MLROnDemandPlugin _performTask:forPluginID:isSynchronous:completionHandler:].cold.1((uint64_t)v11, (uint64_t)v14, v18);

    if (v12)
      (*((void (**)(id, _QWORD, id))v12 + 2))(v12, 0, v14);
    objc_msgSend(MEMORY[0x24BE2D108], "sendEventEvaluationSessionFinishForBundleID:success:", v11, 0);
    objc_msgSend(MEMORY[0x24BE2D108], "sendEventErrorForBundleID:error:", v11, v14);
  }

}

void __78__MLROnDemandPlugin__performTask_forPluginID_isSynchronous_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  objc_msgSend(MEMORY[0x24BE2D120], "coreChannel");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __78__MLROnDemandPlugin__performTask_forPluginID_isSynchronous_completionHandler___block_invoke_cold_1();

}

void __78__MLROnDemandPlugin__performTask_forPluginID_isSynchronous_completionHandler___block_invoke_55(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  objc_msgSend(MEMORY[0x24BE2D120], "coreChannel");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __78__MLROnDemandPlugin__performTask_forPluginID_isSynchronous_completionHandler___block_invoke_55_cold_1();

}

void __78__MLROnDemandPlugin__performTask_forPluginID_isSynchronous_completionHandler___block_invoke_57(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  double v8;
  double v9;
  _QWORD *v10;
  double v11;
  NSObject *v12;
  uint64_t v13;

  v5 = a2;
  v6 = a3;
  objc_msgSend(MEMORY[0x24BDD1760], "processInfo");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "systemUptime");
  v9 = v8 - *(double *)(a1 + 48);

  v10 = (_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x24BE2D108], "sendEventEvaluationSessionFinishForBundleID:success:", *(_QWORD *)(a1 + 32), v6 == 0);
  *(float *)&v11 = v9;
  objc_msgSend(MEMORY[0x24BE2D108], "sendEventEvaluationForBundleID:evaluationID:duration:deferred:success:error:downloadedAttachmentCount:", *v10, *v10, 0, v6 == 0, v6, 0, v11);
  if (v6)
  {
    objc_msgSend(MEMORY[0x24BE2D108], "sendEventErrorForBundleID:error:", *v10, v6);
    objc_msgSend(MEMORY[0x24BE2D120], "coreChannel");
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      __78__MLROnDemandPlugin__performTask_forPluginID_isSynchronous_completionHandler___block_invoke_57_cold_2();
  }
  else
  {
    objc_msgSend(MEMORY[0x24BE2D120], "coreChannel");
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      __78__MLROnDemandPlugin__performTask_forPluginID_isSynchronous_completionHandler___block_invoke_57_cold_1();
  }

  v13 = *(_QWORD *)(a1 + 40);
  if (v13)
    (*(void (**)(uint64_t, id, id))(v13 + 16))(v13, v5, v6);

}

+ (void)performTask:(id)a3 forPluginID:(id)a4 completionHandler:(id)a5
{
  objc_msgSend(a1, "_performTask:forPluginID:isSynchronous:completionHandler:", a3, a4, 0, a5);
}

+ (id)synchronouslyPerformTask:(id)a3 forPluginID:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  id v11;
  _QWORD v13[6];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;

  v8 = a3;
  v9 = a4;
  v20 = 0;
  v21 = &v20;
  v22 = 0x3032000000;
  v23 = __Block_byref_object_copy__0;
  v24 = __Block_byref_object_dispose__0;
  v25 = 0;
  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__0;
  v18 = __Block_byref_object_dispose__0;
  v19 = 0;
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __64__MLROnDemandPlugin_synchronouslyPerformTask_forPluginID_error___block_invoke;
  v13[3] = &unk_24CB92658;
  v13[4] = &v20;
  v13[5] = &v14;
  objc_msgSend(a1, "_performTask:forPluginID:isSynchronous:completionHandler:", v8, v9, 1, v13);
  if (a5)
  {
    v10 = (void *)v21[5];
    if (v10)
      *a5 = objc_retainAutorelease(v10);
  }
  v11 = (id)v15[5];
  _Block_object_dispose(&v14, 8);

  _Block_object_dispose(&v20, 8);
  return v11;
}

void __64__MLROnDemandPlugin_synchronouslyPerformTask_forPluginID_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  id v8;

  v5 = a2;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a3);
  v8 = a3;
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

}

+ (id)onDemandPluginIDs
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDC79E8], "extensionPointIdentifierQuery:", CFSTR("com.apple.mlruntime.extension-point-ondemand"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDC79F0], "executeQuery:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v9), "bundleIdentifier", (_QWORD)v12);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "addObject:", v10);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v7);
  }

  return v4;
}

+ (void)_performTask:(NSObject *)a3 forPluginID:isSynchronous:completionHandler:.cold.1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  _BYTE v3[24];

  *(_DWORD *)v3 = 138412546;
  *(_QWORD *)&v3[4] = a1;
  *(_WORD *)&v3[12] = 2112;
  *(_QWORD *)&v3[14] = a2;
  OUTLINED_FUNCTION_3(&dword_2112F5000, a2, a3, "Fail to create XPC connection: plugin=%@, error=%@", *(_QWORD *)v3, *(_QWORD *)&v3[8], *(_QWORD *)&v3[16]);
  OUTLINED_FUNCTION_2();
}

void __78__MLROnDemandPlugin__performTask_forPluginID_isSynchronous_completionHandler___block_invoke_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_1_2(&dword_2112F5000, v0, v1, "Fail to perform task: plugin=%@, error=%@, isSynchronous=%D");
}

void __78__MLROnDemandPlugin__performTask_forPluginID_isSynchronous_completionHandler___block_invoke_55_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_1_2(&dword_2112F5000, v0, v1, "Fail to perform task: plugin=%@, error=%@, isSynchronous=%d");
}

void __78__MLROnDemandPlugin__performTask_forPluginID_isSynchronous_completionHandler___block_invoke_57_cold_1()
{
  os_log_t v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_3_0();
  _os_log_debug_impl(&dword_2112F5000, v0, OS_LOG_TYPE_DEBUG, "plugin=(%@) return result=%@", v1, 0x16u);
  OUTLINED_FUNCTION_2();
}

void __78__MLROnDemandPlugin__performTask_forPluginID_isSynchronous_completionHandler___block_invoke_57_cold_2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_3(&dword_2112F5000, v0, v1, "Fail to perform task: plugin=%@, error=%@");
  OUTLINED_FUNCTION_2();
}

@end
