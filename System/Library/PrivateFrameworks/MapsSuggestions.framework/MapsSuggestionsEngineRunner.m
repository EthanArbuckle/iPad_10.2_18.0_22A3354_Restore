@implementation MapsSuggestionsEngineRunner

- (MapsSuggestionsEngineRunner)initWithEngineBuilder:(id)a3 name:(id)a4 minRunTime:(double)a5 maxRunTime:(double)a6 minSleepTime:(double)a7 maxSleepTime:(double)a8 runTimeLeeway:(double)a9 sleepTimeLeeway:(double)a10 maxEntries:(unint64_t)a11 nilledWhenAsleep:(BOOL)a12 wakeUpTimerClass:(Class)a13 stopRunTimerClass:(Class)a14
{
  id v26;
  id v27;
  MapsSuggestionsEngineRunner *v28;
  void *v29;
  void *v30;
  OS_dispatch_queue *v31;
  OS_dispatch_queue *innerQueue;
  NSString *v33;
  NSString *name;
  MapsSuggestionsObservers *v35;
  OS_dispatch_queue *v36;
  void *v37;
  uint64_t v38;
  id v39;
  id v40;
  id v41;
  NSArray *circuits;
  NSArray *triggers;
  NSArray *conditions;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  uint64_t v49;
  uint64_t v50;
  id v51;
  OS_dispatch_queue *v52;
  uint64_t v53;
  uint64_t v54;
  id v55;
  OS_dispatch_queue *v56;
  uint64_t v57;
  NSString *firedTriggerName;
  NSString *failedConditionName;
  NSError *lastError;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  objc_class *v66;
  unint64_t v67;
  NSArray *v68;
  uint64_t v69;
  id v70;
  _QWORD v71[4];
  id v72;
  _QWORD v73[4];
  id v74;
  id location;
  NSString *v76;
  objc_super v77;

  v26 = a3;
  v27 = a4;
  v77.receiver = self;
  v77.super_class = (Class)MapsSuggestionsEngineRunner;
  v28 = -[MapsSuggestionsEngineRunner init](&v77, sel_init);
  if (v28)
  {
    v70 = v27;
    v29 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%@Queue"), v27);
    v67 = a11;
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    MSg::Queue::Queue((dispatch_queue_t *)&location, v29, v30);
    v31 = (OS_dispatch_queue *)location;
    location = 0;
    innerQueue = v28->_queue._innerQueue;
    v28->_queue._innerQueue = v31;

    v33 = v76;
    v76 = 0;
    name = v28->_queue._name;
    v28->_queue._name = v33;

    v69 = objc_msgSend(v27, "copy");
    v68 = (NSArray *)v26;
    v35 = [MapsSuggestionsObservers alloc];
    v36 = v28->_queue._innerQueue;
    v37 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%@Observers"), v27);
    v38 = -[MapsSuggestionsObservers initWithCallbackQueue:name:](v35, "initWithCallbackQueue:name:", v36, v37);
    v39 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v66 = a13;
    v40 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v41 = objc_alloc_init(MEMORY[0x1E0C99E20]);
    circuits = v28->_config.circuits;
    v28->_config.circuits = (NSArray *)v69;

    triggers = v28->_config.triggers;
    v28->_config.triggers = v68;

    conditions = v28->_config.conditions;
    v28->_config.conditions = (NSArray *)v38;

    v45 = *(void **)v28->_anon_38;
    *(_QWORD *)v28->_anon_38 = 0;

    *(double *)&v28->_anon_38[8] = a5;
    *(double *)&v28->_anon_38[16] = a6;
    *(double *)&v28->_anon_38[24] = a7;
    *(double *)&v28->_anon_38[32] = a8;
    *(double *)&v28->_anon_38[40] = a9;
    *(double *)&v28->_anon_38[48] = a10;
    v46 = *(void **)&v28->_anon_38[56];
    *(_QWORD *)&v28->_anon_38[56] = v39;

    v47 = *(void **)&v28->_anon_38[64];
    *(_QWORD *)&v28->_anon_38[64] = v40;

    v48 = *(void **)&v28->_anon_38[72];
    *(_QWORD *)&v28->_anon_38[72] = v41;

    *(_QWORD *)&v28->_anon_38[80] = v67;
    v28->_anon_38[88] = a12;

    objc_initWeak(&location, v28);
    objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
    v49 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
    v50 = objc_claimAutoreleasedReturnValue();
    v51 = [a14 alloc];
    v52 = v28->_queue._innerQueue;
    v53 = MEMORY[0x1E0C809B0];
    v73[0] = MEMORY[0x1E0C809B0];
    v73[1] = 3221225472;
    v73[2] = __199__MapsSuggestionsEngineRunner_initWithEngineBuilder_name_minRunTime_maxRunTime_minSleepTime_maxSleepTime_runTimeLeeway_sleepTimeLeeway_maxEntries_nilledWhenAsleep_wakeUpTimerClass_stopRunTimerClass___block_invoke;
    v73[3] = &unk_1E4BCDDF8;
    objc_copyWeak(&v74, &location);
    v54 = objc_msgSend(v51, "initWithName:queue:block:", CFSTR("MapsSuggestionsEngineRunnerRunTimer"), v52, v73);
    v55 = [v66 alloc];
    v56 = v28->_queue._innerQueue;
    v71[0] = v53;
    v71[1] = 3221225472;
    v71[2] = __199__MapsSuggestionsEngineRunner_initWithEngineBuilder_name_minRunTime_maxRunTime_minSleepTime_maxSleepTime_runTimeLeeway_sleepTimeLeeway_maxEntries_nilledWhenAsleep_wakeUpTimerClass_stopRunTimerClass___block_invoke_20;
    v71[3] = &unk_1E4BCDDF8;
    objc_copyWeak(&v72, &location);
    v57 = objc_msgSend(v55, "initWithName:queue:block:", CFSTR("MapsSuggestionsEngineRunnerSleepTimer"), v56, v71);
    firedTriggerName = v28->_state.firedTriggerName;
    v28->_state.firedTriggerName = (NSString *)v49;

    failedConditionName = v28->_state.failedConditionName;
    v28->_state.failedConditionName = (NSString *)v50;

    lastError = v28->_state.lastError;
    v28->_state.lastError = 0;

    v61 = *(void **)&v28->_state.active;
    *(_QWORD *)&v28->_state.active = 0;

    v62 = *(void **)v28->_anon_b8;
    *(_QWORD *)v28->_anon_b8 = v54;

    v63 = *(void **)&v28->_anon_b8[8];
    *(_QWORD *)&v28->_anon_b8[8] = v57;

    v64 = *(void **)&v28->_anon_b8[16];
    *(_QWORD *)&v28->_anon_b8[16] = 0;

    objc_destroyWeak(&v72);
    objc_destroyWeak(&v74);
    objc_destroyWeak(&location);
    v27 = v70;
  }

  return v28;
}

void __199__MapsSuggestionsEngineRunner_initWithEngineBuilder_name_minRunTime_maxRunTime_minSleepTime_maxSleepTime_runTimeLeeway_sleepTimeLeeway_maxEntries_nilledWhenAsleep_wakeUpTimerClass_stopRunTimerClass___block_invoke(uint64_t a1)
{
  id WeakRetained;
  NSObject *v2;
  void *v3;
  void *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  id location;
  uint8_t v17[4];
  void *v18;
  _BYTE buf[32];
  id v20;
  id v21[3];

  v21[2] = *(id *)MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    GEOFindOrCreateLog();
    v2 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(WeakRetained, "uniqueName");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      *(_QWORD *)&buf[4] = v3;
      *(_WORD *)&buf[12] = 2080;
      *(_QWORD *)&buf[14] = "-[MapsSuggestionsEngineRunner _q_stopRun]";
      _os_log_impl(&dword_1A427D000, v2, OS_LOG_TYPE_DEBUG, "{%@} %s", buf, 0x16u);

    }
    dispatch_assert_queue_V2(*((dispatch_queue_t *)WeakRetained + 1));
    v4 = (void *)objc_msgSend(*((id *)WeakRetained + 25), "copy");
    GEOFindOrCreateLog();
    v5 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(WeakRetained, "uniqueName");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)&buf[4] = v6;
      _os_log_impl(&dword_1A427D000, v5, OS_LOG_TYPE_DEBUG, "{%@} detaching Engine", buf, 0xCu);

    }
    objc_msgSend(*((id *)WeakRetained + 3), "detachSink:", WeakRetained);
    -[MapsSuggestionsEngineRunner _q_sendStateForStep:]((uint64_t)WeakRetained, CFSTR("didRunEngine"));
    objc_initWeak(&location, WeakRetained);
    v7 = (void *)*((_QWORD *)WeakRetained + 6);
    *(_QWORD *)buf = MEMORY[0x1E0C809B0];
    *(_QWORD *)&buf[8] = 3221225472;
    *(_QWORD *)&buf[16] = __41__MapsSuggestionsEngineRunner__q_stopRun__block_invoke;
    *(_QWORD *)&buf[24] = &unk_1E4BD1270;
    objc_copyWeak(v21, &location);
    v8 = v4;
    v20 = v8;
    objc_msgSend(v7, "callBlock:", buf);
    if (*((_BYTE *)WeakRetained + 144))
    {
      -[MapsSuggestionsEngineRunner _q_sendStateForStep:]((uint64_t)WeakRetained, CFSTR("willDestroyEngine"));
      GEOFindOrCreateLog();
      v9 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      {
        objc_msgSend(WeakRetained, "uniqueName");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)v17 = 138412290;
        v18 = v10;
        _os_log_impl(&dword_1A427D000, v9, OS_LOG_TYPE_DEBUG, "{%@} destroying Engine", v17, 0xCu);

      }
      v11 = (void *)*((_QWORD *)WeakRetained + 3);
      *((_QWORD *)WeakRetained + 3) = 0;

    }
    v12 = (void *)*((_QWORD *)WeakRetained + 25);
    *((_QWORD *)WeakRetained + 25) = 0;

    v13 = (void *)*((_QWORD *)WeakRetained + 21);
    *((_QWORD *)WeakRetained + 21) = 0;

    v14 = (void *)*((_QWORD *)WeakRetained + 22);
    *((_QWORD *)WeakRetained + 22) = 0;

    -[MapsSuggestionsEngineRunner _q_scheduleWakeUp]((uint64_t)WeakRetained);
    objc_destroyWeak(v21);
    objc_destroyWeak(&location);

  }
  else
  {
    GEOFindOrCreateLog();
    v15 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      *(_QWORD *)&buf[4] = "MapsSuggestionsEngineRunner.mm";
      *(_WORD *)&buf[12] = 1026;
      *(_DWORD *)&buf[14] = 186;
      *(_WORD *)&buf[18] = 2082;
      *(_QWORD *)&buf[20] = "-[MapsSuggestionsEngineRunner initWithEngineBuilder:name:minRunTime:maxRunTime:minSleepTime:"
                            "maxSleepTime:runTimeLeeway:sleepTimeLeeway:maxEntries:nilledWhenAsleep:wakeUpTimerClass:stop"
                            "RunTimerClass:]_block_invoke";
      _os_log_impl(&dword_1A427D000, v15, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", buf, 0x1Cu);
    }

  }
}

