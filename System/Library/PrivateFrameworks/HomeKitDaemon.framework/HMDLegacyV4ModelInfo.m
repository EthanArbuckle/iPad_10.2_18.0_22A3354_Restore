@implementation HMDLegacyV4ModelInfo

- (HMDLegacyV4ModelInfo)initWithClass:(Class)a3
{
  HMDLegacyV4ModelInfo *v4;
  HMDLegacyV4ModelInfo *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  NSString *hmdTypeName;
  uint64_t v10;
  NSString *v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  NSDictionary *properties;
  _QWORD v18[4];
  id v19;
  objc_super v20;

  v20.receiver = self;
  v20.super_class = (Class)HMDLegacyV4ModelInfo;
  v4 = -[HMDLegacyV4ModelInfo init](&v20, sel_init);
  v5 = v4;
  if (v4)
  {
    objc_storeStrong((id *)&v4->_hmdModelClass, a3);
    +[HMDBackingStoreSingleton sharedInstance](HMDBackingStoreSingleton, "sharedInstance");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "classToNameTransform");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKey:", a3);
    v8 = objc_claimAutoreleasedReturnValue();
    hmdTypeName = v5->_hmdTypeName;
    v5->_hmdTypeName = (NSString *)v8;

    if (!v5->_hmdTypeName)
    {
      NSStringFromClass(a3);
      v10 = objc_claimAutoreleasedReturnValue();
      v11 = v5->_hmdTypeName;
      v5->_hmdTypeName = (NSString *)v10;

    }
    -[objc_class properties](a3, "properties");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithCapacity:", objc_msgSend(v12, "count"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = MEMORY[0x24BDAC760];
    v18[1] = 3221225472;
    v18[2] = __38__HMDLegacyV4ModelInfo_initWithClass___block_invoke;
    v18[3] = &unk_24E777608;
    v19 = v13;
    v14 = v13;
    objc_msgSend(v12, "enumerateKeysAndObjectsUsingBlock:", v18);
    v15 = objc_msgSend(v14, "copy");
    properties = v5->_properties;
    v5->_properties = (NSDictionary *)v15;

  }
  return v5;
}

- (NSString)hmdTypeName
{
  return self->_hmdTypeName;
}

- (NSDictionary)properties
{
  return self->_properties;
}

- (Class)hmdModelClass
{
  return self->_hmdModelClass;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hmdModelClass, 0);
  objc_storeStrong((id *)&self->_properties, 0);
  objc_storeStrong((id *)&self->_hmdTypeName, 0);
}

void __38__HMDLegacyV4ModelInfo_initWithClass___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;

  v19 = a3;
  v5 = a2;
  v6 = objc_msgSend(v19, "classObj");
  if (v6 == objc_opt_class())
  {
    v9 = *(void **)(a1 + 32);
    objc_msgSend(MEMORY[0x24BE4ECB8], "deprecatedField");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKey:", v10, v5);
  }
  else
  {
    v7 = objc_msgSend(v19, "logging");
    if (v7 > 3)
      v8 = 0;
    else
      v8 = qword_2226A05C8[v7];
    +[HMDBackingStoreModelObjectStorageInfo deprecatedField](HMDBackingStoreModelObjectStorageInfo, "deprecatedField");
    v11 = (id)objc_claimAutoreleasedReturnValue();

    if (v11 == v19)
    {
      objc_msgSend(MEMORY[0x24BE4ECB8], "deprecatedField");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v12, "classObj");

    }
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BE4ED08], "fieldWithClass:options:", v6, v10);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "readOnly");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setReadonlyVersion:", v14);

    objc_msgSend(v19, "unavailable");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setUnavailableVersion:", v15);

    objc_msgSend(v19, "defaultValue");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setDefaultValue:", v16);

    objc_msgSend(v13, "setLoggingVisibility:", v8);
    v17 = *(void **)(a1 + 32);
    v18 = (void *)objc_msgSend(v13, "copy");
    objc_msgSend(v17, "setObject:forKey:", v18, v5);

    v5 = v13;
  }

}

@end
