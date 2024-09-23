@implementation MPMusicPlayerController

- (MPMusicPlayerController)initWithClientIdentifier:(id)a3
{
  return -[MPMusicPlayerController initWithClientIdentifier:queue:](self, "initWithClientIdentifier:queue:", a3, 0);
}

- (MPMusicPlayerController)initWithClientIdentifier:(id)a3 queue:(id)a4
{
  id v7;
  id v8;
  MPMusicPlayerController *v9;
  MPMusicPlayerController *v10;
  OS_dispatch_queue *v11;
  OS_dispatch_queue *queue;
  OS_dispatch_queue *v13;
  id v14;
  uint64_t v15;
  NSString *clientIdentifier;
  MPVolumeController *v17;
  MPVolumeControllerSystemDataSource *v18;
  uint64_t v19;
  MPVolumeController *volumeController;
  void *v22;
  objc_super v23;

  v7 = a3;
  v8 = a4;
  if (-[MPMusicPlayerController isMemberOfClass:](self, "isMemberOfClass:", objc_opt_class()))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MPMusicPlayerController.m"), 101, CFSTR("Must initialize a concrete instance of MPMusicPlayerController."));

  }
  v23.receiver = self;
  v23.super_class = (Class)MPMusicPlayerController;
  v9 = -[MPMusicPlayerController init](&v23, sel_init);
  v10 = v9;
  if (v9)
  {
    v9->_serverValidated = 0;
    if (v8)
    {
      v11 = (OS_dispatch_queue *)v8;
      queue = v10->_queue;
      v10->_queue = v11;
    }
    else
    {
      v13 = (OS_dispatch_queue *)MEMORY[0x1E0C80D38];
      v14 = MEMORY[0x1E0C80D38];
      queue = v10->_queue;
      v10->_queue = v13;
    }

    v10->_lock._os_unfair_lock_opaque = 0;
    v15 = objc_msgSend(v7, "copy");
    clientIdentifier = v10->_clientIdentifier;
    v10->_clientIdentifier = (NSString *)v15;

    v17 = [MPVolumeController alloc];
    v18 = objc_alloc_init(MPVolumeControllerSystemDataSource);
    v19 = -[MPVolumeController initWithDataSource:](v17, "initWithDataSource:", v18);
    volumeController = v10->_volumeController;
    v10->_volumeController = (MPVolumeController *)v19;

    -[MPVolumeController setDelegate:](v10->_volumeController, "setDelegate:", v10);
    *(int64x2_t *)&v10->_shuffleMode = vdupq_n_s64(1uLL);
  }

  return v10;
}

- (void)dealloc
{
  objc_super v3;

  -[NSXPCConnection invalidate](self->_connection, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)MPMusicPlayerController;
  -[MPMusicPlayerController dealloc](&v3, sel_dealloc);
}

- (NSString)description
{
  return (NSString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%@:%p client=%@>"), objc_opt_class(), self, self->_clientIdentifier);
}

- (MPMusicPlaybackState)playbackState
{
  void *v2;
  MPMusicPlaybackState v3;

  -[MPMusicPlayerController _snapshot](self, "_snapshot");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "state");

  return v3;
}

- (MPMusicRepeatMode)repeatMode
{
  if (-[MPMusicPlayerController isPreparedToPlay](self, "isPreparedToPlay"))
    return -[MPMusicPlayerController _serverRepeatMode](self, "_serverRepeatMode");
  else
    return self->_repeatMode;
}

- (void)setRepeatMode:(MPMusicRepeatMode)repeatMode
{
  void *v5;
  int64_t v6;
  void *v7;

  self->_repeatMode = repeatMode;
  -[MPMusicPlayerController targetQueueDescriptor](self, "targetQueueDescriptor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    if ((unint64_t)(self->_repeatMode - 1) >= 3)
      v6 = 3;
    else
      v6 = self->_repeatMode - 1;
    -[MPMusicPlayerController targetQueueDescriptor](self, "targetQueueDescriptor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setRepeatType:", v6);

  }
  if (-[MPMusicPlayerController isPreparedToPlay](self, "isPreparedToPlay"))
    -[MPMusicPlayerController _setServerRepeatMode:](self, "_setServerRepeatMode:", repeatMode);
}

- (MPMusicShuffleMode)shuffleMode
{
  if (-[MPMusicPlayerController isPreparedToPlay](self, "isPreparedToPlay"))
    return -[MPMusicPlayerController _serverShuffleMode](self, "_serverShuffleMode");
  else
    return self->_shuffleMode;
}

- (void)setShuffleMode:(MPMusicShuffleMode)shuffleMode
{
  void *v5;
  int64_t v6;
  void *v7;

  self->_shuffleMode = shuffleMode;
  -[MPMusicPlayerController targetQueueDescriptor](self, "targetQueueDescriptor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    if ((unint64_t)(self->_shuffleMode - 1) >= 3)
      v6 = 1000;
    else
      v6 = self->_shuffleMode - 1;
    -[MPMusicPlayerController targetQueueDescriptor](self, "targetQueueDescriptor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setShuffleType:", v6);

  }
  if (-[MPMusicPlayerController isPreparedToPlay](self, "isPreparedToPlay"))
    -[MPMusicPlayerController _setServerShuffleMode:](self, "_setServerShuffleMode:", shuffleMode);
}

- (int64_t)_serverRepeatMode
{
  NSObject *v3;
  os_signpost_id_t v4;
  NSObject *v5;
  NSObject *v6;
  NSObject *v7;
  NSObject *v8;
  NSObject *v9;
  NSObject *v10;
  int64_t v11;
  _QWORD v13[5];
  uint8_t v14[4];
  os_signpost_id_t v15;
  __int128 buf;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = os_log_create("com.apple.amp.mediaplayer", "SDKPlayback");
  v4 = os_signpost_id_generate(v3);

  v5 = os_log_create("com.apple.amp.mediaplayer", "SDKPlayback");
  v6 = v5;
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    LOWORD(buf) = 0;
    _os_signpost_emit_with_name_impl(&dword_193B9B000, v6, OS_SIGNPOST_INTERVAL_BEGIN, v4, "getRepeatMode", (const char *)&unk_193F291C9, (uint8_t *)&buf, 2u);
  }

  v7 = os_log_create("com.apple.amp.mediaplayer", "SDKPlayback");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    LODWORD(buf) = 134217984;
    *(_QWORD *)((char *)&buf + 4) = v4;
    _os_log_impl(&dword_193B9B000, v7, OS_LOG_TYPE_DEBUG, "BEGIN [%lld]: getRepeatMode ", (uint8_t *)&buf, 0xCu);
  }

  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v17 = 0x2020000000;
  v18 = 1;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __44__MPMusicPlayerController__serverRepeatMode__block_invoke;
  v13[3] = &unk_1E31554F8;
  v13[4] = &buf;
  -[MPMusicPlayerController onServer:](self, "onServer:", v13);
  v8 = os_log_create("com.apple.amp.mediaplayer", "SDKPlayback");
  v9 = v8;
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
  {
    *(_WORD *)v14 = 0;
    _os_signpost_emit_with_name_impl(&dword_193B9B000, v9, OS_SIGNPOST_INTERVAL_END, v4, "getRepeatMode", (const char *)&unk_193F291C9, v14, 2u);
  }

  v10 = os_log_create("com.apple.amp.mediaplayer", "SDKPlayback");
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)v14 = 134217984;
    v15 = v4;
    _os_log_impl(&dword_193B9B000, v10, OS_LOG_TYPE_DEBUG, "END [%lld]: getRepeatMode ", v14, 0xCu);
  }

  v11 = *(_QWORD *)(*((_QWORD *)&buf + 1) + 24);
  _Block_object_dispose(&buf, 8);
  return v11;
}

- (void)_setServerRepeatMode:(int64_t)a3
{
  NSObject *v5;
  os_signpost_id_t v6;
  NSObject *v7;
  NSObject *v8;
  NSObject *v9;
  NSObject *v10;
  NSObject *v11;
  NSObject *v12;
  _QWORD v13[5];
  uint8_t buf[4];
  int64_t v15;
  __int16 v16;
  int64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = os_log_create("com.apple.amp.mediaplayer", "SDKPlayback");
  v6 = os_signpost_id_generate(v5);

  v7 = os_log_create("com.apple.amp.mediaplayer", "SDKPlayback");
  v8 = v7;
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    *(_DWORD *)buf = 134217984;
    v15 = a3;
    _os_signpost_emit_with_name_impl(&dword_193B9B000, v8, OS_SIGNPOST_INTERVAL_BEGIN, v6, "setRepeatMode", "repeatMode=%ld", buf, 0xCu);
  }

  v9 = os_log_create("com.apple.amp.mediaplayer", "SDKPlayback");
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134218240;
    v15 = v6;
    v16 = 2048;
    v17 = a3;
    _os_log_impl(&dword_193B9B000, v9, OS_LOG_TYPE_DEBUG, "BEGIN [%lld]: setRepeatMode repeatMode=%ld", buf, 0x16u);
  }

  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __48__MPMusicPlayerController__setServerRepeatMode___block_invoke;
  v13[3] = &__block_descriptor_40_e41_v16__0___MPMusicPlayerControllerServer__8l;
  v13[4] = a3;
  -[MPMusicPlayerController onServer:](self, "onServer:", v13);
  v10 = os_log_create("com.apple.amp.mediaplayer", "SDKPlayback");
  v11 = v10;
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_193B9B000, v11, OS_SIGNPOST_INTERVAL_END, v6, "setRepeatMode", (const char *)&unk_193F291C9, buf, 2u);
  }

  v12 = os_log_create("com.apple.amp.mediaplayer", "SDKPlayback");
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134217984;
    v15 = v6;
    _os_log_impl(&dword_193B9B000, v12, OS_LOG_TYPE_DEBUG, "END [%lld]: setRepeatMode ", buf, 0xCu);
  }

}

- (int64_t)_serverShuffleMode
{
  NSObject *v3;
  os_signpost_id_t v4;
  NSObject *v5;
  NSObject *v6;
  NSObject *v7;
  NSObject *v8;
  NSObject *v9;
  NSObject *v10;
  int64_t v11;
  _QWORD v13[5];
  uint8_t v14[4];
  os_signpost_id_t v15;
  __int128 buf;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = os_log_create("com.apple.amp.mediaplayer", "SDKPlayback");
  v4 = os_signpost_id_generate(v3);

  v5 = os_log_create("com.apple.amp.mediaplayer", "SDKPlayback");
  v6 = v5;
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    LOWORD(buf) = 0;
    _os_signpost_emit_with_name_impl(&dword_193B9B000, v6, OS_SIGNPOST_INTERVAL_BEGIN, v4, "getShuffleMode", (const char *)&unk_193F291C9, (uint8_t *)&buf, 2u);
  }

  v7 = os_log_create("com.apple.amp.mediaplayer", "SDKPlayback");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    LODWORD(buf) = 134217984;
    *(_QWORD *)((char *)&buf + 4) = v4;
    _os_log_impl(&dword_193B9B000, v7, OS_LOG_TYPE_DEBUG, "BEGIN [%lld]: getShuffleMode ", (uint8_t *)&buf, 0xCu);
  }

  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v17 = 0x2020000000;
  v18 = 1;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __45__MPMusicPlayerController__serverShuffleMode__block_invoke;
  v13[3] = &unk_1E31554F8;
  v13[4] = &buf;
  -[MPMusicPlayerController onServer:](self, "onServer:", v13);
  v8 = os_log_create("com.apple.amp.mediaplayer", "SDKPlayback");
  v9 = v8;
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
  {
    *(_WORD *)v14 = 0;
    _os_signpost_emit_with_name_impl(&dword_193B9B000, v9, OS_SIGNPOST_INTERVAL_END, v4, "getShuffleMode", (const char *)&unk_193F291C9, v14, 2u);
  }

  v10 = os_log_create("com.apple.amp.mediaplayer", "SDKPlayback");
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)v14 = 134217984;
    v15 = v4;
    _os_log_impl(&dword_193B9B000, v10, OS_LOG_TYPE_DEBUG, "END [%lld]: getShuffleMode ", v14, 0xCu);
  }

  v11 = *(_QWORD *)(*((_QWORD *)&buf + 1) + 24);
  _Block_object_dispose(&buf, 8);
  return v11;
}

- (void)_setServerShuffleMode:(int64_t)a3
{
  NSObject *v5;
  os_signpost_id_t v6;
  NSObject *v7;
  NSObject *v8;
  NSObject *v9;
  NSObject *v10;
  NSObject *v11;
  NSObject *v12;
  _QWORD v13[5];
  uint8_t buf[4];
  int64_t v15;
  __int16 v16;
  int64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = os_log_create("com.apple.amp.mediaplayer", "SDKPlayback");
  v6 = os_signpost_id_generate(v5);

  v7 = os_log_create("com.apple.amp.mediaplayer", "SDKPlayback");
  v8 = v7;
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    *(_DWORD *)buf = 134217984;
    v15 = a3;
    _os_signpost_emit_with_name_impl(&dword_193B9B000, v8, OS_SIGNPOST_INTERVAL_BEGIN, v6, "setShuffleMode", "shuffleMode=%ld", buf, 0xCu);
  }

  v9 = os_log_create("com.apple.amp.mediaplayer", "SDKPlayback");
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134218240;
    v15 = v6;
    v16 = 2048;
    v17 = a3;
    _os_log_impl(&dword_193B9B000, v9, OS_LOG_TYPE_DEBUG, "BEGIN [%lld]: setShuffleMode shuffleMode=%ld", buf, 0x16u);
  }

  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __49__MPMusicPlayerController__setServerShuffleMode___block_invoke;
  v13[3] = &__block_descriptor_40_e41_v16__0___MPMusicPlayerControllerServer__8l;
  v13[4] = a3;
  -[MPMusicPlayerController onServer:](self, "onServer:", v13);
  v10 = os_log_create("com.apple.amp.mediaplayer", "SDKPlayback");
  v11 = v10;
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_193B9B000, v11, OS_SIGNPOST_INTERVAL_END, v6, "setShuffleMode", (const char *)&unk_193F291C9, buf, 2u);
  }

  v12 = os_log_create("com.apple.amp.mediaplayer", "SDKPlayback");
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134217984;
    v15 = v6;
    _os_log_impl(&dword_193B9B000, v12, OS_LOG_TYPE_DEBUG, "END [%lld]: setShuffleMode ", buf, 0xCu);
  }

}

- (BOOL)prioritizeStartupOverQuality
{
  return self->_prioritizeStartupOverQuality;
}

- (void)setPrioritizeStartupOverQuality:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  id v6;

  v3 = a3;
  self->_prioritizeStartupOverQuality = a3;
  -[MPMusicPlayerController targetQueueDescriptor](self, "targetQueueDescriptor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[MPMusicPlayerController targetQueueDescriptor](self, "targetQueueDescriptor");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setPrioritizeStartupOverQuality:", v3);

  }
}

- (MPMediaItem)nowPlayingItem
{
  void *v3;
  void *v4;

  -[MPMusicPlayerController _nowPlaying](self, "_nowPlaying");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPMusicPlayerController _mediaItemFromNowPlaying:](self, "_mediaItemFromNowPlaying:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (MPMediaItem *)v4;
}

- (void)setNowPlayingItem:(MPMediaItem *)nowPlayingItem
{
  MPMediaItem *v4;
  uint64_t v5;
  void *v6;
  MPMediaItem *v7;
  MPMediaItem *v8;

  v8 = nowPlayingItem;
  if (-[MPMusicPlayerController isPreparedToPlay](self, "isPreparedToPlay")
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v4 = v8;
    v5 = objc_opt_class();
    if (v5 == objc_opt_class())
    {
      v7 = v4;
      -[MPMediaItem itemIdentifier](v7, "itemIdentifier");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[MPMediaItem item](v7, "item");
      v4 = (MPMediaItem *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v6 = 0;
    }
    -[MPMusicPlayerController _setNowPlayingItem:itemIdentifier:](self, "_setNowPlayingItem:itemIdentifier:", v4, v6);

  }
  else
  {
    -[MPMusicPlayerQueueDescriptor setStartItem:](self->_targetQueueDescriptor, "setStartItem:", v8);
  }

}

- (unint64_t)nowPlayingUID
{
  void *v2;
  unint64_t v3;

  -[MPMusicPlayerController _nowPlaying](self, "_nowPlaying");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "itemUID");

  return v3;
}

- (void)setNowPlayingUID:(unint64_t)a3
{
  -[MPMusicPlayerController setNowPlayingUID:error:](self, "setNowPlayingUID:error:", a3, 0);
}

- (BOOL)setNowPlayingUID:(unint64_t)a3 error:(id *)a4
{
  NSObject *v7;
  os_signpost_id_t v8;
  NSObject *v9;
  NSObject *v10;
  NSObject *v11;
  NSObject *v12;
  NSObject *v13;
  NSObject *v14;
  BOOL v15;
  _QWORD v17[6];
  uint8_t v18[4];
  os_signpost_id_t v19;
  __int128 buf;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v7 = os_log_create("com.apple.amp.mediaplayer", "SDKPlayback");
  v8 = os_signpost_id_generate(v7);

  v9 = os_log_create("com.apple.amp.mediaplayer", "SDKPlayback");
  v10 = v9;
  if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    LOWORD(buf) = 0;
    _os_signpost_emit_with_name_impl(&dword_193B9B000, v10, OS_SIGNPOST_INTERVAL_BEGIN, v8, "setNowPlayingUID", (const char *)&unk_193F291C9, (uint8_t *)&buf, 2u);
  }

  v11 = os_log_create("com.apple.amp.mediaplayer", "SDKPlayback");
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    LODWORD(buf) = 134217984;
    *(_QWORD *)((char *)&buf + 4) = v8;
    _os_log_impl(&dword_193B9B000, v11, OS_LOG_TYPE_DEBUG, "BEGIN [%lld]: setNowPlayingUID ", (uint8_t *)&buf, 0xCu);
  }

  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v21 = 0x3032000000;
  v22 = __Block_byref_object_copy__12018;
  v23 = __Block_byref_object_dispose__12019;
  v24 = 0;
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __50__MPMusicPlayerController_setNowPlayingUID_error___block_invoke;
  v17[3] = &unk_1E3155568;
  v17[4] = &buf;
  v17[5] = a3;
  -[MPMusicPlayerController onServer:](self, "onServer:", v17);
  v12 = os_log_create("com.apple.amp.mediaplayer", "SDKPlayback");
  v13 = v12;
  if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
  {
    *(_WORD *)v18 = 0;
    _os_signpost_emit_with_name_impl(&dword_193B9B000, v13, OS_SIGNPOST_INTERVAL_END, v8, "setNowPlayingUID", (const char *)&unk_193F291C9, v18, 2u);
  }

  v14 = os_log_create("com.apple.amp.mediaplayer", "SDKPlayback");
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)v18 = 134217984;
    v19 = v8;
    _os_log_impl(&dword_193B9B000, v14, OS_LOG_TYPE_DEBUG, "END [%lld]: setNowPlayingUID ", v18, 0xCu);
  }

  if (a4)
    *a4 = objc_retainAutorelease(*(id *)(*((_QWORD *)&buf + 1) + 40));
  v15 = *(_QWORD *)(*((_QWORD *)&buf + 1) + 40) != 0;
  _Block_object_dispose(&buf, 8);

  return v15;
}

