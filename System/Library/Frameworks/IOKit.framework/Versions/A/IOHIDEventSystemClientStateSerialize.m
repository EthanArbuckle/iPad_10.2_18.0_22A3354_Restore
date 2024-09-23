@implementation IOHIDEventSystemClientStateSerialize

void ____IOHIDEventSystemClientStateSerialize_block_invoke(uint64_t a1, const void *a2)
{
  CFArrayAppendValue(*(CFMutableArrayRef *)(a1 + 32), a2);
}

void ____IOHIDEventSystemClientStateSerialize_block_invoke_2(uint64_t a1, uint64_t a2)
{
  _IOHIDArrayAppendSInt64(*(void **)(a1 + 32), a2);
}

@end
