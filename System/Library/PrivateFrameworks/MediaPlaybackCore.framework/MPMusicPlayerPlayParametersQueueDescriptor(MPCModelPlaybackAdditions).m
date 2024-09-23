@implementation MPMusicPlayerPlayParametersQueueDescriptor(MPCModelPlaybackAdditions)

- (id)playbackContexts
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  id v21;
  _QWORD block[5];
  id v23;
  uint8_t buf[4];
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v2 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "playParametersQueue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = os_log_create("com.apple.amp.mediaplaybackcore", "SDKPlayback");
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v25 = v4;
    _os_log_impl(&dword_210BD8000, v6, OS_LOG_TYPE_DEFAULT, "MusicKit: MPMusicPlayerPlayParamertersQueueDescriptor playParametersQueue: %{public}@", buf, 0xCu);
  }

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __89__MPMusicPlayerPlayParametersQueueDescriptor_MPCModelPlaybackAdditions__playbackContexts__block_invoke;
  block[3] = &unk_24CABA2D0;
  block[4] = a1;
  if (playbackContexts_sOnceToken != -1)
    dispatch_once(&playbackContexts_sOnceToken, block);
  if (playbackContexts_isClassicMusicApp)
  {
    objc_msgSend(a1, "playParametersQueue");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "_classicalMusicAppPlaybackContextForPlayParametersQueue:", v7);
    v8 = (id)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      v23 = v8;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v23, 1);
      v9 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_24;
    }
    v10 = os_log_create("com.apple.amp.mediaplaybackcore", "SDKPlayback");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v25 = v4;
      _os_log_impl(&dword_210BD8000, v10, OS_LOG_TYPE_DEFAULT, "MusicKit: Unable to produce playback context for play parameters queue %{public}@. Defaulting to public SDK playback (non-filtered).", buf, 0xCu);
    }

  }
  if (objc_msgSend(v4, "count") == 1
    && (objc_msgSend(a1, "startItemPlayParameters"),
        v11 = (void *)objc_claimAutoreleasedReturnValue(),
        v11,
        v11))
  {
    objc_msgSend(v4, "firstObject");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "itemKind");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v14 = (void *)MEMORY[0x24BDD16E0];
    if ((objc_msgSend(v13, "isEqualToString:", *MEMORY[0x24BDDC600]) & 1) != 0)
      v15 = 1;
    else
      v15 = objc_msgSend(v13, "isEqualToString:", *MEMORY[0x24BDDC610]);
    objc_msgSend(v14, "numberWithInt:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v16 = (void *)MEMORY[0x24BDBD1C0];
  }
  v21 = v16;
  objc_msgSend(a1, "_updatePlaybackContextsForPlaybackParametersQueue:libraryItems:radioPlaybackContext:storePlayParameters:contexts:containsStartItem:", v4, v3, 0, v2, v5, &v21);
  v8 = v21;

  if (objc_msgSend(v2, "count") || objc_msgSend(v3, "count"))
  {
    objc_msgSend(a1, "_playbackContextForStorePlayParameters:libraryItems:radioPlaybackContext:containsStartItem:", v2, v3, 0, objc_msgSend(v8, "BOOLValue"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v17);

  }
  v18 = os_log_create("com.apple.amp.mediaplaybackcore", "SDKPlayback");
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v25 = v5;
    _os_log_impl(&dword_210BD8000, v18, OS_LOG_TYPE_DEFAULT, "MusicKit: Returning playback contexts for MPMusicPlayerPlayParamertersQueueDescriptor: Contexts = %{public}@", buf, 0xCu);
  }

  v9 = v5;
LABEL_24:
  v19 = v9;

  return v19;
}

- (void)_updatePlaybackContextsForPlaybackParametersQueue:()MPCModelPlaybackAdditions libraryItems:radioPlaybackContext:storePlayParameters:contexts:containsStartItem:
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  uint64_t v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  uint64_t i;
  void *v26;
  void *v27;
  void *v28;
  NSObject *v29;
  void *v30;
  NSObject *v31;
  void *v32;
  void *v33;
  int v34;
  id v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t j;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  uint64_t v45;
  void (**v46)(void *, id, id *, void *, void *, id);
  void (**v47)(void *, id, id *, void *, void *);
  id obj;
  void *v49;
  id v50;
  uint64_t v51;
  uint64_t v52;
  void *v53;
  void *v54;
  id v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  _QWORD v64[4];
  id v65;
  id v66;
  id v67;
  void *v68;
  id v69;
  _QWORD aBlock[4];
  id v71;
  void *v72;
  id v73;
  id v74;
  uint8_t v75[128];
  uint8_t buf[4];
  void *v77;
  __int16 v78;
  void *v79;
  _BYTE v80[128];
  uint64_t v81;

  v81 = *MEMORY[0x24BDAC8D0];
  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  v19 = MEMORY[0x24BDAC760];
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 3221225472;
  aBlock[2] = __204__MPMusicPlayerPlayParametersQueueDescriptor_MPCModelPlaybackAdditions___updatePlaybackContextsForPlaybackParametersQueue_libraryItems_radioPlaybackContext_storePlayParameters_contexts_containsStartItem___block_invoke;
  aBlock[3] = &unk_24CAB4D20;
  v20 = v16;
  v71 = v20;
  v72 = a1;
  v21 = v17;
  v73 = v21;
  v22 = v15;
  v74 = v22;
  v47 = (void (**)(void *, id, id *, void *, void *))_Block_copy(aBlock);
  v64[0] = v19;
  v64[1] = 3221225472;
  v64[2] = __204__MPMusicPlayerPlayParametersQueueDescriptor_MPCModelPlaybackAdditions___updatePlaybackContextsForPlaybackParametersQueue_libraryItems_radioPlaybackContext_storePlayParameters_contexts_containsStartItem___block_invoke_29;
  v64[3] = &unk_24CAB4D48;
  v50 = v21;
  v65 = v50;
  v23 = v22;
  v66 = v23;
  v55 = v18;
  v67 = v55;
  v68 = a1;
  v24 = v20;
  v69 = v24;
  v46 = (void (**)(void *, id, id *, void *, void *, id))_Block_copy(v64);
  v53 = v23;
  v44 = v14;
  if (v23)
  {
    v62 = 0uLL;
    v63 = 0uLL;
    v60 = 0uLL;
    v61 = 0uLL;
    obj = v14;
    v52 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v60, v80, 16);
    if (v52)
    {
      v51 = *(_QWORD *)v61;
      v45 = *MEMORY[0x24BDDC618];
      v49 = a1;
      do
      {
        for (i = 0; i != v52; ++i)
        {
          if (*(_QWORD *)v61 != v51)
            objc_enumerationMutation(obj);
          v26 = *(void **)(*((_QWORD *)&v60 + 1) + 8 * i);
          objc_msgSend(v26, "identifiers");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "itemKind");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          v29 = os_log_create("com.apple.amp.mediaplaybackcore", "SDKPlayback");
          if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543618;
            v77 = v28;
            v78 = 2114;
            v79 = v27;
            _os_log_impl(&dword_210BD8000, v29, OS_LOG_TYPE_DEFAULT, "MusicKit: Handling play parameters for type: %{public}@ and identifiers: %{public}@", buf, 0x16u);
          }

          objc_msgSend(a1, "_libraryItemsForPlayParameters:", v26);
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v30, "count"))
          {
            v54 = v28;
            v31 = os_log_create("com.apple.amp.mediaplaybackcore", "SDKPlayback");
            if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138543362;
              v77 = v27;
              _os_log_impl(&dword_210BD8000, v31, OS_LOG_TYPE_DEFAULT, "MusicKit: Static entities created for item with identifiers: %{public}@", buf, 0xCu);
            }

            if (v24 || objc_msgSend(v50, "count"))
            {
              objc_msgSend(a1, "_playbackContextForStorePlayParameters:libraryItems:radioPlaybackContext:containsStartItem:", v50, v23, v24, objc_msgSend(*a8, "BOOLValue"));
              v32 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v55, "addObject:", v32);

              *a8 = (id)MEMORY[0x24BDBD1C0];
              a1 = v49;
              objc_msgSend(v50, "removeAllObjects");

            }
            objc_msgSend(v23, "addObjectsFromArray:", v30);
            objc_msgSend(a1, "startItemPlayParameters");
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            v34 = objc_msgSend(v33, "isEqual:", v26);

            v24 = 0;
            if (v34)
              *a8 = (id)MEMORY[0x24BDBD1C8];
            v28 = v54;
          }
          else if (objc_msgSend(v28, "isEqualToString:", v45))
          {
            v47[2](v47, v55, a8, v27, v26);
          }
          else
          {
            v46[2](v46, v55, a8, v27, v26, v24);
          }

        }
        v52 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v60, v80, 16);
      }
      while (v52);
    }
  }
  else
  {
    v58 = 0uLL;
    v59 = 0uLL;
    v56 = 0uLL;
    v57 = 0uLL;
    v35 = v14;
    v36 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v56, v75, 16);
    if (v36)
    {
      v37 = v36;
      v38 = *(_QWORD *)v57;
      v39 = *MEMORY[0x24BDDC618];
      do
      {
        for (j = 0; j != v37; ++j)
        {
          if (*(_QWORD *)v57 != v38)
            objc_enumerationMutation(v35);
          v41 = *(void **)(*((_QWORD *)&v56 + 1) + 8 * j);
          objc_msgSend(v41, "identifiers");
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v41, "itemKind");
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v43, "isEqualToString:", v39))
            v47[2](v47, v55, a8, v42, v41);
          else
            v46[2](v46, v55, a8, v42, v41, v24);

        }
        v37 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v56, v75, 16);
      }
      while (v37);
    }
  }

}

