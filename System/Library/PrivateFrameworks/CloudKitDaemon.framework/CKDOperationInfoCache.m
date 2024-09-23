@implementation CKDOperationInfoCache

+ (id)sharedCache
{
  uint64_t v2;
  void *v5;
  const char *v6;

  objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], a2, v2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v5, v6, (uint64_t)a2, a1, CFSTR("CKDOperationInfoCache.m"), 123, CFSTR("Use -initWithDeviceContext:"));

  return 0;
}

+ (id)dbFileName
{
  return CFSTR("CloudKitOperationInfo");
}

+ (id)cacheDatabaseSchema
{
  return CFSTR("create table if not exists OperationInfo (\n    operationID                   text primary key,\n    applicationID                 text,\n    personaID                     text,\n    containerID                   text,\n    accountID                     text,\n    operationInfo                 blob,\n    operationIsComplete           integer default 0,\n    expirationDate                real,\n    lastAttemptDate               real,\n    retryNumber                   integer default 0\n);\ncreate index if not exists AppIDPersonaIDContainerIDAccountID on OperationInfo (applicationID, personaID, containerID, accountID);\n\ncreate trigger if not exists DeleteOperationCallback\nbefore delete on OperationInfo\nfor each row begin\n  delete from Callback where operationID = OLD.operationID;\nend;\n\ncreate table if not exists Callback (\n    operationID           text,\n    callback              blob\n);\ncreate index if not exists OperationUUID on Callback (operationID);\n");
}

- (CKDOperationInfoCache)initWithCacheDir:(id)a3
{
  CKDOperationInfoCache *v3;
  const char *v4;
  CKDOperationInfoCache *v5;
  NSObject *v6;
  dispatch_queue_t v7;
  OS_dispatch_queue *cacheQueue;
  NSObject *v9;
  dispatch_queue_t v10;
  OS_dispatch_queue *cacheDelegateQueue;
  const char *v12;
  uint64_t v13;
  NSMutableDictionary *delegateWrappersByOperationID;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)CKDOperationInfoCache;
  v3 = -[CKDSQLiteCache initWithCacheDir:](&v16, sel_initWithCacheDir_, a3);
  v5 = v3;
  if (v3)
  {
    objc_msgSend_setUserVersion_(v3, v4, 1556947966);
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = dispatch_queue_create("com.apple.cloudkit.operationInfoCache", v6);
    cacheQueue = v5->_cacheQueue;
    v5->_cacheQueue = (OS_dispatch_queue *)v7;

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = dispatch_queue_create("com.apple.cloudkit.operationInfoCacheDelegate", v9);
    cacheDelegateQueue = v5->_cacheDelegateQueue;
    v5->_cacheDelegateQueue = (OS_dispatch_queue *)v10;

    objc_msgSend_setObjectClassPrefix_(v5, v12, (uint64_t)CFSTR("CKD"));
    v13 = objc_opt_new();
    delegateWrappersByOperationID = v5->_delegateWrappersByOperationID;
    v5->_delegateWrappersByOperationID = (NSMutableDictionary *)v13;

  }
  return v5;
}

- (void)registerDelegate:(id)a3 forOperationWithID:(id)a4
{
  id v7;
  id v8;
  const char *v9;
  uint64_t v10;
  NSObject *v11;
  id v12;
  id v13;
  _QWORD block[5];
  id v15;
  id v16;
  SEL v17;

  v7 = a3;
  v8 = a4;
  objc_msgSend_cacheQueue(self, v9, v10);
  v11 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_1BEBBC0B8;
  block[3] = &unk_1E7836470;
  block[4] = self;
  v15 = v8;
  v16 = v7;
  v17 = a2;
  v12 = v7;
  v13 = v8;
  dispatch_sync(v11, block);

}

