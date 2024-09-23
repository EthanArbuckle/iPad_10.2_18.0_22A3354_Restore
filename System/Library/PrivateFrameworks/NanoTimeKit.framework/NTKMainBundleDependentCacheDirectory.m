@implementation NTKMainBundleDependentCacheDirectory

void __NTKMainBundleDependentCacheDirectory_block_invoke()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  void *v4;
  id v5;

  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "bundleIdentifier");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  NTKCacheDirectory();
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "stringByAppendingPathComponent:", v5);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)NTKMainBundleDependentCacheDirectory___path;
  NTKMainBundleDependentCacheDirectory___path = v2;

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", NTKMainBundleDependentCacheDirectory___path, 1, 0, 0);

}

@end
