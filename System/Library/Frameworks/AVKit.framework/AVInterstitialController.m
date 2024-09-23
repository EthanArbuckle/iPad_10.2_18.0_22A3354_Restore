@implementation AVInterstitialController

- (AVPlayer)interstitialPlayer
{
  return self->_interstitialPlayer;
}

- (AVTimeRange)currentInterstitialTimeRange
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;

  -[AVInterstitialController interstitialTimeRangeCollection](self, "interstitialTimeRangeCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "count"))
  {
    -[AVPlayerInterstitialEventMonitor currentEvent](self->_eventMonitor, "currentEvent");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      -[AVInterstitialController timeRangeForPlayerInterstitialEvent:](self, "timeRangeForPlayerInterstitialEvent:", v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[AVInterstitialController loadDurationOfCurrentOrNextInterstitialEvent:](self, "loadDurationOfCurrentOrNextInterstitialEvent:", &__block_literal_global_13369);
    }
    else
    {
      -[AVInterstitialController currentTime](self, "currentTime");
      objc_msgSend(v3, "timeRangeContainingTime:");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
    }
    if (objc_msgSend(v5, "isSkipped"))
      v7 = 0;
    else
      v7 = v5;
    v6 = v7;

  }
  else
  {
    v6 = 0;
  }

  return (AVTimeRange *)v6;
}

- (AVTimeRangeCollection)interstitialTimeRangeCollection
{
  return self->_interstitialTimeRangeCollection;
}

- (void)setDelegateManager:(id)a3
{
  objc_storeWeak((id *)&self->_delegateManager, a3);
}

- (void)setPlayer:(id)a3
{
  AVPlayer *v5;
  AVPlayer *v6;

  v5 = (AVPlayer *)a3;
  if (self->_player != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_player, a3);
    -[AVInterstitialController _performInterstitialPlayerDependentUpdates](self, "_performInterstitialPlayerDependentUpdates");
    v5 = v6;
  }

}

- (id)currentItem
{
  void *v2;
  void *v3;

  -[AVInterstitialController player](self, "player");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "currentItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)_performInterstitialPlayerDependentUpdates
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  -[AVInterstitialController player](self, "player");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = (void *)MEMORY[0x1E0C8B2F8];
    -[AVInterstitialController player](self, "player");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "interstitialEventMonitorWithPrimaryPlayer:", v5);
    v13 = (id)objc_claimAutoreleasedReturnValue();

    -[AVInterstitialController eventMonitor](self, "eventMonitor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "interstitialPlayer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "interstitialPlayer");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7 != v8)
    {
      -[AVInterstitialController setEventMonitor:](self, "setEventMonitor:", v13);
      v9 = (void *)MEMORY[0x1E0C8B2F0];
      -[AVInterstitialController player](self, "player");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "interstitialEventControllerWithPrimaryPlayer:", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[AVInterstitialController setEventController:](self, "setEventController:", v11);

      objc_msgSend(v13, "interstitialPlayer");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[AVInterstitialController setInterstitialPlayer:](self, "setInterstitialPlayer:", v12);

      -[AVInterstitialController setupInterstitialObservers](self, "setupInterstitialObservers");
    }

  }
  else
  {
    -[AVInterstitialController setEventMonitor:](self, "setEventMonitor:", 0);
    -[AVInterstitialController setEventController:](self, "setEventController:", 0);
    -[AVInterstitialController setInterstitialPlayer:](self, "setInterstitialPlayer:", 0);
  }
}

- (AVPlayer)player
{
  return self->_player;
}

- (AVPlayerInterstitialEventMonitor)eventMonitor
{
  return self->_eventMonitor;
}

- (void)setupInterstitialObservers
{
  void *v3;
  NSObject *playerInterstitialEventsChangedObserver;
  void *v5;
  NSObject *playerInterstitialCurrentEventChangedObserver;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  NSObject *v16;
  NSObject *v17;
  _QWORD v18[4];
  id v19;
  _QWORD v20[4];
  id v21;
  id location;

  objc_initWeak(&location, self);
  if (self->_playerInterstitialEventsChangedObserver)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "removeObserver:", self->_playerInterstitialEventsChangedObserver);

    playerInterstitialEventsChangedObserver = self->_playerInterstitialEventsChangedObserver;
    self->_playerInterstitialEventsChangedObserver = 0;

  }
  if (self->_playerInterstitialCurrentEventChangedObserver)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "removeObserver:", self->_playerInterstitialCurrentEventChangedObserver);

    playerInterstitialCurrentEventChangedObserver = self->_playerInterstitialCurrentEventChangedObserver;
    self->_playerInterstitialCurrentEventChangedObserver = 0;

  }
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3828], "mainQueue");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = *MEMORY[0x1E0C8AC38];
  v10 = MEMORY[0x1E0C809B0];
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __54__AVInterstitialController_setupInterstitialObservers__block_invoke;
  v20[3] = &unk_1E5BB2A70;
  objc_copyWeak(&v21, &location);
  objc_msgSend(v7, "addObserverForName:object:queue:usingBlock:", v9, 0, v8, v20);
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = self->_playerInterstitialEventsChangedObserver;
  self->_playerInterstitialEventsChangedObserver = v11;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3828], "mainQueue");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = *MEMORY[0x1E0C8AC30];
  v18[0] = v10;
  v18[1] = 3221225472;
  v18[2] = __54__AVInterstitialController_setupInterstitialObservers__block_invoke_19;
  v18[3] = &unk_1E5BB2A70;
  objc_copyWeak(&v19, &location);
  objc_msgSend(v13, "addObserverForName:object:queue:usingBlock:", v15, 0, v14, v18);
  v16 = objc_claimAutoreleasedReturnValue();
  v17 = self->_playerInterstitialCurrentEventChangedObserver;
  self->_playerInterstitialCurrentEventChangedObserver = v16;

  objc_destroyWeak(&v19);
  objc_destroyWeak(&v21);
  objc_destroyWeak(&location);
}

- (void)setInterstitialPlayer:(id)a3
{
  AVPlayer *v5;
  AVTimeControlling *interstitialTimingController;
  AVPlayerTimeController *v7;
  AVTimeControlling *v8;
  AVPlayer *v9;

  v5 = (AVPlayer *)a3;
  if (self->_interstitialPlayer != v5)
  {
    v9 = v5;
    objc_storeStrong((id *)&self->_interstitialPlayer, a3);
    interstitialTimingController = self->_interstitialTimingController;
    if (!interstitialTimingController)
    {
      v7 = -[AVPlayerTimeController initWithPlayer:]([AVPlayerTimeController alloc], "initWithPlayer:", self->_interstitialPlayer);
      v8 = self->_interstitialTimingController;
      self->_interstitialTimingController = (AVTimeControlling *)v7;

      interstitialTimingController = self->_interstitialTimingController;
    }
    -[AVTimeControlling setPlayer:](interstitialTimingController, "setPlayer:", self->_interstitialPlayer);
    v5 = v9;
  }

}

- (void)setEventMonitor:(id)a3
{
  objc_storeStrong((id *)&self->_eventMonitor, a3);
}

- (void)setEventController:(id)a3
{
  objc_storeStrong((id *)&self->_eventController, a3);
}

- (void)setDidLeaveRequiredInterstitialTimeRangeBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (AVInterstitialController)init
{
  AVInterstitialController *v2;
  AVObservationController *v3;
  AVObservationController *kvo;
  AVObservationController *v5;
  uint64_t v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *playerInterstitialPlayerDidChangeObserver;
  _QWORD v14[4];
  id v15;
  _QWORD v16[4];
  id v17;
  id location;
  objc_super v19;

  v19.receiver = self;
  v19.super_class = (Class)AVInterstitialController;
  v2 = -[AVInterstitialController init](&v19, sel_init);
  if (v2)
  {
    v3 = -[AVObservationController initWithOwner:]([AVObservationController alloc], "initWithOwner:", v2);
    kvo = v2->_kvo;
    v2->_kvo = v3;

    objc_initWeak(&location, v2);
    v5 = v2->_kvo;
    v6 = MEMORY[0x1E0C809B0];
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __32__AVInterstitialController_init__block_invoke;
    v16[3] = &unk_1E5BB2A48;
    objc_copyWeak(&v17, &location);
    v7 = -[AVObservationController startObserving:keyPath:includeInitialValue:observationHandler:](v5, "startObserving:keyPath:includeInitialValue:observationHandler:", v2, CFSTR("player.currentItem"), 0, v16);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3828], "mainQueue");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = *MEMORY[0x1E0C8AC40];
    v14[0] = v6;
    v14[1] = 3221225472;
    v14[2] = __32__AVInterstitialController_init__block_invoke_17;
    v14[3] = &unk_1E5BB2A70;
    objc_copyWeak(&v15, &location);
    objc_msgSend(v8, "addObserverForName:object:queue:usingBlock:", v10, 0, v9, v14);
    v11 = objc_claimAutoreleasedReturnValue();
    playerInterstitialPlayerDidChangeObserver = v2->_playerInterstitialPlayerDidChangeObserver;
    v2->_playerInterstitialPlayerDidChangeObserver = v11;

    objc_destroyWeak(&v15);
    objc_destroyWeak(&v17);
    objc_destroyWeak(&location);
  }
  return v2;
}

