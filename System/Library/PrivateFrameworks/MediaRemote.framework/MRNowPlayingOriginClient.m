@implementation MRNowPlayingOriginClient

- (id)nowPlayingClientForPlayerPath:(id)a3
{
  id v4;
  NSObject *serialQueue;
  id v6;
  id v7;
  _QWORD block[5];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__41;
  v16 = __Block_byref_object_dispose__41;
  v17 = 0;
  serialQueue = self->_serialQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __58__MRNowPlayingOriginClient_nowPlayingClientForPlayerPath___block_invoke;
  block[3] = &unk_1E30C8C28;
  block[4] = self;
  v10 = v4;
  v11 = &v12;
  v6 = v4;
  dispatch_sync(serialQueue, block);
  v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

void __58__MRNowPlayingOriginClient_nowPlayingClientForPlayerPath___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  MRNowPlayingClient *v11;
  uint64_t v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v2 = *(id *)(*(_QWORD *)(a1 + 32) + 160);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v15;
    while (2)
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v15 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        objc_msgSend(v7, "client", (_QWORD)v14);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 40), "client");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v8, "isEqual:", v9);

        if (v10)
        {
          objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), v7);

          goto LABEL_11;
        }

      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      if (v4)
        continue;
      break;
    }
  }
LABEL_11:

  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40))
  {
    v11 = -[MRNowPlayingClient initWithPlayerPath:]([MRNowPlayingClient alloc], "initWithPlayerPath:", *(_QWORD *)(a1 + 40));
    v12 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v13 = *(void **)(v12 + 40);
    *(_QWORD *)(v12 + 40) = v11;

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 160), "addObject:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40));
  }
}

- (id)playbackQueueCallback
{
  void *v2;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t (*v7)(uint64_t, uint64_t);
  void (*v8)(uint64_t);
  id v9;

  v4 = 0;
  v5 = &v4;
  v6 = 0x3032000000;
  v7 = __Block_byref_object_copy__49;
  v8 = __Block_byref_object_dispose__50;
  v9 = 0;
  msv_dispatch_sync_on_queue();
  v2 = (void *)MEMORY[0x194036C44](v5[5]);
  _Block_object_dispose(&v4, 8);

  return v2;
}

void __49__MRNowPlayingOriginClient_playbackQueueCallback__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  v5 = (id)MEMORY[0x194036C44](*(_QWORD *)(*(_QWORD *)(a1 + 32) + 80));
  v2 = objc_msgSend(v5, "copy");
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (MRNowPlayingOriginClient)initWithOrigin:(id)a3 routingContextID:(id)a4
{
  id v7;
  id v8;
  MRNowPlayingOriginClient *v9;
  void *v10;
  char v11;
  MRNowPlayingOriginClient *v12;
  objc_class *v13;
  const char *Name;
  NSObject *v15;
  dispatch_queue_t v16;
  OS_dispatch_queue *serialQueue;
  NSMutableArray *v18;
  NSMutableArray *nowPlayingClients;
  void *v20;
  NSObject *v21;
  void *v22;
  objc_super v24;
  uint8_t buf[4];
  MRNowPlayingOriginClient *v26;
  __int16 v27;
  id v28;
  __int16 v29;
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v24.receiver = self;
  v24.super_class = (Class)MRNowPlayingOriginClient;
  v9 = -[MRNowPlayingOriginClient init](&v24, sel_init);
  if (!v9)
  {
LABEL_10:
    v12 = v9;
    goto LABEL_11;
  }
  if (!objc_msgSend(v7, "isHosted")
    || (+[MRUserSettings currentSettings](MRUserSettings, "currentSettings"),
        v10 = (void *)objc_claimAutoreleasedReturnValue(),
        v11 = objc_msgSend(v10, "supportMultiplayerHost"),
        v10,
        v8)
    || (v11 & 1) == 0)
  {
    objc_storeStrong((id *)&v9->_origin, a3);
    objc_storeStrong((id *)&v9->_routingContextID, a4);
    v13 = (objc_class *)objc_opt_class();
    Name = class_getName(v13);
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = dispatch_queue_create(Name, v15);
    serialQueue = v9->_serialQueue;
    v9->_serialQueue = (OS_dispatch_queue *)v16;

    v18 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    nowPlayingClients = v9->_nowPlayingClients;
    v9->_nowPlayingClients = v18;

    +[MRUserSettings currentSettings](MRUserSettings, "currentSettings");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v15) = objc_msgSend(v20, "verboseOriginClientLogging");

    if ((_DWORD)v15)
    {
      _MRLogForCategory(1uLL);
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412802;
        v26 = v9;
        v27 = 2112;
        v28 = v7;
        v29 = 2112;
        v30 = v22;
        _os_log_impl(&dword_193827000, v21, OS_LOG_TYPE_DEFAULT, "[MRNowPlayingOriginClient] Creating %@ for origin %@ at %@", buf, 0x20u);

      }
    }
    goto LABEL_10;
  }
  v12 = 0;
LABEL_11:

  return v12;
}

- (void)dealloc
{
  void *v3;
  int v4;
  NSObject *v5;
  MROrigin *origin;
  void *v7;
  objc_super v8;
  uint8_t buf[4];
  MRNowPlayingOriginClient *v10;
  __int16 v11;
  MROrigin *v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  +[MRUserSettings currentSettings](MRUserSettings, "currentSettings");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "verboseOriginClientLogging");

  if (v4)
  {
    _MRLogForCategory(1uLL);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      origin = self->_origin;
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v10 = self;
      v11 = 2112;
      v12 = origin;
      v13 = 2112;
      v14 = v7;
      _os_log_impl(&dword_193827000, v5, OS_LOG_TYPE_DEFAULT, "[MRNowPlayingOriginClient] Destroying %@ for origin %@ at %@", buf, 0x20u);

    }
  }
  v8.receiver = self;
  v8.super_class = (Class)MRNowPlayingOriginClient;
  -[MRNowPlayingOriginClient dealloc](&v8, sel_dealloc);
}

