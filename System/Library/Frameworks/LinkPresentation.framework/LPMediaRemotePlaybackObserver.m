@implementation LPMediaRemotePlaybackObserver

+ (id)shared
{
  if (shared_onceToken_0 != -1)
    dispatch_once(&shared_onceToken_0, &__block_literal_global_20);
  return (id)shared_observer_0;
}

void __39__LPMediaRemotePlaybackObserver_shared__block_invoke()
{
  LPMediaRemotePlaybackObserver *v0;
  void *v1;

  v0 = objc_alloc_init(LPMediaRemotePlaybackObserver);
  v1 = (void *)shared_observer_0;
  shared_observer_0 = (uint64_t)v0;

}

- (void)addClient:(id)a3
{
  id v4;
  NSHashTable *clients;
  NSHashTable *v6;
  NSHashTable *v7;
  double v8;
  double v9;
  NSTimer *timer;
  double v11;
  NSTimer *v12;
  NSTimer *v13;
  id v14;

  v4 = a3;
  clients = self->_clients;
  v14 = v4;
  if (!clients)
  {
    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v6 = (NSHashTable *)objc_claimAutoreleasedReturnValue();
    v7 = self->_clients;
    self->_clients = v6;

    clients = self->_clients;
    v4 = v14;
  }
  -[NSHashTable addObject:](clients, "addObject:", v4);
  -[LPMediaRemotePlaybackObserver minimumUpdateInterval](self, "minimumUpdateInterval");
  v9 = v8;
  timer = self->_timer;
  if (!timer)
    goto LABEL_6;
  -[NSTimer timeInterval](timer, "timeInterval");
  if (vabdd_f64(v11, v9) >= 2.22044605e-16)
  {
    timer = self->_timer;
LABEL_6:
    -[NSTimer invalidate](timer, "invalidate");
    objc_msgSend(MEMORY[0x1E0C99E88], "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", self, sel_updatePlaybackState, 0, 1, v9);
    v12 = (NSTimer *)objc_claimAutoreleasedReturnValue();
    v13 = self->_timer;
    self->_timer = v12;

  }
}

- (void)removeClient:(id)a3
{
  NSTimer *timer;
  id v5;

  v5 = a3;
  -[NSHashTable removeObject:](self->_clients, "removeObject:");
  if (!-[NSHashTable count](self->_clients, "count"))
  {
    -[NSTimer invalidate](self->_timer, "invalidate");
    timer = self->_timer;
    self->_timer = 0;

  }
}

- (double)minimumUpdateInterval
{
  NSHashTable *v3;
  uint64_t v4;
  uint64_t v5;
  double v6;
  uint64_t i;
  void *v8;
  double v9;
  double v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v3 = self->_clients;
  v4 = -[NSHashTable countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v13;
    v6 = INFINITY;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v13 != v5)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
        objc_msgSend(v8, "desiredUpdateIntervalForMediaRemotePlaybackObserver:", self, (_QWORD)v12);
        if (v6 >= v9)
        {
          objc_msgSend(v8, "desiredUpdateIntervalForMediaRemotePlaybackObserver:", self);
          v6 = v10;
        }
      }
      v4 = -[NSHashTable countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v4);
  }
  else
  {
    v6 = INFINITY;
  }

  return v6;
}

- (void)dispatchPlayingItemDidChangeToAllClients
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
        objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * v6++), "mediaRemotePlaybackObserverPlayingItemDidChange:", self, (_QWORD)v7);
      }
      while (v4 != v6);
      v4 = -[NSHashTable countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v4);
  }

}