void __199__MapsSuggestionsEngineRunner_initWithEngineBuilder_name_minRunTime_maxRunTime_minSleepTime_maxSleepTime_runTimeLeeway_sleepTimeLeeway_maxEntries_nilledWhenAsleep_wakeUpTimerClass_stopRunTimerClass___block_invoke_20(uint64_t a1)
{
  dispatch_queue_t *WeakRetained;
  NSObject *v2;
  char *v3;
  NSObject *v4;
  char *v5;
  NSObject *v6;
  NSObject *v7;
  char *v8;
  int v9;
  char *v10;
  __int16 v11;
  _WORD v12[17];

  *(_QWORD *)&v12[13] = *MEMORY[0x1E0C80C00];
  WeakRetained = (dispatch_queue_t *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    GEOFindOrCreateLog();
    v2 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    {
      -[dispatch_queue_t uniqueName](WeakRetained, "uniqueName");
      v3 = (char *)objc_claimAutoreleasedReturnValue();
      v9 = 138412546;
      v10 = v3;
      v11 = 2080;
      *(_QWORD *)v12 = "-[MapsSuggestionsEngineRunner _q_wakeUp]";
      _os_log_impl(&dword_1A427D000, v2, OS_LOG_TYPE_DEBUG, "{%@} %s", (uint8_t *)&v9, 0x16u);

    }
    dispatch_assert_queue_V2(WeakRetained[1]);
    if ((-[MapsSuggestionsEngineRunner _q_passedAllConditions]((uint64_t)WeakRetained) & 1) != 0)
    {
      -[MapsSuggestionsEngineRunner _q_updateMinSleep]((uint64_t)WeakRetained);
      GEOFindOrCreateLog();
      v4 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
      {
        -[dispatch_queue_t uniqueName](WeakRetained, "uniqueName");
        v5 = (char *)objc_claimAutoreleasedReturnValue();
        v9 = 138412290;
        v10 = v5;
        _os_log_impl(&dword_1A427D000, v4, OS_LOG_TYPE_DEBUG, "{%@} successfully woke up! Starting run...", (uint8_t *)&v9, 0xCu);

      }
      -[MapsSuggestionsEngineRunner _q_startRunBecauseOfTrigger:]((uint64_t)WeakRetained, 0);
    }
    else
    {
      GEOFindOrCreateLog();
      v7 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      {
        -[dispatch_queue_t uniqueName](WeakRetained, "uniqueName");
        v8 = (char *)objc_claimAutoreleasedReturnValue();
        v9 = 138412290;
        v10 = v8;
        _os_log_impl(&dword_1A427D000, v7, OS_LOG_TYPE_DEBUG, "{%@} failed at least one Condition. Rescheduling.", (uint8_t *)&v9, 0xCu);

      }
      -[MapsSuggestionsEngineRunner _q_scheduleWakeUp]((uint64_t)WeakRetained);
    }
  }
  else
  {
    GEOFindOrCreateLog();
    v6 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v9 = 136446722;
      v10 = "MapsSuggestionsEngineRunner.mm";
      v11 = 1026;
      *(_DWORD *)v12 = 192;
      v12[2] = 2082;
      *(_QWORD *)&v12[3] = "-[MapsSuggestionsEngineRunner initWithEngineBuilder:name:minRunTime:maxRunTime:minSleepTime:m"
                           "axSleepTime:runTimeLeeway:sleepTimeLeeway:maxEntries:nilledWhenAsleep:wakeUpTimerClass:stopRu"
                           "nTimerClass:]_block_invoke";
      _os_log_impl(&dword_1A427D000, v6, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", (uint8_t *)&v9, 0x1Cu);
    }

  }
}

- (MapsSuggestionsEngineRunner)initWithEngineBuilder:(id)a3 name:(id)a4 minRunTime:(double)a5 maxRunTime:(double)a6 minSleepTime:(double)a7 runTimeLeeway:(double)a8 sleepTimeLeeway:(double)a9 maxEntries:(unint64_t)a10 nilledWhenAsleep:(BOOL)a11
{
  _BOOL8 v11;
  id v20;
  id v21;
  double v22;
  double v23;
  uint64_t v24;
  MapsSuggestionsEngineRunner *v25;

  v11 = a11;
  v20 = a3;
  v21 = a4;
  GEOConfigGetDouble();
  v23 = v22;
  v24 = objc_opt_class();
  v25 = -[MapsSuggestionsEngineRunner initWithEngineBuilder:name:minRunTime:maxRunTime:minSleepTime:maxSleepTime:runTimeLeeway:sleepTimeLeeway:maxEntries:nilledWhenAsleep:wakeUpTimerClass:stopRunTimerClass:](self, "initWithEngineBuilder:name:minRunTime:maxRunTime:minSleepTime:maxSleepTime:runTimeLeeway:sleepTimeLeeway:maxEntries:nilledWhenAsleep:wakeUpTimerClass:stopRunTimerClass:", v20, v21, a10, v11, v24, objc_opt_class(), a5, a6, a7, v23, a8, a9);

  return v25;
}

- (MapsSuggestionsEngineRunner)initWithEngineBuilder:(id)a3 name:(id)a4 minRunTime:(double)a5 maxRunTime:(double)a6 minSleepTime:(double)a7 maxSleepTime:(double)a8 runTimeLeeway:(double)a9 sleepTimeLeeway:(double)a10 maxEntries:(unint64_t)a11 nilledWhenAsleep:(BOOL)a12 wakeUpTimerClass:(Class)a13
{
  _BOOL8 v14;
  id v24;
  id v25;
  MapsSuggestionsEngineRunner *v26;

  v14 = a12;
  v24 = a3;
  v25 = a4;
  v26 = -[MapsSuggestionsEngineRunner initWithEngineBuilder:name:minRunTime:maxRunTime:minSleepTime:maxSleepTime:runTimeLeeway:sleepTimeLeeway:maxEntries:nilledWhenAsleep:wakeUpTimerClass:stopRunTimerClass:](self, "initWithEngineBuilder:name:minRunTime:maxRunTime:minSleepTime:maxSleepTime:runTimeLeeway:sleepTimeLeeway:maxEntries:nilledWhenAsleep:wakeUpTimerClass:stopRunTimerClass:", v24, v25, a11, v14, a13, objc_opt_class(), a5, a6, a7, a8, a9, a10);

  return v26;
}

- (MapsSuggestionsEngineRunner)initWithEngineBuilder:(id)a3 name:(id)a4 minRunTime:(double)a5 maxRunTime:(double)a6 minSleepTime:(double)a7 maxSleepTime:(double)a8 runTimeLeeway:(double)a9 sleepTimeLeeway:(double)a10 maxEntries:(unint64_t)a11 nilledWhenAsleep:(BOOL)a12
{
  _BOOL8 v12;
  id v22;
  id v23;
  MapsSuggestionsEngineRunner *v24;

  v12 = a12;
  v22 = a3;
  v23 = a4;
  v24 = -[MapsSuggestionsEngineRunner initWithEngineBuilder:name:minRunTime:maxRunTime:minSleepTime:maxSleepTime:runTimeLeeway:sleepTimeLeeway:maxEntries:nilledWhenAsleep:wakeUpTimerClass:](self, "initWithEngineBuilder:name:minRunTime:maxRunTime:minSleepTime:maxSleepTime:runTimeLeeway:sleepTimeLeeway:maxEntries:nilledWhenAsleep:wakeUpTimerClass:", v22, v23, a11, v12, objc_opt_class(), a5, a6, a7, a8, a9, a10);

  return v24;
}

