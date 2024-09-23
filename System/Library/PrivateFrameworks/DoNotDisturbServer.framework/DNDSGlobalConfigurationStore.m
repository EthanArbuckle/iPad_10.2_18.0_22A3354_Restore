@implementation DNDSGlobalConfigurationStore

- (DNDSGlobalConfigurationStore)initWithBackingStore:(id)a3 syncEngine:(id)a4 idsSyncEngine:(id)a5
{
  id v9;
  id v10;
  id v11;
  DNDSGlobalConfigurationStore *v12;
  DNDSGlobalConfigurationStore *v13;
  uint64_t v14;
  id v15;
  DNDSGlobalConfiguration *configuration;
  NSObject *v17;
  id v19;
  objc_super v20;
  uint8_t buf[4];
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  v20.receiver = self;
  v20.super_class = (Class)DNDSGlobalConfigurationStore;
  v12 = -[DNDSGlobalConfigurationStore init](&v20, sel_init);
  v13 = v12;
  if (v12)
  {
    v12->_lock._os_unfair_lock_opaque = 0;
    objc_storeStrong((id *)&v12->_backingStore, a3);
    -[DNDSBackingStore setDelegate:](v13->_backingStore, "setDelegate:", v13);
    objc_storeStrong((id *)&v13->_syncEngine, a4);
    -[DNDSSyncEngine setDataSource:forZoneName:](v13->_syncEngine, "setDataSource:forZoneName:", v13, CFSTR("DNDSGlobalConfiguration"));
    objc_storeStrong((id *)&v13->_idsSyncEngine, a5);
    -[DNDSIDSSyncEngine setDataSource:forZone:](v13->_idsSyncEngine, "setDataSource:forZone:", v13, CFSTR("DNDSGlobalConfiguration"));
    v19 = 0;
    objc_msgSend(v9, "readRecordWithError:", &v19);
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = v19;
    configuration = v13->_configuration;
    v13->_configuration = (DNDSGlobalConfiguration *)v14;

    if (v15)
    {
      v17 = DNDSLogGlobalConfiguration;
      if (os_log_type_enabled((os_log_t)DNDSLogGlobalConfiguration, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v22 = v15;
        _os_log_impl(&dword_1CB895000, v17, OS_LOG_TYPE_DEFAULT, "Could not read configuration: %{public}@", buf, 0xCu);
      }
    }

  }
  return v13;
}

- (id)readRecordWithError:(id *)a3
{
  os_unfair_lock_s *p_lock;
  void *v6;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  -[DNDSBackingStore readRecordWithError:](self->_backingStore, "readRecordWithError:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock(p_lock);
  return v6;
}

- (unint64_t)writeRecord:(id)a3 error:(id *)a4
{
  return -[DNDSGlobalConfigurationStore writeRecord:writePartition:error:](self, "writeRecord:writePartition:error:", a3, 1, a4);
}

- (unint64_t)writeRecord:(id)a3 writePartition:(BOOL)a4 error:(id *)a5
{
  _BOOL8 v6;
  os_unfair_lock_s *p_lock;
  id v9;
  unint64_t v10;

  v6 = a4;
  p_lock = &self->_lock;
  v9 = a3;
  os_unfair_lock_lock(p_lock);
  v10 = -[DNDSGlobalConfigurationStore _lock_writeRecord:writePartition:error:](self, "_lock_writeRecord:writePartition:error:", v9, v6, a5);

  os_unfair_lock_unlock(p_lock);
  -[DNDSGlobalConfigurationStore _notifyDelegateOfConfigurationChange](self, "_notifyDelegateOfConfigurationChange");
  return v10;
}

- (id)backingStore:(id)a3 migrateDictionaryRepresentation:(id)a4 fromVersionNumber:(unint64_t)a5 toVersionNumber:(unint64_t)a6
{
  id v10;
  id v11;
  void *v12;
  void *v13;

  v10 = a4;
  v11 = a3;
  -[DNDSGlobalConfigurationStore delegate](self, "delegate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "backingStore:migrateDictionaryRepresentation:fromVersionNumber:toVersionNumber:", v11, v10, a5, a6);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (int64_t)syncEngine:(id)a3 wantsRecord:(id)a4
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  uint64_t v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  unsigned int v15;
  int64_t v16;

  v4 = a4;
  objc_msgSend(v4, "recordID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "zoneID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "zoneName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isEqualToString:", CFSTR("DNDSGlobalConfiguration"));

  if (v8)
  {
    objc_msgSend(v4, "objectForKey:", CFSTR("DNDSGlobalConfigurationMinimumRequiredVersion"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "integerValue");
    if (v10 <= objc_msgSend(&unk_1E86DE730, "integerValue")
      && (objc_msgSend(v4, "recordType"),
          v11 = (void *)objc_claimAutoreleasedReturnValue(),
          v12 = objc_msgSend(v11, "isEqualToString:", CFSTR("DNDSGlobalConfigurationRecord")),
          v11,
          v12))
    {
      objc_msgSend(v4, "recordID");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "recordName");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "isEqualToString:", CFSTR("DNDSGlobalConfigurationRecord"));

      v16 = v15;
    }
    else
    {
      v16 = 0;
    }

  }
  else
  {
    v16 = 0;
  }

  return v16;
}

- (void)syncEngine:(id)a3 didFetchRecord:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _BOOL4 v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *idsSyncEngine;
  DNDSIDSRecordID *v19;
  void *v20;
  DNDSIDSRecordID **v21;
  void *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  void *v26;
  DNDSIDSRecordID *v27;
  DNDSIDSRecordID *v28;
  uint8_t buf[4];
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  objc_msgSend(v5, "recordID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "recordName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = DNDSLogGlobalConfiguration;
  if (os_log_type_enabled((os_log_t)DNDSLogGlobalConfiguration, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v30 = v7;
    _os_log_impl(&dword_1CB895000, v8, OS_LOG_TYPE_DEFAULT, "Fetched record with ID: %@", buf, 0xCu);
  }
  os_unfair_lock_lock(&self->_lock);
  -[DNDSGlobalConfigurationStore _lock_existingConfiguration](self, "_lock_existingConfiguration");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[DNDSGlobalConfigurationStore _createConfigurationFromCKRecord:](self, "_createConfigurationFromCKRecord:", v5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v10)
  {
    objc_msgSend(v10, "mergeWithGlobalConfiguration:", v9);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)DNDSLogGlobalConfiguration;
    v14 = os_log_type_enabled((os_log_t)DNDSLogGlobalConfiguration, OS_LOG_TYPE_DEFAULT);
    if (v12 == v11)
    {
      if (v14)
      {
        v23 = v13;
        objc_msgSend(v5, "recordID");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "recordName");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v30 = v25;
        _os_log_impl(&dword_1CB895000, v23, OS_LOG_TYPE_DEFAULT, "Fetched data with ID %@ is current; applying update",
          buf,
          0xCu);

      }
      -[DNDSGlobalConfigurationStore _lock_updateConfigurationWithCKRecord:](self, "_lock_updateConfigurationWithCKRecord:", v5);
      v19 = -[DNDSIDSRecordID initWithIdentifier:zone:]([DNDSIDSRecordID alloc], "initWithIdentifier:zone:", v7, CFSTR("DNDSGlobalConfiguration"));
      idsSyncEngine = self->_idsSyncEngine;
      v28 = v19;
      v20 = (void *)MEMORY[0x1E0C99D20];
      v21 = &v28;
    }
    else
    {
      if (v14)
      {
        v15 = v13;
        objc_msgSend(v5, "recordID");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "recordName");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v30 = v17;
        _os_log_impl(&dword_1CB895000, v15, OS_LOG_TYPE_DEFAULT, "Fetched data with ID %@ is outdated; ignoring update and resending local data",
          buf,
          0xCu);

      }
      idsSyncEngine = self->_syncEngine;
      objc_msgSend(v5, "recordID");
      v19 = (DNDSIDSRecordID *)objc_claimAutoreleasedReturnValue();
      v27 = v19;
      v20 = (void *)MEMORY[0x1E0C99D20];
      v21 = &v27;
    }
    objc_msgSend(v20, "arrayWithObjects:count:", v21, 1, v27, v28);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(idsSyncEngine, "addRecordIDsToSave:recordIDsToDelete:", v26, 0);

  }
  else
  {
    v22 = (void *)DNDSLogGlobalConfiguration;
    if (os_log_type_enabled((os_log_t)DNDSLogGlobalConfiguration, OS_LOG_TYPE_ERROR))
      -[DNDSGlobalConfigurationStore syncEngine:didFetchRecord:].cold.1(v22);
  }
  os_unfair_lock_unlock(&self->_lock);
  -[DNDSGlobalConfigurationStore _notifyDelegateOfConfigurationChange](self, "_notifyDelegateOfConfigurationChange");

}

