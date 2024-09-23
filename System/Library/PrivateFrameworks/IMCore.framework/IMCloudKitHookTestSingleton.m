@implementation IMCloudKitHookTestSingleton

- (IMCloudKitHookTestSingleton)init
{
  IMCloudKitHookTestSingleton *v2;
  id v3;
  id v4;
  uint64_t v5;
  NSDictionary *syncStats;
  IMCloudKitMockSyncState *v7;
  IMCloudKitMockSyncState *testState;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)IMCloudKitHookTestSingleton;
  v2 = -[IMCloudKitHookTestSingleton init](&v10, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(MEMORY[0x1E0C99D80]);
    v4 = objc_alloc_init(MEMORY[0x1E0C99D80]);
    +[IMCloudKitSyncStatistics _createSyncStatisticsDictionary:messageSyncCount:messageUnresolvedCount:chatCount:chatSyncCount:chatUnresolvedCount:attachmentCount:attachmentSyncCount:attachmentUnresolvedCount:serverRecordCounts:syncStoreCounts:](IMCloudKitSyncStatistics, "_createSyncStatisticsDictionary:messageSyncCount:messageUnresolvedCount:chatCount:chatSyncCount:chatUnresolvedCount:attachmentCount:attachmentSyncCount:attachmentUnresolvedCount:serverRecordCounts:syncStoreCounts:", 0, 0, 0, 0, 0, 0, 0, 0, 0, v3, v4);
    v5 = objc_claimAutoreleasedReturnValue();
    syncStats = v2->_syncStats;
    v2->_syncStats = (NSDictionary *)v5;

    v7 = objc_alloc_init(IMCloudKitMockSyncState);
    testState = v2->_testState;
    v2->_testState = v7;

    -[IMCloudKitMockSyncState setIMCloudKitSyncingEnabled:](v2->_testState, "setIMCloudKitSyncingEnabled:", 1);
    -[IMCloudKitMockSyncState setIMCloudKitIsEligibleForTruthZone:](v2->_testState, "setIMCloudKitIsEligibleForTruthZone:", 1);
  }
  return v2;
}

+ (id)logHandle
{
  if (qword_1ECF123E0 != -1)
    dispatch_once(&qword_1ECF123E0, &unk_1E471DA78);
  return (id)qword_1ECF123F8;
}

- (id)logHandle
{
  return (id)objc_msgSend((id)objc_opt_class(), "logHandle");
}

- (void)setTestState:(id)a3
{
  objc_storeStrong((id *)&self->_testState, a3);
  -[IMCloudKitHookTestSingleton sendSyncChangedEvent](self, "sendSyncChangedEvent");
}

- (void)fetchSyncStateStatistics
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_1A211E780;
  block[3] = &unk_1E471E348;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

- (void)sendSyncChangedEvent
{
  void *v3;
  void *v4;
  NSObject *v5;
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  +[IMCloudKitHooks sharedInstance](IMCloudKitHooks, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "syncStateDictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[IMCloudKitHookTestSingleton logHandle](self, "logHandle");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v7 = 138412290;
    v8 = v4;
    _os_log_impl(&dword_1A1FF4000, v5, OS_LOG_TYPE_INFO, "Sending fake state: %@ from IMCloudKitHooksTestSingleton", (uint8_t *)&v7, 0xCu);
  }

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "postNotificationName:object:userInfo:", CFSTR("com.apple.IMCore.IMCloudKitHooks.ValuesChanged"), 0, v4);

}

- (BOOL)isEnabled
{
  return -[IMCloudKitMockSyncState IMCloudKitSyncingEnabled](self->_testState, "IMCloudKitSyncingEnabled");
}

- (void)setEnabled:(BOOL)a3
{
  _QWORD block[4];
  BOOL v6;

  -[IMCloudKitMockSyncState setIMCloudKitSyncingEnabled:](self->_testState, "setIMCloudKitSyncingEnabled:");
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_1A211E980;
  block[3] = &unk_1E4722840;
  v6 = a3;
  dispatch_async(MEMORY[0x1E0C80D38], block);
  -[IMCloudKitHookTestSingleton sendSyncChangedEvent](self, "sendSyncChangedEvent");
}

- (BOOL)eligibleForTruthZone
{
  return -[IMCloudKitMockSyncState IMCloudKitIsEligibleForTruthZone](self->_testState, "IMCloudKitIsEligibleForTruthZone");
}

- (void)setEligibleForTruthZone:(BOOL)a3
{
  -[IMCloudKitMockSyncState setIMCloudKitIsEligibleForTruthZone:](self->_testState, "setIMCloudKitIsEligibleForTruthZone:", a3);
  -[IMCloudKitHookTestSingleton sendSyncChangedEvent](self, "sendSyncChangedEvent");
}

- (BOOL)isSyncing
{
  return -[IMCloudKitMockSyncState IMCloudKitIsSyncing](self->_testState, "IMCloudKitIsSyncing");
}

