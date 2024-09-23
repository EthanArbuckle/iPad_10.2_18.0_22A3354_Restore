@implementation SFShouldHandleSelectionForPresses

BOOL __SFShouldHandleSelectionForPresses_block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "type") == 4;
}

@end
