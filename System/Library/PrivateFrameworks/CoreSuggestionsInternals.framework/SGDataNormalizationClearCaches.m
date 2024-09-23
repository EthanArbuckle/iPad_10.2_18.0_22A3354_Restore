@implementation SGDataNormalizationClearCaches

uint64_t __SGDataNormalizationClearCaches_block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "removeAllObjects");
}

@end
