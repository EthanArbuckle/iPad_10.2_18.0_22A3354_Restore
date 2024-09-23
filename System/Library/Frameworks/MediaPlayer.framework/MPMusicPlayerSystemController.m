@implementation MPMusicPlayerSystemController

- (int64_t)playbackState
{
  NSObject *v4;
  objc_super v5;
  uint8_t buf[16];

  if (self->super._connection || (MRMediaRemoteSystemMediaApplicationIsRunning() & 1) != 0)
  {
    v5.receiver = self;
    v5.super_class = (Class)MPMusicPlayerSystemController;
    return -[MPMusicPlayerController playbackState](&v5, sel_playbackState);
  }
  else if (-[MPMusicPlayerSystemController _shouldAccessCache](self, "_shouldAccessCache"))
  {
    v4 = os_log_create("com.apple.amp.mediaplayer", "SDKPlayback");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_193B9B000, v4, OS_LOG_TYPE_DEFAULT, "systemMusicPlayer playbackState returning paused due to cached data", buf, 2u);
    }

    return 2;
  }
  else
  {
    return 0;
  }
}

- (void)openToPlayQueueDescriptor:(id)a3
{
  id v4;
  NSObject *v5;
  os_signpost_id_t v6;
  NSObject *v7;
  NSObject *v8;
  NSObject *v9;
  NSObject *v10;
  _QWORD v11[6];
  uint8_t buf[16];

  v4 = a3;
  v5 = os_log_create("com.apple.amp.mediaplayer", "SDKPlayback");
  v6 = os_signpost_id_make_with_pointer(v5, v4);

  v7 = os_log_create("com.apple.amp.mediaplayer", "SDKPlayback");
  v8 = v7;
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_193B9B000, v8, OS_SIGNPOST_INTERVAL_BEGIN, v6, "openToPlayQueueDescriptor", (const char *)&unk_193F291C9, buf, 2u);
  }

  -[MPMusicPlayerController setQueueWithDescriptor:](self, "setQueueWithDescriptor:", v4);
  v9 = os_log_create("com.apple.amp.mediaplayer", "SDKPlayback");
  v10 = v9;
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_193B9B000, v10, OS_SIGNPOST_INTERVAL_BEGIN, v6, "openToPlayQueueDescriptor:prepare", (const char *)&unk_193F291C9, buf, 2u);
  }

  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __59__MPMusicPlayerSystemController_openToPlayQueueDescriptor___block_invoke;
  v11[3] = &unk_1E315ABF8;
  v11[4] = self;
  v11[5] = v6;
  -[MPMusicPlayerController prepareToPlayWithCompletionHandler:](self, "prepareToPlayWithCompletionHandler:", v11);

}

