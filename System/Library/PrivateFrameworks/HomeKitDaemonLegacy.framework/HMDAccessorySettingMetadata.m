@implementation HMDAccessorySettingMetadata

- (HMDAccessorySettingMetadata)initWithName:(id)a3 type:(int64_t)a4 properties:(unint64_t)a5 constraints:(id)a6 mergeStrategy:(id)a7 value:(id)a8 parentKeyPath:(id)a9
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  HMDAccessorySettingMetadata *v21;
  uint64_t v22;
  NSString *name;
  uint64_t v24;
  NSString *keyPath;
  void *v26;
  HMDAccessorySettingMetadata *v27;
  uint64_t v28;
  id value;
  objc_super v31;

  v15 = a3;
  v16 = a6;
  v17 = a7;
  v18 = a8;
  v19 = a9;
  if (v15)
  {
    v20 = v15;
    if (a4)
    {
      v31.receiver = self;
      v31.super_class = (Class)HMDAccessorySettingMetadata;
      v21 = -[HMDAccessorySettingMetadata init](&v31, sel_init);
      if (v21)
      {
        v22 = objc_msgSend(v20, "copy");
        name = v21->_name;
        v21->_name = (NSString *)v22;

        objc_msgSend(v19, "stringByAppendingFormat:", CFSTR(".%@"), v20);
        v24 = objc_claimAutoreleasedReturnValue();
        keyPath = v21->_keyPath;
        v21->_keyPath = (NSString *)v24;

        v21->_type = a4;
        v21->_properties = a5;
        if (v16)
          v26 = (void *)objc_msgSend(v16, "copy");
        else
          v26 = (void *)MEMORY[0x1E0C9AA60];
        objc_storeStrong((id *)&v21->_constraints, v26);
        if (v16)

        objc_storeStrong((id *)&v21->_mergeStrategy, a7);
        v28 = objc_msgSend(v18, "copy");
        value = v21->_value;
        v21->_value = (id)v28;

      }
      self = v21;
      v27 = self;
    }
    else
    {
      v27 = 0;
    }

  }
  else
  {
    v27 = 0;
  }

  return v27;
}

- (NSString)propertyDescription
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[HMDAccessorySettingMetadata name](self, "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDAccessorySettingMetadata type](self, "type");
  HMAccessorySettingTypeToString();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDAccessorySettingMetadata properties](self, "properties");
  HMAccessorySettingPropertiesToString();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDAccessorySettingMetadata value](self, "value");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDAccessorySettingMetadata constraints](self, "constraints");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR(", Name = %@, Type = %@, Properties = %@, Value = %@, Constraints = %@"), v4, v5, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v9;
}

- (id)modelsWithParentIdentifier:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  -[HMDAccessorySettingMetadata modelWithParentIdentifier:](self, "modelWithParentIdentifier:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithObject:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  -[HMDAccessorySettingMetadata constraints](self, "constraints", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v17;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v17 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * v10);
        objc_msgSend(v4, "uuid");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "modelWithParentIdentifier:", v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v13, "setObjectChangeType:", 1);
        objc_msgSend(v5, "addObject:", v13);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v8);
  }

  v14 = (void *)objc_msgSend(v5, "copy");
  return v14;
}

- (id)modelWithParentIdentifier:(id)a3
{
  id v4;
  HMDAccessorySettingModel *v5;
  void *v6;
  HMDAccessorySettingModel *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v4 = a3;
  v5 = [HMDAccessorySettingModel alloc];
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[HMDBackingStoreModelObject initWithObjectChangeType:uuid:parentUUID:](v5, "initWithObjectChangeType:uuid:parentUUID:", 1, v6, v4);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[HMDAccessorySettingMetadata properties](self, "properties"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDAccessorySettingModel setProperties:](v7, "setProperties:", v8);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[HMDAccessorySettingMetadata type](self, "type"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDAccessorySettingModel setType:](v7, "setType:", v9);

  -[HMDAccessorySettingMetadata name](self, "name");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDAccessorySettingModel setName:](v7, "setName:", v10);

  -[HMDAccessorySettingMetadata value](self, "value");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  encodeRootObject();
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDAccessorySettingModel setValue:](v7, "setValue:", v12);

  -[HMDAccessorySettingModel setConfigurationVersion:](v7, "setConfigurationVersion:", &unk_1E8B32CD0);
  return v7;
}

- (NSString)name
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (NSString)keyPath
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (int64_t)type
{
  return self->_type;
}

