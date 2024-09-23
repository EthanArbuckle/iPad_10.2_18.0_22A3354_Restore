@implementation DEDFeedbackAnalytics

+ (void)logEventWithRequest:(id)a3 httpStatusCode:(int64_t)a4 nsurlErrorCode:(int64_t)a5 success:(BOOL)a6 startedAt:(double)a7 endedAt:(double)a8
{
  id v13;
  uint64_t v14;
  id v15;
  _QWORD block[4];
  char v17;
  uint64_t v18;
  uint64_t v19;
  id (*v20)(uint64_t);
  void *v21;
  id v22;
  int64_t v23;
  int64_t v24;
  double v25;
  double v26;
  BOOL v27;

  v13 = a3;
  if (logEventWithRequest_httpStatusCode_nsurlErrorCode_success_startedAt_endedAt__onceToken != -1)
    dispatch_once(&logEventWithRequest_httpStatusCode_nsurlErrorCode_success_startedAt_endedAt__onceToken, &__block_literal_global_19);
  v14 = MEMORY[0x24BDAC760];
  v18 = MEMORY[0x24BDAC760];
  v19 = 3221225472;
  v20 = __100__DEDFeedbackAnalytics_logEventWithRequest_httpStatusCode_nsurlErrorCode_success_startedAt_endedAt___block_invoke_2;
  v21 = &unk_24D1E5A28;
  v22 = v13;
  v23 = a4;
  v24 = a5;
  v25 = a7;
  v26 = a8;
  v27 = a6;
  v15 = v13;
  block[0] = v14;
  block[1] = 3221225472;
  block[2] = __100__DEDFeedbackAnalytics_logEventWithRequest_httpStatusCode_nsurlErrorCode_success_startedAt_endedAt___block_invoke_25;
  block[3] = &__block_descriptor_33_e5_v8__0l;
  v17 = AnalyticsSendEventLazy();
  if (logEventWithRequest_httpStatusCode_nsurlErrorCode_success_startedAt_endedAt__logOnceToken != -1)
    dispatch_once(&logEventWithRequest_httpStatusCode_nsurlErrorCode_success_startedAt_endedAt__logOnceToken, block);

}

void __100__DEDFeedbackAnalytics_logEventWithRequest_httpStatusCode_nsurlErrorCode_success_startedAt_endedAt___block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.feedback.analytics", "network");
  v1 = (void *)logEventWithRequest_httpStatusCode_nsurlErrorCode_success_startedAt_endedAt__NetworkLog;
  logEventWithRequest_httpStatusCode_nsurlErrorCode_success_startedAt_endedAt__NetworkLog = (uint64_t)v0;

}

id __100__DEDFeedbackAnalytics_logEventWithRequest_httpStatusCode_nsurlErrorCode_success_startedAt_endedAt___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  __CFString *v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  __CFString *v21;
  NSObject *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  NSObject *v36;
  int v38;
  const __CFString *v39;
  __int16 v40;
  void *v41;
  _QWORD v42[7];
  _QWORD v43[8];

  v43[7] = *MEMORY[0x24BDAC8D0];
  v2 = *(void **)(a1 + 32);
  if (v2)
  {
    objc_msgSend(v2, "URL");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "path");
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();

    if (v4)
      goto LABEL_8;
    v5 = logEventWithRequest_httpStatusCode_nsurlErrorCode_success_startedAt_endedAt__NetworkLog;
    if (os_log_type_enabled((os_log_t)logEventWithRequest_httpStatusCode_nsurlErrorCode_success_startedAt_endedAt__NetworkLog, OS_LOG_TYPE_ERROR))
    {
      __100__DEDFeedbackAnalytics_logEventWithRequest_httpStatusCode_nsurlErrorCode_success_startedAt_endedAt___block_invoke_2_cold_3(v5, v6, v7, v8, v9, v10, v11, v12);
    }
  }
  else
  {
    v13 = logEventWithRequest_httpStatusCode_nsurlErrorCode_success_startedAt_endedAt__NetworkLog;
    if (os_log_type_enabled((os_log_t)logEventWithRequest_httpStatusCode_nsurlErrorCode_success_startedAt_endedAt__NetworkLog, OS_LOG_TYPE_ERROR))
    {
      __100__DEDFeedbackAnalytics_logEventWithRequest_httpStatusCode_nsurlErrorCode_success_startedAt_endedAt___block_invoke_2_cold_2(v13, v14, v15, v16, v17, v18, v19, v20);
    }
  }
  v4 = CFSTR("Unknown");
