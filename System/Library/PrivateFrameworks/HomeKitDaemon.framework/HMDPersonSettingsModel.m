@implementation HMDPersonSettingsModel

+ (id)hmbProperties
{
  if (hmbProperties_onceToken_252926 != -1)
    dispatch_once(&hmbProperties_onceToken_252926, &__block_literal_global_252927);
  return (id)hmbProperties_properties_252928;
}

+ (BOOL)hmbExcludeFromCloudStorage
{
  return 1;
}

+ (NSUUID)sentinelParentUUID
{
  if (sentinelParentUUID_onceToken_252921 != -1)
    dispatch_once(&sentinelParentUUID_onceToken_252921, &__block_literal_global_4_252922);
  return (NSUUID *)(id)sentinelParentUUID_sentinelParentUUID_252923;
}

+ (NSUUID)sentinelModelUUID
{
  if (sentinelModelUUID_onceToken != -1)
    dispatch_once(&sentinelModelUUID_onceToken, &__block_literal_global_8_252917);
  return (NSUUID *)(id)sentinelModelUUID_sentinelModelUUID;
}

void __43__HMDPersonSettingsModel_sentinelModelUUID__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_msgSend(objc_alloc(MEMORY[0x24BDD1880]), "initWithUUIDString:", CFSTR("B9F6C6E7-1B18-463B-B95A-6AF8C7A5E4DF"));
  v1 = (void *)sentinelModelUUID_sentinelModelUUID;
  sentinelModelUUID_sentinelModelUUID = v0;

}

void __44__HMDPersonSettingsModel_sentinelParentUUID__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_msgSend(objc_alloc(MEMORY[0x24BDD1880]), "initWithUUIDString:", CFSTR("BCF7ED70-4FE2-4186-8B8C-F4832AC1A54B"));
  v1 = (void *)sentinelParentUUID_sentinelParentUUID_252923;
  sentinelParentUUID_sentinelParentUUID_252923 = v0;

}

void __39__HMDPersonSettingsModel_hmbProperties__block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;
  const __CFString *v3;
  _QWORD v4[2];

  v4[1] = *MEMORY[0x24BDAC8D0];
  v3 = CFSTR("classificationNotificationSettingsData");
  objc_msgSend(MEMORY[0x24BE4ECB8], "fieldWithClass:", objc_opt_class());
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = v0;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v4, &v3, 1);
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)hmbProperties_properties_252928;
  hmbProperties_properties_252928 = v1;

}

- (NSDictionary)faceClassificationNotificationsEnabledByPersonUUID
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  void *v13;
  HMDPersonSettingsModel *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  id v18;
  uint8_t buf[4];
  void *v20;
  __int16 v21;
  id v22;
  _QWORD v23[4];

  v23[3] = *MEMORY[0x24BDAC8D0];
  -[HMDPersonSettingsModel classificationNotificationSettingsData](self, "classificationNotificationSettingsData");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = (void *)MEMORY[0x24BDD1620];
    v5 = (void *)MEMORY[0x24BDBCF20];
    v23[0] = objc_opt_class();
    v23[1] = objc_opt_class();
    v23[2] = objc_opt_class();
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v23, 3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setWithArray:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDPersonSettingsModel classificationNotificationSettingsData](self, "classificationNotificationSettingsData");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = 0;
    objc_msgSend(v4, "unarchivedObjectOfClasses:fromData:error:", v7, v8, &v18);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v18;

    if (v9)
    {
      v11 = v9;
    }
    else
    {
      v13 = (void *)MEMORY[0x227676638]();
      v14 = self;
      HMFGetOSLogHandle();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v20 = v16;
        v21 = 2112;
        v22 = v10;
        _os_log_impl(&dword_2218F0000, v15, OS_LOG_TYPE_ERROR, "%{public}@Failed to unarchive classificationNotificationSettingsData with error: %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v13);
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionary");
      v11 = (id)objc_claimAutoreleasedReturnValue();
    }
    v17 = v11;

    return (NSDictionary *)v17;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionary");
    return (NSDictionary *)(id)objc_claimAutoreleasedReturnValue();
  }
}

- (HMDPersonSettingsModel)init
{
  void *v3;
  void *v4;
  HMDPersonSettingsModel *v5;

  objc_msgSend((id)objc_opt_class(), "sentinelModelUUID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "sentinelParentUUID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[HMBModel initWithModelID:parentModelID:](self, "initWithModelID:parentModelID:", v3, v4);

  return v5;
}

- (id)classificationNotificationsEnabledForPersonUUID:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[HMDPersonSettingsModel unarchivedClassificationNotificationsEnabledForPersonUUID](self, "unarchivedClassificationNotificationsEnabledForPersonUUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)setClassificationNotificationsEnabled:(id)a3 forPersonUUID:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[HMDPersonSettingsModel unarchivedClassificationNotificationsEnabledForPersonUUID](self, "unarchivedClassificationNotificationsEnabledForPersonUUID");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v7, v6);

  -[HMDPersonSettingsModel archiveClassificationNotificationsEnabledForPersonUUID:](self, "archiveClassificationNotificationsEnabledForPersonUUID:", v8);
}

- (id)unarchivedClassificationNotificationsEnabledForPersonUUID
{
  void *v2;
  void *v3;

  -[HMDPersonSettingsModel faceClassificationNotificationsEnabledByPersonUUID](self, "faceClassificationNotificationsEnabledByPersonUUID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "mutableCopy");

  return v3;
}

- (void)archiveClassificationNotificationsEnabledForPersonUUID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  HMDPersonSettingsModel *v10;
  NSObject *v11;
  void *v12;
  id v13;
  uint8_t buf[4];
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (void *)MEMORY[0x24BDD1618];
  v6 = (void *)objc_msgSend(v4, "copy");
  v13 = 0;
  objc_msgSend(v5, "archivedDataWithRootObject:requiringSecureCoding:error:", v6, 1, &v13);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v13;

  if (v7)
  {
    -[HMDPersonSettingsModel setClassificationNotificationSettingsData:](self, "setClassificationNotificationSettingsData:", v7);
  }
  else
  {
    v9 = (void *)MEMORY[0x227676638]();
    v10 = self;
    HMFGetOSLogHandle();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v15 = v12;
      _os_log_impl(&dword_2218F0000, v11, OS_LOG_TYPE_ERROR, "%{public}@Failed to archive classificationNotificationsEnabledForPersonUUID, settings updates have not been made", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v9);
  }

}

@end
