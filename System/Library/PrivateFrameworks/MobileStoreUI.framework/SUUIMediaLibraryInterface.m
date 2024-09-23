@implementation SUUIMediaLibraryInterface

- (void)enumerateStatesForLibraryItems:(id)a3 usingBlock:(id)a4
{
  id v6;
  void (**v7)(id, void *, SUUILibraryItemState *, _BYTE *);
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  SUUILibraryItemState *v16;
  void *v17;
  void *v18;
  void *v19;
  int v20;
  id obj;
  id v22;
  SUUIMediaLibraryInterface *v23;
  id v24;
  id v25;
  id v26;
  _QWORD v27[4];
  SUUILibraryItemState *v28;
  SUUIMediaLibraryInterface *v29;
  id v30;
  id v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  unsigned __int8 v36;
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = (void (**)(id, void *, SUUILibraryItemState *, _BYTE *))a4;
  v8 = (void *)SUUIMediaPlayerFramework();
  v23 = self;
  v9 = -[SUUIMediaLibraryInterface _newDefaultQuery](self, "_newDefaultQuery");
  v26 = *(id *)SUUIWeakLinkedSymbolForString("MPMediaItemPropertyStoreAccountID", v8);
  v25 = *(id *)SUUIWeakLinkedSymbolForString("MPMediaItemPropertyIsHD", v8);
  v24 = *(id *)SUUIWeakLinkedSymbolForString("MPMediaItemPropertyStoreID", v8);
  v22 = SUUIWeakLinkedClassForString(CFSTR("MPMediaPropertyPredicate"), (uint64_t)v8);
  v36 = 0;
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  obj = v6;
  v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v33;
LABEL_3:
    v13 = 0;
    while (1)
    {
      if (*(_QWORD *)v33 != v12)
        objc_enumerationMutation(obj);
      v14 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * v13);
      v15 = (void *)MEMORY[0x2426A2860]();
      v16 = objc_alloc_init(SUUILibraryItemState);
      objc_msgSend(v14, "storeItemIdentifier");
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      if (v17)
      {
        objc_msgSend(v14, "storeItemIdentifier");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "predicateWithValue:forProperty:", v18, v24);
        v19 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v9, "addFilterPredicate:", v19);
        v27[0] = MEMORY[0x24BDAC760];
        v27[1] = 3221225472;
        v27[2] = __71__SUUIMediaLibraryInterface_enumerateStatesForLibraryItems_usingBlock___block_invoke;
        v27[3] = &unk_2511FCE48;
        v28 = v16;
        v29 = v23;
        v30 = v25;
        v31 = v26;
        objc_msgSend(v9, "_enumerateUnorderedItemsUsingBlock:", v27);
        objc_msgSend(v9, "removeFilterPredicate:", v19);

      }
      v7[2](v7, v14, v16, &v36);
      v20 = v36;

      objc_autoreleasePoolPop(v15);
      if (v20)
        break;
      if (v11 == ++v13)
      {
        v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
        if (v11)
          goto LABEL_3;
        break;
      }
    }
  }

}

void __71__SUUIMediaLibraryInterface_enumerateStatesForLibraryItems_usingBlock___block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  if (a2)
  {
    v5 = *(void **)(a1 + 32);
    v6 = *(void **)(a1 + 40);
    v7 = a2;
    objc_msgSend(v5, "setAvailability:", objc_msgSend(v6, "_availabilityForMediaItem:", v7));
    objc_msgSend(*(id *)(a1 + 32), "setAVTypes:", objc_msgSend(*(id *)(a1 + 40), "_AVTypesForMediaItem:", v7));
    v8 = *(void **)(a1 + 32);
    objc_msgSend(v7, "valueForProperty:", *(_QWORD *)(a1 + 48));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setHighDefinition:", objc_msgSend(v9, "BOOLValue"));

    objc_msgSend(*(id *)(a1 + 32), "setRental:", objc_msgSend(v7, "isRental"));
    v10 = *(void **)(a1 + 32);
    objc_msgSend(v7, "valueForProperty:", *(_QWORD *)(a1 + 56));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setStoreAccountIdentifier:", v11);

    v12 = *(void **)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 40), "_storePlatformKindForMediaItem:", v7);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v12, "setStorePlatformKind:", v13);
    *a3 = 1;
  }
}

