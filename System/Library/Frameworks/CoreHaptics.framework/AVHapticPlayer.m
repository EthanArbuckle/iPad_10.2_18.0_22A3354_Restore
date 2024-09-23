@implementation AVHapticPlayer

+ (BOOL)supportsHaptics
{
  if (+[AVHapticPlayer supportsHaptics]::sCheckServer_Once != -1)
    dispatch_once(&+[AVHapticPlayer supportsHaptics]::sCheckServer_Once, &__block_literal_global_3);
  return +[AVHapticPlayer supportsHaptics]::sHapticsSupported;
}

+ (BOOL)supportsAudio
{
  return 1;
}

void __48__AVHapticPlayer_queryServerCapabilities_reply___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  id v8;
  NSObject *v9;
  void *v10;
  int v11;
  const char *v12;
  __int16 v13;
  int v14;
  __int16 v15;
  const char *v16;
  __int16 v17;
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    if (kAVHCScope)
    {
      v7 = *(id *)kAVHCScope;
      if (!v7)
        goto LABEL_9;
    }
    else
    {
      v7 = (id)MEMORY[0x1E0C81028];
      v8 = MEMORY[0x1E0C81028];
    }
    v9 = v7;
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(*(id *)(a1 + 32), "client");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 136315906;
      v12 = "AVHapticPlayer.mm";
      v13 = 1024;
      v14 = 324;
      v15 = 2080;
      v16 = "-[AVHapticPlayer queryServerCapabilities:reply:]_block_invoke";
      v17 = 2048;
      v18 = objc_msgSend(v10, "clientID");
      _os_log_impl(&dword_1B573F000, v9, OS_LOG_TYPE_ERROR, "%25s:%-5d %s: clientID: 0x%lx: call failed", (uint8_t *)&v11, 0x26u);

    }
  }
LABEL_9:
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void __47__AVHapticPlayer_prewarmWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  uint64_t v6;
  int v7;
  const char *v8;
  __int16 v9;
  int v10;
  __int16 v11;
  const char *v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (kAVHCScope)
  {
    if ((*(_BYTE *)(kAVHCScope + 8) & 1) != 0)
    {
      v4 = *(id *)kAVHCScope;
      if (v4)
      {
        v5 = v4;
        if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
        {
          v7 = 136315906;
          v8 = "AVHapticPlayer.mm";
          v9 = 1024;
          v10 = 642;
          v11 = 2080;
          v12 = "-[AVHapticPlayer prewarmWithCompletionHandler:]_block_invoke";
          v13 = 2112;
          v14 = v3;
          _os_log_impl(&dword_1B573F000, v5, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: reply block for _client prewarm: replyError: %@", (uint8_t *)&v7, 0x26u);
        }

      }
    }
  }
  v6 = *(_QWORD *)(a1 + 32);
  if (v6)
    (*(void (**)(uint64_t, id))(v6 + 16))(v6, v3);

}

void __63__AVHapticPlayer_allocateRenderResourcesWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  id v5;

  v3 = a2;
  if (!v3)
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 16) = 1;
  v4 = *(_QWORD *)(a1 + 40);
  v5 = v3;
  if (v4)
    (*(void (**)(uint64_t, id))(v4 + 16))(v4, v3);

}

uint64_t __33__AVHapticPlayer_supportsHaptics__block_invoke(PlatformUtilities_iOS *a1)
{
  uint64_t result;

  result = PlatformUtilities_iOS::ProductSupportsClosedLoopHaptics(a1);
  +[AVHapticPlayer supportsHaptics]::sHapticsSupported = result;
  return result;
}

void __51__AVHapticPlayer_stopRunningWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  uint64_t v6;
  int v7;
  const char *v8;
  __int16 v9;
  int v10;
  __int16 v11;
  const char *v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (kAVHCScope)
  {
    if ((*(_BYTE *)(kAVHCScope + 8) & 1) != 0)
    {
      v4 = *(id *)kAVHCScope;
      if (v4)
      {
        v5 = v4;
        if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
        {
          v7 = 136315906;
          v8 = "AVHapticPlayer.mm";
          v9 = 1024;
          v10 = 731;
          v11 = 2080;
          v12 = "-[AVHapticPlayer stopRunningWithCompletionHandler:]_block_invoke";
          v13 = 2112;
          v14 = v3;
          _os_log_impl(&dword_1B573F000, v5, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: reply block for _client stopRunning: replyError: %@", (uint8_t *)&v7, 0x26u);
        }

      }
    }
  }
  v6 = *(_QWORD *)(a1 + 32);
  if (v6)
    (*(void (**)(uint64_t, id))(v6 + 16))(v6, v3);

}

- (void)prewarmWithCompletionHandler:(id)a3
{
  void (**v4)(id, id);
  AVHapticPlayer *v5;
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  _BOOL4 v11;
  AVHapticClient *client;
  void (**v13)(id, id);
  _QWORD v14[4];
  void (**v15)(id, id);
  id v16;
  uint8_t buf[4];
  const char *v18;
  __int16 v19;
  int v20;
  __int16 v21;
  const char *v22;
  __int16 v23;
  uint64_t v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, id))a3;
  v5 = self;
  objc_sync_enter(v5);
  if (kAVHCScope)
  {
    v6 = *(id *)kAVHCScope;
    if (!v6)
      goto LABEL_8;
  }
  else
  {
    v6 = (id)MEMORY[0x1E0C81028];
    v7 = MEMORY[0x1E0C81028];
  }
  v8 = v6;
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    -[AVHapticPlayer client](v5, "client");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315906;
    v18 = "AVHapticPlayer.mm";
    v19 = 1024;
    v20 = 639;
    v21 = 2080;
    v22 = "-[AVHapticPlayer prewarmWithCompletionHandler:]";
    v23 = 2048;
    v24 = objc_msgSend(v9, "clientID");
    _os_log_impl(&dword_1B573F000, v8, OS_LOG_TYPE_DEFAULT, "%25s:%-5d %s: prewarm: clientID: 0x%lx", buf, 0x26u);

  }
LABEL_8:
  -[AVHapticPlayer client](v5, "client");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "clientID") == -1;

  if (v11)
  {
    v16 = 0;
    _Haptic_Check((uint64_t)"/Library/Caches/com.apple.xbs/Sources/CoreHaptics/Source/AVHapticPlayer.mm", 640, "-[AVHapticPlayer prewarmWithCompletionHandler:]", "self.client.clientID != kInvalidClientID", -4812, &v16);
    v13 = (void (**)(id, id))v16;
    if (v4)
      v4[2](v4, v13);
  }
  else
  {
    client = v5->_client;
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __47__AVHapticPlayer_prewarmWithCompletionHandler___block_invoke;
    v14[3] = &unk_1E69602A0;
    v15 = v4;
    -[AVHapticClient prewarm:](client, "prewarm:", v14);
    v13 = v15;
  }

  objc_sync_exit(v5);
}

- (BOOL)finishWithCompletionHandler:(id)a3
{
  void (**v4)(id, id);
  AVHapticPlayer *v5;
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  BOOL v12;
  id v13;
  id v15;
  uint8_t buf[4];
  const char *v17;
  __int16 v18;
  int v19;
  __int16 v20;
  const char *v21;
  __int16 v22;
  uint64_t v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, id))a3;
  v5 = self;
  objc_sync_enter(v5);
  if (kAVHCScope)
  {
    v6 = *(id *)kAVHCScope;
    if (!v6)
      goto LABEL_8;
  }
  else
  {
    v6 = (id)MEMORY[0x1E0C81028];
    v7 = MEMORY[0x1E0C81028];
  }
  v8 = v6;
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    -[AVHapticPlayer client](v5, "client");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315906;
    v17 = "AVHapticPlayer.mm";
    v18 = 1024;
    v19 = 750;
    v20 = 2080;
    v21 = "-[AVHapticPlayer finishWithCompletionHandler:]";
    v22 = 2048;
    v23 = objc_msgSend(v9, "clientID");
    _os_log_impl(&dword_1B573F000, v8, OS_LOG_TYPE_DEFAULT, "%25s:%-5d %s: finish with comp handler: clientID: 0x%lx", buf, 0x26u);

  }
LABEL_8:
  -[AVHapticPlayer client](v5, "client");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "clientID");

  if (v11 == -1)
  {
    v15 = 0;
    _Haptic_Check((uint64_t)"/Library/Caches/com.apple.xbs/Sources/CoreHaptics/Source/AVHapticPlayer.mm", 751, "-[AVHapticPlayer finishWithCompletionHandler:]", "self.client.clientID != kInvalidClientID", -4812, &v15);
    v13 = v15;
    if (v4)
      v4[2](v4, v13);

    v12 = 0;
  }
  else
  {
    v12 = -[AVHapticClient finish:](v5->_client, "finish:", v4);
  }
  objc_sync_exit(v5);

  return v11 != -1 && v12;
}

- (void)allocateRenderResourcesWithCompletionHandler:(id)a3
{
  id v4;
  AVHapticPlayer *v5;
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  _BOOL4 v11;
  NSObject *v12;
  id v13;
  AVHapticClient *client;
  id v15;
  _QWORD v16[5];
  id v17;
  id v18;
  uint8_t buf[4];
  const char *v20;
  __int16 v21;
  int v22;
  __int16 v23;
  const char *v24;
  __int16 v25;
  uint64_t v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  if (kAVHCScope)
  {
    v6 = *(id *)kAVHCScope;
    if (!v6)
      goto LABEL_8;
  }
  else
  {
    v6 = (id)MEMORY[0x1E0C81028];
    v7 = MEMORY[0x1E0C81028];
  }
  v8 = v6;
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    -[AVHapticPlayer client](v5, "client");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315906;
    v20 = "AVHapticPlayer.mm";
    v21 = 1024;
    v22 = 509;
    v23 = 2080;
    v24 = "-[AVHapticPlayer allocateRenderResourcesWithCompletionHandler:]";
    v25 = 2048;
    v26 = objc_msgSend(v9, "clientID");
    _os_log_impl(&dword_1B573F000, v8, OS_LOG_TYPE_INFO, "%25s:%-5d %s: allocating resources: clientID: 0x%lx", buf, 0x26u);

  }