- (void)_establishConnectionIfNeeded
{
  os_unfair_lock_s *p_lock;
  NSXPCConnection *connection;
  NSObject *v5;
  os_signpost_id_t v6;
  NSObject *v7;
  NSObject *v8;
  unint64_t v9;
  NSObject *v10;
  int v11;
  NSObject *v12;
  NSXPCConnection *v13;
  NSXPCConnection *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  NSObject *v20;
  NSObject *v21;
  NSObject *v22;
  NSObject *v23;
  uint64_t v24;
  uint64_t v25;
  void (*v26)(uint64_t);
  void *v27;
  id v28;
  _QWORD v29[4];
  id v30;
  objc_super v31;
  id buf;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v31.receiver = self;
  v31.super_class = (Class)MPMusicPlayerSystemController;
  -[MPMusicPlayerController _establishConnectionIfNeeded](&v31, sel__establishConnectionIfNeeded);
  if (+[MPMediaLibrary authorizationStatus](MPMediaLibrary, "authorizationStatus") == MPMediaLibraryAuthorizationStatusAuthorized)
  {
    p_lock = &self->super._lock;
    os_unfair_lock_lock(&self->super._lock);
    connection = self->super._connection;
    if (connection)
    {
LABEL_3:
      v5 = os_log_create("com.apple.amp.mediaplayer", "SDKPlayback");
      v6 = os_signpost_id_generate(v5);

      v7 = os_log_create("com.apple.amp.mediaplayer", "SDKPlayback");
      v8 = v7;
      v9 = v6 - 1;
      if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
      {
        LOWORD(buf) = 0;
        _os_signpost_emit_with_name_impl(&dword_193B9B000, v8, OS_SIGNPOST_INTERVAL_BEGIN, v6, "systemMusicPlayer:connect", (const char *)&unk_193F291C9, (uint8_t *)&buf, 2u);
      }

      if (connection)
      {
        if ((MRMediaRemoteSystemMediaApplicationWake() & 1) == 0)
        {
          v10 = os_log_create("com.apple.amp.mediaplayer", "SDKPlayback");
          if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
          {
            LOWORD(buf) = 0;
            _os_log_impl(&dword_193B9B000, v10, OS_LOG_TYPE_ERROR, "systemMusicPlayer _establishConnectionIfNeeded timeout [ping did not pong]", (uint8_t *)&buf, 2u);
          }

          v11 = 0;
          goto LABEL_22;
        }
      }
      else
      {
        -[NSXPCConnection resume](self->super._connection, "resume");
        v19 = os_log_create("com.apple.amp.mediaplayer", "SDKPlayback");
        v20 = v19;
        if (v9 < 0xFFFFFFFFFFFFFFFELL && os_signpost_enabled(v19))
        {
          LOWORD(buf) = 0;
          _os_signpost_emit_with_name_impl(&dword_193B9B000, v20, OS_SIGNPOST_EVENT, v6, "systemMusicPlayer:connect", "resumed connection", (uint8_t *)&buf, 2u);
        }

        -[MPMusicPlayerController _validateServer](self, "_validateServer");
      }
      v11 = 1;
LABEL_22:
      v21 = os_log_create("com.apple.amp.mediaplayer", "SDKPlayback");
      v22 = v21;
      if (v9 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v21))
      {
        LODWORD(buf) = 67109120;
        HIDWORD(buf) = v11;
        _os_signpost_emit_with_name_impl(&dword_193B9B000, v22, OS_SIGNPOST_INTERVAL_END, v6, "systemMusicPlayer:connect", "woke=%{BOOL}u", (uint8_t *)&buf, 8u);
      }

      goto LABEL_32;
    }
    if ((MRMediaRemoteIsMusicAppInstalled() & 1) != 0)
    {
      if ((MRMediaRemoteSystemMediaApplicationWake() & 1) != 0)
      {
        v13 = (NSXPCConnection *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B38]), "initWithMachServiceName:options:", CFSTR("com.apple.Music.MPMusicPlayerControllerInternal"), 0);
        v14 = self->super._connection;
        self->super._connection = v13;

        objc_initWeak(&buf, self);
        v15 = MEMORY[0x1E0C809B0];
        v29[0] = MEMORY[0x1E0C809B0];
        v29[1] = 3221225472;
        v29[2] = __61__MPMusicPlayerSystemController__establishConnectionIfNeeded__block_invoke;
        v29[3] = &unk_1E315E5D0;
        objc_copyWeak(&v30, &buf);
        -[NSXPCConnection setInterruptionHandler:](self->super._connection, "setInterruptionHandler:", v29);
        v24 = v15;
        v25 = 3221225472;
        v26 = __61__MPMusicPlayerSystemController__establishConnectionIfNeeded__block_invoke_9;
        v27 = &unk_1E315E5D0;
        objc_copyWeak(&v28, &buf);
        -[NSXPCConnection setInvalidationHandler:](self->super._connection, "setInvalidationHandler:", &v24);
        objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE371C80, v24, v25, v26, v27);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSXPCConnection setRemoteObjectInterface:](self->super._connection, "setRemoteObjectInterface:", v16);

        objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE305FF8);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSXPCConnection setExportedInterface:](self->super._connection, "setExportedInterface:", v17);

        objc_msgSend(MEMORY[0x1E0D4D120], "proxyWithObject:protocol:", self, &unk_1EE305FF8);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSXPCConnection setExportedObject:](self->super._connection, "setExportedObject:", v18);

        objc_destroyWeak(&v28);
        objc_destroyWeak(&v30);
        objc_destroyWeak(&buf);
        goto LABEL_3;
      }
      v23 = os_log_create("com.apple.amp.mediaplayer", "SDKPlayback");
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        LOWORD(buf) = 0;
        _os_log_impl(&dword_193B9B000, v23, OS_LOG_TYPE_ERROR, "systemMusicPlayer _establishConnectionIfNeeded failed [application failed to launch]", (uint8_t *)&buf, 2u);
      }
    }
    else
    {
      v23 = os_log_create("com.apple.amp.mediaplayer", "SDKPlayback");
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        LOWORD(buf) = 0;
        _os_log_impl(&dword_193B9B000, v23, OS_LOG_TYPE_ERROR, "systemMusicPlayer _establishConnectionIfNeeded failed [application not installed]", (uint8_t *)&buf, 2u);
      }
    }

