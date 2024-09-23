@implementation MPCModelRadioPlaybackQueue

- (MPCModelRadioPlaybackQueue)initWithPlaybackContext:(id)a3
{
  id v4;
  MPCModelRadioPlaybackQueue *v5;
  _MPCModelRadioPlaybackQueueStationTracksCollection *v6;
  _MPCModelRadioPlaybackQueueStationTracksCollection *stationTracks;
  void *v8;
  uint64_t v9;
  ICStoreRequestContext *storeRequestContext;
  void *v11;
  uint64_t v12;
  MPModelRadioStation *radioStation;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)MPCModelRadioPlaybackQueue;
  v5 = -[MPCModelRadioPlaybackQueue init](&v15, sel_init);
  if (v5)
  {
    v6 = -[_MPCModelRadioPlaybackQueueStationTracksCollection initWithPlaybackContext:]([_MPCModelRadioPlaybackQueueStationTracksCollection alloc], "initWithPlaybackContext:", v4);
    stationTracks = v5->_stationTracks;
    v5->_stationTracks = v6;

    objc_msgSend(v4, "playbackRequestEnvironment");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "_createStoreRequestContext");
    v9 = objc_claimAutoreleasedReturnValue();
    storeRequestContext = v5->_storeRequestContext;
    v5->_storeRequestContext = (ICStoreRequestContext *)v9;

    objc_msgSend(v4, "radioStation");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      objc_msgSend(v4, "radioStation");
      v12 = objc_claimAutoreleasedReturnValue();
      radioStation = v5->_radioStation;
      v5->_radioStation = (MPModelRadioStation *)v12;

    }
  }

  return v5;
}

- (MPCModelGenericAVItemUserIdentityPropertySet)identityPropertySet
{
  return -[_MPCModelRadioPlaybackQueueStationTracksCollection identityPropertySet](self->_stationTracks, "identityPropertySet");
}

- (void)setIdentityPropertySet:(id)a3
{
  -[_MPCModelRadioPlaybackQueueStationTracksCollection setIdentityPropertySet:](self->_stationTracks, "setIdentityPropertySet:", a3);
}

- (id)AVItemAtIndex:(int64_t)a3
{
  _MPCModelRadioPlaybackQueueStationTracksCollection *stationTracks;
  void *v6;
  NSObject *v7;
  int v9;
  MPCModelRadioPlaybackQueue *v10;
  __int16 v11;
  int64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  stationTracks = self->_stationTracks;
  if (stationTracks)
  {
    -[_MPCModelRadioPlaybackQueueStationTracksCollection AVItemAtIndex:](stationTracks, "AVItemAtIndex:", a3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v9 = 138543618;
      v10 = self;
      v11 = 2048;
      v12 = a3;
      _os_log_impl(&dword_210BD8000, v7, OS_LOG_TYPE_ERROR, "%{public}@ AVItemAtIndex: returning nil [no stationTracks] globalIndex=%ld", (uint8_t *)&v9, 0x16u);
    }

    v6 = 0;
  }
  return v6;
}

- (BOOL)isExplicitItemAtIndex:(int64_t)a3
{
  return -[_MPCModelRadioPlaybackQueueStationTracksCollection isExplicitItemAtIndex:](self->_stationTracks, "isExplicitItemAtIndex:", a3);
}

- (int64_t)numberOfItems
{
  return -[_MPCModelRadioPlaybackQueueStationTracksCollection numberOfItems](self->_stationTracks, "numberOfItems");
}

- (void)removeAllItems
{
  -[_MPCModelRadioPlaybackQueueStationTracksCollection removeAllItems](self->_stationTracks, "removeAllItems");
}

- (int64_t)removeExplicitItems
{
  return -[_MPCModelRadioPlaybackQueueStationTracksCollection removeExplicitItems](self->_stationTracks, "removeExplicitItems");
}

- (MPSectionedCollection)trackModels
{
  return -[_MPCModelRadioPlaybackQueueStationTracksCollection trackModels](self->_stationTracks, "trackModels");
}

