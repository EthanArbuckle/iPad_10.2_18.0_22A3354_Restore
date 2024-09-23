@implementation HMDHomePersonManagerSettingsModel

- (id)cd_generateValueForModelObjectFromManagedObject:(id)a3 modelObjectField:(id)a4 modelFieldInfo:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;
  objc_super v17;

  v8 = a4;
  v9 = a5;
  v10 = a3;
  if (objc_msgSend(v8, "isEqualToString:", CFSTR("zoneUUIDString")))
  {
    objc_msgSend(v10, "zoneUUID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v11, "UUIDString");
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = (void *)v12;
    v14 = (void *)*MEMORY[0x24BDBD430];
    if (v12)
      v14 = (void *)v12;
    v15 = v14;

  }
  else
  {
    v17.receiver = self;
    v17.super_class = (Class)HMDHomePersonManagerSettingsModel;
    -[HMDBackingStoreModelObject cd_generateValueForModelObjectFromManagedObject:modelObjectField:modelFieldInfo:](&v17, sel_cd_generateValueForModelObjectFromManagedObject_modelObjectField_modelFieldInfo_, v10, v8, v9);
    v15 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v15;
}

- (id)cd_generateValueForProperty:(id)a3 managedObjectField:(id)a4 context:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  objc_super v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (objc_msgSend(v9, "isEqualToString:", CFSTR("zoneUUID")))
  {
    if (-[HMDBackingStoreModelObject propertyWasSet:](self, "propertyWasSet:", CFSTR("zoneUUIDString")))
    {
      -[HMDHomePersonManagerSettingsModel zoneUUID](self, "zoneUUID");
      v11 = objc_claimAutoreleasedReturnValue();
      v12 = (void *)v11;
      v13 = (void *)*MEMORY[0x24BDBD430];
      if (v11)
        v13 = (void *)v11;
      v14 = v13;

    }
    else
    {
      v14 = 0;
    }
  }
  else if (objc_msgSend(v9, "isEqualToString:", CFSTR("home")))
  {
    v15 = (void *)objc_opt_class();
    -[HMDBackingStoreModelObject parentUUID](self, "parentUUID");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "cd_getHomeFromUUID:", v16);
    v14 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v18.receiver = self;
    v18.super_class = (Class)HMDHomePersonManagerSettingsModel;
    -[HMDBackingStoreModelObject cd_generateValueForProperty:managedObjectField:context:](&v18, sel_cd_generateValueForProperty_managedObjectField_context_, v8, v9, v10);
    v14 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v14;
}

+ (Class)cd_entityClass
{
  return (Class)objc_opt_class();
}

- (HMDHomePersonManagerSettingsModel)initWithHomeUUID:(id)a3
{
  id v4;
  void *v5;
  HMDHomePersonManagerSettingsModel *v6;

  v4 = a3;
  objc_msgSend((id)objc_opt_class(), "modelIDForHomeUUID:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[HMDBackingStoreModelObject initWithObjectChangeType:uuid:parentUUID:](self, "initWithObjectChangeType:uuid:parentUUID:", 1, v5, v4);

  return v6;
}

- (NSUUID)zoneUUID
{
  void *v3;
  id v4;
  void *v5;
  void *v6;

  -[HMDHomePersonManagerSettingsModel zoneUUIDString](self, "zoneUUIDString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = objc_alloc(MEMORY[0x24BDD1880]);
    -[HMDHomePersonManagerSettingsModel zoneUUIDString](self, "zoneUUIDString");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_msgSend(v4, "initWithUUIDString:", v5);

  }
  else
  {
    v6 = 0;
  }

  return (NSUUID *)v6;
}

- (void)setZoneUUID:(id)a3
{
  id v4;

  objc_msgSend(a3, "UUIDString");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[HMDHomePersonManagerSettingsModel setZoneUUIDString:](self, "setZoneUUIDString:", v4);

}

- (id)createSettings
{
  id v3;
  void *v4;
  void *v5;

  v3 = objc_alloc_init(MEMORY[0x24BDD7840]);
  -[HMDHomePersonManagerSettingsModel zoneUUID](self, "zoneUUID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setFaceClassificationEnabled:", v4 != 0);

  v5 = (void *)objc_msgSend(v3, "copy");
  return v5;
}

+ (id)properties
{
  if (properties_onceToken_211187 != -1)
    dispatch_once(&properties_onceToken_211187, &__block_literal_global_211188);
  return (id)properties__properties_211189;
}

+ (id)modelIDForHomeUUID:(id)a3
{
  objc_class *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (objc_class *)MEMORY[0x24BDD1880];
  v4 = a3;
  v5 = (void *)objc_msgSend([v3 alloc], "initWithUUIDString:", CFSTR("A9E193D0-2AD8-4F4F-86C1-9BADE1CF3845"));
  v6 = (void *)MEMORY[0x24BDD1880];
  objc_msgSend(v4, "hm_convertToData");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "hmf_UUIDWithNamespace:data:", v5, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)defaultModelForHomeUUID:(id)a3
{
  id v3;
  HMDHomePersonManagerSettingsModel *v4;

  v3 = a3;
  v4 = -[HMDHomePersonManagerSettingsModel initWithHomeUUID:]([HMDHomePersonManagerSettingsModel alloc], "initWithHomeUUID:", v3);

  return v4;
}

void __47__HMDHomePersonManagerSettingsModel_properties__block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;
  const __CFString *v3;
  _QWORD v4[2];

  v4[1] = *MEMORY[0x24BDAC8D0];
  v3 = CFSTR("zoneUUIDString");
  +[HMDBackingStoreModelObjectStorageInfo infoWithClass:](HMDBackingStoreModelObjectStorageInfo, "infoWithClass:", objc_opt_class());
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = v0;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v4, &v3, 1);
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)properties__properties_211189;
  properties__properties_211189 = v1;

}

@end