- (void)setVolume:(float)a3
{
  msv_dispatch_sync_on_queue();
}

float __38__MRNowPlayingOriginClient_setVolume___block_invoke(uint64_t a1)
{
  float result;

  result = *(float *)(a1 + 40);
  *(float *)(*(_QWORD *)(a1 + 32) + 52) = result;
  return result;
}

- (float)volume
{
  float v2;
  uint64_t v4;
  float *v5;
  uint64_t v6;
  int v7;

  v4 = 0;
  v5 = (float *)&v4;
  v6 = 0x2020000000;
  v7 = 0;
  msv_dispatch_sync_on_queue();
  v2 = v5[6];
  _Block_object_dispose(&v4, 8);
  return v2;
}

float __34__MRNowPlayingOriginClient_volume__block_invoke(uint64_t a1)
{
  float result;

  result = *(float *)(*(_QWORD *)(a1 + 32) + 52);
  *(float *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (void)setVolumeCapabilities:(unsigned int)a3
{
  msv_dispatch_sync_on_queue();
}

uint64_t __50__MRNowPlayingOriginClient_setVolumeCapabilities___block_invoke(uint64_t result)
{
  *(_DWORD *)(*(_QWORD *)(result + 32) + 56) = *(_DWORD *)(result + 40);
  return result;
}

- (unsigned)volumeCapabilities
{
  unsigned int v2;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  int v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2020000000;
  v7 = 0;
  msv_dispatch_sync_on_queue();
  v2 = *((_DWORD *)v5 + 6);
  _Block_object_dispose(&v4, 8);
  return v2;
}

uint64_t __46__MRNowPlayingOriginClient_volumeCapabilities__block_invoke(uint64_t result)
{
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_DWORD *)(*(_QWORD *)(result + 32) + 56);
  return result;
}

- (NSArray)nowPlayingClients
{
  id v2;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t (*v7)(uint64_t, uint64_t);
  void (*v8)(uint64_t);
  id v9;

  v4 = 0;
  v5 = &v4;
  v6 = 0x3032000000;
  v7 = __Block_byref_object_copy__41;
  v8 = __Block_byref_object_dispose__41;
  v9 = 0;
  msv_dispatch_sync_on_queue();
  v2 = (id)v5[5];
  _Block_object_dispose(&v4, 8);

  return (NSArray *)v2;
}

void __45__MRNowPlayingOriginClient_nowPlayingClients__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 160), "copy");
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (void)setPlaybackQueueCallback:(id)a3
{
  id v3;
  id v4;

  v4 = a3;
  v3 = v4;
  msv_dispatch_sync_on_queue();

}

void __53__MRNowPlayingOriginClient_setPlaybackQueueCallback___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_msgSend(*(id *)(a1 + 40), "copy");
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 80);
  *(_QWORD *)(v3 + 80) = v2;

}

- (id)commandCallback
{
  void *v2;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t (*v7)(uint64_t, uint64_t);
  void (*v8)(uint64_t);
  id v9;

  v4 = 0;
  v5 = &v4;
  v6 = 0x3032000000;
  v7 = __Block_byref_object_copy__49;
  v8 = __Block_byref_object_dispose__50;
  v9 = 0;
  msv_dispatch_sync_on_queue();
  v2 = (void *)MEMORY[0x194036C44](v5[5]);
  _Block_object_dispose(&v4, 8);

  return v2;
}

void __43__MRNowPlayingOriginClient_commandCallback__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  v5 = (id)MEMORY[0x194036C44](*(_QWORD *)(*(_QWORD *)(a1 + 32) + 96));
  v2 = objc_msgSend(v5, "copy");
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (void)setCommandCallback:(id)a3
{
  id v3;
  id v4;

  v4 = a3;
  v3 = v4;
  msv_dispatch_sync_on_queue();

}

void __47__MRNowPlayingOriginClient_setCommandCallback___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_msgSend(*(id *)(a1 + 40), "copy");
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 96);
  *(_QWORD *)(v3 + 96) = v2;

}

- (id)playbackSessionCallback
{
  void *v2;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t (*v7)(uint64_t, uint64_t);
  void (*v8)(uint64_t);
  id v9;

  v4 = 0;
  v5 = &v4;
  v6 = 0x3032000000;
  v7 = __Block_byref_object_copy__49;
  v8 = __Block_byref_object_dispose__50;
  v9 = 0;
  msv_dispatch_sync_on_queue();
  v2 = (void *)MEMORY[0x194036C44](v5[5]);
  _Block_object_dispose(&v4, 8);

  return v2;
}

void __51__MRNowPlayingOriginClient_playbackSessionCallback__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  v5 = (id)MEMORY[0x194036C44](*(_QWORD *)(*(_QWORD *)(a1 + 32) + 120));
  v2 = objc_msgSend(v5, "copy");
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (void)setPlaybackSessionCallback:(id)a3
{
  id v3;
  id v4;

  v4 = a3;
  v3 = v4;
  msv_dispatch_sync_on_queue();

}

void __55__MRNowPlayingOriginClient_setPlaybackSessionCallback___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_msgSend(*(id *)(a1 + 40), "copy");
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 120);
  *(_QWORD *)(v3 + 120) = v2;

}

- (id)playbackSessionMigrateBeginCallback
{
  void *v2;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t (*v7)(uint64_t, uint64_t);
  void (*v8)(uint64_t);
  id v9;

  v4 = 0;
  v5 = &v4;
  v6 = 0x3032000000;
  v7 = __Block_byref_object_copy__49;
  v8 = __Block_byref_object_dispose__50;
  v9 = 0;
  msv_dispatch_sync_on_queue();
  v2 = (void *)MEMORY[0x194036C44](v5[5]);
  _Block_object_dispose(&v4, 8);

  return v2;
}

