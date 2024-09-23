@implementation MPCModelQueueFeeder

uint64_t __55__MPCModelQueueFeeder_modelPlayEventForItem_inSection___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "indexForItem:", *(_QWORD *)(a1 + 32));
}

uint64_t __45__MPCModelQueueFeeder_itemForItem_inSection___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "indexForItem:", *(_QWORD *)(a1 + 32));
}

- (BOOL)shouldUsePlaceholderForItem:(id)a3 inSection:(id)a4
{
  id v5;
  id v6;
  void *v7;
  char v8;
  _QWORD v10[4];
  id v11;

  v5 = a3;
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __61__MPCModelQueueFeeder_shouldUsePlaceholderForItem_inSection___block_invoke;
  v10[3] = &unk_24CABA158;
  v11 = v5;
  v6 = v5;
  -[MPCModelQueueFeeder identifierRegistryWithExclusiveAccessReturningObject:](self, "identifierRegistryWithExclusiveAccessReturningObject:", v10);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isPlaceholder");

  return v8;
}

- (id)itemForItem:(id)a3 inSection:(id)a4
{
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  NSObject *v11;
  void *v12;
  MPCModelMediaClipAVItem *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  MPCModelMediaClipAVItem *v19;
  MPCModelMediaClipAVItem *v20;
  NSObject *v21;
  void *v22;
  uint64_t v23;
  MPCModelGenericAVItem *v24;
  void *v25;
  void *v26;
  MPCModelGenericAVItem *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  NSObject *accessQueue;
  MPCModelGenericAVItem *v37;
  MPCModelGenericAVItem *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v43;
  id v44;
  _QWORD block[5];
  MPCModelGenericAVItem *v46;
  _QWORD v47[4];
  id v48;
  uint8_t buf[4];
  void *v50;
  __int16 v51;
  MPCModelQueueFeeder *v52;
  __int16 v53;
  uint64_t v54;
  __int16 v55;
  id v56;
  __int16 v57;
  NSObject *v58;
  __int16 v59;
  uint64_t v60;
  uint64_t v61;

  v61 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  v47[0] = MEMORY[0x24BDAC760];
  v47[1] = 3221225472;
  v47[2] = __45__MPCModelQueueFeeder_itemForItem_inSection___block_invoke;
  v47[3] = &unk_24CABA0B0;
  v9 = v7;
  v48 = v9;
  v10 = -[MPCModelQueueFeeder identifierRegistryWithExclusiveAccessReturningInteger:](self, "identifierRegistryWithExclusiveAccessReturningInteger:", v47);
  if (v10 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v11 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      -[MPCModelQueueFeeder uniqueIdentifier](self, "uniqueIdentifier");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v50 = v12;
      v51 = 2048;
      v52 = self;
      v53 = 2114;
      v54 = (uint64_t)v9;
      _os_log_impl(&dword_210BD8000, v11, OS_LOG_TYPE_ERROR, "[MQF:%{public}@:%p] itemForItem:inSection: | returning nil [no index for item in registry] item=%{public}@", buf, 0x20u);

    }
    v13 = 0;
  }
  else
  {
    v14 = v10;
    -[MPCModelPlaybackResponse results](self->_response, "results");
    v11 = objc_claimAutoreleasedReturnValue();
    -[NSObject indexPathForGlobalIndex:](v11, "indexPathForGlobalIndex:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v15;
    if (v15)
    {
      if (objc_msgSend(v15, "length") != 2)
      {
        objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v43, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MPCModelQueueFeeder.m"), 982, CFSTR("IndexPath was not an item index path with globalIndex from registry: %ld indexPath=%@"), v14, v16);

      }
      -[NSObject itemAtIndexPath:](v11, "itemAtIndexPath:", v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDDC890], "genericObjectWithModelObject:", v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v18, "type") == 10)
      {
        v19 = [MPCModelMediaClipAVItem alloc];
        objc_msgSend(v18, "mediaClip");
        v20 = (MPCModelMediaClipAVItem *)objc_claimAutoreleasedReturnValue();
        v13 = -[MPCModelMediaClipAVItem initWithMediaClip:](v19, "initWithMediaClip:", v20);
      }
      else
      {
        v44 = v8;
        v24 = [MPCModelGenericAVItem alloc];
        -[MPCModelPlaybackResponse request](self->_response, "request");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "itemProperties");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = -[MPCModelGenericAVItem initWithGenericObject:itemProperties:playbackRequestEnvironment:identityPropertySet:](v24, "initWithGenericObject:itemProperties:playbackRequestEnvironment:identityPropertySet:", v18, v26, self->_playbackRequestEnvironment, self->_identityPropertySet);

        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_isSiriInitiated);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        -[MPCModelGenericAVItem setSiriInitiated:](v27, "setSiriInitiated:", v28);

        -[MPCModelPlaybackContext queueDescriptor](self->_playbackContext, "queueDescriptor");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        -[MPCModelGenericAVItem setPrioritizeStartupOverQuality:](v27, "setPrioritizeStartupOverQuality:", objc_msgSend(v29, "prioritizeStartupOverQuality"));

        -[MPCPlaybackRequestEnvironment userIdentity](self->_playbackRequestEnvironment, "userIdentity");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        +[MPCMediaLibraryPlaybackAssetCacheProvider deviceLibraryProviderWithUserIdentity:](MPCMediaLibraryPlaybackAssetCacheProvider, "deviceLibraryProviderWithUserIdentity:", v30);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        -[MPCModelGenericAVItem setAssetCacheProvider:](v27, "setAssetCacheProvider:", v31);

        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          -[MPCModelPlaybackRequest mediaLibrary](self->_request, "mediaLibrary");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          -[MPCModelGenericAVItem setMediaLibrary:](v27, "setMediaLibrary:", v32);

        }
        if (-[MPCModelPlaybackResponse conformsToProtocol:](self->_response, "conformsToProtocol:", &unk_254AAC600))
        {
          objc_msgSend(v17, "identifiers");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          -[MPCModelQueueFeeder _equivalencySourceAdamIDForIdentifierSet:](self, "_equivalencySourceAdamIDForIdentifierSet:", v33);
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          v35 = v34;
          if (v34)
            -[MPCModelGenericAVItem setEquivalencySourceAdamID:](v27, "setEquivalencySourceAdamID:", objc_msgSend(v34, "longLongValue"));

        }
        accessQueue = self->_accessQueue;
        block[0] = MEMORY[0x24BDAC760];
        block[1] = 3221225472;
        block[2] = __45__MPCModelQueueFeeder_itemForItem_inSection___block_invoke_217;
        block[3] = &unk_24CABA1D0;
        block[4] = self;
        v37 = v27;
        v46 = v37;
        dispatch_barrier_sync(accessQueue, block);
        v38 = v46;
        v20 = v37;

        v13 = v20;
        v8 = v44;
      }

      if (v13)
      {
        -[MPCModelMediaClipAVItem setFeeder:](v13, "setFeeder:", self);
        -[MPCModelMediaClipAVItem setQueueIdentifier:](v13, "setQueueIdentifier:", v9);
        -[MPCModelQueueFeeder modelPlayEventForItem:inSection:](self, "modelPlayEventForItem:inSection:", v9, v8);
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        -[MPCModelMediaClipAVItem setModelPlayEvent:](v13, "setModelPlayEvent:", v39);

        -[MPCModelQueueFeeder playbackInfoForItem:](self, "playbackInfoForItem:", v13);
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        -[MPCModelMediaClipAVItem setPlaybackInfo:](v13, "setPlaybackInfo:", v40);

        -[MPCModelPlaybackContext associatedParticipantIdentifier](self->_playbackContext, "associatedParticipantIdentifier");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        -[MPCModelMediaClipAVItem setAssociatedParticipantIdentifier:](v13, "setAssociatedParticipantIdentifier:", v41);

      }
    }
    else
    {
      v21 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        -[MPCModelQueueFeeder uniqueIdentifier](self, "uniqueIdentifier");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = -[NSObject totalItemCount](v11, "totalItemCount");
        *(_DWORD *)buf = 138544642;
        v50 = v22;
        v51 = 2048;
        v52 = self;
        v53 = 2048;
        v54 = v14;
        v55 = 2114;
        v56 = v9;
        v57 = 2048;
        v58 = v11;
        v59 = 2048;
        v60 = v23;
        _os_log_impl(&dword_210BD8000, v21, OS_LOG_TYPE_ERROR, "[MQF:%{public}@:%p] itemForItem:inSection: | returning nil [indexPathForGlobalIndex:%ld returned nil] item=%{public}@ results=%p results.totalItemCount=%ld", buf, 0x3Eu);

      }
      v13 = 0;
    }

  }
  return v13;
}

- (id)playbackInfoForItem:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  NSDictionary *startTimeModifications;
  uint64_t v9;
  id v10;
  void *v11;
  NSObject *v12;
  void *v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  NSDictionary *endTimeModifications;
  id v16;
  void *v17;
  NSObject *v18;
  void *v19;
  uint64_t v20;
  id v22;
  id v23;
  _QWORD v24[4];
  id v25;
  _BYTE *v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t (*v32)(uint64_t, uint64_t);
  void (*v33)(uint64_t);
  id v34;
  _QWORD v35[4];
  id v36;
  uint64_t *v37;
  uint64_t *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t *v41;
  uint64_t v42;
  uint64_t (*v43)(uint64_t, uint64_t);
  void (*v44)(uint64_t);
  id v45;
  uint64_t v46;
  id *v47;
  uint64_t v48;
  uint64_t (*v49)(uint64_t, uint64_t);
  void (*v50)(uint64_t);
  id v51;
  uint8_t v52[4];
  void *v53;
  __int16 v54;
  MPCModelQueueFeeder *v55;
  __int16 v56;
  uint64_t v57;
  __int16 v58;
  id v59;
  _BYTE buf[24];
  uint64_t (*v61)(uint64_t, uint64_t);
  __int128 v62;
  uint64_t v63;

  v63 = *MEMORY[0x24BDAC8D0];
  v23 = a3;
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v22 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "modelGenericObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "identifiers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[MPCModelQueueFeeder _equivalencySourceAdamIDForIdentifierSet:](self, "_equivalencySourceAdamIDForIdentifierSet:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "longLongValue");

  v46 = 0;
  v47 = (id *)&v46;
  v48 = 0x3032000000;
  v49 = __Block_byref_object_copy__12799;
  v50 = __Block_byref_object_dispose__12800;
  v51 = 0;
  v40 = 0;
  v41 = &v40;
  v42 = 0x3032000000;
  v43 = __Block_byref_object_copy__12799;
  v44 = __Block_byref_object_dispose__12800;
  v45 = 0;
  startTimeModifications = self->_startTimeModifications;
  v9 = MEMORY[0x24BDAC760];
  v35[0] = MEMORY[0x24BDAC760];
  v35[1] = 3221225472;
  v35[2] = __43__MPCModelQueueFeeder_playbackInfoForItem___block_invoke;
  v35[3] = &unk_24CAB4FE0;
  v10 = v5;
  v36 = v10;
  v37 = &v46;
  v38 = &v40;
  v39 = v7;
  -[NSDictionary enumerateKeysAndObjectsUsingBlock:](startTimeModifications, "enumerateKeysAndObjectsUsingBlock:", v35);
  if (v47[5])
  {
    v11 = (void *)v41[5];
    if (!v11 || (objc_storeStrong(v47 + 5, v11), v47[5]))
    {
      v12 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        -[MPCModelQueueFeeder uniqueIdentifier](self, "uniqueIdentifier");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = (uint64_t (*)(uint64_t, uint64_t))v47[5];
        *(_DWORD *)buf = 138544130;
        *(_QWORD *)&buf[4] = v13;
        *(_WORD *)&buf[12] = 2048;
        *(_QWORD *)&buf[14] = self;
        *(_WORD *)&buf[22] = 2114;
        v61 = v14;
        LOWORD(v62) = 2114;
        *(_QWORD *)((char *)&v62 + 2) = v23;
        _os_log_impl(&dword_210BD8000, v12, OS_LOG_TYPE_DEFAULT, "[MQF:%{public}@:%p] playbackInfoForItem | setting override start time [] startTime=%{public}@ item=%{public}@", buf, 0x2Au);

      }
      objc_msgSend(v22, "setObject:forKey:", v47[5], *MEMORY[0x24BDDB9D8]);
    }
  }
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x3032000000;
  v61 = __Block_byref_object_copy__12799;
  *(_QWORD *)&v62 = __Block_byref_object_dispose__12800;
  *((_QWORD *)&v62 + 1) = 0;
  v29 = 0;
  v30 = &v29;
  v31 = 0x3032000000;
  v32 = __Block_byref_object_copy__12799;
  v33 = __Block_byref_object_dispose__12800;
  v34 = 0;
  endTimeModifications = self->_endTimeModifications;
  v24[0] = v9;
  v24[1] = 3221225472;
  v24[2] = __43__MPCModelQueueFeeder_playbackInfoForItem___block_invoke_9;
  v24[3] = &unk_24CAB4FE0;
  v16 = v10;
  v25 = v16;
  v26 = buf;
  v27 = &v29;
  v28 = v7;
  -[NSDictionary enumerateKeysAndObjectsUsingBlock:](endTimeModifications, "enumerateKeysAndObjectsUsingBlock:", v24);
  if (*(_QWORD *)(*(_QWORD *)&buf[8] + 40))
  {
    v17 = (void *)v30[5];
    if (!v17 || (objc_storeStrong((id *)(*(_QWORD *)&buf[8] + 40), v17), *(_QWORD *)(*(_QWORD *)&buf[8] + 40)))
    {
      v18 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        -[MPCModelQueueFeeder uniqueIdentifier](self, "uniqueIdentifier");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = *(_QWORD *)(*(_QWORD *)&buf[8] + 40);
        *(_DWORD *)v52 = 138544130;
        v53 = v19;
        v54 = 2048;
        v55 = self;
        v56 = 2114;
        v57 = v20;
        v58 = 2114;
        v59 = v23;
        _os_log_impl(&dword_210BD8000, v18, OS_LOG_TYPE_DEFAULT, "[MQF:%{public}@:%p] playbackInfoForItem | setting override stop time [] stopTime=%{public}@ item=%{public}@", v52, 0x2Au);

      }
      objc_msgSend(v22, "setObject:forKey:", *(_QWORD *)(*(_QWORD *)&buf[8] + 40), *MEMORY[0x24BDDB9C0]);
    }
  }

  _Block_object_dispose(&v29, 8);
  _Block_object_dispose(buf, 8);

  _Block_object_dispose(&v40, 8);
  _Block_object_dispose(&v46, 8);

  return v22;
}

