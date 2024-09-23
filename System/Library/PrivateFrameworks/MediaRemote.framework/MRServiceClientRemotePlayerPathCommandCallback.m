@implementation MRServiceClientRemotePlayerPathCommandCallback

uint64_t __MRServiceClientRemotePlayerPathCommandCallback_block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  uint64_t v5;

  v4 = a2;
  if ((objc_msgSend(a3, "canBeNowPlayingPlayer") & 1) != 0)
  {
    v5 = 1;
  }
  else if ((objc_msgSend(v4, "perPlayerCanBeNowPlaying") & 1) != 0)
  {
    v5 = 0;
  }
  else
  {
    v5 = objc_msgSend(v4, "canBeNowPlaying");
  }

  return v5;
}

void __MRServiceClientRemotePlayerPathCommandCallback_block_invoke_74(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  int v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  os_signpost_id_t v10;
  uint8_t v11[16];

  v3 = a2;
  objc_msgSend(v3, "error");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    v5 = *(_DWORD *)(a1 + 64);
    v6 = *(void **)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 40), "playerPath");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    MRMediaRemoteSendImplicitCommandsForOptions(v5, v6, v7);

  }
  _MRLogForCategory(2uLL);
  v8 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 48), "objectForKeyedSubscript:", CFSTR("kMRMediaRemoteOptionCommandID"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "hash");

  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
  {
    *(_WORD *)v11 = 0;
    _os_signpost_emit_with_name_impl(&dword_193827000, v8, OS_SIGNPOST_INTERVAL_END, v10, "SendCommand", ", v11, 2u);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
}

@end
