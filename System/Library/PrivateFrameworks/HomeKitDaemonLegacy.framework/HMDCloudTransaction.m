@implementation HMDCloudTransaction

- (HMDCloudTransaction)init
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v2 = (void *)MEMORY[0x1E0C99DA0];
  v3 = *MEMORY[0x1E0C99768];
  v4 = (void *)MEMORY[0x1E0CB3940];
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("%@ is unavailable"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "exceptionWithName:reason:userInfo:", v3, v6, 0);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v7);
}

- (HMDCloudTransaction)initWithType:(unint64_t)a3 temporaryCache:(BOOL)a4
{
  return -[HMDCloudTransaction initWithType:temporaryCache:noLocalData:](self, "initWithType:temporaryCache:noLocalData:", a3, a4, 0);
}

- (HMDCloudTransaction)initWithType:(unint64_t)a3 temporaryCache:(BOOL)a4 noLocalData:(BOOL)a5
{
  HMDCloudTransaction *v8;
  uint64_t v9;
  NSUUID *identifier;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)HMDCloudTransaction;
  v8 = -[HMDCloudTransaction init](&v12, sel_init);
  if (v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v9 = objc_claimAutoreleasedReturnValue();
    identifier = v8->_identifier;
    v8->_identifier = (NSUUID *)v9;

    v8->_transactionType = a3;
    v8->_temporaryCache = a4;
    v8->_zoneHasNoLocalData = a5;
  }
  return v8;
}

- (void)updateCloudZone:(id)a3
{
  HMDCloudZone **p_cloudZone;
  id v5;
  HMDCloudZoneChange *v6;
  HMDCloudZoneChange *cloudZoneChange;

  p_cloudZone = &self->_cloudZone;
  v5 = a3;
  objc_storeWeak((id *)p_cloudZone, v5);
  objc_msgSend(v5, "createCloudZoneChangeTemporaryCache:", -[HMDCloudTransaction isTemporaryCache](self, "isTemporaryCache"));
  v6 = (HMDCloudZoneChange *)objc_claimAutoreleasedReturnValue();

  cloudZoneChange = self->_cloudZoneChange;
  self->_cloudZoneChange = v6;

}

- (id)shortDescription
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  unint64_t v7;
  const __CFString *v8;
  void *v9;

  v3 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend((id)objc_opt_class(), "shortDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDCloudTransaction identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "UUIDString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[HMDCloudTransaction transactionType](self, "transactionType");
  if (v7 > 4)
    v8 = CFSTR("unknown");
  else
    v8 = off_1E89BE418[v7];
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@, Type = %@"), v4, v6, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[HMDCloudTransaction shortDescription](self, "shortDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDCloudTransaction cloudZoneChange](self, "cloudZoneChange");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@, Cloud Zone Change = %@>"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (HMFOSTransaction)osTransaction
{
  return self->_osTransaction;
}

- (void)setOsTransaction:(id)a3
{
  id v4;
  HMFOSTransaction *v5;
  HMFOSTransaction *osTransaction;
  id v7;

  v4 = a3;
  v7 = v4;
  if (v4)
  {
    v5 = (HMFOSTransaction *)v4;
    osTransaction = self->_osTransaction;
    self->_osTransaction = v5;
  }
  else
  {
    -[HMDCloudTransaction setCloudZoneChange:](self, "setCloudZoneChange:", 0);
    osTransaction = self->_osTransaction;
    self->_osTransaction = 0;
  }

}

- (BOOL)decryptionFailed
{
  void *v2;
  char v3;

  -[HMDCloudTransaction cloudZoneChange](self, "cloudZoneChange");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "decryptionFailed");

  return v3;
}

- (BOOL)encryptionFailed
{
  void *v2;
  char v3;

  -[HMDCloudTransaction cloudZoneChange](self, "cloudZoneChange");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "encryptionFailed");

  return v3;
}

