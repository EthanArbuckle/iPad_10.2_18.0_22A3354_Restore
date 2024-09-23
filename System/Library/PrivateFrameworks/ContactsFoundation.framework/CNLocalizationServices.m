@implementation CNLocalizationServices

+ (CNLocalizationServices)defaultServices
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __41__CNLocalizationServices_defaultServices__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (defaultServices_cn_once_token_1 != -1)
    dispatch_once(&defaultServices_cn_once_token_1, block);
  return (CNLocalizationServices *)(id)defaultServices_cn_once_object_1;
}

void __41__CNLocalizationServices_defaultServices__block_invoke(uint64_t a1)
{
  id v1;
  void *v2;

  v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)defaultServices_cn_once_object_1;
  defaultServices_cn_once_object_1 = (uint64_t)v1;

}

- (id)localizedStringForKey:(id)a3 value:(id)a4 table:(id)a5 bundleForClass:(Class)a6 comment:(id)a7
{
  void *v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;

  v10 = (void *)MEMORY[0x1E0CB34D0];
  v11 = a5;
  v12 = a4;
  v13 = a3;
  objc_msgSend(v10, "bundleForClass:", a6);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "localizedStringForKey:value:table:", v13, v12, v11);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

@end