LABEL_8:
  -[AVHapticPlayer client](v5, "client");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "clientID") == -1;

  if (!v11)
  {
    if (!v5->_resourcesAllocated)
    {
      client = v5->_client;
      v16[0] = MEMORY[0x1E0C809B0];
      v16[1] = 3221225472;
      v16[2] = __63__AVHapticPlayer_allocateRenderResourcesWithCompletionHandler___block_invoke;
      v16[3] = &unk_1E6960A10;
      v16[4] = v5;
      v17 = v4;
      -[AVHapticClient allocateResources:](client, "allocateResources:", v16);

      goto LABEL_23;
    }
    if (kAVHCScope)
    {
      v12 = *(id *)kAVHCScope;
      if (!v12)
      {
LABEL_21:
        if (v4)
          (*((void (**)(id, _QWORD))v4 + 2))(v4, 0);
        goto LABEL_23;
      }
    }
    else
    {
      v12 = MEMORY[0x1E0C81028];
      v15 = MEMORY[0x1E0C81028];
    }
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315650;
      v20 = "AVHapticPlayer.mm";
      v21 = 1024;
      v22 = 520;
      v23 = 2080;
      v24 = "-[AVHapticPlayer allocateRenderResourcesWithCompletionHandler:]";
      _os_log_impl(&dword_1B573F000, v12, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: Resources already allocated -- just call completion handler", buf, 0x1Cu);
    }

    goto LABEL_21;
  }
  v18 = 0;
  _Haptic_Check((uint64_t)"/Library/Caches/com.apple.xbs/Sources/CoreHaptics/Source/AVHapticPlayer.mm", 510, "-[AVHapticPlayer allocateRenderResourcesWithCompletionHandler:]", "self.client.clientID != kInvalidClientID", -4812, &v18);
  v13 = v18;
  if (v4)
    (*((void (**)(id, id))v4 + 2))(v4, v13);

LABEL_23:
  objc_sync_exit(v5);

}

- (BOOL)setBehavior:(unint64_t)a3 error:(id *)a4
{
  AVHapticPlayer *v6;
  id v7;
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  _BOOL4 v12;
  _BOOL4 v13;
  AVHapticClient *client;
  id v15;
  void *v16;
  id v18;
  uint8_t buf[4];
  const char *v20;
  __int16 v21;
  int v22;
  __int16 v23;
  const char *v24;
  __int16 v25;
  uint64_t v26;
  __int16 v27;
  int v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v6 = self;
  objc_sync_enter(v6);
  if (kAVHCScope)
  {
    v7 = *(id *)kAVHCScope;
    if (!v7)
      goto LABEL_8;
  }
  else
  {
    v7 = (id)MEMORY[0x1E0C81028];
    v8 = MEMORY[0x1E0C81028];
  }
  v9 = v7;
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    -[AVHapticPlayer client](v6, "client");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136316162;
    v20 = "AVHapticPlayer.mm";
    v21 = 1024;
    v22 = 332;
    v23 = 2080;
    v24 = "-[AVHapticPlayer setBehavior:error:]";
    v25 = 2048;
    v26 = objc_msgSend(v10, "clientID");
    v27 = 1024;
    v28 = a3;
    _os_log_impl(&dword_1B573F000, v9, OS_LOG_TYPE_DEFAULT, "%25s:%-5d %s: clientID: 0x%lx behavior: %u", buf, 0x2Cu);

  }
LABEL_8:
  -[AVHapticPlayer client](v6, "client");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "clientID") == -1;

  if (v12)
  {
    _Haptic_Check((uint64_t)"/Library/Caches/com.apple.xbs/Sources/CoreHaptics/Source/AVHapticPlayer.mm", 333, "-[AVHapticPlayer setBehavior:error:]", "self.client.clientID != kInvalidClientID", -4812, a4);
    LOBYTE(v13) = 0;
  }
  else if (v6->_behavior == a3)
  {
    LOBYTE(v13) = 1;
  }
  else
  {
    client = v6->_client;
    v18 = 0;
    v13 = -[AVHapticClient setPlayerBehavior:error:](client, "setPlayerBehavior:error:", a3, &v18);
    v15 = v18;
    v16 = v15;
    if (v13)
      v6->_behavior = a3;
    else
      *a4 = objc_retainAutorelease(v15);

  }
  objc_sync_exit(v6);

  return v13;
}

- (AVHapticClient)client
{
  return (AVHapticClient *)objc_getProperty(self, a2, 8, 1);
}

- (BOOL)removeChannel:(id)a3 error:(id *)a4
{
  id v6;
  AVHapticPlayer *v7;
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  NSObject *v12;
  BOOL v13;
  id v14;
  int v16;
  const char *v17;
  __int16 v18;
  int v19;
  __int16 v20;
  const char *v21;
  __int16 v22;
  AVHapticPlayer *v23;
  __int16 v24;
  uint64_t v25;
  __int16 v26;
  id v27;
  __int16 v28;
  int v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = self;
  objc_sync_enter(v7);
  if (kAVHCScope)
  {
    v8 = *(id *)kAVHCScope;
    if (!v8)
      goto LABEL_8;
  }
  else
  {
    v8 = (id)MEMORY[0x1E0C81028];
    v9 = MEMORY[0x1E0C81028];
  }
  v10 = v8;
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    -[AVHapticPlayer client](v7, "client");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 136316674;
    v17 = "AVHapticPlayer.mm";
    v18 = 1024;
    v19 = 443;
    v20 = 2080;
    v21 = "-[AVHapticPlayer removeChannel:error:]";
    v22 = 2048;
    v23 = v7;
    v24 = 2048;
    v25 = objc_msgSend(v11, "clientID");
    v26 = 2048;
    v27 = v6;
    v28 = 1024;
    v29 = objc_msgSend(v6, "chanID");
    _os_log_impl(&dword_1B573F000, v10, OS_LOG_TYPE_INFO, "%25s:%-5d %s: player %p, clientID: 0x%lx channel %p (ID %u)", (uint8_t *)&v16, 0x40u);

  }
LABEL_8:
  if (-[NSMutableArray indexOfObject:](v7->_channelArray, "indexOfObject:", v6) != 0x7FFFFFFFFFFFFFFFLL)
  {
    -[NSMutableArray removeObject:](v7->_channelArray, "removeObject:", v6);
    v13 = -[AVHapticClient removeAssignedChannelID:error:](v7->_client, "removeAssignedChannelID:error:", objc_msgSend(v6, "chanID"), a4);
    objc_msgSend(v6, "invalidate");
    objc_sync_exit(v7);

    goto LABEL_20;
  }
  objc_sync_exit(v7);

  if (!kAVHCScope)
  {
    v12 = MEMORY[0x1E0C81028];
    v14 = MEMORY[0x1E0C81028];
    goto LABEL_14;
  }
  v12 = *(id *)kAVHCScope;
  if (v12)
  {
LABEL_14:
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      v16 = 136315650;
      v17 = "AVHapticPlayer.mm";
      v18 = 1024;
      v19 = 451;
      v20 = 2080;
      v21 = "-[AVHapticPlayer removeChannel:error:]";
      _os_log_impl(&dword_1B573F000, v12, OS_LOG_TYPE_ERROR, "%25s:%-5d %s: Channel not found on player", (uint8_t *)&v16, 0x1Cu);
    }

  }
  if (a4)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.CoreHaptics"), -4804, 0);
    v13 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v13 = 0;
  }
LABEL_20:

  return v13;
}

- (void)queryServerCapabilities:(id)a3 reply:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  AVHapticClient *client;
  id v13;
  _QWORD v14[5];
  id v15;
  uint8_t buf[4];
  const char *v17;
  __int16 v18;
  int v19;
  __int16 v20;
  const char *v21;
  __int16 v22;
  uint64_t v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (kAVHCScope)
  {
    v8 = *(id *)kAVHCScope;
    if (!v8)
      goto LABEL_8;
  }
  else
  {
    v8 = (id)MEMORY[0x1E0C81028];
    v9 = MEMORY[0x1E0C81028];
  }
  v10 = v8;
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    -[AVHapticPlayer client](self, "client");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315906;
    v17 = "AVHapticPlayer.mm";
    v18 = 1024;
    v19 = 322;
    v20 = 2080;
    v21 = "-[AVHapticPlayer queryServerCapabilities:reply:]";
    v22 = 2048;
    v23 = objc_msgSend(v11, "clientID");
    _os_log_impl(&dword_1B573F000, v10, OS_LOG_TYPE_DEFAULT, "%25s:%-5d %s: clientID: 0x%lx", buf, 0x26u);

  }
LABEL_8:
  client = self->_client;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __48__AVHapticPlayer_queryServerCapabilities_reply___block_invoke;
  v14[3] = &unk_1E69609E8;
  v14[4] = self;
  v13 = v7;
  v15 = v13;
  -[AVHapticClient queryServerCapabilities:reply:](client, "queryServerCapabilities:reply:", v6, v14);

}

