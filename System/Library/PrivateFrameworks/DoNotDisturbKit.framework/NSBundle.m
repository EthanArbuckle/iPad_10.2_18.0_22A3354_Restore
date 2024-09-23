@implementation NSBundle

void __52__NSBundle_DoNotDisturbKit__dndk_localizationBundle__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)dndk_localizationBundle_bundle;
  dndk_localizationBundle_bundle = v0;

}

@end
