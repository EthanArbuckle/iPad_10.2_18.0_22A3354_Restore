@implementation HMDBackingStoreLocal

- (id)_runSQLite3:(const char *)a3 bind:(id)a4 error:(id *)a5
{
  return selectSQLite3(self->context, a3, a4, a5);
}

- (id)_createNewDatastore:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  char v10;
  uint64_t v11;
  uint64_t i;
  id v13;
  void *v14;
  HMDBackingStoreLocal *v15;
  NSObject *v16;
  void *v17;
  int *v18;
  char *v19;
  id v20;
  void *v21;
  HMDBackingStoreLocal *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  void *v26;
  sqlite3 *context;
  id v28;
  char *v29;
  void *v30;
  HMDBackingStoreLocal *v31;
  NSObject *v32;
  void *v33;
  char *v34;
  id v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  uint8_t buf[4];
  void *v42;
  __int16 v43;
  uint64_t v44;
  __int16 v45;
  char *v46;
  _QWORD v47[3];
  _BYTE v48[128];
  uint64_t v49;

  v49 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  v47[0] = v4;
  objc_msgSend(v4, "stringByAppendingString:", CFSTR("-shm"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v47[1] = v5;
  objc_msgSend(v4, "stringByAppendingString:", CFSTR("-wal"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v47[2] = v6;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v47, 3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v37, v48, 16);
  if (v8)
  {
    v9 = v8;
    v36 = v4;
    v10 = 0;
    v11 = *(_QWORD *)v38;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v38 != v11)
          objc_enumerationMutation(v7);
        v13 = objc_retainAutorelease(*(id *)(*((_QWORD *)&v37 + 1) + 8 * i));
        if (unlink((const char *)objc_msgSend(v13, "UTF8String")) && *__error() != 2)
        {
          v14 = (void *)MEMORY[0x227676638]();
          v15 = self;
          HMFGetOSLogHandle();
          v16 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
          {
            HMFGetLogIdentifier();
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            v18 = __error();
            v19 = strerror(*v18);
            *(_DWORD *)buf = 138543874;
            v42 = v17;
            v43 = 2112;
            v44 = (uint64_t)v13;
            v45 = 2080;
            v46 = v19;
            _os_log_impl(&dword_2218F0000, v16, OS_LOG_TYPE_ERROR, "%{public}@unable to remove old datastore file %@ (%s)", buf, 0x20u);

          }
          objc_autoreleasePoolPop(v14);
          v10 = 1;
        }
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v37, v48, 16);
    }
    while (v9);

    v4 = v36;
    if ((v10 & 1) != 0)
      goto LABEL_20;
  }
  else
  {

  }
  v20 = objc_retainAutorelease(v4);
  if (sqlite3_open_v2((const char *)objc_msgSend(v20, "UTF8String"), &self->context, 6, 0))
  {
    v21 = (void *)MEMORY[0x227676638]();
    v22 = self;
    HMFGetOSLogHandle();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v42 = v24;
      v43 = 2112;
      v44 = 0;
      _os_log_impl(&dword_2218F0000, v23, OS_LOG_TYPE_ERROR, "%{public}@unable to open new SQL context: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v21);
LABEL_20:
    objc_msgSend(MEMORY[0x24BDD1540], "hmfErrorWithCode:", 15);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_27;
  }
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("PRAGMA cache_size = %@;"), &unk_24E96BED0);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  context = self->context;
  v28 = objc_retainAutorelease(v26);
  runSQLite3(context, (const char *)objc_msgSend(v28, "UTF8String"));
  v29 = (char *)objc_claimAutoreleasedReturnValue();
  if (v29)
  {
    v30 = (void *)MEMORY[0x227676638]();
    v31 = self;
    HMFGetOSLogHandle();
    v32 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v42 = v33;
      v43 = 2048;
      v44 = 512;
      v45 = 2112;
      v46 = v29;
      _os_log_impl(&dword_2218F0000, v32, OS_LOG_TYPE_ERROR, "%{public}@Unable to set sqlite cache size to %ld: %@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v30);
    v34 = v29;
  }
  else
  {
    -[HMDBackingStoreLocal _createDatastoreTables:](self, "_createDatastoreTables:", v20);
    v34 = (char *)objc_claimAutoreleasedReturnValue();
  }
  v25 = v34;

LABEL_27:
  return v25;
}

- (id)_createDatastoreTables:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  HMDBackingStoreLocal *v7;
  NSObject *v8;
  void *v9;
  id v10;
  void *v12;
  void *v13;
  sqlite3 *context;
  id v15;
  void *v16;
  HMDBackingStoreLocal *v17;
  NSObject *v18;
  void *v19;
  id v20;
  uint8_t buf[4];
  void *v22;
  __int16 v23;
  uint64_t v24;
  __int16 v25;
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  runSQLite3(self->context, "CREATE TABLE zone (id INTEGER PRIMARY KEY AUTOINCREMENT, name STRING NOT NULL);");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    goto LABEL_16;
  runSQLite3(self->context, "CREATE TABLE store (id INTEGER PRIMARY KEY AUTOINCREMENT, name STRING NOT NULL);");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    goto LABEL_16;
  runSQLite3(self->context, "CREATE TABLE zone_group (id INTEGER PRIMARY KEY AUTOINCREMENT, zone_id INTEGER NOT NULL CONSTRAINT group_zone_id_fkey REFERENCES zone (id) ON DELETE RESTRICT, root TEXT NOT NULL, owner TEXT NOT NULL, token BLOB, subscription TEXT, subscription_data BLOB);");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    goto LABEL_16;
  runSQLite3(self->context, "CREATE TABLE zone_share (id INTEGER PRIMARY KEY AUTOINCREMENT, group_id INTEGER NOT NULL CONSTRAINT group_zone_id_fkey REFERENCES zone_group (id) ON DELETE RESTRICT, root TEXT NOT NULL, target TEXT, share BLOB, users BLOB);");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    goto LABEL_16;
  runSQLite3(self->context, "CREATE TABLE record (group_id INTEGER NOT NULL CONSTRAINT record_group_id_fkey REFERENCES zone_group (id) ON DELETE RESTRICT, share_id INTEGER NOT NULL CONSTRAINT record_share_id_fkey REFERENCES zone_share (id) ON DELETE RESTRICT, store_id INTEGER NOT NULL CONSTRAINT record_store_id_fkey REFERENCES store (id) ON DELETE RESTRICT, name TEXT NOT NULL, type TEXT, uuid TEXT, parent_uuid TEXT, encoding INTEGER NOT NULL, record BLOB NOT NULL, data BLOB NOT NULL, schema STRING);");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    goto LABEL_16;
  runSQLite3(self->context, "CREATE TABLE xact (id INTEGER PRIMARY KEY AUTOINCREMENT, xact_id INTEGER NOT NULL, pushed INTEGER, root TEXT NOT NULL, type INT NOT NULL, encoding INTEGER NOT NULL, data BLOB NOT NULL, disk_committed INTEGER NOT NULL DEFAULT 1);");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    goto LABEL_16;
  runSQLite3(self->context, "CREATE TABLE xact_block (id INTEGER PRIMARY KEY, data BLOB NOT NULL);");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    goto LABEL_16;
  runSQLite3(self->context, "CREATE UNIQUE INDEX zone_name ON zone (name)");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    goto LABEL_16;
  runSQLite3(self->context, "CREATE UNIQUE INDEX store_name ON store (name)");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    goto LABEL_16;
  runSQLite3(self->context, "CREATE UNIQUE INDEX group_owner_root_zone_id_ukey ON zone_group (owner, root, zone_id);");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    goto LABEL_16;
  runSQLite3(self->context, "CREATE UNIQUE INDEX share_root_group_id_ukey ON zone_share (root, group_id);");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    goto LABEL_16;
  runSQLite3(self->context, "CREATE UNIQUE INDEX record_group_id_share_id_name_ukey ON record (group_id, share_id, name);");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5
    || (runSQLite3(self->context, "CREATE INDEX xact_pushed ON xact (root, pushed, xact_id);"),
        (v5 = (void *)objc_claimAutoreleasedReturnValue()) != 0)
    || (runSQLite3(self->context, "CREATE INDEX xact_pushed2 ON xact (root, xact_id, id);"),
        (v5 = (void *)objc_claimAutoreleasedReturnValue()) != 0)
    || (runSQLite3(self->context, "CREATE TABLE IF NOT EXISTS archive (identifier string primary key, controller_username string not null, value blob not null);"),
        (v5 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {
LABEL_16:
    v6 = (void *)MEMORY[0x227676638]();
    v7 = self;
    HMFGetOSLogHandle();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v22 = v9;
      v23 = 2112;
      v24 = (uint64_t)v5;
      _os_log_impl(&dword_2218F0000, v8, OS_LOG_TYPE_ERROR, "%{public}@unable to initialize SQL context: %@", buf, 0x16u);

    }
LABEL_18:

    objc_autoreleasePoolPop(v6);
    sqlite3_close(self->context);
    unlink((const char *)objc_msgSend(objc_retainAutorelease(v4), "UTF8String"));
    v10 = v5;
    goto LABEL_19;
  }
  runSQLite3(self->context, "INSERT INTO zone (id, name) VALUES (0, '<NULL>');");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5
    || (runSQLite3(self->context, "INSERT INTO zone_group (id, zone_id, root, owner) VALUES (0, 0, '<NULL>', '<NULL>');"),
        (v5 = (void *)objc_claimAutoreleasedReturnValue()) != 0)
    || (runSQLite3(self->context, "INSERT INTO zone_share (id, group_id, root) VALUES (0, 0, '<NULL>');"),
        (v5 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    v6 = (void *)MEMORY[0x227676638]();
    v7 = self;
    HMFGetOSLogHandle();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v22 = v12;
      v23 = 2112;
      v24 = (uint64_t)v5;
      _os_log_impl(&dword_2218F0000, v8, OS_LOG_TYPE_INFO, "%{public}@initial database row setup failed: %@", buf, 0x16u);

    }
    goto LABEL_18;
  }
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("PRAGMA user_version = %ld;"), 2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  context = self->context;
  v15 = objc_retainAutorelease(v13);
  runSQLite3(context, (const char *)objc_msgSend(v15, "UTF8String"));
  v10 = (id)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    v16 = (void *)MEMORY[0x227676638]();
    v17 = self;
    HMFGetOSLogHandle();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v22 = v19;
      v23 = 2048;
      v24 = 2;
      v25 = 2112;
      v26 = v10;
      _os_log_impl(&dword_2218F0000, v18, OS_LOG_TYPE_INFO, "%{public}@unable to set schema version to %ld failed: %@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v16);
    sqlite3_close(self->context);
    unlink((const char *)objc_msgSend(objc_retainAutorelease(v4), "UTF8String"));
    v20 = v10;
  }

LABEL_19:
  return v10;
}

- (HMDBackingStoreLocal)initWithDB:(id)a3 migrate:(BOOL)a4 error:(id *)a5
{
  _BOOL8 v6;
  id v9;
  HMDBackingStoreLocal *v10;
  HMDBackingStoreLocal *v11;
  void *v12;
  void *v13;
  HMDBackingStoreLocal *v14;
  NSObject *v15;
  void *v16;
  HMDBackingStoreLocal *v17;
  objc_super v19;
  uint8_t buf[4];
  void *v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v6 = a4;
  v24 = *MEMORY[0x24BDAC8D0];
  v9 = a3;
  v19.receiver = self;
  v19.super_class = (Class)HMDBackingStoreLocal;
  v10 = -[HMDBackingStoreLocal init](&v19, sel_init);
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_datastoreFile, a3);
    +[HMDBackingStoreLocal cleanDatastoreFilesAt:everything:](HMDBackingStoreLocal, "cleanDatastoreFilesAt:everything:", v9, 0);
    -[HMDBackingStoreLocal _instanceResources:migrate:](v11, "_instanceResources:migrate:", 0, v6);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      v13 = (void *)MEMORY[0x227676638]();
      v14 = v11;
      HMFGetOSLogHandle();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v21 = v16;
        v22 = 2112;
        v23 = v12;
        _os_log_impl(&dword_2218F0000, v15, OS_LOG_TYPE_ERROR, "%{public}@unable to instance our resources: %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v13);
      v17 = 0;
      if (a5)
        *a5 = objc_retainAutorelease(v12);
    }
    else
    {
      v17 = v11;
    }

  }
  else
  {
    v17 = 0;
  }

  return v17;
}

- (HMDBackingStoreLocal)initWithDatastore:(id)a3
{
  id v4;
  HMDBackingStoreLocal *v5;
  id v6;
  void *v7;
  HMDBackingStoreLocal *v8;
  NSObject *v9;
  void *v10;
  HMDBackingStoreLocal *v11;
  id v13;
  uint8_t buf[4];
  void *v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v13 = 0;
  v5 = -[HMDBackingStoreLocal initWithDB:migrate:error:](self, "initWithDB:migrate:error:", v4, 1, &v13);
  v6 = v13;
  if (v6)
  {
    v7 = (void *)MEMORY[0x227676638]();
    v8 = v5;
    HMFGetOSLogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v15 = v10;
      v16 = 2112;
      v17 = v6;
      _os_log_impl(&dword_2218F0000, v9, OS_LOG_TYPE_ERROR, "%{public}@unable to instance our resources: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v7);
    v11 = 0;
  }
  else
  {
    v11 = v5;
  }

  return v11;
}

- (void)dealloc
{
  objc_super v3;

  -[HMDBackingStoreLocal _freeResources](self, "_freeResources");
  v3.receiver = self;
  v3.super_class = (Class)HMDBackingStoreLocal;
  -[HMDBackingStoreLocal dealloc](&v3, sel_dealloc);
}

- (id)flush:(BOOL)a3
{
  _BOOL8 v3;
  HMDBackingStoreLocalFlushOperation *v5;
  HMDBackingStoreLocalFlushOperation *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v12[5];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;

  v3 = a3;
  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__160205;
  v17 = __Block_byref_object_dispose__160206;
  v18 = 0;
  v5 = [HMDBackingStoreLocalFlushOperation alloc];
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __30__HMDBackingStoreLocal_flush___block_invoke;
  v12[3] = &unk_24E78A860;
  v12[4] = &v13;
  v6 = -[HMDBackingStoreLocalFlushOperation initWithStore:clearCloud:resultHandler:](v5, "initWithStore:clearCloud:resultHandler:", self, v3, v12);
  +[HMDBackingStoreSingleton sharedInstance](HMDBackingStoreSingleton, "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "queue");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addOperation:", v6);

  -[HMDBackingStoreLocalFlushOperation waitUntilFinished](v6, "waitUntilFinished");
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "postNotificationName:object:", CFSTR("HMDBackingStoreLocalDataReset"), self);

  v10 = (id)v14[5];
  _Block_object_dispose(&v13, 8);

  return v10;
}

