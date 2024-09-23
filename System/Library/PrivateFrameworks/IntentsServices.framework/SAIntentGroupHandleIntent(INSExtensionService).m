@implementation SAIntentGroupHandleIntent(INSExtensionService)

- (void)ins_sendIntent:()INSExtensionService toExtensionProxy:onQueue:completionHandler:
{
  id v10;
  id v11;
  id v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  id v19;
  id v20;
  _QWORD v21[4];
  id v22;
  void *v23;
  id v24;
  _QWORD v25[5];
  uint8_t buf[4];
  const char *v27;
  __int16 v28;
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v10 = a4;
  v11 = a5;
  v12 = a6;
  v13 = (void *)*MEMORY[0x24BDD9A30];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD9A30], OS_LOG_TYPE_INFO))
  {
    v14 = v13;
    objc_msgSend(a3, "backingStore");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315394;
    v27 = "-[SAIntentGroupHandleIntent(INSExtensionService) ins_sendIntent:toExtensionProxy:onQueue:completionHandler:]";
    v28 = 2112;
    v29 = v15;
    _os_log_impl(&dword_20BAA8000, v14, OS_LOG_TYPE_INFO, "%s intent.backingStore = %@", buf, 0x16u);

  }
  +[INSAnalytics sharedAnalytics](INSAnalytics, "sharedAnalytics");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "ins_afAnalyticsContext");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "logEventWithType:context:contextNoCopy:", 616, v17, 1);

  v18 = MEMORY[0x24BDAC760];
  v25[0] = MEMORY[0x24BDAC760];
  v25[1] = 3221225472;
  v25[2] = __108__SAIntentGroupHandleIntent_INSExtensionService__ins_sendIntent_toExtensionProxy_onQueue_completionHandler___block_invoke;
  v25[3] = &unk_24C4B98C8;
  v25[4] = a1;
  objc_msgSend(v10, "setResponseHandler:", v25);
  objc_msgSend(v10, "setImageProcessingHandler:", &__block_literal_global_375);
  v21[0] = v18;
  v21[1] = 3221225472;
  v21[2] = __108__SAIntentGroupHandleIntent_INSExtensionService__ins_sendIntent_toExtensionProxy_onQueue_completionHandler___block_invoke_4;
  v21[3] = &unk_24C4B9980;
  v22 = v11;
  v23 = a1;
  v24 = v12;
  v19 = v12;
  v20 = v11;
  objc_msgSend(v10, "handleIntentWithCompletionHandler:", v21);

}

- (uint64_t)ins_analyticsBeginEventType
{
  return 615;
}

- (uint64_t)ins_analyticsEndEventType
{
  return 619;
}

- (uint64_t)ins_shouldUseExtendedFlowTimeout
{
  return 1;
}

@end