- (void)setSyncing:(BOOL)a3
{
  -[IMCloudKitMockSyncState setIMCloudKitIsSyncing:](self->_testState, "setIMCloudKitIsSyncing:", a3);
  -[IMCloudKitHookTestSingleton sendSyncChangedEvent](self, "sendSyncChangedEvent");
}

- (void)initiatePeriodicSync
{
  MEMORY[0x1E0DE7D20](self, sel_setSyncing_);
}

- (BOOL)isDisablingDevices
{
  return -[IMCloudKitMockSyncState IMCloudKitStartingDisableDevices](self->_testState, "IMCloudKitStartingDisableDevices");
}

- (BOOL)isStartingSync
{
  return -[IMCloudKitMockSyncState IMCloudKitStartingInitialSync](self->_testState, "IMCloudKitStartingInitialSync")
      || -[IMCloudKitMockSyncState IMCloudKitStartingPeriodicSync](self->_testState, "IMCloudKitStartingPeriodicSync");
}

- (int64_t)isChangingEnabledState
{
  return -[IMCloudKitMockSyncState IMCloudKitStartingEnabledSettingChange](self->_testState, "IMCloudKitStartingEnabledSettingChange");
}

- (NSDate)lastSyncDate
{
  return -[IMCloudKitMockSyncState IMCloudKitSyncDate](self->_testState, "IMCloudKitSyncDate");
}

- (void)setLastSyncDate:(id)a3
{
  -[IMCloudKitMockSyncState setIMCloudKitSyncDate:](self->_testState, "setIMCloudKitSyncDate:", a3);
  -[IMCloudKitHookTestSingleton sendSyncChangedEvent](self, "sendSyncChangedEvent");
}

- (id)syncStateDictionary
{
  return (id)MEMORY[0x1E0DE7D20](self->_testState, sel_convertToDictionary);
}

- (BOOL)isInExitState
{
  return -[IMCloudKitMockSyncState IMCloudKitIsInExitState](self->_testState, "IMCloudKitIsInExitState");
}

- (void)setIsInExitState:(BOOL)a3
{
  -[IMCloudKitMockSyncState setIMCloudKitIsInExitState:](self->_testState, "setIMCloudKitIsInExitState:", a3);
  -[IMCloudKitHookTestSingleton sendSyncChangedEvent](self, "sendSyncChangedEvent");
}

- (unint64_t)syncControllerSyncState
{
  return -[IMCloudKitMockSyncState IMCloudKitSyncControllerSyncState](self->_testState, "IMCloudKitSyncControllerSyncState");
}

- (void)setControllerSyncState:(unint64_t)a3
{
  -[IMCloudKitMockSyncState setIMCloudKitSyncControllerSyncState:](self->_testState, "setIMCloudKitSyncControllerSyncState:");
  MEMORY[0x1E0DE7D20](self, sel_setSyncing_);
}

- (int64_t)syncType
{
  return -[IMCloudKitMockSyncState IMCloudKitSyncControllerSyncType](self->_testState, "IMCloudKitSyncControllerSyncType");
}

- (void)setControllerSyncType:(int64_t)a3
{
  -[IMCloudKitMockSyncState setIMCloudKitSyncControllerSyncType:](self->_testState, "setIMCloudKitSyncControllerSyncType:", a3);
  -[IMCloudKitHookTestSingleton sendSyncChangedEvent](self, "sendSyncChangedEvent");
}

- (NSArray)IMCloudKitSyncErrors
{
  return -[IMCloudKitMockSyncState IMCloudKitSyncErrors](self->_testState, "IMCloudKitSyncErrors");
}

- (void)setIMCloudKitSyncErrors:(id)a3
{
  -[IMCloudKitMockSyncState setIMCloudKitSyncErrors:](self->_testState, "setIMCloudKitSyncErrors:", a3);
  -[IMCloudKitHookTestSingleton sendSyncChangedEvent](self, "sendSyncChangedEvent");
}

- (IMCloudKitMockSyncState)testState
{
  return self->_testState;
}

- (BOOL)rampedIntoTruthZone
{
  return self->_rampedIntoTruthZone;
}

- (void)setRampedIntoTruthZone:(BOOL)a3
{
  self->_rampedIntoTruthZone = a3;
}

- (void)setIsChangingEnabledState:(int64_t)a3
{
  self->_isChangingEnabledState = a3;
}

- (void)setIsStartingSync:(BOOL)a3
{
  self->_isStartingSync = a3;
}

- (void)setIsDisablingDevices:(BOOL)a3
{
  self->_isDisablingDevices = a3;
}

- (void)setSyncControllerSyncState:(unint64_t)a3
{
  self->_syncControllerSyncState = a3;
}

- (void)setSyncType:(int64_t)a3
{
  self->_syncType = a3;
}

- (NSDictionary)syncStats
{
  return self->_syncStats;
}

- (void)setSyncStats:(id)a3
{
  objc_storeStrong((id *)&self->_syncStats, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_syncStats, 0);
  objc_storeStrong((id *)&self->_testState, 0);
}

@end
