@implementation COClusterRealmExplicitMembership

void __46___COClusterRealmExplicitMembership_activate___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(v2, "clusterIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_setIdentifierLocked:", v3);

  v4 = *(void **)(a1 + 32);
  v5 = (id)objc_msgSend(*(id *)(a1 + 40), "copy");
  objc_msgSend(v4, "_setUpdateHandlerLocked:", v5);

}

@end