- (AVHapticPlayer)initWithOptions:(id)a3 error:(id *)a4
{
  id v6;
  NSObject *v7;
  id v8;
  AVHapticPlayer *v9;
  AVHapticPlayer *v10;
  id v11;
  objc_super v13;
  uint8_t buf[4];
  const char *v15;
  __int16 v16;
  int v17;
  __int16 v18;
  const char *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (kAVHCScope)
  {
    v7 = *(id *)kAVHCScope;
    if (!v7)
      goto LABEL_8;
  }
  else
  {
    v7 = MEMORY[0x1E0C81028];
    v8 = MEMORY[0x1E0C81028];
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    v15 = "AVHapticPlayer.mm";
    v16 = 1024;
    v17 = 284;
    v18 = 2080;
    v19 = "-[AVHapticPlayer initWithOptions:error:]";
    _os_log_impl(&dword_1B573F000, v7, OS_LOG_TYPE_INFO, "%25s:%-5d %s: initWithOptions entered", buf, 0x1Cu);
  }

LABEL_8:
  v13.receiver = self;
  v13.super_class = (Class)AVHapticPlayer;
  v9 = -[AVHapticPlayer init](&v13, sel_init);
  v10 = v9;
  if (v9)
  {
    if (-[AVHapticPlayer doInitWithOptions:error:](v9, "doInitWithOptions:error:", v6, a4))
      goto LABEL_18;
  }
  else
  {
    if (kAVHCScope)
    {
      v10 = (AVHapticPlayer *)*(id *)kAVHCScope;
      if (!v10)
        goto LABEL_18;
    }
    else
    {
      v10 = (AVHapticPlayer *)MEMORY[0x1E0C81028];
      v11 = MEMORY[0x1E0C81028];
    }
    if (os_log_type_enabled(&v10->super, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315650;
      v15 = "AVHapticPlayer.mm";
      v16 = 1024;
      v17 = 292;
      v18 = 2080;
      v19 = "-[AVHapticPlayer initWithOptions:error:]";
      _os_log_impl(&dword_1B573F000, &v10->super, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: initWithOptions exited", buf, 0x1Cu);
    }
  }

  v10 = 0;
LABEL_18:

  return v10;
}

- (BOOL)doInitWithOptions:(id)a3 error:(id *)a4
{
  id v6;
  id stopRunningHandler;
  AVHapticClient *v8;
  AVHapticClient *client;
  AVHapticClient *v10;
  NSObject *v11;
  id v12;
  int v14;
  const char *v15;
  __int16 v16;
  int v17;
  __int16 v18;
  const char *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  stopRunningHandler = self->_stopRunningHandler;
  self->_stopRunningHandler = 0;

  self->_resourcesAllocated = 0;
  self->_behavior = 0;
  v8 = -[AVHapticClient initWithOptions:error:]([AVHapticClient alloc], "initWithOptions:error:", v6, a4);
  client = self->_client;
  self->_client = v8;

  v10 = self->_client;
  if (v10)
  {
    -[AVHapticClient setConnectionCallback:](v10, "setConnectionCallback:", &__block_literal_global_58);
  }
  else
  {
    if (kAVHCScope)
    {
      v11 = *(id *)kAVHCScope;
      if (!v11)
        goto LABEL_10;
    }
    else
    {
      v11 = MEMORY[0x1E0C81028];
      v12 = MEMORY[0x1E0C81028];
    }
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      v14 = 136315650;
      v15 = "AVHapticPlayer.mm";
      v16 = 1024;
      v17 = 242;
      v18 = 2080;
      v19 = "-[AVHapticPlayer doInitWithOptions:error:]";
      _os_log_impl(&dword_1B573F000, v11, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: exited with nil", (uint8_t *)&v14, 0x1Cu);
    }

  }
LABEL_10:

  return v10 != 0;
}

- (void)setConnectionErrorHandler:(id)a3
{
  void *v4;
  id connectionErrorHandler;
  _QWORD v6[4];
  id v7;
  id location;

  v4 = (void *)MEMORY[0x1B5E4F2B4](a3, a2);
  connectionErrorHandler = self->_connectionErrorHandler;
  self->_connectionErrorHandler = v4;

  objc_initWeak(&location, self);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __44__AVHapticPlayer_setConnectionErrorHandler___block_invoke;
  v6[3] = &unk_1E695FEB0;
  objc_copyWeak(&v7, &location);
  -[AVHapticClient setConnectionCallback:](self->_client, "setConnectionCallback:", v6);
  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

- (id)addChannel:(id *)a3
{
  id v4;
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  _BOOL4 v9;
  id *p_channelArray;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  uint64_t v15;
  NSObject *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  AVHapticPlayerChannel *v28;
  id v29;
  id v30;
  NSObject *v31;
  int v32;
  id v33;
  id v34;
  NSObject *v35;
  int v36;
  id *location;
  uint64_t v39;
  id obj;
  AVHapticPlayer *v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  _BYTE v50[128];
  uint8_t v51[128];
  uint8_t buf[4];
  const char *v53;
  __int16 v54;
  int v55;
  __int16 v56;
  const char *v57;
  __int16 v58;
  _BYTE v59[10];
  uint64_t v60;
  uint64_t v61;

  v61 = *MEMORY[0x1E0C80C00];
  v41 = self;
  objc_sync_enter(v41);
  if (kAVHCScope)
  {
    v4 = *(id *)kAVHCScope;
    if (!v4)
      goto LABEL_8;
  }
  else
  {
    v4 = (id)MEMORY[0x1E0C81028];
    v5 = MEMORY[0x1E0C81028];
  }
  v6 = v4;
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    -[AVHapticPlayer client](v41, "client");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136316162;
    v53 = "AVHapticPlayer.mm";
    v54 = 1024;
    v55 = 399;
    v56 = 2080;
    v57 = "-[AVHapticPlayer addChannel:]";
    v58 = 2048;
    *(_QWORD *)v59 = v41;
    *(_WORD *)&v59[8] = 2048;
    v60 = objc_msgSend(v7, "clientID");
    _os_log_impl(&dword_1B573F000, v6, OS_LOG_TYPE_INFO, "%25s:%-5d %s: player %p, clientID: 0x%lx", buf, 0x30u);

  }
LABEL_8:
  -[AVHapticPlayer client](v41, "client");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "clientID") == -1;

  if (v9)
  {
    _Haptic_Check((uint64_t)"/Library/Caches/com.apple.xbs/Sources/CoreHaptics/Source/AVHapticPlayer.mm", 401, "-[AVHapticPlayer addChannel:]", "clientID invalid", -4812, a3);
  }
  else
  {
    p_channelArray = (id *)&v41->_channelArray;
    if (-[AVHapticClient requestAssignedChannels:error:](v41->_client, "requestAssignedChannels:error:", -[NSMutableArray count](v41->_channelArray, "count") + 1, a3))
    {
      -[AVHapticClient channelKeys](v41->_client, "channelKeys");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      location = (id *)&v41->_channelArray;
      if (*p_channelArray)
        v12 = *p_channelArray;
      else
        v12 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v14 = v12;
      v15 = objc_msgSend(v12, "count");
      v39 = objc_msgSend(v11, "count");
      if (kAVHCScope)
      {
        v16 = *(id *)kAVHCScope;
        if (!v16)
          goto LABEL_22;
      }
      else
      {
        v16 = MEMORY[0x1E0C81028];
        v17 = MEMORY[0x1E0C81028];
      }
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136316162;
        v53 = "AVHapticPlayer.mm";
        v55 = 410;
        v56 = 2080;
        v54 = 1024;
        v57 = "-[AVHapticPlayer addChannel:]";
        v58 = 1024;
        *(_DWORD *)v59 = v15;
        *(_WORD *)&v59[4] = 1024;
        *(_DWORD *)&v59[6] = v39;
        _os_log_impl(&dword_1B573F000, v16, OS_LOG_TYPE_INFO, "%25s:%-5d %s: Total channels was %u, now %u", buf, 0x28u);
      }

LABEL_22:
      if (v39 != v15 + 1)
        -[AVHapticPlayer addChannel:].cold.1();
      v48 = 0u;
      v49 = 0u;
      v46 = 0u;
      v47 = 0u;
      obj = v11;
      v18 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v46, v51, 16);
      if (!v18)
      {
LABEL_48:

        objc_storeStrong(location, v14);
        objc_msgSend(*location, "objectAtIndex:", v39 - 1);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (kAVHCScope)
        {
          v33 = *(id *)kAVHCScope;
          if (!v33)
          {
LABEL_55:

            goto LABEL_56;
          }
        }
        else
        {
          v33 = (id)MEMORY[0x1E0C81028];
          v34 = MEMORY[0x1E0C81028];
        }
        v35 = v33;
        if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG))
        {
          v36 = objc_msgSend(v13, "chanID");
          *(_DWORD *)buf = 136316162;
          v53 = "AVHapticPlayer.mm";
          v54 = 1024;
          v55 = 432;
          v56 = 2080;
          v57 = "-[AVHapticPlayer addChannel:]";
          v58 = 2048;
          *(_QWORD *)v59 = v13;
          *(_WORD *)&v59[8] = 1024;
          LODWORD(v60) = v36;
          _os_log_impl(&dword_1B573F000, v35, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: Returning channel %p (ID %u)", buf, 0x2Cu);
        }

        goto LABEL_55;
      }
      v19 = *(_QWORD *)v47;
      while (1)
      {
        v20 = 0;
LABEL_26:
        if (*(_QWORD *)v47 != v19)
          objc_enumerationMutation(obj);
        v21 = *(void **)(*((_QWORD *)&v46 + 1) + 8 * v20);
        v42 = 0u;
        v43 = 0u;
        v44 = 0u;
        v45 = 0u;
        v22 = v14;
        v23 = v14;
        v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v42, v50, 16);
        if (!v24)
          break;
        v25 = *(_QWORD *)v43;
LABEL_30:
        v26 = 0;
        while (1)
        {
          if (*(_QWORD *)v43 != v25)
            objc_enumerationMutation(v23);
          v27 = objc_msgSend(*(id *)(*((_QWORD *)&v42 + 1) + 8 * v26), "chanID");
          if (v27 == objc_msgSend(v21, "unsignedIntegerValue"))
            break;
          if (v24 == ++v26)
          {
            v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v42, v50, 16);
            if (v24)
              goto LABEL_30;
            goto LABEL_40;
          }
        }

        v14 = v22;
        if (++v20 != v18)
          goto LABEL_26;
        v18 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v46, v51, 16);
        if (!v18)
          goto LABEL_48;
      }
LABEL_40:

      v14 = v22;
      v28 = -[AVHapticPlayerChannel initWithChannelID:client:]([AVHapticPlayerChannel alloc], "initWithChannelID:client:", v21, v41->_client);
      if (kAVHCScope)
      {
        v29 = *(id *)kAVHCScope;
        if (!v29)
        {
LABEL_47:
          objc_msgSend(v23, "addObject:", v28);

          goto LABEL_48;
        }
      }
      else
      {
        v29 = (id)MEMORY[0x1E0C81028];
        v30 = MEMORY[0x1E0C81028];
      }
      v31 = v29;
      if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
      {
        v32 = objc_msgSend(v21, "unsignedIntegerValue");
        *(_DWORD *)buf = 136316162;
        v53 = "AVHapticPlayer.mm";
        v54 = 1024;
        v55 = 426;
        v56 = 2080;
        v57 = "-[AVHapticPlayer addChannel:]";
        v58 = 2048;
        *(_QWORD *)v59 = v28;
        *(_WORD *)&v59[8] = 1024;
        LODWORD(v60) = v32;
        _os_log_impl(&dword_1B573F000, v31, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: Adding new AVHapticPlayerChannel %p to end of array with channel ID %u", buf, 0x2Cu);
      }

      goto LABEL_47;
    }
  }
  v13 = 0;
LABEL_56:
  objc_sync_exit(v41);

  return v13;
}

- (void)setBehavior:(unint64_t)a3
{
  uint64_t v3;

  v3 = 0;
  -[AVHapticPlayer setBehavior:error:](self, "setBehavior:error:", a3, &v3);
}

- (void)setStopRunningHandler:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 48);
}

