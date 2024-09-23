@implementation HMBCloudZone

- (id)decodeModelFromRecord:(id)a3 externalRecordFields:(id)a4 source:(unint64_t)a5 error:(id *)a6
{
  id v10;
  id v11;
  void *v12;
  id v13;
  void *v14;

  v10 = a3;
  v11 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v12 = v10;
  else
    v12 = 0;
  v13 = v12;
  if (v13)
    -[HMBCloudZone decodeShareModelFromShare:](self, "decodeShareModelFromShare:", v13);
  else
    -[HMBCloudZone decodeManateeCloudFromRecord:externalRecordFields:source:error:](self, "decodeManateeCloudFromRecord:externalRecordFields:source:error:", v10, v11, a5, a6);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (id)encodeRecordFromModel:(id)a3 existingRecord:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  HMBCloudZoneEncodingContext *v11;
  void *v12;
  void *v13;
  HMBCloudZone *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  int v19;
  void *v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  -[HMBCloudZone modelContainer](self, "modelContainer");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    v11 = -[HMBCloudZoneEncodingContext initWithModelContainer:]([HMBCloudZoneEncodingContext alloc], "initWithModelContainer:", v10);
    -[HMBCloudZone encodeRecordFromModel:existingRecord:encodingContext:error:](self, "encodeRecordFromModel:existingRecord:encodingContext:error:", v8, v9, v11, a5);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v13 = (void *)MEMORY[0x1D17B6230]();
    v14 = self;
    HMFGetOSLogHandle();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "hmbDescription");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = 138543618;
      v20 = v16;
      v21 = 2114;
      v22 = v17;
      _os_log_impl(&dword_1CCD48000, v15, OS_LOG_TYPE_ERROR, "%{public}@Failed to encode record from model %{public}@: Model container is nil", (uint8_t *)&v19, 0x16u);

    }
    objc_autoreleasePoolPop(v13);
    if (a5)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "hmfErrorWithCode:reason:", 8, CFSTR("Model container is nil"));
      v12 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v12 = 0;
    }
  }

  return v12;
}

- (id)encodeRecordFromModel:(id)a3 existingRecord:(id)a4 encodingContext:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  id v16;
  void *v17;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  objc_msgSend(v12, "modelContainer");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "hmbAssociateWithContainer:", v13);

  v14 = v10;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v15 = v14;
  else
    v15 = 0;
  v16 = v15;

  if (v16)
    -[HMBCloudZone encodeShareModel:](self, "encodeShareModel:", v16);
  else
    -[HMBCloudZone encodeManateeCloudModel:existingRecord:encodingContext:error:](self, "encodeManateeCloudModel:existingRecord:encodingContext:error:", v14, v11, v12, a6);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

- (id)startUpRebuilderIfNeeded
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v9[5];

  __createRebuilderIfNeeded(self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "zoneStartUp");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "rebuildCompleteFuture");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __58__HMBCloudZone_Rebuild_Internal__startUpRebuilderIfNeeded__block_invoke;
    v9[3] = &unk_1E89332C0;
    v9[4] = self;
    v7 = (id)objc_msgSend(v6, "addSuccessBlock:", v9);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D519C0], "futureWithNoResult");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v5;
}

- (void)handleLostKeys
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  _QWORD v7[5];

  __createRebuilderIfNeeded(self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "handleIdentityLost");
    objc_msgSend(v4, "rebuildCompleteFuture");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __48__HMBCloudZone_Rebuild_Internal__handleLostKeys__block_invoke;
    v7[3] = &unk_1E89332C0;
    v7[4] = self;
    v6 = (id)objc_msgSend(v5, "addSuccessBlock:", v7);

  }
}

- (BOOL)isZoneRebuildInProgress
{
  void *v2;
  void *v3;
  char v4;

  __getRebuilder(self);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
    v4 = objc_msgSend(v2, "isZoneRebuildInProgress");
  else
    v4 = 0;

  return v4;
}

- (void)handleZoneChangedNotification
{
  void *v3;
  void *v4;
  void *v5;
  HMBCloudZone *v6;
  NSObject *v7;
  void *v8;
  int v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  __getRebuilder(self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "handleZoneChanged");
  }
  else
  {
    v5 = (void *)MEMORY[0x1D17B6230]();
    v6 = self;
    HMFGetOSLogHandle();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = 138543362;
      v10 = v8;
      _os_log_impl(&dword_1CCD48000, v7, OS_LOG_TYPE_ERROR, "%{public}@Received -[handleZoneChangedNotification] on a HMBCloudZone without a rebuilder", (uint8_t *)&v9, 0xCu);

    }
    objc_autoreleasePoolPop(v5);
  }

}

- (void)handleUpdatedRebuilderModel:(id)a3
{
  id v4;
  void *v5;
  HMBCloudZone *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  HMBCloudZone *v13;
  NSObject *v14;
  void *v15;
  id v16;
  uint8_t buf[4];
  void *v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)MEMORY[0x1D17B6230]();
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v18 = v8;
    v19 = 2112;
    v20 = v4;
    _os_log_impl(&dword_1CCD48000, v7, OS_LOG_TYPE_INFO, "%{public}@Saving updated rebuilder model: %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v5);
  -[HMBCloudZone localZone](v6, "localZone");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v16, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "update:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    v12 = (void *)MEMORY[0x1D17B6230]();
    v13 = v6;
    HMFGetOSLogHandle();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v18 = v15;
      v19 = 2112;
      v20 = v11;
      _os_log_impl(&dword_1CCD48000, v14, OS_LOG_TYPE_ERROR, "%{public}@Failed to update rebuilder model: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v12);
  }

}

- (void)rebuild
{
  void *v3;
  void *v4;
  void *v5;
  HMBCloudZone *v6;
  NSObject *v7;
  void *v8;
  int v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  __getRebuilder(self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "rebuild");
  }
  else
  {
    v5 = (void *)MEMORY[0x1D17B6230]();
    v6 = self;
    HMFGetOSLogHandle();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = 138543362;
      v10 = v8;
      _os_log_impl(&dword_1CCD48000, v7, OS_LOG_TYPE_ERROR, "%{public}@Received -[rebuild] on a HMBCloudZone without a rebuilder", (uint8_t *)&v9, 0xCu);

    }
    objc_autoreleasePoolPop(v5);
  }

}

void __48__HMBCloudZone_Rebuild_Internal__handleLostKeys__block_invoke(uint64_t a1)
{
  __destroyRebuilder(*(void **)(a1 + 32));
}

void __58__HMBCloudZone_Rebuild_Internal__startUpRebuilderIfNeeded__block_invoke(uint64_t a1)
{
  __destroyRebuilder(*(void **)(a1 + 32));
}

- (int64_t)keyStatus
{
  void *v2;
  void *v3;
  void *v4;
  int64_t v5;

  __getRebuilder(self);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "rebuilderStatus");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "keyStatus");

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (NAFuture)waitForPendingRebuild
{
  void *v2;
  void *v3;
  void *v4;

  __getRebuilder(self);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
    objc_msgSend(v2, "rebuildCompleteFuture");
  else
    objc_msgSend(MEMORY[0x1E0D519C0], "futureWithNoResult");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NAFuture *)v4;
}

- (id)encodeShareModel:(id)a3
{
  void *v3;
  void *v4;

  objc_msgSend(a3, "share");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "copy");

  return v4;
}

- (id)decodeShareModelFromShare:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  HMBCloudZoneShareModel *v14;
  void *v15;
  HMBCloudZoneShareModel *v16;

  v4 = a3;
  objc_msgSend(v4, "recordID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "recordName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isEqualToString:", *MEMORY[0x1E0C949F0]);

  if (v7)
  {
    -[HMBCloudZone shareModel](self, "shareModel");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "hmbModelID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v9)
    {
      objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 0;
      goto LABEL_7;
    }
    v10 = v9;
    v11 = v10;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "recordID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "recordName");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (id)objc_msgSend(v12, "initWithUUIDString:", v11);
  }
  v13 = v10;
LABEL_7:

  v14 = [HMBCloudZoneShareModel alloc];
  -[HMBCloudZone stateModelID](self, "stateModelID");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = -[HMBModel initWithModelID:parentModelID:](v14, "initWithModelID:parentModelID:", v13, v15);

  -[HMBCloudZoneShareModel setShare:](v16, "setShare:", v4);
  return v16;
}

- (HMBCloudZone)initWithCloudDatabase:(id)a3 configuration:(id)a4 state:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  HMBCloudZone *v12;
  HMBCloudZone *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  CKDatabase *database;
  NAFuture *v18;
  NAFuture *startUp;
  void *v20;
  uint64_t v21;
  HMBCloudZoneID *cloudZoneID;
  uint64_t v23;
  NSUUID *stateModelID;
  uint64_t v25;
  NAScheduler *operationScheduler;
  void *v27;
  uint64_t v28;
  NSString *deviceIdentifier;
  uint64_t v30;
  HMBCloudZoneConfiguration *configuration;
  uint64_t v32;
  NSMapTable *modelClassToRequiresPostProcessingMap;
  uint64_t v34;
  NSMutableDictionary *shareParticipantModelsByClientIdentifier;
  uint64_t v36;
  NSMutableDictionary *inProgressPushFuturesByOutputBlockRow;
  uint64_t v38;
  NAScheduler *v39;
  NSOperationQueue *v40;
  NSOperationQueue *recordOperationQueue;
  NSOperationQueue *v42;
  NSOperationQueue *shareOperationQueue;
  NSArray *defaultDesiredKeys;
  HMBCloudZone *result;
  HMBCloudZone *v46;
  SEL v47;
  objc_super v48;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (!v8)
  {
    _HMFPreconditionFailure();
    goto LABEL_15;
  }
  v11 = v10;
  if (!v10)
  {
LABEL_15:
    _HMFPreconditionFailure();
    goto LABEL_16;
  }
  v48.receiver = self;
  v48.super_class = (Class)HMBCloudZone;
  v12 = -[HMBCloudZone init](&v48, sel_init);
  v13 = v12;
  if (!v12)
  {
LABEL_13:

    return v13;
  }
  objc_storeWeak((id *)&v12->_cloudDatabase, v8);
  objc_msgSend(v11, "zoneID");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "scope");

  switch(v15)
  {
    case 1:
      objc_msgSend(v8, "publicDatabase");
      v16 = objc_claimAutoreleasedReturnValue();
      break;
    case 2:
      objc_msgSend(v8, "privateDatabase");
      v16 = objc_claimAutoreleasedReturnValue();
      break;
    case 3:
      objc_msgSend(v8, "sharedDatabase");
      v16 = objc_claimAutoreleasedReturnValue();
      break;
    default:
      goto LABEL_11;
  }
  database = v13->_database;
  v13->_database = (CKDatabase *)v16;

LABEL_11:
  if (v13->_database)
  {
    v18 = (NAFuture *)objc_alloc_init(MEMORY[0x1E0D519C0]);
    startUp = v13->_startUp;
    v13->_startUp = v18;

    objc_msgSend(v8, "stateZone");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeWeak((id *)&v13->_stateZone, v20);

    objc_msgSend(v11, "zoneID");
    v21 = objc_claimAutoreleasedReturnValue();
    cloudZoneID = v13->_cloudZoneID;
    v13->_cloudZoneID = (HMBCloudZoneID *)v21;

    objc_msgSend(v11, "hmbModelID");
    v23 = objc_claimAutoreleasedReturnValue();
    stateModelID = v13->_stateModelID;
    v13->_stateModelID = (NSUUID *)v23;

    -[HMBCloudZone operationScheduler](v13, "operationScheduler");
    v25 = objc_claimAutoreleasedReturnValue();
    operationScheduler = v13->_operationScheduler;
    v13->_operationScheduler = (NAScheduler *)v25;

    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "UUIDString");
    v28 = objc_claimAutoreleasedReturnValue();
    deviceIdentifier = v13->_deviceIdentifier;
    v13->_deviceIdentifier = (NSString *)v28;

    v30 = objc_msgSend(v9, "copy");
    configuration = v13->_configuration;
    v13->_configuration = (HMBCloudZoneConfiguration *)v30;

    objc_msgSend(MEMORY[0x1E0CB3748], "strongToStrongObjectsMapTable");
    v32 = objc_claimAutoreleasedReturnValue();
    modelClassToRequiresPostProcessingMap = v13->_modelClassToRequiresPostProcessingMap;
    v13->_modelClassToRequiresPostProcessingMap = (NSMapTable *)v32;

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v34 = objc_claimAutoreleasedReturnValue();
    shareParticipantModelsByClientIdentifier = v13->_shareParticipantModelsByClientIdentifier;
    v13->_shareParticipantModelsByClientIdentifier = (NSMutableDictionary *)v34;

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v36 = objc_claimAutoreleasedReturnValue();
    inProgressPushFuturesByOutputBlockRow = v13->_inProgressPushFuturesByOutputBlockRow;
    v13->_inProgressPushFuturesByOutputBlockRow = (NSMutableDictionary *)v36;

    objc_msgSend(MEMORY[0x1E0D519E8], "globalAsyncScheduler");
    v38 = objc_claimAutoreleasedReturnValue();
    v39 = v13->_operationScheduler;
    v13->_operationScheduler = (NAScheduler *)v38;

    v40 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x1E0CB3828]);
    recordOperationQueue = v13->_recordOperationQueue;
    v13->_recordOperationQueue = v40;

    -[NSOperationQueue setMaxConcurrentOperationCount:](v13->_recordOperationQueue, "setMaxConcurrentOperationCount:", 1);
    -[NSOperationQueue setQualityOfService:](v13->_recordOperationQueue, "setQualityOfService:", 25);
    v42 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x1E0CB3828]);
    shareOperationQueue = v13->_shareOperationQueue;
    v13->_shareOperationQueue = v42;

    -[NSOperationQueue setMaxConcurrentOperationCount:](v13->_shareOperationQueue, "setMaxConcurrentOperationCount:", 1);
    -[NSOperationQueue setQualityOfService:](v13->_shareOperationQueue, "setQualityOfService:", 17);
    defaultDesiredKeys = v13->_defaultDesiredKeys;
    v13->_defaultDesiredKeys = (NSArray *)&unk_1E8947918;

    goto LABEL_13;
  }
LABEL_16:
  v46 = (HMBCloudZone *)_HMFPreconditionFailure();
  -[HMBCloudZone dealloc](v46, v47);
  return result;
}

- (void)dealloc
{
  void *v3;
  HMBCloudZone *v4;
  NSObject *v5;
  void *v6;
  objc_super v7;
  uint8_t buf[4];
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1D17B6230](self, a2);
  v4 = self;
  HMFGetOSLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    HMFGetLogIdentifier();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v9 = v6;
    _os_log_impl(&dword_1CCD48000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@Deallocating HMBCloudZone", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v3);
  v7.receiver = v4;
  v7.super_class = (Class)HMBCloudZone;
  -[HMBCloudZone dealloc](&v7, sel_dealloc);
}

- (id)shutdown
{
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[5];

  -[HMBCloudZone startUp](self, "startUp");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "recoverIgnoringError");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __24__HMBCloudZone_shutdown__block_invoke;
  v7[3] = &unk_1E8931490;
  v7[4] = self;
  objc_msgSend(v4, "flatMap:", v7);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)destroy
{
  HMBCloudZone *v2;
  os_unfair_lock_s *p_propertyLock;
  void *v4;
  id v5;
  void *v6;
  HMBCloudZone *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  int v17;
  void *v18;
  __int16 v19;
  HMBCloudZone *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v2 = self;
  p_propertyLock = &v2->_propertyLock;
  os_unfair_lock_lock_with_options();
  -[HMBCloudZone destroyFuture](v2, "destroyFuture");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    os_unfair_lock_unlock(p_propertyLock);
  }
  else
  {
    v5 = objc_alloc_init(MEMORY[0x1E0D519C0]);
    -[HMBCloudZone setDestroyFuture:](v2, "setDestroyFuture:", v5);

    os_unfair_lock_unlock(p_propertyLock);
    v6 = (void *)MEMORY[0x1D17B6230]();
    v7 = v2;
    HMFGetOSLogHandle();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = 138543618;
      v18 = v9;
      v19 = 2112;
      v20 = v7;
      _os_log_impl(&dword_1CCD48000, v8, OS_LOG_TYPE_INFO, "%{public}@Destroying cloud zone: %@", (uint8_t *)&v17, 0x16u);

    }
    objc_autoreleasePoolPop(v6);
    -[HMBCloudZone cloudDatabase](v7, "cloudDatabase");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMBCloudZone cloudZoneID](v7, "cloudZoneID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "removeZoneWithID:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMBCloudZone destroyFuture](v7, "destroyFuture");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "completionHandlerAdapter");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (id)objc_msgSend(v12, "addCompletionBlock:", v14);

  }
  -[HMBCloudZone destroyFuture](v2, "destroyFuture");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)triggerOutputForOutputRow:(unint64_t)a3 options:(id)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  _QWORD v11[5];
  id v12;
  unint64_t v13;

  v6 = a4;
  -[HMBCloudZone startUp](self, "startUp");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __50__HMBCloudZone_triggerOutputForOutputRow_options___block_invoke;
  v11[3] = &unk_1E89314B8;
  v12 = v6;
  v13 = a3;
  v11[4] = self;
  v8 = v6;
  objc_msgSend(v7, "flatMap:", v11);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (BOOL)retryCloudKitOperation:(id)a3 afterError:(id)a4 retryBlock:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  HMBCloudZone *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  int v18;
  char v19;
  void *v20;
  HMBCloudZone *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  void *v25;
  _QWORD v27[4];
  id v28;
  uint8_t buf[4];
  void *v30;
  __int16 v31;
  id v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[HMBCloudZone notifyDelegateOfError:forOperation:](self, "notifyDelegateOfError:forOperation:", v9, v8);
  if (objc_msgSend(v9, "hmbIsCKMissingManateeIdentityError"))
  {
    v11 = (void *)MEMORY[0x1D17B6230]();
    v12 = self;
    HMFGetOSLogHandle();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v30 = v14;
      v31 = 2112;
      v32 = v9;
      _os_log_impl(&dword_1CCD48000, v13, OS_LOG_TYPE_ERROR, "%{public}@Received missing Manatee identity error on zone specific operation: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v11);
    -[HMBCloudZone handleLostKeys](v12, "handleLostKeys");
    -[HMBCloudZone waitForPendingRebuild](v12, "waitForPendingRebuild");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v27[0] = MEMORY[0x1E0C809B0];
    v27[1] = 3221225472;
    v27[2] = __61__HMBCloudZone_retryCloudKitOperation_afterError_retryBlock___block_invoke;
    v27[3] = &unk_1E89314E0;
    v28 = v10;
    v16 = (id)objc_msgSend(v15, "addSuccessBlock:", v27);

    -[HMBCloudZone configuration](v12, "configuration");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "shouldRebuildOnManateeKeyLoss");

    if (v18)
      -[HMBCloudZone rebuild](v12, "rebuild");

    v19 = 1;
  }
  else if (objc_msgSend(v9, "hmbIsCKZoneDisabledError"))
  {
    v20 = (void *)MEMORY[0x1D17B6230]();
    v21 = self;
    HMFGetOSLogHandle();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v30 = v23;
      v31 = 2112;
      v32 = v9;
      _os_log_impl(&dword_1CCD48000, v22, OS_LOG_TYPE_ERROR, "%{public}@Received zone disabled error: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v20);
    -[HMBCloudZone delegate](v21, "delegate");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v24, "cloudZone:didEncounterZoneDisabledError:", v21, v9);

    v19 = 0;
  }
  else
  {
    -[HMBCloudZone cloudDatabase](self, "cloudDatabase");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v25, "_retryCloudKitOperationAfterError:retryBlock:", v9, v10);

  }
  return v19;
}

- (void)notifyDelegateOfError:(id)a3 forOperation:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  HMBCloudZone *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  id v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[HMBCloudZone cloudDatabase](self, "cloudDatabase");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "delegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v10 = (void *)MEMORY[0x1D17B6230]();
    v11 = self;
    HMFGetOSLogHandle();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      HMFGetLogIdentifier();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 138544130;
      v16 = v13;
      v17 = 2112;
      v18 = v9;
      v19 = 2112;
      v20 = v7;
      v21 = 2112;
      v22 = v6;
      _os_log_impl(&dword_1CCD48000, v12, OS_LOG_TYPE_DEBUG, "%{public}@Notifying delegate %@ for error on operation %@: %@", (uint8_t *)&v15, 0x2Au);

    }
    objc_autoreleasePoolPop(v10);
    -[HMBCloudZone cloudZoneID](v11, "cloudZoneID");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "cloudDatabase:encounteredError:withOperation:onZone:", v8, v6, v7, v14);

  }
}

- (void)startUpWithLocalZone:(id)a3
{
  id v4;
  BOOL v5;
  void *v6;
  HMBCloudZone *v7;
  NSObject *v8;
  _BOOL4 v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _BOOL4 v14;
  int v15;
  void *v16;
  __int16 v17;
  id v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  os_unfair_lock_lock_with_options();
  v5 = -[HMBCloudZone hasStartedUp](self, "hasStartedUp");
  -[HMBCloudZone setHasStartedUp:](self, "setHasStartedUp:", 1);
  os_unfair_lock_unlock(&self->_propertyLock);
  v6 = (void *)MEMORY[0x1D17B6230]();
  v7 = self;
  HMFGetOSLogHandle();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = os_log_type_enabled(v8, OS_LOG_TYPE_INFO);
  if (v5)
  {
    if (v9)
    {
      HMFGetLogIdentifier();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 138543362;
      v16 = v10;
      _os_log_impl(&dword_1CCD48000, v8, OS_LOG_TYPE_INFO, "%{public}@Not starting up cloud zone that has already started up", (uint8_t *)&v15, 0xCu);

    }
    objc_autoreleasePoolPop(v6);
  }
  else
  {
    if (v9)
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMBCloudZone configuration](v7, "configuration");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 138543874;
      v16 = v11;
      v17 = 2112;
      v18 = v4;
      v19 = 2112;
      v20 = v12;
      _os_log_impl(&dword_1CCD48000, v8, OS_LOG_TYPE_INFO, "%{public}@Starting up with local zone: %@ configuration: %@", (uint8_t *)&v15, 0x20u);

    }
    objc_autoreleasePoolPop(v6);
    -[HMBCloudZone setLocalZone:](v7, "setLocalZone:", v4);
    -[HMBCloudZone cloudZoneID](v7, "cloudZoneID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "scope") == 1;

    if (v14)
      -[HMBCloudZone _startUpWithPublicLocalZone:](v7, "_startUpWithPublicLocalZone:", v4);
    else
      -[HMBCloudZone _startUpWithPrivateLocalZone:](v7, "_startUpWithPrivateLocalZone:", v4);
  }

}

- (void)_startUpWithPrivateLocalZone:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  HMBCloudZone *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  id v27;
  id v28;
  _QWORD v29[5];
  id v30;
  id v31;
  _QWORD v32[5];
  _QWORD v33[5];
  _QWORD v34[5];
  uint8_t buf[4];
  void *v36;
  __int16 v37;
  void *v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[HMBCloudZone cloudDatabase](self, "cloudDatabase");
  v5 = objc_claimAutoreleasedReturnValue();
  if (!v5)
    _HMFPreconditionFailure();
  v6 = (void *)v5;
  -[HMBCloudZone initializeShareModels](self, "initializeShareModels");
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "performInitialCloudSync");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)MEMORY[0x1D17B6230]();
  v10 = self;
  HMFGetOSLogHandle();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v36 = v12;
    v37 = 2112;
    v38 = v8;
    _os_log_impl(&dword_1CCD48000, v11, OS_LOG_TYPE_INFO, "%{public}@Zone startup steps will begin after initial cloud sync future: %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v9);
  objc_msgSend(v7, "addObject:", v8);
  -[HMBCloudZone cloudZoneID](v10, "cloudZoneID");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "scope");

  if (v14 == 2)
  {
    -[HMBCloudZone createZoneState](v10, "createZoneState");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObject:", v15);

  }
  -[HMBCloudZone startUpRebuilderIfNeeded](v10, "startUpRebuilderIfNeeded");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addObject:", v16);

  v17 = MEMORY[0x1E0C809B0];
  v18 = (void *)MEMORY[0x1E0D519C0];
  v34[0] = MEMORY[0x1E0C809B0];
  v34[1] = 3221225472;
  v34[2] = __45__HMBCloudZone__startUpWithPrivateLocalZone___block_invoke;
  v34[3] = &unk_1E8932450;
  v34[4] = v10;
  -[HMBCloudZone operationScheduler](v10, "operationScheduler");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "lazyFutureWithBlock:scheduler:", v34, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addObject:", v20);

  v21 = (void *)MEMORY[0x1E0D519C0];
  v33[0] = v17;
  v33[1] = 3221225472;
  v33[2] = __45__HMBCloudZone__startUpWithPrivateLocalZone___block_invoke_2;
  v33[3] = &unk_1E8932450;
  v33[4] = v10;
  -[HMBCloudZone operationScheduler](v10, "operationScheduler");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "lazyFutureWithBlock:scheduler:", v33, v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addObject:", v23);

  objc_msgSend(MEMORY[0x1E0D519C0], "chainFutures:", v7);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v32[0] = v17;
  v32[1] = 3221225472;
  v32[2] = __45__HMBCloudZone__startUpWithPrivateLocalZone___block_invoke_56;
  v32[3] = &unk_1E89332C0;
  v32[4] = v10;
  objc_msgSend(v24, "addSuccessBlock:", v32);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v29[0] = v17;
  v29[1] = 3221225472;
  v29[2] = __45__HMBCloudZone__startUpWithPrivateLocalZone___block_invoke_57;
  v29[3] = &unk_1E8931508;
  v29[4] = v10;
  v30 = v6;
  v31 = v4;
  v26 = v4;
  v27 = v6;
  v28 = (id)objc_msgSend(v25, "addFailureBlock:", v29);

}

- (void)_startUpWithPublicLocalZone:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  BOOL v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  HMBCloudZone *v17;
  NSObject *v18;
  void *v19;
  _QWORD v20[5];
  id v21;
  id v22;
  _QWORD v23[5];
  _QWORD v24[5];
  uint8_t buf[4];
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[HMBCloudZone cloudDatabase](self, "cloudDatabase");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMBCloudZone startUpRebuilderIfNeeded](self, "startUpRebuilderIfNeeded");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObject:", v7);

    v8 = -[HMBCloudZone hasPerformedInitialFetch](self, "hasPerformedInitialFetch");
    v9 = MEMORY[0x1E0C809B0];
    if (!v8)
    {
      v10 = (void *)MEMORY[0x1E0D519C0];
      v24[0] = MEMORY[0x1E0C809B0];
      v24[1] = 3221225472;
      v24[2] = __44__HMBCloudZone__startUpWithPublicLocalZone___block_invoke;
      v24[3] = &unk_1E8932450;
      v24[4] = self;
      -[HMBCloudZone operationScheduler](self, "operationScheduler");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "lazyFutureWithBlock:scheduler:", v24, v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "addObject:", v12);

    }
    objc_msgSend(MEMORY[0x1E0D519C0], "chainFutures:", v6);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v23[0] = v9;
    v23[1] = 3221225472;
    v23[2] = __44__HMBCloudZone__startUpWithPublicLocalZone___block_invoke_2;
    v23[3] = &unk_1E89332C0;
    v23[4] = self;
    objc_msgSend(v13, "addSuccessBlock:", v23);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v20[0] = v9;
    v20[1] = 3221225472;
    v20[2] = __44__HMBCloudZone__startUpWithPublicLocalZone___block_invoke_63;
    v20[3] = &unk_1E8931508;
    v20[4] = self;
    v21 = v5;
    v22 = v4;
    v15 = (id)objc_msgSend(v14, "addFailureBlock:", v20);

  }
  else
  {
    v16 = (void *)MEMORY[0x1D17B6230]();
    v17 = self;
    HMFGetOSLogHandle();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v26 = v19;
      _os_log_impl(&dword_1CCD48000, v18, OS_LOG_TYPE_ERROR, "%{public}@Failed to start up with local zone because cloud database reference is nil", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v16);
  }

}

- (HMBModelContainer)modelContainer
{
  void *v2;
  void *v3;

  -[HMBCloudZone localZone](self, "localZone");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "modelContainer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (HMBModelContainer *)v3;
}

- (id)flush
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[5];

  v2 = (void *)MEMORY[0x1E0D519C0];
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __21__HMBCloudZone_flush__block_invoke;
  v6[3] = &unk_1E8932450;
  v6[4] = self;
  -[HMBCloudZone operationScheduler](self, "operationScheduler");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "futureWithBlock:scheduler:", v6, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BOOL)isInternalModel:(id)a3
{
  id v3;
  void *v4;
  char v5;
  void *v6;
  void *v7;

  v3 = a3;
  objc_msgSend(v3, "hmbType");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v4, "isEqualToString:", CFSTR("HMBCloudZoneShareModel")) & 1) != 0)
  {
    v5 = 1;
  }
  else
  {
    objc_msgSend(v3, "hmbType");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v6, "isEqualToString:", CFSTR("HMBCloudZoneShareParticipantModel")) & 1) != 0)
    {
      v5 = 1;
    }
    else
    {
      objc_msgSend(v3, "hmbType");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = objc_msgSend(v7, "isEqualToString:", CFSTR("HMBCloudZoneRebuilderModel"));

    }
  }

  return v5;
}

- (void)handleUpdatedInternalModels:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t i;
  id v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  id v19;
  void *v20;
  id v21;
  void *v22;
  HMBCloudZone *v23;
  NSObject *v24;
  void *v25;
  void *v26;
  HMBCloudZone *v27;
  id v28;
  void *v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  uint8_t buf[4];
  void *v35;
  __int16 v36;
  id v37;
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v30, v38, 16);
  if (v7)
  {
    v8 = v7;
    v9 = 0;
    v10 = *(_QWORD *)v31;
    v27 = self;
    v28 = v6;
    v29 = v5;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v31 != v10)
          objc_enumerationMutation(v6);
        v12 = *(id *)(*((_QWORD *)&v30 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v13 = v12;
        else
          v13 = 0;
        v14 = v13;

        if (v14)
        {
          v15 = v14;
          v16 = v9;
          v9 = v12;
        }
        else
        {
          v17 = v12;
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
            v18 = v17;
          else
            v18 = 0;
          v16 = v18;

          if (v16)
          {
            objc_msgSend(v5, "addObject:", v16);
          }
          else
          {
            v19 = v17;
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
              v20 = v19;
            else
              v20 = 0;
            v21 = v20;

            if (v21)
            {
              -[HMBCloudZone handleUpdatedRebuilderModel:](self, "handleUpdatedRebuilderModel:", v21);
            }
            else
            {
              v22 = (void *)MEMORY[0x1D17B6230]();
              v23 = self;
              HMFGetOSLogHandle();
              v24 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
              {
                HMFGetLogIdentifier();
                v26 = v22;
                v25 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138543618;
                v35 = v25;
                v36 = 2112;
                v37 = v19;
                _os_log_impl(&dword_1CCD48000, v24, OS_LOG_TYPE_ERROR, "%{public}@Asked to handle unexpected updated model: %@", buf, 0x16u);

                v22 = v26;
              }

              objc_autoreleasePoolPop(v22);
              self = v27;
            }

            v16 = 0;
            v6 = v28;
            v5 = v29;
          }
        }

      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v30, v38, 16);
    }
    while (v8);
  }
  else
  {
    v9 = 0;
  }

  if (objc_msgSend(v5, "count"))
    -[HMBCloudZone handleUpdatedShareParticipantModels:](self, "handleUpdatedShareParticipantModels:", v5);
  if (v9)
    -[HMBCloudZone handleUpdatedShareModel:](self, "handleUpdatedShareModel:", v9);

}

- (void)handleDeletion
{
  void *v3;
  void *v4;
  void *v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  -[HMBCloudZone cloudDatabase](self, "cloudDatabase");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMBCloudZone cloudZoneID](self, "cloudZoneID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "handleRemovedZoneIDs:userInitiated:", v5, 1);

}

