@implementation MRServiceClientRemoteCommandCallback

void __MRServiceClientRemoteCommandCallback_block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  id v9;

  v3 = a2;
  objc_msgSend(v3, "playerPath");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "origin");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "playerPathByLocalizingWithOrigin:", v5);
  v8 = (id)objc_claimAutoreleasedReturnValue();

  v6 = v8;
  if (!v8)
    v6 = *(id *)(a1 + 32);
  v9 = v6;
  v7 = (void *)objc_msgSend(v3, "copyWithPlayerPath:", v6);

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

@end