- (void)stopRunningWithCompletionHandler:(id)a3
{
  void (**v4)(id, id);
  AVHapticPlayer *v5;
  void *v6;
  uint64_t v7;
  NSObject *v8;
  id v9;
  void *v10;
  _BOOL4 v11;
  AVHapticClient *client;
  void (**v13)(id, id);
  NSObject *v14;
  id v15;
  _QWORD v16[4];
  void (**v17)(id, id);
  id v18;
  uint8_t buf[4];
  const char *v20;
  __int16 v21;
  int v22;
  __int16 v23;
  const char *v24;
  __int16 v25;
  uint64_t v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, id))a3;
  v5 = self;
  objc_sync_enter(v5);
  -[AVHapticPlayer client](v5, "client");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "clientID");

  if (kAVHCScope)
  {
    v8 = *(id *)kAVHCScope;
    if (!v8)
      goto LABEL_8;
  }
  else
  {
    v8 = MEMORY[0x1E0C81028];
    v9 = MEMORY[0x1E0C81028];
  }
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315906;
    v20 = "AVHapticPlayer.mm";
    v21 = 1024;
    v22 = 727;
    v23 = 2080;
    v24 = "-[AVHapticPlayer stopRunningWithCompletionHandler:]";
    v25 = 2048;
    v26 = v7;
    _os_log_impl(&dword_1B573F000, v8, OS_LOG_TYPE_DEFAULT, "%25s:%-5d %s: stop running: clientID: 0x%lx", buf, 0x26u);
  }

LABEL_8:
  -[AVHapticPlayer client](v5, "client");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "clientID") == -1;

  if (v11)
  {
    v18 = 0;
    _Haptic_Check((uint64_t)"/Library/Caches/com.apple.xbs/Sources/CoreHaptics/Source/AVHapticPlayer.mm", 728, "-[AVHapticPlayer stopRunningWithCompletionHandler:]", "self.client.clientID != kInvalidClientID", -4812, &v18);
    v13 = (void (**)(id, id))v18;
    if (v4)
      v4[2](v4, v13);
    goto LABEL_13;
  }
  if (-[AVHapticClient running](v5->_client, "running"))
  {
    client = v5->_client;
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __51__AVHapticPlayer_stopRunningWithCompletionHandler___block_invoke;
    v16[3] = &unk_1E69602A0;
    v17 = v4;
    -[AVHapticClient stopRunning:](client, "stopRunning:", v16);
    v13 = v17;
LABEL_13:

    goto LABEL_23;
  }
  if (!kAVHCScope)
  {
    v14 = MEMORY[0x1E0C81028];
    v15 = MEMORY[0x1E0C81028];
    goto LABEL_18;
  }
  v14 = *(id *)kAVHCScope;
  if (v14)
  {
LABEL_18:
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      v20 = "AVHapticPlayer.mm";
      v21 = 1024;
      v22 = 738;
      v23 = 2080;
      v24 = "-[AVHapticPlayer stopRunningWithCompletionHandler:]";
      _os_log_impl(&dword_1B573F000, v14, OS_LOG_TYPE_DEFAULT, "%25s:%-5d %s: Client was not running - calling completion handler immediately", buf, 0x1Cu);
    }

  }
  if (v4)
    v4[2](v4, 0);
LABEL_23:
  objc_sync_exit(v5);

}

- (void)startRunningWithCompletionHandler:(id)a3
{
  id v4;
  AVHapticPlayer *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  id v9;
  void *v10;
  _BOOL4 v11;
  uint64_t v12;
  AVHapticClient *client;
  id v14;
  NSObject *v15;
  id v16;
  void *v17;
  _QWORD v18[4];
  id v19;
  _QWORD v20[4];
  id v21[2];
  id v22;
  uint8_t buf[4];
  const char *v24;
  __int16 v25;
  int v26;
  __int16 v27;
  const char *v28;
  __int16 v29;
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  -[AVHapticPlayer client](v5, "client");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "clientID");

  if (kAVHCScope)
  {
    v8 = *(id *)kAVHCScope;
    if (!v8)
      goto LABEL_8;
  }
  else
  {
    v8 = MEMORY[0x1E0C81028];
    v9 = MEMORY[0x1E0C81028];
  }
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315906;
    v24 = "AVHapticPlayer.mm";
    v25 = 1024;
    v26 = 663;
    v27 = 2080;
    v28 = "-[AVHapticPlayer startRunningWithCompletionHandler:]";
    v29 = 2048;
    v30 = v7;
    _os_log_impl(&dword_1B573F000, v8, OS_LOG_TYPE_DEFAULT, "%25s:%-5d %s: start running: clientID: 0x%lx", buf, 0x26u);
  }

LABEL_8:
  -[AVHapticPlayer client](v5, "client");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "clientID") == -1;

  if (!v11)
  {
    if (v5->_resourcesAllocated)
    {
      objc_initWeak((id *)buf, v5);
      v12 = MEMORY[0x1E0C809B0];
      v20[0] = MEMORY[0x1E0C809B0];
      v20[1] = 3221225472;
      v20[2] = __52__AVHapticPlayer_startRunningWithCompletionHandler___block_invoke;
      v20[3] = &unk_1E6960A38;
      v21[1] = v7;
      objc_copyWeak(v21, (id *)buf);
      -[AVHapticClient setAsyncStopCallback:](v5->_client, "setAsyncStopCallback:", v20);
      client = v5->_client;
      v18[0] = v12;
      v18[1] = 3221225472;
      v18[2] = __52__AVHapticPlayer_startRunningWithCompletionHandler___block_invoke_68;
      v18[3] = &unk_1E69602A0;
      v19 = v4;
      -[AVHapticClient startRunning:](client, "startRunning:", v18);

      objc_destroyWeak(v21);
      objc_destroyWeak((id *)buf);
      goto LABEL_24;
    }
    if (kAVHCScope)
    {
      v15 = *(id *)kAVHCScope;
      if (!v15)
      {
LABEL_21:
        objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.CoreHaptics"), -4807, 0);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        if (v4)
          (*((void (**)(id, void *))v4 + 2))(v4, v17);

        goto LABEL_24;
      }
    }
    else
    {
      v15 = MEMORY[0x1E0C81028];
      v16 = MEMORY[0x1E0C81028];
    }
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      v24 = "AVHapticPlayer.mm";
      v25 = 1024;
      v26 = 703;
      v27 = 2080;
      v28 = "-[AVHapticPlayer startRunningWithCompletionHandler:]";
      _os_log_impl(&dword_1B573F000, v15, OS_LOG_TYPE_ERROR, "%25s:%-5d %s: Cannot start without allocating resources", buf, 0x1Cu);
    }

    goto LABEL_21;
  }
  v22 = 0;
  _Haptic_Check((uint64_t)"/Library/Caches/com.apple.xbs/Sources/CoreHaptics/Source/AVHapticPlayer.mm", 664, "-[AVHapticPlayer startRunningWithCompletionHandler:]", "self.client.clientID != kInvalidClientID", -4812, &v22);
  v14 = v22;
  if (v4)
    (*((void (**)(id, id))v4 + 2))(v4, v14);

LABEL_24:
  objc_sync_exit(v5);

}

- (double)currentMediaTime
{
  return (double)mach_absolute_time() * 0.0000000416666667;
}

+ (BOOL)isSupported
{
  return +[AVHapticPlayer supportsHaptics](AVHapticPlayer, "supportsHaptics")
      || +[AVHapticPlayer supportsAudio](AVHapticPlayer, "supportsAudio");
}

- (id)createOptionsFromAudioSessionID:(unsigned int)a3 shared:(BOOL)a4 bypassAudioSession:(BOOL)a5
{
  _BOOL8 v5;
  _BOOL8 v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v5 = a5;
  v6 = a4;
  v7 = (void *)MEMORY[0x1E0C99E08];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(_QWORD *)&a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "dictionaryWithObjectsAndKeys:", v8, CFSTR("AudioSessionID"), v9, CFSTR("AudioSessionIsShared"), v10, CFSTR("BypassAudioSession"), 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

void __42__AVHapticPlayer_doInitWithOptions_error___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  id v4;
  int v5;
  const char *v6;
  __int16 v7;
  int v8;
  __int16 v9;
  const char *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  if (kAVHCScope)
  {
    v3 = *(id *)kAVHCScope;
    if (!v3)
      goto LABEL_8;
  }
  else
  {
    v3 = MEMORY[0x1E0C81028];
    v4 = MEMORY[0x1E0C81028];
  }
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 136315650;
    v6 = "AVHapticPlayer.mm";
    v7 = 1024;
    v8 = 246;
    v9 = 2080;
    v10 = "-[AVHapticPlayer doInitWithOptions:error:]_block_invoke";
    _os_log_impl(&dword_1B573F000, v3, OS_LOG_TYPE_DEFAULT, "%25s:%-5d %s: Connection error", (uint8_t *)&v5, 0x1Cu);
  }

LABEL_8:
}

- (AVHapticPlayer)initWithSessionID:(unsigned int)a3 error:(id *)a4
{
  uint64_t v5;
  NSObject *v7;
  id v8;
  AVHapticPlayer *v9;
  AVHapticPlayer *v10;
  NSObject *v11;
  id v12;
  objc_super v14;
  uint8_t buf[4];
  const char *v16;
  __int16 v17;
  int v18;
  __int16 v19;
  const char *v20;
  uint64_t v21;

  v5 = *(_QWORD *)&a3;
  v21 = *MEMORY[0x1E0C80C00];
  if (kAVHCScope)
  {
    v7 = *(id *)kAVHCScope;
    if (!v7)
      goto LABEL_8;
  }
  else
  {
    v7 = MEMORY[0x1E0C81028];
    v8 = MEMORY[0x1E0C81028];
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    v16 = "AVHapticPlayer.mm";
    v17 = 1024;
    v18 = 252;
    v19 = 2080;
    v20 = "-[AVHapticPlayer initWithSessionID:error:]";
    _os_log_impl(&dword_1B573F000, v7, OS_LOG_TYPE_INFO, "%25s:%-5d %s: initWithSessionID entered", buf, 0x1Cu);
  }

LABEL_8:
  v14.receiver = self;
  v14.super_class = (Class)AVHapticPlayer;
  v9 = -[AVHapticPlayer init](&v14, sel_init);
  v10 = v9;
  if (v9)
  {
    -[AVHapticPlayer createOptionsFromAudioSessionID:shared:bypassAudioSession:](v9, "createOptionsFromAudioSessionID:shared:bypassAudioSession:", v5, 0, 0);
    v11 = objc_claimAutoreleasedReturnValue();
    if (-[AVHapticPlayer doInitWithOptions:error:](v10, "doInitWithOptions:error:", v11, a4))
    {
LABEL_18:

      return v10;
    }

LABEL_17:
    v10 = 0;
    goto LABEL_18;
  }
  if (!kAVHCScope)
  {
    v11 = MEMORY[0x1E0C81028];
    v12 = MEMORY[0x1E0C81028];
LABEL_15:
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315650;
      v16 = "AVHapticPlayer.mm";
      v17 = 1024;
      v18 = 261;
      v19 = 2080;
      v20 = "-[AVHapticPlayer initWithSessionID:error:]";
      _os_log_impl(&dword_1B573F000, v11, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: initWithSessionID exited", buf, 0x1Cu);
    }
    goto LABEL_17;
  }
  v11 = *(id *)kAVHCScope;
  if (v11)
    goto LABEL_15;
  return 0;
}

