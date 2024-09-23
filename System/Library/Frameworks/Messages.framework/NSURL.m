@implementation NSURL

void __48__NSURL_MessagesAdditions____ms_cachesDirectory__block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;
  id v3;

  NSSearchPathForDirectoriesInDomains(NSCachesDirectory, 1uLL, 1);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "lastObject");
  v3 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:", v3, 1);
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)__ms_cachesDirectory_sCachesDirectory;
  __ms_cachesDirectory_sCachesDirectory = v1;

}

@end
