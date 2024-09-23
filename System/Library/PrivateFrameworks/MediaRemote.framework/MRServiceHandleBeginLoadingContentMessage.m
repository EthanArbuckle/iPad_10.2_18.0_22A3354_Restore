@implementation MRServiceHandleBeginLoadingContentMessage

void ___MRServiceHandleBeginLoadingContentMessage_block_invoke(uint64_t a1, uint64_t a2)
{
  _MRServiceSendReplyWithClientError(*(void **)(a1 + 32), a2);
}

@end
