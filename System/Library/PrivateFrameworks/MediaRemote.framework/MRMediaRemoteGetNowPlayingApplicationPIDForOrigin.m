@implementation MRMediaRemoteGetNowPlayingApplicationPIDForOrigin

uint64_t __MRMediaRemoteGetNowPlayingApplicationPIDForOrigin_block_invoke(uint64_t result, void *a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(result + 32);
  if (v2)
    return (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 16))(v2, objc_msgSend(a2, "processIdentifier"));
  return result;
}

@end
