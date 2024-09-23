@implementation _ATXAppDailyDose

- (void)stopAppUsageAtDate:(id)a3
{
  id v5;
  void *v6;
  id v7;

  v5 = a3;
  v7 = v5;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_ATXAppDailyDose.m"), 344, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("date"));

    v5 = 0;
  }
  -[_ATXAppDailyDose _asyncStopAppUsageAtDate:completion:](self, "_asyncStopAppUsageAtDate:completion:", v5, 0);

}

- (void)_asyncStopAppUsageAtDate:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *queue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __56___ATXAppDailyDose__asyncStopAppUsageAtDate_completion___block_invoke;
  block[3] = &unk_1E82DF8F8;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_sync(queue, block);

}

- (void)_recordAppDurationForApp:(id)a3 withStartTime:(id)a4 andEndTime:(id)a5
{
  NSObject *queue;
  id v9;
  id v10;
  double v11;
  double v12;
  _ATXAppDailyDoseCurrentStore *currentDoseStore;
  void *v14;
  id v15;

  v15 = a3;
  queue = self->_queue;
  v9 = a5;
  v10 = a4;
  dispatch_assert_queue_V2(queue);
  objc_msgSend(v9, "timeIntervalSinceDate:", v10);
  v12 = v11;

  currentDoseStore = self->_currentDoseStore;
  -[_ATXAppDailyDose now](self, "now");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(currentDoseStore) = -[_ATXAppDailyDoseCurrentStore isExpiredAt:](currentDoseStore, "isExpiredAt:", v14);

  if ((_DWORD)currentDoseStore)
    -[_ATXAppDailyDose _backfillAppDurationMapDBForToday](self, "_backfillAppDurationMapDBForToday");
  -[_ATXAppDailyDoseCurrentStore increaseDoseFor:by:](self->_currentDoseStore, "increaseDoseFor:by:", v15, v12);

}

- (id)now
{
  return (id)objc_msgSend(MEMORY[0x1E0C99D68], "date");
}

- (_ATXAppDailyDose)init
{
  void *v3;
  _ATXAppDailyDose *v4;

  v3 = (void *)objc_opt_new();
  v4 = -[_ATXAppDailyDose initWithDuetHelper:](self, "initWithDuetHelper:", v3);

  return v4;
}

- (_ATXAppDailyDose)initWithDuetHelper:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  _ATXAppDailyDose *v12;
  void *v14;
  void *v15;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_ATXAppDailyDose.m"), 147, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("duetHelper"));

  }
  objc_msgSend(MEMORY[0x1E0C99E80], "systemTimeZone");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CF8CF0], "dictionaryWithLegacyPathForClass:", objc_opt_class());
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("SmoothingAlpha"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_ATXAppDailyDose.m"), 151, CFSTR("No alpha parameter for AppDailyDose found in asset"));

  }
  objc_msgSend(v8, "doubleValue");
  v10 = v9;
  -[_ATXAppDailyDose todayWithTimeZone:](self, "todayWithTimeZone:", v6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[_ATXAppDailyDose initWithDuetHelper:timeZone:today:alpha:historicalDosePath:completion:](self, "initWithDuetHelper:timeZone:today:alpha:historicalDosePath:completion:", v5, v6, v11, 0, 0, v10);

  return v12;
}

