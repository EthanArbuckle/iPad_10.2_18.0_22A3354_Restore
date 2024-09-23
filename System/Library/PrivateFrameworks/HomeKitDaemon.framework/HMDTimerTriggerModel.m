@implementation HMDTimerTriggerModel

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
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  objc_super v18;

  v18.receiver = self;
  v18.super_class = (Class)HMDTimerTriggerModel;
  -[HMDTriggerModel createPayload](&v18, sel_createPayload);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  -[HMDTimerTriggerModel fireDate](self, "fireDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[HMDTimerTriggerModel fireDate](self, "fireDate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v6, CFSTR("kTimerTriggerInitialFireDateKey"));

  }
  -[HMDTimerTriggerModel fireDateTimeZone](self, "fireDateTimeZone");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[HMDTimerTriggerModel fireDateTimeZone](self, "fireDateTimeZone");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v8, CFSTR("kTimerTriggerTimeZoneDataKey"));

  }
  -[HMDTimerTriggerModel fireRepeatInterval](self, "fireRepeatInterval");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    -[HMDTimerTriggerModel fireRepeatInterval](self, "fireRepeatInterval");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v10, CFSTR("kTimerTriggerRecurrenceDataKey"));

  }
  -[HMDTimerTriggerModel recurrences](self, "recurrences");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    -[HMDTimerTriggerModel recurrences](self, "recurrences");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v12, CFSTR("kTimerTriggerRecurrencesKey"));

  }
  -[HMDTimerTriggerModel significantEvent](self, "significantEvent");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    -[HMDTimerTriggerModel significantEvent](self, "significantEvent");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v14, CFSTR("kTimerTriggerSignificantEventKey"));

  }
  -[HMDTimerTriggerModel significantEventOffset](self, "significantEventOffset");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    -[HMDTimerTriggerModel significantEventOffset](self, "significantEventOffset");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v16, CFSTR("kTimerTriggerSignificantEventOffsetKey"));

  }
  return v4;
}

+ (id)properties
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __34__HMDTimerTriggerModel_properties__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (properties_onceToken_38612 != -1)
    dispatch_once(&properties_onceToken_38612, block);
  return (id)properties__properties_38613;
}

void __34__HMDTimerTriggerModel_properties__block_invoke(uint64_t a1)
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
  void *v10;
  void *v11;
  void *v12;
  objc_super v13;
  _QWORD v14[6];
  _QWORD v15[7];

  v15[6] = *MEMORY[0x24BDAC8D0];
  v1 = (void *)MEMORY[0x24BDBCED8];
  v13.receiver = *(id *)(a1 + 32);
  v13.super_class = (Class)&OBJC_METACLASS___HMDTimerTriggerModel;
  objc_msgSendSuper2(&v13, sel_properties);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "dictionaryWithDictionary:", v2);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)properties__properties_38613;
  properties__properties_38613 = v3;

  v5 = (void *)properties__properties_38613;
  v14[0] = CFSTR("fireDate");
  +[HMDBackingStoreModelObjectStorageInfo infoWithClass:](HMDBackingStoreModelObjectStorageInfo, "infoWithClass:", objc_opt_class());
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v6;
  v14[1] = CFSTR("fireDateTimeZone");
  +[HMDBackingStoreModelObjectStorageInfo infoWithClass:](HMDBackingStoreModelObjectStorageInfo, "infoWithClass:", objc_opt_class());
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v15[1] = v7;
  v14[2] = CFSTR("significantEvent");
  +[HMDBackingStoreModelObjectStorageInfo infoWithClass:](HMDBackingStoreModelObjectStorageInfo, "infoWithClass:", objc_opt_class());
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v15[2] = v8;
  v14[3] = CFSTR("significantEventOffset");
  +[HMDBackingStoreModelObjectStorageInfo infoWithClass:](HMDBackingStoreModelObjectStorageInfo, "infoWithClass:", objc_opt_class());
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v15[3] = v9;
  v14[4] = CFSTR("fireRepeatInterval");
  +[HMDBackingStoreModelObjectStorageInfo infoWithClass:](HMDBackingStoreModelObjectStorageInfo, "infoWithClass:", objc_opt_class());
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v15[4] = v10;
  v14[5] = CFSTR("recurrences");
  +[HMDBackingStoreModelObjectStorageInfo infoWithClass:](HMDBackingStoreModelObjectStorageInfo, "infoWithClass:", objc_opt_class());
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v15[5] = v11;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v15, v14, 6);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addEntriesFromDictionary:", v12);

}