void __63__MRNowPlayingOriginClient_playbackSessionMigrateBeginCallback__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  v5 = (id)MEMORY[0x194036C44](*(_QWORD *)(*(_QWORD *)(a1 + 32) + 128));
  v2 = objc_msgSend(v5, "copy");
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (void)setPlaybackSessionMigrateBeginCallback:(id)a3
{
  id v3;
  id v4;

  v4 = a3;
  v3 = v4;
  msv_dispatch_sync_on_queue();

}

void __67__MRNowPlayingOriginClient_setPlaybackSessionMigrateBeginCallback___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_msgSend(*(id *)(a1 + 40), "copy");
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 128);
  *(_QWORD *)(v3 + 128) = v2;

}

- (id)playbackSessionMigrateEndCallback
{
  void *v2;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t (*v7)(uint64_t, uint64_t);
  void (*v8)(uint64_t);
  id v9;

  v4 = 0;
  v5 = &v4;
  v6 = 0x3032000000;
  v7 = __Block_byref_object_copy__49;
  v8 = __Block_byref_object_dispose__50;
  v9 = 0;
  msv_dispatch_sync_on_queue();
  v2 = (void *)MEMORY[0x194036C44](v5[5]);
  _Block_object_dispose(&v4, 8);

  return v2;
}

void __61__MRNowPlayingOriginClient_playbackSessionMigrateEndCallback__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  v5 = (id)MEMORY[0x194036C44](*(_QWORD *)(*(_QWORD *)(a1 + 32) + 136));
  v2 = objc_msgSend(v5, "copy");
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (void)setPlaybackSessionMigrateEndCallback:(id)a3
{
  id v3;
  id v4;

  v4 = a3;
  v3 = v4;
  msv_dispatch_sync_on_queue();

}

void __65__MRNowPlayingOriginClient_setPlaybackSessionMigrateEndCallback___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_msgSend(*(id *)(a1 + 40), "copy");
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 136);
  *(_QWORD *)(v3 + 136) = v2;

}

- (id)playbackSessionMigrateRequestCallback
{
  void *v2;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t (*v7)(uint64_t, uint64_t);
  void (*v8)(uint64_t);
  id v9;

  v4 = 0;
  v5 = &v4;
  v6 = 0x3032000000;
  v7 = __Block_byref_object_copy__49;
  v8 = __Block_byref_object_dispose__50;
  v9 = 0;
  msv_dispatch_sync_on_queue();
  v2 = (void *)MEMORY[0x194036C44](v5[5]);
  _Block_object_dispose(&v4, 8);

  return v2;
}

void __65__MRNowPlayingOriginClient_playbackSessionMigrateRequestCallback__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  v5 = (id)MEMORY[0x194036C44](*(_QWORD *)(*(_QWORD *)(a1 + 32) + 144));
  v2 = objc_msgSend(v5, "copy");
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (void)setPlaybackSessionMigrateRequestCallback:(id)a3
{
  id v3;
  id v4;

  v4 = a3;
  v3 = v4;
  msv_dispatch_sync_on_queue();

}

void __69__MRNowPlayingOriginClient_setPlaybackSessionMigrateRequestCallback___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_msgSend(*(id *)(a1 + 40), "copy");
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 144);
  *(_QWORD *)(v3 + 144) = v2;

}

- (id)beginLyricsEventCallback
{
  void *v2;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t (*v7)(uint64_t, uint64_t);
  void (*v8)(uint64_t);
  id v9;

  v4 = 0;
  v5 = &v4;
  v6 = 0x3032000000;
  v7 = __Block_byref_object_copy__49;
  v8 = __Block_byref_object_dispose__50;
  v9 = 0;
  msv_dispatch_sync_on_queue();
  v2 = (void *)MEMORY[0x194036C44](v5[5]);
  _Block_object_dispose(&v4, 8);

  return v2;
}

void __52__MRNowPlayingOriginClient_beginLyricsEventCallback__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  v5 = (id)MEMORY[0x194036C44](*(_QWORD *)(*(_QWORD *)(a1 + 32) + 104));
  v2 = objc_msgSend(v5, "copy");
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (void)setBeginLyricsEventCallback:(id)a3
{
  id v3;
  id v4;

  v4 = a3;
  v3 = v4;
  msv_dispatch_sync_on_queue();

}

void __56__MRNowPlayingOriginClient_setBeginLyricsEventCallback___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_msgSend(*(id *)(a1 + 40), "copy");
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 104);
  *(_QWORD *)(v3 + 104) = v2;

}

- (id)endLyricsEventCallback
{
  void *v2;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t (*v7)(uint64_t, uint64_t);
  void (*v8)(uint64_t);
  id v9;

  v4 = 0;
  v5 = &v4;
  v6 = 0x3032000000;
  v7 = __Block_byref_object_copy__49;
  v8 = __Block_byref_object_dispose__50;
  v9 = 0;
  msv_dispatch_sync_on_queue();
  v2 = (void *)MEMORY[0x194036C44](v5[5]);
  _Block_object_dispose(&v4, 8);

  return v2;
}

void __50__MRNowPlayingOriginClient_endLyricsEventCallback__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  v5 = (id)MEMORY[0x194036C44](*(_QWORD *)(*(_QWORD *)(a1 + 32) + 112));
  v2 = objc_msgSend(v5, "copy");
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (void)setEndLyricsEventCallback:(id)a3
{
  id v3;
  id v4;

  v4 = a3;
  v3 = v4;
  msv_dispatch_sync_on_queue();

}

