@implementation AVPlayerPlaybackCoordinatorAsynchronouslyReloadTransportControlStateCallback

void __AVPlayerPlaybackCoordinatorAsynchronouslyReloadTransportControlStateCallback_block_invoke(uint64_t a1)
{
  NSObject *v2;
  _QWORD v3[4];
  __int128 v4;

  v2 = objc_msgSend(*(id *)(a1 + 32), "_figPlaybackCoordinatorConfigQueue");
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __AVPlayerPlaybackCoordinatorAsynchronouslyReloadTransportControlStateCallback_block_invoke_2;
  v3[3] = &__block_descriptor_48_e5_v8__0l;
  v4 = *(_OWORD *)(a1 + 40);
  dispatch_async(v2, v3);
}

uint64_t __AVPlayerPlaybackCoordinatorAsynchronouslyReloadTransportControlStateCallback_block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD))(a1 + 32))(*(_QWORD *)(a1 + 40));
}

@end
