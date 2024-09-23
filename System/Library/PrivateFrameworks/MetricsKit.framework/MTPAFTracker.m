@implementation MTPAFTracker

- (void)trackPlaylist:(id)a3 using:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  MTPAFTracker *v10;
  NSArray *videoTrackers;
  uint64_t v12;
  MTPAFPlaylistKitBinding *v13;
  MTPAFTracker *v14;
  NSArray *playlistBindings;
  uint64_t v16;
  NSArray *v17;
  NSArray *v18;
  uint64_t v19;
  NSArray *v20;
  _QWORD v21[2];

  v21[1] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v6, "conformsToProtocol:", &unk_2549CB738))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", CFSTR("NotSupported"), CFSTR("%@ cannot be used to handle video events on a MTMediaPlaylist. Please use MTVPAFKit instead."), objc_opt_class());
    v8 = v7;
    objc_msgSend(v8, "trackerWithPlayList:", v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = self;
    objc_sync_enter(v10);
    videoTrackers = v10->_videoTrackers;
    if (videoTrackers)
      -[NSArray arrayByAddingObject:](videoTrackers, "arrayByAddingObject:", v9);
    else
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObject:", v9);
    v12 = objc_claimAutoreleasedReturnValue();
    v18 = v10->_videoTrackers;
    v10->_videoTrackers = (NSArray *)v12;

    objc_sync_exit(v10);
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v13 = objc_alloc_init(MTPAFPlaylistKitBinding);
      -[MTPAFPlaylistKitBinding setPlaylist:](v13, "setPlaylist:", v6);
      -[MTPAFPlaylistKitBinding setPafKit:](v13, "setPafKit:", v7);
      v14 = self;
      objc_sync_enter(v14);
      playlistBindings = v14->_playlistBindings;
      if (playlistBindings)
      {
        -[NSArray arrayByAddingObject:](playlistBindings, "arrayByAddingObject:", v13);
        v16 = objc_claimAutoreleasedReturnValue();
        v17 = v14->_playlistBindings;
        v14->_playlistBindings = (NSArray *)v16;

      }
      else
      {
        v21[0] = v13;
        objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v21, 1);
        v19 = objc_claimAutoreleasedReturnValue();
        v20 = v14->_playlistBindings;
        v14->_playlistBindings = (NSArray *)v19;

      }
      objc_sync_exit(v14);

    }
    else
    {
      objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", CFSTR("NotSupported"), CFSTR("Unsupported playlist type: %@."), objc_opt_class());
    }
  }

}

- (void)playStartedWithPlaybackRate:(float)a3 atSeconds:(double)a4 type:(id)a5 reason:(id)a6 eventData:(id)a7
{
  -[MTPAFTracker playStartedWithPlaybackRate:atMilliseconds:type:reason:eventData:](self, "playStartedWithPlaybackRate:atMilliseconds:type:reason:eventData:", (unint64_t)(a4 * 1000.0), a5, a6, a7);
}

- (void)playStartedWithPlaybackRate:(float)a3 atMilliseconds:(unint64_t)a4 type:(id)a5 reason:(id)a6 eventData:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  double v18;
  _QWORD v19[4];
  id v20;
  id v21;
  id v22;
  unint64_t v23;
  float v24;

  v12 = a5;
  v13 = a6;
  v14 = a7;
  v19[0] = MEMORY[0x24BDAC760];
  v19[1] = 3221225472;
  v19[2] = __81__MTPAFTracker_playStartedWithPlaybackRate_atMilliseconds_type_reason_eventData___block_invoke;
  v19[3] = &unk_24C7A1550;
  v24 = a3;
  v20 = v12;
  v21 = v13;
  v22 = v14;
  v23 = a4;
  v15 = v14;
  v16 = v13;
  v17 = v12;
  -[MTPAFTracker forEachVideoTracker:](self, "forEachVideoTracker:", v19);
  *(float *)&v18 = a3;
  -[MTPAFTracker startActivity:playbackRate:atMilliseconds:triggerType:reason:eventData:](self, "startActivity:playbackRate:atMilliseconds:triggerType:reason:eventData:", 0, a4, v17, v16, v15, v18);

}