- (MapsSuggestionsEngineRunner)initWithEngineBuilder:(id)a3 name:(id)a4 minRunTime:(double)a5 maxRunTime:(double)a6 minSleepTime:(double)a7 maxSleepTime:(double)a8 maxEntries:(unint64_t)a9
{
  id v16;
  id v17;
  MapsSuggestionsEngineRunner *v18;

  v16 = a3;
  v17 = a4;
  v18 = -[MapsSuggestionsEngineRunner initWithEngineBuilder:name:minRunTime:maxRunTime:minSleepTime:maxSleepTime:runTimeLeeway:sleepTimeLeeway:maxEntries:nilledWhenAsleep:wakeUpTimerClass:](self, "initWithEngineBuilder:name:minRunTime:maxRunTime:minSleepTime:maxSleepTime:runTimeLeeway:sleepTimeLeeway:maxEntries:nilledWhenAsleep:wakeUpTimerClass:", v16, v17, a9, 1, objc_opt_class(), a5, a6, a7, a8, 1.0, 1.0);

  return v18;
}

- (MapsSuggestionsEngine)engine
{
  return self->_engine;
}

- (void)registerObserver:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  NSObject *innerQueue;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;
  uint8_t buf[4];
  void *v14;
  __int16 v15;
  const char *v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  GEOFindOrCreateLog();
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    -[MapsSuggestionsEngineRunner uniqueName](self, "uniqueName");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "uniqueName");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    v14 = v6;
    v15 = 2080;
    v16 = "-[MapsSuggestionsEngineRunner registerObserver:]";
    v17 = 2112;
    v18 = v7;
    _os_log_impl(&dword_1A427D000, v5, OS_LOG_TYPE_DEBUG, "{%@} %s %@", buf, 0x20u);

  }
  -[NSArray registerObserver:handler:](self->_config.conditions, "registerObserver:handler:", v4, 0);
  objc_initWeak((id *)buf, self);
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __48__MapsSuggestionsEngineRunner_registerObserver___block_invoke;
  v10[3] = &unk_1E4BCE618;
  objc_copyWeak(&v12, (id *)buf);
  v11 = v4;
  innerQueue = self->_queue._innerQueue;
  v9 = v4;
  dispatch_async(innerQueue, v10);

  objc_destroyWeak(&v12);
  objc_destroyWeak((id *)buf);
}

void __48__MapsSuggestionsEngineRunner_registerObserver___block_invoke(uint64_t a1)
{
  id WeakRetained;
  id *v3;
  void *v4;
  NSDate *v5;
  CLLocation *v6;
  NSDate *v7;
  NSDate *v8;
  uint64_t v9;
  id v10;
  NSObject *v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  MSg *v28;
  MSg *v29;
  void *v30;
  void *v31;
  void *v32;
  MSg *v33;
  MSg *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  MSg *v45;
  MSg *v46;
  void *v47;
  void *v48;
  id v49;
  id v50;
  void *v51;
  id v52[15];
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  _QWORD v57[10];
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  uint8_t buf[4];
  char *v69;
  __int16 v70;
  int v71;
  __int16 v72;
  const char *v73;
  uint64_t v74;

  v74 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v44 = WeakRetained;
  if (WeakRetained)
  {
    v3 = (id *)WeakRetained;
    v4 = *(void **)(a1 + 32);
    v57[0] = CFSTR("now");
    MapsSuggestionsNow();
    v33 = (MSg *)objc_claimAutoreleasedReturnValue();
    MSg::jsonFor(v33, v5);
    v58 = objc_claimAutoreleasedReturnValue();
    v57[1] = CFSTR("location");
    v32 = (void *)v58;
    MapsSuggestionsCurrentBestLocation();
    v34 = (MSg *)objc_claimAutoreleasedReturnValue();
    MSg::jsonFor(v34, v6);
    v31 = v4;
    v59 = objc_claimAutoreleasedReturnValue();
    v57[2] = CFSTR("minSilenceDate");
    v29 = v45;
    v35 = (void *)v59;
    MSg::jsonFor(v45, v7);
    v60 = objc_claimAutoreleasedReturnValue();
    v57[3] = CFSTR("earliestRunDate");
    v28 = v46;
    v36 = (void *)v60;
    MSg::jsonFor(v46, v8);
    v9 = objc_claimAutoreleasedReturnValue();
    v61 = v9;
    v57[4] = CFSTR("stopRunTimer");
    v10 = v49;
    v37 = (void *)v9;
    v41 = v10;
    if (v10)
      objc_msgSend(v10, "objectForJSON");
    else
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v42 = (void *)objc_claimAutoreleasedReturnValue();

    v62 = v42;
    v57[5] = CFSTR("wakeUpTimer");
    v12 = v50;
    v13 = v12;
    if (v12)
      objc_msgSend(v12, "objectForJSON");
    else
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v43 = (void *)objc_claimAutoreleasedReturnValue();

    v63 = v43;
    v57[6] = CFSTR("entries");
    v30 = v51;
    MSg::jsonFor(v51);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v64 = v38;
    v57[7] = CFSTR("firedTriggerName");
    v27 = v47;
    MSg::jsonFor(v47);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v65 = v39;
    v57[8] = CFSTR("failedConditionName");
    v26 = v48;
    MSg::jsonFor(v48);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v66 = v40;
    v57[9] = CFSTR("conditions");
    v14 = v52[11];
    if (v14)
    {
      v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", objc_msgSend(v14, "count"));
      v55 = 0u;
      v56 = 0u;
      v53 = 0u;
      v54 = 0u;
      v16 = v14;
      v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v53, buf, 16);
      if (v17)
      {
        v18 = *(_QWORD *)v54;
        do
        {
          for (i = 0; i != v17; ++i)
          {
            if (*(_QWORD *)v54 != v18)
              objc_enumerationMutation(v16);
            v20 = *(id *)(*((_QWORD *)&v53 + 1) + 8 * i);
            v21 = v20;
            if (v20)
              objc_msgSend(v20, "objectForJSON");
            else
              objc_msgSend(MEMORY[0x1E0C99E38], "null");
            v22 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v21, "nameForJSON");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v15, "setObject:forKeyedSubscript:", v22, v23);

          }
          v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v53, buf, 16);
        }
        while (v17);
      }

      v24 = (void *)objc_msgSend(v15, "copy");
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
    }

    v67 = v24;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v58, v57, 10);
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v31, "engineRunner:step:jsonDict:", v44, CFSTR("observing"), v25);
  }
  else
  {
    GEOFindOrCreateLog();
    v11 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      v69 = "MapsSuggestionsEngineRunner.mm";
      v70 = 1026;
      v71 = 316;
      v72 = 2082;
      v73 = "-[MapsSuggestionsEngineRunner registerObserver:]_block_invoke";
      _os_log_impl(&dword_1A427D000, v11, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", buf, 0x1Cu);
    }

  }
}

- (void)addTrigger:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  id v7;
  uint8_t buf[4];
  const char *v9;
  __int16 v10;
  int v11;
  __int16 v12;
  const char *v13;
  __int16 v14;
  const char *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v7 = v4;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v7, 1);
    v6 = objc_claimAutoreleasedReturnValue();
    -[MapsSuggestionsEngineRunner addTriggers:](self, "addTriggers:", v6);
  }
  else
  {
    GEOFindOrCreateLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446978;
      v9 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsEngineRunner.mm";
      v10 = 1024;
      v11 = 326;
      v12 = 2082;
      v13 = "-[MapsSuggestionsEngineRunner addTrigger:]";
      v14 = 2082;
      v15 = "nil == (trigger)";
      _os_log_impl(&dword_1A427D000, v6, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Trigger cannot be nil", buf, 0x26u);
    }
  }

}

- (void)addTriggers:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  NSObject *innerQueue;
  id v8;
  _QWORD v9[4];
  id v10;
  MapsSuggestionsEngineRunner *v11;
  uint8_t buf[4];
  void *v13;
  __int16 v14;
  const char *v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  GEOFindOrCreateLog();
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    -[MapsSuggestionsEngineRunner uniqueName](self, "uniqueName");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    v13 = v6;
    v14 = 2080;
    v15 = "-[MapsSuggestionsEngineRunner addTriggers:]";
    v16 = 2112;
    v17 = v4;
    _os_log_impl(&dword_1A427D000, v5, OS_LOG_TYPE_DEBUG, "{%@} %s %@", buf, 0x20u);

  }
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __43__MapsSuggestionsEngineRunner_addTriggers___block_invoke;
  v9[3] = &unk_1E4BCF9B8;
  v10 = v4;
  v11 = self;
  innerQueue = self->_queue._innerQueue;
  v8 = v4;
  dispatch_sync(innerQueue, v9);

}

void __43__MapsSuggestionsEngineRunner_addTriggers___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t i;
  void *v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v2 = *(id *)(a1 + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v8;
    do
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v8 != v4)
          objc_enumerationMutation(v2);
        v6 = *(void **)(*((_QWORD *)&v7 + 1) + 8 * i);
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 112), "addObject:", v6, (_QWORD)v7);
        objc_msgSend(v6, "registerObserver:", *(_QWORD *)(a1 + 40));
      }
      v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v3);
  }

}

- (void)removeTrigger:(id)a3
{
  id v4;
  void *v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v6[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MapsSuggestionsEngineRunner removeTriggers:](self, "removeTriggers:", v5);

}

