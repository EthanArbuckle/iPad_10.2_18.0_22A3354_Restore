@implementation MRMediaRemoteServiceSetPlaybackState

uint64_t __MRMediaRemoteServiceSetPlaybackState_block_invoke(uint64_t a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(a1 + 32);
  if (v1)
    (*(void (**)(void))(v1 + 16))();
  return kdebug_trace();
}

@end
