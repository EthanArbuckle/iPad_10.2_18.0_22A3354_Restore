@implementation MRMediaRemoteGetNowPlayingApplicationIsPlayingForOrigin

uint64_t __MRMediaRemoteGetNowPlayingApplicationIsPlayingForOrigin_block_invoke(uint64_t result, int a2)
{
  uint64_t v2;
  _BOOL8 IsAdvancing;

  v2 = *(_QWORD *)(result + 32);
  if (v2)
  {
    IsAdvancing = MRMediaRemotePlaybackStateIsAdvancing(a2);
    return (*(uint64_t (**)(uint64_t, _BOOL8))(v2 + 16))(v2, IsAdvancing);
  }
  return result;
}

@end