- (MPCModelPlaybackContext)_playbackContextForStorePlayParameters:()MPCModelPlaybackAdditions libraryItems:radioPlaybackContext:containsStartItem:
{
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  MPCModelPlaybackContext *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  void *v30;
  void *v31;
  int v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  int v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  MPCModelStorePlaybackItemsRequest *v48;
  void *v49;
  id v50;
  void *v51;
  void *v52;
  int v53;
  id v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  NSObject *v62;
  NSObject *v63;
  void *v64;
  void *v65;
  void *v66;
  int v67;
  NSObject *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  MPCModelPlaybackContext *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  NSObject *v84;
  void *v86;
  void *v87;
  id v88;
  id v89;
  int v90;
  int v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  _QWORD v95[3];
  id v96;
  void *v97;
  uint8_t buf[4];
  id v99;
  uint64_t v100;

  v100 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  if (v12)
  {
    v13 = os_log_create("com.apple.amp.mediaplaybackcore", "SDKPlayback");
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v99 = v12;
      _os_log_impl(&dword_210BD8000, v13, OS_LOG_TYPE_DEFAULT, "Creating radio playback context: %{public}@", buf, 0xCu);
    }

    v14 = (MPCModelPlaybackContext *)v12;
  }
  else
  {
    if (objc_msgSend(v11, "count"))
    {
      objc_msgSend(a1, "playParametersQueue");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v15, "count");

      if (v16 == 1)
      {
        objc_msgSend(a1, "playParametersQueue");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "firstObject");
        v18 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v18, "itemKind");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v19, "isEqualToString:", *MEMORY[0x24BDDC600]) & 1) != 0
          || objc_msgSend(v19, "isEqualToString:", *MEMORY[0x24BDDC610]))
        {
          objc_msgSend(a1, "setContainerPlayParameters:", v18);
        }

      }
      v20 = objc_alloc_init(MEMORY[0x24BDDC8F8]);
      objc_msgSend(a1, "containerPlayParameters");
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      if (v21)
      {
        v90 = a6;
        v88 = v11;
        v89 = v10;
        objc_msgSend(a1, "containerPlayParameters");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "identifiers");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "modelKind");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "setSectionKind:", v24);

        objc_msgSend(a1, "containerPlayParameters");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "identifiers");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v97 = v26;
        objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v97, 1);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "setAllowedSectionIdentifiers:", v27);

        objc_msgSend(MEMORY[0x24BDDC9D8], "kindWithVariants:", 7);
        v28 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "sectionKind");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "identityKind");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDDC968], "identityKind");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        v32 = objc_msgSend(v30, "isEqual:", v31);

        v33 = v28;
        if (v32)
        {
          v34 = (void *)MEMORY[0x24BDDC950];
          v96 = v28;
          objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v96, 1);
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v34, "kindWithKinds:", v35);
          v33 = (void *)objc_claimAutoreleasedReturnValue();

        }
        objc_msgSend(v20, "sectionKind");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "identityKind");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDDC838], "identityKind");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        v39 = objc_msgSend(v37, "isEqual:", v38);

        if (v39)
        {
          v40 = (void *)MEMORY[0x24BDDC9E8];
          v94 = *MEMORY[0x24BDDC0F0];
          objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v94, 1);
          v87 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v40, "sortDescriptorWithKeyPath:ascending:", v87, 1);
          v86 = (void *)objc_claimAutoreleasedReturnValue();
          v95[0] = v86;
          v41 = (void *)MEMORY[0x24BDDC9E8];
          v93 = *MEMORY[0x24BDDC168];
          objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v93, 1);
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v41, "sortDescriptorWithKeyPath:ascending:", v42, 1);
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          v95[1] = v43;
          v44 = (void *)MEMORY[0x24BDDC9E8];
          v92 = *MEMORY[0x24BDDC160];
          objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v92, 1);
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v44, "sortDescriptorWithKeyPath:ascending:", v45, 1);
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          v95[2] = v46;
          objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v95, 3);
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "setItemSortDescriptors:", v47);

        }
        objc_msgSend(v20, "setItemKind:", v33);
        objc_msgSend(v20, "setFilteringOptions:", 4);

        v11 = v88;
        v10 = v89;
        a6 = v90;
      }
      else
      {
        v58 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDDC818]), "initWithEntities:entityType:", v11, 0);
        objc_msgSend(v20, "setLegacyMediaQuery:", v58);

      }
      v59 = (void *)MEMORY[0x24BDD17C8];
      objc_msgSend(a1, "playActivityFeatureName");
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v59, "stringWithFormat:", CFSTR("PlayParametersQueueDescriptor-%@"), v60);
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "setLabel:", v61);

      v62 = v20;
      v63 = os_log_create("com.apple.amp.mediaplaybackcore", "SDKPlayback");
      if (os_log_type_enabled(v63, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v99 = v62;
        _os_log_impl(&dword_210BD8000, v63, OS_LOG_TYPE_DEFAULT, "MusicKit: Creating library playback context with request: %{public}@", buf, 0xCu);
      }

      v48 = (MPCModelStorePlaybackItemsRequest *)v62;
    }
    else
    {
      v48 = objc_alloc_init(MPCModelStorePlaybackItemsRequest);
      objc_msgSend(a1, "containerPlayParameters");
      v49 = (void *)objc_claimAutoreleasedReturnValue();

      if (v49)
      {
        v50 = objc_alloc_init(MEMORY[0x24BDDCA88]);
        objc_msgSend(a1, "containerPlayParameters");
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v51, "itemKind");
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        v53 = objc_msgSend(v52, "isEqualToString:", *MEMORY[0x24BDDC600]);

        v91 = a6;
        if (v53)
        {
          v54 = objc_alloc(MEMORY[0x24BDDC830]);
          objc_msgSend(a1, "containerPlayParameters");
          v55 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v55, "identifiers");
          v56 = (void *)objc_claimAutoreleasedReturnValue();
          v57 = &__block_literal_global_42;
        }
        else
        {
          objc_msgSend(a1, "containerPlayParameters");
          v65 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v65, "itemKind");
          v66 = (void *)objc_claimAutoreleasedReturnValue();
          v67 = objc_msgSend(v66, "isEqualToString:", *MEMORY[0x24BDDC610]);

          if (v67)
          {
            v54 = objc_alloc(MEMORY[0x24BDDC948]);
            objc_msgSend(a1, "containerPlayParameters");
            v55 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v55, "identifiers");
            v56 = (void *)objc_claimAutoreleasedReturnValue();
            v57 = &__block_literal_global_45;
          }
          else
          {
            v68 = os_log_create("com.apple.amp.mediaplaybackcore", "SDKPlayback");
            if (os_log_type_enabled(v68, OS_LOG_TYPE_DEFAULT))
            {
              objc_msgSend(a1, "containerPlayParameters");
              v69 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543362;
              v99 = v69;
              _os_log_impl(&dword_210BD8000, v68, OS_LOG_TYPE_DEFAULT, "MusicKit: Unable to determine valid container play parameters itemKind for play parameters: %{public}@. Defaulting to album.", buf, 0xCu);

            }
            v54 = objc_alloc(MEMORY[0x24BDDC830]);
            objc_msgSend(a1, "containerPlayParameters");
            v55 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v55, "identifiers");
            v56 = (void *)objc_claimAutoreleasedReturnValue();
            v57 = &__block_literal_global_47;
          }
        }
        v70 = (void *)objc_msgSend(v54, "initWithIdentifiers:block:", v56, v57);

        objc_msgSend(v50, "appendSection:", v70);
        objc_msgSend(v10, "msv_compactMap:", &__block_literal_global_50);
        v71 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v50, "appendItems:", v71);
        -[MPCModelStorePlaybackItemsRequest setSectionedModelObjects:](v48, "setSectionedModelObjects:", v50);

        a6 = v91;
      }
      else
      {
        objc_msgSend(v10, "msv_compactMap:", &__block_literal_global_53);
        v64 = (void *)objc_claimAutoreleasedReturnValue();
        -[MPCModelStorePlaybackItemsRequest setStoreIDs:](v48, "setStoreIDs:", v64);

      }
      -[MPCModelStorePlaybackItemsRequest setClientIdentifier:](v48, "setClientIdentifier:", CFSTR("com.apple.Music"));
      v62 = os_log_create("com.apple.amp.mediaplaybackcore", "SDKPlayback");
      if (os_log_type_enabled(v62, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v99 = v48;
        _os_log_impl(&dword_210BD8000, v62, OS_LOG_TYPE_DEFAULT, "MusicKit: Creating store playback context with request: %{public}@", buf, 0xCu);
      }
    }

    v14 = objc_alloc_init(MPCModelPlaybackContext);
    -[MPCModelPlaybackContext setRequest:](v14, "setRequest:", v48);
    if (a6)
    {
      objc_msgSend(a1, "startItemPlayParameters");
      v72 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v72, "identifiers");
      v73 = (void *)objc_claimAutoreleasedReturnValue();
      -[MPCModelPlaybackContext setStartItemIdentifiers:](v14, "setStartItemIdentifiers:", v73);

    }
    objc_msgSend(a1, "startTimes");
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    -[MPCModelPlaybackContext setStartTimeModifications:](v14, "setStartTimeModifications:", v74);

    objc_msgSend(a1, "endTimes");
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    -[MPCModelPlaybackContext setEndTimeModifications:](v14, "setEndTimeModifications:", v75);

    -[MPCModelPlaybackContext setShuffleType:](v14, "setShuffleType:", objc_msgSend(a1, "shuffleType"));
    -[MPCModelPlaybackContext setRepeatType:](v14, "setRepeatType:", objc_msgSend(a1, "repeatType"));
    -[MPCModelPlaybackContext setAllowsJumpToIt:](v14, "setAllowsJumpToIt:", 1);

  }
  objc_msgSend(a1, "playActivityFeatureName");
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPCModelPlaybackContext setPlayActivityFeatureName:](v14, "setPlayActivityFeatureName:", v76);

  objc_msgSend(a1, "playActivityQueueGroupingID");
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPCModelPlaybackContext setPlayActivityQueueGroupingID:](v14, "setPlayActivityQueueGroupingID:", v77);

  if (objc_msgSend(a1, "isPrivate"))
    -[MPCModelPlaybackContext setPrivateListeningOverride:](v14, "setPrivateListeningOverride:", MEMORY[0x24BDBD1C8]);
  if (-[MPCModelPlaybackContext conformsToProtocol:](v14, "conformsToProtocol:", &unk_254A9D5E8))
  {
    v78 = v14;
    -[MPCModelPlaybackContext playbackRequestEnvironment](v78, "playbackRequestEnvironment");
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    v80 = (void *)objc_msgSend(v79, "mutableCopy");

    v81 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEC8770]), "initWithSystemApplicationType:", 0);
    objc_msgSend(v81, "clientIdentifier");
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v80, "setClientIdentifier:", v82);

    objc_msgSend(v81, "clientVersion");
    v83 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v80, "setClientVersion:", v83);

    objc_msgSend(a1, "_addRequestingBundleIdentifierToPlaybackRequestEnvironment:", v80);
    -[MPCModelPlaybackContext setPlaybackRequestEnvironment:](v78, "setPlaybackRequestEnvironment:", v80);

  }
  -[MPCModelPlaybackContext setQueueDescriptor:](v14, "setQueueDescriptor:", a1);
  v84 = os_log_create("com.apple.amp.mediaplaybackcore", "SDKPlayback");
  if (os_log_type_enabled(v84, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v99 = v14;
    _os_log_impl(&dword_210BD8000, v84, OS_LOG_TYPE_DEFAULT, "MusicKit: Created playback context: %{public}@", buf, 0xCu);
  }

  return v14;
}

