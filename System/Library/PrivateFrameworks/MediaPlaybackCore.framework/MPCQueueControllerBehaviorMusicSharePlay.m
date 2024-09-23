@implementation MPCQueueControllerBehaviorMusicSharePlay

void __55___MPCQueueControllerBehaviorMusicSharePlay__setQueue___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v4 = a2;
  objc_msgSend(v4, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 152), "containsObject:", v3) & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "_emitEventsForAddedSharedListeningContainer:", v4);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 152), "addObject:", v3);
  }

}

void __89___MPCQueueControllerBehaviorMusicSharePlay__sectionObjectForSharedListeningContainerID___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v7;
  void *v8;
  int v9;
  id v10;

  v10 = a2;
  objc_msgSend(v10, "identifiers");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "vendorID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isEqualToString:", *(_QWORD *)(a1 + 32));

  if (v9)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
    *a4 = 1;
  }

}

void __74___MPCQueueControllerBehaviorMusicSharePlay__sectionedCollectionForQueue___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  id v7;
  void *v8;
  id *v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  uint64_t v23;
  id v24;
  _QWORD v25[4];
  id v26;
  uint64_t v27;
  id v28;
  _QWORD v29[4];
  id v30;
  _QWORD v31[4];
  id v32;
  _QWORD v33[4];
  id v34;
  _QWORD v35[4];
  id v36;

  v24 = a2;
  v5 = objc_msgSend(v24, "kind");
  v6 = MEMORY[0x24BDAC760];
  switch(v5)
  {
    case 1:
      v13 = objc_alloc(MEMORY[0x24BDDC758]);
      objc_msgSend(MEMORY[0x24BDDC838], "identityKind");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v35[0] = v6;
      v35[1] = 3221225472;
      v35[2] = __74___MPCQueueControllerBehaviorMusicSharePlay__sectionedCollectionForQueue___block_invoke_2;
      v35[3] = &unk_24CAB8A40;
      v9 = &v36;
      v36 = v24;
      v10 = (void *)objc_msgSend(v13, "initWithSource:modelKind:block:", CFSTR("MusicSharePlayBehavior"), v14, v35);

      v11 = objc_alloc(MEMORY[0x24BDDC830]);
      v12 = &__block_literal_global_16658;
      break;
    case 2:
    case 5:
      v7 = objc_alloc(MEMORY[0x24BDDC758]);
      objc_msgSend(MEMORY[0x24BDDC990], "identityKind");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v31[0] = v6;
      v31[1] = 3221225472;
      v31[2] = __74___MPCQueueControllerBehaviorMusicSharePlay__sectionedCollectionForQueue___block_invoke_8;
      v31[3] = &unk_24CAB8A40;
      v9 = &v32;
      v32 = v24;
      v10 = (void *)objc_msgSend(v7, "initWithSource:modelKind:block:", CFSTR("MusicSharePlayBehavior"), v8, v31);

      v11 = objc_alloc(MEMORY[0x24BDDC988]);
      v12 = &__block_literal_global_238;
      break;
    case 3:
      v15 = objc_alloc(MEMORY[0x24BDDC758]);
      objc_msgSend(MEMORY[0x24BDDC968], "identityKind");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v33[0] = v6;
      v33[1] = 3221225472;
      v33[2] = __74___MPCQueueControllerBehaviorMusicSharePlay__sectionedCollectionForQueue___block_invoke_5;
      v33[3] = &unk_24CAB8A40;
      v9 = &v34;
      v34 = v24;
      v10 = (void *)objc_msgSend(v15, "initWithSource:modelKind:block:", CFSTR("MusicSharePlayBehavior"), v16, v33);

      v11 = objc_alloc(MEMORY[0x24BDDC948]);
      v12 = &__block_literal_global_234;
      break;
    default:
      v17 = objc_alloc(MEMORY[0x24BDDC758]);
      objc_msgSend(MEMORY[0x24BDDC8B0], "identityKind");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v29[0] = v6;
      v29[1] = 3221225472;
      v29[2] = __74___MPCQueueControllerBehaviorMusicSharePlay__sectionedCollectionForQueue___block_invoke_11;
      v29[3] = &unk_24CAB8A40;
      v9 = &v30;
      v30 = v24;
      v10 = (void *)objc_msgSend(v17, "initWithSource:modelKind:block:", CFSTR("MusicSharePlayBehavior"), v18, v29);

      v11 = objc_alloc(MEMORY[0x24BDDC8A8]);
      v12 = &__block_literal_global_241;
      break;
  }
  v19 = (void *)objc_msgSend(v11, "initWithIdentifiers:block:", v10, v12);
  objc_msgSend(MEMORY[0x24BDDC890], "genericObjectWithModelObject:", v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "appendSection:", v20);
  objc_msgSend(*(id *)(a1 + 40), "tracklist");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v25[0] = v6;
  v25[1] = 3221225472;
  v25[2] = __74___MPCQueueControllerBehaviorMusicSharePlay__sectionedCollectionForQueue___block_invoke_13;
  v25[3] = &unk_24CAB6090;
  v22 = *(id *)(a1 + 48);
  v23 = *(_QWORD *)(a1 + 56);
  v26 = v22;
  v27 = v23;
  v28 = *(id *)(a1 + 32);
  objc_msgSend(v21, "enumerateItemsInSectionAtIndex:usingBlock:", a3, v25);

}

void __74___MPCQueueControllerBehaviorMusicSharePlay__sectionedCollectionForQueue___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  _QWORD v6[4];
  id v7;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setVendorID:", v5);

  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __74___MPCQueueControllerBehaviorMusicSharePlay__sectionedCollectionForQueue___block_invoke_3;
  v6[3] = &unk_24CAB89F0;
  v7 = *(id *)(a1 + 32);
  objc_msgSend(v4, "setUniversalStoreIdentifiersWithBlock:", v6);

}

void __74___MPCQueueControllerBehaviorMusicSharePlay__sectionedCollectionForQueue___block_invoke_5(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  _QWORD v6[4];
  id v7;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setVendorID:", v5);

  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __74___MPCQueueControllerBehaviorMusicSharePlay__sectionedCollectionForQueue___block_invoke_6;
  v6[3] = &unk_24CAB89F0;
  v7 = *(id *)(a1 + 32);
  objc_msgSend(v4, "setUniversalStoreIdentifiersWithBlock:", v6);

}

void __74___MPCQueueControllerBehaviorMusicSharePlay__sectionedCollectionForQueue___block_invoke_8(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  _QWORD v6[4];
  id v7;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setVendorID:", v5);

  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __74___MPCQueueControllerBehaviorMusicSharePlay__sectionedCollectionForQueue___block_invoke_9;
  v6[3] = &unk_24CAB8A18;
  v7 = *(id *)(a1 + 32);
  objc_msgSend(v4, "setRadioIdentifiersWithBlock:", v6);

}

void __74___MPCQueueControllerBehaviorMusicSharePlay__sectionedCollectionForQueue___block_invoke_11(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  id v4;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "identifier");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setVendorID:", v4);

}

