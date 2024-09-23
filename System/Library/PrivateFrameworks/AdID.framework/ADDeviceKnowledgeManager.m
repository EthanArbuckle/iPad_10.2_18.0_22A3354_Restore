@implementation ADDeviceKnowledgeManager

+ (id)sharedInstance
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __42__ADDeviceKnowledgeManager_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance__onceToken_4 != -1)
    dispatch_once(&sharedInstance__onceToken_4, block);
  return (id)sharedInstance__instance_4;
}

void __42__ADDeviceKnowledgeManager_sharedInstance__block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init((Class)objc_opt_class());
  v1 = (void *)sharedInstance__instance_4;
  sharedInstance__instance_4 = (uint64_t)v0;

}

- (ADDeviceKnowledgeManager)init
{
  ADDeviceKnowledgeManager *v2;
  ADDeviceKnowledgeManager *v3;
  uint64_t v4;
  NSNumber *refreshInterval;
  void *v6;
  int v7;
  void *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)ADDeviceKnowledgeManager;
  v2 = -[ADDeviceKnowledgeManager init](&v10, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_taskIsRunning = 0;
    -[ADDeviceKnowledgeManager minimumRefreshInterval](v2, "minimumRefreshInterval");
    v4 = objc_claimAutoreleasedReturnValue();
    refreshInterval = v3->_refreshInterval;
    v3->_refreshInterval = (NSNumber *)v4;

    objc_msgSend(MEMORY[0x24BE02180], "registerTaskDelegate:forRequestID:", v3, CFSTR("com.apple.ap.adprivacyd.deviceKnowledge"));
    objc_msgSend(MEMORY[0x24BE021B8], "sharedInstance");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "unitTesting");

    if (v7)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("[%@] WARNING: Check On Task has been disabled. If you see this outside of unit tests, Please file a radar..."), objc_opt_class());
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      _ADLog();
    }
    else
    {
      objc_msgSend(MEMORY[0x24BE02180], "sharedInstance");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "checkOnTask:", CFSTR("com.apple.ap.adprivacyd.deviceKnowledge"));
    }

  }
  return v3;
}

- (id)minimumRefreshInterval
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  void *v12;

  objc_msgSend(MEMORY[0x24BE7A748], "sharedAssetManagerCoordinator");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "assetManagerForPlacementType:assetManagerType:", 0, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "assetManagerForPlacementType:assetManagerType:", 0, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *MEMORY[0x24BE7A7A8];
  objc_msgSend(v3, "doubleValueForFactor:", *MEMORY[0x24BE7A7A8]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "doubleValueForFactor:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend(v6, "doubleValue");
  v10 = v9;
  objc_msgSend(v7, "doubleValue");
  if (v10 < v11)
    v11 = v10;
  objc_msgSend(v8, "numberWithDouble:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (BOOL)runTask:(id)a3
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  BOOL v11;
  ADDeviceKnowledgeManager *v12;
  void *v13;
  void *v14;
  char v15;
  void *v16;
  void *v17;
  void *v18;
  ADDeviceKnowledgeManager *v19;
  _QWORD v21[5];

  v5 = a3;
  v6 = (void *)MEMORY[0x24BDD17C8];
  v7 = objc_opt_class();
  objc_msgSend(v5, "requestIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringWithFormat:", CFSTR("[%@]: Received request to run background task %@"), v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  _ADLog();

  objc_msgSend(v5, "requestIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v7) = objc_msgSend(v10, "isEqualToString:", CFSTR("com.apple.ap.adprivacyd.deviceKnowledge"));

  v11 = 0;
  if ((_DWORD)v7)
  {
    v12 = self;
    objc_sync_enter(v12);
    if (v12->_taskIsRunning)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("[%@] ERROR: We should not be running the task twice at the same time."), objc_opt_class());
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      _ADLog();

      objc_sync_exit(v12);
      v11 = 0;
    }
    else
    {
      v12->_taskIsRunning = 1;
      objc_sync_exit(v12);

      +[ADAdTrackingSchedulingManager sharedInstance](ADAdTrackingSchedulingManager, "sharedInstance");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "isAdEnabledLocality");

      if ((v15 & 1) != 0)
      {
        objc_storeStrong((id *)&v12->_xpc_task, a3);
        if ((-[ADBackgroundTaskRequest continueTask](v12->_xpc_task, "continueTask") & 1) == 0)
        {
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("[%@] ERROR: Unable to inform the system we need to run Device Knowledge asynchronously. Please file a radar..."), objc_opt_class());
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          _ADLog();

        }
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("[%@] Taking an XPC transaction for %@"), objc_opt_class(), CFSTR("Device Knowledge In Progress"));
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        _ADLog();

        takeXPCTransaction();
        v21[0] = MEMORY[0x24BDAC760];
        v21[1] = 3221225472;
        v21[2] = __36__ADDeviceKnowledgeManager_runTask___block_invoke;
        v21[3] = &unk_24D710270;
        v21[4] = v12;
        -[ADDeviceKnowledgeManager processDeviceData:](v12, "processDeviceData:", v21);
      }
      else
      {
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("[%@]: This is not an Ad enabled country. Skipping Device Knoweldge."), objc_opt_class());
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        _ADLog();

        -[ADDeviceKnowledgeManager scheduleDeviceDataProcessing:](v12, "scheduleDeviceDataProcessing:", 86400.0);
        v19 = v12;
        objc_sync_enter(v19);
        v12->_taskIsRunning = 0;
        objc_sync_exit(v19);

      }
      v11 = 1;
    }
  }

  return v11;
}