- (void)syncEngine:(id)a3 failedToDeleteRecordWithID:(id)a4 error:(id)a5
{
  id v5;

  v5 = a5;
  if (os_log_type_enabled((os_log_t)DNDSLogGlobalConfiguration, OS_LOG_TYPE_ERROR))
    -[DNDSGlobalConfigurationStore syncEngine:failedToDeleteRecordWithID:error:].cold.1();

}

- (void)syncEngine:(id)a3 resolveConflictBetweenClientRecord:(id)a4 andServerRecord:(id)a5
{
  id v8;
  id v9;
  id v10;
  os_unfair_lock_s *p_lock;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _BOOL4 v16;
  NSObject *v17;
  void *v18;
  void *v19;
  DNDSIDSRecordID *v20;
  void *v21;
  void *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  DNDSIDSSyncEngine *idsSyncEngine;
  id v27;
  id v28;
  DNDSIDSRecordID *v29;
  DNDSIDSRecordID *v30;
  uint8_t buf[4];
  void *v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  -[DNDSGlobalConfigurationStore _createConfigurationFromCKRecord:](self, "_createConfigurationFromCKRecord:", v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    -[DNDSGlobalConfigurationStore _createConfigurationFromCKRecord:](self, "_createConfigurationFromCKRecord:", v9);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "mergeWithGlobalConfiguration:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (void *)DNDSLogGlobalConfiguration;
    v16 = os_log_type_enabled((os_log_t)DNDSLogGlobalConfiguration, OS_LOG_TYPE_DEFAULT);
    if (v14 == v12)
    {
      v28 = v8;
      if (v16)
      {
        v23 = v15;
        objc_msgSend(v10, "recordID");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "recordName");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v32 = v25;
        _os_log_impl(&dword_1CB895000, v23, OS_LOG_TYPE_DEFAULT, "Resolved conflict records with ID %@; using remote data",
          buf,
          0xCu);

      }
      -[DNDSGlobalConfigurationStore _lock_updateConfigurationWithCKRecord:](self, "_lock_updateConfigurationWithCKRecord:", v10);
      v20 = -[DNDSIDSRecordID initWithIdentifier:zone:]([DNDSIDSRecordID alloc], "initWithIdentifier:zone:", CFSTR("DNDSGlobalConfigurationRecord"), CFSTR("DNDSGlobalConfiguration"));
      idsSyncEngine = self->_idsSyncEngine;
      v30 = v20;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v30, 1);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[DNDSIDSSyncEngine addRecordIDsToSave:recordIDsToDelete:](idsSyncEngine, "addRecordIDsToSave:recordIDsToDelete:", v21, 0);
      v8 = v28;
    }
    else
    {
      if (v16)
      {
        v27 = v8;
        v17 = v15;
        objc_msgSend(v10, "recordID");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "recordName");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v32 = v19;
        _os_log_impl(&dword_1CB895000, v17, OS_LOG_TYPE_DEFAULT, "Resolved conflict between records with ID %@; using local data",
          buf,
          0xCu);

        v8 = v27;
      }
      objc_msgSend(v9, "recordID");
      v20 = (DNDSIDSRecordID *)objc_claimAutoreleasedReturnValue();
      v29 = v20;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v29, 1);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "addRecordIDsToSave:recordIDsToDelete:", v21, 0);
    }

    os_unfair_lock_unlock(&self->_lock);
    if (v14 == v12)
      -[DNDSGlobalConfigurationStore _notifyDelegateOfConfigurationChange](self, "_notifyDelegateOfConfigurationChange");
  }
  else
  {
    v22 = (void *)DNDSLogGlobalConfiguration;
    if (os_log_type_enabled((os_log_t)DNDSLogGlobalConfiguration, OS_LOG_TYPE_ERROR))
      -[DNDSGlobalConfigurationStore syncEngine:resolveConflictBetweenClientRecord:andServerRecord:].cold.1(v22);
    os_unfair_lock_unlock(p_lock);
  }

}