void __54__MRNowPlayingOriginClient_setEndLyricsEventCallback___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_msgSend(*(id *)(a1 + 40), "copy");
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 112);
  *(_QWORD *)(v3 + 112) = v2;

}

- (id)clientMessageCallback
{
  void *v2;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t (*v7)(uint64_t, uint64_t);
  void (*v8)(uint64_t);
  id v9;

  v4 = 0;
  v5 = &v4;
  v6 = 0x3032000000;
  v7 = __Block_byref_object_copy__49;
  v8 = __Block_byref_object_dispose__50;
  v9 = 0;
  msv_dispatch_sync_on_queue();
  v2 = (void *)MEMORY[0x194036C44](v5[5]);
  _Block_object_dispose(&v4, 8);

  return v2;
}

void __49__MRNowPlayingOriginClient_clientMessageCallback__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  v5 = (id)MEMORY[0x194036C44](*(_QWORD *)(*(_QWORD *)(a1 + 32) + 152));
  v2 = objc_msgSend(v5, "copy");
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (void)setClientMessageCallback:(id)a3
{
  id v3;
  id v4;

  v4 = a3;
  v3 = v4;
  msv_dispatch_sync_on_queue();

}

void __53__MRNowPlayingOriginClient_setClientMessageCallback___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_msgSend(*(id *)(a1 + 40), "copy");
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 152);
  *(_QWORD *)(v3 + 152) = v2;

}

- (NSArray)applicationPickedRoutes
{
  id v2;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t (*v7)(uint64_t, uint64_t);
  void (*v8)(uint64_t);
  id v9;

  v4 = 0;
  v5 = &v4;
  v6 = 0x3032000000;
  v7 = __Block_byref_object_copy__41;
  v8 = __Block_byref_object_dispose__41;
  v9 = 0;
  msv_dispatch_sync_on_queue();
  v2 = (id)v5[5];
  _Block_object_dispose(&v4, 8);

  return (NSArray *)v2;
}

void __51__MRNowPlayingOriginClient_applicationPickedRoutes__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "copy");
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (void)setApplicationPickedRoutes:(id)a3
{
  id v3;
  id v4;

  v4 = a3;
  v3 = v4;
  msv_dispatch_sync_on_queue();

}

void __55__MRNowPlayingOriginClient_setApplicationPickedRoutes___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_msgSend(*(id *)(a1 + 40), "copy");
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (void)setIsOverrideApp:(BOOL)a3
{
  msv_dispatch_sync_on_queue();
}

uint64_t __45__MRNowPlayingOriginClient_setIsOverrideApp___block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(result + 32) + 16) = *(_BYTE *)(result + 40);
  return result;
}

- (BOOL)overrideApp
{
  char v2;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  char v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2020000000;
  v7 = 0;
  msv_dispatch_sync_on_queue();
  v2 = *((_BYTE *)v5 + 24);
  _Block_object_dispose(&v4, 8);
  return v2;
}

uint64_t __39__MRNowPlayingOriginClient_overrideApp__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(result + 32) + 16);
  return result;
}

- (NSString)overrideAppBundleID
{
  id v2;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t (*v7)(uint64_t, uint64_t);
  void (*v8)(uint64_t);
  id v9;

  v4 = 0;
  v5 = &v4;
  v6 = 0x3032000000;
  v7 = __Block_byref_object_copy__41;
  v8 = __Block_byref_object_dispose__41;
  v9 = 0;
  msv_dispatch_sync_on_queue();
  v2 = (id)v5[5];
  _Block_object_dispose(&v4, 8);

  return (NSString *)v2;
}

void __47__MRNowPlayingOriginClient_overrideAppBundleID__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "copy");
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (void)setOverrideAppBundleID:(id)a3
{
  id v3;
  id v4;

  v4 = a3;
  v3 = v4;
  msv_dispatch_sync_on_queue();

}

void __51__MRNowPlayingOriginClient_setOverrideAppBundleID___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_msgSend(*(id *)(a1 + 40), "copy");
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 24);
  *(_QWORD *)(v3 + 24) = v2;

}

- (void)setRouteDiscoveryMode:(unsigned int)a3
{
  msv_dispatch_sync_on_queue();
}

uint64_t __50__MRNowPlayingOriginClient_setRouteDiscoveryMode___block_invoke(uint64_t result)
{
  *(_DWORD *)(*(_QWORD *)(result + 32) + 32) = *(_DWORD *)(result + 40);
  return result;
}

- (unsigned)routeDiscoveryMode
{
  unsigned int v2;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  int v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2020000000;
  v7 = 0;
  msv_dispatch_sync_on_queue();
  v2 = *((_DWORD *)v5 + 6);
  _Block_object_dispose(&v4, 8);
  return v2;
}

uint64_t __46__MRNowPlayingOriginClient_routeDiscoveryMode__block_invoke(uint64_t result)
{
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_DWORD *)(*(_QWORD *)(result + 32) + 32);
  return result;
}

- (void)setInputMode:(unsigned int)a3
{
  msv_dispatch_sync_on_queue();
}

uint64_t __41__MRNowPlayingOriginClient_setInputMode___block_invoke(uint64_t result)
{
  *(_DWORD *)(*(_QWORD *)(result + 32) + 48) = *(_DWORD *)(result + 40);
  return result;
}

- (unsigned)inputMode
{
  unsigned int v2;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  int v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2020000000;
  v7 = 0;
  msv_dispatch_sync_on_queue();
  v2 = *((_DWORD *)v5 + 6);
  _Block_object_dispose(&v4, 8);
  return v2;
}

uint64_t __37__MRNowPlayingOriginClient_inputMode__block_invoke(uint64_t result)
{
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_DWORD *)(*(_QWORD *)(result + 32) + 48);
  return result;
}