- (void)updatePlaybackState
{
  void *v2;
  objc_class *v3;
  id v4;
  id *v5;
  void *v6;
  id v7;
  id *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id *v13;
  void *v14;
  id v15;
  id v16;
  id *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  id *v26;
  void *v27;
  id v28;
  void *v29;
  id *v30;
  void *v31;
  id v32;
  void *v33;
  void *v34;
  void *v35;
  id v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  id v50;
  id v51;
  void *v52;
  _QWORD v53[5];
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  void *v57;
  uint64_t *v58;
  uint64_t v59;
  uint64_t *v60;
  uint64_t v61;
  uint64_t v62;
  _QWORD v63[2];
  _QWORD v64[2];
  id v65;
  void *v66;
  id v67;
  void *v68;
  _QWORD v69[2];
  _QWORD v70[4];

  v70[2] = *MEMORY[0x1E0C80C00];
  v59 = 0;
  v60 = &v59;
  v61 = 0x2050000000;
  v2 = (void *)getMPCPlayerRequestClass_softClass;
  v62 = getMPCPlayerRequestClass_softClass;
  if (!getMPCPlayerRequestClass_softClass)
  {
    v54 = MEMORY[0x1E0C809B0];
    v55 = 3221225472;
    v56 = (uint64_t)__getMPCPlayerRequestClass_block_invoke;
    v57 = &unk_1E44A7DB0;
    v58 = &v59;
    __getMPCPlayerRequestClass_block_invoke((uint64_t)&v54);
    v2 = (void *)v60[3];
  }
  v3 = objc_retainAutorelease(v2);
  _Block_object_dispose(&v59, 8);
  v52 = (void *)objc_msgSend([v3 alloc], "init");
  v4 = objc_alloc((Class)getMPPropertySetClass());
  v54 = 0;
  v55 = (uint64_t)&v54;
  v56 = 0x2020000000;
  v5 = (id *)getMPModelRelationshipGenericSongSymbolLoc_ptr;
  v57 = (void *)getMPModelRelationshipGenericSongSymbolLoc_ptr;
  if (!getMPModelRelationshipGenericSongSymbolLoc_ptr)
  {
    v6 = MediaPlayerLibrary_1();
    v5 = (id *)dlsym(v6, "MPModelRelationshipGenericSong");
    *(_QWORD *)(v55 + 24) = v5;
    getMPModelRelationshipGenericSongSymbolLoc_ptr = (uint64_t)v5;
  }
  _Block_object_dispose(&v54, 8);
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString *getMPModelRelationshipGenericSong(void)");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "handleFailureInFunction:file:lineNumber:description:", v38, CFSTR("LPMediaRemotePlaybackObserver.m"), 30, CFSTR("%s"), dlerror());

    goto LABEL_28;
  }
  v51 = *v5;
  v69[0] = v51;
  v7 = objc_alloc((Class)getMPPropertySetClass());
  v54 = 0;
  v55 = (uint64_t)&v54;
  v56 = 0x2020000000;
  v8 = (id *)getMPModelRelationshipSongAlbumSymbolLoc_ptr;
  v57 = (void *)getMPModelRelationshipSongAlbumSymbolLoc_ptr;
  if (!getMPModelRelationshipSongAlbumSymbolLoc_ptr)
  {
    v9 = MediaPlayerLibrary_1();
    v8 = (id *)dlsym(v9, "MPModelRelationshipSongAlbum");
    *(_QWORD *)(v55 + 24) = v8;
    getMPModelRelationshipSongAlbumSymbolLoc_ptr = (uint64_t)v8;
  }
  _Block_object_dispose(&v54, 8);
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString *getMPModelRelationshipSongAlbum(void)");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "handleFailureInFunction:file:lineNumber:description:", v40, CFSTR("LPMediaRemotePlaybackObserver.m"), 33, CFSTR("%s"), dlerror());

    goto LABEL_28;
  }
  v50 = *v8;
  v67 = v50;
  v10 = (void *)objc_msgSend(objc_alloc((Class)getMPPropertySetClass()), "initWithProperties:relationships:", 0, 0);
  v68 = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v68, &v67, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v7, "initWithProperties:relationships:", 0, v11);
  v70[0] = v12;
  v54 = 0;
  v55 = (uint64_t)&v54;
  v56 = 0x2020000000;
  v13 = (id *)getMPModelRelationshipGenericPodcastEpisodeSymbolLoc_ptr;
  v57 = (void *)getMPModelRelationshipGenericPodcastEpisodeSymbolLoc_ptr;
  if (!getMPModelRelationshipGenericPodcastEpisodeSymbolLoc_ptr)
  {
    v14 = MediaPlayerLibrary_1();
    v13 = (id *)dlsym(v14, "MPModelRelationshipGenericPodcastEpisode");
    *(_QWORD *)(v55 + 24) = v13;
    getMPModelRelationshipGenericPodcastEpisodeSymbolLoc_ptr = (uint64_t)v13;
  }
  _Block_object_dispose(&v54, 8);
  if (!v13)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString *getMPModelRelationshipGenericPodcastEpisode(void)");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "handleFailureInFunction:file:lineNumber:description:", v42, CFSTR("LPMediaRemotePlaybackObserver.m"), 28, CFSTR("%s"), dlerror());

    goto LABEL_28;
  }
  v15 = *v13;
  v69[1] = v15;
  v16 = objc_alloc((Class)getMPPropertySetClass());
  v54 = 0;
  v55 = (uint64_t)&v54;
  v56 = 0x2020000000;
  v17 = (id *)getMPModelRelationshipPodcastEpisodePodcastSymbolLoc_ptr;
  v57 = (void *)getMPModelRelationshipPodcastEpisodePodcastSymbolLoc_ptr;
  if (!getMPModelRelationshipPodcastEpisodePodcastSymbolLoc_ptr)
  {
    v18 = MediaPlayerLibrary_1();
    v17 = (id *)dlsym(v18, "MPModelRelationshipPodcastEpisodePodcast");
    *(_QWORD *)(v55 + 24) = v17;
    getMPModelRelationshipPodcastEpisodePodcastSymbolLoc_ptr = (uint64_t)v17;
  }
  _Block_object_dispose(&v54, 8);
  if (!v17)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString *getMPModelRelationshipPodcastEpisodePodcast(void)");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "handleFailureInFunction:file:lineNumber:description:", v44, CFSTR("LPMediaRemotePlaybackObserver.m"), 32, CFSTR("%s"), dlerror());

    goto LABEL_28;
  }
  v19 = *v17;
  v65 = v19;
  v20 = (void *)objc_msgSend(objc_alloc((Class)getMPPropertySetClass()), "initWithProperties:relationships:", 0, 0);
  v66 = v20;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v66, &v65, 1);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = (void *)objc_msgSend(v16, "initWithProperties:relationships:", 0, v21);
  v70[1] = v22;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v70, v69, 2);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = (void *)objc_msgSend(v4, "initWithProperties:relationships:", 0, v23);
  objc_msgSend(v52, "setPlayingItemProperties:", v24);

  v25 = objc_alloc((Class)getMPPropertySetClass());
  v54 = 0;
  v55 = (uint64_t)&v54;
  v56 = 0x2020000000;
  v26 = (id *)getMPModelRelationshipGenericPlaylistSymbolLoc_ptr;
  v57 = (void *)getMPModelRelationshipGenericPlaylistSymbolLoc_ptr;
  if (!getMPModelRelationshipGenericPlaylistSymbolLoc_ptr)
  {
    v27 = MediaPlayerLibrary_1();
    v26 = (id *)dlsym(v27, "MPModelRelationshipGenericPlaylist");
    *(_QWORD *)(v55 + 24) = v26;
    getMPModelRelationshipGenericPlaylistSymbolLoc_ptr = (uint64_t)v26;
  }
  _Block_object_dispose(&v54, 8);
  if (!v26)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString *getMPModelRelationshipGenericPlaylist(void)");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "handleFailureInFunction:file:lineNumber:description:", v46, CFSTR("LPMediaRemotePlaybackObserver.m"), 27, CFSTR("%s"), dlerror());

    goto LABEL_28;
  }
  v28 = *v26;
  v63[0] = v28;
  objc_msgSend(getMPPropertySetClass(), "propertySetWithProperties:", MEMORY[0x1E0C9AA60]);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v64[0] = v29;
  v54 = 0;
  v55 = (uint64_t)&v54;
  v56 = 0x2020000000;
  v30 = (id *)getMPModelRelationshipGenericRadioStationSymbolLoc_ptr;
  v57 = (void *)getMPModelRelationshipGenericRadioStationSymbolLoc_ptr;
  if (!getMPModelRelationshipGenericRadioStationSymbolLoc_ptr)
  {
    v31 = MediaPlayerLibrary_1();
    v30 = (id *)dlsym(v31, "MPModelRelationshipGenericRadioStation");
    *(_QWORD *)(v55 + 24) = v30;
    getMPModelRelationshipGenericRadioStationSymbolLoc_ptr = (uint64_t)v30;
  }
  _Block_object_dispose(&v54, 8);
  if (!v30)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString *getMPModelRelationshipGenericRadioStation(void)");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "handleFailureInFunction:file:lineNumber:description:", v48, CFSTR("LPMediaRemotePlaybackObserver.m"), 29, CFSTR("%s"), dlerror());

