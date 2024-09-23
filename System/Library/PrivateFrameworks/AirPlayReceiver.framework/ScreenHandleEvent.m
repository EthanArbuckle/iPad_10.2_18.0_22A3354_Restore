@implementation ScreenHandleEvent

void ___ScreenHandleEvent_block_invoke(uint64_t a1)
{
  AirPlayReceiverSessionForceKeyFrame(*(_QWORD *)(a1 + 32), 0, 0);
  CFRelease(*(CFTypeRef *)(a1 + 32));
}

@end