- (void)removeTriggers:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;
  MapsSuggestionsEngineRunner *v10;
  uint8_t buf[4];
  void *v12;
  __int16 v13;
  const char *v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  GEOFindOrCreateLog();
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    -[MapsSuggestionsEngineRunner uniqueName](self, "uniqueName");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    v12 = v6;
    v13 = 2080;
    v14 = "-[MapsSuggestionsEngineRunner removeTriggers:]";
    v15 = 2112;
    v16 = v4;
    _os_log_impl(&dword_1A427D000, v5, OS_LOG_TYPE_DEBUG, "{%@} %s %@", buf, 0x20u);

  }
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __46__MapsSuggestionsEngineRunner_removeTriggers___block_invoke;
  v8[3] = &unk_1E4BCF9B8;
  v7 = v4;
  v9 = v7;
  v10 = self;
  MSg::Queue::syncIfDifferent((NSObject **)&self->_queue, v8);

}

void __46__MapsSuggestionsEngineRunner_removeTriggers___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t i;
  void *v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v2 = *(id *)(a1 + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v8;
    do
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v8 != v4)
          objc_enumerationMutation(v2);
        v6 = *(void **)(*((_QWORD *)&v7 + 1) + 8 * i);
        objc_msgSend(v6, "unregisterObserver:", *(_QWORD *)(a1 + 40), (_QWORD)v7);
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 112), "removeObject:", v6);
      }
      v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v3);
  }

}

- (void)addCondition:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  id v7;
  uint8_t buf[4];
  const char *v9;
  __int16 v10;
  int v11;
  __int16 v12;
  const char *v13;
  __int16 v14;
  const char *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v7 = v4;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v7, 1);
    v6 = objc_claimAutoreleasedReturnValue();
    -[MapsSuggestionsEngineRunner addConditions:](self, "addConditions:", v6);
  }
  else
  {
    GEOFindOrCreateLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446978;
      v9 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsEngineRunner.mm";
      v10 = 1024;
      v11 = 359;
      v12 = 2082;
      v13 = "-[MapsSuggestionsEngineRunner addCondition:]";
      v14 = 2082;
      v15 = "nil == (condition)";
      _os_log_impl(&dword_1A427D000, v6, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Condition cannot be nil", buf, 0x26u);
    }
  }

}

- (void)addConditions:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  NSObject *innerQueue;
  id v8;
  _QWORD v9[4];
  id v10;
  MapsSuggestionsEngineRunner *v11;
  uint8_t buf[4];
  void *v13;
  __int16 v14;
  const char *v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  GEOFindOrCreateLog();
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    -[MapsSuggestionsEngineRunner uniqueName](self, "uniqueName");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    v13 = v6;
    v14 = 2080;
    v15 = "-[MapsSuggestionsEngineRunner addConditions:]";
    v16 = 2112;
    v17 = v4;
    _os_log_impl(&dword_1A427D000, v5, OS_LOG_TYPE_DEBUG, "{%@} %s %@", buf, 0x20u);

  }
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __45__MapsSuggestionsEngineRunner_addConditions___block_invoke;
  v9[3] = &unk_1E4BCF9B8;
  v10 = v4;
  v11 = self;
  innerQueue = self->_queue._innerQueue;
  v8 = v4;
  dispatch_sync(innerQueue, v9);

}

void __45__MapsSuggestionsEngineRunner_addConditions___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  _BYTE v10[128];
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v6 = 0u;
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v2 = *(id *)(a1 + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v6, v10, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v7;
    do
    {
      v5 = 0;
      do
      {
        if (*(_QWORD *)v7 != v4)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 120), "addObject:", *(_QWORD *)(*((_QWORD *)&v6 + 1) + 8 * v5++), (_QWORD)v6);
      }
      while (v3 != v5);
      v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v6, v10, 16);
    }
    while (v3);
  }

}

- (void)addPostFilter:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  NSObject *innerQueue;
  id v9;
  _QWORD v10[5];
  id v11;
  uint8_t buf[4];
  void *v13;
  __int16 v14;
  const char *v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  GEOFindOrCreateLog();
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    -[MapsSuggestionsEngineRunner uniqueName](self, "uniqueName");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "uniqueName");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    v13 = v6;
    v14 = 2080;
    v15 = "-[MapsSuggestionsEngineRunner addPostFilter:]";
    v16 = 2112;
    v17 = v7;
    _os_log_impl(&dword_1A427D000, v5, OS_LOG_TYPE_DEBUG, "{%@} %s %@", buf, 0x20u);

  }
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __45__MapsSuggestionsEngineRunner_addPostFilter___block_invoke;
  v10[3] = &unk_1E4BCF9B8;
  v10[4] = self;
  v11 = v4;
  innerQueue = self->_queue._innerQueue;
  v9 = v4;
  dispatch_sync(innerQueue, v10);

}

void *__45__MapsSuggestionsEngineRunner_addPostFilter___block_invoke(uint64_t a1)
{
  void *result;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 128), "addObject:", *(_QWORD *)(a1 + 40));
  result = *(void **)(*(_QWORD *)(a1 + 32) + 24);
  if (result)
    return (void *)objc_msgSend(result, "addAdditionalFilter:forSink:", *(_QWORD *)(a1 + 40));
  return result;
}

- (void)removeCondition:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  id v7;
  uint8_t buf[4];
  const char *v9;
  __int16 v10;
  int v11;
  __int16 v12;
  const char *v13;
  __int16 v14;
  const char *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v7 = v4;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v7, 1);
    v6 = objc_claimAutoreleasedReturnValue();
    -[MapsSuggestionsEngineRunner removeConditions:](self, "removeConditions:", v6);
  }
  else
  {
    GEOFindOrCreateLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446978;
      v9 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsEngineRunner.mm";
      v10 = 1024;
      v11 = 386;
      v12 = 2082;
      v13 = "-[MapsSuggestionsEngineRunner removeCondition:]";
      v14 = 2082;
      v15 = "nil == (condition)";
      _os_log_impl(&dword_1A427D000, v6, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Condition cannot be nil", buf, 0x26u);
    }
  }

}

- (void)removeConditions:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;
  MapsSuggestionsEngineRunner *v10;
  uint8_t buf[4];
  void *v12;
  __int16 v13;
  const char *v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  GEOFindOrCreateLog();
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    -[MapsSuggestionsEngineRunner uniqueName](self, "uniqueName");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    v12 = v6;
    v13 = 2080;
    v14 = "-[MapsSuggestionsEngineRunner removeConditions:]";
    v15 = 2112;
    v16 = v4;
    _os_log_impl(&dword_1A427D000, v5, OS_LOG_TYPE_DEBUG, "{%@} %s %@", buf, 0x20u);

  }
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __48__MapsSuggestionsEngineRunner_removeConditions___block_invoke;
  v8[3] = &unk_1E4BCF9B8;
  v7 = v4;
  v9 = v7;
  v10 = self;
  MSg::Queue::syncIfDifferent((NSObject **)&self->_queue, v8);

}

void __48__MapsSuggestionsEngineRunner_removeConditions___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  _BYTE v10[128];
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v6 = 0u;
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v2 = *(id *)(a1 + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v6, v10, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v7;
    do
    {
      v5 = 0;
      do
      {
        if (*(_QWORD *)v7 != v4)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 120), "removeObject:", *(_QWORD *)(*((_QWORD *)&v6 + 1) + 8 * v5++), (_QWORD)v6);
      }
      while (v3 != v5);
      v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v6, v10, 16);
    }
    while (v3);
  }

}

- (uint64_t)_q_passedAllConditions
{
  NSObject *v2;
  void *v3;
  void *v4;
  NSObject *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  NSObject *v11;
  NSObject *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  uint8_t v22[128];
  uint8_t buf[4];
  void *v24;
  __int16 v25;
  const char *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  GEOFindOrCreateLog();
  v2 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend((id)a1, "uniqueName");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v24 = v3;
    v25 = 2080;
    v26 = "-[MapsSuggestionsEngineRunner _q_passedAllConditions]";
    _os_log_impl(&dword_1A427D000, v2, OS_LOG_TYPE_DEBUG, "{%@} %s", buf, 0x16u);

  }
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 8));
  v4 = *(void **)(a1 + 176);
  *(_QWORD *)(a1 + 176) = 0;

  -[MapsSuggestionsEngineRunner _q_sendStateForStep:](a1, CFSTR("willCheckConditions"));
  GEOFindOrCreateLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A427D000, v5, OS_LOG_TYPE_DEBUG, "Checking all Conditions...", buf, 2u);
  }

  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v6 = *(id *)(a1 + 120);
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v19;
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v19 != v8)
          objc_enumerationMutation(v6);
        v10 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
        if ((objc_msgSend(v10, "isTrue", (_QWORD)v18) & 1) == 0)
        {
          GEOFindOrCreateLog();
          v13 = (id)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
          {
            objc_msgSend(v10, "uniqueName");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412290;
            v24 = v14;
            _os_log_impl(&dword_1A427D000, v13, OS_LOG_TYPE_DEBUG, "RUNCONDITION{%@} failed", buf, 0xCu);

          }
          objc_msgSend(v10, "uniqueName");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = objc_msgSend(v15, "copy");
          v17 = *(void **)(a1 + 176);
          *(_QWORD *)(a1 + 176) = v16;

          -[MapsSuggestionsEngineRunner _q_sendStateForStep:](a1, CFSTR("didFailConditions"));
          return 0;
        }
      }
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      if (v7)
        continue;
      break;
    }
  }

  GEOFindOrCreateLog();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A427D000, v11, OS_LOG_TYPE_DEBUG, "Passed all Conditions!", buf, 2u);
  }

  -[MapsSuggestionsEngineRunner _q_sendStateForStep:](a1, CFSTR("didPassConditions"));
  return 1;
}

