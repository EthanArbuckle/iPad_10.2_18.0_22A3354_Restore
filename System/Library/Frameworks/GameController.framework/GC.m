@implementation GC

void __GC_IOHIDSetLEDs_block_invoke(uint64_t a1)
{
  IOHIDServiceClientSetElementValue();
  IOHIDServiceClientSetElementValue();
  IOHIDServiceClientSetElementValue();
  IOHIDServiceClientSetElementValue();
  CFRelease(*(CFTypeRef *)(a1 + 32));
}

@end
