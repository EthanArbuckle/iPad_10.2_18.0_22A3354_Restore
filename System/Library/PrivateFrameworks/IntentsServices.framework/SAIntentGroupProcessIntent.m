@implementation SAIntentGroupProcessIntent

void __132__SAIntentGroupProcessIntent_INSExtensionService___handleIntentWithExtensionProxy_onQueue_processIntentCompleted_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  id v8;
  id v9;
  _QWORD block[5];
  id v11;
  id v12;
  id v13;
  id v14;

  v5 = a2;
  v6 = a3;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __132__SAIntentGroupProcessIntent_INSExtensionService___handleIntentWithExtensionProxy_onQueue_processIntentCompleted_completionHandler___block_invoke_2;
  block[3] = &unk_24C4B9558;
  v7 = *(NSObject **)(a1 + 32);
  block[4] = *(_QWORD *)(a1 + 40);
  v11 = v5;
  v12 = v6;
  v13 = *(id *)(a1 + 48);
  v14 = *(id *)(a1 + 56);
  v8 = v6;
  v9 = v5;
  dispatch_async(v7, block);

}

uint64_t __132__SAIntentGroupProcessIntent_INSExtensionService___handleIntentWithExtensionProxy_onQueue_processIntentCompleted_completionHandler___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  NSObject **v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  int v20;
  const char *v21;
  __int16 v22;
  uint64_t v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  +[INSAnalytics sharedAnalytics](INSAnalytics, "sharedAnalytics");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "ins_afAnalyticsContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "logEventWithType:context:contextNoCopy:", 641, v3, 1);

  v4 = (NSObject **)MEMORY[0x24BDD9A30];
  v5 = *MEMORY[0x24BDD9A30];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD9A30], OS_LOG_TYPE_INFO))
  {
    v6 = *(_QWORD *)(a1 + 40);
    v20 = 136315394;
    v21 = "-[SAIntentGroupProcessIntent(INSExtensionService) _handleIntentWithExtensionProxy:onQueue:processIntentComplet"
          "ed:completionHandler:]_block_invoke_2";
    v22 = 2112;
    v23 = v6;
    _os_log_impl(&dword_20BAA8000, v5, OS_LOG_TYPE_INFO, "%s HandleIntent completed with response %@", (uint8_t *)&v20, 0x16u);
    v5 = *v4;
  }
  v7 = *(void **)(a1 + 48);
  if (v7)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v8 = v5;
      v9 = objc_msgSend(v7, "errorCode");
      objc_msgSend(*(id *)(a1 + 48), "underlyingError");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = 136315650;
      v21 = "-[SAIntentGroupProcessIntent(INSExtensionService) _handleIntentWithExtensionProxy:onQueue:processIntentCompl"
            "eted:completionHandler:]_block_invoke";
      v22 = 2048;
      v23 = v9;
      v24 = 2112;
      v25 = v10;
      _os_log_error_impl(&dword_20BAA8000, v8, OS_LOG_TYPE_ERROR, "%s HandleIntent error. errorCode: %lu underlyingError: %@", (uint8_t *)&v20, 0x20u);

    }
  }
  else
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      v20 = 136315138;
      v21 = "-[SAIntentGroupProcessIntent(INSExtensionService) _handleIntentWithExtensionProxy:onQueue:processIntentCompl"
            "eted:completionHandler:]_block_invoke";
      _os_log_impl(&dword_20BAA8000, v5, OS_LOG_TYPE_INFO, "%s HandleIntent successful.", (uint8_t *)&v20, 0xCu);
    }
    v11 = *(void **)(a1 + 56);
    v12 = objc_alloc_init(MEMORY[0x24BE81340]);
    objc_msgSend(*(id *)(a1 + 32), "aceId");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setRefId:", v13);

    if (objc_msgSend(*(id *)(a1 + 32), "ins_isJSONPayload"))
    {
      INSJSONEncodedIntentResponse(*(void **)(a1 + 40));
      v14 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setJsonEncodedIntentResponse:", v14);
    }
    else
    {
      v14 = objc_alloc_init(MEMORY[0x24BE81380]);
      objc_msgSend(*(id *)(a1 + 40), "backingStore");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "data");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setData:", v16);

      objc_opt_class();
      INIntentSchemaGetIntentResponseDescriptionWithFacadeClass();
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "type");
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v14, "setTypeName:", v18);
      objc_msgSend(v12, "setIntentResponse:", v14);
    }

    objc_msgSend(v11, "setHandleIntentCompleted:", v12);
  }
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
}

