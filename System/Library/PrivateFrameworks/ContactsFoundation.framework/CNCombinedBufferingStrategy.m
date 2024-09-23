@implementation CNCombinedBufferingStrategy

uint64_t __69___CNCombinedBufferingStrategy_buffer_didReceiveResults_forObserver___block_invoke(_QWORD *a1, void *a2)
{
  return objc_msgSend(a2, "buffer:didReceiveResults:forObserver:", a1[4], a1[5], a1[6]);
}

uint64_t __53___CNCombinedBufferingStrategy_bufferDidSendResults___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "bufferDidSendResults:", *(_QWORD *)(a1 + 32));
}

@end
