@implementation AFIsPPT

void __AFIsPPT_block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  id v3;

  NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, 1uLL, 1);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "firstObject");
  v3 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "stringByAppendingPathComponent:", CFSTR("PPTDevice"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  AFIsPPT_isPPTDevice = objc_msgSend(v2, "fileExistsAtPath:", v1);

}

@end
