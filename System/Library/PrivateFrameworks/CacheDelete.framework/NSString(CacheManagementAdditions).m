@implementation NSString(CacheManagementAdditions)

+ (id)stringWithFileSystemRepresentation:()CacheManagementAdditions length:
{
  void *v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringWithFileSystemRepresentation:length:", a3, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (uint64_t)stringWithFileSystemRepresentation:()CacheManagementAdditions
{
  return objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFileSystemRepresentation:length:", __s, strlen(__s));
}

@end
