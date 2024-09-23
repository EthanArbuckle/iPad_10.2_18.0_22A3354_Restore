@implementation MTImageCache

void __MTImageCache_block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v1 = (void *)MTImageCache_imageCache;
  MTImageCache_imageCache = (uint64_t)v0;

}

@end
