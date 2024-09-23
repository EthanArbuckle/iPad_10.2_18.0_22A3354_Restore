@implementation MTLRemoveMessageObserver

uint64_t __MTLRemoveMessageObserver_block_invoke(uint64_t a1)
{
  return objc_msgSend((id)s_notifierArray, "removeObject:", *(_QWORD *)(a1 + 32));
}

@end
