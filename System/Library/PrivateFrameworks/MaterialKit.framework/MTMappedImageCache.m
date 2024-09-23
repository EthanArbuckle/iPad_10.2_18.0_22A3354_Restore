@implementation MTMappedImageCache

+ (id)sharedCache
{
  if (sharedCache___once != -1)
    dispatch_once(&sharedCache___once, &__block_literal_global_5);
  return (id)sharedCache___cache;
}

uint64_t __33__MTMappedImageCache_sharedCache__block_invoke()
{
  MTMappedImageCache *v0;
  void *v1;
  _MTClientDemarcatedCurrentContainerPathProvider *v2;
  void *v3;
  uint64_t v4;
  void *v5;

  v0 = [MTMappedImageCache alloc];
  v1 = (void *)MEMORY[0x24BE0BF30];
  v2 = objc_alloc_init(_MTClientDemarcatedCurrentContainerPathProvider);
  objc_msgSend(v1, "optionsWithContainerPathProvider:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[MTMappedImageCache initWithUniqueIdentifier:options:](v0, "initWithUniqueIdentifier:options:", CFSTR("MTMappedImageCache"), v3);
  v5 = (void *)sharedCache___cache;
  sharedCache___cache = v4;

  return objc_msgSend((id)sharedCache___cache, "removeAllImagesWithCompletion:", 0);
}

@end
