@implementation SAIntentGroupHandleIntent

void __108__SAIntentGroupHandleIntent_INSExtensionService__ins_sendIntent_toExtensionProxy_onQueue_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  +[INSAnalytics sharedAnalytics](INSAnalytics, "sharedAnalytics");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "ins_afAnalyticsContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "logEventWithType:context:contextNoCopy:", 617, v2, 1);

}

void __108__SAIntentGroupHandleIntent_INSExtensionService__ins_sendIntent_toExtensionProxy_onQueue_completionHandler___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  NSObject *v8;
  id v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  uint64_t v14;
  id v15;
  id v16;

  v5 = a2;
  v6 = a3;
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __108__SAIntentGroupHandleIntent_INSExtensionService__ins_sendIntent_toExtensionProxy_onQueue_completionHandler___block_invoke_2_5;
  v12[3] = &unk_24C4B9958;
  v8 = *(NSObject **)(a1 + 32);
  v7 = *(_QWORD *)(a1 + 40);
  v13 = v6;
  v14 = v7;
  v9 = *(id *)(a1 + 48);
  v15 = v5;
  v16 = v9;
  v10 = v5;
  v11 = v6;
  dispatch_async(v8, v12);

}

void __108__SAIntentGroupHandleIntent_INSExtensionService__ins_sendIntent_toExtensionProxy_onQueue_completionHandler___block_invoke_2_5(id *a1)
{
  id v2;
  uint64_t v3;
  void *v4;
  void *v5;
  id v6;
  NSObject *v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void (**v15)(id, id, _QWORD);
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  id v22;
  uint8_t buf[4];
  const char *v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  if (a1[4])
  {
    v2 = a1[5];
    INSExtensionServiceTraceCompletionHandlerWithCode(a1[7], 722470896);
    v22 = (id)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(a1[4], "errorCode");
    objc_msgSend(a1[4], "underlyingError");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "ins_invokeErrorCompletionHandler:withErrorCode:underlyingError:", v22, v3, v4);

  }
  else
  {
    v5 = (void *)*MEMORY[0x24BDD9A30];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD9A30], OS_LOG_TYPE_INFO))
    {
      v6 = a1[6];
      v7 = v5;
      objc_msgSend(v6, "backingStore");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315394;
      v24 = "-[SAIntentGroupHandleIntent(INSExtensionService) ins_sendIntent:toExtensionProxy:onQueue:completionHandler:]_block_invoke_2";
      v25 = 2112;
      v26 = v8;
      _os_log_impl(&dword_20BAA8000, v7, OS_LOG_TYPE_INFO, "%s intentResponse.backingStore = %@", buf, 0x16u);

    }
    v9 = objc_alloc_init(MEMORY[0x24BE81340]);
    objc_msgSend(a1[5], "aceId");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setRefId:", v10);

    if (objc_msgSend(a1[5], "ins_isJSONPayload"))
    {
      INSJSONEncodedIntentResponse(a1[6]);
      v11 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setJsonEncodedIntentResponse:", v11);
    }
    else
    {
      v11 = objc_alloc_init(MEMORY[0x24BE81380]);
      objc_msgSend(a1[6], "backingStore");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "data");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setData:", v13);

      objc_msgSend(a1[6], "_payloadResponseTypeName");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setTypeName:", v14);

      objc_msgSend(v9, "setIntentResponse:", v11);
    }

    v15 = (void (**)(id, id, _QWORD))a1[7];
    if (v15)
      v15[2](v15, v9, 0);
    +[INSAnalytics sharedAnalytics](INSAnalytics, "sharedAnalytics");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "contextDictionaryForCommand:", v9);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    +[INSAnalytics sharedAnalytics](INSAnalytics, "sharedAnalytics");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(a1[5], "ins_analyticsEndEventType");
    objc_msgSend(a1[5], "ins_afAnalyticsContext");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    IFMergeDictionaries();
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "logEventWithType:context:contextNoCopy:", v19, v21, 1, v17, 0);

  }
}

void __108__SAIntentGroupHandleIntent_INSExtensionService__ins_sendIntent_toExtensionProxy_onQueue_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;

  v4 = a2;
  v5 = a3;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __108__SAIntentGroupHandleIntent_INSExtensionService__ins_sendIntent_toExtensionProxy_onQueue_completionHandler___block_invoke_3;
  v8[3] = &unk_24C4B9930;
  v9 = v4;
  v10 = v5;
  v6 = v4;
  v7 = v5;
  objc_msgSend(v6, "_retrieveImageDataWithReply:", v8);

}

void __108__SAIntentGroupHandleIntent_INSExtensionService__ins_sendIntent_toExtensionProxy_onQueue_completionHandler___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  void (*v8)(void);
  void *v9;
  void *v10;
  void *v11;
  int v12;
  const char *v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    v7 = *MEMORY[0x24BDD9A30];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD9A30], OS_LOG_TYPE_ERROR))
    {
      v12 = 136315394;
      v13 = "-[SAIntentGroupHandleIntent(INSExtensionService) ins_sendIntent:toExtensionProxy:onQueue:completionHandler:]_block_invoke_3";
      v14 = 2112;
      v15 = v6;
      _os_log_error_impl(&dword_20BAA8000, v7, OS_LOG_TYPE_ERROR, "%s Unable to retrieve image data = %@", (uint8_t *)&v12, 0x16u);
    }
    v8 = *(void (**)(void))(*(_QWORD *)(a1 + 40) + 16);
  }
  else
  {
    v9 = *(void **)(a1 + 32);
    objc_msgSend(v5, "_imageSize");
    objc_msgSend(v9, "_setImageSize:");
    objc_msgSend(MEMORY[0x24BDD9C18], "sharedCache");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addCacheableObject:", v5);

    objc_msgSend(MEMORY[0x24BDD9C18], "sharedCache");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addCacheableObject:", *(_QWORD *)(a1 + 32));

    v8 = *(void (**)(void))(*(_QWORD *)(a1 + 40) + 16);
  }
  v8();

}

@end