LABEL_28:
    __break(1u);
  }
  v32 = *v30;
  v63[1] = v32;
  objc_msgSend(getMPPropertySetClass(), "propertySetWithProperties:", MEMORY[0x1E0C9AA60]);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v64[1] = v33;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v64, v63, 2);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = (void *)objc_msgSend(v25, "initWithProperties:relationships:", 0, v34);
  objc_msgSend(v52, "setQueueSectionProperties:", v35);

  v53[0] = MEMORY[0x1E0C809B0];
  v53[1] = 3221225472;
  v53[2] = __52__LPMediaRemotePlaybackObserver_updatePlaybackState__block_invoke;
  v53[3] = &unk_1E44A9F28;
  v53[4] = self;
  v36 = (id)objc_msgSend(v52, "performWithCompletion:", v53);

}

void __52__LPMediaRemotePlaybackObserver_updatePlaybackState__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void (**v4)(_QWORD);
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  double v20;
  double v21;
  double v22;
  id v23;
  _QWORD block[5];
  id v25;
  id v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  uint64_t v30;
  double v31;
  uint64_t v32;
  char v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  uint64_t v37;
  _QWORD aBlock[7];

  v3 = a2;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __52__LPMediaRemotePlaybackObserver_updatePlaybackState__block_invoke_2;
  aBlock[3] = &unk_1E44A7CE8;
  aBlock[4] = *(_QWORD *)(a1 + 32);
  v4 = (void (**)(_QWORD))_Block_copy(aBlock);
  objc_msgSend(v3, "tracklist");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "playingItemIndexPath");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(v3, "tracklist");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "items");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "tracklist");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "playingItemIndexPath");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "itemAtIndexPath:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v11, "metadataObject");
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = (void *)v12;
    if (v11 && v12)
    {
      objc_msgSend(v3, "tracklist");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "items");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "tracklist");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "playingItemIndexPath");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "sectionAtIndex:", objc_msgSend(v17, "indexAtPosition:", 0));
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v18, "metadataObject");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v37 = 0;
      v35 = 0u;
      v36 = 0u;
      v34 = 0u;
      objc_msgSend(v11, "duration");
      objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
      v21 = (v20 - 0.0) * 0.0 + 0.0;
      if (v21 >= 0.0)
        v21 = *((double *)&v35 + 1);
      v22 = fmax(v21, 0.0);
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __52__LPMediaRemotePlaybackObserver_updatePlaybackState__block_invoke_4;
      block[3] = &unk_1E44A9F00;
      block[4] = *(_QWORD *)(a1 + 32);
      v33 = 0;
      v25 = v13;
      v26 = v19;
      v27 = v34;
      v28 = v35;
      v29 = v36;
      v30 = v37;
      v31 = v22;
      v32 = 0;
      v23 = v19;
      dispatch_async(MEMORY[0x1E0C80D38], block);

    }
    else
    {
      v4[2](v4);
    }

  }
  else
  {
    v4[2](v4);
  }

}

