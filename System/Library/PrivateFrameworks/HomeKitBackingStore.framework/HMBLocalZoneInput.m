@implementation HMBLocalZoneInput

- (HMBLocalZoneInput)initWithLocalZone:(id)a3 inputBlock:(id)a4
{
  id v7;
  id v8;
  void *v9;
  HMBLocalZoneInput *v10;
  HMBLocalZoneInput *v11;
  HMBLocalZoneInput *result;
  HMBLocalZoneInput *v13;
  SEL v14;
  objc_super v15;

  v7 = a3;
  v8 = a4;
  if (!v7)
  {
    _HMFPreconditionFailure();
    goto LABEL_7;
  }
  v9 = v8;
  if (!v8)
  {
LABEL_7:
    v13 = (HMBLocalZoneInput *)_HMFPreconditionFailure();
    -[HMBLocalZoneInput dealloc](v13, v14);
    return result;
  }
  v15.receiver = self;
  v15.super_class = (Class)HMBLocalZoneInput;
  v10 = -[HMBLocalZoneInput init](&v15, sel_init);
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_localZone, a3);
    objc_storeStrong((id *)&v11->_inputBlock, a4);
  }

  return v11;
}

- (void)dealloc
{
  void *v3;
  uint64_t v4;
  void *v5;
  HMBLocalZoneInput *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  id v10;
  objc_super v11;
  uint8_t buf[4];
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  -[HMBLocalZoneInput inputBlock](self, "inputBlock");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "blockRow");

  if (v4)
  {
    v5 = (void *)MEMORY[0x1D17B6230]();
    v6 = self;
    HMFGetOSLogHandle();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v13 = v8;
      _os_log_impl(&dword_1CCD48000, v7, OS_LOG_TYPE_INFO, "%{public}@Aborting input block left uncommitted", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v5);
    -[HMBLocalZoneInput inputBlock](v6, "inputBlock");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (id)objc_msgSend(v9, "abort");

  }
  v11.receiver = self;
  v11.super_class = (Class)HMBLocalZoneInput;
  -[HMBLocalZoneInput dealloc](&v11, sel_dealloc);
}

- (BOOL)stageRemovalForModelWithID:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  HMBLocalZoneInput *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  int v17;
  void *v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void *)MEMORY[0x1D17B6230]();
  v8 = self;
  HMFGetOSLogHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = 138543618;
    v18 = v10;
    v19 = 2112;
    v20 = v6;
    _os_log_impl(&dword_1CCD48000, v9, OS_LOG_TYPE_INFO, "%{public}@Staging removal for model with ID: %@", (uint8_t *)&v17, 0x16u);

  }
  objc_autoreleasePoolPop(v7);
  -[HMBLocalZoneInput inputBlock](v8, "inputBlock");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "data");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "data");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "updateExternalID:externalData:modelEncoding:modelData:", v13, 0, 0, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    if (a4)
      *a4 = objc_retainAutorelease(v15);
  }
  else
  {
    -[HMBLocalZoneInput setStagedChangesCount:](v8, "setStagedChangesCount:", -[HMBLocalZoneInput stagedChangesCount](v8, "stagedChangesCount") + 1);
  }

  return v15 == 0;
}

