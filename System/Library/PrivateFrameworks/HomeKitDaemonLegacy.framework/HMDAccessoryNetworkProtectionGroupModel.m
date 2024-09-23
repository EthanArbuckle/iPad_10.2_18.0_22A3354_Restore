@implementation HMDAccessoryNetworkProtectionGroupModel

+ (id)modelNamespace
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", CFSTR("3FFD3711-E751-4F46-A74F-4F0B4E877E8F"));
}

+ (id)modelIDForHome:(id)a3 manufacturer:(id)a4 category:(id)a5
{
  objc_class *v7;
  id v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v22;

  v7 = (objc_class *)MEMORY[0x1E0C99DF0];
  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = objc_alloc_init(v7);
  objc_msgSend(MEMORY[0x1E0C99DF0], "dataWithLength:", 16);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "uuid");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = objc_retainAutorelease(v12);
  objc_msgSend(v13, "getUUIDBytes:", objc_msgSend(v14, "mutableBytes"));
  objc_msgSend(v11, "appendData:", v14);
  v15 = objc_msgSend(v8, "unsignedIntegerValue");

  v22 = v15;
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", &v22, 8);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "appendData:", v16);
  objc_msgSend(v9, "dataUsingEncoding:", 4);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "appendData:", v17);
  v18 = (void *)MEMORY[0x1E0CB3A28];
  objc_msgSend((id)objc_opt_class(), "modelNamespace");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "hmf_UUIDWithNamespace:data:", v19, v11);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  return v20;
}

+ (id)properties
{
  if (properties_onceToken_129597 != -1)
    dispatch_once(&properties_onceToken_129597, &__block_literal_global_129598);
  return (id)properties__properties_129599;
}

+ (id)shortDescription
{
  objc_class *v2;

  v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

void __53__HMDAccessoryNetworkProtectionGroupModel_properties__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  _QWORD v6[4];
  _QWORD v7[5];

  v7[4] = *MEMORY[0x1E0C80C00];
  v6[0] = CFSTR("manufacturer");
  +[HMDBackingStoreModelObjectStorageInfo infoWithClass:](HMDBackingStoreModelObjectStorageInfo, "infoWithClass:", objc_opt_class());
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = v0;
  v6[1] = CFSTR("categoryIdentifier");
  +[HMDBackingStoreModelObjectStorageInfo deprecatedField](HMDBackingStoreModelObjectStorageInfo, "deprecatedField");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v7[1] = v1;
  v6[2] = CFSTR("category");
  +[HMDBackingStoreModelObjectStorageInfo infoWithClass:](HMDBackingStoreModelObjectStorageInfo, "infoWithClass:", objc_opt_class());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v7[2] = v2;
  v6[3] = CFSTR("targetProtectionMode");
  +[HMDBackingStoreModelObjectStorageInfo infoWithClass:](HMDBackingStoreModelObjectStorageInfo, "infoWithClass:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[3] = v3;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, v6, 4);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)properties__properties_129599;
  properties__properties_129599 = v4;

}

- (id)shortDescription
{
  return (id)objc_msgSend((id)objc_opt_class(), "shortDescription");
}

- (id)attributeDescriptions
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v19;
  _QWORD v20[6];

  v20[5] = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc(MEMORY[0x1E0D28548]);
  -[HMDBackingStoreModelObject uuid](self, "uuid");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "initWithName:value:", CFSTR("uuid"), v19);
  v20[0] = v4;
  v5 = objc_alloc(MEMORY[0x1E0D28548]);
  -[HMDBackingStoreModelObject bsoDataVersion](self, "bsoDataVersion");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v5, "initWithName:value:", CFSTR("version"), v6);
  v20[1] = v7;
  v8 = objc_alloc(MEMORY[0x1E0D28548]);
  -[HMDAccessoryNetworkProtectionGroupModel manufacturer](self, "manufacturer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v8, "initWithName:value:", CFSTR("manufacturer"), v9);
  v20[2] = v10;
  v11 = objc_alloc(MEMORY[0x1E0D28548]);
  -[HMDAccessoryNetworkProtectionGroupModel category](self, "category");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v11, "initWithName:value:", CFSTR("category"), v12);
  v20[3] = v13;
  v14 = objc_alloc(MEMORY[0x1E0D28548]);
  -[HMDAccessoryNetworkProtectionGroupModel targetProtectionMode](self, "targetProtectionMode");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)objc_msgSend(v14, "initWithName:value:", CFSTR("targetProtectionMode"), v15);
  v20[4] = v16;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v20, 5);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

@end