- (id)createZoneState
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  HMBCloudZone *v9;
  SEL v10;
  _QWORD v11[5];

  -[HMBCloudZone cloudZoneID](self, "cloudZoneID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "scope");

  if (v4 == 2)
  {
    v5 = (void *)MEMORY[0x1E0D519C0];
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __31__HMBCloudZone_createZoneState__block_invoke;
    v11[3] = &unk_1E8932450;
    v11[4] = self;
    objc_msgSend(MEMORY[0x1E0D519E8], "immediateScheduler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "lazyFutureWithBlock:scheduler:", v11, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    return v7;
  }
  else
  {
    v9 = (HMBCloudZone *)_HMFPreconditionFailure();
    return -[HMBCloudZone zoneID](v9, v10);
  }
}

- (id)logIdentifier
{
  void *v2;
  void *v3;
  void *v4;

  -[HMBCloudZone cloudZoneID](self, "cloudZoneID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "zoneID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "hmbDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)attributeDescriptions
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc(MEMORY[0x1E0D28548]);
  -[HMBCloudZone zoneID](self, "zoneID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithName:value:", CFSTR("Zone ID"), v4);
  v8[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (NAFuture)startUp
{
  return self->_startUp;
}

- (HMBCloudDatabase)cloudDatabase
{
  return (HMBCloudDatabase *)objc_loadWeakRetained((id *)&self->_cloudDatabase);
}

- (void)setCloudDatabase:(id)a3
{
  objc_storeWeak((id *)&self->_cloudDatabase, a3);
}

- (HMBCloudZoneDelegate)delegate
{
  return (HMBCloudZoneDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (HMBCloudZoneID)cloudZoneID
{
  return self->_cloudZoneID;
}

- (HMBCloudZoneConfiguration)configuration
{
  return self->_configuration;
}

- (HMBLocalZone)localZone
{
  return (HMBLocalZone *)objc_loadWeakRetained((id *)&self->_localZone);
}

- (void)setLocalZone:(id)a3
{
  objc_storeWeak((id *)&self->_localZone, a3);
}

- (CKDatabase)database
{
  return self->_database;
}

- (HMBLocalZone)stateZone
{
  return (HMBLocalZone *)objc_loadWeakRetained((id *)&self->_stateZone);
}

- (void)setStateZone:(id)a3
{
  objc_storeWeak((id *)&self->_stateZone, a3);
}

- (NSUUID)stateModelID
{
  return self->_stateModelID;
}

- (BOOL)hasStartedUp
{
  return self->_hasStartedUp;
}

- (void)setHasStartedUp:(BOOL)a3
{
  self->_hasStartedUp = a3;
}

- (NSMapTable)modelClassToRequiresPostProcessingMap
{
  return self->_modelClassToRequiresPostProcessingMap;
}

- (NSMutableDictionary)inProgressPushFuturesByOutputBlockRow
{
  return self->_inProgressPushFuturesByOutputBlockRow;
}

- (NSString)deviceIdentifier
{
  return self->_deviceIdentifier;
}

- (NAFuture)shutdownFuture
{
  return self->_shutdownFuture;
}

- (void)setShutdownFuture:(id)a3
{
  objc_storeStrong((id *)&self->_shutdownFuture, a3);
}

- (NAFuture)destroyFuture
{
  return self->_destroyFuture;
}

- (void)setDestroyFuture:(id)a3
{
  objc_storeStrong((id *)&self->_destroyFuture, a3);
}

- (HMBCloudZoneRebuilder)rebuilder
{
  return self->_rebuilder;
}

- (void)setRebuilder:(id)a3
{
  objc_storeStrong((id *)&self->_rebuilder, a3);
}

- (NAScheduler)operationScheduler
{
  return self->_operationScheduler;
}

- (NSOperationQueue)recordOperationQueue
{
  return self->_recordOperationQueue;
}

- (NSOperationQueue)shareOperationQueue
{
  return self->_shareOperationQueue;
}

- (NAFuture)queuedCloudPullFuture
{
  return (NAFuture *)objc_getProperty(self, a2, 160, 1);
}

- (void)setQueuedCloudPullFuture:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 160);
}

- (NSMutableSet)queuedFetchRecordsContexts
{
  return (NSMutableSet *)objc_getProperty(self, a2, 168, 1);
}

- (void)setQueuedFetchRecordsContexts:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 168);
}

- (HMBCloudZoneShareModel)shareModel
{
  return (HMBCloudZoneShareModel *)objc_getProperty(self, a2, 176, 1);
}

- (void)setShareModel:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 176);
}

- (NSMutableDictionary)shareParticipantModelsByClientIdentifier
{
  return self->_shareParticipantModelsByClientIdentifier;
}

- (NSArray)defaultDesiredKeys
{
  return self->_defaultDesiredKeys;
}

- (void)setDefaultDesiredKeys:(id)a3
{
  objc_storeStrong((id *)&self->_defaultDesiredKeys, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_defaultDesiredKeys, 0);
  objc_storeStrong((id *)&self->_shareParticipantModelsByClientIdentifier, 0);
  objc_storeStrong((id *)&self->_shareModel, 0);
  objc_storeStrong((id *)&self->_queuedFetchRecordsContexts, 0);
  objc_storeStrong((id *)&self->_queuedCloudPullFuture, 0);
  objc_storeStrong((id *)&self->_shareOperationQueue, 0);
  objc_storeStrong((id *)&self->_recordOperationQueue, 0);
  objc_storeStrong((id *)&self->_operationScheduler, 0);
  objc_storeStrong((id *)&self->_rebuilder, 0);
  objc_storeStrong((id *)&self->_destroyFuture, 0);
  objc_storeStrong((id *)&self->_shutdownFuture, 0);
  objc_storeStrong((id *)&self->_deviceIdentifier, 0);
  objc_storeStrong((id *)&self->_inProgressPushFuturesByOutputBlockRow, 0);
  objc_storeStrong((id *)&self->_modelClassToRequiresPostProcessingMap, 0);
  objc_storeStrong((id *)&self->_stateModelID, 0);
  objc_destroyWeak((id *)&self->_stateZone);
  objc_storeStrong((id *)&self->_database, 0);
  objc_destroyWeak((id *)&self->_localZone);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_cloudZoneID, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_cloudDatabase);
  objc_storeStrong((id *)&self->_startUp, 0);
}

void __31__HMBCloudZone_createZoneState__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  char v9;
  id v10;
  void *v11;
  char v12;
  id v13;
  void *v14;
  int v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  id v21;
  NSObject *v22;
  void *v23;
  void *v24;
  id v25;
  NSObject *v26;
  void *v27;
  id v28;
  id v29;
  uint8_t buf[4];
  void *v31;
  __int16 v32;
  id v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "cloudDatabase");
  v4 = objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    _HMFPreconditionFailure();
LABEL_17:
    _HMFPreconditionFailure();
  }
  v5 = (void *)v4;
  objc_msgSend(*(id *)(a1 + 32), "localZone");
  v6 = objc_claimAutoreleasedReturnValue();
  if (!v6)
    goto LABEL_17;
  v7 = (void *)v6;
  v8 = *(_QWORD *)(a1 + 32);
  v29 = 0;
  v9 = objc_msgSend(v5, "reopenOrRecreatePrivateZone:error:", v8, &v29);
  v10 = v29;
  if ((v9 & 1) != 0)
  {
    objc_msgSend(v5, "localDatabase");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = v10;
    v12 = objc_msgSend(v11, "reopenZone:error:", v7, &v28);
    v13 = v28;

    if ((v12 & 1) != 0)
    {
      objc_msgSend(*(id *)(a1 + 32), "cloudZoneID");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v5, "needsZoneCreationForZoneWithID:", v14);

      if (v15)
      {
        objc_msgSend(*(id *)(a1 + 32), "cloudZoneID");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "createPrivateZoneWithID:", v16);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "completionHandlerAdapter");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = (id)objc_msgSend(v17, "addCompletionBlock:", v18);

      }
      else
      {
        objc_msgSend(v3, "finishWithNoResult");
      }
    }
    else
    {
      v24 = (void *)MEMORY[0x1D17B6230]();
      v25 = *(id *)(a1 + 32);
      HMFGetOSLogHandle();
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v31 = v27;
        v32 = 2114;
        v33 = v13;
        _os_log_impl(&dword_1CCD48000, v26, OS_LOG_TYPE_ERROR, "%{public}@Failed to re-open or re-create local zone during startup: %{public}@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v24);
      objc_msgSend(v3, "finishWithError:", v13);
    }
    v10 = v13;
  }
  else
  {
    v20 = (void *)MEMORY[0x1D17B6230]();
    v21 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v31 = v23;
      v32 = 2114;
      v33 = v10;
      _os_log_impl(&dword_1CCD48000, v22, OS_LOG_TYPE_ERROR, "%{public}@Failed to re-open or re-create private cloud zone during startup: %{public}@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v20);
    objc_msgSend(v3, "finishWithError:", v10);
  }

}

void __21__HMBCloudZone_flush__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;

  v2 = *(void **)(a1 + 32);
  v5 = a2;
  objc_msgSend(v2, "database");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "operationQueue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "waitUntilAllOperationsAreFinished");

  objc_msgSend(v5, "finishWithNoResult");
}

void __44__HMBCloudZone__startUpWithPublicLocalZone___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  id v7;

  v3 = a2;
  +[HMBProcessingOptions optionsWithLabel:](HMBProcessingOptions, "optionsWithLabel:", CFSTR("HMBCloudZone First Fetch"));
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "performStartupCloudPullWithOptions:", v7);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "completionHandlerAdapter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = (id)objc_msgSend(v4, "addCompletionBlock:", v5);
}

void __44__HMBCloudZone__startUpWithPublicLocalZone___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = (void *)MEMORY[0x1D17B6230]();
  v5 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138543362;
    v10 = v7;
    _os_log_impl(&dword_1CCD48000, v6, OS_LOG_TYPE_INFO, "%{public}@Successfully started up with public local zone", (uint8_t *)&v9, 0xCu);

  }
  objc_autoreleasePoolPop(v4);
  objc_msgSend(*(id *)(a1 + 32), "startUp");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "finishWithNoResult");

}

void __44__HMBCloudZone__startUpWithPublicLocalZone___block_invoke_63(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  _QWORD v9[5];
  id v10;
  uint8_t buf[4];
  void *v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = (void *)MEMORY[0x1D17B6230]();
  v5 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v12 = v7;
    v13 = 2114;
    v14 = v3;
    _os_log_impl(&dword_1CCD48000, v6, OS_LOG_TYPE_ERROR, "%{public}@Failed to start up with public local zone (will retry after delay): %{public}@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v4);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __44__HMBCloudZone__startUpWithPublicLocalZone___block_invoke_64;
  v9[3] = &unk_1E89317A8;
  v8 = *(void **)(a1 + 40);
  v9[4] = *(_QWORD *)(a1 + 32);
  v10 = *(id *)(a1 + 48);
  objc_msgSend(v8, "retryStartupBlock:", v9);

}

uint64_t __44__HMBCloudZone__startUpWithPublicLocalZone___block_invoke_64(uint64_t a1)
{
  void *v2;
  id v3;
  NSObject *v4;
  void *v5;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1D17B6230]();
  v3 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138543362;
    v8 = v5;
    _os_log_impl(&dword_1CCD48000, v4, OS_LOG_TYPE_INFO, "%{public}@Retrying public cloud zone startup", (uint8_t *)&v7, 0xCu);

  }
  objc_autoreleasePoolPop(v2);
  return objc_msgSend(*(id *)(a1 + 32), "_startUpWithPublicLocalZone:", *(_QWORD *)(a1 + 40));
}

void __45__HMBCloudZone__startUpWithPrivateLocalZone___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  id v7;

  v3 = a2;
  +[HMBProcessingOptions optionsWithLabel:](HMBProcessingOptions, "optionsWithLabel:", CFSTR("HMBCloudZone startup sync"));
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "performStartupCloudPullWithOptions:", v7);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "completionHandlerAdapter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = (id)objc_msgSend(v4, "addCompletionBlock:", v5);
}

void __45__HMBCloudZone__startUpWithPrivateLocalZone___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  NSObject *v19;
  void *v20;
  uint64_t v21;
  id v22;
  id v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  id v28;
  uint8_t v29[4];
  void *v30;
  __int16 v31;
  uint64_t v32;
  uint8_t buf[4];
  void *v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = (void *)MEMORY[0x1D17B6230]();
  v5 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v34 = v7;
    _os_log_impl(&dword_1CCD48000, v6, OS_LOG_TYPE_INFO, "%{public}@Startup steps - enqueue pending pushes", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v4);
  v8 = *(id *)(a1 + 32);
  v23 = v3;
  objc_msgSend(v8, "localZone");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = 0;
  objc_msgSend(v9, "fetchReadyBlocksWithType:error:", 0, &v28);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = v28;

  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  v11 = v10;
  v12 = (id)objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v24, buf, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v25;
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v25 != v14)
          objc_enumerationMutation(v11);
        v16 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * (_QWORD)v15);
        v17 = (void *)MEMORY[0x1D17B6230](v12);
        v18 = v8;
        HMFGetOSLogHandle();
        v19 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v21 = objc_msgSend(v16, "blockRow", v22);
          *(_DWORD *)v29 = 138543618;
          v30 = v20;
          v31 = 2048;
          v32 = v21;
          _os_log_impl(&dword_1CCD48000, v19, OS_LOG_TYPE_INFO, "%{public}@Enqueueing pending push for output blockRow: %lu", v29, 0x16u);

        }
        objc_autoreleasePoolPop(v17);
        v12 = (id)objc_msgSend(v18, "_triggerOutputForOutputRow:options:", objc_msgSend(v16, "blockRow"), 0);
        v15 = (char *)v15 + 1;
      }
      while (v13 != v15);
      v12 = (id)objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v24, buf, 16);
      v13 = v12;
    }
    while (v12);
  }

  objc_msgSend(v23, "finishWithNoResult");
}

void __45__HMBCloudZone__startUpWithPrivateLocalZone___block_invoke_56(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = (void *)MEMORY[0x1D17B6230]();
  v5 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138543362;
    v10 = v7;
    _os_log_impl(&dword_1CCD48000, v6, OS_LOG_TYPE_INFO, "%{public}@Successfully started up with private local zone", (uint8_t *)&v9, 0xCu);

  }
  objc_autoreleasePoolPop(v4);
  objc_msgSend(*(id *)(a1 + 32), "startUp");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "finishWithNoResult");

}

void __45__HMBCloudZone__startUpWithPrivateLocalZone___block_invoke_57(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  _QWORD v9[5];
  id v10;
  uint8_t buf[4];
  void *v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = (void *)MEMORY[0x1D17B6230]();
  v5 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v12 = v7;
    v13 = 2114;
    v14 = v3;
    _os_log_impl(&dword_1CCD48000, v6, OS_LOG_TYPE_ERROR, "%{public}@Failed to start up with private local zone (will retry after delay): %{public}@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v4);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __45__HMBCloudZone__startUpWithPrivateLocalZone___block_invoke_58;
  v9[3] = &unk_1E89317A8;
  v8 = *(void **)(a1 + 40);
  v9[4] = *(_QWORD *)(a1 + 32);
  v10 = *(id *)(a1 + 48);
  objc_msgSend(v8, "retryStartupBlock:", v9);

}

uint64_t __45__HMBCloudZone__startUpWithPrivateLocalZone___block_invoke_58(uint64_t a1)
{
  void *v2;
  id v3;
  NSObject *v4;
  void *v5;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1D17B6230]();
  v3 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138543362;
    v8 = v5;
    _os_log_impl(&dword_1CCD48000, v4, OS_LOG_TYPE_INFO, "%{public}@Retrying private cloud zone startup", (uint8_t *)&v7, 0xCu);

  }
  objc_autoreleasePoolPop(v2);
  return objc_msgSend(*(id *)(a1 + 32), "_startUpWithPrivateLocalZone:", *(_QWORD *)(a1 + 40));
}

uint64_t __61__HMBCloudZone_retryCloudKitOperation_afterError_retryBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __50__HMBCloudZone_triggerOutputForOutputRow_options___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_triggerOutputForOutputRow:options:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 40));
}

id __24__HMBCloudZone_shutdown__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  os_unfair_lock_s *v4;
  os_unfair_lock_s *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v13;
  void *v14;

  v3 = a2;
  v4 = (os_unfair_lock_s *)*(id *)(a1 + 32);
  v5 = v4 + 2;
  os_unfair_lock_lock_with_options();
  -[os_unfair_lock_s shutdownFuture](v4, "shutdownFuture");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    -[os_unfair_lock_s database](v4, "database");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = (void *)MEMORY[0x1E0D519C0];
    if (v7)
    {
      v9 = objc_alloc_init(MEMORY[0x1E0D519C0]);
      -[os_unfair_lock_s setShutdownFuture:](v4, "setShutdownFuture:", v9);

      os_unfair_lock_unlock(v5);
      -[os_unfair_lock_s shutdownFuture](v4, "shutdownFuture");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "finishWithNoResult");

      goto LABEL_5;
    }
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmfErrorWithCode:", 8);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "futureWithError:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[os_unfair_lock_s setShutdownFuture:](v4, "setShutdownFuture:", v14);

  }
  os_unfair_lock_unlock(v5);
LABEL_5:

  objc_msgSend(*(id *)(a1 + 32), "shutdownFuture");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t26 != -1)
    dispatch_once(&logCategory__hmf_once_t26, &__block_literal_global_779);
  return (id)logCategory__hmf_once_v27;
}

void __27__HMBCloudZone_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v27;
  logCategory__hmf_once_v27 = v0;

}

- (id)pushRecordsToUpdate:(id)a3 recordIDsToRemove:(id)a4 configuration:(id)a5 rollbackEnabled:(BOOL)a6 needsNewInvitationToken:(BOOL)a7
{
  id v12;
  id v13;
  id v14;
  void *v15;
  HMBCloudZone *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v24;
  HMBCloudZoneRecordPushResult *v25;
  void *v26;
  void *v27;
  HMBCloudZoneRecordPushResult *v28;
  _QWORD v29[5];
  id v30;
  id v31;
  id v32;
  BOOL v33;
  BOOL v34;
  uint8_t buf[4];
  void *v36;
  __int16 v37;
  id v38;
  __int16 v39;
  id v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = (void *)MEMORY[0x1D17B6230]();
  v16 = self;
  HMFGetOSLogHandle();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier();
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v36 = v18;
    v37 = 2112;
    v38 = v12;
    v39 = 2112;
    v40 = v13;
    _os_log_impl(&dword_1CCD48000, v17, OS_LOG_TYPE_DEBUG, "%{public}@Pushing with updates: %@ removes: %@", buf, 0x20u);

  }
  objc_autoreleasePoolPop(v15);
  if (!v12)
    v12 = (id)MEMORY[0x1E0C9AA60];
  if (!v13)
    v13 = (id)MEMORY[0x1E0C9AA60];
  if (objc_msgSend(v12, "count") || objc_msgSend(v13, "count"))
  {
    if (!v14)
    {
      -[HMBCloudZone cloudDatabase](v16, "cloudDatabase");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "operationConfigurationWithProcessingOptions:", 0);
      v14 = (id)objc_claimAutoreleasedReturnValue();

    }
    v20 = (void *)MEMORY[0x1E0D519C0];
    v29[0] = MEMORY[0x1E0C809B0];
    v29[1] = 3221225472;
    v29[2] = __130__HMBCloudZone_CloudRecord_Internal__pushRecordsToUpdate_recordIDsToRemove_configuration_rollbackEnabled_needsNewInvitationToken___block_invoke;
    v29[3] = &unk_1E8931550;
    v29[4] = v16;
    v30 = v12;
    v31 = v13;
    v14 = v14;
    v32 = v14;
    v33 = a6;
    v34 = a7;
    -[HMBCloudZone operationScheduler](v16, "operationScheduler");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "futureWithBlock:scheduler:", v29, v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v24 = (void *)MEMORY[0x1E0D519C0];
    v25 = [HMBCloudZoneRecordPushResult alloc];
    objc_msgSend(MEMORY[0x1E0C99E60], "set");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E60], "set");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = -[HMBCloudZoneRecordPushResult initWithUpdatedRecords:deletedRecordIDs:error:](v25, "initWithUpdatedRecords:deletedRecordIDs:error:", v26, v27, 0);
    objc_msgSend(v24, "futureWithResult:", v28);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v22;
}

void __130__HMBCloudZone_CloudRecord_Internal__pushRecordsToUpdate_recordIDsToRemove_configuration_rollbackEnabled_needsNewInvitationToken___block_invoke(uint64_t a1, void *a2)
{
  __pushRecords(*(void **)(a1 + 32), *(void **)(a1 + 40), *(void **)(a1 + 48), *(void **)(a1 + 56), *(_BYTE *)(a1 + 64), *(unsigned __int8 *)(a1 + 65), 0, a2);
}

- (id)pushRecordsToUpdate:(id)a3 recordIDsToRemove:(id)a4 configuration:(id)a5 rollbackEnabled:(BOOL)a6
{
  return -[HMBCloudZone pushRecordsToUpdate:recordIDsToRemove:configuration:rollbackEnabled:needsNewInvitationToken:](self, "pushRecordsToUpdate:recordIDsToRemove:configuration:rollbackEnabled:needsNewInvitationToken:", a3, a4, a5, a6, 0);
}

- (id)recordIDForModel:(id)a3
{
  objc_class *v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v4 = (objc_class *)MEMORY[0x1E0C95070];
  v5 = a3;
  v6 = [v4 alloc];
  objc_msgSend(v5, "hmbModelID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "UUIDString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMBCloudZone cloudZoneID](self, "cloudZoneID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "zoneID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v6, "initWithRecordName:zoneID:", v8, v10);

  return v11;
}

- (BOOL)populateManateeCloudRecord:(id)a3 withModel:(id)a4 encodingContext:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  BOOL v19;
  void *v20;
  void *v21;
  int v23;
  _QWORD v24[4];
  id v25;
  id v26;
  HMBCloudZone *v27;
  id v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t (*v33)(uint64_t, uint64_t);
  void (*v34)(uint64_t);
  id v35;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  objc_msgSend(v12, "modelContainer");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "hmbAssociateWithContainer:", v13);

  objc_msgSend((id)objc_opt_class(), "hmbProperties");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = 0;
  v31 = &v30;
  v32 = 0x3032000000;
  v33 = __Block_byref_object_copy__1501;
  v34 = __Block_byref_object_dispose__1502;
  v35 = 0;
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __84__HMBCloudZone_Manatee__populateManateeCloudRecord_withModel_encodingContext_error___block_invoke;
  v24[3] = &unk_1E8931898;
  v15 = v11;
  v25 = v15;
  v16 = v10;
  v26 = v16;
  v27 = self;
  v17 = v12;
  v28 = v17;
  v29 = &v30;
  objc_msgSend(v14, "enumerateKeysAndObjectsUsingBlock:", v24);
  v18 = (void *)v31[5];
  if (v18)
  {
    v19 = 0;
    if (a6)
      *a6 = objc_retainAutorelease(v18);
  }
  else
  {
    -[HMBCloudZone cloudMetadataForModel:usingEncoding:](self, "cloudMetadataForModel:usingEncoding:", v15, 2);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = 0;
    v21 = (void *)MEMORY[0x1D17B60D4](v20, 12, &v23);
    if (v21)
    {
      v19 = -[HMBCloudZone populateV4CloudRecord:withModel:metadataFieldData:startEncoding:endEncoding:encodingContext:error:](self, "populateV4CloudRecord:withModel:metadataFieldData:startEncoding:endEncoding:encodingContext:error:", v16, v15, v21, 2, 3, v17, a6);
    }
    else if (a6)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], v23, 0);
      v19 = 0;
      *a6 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v19 = 0;
    }

  }
  _Block_object_dispose(&v30, 8);

  return v19;
}

- (id)encodeManateeCloudModel:(id)a3 existingRecord:(id)a4 encodingContext:(id)a5 error:(id *)a6
{
  id v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  HMBCloudZone *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  HMBCloudZone *v26;
  NSObject *v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  HMBCloudZone *v38;
  HMBCloudZone *v39;
  uint8_t buf[4];
  void *v42;
  __int16 v43;
  void *v44;
  __int16 v45;
  void *v46;
  __int16 v47;
  uint64_t v48;
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  objc_msgSend(v11, "modelContainer");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "hmbAssociateWithContainer:", v12);

  v13 = v10;
  if (v13)
  {
    v14 = (void *)MEMORY[0x1D17B6230]();
    v15 = self;
    HMFGetOSLogHandle();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v38 = self;
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "hmbDescription");
      v36 = v14;
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "hmbCanonicalType");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "hmbModelID");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "UUIDString");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      v42 = v17;
      v43 = 2112;
      v44 = v18;
      v45 = 2112;
      v46 = v19;
      v47 = 2112;
      v48 = (uint64_t)v21;
      _os_log_impl(&dword_1CCD48000, v16, OS_LOG_TYPE_DEFAULT, "%{public}@Updating existing cloud record %@ to store model %@.%@", buf, 0x2Au);

      v14 = v36;
      self = v38;
    }

    objc_autoreleasePoolPop(v14);
    v22 = v13;
  }
  else
  {
    -[HMBCloudZone recordIDForModel:](self, "recordIDForModel:", v9);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)objc_opt_class(), "hmbExternalRecordType");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C95048]), "initWithRecordType:recordID:", v24, v23);
    v25 = (void *)MEMORY[0x1D17B6230]();
    v39 = self;
    v26 = self;
    HMFGetOSLogHandle();
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "hmbDescription");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "hmbCanonicalType");
      v35 = v24;
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "hmbModelID");
      v37 = v23;
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "UUIDString");
      *(_DWORD *)buf = 138544130;
      v42 = v34;
      v43 = 2112;
      v44 = v33;
      v45 = 2112;
      v46 = v28;
      v47 = 2112;
      v48 = objc_claimAutoreleasedReturnValue();
      v30 = (void *)v48;
      _os_log_impl(&dword_1CCD48000, v27, OS_LOG_TYPE_DEFAULT, "%{public}@Creating new cloud record %@ to store model %@.%@", buf, 0x2Au);

      v23 = v37;
      v24 = v35;

    }
    objc_autoreleasePoolPop(v25);

    self = v39;
  }
  if (-[HMBCloudZone populateManateeCloudRecord:withModel:encodingContext:error:](self, "populateManateeCloudRecord:withModel:encodingContext:error:", v22, v9, v11, a6))
  {
    v31 = v22;
  }
  else
  {
    v31 = 0;
  }

  return v31;
}

- (id)decodeManateeCloudFromRecord:(id)a3 externalRecordFields:(id)a4 source:(unint64_t)a5 error:(id *)a6
{
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  id v20;
  void *v21;
  uint64_t v22;
  void *v23;
  HMBCloudZone *v24;
  NSObject *v25;
  id v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  char v38;
  void *v39;
  HMBCloudZone *v40;
  NSObject *v41;
  id v42;
  void *v43;
  void *v44;
  void *v45;
  char v46;
  void *v47;
  void *v48;
  id v49;
  void *v50;
  void *v51;
  HMBCloudZone *v52;
  NSObject *v53;
  void *v54;
  void *v55;
  void *v56;
  HMBCloudZone *v57;
  NSObject *v58;
  void *v59;
  id v60;
  void *v61;
  void *v62;
  HMBCloudZone *v63;
  NSObject *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  HMBCloudZone *v69;
  NSObject *v70;
  void *v71;
  void *v72;
  id v73;
  void *v74;
  void *v75;
  HMBCloudZone *v76;
  NSObject *v77;
  void *v78;
  id v79;
  void *v80;
  void *v81;
  HMBCloudZone *v82;
  NSObject *v83;
  void *v84;
  id v85;
  void *v86;
  void *v88;
  void *v89;
  void *v90;
  id v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  unint64_t v100;
  void *v101;
  void *v102;
  void *v103;
  _QWORD v104[4];
  id v105;
  id v106;
  id v107;
  id v108;
  id v109;
  unint64_t v110;
  id v111;
  int v112;
  uint8_t buf[4];
  void *v114;
  __int16 v115;
  void *v116;
  __int16 v117;
  uint64_t v118;
  __int16 v119;
  void *v120;
  uint64_t v121;

  v121 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  -[HMBCloudZone cloudDatabase](self, "cloudDatabase");
  v103 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v103, "configuration");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "hmbObjectForKey:encrypted:", CFSTR("k00"), objc_msgSend(v12, "isManateeContainer"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v14 = v13;
  else
    v14 = 0;
  v15 = v14;

  if (v15)
  {
    v112 = 0;
    v16 = (void *)OPACKDecodeData();
    v17 = v16;
    if (v16)
    {
      v100 = a5;
      v18 = v16;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v19 = v18;
      else
        v19 = 0;
      v20 = v19;

      v102 = v20;
      objc_msgSend(v20, "hmf_numberForKey:", CFSTR("HM.encoding"));
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = objc_msgSend(v21, "unsignedIntegerValue");

      if (!v22)
      {
        v23 = (void *)MEMORY[0x1D17B6230]();
        v24 = self;
        HMFGetOSLogHandle();
        v25 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
        {
          HMFGetLogIdentifier();
          v96 = v17;
          v26 = v11;
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          v114 = v27;
          v115 = 2112;
          v116 = v102;
          v117 = 2048;
          v118 = 2;
          _os_log_impl(&dword_1CCD48000, v25, OS_LOG_TYPE_DEFAULT, "%{public}@Unable to determine encoding from version metadata: %@. Defaulting to %lu encoding", buf, 0x20u);

          v11 = v26;
          v17 = v96;
        }

        objc_autoreleasePoolPop(v23);
        v22 = 2;
      }
      v101 = v11;
      -[HMBCloudZone cloudFieldForEncoding:](self, "cloudFieldForEncoding:", v22);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v103, "configuration");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "hmbObjectForKey:encrypted:", v28, objc_msgSend(v29, "isManateeContainer"));
      v30 = (void *)objc_claimAutoreleasedReturnValue();

      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v31 = v30;
      else
        v31 = 0;
      v32 = v31;

      if (v32)
      {
        objc_msgSend(v32, "hmbUncompress");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        if (v33)
        {
          -[HMBCloudZone modelContainer](self, "modelContainer");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          v95 = v34;
          if (v34)
          {
            v111 = 0;
            objc_msgSend(v34, "modelFromData:encoding:storageLocation:error:", v33, v22, 1, &v111);
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            v91 = v111;
            v11 = v101;
            if (v35)
            {
              v97 = v17;
              objc_msgSend((id)objc_opt_class(), "hmbExternalRecordType");
              v36 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v10, "recordType");
              v37 = (void *)objc_claimAutoreleasedReturnValue();
              v38 = objc_msgSend(v36, "isEqualToString:", v37);

              if ((v38 & 1) == 0)
              {
                v39 = (void *)MEMORY[0x1D17B6230]();
                v40 = self;
                HMFGetOSLogHandle();
                v41 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
                {
                  HMFGetLogIdentifier();
                  v90 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v35, "hmbCanonicalType");
                  v88 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend((id)objc_opt_class(), "hmbExternalRecordType");
                  v89 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v10, "recordType");
                  v92 = v33;
                  v42 = v32;
                  v43 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 138544130;
                  v114 = v90;
                  v115 = 2112;
                  v116 = v88;
                  v117 = 2112;
                  v118 = (uint64_t)v89;
                  v119 = 2112;
                  v120 = v43;
                  _os_log_impl(&dword_1CCD48000, v41, OS_LOG_TYPE_DEFAULT, "%{public}@Model of type %@ expected external record type %@ but cloud record has type %@", buf, 0x2Au);

                  v32 = v42;
                  v33 = v92;

                }
                objc_autoreleasePoolPop(v39);
              }
              objc_msgSend(v10, "recordType", v88);
              v44 = (void *)objc_claimAutoreleasedReturnValue();
              +[HMBModel hmbExternalRecordType](HMBModel, "hmbExternalRecordType");
              v45 = (void *)objc_claimAutoreleasedReturnValue();
              v46 = objc_msgSend(v44, "isEqualToString:", v45);

              v47 = v95;
              if ((v46 & 1) == 0)
              {
                objc_msgSend((id)objc_opt_class(), "hmbProperties");
                v48 = (void *)objc_claimAutoreleasedReturnValue();
                v104[0] = MEMORY[0x1E0C809B0];
                v104[1] = 3221225472;
                v104[2] = __88__HMBCloudZone_Manatee__decodeManateeCloudFromRecord_externalRecordFields_source_error___block_invoke;
                v104[3] = &unk_1E89318C0;
                v105 = v101;
                v106 = v103;
                v107 = v10;
                v110 = v100;
                v108 = v95;
                v109 = v35;
                objc_msgSend(v48, "enumerateKeysAndObjectsUsingBlock:", v104);

              }
              v49 = v35;
              v17 = v97;
              v50 = v91;
            }
            else
            {
              v81 = (void *)MEMORY[0x1D17B6230]();
              v82 = self;
              HMFGetOSLogHandle();
              v83 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v83, OS_LOG_TYPE_ERROR))
              {
                HMFGetLogIdentifier();
                v99 = v17;
                v84 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v10, "hmbDescription");
                v94 = v33;
                v85 = v32;
                v86 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138543874;
                v114 = v84;
                v115 = 2114;
                v116 = v86;
                v117 = 2112;
                v118 = (uint64_t)v91;
                _os_log_impl(&dword_1CCD48000, v83, OS_LOG_TYPE_ERROR, "%{public}@Failed to decode data for record %{public}@: %@", buf, 0x20u);

                v32 = v85;
                v33 = v94;

                v17 = v99;
              }

              objc_autoreleasePoolPop(v81);
              v11 = v101;
              v47 = v95;
              v50 = v91;
              if (a6)
                *a6 = objc_retainAutorelease(v91);
            }

          }
          else
          {
            v75 = (void *)MEMORY[0x1D17B6230]();
            v76 = self;
            HMFGetOSLogHandle();
            v77 = objc_claimAutoreleasedReturnValue();
            v11 = v101;
            if (os_log_type_enabled(v77, OS_LOG_TYPE_ERROR))
            {
              HMFGetLogIdentifier();
              v98 = v17;
              v78 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v10, "hmbDescription");
              v93 = v33;
              v79 = v32;
              v80 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543618;
              v114 = v78;
              v115 = 2114;
              v116 = v80;
              _os_log_impl(&dword_1CCD48000, v77, OS_LOG_TYPE_ERROR, "%{public}@Failed to decode data for record %{public}@: Model container is nil", buf, 0x16u);

              v32 = v79;
              v33 = v93;

              v17 = v98;
            }

            objc_autoreleasePoolPop(v75);
            if (a6)
            {
              objc_msgSend(MEMORY[0x1E0CB35C8], "hmfErrorWithCode:reason:", 8, CFSTR("Model container is nil"));
              v35 = 0;
              *a6 = (id)objc_claimAutoreleasedReturnValue();
            }
            else
            {
              v35 = 0;
            }
            v47 = 0;
          }

        }
        else
        {
          v68 = (void *)MEMORY[0x1D17B6230]();
          v69 = self;
          HMFGetOSLogHandle();
          v70 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v70, OS_LOG_TYPE_ERROR))
          {
            HMFGetLogIdentifier();
            v71 = v17;
            v72 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v10, "hmbDescription");
            v73 = v32;
            v74 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v114 = v72;
            v115 = 2114;
            v116 = v74;
            _os_log_impl(&dword_1CCD48000, v70, OS_LOG_TYPE_ERROR, "%{public}@Failed to decode data for record %{public}@: Uncompress failed", buf, 0x16u);

            v32 = v73;
            v17 = v71;
            v33 = 0;
          }

          objc_autoreleasePoolPop(v68);
          v11 = v101;
          if (a6)
          {
            objc_msgSend(MEMORY[0x1E0CB35C8], "hmfErrorWithCode:reason:", 15, CFSTR("Model data failed to uncompress"));
            v35 = 0;
            *a6 = (id)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            v35 = 0;
          }
        }

      }
      else
      {
        v62 = (void *)MEMORY[0x1D17B6230]();
        v63 = self;
        HMFGetOSLogHandle();
        v64 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v64, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v65 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "hmbDescription");
          v66 = v17;
          v67 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138544130;
          v114 = v65;
          v115 = 2114;
          v116 = v67;
          v117 = 2048;
          v118 = v22;
          v119 = 2112;
          v120 = v102;
          _os_log_impl(&dword_1CCD48000, v64, OS_LOG_TYPE_ERROR, "%{public}@Failed to decode data for record %{public}@: Could not find data for encoding type %lu in metadata: %@", buf, 0x2Au);

          v17 = v66;
          v32 = 0;
        }

        objc_autoreleasePoolPop(v62);
        if (a6)
        {
          objc_msgSend(MEMORY[0x1E0CB35C8], "hmfErrorWithCode:reason:", 15, CFSTR("No model data for encoding type"));
          v35 = 0;
          *a6 = (id)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v35 = 0;
        }
        v11 = v101;
      }

    }
    else
    {
      v56 = (void *)MEMORY[0x1D17B6230]();
      v57 = self;
      HMFGetOSLogHandle();
      v58 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v58, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "hmbDescription");
        v60 = v11;
        v61 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v114 = v59;
        v115 = 2114;
        v116 = v61;
        v117 = 1024;
        LODWORD(v118) = v112;
        _os_log_impl(&dword_1CCD48000, v58, OS_LOG_TYPE_ERROR, "%{public}@Failed to decode data for record %{public}@: Unable to decode version metadata: %d", buf, 0x1Cu);

        v11 = v60;
      }

      objc_autoreleasePoolPop(v56);
      if (a6)
      {
        objc_msgSend(MEMORY[0x1E0CB35C8], "hmfErrorWithCode:reason:", 15, CFSTR("Unable to decode version metadata"));
        v35 = 0;
        *a6 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v35 = 0;
      }
    }

  }
  else
  {
    v51 = (void *)MEMORY[0x1D17B6230]();
    v52 = self;
    HMFGetOSLogHandle();
    v53 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "hmbDescription");
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v114 = v54;
      v115 = 2114;
      v116 = v55;
      _os_log_impl(&dword_1CCD48000, v53, OS_LOG_TYPE_ERROR, "%{public}@Failed to decode data for record %{public}@: Cannot find metadata", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v51);
    if (a6)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "hmfErrorWithCode:reason:", 15, CFSTR("Cannot find metadata"));
      v35 = 0;
      *a6 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v35 = 0;
    }
  }

  return v35;
}