void __32__AVInterstitialController_init__block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v5;
  id WeakRetained;
  NSObject *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  char isKindOfClass;
  CMTime *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  CMTime v20;
  CMTime time1;
  CMTime v22;
  CMTime buf;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  _AVLog();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v5, "keyPath");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(buf.value) = 138412290;
    *(CMTimeValue *)((char *)&buf.value + 4) = (CMTimeValue)v8;
    _os_log_impl(&dword_1AC4B1000, v7, OS_LOG_TYPE_DEFAULT, "Updating interstitial collection triggered by KVO change for key path %@", (uint8_t *)&buf, 0xCu);

  }
  objc_msgSend(v5, "keyPath");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "isEqualToString:", CFSTR("duration"));

  if (!v10)
    goto LABEL_17;
  memset(&buf, 0, sizeof(buf));
  objc_msgSend(v5, "oldValue");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  v13 = (CMTime *)MEMORY[0x1E0CA2E18];
  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend(v5, "oldValue");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v14;
    if (v14)
      objc_msgSend(v14, "CMTimeValue");
    else
      memset(&buf, 0, sizeof(buf));

  }
  else
  {
    buf = *(CMTime *)*(_QWORD *)&MEMORY[0x1E0CA2E18];
  }

  memset(&v22, 0, sizeof(v22));
  objc_msgSend(v5, "value");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v5, "value");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v17;
    if (v17)
      objc_msgSend(v17, "CMTimeValue");
    else
      memset(&v22, 0, sizeof(v22));

  }
  else
  {
    v22 = *v13;
  }

  time1 = buf;
  v20 = v22;
  if (!CMTimeCompare(&time1, &v20))
  {
    _AVLog();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(time1.value) = 0;
      _os_log_impl(&dword_1AC4B1000, v19, OS_LOG_TYPE_DEFAULT, "(Actually, the duration did not change; no need to update interstitials)",
        (uint8_t *)&time1,
        2u);
    }

  }
  else
  {
LABEL_17:
    objc_msgSend(WeakRetained, "_updateInterstitialTimeRangeCollection");
  }

}

void __32__AVInterstitialController_init__block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  AVObservationController *v13;
  void *v14;
  void *v15;
  id v16;
  NSObject *v17;
  uint8_t v18[16];
  _QWORD v19[4];
  id v20;
  _QWORD v21[5];

  v21[4] = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  objc_msgSend(v7, "player");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "currentItem");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "kvoPlayerItem");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "stopAllObservation");

  if (v11)
  {
    v13 = -[AVObservationController initWithOwner:]([AVObservationController alloc], "initWithOwner:", v7);
    objc_msgSend(v7, "setKvoPlayerItem:", v13);
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __32__AVInterstitialController_init__block_invoke_2;
    v19[3] = &unk_1E5BB2A48;
    objc_copyWeak(&v20, (id *)(a1 + 32));
    v14 = (void *)MEMORY[0x1AF43E9B8](v19);
    v21[0] = CFSTR("interstitialTimeRanges");
    v21[1] = CFSTR("forwardPlaybackEndTime");
    v21[2] = CFSTR("reversePlaybackEndTime");
    v21[3] = CFSTR("duration");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v21, 4);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = -[AVObservationController startObserving:keyPaths:includeInitialValue:observationHandler:](v13, "startObserving:keyPaths:includeInitialValue:observationHandler:", v11, v15, 0, v14);

    objc_msgSend(v7, "updateSynthesizedInterstitialTimeRanges");
    objc_destroyWeak(&v20);

  }
  else
  {
    objc_msgSend(v7, "setKvoPlayerItem:", 0);
  }
  _AVLog();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v18 = 0;
    _os_log_impl(&dword_1AC4B1000, v17, OS_LOG_TYPE_DEFAULT, "Updating interstitial collection triggered by currentItem change", v18, 2u);
  }

  objc_msgSend(v7, "_updateInterstitialTimeRangeCollection");
}

- (void)updateSynthesizedInterstitialTimeRanges
{
  void *v3;
  int v4;
  id v5;
  NSObject *v6;
  void *v7;
  int v8;
  const char *v9;
  __int16 v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  -[AVInterstitialController currentItem](self, "currentItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "translatesPlayerInterstitialEvents");

  if (v4)
  {
    v5 = -[AVInterstitialController _copySynthesizedInterstitialTimeRanges](self, "_copySynthesizedInterstitialTimeRanges");
    _AVLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v8 = 136315394;
      v9 = "-[AVInterstitialController(AVPlayerInterstitialSupport) updateSynthesizedInterstitialTimeRanges]";
      v10 = 2048;
      v11 = objc_msgSend(v5, "count");
      _os_log_impl(&dword_1AC4B1000, v6, OS_LOG_TYPE_DEFAULT, "%s updating; %lu time range(s)", (uint8_t *)&v8, 0x16u);
    }

    if (objc_msgSend(v5, "count"))
    {
      -[AVInterstitialController currentItem](self, "currentItem");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setInterstitialTimeRanges:", v5);

    }
  }
}

- (id)_copySynthesizedInterstitialTimeRanges
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  char v16;
  id v17;
  void *v18;
  void *v20;
  id obj;
  id v22;
  uint64_t v23;
  void *v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  -[AVPlayerInterstitialEventMonitor events](self->_eventMonitor, "events");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "count"))
  {
    -[AVInterstitialController currentItem](self, "currentItem");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "interstitialTimeRanges");
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    v22 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v29 = 0u;
    v30 = 0u;
    v31 = 0u;
    v32 = 0u;
    v20 = v3;
    obj = v3;
    v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
    if (v5)
    {
      v6 = v5;
      v23 = *(_QWORD *)v30;
      do
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v30 != v23)
            objc_enumerationMutation(obj);
          v8 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * i);
          v25 = 0u;
          v26 = 0u;
          v27 = 0u;
          v28 = 0u;
          v9 = v24;
          v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
          if (v10)
          {
            v11 = v10;
            v12 = *(_QWORD *)v26;
LABEL_9:
            v13 = 0;
            while (1)
            {
              if (*(_QWORD *)v26 != v12)
                objc_enumerationMutation(v9);
              v14 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * v13);
              objc_msgSend(v14, "playerInterstitialEvent");
              v15 = (void *)objc_claimAutoreleasedReturnValue();
              v16 = objc_msgSend(v8, "isEqual:", v15);

              if ((v16 & 1) != 0)
                break;
              if (v11 == ++v13)
              {
                v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
                if (v11)
                  goto LABEL_9;
                goto LABEL_15;
              }
            }
            v17 = v14;

            if (v17)
              goto LABEL_18;
          }
          else
          {
LABEL_15:

          }
          +[AVInterstitialTimeRange interstitialTimeRangeWithPlayerInterstitialEvent:](AVInterstitialTimeRange, "interstitialTimeRangeWithPlayerInterstitialEvent:", v8);
          v17 = (id)objc_claimAutoreleasedReturnValue();
          if (v17)
          {
LABEL_18:
            objc_msgSend(v22, "addObject:", v17);

          }
        }
        v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
      }
      while (v6);
    }

    v18 = (void *)objc_msgSend(v22, "copy");
    v3 = v20;
  }
  else
  {
    v18 = (void *)MEMORY[0x1E0C9AA60];
  }

  return v18;
}

- (void)setKvoPlayerItem:(id)a3
{
  objc_storeStrong((id *)&self->_kvoPlayerItem, a3);
}

- (AVObservationController)kvoPlayerItem
{
  return self->_kvoPlayerItem;
}