- (void)_q_sendStateForStep:(uint64_t)a1
{
  NSDate *v3;
  CLLocation *v4;
  NSDate *v5;
  NSDate *v6;
  uint64_t v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  MSg *v30;
  void *v31;
  MSg *v32;
  void *v33;
  void *v34;
  void *v35;
  id v36;
  void *v37;
  uint64_t v38;
  void *v39;
  MSg *v40;
  void *v41;
  MSg *v42;
  void *v43;
  uint64_t v44;
  void *v45;
  uint64_t v46;
  void *v47;
  uint64_t v48;
  void *v49;
  uint64_t v50;
  void *v51;
  uint64_t v52;
  void *v53;
  uint64_t v54;
  void *v55;
  _QWORD *val;
  void *v57;
  void *v58;
  void *v59;
  _QWORD v60[4];
  id v61;
  id v62;
  id v63;
  MSg *v64;
  MSg *v65;
  void *v66;
  void *v67;
  id v68;
  id v69;
  void *v70;
  id v71[15];
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  _QWORD v76[10];
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  void *v81;
  void *v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  void *v86;
  id location[19];

  location[16] = *(id *)MEMORY[0x1E0C80C00];
  v36 = a2;
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 8));
  v76[0] = CFSTR("now");
  MapsSuggestionsNow();
  val = (_QWORD *)a1;
  v40 = (MSg *)objc_claimAutoreleasedReturnValue();
  MSg::jsonFor(v40, v3);
  v77 = objc_claimAutoreleasedReturnValue();
  v76[1] = CFSTR("location");
  v38 = v77;
  MapsSuggestionsCurrentBestLocation();
  v42 = (MSg *)objc_claimAutoreleasedReturnValue();
  MSg::jsonFor(v42, v4);
  v78 = objc_claimAutoreleasedReturnValue();
  v76[2] = CFSTR("minSilenceDate");
  v32 = v64;
  v44 = v78;
  MSg::jsonFor(v64, v5);
  v79 = objc_claimAutoreleasedReturnValue();
  v76[3] = CFSTR("earliestRunDate");
  v30 = v65;
  v46 = v79;
  MSg::jsonFor(v65, v6);
  v7 = objc_claimAutoreleasedReturnValue();
  v80 = v7;
  v76[4] = CFSTR("stopRunTimer");
  v8 = v68;
  v48 = v7;
  v57 = v8;
  if (v8)
    objc_msgSend(v8, "objectForJSON");
  else
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v58 = (void *)objc_claimAutoreleasedReturnValue();

  v81 = v58;
  v76[5] = CFSTR("wakeUpTimer");
  v9 = v69;
  v10 = v9;
  if (v9)
    objc_msgSend(v9, "objectForJSON");
  else
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v59 = (void *)objc_claimAutoreleasedReturnValue();

  v82 = v59;
  v76[6] = CFSTR("entries");
  v34 = v70;
  MSg::jsonFor(v70);
  v50 = objc_claimAutoreleasedReturnValue();
  v83 = v50;
  v76[7] = CFSTR("firedTriggerName");
  v28 = v66;
  MSg::jsonFor(v66);
  v52 = objc_claimAutoreleasedReturnValue();
  v84 = v52;
  v76[8] = CFSTR("failedConditionName");
  v26 = v67;
  MSg::jsonFor(v67);
  v54 = objc_claimAutoreleasedReturnValue();
  v85 = v54;
  v76[9] = CFSTR("conditions");
  v11 = v71[11];
  if (v11)
  {
    v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", objc_msgSend(v11, "count", v26, v28, v30, v32, v34, v36, v38, v40, v42, v44, v46, v48, v50, v52,
                      v54));
    v74 = 0u;
    v75 = 0u;
    v72 = 0u;
    v73 = 0u;
    v13 = v11;
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v72, location, 16);
    if (v14)
    {
      v15 = *(_QWORD *)v73;
      do
      {
        for (i = 0; i != v14; ++i)
        {
          if (*(_QWORD *)v73 != v15)
            objc_enumerationMutation(v13);
          v17 = *(id *)(*((_QWORD *)&v72 + 1) + 8 * i);
          v18 = v17;
          if (v17)
            objc_msgSend(v17, "objectForJSON");
          else
            objc_msgSend(MEMORY[0x1E0C99E38], "null");
          v19 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v18, "nameForJSON");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "setObject:forKeyedSubscript:", v19, v20);

        }
        v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v72, location, 16);
      }
      while (v14);
    }

    v21 = (void *)objc_msgSend(v12, "copy");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null", v26, v28, v30, v32, v34, v36, v38, v40, v42, v44, v46, v48, v50, v52, v54);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
  }

  v86 = v21;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v77, v76, 10);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  objc_initWeak(location, val);
  v23 = (void *)val[6];
  v60[0] = MEMORY[0x1E0C809B0];
  v60[1] = 3221225472;
  v60[2] = __51__MapsSuggestionsEngineRunner__q_sendStateForStep___block_invoke;
  v60[3] = &unk_1E4BD1390;
  objc_copyWeak(&v63, location);
  v24 = v37;
  v61 = v24;
  v62 = v22;
  v25 = v22;
  objc_msgSend(v23, "callBlock:", v60);

  objc_destroyWeak(&v63);
  objc_destroyWeak(location);

}

