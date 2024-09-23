@implementation MRResolveAndRequestPlaybackQueue

void ___MRResolveAndRequestPlaybackQueue_block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *Error;
  _QWORD v11[4];
  id v12;
  id v13;

  v5 = a2;
  v6 = a3;
  if (objc_msgSend(v5, "isResolved"))
  {
    +[MRNowPlayingOriginClientManager sharedManager](MRNowPlayingOriginClientManager, "sharedManager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "playerClientRequestsForPlayerPath:", v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = *(void **)(a1 + 32);
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = ___MRResolveAndRequestPlaybackQueue_block_invoke_2;
    v11[3] = &unk_1E30CB3E8;
    v12 = v5;
    v13 = *(id *)(a1 + 40);
    _MRRequestPlaybackQueue(v9, v8, v11);

  }
  else
  {
    if (v6)
      Error = 0;
    else
      Error = (void *)MRMediaRemoteNowPlayingPlayerPathCreateError(v5);
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

  }
}

void ___MRResolveAndRequestPlaybackQueue_block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5;
  id v6;
  id v7;

  v5 = *(_QWORD *)(a1 + 32);
  v6 = a3;
  v7 = a2;
  objc_msgSend(v7, "setResolvedPlayerPath:", v5);
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

@end
