@implementation CKSyncEngineState

- (BOOL)needsToFetchDatabaseChanges
{
  OS_dispatch_queue *queue;
  OS_dispatch_queue *v4;
  char v5;
  _QWORD v7[6];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  char v11;

  v8 = 0;
  v9 = &v8;
  v10 = 0x2020000000;
  v11 = 0;
  if (self)
    queue = self->_queue;
  else
    queue = 0;
  v4 = queue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = sub_18A5E51B0;
  v7[3] = &unk_1E1F5F758;
  v7[4] = self;
  v7[5] = &v8;
  ck_call_or_dispatch_sync_if_not_key(v4, &self->_queue, v7);

  v5 = *((_BYTE *)v9 + 24);
  _Block_object_dispose(&v8, 8);
  return v5;
}

- (unint64_t)changeCount
{
  OS_dispatch_queue *queue;
  OS_dispatch_queue *v4;
  unint64_t v5;
  _QWORD v7[6];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;

  v8 = 0;
  v9 = &v8;
  v10 = 0x2020000000;
  if (self)
    queue = self->_queue;
  else
    queue = 0;
  v11 = 0;
  v4 = queue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = sub_18A5C9400;
  v7[3] = &unk_1E1F5F758;
  v7[4] = self;
  v7[5] = &v8;
  ck_call_or_dispatch_sync_if_not_key(v4, &self->_queue, v7);

  v5 = v9[3];
  _Block_object_dispose(&v8, 8);
  return v5;
}

- (void)setDidPerformInitialUserRecordIDFetch:(BOOL)a3
{
  CKSyncEngineState *v3;
  const char *v4;
  _QWORD v5[5];
  BOOL v6;

  v3 = self;
  if (self)
    self = (CKSyncEngineState *)self->_queue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = sub_18A5CA294;
  v5[3] = &unk_1E1F61A70;
  v6 = a3;
  v5[4] = v3;
  ck_call_or_dispatch_sync_if_not_key(self, &v3->_queue, v5);
  objc_msgSend_notifyChangeHandlerWithCoalescing_scheduleSync_(v3, v4, 1, 0);
}

- (void)notifyChangeHandlerWithCoalescing:(BOOL)a3 scheduleSync:(BOOL)a4
{
  _BOOL8 v4;
  _BOOL8 v5;
  NSObject *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  _DWORD v13[2];
  __int16 v14;
  _BOOL4 v15;
  uint64_t v16;

  v4 = a4;
  v5 = a3;
  v16 = *MEMORY[0x1E0C80C00];
  if (ck_log_initialization_predicate != -1)
    dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
  v7 = ck_log_facility_engine;
  if (os_log_type_enabled((os_log_t)ck_log_facility_engine, OS_LOG_TYPE_DEBUG))
  {
    v13[0] = 67109376;
    v13[1] = v5;
    v14 = 1024;
    v15 = v4;
    _os_log_debug_impl(&dword_18A5C5000, v7, OS_LOG_TYPE_DEBUG, "Calling notifyChangeHandlerWithCoalescing: %d scheduleSync: %d", (uint8_t *)v13, 0xEu);
  }
  objc_msgSend_changeHandler(self, v8, v9, v10);
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = (void *)v11;
  if (v11)
    (*(void (**)(uint64_t, _BOOL8, _BOOL8))(v11 + 16))(v11, v5, v4);

}

- (CKRecordID)lastKnownUserRecordID
{
  OS_dispatch_queue *queue;
  OS_dispatch_queue *v4;
  id v5;
  _QWORD v7[6];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  id v13;

  v8 = 0;
  v9 = &v8;
  v10 = 0x3032000000;
  v11 = sub_18A807004;
  v12 = sub_18A807014;
  v13 = 0;
  if (self)
    queue = self->_queue;
  else
    queue = 0;
  v4 = queue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = sub_18A5CA3D8;
  v7[3] = &unk_1E1F5F758;
  v7[4] = self;
  v7[5] = &v8;
  ck_call_or_dispatch_sync_if_not_key(v4, &self->_queue, v7);

  v5 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return (CKRecordID *)v5;
}

- (id)changeHandler
{
  return self->_changeHandler;
}

- (NSArray)zoneIDsWithUnfetchedServerChanges
{
  OS_dispatch_queue *queue;
  OS_dispatch_queue *v4;
  id v5;
  _QWORD v7[6];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  id v13;

  v8 = 0;
  v9 = &v8;
  v10 = 0x3032000000;
  v11 = sub_18A807004;
  v12 = sub_18A807014;
  v13 = 0;
  if (self)
    queue = self->_queue;
  else
    queue = 0;
  v4 = queue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = sub_18A5F223C;
  v7[3] = &unk_1E1F5F758;
  v7[4] = self;
  v7[5] = &v8;
  ck_call_or_dispatch_sync_if_not_key(v4, &self->_queue, v7);

  v5 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return (NSArray *)v5;
}