- (void)_freeResources
{
  if (self->rollback)
    -[HMDBackingStoreLocal _rollback](self, "_rollback");
  sqlite3_finalize(self->insertZone);
  self->insertZone = 0;
  sqlite3_finalize(self->deleteZone);
  self->deleteZone = 0;
  sqlite3_finalize(self->selectZones);
  self->selectZones = 0;
  sqlite3_finalize(self->insertStore);
  self->insertStore = 0;
  sqlite3_finalize(self->selectStores);
  self->selectStores = 0;
  sqlite3_finalize(self->insertGroup);
  self->insertGroup = 0;
  sqlite3_finalize(self->deleteGroup);
  self->deleteGroup = 0;
  sqlite3_finalize(self->updateShareShare);
  self->updateShareShare = 0;
  sqlite3_finalize(self->updateShareUsers);
  self->updateShareUsers = 0;
  sqlite3_finalize(self->updateGroupToken);
  self->updateGroupToken = 0;
  sqlite3_finalize(self->updateGroupSubscription);
  self->updateGroupSubscription = 0;
  sqlite3_finalize(self->insertShare);
  self->insertShare = 0;
  sqlite3_finalize(self->deleteShare);
  self->deleteShare = 0;
  sqlite3_finalize(self->selectGroups);
  self->selectGroups = 0;
  sqlite3_finalize(self->selectShares);
  self->selectShares = 0;
  sqlite3_finalize(self->insertRecord);
  self->insertRecord = 0;
  sqlite3_finalize(self->updateRecordSchema);
  self->updateRecordSchema = 0;
  sqlite3_finalize(self->selectRecordCountGroup);
  self->selectRecordCountGroup = 0;
  sqlite3_finalize(self->selectRecordGroupTypeSchema);
  self->selectRecordGroupTypeSchema = 0;
  sqlite3_finalize(self->selectRecordGroup);
  self->selectRecordGroup = 0;
  sqlite3_finalize(self->selectRecordGroupMap);
  self->selectRecordGroupMap = 0;
  sqlite3_finalize(self->selectRecordUUID);
  self->selectRecordUUID = 0;
  sqlite3_finalize(self->selectRecordParentUUID);
  self->selectRecordParentUUID = 0;
  sqlite3_finalize(self->selectRecordParent);
  self->selectRecordParent = 0;
  sqlite3_finalize(self->selectRecordName);
  self->selectRecordName = 0;
  sqlite3_finalize(self->selectRecordUUIDNoShare);
  self->selectRecordUUIDNoShare = 0;
  sqlite3_finalize(self->selectRecordNameNoShare);
  self->selectRecordNameNoShare = 0;
  sqlite3_finalize(self->selectRecordParentNoShare);
  self->selectRecordParentNoShare = 0;
  sqlite3_finalize(self->selectRecords);
  self->selectRecords = 0;
  sqlite3_finalize(self->selectStoreRecords);
  self->selectStoreRecords = 0;
  sqlite3_finalize(self->deleteRecord);
  self->deleteRecord = 0;
  sqlite3_finalize(self->insertLog);
  self->insertLog = 0;
  sqlite3_finalize(self->updateLogToDiskCommited);
  self->updateLogToDiskCommited = 0;
  sqlite3_finalize(self->flushPushedXact);
  self->flushPushedXact = 0;
  sqlite3_finalize(self->updateLogXactID);
  self->updateLogXactID = 0;
  sqlite3_finalize(self->selectLog);
  self->selectLog = 0;
  sqlite3_finalize(self->selectChangeExistsLog);
  self->selectChangeExistsLog = 0;
  sqlite3_finalize(self->selectAllLog);
  self->selectAllLog = 0;
  sqlite3_finalize(self->insertLogOptions);
  self->insertLogOptions = 0;
  sqlite3_finalize(self->selectLogOptions);
  self->selectLogOptions = 0;
  sqlite3_finalize(self->updateLog);
  self->updateLog = 0;
  sqlite3_finalize(self->deleteLog);
  self->deleteLog = 0;
  sqlite3_finalize(self->insertArchive);
  self->insertArchive = 0;
  sqlite3_finalize(self->selectArchive);
  self->selectArchive = 0;
  sqlite3_finalize(self->commit);
  self->commit = 0;
  sqlite3_finalize(self->rollback);
  self->rollback = 0;
  sqlite3_finalize(self->begin);
  self->begin = 0;
  sqlite3_close(self->context);
  self->context = 0;
  free(self->sqlite3_cache);
  self->sqlite3_cache = 0;
}

- (id)_updateRecordWithGroupID:(int64_t)a3 name:(id)a4 schema:(id)a5
{
  id v8;
  id v9;
  sqlite3_stmt *updateRecordSchema;
  id v11;
  sqlite3_stmt *v12;
  id v13;
  sqlite3_stmt *v14;
  id v15;
  void *v16;
  HMDBackingStoreLocal *v17;
  NSObject *v18;
  void *v19;
  id v20;
  void *v21;
  id v23;
  id v24;
  id v25;
  uint8_t buf[4];
  void *v27;
  __int16 v28;
  int64_t v29;
  __int16 v30;
  id v31;
  __int16 v32;
  id v33;
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v8 = a4;
  v9 = a5;
  updateRecordSchema = self->updateRecordSchema;
  v25 = 0;
  bindIntSQLite3(updateRecordSchema, 1, a3, &v25);
  v11 = v25;
  v12 = self->updateRecordSchema;
  v24 = v11;
  bindStringSQLite3(v12, 2, v8, &v24);
  v13 = v24;

  v14 = self->updateRecordSchema;
  v23 = v13;
  bindStringSQLite3(v14, 3, v9, &v23);
  v15 = v23;

  v16 = (void *)MEMORY[0x227676638]();
  v17 = self;
  HMFGetOSLogHandle();
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier();
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544130;
    v27 = v19;
    v28 = 2048;
    v29 = a3;
    v30 = 2112;
    v31 = v8;
    v32 = 2112;
    v33 = v9;
    _os_log_impl(&dword_2218F0000, v18, OS_LOG_TYPE_DEBUG, "%{public}@Updating record schema: %lu, name: %@, schema: %@", buf, 0x2Au);

  }
  objc_autoreleasePoolPop(v16);
  if (v15)
  {
    v20 = v15;
  }
  else
  {
    execSQLite3(self->updateRecordSchema);
    v20 = (id)objc_claimAutoreleasedReturnValue();
  }
  v21 = v20;

  return v21;
}