- (void)_q_startRunBecauseOfTrigger:(uint64_t)a1
{
  id v3;
  NSObject *v4;
  __CFString *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  NSObject *v10;
  __CFString *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  _BOOL4 v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  int AppBooleanValueWithContainer;
  void *v27;
  NSObject *v28;
  __CFString *v29;
  void *v30;
  int v31;
  const __CFString *v32;
  void *v33;
  void *v34;
  void *v35;
  int v36;
  void *v37;
  NSObject *v38;
  void *v39;
  int v40;
  const __CFString *v41;
  id v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t i;
  uint64_t v46;
  void *v47;
  NSObject *v48;
  __CFString *v49;
  const char *v50;
  NSObject *v51;
  __CFString *v52;
  NSObject *v53;
  __CFString *v54;
  const char *v55;
  void *v56;
  void *v57;
  id v58;
  _QWORD v59[4];
  id v60;
  id v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  uint8_t v66[128];
  uint8_t buf[4];
  const __CFString *v68;
  __int16 v69;
  const char *v70;
  __int16 v71;
  void *v72;
  uint64_t v73;

  v73 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  GEOFindOrCreateLog();
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend((id)a1, "uniqueName");
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "uniqueName");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    v68 = v5;
    v69 = 2080;
    v70 = "-[MapsSuggestionsEngineRunner _q_startRunBecauseOfTrigger:]";
    v71 = 2112;
    v72 = v6;
    _os_log_impl(&dword_1A427D000, v4, OS_LOG_TYPE_DEBUG, "{%@} %s %@", buf, 0x20u);

  }
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 8));
  objc_msgSend(v3, "uniqueName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "copy");
  v9 = *(void **)(a1 + 168);
  *(_QWORD *)(a1 + 168) = v8;

  -[MapsSuggestionsEngineRunner _q_sendStateForStep:](a1, CFSTR("didWakeUp"));
  if (!*(_QWORD *)(a1 + 24))
  {
    GEOFindOrCreateLog();
    v10 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend((id)a1, "uniqueName");
      v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v68 = v11;
      _os_log_impl(&dword_1A427D000, v10, OS_LOG_TYPE_DEBUG, "{%@} Building Engine", buf, 0xCu);

    }
    -[MapsSuggestionsEngineRunner _q_sendStateForStep:](a1, CFSTR("willBuildEngine"));
    objc_msgSend(*(id *)(a1 + 40), "build");
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = *(void **)(a1 + 24);
    *(_QWORD *)(a1 + 24) = v12;

    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 8));
    v14 = *(void **)(a1 + 56);
    if (!v14)
    {
      v15 = objc_alloc_init(MEMORY[0x1E0D26F18]);
      v16 = *(void **)(a1 + 56);
      *(_QWORD *)(a1 + 56) = v15;

      v14 = *(void **)(a1 + 56);
    }
    if ((objc_msgSend(v14, "hasUserPreferences") & 1) == 0)
    {
      v17 = objc_alloc_init(MEMORY[0x1E0D27688]);
      objc_msgSend(*(id *)(a1 + 56), "setUserPreferences:", v17);

    }
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "containerURLForSecurityApplicationGroupIdentifier:", CFSTR("group.com.apple.Maps"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "path");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = _CFPreferencesGetAppBooleanValueWithContainer() == 0;

    if (v21)
      v22 = 3;
    else
      v22 = 1;
    objc_msgSend(*(id *)(a1 + 56), "setTrafficType:", v22);
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "containerURLForSecurityApplicationGroupIdentifier:", CFSTR("group.com.apple.Maps"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "path");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    AppBooleanValueWithContainer = _CFPreferencesGetAppBooleanValueWithContainer();

    objc_msgSend(*(id *)(a1 + 56), "userPreferences");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "setAvoidTolls:", AppBooleanValueWithContainer != 0);

    GEOFindOrCreateLog();
    v28 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend((id)a1, "uniqueName");
      v29 = (__CFString *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 56), "userPreferences");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = objc_msgSend(v30, "avoidTolls");
      v32 = CFSTR("NO");
      if (v31)
        v32 = CFSTR("YES");
      *(_DWORD *)buf = 138412546;
      v68 = v29;
      v69 = 2112;
      v70 = (const char *)v32;
      _os_log_impl(&dword_1A427D000, v28, OS_LOG_TYPE_DEBUG, "Avoid Tolls on the %@EngineRunner: %@", buf, 0x16u);

    }
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "containerURLForSecurityApplicationGroupIdentifier:", CFSTR("group.com.apple.Maps"));
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "path");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = _CFPreferencesGetAppBooleanValueWithContainer();

    objc_msgSend(*(id *)(a1 + 56), "userPreferences");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "setAvoidHighways:", v36 != 0);

    GEOFindOrCreateLog();
    v38 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v38, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(*(id *)(a1 + 56), "userPreferences");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      v40 = objc_msgSend(v39, "avoidHighways");
      v41 = CFSTR("NO");
      if (v40)
        v41 = CFSTR("YES");
      *(_DWORD *)buf = 138412290;
      v68 = v41;
      _os_log_impl(&dword_1A427D000, v38, OS_LOG_TYPE_DEBUG, "Avoid Highways:%@", buf, 0xCu);

    }
    objc_msgSend(*(id *)(a1 + 24), "setAutomobileOptions:", *(_QWORD *)(a1 + 56));
    v64 = 0u;
    v65 = 0u;
    v62 = 0u;
    v63 = 0u;
    v42 = *(id *)(a1 + 128);
    v43 = objc_msgSend(v42, "countByEnumeratingWithState:objects:count:", &v62, v66, 16);
    if (v43)
    {
      v44 = *(_QWORD *)v63;
      do
      {
        for (i = 0; i != v43; ++i)
        {
          if (*(_QWORD *)v63 != v44)
            objc_enumerationMutation(v42);
          objc_msgSend(*(id *)(a1 + 24), "addAdditionalFilter:forSink:", *(_QWORD *)(*((_QWORD *)&v62 + 1) + 8 * i), a1);
        }
        v43 = objc_msgSend(v42, "countByEnumeratingWithState:objects:count:", &v62, v66, 16);
      }
      while (v43);
    }

    -[MapsSuggestionsEngineRunner _q_sendStateForStep:](a1, CFSTR("didBuildEngine"));
  }
  MapsSuggestionsNowWithOffset(*(double *)(a1 + 64));
  v46 = objc_claimAutoreleasedReturnValue();
  v47 = *(void **)(a1 + 152);
  *(_QWORD *)(a1 + 152) = v46;

  GEOFindOrCreateLog();
  v48 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v48, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend((id)a1, "uniqueName");
    v49 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v50 = *(const char **)(a1 + 152);
    *(_DWORD *)buf = 138412546;
    v68 = v49;
    v69 = 2112;
    v70 = v50;
    _os_log_impl(&dword_1A427D000, v48, OS_LOG_TYPE_DEBUG, "{%@} will be silent until %@", buf, 0x16u);

  }
  GEOFindOrCreateLog();
  v51 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v51, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend((id)a1, "uniqueName");
    v52 = (__CFString *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v68 = v52;
    _os_log_impl(&dword_1A427D000, v51, OS_LOG_TYPE_DEBUG, "{%@} attaching Engine", buf, 0xCu);

  }
  GEOFindOrCreateLog();
  v53 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v53, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend((id)a1, "uniqueName");
    v54 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v55 = *(const char **)(a1 + 72);
    v56 = *(void **)(a1 + 96);
    *(_DWORD *)buf = 138412802;
    v68 = v54;
    v69 = 2048;
    v70 = v55;
    v71 = 2048;
    v72 = v56;
    _os_log_impl(&dword_1A427D000, v53, OS_LOG_TYPE_DEBUG, "{%@} scheduling _q_stopRun in %.3f sec (+ %.3f sec)", buf, 0x20u);

  }
  objc_msgSend(*(id *)(a1 + 184), "scheduleWithInterval:leeway:", (uint64_t)(*(double *)(a1 + 72) * 1000000000.0), (uint64_t)(*(double *)(a1 + 96) * 1000000000.0));
  -[MapsSuggestionsEngineRunner _q_sendStateForStep:](a1, CFSTR("willRunEngine"));
  objc_msgSend(*(id *)(a1 + 24), "attachSink:", a1);
  -[MapsSuggestionsEngineRunner _q_fetchEntries](a1);
  objc_initWeak((id *)buf, (id)a1);
  v57 = *(void **)(a1 + 48);
  v59[0] = MEMORY[0x1E0C809B0];
  v59[1] = 3221225472;
  v59[2] = __59__MapsSuggestionsEngineRunner__q_startRunBecauseOfTrigger___block_invoke;
  v59[3] = &unk_1E4BD1270;
  objc_copyWeak(&v61, (id *)buf);
  v58 = v3;
  v60 = v58;
  objc_msgSend(v57, "callBlock:", v59);

  objc_destroyWeak(&v61);
  objc_destroyWeak((id *)buf);

}

- (void)_q_fetchEntries
{
  NSObject *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  _QWORD v6[4];
  id v7;
  uint8_t buf[4];
  void *v9;
  __int16 v10;
  const char *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    GEOFindOrCreateLog();
    v2 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend((id)a1, "uniqueName");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v9 = v3;
      v10 = 2080;
      v11 = "-[MapsSuggestionsEngineRunner _q_fetchEntries]";
      _os_log_impl(&dword_1A427D000, v2, OS_LOG_TYPE_DEBUG, "{%@} %s", buf, 0x16u);

    }
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 8));
    objc_initWeak((id *)buf, (id)a1);
    v4 = *(void **)(a1 + 24);
    v5 = *(_QWORD *)(a1 + 136);
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __46__MapsSuggestionsEngineRunner__q_fetchEntries__block_invoke;
    v6[3] = &unk_1E4BD1348;
    objc_copyWeak(&v7, (id *)buf);
    objc_msgSend(v4, "topSuggestionsForSink:count:transportType:callback:onQueue:", a1, v5, 4, v6, *(_QWORD *)(a1 + 8));
    objc_destroyWeak(&v7);
    objc_destroyWeak((id *)buf);
  }
}

void __59__MapsSuggestionsEngineRunner__q_startRunBecauseOfTrigger___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  NSObject *v5;
  int v6;
  char *v7;
  __int16 v8;
  int v9;
  __int16 v10;
  const char *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    objc_msgSend(v3, "engineRunner:startedBecauseOfTrigger:", WeakRetained, *(_QWORD *)(a1 + 32));
  }
  else
  {
    GEOFindOrCreateLog();
    v5 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v6 = 136446722;
      v7 = "MapsSuggestionsEngineRunner.mm";
      v8 = 1026;
      v9 = 479;
      v10 = 2082;
      v11 = "-[MapsSuggestionsEngineRunner _q_startRunBecauseOfTrigger:]_block_invoke";
      _os_log_impl(&dword_1A427D000, v5, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", (uint8_t *)&v6, 0x1Cu);
    }

  }
}

void __41__MapsSuggestionsEngineRunner__q_stopRun__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  uint64_t v5;
  NSObject *v6;
  int v7;
  char *v8;
  __int16 v9;
  int v10;
  __int16 v11;
  const char *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    if (*(_QWORD *)(a1 + 32))
      v5 = *(_QWORD *)(a1 + 32);
    else
      v5 = MEMORY[0x1E0C9AA60];
    objc_msgSend(v3, "engineRunner:stoppedWithEntries:", WeakRetained, v5);
  }
  else
  {
    GEOFindOrCreateLog();
    v6 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v7 = 136446722;
      v8 = "MapsSuggestionsEngineRunner.mm";
      v9 = 1026;
      v10 = 499;
      v11 = 2082;
      v12 = "-[MapsSuggestionsEngineRunner _q_stopRun]_block_invoke";
      _os_log_impl(&dword_1A427D000, v6, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", (uint8_t *)&v7, 0x1Cu);
    }

  }
}

- (void)_q_scheduleWakeUp
{
  NSObject *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  int v6;
  void *v7;
  __int16 v8;
  uint64_t v9;
  __int16 v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 8));
    if (*(double *)(a1 + 88) != 0.0)
    {
      GEOFindOrCreateLog();
      v2 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
      {
        objc_msgSend((id)a1, "uniqueName");
        v3 = (void *)objc_claimAutoreleasedReturnValue();
        v4 = *(_QWORD *)(a1 + 88);
        v5 = *(_QWORD *)(a1 + 104);
        v6 = 138412802;
        v7 = v3;
        v8 = 2048;
        v9 = v4;
        v10 = 2048;
        v11 = v5;
        _os_log_impl(&dword_1A427D000, v2, OS_LOG_TYPE_DEBUG, "{%@} scheduling _q_wakeUp in %.3f sec (+ %.3f sec)", (uint8_t *)&v6, 0x20u);

      }
      objc_msgSend(*(id *)(a1 + 192), "scheduleWithInterval:leeway:", (uint64_t)(*(double *)(a1 + 88) * 1000000000.0), (uint64_t)(*(double *)(a1 + 104) * 1000000000.0));
      -[MapsSuggestionsEngineRunner _q_sendStateForStep:](a1, CFSTR("willSleep"));
    }
  }
}

- (void)_q_updateMinSleep
{
  NSObject *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  int v7;
  void *v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 8));
  GEOFindOrCreateLog();
  v2 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend((id)a1, "uniqueName");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = *(_QWORD *)(a1 + 80);
    v7 = 138412546;
    v8 = v3;
    v9 = 2048;
    v10 = v4;
    _os_log_impl(&dword_1A427D000, v2, OS_LOG_TYPE_DEBUG, "{%@} sleeping for at least %.3f sec", (uint8_t *)&v7, 0x16u);

  }
  MapsSuggestionsNowWithOffset(*(double *)(a1 + 80));
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = *(void **)(a1 + 160);
  *(_QWORD *)(a1 + 160) = v5;

  -[MapsSuggestionsEngineRunner _q_sendStateForStep:](a1, CFSTR("didUpdateMinSleep"));
}

