@implementation SGSuggestHistory

+ (id)sharedSuggestHistory
{
  if (sharedSuggestHistory_onceToken != -1)
    dispatch_once(&sharedSuggestHistory_onceToken, &__block_literal_global_7240);
  return (id)sharedSuggestHistory_instance;
}

- (id)kvsIfSyncSupported
{
  SGNoCloudNSUbiquitousKeyValueStore *backingKVStore;

  backingKVStore = (SGNoCloudNSUbiquitousKeyValueStore *)self->_backingKVStore;
  if (backingKVStore == self->_noCloudFakeBackingKVStore)
    return 0;
  else
    return backingKVStore;
}

- (void)setMigrateFromStore:(id)a3
{
  id v4;
  _PASLock *lock;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  lock = self->_lock;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __40__SGSuggestHistory_setMigrateFromStore___block_invoke;
  v7[3] = &unk_1E7DAA2C0;
  v8 = v4;
  v6 = v4;
  -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v7);
  -[SGSuggestHistory migrateIfNeeded](self, "migrateIfNeeded");

}

- (void)migrateIfNeeded
{
  NSObject *v3;
  uint64_t v4;
  _PASLock *lock;
  id v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  void *v16;
  dispatch_block_t v17;
  id v18;
  NSObject *v19;
  dispatch_time_t v20;
  NSObject *v21;
  _QWORD v22[4];
  id v23;
  id v24;
  id v25;
  __int128 *p_buf;
  id v27;
  _QWORD block[5];
  id location;
  _QWORD v30[5];
  __int128 buf;
  uint64_t v32;
  uint64_t (*v33)(uint64_t, uint64_t);
  void (*v34)(uint64_t);
  id v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  sgLogHandle();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf) = 0;
    _os_log_impl(&dword_1C3607000, v3, OS_LOG_TYPE_DEFAULT, "SGSuggestHistory: Entering migrateIfNeeded", (uint8_t *)&buf, 2u);
  }

  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v32 = 0x3032000000;
  v33 = __Block_byref_object_copy__7053;
  v34 = __Block_byref_object_dispose__7054;
  v35 = 0;
  v4 = MEMORY[0x1E0C809B0];
  lock = self->_lock;
  v30[0] = MEMORY[0x1E0C809B0];
  v30[1] = 3221225472;
  v30[2] = __35__SGSuggestHistory_migrateIfNeeded__block_invoke;
  v30[3] = &unk_1E7DAA2E8;
  v30[4] = &buf;
  -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v30);
  v6 = *(id *)(*((_QWORD *)&buf + 1) + 40);
  _Block_object_dispose(&buf, 8);

  if (!v6)
  {
    sgLogHandle();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf) = 0;
      _os_log_impl(&dword_1C3607000, v21, OS_LOG_TYPE_DEFAULT, "SGSuggestHistory: Exiting migrateIfNeeded (fromKVS is nil)", (uint8_t *)&buf, 2u);
    }
    goto LABEL_13;
  }
  if (!-[SGSuggestHistory needsMigration](self, "needsMigration"))
  {
    sgLogHandle();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf) = 0;
      _os_log_impl(&dword_1C3607000, v21, OS_LOG_TYPE_DEFAULT, "SGSuggestHistory: Exiting migrateIfNeeded (migration not needed)", (uint8_t *)&buf, 2u);
    }
LABEL_13:

    goto LABEL_14;
  }
  location = 0;
  objc_initWeak(&location, self);
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("SGSuggestHistory migration: %@"), self->_kvStoreIdentifier);
  sgLogHandle();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138543362;
    *(_QWORD *)((char *)&buf + 4) = v7;
    _os_log_impl(&dword_1C3607000, v8, OS_LOG_TYPE_DEFAULT, "SGSuggestHistory: migrateIfNeeded session %{public}@", (uint8_t *)&buf, 0xCu);
  }

  v9 = (void *)MEMORY[0x1C3BD4F6C]();
  v10 = (void *)MEMORY[0x1E0D81598];
  v11 = objc_retainAutorelease(v7);
  objc_msgSend(v10, "autoreleasingSerialQueueWithLabel:qosClass:", objc_msgSend(v11, "UTF8String"), 17);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_autoreleasePoolPop(v9);
  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v32 = 0x3032000000;
  v33 = __Block_byref_object_copy__7053;
  v34 = __Block_byref_object_dispose__7054;
  v35 = 0;
  v13 = (void *)MEMORY[0x1C3BD4F6C]();
  v14 = objc_retainAutorelease(v11);
  objc_msgSend(v14, "UTF8String");
  v15 = os_transaction_create();
  objc_autoreleasePoolPop(v13);
  v16 = *(void **)(*((_QWORD *)&buf + 1) + 40);
  *(_QWORD *)(*((_QWORD *)&buf + 1) + 40) = v15;

  block[0] = v4;
  block[1] = 3221225472;
  block[2] = __35__SGSuggestHistory_migrateIfNeeded__block_invoke_57;
  block[3] = &unk_1E7DB7220;
  block[4] = &buf;
  v17 = dispatch_block_create((dispatch_block_flags_t)0, block);
  v22[0] = v4;
  v22[1] = 3221225472;
  v22[2] = __35__SGSuggestHistory_migrateIfNeeded__block_invoke_58;
  v22[3] = &unk_1E7DAA360;
  objc_copyWeak(&v27, &location);
  v23 = v6;
  v24 = v12;
  v25 = v17;
  p_buf = &buf;
  v18 = v17;
  v19 = v12;
  dispatch_async(v19, v22);
  v20 = dispatch_time(0, 300000000000);
  dispatch_after(v20, v19, v18);

  objc_destroyWeak(&v27);
  _Block_object_dispose(&buf, 8);

  objc_destroyWeak(&location);
LABEL_14:

}

- (BOOL)needsMigration
{
  void *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  _BOOL4 v7;
  BOOL v8;
  const char *v9;
  NSObject *v10;
  uint32_t v11;
  int v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D198F0], "didKVSMigrationTokenForIdentifier:", self->_kvStoreIdentifier);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    sgLogHandle();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v13) = 0;
      v9 = "SGSuggestHistory: needsMigration returning YES because migrationToken is nil";
      v10 = v6;
      v11 = 2;
LABEL_10:
      _os_log_impl(&dword_1C3607000, v10, OS_LOG_TYPE_DEFAULT, v9, (uint8_t *)&v13, v11);
    }
LABEL_11:
    v8 = 1;
    goto LABEL_12;
  }
  -[SGSuggestHistory kvsIfSyncSupported](self, "kvsIfSyncSupported");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  sgLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (!v5)
  {
    if (v7)
    {
      v13 = 138543362;
      v14 = v3;
      v9 = "SGSuggestHistory: needsMigration returning YES because migrationToken %{public}@ is not set in the KVS";
      v10 = v6;
      v11 = 12;
      goto LABEL_10;
    }
    goto LABEL_11;
  }
  if (v7)
  {
    v13 = 138543362;
    v14 = v3;
    _os_log_impl(&dword_1C3607000, v6, OS_LOG_TYPE_DEFAULT, "SGSuggestHistory: needsMigration returning NO because migrationToken %{public}@ is already set in the KVS", (uint8_t *)&v13, 0xCu);
  }
  v8 = 0;
LABEL_12:

  return v8;
}

- (void)recordSuccessfulMigration
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  uint8_t buf[4];
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = objc_alloc(MEMORY[0x1E0CB3940]);
  SGRandomDataOfLength(9uLL);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "base64EncodedStringWithOptions:", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v4, "initWithFormat:", CFSTR("SGSuggestHistory-Migration-%@"), v6);

  if ((unint64_t)objc_msgSend(v7, "lengthOfBytesUsingEncoding:", 4) >= 0x41)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SGSuggestHistory.m"), 263, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[migrationToken lengthOfBytesUsingEncoding:NSUTF8StringEncoding] <= 64"));

  }
  objc_msgSend(MEMORY[0x1E0D198F0], "setDidKVSMigrationToken:forIdentifier:", v7, self->_kvStoreIdentifier);
  -[SGSuggestHistory kvs](self, "kvs");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKey:", &unk_1E7E0BEA0, v7);

  sgLogHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v12 = v7;
    _os_log_impl(&dword_1C3607000, v9, OS_LOG_TYPE_DEFAULT, "SGSuggestHistory: recording successful migration using token %{public}@", buf, 0xCu);
  }

}

- (void)migrateFromKVS:(id)a3 withCompletion:(id)a4
{
  id v7;
  void (**v8)(id, _QWORD);
  _PASLock *lock;
  uint64_t v10;
  NSObject *v11;
  void *v12;
  _PASLock *v13;
  id v14;
  void (**v15)(_QWORD, _QWORD);
  void *v16;
  double v17;
  _BOOL4 v18;
  NSObject *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  id v26;
  NSObject *v27;
  id v28;
  _PASLock *v29;
  _QWORD v30[4];
  id v31;
  id v32;
  id v33;
  id v34;
  void (**v35)(_QWORD, _QWORD);
  id v36;
  _QWORD v37[4];
  id v38;
  _QWORD v39[4];
  id v40;
  id v41;
  _PASLock *v42;
  SGSuggestHistory *v43;
  void (**v44)(id, _QWORD);
  SEL v45;
  _QWORD v46[6];
  uint64_t v47;
  uint64_t *v48;
  uint64_t v49;
  uint64_t (*v50)(uint64_t, uint64_t);
  void (*v51)(uint64_t);
  id v52;
  uint64_t v53;
  uint64_t *v54;
  uint64_t v55;
  char v56;
  _BYTE buf[12];
  __int16 v58;
  uint64_t v59;
  _QWORD v60[13];

  v60[10] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = (void (**)(id, _QWORD))a4;
  v53 = 0;
  v54 = &v53;
  v55 = 0x2020000000;
  v56 = 0;
  v47 = 0;
  v48 = &v47;
  v49 = 0x3032000000;
  v50 = __Block_byref_object_copy__7053;
  v51 = __Block_byref_object_dispose__7054;
  v52 = 0;
  lock = self->_lock;
  v10 = MEMORY[0x1E0C809B0];
  v46[0] = MEMORY[0x1E0C809B0];
  v46[1] = 3221225472;
  v46[2] = __50__SGSuggestHistory_migrateFromKVS_withCompletion___block_invoke;
  v46[3] = &unk_1E7DAA388;
  v46[4] = &v53;
  v46[5] = &v47;
  -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v46);
  if (*((_BYTE *)v54 + 24))
  {
    sgLogHandle();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1C3607000, v11, OS_LOG_TYPE_DEFAULT, "SGSuggestHistory: migrateFromKVS aborting to avoid re-entrancy", buf, 2u);
    }

    v8[2](v8, 0);
  }
  else
  {
    v60[0] = CFSTR("events");
    v60[1] = CFSTR("eventsWithoutTimestamp");
    v60[2] = CFSTR("rejectedEvents");
    v60[3] = CFSTR("reminders");
    v60[4] = CFSTR("rejectedReminders");
    v60[5] = CFSTR("newContacts");
    v60[6] = CFSTR("storageDetails");
    v60[7] = CFSTR("dontUpdate");
    v60[8] = CFSTR("confirmedEventFields");
    v60[9] = CFSTR("confirmedEventWithoutTimestampFields");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v60, 10);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = self->_lock;
    v39[0] = v10;
    v39[1] = 3221225472;
    v39[2] = __50__SGSuggestHistory_migrateFromKVS_withCompletion___block_invoke_77;
    v39[3] = &unk_1E7DAA3D8;
    v28 = v12;
    v40 = v28;
    v14 = v7;
    v41 = v14;
    v45 = a2;
    v29 = v13;
    v42 = v29;
    v43 = self;
    v44 = v8;
    v15 = (void (**)(_QWORD, _QWORD))objc_msgSend(v39, "copy");
    if (v48[5]
      && (objc_msgSend(MEMORY[0x1E0C99D68], "date"),
          v16 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v16, "timeIntervalSinceDate:", v48[5]),
          v18 = v17 < 600.0,
          v16,
          v18))
    {
      sgLogHandle();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(MEMORY[0x1E0C99D68], "date");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "timeIntervalSinceDate:", v48[5]);
        *(_DWORD *)buf = 134218240;
        *(_QWORD *)&buf[4] = v21;
        v58 = 2048;
        v59 = 0x4082C00000000000;
        _os_log_impl(&dword_1C3607000, v19, OS_LOG_TYPE_DEFAULT, "SGSuggestHistory: migrateFromKVS aborting, %f sec elapsed since last migration but cooldown period is %f", buf, 0x16u);

      }
      v15[2](v15, 0);
    }
    else
    {
      -[_PASLock runWithLockAcquired:](v29, "runWithLockAcquired:", &__block_literal_global_87_7182);
      -[SGSuggestHistory kvsIfSyncSupported](self, "kvsIfSyncSupported");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      if (v22)
      {
        v37[0] = v10;
        v37[1] = 3221225472;
        v37[2] = __50__SGSuggestHistory_migrateFromKVS_withCompletion___block_invoke_89;
        v37[3] = &unk_1E7DB71B8;
        v23 = (id)objc_opt_new();
        v38 = v23;
        objc_msgSend(v14, "synchronizeWithCompletionHandler:", v37);
        +[SGDCloudKitSync sharedInstance](SGDCloudKitSync, "sharedInstance");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "privacySalt");
        v25 = (void *)objc_claimAutoreleasedReturnValue();

        *(_QWORD *)buf = 0;
        objc_initWeak((id *)buf, self);
        v30[0] = v10;
        v30[1] = 3221225472;
        v30[2] = __50__SGSuggestHistory_migrateFromKVS_withCompletion___block_invoke_92;
        v30[3] = &unk_1E7DAA490;
        v31 = v22;
        objc_copyWeak(&v36, (id *)buf);
        v35 = v15;
        v26 = v23;
        v32 = v26;
        v33 = v14;
        v34 = v28;
        objc_msgSend(v25, "wait:", v30);

        objc_destroyWeak(&v36);
        objc_destroyWeak((id *)buf);

      }
      else
      {
        sgLogHandle();
        v27 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_FAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_fault_impl(&dword_1C3607000, v27, OS_LOG_TYPE_FAULT, "SGSuggestHistory: migrateFromKVS aborting due to nil destination kvs", buf, 2u);
        }

        if (_PASEvaluateLogFaultAndProbCrashCriteria())
          abort();
        v15[2](v15, 0);
      }

    }
  }
  _Block_object_dispose(&v47, 8);

  _Block_object_dispose(&v53, 8);
}

- (NSUbiquitousKeyValueStore)kvs
{
  uint64_t v3;
  NSObject *v4;
  uint8_t v6[16];

  if ((objc_msgSend(MEMORY[0x1E0D198F0], "syncHistoryToCloud") & 1) != 0)
  {
    v3 = 16;
  }
  else
  {
    sgLogHandle();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)v6 = 0;
      _os_log_debug_impl(&dword_1C3607000, v4, OS_LOG_TYPE_DEBUG, "Suppressing cloud sync. This should happen in testing only.", v6, 2u);
    }

    v3 = 24;
  }
  return (NSUbiquitousKeyValueStore *)*(id *)((char *)&self->super.isa + v3);
}

- (SGSuggestHistory)initWithKVS:(id)a3 kvStoreIdentifier:(id)a4
{
  id v7;
  id v8;
  SGSuggestHistory *v9;
  uint64_t v10;
  NSString *kvStoreIdentifier;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  SGNoCloudNSUbiquitousKeyValueStore *noCloudFakeBackingKVStore;
  NSObject *v17;
  void *v18;
  NSObject *v19;
  uint64_t v20;
  _PASLock *lock;
  uint8_t v23[16];
  objc_super v24;

  v7 = a3;
  v8 = a4;
  v24.receiver = self;
  v24.super_class = (Class)SGSuggestHistory;
  v9 = -[SGSuggestHistory init](&v24, sel_init);
  if (v9)
  {
    v10 = objc_msgSend(v8, "copy");
    kvStoreIdentifier = v9->_kvStoreIdentifier;
    v9->_kvStoreIdentifier = (NSString *)v10;

    v12 = objc_opt_new();
    v13 = objc_opt_new();
    v14 = *(void **)(v12 + 96);
    *(_QWORD *)(v12 + 96) = v13;

    v15 = objc_opt_new();
    noCloudFakeBackingKVStore = v9->_noCloudFakeBackingKVStore;
    v9->_noCloudFakeBackingKVStore = (SGNoCloudNSUbiquitousKeyValueStore *)v15;

    objc_storeStrong((id *)&v9->_backingKVStore, a3);
    if (!v9->_backingKVStore)
    {
      sgLogHandle();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v23 = 0;
        _os_log_error_impl(&dword_1C3607000, v17, OS_LOG_TYPE_ERROR, "SGSuggestHistory is a no-op with kvs == nil!", v23, 2u);
      }

      objc_storeStrong((id *)&v9->_backingKVStore, v9->_noCloudFakeBackingKVStore);
    }
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "addObserver:selector:name:object:", v9, sel_handleSyncedDataChanged_, *MEMORY[0x1E0CB3368], v9->_backingKVStore);

    if (!-[NSUbiquitousKeyValueStore synchronize](v9->_backingKVStore, "synchronize"))
    {
      sgLogHandle();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v23 = 0;
        _os_log_impl(&dword_1C3607000, v19, OS_LOG_TYPE_DEFAULT, "Something went wrong with trying to synchronize icloud store", v23, 2u);
      }

    }
    -[SGSuggestHistory _setInternalStateAccordingToKVS:](v9, "_setInternalStateAccordingToKVS:", v12);
    *(_BYTE *)(v12 + 128) = 0;
    v20 = objc_msgSend(objc_alloc(MEMORY[0x1E0D815F0]), "initWithGuardedData:", v12);
    lock = v9->_lock;
    v9->_lock = (_PASLock *)v20;

  }
  return v9;
}

- (SGSuggestHistory)init
{
  id v3;
  uint64_t v4;
  void *v5;
  SGSuggestHistory *v6;
  void *v7;

  v3 = objc_alloc(MEMORY[0x1E0CB3A38]);
  v4 = *MEMORY[0x1E0D19D88];
  v5 = (void *)objc_msgSend(v3, "initWithStoreIdentifier:type:", *MEMORY[0x1E0D19D88], 1);
  v6 = -[SGSuggestHistory initWithKVS:kvStoreIdentifier:](self, "initWithKVS:kvStoreIdentifier:", v5, v4);
  if (v6)
  {
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A38]), "initWithStoreIdentifier:type:", v4, 0);
    -[SGSuggestHistory setMigrateFromStore:](v6, "setMigrateFromStore:", v7);

  }
  return v6;
}

- (id)salt
{
  _PASLock *lock;
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
  v9 = __Block_byref_object_copy__7053;
  v10 = __Block_byref_object_dispose__7054;
  v11 = 0;
  lock = self->_lock;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __24__SGSuggestHistory_salt__block_invoke;
  v5[3] = &unk_1E7DAA4B8;
  v5[4] = self;
  v5[5] = &v6;
  -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (id)legacyManateeSecret
{
  _PASLock *lock;
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
  v9 = __Block_byref_object_copy__7053;
  v10 = __Block_byref_object_dispose__7054;
  v11 = 0;
  lock = self->_lock;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __39__SGSuggestHistory_legacyManateeSecret__block_invoke;
  v5[3] = &unk_1E7DAA4B8;
  v5[4] = self;
  v5[5] = &v6;
  -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (id)mutableSetForKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;

  v4 = a3;
  -[SGSuggestHistory kvs](self, "kvs");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dataForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v7 = (void *)MEMORY[0x1E0CB3710];
    if (mutableSetForKey___pasOnceToken49 != -1)
      dispatch_once(&mutableSetForKey___pasOnceToken49, &__block_literal_global_110);
    objc_msgSend(v7, "unarchivedObjectOfClasses:fromData:error:", mutableSetForKey___pasExprOnceResult, v6, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v9 = v8;
      else
        v9 = (id)objc_msgSend(v8, "mutableCopy");
    }
    else
    {
      v9 = (id)objc_opt_new();
    }
    v10 = v9;

  }
  else
  {
    v10 = (void *)objc_opt_new();
  }

  return v10;
}