- (id)_instanceResources:(BOOL)a3 migrate:(BOOL)a4
{
  _BOOL4 v5;
  void *v7;
  HMDBackingStoreLocal *v8;
  NSObject *v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  sqlite3 **p_context;
  int v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  int v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  id v27;
  sqlite3 *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  void *v34;
  HMDBackingStoreLocal *v35;
  NSObject *v36;
  id v37;
  id v38;
  void *v39;
  sqlite3 *v40;
  id v41;
  void *v42;
  void *v43;
  HMDBackingStoreLocal *v44;
  NSObject *v45;
  void *v46;
  id v47;
  void *v48;
  void *v49;
  HMDBackingStoreLocal *v50;
  NSObject *v51;
  id v52;
  sqlite3 *v53;
  HMDBackingStoreLocal *v54;
  void *v55;
  void *v56;
  id v57;
  BOOL v58;
  char v59;
  void *v60;
  HMDBackingStoreLocal *v61;
  NSObject *v62;
  void *v63;
  void *v64;
  void *v65;
  sqlite3 *v66;
  void *v67;
  id v68;
  void *v69;
  HMDBackingStoreLocal *v70;
  NSObject *v71;
  void *v72;
  id v73;
  void *v74;
  id v75;
  sqlite3 *v76;
  sqlite3_stmt *v77;
  id v78;
  sqlite3 *v79;
  sqlite3_stmt *v80;
  id v81;
  sqlite3 *v82;
  sqlite3_stmt *v83;
  id v84;
  sqlite3 *v85;
  sqlite3_stmt *v86;
  id v87;
  sqlite3 *v88;
  sqlite3_stmt *v89;
  id v90;
  sqlite3 *v91;
  sqlite3_stmt *v92;
  id v93;
  sqlite3 *v94;
  sqlite3_stmt *v95;
  id v96;
  sqlite3 *v97;
  sqlite3_stmt *v98;
  id v99;
  sqlite3 *v100;
  sqlite3_stmt *v101;
  id v102;
  sqlite3 *v103;
  sqlite3_stmt *v104;
  id v105;
  sqlite3 *v106;
  sqlite3_stmt *v107;
  id v108;
  sqlite3 *v109;
  sqlite3_stmt *v110;
  id v111;
  sqlite3 *v112;
  sqlite3_stmt *v113;
  id v114;
  sqlite3 *v115;
  sqlite3_stmt *v116;
  id v117;
  sqlite3 *v118;
  sqlite3_stmt *v119;
  id v120;
  sqlite3 *v121;
  sqlite3_stmt *v122;
  id v123;
  sqlite3 *v124;
  sqlite3_stmt *v125;
  id v126;
  sqlite3 *v127;
  sqlite3_stmt *v128;
  id v129;
  sqlite3 *v130;
  sqlite3_stmt *v131;
  id v132;
  sqlite3 *v133;
  sqlite3_stmt *v134;
  id v135;
  sqlite3 *v136;
  sqlite3_stmt *v137;
  id v138;
  sqlite3 *v139;
  sqlite3_stmt *v140;
  id v141;
  sqlite3 *v142;
  sqlite3_stmt *v143;
  id v144;
  sqlite3 *v145;
  sqlite3_stmt *v146;
  id v147;
  sqlite3 *v148;
  sqlite3_stmt *v149;
  id v150;
  sqlite3 *v151;
  sqlite3_stmt *v152;
  id v153;
  sqlite3 *v154;
  sqlite3_stmt *v155;
  id v156;
  sqlite3 *v157;
  sqlite3_stmt *v158;
  id v159;
  sqlite3 *v160;
  sqlite3_stmt *v161;
  id v162;
  sqlite3 *v163;
  sqlite3_stmt *v164;
  id v165;
  sqlite3 *v166;
  sqlite3_stmt *v167;
  id v168;
  sqlite3 *v169;
  sqlite3_stmt *v170;
  id v171;
  sqlite3 *v172;
  sqlite3_stmt *v173;
  id v174;
  sqlite3 *v175;
  sqlite3_stmt *v176;
  id v177;
  sqlite3 *v178;
  sqlite3_stmt *v179;
  id v180;
  sqlite3 *v181;
  sqlite3_stmt *v182;
  id v183;
  sqlite3 *v184;
  sqlite3_stmt *v185;
  id v186;
  sqlite3 *v187;
  sqlite3_stmt *v188;
  id v189;
  sqlite3 *v190;
  sqlite3_stmt *v191;
  id v192;
  sqlite3 *v193;
  sqlite3_stmt *v194;
  id v195;
  sqlite3 *v196;
  sqlite3_stmt *v197;
  id v198;
  sqlite3 *v199;
  sqlite3_stmt *v200;
  id v201;
  sqlite3 *v202;
  sqlite3_stmt *v203;
  id v204;
  sqlite3 *v205;
  sqlite3_stmt *v206;
  id v207;
  sqlite3 *v208;
  sqlite3_stmt *v209;
  id v210;
  sqlite3 *v211;
  sqlite3_stmt *v212;
  id v213;
  sqlite3 *v214;
  sqlite3_stmt *v215;
  id v216;
  void *v217;
  HMDBackingStoreLocal *v218;
  NSObject *v219;
  void *v220;
  id v221;
  char v222;
  void *v223;
  void *v224;
  int v225;
  void *v226;
  void *v227;
  void *v228;
  void *v229;
  id v230;
  void *v231;
  HMDBackingStoreLocal *v232;
  NSObject *v233;
  void *v234;
  uint64_t v235;
  id v236;
  void *v237;
  HMDBackingStoreLocal *v238;
  NSObject *v239;
  void *v240;
  uint64_t v241;
  void *v242;
  HMDBackingStoreLocal *v243;
  NSObject *v244;
  void *v245;
  void *v246;
  id v247;
  void *v248;
  HMDBackingStoreLocal *v249;
  NSObject *v250;
  void *v251;
  uint64_t v252;
  void *v253;
  id v254;
  void *v255;
  HMDBackingStoreLocal *v256;
  NSObject *v257;
  void *v258;
  uint64_t v259;
  void *v260;
  id v261;
  void *v262;
  HMDBackingStoreLocal *v263;
  NSObject *v264;
  void *v265;
  uint64_t v266;
  char v267;
  void *v268;
  id v269;
  HMDBackingStoreLocal *v270;
  id v271;
  void *v272;
  sqlite3 *v273;
  id v274;
  HMDBackingStoreLocal *v275;
  void *v276;
  void *v277;
  HMDBackingStoreLocal *v278;
  NSObject *v279;
  NSObject *v280;
  void *v281;
  void *v282;
  NSObject *v283;
  id v284;
  HMDBackingStoreLocal *v285;
  NSObject *v286;
  void *v287;
  uint64_t v288;
  id v289;
  void *v290;
  HMDBackingStoreLocal *v291;
  NSObject *v292;
  void *v293;
  uint64_t v294;
  id v295;
  sqlite3 *v296;
  uint64_t v297;
  void *v298;
  HMDBackingStoreLocal *v299;
  NSObject *v300;
  void *v301;
  const char *v302;
  NSObject *v303;
  uint32_t v304;
  HMDBackingStoreLocal *v305;
  void *v306;
  void *v307;
  id v308;
  HMDBackingStoreLocal *v309;
  uint64_t v310;
  void *v311;
  sqlite3 *v312;
  id v313;
  void *v314;
  HMDBackingStoreLocal *v315;
  NSObject *v316;
  void *v317;
  void *v318;
  HMDBackingStoreLocal *v319;
  NSObject *v320;
  void *v321;
  HMDBackingStoreLocal *v322;
  void *v323;
  const char *v324;
  void *v325;
  HMDBackingStoreLocal *v326;
  NSObject *v327;
  void *v328;
  HMDBackingStoreLocal *v329;
  char context;
  void *contexta;
  void *contextb;
  id v333;
  sqlite3 *v334;
  HMDBackingStoreLocal *v335;
  void *v336;
  void *v337;
  id v338;
  id v339;
  id v340;
  id v341;
  id v342;
  id v343;
  id v344;
  id v345;
  id v346;
  id v347;
  id v348;
  id v349;
  id v350;
  id v351;
  id v352;
  id v353;
  id v354;
  id v355;
  id v356;
  id v357;
  id v358;
  id v359;
  id v360;
  id v361;
  id v362;
  id v363;
  id v364;
  id v365;
  id v366;
  id v367;
  id v368;
  id v369;
  id v370;
  id v371;
  id v372;
  id v373;
  id v374;
  id v375;
  id v376;
  id v377;
  id v378;
  id v379;
  id v380;
  id v381;
  id v382;
  id v383;
  id v384;
  id v385;
  id v386;
  id v387;
  id v388;
  void *v389;
  uint8_t buf[4];
  id v391;
  __int16 v392;
  uint64_t v393;
  __int16 v394;
  id v395;
  uint64_t v396;

  v5 = a3;
  v396 = *MEMORY[0x24BDAC8D0];
  v7 = (void *)MEMORY[0x227676638](self, a2);
  v8 = self;
  HMFGetOSLogHandle();
  v9 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v10 = (id)objc_claimAutoreleasedReturnValue();
    -[HMDBackingStoreLocal datastoreFile](v8, "datastoreFile");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v391 = v10;
    v392 = 2112;
    v393 = (uint64_t)v11;
    _os_log_impl(&dword_2218F0000, v9, OS_LOG_TYPE_INFO, "%{public}@SQLite datastore file: %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v7);
  -[HMDBackingStoreLocal datastoreFile](v8, "datastoreFile");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v12)
  {
    objc_msgSend(MEMORY[0x24BDD1540], "hmfErrorWithCode:", 2);
    return (id)objc_claimAutoreleasedReturnValue();
  }
  sqlite3_initialize();
  if (v5)
  {
    -[HMDBackingStoreLocal datastoreFile](v8, "datastoreFile");
    v13 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    unlink((const char *)objc_msgSend(v13, "UTF8String"));

  }
  -[HMDBackingStoreLocal datastoreFile](v8, "datastoreFile");
  v14 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  p_context = &v8->context;
  v16 = sqlite3_open_v2((const char *)objc_msgSend(v14, "UTF8String"), &v8->context, 2, 0);

  -[HMDBackingStoreLocal datastoreFile](v8, "datastoreFile");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v17;
  if (!v16)
  {
    v22 = objc_msgSend(v17, "isEqualToString:", CFSTR(":memory:"));

    if (v22)
    {
      -[HMDBackingStoreLocal datastoreFile](v8, "datastoreFile");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDBackingStoreLocal _createDatastoreTables:](v8, "_createDatastoreTables:", v23);
      v24 = (void *)objc_claimAutoreleasedReturnValue();

      if (v24)
      {
        v20 = v24;
        goto LABEL_13;
      }
      goto LABEL_14;
    }
    v28 = *p_context;
    v388 = 0;
    selectSQLite3(v28, "PRAGMA user_version;", MEMORY[0x24BDBD1B8], &v388);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = v388;
    v337 = v29;
    objc_msgSend(v29, "firstObject");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "firstObject");
    v31 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v32 = v31;
    else
      v32 = 0;
    v33 = v32;

    v34 = (void *)MEMORY[0x227676638]();
    v35 = v8;
    HMFGetOSLogHandle();
    v36 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v37 = v33;
      v38 = (id)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v391 = v38;
      v392 = 2112;
      v393 = (uint64_t)v37;
      _os_log_impl(&dword_2218F0000, v36, OS_LOG_TYPE_DEFAULT, "%{public}@Current schema version: %@", buf, 0x16u);

      v33 = v37;
    }

    objc_autoreleasePoolPop(v34);
    if (objc_msgSend(v33, "unsignedIntegerValue") == 2)
    {
LABEL_21:

LABEL_22:
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("PRAGMA cache_size = %@;"), &unk_24E96BED0);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      v40 = *p_context;
      v41 = objc_retainAutorelease(v39);
      runSQLite3(v40, (const char *)objc_msgSend(v41, "UTF8String"));
      v42 = (void *)objc_claimAutoreleasedReturnValue();

      if (v42)
      {
        v43 = (void *)MEMORY[0x227676638]();
        v44 = v8;
        HMFGetOSLogHandle();
        v45 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          v391 = v46;
          v392 = 2048;
          v393 = 512;
          v394 = 2112;
          v395 = v42;
          _os_log_impl(&dword_2218F0000, v45, OS_LOG_TYPE_ERROR, "%{public}@Unable to set sqlite cache size to %ld: %@", buf, 0x20u);

        }
        objc_autoreleasePoolPop(v43);
        v47 = v42;
      }
      else
      {
        runSQLite3(*p_context, "PRAGMA foreign_keys = ON;");
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v48)
        {
          v66 = *p_context;
          v386 = 0;
          selectSQLite3(v66, "PRAGMA journal_mode=WAL;", MEMORY[0x24BDBD1B8], &v386);
          v67 = (void *)objc_claimAutoreleasedReturnValue();
          v68 = v386;
          if (v68 || objc_msgSend(v67, "count"))
          {
            v69 = (void *)MEMORY[0x227676638]();
            v70 = v8;
            HMFGetOSLogHandle();
            v71 = (id)objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v71, OS_LOG_TYPE_DEFAULT))
            {
              HMFGetLogIdentifier();
              v338 = v41;
              v72 = v67;
              v73 = (id)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v72, "firstObject");
              v74 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v74, "firstObject");
              v336 = v69;
              v75 = (id)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543874;
              v391 = v73;
              v392 = 2112;
              v393 = (uint64_t)v75;
              v394 = 2112;
              v395 = v68;
              _os_log_impl(&dword_2218F0000, v71, OS_LOG_TYPE_DEFAULT, "%{public}@turning on WAL resulted in %@ / %@", buf, 0x20u);

              v69 = v336;
              v67 = v72;
              v41 = v338;
            }

            objc_autoreleasePoolPop(v69);
          }
          v76 = *p_context;
          v385 = v68;
          v77 = prepareSQLite3(v76, "BEGIN;", &v385);
          v78 = v385;

          v8->begin = v77;
          v79 = *p_context;
          v384 = v78;
          v80 = prepareSQLite3(v79, "COMMIT;", &v384);
          v81 = v384;

          v8->commit = v80;
          v82 = *p_context;
          v383 = v81;
          v83 = prepareSQLite3(v82, "ROLLBACK;", &v383);
          v84 = v383;

          v8->rollback = v83;
          v85 = *p_context;
          v382 = v84;
          v86 = prepareSQLite3(v85, "INSERT INTO zone (name) values (?1)", &v382);
          v87 = v382;

          v8->insertZone = v86;
          v88 = *p_context;
          v381 = v87;
          v89 = prepareSQLite3(v88, "DELETE FROM zone WHERE id=?1;", &v381);
          v90 = v381;

          v8->deleteZone = v89;
          v91 = *p_context;
          v380 = v90;
          v92 = prepareSQLite3(v91, "SELECT id, name FROM zone;", &v380);
          v93 = v380;

          v8->selectZones = v92;
          v94 = *p_context;
          v379 = v93;
          v95 = prepareSQLite3(v94, "INSERT INTO store (name) values (?1)", &v379);
          v96 = v379;

          v8->insertStore = v95;
          v97 = *p_context;
          v378 = v96;
          v98 = prepareSQLite3(v97, "SELECT id, name FROM store;", &v378);
          v99 = v378;

          v8->selectStores = v98;
          v100 = *p_context;
          v377 = v99;
          v101 = prepareSQLite3(v100, "INSERT INTO zone_group (zone_id, root, owner, subscription) VALUES (?1, ?2, ?3, ?4);",
                   &v377);
          v102 = v377;

          v8->insertGroup = v101;
          v103 = *p_context;
          v376 = v102;
          v104 = prepareSQLite3(v103, "DELETE FROM zone_group WHERE id=?1;", &v376);
          v105 = v376;

          v8->deleteGroup = v104;
          v106 = *p_context;
          v375 = v105;
          v107 = prepareSQLite3(v106, "UPDATE zone_group SET token=?1 WHERE id=?2;", &v375);
          v108 = v375;

          v8->updateGroupToken = v107;
          v109 = *p_context;
          v374 = v108;
          v110 = prepareSQLite3(v109, "UPDATE zone_group SET subscription_data=?1 WHERE id=?2;", &v374);
          v111 = v374;

          v8->updateGroupSubscription = v110;
          v112 = *p_context;
          v373 = v111;
          v113 = prepareSQLite3(v112, "SELECT id, root, owner, token, subscription, subscription_data FROM zone_group where zone_id=?1", &v373);
          v114 = v373;

          v8->selectGroups = v113;
          v115 = *p_context;
          v372 = v114;
          v116 = prepareSQLite3(v115, "INSERT INTO zone_share (group_id, root, target) VALUES (?1, ?2, ?3);", &v372);
          v117 = v372;

          v8->insertShare = v116;
          v118 = *p_context;
          v371 = v117;
          v119 = prepareSQLite3(v118, "DELETE FROM zone_share WHERE id=?1;", &v371);
          v120 = v371;

          v8->deleteShare = v119;
          v121 = *p_context;
          v370 = v120;
          v122 = prepareSQLite3(v121, "UPDATE zone_share SET share=?1 WHERE id=?2;", &v370);
          v123 = v370;

          v8->updateShareShare = v122;
          v124 = *p_context;
          v369 = v123;
          v125 = prepareSQLite3(v124, "UPDATE zone_share SET users=?1 WHERE id=?2;", &v369);
          v126 = v369;

          v8->updateShareUsers = v125;
          v127 = *p_context;
          v368 = v126;
          v128 = prepareSQLite3(v127, "SELECT id, root, target, share, users FROM zone_share WHERE group_id=?1;", &v368);
          v129 = v368;

          v8->selectShares = v128;
          v130 = *p_context;
          v367 = v129;
          v131 = prepareSQLite3(v130, "INSERT OR REPLACE INTO record (group_id, share_id, name, record, uuid, parent_uuid, data, encoding, type, schema, store_id) VALUES (?1, 0, ?2, ?3, ?4, ?5, ?6, ?7, ?8, ?9, ?10);",
                   &v367);
          v132 = v367;

          v8->insertRecord = v131;
          v133 = *p_context;
          v366 = v132;
          v134 = prepareSQLite3(v133, "UPDATE record SET schema = ?3 where group_id = ?1 and name = ?2;", &v366);
          v135 = v366;

          v8->updateRecordSchema = v134;
          v136 = *p_context;
          v365 = v135;
          v137 = prepareSQLite3(v136, "SELECT count(*) FROM record WHERE group_id=?1;", &v365);
          v138 = v365;

          v8->selectRecordCountGroup = v137;
          v139 = *p_context;
          v364 = v138;
          v140 = prepareSQLite3(v139, "SELECT type, schema FROM record WHERE group_id=?1 GROUP BY type, schema;", &v364);
          v141 = v364;

          v8->selectRecordGroupTypeSchema = v140;
          v142 = *p_context;
          v363 = v141;
          v143 = prepareSQLite3(v142, "SELECT name, record, encoding, data, uuid, parent_uuid, type, schema FROM record WHERE group_id=?1;",
                   &v363);
          v144 = v363;

          v8->selectRecordGroup = v143;
          v145 = *p_context;
          v362 = v144;
          v146 = prepareSQLite3(v145, "SELECT name, uuid, parent_uuid, type FROM record WHERE group_id=?1;", &v362);
          v147 = v362;

          v8->selectRecordGroupMap = v146;
          v148 = *p_context;
          v361 = v147;
          v149 = prepareSQLite3(v148, "SELECT record, data, encoding, uuid FROM record WHERE group_id=?2 AND uuid=?1;",
                   &v361);
          v150 = v361;

          v8->selectRecordUUID = v149;
          v151 = *p_context;
          v360 = v150;
          v152 = prepareSQLite3(v151, "SELECT record, data, encoding, uuid FROM record WHERE group_id=?2 AND parent_uuid=?1;",
                   &v360);
          v153 = v360;

          v8->selectRecordParentUUID = v152;
          v154 = *p_context;
          v359 = v153;
          v155 = prepareSQLite3(v154, "SELECT record, data, encoding, uuid FROM record WHERE group_id=?3 and parent_uuid=?1 and type=?2;",
                   &v359);
          v156 = v359;

          v8->selectRecordParent = v155;
          v157 = *p_context;
          v358 = v156;
          v158 = prepareSQLite3(v157, "SELECT record, data, encoding, uuid FROM record WHERE group_id=?2 AND name=?1;",
                   &v358);
          v159 = v358;

          v8->selectRecordName = v158;
          v160 = *p_context;
          v357 = v159;
          v161 = prepareSQLite3(v160, "SELECT record, data, encoding, uuid FROM record WHERE uuid=?1;", &v357);
          v162 = v357;

          v8->selectRecordUUIDNoShare = v161;
          v163 = *p_context;
          v356 = v162;
          v164 = prepareSQLite3(v163, "SELECT record, data, encoding, uuid FROM record WHERE parent_uuid=?1 and type=?2;",
                   &v356);
          v165 = v356;

          v8->selectRecordParentNoShare = v164;
          v166 = *p_context;
          v355 = v165;
          v167 = prepareSQLite3(v166, "SELECT record, data, encoding, uuid FROM record WHERE name=?1;", &v355);
          v168 = v355;

          v8->selectRecordNameNoShare = v167;
          v169 = *p_context;
          v354 = v168;
          v170 = prepareSQLite3(v169, "DELETE FROM record WHERE group_id=?2 AND name=?1;", &v354);
          v171 = v354;

          v8->deleteRecord = v170;
          v172 = *p_context;
          v353 = v171;
          v173 = prepareSQLite3(v172, "SELECT name, group_id, share_id, uuid, parent_uuid, encoding, data, record FROM record ORDER BY group_id, share_id, record;",
                   &v353);
          v174 = v353;

          v8->selectRecords = v173;
          v175 = *p_context;
          v352 = v174;
          v176 = prepareSQLite3(v175, "SELECT name, group_id, share_id, encoding, data, record, schema FROM record WHERE store_id=?1 ORDER BY group_id, share_id, name;",
                   &v352);
          v177 = v352;

          v8->selectStoreRecords = v176;
          v178 = *p_context;
          v351 = v177;
          v179 = prepareSQLite3(v178, "UPDATE xact SET xact_id=?1 WHERE id=?1;", &v351);
          v180 = v351;

          v8->updateLogXactID = v179;
          v181 = *p_context;
          v350 = v180;
          v182 = prepareSQLite3(v181, "INSERT INTO xact (pushed, root, data, xact_id, type, encoding, disk_committed) VALUES (?1, ?2, ?3, ?4, ?5, ?6, 0);",
                   &v350);
          v183 = v350;

          v8->insertLog = v182;
          v184 = *p_context;
          v349 = v183;
          v185 = prepareSQLite3(v184, "UPDATE xact SET disk_committed=1;", &v349);
          v186 = v349;

          v8->updateLogToDiskCommited = v185;
          v187 = *p_context;
          v348 = v186;
          v188 = prepareSQLite3(v187, "SELECT id, xact_id, pushed, data, type, encoding FROM xact WHERE root=?1 AND (pushed & ?2) = ?3 AND xact_id>?4 ORDER BY xact_id, id;",
                   &v348);
          v189 = v348;

          v8->selectLog = v188;
          v190 = *p_context;
          v347 = v189;
          v191 = prepareSQLite3(v190, "SELECT id, xact_id, root FROM xact WHERE (pushed & ?1) = ?2 ORDER BY xact_id, id;",
                   &v347);
          v192 = v347;

          v8->selectChangeExistsLog = v191;
          v193 = *p_context;
          v346 = v192;
          v194 = prepareSQLite3(v193, "SELECT id, xact_id, pushed, root, data, type, encoding FROM xact ORDER BY root, xact_id, id;",
                   &v346);
          v195 = v346;

          v8->selectAllLog = v194;
          v196 = *p_context;
          v345 = v195;
          v197 = prepareSQLite3(v196, "INSERT INTO xact_block (id, data) VALUES (?1, ?2);", &v345);
          v198 = v345;

          v8->insertLogOptions = v197;
          v199 = *p_context;
          v344 = v198;
          v200 = prepareSQLite3(v199, "SELECT data FROM xact_block WHERE id = ?1;", &v344);
          v201 = v344;

          v8->selectLogOptions = v200;
          v202 = *p_context;
          v343 = v201;
          v203 = prepareSQLite3(v202, "UPDATE xact SET pushed=(((pushed & ?1) | ?2) | (pushed & ~?1)) WHERE id=?3;",
                   &v343);
          v204 = v343;

          v8->updateLog = v203;
          v205 = *p_context;
          v342 = v204;
          v206 = prepareSQLite3(v205, "DELETE FROM xact WHERE id=?1;", &v342);
          v207 = v342;

          v8->deleteLog = v206;
          v208 = *p_context;
          v341 = v207;
          v209 = prepareSQLite3(v208, "DELETE FROM xact WHERE ((pushed & 0xffff0000 >> 16) = (pushed & 0x0000ffff)) AND disk_committed=1", &v341);
          v210 = v341;

          v8->flushPushedXact = v209;
          v211 = *p_context;
          v340 = v210;
          v212 = prepareSQLite3(v211, "REPLACE INTO archive VALUES(?1, ?2, ?3)", &v340);
          v213 = v340;

          v8->insertArchive = v212;
          v214 = *p_context;
          v339 = v213;
          v215 = prepareSQLite3(v214, "SELECT identifier, controller_username, value from archive where identifier=?1;",
                   &v339);
          v216 = v339;

          v8->selectArchive = v215;
          if (v216)
          {
            v217 = (void *)MEMORY[0x227676638]();
            v218 = v8;
            HMFGetOSLogHandle();
            v219 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v219, OS_LOG_TYPE_ERROR))
            {
              HMFGetLogIdentifier();
              v220 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543618;
              v391 = v220;
              v392 = 2112;
              v393 = (uint64_t)v216;
              _os_log_impl(&dword_2218F0000, v219, OS_LOG_TYPE_ERROR, "%{public}@unable to prepare SQL statements: %@", buf, 0x16u);

            }
            objc_autoreleasePoolPop(v217);
            v221 = v216;
          }
          else
          {
            if (-[HMDBackingStoreLocal _numUncommittedTransactions](v8, "_numUncommittedTransactions") >= 1)
            {
              v242 = (void *)MEMORY[0x227676638]();
              v243 = v8;
              HMFGetOSLogHandle();
              v244 = (id)objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v244, OS_LOG_TYPE_ERROR))
              {
                HMFGetLogIdentifier();
                v245 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138543362;
                v391 = v245;
                _os_log_impl(&dword_2218F0000, v244, OS_LOG_TYPE_ERROR, "%{public}@We crashed after running transaction but before saving to disk.", buf, 0xCu);

              }
              objc_autoreleasePoolPop(v242);
            }
            -[HMDBackingStoreLocal _fillZoneCache](v8, "_fillZoneCache");
            v246 = (void *)objc_claimAutoreleasedReturnValue();
            if (!v246)
            {
              -[HMDBackingStoreLocal _fillStoreCache](v8, "_fillStoreCache");
              v26 = (void *)objc_claimAutoreleasedReturnValue();

              v25 = 0;
              goto LABEL_29;
            }
            v221 = v246;
          }
          v25 = v221;

          v26 = v25;
