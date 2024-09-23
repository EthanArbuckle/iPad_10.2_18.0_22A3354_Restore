@implementation HMDEventTriggerModel

- (id)createPayload
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)HMDEventTriggerModel;
  -[HMDTriggerModel createPayload](&v12, sel_createPayload);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  -[HMDEventTriggerModel evaluationCondition](self, "evaluationCondition");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[HMDEventTriggerModel evaluationCondition](self, "evaluationCondition");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v6, CFSTR("kEventTriggerConditionKey"));

  }
  -[HMDEventTriggerModel recurrences](self, "recurrences");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[HMDEventTriggerModel recurrences](self, "recurrences");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v8, CFSTR("kEventTriggerRecurrencesKey"));

  }
  -[HMDEventTriggerModel executeOnce](self, "executeOnce");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v9, CFSTR("kEventTriggerExecuteOnce"));

  v10 = (void *)objc_msgSend(v4, "copy");
  return v10;
}

- (id)createPayloadWithCondition:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)HMDEventTriggerModel;
  -[HMDTriggerModel createPayload](&v12, sel_createPayload);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "mutableCopy");

  if (v4)
  {
    objc_msgSend(MEMORY[0x24BDD1618], "archivedDataWithRootObject:requiringSecureCoding:error:", v4, 1, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v7, CFSTR("kEventTriggerConditionKey"));

  }
  -[HMDEventTriggerModel recurrences](self, "recurrences");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v8, CFSTR("kEventTriggerRecurrencesKey"));

  -[HMDEventTriggerModel executeOnce](self, "executeOnce");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v9, CFSTR("kEventTriggerExecuteOnce"));

  v10 = (void *)objc_msgSend(v6, "copy");
  return v10;
}

+ (id)properties
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __34__HMDEventTriggerModel_properties__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (properties_onceToken_43179 != -1)
    dispatch_once(&properties_onceToken_43179, block);
  return (id)properties__properties_43180;
}

void __34__HMDEventTriggerModel_properties__block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v10;
  _QWORD v11[3];
  _QWORD v12[4];

  v12[3] = *MEMORY[0x24BDAC8D0];
  v1 = (void *)MEMORY[0x24BDBCED8];
  v10.receiver = *(id *)(a1 + 32);
  v10.super_class = (Class)&OBJC_METACLASS___HMDEventTriggerModel;
  objc_msgSendSuper2(&v10, sel_properties);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "dictionaryWithDictionary:", v2);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)properties__properties_43180;
  properties__properties_43180 = v3;

  v5 = (void *)properties__properties_43180;
  v11[0] = CFSTR("evaluationCondition");
  +[HMDBackingStoreModelObjectStorageInfo infoWithClass:](HMDBackingStoreModelObjectStorageInfo, "infoWithClass:", objc_opt_class());
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v6;
  v11[1] = CFSTR("recurrences");
  +[HMDBackingStoreModelObjectStorageInfo infoWithClass:](HMDBackingStoreModelObjectStorageInfo, "infoWithClass:", objc_opt_class());
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v12[1] = v7;
  v11[2] = CFSTR("executeOnce");
  +[HMDBackingStoreModelObjectStorageInfo infoWithClass:](HMDBackingStoreModelObjectStorageInfo, "infoWithClass:", objc_opt_class());
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12[2] = v8;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v12, v11, 3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addEntriesFromDictionary:", v9);

}

- (id)cd_generateValueForModelObjectFromManagedObject:(id)a3 modelObjectField:(id)a4 modelFieldInfo:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  objc_super v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (!objc_msgSend(v9, "isEqualToString:", CFSTR("evaluationCondition")))
  {
    if (objc_msgSend(v9, "isEqualToString:", CFSTR("recurrences")))
    {
      objc_msgSend(v8, "recurrenceDays");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "unsignedIntegerValue");

      if (v13)
      {
        v14 = (void *)MEMORY[0x24BDD1618];
        HMDaysOfTheWeekToDateComponents();
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "archivedDataWithRootObject:requiringSecureCoding:error:", v15, 1, 0);
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        goto LABEL_12;
      }
      objc_msgSend(MEMORY[0x24BDBCEF8], "null");
      v17 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v19.receiver = self;
      v19.super_class = (Class)HMDEventTriggerModel;
      -[HMDTriggerModel cd_generateValueForModelObjectFromManagedObject:modelObjectField:modelFieldInfo:](&v19, sel_cd_generateValueForModelObjectFromManagedObject_modelObjectField_modelFieldInfo_, v8, v9, v10);
      v17 = objc_claimAutoreleasedReturnValue();
    }
    v16 = (void *)v17;
    goto LABEL_12;
  }
  objc_msgSend(v8, "evaluationCondition");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
    objc_msgSend(MEMORY[0x24BDD1618], "archivedDataWithRootObject:requiringSecureCoding:error:", v11, 1, 0);
  else
    objc_msgSend(MEMORY[0x24BDBCEF8], "null");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_12:
  return v16;
}

- (id)cd_generateValueForProperty:(id)a3 managedObjectField:(id)a4 context:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  objc_super v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (!objc_msgSend(v9, "isEqualToString:", CFSTR("evaluationCondition")))
  {
    if (objc_msgSend(v9, "isEqualToString:", CFSTR("recurrences")))
    {
      if (!-[HMDBackingStoreModelObject propertyWasSet:](self, "propertyWasSet:", CFSTR("recurrences")))
        goto LABEL_11;
      objc_msgSend(MEMORY[0x24BDBCEF8], "null");
      v12 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (objc_msgSend(v9, "isEqualToString:", CFSTR("recurrenceDays")))
      {
        if (-[HMDBackingStoreModelObject propertyWasSet:](self, "propertyWasSet:", CFSTR("recurrences")))
        {
          v13 = (void *)MEMORY[0x24BDD16E0];
          -[HMDEventTriggerModel recurrences](self, "recurrences");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "decodeArrayOfDateComponents");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "numberWithUnsignedInteger:", HMDaysOfTheWeekFromDateComponents());
          v16 = (void *)objc_claimAutoreleasedReturnValue();

          goto LABEL_16;
        }
LABEL_11:
        v16 = 0;
        goto LABEL_16;
      }
      v18.receiver = self;
      v18.super_class = (Class)HMDEventTriggerModel;
      -[HMDTriggerModel cd_generateValueForProperty:managedObjectField:context:](&v18, sel_cd_generateValueForProperty_managedObjectField_context_, v8, v9, v10);
      v12 = objc_claimAutoreleasedReturnValue();
    }
    v16 = (void *)v12;
    goto LABEL_16;
  }
  if (!-[HMDBackingStoreModelObject propertyWasSet:](self, "propertyWasSet:", CFSTR("evaluationCondition")))
    goto LABEL_11;
  -[HMDEventTriggerModel evaluationCondition](self, "evaluationCondition");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
    +[HMDPredicateUtilities unarchiveFromData:error:](HMDPredicateUtilities, "unarchiveFromData:error:", v11, 0);
  else
    objc_msgSend(MEMORY[0x24BDBCEF8], "null");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_16:
  return v16;
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