void __133__SAIntentGroupProcessIntent_INSExtensionService___confirmIntentWithExtensionProxy_onQueue_processIntentCompleted_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  id v8;
  id v9;
  _QWORD block[5];
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;

  v5 = a2;
  v6 = a3;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __133__SAIntentGroupProcessIntent_INSExtensionService___confirmIntentWithExtensionProxy_onQueue_processIntentCompleted_completionHandler___block_invoke_2;
  block[3] = &unk_24C4B97D8;
  v7 = *(NSObject **)(a1 + 32);
  block[4] = *(_QWORD *)(a1 + 40);
  v11 = v5;
  v12 = v6;
  v13 = *(id *)(a1 + 48);
  v14 = *(id *)(a1 + 56);
  v15 = *(id *)(a1 + 32);
  v16 = *(id *)(a1 + 64);
  v8 = v6;
  v9 = v5;
  dispatch_async(v7, block);

}

void __133__SAIntentGroupProcessIntent_INSExtensionService___confirmIntentWithExtensionProxy_onQueue_processIntentCompleted_completionHandler___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  os_log_t *v4;
  NSObject *v5;
  uint64_t v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  os_log_t v15;
  NSObject *v16;
  uint64_t v17;
  void *v18;
  os_log_t v19;
  void *v20;
  NSObject *v21;
  int v22;
  const __CFString *v23;
  int v24;
  const char *v25;
  __int16 v26;
  uint64_t v27;
  __int16 v28;
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  +[INSAnalytics sharedAnalytics](INSAnalytics, "sharedAnalytics");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "ins_afAnalyticsContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "logEventWithType:context:contextNoCopy:", 639, v3, 1);

  v4 = (os_log_t *)MEMORY[0x24BDD9A30];
  v5 = *MEMORY[0x24BDD9A30];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD9A30], OS_LOG_TYPE_INFO))
  {
    v6 = *(_QWORD *)(a1 + 40);
    v24 = 136315394;
    v25 = "-[SAIntentGroupProcessIntent(INSExtensionService) _confirmIntentWithExtensionProxy:onQueue:processIntentComple"
          "ted:completionHandler:]_block_invoke_2";
    v26 = 2112;
    v27 = v6;
    _os_log_impl(&dword_20BAA8000, v5, OS_LOG_TYPE_INFO, "%s ConfirmIntent completed with response %@", (uint8_t *)&v24, 0x16u);
  }
  v7 = objc_alloc_init(MEMORY[0x24BE81318]);
  objc_msgSend(*(id *)(a1 + 32), "aceId");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setRefId:", v8);

  if (objc_msgSend(*(id *)(a1 + 32), "ins_isJSONPayload"))
  {
    INSJSONEncodedIntentResponse(*(void **)(a1 + 40));
    v9 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setJsonEncodedIntentResponse:", v9);
  }
  else
  {
    v9 = objc_alloc_init(MEMORY[0x24BE81380]);
    objc_opt_class();
    INIntentSchemaGetIntentResponseDescriptionWithFacadeClass();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "type");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "setTypeName:", v11);
    objc_msgSend(*(id *)(a1 + 40), "backingStore");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "data");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setData:", v13);

    objc_msgSend(v7, "setIntentResponse:", v9);
  }

  v14 = *(void **)(a1 + 48);
  if (v14)
  {
    v15 = *v4;
    if (os_log_type_enabled(*v4, OS_LOG_TYPE_ERROR))
    {
      v16 = v15;
      v17 = objc_msgSend(v14, "errorCode");
      objc_msgSend(*(id *)(a1 + 48), "underlyingError");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = 136315650;
      v25 = "-[SAIntentGroupProcessIntent(INSExtensionService) _confirmIntentWithExtensionProxy:onQueue:processIntentComp"
            "leted:completionHandler:]_block_invoke";
      v26 = 2048;
      v27 = v17;
      v28 = 2112;
      v29 = v18;
      _os_log_error_impl(&dword_20BAA8000, v16, OS_LOG_TYPE_ERROR, "%s ConfirmIntent error. errorCode: %lu underlyingError: %@", (uint8_t *)&v24, 0x20u);

    }
LABEL_17:
    (*(void (**)(void))(*(_QWORD *)(a1 + 80) + 16))();
    goto LABEL_18;
  }
  objc_msgSend(*(id *)(a1 + 56), "setConfirmIntentCompleted:", v7);
  v19 = *v4;
  if (os_log_type_enabled(*v4, OS_LOG_TYPE_INFO))
  {
    v20 = *(void **)(a1 + 32);
    v21 = v19;
    v22 = objc_msgSend(v20, "shouldRunHandleIntent");
    v23 = CFSTR("NO");
    if (v22)
      v23 = CFSTR("YES");
    v24 = 136315394;
    v25 = "-[SAIntentGroupProcessIntent(INSExtensionService) _confirmIntentWithExtensionProxy:onQueue:processIntentComple"
          "ted:completionHandler:]_block_invoke";
    v26 = 2112;
    v27 = (uint64_t)v23;
    _os_log_impl(&dword_20BAA8000, v21, OS_LOG_TYPE_INFO, "%s ConfirmIntent successful. ShouldRunHandleIntent = %@", (uint8_t *)&v24, 0x16u);

  }
  if (!objc_msgSend(*(id *)(a1 + 32), "shouldRunHandleIntent")
    || objc_msgSend(*(id *)(a1 + 40), "_intentResponseCode") != 1
    && objc_msgSend(*(id *)(a1 + 40), "_intentResponseCode") != 4)
  {
    goto LABEL_17;
  }
  objc_msgSend(*(id *)(a1 + 32), "_handleIntentWithExtensionProxy:onQueue:processIntentCompleted:completionHandler:", *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 80));
