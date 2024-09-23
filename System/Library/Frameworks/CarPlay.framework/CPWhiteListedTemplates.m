@implementation CPWhiteListedTemplates

void __CPWhiteListedTemplates_block_invoke()
{
  void *v0;
  id v1;
  void *v2;
  void *v3;

  v0 = (void *)MEMORY[0x24BDBCEF0];
  if (CPTabTemplates_onceToken != -1)
    dispatch_once(&CPTabTemplates_onceToken, &__block_literal_global_126);
  v1 = (id)CPTabTemplates_classes;
  objc_msgSend(v0, "setWithSet:", v1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v2, "addObject:", objc_opt_class());
  v3 = (void *)CPWhiteListedTemplates_classes;
  CPWhiteListedTemplates_classes = (uint64_t)v2;

}

@end