void __88__HMBCloudZone_Manatee__decodeManateeCloudFromRecord_externalRecordFields_source_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a2;
  v5 = a3;
  objc_msgSend(v5, "externalRecordField");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v7 = *(void **)(a1 + 32);
    if (!v7 || objc_msgSend(v7, "containsObject:", v6))
    {
      objc_msgSend(*(id *)(a1 + 40), "configuration");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v8, "isManateeContainer"))
        v9 = objc_msgSend(v5, "encrypted");
      else
        v9 = 0;

      v10 = *(void **)(a1 + 48);
      objc_msgSend(v5, "externalRecordField");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "hmbObjectForKey:encrypted:", v11, v9);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v5, "conformsToHMBModelNativeCKWrapper"))
        objc_msgSend((id)objc_msgSend(v5, "classObj"), "applyNativeCKValue:fromSource:associatingWith:toModel:propertyNamed:", v12, *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), v13);
      else
        objc_msgSend(*(id *)(a1 + 64), "hmbSetProperty:named:", v12, v13);

    }
  }

}

void __84__HMBCloudZone_Manatee__populateManateeCloudRecord_withModel_encodingContext_error___block_invoke(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  id v16;
  void *v17;
  id v18;
  NSObject *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  NSObject *v32;
  void *v33;
  void *v34;
  objc_class *v35;
  void *v36;
  id v37;
  void *v38;
  id v39;
  uint8_t buf[4];
  void *v41;
  __int16 v42;
  void *v43;
  __int16 v44;
  id v45;
  __int16 v46;
  id v47;
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  objc_msgSend(v8, "externalRecordField");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    objc_msgSend(*(id *)(a1 + 32), "hmbSetProperties");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "containsObject:", v7);

    if (v11)
    {
      objc_msgSend(*(id *)(a1 + 32), "hmbPropertyNamed:", v7);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v8, "conformsToHMBModelNativeCKWrapper"))
      {
        if (v12)
        {
          if ((objc_opt_respondsToSelector() & 1) == 0)
          {
            v30 = (void *)MEMORY[0x1D17B6230]();
            v31 = *(id *)(a1 + 48);
            HMFGetOSLogHandle();
            v32 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
            {
              HMFGetLogIdentifier();
              v33 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(*(id *)(a1 + 32), "hmbDescription");
              v34 = (void *)objc_claimAutoreleasedReturnValue();
              v35 = (objc_class *)objc_opt_class();
              NSStringFromClass(v35);
              v36 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138544130;
              v41 = v33;
              v42 = 2112;
              v43 = v34;
              v44 = 2112;
              v45 = v7;
              v46 = 2112;
              v47 = v36;
              _os_log_impl(&dword_1CCD48000, v32, OS_LOG_TYPE_ERROR, "%{public}@Dropping change for %@/%@ because property type %@ doesn't respond to nativeCKValueWithEncodingContext:error: but we think it conforms to HMBModelNativeCKWrapper", buf, 0x2Au);

            }
            objc_autoreleasePoolPop(v30);
            goto LABEL_22;
          }
          v13 = *(_QWORD *)(a1 + 56);
          v39 = 0;
          objc_msgSend(v12, "nativeCKValueWithEncodingContext:error:", v13, &v39);
          v14 = objc_claimAutoreleasedReturnValue();
          v15 = v39;
          v16 = v39;

          if (!v14 && v16)
          {
            v17 = (void *)MEMORY[0x1D17B6230]();
            v18 = *(id *)(a1 + 48);
            HMFGetOSLogHandle();
            v19 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
            {
              HMFGetLogIdentifier();
              v37 = v18;
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(*(id *)(a1 + 32), "hmbDescription");
              v38 = v17;
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138544130;
              v41 = v20;
              v42 = 2112;
              v43 = v21;
              v44 = 2112;
              v45 = v7;
              v46 = 2112;
              v47 = v16;
              _os_log_impl(&dword_1CCD48000, v19, OS_LOG_TYPE_ERROR, "%{public}@Unable to encode wrapped and externally stored property %@/%@: %@", buf, 0x2Au);

              v17 = v38;
              v18 = v37;
            }

            objc_autoreleasePoolPop(v17);
            objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), v15);
            *a4 = 1;
          }

          v12 = (void *)v14;
          goto LABEL_14;
        }
        v28 = *(void **)(a1 + 40);
        objc_msgSend(v8, "externalRecordField");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "setObject:forKey:", 0, v29);

        v12 = 0;
      }
      else
      {
        v22 = objc_msgSend(v8, "classObj");
        if (v22 != objc_opt_class() || objc_msgSend(v12, "count"))
        {
LABEL_14:
          objc_msgSend(*(id *)(a1 + 48), "cloudDatabase");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "configuration");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v24, "isManateeContainer"))
            v25 = objc_msgSend(v8, "encrypted");
          else
            v25 = 0;

          v26 = *(void **)(a1 + 40);
          objc_msgSend(v8, "externalRecordField");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "hmbSetObject:forKey:encrypted:", v12, v27, v25);

        }
      }
LABEL_22:

    }
  }

}

- (id)fetchChangesWithToken:(id)a3 options:(id)a4
{
  id v6;
  id v7;
  void *v8;
  HMBCloudZone *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  _QWORD v20[5];
  id v21;
  id v22;
  uint8_t buf[4];
  void *v24;
  __int16 v25;
  id v26;
  __int16 v27;
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = (void *)MEMORY[0x1D17B6230]();
  v9 = self;
  HMFGetOSLogHandle();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v24 = v11;
    v25 = 2112;
    v26 = v6;
    v27 = 2112;
    v28 = v7;
    _os_log_impl(&dword_1CCD48000, v10, OS_LOG_TYPE_INFO, "%{public}@Fetching cloud zone changes with token: %@ options: %@", buf, 0x20u);

  }
  objc_autoreleasePoolPop(v8);
  v12 = (void *)MEMORY[0x1E0D519C0];
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __55__HMBCloudZone_Changes__fetchChangesWithToken_options___block_invoke;
  v20[3] = &unk_1E89325D0;
  v20[4] = v9;
  v21 = v6;
  v22 = v7;
  v13 = v7;
  v14 = v6;
  -[HMBCloudZone operationScheduler](v9, "operationScheduler");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "futureWithBlock:scheduler:", v20, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v16, "flatMap:", &__block_literal_global_1855);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "flatMap:", &__block_literal_global_3);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

void __55__HMBCloudZone_Changes__fetchChangesWithToken_options___block_invoke(void **a1, void *a2)
{
  __fetchChanges(a1[4], a1[5], a1[6], 0, a2);
}

uint64_t __55__HMBCloudZone_Changes__fetchChangesWithToken_options___block_invoke_3()
{
  return objc_msgSend(MEMORY[0x1E0D519C0], "futureWithNoResult");
}

uint64_t __55__HMBCloudZone_Changes__fetchChangesWithToken_options___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "processingFuture");
}

- (BOOL)resolveConflicts:(id)a3 options:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  id v10;
  HMBCloudZone *v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  HMBCloudZone *v23;
  NSObject *v24;
  NSObject *v25;
  void *v26;
  void *v27;
  void *v28;
  char v29;
  id v30;
  void *v31;
  HMBCloudZone *v32;
  NSObject *v33;
  void *v34;
  void *v35;
  void *v36;
  HMBCloudZone *v37;
  NSObject *v38;
  NSObject *v39;
  id v40;
  void *v41;
  void *v42;
  char v43;
  id v44;
  void *v45;
  HMBCloudZone *v46;
  NSObject *v47;
  void *v48;
  void *v49;
  uint64_t v50;
  HMBCloudZone *v51;
  NSObject *v52;
  void *v53;
  void *v54;
  id v55;
  HMBCloudZone *v56;
  NSObject *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  id v63;
  void *v64;
  HMBCloudZone *v65;
  NSObject *v66;
  void *v67;
  void *v68;
  HMBCloudZone *v69;
  NSObject *v70;
  void *v71;
  id v73;
  id v74;
  id v75;
  void *v76;
  HMBCloudZone *v77;
  void *v78;
  void *context;
  uint64_t v80;
  id v81;
  void *v82;
  id obj;
  id v84;
  id v85;
  uint64_t v86;
  id v87;
  id v88;
  id v89;
  id v90;
  id v91;
  id v92;
  id v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  id v98;
  uint8_t buf[4];
  void *v100;
  __int16 v101;
  id v102;
  __int16 v103;
  id v104;
  _BYTE v105[128];
  uint64_t v106;

  v106 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[HMBCloudZone localZone](self, "localZone");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v98 = 0;
  objc_msgSend(v8, "createMirrorInputWithError:", &v98);
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = v98;

  v78 = (void *)v9;
  if (v9)
  {
    v73 = v10;
    v74 = v7;
    v96 = 0u;
    v97 = 0u;
    v94 = 0u;
    v95 = 0u;
    v75 = v6;
    obj = v6;
    v77 = self;
    v86 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v94, v105, 16);
    if (!v86)
      goto LABEL_43;
    v11 = self;
    v12 = *(_QWORD *)v95;
    v80 = *(_QWORD *)v95;
    while (1)
    {
      for (i = 0; i != v86; ++i)
      {
        if (*(_QWORD *)v95 != v12)
          objc_enumerationMutation(obj);
        v14 = *(void **)(*((_QWORD *)&v94 + 1) + 8 * i);
        objc_msgSend(v14, "serverRecord");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        if (v15)
        {
          v91 = 0;
          -[HMBCloudZone decodeModelFromRecord:externalRecordFields:source:error:](v11, "decodeModelFromRecord:externalRecordFields:source:error:", v15, 0, 4, &v91);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = v91;
          v18 = v17;
          if (!v16)
          {
            v50 = MEMORY[0x1D17B6230]();
            v51 = v11;
            HMFGetOSLogHandle();
            v52 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v52, OS_LOG_TYPE_ERROR))
            {
              HMFGetLogIdentifier();
              v53 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543874;
              v100 = v53;
              v101 = 2112;
              v102 = v14;
              v103 = 2112;
              v104 = v18;
              _os_log_impl(&dword_1CCD48000, v52, OS_LOG_TYPE_ERROR, "%{public}@Unable to generate server model for conflict %@: %@", buf, 0x20u);

            }
            v54 = (void *)v50;
LABEL_35:
            objc_autoreleasePoolPop(v54);
            v16 = 0;
            goto LABEL_41;
          }
          v84 = v17;
          v90 = 0;
          objc_msgSend(v15, "externalID:", &v90);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = v90;
          v21 = v20;
          if (v19)
          {
            v89 = 0;
            objc_msgSend(v15, "externalData:", &v89);
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            v81 = v89;
            context = (void *)MEMORY[0x1D17B6230]();
            v23 = v11;
            HMFGetOSLogHandle();
            v24 = objc_claimAutoreleasedReturnValue();
            v25 = v24;
            if (v22)
            {
              v76 = v21;
              if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
              {
                HMFGetLogIdentifier();
                v26 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v15, "hmbDescription");
                v27 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v16, "hmbDescription");
                v28 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138543874;
                v100 = v26;
                v101 = 2112;
                v102 = v27;
                v103 = 2112;
                v104 = v28;
                _os_log_impl(&dword_1CCD48000, v25, OS_LOG_TYPE_DEFAULT, "%{public}@Staging server version of conflicted record %@ / %@ due to conflict", buf, 0x20u);

              }
              objc_autoreleasePoolPop(context);
              v88 = 0;
              v29 = objc_msgSend(v78, "stageAdditionForModel:externalID:externalData:error:", v16, v19, v22, &v88);
              v30 = v88;
              if ((v29 & 1) == 0)
              {
                v31 = (void *)MEMORY[0x1D17B6230]();
                v32 = v23;
                HMFGetOSLogHandle();
                v33 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
                {
                  HMFGetLogIdentifier();
                  v34 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 138543874;
                  v100 = v34;
                  v101 = 2112;
                  v102 = v16;
                  v103 = 2112;
                  v104 = v30;
                  _os_log_impl(&dword_1CCD48000, v33, OS_LOG_TYPE_ERROR, "%{public}@Failed to stage addition for model %@: %@", buf, 0x20u);

                }
                objc_autoreleasePoolPop(v31);
              }

              v21 = v76;
              v11 = v77;
            }
            else
            {
              if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
              {
                HMFGetLogIdentifier();
                v60 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138543874;
                v100 = v60;
                v101 = 2112;
                v102 = v14;
                v103 = 2112;
                v104 = v81;
                _os_log_impl(&dword_1CCD48000, v25, OS_LOG_TYPE_ERROR, "%{public}@Unable to generate server externalData for conflict %@: %@", buf, 0x20u);

                v11 = v77;
              }

              objc_autoreleasePoolPop(context);
            }

            v12 = v80;
            v18 = v84;
          }
          else
          {
            v55 = v20;
            v82 = (void *)MEMORY[0x1D17B6230]();
            v56 = v11;
            HMFGetOSLogHandle();
            v57 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v57, OS_LOG_TYPE_ERROR))
            {
              HMFGetLogIdentifier();
              v58 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543874;
              v100 = v58;
              v101 = 2112;
              v102 = v14;
              v103 = 2112;
              v104 = v55;
              _os_log_impl(&dword_1CCD48000, v57, OS_LOG_TYPE_ERROR, "%{public}@Unable to generate server externalID for conflict %@: %@", buf, 0x20u);

              v12 = v80;
            }

            objc_autoreleasePoolPop(v82);
            v18 = v84;
            v21 = v55;
          }

        }
        else
        {
          objc_msgSend(v14, "recordID");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          v93 = 0;
          objc_msgSend(v35, "externalID:", &v93);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = v93;

          v36 = (void *)MEMORY[0x1D17B6230]();
          v37 = v11;
          HMFGetOSLogHandle();
          v38 = objc_claimAutoreleasedReturnValue();
          v39 = v38;
          if (!v16)
          {
            if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
            {
              HMFGetLogIdentifier();
              v59 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543874;
              v100 = v59;
              v101 = 2112;
              v102 = v14;
              v103 = 2112;
              v104 = v18;
              _os_log_impl(&dword_1CCD48000, v39, OS_LOG_TYPE_ERROR, "%{public}@Unable to generate client externalID for conflict %@: %@", buf, 0x20u);

            }
            v54 = v36;
            goto LABEL_35;
          }
          if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
          {
            HMFGetLogIdentifier();
            v40 = v18;
            v41 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v14, "recordID");
            v42 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v100 = v41;
            v101 = 2112;
            v102 = v42;
            _os_log_impl(&dword_1CCD48000, v39, OS_LOG_TYPE_INFO, "%{public}@Staging removal for record ID without a server version: %@", buf, 0x16u);

            v12 = v80;
            v18 = v40;
            v11 = v77;
          }

          objc_autoreleasePoolPop(v36);
          v92 = 0;
          v43 = objc_msgSend(v78, "stageRemovalForModelWithExternalID:error:", v16, &v92);
          v44 = v92;
          if ((v43 & 1) == 0)
          {
            v85 = v18;
            v45 = (void *)MEMORY[0x1D17B6230]();
            v46 = v37;
            HMFGetOSLogHandle();
            v47 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
            {
              HMFGetLogIdentifier();
              v48 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v14, "recordID");
              v49 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543874;
              v100 = v48;
              v101 = 2112;
              v102 = v49;
              v103 = 2112;
              v104 = v44;
              _os_log_impl(&dword_1CCD48000, v47, OS_LOG_TYPE_ERROR, "%{public}@Failed to stage removal for record ID %@: %@", buf, 0x20u);

              v11 = v77;
              v12 = v80;
            }

            objc_autoreleasePoolPop(v45);
            v18 = v85;
          }

        }
LABEL_41:

      }
      v86 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v94, v105, 16);
      if (!v86)
      {
LABEL_43:

        +[HMBProcessingOptions optionsWithLabel:](HMBProcessingOptions, "optionsWithLabel:", CFSTR("Conflicted record resolution"));
        v61 = (void *)objc_claimAutoreleasedReturnValue();
        v87 = 0;
        objc_msgSend(v78, "commitWithOptions:error:", v61, &v87);
        v62 = (void *)objc_claimAutoreleasedReturnValue();
        v63 = v87;

        v10 = v73;
        v7 = v74;
        if (!v62)
        {
          v64 = (void *)MEMORY[0x1D17B6230]();
          v65 = v77;
          HMFGetOSLogHandle();
          v66 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v66, OS_LOG_TYPE_ERROR))
          {
            HMFGetLogIdentifier();
            v67 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v100 = v67;
            v101 = 2112;
            v102 = v63;
            _os_log_impl(&dword_1CCD48000, v66, OS_LOG_TYPE_ERROR, "%{public}@Failed to commit conflicted record resolution: %@", buf, 0x16u);

          }
          objc_autoreleasePoolPop(v64);
        }

        v6 = v75;
        goto LABEL_51;
      }
    }
  }
  v68 = (void *)MEMORY[0x1D17B6230]();
  v69 = self;
  HMFGetOSLogHandle();
  v70 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v70, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v100 = v71;
    v101 = 2112;
    v102 = v10;
    _os_log_impl(&dword_1CCD48000, v70, OS_LOG_TYPE_ERROR, "%{public}@Failed to create input context for conflict records: %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v68);
LABEL_51:

  return 1;
}

- (id)performFullCloudPullWithOptions:(id)a3
{
  return -[HMBCloudZone _performCloudPullWithOptions:useCachedServerToken:](self, "_performCloudPullWithOptions:useCachedServerToken:", a3, 0);
}

- (id)performStartupCloudPullWithOptions:(id)a3
{
  return -[HMBCloudZone _performImmediateCloudPullWithOptions:useCachedServerToken:](self, "_performImmediateCloudPullWithOptions:useCachedServerToken:", a3, 1);
}

- (id)_performCloudPullWithOptions:(id)a3 useCachedServerToken:(BOOL)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  HMBCloudZone *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  HMBCloudZone *v16;
  NSObject *v17;
  void *v18;
  HMBFutureOperation *v19;
  HMBFutureOperation *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  _QWORD v26[5];
  id v27;
  BOOL v28;
  uint8_t buf[4];
  void *v30;
  __int16 v31;
  id v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = objc_alloc_init(MEMORY[0x1E0D519C0]);
  os_unfair_lock_lock_with_options();
  -[HMBCloudZone queuedCloudPullFuture](self, "queuedCloudPullFuture");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    objc_msgSend(v7, "completionHandlerAdapter");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (id)objc_msgSend(v8, "addCompletionBlock:", v9);

    os_unfair_lock_unlock(&self->_propertyLock);
    v11 = (void *)MEMORY[0x1D17B6230]();
    v12 = self;
    HMFGetOSLogHandle();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v30 = v14;
      v31 = 2112;
      v32 = v6;
      _os_log_impl(&dword_1CCD48000, v13, OS_LOG_TYPE_INFO, "%{public}@Coalescing cloud pull with options: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v11);
  }
  else
  {
    -[HMBCloudZone setQueuedCloudPullFuture:](self, "setQueuedCloudPullFuture:", v7);
    os_unfair_lock_unlock(&self->_propertyLock);
    v15 = (void *)MEMORY[0x1D17B6230]();
    v16 = self;
    HMFGetOSLogHandle();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v30 = v18;
      v31 = 2112;
      v32 = v6;
      _os_log_impl(&dword_1CCD48000, v17, OS_LOG_TYPE_INFO, "%{public}@Queueing up cloud pull with options: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v15);
    v19 = [HMBFutureOperation alloc];
    v26[0] = MEMORY[0x1E0C809B0];
    v26[1] = 3221225472;
    v26[2] = __81__HMBCloudZone_Pull_Internal___performCloudPullWithOptions_useCachedServerToken___block_invoke;
    v26[3] = &unk_1E8933270;
    v26[4] = v16;
    v27 = v6;
    v28 = a4;
    v20 = -[HMBFutureOperation initWithBlock:](v19, "initWithBlock:", v26);
    -[HMBCloudZone recordOperationQueue](v16, "recordOperationQueue");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "addOperation:", v20);

    -[HMBFutureOperation future](v20, "future");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "completionHandlerAdapter");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = (id)objc_msgSend(v22, "addCompletionBlock:", v23);

  }
  return v7;
}

- (id)_performImmediateCloudPullWithOptions:(id)a3 useCachedServerToken:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v4 = a4;
  v6 = a3;
  -[HMBCloudZone configuration](self, "configuration");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "shouldSkipCloudPulls");

  if (v8)
  {
    -[HMBCloudZone _syncInternalModels](self, "_syncInternalModels");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (v4)
    {
      -[HMBCloudZone cloudDatabase](self, "cloudDatabase");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMBCloudZone cloudZoneID](self, "cloudZoneID");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "serverChangeTokenForZoneWithID:", v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v12 = 0;
    }
    -[HMBCloudZone fetchChangesWithToken:options:](self, "fetchChangesWithToken:options:", v12, v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v9;
}

- (id)_syncInternalModels
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  HMBCloudZone *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  id v24;
  id v25;
  void *v26;
  id v27;
  id v28;
  void *v29;
  id v30;
  _QWORD v32[5];
  id v33;
  _QWORD v34[5];
  id v35;
  id v36;
  _QWORD v37[2];
  uint8_t buf[4];
  void *v39;
  __int16 v40;
  void *v41;
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc(MEMORY[0x1E0D28540]);
  v4 = (void *)MEMORY[0x1E0CB3940];
  -[HMBCloudZone zoneID](self, "zoneID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("%s (%@)"), "-[HMBCloudZone(Pull_Internal) _syncInternalModels]", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v3, "initWithName:", v7);

  v9 = (void *)MEMORY[0x1D17B6230]();
  v10 = self;
  HMFGetOSLogHandle();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "identifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "shortDescription");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v39 = v12;
    v40 = 2114;
    v41 = v14;
    _os_log_impl(&dword_1CCD48000, v11, OS_LOG_TYPE_INFO, "%{public}@[%{public}@] Syncing internal models", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v9);
  v15 = objc_alloc_init(MEMORY[0x1E0D519C0]);
  +[HMBModel hmbExternalRecordType](HMBCloudZoneShareParticipantModel, "hmbExternalRecordType");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMBCloudZone queryRecordsWithType:](v10, "queryRecordsWithType:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  -[HMBCloudZone queryRecordsWithType:](v10, "queryRecordsWithType:", *MEMORY[0x1E0C94A20]);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = (void *)MEMORY[0x1E0D519C0];
  v37[0] = v17;
  v37[1] = v18;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v37, 2);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D519E8], "globalAsyncScheduler");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "combineAllFutures:scheduler:", v20, v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = MEMORY[0x1E0C809B0];
  v34[0] = MEMORY[0x1E0C809B0];
  v34[1] = 3221225472;
  v34[2] = __50__HMBCloudZone_Pull_Internal___syncInternalModels__block_invoke;
  v34[3] = &unk_1E89321F8;
  v34[4] = v10;
  v35 = v8;
  v24 = v15;
  v36 = v24;
  v25 = v8;
  objc_msgSend(v22, "addSuccessBlock:", v34);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v32[0] = v23;
  v32[1] = 3221225472;
  v32[2] = __50__HMBCloudZone_Pull_Internal___syncInternalModels__block_invoke_11;
  v32[3] = &unk_1E8932D60;
  v32[4] = v10;
  v27 = v24;
  v33 = v27;
  v28 = (id)objc_msgSend(v26, "addFailureBlock:", v32);

  v29 = v33;
  v30 = v27;

  return v30;
}

void __50__HMBCloudZone_Pull_Internal___syncInternalModels__block_invoke(id *a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  id v17;
  void *v18;
  id v19;
  void *v20;
  id v21;
  NSObject *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  id obj;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  void *v36;
  void *v37;
  id *v38;
  uint64_t v39;
  uint64_t v40;
  id v41;
  id v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  uint8_t buf[4];
  void *v52;
  __int16 v53;
  void *v54;
  __int16 v55;
  void *v56;
  __int16 v57;
  id v58;
  _BYTE v59[128];
  _BYTE v60[128];
  uint64_t v61;

  v61 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = (void *)MEMORY[0x1D17B6230]();
  v5 = a1[4];
  HMFGetOSLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1[5], "identifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "shortDescription");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v52 = v7;
    v53 = 2114;
    v54 = v9;
    _os_log_impl(&dword_1CCD48000, v6, OS_LOG_TYPE_INFO, "%{public}@[%{public}@] Successfully fetched records for internal models", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v4);
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v47 = 0u;
  v48 = 0u;
  v49 = 0u;
  v50 = 0u;
  obj = v3;
  v33 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v47, v60, 16);
  if (v33)
  {
    v32 = *(_QWORD *)v48;
    v38 = a1;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v48 != v32)
          objc_enumerationMutation(obj);
        v34 = v10;
        v11 = *(void **)(*((_QWORD *)&v47 + 1) + 8 * v10);
        v43 = 0u;
        v44 = 0u;
        v45 = 0u;
        v46 = 0u;
        v41 = v11;
        v12 = objc_msgSend(v41, "countByEnumeratingWithState:objects:count:", &v43, v59, 16);
        if (v12)
        {
          v13 = v12;
          v14 = *(_QWORD *)v44;
          v39 = *(_QWORD *)v44;
          do
          {
            v15 = 0;
            v40 = v13;
            do
            {
              if (*(_QWORD *)v44 != v14)
                objc_enumerationMutation(v41);
              v16 = *(void **)(*((_QWORD *)&v43 + 1) + 8 * v15);
              v17 = a1[4];
              v42 = 0;
              objc_msgSend(v17, "decodeModelFromRecord:externalRecordFields:source:error:", v16, 0, 4, &v42);
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              v19 = v42;
              if (v18)
              {
                if ((objc_msgSend(a1[4], "isInternalModel:", v18) & 1) != 0)
                {
                  objc_msgSend(v37, "addObject:", v18);
                  goto LABEL_22;
                }
                v20 = (void *)MEMORY[0x1D17B6230]();
                v21 = a1[4];
                HMFGetOSLogHandle();
                v22 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v22, OS_LOG_TYPE_FAULT))
                {
                  HMFGetLogIdentifier();
                  v35 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(a1[5], "identifier");
                  v36 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v36, "shortDescription");
                  v27 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v16, "hmbDescription");
                  v28 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v18, "hmbDescription");
                  v29 = v20;
                  v30 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 138544130;
                  v52 = v35;
                  v53 = 2114;
                  v54 = v27;
                  v55 = 2112;
                  v56 = v28;
                  v57 = 2112;
                  v58 = v30;
                  _os_log_impl(&dword_1CCD48000, v22, OS_LOG_TYPE_FAULT, "%{public}@[%{public}@] Queried record %@ that decoded into non-internal model: %@", buf, 0x2Au);

                  v20 = v29;
                  a1 = v38;

                  v13 = v40;
                  goto LABEL_20;
                }
              }
              else
              {
                v20 = (void *)MEMORY[0x1D17B6230]();
                v21 = a1[4];
                HMFGetOSLogHandle();
                v22 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v22, OS_LOG_TYPE_FAULT))
                {
                  HMFGetLogIdentifier();
                  v23 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(a1[5], "identifier");
                  v24 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v24, "shortDescription");
                  v25 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v16, "hmbDescription");
                  v26 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 138544130;
                  v52 = v23;
                  v53 = 2114;
                  v54 = v25;
                  v55 = 2112;
                  v56 = v26;
                  v57 = 2112;
                  v58 = v19;
                  _os_log_impl(&dword_1CCD48000, v22, OS_LOG_TYPE_FAULT, "%{public}@[%{public}@] Queried record %@, but failed to decode: %@", buf, 0x2Au);

                  a1 = v38;
                  v13 = v40;

