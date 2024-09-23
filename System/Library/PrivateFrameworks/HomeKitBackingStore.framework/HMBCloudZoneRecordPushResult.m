@implementation HMBCloudZoneRecordPushResult

- (HMBCloudZoneRecordPushResult)initWithUpdatedRecords:(id)a3 deletedRecordIDs:(id)a4 error:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  void *v21;
  void *v22;
  HMBCloudZoneRecordPushConflict *v23;
  HMBCloudZoneRecordPushConflict *v24;
  id v25;
  void *v26;
  HMBCloudZoneRecordPushResult *v27;
  NSObject *v28;
  void *v29;
  void *v30;
  HMBCloudZoneRecordPushResult *v31;
  void *v33;
  id v34;
  id v35;
  HMBCloudZoneRecordPushResult *v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  uint8_t buf[4];
  void *v42;
  __int16 v43;
  void *v44;
  __int16 v45;
  void *v46;
  _BYTE v47[128];
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "userInfo");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "objectForKeyedSubscript:", *MEMORY[0x1E0C94940]);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v14 = v13;
  else
    v14 = 0;
  v15 = v14;

  if (v15)
  {
    v39 = 0u;
    v40 = 0u;
    v37 = 0u;
    v38 = 0u;
    v16 = v15;
    v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v37, v47, 16);
    if (v17)
    {
      v18 = v17;
      v35 = v8;
      v36 = self;
      v33 = v10;
      v34 = v9;
      v19 = *(_QWORD *)v38;
      while (2)
      {
        for (i = 0; i != v18; ++i)
        {
          if (*(_QWORD *)v38 != v19)
            objc_enumerationMutation(v16);
          v21 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * i);
          objc_msgSend(v16, "objectForKeyedSubscript:", v21, v33);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v22, "code") != 22)
          {
            v23 = -[HMBCloudZoneRecordPushConflict initWithRecordID:error:]([HMBCloudZoneRecordPushConflict alloc], "initWithRecordID:error:", v21, v22);
            if (!v23)
            {
              v26 = (void *)MEMORY[0x1D17B6230]();
              v27 = v36;
              HMFGetOSLogHandle();
              v28 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
              {
                HMFGetLogIdentifier();
                v29 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v21, "hmbDescription");
                v30 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138543874;
                v42 = v29;
                v43 = 2112;
                v44 = v30;
                v45 = 2112;
                v46 = v22;
                _os_log_impl(&dword_1CCD48000, v28, OS_LOG_TYPE_ERROR, "%{public}@Found fatal partial error for recordID %@: %@", buf, 0x20u);

              }
              objc_autoreleasePoolPop(v26);
              v10 = v33;
              v25 = v33;
              objc_msgSend(v11, "removeAllObjects");

              v9 = v34;
              v8 = v35;
              goto LABEL_20;
            }
            v24 = v23;
            objc_msgSend(v11, "addObject:", v23);

          }
        }
        v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v37, v47, 16);
        if (v18)
          continue;
        break;
      }
      v25 = 0;
      v8 = v35;
      v10 = v33;
LABEL_20:
      self = v36;
    }
    else
    {
      v25 = 0;
    }

  }
  else
  {
    v25 = v10;
  }
  v31 = -[HMBCloudZoneRecordPushResult initWithUpdatedRecords:deletedRecordIDs:conflicts:fatalError:](self, "initWithUpdatedRecords:deletedRecordIDs:conflicts:fatalError:", v8, v9, v11, v25);

  return v31;
}

- (HMBCloudZoneRecordPushResult)initWithUpdatedRecords:(id)a3 deletedRecordIDs:(id)a4 conflicts:(id)a5 fatalError:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  HMBCloudZoneRecordPushResult *v15;
  uint64_t v16;
  NSSet *updatedRecords;
  uint64_t v18;
  NSSet *deletedRecordIDs;
  uint64_t v20;
  NSSet *conflicts;
  uint64_t v22;
  NSError *fatalError;
  HMBCloudZoneRecordPushResult *v25;
  SEL v26;
  id v27;
  objc_super v28;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  if (!v10)
  {
    _HMFPreconditionFailure();
    goto LABEL_8;
  }
  if (!v11)
  {
LABEL_8:
    _HMFPreconditionFailure();
    goto LABEL_9;
  }
  if (!v12)
  {
LABEL_9:
    v25 = (HMBCloudZoneRecordPushResult *)_HMFPreconditionFailure();
    return (HMBCloudZoneRecordPushResult *)-[HMBCloudZoneRecordPushResult pushResultByMergingWithPushResult:](v25, v26, v27);
  }
  v14 = v13;
  v28.receiver = self;
  v28.super_class = (Class)HMBCloudZoneRecordPushResult;
  v15 = -[HMBCloudZoneRecordPushResult init](&v28, sel_init);
  if (v15)
  {
    v16 = objc_msgSend(v10, "copy");
    updatedRecords = v15->_updatedRecords;
    v15->_updatedRecords = (NSSet *)v16;

    v18 = objc_msgSend(v11, "copy");
    deletedRecordIDs = v15->_deletedRecordIDs;
    v15->_deletedRecordIDs = (NSSet *)v18;

    v20 = objc_msgSend(v12, "copy");
    conflicts = v15->_conflicts;
    v15->_conflicts = (NSSet *)v20;

    v22 = objc_msgSend(v14, "copy");
    fatalError = v15->_fatalError;
    v15->_fatalError = (NSError *)v22;

  }
  return v15;
}

- (id)pushResultByMergingWithPushResult:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  HMBCloudZoneRecordPushResult *v14;
  void *v15;
  HMBCloudZoneRecordPushResult *v16;
  void *v17;

  v4 = a3;
  -[HMBCloudZoneRecordPushResult updatedRecords](self, "updatedRecords");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "updatedRecords");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setByAddingObjectsFromSet:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[HMBCloudZoneRecordPushResult deletedRecordIDs](self, "deletedRecordIDs");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "deletedRecordIDs");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setByAddingObjectsFromSet:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[HMBCloudZoneRecordPushResult conflicts](self, "conflicts");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "conflicts");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setByAddingObjectsFromSet:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = [HMBCloudZoneRecordPushResult alloc];
  -[HMBCloudZoneRecordPushResult fatalError](self, "fatalError");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v15)
  {
    v16 = -[HMBCloudZoneRecordPushResult initWithUpdatedRecords:deletedRecordIDs:conflicts:fatalError:](v14, "initWithUpdatedRecords:deletedRecordIDs:conflicts:fatalError:", v7, v10, v13, v15);
  }
  else
  {
    objc_msgSend(v4, "fatalError");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = -[HMBCloudZoneRecordPushResult initWithUpdatedRecords:deletedRecordIDs:conflicts:fatalError:](v14, "initWithUpdatedRecords:deletedRecordIDs:conflicts:fatalError:", v7, v10, v13, v17);

  }
  return v16;
}

- (NSSet)updatedRecords
{
  return (NSSet *)objc_getProperty(self, a2, 8, 1);
}

- (NSSet)deletedRecordIDs
{
  return (NSSet *)objc_getProperty(self, a2, 16, 1);
}

- (NSSet)conflicts
{
  return (NSSet *)objc_getProperty(self, a2, 24, 1);
}

- (NSError)fatalError
{
  return (NSError *)objc_getProperty(self, a2, 32, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fatalError, 0);
  objc_storeStrong((id *)&self->_conflicts, 0);
  objc_storeStrong((id *)&self->_deletedRecordIDs, 0);
  objc_storeStrong((id *)&self->_updatedRecords, 0);
}

@end
