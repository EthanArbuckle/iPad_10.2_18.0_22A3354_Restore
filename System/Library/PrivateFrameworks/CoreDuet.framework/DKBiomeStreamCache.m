@implementation DKBiomeStreamCache

void __34___DKBiomeStreamCache_sharedCache__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_msgSend(objc_alloc(MEMORY[0x1E0D815C8]), "initWithCountLimit:", 16);
  v1 = (void *)sharedCache_cache;
  sharedCache_cache = v0;

}

@end
