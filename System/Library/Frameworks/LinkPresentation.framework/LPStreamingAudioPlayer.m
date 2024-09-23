@implementation LPStreamingAudioPlayer

+ (id)playerWithAudio:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id *v9;
  void *v10;
  void *v11;
  char v12;
  void *v13;
  void *v14;
  char v15;
  void *v16;
  void *v17;
  BOOL v18;
  id *v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  allStreamingAudioPlayers();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v22;
    while (2)
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v22 != v7)
          objc_enumerationMutation(v5);
        v9 = *(id **)(*((_QWORD *)&v21 + 1) + 8 * v8);
        objc_msgSend(v9[1], "streamingURL", (_QWORD)v21);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "streamingURL");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v10, "isEqual:", v11);

        if ((v12 & 1) != 0)
          goto LABEL_12;
        objc_msgSend(v9[1], "fileURL");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "fileURL");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v13, "isEqual:", v14);

        if ((v15 & 1) != 0
          || (objc_msgSend(v9[1], "_asset"),
              v16 = (void *)objc_claimAutoreleasedReturnValue(),
              objc_msgSend(v4, "_asset"),
              v17 = (void *)objc_claimAutoreleasedReturnValue(),
              v18 = v16 == v17,
              v17,
              v16,
              v18))
        {
LABEL_12:
          v19 = v9;

          goto LABEL_13;
        }
        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
      if (v6)
        continue;
      break;
    }
  }

  v19 = (id *)objc_msgSend(objc_alloc((Class)a1), "initWithAudio:", v4);
LABEL_13:

  return v19;
}

- (LPStreamingAudioPlayer)initWithAudio:(id)a3
{
  id v5;
  LPStreamingAudioPlayer *v6;
  LPStreamingAudioPlayer *v7;
  void *v8;
  void *v9;
  LPStreamingAudioPlayer *v10;

  v5 = a3;
  v6 = -[LPStreamingAudioPlayer init](self, "init");
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_audio, a3);
    v7->_state = 0;
    +[LPMediaPlaybackManager shared](LPMediaPlaybackManager, "shared");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addMediaPlayer:", v7);

    allStreamingAudioPlayers();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addObject:", v7);

    v10 = v7;
  }

  return v7;
}

- (void)dealloc
{
  void *v3;
  AVPlayer *player;
  void *v5;
  void *v6;
  objc_super v7;

  if (self->_timeObserver)
    -[AVPlayer removeTimeObserver:](self->_player, "removeTimeObserver:");
  if (self->_endObserver)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "removeObserver:name:object:", self->_endObserver, *MEMORY[0x1E0C8AC48], self->_item);

  }
  player = self->_player;
  if (player)
    -[AVPlayer removeObserver:forKeyPath:context:](player, "removeObserver:forKeyPath:context:", self, CFSTR("timeControlStatus"), timeControlStatusKVOContext_0);
  +[LPMediaPlaybackManager shared](LPMediaPlaybackManager, "shared");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeMediaPlayer:", self);

  allStreamingAudioPlayers();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeObject:", self);

  v7.receiver = self;
  v7.super_class = (Class)LPStreamingAudioPlayer;
  -[LPStreamingAudioPlayer dealloc](&v7, sel_dealloc);
}

- (void)play
{
  AVPlayer *player;
  id v4;
  void *v5;
  AVPlayerItem *v6;
  AVPlayerItem *item;
  AVPlayer *v8;
  AVPlayer *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  AVPlayerItem *v14;
  void *v15;
  id endObserver;
  uint64_t v17;
  uint64_t v18;
  void (*v19)(uint64_t);
  void *v20;
  id v21;
  id location;

  objc_storeStrong((id *)&currentlyPlayingPlayer, self);
  player = self->_player;
  if (!player)
  {
    v4 = objc_alloc(MEMORY[0x1E0C8B300]);
    -[LPAudio _asset](self->_audio, "_asset");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (AVPlayerItem *)objc_msgSend(v4, "initWithAsset:", v5);
    item = self->_item;
    self->_item = v6;

    v8 = (AVPlayer *)objc_msgSend(objc_alloc(MEMORY[0x1E0C8B2E8]), "initWithPlayerItem:", self->_item);
    v9 = self->_player;
    self->_player = v8;

    +[LPMediaPlaybackManager shared](LPMediaPlaybackManager, "shared");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "audioSession");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVPlayer setAudioSession:](self->_player, "setAudioSession:", v11);

    -[AVPlayer addObserver:forKeyPath:options:context:](self->_player, "addObserver:forKeyPath:options:context:", self, CFSTR("timeControlStatus"), 5, timeControlStatusKVOContext_0);
    objc_initWeak(&location, self);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = *MEMORY[0x1E0C8AC48];
    v14 = self->_item;
    v17 = MEMORY[0x1E0C809B0];
    v18 = 3221225472;
    v19 = __30__LPStreamingAudioPlayer_play__block_invoke;
    v20 = &unk_1E44A9520;
    objc_copyWeak(&v21, &location);
    objc_msgSend(v12, "addObserverForName:object:queue:usingBlock:", v13, v14, 0, &v17);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    endObserver = self->_endObserver;
    self->_endObserver = v15;

    objc_destroyWeak(&v21);
    objc_destroyWeak(&location);
    player = self->_player;
  }
  -[AVPlayer play](player, "play", v17, v18, v19, v20);
}

