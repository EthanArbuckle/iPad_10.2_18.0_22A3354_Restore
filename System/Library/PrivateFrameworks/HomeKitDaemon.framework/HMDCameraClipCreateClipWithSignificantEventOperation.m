@implementation HMDCameraClipCreateClipWithSignificantEventOperation

- (HMDCameraClipCreateClipWithSignificantEventOperation)initWithClipModelID:(id)a3 localZone:(id)a4 significantEvent:(id)a5 homePresenceByPairingIdentity:(id)a6 targetFragmentDuration:(double)a7 clipStartDate:(id)a8 quality:(int64_t)a9 encryptionManager:(id)a10
{
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  HMDCameraClipOperationDataSource *v24;
  HMDCameraClipCreateClipWithSignificantEventOperation *v25;

  v18 = a10;
  v19 = a8;
  v20 = a6;
  v21 = a5;
  v22 = a4;
  v23 = a3;
  v24 = objc_alloc_init(HMDCameraClipOperationDataSource);
  v25 = -[HMDCameraClipCreateClipWithSignificantEventOperation initWithClipModelID:localZone:significantEvent:homePresenceByPairingIdentity:targetFragmentDuration:clipStartDate:quality:encryptionManager:dataSource:](self, "initWithClipModelID:localZone:significantEvent:homePresenceByPairingIdentity:targetFragmentDuration:clipStartDate:quality:encryptionManager:dataSource:", v23, v22, v21, v20, v19, a9, a7, v18, v24);

  return v25;
}

- (HMDCameraClipCreateClipWithSignificantEventOperation)initWithClipModelID:(id)a3 localZone:(id)a4 significantEvent:(id)a5 homePresenceByPairingIdentity:(id)a6 targetFragmentDuration:(double)a7 clipStartDate:(id)a8 quality:(int64_t)a9 encryptionManager:(id)a10 dataSource:(id)a11
{
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  void *v25;
  HMDCameraClipCreateClipWithSignificantEventOperation *v26;
  HMDCameraClipCreateClipWithSignificantEventOperation *v27;
  uint64_t v28;
  NSDate *clipStartDate;
  HMDCameraClipCreateClipWithSignificantEventOperation *v31;
  SEL v32;
  objc_super v33;

  v18 = a3;
  v19 = a4;
  v20 = a5;
  v21 = a6;
  v22 = a8;
  v23 = a10;
  v24 = a11;
  if (!v18)
  {
    _HMFPreconditionFailure();
    goto LABEL_13;
  }
  if (!v19)
  {
LABEL_13:
    _HMFPreconditionFailure();
    goto LABEL_14;
  }
  if (!v20)
  {
LABEL_14:
    _HMFPreconditionFailure();
    goto LABEL_15;
  }
  if (!v21)
  {
LABEL_15:
    _HMFPreconditionFailure();
    goto LABEL_16;
  }
  if (a7 <= 0.0)
  {
LABEL_16:
    _HMFPreconditionFailure();
    goto LABEL_17;
  }
  if (!v22)
  {
LABEL_17:
    _HMFPreconditionFailure();
    goto LABEL_18;
  }
  if (!v23)
  {
LABEL_18:
    _HMFPreconditionFailure();
    goto LABEL_19;
  }
  v25 = v24;
  if (!v24)
  {
LABEL_19:
    v31 = (HMDCameraClipCreateClipWithSignificantEventOperation *)_HMFPreconditionFailure();
    return (HMDCameraClipCreateClipWithSignificantEventOperation *)-[HMDCameraClipCreateClipWithSignificantEventOperation modelsToAdd](v31, v32);
  }
  v33.receiver = self;
  v33.super_class = (Class)HMDCameraClipCreateClipWithSignificantEventOperation;
  v26 = -[HMDCameraClipAddSignificantEventOperation initWithClipModelID:localZone:significantEvent:homePresenceByPairingIdentity:dataSource:](&v33, sel_initWithClipModelID_localZone_significantEvent_homePresenceByPairingIdentity_dataSource_, v18, v19, v20, v21, v24);
  v27 = v26;
  if (v26)
  {
    v26->_targetFragmentDuration = a7;
    v28 = objc_msgSend(v22, "copy");
    clipStartDate = v27->_clipStartDate;
    v27->_clipStartDate = (NSDate *)v28;

    v27->_quality = a9;
    objc_storeStrong((id *)&v27->_encryptionManager, a10);
  }

  return v27;
}