- (unint64_t)nowPlayingUIDAtIndex:(unint64_t)a3
{
  void *v3;
  unint64_t v4;

  -[MPMusicPlayerController nowPlayingAtIndex:](self, "nowPlayingAtIndex:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "itemUID");

  return v4;
}

- (void)_setNowPlayingItem:(id)a3 itemIdentifier:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  NSObject *v11;
  os_signpost_id_t v12;
  NSObject *v13;
  NSObject *v14;
  NSObject *v15;
  id v16;
  id v17;
  NSObject *v18;
  NSObject *v19;
  NSObject *v20;
  _QWORD v21[4];
  id v22;
  id v23;
  uint8_t buf[4];
  os_signpost_id_t v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (v6)
    v9 = v6;
  else
    v9 = v7;
  v10 = v9;
  v11 = os_log_create("com.apple.amp.mediaplayer", "SDKPlayback");
  v12 = os_signpost_id_make_with_pointer(v11, v10);

  v13 = os_log_create("com.apple.amp.mediaplayer", "SDKPlayback");
  v14 = v13;
  if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_193B9B000, v14, OS_SIGNPOST_INTERVAL_BEGIN, v12, "setNowPlayingItem", (const char *)&unk_193F291C9, buf, 2u);
  }

  v15 = os_log_create("com.apple.amp.mediaplayer", "SDKPlayback");
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134217984;
    v25 = v12;
    _os_log_impl(&dword_193B9B000, v15, OS_LOG_TYPE_DEBUG, "BEGIN [%lld]: setNowPlayingItem ", buf, 0xCu);
  }

  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __61__MPMusicPlayerController__setNowPlayingItem_itemIdentifier___block_invoke;
  v21[3] = &unk_1E3155590;
  v22 = v6;
  v23 = v8;
  v16 = v8;
  v17 = v6;
  -[MPMusicPlayerController onServer:](self, "onServer:", v21);
  v18 = os_log_create("com.apple.amp.mediaplayer", "SDKPlayback");
  v19 = v18;
  if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v18))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_193B9B000, v19, OS_SIGNPOST_INTERVAL_END, v12, "setNowPlayingItem", (const char *)&unk_193F291C9, buf, 2u);
  }

  v20 = os_log_create("com.apple.amp.mediaplayer", "SDKPlayback");
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134217984;
    v25 = v12;
    _os_log_impl(&dword_193B9B000, v20, OS_LOG_TYPE_DEBUG, "END [%lld]: setNowPlayingItem ", buf, 0xCu);
  }

}

- (void)_setNowPlayingItemWithIdentifier:(id)a3
{
  -[MPMusicPlayerController _setNowPlayingItem:itemIdentifier:](self, "_setNowPlayingItem:itemIdentifier:", 0, a3);
}

- (NSUInteger)indexOfNowPlayingItem
{
  void *v2;
  NSUInteger v3;

  -[MPMusicPlayerController _nowPlaying](self, "_nowPlaying");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "index");

  return v3;
}

- (void)setQueueWithQuery:(MPMediaQuery *)query
{
  -[MPMusicPlayerController setQueueWithQuery:firstItem:](self, "setQueueWithQuery:firstItem:", query, 0);
}

- (void)setQueueWithItemCollection:(MPMediaItemCollection *)itemCollection
{
  MPMediaItemCollection *v4;
  MPMusicPlayerMediaItemQueueDescriptor *v5;

  v4 = itemCollection;
  v5 = -[MPMusicPlayerMediaItemQueueDescriptor initWithItemCollection:]([MPMusicPlayerMediaItemQueueDescriptor alloc], "initWithItemCollection:", v4);

  -[MPMusicPlayerController setQueueWithDescriptor:](self, "setQueueWithDescriptor:", v5);
}

- (void)setQueueWithStoreIDs:(NSArray *)storeIDs
{
  NSArray *v4;
  MPMusicPlayerStoreQueueDescriptor *v5;

  v4 = storeIDs;
  v5 = -[MPMusicPlayerStoreQueueDescriptor initWithStoreIDs:]([MPMusicPlayerStoreQueueDescriptor alloc], "initWithStoreIDs:", v4);

  -[MPMusicPlayerController setQueueWithDescriptor:](self, "setQueueWithDescriptor:", v5);
}

- (void)setQueueWithDescriptor:(MPMusicPlayerQueueDescriptor *)descriptor
{
  MPMusicPlayerQueueDescriptor *v4;
  NSObject *v5;
  os_signpost_id_t v6;
  NSObject *v7;
  NSObject *v8;
  NSObject *v9;
  MPMusicPlayerQueueDescriptor *v10;
  MPMusicPlayerQueueDescriptor *targetQueueDescriptor;
  int64_t v12;
  int64_t v13;
  NSObject *v14;
  NSObject *v15;
  NSObject *v16;
  int v17;
  os_signpost_id_t v18;
  __int16 v19;
  MPMusicPlayerQueueDescriptor *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = descriptor;
  v5 = os_log_create("com.apple.amp.mediaplayer", "SDKPlayback");
  v6 = os_signpost_id_make_with_pointer(v5, v4);

  v7 = os_log_create("com.apple.amp.mediaplayer", "SDKPlayback");
  v8 = v7;
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    v17 = 138543362;
    v18 = (os_signpost_id_t)v4;
    _os_signpost_emit_with_name_impl(&dword_193B9B000, v8, OS_SIGNPOST_INTERVAL_BEGIN, v6, "setQueue", "descriptor=%{public}@", (uint8_t *)&v17, 0xCu);
  }

  v9 = os_log_create("com.apple.amp.mediaplayer", "SDKPlayback");
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    v17 = 134218242;
    v18 = v6;
    v19 = 2114;
    v20 = v4;
    _os_log_impl(&dword_193B9B000, v9, OS_LOG_TYPE_DEBUG, "BEGIN [%lld]: setQueue descriptor=%{public}@", (uint8_t *)&v17, 0x16u);
  }

  self->_isPreparedToPlay = 0;
  v10 = (MPMusicPlayerQueueDescriptor *)-[MPMusicPlayerQueueDescriptor copy](v4, "copy");
  targetQueueDescriptor = self->_targetQueueDescriptor;
  self->_targetQueueDescriptor = v10;

  if ((unint64_t)(self->_repeatMode - 1) >= 3)
    v12 = 3;
  else
    v12 = self->_repeatMode - 1;
  -[MPMusicPlayerQueueDescriptor setRepeatType:](self->_targetQueueDescriptor, "setRepeatType:", v12);
  if ((unint64_t)(self->_shuffleMode - 1) >= 3)
    v13 = 1000;
  else
    v13 = self->_shuffleMode - 1;
  -[MPMusicPlayerQueueDescriptor setShuffleType:](self->_targetQueueDescriptor, "setShuffleType:", v13);
  -[MPMusicPlayerQueueDescriptor setPrioritizeStartupOverQuality:](self->_targetQueueDescriptor, "setPrioritizeStartupOverQuality:", -[MPMusicPlayerController prioritizeStartupOverQuality](self, "prioritizeStartupOverQuality"));
  v14 = os_log_create("com.apple.amp.mediaplayer", "SDKPlayback");
  v15 = v14;
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v14))
  {
    LOWORD(v17) = 0;
    _os_signpost_emit_with_name_impl(&dword_193B9B000, v15, OS_SIGNPOST_INTERVAL_END, v6, "setQueue", (const char *)&unk_193F291C9, (uint8_t *)&v17, 2u);
  }

  v16 = os_log_create("com.apple.amp.mediaplayer", "SDKPlayback");
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
  {
    v17 = 134217984;
    v18 = v6;
    _os_log_impl(&dword_193B9B000, v16, OS_LOG_TYPE_DEBUG, "END [%lld]: setQueue ", (uint8_t *)&v17, 0xCu);
  }

}

- (void)prependQueueDescriptor:(MPMusicPlayerQueueDescriptor *)descriptor
{
  MPMusicPlayerQueueDescriptor *v4;
  _BOOL4 userQueueModificationsDisabled;
  NSObject *v6;
  NSObject *p_super;
  os_signpost_id_t v8;
  NSObject *v9;
  NSObject *v10;
  NSObject *v11;
  MPMusicPlayerControllerNowPlaying *serverNowPlaying;
  NSObject *v13;
  NSObject *v14;
  NSObject *v15;
  _QWORD v16[4];
  MPMusicPlayerQueueDescriptor *v17;
  uint8_t buf[4];
  MPMusicPlayerController *v19;
  __int16 v20;
  MPMusicPlayerQueueDescriptor *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = descriptor;
  userQueueModificationsDisabled = self->_userQueueModificationsDisabled;
  v6 = os_log_create("com.apple.amp.mediaplayer", "SDKPlayback");
  p_super = v6;
  if (userQueueModificationsDisabled)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134217984;
      v19 = self;
      _os_log_impl(&dword_193B9B000, p_super, OS_LOG_TYPE_ERROR, "[MPMusicPlayerController:%p] prependQueueDescriptor | ignoring prepend [userQueueModificationsDisabled]", buf, 0xCu);
    }
  }
  else
  {
    v8 = os_signpost_id_make_with_pointer(v6, v4);

    v9 = os_log_create("com.apple.amp.mediaplayer", "SDKPlayback");
    v10 = v9;
    if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
    {
      *(_DWORD *)buf = 138543362;
      v19 = (MPMusicPlayerController *)v4;
      _os_signpost_emit_with_name_impl(&dword_193B9B000, v10, OS_SIGNPOST_INTERVAL_BEGIN, v8, "prependQueueDescriptor", "descriptor=%{public}@", buf, 0xCu);
    }

    v11 = os_log_create("com.apple.amp.mediaplayer", "SDKPlayback");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134218242;
      v19 = (MPMusicPlayerController *)v8;
      v20 = 2114;
      v21 = v4;
      _os_log_impl(&dword_193B9B000, v11, OS_LOG_TYPE_DEBUG, "BEGIN [%lld]: prependQueueDescriptor descriptor=%{public}@", buf, 0x16u);
    }

    serverNowPlaying = self->_serverNowPlaying;
    self->_serverNowPlaying = 0;

    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __50__MPMusicPlayerController_prependQueueDescriptor___block_invoke;
    v16[3] = &unk_1E31555B8;
    v17 = v4;
    -[MPMusicPlayerController onServer:](self, "onServer:", v16);
    v13 = os_log_create("com.apple.amp.mediaplayer", "SDKPlayback");
    v14 = v13;
    if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_193B9B000, v14, OS_SIGNPOST_INTERVAL_END, v8, "prependQueueDescriptor", (const char *)&unk_193F291C9, buf, 2u);
    }

    v15 = os_log_create("com.apple.amp.mediaplayer", "SDKPlayback");
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134217984;
      v19 = (MPMusicPlayerController *)v8;
      _os_log_impl(&dword_193B9B000, v15, OS_LOG_TYPE_DEBUG, "END [%lld]: prependQueueDescriptor ", buf, 0xCu);
    }

    p_super = &v17->super;
  }

}

- (void)appendQueueDescriptor:(MPMusicPlayerQueueDescriptor *)descriptor
{
  MPMusicPlayerQueueDescriptor *v4;
  _BOOL4 userQueueModificationsDisabled;
  NSObject *v6;
  NSObject *p_super;
  os_signpost_id_t v8;
  NSObject *v9;
  NSObject *v10;
  NSObject *v11;
  MPMusicPlayerControllerNowPlaying *serverNowPlaying;
  NSObject *v13;
  NSObject *v14;
  NSObject *v15;
  _QWORD v16[4];
  MPMusicPlayerQueueDescriptor *v17;
  uint8_t buf[4];
  MPMusicPlayerController *v19;
  __int16 v20;
  MPMusicPlayerQueueDescriptor *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = descriptor;
  userQueueModificationsDisabled = self->_userQueueModificationsDisabled;
  v6 = os_log_create("com.apple.amp.mediaplayer", "SDKPlayback");
  p_super = v6;
  if (userQueueModificationsDisabled)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134217984;
      v19 = self;
      _os_log_impl(&dword_193B9B000, p_super, OS_LOG_TYPE_ERROR, "[MPMusicPlayerController:%p] appendQueueDescriptor | ignoring append [userQueueModificationsDisabled]", buf, 0xCu);
    }
  }
  else
  {
    v8 = os_signpost_id_make_with_pointer(v6, v4);

    v9 = os_log_create("com.apple.amp.mediaplayer", "SDKPlayback");
    v10 = v9;
    if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
    {
      *(_DWORD *)buf = 138543362;
      v19 = (MPMusicPlayerController *)v4;
      _os_signpost_emit_with_name_impl(&dword_193B9B000, v10, OS_SIGNPOST_INTERVAL_BEGIN, v8, "appendQueueDescriptor", "descriptor=%{public}@", buf, 0xCu);
    }

    v11 = os_log_create("com.apple.amp.mediaplayer", "SDKPlayback");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134218242;
      v19 = (MPMusicPlayerController *)v8;
      v20 = 2114;
      v21 = v4;
      _os_log_impl(&dword_193B9B000, v11, OS_LOG_TYPE_DEBUG, "BEGIN [%lld]: appendQueueDescriptor descriptor=%{public}@", buf, 0x16u);
    }

    serverNowPlaying = self->_serverNowPlaying;
    self->_serverNowPlaying = 0;

    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __49__MPMusicPlayerController_appendQueueDescriptor___block_invoke;
    v16[3] = &unk_1E31555B8;
    v17 = v4;
    -[MPMusicPlayerController onServer:](self, "onServer:", v16);
    v13 = os_log_create("com.apple.amp.mediaplayer", "SDKPlayback");
    v14 = v13;
    if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_193B9B000, v14, OS_SIGNPOST_INTERVAL_END, v8, "appendQueueDescriptor", (const char *)&unk_193F291C9, buf, 2u);
    }

    v15 = os_log_create("com.apple.amp.mediaplayer", "SDKPlayback");
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134217984;
      v19 = (MPMusicPlayerController *)v8;
      _os_log_impl(&dword_193B9B000, v15, OS_LOG_TYPE_DEBUG, "END [%lld]: appendQueueDescriptor ", buf, 0xCu);
    }

    p_super = &v17->super;
  }

}

- (void)prepareToPlayWithCompletionHandler:(id)a3 timeout:(double)a4
{
  void (**v6)(id, _QWORD);
  NSObject *v7;
  MPMusicPlayerQueueDescriptor *targetQueueDescriptor;
  NSObject *v9;
  NSObject *v10;
  os_signpost_id_t v11;
  NSObject *v12;
  NSObject *v13;
  NSObject *v14;
  MPMusicPlayerControllerNowPlaying *serverNowPlaying;
  MPMusicPlayerQueueDescriptor *serverQueueDescriptor;
  MPMusicPlayerQueueDescriptor *v17;
  uint64_t v18;
  MPMusicPlayerQueueDescriptor *v19;
  void *v20;
  _QWORD v21[5];
  void (**v22)(id, _QWORD);
  os_signpost_id_t v23;
  _QWORD v24[4];
  MPMusicPlayerQueueDescriptor *v25;
  MPMusicPlayerController *v26;
  void (**v27)(id, _QWORD);
  os_signpost_id_t v28;
  uint8_t buf[4];
  os_signpost_id_t v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v6 = (void (**)(id, _QWORD))a3;
  if (-[MPMusicPlayerController isPreparedToPlay](self, "isPreparedToPlay"))
  {
    v7 = os_log_create("com.apple.amp.mediaplayer", "SDKPlayback");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_193B9B000, v7, OS_LOG_TYPE_DEFAULT, "prepareToPlay short-circuit [already prepared to play]", buf, 2u);
    }

    v6[2](v6, 0);
  }
  else
  {
    targetQueueDescriptor = self->_targetQueueDescriptor;
    v9 = os_log_create("com.apple.amp.mediaplayer", "SDKPlayback");
    v10 = v9;
    if (targetQueueDescriptor)
    {
      v11 = os_signpost_id_generate(v9);

      v12 = os_log_create("com.apple.amp.mediaplayer", "SDKPlayback");
      v13 = v12;
      if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_193B9B000, v13, OS_SIGNPOST_INTERVAL_BEGIN, v11, "prepareToPlay:async", (const char *)&unk_193F291C9, buf, 2u);
      }

      v14 = os_log_create("com.apple.amp.mediaplayer", "SDKPlayback");
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 134217984;
        v30 = v11;
        _os_log_impl(&dword_193B9B000, v14, OS_LOG_TYPE_DEBUG, "BEGIN [%lld]: prepareToPlay:async ", buf, 0xCu);
      }

      serverNowPlaying = self->_serverNowPlaying;
      self->_serverNowPlaying = 0;

      serverQueueDescriptor = self->_serverQueueDescriptor;
      self->_serverQueueDescriptor = 0;

      v17 = self->_targetQueueDescriptor;
      -[MPMusicPlayerQueueDescriptor setDisableQueueModifications:](v17, "setDisableQueueModifications:", self->_userQueueModificationsDisabled);
      v18 = MEMORY[0x1E0C809B0];
      v24[0] = MEMORY[0x1E0C809B0];
      v24[1] = 3221225472;
      v24[2] = __70__MPMusicPlayerController_prepareToPlayWithCompletionHandler_timeout___block_invoke;
      v24[3] = &unk_1E3155608;
      v28 = v11;
      v25 = v17;
      v26 = self;
      v27 = v6;
      v21[0] = v18;
      v21[1] = 3221225472;
      v21[2] = __70__MPMusicPlayerController_prepareToPlayWithCompletionHandler_timeout___block_invoke_66;
      v21[3] = &unk_1E315C370;
      v23 = v11;
      v21[4] = self;
      v22 = v27;
      v19 = v17;
      -[MPMusicPlayerController onServerAsync:errorHandler:timeout:retryEnabled:](self, "onServerAsync:errorHandler:timeout:retryEnabled:", v24, v21, 1, a4);

    }
    else
    {
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_193B9B000, v10, OS_LOG_TYPE_ERROR, "prepareToPlay failed [no target descriptor]", buf, 2u);
      }

      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("MPMusicPlayerControllerErrorDomain"), 1, 0);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      ((void (**)(id, void *))v6)[2](v6, v20);

    }
  }

}

