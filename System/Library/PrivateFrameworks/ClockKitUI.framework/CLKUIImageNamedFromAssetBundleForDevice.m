@implementation CLKUIImageNamedFromAssetBundleForDevice

void __CLKUIImageNamedFromAssetBundleForDevice_block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  void *v3;

  objc_msgSend(a2, "sizeClass");
  CLKUIAssetBundleSuffixesForSizeClass();
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)CLKUIImageNamedFromAssetBundleForDevice___suffixes;
  CLKUIImageNamedFromAssetBundleForDevice___suffixes = v2;

}

@end
