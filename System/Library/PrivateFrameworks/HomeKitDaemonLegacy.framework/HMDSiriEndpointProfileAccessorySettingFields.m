@implementation HMDSiriEndpointProfileAccessorySettingFields

- (HMDSiriEndpointProfileAccessorySettingFields)init
{
  HMDSiriEndpointProfileAccessorySettingFields *v2;
  HMDSiriEndpointProfileAccessorySettingFields *v3;
  NSMutableDictionary *v4;
  NSMutableDictionary *serializeFields;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)HMDSiriEndpointProfileAccessorySettingFields;
  v2 = -[HMDSiriEndpointProfileAccessorySettingFields init](&v7, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_lock._os_unfair_lock_opaque = 0;
    v4 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    serializeFields = v3->_serializeFields;
    v3->_serializeFields = v4;

  }
  return v3;
}

- (void)setBoolValue:(BOOL)a3 forKeyPath:(id)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  char v8;
  void *v9;
  os_unfair_lock_s *p_lock;
  NSMutableDictionary *serializeFields;
  void *v12;
  void *v13;
  HMDSiriEndpointProfileAccessorySettingFields *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  int v18;
  void *v19;
  __int16 v20;
  void *v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v4 = a3;
  v24 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  +[HMDSiriEndpointProfileAccessorySettingFields BOOLeanValueKeyPaths](HMDSiriEndpointProfileAccessorySettingFields, "BOOLeanValueKeyPaths");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "containsObject:", v6);

  if ((v8 & 1) != 0)
  {
    +[HMDSiriEndpointProfileAccessorySettingFields fieldKeyForKeyPath:](HMDSiriEndpointProfileAccessorySettingFields, "fieldKeyForKeyPath:", v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    p_lock = &self->_lock;
    os_unfair_lock_lock_with_options();
    serializeFields = self->_serializeFields;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v4);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKey:](serializeFields, "setObject:forKey:", v12, v9);

    os_unfair_lock_unlock(p_lock);
  }
  else
  {
    v13 = (void *)MEMORY[0x1D17BA0A0]();
    v14 = self;
    HMFGetOSLogHandle();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      HMFBooleanToString();
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = 138543874;
      v19 = v16;
      v20 = 2112;
      v21 = v17;
      v22 = 2112;
      v23 = v6;
      _os_log_impl(&dword_1CD062000, v15, OS_LOG_TYPE_ERROR, "%{public}@Failed to store BOOLean value: %@ for keypath: %@", (uint8_t *)&v18, 0x20u);

    }
    objc_autoreleasePoolPop(v13);
  }

}

- (void)setNumberValue:(id)a3 forKeyPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  char v9;
  void *v10;
  void *v11;
  HMDSiriEndpointProfileAccessorySettingFields *v12;
  NSObject *v13;
  void *v14;
  int v15;
  void *v16;
  __int16 v17;
  id v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  +[HMDSiriEndpointProfileAccessorySettingFields numberValueKeyPaths](HMDSiriEndpointProfileAccessorySettingFields, "numberValueKeyPaths");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "containsObject:", v7);

  if ((v9 & 1) != 0)
  {
    +[HMDSiriEndpointProfileAccessorySettingFields fieldKeyForKeyPath:](HMDSiriEndpointProfileAccessorySettingFields, "fieldKeyForKeyPath:", v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    os_unfair_lock_lock_with_options();
    -[NSMutableDictionary setObject:forKey:](self->_serializeFields, "setObject:forKey:", v6, v10);
    os_unfair_lock_unlock(&self->_lock);

  }
  else
  {
    v11 = (void *)MEMORY[0x1D17BA0A0]();
    v12 = self;
    HMFGetOSLogHandle();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 138543874;
      v16 = v14;
      v17 = 2112;
      v18 = v6;
      v19 = 2112;
      v20 = v7;
      _os_log_impl(&dword_1CD062000, v13, OS_LOG_TYPE_ERROR, "%{public}@Failed to store integer value: %@ for keypath: %@", (uint8_t *)&v15, 0x20u);

    }
    objc_autoreleasePoolPop(v11);
  }

}