- (void)prepareToPlayWithCompletionHandler:(void *)completionHandler
{
  -[MPMusicPlayerController prepareToPlayWithCompletionHandler:timeout:](self, "prepareToPlayWithCompletionHandler:timeout:", completionHandler, 9.0);
}

- (void)skipToNextItem
{
  NSObject *v3;
  os_signpost_id_t v4;
  NSObject *v5;
  NSObject *v6;
  NSObject *v7;
  MPMusicPlayerControllerNowPlaying *serverNowPlaying;
  MPMusicPlayerControllerNowPlayingTimeSnapshot *serverTimeSnapshot;
  NSObject *v10;
  NSObject *v11;
  NSObject *v12;
  int v13;
  os_signpost_id_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = os_log_create("com.apple.amp.mediaplayer", "SDKPlayback");
  v4 = os_signpost_id_generate(v3);

  v5 = os_log_create("com.apple.amp.mediaplayer", "SDKPlayback");
  v6 = v5;
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    LOWORD(v13) = 0;
    _os_signpost_emit_with_name_impl(&dword_193B9B000, v6, OS_SIGNPOST_INTERVAL_BEGIN, v4, "skipToNextItem", (const char *)&unk_193F291C9, (uint8_t *)&v13, 2u);
  }

  v7 = os_log_create("com.apple.amp.mediaplayer", "SDKPlayback");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    v13 = 134217984;
    v14 = v4;
    _os_log_impl(&dword_193B9B000, v7, OS_LOG_TYPE_DEBUG, "BEGIN [%lld]: skipToNextItem ", (uint8_t *)&v13, 0xCu);
  }

  serverNowPlaying = self->_serverNowPlaying;
  self->_serverNowPlaying = 0;

  serverTimeSnapshot = self->_serverTimeSnapshot;
  self->_serverTimeSnapshot = 0;

  -[MPMusicPlayerController onServer:](self, "onServer:", &__block_literal_global_70);
  v10 = os_log_create("com.apple.amp.mediaplayer", "SDKPlayback");
  v11 = v10;
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    LOWORD(v13) = 0;
    _os_signpost_emit_with_name_impl(&dword_193B9B000, v11, OS_SIGNPOST_INTERVAL_END, v4, "skipToNextItem", (const char *)&unk_193F291C9, (uint8_t *)&v13, 2u);
  }

  v12 = os_log_create("com.apple.amp.mediaplayer", "SDKPlayback");
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    v13 = 134217984;
    v14 = v4;
    _os_log_impl(&dword_193B9B000, v12, OS_LOG_TYPE_DEBUG, "END [%lld]: skipToNextItem ", (uint8_t *)&v13, 0xCu);
  }

}

- (void)skipToBeginning
{
  NSObject *v3;
  os_signpost_id_t v4;
  NSObject *v5;
  NSObject *v6;
  NSObject *v7;
  MPMusicPlayerControllerNowPlayingTimeSnapshot *serverTimeSnapshot;
  NSObject *v9;
  NSObject *v10;
  NSObject *v11;
  int v12;
  os_signpost_id_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = os_log_create("com.apple.amp.mediaplayer", "SDKPlayback");
  v4 = os_signpost_id_generate(v3);

  v5 = os_log_create("com.apple.amp.mediaplayer", "SDKPlayback");
  v6 = v5;
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    LOWORD(v12) = 0;
    _os_signpost_emit_with_name_impl(&dword_193B9B000, v6, OS_SIGNPOST_INTERVAL_BEGIN, v4, "skipToBeginning", (const char *)&unk_193F291C9, (uint8_t *)&v12, 2u);
  }

  v7 = os_log_create("com.apple.amp.mediaplayer", "SDKPlayback");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    v12 = 134217984;
    v13 = v4;
    _os_log_impl(&dword_193B9B000, v7, OS_LOG_TYPE_DEBUG, "BEGIN [%lld]: skipToBeginning ", (uint8_t *)&v12, 0xCu);
  }

  serverTimeSnapshot = self->_serverTimeSnapshot;
  self->_serverTimeSnapshot = 0;

  -[MPMusicPlayerController onServer:](self, "onServer:", &__block_literal_global_71_12024);
  v9 = os_log_create("com.apple.amp.mediaplayer", "SDKPlayback");
  v10 = v9;
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    LOWORD(v12) = 0;
    _os_signpost_emit_with_name_impl(&dword_193B9B000, v10, OS_SIGNPOST_INTERVAL_END, v4, "skipToBeginning", (const char *)&unk_193F291C9, (uint8_t *)&v12, 2u);
  }

  v11 = os_log_create("com.apple.amp.mediaplayer", "SDKPlayback");
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    v12 = 134217984;
    v13 = v4;
    _os_log_impl(&dword_193B9B000, v11, OS_LOG_TYPE_DEBUG, "END [%lld]: skipToBeginning ", (uint8_t *)&v12, 0xCu);
  }

}

- (void)skipToPreviousItem
{
  NSObject *v3;
  os_signpost_id_t v4;
  NSObject *v5;
  NSObject *v6;
  NSObject *v7;
  MPMusicPlayerControllerNowPlaying *serverNowPlaying;
  MPMusicPlayerControllerNowPlayingTimeSnapshot *serverTimeSnapshot;
  NSObject *v10;
  NSObject *v11;
  NSObject *v12;
  int v13;
  os_signpost_id_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = os_log_create("com.apple.amp.mediaplayer", "SDKPlayback");
  v4 = os_signpost_id_generate(v3);

  v5 = os_log_create("com.apple.amp.mediaplayer", "SDKPlayback");
  v6 = v5;
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    LOWORD(v13) = 0;
    _os_signpost_emit_with_name_impl(&dword_193B9B000, v6, OS_SIGNPOST_INTERVAL_BEGIN, v4, "skipToPreviousItem", (const char *)&unk_193F291C9, (uint8_t *)&v13, 2u);
  }

  v7 = os_log_create("com.apple.amp.mediaplayer", "SDKPlayback");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    v13 = 134217984;
    v14 = v4;
    _os_log_impl(&dword_193B9B000, v7, OS_LOG_TYPE_DEBUG, "BEGIN [%lld]: skipToPreviousItem ", (uint8_t *)&v13, 0xCu);
  }

  serverNowPlaying = self->_serverNowPlaying;
  self->_serverNowPlaying = 0;

  serverTimeSnapshot = self->_serverTimeSnapshot;
  self->_serverTimeSnapshot = 0;

  -[MPMusicPlayerController onServer:](self, "onServer:", &__block_literal_global_72);
  v10 = os_log_create("com.apple.amp.mediaplayer", "SDKPlayback");
  v11 = v10;
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    LOWORD(v13) = 0;
    _os_signpost_emit_with_name_impl(&dword_193B9B000, v11, OS_SIGNPOST_INTERVAL_END, v4, "skipToPreviousItem", (const char *)&unk_193F291C9, (uint8_t *)&v13, 2u);
  }

  v12 = os_log_create("com.apple.amp.mediaplayer", "SDKPlayback");
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    v13 = 134217984;
    v14 = v4;
    _os_log_impl(&dword_193B9B000, v12, OS_LOG_TYPE_DEBUG, "END [%lld]: skipToPreviousItem ", (uint8_t *)&v13, 0xCu);
  }

}

- (void)beginGeneratingPlaybackNotifications
{
  ++self->_notificationsCounter;
}

- (void)endGeneratingPlaybackNotifications
{
  --self->_notificationsCounter;
}

- (void)setQueueWithQuery:(id)a3 firstItem:(id)a4
{
  id v6;
  MPMusicPlayerMediaItemQueueDescriptor *v7;
  id v8;

  v8 = a4;
  v6 = a3;
  v7 = -[MPMusicPlayerMediaItemQueueDescriptor initWithQuery:]([MPMusicPlayerMediaItemQueueDescriptor alloc], "initWithQuery:", v6);

  if (v8)
    -[MPMusicPlayerMediaItemQueueDescriptor setStartItem:](v7, "setStartItem:", v8);
  -[MPMusicPlayerController setQueueWithDescriptor:](self, "setQueueWithDescriptor:", v7);

}

- (void)setQueueWithRadioStation:(id)a3
{
  id v4;
  MPMusicPlayerRadioStationQueueDescriptor *v5;

  v4 = a3;
  v5 = -[MPMusicPlayerRadioStationQueueDescriptor initWithRadioStation:]([MPMusicPlayerRadioStationQueueDescriptor alloc], "initWithRadioStation:", v4);

  -[MPMusicPlayerController setQueueWithDescriptor:](self, "setQueueWithDescriptor:", v5);
}

- (id)queueAsQuery
{
  void *v2;
  void *v3;

  -[MPMusicPlayerController _queueDescriptor](self, "_queueDescriptor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v2, "query");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

- (id)queueAsRadioStation
{
  void *v2;
  MPRadioStation *v3;
  void *v4;
  void *v5;

  -[MPMusicPlayerController _queueDescriptor](self, "_queueDescriptor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v2, "radioStation");
    v3 = (MPRadioStation *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v2, "playParametersQueue");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "firstObject");
      v5 = (void *)objc_claimAutoreleasedReturnValue();

      v3 = -[MPRadioStation initWithPlayParameters:]([MPRadioStation alloc], "initWithPlayParameters:", v5);
    }
    else
    {
      v3 = 0;
    }
  }

  return v3;
}

- (id)nowPlayingAtIndex:(int64_t)a3
{
  NSObject *v5;
  os_signpost_id_t v6;
  NSObject *v7;
  NSObject *v8;
  NSObject *v9;
  NSObject *v10;
  NSObject *v11;
  NSObject *v12;
  id v13;
  _QWORD v15[6];
  uint8_t v16[4];
  os_signpost_id_t v17;
  _BYTE buf[24];
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v5 = os_log_create("com.apple.amp.mediaplayer", "SDKPlayback");
  v6 = os_signpost_id_generate(v5);

  v7 = os_log_create("com.apple.amp.mediaplayer", "SDKPlayback");
  v8 = v7;
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    *(_DWORD *)buf = 134217984;
    *(_QWORD *)&buf[4] = a3;
    _os_signpost_emit_with_name_impl(&dword_193B9B000, v8, OS_SIGNPOST_INTERVAL_BEGIN, v6, "nowPlayingAtIndex", "index=%lld", buf, 0xCu);
  }

  v9 = os_log_create("com.apple.amp.mediaplayer", "SDKPlayback");
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134218240;
    *(_QWORD *)&buf[4] = v6;
    *(_WORD *)&buf[12] = 2048;
    *(_QWORD *)&buf[14] = a3;
    _os_log_impl(&dword_193B9B000, v9, OS_LOG_TYPE_DEBUG, "BEGIN [%lld]: nowPlayingAtIndex index=%lld", buf, 0x16u);
  }

  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x3032000000;
  v19 = __Block_byref_object_copy__12018;
  v20 = __Block_byref_object_dispose__12019;
  v21 = 0;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __45__MPMusicPlayerController_nowPlayingAtIndex___block_invoke;
  v15[3] = &unk_1E3155568;
  v15[4] = buf;
  v15[5] = a3;
  -[MPMusicPlayerController onServer:](self, "onServer:", v15);
  v10 = os_log_create("com.apple.amp.mediaplayer", "SDKPlayback");
  v11 = v10;
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    *(_WORD *)v16 = 0;
    _os_signpost_emit_with_name_impl(&dword_193B9B000, v11, OS_SIGNPOST_INTERVAL_END, v6, "nowPlayingAtIndex", (const char *)&unk_193F291C9, v16, 2u);
  }

  v12 = os_log_create("com.apple.amp.mediaplayer", "SDKPlayback");
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)v16 = 134217984;
    v17 = v6;
    _os_log_impl(&dword_193B9B000, v12, OS_LOG_TYPE_DEBUG, "END [%lld]: nowPlayingAtIndex ", v16, 0xCu);
  }

  v13 = *(id *)(*(_QWORD *)&buf[8] + 40);
  _Block_object_dispose(buf, 8);

  return v13;
}

- (id)nowPlayingItemAtIndex:(unint64_t)a3
{
  void *v4;
  void *v5;

  -[MPMusicPlayerController nowPlayingAtIndex:](self, "nowPlayingAtIndex:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPMusicPlayerController _mediaItemFromNowPlaying:](self, "_mediaItemFromNowPlaying:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)shuffle
{
  NSObject *v3;
  os_signpost_id_t v4;
  NSObject *v5;
  NSObject *v6;
  NSObject *v7;
  MPMusicPlayerControllerNowPlaying *serverNowPlaying;
  MPMusicPlayerControllerNowPlayingTimeSnapshot *serverTimeSnapshot;
  NSObject *v10;
  NSObject *v11;
  NSObject *v12;
  int v13;
  os_signpost_id_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = os_log_create("com.apple.amp.mediaplayer", "SDKPlayback");
  v4 = os_signpost_id_generate(v3);

  v5 = os_log_create("com.apple.amp.mediaplayer", "SDKPlayback");
  v6 = v5;
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    LOWORD(v13) = 0;
    _os_signpost_emit_with_name_impl(&dword_193B9B000, v6, OS_SIGNPOST_INTERVAL_BEGIN, v4, "shuffle", (const char *)&unk_193F291C9, (uint8_t *)&v13, 2u);
  }

  v7 = os_log_create("com.apple.amp.mediaplayer", "SDKPlayback");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    v13 = 134217984;
    v14 = v4;
    _os_log_impl(&dword_193B9B000, v7, OS_LOG_TYPE_DEBUG, "BEGIN [%lld]: shuffle ", (uint8_t *)&v13, 0xCu);
  }

  serverNowPlaying = self->_serverNowPlaying;
  self->_serverNowPlaying = 0;

  serverTimeSnapshot = self->_serverTimeSnapshot;
  self->_serverTimeSnapshot = 0;

  -[MPMusicPlayerController onServer:](self, "onServer:", &__block_literal_global_77);
  v10 = os_log_create("com.apple.amp.mediaplayer", "SDKPlayback");
  v11 = v10;
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    LOWORD(v13) = 0;
    _os_signpost_emit_with_name_impl(&dword_193B9B000, v11, OS_SIGNPOST_INTERVAL_END, v4, "shuffle", (const char *)&unk_193F291C9, (uint8_t *)&v13, 2u);
  }

  v12 = os_log_create("com.apple.amp.mediaplayer", "SDKPlayback");
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    v13 = 134217984;
    v14 = v4;
    _os_log_impl(&dword_193B9B000, v12, OS_LOG_TYPE_DEBUG, "END [%lld]: shuffle ", (uint8_t *)&v13, 0xCu);
  }

}

- (void)pauseWithFadeoutDuration:(double)a3
{
  NSObject *v5;
  os_signpost_id_t v6;
  NSObject *v7;
  NSObject *v8;
  float v9;
  NSObject *v10;
  float v11;
  MPMusicPlayerControllerNowPlayingTimeSnapshot *serverTimeSnapshot;
  NSObject *v13;
  NSObject *v14;
  NSObject *v15;
  _QWORD v16[5];
  uint8_t buf[4];
  double v18;
  __int16 v19;
  double v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = os_log_create("com.apple.amp.mediaplayer", "SDKPlayback");
  v6 = os_signpost_id_generate(v5);

  v7 = os_log_create("com.apple.amp.mediaplayer", "SDKPlayback");
  v8 = v7;
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    v9 = a3;
    *(_DWORD *)buf = 134217984;
    v18 = v9;
    _os_signpost_emit_with_name_impl(&dword_193B9B000, v8, OS_SIGNPOST_INTERVAL_BEGIN, v6, "pauseWithFadeoutDuration", "duration=%f", buf, 0xCu);
  }

  v10 = os_log_create("com.apple.amp.mediaplayer", "SDKPlayback");
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    v11 = a3;
    *(_DWORD *)buf = 134218240;
    v18 = *(double *)&v6;
    v19 = 2048;
    v20 = v11;
    _os_log_impl(&dword_193B9B000, v10, OS_LOG_TYPE_DEBUG, "BEGIN [%lld]: pauseWithFadeoutDuration duration=%f", buf, 0x16u);
  }

  serverTimeSnapshot = self->_serverTimeSnapshot;
  self->_serverTimeSnapshot = 0;

  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __52__MPMusicPlayerController_pauseWithFadeoutDuration___block_invoke;
  v16[3] = &__block_descriptor_40_e41_v16__0___MPMusicPlayerControllerServer__8l;
  *(double *)&v16[4] = a3;
  -[MPMusicPlayerController onServer:](self, "onServer:", v16);
  v13 = os_log_create("com.apple.amp.mediaplayer", "SDKPlayback");
  v14 = v13;
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_193B9B000, v14, OS_SIGNPOST_INTERVAL_END, v6, "pauseWithFadeoutDuration", (const char *)&unk_193F291C9, buf, 2u);
  }

  v15 = os_log_create("com.apple.amp.mediaplayer", "SDKPlayback");
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134217984;
    v18 = *(double *)&v6;
    _os_log_impl(&dword_193B9B000, v15, OS_LOG_TYPE_DEBUG, "END [%lld]: pauseWithFadeoutDuration ", buf, 0xCu);
  }

}