- (_ATXAppDailyDose)initWithDuetHelper:(id)a3 timeZone:(id)a4 today:(id)a5 alpha:(double)a6 historicalDosePath:(id)a7 completion:(id)a8
{
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  _ATXAppDailyDose *v21;
  _ATXAppDailyDose *v22;
  objc_class *v23;
  id v24;
  const char *v25;
  NSObject *v26;
  dispatch_queue_t v27;
  OS_dispatch_queue *queue;
  _ATXAppDailyDoseCurrentStore *v29;
  void *v30;
  uint64_t v31;
  _ATXAppDailyDoseCurrentStore *currentDoseStore;
  void *v33;
  void *v35;
  _QWORD v36[4];
  _ATXAppDailyDose *v37;
  id v38;
  id v39;
  id v40;
  id v41;
  objc_super v42;

  v16 = a3;
  v17 = a4;
  v18 = a5;
  v19 = a7;
  v20 = a8;
  if (!v16)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_ATXAppDailyDose.m"), 168, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("duetHelper"));

  }
  v42.receiver = self;
  v42.super_class = (Class)_ATXAppDailyDose;
  v21 = -[_ATXAppDailyDose init](&v42, sel_init);
  v22 = v21;
  if (v21)
  {
    objc_storeStrong((id *)&v21->_duetHelper, a3);
    v23 = (objc_class *)objc_opt_class();
    NSStringFromClass(v23);
    v24 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v25 = (const char *)objc_msgSend(v24, "UTF8String");
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v26 = objc_claimAutoreleasedReturnValue();
    v27 = dispatch_queue_create(v25, v26);
    queue = v22->_queue;
    v22->_queue = (OS_dispatch_queue *)v27;

    v29 = [_ATXAppDailyDoseCurrentStore alloc];
    +[_ATXAppDailyDose _defaultCurrentDosePath](_ATXAppDailyDose, "_defaultCurrentDosePath");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = -[_ATXAppDailyDoseCurrentStore initWithPath:](v29, "initWithPath:", v30);
    currentDoseStore = v22->_currentDoseStore;
    v22->_currentDoseStore = (_ATXAppDailyDoseCurrentStore *)v31;

    v22->_alpha = a6;
    v33 = (void *)MEMORY[0x1E0D81590];
    v36[0] = MEMORY[0x1E0C809B0];
    v36[1] = 3221225472;
    v36[2] = __90___ATXAppDailyDose_initWithDuetHelper_timeZone_today_alpha_historicalDosePath_completion___block_invoke;
    v36[3] = &unk_1E82DF858;
    v37 = v22;
    v38 = v19;
    v39 = v18;
    v40 = v17;
    v41 = v20;
    objc_msgSend(v33, "runBlockWhenDeviceIsClassCUnlocked:", v36);

  }
  return v22;
}

- (id)currentDoseStore
{
  return self->_currentDoseStore;
}

- (id)getDoseForApp:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  id v7;
  _QWORD block[5];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__32;
  v16 = __Block_byref_object_dispose__32;
  v17 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __34___ATXAppDailyDose_getDoseForApp___block_invoke;
  block[3] = &unk_1E82DF880;
  v10 = v4;
  v11 = &v12;
  block[4] = self;
  v6 = v4;
  dispatch_sync(queue, block);
  v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

- (double)getCurrentDoseForApp:(id)a3
{
  id v4;
  void *v5;
  NSObject *queue;
  double v7;
  _QWORD block[5];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  double *v13;
  uint64_t v14;
  uint64_t v15;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v12 = 0;
    v13 = (double *)&v12;
    v14 = 0x2020000000;
    v15 = 0;
    queue = self->_queue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __41___ATXAppDailyDose_getCurrentDoseForApp___block_invoke;
    block[3] = &unk_1E82DF880;
    v11 = &v12;
    block[4] = self;
    v10 = v4;
    dispatch_sync(queue, block);
    v7 = v13[3];

    _Block_object_dispose(&v12, 8);
  }
  else
  {
    v7 = 0.0;
  }

  return v7;
}

- (id)todayWithTimeZone:(id)a3
{
  return +[ATXTimeUtil todayWithTimeZone:](ATXTimeUtil, "todayWithTimeZone:", a3);
}

- (void)train
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __25___ATXAppDailyDose_train__block_invoke;
  block[3] = &unk_1E82DAC38;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)_doTrainingOn:(id)a3 timeZone:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  os_signpost_id_t v12;
  NSObject *v13;
  NSObject *v14;
  void *v15;
  NSObject *v16;
  NSObject *v17;
  NSObject *v18;
  id v19;
  id v20;
  id v21;
  id v22;
  _QWORD v23[5];
  id v24;
  id v25;
  id v26;
  id v27;
  os_signpost_id_t v28;
  uint8_t buf[4];
  const char *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  __atxlog_handle_default();
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = os_signpost_id_generate(v11);

  __atxlog_handle_default();
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
  {
    *(_DWORD *)buf = 136446210;
    v30 = "_ATXAppDailyDose";
    _os_signpost_emit_with_name_impl(&dword_1C9A3B000, v14, OS_SIGNPOST_INTERVAL_BEGIN, v12, "Train", "Component=%{public,signpost.telemetry:string1}s  enableTelemetry=YES ", buf, 0xCu);
  }

  v15 = (void *)os_transaction_create();
  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v16 = objc_claimAutoreleasedReturnValue();
  dispatch_queue_attr_make_with_qos_class(v16, QOS_CLASS_BACKGROUND, 0);
  v17 = objc_claimAutoreleasedReturnValue();

  v18 = dispatch_queue_create("ATXAppDailyDose-train", v17);
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __54___ATXAppDailyDose__doTrainingOn_timeZone_completion___block_invoke;
  v23[3] = &unk_1E82DF8D0;
  v23[4] = self;
  v24 = v8;
  v27 = v10;
  v28 = v12;
  v25 = v9;
  v26 = v15;
  v19 = v15;
  v20 = v10;
  v21 = v9;
  v22 = v8;
  dispatch_async(v18, v23);

}