void __52__LPMediaRemotePlaybackObserver_updatePlaybackState__block_invoke_2(uint64_t a1)
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __52__LPMediaRemotePlaybackObserver_updatePlaybackState__block_invoke_3;
  block[3] = &unk_1E44A7CE8;
  block[4] = *(_QWORD *)(a1 + 32);
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

uint64_t __52__LPMediaRemotePlaybackObserver_updatePlaybackState__block_invoke_3(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;

  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 40) = 0;
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 8);
  *(_QWORD *)(v2 + 8) = 0;

  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 41) = 0;
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(v4 + 16);
  *(_QWORD *)(v4 + 16) = 0;

  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24) = 0;
  return objc_msgSend(*(id *)(a1 + 32), "dispatchPlayingItemDidChangeToAllClients");
}

uint64_t __52__LPMediaRemotePlaybackObserver_updatePlaybackState__block_invoke_4(uint64_t a1)
{
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 40) = *(_BYTE *)(a1 + 128);
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 8), *(id *)(a1 + 40));
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 16), *(id *)(a1 + 48));
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 41) = *(_BYTE *)(a1 + 104);
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24) = *(_QWORD *)(a1 + 112);
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32) = *(_QWORD *)(a1 + 120);
  return objc_msgSend(*(id *)(a1 + 32), "dispatchPlayingItemDidChangeToAllClients");
}

