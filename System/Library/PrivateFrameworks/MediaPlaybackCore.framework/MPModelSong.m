@implementation MPModelSong

void __121__MPModelSong_MPCStoreFrontLocalEquivalencyMiddlewareAdditions__MPC_modelObjectWithStoreFrontLocalEquivalentModelObject___block_invoke(uint64_t a1, void *a2)
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
  v12[2] = __121__MPModelSong_MPCStoreFrontLocalEquivalencyMiddlewareAdditions__MPC_modelObjectWithStoreFrontLocalEquivalentModelObject___block_invoke_2;
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
    v10[2] = __121__MPModelSong_MPCStoreFrontLocalEquivalencyMiddlewareAdditions__MPC_modelObjectWithStoreFrontLocalEquivalentModelObject___block_invoke_3;
    v10[3] = &unk_24CAB89A8;
    v11 = v5;
    objc_msgSend(v9, "setPersonalStoreIdentifiersWithPersonID:block:", v8, v10);

  }
}

void __121__MPModelSong_MPCStoreFrontLocalEquivalencyMiddlewareAdditions__MPC_modelObjectWithStoreFrontLocalEquivalentModelObject___block_invoke_4(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a2;
  if (objc_msgSend(v7, "hasLoadedValueForKey:", *MEMORY[0x24BDDC140]))
    objc_msgSend(v7, "setLibraryAddEligible:", objc_msgSend(*(id *)(a1 + 32), "isLibraryAddEligible"));
  if (objc_msgSend(v7, "hasLoadedValueForKey:", *MEMORY[0x24BDDC3B8]))
  {
    objc_msgSend(*(id *)(a1 + 32), "storeAsset");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setStoreAsset:", v3);

  }
  if (objc_msgSend(v7, "hasLoadedValueForKey:", *MEMORY[0x24BDDC378]))
  {
    objc_msgSend(v7, "album");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "album");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "MPC_modelObjectWithStoreFrontLocalEquivalentModelObject:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setAlbum:", v6);

  }
}

void __121__MPModelSong_MPCStoreFrontLocalEquivalencyMiddlewareAdditions__MPC_modelObjectWithStoreFrontLocalEquivalentModelObject___block_invoke_2(uint64_t a1, void *a2)
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

void __121__MPModelSong_MPCStoreFrontLocalEquivalencyMiddlewareAdditions__MPC_modelObjectWithStoreFrontLocalEquivalentModelObject___block_invoke_3(uint64_t a1, void *a2)
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

void __65__MPModelSong_ICRadioContentReference__mpc_radioContentReference__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  double v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  void *v35;
  void *v36;
  id v37;

  objc_msgSend(*(id *)(a1 + 32), "album");
  v37 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "artist");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "name");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v3, "length"))
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
    objc_msgSend(*(id *)(a1 + 40), "setAlbumArtistName:", v3);
  }
  objc_msgSend(v37, "title");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "length"))
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
    objc_msgSend(*(id *)(a1 + 40), "setAlbumName:", v4);
  }
  v5 = objc_msgSend(v37, "discCount");
  if (v5 >= 1)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
    v6 = *(void **)(a1 + 40);
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setDiscCount:", v7);

  }
  if (objc_msgSend(v37, "isCompilation"))
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
    v8 = *(void **)(a1 + 40);
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setCompilation:", v9);

  }
  v10 = objc_msgSend(v37, "trackCount");
  if (v10 >= 1)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
    v11 = *(void **)(a1 + 40);
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setTrackCount:", v12);

  }
  v13 = objc_msgSend(v37, "year");
  if (v13 >= 1)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
    v14 = *(void **)(a1 + 40);
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v13);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setYear:", v15);

  }
  objc_msgSend(*(id *)(a1 + 32), "artist");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "name");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v17, "length"))
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
    objc_msgSend(*(id *)(a1 + 40), "setArtistName:", v17);
  }
  objc_msgSend(*(id *)(a1 + 32), "composer");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "name");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v19, "length"))
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
    objc_msgSend(*(id *)(a1 + 40), "setComposerName:", v19);
  }
  objc_msgSend(*(id *)(a1 + 32), "copyrightText");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v20, "length"))
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
    objc_msgSend(*(id *)(a1 + 40), "setCopyright:", v20);
  }
  v21 = objc_msgSend(*(id *)(a1 + 32), "discNumber");
  if (v21 >= 1)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
    v22 = *(void **)(a1 + 40);
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v21);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setDiscNumber:", v23);

  }
  objc_msgSend(*(id *)(a1 + 32), "localFileAsset");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = objc_msgSend(v24, "fileSize");

  if (v25)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
    v26 = *(void **)(a1 + 40);
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", v25);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setFileSize:", v27);

  }
  objc_msgSend(*(id *)(a1 + 32), "genre");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "name");
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v29, "length"))
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
    objc_msgSend(*(id *)(a1 + 40), "setGenreName:", v29);
  }
  objc_msgSend(*(id *)(a1 + 32), "duration");
  if (v30 > 2.22044605e-16)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
    v31 = *(void **)(a1 + 40);
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "setDuration:", v32);

  }
  objc_msgSend(*(id *)(a1 + 32), "title");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v33, "length"))
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
    objc_msgSend(*(id *)(a1 + 40), "setName:", v33);
  }
  v34 = objc_msgSend(*(id *)(a1 + 32), "trackNumber");
  if (v34 >= 1)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
    v35 = *(void **)(a1 + 40);
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v34);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "setTrackNumber:", v36);

  }
}

void __68__MPModelSong_BehaviorMusicSharePlayAdditions__msp_shortDescription__block_invoke(uint64_t a1)
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
