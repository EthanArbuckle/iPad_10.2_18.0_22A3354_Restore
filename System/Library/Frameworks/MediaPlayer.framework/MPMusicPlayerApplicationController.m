@implementation MPMusicPlayerApplicationController

- (MPMusicPlayerApplicationController)initWithClientIdentifier:(id)a3 queue:(id)a4
{
  MPMusicPlayerApplicationController *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MPMusicPlayerApplicationController;
  result = -[MPMusicPlayerController initWithClientIdentifier:queue:](&v5, sel_initWithClientIdentifier_queue_, a3, a4);
  if (result)
    *(&result->_disableAutoPlay + 4) = 1;
  return result;
}

- (void)dealloc
{
  objc_super v3;

  -[NSXPCConnection invalidate](self->_serviceConnection, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)MPMusicPlayerApplicationController;
  -[MPMusicPlayerController dealloc](&v3, sel_dealloc);
}

- (void)beginGeneratingPlaybackNotifications
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)MPMusicPlayerApplicationController;
  -[MPMusicPlayerController beginGeneratingPlaybackNotifications](&v4, sel_beginGeneratingPlaybackNotifications);
  -[NSXPCConnection remoteObjectProxy](self->_serviceConnection, "remoteObjectProxy");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setWantsReverseProcessAssertion:", -[MPMusicPlayerController notificationsCounter](self, "notificationsCounter") > 0);

}

- (void)endGeneratingPlaybackNotifications
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)MPMusicPlayerApplicationController;
  -[MPMusicPlayerController endGeneratingPlaybackNotifications](&v4, sel_endGeneratingPlaybackNotifications);
  -[NSXPCConnection remoteObjectProxy](self->_serviceConnection, "remoteObjectProxy");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setWantsReverseProcessAssertion:", -[MPMusicPlayerController notificationsCounter](self, "notificationsCounter") > 0);

}

- (void)performQueueTransaction:(void *)queueTransaction completionHandler:(void *)completionHandler
{
  void (**v6)(void *, MPMusicPlayerControllerMutableQueue *);
  void *v7;
  MPMusicPlayerControllerMutableQueue *v8;
  void *v9;
  id v10;
  uint64_t v11;
  id v12;
  id v13;
  _QWORD v14[5];
  id v15;
  _QWORD v16[4];
  id v17;
  MPMusicPlayerApplicationController *v18;
  id v19;
  id location;

  v6 = queueTransaction;
  v7 = completionHandler;
  v8 = -[MPMusicPlayerControllerMutableQueue initWithController:]([MPMusicPlayerControllerMutableQueue alloc], "initWithController:", self);
  objc_initWeak(&location, v8);
  v6[2](v6, v8);
  -[MPMusicPlayerControllerMutableQueue modifications](v8, "modifications");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = objc_loadWeakRetained(&location);
  objc_msgSend(v10, "fault");

  v11 = MEMORY[0x1E0C809B0];
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __80__MPMusicPlayerApplicationController_performQueueTransaction_completionHandler___block_invoke;
  v16[3] = &unk_1E3156C48;
  v12 = v9;
  v17 = v12;
  v18 = self;
  v19 = v7;
  v14[0] = v11;
  v14[1] = 3221225472;
  v14[2] = __80__MPMusicPlayerApplicationController_performQueueTransaction_completionHandler___block_invoke_4;
  v14[3] = &unk_1E3161878;
  v14[4] = self;
  v13 = v19;
  v15 = v13;
  -[MPMusicPlayerApplicationController onApplicationServerAsync:errorHandler:](self, "onApplicationServerAsync:errorHandler:", v16, v14);

  objc_destroyWeak(&location);
}

- (void)setDisableAutoPlay:(BOOL)a3
{
  int v3;
  _QWORD v4[4];
  char v5;

  v3 = *((unsigned __int8 *)&self->_disableAutoPlay + 4);
  if (v3 == a3)
  {
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __57__MPMusicPlayerApplicationController_setDisableAutoPlay___block_invoke;
    v4[3] = &__block_descriptor_33_e52_v16__0___MPMusicPlayerControllerApplicationServer__8l;
    v5 = v3;
    -[MPMusicPlayerApplicationController onApplicationServer:](self, "onApplicationServer:", v4);
  }
}

- (void)setDisableRepeat:(BOOL)a3
{
  int v3;
  _QWORD v4[4];
  char v5;

  v3 = *((unsigned __int8 *)&self->_disableAutoPlay + 3);
  if (v3 == a3)
  {
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __55__MPMusicPlayerApplicationController_setDisableRepeat___block_invoke;
    v4[3] = &__block_descriptor_33_e52_v16__0___MPMusicPlayerControllerApplicationServer__8l;
    v5 = v3;
    -[MPMusicPlayerApplicationController onApplicationServer:](self, "onApplicationServer:", v4);
  }
}

