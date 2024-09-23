@implementation NTKLogDirectory

void __NTKLogDirectory_block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;
  id v3;

  NSHomeDirectory();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "stringByAppendingPathComponent:", CFSTR("Library/Logs/NanoTimeKit"));
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)NTKLogDirectory___path;
  NTKLogDirectory___path = v1;

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", NTKLogDirectory___path, 1, 0, 0);

}

@end