LABEL_20:
                  v14 = v39;
                }
              }

              objc_autoreleasePoolPop(v20);
LABEL_22:

              ++v15;
            }
            while (v13 != v15);
            v13 = objc_msgSend(v41, "countByEnumeratingWithState:objects:count:", &v43, v59, 16);
          }
          while (v13);
        }

        v10 = v34 + 1;
      }
      while (v34 + 1 != v33);
      v33 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v47, v60, 16);
    }
    while (v33);
  }

  objc_msgSend(a1[4], "handleUpdatedInternalModels:", v37);
  objc_msgSend(a1[6], "finishWithNoResult");

}

void __50__HMBCloudZone_Pull_Internal___syncInternalModels__block_invoke_11(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  int v8;
  void *v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = (void *)MEMORY[0x1D17B6230]();
  v5 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138543618;
    v9 = v7;
    v10 = 2112;
    v11 = v3;
    _os_log_impl(&dword_1CCD48000, v6, OS_LOG_TYPE_ERROR, "%{public}@Failed to sync internal models: %@", (uint8_t *)&v8, 0x16u);

  }
  objc_autoreleasePoolPop(v4);
  objc_msgSend(*(id *)(a1 + 40), "finishWithError:", v3);

}

id __81__HMBCloudZone_Pull_Internal___performCloudPullWithOptions_useCachedServerToken___block_invoke(uint64_t a1)
{
  os_unfair_lock_s *v2;
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[5];
  id v8;
  char v9;

  v2 = (os_unfair_lock_s *)(*(_QWORD *)(a1 + 32) + 8);
  os_unfair_lock_lock_with_options();
  objc_msgSend(*(id *)(a1 + 32), "setQueuedCloudPullFuture:", 0);
  os_unfair_lock_unlock(v2);
  objc_msgSend(*(id *)(a1 + 32), "startUp");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __81__HMBCloudZone_Pull_Internal___performCloudPullWithOptions_useCachedServerToken___block_invoke_2;
  v7[3] = &unk_1E89321D0;
  v4 = *(void **)(a1 + 40);
  v7[4] = *(_QWORD *)(a1 + 32);
  v8 = v4;
  v9 = *(_BYTE *)(a1 + 48);
  objc_msgSend(v3, "flatMap:", v7);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

uint64_t __81__HMBCloudZone_Pull_Internal___performCloudPullWithOptions_useCachedServerToken___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_performImmediateCloudPullWithOptions:useCachedServerToken:", *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 48));
}

- (BOOL)hasPerformedInitialFetch
{
  void *v3;
  void *v4;
  void *v5;
  BOOL v6;

  -[HMBCloudZone cloudDatabase](self, "cloudDatabase");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMBCloudZone cloudZoneID](self, "cloudZoneID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "serverChangeTokenForZoneWithID:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5 != 0;

  return v6;
}

- (id)performCloudPullWithOptions:(id)a3
{
  return -[HMBCloudZone _performCloudPullWithOptions:useCachedServerToken:](self, "_performCloudPullWithOptions:useCachedServerToken:", a3, 1);
}

- (NSSet)subscriptions
{
  void *v3;
  void *v4;
  void *v5;

  -[HMBCloudZone cloudDatabase](self, "cloudDatabase");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMBCloudZone cloudZoneID](self, "cloudZoneID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "subscriptionsForZoneWithID:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSSet *)v5;
}

- (id)registerSubscriptionForExternalRecordType:(id)a3
{
  id v4;
  void *v5;
  HMBCloudZone *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  _QWORD v13[5];
  id v14;
  uint8_t buf[4];
  void *v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)MEMORY[0x1D17B6230]();
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v16 = v8;
    v17 = 2112;
    v18 = v4;
    _os_log_impl(&dword_1CCD48000, v7, OS_LOG_TYPE_INFO, "%{public}@Registering subscription for external record type %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v5);
  -[HMBCloudZone startUp](v6, "startUp");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __72__HMBCloudZone_Subscription__registerSubscriptionForExternalRecordType___block_invoke;
  v13[3] = &unk_1E8933F18;
  v13[4] = v6;
  v14 = v4;
  v10 = v4;
  objc_msgSend(v9, "flatMap:", v13);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)unregisterSubscriptionForExternalRecordType:(id)a3
{
  id v4;
  void *v5;
  HMBCloudZone *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  _QWORD v13[5];
  id v14;
  uint8_t buf[4];
  void *v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)MEMORY[0x1D17B6230]();
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v16 = v8;
    v17 = 2112;
    v18 = v4;
    _os_log_impl(&dword_1CCD48000, v7, OS_LOG_TYPE_INFO, "%{public}@Unregistering subscription for external record type %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v5);
  -[HMBCloudZone startUp](v6, "startUp");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __74__HMBCloudZone_Subscription__unregisterSubscriptionForExternalRecordType___block_invoke;
  v13[3] = &unk_1E8933F18;
  v13[4] = v6;
  v14 = v4;
  v10 = v4;
  objc_msgSend(v9, "flatMap:", v13);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

id __74__HMBCloudZone_Subscription__unregisterSubscriptionForExternalRecordType___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  objc_msgSend(*(id *)(a1 + 32), "cloudDatabase");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "cloudZoneID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "subscriptionIDForZoneID:recordType:", v3, *(_QWORD *)(a1 + 40));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = objc_alloc(MEMORY[0x1E0C950B0]);
  objc_msgSend(*(id *)(a1 + 32), "cloudZoneID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "zoneID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v5, "initWithZoneID:subscriptionID:", v7, v4);

  objc_msgSend(v8, "setRecordType:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "cloudZoneID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "unregisterSubscription:forZoneWithID:", v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

id __72__HMBCloudZone_Subscription__registerSubscriptionForExternalRecordType___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  objc_msgSend(*(id *)(a1 + 32), "cloudDatabase");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "cloudZoneID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "subscriptionIDForZoneID:recordType:", v3, *(_QWORD *)(a1 + 40));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = objc_alloc(MEMORY[0x1E0C950B0]);
  objc_msgSend(*(id *)(a1 + 32), "cloudZoneID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "zoneID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v5, "initWithZoneID:subscriptionID:", v7, v4);

  objc_msgSend(v8, "setRecordType:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "cloudZoneID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "registerSubscription:forZoneWithID:", v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)_fetchRecordsWithRecordIDs:(id)a3 canRetry:(BOOL)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  _QWORD v13[5];
  id v14;
  BOOL v15;

  v6 = a3;
  v7 = (void *)MEMORY[0x1E0D519C0];
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __68__HMBCloudZone_Fetch_Internal___fetchRecordsWithRecordIDs_canRetry___block_invoke;
  v13[3] = &unk_1E8932938;
  v13[4] = self;
  v14 = v6;
  v15 = a4;
  v8 = (void *)MEMORY[0x1E0D519E8];
  v9 = v6;
  objc_msgSend(v8, "globalAsyncScheduler");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "futureWithBlock:scheduler:", v13, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (void)_fetchRecordsForContexts:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  HMBCloudZone *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  HMBCloudZone *v16;
  uint8_t buf[4];
  void *v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "na_flatMap:", &__block_literal_global_4563);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x1D17B6230]();
  v7 = self;
  HMFGetOSLogHandle();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "hmbDescription");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v18 = v9;
    v19 = 2112;
    v20 = v10;
    _os_log_impl(&dword_1CCD48000, v8, OS_LOG_TYPE_INFO, "%{public}@Performing fetch for records with record IDs: %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v6);
  -[HMBCloudZone _fetchRecordsWithRecordIDs:canRetry:](v7, "_fetchRecordsWithRecordIDs:canRetry:", v5, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __57__HMBCloudZone_Fetch_Internal___fetchRecordsForContexts___block_invoke_3;
  v14[3] = &unk_1E89329C8;
  v15 = v4;
  v16 = v7;
  v12 = v4;
  v13 = (id)objc_msgSend(v11, "addCompletionBlock:", v14);

}

- (id)fetchRecordsWithRecordIDs:(id)a3
{
  id v4;
  HMBCloudZoneFetchRecordsContext *v5;
  id v6;
  HMBCloudZoneFetchRecordsContext *v7;
  void *v8;
  void *v9;
  void *v10;
  HMBCloudZone *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  int v19;
  void *v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = [HMBCloudZoneFetchRecordsContext alloc];
  v6 = objc_alloc_init(MEMORY[0x1E0D519C0]);
  v7 = -[HMBCloudZoneFetchRecordsContext initWithRecordIDs:future:](v5, "initWithRecordIDs:future:", v4, v6);

  os_unfair_lock_lock_with_options();
  -[HMBCloudZone queuedFetchRecordsContexts](self, "queuedFetchRecordsContexts");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    objc_msgSend(v8, "addObject:", v7);
    os_unfair_lock_unlock(&self->_propertyLock);
    v10 = (void *)MEMORY[0x1D17B6230]();
    v11 = self;
    HMFGetOSLogHandle();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "hmbDescription");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = 138543618;
      v20 = v13;
      v21 = 2112;
      v22 = v14;
      _os_log_impl(&dword_1CCD48000, v12, OS_LOG_TYPE_INFO, "%{public}@Queueing fetch for records with record IDs: %@", (uint8_t *)&v19, 0x16u);

    }
    objc_autoreleasePoolPop(v10);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMBCloudZone setQueuedFetchRecordsContexts:](self, "setQueuedFetchRecordsContexts:", v15);

    os_unfair_lock_unlock(&self->_propertyLock);
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v7);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMBCloudZone _fetchRecordsForContexts:](self, "_fetchRecordsForContexts:", v16);

  }
  -[HMBCloudZoneFetchRecordsContext future](v7, "future");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

- (id)fetchRecordWithRecordID:(id)a3 canRetry:(BOOL)a4
{
  _BOOL8 v4;
  void *v6;
  void *v7;
  void *v8;

  v4 = a4;
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMBCloudZone _fetchRecordsWithRecordIDs:canRetry:](self, "_fetchRecordsWithRecordIDs:canRetry:", v6, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "flatMap:", &__block_literal_global_10);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)fetchCompleteModelForRecordID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  HMBCloudZone *v10;
  SEL v11;
  id v12;
  _QWORD v13[5];

  v4 = a3;
  if (v4)
  {
    v5 = v4;
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMBCloudZone fetchCompleteModelsForRecordIDs:](self, "fetchCompleteModelsForRecordIDs:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __62__HMBCloudZone_Fetch_Internal__fetchCompleteModelForRecordID___block_invoke;
    v13[3] = &unk_1E8932A30;
    v13[4] = self;
    objc_msgSend(v7, "flatMap:", v13);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    return v8;
  }
  else
  {
    v10 = (HMBCloudZone *)_HMFPreconditionFailure();
    return -[HMBCloudZone fetchCompleteModelsForRecordIDs:](v10, v11, v12);
  }
}

- (id)fetchCompleteModelsForRecordIDs:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  HMBCloudZone *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  _QWORD v16[5];
  id v17;
  uint8_t buf[4];
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!v4)
    _HMFPreconditionFailure();
  v5 = v4;
  if (objc_msgSend(v4, "count"))
  {
    v6 = (void *)objc_msgSend(v5, "mutableCopy");
    -[HMBCloudZone fetchRecordsWithRecordIDs:](self, "fetchRecordsWithRecordIDs:", v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __64__HMBCloudZone_Fetch_Internal__fetchCompleteModelsForRecordIDs___block_invoke;
    v16[3] = &unk_1E8932A58;
    v16[4] = self;
    v17 = v6;
    v8 = v6;
    objc_msgSend(v7, "flatMap:", v16);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v10 = (void *)MEMORY[0x1D17B6230]();
    v11 = self;
    HMFGetOSLogHandle();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      HMFGetLogIdentifier();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v19 = v13;
      _os_log_impl(&dword_1CCD48000, v12, OS_LOG_TYPE_DEBUG, "%{public}@Asked to fetch an empty set of record IDs", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v10);
    v14 = (void *)MEMORY[0x1E0D519C0];
    objc_msgSend(MEMORY[0x1E0C99E60], "set");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "futureWithResult:", v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v9;
}

id __64__HMBCloudZone_Fetch_Internal__fetchCompleteModelsForRecordIDs___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t i;
  void *v28;
  void *v29;
  id v30;
  void *v31;
  void *v32;
  id v33;
  NSObject *v34;
  void *v35;
  void *v36;
  void *v37;
  id v38;
  NSObject *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  id obj;
  void *v47;
  void *v49;
  id v50;
  void *v51;
  uint64_t v52;
  id v53;
  id v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  id v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  uint8_t v64[128];
  uint8_t buf[4];
  void *v66;
  __int16 v67;
  void *v68;
  __int16 v69;
  id v70;
  _BYTE v71[128];
  uint64_t v72;

  v72 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  objc_msgSend(MEMORY[0x1E0C99E20], "setWithCapacity:", objc_msgSend(v2, "count"));
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v60 = 0u;
  v61 = 0u;
  v62 = 0u;
  v63 = 0u;
  v3 = v2;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v60, v71, 16);
  obj = v3;
  if (v4)
  {
    v5 = v4;
    v6 = 0;
    v7 = *(_QWORD *)v61;
    while (2)
    {
      v8 = 0;
      v9 = v6;
      do
      {
        if (*(_QWORD *)v61 != v7)
          objc_enumerationMutation(obj);
        v10 = *(void **)(*((_QWORD *)&v60 + 1) + 8 * v8);
        v11 = *(void **)(a1 + 32);
        v59 = v9;
        objc_msgSend(v11, "decodeModelFromRecord:externalRecordFields:source:error:", v10, 0, 4, &v59);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v6 = v59;

        if (!v12)
        {
          v15 = (void *)MEMORY[0x1D17B6230]();
          v16 = *(id *)(a1 + 32);
          HMFGetOSLogHandle();
          v17 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
          {
            HMFGetLogIdentifier();
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543874;
            v66 = v18;
            v67 = 2112;
            v68 = v10;
            v69 = 2112;
            v70 = v6;
            _os_log_impl(&dword_1CCD48000, v17, OS_LOG_TYPE_ERROR, "%{public}@Failed to decode complete model for record %@: %@", buf, 0x20u);

          }
          objc_autoreleasePoolPop(v15);
          objc_msgSend(MEMORY[0x1E0D519C0], "futureWithError:", v6);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = obj;
          v21 = v47;
          v22 = obj;
          goto LABEL_35;
        }
        v13 = *(void **)(a1 + 40);
        objc_msgSend(v10, "recordID");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "removeObject:", v14);

        objc_msgSend(v47, "addObject:", v12);
        ++v8;
        v9 = v6;
      }
      while (v5 != v8);
      v3 = obj;
      v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v60, v71, 16);
      if (v5)
        continue;
      break;
    }
  }
  else
  {
    v6 = 0;
  }

  v23 = a1;
  objc_msgSend(MEMORY[0x1E0C99E20], "setWithCapacity:", objc_msgSend(*(id *)(a1 + 40), "count"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "localZone");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  v55 = 0u;
  v56 = 0u;
  v57 = 0u;
  v58 = 0u;
  v50 = *(id *)(a1 + 40);
  v25 = objc_msgSend(v50, "countByEnumeratingWithState:objects:count:", &v55, v64, 16);
  v49 = v24;
  if (v25)
  {
    v26 = v25;
    v52 = *(_QWORD *)v56;
    do
    {
      for (i = 0; i != v26; ++i)
      {
        if (*(_QWORD *)v56 != v52)
          objc_enumerationMutation(v50);
        v28 = *(void **)(*((_QWORD *)&v55 + 1) + 8 * i);
        v54 = v6;
        objc_msgSend(v28, "externalID:", &v54);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v30 = v54;

        if (v29)
        {
          v53 = v30;
          objc_msgSend(v51, "modelIDForExternalID:error:", v29, &v53);
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          v6 = v53;

          if (v31)
          {
            objc_msgSend(v24, "addObject:", v31);
          }
          else
          {
            v37 = (void *)MEMORY[0x1D17B6230]();
            v38 = *(id *)(v23 + 32);
            HMFGetOSLogHandle();
            v39 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
            {
              HMFGetLogIdentifier();
              v40 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v29, "hmbDescription");
              v41 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543874;
              v66 = v40;
              v67 = 2112;
              v68 = v41;
              v69 = 2112;
              v70 = v6;
              _os_log_impl(&dword_1CCD48000, v39, OS_LOG_TYPE_ERROR, "%{public}@Unable to fetch modelID for externalID %@: %@", buf, 0x20u);

              v23 = a1;
              v24 = v49;
            }

            objc_autoreleasePoolPop(v37);
          }

        }
        else
        {
          v32 = (void *)MEMORY[0x1D17B6230]();
          v33 = *(id *)(v23 + 32);
          HMFGetOSLogHandle();
          v34 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
          {
            HMFGetLogIdentifier();
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v28, "hmbDescription");
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543874;
            v66 = v35;
            v67 = 2112;
            v68 = v36;
            v69 = 2112;
            v70 = v30;
            _os_log_impl(&dword_1CCD48000, v34, OS_LOG_TYPE_ERROR, "%{public}@Unable to encode externalID from recordID %@: %@", buf, 0x20u);

            v24 = v49;
          }

          objc_autoreleasePoolPop(v32);
          v6 = v30;
        }

      }
      v26 = objc_msgSend(v50, "countByEnumeratingWithState:objects:count:", &v55, v64, 16);
    }
    while (v26);
  }
  v42 = v6;

  v21 = v47;
  objc_msgSend(v47, "allObjects");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "allObjects");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "update:remove:", v43, v44);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  if (v6)
    objc_msgSend(MEMORY[0x1E0D519C0], "futureWithError:", v6);
  else
    objc_msgSend(MEMORY[0x1E0D519C0], "futureWithResult:", v47);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = obj;

  v22 = v49;
LABEL_35:

  return v19;
}

id __62__HMBCloudZone_Fetch_Internal__fetchCompleteModelForRecordID___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  int v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "anyObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0D519C0], "futureWithResult:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = (void *)MEMORY[0x1D17B6230]();
    v7 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 138543362;
      v14 = v9;
      _os_log_impl(&dword_1CCD48000, v8, OS_LOG_TYPE_ERROR, "%{public}@Successfully fetched complete models for record ID but no models were returned", (uint8_t *)&v13, 0xCu);

    }
    objc_autoreleasePoolPop(v6);
    v10 = (void *)MEMORY[0x1E0D519C0];
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmfErrorWithCode:", 2);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "futureWithError:", v11);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v5;
}

id __65__HMBCloudZone_Fetch_Internal__fetchRecordWithRecordID_canRetry___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(a2, "allValues");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "firstObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = (void *)MEMORY[0x1E0D519C0];
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0D519C0], "futureWithResult:", v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmfErrorWithCode:", 2);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "futureWithError:", v6);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v5;
}

void __57__HMBCloudZone_Fetch_Internal___fetchRecordsForContexts___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  os_unfair_lock_s *v15;
  void *v16;
  uint64_t v17;
  id v18;
  _QWORD v19[4];
  id v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v17 = a1;
  v18 = a3;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v6 = *(id *)(a1 + 32);
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v22;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v22 != v8)
          objc_enumerationMutation(v6);
        v10 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * v9);
        if (v5)
        {
          objc_msgSend(*(id *)(*((_QWORD *)&v21 + 1) + 8 * v9), "recordIDs");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v19[0] = MEMORY[0x1E0C809B0];
          v19[1] = 3221225472;
          v19[2] = __57__HMBCloudZone_Fetch_Internal___fetchRecordsForContexts___block_invoke_2;
          v19[3] = &unk_1E89329A0;
          v20 = v5;
          objc_msgSend(v11, "na_map:", v19);
          v12 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v10, "future");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "finishWithResult:", v12);

          v14 = v20;
        }
        else
        {
          objc_msgSend(*(id *)(*((_QWORD *)&v21 + 1) + 8 * v9), "future");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "finishWithError:", v18);
        }

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v7);
  }

  v15 = (os_unfair_lock_s *)(*(_QWORD *)(v17 + 40) + 8);
  os_unfair_lock_lock_with_options();
  objc_msgSend(*(id *)(v17 + 40), "queuedFetchRecordsContexts");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(v17 + 40), "setQueuedFetchRecordsContexts:", 0);
  os_unfair_lock_unlock(v15);
  if (objc_msgSend(v16, "count"))
    objc_msgSend(*(id *)(v17 + 40), "_fetchRecordsForContexts:", v16);

}

uint64_t __57__HMBCloudZone_Fetch_Internal___fetchRecordsForContexts___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", a2);
}

uint64_t __57__HMBCloudZone_Fetch_Internal___fetchRecordsForContexts___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "recordIDs");
}

void __68__HMBCloudZone_Fetch_Internal___fetchRecordsWithRecordIDs_canRetry___block_invoke(uint64_t a1, void *a2)
{
  __fetchRecordsWithRecordIDs(*(void **)(a1 + 32), *(void **)(a1 + 40), *(_BYTE *)(a1 + 48), 0, a2);
}

- (id)fetchCompleteModel:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  HMBCloudZone *v9;
  SEL v10;
  id v11;

  v4 = a3;
  if (v4)
  {
    v5 = v4;
    objc_msgSend(v4, "hmbModelID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMBCloudZone fetchCompleteModelWithID:](self, "fetchCompleteModelWithID:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    return v7;
  }
  else
  {
    v9 = (HMBCloudZone *)_HMFPreconditionFailure();
    return -[HMBCloudZone fetchCompleteModels:](v9, v10, v11);
  }
}

- (id)fetchCompleteModels:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  HMBCloudZone *v9;
  SEL v10;
  id v11;

  v4 = a3;
  if (v4)
  {
    v5 = v4;
    objc_msgSend(v4, "na_map:", &__block_literal_global_28_4597);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMBCloudZone fetchCompleteModelsWithIDs:](self, "fetchCompleteModelsWithIDs:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    return v7;
  }
  else
  {
    v9 = (HMBCloudZone *)_HMFPreconditionFailure();
    return -[HMBCloudZone fetchCompleteModelWithID:](v9, v10, v11);
  }
}

- (id)fetchCompleteModelWithID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  HMBCloudZone *v10;
  SEL v11;
  id v12;
  _QWORD v13[5];

  v4 = a3;
  if (v4)
  {
    v5 = v4;
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMBCloudZone fetchCompleteModelsWithIDs:](self, "fetchCompleteModelsWithIDs:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __48__HMBCloudZone_Fetch__fetchCompleteModelWithID___block_invoke;
    v13[3] = &unk_1E8932A30;
    v13[4] = self;
    objc_msgSend(v7, "flatMap:", v13);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    return v8;
  }
  else
  {
    v10 = (HMBCloudZone *)_HMFPreconditionFailure();
    return -[HMBCloudZone fetchCompleteModelsWithIDs:](v10, v11, v12);
  }
}

- (id)fetchCompleteModelsWithIDs:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  HMBCloudZone *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  HMBCloudZone *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  void *v23;
  HMBCloudZone *v24;
  NSObject *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  _QWORD v31[5];
  id v32;
  uint8_t buf[4];
  void *v34;
  __int16 v35;
  uint64_t v36;
  __int16 v37;
  uint64_t v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!v4)
    _HMFPreconditionFailure();
  v5 = v4;
  v6 = (void *)MEMORY[0x1D17B6230]();
  v7 = self;
  HMFGetOSLogHandle();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "hmbDescription");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v34 = v9;
    v35 = 2112;
    v36 = (uint64_t)v10;
    _os_log_impl(&dword_1CCD48000, v8, OS_LOG_TYPE_INFO, "%{public}@Fetching complete models with IDs: %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v6);
  -[HMBCloudZone localZone](v7, "localZone");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "allObjects");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = 0;
  objc_msgSend(v11, "fetchExternalIDsForModelIDs:error:", v12, &v32);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v32;

  if (v13)
  {
    v15 = objc_msgSend(v13, "count");
    if (v15 == objc_msgSend(v5, "count"))
    {
      v31[0] = MEMORY[0x1E0C809B0];
      v31[1] = 3221225472;
      v31[2] = __50__HMBCloudZone_Fetch__fetchCompleteModelsWithIDs___block_invoke;
      v31[3] = &unk_1E8932AC0;
      v31[4] = v7;
      objc_msgSend(v13, "na_map:", v31);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMBCloudZone fetchCompleteModelsForRecordIDs:](v7, "fetchCompleteModelsForRecordIDs:", v16);
      v17 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v23 = (void *)MEMORY[0x1D17B6230]();
      v24 = v7;
      HMFGetOSLogHandle();
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = objc_msgSend(v13, "count");
        v28 = objc_msgSend(v5, "count");
        *(_DWORD *)buf = 138543874;
        v34 = v26;
        v35 = 2048;
        v36 = v27;
        v37 = 2048;
        v38 = v28;
        _os_log_impl(&dword_1CCD48000, v25, OS_LOG_TYPE_ERROR, "%{public}@Fetched %lu external IDs but requested %lu model IDs", buf, 0x20u);

      }
      objc_autoreleasePoolPop(v23);
      v29 = (void *)MEMORY[0x1E0D519C0];
      objc_msgSend(MEMORY[0x1E0CB35C8], "hmfErrorWithCode:", 15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "futureWithError:", v16);
      v17 = objc_claimAutoreleasedReturnValue();
    }
    v22 = (void *)v17;

  }
  else
  {
    v18 = (void *)MEMORY[0x1D17B6230]();
    v19 = v7;
    HMFGetOSLogHandle();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v34 = v21;
      v35 = 2112;
      v36 = (uint64_t)v5;
      v37 = 2112;
      v38 = (uint64_t)v14;
      _os_log_impl(&dword_1CCD48000, v20, OS_LOG_TYPE_ERROR, "%{public}@Failed to fetch external IDs for model IDs %@: %@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v18);
    objc_msgSend(MEMORY[0x1E0D519C0], "futureWithError:", v14);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v22;
}

id __50__HMBCloudZone_Fetch__fetchCompleteModelsWithIDs___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  id v6;
  void *v7;
  id v8;
  NSObject *v9;
  void *v10;
  id v12;
  uint8_t buf[4];
  void *v14;
  __int16 v15;
  id v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v12 = 0;
  objc_msgSend(MEMORY[0x1E0C95070], "recordIDFromExternalID:error:", v3, &v12);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v12;
  if (v4)
  {
    v6 = v4;
  }
  else
  {
    v7 = (void *)MEMORY[0x1D17B6230]();
    v8 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v14 = v10;
      v15 = 2112;
      v16 = v3;
      v17 = 2112;
      v18 = v5;
      _os_log_impl(&dword_1CCD48000, v9, OS_LOG_TYPE_ERROR, "%{public}@Failed to decode record ID from data %@: %@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v7);
  }

  return v4;
}

id __48__HMBCloudZone_Fetch__fetchCompleteModelWithID___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  int v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "anyObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0D519C0], "futureWithResult:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = (void *)MEMORY[0x1D17B6230]();
    v7 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 138543362;
      v14 = v9;
      _os_log_impl(&dword_1CCD48000, v8, OS_LOG_TYPE_ERROR, "%{public}@Successfully fetched complete model IDs but no models were returned", (uint8_t *)&v13, 0xCu);

    }
    objc_autoreleasePoolPop(v6);
    v10 = (void *)MEMORY[0x1E0D519C0];
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmfErrorWithCode:", 2);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "futureWithError:", v11);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v5;
}

uint64_t __43__HMBCloudZone_Fetch__fetchCompleteModels___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "hmbModelID");
}

- (id)queryRecordsWithType:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v11;
  HMBCloudZone *v12;
  id v13;

  v4 = a3;
  v5 = (void *)MEMORY[0x1E0D519C0];
  v11 = MEMORY[0x1E0C809B0];
  v12 = self;
  v13 = v4;
  v6 = (void *)MEMORY[0x1E0D519E8];
  v7 = v4;
  objc_msgSend(v6, "globalAsyncScheduler", v11, 3221225472, __44__HMBCloudZone_Query__queryRecordsWithType___block_invoke, &unk_1E8933550, v12);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "futureWithBlock:scheduler:", &v11, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

void __44__HMBCloudZone_Query__queryRecordsWithType___block_invoke(uint64_t a1, void *a2)
{
  __queryRecordsWithRecordType(*(void **)(a1 + 32), *(void **)(a1 + 40), 0, 0, 0, a2);
}

