@implementation DEDAnalytics

+ (id)log
{
  if (log_onceToken_2 != -1)
    dispatch_once(&log_onceToken_2, &__block_literal_global_13);
  return (id)log_log_2;
}

void __19__DEDAnalytics_log__block_invoke()
{
  os_log_t v0;
  void *v1;
  id v2;

  +[DEDConfiguration sharedInstance](DEDConfiguration, "sharedInstance");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  v0 = os_log_create((const char *)objc_msgSend(v2, "loggingSubsystem"), "ded-analytics");
  v1 = (void *)log_log_2;
  log_log_2 = (uint64_t)v0;

}

+ (void)didStartDaemon
{
  NSObject *v2;
  void *v3;
  int v4;
  const char *v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "log");
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    v4 = 136446210;
    v5 = "+[DEDAnalytics didStartDaemon]";
    _os_log_impl(&dword_21469E000, v2, OS_LOG_TYPE_INFO, "%{public}s", (uint8_t *)&v4, 0xCu);
  }

  v3 = (void *)objc_opt_new();
  AWDPostMetric();

}

+ (void)didCheckInDeferredExtensionsWithCount:(unint64_t)a3
{
  NSObject *v4;
  void *v5;
  int v6;
  const char *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "log");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v6 = 136446210;
    v7 = "+[DEDAnalytics didCheckInDeferredExtensionsWithCount:]";
    _os_log_impl(&dword_21469E000, v4, OS_LOG_TYPE_INFO, "%{public}s", (uint8_t *)&v6, 0xCu);
  }

  v5 = (void *)objc_opt_new();
  objc_msgSend(v5, "setNumtasks:", a3);
  AWDPostMetric();

}

+ (void)didCreateBugSessionForApp:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  int v7;
  const char *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(a1, "log");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v7 = 136446210;
    v8 = "+[DEDAnalytics didCreateBugSessionForApp:]";
    _os_log_impl(&dword_21469E000, v5, OS_LOG_TYPE_INFO, "%{public}s", (uint8_t *)&v7, 0xCu);
  }

  v6 = (void *)objc_opt_new();
  objc_msgSend(v6, "setHostapp:", v4);

  AWDPostMetric();
}

+ (void)didStartExtensionWithIdentifier:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  int v7;
  const char *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(a1, "log");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v7 = 136446210;
    v8 = "+[DEDAnalytics didStartExtensionWithIdentifier:]";
    _os_log_impl(&dword_21469E000, v5, OS_LOG_TYPE_INFO, "%{public}s", (uint8_t *)&v7, 0xCu);
  }

  v6 = (void *)objc_opt_new();
  objc_msgSend(v6, "setExtension:", v4);

  AWDPostMetric();
}

+ (void)extensionDidScheduleExtensionWithIdentifier:(id)a3 delay:(unint64_t)a4
{
  id v6;
  NSObject *v7;
  void *v8;
  int v9;
  const char *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  objc_msgSend(a1, "log");
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v9 = 136446210;
    v10 = "+[DEDAnalytics extensionDidScheduleExtensionWithIdentifier:delay:]";
    _os_log_impl(&dword_21469E000, v7, OS_LOG_TYPE_INFO, "%{public}s", (uint8_t *)&v9, 0xCu);
  }

  v8 = (void *)objc_opt_new();
  objc_msgSend(v8, "setExtension:", v6);

  objc_msgSend(v8, "setDelay:", a4);
  AWDPostMetric();

}

+ (void)extensionWithIdentifier:(id)a3 didCompleteWithFileCount:(unint64_t)a4 bytesCollected:(unint64_t)a5 duration:(unint64_t)a6 errorCode:(int64_t)a7
{
  id v12;
  NSObject *v13;
  void *v14;
  int v15;
  const char *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v12 = a3;
  objc_msgSend(a1, "log");
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    v15 = 136446210;
    v16 = "+[DEDAnalytics extensionWithIdentifier:didCompleteWithFileCount:bytesCollected:duration:errorCode:]";
    _os_log_impl(&dword_21469E000, v13, OS_LOG_TYPE_INFO, "%{public}s", (uint8_t *)&v15, 0xCu);
  }

  v14 = (void *)objc_opt_new();
  objc_msgSend(v14, "setExtension:", v12);

  objc_msgSend(v14, "setNumfiles:", a4);
  objc_msgSend(v14, "setNumbytes:", a5);
  objc_msgSend(v14, "setDuration:", a6);
  objc_msgSend(v14, "setError:", a7);
  AWDPostMetric();

}

