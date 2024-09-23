@implementation LSDClient

void __51___LSDClient_Private__handleXPCInvocation_isReply___block_invoke(uint64_t a1)
{
  void *v2;

  v2 = (void *)MEMORY[0x186DAE7A0]();
  objc_msgSend(*(id *)(a1 + 32), "invokeServiceInvocation:isReply:", *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 48));
  objc_autoreleasePoolPop(v2);
  objc_msgSend(*(id *)(a1 + 32), "didHandleInvocation:isReply:", *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 48));
  JUMPOUT(0x186DAF214);
}

@end
