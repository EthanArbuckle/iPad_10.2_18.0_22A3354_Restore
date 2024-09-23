@implementation SendEvaluateAck

BOOL __SendEvaluateAck_block_invoke(uint64_t a1)
{
  return ServerConnectionSendCmdAck(*(_QWORD *)G_plugin, *(CFPropertyListRef *)(a1 + 32));
}

@end
