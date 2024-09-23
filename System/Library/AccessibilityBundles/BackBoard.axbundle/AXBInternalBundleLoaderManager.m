@implementation AXBInternalBundleLoaderManager

+ (void)initializeMonitor
{
  if (initializeMonitor_onceToken_1 != -1)
    dispatch_once(&initializeMonitor_onceToken_1, &__block_literal_global_5);
}

void __51__AXBInternalBundleLoaderManager_initializeMonitor__block_invoke()
{
  AXBInternalBundleLoaderManager *v0;
  void *v1;

  v0 = objc_alloc_init(AXBInternalBundleLoaderManager);
  v1 = (void *)_SharedInternalBundleLoaderManager;
  _SharedInternalBundleLoaderManager = (uint64_t)v0;

}

- (AXBInternalBundleLoaderManager)init
{
  AXBInternalBundleLoaderManager *v3;
  AXBInternalBundleLoaderManager *v4;
  AXBInternalBundleLoaderManager *v5;
  objc_super v7;

  if (AXIsInternalInstall())
  {
    v7.receiver = self;
    v7.super_class = (Class)AXBInternalBundleLoaderManager;
    v3 = -[AXBInternalBundleLoaderManager init](&v7, sel_init);
    v4 = v3;
    if (v3)
      -[AXBInternalBundleLoaderManager _loadInternalBundle](v3, "_loadInternalBundle");
    self = v4;
    v5 = self;
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (void)_loadInternalBundle
{
  AXPerformBlockOnMainThreadAfterDelay();
}

void __53__AXBInternalBundleLoaderManager__loadInternalBundle__block_invoke()
{
  objc_class *v0;
  id v1;

  objc_msgSend(MEMORY[0x24BDD1488], "bundleWithPath:", CFSTR("/AppleInternal/Library/AccessibilityUIServices/AXBInternalBundleLoader.bundle"));
  v1 = (id)objc_claimAutoreleasedReturnValue();
  v0 = (objc_class *)objc_msgSend(v1, "principalClass");
  if (v0)

}

@end