- (id)loadResetInfo
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  char isKindOfClass;
  NSObject *v7;
  uint8_t v9[16];

  -[SGSuggestHistory kvs](self, "kvs");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "arrayForKey:", CFSTR("resetInfo"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3 && objc_msgSend(v3, "count") == 2)
  {
    objc_msgSend(v3, "objectAtIndexedSubscript:", 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v3, "objectAtIndexedSubscript:", 1);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      isKindOfClass = objc_opt_isKindOfClass();

      if ((isKindOfClass & 1) != 0)
        return v3;
    }
    else
    {

    }
  }
  sgLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v9 = 0;
    _os_log_debug_impl(&dword_1C3607000, v7, OS_LOG_TYPE_DEBUG, "Empty or corrupt resetInfo", v9, 2u);
  }

  v3 = &unk_1E7E106C8;
  return v3;
}

- (id)description
{
  _PASLock *lock;
  id v3;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__7053;
  v10 = __Block_byref_object_dispose__7054;
  v11 = 0;
  lock = self->_lock;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __31__SGSuggestHistory_description__block_invoke;
  v5[3] = &unk_1E7DAA2E8;
  v5[4] = &v6;
  -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (void)_tellObserversHashesDidChange
{
  -[_PASLock runWithLockAcquired:](self->_lock, "runWithLockAcquired:", &__block_literal_global_115);
}

- (void)_setHashes:(id)a3 forKey:(id)a4
{
  id v7;
  void *v8;
  int v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  id v14;

  v14 = a3;
  v7 = a4;
  -[SGSuggestHistory _canaryHash](self, "_canaryHash");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v14, "containsObject:", v8);

  if (v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SGSuggestHistory.m"), 631, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("![hashes containsObject:[self _canaryHash]]"));

  }
  if (objc_msgSend(v14, "count"))
  {
    v10 = (void *)MEMORY[0x1C3BD4F6C]();
    objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", v14, 1, 0);
    v11 = (id)objc_claimAutoreleasedReturnValue();
    objc_autoreleasePoolPop(v10);
  }
  else
  {
    if (_setHashes_forKey___pasOnceToken51 != -1)
      dispatch_once(&_setHashes_forKey___pasOnceToken51, &__block_literal_global_118);
    v11 = (id)_setHashes_forKey___pasExprOnceResult;
  }
  -[SGSuggestHistory kvs](self, "kvs");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setObject:forKey:", v11, v7);

  -[SGSuggestHistory _tellObserversHashesDidChange](self, "_tellObserversHashesDidChange");
}

- (void)pushConfirmedEvents:(id)a3
{
  id *v4;
  NSObject *v5;
  int v6;
  _DWORD v7[2];
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v4 = (id *)a3;
  sgLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    v6 = objc_msgSend(v4[1], "count");
    v7[0] = 67109120;
    v7[1] = v6;
    _os_log_debug_impl(&dword_1C3607000, v5, OS_LOG_TYPE_DEBUG, "Pushing confirmed events set with %i items", (uint8_t *)v7, 8u);
  }

  -[SGSuggestHistory _setHashes:forKey:](self, "_setHashes:forKey:", v4[1], CFSTR("events"));
}

- (void)pushConfirmedEventsWithoutTimestamp:(id)a3
{
  id *v4;
  NSObject *v5;
  int v6;
  _DWORD v7[2];
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v4 = (id *)a3;
  sgLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    v6 = objc_msgSend(v4[2], "count");
    v7[0] = 67109120;
    v7[1] = v6;
    _os_log_debug_impl(&dword_1C3607000, v5, OS_LOG_TYPE_DEBUG, "Pushing confirmed events without timestamp set with %i items", (uint8_t *)v7, 8u);
  }

  -[SGSuggestHistory _setHashes:forKey:](self, "_setHashes:forKey:", v4[2], CFSTR("eventsWithoutTimestamp"));
}

- (void)pushRejectedEvents:(id)a3
{
  id *v4;
  NSObject *v5;
  int v6;
  _DWORD v7[2];
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v4 = (id *)a3;
  sgLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    v6 = objc_msgSend(v4[3], "count");
    v7[0] = 67109120;
    v7[1] = v6;
    _os_log_debug_impl(&dword_1C3607000, v5, OS_LOG_TYPE_DEBUG, "Pushing rejected events set with %i items", (uint8_t *)v7, 8u);
  }

  -[SGSuggestHistory _setHashes:forKey:](self, "_setHashes:forKey:", v4[3], CFSTR("rejectedEvents"));
}

- (void)pushConfirmedReminders:(id)a3
{
  id *v4;
  NSObject *v5;
  int v6;
  _DWORD v7[2];
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v4 = (id *)a3;
  sgRemindersLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    v6 = objc_msgSend(v4[4], "count");
    v7[0] = 67109120;
    v7[1] = v6;
    _os_log_debug_impl(&dword_1C3607000, v5, OS_LOG_TYPE_DEBUG, "Pushing confirmed reminders set with %i items", (uint8_t *)v7, 8u);
  }

  -[SGSuggestHistory _setHashes:forKey:](self, "_setHashes:forKey:", v4[4], CFSTR("reminders"));
}

- (void)pushRejectedReminders:(id)a3
{
  id *v4;
  NSObject *v5;
  int v6;
  _DWORD v7[2];
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v4 = (id *)a3;
  sgRemindersLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    v6 = objc_msgSend(v4[5], "count");
    v7[0] = 67109120;
    v7[1] = v6;
    _os_log_debug_impl(&dword_1C3607000, v5, OS_LOG_TYPE_DEBUG, "Pushing rejected reminders set with %i items", (uint8_t *)v7, 8u);
  }

  -[SGSuggestHistory _setHashes:forKey:](self, "_setHashes:forKey:", v4[5], CFSTR("rejectedReminders"));
}

- (void)pushConfirmedEventFields:(id)a3
{
  id *v4;
  NSObject *v5;
  int v6;
  _DWORD v7[2];
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v4 = (id *)a3;
  sgLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    v6 = objc_msgSend(v4[7], "count");
    v7[0] = 67109120;
    v7[1] = v6;
    _os_log_debug_impl(&dword_1C3607000, v5, OS_LOG_TYPE_DEBUG, "Pushing confirmed event fields set with %i items", (uint8_t *)v7, 8u);
  }

  -[SGSuggestHistory _setHashes:forKey:](self, "_setHashes:forKey:", v4[7], CFSTR("confirmedEventFields"));
}

- (void)pushConfirmedEventWithoutTimestampFields:(id)a3
{
  id *v4;
  NSObject *v5;
  int v6;
  _DWORD v7[2];
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v4 = (id *)a3;
  sgLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    v6 = objc_msgSend(v4[8], "count");
    v7[0] = 67109120;
    v7[1] = v6;
    _os_log_debug_impl(&dword_1C3607000, v5, OS_LOG_TYPE_DEBUG, "Pushing confirmed event without timestamp fields set with %i items", (uint8_t *)v7, 8u);
  }

  -[SGSuggestHistory _setHashes:forKey:](self, "_setHashes:forKey:", v4[8], CFSTR("confirmedEventWithoutTimestampFields"));
}

- (void)pushContacts:(id)a3
{
  id *v4;
  NSObject *v5;
  int v6;
  _DWORD v7[2];
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v4 = (id *)a3;
  sgLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    v6 = objc_msgSend(v4[6], "count");
    v7[0] = 67109120;
    v7[1] = v6;
    _os_log_debug_impl(&dword_1C3607000, v5, OS_LOG_TYPE_DEBUG, "Pushing contacts set with %i items", (uint8_t *)v7, 8u);
  }

  -[SGSuggestHistory _setHashes:forKey:](self, "_setHashes:forKey:", v4[6], CFSTR("newContacts"));
}

- (void)pushStorageDetails:(id)a3
{
  id *v4;
  NSObject *v5;
  int v6;
  _DWORD v7[2];
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v4 = (id *)a3;
  sgLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    v6 = objc_msgSend(v4[9], "count");
    v7[0] = 67109120;
    v7[1] = v6;
    _os_log_debug_impl(&dword_1C3607000, v5, OS_LOG_TYPE_DEBUG, "Pushing storage details set with %i items", (uint8_t *)v7, 8u);
  }

  -[SGSuggestHistory _setHashes:forKey:](self, "_setHashes:forKey:", v4[9], CFSTR("storageDetails"));
}

- (void)pushDontUpdate:(id)a3
{
  id *v4;
  NSObject *v5;
  int v6;
  _DWORD v7[2];
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v4 = (id *)a3;
  sgLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    v6 = objc_msgSend(v4[10], "count");
    v7[0] = 67109120;
    v7[1] = v6;
    _os_log_debug_impl(&dword_1C3607000, v5, OS_LOG_TYPE_DEBUG, "Pushing do-not-update set with %i items", (uint8_t *)v7, 8u);
  }

  -[SGSuggestHistory _setHashes:forKey:](self, "_setHashes:forKey:", v4[10], CFSTR("dontUpdate"));
}

- (void)pushResetInfo:(id)a3
{
  id *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  int v11;
  uint64_t v12;
  __int16 v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = (id *)a3;
  sgLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(v4[11], "objectAtIndexedSubscript:", 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "unsignedLongValue");
    objc_msgSend(v4[11], "objectAtIndexedSubscript:", 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "doubleValue");
    v11 = 134218240;
    v12 = v8;
    v13 = 2048;
    v14 = v10;
    _os_log_debug_impl(&dword_1C3607000, v5, OS_LOG_TYPE_DEBUG, "Pushing reset info (generation %lu, timestamp %.1f)", (uint8_t *)&v11, 0x16u);

  }
  -[SGSuggestHistory kvs](self, "kvs");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setArray:forKey:", v4[11], CFSTR("resetInfo"));

}

- (void)_setInternalStateAccordingToKVS:(id)a3
{
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  _QWORD *v29;

  v29 = a3;
  -[SGSuggestHistory mutableSetForKey:](self, "mutableSetForKey:", CFSTR("events"));
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v29[1];
  v29[1] = v5;

  -[SGSuggestHistory mutableSetForKey:](self, "mutableSetForKey:", CFSTR("eventsWithoutTimestamp"));
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v29[2];
  v29[2] = v7;

  -[SGSuggestHistory mutableSetForKey:](self, "mutableSetForKey:", CFSTR("rejectedEvents"));
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)v29[3];
  v29[3] = v9;

  -[SGSuggestHistory mutableSetForKey:](self, "mutableSetForKey:", CFSTR("confirmedEventFields"));
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = (void *)v29[7];
  v29[7] = v11;

  -[SGSuggestHistory mutableSetForKey:](self, "mutableSetForKey:", CFSTR("confirmedEventWithoutTimestampFields"));
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = (void *)v29[8];
  v29[8] = v13;

  -[SGSuggestHistory mutableSetForKey:](self, "mutableSetForKey:", CFSTR("reminders"));
  v15 = objc_claimAutoreleasedReturnValue();
  v16 = (void *)v29[4];
  v29[4] = v15;

  -[SGSuggestHistory mutableSetForKey:](self, "mutableSetForKey:", CFSTR("rejectedReminders"));
  v17 = objc_claimAutoreleasedReturnValue();
  v18 = (void *)v29[5];
  v29[5] = v17;

  -[SGSuggestHistory mutableSetForKey:](self, "mutableSetForKey:", CFSTR("newContacts"));
  v19 = objc_claimAutoreleasedReturnValue();
  v20 = (void *)v29[6];
  v29[6] = v19;

  -[SGSuggestHistory mutableSetForKey:](self, "mutableSetForKey:", CFSTR("storageDetails"));
  v21 = objc_claimAutoreleasedReturnValue();
  v22 = (void *)v29[9];
  v29[9] = v21;

  -[SGSuggestHistory mutableSetForKey:](self, "mutableSetForKey:", CFSTR("dontUpdate"));
  v23 = objc_claimAutoreleasedReturnValue();
  v24 = (void *)v29[10];
  v29[10] = v23;

  -[SGSuggestHistory loadResetInfo](self, "loadResetInfo");
  v25 = objc_claimAutoreleasedReturnValue();
  v26 = (void *)v29[11];
  v29[11] = v25;

  v27 = v29;
  if (!v29[1] || !v29[2] || !v29[3] || !v29[7] || !v29[8] || !v29[4] || !v29[5] || !v29[6] || !v29[9] || !v29[10])
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SGSuggestHistory.m"), 738, CFSTR("Suggest history sets must not be nil"));

    v27 = v29;
  }

}

- (void)setInternalStateAccordingToKVS
{
  _PASLock *lock;
  _QWORD v3[5];

  lock = self->_lock;
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __50__SGSuggestHistory_setInternalStateAccordingToKVS__block_invoke;
  v3[3] = &unk_1E7DAA2C0;
  v3[4] = self;
  -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v3);
}

- (void)pushAll:(id)a3
{
  id v4;

  v4 = a3;
  -[SGSuggestHistory pushConfirmedEvents:](self, "pushConfirmedEvents:", v4);
  -[SGSuggestHistory pushConfirmedEventsWithoutTimestamp:](self, "pushConfirmedEventsWithoutTimestamp:", v4);
  -[SGSuggestHistory pushRejectedEvents:](self, "pushRejectedEvents:", v4);
  -[SGSuggestHistory pushConfirmedEventFields:](self, "pushConfirmedEventFields:", v4);
  -[SGSuggestHistory pushConfirmedEventWithoutTimestampFields:](self, "pushConfirmedEventWithoutTimestampFields:", v4);
  -[SGSuggestHistory pushConfirmedReminders:](self, "pushConfirmedReminders:", v4);
  -[SGSuggestHistory pushRejectedReminders:](self, "pushRejectedReminders:", v4);
  -[SGSuggestHistory pushContacts:](self, "pushContacts:", v4);
  -[SGSuggestHistory pushStorageDetails:](self, "pushStorageDetails:", v4);
  -[SGSuggestHistory pushDontUpdate:](self, "pushDontUpdate:", v4);
  -[SGSuggestHistory pushResetInfo:](self, "pushResetInfo:", v4);

}

- (id)keysForContact:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = (void *)objc_opt_new();
  objc_msgSend(v3, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "fullName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(v3, "name");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "fullName");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    SGNormalizeName((uint64_t)v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v9);

  }
  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  objc_msgSend(v3, "emailAddresses", 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v19;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v19 != v13)
          objc_enumerationMutation(v10);
        objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * v14), "emailAddress");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        SGNormalizeEmailAddress();
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "addObject:", v16);

        ++v14;
      }
      while (v12 != v14);
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v12);
  }

  return v4;
}

- (id)keysForStorageContact:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = (void *)objc_opt_new();
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  objc_msgSend(v3, "profiles", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v19 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
        objc_msgSend(v10, "title");
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        if (v11)
        {
          objc_msgSend(v10, "title");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          SGNormalizeName((uint64_t)v12);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "addObject:", v13);

        }
        objc_msgSend(v10, "duplicateKey");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v14, "entityType") == 4)
        {
          objc_msgSend(v14, "identityKey");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v15, "hasEmailAddress"))
          {
            objc_msgSend(v15, "emailAddress");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v4, "addObject:", v16);

          }
        }

      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v7);
  }

  return v4;
}

- (id)keysForContactDetail:(id)a3 ofContact:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  SGSocialProfileDetails *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t i;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  id v41;
  void *v42;
  id v43;
  void *context;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  _BYTE v49[128];
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  context = (void *)MEMORY[0x1C3BD4F6C]();
  v7 = (void *)objc_opt_new();
  v8 = (void *)objc_opt_new();
  objc_msgSend(v6, "name");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    objc_msgSend(v6, "name");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "fullName");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    SGNormalizeName((uint64_t)v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObject:", v12);

  }
  objc_msgSend(v6, "emailAddresses");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "count");

  if (v14)
  {
    objc_msgSend(v6, "emailAddresses");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "objectAtIndexedSubscript:", 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "emailAddress");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    SGNormalizeEmailAddress();
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObject:", v18);

  }
  SGDelimitedStringsSerializeArray();
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v42 = v8;
    v43 = v6;
    v41 = v5;
    v20 = -[SGSocialProfileDetails initWithSocialProfile:]([SGSocialProfileDetails alloc], "initWithSocialProfile:", v41);
    v45 = 0u;
    v46 = 0u;
    v47 = 0u;
    v48 = 0u;
    -[SGSocialProfileDetails uniqueIdentifiers](v20, "uniqueIdentifiers");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v45, v49, 16);
    if (v22)
    {
      v23 = v22;
      v24 = *(_QWORD *)v46;
      do
      {
        for (i = 0; i != v23; ++i)
        {
          if (*(_QWORD *)v46 != v24)
            objc_enumerationMutation(v21);
          v26 = *(void **)(*((_QWORD *)&v45 + 1) + 8 * i);
          SGNormalizeSocialProfile(v26);
          objc_msgSend((id)objc_claimAutoreleasedReturnValue(), "stringByAppendingString:", v19);
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "addObject:", v27);

        }
        v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v45, v49, 16);
      }
      while (v23);
    }

    v8 = v42;
    v6 = v43;
  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v5, "emailAddress");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    SGNormalizeEmailAddress();
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "stringByAppendingString:", v19);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObject:", v30);

  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v5, "phoneNumber");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    SGNormalizePhoneNumber();
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "stringByAppendingString:", v19);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObject:", v33);

  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v5, "address");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    SGNormalizeAddress(v34);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "stringByAppendingString:", v19);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObject:", v36);

  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v5, "dateString");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    SGNormalizeBirthday(v37);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "stringByAppendingString:", v19);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObject:", v39);

  }
  objc_autoreleasePoolPop(context);

  return v7;
}

- (id)keysForCuratedContactDetail:(id)a3 ofContact:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  char isKindOfClass;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  char v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  char v31;
  void *v32;
  void *v33;
  void *v34;
  void *context;

  v5 = a3;
  v6 = a4;
  context = (void *)MEMORY[0x1C3BD4F6C]();
  v7 = (void *)objc_opt_new();
  v8 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x1E0C97218], "stringFromContact:style:", v6, 0);
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)v9;
  if (v9)
  {
    SGNormalizeName(v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObject:", v11);

  }
  objc_msgSend(v6, "emailAddresses");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "count");

  if (v13)
  {
    objc_msgSend(v6, "emailAddresses");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "objectAtIndexedSubscript:", 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "value");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    SGNormalizeEmailAddress();
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObject:", v17);

  }
  SGDelimitedStringsSerializeArray();
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "value");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend(v5, "value");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    SGNormalizeEmailAddress();
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "stringByAppendingString:", v18);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObject:", v23);

  }
  objc_msgSend(v5, "value");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v25 = objc_opt_isKindOfClass();

  if ((v25 & 1) != 0)
  {
    objc_msgSend(v5, "value");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "stringValue");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    SGNormalizePhoneNumber();
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "stringByAppendingString:", v18);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObject:", v29);

  }
  objc_msgSend(v5, "value");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v31 = objc_opt_isKindOfClass();

  if ((v31 & 1) != 0)
  {
    objc_msgSend(v5, "value");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    SGNormalizeCNAddress(v32);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "stringByAppendingString:", v18);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObject:", v34);

  }
  objc_autoreleasePoolPop(context);

  return v7;
}