- (id)cd_generateValueForModelObjectFromManagedObject:(id)a3 modelObjectField:(id)a4 modelFieldInfo:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v21;
  objc_super v22;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (objc_msgSend(v9, "isEqualToString:", CFSTR("fireDateTimeZone")))
  {
    objc_msgSend(v8, "fireDateTimeZone");
    v11 = objc_claimAutoreleasedReturnValue();
    goto LABEL_5;
  }
  if (objc_msgSend(v9, "isEqualToString:", CFSTR("fireRepeatInterval")))
  {
    objc_msgSend(v8, "fireRepeatInterval");
    v11 = objc_claimAutoreleasedReturnValue();
LABEL_5:
    v12 = (void *)v11;
    if (v11)
    {
LABEL_6:
      objc_msgSend(MEMORY[0x24BDD1618], "archivedDataWithRootObject:requiringSecureCoding:error:", v12, 1, 0);
      v13 = objc_claimAutoreleasedReturnValue();
LABEL_13:
      v18 = (void *)v13;

      goto LABEL_14;
    }
LABEL_12:
    objc_msgSend(MEMORY[0x24BDBCEF8], "null");
    v13 = objc_claimAutoreleasedReturnValue();
    goto LABEL_13;
  }
  if (!objc_msgSend(v9, "isEqualToString:", CFSTR("recurrences")))
  {
    if (objc_msgSend(v9, "isEqualToString:", CFSTR("significantEventOffset")))
    {
      objc_msgSend(v8, "significantEventOffsetSeconds");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      HMDTimeOffsetToDateComponents(objc_msgSend(v19, "integerValue"), 0);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      if (v12)
        goto LABEL_6;
      goto LABEL_12;
    }
    v22.receiver = self;
    v22.super_class = (Class)HMDTimerTriggerModel;
    -[HMDTriggerModel cd_generateValueForModelObjectFromManagedObject:modelObjectField:modelFieldInfo:](&v22, sel_cd_generateValueForModelObjectFromManagedObject_modelObjectField_modelFieldInfo_, v8, v9, v10);
    v21 = objc_claimAutoreleasedReturnValue();
LABEL_17:
    v18 = (void *)v21;
    goto LABEL_14;
  }
  objc_msgSend(v8, "recurrenceDays");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "unsignedIntegerValue");

  if (!v15)
  {
    objc_msgSend(MEMORY[0x24BDBCEF8], "null");
    v21 = objc_claimAutoreleasedReturnValue();
    goto LABEL_17;
  }
  v16 = (void *)MEMORY[0x24BDD1618];
  HMDaysOfTheWeekToDateComponents();
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "archivedDataWithRootObject:requiringSecureCoding:error:", v17, 1, 0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_14:
  return v18;
}

- (id)cd_generateValueForProperty:(id)a3 managedObjectField:(id)a4 context:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  const __CFString *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  objc_super v24;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (objc_msgSend(v9, "isEqualToString:", CFSTR("fireDateTimeZone")))
  {
    if (-[HMDBackingStoreModelObject propertyWasSet:](self, "propertyWasSet:", CFSTR("fireDateTimeZone")))
    {
      -[HMDTimerTriggerModel fireDateTimeZone](self, "fireDateTimeZone");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = v11;
      if (v11)
      {
        objc_msgSend(v11, "decodeTimeZone");
        v13 = objc_claimAutoreleasedReturnValue();
LABEL_15:
        v17 = (void *)v13;

        goto LABEL_26;
      }
      goto LABEL_14;
    }
    goto LABEL_25;
  }
  if (objc_msgSend(v9, "isEqualToString:", CFSTR("fireRepeatInterval")))
  {
    if (-[HMDBackingStoreModelObject propertyWasSet:](self, "propertyWasSet:", CFSTR("fireRepeatInterval")))
    {
      -[HMDTimerTriggerModel fireRepeatInterval](self, "fireRepeatInterval");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = v14;
      if (v14)
      {
        objc_msgSend(v14, "decodeDateComponents");
        v13 = objc_claimAutoreleasedReturnValue();
        goto LABEL_15;
      }
LABEL_14:
      objc_msgSend(MEMORY[0x24BDBCEF8], "null");
      v13 = objc_claimAutoreleasedReturnValue();
      goto LABEL_15;
    }
LABEL_25:
    v17 = 0;
    goto LABEL_26;
  }
  if (!objc_msgSend(v9, "isEqualToString:", CFSTR("recurrences")))
  {
    if (objc_msgSend(v9, "isEqualToString:", CFSTR("recurrenceDays")))
    {
      if (!-[HMDBackingStoreModelObject propertyWasSet:](self, "propertyWasSet:", CFSTR("recurrences")))
        goto LABEL_25;
      v18 = (void *)MEMORY[0x24BDD16E0];
      -[HMDTimerTriggerModel recurrences](self, "recurrences");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "decodeArrayOfDateComponents");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "numberWithUnsignedInteger:", HMDaysOfTheWeekFromDateComponents());
      v21 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (objc_msgSend(v9, "isEqualToString:", CFSTR("significantEventOffset")))
      {
        v15 = CFSTR("significantEventOffset");
        goto LABEL_11;
      }
      if (!objc_msgSend(v9, "isEqualToString:", CFSTR("significantEventOffsetSeconds")))
      {
        v24.receiver = self;
        v24.super_class = (Class)HMDTimerTriggerModel;
        -[HMDTriggerModel cd_generateValueForProperty:managedObjectField:context:](&v24, sel_cd_generateValueForProperty_managedObjectField_context_, v8, v9, v10);
        v16 = objc_claimAutoreleasedReturnValue();
        goto LABEL_13;
      }
      if (!-[HMDBackingStoreModelObject propertyWasSet:](self, "propertyWasSet:", CFSTR("significantEventOffset")))
        goto LABEL_25;
      v22 = (void *)MEMORY[0x24BDD16E0];
      -[HMDTimerTriggerModel significantEventOffset](self, "significantEventOffset");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "decodeDateComponents");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "numberWithInteger:", HMDTimeOffsetFromDateComponents(v20, 0));
      v21 = objc_claimAutoreleasedReturnValue();
    }
    v17 = (void *)v21;

    goto LABEL_26;
  }
  v15 = CFSTR("recurrences");
LABEL_11:
  if (!-[HMDBackingStoreModelObject propertyWasSet:](self, "propertyWasSet:", v15))
    goto LABEL_25;
  objc_msgSend(MEMORY[0x24BDBCEF8], "null");
  v16 = objc_claimAutoreleasedReturnValue();
LABEL_13:
  v17 = (void *)v16;
LABEL_26:

  return v17;
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
