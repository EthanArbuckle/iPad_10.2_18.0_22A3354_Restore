@implementation CDPLocalizedStringInTable

void __CDPLocalizedStringInTable_block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)CDPLocalizedStringInTable_bundle;
  CDPLocalizedStringInTable_bundle = v0;

}

@end
