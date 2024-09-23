@implementation AXClearElementCache

uint64_t ___AXClearElementCache_block_invoke()
{
  return objc_msgSend((id)_ElementCache, "removeAllObjects");
}

@end