- (id)_canaryHash
{
  if (_canaryHash__pasOnceToken63 != -1)
    dispatch_once(&_canaryHash__pasOnceToken63, &__block_literal_global_134);
  return (id)_canaryHash__pasExprOnceResult;
}

- (id)legacyIOS13HashesForClassicHashes:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  NSObject *v7;
  _BOOL4 v8;
  void *v9;
  id v11;
  id v12;
  uint8_t buf[16];

  v4 = a3;
  -[SGSuggestHistory legacyManateeSecret](self, "legacyManateeSecret");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "length");
  sgLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG);
  if (v6)
  {
    if (v8)
    {
      *(_WORD *)buf = 0;
      _os_log_debug_impl(&dword_1C3607000, v7, OS_LOG_TYPE_DEBUG, "SGCK will use legacy manatee hashes", buf, 2u);
    }

    if (legacyIOS13HashesForClassicHashes___pasOnceToken66 != -1)
      dispatch_once(&legacyIOS13HashesForClassicHashes___pasOnceToken66, &__block_literal_global_137);
    v11 = (id)legacyIOS13HashesForClassicHashes___pasExprOnceResult;
    v12 = v5;
    v7 = v11;
    sgMap();
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    if (v8)
    {
      *(_WORD *)buf = 0;
      _os_log_debug_impl(&dword_1C3607000, v7, OS_LOG_TYPE_DEBUG, "SGCK legacy Manatee salt not supported", buf, 2u);
    }
    v9 = 0;
  }

  return v9;
}

- (id)hashesByAddingCompatibilityHashesToHashes:(id)a3 forMatching:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v18[2];

  v4 = a4;
  v18[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = v6;
  if (v4)
  {
    -[SGSuggestHistory legacyIOS13HashesForClassicHashes:](self, "legacyIOS13HashesForClassicHashes:", v6);
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = (void *)v8;
    v10 = (void *)MEMORY[0x1E0C9AA60];
    if (v8)
      v10 = (void *)v8;
    v11 = v10;

    v12 = (void *)MEMORY[0x1C3BD4F6C]();
    -[SGSuggestHistory _canaryHash](self, "_canaryHash");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = v13;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "arrayByAddingObjectsFromArray:", v7);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "arrayByAddingObjectsFromArray:", v11);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    objc_autoreleasePoolPop(v12);
  }
  else
  {
    v16 = (void *)objc_msgSend(v6, "copy");
  }

  return v16;
}

- (id)hashesForStrings:(id)a3 forMatching:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v11;

  v4 = a4;
  v6 = a3;
  -[SGSuggestHistory salt](self, "salt");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v11;
  sgMap();
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[SGSuggestHistory hashesByAddingCompatibilityHashesToHashes:forMatching:](self, "hashesByAddingCompatibilityHashesToHashes:forMatching:", v8, v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)hashesForContact:(id)a3 forMatching:(BOOL)a4
{
  _BOOL8 v4;
  void *v6;
  void *v7;

  v4 = a4;
  -[SGSuggestHistory keysForContact:](self, "keysForContact:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SGSuggestHistory hashesForStrings:forMatching:](self, "hashesForStrings:forMatching:", v6, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)hashesForStorageContact:(id)a3 forMatching:(BOOL)a4
{
  _BOOL8 v4;
  void *v6;
  void *v7;

  v4 = a4;
  -[SGSuggestHistory keysForStorageContact:](self, "keysForStorageContact:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SGSuggestHistory hashesForStrings:forMatching:](self, "hashesForStrings:forMatching:", v6, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)hashesForContactDetail:(id)a3 fromContact:(id)a4 forMatching:(BOOL)a5
{
  _BOOL8 v5;
  void *v7;
  void *v8;

  v5 = a5;
  -[SGSuggestHistory keysForContactDetail:ofContact:](self, "keysForContactDetail:ofContact:", a3, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SGSuggestHistory hashesForStrings:forMatching:](self, "hashesForStrings:forMatching:", v7, v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)hashesForCuratedContactDetail:(id)a3 fromContact:(id)a4 forMatching:(BOOL)a5
{
  _BOOL8 v5;
  void *v7;
  void *v8;

  v5 = a5;
  -[SGSuggestHistory keysForCuratedContactDetail:ofContact:](self, "keysForCuratedContactDetail:ofContact:", a3, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SGSuggestHistory hashesForStrings:forMatching:](self, "hashesForStrings:forMatching:", v7, v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)identityBasedHashesForPseudoEvent:(id)a3 withCreationTime:(SGUnixTimestamp_)a4
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v15;

  v7 = a3;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SGSuggestHistory.m"), 947, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("key"));

  }
  objc_msgSend(v7, "serialize");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[SGSuggestHistory confirmHashesForOpaqueKey:withCreationTime:forMatching:](self, "confirmHashesForOpaqueKey:withCreationTime:forMatching:", v8, 1, a4.secondsFromUnixEpoch);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "serialize");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[SGSuggestHistory rejectHashesForOpaqueKey:forMatching:](self, "rejectHashesForOpaqueKey:forMatching:", v10, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = (void *)MEMORY[0x1C3BD4F6C]();
  objc_msgSend(v9, "arrayByAddingObjectsFromArray:", v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_autoreleasePoolPop(v12);

  return v13;
}

- (id)identityBasedHashesForPseudoReminder:(id)a3 withCreationTime:(SGUnixTimestamp_)a4
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v15;

  v7 = a3;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SGSuggestHistory.m"), 958, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("key"));

  }
  objc_msgSend(v7, "serialize");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[SGSuggestHistory confirmHashesForRemindersOpaqueKey:withCreationTime:forMatching:](self, "confirmHashesForRemindersOpaqueKey:withCreationTime:forMatching:", v8, 1, a4.secondsFromUnixEpoch);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "serialize");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[SGSuggestHistory rejectHashesForOpaqueKey:forMatching:](self, "rejectHashesForOpaqueKey:forMatching:", v10, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = (void *)MEMORY[0x1C3BD4F6C]();
  objc_msgSend(v9, "arrayByAddingObjectsFromArray:", v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_autoreleasePoolPop(v12);

  return v13;
}

- (id)confirmHashesForRemindersOpaqueKey:(id)a3 withCreationTime:(SGUnixTimestamp_)a4 forMatching:(BOOL)a5
{
  return -[SGSuggestHistory confirmHashesForOpaqueKey:withCreationTime:forMatching:](self, "confirmHashesForOpaqueKey:withCreationTime:forMatching:", a3, a5, round(a4.secondsFromUnixEpoch / 10.0) * 10.0);
}

- (id)confirmHashesForOpaqueKey:(id)a3 withCreationTime:(SGUnixTimestamp_)a4 forMatching:(BOOL)a5
{
  _BOOL8 v5;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v16;
  _QWORD v17[2];

  v5 = a5;
  v17[1] = *MEMORY[0x1E0C80C00];
  v9 = a3;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SGSuggestHistory.m"), 981, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("opaqueKey"));

  }
  v10 = (void *)MEMORY[0x1C3BD4F6C]();
  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%.2f"), *(SGUnixTimestamp_ *)&a4.secondsFromUnixEpoch);
  objc_msgSend(v9, "stringByAppendingString:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_autoreleasePoolPop(v10);
  v17[0] = v12;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[SGSuggestHistory hashesForStrings:forMatching:](self, "hashesForStrings:forMatching:", v13, v5);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (id)confirmHashesForOpaqueKeyWithoutTimestamp:(id)a3 forMatching:(BOOL)a4
{
  _BOOL8 v4;
  id v7;
  void *v8;
  void *v10;

  v4 = a4;
  v7 = a3;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SGSuggestHistory.m"), 990, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("opaqueKey"));

  }
  -[SGSuggestHistory hashesForOpaqueKey:forMatching:](self, "hashesForOpaqueKey:forMatching:", v7, v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)rejectHashesForOpaqueKey:(id)a3 forMatching:(BOOL)a4
{
  _BOOL8 v4;
  id v7;
  void *v8;
  void *v10;

  v4 = a4;
  v7 = a3;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SGSuggestHistory.m"), 997, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("opaqueKey"));

  }
  -[SGSuggestHistory hashesForOpaqueKey:forMatching:](self, "hashesForOpaqueKey:forMatching:", v7, v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)hashesForOpaqueKey:(id)a3 forMatching:(BOOL)a4
{
  _BOOL8 v4;
  id v7;
  void *v8;
  void *v9;
  void *v11;
  _QWORD v12[2];

  v4 = a4;
  v12[1] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SGSuggestHistory.m"), 1003, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("opaqueKey"));

  }
  v12[0] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[SGSuggestHistory hashesForStrings:forMatching:](self, "hashesForStrings:forMatching:", v8, v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)hashesForPseudoEventByKey:(id)a3 forMatching:(BOOL)a4
{
  _BOOL8 v4;
  void *v6;
  void *v7;

  v4 = a4;
  objc_msgSend(a3, "serialize");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SGSuggestHistory hashesForOpaqueKey:forMatching:](self, "hashesForOpaqueKey:forMatching:", v6, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)resetNoFlush
{
  NSObject *v3;
  _PASLock *lock;
  _QWORD v5[5];
  uint8_t buf[16];

  sgLogHandle();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1C3607000, v3, OS_LOG_TYPE_INFO, "Resetting suggestions history", buf, 2u);
  }

  lock = self->_lock;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __32__SGSuggestHistory_resetNoFlush__block_invoke;
  v5[3] = &unk_1E7DAA2C0;
  v5[4] = self;
  -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v5);
}

- (void)reset
{
  -[SGSuggestHistory resetNoFlush](self, "resetNoFlush");
  -[NSUbiquitousKeyValueStore synchronize](self->_backingKVStore, "synchronize");
}

- (void)handleSyncedDataChanged:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  NSObject *v8;
  _PASLock *lock;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  NSObject *v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  _QWORD v43[12];
  uint64_t v44;
  uint64_t *v45;
  uint64_t v46;
  uint64_t (*v47)(uint64_t, uint64_t);
  void (*v48)(uint64_t);
  id v49;
  uint64_t v50;
  uint64_t *v51;
  uint64_t v52;
  uint64_t (*v53)(uint64_t, uint64_t);
  void (*v54)(uint64_t);
  id v55;
  uint64_t v56;
  uint64_t *v57;
  uint64_t v58;
  uint64_t (*v59)(uint64_t, uint64_t);
  void (*v60)(uint64_t);
  id v61;
  _QWORD v62[5];
  id v63;
  uint64_t v64;
  uint64_t *v65;
  uint64_t v66;
  uint64_t (*v67)(uint64_t, uint64_t);
  void (*v68)(uint64_t);
  id v69;
  uint64_t v70;
  uint64_t *v71;
  uint64_t v72;
  uint64_t (*v73)(uint64_t, uint64_t);
  void (*v74)(uint64_t);
  id v75;
  _BYTE v76[128];
  _BYTE v77[128];
  _BYTE v78[128];
  uint8_t v79[128];
  uint8_t buf[4];
  int v81;
  uint64_t v82;

  v82 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v70 = 0;
  v71 = &v70;
  v72 = 0x3032000000;
  v73 = __Block_byref_object_copy__7053;
  v74 = __Block_byref_object_dispose__7054;
  v75 = 0;
  v64 = 0;
  v65 = &v64;
  v66 = 0x3032000000;
  v67 = __Block_byref_object_copy__7053;
  v68 = __Block_byref_object_dispose__7054;
  v69 = 0;
  v62[0] = 0;
  v62[1] = v62;
  v62[2] = 0x3032000000;
  v62[3] = __Block_byref_object_copy__7053;
  v62[4] = __Block_byref_object_dispose__7054;
  v63 = 0;
  v56 = 0;
  v57 = &v56;
  v58 = 0x3032000000;
  v59 = __Block_byref_object_copy__7053;
  v60 = __Block_byref_object_dispose__7054;
  v61 = 0;
  v50 = 0;
  v51 = &v50;
  v52 = 0x3032000000;
  v53 = __Block_byref_object_copy__7053;
  v54 = __Block_byref_object_dispose__7054;
  v55 = 0;
  v44 = 0;
  v45 = &v44;
  v46 = 0x3032000000;
  v47 = __Block_byref_object_copy__7053;
  v48 = __Block_byref_object_dispose__7054;
  v49 = 0;
  objc_msgSend(v4, "userInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x1E0CB3358]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "unsignedIntegerValue");

  sgLogHandle();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 67109120;
    v81 = v7;
    _os_log_debug_impl(&dword_1C3607000, v8, OS_LOG_TYPE_DEBUG, "Suggestions history synced data change, reason=%i", buf, 8u);
  }

  lock = self->_lock;
  v43[0] = MEMORY[0x1E0C809B0];
  v43[1] = 3221225472;
  v43[2] = __44__SGSuggestHistory_handleSyncedDataChanged___block_invoke;
  v43[3] = &unk_1E7DAA5D0;
  v43[4] = self;
  v43[5] = &v70;
  v43[6] = &v64;
  v43[7] = v62;
  v43[8] = &v56;
  v43[9] = &v50;
  v43[10] = &v44;
  v43[11] = v7;
  -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v43);
  if (v65[5])
  {
    v41 = 0u;
    v42 = 0u;
    v39 = 0u;
    v40 = 0u;
    v10 = (id)v71[5];
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v39, v79, 16);
    if (v11)
    {
      v12 = *(_QWORD *)v40;
      do
      {
        v13 = 0;
        do
        {
          if (*(_QWORD *)v40 != v12)
            objc_enumerationMutation(v10);
          objc_msgSend(*(id *)(*((_QWORD *)&v39 + 1) + 8 * v13++), "processNewConfirmOrRejectEventHashes:", v65[5]);
        }
        while (v11 != v13);
        v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v39, v79, 16);
      }
      while (v11);
    }

  }
  if (v57[5])
  {
    v37 = 0u;
    v38 = 0u;
    v35 = 0u;
    v36 = 0u;
    v14 = (id)v71[5];
    v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v35, v78, 16);
    if (v15)
    {
      v16 = *(_QWORD *)v36;
      do
      {
        v17 = 0;
        do
        {
          if (*(_QWORD *)v36 != v16)
            objc_enumerationMutation(v14);
          objc_msgSend(*(id *)(*((_QWORD *)&v35 + 1) + 8 * v17++), "processNewConfirmOrRejectEventHashes:", v57[5]);
        }
        while (v15 != v17);
        v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v35, v78, 16);
      }
      while (v15);
    }

  }
  if (v51[5])
  {
    v33 = 0u;
    v34 = 0u;
    v31 = 0u;
    v32 = 0u;
    v18 = (id)v71[5];
    v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v31, v77, 16);
    if (v19)
    {
      v20 = *(_QWORD *)v32;
      do
      {
        v21 = 0;
        do
        {
          if (*(_QWORD *)v32 != v20)
            objc_enumerationMutation(v18);
          objc_msgSend(*(id *)(*((_QWORD *)&v31 + 1) + 8 * v21++), "processNewConfirmedOrRejectedReminderHashes:", v51[5]);
        }
        while (v19 != v21);
        v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v31, v77, 16);
      }
      while (v19);
    }

  }
  if (v45[5])
  {
    v29 = 0u;
    v30 = 0u;
    v27 = 0u;
    v28 = 0u;
    v22 = (id)v71[5];
    v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v27, v76, 16);
    if (v23)
    {
      v24 = *(_QWORD *)v28;
      do
      {
        v25 = 0;
        do
        {
          if (*(_QWORD *)v28 != v24)
            objc_enumerationMutation(v22);
          objc_msgSend(*(id *)(*((_QWORD *)&v27 + 1) + 8 * v25++), "processNewConfirmedOrRejectedReminderHashes:", v45[5], (_QWORD)v27);
        }
        while (v23 != v25);
        v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v27, v76, 16);
      }
      while (v23);
    }

  }
  if (v7 == 3)
  {
    sgLogHandle();
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1C3607000, v26, OS_LOG_TYPE_DEFAULT, "SGSuggestHistory calling migrateIfNeeded due to NSUbiquitousKeyValueStoreAccountChange", buf, 2u);
    }

    -[SGSuggestHistory migrateIfNeeded](self, "migrateIfNeeded");
  }
  _Block_object_dispose(&v44, 8);

  _Block_object_dispose(&v50, 8);
  _Block_object_dispose(&v56, 8);

  _Block_object_dispose(v62, 8);
  _Block_object_dispose(&v64, 8);

  _Block_object_dispose(&v70, 8);
}

- (void)confirmOrRejectDetailHashes:(id)a3
{
  id v4;
  _PASLock *lock;
  id v6;
  _QWORD v7[4];
  id v8;
  SGSuggestHistory *v9;

  v4 = a3;
  lock = self->_lock;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __48__SGSuggestHistory_confirmOrRejectDetailHashes___block_invoke;
  v7[3] = &unk_1E7DAA5F8;
  v8 = v4;
  v9 = self;
  v6 = v4;
  -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v7);

}

- (void)confirmOrRejectDetail:(id)a3 forContact:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  int v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = a3;
  sgLogHandle();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    v11 = 138412290;
    v12 = v6;
    _os_log_debug_impl(&dword_1C3607000, v8, OS_LOG_TYPE_DEBUG, "Confirming or rejecting record for contact %@", (uint8_t *)&v11, 0xCu);
  }

  -[SGSuggestHistory hashesForContactDetail:fromContact:forMatching:](self, "hashesForContactDetail:fromContact:forMatching:", v7, v6, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[SGSuggestHistory confirmOrRejectDetailHashes:](self, "confirmOrRejectDetailHashes:", v9);
  objc_msgSend(v6, "recordId");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[SGDNotificationBroadcaster emitContactUpdated:](SGDNotificationBroadcaster, "emitContactUpdated:", v10);

}

- (void)confirmOrRejectRecordForContact:(id)a3
{
  id v4;
  NSObject *v5;
  _PASLock *lock;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(uint64_t, _QWORD *);
  void *v12;
  SGSuggestHistory *v13;
  id v14;
  uint8_t buf[4];
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  sgLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    v16 = v4;
    _os_log_debug_impl(&dword_1C3607000, v5, OS_LOG_TYPE_DEBUG, "Confirming or rejecting contact %@", buf, 0xCu);
  }

  lock = self->_lock;
  v9 = MEMORY[0x1E0C809B0];
  v10 = 3221225472;
  v11 = __52__SGSuggestHistory_confirmOrRejectRecordForContact___block_invoke;
  v12 = &unk_1E7DAA5F8;
  v13 = self;
  v14 = v4;
  v7 = v4;
  -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", &v9);
  objc_msgSend(v7, "recordId", v9, v10, v11, v12, v13);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[SGDNotificationBroadcaster emitContactUpdated:](SGDNotificationBroadcaster, "emitContactUpdated:", v8);

}

- (void)rejectContactDetailKey:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "serialize");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SGSuggestHistory hashesForStrings:forMatching:](self, "hashesForStrings:forMatching:", v5, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SGSuggestHistory confirmOrRejectDetailHashes:](self, "confirmOrRejectDetailHashes:", v6);

}