LABEL_8:
  objc_msgSend(*(id *)(a1 + 32), "HTTPMethod");
  v21 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if (!v21)
  {
    v22 = logEventWithRequest_httpStatusCode_nsurlErrorCode_success_startedAt_endedAt__NetworkLog;
    if (os_log_type_enabled((os_log_t)logEventWithRequest_httpStatusCode_nsurlErrorCode_success_startedAt_endedAt__NetworkLog, OS_LOG_TYPE_ERROR))
    {
      __100__DEDFeedbackAnalytics_logEventWithRequest_httpStatusCode_nsurlErrorCode_success_startedAt_endedAt___block_invoke_2_cold_1(v22, v23, v24, v25, v26, v27, v28, v29);
    }
    v21 = CFSTR("Unknown");
  }
  v42[0] = CFSTR("api_route");
  v42[1] = CFSTR("method");
  v43[0] = v4;
  v43[1] = v21;
  v42[2] = CFSTR("http_status_code");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", *(_QWORD *)(a1 + 40));
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v43[2] = v30;
  v42[3] = CFSTR("nsurl_error_code");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", *(_QWORD *)(a1 + 48));
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v43[3] = v31;
  v42[4] = CFSTR("duration");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", DEDTimeElapsed(*(double *)(a1 + 56), *(double *)(a1 + 64)));
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v43[4] = v32;
  v42[5] = CFSTR("success");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", *(unsigned __int8 *)(a1 + 72));
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v43[5] = v33;
  v42[6] = CFSTR("process_name");
  +[DEDConstants processName](DEDConstants, "processName");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v43[6] = v34;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v43, v42, 7);
  v35 = (void *)objc_claimAutoreleasedReturnValue();

  v36 = logEventWithRequest_httpStatusCode_nsurlErrorCode_success_startedAt_endedAt__NetworkLog;
  if (os_log_type_enabled((os_log_t)logEventWithRequest_httpStatusCode_nsurlErrorCode_success_startedAt_endedAt__NetworkLog, OS_LOG_TYPE_INFO))
  {
    v38 = 138543618;
    v39 = CFSTR("com.apple.feedback.networkEvent");
    v40 = 2114;
    v41 = v35;
    _os_log_impl(&dword_21469E000, v36, OS_LOG_TYPE_INFO, "%{public}@: %{public}@", (uint8_t *)&v38, 0x16u);
  }

  return v35;
}

void __100__DEDFeedbackAnalytics_logEventWithRequest_httpStatusCode_nsurlErrorCode_success_startedAt_endedAt___block_invoke_25(uint64_t a1)
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
  v2 = logEventWithRequest_httpStatusCode_nsurlErrorCode_success_startedAt_endedAt__NetworkLog;
  v3 = os_log_type_enabled((os_log_t)logEventWithRequest_httpStatusCode_nsurlErrorCode_success_startedAt_endedAt__NetworkLog, OS_LOG_TYPE_DEFAULT);
  if (v1)
  {
    if (!v3)
      return;
    v5 = 138543362;
    v6 = CFSTR("com.apple.feedback.networkEvent");
    v4 = "%{public}@ is enabled";
  }
  else
  {
    if (!v3)
      return;
    v5 = 138543362;
    v6 = CFSTR("com.apple.feedback.networkEvent");
    v4 = "%{public}@ is NOT enabled";
  }
  _os_log_impl(&dword_21469E000, v2, OS_LOG_TYPE_DEFAULT, v4, (uint8_t *)&v5, 0xCu);
}

