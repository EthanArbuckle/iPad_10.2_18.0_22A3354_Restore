@implementation CKSyncEngine

- (CKSyncEngine)initWithConfiguration:(CKSyncEngineConfiguration *)configuration
{
  return (CKSyncEngine *)sub_18A61CC00(configuration);
}

- (NSString)description
{
  return (NSString *)sub_18A61E268(self, (uint64_t)a2, (uint64_t (*)(void))CKSyncEngine.description.getter);
}

- (CKDatabase)database
{
  CKSyncEngine *v2;
  void *v3;
  void *v4;

  v2 = self;
  sub_18A61CEA8();
  v4 = v3;

  return (CKDatabase *)v4;
}

- (CKSyncEngineState)state
{
  CKSyncEngine *v2;
  void *v3;
  void *v4;

  v2 = self;
  sub_18A61CF90();
  v4 = v3;

  return (CKSyncEngineState *)v4;
}

- (void)cancelOperationsWithCompletionHandler:(void *)completionHandler
{
  void *v4;
  uint64_t (*v5)();
  CKSyncEngine *v6;

  v4 = _Block_copy(completionHandler);
  if (v4)
  {
    *(_QWORD *)(swift_allocObject() + 16) = v4;
    v5 = sub_18A6237B0;
  }
  else
  {
    v5 = 0;
  }
  v6 = self;
  sub_18A61D154();
  sub_18A60A578((uint64_t)v5);

}

- (void)fetchChangesWithCompletionHandler:(void *)completionHandler
{
  void *v4;
  void (*v5)(uint64_t);
  CKSyncEngine *v6;

  v4 = _Block_copy(completionHandler);
  if (v4)
  {
    *(_QWORD *)(swift_allocObject() + 16) = v4;
    v5 = sub_18A61C754;
  }
  else
  {
    v5 = 0;
  }
  v6 = self;
  sub_18A61D154();
  sub_18A60A578((uint64_t)v5);

}

- (void)fetchChangesWithOptions:(CKSyncEngineFetchChangesOptions *)options completionHandler:(void *)completionHandler
{
  void *v6;
  CKSyncEngineFetchChangesOptions *v7;
  CKSyncEngine *v8;

  v6 = _Block_copy(completionHandler);
  if (v6)
  {
    *(_QWORD *)(swift_allocObject() + 16) = v6;
    v6 = sub_18A61C754;
  }
  v7 = options;
  v8 = self;
  sub_18A61DB00();
  sub_18A60A578((uint64_t)v6);

}

- (void)sendChangesWithCompletionHandler:(void *)completionHandler
{
  void *v4;
  void (*v5)(uint64_t);
  CKSyncEngine *v6;

  v4 = _Block_copy(completionHandler);
  if (v4)
  {
    *(_QWORD *)(swift_allocObject() + 16) = v4;
    v5 = sub_18A61C754;
  }
  else
  {
    v5 = 0;
  }
  v6 = self;
  sub_18A61D7AC();
  sub_18A60A578((uint64_t)v5);

}

- (void)sendChangesWithOptions:(CKSyncEngineSendChangesOptions *)options completionHandler:(void *)completionHandler
{
  void *v6;
  CKSyncEngineSendChangesOptions *v7;
  CKSyncEngine *v8;

  v6 = _Block_copy(completionHandler);
  if (v6)
  {
    *(_QWORD *)(swift_allocObject() + 16) = v6;
    v6 = sub_18A61C754;
  }
  v7 = options;
  v8 = self;
  sub_18A61DB00();
  sub_18A60A578((uint64_t)v6);

}

- (CKSyncEngine)init
{
  CKSyncEngine.init()();
}

- (void).cxx_destruct
{
  swift_release();
  sub_18A623C08();
}

- (void)setNeedsToFetchChanges
{
  CKSyncEngine *v2;

  v2 = self;
  sub_18A61DE78();

}

- (BOOL)automaticSyncingEnabled
{
  CKSyncEngine *v2;
  char v3;

  v2 = self;
  v3 = sub_18A61E0F0((uint64_t (*)(void))sub_18A68FCB8);

  return v3 & 1;
}

- (void)setAutomaticSyncingEnabled:(BOOL)a3
{
  _BOOL8 v3;
  CKSyncEngine *v4;

  v3 = a3;
  v4 = self;
  sub_18A61E16C(v3, (void (*)(uint64_t))sub_18A68FCE8);

}

- (BOOL)needsToReloadAccount
{
  CKSyncEngine *v2;
  char v3;

  v2 = self;
  v3 = sub_18A61E0F0((uint64_t (*)(void))sub_18A6896F8);

  return v3 & 1;
}

- (void)setNeedsToReloadAccount:(BOOL)a3
{
  _BOOL8 v3;
  CKSyncEngine *v4;

  v3 = a3;
  v4 = self;
  sub_18A61E16C(v3, (void (*)(uint64_t))sub_18A689720);

}

- (void)unregisterActivities
{
  CKSyncEngine *v2;

  v2 = self;
  sub_18A61E1A8();

}

