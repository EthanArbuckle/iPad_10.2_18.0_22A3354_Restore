@implementation NTKCacheDirectory

void __NTKCacheDirectory_block_invoke()
{
  uint64_t started;
  void *v1;
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  _BYTE v9[1024];
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  started = sysdir_start_search_path_enumeration_private();
  MEMORY[0x1BCCA8734](started, v9);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v9, 4);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "stringByAppendingPathComponent:", CFSTR("com.apple.NanoTimeKit"));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)NTKCacheDirectory_path;
  NTKCacheDirectory_path = v2;

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", NTKCacheDirectory_path, 1, 0, 0);

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = *MEMORY[0x1E0CB2AD8];
  v8 = *MEMORY[0x1E0CB2AE0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v8, &v7, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAttributes:ofItemAtPath:error:", v6, NTKCacheDirectory_path, 0);

}

@end