- (BOOL)controllerIdentifierChanged
{
  void *v2;
  char v3;

  -[HMDCloudTransaction cloudZoneChange](self, "cloudZoneChange");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "controllerIdentifierChanged");

  return v3;
}

- (CKRecordID)privateZoneRootRecordID
{
  void *v2;
  void *v3;

  -[HMDCloudTransaction cloudZoneChange](self, "cloudZoneChange");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "privateZoneRootRecordID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (CKRecordID *)v3;
}

- (NSArray)allTransactionStoreRowIDs
{
  void *v2;
  void *v3;

  -[HMDCloudTransaction cloudZoneChange](self, "cloudZoneChange");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "allTransactionStoreRowIDs");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (NSArray)processedTransactionStoreRowIDs
{
  void *v2;
  void *v3;

  -[HMDCloudTransaction cloudZoneChange](self, "cloudZoneChange");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "processedTransactionStoreRowIDs");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (void)addChangeWithObjectChange:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[HMDCloudTransaction cloudZoneChange](self, "cloudZoneChange");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addChangeWithObjectChange:", v4);

}

- (void)addChangeWithRecord:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[HMDCloudTransaction cloudZoneChange](self, "cloudZoneChange");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addChangeWithRecord:", v4);

}

- (void)addChangeWithDeletedRecordID:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[HMDCloudTransaction cloudZoneChange](self, "cloudZoneChange");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addChangeWithDeletedRecordID:", v4);

}

- (void)removeChangeWithObjectID:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[HMDCloudTransaction cloudZoneChange](self, "cloudZoneChange");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeChangeWithObjectID:", v4);

}

- (BOOL)hasValidChanges
{
  void *v2;
  char v3;

  -[HMDCloudTransaction cloudZoneChange](self, "cloudZoneChange");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hasValidChanges");

  return v3;
}

- (BOOL)doesRecordExistWithObjectID:(id)a3
{
  id v4;
  void *v5;
  char v6;

  v4 = a3;
  -[HMDCloudTransaction cloudZoneChange](self, "cloudZoneChange");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "doesRecordExistWithObjectID:", v4);

  return v6;
}

- (BOOL)doesRecordExistInCacheWithObjectID:(id)a3
{
  id v4;
  void *v5;
  char v6;

  v4 = a3;
  -[HMDCloudTransaction cloudZoneChange](self, "cloudZoneChange");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "doesRecordExistInCacheWithObjectID:", v4);

  return v6;
}

- (BOOL)doRecordsExistInCache
{
  void *v2;
  char v3;

  -[HMDCloudTransaction cloudZoneChange](self, "cloudZoneChange");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "doRecordsExistInCache");

  return v3;
}

- (id)cachedCloudRecordWithObjectID:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[HMDCloudTransaction cloudZoneChange](self, "cloudZoneChange");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "cachedCloudRecordWithObjectID:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)cachedCloudRecordWithObjectID:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[HMDCloudTransaction cloudZoneChange](self, "cloudZoneChange");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "cachedCloudRecordWithObjectID:completionHandler:", v7, v6);

}

- (void)loadCloudRecordsAndDetermineDeletesFromCache:(id)a3
{
  void (**v4)(id, void *);
  void *v5;
  void *v6;
  HMDCloudTransaction *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, void *))a3;
  -[HMDCloudTransaction cloudZoneChange](self, "cloudZoneChange");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4 && !v5)
  {
    v6 = (void *)MEMORY[0x1D17BA0A0]();
    v7 = self;
    HMFGetOSLogHandle();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 138543362;
      v13 = v9;
      _os_log_impl(&dword_1CD062000, v8, OS_LOG_TYPE_ERROR, "%{public}@Failed to load cached records because cloudZone cannot be not determined", (uint8_t *)&v12, 0xCu);

    }
    objc_autoreleasePoolPop(v6);
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 52);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v4[2](v4, v10);

  }
  -[HMDCloudTransaction cloudZoneChange](self, "cloudZoneChange");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "loadCloudRecordsAndDetermineDeletesFromCache:", v4);

}

