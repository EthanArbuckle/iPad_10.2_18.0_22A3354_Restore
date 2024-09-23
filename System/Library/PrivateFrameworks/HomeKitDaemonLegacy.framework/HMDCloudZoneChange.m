@implementation HMDCloudZoneChange

- (HMDCloudZoneChange)init
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

- (HMDCloudZoneChange)initWithZone:(id)a3 temporaryCache:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  HMDCloudZoneChange *v7;
  uint64_t v8;
  NSUUID *identifier;
  id v10;
  HMDCloudGroupChange *v11;
  void *v12;
  uint64_t v13;
  HMDCloudGroupChange *rootGroupChange;
  HMDCloudZoneChange *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  objc_super v20;
  uint8_t buf[4];
  void *v22;
  uint64_t v23;

  v4 = a4;
  v23 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v20.receiver = self;
  v20.super_class = (Class)HMDCloudZoneChange;
  v7 = -[HMDCloudZoneChange init](&v20, sel_init);
  if (!v7)
    goto LABEL_4;
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v8 = objc_claimAutoreleasedReturnValue();
  identifier = v7->_identifier;
  v7->_identifier = (NSUUID *)v8;

  v10 = objc_storeWeak((id *)&v7->_cloudZone, v6);
  v7->_temporaryCache = v4;
  if (v6)
  {
    v11 = [HMDCloudGroupChange alloc];
    objc_msgSend(v6, "rootGroup");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = -[HMDCloudGroupChange initWithGroup:temporaryCache:](v11, "initWithGroup:temporaryCache:", v12, v4);
    rootGroupChange = v7->_rootGroupChange;
    v7->_rootGroupChange = (HMDCloudGroupChange *)v13;

LABEL_4:
    v15 = v7;
    goto LABEL_8;
  }
  v16 = (void *)MEMORY[0x1D17BA0A0](v10);
  HMFGetOSLogHandle();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v22 = v18;
    _os_log_impl(&dword_1CD062000, v17, OS_LOG_TYPE_ERROR, "%{public}@Cloud zone must be specified", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v16);
  v15 = 0;
LABEL_8:

  return v15;
}

- (id)shortDescription
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend((id)objc_opt_class(), "shortDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDCloudZoneChange identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[HMDCloudZoneChange shortDescription](self, "shortDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDCloudZoneChange cloudZone](self, "cloudZone");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@, Cloud Zone = %@>"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (BOOL)decryptionFailed
{
  void *v2;
  char v3;

  -[HMDCloudZoneChange rootGroupChange](self, "rootGroupChange");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "decryptionFailed");

  return v3;
}

- (BOOL)encryptionFailed
{
  void *v2;
  char v3;

  -[HMDCloudZoneChange rootGroupChange](self, "rootGroupChange");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "encryptionFailed");

  return v3;
}

- (BOOL)controllerIdentifierChanged
{
  void *v2;
  char v3;

  -[HMDCloudZoneChange rootGroupChange](self, "rootGroupChange");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "controllerIdentifierChanged");

  return v3;
}

- (CKRecordID)privateZoneRootRecordID
{
  void *v2;
  void *v3;

  -[HMDCloudZoneChange cloudZone](self, "cloudZone");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "privateZoneRootRecordID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (CKRecordID *)v3;
}

- (NSArray)allTransactionStoreRowIDs
{
  void *v2;
  void *v3;

  -[HMDCloudZoneChange rootGroupChange](self, "rootGroupChange");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "allTransactionStoreRowIDs");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (NSArray)processedTransactionStoreRowIDs
{
  void *v2;
  void *v3;

  -[HMDCloudZoneChange rootGroupChange](self, "rootGroupChange");
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
  -[HMDCloudZoneChange rootGroupChange](self, "rootGroupChange");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addChangeWithObjectChange:", v4);

}

- (void)addChangeWithRecord:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[HMDCloudZoneChange rootGroupChange](self, "rootGroupChange");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addChangeWithRecord:", v4);

}