- (unint64_t)properties
{
  return self->_properties;
}

- (HMDAccessorySettingMergeStrategy)mergeStrategy
{
  return (HMDAccessorySettingMergeStrategy *)objc_getProperty(self, a2, 40, 1);
}

- (NSArray)constraints
{
  return (NSArray *)objc_getProperty(self, a2, 48, 1);
}

- (id)value
{
  return objc_getProperty(self, a2, 56, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_value, 0);
  objc_storeStrong((id *)&self->_constraints, 0);
  objc_storeStrong((id *)&self->_mergeStrategy, 0);
  objc_storeStrong((id *)&self->_keyPath, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

+ (id)settingsWithArrayRepresenation:(id)a3 parentKeyPath:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v8 = v5;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v18;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v18 != v11)
          objc_enumerationMutation(v8);
        v13 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * v12);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          +[HMDAccessorySettingMetadata settingWithDictonaryRepresentation:parentKeyPath:](HMDAccessorySettingMetadata, "settingWithDictonaryRepresentation:parentKeyPath:", v13, v6, (_QWORD)v17);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          if (v14)
            objc_msgSend(v7, "addObject:", v14);

        }
        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v10);
  }

  v15 = (void *)objc_msgSend(v7, "copy");
  return v15;
}

+ (id)settingWithDictonaryRepresentation:(id)a3 parentKeyPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  id v20;
  void *v21;
  id v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  HMDAccessorySettingMergeStrategy *v28;
  void *v29;
  HMDAccessorySettingMergeStrategy *v30;
  void *v31;
  void *v32;
  uint64_t v34;
  objc_class *v35;
  void *v36;
  id v37;
  id v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  _BYTE v43[128];
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "hmf_stringForKey:", CFSTR("Key"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    v10 = v8;
    objc_msgSend(v6, "hmf_stringForKey:", CFSTR("Type"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      v12 = HMAccessorySettingTypeFromString();
      objc_msgSend(v6, "hmf_arrayForKey:", CFSTR("Properties"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = v13;
      if (v13)
      {
        v35 = (objc_class *)a1;
        v36 = v11;
        v38 = v7;
        v41 = 0u;
        v42 = 0u;
        v39 = 0u;
        v40 = 0u;
        v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v39, v43, 16);
        v37 = v10;
        v34 = v12;
        if (v15)
        {
          v16 = v15;
          v17 = 0;
          v18 = *(_QWORD *)v40;
          do
          {
            for (i = 0; i != v16; ++i)
            {
              if (*(_QWORD *)v40 != v18)
                objc_enumerationMutation(v14);
              v20 = *(id *)(*((_QWORD *)&v39 + 1) + 8 * i);
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
                v21 = v20;
              else
                v21 = 0;
              v22 = v21;

              v23 = HMAccessorySettingPropertiesFromString();
              v17 |= v23;
            }
            v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v39, v43, 16);
          }
          while (v16);
        }
        else
        {
          v17 = 0;
        }
        v25 = (void *)MEMORY[0x1E0CBA2C0];
        objc_msgSend(v6, "hmf_arrayForKey:", CFSTR("Constraints"));
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "constraintsWithArrayRepresenation:", v26);
        v27 = (void *)objc_claimAutoreleasedReturnValue();

        v28 = [HMDAccessorySettingMergeStrategy alloc];
        objc_msgSend(v6, "valueForKey:", CFSTR("MergeStrategy"));
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v30 = -[HMDAccessorySettingMergeStrategy initWithMergeStrategy:](v28, "initWithMergeStrategy:", v29);

        objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("Value"));
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        +[HMDAccessorySettingMetadata valueWithType:constraints:representation:](HMDAccessorySettingMetadata, "valueWithType:constraints:representation:", v34, v27, v31);
        v32 = (void *)objc_claimAutoreleasedReturnValue();

        v10 = v37;
        v7 = v38;
        v24 = (void *)objc_msgSend([v35 alloc], "initWithName:type:properties:constraints:mergeStrategy:value:parentKeyPath:", v37, v34, v17, v27, v30, v32, v38);

        v11 = v36;
      }
      else
      {
        v24 = 0;
      }

    }
    else
    {
      v24 = 0;
    }

  }
  else
  {
    v24 = 0;
  }

  return v24;
}