- (id)shortDescription
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  void *v8;

  v4 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend_loggingID(self, a2, v2, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(v4, v6, (uint64_t)CFSTR("<CKSyncEngine.State %@>"), v7, v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (void)setServerChangeTokenForDatabase:(id)a3
{
  id v4;
  OS_dispatch_queue *queue;
  id v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(uint64_t);
  void *v11;
  CKSyncEngineState *v12;
  id v13;

  v4 = a3;
  if (self)
    queue = self->_queue;
  else
    queue = 0;
  v8 = MEMORY[0x1E0C809B0];
  v9 = 3221225472;
  v10 = sub_18A5F22CC;
  v11 = &unk_1E1F61A48;
  v12 = self;
  v13 = v4;
  v6 = v4;
  ck_call_or_dispatch_sync_if_not_key(queue, &self->_queue, &v8);
  objc_msgSend_notifyChangeHandlerWithCoalescing_scheduleSync_(self, v7, 0, 0, v8, v9, v10, v11, v12);

}

- (void)setNeedsToFetchDatabaseChanges:(BOOL)a3
{
  CKSyncEngineState *v3;
  const char *v4;
  _QWORD v5[5];
  BOOL v6;

  v3 = self;
  if (self)
    self = (CKSyncEngineState *)self->_queue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = sub_18A5F2464;
  v5[3] = &unk_1E1F61A70;
  v6 = a3;
  v5[4] = v3;
  ck_call_or_dispatch_sync_if_not_key(self, &v3->_queue, v5);
  objc_msgSend_notifyChangeHandlerWithCoalescing_scheduleSync_(v3, v4, 1, 0);
}

- (void)setNeedsToFetchChanges:(BOOL)a3 forRecordZoneID:(id)a4
{
  id v6;
  OS_dispatch_queue *queue;
  id v8;
  const char *v9;
  _QWORD v10[5];
  id v11;
  BOOL v12;

  v6 = a4;
  if (self)
    queue = self->_queue;
  else
    queue = 0;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = sub_18A5F2014;
  v10[3] = &unk_1E1F63188;
  v12 = a3;
  v10[4] = self;
  v11 = v6;
  v8 = v6;
  ck_call_or_dispatch_sync_if_not_key(queue, &self->_queue, v10);
  objc_msgSend_notifyChangeHandlerWithCoalescing_scheduleSync_(self, v9, 1, 0);

}

- (void)setLastFetchDatabaseChangesDate:(id)a3
{
  id v4;
  OS_dispatch_queue *queue;
  OS_dispatch_queue **p_queue;
  id v7;
  _QWORD v8[5];
  id v9;

  v4 = a3;
  if (self)
    queue = self->_queue;
  else
    queue = 0;
  p_queue = &self->_queue;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = sub_18A5F2428;
  v8[3] = &unk_1E1F61A48;
  v8[4] = self;
  v9 = v4;
  v7 = v4;
  ck_call_or_dispatch_sync_if_not_key(queue, p_queue, v8);

}

- (id)serverChangeTokensByZoneID
{
  OS_dispatch_queue *queue;
  OS_dispatch_queue *v4;
  id v5;
  _QWORD v7[6];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  id v13;

  v8 = 0;
  v9 = &v8;
  v10 = 0x3032000000;
  v11 = sub_18A807004;
  v12 = sub_18A807014;
  v13 = 0;
  if (self)
    queue = self->_queue;
  else
    queue = 0;
  v4 = queue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = sub_18A5F260C;
  v7[3] = &unk_1E1F5F758;
  v7[4] = self;
  v7[5] = &v8;
  ck_call_or_dispatch_sync_if_not_key(v4, &self->_queue, v7);

  v5 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return v5;
}

- (CKServerChangeToken)serverChangeTokenForDatabase
{
  OS_dispatch_queue *queue;
  OS_dispatch_queue *v4;
  id v5;
  _QWORD v7[6];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  id v13;

  v8 = 0;
  v9 = &v8;
  v10 = 0x3032000000;
  v11 = sub_18A807004;
  v12 = sub_18A807014;
  v13 = 0;
  if (self)
    queue = self->_queue;
  else
    queue = 0;
  v4 = queue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = sub_18A5F25D0;
  v7[3] = &unk_1E1F5F758;
  v7[4] = self;
  v7[5] = &v8;
  ck_call_or_dispatch_sync_if_not_key(v4, &self->_queue, v7);

  v5 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return (CKServerChangeToken *)v5;
}

- (void)removePendingRecordZoneChanges:(NSArray *)changes
{
  NSArray *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  OS_dispatch_queue *queue;
  OS_dispatch_queue *v9;
  const char *v10;
  _QWORD v11[4];
  NSArray *v12;
  CKSyncEngineState *v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  char v18;

  v4 = changes;
  if (objc_msgSend_count(v4, v5, v6, v7))
  {
    v15 = 0;
    v16 = &v15;
    v17 = 0x2020000000;
    v18 = 0;
    if (self)
      queue = self->_queue;
    else
      queue = 0;
    v9 = queue;
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = sub_18A8078BC;
    v11[3] = &unk_1E1F62670;
    v12 = v4;
    v13 = self;
    v14 = &v15;
    ck_call_or_dispatch_sync_if_not_key(v9, &self->_queue, v11);

    if (*((_BYTE *)v16 + 24))
      objc_msgSend_notifyChangeHandlerWithCoalescing_scheduleSync_(self, v10, 1, 0);

    _Block_object_dispose(&v15, 8);
  }

}

- (NSArray)pendingRecordZoneChanges
{
  OS_dispatch_queue *queue;
  OS_dispatch_queue *v4;
  id v5;
  _QWORD v7[6];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  id v13;

  v8 = 0;
  v9 = &v8;
  v10 = 0x3032000000;
  v11 = sub_18A807004;
  v12 = sub_18A807014;
  v13 = 0;
  if (self)
    queue = self->_queue;
  else
    queue = 0;
  v4 = queue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = sub_18A5F2658;
  v7[3] = &unk_1E1F5F758;
  v7[4] = self;
  v7[5] = &v8;
  ck_call_or_dispatch_sync_if_not_key(v4, &self->_queue, v7);

  v5 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return (NSArray *)v5;
}

- (NSArray)pendingDatabaseChanges
{
  OS_dispatch_queue *queue;
  OS_dispatch_queue *v4;
  id v5;
  _QWORD v7[6];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  id v13;

  v8 = 0;
  v9 = &v8;
  v10 = 0x3032000000;
  v11 = sub_18A807004;
  v12 = sub_18A807014;
  v13 = 0;
  if (self)
    queue = self->_queue;
  else
    queue = 0;
  v4 = queue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = sub_18A5F291C;
  v7[3] = &unk_1E1F5F758;
  v7[4] = self;
  v7[5] = &v8;
  ck_call_or_dispatch_sync_if_not_key(v4, &self->_queue, v7);

  v5 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return (NSArray *)v5;
}

- (BOOL)needsToSaveDatabaseSubscription
{
  OS_dispatch_queue *queue;
  OS_dispatch_queue *v4;
  char v5;
  _QWORD v7[6];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  char v11;

  v8 = 0;
  v9 = &v8;
  v10 = 0x2020000000;
  v11 = 0;
  if (self)
    queue = self->_queue;
  else
    queue = 0;
  v4 = queue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = sub_18A5F25A8;
  v7[3] = &unk_1E1F5F758;
  v7[4] = self;
  v7[5] = &v8;
  ck_call_or_dispatch_sync_if_not_key(v4, &self->_queue, v7);

  v5 = *((_BYTE *)v9 + 24);
  _Block_object_dispose(&v8, 8);
  return v5;
}

- (NSString)loggingID
{
  return (NSString *)objc_getProperty(self, a2, 160, 1);
}

- (NSDate)lastFetchDatabaseChangesDate
{
  OS_dispatch_queue *queue;
  OS_dispatch_queue *v4;
  id v5;
  _QWORD v7[6];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  id v13;

  v8 = 0;
  v9 = &v8;
  v10 = 0x3032000000;
  v11 = sub_18A807004;
  v12 = sub_18A807014;
  v13 = 0;
  if (self)
    queue = self->_queue;
  else
    queue = 0;
  v4 = queue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = sub_18A5F25E4;
  v7[3] = &unk_1E1F5F758;
  v7[4] = self;
  v7[5] = &v8;
  ck_call_or_dispatch_sync_if_not_key(v4, &self->_queue, v7);

  v5 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return (NSDate *)v5;
}

- (BOOL)hasPendingUntrackedChanges
{
  OS_dispatch_queue *queue;
  OS_dispatch_queue *v4;
  char v5;
  _QWORD v7[6];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  char v11;

  v8 = 0;
  v9 = &v8;
  v10 = 0x2020000000;
  v11 = 0;
  if (self)
    queue = self->_queue;
  else
    queue = 0;
  v4 = queue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = sub_18A5F2644;
  v7[3] = &unk_1E1F5F758;
  v7[4] = self;
  v7[5] = &v8;
  ck_call_or_dispatch_sync_if_not_key(v4, &self->_queue, v7);

  v5 = *((_BYTE *)v9 + 24);
  _Block_object_dispose(&v8, 8);
  return v5;
}

- (BOOL)hasInFlightUntrackedChanges
{
  OS_dispatch_queue *queue;
  OS_dispatch_queue *v4;
  char v5;
  _QWORD v7[6];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  char v11;

  v8 = 0;
  v9 = &v8;
  v10 = 0x2020000000;
  v11 = 0;
  if (self)
    queue = self->_queue;
  else
    queue = 0;
  v4 = queue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = sub_18A5F25F8;
  v7[3] = &unk_1E1F5F758;
  v7[4] = self;
  v7[5] = &v8;
  ck_call_or_dispatch_sync_if_not_key(v4, &self->_queue, v7);

  v5 = *((_BYTE *)v9 + 24);
  _Block_object_dispose(&v8, 8);
  return v5;
}

- (void)getDataRepresentation:(id)a3
{
  void (**v4)(id, _QWORD, uint64_t);
  void *v5;
  OS_dispatch_queue *queue;
  OS_dispatch_queue *v7;
  NSObject *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  _QWORD v13[7];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t v17;
  _BYTE buf[24];
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, _QWORD, uint64_t))a3;
  if (ck_log_initialization_predicate != -1)
    dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
  v5 = (void *)ck_log_facility_engine;
  if (os_log_type_enabled((os_log_t)ck_log_facility_engine, OS_LOG_TYPE_DEBUG))
  {
    v8 = v5;
    objc_msgSend_shortDescription(self, v9, v10, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    *(_QWORD *)&buf[4] = v12;
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = self;
    _os_log_debug_impl(&dword_18A5C5000, v8, OS_LOG_TYPE_DEBUG, "%{public}@ serializing sync engine state %@", buf, 0x16u);

  }
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x3032000000;
  v19 = sub_18A807004;
  v20 = sub_18A807014;
  v21 = 0;
  v14 = 0;
  v15 = &v14;
  v16 = 0x2020000000;
  v17 = 0;
  if (self)
    queue = self->_queue;
  else
    queue = 0;
  v7 = queue;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = sub_18A5F2980;
  v13[3] = &unk_1E1F665E0;
  v13[4] = self;
  v13[5] = &v14;
  v13[6] = buf;
  ck_call_or_dispatch_sync_if_not_key(v7, &self->_queue, v13);

  v4[2](v4, *(_QWORD *)(*(_QWORD *)&buf[8] + 40), v15[3]);
  _Block_object_dispose(&v14, 8);
  _Block_object_dispose(buf, 8);

}

- (NSDictionary)fakeZonesToSaveForSerializationTests
{
  return (NSDictionary *)objc_getProperty(self, a2, 120, 1);
}

- (NSOrderedSet)fakeZoneIDsToSaveForSerializationTests
{
  return (NSOrderedSet *)objc_getProperty(self, a2, 128, 1);
}

- (NSOrderedSet)fakeZoneIDsToDeleteForSerializationTests
{
  return (NSOrderedSet *)objc_getProperty(self, a2, 136, 1);
}

- (NSOrderedSet)fakeRecordIDsToSaveForSerializationTests
{
  return (NSOrderedSet *)objc_getProperty(self, a2, 104, 1);
}

- (NSOrderedSet)fakeRecordIDsToDeleteForSerializationTests
{
  return (NSOrderedSet *)objc_getProperty(self, a2, 112, 1);
}

- (NSString)existingDatabaseSubscriptionID
{
  OS_dispatch_queue *queue;
  OS_dispatch_queue *v4;
  id v5;
  _QWORD v7[6];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  id v13;

  v8 = 0;
  v9 = &v8;
  v10 = 0x3032000000;
  v11 = sub_18A807004;
  v12 = sub_18A807014;
  v13 = 0;
  if (self)
    queue = self->_queue;
  else
    queue = 0;
  v4 = queue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = sub_18A5F25BC;
  v7[3] = &unk_1E1F5F758;
  v7[4] = self;
  v7[5] = &v8;
  ck_call_or_dispatch_sync_if_not_key(v4, &self->_queue, v7);

  v5 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return (NSString *)v5;
}

- (void)encodeWithCoder:(id)a3
{
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t DatabaseChanges;
  const char *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t hasPendingUntrackedChanges;
  const char *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  const char *v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  const char *v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  const char *v33;
  const char *v34;
  const char *v35;
  const char *v36;
  const char *v37;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  const char *v42;
  const char *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  const char *v47;
  const char *v48;
  uint64_t v49;
  uint64_t v50;
  void *v51;
  const char *v52;
  const char *v53;
  uint64_t v54;
  uint64_t v55;
  void *v56;
  const char *v57;
  const char *v58;
  uint64_t v59;
  uint64_t v60;
  void *v61;
  const char *v62;
  uint64_t v63;
  uint64_t v64;
  void *v65;
  const char *v66;
  uint64_t v67;
  uint64_t v68;
  void *v69;
  const char *v70;
  uint64_t v71;
  uint64_t v72;
  void *v73;
  const char *v74;
  uint64_t v75;
  uint64_t v76;
  void *v77;
  const char *v78;
  uint64_t v79;
  uint64_t v80;
  void *v81;
  const char *v82;
  uint64_t v83;
  uint64_t v84;
  void *v85;
  const char *v86;
  uint64_t v87;
  uint64_t v88;
  void *v89;
  const char *v90;
  uint64_t v91;
  uint64_t v92;
  void *v93;
  const char *v94;
  uint64_t v95;
  uint64_t v96;
  void *v97;
  const char *v98;
  const char *v99;
  const char *v100;
  const char *v101;
  id v102;

  v102 = a3;
  DatabaseChanges = objc_msgSend_needsToFetchDatabaseChanges(self, v4, v5, v6);
  objc_msgSend_encodeBool_forKey_(v102, v8, DatabaseChanges, (uint64_t)CFSTR("needsToFetchDatabaseChanges"));
  v12 = objc_msgSend_needsToSaveDatabaseSubscription(self, v9, v10, v11);
  objc_msgSend_encodeBool_forKey_(v102, v13, v12, (uint64_t)CFSTR("needsToSaveDatabaseSubscription"));
  hasPendingUntrackedChanges = objc_msgSend_hasPendingUntrackedChanges(self, v14, v15, v16);
  objc_msgSend_encodeBool_forKey_(v102, v18, hasPendingUntrackedChanges, (uint64_t)CFSTR("hasPendingUntrackedChanges"));
  v22 = objc_msgSend_hasInFlightUntrackedChanges(self, v19, v20, v21);
  objc_msgSend_encodeBool_forKey_(v102, v23, v22, (uint64_t)CFSTR("hasInFlightUntrackedChanges"));
  objc_msgSend_serverChangeTokenForDatabase(self, v24, v25, v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v102, v28, (uint64_t)v27, (uint64_t)CFSTR("serverChangeTokenForDatabase"));

  objc_msgSend_serverChangeTokensByZoneID(self, v29, v30, v31);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v102, v33, (uint64_t)v32, (uint64_t)CFSTR("serverChangeTokensByZoneID"));

  if (self)
  {
    objc_msgSend_encodeObject_forKey_(v102, v34, (uint64_t)self->_zoneIDsNeedingToFetchChangesSet, (uint64_t)CFSTR("zoneIDsNeedingToFetchChanges"));
    objc_msgSend_encodeObject_forKey_(v102, v35, (uint64_t)self->_pendingDatabaseChangesSet, (uint64_t)CFSTR("pendingZoneChanges"));
    objc_msgSend_encodeObject_forKey_(v102, v36, (uint64_t)self->_pendingRecordZoneChangesSet, (uint64_t)CFSTR("pendingRecordModifications"));
    objc_msgSend_encodeObject_forKey_(v102, v37, (uint64_t)self->_inFlightRecordChangesSet, (uint64_t)CFSTR("inFlightRecordModifications"));
  }
  else
  {
    objc_msgSend_encodeObject_forKey_(v102, v34, 0, (uint64_t)CFSTR("zoneIDsNeedingToFetchChanges"));
    objc_msgSend_encodeObject_forKey_(v102, v99, 0, (uint64_t)CFSTR("pendingZoneChanges"));
    objc_msgSend_encodeObject_forKey_(v102, v100, 0, (uint64_t)CFSTR("pendingRecordModifications"));
    objc_msgSend_encodeObject_forKey_(v102, v101, 0, (uint64_t)CFSTR("inFlightRecordModifications"));
  }
  objc_msgSend_lastKnownUserRecordID(self, v38, v39, v40);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v102, v42, (uint64_t)v41, (uint64_t)CFSTR("lastKnownUserRecordID"));

  v46 = objc_msgSend_didPerformInitialUserRecordIDFetch(self, v43, v44, v45);
  objc_msgSend_encodeBool_forKey_(v102, v47, v46, (uint64_t)CFSTR("didPerformInitialUserRecordIDFetch"));
  objc_msgSend_lastFetchDatabaseChangesDate(self, v48, v49, v50);
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v102, v52, (uint64_t)v51, (uint64_t)CFSTR("lastFetchDatabaseChangesDate"));

  objc_msgSend_existingDatabaseSubscriptionID(self, v53, v54, v55);
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v102, v57, (uint64_t)v56, (uint64_t)CFSTR("existingDatabaseSubscriptionID"));

  objc_msgSend_fakeRecordIDsToSaveForSerializationTests(self, v58, v59, v60);
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  v65 = (void *)objc_msgSend_mutableCopy(v61, v62, v63, v64);

  if (v65)
    objc_msgSend_encodeObject_forKey_(v102, v66, (uint64_t)v65, (uint64_t)CFSTR("recordIDsToSave"));
  objc_msgSend_fakeRecordIDsToDeleteForSerializationTests(self, v66, v67, v68);
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  v73 = (void *)objc_msgSend_mutableCopy(v69, v70, v71, v72);

  if (v73)
    objc_msgSend_encodeObject_forKey_(v102, v74, (uint64_t)v73, (uint64_t)CFSTR("recordIDsToDelete"));
  objc_msgSend_fakeZonesToSaveForSerializationTests(self, v74, v75, v76);
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  v81 = (void *)objc_msgSend_mutableCopy(v77, v78, v79, v80);

  if (v81)
    objc_msgSend_encodeObject_forKey_(v102, v82, (uint64_t)v81, (uint64_t)CFSTR("zonesToSave"));
  objc_msgSend_fakeZoneIDsToSaveForSerializationTests(self, v82, v83, v84);
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  v89 = (void *)objc_msgSend_mutableCopy(v85, v86, v87, v88);

  if (v89)
    objc_msgSend_encodeObject_forKey_(v102, v90, (uint64_t)v89, (uint64_t)CFSTR("zoneIDsToSave"));
  objc_msgSend_fakeZoneIDsToDeleteForSerializationTests(self, v90, v91, v92);
  v93 = (void *)objc_claimAutoreleasedReturnValue();
  v97 = (void *)objc_msgSend_mutableCopy(v93, v94, v95, v96);

  if (v97)
    objc_msgSend_encodeObject_forKey_(v102, v98, (uint64_t)v97, (uint64_t)CFSTR("zoneIDsToDelete"));

}

