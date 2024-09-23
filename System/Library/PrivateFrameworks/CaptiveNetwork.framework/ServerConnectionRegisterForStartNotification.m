@implementation ServerConnectionRegisterForStartNotification

uint64_t __ServerConnectionRegisterForStartNotification_block_invoke(uint64_t a1, int a2)
{
  ServerConnectionConnect(*(_QWORD *)(a1 + 32), 1);
  return notify_cancel(a2);
}

@end
