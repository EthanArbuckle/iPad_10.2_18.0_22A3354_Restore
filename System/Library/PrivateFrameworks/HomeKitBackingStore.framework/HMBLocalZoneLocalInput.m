@implementation HMBLocalZoneLocalInput

- (BOOL)stageAdditionForModel:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  HMBLocalZoneLocalInput *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  BOOL v22;
  void *v23;
  HMBLocalZoneLocalInput *v24;
  NSObject *v25;
  void *v26;
  id v28;
  uint8_t buf[4];
  void *v30;
  __int16 v31;
  id v32;
  __int16 v33;
  id v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void *)MEMORY[0x1D17B6230]();
  v8 = self;
  HMFGetOSLogHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v30 = v10;
    v31 = 2112;
    v32 = v6;
    _os_log_impl(&dword_1CCD48000, v9, OS_LOG_TYPE_INFO, "%{public}@Staging addition for model: %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v7);
  -[HMBLocalZoneInput localZone](v8, "localZone");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "modelContainer");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "bestModelEncodingForStorageLocation:", 3);

  -[HMBLocalZoneInput localZone](v8, "localZone");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "modelContainer");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = 0;
  objc_msgSend(v15, "dataFromModel:encoding:storageLocation:updatedModelIDs:error:", v6, v13, 3, 0, &v28);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v28;

  if (v16)
  {
    -[HMBLocalZoneInput inputBlock](v8, "inputBlock");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "data");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "updateExternalID:externalData:modelEncoding:modelData:", v20, 0, v13, v16);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    v22 = v21 == 0;
    if (v21)
    {
      if (a4)
        *a4 = objc_retainAutorelease(v21);
    }
    else
    {
      -[HMBLocalZoneInput setStagedChangesCount:](v8, "setStagedChangesCount:", -[HMBLocalZoneInput stagedChangesCount](v8, "stagedChangesCount") + 1);
    }

  }
  else
  {
    v23 = (void *)MEMORY[0x1D17B6230]();
    v24 = v8;
    HMFGetOSLogHandle();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v30 = v26;
      v31 = 2112;
      v32 = v6;
      v33 = 2112;
      v34 = v17;
      _os_log_impl(&dword_1CCD48000, v25, OS_LOG_TYPE_ERROR, "%{public}@Failed to encode model %@: %@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v23);
    v22 = 0;
    if (a4)
      *a4 = objc_retainAutorelease(v17);
  }

  return v22;
}

- (id)commitWithOptions:(id)a3 error:(id *)a4
{
  id v6;
  int64_t v7;
  void *v8;
  HMBLocalZoneLocalInput *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  HMBLocalZoneLocalInput *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  objc_super v18;
  uint8_t buf[4];
  void *v20;
  __int16 v21;
  uint64_t v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = -[HMBLocalZoneLocalInput additionConstraint](self, "additionConstraint");
  if (v7 == 2)
  {
    v12 = (void *)MEMORY[0x1D17B6230]();
    v13 = self;
    HMFGetOSLogHandle();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v20 = v15;
      v21 = 2048;
      v22 = -[HMBLocalZoneLocalInput additionConstraint](v13, "additionConstraint");
      _os_log_impl(&dword_1CCD48000, v14, OS_LOG_TYPE_INFO, "%{public}@Setting disallowsModelCreation to YES because addition constraint is %ld", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v12);
    objc_msgSend(v6, "setDisallowsModelCreation:", 1);
  }
  else if (v7 == 1)
  {
    v8 = (void *)MEMORY[0x1D17B6230]();
    v9 = self;
    HMFGetOSLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v20 = v11;
      v21 = 2048;
      v22 = -[HMBLocalZoneLocalInput additionConstraint](v9, "additionConstraint");
      _os_log_impl(&dword_1CCD48000, v10, OS_LOG_TYPE_INFO, "%{public}@Setting requiresModelCreation to YES because addition constraint is %ld", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v8);
    objc_msgSend(v6, "setRequiresModelCreation:", 1);
  }
  v18.receiver = self;
  v18.super_class = (Class)HMBLocalZoneLocalInput;
  -[HMBLocalZoneInput commitWithOptions:error:](&v18, sel_commitWithOptions_error_, v6, a4);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

- (int64_t)additionConstraint
{
  return self->_additionConstraint;
}

- (void)setAdditionConstraint:(int64_t)a3
{
  self->_additionConstraint = a3;
}

@end