- (id)exposedPlatformItemKinds
{
  return (id)objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", CFSTR("book"), CFSTR("movie"), CFSTR("song"), CFSTR("musicVideo"), CFSTR("podcastEpisode"), CFSTR("tvEpisode"), 0);
}

- (BOOL)performActionForLibraryItem:(id)a3
{
  id v4;
  void *v5;
  objc_class *v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  BOOL v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  id v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  uint64_t i;
  void *v45;
  void *v46;
  int v47;
  BOOL v49;
  void *v50;
  id v51;
  id v52;
  void *v53;
  void *v54;
  void *v55;
  objc_class *v56;
  void *v57;
  SUUIMediaLibraryInterface *v58;
  void *v59;
  id v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  _BYTE v65[128];
  uint64_t v66;

  v66 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (void *)SUUIMediaPlayerFramework();
  v6 = (objc_class *)SUUIWeakLinkedClassForString(CFSTR("MPMediaQuery"), (uint64_t)v5);
  v7 = SUUIWeakLinkedClassForString(CFSTR("MPMediaPropertyPredicate"), (uint64_t)v5);
  v8 = *(id *)SUUIWeakLinkedSymbolForString("MPMediaItemPropertyStoreID", v5);
  v9 = *(id *)SUUIWeakLinkedSymbolForString("MPMediaItemPropertyMediaType", v5);
  v10 = *(id *)SUUIWeakLinkedSymbolForString("MPMediaItemPropertyStorePlaylistID", v5);
  v56 = v6;
  v11 = objc_alloc_init(v6);
  objc_msgSend(v4, "storeItemIdentifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v7;
  objc_msgSend(v7, "predicateWithValue:forProperty:", v12, v8);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addFilterPredicate:", v14);

  v15 = v9;
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", v8, v9, v10, 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setItemPropertiesToFetch:", v16);

  v58 = self;
  -[SUUIMediaLibraryInterface _restrictQueryToLocalContent:](self, "_restrictQueryToLocalContent:", v11);
  v60 = v11;
  objc_msgSend(v11, "items");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "firstObject");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v18 && (objc_msgSend(v18, "mediaType") & 0xFF00) != 0)
  {
    v19 = objc_alloc(MEMORY[0x24BDD17C8]);
    objc_msgSend(v4, "storeItemIdentifier");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = (void *)objc_msgSend(v19, "initWithFormat:", CFSTR("videos://play?adam-id=%lld&allowCloudPlayback=1"), objc_msgSend(v20, "longLongValue"));

    objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    SUUIMetricsOpenSensitiveURL(v22, 0);

    v23 = 1;
  }
  else
  {
    v24 = v15;
    -[objc_class albumsQuery](v56, "albumsQuery");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUUIMediaLibraryInterface _restrictQueryToLocalContent:](v58, "_restrictQueryToLocalContent:", v25);
    v52 = v4;
    objc_msgSend(v4, "storeItemIdentifier");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = v13;
    v51 = v10;
    objc_msgSend(v13, "predicateWithValue:forProperty:", v26, v10);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "addFilterPredicate:", v28);

    v53 = v25;
    objc_msgSend(v25, "items");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = objc_msgSend(v54, "count");
    v30 = 0;
    if (!v18 || v29)
    {
      v10 = v51;
      v15 = v24;
      v31 = v54;
      v11 = v60;
    }
    else
    {
      v10 = v51;
      objc_msgSend(v18, "valueForProperty:", v51);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = v24;
      if (v30)
      {
        if ((objc_msgSend(v18, "mediaType") & 4) != 0)
          -[objc_class audiobooksQuery](v56, "audiobooksQuery");
        else
          -[objc_class albumsQuery](v56, "albumsQuery");
        v33 = (void *)objc_claimAutoreleasedReturnValue();

        -[SUUIMediaLibraryInterface _restrictQueryToLocalContent:](v58, "_restrictQueryToLocalContent:", v33);
        objc_msgSend(v27, "predicateWithValue:forProperty:", v30, v51);
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "addFilterPredicate:", v34);

        objc_msgSend(v33, "items");
        v31 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v18, "valueForProperty:", v8);
        v35 = objc_claimAutoreleasedReturnValue();
        v32 = v30;
        v30 = (void *)v35;
        v53 = v33;
      }
      else
      {
        v32 = 0;
        v31 = v54;
      }
      v11 = v60;

    }
    v36 = objc_msgSend(v31, "count");
    v23 = v36 != 0;
    if (v36)
    {
      v37 = objc_msgSend(objc_alloc((Class)SUUIWeakLinkedClassForString(CFSTR("MPMediaItemCollection"), (uint64_t)v5)), "initWithItems:", v31);
      objc_msgSend(SUUIWeakLinkedClassForString(CFSTR("MPMusicPlayerController"), (uint64_t)v5), "systemMusicPlayer");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v59 = (void *)v37;
      objc_msgSend(v38, "setQueueWithItemCollection:", v37);
      if (v30)
      {
        v49 = v23;
        v50 = v18;
        v55 = v31;
        v57 = v15;
        v63 = 0u;
        v64 = 0u;
        v61 = 0u;
        v62 = 0u;
        v39 = v31;
        v40 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v61, v65, 16);
        if (v40)
        {
          v41 = v40;
          v42 = *(_QWORD *)v62;
          while (2)
          {
            v43 = v38;
            for (i = 0; i != v41; ++i)
            {
              if (*(_QWORD *)v62 != v42)
                objc_enumerationMutation(v39);
              v45 = *(void **)(*((_QWORD *)&v61 + 1) + 8 * i);
              objc_msgSend(v45, "valueForProperty:", v8);
              v46 = (void *)objc_claimAutoreleasedReturnValue();
              v47 = objc_msgSend(v46, "isEqualToNumber:", v30);

              if (v47)
              {
                v38 = v43;
                objc_msgSend(v43, "setNowPlayingItem:", v45);
                goto LABEL_26;
              }
            }
            v41 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v61, v65, 16);
            v38 = v43;
            if (v41)
              continue;
            break;
          }
        }