- (void)setActiveNowPlayingClient:(id)a3
{
  id v4;
  NSObject *serialQueue;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  serialQueue = self->_serialQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __54__MRNowPlayingOriginClient_setActiveNowPlayingClient___block_invoke;
  block[3] = &unk_1E30C5F40;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(serialQueue, block);

}

void __54__MRNowPlayingOriginClient_setActiveNowPlayingClient___block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 176), *(id *)(a1 + 40));
}

- (MRClient)activeNowPlayingClient
{
  NSObject *serialQueue;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__41;
  v10 = __Block_byref_object_dispose__41;
  v11 = 0;
  serialQueue = self->_serialQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __50__MRNowPlayingOriginClient_activeNowPlayingClient__block_invoke;
  v5[3] = &unk_1E30C5D20;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(serialQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (MRClient *)v3;
}

void __50__MRNowPlayingOriginClient_activeNowPlayingClient__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 176), "copy");
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (void)setActivity:(id)a3
{
  id v4;
  NSObject *serialQueue;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  serialQueue = self->_serialQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __40__MRNowPlayingOriginClient_setActivity___block_invoke;
  block[3] = &unk_1E30C5F40;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(serialQueue, block);

}

void __40__MRNowPlayingOriginClient_setActivity___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_msgSend(*(id *)(a1 + 40), "copy");
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 64);
  *(_QWORD *)(v3 + 64) = v2;

}

- (MRApplicationActivity)activity
{
  NSObject *serialQueue;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__41;
  v10 = __Block_byref_object_dispose__41;
  v11 = 0;
  serialQueue = self->_serialQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __36__MRNowPlayingOriginClient_activity__block_invoke;
  v5[3] = &unk_1E30C5D20;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(serialQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (MRApplicationActivity *)v3;
}

void __36__MRNowPlayingOriginClient_activity__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "copy");
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (id)existingNowPlayingClientForPlayerPath:(id)a3
{
  id v4;
  NSObject *serialQueue;
  id v6;
  id v7;
  _QWORD block[5];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__41;
  v16 = __Block_byref_object_dispose__41;
  v17 = 0;
  serialQueue = self->_serialQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __66__MRNowPlayingOriginClient_existingNowPlayingClientForPlayerPath___block_invoke;
  block[3] = &unk_1E30C8C28;
  block[4] = self;
  v10 = v4;
  v11 = &v12;
  v6 = v4;
  dispatch_sync(serialQueue, block);
  v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

void __66__MRNowPlayingOriginClient_existingNowPlayingClientForPlayerPath___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v2 = *(id *)(*(_QWORD *)(a1 + 32) + 160);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v12;
    while (2)
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v12 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * i);
        objc_msgSend(v7, "client", (_QWORD)v11);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 40), "client");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v8, "isEqual:", v9);

        if (v10)
        {
          objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), v7);

          goto LABEL_11;
        }

      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      if (v4)
        continue;
      break;
    }
  }
LABEL_11:

}

- (void)removeClient:(id)a3
{
  id v4;
  NSObject *serialQueue;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  serialQueue = self->_serialQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __41__MRNowPlayingOriginClient_removeClient___block_invoke;
  block[3] = &unk_1E30C5F40;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(serialQueue, block);

}

void __41__MRNowPlayingOriginClient_removeClient___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v2 = *(id *)(*(_QWORD *)(a1 + 32) + 160);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v12;
    while (2)
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v12 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * i);
        objc_msgSend(v7, "client", (_QWORD)v11);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 40), "client");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v8, "isEqual:", v9);

        if (v10)
        {
          objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 160), "removeObject:", v7);

          goto LABEL_11;
        }

      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      if (v4)
        continue;
      break;
    }
  }
LABEL_11:

}

- (void)removeAllClients
{
  NSObject *serialQueue;
  _QWORD block[5];

  serialQueue = self->_serialQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __44__MRNowPlayingOriginClient_removeAllClients__block_invoke;
  block[3] = &unk_1E30C5CA8;
  block[4] = self;
  dispatch_sync(serialQueue, block);
}

uint64_t __44__MRNowPlayingOriginClient_removeAllClients__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 160), "removeAllObjects");
}

- (void)restoreNowPlayingClientState
{
  _QWORD v3[4];
  id v4;
  id location;

  if (-[MROrigin isHosted](self->_origin, "isHosted"))
  {
    objc_initWeak(&location, self);
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __56__MRNowPlayingOriginClient_restoreNowPlayingClientState__block_invoke;
    v3[3] = &unk_1E30CEA58;
    objc_copyWeak(&v4, &location);
    -[MRNowPlayingOriginClient _prepareToRestoreClientStateWithCompletion:](self, "_prepareToRestoreClientStateWithCompletion:", v3);
    objc_destroyWeak(&v4);
    objc_destroyWeak(&location);
  }
  else
  {
    -[MRNowPlayingOriginClient _restoreNowPlayingClientState](self, "_restoreNowPlayingClientState");
  }
}

void __56__MRNowPlayingOriginClient_restoreNowPlayingClientState__block_invoke(uint64_t a1, uint64_t a2)
{
  id WeakRetained;

  if (!a2)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    objc_msgSend(WeakRetained, "_restoreNowPlayingClientState");

  }
}