- (void)rejectRealtimeContact:(id)a3
{
  id v4;
  NSObject *v5;
  _PASLock *lock;
  id v7;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(uint64_t, void *);
  void *v11;
  id v12;
  SGSuggestHistory *v13;
  uint8_t buf[4];
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  sgLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    v15 = v4;
    _os_log_debug_impl(&dword_1C3607000, v5, OS_LOG_TYPE_DEBUG, "Rejecting contact %@", buf, 0xCu);
  }

  lock = self->_lock;
  v8 = MEMORY[0x1E0C809B0];
  v9 = 3221225472;
  v10 = __42__SGSuggestHistory_rejectRealtimeContact___block_invoke;
  v11 = &unk_1E7DAA5F8;
  v12 = v4;
  v13 = self;
  v7 = v4;
  -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", &v8);
  +[SGDNotificationBroadcaster emitContactUpdated:](SGDNotificationBroadcaster, "emitContactUpdated:", 0, v8, v9, v10, v11);

}

- (void)rejectContact:(id)a3
{
  id v4;
  NSObject *v5;
  _PASLock *lock;
  id v7;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(uint64_t, uint64_t);
  void *v11;
  SGSuggestHistory *v12;
  id v13;
  uint8_t buf[4];
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  sgLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    v15 = v4;
    _os_log_debug_impl(&dword_1C3607000, v5, OS_LOG_TYPE_DEBUG, "Rejecting contact %@", buf, 0xCu);
  }

  lock = self->_lock;
  v8 = MEMORY[0x1E0C809B0];
  v9 = 3221225472;
  v10 = __34__SGSuggestHistory_rejectContact___block_invoke;
  v11 = &unk_1E7DAA5F8;
  v12 = self;
  v13 = v4;
  v7 = v4;
  -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", &v8);
  +[SGDNotificationBroadcaster emitContactUpdated:](SGDNotificationBroadcaster, "emitContactUpdated:", 0, v8, v9, v10, v11, v12);

}

- (void)confirmEvent:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  sgLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    v12 = 138412290;
    v13 = v4;
    _os_log_debug_impl(&dword_1C3607000, v5, OS_LOG_TYPE_DEBUG, "Confirming event %@", (uint8_t *)&v12, 0xCu);
  }

  objc_msgSend(v4, "opaqueKey");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "creationDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "timeIntervalSince1970");
  -[SGSuggestHistory confirmHashesForOpaqueKey:withCreationTime:forMatching:](self, "confirmHashesForOpaqueKey:withCreationTime:forMatching:", v6, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[SGSuggestHistory writeAndPushConfirmedEventHashes:](self, "writeAndPushConfirmedEventHashes:", v8);

  objc_msgSend(v4, "opaqueKey");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[SGSuggestHistory confirmHashesForOpaqueKeyWithoutTimestamp:forMatching:](self, "confirmHashesForOpaqueKeyWithoutTimestamp:forMatching:", v9, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[SGSuggestHistory writeAndPushConfirmedEventWithoutTimestampHashes:](self, "writeAndPushConfirmedEventWithoutTimestampHashes:", v10);

  objc_msgSend(v4, "recordId");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[SGDNotificationBroadcaster emitEventUpdated:](SGDNotificationBroadcaster, "emitEventUpdated:", v11);

}

- (void)confirmStorageEvent:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  sgLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    v11 = 138412290;
    v12 = v4;
    _os_log_debug_impl(&dword_1C3607000, v5, OS_LOG_TYPE_DEBUG, "Confirming storage event %@", (uint8_t *)&v11, 0xCu);
  }

  objc_msgSend(v4, "opaqueKey");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "creationTimestamp");
  -[SGSuggestHistory confirmHashesForOpaqueKey:withCreationTime:forMatching:](self, "confirmHashesForOpaqueKey:withCreationTime:forMatching:", v6, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SGSuggestHistory writeAndPushConfirmedEventHashes:](self, "writeAndPushConfirmedEventHashes:", v7);

  objc_msgSend(v4, "opaqueKey");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[SGSuggestHistory confirmHashesForOpaqueKeyWithoutTimestamp:forMatching:](self, "confirmHashesForOpaqueKeyWithoutTimestamp:forMatching:", v8, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[SGSuggestHistory writeAndPushConfirmedEventWithoutTimestampHashes:](self, "writeAndPushConfirmedEventWithoutTimestampHashes:", v9);

  objc_msgSend(v4, "recordId");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[SGDNotificationBroadcaster emitEventUpdated:](SGDNotificationBroadcaster, "emitEventUpdated:", v10);

}

- (void)writeAndPushConfirmedEventHashes:(id)a3
{
  id v4;
  _PASLock *lock;
  id v6;
  _QWORD v7[4];
  id v8;
  SGSuggestHistory *v9;

  v4 = a3;
  lock = self->_lock;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __53__SGSuggestHistory_writeAndPushConfirmedEventHashes___block_invoke;
  v7[3] = &unk_1E7DAA5F8;
  v8 = v4;
  v9 = self;
  v6 = v4;
  -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v7);

}

- (void)writeAndPushConfirmedEventWithoutTimestampHashes:(id)a3
{
  id v4;
  _PASLock *lock;
  id v6;
  _QWORD v7[4];
  id v8;
  SGSuggestHistory *v9;

  v4 = a3;
  lock = self->_lock;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __69__SGSuggestHistory_writeAndPushConfirmedEventWithoutTimestampHashes___block_invoke;
  v7[3] = &unk_1E7DAA5F8;
  v8 = v4;
  v9 = self;
  v6 = v4;
  -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v7);

}

- (void)rejectEvent:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  sgLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    v8 = 138412290;
    v9 = v4;
    _os_log_debug_impl(&dword_1C3607000, v5, OS_LOG_TYPE_DEBUG, "Rejecting event %@", (uint8_t *)&v8, 0xCu);
  }

  objc_msgSend(v4, "opaqueKey");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SGSuggestHistory rejectHashesForOpaqueKey:forMatching:](self, "rejectHashesForOpaqueKey:forMatching:", v6, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SGSuggestHistory writeAndPushRejectedEventHashes:](self, "writeAndPushRejectedEventHashes:", v7);

  +[SGDNotificationBroadcaster emitEventUpdated:](SGDNotificationBroadcaster, "emitEventUpdated:", 0);
}

- (void)rejectStorageEvent:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  sgLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    v8 = 138412290;
    v9 = v4;
    _os_log_debug_impl(&dword_1C3607000, v5, OS_LOG_TYPE_DEBUG, "Rejecting storage event %@", (uint8_t *)&v8, 0xCu);
  }

  objc_msgSend(v4, "opaqueKey");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SGSuggestHistory rejectHashesForOpaqueKey:forMatching:](self, "rejectHashesForOpaqueKey:forMatching:", v6, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SGSuggestHistory writeAndPushRejectedEventHashes:](self, "writeAndPushRejectedEventHashes:", v7);

  +[SGDNotificationBroadcaster emitEventUpdated:](SGDNotificationBroadcaster, "emitEventUpdated:", 0);
}

- (void)writeAndPushRejectedEventHashes:(id)a3
{
  id v4;
  _PASLock *lock;
  id v6;
  _QWORD v7[4];
  id v8;
  SGSuggestHistory *v9;

  v4 = a3;
  lock = self->_lock;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __52__SGSuggestHistory_writeAndPushRejectedEventHashes___block_invoke;
  v7[3] = &unk_1E7DAA5F8;
  v8 = v4;
  v9 = self;
  v6 = v4;
  -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v7);

}

- (void)confirmReminder:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  sgRemindersLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(v4, "opaqueKey");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 138412290;
    v12 = v10;
    _os_log_debug_impl(&dword_1C3607000, v5, OS_LOG_TYPE_DEBUG, "Confirming reminder with opaqueKey %@", (uint8_t *)&v11, 0xCu);

  }
  objc_msgSend(v4, "opaqueKey");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "creationDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "timeIntervalSince1970");
  -[SGSuggestHistory confirmHashesForRemindersOpaqueKey:withCreationTime:forMatching:](self, "confirmHashesForRemindersOpaqueKey:withCreationTime:forMatching:", v6, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[SGSuggestHistory writeAndPushConfirmedReminderHashes:](self, "writeAndPushConfirmedReminderHashes:", v8);

  objc_msgSend(v4, "recordId");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[SGDNotificationBroadcaster emitReminderUpdated:](SGDNotificationBroadcaster, "emitReminderUpdated:", v9);

}

- (void)writeAndPushConfirmedReminderHashes:(id)a3
{
  id v4;
  _PASLock *lock;
  id v6;
  _QWORD v7[4];
  id v8;
  SGSuggestHistory *v9;

  v4 = a3;
  lock = self->_lock;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __56__SGSuggestHistory_writeAndPushConfirmedReminderHashes___block_invoke;
  v7[3] = &unk_1E7DAA5F8;
  v8 = v4;
  v9 = self;
  v6 = v4;
  -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v7);

}

- (void)rejectReminder:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  sgRemindersLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(v4, "opaqueKey");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138412290;
    v10 = v8;
    _os_log_debug_impl(&dword_1C3607000, v5, OS_LOG_TYPE_DEBUG, "Rejecting reminder with opaqueKey %@", (uint8_t *)&v9, 0xCu);

  }
  objc_msgSend(v4, "opaqueKey");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SGSuggestHistory rejectHashesForOpaqueKey:forMatching:](self, "rejectHashesForOpaqueKey:forMatching:", v6, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SGSuggestHistory writeAndPushRejectedReminderHashes:](self, "writeAndPushRejectedReminderHashes:", v7);

  +[SGDNotificationBroadcaster emitReminderUpdated:](SGDNotificationBroadcaster, "emitReminderUpdated:", 0);
}

- (void)writeAndPushRejectedReminderHashes:(id)a3
{
  id v4;
  _PASLock *lock;
  id v6;
  _QWORD v7[4];
  id v8;
  SGSuggestHistory *v9;

  v4 = a3;
  lock = self->_lock;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __55__SGSuggestHistory_writeAndPushRejectedReminderHashes___block_invoke;
  v7[3] = &unk_1E7DAA5F8;
  v8 = v4;
  v9 = self;
  v6 = v4;
  -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v7);

}

- (void)confirmReminderFromExternalDevice:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  _PASLock *lock;
  void *v11;
  void *v12;
  _QWORD v13[5];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;
  uint64_t v20;
  _QWORD v21[2];

  v21[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[SGSuggestHistory kvs](self, "kvs");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = +[SGSuggestHistory newTestingInstanceWithSharedKVS:](SGSuggestHistory, "newTestingInstanceWithSharedKVS:", v5);

  objc_msgSend(v4, "opaqueKey");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "creationDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "timeIntervalSince1970");
  objc_msgSend(v6, "confirmHashesForRemindersOpaqueKey:withCreationTime:forMatching:", v7, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__7053;
  v18 = __Block_byref_object_dispose__7054;
  v19 = 0;
  lock = self->_lock;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __54__SGSuggestHistory_confirmReminderFromExternalDevice___block_invoke;
  v13[3] = &unk_1E7DAA2E8;
  v13[4] = &v14;
  -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v13);
  objc_msgSend((id)v15[5], "addObjectsFromArray:", v9);
  -[SGSuggestHistory _setHashes:forKey:](self, "_setHashes:forKey:", v15[5], CFSTR("reminders"));
  v20 = *MEMORY[0x1E0CB3358];
  v21[0] = &unk_1E7E0BED0;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v21, &v20, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37C0], "notificationWithName:object:userInfo:", CFSTR("new data"), self, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[SGSuggestHistory handleSyncedDataChanged:](self, "handleSyncedDataChanged:", v12);

  _Block_object_dispose(&v14, 8);
}

- (void)rejectReminderFromExternalDevice:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  _PASLock *lock;
  void *v10;
  void *v11;
  _QWORD v12[5];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;
  uint64_t v19;
  _QWORD v20[2];

  v20[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[SGSuggestHistory kvs](self, "kvs");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = +[SGSuggestHistory newTestingInstanceWithSharedKVS:](SGSuggestHistory, "newTestingInstanceWithSharedKVS:", v5);

  objc_msgSend(v4, "opaqueKey");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "rejectHashesForOpaqueKey:forMatching:", v7, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__7053;
  v17 = __Block_byref_object_dispose__7054;
  v18 = 0;
  lock = self->_lock;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __53__SGSuggestHistory_rejectReminderFromExternalDevice___block_invoke;
  v12[3] = &unk_1E7DAA2E8;
  v12[4] = &v13;
  -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v12);
  objc_msgSend((id)v14[5], "addObjectsFromArray:", v8);
  -[SGSuggestHistory _setHashes:forKey:](self, "_setHashes:forKey:", v14[5], CFSTR("rejectedReminders"));
  v19 = *MEMORY[0x1E0CB3358];
  v20[0] = &unk_1E7E0BED0;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, &v19, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37C0], "notificationWithName:object:userInfo:", CFSTR("new data"), self, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[SGSuggestHistory handleSyncedDataChanged:](self, "handleSyncedDataChanged:", v11);

  _Block_object_dispose(&v13, 8);
}

- (BOOL)_anyHash:(id)a3 inSet:(id)a4
{
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  int v15;
  BOOL v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v8 = v6;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v19;
    while (2)
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v19 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
        if (objc_msgSend(v7, "containsObject:", v13, (_QWORD)v18))
        {
          -[SGSuggestHistory _canaryHash](self, "_canaryHash");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = objc_msgSend(v13, "isEqual:", v14);

          if (!v15)
          {
            v16 = 1;
            goto LABEL_12;
          }
        }
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      if (v10)
        continue;
      break;
    }
  }
  v16 = 0;
LABEL_12:

  return v16;
}

- (BOOL)hasContact:(id)a3
{
  id v4;
  _PASLock *lock;
  id v6;
  _QWORD v8[5];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  char v14;

  v4 = a3;
  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 0;
  lock = self->_lock;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __31__SGSuggestHistory_hasContact___block_invoke;
  v8[3] = &unk_1E7DAA620;
  v10 = &v11;
  v8[4] = self;
  v6 = v4;
  v9 = v6;
  -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v8);
  LOBYTE(lock) = *((_BYTE *)v12 + 24);

  _Block_object_dispose(&v11, 8);
  return (char)lock;
}

- (BOOL)hasStorageContact:(id)a3
{
  id v4;
  _PASLock *lock;
  id v6;
  _QWORD v8[5];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  char v14;

  v4 = a3;
  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 0;
  lock = self->_lock;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __38__SGSuggestHistory_hasStorageContact___block_invoke;
  v8[3] = &unk_1E7DAA620;
  v10 = &v11;
  v8[4] = self;
  v6 = v4;
  v9 = v6;
  -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v8);
  LOBYTE(lock) = *((_BYTE *)v12 + 24);

  _Block_object_dispose(&v11, 8);
  return (char)lock;
}

- (BOOL)isValidNewEvent:(id)a3
{
  id v4;
  _PASLock *lock;
  id v6;
  _QWORD v8[5];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  char v14;

  v4 = a3;
  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 0;
  lock = self->_lock;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __36__SGSuggestHistory_isValidNewEvent___block_invoke;
  v8[3] = &unk_1E7DAA620;
  v10 = &v11;
  v8[4] = self;
  v6 = v4;
  v9 = v6;
  -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v8);
  LOBYTE(lock) = *((_BYTE *)v12 + 24);

  _Block_object_dispose(&v11, 8);
  return (char)lock;
}

- (BOOL)isValidCancelledEvent:(id)a3
{
  id v4;
  _PASLock *lock;
  id v6;
  _QWORD v8[5];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  char v14;

  v4 = a3;
  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 0;
  lock = self->_lock;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __42__SGSuggestHistory_isValidCancelledEvent___block_invoke;
  v8[3] = &unk_1E7DAA620;
  v10 = &v11;
  v8[4] = self;
  v6 = v4;
  v9 = v6;
  -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v8);
  LOBYTE(lock) = *((_BYTE *)v12 + 24);

  _Block_object_dispose(&v11, 8);
  return (char)lock;
}

- (BOOL)isUpdatableContact:(id)a3
{
  id v4;
  _PASLock *lock;
  id v6;
  _QWORD v8[5];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  char v14;

  v4 = a3;
  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 0;
  lock = self->_lock;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __39__SGSuggestHistory_isUpdatableContact___block_invoke;
  v8[3] = &unk_1E7DAA620;
  v10 = &v11;
  v8[4] = self;
  v6 = v4;
  v9 = v6;
  -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v8);
  LOBYTE(lock) = *((_BYTE *)v12 + 24);

  _Block_object_dispose(&v11, 8);
  return (char)lock;
}

- (BOOL)isConfirmedEventWithoutTimeStamp:(id)a3
{
  id v4;
  _PASLock *lock;
  id v6;
  _QWORD v8[5];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  char v14;

  v4 = a3;
  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 0;
  lock = self->_lock;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __53__SGSuggestHistory_isConfirmedEventWithoutTimeStamp___block_invoke;
  v8[3] = &unk_1E7DAA620;
  v10 = &v11;
  v8[4] = self;
  v6 = v4;
  v9 = v6;
  -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v8);
  LOBYTE(lock) = *((_BYTE *)v12 + 24);

  _Block_object_dispose(&v11, 8);
  return (char)lock;
}

- (BOOL)isConfirmedEvent:(id)a3
{
  id v4;
  _PASLock *lock;
  id v6;
  _QWORD v8[5];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  char v14;

  v4 = a3;
  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 0;
  lock = self->_lock;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __37__SGSuggestHistory_isConfirmedEvent___block_invoke;
  v8[3] = &unk_1E7DAA620;
  v10 = &v11;
  v8[4] = self;
  v6 = v4;
  v9 = v6;
  -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v8);
  LOBYTE(lock) = *((_BYTE *)v12 + 24);

  _Block_object_dispose(&v11, 8);
  return (char)lock;
}

- (BOOL)isRejectedEvent:(id)a3
{
  id v4;
  _PASLock *lock;
  id v6;
  _QWORD v8[5];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  char v14;

  v4 = a3;
  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 0;
  lock = self->_lock;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __36__SGSuggestHistory_isRejectedEvent___block_invoke;
  v8[3] = &unk_1E7DAA620;
  v10 = &v11;
  v8[4] = self;
  v6 = v4;
  v9 = v6;
  -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v8);
  LOBYTE(lock) = *((_BYTE *)v12 + 24);

  _Block_object_dispose(&v11, 8);
  return (char)lock;
}

- (void)removeConfirmationHistoryForEvent:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  objc_msgSend(v4, "opaqueKey");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "creationDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "timeIntervalSince1970");
  -[SGSuggestHistory removeConfirmationHistoryForEntityWithOpaqueKey:creationTimestamp:](self, "removeConfirmationHistoryForEntityWithOpaqueKey:creationTimestamp:", v6);

}

- (void)removeConfirmationHistoryForEntityWithOpaqueKey:(id)a3 creationTimestamp:(SGUnixTimestamp_)a4
{
  id v6;
  _PASLock *lock;
  id v8;
  _QWORD v9[5];
  id v10;
  double secondsFromUnixEpoch;

  v6 = a3;
  lock = self->_lock;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __86__SGSuggestHistory_removeConfirmationHistoryForEntityWithOpaqueKey_creationTimestamp___block_invoke;
  v9[3] = &unk_1E7DAA648;
  v9[4] = self;
  v10 = v6;
  secondsFromUnixEpoch = a4.secondsFromUnixEpoch;
  v8 = v6;
  -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v9);

}

