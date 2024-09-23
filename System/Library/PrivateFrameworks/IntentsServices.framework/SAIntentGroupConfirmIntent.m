@implementation SAIntentGroupConfirmIntent

void __109__SAIntentGroupConfirmIntent_INSExtensionService__ins_sendIntent_toExtensionProxy_onQueue_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  +[INSAnalytics sharedAnalytics](INSAnalytics, "sharedAnalytics");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "ins_afAnalyticsContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "logEventWithType:context:contextNoCopy:", 612, v2, 1);

}

void __109__SAIntentGroupConfirmIntent_INSExtensionService__ins_sendIntent_toExtensionProxy_onQueue_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  NSObject *v5;
  id v6;
  _QWORD block[4];
  id v8;
  uint64_t v9;
  id v10;

  v3 = a2;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __109__SAIntentGroupConfirmIntent_INSExtensionService__ins_sendIntent_toExtensionProxy_onQueue_completionHandler___block_invoke_3;
  block[3] = &unk_24C4B9508;
  v5 = *(NSObject **)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  v8 = v3;
  v9 = v4;
  v10 = *(id *)(a1 + 48);
  v6 = v3;
  dispatch_async(v5, block);

}

void __109__SAIntentGroupConfirmIntent_INSExtensionService__ins_sendIntent_toExtensionProxy_onQueue_completionHandler___block_invoke_3(uint64_t a1)
{
  void *v2;
  void *v3;
  NSObject *v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint8_t buf[4];
  const char *v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)*MEMORY[0x24BDD9A30];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD9A30], OS_LOG_TYPE_INFO))
  {
    v3 = *(void **)(a1 + 32);
    v4 = v2;
    objc_msgSend(v3, "backingStore");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315394;
    v20 = "-[SAIntentGroupConfirmIntent(INSExtensionService) ins_sendIntent:toExtensionProxy:onQueue:completionHandler:]_block_invoke_3";
    v21 = 2112;
    v22 = v5;
    _os_log_impl(&dword_20BAA8000, v4, OS_LOG_TYPE_INFO, "%s intentResponse.backingStore = %@", buf, 0x16u);

  }
  v6 = objc_alloc_init(MEMORY[0x24BE81318]);
  objc_msgSend(*(id *)(a1 + 40), "aceId");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setRefId:", v7);

  if (objc_msgSend(*(id *)(a1 + 40), "ins_isJSONPayload"))
  {
    INSJSONEncodedIntentResponse(*(void **)(a1 + 32));
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setJsonEncodedIntentResponse:", v8);
  }
  else
  {
    v8 = objc_alloc_init(MEMORY[0x24BE81380]);
    objc_msgSend(*(id *)(a1 + 32), "_payloadResponseTypeName");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setTypeName:", v9);

    objc_msgSend(*(id *)(a1 + 32), "backingStore");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "data");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setData:", v11);

    objc_msgSend(v6, "setIntentResponse:", v8);
  }

  v12 = *(_QWORD *)(a1 + 48);
  if (v12)
    (*(void (**)(uint64_t, id, _QWORD))(v12 + 16))(v12, v6, 0);
  +[INSAnalytics sharedAnalytics](INSAnalytics, "sharedAnalytics");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "contextDictionaryForCommand:", v6);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  +[INSAnalytics sharedAnalytics](INSAnalytics, "sharedAnalytics");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(*(id *)(a1 + 40), "ins_analyticsEndEventType");
  objc_msgSend(*(id *)(a1 + 40), "ins_afAnalyticsContext");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  IFMergeDictionaries();
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "logEventWithType:context:contextNoCopy:", v16, v18, 1, v14, 0);

}

@end
