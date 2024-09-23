@implementation ATXBatteryDrainBehavior

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_1 != -1)
    dispatch_once(&sharedInstance_onceToken_1, &__block_literal_global_60);
  return (id)sharedInstance_predictor;
}

void __41__ATXBatteryDrainBehavior_sharedInstance__block_invoke()
{
  ATXBatteryDrainBehavior *v0;
  void *v1;

  v0 = objc_alloc_init(ATXBatteryDrainBehavior);
  v1 = (void *)sharedInstance_predictor;
  sharedInstance_predictor = (uint64_t)v0;

}

- (NSDate)lastCachedDate
{
  id v2;
  void *v3;
  void *v4;

  v2 = objc_alloc(MEMORY[0x1E0C99EA0]);
  v3 = (void *)objc_msgSend(v2, "initWithSuiteName:", *MEMORY[0x1E0CF9510]);
  objc_msgSend(v3, "objectForKey:", CFSTR("lastCachedDrainBehaviorDate"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDate *)v4;
}

- (void)setLastCachedDate:(id)a3
{
  objc_class *v3;
  id v4;
  id v5;
  id v6;

  v3 = (objc_class *)MEMORY[0x1E0C99EA0];
  v4 = a3;
  v5 = [v3 alloc];
  v6 = (id)objc_msgSend(v5, "initWithSuiteName:", *MEMORY[0x1E0CF9510]);
  objc_msgSend(v6, "setObject:forKey:", v4, CFSTR("lastCachedDrainBehaviorDate"));

}

- (unint64_t)lastCachedClassification
{
  id v2;
  void *v3;
  unint64_t v4;

  v2 = objc_alloc(MEMORY[0x1E0C99EA0]);
  v3 = (void *)objc_msgSend(v2, "initWithSuiteName:", *MEMORY[0x1E0CF9510]);
  v4 = objc_msgSend(v3, "integerForKey:", CFSTR("lastCachedDrainBehaviorClassification"));

  return v4;
}

- (void)setLastCachedClassification:(unint64_t)a3
{
  id v4;
  id v5;

  v4 = objc_alloc(MEMORY[0x1E0C99EA0]);
  v5 = (id)objc_msgSend(v4, "initWithSuiteName:", *MEMORY[0x1E0CF9510]);
  objc_msgSend(v5, "setInteger:forKey:", a3, CFSTR("lastCachedDrainBehaviorClassification"));

}

- (unint64_t)fetchADBLDrainClassification
{
  ATXBatteryDrainBehavior *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  unint64_t v6;
  void *v7;
  int v8;
  NSObject *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  NSObject *v14;
  NSObject *v15;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t v20;
  __int128 buf;
  Class (*v22)(uint64_t);
  void *v23;
  uint64_t *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v2 = self;
  objc_sync_enter(v2);
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXBatteryDrainBehavior lastCachedDate](v2, "lastCachedDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[ATXBatteryDrainBehavior lastCachedClassification](v2, "lastCachedClassification");
  if (v4
    && (v6 = v5,
        objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar"),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        v8 = objc_msgSend(v7, "isDate:inSameDayAsDate:", v4, v3),
        v7,
        v8))
  {
    __atxlog_handle_default();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf) = 134217984;
      *(_QWORD *)((char *)&buf + 4) = v6;
      _os_log_impl(&dword_1A49EF000, v9, OS_LOG_TYPE_DEFAULT, "ATXBatteryDrainBehavior: returning cached drain classification: %lu", (uint8_t *)&buf, 0xCu);
    }

  }
  else
  {
    v10 = (void *)MEMORY[0x1A85A4F90](v5);
    v17 = 0;
    v18 = &v17;
    v19 = 0x2050000000;
    v11 = (void *)get_OSBatteryDrainPredictorClass_softClass;
    v20 = get_OSBatteryDrainPredictorClass_softClass;
    if (!get_OSBatteryDrainPredictorClass_softClass)
    {
      *(_QWORD *)&buf = MEMORY[0x1E0C809B0];
      *((_QWORD *)&buf + 1) = 3221225472;
      v22 = __get_OSBatteryDrainPredictorClass_block_invoke;
      v23 = &unk_1E4D570B8;
      v24 = &v17;
      __get_OSBatteryDrainPredictorClass_block_invoke((uint64_t)&buf);
      v11 = (void *)v18[3];
    }
    v12 = objc_retainAutorelease(v11);
    _Block_object_dispose(&v17, 8);
    objc_msgSend(v12, "predictor", v17);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v13, "historicalClassification");
    if (v6 >= 4)
    {
      __atxlog_handle_default();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
        -[ATXBatteryDrainBehavior fetchADBLDrainClassification].cold.1(v6, v14);

      v6 = 0;
    }
    __atxlog_handle_default();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf) = 134217984;
      *(_QWORD *)((char *)&buf + 4) = v6;
      _os_log_impl(&dword_1A49EF000, v15, OS_LOG_TYPE_DEFAULT, "ATXBatteryDrainBehavior: drain classification: %lu", (uint8_t *)&buf, 0xCu);
    }

    -[ATXBatteryDrainBehavior setLastCachedDate:](v2, "setLastCachedDate:", v3);
    -[ATXBatteryDrainBehavior setLastCachedClassification:](v2, "setLastCachedClassification:", v6);

    objc_autoreleasePoolPop(v10);
  }

  objc_sync_exit(v2);
  return v6;
}

- (void)fetchADBLDrainClassification
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 134217984;
  v3 = a1;
  _os_log_fault_impl(&dword_1A49EF000, a2, OS_LOG_TYPE_FAULT, "Unknown drain behavior: %lu", (uint8_t *)&v2, 0xCu);
}

@end