- (void)pushGroupWithBlockRow:(unint64_t)a3 tuples:(id)a4 options:(id)a5 activity:(id)a6 completionPromise:(id)a7
{
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  uint64_t v22;
  id v23;
  void *v24;
  void *v25;
  id v26;
  uint64_t v27;
  void *v28;
  void *v29;
  HMBCloudZone *v30;
  NSObject *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  HMBCloudZone *v36;
  NSObject *v37;
  void *v38;
  void *v39;
  void *v40;
  HMBCloudZone *v41;
  NSObject *v42;
  void *v43;
  void *v44;
  void *v45;
  HMBCloudZone *v46;
  NSObject *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  HMBCloudZone *v55;
  NSObject *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  HMBCloudZone *v61;
  NSObject *v62;
  void *v63;
  void *v64;
  void *v65;
  uint64_t v66;
  void *v67;
  HMBCloudZone *v68;
  NSObject *v69;
  void *v70;
  void *v71;
  void *v72;
  HMBCloudZone *v73;
  NSObject *v74;
  void *v75;
  void *v76;
  void *v77;
  id v78;
  void *v79;
  HMBCloudZone *v80;
  NSObject *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  uint64_t v86;
  id v87;
  id v88;
  id v89;
  void *v90;
  id v91;
  void *v92;
  HMBCloudZone *v93;
  NSObject *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  HMBCloudZone *v99;
  NSObject *v100;
  void *v101;
  void *v102;
  void *v103;
  void *v104;
  id v105;
  id v107;
  id v108;
  void *v109;
  void *v110;
  void *v111;
  id v112;
  void *v113;
  void *v114;
  void *v115;
  void *context;
  id obj;
  id v118;
  void *v119;
  uint64_t v120;
  uint64_t v121;
  HMBCloudZoneEncodingContext *v122;
  void *v124;
  void *v125;
  void *v126;
  void *v127;
  _QWORD v128[4];
  id v129;
  id v130;
  id v131;
  id v132;
  id v133;
  id v134;
  id v135[2];
  _QWORD v136[4];
  id v137;
  id v138;
  id v139[2];
  id v140;
  id v141;
  id v142;
  id v143;
  __int128 v144;
  __int128 v145;
  __int128 v146;
  __int128 v147;
  __int128 v148;
  __int128 v149;
  __int128 v150;
  __int128 v151;
  uint8_t buf[4];
  void *v153;
  __int16 v154;
  unint64_t v155;
  __int16 v156;
  unint64_t v157;
  __int16 v158;
  id v159;
  _BYTE v160[128];
  _BYTE v161[128];
  uint64_t v162;

  v162 = *MEMORY[0x1E0C80C00];
  v107 = a4;
  v105 = a5;
  v112 = a6;
  v108 = a7;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v111 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v110 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v104 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v115 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMBCloudZone modelContainer](self, "modelContainer");
  v109 = (void *)objc_claimAutoreleasedReturnValue();
  if (v109)
  {
    v122 = -[HMBCloudZoneEncodingContext initWithModelContainer:]([HMBCloudZoneEncodingContext alloc], "initWithModelContainer:", v109);
    v148 = 0u;
    v149 = 0u;
    v150 = 0u;
    v151 = 0u;
    v10 = v107;
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v148, v161, 16);
    if (v11)
    {
      v12 = *(_QWORD *)v149;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v149 != v12)
            objc_enumerationMutation(v10);
          objc_msgSend(*(id *)(*((_QWORD *)&v148 + 1) + 8 * i), "model");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          if (v14)
          {
            -[HMBCloudZone recordIDForModel:](self, "recordIDForModel:", v14);
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            -[HMBCloudZoneEncodingContext createdRecords](v122, "createdRecords");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v14, "hmbModelID");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v16, "setObject:forKeyedSubscript:", v15, v17);

          }
        }
        v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v148, v161, 16);
      }
      while (v11);
    }

    v146 = 0u;
    v147 = 0u;
    v144 = 0u;
    v145 = 0u;
    obj = v10;
    v121 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v144, v160, 16);
    if (!v121)
    {
      v18 = 0;
      goto LABEL_59;
    }
    v18 = 0;
    v120 = *(_QWORD *)v145;
    while (1)
    {
      v19 = 0;
      do
      {
        if (*(_QWORD *)v145 != v120)
          objc_enumerationMutation(obj);
        v20 = *(void **)(*((_QWORD *)&v144 + 1) + 8 * v19);
        v124 = (void *)MEMORY[0x1D17B6230]();
        objc_msgSend(v20, "model");
        v127 = (void *)objc_claimAutoreleasedReturnValue();
        if (v127)
        {
          objc_msgSend(v20, "externalData");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v21)
          {
            v24 = 0;
LABEL_24:
            v141 = v18;
            v119 = v24;
            -[HMBCloudZone encodeRecordFromModel:existingRecord:encodingContext:error:](self, "encodeRecordFromModel:existingRecord:encodingContext:error:", v127);
            v125 = (void *)objc_claimAutoreleasedReturnValue();
            v26 = v141;

            if (v125)
            {
              objc_msgSend(v20, "externalID");
              v27 = objc_claimAutoreleasedReturnValue();
              v28 = (void *)v27;
              if (v27)
              {
                v118 = v26;
                goto LABEL_38;
              }
              v140 = v26;
              objc_msgSend(v125, "externalID:", &v140);
              v28 = (void *)objc_claimAutoreleasedReturnValue();
              v118 = v140;

              if (v28)
              {
                v27 = objc_msgSend(v20, "setExternalID:", v28);
LABEL_38:
                context = (void *)MEMORY[0x1D17B6230](v27);
                v46 = self;
                HMFGetOSLogHandle();
                v47 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v47, OS_LOG_TYPE_DEBUG))
                {
                  HMFGetLogIdentifier();
                  v113 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v112, "identifier");
                  v114 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v114, "shortDescription");
                  v48 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v20, "model");
                  v49 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v49, "hmbDescription");
                  v50 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v125, "hmbDescription");
                  v51 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 138544130;
                  v153 = v113;
                  v154 = 2114;
                  v155 = (unint64_t)v48;
                  v156 = 2112;
                  v157 = (unint64_t)v50;
                  v158 = 2112;
                  v159 = v51;
                  _os_log_impl(&dword_1CCD48000, v47, OS_LOG_TYPE_DEBUG, "%{public}@[%{public}@] Preparing to update: %@ / %@", buf, 0x2Au);

                }
                objc_autoreleasePoolPop(context);
                objc_msgSend(v125, "recordID");
                v52 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v111, "setObject:forKey:", v125, v52);

                objc_msgSend(v125, "recordID");
                v53 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v115, "setObject:forKey:", v20, v53);

              }
              else
              {
                v60 = (void *)MEMORY[0x1D17B6230]();
                v61 = self;
                HMFGetOSLogHandle();
                v62 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v62, OS_LOG_TYPE_ERROR))
                {
                  HMFGetLogIdentifier();
                  v63 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v112, "identifier");
                  v64 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v64, "shortDescription");
                  v65 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 138543874;
                  v153 = v63;
                  v154 = 2114;
                  v155 = (unint64_t)v65;
                  v156 = 2112;
                  v157 = (unint64_t)v118;
                  _os_log_impl(&dword_1CCD48000, v62, OS_LOG_TYPE_ERROR, "%{public}@[%{public}@] Unable to encode recordID for update: %@", buf, 0x20u);

                }
                objc_autoreleasePoolPop(v60);
              }
              v26 = v118;
            }
            else
            {
              v29 = (void *)MEMORY[0x1D17B6230]();
              v30 = self;
              HMFGetOSLogHandle();
              v31 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
              {
                HMFGetLogIdentifier();
                v32 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v112, "identifier");
                v33 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v33, "shortDescription");
                v34 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138543874;
                v153 = v32;
                v154 = 2114;
                v155 = (unint64_t)v34;
                v156 = 2112;
                v157 = (unint64_t)v26;
                _os_log_impl(&dword_1CCD48000, v31, OS_LOG_TYPE_ERROR, "%{public}@[%{public}@] Unable to encode record for update: %@", buf, 0x20u);

              }
              objc_autoreleasePoolPop(v29);
            }

LABEL_47:
            v18 = v26;
            goto LABEL_48;
          }
          v142 = v18;
          objc_msgSend(MEMORY[0x1E0C95048], "recordFromExternalData:error:", v21, &v142);
          v22 = objc_claimAutoreleasedReturnValue();
          v23 = v142;

          if (v22)
          {
            v24 = (void *)v22;
            v18 = v23;
            goto LABEL_24;
          }
          v35 = (void *)MEMORY[0x1D17B6230]();
          v36 = self;
          HMFGetOSLogHandle();
          v37 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
          {
            HMFGetLogIdentifier();
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v21, "hmbDescription");
            v39 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543874;
            v153 = v38;
            v154 = 2112;
            v155 = (unint64_t)v39;
            v156 = 2112;
            v157 = (unint64_t)v23;
            _os_log_impl(&dword_1CCD48000, v37, OS_LOG_TYPE_ERROR, "%{public}@Failed to decode record from external data %@: %@", buf, 0x20u);

          }
          objc_autoreleasePoolPop(v35);
          v18 = v23;
        }
        else
        {
          objc_msgSend(v20, "externalID");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          if (v21)
          {
            v143 = v18;
            objc_msgSend(MEMORY[0x1E0C95070], "recordIDFromExternalID:error:", v21, &v143);
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            v26 = v143;

            if (v25)
            {
              objc_msgSend(v110, "addObject:", v25);
              objc_msgSend(v115, "setObject:forKey:", v20, v25);
            }
            else
            {
              v54 = (void *)MEMORY[0x1D17B6230]();
              v55 = self;
              HMFGetOSLogHandle();
              v56 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v56, OS_LOG_TYPE_ERROR))
              {
                HMFGetLogIdentifier();
                v126 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v112, "identifier");
                v57 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v57, "shortDescription");
                v58 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v20, "externalID");
                v59 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138544130;
                v153 = v126;
                v154 = 2114;
                v155 = (unint64_t)v58;
                v156 = 2112;
                v157 = (unint64_t)v59;
                v158 = 2112;
                v159 = v26;
                _os_log_impl(&dword_1CCD48000, v56, OS_LOG_TYPE_ERROR, "%{public}@[%{public}@] Failed to decode encoded record ID %@: %@", buf, 0x2Au);

              }
              objc_autoreleasePoolPop(v54);
            }

            goto LABEL_47;
          }
          v40 = (void *)MEMORY[0x1D17B6230]();
          v41 = self;
          HMFGetOSLogHandle();
          v42 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v42, OS_LOG_TYPE_FAULT))
          {
            HMFGetLogIdentifier();
            v43 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v112, "identifier");
            v44 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v44, "shortDescription");
            v45 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v153 = v43;
            v154 = 2114;
            v155 = (unint64_t)v45;
            _os_log_impl(&dword_1CCD48000, v42, OS_LOG_TYPE_FAULT, "%{public}@[%{public}@] Deletion was staged for record without an external ID", buf, 0x16u);

          }
          objc_autoreleasePoolPop(v40);
          v21 = 0;
        }
LABEL_48:

        objc_autoreleasePoolPop(v124);
        ++v19;
      }
      while (v121 != v19);
      v66 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v144, v160, 16);
      v121 = v66;
      if (!v66)
      {
LABEL_59:

        -[HMBCloudZone localZone](self, "localZone");
        v71 = (void *)objc_claimAutoreleasedReturnValue();
        if (v18)
        {
          v72 = (void *)MEMORY[0x1D17B6230]();
          v73 = self;
          HMFGetOSLogHandle();
          v74 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v74, OS_LOG_TYPE_ERROR))
          {
            HMFGetLogIdentifier();
            v75 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v112, "identifier");
            v76 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v76, "shortDescription");
            v77 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138544130;
            v153 = v75;
            v154 = 2114;
            v155 = (unint64_t)v77;
            v156 = 2048;
            v157 = a3;
            v158 = 2112;
            v159 = v18;
            _os_log_impl(&dword_1CCD48000, v74, OS_LOG_TYPE_ERROR, "%{public}@[%{public}@] Aborting block %lu due to encoding error: %@.", buf, 0x2Au);

          }
          objc_autoreleasePoolPop(v72);
          objc_msgSend(v71, "markGroupAsSentWithOutputBlock:tuples:", a3, obj);
          v78 = (id)objc_claimAutoreleasedReturnValue();
          if (v78)
          {
            v79 = (void *)MEMORY[0x1D17B6230]();
            v80 = v73;
            HMFGetOSLogHandle();
            v81 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v81, OS_LOG_TYPE_ERROR))
            {
              HMFGetLogIdentifier();
              v82 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v112, "identifier");
              v83 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v83, "shortDescription");
              v84 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138544130;
              v153 = v82;
              v154 = 2114;
              v155 = (unint64_t)v84;
              v156 = 2048;
              v157 = a3;
              v158 = 2112;
              v159 = v78;
              _os_log_impl(&dword_1CCD48000, v81, OS_LOG_TYPE_ERROR, "%{public}@[%{public}@] Abort update for block %lu failed with error: %@", buf, 0x2Au);

            }
            objc_autoreleasePoolPop(v79);
          }
          objc_msgSend(v108, "finishWithError:", v18);
        }
        else if (objc_msgSend(v111, "count") || objc_msgSend(v110, "count"))
        {
          v78 = objc_alloc_init(MEMORY[0x1E0D519D8]);
          __pushWithRecovery(self, a3, v115, v111, v110, v105, v78);
          objc_initWeak((id *)buf, self);
          objc_msgSend(v78, "future");
          v85 = (void *)objc_claimAutoreleasedReturnValue();
          v86 = MEMORY[0x1E0C809B0];
          v136[0] = MEMORY[0x1E0C809B0];
          v136[1] = 3221225472;
          v136[2] = __86__HMBCloudZone_Push__pushGroupWithBlockRow_tuples_options_activity_completionPromise___block_invoke;
          v136[3] = &unk_1E8932C98;
          objc_copyWeak(v139, (id *)buf);
          v87 = v112;
          v137 = v87;
          v139[1] = (id)a3;
          v88 = v108;
          v138 = v88;
          v89 = (id)objc_msgSend(v85, "addFailureBlock:", v136);

          objc_msgSend(v78, "future");
          v90 = (void *)objc_claimAutoreleasedReturnValue();
          v128[0] = v86;
          v128[1] = 3221225472;
          v128[2] = __86__HMBCloudZone_Push__pushGroupWithBlockRow_tuples_options_activity_completionPromise___block_invoke_10;
          v128[3] = &unk_1E8932D10;
          objc_copyWeak(v135, (id *)buf);
          v129 = v87;
          v130 = v115;
          v131 = v104;
          v132 = v71;
          v135[1] = (id)a3;
          v133 = v105;
          v134 = v88;
          v91 = (id)objc_msgSend(v90, "addSuccessBlock:", v128);

          objc_destroyWeak(v135);
          objc_destroyWeak(v139);
          objc_destroyWeak((id *)buf);
        }
        else
        {
          v92 = (void *)MEMORY[0x1D17B6230]();
          v93 = self;
          HMFGetOSLogHandle();
          v94 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v94, OS_LOG_TYPE_DEFAULT))
          {
            HMFGetLogIdentifier();
            v95 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v112, "identifier");
            v96 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v96, "shortDescription");
            v97 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v153 = v95;
            v154 = 2114;
            v155 = (unint64_t)v97;
            _os_log_impl(&dword_1CCD48000, v94, OS_LOG_TYPE_DEFAULT, "%{public}@[%{public}@] No valid records to push; aborting",
              buf,
              0x16u);

          }
          objc_autoreleasePoolPop(v92);
          objc_msgSend(v71, "markGroupAsSentWithOutputBlock:tuples:", a3, obj);
          v78 = (id)objc_claimAutoreleasedReturnValue();
          if (v78)
          {
            v98 = (void *)MEMORY[0x1D17B6230]();
            v99 = v93;
            HMFGetOSLogHandle();
            v100 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v100, OS_LOG_TYPE_ERROR))
            {
              HMFGetLogIdentifier();
              v101 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v112, "identifier");
              v102 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v102, "shortDescription");
              v103 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138544130;
              v153 = v101;
              v154 = 2114;
              v155 = (unint64_t)v103;
              v156 = 2048;
              v157 = a3;
              v158 = 2112;
              v159 = v78;
              _os_log_impl(&dword_1CCD48000, v100, OS_LOG_TYPE_ERROR, "%{public}@[%{public}@] Abort update for block %lu failed with error: %@", buf, 0x2Au);

            }
            objc_autoreleasePoolPop(v98);
          }
          objc_msgSend(v108, "finishWithNoResult");
        }

        goto LABEL_71;
      }
    }
  }
  v67 = (void *)MEMORY[0x1D17B6230]();
  v68 = self;
  HMFGetOSLogHandle();
  v69 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v69, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v153 = v70;
    v154 = 2048;
    v155 = a3;
    _os_log_impl(&dword_1CCD48000, v69, OS_LOG_TYPE_ERROR, "%{public}@Failed to push group with output block row %lu: Model container is nil", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v67);
  objc_msgSend(MEMORY[0x1E0CB35C8], "hmfErrorWithCode:reason:", 8, CFSTR("Model container is nil"));
  v122 = (HMBCloudZoneEncodingContext *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v108, "finishWithError:", v122);
LABEL_71:

}

- (id)_triggerOutputForOutputRow:(unint64_t)a3 options:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  HMBCloudZone *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  HMBFutureOperation *v16;
  HMBFutureOperation *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  _QWORD v23[5];
  id v24;
  unint64_t v25;
  uint8_t buf[4];
  void *v27;
  __int16 v28;
  unint64_t v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  os_unfair_lock_lock_with_options();
  -[HMBCloudZone inProgressPushFuturesByOutputBlockRow](self, "inProgressPushFuturesByOutputBlockRow");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", v8);
  v9 = (id)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    os_unfair_lock_unlock(&self->_propertyLock);
    v10 = (void *)MEMORY[0x1D17B6230]();
    v11 = self;
    HMFGetOSLogHandle();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v27 = v13;
      v28 = 2048;
      v29 = a3;
      _os_log_impl(&dword_1CCD48000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@Ignoring push request for block row %lu. Appears to be in-progress.", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v10);
  }
  else
  {
    v9 = objc_alloc_init(MEMORY[0x1E0D519C0]);
    -[HMBCloudZone inProgressPushFuturesByOutputBlockRow](self, "inProgressPushFuturesByOutputBlockRow");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setObject:forKeyedSubscript:", v9, v15);

    os_unfair_lock_unlock(&self->_propertyLock);
    v16 = [HMBFutureOperation alloc];
    v23[0] = MEMORY[0x1E0C809B0];
    v23[1] = 3221225472;
    v23[2] = __57__HMBCloudZone_Push___triggerOutputForOutputRow_options___block_invoke;
    v23[3] = &unk_1E8932D38;
    v23[4] = self;
    v25 = a3;
    v24 = v6;
    v17 = -[HMBFutureOperation initWithBlock:](v16, "initWithBlock:", v23);
    -[HMBCloudZone recordOperationQueue](self, "recordOperationQueue");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "addOperation:", v17);

    -[HMBFutureOperation future](v17, "future");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "completionHandlerAdapter");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = (id)objc_msgSend(v19, "addCompletionBlock:", v20);

  }
  return v9;
}

id __57__HMBCloudZone_Push___triggerOutputForOutputRow_options___block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  id v20;
  NSObject *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  id v29;
  NSObject *v30;
  _BOOL4 v31;
  void *v32;
  void *v33;
  uint64_t v34;
  void *v35;
  void *v36;
  id v37;
  NSObject *v38;
  void *v39;
  void *v40;
  uint64_t v41;
  void *v42;
  HMBCloudZonePushResult *v43;
  void *v44;
  void *v46;
  id v47;
  NSObject *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *contexta;
  void *context;
  void *contextb;
  void *contextc;
  void *v61;
  id v62;
  id v63;
  _QWORD v64[4];
  id v65;
  uint64_t v66;
  uint8_t buf[4];
  void *v68;
  __int16 v69;
  uint64_t v70;
  __int16 v71;
  uint64_t v72;
  __int16 v73;
  id v74;
  __int16 v75;
  uint64_t v76;
  uint64_t v77;

  v77 = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc_init(MEMORY[0x1E0D519D8]);
  v3 = *(void **)(a1 + 32);
  v6 = a1 + 40;
  v4 = *(void **)(a1 + 40);
  v5 = *(_QWORD *)(v6 + 8);
  v7 = v3;
  v8 = v4;
  v9 = v2;
  objc_msgSend(v9, "future");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v64[0] = MEMORY[0x1E0C809B0];
  v64[1] = 3221225472;
  v64[2] = ____performCloudPush_block_invoke;
  v64[3] = &unk_1E8932DD8;
  v11 = v7;
  v65 = v11;
  v66 = v5;
  v12 = (id)objc_msgSend(v10, "addCompletionBlock:", v64);

  v13 = objc_alloc(MEMORY[0x1E0D28540]);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "__performCloudPush");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_msgSend(v13, "initWithName:", v14);

  objc_msgSend(v11, "localZone");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v16;
  if (v16)
  {
    v61 = v15;
    if (v8)
    {
      v18 = 0;
      goto LABEL_8;
    }
    v63 = 0;
    objc_msgSend(v16, "fetchOptionsForOutputBlock:error:", v5, &v63);
    v8 = (id)objc_claimAutoreleasedReturnValue();
    v18 = v63;
    if (v8)
    {
LABEL_8:
      v26 = v18;
      v62 = v18;
      objc_msgSend(v17, "fetchRecordsForOutputBlock:error:", v5, &v62);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = v62;

      if (v27)
      {
        v28 = objc_msgSend(v27, "count");
        context = (void *)MEMORY[0x1D17B6230]();
        v29 = v11;
        HMFGetOSLogHandle();
        v30 = objc_claimAutoreleasedReturnValue();
        v31 = os_log_type_enabled(v30, OS_LOG_TYPE_INFO);
        if (v28)
        {
          if (v31)
          {
            HMFGetLogIdentifier();
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v61, "identifier");
            v55 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v55, "shortDescription");
            v52 = v17;
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            v34 = objc_msgSend(v27, "count");
            *(_DWORD *)buf = 138544386;
            v68 = v32;
            v69 = 2114;
            v70 = (uint64_t)v33;
            v71 = 2048;
            v72 = v5;
            v73 = 2112;
            v74 = v8;
            v75 = 2048;
            v76 = v34;
            _os_log_impl(&dword_1CCD48000, v30, OS_LOG_TYPE_INFO, "%{public}@[%{public}@] Starting cloud push for output block row: %lu options: %@ tuples count: %lu", buf, 0x34u);

            v17 = v52;
          }

          objc_autoreleasePoolPop(context);
          v35 = v29;
          v15 = v61;
          objc_msgSend(v35, "pushGroupWithBlockRow:tuples:options:activity:completionPromise:", v5, v27, v8, v61, v9);
          goto LABEL_20;
        }
        if (v31)
        {
          HMFGetLogIdentifier();
          v54 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v61, "identifier");
          v56 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v56, "shortDescription");
          v41 = objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          v68 = v54;
          v69 = 2114;
          v70 = v41;
          v42 = (void *)v41;
          v71 = 2048;
          v72 = v5;
          _os_log_impl(&dword_1CCD48000, v30, OS_LOG_TYPE_INFO, "%{public}@[%{public}@] Skipping cloud push for output block row %lu because no tuples were found", buf, 0x20u);

        }
        objc_autoreleasePoolPop(context);
        objc_msgSend(v17, "removeOutputBlockWithRow:error:", v5, 0);
        v43 = objc_alloc_init(HMBCloudZonePushResult);
        objc_msgSend(v9, "finishWithResult:", v43);

      }
      else
      {
        v36 = (void *)MEMORY[0x1D17B6230]();
        v37 = v11;
        HMFGetOSLogHandle();
        v38 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v61, "identifier");
          v53 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v53, "shortDescription");
          contextb = v36;
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138544130;
          v68 = v39;
          v69 = 2114;
          v70 = (uint64_t)v40;
          v71 = 2048;
          v72 = v5;
          v73 = 2112;
          v74 = v18;
          _os_log_impl(&dword_1CCD48000, v38, OS_LOG_TYPE_ERROR, "%{public}@[%{public}@] Unable to fetch tuples for output block row %lu: %@", buf, 0x2Au);

          v36 = contextb;
          v27 = 0;
        }

        objc_autoreleasePoolPop(v36);
        objc_msgSend(v17, "removeOutputBlockWithRow:error:", v5, 0);
        objc_msgSend(v9, "finishWithError:", v18);
      }
      v15 = v61;
LABEL_20:

      goto LABEL_21;
    }
    v46 = (void *)MEMORY[0x1D17B6230]();
    v47 = v11;
    HMFGetOSLogHandle();
    v48 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      contextc = v46;
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "identifier");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v50, "shortDescription");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      v68 = v49;
      v69 = 2114;
      v70 = (uint64_t)v51;
      v71 = 2048;
      v72 = v5;
      v73 = 2112;
      v74 = v18;
      _os_log_impl(&dword_1CCD48000, v48, OS_LOG_TYPE_ERROR, "%{public}@[%{public}@] Unable to fetch options for output block row %lu: %@", buf, 0x2Au);

      v15 = v61;
      v46 = contextc;
    }

    objc_autoreleasePoolPop(v46);
    objc_msgSend(v17, "removeOutputBlockWithRow:error:", v5, 0);
    if (!v18)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "hmfErrorWithCode:", 2);
      v18 = (id)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v9, "finishWithError:", v18);
    v8 = 0;
  }
  else
  {
    v19 = (void *)MEMORY[0x1D17B6230]();
    v20 = v11;
    HMFGetOSLogHandle();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "identifier");
      contexta = v8;
      v23 = v15;
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "shortDescription");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v68 = v22;
      v69 = 2114;
      v70 = (uint64_t)v25;
      _os_log_impl(&dword_1CCD48000, v21, OS_LOG_TYPE_ERROR, "%{public}@[%{public}@] No local zone available to perform cloud push", buf, 0x16u);

      v15 = v23;
      v8 = contexta;

    }
    objc_autoreleasePoolPop(v19);
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmfErrorWithCode:", 15);
    v18 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "finishWithError:", v18);
  }
LABEL_21:

  objc_msgSend(v9, "future");
  v44 = (void *)objc_claimAutoreleasedReturnValue();

  return v44;
}

void __86__HMBCloudZone_Push__pushGroupWithBlockRow_tuples_options_activity_completionPromise___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  int v12;
  void *v13;
  __int16 v14;
  void *v15;
  __int16 v16;
  uint64_t v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v5 = (void *)MEMORY[0x1D17B6230]();
  v6 = WeakRetained;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "identifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "shortDescription");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = *(_QWORD *)(a1 + 56);
    v12 = 138544130;
    v13 = v8;
    v14 = 2114;
    v15 = v10;
    v16 = 2048;
    v17 = v11;
    v18 = 2112;
    v19 = v3;
    _os_log_impl(&dword_1CCD48000, v7, OS_LOG_TYPE_ERROR, "%{public}@[%{public}@] Unable to complete push for row %lu: %@", (uint8_t *)&v12, 0x2Au);

  }
  objc_autoreleasePoolPop(v5);
  objc_msgSend(*(id *)(a1 + 32), "invalidate");
  objc_msgSend(*(id *)(a1 + 40), "finishWithError:", v3);

}

void __86__HMBCloudZone_Push__pushGroupWithBlockRow_tuples_options_activity_completionPromise___block_invoke_10(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t (*v11)(uint64_t, uint64_t);
  void *v12;
  uint64_t i;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  os_unfair_lock_s *v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  int v28;
  void *v29;
  id v30;
  NSObject *v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t (*v35)(uint64_t, uint64_t);
  void *v36;
  id v37;
  NSObject *v38;
  void *v39;
  void *v40;
  void *v41;
  uint64_t (*v42)(uint64_t, uint64_t);
  void *v43;
  id v44;
  NSObject *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  int v50;
  void *v51;
  os_unfair_lock_s *v52;
  NSObject *v53;
  void *v54;
  void *v55;
  void *v56;
  uint64_t (*v57)(uint64_t, uint64_t);
  void *v58;
  void *v59;
  void *v60;
  uint64_t j;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  int v68;
  void *v69;
  id v70;
  NSObject *v71;
  NSObject *v72;
  void *v73;
  void *v74;
  uint64_t (*v75)(uint64_t, uint64_t);
  void *v76;
  void *v77;
  id v78;
  NSObject *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  uint64_t (*v85)(uint64_t, uint64_t);
  void *v86;
  void *v87;
  void *v88;
  uint64_t v89;
  void *v90;
  uint64_t (*v91)(uint64_t, uint64_t);
  void *v92;
  id v93;
  NSObject *v94;
  void *v95;
  void *v96;
  void *v97;
  BOOL v98;
  void *v99;
  id v100;
  NSObject *v101;
  _BOOL4 v102;
  void *v103;
  void *v104;
  void *v105;
  uint64_t v106;
  void *v107;
  void *v108;
  void *v109;
  HMBCloudZonePushResult *v110;
  void *v111;
  uint64_t v112;
  id v113;
  id v114;
  void *v115;
  id v116;
  void *v117;
  void *v118;
  void *v119;
  void *v120;
  id *from;
  void *v122;
  void *v123;
  void *v124;
  void *v125;
  void *v126;
  id obj;
  id obja;
  uint64_t v129;
  uint64_t v130;
  uint64_t v131;
  uint64_t v132;
  uint64_t v133;
  id context;
  void *contexta;
  void *v136;
  id v137;
  void *v138;
  void *v139;
  id WeakRetained;
  _QWORD v141[4];
  id v142;
  id v143;
  _QWORD v144[4];
  id v145;
  id v146;
  id v147;
  __int128 v148;
  __int128 v149;
  __int128 v150;
  __int128 v151;
  id v152;
  id v153;
  __int128 v154;
  __int128 v155;
  __int128 v156;
  __int128 v157;
  _QWORD v158[5];
  _BYTE v159[128];
  uint8_t v160[128];
  _BYTE buf[24];
  uint64_t (*v162)(uint64_t, uint64_t);
  __int128 v163;
  uint64_t v164;

  v164 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v133 = a1;
  from = (id *)(a1 + 80);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 80));
  v122 = v3;
  objc_msgSend(v3, "fatalError");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    v156 = 0u;
    v157 = 0u;
    v154 = 0u;
    v155 = 0u;
    objc_msgSend(v122, "updatedRecords");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v131 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v154, v160, 16);
    if (!v131)
      goto LABEL_35;
    v129 = *(_QWORD *)v155;
    while (1)
    {
      for (i = 0; i != v131; ++i)
      {
        if (*(_QWORD *)v155 != v129)
          objc_enumerationMutation(obj);
        v14 = *(void **)(*((_QWORD *)&v154 + 1) + 8 * i);
        v153 = 0;
        objc_msgSend(v14, "externalID:", &v153);
        v138 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = v153;
        v16 = v15;
        if (v138)
        {
          v152 = v15;
          objc_msgSend(v14, "externalData:", &v152);
          v136 = (void *)objc_claimAutoreleasedReturnValue();
          context = v152;

          if (v136)
          {
            v17 = *(void **)(v133 + 40);
            objc_msgSend(v14, "recordID");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v17, "objectForKey:", v18);
            v19 = (void *)objc_claimAutoreleasedReturnValue();

            if (v19)
            {
              objc_msgSend(v19, "model");
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              v21 = (os_unfair_lock_s *)WeakRetained;
              v22 = v20;
              v23 = (void *)objc_opt_class();
              os_unfair_lock_lock_with_options();
              *(_QWORD *)buf = 0;
              *(_QWORD *)&buf[8] = buf;
              *(_QWORD *)&buf[16] = 0x3032000000;
              v162 = __Block_byref_object_copy__5001;
              *(_QWORD *)&v163 = __Block_byref_object_dispose__5002;
              -[os_unfair_lock_s modelClassToRequiresPostProcessingMap](v21, "modelClassToRequiresPostProcessingMap");
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v24, "objectForKey:", v23);
              *((_QWORD *)&v163 + 1) = objc_claimAutoreleasedReturnValue();

              v25 = *(void **)(*(_QWORD *)&buf[8] + 40);
              if (!v25)
              {
                *(_QWORD *)(*(_QWORD *)&buf[8] + 40) = MEMORY[0x1E0C9AAA0];
                objc_msgSend(v23, "hmbProperties");
                v26 = (void *)objc_claimAutoreleasedReturnValue();
                v158[0] = MEMORY[0x1E0C809B0];
                v158[1] = 3221225472;
                v158[2] = ____modelRequiresPostProcessing_block_invoke;
                v158[3] = &unk_1E8932DB0;
                v158[4] = buf;
                objc_msgSend(v26, "enumerateKeysAndObjectsUsingBlock:", v158);
                -[os_unfair_lock_s modelClassToRequiresPostProcessingMap](v21, "modelClassToRequiresPostProcessingMap");
                v27 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v27, "setObject:forKey:", *(_QWORD *)(*(_QWORD *)&buf[8] + 40), v23);

                v25 = *(void **)(*(_QWORD *)&buf[8] + 40);
              }
              v28 = objc_msgSend(v25, "BOOLValue");
              _Block_object_dispose(buf, 8);

              os_unfair_lock_unlock(v21 + 2);
              if (v28)
              {

                goto LABEL_27;
              }
              objc_msgSend(v19, "model");
              v49 = (void *)objc_claimAutoreleasedReturnValue();
              v50 = -[os_unfair_lock_s isInternalModel:](v21, "isInternalModel:", v49);

              if (v50)
              {
LABEL_27:
                v51 = (void *)MEMORY[0x1D17B6230]();
                v52 = v21;
                HMFGetOSLogHandle();
                v53 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v53, OS_LOG_TYPE_DEBUG))
                {
                  HMFGetLogIdentifier();
                  v54 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(*(id *)(v133 + 32), "identifier");
                  v55 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v55, "shortDescription");
                  v56 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v14, "hmbDescription");
                  v57 = (uint64_t (*)(uint64_t, uint64_t))objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 138543874;
                  *(_QWORD *)&buf[4] = v54;
                  *(_WORD *)&buf[12] = 2114;
                  *(_QWORD *)&buf[14] = v56;
                  *(_WORD *)&buf[22] = 2112;
                  v162 = v57;
                  _os_log_impl(&dword_1CCD48000, v53, OS_LOG_TYPE_DEBUG, "%{public}@[%{public}@] Queueing record for post-processing: %@", buf, 0x20u);

                }
                objc_autoreleasePoolPop(v51);
                objc_msgSend(*(id *)(v133 + 48), "addObject:", v14);
              }
              objc_msgSend(v19, "setExternalID:", v138);
              objc_msgSend(v19, "setExternalData:", v136);
              v58 = *(void **)(v133 + 32);
              objc_msgSend(v14, "hmbDescription");
              v59 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v58, "markWithFormat:", CFSTR("updating record %@"), v59);

            }
            else
            {
              v43 = (void *)MEMORY[0x1D17B6230]();
              v44 = WeakRetained;
              HMFGetOSLogHandle();
              v45 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
              {
                HMFGetLogIdentifier();
                v46 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(*(id *)(v133 + 32), "identifier");
                v47 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v47, "shortDescription");
                v48 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138543874;
                *(_QWORD *)&buf[4] = v46;
                *(_WORD *)&buf[12] = 2114;
                *(_QWORD *)&buf[14] = v48;
                *(_WORD *)&buf[22] = 2112;
                v162 = (uint64_t (*)(uint64_t, uint64_t))v14;
                _os_log_impl(&dword_1CCD48000, v45, OS_LOG_TYPE_ERROR, "%{public}@[%{public}@] Received unexpected updated record: %@", buf, 0x20u);

              }
              objc_autoreleasePoolPop(v43);
            }

          }
          else
          {
            v36 = (void *)MEMORY[0x1D17B6230]();
            v37 = WeakRetained;
            HMFGetOSLogHandle();
            v38 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
            {
              HMFGetLogIdentifier();
              v39 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(*(id *)(v133 + 32), "identifier");
              v40 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v40, "shortDescription");
              v41 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v14, "hmbDescription");
              v42 = (uint64_t (*)(uint64_t, uint64_t))objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138544130;
              *(_QWORD *)&buf[4] = v39;
              *(_WORD *)&buf[12] = 2114;
              *(_QWORD *)&buf[14] = v41;
              *(_WORD *)&buf[22] = 2112;
              v162 = v42;
              LOWORD(v163) = 2112;
              *(_QWORD *)((char *)&v163 + 2) = context;
              _os_log_impl(&dword_1CCD48000, v38, OS_LOG_TYPE_ERROR, "%{public}@[%{public}@] Failed to encode externalData for %@: %@", buf, 0x2Au);

            }
            objc_autoreleasePoolPop(v36);
          }

          v16 = context;
          goto LABEL_33;
        }
        v29 = (void *)MEMORY[0x1D17B6230]();
        v30 = WeakRetained;
        HMFGetOSLogHandle();
        v31 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(v133 + 32), "identifier");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v33, "shortDescription");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "hmbDescription");
          v35 = (uint64_t (*)(uint64_t, uint64_t))objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138544130;
          *(_QWORD *)&buf[4] = v32;
          *(_WORD *)&buf[12] = 2114;
          *(_QWORD *)&buf[14] = v34;
          *(_WORD *)&buf[22] = 2112;
          v162 = v35;
          LOWORD(v163) = 2112;
          *(_QWORD *)((char *)&v163 + 2) = v16;
          _os_log_impl(&dword_1CCD48000, v31, OS_LOG_TYPE_ERROR, "%{public}@[%{public}@] Failed to encode externalID for %@: %@", buf, 0x2Au);

        }
        objc_autoreleasePoolPop(v29);
