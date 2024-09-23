@implementation MRMediaRemoteSetPlaybackStateForClient

uint64_t __MRMediaRemoteSetPlaybackStateForClient_block_invoke(uint64_t result, CFErrorRef err)
{
  uint64_t v2;

  v2 = *(_QWORD *)(result + 32);
  if (v2)
  {
    if (err)
      err = (CFErrorRef)CFErrorGetCode(err);
    return (*(uint64_t (**)(uint64_t, CFErrorRef))(v2 + 16))(v2, err);
  }
  return result;
}

@end
