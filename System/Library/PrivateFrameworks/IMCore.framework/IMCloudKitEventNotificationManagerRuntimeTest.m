@implementation IMCloudKitEventNotificationManagerRuntimeTest

- (void)setUp
{
  void *v3;
  void *v4;
  objc_class *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)IMCloudKitEventNotificationManagerRuntimeTest;
  -[IMRuntimeTest setUp](&v7, sel_setUp);
  -[IMCloudKitEventNotificationManagerRuntimeTest setDefaultTestDuration:](self, "setDefaultTestDuration:", 1.0);
  +[IMCloudKitHooks singletonOverride](IMCloudKitHooks, "singletonOverride");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMCloudKitEventNotificationManagerRuntimeTest setCloudKitHooks:](self, "setCloudKitHooks:", v3);

  +[IMCloudKitEventNotificationManager sharedInstance](IMCloudKitEventNotificationManager, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addEventHandler:", self);

  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMRuntimeTest testLog:](self, "testLog:", CFSTR("Setting up test: %@"), v6);

}

- (void)tearDown
{
  objc_class *v3;
  void *v4;
  void *v5;
  void *v6;
  IMCloudKitMockSyncState *v7;
  objc_super v8;

  v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMRuntimeTest testLog:](self, "testLog:", CFSTR("Tearing down test: %@"), v4);

  +[IMCloudKitEventNotificationManager sharedInstance](IMCloudKitEventNotificationManager, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeEventHandler:", self);

  -[IMCloudKitEventNotificationManagerRuntimeTest cloudKitHooks](self, "cloudKitHooks");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_alloc_init(IMCloudKitMockSyncState);
  objc_msgSend(v6, "setTestState:", v7);

  -[IMCloudKitEventNotificationManagerRuntimeTest setCloudKitHooks:](self, "setCloudKitHooks:", 0);
  v8.receiver = self;
  v8.super_class = (Class)IMCloudKitEventNotificationManagerRuntimeTest;
  -[IMRuntimeTest tearDown](&v8, sel_tearDown);
}

- (id)createSyncStatisticsForMockSyncState:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "IMCloudKitSyncControllerSyncState");
  objc_msgSend(v3, "IMCloudKitSyncControllerSyncRecordType");

  return (id)MEMORY[0x1E0DE7D20](IMCloudKitSyncStatistics, sel__createSyncStatisticsDictionaryForSyncControllerSyncState_syncType_count_max_unresolved_);
}

- (void)updateMockSyncState
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  -[IMCloudKitEventNotificationManagerRuntimeTest cloudKitHooks](self, "cloudKitHooks");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "testState");
  v9 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "setIMCloudKitSyncDate:", 0);
  objc_msgSend(v9, "setIMCloudKitIsSyncing:", 1);
  objc_msgSend(v9, "setIMCloudKitSyncControllerSyncType:", 2);
  objc_msgSend(v9, "setIMCloudKitIsEligibleForTruthZone:", 1);
  objc_msgSend(v9, "setIMCloudKitSyncingEnabled:", 1);
  objc_msgSend(v9, "setIMCloudKitSyncControllerSyncRecordType:", 1);
  -[IMCloudKitEventNotificationManagerRuntimeTest willUpdateSyncState:](self, "willUpdateSyncState:", v9);
  -[IMCloudKitEventNotificationManagerRuntimeTest createSyncStatisticsForMockSyncState:](self, "createSyncStatisticsForMockSyncState:", v9);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMCloudKitEventNotificationManagerRuntimeTest willSendSyncState:withSyncStatistics:](self, "willSendSyncState:withSyncStatistics:", v9, v4);
  -[IMCloudKitEventNotificationManagerRuntimeTest cloudKitHooks](self, "cloudKitHooks");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setSyncStats:", v4);

  +[IMCloudKitHooks sharedInstance](IMCloudKitHooks, "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "syncStateDictionary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMRuntimeTest testLog:](self, "testLog:", CFSTR("Updated mock sync state to: %@, with sync stats: %@"), v7, v4);

  -[IMCloudKitEventNotificationManagerRuntimeTest cloudKitHooks](self, "cloudKitHooks");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "sendSyncChangedEvent");

}

- (void)sendSyncStateChangedEvent
{
  void *v3;
  void *v4;
  id v5;

  -[IMCloudKitEventNotificationManagerRuntimeTest updateMockSyncState](self, "updateMockSyncState");
  +[IMCloudKitHooks sharedInstance](IMCloudKitHooks, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "syncStateDictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMRuntimeTest testLog:](self, "testLog:", CFSTR("Sending fake syncState dictionary: %@"), v4);

  -[IMCloudKitEventNotificationManagerRuntimeTest cloudKitHooks](self, "cloudKitHooks");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sendSyncChangedEvent");

}

- (void)cloudKitEventNotificationManager:(id)a3 syncStateDidChange:(id)a4
{
  -[IMRuntimeTest testLog:](self, "testLog:", CFSTR("Test got syncState change: %@"), a4);
}

- (void)cloudKitEventNotificationManager:(id)a3 syncProgressDidUpdate:(id)a4
{
  -[IMRuntimeTest testLog:](self, "testLog:", CFSTR("Test got syncState progress: %@"), a4);
}

- (void)startTest
{
  uint64_t v3;
  _QWORD v4[5];

  -[IMCloudKitEventNotificationManagerRuntimeTest defaultTestDuration](self, "defaultTestDuration");
  -[IMRuntimeTest testLog:](self, "testLog:", CFSTR("Running test for %f seconds"), v3);
  -[IMCloudKitEventNotificationManagerRuntimeTest updateMockSyncState](self, "updateMockSyncState");
  -[IMCloudKitEventNotificationManagerRuntimeTest defaultTestDuration](self, "defaultTestDuration");
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = sub_1A211FDDC;
  v4[3] = &unk_1E471E348;
  v4[4] = self;
  -[IMRuntimeTest dispatchAfter:block:](self, "dispatchAfter:block:", v4);
}

- (double)defaultTestDuration
{
  return self->_defaultTestDuration;
}

- (void)setDefaultTestDuration:(double)a3
{
  self->_defaultTestDuration = a3;
}

- (IMCloudKitHookTestSingleton)cloudKitHooks
{
  return self->_cloudKitHooks;
}

- (void)setCloudKitHooks:(id)a3
{
  objc_storeStrong((id *)&self->_cloudKitHooks, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cloudKitHooks, 0);
}

@end
