@implementation SAIntentGroupResolveIntentSlot(INSExtensionService)

- (void)ins_sendIntent:()INSExtensionService toExtensionProxy:onQueue:completionHandler:
{
  id v10;
  id v11;
  id v12;
  id v13;
  NSObject **v14;
  NSObject *v15;
  NSObject *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  id v23;
  id v24;
  id v25;
  id v26;
  _QWORD v27[4];
  id v28;
  void *v29;
  id v30;
  id v31;
  id v32;
  _QWORD v33[5];
  uint8_t buf[4];
  const char *v35;
  __int16 v36;
  void *v37;
  uint64_t v38;

  v38 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = (NSObject **)MEMORY[0x24BDD9A30];
  v15 = *MEMORY[0x24BDD9A30];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD9A30], OS_LOG_TYPE_INFO))
  {
    v16 = v15;
    objc_msgSend(v10, "backingStore");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315394;
    v35 = "-[SAIntentGroupResolveIntentSlot(INSExtensionService) ins_sendIntent:toExtensionProxy:onQueue:completionHandler:]";
    v36 = 2112;
    v37 = v17;
    _os_log_impl(&dword_20BAA8000, v16, OS_LOG_TYPE_INFO, "%s intent.backingStore = %@", buf, 0x16u);

    v15 = *v14;
  }
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    v18 = v15;
    objc_msgSend(a1, "intentSlotKeyPath");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315394;
    v35 = "-[SAIntentGroupResolveIntentSlot(INSExtensionService) ins_sendIntent:toExtensionProxy:onQueue:completionHandler:]";
    v36 = 2112;
    v37 = v19;
    _os_log_impl(&dword_20BAA8000, v18, OS_LOG_TYPE_INFO, "%s intentSlotKeyPath = %@", buf, 0x16u);

  }
  +[INSAnalytics sharedAnalytics](INSAnalytics, "sharedAnalytics");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "ins_afAnalyticsContext");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "logEventWithType:context:contextNoCopy:", 607, v21, 1);

  v22 = MEMORY[0x24BDAC760];
  v33[0] = MEMORY[0x24BDAC760];
  v33[1] = 3221225472;
  v33[2] = __113__SAIntentGroupResolveIntentSlot_INSExtensionService__ins_sendIntent_toExtensionProxy_onQueue_completionHandler___block_invoke;
  v33[3] = &unk_24C4B98C8;
  v33[4] = a1;
  objc_msgSend(v11, "setResponseHandler:", v33);
  objc_msgSend(a1, "intentSlotKeyPath");
  v27[0] = v22;
  v27[1] = 3221225472;
  v27[2] = __113__SAIntentGroupResolveIntentSlot_INSExtensionService__ins_sendIntent_toExtensionProxy_onQueue_completionHandler___block_invoke_2;
  v27[3] = &unk_24C4B9580;
  v28 = v12;
  v29 = a1;
  v30 = v10;
  v31 = (id)objc_claimAutoreleasedReturnValue();
  v32 = v13;
  v23 = v13;
  v24 = v31;
  v25 = v10;
  v26 = v12;
  objc_msgSend(v11, "resolveIntentSlotKeyPath:completionHandler:", v24, v27);

}

- (uint64_t)ins_analyticsBeginEventType
{
  return 606;
}

- (uint64_t)ins_analyticsEndEventType
{
  return 609;
}

- (uint64_t)ins_shouldUseExtendedFlowTimeout
{
  return 1;
}

@end
