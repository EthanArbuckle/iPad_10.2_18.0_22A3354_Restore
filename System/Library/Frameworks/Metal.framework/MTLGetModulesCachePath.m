@implementation MTLGetModulesCachePath

void __MTLGetModulesCachePath_block_invoke()
{
  void *ModuleCacheMainFolder;
  void *v1;
  id v2;
  unint64_t v3;

  v3 = 0;
  ModuleCacheMainFolder = getModuleCacheMainFolder(&v3);
  if (ModuleCacheMainFolder)
  {
    v1 = ModuleCacheMainFolder;
    v2 = objc_alloc(MEMORY[0x1E0CB3940]);
    MTLGetModulesCachePath::result = objc_msgSend(v2, "initWithBytesNoCopy:length:encoding:freeWhenDone:", v1, v3, 4, 1);
    if (!MTLGetModulesCachePath::result)
      free(v1);
  }
}

@end