LABEL_18:

}

void __138__SAIntentGroupProcessIntent_INSExtensionService___resolveIntentSlotsWithExtensionProxy_onQueue_processIntentCompleted_completionHandler___block_invoke(id *a1, char a2, void *a3, void *a4)
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  NSObject *v11;
  NSObject *v12;
  id v13;
  id v14;
  id v15;
  id v16;
  _QWORD v17[4];
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  char v25;
  uint8_t buf[4];
  const char *v27;
  __int16 v28;
  id v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  +[INSAnalytics sharedAnalytics](INSAnalytics, "sharedAnalytics");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1[4], "ins_afAnalyticsContext");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "logEventWithType:context:contextNoCopy:", 637, v10, 1);

  v11 = *MEMORY[0x24BDD9A30];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD9A30], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v27 = "-[SAIntentGroupProcessIntent(INSExtensionService) _resolveIntentSlotsWithExtensionProxy:onQueue:processIntentC"
          "ompleted:completionHandler:]_block_invoke";
    v28 = 2112;
    v29 = v7;
    _os_log_impl(&dword_20BAA8000, v11, OS_LOG_TYPE_INFO, "%s BatchSlotResolution completed in extensionProxy with updatedIntent %@", buf, 0x16u);
  }
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __138__SAIntentGroupProcessIntent_INSExtensionService___resolveIntentSlotsWithExtensionProxy_onQueue_processIntentCompleted_completionHandler___block_invoke_5;
  v17[3] = &unk_24C4B9450;
  v12 = a1[5];
  v13 = a1[6];
  v14 = a1[4];
  v18 = v13;
  v19 = v14;
  v20 = v7;
  v21 = v8;
  v25 = a2;
  v22 = a1[7];
  v23 = a1[5];
  v24 = a1[8];
  v15 = v8;
  v16 = v7;
  dispatch_async(v12, v17);

}

