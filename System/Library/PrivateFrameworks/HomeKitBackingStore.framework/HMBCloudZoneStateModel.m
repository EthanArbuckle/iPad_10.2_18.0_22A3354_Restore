@implementation HMBCloudZoneStateModel

+ (id)hmbProperties
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __39__HMBCloudZoneStateModel_hmbProperties__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (hmbProperties_onceToken != -1)
    dispatch_once(&hmbProperties_onceToken, block);
  return (id)hmbProperties__properties;
}

void __39__HMBCloudZoneStateModel_hmbProperties__block_invoke(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  objc_super v11;
  _QWORD v12[5];
  _QWORD v13[6];

  v13[5] = *MEMORY[0x1E0C80C00];
  v11.receiver = *(id *)(a1 + 32);
  v11.super_class = (Class)&OBJC_METACLASS___HMBCloudZoneStateModel;
  objc_msgSendSuper2(&v11, sel_hmbProperties);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "mutableCopy");
  v3 = (void *)hmbProperties__properties;
  hmbProperties__properties = v2;

  v4 = (void *)hmbProperties__properties;
  v12[0] = CFSTR("zoneID");
  +[HMBModelField fieldWithClass:](HMBModelField, "fieldWithClass:", objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v5;
  v12[1] = CFSTR("needsZoneCreation");
  +[HMBModelField fieldWithClass:](HMBModelField, "fieldWithClass:", objc_opt_class());
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v13[1] = v6;
  v12[2] = CFSTR("needsZoneDeletion");
  +[HMBModelField fieldWithClass:](HMBModelField, "fieldWithClass:", objc_opt_class());
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v13[2] = v7;
  v12[3] = CFSTR("subscriptionsData");
  +[HMBModelField fieldWithClass:](HMBModelField, "fieldWithClass:", objc_opt_class());
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13[3] = v8;
  v12[4] = CFSTR("rebuilderStatus");
  +[HMBModelField fieldWithClass:](HMBModelField, "fieldWithClass:", objc_opt_class());
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v13[4] = v9;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, v12, 5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addEntriesFromDictionary:", v10);

}

- (HMBCloudZoneStateModel)initWithModelID:(id)a3 parentModelID:(id)a4
{
  HMBCloudZoneStateModel *v4;
  HMBCloudZoneStateModel *v5;
  uint64_t v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)HMBCloudZoneStateModel;
  v4 = -[HMBModel initWithModelID:parentModelID:](&v9, sel_initWithModelID_parentModelID_, a3, a4);
  v5 = v4;
  if (v4)
  {
    v6 = MEMORY[0x1E0C9AAA0];
    -[HMBCloudZoneStateModel setNeedsZoneCreation:](v4, "setNeedsZoneCreation:", MEMORY[0x1E0C9AAA0]);
    -[HMBCloudZoneStateModel setNeedsZoneDeletion:](v5, "setNeedsZoneDeletion:", v6);
    objc_msgSend(MEMORY[0x1E0C99E60], "set");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMBCloudZoneStateModel setSubscriptions:](v5, "setSubscriptions:", v7);

  }
  return v5;
}

- (NSSet)subscriptions
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  HMBCloudZoneStateModel *v13;
  NSObject *v14;
  void *v15;
  id v17;
  uint8_t buf[4];
  void *v19;
  __int16 v20;
  void *v21;
  __int16 v22;
  id v23;
  _QWORD v24[3];

  v24[2] = *MEMORY[0x1E0C80C00];
  -[HMBCloudZoneStateModel subscriptionsData](self, "subscriptionsData");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = (void *)MEMORY[0x1E0CB3710];
    v5 = (void *)MEMORY[0x1E0C99E60];
    v24[0] = objc_opt_class();
    v24[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v24, 2);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setWithArray:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = 0;
    objc_msgSend(v4, "unarchivedObjectOfClasses:fromData:error:", v7, v3, &v17);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v17;

    if (v8)
    {
      v10 = v8;
    }
    else
    {
      v12 = (void *)MEMORY[0x1D17B6230]();
      v13 = self;
      HMFGetOSLogHandle();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v19 = v15;
        v20 = 2112;
        v21 = v3;
        v22 = 2112;
        v23 = v9;
        _os_log_impl(&dword_1CCD48000, v14, OS_LOG_TYPE_ERROR, "%{public}@Failed to decode subscriptions data %@: %@", buf, 0x20u);

      }
      objc_autoreleasePoolPop(v12);
      objc_msgSend(MEMORY[0x1E0C99E60], "set");
      v10 = (id)objc_claimAutoreleasedReturnValue();
    }
    v11 = v10;

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "set");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return (NSSet *)v11;
}

- (void)setSubscriptions:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  HMBCloudZoneStateModel *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  id v12;
  uint8_t buf[4];
  void *v14;
  __int16 v15;
  void *v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v12 = 0;
  objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", v4, 1, &v12);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v12;
  if (v5)
  {
    -[HMBCloudZoneStateModel setSubscriptionsData:](self, "setSubscriptionsData:", v5);
  }
  else
  {
    v7 = (void *)MEMORY[0x1D17B6230]();
    v8 = self;
    HMFGetOSLogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "hmbDescription");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v14 = v10;
      v15 = 2112;
      v16 = v11;
      v17 = 2112;
      v18 = v6;
      _os_log_impl(&dword_1CCD48000, v9, OS_LOG_TYPE_ERROR, "%{public}@Failed to encode subscriptions %@: %@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v7);
  }

}

- (HMBCloudZone)cloudZone
{
  return (HMBCloudZone *)objc_loadWeakRetained((id *)&self->_cloudZone);
}

- (void)setCloudZone:(id)a3
{
  objc_storeWeak((id *)&self->_cloudZone, a3);
}

- (HMBCloudZoneRebuilderStatus)rebuilderStatus
{
  return self->_rebuilderStatus;
}

- (void)setRebuilderStatus:(id)a3
{
  objc_storeStrong((id *)&self->_rebuilderStatus, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rebuilderStatus, 0);
  objc_destroyWeak((id *)&self->_cloudZone);
}

@end