- (void)addChangeWithDeletedRecordID:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[HMDCloudZoneChange rootGroupChange](self, "rootGroupChange");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addChangeWithDeletedRecordID:", v4);

}

- (void)removeChangeWithObjectID:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[HMDCloudZoneChange rootGroupChange](self, "rootGroupChange");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeChangeWithObjectID:", v4);

}

- (BOOL)hasValidChanges
{
  void *v2;
  char v3;

  -[HMDCloudZoneChange rootGroupChange](self, "rootGroupChange");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hasValidChanges");

  return v3;
}

- (BOOL)doesRecordExistWithObjectID:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[HMDCloudZoneChange rootGroupChange](self, "rootGroupChange");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "cloudRecordWithObjectID:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6 != 0;
}

- (BOOL)doesRecordExistInCacheWithObjectID:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[HMDCloudZoneChange rootGroupChange](self, "rootGroupChange");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "cachedCloudRecordWithObjectID:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6 != 0;
}

- (BOOL)doRecordsExistInCache
{
  void *v2;
  char v3;

  -[HMDCloudZoneChange rootGroupChange](self, "rootGroupChange");
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
  -[HMDCloudZoneChange rootGroupChange](self, "rootGroupChange");
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
  -[HMDCloudZoneChange rootGroupChange](self, "rootGroupChange");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "cachedCloudRecordWithObjectID:completionHandler:", v7, v6);

}

- (void)loadCloudRecordsAndDetermineDeletesFromCache:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[HMDCloudZoneChange rootGroupChange](self, "rootGroupChange");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "loadCloudRecordsAndDetermineDeletesFromCache:", v4);

}

- (void)setAllChangedAsProcessed
{
  id v2;

  -[HMDCloudZoneChange rootGroupChange](self, "rootGroupChange");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setAllChangedAsProcessed");

}

- (BOOL)moreChangesToProcess
{
  void *v2;
  char v3;

  -[HMDCloudZoneChange rootGroupChange](self, "rootGroupChange");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "moreChangesToProcess");

  return v3;
}

- (void)fetchBatchToUpload:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[HMDCloudZoneChange rootGroupChange](self, "rootGroupChange");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "fetchBatchToUpload:", v4);

}

- (void)setSaveAsProcessedWithRecord:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[HMDCloudZoneChange rootGroupChange](self, "rootGroupChange");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setSaveAsProcessedWithRecord:", v4);

}

- (void)resetRecordWithRecordID:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[HMDCloudZoneChange rootGroupChange](self, "rootGroupChange");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "resetRecordWithRecordID:", v4);

}

- (void)setDeleteAsProcessedWithRecordID:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[HMDCloudZoneChange rootGroupChange](self, "rootGroupChange");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setDeleteAsProcessedWithRecordID:", v4);

}

- (void)flushAllChangesToCache
{
  id v2;

  -[HMDCloudZoneChange rootGroupChange](self, "rootGroupChange");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "flushAllChangesToCache");

}

- (HMDCloudZoneChange)changeWithObjectID:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[HMDCloudZoneChange rootGroupChange](self, "rootGroupChange");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "changeWithObjectID:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (HMDCloudZoneChange *)v6;
}

- (HMDCloudZoneChange)changeWithRecordName:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[HMDCloudZoneChange rootGroupChange](self, "rootGroupChange");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "changeWithRecordName:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (HMDCloudZoneChange *)v6;
}

- (NSArray)objectChanges
{
  void *v2;
  void *v3;

  -[HMDCloudZoneChange rootGroupChange](self, "rootGroupChange");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectChanges");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (BOOL)isTemporaryCache
{
  return self->_temporaryCache;
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

- (HMDCloudGroupChange)rootGroupChange
{
  return self->_rootGroupChange;
}

- (void)setRootGroupChange:(id)a3
{
  objc_storeStrong((id *)&self->_rootGroupChange, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rootGroupChange, 0);
  objc_destroyWeak((id *)&self->_cloudZone);
  objc_storeStrong((id *)&self->_identifier, 0);
}

+ (id)shortDescription
{
  objc_class *v2;

  v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

@end