- (void)setAllChangedAsProcessed
{
  id v2;

  -[HMDCloudTransaction cloudZoneChange](self, "cloudZoneChange");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setAllChangedAsProcessed");

}

- (BOOL)moreChangesToProcess
{
  void *v2;
  char v3;

  -[HMDCloudTransaction cloudZoneChange](self, "cloudZoneChange");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "moreChangesToProcess");

  return v3;
}

- (void)fetchBatchToUpload:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[HMDCloudTransaction cloudZoneChange](self, "cloudZoneChange");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "fetchBatchToUpload:", v4);

}

- (void)setSaveAsProcessedWithRecord:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[HMDCloudTransaction cloudZoneChange](self, "cloudZoneChange");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setSaveAsProcessedWithRecord:", v4);

}

- (void)resetRecordWithRecordID:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[HMDCloudTransaction cloudZoneChange](self, "cloudZoneChange");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "resetRecordWithRecordID:", v4);

}

- (void)setDeleteAsProcessedWithRecordID:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[HMDCloudTransaction cloudZoneChange](self, "cloudZoneChange");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setDeleteAsProcessedWithRecordID:", v4);

}

- (void)updateCloudCache
{
  void *v3;
  HMDCloudTransaction *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  uint8_t buf[4];
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  if (!-[HMDCloudTransaction isTemporaryCache](self, "isTemporaryCache"))
  {
    if (-[HMDCloudTransaction decryptionFailed](self, "decryptionFailed"))
    {
      v3 = (void *)MEMORY[0x1D17BA0A0]();
      v4 = self;
      HMFGetOSLogHandle();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v11 = v6;
        _os_log_impl(&dword_1CD062000, v5, OS_LOG_TYPE_ERROR, "%{public}@Do not update cloud cache for transaction because decryption has failed.", buf, 0xCu);

      }
      objc_autoreleasePoolPop(v3);
    }
    else
    {
      -[HMDCloudTransaction cloudZoneChange](self, "cloudZoneChange");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "flushAllChangesToCache");

      -[HMDCloudTransaction updatedServerChangeToken](self, "updatedServerChangeToken");
      v9 = (id)objc_claimAutoreleasedReturnValue();
      -[HMDCloudTransaction cloudZone](self, "cloudZone");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setServerChangeToken:", v9);

    }
  }
}

- (BOOL)isLegacyTransaction
{
  return -[HMDCloudTransaction transactionType](self, "transactionType") == 1;
}

- (BOOL)isMetadataTransaction
{
  return -[HMDCloudTransaction transactionType](self, "transactionType") == 2;
}

- (BOOL)isHomeManagerTransaction
{
  return -[HMDCloudTransaction transactionType](self, "transactionType") == 3;
}

- (BOOL)isHomeTransaction
{
  return -[HMDCloudTransaction transactionType](self, "transactionType") == 4;
}

- (BOOL)shouldCreateZone
{
  return self->_createZone;
}

- (id)changeWithObjectID:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[HMDCloudTransaction cloudZoneChange](self, "cloudZoneChange");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "changeWithObjectID:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)changeWithRecordName:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[HMDCloudTransaction cloudZoneChange](self, "cloudZoneChange");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "changeWithRecordName:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)loadObjectChanges
{
  -[HMDCloudTransaction objectChanges](self, "objectChanges");

}

- (id)replayTransaction:(id)a3 stagedTransaction:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v21;
  void *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[HMDCloudTransaction objectChanges](self, "objectChanges");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v8, "mutableCopy");

  if (v7)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v21 = v9;
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = 0u;
    v24 = 0u;
    v25 = 0u;
    v26 = 0u;
    v10 = v9;
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v24;
      do
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v24 != v13)
            objc_enumerationMutation(v10);
          v15 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
          objc_msgSend(v15, "objectID", v21);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "changeWithObjectID:", v16);
          v17 = objc_claimAutoreleasedReturnValue();

          objc_msgSend(v15, "objectID");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "changeWithObjectID:", v18);
          v19 = objc_claimAutoreleasedReturnValue();

          if (v17 | v19)
          {
            objc_msgSend(v15, "replayChange:stagedChange:", v17, v19);
            if (objc_msgSend(v15, "isDropAndDoNotApply"))
              objc_msgSend(v22, "addObject:", v15);
          }

        }
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
      }
      while (v12);
    }

    objc_msgSend(v10, "removeObjectsInArray:", v22);
    v9 = v21;
  }

  return v9;
}