LABEL_26:

        v10 = v51;
        v4 = v52;
        v31 = v55;
        v15 = v57;
        v18 = v50;
        v23 = v49;
      }
      objc_msgSend(v38, "play");

      v11 = v60;
    }

  }
  return v23;
}

- (BOOL)isItemLocalAudiobook:(id)a3
{
  id v3;
  void *v4;
  id v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;

  v3 = a3;
  v4 = (void *)SUUIMediaPlayerFramework();
  v5 = SUUIWeakLinkedClassForString(CFSTR("MPMediaQuery"), (uint64_t)v4);
  v6 = SUUIWeakLinkedClassForString(CFSTR("MPMediaPropertyPredicate"), (uint64_t)v4);
  objc_msgSend(v5, "audiobooksQuery");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = *(id *)SUUIWeakLinkedSymbolForString("MPMediaItemPropertyStorePlaylistID", v4);
  objc_msgSend(v3, "storeItemIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "predicateWithValue:forProperty:", v9, v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "addFilterPredicate:", v10);
  objc_msgSend(v7, "items");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v8) = objc_msgSend(v11, "count") != 0;

  return (char)v8;
}

- (id)stateForLibraryItem:(id)a3
{
  id v4;
  SUUILibraryItemState *v5;
  void *v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  SUUILibraryItemState *v14;
  id v15;
  id v16;
  void *v17;
  SUUILibraryItemState *v18;
  _QWORD v20[4];
  SUUILibraryItemState *v21;
  SUUIMediaLibraryInterface *v22;
  id v23;
  id v24;

  v4 = a3;
  v5 = objc_alloc_init(SUUILibraryItemState);
  v6 = (void *)SUUIMediaPlayerFramework();
  v7 = -[SUUIMediaLibraryInterface _newDefaultQuery](self, "_newDefaultQuery");
  v8 = *(id *)SUUIWeakLinkedSymbolForString("MPMediaItemPropertyStoreAccountID", v6);
  v9 = *(id *)SUUIWeakLinkedSymbolForString("MPMediaItemPropertyIsHD", v6);
  v10 = *(id *)SUUIWeakLinkedSymbolForString("MPMediaItemPropertyStoreID", v6);
  v11 = SUUIWeakLinkedClassForString(CFSTR("MPMediaPropertyPredicate"), (uint64_t)v6);
  objc_msgSend(v4, "storeItemIdentifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "predicateWithValue:forProperty:", v12, v10);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "addFilterPredicate:", v13);
  v20[0] = MEMORY[0x24BDAC760];
  v20[1] = 3221225472;
  v20[2] = __49__SUUIMediaLibraryInterface_stateForLibraryItem___block_invoke;
  v20[3] = &unk_2511FCE48;
  v14 = v5;
  v21 = v14;
  v22 = self;
  v23 = v9;
  v24 = v8;
  v15 = v8;
  v16 = v9;
  objc_msgSend(v7, "_enumerateUnorderedItemsUsingBlock:", v20);
  v17 = v24;
  v18 = v14;

  return v18;
}

void __49__SUUIMediaLibraryInterface_stateForLibraryItem___block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  if (a2)
  {
    v5 = *(void **)(a1 + 32);
    v6 = *(void **)(a1 + 40);
    v7 = a2;
    objc_msgSend(v5, "setAvailability:", objc_msgSend(v6, "_availabilityForMediaItem:", v7));
    objc_msgSend(*(id *)(a1 + 32), "setAVTypes:", objc_msgSend(*(id *)(a1 + 40), "_AVTypesForMediaItem:", v7));
    v8 = *(void **)(a1 + 32);
    objc_msgSend(v7, "valueForProperty:", *(_QWORD *)(a1 + 48));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setHighDefinition:", objc_msgSend(v9, "BOOLValue"));

    objc_msgSend(*(id *)(a1 + 32), "setRental:", objc_msgSend(v7, "isRental"));
    v10 = *(void **)(a1 + 32);
    objc_msgSend(v7, "valueForProperty:", *(_QWORD *)(a1 + 56));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setStoreAccountIdentifier:", v11);

    v12 = *(void **)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 40), "_storePlatformKindForMediaItem:", v7);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v12, "setStorePlatformKind:", v13);
    *a3 = 1;
  }
}