- (void)setDisableShuffle:(BOOL)a3
{
  int v3;
  _QWORD v4[4];
  char v5;

  v3 = *((unsigned __int8 *)&self->_disableAutoPlay + 2);
  if (v3 == a3)
  {
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __56__MPMusicPlayerApplicationController_setDisableShuffle___block_invoke;
    v4[3] = &__block_descriptor_33_e52_v16__0___MPMusicPlayerControllerApplicationServer__8l;
    v5 = v3;
    -[MPMusicPlayerApplicationController onApplicationServer:](self, "onApplicationServer:", v4);
  }
}

- (void)_setApplicationMusicPlayerTransitionType:(int64_t)a3 withDuration:(double)a4
{
  void *v6;
  _QWORD v7[5];

  if (a3)
  {
    self->_transitionType = a3;
    if (a3 == 1)
      self->_crossFadeDuration = a4;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MPMusicPlayerApplicationController.m"), 177, CFSTR("Duration cannot be passed in with TransitionTypeNone"));

    self->_transitionType = 0;
  }
  if (self->super._connection)
  {
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __92__MPMusicPlayerApplicationController__setApplicationMusicPlayerTransitionType_withDuration___block_invoke;
    v7[3] = &unk_1E3156C90;
    v7[4] = self;
    -[MPMusicPlayerApplicationController onApplicationServer:](self, "onApplicationServer:", v7);
  }
}

- (void)_setApplicationMusicPlayerTransitionType:(int64_t)a3
{
  _QWORD v3[5];

  self->_transitionType = a3;
  if (a3 == 1)
    self->_crossFadeDuration = 4.0;
  if (self->super._connection)
  {
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __79__MPMusicPlayerApplicationController__setApplicationMusicPlayerTransitionType___block_invoke;
    v3[3] = &unk_1E3156C90;
    v3[4] = self;
    -[MPMusicPlayerApplicationController onApplicationServer:](self, "onApplicationServer:", v3);
  }
}

- (void)prerollWithCompletion:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  _QWORD v7[4];
  id v8;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  v5 = MEMORY[0x1E0C809B0];
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __60__MPMusicPlayerApplicationController_prerollWithCompletion___block_invoke;
  v9[3] = &unk_1E3156CE0;
  v10 = v4;
  v7[0] = v5;
  v7[1] = 3221225472;
  v7[2] = __60__MPMusicPlayerApplicationController_prerollWithCompletion___block_invoke_3;
  v7[3] = &unk_1E31624C0;
  v8 = v10;
  v6 = v10;
  -[MPMusicPlayerApplicationController onApplicationServerAsync:errorHandler:](self, "onApplicationServerAsync:errorHandler:", v9, v7);

}

- (void)beginPlaybackAtHostTime:(id *)a3
{
  _QWORD v3[4];
  $3CC8671D27C23BF42ADDB32F2B5E48AE v4;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __62__MPMusicPlayerApplicationController_beginPlaybackAtHostTime___block_invoke;
  v3[3] = &__block_descriptor_56_e61_v24__0___MPMusicPlayerControllerApplicationServer__8___B___16l;
  v4 = *a3;
  -[MPMusicPlayerApplicationController onApplicationServerAsync:errorHandler:](self, "onApplicationServerAsync:errorHandler:", v3, &__block_literal_global_16208);
}

- (void)setRelativeVolume:(float)a3
{
  float v3;
  _QWORD v4[4];
  float v5;

  v3 = fminf(a3, 1.0);
  if (v3 < 0.0)
    v3 = 0.0;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __56__MPMusicPlayerApplicationController_setRelativeVolume___block_invoke;
  v4[3] = &__block_descriptor_36_e52_v16__0___MPMusicPlayerControllerApplicationServer__8l;
  v5 = v3;
  -[MPMusicPlayerApplicationController onApplicationServer:](self, "onApplicationServer:", v4);
}

- (void)setDisableAutomaticCanBeNowPlaying:(BOOL)a3
{
  _QWORD v3[4];
  BOOL v4;

  *(&self->_disableAutoPlay + 1) = a3;
  if (self->super._connection)
  {
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __73__MPMusicPlayerApplicationController_setDisableAutomaticCanBeNowPlaying___block_invoke;
    v3[3] = &__block_descriptor_33_e52_v16__0___MPMusicPlayerControllerApplicationServer__8l;
    v4 = a3;
    -[MPMusicPlayerApplicationController onApplicationServer:](self, "onApplicationServer:", v3);
  }
}