uint64_t __81__MTPAFTracker_playStartedWithPlaybackRate_atMilliseconds_type_reason_eventData___block_invoke(uint64_t a1, void *a2, double a3)
{
  LODWORD(a3) = *(_DWORD *)(a1 + 64);
  return objc_msgSend(a2, "playStartedWithPlaybackRate:overallPosition:type:reason:eventData:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), a3);
}

- (void)playStartedAtSeconds:(double)a3 type:(id)a4 reason:(id)a5 eventData:(id)a6
{
  double v9;
  unint64_t v10;

  v9 = a3 * 1000.0;
  v10 = (unint64_t)v9;
  LODWORD(v9) = 1.0;
  -[MTPAFTracker playStartedWithPlaybackRate:atMilliseconds:type:reason:eventData:](self, "playStartedWithPlaybackRate:atMilliseconds:type:reason:eventData:", v10, a4, a5, a6, v9);
}

- (void)playStartedAtMilliseconds:(unint64_t)a3 type:(id)a4 reason:(id)a5 eventData:(id)a6
{
  double v6;

  LODWORD(v6) = 1.0;
  -[MTPAFTracker playStartedWithPlaybackRate:atMilliseconds:type:reason:eventData:](self, "playStartedWithPlaybackRate:atMilliseconds:type:reason:eventData:", a3, a4, a5, a6, v6);
}

- (void)playStoppedAtSeconds:(double)a3 type:(id)a4 reason:(id)a5 eventData:(id)a6
{
  -[MTPAFTracker playStoppedAtMilliseconds:type:reason:eventData:](self, "playStoppedAtMilliseconds:type:reason:eventData:", (unint64_t)(a3 * 1000.0), a4, a5, a6);
}

- (void)playStoppedAtMilliseconds:(unint64_t)a3 type:(id)a4 reason:(id)a5 eventData:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t (*v18)(_QWORD *, void *);
  void *v19;
  id v20;
  id v21;
  id v22;
  unint64_t v23;

  v10 = a4;
  v11 = a5;
  v12 = a6;
  v16 = MEMORY[0x24BDAC760];
  v17 = 3221225472;
  v18 = __64__MTPAFTracker_playStoppedAtMilliseconds_type_reason_eventData___block_invoke;
  v19 = &unk_24C7A1578;
  v20 = v10;
  v21 = v11;
  v22 = v12;
  v23 = a3;
  v13 = v12;
  v14 = v11;
  v15 = v10;
  -[MTPAFTracker forEachVideoTracker:](self, "forEachVideoTracker:", &v16);
  -[MTPAFTracker stopActivity:atMilliseconds:triggerType:reason:eventData:](self, "stopActivity:atMilliseconds:triggerType:reason:eventData:", 0, a3, v15, v14, v13, v16, v17, v18, v19);

}

uint64_t __64__MTPAFTracker_playStoppedAtMilliseconds_type_reason_eventData___block_invoke(_QWORD *a1, void *a2)
{
  return objc_msgSend(a2, "playStoppedAtOverallPosition:type:reason:eventData:", a1[7], a1[4], a1[5], a1[6]);
}

- (void)seekStartedAtSeconds:(double)a3 type:(id)a4 reason:(id)a5 eventData:(id)a6
{
  -[MTPAFTracker seekStartedAtMilliseconds:type:reason:eventData:](self, "seekStartedAtMilliseconds:type:reason:eventData:", (unint64_t)(a3 * 1000.0), a4, a5, a6);
}

- (void)seekStartedAtMilliseconds:(unint64_t)a3 type:(id)a4 reason:(id)a5 eventData:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  double v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t (*v19)(_QWORD *, void *);
  void *v20;
  id v21;
  id v22;
  id v23;
  unint64_t v24;

  v10 = a4;
  v11 = a5;
  v12 = a6;
  v17 = MEMORY[0x24BDAC760];
  v18 = 3221225472;
  v19 = __64__MTPAFTracker_seekStartedAtMilliseconds_type_reason_eventData___block_invoke;
  v20 = &unk_24C7A1578;
  v21 = v10;
  v22 = v11;
  v23 = v12;
  v24 = a3;
  v13 = v12;
  v14 = v11;
  v15 = v10;
  -[MTPAFTracker forEachVideoTracker:](self, "forEachVideoTracker:", &v17);
  LODWORD(v16) = 1.0;
  -[MTPAFTracker startActivity:playbackRate:atMilliseconds:triggerType:reason:eventData:](self, "startActivity:playbackRate:atMilliseconds:triggerType:reason:eventData:", 1, a3, v15, v14, v13, v16, v17, v18, v19, v20);

}

