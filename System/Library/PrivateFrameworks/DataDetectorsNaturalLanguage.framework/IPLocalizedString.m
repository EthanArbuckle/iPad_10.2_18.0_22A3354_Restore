@implementation IPLocalizedString

void __IPLocalizedString_block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)IPLocalizedString_bundle;
  IPLocalizedString_bundle = v0;

}

void __IPLocalizedString_block_invoke_0()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)IPLocalizedString_bundle_0;
  IPLocalizedString_bundle_0 = v0;

}

@end
