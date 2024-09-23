@implementation HMDMediaAccessoryModel

+ (id)properties
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __36__HMDMediaAccessoryModel_properties__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (properties_onceToken_60322 != -1)
    dispatch_once(&properties_onceToken_60322, block);
  return (id)properties__properties_60323;
}

void __36__HMDMediaAccessoryModel_properties__block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  uint64_t v3;
  void *v4;
  objc_super v5;

  v1 = (void *)MEMORY[0x1E0C99E08];
  v5.receiver = *(id *)(a1 + 32);
  v5.super_class = (Class)&OBJC_METACLASS___HMDMediaAccessoryModel;
  objc_msgSendSuper2(&v5, sel_properties);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "dictionaryWithDictionary:", v2);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)properties__properties_60323;
  properties__properties_60323 = v3;

}

@end