void __74___MPCQueueControllerBehaviorMusicSharePlay__sectionedCollectionForQueue___block_invoke_13(id *a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  char v9;
  id *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  const char *v15;
  NSObject *v16;
  uint32_t v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  _QWORD v22[4];
  id v23;
  uint8_t buf[4];
  void *v25;
  __int16 v26;
  void *v27;
  __int16 v28;
  void *v29;
  __int16 v30;
  void *v31;
  _QWORD v32[5];

  v32[4] = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  objc_msgSend(v3, "playParams");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kind"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v6 = *MEMORY[0x24BDDC638];
    v32[0] = *MEMORY[0x24BDDC640];
    v32[1] = v6;
    v7 = *MEMORY[0x24BDDC658];
    v32[2] = *MEMORY[0x24BDDC650];
    v32[3] = v7;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v32, 4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "containsObject:", v5);

    if ((v9 & 1) != 0)
    {
      v10 = (id *)0x24BDDC9E0;
LABEL_11:
      objc_msgSend(*v10, "identityKind");
      v11 = objc_claimAutoreleasedReturnValue();
      v18 = objc_alloc(MEMORY[0x24BDDC758]);
      v22[0] = MEMORY[0x24BDAC760];
      v22[1] = 3221225472;
      v22[2] = __74___MPCQueueControllerBehaviorMusicSharePlay__sectionedCollectionForQueue___block_invoke_247;
      v22[3] = &unk_24CAB8A40;
      v23 = v3;
      v19 = (void *)objc_msgSend(v18, "initWithSource:modelKind:block:", CFSTR("MusicSharePlayBehavior"), v11, v22);
      v20 = (void *)objc_msgSend(objc_alloc((Class)-[NSObject modelClass](v11, "modelClass")), "initWithIdentifiers:block:", v19, &__block_literal_global_250);
      objc_msgSend(MEMORY[0x24BDDC890], "genericObjectWithModelObject:", v20);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1[6], "appendItem:", v21);

      goto LABEL_12;
    }
    if ((objc_msgSend(v5, "isEqualToString:", *MEMORY[0x24BDDC648]) & 1) != 0)
    {
      v10 = (id *)0x24BDDCA30;
      goto LABEL_11;
    }
    if ((objc_msgSend(v5, "isEqualToString:", *MEMORY[0x24BDDC630]) & 1) != 0)
    {
      v10 = (id *)0x24BDDC920;
      goto LABEL_11;
    }
    v11 = os_log_create("com.apple.amp.mediaplaybackcore", "MusicSharePlayBehavior");
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
      goto LABEL_12;
    objc_msgSend(a1[4], "engineID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1[5], "sessionID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "identifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544130;
    v25 = v12;
    v26 = 2114;
    v27 = v13;
    v28 = 2114;
    v29 = v14;
    v30 = 2114;
    v31 = v5;
    v15 = "[BMSP:%{public}@:%{public}@] _sectionedCollectionForQueue: | bailing [unsupported playParams[\"kind\"]] itemID"
          "=%{public}@ playParamsKind=%{public}@";
    v16 = v11;
    v17 = 42;
    goto LABEL_6;
  }
  v11 = os_log_create("com.apple.amp.mediaplaybackcore", "MusicSharePlayBehavior");
  if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
  {
    objc_msgSend(a1[4], "engineID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1[5], "sessionID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "identifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v25 = v12;
    v26 = 2114;
    v27 = v13;
    v28 = 2114;
    v29 = v14;
    v15 = "[BMSP:%{public}@:%{public}@] _sectionedCollectionForQueue: | bailing [missing playParams[\"kind\"]] itemID=%{public}@";
    v16 = v11;
    v17 = 32;
LABEL_6:
    _os_log_impl(&dword_210BD8000, v16, OS_LOG_TYPE_FAULT, v15, buf, v17);

  }
LABEL_12:

}

void __74___MPCQueueControllerBehaviorMusicSharePlay__sectionedCollectionForQueue___block_invoke_247(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  _QWORD v6[4];
  id v7;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setVendorID:", v5);

  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __74___MPCQueueControllerBehaviorMusicSharePlay__sectionedCollectionForQueue___block_invoke_2_248;
  v6[3] = &unk_24CAB89F0;
  v7 = *(id *)(a1 + 32);
  objc_msgSend(v4, "setUniversalStoreIdentifiersWithBlock:", v6);

}

void __74___MPCQueueControllerBehaviorMusicSharePlay__sectionedCollectionForQueue___block_invoke_2_248(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  id v4;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "mediaIdentifier");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAdamID:", objc_msgSend(v4, "longLongValue"));

}

void __74___MPCQueueControllerBehaviorMusicSharePlay__sectionedCollectionForQueue___block_invoke_9(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  id v6;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "mediaIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setStationStringID:", v5);

  objc_msgSend(*(id *)(a1 + 32), "stationHash");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setStationHash:", v6);

}

void __74___MPCQueueControllerBehaviorMusicSharePlay__sectionedCollectionForQueue___block_invoke_6(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  id v4;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "mediaIdentifier");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setGlobalPlaylistID:", v4);

}

void __74___MPCQueueControllerBehaviorMusicSharePlay__sectionedCollectionForQueue___block_invoke_3(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  id v4;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "mediaIdentifier");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAdamID:", objc_msgSend(v4, "longLongValue"));

}

void __73___MPCQueueControllerBehaviorMusicSharePlay__reloadCacheDataWithOptions___block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v4;
  id v5;
  id v6;

  v4 = *(void **)(a1 + 32);
  v5 = a2;
  objc_msgSend(a3, "vendorID");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v5, v6);

}

void __73___MPCQueueControllerBehaviorMusicSharePlay__reloadCacheDataWithOptions___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;
  uint64_t v11;
  id v12;

  objc_msgSend(a2, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __73___MPCQueueControllerBehaviorMusicSharePlay__reloadCacheDataWithOptions___block_invoke_3;
  v9[3] = &unk_24CAB6090;
  v7 = *(void **)(a1 + 32);
  v6 = *(_QWORD *)(a1 + 40);
  v10 = v5;
  v11 = v6;
  v12 = *(id *)(a1 + 48);
  v8 = v5;
  objc_msgSend(v7, "enumerateItemsInSectionAtIndex:usingBlock:", a3, v9);

}

void __73___MPCQueueControllerBehaviorMusicSharePlay__reloadCacheDataWithOptions___block_invoke_3(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;

  objc_msgSend(a2, "identifier");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  +[MPCQueueControllerBehaviorMusicIdentifierComponents itemComponentsWithSectionID:itemID:](MPCQueueControllerBehaviorMusicIdentifierComponents, "itemComponentsWithSectionID:itemID:", *(_QWORD *)(a1 + 32), v7);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(*(id *)(a1 + 40), "_useItemPlaceholderForItemID:", v7))
  {
    v4 = objc_msgSend(v3, "copyAsPlaceholder");

    v3 = (void *)v4;
  }
  v5 = *(void **)(a1 + 48);
  objc_msgSend(v3, "contentItemID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v6);

}

void __68___MPCQueueControllerBehaviorMusicSharePlay__queueAsStateDictionary__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  _QWORD v17[5];
  id v18;

  v5 = *(void **)(a1 + 32);
  v6 = a2;
  objc_msgSend(v6, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_sectionObjectForSharedListeningContainerID:", v7);
  v16 = (id)objc_claimAutoreleasedReturnValue();

  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v16, "msp_shortDescription");
  else
    objc_msgSend(v16, "description");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = *(void **)(a1 + 40);
  v10 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(v6, "shortDescription");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "stringWithFormat:", CFSTR("%@ - %@"), v11, v8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addObject:", v12);

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = *(void **)(a1 + 48);
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __68___MPCQueueControllerBehaviorMusicSharePlay__queueAsStateDictionary__block_invoke_2;
  v17[3] = &unk_24CAB6018;
  v17[4] = *(_QWORD *)(a1 + 32);
  v18 = v13;
  v15 = v13;
  objc_msgSend(v14, "enumerateItemsInSectionAtIndex:usingBlock:", a3, v17);
  objc_msgSend(*(id *)(a1 + 40), "addObject:", v15);

}

void __68___MPCQueueControllerBehaviorMusicSharePlay__queueAsStateDictionary__block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v4, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_itemObjectForSharedListeningItemID:", v5);
  v11 = (id)objc_claimAutoreleasedReturnValue();

  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v11, "msp_shortDescription");
  else
    objc_msgSend(v11, "description");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = *(void **)(a1 + 40);
  v8 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(v4, "shortDescription");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "stringWithFormat:", CFSTR("%@ - %@"), v9, v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addObject:", v10);

}

uint64_t __75___MPCQueueControllerBehaviorMusicSharePlay__purgePendingActionsWithLabel___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "label");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", *(_QWORD *)(a1 + 32));

  return v4;
}