LABEL_29:

          goto LABEL_30;
        }
        v47 = v48;
      }
      v25 = v47;
      v26 = v47;
      goto LABEL_29;
    }
    v333 = v33;
    v49 = (void *)MEMORY[0x227676638]();
    v50 = v35;
    HMFGetOSLogHandle();
    v51 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v52 = (id)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v391 = v52;
      _os_log_impl(&dword_2218F0000, v51, OS_LOG_TYPE_DEFAULT, "%{public}@Validating database.", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v49);
    v53 = *p_context;
    v387 = v27;
    v54 = v50;
    selectSQLite3(v53, "SELECT name FROM sqlite_master WHERE type='table' AND name='xact_block'", MEMORY[0x24BDBD1B8], &v387);
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    v56 = v55;
    v57 = v387;
    if (v55)
      v58 = v387 == 0;
    else
      v58 = 0;
    v59 = !v58;
    context = v59;
    v334 = v53;
    v335 = v54;
    if (v58)
    {
      if (!objc_msgSend(v55, "count"))
      {
        runSQLite3(v53, "CREATE TABLE xact_block (id INTEGER PRIMARY KEY, data BLOB NOT NULL);");
        v387 = (id)objc_claimAutoreleasedReturnValue();
        if (v387)
        {
          v222 = 0;
LABEL_105:
          v270 = v335;
          goto LABEL_106;
        }
      }
    }
    else
    {
      v60 = (void *)MEMORY[0x227676638]();
      v61 = v54;
      HMFGetOSLogHandle();
      v62 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v62, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v63 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v391 = v63;
        v392 = 2112;
        v393 = (uint64_t)v56;
        v394 = 2112;
        v395 = v57;
        _os_log_impl(&dword_2218F0000, v62, OS_LOG_TYPE_ERROR, "%{public}@initial migration test failed with result / error: %@ / %@", buf, 0x20u);

      }
      objc_autoreleasePoolPop(v60);
      objc_msgSend(v57, "userInfo");
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v64, "objectForKey:", CFSTR("extcode"));
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v65, "isEqual:", &unk_24E96BF00))
      {

        v53 = v334;
      }
      else
      {
        objc_msgSend(v57, "userInfo");
        v223 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v223, "objectForKey:", CFSTR("extcode"));
        v224 = (void *)objc_claimAutoreleasedReturnValue();
        v225 = objc_msgSend(v224, "isEqual:", &unk_24E96BF18);

        v53 = v334;
        if (!v225)
        {
          objc_msgSend(MEMORY[0x24BDD1540], "hmfErrorWithCode:", 2);
          v222 = 0;
          v387 = (id)objc_claimAutoreleasedReturnValue();
          goto LABEL_105;
        }
      }
      if (isInternalBuild())
      {
        objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithFileSystemRepresentation:isDirectory:relativeToURL:", "/var/mobile/Library/homed", 1, 0);
        v226 = (void *)objc_claimAutoreleasedReturnValue();
        +[HMDTTRManager sharedManager](HMDTTRManager, "sharedManager");
        v227 = (void *)objc_claimAutoreleasedReturnValue();
        v389 = v226;
        objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v389, 1);
        v228 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v227, "requestRadarWithDisplayReason:radarTitle:componentName:componentVersion:componentID:attachments:", CFSTR("internal database is corrupt"), CFSTR("Internal Database Corruption Detected"), CFSTR("HomeKit"), CFSTR("New Bugs"), 590644, v228);

        v53 = v334;
      }
    }
    selectSQLite3(v53, "SELECT name FROM sqlite_master WHERE type='index' AND name='xact_pushed2'", MEMORY[0x24BDBD1B8], &v387);
    v229 = (void *)objc_claimAutoreleasedReturnValue();

    v230 = v387;
    if (v387)
    {
      v231 = (void *)MEMORY[0x227676638]();
      v232 = v335;
      HMFGetOSLogHandle();
      v233 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v233, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v234 = (void *)objc_claimAutoreleasedReturnValue();
        v235 = objc_msgSend(v229, "count");
        *(_DWORD *)buf = 138543874;
        v391 = v234;
        v392 = 2048;
        v393 = v235;
        v394 = 2112;
        v395 = v230;
        _os_log_impl(&dword_2218F0000, v233, OS_LOG_TYPE_ERROR, "%{public}@xact_pushed2 migration test failed with result %lu items %@", buf, 0x20u);

        v53 = v334;
      }

      objc_autoreleasePoolPop(v231);
    }
    else if (!objc_msgSend(v229, "count"))
    {
      runSQLite3(v53, "CREATE INDEX xact_pushed2 ON xact(root, xact_id, id);");
      v387 = (id)objc_claimAutoreleasedReturnValue();
      if (v387)
        goto LABEL_104;
    }
    selectSQLite3(v53, "SELECT subscription_data FROM zone_group WHERE subscription_data IS NOT NULL LIMIT 1", MEMORY[0x24BDBD1B8], &v387);
    v56 = (void *)objc_claimAutoreleasedReturnValue();

    v236 = v387;
    if (!v56 || v387)
    {
      v237 = (void *)MEMORY[0x227676638]();
      v238 = v335;
      HMFGetOSLogHandle();
      v239 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v239, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v240 = (void *)objc_claimAutoreleasedReturnValue();
        v241 = objc_msgSend(v56, "count");
        *(_DWORD *)buf = 138543874;
        v391 = v240;
        v392 = 2048;
        v393 = v241;
        v394 = 2112;
        v395 = v236;
        _os_log_impl(&dword_2218F0000, v239, OS_LOG_TYPE_ERROR, "%{public}@zone_group.subscription_data migration test failed with result %lu items %@", buf, 0x20u);

        v53 = v334;
      }

      objc_autoreleasePoolPop(v237);
      if (v236)
      {
        runSQLite3(v53, "ALTER TABLE zone_group ADD COLUMN subscription_data BLOB;");
        v387 = (id)objc_claimAutoreleasedReturnValue();
        if (v387)
          goto LABEL_71;
      }
    }
    runSQLite3(v53, "CREATE TABLE IF NOT EXISTS archive (identifier string primary key, controller_username string not null, value blob not null);");
    v387 = (id)objc_claimAutoreleasedReturnValue();
    if (v387)
    {
LABEL_71:
      v222 = 0;
      goto LABEL_105;
    }
    selectSQLite3(v53, "SELECT disk_committed FROM xact WHERE id IS NOT NULL LIMIT 1", MEMORY[0x24BDBD1B8], &v387);
    v229 = (void *)objc_claimAutoreleasedReturnValue();

    v247 = v387;
    if (v229 && !v387)
      goto LABEL_85;
    v248 = (void *)MEMORY[0x227676638]();
    v249 = v335;
    HMFGetOSLogHandle();
    v250 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v250, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v251 = (void *)objc_claimAutoreleasedReturnValue();
      v252 = objc_msgSend(v229, "count");
      *(_DWORD *)buf = 138543874;
      v391 = v251;
      v392 = 2048;
      v393 = v252;
      v394 = 2112;
      v395 = v247;
      _os_log_impl(&dword_2218F0000, v250, OS_LOG_TYPE_ERROR, "%{public}@xact.disk_committed migration test failed with result %lu items %@", buf, 0x20u);

      v53 = v334;
    }

    objc_autoreleasePoolPop(v248);
    if (!v247
      || (runSQLite3(v53, "ALTER TABLE xact ADD COLUMN disk_committed INTEGER NOT NULL DEFAULT 1;"),
          (v387 = (id)objc_claimAutoreleasedReturnValue()) == 0))
    {
LABEL_85:
      selectSQLite3(v53, "SELECT schema FROM record WHERE data IS NOT NULL LIMIT 1", MEMORY[0x24BDBD1B8], &v387);
      v253 = (void *)objc_claimAutoreleasedReturnValue();

      v254 = v387;
      if (!v253 || v387)
      {
        v255 = (void *)MEMORY[0x227676638]();
        v256 = v335;
        HMFGetOSLogHandle();
        v257 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v257, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v258 = (void *)objc_claimAutoreleasedReturnValue();
          v259 = objc_msgSend(v253, "count");
          *(_DWORD *)buf = 138543874;
          v391 = v258;
          v392 = 2048;
          v393 = v259;
          v394 = 2112;
          v395 = v254;
          _os_log_impl(&dword_2218F0000, v257, OS_LOG_TYPE_ERROR, "%{public}@record.schema migration test failed with result %lu items %@", buf, 0x20u);

          v53 = v334;
        }

        objc_autoreleasePoolPop(v255);
        context = 1;
      }
      selectSQLite3(v53, "SELECT name FROM sqlite_master WHERE type='table' AND name='zone_group'", MEMORY[0x24BDBD1B8], &v387);
      v260 = (void *)objc_claimAutoreleasedReturnValue();

      v261 = v387;
      if (!v260 || v387)
      {
        v262 = (void *)MEMORY[0x227676638]();
        v263 = v335;
        HMFGetOSLogHandle();
        v264 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v264, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v265 = (void *)objc_claimAutoreleasedReturnValue();
          v266 = objc_msgSend(v260, "count");
          *(_DWORD *)buf = 138543874;
          v391 = v265;
          v392 = 2048;
          v393 = v266;
          v394 = 2112;
          v395 = v261;
          _os_log_impl(&dword_2218F0000, v264, OS_LOG_TYPE_ERROR, "%{public}@zone_group migration test failed with result %lu items %@", buf, 0x20u);

          v53 = v334;
        }

        objc_autoreleasePoolPop(v262);
      }
      if (objc_msgSend(v260, "count"))
        v267 = context;
      else
        v267 = 1;
      selectSQLite3(v53, "SELECT type FROM record WHERE uuid = ''", MEMORY[0x24BDBD1B8], &v387);
      v268 = (void *)objc_claimAutoreleasedReturnValue();

      v269 = v387;
      if (!v268 || v387)
      {
        contexta = (void *)MEMORY[0x227676638]();
        v285 = v335;
        HMFGetOSLogHandle();
        v286 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v286, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v287 = (void *)objc_claimAutoreleasedReturnValue();
          v288 = objc_msgSend(v268, "count");
          *(_DWORD *)buf = 138543874;
          v391 = v287;
          v392 = 2048;
          v393 = v288;
          v394 = 2112;
          v395 = v269;
          _os_log_impl(&dword_2218F0000, v286, OS_LOG_TYPE_ERROR, "%{public}@record table migration test failed with result %lu items %@", buf, 0x20u);

          v53 = v334;
        }

        objc_autoreleasePoolPop(contexta);
        if (!v268)
        {
          contextb = (void *)MEMORY[0x227676638]();
          v305 = v285;
          HMFGetOSLogHandle();
          v300 = objc_claimAutoreleasedReturnValue();
          v270 = v335;
          if (os_log_type_enabled(v300, OS_LOG_TYPE_ERROR))
          {
            HMFGetLogIdentifier();
            v306 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543362;
            v391 = v306;
            _os_log_impl(&dword_2218F0000, v300, OS_LOG_TYPE_ERROR, "%{public}@record table migration test failed with nil result", buf, 0xCu);

          }
          v56 = 0;
          goto LABEL_134;
        }
        if ((v267 & 1) != 0)
          goto LABEL_101;
      }
      else if ((v267 & 1) != 0)
      {
LABEL_101:
        v56 = v268;
LABEL_130:
        v270 = v335;
        goto LABEL_142;
      }
      selectSQLite3(v53, "SELECT name FROM zone WHERE id = 0", MEMORY[0x24BDBD1B8], &v387);
      v56 = (void *)objc_claimAutoreleasedReturnValue();

      v289 = v387;
      if (!v56 || v387)
      {
        v290 = (void *)MEMORY[0x227676638]();
        v291 = v335;
        HMFGetOSLogHandle();
        v292 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v292, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v293 = (void *)objc_claimAutoreleasedReturnValue();
          v294 = objc_msgSend(v56, "count");
          *(_DWORD *)buf = 138543874;
          v391 = v293;
          v392 = 2048;
          v393 = v294;
          v394 = 2112;
          v395 = v289;
          _os_log_impl(&dword_2218F0000, v292, OS_LOG_TYPE_ERROR, "%{public}@zone migration test failed with result %lu items %@", buf, 0x20u);

          v53 = v334;
        }

        objc_autoreleasePoolPop(v290);
      }
      if (!objc_msgSend(v56, "count"))
        goto LABEL_130;
      v295 = selectSQLite3(v53, "SELECT type FROM xact WHERE id = 0", MEMORY[0x24BDBD1B8], &v387);
      v296 = v53;
      v297 = (uint64_t)v387;
      v270 = v335;
      if (v387)
      {
        v298 = (void *)MEMORY[0x227676638](v296);
        v299 = v335;
        HMFGetOSLogHandle();
        v300 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v300, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v301 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v391 = v301;
          v392 = 2112;
          v393 = v297;
          v302 = "%{public}@xact migration test failed with result %@";
          v303 = v300;
          v304 = 22;
LABEL_139:
          _os_log_impl(&dword_2218F0000, v303, OS_LOG_TYPE_ERROR, v302, buf, v304);

          goto LABEL_140;
        }
        goto LABEL_140;
      }
      selectSQLite3(v296, "SELECT id FROM xact WHERE pushed < 0x0100000000000000", MEMORY[0x24BDBD1B8], &v387);
      v307 = (void *)objc_claimAutoreleasedReturnValue();

      v308 = v387;
      if (v387 || objc_msgSend(v307, "count"))
      {
        v56 = v307;
        v298 = (void *)MEMORY[0x227676638]();
        v309 = v335;
        HMFGetOSLogHandle();
        v300 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v300, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v301 = (void *)objc_claimAutoreleasedReturnValue();
          v310 = objc_msgSend(v56, "count");
          *(_DWORD *)buf = 138543874;
          v391 = v301;
          v392 = 2048;
          v393 = v310;
          v394 = 2112;
          v395 = v308;
          v302 = "%{public}@xact version migration test failed with result %lu items %@";
          v303 = v300;
          v304 = 32;
          goto LABEL_139;
        }
LABEL_140:
        v53 = v334;
        goto LABEL_141;
      }
      if (isInternalBuild())
      {
        selectSQLite3(v334, "select uuid, share_id, count(*) from record group by uuid, group_id having count(*)>1;",
          MEMORY[0x24BDBD1B8],
          &v387);
        v56 = (void *)objc_claimAutoreleasedReturnValue();

        if (objc_msgSend(v56, "count"))
        {
          v318 = (void *)MEMORY[0x227676638]();
          v319 = v335;
          HMFGetOSLogHandle();
          v320 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v320, OS_LOG_TYPE_ERROR))
          {
            HMFGetLogIdentifier();
            v321 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543362;
            v391 = v321;
            _os_log_impl(&dword_2218F0000, v320, OS_LOG_TYPE_ERROR, "%{public}@We have duplicate records with different share_ids deleting duplicates.", buf, 0xCu);

          }
          objc_autoreleasePoolPop(v318);
          runSQLite3(v334, "delete from record where uuid in (select uuid from record group by uuid, group_id having count(*)>1) and share_id!=0;");
          v387 = (id)objc_claimAutoreleasedReturnValue();
          if (v387)
          {
            contextb = (void *)MEMORY[0x227676638]();
            v322 = v319;
            HMFGetOSLogHandle();
            v300 = objc_claimAutoreleasedReturnValue();
            if (!os_log_type_enabled(v300, OS_LOG_TYPE_ERROR))
            {
LABEL_166:
              v53 = v334;
LABEL_134:
              v298 = contextb;
LABEL_141:

              objc_autoreleasePoolPop(v298);
LABEL_142:
              if (a4)
              {
                sqlite3_close(v53);
                -[HMDBackingStoreLocal datastoreFile](v270, "datastoreFile");
                v311 = (void *)objc_claimAutoreleasedReturnValue();
                -[HMDBackingStoreLocal _createNewDatastore:](v270, "_createNewDatastore:", v311);
                v312 = v53;
                v313 = (id)objc_claimAutoreleasedReturnValue();
                v387 = v313;

                if (v313)
                {
                  if (v312)
                    sqlite3_close(v312);
                  v222 = 0;
                }
                else
                {
                  v222 = 1;
                }
              }
              else
              {
                v314 = (void *)MEMORY[0x227676638]();
                v315 = v270;
                HMFGetOSLogHandle();
                v316 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v316, OS_LOG_TYPE_ERROR))
                {
                  HMFGetLogIdentifier();
                  v317 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 138543362;
                  v391 = v317;
                  _os_log_impl(&dword_2218F0000, v316, OS_LOG_TYPE_ERROR, "%{public}@want to rebuild the databse, but not allowed to.", buf, 0xCu);

                }
                objc_autoreleasePoolPop(v314);
                objc_msgSend(MEMORY[0x24BDD1540], "hmfErrorWithCode:", 15);
                v222 = 0;
                v387 = (id)objc_claimAutoreleasedReturnValue();
              }