uint64_t __138__SAIntentGroupProcessIntent_INSExtensionService___resolveIntentSlotsWithExtensionProxy_onQueue_processIntentCompleted_completionHandler___block_invoke_5(uint64_t a1)
{
  uint64_t v1;
  id v2;
  void *v3;
  void *v4;
  int v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  os_log_t *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  id v16;
  void *v17;
  int v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  os_log_t v25;
  NSObject *v26;
  uint64_t v27;
  os_log_t *v28;
  id v29;
  void *v30;
  int v31;
  NSObject *v32;
  _BOOL4 v33;
  void *v34;
  void *v36;
  void *v37;
  uint64_t v38;
  id obj;
  uint64_t v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  uint8_t buf[4];
  const char *v46;
  __int16 v47;
  void *v48;
  __int16 v49;
  void *v50;
  _BYTE v51[128];
  uint64_t v52;

  v1 = a1;
  v52 = *MEMORY[0x24BDAC8D0];
  v37 = *(void **)(a1 + 32);
  v2 = objc_alloc_init(MEMORY[0x24BE81300]);
  objc_msgSend(v2, "setSlotResolutionMap:", 0);
  objc_msgSend(*(id *)(v1 + 40), "intent");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "typeName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setTypeName:", v4);

  v5 = objc_msgSend(*(id *)(v1 + 40), "ins_isJSONPayload");
  v6 = *(void **)(v1 + 48);
  v36 = v2;
  if (v5)
  {
    INSJSONEncodedIntent(v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setJsonEncodedIntent:", v7);
  }
  else
  {
    objc_msgSend(v6, "backingStore");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "data");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "base64EncodedStringWithOptions:", 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setBase64EncodedIntent:", v9);

  }
  v10 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v41 = 0u;
  v42 = 0u;
  v43 = 0u;
  v44 = 0u;
  objc_msgSend(*(id *)(v1 + 56), "allKeys");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v41, v51, 16);
  v12 = (os_log_t *)MEMORY[0x24BDD9A30];
  v40 = v11;
  if (v11)
  {
    v13 = *(_QWORD *)v42;
    v38 = v1;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v42 != v13)
          objc_enumerationMutation(obj);
        v15 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * v14);
        v16 = objc_alloc_init(MEMORY[0x24BE81308]);
        objc_msgSend(v16, "setKeyPath:", v15);
        objc_msgSend(*(id *)(v1 + 56), "objectForKeyedSubscript:", v15);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "setTypeName:", CFSTR("IntentSlotResolutionResult"));
        v18 = objc_msgSend(*(id *)(v1 + 40), "ins_isJSONPayload");
        objc_msgSend(v17, "data");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = v19;
        if (v18)
        {
          INSJSONEncodedSlotResolutionResult(v19, *(void **)(v1 + 48), v15);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "setJsonEncodedSlotResolutionResult:", v21);
        }
        else
        {
          objc_msgSend(v19, "base64EncodedStringWithOptions:", 0);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "setBase64EncodedProtobufMessage:", v21);
        }

        objc_msgSend(v10, "addObject:", v16);
        v22 = objc_alloc(MEMORY[0x24BDDA2F8]);
        objc_msgSend(v17, "data");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = (void *)objc_msgSend(v22, "initWithData:", v23);

        v25 = *v12;
        if (os_log_type_enabled(*v12, OS_LOG_TYPE_INFO))
        {
          v26 = v25;
          objc_msgSend(v24, "typeAsString:", objc_msgSend(v24, "type"));
          v27 = v13;
          v28 = v12;
          v29 = v10;
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 136315650;
          v46 = "-[SAIntentGroupProcessIntent(INSExtensionService) _resolveIntentSlotsWithExtensionProxy:onQueue:processI"
                "ntentCompleted:completionHandler:]_block_invoke";
          v47 = 2112;
          v48 = v15;
          v49 = 2112;
          v50 = v30;

          v10 = v29;
          v12 = v28;
          v13 = v27;
          v1 = v38;

        }
        ++v14;
      }
      while (v40 != v14);
      v40 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v41, v51, 16);
    }
    while (v40);
  }

  objc_msgSend(v36, "setStepResults:", v10);
  objc_msgSend(v37, "setBatchSlotResolutionResult:", v36);

  v31 = *(unsigned __int8 *)(v1 + 88);
  v32 = *v12;
  v33 = os_log_type_enabled(*v12, OS_LOG_TYPE_INFO);
  if (v31)
  {
    if (v33)
    {
      *(_DWORD *)buf = 136315138;
      v46 = "-[SAIntentGroupProcessIntent(INSExtensionService) _resolveIntentSlotsWithExtensionProxy:onQueue:processInten"
            "tCompleted:completionHandler:]_block_invoke";
      _os_log_impl(&dword_20BAA8000, v32, OS_LOG_TYPE_INFO, "%s All slots were resolved successfully. Moving to Confirm.", buf, 0xCu);
    }
    objc_msgSend(*(id *)(v1 + 64), "_connection", v36);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "setIntent:", *(_QWORD *)(v1 + 48));

    return objc_msgSend(*(id *)(v1 + 40), "_confirmIntentWithExtensionProxy:onQueue:processIntentCompleted:completionHandler:", *(_QWORD *)(v1 + 64), *(_QWORD *)(v1 + 72), *(_QWORD *)(v1 + 32), *(_QWORD *)(v1 + 80));
  }
  else
  {
    if (v33)
    {
      *(_DWORD *)buf = 136315138;
      v46 = "-[SAIntentGroupProcessIntent(INSExtensionService) _resolveIntentSlotsWithExtensionProxy:onQueue:processInten"
            "tCompleted:completionHandler:]_block_invoke";
      _os_log_impl(&dword_20BAA8000, v32, OS_LOG_TYPE_INFO, "%s BatchSlotResolution needs dialog. Calling completion.", buf, 0xCu);
    }
    return (*(uint64_t (**)(void))(*(_QWORD *)(v1 + 80) + 16))();
  }
}

