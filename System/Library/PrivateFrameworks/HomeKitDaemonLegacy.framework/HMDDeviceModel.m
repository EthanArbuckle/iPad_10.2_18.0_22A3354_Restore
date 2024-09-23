@implementation HMDDeviceModel

- (NSArray)deviceHandles
{
  HMDDeviceModel *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  id v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  HMDDeviceModel *v18;
  NSObject *v19;
  void *v20;
  HMDDeviceModel *v21;
  void *v22;
  id v24;
  uint64_t v25;
  uint64_t v26;
  id v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  uint8_t buf[4];
  void *v33;
  __int16 v34;
  id v35;
  _BYTE v36[128];
  uint64_t v37;

  v2 = self;
  v37 = *MEMORY[0x1E0C80C00];
  -[HMDDeviceModel handles](self, "handles");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "copy");

  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v4, "count"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v6 = v4;
  v26 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
  if (v26)
  {
    v7 = *(_QWORD *)v29;
    v24 = v6;
    v25 = *(_QWORD *)v29;
    do
    {
      for (i = 0; i != v26; ++i)
      {
        if (*(_QWORD *)v29 != v7)
          objc_enumerationMutation(v6);
        v9 = *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * i);
        v10 = (void *)MEMORY[0x1E0CB3710];
        v11 = objc_opt_class();
        v27 = 0;
        objc_msgSend(v10, "unarchivedObjectOfClass:fromData:error:", v11, v9, &v27);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = v27;
        v14 = v12;
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v15 = v14;
        else
          v15 = 0;
        v16 = v15;

        if (v16)
        {
          objc_msgSend(v5, "addObject:", v16);
        }
        else
        {
          v17 = (void *)MEMORY[0x1D17BA0A0]();
          v18 = v2;
          HMFGetOSLogHandle();
          v19 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
          {
            HMFGetLogIdentifier();
            v20 = v5;
            v21 = v2;
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v33 = v22;
            v34 = 2112;
            v35 = v13;
            _os_log_impl(&dword_1CD062000, v19, OS_LOG_TYPE_ERROR, "%{public}@Failed to unarchive device handle from handle array: %@", buf, 0x16u);

            v2 = v21;
            v5 = v20;
            v6 = v24;
          }

          objc_autoreleasePoolPop(v17);
          v7 = v25;
        }

      }
      v26 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
    }
    while (v26);
  }

  return (NSArray *)v5;
}

- (BOOL)diff:(id)a3 differingFields:(id *)a4
{
  id v6;
  unsigned int v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  uint64_t v17;
  BOOL v18;
  objc_super v20;
  id v21;

  v6 = a3;
  v20.receiver = self;
  v20.super_class = (Class)HMDDeviceModel;
  v21 = 0;
  v7 = -[HMDBackingStoreModelObject diff:differingFields:](&v20, sel_diff_differingFields_, v6, &v21);
  v8 = v21;
  v9 = v8;
  if (v7 && objc_msgSend(v8, "containsObject:", CFSTR("handles")))
  {
    v10 = v6;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v11 = v10;
    else
      v11 = 0;
    v12 = v11;

    if (v12)
    {
      -[HMDDeviceModel deviceHandles](self, "deviceHandles");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "deviceHandles");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = isEqualDeepCompare(v13, v14);

      if (v15)
      {
        v16 = (void *)objc_msgSend(v9, "mutableCopy");
        objc_msgSend(v16, "removeObject:", CFSTR("handles"));
        v17 = objc_msgSend(v16, "copy");

        v9 = (void *)v17;
      }
    }

  }
  if (a4)
    *a4 = objc_retainAutorelease(v9);
  v18 = objc_msgSend(v9, "count") != 0;

  return v18;
}

+ (id)schemaHashRoot
{
  return (id)objc_msgSend(CFSTR("6D8998A8-13E4-4269-83B8-672645AE2D15"), "copy");
}

+ (id)properties
{
  if (properties_onceToken_113625 != -1)
    dispatch_once(&properties_onceToken_113625, &__block_literal_global_326);
  return (id)properties__properties_113626;
}

void __28__HMDDeviceModel_properties__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  _QWORD v8[6];
  _QWORD v9[7];

  v9[6] = *MEMORY[0x1E0C80C00];
  v8[0] = CFSTR("identifier");
  +[HMDBackingStoreModelObjectStorageInfo infoWithClass:](HMDBackingStoreModelObjectStorageInfo, "infoWithClass:", objc_opt_class());
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v0;
  v8[1] = CFSTR("handles");
  +[HMDBackingStoreModelObjectStorageInfo infoWithClass:](HMDBackingStoreModelObjectStorageInfo, "infoWithClass:", objc_opt_class());
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v9[1] = v1;
  v8[2] = CFSTR("name");
  +[HMDBackingStoreModelObjectStorageInfo infoWithClass:](HMDBackingStoreModelObjectStorageInfo, "infoWithClass:", objc_opt_class());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v9[2] = v2;
  v8[3] = CFSTR("version");
  +[HMDBackingStoreModelObjectStorageInfo infoWithClass:](HMDBackingStoreModelObjectStorageInfo, "infoWithClass:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v9[3] = v3;
  v8[4] = CFSTR("productInfo");
  +[HMDBackingStoreModelObjectStorageInfo infoWithClass:](HMDBackingStoreModelObjectStorageInfo, "infoWithClass:", objc_opt_class());
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9[4] = v4;
  v8[5] = CFSTR("rpIdentity");
  +[HMDBackingStoreModelObjectStorageInfo infoWithClass:](HMDBackingStoreModelObjectStorageInfo, "infoWithClass:", objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[5] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, v8, 6);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)properties__properties_113626;
  properties__properties_113626 = v6;

}

@end