void __88___MPCQueueControllerBehaviorMusicSharePlay__mpcSharedListeningEventForICLiveLinkEvent___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  _QWORD v14[5];
  id v15;

  v8 = a2;
  v9 = *(void **)(a1 + 32);
  v13 = v8;
  objc_msgSend(v8, "identifiers");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "vendorID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v9) = objc_msgSend(v9, "isEqualToString:", v11);

  if ((_DWORD)v9)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), a2);
    *a4 = 1;
    v14[0] = MEMORY[0x24BDAC760];
    v14[1] = 3221225472;
    v14[2] = __88___MPCQueueControllerBehaviorMusicSharePlay__mpcSharedListeningEventForICLiveLinkEvent___block_invoke_2;
    v14[3] = &unk_24CAB5F50;
    v12 = *(void **)(a1 + 40);
    v14[4] = *(_QWORD *)(a1 + 48);
    v15 = *(id *)(a1 + 56);
    objc_msgSend(v12, "enumerateItemsInSectionAtIndex:usingBlock:", a3, v14);

  }
}

void __88___MPCQueueControllerBehaviorMusicSharePlay__mpcSharedListeningEventForICLiveLinkEvent___block_invoke_3(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  id v15;
  _QWORD v16[5];
  id v17;
  id v18;
  uint64_t v19;

  v8 = a2;
  v9 = *(void **)(a1 + 32);
  v15 = v8;
  objc_msgSend(v8, "identifiers");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "vendorID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v9) = objc_msgSend(v9, "isEqualToString:", v11);

  if ((_DWORD)v9)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), a2);
    *a4 = 1;
    v16[0] = MEMORY[0x24BDAC760];
    v16[1] = 3221225472;
    v16[2] = __88___MPCQueueControllerBehaviorMusicSharePlay__mpcSharedListeningEventForICLiveLinkEvent___block_invoke_4;
    v16[3] = &unk_24CAB5FA0;
    v12 = *(void **)(a1 + 40);
    v16[4] = *(_QWORD *)(a1 + 48);
    v13 = *(id *)(a1 + 56);
    v14 = *(_QWORD *)(a1 + 80);
    v17 = v13;
    v19 = v14;
    v18 = *(id *)(a1 + 64);
    objc_msgSend(v12, "enumerateItemsInSectionAtIndex:usingBlock:", a3, v16);

  }
}

void __88___MPCQueueControllerBehaviorMusicSharePlay__mpcSharedListeningEventForICLiveLinkEvent___block_invoke_4(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  int v6;
  id obj;

  obj = (id)objc_msgSend(a2, "copyWithPropertySet:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 104));
  objc_msgSend(*(id *)(a1 + 40), "startItemIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(obj, "identifiers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "vendorID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v3, "isEqualToString:", v5);

  if (v6)
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), obj);
  objc_msgSend(*(id *)(a1 + 48), "addObject:", obj);

}

void __88___MPCQueueControllerBehaviorMusicSharePlay__mpcSharedListeningEventForICLiveLinkEvent___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;

  v3 = (id)objc_msgSend(a2, "copyWithPropertySet:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 104));
  objc_msgSend(*(id *)(a1 + 40), "addObject:", v3);

}

void __66___MPCQueueControllerBehaviorMusicSharePlay__initializeWithQueue___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  MPCModelStorePlaybackItemsRequest *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  id v31;
  void *v32;
  id v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  id v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  uint64_t v52;
  NSObject *v53;
  _BOOL4 v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  _BYTE buf[24];
  void *v64;
  id v65;
  uint64_t v66;

  v66 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    v7 = v6;
    v8 = os_log_create("com.apple.amp.mediaplaybackcore", "MusicSharePlayBehavior");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(*(id *)(a1 + 32), "engineID");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "sessionID");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      *(_QWORD *)&buf[4] = v9;
      *(_WORD *)&buf[12] = 2114;
      *(_QWORD *)&buf[14] = v10;
      *(_WORD *)&buf[22] = 2114;
      v64 = v7;
      _os_log_impl(&dword_210BD8000, v8, OS_LOG_TYPE_ERROR, "[BMSP:%{public}@:%{public}@] _initializeWithQueue: | failing command [failed to get expectedCurrentItem] error=%{public}@", buf, 0x20u);

    }
    objc_msgSend(v7, "msv_errorByWrappingWithDomain:code:debugDescription:", CFSTR("MPCMusicSharePlayBehaviorError"), 9, CFSTR("failed to get expectedCurrentItem from server during initial load"));
    v11 = (MPCModelStorePlaybackItemsRequest *)objc_claimAutoreleasedReturnValue();

    (*(void (**)(void))(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 16) + 16))();
    v12 = *(_QWORD *)(a1 + 40);
    v13 = *(void **)(v12 + 16);
    *(_QWORD *)(v12 + 16) = 0;

    objc_msgSend(*(id *)(a1 + 48), "rollback");
  }
  else
  {
    if (!v5)
    {
      objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v60, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 40), CFSTR("_MPCQueueControllerBehaviorMusicSharePlay.m"), 1337, CFSTR("Server didn't have expected current item"));

    }
    objc_msgSend(*(id *)(a1 + 40), "liveLink");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "identifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "expectingToJoinWithStartItem:asInitiator:", v15, objc_msgSend(*(id *)(a1 + 40), "joiningAsInitiator"));

    v11 = objc_alloc_init(MPCModelStorePlaybackItemsRequest);
    -[MPCModelStorePlaybackItemsRequest setPlaybackRequestEnvironment:](v11, "setPlaybackRequestEnvironment:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 32));
    objc_msgSend(MEMORY[0x24BDDC890], "mqf_requiredItemPlaybackProperties");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[MPCModelStorePlaybackItemsRequest setItemProperties:](v11, "setItemProperties:", v16);

    objc_msgSend(MEMORY[0x24BDDC890], "mqf_requiredSectionPlaybackProperties");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[MPCModelStorePlaybackItemsRequest setSectionProperties:](v11, "setSectionProperties:", v17);

    objc_msgSend(*(id *)(a1 + 40), "requestedPropertySetForEvents");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (v18)
    {
      v19 = os_log_create("com.apple.amp.mediaplaybackcore", "MusicSharePlayBehavior");
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(*(id *)(a1 + 32), "engineID");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 40), "sessionID");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 40), "requestedPropertySetForEvents");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        *(_QWORD *)&buf[4] = v20;
        *(_WORD *)&buf[12] = 2114;
        *(_QWORD *)&buf[14] = v21;
        *(_WORD *)&buf[22] = 2114;
        v64 = v22;
        _os_log_impl(&dword_210BD8000, v19, OS_LOG_TYPE_DEFAULT, "[BMSP:%{public}@:%{public}@] _initializeWithQueue: | adding client requested properites [] properites=%{public}@", buf, 0x20u);

      }
      -[MPCModelStorePlaybackItemsRequest itemProperties](v11, "itemProperties");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "requestedPropertySetForEvents");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "propertySetByCombiningWithPropertySet:", v24);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      -[MPCModelStorePlaybackItemsRequest setItemProperties:](v11, "setItemProperties:", v25);

      -[MPCModelStorePlaybackItemsRequest sectionProperties](v11, "sectionProperties");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "requestedPropertySetForEvents");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "propertySetByCombiningWithPropertySet:", v27);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      -[MPCModelStorePlaybackItemsRequest setSectionProperties:](v11, "setSectionProperties:", v28);

    }
    objc_msgSend(*(id *)(a1 + 40), "_sectionedCollectionForQueue:", *(_QWORD *)(a1 + 56));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[MPCModelStorePlaybackItemsRequest setSectionedModelObjects:](v11, "setSectionedModelObjects:", v29);

    objc_msgSend(v5, "identifier");
    v30 = (id)objc_claimAutoreleasedReturnValue();
    v31 = objc_alloc(MEMORY[0x24BDDC758]);
    objc_msgSend(MEMORY[0x24BDDC9E0], "identityKind");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    *(_QWORD *)buf = MEMORY[0x24BDAC760];
    *(_QWORD *)&buf[8] = 3221225472;
    *(_QWORD *)&buf[16] = ___MPCQCBMSPSongIdentifierSetForVendorID_block_invoke;
    v64 = &unk_24CAB8A40;
    v65 = v30;
    v33 = v30;
    v34 = (void *)objc_msgSend(v31, "initWithSource:modelKind:block:", CFSTR("MusicSharePlayBehavior"), v32, buf);

    -[MPCModelStorePlaybackItemsRequest sectionedModelObjects](v11, "sectionedModelObjects");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "indexPathForItemWithIdentifiersIntersectingSet:", v34);
    v36 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v36)
    {
      objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v61, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 40), CFSTR("_MPCQueueControllerBehaviorMusicSharePlay.m"), 1356, CFSTR("Invalid sectionedModelObjects -- does not contain start item: %@"), v5);

    }
    v62 = v36;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v62, 1);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    -[MPCModelStorePlaybackItemsRequest setPlaybackPrioritizedIndexPaths:](v11, "setPlaybackPrioritizedIndexPaths:", v37);

    -[MPCModelStorePlaybackItemsRequest setClientIdentifier:](v11, "setClientIdentifier:", CFSTR("com.apple.Music"));
    -[MPCModelStorePlaybackItemsRequest setLabel:](v11, "setLabel:", CFSTR("com.apple.MediaPlaybackCore.MPCQueueControllerBehaviorMusicSharePlay"));
    v38 = objc_alloc_init(MEMORY[0x24BDDC9B8]);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 128), "setRequest:", v38);

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 128), "request");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "setTimeoutInterval:", 0.0);

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 128), "request");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "setQualityOfService:", 25);

    -[MPCModelStorePlaybackItemsRequest label](v11, "label");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 128), "request");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "setLabel:", v41);

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 128), "request");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "setModelRequest:", v11);

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 128), "setNeedsReload");
    objc_msgSend(*(id *)(a1 + 56), "tracklist");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "sectionAtIndex:", objc_msgSend(v36, "msv_section"));
    v45 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v45, "identifier");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "identifier");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    +[MPCQueueControllerBehaviorMusicIdentifierComponents itemComponentsWithSectionID:itemID:](MPCQueueControllerBehaviorMusicIdentifierComponents, "itemComponentsWithSectionID:itemID:", v46, v47);
    v48 = (void *)objc_claimAutoreleasedReturnValue();

    v49 = (void *)objc_msgSend(v48, "copyAsPlaceholder");
    v50 = *(void **)(a1 + 48);
    objc_msgSend(v49, "contentItemID");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "setSuggestedContentItemIDForStart:", v51);

    objc_msgSend(*(id *)(a1 + 40), "_setQueue:", *(_QWORD *)(a1 + 56));
    objc_msgSend(*(id *)(a1 + 48), "commit");
    v52 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v53 = os_log_create("com.apple.amp.mediaplaybackcore", "MusicSharePlayBehavior");
    v54 = os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT);
    if (v52)
    {
      if (v54)
      {
        objc_msgSend(*(id *)(a1 + 32), "engineID");
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 40), "sessionID");
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        v57 = *(void **)(*(_QWORD *)(a1 + 40) + 8);
        *(_DWORD *)buf = 138543874;
        *(_QWORD *)&buf[4] = v55;
        *(_WORD *)&buf[12] = 2114;
        *(_QWORD *)&buf[14] = v56;
        *(_WORD *)&buf[22] = 2114;
        v64 = v57;
        _os_log_impl(&dword_210BD8000, v53, OS_LOG_TYPE_DEFAULT, "[BMSP:%{public}@:%{public}@] _initializeWithQueue: | begin synchronized playback with AVPlaybackCoordinator [] playbackCoordinator=%{public}@", buf, 0x20u);

      }
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 112), "beginSynchronizedPlaybackWithAVPlaybackCoordinator:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8));
    }
    else
    {
      if (v54)
      {
        objc_msgSend(*(id *)(a1 + 32), "engineID");
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 40), "sessionID");
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        *(_QWORD *)&buf[4] = v58;
        *(_WORD *)&buf[12] = 2114;
        *(_QWORD *)&buf[14] = v59;
        _os_log_impl(&dword_210BD8000, v53, OS_LOG_TYPE_DEFAULT, "[BMSP:%{public}@:%{public}@] _initializeWithQueue: | deferred begin synchronized playback with AVPlaybackCoordinator [coordinator unavailable]", buf, 0x16u);

      }
    }

  }
}