- (BOOL)isLive
{
  void *v2;
  _BOOL4 v3;
  unsigned __int8 v5;
  char v6;

  -[AVInterstitialController currentItem](self, "currentItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "status") == 1)
  {
    if (!v2)
    {
      LOBYTE(v3) = 0;
      goto LABEL_7;
    }
    objc_msgSend(v2, "duration");
    if ((v6 & 1) != 0)
    {
      objc_msgSend(v2, "duration");
      v3 = (v5 >> 4) & 1;
      goto LABEL_7;
    }
  }
  LOBYTE(v3) = 0;
LABEL_7:

  return v3;
}

- (void)_updateInterstitialTimeRangeCollection
{
  NSObject *v3;
  void *v4;
  char *v5;
  char *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;
  int v14;
  const char *v15;
  __int16 v16;
  int v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  _AVLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v14 = 136315394;
    v15 = "-[AVInterstitialController _updateInterstitialTimeRangeCollection]";
    v16 = 1024;
    v17 = 380;
    _os_log_impl(&dword_1AC4B1000, v3, OS_LOG_TYPE_DEFAULT, "%s %d", (uint8_t *)&v14, 0x12u);
  }

  -[AVInterstitialController currentItem](self, "currentItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = +[AVInterstitialController newTimeRangeCollectionForPlayerItem:](AVInterstitialController, "newTimeRangeCollectionForPlayerItem:", v4);

  -[AVInterstitialController isLive](self, "isLive");
  -[AVInterstitialController interstitialTimeRangeCollection](self, "interstitialTimeRangeCollection");
  v6 = (char *)objc_claimAutoreleasedReturnValue();

  if (v6 != v5)
  {
    _AVLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v14 = 138412290;
      v15 = v5;
      _os_log_impl(&dword_1AC4B1000, v7, OS_LOG_TYPE_DEFAULT, "Updating interstitial time ranges: %@", (uint8_t *)&v14, 0xCu);
    }

    -[AVInterstitialController interstitialTimeRangeInProgress](self, "interstitialTimeRangeInProgress");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "interstice");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVInterstitialController _stopObservingInterstitialTimeRanges](self, "_stopObservingInterstitialTimeRanges");
    -[AVInterstitialController setInterstitialTimeRangeCollection:](self, "setInterstitialTimeRangeCollection:", v5);
    -[AVInterstitialController currentInterstitialTimeRange](self, "currentInterstitialTimeRange");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "interstice");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11;
    if (v9 == v11)
      goto LABEL_14;
    if (v9 && v11)
    {
      v13 = objc_msgSend(v11, "isEqual:", v9);
      if (!v8 || (v13 & 1) != 0)
        goto LABEL_14;
    }
    else if (!v8)
    {
LABEL_14:
      -[AVInterstitialController _startObservingInterstitialTimeRanges](self, "_startObservingInterstitialTimeRanges");

      goto LABEL_15;
    }
    -[AVInterstitialController didPresentInterstitialTimeRange:](self, "didPresentInterstitialTimeRange:", v8);
    goto LABEL_14;
  }
LABEL_15:

}

+ (id)newTimeRangeCollectionForPlayerItem:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  AVTimeRangeCollection *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  char v17;
  char v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "interstitialTimeRanges");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "status") == 1)
    {
      objc_msgSend(v4, "duration");
      if ((v18 & 1) != 0)
      {
        objc_msgSend(v4, "duration");
        if ((v17 & 0x10) != 0)
        {
          v15 = 0u;
          v16 = 0u;
          v13 = 0u;
          v14 = 0u;
          v6 = v5;
          v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v19, 16);
          if (v7)
          {
            v8 = v7;
            v9 = *(_QWORD *)v14;
            do
            {
              for (i = 0; i != v8; ++i)
              {
                if (*(_QWORD *)v14 != v9)
                  objc_enumerationMutation(v6);
                objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * i), "_setCollapsedInTimeLine:", 0, (_QWORD)v13);
              }
              v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v19, 16);
            }
            while (v8);
          }

        }
      }
    }
    if (objc_msgSend(v5, "count", (_QWORD)v13))
      v11 = -[AVTimeRangeCollection initWithInterstitialTimeRanges:]([AVTimeRangeCollection alloc], "initWithInterstitialTimeRanges:", v5);
    else
      v11 = 0;

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (void)dealloc
{
  objc_super v3;

  -[AVInterstitialController invalidate](self, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)AVInterstitialController;
  -[AVInterstitialController dealloc](&v3, sel_dealloc);
}

- (void)invalidate
{
  void *v3;
  void *v4;
  void *v5;
  NSObject *playerItemTimeJumpedObserver;
  void *v7;
  NSObject *playerInterstitialPlayerDidChangeObserver;
  void *v9;
  NSObject *playerInterstitialEventsChangedObserver;
  void *v11;
  NSObject *playerInterstitialCurrentEventChangedObserver;

  -[AVInterstitialController kvoPlayerItem](self, "kvoPlayerItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stopAllObservation");

  -[AVInterstitialController setKvoPlayerItem:](self, "setKvoPlayerItem:", 0);
  -[AVInterstitialController kvo](self, "kvo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stopAllObservation");

  -[AVInterstitialController setKvo:](self, "setKvo:", 0);
  if (self->_playerItemTimeJumpedObserver)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "removeObserver:", self->_playerItemTimeJumpedObserver);

    playerItemTimeJumpedObserver = self->_playerItemTimeJumpedObserver;
    self->_playerItemTimeJumpedObserver = 0;

  }
  if (self->_playerInterstitialPlayerDidChangeObserver)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "removeObserver:", self->_playerInterstitialPlayerDidChangeObserver);

    playerInterstitialPlayerDidChangeObserver = self->_playerInterstitialPlayerDidChangeObserver;
    self->_playerInterstitialPlayerDidChangeObserver = 0;

  }
  if (self->_playerInterstitialEventsChangedObserver)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "removeObserver:", self->_playerInterstitialEventsChangedObserver);

    playerInterstitialEventsChangedObserver = self->_playerInterstitialEventsChangedObserver;
    self->_playerInterstitialEventsChangedObserver = 0;

  }
  if (self->_playerInterstitialCurrentEventChangedObserver)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "removeObserver:", self->_playerInterstitialCurrentEventChangedObserver);

    playerInterstitialCurrentEventChangedObserver = self->_playerInterstitialCurrentEventChangedObserver;
    self->_playerInterstitialCurrentEventChangedObserver = 0;

  }
  if (self->_player)
    -[AVInterstitialController setPlayer:](self, "setPlayer:", 0);
}

- (double)timeFromDisplayTime:(double)a3
{
  void *v4;
  void *v5;
  double v6;

  -[AVInterstitialController interstitialTimeRangeCollection](self, "interstitialTimeRangeCollection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "timeFromDisplayTime:", a3);
    a3 = v6;
  }

  return a3;
}

- (double)displayTimeFromTime:(double)a3
{
  void *v4;
  void *v5;
  double v6;

  -[AVInterstitialController interstitialTimeRangeCollection](self, "interstitialTimeRangeCollection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "displayTimeFromTime:", a3);
    a3 = v6;
  }

  return a3;
}

- (double)currentTime
{
  void *v2;
  double Seconds;
  CMTime time;

  -[AVInterstitialController currentItem](self, "currentItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "status") != 1)
    goto LABEL_6;
  if (v2)
    objc_msgSend(v2, "currentTime");
  else
    memset(&time, 0, sizeof(time));
  Seconds = CMTimeGetSeconds(&time);
  if (fabs(Seconds) == INFINITY)
LABEL_6:
    Seconds = NAN;

  return Seconds;
}

- (double)currentDisplayTime
{
  double v3;
  double v4;
  void *v5;
  void *v6;
  double v7;
  double result;

  -[AVInterstitialController currentTime](self, "currentTime");
  v4 = v3;
  -[AVInterstitialController currentInterstitialTimeRange](self, "currentInterstitialTimeRange");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[AVInterstitialController currentInterstitialTimeRange](self, "currentInterstitialTimeRange");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "startTime");
    v4 = v7;

  }
  -[AVInterstitialController displayTimeFromTime:](self, "displayTimeFromTime:", v4);
  return result;
}

- (id)currentOrEstimatedDate
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;

  -[AVInterstitialController currentItem](self, "currentItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "status") == 1)
  {
    objc_msgSend(v2, "currentDate");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v3;
    if (v3)
    {
      v5 = v3;
    }
    else
    {
      objc_msgSend(v2, "currentEstimatedDate");
      v5 = (id)objc_claimAutoreleasedReturnValue();
    }
    v6 = v5;

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (double)elapsedTimeForInterstitialPlayer
{
  void *v2;
  void *v3;
  void *v4;
  double Seconds;
  CMTime time;

  -[AVInterstitialController eventMonitor](self, "eventMonitor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "interstitialPlayer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "currentItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v4, "status") != 1)
    goto LABEL_6;
  if (v4)
    objc_msgSend(v4, "currentTime");
  else
    memset(&time, 0, sizeof(time));
  Seconds = CMTimeGetSeconds(&time);
  if (fabs(Seconds) == INFINITY)
LABEL_6:
    Seconds = NAN;

  return Seconds;
}

- (double)elapsedTimeWithinCurrentInterstitial
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;

  -[AVInterstitialController currentInterstitialTimeRange](self, "currentInterstitialTimeRange");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "interstice");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "playerInterstitialEvent");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      -[AVInterstitialController elapsedTimeForInterstitialPlayer](self, "elapsedTimeForInterstitialPlayer");
      v8 = v7;
    }
    else
    {
      -[AVInterstitialController currentTime](self, "currentTime");
      v10 = v9;
      objc_msgSend(v4, "startTime");
      v8 = v10 - v11;
    }

  }
  else
  {
    v8 = 0.0;
  }

  return v8;
}

