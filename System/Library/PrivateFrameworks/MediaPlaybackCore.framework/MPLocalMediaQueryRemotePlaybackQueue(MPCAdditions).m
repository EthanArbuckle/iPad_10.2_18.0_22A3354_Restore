@implementation MPLocalMediaQueryRemotePlaybackQueue(MPCAdditions)

- (void)getMusicPlaybackContextWithOptions:()MPCAdditions completion:
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  MPCModelPlaybackContext *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  id v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  id v39;
  void (**v40)(id, MPCModelPlaybackContext *, _QWORD);
  _QWORD v41[4];
  id v42;
  uint64_t v43;

  v40 = a4;
  objc_msgSend(a1, "mediaQuery");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "mediaLibrary");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "userIdentity");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(a1, "userIdentity");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BEC8A60], "defaultIdentityStore");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v8, "isEqualToIdentity:inStore:", v9, v10);

    if ((v11 & 1) != 0)
    {
      v12 = objc_alloc_init(MEMORY[0x24BDDC8F8]);
      objc_msgSend(v12, "setLegacyMediaQuery:", v6);
      v13 = (void *)MEMORY[0x24BDD17C8];
      objc_msgSend(a1, "featureName");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "stringWithFormat:", CFSTR("RemotePlaybackQueue-%@"), v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setLabel:", v15);

      v16 = objc_alloc_init(MPCModelPlaybackContext);
      objc_msgSend(a1, "privateListeningOverride");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[MPCModelPlaybackContext setPrivateListeningOverride:](v16, "setPrivateListeningOverride:", v17);

      objc_msgSend(a1, "siriReferenceIdentifier");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[MPCModelPlaybackContext setSiriReferenceIdentifier:](v16, "setSiriReferenceIdentifier:", v18);

      -[MPCModelPlaybackContext setUserIdentity:](v16, "setUserIdentity:", v9);
      -[MPCModelPlaybackContext setRequest:](v16, "setRequest:", v12);
      objc_msgSend(a1, "firstItem");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      if (v19)
      {
        objc_msgSend(v6, "mediaLibrary");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "uniqueIdentifier");
        v21 = (void *)objc_claimAutoreleasedReturnValue();

        v22 = objc_msgSend(v19, "persistentID");
        if (objc_msgSend(v6, "isPlaylistItemsQuery"))
          v22 = objc_msgSend(v6, "_playlistItemPersistentIDForItemPersistentID:", v22);
        v39 = v12;
        v23 = v9;
        v24 = v19;
        v25 = objc_alloc(MEMORY[0x24BDDC758]);
        objc_msgSend(MEMORY[0x24BDDC9E0], "identityKind");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v41[0] = MEMORY[0x24BDAC760];
        v41[1] = 3221225472;
        v41[2] = __100__MPLocalMediaQueryRemotePlaybackQueue_MPCAdditions__getMusicPlaybackContextWithOptions_completion___block_invoke;
        v41[3] = &unk_24CAB7E68;
        v42 = v21;
        v43 = v22;
        v27 = v21;
        v28 = v25;
        v19 = v24;
        v9 = v23;
        v12 = v39;
        v29 = (void *)objc_msgSend(v28, "initWithSource:modelKind:block:", CFSTR("MRQueue-MediaQuery"), v26, v41);
        -[MPCModelPlaybackContext setStartItemIdentifiers:](v16, "setStartItemIdentifiers:", v29);

      }
      if (objc_msgSend(a1, "isRequestingImmediatePlayback"))
        v30 = 20;
      else
        v30 = 0;
      -[MPCModelPlaybackContext setActionAfterQueueLoad:](v16, "setActionAfterQueueLoad:", v30);
      -[MPCModelPlaybackContext setShuffleType:](v16, "setShuffleType:", objc_msgSend(a1, "shuffleType"));
      -[MPCModelPlaybackContext setRepeatType:](v16, "setRepeatType:", objc_msgSend(a1, "repeatType"));
      objc_msgSend(a1, "mediaRemoteOptions");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "objectForKeyedSubscript:", *MEMORY[0x24BE65978]);
      v32 = (void *)objc_claimAutoreleasedReturnValue();

      if (v32)
        -[MPCModelPlaybackContext setQueueEndAction:](v16, "setQueueEndAction:", objc_msgSend(v32, "integerValue"));
      objc_msgSend(a1, "siriRecommendationIdentifier");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "dataUsingEncoding:", 4);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      -[MPCModelPlaybackContext setPlayActivityRecommendationData:](v16, "setPlayActivityRecommendationData:", v34);

      objc_msgSend(a1, "siriAssetInfo");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      -[MPCModelPlaybackContext setSiriAssetInfo:](v16, "setSiriAssetInfo:", v35);

      objc_msgSend(a1, "featureName");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      -[MPCModelPlaybackContext setPlayActivityFeatureName:](v16, "setPlayActivityFeatureName:", v36);

      objc_msgSend(a1, "queueGroupingID");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      -[MPCModelPlaybackContext setPlayActivityQueueGroupingID:](v16, "setPlayActivityQueueGroupingID:", v37);

      objc_msgSend(a1, "siriWHAMetricsInfo");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      -[MPCModelPlaybackContext setSiriWHAMetricsInfo:](v16, "setSiriWHAMetricsInfo:", v38);

      v40[2](v40, v16, 0);
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD1540], "msv_errorWithDomain:code:debugDescription:", CFSTR("MPCError"), 68, CFSTR("MPMediaQuery's userIdentity does not match MPRemotePlaybackQueue's userIdentity. queryIdentity=%@ playbackQueueIdentity=%@"), v8, v9);
      v12 = (id)objc_claimAutoreleasedReturnValue();
      ((void (**)(id, MPCModelPlaybackContext *, id))v40)[2](v40, 0, v12);
    }

  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1540], "msv_errorWithDomain:code:debugDescription:", CFSTR("MPCError"), 3000, CFSTR("MPLocalMediaQueryRemotePlaybackQueue has nil mediaQuery"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(id, MPCModelPlaybackContext *, void *))v40)[2](v40, 0, v8);
  }

}

@end
