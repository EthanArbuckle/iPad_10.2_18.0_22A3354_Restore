@implementation VSAccountProviderResponseValueType

void __VSAccountProviderResponseValueType_block_invoke()
{
  uint64_t v0;
  void *v1;

  __VSAccountProviderResponseValueType_block_invoke_2();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)VSAccountProviderResponseValueType___vs_lazy_init_variable;
  VSAccountProviderResponseValueType___vs_lazy_init_variable = v0;

}

VSValueType *__VSAccountProviderResponseValueType_block_invoke_2()
{
  VSValueType *v0;
  id v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v0 = objc_alloc_init(VSValueType);
  -[VSValueType setImplementationClass:](v0, "setImplementationClass:", objc_opt_class());
  v1 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[VSValueTypeProperty valueTypePropertyWithName:kind:allowedClasses:initialValue:](VSValueTypeProperty, "valueTypePropertyWithName:kind:allowedClasses:initialValue:", CFSTR("authenticationScheme"), 2, v2, CFSTR("SAML"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "addObject:", v3);

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[VSValueTypeProperty valueTypePropertyWithName:kind:allowedClasses:initialValue:](VSValueTypeProperty, "valueTypePropertyWithName:kind:allowedClasses:initialValue:", CFSTR("status"), 2, v4, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "addObject:", v5);

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[VSValueTypeProperty valueTypePropertyWithName:kind:allowedClasses:initialValue:](VSValueTypeProperty, "valueTypePropertyWithName:kind:allowedClasses:initialValue:", CFSTR("body"), 2, v6, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "addObject:", v7);

  -[VSValueType setProperties:](v0, "setProperties:", v1);
  return v0;
}

@end
