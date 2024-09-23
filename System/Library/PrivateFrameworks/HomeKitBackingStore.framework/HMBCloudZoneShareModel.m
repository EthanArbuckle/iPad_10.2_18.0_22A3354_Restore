@implementation HMBCloudZoneShareModel

+ (id)hmbProperties
{
  if (hmbProperties_onceToken_146 != -1)
    dispatch_once(&hmbProperties_onceToken_146, &__block_literal_global_147);
  return (id)hmbProperties__properties_148;
}

+ (id)hmbExternalRecordType
{
  return (id)*MEMORY[0x1E0C94A20];
}

void __39__HMBCloudZoneShareModel_hmbProperties__block_invoke()
{
  uint64_t v0;
  void *v1;
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  const __CFString *v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  v7 = CFSTR("share");
  v0 = objc_opt_class();
  +[HMBModelFieldOption excludeFromCloudStorage](HMBModelFieldOption, "excludeFromCloudStorage");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v1;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v6, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[HMBModelField fieldWithClass:options:](HMBModelField, "fieldWithClass:options:", v0, v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, &v7, 1);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)hmbProperties__properties_148;
  hmbProperties__properties_148 = v4;

}

@end
