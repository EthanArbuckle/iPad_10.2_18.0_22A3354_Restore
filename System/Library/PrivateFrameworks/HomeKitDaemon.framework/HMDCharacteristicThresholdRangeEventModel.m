@implementation HMDCharacteristicThresholdRangeEventModel

+ (id)properties
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __55__HMDCharacteristicThresholdRangeEventModel_properties__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (properties_onceToken_145846 != -1)
    dispatch_once(&properties_onceToken_145846, block);
  return (id)properties__properties_145847;
}

+ (id)eventModelWithDictionary:(id)a3 home:(id)a4 eventTriggerUUID:(id)a5 message:(id)a6 checkForSupport:(BOOL)a7
{
  _BOOL8 v7;
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;

  v7 = a7;
  v11 = a6;
  v12 = a5;
  v13 = a4;
  v14 = a3;
  +[HMDCharacteristicEventBaseModel eventModelWithDictionary:home:eventTriggerUUID:className:message:checkForSupport:outCharateristic:](HMDCharacteristicEventBaseModel, "eventModelWithDictionary:home:eventTriggerUUID:className:message:checkForSupport:outCharateristic:", v14, v13, v12, objc_opt_class(), v11, v7, 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "hmf_numberForKey:", CFSTR("kCharacteristicThresholdRangeEventThresholdRangeMin"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setMin:", v16);

  objc_msgSend(v14, "hmf_numberForKey:", CFSTR("kCharacteristicThresholdRangeEventThresholdRangeMax"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v15, "setMax:", v17);
  return v15;
}

void __55__HMDCharacteristicThresholdRangeEventModel_properties__block_invoke(uint64_t a1)
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
  v9.super_class = (Class)&OBJC_METACLASS___HMDCharacteristicThresholdRangeEventModel;
  objc_msgSendSuper2(&v9, sel_properties);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "dictionaryWithDictionary:", v2);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)properties__properties_145847;
  properties__properties_145847 = v3;

  v5 = (void *)properties__properties_145847;
  v10[0] = CFSTR("min");
  +[HMDBackingStoreModelObjectStorageInfo infoWithClass:](HMDBackingStoreModelObjectStorageInfo, "infoWithClass:", objc_opt_class());
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[1] = CFSTR("max");
  v11[0] = v6;
  +[HMDBackingStoreModelObjectStorageInfo infoWithClass:](HMDBackingStoreModelObjectStorageInfo, "infoWithClass:", objc_opt_class());
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11[1] = v7;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v11, v10, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addEntriesFromDictionary:", v8);

}

+ (Class)cd_entityClass
{
  return (Class)objc_opt_class();
}

@end