- (void)_prepareToRestoreClientStateWithCompletion:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  uint64_t v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  MRAVLightweightReconnaissanceSession *v20;
  NSString *routingContextID;
  OS_dispatch_queue *serialQueue;
  MROrigin *v23;
  id v24;
  id v25;
  id v26;
  id v27;
  void *v28;
  MROrigin *v29;
  _QWORD v30[4];
  id v31;
  id v32;
  MROrigin *v33;
  id v34;
  _QWORD v35[4];
  id v36;
  __CFString *v37;
  id v38;
  id v39;
  id v40;
  uint8_t buf[4];
  void *v42;
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v29 = self->_origin;
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "UUIDString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("restoreClientState<%@>"), v6);
  v9 = objc_alloc(MEMORY[0x1E0CB3940]);
  -[MROrigin displayName](self->_origin, "displayName");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v9, "initWithFormat:", CFSTR("origin=%@ routingContext=%@"), v10, self->_routingContextID);

  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithFormat:", CFSTR("%@<%@>"), CFSTR("restoreClientState"), v6);
  v13 = v12;
  if (v11)
    objc_msgSend(v12, "appendFormat:", CFSTR(" for %@"), v11);
  _MRLogForCategory(0xAuLL);
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v42 = v13;
    _os_log_impl(&dword_193827000, v14, OS_LOG_TYPE_DEFAULT, "Request: %{public}@", buf, 0xCu);
  }

  v28 = v13;
  v15 = MEMORY[0x1E0C809B0];
  v35[0] = MEMORY[0x1E0C809B0];
  v35[1] = 3221225472;
  v35[2] = __71__MRNowPlayingOriginClient__prepareToRestoreClientStateWithCompletion___block_invoke;
  v35[3] = &unk_1E30CBD50;
  v40 = v4;
  v36 = v11;
  v37 = CFSTR("restoreClientState");
  v16 = v6;
  v38 = v16;
  v39 = v7;
  v17 = v7;
  v18 = v11;
  v27 = v4;
  v19 = (void *)MEMORY[0x194036C44](v35);
  v20 = objc_alloc_init(MRAVLightweightReconnaissanceSession);
  routingContextID = self->_routingContextID;
  serialQueue = self->_serialQueue;
  v30[0] = v15;
  v30[1] = 3221225472;
  v30[2] = __71__MRNowPlayingOriginClient__prepareToRestoreClientStateWithCompletion___block_invoke_69;
  v30[3] = &unk_1E30CEEA0;
  v31 = v8;
  v32 = v16;
  v33 = v29;
  v34 = v19;
  v23 = v29;
  v24 = v16;
  v25 = v8;
  v26 = v19;
  -[MRAVLightweightReconnaissanceSession searchEndpointsForRoutingContextUID:timeout:reason:queue:completion:](v20, "searchEndpointsForRoutingContextUID:timeout:reason:queue:completion:", routingContextID, v25, serialQueue, v30, 20.0);

}

void __71__MRNowPlayingOriginClient__prepareToRestoreClientStateWithCompletion___block_invoke(_QWORD *a1, void *a2)
{
  id v3;
  uint64_t v4;
  NSObject *v5;
  NSObject *v6;
  _BOOL4 v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  _BOOL4 v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  const char *v19;
  NSObject *v20;
  uint32_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  int v25;
  uint64_t v26;
  __int16 v27;
  uint64_t v28;
  __int16 v29;
  id v30;
  __int16 v31;
  uint64_t v32;
  __int16 v33;
  uint64_t v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  (*(void (**)(void))(a1[8] + 16))();
  v4 = a1[4];
  _MRLogForCategory(0xAuLL);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (!v3)
  {
    v13 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
    if (v4)
    {
      if (!v13)
        goto LABEL_15;
      v15 = a1[5];
      v14 = a1[6];
      v16 = (void *)a1[4];
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "timeIntervalSinceDate:", a1[7]);
      v25 = 138544130;
      v26 = v15;
      v27 = 2114;
      v28 = v14;
      v29 = 2114;
      v30 = v16;
      v31 = 2048;
      v32 = v18;
      v19 = "Response: %{public}@<%{public}@> returned for %{public}@ in %.4lf seconds";
      v20 = v6;
      v21 = 42;
    }
    else
    {
      if (!v13)
        goto LABEL_15;
      v22 = a1[5];
      v23 = a1[6];
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "timeIntervalSinceDate:", a1[7]);
      v25 = 138543874;
      v26 = v22;
      v27 = 2114;
      v28 = v23;
      v29 = 2048;
      v30 = v24;
      v19 = "Response: %{public}@<%{public}@> returned in %.4lf seconds";
      v20 = v6;
      v21 = 32;
    }
    _os_log_impl(&dword_193827000, v20, OS_LOG_TYPE_DEFAULT, v19, (uint8_t *)&v25, v21);

    goto LABEL_15;
  }
  v7 = os_log_type_enabled(v5, OS_LOG_TYPE_ERROR);
  if (v4)
  {
    if (v7)
    {
      v9 = a1[5];
      v8 = a1[6];
      v10 = a1[4];
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "timeIntervalSinceDate:", a1[7]);
      v25 = 138544386;
      v26 = v9;
      v27 = 2114;
      v28 = v8;
      v29 = 2114;
      v30 = v3;
      v31 = 2114;
      v32 = v10;
      v33 = 2048;
      v34 = v12;
      _os_log_error_impl(&dword_193827000, v6, OS_LOG_TYPE_ERROR, "Response: %{public}@<%{public}@> returned with error <%{public}@> for %{public}@ in %.4lf seconds", (uint8_t *)&v25, 0x34u);

    }
  }
  else if (v7)
  {
    __MRMediaRemoteRequestNowPlayingPlaybackQueueCapabilitiesForPlayer_block_invoke_2_cold_1((uint64_t)a1);
  }

  _MRLogForCategory(0);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
    __71__MRNowPlayingOriginClient__prepareToRestoreClientStateWithCompletion___block_invoke_cold_1((uint64_t)a1, (uint64_t)v3, v6);
LABEL_15:

}