LABEL_106:

              v271 = v387;
              if ((v222 & 1) != 0)
              {
                objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("PRAGMA user_version = %ld;"), 2);
                v272 = (void *)objc_claimAutoreleasedReturnValue();
                v273 = *p_context;
                v274 = objc_retainAutorelease(v272);
                runSQLite3(v273, (const char *)objc_msgSend(v274, "UTF8String"));
                v275 = v270;
                v276 = (void *)objc_claimAutoreleasedReturnValue();

                v277 = (void *)MEMORY[0x227676638]();
                v278 = v275;
                HMFGetOSLogHandle();
                v279 = objc_claimAutoreleasedReturnValue();
                v280 = v279;
                if (!v276)
                {
                  v283 = v279;
                  if (os_log_type_enabled(v283, OS_LOG_TYPE_DEFAULT))
                  {
                    HMFGetLogIdentifier();
                    v284 = (id)objc_claimAutoreleasedReturnValue();
                    *(_DWORD *)buf = 138543618;
                    v391 = v284;
                    v392 = 2048;
                    v393 = 2;
                    _os_log_impl(&dword_2218F0000, v283, OS_LOG_TYPE_DEFAULT, "%{public}@Current schema version: %ld", buf, 0x16u);

                  }
                  objc_autoreleasePoolPop(v277);

                  v27 = 0;
                  v33 = v333;
                  goto LABEL_21;
                }
                v281 = v333;
                if (os_log_type_enabled(v279, OS_LOG_TYPE_ERROR))
                {
                  HMFGetLogIdentifier();
                  v282 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 138543874;
                  v391 = v282;
                  v392 = 2048;
                  v393 = 2;
                  v394 = 2112;
                  v395 = v276;
                  _os_log_impl(&dword_2218F0000, v280, OS_LOG_TYPE_ERROR, "%{public}@Unable to update schema version to %ld: %@", buf, 0x20u);

                }
                objc_autoreleasePoolPop(v277);
                v25 = v276;

              }
              else
              {
                v25 = v271;
                v281 = v333;
              }

              v26 = v25;
              goto LABEL_30;
            }
            HMFGetLogIdentifier();
            v323 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543362;
            v391 = v323;
            v324 = "%{public}@Unable to delete duplicate entries";
LABEL_165:
            _os_log_impl(&dword_2218F0000, v300, OS_LOG_TYPE_ERROR, v324, buf, 0xCu);

            goto LABEL_166;
          }
        }
        v307 = v56;
      }
      selectSQLite3(v334, "select uuid from record where share_id!=0;", MEMORY[0x24BDBD1B8], &v387);
      v56 = (void *)objc_claimAutoreleasedReturnValue();

      if (!objc_msgSend(v56, "count"))
        goto LABEL_167;
      v325 = (void *)MEMORY[0x227676638]();
      v326 = v335;
      HMFGetOSLogHandle();
      v327 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v327, OS_LOG_TYPE_DEFAULT))
      {
        HMFGetLogIdentifier();
        v328 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v391 = v328;
        _os_log_impl(&dword_2218F0000, v327, OS_LOG_TYPE_DEFAULT, "%{public}@Have records with share_id will migrate them.", buf, 0xCu);

      }
      objc_autoreleasePoolPop(v325);
      runSQLite3(v334, "update record set share_id = 0 where share_id != 0;");
      v387 = (id)objc_claimAutoreleasedReturnValue();
      if (!v387)
      {
LABEL_167:
        v222 = 1;
        goto LABEL_106;
      }
      contextb = (void *)MEMORY[0x227676638]();
      v329 = v326;
      HMFGetOSLogHandle();
      v300 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v300, OS_LOG_TYPE_ERROR))
        goto LABEL_166;
      HMFGetLogIdentifier();
      v323 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v391 = v323;
      v324 = "%{public}@Unable to migrate share_ids";
      goto LABEL_165;
    }
LABEL_104:
    v222 = 0;
    v56 = v229;
    goto LABEL_105;
  }
  -[HMDBackingStoreLocal _createNewDatastore:](v8, "_createNewDatastore:", v17);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v19)
  {
LABEL_14:
    v27 = 0;
    goto LABEL_22;
  }
  v20 = v19;
LABEL_13:
  v25 = v20;
  v26 = v20;
LABEL_30:

  return v26;
}

- (id)_begin
{
  return execSQLite3(self->begin);
}

- (id)_commit
{
  void *v3;

  if (sqlite3_get_autocommit(self->context))
  {
    v3 = 0;
  }
  else
  {
    execSQLite3(self->commit);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (void)_rollback
{
  sqlite3 *context;
  void *v4;
  void *v5;
  HMDBackingStoreLocal *v6;
  NSObject *v7;
  void *v8;
  int v9;
  void *v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  context = self->context;
  if (context && !sqlite3_get_autocommit(context))
  {
    execSQLite3(self->rollback);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      v5 = (void *)MEMORY[0x227676638]();
      v6 = self;
      HMFGetOSLogHandle();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = 138543618;
        v10 = v8;
        v11 = 2112;
        v12 = v4;
        _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_ERROR, "%{public}@ROLLBACK FAILED!: %@", (uint8_t *)&v9, 0x16u);

      }
      objc_autoreleasePoolPop(v5);
    }

  }
}

- (id)_fillStoreCache
{
  void *v3;
  int v4;
  sqlite3_int64 v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  while (1)
  {
    v4 = sqlite3_step(self->selectStores);
    if (v4 != 100)
      break;
    v5 = sqlite3_column_int64(self->selectStores, 0);
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithSQLite3Column:column:", self->selectStores, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setValue:forKey:", v7, v6);

  }
  if (v4 == 101)
  {
    if (sqlite3_reset(self->selectZones))
    {
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithSQLite3Statement:", self->selectZones);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      -[HMDBackingStoreLocal setStoreCache:](self, "setStoreCache:", v3);
      v8 = 0;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithSQLite3Statement:", self->selectZones);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (sqlite3_reset(self->selectZones))
    {
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithSQLite3Statement:", self->selectZones);
      v9 = objc_claimAutoreleasedReturnValue();

      v8 = (void *)v9;
    }
  }

  return v8;
}

- (int64_t)_numUncommittedTransactions
{
  sqlite3 *context;
  void *v4;
  id v5;
  void *v6;
  uint64_t v7;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  int64_t v13;
  void *v14;
  HMDBackingStoreLocal *v15;
  NSObject *v16;
  void *v17;
  id v19;
  uint8_t buf[4];
  void *v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  context = self->context;
  v19 = 0;
  selectSQLite3(context, "SELECT count(*) FROM xact WHERE disk_committed=0;", MEMORY[0x24BDBD1B8], &v19);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v19;
  if (!objc_msgSend(v4, "count"))
    goto LABEL_12;
  objc_msgSend(v4, "objectAtIndexedSubscript:", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");

  if (!v7 || v5 != 0)
    goto LABEL_12;
  objc_msgSend(v4, "objectAtIndexedSubscript:", 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectAtIndexedSubscript:", 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  v11 = (objc_opt_isKindOfClass() & 1) != 0 ? v10 : 0;
  v12 = v11;

  if (v12)
  {
    v13 = objc_msgSend(v12, "integerValue");

  }
  else
  {
LABEL_12:
    v14 = (void *)MEMORY[0x227676638]();
    v15 = self;
    HMFGetOSLogHandle();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v21 = v17;
      v22 = 2112;
      v23 = v5;
      _os_log_impl(&dword_2218F0000, v16, OS_LOG_TYPE_ERROR, "%{public}@Unable to determine number of uncommitted transactions %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v14);
    v13 = -1;
  }

  return v13;
}

- (id)_dropUncommittedUnpushedTransactions
{
  void *v3;
  void *v4;
  HMDBackingStoreLocal *v5;
  NSObject *v6;
  void *v7;
  int v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  runSQLite3(self->context, "DELETE FROM xact WHERE ((pushed & 0xffff0000) >> 16) = 0 AND disk_committed=0");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    v4 = (void *)MEMORY[0x227676638]();
    v5 = self;
    HMFGetOSLogHandle();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = 138543362;
      v10 = v7;
      _os_log_impl(&dword_2218F0000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@Dropped transactions that were not committed to disk.", (uint8_t *)&v9, 0xCu);

    }
    objc_autoreleasePoolPop(v4);
  }
  return v3;
}

- (id)_fetchUncommittedAndPushedTransactions
{
  sqlite3 *context;
  void *v3;
  void *v4;
  uint64_t v6;

  context = self->context;
  v6 = 0;
  selectSQLite3(context, "SELECT id, xact_id, pushed, data, type, encoding, root FROM xact WHERE ((pushed & 0xffff0000) >> 16) != 0 AND disk_committed=0 ORDER BY root, xact_id, id;",
    MEMORY[0x24BDBD1B8],
    &v6);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "na_map:", &__block_literal_global_160071);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (unint64_t)_fetchIDForStore:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  sqlite3_int64 v9;
  sqlite3_stmt *insertStore;
  id v11;
  sqlite3_stmt *v12;
  id v13;
  void *v14;
  void *v15;
  id v17;
  id v18;

  v6 = a3;
  -[HMDBackingStoreLocal storeCache](self, "storeCache");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKey:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    v9 = objc_msgSend(v8, "unsignedIntegerValue");
  }
  else
  {
    insertStore = self->insertStore;
    v18 = 0;
    bindStringSQLite3(insertStore, 1, v6, &v18);
    v11 = v18;
    v12 = self->insertStore;
    v17 = v11;
    v9 = steplastrowresetSQLite3(v12, &v17);
    v13 = v17;

    if (a4)
      *a4 = objc_retainAutorelease(v13);
    if (v13)
    {
      v9 = 0;
    }
    else
    {
      -[HMDBackingStoreLocal storeCache](self, "storeCache");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", v9);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setObject:forKey:", v15, v6);

    }
  }

  return v9;
}

- (id)_fillZoneCache
{
  void *v3;
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  id v12;
  id v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  id v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v19 = 0;
  -[HMDBackingStoreLocal _fetchZonesWithError:](self, "_fetchZonesWithError:", &v19);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v19;
  if (!v4)
  {
    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
    v5 = v3;
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v20, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v16;
      while (2)
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v16 != v8)
            objc_enumerationMutation(v5);
          v10 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
          v14 = 0;
          -[HMDBackingStoreLocal _fetchGroupsForZone:withError:](self, "_fetchGroupsForZone:withError:", v10, &v14);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = v14;
          objc_msgSend(v10, "setActualGroups:", v11);

          if (v12)
          {
            v4 = v12;

            goto LABEL_12;
          }
        }
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v20, 16);
        if (v7)
          continue;
        break;
      }
    }

    -[HMDBackingStoreLocal setZoneCache:](self, "setZoneCache:", v5);
    v4 = 0;
  }
LABEL_12:

  return v4;
}

- (int64_t)_insertZoneWithName:(id)a3 error:(id *)a4
{
  bindStringSQLite3(self->insertZone, 1, a3, a4);
  if (*a4)
    return 0;
  else
    return steplastrowresetSQLite3(self->insertZone, a4);
}