LABEL_32:
    os_unfair_lock_unlock(p_lock);
    return;
  }
  v12 = os_log_create("com.apple.amp.mediaplayer", "SDKPlayback");
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf) = 0;
    _os_log_impl(&dword_193B9B000, v12, OS_LOG_TYPE_DEFAULT, "systemMusicPlayer _establishConnectionIfNeeded failed [👮‍♂️ denied due to authorization status]", (uint8_t *)&buf, 2u);
  }

}

- (id)_queueDescriptor
{
  void *v4;
  void *v5;
  objc_super v6;

  if (self->super._connection || (MRMediaRemoteSystemMediaApplicationIsRunning() & 1) != 0)
  {
    v6.receiver = self;
    v6.super_class = (Class)MPMusicPlayerSystemController;
    -[MPMusicPlayerController _queueDescriptor](&v6, sel__queueDescriptor);
    return (id)objc_claimAutoreleasedReturnValue();
  }
  else if (-[MPMusicPlayerSystemController _shouldAccessCache](self, "_shouldAccessCache"))
  {
    +[MPMusicPlayerControllerSystemCache sharedCache](MPMusicPlayerControllerSystemCache, "sharedCache");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "queueDescriptor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    return v5;
  }
  else
  {
    return 0;
  }
}

- (id)_nowPlaying
{
  void *v4;
  void *v5;
  objc_super v6;

  if (self->super._connection || (MRMediaRemoteSystemMediaApplicationIsRunning() & 1) != 0)
  {
    v6.receiver = self;
    v6.super_class = (Class)MPMusicPlayerSystemController;
    -[MPMusicPlayerController _nowPlaying](&v6, sel__nowPlaying);
    return (id)objc_claimAutoreleasedReturnValue();
  }
  else if (-[MPMusicPlayerSystemController _shouldAccessCache](self, "_shouldAccessCache"))
  {
    +[MPMusicPlayerControllerSystemCache sharedCache](MPMusicPlayerControllerSystemCache, "sharedCache");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "nowPlaying");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    return v5;
  }
  else
  {
    return 0;
  }
}

- (BOOL)_shouldAccessCache
{
  void *v2;
  int v3;

  if (!self->super._connection
    && +[MPMediaLibrary authorizationStatus](MPMediaLibrary, "authorizationStatus") == MPMediaLibraryAuthorizationStatusAuthorized
    && (+[MPMusicPlayerControllerSystemCache sharedCache](MPMusicPlayerControllerSystemCache, "sharedCache"), v2 = (void *)objc_claimAutoreleasedReturnValue(), v3 = objc_msgSend(v2, "hasCachedData"), v2, v3))
  {
    return MRMediaRemoteIsMusicAppInstalled();
  }
  else
  {
    return 0;
  }
}

- (void)onSystemServer:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __48__MPMusicPlayerSystemController_onSystemServer___block_invoke;
  v6[3] = &unk_1E315AC28;
  v7 = v4;
  v5 = v4;
  -[MPMusicPlayerController onServer:](self, "onServer:", v6);

}

uint64_t __48__MPMusicPlayerSystemController_onSystemServer___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __61__MPMusicPlayerSystemController__establishConnectionIfNeeded__block_invoke(uint64_t a1)
{
  NSObject *v2;
  id WeakRetained;
  uint8_t v4[16];

  v2 = os_log_create("com.apple.amp.mediaplayer", "SDKPlayback");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_193B9B000, v2, OS_LOG_TYPE_ERROR, "systemMusicPlayer connection interrupted", v4, 2u);
  }

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_clearConnection");

}

void __61__MPMusicPlayerSystemController__establishConnectionIfNeeded__block_invoke_9(uint64_t a1)
{
  NSObject *v2;
  id WeakRetained;
  uint8_t v4[16];

  v2 = os_log_create("com.apple.amp.mediaplayer", "SDKPlayback");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_193B9B000, v2, OS_LOG_TYPE_ERROR, "systemMusicPlayer connection invalidated", v4, 2u);
  }

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_clearConnection");

}