void __30__LPStreamingAudioPlayer_play__block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  void *v3;
  __int128 v4;
  uint64_t v5;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    v3 = (void *)*((_QWORD *)WeakRetained + 3);
    v4 = *MEMORY[0x1E0CA2E68];
    v5 = *(_QWORD *)(MEMORY[0x1E0CA2E68] + 16);
    objc_msgSend(v3, "seekToTime:", &v4);
    objc_msgSend(v2, "transitionToState:", 4);
  }

}

- (void)pause
{
  -[AVPlayer pause](self->_player, "pause");
}

- (float)progress
{
  double v2;
  AVPlayerItem *item;
  double Seconds;
  AVPlayerItem *v6;
  CMTime v8;
  CMTime time;

  LODWORD(v2) = 1.0;
  if (self->_state != 4)
  {
    item = self->_item;
    if (item)
      -[AVPlayerItem currentTime](item, "currentTime", v2);
    else
      memset(&time, 0, sizeof(time));
    Seconds = CMTimeGetSeconds(&time);
    v6 = self->_item;
    if (v6)
      -[AVPlayerItem duration](v6, "duration");
    else
      memset(&v8, 0, sizeof(v8));
    *(float *)&v2 = Seconds / CMTimeGetSeconds(&v8);
  }
  return *(float *)&v2;
}

- (unint64_t)state
{
  return self->_state;
}

- (void)addClient:(id)a3
{
  id v4;
  NSHashTable *clients;
  NSHashTable *v6;
  NSHashTable *v7;
  id v8;

  v4 = a3;
  clients = self->_clients;
  v8 = v4;
  if (!clients)
  {
    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v6 = (NSHashTable *)objc_claimAutoreleasedReturnValue();
    v7 = self->_clients;
    self->_clients = v6;

    clients = self->_clients;
    v4 = v8;
  }
  -[NSHashTable addObject:](clients, "addObject:", v4);

}

- (void)removeClient:(id)a3
{
  -[NSHashTable removeObject:](self->_clients, "removeObject:", a3);
}

- (void)dispatchDidChangeProgressToAllClients:(float)a3
{
  NSHashTable *v5;
  uint64_t v6;
  double v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v5 = self->_clients;
  v6 = -[NSHashTable countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        *(float *)&v7 = a3;
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v9++), "audioPlayer:didChangeProgress:", self, v7, (_QWORD)v10);
      }
      while (v6 != v9);
      v6 = -[NSHashTable countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v6);
  }

}

- (void)dispatchDidTransitionToStateToAllClients:(unint64_t)a3
{
  NSHashTable *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v5 = self->_clients;
  v6 = -[NSHashTable countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v10;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v10 != v7)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * v8++), "audioPlayer:didTransitionToState:", self, a3, (_QWORD)v9);
      }
      while (v6 != v8);
      v6 = -[NSHashTable countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }

}

- (void)dispatchDidFailToPlayToAllClients
{
  NSHashTable *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v3 = self->_clients;
  v4 = -[NSHashTable countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v8;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v8 != v5)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * v6++), "audioPlayerDidFailToPlay:", self, (_QWORD)v7);
      }
      while (v4 != v6);
      v4 = -[NSHashTable countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v4);
  }

}

- (void)setActive:(BOOL)a3
{
  AVPlayer *player;

  player = self->_player;
  if (a3)
    -[AVPlayer play](player, "play");
  else
    -[AVPlayer pause](player, "pause");
}

- (BOOL)isMuted
{
  return 0;
}

- (BOOL)isPlaying
{
  return self->_state == 2;
}

- (BOOL)hasMuteControl
{
  return 0;
}

- (void)setPlaying:(BOOL)a3
{
  if (a3)
    -[LPStreamingAudioPlayer play](self, "play");
  else
    -[LPStreamingAudioPlayer pause](self, "pause");
}

- (void)resetPlaybackState
{
  AVPlayer *player;
  __int128 v4;
  uint64_t v5;

  -[LPStreamingAudioPlayer setPlaying:](self, "setPlaying:", 0);
  player = self->_player;
  v4 = *MEMORY[0x1E0CA2E68];
  v5 = *(_QWORD *)(MEMORY[0x1E0CA2E68] + 16);
  -[AVPlayer seekToTime:](player, "seekToTime:", &v4);
  -[LPStreamingAudioPlayer transitionToState:](self, "transitionToState:", 0);
}