- (void)scheduleNextRun
{
  NSObject *v3;
  void *v4;
  int v5;
  void *v6;
  __int16 v7;
  const char *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  GEOFindOrCreateLog();
  v3 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    -[MapsSuggestionsEngineRunner uniqueName](self, "uniqueName");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = 138412546;
    v6 = v4;
    v7 = 2080;
    v8 = "-[MapsSuggestionsEngineRunner scheduleNextRun]";
    _os_log_impl(&dword_1A427D000, v3, OS_LOG_TYPE_DEBUG, "{%@} %s", (uint8_t *)&v5, 0x16u);

  }
  MSg::Queue::async<MapsSuggestionsEngineRunner>((NSObject **)&self->_queue, self, &__block_literal_global_33);
}

void __46__MapsSuggestionsEngineRunner_scheduleNextRun__block_invoke(uint64_t a1, uint64_t a2)
{
  -[MapsSuggestionsEngineRunner _q_scheduleWakeUp](a2);
}

- (void)runASAP
{
  NSObject *v3;
  void *v4;
  int v5;
  void *v6;
  __int16 v7;
  const char *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  GEOFindOrCreateLog();
  v3 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    -[MapsSuggestionsEngineRunner uniqueName](self, "uniqueName");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = 138412546;
    v6 = v4;
    v7 = 2080;
    v8 = "-[MapsSuggestionsEngineRunner runASAP]";
    _os_log_impl(&dword_1A427D000, v3, OS_LOG_TYPE_DEBUG, "{%@} %s", (uint8_t *)&v5, 0x16u);

  }
  MSg::Queue::async<MapsSuggestionsEngineRunner>((NSObject **)&self->_queue, self, &__block_literal_global_64);
}

void __38__MapsSuggestionsEngineRunner_runASAP__block_invoke(uint64_t a1, uint64_t a2)
{
  NSObject *v3;
  void *v4;
  NSObject *v5;
  void *v6;
  const char *v7;
  NSObject *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  int v12;
  void *v13;
  __int16 v14;
  const char *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if (a2)
  {
    GEOFindOrCreateLog();
    v3 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend((id)a2, "uniqueName");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 138412546;
      v13 = v4;
      v14 = 2080;
      v15 = "-[MapsSuggestionsEngineRunner _q_runASAP]";
      _os_log_impl(&dword_1A427D000, v3, OS_LOG_TYPE_DEBUG, "{%@} %s", (uint8_t *)&v12, 0x16u);

    }
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a2 + 8));
    if (MapsSuggestionsIsInTheFuture(*(void **)(a2 + 160)))
    {
      GEOFindOrCreateLog();
      v5 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      {
        objc_msgSend((id)a2, "uniqueName");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        v7 = *(const char **)(a2 + 160);
        v12 = 138412546;
        v13 = v6;
        v14 = 2112;
        v15 = v7;
        _os_log_impl(&dword_1A427D000, v5, OS_LOG_TYPE_DEBUG, "{%@} needs to sleep until at least %@. Ignoring runASAP.", (uint8_t *)&v12, 0x16u);

      }
    }
    else if ((-[MapsSuggestionsEngineRunner _q_passedAllConditions](a2) & 1) != 0)
    {
      -[MapsSuggestionsEngineRunner _q_updateMinSleep](a2);
      GEOFindOrCreateLog();
      v8 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      {
        objc_msgSend((id)a2, "uniqueName");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = 138412290;
        v13 = v9;
        _os_log_impl(&dword_1A427D000, v8, OS_LOG_TYPE_DEBUG, "{%@} is allowed to run!", (uint8_t *)&v12, 0xCu);

      }
      -[MapsSuggestionsEngineRunner _q_startRunBecauseOfTrigger:](a2, 0);
    }
    else
    {
      GEOFindOrCreateLog();
      v10 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      {
        objc_msgSend((id)a2, "uniqueName");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = 138412290;
        v13 = v11;
        _os_log_impl(&dword_1A427D000, v10, OS_LOG_TYPE_DEBUG, "{%@} failed at least one Condition. Scheduling normal wakeup.", (uint8_t *)&v12, 0xCu);

      }
      -[MapsSuggestionsEngineRunner _q_scheduleWakeUp](a2);
    }
  }
}

- (NSString)uniqueName
{
  return (NSString *)self->_config.circuits;
}

- (void)triggerFired:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;
  uint8_t buf[4];
  void *v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  GEOFindOrCreateLog();
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    -[MapsSuggestionsEngineRunner uniqueName](self, "uniqueName");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "uniqueName");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v12 = v6;
    v13 = 2112;
    v14 = v7;
    _os_log_impl(&dword_1A427D000, v5, OS_LOG_TYPE_DEBUG, "{%@} fired TRIGGER{%@}!", buf, 0x16u);

  }
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __44__MapsSuggestionsEngineRunner_triggerFired___block_invoke;
  v9[3] = &unk_1E4BD12F8;
  v8 = v4;
  v10 = v8;
  MSg::Queue::async<MapsSuggestionsEngineRunner>((NSObject **)&self->_queue, self, v9);

}

void __44__MapsSuggestionsEngineRunner_triggerFired___block_invoke(uint64_t a1, uint64_t a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  _BOOL4 v7;
  double v8;
  NSObject *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  double v18;
  void *v19;
  void *v20;
  void *v21;
  int v22;
  void *v23;
  __int16 v24;
  double v25;
  __int16 v26;
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v3 = *(id *)(a1 + 32);
  if (a2)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a2 + 8));
    objc_msgSend(v3, "uniqueName");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "copy");
    v6 = *(void **)(a2 + 168);
    *(_QWORD *)(a2 + 168) = v5;

    if (MapsSuggestionsIsInTheFuture(*(void **)(a2 + 160)))
    {
      if (GEOConfigGetBOOL())
      {
        dispatch_assert_queue_V2(*(dispatch_queue_t *)(a2 + 8));
        if (*(double *)(a2 + 80) != 0.0)
        {
          v7 = MapsSuggestionsIsInTheFuture(*(void **)(a2 + 160));
          GEOFindOrCreateLog();
          v8 = (double)v7;
          v9 = (id)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
          {
            objc_msgSend((id)a2, "uniqueName");
            v10 = (void *)objc_claimAutoreleasedReturnValue();
            v11 = *(void **)(a2 + 104);
            v22 = 138412802;
            v23 = v10;
            v24 = 2048;
            v25 = v8;
            v26 = 2048;
            v27 = v11;
            _os_log_impl(&dword_1A427D000, v9, OS_LOG_TYPE_DEBUG, "{%@} scheduling _q_scheduleASAPWakeUp in %.3f sec (+ %.3f sec)", (uint8_t *)&v22, 0x20u);

          }
          objc_msgSend(*(id *)(a2 + 192), "scheduleWithInterval:leeway:", (uint64_t)(v8 * 1000000000.0), (uint64_t)(*(double *)(a2 + 104) * 1000000000.0));
          -[MapsSuggestionsEngineRunner _q_sendStateForStep:](a2, CFSTR("willSleep"));
        }
        GEOFindOrCreateLog();
        v16 = (id)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
        {
          objc_msgSend((id)a2, "uniqueName");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = *(double *)(a2 + 160);
          objc_msgSend(v3, "uniqueName");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v22 = 138412802;
          v23 = v17;
          v24 = 2112;
          v25 = v18;
          v26 = 2112;
          v27 = v19;
          _os_log_impl(&dword_1A427D000, v16, OS_LOG_TYPE_DEBUG, "{%@} is within the minSleepTime window. Will run after %@. Ignoring Trigger: %@", (uint8_t *)&v22, 0x20u);

        }
      }
      -[MapsSuggestionsEngineRunner _q_sendStateForStep:](a2, CFSTR("ignoredTrigger"));
LABEL_19:
      v20 = *(void **)(a2 + 168);
      *(_QWORD *)(a2 + 168) = 0;

      v21 = *(void **)(a2 + 176);
      *(_QWORD *)(a2 + 176) = 0;

      goto LABEL_20;
    }
    if ((-[MapsSuggestionsEngineRunner _q_passedAllConditions](a2) & 1) == 0)
    {
      GEOFindOrCreateLog();
      v14 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      {
        objc_msgSend((id)a2, "uniqueName");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = 138412290;
        v23 = v15;
        _os_log_impl(&dword_1A427D000, v14, OS_LOG_TYPE_DEBUG, "{%@} failed at least one Condition. Continuing sleep.", (uint8_t *)&v22, 0xCu);

      }
      goto LABEL_19;
    }
    -[MapsSuggestionsEngineRunner _q_updateMinSleep](a2);
    GEOFindOrCreateLog();
    v12 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend((id)a2, "uniqueName");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = 138412290;
      v23 = v13;
      _os_log_impl(&dword_1A427D000, v12, OS_LOG_TYPE_DEBUG, "{%@} is allowed to run!", (uint8_t *)&v22, 0xCu);

    }
    -[MapsSuggestionsEngineRunner _q_startRunBecauseOfTrigger:](a2, v3);
  }
LABEL_20:

}

