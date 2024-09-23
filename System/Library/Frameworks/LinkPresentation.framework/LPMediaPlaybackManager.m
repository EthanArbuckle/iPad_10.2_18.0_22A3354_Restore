@implementation LPMediaPlaybackManager

- (LPMediaPlaybackManager)init
{
  LPMediaPlaybackManager *v2;
  uint64_t v3;
  NSHashTable *mediaPlayers;
  void *v5;
  _QWORD *v6;
  void *v7;
  void *v8;
  LPMediaPlaybackManager *v9;
  objc_super v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  v11.receiver = self;
  v11.super_class = (Class)LPMediaPlaybackManager;
  v2 = -[LPMediaPlaybackManager init](&v11, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v3 = objc_claimAutoreleasedReturnValue();
    mediaPlayers = v2->_mediaPlayers;
    v2->_mediaPlayers = (NSHashTable *)v3;

    objc_msgSend(MEMORY[0x1E0D48560], "sharedAVSystemController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (_QWORD *)MEMORY[0x1E0D482B0];
    v12[0] = *MEMORY[0x1E0D482B0];
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setAttribute:forKey:error:", v7, *MEMORY[0x1E0D48280], 0);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObserver:selector:name:object:", v2, sel_volumeChanged_, *v6, 0);

    v9 = v2;
  }

  return v2;
}

+ (id)shared
{
  void *v2;
  LPMediaPlaybackManager *v3;
  void *v4;

  v2 = (void *)shared_singleton_0;
  if (!shared_singleton_0)
  {
    v3 = objc_alloc_init(LPMediaPlaybackManager);
    v4 = (void *)shared_singleton_0;
    shared_singleton_0 = (uint64_t)v3;

    v2 = (void *)shared_singleton_0;
  }
  return v2;
}

- (void)addMediaPlayer:(id)a3
{
  -[NSHashTable addObject:](self->_mediaPlayers, "addObject:", a3);
}

- (void)removeMediaPlayer:(id)a3
{
  -[NSHashTable removeObject:](self->_mediaPlayers, "removeObject:", a3);
}

- (void)mediaPlayer:(id)a3 didChangePlayingState:(BOOL)a4
{
  _BOOL4 v4;
  id v6;

  v4 = a4;
  v6 = a3;
  if (v4 && objc_msgSend(v6, "isActive"))
    -[LPMediaPlaybackManager _deactivateAllPlayingMediaPlayersExcept:](self, "_deactivateAllPlayingMediaPlayersExcept:", v6);
  -[LPMediaPlaybackManager _updateAudioSessionCategory](self, "_updateAudioSessionCategory");

}

- (void)mediaPlayer:(id)a3 didChangeMutedState:(BOOL)a4
{
  id v6;

  v6 = a3;
  if (!a4)
    -[LPMediaPlaybackManager _deactivateAllPlayingMediaPlayersExcept:](self, "_deactivateAllPlayingMediaPlayersExcept:", v6);
  -[LPMediaPlaybackManager _updateAudioSessionCategory](self, "_updateAudioSessionCategory");

}

- (void)_deactivateAllPlayingMediaPlayersExcept:(id)a3
{
  id v4;
  NSHashTable *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v5 = self->_mediaPlayers;
  v6 = -[NSHashTable countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v11;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v5);
        v9 = *(id *)(*((_QWORD *)&v10 + 1) + 8 * v8);
        if (v9 != v4
          && objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v8), "isActive", (_QWORD)v10)
          && objc_msgSend(v9, "isPlaying"))
        {
          objc_msgSend(v9, "setActive:", 0);
        }
        ++v8;
      }
      while (v6 != v8);
      v6 = -[NSHashTable countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v6);
  }

}

- (BOOL)releaseDecodingResourcesForInactivePlayers
{
  NSHashTable *v2;
  int v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
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
  v2 = self->_mediaPlayers;
  v3 = 0;
  v4 = -[NSHashTable countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v10;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v10 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v9 + 1) + 8 * v6);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          v3 |= objc_msgSend(v7, "releaseDecodingResourcesIfInactive", (_QWORD)v9);
        ++v6;
      }
      while (v4 != v6);
      v4 = -[NSHashTable countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v4);
  }

  return v3 & 1;
}

- (id)audioSession
{
  void *v2;
  uint64_t v3;
  void *v4;

  v2 = (void *)audioSession_session;
  if (!audioSession_session)
  {
    v3 = objc_msgSend(objc_alloc(MEMORY[0x1E0C89AE8]), "initAuxiliarySession");
    v4 = (void *)audioSession_session;
    audioSession_session = v3;

    objc_msgSend((id)audioSession_session, "setCategory:error:", *MEMORY[0x1E0C89660], 0);
    v2 = (void *)audioSession_session;
  }
  return v2;
}