- (id)modelPlayEventForItem:(id)a3 inSection:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v17[4];
  id v18;

  v5 = a3;
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __55__MPCModelQueueFeeder_modelPlayEventForItem_inSection___block_invoke;
  v17[3] = &unk_24CABA0B0;
  v6 = v5;
  v18 = v6;
  v7 = -[MPCModelQueueFeeder identifierRegistryWithExclusiveAccessReturningInteger:](self, "identifierRegistryWithExclusiveAccessReturningInteger:", v17);
  -[MPCModelPlaybackResponse results](self->_response, "results");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "indexPathForGlobalIndex:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    -[MPCModelPlaybackResponse results](self->_response, "results");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "sectionAtIndex:", objc_msgSend(v9, "section"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v11 = 0;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v11, "anyObject");
    v12 = objc_claimAutoreleasedReturnValue();

    v11 = (void *)v12;
  }
  if (!v11)
  {
    -[MPModelGenericObject anyObject](self->_fallbackSectionRepresentation, "anyObject");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v13 = (void *)MEMORY[0x24BDDC938];
  -[MPCModelQueueFeeder playActivityFeatureName](self, "playActivityFeatureName");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "playEventWithModelObject:featureName:", v11, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (id)_equivalencySourceAdamIDForIdentifierSet:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;

  v4 = a3;
  if (-[MPCModelPlaybackResponse conformsToProtocol:](self->_response, "conformsToProtocol:", &unk_254AAC600))
  {
    objc_msgSend(v4, "universalStore");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "adamID");

    -[MPCModelPlaybackResponse equivalencySourceStoreAdamIDForLocalStoreAdamID:](self->_response, "equivalencySourceStoreAdamIDForLocalStoreAdamID:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v7)
    {
      objc_msgSend(v4, "universalStore");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "subscriptionAdamID");

      -[MPCModelPlaybackResponse equivalencySourceStoreAdamIDForLocalStoreAdamID:](self->_response, "equivalencySourceStoreAdamIDForLocalStoreAdamID:", v9);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

uint64_t __48__MPCModelQueueFeeder_reloadSection_completion___block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v5;
  void *v6;
  uint64_t v7;

  objc_msgSend(*(id *)(a1 + 32), "objectAtIndexedSubscript:", a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "itemAtIndex:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "isEqual:", v6);

  return v7;
}

uint64_t __60__MPCModelQueueFeeder_controller_defersResponseReplacement___block_invoke_6(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  int v10;

  objc_msgSend(*(id *)(a1 + 32), "identifierSetAtIndex:", a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *(void **)(a1 + 40);
  objc_msgSend(v6, "indexPathForGlobalIndex:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "itemAtIndexPath:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v6) = objc_msgSend(v5, "shouldExcludeFromShuffle");
  if ((_DWORD)v6 == objc_msgSend(v8, "shouldExcludeFromShuffle"))
  {
    v10 = objc_msgSend(v5, "isPlaceholder");
    v9 = v10 ^ objc_msgSend(v8, "isPlaceholder");
  }
  else
  {
    v9 = 1;
  }

  return v9;
}

uint64_t __60__MPCModelQueueFeeder_controller_defersResponseReplacement___block_invoke_5(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;

  objc_msgSend(*(id *)(a1 + 32), "identifierSetAtIndex:", a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *(void **)(a1 + 40);
  objc_msgSend(v6, "indexPathForGlobalIndex:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "itemAtIndexPath:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = objc_msgSend(v5, "intersectsSet:", v8);
  return v9;
}

id __61__MPCModelQueueFeeder_shouldUsePlaceholderForItem_inSection___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;

  v3 = a2;
  v4 = objc_msgSend(v3, "indexForItem:", *(_QWORD *)(a1 + 32));
  if (v4 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v5 = 0;
  }
  else
  {
    objc_msgSend(v3, "identifierSetAtIndex:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v5;
}

- (MPCModelQueueFeeder)init
{
  MPCModelQueueFeeder *v2;
  dispatch_queue_t v3;
  OS_dispatch_queue *accessQueue;
  NSObject *v5;
  dispatch_queue_t v6;
  OS_dispatch_queue *diffQueue;
  NSLock *v8;
  NSLock *diffLock;
  uint64_t v10;
  MPCPlaybackRequestEnvironment *playbackRequestEnvironment;
  MPRequestResponseController *v12;
  MPRequestResponseController *requestController;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)MPCModelQueueFeeder;
  v2 = -[MPCModelQueueFeeder init](&v15, sel_init);
  if (v2)
  {
    v3 = dispatch_queue_create("com.apple.MediaPlaybackCore.MPCModelQueueFeeder.accessQueue", 0);
    accessQueue = v2->_accessQueue;
    v2->_accessQueue = (OS_dispatch_queue *)v3;

    dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = dispatch_queue_create("com.apple.MediaPlaybackCore.MPCModelQueueFeeder.diffQueue", v5);
    diffQueue = v2->_diffQueue;
    v2->_diffQueue = (OS_dispatch_queue *)v6;

    v8 = (NSLock *)objc_alloc_init(MEMORY[0x24BDD1648]);
    diffLock = v2->_diffLock;
    v2->_diffLock = v8;

    if (!v2->_playbackRequestEnvironment)
    {
      +[MPCPlaybackRequestEnvironment activeAccountRequestEnvironment](MPCPlaybackRequestEnvironment, "activeAccountRequestEnvironment");
      v10 = objc_claimAutoreleasedReturnValue();
      playbackRequestEnvironment = v2->_playbackRequestEnvironment;
      v2->_playbackRequestEnvironment = (MPCPlaybackRequestEnvironment *)v10;

    }
    v12 = (MPRequestResponseController *)objc_alloc_init(MEMORY[0x24BDDCB90]);
    requestController = v2->_requestController;
    v2->_requestController = v12;

    -[MPRequestResponseController setDelegate:](v2->_requestController, "setDelegate:", v2);
  }
  return v2;
}

uint64_t __60__MPCModelQueueFeeder_controller_defersResponseReplacement___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "appendItem:");
}

uint64_t __48__MPCModelQueueFeeder_reloadSection_completion___block_invoke_4()
{
  return 0;
}

- (BOOL)containsTransportableContentWithReason:(id *)a3
{
  return 1;
}

- (BOOL)section:(id)a3 supportsShuffleType:(int64_t)a4
{
  return a4 != 2;
}

- (BOOL)containsLiveStream
{
  return 0;
}

void __60__MPCModelQueueFeeder_controller_defersResponseReplacement___block_invoke_2(uint64_t a1, uint64_t a2)
{
  void *v4;
  _QWORD v5[4];
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "appendSection:");
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __60__MPCModelQueueFeeder_controller_defersResponseReplacement___block_invoke_3;
  v5[3] = &unk_24CAB5078;
  v4 = *(void **)(a1 + 40);
  v6 = *(id *)(a1 + 32);
  objc_msgSend(v4, "enumerateItemIdentifiersInSectionAtIndex:usingBlock:", a2, v5);

}

void __60__MPCModelQueueFeeder_controller_defersResponseReplacement___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  BOOL v11;
  NSObject *v12;
  BOOL v13;
  void *v14;
  _QWORD block[5];
  __int128 v16;
  uint64_t v17;
  BOOL v18;
  BOOL v19;
  uint8_t buf[4];
  void *v21;
  __int16 v22;
  uint64_t v23;
  __int16 v24;
  uint64_t v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 128), "setShouldBatchResultsWithPlaceholderObjects:", 0);
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 232));
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 120), "response");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "modelResponse");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

  if ((objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "conformsToProtocol:", &unk_254AAC660) & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 32), CFSTR("MPCModelQueueFeeder.m"), 395, CFSTR("Response class (%@) must conform to MPCModelPlaybackResponse"), objc_opt_class());

  }
  v6 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 32), "uniqueIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = *(_QWORD *)(a1 + 32);
    v9 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
    *(_DWORD *)buf = 138543874;
    v21 = v7;
    v22 = 2048;
    v23 = v8;
    v24 = 2048;
    v25 = v9;
    _os_log_impl(&dword_210BD8000, v6, OS_LOG_TYPE_DEFAULT, "[MQF:%{public}@:%p] controller:defersResponseReplacement: | processing new response [] newResponse=%p", buf, 0x20u);

  }
  v10 = *(_QWORD *)(a1 + 32);
  v11 = *(_QWORD *)(v10 + 176) == 0;
  v12 = *(NSObject **)(v10 + 80);
  v13 = *(_QWORD *)(v10 + 176) != 0;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __60__MPCModelQueueFeeder_controller_defersResponseReplacement___block_invoke_81;
  block[3] = &unk_24CAB5190;
  v16 = *(_OWORD *)(a1 + 48);
  block[4] = v10;
  v18 = v11;
  v19 = v13;
  v17 = *(_QWORD *)(a1 + 64);
  dispatch_async(v12, block);
}

- (void)loadPlaybackContext:(id)a3 completion:(id)a4
{
  id v7;
  id v8;
  void *v9;
  MPModelGenericObject *v10;
  MPModelGenericObject *fallbackSectionRepresentation;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  MPIdentifierSet *v19;
  MPIdentifierSet *startItemIdentifiers;
  NSDictionary *v21;
  NSDictionary *startTimeModifications;
  NSDictionary *v23;
  NSDictionary *endTimeModifications;
  void *v25;
  void *v26;
  void *v27;
  NSObject *v28;
  void *v29;
  void *v30;
  MPCModelPlaybackRequest *v31;
  MPCModelPlaybackRequest *request;
  MPCModelPlaybackRequest *v33;
  void *v34;
  char isKindOfClass;
  void *v36;
  MPCModelPlaybackRequest *v37;
  NSObject *v38;
  void *v39;
  void *v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  const __CFString *v44;
  uint64_t v45;
  void *v46;
  const __CFString *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  uint64_t v52;
  void *v53;
  uint64_t v54;
  void *v55;
  void *v56;
  void *v57;
  uint64_t v58;
  void *v59;
  void *v60;
  void *v61;
  uint64_t v62;
  void *v63;
  void *v64;
  void *v65;
  uint64_t v66;
  MPCModelPlaybackRequest *v67;
  NSString *v68;
  NSString *rtcReportingPlayQueueSourceIdentifier;
  MPCPlaybackRequestEnvironment *v70;
  MPCPlaybackRequestEnvironment *playbackRequestEnvironment;
  MPCModelPlaybackRequest *v72;
  MPCPlaybackRequestEnvironment *v73;
  MPCPlaybackRequestEnvironment *v74;
  id v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  char v80;
  NSObject *v81;
  void *v82;
  void *v83;
  MPCPlaybackRequestEnvironment *v84;
  void *v85;
  int v86;
  MPCModelPlaybackRequest *v87;
  MPCModelPlaybackRequest *v88;
  uint64_t v89;
  void *v90;
  const __CFString *v91;
  void *v92;
  id v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  MPCModelPlaybackRequest *v98;
  void *v99;
  void *v100;
  id loadingCompletionHandler;
  void *v102;
  MPCModelGenericAVItemUserIdentityPropertySet *v103;
  id v104;
  MPCModelGenericAVItemUserIdentityPropertySet *identityPropertySet;
  NSObject *v106;
  void *v107;
  void *v108;
  void *v109;
  id v110;
  id v111;
  id v112;
  void *v113;
  void *v114;
  id v115;
  id v116;
  void *v117;
  uint64_t v118;
  void *v119;
  void *v120;
  void *v121;
  void *v122;
  void *v123;
  void *v124;
  void *v125;
  MPCModelPlaybackRequest *v126;
  id v128;
  id v129;
  void *v130;
  void *v131;
  _QWORD v132[4];
  id v133;
  MPCModelQueueFeeder *v134;
  id v135;
  _QWORD aBlock[5];
  id v137;
  id v138;
  id v139;
  uint8_t buf[4];
  void *v141;
  __int16 v142;
  MPCModelQueueFeeder *v143;
  __int16 v144;
  id v145;
  __int16 v146;
  MPCPlaybackRequestEnvironment *v147;
  _QWORD v148[2];
  _QWORD v149[2];
  _QWORD v150[4];

  v150[1] = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  objc_storeStrong((id *)&self->_playbackContext, a3);
  objc_msgSend(v7, "fallbackSectionRepresentation");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (MPModelGenericObject *)objc_msgSend(v9, "copy");
  fallbackSectionRepresentation = self->_fallbackSectionRepresentation;
  self->_fallbackSectionRepresentation = v10;

  v12 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    -[MPCModelQueueFeeder uniqueIdentifier](self, "uniqueIdentifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v141 = v13;
    v142 = 2048;
    v143 = self;
    v144 = 2114;
    v145 = v7;
    _os_log_impl(&dword_210BD8000, v12, OS_LOG_TYPE_DEFAULT, "[MQF:%{public}@:%p] loadPlaybackContext: | [] playbackContext=%{public}@", buf, 0x20u);

  }
  objc_msgSend(v7, "playActivityRecommendationData");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPCModelQueueFeeder setPlayActivityRecommendationData:](self, "setPlayActivityRecommendationData:", v14);

  objc_msgSend(v7, "playActivityQueueGroupingID");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPCModelQueueFeeder setPlayActivityQueueGroupingID:](self, "setPlayActivityQueueGroupingID:", v15);

  objc_msgSend(v7, "playActivityFeatureName");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPCModelQueueFeeder setPlayActivityFeatureName:](self, "setPlayActivityFeatureName:", v16);

  objc_msgSend(v7, "siriReferenceIdentifier");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPCModelQueueFeeder setSiriReferenceIdentifier:](self, "setSiriReferenceIdentifier:", v17);

  objc_msgSend(v7, "siriWHAMetricsInfo");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPCModelQueueFeeder setSiriWHAMetricsInfo:](self, "setSiriWHAMetricsInfo:", v18);

  objc_msgSend(v7, "startItemIdentifiers");
  v19 = (MPIdentifierSet *)objc_claimAutoreleasedReturnValue();
  startItemIdentifiers = self->_startItemIdentifiers;
  self->_startItemIdentifiers = v19;

  objc_msgSend(v7, "startTimeModifications");
  v21 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
  startTimeModifications = self->_startTimeModifications;
  self->_startTimeModifications = v21;

  objc_msgSend(v7, "endTimeModifications");
  v23 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
  endTimeModifications = self->_endTimeModifications;
  self->_endTimeModifications = v23;

  objc_msgSend(v7, "siriReferenceIdentifier");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  self->_isSiriInitiated = v25 != 0;

  objc_msgSend(v7, "siriAssetInfo");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = (void *)objc_msgSend(v26, "copy");

  if (objc_msgSend(v27, "length"))
  {
    v28 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback_Oversize");
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      -[MPCModelQueueFeeder uniqueIdentifier](self, "uniqueIdentifier");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v141 = v29;
      v142 = 2048;
      v143 = self;
      v144 = 2114;
      v145 = v27;
      _os_log_impl(&dword_210BD8000, v28, OS_LOG_TYPE_DEFAULT, "[MQF:%{public}@:%p] loadPlaybackContext: | processing siriAssetInfo [] siriAssetInfo=%{public}@", buf, 0x20u);

    }
  }
  objc_msgSend(v7, "request");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = (MPCModelPlaybackRequest *)objc_msgSend(v30, "copy");
  request = self->_request;
  self->_request = v31;

  if ((-[MPCModelPlaybackRequest conformsToProtocol:](self->_request, "conformsToProtocol:", &unk_254AABA00) & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v123 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v123, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MPCModelQueueFeeder.m"), 770, CFSTR("Request class (%@) must conform to MPCModelPlaybackRequest"), objc_opt_class());

  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v33 = self->_request;
    -[MPCModelPlaybackRequest sectionKind](v33, "sectionKind");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) != 0)
    {
      -[MPCModelPlaybackRequest sectionKind](v33, "sectionKind");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v36, "variants") & 8) != 0)
      {
        objc_msgSend(MEMORY[0x24BDD1540], "msv_errorWithDomain:code:debugDescription:", CFSTR("MPCError"), 1, CFSTR("Invalid request section kind [playlist variant Folder] kind=%@ request=%@"), v36, self->_request);
        v122 = (void *)objc_claimAutoreleasedReturnValue();
        (*((void (**)(id, _QWORD, _QWORD, void *))v8 + 2))(v8, 0, 0, v122);

        goto LABEL_72;
      }

    }
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v37 = self->_request;
    -[MPCModelPlaybackRequest setUseUniversalAccumulator:](v37, "setUseUniversalAccumulator:", 1);
    if (_os_feature_enabled_impl())
      -[MPCModelPlaybackRequest setAllowLocalEquivalencies:](v37, "setAllowLocalEquivalencies:", 1);
    if (self->_isSiriInitiated && !objc_msgSend(v27, "length"))
    {
      v128 = v8;
      v130 = v27;
      v38 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
      if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
      {
        -[MPCModelQueueFeeder uniqueIdentifier](self, "uniqueIdentifier");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v141 = v39;
        v142 = 2048;
        v143 = self;
        _os_log_impl(&dword_210BD8000, v38, OS_LOG_TYPE_ERROR, "[MQF:%{public}@:%p] loadPlaybackContext: | generating ABC [missing siriAssetInfo for siri initiated storePlayback]", buf, 0x16u);

      }
      v40 = (void *)MEMORY[0x24BE65C38];
      v41 = *MEMORY[0x24BE65AB0];
      v148[0] = CFSTR("siriReferenceIdentifier");
      objc_msgSend(v7, "siriReferenceIdentifier");
      v42 = objc_claimAutoreleasedReturnValue();
      v43 = (void *)v42;
      if (v42)
        v44 = (const __CFString *)v42;
      else
        v44 = CFSTR("<missing>");
      v148[1] = CFSTR("storeItemsRequest.identifiers");
      v149[0] = v44;
      -[MPCModelPlaybackRequest identifiers](v37, "identifiers");
      v45 = objc_claimAutoreleasedReturnValue();
      v46 = (void *)v45;
      v47 = CFSTR("nil");
      if (v45)
        v47 = (const __CFString *)v45;
      v149[1] = v47;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v149, v148, 2);
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      v150[0] = v48;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v150, 1);
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "snapshotWithDomain:type:subType:context:triggerThresholdValues:events:completion:", v41, CFSTR("Bug"), CFSTR("MissingSiriAssetInfo"), CFSTR("SetPlaybackQueue"), &stru_24CABB5D0, v49, 0);

      v8 = v128;
      v27 = v130;
    }

  }
  -[MPCModelPlaybackRequest itemKind](self->_request, "itemKind");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  v51 = (void *)objc_msgSend(v50, "modelClass");

  objc_msgSend(v51, "mqf_requiredItemPlaybackProperties");
  v52 = objc_claimAutoreleasedReturnValue();
  if (v52)
  {
    v53 = (void *)v52;
    v131 = v27;
    if (self->_representativeMetadataPropertySet)
    {
      v54 = objc_msgSend(v51, "genericObjectType");
      if (v54)
      {
        objc_msgSend(MEMORY[0x24BDDC890], "relationshipKeyForGenericObjectType:", v54);
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        if (v55)
        {
          -[MPPropertySet relationships](self->_representativeMetadataPropertySet, "relationships");
          v56 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v56, "objectForKeyedSubscript:", v55);
          v57 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v53, "propertySetByCombiningWithPropertySet:", v57);
          v58 = objc_claimAutoreleasedReturnValue();

          v53 = (void *)v58;
        }

      }
    }
    -[MPCModelPlaybackRequest setItemProperties:](self->_request, "setItemProperties:", v53);
    -[MPCModelPlaybackRequest sectionKind](self->_request, "sectionKind");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    v60 = (void *)objc_msgSend(v59, "modelClass");

    objc_msgSend(v60, "mqf_requiredSectionPlaybackProperties");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    if (self->_representativeMetadataPropertySet)
    {
      v62 = objc_msgSend(v60, "genericObjectType");
      if (v62)
      {
        objc_msgSend(MEMORY[0x24BDDC890], "relationshipKeyForGenericObjectType:", v62);
        v63 = (void *)objc_claimAutoreleasedReturnValue();
        if (v63)
        {
          -[MPPropertySet relationships](self->_representativeMetadataPropertySet, "relationships");
          v64 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v64, "objectForKeyedSubscript:", v63);
          v65 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v61, "propertySetByCombiningWithPropertySet:", v65);
          v66 = objc_claimAutoreleasedReturnValue();

          v61 = (void *)v66;
        }

      }
    }
    -[MPCModelPlaybackRequest setSectionProperties:](self->_request, "setSectionProperties:", v61);
    if ((objc_opt_respondsToSelector() & 1) != 0)
      -[MPCModelPlaybackRequest setDisableImplicitSectioning:](self->_request, "setDisableImplicitSectioning:", 1);
    if ((objc_opt_respondsToSelector() & 1) != 0)
      -[MPCModelPlaybackRequest setShouldBatchResultsWithPlaceholderObjects:](self->_request, "setShouldBatchResultsWithPlaceholderObjects:", 1);
    if (-[MPCModelPlaybackRequest conformsToProtocol:](self->_request, "conformsToProtocol:", &unk_254AABA60))
    {
      v67 = self->_request;
      -[MPCModelPlaybackRequest rtcReportingPlayQueueSourceIdentifier](v67, "rtcReportingPlayQueueSourceIdentifier");
      v68 = (NSString *)objc_claimAutoreleasedReturnValue();
      rtcReportingPlayQueueSourceIdentifier = self->_rtcReportingPlayQueueSourceIdentifier;
      self->_rtcReportingPlayQueueSourceIdentifier = v68;

    }
    v125 = v61;
    objc_msgSend(v7, "playbackRequestEnvironment");
    v70 = (MPCPlaybackRequestEnvironment *)objc_claimAutoreleasedReturnValue();
    playbackRequestEnvironment = self->_playbackRequestEnvironment;
    self->_playbackRequestEnvironment = v70;

    v126 = (MPCModelPlaybackRequest *)v53;
    if (-[MPCModelPlaybackRequest conformsToProtocol:](self->_request, "conformsToProtocol:", &unk_254A9D5E8))
    {
      v72 = self->_request;
      -[MPCModelPlaybackRequest playbackRequestEnvironment](v72, "playbackRequestEnvironment");
      v73 = (MPCPlaybackRequestEnvironment *)objc_claimAutoreleasedReturnValue();
      v74 = self->_playbackRequestEnvironment;

      if (v73 != v74)
      {
        v75 = v8;
        -[MPCModelPlaybackRequest playbackRequestEnvironment](v72, "playbackRequestEnvironment");
        v76 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v76, "userIdentity");
        v77 = (void *)objc_claimAutoreleasedReturnValue();
        -[MPCPlaybackRequestEnvironment userIdentity](self->_playbackRequestEnvironment, "userIdentity");
        v78 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BEC8A60], "defaultIdentityStore");
        v79 = (void *)objc_claimAutoreleasedReturnValue();
        v80 = objc_msgSend(v77, "isEqualToIdentity:inStore:", v78, v79);

        if ((v80 & 1) == 0)
        {
          v81 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
          if (os_log_type_enabled(v81, OS_LOG_TYPE_FAULT))
          {
            -[MPCModelQueueFeeder uniqueIdentifier](self, "uniqueIdentifier");
            v82 = (void *)objc_claimAutoreleasedReturnValue();
            -[MPCModelPlaybackRequest playbackRequestEnvironment](v72, "playbackRequestEnvironment");
            v83 = (void *)objc_claimAutoreleasedReturnValue();
            v84 = self->_playbackRequestEnvironment;
            *(_DWORD *)buf = 138544130;
            v141 = v82;
            v142 = 2048;
            v143 = self;
            v144 = 2114;
            v145 = v83;
            v146 = 2114;
            v147 = v84;
            _os_log_impl(&dword_210BD8000, v81, OS_LOG_TYPE_FAULT, "[MQF:%{public}@:%p] loadPlaybackContext: | recovering user identity mismatch [self correcting] request.playbackRequestEnvironment=%{public}@ context.playbackRequestEnvironment=%{public}@", buf, 0x2Au);

          }
        }
        -[MPCModelPlaybackRequest setPlaybackRequestEnvironment:](v72, "setPlaybackRequestEnvironment:", self->_playbackRequestEnvironment);
        v8 = v75;
      }

    }
    if (MSVDeviceOSIsInternalInstall())
    {
      objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
      v85 = (void *)objc_claimAutoreleasedReturnValue();
      v86 = objc_msgSend(v85, "BOOLForKey:", CFSTR("_static_qf_debug"));

      if (v86)
      {
        -[MPCModelQueueFeeder _staticRegistryRequest](self, "_staticRegistryRequest");
        v87 = (MPCModelPlaybackRequest *)objc_claimAutoreleasedReturnValue();
        v88 = self->_request;
        self->_request = v87;

      }
    }
    -[MPCModelPlaybackRequest label](self->_request, "label");
    v89 = objc_claimAutoreleasedReturnValue();
    v90 = (void *)v89;
    if (v89)
      v91 = (const __CFString *)v89;
    else
      v91 = CFSTR("<missing request label>");
    objc_msgSend(CFSTR("com.apple.MediaPlayer.MPCModelQueueFeeder: "), "stringByAppendingString:", v91);
    v92 = (void *)objc_claimAutoreleasedReturnValue();
    -[MPCModelPlaybackRequest setLabel:](self->_request, "setLabel:", v92);

    v93 = objc_alloc_init(MEMORY[0x24BDDC9B8]);
    -[MPRequestResponseController setRequest:](self->_requestController, "setRequest:", v93);

    -[MPRequestResponseController request](self->_requestController, "request");
    v94 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v94, "setTimeoutInterval:", 0.0);

    -[MPRequestResponseController request](self->_requestController, "request");
    v95 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v95, "setQualityOfService:", 25);

    -[MPCModelPlaybackRequest label](self->_request, "label");
    v96 = (void *)objc_claimAutoreleasedReturnValue();
    -[MPRequestResponseController request](self->_requestController, "request");
    v97 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v97, "setLabel:", v96);

    v98 = self->_request;
    -[MPRequestResponseController request](self->_requestController, "request");
    v99 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v99, "setModelRequest:", v98);

    v129 = v8;
    v100 = (void *)objc_msgSend(v8, "copy");
    loadingCompletionHandler = self->_loadingCompletionHandler;
    self->_loadingCompletionHandler = v100;

    -[MPCPlaybackRequestEnvironment _createStoreRequestContext](self->_playbackRequestEnvironment, "_createStoreRequestContext");
    v102 = (void *)objc_claimAutoreleasedReturnValue();
    v139 = 0;
    v103 = -[MPCModelGenericAVItemUserIdentityPropertySet initWithRequestContext:error:]([MPCModelGenericAVItemUserIdentityPropertySet alloc], "initWithRequestContext:error:", v102, &v139);
    v104 = v139;
    identityPropertySet = self->_identityPropertySet;
    self->_identityPropertySet = v103;

    if (v104)
    {
      v106 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
      if (os_log_type_enabled(v106, OS_LOG_TYPE_ERROR))
      {
        -[MPCModelQueueFeeder uniqueIdentifier](self, "uniqueIdentifier");
        v107 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v104, "msv_description");
        v108 = v102;
        v109 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v141 = v107;
        v142 = 2048;
        v143 = self;
        v144 = 2114;
        v145 = v109;
        _os_log_impl(&dword_210BD8000, v106, OS_LOG_TYPE_ERROR, "[MQF:%{public}@:%p] loadPlaybackContext: | failed to load identity properties [] error=%{public}@", buf, 0x20u);

        v102 = v108;
      }

    }
    else if (self->_identityPropertySet)
    {
      goto LABEL_68;
    }
    (*((void (**)(void))self->_loadingCompletionHandler + 2))();
    v110 = self->_loadingCompletionHandler;
    self->_loadingCompletionHandler = 0;