- (id)trackForItemAtIndex:(int64_t)a3
{
  return -[_MPCModelRadioPlaybackQueueStationTracksCollection trackForItemAtIndex:](self->_stationTracks, "trackForItemAtIndex:", a3);
}

- (MPSectionedCollection)tracks
{
  return -[_MPCModelRadioPlaybackQueueStationTracksCollection tracks](self->_stationTracks, "tracks");
}

- (id)tracksByApplyingTracksResponse:(id)a3 currentIndex:(int64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD *v13;
  _QWORD v15[5];
  _QWORD v16[6];
  _QWORD v17[5];

  v6 = a3;
  -[MPCModelRadioPlaybackQueue tracks](self, "tracks");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "tracks");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "totalItemCount"))
  {
    v9 = objc_alloc_init(MEMORY[0x24BDDCA88]);
    objc_msgSend(v8, "firstSection");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "appendSection:", v10);

    v11 = objc_msgSend(v6, "tracklistAction");
    v12 = MEMORY[0x24BDAC760];
    if (v11 == 1)
    {
      if (a4 != 0x7FFFFFFFFFFFFFFFLL)
      {
        v16[0] = MEMORY[0x24BDAC760];
        v16[1] = 3221225472;
        v16[2] = __74__MPCModelRadioPlaybackQueue_tracksByApplyingTracksResponse_currentIndex___block_invoke_2;
        v16[3] = &unk_24CAB9960;
        v16[4] = v9;
        v16[5] = a4;
        v13 = v16;
        goto LABEL_8;
      }
    }
    else if (!v11)
    {
      v17[0] = MEMORY[0x24BDAC760];
      v17[1] = 3221225472;
      v17[2] = __74__MPCModelRadioPlaybackQueue_tracksByApplyingTracksResponse_currentIndex___block_invoke;
      v17[3] = &unk_24CAB9938;
      v17[4] = v9;
      v13 = v17;
LABEL_8:
      objc_msgSend(v7, "enumerateItemsUsingBlock:", v13);
    }
    v15[0] = v12;
    v15[1] = 3221225472;
    v15[2] = __74__MPCModelRadioPlaybackQueue_tracksByApplyingTracksResponse_currentIndex___block_invoke_3;
    v15[3] = &unk_24CAB9938;
    v15[4] = v9;
    objc_msgSend(v8, "enumerateItemsUsingBlock:", v15);
    goto LABEL_10;
  }
  v9 = v8;
LABEL_10:

  return v9;
}

- (void)updateWithPersonalizedResponse:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  objc_msgSend(v4, "results");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "firstSection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPCModelRadioPlaybackQueue setRadioStation:](self, "setRadioStation:", v5);

  -[_MPCModelRadioPlaybackQueueStationTracksCollection updateWithPersonalizedResponse:](self->_stationTracks, "updateWithPersonalizedResponse:", v4);
}

- (MPModelRadioStation)radioStation
{
  return self->_radioStation;
}

- (void)setRadioStation:(id)a3
{
  objc_storeStrong((id *)&self->_radioStation, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stationTracks, 0);
  objc_storeStrong((id *)&self->_radioStation, 0);
  objc_storeStrong((id *)&self->_storeRequestContext, 0);
}

uint64_t __74__MPCModelRadioPlaybackQueue_tracksByApplyingTracksResponse_currentIndex___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "appendItem:", a2);
}

void __74__MPCModelRadioPlaybackQueue_tracksByApplyingTracksResponse_currentIndex___block_invoke_2(uint64_t a1, uint64_t a2, void *a3, BOOL *a4)
{
  void *v7;
  id v8;
  uint64_t v9;

  v7 = *(void **)(a1 + 32);
  v8 = a3;
  objc_msgSend(v7, "appendItem:", a2);
  v9 = objc_msgSend(v8, "item");

  *a4 = v9 == *(_QWORD *)(a1 + 40);
}

uint64_t __74__MPCModelRadioPlaybackQueue_tracksByApplyingTracksResponse_currentIndex___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "appendItem:", a2);
}

@end
