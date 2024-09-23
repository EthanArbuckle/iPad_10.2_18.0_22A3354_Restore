@implementation NSFileManager(AppleMediaServices)

+ (uint64_t)ams_ensureDirectoryExists:()AppleMediaServices
{
  id v3;
  id v4;
  uint64_t v5;

  v3 = a3;
  if (v3)
  {
    v4 = objc_alloc_init(MEMORY[0x1E0CB3620]);
    if ((objc_msgSend(v4, "fileExistsAtPath:", v3) & 1) != 0)
      v5 = 1;
    else
      v5 = objc_msgSend(v4, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v3, 1, 0, 0);

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

@end