LABEL_68:
    -[MPRequestResponseController setNeedsReload](self->_requestController, "setNeedsReload");
    aBlock[0] = MEMORY[0x24BDAC760];
    aBlock[1] = 3221225472;
    aBlock[2] = __54__MPCModelQueueFeeder_loadPlaybackContext_completion___block_invoke;
    aBlock[3] = &unk_24CABAA28;
    aBlock[4] = self;
    v111 = v7;
    v137 = v111;
    v112 = v131;
    v138 = v112;
    v113 = _Block_copy(aBlock);
    v114 = v113;
    if (v112)
    {
      v115 = v7;
      v116 = v104;
      v117 = v102;
      v118 = objc_opt_class();
      -[MPCModelQueueFeeder playActivityFeatureName](self, "playActivityFeatureName");
      v119 = (void *)objc_claimAutoreleasedReturnValue();
      -[MPCPlaybackRequestEnvironment userIdentity](self->_playbackRequestEnvironment, "userIdentity");
      v120 = (void *)objc_claimAutoreleasedReturnValue();
      v132[0] = MEMORY[0x24BDAC760];
      v132[1] = 3221225472;
      v132[2] = __54__MPCModelQueueFeeder_loadPlaybackContext_completion___block_invoke_203;
      v132[3] = &unk_24CAB5208;
      v133 = v111;
      v134 = self;
      v135 = v114;
      v121 = (void *)v118;
      v102 = v117;
      v104 = v116;
      v7 = v115;
      objc_msgSend(v121, "MPC_consumeSiriAssetInfo:playActivityFeatureName:userIdentity:completion:", v112, v119, v120, v132);

    }
    else
    {
      (*((void (**)(void *))v113 + 2))(v113);
    }
    v8 = v129;
    v33 = v126;

    v27 = v131;
    goto LABEL_72;
  }
  if (MSVDeviceOSIsInternalInstall())
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v124 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v124, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MPCModelQueueFeeder.m"), 802, CFSTR("Invalid request item class: %@ for %@"), v51, self->_request);

  }
  objc_msgSend(MEMORY[0x24BDD1540], "msv_errorWithDomain:code:debugDescription:", CFSTR("MPCError"), 1, CFSTR("Invalid request item class: %@ for %@"), v51, self->_request);
  v33 = (MPCModelPlaybackRequest *)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, _QWORD, _QWORD, MPCModelPlaybackRequest *))v8 + 2))(v8, 0, 0, v33);
LABEL_72:

}

- (id)uniqueIdentifier
{
  return (id)-[MPMutableIdentifierListSection sectionIdentifier](self->_section, "sectionIdentifier");
}

uint64_t __54__MPCModelQueueFeeder_loadPlaybackContext_completion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  os_signpost_id_t v3;
  NSObject *v4;
  NSObject *v5;
  id v6;
  __CFString *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint8_t *v12;
  uint64_t v13;
  void *v14;
  NSObject *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  const __CFString *v23;
  const __CFString *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t i;
  void *v30;
  BOOL v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  _QWORD v37[6];
  uint8_t buf[8];
  uint8_t *v39;
  uint64_t v40;
  uint64_t (*v41)(uint64_t, uint64_t);
  void (*v42)(uint64_t);
  id v43;
  _QWORD v44[3];
  _QWORD v45[3];
  void *v46;
  uint8_t v47[4];
  void *v48;
  __int16 v49;
  uint64_t v50;
  __int16 v51;
  uint64_t v52;
  __int16 v53;
  __CFString *v54;
  uint64_t v55;

  v55 = *MEMORY[0x24BDAC8D0];
  v2 = os_log_create("com.apple.amp.mediaplaybackcore", "Analytics");
  v3 = os_signpost_id_make_with_pointer(v2, *(const void **)(a1 + 32));

  v4 = os_log_create("com.apple.amp.mediaplaybackcore", "Analytics");
  v5 = v4;
  if (v3 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_210BD8000, v5, OS_SIGNPOST_INTERVAL_BEGIN, v3, "ModelShimRequest", ", buf, 2u);
  }

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v6 = *(id *)(*(_QWORD *)(a1 + 32) + 128);
    *(_QWORD *)buf = 0;
    v39 = buf;
    v40 = 0x3032000000;
    v41 = __Block_byref_object_copy__12799;
    v42 = __Block_byref_object_dispose__12800;
    v43 = 0;
    objc_msgSend(v6, "identifiers");
    v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v8 = -[__CFString totalItemCount](v7, "totalItemCount");
    objc_msgSend(v6, "sectionedModelObjects");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v9 && v8 >= 1 && !*(_QWORD *)(*(_QWORD *)(a1 + 32) + 160))
    {
      v31 = objc_msgSend(*(id *)(a1 + 40), "shuffleType") == 0;

      if (!v31)
      {
        -[__CFString indexPathForGlobalIndex:](v7, "indexPathForGlobalIndex:", arc4random_uniform(v8));
        v32 = objc_claimAutoreleasedReturnValue();
        v33 = (void *)*((_QWORD *)v39 + 5);
        *((_QWORD *)v39 + 5) = v32;

        -[__CFString identifiersForItemAtIndexPath:](v7, "identifiersForItemAtIndexPath:", *((_QWORD *)v39 + 5));
        v34 = objc_claimAutoreleasedReturnValue();
        v35 = *(_QWORD *)(a1 + 32);
        v36 = *(void **)(v35 + 160);
        *(_QWORD *)(v35 + 160) = v34;

      }
    }
    else
    {

    }
    v11 = *(_QWORD *)(a1 + 32);
    v12 = v39;
    if (*(_QWORD *)(v11 + 160) && !*((_QWORD *)v39 + 5))
    {
      v37[0] = MEMORY[0x24BDAC760];
      v37[1] = 3221225472;
      v37[2] = __54__MPCModelQueueFeeder_loadPlaybackContext_completion___block_invoke_191;
      v37[3] = &unk_24CAB51E0;
      v37[4] = v11;
      v37[5] = buf;
      -[__CFString enumerateItemIdentifiersUsingBlock:](v7, "enumerateItemIdentifiersUsingBlock:", v37);
      v12 = v39;
    }
    if (*((_QWORD *)v12 + 5))
    {
      v13 = -[__CFString globalIndexForIndexPath:](v7, "globalIndexForIndexPath:");
      objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", 3);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "addObject:", *((_QWORD *)v39 + 5));
      if ((_os_feature_enabled_impl() & 1) == 0)
      {
        if (v13 <= 1)
          v28 = 1;
        else
          v28 = v13;
        for (i = v28 - 1; (unint64_t)objc_msgSend(v14, "count") <= 2 && i < v8; ++i)
        {
          if (v13 != i)
          {
            -[__CFString indexPathForGlobalIndex:](v7, "indexPathForGlobalIndex:", i);
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            if (v30)
              objc_msgSend(v14, "addObject:", v30);

          }
        }
      }
      objc_msgSend(v6, "setPlaybackPrioritizedIndexPaths:", v14);
    }
    else
    {
      if (!*(_QWORD *)(a1 + 48) || !*(_QWORD *)(*(_QWORD *)(a1 + 32) + 160))
        goto LABEL_16;
      v16 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback_Oversize");
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(*(id *)(a1 + 32), "uniqueIdentifier");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = *(_QWORD *)(a1 + 32);
        v19 = *(_QWORD *)(v18 + 160);
        *(_DWORD *)v47 = 138544130;
        v48 = v17;
        v49 = 2048;
        v50 = v18;
        v51 = 2114;
        v52 = v19;
        v53 = 2114;
        v54 = v7;
        _os_log_impl(&dword_210BD8000, v16, OS_LOG_TYPE_ERROR, "[MQF:%{public}@:%p] loadPlaybackContext: | clearing startItemIdentifiers [SiriAssetInfo contains item not in the request] startItemIdentifiers=%{public}@ storeItemsRequest.identifiers=%{public}@", v47, 0x2Au);

      }
      v20 = (void *)MEMORY[0x24BE65C38];
      v44[0] = CFSTR("startItemIdentifiers");
      v45[0] = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 160);
      v44[1] = CFSTR("storeItemsRequest.sectionedModelObjects");
      objc_msgSend(v6, "sectionedModelObjects");
      v21 = objc_claimAutoreleasedReturnValue();
      v22 = (void *)v21;
      v23 = CFSTR("nil");
      if (v21)
        v24 = (const __CFString *)v21;
      else
        v24 = CFSTR("nil");
      v44[2] = CFSTR("identifiers");
      if (v7)
        v23 = v7;
      v45[1] = v24;
      v45[2] = v23;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v45, v44, 3);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v46 = v25;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v46, 1);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "snapshotWithDomain:type:subType:context:triggerThresholdValues:events:completion:", *MEMORY[0x24BE65AB0], CFSTR("Bug"), CFSTR("SiriAssetInfoBug"), CFSTR("StartItemNotInRequest"), &stru_24CABB5D0, v26, 0);

      v27 = *(_QWORD *)(a1 + 32);
      v14 = *(void **)(v27 + 160);
      *(_QWORD *)(v27 + 160) = 0;
    }

LABEL_16:
    _Block_object_dispose(buf, 8);

  }
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 120), "beginAutomaticResponseLoading");
}

- (NSString)rtcReportingPlayQueueSourceIdentifier
{
  return self->_rtcReportingPlayQueueSourceIdentifier;
}

- (void)reloadSection:(id)a3 completion:(id)a4
{
  id v7;
  id v8;
  NSObject *v9;
  void *v10;
  NSObject *diffQueue;
  id v12;
  id v13;
  _QWORD block[4];
  id v15;
  MPCModelQueueFeeder *v16;
  id v17;
  uint8_t buf[4];
  void *v19;
  __int16 v20;
  MPCModelQueueFeeder *v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  objc_storeStrong((id *)&self->_section, a3);
  v9 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    -[MPCModelQueueFeeder uniqueIdentifier](self, "uniqueIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v19 = v10;
    v20 = 2048;
    v21 = self;
    v22 = 2048;
    v23 = v7;
    _os_log_impl(&dword_210BD8000, v9, OS_LOG_TYPE_DEFAULT, "[MQF:%{public}@:%p] reloadSection: | connecting to section [] section=%p", buf, 0x20u);

  }
  diffQueue = self->_diffQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __48__MPCModelQueueFeeder_reloadSection_completion___block_invoke;
  block[3] = &unk_24CAB98A8;
  v15 = v7;
  v16 = self;
  v17 = v8;
  v12 = v8;
  v13 = v7;
  dispatch_async(diffQueue, block);

}

- (id)updatedPlaybackContext
{
  return self->_playbackContext;
}