- (void)removeMediaItemsForLibraryItems:(id)a3
{
  id v3;
  void *v4;
  objc_class *v5;
  id v6;
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  id obj;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v4 = (void *)SUUIMediaPlayerFramework();
  v5 = (objc_class *)SUUIWeakLinkedClassForString(CFSTR("MPMediaQuery"), (uint64_t)v4);
  v6 = SUUIWeakLinkedClassForString(CFSTR("MPMediaPropertyPredicate"), (uint64_t)v4);
  v19 = SUUIWeakLinkedClassForString(CFSTR("MPMediaLibrary"), (uint64_t)v4);
  v7 = *(id *)SUUIWeakLinkedSymbolForString("MPMediaItemPropertyStoreID", v4);
  v8 = objc_alloc_init(v5);
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  obj = v3;
  v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v22;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v22 != v12)
          objc_enumerationMutation(obj);
        objc_msgSend(*(id *)(*((_QWORD *)&v21 + 1) + 8 * v13), "storeItemIdentifier", v19);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "predicateWithValue:forProperty:", v14, v7);
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v8, "addFilterPredicate:", v15);
        objc_msgSend(v8, "items");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "firstObject");
        v17 = (void *)objc_claimAutoreleasedReturnValue();

        if (v17)
          objc_msgSend(v9, "addObject:", v17);
        objc_msgSend(v8, "removeFilterPredicate:", v15);

        ++v13;
      }
      while (v11 != v13);
      v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v11);
  }

  if (objc_msgSend(v9, "count"))
  {
    objc_msgSend(v19, "defaultMediaLibrary");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "removeItems:", v9);

  }
}

- (int64_t)_availabilityForMediaItem:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  int64_t v8;

  v3 = a3;
  if (_availabilityForMediaItem__sOnce != -1)
    dispatch_once(&_availabilityForMediaItem__sOnce, &__block_literal_global_59);
  objc_msgSend(v3, "valueForProperty:", _availabilityForMediaItem__sFamilyAccountIDProperty);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "unsignedLongLongValue") && (objc_msgSend(v3, "mediaType") & 0x300) != 0)
  {
    objc_msgSend(v3, "valueForProperty:", _availabilityForMediaItem__sFilePathProperty);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "length"))
    {
      v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCF48]), "initFileURLWithPath:isDirectory:", v5, 0);
      v7 = (void *)objc_msgSend(objc_alloc((Class)_availabilityForMediaItem__sPlayerItemClass), "initWithURL:", v6);
      if (objc_msgSend(v7, "isContentAuthorizedForPlayback"))
        v8 = 2;
      else
        v8 = 0;

    }
    else
    {
      v8 = 2;
    }

  }
  else
  {
    v8 = 2;
  }

  return v8;
}

