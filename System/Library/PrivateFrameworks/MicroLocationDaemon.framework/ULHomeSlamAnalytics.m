@implementation ULHomeSlamAnalytics

+ (id)shared
{
  id v3;
  _QWORD block[5];

  if (ULSettings::get<ULSettings::LogOdometryAnalyticsEnabled>())
  {
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __29__ULHomeSlamAnalytics_shared__block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0l;
    block[4] = a1;
    if (+[ULHomeSlamAnalytics shared]::onceToken != -1)
      dispatch_once(&+[ULHomeSlamAnalytics shared]::onceToken, block);
    v3 = (id)+[ULHomeSlamAnalytics shared]::sharedInstance;
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

void __29__ULHomeSlamAnalytics_shared__block_invoke(uint64_t a1)
{
  id v1;
  void *v2;

  v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)+[ULHomeSlamAnalytics shared]::sharedInstance;
  +[ULHomeSlamAnalytics shared]::sharedInstance = (uint64_t)v1;

}

- (ULHomeSlamAnalytics)init
{
  ULHomeSlamAnalytics *v2;
  NSObject *v3;
  dispatch_queue_t v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)ULHomeSlamAnalytics;
  v2 = -[ULHomeSlamAnalytics init](&v6, sel_init);
  if (v2)
  {
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = dispatch_queue_create("com.apple.milod.homeSlamAnalytics", v3);
    -[ULHomeSlamAnalytics setQueue:](v2, "setQueue:", v4);

  }
  return v2;
}

- (void)setDependenciesAndRegisterToBackgroundTaskWithDB:(ULDatabase *)a3 environment:(id)a4
{
  id v6;
  NSObject *v7;
  id v8;
  _QWORD block[5];
  id v10;
  ULDatabase *v11;

  v6 = a4;
  -[ULHomeSlamAnalytics queue](self, "queue");
  v7 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __84__ULHomeSlamAnalytics_setDependenciesAndRegisterToBackgroundTaskWithDB_environment___block_invoke;
  block[3] = &unk_2511D4628;
  v10 = v6;
  v11 = a3;
  block[4] = self;
  v8 = v6;
  dispatch_async(v7, block);

}

uint64_t __84__ULHomeSlamAnalytics_setDependenciesAndRegisterToBackgroundTaskWithDB_environment___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setDb:", *(_QWORD *)(a1 + 48));
  objc_msgSend(*(id *)(a1 + 32), "setEnvironment:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "_registerForBackgroundTask");
  return objc_msgSend(*(id *)(a1 + 32), "setDependenciesSet:", 1);
}

- (void)resetDependencies
{
  NSObject *v3;
  _QWORD block[5];

  -[ULHomeSlamAnalytics queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __40__ULHomeSlamAnalytics_resetDependencies__block_invoke;
  block[3] = &unk_2511D4650;
  block[4] = self;
  dispatch_async(v3, block);

}

uint64_t __40__ULHomeSlamAnalytics_resetDependencies__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setDb:", 0);
  objc_msgSend(*(id *)(a1 + 32), "setEnvironment:", 0);
  objc_msgSend(*(id *)(a1 + 32), "_unregisterForBackgroundTask");
  return objc_msgSend(*(id *)(a1 + 32), "setDependenciesSet:", 0);
}

- (void)dealloc
{
  objc_super v3;

  -[ULHomeSlamAnalytics _unregisterForBackgroundTask](self, "_unregisterForBackgroundTask");
  v3.receiver = self;
  v3.super_class = (Class)ULHomeSlamAnalytics;
  -[ULHomeSlamAnalytics dealloc](&v3, sel_dealloc);
}

- (uint64_t)logEventDaemonStartedAtTimestamp:(void *)a1
{
  return objc_msgSend(a1, "_logEventType:atTimestamp:", 4);
}