- (BOOL)usesSharedAudioSession
{
  return 1;
}

- (BOOL)isFullScreen
{
  return 0;
}

- (BOOL)shouldUnmuteWhenUserAdjustsVolume
{
  return 0;
}

- (void)transitionToState:(unint64_t)a3
{
  unint64_t state;
  AVPlayer *player;
  uint64_t v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  id timeObserver;
  id v13;
  void *v14;
  _QWORD v15[4];
  id v16;
  CMTime v17;
  id location;

  state = self->_state;
  self->_state = a3;
  switch(a3)
  {
    case 4uLL:
      if (self->_timeObserver)
      {
        -[AVPlayer removeTimeObserver:](self->_player, "removeTimeObserver:");
        timeObserver = self->_timeObserver;
        self->_timeObserver = 0;

      }
      goto LABEL_13;
    case 3uLL:
      if (state == 4)
      {
        self->_state = 4;
        break;
      }
      if (self->_timeObserver)
      {
        -[AVPlayer removeTimeObserver:](self->_player, "removeTimeObserver:");
        v13 = self->_timeObserver;
        self->_timeObserver = 0;

      }
      else
      {
        -[LPStreamingAudioPlayer dispatchDidFailToPlayToAllClients](self, "dispatchDidFailToPlayToAllClients");
        self->_state = 0;
      }
LABEL_13:
      +[LPMediaPlaybackManager shared](LPMediaPlaybackManager, "shared");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "mediaPlayer:didChangePlayingState:", self, 0);

      break;
    case 2uLL:
      objc_initWeak(&location, self);
      player = self->_player;
      CMTimeMake(&v17, 1, 30);
      v7 = MEMORY[0x1E0C80D38];
      v8 = MEMORY[0x1E0C80D38];
      v15[0] = MEMORY[0x1E0C809B0];
      v15[1] = 3221225472;
      v15[2] = __44__LPStreamingAudioPlayer_transitionToState___block_invoke;
      v15[3] = &unk_1E44A9548;
      objc_copyWeak(&v16, &location);
      -[AVPlayer addPeriodicTimeObserverForInterval:queue:usingBlock:](player, "addPeriodicTimeObserverForInterval:queue:usingBlock:", &v17, v7, v15);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = self->_timeObserver;
      self->_timeObserver = v9;

      +[LPMediaPlaybackManager shared](LPMediaPlaybackManager, "shared");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "mediaPlayer:didChangePlayingState:", self, 1);

      objc_destroyWeak(&v16);
      objc_destroyWeak(&location);
      goto LABEL_17;
  }
  if (a3 - 3 <= 0xFFFFFFFFFFFFFFFDLL && (LPStreamingAudioPlayer *)currentlyPlayingPlayer == self)
  {
    currentlyPlayingPlayer = 0;

  }
LABEL_17:
  if (state != self->_state)
    -[LPStreamingAudioPlayer dispatchDidTransitionToStateToAllClients:](self, "dispatchDidTransitionToStateToAllClients:");
}

void __44__LPStreamingAudioPlayer_transitionToState___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "progress");
  objc_msgSend(WeakRetained, "dispatchDidChangeProgressToAllClients:");

}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10;
  id v11;
  id v12;
  AVPlayerTimeControlStatus v13;
  uint64_t v14;
  void *v15;
  void *v16;
  objc_super v17;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  if ((void *)timeControlStatusKVOContext_0 == a6)
  {
    v13 = -[AVPlayer timeControlStatus](self->_player, "timeControlStatus");
    if (v13)
    {
      if (v13 == AVPlayerTimeControlStatusWaitingToPlayAtSpecifiedRate)
      {
        -[AVPlayer reasonForWaitingToPlay](self->_player, "reasonForWaitingToPlay");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = (void *)*MEMORY[0x1E0C8ACC0];

        if (v15 != v16)
          goto LABEL_11;
        v14 = 1;
      }
      else
      {
        if (v13 != AVPlayerTimeControlStatusPlaying)
          goto LABEL_11;
        v14 = 2;
      }
    }
    else
    {
      v14 = 3;
    }
    -[LPStreamingAudioPlayer transitionToState:](self, "transitionToState:", v14);
    goto LABEL_11;
  }
  v17.receiver = self;
  v17.super_class = (Class)LPStreamingAudioPlayer;
  -[LPStreamingAudioPlayer observeValueForKeyPath:ofObject:change:context:](&v17, sel_observeValueForKeyPath_ofObject_change_context_, v10, v11, v12, a6);
LABEL_11:

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clients, 0);
  objc_storeStrong(&self->_endObserver, 0);
  objc_storeStrong(&self->_timeObserver, 0);
  objc_storeStrong((id *)&self->_player, 0);
  objc_storeStrong((id *)&self->_item, 0);
  objc_storeStrong((id *)&self->_audio, 0);
}

@end