- (double)timeRemainingInCurrentInterstitial
{
  void *v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;

  -[AVInterstitialController currentInterstitialTimeRange](self, "currentInterstitialTimeRange");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "interstice");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "playingDuration");
    v7 = v6;

    -[AVInterstitialController elapsedTimeWithinCurrentInterstitial](self, "elapsedTimeWithinCurrentInterstitial");
    v9 = v7 - v8;
  }
  else
  {
    v9 = 0.0;
  }

  return v9;
}

- (void)cancelCurrentPlayerInterstitialEvent
{
  void *v3;
  NSObject *v4;
  AVPlayerInterstitialEventController *eventController;
  _BYTE v6[24];
  uint8_t buf[4];
  const char *v8;
  __int16 v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  -[AVPlayerInterstitialEventMonitor currentEvent](self->_eventMonitor, "currentEvent");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    _AVLog();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v8 = "-[AVInterstitialController cancelCurrentPlayerInterstitialEvent]";
      v9 = 2114;
      v10 = v3;
      _os_log_impl(&dword_1AC4B1000, v4, OS_LOG_TYPE_DEFAULT, "%s leaving %{public}@", buf, 0x16u);
    }

    eventController = self->_eventController;
    objc_msgSend(v3, "resumptionOffset");
    -[AVPlayerInterstitialEventController cancelCurrentEventWithResumptionOffset:](eventController, "cancelCurrentEventWithResumptionOffset:", v6);
  }

}

- (BOOL)shouldEnforceInterstitialPolicy
{
  void *v2;
  unint64_t v3;
  BOOL v4;

  -[AVInterstitialController currentItem](self, "currentItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "interstitialPolicyEnforcement");
  if (v3 >= 4)
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("interstitialPolicyEnforcement value is not supported"));
    v4 = 0;
  }
  else
  {
    v4 = (v3 & 0xF) == 1;
  }

  return v4;
}

- (BOOL)requiresLinearPlayback
{
  _BOOL4 v3;
  void *v4;
  char v5;

  v3 = -[AVInterstitialController shouldEnforceInterstitialPolicy](self, "shouldEnforceInterstitialPolicy");
  if (v3)
  {
    -[AVInterstitialController currentInterstitialTimeRange](self, "currentInterstitialTimeRange");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVInterstitialController currentTime](self, "currentTime");
    v5 = objc_msgSend(v4, "requiresLinearPlaybackForTime:");

    LOBYTE(v3) = v5;
  }
  return v3;
}

- (double)timeToSeekAfterUserNavigatedFromTime:(double)a3 toTime:(double)a4
{
  _BOOL4 v7;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  uint64_t v22;
  id v23;
  NSObject *v24;
  double v25;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  uint8_t buf[4];
  const char *v32;
  __int16 v33;
  id v34;
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v7 = -[AVInterstitialController shouldEnforceInterstitialPolicy](self, "shouldEnforceInterstitialPolicy");
  if (a4 <= a3 || !v7)
    return a4;
  -[AVInterstitialController displayTimeFromTime:](self, "displayTimeFromTime:", a3);
  v10 = v9;
  -[AVInterstitialController displayTimeFromTime:](self, "displayTimeFromTime:", a4);
  v12 = v11;
  -[AVInterstitialController interstitialTimeRangeCollection](self, "interstitialTimeRangeCollection");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "timeRangesBetweenDisplayTime:and:", v10, v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  v15 = v14;
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
  if (!v16)
  {
LABEL_18:
    v23 = v15;
    goto LABEL_23;
  }
  v17 = v16;
  v18 = *(_QWORD *)v28;
LABEL_7:
  v19 = 0;
  while (1)
  {
    if (*(_QWORD *)v28 != v18)
      objc_enumerationMutation(v15);
    v20 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * v19);
    if ((objc_msgSend(v20, "isHidden", (_QWORD)v27) & 1) != 0 || (objc_msgSend(v20, "isSkipped") & 1) != 0)
      goto LABEL_16;
    objc_msgSend(v20, "interstice");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v21, "requiredViewingPolicy");
    if (v22 == 1)
      v22 = objc_msgSend(v21, "_watchCount");
    if (!v22)
      break;

LABEL_16:
    if (v17 == ++v19)
    {
      v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
      if (v17)
        goto LABEL_7;
      goto LABEL_18;
    }
  }
  v23 = v20;

  if (!v23)
    goto LABEL_24;
  self->_continuationTimeAfterInterstitial = a4;
  _AVLog();
  v24 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v32 = "-[AVInterstitialController timeToSeekAfterUserNavigatedFromTime:toTime:]";
    v33 = 2114;
    v34 = v23;
    _os_log_impl(&dword_1AC4B1000, v24, OS_LOG_TYPE_DEFAULT, "%s [interstitial] Redirecting playback to %{public}@ to enforce policy", buf, 0x16u);
  }

  objc_msgSend(v23, "startTime");
  a4 = v25;
LABEL_23:

LABEL_24:
  return a4;
}

- (void)_sendInterstitialBoundaryNotificationForInterstitialTimeRange:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  NSObject *v7;
  int v8;
  const char *v9;
  __int16 v10;
  void *v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[AVInterstitialController interstitialTimeRangeInProgress](self, "interstitialTimeRangeInProgress");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  if ((id)v5 != v4 && (!v4 || !v5 || (objc_msgSend(v4, "isEqual:", v5) & 1) == 0))
  {
    -[AVInterstitialController _setPendingTimeBoundary:](self, "_setPendingTimeBoundary:", NAN);
    _AVLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = 136315650;
      v9 = "-[AVInterstitialController _sendInterstitialBoundaryNotificationForInterstitialTimeRange:]";
      v10 = 2112;
      v11 = v6;
      v12 = 2112;
      v13 = v4;
      _os_log_impl(&dword_1AC4B1000, v7, OS_LOG_TYPE_DEFAULT, "%s interstitialTimeRangeInProgress = %@, timeRange = %@", (uint8_t *)&v8, 0x20u);
    }

    if (v6)
    {
      if ((objc_msgSend(v4, "isEqual:", v6) & 1) != 0)
        goto LABEL_12;
      -[AVInterstitialController didPresentInterstitialTimeRange:](self, "didPresentInterstitialTimeRange:", v6);
    }
    if (v4)
      -[AVInterstitialController willPresentInterstitialTimeRange:](self, "willPresentInterstitialTimeRange:", v4);
  }
LABEL_12:

}

- (void)_sendInterstitialBoundaryNotificationsForEvent:(id)a3
{
  id v4;

  -[AVInterstitialController timeRangeForPlayerInterstitialEvent:](self, "timeRangeForPlayerInterstitialEvent:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[AVInterstitialController _sendInterstitialBoundaryNotificationForInterstitialTimeRange:](self, "_sendInterstitialBoundaryNotificationForInterstitialTimeRange:", v4);

}

- (void)_sendInterstitialBoundaryNotificationsForTime:(double)a3
{
  void *v5;
  void *v6;
  id v7;

  -[AVInterstitialController interstitialTimeRangeCollection](self, "interstitialTimeRangeCollection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "timeRangeContainingTime:", a3);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  -[AVPlayerInterstitialEventMonitor currentEvent](self->_eventMonitor, "currentEvent");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
    -[AVInterstitialController _sendInterstitialBoundaryNotificationForInterstitialTimeRange:](self, "_sendInterstitialBoundaryNotificationForInterstitialTimeRange:", v7);

}

- (void)sendInterstitialBoundaryNotificationsForTimeJumpIfNeeded
{
  NSObject *v3;
  int v4;
  const char *v5;
  __int16 v6;
  int v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  _AVLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = 136315394;
    v5 = "-[AVInterstitialController sendInterstitialBoundaryNotificationsForTimeJumpIfNeeded]";
    v6 = 1024;
    v7 = 549;
    _os_log_impl(&dword_1AC4B1000, v3, OS_LOG_TYPE_DEFAULT, "%s %d", (uint8_t *)&v4, 0x12u);
  }

  -[AVInterstitialController currentTime](self, "currentTime");
  -[AVInterstitialController _sendInterstitialBoundaryNotificationsForTime:](self, "_sendInterstitialBoundaryNotificationsForTime:");
}

- (void)sendPendingInterstitialBoundaryNotificationIfNeeded
{
  double v3;
  double v4;
  NSObject *v5;
  int v6;
  const char *v7;
  __int16 v8;
  int v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  -[AVInterstitialController _pendingTimeBoundary](self, "_pendingTimeBoundary");
  v4 = v3;
  -[AVInterstitialController _setPendingTimeBoundary:](self, "_setPendingTimeBoundary:", NAN);
  if (v4 >= 0.0)
  {
    _AVLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = 136315394;
      v7 = "-[AVInterstitialController sendPendingInterstitialBoundaryNotificationIfNeeded]";
      v8 = 1024;
      v9 = 560;
      _os_log_impl(&dword_1AC4B1000, v5, OS_LOG_TYPE_DEFAULT, "%s %d", (uint8_t *)&v6, 0x12u);
    }

    -[AVInterstitialController _sendInterstitialBoundaryNotificationsForTime:](self, "_sendInterstitialBoundaryNotificationsForTime:", v4);
  }
}