- (uint64_t)logEventScreenOnAtTimestamp:(void *)a1
{
  return objc_msgSend(a1, "_logEventType:atTimestamp:", 0);
}

- (uint64_t)logEventScreenOffAtTimestamp:(void *)a1
{
  return objc_msgSend(a1, "_logEventType:atTimestamp:", 1);
}

- (uint64_t)logEventOdometryStartedAtTimestamp:(void *)a1
{
  return objc_msgSend(a1, "_logEventType:atTimestamp:", 2);
}

- (uint64_t)logEventOdometryStoppedAtTimestamp:(void *)a1
{
  return objc_msgSend(a1, "_logEventType:atTimestamp:", 3);
}

- (uint64_t)logEventEnterHomeLOIAtTimestamp:(void *)a1
{
  return objc_msgSend(a1, "_logEventType:atTimestamp:", 5);
}

- (uint64_t)logEventExitHomeLOIAtTimestamp:(void *)a1
{
  return objc_msgSend(a1, "_logEventType:atTimestamp:", 6);
}

- (void)_logEventType:(uint64_t)a3 atTimestamp:(__int16)a4
{
  NSObject *v7;
  _QWORD block[6];
  __int16 v9;

  objc_msgSend(a1, "queue");
  v7 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __49__ULHomeSlamAnalytics__logEventType_atTimestamp___block_invoke;
  block[3] = &unk_2511D4678;
  v9 = a4;
  *(double *)&block[5] = a2;
  block[4] = a1;
  dispatch_async(v7, block);

}

void __49__ULHomeSlamAnalytics__logEventType_atTimestamp___block_invoke(uint64_t a1)
{
  id v2;
  _WORD *v3;
  void *__p;
  void *v5;
  char *v6;
  uint64_t v7;
  __int16 v8;

  CLMiLoHomeSlamAnalyticEventTable::Entry::Entry((uint64_t)&v7, *(_WORD *)(a1 + 48), *(double *)(a1 + 40));
  v2 = *(id *)(objc_msgSend(*(id *)(a1 + 32), "db") + 128);
  v3 = operator new(0x10uLL);
  v5 = v3 + 8;
  v6 = (char *)(v3 + 8);
  *(_QWORD *)v3 = v7;
  v3[4] = v8;
  __p = v3;
  objc_msgSend(v2, "insertEntries:", &__p);
  if (__p)
  {
    v5 = __p;
    operator delete(__p);
  }

}

- (void)_registerForBackgroundTask
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v7[4];
  id v8;
  id location;

  objc_initWeak(&location, self);
  -[ULHomeSlamAnalytics environment](self, "environment");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "backgroundSystemTaskManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ULHomeSlamAnalytics _createBGTRequest](self, "_createBGTRequest");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ULHomeSlamAnalytics queue](self, "queue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __49__ULHomeSlamAnalytics__registerForBackgroundTask__block_invoke;
  v7[3] = &unk_2511D46A0;
  objc_copyWeak(&v8, &location);
  objc_msgSend(v4, "registerAndSubmitTaskWithRequest:usingQueue:launchHandler:", v5, v6, v7);

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

void __49__ULHomeSlamAnalytics__registerForBackgroundTask__block_invoke(uint64_t a1)
{
  NSObject *v1;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "queue");
    v1 = objc_claimAutoreleasedReturnValue();
    dispatch_assert_queue_V2(v1);

    objc_msgSend(WeakRetained, "_runStopDetectionAnalyticsTask");
  }

}

- (void)_unregisterForBackgroundTask
{
  void *v2;
  id v3;

  -[ULHomeSlamAnalytics environment](self, "environment");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "backgroundSystemTaskManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "deregisterAndCancelTaskWithIdentifier:", CFSTR("com.apple.milod.homeSlamAnalytics"));

}