- (double)elapsedFractionForPlaybackInformation:(id)a3
{
  id v4;
  void *v5;
  double v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  double v13;
  double v14;
  double v15;

  v4 = a3;
  v5 = v4;
  v6 = 1.0;
  if (!self->_enqueuedItemIsLive)
  {
    objc_msgSend(v4, "lyricExcerpt");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      objc_msgSend(v5, "lyricExcerpt");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "startTime");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "doubleValue");
      v11 = v10;

      objc_msgSend(v8, "endTime");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "doubleValue");
      v13 = v11 + -1.0;
      v6 = 1.0;
      v15 = v14 + 1.0;

      if (v15 - v13 != 0.0)
        v6 = fmax((self->_elapsedTime - v13) / (v15 - v13), 0.0);

    }
    else
    {
      v6 = self->_elapsedTime / self->_totalTime;
    }
  }

  return v6;
}

- (BOOL)isPlaying
{
  return self->_isPlaying;
}

- (BOOL)playbackInformationMatchesPlayingItem:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  double elapsedTime;
  char v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
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
  void *v54;

  v4 = a3;
  v5 = v4;
  if (self->_enqueuedItem)
  {
    switch(objc_msgSend(v4, "type"))
    {
      case 0:
        if (-[MPModelGenericObject type](self->_enqueuedItem, "type") != 1)
          goto LABEL_38;
        v6 = (void *)MEMORY[0x1E0CB37E8];
        -[MPModelGenericObject identifiers](self->_enqueuedItem, "identifiers");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "universalStore");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "numberWithLongLong:", objc_msgSend(v8, "adamID"));
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "stringValue");
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v10)
          goto LABEL_30;
        objc_msgSend(v5, "lyricExcerpt");
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v11)
          goto LABEL_25;
        objc_msgSend(v5, "lyricExcerpt");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "startTime");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "doubleValue");
        v15 = v14;

        objc_msgSend(v12, "endTime");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "doubleValue");
        v18 = v17;
        v19 = v15 + -1.0;

        elapsedTime = self->_elapsedTime;
        v21 = 0;
        if (elapsedTime >= v19 && elapsedTime <= v18 + 1.0)
          goto LABEL_25;
        goto LABEL_31;
      case 1:
        if (-[MPModelGenericObject type](self->_enqueuedItem, "type") != 1)
          goto LABEL_38;
        v40 = (void *)MEMORY[0x1E0CB37E8];
        -[MPModelGenericObject song](self->_enqueuedItem, "song");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v41, "album");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v42, "identifiers");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v43, "universalStore");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v40, "numberWithLongLong:", objc_msgSend(v44, "adamID"));
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v45, "stringValue");
        v39 = (void *)objc_claimAutoreleasedReturnValue();

        if (v39)
          goto LABEL_22;
        goto LABEL_32;
      case 2:
        -[MPModelGenericObject identifiers](self->_enqueuedItemContext, "identifiers");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "radio");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "stationStringID");
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        if (v10)
          goto LABEL_25;
        goto LABEL_30;
      case 3:
        if (-[MPModelGenericObject type](self->_enqueuedItem, "type") != 12)
          goto LABEL_38;
        v33 = (void *)MEMORY[0x1E0CB37E8];
        -[MPModelGenericObject podcastEpisode](self->_enqueuedItem, "podcastEpisode");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "podcast");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "identifiers");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "universalStore");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "numberWithLongLong:", objc_msgSend(v37, "adamID"));
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v38, "stringValue");
        v39 = (void *)objc_claimAutoreleasedReturnValue();

        if (v39)
        {
LABEL_22:
          objc_msgSend(v5, "storeIdentifier");
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          v21 = objc_msgSend(v46, "isEqualToString:", v39);

        }
        else
        {
LABEL_32:
          v21 = 0;
        }

        break;
      case 4:
        if (-[MPModelGenericObject type](self->_enqueuedItem, "type") != 12)
          goto LABEL_38;
        v22 = (void *)MEMORY[0x1E0CB37E8];
        -[MPModelGenericObject identifiers](self->_enqueuedItem, "identifiers");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "universalStore");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "numberWithLongLong:", objc_msgSend(v24, "adamID"));
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "stringValue");
        v26 = (void *)objc_claimAutoreleasedReturnValue();

        if (v26)
        {
          v27 = v26;
          v28 = v27;
          if ((objc_msgSend(v27, "hasPrefix:", CFSTR("1000")) & 1) == 0)
          {
            objc_msgSend(CFSTR("1000"), "stringByAppendingString:", v27);
            v29 = objc_claimAutoreleasedReturnValue();

            v28 = (void *)v29;
          }
          objc_msgSend(v5, "storeIdentifier");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          if ((objc_msgSend(v30, "isEqualToString:", v27) & 1) != 0)
          {
            v21 = 1;
          }
          else
          {
            objc_msgSend(v5, "storeIdentifier");
            v54 = (void *)objc_claimAutoreleasedReturnValue();
            v21 = objc_msgSend(v54, "isEqualToString:", v28);

          }
        }
        else
        {
          v21 = 0;
        }

        break;
      case 5:
        if (-[MPModelGenericObject type](self->_enqueuedItem, "type") != 1)
          goto LABEL_38;
        -[MPModelGenericObject identifiers](self->_enqueuedItemContext, "identifiers");
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v47, "universalStore");
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v48, "globalPlaylistID");
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v10)
          goto LABEL_30;