- (void)unregisterDelegate:(id)a3 forOperationWithID:(id)a4
{
  id v6;
  id v7;
  const char *v8;
  uint64_t v9;
  NSObject *v10;
  id v11;
  id v12;
  _QWORD block[5];
  id v14;
  id v15;

  v6 = a3;
  v7 = a4;
  objc_msgSend_cacheDelegateQueue(self, v8, v9);
  v10 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_1BEBBC5A8;
  block[3] = &unk_1E782E418;
  block[4] = self;
  v14 = v7;
  v15 = v6;
  v11 = v6;
  v12 = v7;
  dispatch_async(v10, block);

}

- (id)operationInfoMetadataForOperationWithID:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  NSObject *v7;
  id v8;
  id v9;
  _QWORD block[5];
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
  v17 = sub_1BE9BB118;
  v18 = sub_1BE9BAE40;
  v19 = 0;
  objc_msgSend_cacheQueue(self, v5, v6);
  v7 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_1BEBBC744;
  block[3] = &unk_1E7831250;
  block[4] = self;
  v12 = v4;
  v13 = &v14;
  v8 = v4;
  dispatch_sync(v7, block);

  v9 = (id)v15[5];
  _Block_object_dispose(&v14, 8);

  return v9;
}

- (void)_locked_enumerateCallbacksForOperationWithID:(id)a3 usingBlock:(id)a4
{
  id v6;
  id v7;
  const char *v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  const char *v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;
  id v18;

  v6 = a3;
  v7 = a4;
  objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v8, (uint64_t)CFSTR("%@ = ?"), CFSTR("operationID"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = sub_1BEBBCAC0;
  v15[3] = &unk_1E78364C0;
  v16 = v9;
  v17 = v6;
  v18 = v7;
  v10 = v7;
  v11 = v6;
  v12 = v9;
  v14 = (id)objc_msgSend_performDatabaseOperation_(self, v13, (uint64_t)v15);

}

- (void)enumerateCallbacksForOperationWithID:(id)a3 usingBlock:(id)a4
{
  id v6;
  id v7;
  const char *v8;
  uint64_t v9;
  NSObject *v10;
  id v11;
  id v12;
  _QWORD block[5];
  id v14;
  id v15;

  v6 = a3;
  v7 = a4;
  objc_msgSend_cacheQueue(self, v8, v9);
  v10 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_1BEBBCD24;
  block[3] = &unk_1E782F678;
  block[4] = self;
  v14 = v6;
  v15 = v7;
  v11 = v7;
  v12 = v6;
  dispatch_sync(v10, block);

}

- (id)resumableOperationInfosByAppContainerAccountTuplesWithProgressPurged:(BOOL)a3
{
  void *v5;
  const char *v6;
  uint64_t v7;
  NSObject *v8;
  id v9;
  void *v10;
  id v11;
  _QWORD block[5];
  id v14;
  BOOL v15;

  v5 = (void *)objc_opt_new();
  objc_msgSend_cacheQueue(self, v6, v7);
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_1BEBBCDF0;
  block[3] = &unk_1E7830628;
  block[4] = self;
  v9 = v5;
  v14 = v9;
  v15 = a3;
  dispatch_sync(v8, block);

  v10 = v14;
  v11 = v9;

  return v11;
}

- (id)outstandingOperationInfosForIDs:(id)a3
{
  id v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  NSObject *v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  _QWORD block[4];
  id v15;
  CKDOperationInfoCache *v16;
  id v17;

  v4 = a3;
  v5 = (void *)objc_opt_new();
  objc_msgSend_cacheQueue(self, v6, v7);
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_1BEBBD76C;
  block[3] = &unk_1E782E418;
  v15 = v4;
  v16 = self;
  v9 = v5;
  v17 = v9;
  v10 = v4;
  dispatch_sync(v8, block);

  v11 = v17;
  v12 = v9;

  return v12;
}

- (id)allOutstandingOperationIDsForAppContainerAccountTuple:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  NSObject *v7;
  id v8;
  id v9;
  _QWORD block[4];
  id v12;
  CKDOperationInfoCache *v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;

  v4 = a3;
  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = sub_1BE9BB118;
  v19 = sub_1BE9BAE40;
  v20 = 0;
  objc_msgSend_cacheQueue(self, v5, v6);
  v7 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_1BEBBDBB4;
  block[3] = &unk_1E7831250;
  v12 = v4;
  v13 = self;
  v14 = &v15;
  v8 = v4;
  dispatch_sync(v7, block);

  v9 = (id)v16[5];
  _Block_object_dispose(&v15, 8);

  return v9;
}

