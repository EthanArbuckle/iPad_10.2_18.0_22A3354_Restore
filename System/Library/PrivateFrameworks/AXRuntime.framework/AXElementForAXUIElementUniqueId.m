@implementation AXElementForAXUIElementUniqueId

BOOL ___AXElementForAXUIElementUniqueId_block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "uuidHash") == *(_QWORD *)(a1 + 32);
}

@end