- (id)modelsToAdd
{
  HMDCameraClipModel *v3;
  void *v4;
  void *v5;
  HMDCameraClipModel *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  HMDCameraClipCreateClipWithSignificantEventOperation *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  objc_super v24;
  uint8_t buf[4];
  void *v26;
  __int16 v27;
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v3 = [HMDCameraClipModel alloc];
  -[HMDCameraClipOperation clipModelID](self, "clipModelID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[HMDCameraClipModel sentinelParentUUID](HMDCameraClipModel, "sentinelParentUUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[HMBModel initWithModelID:parentModelID:](v3, "initWithModelID:parentModelID:", v4, v5);

  -[HMDCameraClipCreateClipWithSignificantEventOperation clipStartDate](self, "clipStartDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDCameraClipModel setStartDate:](v6, "setStartDate:", v7);

  -[HMDCameraClipModel setIsComplete:](v6, "setIsComplete:", MEMORY[0x24BDBD1C0]);
  -[HMDCameraClipModel setDuration:](v6, "setDuration:", &unk_24E96D2E0);
  v8 = (void *)MEMORY[0x24BDD16E0];
  -[HMDCameraClipCreateClipWithSignificantEventOperation targetFragmentDuration](self, "targetFragmentDuration");
  objc_msgSend(v8, "numberWithDouble:");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDCameraClipModel setTargetFragmentDuration:](v6, "setTargetFragmentDuration:", v9);

  v10 = (void *)MEMORY[0x24BDD16E0];
  +[HMDCameraClipManager maximumClipDuration](HMDCameraClipManager, "maximumClipDuration");
  objc_msgSend(v10, "numberWithDouble:");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDCameraClipModel setMaximumClipDuration:](v6, "setMaximumClipDuration:", v11);

  -[HMDCameraClipModel setRecordedLocally:](v6, "setRecordedLocally:", MEMORY[0x24BDBD1C8]);
  -[HMDCameraClipModel setStreamingAssetVersion:](v6, "setStreamingAssetVersion:", CFSTR("1"));
  v12 = objc_alloc_init(MEMORY[0x24BE4ED38]);
  -[HMDCameraClipModel setVideoStreamingAsset:](v6, "setVideoStreamingAsset:", v12);

  -[HMDCameraClipModel setVideoMetadataArray:](v6, "setVideoMetadataArray:", MEMORY[0x24BDBD1A8]);
  -[HMDCameraClipCreateClipWithSignificantEventOperation encryptionManager](self, "encryptionManager");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "key");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDCameraClipModel setEncryptionKey:](v6, "setEncryptionKey:", v14);

  -[HMDCameraClipModel setEncryptionScheme:](v6, "setEncryptionScheme:", &unk_24E96D2F8);
  -[HMDCameraClipModel setQuality:](v6, "setQuality:", -[HMDCameraClipCreateClipWithSignificantEventOperation quality](self, "quality"));
  if (-[HMDCameraClipCreateClipWithSignificantEventOperation quality](self, "quality"))
  {
    v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE3F2A8]), "initWithVersionString:", CFSTR("8.0"));
    -[HMBModel setHmbMinimumSupportedVersion:](v6, "setHmbMinimumSupportedVersion:", v15);

  }
  v16 = (void *)MEMORY[0x227676638]();
  v17 = self;
  HMFGetOSLogHandle();
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMBModel debugDescription](v6, "debugDescription");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v26 = v19;
    v27 = 2112;
    v28 = v20;
    _os_log_impl(&dword_2218F0000, v18, OS_LOG_TYPE_INFO, "%{public}@Creating clip: %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v16);
  v24.receiver = v17;
  v24.super_class = (Class)HMDCameraClipCreateClipWithSignificantEventOperation;
  -[HMDCameraClipAddSignificantEventOperation modelsToAdd](&v24, sel_modelsToAdd);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setByAddingObject:", v6);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  return v22;
}

- (id)attributeDescriptions
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  objc_super v17;
  _QWORD v18[4];

  v18[3] = *MEMORY[0x24BDAC8D0];
  v17.receiver = self;
  v17.super_class = (Class)HMDCameraClipCreateClipWithSignificantEventOperation;
  -[HMDCameraClipAddSignificantEventOperation attributeDescriptions](&v17, sel_attributeDescriptions);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_alloc(MEMORY[0x24BE3F140]);
  v5 = (void *)MEMORY[0x24BDD16E0];
  -[HMDCameraClipCreateClipWithSignificantEventOperation targetFragmentDuration](self, "targetFragmentDuration");
  objc_msgSend(v5, "numberWithDouble:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v4, "initWithName:value:", CFSTR("Target Fragment Duration"), v6);
  v18[0] = v7;
  v8 = objc_alloc(MEMORY[0x24BE3F140]);
  -[HMDCameraClipCreateClipWithSignificantEventOperation clipStartDate](self, "clipStartDate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v8, "initWithName:value:", CFSTR("Clip Start Date"), v9);
  v18[1] = v10;
  v11 = objc_alloc(MEMORY[0x24BE3F140]);
  -[HMDCameraClipCreateClipWithSignificantEventOperation quality](self, "quality");
  HMStringFromCameraClipQuality();
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v11, "initWithName:value:", CFSTR("Quality"), v12);
  v18[2] = v13;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v18, 3);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "arrayByAddingObjectsFromArray:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (double)targetFragmentDuration
{
  return self->_targetFragmentDuration;
}

- (NSDate)clipStartDate
{
  return (NSDate *)objc_getProperty(self, a2, 400, 1);
}

- (int64_t)quality
{
  return self->_quality;
}

- (HMCameraClipEncryptionManager)encryptionManager
{
  return (HMCameraClipEncryptionManager *)objc_getProperty(self, a2, 416, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_encryptionManager, 0);
  objc_storeStrong((id *)&self->_clipStartDate, 0);
}

+ (unint64_t)cameraClipOperationType
{
  return 2;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t1_228546 != -1)
    dispatch_once(&logCategory__hmf_once_t1_228546, &__block_literal_global_228547);
  return (id)logCategory__hmf_once_v2_228548;
}

void __67__HMDCameraClipCreateClipWithSignificantEventOperation_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v2_228548;
  logCategory__hmf_once_v2_228548 = v0;

}

@end