- (void)_configureiTunesLibraryRequest:()MPCModelPlaybackAdditions forLibraryItems:
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  uint64_t v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  void *v34;
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  objc_msgSend(MEMORY[0x24BDDC9D8], "kindWithVariants:", 7);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v9 = v6;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v31;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v31 != v12)
          objc_enumerationMutation(v9);
        v14 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * i);
        v15 = objc_msgSend(v14, "type");
        if (v15 == 1)
        {
          v28 = v14;
          objc_msgSend(v5, "setItemKind:", v7);
          objc_msgSend(v28, "identifiers");
          v17 = (id)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v29, "addObject:", v17);
        }
        else
        {
          if (v15 == 4)
          {
            v22 = (void *)MEMORY[0x24BDDC968];
            v23 = v14;
            objc_msgSend(v22, "identityKind");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v5, "setSectionKind:", v24);

            objc_msgSend(v23, "identifiers");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v8, "addObject:", v25);

            v26 = (void *)MEMORY[0x24BDDC950];
            v34 = v7;
            objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v34, 1);
            v27 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v26, "kindWithKinds:", v27);
            v17 = (id)objc_claimAutoreleasedReturnValue();

            v20 = v5;
            v21 = v17;
          }
          else
          {
            if (v15 != 2)
              continue;
            v16 = (void *)MEMORY[0x24BDDC838];
            v17 = v14;
            objc_msgSend(v16, "identityKind");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v5, "setSectionKind:", v18);

            objc_msgSend(v17, "identifiers");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v8, "addObject:", v19);

            v20 = v5;
            v21 = v7;
          }
          objc_msgSend(v20, "setItemKind:", v21);
        }

      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
    }
    while (v11);
  }

  objc_msgSend(v5, "setAllowedItemIdentifiers:", v29);
  objc_msgSend(v5, "setAllowedSectionIdentifiers:", v8);

}