- (BOOL)didPerformInitialUserRecordIDFetch
{
  OS_dispatch_queue *queue;
  OS_dispatch_queue *v4;
  char v5;
  _QWORD v7[6];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  char v11;

  v8 = 0;
  v9 = &v8;
  v10 = 0x2020000000;
  v11 = 0;
  if (self)
    queue = self->_queue;
  else
    queue = 0;
  v4 = queue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = sub_18A5F2228;
  v7[3] = &unk_1E1F5F758;
  v7[4] = self;
  v7[5] = &v8;
  ck_call_or_dispatch_sync_if_not_key(v4, &self->_queue, v7);

  v5 = *((_BYTE *)v9 + 24);
  _Block_object_dispose(&v8, 8);
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CKSyncEngineState)initWithStateSerialization:(id)a3 error:(id *)a4
{
  const char *v6;
  void *v7;
  id v8;
  NSObject *v9;
  objc_class *v10;
  void *v11;
  objc_class *v12;
  void *v13;
  const char *v14;
  id v16;
  uint8_t buf[4];
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  objc_msgSend_data(a3, a2, (uint64_t)a3, (uint64_t)a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v16 = 0;
    self = (CKSyncEngineState *)objc_msgSend_initWithData_error_(self, v6, (uint64_t)v7, (uint64_t)&v16);
    v8 = v16;
    if (v8)
    {
      if (ck_log_initialization_predicate != -1)
        dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
      v9 = ck_log_facility_engine;
      if (os_log_type_enabled((os_log_t)ck_log_facility_engine, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 138412290;
        v18 = v8;
        _os_log_fault_impl(&dword_18A5C5000, v9, OS_LOG_TYPE_FAULT, "BUG IN CLOUDKIT: Error initializing sync engine state: %@", buf, 0xCu);
      }
    }
  }
  else
  {
    v10 = (objc_class *)objc_opt_class();
    NSStringFromClass(v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (objc_class *)objc_opt_class();
    NSStringFromClass(v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_errorWithDomain_code_format_(CKPrettyError, v14, (uint64_t)CFSTR("CKErrorDomain"), 12, CFSTR("Cannot initialize %@ from %@ with no data"), v11, v13);
    v8 = (id)objc_claimAutoreleasedReturnValue();

  }
  if (a4)
    *a4 = objc_retainAutorelease(v8);

  return self;
}

- (CKSyncEngineState)initWithData:(id)a3 error:(id *)a4
{
  id v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  NSObject *v12;
  objc_class *v13;
  void *v14;
  const char *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  const char *v19;
  void *v20;
  uint64_t v21;
  const char *v22;
  void *v23;
  uint64_t v24;
  const char *v25;
  void *v26;
  uint64_t v27;
  const char *v28;
  CKSyncEngineState *v29;
  id v30;
  NSObject *v31;
  objc_class *v33;
  id v34;
  uint8_t buf[4];
  id v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v10 = v6;
  if (v6)
  {
    if (!objc_msgSend_length(v6, v7, v8, v9))
    {
      if (ck_log_initialization_predicate != -1)
        dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
      v11 = (void *)ck_log_facility_engine;
      if (os_log_type_enabled((os_log_t)ck_log_facility_engine, OS_LOG_TYPE_FAULT))
      {
        v12 = v11;
        v13 = (objc_class *)objc_opt_class();
        NSStringFromClass(v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v36 = v14;
        v15 = "BUG IN CLIENT OF CLOUDKIT: Initializing %@ with a zero-length state data.";
LABEL_23:
        _os_log_fault_impl(&dword_18A5C5000, v12, OS_LOG_TYPE_FAULT, v15, buf, 0xCu);

      }
    }
  }
  else
  {
    if (ck_log_initialization_predicate != -1)
      dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
    v16 = (void *)ck_log_facility_engine;
    if (os_log_type_enabled((os_log_t)ck_log_facility_engine, OS_LOG_TYPE_FAULT))
    {
      v12 = v16;
      v33 = (objc_class *)objc_opt_class();
      NSStringFromClass(v33);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v36 = v14;
      v15 = "BUG IN CLOUDKIT: Initializing %@ with a nil state data.";
      goto LABEL_23;
    }
  }
  v17 = (void *)MEMORY[0x1E0CB3710];
  v18 = objc_opt_class();
  objc_msgSend_setClass_forClassName_(v17, v19, v18, (uint64_t)CFSTR("CKSyncEngineMetadata"));
  v20 = (void *)MEMORY[0x1E0CB3710];
  v21 = objc_opt_class();
  objc_msgSend_setClass_forClassName_(v20, v22, v21, (uint64_t)CFSTR("CKSyncEngineRecordModification"));
  v23 = (void *)MEMORY[0x1E0CB3710];
  v24 = objc_opt_class();
  objc_msgSend_setClass_forClassName_(v23, v25, v24, (uint64_t)CFSTR("CKSyncEnginePendingRecordChange"));
  v26 = (void *)MEMORY[0x1E0CB3710];
  v27 = objc_opt_class();
  v34 = 0;
  objc_msgSend_unarchivedObjectOfClass_fromData_error_(v26, v28, v27, (uint64_t)v10, &v34);
  v29 = (CKSyncEngineState *)objc_claimAutoreleasedReturnValue();
  v30 = v34;

  if (!v30 && v29)
    goto LABEL_15;
  if (ck_log_initialization_predicate != -1)
    dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
  v31 = ck_log_facility_engine;
  if (!os_log_type_enabled((os_log_t)ck_log_facility_engine, OS_LOG_TYPE_FAULT))
  {
LABEL_15:
    if (!a4)
      goto LABEL_17;
    goto LABEL_16;
  }
  *(_DWORD *)buf = 138412290;
  v36 = v30;
  _os_log_fault_impl(&dword_18A5C5000, v31, OS_LOG_TYPE_FAULT, "Failed to unarchive sync engine state serialization: %@", buf, 0xCu);
  if (a4)
LABEL_16:
    *a4 = objc_retainAutorelease(v30);
LABEL_17:
  if (v30)
  {

    v29 = 0;
  }

  return v29;
}

- (CKSyncEngineState)init
{
  CKException *v2;
  const char *v3;
  id v4;

  v2 = [CKException alloc];
  v4 = (id)objc_msgSend_initWithName_format_(v2, v3, *MEMORY[0x1E0C99778], (uint64_t)CFSTR("%s is unavailable"), "-[CKSyncEngineState init]");
  objc_exception_throw(v4);
}

+ (id)emptyState
{
  CKSyncEngineState *v2;
  const char *v3;
  uint64_t v4;
  uint64_t v5;

  v2 = [CKSyncEngineState alloc];
  return (id)objc_msgSend_initInternal(v2, v3, v4, v5);
}

- (id)initInternal
{
  CKSyncEngineState *v2;
  CKSyncEngineState *v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CKSyncEngineState;
  v2 = -[CKSyncEngineState init](&v8, sel_init);
  v3 = v2;
  if (v2)
  {
    sub_18A805BB8((uint64_t)v2);
    objc_msgSend_setInitialValues(v3, v4, v5, v6);
  }
  return v3;
}

- (unint64_t)weight
{
  NSObject *queue;
  unint64_t v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  if (self)
    queue = self->_queue;
  else
    queue = 0;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = sub_18A805CF0;
  v5[3] = &unk_1E1F5F758;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)reset
{
  void *v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  int v15;
  void *v16;
  __int16 v17;
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  if (ck_log_initialization_predicate != -1)
    dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
  v3 = (void *)ck_log_facility_engine;
  if (os_log_type_enabled((os_log_t)ck_log_facility_engine, OS_LOG_TYPE_DEFAULT))
  {
    v7 = v3;
    objc_msgSend_shortDescription(self, v8, v9, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 138543618;
    v16 = v11;
    v17 = 2048;
    v18 = objc_msgSend_weight(self, v12, v13, v14);
    _os_log_impl(&dword_18A5C5000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ resetting state with weight=%tu", (uint8_t *)&v15, 0x16u);

  }
  objc_msgSend_setInitialValues(self, v4, v5, v6);
}

- (void)setInitialValues
{
  NSObject *queue;
  _QWORD block[5];

  if (self)
    queue = self->_queue;
  else
    queue = 0;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_18A805F24;
  block[3] = &unk_1E1F5FAA8;
  block[4] = self;
  dispatch_sync(queue, block);
}

- (id)description
{
  return (id)((uint64_t (*)(CKSyncEngineState *, char *))MEMORY[0x1E0DE7D20])(self, sel_CKDescription);
}

- (id)redactedDescription
{
  return (id)((uint64_t (*)(CKSyncEngineState *, char *))MEMORY[0x1E0DE7D20])(self, sel_CKRedactedDescription);
}

- (id)CKDescriptionPropertiesWithPublic:(BOOL)a3 private:(BOOL)a4 shouldExpand:(BOOL)a5
{
  void *v9;
  OS_dispatch_queue *queue;
  id v11;
  id v12;
  _QWORD v14[4];
  id v15;
  CKSyncEngineState *v16;
  BOOL v17;
  BOOL v18;
  BOOL v19;

  objc_msgSend_dictionary(MEMORY[0x1E0C99E08], a2, a3, a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (self)
    queue = self->_queue;
  else
    queue = 0;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = sub_18A8060F0;
  v14[3] = &unk_1E1F665B8;
  v11 = v9;
  v15 = v11;
  v16 = self;
  v17 = a3;
  v18 = a4;
  v19 = a5;
  ck_call_or_dispatch_sync_if_not_key(queue, &self->_queue, v14);
  v12 = v11;

  return v12;
}

- (CKSyncEngineState)initWithCoder:(id)a3
{
  id v4;
  CKSyncEngineState *v5;
  CKSyncEngineState *v6;
  const char *v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  char v13;
  const char *v14;
  uint64_t v15;
  char v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  CKServerChangeToken *serverChangeTokenForDatabase;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  const char *v27;
  uint64_t v28;
  void *v29;
  const char *v30;
  void *v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  NSMutableDictionary *v35;
  NSMutableDictionary *mServerChangeTokensByZoneID;
  void *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  const char *v41;
  uint64_t v42;
  void *v43;
  const char *v44;
  void *v45;
  id v46;
  const char *v47;
  uint64_t v48;
  NSMutableOrderedSet *v49;
  NSMutableOrderedSet *zoneIDsNeedingToFetchChangesSet;
  NSMutableOrderedSet *v51;
  NSMutableOrderedSet *v52;
  void *v53;
  uint64_t v54;
  uint64_t v55;
  const char *v56;
  uint64_t v57;
  void *v58;
  const char *v59;
  uint64_t v60;
  NSMutableOrderedSet *pendingRecordZoneChangesSet;
  NSMutableOrderedSet *v62;
  NSMutableOrderedSet *v63;
  void *v64;
  uint64_t v65;
  uint64_t v66;
  const char *v67;
  uint64_t v68;
  void *v69;
  const char *v70;
  uint64_t v71;
  NSMutableOrderedSet *inFlightRecordChangesSet;
  NSMutableOrderedSet *v73;
  NSMutableOrderedSet *v74;
  void *v75;
  uint64_t v76;
  uint64_t v77;
  const char *v78;
  uint64_t v79;
  void *v80;
  const char *v81;
  void *v82;
  id v83;
  const char *v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t i;
  uint64_t v89;
  CKSyncEnginePendingRecordZoneChange *v90;
  const char *v91;
  void *v92;
  const char *v93;
  uint64_t v94;
  const char *v95;
  void *v96;
  uint64_t v97;
  uint64_t v98;
  const char *v99;
  uint64_t v100;
  void *v101;
  const char *v102;
  void *v103;
  id v104;
  const char *v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t j;
  uint64_t v110;
  CKSyncEnginePendingRecordZoneChange *v111;
  const char *v112;
  void *v113;
  const char *v114;
  uint64_t v115;
  const char *v116;
  void *v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  const char *v121;
  uint64_t v122;
  void *v123;
  const char *v124;
  uint64_t v125;
  NSMutableOrderedSet *pendingDatabaseChangesSet;
  NSMutableOrderedSet *v127;
  NSMutableOrderedSet *v128;
  void *v129;
  uint64_t v130;
  uint64_t v131;
  const char *v132;
  uint64_t v133;
  void *v134;
  const char *v135;
  void *v136;
  void *v137;
  uint64_t v138;
  uint64_t v139;
  uint64_t v140;
  const char *v141;
  uint64_t v142;
  void *v143;
  const char *v144;
  void *v145;
  const char *v146;
  uint64_t v147;
  uint64_t v148;
  void *v149;
  const char *v150;
  uint64_t v151;
  NSMutableOrderedSet *v152;
  void *v153;
  const char *v154;
  uint64_t v155;
  void *v156;
  const char *v157;
  uint64_t v158;
  void *v159;
  uint64_t v160;
  uint64_t v161;
  const char *v162;
  uint64_t v163;
  void *v164;
  const char *v165;
  void *v166;
  const char *v167;
  uint64_t v168;
  uint64_t v169;
  NSMutableOrderedSet *v170;
  void *v171;
  const char *v172;
  uint64_t v173;
  void *v174;
  const char *v175;
  uint64_t v176;
  uint64_t v177;
  const char *v178;
  uint64_t v179;
  CKRecordID *lastKnownUserRecordID;
  const char *v181;
  uint64_t v182;
  uint64_t v183;
  const char *v184;
  uint64_t v185;
  NSDate *lastFetchDatabaseChangesDate;
  uint64_t v187;
  const char *v188;
  uint64_t v189;
  NSString *existingDatabaseSubscriptionID;
  void *v192;
  void *v193;
  __int128 v194;
  __int128 v195;
  __int128 v196;
  __int128 v197;
  __int128 v198;
  __int128 v199;
  __int128 v200;
  __int128 v201;
  objc_super v202;
  _BYTE v203[128];
  _BYTE v204[128];
  uint64_t v205;

  v205 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v202.receiver = self;
  v202.super_class = (Class)CKSyncEngineState;
  v5 = -[CKSyncEngineState init](&v202, sel_init);
  v6 = v5;
  if (!v5)
    goto LABEL_45;
  sub_18A805BB8((uint64_t)v5);
  v6->_needsToFetchDatabaseChanges = objc_msgSend_decodeBoolForKey_(v4, v7, (uint64_t)CFSTR("needsToFetchDatabaseChanges"), v8);
  v6->_needsToSaveDatabaseSubscription = objc_msgSend_decodeBoolForKey_(v4, v9, (uint64_t)CFSTR("needsToSaveDatabaseSubscription"), v10);
  v13 = objc_msgSend_decodeBoolForKey_(v4, v11, (uint64_t)CFSTR("hasPendingUntrackedChanges"), v12);
  v6->_hasPendingUntrackedChanges = v13;
  if ((v13 & 1) == 0)
    v6->_hasPendingUntrackedChanges = objc_msgSend_decodeBoolForKey_(v4, v14, (uint64_t)CFSTR("hasAdopterTrackedPendingModifications"), v15);
  v16 = objc_msgSend_decodeBoolForKey_(v4, v14, (uint64_t)CFSTR("hasInFlightUntrackedChanges"), v15);
  v6->_hasInFlightUntrackedChanges = v16;
  if ((v16 & 1) == 0)
    v6->_hasInFlightUntrackedChanges = objc_msgSend_decodeBoolForKey_(v4, v17, (uint64_t)CFSTR("hasInFlightAdopterTrackedModifications"), v18);
  v19 = objc_opt_class();
  objc_msgSend_decodeObjectOfClass_forKey_(v4, v20, v19, (uint64_t)CFSTR("serverChangeTokenForDatabase"));
  v21 = objc_claimAutoreleasedReturnValue();
  serverChangeTokenForDatabase = v6->_serverChangeTokenForDatabase;
  v6->_serverChangeTokenForDatabase = (CKServerChangeToken *)v21;

  v23 = (void *)MEMORY[0x1E0C99E60];
  v24 = objc_opt_class();
  v25 = objc_opt_class();
  v26 = objc_opt_class();
  objc_msgSend_setWithObjects_(v23, v27, v24, v28, v25, v26, 0);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_decodeObjectOfClasses_forKey_(v4, v30, (uint64_t)v29, (uint64_t)CFSTR("serverChangeTokensByZoneID"));
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  v193 = v31;
  if (v31)
    v35 = (NSMutableDictionary *)objc_msgSend_mutableCopy(v31, v32, v33, v34);
  else
    v35 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
  mServerChangeTokensByZoneID = v6->_mServerChangeTokensByZoneID;
  v6->_mServerChangeTokensByZoneID = v35;

  v37 = (void *)MEMORY[0x1E0C99E60];
  v38 = objc_opt_class();
  v39 = objc_opt_class();
  v40 = objc_opt_class();
  objc_msgSend_setWithObjects_(v37, v41, v38, v42, v39, v40, 0);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_decodeObjectOfClasses_forKey_(v4, v44, (uint64_t)v43, (uint64_t)CFSTR("zoneIDsNeedingToFetchChanges"));
  v45 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v46 = objc_alloc(MEMORY[0x1E0C99E10]);
    v49 = (NSMutableOrderedSet *)objc_msgSend_initWithSet_(v46, v47, (uint64_t)v45, v48);
LABEL_13:
    zoneIDsNeedingToFetchChangesSet = v6->_zoneIDsNeedingToFetchChangesSet;
    v6->_zoneIDsNeedingToFetchChangesSet = v49;

    goto LABEL_14;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v49 = v45;
    goto LABEL_13;
  }
LABEL_14:
  v192 = v45;
  if (!v6->_zoneIDsNeedingToFetchChangesSet)
  {
    v51 = (NSMutableOrderedSet *)objc_alloc_init(MEMORY[0x1E0C99E10]);
    v52 = v6->_zoneIDsNeedingToFetchChangesSet;
    v6->_zoneIDsNeedingToFetchChangesSet = v51;

  }
  v53 = (void *)MEMORY[0x1E0C99E60];
  v54 = objc_opt_class();
  v55 = objc_opt_class();
  objc_msgSend_setWithObjects_(v53, v56, v54, v57, v55, 0);
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_decodeObjectOfClasses_forKey_(v4, v59, (uint64_t)v58, (uint64_t)CFSTR("pendingRecordModifications"));
  v60 = objc_claimAutoreleasedReturnValue();
  pendingRecordZoneChangesSet = v6->_pendingRecordZoneChangesSet;
  v6->_pendingRecordZoneChangesSet = (NSMutableOrderedSet *)v60;

  if (!v6->_pendingRecordZoneChangesSet)
  {
    v62 = (NSMutableOrderedSet *)objc_alloc_init(MEMORY[0x1E0C99E10]);
    v63 = v6->_pendingRecordZoneChangesSet;
    v6->_pendingRecordZoneChangesSet = v62;

  }
  v64 = (void *)MEMORY[0x1E0C99E60];
  v65 = objc_opt_class();
  v66 = objc_opt_class();
  objc_msgSend_setWithObjects_(v64, v67, v65, v68, v66, 0);
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_decodeObjectOfClasses_forKey_(v4, v70, (uint64_t)v69, (uint64_t)CFSTR("inFlightRecordModifications"));
  v71 = objc_claimAutoreleasedReturnValue();
  inFlightRecordChangesSet = v6->_inFlightRecordChangesSet;
  v6->_inFlightRecordChangesSet = (NSMutableOrderedSet *)v71;

  if (!v6->_inFlightRecordChangesSet)
  {
    v73 = (NSMutableOrderedSet *)objc_alloc_init(MEMORY[0x1E0C99E10]);
    v74 = v6->_inFlightRecordChangesSet;
    v6->_inFlightRecordChangesSet = v73;

  }
  v75 = (void *)MEMORY[0x1E0C99E60];
  v76 = objc_opt_class();
  v77 = objc_opt_class();
  objc_msgSend_setWithObjects_(v75, v78, v76, v79, v77, 0);
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_decodeObjectOfClasses_forKey_(v4, v81, (uint64_t)v80, (uint64_t)CFSTR("recordIDsToSave"));
  v82 = (void *)objc_claimAutoreleasedReturnValue();

  v200 = 0u;
  v201 = 0u;
  v198 = 0u;
  v199 = 0u;
  v83 = v82;
  v85 = objc_msgSend_countByEnumeratingWithState_objects_count_(v83, v84, (uint64_t)&v198, (uint64_t)v204, 16);
  if (v85)
  {
    v86 = v85;
    v87 = *(_QWORD *)v199;
    do
    {
      for (i = 0; i != v86; ++i)
      {
        if (*(_QWORD *)v199 != v87)
          objc_enumerationMutation(v83);
        v89 = *(_QWORD *)(*((_QWORD *)&v198 + 1) + 8 * i);
        v90 = [CKSyncEnginePendingRecordZoneChange alloc];
        v92 = (void *)objc_msgSend_initWithRecordID_type_(v90, v91, v89, 0);
        objc_msgSend_addObject_(v6->_pendingRecordZoneChangesSet, v93, (uint64_t)v92, v94);

      }
      v86 = objc_msgSend_countByEnumeratingWithState_objects_count_(v83, v95, (uint64_t)&v198, (uint64_t)v204, 16);
    }
    while (v86);
  }

  v96 = (void *)MEMORY[0x1E0C99E60];
  v97 = objc_opt_class();
  v98 = objc_opt_class();
  objc_msgSend_setWithObjects_(v96, v99, v97, v100, v98, 0);
  v101 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_decodeObjectOfClasses_forKey_(v4, v102, (uint64_t)v101, (uint64_t)CFSTR("recordIDsToDelete"));
  v103 = (void *)objc_claimAutoreleasedReturnValue();

  v196 = 0u;
  v197 = 0u;
  v194 = 0u;
  v195 = 0u;
  v104 = v103;
  v106 = objc_msgSend_countByEnumeratingWithState_objects_count_(v104, v105, (uint64_t)&v194, (uint64_t)v203, 16);
  if (v106)
  {
    v107 = v106;
    v108 = *(_QWORD *)v195;
    do
    {
      for (j = 0; j != v107; ++j)
      {
        if (*(_QWORD *)v195 != v108)
          objc_enumerationMutation(v104);
        v110 = *(_QWORD *)(*((_QWORD *)&v194 + 1) + 8 * j);
        v111 = [CKSyncEnginePendingRecordZoneChange alloc];
        v113 = (void *)objc_msgSend_initWithRecordID_type_(v111, v112, v110, 1);
        objc_msgSend_addObject_(v6->_pendingRecordZoneChangesSet, v114, (uint64_t)v113, v115);

      }
      v107 = objc_msgSend_countByEnumeratingWithState_objects_count_(v104, v116, (uint64_t)&v194, (uint64_t)v203, 16);
    }
    while (v107);
  }

  v117 = (void *)MEMORY[0x1E0C99E60];
  v118 = objc_opt_class();
  v119 = objc_opt_class();
  v120 = objc_opt_class();
  objc_msgSend_setWithObjects_(v117, v121, v118, v122, v119, v120, 0);
  v123 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_decodeObjectOfClasses_forKey_(v4, v124, (uint64_t)v123, (uint64_t)CFSTR("pendingZoneChanges"));
  v125 = objc_claimAutoreleasedReturnValue();
  pendingDatabaseChangesSet = v6->_pendingDatabaseChangesSet;
  v6->_pendingDatabaseChangesSet = (NSMutableOrderedSet *)v125;

  if (!v6->_pendingDatabaseChangesSet)
  {
    v127 = (NSMutableOrderedSet *)objc_alloc_init(MEMORY[0x1E0C99E10]);
    v128 = v6->_pendingDatabaseChangesSet;
    v6->_pendingDatabaseChangesSet = v127;

  }
  v129 = (void *)MEMORY[0x1E0C99E60];
  v130 = objc_opt_class();
  v131 = objc_opt_class();
  objc_msgSend_setWithObjects_(v129, v132, v130, v133, v131, 0);
  v134 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_decodeObjectOfClasses_forKey_(v4, v135, (uint64_t)v134, (uint64_t)CFSTR("zoneIDsToSave"));
  v136 = (void *)objc_claimAutoreleasedReturnValue();

  v137 = (void *)MEMORY[0x1E0C99E60];
  v138 = objc_opt_class();
  v139 = objc_opt_class();
  v140 = objc_opt_class();
  objc_msgSend_setWithObjects_(v137, v141, v138, v142, v139, v140, 0);
  v143 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_decodeObjectOfClasses_forKey_(v4, v144, (uint64_t)v143, (uint64_t)CFSTR("zonesToSave"));
  v145 = (void *)objc_claimAutoreleasedReturnValue();

  if (v145)
  {
    if (!v136)
      v136 = (void *)objc_opt_new();
    objc_msgSend_allKeys(v145, v146, v147, v148);
    v149 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_addObjectsFromArray_(v136, v150, (uint64_t)v149, v151);

  }
  if (v136)
  {
    v152 = v6->_pendingDatabaseChangesSet;
    objc_msgSend_array(v136, v146, v147, v148);
    v153 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_CKMap_(v153, v154, (uint64_t)&unk_1E1F58B38, v155);
    v156 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_addObjectsFromArray_(v152, v157, (uint64_t)v156, v158);

  }
  v159 = (void *)MEMORY[0x1E0C99E60];
  v160 = objc_opt_class();
  v161 = objc_opt_class();
  objc_msgSend_setWithObjects_(v159, v162, v160, v163, v161, 0);
  v164 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_decodeObjectOfClasses_forKey_(v4, v165, (uint64_t)v164, (uint64_t)CFSTR("zoneIDsToDelete"));
  v166 = (void *)objc_claimAutoreleasedReturnValue();

  if (v166)
  {
    v170 = v6->_pendingDatabaseChangesSet;
    objc_msgSend_array(v166, v167, v168, v169);
    v171 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_CKMap_(v171, v172, (uint64_t)&unk_1E1F55A00, v173);
    v174 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_addObjectsFromArray_(v170, v175, (uint64_t)v174, v176);

  }
  v177 = objc_opt_class();
  objc_msgSend_decodeObjectOfClass_forKey_(v4, v178, v177, (uint64_t)CFSTR("lastKnownUserRecordID"));
  v179 = objc_claimAutoreleasedReturnValue();
  lastKnownUserRecordID = v6->_lastKnownUserRecordID;
  v6->_lastKnownUserRecordID = (CKRecordID *)v179;

  v6->_didPerformInitialUserRecordIDFetch = objc_msgSend_decodeBoolForKey_(v4, v181, (uint64_t)CFSTR("didPerformInitialUserRecordIDFetch"), v182);
  v183 = objc_opt_class();
  objc_msgSend_decodeObjectOfClass_forKey_(v4, v184, v183, (uint64_t)CFSTR("lastFetchDatabaseChangesDate"));
  v185 = objc_claimAutoreleasedReturnValue();
  lastFetchDatabaseChangesDate = v6->_lastFetchDatabaseChangesDate;
  v6->_lastFetchDatabaseChangesDate = (NSDate *)v185;

  v187 = objc_opt_class();
  objc_msgSend_decodeObjectOfClass_forKey_(v4, v188, v187, (uint64_t)CFSTR("existingDatabaseSubscriptionID"));
  v189 = objc_claimAutoreleasedReturnValue();
  existingDatabaseSubscriptionID = v6->_existingDatabaseSubscriptionID;
  v6->_existingDatabaseSubscriptionID = (NSString *)v189;

LABEL_45:
  return v6;
}

- (void)addPendingRecordZoneChanges:(NSArray *)changes
{
  NSArray *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  OS_dispatch_queue *queue;
  OS_dispatch_queue *v9;
  const char *v10;
  _QWORD v11[4];
  NSArray *v12;
  CKSyncEngineState *v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  char v18;

  v4 = changes;
  if (objc_msgSend_count(v4, v5, v6, v7))
  {
    v15 = 0;
    v16 = &v15;
    v17 = 0x2020000000;
    v18 = 0;
    if (self)
      queue = self->_queue;
    else
      queue = 0;
    v9 = queue;
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = sub_18A80712C;
    v11[3] = &unk_1E1F62670;
    v12 = v4;
    v13 = self;
    v14 = &v15;
    ck_call_or_dispatch_sync_if_not_key(v9, &self->_queue, v11);

    if (*((_BYTE *)v16 + 24))
      objc_msgSend_notifyChangeHandlerWithCoalescing_scheduleSync_(self, v10, 1, 1);

    _Block_object_dispose(&v15, 8);
  }

}

- (void)markRecordZoneChanges:(id)a3 inFlight:(BOOL)a4
{
  id v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  OS_dispatch_queue *queue;
  const char *v11;
  _QWORD v12[5];
  id v13;
  BOOL v14;

  v6 = a3;
  if (objc_msgSend_count(v6, v7, v8, v9))
  {
    if (self)
      queue = self->_queue;
    else
      queue = 0;
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = sub_18A807488;
    v12[3] = &unk_1E1F63188;
    v12[4] = self;
    v14 = a4;
    v13 = v6;
    ck_call_or_dispatch_sync_if_not_key(queue, &self->_queue, v12);
    objc_msgSend_notifyChangeHandlerWithCoalescing_scheduleSync_(self, v11, 1, 0);

  }
}

- (void)removeInFlightRecordChanges:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  OS_dispatch_queue *queue;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t);
  void *v13;
  CKSyncEngineState *v14;
  id v15;

  v4 = a3;
  if (objc_msgSend_count(v4, v5, v6, v7))
  {
    if (self)
      queue = self->_queue;
    else
      queue = 0;
    v10 = MEMORY[0x1E0C809B0];
    v11 = 3221225472;
    v12 = sub_18A807B10;
    v13 = &unk_1E1F61A48;
    v14 = self;
    v15 = v4;
    ck_call_or_dispatch_sync_if_not_key(queue, &self->_queue, &v10);
    objc_msgSend_notifyChangeHandlerWithCoalescing_scheduleSync_(self, v9, 1, 0, v10, v11, v12, v13, v14);

  }
}

- (BOOL)containsInFlightRecordZoneChange:(id)a3
{
  id v4;
  OS_dispatch_queue *queue;
  OS_dispatch_queue *v6;
  OS_dispatch_queue **p_queue;
  id v8;
  char v9;
  _QWORD v11[5];
  id v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  char v17;

  v4 = a3;
  v14 = 0;
  v15 = &v14;
  v16 = 0x2020000000;
  v17 = 0;
  if (self)
    queue = self->_queue;
  else
    queue = 0;
  v6 = queue;
  p_queue = &self->_queue;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = sub_18A807D50;
  v11[3] = &unk_1E1F61B38;
  v13 = &v14;
  v11[4] = self;
  v8 = v4;
  v12 = v8;
  ck_call_or_dispatch_sync_if_not_key(v6, p_queue, v11);

  v9 = *((_BYTE *)v15 + 24);
  _Block_object_dispose(&v14, 8);

  return v9;
}

- (BOOL)containsPendingRecordZoneChange:(id)a3
{
  id v4;
  OS_dispatch_queue *queue;
  OS_dispatch_queue *v6;
  OS_dispatch_queue **p_queue;
  id v8;
  char v9;
  _QWORD v11[5];
  id v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  char v17;

  v4 = a3;
  v14 = 0;
  v15 = &v14;
  v16 = 0x2020000000;
  v17 = 0;
  if (self)
    queue = self->_queue;
  else
    queue = 0;
  v6 = queue;
  p_queue = &self->_queue;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = sub_18A807EA4;
  v11[3] = &unk_1E1F61B38;
  v13 = &v14;
  v11[4] = self;
  v8 = v4;
  v12 = v8;
  ck_call_or_dispatch_sync_if_not_key(v6, p_queue, v11);

  v9 = *((_BYTE *)v15 + 24);
  _Block_object_dispose(&v14, 8);

  return v9;
}

- (void)setPendingRecordZoneChanges:(id)a3
{
  id v4;
  id v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  OS_dispatch_queue *queue;
  OS_dispatch_queue **p_queue;
  id v12;
  NSObject *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  _QWORD v18[5];
  id v19;
  uint8_t buf[4];
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = (id)MEMORY[0x1E0C9AA60];
  if (a3)
    v4 = a3;
  v5 = v4;
  if (!objc_msgSend_count(v5, v6, v7, v8))
  {
    if (ck_log_initialization_predicate != -1)
      dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
    v9 = (void *)ck_log_facility_engine;
    if (os_log_type_enabled((os_log_t)ck_log_facility_engine, OS_LOG_TYPE_DEBUG))
    {
      v13 = v9;
      objc_msgSend_shortDescription(self, v14, v15, v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v21 = v17;
      _os_log_debug_impl(&dword_18A5C5000, v13, OS_LOG_TYPE_DEBUG, "%{public}@ no new pending record zone changes to add", buf, 0xCu);

      if (self)
        goto LABEL_8;
LABEL_11:
      queue = 0;
      goto LABEL_9;
    }
  }
  if (!self)
    goto LABEL_11;
LABEL_8:
  queue = self->_queue;
LABEL_9:
  p_queue = &self->_queue;
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = sub_18A80807C;
  v18[3] = &unk_1E1F61A48;
  v18[4] = self;
  v19 = v5;
  v12 = v5;
  ck_call_or_dispatch_sync_if_not_key(queue, p_queue, v18);

}

- (NSArray)inFlightRecordChanges
{
  OS_dispatch_queue *queue;
  OS_dispatch_queue *v4;
  id v5;
  _QWORD v7[6];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  id v13;

  v8 = 0;
  v9 = &v8;
  v10 = 0x3032000000;
  v11 = sub_18A807004;
  v12 = sub_18A807014;
  v13 = 0;
  if (self)
    queue = self->_queue;
  else
    queue = 0;
  v4 = queue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = sub_18A808374;
  v7[3] = &unk_1E1F5F758;
  v7[4] = self;
  v7[5] = &v8;
  ck_call_or_dispatch_sync_if_not_key(v4, &self->_queue, v7);

  v5 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return (NSArray *)v5;
}

- (void)moveInFlightChangesToPending
{
  OS_dispatch_queue *queue;
  _QWORD v3[5];

  if (self)
    queue = self->_queue;
  else
    queue = 0;
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = sub_18A808440;
  v3[3] = &unk_1E1F5FAA8;
  v3[4] = self;
  ck_call_or_dispatch_sync_if_not_key(queue, &self->_queue, v3);
}

- (void)setServerChangeToken:(id)a3 forZoneID:(id)a4
{
  id v6;
  id v7;
  void *v8;
  OS_dispatch_queue *queue;
  id v10;
  id v11;
  const char *v12;
  _QWORD v13[5];
  id v14;
  id v15;

  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (self)
    queue = self->_queue;
  else
    queue = 0;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = sub_18A80867C;
  v13[3] = &unk_1E1F60DD8;
  v13[4] = self;
  v14 = v7;
  v15 = v6;
  v10 = v6;
  v11 = v8;
  ck_call_or_dispatch_sync_if_not_key(queue, &self->_queue, v13);
  objc_msgSend_notifyChangeHandlerWithCoalescing_scheduleSync_(self, v12, 0, 0);

}

- (id)serverChangeTokenForZoneID:(id)a3
{
  id v4;
  OS_dispatch_queue *queue;
  OS_dispatch_queue *v6;
  OS_dispatch_queue **p_queue;
  id v8;
  id v9;
  _QWORD v11[5];
  id v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;

  v4 = a3;
  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = sub_18A807004;
  v18 = sub_18A807014;
  v19 = 0;
  if (self)
    queue = self->_queue;
  else
    queue = 0;
  v6 = queue;
  p_queue = &self->_queue;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = sub_18A808920;
  v11[3] = &unk_1E1F61B38;
  v13 = &v14;
  v11[4] = self;
  v8 = v4;
  v12 = v8;
  ck_call_or_dispatch_sync_if_not_key(v6, p_queue, v11);

  v9 = (id)v15[5];
  _Block_object_dispose(&v14, 8);

  return v9;
}

- (BOOL)needsToFetchChangesForZoneID:(id)a3
{
  id v4;
  OS_dispatch_queue *queue;
  OS_dispatch_queue *v6;
  OS_dispatch_queue **p_queue;
  id v8;
  char v9;
  _QWORD v11[5];
  id v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  char v17;

  v4 = a3;
  v14 = 0;
  v15 = &v14;
  v16 = 0x2020000000;
  v17 = 0;
  if (self)
    queue = self->_queue;
  else
    queue = 0;
  v6 = queue;
  p_queue = &self->_queue;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = sub_18A808A5C;
  v11[3] = &unk_1E1F61B38;
  v13 = &v14;
  v11[4] = self;
  v8 = v4;
  v12 = v8;
  ck_call_or_dispatch_sync_if_not_key(v6, p_queue, v11);

  v9 = *((_BYTE *)v15 + 24);
  _Block_object_dispose(&v14, 8);

  return v9;
}

- (void)setPendingDatabaseChanges:(id)a3
{
  id v4;
  id v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  OS_dispatch_queue *queue;
  OS_dispatch_queue **p_queue;
  id v12;
  NSObject *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  _QWORD v18[5];
  id v19;
  uint8_t buf[4];
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = (id)MEMORY[0x1E0C9AA60];
  if (a3)
    v4 = a3;
  v5 = v4;
  if (!objc_msgSend_count(v5, v6, v7, v8))
  {
    if (ck_log_initialization_predicate != -1)
      dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
    v9 = (void *)ck_log_facility_engine;
    if (os_log_type_enabled((os_log_t)ck_log_facility_engine, OS_LOG_TYPE_DEBUG))
    {
      v13 = v9;
      objc_msgSend_shortDescription(self, v14, v15, v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v21 = v17;
      _os_log_debug_impl(&dword_18A5C5000, v13, OS_LOG_TYPE_DEBUG, "%{public}@ no new pending zone changes to add", buf, 0xCu);

      if (self)
        goto LABEL_8;
LABEL_11:
      queue = 0;
      goto LABEL_9;
    }
  }
  if (!self)
    goto LABEL_11;
LABEL_8:
  queue = self->_queue;
LABEL_9:
  p_queue = &self->_queue;
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = sub_18A808C34;
  v18[3] = &unk_1E1F61A48;
  v18[4] = self;
  v19 = v5;
  v12 = v5;
  ck_call_or_dispatch_sync_if_not_key(queue, p_queue, v18);

}

- (void)addPendingDatabaseChanges:(NSArray *)changes
{
  NSArray *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  OS_dispatch_queue *queue;
  OS_dispatch_queue *v9;
  const char *v10;
  void *v11;
  NSObject *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  _QWORD v17[4];
  NSArray *v18;
  CKSyncEngineState *v19;
  __int128 *p_buf;
  __int128 buf;
  uint64_t v22;
  char v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v4 = changes;
  if (objc_msgSend_count(v4, v5, v6, v7))
  {
    *(_QWORD *)&buf = 0;
    *((_QWORD *)&buf + 1) = &buf;
    v22 = 0x2020000000;
    v23 = 0;
    if (self)
      queue = self->_queue;
    else
      queue = 0;
    v9 = queue;
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = sub_18A809028;
    v17[3] = &unk_1E1F62670;
    v18 = v4;
    v19 = self;
    p_buf = &buf;
    ck_call_or_dispatch_sync_if_not_key(v9, &self->_queue, v17);

    if (*(_BYTE *)(*((_QWORD *)&buf + 1) + 24))
      objc_msgSend_notifyChangeHandlerWithCoalescing_scheduleSync_(self, v10, 1, 1);

    _Block_object_dispose(&buf, 8);
  }
  else
  {
    if (ck_log_initialization_predicate != -1)
      dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
    v11 = (void *)ck_log_facility_engine;
    if (os_log_type_enabled((os_log_t)ck_log_facility_engine, OS_LOG_TYPE_DEBUG))
    {
      v12 = v11;
      objc_msgSend_shortDescription(self, v13, v14, v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(buf) = 138543362;
      *(_QWORD *)((char *)&buf + 4) = v16;
      _os_log_debug_impl(&dword_18A5C5000, v12, OS_LOG_TYPE_DEBUG, "%{public}@ no new pending database changes to add", (uint8_t *)&buf, 0xCu);

    }
  }

}

- (void)removePendingDatabaseChanges:(NSArray *)changes
{
  NSArray *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  OS_dispatch_queue *queue;
  OS_dispatch_queue *v9;
  const char *v10;
  void *v11;
  NSObject *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  _QWORD v17[4];
  NSArray *v18;
  CKSyncEngineState *v19;
  __int128 *p_buf;
  __int128 buf;
  uint64_t v22;
  char v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v4 = changes;
  if (objc_msgSend_count(v4, v5, v6, v7))
  {
    *(_QWORD *)&buf = 0;
    *((_QWORD *)&buf + 1) = &buf;
    v22 = 0x2020000000;
    v23 = 0;
    if (self)
      queue = self->_queue;
    else
      queue = 0;
    v9 = queue;
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = sub_18A809410;
    v17[3] = &unk_1E1F62670;
    v18 = v4;
    v19 = self;
    p_buf = &buf;
    ck_call_or_dispatch_sync_if_not_key(v9, &self->_queue, v17);

    if (*(_BYTE *)(*((_QWORD *)&buf + 1) + 24))
      objc_msgSend_notifyChangeHandlerWithCoalescing_scheduleSync_(self, v10, 1, 0);

    _Block_object_dispose(&buf, 8);
  }
  else
  {
    if (ck_log_initialization_predicate != -1)
      dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
    v11 = (void *)ck_log_facility_engine;
    if (os_log_type_enabled((os_log_t)ck_log_facility_engine, OS_LOG_TYPE_DEBUG))
    {
      v12 = v11;
      objc_msgSend_shortDescription(self, v13, v14, v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(buf) = 138543362;
      *(_QWORD *)((char *)&buf + 4) = v16;
      _os_log_debug_impl(&dword_18A5C5000, v12, OS_LOG_TYPE_DEBUG, "%{public}@ no new pending database changes to remove", (uint8_t *)&buf, 0xCu);

    }
  }

}

- (BOOL)needsToSaveZoneID:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  char isEqual;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  objc_msgSend_pendingDatabaseChanges(self, v5, v6, v7, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend_countByEnumeratingWithState_objects_count_(v8, v9, (uint64_t)&v22, (uint64_t)v26, 16);
  if (v13)
  {
    v14 = *(_QWORD *)v23;
    while (2)
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v23 != v14)
          objc_enumerationMutation(v8);
        v16 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
        if (!objc_msgSend_type(v16, v10, v11, v12))
        {
          objc_msgSend_zoneID(v16, v10, v11, v12);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          isEqual = objc_msgSend_isEqual_(v17, v18, (uint64_t)v4, v19);

          if ((isEqual & 1) != 0)
          {
            LOBYTE(v13) = 1;
            goto LABEL_12;
          }
        }
      }
      v13 = objc_msgSend_countByEnumeratingWithState_objects_count_(v8, v10, (uint64_t)&v22, (uint64_t)v26, 16);
      if (v13)
        continue;
      break;
    }
  }
LABEL_12:

  return v13;
}

- (BOOL)needsToDeleteZoneID:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  char isEqual;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  objc_msgSend_pendingDatabaseChanges(self, v5, v6, v7, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend_countByEnumeratingWithState_objects_count_(v8, v9, (uint64_t)&v22, (uint64_t)v26, 16);
  if (v13)
  {
    v14 = *(_QWORD *)v23;
    while (2)
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v23 != v14)
          objc_enumerationMutation(v8);
        v16 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
        if (objc_msgSend_type(v16, v10, v11, v12) == 1)
        {
          objc_msgSend_zoneID(v16, v10, v11, v12);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          isEqual = objc_msgSend_isEqual_(v17, v18, (uint64_t)v4, v19);

          if ((isEqual & 1) != 0)
          {
            LOBYTE(v13) = 1;
            goto LABEL_12;
          }
        }
      }
      v13 = objc_msgSend_countByEnumeratingWithState_objects_count_(v8, v10, (uint64_t)&v22, (uint64_t)v26, 16);
      if (v13)
        continue;
      break;
    }
  }
LABEL_12:

  return v13;
}

- (void)setNeedsToSaveDatabaseSubscription:(BOOL)a3
{
  CKSyncEngineState *v3;
  const char *v4;
  _QWORD v5[5];
  BOOL v6;

  v3 = self;
  if (self)
    self = (CKSyncEngineState *)self->_queue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = sub_18A8098A8;
  v5[3] = &unk_1E1F61A70;
  v6 = a3;
  v5[4] = v3;
  ck_call_or_dispatch_sync_if_not_key(self, &v3->_queue, v5);
  objc_msgSend_notifyChangeHandlerWithCoalescing_scheduleSync_(v3, v4, 1, 0);
}

- (void)setLastKnownUserRecordID:(id)a3
{
  id v4;
  OS_dispatch_queue *queue;
  id v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(uint64_t);
  void *v11;
  CKSyncEngineState *v12;
  id v13;

  v4 = a3;
  if (self)
    queue = self->_queue;
  else
    queue = 0;
  v8 = MEMORY[0x1E0C809B0];
  v9 = 3221225472;
  v10 = sub_18A809A94;
  v11 = &unk_1E1F61A48;
  v12 = self;
  v13 = v4;
  v6 = v4;
  ck_call_or_dispatch_sync_if_not_key(queue, &self->_queue, &v8);
  objc_msgSend_notifyChangeHandlerWithCoalescing_scheduleSync_(self, v7, 1, 0, v8, v9, v10, v11, v12);

}

- (void)setHasPendingUntrackedChanges:(BOOL)hasPendingUntrackedChanges
{
  OS_dispatch_queue *queue;
  OS_dispatch_queue *v6;
  const char *v7;
  _QWORD v8[6];
  BOOL v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  char v13;

  v10 = 0;
  v11 = &v10;
  v12 = 0x2020000000;
  v13 = 0;
  if (self)
    queue = self->_queue;
  else
    queue = 0;
  v6 = queue;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = sub_18A809CE4;
  v8[3] = &unk_1E1F66608;
  v9 = hasPendingUntrackedChanges;
  v8[4] = self;
  v8[5] = &v10;
  ck_call_or_dispatch_sync_if_not_key(v6, &self->_queue, v8);

  objc_msgSend_notifyChangeHandlerWithCoalescing_scheduleSync_(self, v7, 1, *((unsigned __int8 *)v11 + 24));
  _Block_object_dispose(&v10, 8);
}

- (void)setHasInFlightUntrackedChanges:(BOOL)a3
{
  CKSyncEngineState *v3;
  const char *v4;
  _QWORD v5[5];
  BOOL v6;

  v3 = self;
  if (self)
    self = (CKSyncEngineState *)self->_queue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = sub_18A809EB0;
  v5[3] = &unk_1E1F61A70;
  v6 = a3;
  v5[4] = v3;
  ck_call_or_dispatch_sync_if_not_key(self, &v3->_queue, v5);
  objc_msgSend_notifyChangeHandlerWithCoalescing_scheduleSync_(v3, v4, 1, 0);
}

- (void)setExistingDatabaseSubscriptionID:(id)a3
{
  id v4;
  OS_dispatch_queue *queue;
  OS_dispatch_queue **p_queue;
  id v7;
  _QWORD v8[5];
  id v9;

  v4 = a3;
  if (self)
    queue = self->_queue;
  else
    queue = 0;
  p_queue = &self->_queue;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = sub_18A80A08C;
  v8[3] = &unk_1E1F61A48;
  v8[4] = self;
  v9 = v4;
  v7 = v4;
  ck_call_or_dispatch_sync_if_not_key(queue, p_queue, v8);

}

- (NSMutableDictionary)mServerChangeTokensByZoneID
{
  return self->_mServerChangeTokensByZoneID;
}

- (void)setFakeRecordIDsToSaveForSerializationTests:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 104);
}

