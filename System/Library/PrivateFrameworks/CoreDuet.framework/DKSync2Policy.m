@implementation DKSync2Policy

void __29___DKSync2Policy_policyCache__block_invoke()
{
  id v0;
  void *v1;
  id v2;
  id v3;

  v0 = objc_alloc_init(MEMORY[0x1E0C99D38]);
  v1 = (void *)policyCache_policyCache;
  policyCache_policyCache = (uint64_t)v0;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v2 = (id)objc_msgSend(v3, "addObserverForName:object:queue:usingBlock:", CFSTR("_DKSync2CoordinatorDidIdleNotification"), 0, 0, &__block_literal_global_73);

}

uint64_t __29___DKSync2Policy_policyCache__block_invoke_2()
{
  return objc_msgSend((id)policyCache_policyCache, "removeAllObjects");
}

void __77___DKSync2Policy_possiblyDownloadSyncPolicyWithPolicyDownloadIntervalInDays___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  void *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  int64_t v13;
  void *v14;
  id v15;
  id v16;
  void *v17;
  id v18;
  id v19;
  id v20;
  xpc_object_t v21;
  void *v22;
  uint64_t i;
  _QWORD v24[5];
  xpc_object_t values[9];
  _BYTE buf[24];
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  +[_DKSync2Policy productVersion]();
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)possiblyDownloadSyncPolicyWithPolicyDownloadIntervalInDays__productVersion;
  possiblyDownloadSyncPolicyWithPolicyDownloadIntervalInDays__productVersion = v2;

  +[_CDLogging syncChannel](_CDLogging, "syncChannel");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    objc_msgSend((id)objc_opt_class(), "description");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    *(_QWORD *)&buf[4] = v5;
    *(_WORD *)&buf[12] = 2114;
    *(_QWORD *)&buf[14] = possiblyDownloadSyncPolicyWithPolicyDownloadIntervalInDays__productVersion;
    _os_log_impl(&dword_18DDBE000, v4, OS_LOG_TYPE_INFO, "%{public}@: Using productVersion %{public}@ for sync policy downloads", buf, 0x16u);

  }
  if (possiblyDownloadSyncPolicyWithPolicyDownloadIntervalInDays__productVersion
    && !+[_DKCloudUtilities isUnitTesting](_DKCloudUtilities, "isUnitTesting"))
  {
    v7 = a1[4];
    dispatch_get_global_queue(-32768, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v24[0] = MEMORY[0x1E0C809B0];
    v24[1] = 3221225472;
    v24[2] = __77___DKSync2Policy_possiblyDownloadSyncPolicyWithPolicyDownloadIntervalInDays___block_invoke_88;
    v24[3] = &__block_descriptor_40_e5_v8__0l;
    v24[4] = a1[5];
    +[_CDPeriodicSchedulerJob jobWithInterval:schedulerJobName:queue:asynchronousHandler:handler:](_CDPeriodicSchedulerJob, "jobWithInterval:schedulerJobName:queue:asynchronousHandler:handler:", v7, v8, 0, v24, 0.0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = *MEMORY[0x1E0C80898];
    *(_QWORD *)buf = *MEMORY[0x1E0C807A8];
    *(_QWORD *)&buf[8] = v9;
    v10 = *MEMORY[0x1E0C80868];
    *(_QWORD *)&buf[16] = *MEMORY[0x1E0C80878];
    v27 = v10;
    v11 = *MEMORY[0x1E0C808C8];
    v28 = *MEMORY[0x1E0C80738];
    v29 = v11;
    v12 = *MEMORY[0x1E0C80850];
    v30 = *MEMORY[0x1E0C80828];
    v31 = v12;
    v13 = 86400 * a1[6];
    v32 = *MEMORY[0x1E0C808B8];
    values[0] = xpc_int64_create(v13);
    v14 = (void *)MEMORY[0x1E0C81240];
    v15 = MEMORY[0x1E0C81240];
    values[1] = v14;
    values[2] = xpc_string_create((const char *)*MEMORY[0x1E0C80880]);
    v16 = v14;
    values[3] = v14;
    v17 = (void *)MEMORY[0x1E0C81238];
    v18 = MEMORY[0x1E0C81238];
    values[4] = v17;
    v19 = v14;
    values[5] = v14;
    values[6] = xpc_string_create((const char *)*MEMORY[0x1E0C80830]);
    values[7] = xpc_int64_create(5000);
    v20 = v14;
    values[8] = v14;
    v21 = xpc_dictionary_create((const char *const *)buf, values, 9uLL);
    objc_msgSend(v6, "setExecutionCriteria:", v21);

    +[_CDPeriodicScheduler sharedInstance](_CDPeriodicScheduler, "sharedInstance");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "registerJob:", v6);

    for (i = 8; i != -1; --i)
  }
  else
  {
    +[_CDPeriodicScheduler sharedInstance](_CDPeriodicScheduler, "sharedInstance");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "unregisterJob:", a1[4]);
  }

}