- (id)_deleteZoneWithID:(int64_t)a3
{
  sqlite3_stmt *deleteZone;
  id v5;
  id v7;

  if (!a3)
    return 0;
  deleteZone = self->deleteZone;
  v7 = 0;
  bindIntSQLite3(deleteZone, 1, a3, &v7);
  v5 = v7;
  if (!v5)
  {
    execSQLite3(self->deleteZone);
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  return v5;
}

- (id)_fetchZonesWithError:(id *)a3
{
  void *v5;
  int v6;
  sqlite3_int64 v7;
  void *v8;
  HMDBackingStoreCacheZone *v9;
  void *v10;
  int v11;
  id v12;

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  while (1)
  {
    v6 = sqlite3_step(self->selectZones);
    if (v6 != 100)
      break;
    v7 = sqlite3_column_int64(self->selectZones, 0);
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithSQLite3Column:column:", self->selectZones, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      v9 = -[HMDBackingStoreCacheZone initWithZoneID:name:]([HMDBackingStoreCacheZone alloc], "initWithZoneID:name:", v7, v8);
      objc_msgSend(v5, "addObject:", v9);

    }
  }
  if (v6 == 101)
  {
    if (!sqlite3_reset(self->selectZones))
    {
      v12 = v5;
      goto LABEL_18;
    }
    if (!a3)
    {
      v12 = 0;
      goto LABEL_18;
    }
    v10 = (void *)MEMORY[0x24BDD1540];
    goto LABEL_15;
  }
  if (a3)
  {
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithSQLite3Statement:", self->selectZones);
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  v11 = sqlite3_reset(self->selectZones);
  v12 = 0;
  if (a3 && v11)
  {
    v10 = (void *)MEMORY[0x24BDD1540];
LABEL_15:
    objc_msgSend(v10, "errorWithSQLite3Statement:", self->selectZones);
    v12 = 0;
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
LABEL_18:

  return v12;
}

- (int64_t)_insertGroupWithZoneID:(int64_t)a3 root:(id)a4 owner:(id)a5 subscription:(id)a6 error:(id *)a7
{
  sqlite3_stmt *insertGroup;
  id v13;
  id v14;
  id v15;

  insertGroup = self->insertGroup;
  v13 = a6;
  v14 = a5;
  v15 = a4;
  bindIntSQLite3(insertGroup, 1, a3, a7);
  bindStringSQLite3(self->insertGroup, 2, v15, a7);

  bindStringSQLite3(self->insertGroup, 3, v14, a7);
  bindStringSQLite3(self->insertGroup, 4, v13, a7);

  if (*a7)
    return 0;
  else
    return steplastrowresetSQLite3(self->insertGroup, a7);
}

- (id)_deleteGroupWithID:(int64_t)a3
{
  sqlite3_stmt *deleteGroup;
  id v5;
  id v7;

  if (!a3)
    return 0;
  deleteGroup = self->deleteGroup;
  v7 = 0;
  bindIntSQLite3(deleteGroup, 1, a3, &v7);
  v5 = v7;
  if (!v5)
  {
    execSQLite3(self->deleteGroup);
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  return v5;
}

- (id)_updateGroupWithID:(int64_t)a3 serverChangeToken:(id)a4
{
  sqlite3_stmt *updateGroupToken;
  void *v7;
  id v8;
  sqlite3_stmt *v9;
  id v10;
  id v11;
  void *v12;
  id v14;
  id v15;

  updateGroupToken = self->updateGroupToken;
  objc_msgSend(MEMORY[0x24BDD1618], "archivedDataWithRootObject:requiringSecureCoding:error:", a4, 1, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0;
  bindDataSQLite3(updateGroupToken, 1, v7, &v15);
  v8 = v15;

  v9 = self->updateGroupToken;
  v14 = v8;
  bindIntSQLite3(v9, 2, a3, &v14);
  v10 = v14;

  if (v10)
  {
    v11 = v10;
  }
  else
  {
    execSQLite3(self->updateGroupToken);
    v11 = (id)objc_claimAutoreleasedReturnValue();
  }
  v12 = v11;

  return v12;
}

- (id)_updateGroupWithID:(int64_t)a3 subscription:(id)a4
{
  sqlite3_stmt *updateGroupSubscription;
  void *v7;
  id v8;
  sqlite3_stmt *v9;
  id v10;
  id v11;
  void *v12;
  id v14;
  id v15;

  updateGroupSubscription = self->updateGroupSubscription;
  objc_msgSend(MEMORY[0x24BDD1618], "archivedDataWithRootObject:requiringSecureCoding:error:", a4, 1, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0;
  bindDataSQLite3(updateGroupSubscription, 1, v7, &v15);
  v8 = v15;

  v9 = self->updateGroupSubscription;
  v14 = v8;
  bindIntSQLite3(v9, 2, a3, &v14);
  v10 = v14;

  if (v10)
  {
    v11 = v10;
  }
  else
  {
    execSQLite3(self->updateGroupSubscription);
    v11 = (id)objc_claimAutoreleasedReturnValue();
  }
  v12 = v11;

  return v12;
}

- (id)_fetchGroupsForZone:(id)a3 withError:(id *)a4
{
  id v6;
  int v7;
  sqlite3_int64 v8;
  sqlite3_int64 v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  HMDBackingStoreCacheGroup *v18;
  id v19;
  id v20;
  id *v22;
  void *v23;
  void *v24;

  v6 = a3;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v23 = v6;
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  bindIntSQLite3(self->selectGroups, 1, objc_msgSend(v6, "zoneID"), a4);
  if (*a4)
  {
LABEL_15:
    v20 = 0;
    goto LABEL_16;
  }
  v22 = a4;
  while (1)
  {
    v7 = sqlite3_step(self->selectGroups);
    if (v7 != 100)
      break;
    v8 = sqlite3_column_int64(self->selectGroups, 0);
    if (v8)
    {
      v9 = v8;
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithSQLite3Column:column:", self->selectGroups, 1);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithSQLite3Column:column:", self->selectGroups, 2);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDBCE50], "dataWithSQLite3Column:column:", self->selectGroups, 3);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithSQLite3Column:column:", self->selectGroups, 4);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDBCE50], "dataWithSQLite3Column:column:", self->selectGroups, 5);
      v14 = objc_claimAutoreleasedReturnValue();
      v15 = (void *)v14;
      if (v12)
      {
        objc_msgSend(MEMORY[0x24BDD1620], "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v12, v22);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        if (v15)
          goto LABEL_7;
      }
      else
      {
        v16 = 0;
        if (v14)
        {
LABEL_7:
          objc_msgSend(MEMORY[0x24BDD1620], "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v15, v22);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          goto LABEL_10;
        }
      }
      v17 = 0;
LABEL_10:
      v18 = -[HMDBackingStoreCacheGroup initWithGroupID:zone:rootRecord:serverChangeToken:subscriptionName:owner:subscription:]([HMDBackingStoreCacheGroup alloc], "initWithGroupID:zone:rootRecord:serverChangeToken:subscriptionName:owner:subscription:", v9, v23, v10, v16, v13, v11, v17);
      objc_msgSend(v24, "addObject:", v18);

    }
  }
  if (v7 != 101)
  {
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithSQLite3Statement:", self->selectGroups);
    *v22 = (id)objc_claimAutoreleasedReturnValue();
  }
  if (!sqlite3_reset(self->selectGroups))
  {
    if (!*v22)
      goto LABEL_18;
    goto LABEL_15;
  }
  objc_msgSend(MEMORY[0x24BDD1540], "errorWithSQLite3Statement:", self->selectGroups);
  v19 = (id)objc_claimAutoreleasedReturnValue();
  *v22 = v19;
  if (v19)
    goto LABEL_15;
LABEL_18:
  v20 = v24;
LABEL_16:

  return v20;
}

- (id)_updateRecordWithGroupID:(int64_t)a3 store:(int64_t)a4 name:(id)a5 record:(id)a6 uuid:(id)a7 parentUUID:(id)a8 type:(id)a9 data:(id)a10 encoding:(int64_t)a11 schema:(id)a12
{
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  sqlite3_stmt *insertRecord;
  id v23;
  sqlite3_stmt *v24;
  id v25;
  sqlite3_stmt *v26;
  id v27;
  sqlite3_stmt *v28;
  id v29;
  sqlite3_stmt *v30;
  id v31;
  sqlite3_stmt *v32;
  id v33;
  sqlite3_stmt *v34;
  id v35;
  sqlite3_stmt *v36;
  id v37;
  sqlite3_stmt *v38;
  id v39;
  sqlite3_stmt *v40;
  id v41;
  void *v42;
  HMDBackingStoreLocal *v43;
  NSObject *v44;
  id v45;
  void *v46;
  id v47;
  void *v48;
  int64_t v50;
  id v51;
  void *v53;
  void *v54;
  id v55;
  id v56;
  id v57;
  id v58;
  id v59;
  id v60;
  id v61;
  id v62;
  id v63;
  id v64;
  id v65;
  uint8_t buf[4];
  void *v67;
  __int16 v68;
  int64_t v69;
  __int16 v70;
  void *v71;
  __int16 v72;
  id v73;
  __int16 v74;
  id v75;
  __int16 v76;
  id v77;
  __int16 v78;
  id v79;
  uint64_t v80;

  v80 = *MEMORY[0x24BDAC8D0];
  v17 = a5;
  v18 = a6;
  v55 = a7;
  v19 = a8;
  v51 = a9;
  v20 = a10;
  v21 = a12;
  insertRecord = self->insertRecord;
  v65 = 0;
  v50 = a3;
  bindIntSQLite3(insertRecord, 1, a3, &v65);
  v23 = v65;
  v24 = self->insertRecord;
  v64 = v23;
  v54 = v17;
  bindStringSQLite3(v24, 2, v17, &v64);
  v25 = v64;

  v26 = self->insertRecord;
  v63 = v25;
  v53 = v18;
  bindDataSQLite3(v26, 3, v18, &v63);
  v27 = v63;

  v28 = self->insertRecord;
  v62 = v27;
  bindStringSQLite3(v28, 4, v55, &v62);
  v29 = v62;

  v30 = self->insertRecord;
  v61 = v29;
  bindStringSQLite3(v30, 5, v19, &v61);
  v31 = v61;

  v32 = self->insertRecord;
  v60 = v31;
  bindDataSQLite3(v32, 6, v20, &v60);
  v33 = v60;

  v34 = self->insertRecord;
  v59 = v33;
  bindIntSQLite3(v34, 7, a11, &v59);
  v35 = v59;

  v36 = self->insertRecord;
  v58 = v35;
  bindStringSQLite3(v36, 8, v51, &v58);
  v37 = v58;

  v38 = self->insertRecord;
  v57 = v37;
  bindStringSQLite3(v38, 9, v21, &v57);
  v39 = v57;

  v40 = self->insertRecord;
  v56 = v39;
  bindIntSQLite3(v40, 10, a4, &v56);
  v41 = v56;

  v42 = (void *)MEMORY[0x227676638]();
  v43 = self;
  HMFGetOSLogHandle();
  v44 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v44, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier();
    v45 = v21;
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544898;
    v67 = v46;
    v68 = 2048;
    v69 = v50;
    v70 = 2112;
    v71 = v54;
    v72 = 2112;
    v73 = v55;
    v74 = 2112;
    v75 = v19;
    v76 = 2112;
    v77 = v51;
    v78 = 2112;
    v79 = v45;
    _os_log_impl(&dword_2218F0000, v44, OS_LOG_TYPE_DEBUG, "%{public}@Inserting/Updating record group: %lu, name: %@, uuid: %@, parent: %@, type: %@, schema: %@", buf, 0x48u);

    v21 = v45;
  }

  objc_autoreleasePoolPop(v42);
  if (v41)
  {
    v47 = v41;
  }
  else
  {
    execSQLite3(self->insertRecord);
    v47 = (id)objc_claimAutoreleasedReturnValue();
  }
  v48 = v47;

  return v48;
}

- (id)_updateRecordWithGroupID:(int64_t)a3 store:(int64_t)a4 record:(id)a5 data:(id)a6 encoding:(int64_t)a7
{
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  int64_t v24;
  void *v25;
  uint64_t v26;
  HMDBackingStoreLocal *v27;
  void *v28;
  int64_t v29;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  int64_t v36;
  uint64_t v37;

  v12 = a5;
  v13 = a6;
  v14 = (void *)MEMORY[0x227676638]();
  v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1618]), "initRequiringSecureCoding:", 1);
  objc_msgSend(v12, "encodeSystemFieldsWithCoder:", v15);
  objc_msgSend(v15, "finishEncoding");
  objc_msgSend(v15, "encodedData");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_autoreleasePoolPop(v14);
  v36 = a7;
  v37 = 0;
  +[HMDBackingStoreModelObject objectFromData:encoding:error:](HMDBackingStoreModelObject, "objectFromData:encoding:error:", v13, a7, &v37);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v37;
  objc_msgSend(v12, "recordID");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "recordName");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (v18)
  {
    -[HMDBackingStoreLocal _updateRecordWithGroupID:store:name:record:uuid:parentUUID:type:data:encoding:schema:](self, "_updateRecordWithGroupID:store:name:record:uuid:parentUUID:type:data:encoding:schema:", a3, a4, v20, v16, 0, 0, 0, v13, 0, 0);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v17, "uuid");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "UUIDString");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "parentUUID");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "UUIDString");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "bsoType");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    +[HMDBackingStoreSingleton sharedInstance](HMDBackingStoreSingleton, "sharedInstance");
    v22 = v12;
    v23 = v16;
    v24 = a4;
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "schemaHashForObject:", v17);
    v26 = objc_claimAutoreleasedReturnValue();
    v27 = self;
    v28 = (void *)v26;
    v29 = v24;
    v16 = v23;
    v12 = v22;
    -[HMDBackingStoreLocal _updateRecordWithGroupID:store:name:record:uuid:parentUUID:type:data:encoding:schema:](v27, "_updateRecordWithGroupID:store:name:record:uuid:parentUUID:type:data:encoding:schema:", a3, v29, v20, v16, v33, v32, v31, v13, v36, v26);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v21;
}

- (id)_updateRecordWithGroupID:(int64_t)a3 store:(int64_t)a4 record:(id)a5
{
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;

  v8 = a5;
  objc_msgSend(v8, "objectForKey:", CFSTR("k00"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "integerValue");

  if (v10)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("k%02lu"), v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKey:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v13 = v12;
    else
      v13 = 0;
    v14 = v13;

    if (v14)
      -[HMDBackingStoreLocal _updateRecordWithGroupID:store:record:data:encoding:](self, "_updateRecordWithGroupID:store:record:data:encoding:", a3, a4, v8, v14, v10);
    else
      objc_msgSend(MEMORY[0x24BDD1540], "hmfErrorWithCode:", 8);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1540], "hmfErrorWithCode:", 8);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v15;
}

- (id)_updateRecordWithGroupID:(int64_t)a3 store:(int64_t)a4 name:(id)a5 model:(id)a6
{
  id v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  id v19;

  v10 = a5;
  v19 = 0;
  objc_msgSend(a6, "encodeWithEncoding:error:", 1, &v19);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v19;
  v13 = v12;
  if (v12)
  {
    v14 = v12;
  }
  else
  {
    v15 = objc_alloc(MEMORY[0x24BDB91D8]);
    v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDB91E8]), "initWithRecordName:", v10);
    v17 = (void *)objc_msgSend(v15, "initWithRecordType:recordID:", CFSTR("ObjectRecord"), v16);
    -[HMDBackingStoreLocal _updateRecordWithGroupID:store:record:data:encoding:](self, "_updateRecordWithGroupID:store:record:data:encoding:", a3, a4, v17, v11, 1);
    v14 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v14;
}

- (id)_deleteRecordWithGroupID:(int64_t)a3 recordName:(id)a4
{
  sqlite3_stmt *deleteRecord;
  id v7;
  id v8;
  sqlite3_stmt *v9;
  id v10;
  id v11;
  void *v12;
  id v14;
  id v15;

  deleteRecord = self->deleteRecord;
  v15 = 0;
  v7 = a4;
  bindIntSQLite3(deleteRecord, 2, a3, &v15);
  v8 = v15;
  v9 = self->deleteRecord;
  v14 = v8;
  bindStringSQLite3(v9, 1, v7, &v14);

  v10 = v14;
  if (v10)
  {
    v11 = v10;
  }
  else
  {
    execSQLite3(self->deleteRecord);
    v11 = (id)objc_claimAutoreleasedReturnValue();
  }
  v12 = v11;

  return v12;
}

- (void)_fetchRecordCountWithGroupID:(int64_t)a3 callback:(id)a4
{
  id v6;
  void *v7;
  void (*v8)(void);
  void *v9;
  sqlite3_int64 v10;
  int v11;
  id v12;
  id v13;

  v12 = a4;
  v13 = 0;
  bindIntSQLite3(self->selectRecordCountGroup, 1, a3, &v13);
  v6 = v13;
  if (v6)
  {
    v7 = v6;
    v8 = (void (*)(void))*((_QWORD *)v12 + 2);
  }
  else
  {
    while (1)
    {
      v11 = sqlite3_step(self->selectRecordCountGroup);
      if (v11 != 100)
        break;
      v10 = sqlite3_column_int64(self->selectRecordCountGroup, 0);
      (*((void (**)(id, sqlite3_int64, _QWORD))v12 + 2))(v12, v10, 0);
    }
    if (v11 == 101)
    {
      sqlite3_reset(self->selectRecordCountGroup);
      goto LABEL_4;
    }
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithSQLite3Statement:", self->selectRecordCountGroup);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    sqlite3_reset(self->selectRecordCountGroup);
    v9 = v12;
    if (!v7)
      goto LABEL_5;
    v8 = (void (*)(void))*((_QWORD *)v12 + 2);
  }
  v8();

LABEL_4:
  v9 = v12;
LABEL_5:

}

- (void)_fetchRecordTypeSchemaWithGroupID:(int64_t)a3 callback:(id)a4
{
  id v6;
  void *v7;
  void (*v8)(void);
  int v9;
  void *v10;
  void *v11;
  char v12;
  void *v13;
  id v14;
  id v15;

  v14 = a4;
  v15 = 0;
  bindIntSQLite3(self->selectRecordGroupTypeSchema, 1, a3, &v15);
  v6 = v15;
  if (v6)
  {
    v7 = v6;
    v8 = (void (*)(void))*((_QWORD *)v14 + 2);
    goto LABEL_3;
  }
  while (1)
  {
    v9 = sqlite3_step(self->selectRecordGroupTypeSchema);
    if (v9 != 100)
      break;
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithSQLite3Column:column:", self->selectRecordGroupTypeSchema, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithSQLite3Column:column:", self->selectRecordGroupTypeSchema, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (*((uint64_t (**)(id, void *, void *, _QWORD))v14 + 2))(v14, v10, v11, 0);

    if ((v12 & 1) == 0)
      goto LABEL_8;
  }
  if (v9 == 101)
  {
LABEL_8:
    sqlite3_reset(self->selectRecordGroupTypeSchema);
    goto LABEL_9;
  }
  objc_msgSend(MEMORY[0x24BDD1540], "errorWithSQLite3Statement:", self->selectRecordGroupTypeSchema);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  sqlite3_reset(self->selectRecordGroupTypeSchema);
  v13 = v14;
  if (v7)
  {
    v8 = (void (*)(void))*((_QWORD *)v14 + 2);
LABEL_3:
    v8();

LABEL_9:
    v13 = v14;
  }

}

- (void)_fetchRecordMapWithGroupID:(int64_t)a3 callback:(id)a4
{
  id v6;
  void *v7;
  void (*v8)(void);
  void *v9;
  int v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  id v16;

  v15 = a4;
  v16 = 0;
  bindIntSQLite3(self->selectRecordGroupMap, 1, a3, &v16);
  v6 = v16;
  if (v6)
  {
    v7 = v6;
    v8 = (void (*)(void))*((_QWORD *)v15 + 2);
  }
  else
  {
    while (1)
    {
      v10 = sqlite3_step(self->selectRecordGroupMap);
      if (v10 != 100)
        break;
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithSQLite3Column:column:", self->selectRecordGroupMap, 0);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithSQLite3Column:column:", self->selectRecordGroupMap, 1);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithSQLite3Column:column:", self->selectRecordGroupMap, 2);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithSQLite3Column:column:", self->selectRecordGroupMap, 3);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      (*((void (**)(id, void *, void *, void *, void *, _QWORD))v15 + 2))(v15, v11, v12, v13, v14, 0);

    }
    if (v10 == 101)
    {
      sqlite3_reset(self->selectRecordGroupMap);
      goto LABEL_4;
    }
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithSQLite3Statement:", self->selectRecordGroup);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    sqlite3_reset(self->selectRecordGroupMap);
    v9 = v15;
    if (!v7)
      goto LABEL_5;
    v8 = (void (*)(void))*((_QWORD *)v15 + 2);
  }
  v8();

LABEL_4:
  v9 = v15;
LABEL_5:

}

- (void)_fetchRecordsWithGroupID:(int64_t)a3 callback:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  sqlite3_int64 v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  void (**v18)(id, _QWORD);
  id v19;

  v18 = (void (**)(id, _QWORD))a4;
  v19 = 0;
  bindIntSQLite3(self->selectRecordGroup, 1, a3, &v19);
  v6 = v19;
  if (v6)
  {
    v7 = v6;
    v18[2](v18, 0);
  }
  else
  {
    while (1)
    {
      v17 = sqlite3_step(self->selectRecordGroup);
      if (v17 != 100)
        break;
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithSQLite3Column:column:", self->selectRecordGroup, 0);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDBCE50], "dataWithSQLite3Column:column:", self->selectRecordGroup, 1);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = sqlite3_column_int64(self->selectRecordGroup, 2);
      objc_msgSend(MEMORY[0x24BDBCE50], "dataWithSQLite3Column:column:", self->selectRecordGroup, 3);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithSQLite3Column:column:", self->selectRecordGroup, 4);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithSQLite3Column:column:", self->selectRecordGroup, 5);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithSQLite3Column:column:", self->selectRecordGroup, 6);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithSQLite3Column:column:", self->selectRecordGroup, 7);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      ((void (*)(void (**)(id, _QWORD), void *, void *, sqlite3_int64, void *, void *, void *, void *, void *, _QWORD))v18[2])(v18, v9, v10, v11, v12, v13, v14, v15, v16, 0);

    }
    if (v17 == 101)
    {
      sqlite3_reset(self->selectRecordGroup);
      goto LABEL_4;
    }
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithSQLite3Statement:", self->selectRecordGroup);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    sqlite3_reset(self->selectRecordGroup);
    v8 = v18;
    if (!v7)
      goto LABEL_5;
    v18[2](v18, 0);
  }

LABEL_4:
  v8 = v18;
LABEL_5:

}

