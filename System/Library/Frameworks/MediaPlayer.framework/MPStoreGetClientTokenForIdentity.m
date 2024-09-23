@implementation MPStoreGetClientTokenForIdentity

void __MPStoreGetClientTokenForIdentity_block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;

  v5 = a2;
  v10 = v5;
  if (a3)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
  else
  {
    objc_msgSend(v5, "tokenResult");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "token");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = *(_QWORD *)(a1 + 32);
    if (v7)
    {
      objc_msgSend(v10, "lastError");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, void *, void *))(v8 + 16))(v8, v7, v9);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0DDBD38], -7102, 0);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, _QWORD, void *))(v8 + 16))(v8, 0, v9);
    }

  }
}

@end