- (int64_t)syncEngine:(id)a3 prepareRecordToSave:(id)a4
{
  id v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  int v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  v6 = (void *)DNDSLogGlobalConfiguration;
  if (os_log_type_enabled((os_log_t)DNDSLogGlobalConfiguration, OS_LOG_TYPE_DEFAULT))
  {
    v7 = v6;
    objc_msgSend(v5, "recordID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "recordName");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 138412290;
    v12 = v9;
    _os_log_impl(&dword_1CB895000, v7, OS_LOG_TYPE_DEFAULT, "Preparing to save record %@", (uint8_t *)&v11, 0xCu);

  }
  os_unfair_lock_lock(&self->_lock);
  -[DNDSGlobalConfigurationStore _lock_prepareCKRecordToSave:](self, "_lock_prepareCKRecordToSave:", v5);
  os_unfair_lock_unlock(&self->_lock);

  return 1;
}

- (void)syncEngine:(id)a3 recordWithIDWasDeleted:(id)a4
{
  NSObject *v4;
  uint8_t v5[16];

  v4 = DNDSLogGlobalConfiguration;
  if (os_log_type_enabled((os_log_t)DNDSLogGlobalConfiguration, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_1CB895000, v4, OS_LOG_TYPE_DEFAULT, "Global configuration was deleted", v5, 2u);
  }
}

- (id)syncEngine:(id)a3 recordTypeForRecordID:(id)a4
{
  return CFSTR("DNDSGlobalConfigurationRecord");
}

- (void)syncEngine:(id)a3 zoneWithIDWasDeleted:(id)a4 removingRecordIDs:(id)a5
{
  NSObject *v6;
  uint8_t v7[16];

  v6 = DNDSLogGlobalConfiguration;
  if (os_log_type_enabled((os_log_t)DNDSLogGlobalConfiguration, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_1CB895000, v6, OS_LOG_TYPE_DEFAULT, "Removing all records because zone was deleted", v7, 2u);
  }
  -[DNDSGlobalConfigurationStore _purgeData](self, "_purgeData");
}

- (id)recordIDsForSyncEngine:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C95088]), "initWithZoneName:", CFSTR("DNDSGlobalConfiguration"));
  v4 = objc_alloc(MEMORY[0x1E0C95070]);
  objc_msgSend(v3, "zoneID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v4, "initWithRecordName:zoneID:", CFSTR("DNDSGlobalConfigurationRecord"), v5);

  v9[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)idsSyncEngine:(id)a3 prepareRecordToSave:(id)a4
{
  id v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  v6 = (void *)DNDSLogGlobalConfiguration;
  if (os_log_type_enabled((os_log_t)DNDSLogGlobalConfiguration, OS_LOG_TYPE_DEFAULT))
  {
    v7 = v6;
    objc_msgSend(v5, "recordID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "identifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138412290;
    v11 = v9;
    _os_log_impl(&dword_1CB895000, v7, OS_LOG_TYPE_DEFAULT, "Preparing to save record for IDS sync engine: %@", (uint8_t *)&v10, 0xCu);

  }
  os_unfair_lock_lock(&self->_lock);
  -[DNDSGlobalConfigurationStore _lock_prepareDNDSIDSRecordToSave:](self, "_lock_prepareDNDSIDSRecordToSave:", v5);
  os_unfair_lock_unlock(&self->_lock);

}

- (void)idsSyncEngine:(id)a3 didFetchRecord:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  _BOOL4 v14;
  DNDSIDSRecordID *v15;
  DNDSIDSSyncEngine *idsSyncEngine;
  void *v17;
  id v18;
  void *v19;
  DNDSSyncEngine *syncEngine;
  void *v21;
  void *v22;
  DNDSIDSRecordID *v23;
  void *v24;
  uint8_t buf[4];
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  objc_msgSend(v5, "recordID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = DNDSLogGlobalConfiguration;
  if (os_log_type_enabled((os_log_t)DNDSLogGlobalConfiguration, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v26 = v7;
    _os_log_impl(&dword_1CB895000, v8, OS_LOG_TYPE_DEFAULT, "Fetched record from IDS sync engine with ID: %@", buf, 0xCu);
  }
  os_unfair_lock_lock(&self->_lock);
  -[DNDSGlobalConfigurationStore _lock_existingConfiguration](self, "_lock_existingConfiguration");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[DNDSGlobalConfigurationStore _createConfigurationFromDNDSIDSRecord:](self, "_createConfigurationFromDNDSIDSRecord:", v5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v10)
  {
    objc_msgSend(v10, "mergeWithGlobalConfiguration:", v9);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = DNDSLogGlobalConfiguration;
    v14 = os_log_type_enabled((os_log_t)DNDSLogGlobalConfiguration, OS_LOG_TYPE_DEFAULT);
    if (v12 == v11)
    {
      v22 = v12;
      if (v14)
      {
        *(_DWORD *)buf = 138412290;
        v26 = v7;
        _os_log_impl(&dword_1CB895000, v13, OS_LOG_TYPE_DEFAULT, "Fetched data with ID %@ is current; applying update",
          buf,
          0xCu);
      }
      -[DNDSGlobalConfigurationStore _lock_updateConfigurationWithDNDSIDSRecord:](self, "_lock_updateConfigurationWithDNDSIDSRecord:", v5);
      v15 = (DNDSIDSRecordID *)objc_msgSend(objc_alloc(MEMORY[0x1E0C95088]), "initWithZoneName:", CFSTR("DNDSGlobalConfiguration"));
      v18 = objc_alloc(MEMORY[0x1E0C95070]);
      -[DNDSIDSRecordID zoneID](v15, "zoneID");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = (void *)objc_msgSend(v18, "initWithRecordName:zoneID:", v7, v19);

      syncEngine = self->_syncEngine;
      v24 = v17;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v24, 1);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[DNDSSyncEngine addRecordIDsToSave:recordIDsToDelete:](syncEngine, "addRecordIDsToSave:recordIDsToDelete:", v21, 0);

      v12 = v22;
    }
    else
    {
      if (v14)
      {
        *(_DWORD *)buf = 138543362;
        v26 = v7;
        _os_log_impl(&dword_1CB895000, v13, OS_LOG_TYPE_DEFAULT, "Fetched data with ID %{public}@ is outdated; ignoring update and resending local data",
          buf,
          0xCu);
      }
      v15 = -[DNDSIDSRecordID initWithIdentifier:zone:]([DNDSIDSRecordID alloc], "initWithIdentifier:zone:", v7, CFSTR("DNDSGlobalConfiguration"));
      idsSyncEngine = self->_idsSyncEngine;
      v23 = v15;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v23, 1);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[DNDSIDSSyncEngine addRecordIDsToSave:recordIDsToDelete:](idsSyncEngine, "addRecordIDsToSave:recordIDsToDelete:", v17, 0);
    }

  }
  else if (os_log_type_enabled((os_log_t)DNDSLogGlobalConfiguration, OS_LOG_TYPE_ERROR))
  {
    -[DNDSGlobalConfigurationStore idsSyncEngine:didFetchRecord:].cold.1();
  }
  os_unfair_lock_unlock(&self->_lock);
  -[DNDSGlobalConfigurationStore _notifyDelegateOfConfigurationChange](self, "_notifyDelegateOfConfigurationChange");

}

- (void)idsSyncEngine:(id)a3 recordWithIDWasDeleted:(id)a4
{
  NSObject *v4;
  uint8_t v5[16];

  v4 = DNDSLogGlobalConfiguration;
  if (os_log_type_enabled((os_log_t)DNDSLogGlobalConfiguration, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_1CB895000, v4, OS_LOG_TYPE_DEFAULT, "Global configuration was deleted", v5, 2u);
  }
}

- (id)recordIDsForIDSSyncEngine:(id)a3
{
  DNDSIDSRecordID *v3;
  void *v4;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  v3 = -[DNDSIDSRecordID initWithIdentifier:zone:]([DNDSIDSRecordID alloc], "initWithIdentifier:zone:", CFSTR("DNDSGlobalConfigurationRecord"), CFSTR("DNDSGlobalConfiguration"));
  v6[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)purgeRecordsForIDSSyncEngine:(id)a3
{
  os_unfair_lock_s *p_lock;
  NSObject *v5;
  DNDSMutableGlobalConfiguration *v6;
  NSObject *v7;
  DNDSBackingStore *backingStore;
  id v9;
  id v10;
  uint8_t v11[16];
  uint8_t buf[16];

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v5 = DNDSLogModeConfigurations;
  if (os_log_type_enabled((os_log_t)DNDSLogModeConfigurations, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1CB895000, v5, OS_LOG_TYPE_DEFAULT, "Purging data for IDS sync engine", buf, 2u);
  }
  v6 = objc_alloc_init(DNDSMutableGlobalConfiguration);
  -[DNDSMutableGlobalConfiguration setAutomaticallyGenerated:](v6, "setAutomaticallyGenerated:", 1);
  v7 = DNDSLogGlobalConfiguration;
  if (os_log_type_enabled((os_log_t)DNDSLogGlobalConfiguration, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v11 = 0;
    _os_log_impl(&dword_1CB895000, v7, OS_LOG_TYPE_DEFAULT, "Replacing record with default global configuration", v11, 2u);
  }
  backingStore = self->_backingStore;
  v10 = 0;
  -[DNDSBackingStore writeRecord:error:](backingStore, "writeRecord:error:", v6, &v10);
  v9 = v10;
  if (v9 && os_log_type_enabled((os_log_t)DNDSLogGlobalConfiguration, OS_LOG_TYPE_ERROR))
    -[DNDSModeConfigurationsStore purgeRecordsForIDSSyncEngine:].cold.1();
  os_unfair_lock_unlock(p_lock);

}

- (void)globalConfigurationSyncManager:(id)a3 didReceiveUpdatedGlobalConfiguration:(id)a4
{
  id v5;
  void *v6;
  id v7;
  NSObject *v8;
  DNDSBackingStore *backingStore;
  uint64_t v10;
  uint8_t buf[16];

  v5 = a4;
  os_unfair_lock_lock(&self->_lock);
  -[DNDSGlobalConfigurationStore _lock_existingConfiguration](self, "_lock_existingConfiguration");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "mergeWithGlobalConfiguration:", v6);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v8 = DNDSLogGlobalConfiguration;
  if (v7 == v5)
  {
    if (os_log_type_enabled((os_log_t)DNDSLogGlobalConfiguration, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1CB895000, v8, OS_LOG_TYPE_DEFAULT, "Updating global configuration", buf, 2u);
    }
    backingStore = self->_backingStore;
    v10 = 0;
    -[DNDSBackingStore writeRecord:error:](backingStore, "writeRecord:error:", v5, &v10);
  }
  else if (os_log_type_enabled((os_log_t)DNDSLogGlobalConfiguration, OS_LOG_TYPE_ERROR))
  {
    -[DNDSGlobalConfigurationStore globalConfigurationSyncManager:didReceiveUpdatedGlobalConfiguration:].cold.1();
  }
  os_unfair_lock_unlock(&self->_lock);

}

- (id)_createConfigurationFromDNDSIDSRecord:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  DNDSBackingStoreDictionaryContext *v9;
  id v11;

  v3 = a3;
  objc_msgSend(v3, "objectForKey:", CFSTR("DNDSGlobalConfigurationRecordData"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v11 = 0;
    objc_msgSend(MEMORY[0x1E0CB36D8], "JSONObjectWithData:options:error:", v4, 0, &v11);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v11;
    if (v6)
    {
      if (os_log_type_enabled((os_log_t)DNDSLogGlobalConfiguration, OS_LOG_TYPE_ERROR))
        -[DNDSGlobalConfigurationStore _createConfigurationFromDNDSIDSRecord:].cold.2();
      v7 = 0;
    }
    else
    {
      v9 = -[DNDSBackingStoreDictionaryContext initWithDestination:partitionType:redactSensitiveData:contactProvider:applicationIdentifierMapper:]([DNDSBackingStoreDictionaryContext alloc], "initWithDestination:partitionType:redactSensitiveData:contactProvider:applicationIdentifierMapper:", 1, 1, 0, 0, 0);
      v7 = +[DNDSGlobalConfiguration newWithDictionaryRepresentation:context:](DNDSGlobalConfiguration, "newWithDictionaryRepresentation:context:", v5, v9);

    }
  }
  else
  {
    v8 = (void *)DNDSLogGlobalConfiguration;
    if (os_log_type_enabled((os_log_t)DNDSLogGlobalConfiguration, OS_LOG_TYPE_ERROR))
      -[DNDSGlobalConfigurationStore _createConfigurationFromDNDSIDSRecord:].cold.1(v8);
    v7 = 0;
  }

  return v7;
}

- (id)_createConfigurationFromCKRecord:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  DNDSBackingStoreDictionaryContext *v10;
  id v12;

  v3 = a3;
  objc_msgSend(v3, "encryptedValues");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR("DNDSGlobalConfigurationRecordEncryptedData"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v12 = 0;
    objc_msgSend(MEMORY[0x1E0CB36D8], "JSONObjectWithData:options:error:", v5, 0, &v12);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v12;
    if (v7)
    {
      if (os_log_type_enabled((os_log_t)DNDSLogGlobalConfiguration, OS_LOG_TYPE_ERROR))
        -[DNDSGlobalConfigurationStore _createConfigurationFromCKRecord:].cold.2();
      v8 = 0;
    }
    else
    {
      v10 = -[DNDSBackingStoreDictionaryContext initWithDestination:partitionType:redactSensitiveData:contactProvider:applicationIdentifierMapper:]([DNDSBackingStoreDictionaryContext alloc], "initWithDestination:partitionType:redactSensitiveData:contactProvider:applicationIdentifierMapper:", 1, 1, 0, 0, 0);
      v8 = +[DNDSGlobalConfiguration newWithDictionaryRepresentation:context:](DNDSGlobalConfiguration, "newWithDictionaryRepresentation:context:", v6, v10);

    }
  }
  else
  {
    v9 = (void *)DNDSLogGlobalConfiguration;
    if (os_log_type_enabled((os_log_t)DNDSLogGlobalConfiguration, OS_LOG_TYPE_ERROR))
      -[DNDSGlobalConfigurationStore _createConfigurationFromCKRecord:].cold.1(v9);
    v8 = 0;
  }

  return v8;
}

- (id)_lock_mutableExistingConfigurationInStore:(id)a3
{
  void *v3;
  void *v4;

  -[DNDSGlobalConfigurationStore _lock_existingConfiguration](self, "_lock_existingConfiguration", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  return v4;
}

- (id)_lock_existingConfiguration
{
  DNDSBackingStore *backingStore;
  void *v4;
  id v5;
  id v7;

  os_unfair_lock_assert_owner(&self->_lock);
  backingStore = self->_backingStore;
  v7 = 0;
  -[DNDSBackingStore readRecordWithError:](backingStore, "readRecordWithError:", &v7);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v7;
  if (v5 && os_log_type_enabled((os_log_t)DNDSLogGlobalConfiguration, OS_LOG_TYPE_ERROR))
    -[DNDSGlobalConfigurationStore _lock_existingConfiguration].cold.1();

  return v4;
}

- (void)_populateDNDSIDSRecord:(id)a3 withGlobalConfiguration:(id)a4
{
  id v5;
  id v6;
  DNDSBackingStoreDictionaryContext *v7;
  void *v8;
  void *v9;
  void *v10;

  v5 = a3;
  v6 = a4;
  v7 = -[DNDSBackingStoreDictionaryContext initWithDestination:partitionType:redactSensitiveData:contactProvider:applicationIdentifierMapper:]([DNDSBackingStoreDictionaryContext alloc], "initWithDestination:partitionType:redactSensitiveData:contactProvider:applicationIdentifierMapper:", 0, 1, 0, 0, 0);
  objc_msgSend(v6, "dictionaryRepresentationWithContext:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(MEMORY[0x1E0CB36D8], "isValidJSONObject:", v8))
  {
    objc_msgSend(MEMORY[0x1E0CB36D8], "dataWithJSONObject:options:error:", v8, 0, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKey:", v9, CFSTR("DNDSGlobalConfigurationRecordData"));
    objc_msgSend(v5, "setObject:forKey:", &unk_1E86DE730, CFSTR("DNDSGlobalConfigurationVersion"));
    objc_msgSend(v5, "setObject:forKey:", &unk_1E86DE730, CFSTR("DNDSGlobalConfigurationMinimumRequiredVersion"));

  }
  else
  {
    v10 = (void *)DNDSLogGlobalConfiguration;
    if (os_log_type_enabled((os_log_t)DNDSLogGlobalConfiguration, OS_LOG_TYPE_ERROR))
      -[DNDSGlobalConfigurationStore _populateDNDSIDSRecord:withGlobalConfiguration:].cold.3(v10);
    if (os_log_type_enabled((os_log_t)DNDSLogGlobalConfiguration, OS_LOG_TYPE_ERROR))
      -[DNDSGlobalConfigurationStore _populateDNDSIDSRecord:withGlobalConfiguration:].cold.2();
    if (os_log_type_enabled((os_log_t)DNDSLogGlobalConfiguration, OS_LOG_TYPE_ERROR))
      -[DNDSGlobalConfigurationStore _populateDNDSIDSRecord:withGlobalConfiguration:].cold.1();
  }

}

- (void)_populateCKRecord:(id)a3 withGlobalConfiguration:(id)a4
{
  id v5;
  id v6;
  DNDSBackingStoreDictionaryContext *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v5 = a3;
  v6 = a4;
  v7 = -[DNDSBackingStoreDictionaryContext initWithDestination:partitionType:redactSensitiveData:contactProvider:applicationIdentifierMapper:]([DNDSBackingStoreDictionaryContext alloc], "initWithDestination:partitionType:redactSensitiveData:contactProvider:applicationIdentifierMapper:", 0, 1, 0, 0, 0);
  objc_msgSend(v6, "dictionaryRepresentationWithContext:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(MEMORY[0x1E0CB36D8], "isValidJSONObject:", v8))
  {
    objc_msgSend(MEMORY[0x1E0CB36D8], "dataWithJSONObject:options:error:", v8, 0, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "encryptedValues");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setObject:forKey:", v9, CFSTR("DNDSGlobalConfigurationRecordEncryptedData"));

    objc_msgSend(v5, "setObject:forKeyedSubscript:", &unk_1E86DE730, CFSTR("DNDSGlobalConfigurationVersion"));
    objc_msgSend(v5, "setObject:forKeyedSubscript:", &unk_1E86DE730, CFSTR("DNDSGlobalConfigurationMinimumRequiredVersion"));

  }
  else
  {
    v11 = (void *)DNDSLogGlobalConfiguration;
    if (os_log_type_enabled((os_log_t)DNDSLogGlobalConfiguration, OS_LOG_TYPE_ERROR))
      -[DNDSGlobalConfigurationStore _populateCKRecord:withGlobalConfiguration:].cold.3(v11);
    if (os_log_type_enabled((os_log_t)DNDSLogGlobalConfiguration, OS_LOG_TYPE_ERROR))
      -[DNDSGlobalConfigurationStore _populateDNDSIDSRecord:withGlobalConfiguration:].cold.2();
    if (os_log_type_enabled((os_log_t)DNDSLogGlobalConfiguration, OS_LOG_TYPE_ERROR))
      -[DNDSGlobalConfigurationStore _populateDNDSIDSRecord:withGlobalConfiguration:].cold.1();
  }

}

- (void)_lock_prepareDNDSIDSRecordToSave:(id)a3
{
  id v4;
  DNDSBackingStore *backingStore;
  void *v6;
  id v7;
  id v8;

  v4 = a3;
  os_unfair_lock_assert_owner(&self->_lock);
  backingStore = self->_backingStore;
  v8 = 0;
  -[DNDSBackingStore readRecordWithError:](backingStore, "readRecordWithError:", &v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v8;
  if (v7)
  {
    if (os_log_type_enabled((os_log_t)DNDSLogGlobalConfiguration, OS_LOG_TYPE_ERROR))
      -[DNDSGlobalConfigurationStore _lock_prepareDNDSIDSRecordToSave:].cold.1();
  }
  else
  {
    -[DNDSGlobalConfigurationStore _populateDNDSIDSRecord:withGlobalConfiguration:](self, "_populateDNDSIDSRecord:withGlobalConfiguration:", v4, v6);
  }

}

- (void)_lock_prepareCKRecordToSave:(id)a3
{
  id v4;
  DNDSBackingStore *backingStore;
  void *v6;
  id v7;
  id v8;

  v4 = a3;
  os_unfair_lock_assert_owner(&self->_lock);
  backingStore = self->_backingStore;
  v8 = 0;
  -[DNDSBackingStore readRecordWithError:](backingStore, "readRecordWithError:", &v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v8;
  if (v7)
  {
    if (os_log_type_enabled((os_log_t)DNDSLogGlobalConfiguration, OS_LOG_TYPE_ERROR))
      -[DNDSGlobalConfigurationStore _lock_prepareDNDSIDSRecordToSave:].cold.1();
  }
  else
  {
    -[DNDSGlobalConfigurationStore _populateCKRecord:withGlobalConfiguration:](self, "_populateCKRecord:withGlobalConfiguration:", v4, v6);
  }

}

- (void)_notifyDelegateOfConfigurationChange
{
  os_unfair_lock_s *p_lock;
  id WeakRetained;
  DNDSBackingStore *backingStore;
  void *v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  const char *v13;
  id v14;
  uint8_t buf[4];
  const char *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  backingStore = self->_backingStore;
  v14 = 0;
  -[DNDSBackingStore readRecordWithError:](backingStore, "readRecordWithError:", &v14);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v14;
  v8 = (void *)-[DNDSGlobalConfiguration copy](self->_configuration, "copy");
  objc_storeStrong((id *)&self->_configuration, v6);
  if (v7 && os_log_type_enabled((os_log_t)DNDSLogGlobalConfiguration, OS_LOG_TYPE_ERROR))
    -[DNDSGlobalConfigurationStore _lock_prepareDNDSIDSRecordToSave:].cold.1();
  os_unfair_lock_unlock(p_lock);
  v9 = objc_msgSend(v6, "preventAutoReply");
  if (v9 != objc_msgSend(v8, "preventAutoReply"))
  {
    v10 = (void *)DNDSLogModeConfigurations;
    if (os_log_type_enabled((os_log_t)DNDSLogModeConfigurations, OS_LOG_TYPE_DEFAULT))
    {
      v11 = v10;
      v12 = objc_msgSend(v6, "preventAutoReply");
      v13 = "prevent";
      if (!v12)
        v13 = "allow";
      *(_DWORD *)buf = 136446210;
      v16 = v13;
      _os_log_impl(&dword_1CB895000, v11, OS_LOG_TYPE_DEFAULT, "Notifying delegate of prevent-auto-reply change: %{public}s", buf, 0xCu);

    }
    objc_msgSend(WeakRetained, "globalConfigurationStore:didUpdatePreventAutoReplySetting:", self, DNDResolvedPreventAutoReplySetting(objc_msgSend(v6, "preventAutoReply")) == 2);
  }

}

- (unint64_t)_lock_writeRecord:(id)a3 writePartition:(BOOL)a4 error:(id *)a5
{
  _BOOL8 v6;
  os_unfair_lock_s *p_lock;
  id v9;
  void *v10;
  void *v11;
  unint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  DNDSIDSRecordID *v17;
  DNDSIDSSyncEngine *idsSyncEngine;
  void *v19;
  NSObject *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  id v28;
  void *v29;
  void *v30;
  DNDSSyncEngine *syncEngine;
  void *v32;
  void *v34;
  _QWORD v35[2];

  v6 = a4;
  v35[1] = *MEMORY[0x1E0C80C00];
  p_lock = &self->_lock;
  v9 = a3;
  os_unfair_lock_assert_owner(p_lock);
  v10 = (void *)objc_msgSend(v9, "mutableCopy");

  -[DNDSBackingStore readRecordWithError:](self->_backingStore, "readRecordWithError:", a5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v10, "isEqual:", v11) & 1) != 0)
  {
    v12 = 1;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "lastModified");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "earlierDate:", v13);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15 == v13)
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setLastModified:", v16);

    }
    else
    {
      objc_msgSend(v10, "setLastModified:", v13);
    }
    v17 = -[DNDSIDSRecordID initWithIdentifier:zone:]([DNDSIDSRecordID alloc], "initWithIdentifier:zone:", CFSTR("DNDSGlobalConfigurationRecord"), CFSTR("DNDSGlobalConfiguration"));
    idsSyncEngine = self->_idsSyncEngine;
    v35[0] = v17;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v35, 1);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[DNDSIDSSyncEngine addRecordIDsToSave:recordIDsToDelete:](idsSyncEngine, "addRecordIDsToSave:recordIDsToDelete:", v19, 0);

    v12 = -[DNDSBackingStore writeRecord:writePartition:error:](self->_backingStore, "writeRecord:writePartition:error:", v10, v6, a5);
    if (a5)
    {
      if (*a5)
      {
        v20 = DNDSLogGlobalConfiguration;
        if (os_log_type_enabled((os_log_t)DNDSLogGlobalConfiguration, OS_LOG_TYPE_ERROR))
          -[DNDSModeConfigurationsStore _lock_writeRecord:writePartition:error:].cold.1((uint64_t)a5, v20, v21, v22, v23, v24, v25, v26);
      }
    }
    v27 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C95088]), "initWithZoneName:", CFSTR("DNDSGlobalConfiguration"));
    v28 = objc_alloc(MEMORY[0x1E0C95070]);
    objc_msgSend(v27, "zoneID");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = (void *)objc_msgSend(v28, "initWithRecordName:zoneID:", CFSTR("DNDSGlobalConfigurationRecord"), v29);

    syncEngine = self->_syncEngine;
    v34 = v30;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v34, 1);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    -[DNDSSyncEngine addRecordIDsToSave:recordIDsToDelete:](syncEngine, "addRecordIDsToSave:recordIDsToDelete:", v32, 0);

  }
  return v12;
}