void __71__MRNowPlayingOriginClient__prepareToRestoreClientStateWithCompletion___block_invoke_69(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  _QWORD v5[4];
  id v6;
  id v7;
  id v8;

  v3 = a2;
  if (v3)
  {
    v4 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    objc_msgSend(v4, "setObject:forKeyedSubscript:", *(_QWORD *)(a1 + 32), CFSTR("MREndpointConnectionReasonUserInfoKey"));
    objc_msgSend(v4, "setObject:forKeyedSubscript:", *(_QWORD *)(a1 + 40), CFSTR("MREndpointConnectionCorrelationIDUserInfoKey"));
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __71__MRNowPlayingOriginClient__prepareToRestoreClientStateWithCompletion___block_invoke_2;
    v5[3] = &unk_1E30C6990;
    v8 = *(id *)(a1 + 56);
    v6 = v3;
    v7 = *(id *)(a1 + 48);
    objc_msgSend(v6, "connectToExternalDeviceWithUserInfo:completion:", v4, v5);

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }

}

void __71__MRNowPlayingOriginClient__prepareToRestoreClientStateWithCompletion___block_invoke_2(uint64_t a1, uint64_t a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  if (a2)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "origin");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v3;
    if (v3)
    {
      if ((objc_msgSend(v3, "isEqual:", *(_QWORD *)(a1 + 40)) & 1) == 0)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[MRNowPlayingOriginClient _prepareToRestoreClientStateWithCompletion:]_block_invoke_2");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, CFSTR("MRNowPlayingOriginClient.m"), 300, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[endpointOrigin isEqual:origin]"), v7);

      }
      (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
    }
    else
    {
      v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB35C8]), "initWithMRError:", 117);
      (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

    }
  }
}

- (void)_restoreNowPlayingClientState
{
  NSObject *serialQueue;
  _QWORD block[5];

  serialQueue = self->_serialQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __57__MRNowPlayingOriginClient__restoreNowPlayingClientState__block_invoke;
  block[3] = &unk_1E30C5CA8;
  block[4] = self;
  dispatch_sync(serialQueue, block);
}

void __57__MRNowPlayingOriginClient__restoreNowPlayingClientState__block_invoke(uint64_t a1)
{
  MRPlayerPath *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  MRPlayerPath *v15;
  void *v16;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v2 = -[MRPlayerPath initWithOrigin:client:player:]([MRPlayerPath alloc], "initWithOrigin:client:player:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 184), 0, 0);
  v3 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(v3 + 16))
  {
    v4 = (void *)MRGetSharedService();
    MRMediaRemoteServiceSetNowPlayingAppOverride(v4, 1);
    v3 = *(_QWORD *)(a1 + 32);
  }
  if (*(_QWORD *)(v3 + 24))
  {
    v5 = (void *)MRGetSharedService();
    MRMediaRemoteServiceSetOverriddenNowPlayingApplication(v5, *(void **)(*(_QWORD *)(a1 + 32) + 24));
    v3 = *(_QWORD *)(a1 + 32);
  }
  if (*(_DWORD *)(v3 + 32))
  {
    v6 = (void *)MRGetSharedService();
    MRMediaRemoteServiceSetRouteDiscoveryMode(v6, *(_DWORD *)(*(_QWORD *)(a1 + 32) + 32));
    v3 = *(_QWORD *)(a1 + 32);
  }
  if (*(_DWORD *)(v3 + 48))
  {
    v7 = (void *)MRGetSharedService();
    MRMediaRemoteServiceSetGameControllerRemoteInputMode(v7, *(_DWORD *)(*(_QWORD *)(a1 + 32) + 48), 0, 0);
    v3 = *(_QWORD *)(a1 + 32);
  }
  if (*(_DWORD *)(v3 + 56))
  {
    v8 = (void *)MRGetSharedService();
    MRMediaRemoteServiceSetPickedRouteVolumeControlCapabilities(v8, v2, *(_DWORD *)(*(_QWORD *)(a1 + 32) + 56), 0, 0);
    v3 = *(_QWORD *)(a1 + 32);
  }
  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v9 = *(id *)(v3 + 160);
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v19;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v19 != v12)
          objc_enumerationMutation(v9);
        objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * v13++), "restoreNowPlayingClientState", (_QWORD)v18);
      }
      while (v11 != v13);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v11);
  }

  v14 = *(_QWORD *)(a1 + 32);
  if (*(_QWORD *)(v14 + 176))
  {
    v15 = -[MRPlayerPath initWithOrigin:client:player:]([MRPlayerPath alloc], "initWithOrigin:client:player:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 184), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 176), 0);
    v16 = (void *)MRGetSharedService();
    MRMediaRemoteServiceSetNowPlayingClient(v16, v15, 0, 0);

    v14 = *(_QWORD *)(a1 + 32);
  }
  if (*(_QWORD *)(v14 + 64))
  {
    v17 = (void *)MRGetSharedService();
    MRMediaRemoteServiceBeginActivity(v17, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 64), 0, 0);
  }

}

- (id)description
{
  id v2;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t (*v7)(uint64_t, uint64_t);
  void (*v8)(uint64_t);
  id v9;

  v4 = 0;
  v5 = &v4;
  v6 = 0x3032000000;
  v7 = __Block_byref_object_copy__41;
  v8 = __Block_byref_object_dispose__41;
  v9 = 0;
  msv_dispatch_sync_on_queue();
  v2 = (id)v5[5];
  _Block_object_dispose(&v4, 8);

  return v2;
}

void __39__MRNowPlayingOriginClient_description__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  objc_super v6;

  v6.receiver = *(id *)(a1 + 32);
  v6.super_class = (Class)MRNowPlayingOriginClient;
  objc_msgSendSuper2(&v6, sel_description);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringByAppendingFormat:", CFSTR("Origin: %@ Clients: %@"), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 184), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 160));
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

