@implementation HMDSharedUserDataModel

+ (id)hmbProperties
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __39__HMDSharedUserDataModel_hmbProperties__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (hmbProperties_onceToken_5 != -1)
    dispatch_once(&hmbProperties_onceToken_5, block);
  return (id)hmbProperties__properties_6;
}

void __39__HMDSharedUserDataModel_hmbProperties__block_invoke(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v10;
  _QWORD v11[4];
  _QWORD v12[5];

  v12[4] = *MEMORY[0x1E0C80C00];
  v10.receiver = *(id *)(a1 + 32);
  v10.super_class = (Class)&OBJC_METACLASS___HMDSharedUserDataModel;
  objc_msgSendSuper2(&v10, sel_hmbProperties);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "mutableCopy");
  v3 = (void *)hmbProperties__properties_6;
  hmbProperties__properties_6 = v2;

  v4 = (void *)hmbProperties__properties_6;
  v11[0] = CFSTR("assistantAccessControlModelUUID");
  objc_msgSend(MEMORY[0x1E0D32C80], "fieldWithClass:", objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v5;
  v11[1] = CFSTR("userListeningHistoryUpdateControlModelUUID");
  objc_msgSend(MEMORY[0x1E0D32C80], "fieldWithClass:", objc_opt_class());
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v12[1] = v6;
  v11[2] = CFSTR("supportsAutomaticHH2MigrationModelUUID");
  objc_msgSend(MEMORY[0x1E0D32C80], "fieldWithClass:", objc_opt_class());
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v12[2] = v7;
  v11[3] = CFSTR("mediaContentProfileAccessControlModelUUID");
  objc_msgSend(MEMORY[0x1E0D32C80], "fieldWithClass:", objc_opt_class());
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12[3] = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, v11, 4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addEntriesFromDictionary:", v9);

}

@end