- (AVHapticPlayer)initWithSessionID:(unsigned int)a3 sessionIsShared:(BOOL)a4 error:(id *)a5
{
  _BOOL8 v6;
  uint64_t v7;
  NSObject *v9;
  id v10;
  AVHapticPlayer *v11;
  AVHapticPlayer *v12;
  NSObject *v13;
  id v14;
  objc_super v16;
  uint8_t buf[4];
  const char *v18;
  __int16 v19;
  int v20;
  __int16 v21;
  const char *v22;
  uint64_t v23;

  v6 = a4;
  v7 = *(_QWORD *)&a3;
  v23 = *MEMORY[0x1E0C80C00];
  if (kAVHCScope)
  {
    v9 = *(id *)kAVHCScope;
    if (!v9)
      goto LABEL_8;
  }
  else
  {
    v9 = MEMORY[0x1E0C81028];
    v10 = MEMORY[0x1E0C81028];
  }
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    v18 = "AVHapticPlayer.mm";
    v19 = 1024;
    v20 = 268;
    v21 = 2080;
    v22 = "-[AVHapticPlayer initWithSessionID:sessionIsShared:error:]";
    _os_log_impl(&dword_1B573F000, v9, OS_LOG_TYPE_INFO, "%25s:%-5d %s: initWithInternalSessionID entered", buf, 0x1Cu);
  }

LABEL_8:
  v16.receiver = self;
  v16.super_class = (Class)AVHapticPlayer;
  v11 = -[AVHapticPlayer init](&v16, sel_init);
  v12 = v11;
  if (v11)
  {
    -[AVHapticPlayer createOptionsFromAudioSessionID:shared:bypassAudioSession:](v11, "createOptionsFromAudioSessionID:shared:bypassAudioSession:", v7, v6, 0);
    v13 = objc_claimAutoreleasedReturnValue();
    if (-[AVHapticPlayer doInitWithOptions:error:](v12, "doInitWithOptions:error:", v13, a5))
    {
LABEL_18:

      return v12;
    }

LABEL_17:
    v12 = 0;
    goto LABEL_18;
  }
  if (!kAVHCScope)
  {
    v13 = MEMORY[0x1E0C81028];
    v14 = MEMORY[0x1E0C81028];
LABEL_15:
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315650;
      v18 = "AVHapticPlayer.mm";
      v19 = 1024;
      v20 = 277;
      v21 = 2080;
      v22 = "-[AVHapticPlayer initWithSessionID:sessionIsShared:error:]";
      _os_log_impl(&dword_1B573F000, v13, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: initWithSessionID exited", buf, 0x1Cu);
    }
    goto LABEL_17;
  }
  v13 = *(id *)kAVHCScope;
  if (v13)
    goto LABEL_15;
  return 0;
}

- (void)dealloc
{
  NSObject *v3;
  id v4;
  void *v5;
  void *v6;
  BOOL v7;
  void *v8;
  void *v9;
  BOOL v10;
  AVHapticClient *client;
  NSObject *v12;
  id v13;
  objc_super v14;
  uint8_t buf[4];
  const char *v16;
  __int16 v17;
  int v18;
  __int16 v19;
  const char *v20;
  __int16 v21;
  AVHapticPlayer *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  if (kAVHCScope)
  {
    v3 = *(id *)kAVHCScope;
    if (!v3)
      goto LABEL_8;
  }
  else
  {
    v3 = MEMORY[0x1E0C81028];
    v4 = MEMORY[0x1E0C81028];
  }
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315906;
    v16 = "AVHapticPlayer.mm";
    v17 = 1024;
    v18 = 299;
    v19 = 2080;
    v20 = "-[AVHapticPlayer dealloc]";
    v21 = 2048;
    v22 = self;
    _os_log_impl(&dword_1B573F000, v3, OS_LOG_TYPE_INFO, "%25s:%-5d %s: dealloc entered for player %p", buf, 0x26u);
  }

LABEL_8:
  -[AVHapticPlayer releaseChannels](self, "releaseChannels");
  -[AVHapticPlayer client](self, "client");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(v5);
  -[AVHapticPlayer client](self, "client");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "clientID") == -1;

  if (!v7)
  {
    -[AVHapticPlayer client](self, "client");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "stopRunning");

  }
  objc_sync_exit(v5);

  if (self->_resourcesAllocated)
  {
    self->_resourcesAllocated = 0;
    -[AVHapticPlayer client](self, "client");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "clientID") == -1;

    if (!v10)
      -[AVHapticClient releaseResources](self->_client, "releaseResources");
    -[AVHapticPlayer invalidateChannels](self, "invalidateChannels");
  }
  -[AVHapticClient disconnect](self->_client, "disconnect");
  client = self->_client;
  self->_client = 0;

  if (kAVHCScope)
  {
    v12 = *(id *)kAVHCScope;
    if (!v12)
      goto LABEL_21;
  }
  else
  {
    v12 = MEMORY[0x1E0C81028];
    v13 = MEMORY[0x1E0C81028];
  }
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    v16 = "AVHapticPlayer.mm";
    v17 = 1024;
    v18 = 317;
    v19 = 2080;
    v20 = "-[AVHapticPlayer dealloc]";
    _os_log_impl(&dword_1B573F000, v12, OS_LOG_TYPE_INFO, "%25s:%-5d %s: dealloc exited", buf, 0x1Cu);
  }

LABEL_21:
  v14.receiver = self;
  v14.super_class = (Class)AVHapticPlayer;
  -[AVHapticPlayer dealloc](&v14, sel_dealloc);
}

- (unint64_t)getBehavior
{
  return self->_behavior;
}

- (BOOL)setNumberOfChannels:(unint64_t)a3 error:(id *)a4
{
  AVHapticPlayer *v6;
  id v7;
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  _BOOL4 v12;
  NSObject *v13;
  BOOL v14;
  id v15;
  AVHapticClient *client;
  _BOOL4 v17;
  NSMutableArray *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  AVHapticPlayerChannel *v23;
  NSMutableArray *channelArray;
  id v25;
  void *v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  id v32;
  uint8_t v33[128];
  uint8_t buf[4];
  const char *v35;
  __int16 v36;
  int v37;
  __int16 v38;
  const char *v39;
  __int16 v40;
  uint64_t v41;
  __int16 v42;
  int v43;
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v6 = self;
  objc_sync_enter(v6);
  if (kAVHCScope)
  {
    v7 = *(id *)kAVHCScope;
    if (!v7)
      goto LABEL_8;
  }
  else
  {
    v7 = (id)MEMORY[0x1E0C81028];
    v8 = MEMORY[0x1E0C81028];
  }
  v9 = v7;
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    -[AVHapticPlayer client](v6, "client");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136316162;
    v35 = "AVHapticPlayer.mm";
    v36 = 1024;
    v37 = 370;
    v38 = 2080;
    v39 = "-[AVHapticPlayer setNumberOfChannels:error:]";
    v40 = 2048;
    v41 = objc_msgSend(v10, "clientID");
    v42 = 1024;
    v43 = a3;
    _os_log_impl(&dword_1B573F000, v9, OS_LOG_TYPE_INFO, "%25s:%-5d %s: clientID: 0x%lx numberOfChannels: %u", buf, 0x2Cu);

  }
LABEL_8:
  -[AVHapticPlayer client](v6, "client");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "clientID") == -1;

  if (v12)
  {
    _Haptic_Check((uint64_t)"/Library/Caches/com.apple.xbs/Sources/CoreHaptics/Source/AVHapticPlayer.mm", 371, "-[AVHapticPlayer setNumberOfChannels:error:]", "self.client.clientID != kInvalidClientID", -4812, a4);
    objc_sync_exit(v6);
    v14 = 0;
    v15 = v6;
    goto LABEL_31;
  }
  if (!-[AVHapticClient running](v6->_client, "running"))
  {
    -[AVHapticClient clearAssignedChannels](v6->_client, "clearAssignedChannels");
    client = v6->_client;
    v32 = 0;
    v17 = -[AVHapticClient requestAssignedChannels:error:](client, "requestAssignedChannels:error:", a3, &v32);
    v15 = v32;
    if (v17)
    {
      -[AVHapticClient channelKeys](v6->_client, "channelKeys");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v30 = 0u;
      v31 = 0u;
      v28 = 0u;
      v29 = 0u;
      v19 = v27;
      v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
      if (v20)
      {
        v21 = *(_QWORD *)v29;
        do
        {
          for (i = 0; i != v20; ++i)
          {
            if (*(_QWORD *)v29 != v21)
              objc_enumerationMutation(v19);
            v23 = -[AVHapticPlayerChannel initWithChannelID:client:]([AVHapticPlayerChannel alloc], "initWithChannelID:client:", *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * i), v6->_client);
            -[NSMutableArray addObject:](v18, "addObject:", v23);

          }
          v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
        }
        while (v20);
      }

      -[AVHapticPlayer releaseChannels](v6, "releaseChannels");
      channelArray = v6->_channelArray;
      v6->_channelArray = v18;

    }
    goto LABEL_28;
  }
  if (!kAVHCScope)
  {
    v13 = MEMORY[0x1E0C81028];
    v25 = MEMORY[0x1E0C81028];
    goto LABEL_24;
  }
  v13 = *(id *)kAVHCScope;
  if (v13)
  {
LABEL_24:
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      v35 = "AVHapticPlayer.mm";
      v36 = 1024;
      v37 = 386;
      v38 = 2080;
      v39 = "-[AVHapticPlayer setNumberOfChannels:error:]";
      _os_log_impl(&dword_1B573F000, v13, OS_LOG_TYPE_ERROR, "%25s:%-5d %s: Can't set channel count while player is running", buf, 0x1Cu);
    }

  }
  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.CoreHaptics"), -4806, 0);
  v15 = (id)objc_claimAutoreleasedReturnValue();
