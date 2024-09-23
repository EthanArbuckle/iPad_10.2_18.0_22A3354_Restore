@implementation HandleAdvertisingParameterChanged

void ___HandleAdvertisingParameterChanged_block_invoke(uint64_t a1)
{
  _NotifySessionsSystemInfoChange(*(_QWORD *)(a1 + 32));
  CFRelease(*(CFTypeRef *)(a1 + 32));
}

@end
