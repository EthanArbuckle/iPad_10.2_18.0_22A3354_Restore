@implementation HMDRemovedUserAccessCodeModel

- (HMDRemovedUserAccessCodeModel)initWithRemovedUserInfo:(id)a3 accessCode:(id)a4 homeUUID:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  HMDRemovedUserAccessCodeModel *v12;
  void *v13;
  void *v14;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  +[HMDRemovedUserAccessCodeModel modelUUIDForHomeUUID:removedUserInfo:accessCode:](HMDRemovedUserAccessCodeModel, "modelUUIDForHomeUUID:removedUserInfo:accessCode:", v10, v8, v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[HMDBackingStoreModelObject initWithObjectChangeType:uuid:parentUUID:](self, "initWithObjectChangeType:uuid:parentUUID:", 1, v11, v10);

  if (v12)
  {
    encodeRootObject();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDRemovedUserAccessCodeModel setRemovedUserInfoData:](v12, "setRemovedUserInfoData:", v13);

    v14 = (void *)objc_msgSend(v9, "copy");
    -[HMDRemovedUserAccessCodeModel setAccessCode:](v12, "setAccessCode:", v14);

  }
  return v12;
}

- (HMRemovedUserInfo)removedUserInfo
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  HMDRemovedUserAccessCodeModel *v11;
  NSObject *v12;
  void *v13;
  void *v15;
  HMDRemovedUserAccessCodeModel *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  id v20;
  uint8_t buf[4];
  void *v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  -[HMDRemovedUserAccessCodeModel removedUserInfoData](self, "removedUserInfoData");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = (void *)MEMORY[0x1E0CB3710];
    v5 = objc_opt_class();
    -[HMDRemovedUserAccessCodeModel removedUserInfoData](self, "removedUserInfoData");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = 0;
    objc_msgSend(v4, "unarchivedObjectOfClass:fromData:error:", v5, v6, &v20);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v20;

    if (v7)
    {
      v9 = v7;
    }
    else
    {
      v15 = (void *)MEMORY[0x1D17BA0A0]();
      v16 = self;
      HMFGetOSLogHandle();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMDRemovedUserAccessCodeModel removedUserInfoData](v16, "removedUserInfoData");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v22 = v18;
        v23 = 2112;
        v24 = v19;
        v25 = 2112;
        v26 = v8;
        _os_log_impl(&dword_1CD062000, v17, OS_LOG_TYPE_ERROR, "%{public}@Failed to unarchive removedUserInfoData: %@, with error: %@", buf, 0x20u);

      }
      objc_autoreleasePoolPop(v15);
    }

    return (HMRemovedUserInfo *)v7;
  }
  else
  {
    v10 = (void *)MEMORY[0x1D17BA0A0]();
    v11 = self;
    HMFGetOSLogHandle();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v22 = v13;
      _os_log_impl(&dword_1CD062000, v12, OS_LOG_TYPE_ERROR, "%{public}@removedUserInfoData was nil, this should never happen", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v10);
    return (HMRemovedUserInfo *)0;
  }
}

+ (id)properties
{
  if (properties_onceToken_183239 != -1)
    dispatch_once(&properties_onceToken_183239, &__block_literal_global_183240);
  return (id)properties__properties_183241;
}

+ (id)modelUUIDForHomeUUID:(id)a3 removedUserInfo:(id)a4 accessCode:(id)a5
{
  void *v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  v7 = (void *)MEMORY[0x1E0CB3A28];
  v8 = a5;
  v9 = a3;
  objc_msgSend(a4, "userUUID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "hm_convertToData");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "hmf_UUIDWithNamespace:data:", v9, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = (void *)MEMORY[0x1E0CB3A28];
  objc_msgSend(v8, "dataUsingEncoding:", 4);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "hmf_UUIDWithNamespace:data:", v12, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

void __43__HMDRemovedUserAccessCodeModel_properties__block_invoke()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  _QWORD v4[2];
  _QWORD v5[3];

  v5[2] = *MEMORY[0x1E0C80C00];
  v4[0] = CFSTR("removedUserInfoData");
  +[HMDBackingStoreModelObjectStorageInfo infoWithClass:](HMDBackingStoreModelObjectStorageInfo, "infoWithClass:", objc_opt_class());
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v4[1] = CFSTR("accessCode");
  v5[0] = v0;
  +[HMDBackingStoreModelObjectStorageInfo infoWithClass:logging:](HMDBackingStoreModelObjectStorageInfo, "infoWithClass:logging:", objc_opt_class(), 3);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v5[1] = v1;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v5, v4, 2);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)properties__properties_183241;
  properties__properties_183241 = v2;

}

@end