- (void)setFakeRecordIDsToDeleteForSerializationTests:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 112);
}

- (void)setFakeZonesToSaveForSerializationTests:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 120);
}

- (void)setFakeZoneIDsToSaveForSerializationTests:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 128);
}

- (void)setFakeZoneIDsToDeleteForSerializationTests:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 136);
}

- (CKRecordID)mockNextKnownUserRecordID
{
  return (CKRecordID *)objc_getProperty(self, a2, 144, 1);
}

- (void)setMockNextKnownUserRecordID:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 144);
}

- (BOOL)useMockNextKnownUserRecordID
{
  return self->_useMockNextKnownUserRecordID;
}

- (void)setUseMockNextKnownUserRecordID:(BOOL)a3
{
  self->_useMockNextKnownUserRecordID = a3;
}

- (void)setChangeHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 152);
}

- (void)setLoggingID:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 160);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_loggingID, 0);
  objc_storeStrong(&self->_changeHandler, 0);
  objc_storeStrong((id *)&self->_mockNextKnownUserRecordID, 0);
  objc_storeStrong((id *)&self->_fakeZoneIDsToDeleteForSerializationTests, 0);
  objc_storeStrong((id *)&self->_fakeZoneIDsToSaveForSerializationTests, 0);
  objc_storeStrong((id *)&self->_fakeZonesToSaveForSerializationTests, 0);
  objc_storeStrong((id *)&self->_fakeRecordIDsToDeleteForSerializationTests, 0);
  objc_storeStrong((id *)&self->_fakeRecordIDsToSaveForSerializationTests, 0);
  objc_storeStrong((id *)&self->_inFlightRecordChangesSet, 0);
  objc_storeStrong((id *)&self->_pendingRecordZoneChangesSet, 0);
  objc_storeStrong((id *)&self->_pendingDatabaseChangesSet, 0);
  objc_storeStrong((id *)&self->_zoneIDsNeedingToFetchChangesSet, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_existingDatabaseSubscriptionID, 0);
  objc_storeStrong((id *)&self->_lastFetchDatabaseChangesDate, 0);
  objc_storeStrong((id *)&self->_mServerChangeTokensByZoneID, 0);
  objc_storeStrong((id *)&self->_lastKnownUserRecordID, 0);
  objc_storeStrong((id *)&self->_serverChangeTokenForDatabase, 0);
}

@end
