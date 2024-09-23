@implementation IOHIDServiceTerminate

void ___IOHIDServiceTerminate_block_invoke(uint64_t a1, uint64_t a2)
{
  __IOHIDServiceNotification(*(_QWORD *)(a1 + 32), a2, 0xE0000010);
  CFRelease(*(CFTypeRef *)(a1 + 32));
}

@end