- (void)_endBackgroundTaskAssertion
{
  dispatch_time_t v2;
  _QWORD v3[4];
  id v4;
  id location;

  objc_initWeak(&location, self);
  v2 = dispatch_time(0, 1000000000);
  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __50__MPCModelQueueFeeder__endBackgroundTaskAssertion__block_invoke;
  v3[3] = &unk_24CABA2F8;
  objc_copyWeak(&v4, &location);
  dispatch_after(v2, MEMORY[0x24BDAC9B8], v3);
  objc_destroyWeak(&v4);
  objc_destroyWeak(&location);
}

- (void)controller:(id)a3 defersResponseReplacement:(id)a4
{
  id v7;
  id v8;
  id v9;
  _QWORD block[5];
  id v11;
  _QWORD *v12;
  _QWORD *v13;
  SEL v14;
  _QWORD v15[5];
  id v16;
  _QWORD v17[5];
  id v18;

  v7 = a3;
  v8 = a4;
  v17[0] = 0;
  v17[1] = v17;
  v17[2] = 0x3032000000;
  v17[3] = __Block_byref_object_copy__12799;
  v17[4] = __Block_byref_object_dispose__12800;
  v18 = 0;
  v15[0] = 0;
  v15[1] = v15;
  v15[2] = 0x3032000000;
  v15[3] = __Block_byref_object_copy__12799;
  v15[4] = __Block_byref_object_dispose__12800;
  v16 = 0;
  -[NSLock lock](self->_diffLock, "lock");
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __60__MPCModelQueueFeeder_controller_defersResponseReplacement___block_invoke;
  block[3] = &unk_24CAB51B8;
  block[4] = self;
  v11 = v8;
  v12 = v17;
  v13 = v15;
  v14 = a2;
  v9 = v8;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

  _Block_object_dispose(v15, 8);
  _Block_object_dispose(v17, 8);

}

- (void)_beginBackgroundTaskAssertion
{
  unint64_t backgroundTasks;
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;
  unint64_t backgroundTaskIdentifier;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  const char *v12;
  NSObject *v13;
  os_log_type_t v14;
  uint32_t v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void (*v19)(uint64_t);
  void *v20;
  MPCModelQueueFeeder *v21;
  id v22;
  uint8_t buf[4];
  void *v24;
  __int16 v25;
  MPCModelQueueFeeder *v26;
  __int16 v27;
  id v28;
  __int16 v29;
  unint64_t v30;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  backgroundTasks = self->_backgroundTasks;
  self->_backgroundTasks = backgroundTasks + 1;
  v4 = *MEMORY[0x24BE65AB8];
  if (!backgroundTasks || self->_backgroundTaskIdentifier == v4)
  {
    -[MPCModelQueueFeeder description](self, "description");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    MPSharedBackgroundTaskProvider();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = MEMORY[0x24BDAC760];
    v18 = 3221225472;
    v19 = __52__MPCModelQueueFeeder__beginBackgroundTaskAssertion__block_invoke;
    v20 = &unk_24CABA1D0;
    v21 = self;
    v7 = v5;
    v22 = v7;
    self->_backgroundTaskIdentifier = objc_msgSend(v6, "beginTaskWithName:expirationHandler:", v7, &v17);

    backgroundTaskIdentifier = self->_backgroundTaskIdentifier;
    v9 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    v10 = v9;
    if (backgroundTaskIdentifier == v4)
    {
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        -[MPCModelQueueFeeder uniqueIdentifier](self, "uniqueIdentifier", v17, v18, v19, v20, v21);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v24 = v11;
        v25 = 2048;
        v26 = self;
        v27 = 2114;
        v28 = v7;
        v12 = "[MQF:%{public}@:%p] _beginBackgroundTaskAssertion | task failed to start [] task.name=%{public}@";
        v13 = v10;
        v14 = OS_LOG_TYPE_ERROR;
        v15 = 32;
LABEL_8:
        _os_log_impl(&dword_210BD8000, v13, v14, v12, buf, v15);

      }
    }
    else if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      -[MPCModelQueueFeeder uniqueIdentifier](self, "uniqueIdentifier", v17, v18, v19, v20, v21);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = self->_backgroundTaskIdentifier;
      *(_DWORD *)buf = 138544130;
      v24 = v11;
      v25 = 2048;
      v26 = self;
      v27 = 2114;
      v28 = v7;
      v29 = 2048;
      v30 = v16;
      v12 = "[MQF:%{public}@:%p] _beginBackgroundTaskAssertion | task started [] task.name=%{public}@ task.id=%lu";
      v13 = v10;
      v14 = OS_LOG_TYPE_DEFAULT;
      v15 = 42;
      goto LABEL_8;
    }

  }
}

void __48__MPCModelQueueFeeder_reloadSection_completion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  id v5;
  void *v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  _QWORD v12[5];
  _QWORD v13[4];
  id v14;
  uint8_t buf[4];
  void *v16;
  __int16 v17;
  uint64_t v18;
  __int16 v19;
  uint64_t v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "itemIdentifiers");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(void **)(a1 + 40);
  v4 = MEMORY[0x24BDAC760];
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __48__MPCModelQueueFeeder_reloadSection_completion___block_invoke_2;
  v13[3] = &unk_24CABA158;
  v5 = v2;
  v14 = v5;
  objc_msgSend(v3, "identifierRegistryWithExclusiveAccessReturningObject:", v13);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 40), "uniqueIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = *(_QWORD *)(a1 + 32);
    v9 = *(_QWORD *)(a1 + 40);
    *(_DWORD *)buf = 138544130;
    v16 = v8;
    v17 = 2048;
    v18 = v9;
    v19 = 2048;
    v20 = v10;
    v21 = 2114;
    v22 = v6;
    _os_log_impl(&dword_210BD8000, v7, OS_LOG_TYPE_DEFAULT, "[MQF:%{public}@:%p] reloadSection: | applying changes [] section=%p changes=%{public}@", buf, 0x2Au);

  }
  v12[0] = v4;
  v12[1] = 3221225472;
  v12[2] = __48__MPCModelQueueFeeder_reloadSection_completion___block_invoke_220;
  v12[3] = &unk_24CABA2A8;
  v11 = *(void **)(a1 + 32);
  v12[4] = *(_QWORD *)(a1 + 40);
  objc_msgSend(v11, "applyChanges:itemLookupBlock:", v6, v12);
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

void __60__MPCModelQueueFeeder_controller_defersResponseReplacement___block_invoke_4(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  _QWORD v17[4];
  id v18;
  id v19;
  _QWORD v20[4];
  id v21;
  id v22;
  _QWORD v23[4];
  id v24;
  id v25;
  _QWORD v26[4];
  id v27;
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = objc_msgSend(v3, "count");
  v4 = MEMORY[0x24BDAC760];
  if (*(_BYTE *)(a1 + 96))
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = objc_msgSend(v3, "count");
    v5 = (void *)MEMORY[0x24BDDC700];
    v6 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24);
    v7 = objc_msgSend(*(id *)(a1 + 32), "totalItemCount");
    v26[0] = v4;
    v26[1] = 3221225472;
    v26[2] = __60__MPCModelQueueFeeder_controller_defersResponseReplacement___block_invoke_5;
    v26[3] = &unk_24CABA1F8;
    v27 = v3;
    v28 = *(id *)(a1 + 32);
    v23[0] = v4;
    v23[1] = 3221225472;
    v23[2] = __60__MPCModelQueueFeeder_controller_defersResponseReplacement___block_invoke_6;
    v23[3] = &unk_24CABA1F8;
    v24 = v27;
    v25 = *(id *)(a1 + 32);
    objc_msgSend(v5, "changeDetailsWithPreviousCount:finalCount:isEqualBlock:isUpdatedBlock:", v6, v7, v26, v23);
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = *(_QWORD *)(*(_QWORD *)(a1 + 80) + 8);
    v10 = *(void **)(v9 + 40);
    *(_QWORD *)(v9 + 40) = v8;

  }
  if (*(_BYTE *)(a1 + 97))
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = objc_msgSend(*(id *)(a1 + 40), "totalItemCount");
    v11 = (void *)MEMORY[0x24BDDC700];
    v12 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24);
    v13 = objc_msgSend(*(id *)(a1 + 32), "totalItemCount");
    v20[0] = v4;
    v20[1] = 3221225472;
    v20[2] = __60__MPCModelQueueFeeder_controller_defersResponseReplacement___block_invoke_7;
    v20[3] = &unk_24CABA1F8;
    v21 = *(id *)(a1 + 40);
    v22 = *(id *)(a1 + 32);
    v17[0] = v4;
    v17[1] = 3221225472;
    v17[2] = __60__MPCModelQueueFeeder_controller_defersResponseReplacement___block_invoke_8;
    v17[3] = &unk_24CABA1F8;
    v18 = v3;
    v19 = *(id *)(a1 + 32);
    objc_msgSend(v11, "changeDetailsWithPreviousCount:finalCount:isEqualBlock:isUpdatedBlock:", v12, v13, v20, v17);
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = *(_QWORD *)(*(_QWORD *)(a1 + 88) + 8);
    v16 = *(void **)(v15 + 40);
    *(_QWORD *)(v15 + 40) = v14;

  }
}

id __48__MPCModelQueueFeeder_reloadSection_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  void *v8;
  _QWORD v10[4];
  id v11;
  id v12;

  v3 = a2;
  v4 = (void *)MEMORY[0x24BDDC700];
  v5 = objc_msgSend(*(id *)(a1 + 32), "count");
  v6 = objc_msgSend(v3, "count");
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __48__MPCModelQueueFeeder_reloadSection_completion___block_invoke_3;
  v10[3] = &unk_24CABA1F8;
  v11 = *(id *)(a1 + 32);
  v12 = v3;
  v7 = v3;
  objc_msgSend(v4, "changeDetailsWithPreviousCount:finalCount:isEqualBlock:isUpdatedBlock:", v5, v6, v10, &__block_literal_global_219);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  if (self->_backgroundTaskIdentifier != *MEMORY[0x24BE65AB8])
  {
    MPSharedBackgroundTaskProvider();
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "endTask:", self->_backgroundTaskIdentifier);

  }
  v4.receiver = self;
  v4.super_class = (Class)MPCModelQueueFeeder;
  -[MPCModelQueueFeeder dealloc](&v4, sel_dealloc);
}

- (void)applyVolumeNormalizationForItem:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  float v8;
  float v9;
  void *v10;
  int v11;
  NSObject *v12;
  double v13;
  double v14;
  _DWORD v15[2];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  objc_msgSend(v3, "modelPlayEvent");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "itemType") == 1)
  {
    objc_msgSend(v3, "modelGenericObject");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "type") == 1)
    {
      objc_msgSend(v5, "song");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "album");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v7 = 0;
    }

  }
  else
  {
    v7 = 0;
  }
  if (objc_msgSend(v7, "hasLoadedValueForKey:", *MEMORY[0x24BDDBDB8]))
  {
    objc_msgSend(v7, "volumeNormalization");
    v9 = v8;
  }
  else
  {
    v9 = NAN;
  }
  objc_msgSend(MEMORY[0x24BDDCB28], "standardUserDefaults");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "soundCheckEnabled");

  v12 = os_log_create("com.apple.amp.mediaplaybackcore", "Preferences");
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    v15[0] = 67109120;
    v15[1] = v11;
    _os_log_impl(&dword_210BD8000, v12, OS_LOG_TYPE_DEFAULT, "MPCModelQueueFeeder applyVolumeNormalizationForItem: soundCheckEnabled=%{BOOL}u", (uint8_t *)v15, 8u);
  }

  LODWORD(v13) = 0;
  if (v11)
    *(float *)&v13 = v9;
  objc_msgSend(v3, "setSoundCheckVolumeNormalization:", v13);
  *(float *)&v14 = v9;
  objc_msgSend(v3, "setLoudnessInfoVolumeNormalization:", v14);

}

- (int64_t)supplementalPlaybackContextBehavior
{
  objc_opt_class();
  return objc_opt_isKindOfClass() & 1;
}

- (id)supplementalPlaybackContextWithReason:(int64_t)a3
{
  void *v5;
  MPCModelStorePlaybackItemsRequest *v6;
  void *v7;
  char isKindOfClass;
  void *v9;
  id v10;
  void *v11;
  _BOOL4 v12;
  MPCModelPlaybackContext *v13;
  void *v14;
  MPCModelPlaybackContext *v15;
  MPCModelPlaybackContext *v17;
  void *v18;
  char v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  NSObject *v24;
  void *v25;
  NSObject *v26;
  void *v27;
  id v28;
  _QWORD v29[4];
  id v30;
  id v31;
  _BYTE *v32;
  _BYTE buf[24];
  int64_t v34;
  __int16 v35;
  MPCModelPlaybackContext *v36;
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  if (-[MPCModelQueueFeeder supplementalPlaybackContextBehavior](self, "supplementalPlaybackContextBehavior") != 1)
    return 0;
  -[MPCModelPlaybackResponse results](self->_response, "results");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "totalItemCount"))
  {
    v6 = objc_alloc_init(MPCModelStorePlaybackItemsRequest);
    if ((unint64_t)a3 < 2)
    {
      objc_msgSend(MEMORY[0x24BDDCB28], "standardUserDefaults");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v18, "forceLibrarySupplementalContexts");

      if ((v19 & 1) == 0)
      {
        v17 = 0;
        goto LABEL_25;
      }
    }
    else if (a3 != 2)
    {
      if (a3 == 3)
      {
        objc_msgSend(v5, "firstSection");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        isKindOfClass = objc_opt_isKindOfClass();

        if ((isKindOfClass & 1) != 0)
        {
          *(_QWORD *)buf = 0;
          *(_QWORD *)&buf[8] = buf;
          *(_QWORD *)&buf[16] = 0x2020000000;
          LOBYTE(v34) = 0;
          objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v5, "numberOfSections"));
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          v29[0] = MEMORY[0x24BDAC760];
          v29[1] = 3221225472;
          v29[2] = __61__MPCModelQueueFeeder_supplementalPlaybackContextWithReason___block_invoke;
          v29[3] = &unk_24CAB5030;
          v10 = v9;
          v30 = v10;
          v31 = v5;
          v32 = buf;
          objc_msgSend(v31, "enumerateSectionIdentifiersUsingBlock:", v29);
          if (objc_msgSend(v10, "count") && !*(_BYTE *)(*(_QWORD *)&buf[8] + 24))
            -[MPCModelStorePlaybackItemsRequest setStoreIDs:](v6, "setStoreIDs:", v10);

          _Block_object_dispose(buf, 8);
        }
        -[MPCModelStorePlaybackItemsRequest storeIDs](v6, "storeIDs");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = v11 == 0;

        v13 = objc_alloc_init(MPCModelPlaybackContext);
        if (v12)
        {
          v28 = 0;
          -[MPCModelQueueFeeder _supplementalLibraryRequestWithError:](self, "_supplementalLibraryRequestWithError:", &v28);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = (MPCModelPlaybackContext *)v28;
          if (!v14)
          {
            _MPCLogCategoryPlayback();
            v26 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
            {
              -[MPCModelQueueFeeder uniqueIdentifier](self, "uniqueIdentifier");
              v27 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138544130;
              *(_QWORD *)&buf[4] = v27;
              *(_WORD *)&buf[12] = 2048;
              *(_QWORD *)&buf[14] = self;
              *(_WORD *)&buf[22] = 2048;
              v34 = 3;
              v35 = 2114;
              v36 = v15;
              _os_log_impl(&dword_210BD8000, v26, OS_LOG_TYPE_ERROR, "[MQF:%{public}@:%p] supplementalPlaybackContextWithReason:%ld | failed to create library supplemental [] error=%{public}@", buf, 0x2Au);

            }
            v17 = 0;
            goto LABEL_23;
          }
          -[MPCModelPlaybackContext setRequest:](v13, "setRequest:", v14);
          -[MPCModelPlaybackContext setSkipEncodingMediaLibraryUniqueID:](v13, "setSkipEncodingMediaLibraryUniqueID:", 1);

LABEL_20:
          -[MPCModelPlaybackContext setPlaybackRequestEnvironment:](v13, "setPlaybackRequestEnvironment:", self->_playbackRequestEnvironment);
          -[MPCModelQueueFeeder playActivityQueueGroupingID](self, "playActivityQueueGroupingID");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          -[MPCModelPlaybackContext setPlayActivityQueueGroupingID:](v13, "setPlayActivityQueueGroupingID:", v21);

          -[MPCModelQueueFeeder playActivityFeatureName](self, "playActivityFeatureName");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          -[MPCModelPlaybackContext setPlayActivityFeatureName:](v13, "setPlayActivityFeatureName:", v22);

          -[MPCModelQueueFeeder playActivityRecommendationData](self, "playActivityRecommendationData");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          -[MPCModelPlaybackContext setPlayActivityRecommendationData:](v13, "setPlayActivityRecommendationData:", v23);

          v24 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
          if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
          {
            -[MPCModelQueueFeeder uniqueIdentifier](self, "uniqueIdentifier");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138544130;
            *(_QWORD *)&buf[4] = v25;
            *(_WORD *)&buf[12] = 2048;
            *(_QWORD *)&buf[14] = self;
            *(_WORD *)&buf[22] = 2048;
            v34 = a3;
            v35 = 2114;
            v36 = v13;
            _os_log_impl(&dword_210BD8000, v24, OS_LOG_TYPE_DEFAULT, "[MQF:%{public}@:%p] supplementalPlaybackContextWithReason:%ld | created supplemental [] supplementalContext=%{public}@", buf, 0x2Au);

          }
          v13 = v13;
          v17 = v13;
LABEL_23:

LABEL_25:
          goto LABEL_26;
        }