- (id)_libraryItemsForPlayParameters:()MPCModelPlaybackAdditions
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  int v37;
  void *v38;
  uint64_t v39;
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
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  uint64_t v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  id v64;
  void *v65;
  void *v66;
  void *v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  void *v72;
  void *v73;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  uint64_t v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  uint64_t v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  id v99;
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  void *v104;
  void *v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  _BYTE v110[128];
  uint64_t v111;

  v111 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  objc_msgSend(v3, "identifiers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "itemKind");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *MEMORY[0x24BDDC600];
  if (((objc_msgSend(v5, "isEqualToString:", *MEMORY[0x24BDDC600]) & 1) == 0
     && !objc_msgSend(v5, "isEqualToString:", *MEMORY[0x24BDDC610])
     || objc_msgSend(v3, "isLibraryContent"))
    && (objc_msgSend(v5, "isEqualToString:", *MEMORY[0x24BDDC618]) & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v105 = v5;
    if (objc_msgSend(v5, "isEqual:", *MEMORY[0x24BDDC610]))
    {
      v8 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
      objc_msgSend(v4, "universalStore");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "globalPlaylistID");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "length");

      if (v11)
      {
        v12 = (void *)MEMORY[0x24BDDC810];
        objc_msgSend(v4, "universalStore");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "globalPlaylistID");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "predicateWithValue:forProperty:", v14, *MEMORY[0x24BDDBD08]);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "addObject:", v15);

      }
      objc_msgSend(v4, "universalStore");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "universalCloudLibraryID");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v17, "length");

      if (v18)
      {
        v19 = (void *)MEMORY[0x24BDDC810];
        objc_msgSend(v4, "universalStore");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "universalCloudLibraryID");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "predicateWithValue:forProperty:", v21, *MEMORY[0x24BDDBD10]);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "addObject:", v22);

      }
      objc_msgSend(v4, "library");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_msgSend(v23, "persistentID");

      if (v24)
      {
        v25 = (void *)MEMORY[0x24BDDC810];
        v26 = (void *)MEMORY[0x24BDD16E0];
        objc_msgSend(v4, "library");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "numberWithLongLong:", objc_msgSend(v27, "persistentID"));
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "predicateWithValue:forProperty:", v28, *MEMORY[0x24BDDBD50]);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "addObject:", v29);

      }
      objc_msgSend(MEMORY[0x24BDDC798], "predicateMatchingPredicates:", v8, v4);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = objc_alloc(MEMORY[0x24BDDC818]);
      objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", v30);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDDC7F0], "deviceMediaLibrary");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = (void *)objc_msgSend(v31, "initWithFilterPredicates:library:", v32, v33);

      objc_msgSend(v34, "setShouldIncludeNonLibraryEntities:", 1);
      v35 = v34;
      v36 = 6;
    }
    else
    {
      v37 = objc_msgSend(v5, "isEqual:", v6);
      v8 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
      objc_msgSend(v4, "universalStore");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v39 = objc_msgSend(v38, "subscriptionAdamID");

      if (!v37)
      {
        if (v39)
        {
          v75 = (void *)MEMORY[0x24BDDC810];
          v76 = (void *)MEMORY[0x24BDD16E0];
          objc_msgSend(v4, "universalStore");
          v77 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v76, "numberWithLongLong:", objc_msgSend(v77, "subscriptionAdamID"));
          v78 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v75, "predicateWithValue:forProperty:", v78, *MEMORY[0x24BDDBCB0]);
          v79 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "addObject:", v79);

          v80 = (void *)MEMORY[0x24BDDC810];
          v81 = (void *)MEMORY[0x24BDD16E0];
          objc_msgSend(v4, "universalStore");
          v82 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v81, "numberWithLongLong:", objc_msgSend(v82, "subscriptionAdamID"));
          v83 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v80, "predicateWithValue:forProperty:", v83, *MEMORY[0x24BDDBCC8]);
          v84 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "addObject:", v84);

        }
        objc_msgSend(v4, "universalStore");
        v85 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v85, "universalCloudLibraryID");
        v86 = (void *)objc_claimAutoreleasedReturnValue();
        v87 = objc_msgSend(v86, "length");

        if (v87)
        {
          v88 = (void *)MEMORY[0x24BDDC810];
          objc_msgSend(v4, "universalStore");
          v89 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v89, "universalCloudLibraryID");
          v90 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v88, "predicateWithValue:forProperty:", v90, *MEMORY[0x24BDDBCA8]);
          v91 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "addObject:", v91);

        }
        objc_msgSend(v4, "library");
        v92 = (void *)objc_claimAutoreleasedReturnValue();
        v93 = objc_msgSend(v92, "persistentID");

        if (v93)
        {
          v94 = (void *)MEMORY[0x24BDDC810];
          v95 = (void *)MEMORY[0x24BDD16E0];
          objc_msgSend(v4, "library");
          v96 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v95, "numberWithLongLong:", objc_msgSend(v96, "persistentID"));
          v97 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v94, "predicateWithValue:forProperty:", v97, *MEMORY[0x24BDDBC40]);
          v98 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "addObject:", v98);

        }
        objc_msgSend(MEMORY[0x24BDDC798], "predicateMatchingPredicates:", v8);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v99 = objc_alloc(MEMORY[0x24BDDC818]);
        objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", v30);
        v100 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDDC7F0], "deviceMediaLibrary");
        v101 = (void *)objc_claimAutoreleasedReturnValue();
        v34 = (void *)objc_msgSend(v99, "initWithFilterPredicates:library:", v100, v101);

        objc_msgSend(v34, "items");
        v102 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v102, "firstObject");
        v103 = (void *)objc_claimAutoreleasedReturnValue();

        if (v103)
        {
          objc_msgSend(v7, "addObject:", v103);

LABEL_37:
          v5 = v105;
          goto LABEL_38;
        }
        v104 = v4;
