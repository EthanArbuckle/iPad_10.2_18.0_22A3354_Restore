@implementation CPRootTemplateClasses

void __CPRootTemplateClasses_block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;
  id v3;

  v0 = (void *)MEMORY[0x24BDBCEF0];
  if (CPPushableTemplateClasses_onceToken != -1)
    dispatch_once(&CPPushableTemplateClasses_onceToken, &__block_literal_global_546);
  objc_msgSend(v0, "setWithSet:", CPPushableTemplateClasses_classes);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", objc_opt_class());
  v1 = objc_msgSend(v3, "copy");
  v2 = (void *)CPRootTemplateClasses_classes;
  CPRootTemplateClasses_classes = v1;

}

@end
