@implementation IOHIDEventSystemConnectionDispatchEvent

void __IOHIDEventSystemConnectionDispatchEvent_block_invoke(uint64_t a1)
{
  _IOHIDEventSystemConnectionQueueStop(*(_QWORD *)(a1 + 32));
  CFRelease(*(CFTypeRef *)(a1 + 32));
}

@end