- (void)skipToBeginningOrPreviousItem
{
  NSObject *v3;
  os_signpost_id_t v4;
  NSObject *v5;
  NSObject *v6;
  NSObject *v7;
  MPMusicPlayerControllerNowPlaying *serverNowPlaying;
  MPMusicPlayerControllerNowPlayingTimeSnapshot *serverTimeSnapshot;
  NSObject *v10;
  NSObject *v11;
  NSObject *v12;
  int v13;
  os_signpost_id_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = os_log_create("com.apple.amp.mediaplayer", "SDKPlayback");
  v4 = os_signpost_id_generate(v3);

  v5 = os_log_create("com.apple.amp.mediaplayer", "SDKPlayback");
  v6 = v5;
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    LOWORD(v13) = 0;
    _os_signpost_emit_with_name_impl(&dword_193B9B000, v6, OS_SIGNPOST_INTERVAL_BEGIN, v4, "skipToBeginningOrPreviousItem", (const char *)&unk_193F291C9, (uint8_t *)&v13, 2u);
  }

  v7 = os_log_create("com.apple.amp.mediaplayer", "SDKPlayback");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    v13 = 134217984;
    v14 = v4;
    _os_log_impl(&dword_193B9B000, v7, OS_LOG_TYPE_DEBUG, "BEGIN [%lld]: skipToBeginningOrPreviousItem ", (uint8_t *)&v13, 0xCu);
  }

  serverNowPlaying = self->_serverNowPlaying;
  self->_serverNowPlaying = 0;

  serverTimeSnapshot = self->_serverTimeSnapshot;
  self->_serverTimeSnapshot = 0;

  -[MPMusicPlayerController onServer:](self, "onServer:", &__block_literal_global_78);
  v10 = os_log_create("com.apple.amp.mediaplayer", "SDKPlayback");
  v11 = v10;
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    LOWORD(v13) = 0;
    _os_signpost_emit_with_name_impl(&dword_193B9B000, v11, OS_SIGNPOST_INTERVAL_END, v4, "skipToBeginningOrPreviousItem", (const char *)&unk_193F291C9, (uint8_t *)&v13, 2u);
  }

  v12 = os_log_create("com.apple.amp.mediaplayer", "SDKPlayback");
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    v13 = 134217984;
    v14 = v4;
    _os_log_impl(&dword_193B9B000, v12, OS_LOG_TYPE_DEBUG, "END [%lld]: skipToBeginningOrPreviousItem ", (uint8_t *)&v13, 0xCu);
  }

}

- (unint64_t)numberOfItems
{
  void *v2;
  unint64_t v3;

  -[MPMusicPlayerController _nowPlaying](self, "_nowPlaying");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count");

  return v3;
}

- (MPNowPlayingInfoAudioFormat)nowPlayingAudioFormat
{
  void *v2;
  void *v3;

  -[MPMusicPlayerController _nowPlaying](self, "_nowPlaying");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "audioFormat");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (MPNowPlayingInfoAudioFormat *)v3;
}

- (void)prepareToPlay
{
  NSObject *v3;
  const char *v4;
  NSObject *v5;
  os_log_type_t v6;
  MPMusicPlayerQueueDescriptor *targetQueueDescriptor;
  NSObject *v8;
  os_signpost_id_t v9;
  NSObject *v10;
  NSObject *v11;
  NSObject *v12;
  MPMusicPlayerControllerNowPlaying *serverNowPlaying;
  MPMusicPlayerControllerNowPlayingTimeSnapshot *serverTimeSnapshot;
  MPMusicPlayerQueueDescriptor *serverQueueDescriptor;
  MPMusicPlayerQueueDescriptor *v16;
  _QWORD v17[4];
  MPMusicPlayerQueueDescriptor *v18;
  MPMusicPlayerController *v19;
  os_signpost_id_t v20;
  uint8_t buf[4];
  os_signpost_id_t v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  if (-[MPMusicPlayerController isPreparedToPlay](self, "isPreparedToPlay"))
  {
    v3 = os_log_create("com.apple.amp.mediaplayer", "SDKPlayback");
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v4 = "prepareToPlay short-circuit [already prepared to play]";
      v5 = v3;
      v6 = OS_LOG_TYPE_DEFAULT;
LABEL_13:
      _os_log_impl(&dword_193B9B000, v5, v6, v4, buf, 2u);
    }
  }
  else
  {
    targetQueueDescriptor = self->_targetQueueDescriptor;
    v8 = os_log_create("com.apple.amp.mediaplayer", "SDKPlayback");
    v3 = v8;
    if (targetQueueDescriptor)
    {
      v9 = os_signpost_id_generate(v8);

      v10 = os_log_create("com.apple.amp.mediaplayer", "SDKPlayback");
      v11 = v10;
      if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_193B9B000, v11, OS_SIGNPOST_INTERVAL_BEGIN, v9, "prepareToPlay:sync", (const char *)&unk_193F291C9, buf, 2u);
      }

      v12 = os_log_create("com.apple.amp.mediaplayer", "SDKPlayback");
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 134217984;
        v22 = v9;
        _os_log_impl(&dword_193B9B000, v12, OS_LOG_TYPE_DEBUG, "BEGIN [%lld]: prepareToPlay:sync ", buf, 0xCu);
      }

      serverNowPlaying = self->_serverNowPlaying;
      self->_serverNowPlaying = 0;

      serverTimeSnapshot = self->_serverTimeSnapshot;
      self->_serverTimeSnapshot = 0;

      serverQueueDescriptor = self->_serverQueueDescriptor;
      self->_serverQueueDescriptor = 0;

      v16 = self->_targetQueueDescriptor;
      v17[0] = MEMORY[0x1E0C809B0];
      v17[1] = 3221225472;
      v17[2] = __40__MPMusicPlayerController_prepareToPlay__block_invoke;
      v17[3] = &unk_1E31556C0;
      v19 = self;
      v20 = v9;
      v18 = v16;
      v3 = v16;
      -[MPMusicPlayerController onServer:](self, "onServer:", v17);

    }
    else if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      v4 = "prepareToPlay failed [no target descriptor]";
      v5 = v3;
      v6 = OS_LOG_TYPE_ERROR;
      goto LABEL_13;
    }
  }

}

- (void)play
{
  NSObject *v3;
  os_signpost_id_t v4;
  NSObject *v5;
  NSObject *v6;
  NSObject *v7;
  MPMusicPlayerControllerNowPlayingTimeSnapshot *serverTimeSnapshot;
  NSObject *v9;
  NSObject *v10;
  NSObject *v11;
  int v12;
  os_signpost_id_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if (!-[MPMusicPlayerController isPreparedToPlay](self, "isPreparedToPlay"))
    -[MPMusicPlayerController prepareToPlay](self, "prepareToPlay");
  v3 = os_log_create("com.apple.amp.mediaplayer", "SDKPlayback");
  v4 = os_signpost_id_generate(v3);

  v5 = os_log_create("com.apple.amp.mediaplayer", "SDKPlayback");
  v6 = v5;
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    LOWORD(v12) = 0;
    _os_signpost_emit_with_name_impl(&dword_193B9B000, v6, OS_SIGNPOST_INTERVAL_BEGIN, v4, "play", (const char *)&unk_193F291C9, (uint8_t *)&v12, 2u);
  }

  v7 = os_log_create("com.apple.amp.mediaplayer", "SDKPlayback");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    v12 = 134217984;
    v13 = v4;
    _os_log_impl(&dword_193B9B000, v7, OS_LOG_TYPE_DEBUG, "BEGIN [%lld]: play ", (uint8_t *)&v12, 0xCu);
  }

  serverTimeSnapshot = self->_serverTimeSnapshot;
  self->_serverTimeSnapshot = 0;

  -[MPMusicPlayerController onServer:](self, "onServer:", &__block_literal_global_79_12016);
  v9 = os_log_create("com.apple.amp.mediaplayer", "SDKPlayback");
  v10 = v9;
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    LOWORD(v12) = 0;
    _os_signpost_emit_with_name_impl(&dword_193B9B000, v10, OS_SIGNPOST_INTERVAL_END, v4, "play", (const char *)&unk_193F291C9, (uint8_t *)&v12, 2u);
  }

  v11 = os_log_create("com.apple.amp.mediaplayer", "SDKPlayback");
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    v12 = 134217984;
    v13 = v4;
    _os_log_impl(&dword_193B9B000, v11, OS_LOG_TYPE_DEBUG, "END [%lld]: play ", (uint8_t *)&v12, 0xCu);
  }

}

- (void)pause
{
  NSObject *v3;
  os_signpost_id_t v4;
  NSObject *v5;
  NSObject *v6;
  NSObject *v7;
  MPMusicPlayerControllerNowPlayingTimeSnapshot *serverTimeSnapshot;
  NSObject *v9;
  NSObject *v10;
  NSObject *v11;
  int v12;
  os_signpost_id_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = os_log_create("com.apple.amp.mediaplayer", "SDKPlayback");
  v4 = os_signpost_id_generate(v3);

  v5 = os_log_create("com.apple.amp.mediaplayer", "SDKPlayback");
  v6 = v5;
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    LOWORD(v12) = 0;
    _os_signpost_emit_with_name_impl(&dword_193B9B000, v6, OS_SIGNPOST_INTERVAL_BEGIN, v4, "pause", (const char *)&unk_193F291C9, (uint8_t *)&v12, 2u);
  }

  v7 = os_log_create("com.apple.amp.mediaplayer", "SDKPlayback");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    v12 = 134217984;
    v13 = v4;
    _os_log_impl(&dword_193B9B000, v7, OS_LOG_TYPE_DEBUG, "BEGIN [%lld]: pause ", (uint8_t *)&v12, 0xCu);
  }

  serverTimeSnapshot = self->_serverTimeSnapshot;
  self->_serverTimeSnapshot = 0;

  -[MPMusicPlayerController onServer:](self, "onServer:", &__block_literal_global_80_12015);
  v9 = os_log_create("com.apple.amp.mediaplayer", "SDKPlayback");
  v10 = v9;
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    LOWORD(v12) = 0;
    _os_signpost_emit_with_name_impl(&dword_193B9B000, v10, OS_SIGNPOST_INTERVAL_END, v4, "pause", (const char *)&unk_193F291C9, (uint8_t *)&v12, 2u);
  }

  v11 = os_log_create("com.apple.amp.mediaplayer", "SDKPlayback");
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    v12 = 134217984;
    v13 = v4;
    _os_log_impl(&dword_193B9B000, v11, OS_LOG_TYPE_DEBUG, "END [%lld]: pause ", (uint8_t *)&v12, 0xCu);
  }

}

- (void)stop
{
  NSObject *v3;
  os_signpost_id_t v4;
  NSObject *v5;
  NSObject *v6;
  NSObject *v7;
  MPMusicPlayerControllerNowPlayingTimeSnapshot *serverTimeSnapshot;
  NSObject *v9;
  NSObject *v10;
  NSObject *v11;
  int v12;
  os_signpost_id_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = os_log_create("com.apple.amp.mediaplayer", "SDKPlayback");
  v4 = os_signpost_id_generate(v3);

  v5 = os_log_create("com.apple.amp.mediaplayer", "SDKPlayback");
  v6 = v5;
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    LOWORD(v12) = 0;
    _os_signpost_emit_with_name_impl(&dword_193B9B000, v6, OS_SIGNPOST_INTERVAL_BEGIN, v4, "stop", (const char *)&unk_193F291C9, (uint8_t *)&v12, 2u);
  }

  v7 = os_log_create("com.apple.amp.mediaplayer", "SDKPlayback");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    v12 = 134217984;
    v13 = v4;
    _os_log_impl(&dword_193B9B000, v7, OS_LOG_TYPE_DEBUG, "BEGIN [%lld]: stop ", (uint8_t *)&v12, 0xCu);
  }

  serverTimeSnapshot = self->_serverTimeSnapshot;
  self->_serverTimeSnapshot = 0;

  -[MPMusicPlayerController onServer:](self, "onServer:", &__block_literal_global_81);
  v9 = os_log_create("com.apple.amp.mediaplayer", "SDKPlayback");
  v10 = v9;
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    LOWORD(v12) = 0;
    _os_signpost_emit_with_name_impl(&dword_193B9B000, v10, OS_SIGNPOST_INTERVAL_END, v4, "stop", (const char *)&unk_193F291C9, (uint8_t *)&v12, 2u);
  }

  v11 = os_log_create("com.apple.amp.mediaplayer", "SDKPlayback");
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    v12 = 134217984;
    v13 = v4;
    _os_log_impl(&dword_193B9B000, v11, OS_LOG_TYPE_DEBUG, "END [%lld]: stop ", (uint8_t *)&v12, 0xCu);
  }

}

- (double)currentPlaybackTime
{
  void *v2;
  double v3;
  double v4;

  -[MPMusicPlayerController _snapshot](self, "_snapshot");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "currentTime");
  v4 = v3;

  return v4;
}

- (void)setCurrentPlaybackTime:(double)a3
{
  NSObject *v5;
  os_signpost_id_t v6;
  NSObject *v7;
  NSObject *v8;
  NSObject *v9;
  MPMusicPlayerControllerNowPlayingTimeSnapshot *serverTimeSnapshot;
  _QWORD v11[6];
  uint8_t buf[4];
  double v13;
  __int16 v14;
  double v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v5 = os_log_create("com.apple.amp.mediaplayer", "SDKPlayback");
  v6 = os_signpost_id_generate(v5);

  v7 = os_log_create("com.apple.amp.mediaplayer", "SDKPlayback");
  v8 = v7;
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    *(_DWORD *)buf = 134217984;
    v13 = a3;
    _os_signpost_emit_with_name_impl(&dword_193B9B000, v8, OS_SIGNPOST_INTERVAL_BEGIN, v6, "setCurrentPlaybackTime", "time=%g", buf, 0xCu);
  }

  v9 = os_log_create("com.apple.amp.mediaplayer", "SDKPlayback");
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134218240;
    v13 = *(double *)&v6;
    v14 = 2048;
    v15 = a3;
    _os_log_impl(&dword_193B9B000, v9, OS_LOG_TYPE_DEBUG, "BEGIN [%lld]: setCurrentPlaybackTime time=%g", buf, 0x16u);
  }

  serverTimeSnapshot = self->_serverTimeSnapshot;
  self->_serverTimeSnapshot = 0;

  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __50__MPMusicPlayerController_setCurrentPlaybackTime___block_invoke;
  v11[3] = &__block_descriptor_48_e41_v16__0___MPMusicPlayerControllerServer__8l;
  *(double *)&v11[4] = a3;
  v11[5] = v6;
  -[MPMusicPlayerController onServer:](self, "onServer:", v11);
}

- (float)currentPlaybackRate
{
  void *v2;
  float v3;
  float v4;

  -[MPMusicPlayerController _snapshot](self, "_snapshot");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "rate");
  v4 = v3;

  return v4;
}

- (void)setCurrentPlaybackRate:(float)a3
{
  NSObject *v5;
  os_signpost_id_t v6;
  NSObject *v7;
  NSObject *v8;
  NSObject *v9;
  MPMusicPlayerControllerNowPlayingTimeSnapshot *serverTimeSnapshot;
  _QWORD v11[5];
  float v12;
  uint8_t buf[4];
  double v14;
  __int16 v15;
  double v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = os_log_create("com.apple.amp.mediaplayer", "SDKPlayback");
  *(double *)&v6 = COERCE_DOUBLE(os_signpost_id_generate(v5));

  v7 = os_log_create("com.apple.amp.mediaplayer", "SDKPlayback");
  v8 = v7;
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    *(_DWORD *)buf = 134217984;
    v14 = a3;
    _os_signpost_emit_with_name_impl(&dword_193B9B000, v8, OS_SIGNPOST_INTERVAL_BEGIN, v6, "setCurrentPlaybackRate", "rate=%g", buf, 0xCu);
  }

  v9 = os_log_create("com.apple.amp.mediaplayer", "SDKPlayback");
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134218240;
    v14 = *(double *)&v6;
    v15 = 2048;
    v16 = a3;
    _os_log_impl(&dword_193B9B000, v9, OS_LOG_TYPE_DEBUG, "BEGIN [%lld]: setCurrentPlaybackRate rate=%g", buf, 0x16u);
  }

  serverTimeSnapshot = self->_serverTimeSnapshot;
  self->_serverTimeSnapshot = 0;

  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __50__MPMusicPlayerController_setCurrentPlaybackRate___block_invoke;
  v11[3] = &__block_descriptor_44_e41_v16__0___MPMusicPlayerControllerServer__8l;
  v12 = a3;
  v11[4] = v6;
  -[MPMusicPlayerController onServer:](self, "onServer:", v11);
}

- (void)beginSeekingForward
{
  NSObject *v3;
  os_signpost_id_t v4;
  NSObject *v5;
  NSObject *v6;
  NSObject *v7;
  MPMusicPlayerControllerNowPlayingTimeSnapshot *serverTimeSnapshot;
  NSObject *v9;
  NSObject *v10;
  NSObject *v11;
  int v12;
  os_signpost_id_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = os_log_create("com.apple.amp.mediaplayer", "SDKPlayback");
  v4 = os_signpost_id_generate(v3);

  v5 = os_log_create("com.apple.amp.mediaplayer", "SDKPlayback");
  v6 = v5;
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    LOWORD(v12) = 0;
    _os_signpost_emit_with_name_impl(&dword_193B9B000, v6, OS_SIGNPOST_INTERVAL_BEGIN, v4, "beginSeekingForward", (const char *)&unk_193F291C9, (uint8_t *)&v12, 2u);
  }

  v7 = os_log_create("com.apple.amp.mediaplayer", "SDKPlayback");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    v12 = 134217984;
    v13 = v4;
    _os_log_impl(&dword_193B9B000, v7, OS_LOG_TYPE_DEBUG, "BEGIN [%lld]: beginSeekingForward ", (uint8_t *)&v12, 0xCu);
  }

  serverTimeSnapshot = self->_serverTimeSnapshot;
  self->_serverTimeSnapshot = 0;

  -[MPMusicPlayerController onServer:](self, "onServer:", &__block_literal_global_85);
  v9 = os_log_create("com.apple.amp.mediaplayer", "SDKPlayback");
  v10 = v9;
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    LOWORD(v12) = 0;
    _os_signpost_emit_with_name_impl(&dword_193B9B000, v10, OS_SIGNPOST_INTERVAL_END, v4, "beginSeekingForward", (const char *)&unk_193F291C9, (uint8_t *)&v12, 2u);
  }

  v11 = os_log_create("com.apple.amp.mediaplayer", "SDKPlayback");
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    v12 = 134217984;
    v13 = v4;
    _os_log_impl(&dword_193B9B000, v11, OS_LOG_TYPE_DEBUG, "END [%lld]: beginSeekingForward ", (uint8_t *)&v12, 0xCu);
  }

}