uint64_t __36__ADDeviceKnowledgeManager_runTask___block_invoke(uint64_t a1)
{
  id *v2;
  id v3;
  double v4;
  double v5;
  void *v6;
  id v7;
  void *v8;

  if ((objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "taskIsDeferred") & 1) == 0)
  {
    if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "finishTask"))
    {
      v2 = *(id **)(a1 + 32);
      v3 = v2[3];
      if (v3 && (objc_msgSend(v3, "doubleValue"), v2 = *(id **)(a1 + 32), v4 > 0.0))
        objc_msgSend(v2[3], "doubleValue");
      else
        v5 = 86400.0;
      objc_msgSend(v2, "scheduleDeviceDataProcessing:", v5);
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("[%@] ERROR Unable to inform the system we have completed the Device Knowledge task. Please file a radar..."), objc_opt_class());
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      _ADLog();

    }
  }
  v7 = *(id *)(a1 + 32);
  objc_sync_enter(v7);
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 8) = 0;
  objc_sync_exit(v7);

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("[%@] Releasing an XPC transaction for %@"), objc_opt_class(), CFSTR("Device Knowledge In Progress"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  _ADLog();

  return releaseXPCTransaction();
}

- (void)checkOnTask:(id)a3 activity:(id)a4
{
  void *v6;
  id v7;
  void *v8;
  _xpc_activity_s *v9;
  xpc_object_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  _xpc_activity_s *activity;

  activity = (_xpc_activity_s *)a4;
  v6 = (void *)MEMORY[0x24BDD17C8];
  v7 = a3;
  objc_msgSend(v6, "stringWithFormat:", CFSTR("[%@]: Checking in on task: %@"), objc_opt_class(), v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  _ADLog();

  LODWORD(v8) = objc_msgSend(v7, "isEqualToString:", CFSTR("com.apple.ap.adprivacyd.deviceKnowledge"));
  v9 = activity;
  if ((_DWORD)v8)
  {
    v10 = xpc_activity_copy_criteria(activity);
    v11 = (void *)MEMORY[0x24BDD17C8];
    v12 = objc_opt_class();
    if (v10)
    {
      objc_msgSend(v11, "stringWithFormat:", CFSTR("[%@]: Device Knowledge task already scheduled: %@"), v12, v10);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      _ADLog();

    }
    else
    {
      objc_msgSend(v11, "stringWithFormat:", CFSTR("[%@]: First checkin for Device Knowledge task. Rescheduling..."), v12);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      _ADLog();

      -[ADDeviceKnowledgeManager scheduleDeviceDataProcessing:](self, "scheduleDeviceDataProcessing:", 30.0);
    }

    v9 = activity;
  }

}

- (void)scheduleDeviceDataProcessing:(double)a3
{
  void *v4;
  void *v5;
  double v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  if (MGGetBoolAnswer())
  {
    objc_msgSend(MEMORY[0x24BE021B0], "sharedInstance");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringForKey:", CFSTR("DeviceKnowledgeScheduleOverride"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5 && (objc_msgSend(v5, "isEqualToString:", &stru_24D712ED8) & 1) == 0)
    {
      objc_msgSend(v5, "doubleValue");
      a3 = v6;
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("[%@]: Overriding reschedule period to %f seconds"), objc_opt_class(), *(_QWORD *)&v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      _ADLog();

    }
  }
  v11 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BE02178]), "initWithID:", CFSTR("com.apple.ap.adprivacyd.deviceKnowledge"));
  objc_msgSend(v11, "setDelay:", (uint64_t)a3);
  objc_msgSend(v11, "setAllowBattery:", 0);
  objc_msgSend(v11, "setIsCPUIntensive:", 1);
  objc_msgSend(v11, "setRequiresNetworkConnectivity:", 0);
  objc_msgSend(v11, "setRequireBuddyComplete:", 1);
  objc_msgSend(v11, "setRequireClassCData:", 1);
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", *MEMORY[0x24BDAC6A0], 4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setPriority:", v8);

  objc_msgSend(v11, "setGracePeriod:", *MEMORY[0x24BDAC600]);
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("[%@] Scheduling device knowledge update to run."), objc_opt_class());
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  _ADLog();

  objc_msgSend(MEMORY[0x24BE02180], "sharedInstance");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addBackgroundTask:", v11);

}

