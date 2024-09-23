@implementation ReceiveNotificationResponseCallback

void ___ReceiveNotificationResponseCallback_block_invoke(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  CFRelease(*(CFTypeRef *)(a1 + 40));
}

@end