LABEL_19:
        -[MPCModelStorePlaybackItemsRequest setClientIdentifier:](v6, "setClientIdentifier:", CFSTR("com.apple.Music"));
        -[MPCModelPlaybackContext setRequest:](v13, "setRequest:", v6);
        goto LABEL_20;
      }
LABEL_18:
      v13 = objc_alloc_init(MPCModelPlaybackContext);
      goto LABEL_19;
    }
    -[MPCModelQueueFeeder _sectionedModelObjectsRepresentationForSectionedCollection:](self, "_sectionedModelObjectsRepresentationForSectionedCollection:", v5);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[MPCModelStorePlaybackItemsRequest setSectionedModelObjects:](v6, "setSectionedModelObjects:", v20);

    goto LABEL_18;
  }
  v17 = 0;
LABEL_26:

  return v17;
}

- (id)firstModelPlayEvent
{
  void *v3;
  void *v4;
  MPModelGenericObject *v5;
  MPModelGenericObject *fallbackSectionRepresentation;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x24BDDC938];
  -[MPCModelPlaybackResponse results](self->_response, "results");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "firstSection");
  v5 = (MPModelGenericObject *)objc_claimAutoreleasedReturnValue();
  fallbackSectionRepresentation = v5;
  if (!v5)
    fallbackSectionRepresentation = self->_fallbackSectionRepresentation;
  -[MPCModelQueueFeeder playActivityFeatureName](self, "playActivityFeatureName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "playEventWithModelObject:featureName:", fallbackSectionRepresentation, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (void)getRepresentativeMetadataForPlaybackContext:(id)a3 properties:(id)a4 completion:(id)a5
{
  id v8;
  MPPropertySet *v9;
  id v10;
  MPPropertySet *representativeMetadataPropertySet;
  MPPropertySet *v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  MPCModelQueueFeeder *v17;
  id v18;

  v8 = a3;
  v9 = (MPPropertySet *)a4;
  v10 = a5;
  representativeMetadataPropertySet = self->_representativeMetadataPropertySet;
  self->_representativeMetadataPropertySet = v9;
  v12 = v9;

  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __89__MPCModelQueueFeeder_getRepresentativeMetadataForPlaybackContext_properties_completion___block_invoke;
  v15[3] = &unk_24CAB54A8;
  v16 = v8;
  v17 = self;
  v18 = v10;
  v13 = v10;
  v14 = v8;
  -[MPCModelQueueFeeder loadPlaybackContext:completion:](self, "loadPlaybackContext:completion:", v14, v15);

}

- (BOOL)controller:(id)a3 shouldRetryFailedRequestWithError:(id)a4
{
  id v5;
  id v6;
  char v7;
  _QWORD block[5];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  char v15;

  v5 = a4;
  v12 = 0;
  v13 = &v12;
  v14 = 0x2020000000;
  v15 = 0;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __68__MPCModelQueueFeeder_controller_shouldRetryFailedRequestWithError___block_invoke;
  block[3] = &unk_24CAB85F0;
  block[4] = self;
  v10 = v5;
  v11 = &v12;
  v6 = v5;
  dispatch_sync(MEMORY[0x24BDAC9B8], block);
  v7 = *((_BYTE *)v13 + 24);

  _Block_object_dispose(&v12, 8);
  return v7;
}

- (BOOL)canJumpToItem:(id)a3 reason:(id *)a4
{
  return 1;
}

- (BOOL)supportsAutoPlayForItem:(id)a3 inSection:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  id v17;
  _QWORD v19[4];
  id v20;

  v5 = a3;
  v19[0] = MEMORY[0x24BDAC760];
  v19[1] = 3221225472;
  v19[2] = __57__MPCModelQueueFeeder_supportsAutoPlayForItem_inSection___block_invoke;
  v19[3] = &unk_24CABA0B0;
  v6 = v5;
  v20 = v6;
  v7 = -[MPCModelQueueFeeder identifierRegistryWithExclusiveAccessReturningInteger:](self, "identifierRegistryWithExclusiveAccessReturningInteger:", v19);
  if (v7 == 0x7FFFFFFFFFFFFFFFLL)
  {
    LOBYTE(v8) = 0;
    goto LABEL_24;
  }
  v9 = v7;
  -[MPCModelPlaybackResponse results](self->_response, "results");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "indexPathForGlobalIndex:", v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  -[MPCModelPlaybackResponse results](self->_response, "results");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "itemAtIndexPath:", v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = v13;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v15 = v14;
    goto LABEL_19;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v17 = v14;
    else
      v17 = 0;
LABEL_15:
    if (objc_msgSend(v17, "type") == 1)
    {
      objc_msgSend(v17, "song");
      v15 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v15 = 0;
    }
    goto LABEL_18;
  }
  v16 = v14;
  if (objc_msgSend(v16, "type") != 1)
  {
    if (objc_msgSend(v16, "type") == 5)
    {
      objc_msgSend(v16, "playlistEntry");
      v17 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v17 = 0;
    }

    goto LABEL_15;
  }
  objc_msgSend(v16, "song");
  v15 = (id)objc_claimAutoreleasedReturnValue();

  v17 = 0;
LABEL_18:

LABEL_19:
  if (v15 && (objc_msgSend(v15, "hasVideo") & 1) == 0)
    v8 = objc_msgSend(v15, "isArtistUploadedContent") ^ 1;
  else
    LOBYTE(v8) = 0;

LABEL_24:
  return v8;
}

- (BOOL)isExportableMediaTypeForItem:(id)a3 inSection:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  BOOL v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  id v17;
  _QWORD v19[4];
  id v20;

  v5 = a3;
  v19[0] = MEMORY[0x24BDAC760];
  v19[1] = 3221225472;
  v19[2] = __62__MPCModelQueueFeeder_isExportableMediaTypeForItem_inSection___block_invoke;
  v19[3] = &unk_24CABA0B0;
  v6 = v5;
  v20 = v6;
  v7 = -[MPCModelQueueFeeder identifierRegistryWithExclusiveAccessReturningInteger:](self, "identifierRegistryWithExclusiveAccessReturningInteger:", v19);
  if (v7 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v9 = v7;
    -[MPCModelPlaybackResponse results](self->_response, "results");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "indexPathForGlobalIndex:", v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    -[MPCModelPlaybackResponse results](self->_response, "results");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "itemAtIndexPath:", v11);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v14 = v13;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v15 = v14;
LABEL_19:

      v8 = v15 != 0;
      goto LABEL_20;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v16 = v14;
      if (objc_msgSend(v16, "type") == 1)
      {
        objc_msgSend(v16, "song");
        v15 = (id)objc_claimAutoreleasedReturnValue();

        v17 = 0;
LABEL_18:

        goto LABEL_19;
      }
      if (objc_msgSend(v16, "type") == 5)
      {
        objc_msgSend(v16, "playlistEntry");
        v17 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v17 = 0;
      }

    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v17 = v14;
      else
        v17 = 0;
    }
    if (objc_msgSend(v17, "type") == 1)
    {
      objc_msgSend(v17, "song");
      v15 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v15 = 0;
    }
    goto LABEL_18;
  }
  v8 = 0;
LABEL_20:

  return v8;
}

- (id)accountIDForItem:(id)a3 inSection:(id)a4
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t quot;
  uint64_t v10;
  char *v11;
  lldiv_t v12;
  uint64_t v13;
  const UInt8 *v14;
  __CFString *v15;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  -[MPCModelGenericAVItemUserIdentityPropertySet delegatedIdentityProperties](self->_identityPropertySet, "delegatedIdentityProperties", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "DSID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[MPCModelGenericAVItemUserIdentityPropertySet identityProperties](self->_identityPropertySet, "identityProperties");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "DSID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  if (v7)
  {
    quot = objc_msgSend(v7, "longLongValue");
    v10 = quot;
    v11 = (char *)&v17 + 1;
    do
    {
      v12 = lldiv(quot, 10);
      quot = v12.quot;
      if (v12.rem >= 0)
        LOBYTE(v13) = v12.rem;
      else
        v13 = -v12.rem;
      *(v11 - 2) = v13 + 48;
      v14 = (const UInt8 *)(v11 - 2);
      --v11;
    }
    while (v12.quot);
    if (v10 < 0)
    {
      *(v11 - 2) = 45;
      v14 = (const UInt8 *)(v11 - 2);
    }
    v15 = (__CFString *)CFStringCreateWithBytes(0, v14, (char *)&v17 - (char *)v14, 0x8000100u, 0);
  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (id)firstItemIntersectingIdentifierSet:(id)a3
{
  MPCModelPlaybackResponse *response;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  _QWORD v12[5];

  response = self->_response;
  v5 = a3;
  -[MPCModelPlaybackResponse results](response, "results");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "indexPathForItemWithIdentifiersIntersectingSet:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[MPCModelPlaybackResponse results](self->_response, "results");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "globalIndexForIndexPath:", v7);

    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __58__MPCModelQueueFeeder_firstItemIntersectingIdentifierSet___block_invoke;
    v12[3] = &__block_descriptor_40_e41__16__0__MPQueueFeederIdentifierRegistry_8l;
    v12[4] = v9;
    -[MPCModelQueueFeeder identifierRegistryWithExclusiveAccessReturningObject:](self, "identifierRegistryWithExclusiveAccessReturningObject:", v12);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)identifiersForItem:(id)a3 inSection:(id)a4
{
  id v5;
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;

  v5 = a3;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __52__MPCModelQueueFeeder_identifiersForItem_inSection___block_invoke;
  v9[3] = &unk_24CABA158;
  v10 = v5;
  v6 = v5;
  -[MPCModelQueueFeeder identifierRegistryWithExclusiveAccessReturningObject:](self, "identifierRegistryWithExclusiveAccessReturningObject:", v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (BOOL)section:(id)a3 shouldShuffleExcludeItem:(id)a4
{
  id v5;
  id v6;
  void *v7;
  char v8;
  _QWORD v10[4];
  id v11;

  v5 = a4;
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __56__MPCModelQueueFeeder_section_shouldShuffleExcludeItem___block_invoke;
  v10[3] = &unk_24CABA158;
  v11 = v5;
  v6 = v5;
  -[MPCModelQueueFeeder identifierRegistryWithExclusiveAccessReturningObject:](self, "identifierRegistryWithExclusiveAccessReturningObject:", v10);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "shouldExcludeFromShuffle");

  return v8;
}

- (id)_sectionedModelObjectsRepresentationForSectionedCollection:(id)a3
{
  id v4;
  id v5;
  id v6;
  id v7;
  void *v8;
  id v9;
  _QWORD v11[4];
  id v12;
  MPCModelQueueFeeder *v13;
  id v14;

  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x24BDDCA88]);
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __82__MPCModelQueueFeeder__sectionedModelObjectsRepresentationForSectionedCollection___block_invoke;
  v11[3] = &unk_24CAB5300;
  v6 = v5;
  v12 = v6;
  v13 = self;
  v14 = v4;
  v7 = v4;
  objc_msgSend(v7, "enumerateSectionsUsingBlock:", v11);
  v8 = v14;
  v9 = v6;

  return v9;
}

- (id)_supplementalLibraryRequestWithError:(id *)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  BOOL v16;
  void *v17;
  _BOOL4 v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t j;
  void *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  BOOL v33;
  void *v34;
  _BOOL4 v35;
  id v36;
  id v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  BOOL v49;
  void *v50;
  _BOOL4 v51;
  void *v52;
  id v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  id v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v66;
  void *v68;
  void *v69;
  uint64_t v70;
  void *v71;
  uint64_t v72;
  id obj;
  id obja;
  id objb;
  _QWORD v76[4];
  id v77;
  id v78;
  BOOL v79;
  BOOL v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  _QWORD v85[4];
  id v86;
  id v87;
  BOOL v88;
  BOOL v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  _QWORD v94[4];
  id v95;
  id v96;
  BOOL v97;
  BOOL v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  _BYTE v103[128];
  _BYTE v104[128];
  _BYTE v105[128];
  uint64_t v106;

  v106 = *MEMORY[0x24BDAC8D0];
  v4 = (void *)-[MPCModelPlaybackRequest copy](self->_request, "copy");
  objc_opt_class();
  v5 = v4;
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[MPCModelPlaybackRequest mediaLibrary](self->_request, "mediaLibrary");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setMediaLibrary:", v6);

  }
  objc_msgSend(v4, "allowedSectionIdentifiers");
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  v69 = v4;
  if (objc_msgSend(v68, "count"))
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v68, "count"));
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    v99 = 0u;
    v100 = 0u;
    v101 = 0u;
    v102 = 0u;
    v7 = v68;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v99, v105, 16);
    if (!v8)
      goto LABEL_22;
    v9 = v8;
    v10 = *(_QWORD *)v100;
    obj = v7;
    while (1)
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v100 != v10)
          objc_enumerationMutation(obj);
        v12 = *(void **)(*((_QWORD *)&v99 + 1) + 8 * i);
        objc_msgSend(v12, "personalizedStore");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "universalStore");
        v14 = objc_claimAutoreleasedReturnValue();
        v15 = (void *)v14;
        if (v13)
        {
          v16 = objc_msgSend(v13, "cloudID") != 0;
          if (!v15)
            goto LABEL_14;
        }
        else
        {
          v16 = 0;
          if (!v14)
          {
LABEL_14:
            v18 = 0;
            if (!v16)
              goto LABEL_18;
            goto LABEL_19;
          }
        }
        objc_msgSend(v15, "globalPlaylistID");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v17, "length"))
        {
          v18 = 1;
        }
        else
        {
          objc_msgSend(v15, "universalCloudLibraryID");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = objc_msgSend(v19, "length") != 0;

        }
        if (!v16)
        {
LABEL_18:
          if (!v18)
            goto LABEL_20;
        }
LABEL_19:
        v20 = objc_alloc(MEMORY[0x24BDDC758]);
        objc_msgSend(v12, "modelKind");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v94[0] = MEMORY[0x24BDAC760];
        v94[1] = 3221225472;
        v94[2] = __60__MPCModelQueueFeeder__supplementalLibraryRequestWithError___block_invoke;
        v94[3] = &unk_24CAB5328;
        v97 = v16;
        v95 = v13;
        v98 = v18;
        v96 = v15;
        v22 = (void *)objc_msgSend(v20, "initWithSource:modelKind:block:", CFSTR("ModelQueueFeeder"), v21, v94);

        objc_msgSend(v71, "addObject:", v22);
LABEL_20:

      }
      v7 = obj;
      v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v99, v105, 16);
      if (!v9)
      {
LABEL_22:

        v5 = v69;
        objc_msgSend(v69, "setAllowedSectionIdentifiers:", v71);
        if (objc_msgSend(v71, "count"))
        {

          break;
        }
        if (!a3)
        {
          v59 = 0;
          v23 = v71;
          goto LABEL_80;
        }
        v60 = (void *)MEMORY[0x24BDD1540];
        objc_msgSend(v7, "msv_compactDescription");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v60, "msv_errorWithDomain:code:debugDescription:", CFSTR("MPCError"), 72, CFSTR("Failed to create transportable allowedSectionIDs: %@"), v40);
        v59 = 0;
        *a3 = (id)objc_claimAutoreleasedReturnValue();
LABEL_78:
        v23 = v71;
        goto LABEL_79;
      }
    }
  }
  objc_msgSend(v5, "allowedItemIdentifiers");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v71 = v23;
  if (!objc_msgSend(v23, "count"))
    goto LABEL_45;
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v23, "count"));
  obja = (id)objc_claimAutoreleasedReturnValue();
  v90 = 0u;
  v91 = 0u;
  v92 = 0u;
  v93 = 0u;
  v24 = v23;
  v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v90, v104, 16);
  if (!v25)
    goto LABEL_43;
  v26 = v25;
  v27 = *(_QWORD *)v91;
  do
  {
    for (j = 0; j != v26; ++j)
    {
      if (*(_QWORD *)v91 != v27)
        objc_enumerationMutation(v24);
      v29 = *(void **)(*((_QWORD *)&v90 + 1) + 8 * j);
      objc_msgSend(v29, "personalizedStore");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "universalStore");
      v31 = objc_claimAutoreleasedReturnValue();
      v32 = (void *)v31;
      if (v30)
      {
        v33 = objc_msgSend(v30, "cloudID") != 0;
        if (!v32)
          goto LABEL_35;
      }
      else
      {
        v33 = 0;
        if (!v31)
        {
LABEL_35:
          v35 = 0;
          if (!v33)
            goto LABEL_39;
          goto LABEL_40;
        }
      }
      objc_msgSend(v32, "universalCloudLibraryID");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v34, "length"))
        v35 = 1;
      else
        v35 = objc_msgSend(v32, "purchasedAdamID") != 0;

      if (!v33)
      {
LABEL_39:
        if (!v35)
          goto LABEL_41;
      }
LABEL_40:
      v36 = v24;
      v37 = objc_alloc(MEMORY[0x24BDDC758]);
      objc_msgSend(v29, "modelKind");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v85[0] = MEMORY[0x24BDAC760];
      v85[1] = 3221225472;
      v85[2] = __60__MPCModelQueueFeeder__supplementalLibraryRequestWithError___block_invoke_4;
      v85[3] = &unk_24CAB5328;
      v88 = v33;
      v86 = v30;
      v89 = v35;
      v87 = v32;
      v39 = (void *)objc_msgSend(v37, "initWithSource:modelKind:block:", CFSTR("ModelQueueFeeder"), v38, v85);

      objc_msgSend(obja, "addObject:", v39);
      v24 = v36;

LABEL_41:
    }
    v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v90, v104, 16);
  }
  while (v26);
