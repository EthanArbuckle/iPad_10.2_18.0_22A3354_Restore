@implementation DKSync3Policy

void __32___DKSync3Policy_disabledPolicy__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)disabledPolicy_policy;
  disabledPolicy_policy = v0;

  if (disabledPolicy_policy)
    *(_BYTE *)(disabledPolicy_policy + 8) = 1;
}

void __77___DKSync3Policy_possiblyDownloadSyncPolicyWithPolicyDownloadIntervalInDays___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  char *v5;
  char *v6;
  char *v7;
  char *v8;
  int64_t v9;
  void *v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  xpc_object_t v17;
  void *v18;
  uint64_t i;
  id v20;
  _QWORD v21[5];
  xpc_object_t values[9];
  char *keys[10];

  keys[9] = *(char **)MEMORY[0x1E0C80C00];
  if (+[_DKCloudUtilities isUnitTesting](_DKCloudUtilities, "isUnitTesting"))
  {
    +[_CDPeriodicScheduler sharedInstance](_CDPeriodicScheduler, "sharedInstance");
    v20 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "unregisterJob:", a1[4]);

  }
  else
  {
    v2 = a1[4];
    dispatch_get_global_queue(-32768, 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __77___DKSync3Policy_possiblyDownloadSyncPolicyWithPolicyDownloadIntervalInDays___block_invoke_2;
    v21[3] = &__block_descriptor_40_e5_v8__0l;
    v21[4] = a1[5];
    +[_CDPeriodicSchedulerJob jobWithInterval:schedulerJobName:queue:asynchronousHandler:handler:](_CDPeriodicSchedulerJob, "jobWithInterval:schedulerJobName:queue:asynchronousHandler:handler:", v2, v3, 0, v21, 0.0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    v5 = (char *)*MEMORY[0x1E0C80898];
    keys[0] = *(char **)MEMORY[0x1E0C807A8];
    keys[1] = v5;
    v6 = (char *)*MEMORY[0x1E0C80868];
    keys[2] = *(char **)MEMORY[0x1E0C80878];
    keys[3] = v6;
    v7 = (char *)*MEMORY[0x1E0C808C8];
    keys[4] = *(char **)MEMORY[0x1E0C80738];
    keys[5] = v7;
    v8 = (char *)*MEMORY[0x1E0C80850];
    keys[6] = *(char **)MEMORY[0x1E0C80828];
    keys[7] = v8;
    v9 = 86400 * a1[6];
    keys[8] = *(char **)MEMORY[0x1E0C808B8];
    values[0] = xpc_int64_create(v9);
    v10 = (void *)MEMORY[0x1E0C81240];
    v11 = MEMORY[0x1E0C81240];
    values[1] = v10;
    values[2] = xpc_string_create((const char *)*MEMORY[0x1E0C80880]);
    v12 = v10;
    values[3] = v10;
    v13 = (void *)MEMORY[0x1E0C81238];
    v14 = MEMORY[0x1E0C81238];
    values[4] = v13;
    v15 = v10;
    values[5] = v10;
    values[6] = xpc_string_create((const char *)*MEMORY[0x1E0C80830]);
    values[7] = xpc_int64_create(5000);
    v16 = v10;
    values[8] = v10;
    v17 = xpc_dictionary_create((const char *const *)keys, values, 9uLL);
    objc_msgSend(v4, "setExecutionCriteria:", v17);

    +[_CDPeriodicScheduler sharedInstance](_CDPeriodicScheduler, "sharedInstance");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "registerJob:", v4);

    for (i = 8; i != -1; --i)
  }
}

void __77___DKSync3Policy_possiblyDownloadSyncPolicyWithPolicyDownloadIntervalInDays___block_invoke_2()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  NSObject *v5;

  +[_DKSync3Policy userDefaults](_DKSync3Policy, "userDefaults");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "objectForKey:", CFSTR("CloudSyncPoliciesLastModified"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  v2 = (void *)objc_opt_new();
  v3 = (void *)objc_opt_new();
  +[_CDServerRequest addHTTPIfModifiedSinceToHeaders:date:]((uint64_t)_CDServerRequest, v3, v1);
  -[_CDServerRequest startDataTaskWithURI:headers:timeoutInterval:responseHandler:](v2, (uint64_t)CFSTR("https://configuration.apple.com/configurations/internetservices/cloudkit/knowledgestore/com.apple.coreduet.knowledge.Sync3Policy.plist"), v3, &__block_literal_global_567, 10.0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[_CDLogging syncChannel](_CDLogging, "syncChannel");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    __77___DKSync3Policy_possiblyDownloadSyncPolicyWithPolicyDownloadIntervalInDays___block_invoke_2_cold_1();

}

uint64_t __77___DKSync3Policy_possiblyDownloadSyncPolicyWithPolicyDownloadIntervalInDays___block_invoke_3()
{
  return +[_DKSync3Policy handleDownloadSyncPolicyResponse:data:error:](_DKSync3Policy, "handleDownloadSyncPolicyResponse:data:error:");
}

void __42___DKSync3Policy_PolicyCache__policyCache__block_invoke()
{
  id v0;
  void *v1;
  id v2;
  void *v3;
  id v4;
  id v5;

  v0 = objc_alloc_init(MEMORY[0x1E0C99D38]);
  v1 = (void *)policyCache_policyCache_0;
  policyCache_policyCache_0 = (uint64_t)v0;

  v2 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v3 = (void *)policyCache_policyCache_0;
  policyCache_policyCache_0 = (uint64_t)v2;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v5, "addObserverForName:object:queue:usingBlock:", CFSTR("_DKSync2CoordinatorDidIdleNotification"), 0, 0, &__block_literal_global_658);

}

uint64_t __42___DKSync3Policy_PolicyCache__policyCache__block_invoke_2()
{
  return +[_DKSyncSerializer performAsyncBlock:](_DKSyncSerializer, "performAsyncBlock:", &__block_literal_global_660);
}

uint64_t __42___DKSync3Policy_PolicyCache__policyCache__block_invoke_3()
{
  return objc_msgSend((id)policyCache_policyCache_0, "removeAllObjects");
}

void __77___DKSync3Policy_possiblyDownloadSyncPolicyWithPolicyDownloadIntervalInDays___block_invoke_2_cold_1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  OUTLINED_FUNCTION_8_1();
  objc_msgSend((id)objc_opt_class(), "description");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_22_0();
  OUTLINED_FUNCTION_9(&dword_18DDBE000, v1, v2, "%{public}@: Started session data task: %@", v3, v4, v5, v6, 2u);

  OUTLINED_FUNCTION_7();
}

@end
