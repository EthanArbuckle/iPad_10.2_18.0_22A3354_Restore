@implementation HMDCharacteristicEventModel

+ (id)properties
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __41__HMDCharacteristicEventModel_properties__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (properties_onceToken_143392 != -1)
    dispatch_once(&properties_onceToken_143392, block);
  return (id)properties__properties_143393;
}

+ (id)eventModelWithDictionary:(id)a3 home:(id)a4 eventTriggerUUID:(id)a5 message:(id)a6 checkForSupport:(BOOL)a7 error:(id *)a8
{
  _BOOL8 v9;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  id v21;
  id v22;
  id v24;
  id v25;

  v9 = a7;
  v13 = a6;
  v14 = a5;
  v15 = a4;
  v16 = a3;
  v25 = 0;
  +[HMDCharacteristicEventBaseModel eventModelWithDictionary:home:eventTriggerUUID:className:message:checkForSupport:outCharateristic:](HMDCharacteristicEventBaseModel, "eventModelWithDictionary:home:eventTriggerUUID:className:message:checkForSupport:outCharateristic:", v16, v15, v14, objc_opt_class(), v13, v9, &v25);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = v25;
  objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("kCharacteristicValue"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  v24 = v19;
  objc_msgSend(v18, "validateValueForNotify:outValue:", v19, &v24);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = v24;
  if (v20)
  {
    v22 = 0;
    if (a8)
      *a8 = objc_retainAutorelease(v20);
  }
  else
  {
    objc_msgSend(v17, "setEventValue:", v21);
    v22 = v17;
  }

  return v22;
}

void __41__HMDCharacteristicEventModel_properties__block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v8;
  const __CFString *v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  v1 = (void *)MEMORY[0x1E0C99E08];
  v8.receiver = *(id *)(a1 + 32);
  v8.super_class = (Class)&OBJC_METACLASS___HMDCharacteristicEventModel;
  objc_msgSendSuper2(&v8, sel_properties);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "dictionaryWithDictionary:", v2);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)properties__properties_143393;
  properties__properties_143393 = v3;

  v5 = (void *)properties__properties_143393;
  v9 = CFSTR("eventValue");
  +[HMDBackingStoreModelObjectStorageInfo infoWithClass:](HMDBackingStoreModelObjectStorageInfo, "infoWithClass:", objc_opt_class());
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, &v9, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addEntriesFromDictionary:", v7);

}

@end
