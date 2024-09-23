@implementation MPModelPlaylistEntry

void __130__MPModelPlaylistEntry_MPCStoreFrontLocalEquivalencyMiddlewareAdditions__MPC_modelObjectWithStoreFrontLocalEquivalentModelObject___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  BOOL v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id *v11;
  id *v12;
  id v13;
  _QWORD *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  id v20;
  _QWORD v21[4];
  id v22;
  id v23;
  _QWORD v24[4];
  void *v25;
  void *v26;
  _QWORD v27[4];
  void *v28;
  void *v29;

  objc_msgSend(*(id *)(a1 + 32), "song");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "song");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v2)
    v5 = v3 == 0;
  else
    v5 = 1;
  if (!v5)
  {
    v9 = *(void **)(a1 + 32);
    objc_msgSend(v9, "identifiers");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v27[0] = MEMORY[0x24BDAC760];
    v27[1] = 3221225472;
    v27[2] = __130__MPModelPlaylistEntry_MPCStoreFrontLocalEquivalencyMiddlewareAdditions__MPC_modelObjectWithStoreFrontLocalEquivalentModelObject___block_invoke_2;
    v27[3] = &unk_24CAB3B40;
    v11 = &v28;
    v12 = &v29;
    v28 = v2;
    v29 = v4;
    v13 = v4;
    v20 = v2;
    v14 = v27;
LABEL_9:
    v15 = v9;
LABEL_10:
    v16 = objc_msgSend(v15, "copyWithIdentifiers:block:", v10, v14);
    v17 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v18 = *(void **)(v17 + 40);
    *(_QWORD *)(v17 + 40) = v16;

    goto LABEL_11;
  }

  objc_msgSend(*(id *)(a1 + 32), "movie");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "movie");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v6 && v7)
  {
    v9 = *(void **)(a1 + 32);
    objc_msgSend(v9, "identifiers");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v24[0] = MEMORY[0x24BDAC760];
    v24[1] = 3221225472;
    v24[2] = __130__MPModelPlaylistEntry_MPCStoreFrontLocalEquivalencyMiddlewareAdditions__MPC_modelObjectWithStoreFrontLocalEquivalentModelObject___block_invoke_3;
    v24[3] = &unk_24CAB3B40;
    v11 = &v25;
    v12 = &v26;
    v25 = v6;
    v26 = v8;
    v13 = v8;
    v20 = v6;
    v14 = v24;
    goto LABEL_9;
  }

  objc_msgSend(*(id *)(a1 + 32), "tvEpisode");
  v20 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "tvEpisode");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  if (v20 && v13)
  {
    v19 = *(void **)(a1 + 32);
    objc_msgSend(v19, "identifiers");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v21[0] = MEMORY[0x24BDAC760];
    v21[1] = 3221225472;
    v21[2] = __130__MPModelPlaylistEntry_MPCStoreFrontLocalEquivalencyMiddlewareAdditions__MPC_modelObjectWithStoreFrontLocalEquivalentModelObject___block_invoke_4;
    v21[3] = &unk_24CAB3B40;
    v11 = &v22;
    v20 = v20;
    v22 = v20;
    v12 = &v23;
    v13 = v13;
    v23 = v13;
    v14 = v21;
    v15 = v19;
    goto LABEL_10;
  }
LABEL_11:

}

void __130__MPModelPlaylistEntry_MPCStoreFrontLocalEquivalencyMiddlewareAdditions__MPC_modelObjectWithStoreFrontLocalEquivalentModelObject___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;
  id v4;
  id v5;

  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v4 = a2;
  objc_msgSend(v2, "MPC_modelObjectWithStoreFrontLocalEquivalentModelObject:", v3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setSong:", v5);

}

void __130__MPModelPlaylistEntry_MPCStoreFrontLocalEquivalencyMiddlewareAdditions__MPC_modelObjectWithStoreFrontLocalEquivalentModelObject___block_invoke_3(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;
  id v4;
  id v5;

  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v4 = a2;
  objc_msgSend(v2, "MPC_modelObjectWithStoreFrontLocalEquivalentModelObject:", v3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setMovie:", v5);

}

void __130__MPModelPlaylistEntry_MPCStoreFrontLocalEquivalencyMiddlewareAdditions__MPC_modelObjectWithStoreFrontLocalEquivalentModelObject___block_invoke_4(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;
  id v4;
  id v5;

  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v4 = a2;
  objc_msgSend(v2, "MPC_modelObjectWithStoreFrontLocalEquivalentModelObject:", v3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTvEpisode:", v5);

}

@end