- (BOOL)isValidNewReminder:(id)a3
{
  id v4;
  _PASLock *lock;
  id v6;
  _QWORD v8[5];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  char v14;

  v4 = a3;
  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 0;
  lock = self->_lock;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __39__SGSuggestHistory_isValidNewReminder___block_invoke;
  v8[3] = &unk_1E7DAA620;
  v10 = &v11;
  v8[4] = self;
  v6 = v4;
  v9 = v6;
  -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v8);
  LOBYTE(lock) = *((_BYTE *)v12 + 24);

  _Block_object_dispose(&v11, 8);
  return (char)lock;
}

- (BOOL)isConfirmedReminder:(id)a3
{
  id v4;
  _PASLock *lock;
  id v6;
  _QWORD v8[5];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  char v14;

  v4 = a3;
  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 0;
  lock = self->_lock;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __40__SGSuggestHistory_isConfirmedReminder___block_invoke;
  v8[3] = &unk_1E7DAA620;
  v10 = &v11;
  v8[4] = self;
  v6 = v4;
  v9 = v6;
  -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v8);
  LOBYTE(lock) = *((_BYTE *)v12 + 24);

  _Block_object_dispose(&v11, 8);
  return (char)lock;
}

- (BOOL)isRejectedReminder:(id)a3
{
  id v4;
  _PASLock *lock;
  id v6;
  _QWORD v8[5];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  char v14;

  v4 = a3;
  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 0;
  lock = self->_lock;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __39__SGSuggestHistory_isRejectedReminder___block_invoke;
  v8[3] = &unk_1E7DAA620;
  v10 = &v11;
  v8[4] = self;
  v6 = v4;
  v9 = v6;
  -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v8);
  LOBYTE(lock) = *((_BYTE *)v12 + 24);

  _Block_object_dispose(&v11, 8);
  return (char)lock;
}

- (BOOL)isValidSuggestion:(id)a3
{
  id v4;
  id v5;
  void *v6;
  BOOL v7;
  int v8;
  BOOL v9;
  NSObject *v10;
  char v11;
  id v13;
  int v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    if (objc_msgSend(v5, "state") == 1)
    {
      objc_msgSend(v5, "contact");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = -[SGSuggestHistory hasContact:](self, "hasContact:", v6);
LABEL_18:
      v11 = !v7;
      goto LABEL_19;
    }
    if (objc_msgSend(v5, "state") == 2)
    {
      objc_msgSend(v5, "contact");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = -[SGSuggestHistory isUpdatableContact:](self, "isUpdatableContact:", v6);
      goto LABEL_16;
    }
    goto LABEL_14;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    v8 = objc_msgSend(v5, "state");
    switch(v8)
    {
      case 3:
        objc_msgSend(v5, "event");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = -[SGSuggestHistory isValidCancelledEvent:](self, "isValidCancelledEvent:", v6);
        goto LABEL_16;
      case 2:
        objc_msgSend(v5, "event");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        v7 = -[SGSuggestHistory isRejectedEvent:](self, "isRejectedEvent:", v6);
        goto LABEL_18;
      case 1:
        objc_msgSend(v5, "event");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = -[SGSuggestHistory isValidNewEvent:](self, "isValidNewEvent:", v6);
LABEL_16:
        v11 = v9;
LABEL_19:

        goto LABEL_20;
    }
LABEL_14:
    v11 = 1;
LABEL_20:

    goto LABEL_21;
  }
  sgLogHandle();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    v14 = 138412290;
    v15 = (id)objc_opt_class();
    v13 = v15;
    _os_log_error_impl(&dword_1C3607000, v10, OS_LOG_TYPE_ERROR, "Argument must be of type SGRealtimeContact or SGRealtimeEvent, but was %@", (uint8_t *)&v14, 0xCu);

  }
  v11 = 1;
LABEL_21:

  return v11;
}

- (void)addSuggestHistoryObserver:(id)a3
{
  id v5;
  _PASLock *lock;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SGSuggestHistory.m"), 1630, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("suggestHistoryObserver"));

  }
  lock = self->_lock;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __46__SGSuggestHistory_addSuggestHistoryObserver___block_invoke;
  v9[3] = &unk_1E7DAA2C0;
  v10 = v5;
  v8 = v5;
  -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v9);

}

- (void)confirmEventFromExternalDevice:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _PASLock *lock;
  void *v13;
  void *v14;
  _QWORD v15[6];
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;
  uint64_t v28;
  _QWORD v29[2];

  v29[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[SGSuggestHistory kvs](self, "kvs");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = +[SGSuggestHistory newTestingInstanceWithSharedKVS:](SGSuggestHistory, "newTestingInstanceWithSharedKVS:", v5);

  objc_msgSend(v4, "opaqueKey");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "creationDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "timeIntervalSince1970");
  objc_msgSend(v6, "confirmHashesForOpaqueKey:withCreationTime:forMatching:", v7, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "opaqueKey");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "confirmHashesForOpaqueKeyWithoutTimestamp:forMatching:", v10, 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v22 = 0;
  v23 = &v22;
  v24 = 0x3032000000;
  v25 = __Block_byref_object_copy__7053;
  v26 = __Block_byref_object_dispose__7054;
  v27 = 0;
  v16 = 0;
  v17 = &v16;
  v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__7053;
  v20 = __Block_byref_object_dispose__7054;
  v21 = 0;
  lock = self->_lock;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __51__SGSuggestHistory_confirmEventFromExternalDevice___block_invoke;
  v15[3] = &unk_1E7DAA388;
  v15[4] = &v22;
  v15[5] = &v16;
  -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v15);
  objc_msgSend((id)v23[5], "addObjectsFromArray:", v9);
  objc_msgSend((id)v17[5], "addObjectsFromArray:", v11);
  -[SGSuggestHistory _setHashes:forKey:](self, "_setHashes:forKey:", v23[5], CFSTR("events"));
  -[SGSuggestHistory _setHashes:forKey:](self, "_setHashes:forKey:", v17[5], CFSTR("eventsWithoutTimestamp"));
  v28 = *MEMORY[0x1E0CB3358];
  v29[0] = &unk_1E7E0BED0;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v29, &v28, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37C0], "notificationWithName:object:userInfo:", CFSTR("new data"), self, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[SGSuggestHistory handleSyncedDataChanged:](self, "handleSyncedDataChanged:", v14);

  _Block_object_dispose(&v16, 8);
  _Block_object_dispose(&v22, 8);

}

- (void)rejectEventFromExternalDevice:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  _PASLock *lock;
  void *v10;
  void *v11;
  _QWORD v12[5];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;
  uint64_t v19;
  _QWORD v20[2];

  v20[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[SGSuggestHistory kvs](self, "kvs");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = +[SGSuggestHistory newTestingInstanceWithSharedKVS:](SGSuggestHistory, "newTestingInstanceWithSharedKVS:", v5);

  objc_msgSend(v4, "opaqueKey");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "rejectHashesForOpaqueKey:forMatching:", v7, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__7053;
  v17 = __Block_byref_object_dispose__7054;
  v18 = 0;
  lock = self->_lock;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __50__SGSuggestHistory_rejectEventFromExternalDevice___block_invoke;
  v12[3] = &unk_1E7DAA2E8;
  v12[4] = &v13;
  -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v12);
  objc_msgSend((id)v14[5], "addObjectsFromArray:", v8);
  -[SGSuggestHistory _setHashes:forKey:](self, "_setHashes:forKey:", v14[5], CFSTR("rejectedEvents"));
  v19 = *MEMORY[0x1E0CB3358];
  v20[0] = &unk_1E7E0BED0;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, &v19, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37C0], "notificationWithName:object:userInfo:", CFSTR("new data"), self, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[SGSuggestHistory handleSyncedDataChanged:](self, "handleSyncedDataChanged:", v11);

  _Block_object_dispose(&v13, 8);
}

- (BOOL)hasContactDetail:(id)a3 forContact:(id)a4
{
  id v6;
  id v7;
  _PASLock *lock;
  id v9;
  id v10;
  _QWORD v12[5];
  id v13;
  id v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  char v19;

  v6 = a3;
  v7 = a4;
  v16 = 0;
  v17 = &v16;
  v18 = 0x2020000000;
  v19 = 0;
  lock = self->_lock;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __48__SGSuggestHistory_hasContactDetail_forContact___block_invoke;
  v12[3] = &unk_1E7DAA670;
  v15 = &v16;
  v12[4] = self;
  v9 = v6;
  v13 = v9;
  v10 = v7;
  v14 = v10;
  -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v12);
  LOBYTE(v6) = *((_BYTE *)v17 + 24);

  _Block_object_dispose(&v16, 8);
  return (char)v6;
}

- (BOOL)hasContactDetailKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  _PASLock *lock;
  id v9;
  _QWORD v11[5];
  id v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  char v17;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "serialize");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SGSuggestHistory hashesForStrings:forMatching:](self, "hashesForStrings:forMatching:", v6, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = 0;
  v15 = &v14;
  v16 = 0x2020000000;
  v17 = 0;
  lock = self->_lock;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __40__SGSuggestHistory_hasContactDetailKey___block_invoke;
  v11[3] = &unk_1E7DAA620;
  v13 = &v14;
  v11[4] = self;
  v9 = v7;
  v12 = v9;
  -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v11);
  LOBYTE(self) = *((_BYTE *)v15 + 24) != 0;

  _Block_object_dispose(&v14, 8);
  return (char)self;
}

- (id)_hashesForConfirmedField:(id)a3 value:(id)a4 storageEvent:(id)a5 forMatching:(BOOL)a6
{
  _BOOL8 v6;
  objc_class *v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  _QWORD v24[4];

  v6 = a6;
  v24[3] = *MEMORY[0x1E0C80C00];
  v10 = (objc_class *)MEMORY[0x1E0C99DE8];
  v11 = a5;
  v12 = a4;
  v13 = a3;
  v14 = (void *)objc_msgSend([v10 alloc], "initWithCapacity:", 2);
  objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", v12, 1, 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = objc_retainAutorelease(v15);
  objc_msgSend(v16, "bytes");
  objc_msgSend(v16, "length");
  _PASBytesToHex();
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "opaqueKey");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  v24[0] = v18;
  v24[1] = v13;
  v24[2] = v17;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v24, 3);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  -[SGSuggestHistory salt](self, "salt");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  SGSha256BytesForStrings(v19, v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "addObject:", v21);

  -[SGSuggestHistory hashesByAddingCompatibilityHashesToHashes:forMatching:](self, "hashesByAddingCompatibilityHashesToHashes:forMatching:", v14, v6);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  return v22;
}

- (void)confirmFieldValues:(id)a3 forStorageEvent:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  uint64_t v14;
  void *v15;
  void *v16;
  _PASLock *lock;
  uint64_t v18;
  id v19;
  _PASLock *v20;
  id v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  void (*v25)(uint64_t, _QWORD *);
  void *v26;
  id v27;
  SGSuggestHistory *v28;
  _QWORD v29[4];
  id v30;
  SGSuggestHistory *v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 2 * objc_msgSend(v6, "count"));
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v9 = v6;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v33;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v33 != v12)
          objc_enumerationMutation(v9);
        v14 = *(_QWORD *)(*((_QWORD *)&v32 + 1) + 8 * i);
        objc_msgSend(v9, "objectForKeyedSubscript:", v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        -[SGSuggestHistory _hashesForConfirmedField:value:storageEvent:forMatching:](self, "_hashesForConfirmedField:value:storageEvent:forMatching:", v14, v15, v7, 0);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "addObjectsFromArray:", v16);

      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
    }
    while (v11);
  }

  lock = self->_lock;
  v18 = MEMORY[0x1E0C809B0];
  v29[0] = MEMORY[0x1E0C809B0];
  v29[1] = 3221225472;
  v29[2] = __55__SGSuggestHistory_confirmFieldValues_forStorageEvent___block_invoke;
  v29[3] = &unk_1E7DAA5F8;
  v19 = v8;
  v30 = v19;
  v31 = self;
  -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v29);
  v20 = self->_lock;
  v23 = v18;
  v24 = 3221225472;
  v25 = __55__SGSuggestHistory_confirmFieldValues_forStorageEvent___block_invoke_2;
  v26 = &unk_1E7DAA5F8;
  v27 = v19;
  v28 = self;
  v21 = v19;
  -[_PASLock runWithLockAcquired:](v20, "runWithLockAcquired:", &v23);
  objc_msgSend(v7, "recordId", v23, v24, v25, v26);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  +[SGDNotificationBroadcaster emitEventUpdated:](SGDNotificationBroadcaster, "emitEventUpdated:", v22);

}

- (BOOL)hasConfirmedField:(id)a3 value:(id)a4 forStorageEvent:(id)a5
{
  id v8;
  id v9;
  id v10;
  _PASLock *lock;
  uint64_t v12;
  id v13;
  id v14;
  id v15;
  BOOL v16;
  _PASLock *v17;
  _QWORD v19[5];
  id v20;
  id v21;
  id v22;
  uint64_t *v23;
  _QWORD v24[5];
  id v25;
  id v26;
  id v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  char v32;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v29 = 0;
  v30 = &v29;
  v31 = 0x2020000000;
  v32 = 0;
  lock = self->_lock;
  v12 = MEMORY[0x1E0C809B0];
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __60__SGSuggestHistory_hasConfirmedField_value_forStorageEvent___block_invoke;
  v24[3] = &unk_1E7DAA698;
  v28 = &v29;
  v24[4] = self;
  v13 = v8;
  v25 = v13;
  v14 = v9;
  v26 = v14;
  v15 = v10;
  v27 = v15;
  -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v24);
  if (*((_BYTE *)v30 + 24))
  {
    v16 = 1;
  }
  else
  {
    v17 = self->_lock;
    v19[0] = v12;
    v19[1] = 3221225472;
    v19[2] = __60__SGSuggestHistory_hasConfirmedField_value_forStorageEvent___block_invoke_2;
    v19[3] = &unk_1E7DAA698;
    v23 = &v29;
    v19[4] = self;
    v20 = v13;
    v21 = v14;
    v22 = v15;
    -[_PASLock runWithLockAcquired:](v17, "runWithLockAcquired:", v19);

    v16 = *((_BYTE *)v30 + 24) != 0;
  }

  _Block_object_dispose(&v29, 8);
  return v16;
}

- (void)pushEmptyHashesForTestingKey:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_opt_new();
  -[SGSuggestHistory _setHashes:forKey:](self, "_setHashes:forKey:", v5, v4);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_kvStoreIdentifier, 0);
  objc_storeStrong((id *)&self->_noCloudFakeBackingKVStore, 0);
  objc_storeStrong((id *)&self->_backingKVStore, 0);
  objc_storeStrong((id *)&self->_lock, 0);
}

void __60__SGSuggestHistory_hasConfirmedField_value_forStorageEvent___block_invoke(_QWORD *a1, void *a2)
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;
  uint64_t v8;
  id v9;

  v3 = (void *)a1[4];
  v4 = a1[5];
  v5 = a1[6];
  v6 = a1[7];
  v7 = a2;
  objc_msgSend(v3, "_hashesForConfirmedField:value:storageEvent:forMatching:", v4, v5, v6, 1);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  v8 = v7[7];

  *(_BYTE *)(*(_QWORD *)(a1[8] + 8) + 24) = objc_msgSend(v3, "_anyHash:inSet:", v9, v8);
}

void __60__SGSuggestHistory_hasConfirmedField_value_forStorageEvent___block_invoke_2(_QWORD *a1, void *a2)
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;
  uint64_t v8;
  id v9;

  v3 = (void *)a1[4];
  v4 = a1[5];
  v5 = a1[6];
  v6 = a1[7];
  v7 = a2;
  objc_msgSend(v3, "_hashesForConfirmedField:value:storageEvent:forMatching:", v4, v5, v6, 1);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  v8 = v7[8];

  *(_BYTE *)(*(_QWORD *)(a1[8] + 8) + 24) = objc_msgSend(v3, "_anyHash:inSet:", v9, v8);
}

void __55__SGSuggestHistory_confirmFieldValues_forStorageEvent___block_invoke(uint64_t a1, _QWORD *a2)
{
  void *v3;
  uint64_t v4;
  _QWORD *v5;

  v3 = (void *)a2[7];
  v4 = *(_QWORD *)(a1 + 32);
  v5 = a2;
  objc_msgSend(v3, "addObjectsFromArray:", v4);
  objc_msgSend(*(id *)(a1 + 40), "pushConfirmedEventFields:", v5);

}

void __55__SGSuggestHistory_confirmFieldValues_forStorageEvent___block_invoke_2(uint64_t a1, _QWORD *a2)
{
  void *v3;
  uint64_t v4;
  _QWORD *v5;

  v3 = (void *)a2[8];
  v4 = *(_QWORD *)(a1 + 32);
  v5 = a2;
  objc_msgSend(v3, "addObjectsFromArray:", v4);
  objc_msgSend(*(id *)(a1 + 40), "pushConfirmedEventWithoutTimestampFields:", v5);

}

uint64_t __40__SGSuggestHistory_hasContactDetailKey___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "_anyHash:inSet:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a2 + 72));
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = result;
  return result;
}

void __48__SGSuggestHistory_hasContactDetail_forContact___block_invoke(_QWORD *a1, void *a2)
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;
  uint64_t v7;
  id v8;

  v3 = (void *)a1[4];
  v4 = a1[5];
  v5 = a1[6];
  v6 = a2;
  objc_msgSend(v3, "hashesForContactDetail:fromContact:forMatching:", v4, v5, 1);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  v7 = v6[9];

  *(_BYTE *)(*(_QWORD *)(a1[7] + 8) + 24) = objc_msgSend(v3, "_anyHash:inSet:", v8, v7);
}

void __50__SGSuggestHistory_rejectEventFromExternalDevice___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  v3 = objc_msgSend(*(id *)(a2 + 24), "mutableCopy");
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

void __51__SGSuggestHistory_confirmEventFromExternalDevice___block_invoke(uint64_t a1, _QWORD *a2)
{
  void *v3;
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;

  v3 = (void *)a2[1];
  v4 = a2;
  v5 = objc_msgSend(v3, "mutableCopy");
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

  v8 = (void *)v4[2];
  v9 = objc_msgSend(v8, "mutableCopy");
  v10 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v11 = *(void **)(v10 + 40);
  *(_QWORD *)(v10 + 40) = v9;

}

uint64_t __46__SGSuggestHistory_addSuggestHistoryObserver___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a2 + 96), "addObject:", *(_QWORD *)(a1 + 32));
}

void __39__SGSuggestHistory_isRejectedReminder___block_invoke(_QWORD *a1, void *a2)
{
  void *v3;
  void *v4;
  _QWORD *v5;
  void *v6;
  uint64_t v7;
  id v8;

  v3 = (void *)a1[4];
  v4 = (void *)a1[5];
  v5 = a2;
  objc_msgSend(v4, "opaqueKey");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "rejectHashesForOpaqueKey:forMatching:", v8, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v5[5];

  *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = objc_msgSend(v3, "_anyHash:inSet:", v6, v7);
}

void __40__SGSuggestHistory_isConfirmedReminder___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  _QWORD *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;

  v3 = *(void **)(a1 + 32);
  v4 = *(void **)(a1 + 40);
  v5 = a2;
  objc_msgSend(v4, "opaqueKey");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "creationDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "timeIntervalSince1970");
  objc_msgSend(v3, "confirmHashesForRemindersOpaqueKey:withCreationTime:forMatching:", v9, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v5[4];

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = objc_msgSend(v3, "_anyHash:inSet:", v7, v8);
}