uint64_t __64__MTPAFTracker_seekStartedAtMilliseconds_type_reason_eventData___block_invoke(_QWORD *a1, void *a2)
{
  return objc_msgSend(a2, "seekStartedAtOverallPosition:type:reason:eventData:", a1[7], a1[4], a1[5], a1[6]);
}

- (void)seekStoppedAtSeconds:(double)a3 type:(id)a4 reason:(id)a5 eventData:(id)a6
{
  -[MTPAFTracker seekStoppedAtMilliseconds:type:reason:eventData:](self, "seekStoppedAtMilliseconds:type:reason:eventData:", (unint64_t)(a3 * 1000.0), a4, a5, a6);
}

- (void)seekStoppedAtMilliseconds:(unint64_t)a3 type:(id)a4 reason:(id)a5 eventData:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t (*v18)(_QWORD *, void *);
  void *v19;
  id v20;
  id v21;
  id v22;
  unint64_t v23;

  v10 = a4;
  v11 = a5;
  v12 = a6;
  v16 = MEMORY[0x24BDAC760];
  v17 = 3221225472;
  v18 = __64__MTPAFTracker_seekStoppedAtMilliseconds_type_reason_eventData___block_invoke;
  v19 = &unk_24C7A1578;
  v20 = v10;
  v21 = v11;
  v22 = v12;
  v23 = a3;
  v13 = v12;
  v14 = v11;
  v15 = v10;
  -[MTPAFTracker forEachVideoTracker:](self, "forEachVideoTracker:", &v16);
  -[MTPAFTracker stopActivity:atMilliseconds:triggerType:reason:eventData:](self, "stopActivity:atMilliseconds:triggerType:reason:eventData:", 1, a3, v15, v14, v13, v16, v17, v18, v19);

}

uint64_t __64__MTPAFTracker_seekStoppedAtMilliseconds_type_reason_eventData___block_invoke(_QWORD *a1, void *a2)
{
  return objc_msgSend(a2, "seekStoppedAtOverallPosition:type:reason:eventData:", a1[7], a1[4], a1[5], a1[6]);
}

- (void)synchronizeAtSeconds:(double)a3
{
  -[MTPAFTracker synchronizeAtMilliseconds:](self, "synchronizeAtMilliseconds:", (unint64_t)(a3 * 1000.0));
}

- (void)synchronizeAtMilliseconds:(unint64_t)a3
{
  void *v5;
  _QWORD v6[5];

  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __42__MTPAFTracker_synchronizeAtMilliseconds___block_invoke;
  v6[3] = &__block_descriptor_40_e32_v16__0__MTMediaActivityTracker_8l;
  v6[4] = a3;
  -[MTPAFTracker forEachVideoTracker:](self, "forEachVideoTracker:", v6);
  -[MTPAFTracker currentActivity](self, "currentActivity");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "synchronizeAtMilliseconds:", a3);

}

uint64_t __42__MTPAFTracker_synchronizeAtMilliseconds___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "synchronizeAtOverallPosition:", *(_QWORD *)(a1 + 32));
}

- (void)updateEventData:(id)a3
{
  id v4;
  id v5;
  MTPAFTracker *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _QWORD v16[4];
  id v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __32__MTPAFTracker_updateEventData___block_invoke;
  v16[3] = &unk_24C7A15C0;
  v5 = v4;
  v17 = v5;
  -[MTPAFTracker forEachVideoTracker:](self, "forEachVideoTracker:", v16);
  v6 = self;
  objc_sync_enter(v6);
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  -[MTPAFTracker playlistBindings](v6, "playlistBindings", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v18, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v13;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v13 != v9)
          objc_enumerationMutation(v7);
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v10), "playlist");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "updateEventData:", v5);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v18, 16);
    }
    while (v8);
  }

  objc_sync_exit(v6);
}

uint64_t __32__MTPAFTracker_updateEventData___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "updateEventData:", *(_QWORD *)(a1 + 32));
}