void __46__MapsSuggestionsEngineRunner__q_fetchEntries__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void **WeakRetained;
  NSObject *v8;
  char *v9;
  NSObject *v10;
  NSObject *v11;
  char *v12;
  char *v13;
  void *v14;
  NSObject *v15;
  _QWORD v16[5];
  NSObject *v17;
  uint8_t buf[4];
  char *v19;
  __int16 v20;
  _WORD v21[17];

  *(_QWORD *)&v21[13] = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  WeakRetained = (void **)objc_loadWeakRetained((id *)(a1 + 32));
  if (!WeakRetained)
  {
    GEOFindOrCreateLog();
    v10 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      v19 = "MapsSuggestionsEngineRunner.mm";
      v20 = 1026;
      *(_DWORD *)v21 = 680;
      v21[2] = 2082;
      *(_QWORD *)&v21[3] = "-[MapsSuggestionsEngineRunner _q_fetchEntries]_block_invoke";
      _os_log_impl(&dword_1A427D000, v10, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", buf, 0x1Cu);
    }
    goto LABEL_12;
  }
  if (!v5 || v6)
  {
    GEOFindOrCreateLog();
    v10 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(WeakRetained, "uniqueName");
      v13 = (char *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v19 = v13;
      v20 = 2112;
      *(_QWORD *)v21 = v6;
      _os_log_impl(&dword_1A427D000, v10, OS_LOG_TYPE_ERROR, "%@: Error fetching Entries: %@", buf, 0x16u);

    }
LABEL_12:

    goto LABEL_17;
  }
  GEOFindOrCreateLog();
  v8 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(WeakRetained, "uniqueName");
    v9 = (char *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v19 = v9;
    v20 = 1024;
    *(_DWORD *)v21 = objc_msgSend(v5, "count");
    _os_log_impl(&dword_1A427D000, v8, OS_LOG_TYPE_DEBUG, "{%@} received %u Entries", buf, 0x12u);

  }
  v10 = objc_msgSend(v5, "copy");
  objc_storeStrong(WeakRetained + 25, v10);
  if (MapsSuggestionsIsInTheFuture(WeakRetained[19]))
  {
    GEOFindOrCreateLog();
    v11 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(WeakRetained, "uniqueName");
      v12 = (char *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v19 = v12;
      _os_log_impl(&dword_1A427D000, v11, OS_LOG_TYPE_DEBUG, "{%@} is not telling anyone what it knows yet...", buf, 0xCu);

    }
  }
  else
  {
    v14 = WeakRetained[6];
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __46__MapsSuggestionsEngineRunner__q_fetchEntries__block_invoke_67;
    v16[3] = &unk_1E4BD1320;
    v16[4] = WeakRetained;
    v15 = v10;
    v17 = v15;
    objc_msgSend(v14, "callBlock:", v16);

    v10 = v15;
  }
LABEL_17:

}

uint64_t __46__MapsSuggestionsEngineRunner__q_fetchEntries__block_invoke_67(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "engineRunner:receivedEntries:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

- (void)invalidateForMapsSuggestionsManager:(id)a3
{
  NSObject *v4;
  void *v5;
  int v6;
  void *v7;
  __int16 v8;
  const char *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  GEOFindOrCreateLog();
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    -[MapsSuggestionsEngineRunner uniqueName](self, "uniqueName");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = 138412546;
    v7 = v5;
    v8 = 2080;
    v9 = "-[MapsSuggestionsEngineRunner invalidateForMapsSuggestionsManager:]";
    _os_log_impl(&dword_1A427D000, v4, OS_LOG_TYPE_DEBUG, "{%@} %s", (uint8_t *)&v6, 0x16u);

  }
  MSg::Queue::async<MapsSuggestionsEngineRunner>((NSObject **)&self->_queue, self, &__block_literal_global_69);
}

void __67__MapsSuggestionsEngineRunner_invalidateForMapsSuggestionsManager___block_invoke(uint64_t a1, uint64_t a2)
{
  -[MapsSuggestionsEngineRunner _q_fetchEntries](a2);
}

- (id)nameForJSON
{
  return self->_config.circuits;
}

void __51__MapsSuggestionsEngineRunner__q_sendStateForStep___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  NSObject *v5;
  int v6;
  char *v7;
  __int16 v8;
  int v9;
  __int16 v10;
  const char *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    objc_msgSend(v3, "engineRunner:step:jsonDict:", WeakRetained, *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
  }
  else
  {
    GEOFindOrCreateLog();
    v5 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v6 = 136446722;
      v7 = "MapsSuggestionsEngineRunner.mm";
      v8 = 1026;
      v9 = 749;
      v10 = 2082;
      v11 = "-[MapsSuggestionsEngineRunner _q_sendStateForStep:]_block_invoke";
      _os_log_impl(&dword_1A427D000, v5, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", (uint8_t *)&v6, 0x1Cu);
    }

  }
}

- (id)objectForJSON
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __44__MapsSuggestionsEngineRunner_objectForJSON__block_invoke;
  v3[3] = &unk_1E4BCDE20;
  v3[4] = self;
  MSg::Queue::syncIfDifferent<NSDictionary<NSString *,objc_object  {objcproto22MapsSuggestionsAnyJSON}*> * {__strong}>((NSObject **)&self->_queue, v3);
  return (id)objc_claimAutoreleasedReturnValue();
}

id __44__MapsSuggestionsEngineRunner_objectForJSON__block_invoke(uint64_t a1)
{
  uint64_t v1;
  NSDate *v2;
  CLLocation *v3;
  NSDate *v4;
  NSDate *v5;
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v22;
  void *v23;
  MSg *v24;
  MSg *v25;
  void *v26;
  void *v27;
  MSg *v28;
  MSg *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  MSg *v39;
  MSg *v40;
  void *v41;
  void *v42;
  id v43;
  id v44;
  void *v45;
  id v46[15];
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  _QWORD v51[10];
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  _BYTE v62[128];
  uint64_t v63;

  v63 = *MEMORY[0x1E0C80C00];
  v1 = a1 + 32;
  v51[0] = CFSTR("now");
  MapsSuggestionsNow();
  v28 = (MSg *)objc_claimAutoreleasedReturnValue();
  MSg::jsonFor(v28, v2);
  v52 = objc_claimAutoreleasedReturnValue();
  v51[1] = CFSTR("location");
  v27 = (void *)v52;
  MapsSuggestionsCurrentBestLocation();
  v29 = (MSg *)objc_claimAutoreleasedReturnValue();
  MSg::jsonFor(v29, v3);
  v53 = objc_claimAutoreleasedReturnValue();
  v51[2] = CFSTR("minSilenceDate");
  v24 = v39;
  v30 = (void *)v53;
  MSg::jsonFor(v39, v4);
  v54 = objc_claimAutoreleasedReturnValue();
  v51[3] = CFSTR("earliestRunDate");
  v25 = v40;
  v31 = (void *)v54;
  MSg::jsonFor(v40, v5);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v55 = v32;
  v51[4] = CFSTR("stopRunTimer");
  v6 = v43;
  v36 = v6;
  if (v6)
    objc_msgSend(v6, "objectForJSON");
  else
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v37 = (void *)objc_claimAutoreleasedReturnValue();

  v56 = v37;
  v51[5] = CFSTR("wakeUpTimer");
  v7 = v44;
  v8 = v7;
  if (v7)
    objc_msgSend(v7, "objectForJSON");
  else
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v38 = (void *)objc_claimAutoreleasedReturnValue();

  v57 = v38;
  v51[6] = CFSTR("entries");
  v26 = v45;
  MSg::jsonFor(v45);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v58 = v33;
  v51[7] = CFSTR("firedTriggerName");
  v23 = v41;
  MSg::jsonFor(v41);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v59 = v34;
  v51[8] = CFSTR("failedConditionName");
  v22 = v42;
  MSg::jsonFor(v42);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v60 = v35;
  v51[9] = CFSTR("conditions");
  v9 = v46[11];
  if (v9)
  {
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", objc_msgSend(v9, "count"));
    v49 = 0u;
    v50 = 0u;
    v47 = 0u;
    v48 = 0u;
    v11 = v9;
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v47, v62, 16);
    if (v12)
    {
      v13 = *(_QWORD *)v48;
      do
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v48 != v13)
            objc_enumerationMutation(v11);
          v15 = *(id *)(*((_QWORD *)&v47 + 1) + 8 * i);
          v16 = v15;
          if (v15)
            objc_msgSend(v15, "objectForJSON");
          else
            objc_msgSend(MEMORY[0x1E0C99E38], "null");
          v17 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v16, "nameForJSON");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "setObject:forKeyedSubscript:", v17, v18);

        }
        v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v47, v62, 16);
      }
      while (v12);
    }

    v19 = (void *)objc_msgSend(v10, "copy");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
  }

  v61 = v19;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v52, v51, 10);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  return v20;
}

- (MapsSuggestionsTimer)wakeUpTimer
{
  return self->_wakeUpTimer;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_wakeUpTimer, 0);

  objc_storeStrong((id *)&self->_engine, 0);
}

- (id).cxx_construct
{
  self->_queue._innerQueue = 0;
  self->_queue._name = 0;
  *(_OWORD *)&self->_config.circuits = 0u;
  *(_OWORD *)&self->_config.conditions = 0u;
  *(_QWORD *)&self->_anon_38[64] = 0;
  *(_QWORD *)&self->_anon_38[72] = 0;
  *(_QWORD *)&self->_anon_38[56] = 0;
  objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
  self->_state.firedTriggerName = (NSString *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
  self->_state.failedConditionName = (NSString *)objc_claimAutoreleasedReturnValue();
  *(_OWORD *)&self->_state.lastError = 0u;
  *(_OWORD *)self->_anon_b8 = 0u;
  *(_QWORD *)&self->_anon_b8[16] = 0;
  return self;
}

@end
