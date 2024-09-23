@implementation CFUserNotificationCallback

BOOL ___CFUserNotificationCallback_block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "notification") == *(_QWORD *)(a1 + 32);
}

@end
