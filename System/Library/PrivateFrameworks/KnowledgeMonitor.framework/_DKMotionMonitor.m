@implementation _DKMotionMonitor

+ (id)log
{
  if (log_onceToken != -1)
    dispatch_once(&log_onceToken, &__block_literal_global);
  return (id)log_log;
}

+ (id)eventStream
{
  return CFSTR("MotionState");
}

+ (id)entitlements
{
  return &unk_24DA70DD8;
}

+ (id)_eventWithState:(id)a3 startDate:(id)a4 endDate:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v18;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  objc_msgSend(MEMORY[0x24BE1B0C8], "unknown");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "unsignedIntValue") == 2)
  {
    objc_msgSend(MEMORY[0x24BE1B0C8], "walking");
    v11 = objc_claimAutoreleasedReturnValue();
  }
  else if (objc_msgSend(v7, "unsignedIntValue") == 1)
  {
    objc_msgSend(MEMORY[0x24BE1B0C8], "stationary");
    v11 = objc_claimAutoreleasedReturnValue();
  }
  else if (objc_msgSend(v7, "unsignedIntValue") == 3)
  {
    objc_msgSend(MEMORY[0x24BE1B0C8], "running");
    v11 = objc_claimAutoreleasedReturnValue();
  }
  else if (objc_msgSend(v7, "unsignedIntValue") == 4)
  {
    objc_msgSend(MEMORY[0x24BE1B0C8], "cycling");
    v11 = objc_claimAutoreleasedReturnValue();
  }
  else if (objc_msgSend(v7, "unsignedIntValue") == 5)
  {
    objc_msgSend(MEMORY[0x24BE1B0C8], "automotive");
    v11 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (objc_msgSend(v7, "unsignedIntValue") != 6)
      goto LABEL_14;
    objc_msgSend(MEMORY[0x24BE1B0C8], "stationaryAutomotive");
    v11 = objc_claimAutoreleasedReturnValue();
  }
  v12 = (void *)v11;

  v10 = v12;
LABEL_14:
  v13 = (void *)MEMORY[0x24BE1B080];
  objc_msgSend(MEMORY[0x24BE1B130], "motionStream");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v8;
  if (v8)
  {
    if (v9)
      goto LABEL_16;
LABEL_20:
    objc_msgSend(MEMORY[0x24BDBCE60], "distantFuture");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "eventWithStream:startDate:endDate:value:", v14, v15, v18, v10);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
      goto LABEL_18;
    goto LABEL_17;
  }
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v9)
    goto LABEL_20;
LABEL_16:
  objc_msgSend(v13, "eventWithStream:startDate:endDate:value:", v14, v15, v9, v10);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)
LABEL_17:

LABEL_18:
  return v16;
}

- (id)classesForSecureStateDecoding
{
  return (id)objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", objc_opt_class());
}

+ (BOOL)shouldMergeUnchangedEvents
{
  return 1;
}

- (_DKMotionMonitor)init
{
  return (_DKMotionMonitor *)-[_DKMotionMonitor initForUnitTest:](self, "initForUnitTest:", 0);
}