- (NSArray)objectChanges
{
  void *v2;
  void *v3;

  -[HMDCloudTransaction cloudZoneChange](self, "cloudZoneChange");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectChanges");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (NSUUID)identifier
{
  return self->_identifier;
}

- (HMDCloudZone)cloudZone
{
  return (HMDCloudZone *)objc_loadWeakRetained((id *)&self->_cloudZone);
}

- (void)setCloudZone:(id)a3
{
  objc_storeWeak((id *)&self->_cloudZone, a3);
}

- (BOOL)needConflictResolution
{
  return self->_needConflictResolution;
}

- (void)setNeedConflictResolution:(BOOL)a3
{
  self->_needConflictResolution = a3;
}

- (BOOL)iCloudSwitchStateEnabled
{
  return self->_iCloudSwitchStateEnabled;
}

- (void)setICloudSwitchStateEnabled:(BOOL)a3
{
  self->_iCloudSwitchStateEnabled = a3;
}

- (CKServerChangeToken)updatedServerChangeToken
{
  return self->_updatedServerChangeToken;
}

- (void)setUpdatedServerChangeToken:(id)a3
{
  objc_storeStrong((id *)&self->_updatedServerChangeToken, a3);
}

- (BOOL)isTemporaryCache
{
  return self->_temporaryCache;
}

- (BOOL)zoneHasNoLocalData
{
  return self->_zoneHasNoLocalData;
}

- (void)setCreateZone:(BOOL)a3
{
  self->_createZone = a3;
}

- (BOOL)wasZoneCreated
{
  return self->_zoneWasCreated;
}

- (void)setZoneWasCreated:(BOOL)a3
{
  self->_zoneWasCreated = a3;
}

- (BOOL)shouldDeleteZone
{
  return self->_deleteZone;
}

- (void)setDeleteZone:(BOOL)a3
{
  self->_deleteZone = a3;
}

- (BOOL)wasZoneDeleted
{
  return self->_zoneWasDeleted;
}

- (void)setZoneWasDeleted:(BOOL)a3
{
  self->_zoneWasDeleted = a3;
}

- (NSArray)recordsToSave
{
  return self->_recordsToSave;
}

- (NSArray)recordsToDelete
{
  return self->_recordsToDelete;
}

- (unint64_t)transactionType
{
  return self->_transactionType;
}

- (void)setTransactionType:(unint64_t)a3
{
  self->_transactionType = a3;
}

- (HMDCloudZoneChange)cloudZoneChange
{
  return self->_cloudZoneChange;
}

- (void)setCloudZoneChange:(id)a3
{
  objc_storeStrong((id *)&self->_cloudZoneChange, a3);
}

- (HMDCloudChange)homeDataChange
{
  return self->_homeDataChange;
}

- (void)setHomeDataChange:(id)a3
{
  objc_storeStrong((id *)&self->_homeDataChange, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_homeDataChange, 0);
  objc_storeStrong((id *)&self->_cloudZoneChange, 0);
  objc_storeStrong((id *)&self->_recordsToDelete, 0);
  objc_storeStrong((id *)&self->_recordsToSave, 0);
  objc_storeStrong((id *)&self->_updatedServerChangeToken, 0);
  objc_destroyWeak((id *)&self->_cloudZone);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_osTransaction, 0);
}

+ (id)shortDescription
{
  objc_class *v2;

  v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

@end
