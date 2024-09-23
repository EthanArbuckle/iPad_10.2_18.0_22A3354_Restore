@implementation MPGenericTracklistPlaybackQueue(MPCAdditions)

- (void)getMusicPlaybackContextWithOptions:()MPCAdditions completion:
{
  void (**v5)(id, MPCModelPlaybackContext *, _QWORD);
  MPCModelStorePlaybackItemsRequest *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t j;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t i;
  uint64_t v27;
  id v28;
  void *v29;
  void *v30;
  void *v31;
  MPCModelPlaybackContext *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  uint64_t v37;
  uint64_t v38;
  id v39;
  void *v40;
  void *v41;
  uint64_t v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  id obj;
  _QWORD v55[5];
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  _QWORD v60[5];
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  _BYTE v65[128];
  _BYTE v66[128];
  uint64_t v67;

  v67 = *MEMORY[0x24BDAC8D0];
  v5 = a4;
  v6 = objc_alloc_init(MPCModelStorePlaybackItemsRequest);
  objc_msgSend(a1, "trackIdentifiers");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "collectionIdentifierSet");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v52 = a1;
  v53 = v7;
  if (v8)
  {
    v9 = objc_alloc_init(MEMORY[0x24BDDCA88]);
    objc_msgSend(a1, "collectionIdentifierSet");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "universalStore");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "globalPlaylistID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      v13 = objc_alloc(MEMORY[0x24BDDC948]);
      objc_msgSend(a1, "collectionIdentifierSet");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = &__block_literal_global_131;
    }
    else
    {
      v13 = objc_alloc(MEMORY[0x24BDDC830]);
      objc_msgSend(a1, "collectionIdentifierSet");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = &__block_literal_global_133;
    }
    v22 = objc_msgSend(v13, "initWithIdentifiers:block:", v14, v15);

    v51 = (void *)v22;
    objc_msgSend(v9, "appendSection:", v22);
    v63 = 0u;
    v64 = 0u;
    v61 = 0u;
    v62 = 0u;
    obj = v7;
    v23 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v61, v66, 16);
    if (v23)
    {
      v24 = v23;
      v25 = *(_QWORD *)v62;
      do
      {
        for (i = 0; i != v24; ++i)
        {
          if (*(_QWORD *)v62 != v25)
            objc_enumerationMutation(obj);
          v27 = *(_QWORD *)(*((_QWORD *)&v61 + 1) + 8 * i);
          v28 = objc_alloc(MEMORY[0x24BDDC758]);
          objc_msgSend(MEMORY[0x24BDDC9E0], "identityKind");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          v60[0] = MEMORY[0x24BDAC760];
          v60[1] = 3221225472;
          v60[2] = __95__MPGenericTracklistPlaybackQueue_MPCAdditions__getMusicPlaybackContextWithOptions_completion___block_invoke_3;
          v60[3] = &unk_24CAB8A40;
          v60[4] = v27;
          v30 = (void *)objc_msgSend(v28, "initWithSource:modelKind:block:", CFSTR("MRQueue-GenericTracklist"), v29, v60);

          v31 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDDC9D8]), "initWithIdentifiers:block:", v30, &__block_literal_global_139);
          objc_msgSend(v9, "appendItem:", v31);

        }
        v24 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v61, v66, 16);
      }
      while (v24);
    }

    -[MPCModelStorePlaybackItemsRequest setSectionedModelObjects:](v6, "setSectionedModelObjects:", v9);
  }
  else
  {
    v9 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", objc_msgSend(v7, "count"));
    v56 = 0u;
    v57 = 0u;
    v58 = 0u;
    v59 = 0u;
    v16 = v7;
    v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v56, v65, 16);
    if (v17)
    {
      v18 = v17;
      v19 = *(_QWORD *)v57;
      do
      {
        for (j = 0; j != v18; ++j)
        {
          if (*(_QWORD *)v57 != v19)
            objc_enumerationMutation(v16);
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@"), *(_QWORD *)(*((_QWORD *)&v56 + 1) + 8 * j));
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "addObject:", v21);

        }
        v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v56, v65, 16);
      }
      while (v18);
    }

    -[MPCModelStorePlaybackItemsRequest setStoreIDs:](v6, "setStoreIDs:", v9);
  }

  v32 = objc_alloc_init(MPCModelPlaybackContext);
  objc_msgSend(v52, "siriReferenceIdentifier");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPCModelPlaybackContext setSiriReferenceIdentifier:](v32, "setSiriReferenceIdentifier:", v33);

  objc_msgSend(v52, "userIdentity");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPCModelPlaybackContext setUserIdentity:](v32, "setUserIdentity:", v34);

  objc_msgSend(v52, "privateListeningOverride");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPCModelPlaybackContext setPrivateListeningOverride:](v32, "setPrivateListeningOverride:", v35);

  -[MPCModelPlaybackContext setRequest:](v32, "setRequest:", v6);
  objc_msgSend(v52, "firstTrackIdentifier");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v36, "length"))
  {
    v37 = objc_msgSend(v36, "longLongValue");
    if (v37)
    {
      v38 = v37;
      v39 = objc_alloc(MEMORY[0x24BDDC758]);
      objc_msgSend(MEMORY[0x24BDDC9E0], "identityKind");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      v55[0] = MEMORY[0x24BDAC760];
      v55[1] = 3221225472;
      v55[2] = __95__MPGenericTracklistPlaybackQueue_MPCAdditions__getMusicPlaybackContextWithOptions_completion___block_invoke_6;
      v55[3] = &__block_descriptor_40_e49_v16__0__MPIdentifierSet_MPMutableIdentifierSet__8l;
      v55[4] = v38;
      v41 = (void *)objc_msgSend(v39, "initWithSource:modelKind:block:", CFSTR("MRQueue-GenericTracklist"), v40, v55);

      -[MPCModelPlaybackContext setStartItemIdentifiers:](v32, "setStartItemIdentifiers:", v41);
    }
  }
  if (objc_msgSend(v52, "isRequestingImmediatePlayback"))
    v42 = 20;
  else
    v42 = 0;
  -[MPCModelPlaybackContext setActionAfterQueueLoad:](v32, "setActionAfterQueueLoad:", v42);
  -[MPCModelPlaybackContext setShuffleType:](v32, "setShuffleType:", objc_msgSend(v52, "shuffleType"));
  -[MPCModelPlaybackContext setRepeatType:](v32, "setRepeatType:", objc_msgSend(v52, "repeatType"));
  objc_msgSend(v52, "mediaRemoteOptions");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "objectForKeyedSubscript:", *MEMORY[0x24BE65978]);
  v44 = (void *)objc_claimAutoreleasedReturnValue();

  if (v44)
    -[MPCModelPlaybackContext setQueueEndAction:](v32, "setQueueEndAction:", objc_msgSend(v44, "integerValue"));
  objc_msgSend(v52, "siriRecommendationIdentifier");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "dataUsingEncoding:", 4);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPCModelPlaybackContext setPlayActivityRecommendationData:](v32, "setPlayActivityRecommendationData:", v46);

  objc_msgSend(v52, "siriAssetInfo");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPCModelPlaybackContext setSiriAssetInfo:](v32, "setSiriAssetInfo:", v47);

  objc_msgSend(v52, "featureName");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPCModelPlaybackContext setPlayActivityFeatureName:](v32, "setPlayActivityFeatureName:", v48);

  objc_msgSend(v52, "queueGroupingID");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPCModelPlaybackContext setPlayActivityQueueGroupingID:](v32, "setPlayActivityQueueGroupingID:", v49);

  objc_msgSend(v52, "siriWHAMetricsInfo");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPCModelPlaybackContext setSiriWHAMetricsInfo:](v32, "setSiriWHAMetricsInfo:", v50);

  v5[2](v5, v32, 0);
}

@end
