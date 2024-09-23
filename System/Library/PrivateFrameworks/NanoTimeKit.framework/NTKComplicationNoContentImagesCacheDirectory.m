@implementation NTKComplicationNoContentImagesCacheDirectory

void ___NTKComplicationNoContentImagesCacheDirectory_block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;
  id v3;

  NTKCacheDirectory();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "stringByAppendingPathComponent:", CFSTR("ComplicationNoContentImages"));
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)_NTKComplicationNoContentImagesCacheDirectory___path;
  _NTKComplicationNoContentImagesCacheDirectory___path = v1;

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", _NTKComplicationNoContentImagesCacheDirectory___path, 1, 0, 0);

}

@end