- (void)_lock_updateConfigurationWithDNDSIDSRecord:(id)a3
{
  os_unfair_lock_s *p_lock;
  id v5;
  void *v6;
  DNDSBackingStore *backingStore;
  id v8;
  id v9;

  p_lock = &self->_lock;
  v5 = a3;
  os_unfair_lock_assert_owner(p_lock);
  -[DNDSGlobalConfigurationStore _createConfigurationFromDNDSIDSRecord:](self, "_createConfigurationFromDNDSIDSRecord:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  backingStore = self->_backingStore;
  v9 = 0;
  -[DNDSBackingStore writeRecord:error:](backingStore, "writeRecord:error:", v6, &v9);
  v8 = v9;
  if (v8 && os_log_type_enabled((os_log_t)DNDSLogGlobalConfiguration, OS_LOG_TYPE_ERROR))
    -[DNDSGlobalConfigurationStore _lock_updateConfigurationWithDNDSIDSRecord:].cold.1();

}

- (void)_lock_updateConfigurationWithCKRecord:(id)a3
{
  os_unfair_lock_s *p_lock;
  id v5;
  void *v6;
  DNDSBackingStore *backingStore;
  id v8;
  id v9;

  p_lock = &self->_lock;
  v5 = a3;
  os_unfair_lock_assert_owner(p_lock);
  -[DNDSGlobalConfigurationStore _createConfigurationFromCKRecord:](self, "_createConfigurationFromCKRecord:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  backingStore = self->_backingStore;
  v9 = 0;
  -[DNDSBackingStore writeRecord:error:](backingStore, "writeRecord:error:", v6, &v9);
  v8 = v9;
  if (v8 && os_log_type_enabled((os_log_t)DNDSLogGlobalConfiguration, OS_LOG_TYPE_ERROR))
    -[DNDSGlobalConfigurationStore _lock_updateConfigurationWithDNDSIDSRecord:].cold.1();

}

- (void)_lock_purgeData
{
  DNDSMutableGlobalConfiguration *v3;
  NSObject *v4;
  DNDSBackingStore *backingStore;
  id v6;
  DNDSIDSRecordID *v7;
  void *v8;
  id v9;
  uint8_t buf[16];
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(DNDSMutableGlobalConfiguration);
  -[DNDSMutableGlobalConfiguration setAutomaticallyGenerated:](v3, "setAutomaticallyGenerated:", 1);
  v4 = DNDSLogGlobalConfiguration;
  if (os_log_type_enabled((os_log_t)DNDSLogGlobalConfiguration, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1CB895000, v4, OS_LOG_TYPE_DEFAULT, "Replacing record with default global configuration", buf, 2u);
  }
  backingStore = self->_backingStore;
  v9 = 0;
  -[DNDSBackingStore writeRecord:error:](backingStore, "writeRecord:error:", v3, &v9);
  v6 = v9;
  v7 = -[DNDSIDSRecordID initWithIdentifier:zone:]([DNDSIDSRecordID alloc], "initWithIdentifier:zone:", CFSTR("DNDSGlobalConfigurationRecord"), CFSTR("DNDSGlobalConfiguration"));
  v11[0] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[DNDSIDSSyncEngine addRecordIDsToSave:recordIDsToDelete:](self->_idsSyncEngine, "addRecordIDsToSave:recordIDsToDelete:", v8, 0);
  if (v6 && os_log_type_enabled((os_log_t)DNDSLogGlobalConfiguration, OS_LOG_TYPE_ERROR))
    -[DNDSModeConfigurationsStore purgeRecordsForIDSSyncEngine:].cold.1();

}

- (void)_purgeData
{
  os_unfair_lock_s *p_lock;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  -[DNDSGlobalConfigurationStore _lock_purgeData](self, "_lock_purgeData");
  os_unfair_lock_unlock(p_lock);
  -[DNDSGlobalConfigurationStore _notifyDelegateOfConfigurationChange](self, "_notifyDelegateOfConfigurationChange");
}

- (DNDSGlobalConfigurationStoreDelegate)delegate
{
  return (DNDSGlobalConfigurationStoreDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_idsSyncEngine, 0);
  objc_storeStrong((id *)&self->_syncEngine, 0);
  objc_storeStrong((id *)&self->_backingStore, 0);
}

- (void)syncEngine:(void *)a1 didFetchRecord:.cold.1(void *a1)
{
  NSObject *v1;
  void *v2;
  void *v3;
  uint64_t v4;
  uint8_t v5[24];

  OUTLINED_FUNCTION_3_0(a1);
  objc_msgSend((id)OUTLINED_FUNCTION_8_0(), "recordID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "recordName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0_2(&dword_1CB895000, v1, v4, "Fetched data with ID %@ could not be reconstructed into a configuration; ignoring update",
    v5);

  OUTLINED_FUNCTION_1_1();
}

- (void)syncEngine:failedToDeleteRecordWithID:error:.cold.1()
{
  void *v0;
  id v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_5_1();
  OUTLINED_FUNCTION_3_0(v1);
  objc_msgSend((id)OUTLINED_FUNCTION_4_1(), "recordName");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_7_0();
  OUTLINED_FUNCTION_2_0(&dword_1CB895000, v3, v4, "Failed to delete record %@: %@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_1_1();
}

- (void)syncEngine:(void *)a1 resolveConflictBetweenClientRecord:andServerRecord:.cold.1(void *a1)
{
  NSObject *v1;
  void *v2;
  void *v3;
  uint64_t v4;
  uint8_t v5[24];

  OUTLINED_FUNCTION_3_0(a1);
  objc_msgSend((id)OUTLINED_FUNCTION_8_0(), "recordID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "recordName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0_2(&dword_1CB895000, v1, v4, "Could not resolve conflict as remote configuration is nil; keeping local data with ID %@",
    v5);

  OUTLINED_FUNCTION_1_1();
}

- (void)idsSyncEngine:didFetchRecord:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0(&dword_1CB895000, v0, v1, "Fetched data with ID %@ could not be reconstructed into a configuration; ignoring update",
    v2,
    v3,
    v4,
    v5,
    v6);
  OUTLINED_FUNCTION_1();
}

- (void)globalConfigurationSyncManager:didReceiveUpdatedGlobalConfiguration:.cold.1()
{
  void *v0;
  void *v1;
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;

  OUTLINED_FUNCTION_5_1();
  OUTLINED_FUNCTION_3_0(v2);
  objc_msgSend((id)OUTLINED_FUNCTION_4_1(), "lastModified");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)OUTLINED_FUNCTION_8_0(), "lastModified");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_0(&dword_1CB895000, v3, v4, "Ignoring incoming configuration with date %@ as it is older than existing configuration with date %@", v5, v6, v7, v8, 2u);

  OUTLINED_FUNCTION_1_1();
}

- (void)_createConfigurationFromDNDSIDSRecord:(void *)a1 .cold.1(void *a1)
{
  NSObject *v1;
  void *v2;
  void *v3;
  uint64_t v4;
  uint8_t v5[24];

  OUTLINED_FUNCTION_3_0(a1);
  objc_msgSend((id)OUTLINED_FUNCTION_8_0(), "recordID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0_2(&dword_1CB895000, v1, v4, "Record data is nil in record data %@", v5);

  OUTLINED_FUNCTION_1_1();
}

- (void)_createConfigurationFromDNDSIDSRecord:.cold.2()
{
  void *v0;
  id v1;
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  OUTLINED_FUNCTION_5_1();
  OUTLINED_FUNCTION_3_0(v1);
  objc_msgSend((id)OUTLINED_FUNCTION_4_1(), "recordID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_7_0();
  OUTLINED_FUNCTION_2_0(&dword_1CB895000, v4, v5, "Failed to decode record data %@: %@", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_1_1();
}

- (void)_createConfigurationFromCKRecord:(void *)a1 .cold.1(void *a1)
{
  NSObject *v1;
  void *v2;
  void *v3;
  uint64_t v4;
  uint8_t v5[24];

  OUTLINED_FUNCTION_3_0(a1);
  objc_msgSend((id)OUTLINED_FUNCTION_8_0(), "recordID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "recordName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0_2(&dword_1CB895000, v1, v4, "Record data is nil in record data %@", v5);

  OUTLINED_FUNCTION_1_1();
}

- (void)_createConfigurationFromCKRecord:.cold.2()
{
  void *v0;
  id v1;
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  OUTLINED_FUNCTION_5_1();
  OUTLINED_FUNCTION_3_0(v1);
  objc_msgSend((id)OUTLINED_FUNCTION_4_1(), "recordID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "recordName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_7_0();
  OUTLINED_FUNCTION_2_0(&dword_1CB895000, v4, v5, "Failed to decode record data %@: %@", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_1_1();
}

- (void)_lock_existingConfiguration
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0(&dword_1CB895000, v0, v1, "Failed to fetch existing configuration: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)_populateDNDSIDSRecord:withGlobalConfiguration:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0(&dword_1CB895000, v0, v1, "Dictionary: %{private}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)_populateDNDSIDSRecord:withGlobalConfiguration:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0(&dword_1CB895000, v0, v1, "Configuration: %{private}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)_populateDNDSIDSRecord:(void *)a1 withGlobalConfiguration:.cold.3(void *a1)
{
  NSObject *v1;
  void *v2;
  void *v3;
  uint64_t v4;
  uint8_t v5[24];

  OUTLINED_FUNCTION_3_0(a1);
  objc_msgSend((id)OUTLINED_FUNCTION_8_0(), "recordID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0_2(&dword_1CB895000, v1, v4, "Record %@ is not valid JSON", v5);

  OUTLINED_FUNCTION_1_1();
}

- (void)_populateCKRecord:(void *)a1 withGlobalConfiguration:.cold.3(void *a1)
{
  NSObject *v1;
  void *v2;
  void *v3;
  uint64_t v4;
  uint8_t v5[24];

  OUTLINED_FUNCTION_3_0(a1);
  objc_msgSend((id)OUTLINED_FUNCTION_8_0(), "recordID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "recordName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0_2(&dword_1CB895000, v1, v4, "Record %@ is not valid JSON", v5);

  OUTLINED_FUNCTION_1_1();
}

- (void)_lock_prepareDNDSIDSRecordToSave:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0(&dword_1CB895000, v0, v1, "Could not read configuration: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)_lock_updateConfigurationWithDNDSIDSRecord:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0(&dword_1CB895000, v0, v1, "Error writing fetched configurations: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

@end