- (id)initForUnitTest:(BOOL)a3
{
  _DKMotionMonitor *v4;
  _DKMotionMonitor *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  BMSource *source;
  CMMotionActivityManager *v15;
  CMMotionActivityManager *activityManager;
  int v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  char v22;
  NSOperationQueue *v23;
  NSOperationQueue *operationQueue;
  NSOperationQueue *v25;
  void *v26;
  NSObject *v27;
  dispatch_source_t v28;
  OS_dispatch_source *motionStateProcessingTimer;
  NSObject *v30;
  _QWORD handler[4];
  _DKMotionMonitor *v33;
  objc_super v34;

  v34.receiver = self;
  v34.super_class = (Class)_DKMotionMonitor;
  v4 = -[_DKMonitor init](&v34, sel_init);
  v5 = v4;
  if (v4)
  {
    -[_DKMonitor instantState](v4, "instantState");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("kMotionStateBuffer"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v7)
    {
      objc_msgSend(MEMORY[0x24BDBCEB8], "array");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[_DKMonitor instantState](v5, "instantState");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setObject:forKeyedSubscript:", v8, CFSTR("kMotionStateBuffer"));

    }
    if (objc_msgSend(MEMORY[0x24BDC13F8], "isActivityAvailable"))
    {
      v5->_monitoringActivity = 1;
      v5->_activateTimer = 1;
      v5->_currentDominantMotionState = 0;
      BiomeLibrary();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "Motion");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "Activity");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "source");
      v13 = objc_claimAutoreleasedReturnValue();
      source = v5->_source;
      v5->_source = (BMSource *)v13;

      if (a3)
      {
        v5->_dominantActivityInterval = 2.0;
      }
      else
      {
        v5->_dominantActivityInterval = 60.0;
        v15 = (CMMotionActivityManager *)objc_alloc_init(MEMORY[0x24BDC13F8]);
        activityManager = v5->_activityManager;
        v5->_activityManager = v15;

        if ((objc_msgSend(MEMORY[0x24BE1AFA0], "isRunningOnInternalBuild") & 1) != 0)
        {
          v17 = 1;
        }
        else
        {
          objc_msgSend(MEMORY[0x24BDC1548], "defaultWorkspace");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = objc_msgSend(v18, "applicationIsInstalled:", CFSTR("com.appleuserstudies.flubber"));

        }
        objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = v19;
        if (v17)
        {
          objc_msgSend(v19, "objectForKey:", CFSTR("_DKCDisableMotionMonitor"));
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          if (v21)
            v22 = objc_msgSend(v20, "BOOLForKey:", CFSTR("_DKCDisableMotionMonitor")) ^ 1;
          else
            v22 = 1;
          v5->_shouldRecordMotion = v22;

        }
        else
        {
          v5->_shouldRecordMotion = 0;
        }

      }
      v23 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x24BDD1710]);
      operationQueue = v5->_operationQueue;
      v5->_operationQueue = v23;

      v25 = v5->_operationQueue;
      -[_DKMonitor queue](v5, "queue");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSOperationQueue setUnderlyingQueue:](v25, "setUnderlyingQueue:", v26);

      -[_DKMonitor queue](v5, "queue");
      v27 = objc_claimAutoreleasedReturnValue();
      v28 = dispatch_source_create(MEMORY[0x24BDACA18], 0, 0, v27);
      motionStateProcessingTimer = v5->_motionStateProcessingTimer;
      v5->_motionStateProcessingTimer = (OS_dispatch_source *)v28;

      v30 = v5->_motionStateProcessingTimer;
      handler[0] = MEMORY[0x24BDAC760];
      handler[1] = 3221225472;
      handler[2] = __36___DKMotionMonitor_initForUnitTest___block_invoke;
      handler[3] = &unk_24DA66D10;
      v33 = v5;
      dispatch_source_set_event_handler(v30, handler);
      dispatch_source_set_timer((dispatch_source_t)v5->_motionStateProcessingTimer, 0, (unint64_t)(v5->_dominantActivityInterval * 1000000000.0), 0x3B9ACA00uLL);
      dispatch_activate((dispatch_object_t)v5->_motionStateProcessingTimer);

    }
  }
  return v5;
}

- (void)dealloc
{
  objc_super v3;

  -[_DKMotionMonitor deactivate](self, "deactivate");
  v3.receiver = self;
  v3.super_class = (Class)_DKMotionMonitor;
  -[_DKMonitor dealloc](&v3, sel_dealloc);
}

- (void)start
{
  void *v3;
  void *v4;
  CMMotionActivityManager *activityManager;
  NSOperationQueue *operationQueue;
  uint64_t v7;
  CMMotionActivityManager *v8;
  NSOperationQueue *v9;
  _QWORD v10[5];
  id v11;
  _QWORD v12[4];
  id v13;
  id location;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)_DKMotionMonitor;
  if (-[_DKMonitor instantMonitorNeedsActivation](&v15, sel_instantMonitorNeedsActivation))
  {
    v3 = (void *)MEMORY[0x219A29278]();
    if (self->_monitoringActivity)
    {
      objc_initWeak(&location, self);
      objc_msgSend(MEMORY[0x24BDBCE60], "date");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      activityManager = self->_activityManager;
      operationQueue = self->_operationQueue;
      v7 = MEMORY[0x24BDAC760];
      v12[0] = MEMORY[0x24BDAC760];
      v12[1] = 3221225472;
      v12[2] = __25___DKMotionMonitor_start__block_invoke;
      v12[3] = &unk_24DA66D38;
      objc_copyWeak(&v13, &location);
      -[CMMotionActivityManager queryActivityStartingFromDate:toDate:toQueue:withHandler:](activityManager, "queryActivityStartingFromDate:toDate:toQueue:withHandler:", v4, v4, operationQueue, v12);
      v8 = self->_activityManager;
      v9 = self->_operationQueue;
      v10[0] = v7;
      v10[1] = 3221225472;
      v10[2] = __25___DKMotionMonitor_start__block_invoke_2;
      v10[3] = &unk_24DA66D88;
      objc_copyWeak(&v11, &location);
      v10[4] = self;
      -[CMMotionActivityManager startActivityUpdatesToQueue:withHandler:](v8, "startActivityUpdatesToQueue:withHandler:", v9, v10);
      objc_destroyWeak(&v11);
      objc_destroyWeak(&v13);

      objc_destroyWeak(&location);
    }
    objc_autoreleasePoolPop(v3);
  }
}