uint64_t __39__SGSuggestHistory_isValidNewReminder___block_invoke(uint64_t a1)
{
  uint64_t result;
  char v3;

  result = objc_msgSend(*(id *)(a1 + 32), "isConfirmedReminder:", *(_QWORD *)(a1 + 40));
  if ((result & 1) != 0)
  {
    v3 = 0;
  }
  else
  {
    result = objc_msgSend(*(id *)(a1 + 32), "isRejectedReminder:", *(_QWORD *)(a1 + 40));
    v3 = result ^ 1;
  }
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = v3;
  return result;
}

void __86__SGSuggestHistory_removeConfirmationHistoryForEntityWithOpaqueKey_creationTimestamp___block_invoke(uint64_t a1, void *a2)
{
  id *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  char v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  char v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  char v16;
  uint64_t v17;
  uint64_t j;
  void *v19;
  void *v20;
  char v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  char v25;
  uint64_t v26;
  uint64_t k;
  void *v28;
  void *v29;
  char v30;
  void *v31;
  void *v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  _BYTE v45[128];
  _BYTE v46[128];
  _BYTE v47[128];
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "rejectHashesForOpaqueKey:forMatching:", *(_QWORD *)(a1 + 40), 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = 0u;
  v42 = 0u;
  v43 = 0u;
  v44 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v41, v47, 16);
  if (v5)
  {
    v6 = v5;
    v7 = 0;
    v8 = *(_QWORD *)v42;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v42 != v8)
          objc_enumerationMutation(v4);
        v10 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * i);
        if (objc_msgSend(v3[3], "containsObject:", v10))
        {
          objc_msgSend(*(id *)(a1 + 32), "_canaryHash");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = objc_msgSend(v10, "isEqual:", v11);

          if ((v12 & 1) == 0)
          {
            objc_msgSend(v3[3], "removeObject:", v10);
            v7 = 1;
          }
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v41, v47, 16);
    }
    while (v6);
    if ((v7 & 1) != 0)
      objc_msgSend(*(id *)(a1 + 32), "pushRejectedEvents:", v3);
  }
  v32 = v4;
  objc_msgSend(*(id *)(a1 + 32), "confirmHashesForOpaqueKey:withCreationTime:forMatching:", *(_QWORD *)(a1 + 40), 1, *(double *)(a1 + 48));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v37, v46, 16);
  if (v14)
  {
    v15 = v14;
    v16 = 0;
    v17 = *(_QWORD *)v38;
    do
    {
      for (j = 0; j != v15; ++j)
      {
        if (*(_QWORD *)v38 != v17)
          objc_enumerationMutation(v13);
        v19 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * j);
        if (objc_msgSend(v3[1], "containsObject:", v19))
        {
          objc_msgSend(*(id *)(a1 + 32), "_canaryHash");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v21 = objc_msgSend(v19, "isEqual:", v20);

          if ((v21 & 1) == 0)
          {
            objc_msgSend(v3[1], "removeObject:", v19);
            v16 = 1;
          }
        }
      }
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v37, v46, 16);
    }
    while (v15);
    if ((v16 & 1) != 0)
      objc_msgSend(*(id *)(a1 + 32), "pushConfirmedEvents:", v3);
  }
  objc_msgSend(*(id *)(a1 + 32), "confirmHashesForOpaqueKeyWithoutTimestamp:forMatching:", *(_QWORD *)(a1 + 40), 1);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v33, v45, 16);
  if (v23)
  {
    v24 = v23;
    v31 = v13;
    v25 = 0;
    v26 = *(_QWORD *)v34;
    do
    {
      for (k = 0; k != v24; ++k)
      {
        if (*(_QWORD *)v34 != v26)
          objc_enumerationMutation(v22);
        v28 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * k);
        if (objc_msgSend(v3[2], "containsObject:", v28, v31))
        {
          objc_msgSend(*(id *)(a1 + 32), "_canaryHash");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          v30 = objc_msgSend(v28, "isEqual:", v29);

          if ((v30 & 1) == 0)
          {
            objc_msgSend(v3[2], "removeObject:", v28);
            v25 = 1;
          }
        }
      }
      v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v33, v45, 16);
    }
    while (v24);
    v13 = v31;
    if ((v25 & 1) != 0)
      objc_msgSend(*(id *)(a1 + 32), "pushConfirmedEventsWithoutTimestamp:", v3);
  }

}

void __36__SGSuggestHistory_isRejectedEvent___block_invoke(_QWORD *a1, void *a2)
{
  void *v3;
  void *v4;
  _QWORD *v5;
  void *v6;
  uint64_t v7;
  id v8;

  v3 = (void *)a1[4];
  v4 = (void *)a1[5];
  v5 = a2;
  objc_msgSend(v4, "opaqueKey");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "rejectHashesForOpaqueKey:forMatching:", v8, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v5[3];

  *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = objc_msgSend(v3, "_anyHash:inSet:", v6, v7);
}

void __37__SGSuggestHistory_isConfirmedEvent___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  _QWORD *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;

  v3 = *(void **)(a1 + 32);
  v4 = *(void **)(a1 + 40);
  v5 = a2;
  objc_msgSend(v4, "opaqueKey");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "creationDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "timeIntervalSince1970");
  objc_msgSend(v3, "confirmHashesForOpaqueKey:withCreationTime:forMatching:", v9, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v5[1];

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = objc_msgSend(v3, "_anyHash:inSet:", v7, v8);
}

void __53__SGSuggestHistory_isConfirmedEventWithoutTimeStamp___block_invoke(_QWORD *a1, void *a2)
{
  void *v3;
  void *v4;
  _QWORD *v5;
  void *v6;
  uint64_t v7;
  id v8;

  v3 = (void *)a1[4];
  v4 = (void *)a1[5];
  v5 = a2;
  objc_msgSend(v4, "opaqueKey");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "confirmHashesForOpaqueKeyWithoutTimestamp:forMatching:", v8, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v5[2];

  *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = objc_msgSend(v3, "_anyHash:inSet:", v6, v7);
}

void __39__SGSuggestHistory_isUpdatableContact___block_invoke(_QWORD *a1, void *a2)
{
  void *v3;
  uint64_t v4;
  _QWORD *v5;
  uint64_t v6;
  id v7;

  v3 = (void *)a1[4];
  v4 = a1[5];
  v5 = a2;
  objc_msgSend(v3, "hashesForContact:forMatching:", v4, 1);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v6 = v5[10];

  *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = objc_msgSend(v3, "_anyHash:inSet:", v7, v6) ^ 1;
}

uint64_t __42__SGSuggestHistory_isValidCancelledEvent___block_invoke(uint64_t a1)
{
  uint64_t result;
  char v3;

  result = objc_msgSend(*(id *)(a1 + 32), "isConfirmedEvent:", *(_QWORD *)(a1 + 40));
  if ((result & 1) != 0)
  {
    v3 = 0;
  }
  else
  {
    result = objc_msgSend(*(id *)(a1 + 32), "isRejectedEvent:", *(_QWORD *)(a1 + 40));
    v3 = result ^ 1;
  }
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = v3;
  return result;
}

uint64_t __36__SGSuggestHistory_isValidNewEvent___block_invoke(uint64_t a1)
{
  uint64_t result;
  char v3;

  result = objc_msgSend(*(id *)(a1 + 32), "isConfirmedEvent:", *(_QWORD *)(a1 + 40));
  if ((result & 1) != 0
    || (result = objc_msgSend(*(id *)(a1 + 32), "isConfirmedEventWithoutTimeStamp:", *(_QWORD *)(a1 + 40)),
        (result & 1) != 0))
  {
    v3 = 0;
  }
  else
  {
    result = objc_msgSend(*(id *)(a1 + 32), "isRejectedEvent:", *(_QWORD *)(a1 + 40));
    v3 = result ^ 1;
  }
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = v3;
  return result;
}

void __38__SGSuggestHistory_hasStorageContact___block_invoke(_QWORD *a1, void *a2)
{
  void *v3;
  uint64_t v4;
  _QWORD *v5;
  uint64_t v6;
  id v7;

  v3 = (void *)a1[4];
  v4 = a1[5];
  v5 = a2;
  objc_msgSend(v3, "hashesForStorageContact:forMatching:", v4, 1);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v6 = v5[6];

  *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = objc_msgSend(v3, "_anyHash:inSet:", v7, v6);
}

void __31__SGSuggestHistory_hasContact___block_invoke(_QWORD *a1, void *a2)
{
  void *v3;
  uint64_t v4;
  _QWORD *v5;
  uint64_t v6;
  id v7;

  v3 = (void *)a1[4];
  v4 = a1[5];
  v5 = a2;
  objc_msgSend(v3, "hashesForContact:forMatching:", v4, 1);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v6 = v5[6];

  *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = objc_msgSend(v3, "_anyHash:inSet:", v7, v6);
}

void __53__SGSuggestHistory_rejectReminderFromExternalDevice___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  v3 = objc_msgSend(*(id *)(a2 + 40), "mutableCopy");
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

void __54__SGSuggestHistory_confirmReminderFromExternalDevice___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  v3 = objc_msgSend(*(id *)(a2 + 32), "mutableCopy");
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

void __55__SGSuggestHistory_writeAndPushRejectedReminderHashes___block_invoke(uint64_t a1, _QWORD *a2)
{
  void *v3;
  uint64_t v4;
  _QWORD *v5;

  v3 = (void *)a2[5];
  v4 = *(_QWORD *)(a1 + 32);
  v5 = a2;
  objc_msgSend(v3, "addObjectsFromArray:", v4);
  objc_msgSend(*(id *)(a1 + 40), "pushRejectedReminders:", v5);

}

void __56__SGSuggestHistory_writeAndPushConfirmedReminderHashes___block_invoke(uint64_t a1, _QWORD *a2)
{
  void *v3;
  uint64_t v4;
  _QWORD *v5;

  v3 = (void *)a2[4];
  v4 = *(_QWORD *)(a1 + 32);
  v5 = a2;
  objc_msgSend(v3, "addObjectsFromArray:", v4);
  objc_msgSend(*(id *)(a1 + 40), "pushConfirmedReminders:", v5);

}

void __52__SGSuggestHistory_writeAndPushRejectedEventHashes___block_invoke(uint64_t a1, _QWORD *a2)
{
  void *v3;
  uint64_t v4;
  _QWORD *v5;

  v3 = (void *)a2[3];
  v4 = *(_QWORD *)(a1 + 32);
  v5 = a2;
  objc_msgSend(v3, "addObjectsFromArray:", v4);
  objc_msgSend(*(id *)(a1 + 40), "pushRejectedEvents:", v5);

}

void __69__SGSuggestHistory_writeAndPushConfirmedEventWithoutTimestampHashes___block_invoke(uint64_t a1, _QWORD *a2)
{
  void *v3;
  uint64_t v4;
  _QWORD *v5;

  v3 = (void *)a2[2];
  v4 = *(_QWORD *)(a1 + 32);
  v5 = a2;
  objc_msgSend(v3, "addObjectsFromArray:", v4);
  objc_msgSend(*(id *)(a1 + 40), "pushConfirmedEventsWithoutTimestamp:", v5);

}

void __53__SGSuggestHistory_writeAndPushConfirmedEventHashes___block_invoke(uint64_t a1, _QWORD *a2)
{
  void *v3;
  uint64_t v4;
  _QWORD *v5;

  v3 = (void *)a2[1];
  v4 = *(_QWORD *)(a1 + 32);
  v5 = a2;
  objc_msgSend(v3, "addObjectsFromArray:", v4);
  objc_msgSend(*(id *)(a1 + 40), "pushConfirmedEvents:", v5);

}

void __34__SGSuggestHistory_rejectContact___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a2 + 48);
  objc_msgSend(*(id *)(a1 + 32), "hashesForContact:forMatching:", *(_QWORD *)(a1 + 40), 0);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObjectsFromArray:", v3);

}

void __42__SGSuggestHistory_rejectRealtimeContact___block_invoke(uint64_t a1, void *a2)
{
  _QWORD *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  int v13;
  _DWORD v14[2];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "state") == 1)
  {
    v4 = (void *)v3[6];
    v5 = *(void **)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 32), "contact");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "hashesForContact:forMatching:", v6, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObjectsFromArray:", v7);

    objc_msgSend(*(id *)(a1 + 40), "pushContacts:", v3);
  }
  else if (objc_msgSend(*(id *)(a1 + 32), "state") == 2)
  {
    v8 = (void *)v3[10];
    v9 = *(void **)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 32), "contact");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "hashesForContact:forMatching:", v10, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObjectsFromArray:", v11);

    objc_msgSend(*(id *)(a1 + 40), "pushDontUpdate:", v3);
  }
  else
  {
    sgLogHandle();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      v13 = objc_msgSend(*(id *)(a1 + 32), "state");
      v14[0] = 67109120;
      v14[1] = v13;
      _os_log_error_impl(&dword_1C3607000, v12, OS_LOG_TYPE_ERROR, "Don't know how to deal with this realtime contact state (state = %i)", (uint8_t *)v14, 8u);
    }

  }
}

void __52__SGSuggestHistory_confirmOrRejectRecordForContact___block_invoke(uint64_t a1, _QWORD *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  _QWORD *v7;

  v3 = (void *)a2[6];
  v4 = *(void **)(a1 + 32);
  v5 = *(_QWORD *)(a1 + 40);
  v7 = a2;
  objc_msgSend(v4, "hashesForStorageContact:forMatching:", v5, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObjectsFromArray:", v6);

  objc_msgSend(*(id *)(a1 + 32), "pushContacts:", v7);
}

void __48__SGSuggestHistory_confirmOrRejectDetailHashes___block_invoke(uint64_t a1, _QWORD *a2)
{
  void *v3;
  uint64_t v4;
  _QWORD *v5;

  v3 = (void *)a2[9];
  v4 = *(_QWORD *)(a1 + 32);
  v5 = a2;
  objc_msgSend(v3, "addObjectsFromArray:", v4);
  objc_msgSend(*(id *)(a1 + 40), "pushStorageDetails:", v5);

}

void __44__SGSuggestHistory_handleSyncedDataChanged___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  void *v10;
  unint64_t v11;
  void *v12;
  unint64_t v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  NSObject *v19;
  NSObject *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  NSObject *v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  NSObject *v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  NSObject *v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  NSObject *v42;
  uint64_t v43;
  void *v44;
  NSObject *v45;
  uint64_t v46;
  void *v47;
  uint64_t v48;
  uint64_t v49;
  void *v50;
  NSObject *v51;
  uint64_t v52;
  uint64_t v53;
  void *v54;
  uint64_t v55;
  uint64_t v56;
  void *v57;
  NSObject *v58;
  uint64_t v59;
  uint64_t v60;
  void *v61;
  NSObject *v62;
  void *v63;
  NSObject *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  NSObject *v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  void *v73;
  void *v74;
  void *v75;
  uint8_t buf[4];
  uint64_t v77;
  __int16 v78;
  uint64_t v79;
  uint64_t v80;

  v80 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = (void *)*((_QWORD *)v3 + 13);
  *((_QWORD *)v3 + 13) = 0;

  v5 = (void *)*((_QWORD *)v3 + 14);
  *((_QWORD *)v3 + 14) = 0;

  v6 = objc_msgSend(*((id *)v3 + 12), "copy");
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v6;

  switch(*(_QWORD *)(a1 + 88))
  {
    case 0:
      objc_msgSend(*(id *)(a1 + 32), "loadResetInfo");
      v9 = objc_claimAutoreleasedReturnValue();
      -[NSObject objectAtIndexedSubscript:](v9, "objectAtIndexedSubscript:", 0);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "unsignedLongValue");

      objc_msgSend(*((id *)v3 + 11), "objectAtIndexedSubscript:", 0);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "unsignedLongValue");

      if (v11 <= v13)
        goto LABEL_7;
      -[NSObject objectAtIndexedSubscript:](v9, "objectAtIndexedSubscript:", 1);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "doubleValue");
      v16 = v15;

      objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
      v18 = vabdd_f64(v17, v16);
      sgLogHandle();
      v19 = objc_claimAutoreleasedReturnValue();
      v20 = v19;
      if (v18 >= 900.0)
      {
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)buf = 0;
          _os_log_debug_impl(&dword_1C3607000, v20, OS_LOG_TYPE_DEBUG, "Suppressing KVS history reset because time window has expired.", buf, 2u);
        }

        objc_storeStrong((id *)v3 + 11, v9);
