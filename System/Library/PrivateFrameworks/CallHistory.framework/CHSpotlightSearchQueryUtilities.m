@implementation CHSpotlightSearchQueryUtilities

+ (id)searchStringForCallsMatchingHandles:(id)a3 orContactIdentifier:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  __CFString *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  __CFString *v19;
  void *v20;
  id v22;
  id v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  if (objc_msgSend(v6, "length"))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@=='*%@*'c"), *MEMORY[0x1E0CA67C8], v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "stringByAppendingString:", CFSTR(" || "));
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@=='*%@*'c"), *MEMORY[0x1E0CA6028], v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "stringByAppendingString:", v9);
    v10 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v10 = &stru_1E6747850;
  }
  if (objc_msgSend(v5, "count"))
  {
    v22 = v6;
    v23 = v5;
    v26 = 0u;
    v27 = 0u;
    v24 = 0u;
    v25 = 0u;
    v11 = v5;
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v25;
      v15 = *MEMORY[0x1E0CA6528];
      do
      {
        v16 = 0;
        do
        {
          if (*(_QWORD *)v25 != v14)
            objc_enumerationMutation(v11);
          v17 = *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * v16);
          if (-[__CFString length](v10, "length"))
          {
            -[__CFString stringByAppendingString:](v10, "stringByAppendingString:", CFSTR(" || "));
            v18 = objc_claimAutoreleasedReturnValue();

            v10 = (__CFString *)v18;
          }
          v19 = v10;
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@=='*%@*'c"), v15, v17);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          -[__CFString stringByAppendingString:](v10, "stringByAppendingString:", v20);
          v10 = (__CFString *)objc_claimAutoreleasedReturnValue();

          ++v16;
        }
        while (v13 != v16);
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
      }
      while (v13);
    }

    v6 = v22;
    v5 = v23;
  }

  return v10;
}

+ (NSString)searchStringForFacetimeAudioCalls
{
  return (NSString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@==%@ && %@==%@"), *MEMORY[0x1E0CA6578], CFSTR("FaceTime"), *MEMORY[0x1E0CA6568], CFSTR("Audio"));
}

+ (NSString)searchStringForFacetimeVideoCalls
{
  return (NSString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@==%@ && %@==%@"), *MEMORY[0x1E0CA6578], CFSTR("FaceTime"), *MEMORY[0x1E0CA6568], CFSTR("Video"));
}

+ (id)searchQueryWithSearchString:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = (void *)objc_opt_new();
  v11[0] = CFSTR("com.apple.mobilephone");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBundleIDs:", v5);

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ == %@"), *MEMORY[0x1E0CA60F8], CFSTR("kSpotlightItemTypeCall"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v10, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setFilterQueries:", v7);

  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CA6B28]), "initWithQueryString:queryContext:", v3, v4);
  return v8;
}

+ (id)lastFourDigitsFrom:(int64_t)a3
{
  void *v3;
  unint64_t v4;
  id v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%lld"), a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "length");
  if (v4 < 5)
  {
    v5 = v3;
  }
  else
  {
    objc_msgSend(v3, "substringFromIndex:", v4 - 4);
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;

  return v6;
}

+ (BOOL)shouldReindexCallsDueToVersionMismatch
{
  void *v2;
  uint64_t v3;
  NSObject *v4;
  int v6;
  uint64_t v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "userDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "integerForKey:", CFSTR("kCHSpotlightIndexVersion"));
  ch_framework_log();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 134218240;
    v7 = v3;
    v8 = 2048;
    v9 = 9;
    _os_log_impl(&dword_1B3FA4000, v4, OS_LOG_TYPE_DEFAULT, "Current spotlight index version for calls: %ld, expected index version: %ld", (uint8_t *)&v6, 0x16u);
  }

  return v3 != 9;
}

+ (BOOL)shouldReindexCallsDueToDeferredReindexing
{
  return objc_msgSend(a1, "callsDeferredReindexingReason") != 0;
}

