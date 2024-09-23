@implementation HMDSignificantTimeEventModel

+ (id)properties
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __42__HMDSignificantTimeEventModel_properties__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (properties_onceToken_93439 != -1)
    dispatch_once(&properties_onceToken_93439, block);
  return (id)properties__properties_93440;
}

+ (id)eventModelWithDictionary:(id)a3 home:(id)a4 eventTriggerUUID:(id)a5 message:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  void (**v14)(id, void *, _QWORD);
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  objc_msgSend(v9, "dateComponentsFromDataForKey:", CFSTR("kSignificantTimeEventOffset"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (!+[HMDTimeEvent isValidOffsetDateComponents:](HMDTimeEvent, "isValidOffsetDateComponents:", v13))
  {
    objc_msgSend(v12, "responseHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v18)
    {
      v17 = 0;
      goto LABEL_10;
    }
    objc_msgSend(v12, "responseHandler");
    v14 = (void (**)(id, void *, _QWORD))objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 3);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v14[2](v14, v15, 0);
    goto LABEL_7;
  }
  +[HMDEventModel eventModelWithDictionary:home:eventTriggerUUID:className:message:](HMDEventModel, "eventModelWithDictionary:home:eventTriggerUUID:className:message:", v9, v10, v11, objc_opt_class(), v12);
  v14 = (void (**)(id, void *, _QWORD))objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "hmf_stringForKey:", CFSTR("kSignificantTimeEventSignificantEvent"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if ((HMIsValidSignificantEvent() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 3);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "respondWithError:", v19);

LABEL_7:
    v17 = 0;
    goto LABEL_8;
  }
  objc_msgSend(v14, "setSignificantEvent:", v15);
  objc_msgSend(v9, "hmf_dataForKey:", CFSTR("kSignificantTimeEventOffset"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setOffset:", v16);

  v14 = v14;
  v17 = v14;
LABEL_8:

LABEL_10:
  return v17;
}

void __42__HMDSignificantTimeEventModel_properties__block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v9;
  _QWORD v10[2];
  _QWORD v11[3];

  v11[2] = *MEMORY[0x24BDAC8D0];
  v1 = (void *)MEMORY[0x24BDBCED8];
  v9.receiver = *(id *)(a1 + 32);
  v9.super_class = (Class)&OBJC_METACLASS___HMDSignificantTimeEventModel;
  objc_msgSendSuper2(&v9, sel_properties);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "dictionaryWithDictionary:", v2);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)properties__properties_93440;
  properties__properties_93440 = v3;

  v5 = (void *)properties__properties_93440;
  v10[0] = CFSTR("significantEvent");
  +[HMDBackingStoreModelObjectStorageInfo infoWithClass:](HMDBackingStoreModelObjectStorageInfo, "infoWithClass:", objc_opt_class());
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[1] = CFSTR("offset");
  v11[0] = v6;
  +[HMDBackingStoreModelObjectStorageInfo infoWithClass:](HMDBackingStoreModelObjectStorageInfo, "infoWithClass:", objc_opt_class());
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11[1] = v7;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v11, v10, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addEntriesFromDictionary:", v8);

}

- (id)cd_generateValueForModelObjectFromManagedObject:(id)a3 modelObjectField:(id)a4 modelFieldInfo:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  void *v13;
  objc_super v15;

  v8 = a4;
  v9 = a5;
  v10 = a3;
  if (objc_msgSend(v8, "isEqualToString:", CFSTR("offset")))
  {
    objc_msgSend(v10, "offsetSeconds");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    HMDTimeOffsetToDateComponents(objc_msgSend(v11, "integerValue"), 0);
    v10 = (id)objc_claimAutoreleasedReturnValue();

    if (v10)
      objc_msgSend(MEMORY[0x24BDD1618], "archivedDataWithRootObject:requiringSecureCoding:error:", v10, 1, 0);
    else
      objc_msgSend(MEMORY[0x24BDBCEF8], "null");
    v12 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v15.receiver = self;
    v15.super_class = (Class)HMDSignificantTimeEventModel;
    -[HMDBackingStoreModelObject cd_generateValueForModelObjectFromManagedObject:modelObjectField:modelFieldInfo:](&v15, sel_cd_generateValueForModelObjectFromManagedObject_modelObjectField_modelFieldInfo_, v10, v8, v9);
    v12 = objc_claimAutoreleasedReturnValue();
  }
  v13 = (void *)v12;

  return v13;
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
  void *v15;
  objc_super v17;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (objc_msgSend(v9, "isEqualToString:", CFSTR("offset")))
  {
    if (-[HMDBackingStoreModelObject propertyWasSet:](self, "propertyWasSet:", CFSTR("offset")))
    {
      objc_msgSend(MEMORY[0x24BDBCEF8], "null");
      v11 = objc_claimAutoreleasedReturnValue();
LABEL_9:
      v15 = (void *)v11;
      goto LABEL_10;
    }
LABEL_7:
    v15 = 0;
    goto LABEL_10;
  }
  if (!objc_msgSend(v9, "isEqualToString:", CFSTR("offsetSeconds")))
  {
    v17.receiver = self;
    v17.super_class = (Class)HMDSignificantTimeEventModel;
    -[HMDBackingStoreModelObject cd_generateValueForProperty:managedObjectField:context:](&v17, sel_cd_generateValueForProperty_managedObjectField_context_, v8, v9, v10);
    v11 = objc_claimAutoreleasedReturnValue();
    goto LABEL_9;
  }
  if (!-[HMDBackingStoreModelObject propertyWasSet:](self, "propertyWasSet:", CFSTR("offset")))
    goto LABEL_7;
  v12 = (void *)MEMORY[0x24BDD16E0];
  -[HMDSignificantTimeEventModel offset](self, "offset");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "decodeDateComponents");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "numberWithInteger:", HMDTimeOffsetFromDateComponents(v14, 0));
  v15 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_10:
  return v15;
}

+ (Class)cd_entityClass
{
  return (Class)objc_opt_class();
}

@end