- (void)beginSeekingBackward
{
  NSObject *v3;
  os_signpost_id_t v4;
  NSObject *v5;
  NSObject *v6;
  NSObject *v7;
  MPMusicPlayerControllerNowPlayingTimeSnapshot *serverTimeSnapshot;
  NSObject *v9;
  NSObject *v10;
  NSObject *v11;
  int v12;
  os_signpost_id_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = os_log_create("com.apple.amp.mediaplayer", "SDKPlayback");
  v4 = os_signpost_id_generate(v3);

  v5 = os_log_create("com.apple.amp.mediaplayer", "SDKPlayback");
  v6 = v5;
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    LOWORD(v12) = 0;
    _os_signpost_emit_with_name_impl(&dword_193B9B000, v6, OS_SIGNPOST_INTERVAL_BEGIN, v4, "beginSeekingBackward", (const char *)&unk_193F291C9, (uint8_t *)&v12, 2u);
  }

  v7 = os_log_create("com.apple.amp.mediaplayer", "SDKPlayback");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    v12 = 134217984;
    v13 = v4;
    _os_log_impl(&dword_193B9B000, v7, OS_LOG_TYPE_DEBUG, "BEGIN [%lld]: beginSeekingBackward ", (uint8_t *)&v12, 0xCu);
  }

  serverTimeSnapshot = self->_serverTimeSnapshot;
  self->_serverTimeSnapshot = 0;

  -[MPMusicPlayerController onServer:](self, "onServer:", &__block_literal_global_86);
  v9 = os_log_create("com.apple.amp.mediaplayer", "SDKPlayback");
  v10 = v9;
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    LOWORD(v12) = 0;
    _os_signpost_emit_with_name_impl(&dword_193B9B000, v10, OS_SIGNPOST_INTERVAL_END, v4, "beginSeekingBackward", (const char *)&unk_193F291C9, (uint8_t *)&v12, 2u);
  }

  v11 = os_log_create("com.apple.amp.mediaplayer", "SDKPlayback");
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    v12 = 134217984;
    v13 = v4;
    _os_log_impl(&dword_193B9B000, v11, OS_LOG_TYPE_DEBUG, "END [%lld]: beginSeekingBackward ", (uint8_t *)&v12, 0xCu);
  }

}

- (void)endSeeking
{
  NSObject *v3;
  os_signpost_id_t v4;
  NSObject *v5;
  NSObject *v6;
  NSObject *v7;
  MPMusicPlayerControllerNowPlayingTimeSnapshot *serverTimeSnapshot;
  NSObject *v9;
  NSObject *v10;
  NSObject *v11;
  int v12;
  os_signpost_id_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = os_log_create("com.apple.amp.mediaplayer", "SDKPlayback");
  v4 = os_signpost_id_generate(v3);

  v5 = os_log_create("com.apple.amp.mediaplayer", "SDKPlayback");
  v6 = v5;
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    LOWORD(v12) = 0;
    _os_signpost_emit_with_name_impl(&dword_193B9B000, v6, OS_SIGNPOST_INTERVAL_BEGIN, v4, "endSeeking", (const char *)&unk_193F291C9, (uint8_t *)&v12, 2u);
  }

  v7 = os_log_create("com.apple.amp.mediaplayer", "SDKPlayback");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    v12 = 134217984;
    v13 = v4;
    _os_log_impl(&dword_193B9B000, v7, OS_LOG_TYPE_DEBUG, "BEGIN [%lld]: endSeeking ", (uint8_t *)&v12, 0xCu);
  }

  serverTimeSnapshot = self->_serverTimeSnapshot;
  self->_serverTimeSnapshot = 0;

  -[MPMusicPlayerController onServer:](self, "onServer:", &__block_literal_global_87);
  v9 = os_log_create("com.apple.amp.mediaplayer", "SDKPlayback");
  v10 = v9;
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    LOWORD(v12) = 0;
    _os_signpost_emit_with_name_impl(&dword_193B9B000, v10, OS_SIGNPOST_INTERVAL_END, v4, "endSeeking", (const char *)&unk_193F291C9, (uint8_t *)&v12, 2u);
  }

  v11 = os_log_create("com.apple.amp.mediaplayer", "SDKPlayback");
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    v12 = 134217984;
    v13 = v4;
    _os_log_impl(&dword_193B9B000, v11, OS_LOG_TYPE_DEBUG, "END [%lld]: endSeeking ", (uint8_t *)&v12, 0xCu);
  }

}

- (float)volume
{
  float result;

  -[MPVolumeController volumeValue](self->_volumeController, "volumeValue");
  return result;
}

- (void)setVolume:(float)volume
{
  -[MPVolumeController setVolumeValue:](self->_volumeController, "setVolumeValue:");
}

- (int64_t)playbackSpeed
{
  return 0;
}

- (BOOL)isNowPlayingItemFromGeniusMix
{
  return 0;
}

- (unint64_t)currentChapterIndex
{
  return 0;
}

- (BOOL)isGeniusAvailable
{
  return 0;
}

- (BOOL)isGeniusAvailableForSeedItems:(id)a3
{
  return 0;
}

- (BOOL)setQueueWithSeedItems:(id)a3
{
  return 0;
}

- (void)applyServerStateUpdateRecord:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __56__MPMusicPlayerController_applyServerStateUpdateRecord___block_invoke;
  v7[3] = &unk_1E31635F8;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

- (void)_onQueue_applyServerStateUpdateRecord:(id)a3
{
  id v4;
  MPMusicPlayerQueueDescriptor *v5;
  MPMusicPlayerQueueDescriptor *serverQueueDescriptor;
  int v7;
  void *v8;
  int v9;
  MPMusicPlayerControllerNowPlayingTimeSnapshot *v10;
  MPMusicPlayerControllerNowPlayingTimeSnapshot *lastServerTimeSnapshot;
  uint64_t v12;
  float v13;
  float v14;
  float v15;
  float v16;
  BOOL v17;
  float v18;
  void *v19;
  MPMusicPlayerControllerNowPlayingTimeSnapshot *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  id v27;
  int v28;
  char v29;
  void *v30;
  id v31;
  id v32;
  void *v33;
  char v34;
  void *v35;
  void *v36;
  NSObject *v37;
  uint8_t v38[16];

  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (objc_msgSend(v4, "hasQueueDescriptor"))
  {
    objc_msgSend(v4, "queueDescriptor");
    v5 = (MPMusicPlayerQueueDescriptor *)objc_claimAutoreleasedReturnValue();
    serverQueueDescriptor = self->_serverQueueDescriptor;
    self->_serverQueueDescriptor = v5;

  }
  v7 = objc_msgSend(v4, "hasNowPlaying");
  if (v7)
  {
    objc_msgSend(v4, "nowPlaying");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeStrong((id *)&self->_serverNowPlaying, v8);
    if (self->_isPreparedToPlay || self->_targetQueueDescriptor || !self->_serverNowPlaying)
    {
      v9 = 0;
    }
    else
    {
      self->_isPreparedToPlay = 1;
      v37 = os_log_create("com.apple.amp.mediaplayer", "SDKPlayback");
      if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v38 = 0;
        _os_log_impl(&dword_193B9B000, v37, OS_LOG_TYPE_DEFAULT, "applyServerStateUpdateRecord marking player as prepared to play because we have a valid server now playing object.", v38, 2u);
      }

      v9 = 1;
    }
  }
  else
  {
    v9 = 0;
    v8 = 0;
  }
  if (objc_msgSend(v4, "hasTimeSnapshot"))
  {
    objc_msgSend(v4, "timeSnapshot");
    v10 = (MPMusicPlayerControllerNowPlayingTimeSnapshot *)objc_claimAutoreleasedReturnValue();
    objc_storeStrong((id *)&self->_serverTimeSnapshot, v10);
    lastServerTimeSnapshot = self->_lastServerTimeSnapshot;
    if (lastServerTimeSnapshot)
    {
      v12 = -[MPMusicPlayerControllerNowPlayingTimeSnapshot state](lastServerTimeSnapshot, "state");
      if (v12 == -[MPMusicPlayerControllerNowPlayingTimeSnapshot state](v10, "state"))
      {
        -[MPMusicPlayerControllerNowPlayingTimeSnapshot rate](self->_lastServerTimeSnapshot, "rate");
        v14 = v13;
        -[MPMusicPlayerControllerNowPlayingTimeSnapshot rate](v10, "rate");
        v16 = v15;
        v17 = v14 != v15;
        if (-[MPMusicPlayerControllerNowPlayingTimeSnapshot state](v10, "state") != 1)
        {
          if (v14 == v16)
            goto LABEL_19;
          goto LABEL_18;
        }
        goto LABEL_16;
      }
      if (-[MPMusicPlayerControllerNowPlayingTimeSnapshot state](v10, "state") == 1)
      {
        v17 = 1;
LABEL_16:
        -[MPMusicPlayerControllerNowPlayingTimeSnapshot rate](v10, "rate");
        if (v18 == 0.0 || !v17)
          goto LABEL_19;
      }
    }
LABEL_18:
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "postNotificationName:object:", CFSTR("MPMusicPlayerControllerPlaybackStateDidChangeNotification"), self);

LABEL_19:
    v20 = self->_lastServerTimeSnapshot;
    self->_lastServerTimeSnapshot = v10;

  }
  if ((objc_msgSend(v4, "hasRepeatMode") & 1) != 0 || objc_msgSend(v4, "hasShuffleMode"))
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "postNotificationName:object:", CFSTR("MPMusicPlayerControllerPlaybackStateDidChangeNotification"), self);

  }
  if (objc_msgSend(v4, "hasContentItemIDs"))
  {
    objc_msgSend(v4, "contentItemIDs");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[MPMusicPlayerController _postPrivateQueueDidChangeNotificationWithContentItemIDs:](self, "_postPrivateQueueDidChangeNotificationWithContentItemIDs:", v22);

  }
  if (objc_msgSend(v4, "queueDidChange"))
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "postNotificationName:object:", CFSTR("MPMusicPlayerControllerQueueDidChangeNotification"), self);

  }
  if (objc_msgSend(v4, "itemDidEnd"))
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "postNotificationName:object:", CFSTR("MPMusicPlayerControllerItemPlaybackDidEndNotification"), self);

  }
  if (objc_msgSend(v4, "queueDidEnd"))
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "postNotificationName:object:", CFSTR("_MPMusicPlayerControllerQueueDidEndNotification"), self);

  }
  if (v7)
  {
    -[MPMusicPlayerControllerNowPlaying itemIdentifier](self->_lastServerNowPlaying, "itemIdentifier");
    v26 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "itemIdentifier");
    v27 = (id)objc_claimAutoreleasedReturnValue();
    if (v26 == v27)
    {

    }
    else
    {
      v28 = objc_msgSend(v26, "isEqual:", v27);

      if (!v28)
      {

LABEL_37:
        objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "postNotificationName:object:", CFSTR("MPMusicPlayerControllerNowPlayingItemDidChangeNotification"), self);

LABEL_38:
        -[MPMusicPlayerControllerNowPlaying artworkIdentifier](self->_lastServerNowPlaying, "artworkIdentifier");
        v31 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "artworkIdentifier");
        v32 = (id)objc_claimAutoreleasedReturnValue();
        if (v31 == v32)
        {

        }
        else
        {
          v33 = v32;
          v34 = objc_msgSend(v31, "isEqual:", v32);

          if ((v34 & 1) != 0)
          {
LABEL_43:
            objc_storeStrong((id *)&self->_lastServerNowPlaying, v8);
            goto LABEL_44;
          }
          objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
          v31 = (id)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v31, "postNotificationName:object:", CFSTR("_MPMusicPlayerControllerArtworkDidChangeNotification"), self);
        }

        goto LABEL_43;
      }
    }
    v29 = objc_msgSend(v4, "hasTimeMetadata");

    if ((v29 & 1) == 0)
      goto LABEL_38;
    goto LABEL_37;
  }
LABEL_44:
  if (objc_msgSend(v4, "audioFormatDidChange"))
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "postNotificationName:object:", CFSTR("MPMusicPlayerControllerPlaybackStateDidChangeNotification"), self);

  }
  if (v9)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "postNotificationName:object:", CFSTR("MPMediaPlaybackIsPreparedToPlayDidChangeNotification"), self);

  }
}

- (void)setServerQueueDescriptor:(id)a3
{
  id v4;
  MPMusicPlayerServerStateUpdateRecord *v5;

  v4 = a3;
  v5 = objc_alloc_init(MPMusicPlayerServerStateUpdateRecord);
  -[MPMusicPlayerServerStateUpdateRecord setHasQueueDescriptor:](v5, "setHasQueueDescriptor:", 1);
  -[MPMusicPlayerServerStateUpdateRecord setQueueDescriptor:](v5, "setQueueDescriptor:", v4);

  -[MPMusicPlayerServerStateUpdateRecord setQueueDidChange:](v5, "setQueueDidChange:", 1);
  -[MPMusicPlayerController applyServerStateUpdateRecord:](self, "applyServerStateUpdateRecord:", v5);

}

- (void)setServerNowPlaying:(id)a3
{
  id v4;
  MPMusicPlayerServerStateUpdateRecord *v5;

  v4 = a3;
  v5 = objc_alloc_init(MPMusicPlayerServerStateUpdateRecord);
  -[MPMusicPlayerServerStateUpdateRecord setHasNowPlaying:](v5, "setHasNowPlaying:", 1);
  -[MPMusicPlayerServerStateUpdateRecord setNowPlaying:](v5, "setNowPlaying:", v4);

  -[MPMusicPlayerController applyServerStateUpdateRecord:](self, "applyServerStateUpdateRecord:", v5);
}

- (void)setServerTimeSnapshot:(id)a3
{
  id v4;
  MPMusicPlayerServerStateUpdateRecord *v5;

  v4 = a3;
  v5 = objc_alloc_init(MPMusicPlayerServerStateUpdateRecord);
  -[MPMusicPlayerServerStateUpdateRecord setHasTimeSnapshot:](v5, "setHasTimeSnapshot:", 1);
  -[MPMusicPlayerServerStateUpdateRecord setTimeSnapshot:](v5, "setTimeSnapshot:", v4);

  -[MPMusicPlayerController applyServerStateUpdateRecord:](self, "applyServerStateUpdateRecord:", v5);
}

- (void)serverPlaybackModeDidChangeAffectingQueue:(BOOL)a3
{
  _BOOL8 v3;
  MPMusicPlayerServerStateUpdateRecord *v5;

  v3 = a3;
  v5 = objc_alloc_init(MPMusicPlayerServerStateUpdateRecord);
  -[MPMusicPlayerServerStateUpdateRecord setHasRepeatMode:](v5, "setHasRepeatMode:", 1);
  -[MPMusicPlayerServerStateUpdateRecord setQueueDidChange:](v5, "setQueueDidChange:", v3);
  -[MPMusicPlayerController applyServerStateUpdateRecord:](self, "applyServerStateUpdateRecord:", v5);

}

- (void)serverItemDidEnd
{
  MPMusicPlayerServerStateUpdateRecord *v3;

  v3 = objc_alloc_init(MPMusicPlayerServerStateUpdateRecord);
  -[MPMusicPlayerServerStateUpdateRecord setItemDidEnd:](v3, "setItemDidEnd:", 1);
  -[MPMusicPlayerController applyServerStateUpdateRecord:](self, "applyServerStateUpdateRecord:", v3);

}

- (void)serverQueueDidEnd
{
  MPMusicPlayerServerStateUpdateRecord *v3;

  v3 = objc_alloc_init(MPMusicPlayerServerStateUpdateRecord);
  -[MPMusicPlayerServerStateUpdateRecord setQueueDidEnd:](v3, "setQueueDidEnd:", 1);
  -[MPMusicPlayerController applyServerStateUpdateRecord:](self, "applyServerStateUpdateRecord:", v3);

}

- (BOOL)areRepresentationsAvailableForCatalog:(id)a3
{
  void *v3;
  void *v4;
  BOOL v5;

  objc_msgSend(a3, "token");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "artworkIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4 != 0;

  return v5;
}

- (id)existingRepresentationForArtworkCatalog:(id)a3
{
  return 0;
}

- (BOOL)isRepresentation:(id)a3 bestRepresentationForArtworkCatalog:(id)a4
{
  return 1;
}

- (void)loadRepresentationForArtworkCatalog:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  id v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;
  id v18;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "token");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = MEMORY[0x1E0C809B0];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __81__MPMusicPlayerController_loadRepresentationForArtworkCatalog_completionHandler___block_invoke;
  v15[3] = &unk_1E31557B0;
  v16 = v8;
  v17 = v6;
  v18 = v7;
  v13[0] = v9;
  v13[1] = 3221225472;
  v13[2] = __81__MPMusicPlayerController_loadRepresentationForArtworkCatalog_completionHandler___block_invoke_3;
  v13[3] = &unk_1E31624C0;
  v14 = v18;
  v10 = v18;
  v11 = v6;
  v12 = v8;
  -[MPMusicPlayerController onServerAsync:errorHandler:timeout:retryEnabled:](self, "onServerAsync:errorHandler:timeout:retryEnabled:", v15, v13, 0, 4.0);

}

