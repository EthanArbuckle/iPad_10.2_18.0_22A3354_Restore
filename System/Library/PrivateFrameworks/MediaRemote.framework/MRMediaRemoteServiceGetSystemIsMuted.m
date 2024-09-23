@implementation MRMediaRemoteServiceGetSystemIsMuted

void __MRMediaRemoteServiceGetSystemIsMuted_block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;

  v3 = a2;
  if (*(_QWORD *)(a1 + 32))
  {
    v7 = v3;
    objc_msgSend(v3, "error");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    v5 = *(_QWORD *)(a1 + 32);
    if (v4)
    {
      objc_msgSend(v7, "error");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, _QWORD, void *))(v5 + 16))(v5, 0, v6);

    }
    else
    {
      (*(void (**)(uint64_t, uint64_t, _QWORD))(v5 + 16))(v5, objc_msgSend(v7, "isMuted"), 0);
    }
    v3 = v7;
  }

}

@end
