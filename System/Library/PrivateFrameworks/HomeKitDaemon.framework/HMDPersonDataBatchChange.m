@implementation HMDPersonDataBatchChange

- (HMDPersonDataBatchChange)initWithLocalInput:(id)a3
{
  id v5;
  void *v6;
  HMDPersonDataBatchChange *v7;
  HMDPersonDataBatchChange *v8;
  uint64_t v9;
  NSUUID *UUID;
  uint64_t v11;
  NSMutableSet *addedOrUpdatedPersons;
  uint64_t v13;
  NSMutableSet *removedPersonsUUIDs;
  HMDPersonDataBatchChange *result;
  HMDPersonDataBatchChange *v16;
  SEL v17;
  id v18;
  objc_super v19;

  v5 = a3;
  if (v5)
  {
    v6 = v5;
    v19.receiver = self;
    v19.super_class = (Class)HMDPersonDataBatchChange;
    v7 = -[HMDPersonDataBatchChange init](&v19, sel_init);
    v8 = v7;
    if (v7)
    {
      objc_storeStrong((id *)&v7->_localInput, a3);
      objc_msgSend(MEMORY[0x24BDD1880], "UUID");
      v9 = objc_claimAutoreleasedReturnValue();
      UUID = v8->_UUID;
      v8->_UUID = (NSUUID *)v9;

      objc_msgSend(MEMORY[0x24BDBCEF0], "set");
      v11 = objc_claimAutoreleasedReturnValue();
      addedOrUpdatedPersons = v8->_addedOrUpdatedPersons;
      v8->_addedOrUpdatedPersons = (NSMutableSet *)v11;

      objc_msgSend(MEMORY[0x24BDBCEF0], "set");
      v13 = objc_claimAutoreleasedReturnValue();
      removedPersonsUUIDs = v8->_removedPersonsUUIDs;
      v8->_removedPersonsUUIDs = (NSMutableSet *)v13;

    }
    return v8;
  }
  else
  {
    v16 = (HMDPersonDataBatchChange *)_HMFPreconditionFailure();
    -[HMDPersonDataBatchChange addOrUpdatePerson:](v16, v17, v18);
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
  int v10;
  void *v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (void *)MEMORY[0x227676638]();
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
    _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_DEBUG, "%{public}@Adding/updating person: %@", (uint8_t *)&v10, 0x16u);

  }
  objc_autoreleasePoolPop(v5);
  -[HMDPersonDataBatchChange addedOrUpdatedPersons](v6, "addedOrUpdatedPersons");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addObject:", v4);

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

  v19 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (void *)MEMORY[0x227676638]();
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
    _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_DEBUG, "%{public}@Adding/updating face crop: %@", (uint8_t *)&v15, 0x16u);

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

  v14 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (void *)MEMORY[0x227676638]();
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
    _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_DEBUG, "%{public}@Removing person with UUID: %@", (uint8_t *)&v10, 0x16u);

  }
  objc_autoreleasePoolPop(v5);
  -[HMDPersonDataBatchChange removedPersonsUUIDs](v6, "removedPersonsUUIDs");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addObject:", v4);

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

  v14 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (void *)MEMORY[0x227676638]();
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
    _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_DEBUG, "%{public}@Removing face crop with UUID: %@", (uint8_t *)&v10, 0x16u);

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
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  id v26;
  uint8_t buf[4];
  void *v28;
  __int16 v29;
  id v30;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)MEMORY[0x227676638](self, a2);
  v4 = self;
  HMFGetOSLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v28 = v6;
    _os_log_impl(&dword_2218F0000, v5, OS_LOG_TYPE_DEBUG, "%{public}@Committing person data batch change", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v3);
  v7 = (void *)MEMORY[0x24BE4ED10];
  v8 = (void *)MEMORY[0x24BDD17C8];
  -[HMDPersonDataBatchChange UUID](v4, "UUID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringWithFormat:", CFSTR("Batch person data change for %@"), v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "optionsWithLabel:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  -[HMDPersonDataBatchChange localInput](v4, "localInput");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = 0;
  objc_msgSend(v12, "commitWithOptions:error:", v11, &v26);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v26;

  if (!v13)
  {
    v15 = (void *)MEMORY[0x227676638]();
    v16 = v4;
    HMFGetOSLogHandle();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v28 = v18;
      v29 = 2112;
      v30 = v14;
      _os_log_impl(&dword_2218F0000, v17, OS_LOG_TYPE_ERROR, "%{public}@Failed to commit person data batch change: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v15);
  }
  -[HMDPersonDataBatchChange addedOrUpdatedPersons](v4, "addedOrUpdatedPersons");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v19, "count"))
  {

LABEL_10:
    -[HMDPersonDataBatchChange dataSource](v4, "dataSource");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDPersonDataBatchChange addedOrUpdatedPersons](v4, "addedOrUpdatedPersons");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDPersonDataBatchChange removedPersonsUUIDs](v4, "removedPersonsUUIDs");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = (id)objc_msgSend(v22, "addOrUpdatePersons:andRemovePersonsWithUUIDs:", v23, v24);

    goto LABEL_11;
  }
  -[HMDPersonDataBatchChange removedPersonsUUIDs](v4, "removedPersonsUUIDs");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v20, "count");

  if (v21)
    goto LABEL_10;
LABEL_11:

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

  v8[1] = *MEMORY[0x24BDAC8D0];
  v3 = objc_alloc(MEMORY[0x24BE3F140]);
  -[HMDPersonDataBatchChange UUID](self, "UUID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithName:value:", CFSTR("UUID"), v4);
  v8[0] = v5;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v8, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (NSUUID)UUID
{
  return (NSUUID *)objc_getProperty(self, a2, 8, 1);
}

- (HMDPersonDataSource)dataSource
{
  return (HMDPersonDataSource *)objc_loadWeakRetained((id *)&self->_dataSource);
}

- (void)setDataSource:(id)a3
{
  objc_storeWeak((id *)&self->_dataSource, a3);
}

- (HMBLocalZoneLocalInput)localInput
{
  return (HMBLocalZoneLocalInput *)objc_getProperty(self, a2, 24, 1);
}

- (NSMutableSet)addedOrUpdatedPersons
{
  return (NSMutableSet *)objc_getProperty(self, a2, 32, 1);
}

- (NSMutableSet)removedPersonsUUIDs
{
  return (NSMutableSet *)objc_getProperty(self, a2, 40, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_removedPersonsUUIDs, 0);
  objc_storeStrong((id *)&self->_addedOrUpdatedPersons, 0);
  objc_storeStrong((id *)&self->_localInput, 0);
  objc_destroyWeak((id *)&self->_dataSource);
  objc_storeStrong((id *)&self->_UUID, 0);
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t7_34301 != -1)
    dispatch_once(&logCategory__hmf_once_t7_34301, &__block_literal_global_34302);
  return (id)logCategory__hmf_once_v8_34303;
}

void __39__HMDPersonDataBatchChange_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v8_34303;
  logCategory__hmf_once_v8_34303 = v0;

}

@end
