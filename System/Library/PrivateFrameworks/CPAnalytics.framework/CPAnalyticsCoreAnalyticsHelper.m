@implementation CPAnalyticsCoreAnalyticsHelper

+ (void)sendCoreAnalyticsEvent:(id)a3 withPayload:(id)a4 shouldSanitize:(BOOL)a5
{
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;
  BOOL v13;

  v8 = a4;
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __84__CPAnalyticsCoreAnalyticsHelper_sendCoreAnalyticsEvent_withPayload_shouldSanitize___block_invoke;
  v10[3] = &unk_24C36EAC8;
  v13 = a5;
  v11 = v8;
  v12 = a1;
  v9 = v8;
  objc_msgSend(a1, "analyticsSendEventLazy:payload:", a3, v10);

}

+ (void)analyticsSendEventLazy:(id)a3 payload:(id)a4
{
  AnalyticsSendEventLazy();
}

+ (id)caCompatiblePayloadKey:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x24BDD14A8];
  v4 = a3;
  objc_msgSend(v3, "alphanumericCharacterSet");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "invertedSet");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "componentsSeparatedByCharactersInSet:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "componentsJoinedByString:", CFSTR("_"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (BOOL)isValidCoreAnalyticsValueType:(id)a3
{
  id v3;
  char isKindOfClass;

  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    isKindOfClass = 1;
  }
  else
  {
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();
  }

  return isKindOfClass & 1;
}

+ (id)buildCACompatiblePayload:(id)a3
{
  objc_class *v4;
  id v5;
  id v6;
  id v7;
  _QWORD v9[4];
  id v10;
  id v11;

  v4 = (objc_class *)MEMORY[0x24BDBCED8];
  v5 = a3;
  v6 = objc_alloc_init(v4);
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __59__CPAnalyticsCoreAnalyticsHelper_buildCACompatiblePayload___block_invoke;
  v9[3] = &unk_24C36EAF0;
  v11 = a1;
  v7 = v6;
  v10 = v7;
  objc_msgSend(v5, "enumerateKeysAndObjectsUsingBlock:", v9);

  return v7;
}

void __59__CPAnalyticsCoreAnalyticsHelper_buildCACompatiblePayload___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  int v9;
  uint64_t v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  if ((objc_msgSend(*(id *)(a1 + 40), "isValidCoreAnalyticsValueType:", v6) & 1) != 0)
  {
    +[CPAnalyticsCoreAnalyticsHelper caCompatiblePayloadKey:](CPAnalyticsCoreAnalyticsHelper, "caCompatiblePayloadKey:", v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKey:", v6, v7);

  }
  else
  {
    CPAnalyticsLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      v9 = 138543618;
      v10 = objc_opt_class();
      v11 = 2114;
      v12 = v5;
      _os_log_impl(&dword_20AB22000, v8, OS_LOG_TYPE_INFO, "[CPAnalyticsCoreAnalyticsHelper] Dropping payload with unsupported value class:%{public}@, key:%{public}@", (uint8_t *)&v9, 0x16u);
    }

  }
}

id __84__CPAnalyticsCoreAnalyticsHelper_sendCoreAnalyticsEvent_withPayload_shouldSanitize___block_invoke(uint64_t a1)
{
  id v1;

  if (*(_BYTE *)(a1 + 48))
  {
    objc_msgSend(*(id *)(a1 + 40), "buildCACompatiblePayload:", *(_QWORD *)(a1 + 32));
    v1 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v1 = *(id *)(a1 + 32);
  }
  return v1;
}

@end
