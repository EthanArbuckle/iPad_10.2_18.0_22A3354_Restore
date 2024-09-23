@implementation HMDCameraClipCreateClipOperation

- (HMDCameraClipCreateClipOperation)initWithClipModelID:(id)a3 localZone:(id)a4 targetFragmentDuration:(double)a5 clipStartDate:(id)a6 quality:(int64_t)a7 encryptionManager:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  HMDCameraClipOperationDataSource *v18;
  HMDCameraClipCreateClipOperation *v19;

  v14 = a8;
  v15 = a6;
  v16 = a4;
  v17 = a3;
  v18 = objc_alloc_init(HMDCameraClipOperationDataSource);
  v19 = -[HMDCameraClipCreateClipOperation initWithClipModelID:localZone:targetFragmentDuration:clipStartDate:quality:encryptionManager:dataSource:](self, "initWithClipModelID:localZone:targetFragmentDuration:clipStartDate:quality:encryptionManager:dataSource:", v17, v16, v15, a7, v14, v18, a5);

  return v19;
}

- (HMDCameraClipCreateClipOperation)initWithClipModelID:(id)a3 localZone:(id)a4 targetFragmentDuration:(double)a5 clipStartDate:(id)a6 quality:(int64_t)a7 encryptionManager:(id)a8 dataSource:(id)a9
{
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  void *v21;
  HMDCameraClipCreateClipOperation *v22;
  HMDCameraClipCreateClipOperation *v23;
  uint64_t v24;
  NSDate *clipStartDate;
  HMDCameraClipCreateClipOperation *v27;
  SEL v28;
  objc_super v29;

  v16 = a3;
  v17 = a4;
  v18 = a6;
  v19 = a8;
  v20 = a9;
  if (!v16)
  {
    _HMFPreconditionFailure();
    goto LABEL_10;
  }
  if (!v17)
  {
LABEL_10:
    _HMFPreconditionFailure();
    goto LABEL_11;
  }
  if (a5 <= 0.0)
  {
LABEL_11:
    _HMFPreconditionFailure();
    goto LABEL_12;
  }
  if (!v18)
  {
LABEL_12:
    _HMFPreconditionFailure();
    goto LABEL_13;
  }
  if (!v19)
  {
LABEL_13:
    v27 = (HMDCameraClipCreateClipOperation *)_HMFPreconditionFailure();
    return (HMDCameraClipCreateClipOperation *)-[HMDCameraClipCreateClipOperation modelsToAdd](v27, v28);
  }
  v21 = v20;
  v29.receiver = self;
  v29.super_class = (Class)HMDCameraClipCreateClipOperation;
  v22 = -[HMDCameraClipOperation initWithClipModelID:localZone:dataSource:](&v29, sel_initWithClipModelID_localZone_dataSource_, v16, v17, v20);
  v23 = v22;
  if (v22)
  {
    v22->_targetFragmentDuration = a5;
    v24 = objc_msgSend(v18, "copy");
    clipStartDate = v23->_clipStartDate;
    v23->_clipStartDate = (NSDate *)v24;

    v23->_quality = a7;
    objc_storeStrong((id *)&v23->_encryptionManager, a8);
  }

  return v23;
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
  HMDCameraClipCreateClipOperation *v17;
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

  -[HMDCameraClipCreateClipOperation clipStartDate](self, "clipStartDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDCameraClipModel setStartDate:](v6, "setStartDate:", v7);

  -[HMDCameraClipModel setIsComplete:](v6, "setIsComplete:", MEMORY[0x24BDBD1C0]);
  -[HMDCameraClipModel setDuration:](v6, "setDuration:", &unk_24E96BC60);
  v8 = (void *)MEMORY[0x24BDD16E0];
  -[HMDCameraClipCreateClipOperation targetFragmentDuration](self, "targetFragmentDuration");
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
  -[HMDCameraClipCreateClipOperation encryptionManager](self, "encryptionManager");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "key");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDCameraClipModel setEncryptionKey:](v6, "setEncryptionKey:", v14);

  -[HMDCameraClipModel setEncryptionScheme:](v6, "setEncryptionScheme:", &unk_24E96BC78);
  -[HMDCameraClipModel setQuality:](v6, "setQuality:", -[HMDCameraClipCreateClipOperation quality](self, "quality"));
  if (-[HMDCameraClipCreateClipOperation quality](self, "quality"))
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
  v24.super_class = (Class)HMDCameraClipCreateClipOperation;
  -[HMDCameraClipAddModelsOperation modelsToAdd](&v24, sel_modelsToAdd);
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
  v17.super_class = (Class)HMDCameraClipCreateClipOperation;
  -[HMDCameraClipOperation attributeDescriptions](&v17, sel_attributeDescriptions);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_alloc(MEMORY[0x24BE3F140]);
  v5 = (void *)MEMORY[0x24BDD16E0];
  -[HMDCameraClipCreateClipOperation targetFragmentDuration](self, "targetFragmentDuration");
  objc_msgSend(v5, "numberWithDouble:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v4, "initWithName:value:", CFSTR("Target Fragment Duration"), v6);
  v18[0] = v7;
  v8 = objc_alloc(MEMORY[0x24BE3F140]);
  -[HMDCameraClipCreateClipOperation clipStartDate](self, "clipStartDate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v8, "initWithName:value:", CFSTR("Clip Start Date"), v9);
  v18[1] = v10;
  v11 = objc_alloc(MEMORY[0x24BE3F140]);
  -[HMDCameraClipCreateClipOperation quality](self, "quality");
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
  return (NSDate *)objc_getProperty(self, a2, 384, 1);
}

- (int64_t)quality
{
  return self->_quality;
}

- (HMCameraClipEncryptionManager)encryptionManager
{
  return (HMCameraClipEncryptionManager *)objc_getProperty(self, a2, 400, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_encryptionManager, 0);
  objc_storeStrong((id *)&self->_clipStartDate, 0);
}

+ (unint64_t)cameraClipOperationType
{
  return 1;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t1_139857 != -1)
    dispatch_once(&logCategory__hmf_once_t1_139857, &__block_literal_global_139858);
  return (id)logCategory__hmf_once_v2_139859;
}

void __47__HMDCameraClipCreateClipOperation_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v2_139859;
  logCategory__hmf_once_v2_139859 = v0;

}

@end