+ (void)logDataLoadWithContentItemCount:(unint64_t)a3 formItemsCount:(unint64_t)a4 teamCount:(unint64_t)a5 errorsCount:(unint64_t)a6 startedAt:(double)a7 endedAt:(double)a8
{
  _QWORD block[4];
  char v15;
  uint64_t v16;
  uint64_t v17;
  id (*v18)(uint64_t);
  void *v19;
  unint64_t v20;
  unint64_t v21;
  unint64_t v22;
  unint64_t v23;
  double v24;
  double v25;

  if (logDataLoadWithContentItemCount_formItemsCount_teamCount_errorsCount_startedAt_endedAt__onceToken != -1)
    dispatch_once(&logDataLoadWithContentItemCount_formItemsCount_teamCount_errorsCount_startedAt_endedAt__onceToken, &__block_literal_global_26);
  v16 = MEMORY[0x24BDAC760];
  v17 = 3221225472;
  v18 = __111__DEDFeedbackAnalytics_logDataLoadWithContentItemCount_formItemsCount_teamCount_errorsCount_startedAt_endedAt___block_invoke_2;
  v19 = &__block_descriptor_80_e19___NSDictionary_8__0l;
  v20 = a3;
  v21 = a4;
  v22 = a5;
  v23 = a6;
  v24 = a8;
  v25 = a7;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __111__DEDFeedbackAnalytics_logDataLoadWithContentItemCount_formItemsCount_teamCount_errorsCount_startedAt_endedAt___block_invoke_39;
  block[3] = &__block_descriptor_33_e5_v8__0l;
  v15 = AnalyticsSendEventLazy();
  if (logDataLoadWithContentItemCount_formItemsCount_teamCount_errorsCount_startedAt_endedAt__logOnceToken != -1)
    dispatch_once(&logDataLoadWithContentItemCount_formItemsCount_teamCount_errorsCount_startedAt_endedAt__logOnceToken, block);
}

void __111__DEDFeedbackAnalytics_logDataLoadWithContentItemCount_formItemsCount_teamCount_errorsCount_startedAt_endedAt___block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.feedback.analytics", "data-load");
  v1 = (void *)logDataLoadWithContentItemCount_formItemsCount_teamCount_errorsCount_startedAt_endedAt__DataLoadLog;
  logDataLoadWithContentItemCount_formItemsCount_teamCount_errorsCount_startedAt_endedAt__DataLoadLog = (uint64_t)v0;

}

id __111__DEDFeedbackAnalytics_logDataLoadWithContentItemCount_formItemsCount_teamCount_errorsCount_startedAt_endedAt___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  int v11;
  const __CFString *v12;
  __int16 v13;
  void *v14;
  _QWORD v15[6];
  _QWORD v16[7];

  v16[6] = *MEMORY[0x24BDAC8D0];
  v15[0] = CFSTR("content_item_count");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLong:", *(_QWORD *)(a1 + 32));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v2;
  v15[1] = CFSTR("form_item_count");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLong:", *(_QWORD *)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v16[1] = v3;
  v15[2] = CFSTR("team_count");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLong:", *(_QWORD *)(a1 + 48));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v16[2] = v4;
  v15[3] = CFSTR("errors_count");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLong:", *(_QWORD *)(a1 + 56));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v16[3] = v5;
  v15[4] = CFSTR("total_duration");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", *(double *)(a1 + 64) - *(double *)(a1 + 72));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v16[4] = v6;
  v15[5] = CFSTR("process_name");
  +[DEDConstants processName](DEDConstants, "processName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v16[5] = v7;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v16, v15, 6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = logDataLoadWithContentItemCount_formItemsCount_teamCount_errorsCount_startedAt_endedAt__DataLoadLog;
  if (os_log_type_enabled((os_log_t)logDataLoadWithContentItemCount_formItemsCount_teamCount_errorsCount_startedAt_endedAt__DataLoadLog, OS_LOG_TYPE_INFO))
  {
    v11 = 138543618;
    v12 = CFSTR("com.apple.feedback.dataLoad");
    v13 = 2114;
    v14 = v8;
    _os_log_impl(&dword_21469E000, v9, OS_LOG_TYPE_INFO, "%{public}@: %{public}@", (uint8_t *)&v11, 0x16u);
  }
  return v8;
}

void __111__DEDFeedbackAnalytics_logDataLoadWithContentItemCount_formItemsCount_teamCount_errorsCount_startedAt_endedAt___block_invoke_39(uint64_t a1)
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
  v2 = logDataLoadWithContentItemCount_formItemsCount_teamCount_errorsCount_startedAt_endedAt__DataLoadLog;
  v3 = os_log_type_enabled((os_log_t)logDataLoadWithContentItemCount_formItemsCount_teamCount_errorsCount_startedAt_endedAt__DataLoadLog, OS_LOG_TYPE_DEFAULT);
  if (v1)
  {
    if (!v3)
      return;
    v5 = 138543362;
    v6 = CFSTR("com.apple.feedback.dataLoad");
    v4 = "%{public}@ is enabled";
  }
  else
  {
    if (!v3)
      return;
    v5 = 138543362;
    v6 = CFSTR("com.apple.feedback.dataLoad");
    v4 = "%{public}@ is NOT enabled";
  }
  _os_log_impl(&dword_21469E000, v2, OS_LOG_TYPE_DEFAULT, v4, (uint8_t *)&v5, 0xCu);
}

