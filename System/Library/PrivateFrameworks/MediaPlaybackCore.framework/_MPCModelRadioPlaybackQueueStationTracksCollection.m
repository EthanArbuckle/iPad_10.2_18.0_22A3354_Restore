@implementation _MPCModelRadioPlaybackQueueStationTracksCollection

- (_MPCModelRadioPlaybackQueueStationTracksCollection)initWithPlaybackContext:(id)a3
{
  id v4;
  _MPCModelRadioPlaybackQueueStationTracksCollection *v5;
  dispatch_queue_t v6;
  OS_dispatch_queue *accessQueue;
  void *v8;
  uint64_t v9;
  MPCPlaybackRequestEnvironment *playbackRequestEnvironment;
  void *v11;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)_MPCModelRadioPlaybackQueueStationTracksCollection;
  v5 = -[_MPCModelRadioPlaybackQueueStationTracksCollection init](&v13, sel_init);
  if (v5)
  {
    v6 = dispatch_queue_create("com.apple.MediaPlaybackCore.MPCModelRadioPlaybackQueue.accessQueue.StationTracksSection", MEMORY[0x24BDAC9C0]);
    accessQueue = v5->_accessQueue;
    v5->_accessQueue = (OS_dispatch_queue *)v6;

    objc_msgSend(v4, "siriReferenceIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_isSiriInitiated = v8 != 0;

    objc_msgSend(v4, "playbackRequestEnvironment");
    v9 = objc_claimAutoreleasedReturnValue();
    playbackRequestEnvironment = v5->_playbackRequestEnvironment;
    v5->_playbackRequestEnvironment = (MPCPlaybackRequestEnvironment *)v9;

    objc_msgSend(v4, "queueDescriptor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_prioritizeStartupOverQuality = objc_msgSend(v11, "prioritizeStartupOverQuality");

  }
  return v5;
}

- (void)updateWithPersonalizedResponse:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  MPPropertySet *v7;
  MPPropertySet *itemProperties;
  MPSectionedCollection *v9;
  MPSectionedCollection *trackModels;
  MPSectionedCollection *v11;
  MPSectionedCollection *tracks;
  NSObject *accessQueue;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _QWORD block[6];
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t (*v32)(uint64_t, uint64_t);
  void (*v33)(uint64_t);
  id v34;
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "results");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "radioStationTracks");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "request");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "itemProperties");
  v7 = (MPPropertySet *)objc_claimAutoreleasedReturnValue();
  itemProperties = self->_itemProperties;
  self->_itemProperties = v7;

  v9 = (MPSectionedCollection *)objc_msgSend(v5, "copy");
  trackModels = self->_trackModels;
  self->_trackModels = v9;

  v11 = (MPSectionedCollection *)objc_msgSend(v23, "copy");
  tracks = self->_tracks;
  self->_tracks = v11;

  v29 = 0;
  v30 = &v29;
  v31 = 0x3032000000;
  v32 = __Block_byref_object_copy__27759;
  v33 = __Block_byref_object_dispose__27760;
  v34 = 0;
  accessQueue = self->_accessQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __85___MPCModelRadioPlaybackQueueStationTracksCollection_updateWithPersonalizedResponse___block_invoke;
  block[3] = &unk_24CABAB68;
  block[4] = self;
  block[5] = &v29;
  dispatch_sync(accessQueue, block);
  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  v14 = (id)v30[5];
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v24, v35, 16);
  if (v15)
  {
    v16 = *(_QWORD *)v25;
    do
    {
      for (i = 0; i != v15; ++i)
      {
        if (*(_QWORD *)v25 != v16)
          objc_enumerationMutation(v14);
        v18 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
        objc_msgSend(v18, "genericObject");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "identifiers");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "indexPathForItemWithIdentifiersIntersectingSet:", v20);
        v21 = (void *)objc_claimAutoreleasedReturnValue();

        if (v21)
        {
          objc_msgSend(v5, "itemAtIndexPath:", v21);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          if (v22)
            objc_msgSend(v18, "setGenericObject:", v22);

        }
      }
      v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v24, v35, 16);
    }
    while (v15);
  }

  _Block_object_dispose(&v29, 8);
}