_BYTE *__90___MPCQueueControllerBehaviorMusicSharePlay__emitEventsForParticipants_localUserIdentity___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  _BYTE *v4;
  void *v5;
  void *v6;
  char v7;

  v3 = a2;
  objc_msgSend(v3, "msp_mpcParticipant");
  v4 = (_BYTE *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5 == v6)
  {
    v7 = 1;
    if (!v4)
      goto LABEL_4;
    goto LABEL_3;
  }
  v7 = objc_msgSend(v5, "isEqual:", v6);
  if (v4)
LABEL_3:
    v4[8] = v7;
LABEL_4:

  return v4;
}

void __81___MPCQueueControllerBehaviorMusicSharePlay__componentsForSharedListeningItemID___block_invoke(_QWORD *a1, void *a2, void *a3, _BYTE *a4)
{
  id v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  id v25;

  v25 = a2;
  v7 = a3;
  objc_msgSend(v25, "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isEqualToString:", a1[4]);

  if (v9)
  {
    objc_msgSend(*(id *)(a1[5] + 120), "tracklist");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "sectionAtIndex:", objc_msgSend(v7, "msv_section"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v11, "identifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "identifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    +[MPCQueueControllerBehaviorMusicIdentifierComponents itemComponentsWithSectionID:itemID:](MPCQueueControllerBehaviorMusicIdentifierComponents, "itemComponentsWithSectionID:itemID:", v12, v13);
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = *(_QWORD *)(a1[6] + 8);
    v16 = *(void **)(v15 + 40);
    *(_QWORD *)(v15 + 40) = v14;

    v17 = (void *)a1[5];
    objc_msgSend(v25, "identifier");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v17) = objc_msgSend(v17, "_useItemPlaceholderForItemID:", v18);

    if ((_DWORD)v17)
    {
      v19 = objc_msgSend(*(id *)(*(_QWORD *)(a1[6] + 8) + 40), "copyAsPlaceholder");
      v20 = *(_QWORD *)(a1[6] + 8);
      v21 = *(void **)(v20 + 40);
      *(_QWORD *)(v20 + 40) = v19;

    }
    if (objc_msgSend(v25, "isAutoPlayItem"))
    {
      v22 = objc_msgSend(*(id *)(*(_QWORD *)(a1[6] + 8) + 40), "copyWithBehaviorFlags:", 1);
      v23 = *(_QWORD *)(a1[6] + 8);
      v24 = *(void **)(v23 + 40);
      *(_QWORD *)(v23 + 40) = v22;

    }
    *a4 = 1;

  }
}

void __70___MPCQueueControllerBehaviorMusicSharePlay_liveLink_didReceiveEvent___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  _QWORD v14[5];
  id v15;
  id v16;
  id v17;
  _BYTE location[12];
  __int16 v19;
  void *v20;
  __int16 v21;
  uint64_t v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "primaryReferencedIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    objc_initWeak((id *)location, *(id *)(a1 + 40));
    v3 = *(void **)(a1 + 40);
    v4 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(*(id *)(a1 + 32), "type");
    NSStringFromICLiveLinkEventType();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringWithFormat:", CFSTR("Event-%@"), v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = MEMORY[0x24BDAC760];
    v14[1] = 3221225472;
    v14[2] = __70___MPCQueueControllerBehaviorMusicSharePlay_liveLink_didReceiveEvent___block_invoke_2;
    v14[3] = &unk_24CAB5E90;
    v14[4] = *(_QWORD *)(a1 + 40);
    v15 = v2;
    v16 = *(id *)(a1 + 32);
    objc_copyWeak(&v17, (id *)location);
    objc_msgSend(v3, "_enqueuePendingActionWithLabel:itemIdentifier:block:", v6, v15, v14);

    objc_destroyWeak(&v17);
    objc_destroyWeak((id *)location);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "host");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "_mpcSharedListeningEventForICLiveLinkEvent:", *(_QWORD *)(a1 + 32));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      v9 = os_log_create("com.apple.amp.mediaplaybackcore", "MusicSharePlayBehavior");
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v7, "engineID");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 40), "sessionID");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = *(_QWORD *)(a1 + 32);
        *(_DWORD *)location = 138544130;
        *(_QWORD *)&location[4] = v10;
        v19 = 2114;
        v20 = v11;
        v21 = 2114;
        v22 = v12;
        v23 = 2114;
        v24 = v8;
        _os_log_impl(&dword_210BD8000, v9, OS_LOG_TYPE_DEFAULT, "[BMSP:%{public}@:%{public}@] liveLink:didReceiveEvent: | calling delegate [] event=%{public}@ sharedListeningEvent=%{public}@", location, 0x2Au);

      }
      objc_msgSend(*(id *)(a1 + 40), "musicSharePlayBehaviorDelegate");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "behavior:didReceiveSharedListeningEvent:", *(_QWORD *)(a1 + 40), v8);

    }
    else
    {

    }
  }

}

