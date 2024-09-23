@implementation AXGameCenterUIFrameworkLocString

void __AXGameCenterUIFrameworkLocString_block_invoke()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  id v4;

  v0 = (void *)MEMORY[0x24BDD1488];
  MEMORY[0x23490F51C]();
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringByAppendingPathComponent:", CFSTR("GameCenterUIFramework.axbundle"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "bundleWithPath:", v1);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)AXGameCenterUIFrameworkLocString_bundle;
  AXGameCenterUIFrameworkLocString_bundle = v2;

}

@end
