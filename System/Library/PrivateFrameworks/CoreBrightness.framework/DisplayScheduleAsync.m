@implementation DisplayScheduleAsync

void ___DisplayScheduleAsync_block_invoke(uint64_t a1)
{
  if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 176))
    IONotificationPortSetDispatchQueue(*(IONotificationPortRef *)(*(_QWORD *)(a1 + 32) + 176), *(dispatch_queue_t *)(*(_QWORD *)(a1 + 32) + 144));
}

@end
