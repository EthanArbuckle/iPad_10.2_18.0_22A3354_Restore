@implementation AXGameCenterPrivateUIFrameworkLocString

void __AXGameCenterPrivateUIFrameworkLocString_block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1488], "bundleWithIdentifier:", CFSTR("com.apple.GameCenterPrivateUIFramework.axbundle"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)AXGameCenterPrivateUIFrameworkLocString_bundle;
  AXGameCenterPrivateUIFrameworkLocString_bundle = v0;

}

@end