LABEL_28:
  objc_sync_exit(v6);

  if (a4)
    *a4 = objc_retainAutorelease(v15);
  v14 = v15 == 0;
LABEL_31:

  return v14;
}

- (NSArray)channels
{
  void *v2;

  if (self->_channelArray)
  {
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithArray:");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v2 = 0;
  }
  return (NSArray *)v2;
}

- (double)hapticLatency
{
  double result;

  -[AVHapticClient hapticLatency](self->_client, "hapticLatency");
  return result;
}

void __44__AVHapticPlayer_setConnectionErrorHandler___block_invoke(uint64_t a1, void *a2)
{
  id WeakRetained;
  void *v4;
  void *v5;
  void (**v6)(_QWORD, _QWORD);
  id v7;

  v7 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v4 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "connectionErrorHandler");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      objc_msgSend(v4, "connectionErrorHandler");
      v6 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, id))v6)[2](v6, v7);

    }
  }

}

- (id)connectionErrorHandler
{
  return (id)MEMORY[0x1B5E4F2B4](self->_connectionErrorHandler, a2);
}

- (void)invalidateChannels
{
  AVHapticPlayer *v2;
  NSMutableArray *v3;
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
  v2 = self;
  objc_sync_enter(v2);
  v9 = 0u;
  v10 = 0u;
  v7 = 0u;
  v8 = 0u;
  v3 = v2->_channelArray;
  v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
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
        objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * v6++), "invalidate", (_QWORD)v7);
      }
      while (v4 != v6);
      v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v4);
  }

  objc_sync_exit(v2);
}

- (void)releaseChannels
{
  AVHapticPlayer *v2;
  NSMutableArray *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  NSMutableArray *channelArray;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v2 = self;
  objc_sync_enter(v2);
  v10 = 0u;
  v11 = 0u;
  v8 = 0u;
  v9 = 0u;
  v3 = v2->_channelArray;
  v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v9;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v9 != v5)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * v6++), "invalidate", (_QWORD)v8);
      }
      while (v4 != v6);
      v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v4);
  }

  channelArray = v2->_channelArray;
  v2->_channelArray = 0;

  objc_sync_exit(v2);
}

- (void)deallocateRenderResources
{
  AVHapticPlayer *v2;
  id v3;
  id v4;
  NSObject *v5;
  void *v6;
  NSObject *v7;
  id v8;
  int v9;
  const char *v10;
  __int16 v11;
  int v12;
  __int16 v13;
  const char *v14;
  __int16 v15;
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v2 = self;
  objc_sync_enter(v2);
  if (kAVHCScope)
  {
    v3 = *(id *)kAVHCScope;
    if (!v3)
      goto LABEL_8;
  }
  else
  {
    v3 = (id)MEMORY[0x1E0C81028];
    v4 = MEMORY[0x1E0C81028];
  }
  v5 = v3;
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    -[AVHapticPlayer client](v2, "client");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 136315906;
    v10 = "AVHapticPlayer.mm";
    v11 = 1024;
    v12 = 531;
    v13 = 2080;
    v14 = "-[AVHapticPlayer deallocateRenderResources]";
    v15 = 2048;
    v16 = objc_msgSend(v6, "clientID");
    _os_log_impl(&dword_1B573F000, v5, OS_LOG_TYPE_INFO, "%25s:%-5d %s: deallocating resources: clientID: 0x%lx", (uint8_t *)&v9, 0x26u);

  }
LABEL_8:
  if (v2->_resourcesAllocated)
  {
    v2->_resourcesAllocated = 0;
    -[AVHapticClient releaseResources](v2->_client, "releaseResources");
    -[AVHapticPlayer invalidateChannels](v2, "invalidateChannels");
  }
  else
  {
    if (kAVHCScope)
    {
      v7 = *(id *)kAVHCScope;
      if (!v7)
        goto LABEL_17;
    }
    else
    {
      v7 = MEMORY[0x1E0C81028];
      v8 = MEMORY[0x1E0C81028];
    }
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      v9 = 136315650;
      v10 = "AVHapticPlayer.mm";
      v11 = 1024;
      v12 = 538;
      v13 = 2080;
      v14 = "-[AVHapticPlayer deallocateRenderResources]";
      _os_log_impl(&dword_1B573F000, v7, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: Resources already deallocated -- noop", (uint8_t *)&v9, 0x1Cu);
    }

  }
LABEL_17:
  objc_sync_exit(v2);

}

- (BOOL)loadHapticEvent:(id)a3 reply:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  BOOL v12;
  int v14;
  const char *v15;
  __int16 v16;
  int v17;
  __int16 v18;
  const char *v19;
  __int16 v20;
  uint64_t v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (kAVHCScope)
  {
    v8 = *(id *)kAVHCScope;
    if (!v8)
      goto LABEL_8;
  }
  else
  {
    v8 = (id)MEMORY[0x1E0C81028];
    v9 = MEMORY[0x1E0C81028];
  }
  v10 = v8;
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    -[AVHapticPlayer client](self, "client");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 136315906;
    v15 = "AVHapticPlayer.mm";
    v16 = 1024;
    v17 = 545;
    v18 = 2080;
    v19 = "-[AVHapticPlayer loadHapticEvent:reply:]";
    v20 = 2048;
    v21 = objc_msgSend(v11, "clientID");
    _os_log_impl(&dword_1B573F000, v10, OS_LOG_TYPE_DEFAULT, "%25s:%-5d %s: loading haptic event: clientID: 0x%lx", (uint8_t *)&v14, 0x26u);

  }
LABEL_8:
  v12 = -[AVHapticClient loadHapticEvent:reply:](self->_client, "loadHapticEvent:reply:", v6, v7);

  return v12;
}

- (BOOL)createCustomAudioEvent:(id)a3 format:(id)a4 frames:(unint64_t)a5 options:(id)a6 reply:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  NSObject *v18;
  void *v19;
  BOOL v20;
  int v22;
  const char *v23;
  __int16 v24;
  int v25;
  __int16 v26;
  const char *v27;
  __int16 v28;
  uint64_t v29;
  __int16 v30;
  unint64_t v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v14 = a6;
  v15 = a7;
  if (kAVHCScope)
  {
    v16 = *(id *)kAVHCScope;
    if (!v16)
      goto LABEL_8;
  }
  else
  {
    v16 = (id)MEMORY[0x1E0C81028];
    v17 = MEMORY[0x1E0C81028];
  }
  v18 = v16;
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    -[AVHapticPlayer client](self, "client");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = 136316162;
    v23 = "AVHapticPlayer.mm";
    v24 = 1024;
    v25 = 551;
    v26 = 2080;
    v27 = "-[AVHapticPlayer createCustomAudioEvent:format:frames:options:reply:]";
    v28 = 2048;
    v29 = objc_msgSend(v19, "clientID");
    v30 = 2048;
    v31 = a5;
    _os_log_impl(&dword_1B573F000, v18, OS_LOG_TYPE_DEFAULT, "%25s:%-5d %s: creating custom audio event: clientID: 0x%lx, frameCount: %lu", (uint8_t *)&v22, 0x30u);

  }
LABEL_8:
  v20 = -[AVHapticClient createCustomAudioEvent:format:frames:options:reply:](self->_client, "createCustomAudioEvent:format:frames:options:reply:", v12, v13, a5, v14, v15);

  return v20;
}

- (BOOL)copyCustomAudioEvent:(unint64_t)a3 options:(id)a4 reply:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  NSObject *v12;
  void *v13;
  BOOL v14;
  int v16;
  const char *v17;
  __int16 v18;
  int v19;
  __int16 v20;
  const char *v21;
  __int16 v22;
  uint64_t v23;
  __int16 v24;
  int v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v8 = a4;
  v9 = a5;
  if (kAVHCScope)
  {
    v10 = *(id *)kAVHCScope;
    if (!v10)
      goto LABEL_8;
  }
  else
  {
    v10 = (id)MEMORY[0x1E0C81028];
    v11 = MEMORY[0x1E0C81028];
  }
  v12 = v10;
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    -[AVHapticPlayer client](self, "client");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 136316162;
    v17 = "AVHapticPlayer.mm";
    v18 = 1024;
    v19 = 557;
    v20 = 2080;
    v21 = "-[AVHapticPlayer copyCustomAudioEvent:options:reply:]";
    v22 = 2048;
    v23 = objc_msgSend(v13, "clientID");
    v24 = 1024;
    v25 = a3;
    _os_log_impl(&dword_1B573F000, v12, OS_LOG_TYPE_DEFAULT, "%25s:%-5d %s: copying custom audio event: clientID: 0x%lx, eventID: %u", (uint8_t *)&v16, 0x2Cu);

  }
LABEL_8:
  v14 = -[AVHapticClient copyCustomAudioEvent:options:reply:](self->_client, "copyCustomAudioEvent:options:reply:", a3, v8, v9);

  return v14;
}

- (BOOL)referenceCustomAudioEvent:(unint64_t)a3 reply:(id)a4
{
  id v6;
  id v7;
  id v8;
  NSObject *v9;
  void *v10;
  BOOL v11;
  int v13;
  const char *v14;
  __int16 v15;
  int v16;
  __int16 v17;
  const char *v18;
  __int16 v19;
  uint64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  if (kAVHCScope)
  {
    v7 = *(id *)kAVHCScope;
    if (!v7)
      goto LABEL_8;
  }
  else
  {
    v7 = (id)MEMORY[0x1E0C81028];
    v8 = MEMORY[0x1E0C81028];
  }
  v9 = v7;
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    -[AVHapticPlayer client](self, "client");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 136315906;
    v14 = "AVHapticPlayer.mm";
    v15 = 1024;
    v16 = 563;
    v17 = 2080;
    v18 = "-[AVHapticPlayer referenceCustomAudioEvent:reply:]";
    v19 = 2048;
    v20 = objc_msgSend(v10, "clientID");
    _os_log_impl(&dword_1B573F000, v9, OS_LOG_TYPE_DEFAULT, "%25s:%-5d %s: referencing custom audio event: clientID: 0x%lx", (uint8_t *)&v13, 0x26u);

  }