- (void)_startObservingInterstitialTimeRanges
{
  _QWORD v2[4];
  id v3;
  id location;

  objc_initWeak(&location, self);
  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __65__AVInterstitialController__startObservingInterstitialTimeRanges__block_invoke;
  v2[3] = &unk_1E5BB4A40;
  objc_copyWeak(&v3, &location);
  dispatch_async(MEMORY[0x1E0C80D38], v2);
  objc_destroyWeak(&v3);
  objc_destroyWeak(&location);
}

- (void)_stopObservingInterstitialTimeRanges
{
  _QWORD v2[4];
  id v3;
  id location;

  objc_initWeak(&location, self);
  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __64__AVInterstitialController__stopObservingInterstitialTimeRanges__block_invoke;
  v2[3] = &unk_1E5BB4A40;
  objc_copyWeak(&v3, &location);
  dispatch_async(MEMORY[0x1E0C80D38], v2);
  objc_destroyWeak(&v3);
  objc_destroyWeak(&location);
}

- (AVTimeRange)previousInterstitialTimeRange
{
  void *v3;
  void *v4;

  -[AVInterstitialController interstitialTimeRangeCollection](self, "interstitialTimeRangeCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVInterstitialController currentTime](self, "currentTime");
  objc_msgSend(v3, "timeRangeBeforeTime:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (AVTimeRange *)v4;
}

- (id)nextInterstitialTimeRange
{
  void *v3;
  void *v4;

  -[AVInterstitialController interstitialTimeRangeCollection](self, "interstitialTimeRangeCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVInterstitialController currentTime](self, "currentTime");
  objc_msgSend(v3, "timeRangeAfterTime:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BOOL)_shouldSkipInterstitialTimeRange:(id)a3
{
  id v4;
  uint64_t v5;
  float v6;
  float v7;

  v4 = a3;
  -[AVInterstitialController player](self, "player");
  v5 = objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)v5, "rate");
  v7 = v6;

  LOBYTE(v5) = objc_msgSend(v4, "isSkipped");
  return (v5 & 1) != 0
      || v7 > 3.0
      || v7 < 0.0
      || -[AVInterstitialController shouldAlwaysSkipInterstitials](self, "shouldAlwaysSkipInterstitials");
}

- (void)didBeginOrResumePlayback
{
  void *v3;
  NSObject *v4;
  int v5;
  const char *v6;
  __int16 v7;
  int v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  -[AVInterstitialController currentInterstitialTimeRange](self, "currentInterstitialTimeRange");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    _AVLog();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5 = 136315394;
      v6 = "-[AVInterstitialController didBeginOrResumePlayback]";
      v7 = 1024;
      v8 = 668;
      _os_log_impl(&dword_1AC4B1000, v4, OS_LOG_TYPE_DEFAULT, "%s %d", (uint8_t *)&v5, 0x12u);
    }

    -[AVInterstitialController currentTime](self, "currentTime");
    -[AVInterstitialController _sendInterstitialBoundaryNotificationsForTime:](self, "_sendInterstitialBoundaryNotificationsForTime:");
  }

}

- (void)skipInterstitialTimeRange:(id)a3
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  NSObject *v8;
  void *v9;
  float v10;
  float v11;
  Float64 v12;
  void *v13;
  __int128 v14;
  uint64_t v15;
  __int128 v16;
  uint64_t v17;
  CMTime v18;
  CMTime buf;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  _AVLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf.value) = 136315394;
    *(CMTimeValue *)((char *)&buf.value + 4) = (CMTimeValue)"-[AVInterstitialController skipInterstitialTimeRange:]";
    LOWORD(buf.flags) = 2114;
    *(_QWORD *)((char *)&buf.flags + 2) = v4;
    _os_log_impl(&dword_1AC4B1000, v5, OS_LOG_TYPE_DEFAULT, "%s timeRange = %{public}@", (uint8_t *)&buf, 0x16u);
  }

  -[AVInterstitialController skipInterstitialTimeRangeBlock](self, "skipInterstitialTimeRangeBlock");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  if (v6)
  {
    (*(void (**)(uint64_t, id))(v6 + 16))(v6, v4);
  }
  else
  {
    _AVLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf.value) = 0;
      _os_log_impl(&dword_1AC4B1000, v8, OS_LOG_TYPE_DEFAULT, "skipInterstitialTimeRangeBlock not set; providing default skipping behavior",
        (uint8_t *)&buf,
        2u);
    }

    -[AVInterstitialController player](self, "player");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "rate");
    v11 = v10;

    if (v11 >= 0.0)
      objc_msgSend(v4, "endTime");
    else
      objc_msgSend(v4, "startTime");
    memset(&buf, 0, sizeof(buf));
    CMTimeMakeWithSeconds(&buf, v12, 1000);
    -[AVInterstitialController player](self, "player");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = buf;
    v16 = *MEMORY[0x1E0CA2E68];
    v17 = *(_QWORD *)(MEMORY[0x1E0CA2E68] + 16);
    v14 = v16;
    v15 = v17;
    objc_msgSend(v13, "seekToTime:toleranceBefore:toleranceAfter:completionHandler:", &v18, &v16, &v14, &__block_literal_global_37_13361);

  }
}

- (void)willPresentInterstitialTimeRange:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  int v12;
  const char *v13;
  __int16 v14;
  id v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[AVInterstitialController interstitialTimeRangeInProgress](self, "interstitialTimeRangeInProgress");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4 && (objc_msgSend(v4, "isEqual:", v5) & 1) == 0)
  {
    _AVLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v4, "interstice");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 136315650;
      v13 = "-[AVInterstitialController willPresentInterstitialTimeRange:]";
      v14 = 2114;
      v15 = v4;
      v16 = 2114;
      v17 = v7;
      _os_log_impl(&dword_1AC4B1000, v6, OS_LOG_TYPE_DEFAULT, "%s Entering interstitial %{public}@ :: %{public}@", (uint8_t *)&v12, 0x20u);

    }
    if (-[AVInterstitialController _shouldSkipInterstitialTimeRange:](self, "_shouldSkipInterstitialTimeRange:", v4))
    {
      -[AVInterstitialController skipInterstitialTimeRange:](self, "skipInterstitialTimeRange:", v4);
    }
    else
    {
      objc_msgSend(v4, "interstice");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "_setActive:", 1);
      -[AVInterstitialController didEnterInterstitialTimeRangeBlock](self, "didEnterInterstitialTimeRangeBlock");
      v9 = objc_claimAutoreleasedReturnValue();
      v10 = (void *)v9;
      if (v9)
        (*(void (**)(uint64_t, id))(v9 + 16))(v9, v4);
      -[AVInterstitialController delegateManager](self, "delegateManager");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "willPresentInterstitialGroup:", v8);

      -[AVInterstitialController setInterstitialTimeRangeInProgress:](self, "setInterstitialTimeRangeInProgress:", v4);
      -[AVTimeControlling startTimingObservation](self->_interstitialTimingController, "startTimingObservation");

    }
  }

}