- (void)setLanguageValue:(id)a3 forKeyPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  char v9;
  void *v10;
  void *v11;
  void *v12;
  os_unfair_lock_s *p_lock;
  NSMutableDictionary *serializeFields;
  void *v15;
  NSMutableDictionary *v16;
  void *v17;
  NSMutableDictionary *v18;
  void *v19;
  void *v20;
  HMDSiriEndpointProfileAccessorySettingFields *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  uint8_t buf[4];
  void *v26;
  __int16 v27;
  id v28;
  __int16 v29;
  id v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  +[HMDSiriEndpointProfileAccessorySettingFields languageValueKeyPaths](HMDSiriEndpointProfileAccessorySettingFields, "languageValueKeyPaths");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "containsObject:", v7);

  if ((v9 & 1) != 0)
  {
    +[HMDSiriEndpointProfileAccessorySettingFields fieldKeyForKeyPath:](HMDSiriEndpointProfileAccessorySettingFields, "fieldKeyForKeyPath:", v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@%@"), v10, CFSTR("_inputLanguageCode"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@%@"), v10, CFSTR("_outputVoiceLanguageCode"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@%@"), v10, CFSTR("_outputVoiceGenderCode"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    p_lock = &self->_lock;
    os_unfair_lock_lock_with_options();
    serializeFields = self->_serializeFields;
    objc_msgSend(v6, "inputLanguageCode");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKey:](serializeFields, "setObject:forKey:", v15, v24);

    v16 = self->_serializeFields;
    objc_msgSend(v6, "outputVoiceLanguageCode");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKey:](v16, "setObject:forKey:", v17, v11);

    v18 = self->_serializeFields;
    objc_msgSend(v6, "outputVoiceGenderCode");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKey:](v18, "setObject:forKey:", v19, v12);

    os_unfair_lock_unlock(p_lock);
  }
  else
  {
    v20 = (void *)MEMORY[0x1D17BA0A0]();
    v21 = self;
    HMFGetOSLogHandle();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v26 = v23;
      v27 = 2112;
      v28 = v6;
      v29 = 2112;
      v30 = v7;
      _os_log_impl(&dword_1CD062000, v22, OS_LOG_TYPE_ERROR, "%{public}@Failed to store language value: %@ for keypath: %@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v20);
  }

}

- (id)serializeFields
{
  os_unfair_lock_s *p_lock;
  void *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v4 = (void *)-[NSMutableDictionary copy](self->_serializeFields, "copy");
  os_unfair_lock_unlock(p_lock);
  return v4;
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
  -[HMDSiriEndpointProfileAccessorySettingFields serializeFields](self, "serializeFields");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithName:value:", CFSTR("serializedFields"), v4);
  v8[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serializeFields, 0);
}

+ (id)fieldKeyForKeyPath:(id)a3
{
  return (id)objc_msgSend(a3, "stringByReplacingOccurrencesOfString:withString:", CFSTR("."), CFSTR("_"));
}

+ (id)keyPaths
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v2 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  +[HMDSiriEndpointProfileAccessorySettingFields BOOLeanValueKeyPaths](HMDSiriEndpointProfileAccessorySettingFields, "BOOLeanValueKeyPaths");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObjectsFromArray:", v3);

  +[HMDSiriEndpointProfileAccessorySettingFields numberValueKeyPaths](HMDSiriEndpointProfileAccessorySettingFields, "numberValueKeyPaths");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObjectsFromArray:", v4);

  +[HMDSiriEndpointProfileAccessorySettingFields languageValueKeyPaths](HMDSiriEndpointProfileAccessorySettingFields, "languageValueKeyPaths");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObjectsFromArray:", v5);

  v6 = (void *)objc_msgSend(v2, "copy");
  return v6;
}

+ (id)BOOLeanValueKeyPaths
{
  return &unk_1E8B31E48;
}

+ (id)numberValueKeyPaths
{
  return &unk_1E8B31E60;
}

+ (id)languageValueKeyPaths
{
  return &unk_1E8B31E78;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t7_54663 != -1)
    dispatch_once(&logCategory__hmf_once_t7_54663, &__block_literal_global_54664);
  return (id)logCategory__hmf_once_v8_54665;
}

void __59__HMDSiriEndpointProfileAccessorySettingFields_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v8_54665;
  logCategory__hmf_once_v8_54665 = v0;

}

@end
