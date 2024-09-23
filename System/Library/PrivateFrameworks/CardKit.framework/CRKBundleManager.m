@implementation CRKBundleManager

void __35___CRKBundleManager_sharedInstance__block_invoke(uint64_t a1)
{
  id v1;
  void *v2;

  v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)sharedInstance_sBundleManager;
  sharedInstance_sBundleManager = (uint64_t)v1;

}

void __40___CRKBundleManager_bundleDirectoryPath__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  uint64_t v3;
  void *v4;
  _QWORD v5[4];

  v5[3] = *MEMORY[0x24BDAC8D0];
  v0 = (void *)MEMORY[0x24BDD17C8];
  CPSystemRootDirectory();
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = v1;
  v5[1] = CFSTR("System");
  v5[2] = CFSTR("/Library/CardKit/Plugins");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v5, 3);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "pathWithComponents:", v2);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)bundleDirectoryPath_sBundleDirectoryPath;
  bundleDirectoryPath_sBundleDirectoryPath = v3;

}

@end