- (BOOL)_sharedSessionHasPlayingAudio
{
  NSHashTable *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t i;
  void *v6;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v2 = self->_mediaPlayers;
  v3 = -[NSHashTable countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v9;
    while (2)
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v9 != v4)
          objc_enumerationMutation(v2);
        v6 = *(void **)(*((_QWORD *)&v8 + 1) + 8 * i);
        if ((objc_msgSend(v6, "isMuted", (_QWORD)v8) & 1) == 0
          && objc_msgSend(v6, "isPlaying")
          && (objc_msgSend(v6, "usesSharedAudioSession") & 1) != 0)
        {
          LOBYTE(v3) = 1;
          goto LABEL_13;
        }
      }
      v3 = -[NSHashTable countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
      if (v3)
        continue;
      break;
    }
  }
LABEL_13:

  return v3;
}

- (void)_updateAudioSessionCategory
{
  _BOOL4 v3;
  id *v4;
  id v5;
  void *v6;
  char v7;
  id v8;

  -[LPMediaPlaybackManager audioSession](self, "audioSession");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  v3 = -[LPMediaPlaybackManager _sharedSessionHasPlayingAudio](self, "_sharedSessionHasPlayingAudio");
  v4 = (id *)MEMORY[0x1E0C89690];
  if (!v3)
    v4 = (id *)MEMORY[0x1E0C89660];
  v5 = *v4;
  objc_msgSend(v8, "category");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "isEqualToString:", v6);

  if ((v7 & 1) == 0)
    objc_msgSend(v8, "setCategory:error:", v5, 0);

}

- (void)_volumeChanged
{
  id v3;
  NSHashTable *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  unint64_t v14;
  NSHashTable *v15;
  id v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  double v20;
  uint64_t j;
  void *v22;
  double v23;
  double v24;
  id v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _BYTE v38[128];
  _BYTE v39[128];
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  v4 = self->_mediaPlayers;
  v5 = -[NSHashTable countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v34, v40, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v35;
LABEL_3:
    v7 = 0;
    while (1)
    {
      if (*(_QWORD *)v35 != v6)
        objc_enumerationMutation(v4);
      v8 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * v7);
      if ((objc_msgSend(v8, "isFullScreen") & 1) != 0
        || (objc_msgSend(v8, "isMuted") & 1) == 0 && (objc_msgSend(v8, "isPlaying") & 1) != 0)
      {
        break;
      }
      if (objc_msgSend(v8, "shouldUnmuteWhenUserAdjustsVolume")
        && objc_msgSend(v8, "isPlaying"))
      {
        objc_msgSend(v3, "addObject:", v8);
      }
      if (v5 == ++v7)
      {
        v5 = -[NSHashTable countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v34, v40, 16);
        if (v5)
          goto LABEL_3;
        goto LABEL_14;
      }
    }
  }
  else
  {
LABEL_14:

    v32 = 0u;
    v33 = 0u;
    v30 = 0u;
    v31 = 0u;
    v9 = v3;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v30, v39, 16);
    if (v10)
    {
      v4 = 0;
      v11 = *(_QWORD *)v31;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v31 != v11)
            objc_enumerationMutation(v9);
          v13 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * i);
          v14 = objc_msgSend(v13, "lastInteractionTimestamp");
          if (v14 > -[NSHashTable lastInteractionTimestamp](v4, "lastInteractionTimestamp"))
          {
            v15 = v13;

            v4 = v15;
          }
        }
        v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v30, v39, 16);
      }
      while (v10);

      if (v4)
      {
        -[NSHashTable setActive:](v4, "setActive:", 1);
        goto LABEL_36;
      }
    }
    else
    {

    }
    v28 = 0u;
    v29 = 0u;
    v26 = 0u;
    v27 = 0u;
    v16 = v9;
    v17 = 0;
    v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v26, v38, 16);
    if (v18)
    {
      v19 = *(_QWORD *)v27;
      v20 = 0.0;
      do
      {
        for (j = 0; j != v18; ++j)
        {
          if (*(_QWORD *)v27 != v19)
            objc_enumerationMutation(v16);
          v22 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * j);
          objc_msgSend(v22, "unobscuredAreaFraction", (_QWORD)v26);
          v24 = v23;
          if (v23 > v20)
          {
            v25 = v22;

            v17 = v25;
            v20 = v24;
          }
        }
        v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v26, v38, 16);
      }
      while (v18);
    }

    objc_msgSend(v17, "setActive:", 1);
    v4 = 0;
  }
LABEL_36:

}

- (void)volumeChanged:(id)a3
{
  void *v4;
  void *v5;
  char v6;
  _QWORD block[5];

  objc_msgSend(a3, "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", *MEMORY[0x1E0D47EC0]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqualToString:", CFSTR("ExplicitVolumeChange"));

  if ((v6 & 1) != 0)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __40__LPMediaPlaybackManager_volumeChanged___block_invoke;
    block[3] = &unk_1E44A7CE8;
    block[4] = self;
    dispatch_async(MEMORY[0x1E0C80D38], block);
  }
}

uint64_t __40__LPMediaPlaybackManager_volumeChanged___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_volumeChanged");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mediaPlayers, 0);
}

@end
