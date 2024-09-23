@implementation CNTemporalBufferingStrategy

uint64_t __69___CNTemporalBufferingStrategy_buffer_didReceiveResults_forObserver___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "sendBufferedResultsToObserver:", *(_QWORD *)(a1 + 40));
}

@end
