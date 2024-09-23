@implementation ATXLaunchAndLocationFilterer

+ (BOOL)locationIsStaleOrNotAccurateEnough:(id)a3 now:(id)a4
{
  id v5;
  id v6;
  void *v7;
  double v8;
  double v9;
  NSObject *v10;
  const char *v11;
  double v12;
  double v13;
  BOOL v14;
  int v16;
  double v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  objc_msgSend(v5, "timestamp");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "timeIntervalSinceDate:", v7);
  v9 = v8;

  if (v9 <= 100.0)
  {
    objc_msgSend(v5, "horizontalAccuracy");
    if (v12 <= 100.0)
    {
      v14 = 0;
      goto LABEL_10;
    }
    __atxlog_handle_hero();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v5, "horizontalAccuracy");
      v16 = 134217984;
      v17 = v13;
      v11 = ": Location uncertainty too large, horizontalAccuracy, %f. Ignoring.";
      goto LABEL_7;
    }
  }
  else
  {
    __atxlog_handle_hero();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v16 = 134217984;
      v17 = v9;
      v11 = ": Location is stale. Age: %f. Ignoring.";
LABEL_7:
      _os_log_impl(&dword_1C9A3B000, v10, OS_LOG_TYPE_DEFAULT, v11, (uint8_t *)&v16, 0xCu);
    }
  }

  v14 = 1;
LABEL_10:

  return v14;
}

+ (BOOL)appBundleIdIsBlacklisted:(id)a3 blacklist:(id)a4
{
  id v5;
  int v6;
  NSObject *v7;
  int v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = objc_msgSend(a4, "containsObject:", v5);
  if (v6)
  {
    __atxlog_handle_hero();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v9 = 138412290;
      v10 = v5;
      _os_log_impl(&dword_1C9A3B000, v7, OS_LOG_TYPE_DEFAULT, ": Bundle Id is blacklisted. Bundle Id: %@. Ignoring.", (uint8_t *)&v9, 0xCu);
    }

  }
  return v6;
}

+ (BOOL)genreIdIsBlacklistedGivenAppBundleId:(id)a3 blacklist:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  NSObject *v9;
  NSObject *v10;
  BOOL v11;
  int v13;
  void *v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  +[_ATXAppInfoManager sharedInstance](_ATXAppInfoManager, "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "genreIdForBundleId:", v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  __atxlog_handle_hero();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v13 = 138412546;
    v14 = v8;
    v15 = 2112;
    v16 = v5;
    _os_log_impl(&dword_1C9A3B000, v9, OS_LOG_TYPE_DEFAULT, "GenreId: %@, BundleId: %@.", (uint8_t *)&v13, 0x16u);
  }

  if (v8 && !objc_msgSend(v6, "containsObject:", v8))
  {
    v11 = 0;
  }
  else
  {
    __atxlog_handle_hero();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v13 = 138412290;
      v14 = v8;
      _os_log_impl(&dword_1C9A3B000, v10, OS_LOG_TYPE_DEFAULT, ": Genre Id is blacklisted. Genre Id: %@. Ignoring.", (uint8_t *)&v13, 0xCu);
    }

    v11 = 1;
  }

  return v11;
}

