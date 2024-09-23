@implementation VSIdentityProviderAppsResponseValueType

void __VSIdentityProviderAppsResponseValueType_block_invoke()
{
  uint64_t v0;
  void *v1;

  __VSIdentityProviderAppsResponseValueType_block_invoke_2();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)VSIdentityProviderAppsResponseValueType___vs_lazy_init_variable;
  VSIdentityProviderAppsResponseValueType___vs_lazy_init_variable = v0;

}

VSValueType *__VSIdentityProviderAppsResponseValueType_block_invoke_2()
{
  VSValueType *v0;
  id v1;
  void *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;

  v0 = objc_alloc_init(VSValueType);
  -[VSValueType setImplementationClass:](v0, "setImplementationClass:", objc_opt_class());
  v1 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v2 = (void *)MEMORY[0x1E0C99E60];
  v3 = objc_opt_class();
  objc_msgSend(v2, "setWithObjects:", v3, objc_opt_class(), 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x1E0C9AA60];
  +[VSValueTypeProperty valueTypePropertyWithName:kind:allowedClasses:initialValue:](VSValueTypeProperty, "valueTypePropertyWithName:kind:allowedClasses:initialValue:", CFSTR("providerAppAdamIDs"), 2, v4, MEMORY[0x1E0C9AA60]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "addObject:", v6);

  v7 = (void *)MEMORY[0x1E0C99E60];
  v8 = objc_opt_class();
  objc_msgSend(v7, "setWithObjects:", v8, objc_opt_class(), 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[VSValueTypeProperty valueTypePropertyWithName:kind:allowedClasses:initialValue:](VSValueTypeProperty, "valueTypePropertyWithName:kind:allowedClasses:initialValue:", CFSTR("channelMappings"), 2, v9, v5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "addObject:", v10);

  -[VSValueType setProperties:](v0, "setProperties:", v1);
  return v0;
}

@end
