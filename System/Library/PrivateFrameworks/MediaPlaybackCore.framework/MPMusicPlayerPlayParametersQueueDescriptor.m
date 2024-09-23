@implementation MPMusicPlayerPlayParametersQueueDescriptor

uint64_t __129__MPMusicPlayerPlayParametersQueueDescriptor_MPCModelPlaybackAdditions___classicalMusicAppPlaybackContextForPlayParametersQueue___block_invoke_118(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setPersonalStoreIdentifiersWithPersonID:block:", *(_QWORD *)(a1 + 32), &__block_literal_global_120);
}

id __129__MPMusicPlayerPlayParametersQueueDescriptor_MPCModelPlaybackAdditions___classicalMusicAppPlaybackContextForPlayParametersQueue___block_invoke_2_123(uint64_t a1, void *a2)
{
  id v3;
  id v4;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "identifiersMatchingIdentifierSet:propertySet:options:error:", v3, *(_QWORD *)(a1 + 40), 0, 0);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if (!v4)
    v4 = v3;

  return v4;
}

id __129__MPMusicPlayerPlayParametersQueueDescriptor_MPCModelPlaybackAdditions___classicalMusicAppPlaybackContextForPlayParametersQueue___block_invoke_127(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t quot;
  uint64_t v8;
  char *v9;
  lldiv_t v10;
  uint64_t v11;
  const UInt8 *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  lldiv_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v21;
  uint64_t v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v2 = a2;
  objc_msgSend(v2, "universalStore");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "subscriptionAdamID");

  objc_msgSend(v2, "universalStore");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v4)
  {
    quot = objc_msgSend(v5, "subscriptionAdamID");
    v8 = quot;
    v9 = (char *)&v23 + 1;
    do
    {
      v10 = lldiv(quot, 10);
      quot = v10.quot;
      if (v10.rem >= 0)
        LOBYTE(v11) = v10.rem;
      else
        v11 = -v10.rem;
      *(v9 - 2) = v11 + 48;
      v12 = (const UInt8 *)(v9 - 2);
      --v9;
    }
    while (v10.quot);
LABEL_14:
    if (v8 < 0)
    {
      *(v9 - 2) = 45;
      v12 = (const UInt8 *)(v9 - 2);
    }
    v18 = (uint64_t)CFStringCreateWithBytes(0, v12, (char *)&v23 - (char *)v12, 0x8000100u, 0);
    goto LABEL_17;
  }
  v13 = objc_msgSend(v5, "adamID");

  objc_msgSend(v2, "universalStore");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v14;
  if (v13)
  {
    v15 = objc_msgSend(v14, "adamID");
    v8 = v15;
    v9 = (char *)&v23 + 1;
    do
    {
      v16 = lldiv(v15, 10);
      v15 = v16.quot;
      if (v16.rem >= 0)
        LOBYTE(v17) = v16.rem;
      else
        v17 = -v16.rem;
      *(v9 - 2) = v17 + 48;
      v12 = (const UInt8 *)(v9 - 2);
      --v9;
    }
    while (v16.quot);
    goto LABEL_14;
  }
  objc_msgSend(v14, "globalPlaylistID");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v21, "length");

  if (!v22)
  {
    v19 = 0;
    goto LABEL_18;
  }
  objc_msgSend(v2, "universalStore");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "globalPlaylistID");
  v18 = objc_claimAutoreleasedReturnValue();
LABEL_17:
  v19 = (void *)v18;

LABEL_18:
  return v19;
}

id __129__MPMusicPlayerPlayParametersQueueDescriptor_MPCModelPlaybackAdditions___classicalMusicAppPlaybackContextForPlayParametersQueue___block_invoke_3(uint64_t a1, void *a2)
{
  objc_class *v2;
  id v3;
  void *v4;

  v2 = (objc_class *)MEMORY[0x24BDDC9D8];
  v3 = a2;
  v4 = (void *)objc_msgSend([v2 alloc], "initWithIdentifiers:block:", v3, &__block_literal_global_126);

  return v4;
}

uint64_t __129__MPMusicPlayerPlayParametersQueueDescriptor_MPCModelPlaybackAdditions___classicalMusicAppPlaybackContextForPlayParametersQueue___block_invoke_121(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "identifiers");
}

