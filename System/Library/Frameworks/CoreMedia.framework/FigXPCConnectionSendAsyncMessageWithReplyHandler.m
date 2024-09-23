@implementation FigXPCConnectionSendAsyncMessageWithReplyHandler

uint64_t __FigXPCConnectionSendAsyncMessageWithReplyHandler_block_invoke(uint64_t a1, void *a2)
{
  figXPCConnection_processServerReply(*(_QWORD *)(a1 + 40), a2);
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

@end
