@implementation VSViewServiceRequestValueType

void __VSViewServiceRequestValueType_block_invoke()
{
  uint64_t v0;
  void *v1;

  __VSViewServiceRequestValueType_block_invoke_2();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)VSViewServiceRequestValueType___vs_lazy_init_variable;
  VSViewServiceRequestValueType___vs_lazy_init_variable = v0;

}

VSValueType *__VSViewServiceRequestValueType_block_invoke_2()
{
  VSValueType *v0;
  id v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  VSOptional *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v0 = objc_alloc_init(VSValueType);
  -[VSValueType setImplementationClass:](v0, "setImplementationClass:", objc_opt_class());
  v1 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  +[VSValueTypeProperty valueTypePropertyWithName:kind:allowedClasses:initialValue:](VSValueTypeProperty, "valueTypePropertyWithName:kind:allowedClasses:initialValue:", CFSTR("allowsPrivacyUI"), 0, 0, 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "addObject:", v2);

  +[VSValueTypeProperty valueTypePropertyWithName:kind:allowedClasses:initialValue:](VSValueTypeProperty, "valueTypePropertyWithName:kind:allowedClasses:initialValue:", CFSTR("requiresPrivacyUI"), 0, 0, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "addObject:", v3);

  +[VSValueTypeProperty valueTypePropertyWithName:kind:allowedClasses:initialValue:](VSValueTypeProperty, "valueTypePropertyWithName:kind:allowedClasses:initialValue:", CFSTR("shouldInferFeaturedProviders"), 0, 0, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "addObject:", v4);

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[VSValueTypeProperty valueTypePropertyWithName:kind:allowedClasses:initialValue:](VSValueTypeProperty, "valueTypePropertyWithName:kind:allowedClasses:initialValue:", CFSTR("accountMetadataRequest"), 2, v5, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "addObject:", v6);

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_alloc_init(VSOptional);
  +[VSValueTypeProperty valueTypePropertyWithName:kind:allowedClasses:initialValue:](VSValueTypeProperty, "valueTypePropertyWithName:kind:allowedClasses:initialValue:", CFSTR("requestingAppDisplayName"), 2, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "addObject:", v9);

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[VSValueTypeProperty valueTypePropertyWithName:kind:allowedClasses:initialValue:](VSValueTypeProperty, "valueTypePropertyWithName:kind:allowedClasses:initialValue:", CFSTR("requestingAppAdamID"), 2, v10, 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "addObject:", v11);

  +[VSValueTypeProperty valueTypePropertyWithName:kind:allowedClasses:initialValue:](VSValueTypeProperty, "valueTypePropertyWithName:kind:allowedClasses:initialValue:", CFSTR("canVetoAuthentication"), 0, 0, 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "addObject:", v12);

  -[VSValueType setProperties:](v0, "setProperties:", v1);
  return v0;
}

@end