- (id)visualIdenticalityIdentifierForCatalog:(id)a3
{
  void *v3;
  void *v4;

  objc_msgSend(a3, "token");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "artworkIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)volumeController:(id)a3 volumeValueDidChange:(float)a4
{
  NSObject *v5;
  _QWORD block[5];

  -[MPMusicPlayerController queue](self, "queue", a3);
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __65__MPMusicPlayerController_volumeController_volumeValueDidChange___block_invoke;
  block[3] = &unk_1E3163508;
  block[4] = self;
  dispatch_async(v5, block);

}

- (void)volumeController:(id)a3 mutedStateDidChange:(BOOL)a4
{
  NSObject *v5;
  _QWORD block[5];

  -[MPMusicPlayerController queue](self, "queue", a3, a4);
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __64__MPMusicPlayerController_volumeController_mutedStateDidChange___block_invoke;
  block[3] = &unk_1E3163508;
  block[4] = self;
  dispatch_async(v5, block);

}

- (void)_clearConnection
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __43__MPMusicPlayerController__clearConnection__block_invoke;
  block[3] = &unk_1E3163508;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)_establishConnectionIfNeeded
{
  uint64_t v4;
  objc_class *v5;
  void *v6;
  void *v7;
  id v8;

  if (dyld_program_sdk_at_least())
    +[MPMediaLibrary requestAuthorization:](MPMediaLibrary, "requestAuthorization:", &__block_literal_global_94);
  v4 = objc_msgSend((id)objc_opt_class(), "instanceMethodForSelector:", a2);
  if (v4 == objc_msgSend((id)objc_opt_class(), "instanceMethodForSelector:", a2))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    v5 = (objc_class *)objc_opt_class();
    NSStringFromClass(v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MPMusicPlayerController.m"), 960, CFSTR("Subclass %@ must implement -%@ defined in %@."), v6, v7, CFSTR("[MPMusicPlayerController class]"));

  }
}

- (void)_validateServer
{
  void *v3;
  _QWORD v4[5];

  -[NSXPCConnection synchronousRemoteObjectProxyWithErrorHandler:](self->_connection, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_99_11998);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __42__MPMusicPlayerController__validateServer__block_invoke_100;
  v4[3] = &unk_1E3155838;
  v4[4] = self;
  objc_msgSend(v3, "getTimeSnapshotWithReply:", v4);

}

- (void)onServer:(id)a3
{
  void (**v4)(id, void *);
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v10[5];
  _QWORD v11[5];

  v4 = (void (**)(id, void *))a3;
  -[MPMusicPlayerController _establishConnectionIfNeeded](self, "_establishConnectionIfNeeded");
  v5 = objc_alloc(MEMORY[0x1E0D4D048]);
  v6 = MEMORY[0x1E0C809B0];
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __36__MPMusicPlayerController_onServer___block_invoke;
  v11[3] = &unk_1E3159898;
  v11[4] = self;
  v7 = (void *)objc_msgSend(v5, "initWithTimeout:interruptionHandler:", v11, 1.0);
  v10[0] = v6;
  v10[1] = 3221225472;
  v10[2] = __36__MPMusicPlayerController_onServer___block_invoke_103;
  v10[3] = &unk_1E3159898;
  v10[4] = self;
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D4D048]), "initWithTimeout:interruptionHandler:", v10, 4.0);
  -[NSXPCConnection synchronousRemoteObjectProxyWithErrorHandler:](self->_connection, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_105_11997);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v4[2](v4, v9);

  objc_msgSend(v7, "disarm");
  objc_msgSend(v8, "disarm");

}

- (void)onServerAsync:(id)a3 errorHandler:(id)a4
{
  -[MPMusicPlayerController onServerAsync:errorHandler:timeout:retryEnabled:](self, "onServerAsync:errorHandler:timeout:retryEnabled:", a3, a4, 1, 4.0);
}

- (void)onServerAsync:(id)a3 errorHandler:(id)a4 timeout:(double)a5 retryEnabled:(BOOL)a6
{
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  void *v14;
  id v15;
  id v16;
  void *v17;
  id v18;
  id v19;
  void *v20;
  NSXPCConnection *connection;
  unsigned int (**v22)(_QWORD);
  id v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  _QWORD v29[5];
  id v30;
  id v31;
  id v32;
  BOOL v33;
  _QWORD v34[4];
  id v35;
  id v36;
  _QWORD v37[5];
  id v38;
  _QWORD v39[5];
  uint64_t v40;
  _QWORD v41[2];

  v41[1] = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  -[MPMusicPlayerController _establishConnectionIfNeeded](self, "_establishConnectionIfNeeded");
  v12 = objc_alloc(MEMORY[0x1E0D4D048]);
  v13 = MEMORY[0x1E0C809B0];
  v39[0] = MEMORY[0x1E0C809B0];
  v39[1] = 3221225472;
  v39[2] = __75__MPMusicPlayerController_onServerAsync_errorHandler_timeout_retryEnabled___block_invoke;
  v39[3] = &unk_1E3159898;
  v39[4] = self;
  v14 = (void *)objc_msgSend(v12, "initWithTimeout:interruptionHandler:", v39, 1.0);
  v15 = objc_alloc(MEMORY[0x1E0D4D048]);
  v37[0] = v13;
  v37[1] = 3221225472;
  v37[2] = __75__MPMusicPlayerController_onServerAsync_errorHandler_timeout_retryEnabled___block_invoke_106;
  v37[3] = &unk_1E3155F68;
  v37[4] = self;
  v16 = v11;
  v38 = v16;
  v17 = (void *)objc_msgSend(v15, "initWithTimeout:interruptionHandler:", v37, a5);
  v34[0] = v13;
  v34[1] = 3221225472;
  v34[2] = __75__MPMusicPlayerController_onServerAsync_errorHandler_timeout_retryEnabled___block_invoke_109;
  v34[3] = &unk_1E3155880;
  v18 = v14;
  v35 = v18;
  v19 = v17;
  v36 = v19;
  v20 = (void *)MEMORY[0x19403A810](v34);
  connection = self->_connection;
  v29[0] = v13;
  v29[1] = 3221225472;
  v29[2] = __75__MPMusicPlayerController_onServerAsync_errorHandler_timeout_retryEnabled___block_invoke_2;
  v29[3] = &unk_1E31558D0;
  v22 = v20;
  v33 = a6;
  v29[4] = self;
  v30 = v22;
  v23 = v10;
  v31 = v23;
  v24 = v16;
  v32 = v24;
  -[NSXPCConnection remoteObjectProxyWithErrorHandler:](connection, "remoteObjectProxyWithErrorHandler:", v29);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  if (v25 || !v22[2](v22))
  {
    (*((void (**)(id, void *, unsigned int (**)(_QWORD)))v23 + 2))(v23, v25, v22);
  }
  else
  {
    v26 = (void *)MEMORY[0x1E0CB35C8];
    v40 = *MEMORY[0x1E0CB2938];
    v41[0] = CFSTR("Failed to obtain remoteObject [nil server]");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v41, &v40, 1);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "errorWithDomain:code:userInfo:", CFSTR("MPMusicPlayerControllerErrorDomain"), 10, v27);
    v28 = (void *)objc_claimAutoreleasedReturnValue();

    (*((void (**)(id, void *))v24 + 2))(v24, v28);
  }

}

- (id)_queueDescriptor
{
  MPMusicPlayerQueueDescriptor *serverQueueDescriptor;
  NSObject *v4;
  os_signpost_id_t v5;
  NSObject *v6;
  NSObject *v7;
  NSObject *v8;
  NSObject *v9;
  NSObject *v10;
  NSObject *v11;
  _QWORD v13[5];
  uint8_t buf[4];
  os_signpost_id_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  serverQueueDescriptor = self->_serverQueueDescriptor;
  if (!serverQueueDescriptor)
  {
    v4 = os_log_create("com.apple.amp.mediaplayer", "SDKPlayback");
    v5 = os_signpost_id_generate(v4);

    v6 = os_log_create("com.apple.amp.mediaplayer", "SDKPlayback");
    v7 = v6;
    if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v6))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_193B9B000, v7, OS_SIGNPOST_INTERVAL_BEGIN, v5, "getDescriptor", (const char *)&unk_193F291C9, buf, 2u);
    }

    v8 = os_log_create("com.apple.amp.mediaplayer", "SDKPlayback");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134217984;
      v15 = v5;
      _os_log_impl(&dword_193B9B000, v8, OS_LOG_TYPE_DEBUG, "BEGIN [%lld]: getDescriptor ", buf, 0xCu);
    }

    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __43__MPMusicPlayerController__queueDescriptor__block_invoke;
    v13[3] = &unk_1E31555B8;
    v13[4] = self;
    -[MPMusicPlayerController onServer:](self, "onServer:", v13);
    v9 = os_log_create("com.apple.amp.mediaplayer", "SDKPlayback");
    v10 = v9;
    if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_193B9B000, v10, OS_SIGNPOST_INTERVAL_END, v5, "getDescriptor", (const char *)&unk_193F291C9, buf, 2u);
    }

    v11 = os_log_create("com.apple.amp.mediaplayer", "SDKPlayback");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134217984;
      v15 = v5;
      _os_log_impl(&dword_193B9B000, v11, OS_LOG_TYPE_DEBUG, "END [%lld]: getDescriptor ", buf, 0xCu);
    }

    serverQueueDescriptor = self->_serverQueueDescriptor;
  }
  return serverQueueDescriptor;
}

- (id)_nowPlaying
{
  MPMusicPlayerControllerNowPlaying *serverNowPlaying;
  NSObject *v4;
  os_signpost_id_t v5;
  NSObject *v6;
  NSObject *v7;
  NSObject *v8;
  NSObject *v9;
  NSObject *v10;
  NSObject *v11;
  _QWORD v13[5];
  uint8_t buf[4];
  os_signpost_id_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  serverNowPlaying = self->_serverNowPlaying;
  if (!serverNowPlaying)
  {
    v4 = os_log_create("com.apple.amp.mediaplayer", "SDKPlayback");
    v5 = os_signpost_id_generate(v4);

    v6 = os_log_create("com.apple.amp.mediaplayer", "SDKPlayback");
    v7 = v6;
    if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v6))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_193B9B000, v7, OS_SIGNPOST_INTERVAL_BEGIN, v5, "getNowPlaying", (const char *)&unk_193F291C9, buf, 2u);
    }

    v8 = os_log_create("com.apple.amp.mediaplayer", "SDKPlayback");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134217984;
      v15 = v5;
      _os_log_impl(&dword_193B9B000, v8, OS_LOG_TYPE_DEBUG, "BEGIN [%lld]: getNowPlaying ", buf, 0xCu);
    }

    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __38__MPMusicPlayerController__nowPlaying__block_invoke;
    v13[3] = &unk_1E31555B8;
    v13[4] = self;
    -[MPMusicPlayerController onServer:](self, "onServer:", v13);
    v9 = os_log_create("com.apple.amp.mediaplayer", "SDKPlayback");
    v10 = v9;
    if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_193B9B000, v10, OS_SIGNPOST_INTERVAL_END, v5, "getNowPlaying", (const char *)&unk_193F291C9, buf, 2u);
    }

    v11 = os_log_create("com.apple.amp.mediaplayer", "SDKPlayback");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134217984;
      v15 = v5;
      _os_log_impl(&dword_193B9B000, v11, OS_LOG_TYPE_DEBUG, "END [%lld]: getNowPlaying ", buf, 0xCu);
    }

    serverNowPlaying = self->_serverNowPlaying;
  }
  return serverNowPlaying;
}

- (id)_snapshot
{
  MPMusicPlayerControllerNowPlayingTimeSnapshot *serverTimeSnapshot;
  NSObject *v4;
  os_signpost_id_t v5;
  NSObject *v6;
  NSObject *v7;
  NSObject *v8;
  NSObject *v9;
  NSObject *v10;
  NSObject *v11;
  _QWORD v13[5];
  uint8_t buf[4];
  os_signpost_id_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  serverTimeSnapshot = self->_serverTimeSnapshot;
  if (!serverTimeSnapshot)
  {
    v4 = os_log_create("com.apple.amp.mediaplayer", "SDKPlayback");
    v5 = os_signpost_id_generate(v4);

    v6 = os_log_create("com.apple.amp.mediaplayer", "SDKPlayback");
    v7 = v6;
    if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v6))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_193B9B000, v7, OS_SIGNPOST_INTERVAL_BEGIN, v5, "getTimeSnapshot", (const char *)&unk_193F291C9, buf, 2u);
    }

    v8 = os_log_create("com.apple.amp.mediaplayer", "SDKPlayback");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134217984;
      v15 = v5;
      _os_log_impl(&dword_193B9B000, v8, OS_LOG_TYPE_DEBUG, "BEGIN [%lld]: getTimeSnapshot ", buf, 0xCu);
    }

    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __36__MPMusicPlayerController__snapshot__block_invoke;
    v13[3] = &unk_1E31555B8;
    v13[4] = self;
    -[MPMusicPlayerController onServer:](self, "onServer:", v13);
    v9 = os_log_create("com.apple.amp.mediaplayer", "SDKPlayback");
    v10 = v9;
    if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_193B9B000, v10, OS_SIGNPOST_INTERVAL_END, v5, "getTimeSnapshot", (const char *)&unk_193F291C9, buf, 2u);
    }

    v11 = os_log_create("com.apple.amp.mediaplayer", "SDKPlayback");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134217984;
      v15 = v5;
      _os_log_impl(&dword_193B9B000, v11, OS_LOG_TYPE_DEBUG, "END [%lld]: getTimeSnapshot ", buf, 0xCu);
    }

    serverTimeSnapshot = self->_serverTimeSnapshot;
  }
  return serverTimeSnapshot;
}

- (id)_mediaItemFromNowPlaying:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _MPMusicPlayerMediaItemProxy *v7;
  void *v8;
  _MPMusicPlayerMediaItemProxy *v9;
  _QWORD v11[4];
  id v12;
  id v13;
  id from;
  id location;

  v4 = a3;
  objc_msgSend(v4, "item");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v6 = v5;
    objc_initWeak(&location, self);
    objc_initWeak(&from, v4);
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __52__MPMusicPlayerController__mediaItemFromNowPlaying___block_invoke;
    v11[3] = &unk_1E3155948;
    objc_copyWeak(&v12, &location);
    objc_copyWeak(&v13, &from);
    objc_msgSend(v6, "setFallbackArtworkCatalogBlock:", v11);
    objc_destroyWeak(&v13);
    objc_destroyWeak(&v12);
    objc_destroyWeak(&from);
    objc_destroyWeak(&location);

  }
  v7 = [_MPMusicPlayerMediaItemProxy alloc];
  objc_msgSend(v4, "itemIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[_MPMusicPlayerMediaItemProxy initWithItemIdentifier:item:](v7, "initWithItemIdentifier:item:", v8, v5);

  return v9;
}

- (void)_postPrivateQueueDidChangeNotificationWithContentItemIDs:(id)a3
{
  NSArray *v4;
  NSArray *v5;
  NSArray *v6;
  char v7;
  NSArray *v8;
  NSArray *lastContentItemIDs;
  void *v10;
  void *v11;
  const __CFString *v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  v4 = (NSArray *)a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (-[NSString isEqualToString:](self->_clientIdentifier, "isEqualToString:", CFSTR("MusicKit_applicationMusicPlayer")))
  {
    v5 = self->_lastContentItemIDs;
    if (v5 == v4)
    {

    }
    else
    {
      v6 = v5;
      v7 = -[NSArray isEqual:](v5, "isEqual:", v4);

      if ((v7 & 1) == 0)
      {
        v8 = (NSArray *)-[NSArray copy](v4, "copy");
        lastContentItemIDs = self->_lastContentItemIDs;
        self->_lastContentItemIDs = v8;

        if (v4)
        {
          v12 = CFSTR("_contentItemIDs");
          v13[0] = v4;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, &v12, 1);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v10 = 0;
        }
        objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "postNotificationName:object:userInfo:", CFSTR("_MPMusicPlayerControllerQueueDidChangeNotification"), self, v10);

      }
    }
  }

}

- (BOOL)isPreparedToPlay
{
  return self->_isPreparedToPlay;
}

- (NSXPCConnection)connection
{
  return self->_connection;
}

- (NSString)clientIdentifier
{
  return self->_clientIdentifier;
}

- (MPMusicPlayerControllerNowPlaying)serverNowPlaying
{
  return self->_serverNowPlaying;
}

- (MPMusicPlayerControllerNowPlayingTimeSnapshot)serverTimeSnapshot
{
  return self->_serverTimeSnapshot;
}

- (MPMusicPlayerQueueDescriptor)serverQueueDescriptor
{
  return self->_serverQueueDescriptor;
}

- (MPMusicPlayerControllerNowPlayingTimeSnapshot)lastServerTimeSnapshot
{
  return self->_lastServerTimeSnapshot;
}

- (MPMusicPlayerControllerNowPlaying)lastServerNowPlaying
{
  return self->_lastServerNowPlaying;
}

- (NSArray)lastContentItemIDs
{
  return self->_lastContentItemIDs;
}

- (MPMusicPlayerQueueDescriptor)targetQueueDescriptor
{
  return self->_targetQueueDescriptor;
}

- (int64_t)notificationsCounter
{
  return self->_notificationsCounter;
}

- (MPVolumeController)volumeController
{
  return self->_volumeController;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (BOOL)userQueueModificationsDisabled
{
  return self->_userQueueModificationsDisabled;
}

- (void)setUserQueueModificationsDisabled:(BOOL)a3
{
  self->_userQueueModificationsDisabled = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_volumeController, 0);
  objc_storeStrong((id *)&self->_targetQueueDescriptor, 0);
  objc_storeStrong((id *)&self->_lastContentItemIDs, 0);
  objc_storeStrong((id *)&self->_lastServerNowPlaying, 0);
  objc_storeStrong((id *)&self->_lastServerTimeSnapshot, 0);
  objc_storeStrong((id *)&self->_serverQueueDescriptor, 0);
  objc_storeStrong((id *)&self->_serverTimeSnapshot, 0);
  objc_storeStrong((id *)&self->_serverNowPlaying, 0);
  objc_storeStrong((id *)&self->_clientIdentifier, 0);
  objc_storeStrong((id *)&self->_connection, 0);
}