LABEL_8:
  v11 = -[AVHapticClient referenceCustomAudioEvent:reply:](self->_client, "referenceCustomAudioEvent:reply:", a3, v6);

  return v11;
}

- (BOOL)releaseCustomAudioEvent:(unint64_t)a3 reply:(id)a4
{
  id v6;
  id v7;
  id v8;
  NSObject *v9;
  void *v10;
  BOOL v11;
  int v13;
  const char *v14;
  __int16 v15;
  int v16;
  __int16 v17;
  const char *v18;
  __int16 v19;
  uint64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  if (kAVHCScope)
  {
    v7 = *(id *)kAVHCScope;
    if (!v7)
      goto LABEL_8;
  }
  else
  {
    v7 = (id)MEMORY[0x1E0C81028];
    v8 = MEMORY[0x1E0C81028];
  }
  v9 = v7;
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    -[AVHapticPlayer client](self, "client");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 136315906;
    v14 = "AVHapticPlayer.mm";
    v15 = 1024;
    v16 = 569;
    v17 = 2080;
    v18 = "-[AVHapticPlayer releaseCustomAudioEvent:reply:]";
    v19 = 2048;
    v20 = objc_msgSend(v10, "clientID");
    _os_log_impl(&dword_1B573F000, v9, OS_LOG_TYPE_DEFAULT, "%25s:%-5d %s: releasing custom audio event: clientID: 0x%lx", (uint8_t *)&v13, 0x26u);

  }
LABEL_8:
  v11 = -[AVHapticClient releaseCustomAudioEvent:reply:](self->_client, "releaseCustomAudioEvent:reply:", a3, v6);

  return v11;
}

- (BOOL)loadAndPrepareHapticSequenceFromData:(id)a3 reply:(id)a4
{
  id v6;
  id v7;
  AVHapticPlayer *v8;
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  BOOL v13;
  int v15;
  const char *v16;
  __int16 v17;
  int v18;
  __int16 v19;
  const char *v20;
  __int16 v21;
  uint64_t v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = self;
  objc_sync_enter(v8);
  if (kAVHCScope)
  {
    v9 = *(id *)kAVHCScope;
    if (!v9)
      goto LABEL_8;
  }
  else
  {
    v9 = (id)MEMORY[0x1E0C81028];
    v10 = MEMORY[0x1E0C81028];
  }
  v11 = v9;
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    -[AVHapticPlayer client](v8, "client");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 136315906;
    v16 = "AVHapticPlayer.mm";
    v17 = 1024;
    v18 = 577;
    v19 = 2080;
    v20 = "-[AVHapticPlayer loadAndPrepareHapticSequenceFromData:reply:]";
    v21 = 2048;
    v22 = objc_msgSend(v12, "clientID");
    _os_log_impl(&dword_1B573F000, v11, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: loading haptic sequence from NSData: clientID: 0x%lx", (uint8_t *)&v15, 0x26u);

  }
LABEL_8:
  v13 = -[AVHapticClient loadAndPrepareHapticSequenceFromData:reply:](v8->_client, "loadAndPrepareHapticSequenceFromData:reply:", v6, v7);
  objc_sync_exit(v8);

  return v13;
}

- (BOOL)loadAndPrepareHapticSequenceFromEvents:(id)a3 reply:(id)a4
{
  id v6;
  id v7;
  AVHapticPlayer *v8;
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  BOOL v13;
  int v15;
  const char *v16;
  __int16 v17;
  int v18;
  __int16 v19;
  const char *v20;
  __int16 v21;
  uint64_t v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = self;
  objc_sync_enter(v8);
  if (kAVHCScope)
  {
    v9 = *(id *)kAVHCScope;
    if (!v9)
      goto LABEL_8;
  }
  else
  {
    v9 = (id)MEMORY[0x1E0C81028];
    v10 = MEMORY[0x1E0C81028];
  }
  v11 = v9;
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    -[AVHapticPlayer client](v8, "client");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 136315906;
    v16 = "AVHapticPlayer.mm";
    v17 = 1024;
    v18 = 587;
    v19 = 2080;
    v20 = "-[AVHapticPlayer loadAndPrepareHapticSequenceFromEvents:reply:]";
    v21 = 2048;
    v22 = objc_msgSend(v12, "clientID");
    _os_log_impl(&dword_1B573F000, v11, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: loading and preparing haptic sequence from NSArray: clientID: 0x%lx", (uint8_t *)&v15, 0x26u);

  }
LABEL_8:
  v13 = -[AVHapticClient loadAndPrepareHapticSequenceFromEvents:reply:](v8->_client, "loadAndPrepareHapticSequenceFromEvents:reply:", v6, v7);
  objc_sync_exit(v8);

  return v13;
}

- (BOOL)loadAndPrepareHapticSequenceFromVibePattern:(id)a3 reply:(id)a4
{
  id v6;
  id v7;
  AVHapticPlayer *v8;
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  BOOL v13;
  int v15;
  const char *v16;
  __int16 v17;
  int v18;
  __int16 v19;
  const char *v20;
  __int16 v21;
  uint64_t v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = self;
  objc_sync_enter(v8);
  if (kAVHCScope)
  {
    v9 = *(id *)kAVHCScope;
    if (!v9)
      goto LABEL_8;
  }
  else
  {
    v9 = (id)MEMORY[0x1E0C81028];
    v10 = MEMORY[0x1E0C81028];
  }
  v11 = v9;
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    -[AVHapticPlayer client](v8, "client");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 136315906;
    v16 = "AVHapticPlayer.mm";
    v17 = 1024;
    v18 = 597;
    v19 = 2080;
    v20 = "-[AVHapticPlayer loadAndPrepareHapticSequenceFromVibePattern:reply:]";
    v21 = 2048;
    v22 = objc_msgSend(v12, "clientID");
    _os_log_impl(&dword_1B573F000, v11, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: loading and preparing haptic pattern: clientID: 0x%lx", (uint8_t *)&v15, 0x26u);

  }
LABEL_8:
  v13 = -[AVHapticClient loadAndPrepareHapticSequenceFromVibePattern:reply:](v8->_client, "loadAndPrepareHapticSequenceFromVibePattern:reply:", v6, v7);
  objc_sync_exit(v8);

  return v13;
}

- (BOOL)prepareHapticSequence:(unint64_t)a3 error:(id *)a4
{
  int v4;
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  int v11;
  const char *v12;
  __int16 v13;
  int v14;
  __int16 v15;
  const char *v16;
  __int16 v17;
  int v18;
  __int16 v19;
  uint64_t v20;
  uint64_t v21;

  v4 = a3;
  v21 = *MEMORY[0x1E0C80C00];
  if (kAVHCScope)
  {
    v6 = *(id *)kAVHCScope;
    if (!v6)
      return 1;
  }
  else
  {
    v6 = (id)MEMORY[0x1E0C81028];
    v7 = MEMORY[0x1E0C81028];
  }
  v8 = v6;
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    -[AVHapticPlayer client](self, "client");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 136316162;
    v12 = "AVHapticPlayer.mm";
    v13 = 1024;
    v14 = 606;
    v15 = 2080;
    v16 = "-[AVHapticPlayer prepareHapticSequence:error:]";
    v17 = 1024;
    v18 = v4;
    v19 = 2048;
    v20 = objc_msgSend(v9, "clientID");
    _os_log_impl(&dword_1B573F000, v8, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: sequence %u already prepared for clientID: 0x%lx - NOOP", (uint8_t *)&v11, 0x2Cu);

  }
  return 1;
}

- (BOOL)enableSequenceLooping:(unint64_t)a3 enable:(BOOL)a4 error:(id *)a5
{
  _BOOL8 v6;
  NSObject *v9;
  id v10;
  int v12;
  const char *v13;
  __int16 v14;
  int v15;
  __int16 v16;
  const char *v17;
  uint64_t v18;

  v6 = a4;
  v18 = *MEMORY[0x1E0C80C00];
  if (kAVHCScope)
  {
    v9 = *(id *)kAVHCScope;
    if (!v9)
      return -[AVHapticClient enableSequenceLooping:enable:error:](self->_client, "enableSequenceLooping:enable:error:", a3, v6, a5);
  }
  else
  {
    v9 = MEMORY[0x1E0C81028];
    v10 = MEMORY[0x1E0C81028];
  }
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    v12 = 136315650;
    v13 = "AVHapticPlayer.mm";
    v14 = 1024;
    v15 = 620;
    v16 = 2080;
    v17 = "-[AVHapticPlayer enableSequenceLooping:enable:error:]";
    _os_log_impl(&dword_1B573F000, v9, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: enable sequence looping: entered", (uint8_t *)&v12, 0x1Cu);
  }

  return -[AVHapticClient enableSequenceLooping:enable:error:](self->_client, "enableSequenceLooping:enable:error:", a3, v6, a5);
}

- (BOOL)setSequenceLoopLength:(unint64_t)a3 length:(float)a4 error:(id *)a5
{
  NSObject *v9;
  double v10;
  id v11;
  int v13;
  const char *v14;
  __int16 v15;
  int v16;
  __int16 v17;
  const char *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  if (kAVHCScope)
  {
    v9 = *(id *)kAVHCScope;
    if (!v9)
      goto LABEL_8;
  }
  else
  {
    v9 = MEMORY[0x1E0C81028];
    v11 = MEMORY[0x1E0C81028];
  }
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    v13 = 136315650;
    v14 = "AVHapticPlayer.mm";
    v15 = 1024;
    v16 = 626;
    v17 = 2080;
    v18 = "-[AVHapticPlayer setSequenceLoopLength:length:error:]";
    _os_log_impl(&dword_1B573F000, v9, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: set sequence loop length: entered", (uint8_t *)&v13, 0x1Cu);
  }

LABEL_8:
  *(float *)&v10 = a4;
  return -[AVHapticClient setSequenceLoopLength:length:error:](self->_client, "setSequenceLoopLength:length:error:", a3, a5, v10);
}

