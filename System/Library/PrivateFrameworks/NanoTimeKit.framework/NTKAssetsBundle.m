@implementation NTKAssetsBundle

void __NTKAssetsBundle_block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;
  id v3;

  MEMORY[0x1BCCA7918]();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "stringByAppendingPathComponent:", CFSTR("System/Library/PrivateFrameworks/NanoTimeKitAssetsCompanion.bundle"));
  v3 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithPath:", v3);
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)NTKAssetsBundle___bundle;
  NTKAssetsBundle___bundle = v1;

}

@end
