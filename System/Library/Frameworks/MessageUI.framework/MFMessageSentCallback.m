@implementation MFMessageSentCallback

uint64_t ___MFMessageSentCallback_block_invoke(uint64_t a1)
{
  return +[_MFMessageObserver invokeCompletionForMessageGUID:didSend:](_MFMessageObserver, "invokeCompletionForMessageGUID:didSend:", *(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 40));
}

@end