- (void)didPresentInterstitialTimeRange:(id)a3
{
  id v4;
  id v5;
  void *v6;
  NSObject *v7;
  NSObject *v8;
  double continuationTimeAfterInterstitial;
  double v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  int v16;
  const char *v17;
  __int16 v18;
  double v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    -[AVInterstitialController interstitialTimeRangeInProgress](self, "interstitialTimeRangeInProgress");
    v5 = (id)objc_claimAutoreleasedReturnValue();

    if (v5 == v4)
    {
      objc_msgSend(v4, "interstice");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      _AVLog();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        v16 = 136315650;
        v17 = "-[AVInterstitialController didPresentInterstitialTimeRange:]";
        v18 = 2114;
        v19 = *(double *)&v4;
        v20 = 2114;
        v21 = v6;
        _os_log_impl(&dword_1AC4B1000, v7, OS_LOG_TYPE_DEFAULT, "%s Leaving interstitial %{public}@ :: %{public}@", (uint8_t *)&v16, 0x20u);
      }

      if (-[AVInterstitialController shouldEnforceInterstitialPolicy](self, "shouldEnforceInterstitialPolicy")
        && self->_continuationTimeAfterInterstitial > 0.0)
      {
        _AVLog();
        v8 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
        {
          continuationTimeAfterInterstitial = self->_continuationTimeAfterInterstitial;
          v16 = 136315394;
          v17 = "-[AVInterstitialController didPresentInterstitialTimeRange:]";
          v18 = 2048;
          v19 = continuationTimeAfterInterstitial;
          _os_log_impl(&dword_1AC4B1000, v8, OS_LOG_TYPE_DEFAULT, "%s [interstitial] continuing at %.1f", (uint8_t *)&v16, 0x16u);
        }

        v10 = self->_continuationTimeAfterInterstitial;
        self->_continuationTimeAfterInterstitial = 0.0;
        -[AVInterstitialController didLeaveRequiredInterstitialTimeRangeBlock](self, "didLeaveRequiredInterstitialTimeRangeBlock");
        v11 = objc_claimAutoreleasedReturnValue();
        v12 = (void *)v11;
        if (v11)
          (*(void (**)(uint64_t, id, double))(v11 + 16))(v11, v4, v10);

      }
      -[AVInterstitialController setInterstitialTimeRangeInProgress:](self, "setInterstitialTimeRangeInProgress:", 0);
      -[AVInterstitialController didLeaveInterstitialTimeRangeBlock](self, "didLeaveInterstitialTimeRangeBlock");
      v13 = objc_claimAutoreleasedReturnValue();
      v14 = (void *)v13;
      if (v13)
        (*(void (**)(uint64_t, id))(v13 + 16))(v13, v4);
      -[AVInterstitialController delegateManager](self, "delegateManager");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "didPresentInterstitialGroup:", v6);

      objc_msgSend(v6, "_setActive:", 0);
      -[AVTimeControlling stopTimingObservation](self->_interstitialTimingController, "stopTimingObservation");

    }
  }

}

- (void)_setPendingTimeBoundary:(double)a3
{
  const void *v5;
  void *v6;
  id object;

  os_unfair_lock_lock((os_unfair_lock_t)&_pendingTimeBoundaryUnfairLock);
  -[AVInterstitialController currentItem](self, "currentItem");
  object = (id)objc_claimAutoreleasedReturnValue();
  if (object)
  {
    v5 = (const void *)_AVPlayerItemPendingTimeBoundaryKey;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_setAssociatedObject(object, v5, v6, (void *)0x301);

  }
  os_unfair_lock_unlock((os_unfair_lock_t)&_pendingTimeBoundaryUnfairLock);

}

- (double)_pendingTimeBoundary
{
  void *v3;
  void *v4;
  double v5;
  double v6;

  os_unfair_lock_lock((os_unfair_lock_t)&_pendingTimeBoundaryUnfairLock);
  -[AVInterstitialController currentItem](self, "currentItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_getAssociatedObject(v3, (const void *)_AVPlayerItemPendingTimeBoundaryKey);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock((os_unfair_lock_t)&_pendingTimeBoundaryUnfairLock);
  if (v4)
  {
    objc_msgSend(v4, "doubleValue");
    v6 = v5;
  }
  else
  {
    v6 = NAN;
  }

  return v6;
}

- (AVInterstitialControllerDelegateManager)delegateManager
{
  return (AVInterstitialControllerDelegateManager *)objc_loadWeakRetained((id *)&self->_delegateManager);
}

- (void)setInterstitialTimeRangeCollection:(id)a3
{
  objc_storeStrong((id *)&self->_interstitialTimeRangeCollection, a3);
}

- (double)continuationTimeAfterInterstitial
{
  return self->_continuationTimeAfterInterstitial;
}

- (id)didEnterInterstitialTimeRangeBlock
{
  return self->_didEnterInterstitialTimeRangeBlock;
}

- (void)setDidEnterInterstitialTimeRangeBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (id)didLeaveInterstitialTimeRangeBlock
{
  return self->_didLeaveInterstitialTimeRangeBlock;
}

- (void)setDidLeaveInterstitialTimeRangeBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (id)didLeaveRequiredInterstitialTimeRangeBlock
{
  return self->_didLeaveRequiredInterstitialTimeRangeBlock;
}

- (id)skipInterstitialTimeRangeBlock
{
  return self->_skipInterstitialTimeRangeBlock;
}

- (void)setSkipInterstitialTimeRangeBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (BOOL)shouldAlwaysSkipInterstitials
{
  return self->_shouldAlwaysSkipInterstitials;
}

- (void)setShouldAlwaysSkipInterstitials:(BOOL)a3
{
  self->_shouldAlwaysSkipInterstitials = a3;
}

- (AVTimeControlling)interstitialTimingController
{
  return self->_interstitialTimingController;
}

- (AVPlayerInterstitialEventController)eventController
{
  return self->_eventController;
}

- (AVObservationController)kvo
{
  return self->_kvo;
}

- (void)setKvo:(id)a3
{
  objc_storeStrong((id *)&self->_kvo, a3);
}

- (AVTimeRange)interstitialTimeRangeInProgress
{
  return self->_interstitialTimeRangeInProgress;
}

- (void)setInterstitialTimeRangeInProgress:(id)a3
{
  objc_storeStrong((id *)&self->_interstitialTimeRangeInProgress, a3);
}

- (id)interstitialBoundaryTimeObserver
{
  return self->_interstitialBoundaryTimeObserver;
}

- (void)setInterstitialBoundaryTimeObserver:(id)a3
{
  objc_storeStrong(&self->_interstitialBoundaryTimeObserver, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_interstitialBoundaryTimeObserver, 0);
  objc_storeStrong((id *)&self->_interstitialTimeRangeInProgress, 0);
  objc_storeStrong((id *)&self->_kvoPlayerItem, 0);
  objc_storeStrong((id *)&self->_kvo, 0);
  objc_storeStrong((id *)&self->_eventController, 0);
  objc_storeStrong((id *)&self->_eventMonitor, 0);
  objc_storeStrong((id *)&self->_interstitialTimingController, 0);
  objc_storeStrong(&self->_skipInterstitialTimeRangeBlock, 0);
  objc_storeStrong(&self->_didLeaveRequiredInterstitialTimeRangeBlock, 0);
  objc_storeStrong(&self->_didLeaveInterstitialTimeRangeBlock, 0);
  objc_storeStrong(&self->_didEnterInterstitialTimeRangeBlock, 0);
  objc_storeStrong((id *)&self->_interstitialTimeRangeCollection, 0);
  objc_destroyWeak((id *)&self->_delegateManager);
  objc_storeStrong((id *)&self->_interstitialPlayer, 0);
  objc_storeStrong((id *)&self->_player, 0);
  objc_storeStrong((id *)&self->_playerInterstitialCurrentEventChangedObserver, 0);
  objc_storeStrong((id *)&self->_playerInterstitialEventsChangedObserver, 0);
  objc_storeStrong((id *)&self->_playerInterstitialPlayerDidChangeObserver, 0);
  objc_storeStrong((id *)&self->_playerItemTimeJumpedObserver, 0);
}

void __54__AVInterstitialController_skipInterstitialTimeRange___block_invoke(uint64_t a1, int a2)
{
  NSObject *v3;
  const __CFString *v4;
  int v5;
  const __CFString *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  _AVLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = CFSTR("NO");
    if (a2)
      v4 = CFSTR("YES");
    v5 = 138412290;
    v6 = v4;
    _os_log_impl(&dword_1AC4B1000, v3, OS_LOG_TYPE_DEFAULT, "skipInterstitialTimeRange seek complete (finished = %@)", (uint8_t *)&v5, 0xCu);
  }

}

void __56__AVInterstitialController_currentInterstitialTimeRange__block_invoke(double a1)
{
  NSObject *v2;
  int v3;
  double v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  _AVLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = 134217984;
    v4 = a1;
    _os_log_impl(&dword_1AC4B1000, v2, OS_LOG_TYPE_DEFAULT, "duration of current interstitialEvent: %.1f sec", (uint8_t *)&v3, 0xCu);
  }

}