id __164__MPMusicPlayerPlayParametersQueueDescriptor_MPCModelPlaybackAdditions___playbackContextForStorePlayParameters_libraryItems_radioPlaybackContext_containsStartItem___block_invoke_4(uint64_t a1, void *a2)
{
  id v2;
  void *v3;

  v2 = a2;
  if (objc_msgSend(v2, "isLibraryContent"))
    objc_msgSend(v2, "catalogID");
  else
    objc_msgSend(v2, "itemID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

id __164__MPMusicPlayerPlayParametersQueueDescriptor_MPCModelPlaybackAdditions___playbackContextForStorePlayParameters_libraryItems_radioPlaybackContext_containsStartItem___block_invoke_2_48(uint64_t a1, void *a2)
{
  objc_class *v2;
  id v3;
  id v4;
  void *v5;
  void *v6;

  v2 = (objc_class *)MEMORY[0x24BDDC9D8];
  v3 = a2;
  v4 = [v2 alloc];
  objc_msgSend(v3, "identifiers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = (void *)objc_msgSend(v4, "initWithIdentifiers:block:", v5, &__block_literal_global_52);
  return v6;
}

void __204__MPMusicPlayerPlayParametersQueueDescriptor_MPCModelPlaybackAdditions___updatePlaybackContextsForPlaybackParametersQueue_libraryItems_radioPlaybackContext_storePlayParameters_contexts_containsStartItem___block_invoke(uint64_t a1, void *a2, id *a3, void *a4, void *a5)
{
  id v9;
  id v10;
  id v11;
  MPCModelRadioPlaybackContext *v12;
  void *v13;
  NSObject *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  int v18;
  int v19;
  uint64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v9 = a5;
  v10 = a4;
  v11 = a2;
  v12 = objc_alloc_init(MPCModelRadioPlaybackContext);
  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDDC988]), "initWithIdentifiers:block:", v10, &__block_literal_global_12619);

  -[MPCModelRadioPlaybackContext setRadioStation:](v12, "setRadioStation:", v13);
  v14 = os_log_create("com.apple.amp.mediaplaybackcore", "SDKPlayback");
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    v15 = *(_QWORD *)(a1 + 32);
    v19 = 138543362;
    v20 = v15;
    _os_log_impl(&dword_210BD8000, v14, OS_LOG_TYPE_DEFAULT, "MusicKit: Adding playback context for radio station: %{public}@", (uint8_t *)&v19, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 40), "_playbackContextForStorePlayParameters:libraryItems:radioPlaybackContext:containsStartItem:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), v12, objc_msgSend(*a3, "BOOLValue"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addObject:", v16);

  *a3 = (id)MEMORY[0x24BDBD1C0];
  objc_msgSend(*(id *)(a1 + 48), "removeAllObjects");
  objc_msgSend(*(id *)(a1 + 56), "removeAllObjects");
  objc_msgSend(*(id *)(a1 + 40), "startItemPlayParameters");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "isEqual:", v9);

  if (v18)
    *a3 = (id)MEMORY[0x24BDBD1C8];

}

void __204__MPMusicPlayerPlayParametersQueueDescriptor_MPCModelPlaybackAdditions___updatePlaybackContextsForPlaybackParametersQueue_libraryItems_radioPlaybackContext_storePlayParameters_contexts_containsStartItem___block_invoke_29(uint64_t a1, uint64_t a2, id *a3, uint64_t a4, void *a5, void *a6)
{
  id v9;
  id v10;
  NSObject *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  int v19;
  uint64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v9 = a5;
  v10 = a6;
  v11 = os_log_create("com.apple.amp.mediaplaybackcore", "SDKPlayback");
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v12 = *(_QWORD *)(a1 + 32);
    v19 = 138543362;
    v20 = v12;
    _os_log_impl(&dword_210BD8000, v11, OS_LOG_TYPE_DEFAULT, "MusicKit: Adding store playback context for store play parameters %{public}@", (uint8_t *)&v19, 0xCu);
  }

  v13 = *(void **)(a1 + 32);
  if (v13)
  {
    if (v10 || (v14 = objc_msgSend(*(id *)(a1 + 40), "count"), v13 = *(void **)(a1 + 32), v14))
    {
      v15 = *(void **)(a1 + 48);
      objc_msgSend(*(id *)(a1 + 56), "_playbackContextForStorePlayParameters:libraryItems:radioPlaybackContext:containsStartItem:", v13, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 64), objc_msgSend(*a3, "BOOLValue"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "addObject:", v16);

      *a3 = (id)MEMORY[0x24BDBD1C0];
      objc_msgSend(*(id *)(a1 + 40), "removeAllObjects");
      v13 = *(void **)(a1 + 32);
    }
    objc_msgSend(v13, "addObject:", v9);
    objc_msgSend(*(id *)(a1 + 56), "startItemPlayParameters");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "isEqual:", v9);

    if (v18)
    {
      v10 = 0;
      *a3 = (id)MEMORY[0x24BDBD1C8];
    }
    else
    {
      v10 = 0;
    }
  }

}

void __89__MPMusicPlayerPlayParametersQueueDescriptor_MPCModelPlaybackAdditions__playbackContexts__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v7[3];

  v7[2] = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MRMediaRemoteCopyLocalDeviceSystemClassicalRoomApplicationDisplayID();
  v3 = (void *)objc_msgSend(v2, "mutableCopy");
  objc_msgSend(v3, "stringByAppendingString:", CFSTR(".tst"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v7[0] = v2;
  v7[1] = v4;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v7, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "requestingBundleIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  playbackContexts_isClassicMusicApp = objc_msgSend(v5, "containsObject:", v6);

}

@end
