@implementation SAIntentGroupProcessIntent(INSExtensionService)

- (void)ins_sendIntent:()INSExtensionService toExtensionProxy:onQueue:completionHandler:
{
  id v10;
  id v11;
  id v12;
  id v13;
  os_log_t *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  id v21;
  void *v22;
  os_log_t v23;
  NSObject *v24;
  void *v25;
  id v26;
  id v27;
  _QWORD v28[4];
  id v29;
  void *v30;
  id v31;
  _QWORD v32[5];
  uint8_t buf[4];
  const char *v34;
  __int16 v35;
  void *v36;
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = (os_log_t *)MEMORY[0x24BDD9A30];
  v15 = (void *)*MEMORY[0x24BDD9A30];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD9A30], OS_LOG_TYPE_INFO))
  {
    v16 = v15;
    objc_msgSend(a1, "intentSlotKeyPaths");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315394;
    v34 = "-[SAIntentGroupProcessIntent(INSExtensionService) ins_sendIntent:toExtensionProxy:onQueue:completionHandler:]";
    v35 = 2112;
    v36 = v17;
    _os_log_impl(&dword_20BAA8000, v16, OS_LOG_TYPE_INFO, "%s intentSlotKeyPaths = %@", buf, 0x16u);

  }
  +[INSAnalytics sharedAnalytics](INSAnalytics, "sharedAnalytics");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "ins_afAnalyticsContext");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "logEventWithType:context:contextNoCopy:", 632, v19, 1);

  v20 = MEMORY[0x24BDAC760];
  v32[0] = MEMORY[0x24BDAC760];
  v32[1] = 3221225472;
  v32[2] = __109__SAIntentGroupProcessIntent_INSExtensionService__ins_sendIntent_toExtensionProxy_onQueue_completionHandler___block_invoke;
  v32[3] = &unk_24C4B98C8;
  v32[4] = a1;
  objc_msgSend(v11, "setResponseHandler:", v32);
  v21 = objc_alloc_init(MEMORY[0x24BE81378]);
  objc_msgSend(a1, "aceId");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setRefId:", v22);

  v23 = *v14;
  if (os_log_type_enabled(*v14, OS_LOG_TYPE_INFO))
  {
    v24 = v23;
    objc_msgSend(v10, "typeName");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315394;
    v34 = "-[SAIntentGroupProcessIntent(INSExtensionService) ins_sendIntent:toExtensionProxy:onQueue:completionHandler:]";
    v35 = 2112;
    v36 = v25;
    _os_log_impl(&dword_20BAA8000, v24, OS_LOG_TYPE_INFO, "%s Beginning BatchSlotResolution with intent %@", buf, 0x16u);

  }
  v28[0] = v20;
  v28[1] = 3221225472;
  v28[2] = __109__SAIntentGroupProcessIntent_INSExtensionService__ins_sendIntent_toExtensionProxy_onQueue_completionHandler___block_invoke_3;
  v28[3] = &unk_24C4B9428;
  v30 = a1;
  v31 = v13;
  v29 = v21;
  v26 = v21;
  v27 = v13;
  objc_msgSend(a1, "_resolveIntentSlotsWithExtensionProxy:onQueue:processIntentCompleted:completionHandler:", v11, v12, v26, v28);

}

- (void)_resolveIntentSlotsWithExtensionProxy:()INSExtensionService onQueue:processIntentCompleted:completionHandler:
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  id v19;
  id v20;
  _QWORD v21[5];
  id v22;
  id v23;
  id v24;
  id v25;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  +[INSAnalytics sharedAnalytics](INSAnalytics, "sharedAnalytics");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "ins_afAnalyticsContext");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "logEventWithType:context:contextNoCopy:", 636, v15, 1);

  objc_msgSend(v12, "setLastAttemptedStep:", *MEMORY[0x24BE82260]);
  objc_msgSend(a1, "intentSlotKeyPaths");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = MEMORY[0x24BDAC760];
  v21[1] = 3221225472;
  v21[2] = __138__SAIntentGroupProcessIntent_INSExtensionService___resolveIntentSlotsWithExtensionProxy_onQueue_processIntentCompleted_completionHandler___block_invoke;
  v21[3] = &unk_24C4B9478;
  v21[4] = a1;
  v22 = v11;
  v23 = v12;
  v24 = v10;
  v25 = v13;
  v17 = v13;
  v18 = v10;
  v19 = v12;
  v20 = v11;
  objc_msgSend(v18, "resolveIntentSlotKeyPaths:completionHandler:", v16, v21);

}

