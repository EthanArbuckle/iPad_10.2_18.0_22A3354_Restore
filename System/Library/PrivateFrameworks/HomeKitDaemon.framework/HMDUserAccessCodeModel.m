@implementation HMDUserAccessCodeModel

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
    v14.super_class = (Class)HMDUserAccessCodeModel;
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
  void *v14;
  objc_super v16;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (objc_msgSend(v9, "isEqualToString:", CFSTR("accessCode")))
  {
    if (-[HMDBackingStoreModelObject propertyWasSet:](self, "propertyWasSet:", CFSTR("value")))
    {
      -[HMDUserAccessCodeModel value](self, "value");
      v11 = objc_claimAutoreleasedReturnValue();
LABEL_10:
      v14 = (void *)v11;
      goto LABEL_11;
    }
    v14 = 0;
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
        v16.receiver = self;
        v16.super_class = (Class)HMDUserAccessCodeModel;
        -[HMDBackingStoreModelObject cd_generateValueForProperty:managedObjectField:context:](&v16, sel_cd_generateValueForProperty_managedObjectField_context_, v8, v9, v10);
        v11 = objc_claimAutoreleasedReturnValue();
      }
      goto LABEL_10;
    }
    -[HMDBackingStoreModelObject parentUUID](self, "parentUUID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    +[HMDUserModel cd_getMKFUserFromUUID:](HMDUserModel, "cd_getMKFUserFromUUID:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v13, "home");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

  }
LABEL_11:

  return v14;
}

- (void)cd_populateParentRelationshipInContext:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  char v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  const __CFString *v13;
  uint64_t v14;
  objc_super v15;
  objc_super v16;
  objc_super v17;

  v6 = a3;
  +[HMDCoreData featuresDataSource](HMDCoreData, "featuresDataSource");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isRestrictedGuestEnabled");

  if ((v8 & 1) != 0)
  {
    v16.receiver = self;
    v16.super_class = (Class)HMDUserAccessCodeModel;
    -[HMDBackingStoreModelObject cd_fetchParentForManagedObjectUsingParentReferenceName:error:](&v16, sel_cd_fetchParentForManagedObjectUsingParentReferenceName_error_, CFSTR("user"), a4);
    v9 = objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      v10 = (void *)v9;
      -[HMDBackingStoreModelObject managedObject](self, "managedObject");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = v11;
      v13 = CFSTR("user");
LABEL_7:
      objc_msgSend(v11, "setValue:forKey:", v10, v13);

      goto LABEL_8;
    }
    v15.receiver = self;
    v15.super_class = (Class)HMDUserAccessCodeModel;
    -[HMDBackingStoreModelObject cd_fetchParentForManagedObjectUsingParentReferenceName:error:](&v15, sel_cd_fetchParentForManagedObjectUsingParentReferenceName_error_, CFSTR("guest"), a4);
    v14 = objc_claimAutoreleasedReturnValue();
    if (v14)
    {
      v10 = (void *)v14;
      -[HMDBackingStoreModelObject managedObject](self, "managedObject");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = v11;
      v13 = CFSTR("guest");
      goto LABEL_7;
    }
  }
  else
  {
    v17.receiver = self;
    v17.super_class = (Class)HMDUserAccessCodeModel;
    -[HMDBackingStoreModelObject cd_populateParentRelationshipInContext:error:](&v17, sel_cd_populateParentRelationshipInContext_error_, v6, a4);
  }
LABEL_8:

}

+ (NSString)cd_parentReferenceName
{
  return (NSString *)CFSTR("user");
}

+ (Class)cd_entityClass
{
  return (Class)objc_opt_class();
}

+ (id)properties
{
  if (properties_onceToken_179316 != -1)
    dispatch_once(&properties_onceToken_179316, &__block_literal_global_179317);
  return (id)properties__properties_179318;
}

+ (id)modelUUIDWithUUID:(id)a3
{
  objc_class *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (objc_class *)MEMORY[0x24BDD1880];
  v4 = a3;
  v5 = (void *)objc_msgSend([v3 alloc], "initWithUUIDString:", CFSTR("9DB6E60C-3E4F-44A3-94F6-14DB51D3E800"));
  v6 = (void *)MEMORY[0x24BDD1880];
  objc_msgSend(v4, "hm_convertToData");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "hmf_UUIDWithNamespace:data:", v5, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

void __36__HMDUserAccessCodeModel_properties__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  uint64_t v3;
  void *v4;
  _QWORD v5[3];
  _QWORD v6[4];

  v6[3] = *MEMORY[0x24BDAC8D0];
  v5[0] = CFSTR("value");
  +[HMDBackingStoreModelObjectStorageInfo infoWithClass:logging:](HMDBackingStoreModelObjectStorageInfo, "infoWithClass:logging:", objc_opt_class(), 3);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = v0;
  v5[1] = CFSTR("changedByUserUUID");
  +[HMDBackingStoreModelObjectStorageInfo infoWithClass:](HMDBackingStoreModelObjectStorageInfo, "infoWithClass:", objc_opt_class());
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v6[1] = v1;
  v5[2] = CFSTR("hh2ModelID");
  +[HMDBackingStoreModelObjectStorageInfo infoWithClass:](HMDBackingStoreModelObjectStorageInfo, "infoWithClass:", objc_opt_class());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6[2] = v2;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v6, v5, 3);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)properties__properties_179318;
  properties__properties_179318 = v3;

}

- (HMDUserAccessCodeModel)initWithUserUUID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  HMDUserAccessCodeModel *v7;

  v4 = a3;
  objc_msgSend((id)objc_opt_class(), "modelUUIDWithUUID:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1880], "UUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDUserAccessCodeModel setHh2ModelID:](self, "setHh2ModelID:", v6);

  v7 = -[HMDBackingStoreModelObject initWithObjectChangeType:uuid:parentUUID:](self, "initWithObjectChangeType:uuid:parentUUID:", 1, v5, v4);
  return v7;
}

@end
