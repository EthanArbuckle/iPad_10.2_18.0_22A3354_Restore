@implementation IOHIDEventSystemConnectionRemoveVirtualService

void ___IOHIDEventSystemConnectionRemoveVirtualService_block_invoke(uint64_t a1)
{
  _IOHIDServiceTerminate(*(_QWORD **)(a1 + 32));
  CFRelease(*(CFTypeRef *)(a1 + 32));
}

@end