- (void)processDeviceData:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  objc_msgSend(MEMORY[0x24BE02228], "workQueue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __46__ADDeviceKnowledgeManager_processDeviceData___block_invoke;
  v7[3] = &unk_24D7102C0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "addOperationWithBlock:", v7);

}

void __46__ADDeviceKnowledgeManager_processDeviceData___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  id v10;

  objc_msgSend(MEMORY[0x24BE7A748], "sharedAssetManagerCoordinator");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x24BDBCE30];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLong:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "arrayWithObjects:", v4, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "refreshTrialClientForPlacementTypes:", v5);

  objc_msgSend(MEMORY[0x24BE7A748], "sharedAssetManagerCoordinator");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setRespondToRefreshNotification:", 0);

  objc_msgSend(MEMORY[0x24BDD1530], "defaultCenter");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "postNotificationName:object:", *MEMORY[0x24BE7A7A0], 0);

  v8 = objc_alloc(MEMORY[0x24BE7A750]);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "activity");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (id)objc_msgSend(v8, "initWithActivity:", v9);

  objc_msgSend(v10, "calculateAllFeatures:", *(_QWORD *)(a1 + 40));
}

- (BOOL)taskIsRunning
{
  return self->_taskIsRunning;
}

- (void)setTaskIsRunning:(BOOL)a3
{
  self->_taskIsRunning = a3;
}

- (ADBackgroundTaskRequest)xpc_task
{
  return self->_xpc_task;
}

- (void)setXpc_task:(id)a3
{
  objc_storeStrong((id *)&self->_xpc_task, a3);
}

- (NSNumber)refreshInterval
{
  return self->_refreshInterval;
}

- (void)setRefreshInterval:(id)a3
{
  objc_storeStrong((id *)&self->_refreshInterval, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_refreshInterval, 0);
  objc_storeStrong((id *)&self->_xpc_task, 0);
}

@end
