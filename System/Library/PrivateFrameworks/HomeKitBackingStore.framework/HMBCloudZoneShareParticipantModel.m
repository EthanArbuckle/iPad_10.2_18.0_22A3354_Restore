@implementation HMBCloudZoneShareParticipantModel

+ (id)hmbProperties
{
  if (hmbProperties_onceToken_2840 != -1)
    dispatch_once(&hmbProperties_onceToken_2840, &__block_literal_global_2841);
  return (id)hmbProperties__properties_2842;
}

void __50__HMBCloudZoneShareParticipantModel_hmbProperties__block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;
  const __CFString *v3;
  _QWORD v4[2];

  v4[1] = *MEMORY[0x1E0C80C00];
  v3 = CFSTR("participant");
  +[HMBModelField fieldWithClass:](HMBModelField, "fieldWithClass:", objc_opt_class());
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = v0;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v4, &v3, 1);
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)hmbProperties__properties_2842;
  hmbProperties__properties_2842 = v1;

}

@end
