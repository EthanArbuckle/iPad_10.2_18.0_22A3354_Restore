@implementation IOHIDEventSystemConnectionAddServices

void ___IOHIDEventSystemConnectionAddServices_block_invoke(uint64_t a1, const void *a2)
{
  if (!_IOHIDEventSystemConnectionContainsService(*(_QWORD *)(a1 + 32), a2))
    CFArrayAppendValue(*(CFMutableArrayRef *)(a1 + 40), a2);
}

@end