- (void)_confirmIntentWithExtensionProxy:()INSExtensionService onQueue:processIntentCompleted:completionHandler:
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  id v22;
  id v23;
  id v24;
  _QWORD v25[4];
  id v26;
  void *v27;
  id v28;
  id v29;
  id v30;
  uint8_t buf[4];
  const char *v32;
  __int16 v33;
  void *v34;
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  +[INSAnalytics sharedAnalytics](INSAnalytics, "sharedAnalytics");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "ins_afAnalyticsContext");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "logEventWithType:context:contextNoCopy:", 638, v15, 1);

  objc_msgSend(v12, "setLastAttemptedStep:", *MEMORY[0x24BE82250]);
  v16 = (void *)*MEMORY[0x24BDD9A30];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD9A30], OS_LOG_TYPE_INFO))
  {
    v17 = v16;
    objc_msgSend(v10, "_connection");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "intent");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "typeName");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315394;
    v32 = "-[SAIntentGroupProcessIntent(INSExtensionService) _confirmIntentWithExtensionProxy:onQueue:processIntentComple"
          "ted:completionHandler:]";
    v33 = 2112;
    v34 = v20;
    _os_log_impl(&dword_20BAA8000, v17, OS_LOG_TYPE_INFO, "%s Beginning ConfirmIntent with intent %@", buf, 0x16u);

  }
  v25[0] = MEMORY[0x24BDAC760];
  v25[1] = 3221225472;
  v25[2] = __133__SAIntentGroupProcessIntent_INSExtensionService___confirmIntentWithExtensionProxy_onQueue_processIntentCompleted_completionHandler___block_invoke;
  v25[3] = &unk_24C4B94A0;
  v26 = v11;
  v27 = a1;
  v28 = v12;
  v29 = v10;
  v30 = v13;
  v21 = v13;
  v22 = v10;
  v23 = v12;
  v24 = v11;
  objc_msgSend(v22, "confirmIntentWithCompletionHandler:", v25);

}

- (void)_handleIntentWithExtensionProxy:()INSExtensionService onQueue:processIntentCompleted:completionHandler:
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  id v20;
  id v21;
  id v22;
  _QWORD v23[4];
  id v24;
  void *v25;
  id v26;
  id v27;
  uint8_t buf[4];
  const char *v29;
  __int16 v30;
  void *v31;
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  +[INSAnalytics sharedAnalytics](INSAnalytics, "sharedAnalytics");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "ins_afAnalyticsContext");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "logEventWithType:context:contextNoCopy:", 640, v15, 1);

  objc_msgSend(v12, "setLastAttemptedStep:", *MEMORY[0x24BE82258]);
  v16 = (void *)*MEMORY[0x24BDD9A30];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD9A30], OS_LOG_TYPE_INFO))
  {
    v17 = v16;
    objc_msgSend(v10, "_connection");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "intent");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315394;
    v29 = "-[SAIntentGroupProcessIntent(INSExtensionService) _handleIntentWithExtensionProxy:onQueue:processIntentComplet"
          "ed:completionHandler:]";
    v30 = 2112;
    v31 = v19;
    _os_log_impl(&dword_20BAA8000, v17, OS_LOG_TYPE_INFO, "%s Beginning HandleIntent with intent %@", buf, 0x16u);

  }
  v23[0] = MEMORY[0x24BDAC760];
  v23[1] = 3221225472;
  v23[2] = __132__SAIntentGroupProcessIntent_INSExtensionService___handleIntentWithExtensionProxy_onQueue_processIntentCompleted_completionHandler___block_invoke;
  v23[3] = &unk_24C4B94C8;
  v24 = v11;
  v25 = a1;
  v26 = v12;
  v27 = v13;
  v20 = v13;
  v21 = v12;
  v22 = v11;
  objc_msgSend(v10, "handleIntentWithCompletionHandler:", v23);

}

- (uint64_t)ins_analyticsBeginEventType
{
  return 630;
}

- (uint64_t)ins_analyticsEndEventType
{
  return 631;
}

- (uint64_t)ins_shouldUseExtendedFlowTimeout
{
  return 1;
}

@end