- (id)_mediaItemsForContentItemIDs:(id)a3
{
  id v4;
  NSObject *v5;
  os_signpost_id_t v6;
  NSObject *v7;
  NSObject *v8;
  unint64_t v9;
  NSObject *v10;
  uint64_t v11;
  id v12;
  id v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  NSObject *v22;
  NSObject *v23;
  os_signpost_id_t spid;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _QWORD v30[4];
  id v31;
  _BYTE *v32;
  uint8_t v33[4];
  os_signpost_id_t v34;
  uint8_t v35[128];
  _BYTE buf[24];
  uint64_t (*v37)(uint64_t, uint64_t);
  void (*v38)(uint64_t);
  id v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = os_log_create("com.apple.amp.mediaplayer", "SDKPlayback");
  v6 = os_signpost_id_generate(v5);

  v7 = os_log_create("com.apple.amp.mediaplayer", "SDKPlayback");
  v8 = v7;
  spid = v6;
  v9 = v6 - 1;
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    *(_DWORD *)buf = 134217984;
    *(_QWORD *)&buf[4] = objc_msgSend(v4, "count");
    _os_signpost_emit_with_name_impl(&dword_193B9B000, v8, OS_SIGNPOST_INTERVAL_BEGIN, v6, "_mediaItemsForContentItemIDs", "contentItemIDs.count=%llu", buf, 0xCu);
  }

  v10 = os_log_create("com.apple.amp.mediaplayer", "SDKPlayback");
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    v11 = objc_msgSend(v4, "count");
    *(_DWORD *)buf = 134218240;
    *(_QWORD *)&buf[4] = v6;
    *(_WORD *)&buf[12] = 2048;
    *(_QWORD *)&buf[14] = v11;
    _os_log_impl(&dword_193B9B000, v10, OS_LOG_TYPE_DEBUG, "BEGIN [%lld]: _mediaItemsForContentItemIDs contentItemIDs.count=%llu", buf, 0x16u);
  }

  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x3032000000;
  v37 = __Block_byref_object_copy__16197;
  v38 = __Block_byref_object_dispose__16198;
  v39 = 0;
  v30[0] = MEMORY[0x1E0C809B0];
  v30[1] = 3221225472;
  v30[2] = __67__MPMusicPlayerApplicationController__mediaItemsForContentItemIDs___block_invoke;
  v30[3] = &unk_1E3156D90;
  v12 = v4;
  v31 = v12;
  v32 = buf;
  -[MPMusicPlayerApplicationController onApplicationServer:](self, "onApplicationServer:", v30);
  v13 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  v14 = *(id *)(*(_QWORD *)&buf[8] + 40);
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v26, v35, 16);
  if (v15)
  {
    v16 = *(_QWORD *)v27;
    do
    {
      for (i = 0; i != v15; ++i)
      {
        if (*(_QWORD *)v27 != v16)
          objc_enumerationMutation(v14);
        v18 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * i);
        objc_msgSend(v18, "itemIdentifier");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        if (v19)
        {
          -[MPMusicPlayerController _mediaItemFromNowPlaying:](self, "_mediaItemFromNowPlaying:", v18);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          if (v20)
            objc_msgSend(v13, "setObject:forKey:", v20, v19);

        }
      }
      v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v26, v35, 16);
    }
    while (v15);
  }

  v21 = os_log_create("com.apple.amp.mediaplayer", "SDKPlayback");
  v22 = v21;
  if (v9 < 0xFFFFFFFFFFFFFFFELL && os_signpost_enabled(v21))
  {
    *(_WORD *)v33 = 0;
    _os_signpost_emit_with_name_impl(&dword_193B9B000, v22, OS_SIGNPOST_INTERVAL_END, spid, "_mediaItemsForContentItemIDs", (const char *)&unk_193F291C9, v33, 2u);
  }

  v23 = os_log_create("com.apple.amp.mediaplayer", "SDKPlayback");
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)v33 = 134217984;
    v34 = spid;
    _os_log_impl(&dword_193B9B000, v23, OS_LOG_TYPE_DEBUG, "END [%lld]: _mediaItemsForContentItemIDs ", v33, 0xCu);
  }

  _Block_object_dispose(buf, 8);
  return v13;
}

- (void)_clearConnection
{
  NSXPCConnection *serviceConnection;
  objc_super v4;

  serviceConnection = self->_serviceConnection;
  self->_serviceConnection = 0;

  v4.receiver = self;
  v4.super_class = (Class)MPMusicPlayerApplicationController;
  -[MPMusicPlayerController _clearConnection](&v4, sel__clearConnection);
}