id __55__SUUIMediaLibraryInterface__availabilityForMediaItem___block_invoke()
{
  void *v0;
  id *v1;
  id *v2;
  uint64_t v3;
  id result;

  v0 = (void *)SUUIMediaPlayerFramework();
  v1 = (id *)SUUIWeakLinkedSymbolForString("MPMediaItemPropertyStoreFamilyAccountID", v0);
  objc_storeStrong((id *)&_availabilityForMediaItem__sFamilyAccountIDProperty, *v1);
  v2 = (id *)SUUIWeakLinkedSymbolForString("MPMediaItemPropertyFilePath", v0);
  objc_storeStrong((id *)&_availabilityForMediaItem__sFilePathProperty, *v2);
  v3 = SUUIAVFoundationFramework();
  result = SUUIWeakLinkedClassForString(CFSTR("AVPlayerItem"), v3);
  _availabilityForMediaItem__sPlayerItemClass = (uint64_t)result;
  return result;
}

- (unint64_t)_AVTypesForMediaItem:(id)a3
{
  if ((objc_msgSend(a3, "mediaType") & 0xFF00) != 0)
    return 5;
  else
    return 1;
}

- (id)_newDefaultQuery
{
  void *v3;
  id v4;
  id v5;

  v3 = (void *)SUUIMediaPlayerFramework();
  v4 = objc_alloc_init((Class)SUUIWeakLinkedClassForString(CFSTR("MPMediaQuery"), (uint64_t)v3));
  -[SUUIMediaLibraryInterface _restrictQueryToLocalContent:](self, "_restrictQueryToLocalContent:", v4);
  v5 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
  objc_msgSend(v5, "addObject:", *(_QWORD *)SUUIWeakLinkedSymbolForString("MPMediaItemPropertyIsHD", v3));
  objc_msgSend(v5, "addObject:", *(_QWORD *)SUUIWeakLinkedSymbolForString("MPMediaItemPropertyIsRental", v3));
  objc_msgSend(v5, "addObject:", *(_QWORD *)SUUIWeakLinkedSymbolForString("MPMediaItemPropertyMediaType", v3));
  objc_msgSend(v5, "addObject:", *(_QWORD *)SUUIWeakLinkedSymbolForString("MPMediaItemPropertyStoreAccountID", v3));
  objc_msgSend(v4, "setItemPropertiesToFetch:", v5);

  return v4;
}

- (void)_restrictQueryToLocalContent:(id)a3
{
  id v3;
  void *v4;
  id v5;
  id v6;

  v3 = a3;
  v4 = (void *)SUUIMediaPlayerFramework();
  v5 = *(id *)SUUIWeakLinkedSymbolForString("MPMediaItemPropertyIsLocal", v4);
  objc_msgSend(SUUIWeakLinkedClassForString(CFSTR("MPMediaPropertyPredicate"), (uint64_t)v4), "predicateWithValue:forProperty:", MEMORY[0x24BDBD1C8], v5);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "addFilterPredicate:", v6);
}

- (id)_storePlatformKindForMediaItem:(id)a3
{
  uint64_t v3;
  id result;

  v3 = objc_msgSend(a3, "mediaType");
  result = 0;
  if (v3 <= 511)
  {
    switch(v3)
    {
      case 1:
        result = CFSTR("song");
        break;
      case 2:
      case 8:
        return CFSTR("podcastEpisode");
      case 3:
      case 5:
      case 6:
      case 7:
        return result;
      case 4:
        result = CFSTR("book");
        break;
      default:
        if (v3 == 256)
          result = CFSTR("movie");
        else
          result = 0;
        break;
    }
    return result;
  }
  if (v3 > 2047)
  {
    if (v3 == 2048)
      return CFSTR("musicVideo");
    if (v3 != 4096)
      return result;
    return CFSTR("podcastEpisode");
  }
  if (v3 == 512)
    return CFSTR("tvEpisode");
  if (v3 == 1024)
    return CFSTR("podcastEpisode");
  return result;
}

@end