+ (unint64_t)callsDeferredReindexingReason
{
  void *v2;
  unint64_t v3;
  NSObject *v4;
  int v6;
  unint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "userDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "integerForKey:", CFSTR("CHSpotlightReindexingReasonKey"));
  ch_framework_log();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 134217984;
    v7 = v3;
    _os_log_impl(&dword_1B3FA4000, v4, OS_LOG_TYPE_DEFAULT, "CHSpotlightSearchQueryUtilities: callsDeferredReindexingReason: %ld", (uint8_t *)&v6, 0xCu);
  }

  return v3;
}

+ (void)setCallsNeedsDeferredReindexingForReason:(unint64_t)a3
{
  void *v5;
  uint64_t v6;
  NSObject *v7;
  void *v8;
  int v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "userDefaults");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "integerForKey:", CFSTR("CHSpotlightReindexingReasonKey"));
  if ((v6 & a3) == 0)
  {
    objc_msgSend(v5, "setInteger:forKey:", v6 | a3, CFSTR("CHSpotlightReindexingReasonKey"));
    objc_msgSend(a1, "logEventReindexingRequestedForReason:", a3);
    ch_framework_log();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = 138412290;
      v10 = v8;
      _os_log_impl(&dword_1B3FA4000, v7, OS_LOG_TYPE_DEFAULT, "CHSpotlightSearchQueryUtilities: setNeedsDeferredReindexingForReason:%@", (uint8_t *)&v9, 0xCu);

    }
  }

}

+ (void)logEventReindexingRequestedForReason:(unint64_t)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  id v14;
  void *v15;
  _QWORD v16[2];
  _QWORD v17[3];

  v17[2] = *MEMORY[0x1E0C80C00];
  v16[0] = CFSTR("spotlightReindexingDataSource");
  v16[1] = CFSTR("spotlightReindexingReason");
  v17[0] = &unk_1E6756130;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v17[1] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v17, v16, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "mutableCopy");

  objc_msgSend(a1, "userDefaults");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKey:", CFSTR("CHLastReindexCompletionDate"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "components:fromDate:toDate:options:", 32, v8, v10, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "hour");

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v13, CFSTR("spotlightReindexingLastReindexTimeDelta"));

  }
  v15 = v6;
  v14 = v6;
  AnalyticsSendEventLazy();

}

id __72__CHSpotlightSearchQueryUtilities_logEventReindexingRequestedForReason___block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

+ (void)logEventReindexingFinishedForReason:(unint64_t)a3 timeTaken:(double)a4
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  id v17;
  void *v18;
  _QWORD v19[3];
  _QWORD v20[4];

  v20[3] = *MEMORY[0x1E0C80C00];
  v20[0] = &unk_1E6756130;
  v19[0] = CFSTR("spotlightReindexingDataSource");
  v19[1] = CFSTR("spotlightReindexingReason");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v20[1] = v6;
  v19[2] = CFSTR("spotlightReindexingLatency");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v20[2] = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, v19, 3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v8, "mutableCopy");

  objc_msgSend(a1, "userDefaults");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKey:", CFSTR("CHLastReindexCompletionDate"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "components:fromDate:toDate:options:", 32, v11, v13, 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "hour");

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v16, CFSTR("spotlightReindexingLastReindexTimeDelta"));

  }
  v18 = v9;
  v17 = v9;
  AnalyticsSendEventLazy();

}

id __81__CHSpotlightSearchQueryUtilities_logEventReindexingFinishedForReason_timeTaken___block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

+ (id)userDefaults
{
  if (userDefaults_onceToken != -1)
    dispatch_once(&userDefaults_onceToken, &__block_literal_global_1);
  return (id)userDefaults_sUserDefaults;
}

void __47__CHSpotlightSearchQueryUtilities_userDefaults__block_invoke()
{
  void *v0;
  void *v1;
  int v2;
  uint64_t v3;
  void *v4;
  __CFString *v5;

  v5 = kSyncHelperServiceIdentifier;
  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "bundleIdentifier");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "isEqualToString:", v5);

  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    v3 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99EA0]), "initWithSuiteName:", v5);
  }
  v4 = (void *)userDefaults_sUserDefaults;
  userDefaults_sUserDefaults = v3;

}

@end