- (void)_establishConnectionIfNeeded
{
  NSXPCConnection *connection;
  NSObject *v4;
  char *v5;
  NSObject *v6;
  NSObject *v7;
  unint64_t v8;
  NSObject *v9;
  NSXPCConnection *v10;
  NSXPCConnection *serviceConnection;
  void *v12;
  uint64_t v13;
  NSObject *v14;
  NSObject *v15;
  NSObject *v16;
  void *v17;
  NSObject *v18;
  NSObject *v19;
  NSObject *v20;
  char v21;
  NSObject *v22;
  NSObject *v23;
  NSObject *v24;
  NSObject *v25;
  NSObject *v26;
  NSObject *v27;
  NSObject *v28;
  NSXPCConnection *v29;
  uint64_t v30;
  void *v31;
  NSObject *v32;
  NSObject *v33;
  NSObject *v34;
  NSObject *v35;
  _QWORD v36[5];
  id v37[2];
  _QWORD v38[5];
  _QWORD v39[4];
  id v40;
  _QWORD v41[4];
  id v42;
  id location;
  objc_super v44;
  uint8_t buf[4];
  char *v46;
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v44.receiver = self;
  v44.super_class = (Class)MPMusicPlayerApplicationController;
  -[MPMusicPlayerController _establishConnectionIfNeeded](&v44, sel__establishConnectionIfNeeded);
  if (+[MPMediaLibrary authorizationStatus](MPMediaLibrary, "authorizationStatus") == MPMediaLibraryAuthorizationStatusAuthorized)
  {
    os_unfair_lock_lock(&self->super._lock);
    connection = self->super._connection;
    objc_initWeak(&location, self);
    v4 = os_log_create("com.apple.amp.mediaplayer", "SDKPlayback");
    v5 = (char *)os_signpost_id_generate(v4);

    v6 = os_log_create("com.apple.amp.mediaplayer", "SDKPlayback");
    v7 = v6;
    v8 = (unint64_t)(v5 - 1);
    if ((unint64_t)(v5 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v6))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_193B9B000, v7, OS_SIGNPOST_INTERVAL_BEGIN, (os_signpost_id_t)v5, "applicationQueuePlayer:xpc:connect", (const char *)&unk_193F291C9, buf, 2u);
    }

    v9 = os_log_create("com.apple.amp.mediaplayer", "SDKPlayback");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134217984;
      v46 = v5;
      _os_log_impl(&dword_193B9B000, v9, OS_LOG_TYPE_DEBUG, "BEGIN [%lld]: applicationQueuePlayer:xpc:connect ", buf, 0xCu);
    }

    if (!self->_serviceConnection)
    {
      v10 = (NSXPCConnection *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B38]), "initWithServiceName:", CFSTR("com.apple.MediaPlayer.RemotePlayerService"));
      serviceConnection = self->_serviceConnection;
      self->_serviceConnection = v10;

      objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE371C20);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSXPCConnection setRemoteObjectInterface:](self->_serviceConnection, "setRemoteObjectInterface:", v12);

      v13 = MEMORY[0x1E0C809B0];
      v41[0] = MEMORY[0x1E0C809B0];
      v41[1] = 3221225472;
      v41[2] = __66__MPMusicPlayerApplicationController__establishConnectionIfNeeded__block_invoke_153;
      v41[3] = &unk_1E315E5D0;
      objc_copyWeak(&v42, &location);
      -[NSXPCConnection setInterruptionHandler:](self->_serviceConnection, "setInterruptionHandler:", v41);
      v39[0] = v13;
      v39[1] = 3221225472;
      v39[2] = __66__MPMusicPlayerApplicationController__establishConnectionIfNeeded__block_invoke_154;
      v39[3] = &unk_1E315E5D0;
      objc_copyWeak(&v40, &location);
      -[NSXPCConnection setInvalidationHandler:](self->_serviceConnection, "setInvalidationHandler:", v39);
      -[NSXPCConnection resume](self->_serviceConnection, "resume");
      v14 = os_log_create("com.apple.amp.mediaplayer", "SDKPlayback");
      v15 = v14;
      if (v8 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v14))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_193B9B000, v15, OS_SIGNPOST_EVENT, (os_signpost_id_t)v5, "applicationQueuePlayer:xpc:connect", "resumed connection", buf, 2u);
      }

      v16 = os_log_create("com.apple.amp.mediaplayer", "SDKPlayback");
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 134217984;
        v46 = v5;
        _os_log_impl(&dword_193B9B000, v16, OS_LOG_TYPE_DEBUG, "EVENT [%lld]: applicationQueuePlayer:xpc:connect resumed connection", buf, 0xCu);
      }

      if (-[MPMusicPlayerController notificationsCounter](self, "notificationsCounter") >= 1)
      {
        -[NSXPCConnection remoteObjectProxy](self->_serviceConnection, "remoteObjectProxy");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "setWantsReverseProcessAssertion:", 1);

      }
      objc_destroyWeak(&v40);
      objc_destroyWeak(&v42);
    }
    v18 = os_log_create("com.apple.amp.mediaplayer", "SDKPlayback");
    v19 = v18;
    if (v8 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v18))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_193B9B000, v19, OS_SIGNPOST_INTERVAL_BEGIN, (os_signpost_id_t)v5, "applicationQueuePlayer:xpc:connect:wake", (const char *)&unk_193F291C9, buf, 2u);
    }

    v20 = os_log_create("com.apple.amp.mediaplayer", "SDKPlayback");
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134217984;
      v46 = v5;
      _os_log_impl(&dword_193B9B000, v20, OS_LOG_TYPE_DEBUG, "BEGIN [%lld]: applicationQueuePlayer:xpc:connect:wake ", buf, 0xCu);
    }

    v21 = MRMediaRemoteNowPlayingWakePlayerServiceProcess();
    v22 = os_log_create("com.apple.amp.mediaplayer", "SDKPlayback");
    v23 = v22;
    if (v8 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v22))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_193B9B000, v23, OS_SIGNPOST_INTERVAL_END, (os_signpost_id_t)v5, "applicationQueuePlayer:xpc:connect:wake", (const char *)&unk_193F291C9, buf, 2u);
    }

    v24 = os_log_create("com.apple.amp.mediaplayer", "SDKPlayback");
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134217984;
      v46 = v5;
      _os_log_impl(&dword_193B9B000, v24, OS_LOG_TYPE_DEBUG, "END [%lld]: applicationQueuePlayer:xpc:connect:wake ", buf, 0xCu);
    }

    if ((v21 & 1) == 0)
    {
      v25 = os_log_create("com.apple.amp.mediaplayer", "SDKPlayback");
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_193B9B000, v25, OS_LOG_TYPE_ERROR, "applicationQueuePlayer _establishConnectionIfNeeded timeout [ping did not pong]", buf, 2u);
      }

    }
    if (!self->super._connection)
    {
      v26 = os_log_create("com.apple.amp.mediaplayer", "SDKPlayback");
      v27 = v26;
      if (v8 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v26))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_193B9B000, v27, OS_SIGNPOST_INTERVAL_BEGIN, (os_signpost_id_t)v5, "applicationMusicPlayer:connect", (const char *)&unk_193F291C9, buf, 2u);
      }

      v28 = os_log_create("com.apple.amp.mediaplayer", "SDKPlayback");
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 134217984;
        v46 = v5;
        _os_log_impl(&dword_193B9B000, v28, OS_LOG_TYPE_DEBUG, "BEGIN [%lld]: applicationMusicPlayer:connect ", buf, 0xCu);
      }

      v29 = self->_serviceConnection;
      v30 = MEMORY[0x1E0C809B0];
      v38[0] = MEMORY[0x1E0C809B0];
      v38[1] = 3221225472;
      v38[2] = __66__MPMusicPlayerApplicationController__establishConnectionIfNeeded__block_invoke_155;
      v38[3] = &__block_descriptor_40_e17_v16__0__NSError_8l;
      v38[4] = v5;
      -[NSXPCConnection synchronousRemoteObjectProxyWithErrorHandler:](v29, "synchronousRemoteObjectProxyWithErrorHandler:", v38);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v36[0] = v30;
      v36[1] = 3221225472;
      v36[2] = __66__MPMusicPlayerApplicationController__establishConnectionIfNeeded__block_invoke_157;
      v36[3] = &unk_1E3156DD8;
      v36[4] = self;
      objc_copyWeak(v37, &location);
      v37[1] = v5;
      objc_msgSend(v31, "getServerEndpointWithReply:", v36);

      objc_destroyWeak(v37);
    }
    v32 = os_log_create("com.apple.amp.mediaplayer", "SDKPlayback");
    v33 = v32;
    if (v8 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v32))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_193B9B000, v33, OS_SIGNPOST_INTERVAL_END, (os_signpost_id_t)v5, "applicationQueuePlayer:xpc:connect", (const char *)&unk_193F291C9, buf, 2u);
    }

    v34 = os_log_create("com.apple.amp.mediaplayer", "SDKPlayback");
    if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134217984;
      v46 = v5;
      _os_log_impl(&dword_193B9B000, v34, OS_LOG_TYPE_DEBUG, "END [%lld]: applicationQueuePlayer:xpc:connect ", buf, 0xCu);
    }

    if (connection)
    {
      os_unfair_lock_unlock(&self->super._lock);
    }
    else
    {
      -[MPMusicPlayerController _validateServer](self, "_validateServer");
      os_unfair_lock_unlock(&self->super._lock);
      if (self->super._connection)
      {
        if (*(&self->_disableAutoPlay + 1))
          -[MPMusicPlayerApplicationController setDisableAutomaticCanBeNowPlaying:](self, "setDisableAutomaticCanBeNowPlaying:", 1);
        if (self->_transitionType == 1)
          -[MPMusicPlayerApplicationController _setApplicationMusicPlayerTransitionType:withDuration:](self, "_setApplicationMusicPlayerTransitionType:withDuration:", self->_crossFadeDuration);
        else
          -[MPMusicPlayerApplicationController _setApplicationMusicPlayerTransitionType:](self, "_setApplicationMusicPlayerTransitionType:");
      }
    }
    objc_destroyWeak(&location);
  }
  else
  {
    v35 = os_log_create("com.apple.amp.mediaplayer", "SDKPlayback");
    if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_193B9B000, v35, OS_LOG_TYPE_DEFAULT, "applicationMusicPlayer _establishConnectionIfNeeded failed [👮‍♂️ denied due to authorization status]", buf, 2u);
    }

  }
}

