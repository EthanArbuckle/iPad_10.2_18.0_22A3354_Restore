@implementation ZN13GLDContextRec15beginRenderPassEv

unsigned int *___ZN13GLDContextRec15beginRenderPassEv_block_invoke(uint64_t a1)
{
  return GLDContextRec::releaseQueryStagingBuffer(*(GLDContextRec **)(a1 + 32), *(GLDQueryStagingBuffer **)(a1 + 40));
}

@end