LABEL_33:

      }
      v131 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v154, v160, 16);
      if (!v131)
        goto LABEL_35;
    }
  }
  v5 = (void *)MEMORY[0x1D17B6230]();
  v6 = WeakRetained;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(v133 + 32), "identifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "shortDescription");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v122, "fatalError");
    v11 = (uint64_t (*)(uint64_t, uint64_t))objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    *(_QWORD *)&buf[4] = v8;
    *(_WORD *)&buf[12] = 2114;
    *(_QWORD *)&buf[14] = v10;
    *(_WORD *)&buf[22] = 2112;
    v162 = v11;
    _os_log_impl(&dword_1CCD48000, v7, OS_LOG_TYPE_ERROR, "%{public}@[%{public}@] Cloud push chunk failed: %@", buf, 0x20u);

  }
  objc_autoreleasePoolPop(v5);
  v12 = *(void **)(v133 + 32);
  objc_msgSend(v122, "fatalError");
  obj = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "markWithFormat:", CFSTR("cloud push chunk failed: %@"), obj);
LABEL_35:

  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(*(id *)(v133 + 48), "count"));
  v123 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E20], "setWithCapacity:", objc_msgSend(*(id *)(v133 + 48), "count"));
  v124 = (void *)objc_claimAutoreleasedReturnValue();
  v150 = 0u;
  v151 = 0u;
  v148 = 0u;
  v149 = 0u;
  obja = *(id *)(v133 + 48);
  v132 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v148, v159, 16);
  if (v132)
  {
    v60 = 0;
    v130 = *(_QWORD *)v149;
    do
    {
      for (j = 0; j != v132; ++j)
      {
        if (*(_QWORD *)v149 != v130)
          objc_enumerationMutation(obja);
        v62 = *(void **)(*((_QWORD *)&v148 + 1) + 8 * j);
        contexta = (void *)MEMORY[0x1D17B6230]();
        v63 = *(void **)(v133 + 40);
        objc_msgSend(v62, "recordID");
        v64 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v63, "objectForKeyedSubscript:", v64);
        v65 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v65, "model");
        v139 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v139, "hmbSetExternalRecordFields");
        v66 = (void *)objc_claimAutoreleasedReturnValue();
        v147 = v60;
        objc_msgSend(WeakRetained, "decodeModelFromRecord:externalRecordFields:source:error:", v62, v66, 1, &v147);
        v67 = (void *)objc_claimAutoreleasedReturnValue();
        v137 = v147;

        if (v67)
        {
          v68 = objc_msgSend(WeakRetained, "isInternalModel:", v67);
          v69 = (void *)MEMORY[0x1D17B6230]();
          v70 = WeakRetained;
          HMFGetOSLogHandle();
          v71 = objc_claimAutoreleasedReturnValue();
          v72 = v71;
          if (v68)
          {
            if (os_log_type_enabled(v71, OS_LOG_TYPE_INFO))
            {
              HMFGetLogIdentifier();
              v125 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(*(id *)(v133 + 32), "identifier");
              v73 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v73, "shortDescription");
              v74 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v67, "hmbDescription");
              v75 = (uint64_t (*)(uint64_t, uint64_t))objc_claimAutoreleasedReturnValue();
              objc_msgSend(v62, "hmbDescription");
              v76 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138544130;
              *(_QWORD *)&buf[4] = v125;
              *(_WORD *)&buf[12] = 2114;
              *(_QWORD *)&buf[14] = v74;
              *(_WORD *)&buf[22] = 2112;
              v162 = v75;
              LOWORD(v163) = 2112;
              *(_QWORD *)((char *)&v163 + 2) = v76;
              _os_log_impl(&dword_1CCD48000, v72, OS_LOG_TYPE_INFO, "%{public}@[%{public}@] Queueing internal model: %@ %@", buf, 0x2Au);

            }
            objc_autoreleasePoolPop(v69);
            objc_msgSend(v123, "addObject:", v67);
          }
          else
          {
            if (os_log_type_enabled(v71, OS_LOG_TYPE_DEBUG))
            {
              HMFGetLogIdentifier();
              v126 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(*(id *)(v133 + 32), "identifier");
              v83 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v83, "shortDescription");
              v84 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v67, "hmbDescription");
              v85 = (uint64_t (*)(uint64_t, uint64_t))objc_claimAutoreleasedReturnValue();
              objc_msgSend(v62, "hmbDescription");
              v86 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138544130;
              *(_QWORD *)&buf[4] = v126;
              *(_WORD *)&buf[12] = 2114;
              *(_QWORD *)&buf[14] = v84;
              *(_WORD *)&buf[22] = 2112;
              v162 = v85;
              LOWORD(v163) = 2112;
              *(_QWORD *)((char *)&v163 + 2) = v86;
              _os_log_impl(&dword_1CCD48000, v72, OS_LOG_TYPE_DEBUG, "%{public}@[%{public}@] Queueing model for post-processing: %@ %@", buf, 0x2Au);

            }
            objc_autoreleasePoolPop(v69);
            objc_msgSend(v124, "addObject:", v67);
          }
        }
        else
        {
          v77 = (void *)MEMORY[0x1D17B6230]();
          v78 = WeakRetained;
          HMFGetOSLogHandle();
          v79 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v79, OS_LOG_TYPE_ERROR))
          {
            HMFGetLogIdentifier();
            v80 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(*(id *)(v133 + 32), "identifier");
            v81 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v81, "shortDescription");
            v82 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138544130;
            *(_QWORD *)&buf[4] = v80;
            *(_WORD *)&buf[12] = 2114;
            *(_QWORD *)&buf[14] = v82;
            *(_WORD *)&buf[22] = 2112;
            v162 = (uint64_t (*)(uint64_t, uint64_t))v62;
            LOWORD(v163) = 2112;
            *(_QWORD *)((char *)&v163 + 2) = v137;
            _os_log_impl(&dword_1CCD48000, v79, OS_LOG_TYPE_ERROR, "%{public}@[%{public}@] Unable to decode internal record %@: %@", buf, 0x2Au);

          }
          objc_autoreleasePoolPop(v77);
        }

        objc_autoreleasePoolPop(contexta);
        v60 = v137;
      }
      v132 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v148, v159, 16);
      v60 = v137;
    }
    while (v132);
  }
  else
  {
    v60 = 0;
  }
  v87 = v60;

  objc_msgSend(WeakRetained, "handleUpdatedInternalModels:", v123);
  v88 = *(void **)(v133 + 56);
  v89 = *(_QWORD *)(v133 + 88);
  objc_msgSend(*(id *)(v133 + 40), "allValues");
  v90 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v88, "markGroupAsSentWithOutputBlock:tuples:", v89, v90);
  v91 = (uint64_t (*)(uint64_t, uint64_t))objc_claimAutoreleasedReturnValue();

  if (v91)
  {
    v92 = (void *)MEMORY[0x1D17B6230]();
    v93 = WeakRetained;
    HMFGetOSLogHandle();
    v94 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v94, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v95 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(v133 + 32), "identifier");
      v96 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v96, "shortDescription");
      v97 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      *(_QWORD *)&buf[4] = v95;
      *(_WORD *)&buf[12] = 2114;
      *(_QWORD *)&buf[14] = v97;
      *(_WORD *)&buf[22] = 2112;
      v162 = v91;
      _os_log_impl(&dword_1CCD48000, v94, OS_LOG_TYPE_ERROR, "%{public}@[%{public}@] Failed to mark records as pushed: %@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v92);
    objc_msgSend(*(id *)(v133 + 32), "markWithFormat:", CFSTR("push mark as completed failed: %@"), v91);
  }
  v98 = objc_msgSend(v124, "count") == 0;
  v99 = (void *)MEMORY[0x1D17B6230]();
  v100 = WeakRetained;
  HMFGetOSLogHandle();
  v101 = objc_claimAutoreleasedReturnValue();
  v102 = os_log_type_enabled(v101, OS_LOG_TYPE_INFO);
  if (v98)
  {
    if (v102)
    {
      HMFGetLogIdentifier();
      v117 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(v133 + 32), "identifier");
      v118 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v118, "shortDescription");
      v119 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      *(_QWORD *)&buf[4] = v117;
      *(_WORD *)&buf[12] = 2114;
      *(_QWORD *)&buf[14] = v119;
      _os_log_impl(&dword_1CCD48000, v101, OS_LOG_TYPE_INFO, "%{public}@[%{public}@] Nothing to post-process", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v99);
    v120 = *(void **)(v133 + 72);
    v110 = objc_alloc_init(HMBCloudZonePushResult);
    objc_msgSend(v120, "finishWithResult:", v110);
  }
  else
  {
    if (v102)
    {
      HMFGetLogIdentifier();
      v103 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(v133 + 32), "identifier");
      v104 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v104, "shortDescription");
      v105 = (void *)objc_claimAutoreleasedReturnValue();
      v106 = objc_msgSend(v124, "count");
      *(_DWORD *)buf = 138543874;
      *(_QWORD *)&buf[4] = v103;
      *(_WORD *)&buf[12] = 2114;
      *(_QWORD *)&buf[14] = v105;
      *(_WORD *)&buf[22] = 2048;
      v162 = (uint64_t (*)(uint64_t, uint64_t))v106;
      _os_log_impl(&dword_1CCD48000, v101, OS_LOG_TYPE_INFO, "%{public}@[%{public}@] Post-processing %lu models", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v99);
    v107 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(*(id *)(v133 + 64), "label");
    v108 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v107, "stringWithFormat:", CFSTR("Post-process: %@"), v108);
    v109 = (void *)objc_claimAutoreleasedReturnValue();
    +[HMBProcessingOptions optionsWithLabel:](HMBProcessingOptions, "optionsWithLabel:", v109);
    v110 = (HMBCloudZonePushResult *)objc_claimAutoreleasedReturnValue();

    -[HMBCloudZonePushResult setShouldEnqueueMirrorOutput:](v110, "setShouldEnqueueMirrorOutput:", 0);
    objc_msgSend(*(id *)(v133 + 56), "updateModels:options:", v124, v110);
    v111 = (void *)objc_claimAutoreleasedReturnValue();
    v112 = MEMORY[0x1E0C809B0];
    v144[0] = MEMORY[0x1E0C809B0];
    v144[1] = 3221225472;
    v144[2] = __86__HMBCloudZone_Push__pushGroupWithBlockRow_tuples_options_activity_completionPromise___block_invoke_22;
    v144[3] = &unk_1E8932CC0;
    objc_copyWeak(&v146, from);
    v145 = *(id *)(v133 + 32);
    v113 = (id)objc_msgSend(v111, "addFailureBlock:", v144);
    v141[0] = v112;
    v141[1] = 3221225472;
    v141[2] = __86__HMBCloudZone_Push__pushGroupWithBlockRow_tuples_options_activity_completionPromise___block_invoke_23;
    v141[3] = &unk_1E8932CE8;
    objc_copyWeak(&v143, from);
    v142 = *(id *)(v133 + 32);
    v114 = (id)objc_msgSend(v111, "addSuccessBlock:", v141);
    objc_msgSend(*(id *)(v133 + 72), "completionHandlerAdapter");
    v115 = (void *)objc_claimAutoreleasedReturnValue();
    v116 = (id)objc_msgSend(v111, "addCompletionBlock:", v115);

    objc_destroyWeak(&v143);
    objc_destroyWeak(&v146);

  }
}

void __86__HMBCloudZone_Push__pushGroupWithBlockRow_tuples_options_activity_completionPromise___block_invoke_22(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  __int16 v13;
  void *v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v5 = (void *)MEMORY[0x1D17B6230]();
  v6 = WeakRetained;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "identifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "shortDescription");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 138543874;
    v12 = v8;
    v13 = 2114;
    v14 = v10;
    v15 = 2112;
    v16 = v3;
    _os_log_impl(&dword_1CCD48000, v7, OS_LOG_TYPE_ERROR, "%{public}@[%{public}@] Post-processing failed: %@", (uint8_t *)&v11, 0x20u);

  }
  objc_autoreleasePoolPop(v5);

}

void __86__HMBCloudZone_Push__pushGroupWithBlockRow_tuples_options_activity_completionPromise___block_invoke_23(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v5 = (void *)MEMORY[0x1D17B6230]();
  v6 = WeakRetained;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "identifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "shortDescription");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 138543618;
    v12 = v8;
    v13 = 2114;
    v14 = v10;
    _os_log_impl(&dword_1CCD48000, v7, OS_LOG_TYPE_INFO, "%{public}@[%{public}@] Post-processing succeeded", (uint8_t *)&v11, 0x16u);

  }
  objc_autoreleasePoolPop(v5);

}

- (void)initializeShareModels
{
  HMBCloudZone *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  HMBCloudZone *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  HMBCloudZone *v16;
  NSObject *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  HMBCloudZone *v22;
  NSObject *v23;
  _BOOL4 v24;
  void *v25;
  void *v26;
  HMBCloudZone *v27;
  NSObject *v28;
  void *v29;
  void *v30;
  HMBCloudZone *v31;
  NSObject *v32;
  void *v33;
  void *v34;
  HMBCloudZone *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  HMBCloudZone *v43;
  id v44;
  id v45;
  void *v46;
  void *v47;
  void *v48;
  os_unfair_lock_s *v49;
  NSObject *v50;
  void *v51;
  void *v52;
  os_unfair_lock_s *v53;
  id v54;
  void *v55;
  HMBCloudZone *v56;
  NSObject *v57;
  void *v58;
  id v59;
  void *v60;
  id v61;
  _BYTE v62[24];
  void *v63;
  os_unfair_lock_s *v64;
  id v65;
  _BYTE buf[24];
  void *v67;
  id v68;
  HMBCloudZone *v69;
  id v70;
  id v71;
  id v72;
  uint64_t v73;

  v73 = *MEMORY[0x1E0C80C00];
  v2 = self;
  -[HMBCloudZone localZone](v2, "localZone");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[HMBCloudZone stateModelID](v2, "stateModelID");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    *(_QWORD *)v62 = 0;
    objc_msgSend(v3, "fetchModelsWithParentModelID:ofType:error:", v4, objc_opt_class(), v62);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = *(id *)v62;

    if (v5)
    {
      if ((unint64_t)objc_msgSend(v5, "count") >= 2)
      {
        v7 = (void *)MEMORY[0x1D17B6230]();
        v8 = v2;
        HMFGetOSLogHandle();
        v9 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "hmbDescription");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          *(_QWORD *)&buf[4] = v10;
          *(_WORD *)&buf[12] = 2112;
          *(_QWORD *)&buf[14] = v11;
          _os_log_impl(&dword_1CCD48000, v9, OS_LOG_TYPE_ERROR, "%{public}@Unexpectedly found more than one share model: %@", buf, 0x16u);

        }
        objc_autoreleasePoolPop(v7);
        objc_msgSend(v5, "na_map:", &__block_literal_global_86);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "allObjects");
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v3, "remove:", v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        if (v14)
        {
          v15 = (void *)MEMORY[0x1D17B6230]();
          v16 = v8;
          HMFGetOSLogHandle();
          v17 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
          {
            HMFGetLogIdentifier();
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            *(_QWORD *)&buf[4] = v18;
            *(_WORD *)&buf[12] = 2112;
            *(_QWORD *)&buf[14] = v14;
            _os_log_impl(&dword_1CCD48000, v17, OS_LOG_TYPE_ERROR, "%{public}@Failed to remove existing share modelIDs: %@", buf, 0x16u);

          }
          objc_autoreleasePoolPop(v15);
        }
        objc_msgSend(MEMORY[0x1E0C99E60], "set");
        v19 = objc_claimAutoreleasedReturnValue();

        v5 = (void *)v19;
      }
      objc_msgSend(v5, "anyObject");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = (void *)MEMORY[0x1D17B6230]();
      v22 = v2;
      HMFGetOSLogHandle();
      v23 = objc_claimAutoreleasedReturnValue();
      v24 = os_log_type_enabled(v23, OS_LOG_TYPE_INFO);
      if (v20)
      {
        if (v24)
        {
          HMFGetLogIdentifier();
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          *(_QWORD *)&buf[4] = v25;
          *(_WORD *)&buf[12] = 2112;
          *(_QWORD *)&buf[14] = v20;
          _os_log_impl(&dword_1CCD48000, v23, OS_LOG_TYPE_INFO, "%{public}@Fetched existing share model: %@", buf, 0x16u);

        }
      }
      else if (v24)
      {
        HMFGetLogIdentifier();
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        *(_QWORD *)&buf[4] = v34;
        _os_log_impl(&dword_1CCD48000, v23, OS_LOG_TYPE_INFO, "%{public}@Did not find existing share model", buf, 0xCu);

      }
      objc_autoreleasePoolPop(v21);

    }
    else
    {
      v30 = (void *)MEMORY[0x1D17B6230]();
      v31 = v2;
      HMFGetOSLogHandle();
      v32 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        *(_QWORD *)&buf[4] = v33;
        *(_WORD *)&buf[12] = 2112;
        *(_QWORD *)&buf[14] = v6;
        _os_log_impl(&dword_1CCD48000, v32, OS_LOG_TYPE_ERROR, "%{public}@Unable to fetch share models: %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v30);
      v20 = 0;
    }

  }
  else
  {
    v26 = (void *)MEMORY[0x1D17B6230]();
    v27 = v2;
    HMFGetOSLogHandle();
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)&buf[4] = v29;
      _os_log_impl(&dword_1CCD48000, v28, OS_LOG_TYPE_ERROR, "%{public}@Cannot fetch share model because local zone is nil", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v26);
    v20 = 0;
  }

  if (v20)
  {
    v35 = v2;
    v61 = v20;
    -[HMBCloudZone localZone](v35, "localZone");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    if (v36)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99E20], "set");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMBCloudZone stateModelID](v35, "stateModelID");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "queryModelsWithParentModelID:ofType:", v39, objc_opt_class());
      v60 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v61, "share");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "participants");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "na_dictionaryWithKeyGenerator:", &__block_literal_global_88);
      v42 = (void *)objc_claimAutoreleasedReturnValue();

      *(_QWORD *)buf = MEMORY[0x1E0C809B0];
      *(_QWORD *)&buf[8] = 3221225472;
      *(_QWORD *)&buf[16] = ____initializeShareParticipantModels_block_invoke_2;
      v67 = &unk_1E8933348;
      v59 = v42;
      v68 = v59;
      v43 = v35;
      v69 = v43;
      v70 = v36;
      v44 = v38;
      v71 = v44;
      v45 = v37;
      v72 = v45;
      objc_msgSend(v60, "enumerateObjectsUsingBlock:", buf);
      objc_msgSend(v45, "allValues");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v46, "na_map:", &__block_literal_global_92);
      v47 = (void *)objc_claimAutoreleasedReturnValue();

      v48 = (void *)MEMORY[0x1D17B6230]();
      v49 = v43;
      HMFGetOSLogHandle();
      v50 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v50, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)v62 = 138543618;
        *(_QWORD *)&v62[4] = v51;
        *(_WORD *)&v62[12] = 2112;
        *(_QWORD *)&v62[14] = v47;
        _os_log_impl(&dword_1CCD48000, v50, OS_LOG_TYPE_INFO, "%{public}@Initializing with fetched participants: %@", v62, 0x16u);

      }
      objc_autoreleasePoolPop(v48);
      os_unfair_lock_lock_with_options();
      -[os_unfair_lock_s shareParticipantModelsByClientIdentifier](v49, "shareParticipantModelsByClientIdentifier");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v52, "addEntriesFromDictionary:", v45);

      os_unfair_lock_unlock(v49 + 2);
      if (objc_msgSend(v44, "count"))
      {
        *(_QWORD *)v62 = MEMORY[0x1E0C809B0];
        *(_QWORD *)&v62[8] = 3221225472;
        *(_QWORD *)&v62[16] = ____initializeShareParticipantModels_block_invoke_95;
        v63 = &unk_1E8933858;
        v53 = v49;
        v64 = v53;
        v65 = v44;
        v54 = (id)-[os_unfair_lock_s _addShareOperationAfterStartupWithName:block:](v53, "_addShareOperationAfterStartupWithName:block:", CFSTR("Delete extraneous participant models"), v62);

      }
    }
    else
    {
      v55 = (void *)MEMORY[0x1D17B6230]();
      v56 = v35;
      HMFGetOSLogHandle();
      v57 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v57, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        *(_QWORD *)&buf[4] = v58;
        _os_log_impl(&dword_1CCD48000, v57, OS_LOG_TYPE_ERROR, "%{public}@Cannot initialize share participant models because local zone is nil", buf, 0xCu);

      }
      objc_autoreleasePoolPop(v55);
    }

    -[HMBCloudZone handleUpdatedShareModel:](v35, "handleUpdatedShareModel:", v61);
  }

}

- (BOOL)handleUpdatedShare:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  HMBCloudZone *v9;
  NSObject *v10;
  void *v11;
  int v13;
  void *v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  -[HMBCloudZone decodeShareModelFromShare:](self, "decodeShareModelFromShare:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    -[HMBCloudZone handleUpdatedShareModel:](self, "handleUpdatedShareModel:", v7);
  }
  else
  {
    v8 = (void *)MEMORY[0x1D17B6230]();
    v9 = self;
    HMFGetOSLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 138543618;
      v14 = v11;
      v15 = 2112;
      v16 = v6;
      _os_log_impl(&dword_1CCD48000, v10, OS_LOG_TYPE_ERROR, "%{public}@Unable to decode share model from share %@", (uint8_t *)&v13, 0x16u);

    }
    objc_autoreleasePoolPop(v8);
    if (a4)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "hmfErrorWithCode:", 15);
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
  }

  return v7 != 0;
}

- (BOOL)handleUpdatedShareParticipantRecord:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  id v8;
  id v9;
  char isKindOfClass;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  HMBCloudZone *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  HMBCloudZone *v19;
  NSObject *v20;
  void *v21;
  void *v23;
  id v24;
  uint8_t buf[4];
  void *v26;
  __int16 v27;
  id v28;
  __int16 v29;
  id v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v24 = 0;
  -[HMBCloudZone decodeModelFromRecord:externalRecordFields:source:error:](self, "decodeModelFromRecord:externalRecordFields:source:error:", v6, 0, 2, &v24);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v24;
  if (v7)
  {
    v9 = v7;
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();
    if ((isKindOfClass & 1) != 0)
      v11 = v9;
    else
      v11 = 0;
    v12 = v11;

    if ((isKindOfClass & 1) != 0)
    {
      objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v9);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMBCloudZone handleUpdatedShareParticipantModels:](self, "handleUpdatedShareParticipantModels:", v13);

    }
    else
    {
      v18 = (void *)MEMORY[0x1D17B6230]();
      v19 = self;
      HMFGetOSLogHandle();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v23 = v18;
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v26 = v21;
        v27 = 2112;
        v28 = v9;
        _os_log_impl(&dword_1CCD48000, v20, OS_LOG_TYPE_ERROR, "%{public}@Decoded model was not a HMBCloudZoneShareParticipantModel: %@", buf, 0x16u);

        v18 = v23;
      }

      objc_autoreleasePoolPop(v18);
      if (a4)
      {
        objc_msgSend(MEMORY[0x1E0CB35C8], "hmfErrorWithCode:", 15);
        *a4 = (id)objc_claimAutoreleasedReturnValue();
      }
    }

  }
  else
  {
    v14 = (void *)MEMORY[0x1D17B6230]();
    v15 = self;
    HMFGetOSLogHandle();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v26 = v17;
      v27 = 2112;
      v28 = v6;
      v29 = 2112;
      v30 = v8;
      _os_log_impl(&dword_1CCD48000, v16, OS_LOG_TYPE_ERROR, "%{public}@Unable to decode model from share participant record %@: %@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v14);
    isKindOfClass = 0;
    if (a4)
      *a4 = objc_retainAutorelease(v8);
  }

  return isKindOfClass & 1;
}

- (void)handleUpdatedShareModel:(id)a3
{
  void *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  char v20;
  void *v21;
  HMBCloudZone *v22;
  NSObject *v23;
  void *v24;
  HMBShareParticipant *v25;
  void *v26;
  HMBShareParticipant *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  HMBCloudZone *v33;
  NSObject *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  HMBCloudZone *v42;
  NSObject *v43;
  void *v44;
  void *v45;
  id v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t j;
  void *v50;
  void *v51;
  id v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t k;
  void *v56;
  void *v57;
  os_unfair_lock_s *lock;
  id v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  id obj;
  void *v65;
  HMBCloudZone *v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  _BYTE v79[128];
  uint8_t v80[128];
  uint8_t buf[4];
  void *v82;
  __int16 v83;
  void *v84;
  __int16 v85;
  void *v86;
  _BYTE v87[128];
  uint64_t v88;

  v88 = *MEMORY[0x1E0C80C00];
  v59 = a3;
  v4 = (void *)MEMORY[0x1D17B6230]();
  v66 = self;
  HMFGetOSLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v59, "share");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v82 = v6;
    v83 = 2112;
    v84 = v7;
    _os_log_impl(&dword_1CCD48000, v5, OS_LOG_TYPE_INFO, "%{public}@Handling updated share: %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v4);
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  lock = &v66->_propertyLock;
  os_unfair_lock_lock_with_options();
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithObject:", v59);
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v59, "share");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "participants");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "na_dictionaryWithKeyGenerator:", &__block_literal_global_5586);
  v65 = (void *)objc_claimAutoreleasedReturnValue();

  v77 = 0u;
  v78 = 0u;
  v75 = 0u;
  v76 = 0u;
  -[HMBCloudZone shareParticipantModelsByClientIdentifier](v66, "shareParticipantModelsByClientIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "allValues");
  obj = (id)objc_claimAutoreleasedReturnValue();

  v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v75, v87, 16);
  if (v11)
  {
    v12 = *(_QWORD *)v76;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v76 != v12)
          objc_enumerationMutation(obj);
        v14 = *(void **)(*((_QWORD *)&v75 + 1) + 8 * i);
        objc_msgSend(v14, "participant", lock);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "ckShareParticipant");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "participantID");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v65, "objectForKeyedSubscript:", v17);
        v18 = (void *)objc_claimAutoreleasedReturnValue();

        if (v18)
        {
          objc_msgSend(v15, "ckShareParticipant");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = objc_msgSend(v19, "hmbIsEqualToParticipant:", v18);

          if ((v20 & 1) == 0)
          {
            v21 = (void *)MEMORY[0x1D17B6230]();
            v22 = v66;
            HMFGetOSLogHandle();
            v23 = (id)objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
            {
              HMFGetLogIdentifier();
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543874;
              v82 = v24;
              v83 = 2112;
              v84 = v15;
              v85 = 2112;
              v86 = v18;
              _os_log_impl(&dword_1CCD48000, v23, OS_LOG_TYPE_INFO, "%{public}@Updating CKShareParticipant on participant %@ to %@", buf, 0x20u);

            }
            objc_autoreleasePoolPop(v21);
            v25 = [HMBShareParticipant alloc];
            objc_msgSend(v15, "clientIdentifier");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            v27 = -[HMBShareParticipant initWithCKShareParticipant:clientIdentifier:](v25, "initWithCKShareParticipant:clientIdentifier:", v18, v26);

            if (!-[HMBShareParticipant hasAccepted](v27, "hasAccepted"))
            {
              objc_msgSend(v15, "pendingInvitation");
              v28 = (void *)objc_claimAutoreleasedReturnValue();
              -[HMBShareParticipant setPendingInvitation:](v27, "setPendingInvitation:", v28);

            }
            v29 = (void *)objc_msgSend(v14, "copy");
            objc_msgSend(v29, "setParticipant:", v27);
            -[HMBCloudZone shareParticipantModelsByClientIdentifier](v22, "shareParticipantModelsByClientIdentifier");
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v15, "clientIdentifier");
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v30, "setObject:forKeyedSubscript:", v29, v31);

            objc_msgSend(v61, "addObject:", v29);
            objc_msgSend(v60, "addObject:", v29);

          }
        }
        else
        {
          v32 = (void *)MEMORY[0x1D17B6230]();
          v33 = v66;
          HMFGetOSLogHandle();
          v34 = (id)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
          {
            HMFGetLogIdentifier();
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v82 = v35;
            v83 = 2112;
            v84 = v15;
            _os_log_impl(&dword_1CCD48000, v34, OS_LOG_TYPE_INFO, "%{public}@Removing participant that is no longer on share: %@", buf, 0x16u);

          }
          objc_autoreleasePoolPop(v32);
          -[HMBCloudZone shareParticipantModelsByClientIdentifier](v33, "shareParticipantModelsByClientIdentifier");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "clientIdentifier");
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v36, "setObject:forKeyedSubscript:", 0, v37);

          objc_msgSend(v14, "hmbModelID");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v63, "addObject:", v38);

          objc_msgSend(v62, "addObject:", v14);
        }

      }
      v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v75, v87, 16);
    }
    while (v11);
  }

  -[HMBCloudZone setShareModel:](v66, "setShareModel:", v59);
  -[HMBCloudZone localZone](v66, "localZone");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "update:remove:", v61, v63);
  v40 = (void *)objc_claimAutoreleasedReturnValue();

  if (v40)
  {
    v41 = (void *)MEMORY[0x1D17B6230]();
    v42 = v66;
    HMFGetOSLogHandle();
    v43 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v82 = v44;
      v83 = 2112;
      v84 = v40;
      _os_log_impl(&dword_1CCD48000, v43, OS_LOG_TYPE_ERROR, "%{public}@Failed to update/remove share models: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v41);
  }

  os_unfair_lock_unlock(lock);
  -[HMBCloudZone delegate](v66, "delegate");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v73 = 0u;
    v74 = 0u;
    v71 = 0u;
    v72 = 0u;
    v46 = v60;
    v47 = objc_msgSend(v46, "countByEnumeratingWithState:objects:count:", &v71, v80, 16);
    if (v47)
    {
      v48 = *(_QWORD *)v72;
      do
      {
        for (j = 0; j != v47; ++j)
        {
          if (*(_QWORD *)v72 != v48)
            objc_enumerationMutation(v46);
          objc_msgSend(*(id *)(*((_QWORD *)&v71 + 1) + 8 * j), "participant", lock);
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v50, "clientIdentifier");
          v51 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v45, "cloudZone:didUpdateParticipantWithClientIdentifier:", v66, v51);

        }
        v47 = objc_msgSend(v46, "countByEnumeratingWithState:objects:count:", &v71, v80, 16);
      }
      while (v47);
    }

  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v69 = 0u;
    v70 = 0u;
    v67 = 0u;
    v68 = 0u;
    v52 = v62;
    v53 = objc_msgSend(v52, "countByEnumeratingWithState:objects:count:", &v67, v79, 16);
    if (v53)
    {
      v54 = *(_QWORD *)v68;
      do
      {
        for (k = 0; k != v53; ++k)
        {
          if (*(_QWORD *)v68 != v54)
            objc_enumerationMutation(v52);
          objc_msgSend(*(id *)(*((_QWORD *)&v67 + 1) + 8 * k), "participant", lock);
          v56 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v56, "clientIdentifier");
          v57 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v45, "cloudZone:didRemoveParticipantWithClientIdentifier:", v66, v57);

        }
        v53 = objc_msgSend(v52, "countByEnumeratingWithState:objects:count:", &v67, v79, 16);
      }
      while (v53);
    }

  }
}

