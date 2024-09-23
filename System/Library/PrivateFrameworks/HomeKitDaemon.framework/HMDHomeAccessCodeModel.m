@implementation HMDHomeAccessCodeModel

- (HMDHomeAccessCodeModel)initWithHomeUUID:(id)a3 value:(id)a4 label:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  HMDHomeAccessCodeModel *v12;
  void *v13;

  v8 = a4;
  v9 = a5;
  v10 = a3;
  +[HMDHomeAccessCodeModel modelUUIDForHomeUUID:accessCodeValue:](HMDHomeAccessCodeModel, "modelUUIDForHomeUUID:accessCodeValue:", v10, v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[HMDBackingStoreModelObject initWithObjectChangeType:uuid:parentUUID:](self, "initWithObjectChangeType:uuid:parentUUID:", 1, v11, v10);

  if (v12)
  {
    -[HMDHomeAccessCodeModel setValue:](v12, "setValue:", v8);
    -[HMDHomeAccessCodeModel setLabel:](v12, "setLabel:", v9);
    objc_msgSend(MEMORY[0x24BDD1880], "UUID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDHomeAccessCodeModel setHh2ModelID:](v12, "setHh2ModelID:", v13);

  }
  return v12;
}

+ (id)properties
{
  if (properties_onceToken_148904 != -1)
    dispatch_once(&properties_onceToken_148904, &__block_literal_global_148905);
  return (id)properties__properties_148906;
}

+ (id)modelUUIDForHomeUUID:(id)a3 accessCodeValue:(id)a4
{
  void *v5;
  id v6;
  void *v7;
  void *v8;

  v5 = (void *)MEMORY[0x24BDD1880];
  v6 = a3;
  objc_msgSend(a4, "dataUsingEncoding:", 4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "hmf_UUIDWithNamespace:data:", v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

void __36__HMDHomeAccessCodeModel_properties__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  uint64_t v3;
  void *v4;
  _QWORD v5[3];
  _QWORD v6[4];

  v6[3] = *MEMORY[0x24BDAC8D0];
  v5[0] = CFSTR("label");
  +[HMDBackingStoreModelObjectStorageInfo infoWithClass:logging:](HMDBackingStoreModelObjectStorageInfo, "infoWithClass:logging:", objc_opt_class(), 3);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = v0;
  v5[1] = CFSTR("value");
  +[HMDBackingStoreModelObjectStorageInfo infoWithClass:logging:](HMDBackingStoreModelObjectStorageInfo, "infoWithClass:logging:", objc_opt_class(), 3);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v6[1] = v1;
  v5[2] = CFSTR("hh2ModelID");
  +[HMDBackingStoreModelObjectStorageInfo infoWithClass:](HMDBackingStoreModelObjectStorageInfo, "infoWithClass:", objc_opt_class());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6[2] = v2;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v6, v5, 3);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)properties__properties_148906;
  properties__properties_148906 = v3;

}

- (id)cd_generateValueForModelObjectFromManagedObject:(id)a3 modelObjectField:(id)a4 modelFieldInfo:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  objc_super v14;

  v8 = a4;
  v9 = a5;
  v10 = a3;
  if (objc_msgSend(v8, "isEqualToString:", CFSTR("value")))
  {
    objc_msgSend(v10, "accessCode");
    v11 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v14.receiver = self;
    v14.super_class = (Class)HMDHomeAccessCodeModel;
    -[HMDBackingStoreModelObject cd_generateValueForModelObjectFromManagedObject:modelObjectField:modelFieldInfo:](&v14, sel_cd_generateValueForModelObjectFromManagedObject_modelObjectField_modelFieldInfo_, v10, v8, v9);
    v11 = objc_claimAutoreleasedReturnValue();
  }
  v12 = (void *)v11;

  return v12;
}

- (id)cd_generateValueForProperty:(id)a3 managedObjectField:(id)a4 context:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;
  objc_super v15;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (objc_msgSend(v9, "isEqualToString:", CFSTR("accessCode")))
  {
    if (-[HMDBackingStoreModelObject propertyWasSet:](self, "propertyWasSet:", CFSTR("value")))
    {
      -[HMDHomeAccessCodeModel value](self, "value");
      v11 = objc_claimAutoreleasedReturnValue();
LABEL_10:
      v13 = (void *)v11;
      goto LABEL_11;
    }
    v13 = 0;
  }
  else
  {
    if (!objc_msgSend(v9, "isEqualToString:", CFSTR("home")))
    {
      if (objc_msgSend(v9, "isEqualToString:", CFSTR("modelID")))
      {
        -[HMDBackingStoreModelObject uuid](self, "uuid");
        v11 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v15.receiver = self;
        v15.super_class = (Class)HMDHomeAccessCodeModel;
        -[HMDBackingStoreModelObject cd_generateValueForProperty:managedObjectField:context:](&v15, sel_cd_generateValueForProperty_managedObjectField_context_, v8, v9, v10);
        v11 = objc_claimAutoreleasedReturnValue();
      }
      goto LABEL_10;
    }
    -[HMDBackingStoreModelObject parentUUID](self, "parentUUID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    +[HMDHomeModel cd_getHomeFromUUID:](HMDHomeModel, "cd_getHomeFromUUID:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

  }
LABEL_11:

  return v13;
}

+ (NSString)cd_parentReferenceName
{
  return (NSString *)CFSTR("home");
}

+ (Class)cd_entityClass
{
  return (Class)objc_opt_class();
}

@end