- (void)stop
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_DKMotionMonitor;
  if (-[_DKMonitor instantMonitorNeedsDeactivation](&v3, sel_instantMonitorNeedsDeactivation))
    -[_DKMotionMonitor deactivate](self, "deactivate");
}

- (void)deactivate
{
  void *v3;

  v3 = (void *)MEMORY[0x219A29278](self, a2);
  if (self->_monitoringActivity)
  {
    dispatch_source_cancel((dispatch_source_t)self->_motionStateProcessingTimer);
    self->_monitoringActivity = 0;
    -[CMMotionActivityManager stopActivityUpdates](self->_activityManager, "stopActivityUpdates");
  }
  objc_autoreleasePoolPop(v3);
}

- (void)synchronouslyReflectCurrentValue
{
  void *v3;
  void *v4;
  id v5;

  if (objc_msgSend(MEMORY[0x24BDC13F8], "isActivityAvailable"))
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", self->_currentDominantMotionState);
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BE1B170], "userContext");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BE1B180], "keyPathForMotionState");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, v4);

  }
}

- (void)addMotionActivity:(id)a3
{
  id v4;
  void *v5;
  unint64_t v6;
  _DKTemporalNumericState *v7;
  void *v8;
  void *v9;
  _DKTemporalNumericState *v10;
  id v11;

  v4 = a3;
  if (v4)
  {
    v11 = v4;
    objc_msgSend(v4, "startDate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    v4 = v11;
    if (v5)
    {
      v6 = +[_DKMotionMonitor _activityTypeToMotionState:](_DKMotionMonitor, "_activityTypeToMotionState:", v11);
      v7 = [_DKTemporalNumericState alloc];
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", v6);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "startDate");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = -[_DKTemporalNumericState initWithState:timestamp:](v7, "initWithState:timestamp:", v8, v9);

      -[_DKMotionMonitor addState:](self, "addState:", v10);
      v4 = v11;
    }
  }

}

- (void)addState:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *motionStateProcessingTimer;
  dispatch_time_t v9;
  id v10;

  v10 = a3;
  v4 = (void *)os_transaction_create();
  v5 = (void *)MEMORY[0x219A29278]();
  -[_DKMonitor instantState](self, "instantState");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("kMotionStateBuffer"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (self->_activateTimer)
  {
    self->_activateTimer = 0;
    motionStateProcessingTimer = self->_motionStateProcessingTimer;
    v9 = dispatch_time(0, (uint64_t)(self->_dominantActivityInterval * 1000000000.0));
    dispatch_source_set_timer(motionStateProcessingTimer, v9, 0xFFFFFFFFFFFFFFFFLL, 0x3B9ACA00uLL);
  }
  objc_msgSend(v7, "addObject:", v10);

  objc_autoreleasePoolPop(v5);
}

- (void)computeDominantMotionState
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  unint64_t currentDominantMotionState;
  void *v16;
  _BOOL4 v17;
  void *v18;
  void *v19;
  _QWORD v20[6];
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t v24;
  _QWORD v25[4];
  _QWORD v26[4];
  id v27;
  _QWORD *v28;
  _QWORD v29[5];
  id v30;

  v3 = (void *)os_transaction_create();
  v4 = (void *)MEMORY[0x219A29278]();
  -[_DKMonitor instantState](self, "instantState");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("kMotionStateBuffer"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v29[0] = 0;
  v29[1] = v29;
  v29[2] = 0x3032000000;
  v29[3] = __Block_byref_object_copy_;
  v29[4] = __Block_byref_object_dispose_;
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = MEMORY[0x24BDAC760];
  v30 = v8;
  v26[0] = MEMORY[0x24BDAC760];
  v26[1] = 3221225472;
  v26[2] = __46___DKMotionMonitor_computeDominantMotionState__block_invoke;
  v26[3] = &unk_24DA66DB0;
  v28 = v29;
  v10 = v7;
  v27 = v10;
  objc_msgSend(v6, "enumerateObjectsWithOptions:usingBlock:", 2, v26);
  v25[0] = 0;
  v25[1] = v25;
  v25[2] = 0x2020000000;
  v25[3] = 0x10000000000000;
  v21 = 0;
  v22 = &v21;
  v23 = 0x2020000000;
  v24 = 0;
  v20[0] = v9;
  v20[1] = 3221225472;
  v20[2] = __46___DKMotionMonitor_computeDominantMotionState__block_invoke_42;
  v20[3] = &unk_24DA66DD8;
  v20[4] = v25;
  v20[5] = &v21;
  objc_msgSend(v10, "enumerateKeysAndObjectsUsingBlock:", v20);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v22[3]);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE1B170], "userContext");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE1B180], "keyPathForMotionState");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setObject:forKeyedSubscript:", v11, v13);

  self->_currentDominantMotionState = v22[3];
  self->_activateTimer = 1;
  objc_msgSend(v6, "lastObject");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)objc_msgSend(v6, "count") < 2)
  {
    v17 = 0;
  }
  else
  {
    currentDominantMotionState = self->_currentDominantMotionState;
    objc_msgSend(v14, "state");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = currentDominantMotionState != objc_msgSend(v16, "unsignedLongLongValue");

  }
  objc_msgSend(v6, "removeAllObjects");
  if (v17)
    -[_DKMotionMonitor addState:](self, "addState:", v14);
  -[_DKMonitor saveState](self, "saveState");
  if (self->_shouldRecordMotion)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v22[3]);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    +[_DKMotionMonitor _eventWithState:startDate:endDate:](_DKMotionMonitor, "_eventWithState:startDate:endDate:", v18, 0, 0);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[_DKMonitor setCurrentEvent:inferHistoricalState:](self, "setCurrentEvent:inferHistoricalState:", v19, 1);

  }
  _Block_object_dispose(&v21, 8);
  _Block_object_dispose(v25, 8);

  _Block_object_dispose(v29, 8);
  objc_autoreleasePoolPop(v4);

}

