@implementation HMDUserDataModel

+ (id)hmbProperties
{
  if (hmbProperties_onceToken_128830 != -1)
    dispatch_once(&hmbProperties_onceToken_128830, &__block_literal_global_128831);
  return (id)hmbProperties__properties_128832;
}

void __33__HMDUserDataModel_hmbProperties__block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;
  const __CFString *v3;
  _QWORD v4[2];

  v4[1] = *MEMORY[0x24BDAC8D0];
  v3 = CFSTR("settingsRootUUID");
  objc_msgSend(MEMORY[0x24BE4ECB8], "fieldWithClass:", objc_opt_class());
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = v0;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v4, &v3, 1);
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)hmbProperties__properties_128832;
  hmbProperties__properties_128832 = v1;

}

@end