- (void)expungeOperationInfoForDeletedAccountID:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  NSObject *v7;
  id v8;
  _QWORD v9[5];
  id v10;

  v4 = a3;
  objc_msgSend_cacheQueue(self, v5, v6);
  v7 = objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = sub_1BEBBDF7C;
  v9[3] = &unk_1E782EE20;
  v9[4] = self;
  v10 = v4;
  v8 = v4;
  dispatch_async(v7, v9);

}

- (void)deleteAllInfoForOperationWithID:(id)a3
{
  objc_msgSend_setOperationInfo_forOperationID_appContainerAccountTuple_(self, a2, 0, a3, 0);
}

- (void)_lockedSetOperationInfo:(id)a3 forOperationID:(id)a4 appContainerAccountTuple:(id)a5
{
  id v8;
  id v9;
  id v10;
  const char *v11;
  uint64_t v12;
  NSObject *v13;
  id v14;
  id v15;
  id v16;
  const char *v17;
  id v18;
  _QWORD v19[4];
  id v20;
  id v21;
  id v22;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend_cacheQueue(self, v11, v12);
  v13 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v13);

  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = sub_1BEBBE2E0;
  v19[3] = &unk_1E7836550;
  v20 = v8;
  v21 = v9;
  v22 = v10;
  v14 = v10;
  v15 = v9;
  v16 = v8;
  v18 = (id)objc_msgSend_performDatabaseOperation_(self, v17, (uint64_t)v19);

}

- (void)setOperationInfo:(id)a3 forOperationID:(id)a4 appContainerAccountTuple:(id)a5
{
  id v8;
  id v9;
  id v10;
  const char *v11;
  uint64_t v12;
  NSObject *v13;
  id v14;
  id v15;
  id v16;
  _QWORD block[5];
  id v18;
  id v19;
  id v20;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend_cacheQueue(self, v11, v12);
  v13 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_1BEBBE5E8;
  block[3] = &unk_1E782F4A8;
  block[4] = self;
  v18 = v8;
  v19 = v9;
  v20 = v10;
  v14 = v10;
  v15 = v9;
  v16 = v8;
  dispatch_sync(v13, block);

}

- (void)_lockedArchiveCallback:(id)a3 forOperationID:(id)a4
{
  id v6;
  id v7;
  const char *v8;
  uint64_t v9;
  NSObject *v10;
  const char *v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  NSObject *v15;
  uint64_t v16;
  id v17;
  id v18;
  const char *v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  void *v23;
  id v24;
  id v25;
  const char *v26;
  id v27;
  NSObject *v28;
  _QWORD v29[4];
  id v30;
  id v31;
  id v32;
  id v33;
  id v34;
  _QWORD block[5];
  id v36;
  id v37;
  uint8_t buf[4];
  id v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend_cacheQueue(self, v8, v9);
  v10 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v10);

  objc_msgSend__locked_operationInfoForID_(self, v11, (uint64_t)v7);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14)
  {
    objc_msgSend_cacheDelegateQueue(self, v12, v13);
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = MEMORY[0x1E0C809B0];
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = sub_1BEBBE884;
    block[3] = &unk_1E782E418;
    block[4] = self;
    v17 = v7;
    v36 = v17;
    v18 = v6;
    v37 = v18;
    dispatch_sync(v15, block);

    objc_msgSend_archivedDataWithRootObject_requiringSecureCoding_error_(MEMORY[0x1E0CB36F8], v19, (uint64_t)v18, 1, 0);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_dateWithTimeIntervalSinceNow_(MEMORY[0x1E0C99D68], v21, v22, 86400.0);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v29[0] = v16;
    v29[1] = 3221225472;
    v29[2] = sub_1BEBBE94C;
    v29[3] = &unk_1E78365A0;
    v30 = v17;
    v31 = v20;
    v32 = v14;
    v33 = v18;
    v34 = v23;
    v24 = v23;
    v25 = v20;
    v27 = (id)objc_msgSend_performDatabaseOperation_(self, v26, (uint64_t)v29);

  }
  else
  {
    if (*MEMORY[0x1E0C95300] != -1)
      dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
    v28 = *MEMORY[0x1E0C952B0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v39 = v7;
      _os_log_error_impl(&dword_1BE990000, v28, OS_LOG_TYPE_ERROR, "Couldn't find an operation with ID %{public}@ to set the result", buf, 0xCu);
    }
  }

}