+ (id)valueWithType:(int64_t)a3 constraints:(id)a4 representation:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  const char *v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  id v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  void *v24;
  void *v25;
  void *v26;
  char v27;
  void *v28;
  NSObject *v29;
  void *v30;
  void *v31;
  NSObject *v32;
  void *v33;
  id v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  uint8_t buf[4];
  void *v41;
  __int16 v42;
  id v43;
  __int16 v44;
  id v45;
  _BYTE v46[128];
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  v8 = a5;
  v9 = v8;
  switch(a3)
  {
    case 1:
      if (!v8)
        goto LABEL_13;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        goto LABEL_12;
      v10 = (void *)MEMORY[0x1D17BA0A0]();
      HMFGetOSLogHandle();
      v11 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        goto LABEL_42;
      HMFGetLogIdentifier();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v41 = v12;
      v42 = 2112;
      v43 = v9;
      v13 = "%{public}@Invalid data value: %@";
      goto LABEL_41;
    case 2:
      if (!v8)
        goto LABEL_13;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        goto LABEL_12;
      v10 = (void *)MEMORY[0x1D17BA0A0]();
      HMFGetOSLogHandle();
      v11 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        goto LABEL_42;
      HMFGetLogIdentifier();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v41 = v12;
      v42 = 2112;
      v43 = v9;
      v13 = "%{public}@Invalid number value: %@";
      goto LABEL_41;
    case 3:
      if (!v8)
      {
LABEL_13:
        objc_msgSend(MEMORY[0x1E0C99E38], "null");
        v14 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_14;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
LABEL_12:
        v14 = v9;
LABEL_14:
        v15 = v14;
        goto LABEL_44;
      }
      v10 = (void *)MEMORY[0x1D17BA0A0]();
      HMFGetOSLogHandle();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        HMFGetLogIdentifier();
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v41 = v12;
        v42 = 2112;
        v43 = v9;
        v13 = "%{public}@Invalid string value: %@";
LABEL_41:
        _os_log_impl(&dword_1CD062000, v11, OS_LOG_TYPE_DEFAULT, v13, buf, 0x16u);

      }
LABEL_42:

      objc_autoreleasePoolPop(v10);
LABEL_43:
      v15 = 0;
LABEL_44:

      return v15;
    case 4:
      v16 = v8;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v17 = v16;
      else
        v17 = 0;
      v18 = v17;

      if (v18)
      {
        v38 = 0u;
        v39 = 0u;
        v36 = 0u;
        v37 = 0u;
        v35 = v7;
        v19 = v7;
        v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v36, v46, 16);
        if (!v20)
          goto LABEL_30;
        v21 = v20;
        v22 = *(_QWORD *)v37;
        while (1)
        {
          for (i = 0; i != v21; ++i)
          {
            if (*(_QWORD *)v37 != v22)
              objc_enumerationMutation(v19);
            objc_msgSend(*(id *)(*((_QWORD *)&v36 + 1) + 8 * i), "value");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
              v25 = v24;
            else
              v25 = 0;
            v15 = v25;

            objc_msgSend(v15, "title");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            v27 = objc_msgSend(v26, "isEqualToString:", v18);

            if ((v27 & 1) != 0)
            {

LABEL_34:
              v7 = v35;
              goto LABEL_38;
            }

          }
          v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v36, v46, 16);
          if (!v21)
          {
LABEL_30:

            v28 = (void *)MEMORY[0x1D17BA0A0]();
            HMFGetOSLogHandle();
            v29 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
            {
              HMFGetLogIdentifier();
              v30 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543874;
              v41 = v30;
              v42 = 2112;
              v43 = v18;
              v44 = 2112;
              v45 = v19;
              _os_log_impl(&dword_1CD062000, v29, OS_LOG_TYPE_DEFAULT, "%{public}@Invalid item with title '%@', constraints: %@", buf, 0x20u);

            }
            objc_autoreleasePoolPop(v28);
            v15 = 0;
            goto LABEL_34;
          }
        }
      }
      v31 = (void *)MEMORY[0x1D17BA0A0]();
      HMFGetOSLogHandle();
      v32 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
      {
        HMFGetLogIdentifier();
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v41 = v33;
        v42 = 2112;
        v43 = v16;
        _os_log_impl(&dword_1CD062000, v32, OS_LOG_TYPE_DEFAULT, "%{public}@Invalid string value: %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v31);
      v15 = 0;
LABEL_38:

      goto LABEL_44;
    default:
      goto LABEL_43;
  }
}

@end