void __64__AVInterstitialController__stopObservingInterstitialTimeRanges__block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v3;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "interstitialBoundaryTimeObserver");
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  if (v1)
  {
    objc_msgSend(WeakRetained, "player");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "interstitialBoundaryTimeObserver");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "removeTimeObserver:", v3);

    objc_msgSend(WeakRetained, "setInterstitialBoundaryTimeObserver:", 0);
    objc_msgSend(WeakRetained, "_setPendingTimeBoundary:", NAN);

  }
}

void __65__AVInterstitialController__startObservingInterstitialTimeRanges__block_invoke(uint64_t a1)
{
  id *v1;
  id WeakRetained;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;
  void *v9;
  _QWORD v10[4];
  id v11;
  id v12;
  id location;

  v1 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "interstitialTimeRangeCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, v3);

  objc_msgSend(WeakRetained, "interstitialTimeRangeCollection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "arrayOfBoundaryTimes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v5, "count"))
  {
    objc_msgSend(WeakRetained, "interstitialBoundaryTimeObserver");
    if (objc_claimAutoreleasedReturnValue())
      __assert_rtn("-[AVInterstitialController _startObservingInterstitialTimeRanges]_block_invoke", "AVInterstitialController.m", 578, "![self interstitialBoundaryTimeObserver]");
    objc_msgSend(WeakRetained, "player");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = MEMORY[0x1E0C80D38];
    v8 = MEMORY[0x1E0C80D38];
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __65__AVInterstitialController__startObservingInterstitialTimeRanges__block_invoke_2;
    v10[3] = &unk_1E5BB2A98;
    objc_copyWeak(&v11, v1);
    objc_copyWeak(&v12, &location);
    objc_msgSend(v6, "addBoundaryTimeObserverForTimes:queue:usingBlock:", v5, v7, v10);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "setInterstitialBoundaryTimeObserver:", v9);

    objc_destroyWeak(&v12);
    objc_destroyWeak(&v11);

  }
  objc_destroyWeak(&location);

}

void __65__AVInterstitialController__startObservingInterstitialTimeRanges__block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  id v3;
  id v4;
  id v5;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v5 = WeakRetained;
    objc_msgSend(WeakRetained, "currentTime");
    objc_msgSend(v5, "_setPendingTimeBoundary:");
    v3 = objc_loadWeakRetained((id *)(a1 + 40));
    if (v3)
    {
      objc_msgSend(v5, "interstitialTimeRangeCollection");
      v4 = (id)objc_claimAutoreleasedReturnValue();

      if (v4 == v3)
        objc_msgSend(v5, "sendPendingInterstitialBoundaryNotificationIfNeeded");
    }

    WeakRetained = v5;
  }

}

void __54__AVInterstitialController_setupInterstitialObservers__block_invoke(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id *WeakRetained;
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  id v10;
  NSObject *v11;
  int v12;
  id v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = (id *)objc_loadWeakRetained(v2);
  objc_msgSend(v3, "object");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  _AVLog();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v12 = 138412290;
    v13 = v5;
    _os_log_impl(&dword_1AC4B1000, v6, OS_LOG_TYPE_DEFAULT, "AVPlayerInterstitialEventMonitorEventsDidChangeNotification received for %@", (uint8_t *)&v12, 0xCu);
  }

  if (WeakRetained && v5)
  {
    if (v5 == WeakRetained[16]
      || (objc_msgSend(v5, "primaryPlayer"),
          v7 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(WeakRetained[16], "primaryPlayer"),
          v8 = (void *)objc_claimAutoreleasedReturnValue(),
          v8,
          v7,
          v7 == v8))
    {
      _AVLog();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v12) = 0;
        _os_log_impl(&dword_1AC4B1000, v11, OS_LOG_TYPE_DEFAULT, "Updating synthesized interstitials, triggered by notification", (uint8_t *)&v12, 2u);
      }

      objc_msgSend(WeakRetained, "updateSynthesizedInterstitialTimeRanges");
    }
    else
    {
      _AVLog();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        v10 = WeakRetained[16];
        v12 = 138543618;
        v13 = v5;
        v14 = 2114;
        v15 = v10;
        _os_log_impl(&dword_1AC4B1000, v9, OS_LOG_TYPE_DEFAULT, "not updating synthesized interstitials, because the notification observer (%{public}@) is not our monitor (%{public}@)", (uint8_t *)&v12, 0x16u);
      }

    }
  }

}

void __54__AVInterstitialController_setupInterstitialObservers__block_invoke_19(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  _QWORD *WeakRetained;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  uint8_t v10[8];
  const __CFString *v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(v3, "object");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5 == (void *)WeakRetained[16])
  {
    _AVLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v10 = 0;
      _os_log_impl(&dword_1AC4B1000, v6, OS_LOG_TYPE_DEFAULT, "Updating current interstitial, triggered by notification", v10, 2u);
    }

    objc_msgSend(v5, "currentEvent");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "_sendInterstitialBoundaryNotificationsForEvent:", v7);
    if (v7)
    {
      v11 = CFSTR("currentEvent");
      v12[0] = v7;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, &v11, 1);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v8 = (void *)MEMORY[0x1E0C9AA70];
    }
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "postNotificationName:object:userInfo:", CFSTR("AVKitCurrentInterstitialEventChangedNotification"), WeakRetained, v8);

  }
}

void __32__AVInterstitialController_init__block_invoke_17(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_performInterstitialPlayerDependentUpdates");

}

- (id)interstitialTimeRangeForPlayerInterstitialEvent:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
  void *i;
  void *v11;
  void *v12;
  char v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[AVInterstitialController currentItem](self, "currentItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "interstitialTimeRanges");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v7 = v6;
  v8 = (id)objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v16;
    while (2)
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(_QWORD *)v16 != v9)
          objc_enumerationMutation(v7);
        v11 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v11, "playerInterstitialEvent", (_QWORD)v15);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v4, "isEqual:", v12);

        if ((v13 & 1) != 0)
        {
          v8 = v11;
          goto LABEL_11;
        }
      }
      v8 = (id)objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      if (v8)
        continue;
      break;
    }
  }
LABEL_11:

  return v8;
}

- (id)timeRangeForPlayerInterstitialEvent:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  void *i;
  void *v10;
  void *v11;
  void *v12;
  char v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[AVInterstitialController interstitialTimeRangeCollection](self, "interstitialTimeRangeCollection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  objc_msgSend(v5, "timeRanges", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (id)objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v16;
    while (2)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v16 != v8)
          objc_enumerationMutation(v6);
        v10 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v10, "interstice");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "playerInterstitialEvent");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v4, "isEqual:", v12);

        if ((v13 & 1) != 0)
        {
          v7 = v10;

          goto LABEL_11;
        }

      }
      v7 = (id)objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      if (v7)
        continue;
      break;
    }
  }
LABEL_11:

  return v7;
}

- (BOOL)loadDurationOfCurrentOrNextInterstitialEvent:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  BOOL v12;
  _QWORD v14[4];
  id v15;
  id v16;
  AVInterstitialController *v17;
  id v18;

  v4 = a3;
  -[AVPlayerInterstitialEventMonitor currentEvent](self->_eventMonitor, "currentEvent");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVPlayerInterstitialEventMonitor interstitialPlayer](self->_eventMonitor, "interstitialPlayer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v5
    || (objc_msgSend(v6, "items"),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        v9 = objc_msgSend(v8, "count"),
        v8,
        v9))
  {
    v10 = (void *)objc_msgSend(v4, "copy");

    objc_msgSend((id)objc_opt_class(), "interstitialQueue");
    v11 = objc_claimAutoreleasedReturnValue();
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __102__AVInterstitialController_AVPlayerInterstitialSupport__loadDurationOfCurrentOrNextInterstitialEvent___block_invoke;
    v14[3] = &unk_1E5BB4B48;
    v15 = v7;
    v16 = v5;
    v17 = self;
    v4 = v10;
    v18 = v4;
    dispatch_async(v11, v14);

    v12 = 1;
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

void __102__AVInterstitialController_AVPlayerInterstitialSupport__loadDurationOfCurrentOrNextInterstitialEvent___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  id v8;
  dispatch_time_t v9;
  id v10;
  uint64_t v11;
  void *v12;
  NSObject *v13;
  _QWORD block[4];
  NSObject *v15;
  id v16;
  uint64_t v17;
  id v18;
  _QWORD *v19;
  _QWORD v20[4];
  id v21;
  NSObject *v22;
  _QWORD *v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _QWORD v28[4];
  __int128 v29;
  uint64_t v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v28[0] = 0;
  v28[1] = v28;
  v28[2] = 0x3810000000;
  v28[3] = &unk_1AC617EFB;
  v29 = *MEMORY[0x1E0CA2E68];
  v30 = *(_QWORD *)(MEMORY[0x1E0CA2E68] + 16);
  v2 = dispatch_group_create();
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "items");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v24, v31, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v25;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v25 != v5)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v24 + 1) + 8 * i), "asset");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        if (v7)
        {
          dispatch_group_enter(v2);
          v20[0] = MEMORY[0x1E0C809B0];
          v20[1] = 3221225472;
          v20[2] = __102__AVInterstitialController_AVPlayerInterstitialSupport__loadDurationOfCurrentOrNextInterstitialEvent___block_invoke_2;
          v20[3] = &unk_1E5BB4720;
          v8 = v7;
          v21 = v8;
          v23 = v28;
          v22 = v2;
          objc_msgSend(v8, "loadValuesAsynchronouslyForKeys:completionHandler:", &unk_1E5BF3FF0, v20);

        }
      }
      v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v24, v31, 16);
    }
    while (v4);
  }

  v9 = dispatch_time(0, 5000000000);
  dispatch_group_wait(v2, v9);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __102__AVInterstitialController_AVPlayerInterstitialSupport__loadDurationOfCurrentOrNextInterstitialEvent___block_invoke_3;
  block[3] = &unk_1E5BB2B60;
  v15 = v2;
  v19 = v28;
  v10 = *(id *)(a1 + 40);
  v11 = *(_QWORD *)(a1 + 48);
  v12 = *(void **)(a1 + 56);
  v16 = v10;
  v17 = v11;
  v18 = v12;
  v13 = v2;
  dispatch_async(MEMORY[0x1E0C80D38], block);

  _Block_object_dispose(v28, 8);
}