LABEL_7:

        objc_msgSend(*(id *)(a1 + 32), "setForKey:", CFSTR("events"));
        v9 = objc_claimAutoreleasedReturnValue();
        if ((-[NSObject isEqualToSet:](v9, "isEqualToSet:", *((_QWORD *)v3 + 1)) & 1) == 0)
        {
          v21 = -[NSObject mutableCopy](v9, "mutableCopy");
          v22 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
          v23 = *(void **)(v22 + 40);
          *(_QWORD *)(v22 + 40) = v21;

          objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "minusSet:", *((_QWORD *)v3 + 1));
          sgEventsLogHandle();
          v24 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
          {
            v25 = -[NSObject count](v9, "count");
            v26 = objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "count");
            *(_DWORD *)buf = 134349312;
            v77 = v25;
            v78 = 2050;
            v79 = v26;
            _os_log_impl(&dword_1C3607000, v24, OS_LOG_TYPE_DEFAULT, "SGSuggestHistory - Receive updated confirmed event hashes (%{public}lu total, %{public}lu new)", buf, 0x16u);
          }

          objc_msgSend(*((id *)v3 + 1), "unionSet:", v9);
          objc_msgSend(*(id *)(a1 + 32), "pushConfirmedEvents:", v3);
        }
        objc_msgSend(*(id *)(a1 + 32), "setForKey:", CFSTR("eventsWithoutTimestamp"));
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v27, "isEqualToSet:", *((_QWORD *)v3 + 2)) & 1) == 0)
        {
          v28 = objc_msgSend(v27, "mutableCopy");
          v29 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
          v30 = *(void **)(v29 + 40);
          *(_QWORD *)(v29 + 40) = v28;

          objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "minusSet:", *((_QWORD *)v3 + 2));
          sgEventsLogHandle();
          v31 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
          {
            v32 = objc_msgSend(v27, "count");
            v33 = objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "count");
            *(_DWORD *)buf = 134349312;
            v77 = v32;
            v78 = 2050;
            v79 = v33;
            _os_log_impl(&dword_1C3607000, v31, OS_LOG_TYPE_DEFAULT, "SGSuggestHistory - Receive updated confirmed event hashes (%{public}lu total, %{public}lu new)", buf, 0x16u);
          }

          objc_msgSend(*((id *)v3 + 2), "unionSet:", v27);
          objc_msgSend(*(id *)(a1 + 32), "pushConfirmedEventsWithoutTimestamp:", v3);
        }
        objc_msgSend(*(id *)(a1 + 32), "setForKey:", CFSTR("rejectedEvents"));
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v34, "isEqualToSet:", *((_QWORD *)v3 + 3)) & 1) == 0)
        {
          v35 = objc_msgSend(v34, "mutableCopy");
          v36 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
          v37 = *(void **)(v36 + 40);
          *(_QWORD *)(v36 + 40) = v35;

          objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "minusSet:", *((_QWORD *)v3 + 3));
          sgEventsLogHandle();
          v38 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
          {
            v39 = objc_msgSend(v34, "count");
            v40 = objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "count");
            *(_DWORD *)buf = 134349312;
            v77 = v39;
            v78 = 2050;
            v79 = v40;
            _os_log_impl(&dword_1C3607000, v38, OS_LOG_TYPE_DEFAULT, "SGSuggestHistory - Receive updated rejected event hashes (%{public}lu total, %{public}lu new)", buf, 0x16u);
          }

          objc_msgSend(*((id *)v3 + 3), "unionSet:", v34);
          objc_msgSend(*(id *)(a1 + 32), "pushRejectedEvents:", v3);
        }
        objc_msgSend(*(id *)(a1 + 32), "setForKey:", CFSTR("confirmedEventFields"));
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v41, "isEqualToSet:", *((_QWORD *)v3 + 7)) & 1) == 0)
        {
          sgEventsLogHandle();
          v42 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
          {
            v43 = objc_msgSend(v41, "count");
            *(_DWORD *)buf = 134349056;
            v77 = v43;
            _os_log_impl(&dword_1C3607000, v42, OS_LOG_TYPE_DEFAULT, "SGSuggestHistory - Receive updated confirmed event field hashes (%{public}lu total)", buf, 0xCu);
          }

          objc_msgSend(*((id *)v3 + 7), "unionSet:", v41);
          objc_msgSend(*(id *)(a1 + 32), "pushConfirmedEventFields:", v3);
        }
        objc_msgSend(*(id *)(a1 + 32), "setForKey:", CFSTR("confirmedEventWithoutTimestampFields"));
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v44, "isEqualToSet:", *((_QWORD *)v3 + 8)) & 1) == 0)
        {
          sgEventsLogHandle();
          v45 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
          {
            v46 = objc_msgSend(v44, "count");
            *(_DWORD *)buf = 134349056;
            v77 = v46;
            _os_log_impl(&dword_1C3607000, v45, OS_LOG_TYPE_DEFAULT, "SGSuggestHistory - Receive updated confirmed event field without timestamp hashes (%{public}lu total)", buf, 0xCu);
          }

          objc_msgSend(*((id *)v3 + 8), "unionSet:", v44);
          objc_msgSend(*(id *)(a1 + 32), "pushConfirmedEventWithoutTimestampFields:", v3);
        }
        objc_msgSend(*(id *)(a1 + 32), "setForKey:", CFSTR("reminders"));
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v47, "isEqualToSet:", *((_QWORD *)v3 + 4)) & 1) == 0)
        {
          v48 = objc_msgSend(v47, "mutableCopy");
          v49 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
          v50 = *(void **)(v49 + 40);
          *(_QWORD *)(v49 + 40) = v48;

          objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), "minusSet:", *((_QWORD *)v3 + 4));
          sgRemindersLogHandle();
          v51 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
          {
            v52 = objc_msgSend(v47, "count");
            v53 = objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), "count");
            *(_DWORD *)buf = 134349312;
            v77 = v52;
            v78 = 2050;
            v79 = v53;
            _os_log_impl(&dword_1C3607000, v51, OS_LOG_TYPE_DEFAULT, "SGSuggestHistory - Receive updated confirmed reminder hashes (%{public}lu total, %{public}lu new)", buf, 0x16u);
          }

          objc_msgSend(*((id *)v3 + 4), "unionSet:", v47);
          objc_msgSend(*(id *)(a1 + 32), "pushConfirmedReminders:", v3);
        }
        objc_msgSend(*(id *)(a1 + 32), "setForKey:", CFSTR("rejectedReminders"));
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        v75 = v54;
        if ((objc_msgSend(v54, "isEqualToSet:", *((_QWORD *)v3 + 5)) & 1) == 0)
        {
          v55 = objc_msgSend(v54, "mutableCopy");
          v56 = *(_QWORD *)(*(_QWORD *)(a1 + 80) + 8);
          v57 = *(void **)(v56 + 40);
          *(_QWORD *)(v56 + 40) = v55;

          objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40), "minusSet:", *((_QWORD *)v3 + 5));
          sgRemindersLogHandle();
          v58 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v58, OS_LOG_TYPE_DEFAULT))
          {
            v59 = objc_msgSend(v54, "count");
            v60 = objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40), "count");
            *(_DWORD *)buf = 134349312;
            v77 = v59;
            v54 = v75;
            v78 = 2048;
            v79 = v60;
            _os_log_impl(&dword_1C3607000, v58, OS_LOG_TYPE_DEFAULT, "SGSuggestHistory - Receive updated rejected reminder hashes (%{public}lu total %lu new)", buf, 0x16u);
          }

          objc_msgSend(*((id *)v3 + 5), "unionSet:", v54);
          objc_msgSend(*(id *)(a1 + 32), "pushRejectedReminders:", v3);
        }
        v74 = v47;
        objc_msgSend(*(id *)(a1 + 32), "setForKey:", CFSTR("newContacts"));
        v61 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v61, "isEqualToSet:", *((_QWORD *)v3 + 6)) & 1) == 0)
        {
          sgLogHandle();
          v62 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v62, OS_LOG_TYPE_DEBUG))
          {
            v70 = objc_msgSend(v61, "count");
            *(_DWORD *)buf = 134217984;
            v77 = v70;
            _os_log_debug_impl(&dword_1C3607000, v62, OS_LOG_TYPE_DEBUG, "Receive updated contact hashes (%lu total)", buf, 0xCu);
          }

          objc_msgSend(*((id *)v3 + 6), "unionSet:", v61);
          objc_msgSend(*(id *)(a1 + 32), "pushContacts:", v3);
        }
        objc_msgSend(*(id *)(a1 + 32), "setForKey:", CFSTR("storageDetails"));
        v63 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v63, "isEqualToSet:", *((_QWORD *)v3 + 9)) & 1) == 0)
        {
          sgLogHandle();
          v64 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v64, OS_LOG_TYPE_DEBUG))
          {
            v71 = objc_msgSend(v63, "count");
            *(_DWORD *)buf = 134217984;
            v77 = v71;
            _os_log_debug_impl(&dword_1C3607000, v64, OS_LOG_TYPE_DEBUG, "Receive updated storage detail hashes (%lu total)", buf, 0xCu);
          }

          objc_msgSend(*((id *)v3 + 9), "unionSet:", v63);
          objc_msgSend(*(id *)(a1 + 32), "pushStorageDetails:", v3);
        }
        objc_msgSend(*(id *)(a1 + 32), "setForKey:", CFSTR("dontUpdate"));
        v65 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v65, "isEqualToSet:", *((_QWORD *)v3 + 10)) & 1) == 0)
        {
          v73 = v44;
          v66 = v41;
          v67 = v34;
          v68 = v27;
          sgLogHandle();
          v69 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v69, OS_LOG_TYPE_DEBUG))
          {
            v72 = objc_msgSend(v65, "count");
            *(_DWORD *)buf = 134217984;
            v77 = v72;
            _os_log_debug_impl(&dword_1C3607000, v69, OS_LOG_TYPE_DEBUG, "Receive updated don't-update hashes (%lu total)", buf, 0xCu);
          }

          objc_msgSend(*((id *)v3 + 10), "unionSet:", v65);
          objc_msgSend(*(id *)(a1 + 32), "pushDontUpdate:", v3);
          v27 = v68;
          v34 = v67;
          v41 = v66;
          v44 = v73;
        }

        goto LABEL_58;
      }
      if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 134217984;
        v77 = 0x408C200000000000;
        _os_log_impl(&dword_1C3607000, v20, OS_LOG_TYPE_INFO, "Resetting history due to a KVS reset event within %g sec time window.", buf, 0xCu);
      }

      objc_msgSend(*(id *)(a1 + 32), "_setInternalStateAccordingToKVS:", v3);
      goto LABEL_58;
    case 1:
      sgLogHandle();
      v9 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
        goto LABEL_58;
      *(_WORD *)buf = 0;
      goto LABEL_54;
    case 2:
      sgLogHandle();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1C3607000, v9, OS_LOG_TYPE_DEFAULT, "Exceeded iCloud key value storage quota. Can't store any more acted on suggestions.", buf, 2u);
      }
      goto LABEL_58;
    case 3:
      objc_msgSend(*(id *)(a1 + 32), "_setInternalStateAccordingToKVS:", v3);
      sgLogHandle();
      v9 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
        goto LABEL_58;
      *(_WORD *)buf = 0;
LABEL_54:
      _os_log_debug_impl(&dword_1C3607000, v9, OS_LOG_TYPE_DEBUG, "KVS account change", buf, 2u);
LABEL_58:

LABEL_59:
      return;
    default:
      goto LABEL_59;
  }
}

void __32__SGSuggestHistory_resetNoFlush__block_invoke(uint64_t a1, _QWORD *a2)
{
  void *v3;
  _QWORD *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  _QWORD v33[3];

  v33[2] = *MEMORY[0x1E0C80C00];
  v3 = (void *)a2[13];
  a2[13] = 0;
  v4 = a2;

  v5 = (void *)v4[14];
  v4[14] = 0;

  v6 = objc_opt_new();
  v7 = (void *)v4[6];
  v4[6] = v6;

  v8 = objc_opt_new();
  v9 = (void *)v4[9];
  v4[9] = v8;

  v10 = objc_opt_new();
  v11 = (void *)v4[1];
  v4[1] = v10;

  v12 = objc_opt_new();
  v13 = (void *)v4[2];
  v4[2] = v12;

  v14 = objc_opt_new();
  v15 = (void *)v4[3];
  v4[3] = v14;

  v16 = objc_opt_new();
  v17 = (void *)v4[7];
  v4[7] = v16;

  v18 = objc_opt_new();
  v19 = (void *)v4[8];
  v4[8] = v18;

  v20 = objc_opt_new();
  v21 = (void *)v4[4];
  v4[4] = v20;

  v22 = objc_opt_new();
  v23 = (void *)v4[5];
  v4[5] = v22;

  v24 = objc_opt_new();
  v25 = (void *)v4[10];
  v4[10] = v24;

  v26 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend((id)v4[11], "objectAtIndexedSubscript:", 0);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "numberWithUnsignedLong:", objc_msgSend(v27, "unsignedLongValue") + 1);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v33[0] = v28;
  v29 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
  objc_msgSend(v29, "numberWithDouble:");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v33[1] = v30;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v33, 2);
  v31 = objc_claimAutoreleasedReturnValue();
  v32 = (void *)v4[11];
  v4[11] = v31;

  objc_msgSend(*(id *)(a1 + 32), "pushAll:", v4);
}

id __49__SGSuggestHistory_hashesForStrings_forMatching___block_invoke(uint64_t a1, void *a2)
{
  return SGSha256BytesForString(a2, *(void **)(a1 + 32));
}

id __54__SGSuggestHistory_legacyIOS13HashesForClassicHashes___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  const void *v5;
  id v6;
  id v7;
  void *v8;
  NSObject *v10;
  uint8_t v11[16];

  v3 = a2;
  v4 = objc_msgSend(v3, "length");
  if (v4 == objc_msgSend(*(id *)(a1 + 32), "length") + 32
    && (v5 = (const void *)objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 32)), "bytes"),
        v6 = objc_retainAutorelease(v3),
        !memcmp(v5, (const void *)objc_msgSend(v6, "bytes"), objc_msgSend(*(id *)(a1 + 32), "length"))))
  {
    sgLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)v11 = 0;
      _os_log_fault_impl(&dword_1C3607000, v10, OS_LOG_TYPE_FAULT, "SGCK legacyIOS13HashesForClassicHashes was passed a hash that is already a ios13 hash", v11, 2u);
    }

    if (_PASEvaluateLogFaultAndProbCrashCriteria())
      abort();
    v7 = v6;
  }
  else
  {
    v7 = (id)objc_msgSend(*(id *)(a1 + 32), "mutableCopy");
    SGSha256HMACData(v3, *(id *)(a1 + 40));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "appendData:", v8);

  }
  return v7;
}

void __54__SGSuggestHistory_legacyIOS13HashesForClassicHashes___block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;

  v0 = (void *)MEMORY[0x1C3BD4F6C]();
  objc_msgSend(CFSTR("v2_"), "dataUsingEncoding:", 4);
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)legacyIOS13HashesForClassicHashes___pasExprOnceResult;
  legacyIOS13HashesForClassicHashes___pasExprOnceResult = v1;

  objc_autoreleasePoolPop(v0);
}

void __31__SGSuggestHistory__canaryHash__block_invoke()
{
  void *v0;
  id v1;
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;

  v0 = (void *)MEMORY[0x1C3BD4F6C]();
  v1 = objc_alloc(MEMORY[0x1E0CB3940]);
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "UUIDString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v1, "initWithFormat:", CFSTR("canary_%@"), v3);
  objc_msgSend(v4, "dataUsingEncoding:", 4);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)_canaryHash__pasExprOnceResult;
  _canaryHash__pasExprOnceResult = v5;

  objc_autoreleasePoolPop(v0);
}

uint64_t __50__SGSuggestHistory_setInternalStateAccordingToKVS__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_setInternalStateAccordingToKVS:", a2);
}

void __38__SGSuggestHistory__setHashes_forKey___block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  uint64_t v3;
  void *v4;

  v0 = (void *)MEMORY[0x1C3BD4F6C]();
  v1 = (void *)MEMORY[0x1E0CB36F8];
  v2 = (void *)objc_opt_new();
  objc_msgSend(v1, "archivedDataWithRootObject:requiringSecureCoding:error:", v2, 1, 0);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)_setHashes_forKey___pasExprOnceResult;
  _setHashes_forKey___pasExprOnceResult = v3;

  objc_autoreleasePoolPop(v0);
}

void __49__SGSuggestHistory__tellObserversHashesDidChange__block_invoke(uint64_t a1, uint64_t a2)
{
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_msgSend(*(id *)(a2 + 96), "copy");
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v3 = v2;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v9;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v9 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * v7++), "hashesDidChange", (_QWORD)v8);
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v5);
  }

}

void __31__SGSuggestHistory_description__block_invoke(uint64_t a1, void *a2)
{
  objc_class *v2;
  id *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  id v17;

  v2 = (objc_class *)MEMORY[0x1E0CB3940];
  v3 = a2;
  v17 = [v2 alloc];
  v16 = objc_msgSend(v3[1], "count");
  v4 = objc_msgSend(v3[2], "count");
  v5 = objc_msgSend(v3[3], "count");
  v6 = objc_msgSend(v3[4], "count");
  v7 = objc_msgSend(v3[5], "count");
  v8 = objc_msgSend(v3[7], "count");
  v9 = objc_msgSend(v3[8], "count");
  v10 = objc_msgSend(v3[6], "count");
  v11 = objc_msgSend(v3[9], "count");
  v12 = v3[10];

  v13 = objc_msgSend(v17, "initWithFormat:", CFSTR("Suggest history with %d confirmed event hashes, %d confirmed event without timestamp hashes, %d rejected event hashes, %d confirmed reminder hashes, %d rejected reminder hashes, %d confirmed event field hashes, %d confirmed event without timestamp field hashes, %d contact hashes, %d storage detail hashes, and %d no-update hashes."), v16, v4, v5, v6, v7, v8, v9, v10, v11, objc_msgSend(v12, "count"));
  v14 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v15 = *(void **)(v14 + 40);
  *(_QWORD *)(v14 + 40) = v13;

}

void __37__SGSuggestHistory_mutableSetForKey___block_invoke()
{
  void *v0;
  void *v1;
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;

  v0 = (void *)MEMORY[0x1C3BD4F6C]();
  v1 = (void *)MEMORY[0x1C3BD4F6C]();
  v2 = objc_alloc(MEMORY[0x1E0C99E60]);
  v3 = objc_opt_class();
  v4 = objc_opt_class();
  v5 = objc_msgSend(v2, "initWithObjects:", v3, v4, objc_opt_class(), 0);
  objc_autoreleasePoolPop(v1);
  v6 = (void *)mutableSetForKey___pasExprOnceResult;
  mutableSetForKey___pasExprOnceResult = v5;

  objc_autoreleasePoolPop(v0);
}

void __39__SGSuggestHistory_legacyManateeSecret__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  _QWORD *v7;

  v7 = a2;
  v3 = (void *)v7[14];
  if (!v3)
  {
    objc_msgSend(*(id *)(a1 + 32), "kvs");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dataForKey:", CFSTR("SGSaltManatee"));
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = (void *)v7[14];
    v7[14] = v5;

    v3 = (void *)v7[14];
  }
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), v3);

}

void __24__SGSuggestHistory_salt__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  _QWORD *v11;

  v11 = a2;
  v3 = (void *)v11[13];
  if (!v3)
  {
    objc_msgSend(*(id *)(a1 + 32), "kvs");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dataForKey:", CFSTR("SGSalt"));
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = (void *)v11[13];
    v11[13] = v5;

    v3 = (void *)v11[13];
    if (!v3)
    {
      SGRandomDataOfLength(0x20uLL);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "copy");
      v9 = (void *)v11[13];
      v11[13] = v8;

      objc_msgSend(*(id *)(a1 + 32), "kvs");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setData:forKey:", v11[13], CFSTR("SGSalt"));

      v3 = (void *)v11[13];
    }
  }
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), v3);

}

void __50__SGSuggestHistory_migrateFromKVS_withCompletion___block_invoke(uint64_t a1, uint64_t a2)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = *(_BYTE *)(a2 + 128);
  *(_BYTE *)(a2 + 128) = 1;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(a2 + 136));
}

uint64_t __50__SGSuggestHistory_migrateFromKVS_withCompletion___block_invoke_77(uint64_t a1, int a2)
{
  NSObject *v4;
  const __CFString *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  NSObject *v13;
  const __CFString *v14;
  _QWORD v16[6];
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  uint8_t v21[128];
  uint8_t buf[4];
  const __CFString *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  if (a2)
  {
    sgLogHandle();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5 = *(const __CFString **)(a1 + 32);
      *(_DWORD *)buf = 138412290;
      v23 = v5;
      _os_log_impl(&dword_1C3607000, v4, OS_LOG_TYPE_DEFAULT, "SGSuggestHistory: migrateFromKVS succeeded, deleting keys from fromKVS: %@", buf, 0xCu);
    }

    v19 = 0u;
    v20 = 0u;
    v17 = 0u;
    v18 = 0u;
    v6 = *(id *)(a1 + 32);
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v18;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v18 != v9)
            objc_enumerationMutation(v6);
          objc_msgSend(*(id *)(a1 + 40), "setData:forKey:", 0, *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * v10++));
        }
        while (v8 != v10);
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      }
      while (v8);
    }

  }
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __50__SGSuggestHistory_migrateFromKVS_withCompletion___block_invoke_78;
  v16[3] = &unk_1E7DAA3B0;
  v11 = *(_QWORD *)(a1 + 72);
  v12 = *(void **)(a1 + 48);
  v16[4] = *(_QWORD *)(a1 + 56);
  v16[5] = v11;
  objc_msgSend(v12, "runWithLockAcquired:", v16);
  sgLogHandle();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    v14 = CFSTR("failed");
    if (a2)
      v14 = CFSTR("succeeded");
    *(_DWORD *)buf = 138412290;
    v23 = v14;
    _os_log_impl(&dword_1C3607000, v13, OS_LOG_TYPE_DEFAULT, "SGSuggestHistory: migrateFromKVS %@, calling completion block...", buf, 0xCu);
  }

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
}