- (void)addLaunchForBundleId:(id)a3 date:(id)a4 completion:(id)a5
{
  id v9;
  id v10;
  id v11;
  NSObject *queue;
  id v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  _QWORD block[5];
  id v19;
  id v20;
  id v21;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_ATXAppDailyDose.m"), 305, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("bundleId"));

    if (v10)
      goto LABEL_3;
LABEL_5:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_ATXAppDailyDose.m"), 306, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("date"));

    goto LABEL_3;
  }
  if (!v10)
    goto LABEL_5;
LABEL_3:
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __57___ATXAppDailyDose_addLaunchForBundleId_date_completion___block_invoke;
  block[3] = &unk_1E82DF830;
  block[4] = self;
  v19 = v10;
  v20 = v9;
  v21 = v11;
  v13 = v11;
  v14 = v9;
  v15 = v10;
  dispatch_async(queue, block);

}

+ (id)_defaultHistoricalDosePath
{
  return (id)objc_msgSend(MEMORY[0x1E0CF94D8], "appPredictionDirectoryFile:", CFSTR("_ATXAppDailyDose_HistoricalDose"));
}

+ (id)_defaultCurrentDosePath
{
  return (id)objc_msgSend(MEMORY[0x1E0CF94D8], "appPredictionDirectoryFile:", CFSTR("_ATXAppDailyDose_CurrentDose"));
}

+ (void)deleteCurrentDoseFile
{
  void *v3;
  id v4;

  v4 = (id)objc_opt_new();
  objc_msgSend(a1, "_defaultCurrentDosePath");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "writeToFile:atomically:", v3, 0);

}

- (void)_writeHistoricalDoseWithCompletion:(id)a3
{
  id v5;
  void *v6;
  NSDate *duetHistoryTimestamp;
  void *v8;
  void *v9;
  id v10;
  NSObject *v11;
  NSObject *v12;
  NSObject *v13;
  id v14;
  id v15;
  void *v16;
  _QWORD block[4];
  id v18;
  id v19;
  id v20;
  _QWORD v21[3];
  _QWORD v22[4];

  v22[3] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v6 = (void *)MEMORY[0x1CAA48B6C]();
  v21[0] = CFSTR("appAverageDurationMapKey");
  v21[1] = CFSTR("duetHistoryTimestamp");
  duetHistoryTimestamp = self->_duetHistoryTimestamp;
  v22[0] = self->_appHistoricalDoseMap;
  v22[1] = duetHistoryTimestamp;
  v21[2] = CFSTR("modelVersion");
  v22[2] = &unk_1E83CC220;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v22, v21, 3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = 0;
  objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", v8, 1, &v20);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v20;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_ATXAppDailyDose.m"), 401, CFSTR("Archiver error: %@"), v10);

  }
  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v11 = objc_claimAutoreleasedReturnValue();
  dispatch_queue_attr_make_with_qos_class(v11, QOS_CLASS_BACKGROUND, 0);
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = dispatch_queue_create("daily-dose-write", v12);

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __55___ATXAppDailyDose__writeHistoricalDoseWithCompletion___block_invoke;
  block[3] = &unk_1E82DA8E8;
  v18 = v9;
  v14 = v5;
  v19 = v14;
  v15 = v9;
  dispatch_async(v13, block);

  objc_autoreleasePoolPop(v6);
}

