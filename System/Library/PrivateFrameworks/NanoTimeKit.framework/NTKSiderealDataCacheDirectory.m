@implementation NTKSiderealDataCacheDirectory

void ___NTKSiderealDataCacheDirectory_block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;
  id v3;

  NTKCacheDirectory();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "stringByAppendingPathComponent:", CFSTR("SiderealData"));
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)_NTKSiderealDataCacheDirectory___path;
  _NTKSiderealDataCacheDirectory___path = v1;

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", _NTKSiderealDataCacheDirectory___path, 1, 0, 0);

}

@end