- (BOOL)setSequencePlaybackRate:(unint64_t)a3 rate:(float)a4 error:(id *)a5
{
  NSObject *v9;
  double v10;
  id v11;
  int v13;
  const char *v14;
  __int16 v15;
  int v16;
  __int16 v17;
  const char *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  if (kAVHCScope)
  {
    v9 = *(id *)kAVHCScope;
    if (!v9)
      goto LABEL_8;
  }
  else
  {
    v9 = MEMORY[0x1E0C81028];
    v11 = MEMORY[0x1E0C81028];
  }
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    v13 = 136315650;
    v14 = "AVHapticPlayer.mm";
    v15 = 1024;
    v16 = 632;
    v17 = 2080;
    v18 = "-[AVHapticPlayer setSequencePlaybackRate:rate:error:]";
    _os_log_impl(&dword_1B573F000, v9, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: set sequence playback rate: entered", (uint8_t *)&v13, 0x1Cu);
  }

LABEL_8:
  *(float *)&v10 = a4;
  return -[AVHapticClient setSequencePlaybackRate:rate:error:](self->_client, "setSequencePlaybackRate:rate:error:", a3, a5, v10);
}

- (void)stopPrewarm
{
  AVHapticPlayer *v2;
  id v3;
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  _BOOL4 v8;
  uint64_t v9;
  uint8_t buf[4];
  const char *v11;
  __int16 v12;
  int v13;
  __int16 v14;
  const char *v15;
  __int16 v16;
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v2 = self;
  objc_sync_enter(v2);
  if (kAVHCScope)
  {
    v3 = *(id *)kAVHCScope;
    if (!v3)
      goto LABEL_8;
  }
  else
  {
    v3 = (id)MEMORY[0x1E0C81028];
    v4 = MEMORY[0x1E0C81028];
  }
  v5 = v3;
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    -[AVHapticPlayer client](v2, "client");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315906;
    v11 = "AVHapticPlayer.mm";
    v12 = 1024;
    v13 = 653;
    v14 = 2080;
    v15 = "-[AVHapticPlayer stopPrewarm]";
    v16 = 2048;
    v17 = objc_msgSend(v6, "clientID");
    _os_log_impl(&dword_1B573F000, v5, OS_LOG_TYPE_DEFAULT, "%25s:%-5d %s: stop prewarm: clientID: 0x%lx", buf, 0x26u);

  }
LABEL_8:
  -[AVHapticPlayer client](v2, "client");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "clientID") == -1;

  if (v8)
  {
    v9 = 0;
    _Haptic_Check((uint64_t)"/Library/Caches/com.apple.xbs/Sources/CoreHaptics/Source/AVHapticPlayer.mm", 654, "-[AVHapticPlayer stopPrewarm]", "self.client.clientID != kInvalidClientID", -4812, &v9);
  }
  else
  {
    -[AVHapticClient stopPrewarm](v2->_client, "stopPrewarm");
  }
  objc_sync_exit(v2);

}

void __52__AVHapticPlayer_startRunningWithCompletionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  NSObject *v4;
  id v5;
  uint64_t v6;
  id WeakRetained;
  void (**v8)(_QWORD, _QWORD);
  uint64_t v9;
  int v10;
  const char *v11;
  __int16 v12;
  int v13;
  __int16 v14;
  const char *v15;
  __int16 v16;
  uint64_t v17;
  __int16 v18;
  int v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  if (kAVHCScope)
  {
    v4 = *(id *)kAVHCScope;
    if (!v4)
      goto LABEL_8;
  }
  else
  {
    v4 = MEMORY[0x1E0C81028];
    v5 = MEMORY[0x1E0C81028];
  }
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v6 = *(_QWORD *)(a1 + 40);
    v10 = 136316162;
    v11 = "AVHapticPlayer.mm";
    v12 = 1024;
    v13 = 669;
    v14 = 2080;
    v15 = "-[AVHapticPlayer startRunningWithCompletionHandler:]_block_invoke";
    v16 = 2048;
    v17 = v6;
    v18 = 1024;
    v19 = a2;
    _os_log_impl(&dword_1B573F000, v4, OS_LOG_TYPE_INFO, "%25s:%-5d %s: Client 0x%lx asynchronously stopped for reason %d", (uint8_t *)&v10, 0x2Cu);
  }

LABEL_8:
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "stopRunningHandler");
  v8 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    if ((unint64_t)(a2 + 1) >= 5)
      v9 = -2;
    else
      v9 = qword_1B5794520[a2 + 1];
    v8[2](v8, v9);
  }

}

void __52__AVHapticPlayer_startRunningWithCompletionHandler___block_invoke_68(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  uint64_t v6;
  int v7;
  const char *v8;
  __int16 v9;
  int v10;
  __int16 v11;
  const char *v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (kAVHCScope)
  {
    if ((*(_BYTE *)(kAVHCScope + 8) & 1) != 0)
    {
      v4 = *(id *)kAVHCScope;
      if (v4)
      {
        v5 = v4;
        if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
        {
          v7 = 136315906;
          v8 = "AVHapticPlayer.mm";
          v9 = 1024;
          v10 = 695;
          v11 = 2080;
          v12 = "-[AVHapticPlayer startRunningWithCompletionHandler:]_block_invoke";
          v13 = 2112;
          v14 = v3;
          _os_log_impl(&dword_1B573F000, v5, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: reply block for _client startRunning: replyError: %@", (uint8_t *)&v7, 0x26u);
        }

      }
    }
  }
  v6 = *(_QWORD *)(a1 + 32);
  if (v6)
    (*(void (**)(uint64_t, id))(v6 + 16))(v6, v3);

}

- (void)stopRunning
{
  AVHapticPlayer *v2;
  id v3;
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  _BOOL4 v8;
  uint64_t v9;
  uint8_t buf[4];
  const char *v11;
  __int16 v12;
  int v13;
  __int16 v14;
  const char *v15;
  __int16 v16;
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v2 = self;
  objc_sync_enter(v2);
  if (kAVHCScope)
  {
    v3 = *(id *)kAVHCScope;
    if (!v3)
      goto LABEL_8;
  }
  else
  {
    v3 = (id)MEMORY[0x1E0C81028];
    v4 = MEMORY[0x1E0C81028];
  }
  v5 = v3;
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    -[AVHapticPlayer client](v2, "client");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315906;
    v11 = "AVHapticPlayer.mm";
    v12 = 1024;
    v13 = 715;
    v14 = 2080;
    v15 = "-[AVHapticPlayer stopRunning]";
    v16 = 2048;
    v17 = objc_msgSend(v6, "clientID");
    _os_log_impl(&dword_1B573F000, v5, OS_LOG_TYPE_DEFAULT, "%25s:%-5d %s: stop running: clientID: 0x%lx", buf, 0x26u);

  }
LABEL_8:
  -[AVHapticPlayer client](v2, "client");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "clientID") == -1;

  if (v8)
  {
    v9 = 0;
    _Haptic_Check((uint64_t)"/Library/Caches/com.apple.xbs/Sources/CoreHaptics/Source/AVHapticPlayer.mm", 716, "-[AVHapticPlayer stopRunning]", "self.client.clientID != kInvalidClientID", -4812, &v9);
  }
  else if (v2->_resourcesAllocated)
  {
    -[AVHapticClient stopRunning](v2->_client, "stopRunning");
  }
  objc_sync_exit(v2);

}

- (BOOL)playHapticSequence:(unint64_t)a3 atTime:(double)a4 offset:(double)a5
{
  return -[AVHapticClient startHapticSequence:atTime:withOffset:](self->_client, "startHapticSequence:atTime:withOffset:", a3, a4, a5);
}

- (BOOL)stopHapticSequence:(unint64_t)a3 atTime:(double)a4
{
  return -[AVHapticClient stopHapticSequence:atTime:](self->_client, "stopHapticSequence:atTime:", a3, a4);
}

- (BOOL)pauseHapticSequence:(unint64_t)a3 atTime:(double)a4
{
  return -[AVHapticClient pauseHapticSequence:atTime:](self->_client, "pauseHapticSequence:atTime:", a3, a4);
}

- (BOOL)resumeHapticSequence:(unint64_t)a3 atTime:(double)a4
{
  return -[AVHapticClient resumeHapticSequence:atTime:](self->_client, "resumeHapticSequence:atTime:", a3, a4);
}

- (BOOL)seekHapticSequence:(unint64_t)a3 toTime:(double)a4
{
  return -[AVHapticClient seekHapticSequence:toTime:](self->_client, "seekHapticSequence:toTime:", a3, a4);
}

- (BOOL)resetHapticSequence:(unint64_t)a3 atTime:(double)a4
{
  return -[AVHapticClient resetHapticSequence:atTime:](self->_client, "resetHapticSequence:atTime:", a3, a4);
}

- (BOOL)sendUnduckAudioCommand:(unint64_t)a3 atTime:(double)a4
{
  return -[AVHapticClient sendUnduckAudioCommand:atTime:](self->_client, "sendUnduckAudioCommand:atTime:", a3, a4);
}

- (BOOL)setSequenceChannelParam:(unint64_t)a3 atTime:(double)a4 channel:(unint64_t)a5 param:(unint64_t)a6 value:(float)a7 error:(id *)a8
{
  return -[AVHapticClient setSequenceChannelParameter:atTime:value:sequenceID:channel:](self->_client, "setSequenceChannelParameter:atTime:value:sequenceID:channel:", a6, a3, a5, a8, a4);
}

- (BOOL)clearSequenceEvents:(unint64_t)a3 atTime:(double)a4
{
  return -[AVHapticClient clearSequenceEvents:atTime:](self->_client, "clearSequenceEvents:atTime:", a3, a4);
}

- (void)detachHapticSequence:(unint64_t)a3
{
  -[AVHapticClient detachHapticSequence:](self->_client, "detachHapticSequence:", a3);
}

- (id)stopRunningHandler
{
  return objc_getProperty(self, a2, 48, 1);
}

- (BOOL)resourcesAllocated
{
  return self->_resourcesAllocated;
}

- (unint64_t)behavior
{
  return self->_behavior;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_stopRunningHandler, 0);
  objc_storeStrong(&self->_connectionErrorHandler, 0);
  objc_storeStrong((id *)&self->_channelArray, 0);
  objc_storeStrong((id *)&self->_client, 0);
}

- (void)addChannel:.cold.1()
{
  int v0;
  const char *v1;
  __int16 v2;
  int v3;

  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v0 = 136315394;
    v1 = "AVHapticPlayer.mm";
    v2 = 1024;
    v3 = 411;
    _os_log_impl(&dword_1B573F000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "%25s:%-5d ASSERTION FAILURE [(newChannelCount == oldChannelCount + 1) != 0 is false]: ", (uint8_t *)&v0, 0x12u);
  }
  __break(1u);
  AudioConverterPrepare();
}

@end