void __50__SGSuggestHistory_migrateFromKVS_withCompletion___block_invoke_89(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  sgLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v6 = 138412290;
      v7 = v3;
      _os_log_error_impl(&dword_1C3607000, v5, OS_LOG_TYPE_ERROR, "SGSuggestHistory: migrateFromKVS error syncing fromKVS (will still proceed with migration, this is a best-effort thing): %@", (uint8_t *)&v6, 0xCu);
    }

    objc_msgSend(*(id *)(a1 + 32), "fail:", v3);
  }
  else
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v6) = 0;
      _os_log_impl(&dword_1C3607000, v5, OS_LOG_TYPE_DEFAULT, "SGSuggestHistory: migrateFromKVS successfully synced fromKVS", (uint8_t *)&v6, 2u);
    }

    objc_msgSend(*(id *)(a1 + 32), "succeed:", MEMORY[0x1E0C9AAB0]);
  }

}

void __50__SGSuggestHistory_migrateFromKVS_withCompletion___block_invoke_92(id *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;

  v5 = a2;
  v6 = a3;
  v7 = a1[4];
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __50__SGSuggestHistory_migrateFromKVS_withCompletion___block_invoke_2;
  v9[3] = &unk_1E7DAA468;
  objc_copyWeak(&v16, a1 + 9);
  v15 = a1[8];
  v10 = a1[5];
  v11 = a1[6];
  v12 = a1[4];
  v8 = v5;
  v13 = v8;
  v14 = a1[7];
  objc_msgSend(v7, "synchronizeWithCompletionHandler:", v9);

  objc_destroyWeak(&v16);
}

void __50__SGSuggestHistory_migrateFromKVS_withCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  NSObject *v6;
  void *v7;
  _QWORD v8[4];
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  uint8_t buf[4];
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 80));
  v5 = WeakRetained;
  if (WeakRetained && (objc_msgSend(WeakRetained, "needsMigration") & 1) != 0)
  {
    if (!v3)
    {
      v8[0] = MEMORY[0x1E0C809B0];
      v8[1] = 3221225472;
      v8[2] = __50__SGSuggestHistory_migrateFromKVS_withCompletion___block_invoke_93;
      v8[3] = &unk_1E7DAA440;
      v7 = *(void **)(a1 + 32);
      v9 = *(id *)(a1 + 40);
      v10 = *(id *)(a1 + 48);
      v13 = *(id *)(a1 + 72);
      v11 = *(id *)(a1 + 56);
      v12 = *(id *)(a1 + 64);
      objc_msgSend(v7, "wait:", v8);

      goto LABEL_9;
    }
    sgLogHandle();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v15 = v3;
      _os_log_error_impl(&dword_1C3607000, v6, OS_LOG_TYPE_ERROR, "SGSuggestHistory: migrateFromKVS bailing due to error syncing dest KVS: %@", buf, 0xCu);
    }
  }
  else
  {
    sgLogHandle();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1C3607000, v6, OS_LOG_TYPE_DEFAULT, "SGSuggestHistory: migrateFromKVS bailing, migration no longer needed after attempting to sync dest KVS", buf, 2u);
    }
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 72) + 16))();
LABEL_9:

}

void __50__SGSuggestHistory_migrateFromKVS_withCompletion___block_invoke_93(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  const char *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  char v17;
  void *v18;
  NSObject *v19;
  void *v20;
  const char *v21;
  NSObject *v22;
  uint32_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  uint64_t v34;
  void *v35;
  NSObject *v36;
  void *v37;
  void *v38;
  void *v39;
  id v40;
  uint64_t v41;
  void *v42;
  void *v43;
  uint64_t v44;
  uint64_t v45;
  NSObject *v46;
  _BOOL4 v47;
  NSObject *v48;
  NSObject *v49;
  NSObject *v50;
  NSObject *v51;
  uint64_t v52;
  void *v53;
  id v54;
  id v55;
  uint64_t v56;
  uint64_t v57;
  NSObject *log;
  uint64_t v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  uint8_t buf[4];
  void *v65;
  __int16 v66;
  uint64_t v67;
  __int16 v68;
  void *v69;
  _BYTE v70[128];
  uint64_t v71;

  v71 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  objc_msgSend(*(id *)(a1 + 32), "dataForKey:", CFSTR("SGSalt"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "dataForKey:", CFSTR("SGSalt"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v56 = a1;
  if (v8)
  {
    objc_msgSend(*(id *)(a1 + 40), "dataForKey:", CFSTR("SGSalt"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v7, "isEqual:", v9);

    if ((v10 & 1) == 0)
    {
      sgLogHandle();
      log = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(*(id *)(v56 + 40), "dataForKey:", CFSTR("SGSalt"));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138478083;
        v65 = v11;
        v66 = 2113;
        v67 = (uint64_t)v7;
        v12 = "SGSuggestHistory: bailing with success because new (%{private}@) and old (%{private}@) kvs have different salts";
LABEL_13:
        _os_log_error_impl(&dword_1C3607000, log, OS_LOG_TYPE_ERROR, v12, buf, 0x16u);

        goto LABEL_57;
      }
      goto LABEL_57;
    }
  }
  else if (v7)
  {
    sgLogHandle();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138477827;
      v65 = v7;
      _os_log_impl(&dword_1C3607000, v13, OS_LOG_TYPE_DEFAULT, "SGSuggestHistory: migrateFromKVS copying salt %{private}@ to new kvs", buf, 0xCu);
    }

    objc_msgSend(*(id *)(a1 + 40), "setData:forKey:", v7, CFSTR("SGSalt"));
  }
  objc_msgSend(*(id *)(v56 + 40), "dataForKey:", CFSTR("SGSaltManatee"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = *(void **)(v56 + 48);
  if (!v14)
  {
    if (v15)
    {
      objc_msgSend(*(id *)(v56 + 40), "setData:forKey:", *(_QWORD *)(v56 + 48), CFSTR("SGSaltManatee"));
      sgLogHandle();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        v20 = *(void **)(v56 + 48);
        *(_DWORD *)buf = 138477827;
        v65 = v20;
        v21 = "SGSuggestHistory: migrateFromKVS copying legacy manatee salt %{private}@";
        v22 = v19;
        v23 = 12;
LABEL_19:
        _os_log_impl(&dword_1C3607000, v22, OS_LOG_TYPE_DEFAULT, v21, buf, v23);
      }
    }
    else
    {
      sgLogHandle();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        v21 = "SGSuggestHistory: migrateFromKVS not copying legacy manatee salt because no legacy manatee salt has been generated";
        v22 = v19;
        v23 = 2;
        goto LABEL_19;
      }
    }

LABEL_21:
    v62 = 0u;
    v63 = 0u;
    v60 = 0u;
    v61 = 0u;
    log = *(id *)(v56 + 56);
    v24 = -[NSObject countByEnumeratingWithState:objects:count:](log, "countByEnumeratingWithState:objects:count:", &v60, v70, 16);
    if (v24)
    {
      v25 = v24;
      v53 = v7;
      v54 = v6;
      v55 = v5;
      v59 = *(_QWORD *)v61;
      v26 = v56;
      do
      {
        v27 = 0;
        v57 = v25;
        do
        {
          if (*(_QWORD *)v61 != v59)
            objc_enumerationMutation(log);
          v28 = *(void **)(*((_QWORD *)&v60 + 1) + 8 * v27);
          v29 = (void *)MEMORY[0x1C3BD4F6C]();
          objc_msgSend(*(id *)(v26 + 32), "dataForKey:", v28);
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          if (v30)
          {
            v31 = (void *)MEMORY[0x1E0CB3710];
            v32 = (void *)MEMORY[0x1C3BD4F6C]();
            v33 = objc_alloc(MEMORY[0x1E0C99E60]);
            v34 = objc_opt_class();
            v35 = (void *)objc_msgSend(v33, "initWithObjects:", v34, objc_opt_class(), 0);
            objc_autoreleasePoolPop(v32);
            objc_msgSend(v31, "unarchivedObjectOfClasses:fromData:error:", v35, v30, 0);
            v36 = objc_claimAutoreleasedReturnValue();

            if (v36)
            {
              objc_msgSend(*(id *)(v26 + 40), "dataForKey:", v28);
              v37 = (void *)objc_claimAutoreleasedReturnValue();
              if (v37)
              {
                v38 = (void *)MEMORY[0x1E0CB3710];
                v39 = (void *)MEMORY[0x1C3BD4F6C]();
                v40 = objc_alloc(MEMORY[0x1E0C99E60]);
                v41 = objc_opt_class();
                v42 = (void *)objc_msgSend(v40, "initWithObjects:", v41, objc_opt_class(), 0);
                objc_autoreleasePoolPop(v39);
                objc_msgSend(v38, "unarchivedObjectOfClasses:fromData:error:", v42, v37, 0);
                v43 = (void *)objc_claimAutoreleasedReturnValue();

                v44 = objc_msgSend(v43, "count");
                objc_msgSend(v43, "unionSet:", v36);
                v45 = objc_msgSend(v43, "count");
                sgLogHandle();
                v46 = objc_claimAutoreleasedReturnValue();
                v47 = os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT);
                if (v45 == v44)
                {
                  if (v47)
                  {
                    *(_DWORD *)buf = 138543362;
                    v65 = v28;
                    _os_log_impl(&dword_1C3607000, v46, OS_LOG_TYPE_DEFAULT, "SGSuggestHistory: migrateFromKVS for key %{public}@ fromKVS does not have any entries that aren't already in dest", buf, 0xCu);
                  }
                  v26 = v56;
                }
                else
                {
                  if (v47)
                  {
                    *(_DWORD *)buf = 138543618;
                    v65 = v28;
                    v66 = 2048;
                    v67 = v45 - v44;
                    _os_log_impl(&dword_1C3607000, v46, OS_LOG_TYPE_DEFAULT, "SGSuggestHistory: migrateFromKVS for key %{public}@ fromKVS migrating %tu entries from fromKVS to dest kvs that dest kvs didn't already have", buf, 0x16u);
                  }

                  objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", v43, 1, 0);
                  v46 = objc_claimAutoreleasedReturnValue();
                  sgLogHandle();
                  v50 = objc_claimAutoreleasedReturnValue();
                  v51 = v50;
                  v26 = v56;
                  if (v46)
                  {
                    if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
                    {
                      v52 = -[NSObject length](v46, "length");
                      *(_DWORD *)buf = 138543618;
                      v65 = v28;
                      v66 = 2048;
                      v67 = v52;
                      _os_log_impl(&dword_1C3607000, v51, OS_LOG_TYPE_DEFAULT, "SGSuggestHistory: migrateFromKVS for key %{public}@ newDestData is length %tu", buf, 0x16u);
                    }

                    objc_msgSend(*(id *)(v56 + 40), "setData:forKey:", v46, v28);
                  }
                  else
                  {
                    if (os_log_type_enabled(v50, OS_LOG_TYPE_FAULT))
                    {
                      *(_DWORD *)buf = 138543875;
                      v65 = v28;
                      v66 = 2113;
                      v67 = (uint64_t)v36;
                      v68 = 2113;
                      v69 = v43;
                      _os_log_fault_impl(&dword_1C3607000, v51, OS_LOG_TYPE_FAULT, "SGSuggestHistory: migrateFromKVS newDestData is nil for key %{public}@! this should not happen. src: %{private}@, dest: %{private}@", buf, 0x20u);
                    }

                    if (_PASEvaluateLogFaultAndProbCrashCriteria())
                      goto LABEL_58;
                    v46 = 0;
                  }
                }

              }
              else
              {
                sgLogHandle();
                v49 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 138543362;
                  v65 = v28;
                  _os_log_impl(&dword_1C3607000, v49, OS_LOG_TYPE_DEFAULT, "SGSuggestHistory: migrateFromKVS for key %{public}@ fromKVS does not have any existing entries in dest, so copying the serialized object directly", buf, 0xCu);
                }

                objc_msgSend(*(id *)(v26 + 40), "setData:forKey:", v30, v28);
              }

              v25 = v57;
            }
            else
            {
              sgLogHandle();
              v48 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v48, OS_LOG_TYPE_FAULT))
              {
                *(_DWORD *)buf = 138543362;
                v65 = v28;
                _os_log_fault_impl(&dword_1C3607000, v48, OS_LOG_TYPE_FAULT, "SGSuggestHistory: migrateFromKVS for key %{public}@ failed to decode data in fromKVS, so skipping", buf, 0xCu);
              }

              if (_PASEvaluateLogFaultAndProbCrashCriteria())
LABEL_58:
                abort();
              v36 = 0;
            }
          }
          else
          {
            sgLogHandle();
            v36 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138543362;
              v65 = v28;
              _os_log_impl(&dword_1C3607000, v36, OS_LOG_TYPE_DEFAULT, "SGSuggestHistory: migrateFromKVS for key %{public}@ has no existing data in fromKVS, so skipping", buf, 0xCu);
            }
          }

          objc_autoreleasePoolPop(v29);
          ++v27;
        }
        while (v25 != v27);
        v25 = -[NSObject countByEnumeratingWithState:objects:count:](log, "countByEnumeratingWithState:objects:count:", &v60, v70, 16);
      }
      while (v25);
      v6 = v54;
      v5 = v55;
      v7 = v53;
    }
    goto LABEL_57;
  }
  objc_msgSend(*(id *)(v56 + 40), "dataForKey:", CFSTR("SGSaltManatee"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v15, "isEqual:", v16);

  if ((v17 & 1) != 0)
    goto LABEL_21;
  sgLogHandle();
  log = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR))
  {
    v18 = *(void **)(v56 + 48);
    objc_msgSend(*(id *)(v56 + 40), "dataForKey:", CFSTR("SGSaltManatee"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138478083;
    v65 = v18;
    v66 = 2113;
    v67 = (uint64_t)v11;
    v12 = "SGSuggestHistory: migrateFromKVS legacy manatee salt %{private}@ in fromKVS conflicts with existing legacy man"
          "atee salt %{private}@ in dest, so we're going to bail with success";
    goto LABEL_13;
  }
LABEL_57:

  (*(void (**)(void))(*(_QWORD *)(v56 + 64) + 16))();
}

void __50__SGSuggestHistory_migrateFromKVS_withCompletion___block_invoke_86(uint64_t a1, void *a2)
{
  void *v2;
  _QWORD *v3;
  uint64_t v4;
  id v5;

  v2 = (void *)MEMORY[0x1E0C99D68];
  v3 = a2;
  objc_msgSend(v2, "date");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (id)v3[17];
  v3[17] = v4;

}

void __50__SGSuggestHistory_migrateFromKVS_withCompletion___block_invoke_78(uint64_t a1, void *a2)
{
  _BYTE *v3;
  void *v4;
  _BYTE *v5;

  v3 = a2;
  if (!v3[128])
  {
    v5 = v3;
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), CFSTR("SGSuggestHistory.m"), 310, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("guardedData->isMigrating"));

    v3 = v5;
  }
  v3[128] = 0;

}

void __35__SGSuggestHistory_migrateIfNeeded__block_invoke(uint64_t a1, uint64_t a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), *(id *)(a2 + 120));
}

uint64_t __35__SGSuggestHistory_migrateIfNeeded__block_invoke_57(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  NSObject *v3;
  uint64_t result;
  uint8_t v5[16];

  v1 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v2 = *(void **)(v1 + 40);
  *(_QWORD *)(v1 + 40) = 0;

  sgLogHandle();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_fault_impl(&dword_1C3607000, v3, OS_LOG_TYPE_FAULT, "SGSuggestHistory: Timed out in migrateIfNeeded -- Ending transaction but migration will continue (unless we probabilistically crash)", v5, 2u);
  }

  result = _PASEvaluateLogFaultAndProbCrashCriteria();
  if ((_DWORD)result)
    abort();
  return result;
}

void __35__SGSuggestHistory_migrateIfNeeded__block_invoke_58(uint64_t a1)
{
  NSObject *v2;
  id WeakRetained;
  uint64_t v4;
  id v5;
  NSObject *v6;
  __int128 v7;
  _QWORD v8[4];
  NSObject *v9;
  id v10;
  __int128 v11;
  uint8_t buf[16];

  sgLogHandle();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1C3607000, v2, OS_LOG_TYPE_DEFAULT, "SGSuggestHistory: migrateIfNeeded on queue", buf, 2u);
  }

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  if (WeakRetained)
  {
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __35__SGSuggestHistory_migrateIfNeeded__block_invoke_59;
    v8[3] = &unk_1E7DAA338;
    v4 = *(_QWORD *)(a1 + 32);
    v9 = *(id *)(a1 + 40);
    v7 = *(_OWORD *)(a1 + 48);
    v5 = (id)v7;
    v11 = v7;
    v10 = WeakRetained;
    objc_msgSend(v10, "migrateFromKVS:withCompletion:", v4, v8);

    v6 = v9;
  }
  else
  {
    sgLogHandle();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1C3607000, v6, OS_LOG_TYPE_DEFAULT, "SGSuggestHistory: migrateIfNeeded aborting due to nil strongSelf", buf, 2u);
    }
  }

}

void __35__SGSuggestHistory_migrateIfNeeded__block_invoke_59(uint64_t a1, char a2)
{
  NSObject *v4;
  id v5;
  __int128 v6;
  _QWORD block[4];
  id v8;
  __int128 v9;
  char v10;

  v4 = *(NSObject **)(a1 + 32);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __35__SGSuggestHistory_migrateIfNeeded__block_invoke_2;
  block[3] = &unk_1E7DAA310;
  v6 = *(_OWORD *)(a1 + 48);
  v5 = (id)v6;
  v9 = v6;
  v10 = a2;
  v8 = *(id *)(a1 + 40);
  dispatch_async(v4, block);

}

void __35__SGSuggestHistory_migrateIfNeeded__block_invoke_2(uint64_t a1)
{
  id v2;
  uint64_t v3;
  void *v4;
  NSObject *v5;
  const __CFString *v6;
  int v7;
  const __CFString *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v2 = *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
  dispatch_block_cancel(*(dispatch_block_t *)(a1 + 40));
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = 0;

  sgLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    if (*(_BYTE *)(a1 + 56))
      v6 = CFSTR("SUCCESS");
    else
      v6 = CFSTR("FAILURE");
    v7 = 138412290;
    v8 = v6;
    _os_log_impl(&dword_1C3607000, v5, OS_LOG_TYPE_DEFAULT, "SGSuggestHistory: migrateIfNeeded %@", (uint8_t *)&v7, 0xCu);
  }

  if (*(_BYTE *)(a1 + 56))
    objc_msgSend(*(id *)(a1 + 32), "recordSuccessfulMigration");

}

void __40__SGSuggestHistory_setMigrateFromStore___block_invoke(uint64_t a1, uint64_t a2)
{
  objc_storeStrong((id *)(a2 + 120), *(id *)(a1 + 32));
}

+ (id)newTestingInstanceWithSharedKVS:(id)a3
{
  id v3;
  SGSuggestHistory *v4;
  void *v5;
  void *v6;
  SGSuggestHistory *v7;

  v3 = a3;
  v4 = [SGSuggestHistory alloc];
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "UUIDString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[SGSuggestHistory initWithKVS:kvStoreIdentifier:](v4, "initWithKVS:kvStoreIdentifier:", v3, v6);

  return v7;
}

+ (void)reset
{
  id v2;

  +[SGSuggestHistory sharedSuggestHistory](SGSuggestHistory, "sharedSuggestHistory");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "reset");

}

+ (void)resetNoFlush
{
  id v2;

  +[SGSuggestHistory sharedSuggestHistory](SGSuggestHistory, "sharedSuggestHistory");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "resetNoFlush");

}

uint64_t __40__SGSuggestHistory_sharedSuggestHistory__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)sharedSuggestHistory_instance;
  sharedSuggestHistory_instance = v0;

  return objc_msgSend((id)sharedSuggestHistory_instance, "migrateIfNeeded");
}

@end