- (void)handleUpdatedShareParticipantModels:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  void *v8;
  HMBCloudZone *v9;
  NSObject *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  char v19;
  void *v20;
  HMBCloudZone *v21;
  NSObject *v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  HMBCloudZone *v29;
  NSObject *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  HMBCloudZone *v38;
  NSObject *v39;
  void *v40;
  os_unfair_lock_t lock;
  void *v42;
  id obj;
  uint64_t v44;
  HMBCloudZone *v45;
  uint64_t v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  void *v51;
  uint8_t buf[4];
  id v53;
  __int16 v54;
  void *v55;
  __int16 v56;
  void *v57;
  _BYTE v58[128];
  uint64_t v59;

  v59 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  lock = &self->_propertyLock;
  os_unfair_lock_lock_with_options();
  v45 = self;
  -[HMBCloudZone localZone](self, "localZone");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v49 = 0u;
  v50 = 0u;
  v47 = 0u;
  v48 = 0u;
  obj = v4;
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v47, v58, 16);
  if (v5)
  {
    v44 = *(_QWORD *)v48;
    do
    {
      v46 = v5;
      for (i = 0; i != v46; ++i)
      {
        if (*(_QWORD *)v48 != v44)
          objc_enumerationMutation(obj);
        v7 = *(void **)(*((_QWORD *)&v47 + 1) + 8 * i);
        v8 = (void *)MEMORY[0x1D17B6230]();
        v9 = v45;
        HMFGetOSLogHandle();
        v10 = (id)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v11 = (id)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "participant");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v53 = v11;
          v54 = 2112;
          v55 = v12;
          _os_log_impl(&dword_1CCD48000, v10, OS_LOG_TYPE_INFO, "%{public}@Handling updated share participant: %@", buf, 0x16u);

        }
        objc_autoreleasePoolPop(v8);
        objc_msgSend(v7, "participant");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "clientIdentifier");
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        -[HMBCloudZone shareParticipantModelsByClientIdentifier](v9, "shareParticipantModelsByClientIdentifier");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "objectForKeyedSubscript:", v14);
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        if (v16)
        {
          objc_msgSend(v16, "hmbModelID");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "hmbModelID");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = objc_msgSend(v17, "isEqual:", v18);

          if ((v19 & 1) == 0)
          {
            v20 = (void *)MEMORY[0x1D17B6230]();
            v21 = v9;
            HMFGetOSLogHandle();
            v22 = (id)objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
            {
              HMFGetLogIdentifier();
              v23 = (id)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v14, "UUIDString");
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543874;
              v53 = v23;
              v54 = 2112;
              v55 = v24;
              v56 = 2112;
              v57 = v16;
              _os_log_impl(&dword_1CCD48000, v22, OS_LOG_TYPE_INFO, "%{public}@Removing existing share participant model with client identifier %@ because it has a different model ID: %@", buf, 0x20u);

            }
            objc_autoreleasePoolPop(v20);
            objc_msgSend(v16, "hmbModelID");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            v51 = v25;
            objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v51, 1);
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v42, "remove:", v26);
            v27 = (void *)objc_claimAutoreleasedReturnValue();

            if (v27)
            {
              v28 = (void *)MEMORY[0x1D17B6230]();
              v29 = v21;
              HMFGetOSLogHandle();
              v30 = (id)objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
              {
                HMFGetLogIdentifier();
                v31 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138543618;
                v53 = v31;
                v54 = 2112;
                v55 = v27;
                _os_log_impl(&dword_1CCD48000, v30, OS_LOG_TYPE_ERROR, "%{public}@Failed to remove existing share participant model: %@", buf, 0x16u);

              }
              objc_autoreleasePoolPop(v28);
            }

          }
        }
        -[HMBCloudZone shareParticipantModelsByClientIdentifier](v9, "shareParticipantModelsByClientIdentifier");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "participant");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "clientIdentifier");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "setObject:forKeyedSubscript:", v7, v34);

      }
      v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v47, v58, 16);
    }
    while (v5);
  }

  objc_msgSend(obj, "allObjects");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "update:", v35);
  v36 = (void *)objc_claimAutoreleasedReturnValue();

  if (v36)
  {
    v37 = (void *)MEMORY[0x1D17B6230]();
    v38 = v45;
    HMFGetOSLogHandle();
    v39 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v53 = v40;
      v54 = 2112;
      v55 = v36;
      _os_log_impl(&dword_1CCD48000, v39, OS_LOG_TYPE_ERROR, "%{public}@Failed to update share participant models: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v37);
  }

  os_unfair_lock_unlock(lock);
}

- (id)createShareModel
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __48__HMBCloudZone_Share_Internal__createShareModel__block_invoke;
  v3[3] = &unk_1E8932FF8;
  v3[4] = self;
  -[HMBCloudZone _addShareOperationAfterStartupWithName:block:](self, "_addShareOperationAfterStartupWithName:block:", CFSTR("Create Share Model"), v3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)_createShareModel
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v8;
  HMBCloudZone *v9;
  NSObject *v10;
  void *v11;
  HMBCloudZoneShareModel *v12;
  void *v13;
  void *v14;
  HMBCloudZoneShareModel *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  int v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  -[HMBCloudZone shareModel](self, "shareModel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[HMBCloudZone shareModel](self, "shareModel");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMBCloudZone encodeShareModel:](self, "encodeShareModel:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0D519C0], "futureWithResult:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    return v6;
  }
  else
  {
    v8 = (void *)MEMORY[0x1D17B6230]();
    v9 = self;
    HMFGetOSLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = 138543362;
      v24 = v11;
      _os_log_impl(&dword_1CCD48000, v10, OS_LOG_TYPE_INFO, "%{public}@Creating share model", (uint8_t *)&v23, 0xCu);

    }
    objc_autoreleasePoolPop(v8);
    v12 = [HMBCloudZoneShareModel alloc];
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMBCloudZone stateModelID](v9, "stateModelID");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = -[HMBModel initWithModelID:parentModelID:](v12, "initWithModelID:parentModelID:", v13, v14);

    v16 = objc_alloc(MEMORY[0x1E0C95110]);
    -[HMBCloudZone cloudZoneID](v9, "cloudZoneID");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "zoneID");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = (void *)objc_msgSend(v16, "initWithRecordZoneID:", v18);
    -[HMBCloudZoneShareModel setShare:](v15, "setShare:", v19);

    -[HMBCloudZoneShareModel share](v15, "share");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setParticipantVisibility:", 2);

    -[HMBCloudZone encodeShareModel:](v9, "encodeShareModel:", v15);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMBCloudZone _pushUpdatedShare:](v9, "_pushUpdatedShare:", v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    return v22;
  }
}

- (id)leaveCloudShareRequestingNewInvitationToken:(BOOL)a3
{
  _QWORD v4[5];
  BOOL v5;

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __76__HMBCloudZone_Share_Internal__leaveCloudShareRequestingNewInvitationToken___block_invoke;
  v4[3] = &unk_1E8933020;
  v4[4] = self;
  v5 = a3;
  -[HMBCloudZone _addShareOperationAfterStartupWithName:block:](self, "_addShareOperationAfterStartupWithName:block:", CFSTR("Leave Cloud Share"), v4);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)_leaveCloudShareRequestingNewInvitationToken:(BOOL)a3 allowCloudPull:(BOOL)a4
{
  _BOOL8 v5;
  void *v7;
  HMBCloudZone *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t *v17;
  void *v18;
  HMBCloudZone *v19;
  NSObject *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  id (*v29)(uint64_t, void *);
  void *v30;
  HMBCloudZone *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t (*v34)(uint64_t);
  void *v35;
  HMBCloudZone *v36;
  uint64_t v37;
  void *v38;
  uint8_t buf[4];
  void *v40;
  uint64_t v41;

  v5 = a3;
  v41 = *MEMORY[0x1E0C80C00];
  v7 = (void *)MEMORY[0x1D17B6230](self, a2);
  v8 = self;
  HMFGetOSLogHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v40 = v10;
    _os_log_impl(&dword_1CCD48000, v9, OS_LOG_TYPE_INFO, "%{public}@Leaving cloud share", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v7);
  -[HMBCloudZone shareModel](v8, "shareModel");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "share");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "recordID");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    v38 = v13;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v38, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMBCloudZone pushRecordsToUpdate:recordIDsToRemove:configuration:rollbackEnabled:needsNewInvitationToken:](v8, "pushRecordsToUpdate:recordIDsToRemove:configuration:rollbackEnabled:needsNewInvitationToken:", 0, v14, 0, 0, v5);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v15;
    v27 = MEMORY[0x1E0C809B0];
    v28 = 3221225472;
    v29 = __92__HMBCloudZone_Share_Internal___leaveCloudShareRequestingNewInvitationToken_allowCloudPull___block_invoke_2;
    v30 = &unk_1E8933070;
    v31 = v8;
    v17 = &v27;
LABEL_9:
    objc_msgSend(v15, "flatMap:", v17, v27, v28, v29, v30, v31, v32, v33, v34, v35, v36, v37);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_10;
  }
  v18 = (void *)MEMORY[0x1D17B6230]();
  v19 = v8;
  HMFGetOSLogHandle();
  v20 = objc_claimAutoreleasedReturnValue();
  v21 = v20;
  if (a4)
  {
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v40 = v22;
      _os_log_impl(&dword_1CCD48000, v21, OS_LOG_TYPE_DEFAULT, "%{public}@Could not find a share model. Will attempt to find one by re-fetching all records", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v18);
    +[HMBProcessingOptions optionsWithLabel:](HMBProcessingOptions, "optionsWithLabel:", CFSTR("Full re-fetch for missing share model"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMBCloudZone performFullCloudPullWithOptions:](v19, "performFullCloudPullWithOptions:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v15;
    v32 = MEMORY[0x1E0C809B0];
    v33 = 3221225472;
    v34 = __92__HMBCloudZone_Share_Internal___leaveCloudShareRequestingNewInvitationToken_allowCloudPull___block_invoke;
    v35 = &unk_1E8933048;
    v36 = v19;
    LOBYTE(v37) = v5;
    v17 = &v32;
    goto LABEL_9;
  }
  if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v40 = v25;
    _os_log_impl(&dword_1CCD48000, v21, OS_LOG_TYPE_ERROR, "%{public}@Cannot leave cloud share because no share model was found", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v18);
  v26 = (void *)MEMORY[0x1E0D519C0];
  objc_msgSend(MEMORY[0x1E0CB35C8], "hmfErrorWithCode:", 5);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "futureWithError:", v14);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_10:

  return v23;
}

- (id)_addShareOperationWithName:(id)a3 block:(id)a4
{
  id v6;
  id v7;
  HMBShareOperation *v8;
  void *v9;
  HMBCloudZone *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  int v16;
  void *v17;
  __int16 v18;
  id v19;
  __int16 v20;
  HMBShareOperation *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = -[HMBShareOperation initWithCloudZone:block:]([HMBShareOperation alloc], "initWithCloudZone:block:", self, v7);
  v9 = (void *)MEMORY[0x1D17B6230](-[HMBShareOperation setName:](v8, "setName:", v6));
  v10 = self;
  HMFGetOSLogHandle();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 138543874;
    v17 = v12;
    v18 = 2112;
    v19 = v6;
    v20 = 2112;
    v21 = v8;
    _os_log_impl(&dword_1CCD48000, v11, OS_LOG_TYPE_INFO, "%{public}@Adding %@ share operation: %@", (uint8_t *)&v16, 0x20u);

  }
  objc_autoreleasePoolPop(v9);
  -[HMBCloudZone shareOperationQueue](v10, "shareOperationQueue");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "addOperation:", v8);

  -[HMBFutureOperation future](v8, "future");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (id)_addShareOperationAfterStartupWithName:(id)a3 block:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  _QWORD v13[5];
  id v14;
  id v15;

  v6 = a3;
  v7 = a4;
  -[HMBCloudZone startUp](self, "startUp");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __77__HMBCloudZone_Share_Internal___addShareOperationAfterStartupWithName_block___block_invoke;
  v13[3] = &unk_1E8933098;
  v13[4] = self;
  v14 = v6;
  v15 = v7;
  v9 = v7;
  v10 = v6;
  objc_msgSend(v8, "flatMap:", v13);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)_pushUpdatedShare:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[5];
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  v11[0] = a3;
  v4 = (void *)MEMORY[0x1E0C99D20];
  v5 = a3;
  objc_msgSend(v4, "arrayWithObjects:count:", v11, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMBCloudZone pushRecordsToUpdate:recordIDsToRemove:configuration:rollbackEnabled:](self, "pushRecordsToUpdate:recordIDsToRemove:configuration:rollbackEnabled:", v6, 0, 0, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __50__HMBCloudZone_Share_Internal___pushUpdatedShare___block_invoke;
  v10[3] = &unk_1E8933070;
  v10[4] = self;
  objc_msgSend(v7, "flatMap:", v10);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)_pushUpdatedShare:(id)a3 participantRecord:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  _QWORD v14[4];
  id v15;
  id v16;
  HMBCloudZone *v17;
  _QWORD v18[3];

  v18[2] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v18[0] = v6;
  v18[1] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMBCloudZone pushRecordsToUpdate:recordIDsToRemove:configuration:rollbackEnabled:](self, "pushRecordsToUpdate:recordIDsToRemove:configuration:rollbackEnabled:", v8, MEMORY[0x1E0C9AA60], 0, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __68__HMBCloudZone_Share_Internal___pushUpdatedShare_participantRecord___block_invoke;
  v14[3] = &unk_1E89330E8;
  v15 = v6;
  v16 = v7;
  v17 = self;
  v10 = v7;
  v11 = v6;
  objc_msgSend(v9, "flatMap:", v14);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (id)_pushDeletedParticipantRecordIDs:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  _QWORD v10[4];
  id v11;
  HMBCloudZone *v12;

  v4 = a3;
  objc_msgSend(v4, "allObjects");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMBCloudZone pushRecordsToUpdate:recordIDsToRemove:configuration:rollbackEnabled:](self, "pushRecordsToUpdate:recordIDsToRemove:configuration:rollbackEnabled:", MEMORY[0x1E0C9AA60], v5, 0, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __65__HMBCloudZone_Share_Internal___pushDeletedParticipantRecordIDs___block_invoke;
  v10[3] = &unk_1E8933110;
  v11 = v4;
  v12 = self;
  v7 = v4;
  objc_msgSend(v6, "flatMap:", v10);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

id __65__HMBCloudZone_Share_Internal___pushDeletedParticipantRecordIDs___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  int v16;
  void *v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "deletedRecordIDs");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");
  v6 = objc_msgSend(*(id *)(a1 + 32), "count");

  if (v5 == v6)
  {
    objc_msgSend(MEMORY[0x1E0D519C0], "futureWithNoResult");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v3, "fatalError");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      v9 = (void *)MEMORY[0x1D17B6230]();
      v10 = *(id *)(a1 + 40);
      HMFGetOSLogHandle();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = 138543618;
        v17 = v12;
        v18 = 2112;
        v19 = v8;
        _os_log_impl(&dword_1CCD48000, v11, OS_LOG_TYPE_ERROR, "%{public}@Failed to delete share participant records: %@", (uint8_t *)&v16, 0x16u);

      }
      objc_autoreleasePoolPop(v9);
      v13 = (void *)MEMORY[0x1E0D519C0];
      objc_msgSend(MEMORY[0x1E0CB35C8], "hmfErrorWithCode:", 15);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "futureWithError:", v14);
      v7 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      objc_msgSend(MEMORY[0x1E0D519C0], "futureWithNoResult");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }

  }
  return v7;
}

id __68__HMBCloudZone_Share_Internal___pushUpdatedShare_participantRecord___block_invoke(id *a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  char v13;
  id v14;
  id v15;
  char v16;
  id v17;
  void *v18;
  uint64_t v19;
  void *v20;
  id v21;
  NSObject *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  id v32;
  id v33;
  _QWORD v34[4];
  id v35;
  _QWORD v36[4];
  id v37;
  uint8_t buf[4];
  void *v39;
  __int16 v40;
  void *v41;
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "updatedRecords");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x1E0C809B0];
  v36[0] = MEMORY[0x1E0C809B0];
  v36[1] = 3221225472;
  v36[2] = __68__HMBCloudZone_Share_Internal___pushUpdatedShare_participantRecord___block_invoke_2;
  v36[3] = &unk_1E89330C0;
  v37 = a1[4];
  objc_msgSend(v4, "na_firstObjectPassingTest:", v36);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = v6;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v8 = v7;
  else
    v8 = 0;
  v9 = v8;

  objc_msgSend(v3, "updatedRecords");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v34[0] = v5;
  v34[1] = 3221225472;
  v34[2] = __68__HMBCloudZone_Share_Internal___pushUpdatedShare_participantRecord___block_invoke_3;
  v34[3] = &unk_1E89330C0;
  v35 = a1[5];
  objc_msgSend(v10, "na_firstObjectPassingTest:", v34);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9 || !v11)
  {
    objc_msgSend(v3, "conflicts");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "count");

    v20 = (void *)MEMORY[0x1D17B6230]();
    v21 = a1[6];
    HMFGetOSLogHandle();
    v22 = objc_claimAutoreleasedReturnValue();
    v23 = v22;
    if (v19)
    {
      if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v39 = v24;
        _os_log_impl(&dword_1CCD48000, v23, OS_LOG_TYPE_INFO, "%{public}@Hit conflict when pushing share and share participant record; retrying operation",
          buf,
          0xCu);

      }
      objc_autoreleasePoolPop(v20);
      v25 = (void *)MEMORY[0x1E0D519C0];
      objc_msgSend(MEMORY[0x1E0CB35C8], "hmbRetryShareOperationError");
      v26 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "fatalError");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v39 = v28;
        v40 = 2112;
        v41 = v29;
        _os_log_impl(&dword_1CCD48000, v23, OS_LOG_TYPE_ERROR, "%{public}@Failed to push share and share participant record: %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v20);
      v25 = (void *)MEMORY[0x1E0D519C0];
      objc_msgSend(MEMORY[0x1E0CB35C8], "hmfErrorWithCode:", 15);
      v26 = objc_claimAutoreleasedReturnValue();
    }
    v14 = (id)v26;
    v27 = v25;
    goto LABEL_18;
  }
  v12 = a1[6];
  v33 = 0;
  v13 = objc_msgSend(v12, "handleUpdatedShareParticipantRecord:error:", v11, &v33);
  v14 = v33;
  if ((v13 & 1) == 0)
  {
    v27 = (void *)MEMORY[0x1E0D519C0];
LABEL_18:
    objc_msgSend(v27, "futureWithError:", v14);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_21;
  }
  v15 = a1[6];
  v32 = v14;
  v16 = objc_msgSend(v15, "handleUpdatedShare:error:", v9, &v32);
  v17 = v32;

  if ((v16 & 1) != 0)
    objc_msgSend(MEMORY[0x1E0D519C0], "futureWithResult:", v9);
  else
    objc_msgSend(MEMORY[0x1E0D519C0], "futureWithError:", v17);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v17;
LABEL_21:

  return v30;
}

uint64_t __68__HMBCloudZone_Share_Internal___pushUpdatedShare_participantRecord___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;

  objc_msgSend(a2, "recordID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "recordID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "isEqual:", v4);

  return v5;
}

uint64_t __68__HMBCloudZone_Share_Internal___pushUpdatedShare_participantRecord___block_invoke_3(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;

  objc_msgSend(a2, "recordID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "recordID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "isEqual:", v4);

  return v5;
}

id __50__HMBCloudZone_Share_Internal___pushUpdatedShare___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  char v9;
  id v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  id v16;
  NSObject *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  id v26;
  uint8_t buf[4];
  void *v28;
  __int16 v29;
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "updatedRecords");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "anyObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v6 = v5;
  else
    v6 = 0;
  v7 = v6;

  if (!v7)
  {
    objc_msgSend(v3, "conflicts");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "count");

    v15 = (void *)MEMORY[0x1D17B6230]();
    v16 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = v17;
    if (v14)
    {
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v28 = v19;
        _os_log_impl(&dword_1CCD48000, v18, OS_LOG_TYPE_INFO, "%{public}@Hit conflict when pushing share; retrying operation",
          buf,
          0xCu);

      }
      objc_autoreleasePoolPop(v15);
      v20 = (void *)MEMORY[0x1E0D519C0];
      objc_msgSend(MEMORY[0x1E0CB35C8], "hmbRetryShareOperationError");
      v21 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "fatalError");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v28 = v22;
        v29 = 2112;
        v30 = v23;
        _os_log_impl(&dword_1CCD48000, v18, OS_LOG_TYPE_ERROR, "%{public}@Failed to push share: %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v15);
      v20 = (void *)MEMORY[0x1E0D519C0];
      objc_msgSend(MEMORY[0x1E0CB35C8], "hmfErrorWithCode:", 15);
      v21 = objc_claimAutoreleasedReturnValue();
    }
    v10 = (id)v21;
    v11 = v20;
    goto LABEL_15;
  }
  v8 = *(void **)(a1 + 32);
  v26 = 0;
  v9 = objc_msgSend(v8, "handleUpdatedShare:error:", v7, &v26);
  v10 = v26;
  v11 = (void *)MEMORY[0x1E0D519C0];
  if ((v9 & 1) == 0)
  {
LABEL_15:
    objc_msgSend(v11, "futureWithError:", v10);
    v12 = objc_claimAutoreleasedReturnValue();
    goto LABEL_16;
  }
  objc_msgSend(MEMORY[0x1E0D519C0], "futureWithResult:", v7);
  v12 = objc_claimAutoreleasedReturnValue();
LABEL_16:
  v24 = (void *)v12;

  return v24;
}

uint64_t __77__HMBCloudZone_Share_Internal___addShareOperationAfterStartupWithName_block___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_addShareOperationWithName:block:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

uint64_t __92__HMBCloudZone_Share_Internal___leaveCloudShareRequestingNewInvitationToken_allowCloudPull___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_leaveCloudShareRequestingNewInvitationToken:allowCloudPull:", *(unsigned __int8 *)(a1 + 40), 0);
}

id __92__HMBCloudZone_Share_Internal___leaveCloudShareRequestingNewInvitationToken_allowCloudPull___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  id v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  const char *v12;
  NSObject *v13;
  uint32_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  int v19;
  void *v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "fatalError");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (!v4)
  {
    v7 = (void *)MEMORY[0x1D17B6230]();
    v8 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = 138543618;
      v20 = v11;
      v21 = 2112;
      v22 = v3;
      v12 = "%{public}@Successfully pushed changes for leaving cloud share with result: %@";
      v13 = v10;
      v14 = 22;
      goto LABEL_7;
    }
LABEL_8:

    objc_autoreleasePoolPop(v7);
    objc_msgSend(MEMORY[0x1E0D519C0], "futureWithNoResult");
    v15 = objc_claimAutoreleasedReturnValue();
    goto LABEL_12;
  }
  v6 = objc_msgSend(v4, "hmbIsCKZoneDeletedError");
  v7 = (void *)MEMORY[0x1D17B6230]();
  v8 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v6)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = 138543362;
      v20 = v11;
      v12 = "%{public}@Received zone deleted error when leaving cloud share";
      v13 = v10;
      v14 = 12;
LABEL_7:
      _os_log_impl(&dword_1CCD48000, v13, OS_LOG_TYPE_INFO, v12, (uint8_t *)&v19, v14);

      goto LABEL_8;
    }
    goto LABEL_8;
  }
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = 138543618;
    v20 = v16;
    v21 = 2112;
    v22 = v5;
    _os_log_impl(&dword_1CCD48000, v10, OS_LOG_TYPE_ERROR, "%{public}@Failed to push changes for leaving cloud share: %@", (uint8_t *)&v19, 0x16u);

  }
  objc_autoreleasePoolPop(v7);
  objc_msgSend(MEMORY[0x1E0D519C0], "futureWithError:", v5);
  v15 = objc_claimAutoreleasedReturnValue();
LABEL_12:
  v17 = (void *)v15;

  return v17;
}

uint64_t __76__HMBCloudZone_Share_Internal__leaveCloudShareRequestingNewInvitationToken___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_leaveCloudShareRequestingNewInvitationToken:allowCloudPull:", *(unsigned __int8 *)(a1 + 40), 1);
}

id __48__HMBCloudZone_Share_Internal__createShareModel__block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "_createShareModel");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "flatMap:", &__block_literal_global_11_5579);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

uint64_t __48__HMBCloudZone_Share_Internal__createShareModel__block_invoke_2()
{
  return objc_msgSend(MEMORY[0x1E0D519C0], "futureWithNoResult");
}

uint64_t __56__HMBCloudZone_Share_Internal__handleUpdatedShareModel___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "participantID");
}