LABEL_25:
        objc_msgSend(v5, "storeIdentifier");
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = objc_msgSend(v49, "isEqualToString:", v10);
        goto LABEL_29;
      case 6:
        if (-[MPModelGenericObject type](self->_enqueuedItem, "type") != 1)
          goto LABEL_38;
        -[MPModelGenericObject song](self->_enqueuedItem, "song");
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v50, "identifiers");
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v51, "contentItemID");
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        if (v10)
        {
          v52 = (void *)MEMORY[0x1E0CB3940];
          objc_msgSend(v5, "persistentIdentifier");
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v52, "stringWithFormat:", CFSTR("id=%@_"), v49);
          v53 = (void *)objc_claimAutoreleasedReturnValue();
          v21 = objc_msgSend(v10, "containsString:", v53);

LABEL_29:
        }
        else
        {
LABEL_30:
          v21 = 0;
        }
LABEL_31:

        break;
      default:
        goto LABEL_38;
    }
  }
  else
  {
LABEL_38:
    v21 = 0;
  }

  return v21;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timer, 0);
  objc_storeStrong((id *)&self->_clients, 0);
  objc_storeStrong((id *)&self->_enqueuedItemContext, 0);
  objc_storeStrong((id *)&self->_enqueuedItem, 0);
}

- (void)playbackInformationMatchesPlayingItem:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_1A0C41000, a2, OS_LOG_TYPE_ERROR, "LPMediaRemotePlaybackObserver -matchesNowPlayingItem threw an exception: %@", (uint8_t *)&v2, 0xCu);
}

@end