void __70___MPCQueueControllerBehaviorMusicSharePlay_liveLink_didReceiveEvent___block_invoke_2(uint64_t a1, uint64_t a2)
{
  void *v4;
  NSObject *v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *WeakRetained;
  NSObject *v14;
  void *v15;
  NSObject *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  NSObject *v20;
  uint64_t v21;
  int v22;
  void *v23;
  __int16 v24;
  NSObject *v25;
  __int16 v26;
  uint64_t v27;
  __int16 v28;
  uint64_t v29;
  __int16 v30;
  void *v31;
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "host");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (a2 == 2)
  {
    v5 = os_log_create("com.apple.amp.mediaplaybackcore", "MusicSharePlayBehavior");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v4, "engineID");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "sessionID");
      v7 = objc_claimAutoreleasedReturnValue();
      v11 = *(_QWORD *)(a1 + 40);
      v12 = *(_QWORD *)(a1 + 48);
      v22 = 138544130;
      v23 = v6;
      v24 = 2114;
      v25 = v7;
      v26 = 2114;
      v27 = v11;
      v28 = 2114;
      v29 = v12;
      v10 = "[BMSP:%{public}@:%{public}@] liveLink:didReceiveEvent: | dropping event [purged waiting on item: %{public}@]"
            " event=%{public}@";
      goto LABEL_7;
    }
  }
  else if (a2 == 1)
  {
    v5 = os_log_create("com.apple.amp.mediaplaybackcore", "MusicSharePlayBehavior");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v4, "engineID");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "sessionID");
      v7 = objc_claimAutoreleasedReturnValue();
      v8 = *(_QWORD *)(a1 + 40);
      v9 = *(_QWORD *)(a1 + 48);
      v22 = 138544130;
      v23 = v6;
      v24 = 2114;
      v25 = v7;
      v26 = 2114;
      v27 = v8;
      v28 = 2114;
      v29 = v9;
      v10 = "[BMSP:%{public}@:%{public}@] liveLink:didReceiveEvent: | dropping event [expired waiting on item: %{public}@"
            "] event=%{public}@";
LABEL_7:
      _os_log_impl(&dword_210BD8000, v5, OS_LOG_TYPE_DEFAULT, v10, (uint8_t *)&v22, 0x2Au);
LABEL_15:

    }
  }
  else
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
    v5 = WeakRetained;
    if (WeakRetained)
    {
      -[NSObject _mpcSharedListeningEventForICLiveLinkEvent:](WeakRetained, "_mpcSharedListeningEventForICLiveLinkEvent:", *(_QWORD *)(a1 + 48));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = os_log_create("com.apple.amp.mediaplaybackcore", "MusicSharePlayBehavior");
      v7 = v14;
      if (v6)
      {
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(v4, "engineID");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(a1 + 32), "sessionID");
          v16 = objc_claimAutoreleasedReturnValue();
          v17 = *(_QWORD *)(a1 + 40);
          v18 = *(_QWORD *)(a1 + 48);
          v22 = 138544386;
          v23 = v15;
          v24 = 2114;
          v25 = v16;
          v26 = 2114;
          v27 = v17;
          v28 = 2114;
          v29 = v18;
          v30 = 2114;
          v31 = v6;
          _os_log_impl(&dword_210BD8000, v7, OS_LOG_TYPE_DEFAULT, "[BMSP:%{public}@:%{public}@] liveLink:didReceiveEvent: | calling delegate [item valid: %{public}@] event=%{public}@ sharedListeningEvent=%{public}@", (uint8_t *)&v22, 0x34u);

        }
        -[NSObject musicSharePlayBehaviorDelegate](v5, "musicSharePlayBehaviorDelegate");
        v7 = objc_claimAutoreleasedReturnValue();
        -[NSObject behavior:didReceiveSharedListeningEvent:](v7, "behavior:didReceiveSharedListeningEvent:", v5, v6);
      }
      else if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v4, "engineID");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 32), "sessionID");
        v20 = objc_claimAutoreleasedReturnValue();
        v21 = *(_QWORD *)(a1 + 48);
        v22 = 138543874;
        v23 = v19;
        v24 = 2114;
        v25 = v20;
        v26 = 2114;
        v27 = v21;
        _os_log_impl(&dword_210BD8000, v7, OS_LOG_TYPE_ERROR, "[BMSP:%{public}@:%{public}@] liveLink:didReceiveEvent: | dropping event [unable to convert to shared listening event] event=%{public}@", (uint8_t *)&v22, 0x20u);

      }
      goto LABEL_15;
    }
  }

}

void __105___MPCQueueControllerBehaviorMusicSharePlay_liveLink_didReceiveDirectCurrentItemChanged_fromParticipant___block_invoke(id *a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  id v17[2];
  id location;
  _QWORD v19[2];
  _QWORD v20[3];

  v20[2] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1[4], "_purgePendingActionsWithLabel:", CFSTR("ChangeCurrentItem"));
  objc_initWeak(&location, a1[4]);
  objc_msgSend(a1[5], "identifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1[4], "host");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "eventStream");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = CFSTR("shared-session-id");
  objc_msgSend(a1[4], "liveLink");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x24BDBCEF8], "null");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v19[1] = CFSTR("originating-participant");
  v20[0] = v7;
  objc_msgSend(a1[6], "msp_mpcParticipant");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x24BDBCEF8], "null");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v20[1] = v9;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v20, v19, 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "emitEventType:payload:", CFSTR("shared-session-synchronization-begin"), v10);

  if (!v8)
  if (!v6)

  v11 = a1[4];
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __105___MPCQueueControllerBehaviorMusicSharePlay_liveLink_didReceiveDirectCurrentItemChanged_fromParticipant___block_invoke_2;
  v14[3] = &unk_24CAB5E68;
  objc_copyWeak(v17, &location);
  v12 = v2;
  v17[1] = a1[7];
  v13 = a1[4];
  v15 = v12;
  v16 = v13;
  objc_msgSend(v11, "_enqueuePendingActionWithLabel:itemIdentifier:block:", CFSTR("ChangeCurrentItem"), v12, v14);

  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
}