- (void)onApplicationServerAsync:(id)a3 errorHandler:(id)a4
{
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v6 = a3;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __76__MPMusicPlayerApplicationController_onApplicationServerAsync_errorHandler___block_invoke;
  v8[3] = &unk_1E3156E00;
  v9 = v6;
  v7 = v6;
  -[MPMusicPlayerController onServerAsync:errorHandler:](self, "onServerAsync:errorHandler:", v8, a4);

}

- (void)onApplicationServer:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __58__MPMusicPlayerApplicationController_onApplicationServer___block_invoke;
  v6[3] = &unk_1E315AC28;
  v7 = v4;
  v5 = v4;
  -[MPMusicPlayerController onServer:](self, "onServer:", v6);

}

- (NSXPCConnection)serviceConnection
{
  return self->_serviceConnection;
}

- (BOOL)disableAutomaticCanBeNowPlaying
{
  return *(&self->_disableAutoPlay + 1);
}

- (int64_t)transitionType
{
  return self->_transitionType;
}

- (void)setTransitionType:(int64_t)a3
{
  self->_transitionType = a3;
}

- (double)crossFadeDuration
{
  return self->_crossFadeDuration;
}

- (void)setCrossFadeDuration:(double)a3
{
  self->_crossFadeDuration = a3;
}

