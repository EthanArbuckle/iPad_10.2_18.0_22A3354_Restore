@implementation MRMediaRemoteSetNowPlayingPlayer

uint64_t __MRMediaRemoteSetNowPlayingPlayer_block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void __MRMediaRemoteSetNowPlayingPlayer_block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  _QWORD v6[4];
  id v7;
  id v8;

  v3 = a2;
  v4 = *(void **)(a1 + 40);
  if (v4)
  {
    v5 = *(NSObject **)(a1 + 32);
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __MRMediaRemoteSetNowPlayingPlayer_block_invoke_2;
    v6[3] = &unk_1E30C6568;
    v8 = v4;
    v7 = v3;
    dispatch_async(v5, v6);

  }
}

@end