LABEL_23:

        objc_msgSend(v34, "collections");
        v67 = (void *)objc_claimAutoreleasedReturnValue();
        v106 = 0u;
        v107 = 0u;
        v108 = 0u;
        v109 = 0u;
        v68 = objc_msgSend(v67, "countByEnumeratingWithState:objects:count:", &v106, v110, 16);
        if (v68)
        {
          v69 = v68;
          v70 = *(_QWORD *)v107;
          do
          {
            v71 = 0;
            do
            {
              if (*(_QWORD *)v107 != v70)
                objc_enumerationMutation(v67);
              v72 = *(void **)(*((_QWORD *)&v106 + 1) + 8 * v71);
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                objc_msgSend(v7, "addObject:", v72);
              }
              else
              {
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) != 0)
                {
                  objc_msgSend(v72, "items");
                  v73 = (void *)objc_claimAutoreleasedReturnValue();
                  if (objc_msgSend(v73, "count"))
                    objc_msgSend(v7, "addObjectsFromArray:", v73);

                }
              }
              ++v71;
            }
            while (v69 != v71);
            v69 = objc_msgSend(v67, "countByEnumeratingWithState:objects:count:", &v106, v110, 16);
          }
          while (v69);
        }

        v4 = v104;
        goto LABEL_37;
      }
      if (v39)
      {
        v40 = (void *)MEMORY[0x24BDDC810];
        v41 = (void *)MEMORY[0x24BDD16E0];
        objc_msgSend(v4, "universalStore");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v41, "numberWithLongLong:", objc_msgSend(v42, "subscriptionAdamID"));
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v40, "predicateWithValue:forProperty:", v43, *MEMORY[0x24BDDBCB0]);
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "addObject:", v44);

        v45 = (void *)MEMORY[0x24BDDC810];
        v46 = (void *)MEMORY[0x24BDD16E0];
        objc_msgSend(v4, "universalStore");
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v46, "numberWithLongLong:", objc_msgSend(v47, "subscriptionAdamID"));
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v45, "predicateWithValue:forProperty:", v48, *MEMORY[0x24BDDBCC8]);
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "addObject:", v49);

      }
      objc_msgSend(v4, "universalStore");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v50, "universalCloudLibraryID");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      v52 = objc_msgSend(v51, "length");

      if (v52)
      {
        v53 = (void *)MEMORY[0x24BDDC810];
        objc_msgSend(v4, "universalStore");
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v54, "universalCloudLibraryID");
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v53, "predicateWithValue:forProperty:", v55, *MEMORY[0x24BDDBCA8]);
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "addObject:", v56);

      }
      objc_msgSend(v4, "library");
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      v58 = objc_msgSend(v57, "persistentID");

      if (v58)
      {
        v59 = (void *)MEMORY[0x24BDDC810];
        v60 = (void *)MEMORY[0x24BDD16E0];
        objc_msgSend(v4, "library");
        v61 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v60, "numberWithLongLong:", objc_msgSend(v61, "persistentID"));
        v62 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v59, "predicateWithValue:forProperty:", v62, *MEMORY[0x24BDDBAF0]);
        v63 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "addObject:", v63);

      }
      objc_msgSend(MEMORY[0x24BDDC798], "predicateMatchingPredicates:", v8, v4);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v64 = objc_alloc(MEMORY[0x24BDDC818]);
      objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", v30);
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDDC7F0], "deviceMediaLibrary");
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = (void *)objc_msgSend(v64, "initWithFilterPredicates:library:", v65, v66);

      v35 = v34;
      v36 = 1;
    }
    objc_msgSend(v35, "setGroupingType:", v36);
    goto LABEL_23;
  }
  v7 = (void *)MEMORY[0x24BDBD1A8];
LABEL_38:

  return v7;
}

