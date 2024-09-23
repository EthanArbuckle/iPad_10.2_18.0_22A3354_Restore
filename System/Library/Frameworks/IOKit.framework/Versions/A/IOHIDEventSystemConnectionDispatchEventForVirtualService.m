@implementation IOHIDEventSystemConnectionDispatchEventForVirtualService

void ___IOHIDEventSystemConnectionDispatchEventForVirtualService_block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _IOHIDServiceDispatchEvent(*(_QWORD *)(a1 + 32), *(HIDEvent **)(a1 + 40), a3);
  CFRelease(*(CFTypeRef *)(a1 + 40));
  CFRelease(*(CFTypeRef *)(a1 + 32));
}

@end