- (void)update
{
  NSObject *v3;
  void *v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;
  uint8_t buf[16];

  +[_DKMotionMonitor log](_DKMotionMonitor, "log");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_219056000, v3, OS_LOG_TYPE_DEFAULT, "Periodic update starting", buf, 2u);
  }

  v4 = (void *)os_transaction_create();
  -[_DKMonitor queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __26___DKMotionMonitor_update__block_invoke;
  v7[3] = &unk_24DA66D60;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

+ (unint64_t)_activityTypeToMotionState:(id)a3
{
  id v3;
  unint64_t v4;
  int v5;
  unsigned int v6;
  uint64_t v7;

  v3 = a3;
  if ((objc_msgSend(v3, "walking") & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "cycling") & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "running") & 1) != 0)
  {
    v4 = 3;
  }
  else
  {
    v5 = objc_msgSend(v3, "automotive");
    v6 = objc_msgSend(v3, "stationary");
    v7 = 5;
    if (v6)
      v7 = 6;
    if (v5)
      v4 = v7;
    else
      v4 = v6;
  }

  return v4;
}

- (BOOL)monitoringActivity
{
  return self->_monitoringActivity;
}

- (void)setMonitoringActivity:(BOOL)a3
{
  self->_monitoringActivity = a3;
}

- (BOOL)shouldRecordMotion
{
  return self->_shouldRecordMotion;
}

- (void)setShouldRecordMotion:(BOOL)a3
{
  self->_shouldRecordMotion = a3;
}

- (int64_t)lastReportedMotionState
{
  return self->_lastReportedMotionState;
}

- (void)setLastReportedMotionState:(int64_t)a3
{
  self->_lastReportedMotionState = a3;
}

- (CMMotionActivityManager)activityManager
{
  return self->_activityManager;
}

- (void)setActivityManager:(id)a3
{
  objc_storeStrong((id *)&self->_activityManager, a3);
}

- (NSOperationQueue)operationQueue
{
  return self->_operationQueue;
}

- (void)setOperationQueue:(id)a3
{
  objc_storeStrong((id *)&self->_operationQueue, a3);
}

- (OS_dispatch_source)motionStateProcessingTimer
{
  return self->_motionStateProcessingTimer;
}

- (void)setMotionStateProcessingTimer:(id)a3
{
  objc_storeStrong((id *)&self->_motionStateProcessingTimer, a3);
}

- (BMSource)source
{
  return self->_source;
}

- (void)setSource:(id)a3
{
  objc_storeStrong((id *)&self->_source, a3);
}

- (unint64_t)currentDominantMotionState
{
  return self->_currentDominantMotionState;
}

- (double)dominantActivityInterval
{
  return self->_dominantActivityInterval;
}

- (BOOL)activateTimer
{
  return self->_activateTimer;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_source, 0);
  objc_storeStrong((id *)&self->_motionStateProcessingTimer, 0);
  objc_storeStrong((id *)&self->_operationQueue, 0);
  objc_storeStrong((id *)&self->_activityManager, 0);
}

@end
