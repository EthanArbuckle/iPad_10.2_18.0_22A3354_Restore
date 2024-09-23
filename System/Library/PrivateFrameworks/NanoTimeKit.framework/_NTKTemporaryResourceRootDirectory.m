@implementation _NTKTemporaryResourceRootDirectory

+ (void)initialize
{
  void *v3;
  void *v4;
  id v5;

  if ((id)objc_opt_class() == a1)
  {
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "path");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "removeItemAtPath:error:", v3, 0);

    objc_msgSend(a1, "path");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v4, 1, 0, 0);

  }
}

+ (id)path
{
  void *v2;
  void *v3;

  NTKMainBundleDependentCacheDirectory();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringByAppendingPathComponent:", CFSTR("FaceResourceLinks"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

@end
