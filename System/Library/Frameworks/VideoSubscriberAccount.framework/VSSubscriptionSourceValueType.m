@implementation VSSubscriptionSourceValueType

void __VSSubscriptionSourceValueType_block_invoke()
{
  uint64_t v0;
  void *v1;

  __VSSubscriptionSourceValueType_block_invoke_2();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)VSSubscriptionSourceValueType___vs_lazy_init_variable;
  VSSubscriptionSourceValueType___vs_lazy_init_variable = v0;

}

VSValueType *__VSSubscriptionSourceValueType_block_invoke_2()
{
  VSValueType *v0;
  id v1;
  void *v2;
  void *v3;
  void *v4;

  v0 = objc_alloc_init(VSValueType);
  -[VSValueType setImplementationClass:](v0, "setImplementationClass:", objc_opt_class());
  v1 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  +[VSValueTypeProperty valueTypePropertyWithName:kind:allowedClasses:initialValue:](VSValueTypeProperty, "valueTypePropertyWithName:kind:allowedClasses:initialValue:", CFSTR("kind"), 1, 0, 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "addObject:", v2);

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[VSValueTypeProperty valueTypePropertyWithName:kind:allowedClasses:initialValue:](VSValueTypeProperty, "valueTypePropertyWithName:kind:allowedClasses:initialValue:", CFSTR("identifier"), 2, v3, &stru_1E93A8CC0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "addObject:", v4);

  -[VSValueType setProperties:](v0, "setProperties:", v1);
  return v0;
}

@end