+ (void)unregisterActivitiesWithDatabase:(id)a3 ignoringSystemConditions:(BOOL)a4
{
  id v4;

  v4 = a3;
  sub_18A61E200();

}

- (NSString)syncActivityIdentifier
{
  return (NSString *)sub_18A61E268(self, (uint64_t)a2, (uint64_t (*)(void))sub_18A61E2BC);
}

- (BOOL)useOpportunisticPushTopic
{
  CKSyncEngine *v2;
  char v3;

  v2 = self;
  v3 = sub_18A61E324();

  return v3 & 1;
}

- (CKSyncEngine)initWithDeprecatedConfiguration:(id)a3
{
  CKSyncEngine *result;

  sub_18A61F948((uint64_t)a3);
  return result;
}

- (NSArray)recordIDsToSave
{
  return (NSArray *)sub_18A61FEAC(self, (uint64_t)a2, sub_18A61F9AC);
}

- (NSArray)recordIDsToDelete
{
  return (NSArray *)sub_18A61FEAC(self, (uint64_t)a2, sub_18A61FF04);
}

- (BOOL)hasPendingModifications
{
  CKSyncEngine *v2;
  char v3;

  v2 = self;
  v3 = sub_18A6200EC((uint64_t)v2);

  return v3 & 1;
}

- (CKSyncEngineDataSource)dataSource
{
  CKSyncEngine *v2;
  id v3;

  v2 = self;
  v3 = sub_18A62027C();

  return (CKSyncEngineDataSource *)v3;
}

- (void)fetchChangesForZoneIDs:(id)a3 completionHandler:(id)a4
{
  void *v6;
  uint64_t v7;
  void (*v8)(uint64_t);
  CKSyncEngine *v9;

  v6 = _Block_copy(a4);
  if (a3)
  {
    sub_18A60B8D0(0, (unint64_t *)&qword_1ECD967B0);
    a3 = (id)static Array._unconditionallyBridgeFromObjectiveC(_:)();
  }
  if (v6)
  {
    v7 = swift_allocObject();
    *(_QWORD *)(v7 + 16) = v6;
    v8 = sub_18A60A3E4;
  }
  else
  {
    v8 = 0;
    v7 = 0;
  }
  v9 = self;
  sub_18A6202AC((uint64_t)a3, (uint64_t)v8, v7);
  sub_18A60A578((uint64_t)v8);

  swift_bridgeObjectRelease();
}

- (void)modifyPendingChangesInZoneIDs:(id)a3 completionHandler:(id)a4
{
  void *v6;
  void (*v7)(uint64_t);
  CKSyncEngine *v8;

  v6 = _Block_copy(a4);
  if (a3)
  {
    sub_18A60B8D0(0, (unint64_t *)&qword_1ECD967B0);
    static Array._unconditionallyBridgeFromObjectiveC(_:)();
  }
  if (v6)
  {
    *(_QWORD *)(swift_allocObject() + 16) = v6;
    v7 = sub_18A60A3E4;
  }
  else
  {
    v7 = 0;
  }
  v8 = self;
  sub_18A620960();
  sub_18A60A578((uint64_t)v7);

  swift_bridgeObjectRelease();
}

- (void)addRecordIDsToSave:(id)a3 recordIDsToDelete:(id)a4
{
  sub_18A620FE8(self, a2, a3, a4, &selRef_addPendingRecordZoneChanges_);
}

- (void)removeRecordIDsToSave:(id)a3 recordIDsToDelete:(id)a4
{
  sub_18A620FE8(self, a2, a3, a4, &selRef_removePendingRecordZoneChanges_);
}

- (void)addRecordZonesToSave:(id)a3 recordZoneIDsToDelete:(id)a4
{
  sub_18A621068(self, a2, a3, a4, &selRef_addPendingDatabaseChanges_);
}

- (void)removeRecordZonesToSave:(id)a3 recordZoneIDsToDelete:(id)a4
{
  sub_18A621068(self, a2, a3, a4, &selRef_removePendingDatabaseChanges_);
}

- (void)setNeedsToSaveRecords:(id)a3 needsToSave:(BOOL)a4
{
  sub_18A6213C8(self, (uint64_t)a2, (uint64_t)a3, a4, 0);
}

- (void)setNeedsToDeleteRecords:(id)a3 needsToDelete:(BOOL)a4
{
  sub_18A6213C8(self, (uint64_t)a2, (uint64_t)a3, a4, 1);
}

- (void)setNeedsToSaveRecordZones:(id)a3 needsToSave:(BOOL)a4
{
  sub_18A621638(self, (uint64_t)a2, (uint64_t)a3, a4, &qword_1EDF6A910);
}

- (void)setNeedsToDeleteRecordZones:(id)a3 needsToDelete:(BOOL)a4
{
  sub_18A621638(self, (uint64_t)a2, (uint64_t)a3, a4, (unint64_t *)&qword_1ECD967B0);
}

- (void)scheduleSync
{
  CKSyncEngine *v2;

  v2 = self;
  sub_18A6216B4();

}

@end