LABEL_43:

  v5 = v69;
  v23 = v24;
  v40 = obja;
  objc_msgSend(v69, "setAllowedItemIdentifiers:", obja);
  if (!objc_msgSend(obja, "count"))
  {
    if (a3)
    {
      v61 = (void *)MEMORY[0x24BDD1540];
      objc_msgSend(v23, "msv_compactDescription");
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v61, "msv_errorWithDomain:code:debugDescription:", CFSTR("MPCError"), 72, CFSTR("Failed to create transportable allowedItemIDs: %@"), v62);
      *a3 = (id)objc_claimAutoreleasedReturnValue();

      v5 = v69;
    }
    v59 = 0;
    goto LABEL_79;
  }

  v23 = v71;
LABEL_45:
  objc_msgSend(v5, "scopedContainers");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v40, "count"))
    goto LABEL_69;
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v40, "count"));
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v81 = 0u;
  v82 = 0u;
  v83 = 0u;
  v84 = 0u;
  v66 = v40;
  objb = v40;
  v72 = objc_msgSend(objb, "countByEnumeratingWithState:objects:count:", &v81, v103, 16);
  if (!v72)
    goto LABEL_67;
  v42 = *(_QWORD *)v82;
  v70 = *(_QWORD *)v82;
  while (2)
  {
    v43 = 0;
    while (2)
    {
      if (*(_QWORD *)v82 != v42)
        objc_enumerationMutation(objb);
      v44 = *(void **)(*((_QWORD *)&v81 + 1) + 8 * v43);
      objc_msgSend(v44, "identifiers");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v45, "personalizedStore");
      v46 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v44, "identifiers");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v47, "universalStore");
      v48 = (void *)objc_claimAutoreleasedReturnValue();

      if (v46)
      {
        v49 = objc_msgSend(v46, "cloudID") != 0;
        if (v48)
          goto LABEL_53;
LABEL_56:
        v51 = 0;
        if (v49)
          goto LABEL_64;
LABEL_63:
        if (v51)
          goto LABEL_64;
      }
      else
      {
        v49 = 0;
        if (!v48)
          goto LABEL_56;
LABEL_53:
        objc_msgSend(v48, "globalPlaylistID");
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v50, "length"))
        {
          v51 = 1;
        }
        else
        {
          objc_msgSend(v48, "universalCloudLibraryID");
          v52 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v52, "length"))
            v51 = 1;
          else
            v51 = objc_msgSend(v48, "purchasedAdamID") != 0;

        }
        if (!v49)
          goto LABEL_63;
LABEL_64:
        v53 = objc_alloc(MEMORY[0x24BDDC758]);
        objc_msgSend(v44, "identifiers");
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v54, "modelKind");
        v55 = v41;
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        v76[0] = MEMORY[0x24BDAC760];
        v76[1] = 3221225472;
        v76[2] = __60__MPCModelQueueFeeder__supplementalLibraryRequestWithError___block_invoke_7;
        v76[3] = &unk_24CAB5328;
        v79 = v49;
        v77 = v46;
        v80 = v51;
        v78 = v48;
        v57 = (void *)objc_msgSend(v53, "initWithSource:modelKind:block:", CFSTR("ModelQueueFeeder"), v56, v76);

        v41 = v55;
        v42 = v70;

        v58 = (void *)objc_msgSend(v44, "copyWithIdentifiers:block:", v57, &__block_literal_global_240_12738);
        objc_msgSend(v41, "addObject:", v58);

      }
      if (v72 != ++v43)
        continue;
      break;
    }
    v72 = objc_msgSend(objb, "countByEnumeratingWithState:objects:count:", &v81, v103, 16);
    if (v72)
      continue;
    break;
  }
LABEL_67:
  v40 = objb;

  v5 = v69;
  objc_msgSend(v69, "setScopedContainers:", v41);
  if (!objc_msgSend(v41, "count"))
  {
    if (a3)
    {
      v63 = (void *)MEMORY[0x24BDD1540];
      objc_msgSend(objb, "msv_compactDescription");
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v63, "msv_errorWithDomain:code:debugDescription:", CFSTR("MPCError"), 72, CFSTR("Failed to create transportable scopedContainers: %@"), v64);
      *a3 = (id)objc_claimAutoreleasedReturnValue();

      v5 = v69;
    }

    v59 = 0;
    goto LABEL_78;
  }

  v23 = v71;
  v40 = v66;
LABEL_69:
  v59 = v5;
LABEL_79:

LABEL_80:
  return v59;
}

- (id)_staticRegistryRequest
{
  return (id)-[MPCModelQueueFeeder identifierRegistryWithExclusiveAccessReturningObject:](self, "identifierRegistryWithExclusiveAccessReturningObject:", &__block_literal_global_243_12723);
}

- (MPModelGenericObject)fallbackSectionRepresentation
{
  return self->_fallbackSectionRepresentation;
}

- (void)setFallbackSectionRepresentation:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 224);
}

- (MPCModelPlaybackResponse)response
{
  return self->_response;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_response, 0);
  objc_storeStrong((id *)&self->_fallbackSectionRepresentation, 0);
  objc_storeStrong((id *)&self->_representativeMetadataPropertySet, 0);
  objc_storeStrong((id *)&self->_playbackContext, 0);
  objc_storeStrong((id *)&self->_identityPropertySet, 0);
  objc_storeStrong((id *)&self->_section, 0);
  objc_storeStrong((id *)&self->_startTimeModifications, 0);
  objc_storeStrong((id *)&self->_startItemIdentifiers, 0);
  objc_storeStrong((id *)&self->_playbackRequestEnvironment, 0);
  objc_storeStrong((id *)&self->_rtcReportingPlayQueueSourceIdentifier, 0);
  objc_storeStrong((id *)&self->_request, 0);
  objc_storeStrong((id *)&self->_requestController, 0);
  objc_storeStrong(&self->_loadingCompletionHandler, 0);
  objc_storeStrong((id *)&self->_endTimeModifications, 0);
  objc_storeStrong((id *)&self->_activeModelGenericAVItems, 0);
  objc_storeStrong((id *)&self->_diffLock, 0);
  objc_storeStrong((id *)&self->_diffQueue, 0);
  objc_storeStrong((id *)&self->_accessQueue, 0);
}

id __45__MPCModelQueueFeeder__staticRegistryRequest__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  uint64_t v3;
  void *v4;
  uint64_t i;
  void *v6;
  void *v7;
  objc_class *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  _QWORD v17[4];
  id v18;
  uint64_t v19;

  v2 = a2;
  v3 = objc_msgSend(v2, "count");
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3 >= 1)
  {
    for (i = 0; i != v3; ++i)
    {
      objc_msgSend(v2, "identifierSetAtIndex:", i);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "modelKind");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = (objc_class *)objc_msgSend(v7, "modelClass");
      if (!v8)
        v8 = (objc_class *)objc_opt_class();

      v9 = [v8 alloc];
      v17[0] = MEMORY[0x24BDAC760];
      v17[1] = 3221225472;
      v17[2] = __45__MPCModelQueueFeeder__staticRegistryRequest__block_invoke_2;
      v17[3] = &unk_24CAB5390;
      v18 = v2;
      v19 = i;
      v10 = (void *)objc_msgSend(v9, "initWithIdentifiers:block:", v6, v17);
      -[objc_class mqf_requiredItemPlaybackProperties](v8, "mqf_requiredItemPlaybackProperties");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = (void *)objc_msgSend(v10, "copyWithPropertySet:", v11);

      objc_msgSend(v4, "addObject:", v12);
    }
  }
  v13 = objc_alloc_init(MEMORY[0x24BDDC9F0]);
  v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDDC9F8]), "initWithRequest:", v13);
  v15 = objc_alloc_init(MEMORY[0x24BDDCA88]);
  objc_msgSend(v15, "appendSection:", &stru_24CABB5D0);
  objc_msgSend(v15, "appendItems:", v4);
  objc_msgSend(v14, "setResults:", v15);
  objc_msgSend(v13, "setStaticResponse:", v14);

  return v13;
}

void __45__MPCModelQueueFeeder__staticRegistryRequest__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3;
  void *v4;
  id v5;
  void *v6;
  id v7;

  v7 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v4 = *(void **)(a1 + 32);
    v3 = *(_QWORD *)(a1 + 40);
    v5 = v7;
    objc_msgSend(v4, "itemAtIndex:", v3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setTitle:", v6);

  }
}

void __60__MPCModelQueueFeeder__supplementalLibraryRequestWithError___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  void *v4;
  id v5;
  _QWORD v6[4];
  id v7;
  _QWORD v8[4];
  id v9;

  v5 = a2;
  v3 = MEMORY[0x24BDAC760];
  if (*(_BYTE *)(a1 + 48))
  {
    objc_msgSend(*(id *)(a1 + 32), "personID");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = v3;
    v8[1] = 3221225472;
    v8[2] = __60__MPCModelQueueFeeder__supplementalLibraryRequestWithError___block_invoke_2;
    v8[3] = &unk_24CAB89A8;
    v9 = *(id *)(a1 + 32);
    objc_msgSend(v5, "setPersonalStoreIdentifiersWithPersonID:block:", v4, v8);

  }
  if (*(_BYTE *)(a1 + 49))
  {
    v6[0] = v3;
    v6[1] = 3221225472;
    v6[2] = __60__MPCModelQueueFeeder__supplementalLibraryRequestWithError___block_invoke_3;
    v6[3] = &unk_24CAB89F0;
    v7 = *(id *)(a1 + 40);
    objc_msgSend(v5, "setUniversalStoreIdentifiersWithBlock:", v6);

  }
}

void __60__MPCModelQueueFeeder__supplementalLibraryRequestWithError___block_invoke_4(uint64_t a1, void *a2)
{
  uint64_t v3;
  void *v4;
  id v5;
  _QWORD v6[4];
  id v7;
  _QWORD v8[4];
  id v9;

  v5 = a2;
  v3 = MEMORY[0x24BDAC760];
  if (*(_BYTE *)(a1 + 48))
  {
    objc_msgSend(*(id *)(a1 + 32), "personID");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = v3;
    v8[1] = 3221225472;
    v8[2] = __60__MPCModelQueueFeeder__supplementalLibraryRequestWithError___block_invoke_5;
    v8[3] = &unk_24CAB89A8;
    v9 = *(id *)(a1 + 32);
    objc_msgSend(v5, "setPersonalStoreIdentifiersWithPersonID:block:", v4, v8);

  }
  if (*(_BYTE *)(a1 + 49))
  {
    v6[0] = v3;
    v6[1] = 3221225472;
    v6[2] = __60__MPCModelQueueFeeder__supplementalLibraryRequestWithError___block_invoke_6;
    v6[3] = &unk_24CAB89F0;
    v7 = *(id *)(a1 + 40);
    objc_msgSend(v5, "setUniversalStoreIdentifiersWithBlock:", v6);

  }
}

void __60__MPCModelQueueFeeder__supplementalLibraryRequestWithError___block_invoke_7(uint64_t a1, void *a2)
{
  uint64_t v3;
  void *v4;
  id v5;
  _QWORD v6[4];
  id v7;
  _QWORD v8[4];
  id v9;

  v5 = a2;
  v3 = MEMORY[0x24BDAC760];
  if (*(_BYTE *)(a1 + 48))
  {
    objc_msgSend(*(id *)(a1 + 32), "personID");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = v3;
    v8[1] = 3221225472;
    v8[2] = __60__MPCModelQueueFeeder__supplementalLibraryRequestWithError___block_invoke_8;
    v8[3] = &unk_24CAB89A8;
    v9 = *(id *)(a1 + 32);
    objc_msgSend(v5, "setPersonalStoreIdentifiersWithPersonID:block:", v4, v8);

  }
  if (*(_BYTE *)(a1 + 49))
  {
    v6[0] = v3;
    v6[1] = 3221225472;
    v6[2] = __60__MPCModelQueueFeeder__supplementalLibraryRequestWithError___block_invoke_9;
    v6[3] = &unk_24CAB89F0;
    v7 = *(id *)(a1 + 40);
    objc_msgSend(v5, "setUniversalStoreIdentifiersWithBlock:", v6);

  }
}

void __60__MPCModelQueueFeeder__supplementalLibraryRequestWithError___block_invoke_8(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v3, "setCloudID:", objc_msgSend(v2, "cloudID"));

}

void __60__MPCModelQueueFeeder__supplementalLibraryRequestWithError___block_invoke_9(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v3 = *(void **)(a1 + 32);
  v6 = a2;
  objc_msgSend(v3, "globalPlaylistID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setGlobalPlaylistID:", v4);

  objc_msgSend(*(id *)(a1 + 32), "universalCloudLibraryID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setUniversalCloudLibraryID:", v5);

  objc_msgSend(v6, "setPurchasedAdamID:", objc_msgSend(*(id *)(a1 + 32), "purchasedAdamID"));
}

void __60__MPCModelQueueFeeder__supplementalLibraryRequestWithError___block_invoke_5(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v3, "setCloudID:", objc_msgSend(v2, "cloudID"));

}

void __60__MPCModelQueueFeeder__supplementalLibraryRequestWithError___block_invoke_6(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;

  v3 = *(void **)(a1 + 32);
  v5 = a2;
  objc_msgSend(v3, "universalCloudLibraryID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setUniversalCloudLibraryID:", v4);

  objc_msgSend(v5, "setPurchasedAdamID:", objc_msgSend(*(id *)(a1 + 32), "purchasedAdamID"));
}

void __60__MPCModelQueueFeeder__supplementalLibraryRequestWithError___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v3, "setCloudID:", objc_msgSend(v2, "cloudID"));

}

void __60__MPCModelQueueFeeder__supplementalLibraryRequestWithError___block_invoke_3(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  id v6;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "globalPlaylistID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setGlobalPlaylistID:", v5);

  objc_msgSend(*(id *)(a1 + 32), "universalCloudLibraryID");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setUniversalCloudLibraryID:", v6);

}

void __82__MPCModelQueueFeeder__sectionedModelObjectsRepresentationForSectionedCollection___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  id *v13;
  void *v14;
  id v15;
  id v16;
  _QWORD v17[4];
  _QWORD v18[2];
  _QWORD v19[4];
  _QWORD v20[2];

  v15 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v15;
  }
  else
  {
    v6 = objc_alloc(MEMORY[0x24BDDC928]);
    objc_msgSend(MEMORY[0x24BDDC758], "emptyIdentifierSet");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v6, "initWithIdentifiers:block:", v7, &__block_literal_global_224);

    v5 = (id)v8;
  }
  v16 = v5;
  objc_msgSend(*(id *)(a1 + 32), "appendSection:", v5);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 232), "request");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "itemKind");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "modelClass");

  if (v11)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v16, "type") == 1)
    {
      v12 = *(void **)(a1 + 48);
      v19[0] = MEMORY[0x24BDAC760];
      v19[1] = 3221225472;
      v19[2] = __82__MPCModelQueueFeeder__sectionedModelObjectsRepresentationForSectionedCollection___block_invoke_3;
      v19[3] = &unk_24CAB5290;
      v20[1] = v11;
      v13 = (id *)v20;
      v20[0] = *(id *)(a1 + 32);
      objc_msgSend(v12, "enumerateItemsInSectionAtIndex:usingBlock:", a3, v19);
    }
    else
    {
      v14 = *(void **)(a1 + 48);
      v17[0] = MEMORY[0x24BDAC760];
      v17[1] = 3221225472;
      v17[2] = __82__MPCModelQueueFeeder__sectionedModelObjectsRepresentationForSectionedCollection___block_invoke_5;
      v17[3] = &unk_24CAB52D8;
      v18[1] = v11;
      v13 = (id *)v18;
      v18[0] = *(id *)(a1 + 32);
      objc_msgSend(v14, "enumerateItemIdentifiersInSectionAtIndex:usingBlock:", a3, v17);
    }

  }
}

void __82__MPCModelQueueFeeder__sectionedModelObjectsRepresentationForSectionedCollection___block_invoke_3(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  objc_msgSend(a2, "identifiers");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(objc_alloc(*(Class *)(a1 + 40)), "initWithIdentifiers:block:", v4, &__block_literal_global_226);
  objc_msgSend(*(id *)(a1 + 32), "appendItem:", v3);

}

void __82__MPCModelQueueFeeder__sectionedModelObjectsRepresentationForSectionedCollection___block_invoke_5(uint64_t a1, uint64_t a2, void *a3)
{
  objc_class *v4;
  id v5;
  id v6;

  v4 = *(objc_class **)(a1 + 40);
  v5 = a3;
  v6 = (id)objc_msgSend([v4 alloc], "initWithIdentifiers:block:", v5, &__block_literal_global_229);

  objc_msgSend(*(id *)(a1 + 32), "appendItem:", v6);
}

void __50__MPCModelQueueFeeder__endBackgroundTaskAssertion__block_invoke(uint64_t a1)
{
  _QWORD *WeakRetained;
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  int v9;
  void *v10;
  __int16 v11;
  _QWORD *v12;
  __int16 v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    v3 = WeakRetained[27] - 1;
    WeakRetained[27] = v3;
    if (!v3)
    {
      v4 = *MEMORY[0x24BE65AB8];
      if (WeakRetained[26] != *MEMORY[0x24BE65AB8])
      {
        v5 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
        if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(v2, "uniqueIdentifier");
          v6 = (void *)objc_claimAutoreleasedReturnValue();
          v7 = v2[26];
          v9 = 138543874;
          v10 = v6;
          v11 = 2048;
          v12 = v2;
          v13 = 2048;
          v14 = v7;
          _os_log_impl(&dword_210BD8000, v5, OS_LOG_TYPE_DEFAULT, "[MQF:%{public}@:%p] _endBackgroundTaskAssertion | task ended [] task.id=%lu", (uint8_t *)&v9, 0x20u);

        }
        MPSharedBackgroundTaskProvider();
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "endTask:", v2[26]);

        v2[26] = v4;
      }
    }
  }

}

