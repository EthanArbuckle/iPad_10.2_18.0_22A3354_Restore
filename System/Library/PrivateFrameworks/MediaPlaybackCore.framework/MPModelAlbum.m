@implementation MPModelAlbum

void __122__MPModelAlbum_MPCStoreFrontLocalEquivalencyMiddlewareAdditions__MPC_modelObjectWithStoreFrontLocalEquivalentModelObject___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;
  _QWORD v12[4];
  id v13;

  v9 = a2;
  objc_msgSend(*(id *)(a1 + 32), "identifiers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = MEMORY[0x24BDAC760];
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __122__MPModelAlbum_MPCStoreFrontLocalEquivalencyMiddlewareAdditions__MPC_modelObjectWithStoreFrontLocalEquivalentModelObject___block_invoke_2;
  v12[3] = &unk_24CAB89F0;
  v5 = v3;
  v13 = v5;
  objc_msgSend(v9, "setUniversalStoreIdentifiersWithBlock:", v12);
  objc_msgSend(v5, "personalizedStore");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    objc_msgSend(v6, "personID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = v4;
    v10[1] = 3221225472;
    v10[2] = __122__MPModelAlbum_MPCStoreFrontLocalEquivalencyMiddlewareAdditions__MPC_modelObjectWithStoreFrontLocalEquivalentModelObject___block_invoke_3;
    v10[3] = &unk_24CAB89A8;
    v11 = v5;
    objc_msgSend(v9, "setPersonalStoreIdentifiersWithPersonID:block:", v8, v10);

  }
}

void __122__MPModelAlbum_MPCStoreFrontLocalEquivalencyMiddlewareAdditions__MPC_modelObjectWithStoreFrontLocalEquivalentModelObject___block_invoke_4(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if (objc_msgSend(v3, "hasLoadedValueForKey:", *MEMORY[0x24BDDBD90]))
    objc_msgSend(v3, "setLibraryAddEligible:", objc_msgSend(*(id *)(a1 + 32), "isLibraryAddEligible"));

}

void __122__MPModelAlbum_MPCStoreFrontLocalEquivalencyMiddlewareAdditions__MPC_modelObjectWithStoreFrontLocalEquivalentModelObject___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  id v7;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "universalStore");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAdamID:", objc_msgSend(v5, "adamID"));

  objc_msgSend(*(id *)(a1 + 32), "universalStore");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setSubscriptionAdamID:", objc_msgSend(v6, "subscriptionAdamID"));

  objc_msgSend(*(id *)(a1 + 32), "universalStore");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setPurchasedAdamID:", objc_msgSend(v7, "purchasedAdamID"));

}

void __122__MPModelAlbum_MPCStoreFrontLocalEquivalencyMiddlewareAdditions__MPC_modelObjectWithStoreFrontLocalEquivalentModelObject___block_invoke_3(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  id v5;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "personalizedStore");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "cloudAlbumID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setCloudAlbumID:", v4);

}

void __66__MPModelAlbum_ICRadioContentReference__mpc_radioContentReference__block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "title");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "length"))
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
    objc_msgSend(*(id *)(a1 + 40), "setAlbumName:", v2);
  }

}

void __69__MPModelAlbum_BehaviorMusicSharePlayAdditions__msp_shortDescription__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;

  v2 = (void *)MEMORY[0x24BDD17C8];
  v3 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "title");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR(" title='%@'"), v5);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "insertString:atIndex:", v4, objc_msgSend(*(id *)(a1 + 32), "length") - 1);

}

@end
