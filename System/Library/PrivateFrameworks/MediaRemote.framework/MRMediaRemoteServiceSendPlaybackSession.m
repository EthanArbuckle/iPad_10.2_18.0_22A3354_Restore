@implementation MRMediaRemoteServiceSendPlaybackSession

void __MRMediaRemoteServiceSendPlaybackSession_block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  id v3;
  id v4;
  void *v5;
  id v6;

  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
  {
    v3 = a2;
    objc_msgSend(v3, "error");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    if (v6)
      v4 = 0;
    else
      v4 = v3;
    objc_msgSend(v3, "error");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, id, void *))(v2 + 16))(v2, v4, v5);

  }
}

@end