- (id)_createBGTRequest
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  int v6;
  int v7;
  ULBGRepeatingSystemTaskRequest *v8;

  +[ULDefaultsSingleton shared](ULDefaultsSingleton, "shared");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "defaultsDictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "ULHomeSlamAnalyticsInterval");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    v6 = objc_msgSend(v5, "intValue");
  else
    v6 = objc_msgSend(&unk_2511ED690, "intValue");
  v7 = v6;

  v8 = -[ULBGRepeatingSystemTaskRequest initWithIdentifier:interval:minDurationBetweenInstances:]([ULBGRepeatingSystemTaskRequest alloc], "initWithIdentifier:interval:minDurationBetweenInstances:", CFSTR("com.apple.milod.homeSlamAnalytics"), (double)v7, (double)v7 * 0.8);
  -[ULBGSystemTaskRequest setPriority:](v8, "setPriority:", 1);
  -[ULBGSystemTaskRequest setRequiresProtectionClass:](v8, "setRequiresProtectionClass:", 0);
  -[ULBGSystemTaskRequest setResourceIntensive:](v8, "setResourceIntensive:", 1);
  -[ULBGSystemTaskRequest setResources:](v8, "setResources:", 7);
  -[ULBGSystemTaskRequest setRequiresBuddyComplete:](v8, "setRequiresBuddyComplete:", 1);
  -[ULBGSystemTaskRequest setRequiresUserInactivity:](v8, "setRequiresUserInactivity:", 1);
  -[ULBGSystemTaskRequest setPostInstall:](v8, "setPostInstall:", 0);
  return v8;
}

- (void)_runStopDetectionAnalyticsTask
{
  ULHomeSlamAnalyticEventAnalyzer *v3;
  void *v4;
  NSObject *v5;
  NSObject *v6;
  int v7;
  int v8;
  __int16 v9;
  const char *v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  if ((ULSettings::get<ULSettings::LogOdometryAnalyticsEnabled>() & 1) != 0)
  {
    v3 = -[ULHomeSlamAnalyticEventAnalyzer initWithDB:]([ULHomeSlamAnalyticEventAnalyzer alloc], "initWithDB:", -[ULHomeSlamAnalytics db](self, "db"));
    -[ULHomeSlamAnalyticEventAnalyzer runStopDetectionAnalysisAtTimepoint:](v3, "runStopDetectionAnalysisAtTimepoint:", cl::chrono::CFAbsoluteTimeClock::now());
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (onceToken_MicroLocation_Default != -1)
      dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_33);
    v5 = (id)logObject_MicroLocation_Default;
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v7 = 68289282;
      v8 = 0;
      v9 = 2082;
      v10 = "";
      v11 = 2082;
      v12 = objc_msgSend(CFSTR("com.apple.MicroLocation.AllDayTriggers"), "UTF8String");
      _os_log_impl(&dword_2419D9000, v5, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"sending CoreAnalytics event\", \"event type\":%{public, location:escape_only}s}", (uint8_t *)&v7, 0x1Cu);
    }

    AnalyticsSendEvent();
  }
  else
  {
    if (onceToken_MicroLocation_Default != -1)
      dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_33);
    v6 = logObject_MicroLocation_Default;
    if (os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_DEFAULT))
    {
      v7 = 68289026;
      v8 = 0;
      v9 = 2082;
      v10 = "";
      _os_log_impl(&dword_2419D9000, v6, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"not running homeslam analytics, since sending to core-analytics is disabled\"}", (uint8_t *)&v7, 0x12u);
    }
  }
}

- (ULDatabase)db
{
  return self->_db;
}

- (void)setDb:(ULDatabase *)a3
{
  self->_db = a3;
}

- (ULEnvironment)environment
{
  return self->_environment;
}

- (void)setEnvironment:(id)a3
{
  objc_storeStrong((id *)&self->_environment, a3);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (BOOL)dependenciesSet
{
  return self->_dependenciesSet;
}

- (void)setDependenciesSet:(BOOL)a3
{
  self->_dependenciesSet = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_environment, 0);
}

@end
