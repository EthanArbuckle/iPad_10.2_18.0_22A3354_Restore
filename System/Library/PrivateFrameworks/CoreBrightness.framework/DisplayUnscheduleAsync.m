@implementation DisplayUnscheduleAsync

void ___DisplayUnscheduleAsync_block_invoke(uint64_t a1)
{
  if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 176))
    IONotificationPortSetDispatchQueue(*(IONotificationPortRef *)(*(_QWORD *)(a1 + 32) + 176), 0);
}

@end