- (MPCModelPlaybackContext)_classicalMusicAppPlaybackContextForPlayParametersQueue:()MPCModelPlaybackAdditions
{
  MPCModelPlaybackContext *v4;
  NSObject *v5;
  MPCModelStorePlaybackItemsRequest *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  MPCModelPlaybackContext *v18;
  void *v19;
  void *v20;
  MPCModelPlaybackContext *v21;
  MPCModelRadioPlaybackContext *v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  NSObject *v28;
  MPCModelPlaybackContext *v29;
  void *v30;
  MPCModelPlaybackContext *v31;
  void *v32;
  void *v33;
  MPCModelPlaybackContext *v34;
  NSObject *v35;
  void *v36;
  MPCModelPlaybackContext *v37;
  void *v38;
  void *v39;
  void *v40;
  id v41;
  void *v42;
  MPCModelPlaybackContext *v43;
  void *v44;
  void *v45;
  void *v46;
  id v47;
  id v48;
  NSObject *v49;
  void *v50;
  void *v51;
  char v52;
  Class *v53;
  void *v54;
  void *v55;
  int v56;
  void *v57;
  MPCModelPlaybackContext *v58;
  MPCModelPlaybackContext *v59;
  NSObject *v60;
  const char *v61;
  NSObject *v62;
  uint32_t v63;
  void *v64;
  void *v65;
  MPCModelPlaybackContext *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  NSObject *v79;
  uint64_t v81;
  NSObject *v82;
  void *v83;
  void *v84;
  uint64_t v85;
  void *v86;
  void *v87;
  uint64_t quot;
  uint64_t v89;
  char *v90;
  lldiv_t v91;
  uint64_t v92;
  const UInt8 *v93;
  uint64_t v94;
  void *v95;
  uint64_t v96;
  lldiv_t v97;
  uint64_t v98;
  uint64_t v99;
  void *v100;
  void *v101;
  void *v102;
  _QWORD v103[4];
  id v104;
  id v105;
  _QWORD v106[4];
  id v107;
  void *v108;
  uint64_t v109;
  _QWORD v110[3];
  _QWORD v111[3];
  uint8_t buf[4];
  MPCModelPlaybackContext *v113;
  __int16 v114;
  MPCModelPlaybackContext *v115;
  _QWORD v116[3];

  v116[0] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = os_log_create("com.apple.amp.mediaplaybackcore", "SDKPlayback");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v113 = v4;
    _os_log_impl(&dword_210BD8000, v5, OS_LOG_TYPE_DEFAULT, "MusicKit: Creating store playback context for classical music app: %{public}@", buf, 0xCu);
  }

  v6 = objc_alloc_init(MPCModelStorePlaybackItemsRequest);
  v7 = objc_alloc(MEMORY[0x24BDDC778]);
  objc_msgSend(MEMORY[0x24BDDC7F0], "deviceMediaLibrary");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v7, "initWithLibrary:", v8);

  v10 = objc_alloc(MEMORY[0x24BDDCB30]);
  v110[0] = *MEMORY[0x24BDDC2F8];
  objc_msgSend(MEMORY[0x24BDDCB30], "emptyPropertySet");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v111[0] = v11;
  v110[1] = *MEMORY[0x24BDDC278];
  objc_msgSend(MEMORY[0x24BDDCB30], "emptyPropertySet");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v111[1] = v12;
  v110[2] = *MEMORY[0x24BDDC2B8];
  objc_msgSend(MEMORY[0x24BDDCB30], "emptyPropertySet");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v111[2] = v13;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v111, v110, 3);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v102 = (void *)objc_msgSend(v10, "initWithProperties:relationships:", MEMORY[0x24BDBD1A8], v14);

  objc_msgSend(a1, "playParametersQueue");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v15, "count") != 1)
  {

LABEL_8:
    objc_msgSend(a1, "containerPlayParameters");
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    v27 = MEMORY[0x24BDAC760];
    if (!v26)
    {
      v18 = 0;
      goto LABEL_29;
    }
    v28 = os_log_create("com.apple.amp.mediaplaybackcore", "SDKPlayback");
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(a1, "containerPlayParameters");
      v29 = (MPCModelPlaybackContext *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "containerPlayParameters");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "identifiers");
      v31 = (MPCModelPlaybackContext *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v113 = v29;
      v114 = 2114;
      v115 = v31;
      _os_log_impl(&dword_210BD8000, v28, OS_LOG_TYPE_DEFAULT, "MusicKit: Attempting to create container item for container play params: %{public}@ with identifiers: %{public}@", buf, 0x16u);

    }
    objc_msgSend(a1, "containerPlayParameters");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "identifiers");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "identifiersMatchingIdentifierSet:propertySet:options:error:", v33, v102, 0, 0);
    v34 = (MPCModelPlaybackContext *)objc_claimAutoreleasedReturnValue();

    if (!v34)
    {
      v35 = os_log_create("com.apple.amp.mediaplaybackcore", "SDKPlayback");
      if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(a1, "containerPlayParameters");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "identifiers");
        v37 = (MPCModelPlaybackContext *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v113 = v37;
        _os_log_impl(&dword_210BD8000, v35, OS_LOG_TYPE_DEFAULT, "MusicKit: Could not find identifiers in library object database for identifiers: %{public}@", buf, 0xCu);

      }
      objc_msgSend(a1, "containerPlayParameters");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "identifiers");
      v39 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x24BEC8A58], "activeAccount");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      v41 = (id)*MEMORY[0x24BEC8730];
      if (objc_msgSend(MEMORY[0x24BE65C48], "hasBoolEntitlement:", CFSTR("com.apple.accounts.appleaccount.fullaccess")))
      {
        v42 = v9;
        v43 = v4;
        objc_msgSend(MEMORY[0x24BEC8A60], "defaultIdentityStore");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v44, "DSIDForUserIdentity:outError:", v40, 0);
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v45, "stringValue");
        v46 = (void *)objc_claimAutoreleasedReturnValue();

        if (objc_msgSend(v46, "length"))
        {
          v47 = v46;

          v41 = v47;
        }
        v4 = v43;
        v9 = v42;

        v27 = MEMORY[0x24BDAC760];
      }
      v106[0] = v27;
      v106[1] = 3221225472;
      v106[2] = __129__MPMusicPlayerPlayParametersQueueDescriptor_MPCModelPlaybackAdditions___classicalMusicAppPlaybackContextForPlayParametersQueue___block_invoke_118;
      v106[3] = &unk_24CAB8A40;
      v107 = v41;
      v48 = v41;
      v34 = (MPCModelPlaybackContext *)objc_msgSend(v39, "copyWithSource:block:", CFSTR("MusicPlayerPlayParams+PersonAddition"), v106);

    }
    v49 = os_log_create("com.apple.amp.mediaplaybackcore", "SDKPlayback");
    if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v113 = v34;
      _os_log_impl(&dword_210BD8000, v49, OS_LOG_TYPE_DEFAULT, "MusicKit: Creating container with container identifiers: %{public}@", buf, 0xCu);
    }

    objc_msgSend(a1, "containerPlayParameters");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "itemKind");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    v52 = objc_msgSend(v51, "isEqualToString:", *MEMORY[0x24BDDC600]);

    if ((v52 & 1) != 0)
    {
      v53 = (Class *)0x24BDDC830;
    }
    else
    {
      objc_msgSend(a1, "containerPlayParameters");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v54, "itemKind");
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      v56 = objc_msgSend(v55, "isEqualToString:", *MEMORY[0x24BDDC610]);

      if (!v56)
      {
        v18 = 0;
        goto LABEL_28;
      }
      v53 = (Class *)0x24BDDC948;
    }
    v18 = (MPCModelPlaybackContext *)objc_msgSend(objc_alloc(*v53), "initWithIdentifiers:", v34);