void __52__MPCModelQueueFeeder__beginBackgroundTaskAssertion__block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  int v7;
  void *v8;
  __int16 v9;
  uint64_t v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v2 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    objc_msgSend(*(id *)(a1 + 32), "uniqueIdentifier");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(_QWORD *)(a1 + 40);
    v7 = 138543874;
    v8 = v3;
    v9 = 2048;
    v10 = v4;
    v11 = 2114;
    v12 = v5;
    _os_log_impl(&dword_210BD8000, v2, OS_LOG_TYPE_ERROR, "[MQF:%{public}@:%p] BackgroundTask.expirationHandler | task expired [] task.name=%{public}@", (uint8_t *)&v7, 0x20u);

  }
  MPSharedBackgroundTaskProvider();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "endTask:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 208));

  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 208) = *MEMORY[0x24BE65AB8];
}

id __56__MPCModelQueueFeeder_section_shouldShuffleExcludeItem___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;

  v3 = a2;
  v4 = objc_msgSend(v3, "indexForItem:", *(_QWORD *)(a1 + 32));
  if (v4 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v5 = 0;
  }
  else
  {
    objc_msgSend(v3, "identifierSetAtIndex:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v5;
}

id __48__MPCModelQueueFeeder_reloadSection_completion___block_invoke_220(uint64_t a1, uint64_t a2)
{
  void *v2;
  _QWORD v4[5];

  v2 = *(void **)(a1 + 32);
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __48__MPCModelQueueFeeder_reloadSection_completion___block_invoke_2_221;
  v4[3] = &__block_descriptor_40_e41__16__0__MPQueueFeederIdentifierRegistry_8l;
  v4[4] = a2;
  objc_msgSend(v2, "identifierRegistryWithExclusiveAccessReturningObject:", v4);
  return (id)objc_claimAutoreleasedReturnValue();
}

uint64_t __48__MPCModelQueueFeeder_reloadSection_completion___block_invoke_2_221(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "itemAtIndex:", *(_QWORD *)(a1 + 32));
}

uint64_t __45__MPCModelQueueFeeder_itemForItem_inSection___block_invoke_217(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 96);
  if (!v2)
  {
    objc_msgSend(MEMORY[0x24BDD15C0], "weakObjectsHashTable");
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(void **)(v4 + 96);
    *(_QWORD *)(v4 + 96) = v3;

    v2 = *(void **)(*(_QWORD *)(a1 + 32) + 96);
  }
  return objc_msgSend(v2, "addObject:", *(_QWORD *)(a1 + 40));
}

id __52__MPCModelQueueFeeder_identifiersForItem_inSection___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;

  v3 = a2;
  v4 = objc_msgSend(v3, "indexForItem:", *(_QWORD *)(a1 + 32));
  if (v4 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v5 = 0;
  }
  else
  {
    objc_msgSend(v3, "identifierSetAtIndex:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v5;
}

void __54__MPCModelQueueFeeder_loadPlaybackContext_completion___block_invoke_203(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  id v5;
  id v6;

  v3 = a2;
  v5 = *(id *)(a1 + 32);
  v6 = *(id *)(a1 + 48);
  v4 = v3;
  msv_dispatch_on_main_queue();

}

uint64_t __54__MPCModelQueueFeeder_loadPlaybackContext_completion___block_invoke_2(uint64_t a1)
{
  void *v2;

  if (objc_msgSend(*(id *)(a1 + 32), "shuffleType"))
  {
    v2 = *(void **)(a1 + 40);
    if (v2)
      objc_storeStrong((id *)(*(_QWORD *)(a1 + 48) + 160), v2);
  }
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
}

void __54__MPCModelQueueFeeder_loadPlaybackContext_completion___block_invoke_191(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  id v8;

  v8 = a2;
  if (objc_msgSend(a3, "intersectsSet:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 160)))
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
    *a4 = 1;
  }

}

id __58__MPCModelQueueFeeder_firstItemIntersectingIdentifierSet___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;

  v3 = a2;
  v4 = *(_QWORD *)(a1 + 32);
  if (v4 >= objc_msgSend(v3, "count"))
  {
    v5 = 0;
  }
  else
  {
    objc_msgSend(v3, "itemAtIndex:", *(_QWORD *)(a1 + 32));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v5;
}

uint64_t __62__MPCModelQueueFeeder_isExportableMediaTypeForItem_inSection___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "indexForItem:", *(_QWORD *)(a1 + 32));
}

uint64_t __57__MPCModelQueueFeeder_supportsAutoPlayForItem_inSection___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "indexForItem:", *(_QWORD *)(a1 + 32));
}

void __60__MPCModelQueueFeeder_controller_defersResponseReplacement___block_invoke_81(uint64_t a1)
{
  void *v2;
  id v3;
  void *v4;
  uint64_t v5;
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  _QWORD v16[5];
  id v17;
  uint64_t v18;
  _QWORD *v19;
  _QWORD *v20;
  _QWORD *v21;
  _QWORD *v22;
  uint64_t v23;
  _QWORD v24[4];
  id v25;
  id v26;
  id v27;
  uint64_t v28;
  _QWORD *v29;
  _QWORD *v30;
  _QWORD *v31;
  _QWORD *v32;
  char v33;
  char v34;
  _QWORD v35[4];
  _QWORD v36[4];
  _QWORD v37[5];
  id v38;
  _QWORD v39[5];
  id v40;
  _QWORD v41[4];
  id v42;
  id v43;

  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "results");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_alloc_init(MEMORY[0x24BDDCA88]);
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "results");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x24BDAC760];
  v41[0] = MEMORY[0x24BDAC760];
  v41[1] = 3221225472;
  v41[2] = __60__MPCModelQueueFeeder_controller_defersResponseReplacement___block_invoke_2;
  v41[3] = &unk_24CAB50A0;
  v6 = v3;
  v42 = v6;
  v7 = v4;
  v43 = v7;
  objc_msgSend(v7, "enumerateSectionIdentifiersUsingBlock:", v41);
  v39[0] = 0;
  v39[1] = v39;
  v39[2] = 0x3032000000;
  v39[3] = __Block_byref_object_copy__12799;
  v39[4] = __Block_byref_object_dispose__12800;
  v40 = 0;
  v37[0] = 0;
  v37[1] = v37;
  v37[2] = 0x3032000000;
  v37[3] = __Block_byref_object_copy__12799;
  v37[4] = __Block_byref_object_dispose__12800;
  v38 = 0;
  v36[0] = 0;
  v36[1] = v36;
  v36[2] = 0x2020000000;
  v36[3] = 0x7FFFFFFFFFFFFFFFLL;
  v35[0] = 0;
  v35[1] = v35;
  v35[2] = 0x2020000000;
  v35[3] = 0x7FFFFFFFFFFFFFFFLL;
  v8 = *(void **)(a1 + 32);
  v24[0] = v5;
  v24[1] = 3221225472;
  v24[2] = __60__MPCModelQueueFeeder_controller_defersResponseReplacement___block_invoke_4;
  v24[3] = &unk_24CAB50C8;
  v33 = *(_BYTE *)(a1 + 64);
  v29 = v36;
  v30 = v35;
  v31 = v39;
  v9 = v6;
  v25 = v9;
  v34 = *(_BYTE *)(a1 + 65);
  v10 = v2;
  v26 = v10;
  v32 = v37;
  v11 = v7;
  v12 = *(_QWORD *)(a1 + 32);
  v27 = v11;
  v28 = v12;
  objc_msgSend(v8, "identifierRegistryWithExclusiveAccess:", v24);
  v16[0] = v5;
  v16[1] = 3221225472;
  v16[2] = __60__MPCModelQueueFeeder_controller_defersResponseReplacement___block_invoke_106;
  v16[3] = &unk_24CAB5168;
  v13 = *(_QWORD *)(a1 + 32);
  v14 = *(_QWORD *)(a1 + 56);
  v18 = *(_QWORD *)(a1 + 48);
  v19 = v39;
  v20 = v37;
  v21 = v36;
  v16[4] = v13;
  v17 = v9;
  v22 = v35;
  v23 = v14;
  v15 = v9;
  dispatch_async(MEMORY[0x24BDAC9B8], v16);

  _Block_object_dispose(v35, 8);
  _Block_object_dispose(v36, 8);
  _Block_object_dispose(v37, 8);

  _Block_object_dispose(v39, 8);
}

void __60__MPCModelQueueFeeder_controller_defersResponseReplacement___block_invoke_106(uint64_t a1)
{
  void *v1;
  id v2;
  void *v3;
  id v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  __CFString *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  NSObject *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  void *v29;
  char isKindOfClass;
  void *v31;
  void *v32;
  _BOOL4 v33;
  NSObject *v34;
  void *v35;
  uint64_t v36;
  void *v37;
  void *v38;
  void *v39;
  int v40;
  void *v41;
  uint64_t v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  __CFString *v47;
  void *v48;
  uint64_t v49;
  id v50;
  void *v51;
  NSObject *v52;
  os_signpost_id_t v53;
  NSObject *v54;
  NSObject *v55;
  NSObject *v56;
  void *v57;
  uint64_t v58;
  __CFString *v59;
  int v60;
  uint64_t v61;
  void *v62;
  void *v63;
  NSObject *v64;
  NSObject *v65;
  uint64_t v66;
  uint64_t v67;
  const __CFString *v68;
  void *v69;
  NSObject *v70;
  void *v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  void *v75;
  id v76;
  void *v78;
  _QWORD v79[6];
  _QWORD v80[5];
  _QWORD v81[5];
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  _QWORD block[6];
  uint64_t v87;
  uint64_t *v88;
  uint64_t v89;
  uint64_t (*v90)(uint64_t, uint64_t);
  void (*v91)(uint64_t);
  id v92;
  _QWORD v93[5];
  id v94;
  id v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint8_t v99[128];
  _BYTE buf[24];
  const __CFString *v101;
  __int16 v102;
  uint64_t v103;
  __int16 v104;
  id v105;
  uint64_t v106;

  v106 = *MEMORY[0x24BDAC8D0];
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 232), *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40));
  v1 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
  if (v1)
  {
    v2 = v1;
LABEL_4:
    v3 = *(void **)(a1 + 32);
    v93[0] = MEMORY[0x24BDAC760];
    v93[1] = 3221225472;
    v93[2] = __60__MPCModelQueueFeeder_controller_defersResponseReplacement___block_invoke_2_107;
    v93[3] = &unk_24CAB5118;
    v96 = *(_QWORD *)(a1 + 72);
    v93[4] = v3;
    v4 = v2;
    v5 = *(_QWORD *)(a1 + 80);
    v76 = v4;
    v94 = v4;
    v97 = v5;
    v6 = *(id *)(a1 + 40);
    v7 = *(_QWORD *)(a1 + 88);
    v95 = v6;
    v98 = v7;
    objc_msgSend(v3, "identifierRegistryWithExclusiveAccess:", v93);

    goto LABEL_5;
  }
  v2 = *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40);
  if (v2)
    goto LABEL_4;
  v76 = 0;
LABEL_5:
  v8 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 32), "uniqueIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = *(_QWORD *)(a1 + 32);
    v11 = *(__CFString **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
    -[__CFString results](v11, "results");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "totalItemCount");
    *(_DWORD *)buf = 138544386;
    *(_QWORD *)&buf[4] = v9;
    *(_WORD *)&buf[12] = 2048;
    *(_QWORD *)&buf[14] = v10;
    *(_WORD *)&buf[22] = 2048;
    v101 = v11;
    v102 = 2048;
    v103 = v13;
    v104 = 2114;
    v105 = v76;
    _os_log_impl(&dword_210BD8000, v8, OS_LOG_TYPE_DEFAULT, "[MQF:%{public}@:%p] controller:defersResponseReplacement: | applying new response [] newResponse=%p totalItemCount=%ld changeDetails=%{public}@", buf, 0x34u);

  }
  v87 = 0;
  v88 = &v87;
  v89 = 0x3032000000;
  v90 = __Block_byref_object_copy__12799;
  v91 = __Block_byref_object_dispose__12800;
  v92 = 0;
  v14 = *(_QWORD *)(a1 + 32);
  v15 = *(NSObject **)(v14 + 72);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __60__MPCModelQueueFeeder_controller_defersResponseReplacement___block_invoke_116;
  block[3] = &unk_24CABAB68;
  block[4] = v14;
  block[5] = &v87;
  dispatch_sync(v15, block);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 232), "results");
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  v84 = 0u;
  v85 = 0u;
  v82 = 0u;
  v83 = 0u;
  v16 = (id)v88[5];
  v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v82, v99, 16);
  if (v17)
  {
    v18 = *(_QWORD *)v83;
    do
    {
      for (i = 0; i != v17; ++i)
      {
        if (*(_QWORD *)v83 != v18)
          objc_enumerationMutation(v16);
        v20 = *(void **)(*((_QWORD *)&v82 + 1) + 8 * i);
        v21 = *(void **)(a1 + 32);
        v81[0] = MEMORY[0x24BDAC760];
        v81[1] = 3221225472;
        v81[2] = __60__MPCModelQueueFeeder_controller_defersResponseReplacement___block_invoke_2_117;
        v81[3] = &unk_24CABA0B0;
        v81[4] = v20;
        objc_msgSend(v78, "indexPathForGlobalIndex:", objc_msgSend(v21, "identifierRegistryWithExclusiveAccessReturningInteger:", v81));
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        if (v22)
        {
          objc_msgSend(v78, "itemAtIndexPath:", v22);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x24BDDC890], "genericObjectWithModelObject:", v23);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          if (v24)
            objc_msgSend(v20, "setGenericObject:", v24);

        }
      }
      v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v82, v99, 16);
    }
    while (v17);
  }

  v25 = a1;
  v26 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40);
  if (v26)
  {
    v27 = *(_QWORD *)(a1 + 32);
    v28 = *(void **)(v27 + 176);
    v80[0] = MEMORY[0x24BDAC760];
    v80[1] = 3221225472;
    v80[2] = __60__MPCModelQueueFeeder_controller_defersResponseReplacement___block_invoke_3_118;
    v80[3] = &unk_24CABA2A8;
    v80[4] = v27;
    objc_msgSend(v28, "applyChanges:itemLookupBlock:", v26, v80);
  }
  if (objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "isFinalResponse"))
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 192), "request");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    v25 = a1;
    if ((isKindOfClass & 1) == 0)
      goto LABEL_29;
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 192), "request");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "sectionedModelObjects");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = v32 == 0;

    if (v33)
    {
      v34 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
      if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(*(id *)(a1 + 32), "uniqueIdentifier");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        v36 = *(_QWORD *)(a1 + 32);
        *(_DWORD *)buf = 138543618;
        *(_QWORD *)&buf[4] = v35;
        *(_WORD *)&buf[12] = 2048;
        *(_QWORD *)&buf[14] = v36;
        _os_log_impl(&dword_210BD8000, v34, OS_LOG_TYPE_DEFAULT, "[MQF:%{public}@:%p] controller:defersResponseReplacement: | updating Section [promoting storeRequest.storeIDs to sectionedModelObjects]", buf, 0x16u);

      }
      v37 = *(void **)(a1 + 32);
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "results");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "_sectionedModelObjectsRepresentationForSectionedCollection:", v38);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "setSectionedModelObjects:", v39);

      objc_msgSend(v31, "setStoreIDs:", 0);
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 176), "updateSection");
    }
  }
  else
  {
    objc_opt_class();
    v40 = objc_opt_isKindOfClass();
    if ((_os_feature_enabled_impl() & v40) != 1)
      goto LABEL_29;
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 120), "request");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "modelRequest");
    v31 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v31, "setPreviousResponse:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40));
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "_invalidate");
  }

  v25 = a1;
LABEL_29:
  v42 = *(_QWORD *)(v25 + 32);
  if (*(_QWORD *)(v42 + 112))
  {
    if (!*(_QWORD *)(v42 + 160))
    {
      v47 = 0;
      v44 = 0;
      goto LABEL_40;
    }
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(v25 + 48) + 8) + 40), "results");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "indexPathForItemWithIdentifiersIntersectingSet:", *(_QWORD *)(*(_QWORD *)(v25 + 32) + 160));
    v44 = (void *)objc_claimAutoreleasedReturnValue();

    if (v44)
    {
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "results");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v45, "identifiersForItemAtIndexPath:", v44);
      v46 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v46, "isPlaceholder"))
      {

      }
      else
      {
        objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "results");
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        v49 = objc_msgSend(v48, "globalIndexForIndexPath:", v44);

        if (v49 != 0x7FFFFFFFFFFFFFFFLL)
        {
          *(_QWORD *)buf = 0;
          *(_QWORD *)&buf[8] = buf;
          *(_QWORD *)&buf[16] = 0x2020000000;
          v101 = 0;
          v25 = a1;
          v69 = *(void **)(a1 + 32);
          v79[0] = MEMORY[0x24BDAC760];
          v79[1] = 3221225472;
          v79[2] = __60__MPCModelQueueFeeder_controller_defersResponseReplacement___block_invoke_127;
          v79[3] = &unk_24CAB5140;
          v79[4] = buf;
          v79[5] = v49;
          objc_msgSend(v69, "identifierRegistryWithExclusiveAccessReturningObject:", v79);
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          if (v44)
          {
            v47 = 0;
          }
          else
          {
            objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("startIndex out of bounds (startIndex/registry.count = %ld/%ld)"), v49, *(_QWORD *)(*(_QWORD *)&buf[8] + 24));
            v47 = (__CFString *)objc_claimAutoreleasedReturnValue();
          }
          _Block_object_dispose(buf, 8);