- (id)commitWithOptions:(id)a3 error:(id *)a4
{
  HMBProcessingResult *v6;
  unint64_t v7;
  void *v8;
  HMBLocalZoneInput *v9;
  NSObject *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  HMBProcessingResult *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  HMBLocalZoneInput *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  HMBProcessingResult *v26;
  void *v27;
  void *v28;
  HMBLocalZoneInput *v29;
  NSObject *v30;
  void *v31;
  void *v32;
  id v34;
  uint8_t buf[4];
  void *v36;
  __int16 v37;
  uint64_t v38;
  __int16 v39;
  HMBProcessingResult *v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v6 = (HMBProcessingResult *)a3;
  v7 = -[HMBLocalZoneInput stagedChangesCount](self, "stagedChangesCount");
  v8 = (void *)MEMORY[0x1D17B6230]();
  v9 = self;
  HMFGetOSLogHandle();
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v7)
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v36 = v12;
      v37 = 2048;
      v38 = -[HMBLocalZoneInput stagedChangesCount](v9, "stagedChangesCount");
      v39 = 2112;
      v40 = v6;
      _os_log_impl(&dword_1CCD48000, v11, OS_LOG_TYPE_INFO, "%{public}@Committing local zone input containing %lu staged changes with options: %@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v8);
    v34 = 0;
    objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", v6, 1, &v34);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (HMBProcessingResult *)v34;
    if (v13)
    {
      -[HMBLocalZoneInput inputBlock](v9, "inputBlock");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v15, "blockRow");

      -[HMBLocalZoneInput inputBlock](v9, "inputBlock");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "commit:", v13);
      v18 = objc_claimAutoreleasedReturnValue();

      if (!v18)
      {
        -[HMBLocalZoneInput localZone](v9, "localZone");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "triggerProcessForBlockRow:", v16);
        v27 = (void *)objc_claimAutoreleasedReturnValue();

        v14 = 0;
        goto LABEL_21;
      }
      v19 = (void *)MEMORY[0x1D17B6230]();
      v20 = v9;
      HMFGetOSLogHandle();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v36 = v22;
        v37 = 2112;
        v38 = v18;
        _os_log_impl(&dword_1CCD48000, v21, OS_LOG_TYPE_ERROR, "%{public}@Failed to commit local zone input: %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v19);
      if (!a4)
      {
        v27 = 0;
        v14 = (HMBProcessingResult *)v18;
        goto LABEL_21;
      }
      v23 = (void *)v18;
    }
    else
    {
      v28 = (void *)MEMORY[0x1D17B6230]();
      v29 = v9;
      HMFGetOSLogHandle();
      v30 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v36 = v31;
        v37 = 2112;
        v38 = (uint64_t)v6;
        v39 = 2112;
        v40 = v14;
        _os_log_impl(&dword_1CCD48000, v30, OS_LOG_TYPE_ERROR, "%{public}@Failed to archive options %@: %@", buf, 0x20u);

      }
      objc_autoreleasePoolPop(v28);
      if (!a4)
      {
        v27 = 0;
        goto LABEL_21;
      }
      v23 = v14;
    }
    v14 = objc_retainAutorelease(v23);
    v27 = 0;
    *a4 = v14;
LABEL_21:

    goto LABEL_22;
  }
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier();
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v36 = v24;
    _os_log_impl(&dword_1CCD48000, v11, OS_LOG_TYPE_DEBUG, "%{public}@Skipping local zone input commit with no staged changes", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v8);
  v25 = (void *)MEMORY[0x1E0D519C0];
  v26 = [HMBProcessingResult alloc];
  v14 = -[HMBProcessingResult initWithOptions:actions:mirrorOutputResult:](v26, "initWithOptions:actions:mirrorOutputResult:", v6, MEMORY[0x1E0C9AA60], 0);
  objc_msgSend(v25, "futureWithResult:", v14);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_22:

  return v27;
}

- (void)abort
{
  void *v3;
  HMBLocalZoneInput *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  id v8;
  int v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1D17B6230](self, a2);
  v4 = self;
  HMFGetOSLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138543362;
    v10 = v6;
    _os_log_impl(&dword_1CCD48000, v5, OS_LOG_TYPE_INFO, "%{public}@Aborting local zone input", (uint8_t *)&v9, 0xCu);

  }
  objc_autoreleasePoolPop(v3);
  -[HMBLocalZoneInput inputBlock](v4, "inputBlock");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (id)objc_msgSend(v7, "abort");

}

- (id)logIdentifier
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[HMBLocalZoneInput localZone](self, "localZone");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "zoneID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMBLocalZoneInput inputBlock](self, "inputBlock");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@/%lu"), v6, objc_msgSend(v7, "blockRow"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)attributeDescriptions
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v15[3];

  v15[2] = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc(MEMORY[0x1E0D28548]);
  -[HMBLocalZoneInput localZone](self, "localZone");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "zoneID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v3, "initWithName:value:", CFSTR("Zone Name"), v6);
  v15[0] = v7;
  v8 = objc_alloc(MEMORY[0x1E0D28548]);
  v9 = (void *)MEMORY[0x1E0CB37E8];
  -[HMBLocalZoneInput inputBlock](self, "inputBlock");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "numberWithUnsignedInteger:", objc_msgSend(v10, "blockRow"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v8, "initWithName:value:", CFSTR("Block Row"), v11);
  v15[1] = v12;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (HMBLocalZone)localZone
{
  return (HMBLocalZone *)objc_getProperty(self, a2, 8, 1);
}

- (HMBLocalSQLContextInputBlock)inputBlock
{
  return (HMBLocalSQLContextInputBlock *)objc_getProperty(self, a2, 16, 1);
}

- (unint64_t)stagedChangesCount
{
  return self->_stagedChangesCount;
}

- (void)setStagedChangesCount:(unint64_t)a3
{
  self->_stagedChangesCount = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_inputBlock, 0);
  objc_storeStrong((id *)&self->_localZone, 0);
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t7 != -1)
    dispatch_once(&logCategory__hmf_once_t7, &__block_literal_global_5946);
  return (id)logCategory__hmf_once_v8;
}

void __32__HMBLocalZoneInput_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v8;
  logCategory__hmf_once_v8 = v0;

}

@end
