@implementation AXUIElementSharedSystemWide

uint64_t __AXUIElementSharedSystemWide_block_invoke()
{
  uint64_t result;

  result = _AXUIElementCreateInternal(0, 0, kAXApplicationUID);
  AXUIElementSharedSystemWide_SystemWide = result;
  return result;
}

@end