LABEL_40:
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v50 = *(id *)(*(_QWORD *)(*(_QWORD *)(v25 + 48) + 8) + 40);
            objc_msgSend(v50, "performanceMetrics");
            v51 = (void *)objc_claimAutoreleasedReturnValue();

            v25 = a1;
          }
          else
          {
            v51 = 0;
          }
          v52 = os_log_create("com.apple.amp.mediaplaybackcore", "Analytics");
          v53 = os_signpost_id_make_with_pointer(v52, *(const void **)(v25 + 32));

          if (v44
            || objc_msgSend(*(id *)(a1 + 40), "totalItemCount") >= 1 && !*(_QWORD *)(*(_QWORD *)(a1 + 32) + 160))
          {
            v54 = os_log_create("com.apple.amp.mediaplaybackcore", "Analytics");
            v55 = v54;
            if (v53 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v54))
            {
              *(_WORD *)buf = 0;
              _os_signpost_emit_with_name_impl(&dword_210BD8000, v55, OS_SIGNPOST_INTERVAL_END, v53, "ModelShimRequest", " enableTelemetry=YES ", buf, 2u);
            }

            v56 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
            if (os_log_type_enabled(v56, OS_LOG_TYPE_DEFAULT))
            {
              objc_msgSend(*(id *)(a1 + 32), "uniqueIdentifier");
              v57 = (void *)objc_claimAutoreleasedReturnValue();
              v58 = *(_QWORD *)(a1 + 32);
              v59 = *(__CFString **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
              v60 = -[__CFString isFinalResponse](v59, "isFinalResponse");
              *(_DWORD *)buf = 138544130;
              *(_QWORD *)&buf[4] = v57;
              *(_WORD *)&buf[12] = 2048;
              *(_QWORD *)&buf[14] = v58;
              *(_WORD *)&buf[22] = 2048;
              v101 = v59;
              v102 = 1024;
              LODWORD(v103) = v60;
              _os_log_impl(&dword_210BD8000, v56, OS_LOG_TYPE_DEFAULT, "[MQF:%{public}@:%p] controller:defersResponseReplacement: | calling loadingCompletionHandler [start item satisfied] newResponse=%p isFinalResponse=%{BOOL}u", buf, 0x26u);

            }
            (*(void (**)(void))(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 112) + 16))();
            v61 = *(_QWORD *)(a1 + 32);
            v62 = *(void **)(v61 + 112);
            *(_QWORD *)(v61 + 112) = 0;

            v63 = *(void **)(*(_QWORD *)(a1 + 32) + 160);
            *(_QWORD *)(*(_QWORD *)(a1 + 32) + 160) = 0;
          }
          else
          {
            if (!objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "isFinalResponse"))
              goto LABEL_51;
            v64 = os_log_create("com.apple.amp.mediaplaybackcore", "Analytics");
            v65 = v64;
            if (v53 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v64))
            {
              *(_WORD *)buf = 0;
              _os_signpost_emit_with_name_impl(&dword_210BD8000, v65, OS_SIGNPOST_INTERVAL_END, v53, "ModelShimRequest", "NoValidItems", buf, 2u);
            }

            v66 = objc_msgSend(*(id *)(a1 + 40), "totalItemCount");
            v67 = *(_QWORD *)(a1 + 32);
            if (v66)
            {
              objc_msgSend(MEMORY[0x24BDD1540], "msv_errorWithDomain:code:debugDescription:", CFSTR("MPCError"), 55, CFSTR("Failed to resolve startItemIdentifiers [%@]: %@ for %@"), v47, *(_QWORD *)(v67 + 160), *(_QWORD *)(v67 + 128));
              v63 = (void *)objc_claimAutoreleasedReturnValue();
              v68 = CFSTR("failed to resolve startItem");
            }
            else
            {
              objc_msgSend(MEMORY[0x24BDD1540], "msv_errorWithDomain:code:debugDescription:", CFSTR("MPCError"), 61, CFSTR("No valid items found [empty model response] for %@"), *(_QWORD *)(v67 + 128));
              v63 = (void *)objc_claimAutoreleasedReturnValue();
              v68 = CFSTR("empty model response");
            }
            v70 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
            if (os_log_type_enabled(v70, OS_LOG_TYPE_ERROR))
            {
              objc_msgSend(*(id *)(a1 + 32), "uniqueIdentifier");
              v71 = (void *)objc_claimAutoreleasedReturnValue();
              v72 = *(_QWORD *)(a1 + 32);
              v73 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
              *(_DWORD *)buf = 138544386;
              *(_QWORD *)&buf[4] = v71;
              *(_WORD *)&buf[12] = 2048;
              *(_QWORD *)&buf[14] = v72;
              *(_WORD *)&buf[22] = 2114;
              v101 = v68;
              v102 = 2048;
              v103 = v73;
              v104 = 2114;
              v105 = v63;
              _os_log_impl(&dword_210BD8000, v70, OS_LOG_TYPE_ERROR, "[MQF:%{public}@:%p] controller:defersResponseReplacement: | calling loadingCompletionHandler with error [%{public}@] newResponse=%p isFinalResponse=YES error=%{public}@", buf, 0x34u);

            }
            (*(void (**)(void))(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 112) + 16))();
            v74 = *(_QWORD *)(a1 + 32);
            v75 = *(void **)(v74 + 112);
            *(_QWORD *)(v74 + 112) = 0;

          }
LABEL_51:

          v42 = *(_QWORD *)(a1 + 32);
          goto LABEL_52;
        }
      }
      v47 = 0;
      v44 = 0;
    }
    else
    {
      v47 = CFSTR("indexPathForItemWithIdentifiersIntersectingSet returned nil");
    }
    v25 = a1;
    goto LABEL_40;
  }
LABEL_52:
  objc_msgSend(*(id *)(v42 + 88), "unlock");

  _Block_object_dispose(&v87, 8);
}

void __60__MPCModelQueueFeeder_controller_defersResponseReplacement___block_invoke_2_107(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  id v12;
  NSObject *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  id v19;
  uint64_t v20;
  void *v21;
  _QWORD v22[4];
  id v23;
  uint64_t v24;
  id v25;
  uint64_t v26;
  id v27;
  uint8_t buf[4];
  void *v29;
  __int16 v30;
  uint64_t v31;
  __int16 v32;
  id v33;
  __int16 v34;
  uint64_t v35;
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24);
  if (v4 != objc_msgSend(v3, "count"))
  {
    v5 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(*(id *)(a1 + 32), "uniqueIdentifier");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = *(_QWORD *)(a1 + 32);
      v8 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24);
      *(_DWORD *)buf = 138544130;
      v29 = v6;
      v30 = 2048;
      v31 = v7;
      v32 = 2048;
      v33 = v8;
      v34 = 2048;
      v35 = objc_msgSend(v3, "count");
      _os_log_impl(&dword_210BD8000, v5, OS_LOG_TYPE_ERROR, "[MQF:%{public}@:%p] defersResponseReplacement | change details out of sync [identifierRegistry count mismatch] countDuringDiff=%ld countDuringApply=%ld", buf, 0x2Au);

    }
  }
  v9 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24);
  v10 = *(void **)(a1 + 40);
  v11 = objc_msgSend(*(id *)(a1 + 48), "totalItemCount");
  v27 = 0;
  LOBYTE(v10) = objc_msgSend(v10, "isValidForPreviousCount:finalCount:reason:", v9, v11, &v27);
  v12 = v27;
  if ((v10 & 1) == 0)
  {
    v13 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(*(id *)(a1 + 32), "uniqueIdentifier");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = *(_QWORD *)(a1 + 32);
      v16 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 138544130;
      v29 = v14;
      v30 = 2048;
      v31 = v15;
      v32 = 2114;
      v33 = v12;
      v34 = 2114;
      v35 = v16;
      _os_log_impl(&dword_210BD8000, v13, OS_LOG_TYPE_ERROR, "[MQF:%{public}@:%p] defersResponseReplacement | crashing [invalid change details] reason=%{public}@ changeDetails=%{public}@", buf, 0x2Au);

    }
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 32), CFSTR("MPCModelQueueFeeder.m"), 494, CFSTR("%@"), v12);

  }
  v22[0] = MEMORY[0x24BDAC760];
  v22[1] = 3221225472;
  v22[2] = __60__MPCModelQueueFeeder_controller_defersResponseReplacement___block_invoke_110;
  v22[3] = &unk_24CAB50F0;
  v18 = *(_QWORD *)(a1 + 40);
  v19 = *(id *)(a1 + 48);
  v26 = *(_QWORD *)(a1 + 72);
  v20 = *(_QWORD *)(a1 + 32);
  v21 = *(void **)(a1 + 40);
  v23 = v19;
  v24 = v20;
  v25 = v21;
  objc_msgSend(v3, "applyChanges:identifierSetLookupBlock:", v18, v22);

}

void __60__MPCModelQueueFeeder_controller_defersResponseReplacement___block_invoke_116(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 96), "copy");
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

uint64_t __60__MPCModelQueueFeeder_controller_defersResponseReplacement___block_invoke_2_117(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  uint64_t v5;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "queueIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "indexForItem:", v4);

  return v5;
}

id __60__MPCModelQueueFeeder_controller_defersResponseReplacement___block_invoke_3_118(uint64_t a1, uint64_t a2)
{
  void *v2;
  _QWORD v4[5];

  v2 = *(void **)(a1 + 32);
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __60__MPCModelQueueFeeder_controller_defersResponseReplacement___block_invoke_4_119;
  v4[3] = &__block_descriptor_40_e41__16__0__MPQueueFeederIdentifierRegistry_8l;
  v4[4] = a2;
  objc_msgSend(v2, "identifierRegistryWithExclusiveAccessReturningObject:", v4);
  return (id)objc_claimAutoreleasedReturnValue();
}

id __60__MPCModelQueueFeeder_controller_defersResponseReplacement___block_invoke_127(uint64_t a1, void *a2)
{
  id v3;
  void *v4;

  v3 = a2;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_msgSend(v3, "count");
  if (*(_QWORD *)(a1 + 40) >= *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    v4 = 0;
  }
  else
  {
    objc_msgSend(v3, "itemAtIndex:");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v4;
}

uint64_t __60__MPCModelQueueFeeder_controller_defersResponseReplacement___block_invoke_4_119(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "itemAtIndex:", *(_QWORD *)(a1 + 32));
}

id __60__MPCModelQueueFeeder_controller_defersResponseReplacement___block_invoke_110(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  void *v7;
  void *v8;

  objc_msgSend(*(id *)(a1 + 32), "indexPathForGlobalIndex:", a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 40), CFSTR("MPCModelQueueFeeder.m"), 498, CFSTR("Unable to apply changes [missing identifier set in new collection] index=%ld/%ld changeDetails=%@"), a2, objc_msgSend(*(id *)(a1 + 32), "totalItemCount"), *(_QWORD *)(a1 + 48));

  }
  objc_msgSend(*(id *)(a1 + 32), "itemAtIndexPath:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 40), CFSTR("MPCModelQueueFeeder.m"), 500, CFSTR("newCollection failed to produce identifierSet for indexPath: %@"), v4);

  }
  return v5;
}

uint64_t __60__MPCModelQueueFeeder_controller_defersResponseReplacement___block_invoke_7(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;

  v5 = *(void **)(a1 + 32);
  objc_msgSend(v5, "indexPathForGlobalIndex:", a2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "identifiersForItemAtIndexPath:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = *(void **)(a1 + 40);
  objc_msgSend(v8, "indexPathForGlobalIndex:", a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "itemAtIndexPath:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = objc_msgSend(v7, "intersectsSet:", v10);
  return v11;
}

uint64_t __60__MPCModelQueueFeeder_controller_defersResponseReplacement___block_invoke_8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  int v10;

  objc_msgSend(*(id *)(a1 + 32), "identifierSetAtIndex:", a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *(void **)(a1 + 40);
  objc_msgSend(v6, "indexPathForGlobalIndex:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "itemAtIndexPath:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v6) = objc_msgSend(v5, "shouldExcludeFromShuffle");
  if ((_DWORD)v6 == objc_msgSend(v8, "shouldExcludeFromShuffle"))
  {
    v10 = objc_msgSend(v5, "isPlaceholder");
    v9 = v10 ^ objc_msgSend(v8, "isPlaceholder");
  }
  else
  {
    v9 = 1;
  }

  return v9;
}

intptr_t __60__MPCModelQueueFeeder_controller_defersResponseReplacement___block_invoke_9(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __68__MPCModelQueueFeeder_controller_shouldRetryFailedRequestWithError___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = *(_QWORD *)(a1[4] + 112);
  if (v2)
  {
    (*(void (**)(uint64_t, _QWORD, _QWORD, _QWORD))(v2 + 16))(v2, 0, 0, a1[5]);
    v3 = a1[4];
    v4 = *(void **)(v3 + 112);
    *(_QWORD *)(v3 + 112) = 0;

  }
  else
  {
    *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = 1;
  }
}

void __89__MPCModelQueueFeeder_getRepresentativeMetadataForPlaybackContext_properties_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  id v14;

  v14 = a2;
  v5 = a3;
  if (objc_msgSend(*(id *)(a1 + 32), "shuffleType"))
  {
    v6 = (void *)MEMORY[0x24BDDC890];
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 232), "results");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "firstSection");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "genericObjectWithModelObject:", v8);
    v9 = (id)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      v10 = 0;
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD1540], "msv_errorWithDomain:code:debugDescription:", CFSTR("MPCError"), 1, CFSTR("Unable to obtain metadata for shuffled context: %@"), *(_QWORD *)(a1 + 32), v14);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
  else
  {
    v9 = v14;
    if (!v9)
    {
      objc_msgSend(*(id *)(a1 + 40), "identifierRegistryWithExclusiveAccessReturningObject:", &__block_literal_global_12880);
      v9 = (id)objc_claimAutoreleasedReturnValue();
      if (!v9)
      {
        v13 = *(_QWORD *)(a1 + 48);
        objc_msgSend(MEMORY[0x24BDD1540], "msv_errorWithDomain:code:debugDescription:", CFSTR("MPCError"), 1, CFSTR("No start item was found for playback context: %@"), *(_QWORD *)(a1 + 32));
        v9 = (id)objc_claimAutoreleasedReturnValue();
        (*(void (**)(uint64_t, _QWORD, id, id))(v13 + 16))(v13, 0, v5, v9);
        goto LABEL_13;
      }
    }
    objc_msgSend(*(id *)(a1 + 40), "itemForItem:inSection:", v9, CFSTR("<REPRESENTATIVE ITEM LOADER>"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "modelGenericObject");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      v12 = 0;
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD1540], "msv_errorWithDomain:code:debugDescription:", CFSTR("MPCError"), 1, CFSTR("Could not convert startItem into metadata: %@"), v10);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

  }
LABEL_13:

}

id __89__MPCModelQueueFeeder_getRepresentativeMetadataForPlaybackContext_properties_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  void *v3;

  v2 = a2;
  if (objc_msgSend(v2, "count"))
  {
    objc_msgSend(v2, "itemAtIndex:", 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

void __61__MPCModelQueueFeeder_supplementalPlaybackContextWithReason___block_invoke(uint64_t a1, uint64_t a2, void *a3, _BYTE *a4)
{
  void *v7;
  id v8;
  _QWORD v9[5];

  objc_msgSend(a3, "preferredStoreStringIdentifierForPersonID:", 0);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "length"))
  {
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v8);
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __61__MPCModelQueueFeeder_supplementalPlaybackContextWithReason___block_invoke_2;
    v9[3] = &unk_24CAB5008;
    v7 = *(void **)(a1 + 40);
    v9[4] = *(_QWORD *)(a1 + 48);
    objc_msgSend(v7, "enumerateItemIdentifiersInSectionAtIndex:usingBlock:", a2, v9);
  }
  else
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
  }
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
    *a4 = 1;

}

void __61__MPCModelQueueFeeder_supplementalPlaybackContextWithReason___block_invoke_2(uint64_t a1, uint64_t a2, void *a3, _BYTE *a4)
{
  id v6;

  objc_msgSend(a3, "preferredStoreStringIdentifierForPersonID:", 0);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v6, "length"))
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
    *a4 = 1;
  }

}

void __43__MPCModelQueueFeeder_playbackInfoForItem___block_invoke(_QWORD *a1, void *a2, void *a3, _BYTE *a4)
{
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  id v12;

  v12 = a2;
  v7 = a3;
  if (objc_msgSend(v12, "intersectsSet:", a1[4]))
  {
    objc_storeStrong((id *)(*(_QWORD *)(a1[5] + 8) + 40), a3);
    *a4 = 1;
  }
  else if (a1[7])
  {
    objc_msgSend(v12, "universalStore");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v8, "adamID") == a1[7])
    {

    }
    else
    {
      objc_msgSend(v12, "universalStore");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "subscriptionAdamID");
      v11 = a1[7];

      if (v10 != v11)
        goto LABEL_8;
    }
    objc_storeStrong((id *)(*(_QWORD *)(a1[6] + 8) + 40), a3);
  }
LABEL_8:

}

void __43__MPCModelQueueFeeder_playbackInfoForItem___block_invoke_9(_QWORD *a1, void *a2, void *a3, _BYTE *a4)
{
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  id v12;

  v12 = a2;
  v7 = a3;
  if (objc_msgSend(v12, "intersectsSet:", a1[4]))
  {
    objc_storeStrong((id *)(*(_QWORD *)(a1[5] + 8) + 40), a3);
    *a4 = 1;
  }
  else if (a1[7])
  {
    objc_msgSend(v12, "universalStore");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v8, "adamID") == a1[7])
    {

    }
    else
    {
      objc_msgSend(v12, "universalStore");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "subscriptionAdamID");
      v11 = a1[7];

      if (v10 != v11)
        goto LABEL_8;
    }
    objc_storeStrong((id *)(*(_QWORD *)(a1[6] + 8) + 40), a3);
  }
LABEL_8:

}

@end