void __109__SAIntentGroupProcessIntent_INSExtensionService__ins_sendIntent_toExtensionProxy_onQueue_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  +[INSAnalytics sharedAnalytics](INSAnalytics, "sharedAnalytics");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "ins_afAnalyticsContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "logEventWithType:context:contextNoCopy:", 633, v2, 1);

}

void __109__SAIntentGroupProcessIntent_INSExtensionService__ins_sendIntent_toExtensionProxy_onQueue_completionHandler___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint8_t buf[4];
  const char *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = *MEMORY[0x24BDD9A30];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD9A30], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v13 = "-[SAIntentGroupProcessIntent(INSExtensionService) ins_sendIntent:toExtensionProxy:onQueue:completionHandler:]_block_invoke";
    _os_log_impl(&dword_20BAA8000, v4, OS_LOG_TYPE_INFO, "%s BatchSlotResolution complete.", buf, 0xCu);
  }
  v5 = *(_QWORD *)(a1 + 48);
  if (v5)
    (*(void (**)(uint64_t, id, _QWORD))(v5 + 16))(v5, v3, 0);
  +[INSAnalytics sharedAnalytics](INSAnalytics, "sharedAnalytics");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "contextDictionaryForCommand:", *(_QWORD *)(a1 + 32));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  +[INSAnalytics sharedAnalytics](INSAnalytics, "sharedAnalytics");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(*(id *)(a1 + 40), "ins_analyticsEndEventType");
  objc_msgSend(*(id *)(a1 + 40), "ins_afAnalyticsContext");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  IFMergeDictionaries();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "logEventWithType:context:contextNoCopy:", v9, v11, 1, v7, 0);

}

@end
