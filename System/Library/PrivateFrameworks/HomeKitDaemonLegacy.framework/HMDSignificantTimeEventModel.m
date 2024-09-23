@implementation HMDSignificantTimeEventModel

+ (id)properties
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __42__HMDSignificantTimeEventModel_properties__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (properties_onceToken_65141 != -1)
    dispatch_once(&properties_onceToken_65141, block);
  return (id)properties__properties_65142;
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
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 3);
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
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 3);
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

  v11[2] = *MEMORY[0x1E0C80C00];
  v1 = (void *)MEMORY[0x1E0C99E08];
  v9.receiver = *(id *)(a1 + 32);
  v9.super_class = (Class)&OBJC_METACLASS___HMDSignificantTimeEventModel;
  objc_msgSendSuper2(&v9, sel_properties);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "dictionaryWithDictionary:", v2);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)properties__properties_65142;
  properties__properties_65142 = v3;

  v5 = (void *)properties__properties_65142;
  v10[0] = CFSTR("significantEvent");
  +[HMDBackingStoreModelObjectStorageInfo infoWithClass:](HMDBackingStoreModelObjectStorageInfo, "infoWithClass:", objc_opt_class());
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[1] = CFSTR("offset");
  v11[0] = v6;
  +[HMDBackingStoreModelObjectStorageInfo infoWithClass:](HMDBackingStoreModelObjectStorageInfo, "infoWithClass:", objc_opt_class());
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11[1] = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, v10, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addEntriesFromDictionary:", v8);

}

@end