+ (void)finisherDidStartWithFileCount:(unint64_t)a3 expectedByteUploadCount:(unint64_t)a4 finishingMove:(int64_t)a5
{
  NSObject *v8;
  void *v9;
  uint64_t v10;
  int v11;
  const char *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "log");
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    v11 = 136446210;
    v12 = "+[DEDAnalytics finisherDidStartWithFileCount:expectedByteUploadCount:finishingMove:]";
    _os_log_impl(&dword_21469E000, v8, OS_LOG_TYPE_INFO, "%{public}s", (uint8_t *)&v11, 0xCu);
  }

  v9 = (void *)objc_opt_new();
  objc_msgSend(v9, "setNumfiles:", a3);
  objc_msgSend(v9, "setNumbytes:", a4);
  if ((unint64_t)(a5 - 1) < 3)
    v10 = a5;
  else
    v10 = 0;
  objc_msgSend(v9, "setType:", v10);
  AWDPostMetric();

}

+ (void)finisherDidCompleteWithDuration:(unint64_t)a3 uploadedByteCount:(unint64_t)a4 usingFinishingMove:(int64_t)a5 withState:(int64_t)a6
{
  NSObject *v10;
  void *v11;
  uint64_t v12;
  int v13;
  const char *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "log");
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    v13 = 136446210;
    v14 = "+[DEDAnalytics finisherDidCompleteWithDuration:uploadedByteCount:usingFinishingMove:withState:]";
    _os_log_impl(&dword_21469E000, v10, OS_LOG_TYPE_INFO, "%{public}s", (uint8_t *)&v13, 0xCu);
  }

  v11 = (void *)objc_opt_new();
  objc_msgSend(v11, "setDuration:", a3);
  objc_msgSend(v11, "setNumbytes:", a4);
  if ((unint64_t)(a5 - 1) < 3)
    v12 = a5;
  else
    v12 = 0;
  objc_msgSend(v11, "setType:", v12);
  objc_msgSend(v11, "setState:", a6);
  AWDPostMetric();

}

+ (void)didCompleteBugSessionWithState:(int64_t)a3
{
  NSObject *v4;
  void *v5;
  int v6;
  const char *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "log");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v6 = 136446210;
    v7 = "+[DEDAnalytics didCompleteBugSessionWithState:]";
    _os_log_impl(&dword_21469E000, v4, OS_LOG_TYPE_INFO, "%{public}s", (uint8_t *)&v6, 0xCu);
  }

  v5 = (void *)objc_opt_new();
  objc_msgSend(v5, "setSessionState:", a3);
  AWDPostMetric();

}

+ (void)logBugSessionStartWithDeviceType:(id)a3 isRemote:(BOOL)a4 success:(BOOL)a5 errorCode:(int64_t)a6
{
  id v9;
  uint64_t v10;
  id v11;
  _QWORD v12[4];
  char v13;
  uint64_t v14;
  uint64_t v15;
  id (*v16)(uint64_t);
  void *v17;
  id v18;
  int64_t v19;
  BOOL v20;
  BOOL v21;

  v9 = a3;
  if (logBugSessionStartWithDeviceType_isRemote_success_errorCode__onceToken != -1)
    dispatch_once(&logBugSessionStartWithDeviceType_isRemote_success_errorCode__onceToken, &__block_literal_global_12);
  v10 = MEMORY[0x24BDAC760];
  v14 = MEMORY[0x24BDAC760];
  v15 = 3221225472;
  v16 = __76__DEDAnalytics_logBugSessionStartWithDeviceType_isRemote_success_errorCode___block_invoke_2;
  v17 = &unk_24D1E5520;
  v20 = a4;
  v21 = a5;
  v18 = v9;
  v19 = a6;
  v11 = v9;
  v12[0] = v10;
  v12[1] = 3221225472;
  v12[2] = __76__DEDAnalytics_logBugSessionStartWithDeviceType_isRemote_success_errorCode___block_invoke_28;
  v12[3] = &__block_descriptor_33_e5_v8__0l;
  v13 = AnalyticsSendEventLazy();
  if (logBugSessionStartWithDeviceType_isRemote_success_errorCode__logOnceToken != -1)
    dispatch_once(&logBugSessionStartWithDeviceType_isRemote_success_errorCode__logOnceToken, v12);

}

