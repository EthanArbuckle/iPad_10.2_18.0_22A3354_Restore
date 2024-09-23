@implementation HMDDeviceModel

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
  if (properties_onceToken_157866 != -1)
    dispatch_once(&properties_onceToken_157866, &__block_literal_global_551);
  return (id)properties__properties_157867;
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

  v9[6] = *MEMORY[0x24BDAC8D0];
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
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v9, v8, 6);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)properties__properties_157867;
  properties__properties_157867 = v6;

}

- (id)cd_childrenExcluding:(id)a3 fromContext:(id)a4 error:(id *)a5
{
  void *v5;
  void *v6;

  -[HMDBackingStoreModelObject cd_fetchManagedObjectInContext:error:](self, "cd_fetchManagedObjectInContext:error:", a4, a5);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(MEMORY[0x24BDBCF20], "set");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

+ (NSString)cd_parentReferenceName
{
  return (NSString *)CFSTR("account");
}

+ (Class)cd_entityClass
{
  return (Class)objc_opt_class();
}

@end
