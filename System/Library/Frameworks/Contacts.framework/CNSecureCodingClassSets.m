@implementation CNSecureCodingClassSets

void __47__CNSecureCodingClassSets_keyDescriptorClasses__block_invoke()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;

  v0 = (void *)MEMORY[0x1E0C99E60];
  v1 = objc_opt_class();
  v2 = objc_opt_class();
  v3 = objc_opt_class();
  v4 = objc_opt_class();
  v5 = objc_opt_class();
  v6 = objc_opt_class();
  objc_msgSend(v0, "setWithObjects:", v1, v2, v3, v4, v5, v6, objc_opt_class(), 0);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v9, "copy");
  v8 = (void *)keyDescriptorClasses_cn_once_object_0;
  keyDescriptorClasses_cn_once_object_0 = v7;

}

+ (id)contactStoreClasses
{
  if (contactStoreClasses_onceToken != -1)
    dispatch_once(&contactStoreClasses_onceToken, &__block_literal_global_8_0);
  return (id)contactStoreClasses_contactStoreClasses;
}

+ (id)keyDescriptorClasses
{
  if (keyDescriptorClasses_cn_once_token_0 != -1)
    dispatch_once(&keyDescriptorClasses_cn_once_token_0, &__block_literal_global_43);
  return (id)keyDescriptorClasses_cn_once_object_0;
}

void __46__CNSecureCodingClassSets_contactStoreClasses__block_invoke()
{
  void *v0;
  uint64_t v1;
  Class v2;
  Class v3;
  Class v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;

  v0 = (void *)MEMORY[0x1E0C99E20];
  v1 = objc_opt_class();
  objc_msgSend(v0, "setWithObjects:", v1, objc_opt_class(), 0);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  v2 = NSClassFromString(CFSTR("CNSuggestedContactStore"));
  if (v2)
    objc_msgSend(v8, "addObject:", v2);
  v3 = NSClassFromString(CFSTR("CNAggregateContactStore"));
  if (v3)
    objc_msgSend(v8, "addObject:", v3);
  v4 = NSClassFromString(CFSTR("CNMockContactStore"));
  v5 = v8;
  if (v4)
  {
    objc_msgSend(v8, "addObject:");
    v5 = v8;
  }
  v6 = objc_msgSend(v5, "copy");
  v7 = (void *)contactStoreClasses_contactStoreClasses;
  contactStoreClasses_contactStoreClasses = v6;

}

@end
