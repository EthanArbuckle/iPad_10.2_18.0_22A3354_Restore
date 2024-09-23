@implementation HMDAssistantAccessControlModelV2

+ (id)hmbProperties
{
  if (hmbProperties_onceToken_114908 != -1)
    dispatch_once(&hmbProperties_onceToken_114908, &__block_literal_global_114909);
  return (id)hmbProperties__properties_114910;
}

void __49__HMDAssistantAccessControlModelV2_hmbProperties__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  _QWORD v6[4];
  _QWORD v7[5];

  v7[4] = *MEMORY[0x24BDAC8D0];
  v6[0] = CFSTR("accessoryUUIDs");
  objc_msgSend(MEMORY[0x24BE4ECB8], "fieldWithClass:", objc_opt_class());
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = v0;
  v6[1] = CFSTR("siriEndpointAccessoryUUIDs");
  objc_msgSend(MEMORY[0x24BE4ECB8], "fieldWithClass:", objc_opt_class());
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v7[1] = v1;
  v6[2] = CFSTR("requiresAuthenticationForSecureRequests");
  objc_msgSend(MEMORY[0x24BE4ECB8], "fieldWithClass:", objc_opt_class());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v7[2] = v2;
  v6[3] = CFSTR("activityNotificationsEnabledForPersonalRequests");
  objc_msgSend(MEMORY[0x24BE4ECB8], "fieldWithClass:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[3] = v3;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v7, v6, 4);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)hmbProperties__properties_114910;
  hmbProperties__properties_114910 = v4;

}

@end
