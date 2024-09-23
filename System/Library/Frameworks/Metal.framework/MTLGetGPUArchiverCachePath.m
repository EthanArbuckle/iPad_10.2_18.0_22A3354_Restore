@implementation MTLGetGPUArchiverCachePath

void __MTLGetGPUArchiverCachePath_block_invoke()
{
  void *GPUArchiverCacheMainFolder;
  void *v1;
  id v2;
  unint64_t v3;

  v3 = 0;
  GPUArchiverCacheMainFolder = getGPUArchiverCacheMainFolder(&v3);
  if (GPUArchiverCacheMainFolder)
  {
    v1 = GPUArchiverCacheMainFolder;
    v2 = objc_alloc(MEMORY[0x1E0CB3940]);
    MTLGetGPUArchiverCachePath::result = objc_msgSend(v2, "initWithBytesNoCopy:length:encoding:freeWhenDone:", v1, v3, 4, 1);
    if (!MTLGetGPUArchiverCachePath::result)
      free(v1);
  }
}

@end