- (id)debugDescription
{
  id v2;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t (*v7)(uint64_t, uint64_t);
  void (*v8)(uint64_t);
  id v9;

  v4 = 0;
  v5 = &v4;
  v6 = 0x3032000000;
  v7 = __Block_byref_object_copy__41;
  v8 = __Block_byref_object_dispose__41;
  v9 = 0;
  msv_dispatch_sync_on_queue();
  v2 = (id)v5[5];
  _Block_object_dispose(&v4, 8);

  return v2;
}

void __44__MRNowPlayingOriginClient_debugDescription__block_invoke(uint64_t a1)
{
  uint64_t v2;
  const __CFString *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  const __CFString *v18;
  uint64_t v19;
  void *v20;
  void **v21;
  __CFString *Description;
  void *v23;
  __CFString *v24;
  void *v25;

  v20 = (void *)MEMORY[0x1E0CB3940];
  v21 = *(void ***)(a1 + 32);
  MRCreateIndentedDebugDescriptionFromObject(v21[23]);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = *(_QWORD *)(a1 + 32);
  v19 = *(_QWORD *)(v2 + 72);
  v3 = CFSTR("YES");
  if (!*(_BYTE *)(v2 + 16))
    v3 = CFSTR("NO");
  v18 = v3;
  v24 = (__CFString *)MRMediaRemoteCopyRouteDiscoveryModeDescription(*(_DWORD *)(v2 + 32));
  MRCreateIndentedDebugDescriptionFromArray(*(void **)(*(_QWORD *)(a1 + 32) + 40));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  Description = MRGameControllerInputModeCreateDescription(*(_DWORD *)(*(_QWORD *)(a1 + 32) + 48));
  v4 = (void *)MRMediaRemotePickedRouteVolumeControlCapabilitiesCopyDescription(*(_DWORD *)(*(_QWORD *)(a1 + 32) + 56));
  v5 = (void *)MEMORY[0x194036C44](*(_QWORD *)(*(_QWORD *)(a1 + 32) + 80));
  v6 = (void *)MEMORY[0x194036C44](*(_QWORD *)(*(_QWORD *)(a1 + 32) + 88));
  v7 = (void *)MEMORY[0x194036C44](*(_QWORD *)(*(_QWORD *)(a1 + 32) + 96));
  v8 = (void *)MEMORY[0x194036C44](*(_QWORD *)(*(_QWORD *)(a1 + 32) + 104));
  v9 = (void *)MEMORY[0x194036C44](*(_QWORD *)(*(_QWORD *)(a1 + 32) + 112));
  v10 = *(_QWORD *)(a1 + 32);
  v11 = *(_QWORD *)(v10 + 64);
  MRCreateIndentedDebugDescriptionFromObject(*(void **)(v10 + 176));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  MRCreateIndentedDebugDescriptionFromArray(*(void **)(*(_QWORD *)(a1 + 32) + 160));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "stringWithFormat:", CFSTR("    origin = %@\n    routingContextID = %@\n    isOverrideApp = %@\n    routeDiscoveryMode = %@\n    applicationPickedRoutes = %@\n    inputMode = %@\n    volumeCapabilities = %@\n    playbackQueueCallback = %@\n    capabilitiesCallback = %@\n    commandCallback = %@\n    beginLyricsEventCallback = %@\n    endLyricsEventCallback = %@\n    activity = %@\n    activeNowPlayingClient = %@\n    nowPlayingClients = %@\n"), v25, v19, v18, v24, v23, Description, v4, v5, v6, v7, v8, v9, v11, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  MRCreateFormattedDebugDescriptionFromClass(v21, v14);
  v15 = objc_claimAutoreleasedReturnValue();
  v16 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v17 = *(void **)(v16 + 40);
  *(_QWORD *)(v16 + 40) = v15;

}

- (MROrigin)origin
{
  return self->_origin;
}

- (BOOL)isOverrideApp
{
  return self->_overrideApp;
}

- (void)setOverrideApp:(BOOL)a3
{
  self->_overrideApp = a3;
}

- (unsigned)hardwareRemoteBehavior
{
  return self->_hardwareRemoteBehavior;
}

- (void)setHardwareRemoteBehavior:(unsigned int)a3
{
  self->_hardwareRemoteBehavior = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_origin, 0);
  objc_storeStrong((id *)&self->_activeNowPlayingClient, 0);
  objc_storeStrong((id *)&self->_nowPlayingClients, 0);
  objc_storeStrong(&self->_clientMessageCallback, 0);
  objc_storeStrong(&self->_playbackSessionMigrateRequestCallback, 0);
  objc_storeStrong(&self->_playbackSessionMigrateEndCallback, 0);
  objc_storeStrong(&self->_playbackSessionMigrateBeginCallback, 0);
  objc_storeStrong(&self->_playbackSessionCallback, 0);
  objc_storeStrong(&self->_endLyricsEventCallback, 0);
  objc_storeStrong(&self->_beginLyricsEventCallback, 0);
  objc_storeStrong(&self->_commandCallback, 0);
  objc_storeStrong(&self->_capabilitiesCallback, 0);
  objc_storeStrong(&self->_playbackQueueCallback, 0);
  objc_storeStrong((id *)&self->_routingContextID, 0);
  objc_storeStrong((id *)&self->_activity, 0);
  objc_storeStrong((id *)&self->_applicationPickedRoutes, 0);
  objc_storeStrong((id *)&self->_overrideAppBundleID, 0);
  objc_storeStrong((id *)&self->_serialQueue, 0);
}

void __71__MRNowPlayingOriginClient__prepareToRestoreClientStateWithCompletion___block_invoke_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = *(_QWORD *)(a1 + 48);
  v4 = 138412546;
  v5 = v3;
  v6 = 2112;
  v7 = a2;
  _os_log_fault_impl(&dword_193827000, log, OS_LOG_TYPE_FAULT, "Error trying to restoreClientState<%@> %@", (uint8_t *)&v4, 0x16u);
}

@end
