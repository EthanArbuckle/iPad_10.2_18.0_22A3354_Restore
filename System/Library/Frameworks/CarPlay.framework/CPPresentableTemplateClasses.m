@implementation CPPresentableTemplateClasses

void __CPPresentableTemplateClasses_block_invoke()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v0 = (void *)MEMORY[0x24BDBCF20];
  v1 = objc_opt_class();
  v2 = objc_opt_class();
  objc_msgSend(v0, "setWithObjects:", v1, v2, objc_opt_class(), 0);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)CPPresentableTemplateClasses_classes;
  CPPresentableTemplateClasses_classes = v3;

}

@end
