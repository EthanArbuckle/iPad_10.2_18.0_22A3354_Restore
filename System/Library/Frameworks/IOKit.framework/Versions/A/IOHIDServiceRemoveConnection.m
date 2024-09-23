@implementation IOHIDServiceRemoveConnection

id ___IOHIDServiceRemoveConnection_block_invoke(uint64_t a1, uint64_t a2)
{
  return IOHIDServiceFilterClientNotification(a2, *(_QWORD *)(a1 + 32), 0);
}

@end
