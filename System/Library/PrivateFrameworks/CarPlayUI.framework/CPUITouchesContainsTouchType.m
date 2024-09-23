@implementation CPUITouchesContainsTouchType

BOOL __CPUITouchesContainsTouchType_block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "type") == *(_QWORD *)(a1 + 32);
}

BOOL __CPUITouchesContainsTouchType_block_invoke_0(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "type") == *(_QWORD *)(a1 + 32);
}

@end
