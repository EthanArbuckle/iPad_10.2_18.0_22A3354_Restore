@implementation VSViewServiceResponseValueType

void __VSViewServiceResponseValueType_block_invoke()
{
  uint64_t v0;
  void *v1;

  __VSViewServiceResponseValueType_block_invoke_2();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)VSViewServiceResponseValueType___vs_lazy_init_variable;
  VSViewServiceResponseValueType___vs_lazy_init_variable = v0;

}

VSValueType *__VSViewServiceResponseValueType_block_invoke_2()
{
  VSValueType *v0;
  id v1;
  void *v2;
  void *v3;

  v0 = objc_alloc_init(VSValueType);
  -[VSValueType setImplementationClass:](v0, "setImplementationClass:", objc_opt_class());
  v1 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[VSValueTypeProperty valueTypePropertyWithName:kind:allowedClasses:initialValue:](VSValueTypeProperty, "valueTypePropertyWithName:kind:allowedClasses:initialValue:", CFSTR("accountMetadata"), 2, v2, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "addObject:", v3);

  -[VSValueType setProperties:](v0, "setProperties:", v1);
  return v0;
}

@end
