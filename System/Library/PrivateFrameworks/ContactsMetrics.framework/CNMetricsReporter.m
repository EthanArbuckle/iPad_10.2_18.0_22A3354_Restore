@implementation CNMetricsReporter

- (void)sendDictionary:(id)a3 forEvent:(id)a4 andLog:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  id v9;
  void *v10;
  id v11;
  NSObject *v12;
  uint8_t buf[4];
  id v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v5 = a5;
  v17 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  -[CNMetricsReporter compoundKeyForEvent:](self, "compoundKeyForEvent:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v8;
  AnalyticsSendEventLazy();

  if (v5)
  {
    objc_msgSend((id)objc_opt_class(), "log");
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      v14 = v9;
      v15 = 2112;
      v16 = v11;
      _os_log_impl(&dword_1D419E000, v12, OS_LOG_TYPE_INFO, "CNMetrics Collected for %@ (%@)", buf, 0x16u);
    }

  }
}

- (id)compoundKeyForEvent:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[CNMetricsReporter eventKeyPrefix](self, "eventKeyPrefix");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringByAppendingString:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)log
{
  if (log_cn_once_token_1 != -1)
    dispatch_once(&log_cn_once_token_1, &__block_literal_global_0);
  return (id)log_cn_once_object_1;
}

void __24__CNMetricsReporter_log__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.contacts", "metrics-reporter");
  v1 = (void *)log_cn_once_object_1;
  log_cn_once_object_1 = (uint64_t)v0;

}

+ (void)sendDictionary:(id)a3 forEvent:(id)a4
{
  objc_msgSend(a1, "sendDictionary:forEvent:andLog:", a3, a4, 0);
}

+ (void)sendDictionary:(id)a3 forEvent:(id)a4 andLog:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  id v10;

  v5 = a5;
  v8 = a4;
  v9 = a3;
  v10 = objc_alloc_init((Class)a1);
  objc_msgSend(v10, "sendDictionary:forEvent:andLog:", v9, v8, v5);

}

id __52__CNMetricsReporter_sendDictionary_forEvent_andLog___block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

- (void)logSimpleEvent:(id)a3 forApplication:(id)a4 andLog:(BOOL)a5
{
  _BOOL8 v5;
  objc_class *v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  const __CFString *v14;
  _QWORD v15[2];

  v5 = a5;
  v15[1] = *MEMORY[0x1E0C80C00];
  v8 = (objc_class *)MEMORY[0x1E0C99E08];
  v9 = a4;
  v10 = a3;
  v11 = [v8 alloc];
  v14 = CFSTR("application");
  v15[0] = v9;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, &v14, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = (void *)objc_msgSend(v11, "initWithDictionary:", v12);
  -[CNMetricsReporter sendDictionary:forEvent:andLog:](self, "sendDictionary:forEvent:andLog:", v13, v10, v5);

}

- (id)eventKeyPrefix
{
  return &stru_1E977E408;
}

+ (void)logDatabaseResolution:(id)a3
{
  objc_class *v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  const __CFString *v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  v4 = (objc_class *)MEMORY[0x1E0C99E08];
  v5 = a3;
  v6 = [v4 alloc];
  v9 = CFSTR("resolution");
  v10[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, &v9, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = (void *)objc_msgSend(v6, "initWithDictionary:", v7);
  objc_msgSend(a1, "sendDictionary:forEvent:", v8, CFSTR("com.apple.contacts.databaseIntegrity"));

}

@end