+ (void)logFBKBugSessionStartWithDeviceType:(id)a3 isRemote:(BOOL)a4 success:(BOOL)a5 errorCode:(int64_t)a6 startedAt:(double)a7 getSessionEndedAt:(double)a8 showExtensionsEndedAt:(double)a9 getStatusEndedAt:(double)a10
{
  id v17;
  uint64_t v18;
  id v19;
  _QWORD v20[4];
  char v21;
  uint64_t v22;
  uint64_t v23;
  id (*v24)(uint64_t);
  void *v25;
  id v26;
  double v27;
  double v28;
  double v29;
  double v30;
  int64_t v31;
  BOOL v32;
  BOOL v33;

  v17 = a3;
  if (logFBKBugSessionStartWithDeviceType_isRemote_success_errorCode_startedAt_getSessionEndedAt_showExtensionsEndedAt_getStatusEndedAt__onceToken != -1)
    dispatch_once(&logFBKBugSessionStartWithDeviceType_isRemote_success_errorCode_startedAt_getSessionEndedAt_showExtensionsEndedAt_getStatusEndedAt__onceToken, &__block_literal_global_40);
  v18 = MEMORY[0x24BDAC760];
  v22 = MEMORY[0x24BDAC760];
  v23 = 3221225472;
  v24 = __154__DEDFeedbackAnalytics_logFBKBugSessionStartWithDeviceType_isRemote_success_errorCode_startedAt_getSessionEndedAt_showExtensionsEndedAt_getStatusEndedAt___block_invoke_2;
  v25 = &unk_24D1E5AB0;
  v27 = a7;
  v28 = a8;
  v29 = a9;
  v30 = a10;
  v26 = v17;
  v32 = a4;
  v33 = a5;
  v31 = a6;
  v19 = v17;
  v20[0] = v18;
  v20[1] = 3221225472;
  v20[2] = __154__DEDFeedbackAnalytics_logFBKBugSessionStartWithDeviceType_isRemote_success_errorCode_startedAt_getSessionEndedAt_showExtensionsEndedAt_getStatusEndedAt___block_invoke_54;
  v20[3] = &__block_descriptor_33_e5_v8__0l;
  v21 = AnalyticsSendEventLazy();
  if (logFBKBugSessionStartWithDeviceType_isRemote_success_errorCode_startedAt_getSessionEndedAt_showExtensionsEndedAt_getStatusEndedAt__logOnceToken != -1)
    dispatch_once(&logFBKBugSessionStartWithDeviceType_isRemote_success_errorCode_startedAt_getSessionEndedAt_showExtensionsEndedAt_getStatusEndedAt__logOnceToken, v20);

}

void __154__DEDFeedbackAnalytics_logFBKBugSessionStartWithDeviceType_isRemote_success_errorCode_startedAt_getSessionEndedAt_showExtensionsEndedAt_getStatusEndedAt___block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.feedback.analytics", "fbk-session");
  v1 = (void *)logFBKBugSessionStartWithDeviceType_isRemote_success_errorCode_startedAt_getSessionEndedAt_showExtensionsEndedAt_getStatusEndedAt__Log;
  logFBKBugSessionStartWithDeviceType_isRemote_success_errorCode_startedAt_getSessionEndedAt_showExtensionsEndedAt_getStatusEndedAt__Log = (uint64_t)v0;

}

