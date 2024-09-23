@implementation HMDMediaContentProfileAccessControlModel

+ (id)hmbProperties
{
  if (hmbProperties_onceToken_58095 != -1)
    dispatch_once(&hmbProperties_onceToken_58095, &__block_literal_global_58096);
  return (id)hmbProperties__properties_58097;
}

void __57__HMDMediaContentProfileAccessControlModel_hmbProperties__block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;
  const __CFString *v3;
  _QWORD v4[2];

  v4[1] = *MEMORY[0x24BDAC8D0];
  v3 = CFSTR("accessories");
  objc_msgSend(MEMORY[0x24BE4ECB8], "fieldWithClass:", objc_opt_class());
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = v0;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v4, &v3, 1);
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)hmbProperties__properties_58097;
  hmbProperties__properties_58097 = v1;

}

@end