- (id)fetchOwnerParticipantCloudShareID
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __56__HMBCloudZone_Share__fetchOwnerParticipantCloudShareID__block_invoke;
  v3[3] = &unk_1E8932FF8;
  v3[4] = self;
  -[HMBCloudZone _addShareOperationAfterStartupWithName:block:](self, "_addShareOperationAfterStartupWithName:block:", CFSTR("Fetch Owner Participant Cloud Share ID"), v3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)fetchCurrentParticipantCloudShareID
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __58__HMBCloudZone_Share__fetchCurrentParticipantCloudShareID__block_invoke;
  v3[3] = &unk_1E8932FF8;
  v3[4] = self;
  -[HMBCloudZone _addShareOperationAfterStartupWithName:block:](self, "_addShareOperationAfterStartupWithName:block:", CFSTR("Fetch Current Participant Cloud Share ID"), v3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)fetchCloudShareIDForShareParticipantClientIdentifier:(id)a3
{
  id v4;
  id v5;
  void *v6;
  _QWORD v8[5];
  id v9;

  v4 = a3;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __76__HMBCloudZone_Share__fetchCloudShareIDForShareParticipantClientIdentifier___block_invoke;
  v8[3] = &unk_1E8933858;
  v8[4] = self;
  v9 = v4;
  v5 = v4;
  -[HMBCloudZone _addShareOperationAfterStartupWithName:block:](self, "_addShareOperationAfterStartupWithName:block:", CFSTR("Fetch Cloud Share ID For Client Identifier"), v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)fetchInvitationWithContext:(id)a3
{
  id v4;
  id v5;
  void *v6;
  _QWORD v8[5];
  id v9;

  v4 = a3;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __50__HMBCloudZone_Share__fetchInvitationWithContext___block_invoke;
  v8[3] = &unk_1E8933858;
  v8[4] = self;
  v9 = v4;
  v5 = v4;
  -[HMBCloudZone _addShareOperationAfterStartupWithName:block:](self, "_addShareOperationAfterStartupWithName:block:", CFSTR("Fetch Invitation"), v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)_fetchInvitationWithContext:(id)a3 usingShare:(id)a4
{
  id v6;
  void *v7;
  HMBCloudZone *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  BOOL v12;
  void *v13;
  id v14;
  id v15;
  void *v16;
  int v17;
  void *v18;
  HMBCloudZone *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  HMBCloudZone *v26;
  NSObject *v27;
  void *v28;
  void *v29;
  void *v30;
  HMBCloudZone *v31;
  NSObject *v32;
  void *v33;
  HMBCloudZone *v34;
  id v35;
  void *v36;
  void *v37;
  void *v38;
  HMBCloudZone *v39;
  NSObject *v40;
  _BOOL4 v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  uint64_t v47;
  id v48;
  void *v49;
  void *v50;
  id v52;
  _QWORD v53[5];
  _QWORD v54[5];
  id v55;
  _BYTE *v56;
  _QWORD *v57;
  _QWORD v58[4];
  id v59;
  HMBCloudZone *v60;
  id v61;
  _BYTE *v62;
  _QWORD v63[5];
  id v64;
  _QWORD v65[5];
  id v66;
  _BYTE buf[24];
  uint64_t (*v68)(uint64_t, uint64_t);
  void (*v69)(uint64_t);
  id v70;
  uint64_t v71;

  v71 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v52 = a4;
  v7 = (void *)MEMORY[0x1D17B6230]();
  v8 = self;
  HMFGetOSLogHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    *(_QWORD *)&buf[4] = v10;
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v6;
    _os_log_impl(&dword_1CCD48000, v9, OS_LOG_TYPE_INFO, "%{public}@Fetching invitation with context: %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v7);
  -[HMBCloudZone cloudZoneID](v8, "cloudZoneID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "scope") == 2;

  if (v12)
  {
    objc_msgSend(v6, "participantClientIdentifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMBCloudZone participantWithClientIdentifier:](v8, "participantWithClientIdentifier:", v13);
    v14 = (id)objc_claimAutoreleasedReturnValue();

    if (!v14)
      goto LABEL_23;
    v15 = v6;
    objc_msgSend(v14, "ckShareParticipant");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "permission") != 3;

    LODWORD(v16) = objc_msgSend(v15, "shouldGrantWriteAccess");
    if (v17 != (_DWORD)v16)
    {
      if (objc_msgSend(v14, "hasAccepted"))
      {
        v18 = (void *)MEMORY[0x1D17B6230]();
        v19 = v8;
        HMFGetOSLogHandle();
        v20 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          *(_QWORD *)&buf[4] = v21;
          *(_WORD *)&buf[12] = 2112;
          *(_QWORD *)&buf[14] = v14;
          _os_log_impl(&dword_1CCD48000, v20, OS_LOG_TYPE_ERROR, "%{public}@Asked to fetch an invitation for client identifier corresponding to participant that has already accepted: %@", buf, 0x16u);

        }
        objc_autoreleasePoolPop(v18);
        v22 = (void *)MEMORY[0x1E0D519C0];
        objc_msgSend(MEMORY[0x1E0CB35C8], "hmfErrorWithCode:", 1);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "futureWithError:", v23);
        v24 = (void *)objc_claimAutoreleasedReturnValue();

        goto LABEL_24;
      }
      objc_msgSend(v14, "pendingInvitation");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v38 = (void *)MEMORY[0x1D17B6230]();
      v39 = v8;
      HMFGetOSLogHandle();
      v40 = objc_claimAutoreleasedReturnValue();
      v41 = os_log_type_enabled(v40, OS_LOG_TYPE_INFO);
      if (v37)
      {
        if (v41)
        {
          HMFGetLogIdentifier();
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          *(_QWORD *)&buf[4] = v42;
          *(_WORD *)&buf[12] = 2112;
          *(_QWORD *)&buf[14] = v37;
          _os_log_impl(&dword_1CCD48000, v40, OS_LOG_TYPE_INFO, "%{public}@Returning existing pending invitation: %@", buf, 0x16u);

        }
        objc_autoreleasePoolPop(v38);
        objc_msgSend(MEMORY[0x1E0D519C0], "futureWithResult:", v37);
        v24 = (void *)objc_claimAutoreleasedReturnValue();

        goto LABEL_24;
      }
      if (v41)
      {
        HMFGetLogIdentifier();
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        *(_QWORD *)&buf[4] = v43;
        *(_WORD *)&buf[12] = 2112;
        *(_QWORD *)&buf[14] = v14;
        _os_log_impl(&dword_1CCD48000, v40, OS_LOG_TYPE_INFO, "%{public}@Participant already exists that has not accepted but has no pending invitation: %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v38);
LABEL_23:
      *(_QWORD *)buf = 0;
      *(_QWORD *)&buf[8] = buf;
      *(_QWORD *)&buf[16] = 0x3032000000;
      v68 = __Block_byref_object_copy__5635;
      v69 = __Block_byref_object_dispose__5636;
      v70 = 0;
      v63[0] = 0;
      v63[1] = v63;
      v63[2] = 0x3032000000;
      v63[3] = __Block_byref_object_copy__5635;
      v63[4] = __Block_byref_object_dispose__5636;
      v64 = 0;
      -[HMBCloudZone cloudDatabase](v8, "cloudDatabase");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "lookupInfo");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v44, "fetchParticipantWithLookupInfo:", v45);
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      v47 = MEMORY[0x1E0C809B0];
      v58[0] = MEMORY[0x1E0C809B0];
      v58[1] = 3221225472;
      v58[2] = __62__HMBCloudZone_Share___fetchInvitationWithContext_usingShare___block_invoke_57;
      v58[3] = &unk_1E8933188;
      v62 = buf;
      v48 = v6;
      v59 = v48;
      v60 = v8;
      v61 = v52;
      objc_msgSend(v46, "flatMap:", v58);
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      v54[0] = v47;
      v54[1] = 3221225472;
      v54[2] = __62__HMBCloudZone_Share___fetchInvitationWithContext_usingShare___block_invoke_2;
      v54[3] = &unk_1E89331D8;
      v56 = buf;
      v54[4] = v8;
      v57 = v63;
      v55 = v48;
      objc_msgSend(v49, "flatMap:", v54);
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      v53[0] = v47;
      v53[1] = 3221225472;
      v53[2] = __62__HMBCloudZone_Share___fetchInvitationWithContext_usingShare___block_invoke_61;
      v53[3] = &unk_1E8933200;
      v53[4] = v63;
      objc_msgSend(v50, "flatMap:", v53);
      v24 = (void *)objc_claimAutoreleasedReturnValue();

      _Block_object_dispose(v63, 8);
      _Block_object_dispose(buf, 8);

      goto LABEL_24;
    }
    v30 = (void *)MEMORY[0x1D17B6230]();
    v31 = v8;
    HMFGetOSLogHandle();
    v32 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      *(_QWORD *)&buf[4] = v33;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v14;
      *(_WORD *)&buf[22] = 2112;
      v68 = (uint64_t (*)(uint64_t, uint64_t))v15;
      _os_log_impl(&dword_1CCD48000, v32, OS_LOG_TYPE_INFO, "%{public}@Configuring existing participant %@ for the requested invitation context: %@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v30);
    v34 = v31;
    v14 = v14;
    v35 = v52;
    -[HMBCloudZone _setWriteAccessEnabled:forParticipant:usingShare:](v34, "_setWriteAccessEnabled:forParticipant:usingShare:", objc_msgSend(v15, "shouldGrantWriteAccess"), v14, v35);
    v36 = (void *)objc_claimAutoreleasedReturnValue();

    v65[0] = MEMORY[0x1E0C809B0];
    v65[1] = 3221225472;
    v65[2] = __62__HMBCloudZone_Share___fetchInvitationWithContext_usingShare___block_invoke;
    v65[3] = &unk_1E8933160;
    v65[4] = v34;
    v66 = v15;
    objc_msgSend(v36, "flatMap:", v65);
    v24 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v25 = (void *)MEMORY[0x1D17B6230]();
    v26 = v8;
    HMFGetOSLogHandle();
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)&buf[4] = v28;
      _os_log_impl(&dword_1CCD48000, v27, OS_LOG_TYPE_ERROR, "%{public}@Unable to fetch an invitation on non-private zone", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v25);
    v29 = (void *)MEMORY[0x1E0D519C0];
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmfErrorWithCode:", 3);
    v14 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "futureWithError:", v14);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
  }
LABEL_24:

  return v24;
}

- (id)setWriteAccessEnabled:(BOOL)a3 forParticipant:(id)a4
{
  id v6;
  id v7;
  void *v8;
  _QWORD v10[5];
  id v11;
  BOOL v12;

  v6 = a4;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __60__HMBCloudZone_Share__setWriteAccessEnabled_forParticipant___block_invoke;
  v10[3] = &unk_1E8933270;
  v12 = a3;
  v10[4] = self;
  v11 = v6;
  v7 = v6;
  -[HMBCloudZone _addShareOperationAfterStartupWithName:block:](self, "_addShareOperationAfterStartupWithName:block:", CFSTR("Set Write Access Enabled"), v10);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)_setWriteAccessEnabled:(BOOL)a3 forParticipant:(id)a4 usingShare:(id)a5
{
  _BOOL4 v6;
  id v8;
  id v9;
  void *v10;
  HMBCloudZone *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  id v17;
  void *v18;
  uint64_t v19;
  void *v20;
  HMBCloudZone *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  HMBCloudZone *v27;
  NSObject *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  _QWORD v35[5];
  _QWORD v36[4];
  id v37;
  uint8_t buf[4];
  void *v39;
  __int16 v40;
  id v41;
  __int16 v42;
  id v43;
  uint64_t v44;

  v6 = a3;
  v44 = *MEMORY[0x1E0C80C00];
  v8 = a4;
  v9 = a5;
  v10 = (void *)MEMORY[0x1D17B6230]();
  v11 = self;
  HMFGetOSLogHandle();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    HMFBooleanToString();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v39 = v13;
    v40 = 2112;
    v41 = v14;
    v42 = 2112;
    v43 = v8;
    _os_log_impl(&dword_1CCD48000, v12, OS_LOG_TYPE_INFO, "%{public}@Setting write access enabled to %@ for participant: %@", buf, 0x20u);

  }
  objc_autoreleasePoolPop(v10);
  objc_msgSend(v9, "participants");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = MEMORY[0x1E0C809B0];
  v36[0] = MEMORY[0x1E0C809B0];
  v36[1] = 3221225472;
  v36[2] = __72__HMBCloudZone_Share___setWriteAccessEnabled_forParticipant_usingShare___block_invoke;
  v36[3] = &unk_1E8933298;
  v17 = v8;
  v37 = v17;
  objc_msgSend(v15, "na_firstObjectPassingTest:", v36);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v18)
  {
    v26 = (void *)MEMORY[0x1D17B6230]();
    v27 = v11;
    HMFGetOSLogHandle();
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "participants");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v39 = v29;
      v40 = 2112;
      v41 = v17;
      v42 = 2112;
      v43 = v30;
      _os_log_impl(&dword_1CCD48000, v28, OS_LOG_TYPE_ERROR, "%{public}@Could not find CKShareParticipant for participant %@. All CKShareParticipants: %@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v26);
    v31 = (void *)MEMORY[0x1E0D519C0];
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmfErrorWithCode:", 2);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "futureWithError:", v32);
    v33 = objc_claimAutoreleasedReturnValue();
    goto LABEL_15;
  }
  if (v6)
    v19 = 3;
  else
    v19 = 2;
  if (objc_msgSend(v18, "permission") != v19)
  {
    objc_msgSend(v18, "setPermission:", v19);
    -[HMBCloudZone _pushUpdatedShare:](v11, "_pushUpdatedShare:", v9);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v35[0] = v16;
    v35[1] = 3221225472;
    v35[2] = __72__HMBCloudZone_Share___setWriteAccessEnabled_forParticipant_usingShare___block_invoke_65;
    v35[3] = &unk_1E8933138;
    v35[4] = v11;
    objc_msgSend(v32, "flatMap:", v35);
    v33 = objc_claimAutoreleasedReturnValue();
LABEL_15:
    v25 = (void *)v33;

    goto LABEL_16;
  }
  v20 = (void *)MEMORY[0x1D17B6230]();
  v21 = v11;
  HMFGetOSLogHandle();
  v22 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "permission");
    CKStringFromParticipantPermission();
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v39 = v23;
    v40 = 2112;
    v41 = v24;
    _os_log_impl(&dword_1CCD48000, v22, OS_LOG_TYPE_INFO, "%{public}@Not setting write access enabled because participant's permission is already %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v20);
  objc_msgSend(MEMORY[0x1E0D519C0], "futureWithResult:", v9);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_16:

  return v25;
}

- (id)revokeShareAccessForParticipant:(id)a3
{
  id v4;
  id v5;
  void *v6;
  _QWORD v8[5];
  id v9;

  v4 = a3;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __55__HMBCloudZone_Share__revokeShareAccessForParticipant___block_invoke;
  v8[3] = &unk_1E8933858;
  v8[4] = self;
  v9 = v4;
  v5 = v4;
  -[HMBCloudZone _addShareOperationAfterStartupWithName:block:](self, "_addShareOperationAfterStartupWithName:block:", CFSTR("Revoke Share Access"), v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)_revokeShareAccessForParticipant:(id)a3 usingShare:(id)a4
{
  id v6;
  id v7;
  void *v8;
  HMBCloudZone *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  HMBCloudZone *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  _QWORD v26[5];
  _QWORD v27[5];
  id v28;
  uint8_t buf[4];
  void *v30;
  __int16 v31;
  id v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = (void *)MEMORY[0x1D17B6230]();
  v9 = self;
  HMFGetOSLogHandle();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v30 = v11;
    v31 = 2112;
    v32 = v6;
    _os_log_impl(&dword_1CCD48000, v10, OS_LOG_TYPE_INFO, "%{public}@Revoking share access for participant: %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v8);
  os_unfair_lock_lock_with_options();
  -[HMBCloudZone shareParticipantModelsByClientIdentifier](v9, "shareParticipantModelsByClientIdentifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "clientIdentifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "objectForKeyedSubscript:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  os_unfair_lock_unlock(&v9->_propertyLock);
  if (v14)
  {
    objc_msgSend(v6, "ckShareParticipant");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    __removeParticipantFromShare(v9, v15, v7);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = MEMORY[0x1E0C809B0];
    v27[0] = MEMORY[0x1E0C809B0];
    v27[1] = 3221225472;
    v27[2] = __67__HMBCloudZone_Share___revokeShareAccessForParticipant_usingShare___block_invoke;
    v27[3] = &unk_1E8933160;
    v27[4] = v9;
    v28 = v14;
    objc_msgSend(v16, "flatMap:", v27);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v26[0] = v17;
    v26[1] = 3221225472;
    v26[2] = __67__HMBCloudZone_Share___revokeShareAccessForParticipant_usingShare___block_invoke_68;
    v26[3] = &unk_1E89332C0;
    v26[4] = v9;
    objc_msgSend(v18, "addSuccessBlock:", v26);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v20 = (void *)MEMORY[0x1D17B6230]();
    v21 = v9;
    HMFGetOSLogHandle();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v30 = v23;
      v31 = 2112;
      v32 = v6;
      _os_log_impl(&dword_1CCD48000, v22, OS_LOG_TYPE_ERROR, "%{public}@Could not find participant model for participant %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v20);
    v24 = (void *)MEMORY[0x1E0D519C0];
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmfErrorWithCode:", 2);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "futureWithError:", v15);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v19;
}

- (NSSet)participants
{
  void *v3;
  os_unfair_lock_s *p_propertyLock;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  p_propertyLock = &self->_propertyLock;
  os_unfair_lock_lock_with_options();
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  -[HMBCloudZone shareParticipantModelsByClientIdentifier](self, "shareParticipantModelsByClientIdentifier", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "allValues");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v14;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v9), "participant");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "addObject:", v10);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v7);
  }

  os_unfair_lock_unlock(p_propertyLock);
  v11 = (void *)objc_msgSend(v3, "copy");

  return (NSSet *)v11;
}

- (id)participantWithClientIdentifier:(id)a3
{
  id v4;
  os_unfair_lock_s *p_propertyLock;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = a3;
  p_propertyLock = &self->_propertyLock;
  os_unfair_lock_lock_with_options();
  -[HMBCloudZone shareParticipantModelsByClientIdentifier](self, "shareParticipantModelsByClientIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "participant");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v8, "copy");

  os_unfair_lock_unlock(p_propertyLock);
  return v9;
}

id __67__HMBCloudZone_Share___revokeShareAccessForParticipant_usingShare___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = (void *)MEMORY[0x1D17B6230]();
  v5 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 138543362;
    v14 = v7;
    _os_log_impl(&dword_1CCD48000, v6, OS_LOG_TYPE_INFO, "%{public}@Successfully pushed share changes for share access revocation", (uint8_t *)&v13, 0xCu);

  }
  objc_autoreleasePoolPop(v4);
  objc_msgSend(*(id *)(a1 + 32), "recordIDForModel:", *(_QWORD *)(a1 + 40));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "_pushDeletedParticipantRecordIDs:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

void __67__HMBCloudZone_Share___revokeShareAccessForParticipant_usingShare___block_invoke_68(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = (void *)MEMORY[0x1D17B6230]();
  v5 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138543362;
    v9 = v7;
    _os_log_impl(&dword_1CCD48000, v6, OS_LOG_TYPE_INFO, "%{public}@Successfully pushed share participant deletion for share access revocation", (uint8_t *)&v8, 0xCu);

  }
  objc_autoreleasePoolPop(v4);

}

id __55__HMBCloudZone_Share__revokeShareAccessForParticipant___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[5];
  id v7;

  objc_msgSend(*(id *)(a1 + 32), "_createShareModel");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __55__HMBCloudZone_Share__revokeShareAccessForParticipant___block_invoke_2;
  v6[3] = &unk_1E8933160;
  v3 = *(void **)(a1 + 40);
  v6[4] = *(_QWORD *)(a1 + 32);
  v7 = v3;
  objc_msgSend(v2, "flatMap:", v6);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

uint64_t __55__HMBCloudZone_Share__revokeShareAccessForParticipant___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_revokeShareAccessForParticipant:usingShare:", *(_QWORD *)(a1 + 40), a2);
}

uint64_t __72__HMBCloudZone_Share___setWriteAccessEnabled_forParticipant_usingShare___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  uint64_t v5;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "ckShareParticipant");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "isEqual:", v4);

  return v5;
}

id __72__HMBCloudZone_Share___setWriteAccessEnabled_forParticipant_usingShare___block_invoke_65(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  int v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = (void *)MEMORY[0x1D17B6230]();
  v5 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138543362;
    v11 = v7;
    _os_log_impl(&dword_1CCD48000, v6, OS_LOG_TYPE_INFO, "%{public}@Successfully pushed changes for participant write access update", (uint8_t *)&v10, 0xCu);

  }
  objc_autoreleasePoolPop(v4);
  objc_msgSend(MEMORY[0x1E0D519C0], "futureWithResult:", v3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

id __60__HMBCloudZone_Share__setWriteAccessEnabled_forParticipant___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[5];
  id v8;
  char v9;

  objc_msgSend(*(id *)(a1 + 32), "_createShareModel");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[2] = __60__HMBCloudZone_Share__setWriteAccessEnabled_forParticipant___block_invoke_2;
  v7[3] = &unk_1E8933228;
  v3 = *(void **)(a1 + 40);
  v7[4] = *(_QWORD *)(a1 + 32);
  v7[1] = 3221225472;
  v9 = *(_BYTE *)(a1 + 48);
  v8 = v3;
  objc_msgSend(v2, "flatMap:", v7);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "flatMap:", &__block_literal_global_64);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

uint64_t __60__HMBCloudZone_Share__setWriteAccessEnabled_forParticipant___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_setWriteAccessEnabled:forParticipant:usingShare:", *(unsigned __int8 *)(a1 + 48), *(_QWORD *)(a1 + 40), a2);
}

uint64_t __60__HMBCloudZone_Share__setWriteAccessEnabled_forParticipant___block_invoke_3()
{
  return objc_msgSend(MEMORY[0x1E0D519C0], "futureWithNoResult");
}

id __62__HMBCloudZone_Share___fetchInvitationWithContext_usingShare___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  int v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = (void *)MEMORY[0x1D17B6230]();
  v5 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138543362;
    v11 = v7;
    _os_log_impl(&dword_1CCD48000, v6, OS_LOG_TYPE_INFO, "%{public}@Fetching invitation again after configuring participant", (uint8_t *)&v10, 0xCu);

  }
  objc_autoreleasePoolPop(v4);
  objc_msgSend(*(id *)(a1 + 32), "_fetchInvitationWithContext:usingShare:", *(_QWORD *)(a1 + 40), v3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

id __62__HMBCloudZone_Share___fetchInvitationWithContext_usingShare___block_invoke_57(uint64_t a1, void *a2)
{
  id v4;
  uint64_t v5;
  void *v6;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), a2);
  v4 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "shouldGrantWriteAccess"))
    v5 = 3;
  else
    v5 = 2;
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "setPermission:", v5);
  __addParticipantToShare(*(void **)(a1 + 40), *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), *(void **)(a1 + 48));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

id __62__HMBCloudZone_Share___fetchInvitationWithContext_usingShare___block_invoke_2(uint64_t a1, void *a2)
{
  HMBCloudZoneShareParticipantModel *v3;
  void *v4;
  HMBCloudZoneShareParticipantModel *v5;
  void *v6;
  HMBShareInvitation *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;
  NSObject *v16;
  void *v17;
  HMBCloudZoneShareParticipantModel *v18;
  HMBShareParticipant *v19;
  void *v20;
  HMBShareParticipant *v21;
  HMBCloudZoneShareParticipantModel *v22;
  void *v23;
  void *v24;
  HMBCloudZoneShareParticipantModel *v25;
  void *v26;
  void *v27;
  id v28;
  uint64_t v29;
  void *v30;
  id v31;
  NSObject *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  id v37;
  NSObject *v38;
  void *v39;
  void *v40;
  void *v41;
  id v42;
  NSObject *v43;
  void *v44;
  void *v46;
  id v47;
  _QWORD v48[5];
  uint8_t buf[4];
  void *v50;
  __int16 v51;
  HMBCloudZoneShareParticipantModel *v52;
  __int16 v53;
  id v54;
  uint64_t v55;

  v55 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  -[HMBCloudZoneShareParticipantModel participants](v3, "participants");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v48[0] = MEMORY[0x1E0C809B0];
  v48[1] = 3221225472;
  v48[2] = __62__HMBCloudZone_Share___fetchInvitationWithContext_usingShare___block_invoke_3;
  v48[3] = &unk_1E89331B0;
  v48[4] = *(_QWORD *)(a1 + 48);
  objc_msgSend(v4, "na_firstObjectPassingTest:", v48);
  v5 = (HMBCloudZoneShareParticipantModel *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[HMBCloudZoneShareParticipantModel invitationToken](v5, "invitationToken");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      v7 = [HMBShareInvitation alloc];
      -[HMBCloudZoneShareParticipantModel URL](v3, "URL");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = *(_QWORD *)(a1 + 40);
      objc_msgSend(*(id *)(a1 + 32), "cloudZoneID");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = -[HMBShareInvitation initWithURL:token:context:cloudZoneID:](v7, "initWithURL:token:context:cloudZoneID:", v8, v6, v9, v10);
      v12 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
      v13 = *(void **)(v12 + 40);
      *(_QWORD *)(v12 + 40) = v11;

      v14 = (void *)MEMORY[0x1D17B6230]();
      v15 = *(id *)(a1 + 32);
      HMFGetOSLogHandle();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = *(HMBCloudZoneShareParticipantModel **)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
        *(_DWORD *)buf = 138543618;
        v50 = v17;
        v51 = 2112;
        v52 = v18;
        _os_log_impl(&dword_1CCD48000, v16, OS_LOG_TYPE_INFO, "%{public}@Created invitation: %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v14);
      v19 = [HMBShareParticipant alloc];
      objc_msgSend(*(id *)(a1 + 40), "participantClientIdentifier");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = -[HMBShareParticipant initWithCKShareParticipant:clientIdentifier:](v19, "initWithCKShareParticipant:clientIdentifier:", v5, v20);

      -[HMBShareParticipant setPendingInvitation:](v21, "setPendingInvitation:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40));
      v22 = [HMBCloudZoneShareParticipantModel alloc];
      objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "stateModelID");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = -[HMBModel initWithModelID:parentModelID:](v22, "initWithModelID:parentModelID:", v23, v24);

      -[HMBCloudZoneShareParticipantModel setParticipant:](v25, "setParticipant:", v21);
      v26 = *(void **)(a1 + 32);
      v47 = 0;
      objc_msgSend(v26, "encodeRecordFromModel:existingRecord:error:", v25, 0, &v47);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = v47;
      if (v27)
      {
        objc_msgSend(*(id *)(a1 + 32), "_pushUpdatedShare:participantRecord:", v3, v27);
        v29 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v41 = (void *)MEMORY[0x1D17B6230]();
        v42 = *(id *)(a1 + 32);
        HMFGetOSLogHandle();
        v43 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v46 = v41;
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          v50 = v44;
          v51 = 2112;
          v52 = v25;
          v53 = 2112;
          v54 = v28;
          _os_log_impl(&dword_1CCD48000, v43, OS_LOG_TYPE_ERROR, "%{public}@Unable to encode participant model %@: %@", buf, 0x20u);

          v41 = v46;
        }

        objc_autoreleasePoolPop(v41);
        objc_msgSend(MEMORY[0x1E0D519C0], "futureWithError:", v28);
        v29 = objc_claimAutoreleasedReturnValue();
      }
      v35 = (void *)v29;

    }
    else
    {
      v36 = (void *)MEMORY[0x1D17B6230]();
      v37 = *(id *)(a1 + 32);
      HMFGetOSLogHandle();
      v38 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v50 = v39;
        v51 = 2112;
        v52 = v5;
        _os_log_impl(&dword_1CCD48000, v38, OS_LOG_TYPE_ERROR, "%{public}@Unable to find invitation token on share participant %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v36);
      v40 = (void *)MEMORY[0x1E0D519C0];
      objc_msgSend(MEMORY[0x1E0CB35C8], "hmfErrorWithCode:", 15);
      v21 = (HMBShareParticipant *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "futureWithError:", v21);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
    }

  }
  else
  {
    v30 = (void *)MEMORY[0x1D17B6230]();
    v31 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v32 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v50 = v33;
      v51 = 2112;
      v52 = v3;
      _os_log_impl(&dword_1CCD48000, v32, OS_LOG_TYPE_ERROR, "%{public}@Unable to find updated share participant on share %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v30);
    v34 = (void *)MEMORY[0x1E0D519C0];
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmfErrorWithCode:", 15);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "futureWithError:", v6);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v35;
}

uint64_t __62__HMBCloudZone_Share___fetchInvitationWithContext_usingShare___block_invoke_61(uint64_t a1)
{
  return objc_msgSend(MEMORY[0x1E0D519C0], "futureWithResult:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40));
}

uint64_t __62__HMBCloudZone_Share___fetchInvitationWithContext_usingShare___block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isEqual:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40));
}

id __50__HMBCloudZone_Share__fetchInvitationWithContext___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[5];
  id v7;

  objc_msgSend(*(id *)(a1 + 32), "_createShareModel");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __50__HMBCloudZone_Share__fetchInvitationWithContext___block_invoke_2;
  v6[3] = &unk_1E8933160;
  v3 = *(void **)(a1 + 40);
  v6[4] = *(_QWORD *)(a1 + 32);
  v7 = v3;
  objc_msgSend(v2, "flatMap:", v6);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

uint64_t __50__HMBCloudZone_Share__fetchInvitationWithContext___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_fetchInvitationWithContext:usingShare:", *(_QWORD *)(a1 + 40), a2);
}

id __76__HMBCloudZone_Share__fetchCloudShareIDForShareParticipantClientIdentifier___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[5];
  id v7;

  objc_msgSend(*(id *)(a1 + 32), "_createShareModel");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __76__HMBCloudZone_Share__fetchCloudShareIDForShareParticipantClientIdentifier___block_invoke_2;
  v6[3] = &unk_1E8933160;
  v3 = *(void **)(a1 + 40);
  v6[4] = *(_QWORD *)(a1 + 32);
  v7 = v3;
  objc_msgSend(v2, "flatMap:", v6);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

id __76__HMBCloudZone_Share__fetchCloudShareIDForShareParticipantClientIdentifier___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  int v23;
  void *v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "participantWithClientIdentifier:", *(_QWORD *)(a1 + 40));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (!v4)
  {
    v9 = (void *)MEMORY[0x1D17B6230]();
    v10 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = *(void **)(a1 + 40);
      v23 = 138543618;
      v24 = v12;
      v25 = 2112;
      v26 = v13;
      _os_log_impl(&dword_1CCD48000, v11, OS_LOG_TYPE_ERROR, "%{public}@No participant was found with client identifier: %@", (uint8_t *)&v23, 0x16u);

    }
    objc_autoreleasePoolPop(v9);
    v14 = (void *)MEMORY[0x1E0D519C0];
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmfErrorWithCode:", 2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "futureWithError:", v7);
    v8 = objc_claimAutoreleasedReturnValue();
    goto LABEL_7;
  }
  objc_msgSend(v4, "cloudShareID");
  v6 = objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v7 = (void *)v6;
    objc_msgSend(MEMORY[0x1E0D519C0], "futureWithResult:", v6);
    v8 = objc_claimAutoreleasedReturnValue();
LABEL_7:
    v15 = (void *)v8;
    goto LABEL_11;
  }
  v16 = (void *)MEMORY[0x1D17B6230]();
  v17 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = 138543618;
    v24 = v19;
    v25 = 2112;
    v26 = v5;
    _os_log_impl(&dword_1CCD48000, v18, OS_LOG_TYPE_ERROR, "%{public}@No cloud share ID was found for participant: %@", (uint8_t *)&v23, 0x16u);

  }
  objc_autoreleasePoolPop(v16);
  v20 = (void *)MEMORY[0x1E0D519C0];
  objc_msgSend(MEMORY[0x1E0CB35C8], "hmfErrorWithCode:", 2);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "futureWithError:", v21);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = 0;
LABEL_11:

  return v15;
}

id __58__HMBCloudZone_Share__fetchCurrentParticipantCloudShareID__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  _QWORD v5[5];

  objc_msgSend(*(id *)(a1 + 32), "_createShareModel");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __58__HMBCloudZone_Share__fetchCurrentParticipantCloudShareID__block_invoke_2;
  v5[3] = &unk_1E8933138;
  v5[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(v2, "flatMap:", v5);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

id __58__HMBCloudZone_Share__fetchCurrentParticipantCloudShareID__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  HMBShareUserID *v7;
  uint64_t v8;
  void *v9;
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  int v16;
  void *v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "currentUserParticipant");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "userIdentity");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "userRecordID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v7 = -[HMBShareUserID initWithUserRecordID:]([HMBShareUserID alloc], "initWithUserRecordID:", v6);
    objc_msgSend(MEMORY[0x1E0D519C0], "futureWithResult:", v7);
    v8 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = (void *)MEMORY[0x1D17B6230]();
    v10 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = 138543618;
      v17 = v12;
      v18 = 2112;
      v19 = v3;
      _os_log_impl(&dword_1CCD48000, v11, OS_LOG_TYPE_ERROR, "%{public}@No current participant record ID found on cloud zone share: %@", (uint8_t *)&v16, 0x16u);

    }
    objc_autoreleasePoolPop(v9);
    v13 = (void *)MEMORY[0x1E0D519C0];
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmfErrorWithCode:", 2);
    v7 = (HMBShareUserID *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "futureWithError:", v7);
    v8 = objc_claimAutoreleasedReturnValue();
  }
  v14 = (void *)v8;

  return v14;
}

id __56__HMBCloudZone_Share__fetchOwnerParticipantCloudShareID__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  _QWORD v5[5];

  objc_msgSend(*(id *)(a1 + 32), "_createShareModel");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __56__HMBCloudZone_Share__fetchOwnerParticipantCloudShareID__block_invoke_2;
  v5[3] = &unk_1E8933138;
  v5[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(v2, "flatMap:", v5);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

id __56__HMBCloudZone_Share__fetchOwnerParticipantCloudShareID__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  HMBShareUserID *v7;
  uint64_t v8;
  void *v9;
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  int v16;
  void *v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "owner");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "userIdentity");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "userRecordID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v7 = -[HMBShareUserID initWithUserRecordID:]([HMBShareUserID alloc], "initWithUserRecordID:", v6);
    objc_msgSend(MEMORY[0x1E0D519C0], "futureWithResult:", v7);
    v8 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = (void *)MEMORY[0x1D17B6230]();
    v10 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = 138543618;
      v17 = v12;
      v18 = 2112;
      v19 = v3;
      _os_log_impl(&dword_1CCD48000, v11, OS_LOG_TYPE_ERROR, "%{public}@No owner record ID found on cloud zone share: %@", (uint8_t *)&v16, 0x16u);

    }
    objc_autoreleasePoolPop(v9);
    v13 = (void *)MEMORY[0x1E0D519C0];
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmfErrorWithCode:", 2);
    v7 = (HMBShareUserID *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "futureWithError:", v7);
    v8 = objc_claimAutoreleasedReturnValue();
  }
  v14 = (void *)v8;

  return v14;
}

- (BOOL)populateV4CloudRecord:(id)a3 withModel:(id)a4 metadataFieldData:(id)a5 startEncoding:(unint64_t)a6 endEncoding:(unint64_t)a7 encodingContext:(id)a8 error:(id *)a9
{
  id v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  BOOL v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  HMBCloudZone *v32;
  NSObject *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  HMBCloudZone *v39;
  void *v40;
  id v41;
  id v42;
  id v43;
  id v44;
  uint8_t buf[4];
  void *v46;
  __int16 v47;
  void *v48;
  __int16 v49;
  void *v50;
  __int16 v51;
  id v52;
  uint64_t v53;

  v53 = *MEMORY[0x1E0C80C00];
  v15 = a3;
  v43 = a4;
  v41 = a5;
  v42 = a8;
  -[HMBCloudZone cloudDatabase](self, "cloudDatabase");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (a6 >= 2)
  {
    v17 = 1;
    do
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("k%02lu"), v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "configuration");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "hmbSetObject:forKey:encrypted:", 0, v18, objc_msgSend(v19, "isManateeContainer"));

      ++v17;
    }
    while (a6 != v17);
  }
  if (a6 >= a7)
  {
    v21 = 0;
LABEL_10:
    objc_msgSend(v16, "configuration");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = v41;
    objc_msgSend(v15, "hmbSetObject:forKey:encrypted:", v41, CFSTR("k00"), objc_msgSend(v29, "isManateeContainer"));

    v20 = 1;
  }
  else
  {
    v39 = self;
    v20 = 0;
    v21 = 0;
    while (1)
    {
      v22 = v21;
      objc_msgSend(v42, "modelContainer");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99E60], "set");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v44 = v21;
      objc_msgSend(v23, "dataFromModel:encoding:storageLocation:updatedModelIDs:error:", v43, a6, 1, v24, &v44);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = v44;

      if (!v25)
        break;
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("k%02lu"), a6);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "hmbCompress");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "configuration");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "hmbSetObject:forKey:encrypted:", v27, v26, objc_msgSend(v28, "isManateeContainer"));

      v20 = ++a6 >= a7;
      if (a7 == a6)
        goto LABEL_10;
    }
    v31 = (void *)MEMORY[0x1D17B6230]();
    v32 = v39;
    HMFGetOSLogHandle();
    v33 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "hmbCanonicalType");
      v40 = v31;
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "hmbModelID");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "UUIDString");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      v46 = v34;
      v47 = 2112;
      v48 = v35;
      v49 = 2112;
      v50 = v37;
      v51 = 2112;
      v52 = v21;
      _os_log_impl(&dword_1CCD48000, v33, OS_LOG_TYPE_ERROR, "%{public}@Unable to encode model (%@.%@): %@", buf, 0x2Au);

      v31 = v40;
    }

    objc_autoreleasePoolPop(v31);
    if (a9)
    {
      v21 = objc_retainAutorelease(v21);
      *a9 = v21;
    }
    v30 = v41;
  }

  return v20;
}

- (id)cloudMetadataForModel:(id)a3 usingEncoding:(unint64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v14[5];
  _QWORD v15[6];

  v15[5] = *MEMORY[0x1E0C80C00];
  v14[0] = CFSTR("HM.device");
  v6 = a3;
  -[HMBCloudZone deviceIdentifier](self, "deviceIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v7;
  v14[1] = CFSTR("HM.encoding");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v15[1] = v8;
  v14[2] = CFSTR("HM.type");
  objc_msgSend(v6, "hmbType");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v15[2] = v9;
  v14[3] = CFSTR("HM.modelID");
  objc_msgSend(v6, "hmbModelID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v15[3] = v10;
  v14[4] = CFSTR("HM.parentModelID");
  objc_msgSend(v6, "hmbParentModelID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v15[4] = v11;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, v14, 5);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (id)cloudFieldForEncoding:(unint64_t)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("k%02lu"), a3);
}

@end