void __76__DEDAnalytics_logBugSessionStartWithDeviceType_isRemote_success_errorCode___block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.feedback.analytics", "session-start");
  v1 = (void *)logBugSessionStartWithDeviceType_isRemote_success_errorCode__SessionStartLog;
  logBugSessionStartWithDeviceType_isRemote_success_errorCode__SessionStartLog = (uint64_t)v0;

}

id __76__DEDAnalytics_logBugSessionStartWithDeviceType_isRemote_success_errorCode___block_invoke_2(uint64_t a1)
{
  const __CFString *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  int v10;
  const __CFString *v11;
  __int16 v12;
  void *v13;
  _QWORD v14[5];
  _QWORD v15[6];

  v15[5] = *MEMORY[0x24BDAC8D0];
  v2 = CFSTR("Unknown");
  if (*(_QWORD *)(a1 + 32))
    v2 = *(const __CFString **)(a1 + 32);
  v15[0] = v2;
  v14[0] = CFSTR("device_type");
  v14[1] = CFSTR("is_remote");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", *(unsigned __int8 *)(a1 + 48));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v15[1] = v3;
  v14[2] = CFSTR("success");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", *(unsigned __int8 *)(a1 + 49));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v15[2] = v4;
  v14[3] = CFSTR("error_code");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", *(_QWORD *)(a1 + 40));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v15[3] = v5;
  v14[4] = CFSTR("process_name");
  +[DEDConstants processName](DEDConstants, "processName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v15[4] = v6;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v15, v14, 5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = logBugSessionStartWithDeviceType_isRemote_success_errorCode__SessionStartLog;
  if (os_log_type_enabled((os_log_t)logBugSessionStartWithDeviceType_isRemote_success_errorCode__SessionStartLog, OS_LOG_TYPE_INFO))
  {
    v10 = 138543618;
    v11 = CFSTR("com.apple.feedback.bugSessionStart");
    v12 = 2114;
    v13 = v7;
    _os_log_impl(&dword_21469E000, v8, OS_LOG_TYPE_INFO, "%{public}@: %{public}@", (uint8_t *)&v10, 0x16u);
  }
  return v7;
}

void __76__DEDAnalytics_logBugSessionStartWithDeviceType_isRemote_success_errorCode___block_invoke_28(uint64_t a1)
{
  int v1;
  NSObject *v2;
  _BOOL4 v3;
  const char *v4;
  int v5;
  const __CFString *v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v1 = *(unsigned __int8 *)(a1 + 32);
  v2 = logBugSessionStartWithDeviceType_isRemote_success_errorCode__SessionStartLog;
  v3 = os_log_type_enabled((os_log_t)logBugSessionStartWithDeviceType_isRemote_success_errorCode__SessionStartLog, OS_LOG_TYPE_DEFAULT);
  if (v1)
  {
    if (!v3)
      return;
    v5 = 138543362;
    v6 = CFSTR("com.apple.feedback.bugSessionStart");
    v4 = "%{public}@ is enabled";
  }
  else
  {
    if (!v3)
      return;
    v5 = 138543362;
    v6 = CFSTR("com.apple.feedback.bugSessionStart");
    v4 = "%{public}@ is NOT enabled";
  }
  _os_log_impl(&dword_21469E000, v2, OS_LOG_TYPE_DEFAULT, v4, (uint8_t *)&v5, 0xCu);
}

@end