- (BOOL)disableShuffle
{
  return *(&self->_disableAutoPlay + 2);
}

- (BOOL)disableRepeat
{
  return *(&self->_disableAutoPlay + 3);
}

- (BOOL)disableAutoPlay
{
  return *(&self->_disableAutoPlay + 4);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serviceConnection, 0);
}

uint64_t __58__MPMusicPlayerApplicationController_onApplicationServer___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __76__MPMusicPlayerApplicationController_onApplicationServerAsync_errorHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __66__MPMusicPlayerApplicationController__establishConnectionIfNeeded__block_invoke_153(uint64_t a1)
{
  id WeakRetained;
  NSObject *v2;
  uint8_t v3[16];

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = os_log_create("com.apple.amp.mediaplayer", "SDKPlayback");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_193B9B000, v2, OS_LOG_TYPE_ERROR, "applicationController: xpc service connection interrupted", v3, 2u);
  }

  objc_msgSend(WeakRetained, "_clearConnection");
}

void __66__MPMusicPlayerApplicationController__establishConnectionIfNeeded__block_invoke_154(uint64_t a1)
{
  id WeakRetained;
  NSObject *v2;
  uint8_t v3[16];

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = os_log_create("com.apple.amp.mediaplayer", "SDKPlayback");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_193B9B000, v2, OS_LOG_TYPE_ERROR, "applicationController: xpc service connection invalidated", v3, 2u);
  }

  objc_msgSend(WeakRetained, "_clearConnection");
}

void __66__MPMusicPlayerApplicationController__establishConnectionIfNeeded__block_invoke_155(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  NSObject *v6;
  os_signpost_id_t v7;
  NSObject *v8;
  void *v9;
  int v10;
  id v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = os_log_create("com.apple.amp.mediaplayer", "SDKPlayback");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    v10 = 138543362;
    v11 = v3;
    _os_log_impl(&dword_193B9B000, v4, OS_LOG_TYPE_ERROR, "applicationMusicPlayer: failed to get synchronousRemoteObject %{public}@", (uint8_t *)&v10, 0xCu);
  }

  v5 = os_log_create("com.apple.amp.mediaplayer", "SDKPlayback");
  v6 = v5;
  v7 = *(_QWORD *)(a1 + 32);
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    v10 = 138543362;
    v11 = v3;
    _os_signpost_emit_with_name_impl(&dword_193B9B000, v6, OS_SIGNPOST_INTERVAL_END, v7, "applicationMusicPlayer:connect", "error=%{public}@", (uint8_t *)&v10, 0xCu);
  }

  v8 = os_log_create("com.apple.amp.mediaplayer", "SDKPlayback");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    v9 = *(void **)(a1 + 32);
    v10 = 134218242;
    v11 = v9;
    v12 = 2114;
    v13 = v3;
    _os_log_impl(&dword_193B9B000, v8, OS_LOG_TYPE_DEBUG, "END [%lld]: applicationMusicPlayer:connect error=%{public}@", (uint8_t *)&v10, 0x16u);
  }

}

