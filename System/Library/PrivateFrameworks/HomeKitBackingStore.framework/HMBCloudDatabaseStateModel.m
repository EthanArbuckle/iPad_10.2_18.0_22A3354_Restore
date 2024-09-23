@implementation HMBCloudDatabaseStateModel

+ (id)hmbProperties
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __43__HMBCloudDatabaseStateModel_hmbProperties__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (hmbProperties_onceToken_7156 != -1)
    dispatch_once(&hmbProperties_onceToken_7156, block);
  return (id)hmbProperties__properties_7157;
}

void __43__HMBCloudDatabaseStateModel_hmbProperties__block_invoke(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v9;
  _QWORD v10[3];
  _QWORD v11[4];

  v11[3] = *MEMORY[0x1E0C80C00];
  v9.receiver = *(id *)(a1 + 32);
  v9.super_class = (Class)&OBJC_METACLASS___HMBCloudDatabaseStateModel;
  objc_msgSendSuper2(&v9, sel_hmbProperties);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "mutableCopy");
  v3 = (void *)hmbProperties__properties_7157;
  hmbProperties__properties_7157 = v2;

  v4 = (void *)hmbProperties__properties_7157;
  v10[0] = CFSTR("cloudID");
  +[HMBModelField fieldWithClass:](HMBModelField, "fieldWithClass:", objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v5;
  v10[1] = CFSTR("lastAdministrativeFetch");
  +[HMBModelField fieldWithClass:](HMBModelField, "fieldWithClass:", objc_opt_class());
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11[1] = v6;
  v10[2] = CFSTR("subscriptionsData");
  +[HMBModelField fieldWithClass:](HMBModelField, "fieldWithClass:", objc_opt_class());
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11[2] = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, v10, 3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addEntriesFromDictionary:", v8);

}

- (HMBCloudDatabaseStateModel)initWithModelID:(id)a3 parentModelID:(id)a4
{
  HMBCloudDatabaseStateModel *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)HMBCloudDatabaseStateModel;
  v4 = -[HMBModel initWithModelID:parentModelID:](&v8, sel_initWithModelID_parentModelID_, a3, a4);
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMBCloudDatabaseStateModel setLastAdministrativeFetch:](v4, "setLastAdministrativeFetch:", v5);

    objc_msgSend(MEMORY[0x1E0C99E60], "set");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMBCloudDatabaseStateModel setSubscriptions:](v4, "setSubscriptions:", v6);

  }
  return v4;
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
  HMBCloudDatabaseStateModel *v13;
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
  -[HMBCloudDatabaseStateModel subscriptionsData](self, "subscriptionsData");
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
  HMBCloudDatabaseStateModel *v8;
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
    -[HMBCloudDatabaseStateModel setSubscriptionsData:](self, "setSubscriptionsData:", v5);
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

- (CKDatabase)database
{
  return (CKDatabase *)objc_loadWeakRetained((id *)&self->_database);
}

- (void)setDatabase:(id)a3
{
  objc_storeWeak((id *)&self->_database, a3);
}

- (NAFuture)queuedCloudPullFuture
{
  return (NAFuture *)objc_getProperty(self, a2, 96, 1);
}

- (void)setQueuedCloudPullFuture:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 96);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queuedCloudPullFuture, 0);
  objc_destroyWeak((id *)&self->_database);
}

@end