void __77___DKSync2Policy_possiblyDownloadSyncPolicyWithPolicyDownloadIntervalInDays___block_invoke_88()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  __CFString *v6;
  NSObject *v7;
  void *v8;
  NSObject *v9;

  +[_DKSync2Policy userDefaults]();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "objectForKey:", CFSTR("CloudSyncPoliciesLastModified"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  v2 = (void *)objc_opt_new();
  v3 = (void *)objc_opt_new();
  +[_CDServerRequest addHTTPIfModifiedSinceToHeaders:date:]((uint64_t)_CDServerRequest, v3, v1);
  objc_msgSend(CFSTR("https://configuration.apple.com/configurations/internetservices/cloudkit/knowledgestore/com.apple.coreduet.knowledge.syncPolicies2.ios.plist"), "pathComponents");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "mutableCopy");

  if ((unint64_t)objc_msgSend(v5, "count") < 3)
  {
    +[_CDLogging syncChannel](_CDLogging, "syncChannel");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __77___DKSync2Policy_possiblyDownloadSyncPolicyWithPolicyDownloadIntervalInDays___block_invoke_88_cold_2();

    v6 = CFSTR("https://configuration.apple.com/configurations/internetservices/cloudkit/knowledgestore/com.apple.coreduet.knowledge.syncPolicies2.ios.plist");
  }
  else
  {
    objc_msgSend(v5, "insertObject:atIndex:", possiblyDownloadSyncPolicyWithPolicyDownloadIntervalInDays__productVersion, objc_msgSend(v5, "count") - 1);
    objc_msgSend(MEMORY[0x1E0CB3940], "pathWithComponents:", v5);
    v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  -[_CDServerRequest startDataTaskWithURI:headers:timeoutInterval:responseHandler:](v2, (uint64_t)v6, v3, &__block_literal_global_92, 10.0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[_CDLogging syncChannel](_CDLogging, "syncChannel");
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    __77___DKSync2Policy_possiblyDownloadSyncPolicyWithPolicyDownloadIntervalInDays___block_invoke_88_cold_1();

}

void __77___DKSync2Policy_possiblyDownloadSyncPolicyWithPolicyDownloadIntervalInDays___block_invoke_90(uint64_t a1, uint64_t a2, void *a3, void *a4, void *a5)
{
  +[_DKSync2Policy handleDownloadSyncPolicyResponse:data:error:]((uint64_t)_DKSync2Policy, a3, a4, a5);
}

void __77___DKSync2Policy_possiblyDownloadSyncPolicyWithPolicyDownloadIntervalInDays___block_invoke_88_cold_1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  OUTLINED_FUNCTION_8_1();
  objc_msgSend((id)OUTLINED_FUNCTION_13(), "description");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_6_1();
  OUTLINED_FUNCTION_9(&dword_18DDBE000, v1, v2, "%{public}@: Started session data task: %@", v3, v4, v5, v6, v7);

  OUTLINED_FUNCTION_7();
}

void __77___DKSync2Policy_possiblyDownloadSyncPolicyWithPolicyDownloadIntervalInDays___block_invoke_88_cold_2()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  objc_msgSend((id)OUTLINED_FUNCTION_13(), "description");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4_1(&dword_18DDBE000, v1, v2, "%{public}@: Unable to parse URL: %@", v3, v4, v5, v6, 2u);

  OUTLINED_FUNCTION_1();
}

@end
