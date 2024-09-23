@implementation MPMusicPlayerStoreQueueDescriptor(MPCModelPlaybackAdditions)

- (id)playbackContexts
{
  MPCModelStorePlaybackItemsRequest *v2;
  void *v3;
  MPCModelPlaybackContext *v4;
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
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  _QWORD v20[4];
  id v21;
  _QWORD v22[2];

  v22[1] = *MEMORY[0x24BDAC8D0];
  v2 = objc_alloc_init(MPCModelStorePlaybackItemsRequest);
  objc_msgSend(a1, "storeIDs");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPCModelStorePlaybackItemsRequest setStoreIDs:](v2, "setStoreIDs:", v3);
  -[MPCModelStorePlaybackItemsRequest setClientIdentifier:](v2, "setClientIdentifier:", CFSTR("com.apple.Music"));
  v4 = objc_alloc_init(MPCModelPlaybackContext);
  objc_msgSend(a1, "startItemID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = objc_alloc(MEMORY[0x24BDDC758]);
    objc_msgSend(MEMORY[0x24BDDC9E0], "identityKind");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v20[0] = MEMORY[0x24BDAC760];
    v20[1] = 3221225472;
    v20[2] = __80__MPMusicPlayerStoreQueueDescriptor_MPCModelPlaybackAdditions__playbackContexts__block_invoke;
    v20[3] = &unk_24CAB8A40;
    v21 = v5;
    v8 = (void *)objc_msgSend(v6, "initWithSource:modelKind:block:", CFSTR("MPMusicPlayerQueueDescriptor"), v7, v20);

    -[MPCModelPlaybackContext setStartItemIdentifiers:](v4, "setStartItemIdentifiers:", v8);
  }
  -[MPCModelPlaybackContext setRequest:](v4, "setRequest:", v2);
  objc_msgSend(a1, "startTimes");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPCModelPlaybackContext setStartTimeModifications:](v4, "setStartTimeModifications:", v9);

  objc_msgSend(a1, "endTimes");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPCModelPlaybackContext setEndTimeModifications:](v4, "setEndTimeModifications:", v10);

  -[MPCModelPlaybackContext setShuffleType:](v4, "setShuffleType:", objc_msgSend(a1, "shuffleType"));
  -[MPCModelPlaybackContext setRepeatType:](v4, "setRepeatType:", objc_msgSend(a1, "repeatType"));
  objc_msgSend(a1, "playActivityFeatureName");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPCModelPlaybackContext setPlayActivityFeatureName:](v4, "setPlayActivityFeatureName:", v11);

  objc_msgSend(a1, "playActivityQueueGroupingID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPCModelPlaybackContext setPlayActivityQueueGroupingID:](v4, "setPlayActivityQueueGroupingID:", v12);

  -[MPCModelPlaybackContext playbackRequestEnvironment](v4, "playbackRequestEnvironment");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v13, "mutableCopy");

  v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEC8770]), "initWithSystemApplicationType:", 0);
  objc_msgSend(v15, "clientIdentifier");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setClientIdentifier:", v16);

  objc_msgSend(v15, "clientVersion");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setClientVersion:", v17);

  if (objc_msgSend(a1, "isPrivate"))
    -[MPCModelPlaybackContext setPrivateListeningOverride:](v4, "setPrivateListeningOverride:", MEMORY[0x24BDBD1C8]);
  objc_msgSend(a1, "_addRequestingBundleIdentifierToPlaybackRequestEnvironment:", v14);
  -[MPCModelPlaybackContext setPlaybackRequestEnvironment:](v4, "setPlaybackRequestEnvironment:", v14);
  -[MPCModelPlaybackContext setQueueDescriptor:](v4, "setQueueDescriptor:", a1);
  v22[0] = v4;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v22, 1);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

- (uint64_t)matchesStartItem:()MPCModelPlaybackAdditions
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;

  v4 = a3;
  objc_msgSend(a1, "startItemID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(v4, "storeItemID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "startItemID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v6, "isEqual:", v7);

  }
  else
  {
    v8 = 1;
  }

  return v8;
}

@end