void __102__AVInterstitialController_AVPlayerInterstitialSupport__loadDurationOfCurrentOrNextInterstitialEvent___block_invoke_2(uint64_t a1)
{
  void *v2;
  char flags;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  CMTime v7;
  CMTime lhs;
  CMTime v9;
  CMTime v10;

  memset(&v10, 0, sizeof(v10));
  v2 = *(void **)(a1 + 32);
  if (v2)
  {
    objc_msgSend(v2, "duration");
    flags = v10.flags;
    if ((~v10.flags & 0x11) == 0)
    {
      v4 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
      v5 = MEMORY[0x1E0CA2E10];
      *(_OWORD *)(v4 + 32) = *MEMORY[0x1E0CA2E10];
      *(_QWORD *)(v4 + 48) = *(_QWORD *)(v5 + 16);
    }
  }
  else
  {
    flags = 0;
  }
  if ((flags & 0x1D) == 1)
  {
    v6 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    if ((*(_DWORD *)(v6 + 44) & 0x11) != 0x11)
    {
      lhs = *(CMTime *)(v6 + 32);
      v7 = v10;
      CMTimeAdd(&v9, &lhs, &v7);
      *(CMTime *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 32) = v9;
    }
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

void __102__AVInterstitialController_AVPlayerInterstitialSupport__loadDurationOfCurrentOrNextInterstitialEvent___block_invoke_3(uint64_t a1)
{
  double Seconds;
  void *v3;
  void *v4;
  void *v5;
  CMTime v6;

  if (dispatch_group_wait(*(dispatch_group_t *)(a1 + 32), 0))
  {
    Seconds = NAN;
  }
  else
  {
    v6 = *(CMTime *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 32);
    Seconds = CMTimeGetSeconds(&v6);
  }
  v3 = *(void **)(a1 + 48);
  if (*(_QWORD *)(a1 + 40))
    objc_msgSend(v3, "timeRangeForPlayerInterstitialEvent:");
  else
    objc_msgSend(v3, "nextInterstitialTimeRange");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "interstice");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_setPlayingDuration:", Seconds);

  (*(void (**)(double))(*(_QWORD *)(a1 + 56) + 16))(Seconds);
}

+ (id)newTimeRangeCollectionForPlayerItem:(id)a3 reversePlaybackEndTime:(id *)a4 forwardPlaybackEndTime:(id *)a5
{
  id v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  uint64_t v15;
  CMTimeEpoch v16;
  AVInterstitialTimeRange *v17;
  AVInterstitialTimeRange *v18;
  void *v19;
  uint64_t v20;
  AVInterstitialTimeRange *v21;
  AVInterstitialTimeRange *v22;
  uint64_t v23;
  AVTimeRangeCollection *v24;
  __int128 v26;
  CMTimeRange v27;
  CMTimeRange v28;
  CMTime time2;
  CMTime time1;
  CMTime v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  char v36;
  char v37;
  AVInterstitialTimeRange *v38;
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = v7;
  if (v7)
  {
    objc_msgSend(v7, "interstitialTimeRanges");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v8, "status") == 1)
    {
      objc_msgSend(v8, "duration");
      if ((v37 & 1) != 0)
      {
        objc_msgSend(v8, "duration");
        if ((v36 & 0x10) != 0)
        {
          v34 = 0u;
          v35 = 0u;
          v32 = 0u;
          v33 = 0u;
          v10 = v9;
          v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v32, v39, 16);
          if (v11)
          {
            v12 = v11;
            v13 = *(_QWORD *)v33;
            do
            {
              for (i = 0; i != v12; ++i)
              {
                if (*(_QWORD *)v33 != v13)
                  objc_enumerationMutation(v10);
                objc_msgSend(*(id *)(*((_QWORD *)&v32 + 1) + 8 * i), "_setCollapsedInTimeLine:", 0);
              }
              v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v32, v39, 16);
            }
            while (v12);
          }

        }
      }
    }
    memset(&v31, 0, sizeof(v31));
    objc_msgSend(v8, "duration");
    v15 = MEMORY[0x1E0CA2E68];
    if ((a4->var2 & 1) != 0
      && (time1 = (CMTime)*a4,
          v26 = *MEMORY[0x1E0CA2E68],
          *(_OWORD *)&time2.value = *MEMORY[0x1E0CA2E68],
          v16 = *(_QWORD *)(MEMORY[0x1E0CA2E68] + 16),
          time2.epoch = v16,
          CMTimeCompare(&time1, &time2) >= 1))
    {
      v17 = [AVInterstitialTimeRange alloc];
      *(_OWORD *)&time1.value = v26;
      time1.epoch = v16;
      time2 = (CMTime)*a4;
      CMTimeRangeMake(&v28, &time1, &time2);
      v18 = -[AVInterstitialTimeRange initWithHiddenTimeRange:](v17, "initWithHiddenTimeRange:", &v28);
      v38 = v18;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v38, 1);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "arrayByAddingObjectsFromArray:", v9);
      v20 = objc_claimAutoreleasedReturnValue();

      v9 = (void *)v20;
    }
    else
    {
      *(_OWORD *)&a4->var0 = *(_OWORD *)v15;
      a4->var3 = *(_QWORD *)(v15 + 16);
    }
    if ((a5->var2 & 1) != 0)
    {
      time1 = (CMTime)*a5;
      time2 = (CMTime)*a4;
      if (CMTimeCompare(&time1, &time2) >= 1)
      {
        time1 = (CMTime)*a5;
        time2 = v31;
        if (CMTimeCompare(&time1, &time2) < 0)
        {
          v21 = [AVInterstitialTimeRange alloc];
          time1 = (CMTime)*a5;
          time2 = v31;
          CMTimeRangeFromTimeToTime(&v27, &time1, &time2);
          v22 = -[AVInterstitialTimeRange initWithHiddenTimeRange:](v21, "initWithHiddenTimeRange:", &v27);
          objc_msgSend(v9, "arrayByAddingObject:", v22);
          v23 = objc_claimAutoreleasedReturnValue();

          v9 = (void *)v23;
        }
      }
    }
    if (objc_msgSend(v9, "count", v26))
      v24 = -[AVTimeRangeCollection initWithInterstitialTimeRanges:]([AVTimeRangeCollection alloc], "initWithInterstitialTimeRanges:", v9);
    else
      v24 = 0;

  }
  else
  {
    v24 = 0;
  }

  return v24;
}

+ (id)interstitialQueue
{
  if (interstitialQueue_onceToken != -1)
    dispatch_once(&interstitialQueue_onceToken, &__block_literal_global_206);
  return (id)interstitialQueue__interstitialQueue;
}

void __74__AVInterstitialController_AVPlayerInterstitialSupport__interstitialQueue__block_invoke()
{
  dispatch_queue_t v0;
  void *v1;

  v0 = dispatch_queue_create("com.apple.avkit.interstitial", 0);
  v1 = (void *)interstitialQueue__interstitialQueue;
  interstitialQueue__interstitialQueue = (uint64_t)v0;

}

@end
