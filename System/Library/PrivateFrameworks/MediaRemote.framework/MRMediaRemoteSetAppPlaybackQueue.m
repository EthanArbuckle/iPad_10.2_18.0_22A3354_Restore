@implementation MRMediaRemoteSetAppPlaybackQueue

uint64_t __MRMediaRemoteSetAppPlaybackQueue_block_invoke(uint64_t a1, int a2, CFIndex a3)
{
  uint64_t result;
  uint64_t v5;

  result = *(_QWORD *)(a1 + 32);
  if (result)
  {
    if (a2)
    {
      v5 = 1;
    }
    else
    {
      v5 = _MRSendCommandReplyContainsSuccessfulStatus(a3) ^ 1;
      result = *(_QWORD *)(a1 + 32);
    }
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, v5);
  }
  return result;
}

@end
