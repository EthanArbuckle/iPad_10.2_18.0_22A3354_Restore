@implementation HMDIDSActivityObserverModel

- (HMDIDSActivityObserverModel)initWithModelID:(id)a3
{
  id v4;
  void *v5;
  HMDIDSActivityObserverModel *v6;
  objc_super v8;

  v4 = a3;
  objc_msgSend((id)objc_opt_class(), "sentinelParentUUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8.receiver = self;
  v8.super_class = (Class)HMDIDSActivityObserverModel;
  v6 = -[HMBModel initWithModelID:parentModelID:](&v8, sel_initWithModelID_parentModelID_, v4, v5);

  return v6;
}

+ (id)sentinelParentUUID
{
  if (sentinelParentUUID_onceToken_239978 != -1)
    dispatch_once(&sentinelParentUUID_onceToken_239978, &__block_literal_global_239979);
  return (id)sentinelParentUUID_sentinelParentUUID_239980;
}

+ (id)hmbProperties
{
  if (hmbProperties_onceToken_239970 != -1)
    dispatch_once(&hmbProperties_onceToken_239970, &__block_literal_global_2_239971);
  return (id)hmbProperties_properties_239972;
}

void __44__HMDIDSActivityObserverModel_hmbProperties__block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;
  const __CFString *v3;
  _QWORD v4[2];

  v4[1] = *MEMORY[0x24BDAC8D0];
  v3 = CFSTR("pushToken");
  objc_msgSend(MEMORY[0x24BE4ECB8], "fieldWithClass:", objc_opt_class());
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = v0;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v4, &v3, 1);
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)hmbProperties_properties_239972;
  hmbProperties_properties_239972 = v1;

}

void __49__HMDIDSActivityObserverModel_sentinelParentUUID__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_msgSend(objc_alloc(MEMORY[0x24BDD1880]), "initWithUUIDString:", CFSTR("6E0AF7DC-15F3-4FC8-ACB2-B98338E4FE85"));
  v1 = (void *)sentinelParentUUID_sentinelParentUUID_239980;
  sentinelParentUUID_sentinelParentUUID_239980 = v0;

}

@end