void __66__MPMusicPlayerApplicationController__establishConnectionIfNeeded__block_invoke_157(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  NSObject *v19;
  os_signpost_id_t v20;
  NSObject *v21;
  uint64_t v22;
  _QWORD v23[4];
  id v24;
  uint8_t buf[4];
  uint64_t v26;
  _QWORD v27[3];
  _QWORD v28[3];

  v28[2] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B38]), "initWithListenerEndpoint:", v3);
  v5 = *(_QWORD *)(a1 + 32);
  v6 = *(void **)(v5 + 32);
  *(_QWORD *)(v5 + 32) = v4;

  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE371BC0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "setRemoteObjectInterface:", v7);

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "remoteObjectInterface");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)MEMORY[0x1E0C99E60];
  v28[0] = objc_opt_class();
  v28[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v28, 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setWithArray:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setClasses:forSelector:argumentIndex:ofReply:", v11, sel_getNowPlayingsForContentItemIDs_reply_, 0, 1);

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "remoteObjectInterface");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)MEMORY[0x1E0C99E60];
  v27[0] = objc_opt_class();
  v27[1] = objc_opt_class();
  v27[2] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v27, 3);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setWithArray:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setClasses:forSelector:argumentIndex:ofReply:", v15, sel_beginPlaybackAtHostTime_, 0, 0);

  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE305FF8);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "setExportedInterface:", v16);

  objc_msgSend(MEMORY[0x1E0D4D120], "proxyWithObject:protocol:", *(_QWORD *)(a1 + 32), &unk_1EE305FF8);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "setExportedObject:", v17);

  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __66__MPMusicPlayerApplicationController__establishConnectionIfNeeded__block_invoke_2;
  v23[3] = &unk_1E315E5D0;
  objc_copyWeak(&v24, (id *)(a1 + 40));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "setInvalidationHandler:", v23);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "resume");
  v18 = os_log_create("com.apple.amp.mediaplayer", "SDKPlayback");
  v19 = v18;
  v20 = *(_QWORD *)(a1 + 48);
  if (v20 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v18))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_193B9B000, v19, OS_SIGNPOST_INTERVAL_END, v20, "applicationMusicPlayer:connect", (const char *)&unk_193F291C9, buf, 2u);
  }

  v21 = os_log_create("com.apple.amp.mediaplayer", "SDKPlayback");
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
  {
    v22 = *(_QWORD *)(a1 + 48);
    *(_DWORD *)buf = 134217984;
    v26 = v22;
    _os_log_impl(&dword_193B9B000, v21, OS_LOG_TYPE_DEBUG, "END [%lld]: applicationMusicPlayer:connect ", buf, 0xCu);
  }

  objc_destroyWeak(&v24);
}

void __66__MPMusicPlayerApplicationController__establishConnectionIfNeeded__block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  NSObject *v2;
  uint8_t v3[16];

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = os_log_create("com.apple.amp.mediaplayer", "SDKPlayback");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_193B9B000, v2, OS_LOG_TYPE_ERROR, "applicationMusicPlayer: connection invalidated", v3, 2u);
  }

  objc_msgSend(WeakRetained, "_clearConnection");
}

void __67__MPMusicPlayerApplicationController__mediaItemsForContentItemIDs___block_invoke(uint64_t a1, void *a2)
{
  void *v4;
  id v5;
  uint64_t v6;
  _QWORD v7[4];
  id v8;
  uint64_t v9;

  v4 = *(void **)(a1 + 32);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __67__MPMusicPlayerApplicationController__mediaItemsForContentItemIDs___block_invoke_2;
  v7[3] = &unk_1E3156D68;
  v5 = v4;
  v6 = *(_QWORD *)(a1 + 40);
  v8 = v5;
  v9 = v6;
  objc_msgSend(a2, "getNowPlayingsForContentItemIDs:reply:", v5, v7);

}

void __67__MPMusicPlayerApplicationController__mediaItemsForContentItemIDs___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  int v12;
  uint64_t v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    v7 = os_log_create("com.apple.amp.mediaplayer", "SDKPlayback");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v8 = objc_msgSend(*(id *)(a1 + 32), "count");
      objc_msgSend(v6, "msv_description");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 134218242;
      v13 = v8;
      v14 = 2114;
      v15 = v9;
      _os_log_impl(&dword_193B9B000, v7, OS_LOG_TYPE_ERROR, "Failed getting nowPlayings for contentItemIDs (count: %llu) error=%{public}@", (uint8_t *)&v12, 0x16u);

    }
  }
  v10 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v11 = *(void **)(v10 + 40);
  *(_QWORD *)(v10 + 40) = v5;

}

uint64_t __73__MPMusicPlayerApplicationController_setDisableAutomaticCanBeNowPlaying___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setDisableAutomaticCanBeNowPlaying:", *(unsigned __int8 *)(a1 + 32));
}

uint64_t __56__MPMusicPlayerApplicationController_setRelativeVolume___block_invoke(uint64_t a1, void *a2, double a3)
{
  LODWORD(a3) = *(_DWORD *)(a1 + 32);
  return objc_msgSend(a2, "setRelativeVolume:", a3);
}

void __62__MPMusicPlayerApplicationController_beginPlaybackAtHostTime___block_invoke(uint64_t a1, void *a2, void *a3)
{
  const __CFAllocator *v4;
  void (**v5)(_QWORD);
  id v6;
  CFDictionaryRef v7;
  CMTime v8;

  v4 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  v8 = *(CMTime *)(a1 + 32);
  v5 = a3;
  v6 = a2;
  v7 = CMTimeCopyAsDictionary(&v8, v4);
  objc_msgSend(v6, "beginPlaybackAtHostTime:", v7, *(_OWORD *)&v8.value, v8.epoch);

  v5[2](v5);
}

void __62__MPMusicPlayerApplicationController_beginPlaybackAtHostTime___block_invoke_2(uint64_t a1, void *a2)
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
    _os_log_impl(&dword_193B9B000, v3, OS_LOG_TYPE_ERROR, "Failed to beginPlaybackAtHostTime with error: %{public}@", (uint8_t *)&v4, 0xCu);
  }

}