void __105___MPCQueueControllerBehaviorMusicSharePlay_liveLink_didReceiveDirectCurrentItemChanged_fromParticipant___block_invoke_2(uint64_t a1, uint64_t a2)
{
  id *WeakRetained;
  id *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  _QWORD v21[2];
  _QWORD v22[3];

  v22[2] = *MEMORY[0x24BDAC8D0];
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  v5 = WeakRetained;
  if (!WeakRetained)
  {
LABEL_10:
    v11 = 0;
    goto LABEL_14;
  }
  if (a2 == 2)
  {
    objc_msgSend(MEMORY[0x24BDD1540], "msv_errorWithDomain:code:underlyingError:debugDescription:", CFSTR("MPCMusicSharePlayBehaviorError"), 12, 0, CFSTR("Pending action for %@ was interrupted"), *(_QWORD *)(a1 + 32));
  }
  else
  {
    if (a2 != 1)
    {
      if (!a2)
      {
        objc_msgSend(WeakRetained, "_componentsForSharedListeningItemID:", *(_QWORD *)(a1 + 32));
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v6)
        {
          objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 40), CFSTR("_MPCQueueControllerBehaviorMusicSharePlay.m"), 1122, CFSTR("Pending action flushed but item was still not found [nil components]: %@"), *(_QWORD *)(a1 + 32));

        }
        objc_msgSend(v5[20], "objectForKeyedSubscript:", *(_QWORD *)(a1 + 32));
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v7)
        {
          objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 40), CFSTR("_MPCQueueControllerBehaviorMusicSharePlay.m"), 1125, CFSTR("Pending action flushed but item was still not found [nil indexPath]: %@"), *(_QWORD *)(a1 + 32));

        }
        objc_msgSend(v5, "externalSyncHost");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "beginExternalSyncEditWithReason:", CFSTR("LiveLink-DirectItemChange"));
        v9 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v6, "contentItemID");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "setTargetContentItemID:", v10);

        objc_msgSend(v9, "commit");
      }
      goto LABEL_10;
    }
    objc_msgSend(MEMORY[0x24BDD1540], "msv_errorWithDomain:code:underlyingError:debugDescription:", CFSTR("MPCMusicSharePlayBehaviorError"), 13, 0, CFSTR("Pending action for %@ timed out [item never arrived]"), *(_QWORD *)(a1 + 32));
  }
  v11 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_14:
  objc_msgSend(v5, "host");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "eventStream");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = CFSTR("shared-session-id");
  objc_msgSend(v5, "liveLink");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "identifier");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v15;
  if (!v15)
  {
    objc_msgSend(MEMORY[0x24BDBCEF8], "null");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v21[1] = CFSTR("shared-sync-error");
  v22[0] = v16;
  v17 = v11;
  if (!v11)
  {
    objc_msgSend(MEMORY[0x24BDBCEF8], "null");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v22[1] = v17;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v22, v21, 2);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "emitEventType:payload:", CFSTR("shared-session-synchronization-end"), v18);

  if (!v11)
  {

    if (v15)
      goto LABEL_20;
LABEL_22:

    goto LABEL_20;
  }
  if (!v15)
    goto LABEL_22;
LABEL_20:

}

void __69___MPCQueueControllerBehaviorMusicSharePlay_liveLink_didUpdateQueue___block_invoke(uint64_t a1)
{
  _QWORD *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v2 = *(_QWORD **)(a1 + 32);
  if (v2[15])
  {
    objc_msgSend(v2, "host");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "beginEditWithReason:", CFSTR("BehaviorSharePlay-liveLinkDidUpdateQueue"));
    v7 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 128), "request");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "modelRequest");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "setShouldBatchResultsWithPlaceholderObjects:", 0);
    objc_msgSend(v5, "setPlaybackPrioritizedIndexPaths:", MEMORY[0x24BDBD1A8]);
    objc_msgSend(*(id *)(a1 + 32), "_sectionedCollectionForQueue:", *(_QWORD *)(a1 + 40));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setSectionedModelObjects:", v6);

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 128), "setNeedsReload");
    objc_msgSend(*(id *)(a1 + 32), "_setQueue:", *(_QWORD *)(a1 + 40));
    objc_msgSend(v7, "commit");

  }
  else
  {
    objc_msgSend(v2, "_initializeWithQueue:", *(_QWORD *)(a1 + 40));
  }
}

void __76___MPCQueueControllerBehaviorMusicSharePlay_liveLink_didUpdateParticipants___block_invoke(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  id v3;

  v1 = *(void **)(a1 + 32);
  v2 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 48), "identity");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "_emitEventsForParticipants:localUserIdentity:", v2, v3);

}

void __82___MPCQueueControllerBehaviorMusicSharePlay_liveLink_didEncounterError_willRetry___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD v13[3];
  _QWORD v14[3];
  uint8_t buf[4];
  void *v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  uint64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "host");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (*(_BYTE *)(a1 + 48))
  {
    objc_msgSend(v2, "eventStream");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "sessionID", CFSTR("session-id"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (!v5)
    {
      objc_msgSend(MEMORY[0x24BDBCEF8], "null");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v14[0] = v6;
    v14[1] = CFSTR("LiveLink Encountered Error");
    v13[1] = CFSTR("shared-session-event-reason");
    v13[2] = CFSTR("shared-session-is-reconnect");
    v14[2] = MEMORY[0x24BDBD1C8];
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v14, v13, 3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "emitEventType:payload:", CFSTR("shared-session-end"), v7);

    if (!v5)
    goto LABEL_10;
  }
  v8 = os_log_create("com.apple.amp.mediaplaybackcore", "MusicSharePlayBehavior");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
  {
    objc_msgSend(v3, "engineID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "sessionID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = *(_QWORD *)(a1 + 40);
    *(_DWORD *)buf = 138543874;
    v16 = v9;
    v17 = 2114;
    v18 = v10;
    v19 = 2114;
    v20 = v11;
    _os_log_impl(&dword_210BD8000, v8, OS_LOG_TYPE_ERROR, "[BMSP:%{public}@:%{public}@] liveLink:didEncounterError: | stopping [not attempting retry] error=%{public}@", buf, 0x20u);

  }
  if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 16))
  {
    objc_msgSend(MEMORY[0x24BDD1540], "msv_errorWithDomain:code:underlyingError:debugDescription:", CFSTR("MPCMusicSharePlayBehaviorError"), 9, *(_QWORD *)(a1 + 40), CFSTR("Unexpected live link error during initial load"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(void))(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 16) + 16))();
    v12 = *(_QWORD *)(a1 + 32);
    v5 = *(void **)(v12 + 16);
    *(_QWORD *)(v12 + 16) = 0;
LABEL_10:

  }
}

void __61___MPCQueueControllerBehaviorMusicSharePlay_didStopLiveLink___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _BYTE *v11;
  _BOOL8 v12;
  void *v13;
  _QWORD v14[2];
  _QWORD v15[3];

  v15[2] = *MEMORY[0x24BDAC8D0];
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 40) = 1;
  objc_msgSend(*(id *)(a1 + 32), "host");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "beginEditWithReason:", CFSTR("LiveLinkDidStop"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "_setQueue:", 0);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 128), "request");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "modelRequest");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "setShouldBatchResultsWithPlaceholderObjects:", 0);
  objc_msgSend(v5, "setPlaybackPrioritizedIndexPaths:", MEMORY[0x24BDBD1A8]);
  v6 = objc_alloc_init(MEMORY[0x24BDDCBB0]);
  objc_msgSend(v5, "setSectionedModelObjects:", v6);

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 128), "setNeedsReload");
  objc_msgSend(v3, "commit");
  objc_msgSend(v2, "eventStream");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = CFSTR("session-id");
  objc_msgSend(*(id *)(a1 + 32), "sessionID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x24BDBCEF8], "null");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v14[1] = CFSTR("shared-session-event-reason");
  v15[0] = v9;
  v15[1] = CFSTR("LiveLink Stopped");
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v15, v14, 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "emitEventType:payload:", CFSTR("shared-session-end"), v10);

  if (!v8)
  v11 = *(_BYTE **)(a1 + 32);
  v12 = v11[41] == 0;
  objc_msgSend(v11, "musicSharePlayBehaviorDelegate");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "behavior:didEndSharePlaySessionWithReason:", *(_QWORD *)(a1 + 32), v12);

}

void __66___MPCQueueControllerBehaviorMusicSharePlay_liveLinkDidReconnect___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v9[5];
  _QWORD v10[6];

  v10[5] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "host");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "eventStream");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = CFSTR("session-id");
  objc_msgSend(*(id *)(a1 + 32), "sessionID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (!v4)
  {
    objc_msgSend(MEMORY[0x24BDBCEF8], "null");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v10[0] = v5;
  v9[1] = CFSTR("shared-session-id");
  objc_msgSend(*(id *)(a1 + 32), "sessionID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x24BDBCEF8], "null");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v10[1] = v7;
  v10[2] = &unk_24CB16C20;
  v9[2] = CFSTR("shared-session-type");
  v9[3] = CFSTR("shared-session-event-reason");
  v9[4] = CFSTR("shared-session-is-reconnect");
  v10[3] = CFSTR("LiveLink Reconnect");
  v10[4] = MEMORY[0x24BDBD1C8];
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v10, v9, 5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "emitEventType:payload:", CFSTR("shared-session-begin"), v8);

  if (!v6)
  if (!v4)

}

void __82___MPCQueueControllerBehaviorMusicSharePlay_controller_defersResponseReplacement___block_invoke(uint64_t a1)
{
  void *v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;

  objc_msgSend(*(id *)(a1 + 32), "host");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "beginEditWithReason:", CFSTR("BehaviorMusicSharePlay-newResponse"));
  v7 = (id)objc_claimAutoreleasedReturnValue();

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  objc_msgSend(*(id *)(a1 + 32), "_reloadCacheDataWithOptions:", 1);
  objc_msgSend(v7, "commit");
  v3 = *(_QWORD **)(a1 + 32);
  v4 = v3[2];
  if (v4)
  {
    (*(void (**)(_QWORD, _QWORD))(v4 + 16))(v3[2], 0);
    v5 = *(_QWORD *)(a1 + 32);
    v6 = *(void **)(v5 + 16);
    *(_QWORD *)(v5 + 16) = 0;

    v3 = *(_QWORD **)(a1 + 32);
  }
  objc_msgSend(v3, "_dequeuePendingActions");

}