void __59__MPMusicPlayerSystemController_openToPlayQueueDescriptor___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  os_signpost_id_t v6;
  NSObject *v7;
  NSObject *v8;
  NSObject *v9;
  NSObject *v10;
  os_signpost_id_t v11;
  os_signpost_id_t v12;
  uint64_t v13;
  _QWORD v14[6];
  uint8_t buf[4];
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = os_log_create("com.apple.amp.mediaplayer", "SDKPlayback");
  v5 = v4;
  v6 = *(_QWORD *)(a1 + 40);
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_193B9B000, v5, OS_SIGNPOST_INTERVAL_END, v6, "openToPlayQueueDescriptor:prepare", (const char *)&unk_193F291C9, buf, 2u);
  }

  v7 = os_log_create("com.apple.amp.mediaplayer", "SDKPlayback");
  v8 = v7;
  if (v3)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v16 = v3;
      _os_log_impl(&dword_193B9B000, v8, OS_LOG_TYPE_ERROR, "openToPlayQueueDescriptor: failed [prepare failed] error=%{public}@", buf, 0xCu);
    }

    v9 = os_log_create("com.apple.amp.mediaplayer", "SDKPlayback");
    v10 = v9;
    v11 = *(_QWORD *)(a1 + 40);
    if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
    {
      *(_DWORD *)buf = 138543362;
      v16 = v3;
      _os_signpost_emit_with_name_impl(&dword_193B9B000, v10, OS_SIGNPOST_INTERVAL_END, v11, "openToPlayQueueDescriptor", "error=%{public}@", buf, 0xCu);
    }
  }
  else
  {
    v12 = *(_QWORD *)(a1 + 40);
    if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_193B9B000, v8, OS_SIGNPOST_INTERVAL_BEGIN, v12, "openToPlayQueueDescriptor:openURL", (const char *)&unk_193F291C9, buf, 2u);
    }

    objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", CFSTR("music://show-now-playing"));
    v10 = objc_claimAutoreleasedReturnValue();
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __59__MPMusicPlayerSystemController_openToPlayQueueDescriptor___block_invoke_1;
    v14[3] = &unk_1E315ABD0;
    v13 = *(_QWORD *)(a1 + 40);
    v14[4] = *(_QWORD *)(a1 + 32);
    v14[5] = v13;
    MPUIApplicationOpenURL(v10, MEMORY[0x1E0C9AA70], v14);
  }

}

void __59__MPMusicPlayerSystemController_openToPlayQueueDescriptor___block_invoke_1(uint64_t a1, int a2)
{
  NSObject *v4;
  NSObject *v5;
  os_signpost_id_t v6;
  NSObject *v7;
  NSObject *v8;
  os_signpost_id_t v9;
  const char *v10;
  NSObject *v11;
  NSObject *v12;
  _DWORD v13[2];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = os_log_create("com.apple.amp.mediaplayer", "SDKPlayback");
  v5 = v4;
  v6 = *(_QWORD *)(a1 + 40);
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    v13[0] = 67109120;
    v13[1] = a2;
    _os_signpost_emit_with_name_impl(&dword_193B9B000, v5, OS_SIGNPOST_INTERVAL_END, v6, "openToPlayQueueDescriptor:openURL", "success=%{BOOL}u", (uint8_t *)v13, 8u);
  }

  if ((a2 & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "play");
    v7 = os_log_create("com.apple.amp.mediaplayer", "SDKPlayback");
    v8 = v7;
    v9 = *(_QWORD *)(a1 + 40);
    if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
    {
      LOWORD(v13[0]) = 0;
      v10 = (const char *)&unk_193F291C9;
LABEL_13:
      _os_signpost_emit_with_name_impl(&dword_193B9B000, v8, OS_SIGNPOST_INTERVAL_END, v9, "openToPlayQueueDescriptor", v10, (uint8_t *)v13, 2u);
    }
  }
  else
  {
    v11 = os_log_create("com.apple.amp.mediaplayer", "SDKPlayback");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v13[0]) = 0;
      _os_log_impl(&dword_193B9B000, v11, OS_LOG_TYPE_ERROR, "openToPlayQueueDescriptor: failed [open URL failed]", (uint8_t *)v13, 2u);
    }

    v12 = os_log_create("com.apple.amp.mediaplayer", "SDKPlayback");
    v8 = v12;
    v9 = *(_QWORD *)(a1 + 40);
    if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
    {
      LOWORD(v13[0]) = 0;
      v10 = "failed to open URL";
      goto LABEL_13;
    }
  }

}

@end
