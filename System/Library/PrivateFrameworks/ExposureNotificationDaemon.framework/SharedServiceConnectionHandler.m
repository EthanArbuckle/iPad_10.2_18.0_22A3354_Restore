@implementation SharedServiceConnectionHandler

uint64_t __SharedServiceConnectionHandler_block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "xpcConnectionAccept:", *(_QWORD *)(a1 + 40));
}

@end