void __97___MPCQueueControllerBehaviorMusicSharePlay_performInsertCommand_targetContentItemID_completion___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  id v9;
  void *v10;
  _QWORD v11[4];
  id v12;
  id v13;
  id v14;
  uint64_t v15;
  id v16;
  uint64_t v17;

  v5 = a2;
  v6 = v5;
  if (!v5 || a3)
  {
    objc_msgSend(MEMORY[0x24BDD1540], "msv_errorWithDomain:code:underlyingError:debugDescription:", CFSTR("MPCMusicSharePlayBehaviorError"), 10, a3, CFSTR("Failed to build playback context: %@"), *(_QWORD *)(a1 + 32));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
    objc_msgSend(*(id *)(a1 + 40), "rollback");

  }
  else
  {
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __97___MPCQueueControllerBehaviorMusicSharePlay_performInsertCommand_targetContentItemID_completion___block_invoke_2;
    v11[3] = &unk_24CAB5DC8;
    v12 = v5;
    v16 = *(id *)(a1 + 64);
    v13 = *(id *)(a1 + 40);
    v7 = *(id *)(a1 + 48);
    v8 = *(_QWORD *)(a1 + 56);
    v14 = v7;
    v15 = v8;
    v17 = *(_QWORD *)(a1 + 72);
    v9 = (id)objc_msgSend(v12, "getSharedListeningTracklistWithCompletion:", v11);

  }
}

void __97___MPCQueueControllerBehaviorMusicSharePlay_performInsertCommand_targetContentItemID_completion___block_invoke_2(uint64_t a1, void *a2, void *a3, uint64_t a4)
{
  id v7;
  id v8;
  void *v9;
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t aBlock;
  uint64_t v23;
  void (*v24)(uint64_t, void *, void *);
  void *v25;
  id v26;
  uint64_t v27;
  id v28;

  v7 = a2;
  v8 = a3;
  if (!a4)
  {
    objc_msgSend(*(id *)(a1 + 48), "insertAfterContentItemID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    aBlock = MEMORY[0x24BDAC760];
    v23 = 3221225472;
    v24 = __97___MPCQueueControllerBehaviorMusicSharePlay_performInsertCommand_targetContentItemID_completion___block_invoke_3;
    v25 = &unk_24CAB69B0;
    v28 = *(id *)(a1 + 64);
    v10 = *(id *)(a1 + 40);
    v11 = *(_QWORD *)(a1 + 56);
    v26 = v10;
    v27 = v11;
    v12 = _Block_copy(&aBlock);
    if (v9)
    {
      objc_msgSend(*(id *)(a1 + 56), "_componentsForContentItemID:", v9);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "itemID");
      v14 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v14 = 0;
    }
    if (objc_msgSend(*(id *)(a1 + 40), "allowsChangingCurrentItem"))
    {
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 56) + 120), "insertTracklist:afterItemIdentifier:playNowWithPreferredStartIndexPath:completionEx:", v7, v14, v8, v12);
LABEL_17:

      goto LABEL_18;
    }
    v15 = objc_msgSend(*(id *)(a1 + 48), "insertionPosition");
    if (v15 == 3)
    {
      objc_msgSend(MEMORY[0x24BEC89B0], "specifiedPositionAfterItemIdentifier:", v14);
      v16 = objc_claimAutoreleasedReturnValue();
    }
    else if (v15 == 2)
    {
      objc_msgSend(MEMORY[0x24BEC89B0], "playLastPositionWithAfterItemIdentifierHint:", v14);
      v16 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (v15)
      {
        objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = *(_QWORD *)(a1 + 72);
        v20 = *(_QWORD *)(a1 + 56);
        v21 = objc_msgSend(*(id *)(a1 + 48), "insertionPosition");
        objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", v19, v20, CFSTR("_MPCQueueControllerBehaviorMusicSharePlay.m"), 902, CFSTR("[BMSP] completion performInsertCommand unsupported insertion position: %ld"), v21, aBlock, v23, v24, v25);

        v17 = 0;
        goto LABEL_16;
      }
      objc_msgSend(MEMORY[0x24BEC89B0], "playNextPositionWithAfterItemIdentifierHint:", v14);
      v16 = objc_claimAutoreleasedReturnValue();
    }
    v17 = (void *)v16;
LABEL_16:
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 56) + 120), "insertTracklist:atPosition:completionEx:", v7, v17, v12);

    goto LABEL_17;
  }
  objc_msgSend(MEMORY[0x24BDD1540], "msv_errorWithDomain:code:underlyingError:debugDescription:", CFSTR("MPCMusicSharePlayBehaviorError"), 10, a4, CFSTR("Failed to build shared tracklist for context: %@"), *(_QWORD *)(a1 + 32));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
  objc_msgSend(*(id *)(a1 + 40), "rollback");
LABEL_18:

}

void __97___MPCQueueControllerBehaviorMusicSharePlay_performInsertCommand_targetContentItemID_completion___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;

  v5 = a2;
  v8 = a3;
  v10 = *(id *)(a1 + 48);
  v9 = *(id *)(a1 + 32);
  v6 = v5;
  v7 = v8;
  msv_dispatch_on_main_queue();

}

void __97___MPCQueueControllerBehaviorMusicSharePlay_performInsertCommand_targetContentItemID_completion___block_invoke_4(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
  {
    v3 = *(_QWORD *)(a1 + 64);
    objc_msgSend(MEMORY[0x24BDD1540], "msv_errorWithDomain:code:underlyingError:debugDescription:", CFSTR("MPCMusicSharePlayBehaviorError"), 7, v2, CFSTR("Failed to insert content"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v3 + 16))(v3, v4);

    objc_msgSend(*(id *)(a1 + 40), "rollback");
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 48), "_componentsForSharedListeningItemID:", *(_QWORD *)(a1 + 56));
    v7 = (id)objc_claimAutoreleasedReturnValue();
    v5 = *(void **)(a1 + 40);
    objc_msgSend(v7, "contentItemID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setSuggestedContentItemIDForStart:", v6);

    objc_msgSend(*(id *)(a1 + 40), "commit");
    (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();

  }
}

void __70___MPCQueueControllerBehaviorMusicSharePlay_canReuseQueue_completion___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;
  uint64_t v11;
  id v12;

  v5 = a2;
  v6 = v5;
  if (!v5 || a3)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else
  {
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __70___MPCQueueControllerBehaviorMusicSharePlay_canReuseQueue_completion___block_invoke_2;
    v9[3] = &unk_24CAB5DA0;
    v10 = v5;
    v7 = *(id *)(a1 + 40);
    v11 = *(_QWORD *)(a1 + 32);
    v12 = v7;
    v8 = (id)objc_msgSend(v10, "getSharedListeningTracklistWithCompletion:", v9);

  }
}