- (BOOL)_loadHistoricalDoseFrom:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  NSObject *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  uint64_t v19;
  NSObject *v20;
  void *v21;
  uint64_t v22;
  BOOL v23;
  NSMutableDictionary *v24;
  NSMutableDictionary *appHistoricalDoseMap;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  id v39;
  id v40;

  v4 = a3;
  if (!v4)
  {
    +[_ATXAppDailyDose _defaultHistoricalDosePath](_ATXAppDailyDose, "_defaultHistoricalDosePath");
    v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v5 = (void *)MEMORY[0x1CAA48B6C]();
  v40 = 0;
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithContentsOfFile:options:error:", v4, 0, &v40);
  v7 = v40;
  v8 = v7;
  if (v6)
  {
    v9 = (void *)MEMORY[0x1E0C99E60];
    v10 = objc_opt_class();
    v11 = objc_opt_class();
    v12 = objc_opt_class();
    v13 = objc_opt_class();
    objc_msgSend(v9, "setWithObjects:", v10, v11, v12, v13, objc_opt_class(), 0);
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = (void *)MEMORY[0x1CAA48B6C]();
    v39 = v8;
    objc_msgSend(MEMORY[0x1E0CB3710], "unarchivedObjectOfClasses:fromData:error:", v14, v6, &v39);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v39;

    objc_autoreleasePoolPop(v15);
    if (v16)
    {
      objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("modelVersion"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v18, "integerValue");

      if (v19 < 1)
      {
        v23 = 0;
        goto LABEL_18;
      }
      objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("duetHistoryTimestamp"));
      v20 = objc_claimAutoreleasedReturnValue();
      -[_ATXAppDailyDose now](self, "now");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = -[NSObject compare:](v20, "compare:", v21);

      v23 = v22 != 1;
      if (v22 != 1)
      {
        objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("appAverageDurationMapKey"));
        v24 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
        appHistoricalDoseMap = self->_appHistoricalDoseMap;
        self->_appHistoricalDoseMap = v24;

        objc_storeStrong((id *)&self->_duetHistoryTimestamp, v20);
        v23 = 1;
      }
    }
    else
    {
      __atxlog_handle_default();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_FAULT))
        -[_ATXAppDailyDose _loadHistoricalDoseFrom:].cold.1((uint64_t)v17, v20, v26, v27, v28, v29, v30, v31);
      v23 = 0;
    }

LABEL_18:
LABEL_19:

    v8 = v17;
    goto LABEL_20;
  }
  if (objc_msgSend(v7, "code") != 260)
  {
    __atxlog_handle_default();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
      -[_ATXAppDailyDose _loadHistoricalDoseFrom:].cold.1((uint64_t)v8, v14, v32, v33, v34, v35, v36, v37);
    v23 = 0;
    v17 = v8;
    goto LABEL_19;
  }
  v23 = 0;
LABEL_20:

  objc_autoreleasePoolPop(v5);
  return v23;
}

- (void)_backfillAppDurationMapDBForToday
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  void *v16;
  void *v17;
  double v18;
  double v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v3 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x1E0C99E80], "systemTimeZone");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[_ATXAppDailyDose todayWithTimeZone:](self, "todayWithTimeZone:", v4);
  v5 = objc_claimAutoreleasedReturnValue();

  -[_ATXAppDailyDose now](self, "now");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = (void *)v5;
  -[_ATXDuetHelper getAppLaunchesBetweenStartDate:endDate:](self->_duetHelper, "getAppLaunchesBetweenStartDate:endDate:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v25;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v25 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
        objc_msgSend(v11, "endDate");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "startDate");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "timeIntervalSinceDate:", v13);
        v15 = v14;

        objc_msgSend(v11, "bundleId");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "objectForKeyedSubscript:", v16);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "doubleValue");
        v19 = v18;

        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v15 + v19);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "bundleId");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "setObject:forKeyedSubscript:", v20, v21);

      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    }
    while (v8);
  }
  -[_ATXAppDailyDoseCurrentStore resetWithDurationMap:on:](self->_currentDoseStore, "resetWithDurationMap:on:", v3, v23);

}

- (id)previousBundleId
{
  NSObject *queue;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__32;
  v10 = __Block_byref_object_dispose__32;
  v11 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __36___ATXAppDailyDose_previousBundleId__block_invoke;
  v5[3] = &unk_1E82DC528;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (double)alpha
{
  return self->_alpha;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_previousAppLaunchDate, 0);
  objc_storeStrong((id *)&self->_previousAppId, 0);
  objc_storeStrong((id *)&self->_duetHistoryTimestamp, 0);
  objc_storeStrong((id *)&self->_appHistoricalDoseMap, 0);
  objc_storeStrong((id *)&self->_currentDoseStore, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_duetHelper, 0);
}

- (void)_loadHistoricalDoseFrom:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_5(&dword_1C9A3B000, a2, a3, "Failed to load historical usage: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

@end
