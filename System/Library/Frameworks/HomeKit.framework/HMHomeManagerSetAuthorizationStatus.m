@implementation HMHomeManagerSetAuthorizationStatus

uint64_t ____HMHomeManagerSetAuthorizationStatus_block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "homeManager:didUpdateAuthorizationStatus:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

@end
