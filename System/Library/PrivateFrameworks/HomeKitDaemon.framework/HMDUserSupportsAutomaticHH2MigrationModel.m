@implementation HMDUserSupportsAutomaticHH2MigrationModel

+ (id)hmbProperties
{
  if (hmbProperties_onceToken_174089 != -1)
    dispatch_once(&hmbProperties_onceToken_174089, &__block_literal_global_174090);
  return (id)hmbProperties__properties_174091;
}

void __58__HMDUserSupportsAutomaticHH2MigrationModel_hmbProperties__block_invoke()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  _QWORD v4[2];
  _QWORD v5[3];

  v5[2] = *MEMORY[0x24BDAC8D0];
  v4[0] = CFSTR("supportsAutomaticHH2Migration");
  objc_msgSend(MEMORY[0x24BE4ECB8], "fieldWithClass:", objc_opt_class());
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v4[1] = CFSTR("supportsHH2MigrationByOwnerAuto");
  v5[0] = v0;
  objc_msgSend(MEMORY[0x24BE4ECB8], "fieldWithClass:", objc_opt_class());
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v5[1] = v1;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v5, v4, 2);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)hmbProperties__properties_174091;
  hmbProperties__properties_174091 = v2;

}

@end