LABEL_28:

LABEL_29:
    v21 = v4;
    -[MPCModelPlaybackContext msv_compactMap:](v4, "msv_compactMap:", &__block_literal_global_122);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v103[0] = v27;
    v103[1] = 3221225472;
    v103[2] = __129__MPMusicPlayerPlayParametersQueueDescriptor_MPCModelPlaybackAdditions___classicalMusicAppPlaybackContextForPlayParametersQueue___block_invoke_2_123;
    v103[3] = &unk_24CAB4F30;
    v20 = v9;
    v104 = v9;
    v105 = v102;
    objc_msgSend(v19, "msv_compactMap:", v103);
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v57, "msv_compactMap:", &__block_literal_global_125);
    v58 = (MPCModelPlaybackContext *)objc_claimAutoreleasedReturnValue();
    if (v18)
    {
      v59 = (MPCModelPlaybackContext *)objc_alloc_init(MEMORY[0x24BDDCA88]);
      -[MPCModelPlaybackContext appendSection:](v59, "appendSection:", v18);
      -[MPCModelPlaybackContext appendItems:](v59, "appendItems:", v58);
      -[MPCModelStorePlaybackItemsRequest setSectionedModelObjects:](v6, "setSectionedModelObjects:", v59);
      v60 = os_log_create("com.apple.amp.mediaplaybackcore", "SDKPlayback");
      if (os_log_type_enabled(v60, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543618;
        v113 = v18;
        v114 = 2114;
        v115 = v58;
        v61 = "MusicKit: Created SPIR with container: %{public}@ and items %{public}@";
        v62 = v60;
        v63 = 22;
LABEL_34:
        _os_log_impl(&dword_210BD8000, v62, OS_LOG_TYPE_DEFAULT, v61, buf, v63);
      }
    }
    else
    {
      objc_msgSend(v57, "msv_compactMap:", &__block_literal_global_128);
      v59 = (MPCModelPlaybackContext *)objc_claimAutoreleasedReturnValue();
      -[MPCModelStorePlaybackItemsRequest setStoreIDs:](v6, "setStoreIDs:", v59);
      v60 = os_log_create("com.apple.amp.mediaplaybackcore", "SDKPlayback");
      if (os_log_type_enabled(v60, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v113 = v59;
        v61 = "MusicKit: Created SPIR with storeIDs %{public}@";
        v62 = v60;
        v63 = 12;
        goto LABEL_34;
      }
    }

    v22 = 0;
    v24 = v104;
    goto LABEL_36;
  }
  objc_msgSend(a1, "containerPlayParameters");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
    goto LABEL_8;
  objc_msgSend(a1, "playParametersQueue");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "firstObject");
  v18 = (MPCModelPlaybackContext *)objc_claimAutoreleasedReturnValue();

  -[MPCModelPlaybackContext itemKind](v18, "itemKind");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = v9;
  if (!objc_msgSend(v19, "isEqualToString:", *MEMORY[0x24BDDC618]))
  {
    v21 = v4;
    if (-[MPCModelPlaybackContext isLibraryContent](v18, "isLibraryContent"))
      -[MPCModelPlaybackContext catalogID](v18, "catalogID");
    else
      -[MPCModelPlaybackContext itemID](v18, "itemID");
    v81 = objc_claimAutoreleasedReturnValue();
    v24 = (void *)v81;
    if (v81)
    {
      v109 = v81;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v109, 1);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      -[MPCModelStorePlaybackItemsRequest setStoreIDs:](v6, "setStoreIDs:", v25);
LABEL_75:
      v22 = 0;
      goto LABEL_76;
    }
    v82 = os_log_create("com.apple.amp.mediaplaybackcore", "SDKPlayback");
    if (os_log_type_enabled(v82, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 138543618;
      v113 = v4;
      v114 = 2114;
      v115 = v18;
      _os_log_impl(&dword_210BD8000, v82, OS_LOG_TYPE_FAULT, "MusicKit: Unable to set store ids for classical music app for queue: %{public}@ with first item play parameters: %{public}@", buf, 0x16u);
    }

    -[MPCModelPlaybackContext identifiers](v18, "identifiers");
    v83 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "identifiersMatchingIdentifierSet:propertySet:options:error:", v83, v102, 0, 0);
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v25)
    {
      -[MPCModelPlaybackContext identifiers](v18, "identifiers");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v25, "universalStore");
    v84 = (void *)objc_claimAutoreleasedReturnValue();
    v85 = objc_msgSend(v84, "subscriptionAdamID");

    objc_msgSend(v25, "universalStore");
    v86 = (void *)objc_claimAutoreleasedReturnValue();
    v87 = v86;
    if (v85)
    {
      quot = objc_msgSend(v86, "subscriptionAdamID");
      v89 = quot;
      v90 = (char *)v116 + 1;
      do
      {
        v91 = lldiv(quot, 10);
        quot = v91.quot;
        if (v91.rem >= 0)
          LOBYTE(v92) = v91.rem;
        else
          v92 = -v91.rem;
        *(v90 - 2) = v92 + 48;
        v93 = (const UInt8 *)(v90 - 2);
        --v90;
      }
      while (v91.quot);
    }
    else
    {
      v94 = objc_msgSend(v86, "adamID");

      objc_msgSend(v25, "universalStore");
      v95 = (void *)objc_claimAutoreleasedReturnValue();
      v87 = v95;
      if (!v94)
      {
        objc_msgSend(v95, "globalPlaylistID");
        v101 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = (void *)objc_msgSend(v101, "length");

        if (!v24)
          goto LABEL_75;
        objc_msgSend(v25, "universalStore");
        v87 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v87, "globalPlaylistID");
        v99 = objc_claimAutoreleasedReturnValue();
LABEL_73:
        v24 = (void *)v99;

        if (v24)
        {
          v108 = v24;
          objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v108, 1);
          v100 = (void *)objc_claimAutoreleasedReturnValue();
          -[MPCModelStorePlaybackItemsRequest setStoreIDs:](v6, "setStoreIDs:", v100);

        }
        goto LABEL_75;
      }
      v96 = objc_msgSend(v95, "adamID");
      v89 = v96;
      v90 = (char *)v116 + 1;
      do
      {
        v97 = lldiv(v96, 10);
        v96 = v97.quot;
        if (v97.rem >= 0)
          LOBYTE(v98) = v97.rem;
        else
          v98 = -v97.rem;
        *(v90 - 2) = v98 + 48;
        v93 = (const UInt8 *)(v90 - 2);
        --v90;
      }
      while (v97.quot);
    }
    if (v89 < 0)
    {
      *(v90 - 2) = 45;
      v93 = (const UInt8 *)(v90 - 2);
    }
    v99 = (uint64_t)CFStringCreateWithBytes(0, v93, (char *)v116 - (char *)v93, 0x8000100u, 0);
    goto LABEL_73;
  }
  v21 = v4;
  v22 = objc_alloc_init(MPCModelRadioPlaybackContext);
  v23 = objc_alloc(MEMORY[0x24BDDC988]);
  -[MPCModelPlaybackContext identifiers](v18, "identifiers");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = (void *)objc_msgSend(v23, "initWithIdentifiers:block:", v24, &__block_literal_global_110);
  -[MPCModelRadioPlaybackContext setRadioStation:](v22, "setRadioStation:", v25);