MPArtworkCatalog *__52__MPMusicPlayerController__mediaItemFromNowPlaying___block_invoke(uint64_t a1)
{
  id WeakRetained;
  id v3;
  void *v4;
  MPArtworkCatalog *v5;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v3 = objc_loadWeakRetained((id *)(a1 + 40));
  v4 = v3;
  v5 = 0;
  if (WeakRetained && v3)
    v5 = -[MPArtworkCatalog initWithToken:dataSource:]([MPArtworkCatalog alloc], "initWithToken:dataSource:", v3, WeakRetained);

  return v5;
}

uint64_t __36__MPMusicPlayerController__snapshot__block_invoke(uint64_t a1, void *a2)
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __36__MPMusicPlayerController__snapshot__block_invoke_2;
  v3[3] = &unk_1E3155838;
  v3[4] = *(_QWORD *)(a1 + 32);
  return objc_msgSend(a2, "getTimeSnapshotWithReply:", v3);
}

void __36__MPMusicPlayerController__snapshot__block_invoke_2(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 64), a2);
}

uint64_t __38__MPMusicPlayerController__nowPlaying__block_invoke(uint64_t a1, void *a2)
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __38__MPMusicPlayerController__nowPlaying__block_invoke_2;
  v3[3] = &unk_1E3155920;
  v3[4] = *(_QWORD *)(a1 + 32);
  return objc_msgSend(a2, "getNowPlayingWithReply:", v3);
}

void __38__MPMusicPlayerController__nowPlaying__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  NSObject *v11;
  void *v12;
  int v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v6 = a2;
  v7 = a3;
  if (v7)
  {
    v8 = os_log_create("com.apple.amp.mediaplayer", "SDKPlayback");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v7, "msv_description");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 138543362;
      v14 = v9;
      _os_log_impl(&dword_193B9B000, v8, OS_LOG_TYPE_ERROR, "Failed to get server now playing error=%{public}@", (uint8_t *)&v13, 0xCu);

    }
  }
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 56), a2);
  v10 = *(_QWORD *)(a1 + 32);
  if (!*(_BYTE *)(v10 + 44) && !*(_QWORD *)(v10 + 104) && *(_QWORD *)(v10 + 56))
  {
    *(_BYTE *)(v10 + 44) = 1;
    v11 = os_log_create("com.apple.amp.mediaplayer", "SDKPlayback");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v13) = 0;
      _os_log_impl(&dword_193B9B000, v11, OS_LOG_TYPE_DEFAULT, "_nowPlaying getter marking player as prepared to play because we have a valid server now playing object.", (uint8_t *)&v13, 2u);
    }

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "postNotificationName:object:", CFSTR("MPMediaPlaybackIsPreparedToPlayDidChangeNotification"), *(_QWORD *)(a1 + 32));

  }
}

uint64_t __43__MPMusicPlayerController__queueDescriptor__block_invoke(uint64_t a1, void *a2)
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __43__MPMusicPlayerController__queueDescriptor__block_invoke_2;
  v3[3] = &unk_1E31558F8;
  v3[4] = *(_QWORD *)(a1 + 32);
  return objc_msgSend(a2, "getDescriptorWithReply:", v3);
}

void __43__MPMusicPlayerController__queueDescriptor__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  int v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    v7 = os_log_create("com.apple.amp.mediaplayer", "SDKPlayback");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v6, "msv_description");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 138543362;
      v12 = v8;
      _os_log_impl(&dword_193B9B000, v7, OS_LOG_TYPE_ERROR, "Failed to get server queue descriptor error=%{public}@", (uint8_t *)&v11, 0xCu);

    }
  }
  v9 = *(_QWORD *)(a1 + 32);
  v10 = *(void **)(v9 + 72);
  *(_QWORD *)(v9 + 72) = v5;

}

uint64_t __75__MPMusicPlayerController_onServerAsync_errorHandler_timeout_retryEnabled___block_invoke(uint64_t result, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  NSObject *v5;
  uint8_t v6[16];
  uint64_t v7;
  uint64_t v8;

  if (!a2)
  {
    v7 = v2;
    v8 = v3;
    v4 = result;
    v5 = os_log_create("com.apple.amp.mediaplayer", "SDKPlayback");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_193B9B000, v5, OS_LOG_TYPE_ERROR, "ASYNC-WATCHDOG-1: Attempting to wake up the remote process", v6, 2u);
    }

    return objc_msgSend(*(id *)(v4 + 32), "_establishConnectionIfNeeded");
  }
  return result;
}

void __75__MPMusicPlayerController_onServerAsync_errorHandler_timeout_retryEnabled___block_invoke_106(uint64_t a1, uint64_t a2)
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  uint8_t v7[8];
  uint64_t v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  if (!a2)
  {
    v3 = os_log_create("com.apple.amp.mediaplayer", "SDKPlayback");
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_193B9B000, v3, OS_LOG_TYPE_ERROR, "ASYNC-WATCHDOG-2: Tearing down connection", v7, 2u);
    }

    objc_msgSend(*(id *)(a1 + 32), "_clearConnection");
    v4 = (void *)MEMORY[0x1E0CB35C8];
    v8 = *MEMORY[0x1E0CB2938];
    v9[0] = CFSTR("Remote call timed out");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, &v8, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "errorWithDomain:code:userInfo:", CFSTR("MPMusicPlayerControllerErrorDomain"), 9, v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
}

uint64_t __75__MPMusicPlayerController_onServerAsync_errorHandler_timeout_retryEnabled___block_invoke_109(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "disarm");
  return objc_msgSend(*(id *)(a1 + 40), "disarm");
}

void __75__MPMusicPlayerController_onServerAsync_errorHandler_timeout_retryEnabled___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  int v5;
  NSObject *v6;
  uint64_t v7;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD block[5];
  id v14;
  id v15;
  uint64_t v16;
  id v17;
  uint8_t buf[4];
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if ((*(unsigned int (**)(void))(*(_QWORD *)(a1 + 40) + 16))())
  {
    if (*(_BYTE *)(a1 + 64)
      && (objc_msgSend(v3, "code") == 4097 || objc_msgSend(v3, "code") == 4099)
      && (objc_msgSend(v3, "domain"),
          v4 = (void *)objc_claimAutoreleasedReturnValue(),
          v5 = objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0CB28A8]),
          v4,
          v5))
    {
      v6 = os_log_create("com.apple.amp.mediaplayer", "SDKPlayback");
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_193B9B000, v6, OS_LOG_TYPE_DEFAULT, "XPC connection was interrupted or invalidated while obtaining remoteObject, retrying", buf, 2u);
      }

      v7 = *(_QWORD *)(a1 + 32);
      v8 = *(NSObject **)(v7 + 128);
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __75__MPMusicPlayerController_onServerAsync_errorHandler_timeout_retryEnabled___block_invoke_111;
      block[3] = &unk_1E31558A8;
      block[4] = v7;
      v14 = *(id *)(a1 + 48);
      v15 = *(id *)(a1 + 56);
      dispatch_async(v8, block);

    }
    else
    {
      v9 = os_log_create("com.apple.amp.mediaplayer", "SDKPlayback");
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        v19 = v3;
        _os_log_impl(&dword_193B9B000, v9, OS_LOG_TYPE_ERROR, "Failed to obtain remoteObject: %{public}@", buf, 0xCu);
      }

      v10 = (void *)MEMORY[0x1E0CB35C8];
      v16 = *MEMORY[0x1E0CB3388];
      v17 = v3;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v17, &v16, 1);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "errorWithDomain:code:userInfo:", CFSTR("MPMusicPlayerControllerErrorDomain"), 10, v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
    }
  }

}

uint64_t __75__MPMusicPlayerController_onServerAsync_errorHandler_timeout_retryEnabled___block_invoke_111(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "onServerAsync:errorHandler:timeout:retryEnabled:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), 0, 4.0);
}

uint64_t __36__MPMusicPlayerController_onServer___block_invoke(uint64_t result, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  NSObject *v5;
  uint8_t v6[16];
  uint64_t v7;
  uint64_t v8;

  if (!a2)
  {
    v7 = v2;
    v8 = v3;
    v4 = result;
    v5 = os_log_create("com.apple.amp.mediaplayer", "SDKPlayback");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_193B9B000, v5, OS_LOG_TYPE_ERROR, "SYNC-WATCHDOG-1: Attempting to wake up the remote process", v6, 2u);
    }

    return objc_msgSend(*(id *)(v4 + 32), "_establishConnectionIfNeeded");
  }
  return result;
}

uint64_t __36__MPMusicPlayerController_onServer___block_invoke_103(uint64_t result, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  NSObject *v5;
  uint8_t v6[16];
  uint64_t v7;
  uint64_t v8;

  if (!a2)
  {
    v7 = v2;
    v8 = v3;
    v4 = result;
    v5 = os_log_create("com.apple.amp.mediaplayer", "SDKPlayback");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_193B9B000, v5, OS_LOG_TYPE_ERROR, "SYNC-WATCHDOG-2: Tearing down connection", v6, 2u);
    }

    return objc_msgSend(*(id *)(v4 + 32), "_clearConnection");
  }
  return result;
}

void __36__MPMusicPlayerController_onServer___block_invoke_104(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  id v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  v3 = os_log_create("com.apple.amp.mediaplayer", "SDKPlayback");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    v4 = 138543362;
    v5 = v2;
    _os_log_impl(&dword_193B9B000, v3, OS_LOG_TYPE_ERROR, "Failed to obtain synchronousRemoteObject: %{public}@", (uint8_t *)&v4, 0xCu);
  }

}

void __42__MPMusicPlayerController__validateServer__block_invoke_100(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  int v5;
  id v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = os_log_create("com.apple.amp.mediaplayer", "SDKPlayback");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 138412290;
    v6 = v3;
    _os_log_impl(&dword_193B9B000, v4, OS_LOG_TYPE_DEFAULT, "Server validation returned with snapshot %@", (uint8_t *)&v5, 0xCu);
  }

  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 25) = 1;
}

void __42__MPMusicPlayerController__validateServer__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  id v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  v3 = os_log_create("com.apple.amp.mediaplayer", "SDKPlayback");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    v4 = 138412290;
    v5 = v2;
    _os_log_impl(&dword_193B9B000, v3, OS_LOG_TYPE_ERROR, "Server validation failed with error=%@", (uint8_t *)&v4, 0xCu);
  }

}

void __43__MPMusicPlayerController__clearConnection__block_invoke(uint64_t a1)
{
  uint64_t v2;
  int v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;

  os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 40));
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(unsigned __int8 *)(v2 + 25);
  *(_BYTE *)(v2 + 25) = 0;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "setInvalidationHandler:", 0);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "invalidate");
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(v4 + 32);
  *(_QWORD *)(v4 + 32) = 0;

  v6 = *(_QWORD *)(a1 + 32);
  v7 = *(void **)(v6 + 56);
  *(_QWORD *)(v6 + 56) = 0;

  v8 = *(_QWORD *)(a1 + 32);
  v9 = *(void **)(v8 + 64);
  *(_QWORD *)(v8 + 64) = 0;

  v10 = *(_QWORD *)(a1 + 32);
  v11 = *(void **)(v10 + 72);
  *(_QWORD *)(v10 + 72) = 0;

  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 44) = 0;
  os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 40));
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v12 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "_postPrivateQueueDidChangeNotificationWithContentItemIDs:", 0);
    objc_msgSend(v12, "postNotificationName:object:", CFSTR("MPMusicPlayerControllerQueueDidChangeNotification"), *(_QWORD *)(a1 + 32));
    objc_msgSend(v12, "postNotificationName:object:", CFSTR("MPMusicPlayerControllerNowPlayingItemDidChangeNotification"), *(_QWORD *)(a1 + 32));
    objc_msgSend(v12, "postNotificationName:object:", CFSTR("MPMusicPlayerControllerPlaybackStateDidChangeNotification"), *(_QWORD *)(a1 + 32));

  }
}

void __64__MPMusicPlayerController_volumeController_mutedStateDidChange___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "postNotificationName:object:", CFSTR("MPMusicPlayerControllerVolumeDidChangeNotification"), *(_QWORD *)(a1 + 32));

}

void __65__MPMusicPlayerController_volumeController_volumeValueDidChange___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "postNotificationName:object:", CFSTR("MPMusicPlayerControllerVolumeDidChangeNotification"), *(_QWORD *)(a1 + 32));

}

void __81__MPMusicPlayerController_loadRepresentationForArtworkCatalog_completionHandler___block_invoke(id *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;
  id v18;

  v5 = a3;
  v6 = a1[4];
  v7 = a2;
  objc_msgSend(v6, "artworkIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1[4], "itemIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1[5], "scaledFittingSize");
  v11 = v10;
  v13 = v12;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __81__MPMusicPlayerController_loadRepresentationForArtworkCatalog_completionHandler___block_invoke_2;
  v15[3] = &unk_1E3155788;
  v17 = v5;
  v16 = a1[5];
  v18 = a1[6];
  v14 = v5;
  objc_msgSend(v7, "getImageForArtworkIdentifier:itemIdentifier:atSize:reply:", v8, v9, v15, v11, v13);

}

void __81__MPMusicPlayerController_loadRepresentationForArtworkCatalog_completionHandler___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;
  uint8_t buf[4];
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = os_log_create("com.apple.amp.mediaplayer", "SDKPlayback");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v12 = v3;
    _os_log_impl(&dword_193B9B000, v4, OS_LOG_TYPE_DEFAULT, "Failed to loadRepresentationForArtworkCatalog with error: %{public}@", buf, 0xCu);
  }

  v5 = *(_QWORD *)(a1 + 32);
  v6 = (void *)MEMORY[0x1E0CB35C8];
  v9 = *MEMORY[0x1E0CB3388];
  v10 = v3;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v10, &v9, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "errorWithDomain:code:userInfo:", CFSTR("MPMusicPlayerControllerErrorDomain"), 500, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, _QWORD, void *))(v5 + 16))(v5, 0, v8);

}

void __81__MPMusicPlayerController_loadRepresentationForArtworkCatalog_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;

  v10 = a2;
  v5 = a3;
  if ((*(unsigned int (**)(void))(*(_QWORD *)(a1 + 40) + 16))())
  {
    if (v10)
    {
      objc_msgSend(MEMORY[0x1E0DC3870], "imageWithData:", v10);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "visualIdenticalityIdentifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "scaledFittingSize");
      +[MPArtworkRepresentation representationForVisualIdentity:withSize:image:](MPArtworkRepresentation, "representationForVisualIdentity:withSize:image:", v7, v6);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
    }
    else
    {
      v9 = *(_QWORD *)(a1 + 48);
      if (v5)
      {
        (*(void (**)(uint64_t, _QWORD, id))(v9 + 16))(v9, 0, v5);
        goto LABEL_7;
      }
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("MPMusicPlayerControllerErrorDomain"), 404, 0);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, _QWORD, void *))(v9 + 16))(v9, 0, v6);
    }

  }
LABEL_7:

}

uint64_t __56__MPMusicPlayerController_applyServerStateUpdateRecord___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_onQueue_applyServerStateUpdateRecord:", *(_QWORD *)(a1 + 40));
}

uint64_t __37__MPMusicPlayerController_endSeeking__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "endSeek");
}

uint64_t __47__MPMusicPlayerController_beginSeekingBackward__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "beginSeekWithDirection:", -1);
}

uint64_t __46__MPMusicPlayerController_beginSeekingForward__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "beginSeekWithDirection:", 1);
}

uint64_t __50__MPMusicPlayerController_setCurrentPlaybackRate___block_invoke(uint64_t a1, void *a2, double a3)
{
  _QWORD v4[5];

  LODWORD(a3) = *(_DWORD *)(a1 + 40);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __50__MPMusicPlayerController_setCurrentPlaybackRate___block_invoke_2;
  v4[3] = &__block_descriptor_40_e5_v8__0l;
  v4[4] = *(_QWORD *)(a1 + 32);
  return objc_msgSend(a2, "setPlaybackRate:completion:", v4, a3);
}

void __50__MPMusicPlayerController_setCurrentPlaybackRate___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  NSObject *v3;
  os_signpost_id_t v4;
  NSObject *v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v2 = os_log_create("com.apple.amp.mediaplayer", "SDKPlayback");
  v3 = v2;
  v4 = *(_QWORD *)(a1 + 32);
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v2))
  {
    LOWORD(v7) = 0;
    _os_signpost_emit_with_name_impl(&dword_193B9B000, v3, OS_SIGNPOST_INTERVAL_END, v4, "setCurrentPlaybackRate", (const char *)&unk_193F291C9, (uint8_t *)&v7, 2u);
  }

  v5 = os_log_create("com.apple.amp.mediaplayer", "SDKPlayback");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    v6 = *(_QWORD *)(a1 + 32);
    v7 = 134217984;
    v8 = v6;
    _os_log_impl(&dword_193B9B000, v5, OS_LOG_TYPE_DEBUG, "END [%lld]: setCurrentPlaybackRate ", (uint8_t *)&v7, 0xCu);
  }

}

uint64_t __50__MPMusicPlayerController_setCurrentPlaybackTime___block_invoke(uint64_t a1, void *a2)
{
  double v2;
  _QWORD v4[5];

  v2 = *(double *)(a1 + 32);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __50__MPMusicPlayerController_setCurrentPlaybackTime___block_invoke_2;
  v4[3] = &__block_descriptor_40_e5_v8__0l;
  v4[4] = *(_QWORD *)(a1 + 40);
  return objc_msgSend(a2, "setElapsedTime:completion:", v4, v2);
}

