@implementation BCUIMappedImageCache

+ (id)sharedCache
{
  if (sharedCache___once[0] != -1)
    dispatch_once(sharedCache___once, &__block_literal_global_0);
  return (id)sharedCache___cache;
}

uint64_t __35__BCUIMappedImageCache_sharedCache__block_invoke()
{
  BCUIMappedImageCache *v0;
  void *v1;

  v0 = -[BCUIMappedImageCache initWithUniqueIdentifier:]([BCUIMappedImageCache alloc], "initWithUniqueIdentifier:", CFSTR("BCUIMappedImageCache"));
  v1 = (void *)sharedCache___cache;
  sharedCache___cache = (uint64_t)v0;

  return objc_msgSend((id)sharedCache___cache, "removeAllImagesWithCompletion:", 0);
}

@end