void __70___MPCQueueControllerBehaviorMusicSharePlay_canReuseQueue_completion___block_invoke_2(uint64_t a1, void *a2, void *a3, uint64_t a4)
{
  id v7;
  id v8;
  void *v9;
  _QWORD block[5];
  id v11;
  id v12;
  id v13;

  v7 = a2;
  v8 = a3;
  if (a4)
  {
    objc_msgSend(MEMORY[0x24BDD1540], "msv_errorWithDomain:code:underlyingError:debugDescription:", CFSTR("MPCMusicSharePlayBehaviorError"), 10, a4, CFSTR("Failed to build shared tracklist for context: %@"), *(_QWORD *)(a1 + 32));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

  }
  else
  {
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __70___MPCQueueControllerBehaviorMusicSharePlay_canReuseQueue_completion___block_invoke_3;
    block[3] = &unk_24CAB7B40;
    block[4] = *(_QWORD *)(a1 + 40);
    v11 = v7;
    v12 = v8;
    v13 = *(id *)(a1 + 48);
    dispatch_async(MEMORY[0x24BDAC9B8], block);

  }
}

void __70___MPCQueueControllerBehaviorMusicSharePlay_canReuseQueue_completion___block_invoke_3(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  void *v3;
  uint64_t v4;
  _QWORD v5[5];
  id v6;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(_QWORD *)(a1 + 40);
  v3 = *(void **)(v1 + 120);
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __70___MPCQueueControllerBehaviorMusicSharePlay_canReuseQueue_completion___block_invoke_4;
  v5[3] = &unk_24CAB5D78;
  v5[4] = v1;
  v4 = *(_QWORD *)(a1 + 48);
  v6 = *(id *)(a1 + 56);
  objc_msgSend(v3, "insertTracklist:afterItemIdentifier:playNowWithPreferredStartIndexPath:completionEx:", v2, 0, v4, v5);

}

void __70___MPCQueueControllerBehaviorMusicSharePlay_canReuseQueue_completion___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  uint64_t v13;
  id v14;
  id v15;

  v5 = a2;
  v6 = a3;
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __70___MPCQueueControllerBehaviorMusicSharePlay_canReuseQueue_completion___block_invoke_5;
  v11[3] = &unk_24CAB7B40;
  v7 = *(_QWORD *)(a1 + 32);
  v8 = *(void **)(a1 + 40);
  v12 = v6;
  v13 = v7;
  v14 = v5;
  v15 = v8;
  v9 = v5;
  v10 = v6;
  dispatch_async(MEMORY[0x24BDAC9B8], v11);

}

void __70___MPCQueueControllerBehaviorMusicSharePlay_canReuseQueue_completion___block_invoke_5(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "msv_errorByWrappingWithDomain:code:debugDescription:", CFSTR("MPCMusicSharePlayBehaviorError"), 5, CFSTR("canReuseQueue -> linkLink.queue.PlayNow failed"));
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "_componentsForSharedListeningItemID:", *(_QWORD *)(a1 + 48));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 56);
  objc_msgSend(v2, "contentItemID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, uint64_t, void *, const __CFString *, id))(v3 + 16))(v3, 1, v4, CFSTR("live link processed"), v5);

}

void __95___MPCQueueControllerBehaviorMusicSharePlay_setAutoPlayEnabled_targetContentItemID_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  uint8_t buf[4];
  void *v13;
  __int16 v14;
  void *v15;
  __int16 v16;
  int v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v5 = WeakRetained;
  if (v3)
  {
    objc_msgSend(WeakRetained, "host");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = os_log_create("com.apple.amp.mediaplaybackcore", "MusicSharePlayBehavior");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v6, "engineID");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "sessionID");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = *(unsigned __int8 *)(a1 + 48);
      *(_DWORD *)buf = 138544130;
      v13 = v8;
      v14 = 2114;
      v15 = v9;
      v16 = 1024;
      v17 = v10;
      v18 = 2114;
      v19 = v3;
      _os_log_impl(&dword_210BD8000, v7, OS_LOG_TYPE_ERROR, "[BMSP:%{public}@:%{public}@] setAutoPlayEnabled:targetContentItemID:completion: | failed [server error] autoPlayEnabled=%{BOOL}u error=%{public}@", buf, 0x26u);

    }
    objc_msgSend(v3, "msv_errorByWrappingWithDomain:code:debugDescription:", CFSTR("MPCMusicSharePlayBehaviorError"), 4, CFSTR("setAutoPlayEnabled:%ld failed"), *(unsigned __int8 *)(a1 + 48));
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v11 = 0;
  }
  objc_msgSend(v5, "_emitEventsForPlaybackBehaviorChange");
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void __93___MPCQueueControllerBehaviorMusicSharePlay_getExpectedCurrentItemModelObjectWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;

  v5 = a2;
  v8 = a3;
  v9 = *(id *)(a1 + 40);
  v6 = v8;
  v7 = v5;
  msv_dispatch_on_main_queue();

}

void __93___MPCQueueControllerBehaviorMusicSharePlay_getExpectedCurrentItemModelObjectWithCompletion___block_invoke_2(uint64_t a1)
{
  BOOL v2;
  uint64_t v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  id v8;
  _QWORD v9[4];
  id v10;
  uint64_t v11;
  id v12;
  id v13[2];
  id location;

  if (*(_QWORD *)(a1 + 32))
    v2 = *(_QWORD *)(a1 + 40) == 0;
  else
    v2 = 0;
  if (v2)
  {
    objc_initWeak(&location, *(id *)(a1 + 48));
    objc_msgSend(*(id *)(a1 + 32), "identifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __93___MPCQueueControllerBehaviorMusicSharePlay_getExpectedCurrentItemModelObjectWithCompletion___block_invoke_3;
    v9[3] = &unk_24CAB5CB0;
    v5 = *(void **)(a1 + 48);
    v12 = *(id *)(a1 + 56);
    objc_copyWeak(v13, &location);
    v6 = v4;
    v13[1] = *(id *)(a1 + 64);
    v7 = *(_QWORD *)(a1 + 48);
    v10 = v6;
    v11 = v7;
    objc_msgSend(v5, "_enqueuePendingActionWithLabel:itemIdentifier:block:", CFSTR("getExpectedCurrentItemModelObject"), v6, v9);

    objc_destroyWeak(v13);
    objc_destroyWeak(&location);
  }
  else
  {
    v3 = *(_QWORD *)(a1 + 56);
    objc_msgSend(MEMORY[0x24BDD1540], "msv_errorWithDomain:code:underlyingError:debugDescription:", CFSTR("MPCMusicSharePlayBehaviorError"), 15);
    v8 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, id))(v3 + 16))(v3, 0, v8);

  }
}

void __93___MPCQueueControllerBehaviorMusicSharePlay_getExpectedCurrentItemModelObjectWithCompletion___block_invoke_3(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  id *WeakRetained;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id *v14;

  if (a2)
  {
    v3 = *(_QWORD *)(a1 + 48);
    objc_msgSend(MEMORY[0x24BDD1540], "msv_errorWithDomain:code:debugDescription:", CFSTR("MPCMusicSharePlayBehaviorError"), 13, CFSTR("failed to get model object - pending action timed out"));
    v14 = (id *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, id *))(v3 + 16))(v3, 0, v14);
  }
  else
  {
    WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 56));
    v14 = WeakRetained;
    if (WeakRetained)
    {
      objc_msgSend(WeakRetained, "_componentsForSharedListeningItemID:", *(_QWORD *)(a1 + 32));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v5)
      {
        objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 40), CFSTR("_MPCQueueControllerBehaviorMusicSharePlay.m"), 207, CFSTR("Pending action flushed but item was still not found [nil components]: %@"), *(_QWORD *)(a1 + 32));

      }
      objc_msgSend(v14[16], "response");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "modelResponse");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "results");
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v14[20], "objectForKeyedSubscript:", *(_QWORD *)(a1 + 32));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v9)
      {
        objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 40), CFSTR("_MPCQueueControllerBehaviorMusicSharePlay.m"), 211, CFSTR("Pending action flushed but item was still not found [nil indexPath]: %@"), *(_QWORD *)(a1 + 32));

      }
      objc_msgSend(v8, "itemAtIndexPath:", v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

    }
    else
    {
      v11 = *(_QWORD *)(a1 + 48);
      objc_msgSend(MEMORY[0x24BDD1540], "msv_errorWithDomain:code:debugDescription:", CFSTR("MPCMusicSharePlayBehaviorError"), 11, CFSTR("failed to get model object - sharePlay behavior was dealloc'd"));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, _QWORD, void *))(v11 + 16))(v11, 0, v5);
    }

  }
}

@end