LABEL_76:

LABEL_36:
  -[MPCModelStorePlaybackItemsRequest sectionedModelObjects](v6, "sectionedModelObjects");
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  if (v64)
  {

  }
  else
  {
    -[MPCModelStorePlaybackItemsRequest storeIDs](v6, "storeIDs");
    v65 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v65)
    {
      v66 = (MPCModelPlaybackContext *)v22;
      goto LABEL_42;
    }
  }
  v66 = objc_alloc_init(MPCModelPlaybackContext);
  -[MPCModelPlaybackContext setRequest:](v66, "setRequest:", v6);
  objc_msgSend(a1, "startItemPlayParameters");
  v67 = (void *)objc_claimAutoreleasedReturnValue();

  if (v67)
  {
    objc_msgSend(a1, "startItemPlayParameters");
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v68, "identifiers");
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    -[MPCModelPlaybackContext setStartItemIdentifiers:](v66, "setStartItemIdentifiers:", v69);

  }
  objc_msgSend(a1, "startTimes");
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPCModelPlaybackContext setStartTimeModifications:](v66, "setStartTimeModifications:", v70);

  objc_msgSend(a1, "endTimes");
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPCModelPlaybackContext setEndTimeModifications:](v66, "setEndTimeModifications:", v71);

  -[MPCModelPlaybackContext setShuffleType:](v66, "setShuffleType:", objc_msgSend(a1, "shuffleType"));
  -[MPCModelPlaybackContext setRepeatType:](v66, "setRepeatType:", objc_msgSend(a1, "repeatType"));
  -[MPCModelPlaybackContext setAllowsJumpToIt:](v66, "setAllowsJumpToIt:", 1);
  -[MPCModelPlaybackContext playbackRequestEnvironment](v66, "playbackRequestEnvironment");
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  v73 = (void *)objc_msgSend(v72, "mutableCopy");

  v74 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEC8770]), "initWithSystemApplicationType:", 0);
  objc_msgSend(v74, "clientIdentifier");
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v73, "setClientIdentifier:", v75);

  objc_msgSend(v74, "clientVersion");
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v73, "setClientVersion:", v76);

  objc_msgSend(a1, "_addRequestingBundleIdentifierToPlaybackRequestEnvironment:", v73);
  -[MPCModelPlaybackContext setPlaybackRequestEnvironment:](v66, "setPlaybackRequestEnvironment:", v73);

LABEL_42:
  if (objc_msgSend(a1, "isPrivate"))
    -[MPCModelPlaybackContext setPrivateListeningOverride:](v66, "setPrivateListeningOverride:", MEMORY[0x24BDBD1C8]);
  objc_msgSend(a1, "playActivityFeatureName");
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPCModelPlaybackContext setPlayActivityFeatureName:](v66, "setPlayActivityFeatureName:", v77);

  objc_msgSend(a1, "playActivityQueueGroupingID");
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPCModelPlaybackContext setPlayActivityQueueGroupingID:](v66, "setPlayActivityQueueGroupingID:", v78);

  -[MPCModelPlaybackContext setQueueDescriptor:](v66, "setQueueDescriptor:", a1);
  v79 = os_log_create("com.apple.amp.mediaplaybackcore", "SDKPlayback");
  if (os_log_type_enabled(v79, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v113 = v66;
    _os_log_impl(&dword_210BD8000, v79, OS_LOG_TYPE_DEFAULT, "MusicKit: Created playback context: %{public}@", buf, 0xCu);
  }

  return v66;
}

- (uint64_t)matchesStartItem:()MPCModelPlaybackAdditions
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;
  uint64_t v9;
  void *v10;
  __CFString *v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  uint64_t quot;
  uint64_t v17;
  char *v18;
  lldiv_t v19;
  uint64_t v20;
  const UInt8 *v21;
  __CFString *v22;
  id v23;
  char v24;
  void *v25;
  id v26;
  char v27;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(a1, "startItemPlayParameters");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(a1, "startItemPlayParameters");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "itemKind");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "isEqualToString:", *MEMORY[0x24BDDC618]);

    if ((v8 & 1) == 0)
    {
      objc_msgSend(a1, "startItemPlayParameters");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "persistentID");
      v11 = (__CFString *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(a1, "startItemPlayParameters");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "catalogID");
      v13 = (id)objc_claimAutoreleasedReturnValue();

      objc_msgSend(a1, "startItemPlayParameters");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "libraryID");
      v15 = (id)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v4, "persistentID"))
      {
        quot = objc_msgSend(v4, "persistentID");
        v17 = quot;
        v18 = (char *)&v29 + 1;
        do
        {
          v19 = lldiv(quot, 10);
          quot = v19.quot;
          if (v19.rem >= 0)
            LOBYTE(v20) = v19.rem;
          else
            v20 = -v19.rem;
          *(v18 - 2) = v20 + 48;
          v21 = (const UInt8 *)(v18 - 2);
          --v18;
        }
        while (v19.quot);
        if (v17 < 0)
        {
          *(v18 - 2) = 45;
          v21 = (const UInt8 *)(v18 - 2);
        }
        v22 = (__CFString *)CFStringCreateWithBytes(0, v21, (char *)&v29 - (char *)v21, 0x8000100u, 0);
      }
      else
      {
        v22 = &stru_24CABB5D0;
      }
      objc_msgSend(v4, "cloudUniversalLibraryID");
      v23 = (id)objc_claimAutoreleasedReturnValue();
      if (v15 == v23)
      {
        v9 = 1;
        v25 = v15;
      }
      else
      {
        v24 = objc_msgSend(v15, "isEqual:", v23);

        if ((v24 & 1) != 0)
        {
          v9 = 1;
LABEL_24:

          goto LABEL_25;
        }
        objc_msgSend(v4, "storeItemID");
        v26 = (id)objc_claimAutoreleasedReturnValue();
        if (v13 == v26)
        {

          v9 = 1;
          v25 = v13;
        }
        else
        {
          v25 = v26;
          v27 = objc_msgSend(v13, "isEqual:", v26);

          v9 = 1;
          if ((v27 & 1) == 0 && v11 != v22)
            v9 = -[__CFString isEqual:](v11, "isEqual:", v22);
        }
      }

      goto LABEL_24;
    }
  }
  v9 = 1;
LABEL_25:

  return v9;
}

@end
