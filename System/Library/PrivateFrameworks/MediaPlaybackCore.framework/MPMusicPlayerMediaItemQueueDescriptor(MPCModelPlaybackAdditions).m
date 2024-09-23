@implementation MPMusicPlayerMediaItemQueueDescriptor(MPCModelPlaybackAdditions)

- (id)playbackContexts
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  MPCModelPlaybackContext *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  _QWORD v27[4];
  id v28;
  uint64_t v29;
  _QWORD v30[2];

  v30[1] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "query");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_alloc_init(MEMORY[0x24BDDC8F8]);
  objc_msgSend(v3, "setLegacyMediaQuery:", v2);
  v4 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(a1, "playActivityFeatureName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("MediaItemQueueDescriptor-%@"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setLabel:", v6);

  v7 = objc_alloc_init(MPCModelPlaybackContext);
  -[MPCModelPlaybackContext setRequest:](v7, "setRequest:", v3);
  objc_msgSend(a1, "startItem");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    objc_msgSend(v2, "mediaLibrary");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "uniqueIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = objc_msgSend(v8, "persistentID");
    if (objc_msgSend(v2, "isPlaylistItemsQuery"))
      v11 = objc_msgSend(v2, "_playlistItemPersistentIDForItemPersistentID:", v11);
    v12 = objc_alloc(MEMORY[0x24BDDC758]);
    objc_msgSend(MEMORY[0x24BDDC9E0], "identityKind");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v27[0] = MEMORY[0x24BDAC760];
    v27[1] = 3221225472;
    v27[2] = __84__MPMusicPlayerMediaItemQueueDescriptor_MPCModelPlaybackAdditions__playbackContexts__block_invoke;
    v27[3] = &unk_24CAB7E68;
    v28 = v10;
    v29 = v11;
    v14 = v10;
    v15 = (void *)objc_msgSend(v12, "initWithSource:modelKind:block:", CFSTR("MPMusicPlayerQueueDescriptor"), v13, v27);
    -[MPCModelPlaybackContext setStartItemIdentifiers:](v7, "setStartItemIdentifiers:", v15);

  }
  objc_msgSend(a1, "startTimes");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPCModelPlaybackContext setStartTimeModifications:](v7, "setStartTimeModifications:", v16);

  objc_msgSend(a1, "endTimes");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPCModelPlaybackContext setEndTimeModifications:](v7, "setEndTimeModifications:", v17);

  -[MPCModelPlaybackContext setShuffleType:](v7, "setShuffleType:", objc_msgSend(a1, "shuffleType"));
  -[MPCModelPlaybackContext setRepeatType:](v7, "setRepeatType:", objc_msgSend(a1, "repeatType"));
  objc_msgSend(a1, "playActivityFeatureName");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPCModelPlaybackContext setPlayActivityFeatureName:](v7, "setPlayActivityFeatureName:", v18);

  objc_msgSend(a1, "playActivityQueueGroupingID");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPCModelPlaybackContext setPlayActivityQueueGroupingID:](v7, "setPlayActivityQueueGroupingID:", v19);

  -[MPCModelPlaybackContext playbackRequestEnvironment](v7, "playbackRequestEnvironment");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = (void *)objc_msgSend(v20, "mutableCopy");

  v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEC8770]), "initWithSystemApplicationType:", 0);
  objc_msgSend(v22, "clientIdentifier");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setClientIdentifier:", v23);

  objc_msgSend(v22, "clientVersion");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setClientVersion:", v24);

  if (objc_msgSend(a1, "isPrivate"))
    -[MPCModelPlaybackContext setPrivateListeningOverride:](v7, "setPrivateListeningOverride:", MEMORY[0x24BDBD1C8]);
  objc_msgSend(a1, "_addRequestingBundleIdentifierToPlaybackRequestEnvironment:", v21);
  -[MPCModelPlaybackContext setPlaybackRequestEnvironment:](v7, "setPlaybackRequestEnvironment:", v21);
  -[MPCModelPlaybackContext setQueueDescriptor:](v7, "setQueueDescriptor:", a1);
  v30[0] = v7;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v30, 1);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  return v25;
}

- (BOOL)matchesStartItem:()MPCModelPlaybackAdditions
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  _BOOL8 v9;

  v4 = a3;
  objc_msgSend(a1, "startItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(a1, "startItem");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "persistentID");
    objc_msgSend(v4, "mediaItem");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v7 == objc_msgSend(v8, "persistentID");

  }
  else
  {
    v9 = 1;
  }

  return v9;
}

@end
