@implementation SAIntentGroupResolveIntentSlot

void __113__SAIntentGroupResolveIntentSlot_INSExtensionService__ins_sendIntent_toExtensionProxy_onQueue_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  +[INSAnalytics sharedAnalytics](INSAnalytics, "sharedAnalytics");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "ins_afAnalyticsContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "logEventWithType:context:contextNoCopy:", 608, v2, 1);

}

void __113__SAIntentGroupResolveIntentSlot_INSExtensionService__ins_sendIntent_toExtensionProxy_onQueue_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  NSObject *v5;
  id v6;
  _QWORD block[4];
  id v8;
  uint64_t v9;
  id v10;
  id v11;
  id v12;

  v3 = a2;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __113__SAIntentGroupResolveIntentSlot_INSExtensionService__ins_sendIntent_toExtensionProxy_onQueue_completionHandler___block_invoke_3;
  block[3] = &unk_24C4B9558;
  v5 = *(NSObject **)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  v8 = v3;
  v9 = v4;
  v10 = *(id *)(a1 + 48);
  v11 = *(id *)(a1 + 56);
  v12 = *(id *)(a1 + 64);
  v6 = v3;
  dispatch_async(v5, block);

}

void __113__SAIntentGroupResolveIntentSlot_INSExtensionService__ins_sendIntent_toExtensionProxy_onQueue_completionHandler___block_invoke_3(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  __CFString *v4;
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint8_t buf[4];
  const char *v16;
  __int16 v17;
  __CFString *v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v2 = (id)*MEMORY[0x24BDD9A30];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v4 = v3
       ? (__CFString *)objc_msgSend(objc_alloc(MEMORY[0x24BDDA2F8]), "initWithData:", *(_QWORD *)(a1 + 32))
       : CFSTR("no data");
    *(_DWORD *)buf = 136315394;
    v16 = "-[SAIntentGroupResolveIntentSlot(INSExtensionService) ins_sendIntent:toExtensionProxy:onQueue:completionHandle"
          "r:]_block_invoke_3";
    v17 = 2112;
    v18 = v4;
    _os_log_impl(&dword_20BAA8000, v2, OS_LOG_TYPE_INFO, "%s resolutionResultData = %@", buf, 0x16u);
    if (v3)

  }
  v5 = objc_alloc_init(MEMORY[0x24BE81398]);
  objc_msgSend(*(id *)(a1 + 40), "aceId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setRefId:", v6);

  if (objc_msgSend(*(id *)(a1 + 40), "ins_isJSONPayload"))
  {
    INSJSONEncodedSlotResolutionResult(*(void **)(a1 + 32), *(void **)(a1 + 48), *(void **)(a1 + 56));
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setJsonEncodedIntentSlotResolutionResult:", v7);
  }
  else
  {
    v7 = objc_alloc_init(MEMORY[0x24BE81380]);
    objc_msgSend(v7, "setData:", *(_QWORD *)(a1 + 32));
    objc_msgSend(v7, "setTypeName:", CFSTR("IntentSlotResolutionResult"));
    objc_msgSend(v5, "setIntentSlotResolutionResult:", v7);
  }

  v8 = *(_QWORD *)(a1 + 64);
  if (v8)
    (*(void (**)(uint64_t, id, _QWORD))(v8 + 16))(v8, v5, 0);
  +[INSAnalytics sharedAnalytics](INSAnalytics, "sharedAnalytics");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "contextDictionaryForCommand:", v5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  +[INSAnalytics sharedAnalytics](INSAnalytics, "sharedAnalytics");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(*(id *)(a1 + 40), "ins_analyticsEndEventType");
  objc_msgSend(*(id *)(a1 + 40), "ins_afAnalyticsContext");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  IFMergeDictionaries();
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "logEventWithType:context:contextNoCopy:", v12, v14, 1, v10, 0);

}

@end