- (id)AVItemAtIndex:(int64_t)a3
{
  void *v4;
  void *v5;
  MPCModelGenericAVItem *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  NSObject *accessQueue;
  MPCModelGenericAVItem *v18;
  _QWORD v20[6];

  objc_msgSend(MEMORY[0x24BDD15D8], "indexPathForItem:inSection:", a3, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPSectionedCollection itemAtIndexPath:](self->_trackModels, "itemAtIndexPath:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[MPCModelGenericAVItem initWithGenericObject:itemProperties:playbackRequestEnvironment:identityPropertySet:]([MPCModelGenericAVItem alloc], "initWithGenericObject:itemProperties:playbackRequestEnvironment:identityPropertySet:", v5, self->_itemProperties, self->_playbackRequestEnvironment, self->_identityPropertySet);
  -[MPCPlaybackRequestEnvironment userIdentity](self->_playbackRequestEnvironment, "userIdentity");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[MPCMediaLibraryPlaybackAssetCacheProvider deviceLibraryProviderWithUserIdentity:](MPCMediaLibraryPlaybackAssetCacheProvider, "deviceLibraryProviderWithUserIdentity:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPCModelGenericAVItem setAssetCacheProvider:](v6, "setAssetCacheProvider:", v8);

  -[MPCModelGenericAVItem setRadioPlayback:](v6, "setRadioPlayback:", 1);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_isSiriInitiated);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPCModelGenericAVItem setSiriInitiated:](v6, "setSiriInitiated:", v9);

  -[MPCModelGenericAVItem setPrioritizeStartupOverQuality:](v6, "setPrioritizeStartupOverQuality:", self->_prioritizeStartupOverQuality);
  -[MPSectionedCollection itemAtIndexPath:](self->_tracks, "itemAtIndexPath:", v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPSectionedCollection sectionAtIndex:](self->_tracks, "sectionAtIndex:", objc_msgSend(v4, "section"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v10, "trackType");
  -[MPCModelGenericAVItem setRadioStreamPlayback:](v6, "setRadioStreamPlayback:", v12 == 4);
  -[MPCModelGenericAVItem setSubscriptionRequired:](v6, "setSubscriptionRequired:", objc_msgSend(v11, "isSubscriptionRequired"));
  objc_msgSend(v10, "serverTrackInfo");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPCModelGenericAVItem setTrackInfo:](v6, "setTrackInfo:", v13);

  if (v12 == 1)
  {
    v14 = objc_msgSend(v10, "likeState");
    v15 = 3;
    if (v14 != -1)
      v15 = 1;
    if (v14 == 1)
      v16 = 2;
    else
      v16 = v15;
    -[MPCModelGenericAVItem setStationItemLikedState:](v6, "setStationItemLikedState:", v16);
  }
  accessQueue = self->_accessQueue;
  v20[0] = MEMORY[0x24BDAC760];
  v20[1] = 3221225472;
  v20[2] = __68___MPCModelRadioPlaybackQueueStationTracksCollection_AVItemAtIndex___block_invoke;
  v20[3] = &unk_24CABA1D0;
  v20[4] = self;
  v20[5] = v6;
  dispatch_barrier_sync(accessQueue, v20);
  v18 = v6;

  return v18;
}

