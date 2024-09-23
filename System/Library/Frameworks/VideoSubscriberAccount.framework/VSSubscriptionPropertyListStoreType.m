@implementation VSSubscriptionPropertyListStoreType

void __VSSubscriptionPropertyListStoreType_block_invoke()
{
  uint64_t v0;
  void *v1;

  __VSSubscriptionPropertyListStoreType_block_invoke_2();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)VSSubscriptionPropertyListStoreType___vs_lazy_init_variable;
  VSSubscriptionPropertyListStoreType___vs_lazy_init_variable = v0;

}

id __VSSubscriptionPropertyListStoreType_block_invoke_2()
{
  objc_class *v0;
  void *v1;

  v0 = (objc_class *)objc_opt_class();
  NSStringFromClass(v0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C97C00], "registerStoreClass:forStoreType:", v0, v1);
  return v1;
}

@end
