@implementation HMDPersonDataBatchChange

- (HMDPersonDataBatchChange)initWithLocalInput:(id)a3
{
  id v5;
  void *v6;
  HMDPersonDataBatchChange *v7;
  HMDPersonDataBatchChange *v8;
  uint64_t v9;
  NSUUID *UUID;
  HMDPersonDataBatchChange *result;
  HMDPersonDataBatchChange *v12;
  SEL v13;
  id v14;
  objc_super v15;

  v5 = a3;
  if (v5)
  {
    v6 = v5;
    v15.receiver = self;
    v15.super_class = (Class)HMDPersonDataBatchChange;
    v7 = -[HMDPersonDataBatchChange init](&v15, sel_init);
    v8 = v7;
    if (v7)
    {
      objc_storeStrong((id *)&v7->_localInput, a3);
      objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
      v9 = objc_claimAutoreleasedReturnValue();
      UUID = v8->_UUID;
      v8->_UUID = (NSUUID *)v9;

    }
    return v8;
  }
  else
  {
    v12 = (HMDPersonDataBatchChange *)_HMFPreconditionFailure();
    -[HMDPersonDataBatchChange addOrUpdatePerson:](v12, v13, v14);
  }
  return result;
}

- (void)addOrUpdatePerson:(id)a3
{
  id v4;
  void *v5;
  HMDPersonDataBatchChange *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  HMDPersonModel *v10;
  int v11;
  void *v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)MEMORY[0x1D17BA0A0]();
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 138543618;
    v12 = v8;
    v13 = 2112;
    v14 = v4;
    _os_log_impl(&dword_1CD062000, v7, OS_LOG_TYPE_DEBUG, "%{public}@Adding/updating person: %@", (uint8_t *)&v11, 0x16u);

  }
  objc_autoreleasePoolPop(v5);
  -[HMDPersonDataBatchChange localInput](v6, "localInput");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[HMDPersonModel initWithPerson:]([HMDPersonModel alloc], "initWithPerson:", v4);
  objc_msgSend(v9, "stageAdditionForModel:error:", v10, 0);

}

- (void)addOrUpdateFaceCrop:(id)a3
{
  id v4;
  void *v5;
  HMDPersonDataBatchChange *v6;
  NSObject *v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  HMDFaceCropModel *v12;
  HMDFaceCropModel *v13;
  void *v14;
  int v15;
  void *v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)MEMORY[0x1D17BA0A0]();
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 138543618;
    v16 = v8;
    v17 = 2112;
    v18 = v4;
    _os_log_impl(&dword_1CD062000, v7, OS_LOG_TYPE_DEBUG, "%{public}@Adding/updating face crop: %@", (uint8_t *)&v15, 0x16u);

  }
  objc_autoreleasePoolPop(v5);
  v9 = v4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v10 = v9;
  else
    v10 = 0;
  v11 = v10;

  if (v11)
    v12 = -[HMDFaceCropModel initWithPersonFaceCrop:]([HMDFaceCropModel alloc], "initWithPersonFaceCrop:", v11);
  else
    v12 = -[HMDUnassociatedFaceCropModel initWithFaceCrop:]([HMDUnassociatedFaceCropModel alloc], "initWithFaceCrop:", v9);
  v13 = v12;

  -[HMDPersonDataBatchChange localInput](v6, "localInput");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "stageAdditionForModel:error:", v13, 0);

}

- (void)removePersonWithUUID:(id)a3
{
  id v4;
  void *v5;
  HMDPersonDataBatchChange *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)MEMORY[0x1D17BA0A0]();
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138543618;
    v11 = v8;
    v12 = 2112;
    v13 = v4;
    _os_log_impl(&dword_1CD062000, v7, OS_LOG_TYPE_DEBUG, "%{public}@Removing person with UUID: %@", (uint8_t *)&v10, 0x16u);

  }
  objc_autoreleasePoolPop(v5);
  -[HMDPersonDataBatchChange localInput](v6, "localInput");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "stageRemovalForModelWithID:error:", v4, 0);

}

- (void)removeFaceCropWithUUID:(id)a3
{
  id v4;
  void *v5;
  HMDPersonDataBatchChange *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)MEMORY[0x1D17BA0A0]();
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138543618;
    v11 = v8;
    v12 = 2112;
    v13 = v4;
    _os_log_impl(&dword_1CD062000, v7, OS_LOG_TYPE_DEBUG, "%{public}@Removing face crop with UUID: %@", (uint8_t *)&v10, 0x16u);

  }
  objc_autoreleasePoolPop(v5);
  -[HMDPersonDataBatchChange localInput](v6, "localInput");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "stageRemovalForModelWithID:error:", v4, 0);

}

- (void)commit
{
  void *v3;
  HMDPersonDataBatchChange *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  HMDPersonDataBatchChange *v16;
  NSObject *v17;
  void *v18;
  id v19;
  uint8_t buf[4];
  void *v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1D17BA0A0](self, a2);
  v4 = self;
  HMFGetOSLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v21 = v6;
    _os_log_impl(&dword_1CD062000, v5, OS_LOG_TYPE_DEBUG, "%{public}@Committing person data batch change", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v3);
  v7 = (void *)MEMORY[0x1E0D32CD8];
  v8 = (void *)MEMORY[0x1E0CB3940];
  -[HMDPersonDataBatchChange UUID](v4, "UUID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringWithFormat:", CFSTR("Batch person data change for %@"), v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "optionsWithLabel:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  -[HMDPersonDataBatchChange localInput](v4, "localInput");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = 0;
  objc_msgSend(v12, "commitWithOptions:error:", v11, &v19);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v19;

  if (!v13)
  {
    v15 = (void *)MEMORY[0x1D17BA0A0]();
    v16 = v4;
    HMFGetOSLogHandle();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v21 = v18;
      v22 = 2112;
      v23 = v14;
      _os_log_impl(&dword_1CD062000, v17, OS_LOG_TYPE_ERROR, "%{public}@Failed to commit person data batch change: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v15);
  }

}

- (id)logIdentifier
{
  void *v2;
  void *v3;

  -[HMDPersonDataBatchChange UUID](self, "UUID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "UUIDString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
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
  -[HMDPersonDataBatchChange UUID](self, "UUID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithName:value:", CFSTR("UUID"), v4);
  v8[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (NSUUID)UUID
{
  return (NSUUID *)objc_getProperty(self, a2, 8, 1);
}

- (HMBLocalZoneLocalInput)localInput
{
  return (HMBLocalZoneLocalInput *)objc_getProperty(self, a2, 16, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localInput, 0);
  objc_storeStrong((id *)&self->_UUID, 0);
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t7_133698 != -1)
    dispatch_once(&logCategory__hmf_once_t7_133698, &__block_literal_global_133699);
  return (id)logCategory__hmf_once_v8_133700;
}

void __39__HMDPersonDataBatchChange_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v8_133700;
  logCategory__hmf_once_v8_133700 = v0;

}

@end