id __154__DEDFeedbackAnalytics_logFBKBugSessionStartWithDeviceType_isRemote_success_errorCode_startedAt_getSessionEndedAt_showExtensionsEndedAt_getStatusEndedAt___block_invoke_2(uint64_t a1)
{
  double v2;
  double v3;
  double v4;
  const __CFString *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  int v16;
  const __CFString *v17;
  __int16 v18;
  void *v19;
  _QWORD v20[8];
  _QWORD v21[9];

  v21[8] = *MEMORY[0x24BDAC8D0];
  v2 = DEDTimeElapsed(*(double *)(a1 + 40), *(double *)(a1 + 48));
  v3 = DEDTimeElapsed(*(double *)(a1 + 48), *(double *)(a1 + 56));
  v4 = DEDTimeElapsed(*(double *)(a1 + 56), *(double *)(a1 + 64));
  v5 = CFSTR("Unknown");
  if (*(_QWORD *)(a1 + 32))
    v5 = *(const __CFString **)(a1 + 32);
  v21[0] = v5;
  v20[0] = CFSTR("device_type");
  v20[1] = CFSTR("is_remote");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", *(unsigned __int8 *)(a1 + 80));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v21[1] = v6;
  v20[2] = CFSTR("success");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", *(unsigned __int8 *)(a1 + 81));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v21[2] = v7;
  v20[3] = CFSTR("error_code");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", *(_QWORD *)(a1 + 72));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v21[3] = v8;
  v20[4] = CFSTR("process_name");
  +[DEDConstants processName](DEDConstants, "processName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v21[4] = v9;
  v20[5] = CFSTR("session_time_interval");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v21[5] = v10;
  v20[6] = CFSTR("show_extensions_time_interval");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v21[6] = v11;
  v20[7] = CFSTR("status_time_interval");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v21[7] = v12;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v21, v20, 8);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = logFBKBugSessionStartWithDeviceType_isRemote_success_errorCode_startedAt_getSessionEndedAt_showExtensionsEndedAt_getStatusEndedAt__Log;
  if (os_log_type_enabled((os_log_t)logFBKBugSessionStartWithDeviceType_isRemote_success_errorCode_startedAt_getSessionEndedAt_showExtensionsEndedAt_getStatusEndedAt__Log, OS_LOG_TYPE_INFO))
  {
    v16 = 138543618;
    v17 = CFSTR("com.apple.feedback.fbkSideSessionStart");
    v18 = 2114;
    v19 = v13;
    _os_log_impl(&dword_21469E000, v14, OS_LOG_TYPE_INFO, "%{public}@: %{public}@", (uint8_t *)&v16, 0x16u);
  }
  return v13;
}

void __154__DEDFeedbackAnalytics_logFBKBugSessionStartWithDeviceType_isRemote_success_errorCode_startedAt_getSessionEndedAt_showExtensionsEndedAt_getStatusEndedAt___block_invoke_54(uint64_t a1)
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
  v2 = logFBKBugSessionStartWithDeviceType_isRemote_success_errorCode_startedAt_getSessionEndedAt_showExtensionsEndedAt_getStatusEndedAt__Log;
  v3 = os_log_type_enabled((os_log_t)logFBKBugSessionStartWithDeviceType_isRemote_success_errorCode_startedAt_getSessionEndedAt_showExtensionsEndedAt_getStatusEndedAt__Log, OS_LOG_TYPE_DEFAULT);
  if (v1)
  {
    if (!v3)
      return;
    v5 = 138543362;
    v6 = CFSTR("com.apple.feedback.fbkSideSessionStart");
    v4 = "%{public}@ is enabled";
  }
  else
  {
    if (!v3)
      return;
    v5 = 138543362;
    v6 = CFSTR("com.apple.feedback.fbkSideSessionStart");
    v4 = "%{public}@ is NOT enabled";
  }
  _os_log_impl(&dword_21469E000, v2, OS_LOG_TYPE_DEFAULT, v4, (uint8_t *)&v5, 0xCu);
}

void __100__DEDFeedbackAnalytics_logEventWithRequest_httpStatusCode_nsurlErrorCode_success_startedAt_endedAt___block_invoke_2_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_21469E000, a1, a3, "request.HTTPMethod is nil", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_2_3();
}

void __100__DEDFeedbackAnalytics_logEventWithRequest_httpStatusCode_nsurlErrorCode_success_startedAt_endedAt___block_invoke_2_cold_2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_21469E000, a1, a3, "Received nil request", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_2_3();
}

void __100__DEDFeedbackAnalytics_logEventWithRequest_httpStatusCode_nsurlErrorCode_success_startedAt_endedAt___block_invoke_2_cold_3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_21469E000, a1, a3, "request.URL.path is nil", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_2_3();
}

@end
