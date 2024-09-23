@implementation COClusterRealmHome

void __32___COClusterRealmHome_activate___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(v2, "specificHomeUUID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "UUIDString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_setIdentifierLocked:", v4);

  v5 = *(void **)(a1 + 32);
  v6 = (id)objc_msgSend(*(id *)(a1 + 40), "copy");
  objc_msgSend(v5, "_setUpdateHandlerLocked:", v6);

}

@end
