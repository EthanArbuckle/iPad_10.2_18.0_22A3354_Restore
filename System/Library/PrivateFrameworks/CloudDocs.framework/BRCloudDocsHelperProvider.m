@implementation BRCloudDocsHelperProvider

+ (id)cloudDocsHelper
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __44__BRCloudDocsHelperProvider_cloudDocsHelper__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (cloudDocsHelper_once != -1)
    dispatch_once(&cloudDocsHelper_once, block);
  return (id)cloudDocsHelper_helper;
}

void __45__BRCloudDocsHelperProvider_hasDaemonicParts__block_invoke()
{
  void *v0;
  id v1;

  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "bundleIdentifier");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  hasDaemonicParts_hasDaemonicParts = objc_msgSend(v0, "isEqualToString:", CFSTR("com.apple.bird"));

}

void __44__BRCloudDocsHelperProvider_cloudDocsHelper__block_invoke(uint64_t a1)
{
  objc_class *v1;
  id v2;
  void *v3;

  if (objc_msgSend(*(id *)(a1 + 32), "hasDaemonicParts"))
    v1 = NSClassFromString((NSString *)CFSTR("BRDaemonCloudDocsHelper"));
  else
    v1 = (objc_class *)objc_opt_class();
  v2 = objc_alloc_init(v1);
  v3 = (void *)cloudDocsHelper_helper;
  cloudDocsHelper_helper = (uint64_t)v2;

}

+ (BOOL)hasDaemonicParts
{
  if (hasDaemonicParts_once != -1)
    dispatch_once(&hasDaemonicParts_once, &__block_literal_global_2);
  return hasDaemonicParts_hasDaemonicParts;
}

@end