+ (BOOL)shouldSampleWithCounterKey:(id)a3 date:(id)a4 samplingRate:(double)a5 maxSamples:(unint64_t)a6
{
  id v10;
  objc_class *v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  unint64_t v17;
  void *v18;
  BOOL v19;
  void *v20;
  void *v21;
  int v22;
  BOOL v23;
  BOOL v24;
  NSObject *v25;
  const char *v26;
  NSObject *v27;
  BOOL v29;
  int v31;
  double v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v10 = a4;
  v11 = (objc_class *)MEMORY[0x1E0C99EA0];
  v12 = a3;
  v13 = [v11 alloc];
  v14 = (void *)objc_msgSend(v13, "initWithSuiteName:", *MEMORY[0x1E0CF9510]);
  objc_msgSend(v12, "stringByAppendingString:", CFSTR(".date"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "stringByAppendingString:", CFSTR(".dailySamplesCount"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = objc_msgSend(v14, "integerForKey:", v16);
  objc_msgSend(v14, "stringForKey:", v15);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (v18)
    v19 = 1;
  else
    v19 = v17 == 0;
  if (v19)
  {
    objc_msgSend(a1, "_formattedStringForDate:", v10);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = v20;
    if (v18)
    {
      v22 = objc_msgSend(v20, "isEqualToString:", v18);
      v23 = +[_ATXAggregateLogger yesWithProbability:](_ATXAggregateLogger, "yesWithProbability:", a5);
      if (v22)
        v24 = v17 >= a6;
      else
        v24 = 0;
      if (v24)
      {
        __atxlog_handle_hero();
        v25 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
        {
          v31 = 134217984;
          v32 = *(double *)&v17;
          v26 = ": Already reached per device max daily samples: %lu. Ignoring.";
          goto LABEL_21;
        }
LABEL_22:

        v29 = 0;
        goto LABEL_23;
      }
      if (!v23)
      {
LABEL_12:
        __atxlog_handle_hero();
        v25 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
        {
          v31 = 134217984;
          v32 = a5;
          v26 = ": Did not pass sampling. Sampling rate: %f. Ignoring.";
LABEL_21:
          _os_log_impl(&dword_1C9A3B000, v25, OS_LOG_TYPE_DEFAULT, v26, (uint8_t *)&v31, 0xCu);
          goto LABEL_22;
        }
        goto LABEL_22;
      }
    }
    else if (!+[_ATXAggregateLogger yesWithProbability:](_ATXAggregateLogger, "yesWithProbability:", a5))
    {
      goto LABEL_12;
    }
    v29 = 1;
LABEL_23:

    goto LABEL_24;
  }
  __atxlog_handle_default();
  v27 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    +[ATXLaunchAndLocationFilterer shouldSampleWithCounterKey:date:samplingRate:maxSamples:].cold.1(v27);

  objc_msgSend(v14, "setInteger:forKey:", 0, v16);
  v29 = 0;
LABEL_24:

  return v29;
}

+ (void)incrementOnDeviceDailySamplesWithCounterKey:(id)a3 date:(id)a4
{
  objc_class *v6;
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  NSObject *v16;
  const char *v17;
  NSObject *v18;
  uint32_t v19;
  int v20;
  uint64_t v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v6 = (objc_class *)MEMORY[0x1E0C99EA0];
  v7 = a4;
  v8 = a3;
  v9 = [v6 alloc];
  v10 = (void *)objc_msgSend(v9, "initWithSuiteName:", *MEMORY[0x1E0CF9510]);
  objc_msgSend(v8, "stringByAppendingString:", CFSTR(".date"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringByAppendingString:", CFSTR(".dailySamplesCount"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "stringForKey:", v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_formattedStringForDate:", v7);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13 && objc_msgSend(v14, "isEqualToString:", v13))
  {
    v15 = objc_msgSend(v10, "integerForKey:", v12) + 1;
    objc_msgSend(v10, "setInteger:forKey:", v15, v12);
    __atxlog_handle_hero();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      v20 = 134217984;
      v21 = v15;
      v17 = ": Increased daily sample count to: %lu";
      v18 = v16;
      v19 = 12;
LABEL_7:
      _os_log_impl(&dword_1C9A3B000, v18, OS_LOG_TYPE_DEFAULT, v17, (uint8_t *)&v20, v19);
    }
  }
  else
  {
    objc_msgSend(v10, "setInteger:forKey:", 1, v12);
    objc_msgSend(v10, "setObject:forKey:", v14, v11);
    __atxlog_handle_hero();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v20) = 0;
      v17 = ": Received first sample of the day. Set daily sample count to 1.";
      v18 = v16;
      v19 = 2;
      goto LABEL_7;
    }
  }

}

+ (id)_formattedStringForDate:(id)a3
{
  objc_class *v3;
  id v4;
  id v5;
  void *v6;

  v3 = (objc_class *)MEMORY[0x1E0CB3578];
  v4 = a3;
  v5 = objc_alloc_init(v3);
  objc_msgSend(v5, "setDateFormat:", CFSTR("yyyy-MM-dd"));
  objc_msgSend(v5, "stringFromDate:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (void)shouldSampleWithCounterKey:(os_log_t)log date:samplingRate:maxSamples:.cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1C9A3B000, log, OS_LOG_TYPE_ERROR, "HERO: There's no date stored, but daily sample count is greater than 0. Setting daily count to 0", v1, 2u);
}

@end
