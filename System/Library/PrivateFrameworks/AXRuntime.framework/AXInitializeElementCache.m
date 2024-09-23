@implementation AXInitializeElementCache

void ___AXInitializeElementCache_block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3748], "mapTableWithKeyOptions:valueOptions:", 1282, 1282);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_ElementCache;
  _ElementCache = v0;

  _ElementCacheLock = 0;
}

@end