- (void)_fetchRecordsWithGroupID:(int64_t)a3 uuids:(id)a4 callback:(id)a5
{
  id v8;
  id v9;
  sqlite3_stmt *selectRecordUUID;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  id v17;
  id v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  id v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v8 = a4;
  v9 = a5;
  if (a3)
  {
    selectRecordUUID = self->selectRecordUUID;
    v23 = 0;
    bindIntSQLite3(selectRecordUUID, 2, a3, &v23);
    a3 = (int64_t)v23;
  }
  else
  {
    selectRecordUUID = self->selectRecordUUIDNoShare;
  }
  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v11 = v8;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v20;
    while (2)
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v20 != v14)
          objc_enumerationMutation(v11);
        objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * i), "UUIDString");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = (id)a3;
        bindStringSQLite3(selectRecordUUID, 1, v16, &v18);
        v17 = v18;

        if (v17)
        {
          sqlite3_reset(selectRecordUUID);
          (*((void (**)(id, _QWORD, _QWORD, _QWORD, _QWORD, id))v9 + 2))(v9, 0, 0, 0, 0, v17);
          goto LABEL_17;
        }
        _handleFetchWithRawCallback(selectRecordUUID, v9);
        a3 = objc_claimAutoreleasedReturnValue();

        if (a3)
        {
          v17 = 0;
          goto LABEL_17;
        }
      }
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
      a3 = 0;
      v17 = 0;
      if (v13)
        continue;
      break;
    }
  }
  else
  {
    v17 = (id)a3;
  }
LABEL_17:

}

- (id)_fetchRecordWithUUID:(id)a3 root:(id)a4 error:(id *)a5
{
  sqlite3_stmt *selectRecordUUIDNoShare;
  void *v8;
  id v9;
  void *v10;
  id v11;
  int v12;
  sqlite3_int64 v13;
  void *v14;
  int v15;
  id v16;
  id v18;
  id v19;

  if (a5)
    *a5 = 0;
  selectRecordUUIDNoShare = self->selectRecordUUIDNoShare;
  objc_msgSend(a3, "UUIDString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = 0;
  bindStringSQLite3(selectRecordUUIDNoShare, 1, v8, &v19);
  v9 = v19;

  sqlite3_reset(self->selectRecordUUIDNoShare);
  if (v9)
  {
    if (a5)
    {
      v9 = objc_retainAutorelease(v9);
      v10 = 0;
      v11 = 0;
      *a5 = v9;
      goto LABEL_23;
    }
    v10 = 0;
LABEL_19:
    v11 = 0;
    goto LABEL_23;
  }
  v12 = sqlite3_step(self->selectRecordUUIDNoShare);
  if (v12 != 100)
  {
    if (a5 && v12 != 101)
    {
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithSQLite3Statement:", self->selectRecordUUIDNoShare);
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }
    sqlite3_reset(self->selectRecordUUIDNoShare);
    v10 = 0;
    v9 = 0;
    goto LABEL_19;
  }
  v13 = sqlite3_column_int64(self->selectRecordUUIDNoShare, 2);
  objc_msgSend(MEMORY[0x24BDBCE50], "dataWithSQLite3Column:column:", self->selectRecordUUIDNoShare, 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = sqlite3_step(self->selectRecordUUIDNoShare);
  if (a5 && v15 != 101)
  {
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithSQLite3Statement:", self->selectRecordUUIDNoShare);
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  sqlite3_reset(self->selectRecordUUIDNoShare);
  v18 = 0;
  +[HMDBackingStoreModelObject objectFromData:encoding:error:](HMDBackingStoreModelObject, "objectFromData:encoding:error:", v14, v13, &v18);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v18;
  v9 = v16;
  if (v16)
  {
    if (a5 && !*a5)
    {
      v11 = 0;
      *a5 = objc_retainAutorelease(v16);
    }
    else
    {
      v11 = 0;
    }
  }
  else
  {
    v11 = v10;
  }

LABEL_23:
  return v11;
}

- (void)_fetchRecordsWithGroupID:(int64_t)a3 parentUuids:(id)a4 callback:(id)a5
{
  id v8;
  id v9;
  sqlite3_stmt *selectRecordParentUUID;
  id v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  sqlite3_stmt *v17;
  void *v18;
  id v19;
  sqlite3_stmt *v20;
  id v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  id v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v8 = a4;
  v9 = a5;
  selectRecordParentUUID = self->selectRecordParentUUID;
  v26 = 0;
  bindIntSQLite3(selectRecordParentUUID, 2, a3, &v26);
  v11 = v26;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v12 = v8;
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v23;
    while (2)
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v23 != v15)
          objc_enumerationMutation(v12);
        v17 = self->selectRecordParentUUID;
        objc_msgSend(*(id *)(*((_QWORD *)&v22 + 1) + 8 * i), "UUIDString");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = v11;
        bindStringSQLite3(v17, 1, v18, &v21);
        v19 = v21;

        v20 = self->selectRecordParentUUID;
        if (v19)
        {
          sqlite3_reset(v20);
          (*((void (**)(id, _QWORD, _QWORD, _QWORD, _QWORD, id))v9 + 2))(v9, 0, 0, 0, 0, v19);
          goto LABEL_14;
        }
        _handleFetchWithRawCallback(v20, v9);
        v11 = (id)objc_claimAutoreleasedReturnValue();

        if (v11)
        {
          v19 = 0;
          goto LABEL_14;
        }
      }
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
      v11 = 0;
      v19 = 0;
      if (v14)
        continue;
      break;
    }
  }
  else
  {
    v19 = v11;
  }
LABEL_14:

}

- (void)_fetchRecordsWithGroupID:(int64_t)a3 parent:(id)a4 type:(id)a5 callback:(id)a6
{
  id v10;
  id v11;
  sqlite3_stmt *selectRecordParent;
  void *v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;

  v17 = a4;
  v10 = a5;
  v11 = a6;
  if (a3)
  {
    selectRecordParent = self->selectRecordParent;
    v21 = 0;
    bindIntSQLite3(selectRecordParent, 3, a3, &v21);
    a3 = (int64_t)v21;
  }
  else
  {
    selectRecordParent = self->selectRecordParentNoShare;
  }
  objc_msgSend(v17, "UUIDString", v17);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = (id)a3;
  bindStringSQLite3(selectRecordParent, 1, v13, &v20);
  v14 = v20;

  v19 = v14;
  bindStringSQLite3(selectRecordParent, 2, v10, &v19);
  v15 = v19;

  if (v15)
  {
    sqlite3_reset(selectRecordParent);
    (*((void (**)(id, _QWORD, _QWORD, _QWORD, _QWORD, id))v11 + 2))(v11, 0, 0, 0, 0, v15);
  }
  else
  {
    v16 = _handleFetchWithRawCallback(selectRecordParent, v11);
  }

}

- (void)_fetchRecordsWithGroupID:(int64_t)a3 names:(id)a4 callback:(id)a5
{
  id v8;
  id v9;
  sqlite3_stmt *selectRecordName;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  id v17;
  id v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  id v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v8 = a4;
  v9 = a5;
  if (a3)
  {
    selectRecordName = self->selectRecordName;
    v23 = 0;
    bindIntSQLite3(selectRecordName, 2, a3, &v23);
    a3 = (int64_t)v23;
  }
  else
  {
    selectRecordName = self->selectRecordNameNoShare;
  }
  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v11 = v8;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v20;
    while (2)
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v20 != v14)
          objc_enumerationMutation(v11);
        v16 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
        v18 = (id)a3;
        bindStringSQLite3(selectRecordName, 1, v16, &v18);
        v17 = v18;

        if (v17)
        {
          (*((void (**)(id, _QWORD, _QWORD, _QWORD, _QWORD, id))v9 + 2))(v9, 0, 0, 0, 0, v17);
          goto LABEL_17;
        }
        _handleFetchWithRawCallback(selectRecordName, v9);
        a3 = objc_claimAutoreleasedReturnValue();

        if (a3)
        {
          v17 = 0;
          goto LABEL_17;
        }
      }
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
      a3 = 0;
      v17 = 0;
      if (v13)
        continue;
      break;
    }
  }
  else
  {
    v17 = (id)a3;
  }
LABEL_17:

}

- (void)_selectAllRecords:(id)a3
{
  int v4;
  void *v5;
  sqlite3_int64 v6;
  sqlite3_int64 v7;
  void *v8;
  void *v9;
  sqlite3_int64 v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t (**v14)(id, void *, sqlite3_int64, sqlite3_int64, void *, void *, sqlite3_int64, void *, void *, _QWORD);

  v14 = (uint64_t (**)(id, void *, sqlite3_int64, sqlite3_int64, void *, void *, sqlite3_int64, void *, void *, _QWORD))a3;
  while (1)
  {
    v4 = sqlite3_step(self->selectRecords);
    if (v4 != 100)
      break;
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithSQLite3Column:column:", self->selectRecords, 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = sqlite3_column_int64(self->selectRecords, 1);
    v7 = sqlite3_column_int64(self->selectRecords, 2);
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithSQLite3Column:column:", self->selectRecords, 3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithSQLite3Column:column:", self->selectRecords, 4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = sqlite3_column_int64(self->selectRecords, 5);
    objc_msgSend(MEMORY[0x24BDBCE50], "dataWithSQLite3Column:column:", self->selectRecords, 6);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCE50], "dataWithSQLite3Column:column:", self->selectRecords, 7);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v6) = v14[2](v14, v5, v6, v7, v8, v9, v10, v11, v12, 0);

    if ((v6 & 1) != 0)
      goto LABEL_7;
  }
  if ((v4 & 0xFFFFFFFE) != 0x64)
  {
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithSQLite3Statement:", self->selectRecords);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    ((uint64_t (**)(id, void *, sqlite3_int64, sqlite3_int64, void *, void *, sqlite3_int64, void *, void *, void *))v14)[2](v14, 0, 0, 0, 0, 0, 0, 0, 0, v13);

  }
LABEL_7:
  sqlite3_reset(self->selectRecords);

}

- (unint64_t)_insertLogWithRoot:(id)a3 transaction:(id)a4 set:(int64_t)a5 error:(id *)a6
{
  id v10;
  id v11;
  void *v12;
  uint64_t v13;
  id v14;
  unint64_t insert_rowid;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  sqlite3_stmt **p_insertLog;
  sqlite3_stmt *insertLog;
  id v23;
  sqlite3_stmt *v24;
  id v25;
  sqlite3_stmt *v26;
  id v27;
  sqlite3_stmt *v28;
  id v29;
  sqlite3_stmt *v30;
  void *v31;
  sqlite3_int64 v32;
  id v33;
  sqlite3_stmt *v34;
  uint64_t v35;
  sqlite3_stmt **p_updateLogXactID;
  sqlite3_stmt *updateLogXactID;
  id v38;
  void *v39;
  id *v41;
  id v42;
  void *v43;
  id obj;
  uint64_t v45;
  sqlite3_int64 v46;
  uint64_t v47;
  id v48;
  id v49;
  id v50;
  id v51;
  id v52;
  id v53;
  id v54;
  id v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  _BYTE v60[128];
  uint64_t v61;

  v61 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  objc_msgSend(v10, "encodeForKey");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  execSQLite3(self->flushPushedXact);
  v13 = objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    v14 = (id)v13;
    if (a6)
    {
LABEL_3:
      v14 = objc_retainAutorelease(v14);
      insert_rowid = 0;
      *a6 = v14;
      goto LABEL_28;
    }
LABEL_27:
    insert_rowid = 0;
    goto LABEL_28;
  }
  v58 = 0u;
  v59 = 0u;
  v56 = 0u;
  v57 = 0u;
  objc_msgSend(v11, "objects");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v45 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v56, v60, 16);
  if (v45)
  {
    v46 = a5;
    v41 = a6;
    v42 = v10;
    insert_rowid = 0;
    v47 = *(_QWORD *)v57;
    v43 = v11;
LABEL_6:
    v16 = 0;
    while (1)
    {
      if (*(_QWORD *)v57 != v47)
        objc_enumerationMutation(obj);
      v17 = *(void **)(*((_QWORD *)&v56 + 1) + 8 * v16);
      v18 = (void *)MEMORY[0x227676638]();
      objc_msgSend(v17, "change");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v55 = 0;
      objc_msgSend(v19, "encodeWithEncoding:error:", 1, &v55);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = v55;

      if (!v20)
        break;
      p_insertLog = &self->insertLog;
      insertLog = self->insertLog;
      v54 = v14;
      bindIntSQLite3(insertLog, 1, v46, &v54);
      v23 = v54;

      v24 = self->insertLog;
      v53 = v23;
      bindStringSQLite3(v24, 2, v12, &v53);
      v25 = v53;

      v26 = self->insertLog;
      v52 = v25;
      bindDataSQLite3(v26, 3, v20, &v52);
      v27 = v52;

      v28 = self->insertLog;
      v51 = v27;
      bindIntSQLite3(v28, 4, insert_rowid, &v51);
      v29 = v51;

      v30 = self->insertLog;
      objc_msgSend(v17, "change");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = objc_msgSend(v31, "objectChangeType");
      v50 = v29;
      bindIntSQLite3(v30, 5, v32, &v50);
      v33 = v50;

      v34 = self->insertLog;
      v49 = v33;
      bindIntSQLite3(v34, 6, 1, &v49);
      v14 = v49;

      if (v14)
        break;
      execSQLite3(*p_insertLog);
      v35 = objc_claimAutoreleasedReturnValue();
      if (v35)
        goto LABEL_24;
      if (!insert_rowid)
      {
        insert_rowid = sqlite3_last_insert_rowid(self->context);
        p_updateLogXactID = &self->updateLogXactID;
        updateLogXactID = self->updateLogXactID;
        v48 = 0;
        bindIntSQLite3(updateLogXactID, 1, insert_rowid, &v48);
        v38 = v48;
        execSQLite3(self->updateLogXactID);
        v14 = (id)objc_claimAutoreleasedReturnValue();

        if (v14)
          break;
        if (sqlite3_reset(*p_updateLogXactID))
          goto LABEL_23;
        objc_msgSend(v43, "options");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMDBackingStoreLocal _insertLogOptionsWithID:options:](self, "_insertLogOptionsWithID:options:", insert_rowid, v39);
        v14 = (id)objc_claimAutoreleasedReturnValue();

        if (v14)
          break;
      }
      if (sqlite3_reset(*p_insertLog))
      {
        p_updateLogXactID = &self->insertLog;
LABEL_23:
        objc_msgSend(MEMORY[0x24BDD1540], "errorWithSQLite3Statement:", *p_updateLogXactID);
        v35 = objc_claimAutoreleasedReturnValue();
LABEL_24:
        v14 = (id)v35;
        break;
      }

      objc_autoreleasePoolPop(v18);
      if (v45 == ++v16)
      {
        v10 = v42;
        v11 = v43;
        v45 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v56, v60, 16);
        if (v45)
          goto LABEL_6;
        goto LABEL_21;
      }
    }
    v10 = v42;
    v11 = v43;

    objc_autoreleasePoolPop(v18);
    if (!v14)
      goto LABEL_28;
    a6 = v41;
    if (v41)
      goto LABEL_3;
    goto LABEL_27;
  }
  insert_rowid = 0;
LABEL_21:

  v14 = 0;
LABEL_28:

  return insert_rowid;
}

- (void)_selectLogWithRoot:(id)a3 after:(int64_t)a4 mask:(int64_t)a5 compare:(int64_t)a6 callback:(id)a7
{
  sqlite3_stmt *selectLog;
  void *v13;
  id v14;
  sqlite3_stmt *v15;
  id v16;
  sqlite3_stmt *v17;
  id v18;
  sqlite3_stmt *v19;
  id v20;
  sqlite3_stmt *v21;
  uint64_t (**v22)(id, sqlite3_int64, sqlite3_int64, sqlite3_int64, sqlite3_int64, sqlite3_int64, void *, _QWORD);
  int v23;
  sqlite3_int64 v24;
  sqlite3_int64 v25;
  sqlite3_int64 v26;
  sqlite3_int64 v27;
  sqlite3_int64 v28;
  void *v29;
  void *v30;
  id v31;
  id v32;
  id v33;
  id v34;
  id v35;

  v31 = a7;
  selectLog = self->selectLog;
  objc_msgSend(a3, "encodeForKey");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = 0;
  bindStringSQLite3(selectLog, 1, v13, &v35);
  v14 = v35;

  v15 = self->selectLog;
  v34 = v14;
  bindIntSQLite3(v15, 2, a5, &v34);
  v16 = v34;

  v17 = self->selectLog;
  v33 = v16;
  bindIntSQLite3(v17, 3, a6, &v33);
  v18 = v33;

  v19 = self->selectLog;
  v32 = v18;
  bindIntSQLite3(v19, 4, a4, &v32);
  v20 = v32;

  if (v20)
  {
    (*((void (**)(id, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, id))v31 + 2))(v31, 0, 0, 0, 0, 0, 0, v20);
  }
  else
  {
    v21 = self->selectLog;
    v22 = (uint64_t (**)(id, sqlite3_int64, sqlite3_int64, sqlite3_int64, sqlite3_int64, sqlite3_int64, void *, _QWORD))v31;
    while (1)
    {
      v23 = sqlite3_step(v21);
      if (v23 != 100)
        break;
      v24 = sqlite3_column_int64(v21, 0);
      v25 = sqlite3_column_int64(v21, 1);
      v26 = sqlite3_column_int64(v21, 2);
      v27 = sqlite3_column_int64(v21, 4);
      v28 = sqlite3_column_int64(v21, 5);
      objc_msgSend(MEMORY[0x24BDBCE50], "dataWithSQLite3Column:column:", v21, 3);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      LOBYTE(v24) = v22[2](v22, v24, v25, v26, v27, v28, v29, 0);

      if ((v24 & 1) != 0)
        goto LABEL_9;
    }
    if ((v23 & 0xFFFFFFFE) != 0x64)
    {
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithSQLite3Statement:", v21);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      ((uint64_t (**)(id, sqlite3_int64, sqlite3_int64, sqlite3_int64, sqlite3_int64, sqlite3_int64, void *, void *))v22)[2](v22, 0, 0, 0, 0, 0, 0, v30);

    }
LABEL_9:
    sqlite3_reset(v21);

  }
}