void __50__MPMusicPlayerController_setCurrentPlaybackTime___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  NSObject *v3;
  os_signpost_id_t v4;
  NSObject *v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v2 = os_log_create("com.apple.amp.mediaplayer", "SDKPlayback");
  v3 = v2;
  v4 = *(_QWORD *)(a1 + 32);
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v2))
  {
    LOWORD(v7) = 0;
    _os_signpost_emit_with_name_impl(&dword_193B9B000, v3, OS_SIGNPOST_INTERVAL_END, v4, "setCurrentPlaybackTime", (const char *)&unk_193F291C9, (uint8_t *)&v7, 2u);
  }

  v5 = os_log_create("com.apple.amp.mediaplayer", "SDKPlayback");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    v6 = *(_QWORD *)(a1 + 32);
    v7 = 134217984;
    v8 = v6;
    _os_log_impl(&dword_193B9B000, v5, OS_LOG_TYPE_DEBUG, "END [%lld]: setCurrentPlaybackTime ", (uint8_t *)&v7, 0xCu);
  }

}

uint64_t __31__MPMusicPlayerController_stop__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "stop");
}

uint64_t __32__MPMusicPlayerController_pause__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "pauseWithFadeDuration:", 0);
}

uint64_t __31__MPMusicPlayerController_play__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "play");
}

void __40__MPMusicPlayerController_prepareToPlay__block_invoke(int8x16_t *a1, void *a2)
{
  int8x16_t v2;
  _QWORD v3[4];
  int8x16_t v4;
  uint64_t v5;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __40__MPMusicPlayerController_prepareToPlay__block_invoke_2;
  v3[3] = &unk_1E3155698;
  v5 = a1[3].i64[0];
  v2 = a1[2];
  v4 = vextq_s8(v2, v2, 8uLL);
  objc_msgSend(a2, "setDescriptor:completion:", (id)v2.i64[0], v3);

}

void __40__MPMusicPlayerController_prepareToPlay__block_invoke_2(_QWORD *a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  NSObject *v6;
  NSObject *v7;
  os_signpost_id_t v8;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
  {
    v4 = os_log_create("com.apple.amp.mediaplayer", "SDKPlayback");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v3, "msv_description");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 138543362;
      v16 = v5;
      _os_log_impl(&dword_193B9B000, v4, OS_LOG_TYPE_ERROR, "Failed to prepareToPlay error=%{public}@", (uint8_t *)&v15, 0xCu);

    }
  }
  v6 = os_log_create("com.apple.amp.mediaplayer", "SDKPlayback");
  v7 = v6;
  v8 = a1[6];
  if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v6))
  {
    LOWORD(v15) = 0;
    _os_signpost_emit_with_name_impl(&dword_193B9B000, v7, OS_SIGNPOST_INTERVAL_END, v8, "prepareToPlay:sync", (const char *)&unk_193F291C9, (uint8_t *)&v15, 2u);
  }

  v9 = os_log_create("com.apple.amp.mediaplayer", "SDKPlayback");
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    v10 = (void *)a1[6];
    v15 = 134217984;
    v16 = v10;
    _os_log_impl(&dword_193B9B000, v9, OS_LOG_TYPE_DEBUG, "END [%lld]: prepareToPlay:sync ", (uint8_t *)&v15, 0xCu);
  }

  if (!v3)
  {
    v11 = a1[4];
    if (*(_QWORD *)(v11 + 104) == a1[5])
    {
      *(_BYTE *)(v11 + 44) = 1;
      v12 = a1[4];
      v13 = *(void **)(v12 + 104);
      *(_QWORD *)(v12 + 104) = 0;

      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "postNotificationName:object:", CFSTR("MPMediaPlaybackIsPreparedToPlayDidChangeNotification"), a1[4]);

    }
  }

}

uint64_t __56__MPMusicPlayerController_skipToBeginningOrPreviousItem__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "skipWithBehavior:", 3);
}

uint64_t __52__MPMusicPlayerController_pauseWithFadeoutDuration___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "pauseWithFadeDuration:", (uint64_t)*(double *)(a1 + 32));
}

uint64_t __34__MPMusicPlayerController_shuffle__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "reshuffle");
}

uint64_t __45__MPMusicPlayerController_nowPlayingAtIndex___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  _QWORD v4[5];

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __45__MPMusicPlayerController_nowPlayingAtIndex___block_invoke_2;
  v4[3] = &unk_1E3155670;
  v2 = *(_QWORD *)(a1 + 40);
  v4[4] = *(_QWORD *)(a1 + 32);
  return objc_msgSend(a2, "getNowPlayingAtIndex:reply:", v2, v4);
}

void __45__MPMusicPlayerController_nowPlayingAtIndex___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  int v11;
  uint64_t v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    v7 = os_log_create("com.apple.amp.mediaplayer", "SDKPlayback");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v6, "msv_description");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 134218242;
      v12 = MEMORY[0x1E0C83948];
      v13 = 2114;
      v14 = v8;
      _os_log_impl(&dword_193B9B000, v7, OS_LOG_TYPE_ERROR, "Failed getting nowPlayingAtIndex: %ld error=%{public}@", (uint8_t *)&v11, 0x16u);

    }
  }
  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v5;

}

uint64_t __45__MPMusicPlayerController_skipToPreviousItem__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "skipWithBehavior:", 0);
}

uint64_t __42__MPMusicPlayerController_skipToBeginning__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "skipWithBehavior:", 2);
}

uint64_t __41__MPMusicPlayerController_skipToNextItem__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "skipWithBehavior:", 1);
}

void __70__MPMusicPlayerController_prepareToPlayWithCompletionHandler_timeout___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  id v9;
  id v10;
  int8x16_t v11;
  _QWORD v12[4];
  int8x16_t v13;
  id v14;
  id v15;
  uint64_t v16;
  uint8_t buf[16];

  v5 = a3;
  v6 = a2;
  v7 = os_log_create("com.apple.amp.mediaplayer", "SDKPlayback");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_193B9B000, v7, OS_LOG_TYPE_DEFAULT, "prepareToPlay connected to server, setting queue descriptor", buf, 2u);
  }

  v8 = *(_QWORD *)(a1 + 32);
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __70__MPMusicPlayerController_prepareToPlayWithCompletionHandler_timeout___block_invoke_62;
  v12[3] = &unk_1E31555E0;
  v16 = *(_QWORD *)(a1 + 56);
  v14 = v5;
  v11 = *(int8x16_t *)(a1 + 32);
  v9 = (id)v11.i64[0];
  v13 = vextq_s8(v11, v11, 8uLL);
  v15 = *(id *)(a1 + 48);
  v10 = v5;
  objc_msgSend(v6, "setDescriptor:completion:", v8, v12);

}

void __70__MPMusicPlayerController_prepareToPlayWithCompletionHandler_timeout___block_invoke_66(_QWORD *a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  NSObject *v6;
  os_signpost_id_t v7;
  NSObject *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  uint8_t buf[4];
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = os_log_create("com.apple.amp.mediaplayer", "SDKPlayback");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543362;
    v17 = v3;
    _os_log_impl(&dword_193B9B000, v4, OS_LOG_TYPE_ERROR, "Failed to prepareToPlay with error: %{public}@", buf, 0xCu);
  }

  v5 = os_log_create("com.apple.amp.mediaplayer", "SDKPlayback");
  v6 = v5;
  v7 = a1[6];
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_193B9B000, v6, OS_SIGNPOST_INTERVAL_END, v7, "prepareToPlay:async", "nil server", buf, 2u);
  }

  v8 = os_log_create("com.apple.amp.mediaplayer", "SDKPlayback");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    v9 = (void *)a1[6];
    *(_DWORD *)buf = 134217984;
    v17 = v9;
    _os_log_impl(&dword_193B9B000, v8, OS_LOG_TYPE_DEBUG, "END [%lld]: prepareToPlay:async nil server", buf, 0xCu);
  }

  v10 = (void *)a1[5];
  v11 = *(NSObject **)(a1[4] + 128);
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __70__MPMusicPlayerController_prepareToPlayWithCompletionHandler_timeout___block_invoke_67;
  v13[3] = &unk_1E3162560;
  v14 = v3;
  v15 = v10;
  v12 = v3;
  dispatch_async(v11, v13);

}

void __70__MPMusicPlayerController_prepareToPlayWithCompletionHandler_timeout___block_invoke_67(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 40);
  objc_msgSend(MEMORY[0x1E0CB35C8], "msv_errorWithDomain:code:underlyingError:debugDescription:", CFSTR("MPMusicPlayerControllerErrorDomain"), 6, *(_QWORD *)(a1 + 32), CFSTR("Prepare to play failed"));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);

}

void __70__MPMusicPlayerController_prepareToPlayWithCompletionHandler_timeout___block_invoke_62(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  NSObject *v6;
  NSObject *v7;
  os_signpost_id_t v8;
  NSObject *v9;
  void *v10;
  NSObject *v11;
  id v12;
  uint64_t v13;
  void *v14;
  _QWORD v15[4];
  id v16;
  uint64_t v17;
  id v18;
  id v19;
  uint8_t buf[4];
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
  {
    v4 = os_log_create("com.apple.amp.mediaplayer", "SDKPlayback");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v3, "msv_description");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v21 = v5;
      _os_log_impl(&dword_193B9B000, v4, OS_LOG_TYPE_ERROR, "Failed to prepareToPlay error=%{public}@", buf, 0xCu);

    }
  }
  v6 = os_log_create("com.apple.amp.mediaplayer", "SDKPlayback");
  v7 = v6;
  v8 = *(_QWORD *)(a1 + 64);
  if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v6))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_193B9B000, v7, OS_SIGNPOST_INTERVAL_END, v8, "prepareToPlay:async", (const char *)&unk_193F291C9, buf, 2u);
  }

  v9 = os_log_create("com.apple.amp.mediaplayer", "SDKPlayback");
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    v10 = *(void **)(a1 + 64);
    *(_DWORD *)buf = 134217984;
    v21 = v10;
    _os_log_impl(&dword_193B9B000, v9, OS_LOG_TYPE_DEBUG, "END [%lld]: prepareToPlay:async ", buf, 0xCu);
  }

  if ((*(unsigned int (**)(void))(*(_QWORD *)(a1 + 48) + 16))())
  {
    v11 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 128);
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __70__MPMusicPlayerController_prepareToPlayWithCompletionHandler_timeout___block_invoke_63;
    v15[3] = &unk_1E315C088;
    v12 = v3;
    v13 = *(_QWORD *)(a1 + 32);
    v14 = *(void **)(a1 + 40);
    v16 = v12;
    v17 = v13;
    v18 = v14;
    v19 = *(id *)(a1 + 56);
    dispatch_async(v11, v15);

  }
}

uint64_t __70__MPMusicPlayerController_prepareToPlayWithCompletionHandler_timeout___block_invoke_63(_QWORD *a1)
{
  uint64_t v2;
  NSObject *v3;
  const char *v4;
  uint8_t *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  __int16 v10;
  uint8_t buf[2];

  if (!a1[4])
  {
    v2 = a1[5];
    if (*(_QWORD *)(v2 + 104) == a1[6])
    {
      *(_BYTE *)(v2 + 44) = 1;
      v6 = a1[5];
      v7 = *(void **)(v6 + 104);
      *(_QWORD *)(v6 + 104) = 0;

      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "postNotificationName:object:", CFSTR("MPMediaPlaybackIsPreparedToPlayDidChangeNotification"), a1[5]);

      v3 = os_log_create("com.apple.amp.mediaplayer", "SDKPlayback");
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        v4 = "prepareToPlay completed with current target queue descriptor";
        v5 = buf;
        goto LABEL_7;
      }
    }
    else
    {
      v3 = os_log_create("com.apple.amp.mediaplayer", "SDKPlayback");
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
      {
        v10 = 0;
        v4 = "prepareToPlay completed with past queue descriptor";
        v5 = (uint8_t *)&v10;
LABEL_7:
        _os_log_impl(&dword_193B9B000, v3, OS_LOG_TYPE_DEFAULT, v4, v5, 2u);
      }
    }

  }
  return (*(uint64_t (**)(_QWORD))(a1[7] + 16))(a1[7]);
}

uint64_t __49__MPMusicPlayerController_appendQueueDescriptor___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "appendDescriptor:completion:", *(_QWORD *)(a1 + 32), &__block_literal_global_60);
}

void __49__MPMusicPlayerController_appendQueueDescriptor___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  void *v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  if (v2)
  {
    v3 = os_log_create("com.apple.amp.mediaplayer", "SDKPlayback");
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v2, "msv_description");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = 138543362;
      v6 = v4;
      _os_log_impl(&dword_193B9B000, v3, OS_LOG_TYPE_ERROR, "appendQueueDescriptor failed error=%{public}@", (uint8_t *)&v5, 0xCu);

    }
  }

}

uint64_t __50__MPMusicPlayerController_prependQueueDescriptor___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "prependDescriptor:completion:", *(_QWORD *)(a1 + 32), &__block_literal_global_59);
}

void __50__MPMusicPlayerController_prependQueueDescriptor___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  void *v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  if (v2)
  {
    v3 = os_log_create("com.apple.amp.mediaplayer", "SDKPlayback");
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v2, "msv_description");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = 138543362;
      v6 = v4;
      _os_log_impl(&dword_193B9B000, v3, OS_LOG_TYPE_ERROR, "prependQueueDescriptor failed error=%{public}@", (uint8_t *)&v5, 0xCu);

    }
  }

}

uint64_t __61__MPMusicPlayerController__setNowPlayingItem_itemIdentifier___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setNowPlayingItem:itemIdentifier:completion:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), &__block_literal_global_57);
}

void __61__MPMusicPlayerController__setNowPlayingItem_itemIdentifier___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  void *v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  if (v2)
  {
    v3 = os_log_create("com.apple.amp.mediaplayer", "SDKPlayback");
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v2, "msv_description");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = 138543362;
      v6 = v4;
      _os_log_impl(&dword_193B9B000, v3, OS_LOG_TYPE_ERROR, "Failed to set now playing item error=%{public}@", (uint8_t *)&v5, 0xCu);

    }
  }

}

uint64_t __50__MPMusicPlayerController_setNowPlayingUID_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  _QWORD v4[5];

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __50__MPMusicPlayerController_setNowPlayingUID_error___block_invoke_2;
  v4[3] = &unk_1E3155540;
  v2 = *(_QWORD *)(a1 + 40);
  v4[4] = *(_QWORD *)(a1 + 32);
  return objc_msgSend(a2, "setNowPlayingUID:completion:", v2, v4);
}

void __50__MPMusicPlayerController_setNowPlayingUID_error___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
  {
    v4 = os_log_create("com.apple.amp.mediaplayer", "SDKPlayback");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v3, "msv_description");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = 138543362;
      v9 = v5;
      _os_log_impl(&dword_193B9B000, v4, OS_LOG_TYPE_ERROR, "Failed to set now playing UID error=%{public}@", (uint8_t *)&v8, 0xCu);

    }
  }
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v3;

}

uint64_t __49__MPMusicPlayerController__setServerShuffleMode___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setShuffleMode:", *(_QWORD *)(a1 + 32));
}

uint64_t __45__MPMusicPlayerController__serverShuffleMode__block_invoke(uint64_t a1, void *a2)
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __45__MPMusicPlayerController__serverShuffleMode__block_invoke_2;
  v3[3] = &unk_1E31554D0;
  v3[4] = *(_QWORD *)(a1 + 32);
  return objc_msgSend(a2, "getShuffleModeWithReply:", v3);
}

uint64_t __45__MPMusicPlayerController__serverShuffleMode__block_invoke_2(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = a2;
  return result;
}

uint64_t __48__MPMusicPlayerController__setServerRepeatMode___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setRepeatMode:", *(_QWORD *)(a1 + 32));
}

uint64_t __44__MPMusicPlayerController__serverRepeatMode__block_invoke(uint64_t a1, void *a2)
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __44__MPMusicPlayerController__serverRepeatMode__block_invoke_2;
  v3[3] = &unk_1E31554D0;
  v3[4] = *(_QWORD *)(a1 + 32);
  return objc_msgSend(a2, "getRepeatModeWithReply:", v3);
}

uint64_t __44__MPMusicPlayerController__serverRepeatMode__block_invoke_2(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = a2;
  return result;
}

+ (MPMusicPlayerController)systemMusicPlayer
{
  if (systemMusicPlayer_onceToken != -1)
    dispatch_once(&systemMusicPlayer_onceToken, &__block_literal_global_12097);
  return (MPMusicPlayerController *)(id)systemMusicPlayer___systemMusicPlayer;
}

+ (MPMusicPlayerApplicationController)applicationQueuePlayer
{
  if (applicationQueuePlayer_onceToken != -1)
    dispatch_once(&applicationQueuePlayer_onceToken, &__block_literal_global_32);
  return (MPMusicPlayerApplicationController *)(id)applicationQueuePlayer___applicationMusicPlayer;
}

+ (MPMusicPlayerController)alloc
{
  objc_super v4;

  if ((id)objc_opt_class() == a1)
    return (MPMusicPlayerController *)[MPMusicPlayerSystemController alloc];
  v4.receiver = a1;
  v4.super_class = (Class)&OBJC_METACLASS___MPMusicPlayerController;
  return (MPMusicPlayerController *)objc_msgSendSuper2(&v4, sel_alloc);
}

void __49__MPMusicPlayerController_applicationQueuePlayer__block_invoke()
{
  MPMusicPlayerApplicationController *v0;
  void *v1;

  v0 = -[MPMusicPlayerApplicationController initWithClientIdentifier:queue:]([MPMusicPlayerApplicationController alloc], "initWithClientIdentifier:queue:", CFSTR("applicationQueuePlayer"), 0);
  v1 = (void *)applicationQueuePlayer___applicationMusicPlayer;
  applicationQueuePlayer___applicationMusicPlayer = (uint64_t)v0;

}

void __44__MPMusicPlayerController_systemMusicPlayer__block_invoke()
{
  MPMusicPlayerSystemController *v0;
  void *v1;

  v0 = -[MPMusicPlayerController initWithClientIdentifier:queue:]([MPMusicPlayerSystemController alloc], "initWithClientIdentifier:queue:", CFSTR("systemMusicPlayer"), 0);
  v1 = (void *)systemMusicPlayer___systemMusicPlayer;
  systemMusicPlayer___systemMusicPlayer = (uint64_t)v0;

}

@end
