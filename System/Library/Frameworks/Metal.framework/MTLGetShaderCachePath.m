@implementation MTLGetShaderCachePath

void __MTLGetShaderCachePath_block_invoke()
{
  void *ShaderCacheMainFolder;
  void *v1;
  id v2;
  unint64_t v3;

  v3 = 0;
  ShaderCacheMainFolder = getShaderCacheMainFolder(&v3);
  if (ShaderCacheMainFolder)
  {
    v1 = ShaderCacheMainFolder;
    v2 = objc_alloc(MEMORY[0x1E0CB3940]);
    MTLGetShaderCachePath::result = objc_msgSend(v2, "initWithBytesNoCopy:length:encoding:freeWhenDone:", v1, v3, 4, 1);
    if (!MTLGetShaderCachePath::result)
      free(v1);
  }
}

@end