- (void)_selectLogWithMask:(int64_t)a3 compare:(int64_t)a4 callback:(id)a5
{
  sqlite3_stmt *selectChangeExistsLog;
  id v9;
  sqlite3_stmt *v10;
  id v11;
  int v12;
  sqlite3_int64 v13;
  sqlite3_int64 v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  id v21;

  v19 = a5;
  selectChangeExistsLog = self->selectChangeExistsLog;
  v21 = 0;
  bindIntSQLite3(selectChangeExistsLog, 1, a3, &v21);
  v9 = v21;
  v10 = self->selectChangeExistsLog;
  v20 = v9;
  bindIntSQLite3(v10, 2, a4, &v20);
  v11 = v20;

  if (v11)
  {
    (*((void (**)(id, _QWORD, _QWORD, _QWORD, id))v19 + 2))(v19, 0, 0, 0, v11);
  }
  else
  {
    while (1)
    {
      v12 = sqlite3_step(self->selectChangeExistsLog);
      if (v12 != 100)
        break;
      v13 = sqlite3_column_int64(self->selectChangeExistsLog, 0);
      v14 = sqlite3_column_int64(self->selectChangeExistsLog, 1);
      v15 = (void *)MEMORY[0x24BDB91E8];
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithSQLite3Column:column:", self->selectChangeExistsLog, 2);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "parseFromString:", v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      LOBYTE(v13) = (*((uint64_t (**)(id, sqlite3_int64, sqlite3_int64, void *, _QWORD))v19 + 2))(v19, v13, v14, v17, 0);

      if ((v13 & 1) != 0)
        goto LABEL_8;
    }
    if ((v12 & 0xFFFFFFFE) != 0x64)
    {
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithSQLite3Statement:", self->selectChangeExistsLog);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      (*((void (**)(id, _QWORD, _QWORD, _QWORD, void *))v19 + 2))(v19, 0, 0, 0, v18);

    }
LABEL_8:
    sqlite3_reset(self->selectChangeExistsLog);
  }

}

- (id)_insertLogOptionsWithID:(int64_t)a3 options:(id)a4
{
  sqlite3_stmt *insertLogOptions;
  id v7;
  id v8;
  sqlite3_stmt *v9;
  void *v10;
  id v11;
  id v13;
  id v14;

  insertLogOptions = self->insertLogOptions;
  v14 = 0;
  v7 = a4;
  bindIntSQLite3(insertLogOptions, 1, a3, &v14);
  v8 = v14;
  v9 = self->insertLogOptions;
  encodeRootObject();
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = v8;
  bindDataSQLite3(v9, 2, v10, &v13);
  v11 = v13;

  if (!v11)
  {
    execSQLite3(self->insertLogOptions);
    v11 = (id)objc_claimAutoreleasedReturnValue();
  }
  return v11;
}

- (id)_selectLogOptionsWithID:(int64_t)a3
{
  sqlite3_stmt *selectLogOptions;
  void *v6;
  int v7;
  void *v8;
  HMDBackingStoreLocal *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  HMDBackingStoreLocal *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  id v19;
  id v20;
  uint8_t buf[4];
  void *v22;
  __int16 v23;
  int64_t v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  selectLogOptions = self->selectLogOptions;
  v20 = 0;
  bindIntSQLite3(selectLogOptions, 1, a3, &v20);
  v19 = v20;
  v6 = 0;
  while (1)
  {
    v7 = sqlite3_step(self->selectLogOptions);
    if (v7 != 100)
      break;
    if (v6)
    {
      v8 = (void *)MEMORY[0x227676638]();
      v9 = self;
      HMFGetOSLogHandle();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v22 = v11;
        v23 = 2048;
        v24 = a3;
        _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_ERROR, "%{public}@Got multiple results for xact_block %lu (using first one)", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v8);
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDBCE50], "dataWithSQLite3Column:column:", self->selectLogOptions, 0);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }
  if (v7 != 101)
  {
    v12 = (void *)MEMORY[0x227676638]();
    v13 = self;
    HMFGetOSLogHandle();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithSQLite3Statement:", self->selectLogOptions);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v22 = v15;
      v23 = 2112;
      v24 = (int64_t)v16;
      _os_log_impl(&dword_2218F0000, v14, OS_LOG_TYPE_ERROR, "%{public}@unexpected error to selectLogOptions: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v12);
  }
  sqlite3_reset(self->selectLogOptions);
  if (v6)
  {
    objc_msgSend(MEMORY[0x24BDD1620], "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v6, 0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v17 = 0;
  }

  return v17;
}

- (void)_selectAllLog:(id)a3
{
  int v4;
  sqlite3_int64 v5;
  sqlite3_int64 v6;
  sqlite3_int64 v7;
  sqlite3_int64 v8;
  sqlite3_int64 v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t (**v13)(id, sqlite3_int64, sqlite3_int64, sqlite3_int64, sqlite3_int64, sqlite3_int64, void *, void *, _QWORD);

  v13 = (uint64_t (**)(id, sqlite3_int64, sqlite3_int64, sqlite3_int64, sqlite3_int64, sqlite3_int64, void *, void *, _QWORD))a3;
  while (1)
  {
    v4 = sqlite3_step(self->selectAllLog);
    if (v4 != 100)
      break;
    v5 = sqlite3_column_int64(self->selectAllLog, 0);
    v6 = sqlite3_column_int64(self->selectAllLog, 1);
    v7 = sqlite3_column_int64(self->selectAllLog, 2);
    v8 = sqlite3_column_int64(self->selectAllLog, 5);
    v9 = sqlite3_column_int64(self->selectAllLog, 6);
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithSQLite3Column:column:", self->selectAllLog, 3);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCE50], "dataWithSQLite3Column:column:", self->selectAllLog, 4);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v5) = v13[2](v13, v5, v6, v7, v8, v9, v10, v11, 0);

    if ((v5 & 1) != 0)
      goto LABEL_7;
  }
  if ((v4 & 0xFFFFFFFE) != 0x64)
  {
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithSQLite3Statement:", self->selectAllLog);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    ((uint64_t (**)(id, sqlite3_int64, sqlite3_int64, sqlite3_int64, sqlite3_int64, sqlite3_int64, void *, void *, void *))v13)[2](v13, 0, 0, 0, 0, 0, 0, 0, v12);

  }
LABEL_7:
  sqlite3_reset(self->selectAllLog);

}

- (id)_updateLog:(int64_t)a3 mask:(int64_t)a4 set:(int64_t)a5
{
  sqlite3_stmt *updateLog;
  id v9;
  sqlite3_stmt *v10;
  id v11;
  sqlite3_stmt *v12;
  id v13;
  id v14;
  void *v15;
  id v17;
  id v18;
  id v19;

  updateLog = self->updateLog;
  v19 = 0;
  bindIntSQLite3(updateLog, 1, a4, &v19);
  v9 = v19;
  v10 = self->updateLog;
  v18 = v9;
  bindIntSQLite3(v10, 2, a5, &v18);
  v11 = v18;

  v12 = self->updateLog;
  v17 = v11;
  bindIntSQLite3(v12, 3, a3, &v17);
  v13 = v17;

  if (v13)
  {
    v14 = v13;
  }
  else
  {
    execSQLite3(self->updateLog);
    v14 = (id)objc_claimAutoreleasedReturnValue();
  }
  v15 = v14;

  return v15;
}

- (id)_deleteLog:(int64_t)a3
{
  sqlite3_stmt *deleteLog;
  id v5;
  void *v6;
  id v7;
  void *v8;
  id v10;

  deleteLog = self->deleteLog;
  v10 = 0;
  bindIntSQLite3(deleteLog, 1, a3, &v10);
  v5 = v10;
  v6 = v5;
  if (v5)
  {
    v7 = v5;
  }
  else
  {
    execSQLite3(self->deleteLog);
    v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  v8 = v7;

  return v8;
}

- (unint64_t)_insertArchive:(id)a3 identifier:(id)a4 controllerUserName:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  sqlite3_int64 v15;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  execSQLite3(self->updateLogToDiskCommited);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (!v13)
  {
    bindStringSQLite3(self->insertArchive, 1, v11, a6);
    bindStringSQLite3(self->insertArchive, 2, v12, a6);
    bindDataSQLite3(self->insertArchive, 3, v10, a6);
    if (!*a6)
    {
      v15 = steplastrowresetSQLite3(self->insertArchive, a6);
      goto LABEL_7;
    }
    goto LABEL_5;
  }
  if (!a6)
  {
LABEL_5:
    v15 = 0;
    goto LABEL_7;
  }
  v15 = 0;
  *a6 = objc_retainAutorelease(v13);
LABEL_7:

  return v15;
}

- (BOOL)_selectArchiveWithIdentifier:(id)a3 archive:(id *)a4 controllerUserName:(id *)a5 error:(id *)a6
{
  sqlite3_stmt *selectArchive;
  id v11;
  sqlite3_stmt *v12;
  BOOL v13;
  int v14;
  void *v15;
  void *v16;
  int v17;
  id v19;

  selectArchive = self->selectArchive;
  v19 = 0;
  bindStringSQLite3(selectArchive, 1, a3, &v19);
  v11 = v19;
  v12 = self->selectArchive;
  if (v11)
  {
    sqlite3_reset(v12);
    if (a6)
    {
      v13 = 0;
      *a6 = objc_retainAutorelease(v11);
      goto LABEL_14;
    }
LABEL_13:
    v13 = 0;
    goto LABEL_14;
  }
  v14 = sqlite3_step(v12);
  if (v14 != 100)
  {
    if (a6 && v14 != 101)
    {
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithSQLite3Statement:", self->selectArchive);
      *a6 = (id)objc_claimAutoreleasedReturnValue();
    }
    sqlite3_reset(self->selectArchive);
    goto LABEL_13;
  }
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithSQLite3Column:column:", self->selectArchive, 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCE50], "dataWithSQLite3Column:column:", self->selectArchive, 2);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = sqlite3_step(self->selectArchive);
  if (a6 && v17 != 101)
  {
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithSQLite3Statement:", self->selectArchive);
    *a6 = (id)objc_claimAutoreleasedReturnValue();
  }
  sqlite3_reset(self->selectArchive);
  *a4 = (id)objc_msgSend(v16, "copy");
  *a5 = (id)objc_msgSend(v15, "copy");

  v13 = 1;
LABEL_14:

  return v13;
}

- (id)logIdentifier
{
  return CFSTR("BackingStore");
}

- (NSString)datastoreFile
{
  return self->_datastoreFile;
}

- (NSMutableArray)zoneCache
{
  return self->_zoneCache;
}

- (void)setZoneCache:(id)a3
{
  objc_storeStrong((id *)&self->_zoneCache, a3);
}

- (NSMutableDictionary)storeCache
{
  return self->_storeCache;
}

- (void)setStoreCache:(id)a3
{
  objc_storeStrong((id *)&self->_storeCache, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_storeCache, 0);
  objc_storeStrong((id *)&self->_zoneCache, 0);
  objc_storeStrong((id *)&self->_datastoreFile, 0);
}

HMDBackingStoreLogRecord *__62__HMDBackingStoreLocal__fetchUncommittedAndPushedTransactions__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  HMDBackingStoreLogRecord *v3;

  v2 = a2;
  v3 = -[HMDBackingStoreLogRecord initWithArray:]([HMDBackingStoreLogRecord alloc], "initWithArray:", v2);

  return v3;
}

void __30__HMDBackingStoreLocal_flush___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

+ (void)cleanDatastoreFilesAt:(id)a3 everything:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  id v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  id v27;
  NSObject *v28;
  void *v29;
  id v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t i;
  void *v35;
  void *v36;
  void *v37;
  uint64_t v38;
  void *v40;
  void *v41;
  void *v42;
  id v43;
  id v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  id v49;
  id v50;
  uint8_t v51[128];
  uint8_t buf[4];
  void *v53;
  __int16 v54;
  void *v55;
  __int16 v56;
  id v57;
  uint64_t v58;

  v4 = a4;
  v58 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  if (objc_msgSend(v6, "isEqualToString:", CFSTR(":memory:")))
  {
    v7 = (void *)MEMORY[0x227676638]();
    v8 = a1;
    HMFGetOSLogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v53 = v10;
      _os_log_impl(&dword_2218F0000, v9, OS_LOG_TYPE_INFO, "%{public}@Skipping because in memory store was specified.", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v7);
  }
  else
  {
    v11 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(v6, "lastPathComponent");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "stringWithFormat:", CFSTR("^%@(?:|-shm|-wal)(\\..*)?$"), v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v50 = 0;
    objc_msgSend(MEMORY[0x24BDD1798], "regularExpressionWithPattern:options:error:", v13, 0, &v50);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v50;
    if (v15)
    {
      v16 = v15;
      v17 = (void *)MEMORY[0x227676638]();
      v18 = a1;
      HMFGetOSLogHandle();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v53 = v20;
        v54 = 2112;
        v55 = v16;
        _os_log_impl(&dword_2218F0000, v19, OS_LOG_TYPE_ERROR, "%{public}@unable to compile expression: %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v17);
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "stringByDeletingLastPathComponent");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v49 = 0;
      objc_msgSend(v21, "contentsOfDirectoryAtPath:error:", v22, &v49);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = v49;
      v25 = (void *)objc_msgSend(v23, "mutableCopy");

      v44 = v24;
      if (v24)
      {
        v26 = (void *)MEMORY[0x227676638]();
        v27 = a1;
        HMFGetOSLogHandle();
        v28 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          v53 = v29;
          v54 = 2112;
          v55 = v22;
          v56 = 2112;
          v57 = v44;
          _os_log_impl(&dword_2218F0000, v28, OS_LOG_TYPE_ERROR, "%{public}@unable to get files in %@ (%@)", buf, 0x20u);

        }
        objc_autoreleasePoolPop(v26);
      }
      else
      {
        v42 = v13;
        v43 = v6;
        v47 = 0u;
        v48 = 0u;
        v45 = 0u;
        v46 = 0u;
        v41 = v25;
        v30 = v25;
        v31 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v45, v51, 16);
        if (v31)
        {
          v32 = v31;
          v33 = *(_QWORD *)v46;
          do
          {
            for (i = 0; i != v32; ++i)
            {
              if (*(_QWORD *)v46 != v33)
                objc_enumerationMutation(v30);
              v35 = *(void **)(*((_QWORD *)&v45 + 1) + 8 * i);
              objc_msgSend(v14, "firstMatchInString:options:range:", v35, 0, 0, objc_msgSend(v35, "length"));
              v36 = (void *)objc_claimAutoreleasedReturnValue();
              v37 = v36;
              if (v36)
              {
                objc_msgSend(v36, "rangeAtIndex:", 1);
                if (v38 || v4)
                {
                  objc_msgSend(v22, "stringByAppendingPathComponent:", v35);
                  v40 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v21, "removeItemAtPath:error:", v40, 0);

                }
              }

            }
            v32 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v45, v51, 16);
          }
          while (v32);
        }

        v13 = v42;
        v6 = v43;
        v25 = v41;
      }

      v16 = v44;
    }

  }
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t59 != -1)
    dispatch_once(&logCategory__hmf_once_t59, &__block_literal_global_185_160276);
  return (id)logCategory__hmf_once_v60;
}

void __35__HMDBackingStoreLocal_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v60;
  logCategory__hmf_once_v60 = v0;

}

@end