- (void)archiveCallback:(id)a3 forOperationID:(id)a4
{
  id v6;
  id v7;
  const char *v8;
  uint64_t v9;
  NSObject *v10;
  id v11;
  id v12;
  _QWORD block[5];
  id v14;
  id v15;

  v6 = a3;
  v7 = a4;
  objc_msgSend_cacheQueue(self, v8, v9);
  v10 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_1BEBBEC2C;
  block[3] = &unk_1E782E418;
  block[4] = self;
  v14 = v6;
  v15 = v7;
  v11 = v7;
  v12 = v6;
  dispatch_sync(v10, block);

}

- (void)registerAttemptForOperationWithID:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  NSObject *v7;
  id v8;
  _QWORD block[5];
  id v10;

  v4 = a3;
  objc_msgSend_cacheQueue(self, v5, v6);
  v7 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_1BEBBECD4;
  block[3] = &unk_1E782EE20;
  block[4] = self;
  v10 = v4;
  v8 = v4;
  dispatch_sync(v7, block);

}

- (id)_locked_operationInfoForID:(id)a3
{
  void *v4;
  id v5;
  const char *v6;
  void *v7;
  const char *v8;
  void *v9;
  const char *v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  v4 = (void *)MEMORY[0x1E0CB3940];
  v5 = a3;
  objc_msgSend_stringWithFormat_(v4, v6, (uint64_t)CFSTR("%@ = ?"), CFSTR("operationID"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v5;
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v8, (uint64_t)v16, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_selectAllFrom_where_bindings_(self, v10, (uint64_t)CFSTR("OperationInfo"), v7, v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_firstObject(v11, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (void)registerCacheEvictionActivity
{
  uint64_t v2;
  void *v5;
  const char *v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  os_activity_t v13;

  objc_msgSend_deviceContext(self, a2, v2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_testDeviceReference(v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v9, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v11, v12, (uint64_t)a2, self, CFSTR("CKDOperationInfoCache.m"), 489, CFSTR("Only the default device context may register for operation info cache eviction"));

  }
  v13 = _os_activity_create(&dword_1BE990000, "operationInfoCacheEviction", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  CKRegisterRepeatingXPCActivity("com.apple.cloudkit.operationInfoCacheEviction", v13, *MEMORY[0x1E0C807B8], *MEMORY[0x1E0C807D8], 0, &unk_1E7836610);

}

- (OS_dispatch_queue)cacheQueue
{
  return self->_cacheQueue;
}

- (void)setCacheQueue:(id)a3
{
  objc_storeStrong((id *)&self->_cacheQueue, a3);
}

- (OS_dispatch_queue)cacheDelegateQueue
{
  return self->_cacheDelegateQueue;
}

- (void)setCacheDelegateQueue:(id)a3
{
  objc_storeStrong((id *)&self->_cacheDelegateQueue, a3);
}

- (NSMutableDictionary)delegateWrappersByOperationID
{
  return self->_delegateWrappersByOperationID;
}

- (void)setDelegateWrappersByOperationID:(id)a3
{
  objc_storeStrong((id *)&self->_delegateWrappersByOperationID, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_delegateWrappersByOperationID, 0);
  objc_storeStrong((id *)&self->_cacheDelegateQueue, 0);
  objc_storeStrong((id *)&self->_cacheQueue, 0);
}

@end
