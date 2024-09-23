@implementation CFRunLoopRun

void ____CFRunLoopRun_block_invoke_2(uint64_t a1)
{
  CFRelease(*(CFTypeRef *)(a1 + 32));
}

void ____CFRunLoopRun_block_invoke(uint64_t a1)
{
  kdebug_trace();
  CFRunLoopWakeUp(*(CFRunLoopRef *)(a1 + 32));
}

@end