- (BOOL)isExplicitItemAtIndex:(int64_t)a3
{
  void *v5;
  char v6;
  char v7;
  void *v8;
  void *v9;
  MPSectionedCollection *tracks;
  void *v11;
  _QWORD v13[6];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t v17;

  -[_MPCModelRadioPlaybackQueueStationTracksCollection AVItemAtIndex:](self, "AVItemAtIndex:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isExplicitTrack");

  if ((v6 & 1) != 0)
    return 1;
  -[_MPCModelRadioPlaybackQueueStationTracksCollection trackForItemAtIndex:](self, "trackForItemAtIndex:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "parentTrack");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = 0;
  v15 = &v14;
  v16 = 0x2020000000;
  v17 = 0x7FFFFFFFFFFFFFFFLL;
  if (!v9)
    goto LABEL_5;
  tracks = self->_tracks;
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __76___MPCModelRadioPlaybackQueueStationTracksCollection_isExplicitItemAtIndex___block_invoke;
  v13[3] = &unk_24CAB9988;
  v13[4] = v9;
  v13[5] = &v14;
  -[MPSectionedCollection enumerateItemsUsingBlock:](tracks, "enumerateItemsUsingBlock:", v13);
  if (v15[3] != 0x7FFFFFFFFFFFFFFFLL)
  {
    -[_MPCModelRadioPlaybackQueueStationTracksCollection AVItemAtIndex:](self, "AVItemAtIndex:");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v11, "isExplicitTrack");

  }
  else
  {
LABEL_5:
    v7 = 0;
  }
  _Block_object_dispose(&v14, 8);

  return v7;
}

- (int64_t)numberOfItems
{
  return -[MPSectionedCollection totalItemCount](self->_trackModels, "totalItemCount");
}

- (void)removeAllItems
{
  MPSectionedCollection *v3;
  MPSectionedCollection *trackModels;
  MPSectionedCollection *v5;
  MPSectionedCollection *tracks;

  v3 = (MPSectionedCollection *)objc_alloc_init(MEMORY[0x24BDDCA88]);
  trackModels = self->_trackModels;
  self->_trackModels = v3;

  v5 = (MPSectionedCollection *)objc_alloc_init(MEMORY[0x24BDDCA88]);
  tracks = self->_tracks;
  self->_tracks = v5;

}

- (int64_t)removeExplicitItems
{
  id v3;
  id v4;
  id v5;
  MPSectionedCollection *trackModels;
  int64_t v7;
  _QWORD v9[9];
  _QWORD v10[4];

  v3 = objc_alloc_init(MEMORY[0x24BDDCA88]);
  v4 = objc_alloc_init(MEMORY[0x24BDDCA88]);
  v5 = objc_alloc_init(MEMORY[0x24BDD1698]);
  v10[0] = 0;
  v10[1] = v10;
  v10[2] = 0x2020000000;
  trackModels = self->_trackModels;
  v10[3] = 0;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __73___MPCModelRadioPlaybackQueueStationTracksCollection_removeExplicitItems__block_invoke;
  v9[3] = &unk_24CAB99D8;
  v9[4] = v3;
  v9[5] = v4;
  v9[7] = v5;
  v9[8] = v10;
  v9[6] = self;
  -[MPSectionedCollection enumerateSectionsUsingBlock:](trackModels, "enumerateSectionsUsingBlock:", v9);
  v7 = objc_msgSend(v5, "count");
  if (v7 >= 1)
  {
    objc_storeStrong((id *)&self->_trackModels, v3);
    objc_storeStrong((id *)&self->_tracks, v4);
  }
  _Block_object_dispose(v10, 8);

  return v7;
}

- (id)trackForItemAtIndex:(int64_t)a3
{
  MPSectionedCollection *tracks;
  void *v4;
  void *v5;

  tracks = self->_tracks;
  objc_msgSend(MEMORY[0x24BDD15D8], "indexPathForItem:inSection:", a3, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPSectionedCollection itemAtIndexPath:](tracks, "itemAtIndexPath:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (MPSectionedCollection)trackModels
{
  return self->_trackModels;
}

- (MPSectionedCollection)tracks
{
  return self->_tracks;
}

- (MPCModelGenericAVItemUserIdentityPropertySet)identityPropertySet
{
  return self->_identityPropertySet;
}

- (void)setIdentityPropertySet:(id)a3
{
  objc_storeStrong((id *)&self->_identityPropertySet, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identityPropertySet, 0);
  objc_storeStrong((id *)&self->_tracks, 0);
  objc_storeStrong((id *)&self->_trackModels, 0);
  objc_storeStrong((id *)&self->_playbackRequestEnvironment, 0);
  objc_storeStrong((id *)&self->_itemProperties, 0);
  objc_storeStrong((id *)&self->_activeModelGenericAVItems, 0);
  objc_storeStrong((id *)&self->_accessQueue, 0);
}

@end
