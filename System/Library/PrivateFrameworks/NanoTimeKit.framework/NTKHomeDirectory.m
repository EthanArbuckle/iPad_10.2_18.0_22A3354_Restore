@implementation NTKHomeDirectory

void __NTKHomeDirectory_block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  NSHomeDirectory();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "stringByAppendingPathComponent:", CFSTR("Library/NanoTimeKit"));
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)NTKHomeDirectory___path;
  NTKHomeDirectory___path = v1;

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", NTKHomeDirectory___path, 1, 0, 0);

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *MEMORY[0x1E0CB2AD8];
  v7[0] = *MEMORY[0x1E0CB2AE0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, &v6, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAttributes:ofItemAtPath:error:", v5, NTKHomeDirectory___path, 0);

}

@end