- (void)forEachVideoTracker:(id)a3
{
  void (**v4)(id, _QWORD);
  MTPAFTracker *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v4 = (void (**)(id, _QWORD))a3;
  v5 = self;
  objc_sync_enter(v5);
  -[MTPAFTracker videoTrackers](v5, "videoTrackers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_exit(v5);

  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v7 = v6;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v12;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v12 != v9)
          objc_enumerationMutation(v7);
        v4[2](v4, *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v10++));
      }
      while (v8 != v10);
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v8);
  }

}

- (void)startActivity:(int64_t)a3 playbackRate:(float)a4 atMilliseconds:(unint64_t)a5 triggerType:(id)a6 reason:(id)a7 eventData:(id)a8
{
  id v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  id v22;
  MTPAFActivity *v23;
  double v24;
  MTPAFActivity *v25;
  MTPAFTracker *v26;
  void *v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t i;
  void *v32;
  void *v33;
  void *v34;
  id v35;
  id v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x24BDAC8D0];
  v35 = a6;
  v36 = a7;
  v14 = a8;
  -[MTPAFTracker currentActivity](self, "currentActivity");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
    v22 = MTConfigurationError(110, CFSTR("MTPAFTracker inconsistent state: did you forget to call stopped?"), v16, v17, v18, v19, v20, v21, (uint64_t)v35);
  v23 = [MTPAFActivity alloc];
  *(float *)&v24 = a4;
  v25 = -[MTPAFActivity initWithType:playbackRate:atMilliseconds:triggerType:reason:eventData:](v23, "initWithType:playbackRate:atMilliseconds:triggerType:reason:eventData:", a3, a5, v35, v36, v14, v24);
  if (v25)
  {
    v26 = self;
    objc_sync_enter(v26);
    -[MTPAFTracker playlistBindings](v26, "playlistBindings");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_sync_exit(v26);

    if (v27)
    {
      v39 = 0u;
      v40 = 0u;
      v37 = 0u;
      v38 = 0u;
      v28 = v27;
      v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v37, v41, 16);
      if (v29)
      {
        v30 = *(_QWORD *)v38;
        do
        {
          for (i = 0; i != v29; ++i)
          {
            if (*(_QWORD *)v38 != v30)
              objc_enumerationMutation(v28);
            v32 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * i);
            objc_msgSend(v32, "playlist", v35);
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v32, "pafKit");
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            -[MTPAFActivity addItemsFromPlaylist:pafKit:](v25, "addItemsFromPlaylist:pafKit:", v33, v34);

          }
          v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v37, v41, 16);
        }
        while (v29);
      }

    }
    -[MTPAFTracker setCurrentActivity:](v26, "setCurrentActivity:", v25, v35);

  }
}

- (void)stopActivity:(int64_t)a3 atMilliseconds:(unint64_t)a4 triggerType:(id)a5 reason:(id)a6 eventData:(id)a7
{
  id v12;
  id v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  id v22;
  uint64_t v23;
  id v24;

  v24 = a5;
  v12 = a6;
  v13 = a7;
  -[MTPAFTracker currentActivity](self, "currentActivity");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v14;
  if (v14)
  {
    if (objc_msgSend(v14, "activityType") == a3)
    {
      objc_msgSend(v15, "stoppedAtMilliseconds:triggerType:reason:eventData:", a4, v24, v12, v13);
      -[MTPAFTracker setCurrentActivity:](self, "setCurrentActivity:", 0);
    }
    else
    {
      v22 = MTConfigurationError(110, CFSTR("MTPAFTracker inconsistent state: did you forget to call started?"), v16, v17, v18, v19, v20, v21, v23);
    }
  }

}

- (NSArray)videoTrackers
{
  return self->_videoTrackers;
}

- (void)setVideoTrackers:(id)a3
{
  objc_storeStrong((id *)&self->_videoTrackers, a3);
}

- (NSArray)playlistBindings
{
  return self->_playlistBindings;
}

- (void)setPlaylistBindings:(id)a3
{
  objc_storeStrong((id *)&self->_playlistBindings, a3);
}

- (MTPAFActivity)currentActivity
{
  return self->_currentActivity;
}

- (void)setCurrentActivity:(id)a3
{
  objc_storeStrong((id *)&self->_currentActivity, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentActivity, 0);
  objc_storeStrong((id *)&self->_playlistBindings, 0);
  objc_storeStrong((id *)&self->_videoTrackers, 0);
}

@end