void __60__MPMusicPlayerApplicationController_prerollWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;

  v5 = a3;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __60__MPMusicPlayerApplicationController_prerollWithCompletion___block_invoke_2;
  v7[3] = &unk_1E3156CB8;
  v8 = v5;
  v9 = *(id *)(a1 + 32);
  v6 = v5;
  objc_msgSend(a2, "prerollWithCompletion:", v7);

}

void __60__MPMusicPlayerApplicationController_prerollWithCompletion___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  int v5;
  id v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = os_log_create("com.apple.amp.mediaplayer", "SDKPlayback");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    v5 = 138543362;
    v6 = v3;
    _os_log_impl(&dword_193B9B000, v4, OS_LOG_TYPE_ERROR, "Failed to prerollWithCompletion with error: %{public}@", (uint8_t *)&v5, 0xCu);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __60__MPMusicPlayerApplicationController_prerollWithCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  if ((_DWORD)result)
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  return result;
}

uint64_t __79__MPMusicPlayerApplicationController__setApplicationMusicPlayerTransitionType___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setApplicationMusicPlayerTransitionType:withDuration:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 152), *(double *)(*(_QWORD *)(a1 + 32) + 160));
}

uint64_t __92__MPMusicPlayerApplicationController__setApplicationMusicPlayerTransitionType_withDuration___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setApplicationMusicPlayerTransitionType:withDuration:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 152), *(double *)(*(_QWORD *)(a1 + 32) + 160));
}

uint64_t __56__MPMusicPlayerApplicationController_setDisableShuffle___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setDisableShuffle:", *(unsigned __int8 *)(a1 + 32));
}

uint64_t __55__MPMusicPlayerApplicationController_setDisableRepeat___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setDisableRepeat:", *(unsigned __int8 *)(a1 + 32));
}

uint64_t __57__MPMusicPlayerApplicationController_setDisableAutoPlay___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setDisableAutoPlay:", *(unsigned __int8 *)(a1 + 32));
}

void __80__MPMusicPlayerApplicationController_performQueueTransaction_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  id v7;
  _QWORD v8[5];
  id v9;
  id v10;

  v5 = a3;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __80__MPMusicPlayerApplicationController_performQueueTransaction_completionHandler___block_invoke_2;
  v8[3] = &unk_1E3156C20;
  v6 = *(_QWORD *)(a1 + 32);
  v8[4] = *(_QWORD *)(a1 + 40);
  v9 = v5;
  v10 = *(id *)(a1 + 48);
  v7 = v5;
  objc_msgSend(a2, "performQueueModifications:completion:", v6, v8);

}

void __80__MPMusicPlayerApplicationController_performQueueTransaction_completionHandler___block_invoke_4(uint64_t a1, void *a2)
{
  id v3;
  MPMusicPlayerControllerQueue *v4;
  id v5;
  id location;

  v3 = a2;
  v4 = -[MPMusicPlayerControllerQueue initWithController:]([MPMusicPlayerControllerQueue alloc], "initWithController:", *(_QWORD *)(a1 + 32));
  objc_initWeak(&location, v4);
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

  v5 = objc_loadWeakRetained(&location);
  objc_msgSend(v5, "fault");

  objc_destroyWeak(&location);
}

void __80__MPMusicPlayerApplicationController_performQueueTransaction_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  _QWORD block[5];
  id v6;
  id v7;

  v3 = a2;
  if ((*(unsigned int (**)(void))(*(_QWORD *)(a1 + 40) + 16))())
  {
    objc_msgSend(*(id *)(a1 + 32), "queue");
    v4 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __80__MPMusicPlayerApplicationController_performQueueTransaction_completionHandler___block_invoke_3;
    block[3] = &unk_1E3161780;
    block[4] = *(_QWORD *)(a1 + 32);
    v7 = *(id *)(a1 + 48);
    v6 = v3;
    dispatch_async(v4, block);

  }
}

void __80__MPMusicPlayerApplicationController_performQueueTransaction_completionHandler___block_invoke_3(uint64_t a1)
{
  MPMusicPlayerControllerQueue *v2;
  id v3;
  id location;

  v2 = -[MPMusicPlayerControllerQueue initWithController:]([MPMusicPlayerControllerQueue alloc], "initWithController:", *(_QWORD *)(a1 + 32));
  objc_initWeak(&location, v2);
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

  v3 = objc_loadWeakRetained(&location);
  objc_msgSend(v3, "fault");

  objc_destroyWeak(&location);
}

+ (BOOL)shouldUseSystemMusicAppOnMacOS
{
  return __MPMusicPlayerApplicationController_shouldUseSystemMusicAppOnMacOS;
}

+ (void)setShouldUseSystemMusicAppOnMacOS:(BOOL)a3
{
  __MPMusicPlayerApplicationController_shouldUseSystemMusicAppOnMacOS = a3;
}

@end
