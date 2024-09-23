@implementation CHHapticEngine

+ (BOOL)supports1stPartyHaptics
{
  return +[CHHapticEngine supportsHapticServer](CHHapticEngine, "supportsHapticServer");
}

+ (BOOL)supportsHapticServer
{
  return +[AVHapticPlayer supportsHaptics](AVHapticPlayer, "supportsHaptics");
}

void __44__CHHapticEngine_notifyWhenPlayersFinished___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id v5;
  id WeakRetained;
  NSObject *v7;
  id v8;
  int v9;
  const char *v10;
  __int16 v11;
  int v12;
  __int16 v13;
  const char *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (kHAPIScope)
  {
    v4 = *(id *)kHAPIScope;
    if (!v4)
      goto LABEL_8;
  }
  else
  {
    v4 = MEMORY[0x1E0C81028];
    v5 = MEMORY[0x1E0C81028];
  }
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    v9 = 136315650;
    v10 = "CHHapticEngine.mm";
    v11 = 1024;
    v12 = 1389;
    v13 = 2080;
    v14 = "-[CHHapticEngine notifyWhenPlayersFinished:]_block_invoke_2";
    _os_log_impl(&dword_1B573F000, v4, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: <Top of AV finishWithCompletionHandler block>", (uint8_t *)&v9, 0x1Cu);
  }

LABEL_8:
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "handleFinish:", v3);
  if (kHAPIScope)
  {
    v7 = *(id *)kHAPIScope;
    if (!v7)
      goto LABEL_15;
  }
  else
  {
    v7 = MEMORY[0x1E0C81028];
    v8 = MEMORY[0x1E0C81028];
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    v9 = 136315650;
    v10 = "CHHapticEngine.mm";
    v11 = 1024;
    v12 = 1392;
    v13 = 2080;
    v14 = "-[CHHapticEngine notifyWhenPlayersFinished:]_block_invoke";
    _os_log_impl(&dword_1B573F000, v7, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: <Bottom of AV finishWithCompletionHandler block>", (uint8_t *)&v9, 0x1Cu);
  }

LABEL_15:
}

- (void)handleFinish:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  NSObject *v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  id v17;
  id v18;
  id location;
  uint8_t buf[4];
  const char *v21;
  __int16 v22;
  int v23;
  __int16 v24;
  const char *v25;
  __int16 v26;
  CHHapticEngine *v27;
  __int16 v28;
  id v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (kHAPIScope)
  {
    v5 = *(id *)kHAPIScope;
    if (!v5)
      goto LABEL_8;
  }
  else
  {
    v5 = MEMORY[0x1E0C81028];
    v6 = MEMORY[0x1E0C81028];
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136316162;
    v21 = "CHHapticEngine.mm";
    v22 = 1024;
    v23 = 786;
    v24 = 2080;
    v25 = "-[CHHapticEngine handleFinish:]";
    v26 = 2048;
    v27 = self;
    v28 = 2112;
    v29 = v4;
    _os_log_impl(&dword_1B573F000, v5, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: Called on engine %p with error %@", buf, 0x30u);
  }

LABEL_8:
  objc_initWeak(&location, self);
  -[CHHapticEngine clientFinishedHandler](self, "clientFinishedHandler");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CHHapticEngine stoppedHandler](self, "stoppedHandler");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __31__CHHapticEngine_handleFinish___block_invoke;
  v14[3] = &unk_1E6960818;
  objc_copyWeak(&v18, &location);
  v9 = v7;
  v16 = v9;
  v10 = v4;
  v15 = v10;
  v11 = v8;
  v17 = v11;
  -[CHHapticEngine dispatchOnLocal:](self, "dispatchOnLocal:", v14);
  if (kHAPIScope)
  {
    v12 = *(id *)kHAPIScope;
    if (!v12)
      goto LABEL_15;
  }
  else
  {
    v12 = MEMORY[0x1E0C81028];
    v13 = MEMORY[0x1E0C81028];
  }
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315650;
    v21 = "CHHapticEngine.mm";
    v22 = 1024;
    v23 = 846;
    v24 = 2080;
    v25 = "-[CHHapticEngine handleFinish:]";
    _os_log_impl(&dword_1B573F000, v12, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: Done handling finish", buf, 0x1Cu);
  }

LABEL_15:
  objc_destroyWeak(&v18);

  objc_destroyWeak(&location);
}

- (CHHapticEngineStoppedHandler)stoppedHandler
{
  return objc_getProperty(self, a2, 72, 1);
}

- (id)clientFinishedHandler
{
  return objc_getProperty(self, a2, 96, 1);
}

+ (void)initialize
{
  uint64_t v2;

  v2 = operator new();
  *(_QWORD *)v2 = 850045863;
  *(_OWORD *)(v2 + 8) = 0u;
  *(_OWORD *)(v2 + 24) = 0u;
  *(_OWORD *)(v2 + 40) = 0u;
  *(_QWORD *)(v2 + 56) = 0;
  _sResourceMutex = v2;
}

void __41__CHHapticEngine_capabilitiesForHardware__block_invoke()
{
  id v0;
  void *v1;

  v0 = -[CHDefaultHapticDeviceCapability initPrivate]([CHDefaultHapticDeviceCapability alloc], "initPrivate");
  v1 = (void *)+[CHHapticEngine capabilitiesForHardware]::sDefaultHardwareCapabilities;
  +[CHHapticEngine capabilitiesForHardware]::sDefaultHardwareCapabilities = (uint64_t)v0;

}

void __47__CHHapticEngine_prewarmWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  id v8;
  NSObject *v9;
  void *v10;
  NSObject *v11;
  id v12;
  int v13;
  const char *v14;
  __int16 v15;
  int v16;
  __int16 v17;
  const char *v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = v3;
  v5 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
  if (v5)
  {
    v6 = v5;

    v4 = v6;
  }
  else if (!v3)
  {
    goto LABEL_11;
  }
  if (kHAPIScope)
  {
    v7 = *(id *)kHAPIScope;
    if (!v7)
      goto LABEL_11;
  }
  else
  {
    v7 = (id)MEMORY[0x1E0C81028];
    v8 = MEMORY[0x1E0C81028];
  }
  v9 = v7;
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    objc_msgSend(v4, "localizedDescription");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 136315906;
    v14 = "CHHapticEngine.mm";
    v15 = 1024;
    v16 = 1161;
    v17 = 2080;
    v18 = "-[CHHapticEngine prewarmWithCompletionHandler:]_block_invoke";
    v19 = 2112;
    v20 = v10;
    _os_log_impl(&dword_1B573F000, v9, OS_LOG_TYPE_ERROR, "%25s:%-5d %s: ERROR: Player prewarm failed: %@", (uint8_t *)&v13, 0x26u);

  }
LABEL_11:
  if (*(_QWORD *)(a1 + 32))
  {
    if (kHAPIScope)
    {
      v11 = *(id *)kHAPIScope;
      if (!v11)
      {
LABEL_19:
        (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
        goto LABEL_20;
      }
    }
    else
    {
      v11 = MEMORY[0x1E0C81028];
      v12 = MEMORY[0x1E0C81028];
    }
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      v13 = 136315650;
      v14 = "CHHapticEngine.mm";
      v15 = 1024;
      v16 = 1164;
      v17 = 2080;
      v18 = "-[CHHapticEngine prewarmWithCompletionHandler:]_block_invoke";
      _os_log_impl(&dword_1B573F000, v11, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: Calling prewarm completion handler", (uint8_t *)&v13, 0x1Cu);
    }

    goto LABEL_19;
  }
LABEL_20:

}

- (void)setStoppedHandler:(CHHapticEngineStoppedHandler)stoppedHandler
{
  objc_setProperty_atomic_copy(self, a2, stoppedHandler, 72);
}

- (void)setResetHandler:(CHHapticEngineResetHandler)resetHandler
{
  objc_setProperty_atomic_copy(self, a2, resetHandler, 80);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 6) = 0;
  *((_QWORD *)self + 5) = 0;
  *((_QWORD *)self + 4) = (char *)self + 40;
  return self;
}

- (void)releaseChannel:(id)a3
{
  AVHapticPlayer *player;
  BOOL v4;
  id v5;
  NSObject *v6;
  id v7;
  id v8;
  uint8_t buf[4];
  const char *v10;
  __int16 v11;
  int v12;
  __int16 v13;
  const char *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  player = self->_player;
  v8 = 0;
  v4 = -[AVHapticPlayer removeChannel:error:](player, "removeChannel:error:", a3, &v8);
  v5 = v8;
  if (!v4)
  {
    if (kHAPIScope)
    {
      v6 = *(id *)kHAPIScope;
      if (!v6)
        goto LABEL_9;
    }
    else
    {
      v6 = MEMORY[0x1E0C81028];
      v7 = MEMORY[0x1E0C81028];
    }
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      v10 = "CHHapticEngine.mm";
      v11 = 1024;
      v12 = 1986;
      v13 = 2080;
      v14 = "-[CHHapticEngine(CHHapticEngineInternal) releaseChannel:]";
      _os_log_impl(&dword_1B573F000, v6, OS_LOG_TYPE_ERROR, "%25s:%-5d %s: ERROR: This channel was not registered", buf, 0x1Cu);
    }

  }
LABEL_9:

}

+ (BOOL)resourceIsRegistered:(unint64_t)a3
{
  std::mutex *v4;
  uint64_t v5;
  _QWORD *v6;
  uint64_t v7;
  unint64_t v8;
  BOOL v9;
  _QWORD *v10;
  BOOL v11;

  v4 = (std::mutex *)_sResourceMutex;
  std::mutex::lock((std::mutex *)_sResourceMutex);
  if (_sResourceEntries)
  {
    v5 = _sResourceEntries + 8;
    v6 = *(_QWORD **)(_sResourceEntries + 8);
    if (!v6)
      goto LABEL_13;
    v7 = _sResourceEntries + 8;
    do
    {
      v8 = v6[4];
      v9 = v8 >= a3;
      if (v8 >= a3)
        v10 = v6;
      else
        v10 = v6 + 1;
      if (v9)
        v7 = (uint64_t)v6;
      v6 = (_QWORD *)*v10;
    }
    while (*v10);
    if (v7 == v5 || *(_QWORD *)(v7 + 32) > a3)
LABEL_13:
      v7 = _sResourceEntries + 8;
    v11 = v7 != v5;
  }
  else
  {
    v11 = 0;
  }
  std::mutex::unlock(v4);
  return v11;
}

void __47__CHHapticEngine_doStartWithCompletionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id v5;
  id WeakRetained;
  void *v7;
  id v8;
  id v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;
  id v18;
  uint8_t buf[4];
  const char *v20;
  __int16 v21;
  int v22;
  __int16 v23;
  const char *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (kHAPIScope)
  {
    v4 = *(id *)kHAPIScope;
    if (!v4)
      goto LABEL_8;
  }
  else
  {
    v4 = MEMORY[0x1E0C81028];
    v5 = MEMORY[0x1E0C81028];
  }
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315650;
    v20 = "CHHapticEngine.mm";
    v21 = 1024;
    v22 = 1191;
    v23 = 2080;
    v24 = "-[CHHapticEngine doStartWithCompletionHandler:]_block_invoke_2";
    _os_log_impl(&dword_1B573F000, v4, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: In underlying AVHapticPlayer's completion handler block", buf, 0x1Cu);
  }

LABEL_8:
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v7 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
  if (v7)
  {
    v8 = v7;

    v3 = v8;
  }
  if (WeakRetained)
  {
    objc_initWeak((id *)buf, WeakRetained);
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __47__CHHapticEngine_doStartWithCompletionHandler___block_invoke_155;
    v15[3] = &unk_1E6960888;
    objc_copyWeak(&v18, (id *)buf);
    v16 = v3;
    v17 = *(id *)(a1 + 32);
    v9 = v3;
    objc_msgSend(WeakRetained, "dispatchOnLocal:", v15);

    objc_destroyWeak(&v18);
    objc_destroyWeak((id *)buf);
  }
  else
  {
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __47__CHHapticEngine_doStartWithCompletionHandler___block_invoke_156;
    v12[3] = &unk_1E695FF00;
    v10 = *(id *)(a1 + 32);
    v13 = v3;
    v14 = v10;
    v11 = v3;
    +[CHHapticEngine dispatchOnGlobal:](CHHapticEngine, "dispatchOnGlobal:", v12);

  }
}

void __46__CHHapticEngine_doStopWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id v5;
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  id WeakRetained;
  _QWORD v11[4];
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  id v17;
  uint8_t buf[4];
  const char *v19;
  __int16 v20;
  int v21;
  __int16 v22;
  const char *v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (kHAPIScope)
  {
    v4 = *(id *)kHAPIScope;
    if (!v4)
      goto LABEL_8;
  }
  else
  {
    v4 = MEMORY[0x1E0C81028];
    v5 = MEMORY[0x1E0C81028];
  }
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315650;
    v19 = "CHHapticEngine.mm";
    v20 = 1024;
    v21 = 1327;
    v22 = 2080;
    v23 = "-[CHHapticEngine doStopWithCompletionHandler:]_block_invoke";
    _os_log_impl(&dword_1B573F000, v4, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: In underlying AVHapticPlayer's completion handler block for doStopWithCompletionHandler", buf, 0x1Cu);
  }

LABEL_8:
  if (!v3)
    goto LABEL_16;
  if (kHAPIScope)
  {
    v6 = *(id *)kHAPIScope;
    if (!v6)
      goto LABEL_16;
  }
  else
  {
    v6 = (id)MEMORY[0x1E0C81028];
    v7 = MEMORY[0x1E0C81028];
  }
  v8 = v6;
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
  {
    objc_msgSend(v3, "localizedDescription");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315906;
    v19 = "CHHapticEngine.mm";
    v20 = 1024;
    v21 = 1328;
    v22 = 2080;
    v23 = "-[CHHapticEngine doStopWithCompletionHandler:]_block_invoke";
    v24 = 2112;
    v25 = v9;
    _os_log_impl(&dword_1B573F000, v8, OS_LOG_TYPE_ERROR, "%25s:%-5d %s: ERROR: Lower-level player stop failed: %@", buf, 0x26u);

  }
LABEL_16:
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    objc_initWeak((id *)buf, WeakRetained);
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __46__CHHapticEngine_doStopWithCompletionHandler___block_invoke_160;
    v14[3] = &unk_1E6960928;
    objc_copyWeak(&v17, (id *)buf);
    v16 = *(id *)(a1 + 32);
    v15 = v3;
    objc_msgSend(WeakRetained, "dispatchOnLocal:", v14);

    objc_destroyWeak(&v17);
    objc_destroyWeak((id *)buf);
  }
  else
  {
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __46__CHHapticEngine_doStopWithCompletionHandler___block_invoke_161;
    v11[3] = &unk_1E695FF00;
    v13 = *(id *)(a1 + 32);
    v12 = v3;
    +[CHHapticEngine dispatchOnGlobal:](CHHapticEngine, "dispatchOnGlobal:", v11);

  }
}

void __47__CHHapticEngine_doStartWithCompletionHandler___block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "metrics");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "handleEngineStart");

}

- (void)setPlaysHapticsOnly:(BOOL)playsHapticsOnly
{
  _BOOL8 v3;
  void *v5;
  int v6;
  id v7;

  v3 = playsHapticsOnly;
  -[CHHapticEngine serverConfig](self, "serverConfig");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v7, "supportsHapticPlayback") & 1) != 0)
  {
    -[CHHapticEngine serverConfig](self, "serverConfig");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "supportsAudioPlayback");

    if (v6)
      -[CHHapticEngine toggleBehavior:set:](self, "toggleBehavior:set:", 1, v3);
  }
  else
  {

  }
}

- (id)createHapticPlayerWithOptions:(id)a3
{
  id v3;
  NSObject *v4;
  __int128 v5;
  id v6;
  unsigned int v7;
  AVHapticPlayer *v8;
  void *v9;
  NSObject *v10;
  NSObject *v11;
  NSObject *v12;
  AVHapticPlayer *v13;
  AVHapticPlayer *v14;
  id v15;
  NSObject *v16;
  AVHapticPlayer *v17;
  id v18;
  __int128 v20;
  id v21;
  uint8_t buf[4];
  const char *v23;
  __int16 v24;
  int v25;
  __int16 v26;
  const char *v27;
  __int16 v28;
  id v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (!kHAPIScope)
  {
    v4 = MEMORY[0x1E0C81028];
    v6 = MEMORY[0x1E0C81028];
    goto LABEL_5;
  }
  v4 = *(id *)kHAPIScope;
  if (v4)
  {
LABEL_5:
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315650;
      v23 = "CHHapticEngine.mm";
      v24 = 1024;
      v25 = 618;
      v26 = 2080;
      v27 = "-[CHHapticEngine createHapticPlayerWithOptions:]";
      _os_log_impl(&dword_1B573F000, v4, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: Creating underlying Haptic Player", buf, 0x1Cu);
    }

  }
  v7 = 0;
  v8 = 0;
  v9 = 0;
  v10 = MEMORY[0x1E0C81028];
  *(_QWORD *)&v5 = 136315906;
  v20 = v5;
  do
  {
    if (v7)
    {
      if (kHAPIScope)
      {
        v11 = *(id *)kHAPIScope;
        if (!v11)
          goto LABEL_17;
      }
      else
      {
        v12 = v10;
        v11 = v10;
      }
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = v20;
        v23 = "CHHapticEngine.mm";
        v24 = 1024;
        v25 = 623;
        v26 = 2080;
        v27 = "-[CHHapticEngine createHapticPlayerWithOptions:]";
        v28 = 1024;
        LODWORD(v29) = v7;
        _os_log_impl(&dword_1B573F000, v11, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: Attempt #%d...", buf, 0x22u);
      }

    }
LABEL_17:
    v13 = [AVHapticPlayer alloc];
    v21 = v9;
    v14 = -[AVHapticPlayer initWithOptions:error:](v13, "initWithOptions:error:", v3, &v21);
    v15 = v21;

    if (v7 > 4)
      break;
    ++v7;
    v8 = v14;
    v9 = v15;
  }
  while (v15);
  if (v15)
  {
    if (kHAPIScope)
    {
      v16 = *(id *)kHAPIScope;
      if (!v16)
        goto LABEL_28;
    }
    else
    {
      v16 = MEMORY[0x1E0C81028];
      v18 = MEMORY[0x1E0C81028];
    }
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = v20;
      v23 = "CHHapticEngine.mm";
      v24 = 1024;
      v25 = 627;
      v26 = 2080;
      v27 = "-[CHHapticEngine createHapticPlayerWithOptions:]";
      v28 = 2112;
      v29 = v15;
      _os_log_impl(&dword_1B573F000, v16, OS_LOG_TYPE_ERROR, "%25s:%-5d %s: ERROR: Server failure: %@", buf, 0x26u);
    }

LABEL_28:
    Haptic_RaiseException(CFSTR("CHHapticErrorCodeServerInitFailedException"), CFSTR("Failed to connect to server"), objc_msgSend(v15, "code", v20));
  }
  v17 = v14;

  return v17;
}

- (HapticServerConfig)serverConfig
{
  return (HapticServerConfig *)objc_getProperty(self, a2, 120, 1);
}

- (void)prewarmWithCompletionHandler:(id)a3
{
  id v4;
  NSObject *v5;
  os_signpost_id_t v6;
  NSObject *v7;
  NSObject *v8;
  NSObject *v9;
  id v10;
  AVHapticPlayer *player;
  id v12;
  NSObject *v13;
  NSObject *v14;
  _QWORD v15[4];
  id v16;
  uint8_t *v17;
  id obj;
  uint8_t buf[8];
  uint8_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;
  uint8_t v25[4];
  const char *v26;
  __int16 v27;
  int v28;
  __int16 v29;
  const char *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  CALog::Scope::oslog((id *)kHAPIScope);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = os_signpost_id_make_with_pointer(v5, self);

  CALog::Scope::oslog((id *)kHAPIScope);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1B573F000, v8, OS_SIGNPOST_INTERVAL_BEGIN, v6, "HapticEngine_prewarmWithCompletionHandler", " enableTelemetry=YES ", buf, 2u);
  }

  *(_QWORD *)buf = 0;
  v20 = buf;
  v21 = 0x3032000000;
  v22 = __Block_byref_object_copy__3;
  v23 = __Block_byref_object_dispose__3;
  v24 = 0;
  obj = 0;
  -[CHHapticEngine updateEngineBehaviorWithError:](self, "updateEngineBehaviorWithError:", &obj);
  objc_storeStrong(&v24, obj);
  if (kHAPIScope)
  {
    v9 = *(id *)kHAPIScope;
    if (!v9)
      goto LABEL_11;
  }
  else
  {
    v9 = MEMORY[0x1E0C81028];
    v10 = MEMORY[0x1E0C81028];
  }
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)v25 = 136315650;
    v26 = "CHHapticEngine.mm";
    v27 = 1024;
    v28 = 1154;
    v29 = 2080;
    v30 = "-[CHHapticEngine prewarmWithCompletionHandler:]";
    _os_log_impl(&dword_1B573F000, v9, OS_LOG_TYPE_DEFAULT, "%25s:%-5d %s: Prewarming the underlying Haptic Player", v25, 0x1Cu);
  }

LABEL_11:
  player = self->_player;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __47__CHHapticEngine_prewarmWithCompletionHandler___block_invoke;
  v15[3] = &unk_1E6960860;
  v17 = buf;
  v12 = v4;
  v16 = v12;
  -[AVHapticPlayer prewarmWithCompletionHandler:](player, "prewarmWithCompletionHandler:", v15);
  CALog::Scope::oslog((id *)kHAPIScope);
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
  {
    *(_WORD *)v25 = 0;
    _os_signpost_emit_with_name_impl(&dword_1B573F000, v14, OS_SIGNPOST_INTERVAL_END, v6, "HapticEngine_prewarmWithCompletionHandler", (const char *)&unk_1B57A456E, v25, 2u);
  }

  _Block_object_dispose(buf, 8);
}

- (id)createPrivilegedPlayerWithPlayable:(id)a3 error:(id *)a4
{
  id v6;
  NSObject *v7;
  id v8;
  PatternPlayer *v9;
  int v11;
  const char *v12;
  __int16 v13;
  int v14;
  __int16 v15;
  const char *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (kHAPIScope)
  {
    v7 = *(id *)kHAPIScope;
    if (!v7)
      goto LABEL_8;
  }
  else
  {
    v7 = MEMORY[0x1E0C81028];
    v8 = MEMORY[0x1E0C81028];
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    v11 = 136315650;
    v12 = "CHHapticEngine.mm";
    v13 = 1024;
    v14 = 1568;
    v15 = 2080;
    v16 = "-[CHHapticEngine createPrivilegedPlayerWithPlayable:error:]";
    _os_log_impl(&dword_1B573F000, v7, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: Creating privileged player from Playable", (uint8_t *)&v11, 0x1Cu);
  }

LABEL_8:
  if (self->_player)
  {
    v9 = -[PatternPlayer initWithPlayable:engine:privileged:error:]([PatternPlayer alloc], "initWithPlayable:engine:privileged:error:", v6, self, 1, a4);
  }
  else
  {
    _Haptic_Check((uint64_t)"/Library/Caches/com.apple.xbs/Sources/CoreHaptics/Source/CHHapticEngine.mm", 1569, "-[CHHapticEngine createPrivilegedPlayerWithPlayable:error:]", "_player != nil", -4810, a4);
    v9 = 0;
  }

  return v9;
}

- (CHMetrics)metrics
{
  return self->_metrics;
}

- (BOOL)notifyPlayerStarted:(id)a3 atTime:(double)a4
{
  CHHapticEngine *v4;
  uint64_t v5;
  void *v6;
  _QWORD v8[4];
  id v9;
  _QWORD v10[4];
  id v11;
  id location;

  v4 = self;
  objc_sync_enter(v4);
  objc_initWeak(&location, v4);
  v5 = MEMORY[0x1E0C809B0];
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __69__CHHapticEngine_CHHapticEngineInternal__notifyPlayerStarted_atTime___block_invoke;
  v10[3] = &unk_1E6960430;
  objc_copyWeak(&v11, &location);
  -[CHHapticEngine dispatchOnLocal:](v4, "dispatchOnLocal:", v10);
  -[CHHapticEngine player](v4, "player");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v5;
  v8[1] = 3221225472;
  v8[2] = __69__CHHapticEngine_CHHapticEngineInternal__notifyPlayerStarted_atTime___block_invoke_2;
  v8[3] = &unk_1E695FEB0;
  objc_copyWeak(&v9, &location);
  LOBYTE(v5) = objc_msgSend(v6, "finishWithCompletionHandler:", v8);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
  objc_sync_exit(v4);

  return v5;
}

- (void)dispatchOnLocal:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  void *v7;
  NSObject *dispatchQueue;
  id v9;
  _QWORD block[4];
  id v11;
  uint8_t buf[4];
  const char *v13;
  __int16 v14;
  int v15;
  __int16 v16;
  const char *v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (kHAPIScope)
  {
    if ((*(_BYTE *)(kHAPIScope + 8) & 1) != 0)
    {
      v5 = *(id *)kHAPIScope;
      if (v5)
      {
        v6 = v5;
        if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
        {
          v7 = (void *)MEMORY[0x1B5E4F2B4](v4);
          *(_DWORD *)buf = 136315906;
          v13 = "CHHapticEngine.mm";
          v14 = 1024;
          v15 = 1905;
          v16 = 2080;
          v17 = "-[CHHapticEngine(CHHapticEngineInternal) dispatchOnLocal:]";
          v18 = 2048;
          v19 = v7;
          _os_log_impl(&dword_1B573F000, v6, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: <Dispatching block %p async...>", buf, 0x26u);

        }
      }
    }
  }
  if (in_dispatch_sync == 1)
    -[CHHapticEngine(CHHapticEngineInternal) dispatchOnLocal:].cold.1();
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __58__CHHapticEngine_CHHapticEngineInternal__dispatchOnLocal___block_invoke;
  block[3] = &unk_1E6960150;
  v11 = v4;
  v9 = v4;
  dispatch_async(dispatchQueue, block);

}

- (id)getAvailableChannel:(id *)a3
{
  void *v3;
  void *v4;
  id v5;
  NSObject *v6;
  id v7;
  int v9;
  const char *v10;
  __int16 v11;
  int v12;
  __int16 v13;
  const char *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  -[AVHapticPlayer addChannel:](self->_player, "addChannel:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    if (kHAPIScope)
    {
      v6 = *(id *)kHAPIScope;
      if (!v6)
        goto LABEL_10;
    }
    else
    {
      v6 = MEMORY[0x1E0C81028];
      v7 = MEMORY[0x1E0C81028];
    }
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v9 = 136315650;
      v10 = "CHHapticEngine.mm";
      v11 = 1024;
      v12 = 1975;
      v13 = 2080;
      v14 = "-[CHHapticEngine(CHHapticEngineInternal) getAvailableChannel:]";
      _os_log_impl(&dword_1B573F000, v6, OS_LOG_TYPE_ERROR, "%25s:%-5d %s: ERROR: Unable to add an additional player channel", (uint8_t *)&v9, 0x1Cu);
    }

  }
LABEL_10:

  return v4;
}

- (void)notifyWhenPlayersFinished:(CHHapticEngineFinishedHandler)finishedHandler
{
  CHHapticEngineFinishedHandler v4;
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  CHHapticEngine *v9;
  void *v10;
  id v11;
  _QWORD v12[4];
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  id v17;
  uint8_t buf[4];
  const char *v19;
  __int16 v20;
  int v21;
  __int16 v22;
  const char *v23;
  __int16 v24;
  CHHapticEngine *v25;
  __int16 v26;
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v4 = finishedHandler;
  if (kHAPIScope)
  {
    v5 = *(id *)kHAPIScope;
    if (!v5)
      goto LABEL_8;
  }
  else
  {
    v5 = (id)MEMORY[0x1E0C81028];
    v6 = MEMORY[0x1E0C81028];
  }
  v7 = v5;
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = (void *)MEMORY[0x1B5E4F2B4](v4);
    *(_DWORD *)buf = 136316162;
    v19 = "CHHapticEngine.mm";
    v20 = 1024;
    v21 = 1382;
    v22 = 2080;
    v23 = "-[CHHapticEngine notifyWhenPlayersFinished:]";
    v24 = 2048;
    v25 = self;
    v26 = 2048;
    v27 = v8;
    _os_log_impl(&dword_1B573F000, v7, OS_LOG_TYPE_DEFAULT, "%25s:%-5d %s: Called on engine %p with finishedHandler %p", buf, 0x30u);

  }
LABEL_8:
  if (self->_player)
  {
    v9 = self;
    objc_sync_enter(v9);
    -[CHHapticEngine setClientFinishedHandler:](v9, "setClientFinishedHandler:", v4);
    objc_initWeak((id *)buf, v9);
    -[CHHapticEngine player](v9, "player");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __44__CHHapticEngine_notifyWhenPlayersFinished___block_invoke_2;
    v12[3] = &unk_1E695FEB0;
    objc_copyWeak(&v13, (id *)buf);
    objc_msgSend(v10, "finishWithCompletionHandler:", v12);

    objc_destroyWeak(&v13);
    objc_destroyWeak((id *)buf);
    objc_sync_exit(v9);
  }
  else
  {
    v17 = 0;
    _Haptic_Check((uint64_t)"/Library/Caches/com.apple.xbs/Sources/CoreHaptics/Source/CHHapticEngine.mm", 1383, "-[CHHapticEngine notifyWhenPlayersFinished:]", "_player != nil", -4810, &v17);
    v11 = v17;
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __44__CHHapticEngine_notifyWhenPlayersFinished___block_invoke;
    v14[3] = &unk_1E695FF00;
    v15 = v11;
    v16 = v4;
    v9 = (CHHapticEngine *)v11;
    -[CHHapticEngine dispatchOnLocal:](self, "dispatchOnLocal:", v14);

  }
}

- (void)setClientFinishedHandler:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 96);
}

- (CHHapticEngine)initWithAudioSession:(id)a3 sessionIsShared:(BOOL)a4 options:(id)a5 error:(id *)a6
{
  _BOOL8 v8;
  id v10;
  id v11;
  NSObject *v12;
  os_signpost_id_t v13;
  NSObject *v14;
  NSObject *v15;
  unint64_t v16;
  CHHapticEngine *v17;
  NSObject *v18;
  id v19;
  const char *v20;
  NSObject *v21;
  NSObject *v22;
  id v23;
  AVAudioSession *v24;
  uint64_t v25;
  int v26;
  NSObject *p_super;
  uint64_t v28;
  NSObject *v29;
  void *metrics;
  uint64_t v31;
  NSString *usageCategory;
  NSString **p_usageCategory;
  __CFString *v34;
  AVFASoftLink *v35;
  NSObject *v36;
  id v37;
  NSObject *v38;
  NSObject *v39;
  id v40;
  CHMetrics *v41;
  NSObject *v42;
  id v44;
  id v45;
  uint64_t v46;
  id v47;
  os_signpost_id_t spid;
  objc_super v49;
  uint8_t buf[4];
  const char *v51;
  __int16 v52;
  int v53;
  __int16 v54;
  const char *v55;
  __int16 v56;
  void *v57;
  __int16 v58;
  const char *v59;
  __int16 v60;
  id v61;
  uint64_t v62;

  v8 = a4;
  v62 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a5;
  if (setupHapticLogScopes(void)::once != -1)
    dispatch_once(&setupHapticLogScopes(void)::once, &__block_literal_global_2);
  CALog::Scope::oslog((id *)kHAPIScope);
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = os_signpost_id_make_with_pointer(v12, self);

  CALog::Scope::oslog((id *)kHAPIScope);
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = v14;
  spid = v13;
  v16 = v13 - 1;
  if (v16 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v14))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1B573F000, v15, OS_SIGNPOST_INTERVAL_BEGIN, spid, "HapticEngine_initWithAudioSession", " enableTelemetry=YES ", buf, 2u);
  }

  v49.receiver = self;
  v49.super_class = (Class)CHHapticEngine;
  v17 = -[CHHapticEngine init](&v49, sel_init);
  if (!v17)
    goto LABEL_68;
  if (kHAPIScope)
  {
    v18 = *(id *)kHAPIScope;
    if (!v18)
      goto LABEL_16;
  }
  else
  {
    v18 = MEMORY[0x1E0C81028];
    v19 = MEMORY[0x1E0C81028];
  }
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    v20 = "unshared";
    *(_DWORD *)buf = 136316418;
    v51 = "CHHapticEngine.mm";
    v52 = 1024;
    v53 = 1453;
    v55 = "-[CHHapticEngine initWithAudioSession:sessionIsShared:options:error:]";
    v54 = 2080;
    if (v8)
      v20 = "shared";
    v56 = 2048;
    v57 = v17;
    v58 = 2080;
    v59 = v20;
    v60 = 2048;
    v61 = v10;
    _os_log_impl(&dword_1B573F000, v18, OS_LOG_TYPE_DEFAULT, "%25s:%-5d %s: Creating engine %p with %s audio session %p", buf, 0x3Au);
  }

LABEL_16:
  if (v10 && v8)
  {
    if (kHAPIScope)
    {
      v21 = *(id *)kHAPIScope;
      if (!v21)
        goto LABEL_35;
    }
    else
    {
      v21 = MEMORY[0x1E0C81028];
      v23 = MEMORY[0x1E0C81028];
    }
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315650;
      v51 = "CHHapticEngine.mm";
      v52 = 1024;
      v53 = 1457;
      v54 = 2080;
      v55 = "-[CHHapticEngine initWithAudioSession:sessionIsShared:options:error:]";
      _os_log_impl(&dword_1B573F000, v21, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: Using passed-in shared audio session", buf, 0x1Cu);
    }
LABEL_34:

LABEL_35:
    v24 = (AVAudioSession *)v10;
    v25 = 0;
    v26 = 0;
    p_super = &v17->_avAudioSession->super;
    v17->_avAudioSession = v24;
LABEL_36:

    goto LABEL_37;
  }
  if (v10 || !v8)
  {
    if (v10 && !v8)
    {
      if (kHAPIScope)
      {
        v21 = *(id *)kHAPIScope;
        if (!v21)
          goto LABEL_35;
      }
      else
      {
        v21 = MEMORY[0x1E0C81028];
        v44 = MEMORY[0x1E0C81028];
      }
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 136315650;
        v51 = "CHHapticEngine.mm";
        v52 = 1024;
        v53 = 1468;
        v54 = 2080;
        v55 = "-[CHHapticEngine initWithAudioSession:sessionIsShared:options:error:]";
        _os_log_impl(&dword_1B573F000, v21, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: Using passed-in auxiliary audio session with no UsageCategory", buf, 0x1Cu);
      }
      goto LABEL_34;
    }
    -[CHHapticEngine getUsageCategory:](v17, "getUsageCategory:", v11);
    v31 = objc_claimAutoreleasedReturnValue();
    p_usageCategory = &v17->_usageCategory;
    usageCategory = v17->_usageCategory;
    v17->_usageCategory = (NSString *)v31;

    if (!v31)
      objc_storeStrong((id *)&v17->_usageCategory, CFSTR("UIFeedback"));
    v34 = (__CFString *)*p_usageCategory;
    if (*p_usageCategory == (NSString *)CFSTR("SystemSoundHapticsParser"))
    {
      if (kHAPIScope)
      {
        p_super = *(id *)kHAPIScope;
        if (!p_super)
        {
          v25 = 1;
          v26 = 1;
LABEL_37:
          -[CHHapticEngine storeOptions:](v17, "storeOptions:", v11);
          if (v26
            && !-[CHHapticEngine setupEngineWithCategory:session:needsAudioPowerBudget:error:](v17, "setupEngineWithCategory:session:needsAudioPowerBudget:error:", v17->_usageCategory, v17->_avAudioSession, -[CHHapticEngine needsAudioPowerBudget](v17, "needsAudioPowerBudget"), a6)|| (-[CHHapticEngine connectAudioSession:](v17, "connectAudioSession:", v17->_avAudioSession), v28 = -[CHHapticEngine getSessionIDFromAVAudioSession:](v17, "getSessionIDFromAVAudioSession:", v17->_avAudioSession), !-[CHHapticEngine doInit:sessionIsShared:options:bypassAudioSession:error:](v17, "doInit:sessionIsShared:options:bypassAudioSession:error:", v28, v8, v11, v25, a6)))
          {
            metrics = v17;
            v17 = 0;
LABEL_67:

LABEL_68:
            CALog::Scope::oslog((id *)kHAPIScope);
            v42 = objc_claimAutoreleasedReturnValue();
            v39 = v42;
            if (v16 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v42))
            {
              *(_WORD *)buf = 0;
              _os_signpost_emit_with_name_impl(&dword_1B573F000, v39, OS_SIGNPOST_INTERVAL_END, spid, "HapticEngine_initWithAudioSession", (const char *)&unk_1B57A456E, buf, 2u);
            }
            goto LABEL_71;
          }
          if (v8)
          {
LABEL_66:
            v41 = -[CHMetrics initWithEngine:audioSessionID:sessionIsShared:isSPI:]([CHMetrics alloc], "initWithEngine:audioSessionID:sessionIsShared:isSPI:", v17, v28, v17->_sessionIsShared, 1);
            metrics = v17->_metrics;
            v17->_metrics = v41;
            goto LABEL_67;
          }
          if (kHAPIScope)
          {
            v29 = *(id *)kHAPIScope;
            if (!v29)
            {
LABEL_65:
              -[CHHapticEngine setActivateAudioSessionOnStart:](v17, "setActivateAudioSessionOnStart:", 0);
              -[CHHapticEngine updateEngineBehavior](v17, "updateEngineBehavior");
              goto LABEL_66;
            }
          }
          else
          {
            v29 = MEMORY[0x1E0C81028];
            v40 = MEMORY[0x1E0C81028];
          }
          if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 136315650;
            v51 = "CHHapticEngine.mm";
            v52 = 1024;
            v53 = 1499;
            v54 = 2080;
            v55 = "-[CHHapticEngine initWithAudioSession:sessionIsShared:options:error:]";
            _os_log_impl(&dword_1B573F000, v29, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: Setting behavior to not activate audio session (if haptics-only)", buf, 0x1Cu);
          }

          goto LABEL_65;
        }
      }
      else
      {
        p_super = MEMORY[0x1E0C81028];
        v47 = MEMORY[0x1E0C81028];
      }
      if (os_log_type_enabled(p_super, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 136315906;
        v51 = "CHHapticEngine.mm";
        v52 = 1024;
        v53 = 1477;
        v54 = 2080;
        v55 = "-[CHHapticEngine initWithAudioSession:sessionIsShared:options:error:]";
        v56 = 2112;
        v57 = v34;
        _os_log_impl(&dword_1B573F000, p_super, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: Omitting audio session creation for usage category: %@", buf, 0x26u);
      }
      v25 = 1;
      goto LABEL_88;
    }
    if (kHAPIScope)
    {
      v35 = (AVFASoftLink *)*(id *)kHAPIScope;
      v36 = v35;
      if (!v35)
      {
LABEL_83:
        objc_msgSend(AVFASoftLink::getAVAudioSession(v35), "auxiliarySession");
        v46 = objc_claimAutoreleasedReturnValue();
        v25 = 0;
        p_super = &v17->_avAudioSession->super;
        v17->_avAudioSession = (AVAudioSession *)v46;
LABEL_88:
        v26 = 1;
        goto LABEL_36;
      }
    }
    else
    {
      v36 = MEMORY[0x1E0C81028];
      v45 = MEMORY[0x1E0C81028];
    }
    if (os_log_type_enabled(v36, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315650;
      v51 = "CHHapticEngine.mm";
      v52 = 1024;
      v53 = 1481;
      v54 = 2080;
      v55 = "-[CHHapticEngine initWithAudioSession:sessionIsShared:options:error:]";
      _os_log_impl(&dword_1B573F000, v36, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: Creating internal unshared audio session", buf, 0x1Cu);
    }

    goto LABEL_83;
  }
  if (!kHAPIScope)
  {
    v22 = MEMORY[0x1E0C81028];
    v37 = MEMORY[0x1E0C81028];
    goto LABEL_52;
  }
  v22 = *(id *)kHAPIScope;
  if (v22)
  {
LABEL_52:
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      v51 = "CHHapticEngine.mm";
      v52 = 1024;
      v53 = 1461;
      v54 = 2080;
      v55 = "-[CHHapticEngine initWithAudioSession:sessionIsShared:options:error:]";
      _os_log_impl(&dword_1B573F000, v22, OS_LOG_TYPE_ERROR, "%25s:%-5d %s: Shared audio session cannot be nil", buf, 0x1Cu);
    }

  }
  if (a6)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.CoreHaptics"), -4815, 0);
    *a6 = (id)objc_claimAutoreleasedReturnValue();
  }

  CALog::Scope::oslog((id *)kHAPIScope);
  v38 = objc_claimAutoreleasedReturnValue();
  v39 = v38;
  if (v16 < 0xFFFFFFFFFFFFFFFELL && os_signpost_enabled(v38))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1B573F000, v39, OS_SIGNPOST_INTERVAL_END, spid, "HapticEngine_initWithAudioSession", (const char *)&unk_1B57A456E, buf, 2u);
  }
  v17 = 0;
LABEL_71:

  return v17;
}

- (BOOL)needsAudioPowerBudget
{
  return -[NSString isEqualToString:](self->_audioPowerUsage, "isEqualToString:", CFSTR("HighPower"));
}

- (void)connectAudioSession:(id)a3
{
  AVFASoftLink *v4;
  void *v5;
  AVFASoftLink *v6;
  void *v7;
  id v8;

  v8 = a3;
  if (v8)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v4 = (AVFASoftLink *)objc_claimAutoreleasedReturnValue();
    AVFASoftLink::getAVAudioSessionMediaServicesWereLostNotification(v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVFASoftLink addObserver:selector:name:object:](v4, "addObserver:selector:name:object:", self, sel_handleMediaServerDeath_, v5, v8);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v6 = (AVFASoftLink *)objc_claimAutoreleasedReturnValue();
    AVFASoftLink::getAVAudioSessionMediaServicesWereResetNotification(v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVFASoftLink addObserver:selector:name:object:](v6, "addObserver:selector:name:object:", self, sel_handleMediaServerRecovery_, v7, v8);

  }
}

- (unsigned)getSessionIDFromAVAudioSession:(id)a3
{
  AVFASoftLink *v3;
  AVFASoftLink *v4;
  NSObject *v5;
  id v6;
  int v8;
  const char *v9;
  __int16 v10;
  int v11;
  __int16 v12;
  const char *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = (AVFASoftLink *)a3;
  v4 = v3;
  if (v3)
  {
    AVFASoftLink::getAVAudioSession(v3);
    LODWORD(v5) = -[AVFASoftLink opaqueSessionID](v4, "opaqueSessionID");
  }
  else
  {
    if (kHAPIScope)
    {
      v5 = *(id *)kHAPIScope;
      if (!v5)
        goto LABEL_10;
    }
    else
    {
      v5 = MEMORY[0x1E0C81028];
      v6 = MEMORY[0x1E0C81028];
    }
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      v8 = 136315650;
      v9 = "CHHapticEngine.mm";
      v10 = 1024;
      v11 = 595;
      v12 = 2080;
      v13 = "-[CHHapticEngine getSessionIDFromAVAudioSession:]";
      _os_log_impl(&dword_1B573F000, v5, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: No audio session used. Returning 0", (uint8_t *)&v8, 0x1Cu);
    }

    LODWORD(v5) = 0;
  }
LABEL_10:

  return v5;
}

- (id)getUsageCategory:(id)a3
{
  id v3;
  void *v4;
  void *v5;

  v3 = a3;
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "valueForKey:", CFSTR("UsageCategory"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (void)setActivateAudioSessionOnStart:(BOOL)a3
{
  -[CHHapticEngine toggleBehavior:set:](self, "toggleBehavior:set:", 4, !a3);
}

- (void)storeOptions:(id)a3
{
  void *v4;
  NSString *v5;
  NSString *priority;
  void *v7;
  NSString *v8;
  NSString *hapticPowerUsage;
  void *v10;
  NSString *v11;
  NSString *audioPowerUsage;
  void *v13;
  NSString *v14;
  NSString *usageCategory;
  id v16;

  v16 = a3;
  objc_msgSend(v16, "valueForKey:", CFSTR("Priority"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(v16, "valueForKey:", CFSTR("Priority"));
    v5 = (NSString *)objc_claimAutoreleasedReturnValue();
    priority = self->_priority;
    self->_priority = v5;
  }
  else
  {
    priority = self->_priority;
    self->_priority = (NSString *)CFSTR("LowPriority");
  }

  objc_msgSend(v16, "valueForKey:", CFSTR("HapticPowerUsage"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(v16, "valueForKey:", CFSTR("HapticPowerUsage"));
    v8 = (NSString *)objc_claimAutoreleasedReturnValue();
    hapticPowerUsage = self->_hapticPowerUsage;
    self->_hapticPowerUsage = v8;
  }
  else
  {
    hapticPowerUsage = self->_hapticPowerUsage;
    self->_hapticPowerUsage = (NSString *)CFSTR("LowPower");
  }

  objc_msgSend(v16, "valueForKey:", CFSTR("AudioPowerUsage"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    objc_msgSend(v16, "valueForKey:", CFSTR("AudioPowerUsage"));
    v11 = (NSString *)objc_claimAutoreleasedReturnValue();
    audioPowerUsage = self->_audioPowerUsage;
    self->_audioPowerUsage = v11;
  }
  else
  {
    audioPowerUsage = self->_audioPowerUsage;
    self->_audioPowerUsage = (NSString *)CFSTR("LowPower");
  }

  if (!self->_usageCategory)
  {
    objc_msgSend(v16, "valueForKey:", CFSTR("UsageCategory"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      objc_msgSend(v16, "valueForKey:", CFSTR("UsageCategory"));
      v14 = (NSString *)objc_claimAutoreleasedReturnValue();
      usageCategory = self->_usageCategory;
      self->_usageCategory = v14;

    }
  }

}

- (void)setAutoShutdownEnabled:(BOOL)autoShutdownEnabled
{
  _BOOL4 v3;
  CHHapticEngine *v4;
  NSObject *v5;
  NSObject *v6;
  id v7;
  id v8;
  void *v9;
  _QWORD v10[5];
  _QWORD v11[4];
  id v12;
  uint8_t buf[4];
  const char *v14;
  __int16 v15;
  int v16;
  __int16 v17;
  const char *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  if (self->_autoShutdownEnabled != autoShutdownEnabled)
  {
    v3 = autoShutdownEnabled;
    self->_autoShutdownEnabled = autoShutdownEnabled;
    v4 = self;
    objc_sync_enter(v4);
    if (v3)
    {
      if (-[CHHapticEngine running](v4, "running"))
      {
        if (kHAPIScope)
        {
          v5 = *(id *)kHAPIScope;
          if (!v5)
          {
LABEL_19:
            objc_initWeak((id *)buf, v4);
            -[CHHapticEngine player](v4, "player");
            v9 = (void *)objc_claimAutoreleasedReturnValue();
            v11[0] = MEMORY[0x1E0C809B0];
            v11[1] = 3221225472;
            v11[2] = __41__CHHapticEngine_setAutoShutdownEnabled___block_invoke;
            v11[3] = &unk_1E695FEB0;
            objc_copyWeak(&v12, (id *)buf);
            objc_msgSend(v9, "finishWithCompletionHandler:", v11);

            objc_destroyWeak(&v12);
            objc_destroyWeak((id *)buf);
            goto LABEL_20;
          }
        }
        else
        {
          v5 = MEMORY[0x1E0C81028];
          v8 = MEMORY[0x1E0C81028];
        }
        if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 136315650;
          v14 = "CHHapticEngine.mm";
          v15 = 1024;
          v16 = 416;
          v17 = 2080;
          v18 = "-[CHHapticEngine setAutoShutdownEnabled:]";
          _os_log_impl(&dword_1B573F000, v5, OS_LOG_TYPE_INFO, "%25s:%-5d %s: auto-shutdown being enabled while running - wait for any existing players", buf, 0x1Cu);
        }

        goto LABEL_19;
      }
LABEL_20:
      objc_sync_exit(v4);

      return;
    }
    if (kHAPIScope)
    {
      v6 = *(id *)kHAPIScope;
      if (!v6)
      {
LABEL_14:
        v10[0] = MEMORY[0x1E0C809B0];
        v10[1] = 3221225472;
        v10[2] = __41__CHHapticEngine_setAutoShutdownEnabled___block_invoke_111;
        v10[3] = &unk_1E6960750;
        v10[4] = v4;
        -[CHHapticEngine dispatchOnLocal:](v4, "dispatchOnLocal:", v10);
        goto LABEL_20;
      }
    }
    else
    {
      v6 = MEMORY[0x1E0C81028];
      v7 = MEMORY[0x1E0C81028];
    }
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315650;
      v14 = "CHHapticEngine.mm";
      v15 = 1024;
      v16 = 428;
      v17 = 2080;
      v18 = "-[CHHapticEngine setAutoShutdownEnabled:]";
      _os_log_impl(&dword_1B573F000, v6, OS_LOG_TYPE_INFO, "%25s:%-5d %s: auto-shutdown being disabled", buf, 0x1Cu);
    }

    goto LABEL_14;
  }
}

void __58__CHHapticEngine_CHHapticEngineInternal__dispatchOnLocal___block_invoke(uint64_t a1)
{
  NSObject *v1;
  NSObject *v2;
  int v3;
  const char *v4;
  __int16 v5;
  int v6;
  __int16 v7;
  const char *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  if (kHAPIScope)
  {
    if ((*(_BYTE *)(kHAPIScope + 8) & 1) != 0)
    {
      v1 = *(id *)kHAPIScope;
      if (v1)
      {
        v2 = v1;
        if (os_log_type_enabled(v1, OS_LOG_TYPE_DEBUG))
        {
          v3 = 136315650;
          v4 = "CHHapticEngine.mm";
          v5 = 1024;
          v6 = 1909;
          v7 = 2080;
          v8 = "-[CHHapticEngine(CHHapticEngineInternal) dispatchOnLocal:]_block_invoke";
          _os_log_impl(&dword_1B573F000, v2, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: <Block async dispatch complete>", (uint8_t *)&v3, 0x1Cu);
        }

      }
    }
  }
}

- (BOOL)checkEngineStateOnStart:(id *)a3
{
  NSObject *v6;
  id v7;
  int v8;
  const char *v9;
  __int16 v10;
  int v11;
  __int16 v12;
  const char *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if (-[CHHapticEngine isAutoShutdownEnabled](self, "isAutoShutdownEnabled")
    && !-[CHHapticEngine running](self, "running"))
  {
    if (kHAPIScope)
    {
      v6 = *(id *)kHAPIScope;
      if (!v6)
        return -[CHHapticEngine doStartEngineAndWait:](self, "doStartEngineAndWait:", a3);
    }
    else
    {
      v6 = MEMORY[0x1E0C81028];
      v7 = MEMORY[0x1E0C81028];
    }
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      v8 = 136315650;
      v9 = "CHHapticEngine.mm";
      v10 = 1024;
      v11 = 1927;
      v12 = 2080;
      v13 = "-[CHHapticEngine(CHHapticEngineInternal) checkEngineStateOnStart:]";
      _os_log_impl(&dword_1B573F000, v6, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: AutoShutdown on and engine stopped - auto start", (uint8_t *)&v8, 0x1Cu);
    }

    return -[CHHapticEngine doStartEngineAndWait:](self, "doStartEngineAndWait:", a3);
  }
  if (-[CHHapticEngine running](self, "running"))
    return 1;
  _Haptic_Check((uint64_t)"/Library/Caches/com.apple.xbs/Sources/CoreHaptics/Source/CHHapticEngine.mm", 1931, "-[CHHapticEngine(CHHapticEngineInternal) checkEngineStateOnStart:]", "self.running", -4805, a3);
  return 0;
}

- (BOOL)running
{
  return self->_running;
}

void __69__CHHapticEngine_CHHapticEngineInternal__notifyPlayerStarted_atTime___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (objc_msgSend(WeakRetained, "isAutoShutdownEnabled"))
    objc_msgSend(WeakRetained, "cancelIdleTimer");

}

- (BOOL)isAutoShutdownEnabled
{
  return self->_autoShutdownEnabled;
}

void __31__CHHapticEngine_handleFinish___block_invoke(uint64_t a1)
{
  id WeakRetained;
  NSObject *v3;
  NSObject *v4;
  id v5;
  uint64_t v6;
  NSObject *v7;
  id v8;
  id v9;
  NSObject *v10;
  id v11;
  void *v12;
  _QWORD v13[4];
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;
  uint8_t buf[4];
  const char *v19;
  __int16 v20;
  int v21;
  __int16 v22;
  const char *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (*(_QWORD *)(a1 + 40))
  {
    if (kHAPIScope)
    {
      v3 = *(id *)kHAPIScope;
      if (!v3)
        goto LABEL_12;
    }
    else
    {
      v3 = MEMORY[0x1E0C81028];
      v5 = MEMORY[0x1E0C81028];
    }
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315650;
      v19 = "CHHapticEngine.mm";
      v20 = 1024;
      v21 = 794;
      v22 = 2080;
      v23 = "-[CHHapticEngine handleFinish:]_block_invoke";
      _os_log_impl(&dword_1B573F000, v3, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: Calling client's finishedHandler on internal queue", buf, 0x1Cu);
    }

LABEL_12:
    v6 = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    if (v6 == 1)
    {
      if (kHAPIScope)
      {
        v7 = *(id *)kHAPIScope;
        if (!v7)
          goto LABEL_24;
      }
      else
      {
        v7 = MEMORY[0x1E0C81028];
        v9 = MEMORY[0x1E0C81028];
      }
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 136315650;
        v19 = "CHHapticEngine.mm";
        v20 = 1024;
        v21 = 796;
        v22 = 2080;
        v23 = "-[CHHapticEngine handleFinish:]_block_invoke";
        _os_log_impl(&dword_1B573F000, v7, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: Client requested engine stop-on-finish", buf, 0x1Cu);
      }

    }
LABEL_24:
    objc_msgSend(WeakRetained, "setClientFinishedHandler:", 0);
    if (v6 == 1 && objc_msgSend(*(id *)(a1 + 32), "code") != -4805)
    {
      if (WeakRetained)
      {
        objc_initWeak((id *)buf, WeakRetained);
        v15[0] = MEMORY[0x1E0C809B0];
        v15[1] = 3221225472;
        v15[2] = __31__CHHapticEngine_handleFinish___block_invoke_133;
        v15[3] = &unk_1E695FF28;
        objc_copyWeak(&v17, (id *)buf);
        v16 = *(id *)(a1 + 48);
        objc_msgSend(WeakRetained, "doStopWithCompletionHandler:", v15);

        objc_destroyWeak(&v17);
        objc_destroyWeak((id *)buf);
      }
      else
      {
        v13[0] = MEMORY[0x1E0C809B0];
        v13[1] = 3221225472;
        v13[2] = __31__CHHapticEngine_handleFinish___block_invoke_136;
        v13[3] = &unk_1E6960150;
        v14 = *(id *)(a1 + 48);
        +[CHHapticEngine dispatchOnGlobal:](CHHapticEngine, "dispatchOnGlobal:", v13);

      }
      goto LABEL_35;
    }
    goto LABEL_26;
  }
  if (kHAPIScope)
  {
    v4 = *(id *)kHAPIScope;
    if (!v4)
      goto LABEL_26;
  }
  else
  {
    v4 = MEMORY[0x1E0C81028];
    v8 = MEMORY[0x1E0C81028];
  }
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315650;
    v19 = "CHHapticEngine.mm";
    v20 = 1024;
    v21 = 802;
    v22 = 2080;
    v23 = "-[CHHapticEngine handleFinish:]_block_invoke";
    _os_log_impl(&dword_1B573F000, v4, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: Client finishedHandler is nil", buf, 0x1Cu);
  }

LABEL_26:
  if (!kHAPIScope)
  {
    v10 = MEMORY[0x1E0C81028];
    v11 = MEMORY[0x1E0C81028];
    goto LABEL_30;
  }
  v10 = *(id *)kHAPIScope;
  if (v10)
  {
LABEL_30:
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315650;
      v19 = "CHHapticEngine.mm";
      v20 = 1024;
      v21 = 839;
      v22 = 2080;
      v23 = "-[CHHapticEngine handleFinish:]_block_invoke";
      _os_log_impl(&dword_1B573F000, v10, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: Requested not to stop-on-finish", buf, 0x1Cu);
    }

  }
  if (objc_msgSend(WeakRetained, "isAutoShutdownEnabled"))
    objc_msgSend(WeakRetained, "beginIdleTimer");
LABEL_35:
  objc_msgSend(WeakRetained, "metrics");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "currentTime");
  objc_msgSend(v12, "handleFinishedForPlayersAtTime:");

}

- (void)doStopWithCompletionHandler:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  AVHapticPlayer *player;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;
  uint8_t buf[4];
  const char *v13;
  __int16 v14;
  int v15;
  __int16 v16;
  const char *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[CHHapticEngine setRunning:](self, "setRunning:", 0);
  if (kHAPIScope)
  {
    v5 = *(id *)kHAPIScope;
    if (!v5)
      goto LABEL_8;
  }
  else
  {
    v5 = MEMORY[0x1E0C81028];
    v6 = MEMORY[0x1E0C81028];
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    v13 = "CHHapticEngine.mm";
    v14 = 1024;
    v15 = 1324;
    v16 = 2080;
    v17 = "-[CHHapticEngine doStopWithCompletionHandler:]";
    _os_log_impl(&dword_1B573F000, v5, OS_LOG_TYPE_DEFAULT, "%25s:%-5d %s: Stopping underlying Haptic Player", buf, 0x1Cu);
  }

LABEL_8:
  objc_initWeak((id *)buf, self);
  player = self->_player;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __46__CHHapticEngine_doStopWithCompletionHandler___block_invoke;
  v9[3] = &unk_1E695FF28;
  objc_copyWeak(&v11, (id *)buf);
  v8 = v4;
  v10 = v8;
  -[AVHapticPlayer stopRunningWithCompletionHandler:](player, "stopRunningWithCompletionHandler:", v9);

  objc_destroyWeak(&v11);
  objc_destroyWeak((id *)buf);

}

- (void)doStartWithCompletionHandler:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  uint64_t v7;
  AVHapticPlayer *player;
  id v9;
  _QWORD v10[4];
  id v11;
  _BYTE *v12;
  id v13;
  _QWORD v14[5];
  id location;
  id obj;
  _BYTE buf[32];
  void (*v18)(uint64_t);
  id v19[3];

  v19[2] = *(id *)MEMORY[0x1E0C80C00];
  v4 = a3;
  if (kHAPIScope)
  {
    v5 = *(id *)kHAPIScope;
    if (!v5)
      goto LABEL_8;
  }
  else
  {
    v5 = MEMORY[0x1E0C81028];
    v6 = MEMORY[0x1E0C81028];
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    *(_QWORD *)&buf[4] = "CHHapticEngine.mm";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = 1181;
    *(_WORD *)&buf[18] = 2080;
    *(_QWORD *)&buf[20] = "-[CHHapticEngine doStartWithCompletionHandler:]";
    _os_log_impl(&dword_1B573F000, v5, OS_LOG_TYPE_DEFAULT, "%25s:%-5d %s: Starting underlying Haptic Player", buf, 0x1Cu);
  }

LABEL_8:
  -[CHHapticEngine setRunning:](self, "setRunning:", 1);
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x3032000000;
  *(_QWORD *)&buf[24] = __Block_byref_object_copy__3;
  v18 = __Block_byref_object_dispose__3;
  v19[0] = 0;
  obj = 0;
  -[CHHapticEngine updateEngineBehaviorWithError:](self, "updateEngineBehaviorWithError:", &obj);
  objc_storeStrong(v19, obj);
  objc_initWeak(&location, self);
  v7 = MEMORY[0x1E0C809B0];
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __47__CHHapticEngine_doStartWithCompletionHandler___block_invoke;
  v14[3] = &unk_1E6960750;
  v14[4] = self;
  -[CHHapticEngine dispatchOnLocal:](self, "dispatchOnLocal:", v14);
  -[CHHapticEngine reconfigureAudioSession](self, "reconfigureAudioSession");
  player = self->_player;
  v10[0] = v7;
  v10[1] = 3221225472;
  v10[2] = __47__CHHapticEngine_doStartWithCompletionHandler___block_invoke_2;
  v10[3] = &unk_1E69608B0;
  objc_copyWeak(&v13, &location);
  v12 = buf;
  v9 = v4;
  v11 = v9;
  -[AVHapticPlayer startRunningWithCompletionHandler:](player, "startRunningWithCompletionHandler:", v10);

  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);
  _Block_object_dispose(buf, 8);

}

- (void)setRunning:(BOOL)a3
{
  self->_running = a3;
}

- (void)updateEngineBehaviorWithError:(id *)a3
{
  id v5;
  id v6;
  NSObject *v7;
  int v8;
  const char *v9;
  __int16 v10;
  int v11;
  __int16 v12;
  const char *v13;
  __int16 v14;
  int v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if (kHAPIScope)
  {
    v5 = *(id *)kHAPIScope;
    if (!v5)
      goto LABEL_8;
  }
  else
  {
    v5 = (id)MEMORY[0x1E0C81028];
    v6 = MEMORY[0x1E0C81028];
  }
  v7 = v5;
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 136315906;
    v9 = "CHHapticEngine.mm";
    v10 = 1024;
    v11 = 857;
    v12 = 2080;
    v13 = "-[CHHapticEngine updateEngineBehaviorWithError:]";
    v14 = 1024;
    v15 = -[CHHapticEngine currentPlayerBehavior](self, "currentPlayerBehavior");
    _os_log_impl(&dword_1B573F000, v7, OS_LOG_TYPE_DEFAULT, "%25s:%-5d %s: Setting player's behavior to 0x%x", (uint8_t *)&v8, 0x22u);
  }

LABEL_8:
  -[AVHapticPlayer setBehavior:error:](self->_player, "setBehavior:error:", -[CHHapticEngine currentPlayerBehavior](self, "currentPlayerBehavior"), a3);
}

- (BOOL)finishInit:(id *)a3
{
  uint64_t v5;
  void *v6;
  NSObject *v7;
  NSObject *v8;
  id v9;
  void *v10;
  NSObject *v11;
  NSObject *v12;
  id v13;
  dispatch_time_t v14;
  NSObject *v15;
  id v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  _BOOL8 v20;
  NSObject *v21;
  id v22;
  const char *v23;
  id v24;
  void *v25;
  void *v26;
  NSObject *v27;
  id v28;
  _QWORD v30[4];
  id v31;
  _QWORD v32[4];
  NSObject *v33;
  uint64_t *v34;
  _QWORD v35[4];
  id v36;
  uint64_t v37;
  uint64_t *v38;
  uint64_t v39;
  uint64_t (*v40)(uint64_t, uint64_t);
  void (*v41)(uint64_t);
  id v42;
  id location;
  uint8_t buf[4];
  const char *v45;
  __int16 v46;
  int v47;
  __int16 v48;
  const char *v49;
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  objc_initWeak(&location, self);
  v37 = 0;
  v38 = &v37;
  v39 = 0x3032000000;
  v40 = __Block_byref_object_copy__3;
  v41 = __Block_byref_object_dispose__3;
  v42 = 0;
  v5 = MEMORY[0x1E0C809B0];
  v35[0] = MEMORY[0x1E0C809B0];
  v35[2] = __29__CHHapticEngine_finishInit___block_invoke;
  v35[3] = &unk_1E695FEB0;
  v35[1] = 3221225472;
  objc_copyWeak(&v36, &location);
  -[CHHapticEngine player](self, "player");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setConnectionErrorHandler:", v35);

  v7 = dispatch_group_create();
  dispatch_group_enter(v7);
  if (kHAPIScope)
  {
    v8 = *(id *)kHAPIScope;
    if (!v8)
      goto LABEL_8;
  }
  else
  {
    v8 = MEMORY[0x1E0C81028];
    v9 = MEMORY[0x1E0C81028];
  }
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315650;
    v45 = "CHHapticEngine.mm";
    v46 = 1024;
    v47 = 654;
    v48 = 2080;
    v49 = "-[CHHapticEngine finishInit:]";
    _os_log_impl(&dword_1B573F000, v8, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: Allocating resources...", buf, 0x1Cu);
  }

LABEL_8:
  -[CHHapticEngine player](self, "player");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v32[0] = v5;
  v32[1] = 3221225472;
  v32[2] = __29__CHHapticEngine_finishInit___block_invoke_127;
  v32[3] = &unk_1E69607A0;
  v34 = &v37;
  v11 = v7;
  v33 = v11;
  objc_msgSend(v10, "allocateRenderResourcesWithCompletionHandler:", v32);

  if (kHAPIScope)
  {
    v12 = *(id *)kHAPIScope;
    if (!v12)
      goto LABEL_15;
  }
  else
  {
    v12 = MEMORY[0x1E0C81028];
    v13 = MEMORY[0x1E0C81028];
  }
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315650;
    v45 = "CHHapticEngine.mm";
    v46 = 1024;
    v47 = 663;
    v48 = 2080;
    v49 = "-[CHHapticEngine finishInit:]";
    _os_log_impl(&dword_1B573F000, v12, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: Waiting for server...", buf, 0x1Cu);
  }

LABEL_15:
  v14 = dispatch_time(0, 4000000000);
  if (!dispatch_group_wait(v11, v14))
    goto LABEL_24;
  if (!kHAPIScope)
  {
    v15 = MEMORY[0x1E0C81028];
    v16 = MEMORY[0x1E0C81028];
    goto LABEL_20;
  }
  v15 = *(id *)kHAPIScope;
  if (v15)
  {
LABEL_20:
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      v45 = "CHHapticEngine.mm";
      v46 = 1024;
      v47 = 666;
      v48 = 2080;
      v49 = "-[CHHapticEngine finishInit:]";
      _os_log_impl(&dword_1B573F000, v15, OS_LOG_TYPE_ERROR, "%25s:%-5d %s: ERROR: Server timeout", buf, 0x1Cu);
    }

  }
  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.CoreHaptics"), -4810, 0);
  v17 = objc_claimAutoreleasedReturnValue();
  v18 = (void *)v38[5];
  v38[5] = v17;

LABEL_24:
  if (a3)
    *a3 = objc_retainAutorelease((id)v38[5]);
  v19 = v38[5];
  if (!v19)
  {
    v20 = -[CHHapticEngine sessionIsShared](self, "sessionIsShared");
    if (v20)
    {
      if (kHAPIScope)
      {
        v21 = *(id *)kHAPIScope;
        if (!v21)
          goto LABEL_42;
      }
      else
      {
        v21 = MEMORY[0x1E0C81028];
        v22 = MEMORY[0x1E0C81028];
      }
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 136315650;
        v45 = "CHHapticEngine.mm";
        v46 = 1024;
        v47 = 676;
        v48 = 2080;
        v49 = "-[CHHapticEngine finishInit:]";
        v23 = "%25s:%-5d %s: Default behavior is to follow audio route";
LABEL_40:
        _os_log_impl(&dword_1B573F000, v21, OS_LOG_TYPE_DEBUG, v23, buf, 0x1Cu);
      }
    }
    else
    {
      if (kHAPIScope)
      {
        v21 = *(id *)kHAPIScope;
        if (!v21)
        {
LABEL_42:
          -[CHHapticEngine setFollowAudioRoute:](self, "setFollowAudioRoute:", v20);
          -[CHHapticEngine updateEngineBehavior](self, "updateEngineBehavior");
          objc_storeWeak(&location, self);
          v30[0] = v5;
          v30[1] = 3221225472;
          v30[2] = __29__CHHapticEngine_finishInit___block_invoke_128;
          v30[3] = &unk_1E69607C8;
          objc_copyWeak(&v31, &location);
          v25 = (void *)MEMORY[0x1B5E4F2B4](v30);
          -[CHHapticEngine player](self, "player");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "setStopRunningHandler:", v25);

          if (kHAPIScope)
          {
            v27 = *(id *)kHAPIScope;
            if (!v27)
            {
LABEL_49:

              objc_destroyWeak(&v31);
              goto LABEL_50;
            }
          }
          else
          {
            v27 = MEMORY[0x1E0C81028];
            v28 = MEMORY[0x1E0C81028];
          }
          if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 136315650;
            v45 = "CHHapticEngine.mm";
            v46 = 1024;
            v47 = 720;
            v48 = 2080;
            v49 = "-[CHHapticEngine finishInit:]";
            _os_log_impl(&dword_1B573F000, v27, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: Finished initializing", buf, 0x1Cu);
          }

          goto LABEL_49;
        }
      }
      else
      {
        v21 = MEMORY[0x1E0C81028];
        v24 = MEMORY[0x1E0C81028];
      }
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 136315650;
        v45 = "CHHapticEngine.mm";
        v46 = 1024;
        v47 = 681;
        v48 = 2080;
        v49 = "-[CHHapticEngine finishInit:]";
        v23 = "%25s:%-5d %s: Setting behavior to not follow audio route";
        goto LABEL_40;
      }
    }

    goto LABEL_42;
  }
LABEL_50:

  objc_destroyWeak(&v36);
  _Block_object_dispose(&v37, 8);

  objc_destroyWeak(&location);
  return v19 == 0;
}

- (AVHapticPlayer)player
{
  return self->_player;
}

- (void)toggleBehavior:(unint64_t)a3 set:(BOOL)a4
{
  _BOOL4 v4;
  unint64_t v7;
  unint64_t v8;

  v4 = a4;
  v7 = -[CHHapticEngine currentPlayerBehavior](self, "currentPlayerBehavior");
  if (v4)
    v8 = v7 | a3;
  else
    v8 = v7 & ~a3;
  -[CHHapticEngine setCurrentPlayerBehavior:](self, "setCurrentPlayerBehavior:", v8);
}

- (void)setCurrentPlayerBehavior:(unint64_t)a3
{
  self->_currentPlayerBehavior = a3;
}

- (void)updateEngineBehavior
{
  id v3;
  id v4;
  NSObject *v5;
  int v6;
  const char *v7;
  __int16 v8;
  int v9;
  __int16 v10;
  const char *v11;
  __int16 v12;
  int v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if (kHAPIScope)
  {
    v3 = *(id *)kHAPIScope;
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
    v6 = 136315906;
    v7 = "CHHapticEngine.mm";
    v8 = 1024;
    v9 = 851;
    v10 = 2080;
    v11 = "-[CHHapticEngine updateEngineBehavior]";
    v12 = 1024;
    v13 = -[CHHapticEngine currentPlayerBehavior](self, "currentPlayerBehavior");
    _os_log_impl(&dword_1B573F000, v5, OS_LOG_TYPE_DEFAULT, "%25s:%-5d %s: Setting player's behavior to 0x%x", (uint8_t *)&v6, 0x22u);
  }

LABEL_8:
  -[AVHapticPlayer setBehavior:](self->_player, "setBehavior:", -[CHHapticEngine currentPlayerBehavior](self, "currentPlayerBehavior"));
}

- (unint64_t)currentPlayerBehavior
{
  return self->_currentPlayerBehavior;
}

- (void)setFollowAudioRoute:(BOOL)a3
{
  -[CHHapticEngine toggleBehavior:set:](self, "toggleBehavior:set:", 2, a3);
}

- (BOOL)sessionIsShared
{
  return self->_sessionIsShared;
}

- (void)reconfigureAudioSession
{
  void *v3;
  char v4;
  NSObject *v5;
  id v6;
  int v7;
  const char *v8;
  __int16 v9;
  int v10;
  __int16 v11;
  const char *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if (-[NSString isEqualToString:](self->_usageCategory, "isEqualToString:", CFSTR("SystemSound")))
  {
    -[CHHapticEngine avAudioSession](self, "avAudioSession");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "setCategory:withOptions:error:", *MEMORY[0x1E0CFEFD0], 2, 0);

    if ((v4 & 1) == 0)
    {
      if (kHAPIScope)
      {
        v5 = *(id *)kHAPIScope;
        if (!v5)
          return;
      }
      else
      {
        v5 = MEMORY[0x1E0C81028];
        v6 = MEMORY[0x1E0C81028];
      }
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        v7 = 136315650;
        v8 = "CHHapticEngine.mm";
        v9 = 1024;
        v10 = 1090;
        v11 = 2080;
        v12 = "-[CHHapticEngine reconfigureAudioSession]";
        _os_log_impl(&dword_1B573F000, v5, OS_LOG_TYPE_ERROR, "%25s:%-5d %s: Cannot reconfigure audio session for system sound", (uint8_t *)&v7, 0x1Cu);
      }

    }
  }
}

- (NSTimeInterval)currentTime
{
  NSTimeInterval result;

  -[AVHapticPlayer currentMediaTime](self->_player, "currentMediaTime");
  return result;
}

- (CHHapticEngine)initAndReturnError:(NSError *)error
{
  NSObject *v5;
  os_signpost_id_t v6;
  NSObject *v7;
  NSObject *v8;
  CHHapticEngine *v9;
  NSObject *v10;
  id v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  AVAudioSession *avAudioSession;
  uint64_t v16;
  CHMetrics *v17;
  void *metrics;
  NSObject *v19;
  objc_super v21;
  uint8_t buf[4];
  const char *v23;
  __int16 v24;
  int v25;
  __int16 v26;
  const char *v27;
  __int16 v28;
  CHHapticEngine *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  if (setupHapticLogScopes(void)::once != -1)
    dispatch_once(&setupHapticLogScopes(void)::once, &__block_literal_global_2);
  CALog::Scope::oslog((id *)kHAPIScope);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = os_signpost_id_make_with_pointer(v5, self);

  CALog::Scope::oslog((id *)kHAPIScope);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1B573F000, v8, OS_SIGNPOST_INTERVAL_BEGIN, v6, "HapticEngine_initAndReturnError", " enableTelemetry=YES ", buf, 2u);
  }

  v21.receiver = self;
  v21.super_class = (Class)CHHapticEngine;
  v9 = -[CHHapticEngine init](&v21, sel_init);
  if (!v9)
    goto LABEL_21;
  if (kHAPIScope)
  {
    v10 = *(id *)kHAPIScope;
    if (!v10)
      goto LABEL_14;
  }
  else
  {
    v10 = MEMORY[0x1E0C81028];
    v11 = MEMORY[0x1E0C81028];
  }
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315906;
    v23 = "CHHapticEngine.mm";
    v24 = 1024;
    v25 = 1001;
    v26 = 2080;
    v27 = "-[CHHapticEngine initAndReturnError:]";
    v28 = 2048;
    v29 = v9;
    _os_log_impl(&dword_1B573F000, v10, OS_LOG_TYPE_DEFAULT, "%25s:%-5d %s: Creating engine %p with legacy initializer", buf, 0x26u);
  }

LABEL_14:
  +[CHHapticEngine capabilitiesForHardware](CHHapticEngine, "capabilitiesForHardware");
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = -[NSObject supportsHaptics](v12, "supportsHaptics");
  if ((v13 & 1) != 0 || (v13 = -[NSObject supportsAudio](v12, "supportsAudio"), (v13 & 1) != 0))
  {
    objc_msgSend(AVFASoftLink::getAVAudioSession((AVFASoftLink *)v13), "auxiliarySession");
    v14 = objc_claimAutoreleasedReturnValue();
    avAudioSession = v9->_avAudioSession;
    v9->_avAudioSession = (AVAudioSession *)v14;

    objc_storeStrong((id *)&v9->_usageCategory, CFSTR("Default"));
    if (-[CHHapticEngine setupEngineWithCategory:session:needsAudioPowerBudget:error:](v9, "setupEngineWithCategory:session:needsAudioPowerBudget:error:", v9->_usageCategory, v9->_avAudioSession, -[CHHapticEngine needsAudioPowerBudget](v9, "needsAudioPowerBudget"), error)&& (-[CHHapticEngine connectAudioSession:](v9, "connectAudioSession:", v9->_avAudioSession), v16 = -[CHHapticEngine getSessionIDFromAVAudioSession:](v9, "getSessionIDFromAVAudioSession:", v9->_avAudioSession), -[CHHapticEngine doInit:sessionIsShared:options:bypassAudioSession:error:](v9, "doInit:sessionIsShared:options:bypassAudioSession:error:", v16, 0, 0, 0, error)))
    {
      v17 = -[CHMetrics initWithEngine:audioSessionID:sessionIsShared:isSPI:]([CHMetrics alloc], "initWithEngine:audioSessionID:sessionIsShared:isSPI:", v9, v16, v9->_sessionIsShared, 0);
      metrics = v9->_metrics;
      v9->_metrics = v17;
    }
    else
    {
      metrics = v9;
      v9 = 0;
    }

LABEL_21:
    CALog::Scope::oslog((id *)kHAPIScope);
    v19 = objc_claimAutoreleasedReturnValue();
    v12 = v19;
    if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v19))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1B573F000, v12, OS_SIGNPOST_INTERVAL_END, v6, "HapticEngine_initAndReturnError", (const char *)&unk_1B57A456E, buf, 2u);
    }
    goto LABEL_27;
  }
  if (error)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.CoreHaptics"), -4809, 0);
    *error = (NSError *)(id)objc_claimAutoreleasedReturnValue();
  }

  v9 = 0;
LABEL_27:

  return v9;
}

+ (id)capabilitiesForHardware
{
  if (+[CHHapticEngine capabilitiesForHardware]::onceToken != -1)
    dispatch_once(&+[CHHapticEngine capabilitiesForHardware]::onceToken, &__block_literal_global_150);
  return (id)+[CHHapticEngine capabilitiesForHardware]::sDefaultHardwareCapabilities;
}

- (BOOL)setupEngineWithCategory:(id)a3 session:(id)a4 needsAudioPowerBudget:(BOOL)a5 error:(id *)a6
{
  _BOOL8 v7;
  id v10;
  id v11;
  uint64_t v12;
  BOOL v13;
  BOOL v14;
  NSObject *v16;
  id v17;
  int v18;
  const char *v19;
  __int16 v20;
  int v21;
  __int16 v22;
  const char *v23;
  uint64_t v24;

  v7 = a5;
  v24 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  if ((objc_msgSend(v10, "isEqualToString:", CFSTR("UIFeedback")) & 1) == 0
    && (objc_msgSend(v10, "isEqualToString:", CFSTR("DefaultWithConstantVolume")) & 1) == 0
    && (objc_msgSend(v10, "isEqualToString:", CFSTR("iOSKeyboard")) & 1) == 0)
  {
    if (objc_msgSend(v10, "isEqualToString:", CFSTR("SystemSound")))
    {
      v13 = -[CHHapticEngine setupSystemSoundAudioSession:needsAudioPowerBudget:error:](self, "setupSystemSoundAudioSession:needsAudioPowerBudget:error:", v11, v7, a6);
      goto LABEL_6;
    }
    if ((objc_msgSend(v10, "isEqualToString:", CFSTR("SystemSoundHapticsParser")) & 1) != 0)
    {
      v14 = 1;
      goto LABEL_7;
    }
    if (kHAPIScope)
    {
      v16 = *(id *)kHAPIScope;
      if (!v16)
      {
LABEL_19:
        v12 = 0;
        goto LABEL_5;
      }
    }
    else
    {
      v16 = MEMORY[0x1E0C81028];
      v17 = MEMORY[0x1E0C81028];
    }
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    {
      v18 = 136315650;
      v19 = "CHHapticEngineUsageCategory.mm";
      v20 = 1024;
      v21 = 165;
      v22 = 2080;
      v23 = "-[CHHapticEngine(EngineUsageCategory) setupEngineWithCategory:session:needsAudioPowerBudget:error:]";
      _os_log_impl(&dword_1B573F000, v16, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: Using default usage category", (uint8_t *)&v18, 0x1Cu);
    }

    goto LABEL_19;
  }
  v12 = 1;
LABEL_5:
  v13 = -[CHHapticEngine setupUnsharedAudioSession:isConstantVolume:needsAudioPowerBudget:error:](self, "setupUnsharedAudioSession:isConstantVolume:needsAudioPowerBudget:error:", v11, v12, v7, a6);
LABEL_6:
  v14 = v13;
LABEL_7:

  return v14;
}

- (BOOL)setupUnsharedAudioSession:(id)a3 isConstantVolume:(BOOL)a4 needsAudioPowerBudget:(BOOL)a5 error:(id *)a6
{
  _BOOL4 v7;
  _BOOL4 v8;
  id v9;
  NSObject *v10;
  id v11;
  const __CFString *v12;
  id v13;
  NSObject *v14;
  NSObject *v15;
  NSObject *v16;
  NSObject *v17;
  id v18;
  id v19;
  NSObject *v20;
  id v21;
  NSObject *v22;
  id v23;
  NSObject *v24;
  NSObject *v25;
  id v26;
  const char *v27;
  id v28;
  id v30;
  _BYTE v31[18];
  __int16 v32;
  const char *v33;
  __int16 v34;
  void *v35;
  uint64_t v36;

  v7 = a5;
  v8 = a4;
  v36 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  if (kHAPIScope)
  {
    v10 = *(id *)kHAPIScope;
    if (!v10)
      goto LABEL_10;
  }
  else
  {
    v10 = MEMORY[0x1E0C81028];
    v11 = MEMORY[0x1E0C81028];
  }
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    v12 = CFSTR("following ringer");
    *(_DWORD *)v31 = 136315906;
    *(_QWORD *)&v31[4] = "CHHapticEngineUsageCategory.mm";
    if (v8)
      v12 = CFSTR("with constant");
    *(_WORD *)&v31[12] = 1024;
    *(_DWORD *)&v31[14] = 45;
    v32 = 2080;
    v33 = "-[CHHapticEngine(EngineUsageCategory) setupUnsharedAudioSession:isConstantVolume:needsAudioPowerBudget:error:]";
    v34 = 2112;
    v35 = (void *)v12;
    _os_log_impl(&dword_1B573F000, v10, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: Setting SS&H category %@ volume, disabling notifications and NowPlaying for this audio session", v31, 0x26u);
  }

LABEL_10:
  v13 = (id)*MEMORY[0x1E0CFEFF8];
  if ((objc_msgSend(v9, "setCategory:error:", v13, a6) & 1) != 0)
  {
    v14 = (id)*MEMORY[0x1E0CFF080];
    if (v8)
    {
      v15 = (id)*MEMORY[0x1E0CFF090];

      v14 = v15;
    }
    if ((objc_msgSend(v9, "setMode:error:", v14, a6, *(_OWORD *)v31) & 1) == 0)
    {
      if (kHAPIScope)
      {
        v16 = *(id *)kHAPIScope;
        if (!v16)
          goto LABEL_27;
      }
      else
      {
        v16 = MEMORY[0x1E0C81028];
        v19 = MEMORY[0x1E0C81028];
      }
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)v31 = 136315906;
        *(_QWORD *)&v31[4] = "CHHapticEngineUsageCategory.mm";
        *(_WORD *)&v31[12] = 1024;
        *(_DWORD *)&v31[14] = 56;
        v32 = 2080;
        v33 = "-[CHHapticEngine(EngineUsageCategory) setupUnsharedAudioSession:isConstantVolume:needsAudioPowerBudget:error:]";
        v34 = 2112;
        v35 = v14;
        _os_log_impl(&dword_1B573F000, v16, OS_LOG_TYPE_ERROR, "%25s:%-5d %s: Failed to set mode %@ on audio session. Continue", v31, 0x26u);
      }

    }
LABEL_27:
    if ((objc_msgSend(v9, "setAudioHardwareControlFlags:error:", 1179648, a6) & 1) != 0)
      goto LABEL_35;
    if (kHAPIScope)
    {
      v20 = *(id *)kHAPIScope;
      if (!v20)
        goto LABEL_35;
    }
    else
    {
      v20 = MEMORY[0x1E0C81028];
      v21 = MEMORY[0x1E0C81028];
    }
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)v31 = 136315650;
      *(_QWORD *)&v31[4] = "CHHapticEngineUsageCategory.mm";
      *(_WORD *)&v31[12] = 1024;
      *(_DWORD *)&v31[14] = 61;
      v32 = 2080;
      v33 = "-[CHHapticEngine(EngineUsageCategory) setupUnsharedAudioSession:isConstantVolume:needsAudioPowerBudget:error:]";
      _os_log_impl(&dword_1B573F000, v20, OS_LOG_TYPE_ERROR, "%25s:%-5d %s: Cannot set audio session with session flags. Continue", v31, 0x1Cu);
    }

LABEL_35:
    if ((objc_msgSend(v9, "setPreferredIOBufferFrameSize:error:", 256, a6) & 1) != 0)
      goto LABEL_43;
    if (kHAPIScope)
    {
      v22 = *(id *)kHAPIScope;
      if (!v22)
        goto LABEL_43;
    }
    else
    {
      v22 = MEMORY[0x1E0C81028];
      v23 = MEMORY[0x1E0C81028];
    }
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)v31 = 136315906;
      *(_QWORD *)&v31[4] = "CHHapticEngineUsageCategory.mm";
      *(_WORD *)&v31[12] = 1024;
      *(_DWORD *)&v31[14] = 64;
      v32 = 2080;
      v33 = "-[CHHapticEngine(EngineUsageCategory) setupUnsharedAudioSession:isConstantVolume:needsAudioPowerBudget:error:]";
      v34 = 1024;
      LODWORD(v35) = 256;
      _os_log_impl(&dword_1B573F000, v22, OS_LOG_TYPE_ERROR, "%25s:%-5d %s: Cannot set audio buffer frame size to %u. Using default buffer size", v31, 0x22u);
    }

LABEL_43:
    if ((objc_msgSend(v9, "enableNotifications:error:", 0, a6) & 1) != 0)
    {
      if ((objc_msgSend(v9, "setParticipatesInNowPlayingAppPolicy:error:", 0, a6) & 1) != 0)
      {
        if (!v7)
          goto LABEL_53;
        if (kHAPIScope)
        {
          if ((*(_BYTE *)(kHAPIScope + 8) & 1) != 0)
          {
            v24 = *(id *)kHAPIScope;
            if (v24)
            {
              v25 = v24;
              if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)v31 = 136315650;
                *(_QWORD *)&v31[4] = "CHHapticEngineUsageCategory.mm";
                *(_WORD *)&v31[12] = 1024;
                *(_DWORD *)&v31[14] = 77;
                v32 = 2080;
                v33 = "-[CHHapticEngine(EngineUsageCategory) setupUnsharedAudioSession:isConstantVolume:needsAudioPowerBudget:error:]";
                _os_log_impl(&dword_1B573F000, v25, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: Setting NeedsPowerBudgeting property on audio session", v31, 0x1Cu);
              }

            }
          }
        }
        if ((objc_msgSend(v9, "setNeedsHighPowerBudgeting:error:", 1, a6) & 1) != 0)
        {
LABEL_53:
          LOBYTE(v17) = 1;
LABEL_69:

          goto LABEL_70;
        }
        if (kHAPIScope)
        {
          v17 = *(id *)kHAPIScope;
          if (!v17)
            goto LABEL_69;
        }
        else
        {
          v17 = MEMORY[0x1E0C81028];
          v30 = MEMORY[0x1E0C81028];
        }
        if (!os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
          goto LABEL_67;
        *(_DWORD *)v31 = 136315650;
        *(_QWORD *)&v31[4] = "CHHapticEngineUsageCategory.mm";
        *(_WORD *)&v31[12] = 1024;
        *(_DWORD *)&v31[14] = 79;
        v32 = 2080;
        v33 = "-[CHHapticEngine(EngineUsageCategory) setupUnsharedAudioSession:isConstantVolume:needsAudioPowerBudget:error:]";
        v27 = "%25s:%-5d %s: Failed to set audio session NeedsPowerBudgeting";
      }
      else
      {
        if (kHAPIScope)
        {
          v17 = *(id *)kHAPIScope;
          if (!v17)
            goto LABEL_69;
        }
        else
        {
          v17 = MEMORY[0x1E0C81028];
          v28 = MEMORY[0x1E0C81028];
        }
        if (!os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
          goto LABEL_67;
        *(_DWORD *)v31 = 136315650;
        *(_QWORD *)&v31[4] = "CHHapticEngineUsageCategory.mm";
        *(_WORD *)&v31[12] = 1024;
        *(_DWORD *)&v31[14] = 72;
        v32 = 2080;
        v33 = "-[CHHapticEngine(EngineUsageCategory) setupUnsharedAudioSession:isConstantVolume:needsAudioPowerBudget:error:]";
        v27 = "%25s:%-5d %s: Failed to disable audio session now-playing policy";
      }
    }
    else
    {
      if (kHAPIScope)
      {
        v17 = *(id *)kHAPIScope;
        if (!v17)
          goto LABEL_69;
      }
      else
      {
        v17 = MEMORY[0x1E0C81028];
        v26 = MEMORY[0x1E0C81028];
      }
      if (!os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        goto LABEL_67;
      *(_DWORD *)v31 = 136315650;
      *(_QWORD *)&v31[4] = "CHHapticEngineUsageCategory.mm";
      *(_WORD *)&v31[12] = 1024;
      *(_DWORD *)&v31[14] = 67;
      v32 = 2080;
      v33 = "-[CHHapticEngine(EngineUsageCategory) setupUnsharedAudioSession:isConstantVolume:needsAudioPowerBudget:error:]";
      v27 = "%25s:%-5d %s: Failed to disable audio session notifications";
    }
    _os_log_impl(&dword_1B573F000, v17, OS_LOG_TYPE_ERROR, v27, v31, 0x1Cu);
LABEL_67:

LABEL_68:
    LOBYTE(v17) = 0;
    goto LABEL_69;
  }
  if (!kHAPIScope)
  {
    v14 = MEMORY[0x1E0C81028];
    v18 = MEMORY[0x1E0C81028];
LABEL_21:
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)v31 = 136315650;
      *(_QWORD *)&v31[4] = "CHHapticEngineUsageCategory.mm";
      *(_WORD *)&v31[12] = 1024;
      *(_DWORD *)&v31[14] = 48;
      v32 = 2080;
      v33 = "-[CHHapticEngine(EngineUsageCategory) setupUnsharedAudioSession:isConstantVolume:needsAudioPowerBudget:error:]";
      _os_log_impl(&dword_1B573F000, v14, OS_LOG_TYPE_ERROR, "%25s:%-5d %s: Failed to set category on audio session", v31, 0x1Cu);
    }
    goto LABEL_68;
  }
  v14 = *(id *)kHAPIScope;
  if (v14)
    goto LABEL_21;
  LOBYTE(v17) = 0;
LABEL_70:

  return (char)v17;
}

- (void)startWithCompletionHandler:(CHHapticCompletionHandler)completionHandler
{
  CHHapticCompletionHandler v4;
  NSObject *v5;
  id v6;
  NSObject *v7;
  os_signpost_id_t v8;
  NSObject *v9;
  NSObject *v10;
  NSObject *v11;
  NSObject *v12;
  id v13;
  id v14;
  _QWORD v15[5];
  id v16;
  os_signpost_id_t v17;
  _QWORD v18[4];
  id v19;
  id v20;
  id v21;
  uint8_t buf[4];
  const char *v23;
  __int16 v24;
  int v25;
  __int16 v26;
  const char *v27;
  __int16 v28;
  CHHapticEngine *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v4 = completionHandler;
  if (kHAPIScope)
  {
    v5 = *(id *)kHAPIScope;
    if (!v5)
      goto LABEL_8;
  }
  else
  {
    v5 = MEMORY[0x1E0C81028];
    v6 = MEMORY[0x1E0C81028];
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315906;
    v23 = "CHHapticEngine.mm";
    v24 = 1024;
    v25 = 1231;
    v26 = 2080;
    v27 = "-[CHHapticEngine startWithCompletionHandler:]";
    v28 = 2048;
    v29 = self;
    _os_log_impl(&dword_1B573F000, v5, OS_LOG_TYPE_DEFAULT, "%25s:%-5d %s: Called on engine %p", buf, 0x26u);
  }

LABEL_8:
  if (self->_player)
  {
    CALog::Scope::oslog((id *)kHAPIScope);
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = os_signpost_id_make_with_pointer(v7, self);

    CALog::Scope::oslog((id *)kHAPIScope);
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1B573F000, v10, OS_SIGNPOST_INTERVAL_BEGIN, v8, "HapticEngine_startWithCompletionHandler", " enableTelemetry=YES ", buf, 2u);
    }

    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __45__CHHapticEngine_startWithCompletionHandler___block_invoke_159;
    v15[3] = &unk_1E69608D8;
    v15[4] = self;
    v16 = v4;
    v17 = v8;
    -[CHHapticEngine dispatchOnLocal:](self, "dispatchOnLocal:", v15);
    CALog::Scope::oslog((id *)kHAPIScope);
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = v11;
    if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1B573F000, v12, OS_SIGNPOST_INTERVAL_END, v8, "HapticEngine_startWithCompletionHandler", (const char *)&unk_1B57A456E, buf, 2u);
    }

  }
  else
  {
    v21 = 0;
    _Haptic_Check((uint64_t)"/Library/Caches/com.apple.xbs/Sources/CoreHaptics/Source/CHHapticEngine.mm", 1232, "-[CHHapticEngine startWithCompletionHandler:]", "_player != nil", -4810, &v21);
    v13 = v21;
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __45__CHHapticEngine_startWithCompletionHandler___block_invoke;
    v18[3] = &unk_1E695FF00;
    v19 = v13;
    v20 = v4;
    v14 = v13;
    -[CHHapticEngine dispatchOnLocal:](self, "dispatchOnLocal:", v18);

  }
}

- (void)stopWithCompletionHandler:(CHHapticCompletionHandler)completionHandler
{
  CHHapticCompletionHandler v4;
  NSObject *v5;
  id v6;
  NSObject *v7;
  os_signpost_id_t v8;
  NSObject *v9;
  NSObject *v10;
  NSObject *v11;
  NSObject *v12;
  id v13;
  id v14;
  uint8_t v15[8];
  _QWORD v16[4];
  id v17;
  id v18;
  _QWORD v19[4];
  id v20;
  id v21;
  id v22;
  uint8_t buf[4];
  const char *v24;
  __int16 v25;
  int v26;
  __int16 v27;
  const char *v28;
  __int16 v29;
  CHHapticEngine *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v4 = completionHandler;
  if (kHAPIScope)
  {
    v5 = *(id *)kHAPIScope;
    if (!v5)
      goto LABEL_8;
  }
  else
  {
    v5 = MEMORY[0x1E0C81028];
    v6 = MEMORY[0x1E0C81028];
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315906;
    v24 = "CHHapticEngine.mm";
    v25 = 1024;
    v26 = 1360;
    v27 = 2080;
    v28 = "-[CHHapticEngine stopWithCompletionHandler:]";
    v29 = 2048;
    v30 = self;
    _os_log_impl(&dword_1B573F000, v5, OS_LOG_TYPE_DEFAULT, "%25s:%-5d %s: Called on engine %p", buf, 0x26u);
  }

LABEL_8:
  if (self->_player)
  {
    CALog::Scope::oslog((id *)kHAPIScope);
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = os_signpost_id_make_with_pointer(v7, self);

    CALog::Scope::oslog((id *)kHAPIScope);
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1B573F000, v10, OS_SIGNPOST_INTERVAL_BEGIN, v8, "HapticEngine_stopWithCompletionHandler", " enableTelemetry=YES ", buf, 2u);
    }

    objc_initWeak((id *)buf, self);
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __44__CHHapticEngine_stopWithCompletionHandler___block_invoke_162;
    v16[3] = &unk_1E6960950;
    objc_copyWeak(&v18, (id *)buf);
    v17 = v4;
    -[CHHapticEngine dispatchOnLocal:](self, "dispatchOnLocal:", v16);
    CALog::Scope::oslog((id *)kHAPIScope);
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = v11;
    if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
    {
      *(_WORD *)v15 = 0;
      _os_signpost_emit_with_name_impl(&dword_1B573F000, v12, OS_SIGNPOST_INTERVAL_END, v8, "HapticEngine_stopWithCompletionHandler", (const char *)&unk_1B57A456E, v15, 2u);
    }

    objc_destroyWeak(&v18);
    objc_destroyWeak((id *)buf);
  }
  else
  {
    v22 = 0;
    _Haptic_Check((uint64_t)"/Library/Caches/com.apple.xbs/Sources/CoreHaptics/Source/CHHapticEngine.mm", 1361, "-[CHHapticEngine stopWithCompletionHandler:]", "_player != nil", -4810, &v22);
    v13 = v22;
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __44__CHHapticEngine_stopWithCompletionHandler___block_invoke;
    v19[3] = &unk_1E695FF00;
    v20 = v13;
    v21 = v4;
    v14 = v13;
    -[CHHapticEngine dispatchOnLocal:](self, "dispatchOnLocal:", v19);

  }
}

- (BOOL)setupSystemSoundAudioSession:(id)a3 needsAudioPowerBudget:(BOOL)a4 error:(id *)a5
{
  _BOOL4 v6;
  id v7;
  NSObject *v8;
  id v9;
  NSObject *v10;
  NSObject *v11;
  id v12;
  const char *v13;
  id v14;
  NSObject *v15;
  id v16;
  NSObject *v17;
  id v18;
  id v19;
  double v20;
  NSObject *v21;
  id v22;
  void *v23;
  char v24;
  NSObject *v25;
  id v26;
  NSObject *v27;
  NSObject *v28;
  id v30;
  int v31;
  const char *v32;
  __int16 v33;
  int v34;
  __int16 v35;
  const char *v36;
  __int16 v37;
  int v38;
  uint64_t v39;

  v6 = a4;
  v39 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  if (kHAPIScope)
  {
    v8 = *(id *)kHAPIScope;
    if (!v8)
      goto LABEL_8;
  }
  else
  {
    v8 = MEMORY[0x1E0C81028];
    v9 = MEMORY[0x1E0C81028];
  }
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    v31 = 136315650;
    v32 = "CHHapticEngineUsageCategory.mm";
    v33 = 1024;
    v34 = 92;
    v35 = 2080;
    v36 = "-[CHHapticEngine(EngineUsageCategory) setupSystemSoundAudioSession:needsAudioPowerBudget:error:]";
    _os_log_impl(&dword_1B573F000, v8, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: Setting for System Sound, disabling notifications and NowPlaying for this audio session", (uint8_t *)&v31, 0x1Cu);
  }

LABEL_8:
  if ((objc_msgSend(v7, "setCategory:withOptions:error:", *MEMORY[0x1E0CFEFD0], 2, a5) & 1) == 0)
  {
    if (kHAPIScope)
    {
      v11 = *(id *)kHAPIScope;
      if (!v11)
        goto LABEL_73;
    }
    else
    {
      v11 = MEMORY[0x1E0C81028];
      v12 = MEMORY[0x1E0C81028];
    }
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      goto LABEL_43;
    v31 = 136315650;
    v32 = "CHHapticEngineUsageCategory.mm";
    v33 = 1024;
    v34 = 96;
    v35 = 2080;
    v36 = "-[CHHapticEngine(EngineUsageCategory) setupSystemSoundAudioSession:needsAudioPowerBudget:error:]";
    v13 = "%25s:%-5d %s: Failed to set category on audio session";
    goto LABEL_42;
  }
  if ((objc_msgSend(v7, "setAudioHardwareControlFlags:error:", 18, a5) & 1) == 0)
  {
    if (kHAPIScope)
    {
      v10 = *(id *)kHAPIScope;
      if (!v10)
        goto LABEL_23;
    }
    else
    {
      v10 = MEMORY[0x1E0C81028];
      v14 = MEMORY[0x1E0C81028];
    }
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v31 = 136315650;
      v32 = "CHHapticEngineUsageCategory.mm";
      v33 = 1024;
      v34 = 101;
      v35 = 2080;
      v36 = "-[CHHapticEngine(EngineUsageCategory) setupSystemSoundAudioSession:needsAudioPowerBudget:error:]";
      _os_log_impl(&dword_1B573F000, v10, OS_LOG_TYPE_ERROR, "%25s:%-5d %s: Cannot set audio session with session flags. Continue", (uint8_t *)&v31, 0x1Cu);
    }

  }
LABEL_23:
  if ((objc_msgSend(v7, "setPreferredIOBufferFrameSize:error:", 512, a5) & 1) != 0)
    goto LABEL_31;
  if (kHAPIScope)
  {
    v15 = *(id *)kHAPIScope;
    if (!v15)
      goto LABEL_31;
  }
  else
  {
    v15 = MEMORY[0x1E0C81028];
    v16 = MEMORY[0x1E0C81028];
  }
  if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
  {
    v31 = 136315906;
    v32 = "CHHapticEngineUsageCategory.mm";
    v33 = 1024;
    v34 = 104;
    v35 = 2080;
    v36 = "-[CHHapticEngine(EngineUsageCategory) setupSystemSoundAudioSession:needsAudioPowerBudget:error:]";
    v37 = 1024;
    v38 = 512;
    _os_log_impl(&dword_1B573F000, v15, OS_LOG_TYPE_ERROR, "%25s:%-5d %s: Cannot set audio buffer frame size to %u", (uint8_t *)&v31, 0x22u);
  }

LABEL_31:
  if ((objc_msgSend(v7, "enableNotifications:error:", 0, a5) & 1) == 0)
  {
    if (kHAPIScope)
    {
      v11 = *(id *)kHAPIScope;
      if (!v11)
        goto LABEL_73;
    }
    else
    {
      v11 = MEMORY[0x1E0C81028];
      v18 = MEMORY[0x1E0C81028];
    }
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      goto LABEL_43;
    v31 = 136315650;
    v32 = "CHHapticEngineUsageCategory.mm";
    v33 = 1024;
    v34 = 108;
    v35 = 2080;
    v36 = "-[CHHapticEngine(EngineUsageCategory) setupSystemSoundAudioSession:needsAudioPowerBudget:error:]";
    v13 = "%25s:%-5d %s: Failed to disable audio session notifications";
    goto LABEL_42;
  }
  if ((objc_msgSend(v7, "setPrefersNoDucking:error:", 1, a5) & 1) == 0)
  {
    if (kHAPIScope)
    {
      v17 = *(id *)kHAPIScope;
      if (!v17)
        goto LABEL_48;
    }
    else
    {
      v17 = MEMORY[0x1E0C81028];
      v19 = MEMORY[0x1E0C81028];
    }
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      v31 = 136315650;
      v32 = "CHHapticEngineUsageCategory.mm";
      v33 = 1024;
      v34 = 112;
      v35 = 2080;
      v36 = "-[CHHapticEngine(EngineUsageCategory) setupSystemSoundAudioSession:needsAudioPowerBudget:error:]";
      _os_log_impl(&dword_1B573F000, v17, OS_LOG_TYPE_ERROR, "%25s:%-5d %s: Failed to set not to be ducked by others", (uint8_t *)&v31, 0x1Cu);
    }

  }
LABEL_48:
  if ((objc_msgSend(v7, "setParticipatesInNowPlayingAppPolicy:error:", 0, a5) & 1) != 0)
    goto LABEL_56;
  if (kHAPIScope)
  {
    v21 = *(id *)kHAPIScope;
    if (!v21)
      goto LABEL_56;
  }
  else
  {
    v21 = MEMORY[0x1E0C81028];
    v22 = MEMORY[0x1E0C81028];
  }
  if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
  {
    v31 = 136315650;
    v32 = "CHHapticEngineUsageCategory.mm";
    v33 = 1024;
    v34 = 115;
    v35 = 2080;
    v36 = "-[CHHapticEngine(EngineUsageCategory) setupSystemSoundAudioSession:needsAudioPowerBudget:error:]";
    _os_log_impl(&dword_1B573F000, v21, OS_LOG_TYPE_ERROR, "%25s:%-5d %s: Failed to disable audio session now-playing policy", (uint8_t *)&v31, 0x1Cu);
  }

LABEL_56:
  LODWORD(v20) = 1036831949;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v20);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = objc_msgSend(v7, "setDuckToLevelScalar:error:", v23, a5);

  if ((v24 & 1) == 0)
  {
    if (kHAPIScope)
    {
      v25 = *(id *)kHAPIScope;
      if (!v25)
        goto LABEL_64;
    }
    else
    {
      v25 = MEMORY[0x1E0C81028];
      v26 = MEMORY[0x1E0C81028];
    }
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      v31 = 136315650;
      v32 = "CHHapticEngineUsageCategory.mm";
      v33 = 1024;
      v34 = 118;
      v35 = 2080;
      v36 = "-[CHHapticEngine(EngineUsageCategory) setupSystemSoundAudioSession:needsAudioPowerBudget:error:]";
      _os_log_impl(&dword_1B573F000, v25, OS_LOG_TYPE_ERROR, "%25s:%-5d %s: Failed to set duck level", (uint8_t *)&v31, 0x1Cu);
    }

  }
LABEL_64:
  if (!v6)
    goto LABEL_72;
  if (kHAPIScope)
  {
    if ((*(_BYTE *)(kHAPIScope + 8) & 1) != 0)
    {
      v27 = *(id *)kHAPIScope;
      if (v27)
      {
        v28 = v27;
        if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
        {
          v31 = 136315650;
          v32 = "CHHapticEngineUsageCategory.mm";
          v33 = 1024;
          v34 = 121;
          v35 = 2080;
          v36 = "-[CHHapticEngine(EngineUsageCategory) setupSystemSoundAudioSession:needsAudioPowerBudget:error:]";
          _os_log_impl(&dword_1B573F000, v28, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: Setting NeedsPowerBudgeting property on audio session", (uint8_t *)&v31, 0x1Cu);
        }

      }
    }
  }
  if ((objc_msgSend(v7, "setNeedsHighPowerBudgeting:error:", 1, a5) & 1) != 0)
  {
LABEL_72:
    LOBYTE(v11) = 1;
    goto LABEL_73;
  }
  if (kHAPIScope)
  {
    v11 = *(id *)kHAPIScope;
    if (!v11)
      goto LABEL_73;
  }
  else
  {
    v11 = MEMORY[0x1E0C81028];
    v30 = MEMORY[0x1E0C81028];
  }
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    v31 = 136315650;
    v32 = "CHHapticEngineUsageCategory.mm";
    v33 = 1024;
    v34 = 123;
    v35 = 2080;
    v36 = "-[CHHapticEngine(EngineUsageCategory) setupSystemSoundAudioSession:needsAudioPowerBudget:error:]";
    v13 = "%25s:%-5d %s: Failed to set audio session NeedsPowerBudgeting";
LABEL_42:
    _os_log_impl(&dword_1B573F000, v11, OS_LOG_TYPE_ERROR, v13, (uint8_t *)&v31, 0x1Cu);
  }
LABEL_43:

  LOBYTE(v11) = 0;
LABEL_73:

  return (char)v11;
}

- (void)updateAudioConfigurations:(id)a3 session:(id)a4
{
  id v6;
  id v7;
  char v8;
  id v9;
  NSObject *v10;
  char v11;
  id v12;
  id v13;
  id v14;
  id v15;
  uint8_t buf[4];
  const char *v17;
  __int16 v18;
  int v19;
  __int16 v20;
  const char *v21;
  __int16 v22;
  int v23;
  __int16 v24;
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (!v6 || !objc_msgSend(v6, "isEqualToString:", CFSTR("iOSKeyboard")))
    goto LABEL_10;
  if (-[CHHapticEngine playsAudioOnly](self, "playsAudioOnly")
    || -[CHHapticEngine playsHapticsOnly](self, "playsHapticsOnly"))
  {
    if (-[CHHapticEngine playsAudioOnly](self, "playsAudioOnly"))
    {
      v14 = 0;
      v8 = objc_msgSend(v7, "setPreferredIOBufferFrameSize:error:", 1024, &v14);
      v9 = v14;
      if ((v8 & 1) == 0)
      {
        if (kHAPIScope)
        {
          v10 = *(id *)kHAPIScope;
          if (!v10)
            goto LABEL_11;
        }
        else
        {
          v10 = MEMORY[0x1E0C81028];
          v12 = MEMORY[0x1E0C81028];
        }
        if (!os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
          goto LABEL_23;
        *(_DWORD *)buf = 136316162;
        v17 = "CHHapticEngineUsageCategory.mm";
        v18 = 1024;
        v19 = 183;
        v20 = 2080;
        v21 = "-[CHHapticEngine(EngineUsageCategory) updateAudioConfigurations:session:]";
        v22 = 1024;
        v23 = 1024;
        v24 = 2112;
        v25 = v9;
        goto LABEL_22;
      }
      goto LABEL_11;
    }
LABEL_10:
    v9 = 0;
    goto LABEL_11;
  }
  v15 = 0;
  v11 = objc_msgSend(v7, "setPreferredIOBufferFrameSize:error:", 256, &v15);
  v9 = v15;
  if ((v11 & 1) == 0)
  {
    if (kHAPIScope)
    {
      v10 = *(id *)kHAPIScope;
      if (!v10)
        goto LABEL_11;
    }
    else
    {
      v10 = MEMORY[0x1E0C81028];
      v13 = MEMORY[0x1E0C81028];
    }
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      goto LABEL_23;
    *(_DWORD *)buf = 136316162;
    v17 = "CHHapticEngineUsageCategory.mm";
    v18 = 1024;
    v19 = 177;
    v20 = 2080;
    v21 = "-[CHHapticEngine(EngineUsageCategory) updateAudioConfigurations:session:]";
    v22 = 1024;
    v23 = 256;
    v24 = 2112;
    v25 = v9;
LABEL_22:
    _os_log_impl(&dword_1B573F000, v10, OS_LOG_TYPE_ERROR, "%25s:%-5d %s: Cannot set audio buffer frame size to %u. Error: %@", buf, 0x2Cu);
LABEL_23:

  }
LABEL_11:

}

+ (void)lazyInitResourceMap
{
  std::mutex *v2;
  NSObject *v3;
  id v4;
  _QWORD *v5;
  int v6;
  const char *v7;
  __int16 v8;
  int v9;
  __int16 v10;
  const char *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v2 = (std::mutex *)_sResourceMutex;
  std::mutex::lock((std::mutex *)_sResourceMutex);
  if (!_sResourceEntries)
  {
    if (kHAPIScope)
    {
      v3 = *(id *)kHAPIScope;
      if (!v3)
      {
LABEL_9:
        v5 = (_QWORD *)operator new();
        v5[2] = 0;
        v5[1] = 0;
        *v5 = v5 + 1;
        _sResourceEntries = (uint64_t)v5;
        goto LABEL_10;
      }
    }
    else
    {
      v3 = MEMORY[0x1E0C81028];
      v4 = MEMORY[0x1E0C81028];
    }
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      v6 = 136315650;
      v7 = "CHHapticEngine.mm";
      v8 = 1024;
      v9 = 299;
      v10 = 2080;
      v11 = "+[CHHapticEngine lazyInitResourceMap]";
      _os_log_impl(&dword_1B573F000, v3, OS_LOG_TYPE_INFO, "%25s:%-5d %s: Creating resource map on first use", (uint8_t *)&v6, 0x1Cu);
    }

    goto LABEL_9;
  }
LABEL_10:
  std::mutex::unlock(v2);
}

+ (void)clearResourceMap
{
  std::mutex *v2;
  NSObject *v3;
  id v4;
  _QWORD *v5;
  _QWORD *v6;
  int v7;
  const char *v8;
  __int16 v9;
  int v10;
  __int16 v11;
  const char *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v2 = (std::mutex *)_sResourceMutex;
  std::mutex::lock((std::mutex *)_sResourceMutex);
  if (_sResourceEntries)
  {
    if (kHAPIScope)
    {
      v3 = *(id *)kHAPIScope;
      if (!v3)
      {
LABEL_9:
        v5 = (_QWORD *)_sResourceEntries;
        v6 = (_QWORD *)(_sResourceEntries + 8);
        std::__tree<std::__value_type<unsigned long,std::tuple<std::shared_ptr<AudioResource>,NSDictionary * {__strong},unsigned int>>,std::__map_value_compare<unsigned long,std::__value_type<unsigned long,std::tuple<std::shared_ptr<AudioResource>,NSDictionary * {__strong},unsigned int>>,std::less<unsigned long>,true>,std::allocator<std::__value_type<unsigned long,std::tuple<std::shared_ptr<AudioResource>,NSDictionary * {__strong},unsigned int>>>>::destroy(_sResourceEntries, *(_QWORD **)(_sResourceEntries + 8));
        *v5 = v6;
        v5[2] = 0;
        *v6 = 0;
        goto LABEL_10;
      }
    }
    else
    {
      v3 = MEMORY[0x1E0C81028];
      v4 = MEMORY[0x1E0C81028];
    }
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      v7 = 136315650;
      v8 = "CHHapticEngine.mm";
      v9 = 1024;
      v10 = 308;
      v11 = 2080;
      v12 = "+[CHHapticEngine clearResourceMap]";
      _os_log_impl(&dword_1B573F000, v3, OS_LOG_TYPE_INFO, "%25s:%-5d %s: Clearing resource map", (uint8_t *)&v7, 0x1Cu);
    }

    goto LABEL_9;
  }
LABEL_10:
  std::mutex::unlock(v2);
}

- (BOOL)isBehaviorSet:(unint64_t)a3
{
  return (-[CHHapticEngine currentPlayerBehavior](self, "currentPlayerBehavior") & a3) != 0;
}

- (BOOL)playsHapticsOnly
{
  return -[CHHapticEngine isBehaviorSet:](self, "isBehaviorSet:", 1);
}

- (BOOL)playsAudioOnly
{
  return -[CHHapticEngine isBehaviorSet:](self, "isBehaviorSet:", 16);
}

- (void)setPlaysAudioOnly:(BOOL)playsAudioOnly
{
  _BOOL8 v3;
  void *v5;
  int v6;
  void *v7;
  id v8;

  v3 = playsAudioOnly;
  -[CHHapticEngine serverConfig](self, "serverConfig");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "supportsHapticPlayback"))
  {
    -[CHHapticEngine serverConfig](self, "serverConfig");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "supportsAudioPlayback");

    if (!v6)
      return;
    -[CHHapticEngine toggleBehavior:set:](self, "toggleBehavior:set:", 16, v3);
    -[CHHapticEngine usageCategory](self, "usageCategory");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    -[CHHapticEngine avAudioSession](self, "avAudioSession");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[CHHapticEngine updateAudioConfigurations:session:](self, "updateAudioConfigurations:session:", v8, v7);

  }
}

- (BOOL)muteHapticsWhileRecordingAudio
{
  return !-[CHHapticEngine isBehaviorSet:](self, "isBehaviorSet:", 512);
}

- (void)setMuteHapticsWhileRecordingAudio:(BOOL)a3
{
  -[CHHapticEngine toggleBehavior:set:](self, "toggleBehavior:set:", 512, !a3);
  -[CHHapticEngine updateEngineBehavior](self, "updateEngineBehavior");
}

- (BOOL)isMutedForAudio
{
  return -[CHHapticEngine isBehaviorSet:](self, "isBehaviorSet:", 32);
}

- (void)setIsMutedForAudio:(BOOL)isMutedForAudio
{
  -[CHHapticEngine toggleBehavior:set:](self, "toggleBehavior:set:", 32, isMutedForAudio);
  -[CHHapticEngine updateEngineBehavior](self, "updateEngineBehavior");
}

- (BOOL)isMutedForHaptics
{
  return -[CHHapticEngine isBehaviorSet:](self, "isBehaviorSet:", 64);
}

- (void)setIsMutedForHaptics:(BOOL)isMutedForHaptics
{
  -[CHHapticEngine toggleBehavior:set:](self, "toggleBehavior:set:", 64, isMutedForHaptics);
  -[CHHapticEngine updateEngineBehavior](self, "updateEngineBehavior");
}

void __41__CHHapticEngine_setAutoShutdownEnabled___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id v5;
  NSObject *v6;
  id v7;
  id WeakRetained;
  NSObject *v9;
  id v10;
  int v11;
  const char *v12;
  __int16 v13;
  int v14;
  __int16 v15;
  const char *v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (kHAPIScope)
  {
    v4 = *(id *)kHAPIScope;
    if (!v4)
      goto LABEL_8;
  }
  else
  {
    v4 = MEMORY[0x1E0C81028];
    v5 = MEMORY[0x1E0C81028];
  }
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    v11 = 136315650;
    v12 = "CHHapticEngine.mm";
    v13 = 1024;
    v14 = 419;
    v15 = 2080;
    v16 = "-[CHHapticEngine setAutoShutdownEnabled:]_block_invoke";
    _os_log_impl(&dword_1B573F000, v4, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: <Top of AV finishWithCompletionHandler block>", (uint8_t *)&v11, 0x1Cu);
  }

LABEL_8:
  if (!v3)
    goto LABEL_16;
  if (kHAPIScope)
  {
    v6 = *(id *)kHAPIScope;
    if (!v6)
      goto LABEL_16;
  }
  else
  {
    v6 = MEMORY[0x1E0C81028];
    v7 = MEMORY[0x1E0C81028];
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    v11 = 136315906;
    v12 = "CHHapticEngine.mm";
    v13 = 1024;
    v14 = 420;
    v15 = 2080;
    v16 = "-[CHHapticEngine setAutoShutdownEnabled:]_block_invoke";
    v17 = 2112;
    v18 = v3;
    _os_log_impl(&dword_1B573F000, v6, OS_LOG_TYPE_ERROR, "%25s:%-5d %s: finishWithCompletionHandler callback returned error: %@", (uint8_t *)&v11, 0x26u);
  }

LABEL_16:
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "handleFinish:", v3);
  if (kHAPIScope)
  {
    v9 = *(id *)kHAPIScope;
    if (!v9)
      goto LABEL_23;
  }
  else
  {
    v9 = MEMORY[0x1E0C81028];
    v10 = MEMORY[0x1E0C81028];
  }
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    v11 = 136315650;
    v12 = "CHHapticEngine.mm";
    v13 = 1024;
    v14 = 423;
    v15 = 2080;
    v16 = "-[CHHapticEngine setAutoShutdownEnabled:]_block_invoke";
    _os_log_impl(&dword_1B573F000, v9, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: <Bottom of AV finishWithCompletionHandler block>", (uint8_t *)&v11, 0x1Cu);
  }

LABEL_23:
}

uint64_t __41__CHHapticEngine_setAutoShutdownEnabled___block_invoke_111(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "cancelIdleTimer");
}

- (BOOL)followAudioRoute
{
  return -[CHHapticEngine isBehaviorSet:](self, "isBehaviorSet:", 2);
}

- (BOOL)highPriority
{
  return -[CHHapticEngine isBehaviorSet:](self, "isBehaviorSet:", 128);
}

- (void)setHighPriority:(BOOL)a3
{
  -[CHHapticEngine toggleBehavior:set:](self, "toggleBehavior:set:", 128, a3);
}

- (NSArray)availableLocalities
{
  return (NSArray *)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObject:", CFSTR("CHHapticLocalityEngineDefault"));
}

- (NSString)locality
{
  void *v2;
  void *v3;

  -[CHHapticEngine serverConfig](self, "serverConfig");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "currentLocality");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (double)autoShutdownTimeout
{
  return self->_runTimeout;
}

- (void)setAutoShutdownTimeout:(double)a3
{
  NSObject *v4;
  id v5;
  int v6;
  const char *v7;
  __int16 v8;
  int v9;
  __int16 v10;
  const char *v11;
  __int16 v12;
  double v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if (a3 >= 0.0)
  {
    self->_runTimeout = a3;
    return;
  }
  if (kHAPIScope)
  {
    v4 = *(id *)kHAPIScope;
    if (!v4)
      return;
  }
  else
  {
    v4 = MEMORY[0x1E0C81028];
    v5 = MEMORY[0x1E0C81028];
  }
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    v6 = 136315906;
    v7 = "CHHapticEngine.mm";
    v8 = 1024;
    v9 = 478;
    v10 = 2080;
    v11 = "-[CHHapticEngine setAutoShutdownTimeout:]";
    v12 = 2048;
    v13 = a3;
    _os_log_impl(&dword_1B573F000, v4, OS_LOG_TYPE_ERROR, "%25s:%-5d %s: Invalid shutdown timeout (%f) being ignored", (uint8_t *)&v6, 0x26u);
  }

}

- (void)handleMediaServerDeath:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  CHHapticEngine *v7;
  NSObject *v8;
  id v9;
  AVHapticPlayer *player;
  int v11;
  const char *v12;
  __int16 v13;
  int v14;
  __int16 v15;
  const char *v16;
  __int16 v17;
  CHHapticEngine *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (kHAPIScope)
  {
    v5 = *(id *)kHAPIScope;
    if (!v5)
      goto LABEL_8;
  }
  else
  {
    v5 = MEMORY[0x1E0C81028];
    v6 = MEMORY[0x1E0C81028];
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v11 = 136315906;
    v12 = "CHHapticEngine.mm";
    v13 = 1024;
    v14 = 500;
    v15 = 2080;
    v16 = "-[CHHapticEngine handleMediaServerDeath:]";
    v17 = 2048;
    v18 = self;
    _os_log_impl(&dword_1B573F000, v5, OS_LOG_TYPE_DEFAULT, "%25s:%-5d %s: Engine %p was notified of server death", (uint8_t *)&v11, 0x26u);
  }

LABEL_8:
  +[CHHapticEngine clearResourceMap](CHHapticEngine, "clearResourceMap");
  v7 = self;
  objc_sync_enter(v7);
  if (kHAPIScope)
  {
    v8 = *(id *)kHAPIScope;
    if (!v8)
      goto LABEL_15;
  }
  else
  {
    v8 = MEMORY[0x1E0C81028];
    v9 = MEMORY[0x1E0C81028];
  }
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    v11 = 136315650;
    v12 = "CHHapticEngine.mm";
    v13 = 1024;
    v14 = 503;
    v15 = 2080;
    v16 = "-[CHHapticEngine handleMediaServerDeath:]";
    _os_log_impl(&dword_1B573F000, v8, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: Clearing public audio resources", (uint8_t *)&v11, 0x1Cu);
  }

LABEL_15:
  std::__tree<std::__value_type<unsigned long,std::pair<NSURL * {__strong},NSDictionary * {__strong}>>,std::__map_value_compare<unsigned long,std::__value_type<unsigned long,std::pair<NSURL * {__strong},NSDictionary * {__strong}>>,std::less<unsigned long>,true>,std::allocator<std::__value_type<unsigned long,std::pair<NSURL * {__strong},NSDictionary * {__strong}>>>>::destroy((uint64_t)&v7->_publicAudioResources, (_QWORD *)v7->_publicAudioResources.__tree_.__pair1_.__value_.__left_);
  v7->_publicAudioResources.__tree_.__begin_node_ = &v7->_publicAudioResources.__tree_.__pair1_;
  v7->_publicAudioResources.__tree_.__pair3_.__value_ = 0;
  v7->_publicAudioResources.__tree_.__pair1_.__value_.__left_ = 0;
  objc_sync_exit(v7);

  player = v7->_player;
  v7->_player = 0;

}

- (void)handleMediaServerRecovery:(id)a3
{
  _QWORD v4[5];
  id v5;
  id location;

  objc_initWeak(&location, self);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __44__CHHapticEngine_handleMediaServerRecovery___block_invoke;
  v4[3] = &unk_1E6960778;
  v4[4] = self;
  objc_copyWeak(&v5, &location);
  +[CHHapticEngine dispatchOnGlobal:](CHHapticEngine, "dispatchOnGlobal:", v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __44__CHHapticEngine_handleMediaServerRecovery___block_invoke(uint64_t a1)
{
  NSObject *v2;
  os_signpost_id_t v3;
  NSObject *v4;
  NSObject *v5;
  id v6;
  id v7;
  NSObject *v8;
  id WeakRetained;
  id v10;
  id v11;
  void *v12;
  void *v13;
  BOOL v14;
  void *v15;
  void *v16;
  char v17;
  NSObject *v18;
  NSObject *v19;
  id v20;
  id v21;
  void *v22;
  uint64_t v23;
  void *v24;
  int v25;
  NSObject *v26;
  NSObject *v27;
  void *v28;
  BOOL v29;
  NSObject *v30;
  id v31;
  void (**v32)(void);
  NSObject *v33;
  id v34;
  void *v35;
  NSObject *v36;
  NSObject *v37;
  id v38;
  uint8_t buf[4];
  const char *v40;
  __int16 v41;
  int v42;
  __int16 v43;
  const char *v44;
  __int16 v45;
  id v46;
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  CALog::Scope::oslog((id *)kHAPIScope);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = os_signpost_id_make_with_pointer(v2, *(const void **)(a1 + 32));

  CALog::Scope::oslog((id *)kHAPIScope);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1B573F000, v5, OS_SIGNPOST_INTERVAL_BEGIN, v3, "HapticEngine_handleMediaServerRecovery", " enableTelemetry=YES ", buf, 2u);
  }

  if (kHAPIScope)
  {
    v6 = *(id *)kHAPIScope;
    if (!v6)
      goto LABEL_11;
  }
  else
  {
    v6 = (id)MEMORY[0x1E0C81028];
    v7 = MEMORY[0x1E0C81028];
  }
  v8 = v6;
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    *(_DWORD *)buf = 136315906;
    v40 = "CHHapticEngine.mm";
    v41 = 1024;
    v42 = 515;
    v43 = 2080;
    v44 = "-[CHHapticEngine handleMediaServerRecovery:]_block_invoke";
    v45 = 2048;
    v46 = WeakRetained;
    _os_log_impl(&dword_1B573F000, v8, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: Attempting to reconnect engine %p to server", buf, 0x26u);

  }
LABEL_11:
  v10 = objc_loadWeakRetained((id *)(a1 + 40));
  v11 = v10;
  if (v10)
  {
    if (objc_msgSend(v10, "isAutoShutdownEnabled"))
      objc_msgSend(v11, "cancelIdleTimer");
    objc_msgSend(v11, "avAudioSession");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *((_DWORD *)v11 + 6) = objc_msgSend(v11, "getSessionIDFromAVAudioSession:", v12);

    if ((objc_msgSend(v11, "sessionIsShared") & 1) == 0)
    {
      objc_msgSend(v11, "usageCategory");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = v13 == 0;

      if (!v14)
      {
        objc_msgSend(v11, "usageCategory");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "avAudioSession");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v38 = 0;
        v17 = objc_msgSend(v11, "setupEngineWithCategory:session:needsAudioPowerBudget:error:", v15, v16, objc_msgSend(v11, "needsAudioPowerBudget"), &v38);
        v18 = v38;

        if ((v17 & 1) == 0)
          Haptic_RaiseException(CFSTR("CHHapticErrorCodeServerInitFailedException"), CFSTR("Failed to set up audio session"), -[NSObject code](v18, "code"));
LABEL_32:
        if (!*((_DWORD *)v11 + 6))
          Haptic_RaiseException(CFSTR("CHHapticErrorCodeServerInitFailedException"), CFSTR("Failed to set up audio session whose session ID is 0"), -4815);
        objc_msgSend(*(id *)(a1 + 32), "createOptionsFromAudioSessionID:shared:bypassAudioSession:", objc_msgSend(v11, "audioSessionID"), objc_msgSend(v11, "sessionIsShared"), 0);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "createHapticPlayerWithOptions:", v22);
        v23 = objc_claimAutoreleasedReturnValue();
        v24 = (void *)*((_QWORD *)v11 + 7);
        *((_QWORD *)v11 + 7) = v23;

        v37 = v18;
        v25 = objc_msgSend(v11, "finishInit:", &v37);
        v26 = v37;

        v27 = v26;
        if (!v25)
          goto LABEL_52;
        objc_msgSend(v11, "resetHandler");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = v28 == 0;

        if (v29)
        {
LABEL_44:
          if (kHAPIScope)
          {
            v33 = *(id *)kHAPIScope;
            if (!v33)
            {
LABEL_51:
              objc_msgSend(v11, "metrics");
              v35 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v35, "handleServerRecovery");

LABEL_52:
              CALog::Scope::oslog((id *)kHAPIScope);
              v36 = objc_claimAutoreleasedReturnValue();
              v19 = v36;
              if (v3 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v36))
              {
                *(_WORD *)buf = 0;
                _os_signpost_emit_with_name_impl(&dword_1B573F000, v19, OS_SIGNPOST_INTERVAL_END, v3, "HapticEngine_handleMediaServerRecovery", (const char *)&unk_1B57A456E, buf, 2u);
              }
              goto LABEL_55;
            }
          }
          else
          {
            v33 = MEMORY[0x1E0C81028];
            v34 = MEMORY[0x1E0C81028];
          }
          if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 136315906;
            v40 = "CHHapticEngine.mm";
            v41 = 1024;
            v42 = 549;
            v43 = 2080;
            v44 = "-[CHHapticEngine handleMediaServerRecovery:]_block_invoke";
            v45 = 2048;
            v46 = v11;
            _os_log_impl(&dword_1B573F000, v33, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: Done with reconnect for engine %p", buf, 0x26u);
          }

          goto LABEL_51;
        }
        if (kHAPIScope)
        {
          v30 = *(id *)kHAPIScope;
          if (!v30)
          {
LABEL_43:
            objc_msgSend(v11, "resetHandler");
            v32 = (void (**)(void))objc_claimAutoreleasedReturnValue();
            v32[2]();

            goto LABEL_44;
          }
        }
        else
        {
          v30 = MEMORY[0x1E0C81028];
          v31 = MEMORY[0x1E0C81028];
        }
        if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315650;
          v40 = "CHHapticEngine.mm";
          v41 = 1024;
          v42 = 546;
          v43 = 2080;
          v44 = "-[CHHapticEngine handleMediaServerRecovery:]_block_invoke";
          _os_log_impl(&dword_1B573F000, v30, OS_LOG_TYPE_DEFAULT, "%25s:%-5d %s: Calling engine-reset handler on default queue", buf, 0x1Cu);
        }

        goto LABEL_43;
      }
      if (kHAPIScope)
      {
        v18 = *(id *)kHAPIScope;
        if (!v18)
          goto LABEL_32;
      }
      else
      {
        v18 = MEMORY[0x1E0C81028];
        v21 = MEMORY[0x1E0C81028];
      }
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315650;
        v40 = "CHHapticEngine.mm";
        v41 = 1024;
        v42 = 535;
        v43 = 2080;
        v44 = "-[CHHapticEngine handleMediaServerRecovery:]_block_invoke";
        _os_log_impl(&dword_1B573F000, v18, OS_LOG_TYPE_DEFAULT, "%25s:%-5d %s: Engine had external passed-in auxiliary session. Caller should reconfigure session", buf, 0x1Cu);
      }

    }
    v18 = 0;
    goto LABEL_32;
  }
  if (kHAPIScope)
  {
    v19 = *(id *)kHAPIScope;
    if (!v19)
      goto LABEL_56;
  }
  else
  {
    v19 = MEMORY[0x1E0C81028];
    v20 = MEMORY[0x1E0C81028];
  }
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315650;
    v40 = "CHHapticEngine.mm";
    v41 = 1024;
    v42 = 518;
    v43 = 2080;
    v44 = "-[CHHapticEngine handleMediaServerRecovery:]_block_invoke";
    _os_log_impl(&dword_1B573F000, v19, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: Engine already destroyed - noop", buf, 0x1Cu);
  }
LABEL_55:

LABEL_56:
}

- (void)disconnectAudioSession:(id)a3
{
  AVFASoftLink *v4;
  void *v5;
  AVFASoftLink *v6;
  void *v7;
  id v8;

  v8 = a3;
  if (v8)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v4 = (AVFASoftLink *)objc_claimAutoreleasedReturnValue();
    AVFASoftLink::getAVAudioSessionMediaServicesWereResetNotification(v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVFASoftLink removeObserver:name:object:](v4, "removeObserver:name:object:", self, v5, v8);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v6 = (AVFASoftLink *)objc_claimAutoreleasedReturnValue();
    AVFASoftLink::getAVAudioSessionMediaServicesWereLostNotification(v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVFASoftLink removeObserver:name:object:](v6, "removeObserver:name:object:", self, v7, v8);

  }
}

- (int64_t)getReporterIDFromAVAudioSession:(id)a3
{
  AVFASoftLink *v3;
  int64_t v4;

  v3 = (AVFASoftLink *)a3;
  AVFASoftLink::getAVAudioSession(v3);
  v4 = -[AVFASoftLink reporterID](v3, "reporterID");

  return v4;
}

- (void)handleConnectionError
{
  AVHapticPlayer *player;

  player = self->_player;
  self->_player = 0;

  -[CHHapticEngine setRunning:](self, "setRunning:", 0);
}

void __29__CHHapticEngine_finishInit___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  id v5;
  NSObject *v6;
  void *v7;
  id *v8;
  id WeakRetained;
  id v10;
  void *v11;
  NSObject *v12;
  id v13;
  int v14;
  const char *v15;
  __int16 v16;
  int v17;
  __int16 v18;
  const char *v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (kHAPIScope)
  {
    v4 = *(id *)kHAPIScope;
    if (!v4)
      goto LABEL_8;
  }
  else
  {
    v4 = (id)MEMORY[0x1E0C81028];
    v5 = MEMORY[0x1E0C81028];
  }
  v6 = v4;
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    objc_msgSend(v3, "localizedDescription");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 136315906;
    v15 = "CHHapticEngine.mm";
    v16 = 1024;
    v17 = 646;
    v18 = 2080;
    v19 = "-[CHHapticEngine finishInit:]_block_invoke";
    v20 = 2112;
    v21 = v7;
    _os_log_impl(&dword_1B573F000, v6, OS_LOG_TYPE_ERROR, "%25s:%-5d %s: ERROR: Server connection broke with error '%@'", (uint8_t *)&v14, 0x26u);

  }
LABEL_8:
  v8 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained(v8);
  objc_msgSend(WeakRetained, "handleConnectionError");

  v10 = objc_loadWeakRetained(v8);
  objc_msgSend(v10, "serverConfig");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v8) = objc_msgSend(v11, "usingInternalHaptics");

  if ((_DWORD)v8)
  {
    if (kHAPIScope)
    {
      v12 = *(id *)kHAPIScope;
      if (!v12)
        goto LABEL_16;
    }
    else
    {
      v12 = MEMORY[0x1E0C81028];
      v13 = MEMORY[0x1E0C81028];
    }
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v14 = 136315650;
      v15 = "CHHapticEngine.mm";
      v16 = 1024;
      v17 = 649;
      v18 = 2080;
      v19 = "-[CHHapticEngine finishInit:]_block_invoke";
      _os_log_impl(&dword_1B573F000, v12, OS_LOG_TYPE_DEFAULT, "%25s:%-5d %s: Waiting to reconnect", (uint8_t *)&v14, 0x1Cu);
    }

  }
LABEL_16:

}

void __29__CHHapticEngine_finishInit___block_invoke_127(uint64_t a1, void *a2)
{
  id v4;
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  NSObject *v9;
  id v10;
  int v11;
  const char *v12;
  __int16 v13;
  int v14;
  __int16 v15;
  const char *v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  if (v4)
  {
    if (kHAPIScope)
    {
      v5 = *(id *)kHAPIScope;
      if (!v5)
      {
LABEL_9:
        objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
        goto LABEL_10;
      }
    }
    else
    {
      v5 = (id)MEMORY[0x1E0C81028];
      v6 = MEMORY[0x1E0C81028];
    }
    v7 = v5;
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v4, "localizedDescription");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 136315906;
      v12 = "CHHapticEngine.mm";
      v13 = 1024;
      v14 = 657;
      v15 = 2080;
      v16 = "-[CHHapticEngine finishInit:]_block_invoke";
      v17 = 2112;
      v18 = v8;
      _os_log_impl(&dword_1B573F000, v7, OS_LOG_TYPE_ERROR, "%25s:%-5d %s: ERROR: Resource allocation failure: %@", (uint8_t *)&v11, 0x26u);

    }
    goto LABEL_9;
  }
LABEL_10:
  if (kHAPIScope)
  {
    v9 = *(id *)kHAPIScope;
    if (!v9)
      goto LABEL_17;
  }
  else
  {
    v9 = MEMORY[0x1E0C81028];
    v10 = MEMORY[0x1E0C81028];
  }
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    v11 = 136315650;
    v12 = "CHHapticEngine.mm";
    v13 = 1024;
    v14 = 660;
    v15 = 2080;
    v16 = "-[CHHapticEngine finishInit:]_block_invoke";
    _os_log_impl(&dword_1B573F000, v9, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: Releasing lock", (uint8_t *)&v11, 0x1Cu);
  }

LABEL_17:
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));

}

void __29__CHHapticEngine_finishInit___block_invoke_128(uint64_t a1, void *a2)
{
  NSObject *v4;
  id v5;
  id *v6;
  id WeakRetained;
  _QWORD v8[4];
  id v9[2];
  uint8_t buf[4];
  const char *v11;
  __int16 v12;
  int v13;
  __int16 v14;
  const char *v15;
  __int16 v16;
  int v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  if (kHAPIScope)
  {
    v4 = *(id *)kHAPIScope;
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
    *(_DWORD *)buf = 136315906;
    v11 = "CHHapticEngine.mm";
    v12 = 1024;
    v13 = 688;
    v14 = 2080;
    v15 = "-[CHHapticEngine finishInit:]_block_invoke";
    v16 = 1024;
    v17 = (int)a2;
    _os_log_impl(&dword_1B573F000, v4, OS_LOG_TYPE_INFO, "%25s:%-5d %s: In player's stopRunningHandler block.  Stopped reason: %d", buf, 0x22u);
  }

LABEL_8:
  v6 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __29__CHHapticEngine_finishInit___block_invoke_129;
  v8[3] = &unk_1E6960128;
  objc_copyWeak(v9, v6);
  v9[1] = a2;
  objc_msgSend(WeakRetained, "dispatchOnLocal:", v8);

  objc_destroyWeak(v9);
}

void __29__CHHapticEngine_finishInit___block_invoke_129(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  int v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  unint64_t v9;
  uint64_t v10;
  NSObject *v11;
  id v12;
  void (**v13)(_QWORD, _QWORD);
  int v14;
  const char *v15;
  __int16 v16;
  int v17;
  __int16 v18;
  const char *v19;
  __int16 v20;
  int v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v2 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v4 = objc_msgSend(WeakRetained, "isAutoShutdownEnabled");

  if (v4)
  {
    v5 = objc_loadWeakRetained(v2);
    objc_msgSend(v5, "cancelIdleTimer");

  }
  v6 = objc_loadWeakRetained(v2);
  v7 = v6;
  if (v6)
  {
    objc_msgSend(v6, "setRunning:", 0);
    objc_msgSend(v7, "stoppedHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      v9 = *(_QWORD *)(a1 + 40) + 2;
      if (v9 >= 6)
        v10 = 0;
      else
        v10 = qword_1B57944E0[v9];
      if (kHAPIScope)
      {
        v11 = *(id *)kHAPIScope;
        if (!v11)
        {
LABEL_15:
          objc_msgSend(v7, "stoppedHandler");
          v13 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
          v13[2](v13, v10);

          goto LABEL_16;
        }
      }
      else
      {
        v11 = MEMORY[0x1E0C81028];
        v12 = MEMORY[0x1E0C81028];
      }
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        v14 = 136315906;
        v15 = "CHHapticEngine.mm";
        v16 = 1024;
        v17 = 713;
        v18 = 2080;
        v19 = "-[CHHapticEngine finishInit:]_block_invoke";
        v20 = 1024;
        v21 = v10;
        _os_log_impl(&dword_1B573F000, v11, OS_LOG_TYPE_DEFAULT, "%25s:%-5d %s: Calling engine-stopped handler with reason %d", (uint8_t *)&v14, 0x22u);
      }

      goto LABEL_15;
    }
  }
LABEL_16:

}

- (void)startIdleTimerWithHandler:(id)a3
{
  id v4;
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  double v9;
  double v10;
  NSObject *dispatchQueue;
  id v12;
  NSObject *v13;
  float v14;
  dispatch_time_t v15;
  OS_dispatch_source *timer;
  _QWORD handler[4];
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
  if (kHPWRScope)
  {
    v5 = *(id *)kHPWRScope;
    if (!v5)
      goto LABEL_8;
  }
  else
  {
    v5 = (id)MEMORY[0x1E0C81028];
    v6 = MEMORY[0x1E0C81028];
  }
  v7 = v5;
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    -[CHHapticEngine autoShutdownTimeout](self, "autoShutdownTimeout");
    *(_DWORD *)buf = 136315906;
    v20 = "CHHapticEngine.mm";
    v21 = 1024;
    v22 = 742;
    v23 = 2080;
    v24 = "-[CHHapticEngine startIdleTimerWithHandler:]";
    v25 = 2048;
    v26 = v8;
    _os_log_impl(&dword_1B573F000, v7, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: Creating idle timer for %.3f seconds", buf, 0x26u);
  }

LABEL_8:
  -[CHHapticEngine autoShutdownTimeout](self, "autoShutdownTimeout");
  v10 = v9;
  dispatchQueue = self->_dispatchQueue;
  handler[0] = MEMORY[0x1E0C809B0];
  handler[1] = 3221225472;
  handler[2] = __44__CHHapticEngine_startIdleTimerWithHandler___block_invoke;
  handler[3] = &unk_1E6960150;
  v18 = v4;
  v12 = v4;
  v13 = dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, dispatchQueue);
  if (v13)
  {
    v14 = v10;
    v15 = dispatch_time(0, (uint64_t)(float)(v14 * 1000000000.0));
    dispatch_source_set_timer(v13, v15, 0xFFFFFFFFFFFFFFFFLL, 0x5F5E100uLL);
    dispatch_source_set_event_handler(v13, handler);
    dispatch_resume(v13);
  }
  timer = self->_timer;
  self->_timer = (OS_dispatch_source *)v13;

}

uint64_t __44__CHHapticEngine_startIdleTimerWithHandler___block_invoke(uint64_t a1)
{
  NSObject *v2;
  id v3;
  int v5;
  const char *v6;
  __int16 v7;
  int v8;
  __int16 v9;
  const char *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  if (kHPWRScope)
  {
    v2 = *(id *)kHPWRScope;
    if (!v2)
      return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
  else
  {
    v2 = MEMORY[0x1E0C81028];
    v3 = MEMORY[0x1E0C81028];
  }
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 136315650;
    v6 = "CHHapticEngine.mm";
    v7 = 1024;
    v8 = 744;
    v9 = 2080;
    v10 = "-[CHHapticEngine startIdleTimerWithHandler:]_block_invoke";
    _os_log_impl(&dword_1B573F000, v2, OS_LOG_TYPE_DEFAULT, "%25s:%-5d %s: Calling idle timeout handler on internal queue", (uint8_t *)&v5, 0x1Cu);
  }

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)beginIdleTimer
{
  _QWORD v3[4];
  id v4;
  id location;

  objc_initWeak(&location, self);
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __32__CHHapticEngine_beginIdleTimer__block_invoke;
  v3[3] = &unk_1E6960430;
  objc_copyWeak(&v4, &location);
  -[CHHapticEngine dispatchOnLocal:](self, "dispatchOnLocal:", v3);
  objc_destroyWeak(&v4);
  objc_destroyWeak(&location);
}

void __32__CHHapticEngine_beginIdleTimer__block_invoke(uint64_t a1)
{
  NSObject *v2;
  id v3;
  id WeakRetained;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;
  uint8_t buf[4];
  const char *v10;
  __int16 v11;
  int v12;
  __int16 v13;
  const char *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (kHPWRScope)
  {
    v2 = *(id *)kHPWRScope;
    if (!v2)
      goto LABEL_8;
  }
  else
  {
    v2 = MEMORY[0x1E0C81028];
    v3 = MEMORY[0x1E0C81028];
  }
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315650;
    v10 = "CHHapticEngine.mm";
    v11 = 1024;
    v12 = 753;
    v13 = 2080;
    v14 = "-[CHHapticEngine beginIdleTimer]_block_invoke";
    _os_log_impl(&dword_1B573F000, v2, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: Starting idle timer (on async dispatch)", buf, 0x1Cu);
  }

LABEL_8:
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_initWeak((id *)buf, WeakRetained);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __32__CHHapticEngine_beginIdleTimer__block_invoke_131;
  v6[3] = &unk_1E69607F0;
  objc_copyWeak(&v8, (id *)buf);
  v7 = WeakRetained;
  v5 = WeakRetained;
  objc_msgSend(v5, "startIdleTimerWithHandler:", v6);

  objc_destroyWeak(&v8);
  objc_destroyWeak((id *)buf);
}

void __32__CHHapticEngine_beginIdleTimer__block_invoke_131(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id v5;
  id WeakRetained;
  _QWORD v7[4];
  id v8;
  id v9;
  uint8_t buf[4];
  const char *v11;
  __int16 v12;
  int v13;
  __int16 v14;
  const char *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (kHPWRScope)
  {
    v4 = *(id *)kHPWRScope;
    if (!v4)
      goto LABEL_8;
  }
  else
  {
    v4 = MEMORY[0x1E0C81028];
    v5 = MEMORY[0x1E0C81028];
  }
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    v11 = "CHHapticEngine.mm";
    v12 = 1024;
    v13 = 757;
    v14 = 2080;
    v15 = "-[CHHapticEngine beginIdleTimer]_block_invoke";
    _os_log_impl(&dword_1B573F000, v4, OS_LOG_TYPE_DEFAULT, "%25s:%-5d %s: Stopping engine in response to timeout", buf, 0x1Cu);
  }

LABEL_8:
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __32__CHHapticEngine_beginIdleTimer__block_invoke_132;
  v7[3] = &unk_1E69607F0;
  objc_copyWeak(&v9, (id *)(a1 + 40));
  v8 = *(id *)(a1 + 32);
  objc_msgSend(WeakRetained, "stopWithCompletionHandler:", v7);

  objc_destroyWeak(&v9);
}

void __32__CHHapticEngine_beginIdleTimer__block_invoke_132(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  id v4;
  _QWORD v5[4];
  id v6;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    objc_msgSend(*(id *)(a1 + 32), "stoppedHandler");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __32__CHHapticEngine_beginIdleTimer__block_invoke_2;
    v5[3] = &unk_1E6960150;
    v6 = v3;
    v4 = v3;
    objc_msgSend(WeakRetained, "dispatchOnLocal:", v5);

  }
}

uint64_t __32__CHHapticEngine_beginIdleTimer__block_invoke_2(uint64_t result)
{
  uint64_t v1;
  NSObject *v2;
  id v3;
  int v4;
  const char *v5;
  __int16 v6;
  int v7;
  __int16 v8;
  const char *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  if (*(_QWORD *)(result + 32))
  {
    v1 = result;
    if (kHPWRScope)
    {
      v2 = *(id *)kHPWRScope;
      if (!v2)
        return (*(uint64_t (**)(void))(*(_QWORD *)(v1 + 32) + 16))();
    }
    else
    {
      v2 = MEMORY[0x1E0C81028];
      v3 = MEMORY[0x1E0C81028];
    }
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      v4 = 136315650;
      v5 = "CHHapticEngine.mm";
      v6 = 1024;
      v7 = 765;
      v8 = 2080;
      v9 = "-[CHHapticEngine beginIdleTimer]_block_invoke_2";
      _os_log_impl(&dword_1B573F000, v2, OS_LOG_TYPE_DEFAULT, "%25s:%-5d %s: Calling client's engine-stopped handler on internal queue", (uint8_t *)&v4, 0x1Cu);
    }

    return (*(uint64_t (**)(void))(*(_QWORD *)(v1 + 32) + 16))();
  }
  return result;
}

- (void)cancelIdleTimer
{
  void *v3;
  NSObject *v4;
  id v5;
  NSObject *v6;
  int v7;
  const char *v8;
  __int16 v9;
  int v10;
  __int16 v11;
  const char *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  -[CHHapticEngine timer](self, "timer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    if (kHPWRScope)
    {
      v4 = *(id *)kHPWRScope;
      if (!v4)
      {
LABEL_9:
        -[CHHapticEngine timer](self, "timer");
        v6 = objc_claimAutoreleasedReturnValue();
        dispatch_source_cancel(v6);

        -[CHHapticEngine setTimer:](self, "setTimer:", 0);
        return;
      }
    }
    else
    {
      v4 = MEMORY[0x1E0C81028];
      v5 = MEMORY[0x1E0C81028];
    }
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      v7 = 136315650;
      v8 = "CHHapticEngine.mm";
      v9 = 1024;
      v10 = 778;
      v11 = 2080;
      v12 = "-[CHHapticEngine cancelIdleTimer]";
      _os_log_impl(&dword_1B573F000, v4, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: Cancelling idle timer", (uint8_t *)&v7, 0x1Cu);
    }

    goto LABEL_9;
  }
}

void __31__CHHapticEngine_handleFinish___block_invoke_133(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id v5;
  id WeakRetained;
  id *v7;
  _QWORD v8[4];
  id v9;
  _QWORD v10[4];
  id v11;
  uint8_t buf[4];
  const char *v13;
  __int16 v14;
  int v15;
  __int16 v16;
  const char *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (kHAPIScope)
  {
    v4 = *(id *)kHAPIScope;
    if (!v4)
      goto LABEL_8;
  }
  else
  {
    v4 = MEMORY[0x1E0C81028];
    v5 = MEMORY[0x1E0C81028];
  }
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315650;
    v13 = "CHHapticEngine.mm";
    v14 = 1024;
    v15 = 809;
    v16 = 2080;
    v17 = "-[CHHapticEngine handleFinish:]_block_invoke";
    _os_log_impl(&dword_1B573F000, v4, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: <Top of doStopWithCompletionHandler block>", buf, 0x1Cu);
  }

LABEL_8:
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __31__CHHapticEngine_handleFinish___block_invoke_134;
    v10[3] = &unk_1E6960150;
    v7 = &v11;
    v11 = *(id *)(a1 + 32);
    objc_msgSend(WeakRetained, "dispatchOnLocal:", v10);
  }
  else
  {
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __31__CHHapticEngine_handleFinish___block_invoke_135;
    v8[3] = &unk_1E6960150;
    v7 = &v9;
    v9 = *(id *)(a1 + 32);
    +[CHHapticEngine dispatchOnGlobal:](CHHapticEngine, "dispatchOnGlobal:", v8);
  }

}

void __31__CHHapticEngine_handleFinish___block_invoke_134(uint64_t a1)
{
  NSObject *v2;
  id v3;
  NSObject *v4;
  id v5;
  int v6;
  const char *v7;
  __int16 v8;
  int v9;
  __int16 v10;
  const char *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  if (*(_QWORD *)(a1 + 32))
  {
    if (kHAPIScope)
    {
      v2 = *(id *)kHAPIScope;
      if (!v2)
      {
LABEL_9:
        (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
        goto LABEL_10;
      }
    }
    else
    {
      v2 = MEMORY[0x1E0C81028];
      v3 = MEMORY[0x1E0C81028];
    }
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      v6 = 136315650;
      v7 = "CHHapticEngine.mm";
      v8 = 1024;
      v9 = 814;
      v10 = 2080;
      v11 = "-[CHHapticEngine handleFinish:]_block_invoke";
      _os_log_impl(&dword_1B573F000, v2, OS_LOG_TYPE_DEFAULT, "%25s:%-5d %s: Calling engine-stopped handler on internal queue", (uint8_t *)&v6, 0x1Cu);
    }

    goto LABEL_9;
  }
LABEL_10:
  if (kHAPIScope)
  {
    v4 = *(id *)kHAPIScope;
    if (!v4)
      return;
  }
  else
  {
    v4 = MEMORY[0x1E0C81028];
    v5 = MEMORY[0x1E0C81028];
  }
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    v6 = 136315650;
    v7 = "CHHapticEngine.mm";
    v8 = 1024;
    v9 = 817;
    v10 = 2080;
    v11 = "-[CHHapticEngine handleFinish:]_block_invoke";
    _os_log_impl(&dword_1B573F000, v4, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: Engine stop completed", (uint8_t *)&v6, 0x1Cu);
  }

}

uint64_t __31__CHHapticEngine_handleFinish___block_invoke_135(uint64_t a1)
{
  id v2;
  id v3;
  NSObject *v4;
  void *v5;
  int v7;
  const char *v8;
  __int16 v9;
  int v10;
  __int16 v11;
  const char *v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (kHAPIScope)
  {
    v2 = *(id *)kHAPIScope;
    if (!v2)
      return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
  else
  {
    v2 = (id)MEMORY[0x1E0C81028];
    v3 = MEMORY[0x1E0C81028];
  }
  v4 = v2;
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = (void *)MEMORY[0x1B5E4F2B4](*(_QWORD *)(a1 + 32));
    v7 = 136315906;
    v8 = "CHHapticEngine.mm";
    v9 = 1024;
    v10 = 824;
    v11 = 2080;
    v12 = "-[CHHapticEngine handleFinish:]_block_invoke";
    v13 = 2048;
    v14 = v5;
    _os_log_impl(&dword_1B573F000, v4, OS_LOG_TYPE_DEFAULT, "%25s:%-5d %s: Client-supplied stopped handler called on destroyed player - calling captured block %p on global queue", (uint8_t *)&v7, 0x26u);

  }
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __31__CHHapticEngine_handleFinish___block_invoke_136(uint64_t a1)
{
  id v2;
  id v3;
  NSObject *v4;
  void *v5;
  int v7;
  const char *v8;
  __int16 v9;
  int v10;
  __int16 v11;
  const char *v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (kHAPIScope)
  {
    v2 = *(id *)kHAPIScope;
    if (!v2)
      return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
  else
  {
    v2 = (id)MEMORY[0x1E0C81028];
    v3 = MEMORY[0x1E0C81028];
  }
  v4 = v2;
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = (void *)MEMORY[0x1B5E4F2B4](*(_QWORD *)(a1 + 32));
    v7 = 136315906;
    v8 = "CHHapticEngine.mm";
    v9 = 1024;
    v10 = 833;
    v11 = 2080;
    v12 = "-[CHHapticEngine handleFinish:]_block_invoke";
    v13 = 2048;
    v14 = v5;
    _os_log_impl(&dword_1B573F000, v4, OS_LOG_TYPE_DEFAULT, "%25s:%-5d %s: Client-supplied stopped handler called on destroyed player - calling captured block %p on global queue", (uint8_t *)&v7, 0x26u);

  }
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)stopAndWait
{
  CHHapticEngine *v2;
  NSObject *v3;
  NSObject *v4;
  id v5;
  AVHapticPlayer *player;
  void *v7;
  id v8;
  id v9;
  AVHapticPlayer *v10;
  _QWORD v11[4];
  id v12;
  id v13;
  uint8_t buf[4];
  const char *v15;
  __int16 v16;
  int v17;
  __int16 v18;
  const char *v19;
  __int16 v20;
  AVHapticPlayer *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v2 = self;
  objc_sync_enter(v2);
  if (-[CHHapticEngine running](v2, "running"))
  {
    if (kHAPIScope)
    {
      v3 = *(id *)kHAPIScope;
      if (!v3)
      {
LABEL_12:
        -[CHHapticEngine stoppedHandler](v2, "stoppedHandler");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = 0;
        -[CHHapticEngine doStopEngineAndWait:](v2, "doStopEngineAndWait:", &v13);
        v4 = v13;
        v11[0] = MEMORY[0x1E0C809B0];
        v11[1] = 3221225472;
        v11[2] = __29__CHHapticEngine_stopAndWait__block_invoke;
        v11[3] = &unk_1E6960150;
        v8 = v7;
        v12 = v8;
        -[CHHapticEngine dispatchOnLocal:](v2, "dispatchOnLocal:", v11);

        goto LABEL_16;
      }
    }
    else
    {
      v3 = MEMORY[0x1E0C81028];
      v5 = MEMORY[0x1E0C81028];
    }
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      player = v2->_player;
      *(_DWORD *)buf = 136315906;
      v15 = "CHHapticEngine.mm";
      v16 = 1024;
      v17 = 865;
      v18 = 2080;
      v19 = "-[CHHapticEngine stopAndWait]";
      v20 = 2048;
      v21 = player;
      _os_log_impl(&dword_1B573F000, v3, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: Synchronously stopping the underlying player %p", buf, 0x26u);
    }

    goto LABEL_12;
  }
  if (kHAPIScope)
  {
    v4 = *(id *)kHAPIScope;
    if (!v4)
      goto LABEL_17;
  }
  else
  {
    v4 = MEMORY[0x1E0C81028];
    v9 = MEMORY[0x1E0C81028];
  }
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    v10 = v2->_player;
    *(_DWORD *)buf = 136315906;
    v15 = "CHHapticEngine.mm";
    v16 = 1024;
    v17 = 877;
    v18 = 2080;
    v19 = "-[CHHapticEngine stopAndWait]";
    v20 = 2048;
    v21 = v10;
    _os_log_impl(&dword_1B573F000, v4, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: Underlying player %p not running", buf, 0x26u);
  }
LABEL_16:

LABEL_17:
  objc_sync_exit(v2);

}

uint64_t __29__CHHapticEngine_stopAndWait__block_invoke(uint64_t result)
{
  uint64_t v1;
  NSObject *v2;
  id v3;
  int v4;
  const char *v5;
  __int16 v6;
  int v7;
  __int16 v8;
  const char *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  if (*(_QWORD *)(result + 32))
  {
    v1 = result;
    if (kHAPIScope)
    {
      v2 = *(id *)kHAPIScope;
      if (!v2)
        return (*(uint64_t (**)(void))(*(_QWORD *)(v1 + 32) + 16))();
    }
    else
    {
      v2 = MEMORY[0x1E0C81028];
      v3 = MEMORY[0x1E0C81028];
    }
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    {
      v4 = 136315650;
      v5 = "CHHapticEngine.mm";
      v6 = 1024;
      v7 = 871;
      v8 = 2080;
      v9 = "-[CHHapticEngine stopAndWait]_block_invoke";
      _os_log_impl(&dword_1B573F000, v2, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: Calling stop completion handler on internal queue", (uint8_t *)&v4, 0x1Cu);
    }

    return (*(uint64_t (**)(void))(*(_QWORD *)(v1 + 32) + 16))();
  }
  return result;
}

- (void)dealloc
{
  NSObject *v3;
  id v4;
  void *v5;
  AVHapticPlayer *player;
  AVAudioSession *avAudioSession;
  id stoppedHandler;
  CHMetrics *metrics;
  NSObject *v10;
  id v11;
  objc_super v12;
  uint8_t buf[4];
  const char *v14;
  __int16 v15;
  int v16;
  __int16 v17;
  const char *v18;
  __int16 v19;
  CHHapticEngine *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  if (kHAPIScope)
  {
    v3 = *(id *)kHAPIScope;
    if (!v3)
      goto LABEL_8;
  }
  else
  {
    v3 = MEMORY[0x1E0C81028];
    v4 = MEMORY[0x1E0C81028];
  }
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315906;
    v14 = "CHHapticEngine.mm";
    v15 = 1024;
    v16 = 884;
    v17 = 2080;
    v18 = "-[CHHapticEngine dealloc]";
    v19 = 2048;
    v20 = self;
    _os_log_impl(&dword_1B573F000, v3, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: synchronously stopping and destroying engine %p", buf, 0x26u);
  }

LABEL_8:
  -[CHHapticEngine stopAndWait](self, "stopAndWait");
  -[CHHapticEngine avAudioSession](self, "avAudioSession");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CHHapticEngine disconnectAudioSession:](self, "disconnectAudioSession:", v5);

  -[CHHapticEngine doUnregisterAllPublicAudioResources](self, "doUnregisterAllPublicAudioResources");
  player = self->_player;
  self->_player = 0;

  avAudioSession = self->_avAudioSession;
  self->_avAudioSession = 0;

  stoppedHandler = self->_stoppedHandler;
  self->_stoppedHandler = 0;

  metrics = self->_metrics;
  self->_metrics = 0;

  if (kHAPIScope)
  {
    v10 = *(id *)kHAPIScope;
    if (!v10)
      goto LABEL_15;
  }
  else
  {
    v10 = MEMORY[0x1E0C81028];
    v11 = MEMORY[0x1E0C81028];
  }
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315906;
    v14 = "CHHapticEngine.mm";
    v15 = 1024;
    v16 = 892;
    v17 = 2080;
    v18 = "-[CHHapticEngine dealloc]";
    v19 = 2048;
    v20 = self;
    _os_log_impl(&dword_1B573F000, v10, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: done destroying engine %p", buf, 0x26u);
  }

LABEL_15:
  v12.receiver = self;
  v12.super_class = (Class)CHHapticEngine;
  -[CHHapticEngine dealloc](&v12, sel_dealloc);
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

- (BOOL)doInit:(unsigned int)a3 sessionIsShared:(BOOL)a4 options:(id)a5 bypassAudioSession:(BOOL)a6 error:(id *)a7
{
  _BOOL8 v8;
  _BOOL8 v9;
  uint64_t v10;
  id v12;
  NSObject *v13;
  id v14;
  NSObject *v15;
  NSObject *v16;
  OS_dispatch_queue *v17;
  OS_dispatch_queue *dispatchQueue;
  void *v19;
  AVHapticPlayer *v20;
  AVHapticPlayer *player;
  HapticServerConfig *v22;
  HapticServerConfig *serverConfig;
  void *v24;
  char v25;
  void *v26;
  char v27;
  unint64_t v28;
  id v29;
  BOOL v30;
  int v32;
  const char *v33;
  __int16 v34;
  int v35;
  __int16 v36;
  const char *v37;
  __int16 v38;
  int v39;
  __int16 v40;
  _BOOL4 v41;
  __int16 v42;
  id v43;
  uint64_t v44;

  v8 = a6;
  v9 = a4;
  v10 = *(_QWORD *)&a3;
  v44 = *MEMORY[0x1E0C80C00];
  v12 = a5;
  if (kHAPIScope)
  {
    v13 = *(id *)kHAPIScope;
    if (!v13)
      goto LABEL_8;
  }
  else
  {
    v13 = MEMORY[0x1E0C81028];
    v14 = MEMORY[0x1E0C81028];
  }
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    v32 = 136316418;
    v33 = "CHHapticEngine.mm";
    v34 = 1024;
    v35 = 935;
    v36 = 2080;
    v37 = "-[CHHapticEngine doInit:sessionIsShared:options:bypassAudioSession:error:]";
    v38 = 1024;
    v39 = v10;
    v40 = 1024;
    v41 = v9;
    v42 = 2112;
    v43 = v12;
    _os_log_impl(&dword_1B573F000, v13, OS_LOG_TYPE_INFO, "%25s:%-5d %s: sessionID: %u, isShared: %u options: '%@'", (uint8_t *)&v32, 0x32u);
  }

LABEL_8:
  if ((_DWORD)v10 || v8)
  {
    dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INTERACTIVE, 0);
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = (OS_dispatch_queue *)dispatch_queue_create("CHHapticEngineDispatchQueue", v16);
    dispatchQueue = self->_dispatchQueue;
    self->_dispatchQueue = v17;

    self->_audioSessionID = v10;
    self->_sessionIsShared = v9;
    -[CHHapticEngine createOptionsFromAudioSessionID:shared:bypassAudioSession:](self, "createOptionsFromAudioSessionID:shared:bypassAudioSession:", v10, v9, v8);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[CHHapticEngine createHapticPlayerWithOptions:](self, "createHapticPlayerWithOptions:", v19);
    v20 = (AVHapticPlayer *)objc_claimAutoreleasedReturnValue();
    player = self->_player;
    self->_player = v20;

    self->_runTimeout = 120.0;
    if (!v12)
    {
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionary");
      v12 = (id)objc_claimAutoreleasedReturnValue();
    }
    v22 = -[HapticServerConfig initWithHapticPlayer:withOptions:error:]([HapticServerConfig alloc], "initWithHapticPlayer:withOptions:error:", self->_player, v12, a7);
    serverConfig = self->_serverConfig;
    self->_serverConfig = v22;

    if (!self->_serverConfig)
    {
      v30 = 0;
LABEL_29:

      goto LABEL_31;
    }
    self->_currentPlayerBehavior = 2;
    -[CHHapticEngine serverConfig](self, "serverConfig");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(v24, "supportsHapticPlayback");

    if ((v25 & 1) != 0)
    {
      -[CHHapticEngine serverConfig](self, "serverConfig");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = objc_msgSend(v26, "supportsAudioPlayback");

      if ((v27 & 1) != 0)
      {
LABEL_28:
        v30 = -[CHHapticEngine finishInit:](self, "finishInit:", a7);
        goto LABEL_29;
      }
      v28 = 1;
    }
    else
    {
      v28 = self->_currentPlayerBehavior | 0x10;
    }
    self->_currentPlayerBehavior = v28;
    goto LABEL_28;
  }
  if (!kHAPIScope)
  {
    v15 = MEMORY[0x1E0C81028];
    v29 = MEMORY[0x1E0C81028];
    goto LABEL_20;
  }
  v15 = *(id *)kHAPIScope;
  if (v15)
  {
LABEL_20:
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      v32 = 136315906;
      v33 = "CHHapticEngine.mm";
      v34 = 1024;
      v35 = 938;
      v36 = 2080;
      v37 = "-[CHHapticEngine doInit:sessionIsShared:options:bypassAudioSession:error:]";
      v38 = 1024;
      v39 = 0;
      _os_log_impl(&dword_1B573F000, v15, OS_LOG_TYPE_ERROR, "%25s:%-5d %s: ERROR: Invalid audio session ID: %u", (uint8_t *)&v32, 0x22u);
    }

  }
  if (a7)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.CoreHaptics"), -4815, 0);
    v30 = 0;
    *a7 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v30 = 0;
  }
LABEL_31:

  return v30;
}

- (CHHapticEngine)init
{

  return 0;
}

- (CHHapticEngine)initWithAudioSession:(AVAudioSession *)audioSession error:(NSError *)error
{
  AVAudioSession *v7;
  NSObject *v8;
  os_signpost_id_t v9;
  NSObject *v10;
  NSObject *v11;
  unint64_t v12;
  void *v13;
  CHHapticEngine *v14;
  NSObject *v15;
  CHHapticEngine *v16;
  NSObject *v17;
  NSObject *v18;
  CHHapticEngine *v19;
  AVFASoftLink *v20;
  NSObject *v21;
  id v22;
  id v23;
  uint64_t v24;
  AVAudioSession *avAudioSession;
  uint64_t v26;
  uint64_t v27;
  CHMetrics *v28;
  void *metrics;
  NSObject *v30;
  NSObject *v31;
  objc_super v33;
  uint8_t buf[4];
  const char *v35;
  __int16 v36;
  int v37;
  __int16 v38;
  const char *v39;
  __int16 v40;
  CHHapticEngine *v41;
  __int16 v42;
  AVAudioSession *v43;
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v7 = audioSession;
  if (setupHapticLogScopes(void)::once != -1)
    dispatch_once(&setupHapticLogScopes(void)::once, &__block_literal_global_2);
  CALog::Scope::oslog((id *)kHAPIScope);
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = os_signpost_id_make_with_pointer(v8, self);

  CALog::Scope::oslog((id *)kHAPIScope);
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = v10;
  v12 = v9 - 1;
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1B573F000, v11, OS_SIGNPOST_INTERVAL_BEGIN, v9, "HapticEngine_initWithAudioSession", " enableTelemetry=YES ", buf, 2u);
  }

  +[CHHapticEngine capabilitiesForHardware](CHHapticEngine, "capabilitiesForHardware");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v13, "supportsHaptics") & 1) != 0 || (objc_msgSend(v13, "supportsAudio") & 1) != 0)
  {
    v33.receiver = self;
    v33.super_class = (Class)CHHapticEngine;
    v14 = -[CHHapticEngine init](&v33, sel_init);
    if (!v14)
    {
      v16 = 0;
      goto LABEL_38;
    }
    if (v7)
    {
      if (kHAPIScope)
      {
        v15 = *(id *)kHAPIScope;
        if (!v15)
        {
LABEL_27:
          objc_storeStrong((id *)&v14->_avAudioSession, audioSession);
          goto LABEL_33;
        }
      }
      else
      {
        v15 = MEMORY[0x1E0C81028];
        v22 = MEMORY[0x1E0C81028];
      }
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136316162;
        v35 = "CHHapticEngine.mm";
        v36 = 1024;
        v37 = 1050;
        v38 = 2080;
        v39 = "-[CHHapticEngine initWithAudioSession:error:]";
        v40 = 2048;
        v41 = v14;
        v42 = 2048;
        v43 = v7;
        _os_log_impl(&dword_1B573F000, v15, OS_LOG_TYPE_DEFAULT, "%25s:%-5d %s: Creating engine %p with audio session %p", buf, 0x30u);
      }

      goto LABEL_27;
    }
    if (kHAPIScope)
    {
      v20 = (AVFASoftLink *)*(id *)kHAPIScope;
      v21 = v20;
      if (!v20)
        goto LABEL_32;
    }
    else
    {
      v21 = MEMORY[0x1E0C81028];
      v23 = MEMORY[0x1E0C81028];
    }
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315906;
      v35 = "CHHapticEngine.mm";
      v36 = 1024;
      v37 = 1055;
      v38 = 2080;
      v39 = "-[CHHapticEngine initWithAudioSession:error:]";
      v40 = 2048;
      v41 = v14;
      _os_log_impl(&dword_1B573F000, v21, OS_LOG_TYPE_DEFAULT, "%25s:%-5d %s: Creating engine %p with internal audio session", buf, 0x26u);
    }

LABEL_32:
    objc_msgSend(AVFASoftLink::getAVAudioSession(v20), "auxiliarySession");
    v24 = objc_claimAutoreleasedReturnValue();
    avAudioSession = v14->_avAudioSession;
    v14->_avAudioSession = (AVAudioSession *)v24;

    objc_storeStrong((id *)&v14->_usageCategory, CFSTR("DefaultWithConstantVolume"));
    if (!-[CHHapticEngine setupEngineWithCategory:session:needsAudioPowerBudget:error:](v14, "setupEngineWithCategory:session:needsAudioPowerBudget:error:", v14->_usageCategory, v14->_avAudioSession, -[CHHapticEngine needsAudioPowerBudget](v14, "needsAudioPowerBudget"), error))
    {
      v16 = 0;
LABEL_37:

LABEL_38:
      CALog::Scope::oslog((id *)kHAPIScope);
      v30 = objc_claimAutoreleasedReturnValue();
      v31 = v30;
      if (v12 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v30))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1B573F000, v31, OS_SIGNPOST_INTERVAL_END, v9, "HapticEngine_initWithAudioSession", (const char *)&unk_1B57A456E, buf, 2u);
      }

      self = v16;
      v19 = self;
      goto LABEL_42;
    }
LABEL_33:
    -[CHHapticEngine connectAudioSession:](v14, "connectAudioSession:", v14->_avAudioSession);
    v26 = -[CHHapticEngine getSessionIDFromAVAudioSession:](v14, "getSessionIDFromAVAudioSession:", v14->_avAudioSession);
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjectsAndKeys:", CFSTR("Default"), CFSTR("Locality"), 0);
    v27 = objc_claimAutoreleasedReturnValue();
    if (-[CHHapticEngine doInit:sessionIsShared:options:bypassAudioSession:error:](v14, "doInit:sessionIsShared:options:bypassAudioSession:error:", v26, v7 != 0, v27, 0, error))
    {
      v28 = -[CHMetrics initWithEngine:audioSessionID:sessionIsShared:isSPI:]([CHMetrics alloc], "initWithEngine:audioSessionID:sessionIsShared:isSPI:", v14, v26, v14->_sessionIsShared, 0);
      metrics = v14->_metrics;
      v14->_metrics = v28;
      v16 = v14;
    }
    else
    {
      v16 = 0;
      metrics = v14;
    }

    v14 = (CHHapticEngine *)v27;
    goto LABEL_37;
  }
  if (error)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.CoreHaptics"), -4809, 0);
    *error = (NSError *)(id)objc_claimAutoreleasedReturnValue();
  }
  CALog::Scope::oslog((id *)kHAPIScope);
  v17 = objc_claimAutoreleasedReturnValue();
  v18 = v17;
  if (v12 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v17))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1B573F000, v18, OS_SIGNPOST_INTERVAL_END, v9, "HapticEngine_initWithAudioSession", (const char *)&unk_1B57A456E, buf, 2u);
  }

  v19 = 0;
LABEL_42:

  return v19;
}

- (BOOL)doInitWithOptions:(id)a3 error:(id *)a4
{
  id v6;
  NSObject *v7;
  id v8;
  OS_dispatch_queue *v9;
  OS_dispatch_queue *dispatchQueue;
  AVHapticPlayer *v11;
  AVHapticPlayer *player;
  HapticServerConfig *v13;
  HapticServerConfig *serverConfig;
  void *v15;
  char v16;
  void *v17;
  char v18;
  unint64_t v19;
  NSString *priority;
  NSString *hapticPowerUsage;
  NSString *audioPowerUsage;
  BOOL v23;
  int v25;
  const char *v26;
  __int16 v27;
  int v28;
  __int16 v29;
  const char *v30;
  __int16 v31;
  id v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (kHAPIScope)
  {
    v7 = *(id *)kHAPIScope;
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
    v25 = 136315906;
    v26 = "CHHapticEngine.mm";
    v27 = 1024;
    v28 = 1101;
    v29 = 2080;
    v30 = "-[CHHapticEngine doInitWithOptions:error:]";
    v31 = 2112;
    v32 = v6;
    _os_log_impl(&dword_1B573F000, v7, OS_LOG_TYPE_INFO, "%25s:%-5d %s: options: '%@'", (uint8_t *)&v25, 0x26u);
  }

LABEL_8:
  v9 = (OS_dispatch_queue *)dispatch_queue_create("CHHapticEngineDispatchQueue", 0);
  dispatchQueue = self->_dispatchQueue;
  self->_dispatchQueue = v9;

  self->_audioSessionID = 0;
  self->_sessionIsShared = 0;
  -[CHHapticEngine createHapticPlayerWithOptions:](self, "createHapticPlayerWithOptions:", v6);
  v11 = (AVHapticPlayer *)objc_claimAutoreleasedReturnValue();
  player = self->_player;
  self->_player = v11;

  self->_runTimeout = 120.0;
  v13 = -[HapticServerConfig initWithHapticPlayer:withOptions:error:]([HapticServerConfig alloc], "initWithHapticPlayer:withOptions:error:", self->_player, v6, a4);
  serverConfig = self->_serverConfig;
  self->_serverConfig = v13;

  if (!self->_serverConfig)
  {
    v23 = 0;
    goto LABEL_16;
  }
  self->_currentPlayerBehavior = 2;
  -[CHHapticEngine serverConfig](self, "serverConfig");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "supportsHapticPlayback");

  if ((v16 & 1) == 0)
  {
    v19 = self->_currentPlayerBehavior | 0x10;
    goto LABEL_13;
  }
  -[CHHapticEngine serverConfig](self, "serverConfig");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "supportsAudioPlayback");

  if ((v18 & 1) == 0)
  {
    v19 = 1;
LABEL_13:
    self->_currentPlayerBehavior = v19;
  }
  priority = self->_priority;
  self->_priority = (NSString *)CFSTR("LowPriority");

  hapticPowerUsage = self->_hapticPowerUsage;
  self->_hapticPowerUsage = (NSString *)CFSTR("HighPower");

  audioPowerUsage = self->_audioPowerUsage;
  self->_audioPowerUsage = (NSString *)CFSTR("HighPower");

  v23 = -[CHHapticEngine finishInit:](self, "finishInit:", a4);
LABEL_16:

  return v23;
}

- (CHHapticEngine)initWithOptions:(id)a3 error:(id *)a4
{
  id v6;
  NSObject *v7;
  os_signpost_id_t v8;
  NSObject *v9;
  NSObject *v10;
  CHHapticEngine *v11;
  CHHapticEngine *v12;
  NSObject *v13;
  NSObject *v14;
  objc_super v16;
  uint8_t buf[16];

  v6 = a3;
  if (setupHapticLogScopes(void)::once != -1)
    dispatch_once(&setupHapticLogScopes(void)::once, &__block_literal_global_2);
  CALog::Scope::oslog((id *)kHAPIScope);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = os_signpost_id_make_with_pointer(v7, self);

  CALog::Scope::oslog((id *)kHAPIScope);
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1B573F000, v10, OS_SIGNPOST_INTERVAL_BEGIN, v8, "HapticEngine_initWithOptions", " enableTelemetry=YES ", buf, 2u);
  }

  v16.receiver = self;
  v16.super_class = (Class)CHHapticEngine;
  v11 = -[CHHapticEngine init](&v16, sel_init);
  v12 = v11;
  if (v11 && !-[CHHapticEngine doInitWithOptions:error:](v11, "doInitWithOptions:error:", v6, a4))
  {

    v12 = 0;
  }
  CALog::Scope::oslog((id *)kHAPIScope);
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1B573F000, v14, OS_SIGNPOST_INTERVAL_END, v8, "HapticEngine_initWithOptions", (const char *)&unk_1B57A456E, buf, 2u);
  }

  return v12;
}

- (void)stopPrewarm
{
  NSObject *v3;
  os_signpost_id_t v4;
  NSObject *v5;
  NSObject *v6;
  NSObject *v7;
  id v8;
  NSObject *v9;
  NSObject *v10;
  int v11;
  const char *v12;
  __int16 v13;
  int v14;
  __int16 v15;
  const char *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  CALog::Scope::oslog((id *)kHAPIScope);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = os_signpost_id_make_with_pointer(v3, self);

  CALog::Scope::oslog((id *)kHAPIScope);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    LOWORD(v11) = 0;
    _os_signpost_emit_with_name_impl(&dword_1B573F000, v6, OS_SIGNPOST_INTERVAL_BEGIN, v4, "HapticEngine_stopPrewarm", " enableTelemetry=YES ", (uint8_t *)&v11, 2u);
  }

  if (kHAPIScope)
  {
    v7 = *(id *)kHAPIScope;
    if (!v7)
      goto LABEL_11;
  }
  else
  {
    v7 = MEMORY[0x1E0C81028];
    v8 = MEMORY[0x1E0C81028];
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v11 = 136315650;
    v12 = "CHHapticEngine.mm";
    v13 = 1024;
    v14 = 1174;
    v15 = 2080;
    v16 = "-[CHHapticEngine stopPrewarm]";
    _os_log_impl(&dword_1B573F000, v7, OS_LOG_TYPE_DEFAULT, "%25s:%-5d %s: Stopping prewarm on the underlying Haptic Player", (uint8_t *)&v11, 0x1Cu);
  }

LABEL_11:
  -[AVHapticPlayer stopPrewarm](self->_player, "stopPrewarm");
  CALog::Scope::oslog((id *)kHAPIScope);
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    LOWORD(v11) = 0;
    _os_signpost_emit_with_name_impl(&dword_1B573F000, v10, OS_SIGNPOST_INTERVAL_END, v4, "HapticEngine_stopPrewarm", (const char *)&unk_1B57A456E, (uint8_t *)&v11, 2u);
  }

}

void __47__CHHapticEngine_doStartWithCompletionHandler___block_invoke_155(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  id v4;
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  id v10;
  int v11;
  const char *v12;
  __int16 v13;
  int v14;
  __int16 v15;
  const char *v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v3 = WeakRetained;
  if (*(_QWORD *)(a1 + 32))
  {
    if (kHAPIScope)
    {
      v4 = *(id *)kHAPIScope;
      if (!v4)
      {
LABEL_11:
        objc_msgSend(v3, "setRunning:", 0);
        objc_msgSend(v3, "metrics");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "handleEngineStop");

        goto LABEL_12;
      }
    }
    else
    {
      v4 = (id)MEMORY[0x1E0C81028];
      v5 = MEMORY[0x1E0C81028];
    }
    v6 = v4;
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(*(id *)(a1 + 32), "localizedDescription");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 136315906;
      v12 = "CHHapticEngine.mm";
      v13 = 1024;
      v14 = 1202;
      v15 = 2080;
      v16 = "-[CHHapticEngine doStartWithCompletionHandler:]_block_invoke";
      v17 = 2112;
      v18 = v7;
      _os_log_impl(&dword_1B573F000, v6, OS_LOG_TYPE_ERROR, "%25s:%-5d %s: ERROR: Player start failed: %@", (uint8_t *)&v11, 0x26u);

    }
    goto LABEL_11;
  }
  if (objc_msgSend(WeakRetained, "isAutoShutdownEnabled"))
    objc_msgSend(v3, "beginIdleTimer");
LABEL_12:
  if (*(_QWORD *)(a1 + 40))
  {
    if (kHAPIScope)
    {
      v9 = *(id *)kHAPIScope;
      if (!v9)
      {
LABEL_20:
        (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
        goto LABEL_21;
      }
    }
    else
    {
      v9 = MEMORY[0x1E0C81028];
      v10 = MEMORY[0x1E0C81028];
    }
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      v11 = 136315650;
      v12 = "CHHapticEngine.mm";
      v13 = 1024;
      v14 = 1212;
      v15 = 2080;
      v16 = "-[CHHapticEngine doStartWithCompletionHandler:]_block_invoke";
      _os_log_impl(&dword_1B573F000, v9, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: Calling start completion handler on internal queue", (uint8_t *)&v11, 0x1Cu);
    }

    goto LABEL_20;
  }
LABEL_21:

}

uint64_t __47__CHHapticEngine_doStartWithCompletionHandler___block_invoke_156(uint64_t result)
{
  uint64_t v1;
  id v2;
  id v3;
  NSObject *v4;
  void *v5;
  int v6;
  const char *v7;
  __int16 v8;
  int v9;
  __int16 v10;
  const char *v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if (*(_QWORD *)(result + 40))
  {
    v1 = result;
    if (kHAPIScope)
    {
      v2 = *(id *)kHAPIScope;
      if (!v2)
        return (*(uint64_t (**)(void))(*(_QWORD *)(v1 + 40) + 16))();
    }
    else
    {
      v2 = (id)MEMORY[0x1E0C81028];
      v3 = MEMORY[0x1E0C81028];
    }
    v4 = v2;
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5 = (void *)MEMORY[0x1B5E4F2B4](*(_QWORD *)(v1 + 40));
      v6 = 136315906;
      v7 = "CHHapticEngine.mm";
      v8 = 1024;
      v9 = 1221;
      v10 = 2080;
      v11 = "-[CHHapticEngine doStartWithCompletionHandler:]_block_invoke";
      v12 = 2048;
      v13 = v5;
      _os_log_impl(&dword_1B573F000, v4, OS_LOG_TYPE_DEFAULT, "%25s:%-5d %s: Client-supplied completion handler called on destroyed player - calling captured block %p on global queue", (uint8_t *)&v6, 0x26u);

    }
    return (*(uint64_t (**)(void))(*(_QWORD *)(v1 + 40) + 16))();
  }
  return result;
}

uint64_t __45__CHHapticEngine_startWithCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, *(_QWORD *)(a1 + 32));
  return result;
}

void __45__CHHapticEngine_startWithCompletionHandler___block_invoke_159(uint64_t a1)
{
  NSObject *v2;
  id v3;
  NSObject *v4;
  id v5;
  NSObject *v6;
  NSObject *v7;
  os_signpost_id_t v8;
  int v9;
  const char *v10;
  __int16 v11;
  int v12;
  __int16 v13;
  const char *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (!objc_msgSend(*(id *)(a1 + 32), "running"))
  {
    objc_msgSend(*(id *)(a1 + 32), "doStartWithCompletionHandler:", *(_QWORD *)(a1 + 40));
    return;
  }
  if (kHAPIScope)
  {
    v2 = *(id *)kHAPIScope;
    if (!v2)
      goto LABEL_10;
  }
  else
  {
    v2 = MEMORY[0x1E0C81028];
    v3 = MEMORY[0x1E0C81028];
  }
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 136315650;
    v10 = "CHHapticEngine.mm";
    v11 = 1024;
    v12 = 1236;
    v13 = 2080;
    v14 = "-[CHHapticEngine startWithCompletionHandler:]_block_invoke";
    _os_log_impl(&dword_1B573F000, v2, OS_LOG_TYPE_DEFAULT, "%25s:%-5d %s: Engine already running", (uint8_t *)&v9, 0x1Cu);
  }

LABEL_10:
  if (*(_QWORD *)(a1 + 40))
  {
    if (kHAPIScope)
    {
      v4 = *(id *)kHAPIScope;
      if (!v4)
      {
LABEL_18:
        (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
        goto LABEL_19;
      }
    }
    else
    {
      v4 = MEMORY[0x1E0C81028];
      v5 = MEMORY[0x1E0C81028];
    }
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v9 = 136315650;
      v10 = "CHHapticEngine.mm";
      v11 = 1024;
      v12 = 1238;
      v13 = 2080;
      v14 = "-[CHHapticEngine startWithCompletionHandler:]_block_invoke";
      _os_log_impl(&dword_1B573F000, v4, OS_LOG_TYPE_DEFAULT, "%25s:%-5d %s: Directly calling start completionHandler on internal queue", (uint8_t *)&v9, 0x1Cu);
    }

    goto LABEL_18;
  }
LABEL_19:
  CALog::Scope::oslog((id *)kHAPIScope);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v6;
  v8 = *(_QWORD *)(a1 + 48);
  if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v6))
  {
    LOWORD(v9) = 0;
    _os_signpost_emit_with_name_impl(&dword_1B573F000, v7, OS_SIGNPOST_INTERVAL_END, v8, "HapticEngine_startWithCompletionHandler", (const char *)&unk_1B57A456E, (uint8_t *)&v9, 2u);
  }

}

- (BOOL)doStartEngineAndWait:(id *)a3
{
  NSObject *v5;
  NSObject *v6;
  NSObject *v7;
  id v8;
  dispatch_time_t v9;
  NSObject *v10;
  id v11;
  uint64_t v12;
  void *v13;
  NSObject *v14;
  id v15;
  BOOL v16;
  _QWORD v18[5];
  NSObject *v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;
  uint8_t buf[4];
  const char *v28;
  __int16 v29;
  int v30;
  __int16 v31;
  const char *v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v21 = 0;
  v22 = &v21;
  v23 = 0x3032000000;
  v24 = __Block_byref_object_copy__3;
  v25 = __Block_byref_object_dispose__3;
  v26 = 0;
  v5 = dispatch_group_create();
  dispatch_group_enter(v5);
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __39__CHHapticEngine_doStartEngineAndWait___block_invoke;
  v18[3] = &unk_1E6960900;
  v18[4] = self;
  v20 = &v21;
  v6 = v5;
  v19 = v6;
  -[CHHapticEngine dispatchOnLocal:](self, "dispatchOnLocal:", v18);
  if (kHAPIScope)
  {
    v7 = *(id *)kHAPIScope;
    if (!v7)
      goto LABEL_8;
  }
  else
  {
    v7 = MEMORY[0x1E0C81028];
    v8 = MEMORY[0x1E0C81028];
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315650;
    v28 = "CHHapticEngine.mm";
    v29 = 1024;
    v30 = 1268;
    v31 = 2080;
    v32 = "-[CHHapticEngine doStartEngineAndWait:]";
    _os_log_impl(&dword_1B573F000, v7, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: Waiting for startup...", buf, 0x1Cu);
  }

LABEL_8:
  v9 = dispatch_time(0, 4000000000);
  if (!dispatch_group_wait(v6, v9))
    goto LABEL_17;
  if (!kHAPIScope)
  {
    v10 = MEMORY[0x1E0C81028];
    v11 = MEMORY[0x1E0C81028];
    goto LABEL_13;
  }
  v10 = *(id *)kHAPIScope;
  if (v10)
  {
LABEL_13:
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      v28 = "CHHapticEngine.mm";
      v29 = 1024;
      v30 = 1271;
      v31 = 2080;
      v32 = "-[CHHapticEngine doStartEngineAndWait:]";
      _os_log_impl(&dword_1B573F000, v10, OS_LOG_TYPE_ERROR, "%25s:%-5d %s: ERROR: Startup timeout", buf, 0x1Cu);
    }

  }
  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.CoreHaptics"), -4808, 0);
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = (void *)v22[5];
  v22[5] = v12;

LABEL_17:
  if (a3)
    *a3 = objc_retainAutorelease((id)v22[5]);
  if (kHAPIScope)
  {
    v14 = *(id *)kHAPIScope;
    if (!v14)
      goto LABEL_26;
  }
  else
  {
    v14 = MEMORY[0x1E0C81028];
    v15 = MEMORY[0x1E0C81028];
  }
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315650;
    v28 = "CHHapticEngine.mm";
    v29 = 1024;
    v30 = 1277;
    v31 = 2080;
    v32 = "-[CHHapticEngine doStartEngineAndWait:]";
    _os_log_impl(&dword_1B573F000, v14, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: Startup complete", buf, 0x1Cu);
  }

LABEL_26:
  v16 = v22[5] == 0;

  _Block_object_dispose(&v21, 8);
  return v16;
}

void __39__CHHapticEngine_doStartEngineAndWait___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  id v4;
  id v5;
  __int128 v6;
  _QWORD v7[4];
  __int128 v8;
  uint8_t buf[4];
  const char *v10;
  __int16 v11;
  int v12;
  __int16 v13;
  const char *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if ((objc_msgSend(*(id *)(a1 + 32), "running") & 1) == 0)
  {
    v3 = *(void **)(a1 + 32);
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __39__CHHapticEngine_doStartEngineAndWait___block_invoke_2;
    v7[3] = &unk_1E69607A0;
    v6 = *(_OWORD *)(a1 + 40);
    v4 = (id)v6;
    v8 = v6;
    objc_msgSend(v3, "doStartWithCompletionHandler:", v7);

    return;
  }
  if (!kHAPIScope)
  {
    v2 = MEMORY[0x1E0C81028];
    v5 = MEMORY[0x1E0C81028];
    goto LABEL_7;
  }
  v2 = *(id *)kHAPIScope;
  if (v2)
  {
LABEL_7:
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315650;
      v10 = "CHHapticEngine.mm";
      v11 = 1024;
      v12 = 1263;
      v13 = 2080;
      v14 = "-[CHHapticEngine doStartEngineAndWait:]_block_invoke";
      _os_log_impl(&dword_1B573F000, v2, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: Engine already running", buf, 0x1Cu);
    }

  }
  objc_msgSend(*(id *)(a1 + 32), "reconfigureAudioSession");
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

void __39__CHHapticEngine_doStartEngineAndWait___block_invoke_2(uint64_t a1, void *a2)
{
  id v4;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  v4 = a2;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));

}

- (BOOL)startAndReturnError:(NSError *)outError
{
  NSObject *v5;
  id v6;
  NSObject *v7;
  os_signpost_id_t v8;
  NSObject *v9;
  NSObject *v10;
  BOOL v11;
  NSObject *v12;
  NSObject *v13;
  int v15;
  const char *v16;
  __int16 v17;
  int v18;
  __int16 v19;
  const char *v20;
  __int16 v21;
  CHHapticEngine *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  if (kHAPIScope)
  {
    v5 = *(id *)kHAPIScope;
    if (!v5)
      goto LABEL_8;
  }
  else
  {
    v5 = MEMORY[0x1E0C81028];
    v6 = MEMORY[0x1E0C81028];
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v15 = 136315906;
    v16 = "CHHapticEngine.mm";
    v17 = 1024;
    v18 = 1283;
    v19 = 2080;
    v20 = "-[CHHapticEngine startAndReturnError:]";
    v21 = 2048;
    v22 = self;
    _os_log_impl(&dword_1B573F000, v5, OS_LOG_TYPE_DEFAULT, "%25s:%-5d %s: Called on engine %p", (uint8_t *)&v15, 0x26u);
  }

LABEL_8:
  if (self->_player)
  {
    CALog::Scope::oslog((id *)kHAPIScope);
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = os_signpost_id_make_with_pointer(v7, self);

    CALog::Scope::oslog((id *)kHAPIScope);
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
    {
      LOWORD(v15) = 0;
      _os_signpost_emit_with_name_impl(&dword_1B573F000, v10, OS_SIGNPOST_INTERVAL_BEGIN, v8, "HapticEngine_startAndReturnError", " enableTelemetry=YES ", (uint8_t *)&v15, 2u);
    }

    v11 = -[CHHapticEngine doStartEngineAndWait:](self, "doStartEngineAndWait:", outError);
    CALog::Scope::oslog((id *)kHAPIScope);
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = v12;
    if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
    {
      LOWORD(v15) = 0;
      _os_signpost_emit_with_name_impl(&dword_1B573F000, v13, OS_SIGNPOST_INTERVAL_END, v8, "HapticEngine_startAndReturnError", (const char *)&unk_1B57A456E, (uint8_t *)&v15, 2u);
    }

  }
  else
  {
    _Haptic_Check((uint64_t)"/Library/Caches/com.apple.xbs/Sources/CoreHaptics/Source/CHHapticEngine.mm", 1284, "-[CHHapticEngine startAndReturnError:]", "_player != nil", -4810, outError);
    return 0;
  }
  return v11;
}

- (BOOL)doStopEngineAndWait:(id *)a3
{
  NSObject *v5;
  id v6;
  NSObject *v7;
  AVHapticPlayer *player;
  NSObject *v9;
  NSObject *v10;
  id v11;
  dispatch_time_t v12;
  NSObject *v13;
  id v14;
  const char *v15;
  NSObject *v16;
  os_log_type_t v17;
  id v18;
  BOOL v19;
  uint64_t v21;
  uint64_t v22;
  void (*v23)(uint64_t, void *);
  void *v24;
  NSObject *v25;
  _BYTE *v26;
  uint8_t v27[4];
  const char *v28;
  __int16 v29;
  int v30;
  __int16 v31;
  const char *v32;
  _BYTE buf[32];
  void (*v34)(uint64_t);
  id v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  -[CHHapticEngine setRunning:](self, "setRunning:", 0);
  if (kHAPIScope)
  {
    v5 = *(id *)kHAPIScope;
    if (!v5)
      goto LABEL_8;
  }
  else
  {
    v5 = MEMORY[0x1E0C81028];
    v6 = MEMORY[0x1E0C81028];
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    *(_QWORD *)&buf[4] = "CHHapticEngine.mm";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = 1294;
    *(_WORD *)&buf[18] = 2080;
    *(_QWORD *)&buf[20] = "-[CHHapticEngine doStopEngineAndWait:]";
    _os_log_impl(&dword_1B573F000, v5, OS_LOG_TYPE_DEFAULT, "%25s:%-5d %s: Synchronously stopping underlying Haptic Player", buf, 0x1Cu);
  }

LABEL_8:
  v7 = dispatch_group_create();
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x3032000000;
  *(_QWORD *)&buf[24] = __Block_byref_object_copy__3;
  v34 = __Block_byref_object_dispose__3;
  v35 = 0;
  dispatch_group_enter(v7);
  player = self->_player;
  v21 = MEMORY[0x1E0C809B0];
  v22 = 3221225472;
  v23 = __38__CHHapticEngine_doStopEngineAndWait___block_invoke;
  v24 = &unk_1E69607A0;
  v26 = buf;
  v9 = v7;
  v25 = v9;
  -[AVHapticPlayer stopRunningWithCompletionHandler:](player, "stopRunningWithCompletionHandler:", &v21);
  if (kHAPIScope)
  {
    v10 = *(id *)kHAPIScope;
    if (!v10)
      goto LABEL_15;
  }
  else
  {
    v10 = MEMORY[0x1E0C81028];
    v11 = MEMORY[0x1E0C81028];
  }
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)v27 = 136315650;
    v28 = "CHHapticEngine.mm";
    v29 = 1024;
    v30 = 1306;
    v31 = 2080;
    v32 = "-[CHHapticEngine doStopEngineAndWait:]";
    _os_log_impl(&dword_1B573F000, v10, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: Waiting for player stop...", v27, 0x1Cu);
  }

LABEL_15:
  v12 = dispatch_time(0, 4000000000);
  if (dispatch_group_wait(v9, v12))
  {
    if (kHAPIScope)
    {
      v13 = *(id *)kHAPIScope;
      if (!v13)
        goto LABEL_30;
    }
    else
    {
      v13 = MEMORY[0x1E0C81028];
      v14 = MEMORY[0x1E0C81028];
    }
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v27 = 136315650;
      v28 = "CHHapticEngine.mm";
      v29 = 1024;
      v30 = 1309;
      v31 = 2080;
      v32 = "-[CHHapticEngine doStopEngineAndWait:]";
      v15 = "%25s:%-5d %s: WARNING: timed out waiting for underlying player to stop";
      v16 = v13;
      v17 = OS_LOG_TYPE_DEFAULT;
LABEL_28:
      _os_log_impl(&dword_1B573F000, v16, v17, v15, v27, 0x1Cu);
      goto LABEL_29;
    }
    goto LABEL_29;
  }
  if (!kHAPIScope)
  {
    v13 = MEMORY[0x1E0C81028];
    v18 = MEMORY[0x1E0C81028];
LABEL_26:
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)v27 = 136315650;
      v28 = "CHHapticEngine.mm";
      v29 = 1024;
      v30 = 1312;
      v31 = 2080;
      v32 = "-[CHHapticEngine doStopEngineAndWait:]";
      v15 = "%25s:%-5d %s: Done waiting for underlying player stop";
      v16 = v13;
      v17 = OS_LOG_TYPE_DEBUG;
      goto LABEL_28;
    }
LABEL_29:

    goto LABEL_30;
  }
  v13 = *(id *)kHAPIScope;
  if (v13)
    goto LABEL_26;
LABEL_30:
  if (-[CHHapticEngine isAutoShutdownEnabled](self, "isAutoShutdownEnabled", v21, v22, v23, v24))
    -[CHHapticEngine cancelIdleTimer](self, "cancelIdleTimer");
  *a3 = objc_retainAutorelease(*(id *)(*(_QWORD *)&buf[8] + 40));
  v19 = *(_QWORD *)(*(_QWORD *)&buf[8] + 40) == 0;

  _Block_object_dispose(buf, 8);
  return v19;
}

void __38__CHHapticEngine_doStopEngineAndWait___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id v5;
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;
  int v13;
  const char *v14;
  __int16 v15;
  int v16;
  __int16 v17;
  const char *v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (kHAPIScope)
  {
    v4 = *(id *)kHAPIScope;
    if (!v4)
      goto LABEL_8;
  }
  else
  {
    v4 = MEMORY[0x1E0C81028];
    v5 = MEMORY[0x1E0C81028];
  }
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    v13 = 136315650;
    v14 = "CHHapticEngine.mm";
    v15 = 1024;
    v16 = 1299;
    v17 = 2080;
    v18 = "-[CHHapticEngine doStopEngineAndWait:]_block_invoke";
    _os_log_impl(&dword_1B573F000, v4, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: In underlying AVHapticPlayer's completion handler block for doStopEngineAndWait", (uint8_t *)&v13, 0x1Cu);
  }

LABEL_8:
  if (v3)
  {
    if (kHAPIScope)
    {
      v6 = *(id *)kHAPIScope;
      if (!v6)
        goto LABEL_16;
    }
    else
    {
      v6 = (id)MEMORY[0x1E0C81028];
      v7 = MEMORY[0x1E0C81028];
    }
    v8 = v6;
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v3, "localizedDescription");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 136315906;
      v14 = "CHHapticEngine.mm";
      v15 = 1024;
      v16 = 1301;
      v17 = 2080;
      v18 = "-[CHHapticEngine doStopEngineAndWait:]_block_invoke";
      v19 = 2112;
      v20 = v9;
      _os_log_impl(&dword_1B573F000, v8, OS_LOG_TYPE_ERROR, "%25s:%-5d %s: ERROR: Player stop failed: %@", (uint8_t *)&v13, 0x26u);

    }
  }
LABEL_16:
  v10 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v11 = *(void **)(v10 + 40);
  *(_QWORD *)(v10 + 40) = v3;
  v12 = v3;

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __46__CHHapticEngine_doStopWithCompletionHandler___block_invoke_160(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  NSObject *v4;
  id v5;
  int v6;
  const char *v7;
  __int16 v8;
  int v9;
  __int16 v10;
  const char *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (objc_msgSend(WeakRetained, "isAutoShutdownEnabled"))
    objc_msgSend(WeakRetained, "cancelIdleTimer");
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "metrics");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "handleEngineStop");

  }
  if (*(_QWORD *)(a1 + 40))
  {
    if (kHAPIScope)
    {
      v4 = *(id *)kHAPIScope;
      if (!v4)
      {
LABEL_13:
        (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
        goto LABEL_14;
      }
    }
    else
    {
      v4 = MEMORY[0x1E0C81028];
      v5 = MEMORY[0x1E0C81028];
    }
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      v6 = 136315650;
      v7 = "CHHapticEngine.mm";
      v8 = 1024;
      v9 = 1341;
      v10 = 2080;
      v11 = "-[CHHapticEngine doStopWithCompletionHandler:]_block_invoke";
      _os_log_impl(&dword_1B573F000, v4, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: Calling stop completion handler on internal queue", (uint8_t *)&v6, 0x1Cu);
    }

    goto LABEL_13;
  }
LABEL_14:

}

uint64_t __46__CHHapticEngine_doStopWithCompletionHandler___block_invoke_161(uint64_t result)
{
  uint64_t v1;
  id v2;
  id v3;
  NSObject *v4;
  void *v5;
  int v6;
  const char *v7;
  __int16 v8;
  int v9;
  __int16 v10;
  const char *v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if (*(_QWORD *)(result + 40))
  {
    v1 = result;
    if (kHAPIScope)
    {
      v2 = *(id *)kHAPIScope;
      if (!v2)
        return (*(uint64_t (**)(void))(*(_QWORD *)(v1 + 40) + 16))();
    }
    else
    {
      v2 = (id)MEMORY[0x1E0C81028];
      v3 = MEMORY[0x1E0C81028];
    }
    v4 = v2;
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5 = (void *)MEMORY[0x1B5E4F2B4](*(_QWORD *)(v1 + 40));
      v6 = 136315906;
      v7 = "CHHapticEngine.mm";
      v8 = 1024;
      v9 = 1350;
      v10 = 2080;
      v11 = "-[CHHapticEngine doStopWithCompletionHandler:]_block_invoke";
      v12 = 2048;
      v13 = v5;
      _os_log_impl(&dword_1B573F000, v4, OS_LOG_TYPE_DEFAULT, "%25s:%-5d %s: Client-supplied completion handler called on destroyed player - calling captured block %p on global queue", (uint8_t *)&v6, 0x26u);

    }
    return (*(uint64_t (**)(void))(*(_QWORD *)(v1 + 40) + 16))();
  }
  return result;
}

uint64_t __44__CHHapticEngine_stopWithCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, *(_QWORD *)(a1 + 32));
  return result;
}

void __44__CHHapticEngine_stopWithCompletionHandler___block_invoke_162(uint64_t a1)
{
  id WeakRetained;
  NSObject *v3;
  id v4;
  NSObject *v5;
  id v6;
  int v7;
  const char *v8;
  __int16 v9;
  int v10;
  __int16 v11;
  const char *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (!objc_msgSend(WeakRetained, "running"))
  {
    if (kHAPIScope)
    {
      v3 = *(id *)kHAPIScope;
      if (!v3)
        goto LABEL_10;
    }
    else
    {
      v3 = MEMORY[0x1E0C81028];
      v4 = MEMORY[0x1E0C81028];
    }
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      v7 = 136315650;
      v8 = "CHHapticEngine.mm";
      v9 = 1024;
      v10 = 1370;
      v11 = 2080;
      v12 = "-[CHHapticEngine stopWithCompletionHandler:]_block_invoke";
      _os_log_impl(&dword_1B573F000, v3, OS_LOG_TYPE_DEFAULT, "%25s:%-5d %s: Engine not running", (uint8_t *)&v7, 0x1Cu);
    }

LABEL_10:
    if (!*(_QWORD *)(a1 + 32))
      goto LABEL_19;
    if (kHAPIScope)
    {
      v5 = *(id *)kHAPIScope;
      if (!v5)
      {
LABEL_18:
        (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
        goto LABEL_19;
      }
    }
    else
    {
      v5 = MEMORY[0x1E0C81028];
      v6 = MEMORY[0x1E0C81028];
    }
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v7 = 136315650;
      v8 = "CHHapticEngine.mm";
      v9 = 1024;
      v10 = 1372;
      v11 = 2080;
      v12 = "-[CHHapticEngine stopWithCompletionHandler:]_block_invoke";
      _os_log_impl(&dword_1B573F000, v5, OS_LOG_TYPE_DEFAULT, "%25s:%-5d %s: Directly calling stop completionHandler on internal queue", (uint8_t *)&v7, 0x1Cu);
    }

    goto LABEL_18;
  }
  objc_msgSend(WeakRetained, "doStopWithCompletionHandler:", *(_QWORD *)(a1 + 32));
LABEL_19:

}

uint64_t __44__CHHapticEngine_notifyWhenPlayersFinished___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, *(_QWORD *)(a1 + 32));
  return result;
}

- (CHHapticEngine)initWithAudioSessionID:(unsigned int)a3 error:(id *)a4
{
  uint64_t v5;
  NSObject *v7;
  os_signpost_id_t v8;
  NSObject *v9;
  NSObject *v10;
  CHHapticEngine *v11;
  NSObject *v12;
  id v13;
  CHMetrics *v14;
  void *metrics;
  NSObject *v16;
  NSObject *v17;
  objc_super v19;
  uint8_t buf[4];
  const char *v21;
  __int16 v22;
  int v23;
  __int16 v24;
  const char *v25;
  __int16 v26;
  CHHapticEngine *v27;
  __int16 v28;
  int v29;
  uint64_t v30;

  v5 = *(_QWORD *)&a3;
  v30 = *MEMORY[0x1E0C80C00];
  if (setupHapticLogScopes(void)::once != -1)
    dispatch_once(&setupHapticLogScopes(void)::once, &__block_literal_global_2);
  CALog::Scope::oslog((id *)kHAPIScope);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = os_signpost_id_make_with_pointer(v7, self);

  CALog::Scope::oslog((id *)kHAPIScope);
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1B573F000, v10, OS_SIGNPOST_INTERVAL_BEGIN, v8, "HapticEngine_initWithAudioSessionID", " enableTelemetry=YES ", buf, 2u);
  }

  v19.receiver = self;
  v19.super_class = (Class)CHHapticEngine;
  v11 = -[CHHapticEngine init](&v19, sel_init);
  if (v11)
  {
    if (kHAPIScope)
    {
      v12 = *(id *)kHAPIScope;
      if (!v12)
      {
LABEL_14:
        if (-[CHHapticEngine doInit:sessionIsShared:options:bypassAudioSession:error:](v11, "doInit:sessionIsShared:options:bypassAudioSession:error:", v5, 1, 0, 0, a4))
        {
          v14 = -[CHMetrics initWithEngine:audioSessionID:sessionIsShared:isSPI:]([CHMetrics alloc], "initWithEngine:audioSessionID:sessionIsShared:isSPI:", v11, v5, v11->_sessionIsShared, 1);
          metrics = v11->_metrics;
          v11->_metrics = v14;
        }
        else
        {
          metrics = v11;
          v11 = 0;
        }

        goto LABEL_18;
      }
    }
    else
    {
      v12 = MEMORY[0x1E0C81028];
      v13 = MEMORY[0x1E0C81028];
    }
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136316162;
      v21 = "CHHapticEngine.mm";
      v22 = 1024;
      v23 = 1407;
      v24 = 2080;
      v25 = "-[CHHapticEngine initWithAudioSessionID:error:]";
      v26 = 2048;
      v27 = v11;
      v28 = 1024;
      v29 = v5;
      _os_log_impl(&dword_1B573F000, v12, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: Creating engine %p with shared audio session ID %u", buf, 0x2Cu);
    }

    goto LABEL_14;
  }
LABEL_18:
  CALog::Scope::oslog((id *)kHAPIScope);
  v16 = objc_claimAutoreleasedReturnValue();
  v17 = v16;
  if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v16))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1B573F000, v17, OS_SIGNPOST_INTERVAL_END, v8, "HapticEngine_initWithAudioSessionID", (const char *)&unk_1B57A456E, buf, 2u);
  }

  return v11;
}

- (CHHapticEngine)initWithAudioSessionID:(unsigned int)a3 options:(id)a4 error:(id *)a5
{
  uint64_t v6;
  id v8;
  NSObject *v9;
  os_signpost_id_t v10;
  NSObject *v11;
  NSObject *v12;
  CHHapticEngine *v13;
  CHHapticEngine *v14;
  NSObject *v15;
  id v16;
  NSObject *v17;
  void *metrics;
  id v19;
  CHMetrics *v20;
  NSObject *v21;
  NSObject *v22;
  objc_super v24;
  uint8_t buf[4];
  const char *v26;
  __int16 v27;
  int v28;
  __int16 v29;
  const char *v30;
  __int16 v31;
  CHHapticEngine *v32;
  __int16 v33;
  int v34;
  uint64_t v35;

  v6 = *(_QWORD *)&a3;
  v35 = *MEMORY[0x1E0C80C00];
  v8 = a4;
  if (setupHapticLogScopes(void)::once != -1)
    dispatch_once(&setupHapticLogScopes(void)::once, &__block_literal_global_2);
  CALog::Scope::oslog((id *)kHAPIScope);
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = os_signpost_id_make_with_pointer(v9, self);

  CALog::Scope::oslog((id *)kHAPIScope);
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1B573F000, v12, OS_SIGNPOST_INTERVAL_BEGIN, v10, "HapticEngine_initWithAudioSessionID_options", " enableTelemetry=YES ", buf, 2u);
  }

  v24.receiver = self;
  v24.super_class = (Class)CHHapticEngine;
  v13 = -[CHHapticEngine init](&v24, sel_init);
  v14 = v13;
  if (v13)
  {
    -[CHHapticEngine storeOptions:](v13, "storeOptions:", v8);
    if (kHAPIScope)
    {
      v15 = *(id *)kHAPIScope;
      if (!v15)
        goto LABEL_14;
    }
    else
    {
      v15 = MEMORY[0x1E0C81028];
      v16 = MEMORY[0x1E0C81028];
    }
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136316162;
      v26 = "CHHapticEngine.mm";
      v27 = 1024;
      v28 = 1428;
      v29 = 2080;
      v30 = "-[CHHapticEngine initWithAudioSessionID:options:error:]";
      v31 = 2048;
      v32 = v14;
      v33 = 1024;
      v34 = v6;
      _os_log_impl(&dword_1B573F000, v15, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: Creating engine %p with shared audio session ID %u", buf, 0x2Cu);
    }

LABEL_14:
    if (!-[CHHapticEngine doInit:sessionIsShared:options:bypassAudioSession:error:](v14, "doInit:sessionIsShared:options:bypassAudioSession:error:", v6, 1, v8, 0, a5))
    {
      metrics = v14;
      v14 = 0;
LABEL_24:

      goto LABEL_25;
    }
    if (kHAPIScope)
    {
      v17 = *(id *)kHAPIScope;
      if (!v17)
      {
LABEL_23:
        -[CHHapticEngine setActivateAudioSessionOnStart:](v14, "setActivateAudioSessionOnStart:", 0);
        -[CHHapticEngine updateEngineBehavior](v14, "updateEngineBehavior");
        v20 = -[CHMetrics initWithEngine:audioSessionID:sessionIsShared:isSPI:]([CHMetrics alloc], "initWithEngine:audioSessionID:sessionIsShared:isSPI:", v14, v6, v14->_sessionIsShared, 1);
        metrics = v14->_metrics;
        v14->_metrics = v20;
        goto LABEL_24;
      }
    }
    else
    {
      v17 = MEMORY[0x1E0C81028];
      v19 = MEMORY[0x1E0C81028];
    }
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315650;
      v26 = "CHHapticEngine.mm";
      v27 = 1024;
      v28 = 1433;
      v29 = 2080;
      v30 = "-[CHHapticEngine initWithAudioSessionID:options:error:]";
      _os_log_impl(&dword_1B573F000, v17, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: Setting behavior to not activate audio session (if haptics-only)", buf, 0x1Cu);
    }

    goto LABEL_23;
  }
LABEL_25:
  CALog::Scope::oslog((id *)kHAPIScope);
  v21 = objc_claimAutoreleasedReturnValue();
  v22 = v21;
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v21))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1B573F000, v22, OS_SIGNPOST_INTERVAL_END, v10, "HapticEngine_initWithAudioSessionID_options", (const char *)&unk_1B57A456E, buf, 2u);
  }

  return v14;
}

- (CHHapticEngine)initWithAudioSession:(id)a3 sessionIsShared:(BOOL)a4 error:(id *)a5
{
  _BOOL8 v6;
  id v8;
  void *v9;
  CHHapticEngine *v10;

  v6 = a4;
  v8 = a3;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjectsAndKeys:", CFSTR("Default"), CFSTR("Locality"), 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[CHHapticEngine initWithAudioSession:sessionIsShared:options:error:](self, "initWithAudioSession:sessionIsShared:options:error:", v8, v6, v9, a5);

  return v10;
}

- (id)createPlayerWithPattern:(CHHapticPattern *)pattern error:(NSError *)outError
{
  CHHapticPattern *v6;
  NSObject *v7;
  id v8;
  PatternPlayer *v9;
  int v11;
  const char *v12;
  __int16 v13;
  int v14;
  __int16 v15;
  const char *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v6 = pattern;
  if (kHAPIScope)
  {
    v7 = *(id *)kHAPIScope;
    if (!v7)
      goto LABEL_8;
  }
  else
  {
    v7 = MEMORY[0x1E0C81028];
    v8 = MEMORY[0x1E0C81028];
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    v11 = 136315650;
    v12 = "CHHapticEngine.mm";
    v13 = 1024;
    v14 = 1526;
    v15 = 2080;
    v16 = "-[CHHapticEngine createPlayerWithPattern:error:]";
    _os_log_impl(&dword_1B573F000, v7, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: Creating player from pattern", (uint8_t *)&v11, 0x1Cu);
  }

LABEL_8:
  if (self->_player)
  {
    v9 = -[PatternPlayer initWithPlayable:engine:privileged:error:]([PatternPlayer alloc], "initWithPlayable:engine:privileged:error:", v6, self, 0, outError);
  }
  else
  {
    _Haptic_Check((uint64_t)"/Library/Caches/com.apple.xbs/Sources/CoreHaptics/Source/CHHapticEngine.mm", 1527, "-[CHHapticEngine createPlayerWithPattern:error:]", "_player != nil", -4810, outError);
    v9 = 0;
  }

  return v9;
}

- (id)createAdvancedPlayerWithPattern:(CHHapticPattern *)pattern error:(NSError *)outError
{
  CHHapticPattern *v6;
  NSObject *v7;
  id v8;
  AdvancedPatternPlayer *v9;
  int v11;
  const char *v12;
  __int16 v13;
  int v14;
  __int16 v15;
  const char *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v6 = pattern;
  if (kHAPIScope)
  {
    v7 = *(id *)kHAPIScope;
    if (!v7)
      goto LABEL_8;
  }
  else
  {
    v7 = MEMORY[0x1E0C81028];
    v8 = MEMORY[0x1E0C81028];
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    v11 = 136315650;
    v12 = "CHHapticEngine.mm";
    v13 = 1024;
    v14 = 1533;
    v15 = 2080;
    v16 = "-[CHHapticEngine createAdvancedPlayerWithPattern:error:]";
    _os_log_impl(&dword_1B573F000, v7, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: Creating advanced player from pattern", (uint8_t *)&v11, 0x1Cu);
  }

LABEL_8:
  if (self->_player)
  {
    v9 = -[AdvancedPatternPlayer initWithPattern:engine:privileged:error:]([AdvancedPatternPlayer alloc], "initWithPattern:engine:privileged:error:", v6, self, 0, outError);
  }
  else
  {
    _Haptic_Check((uint64_t)"/Library/Caches/com.apple.xbs/Sources/CoreHaptics/Source/CHHapticEngine.mm", 1534, "-[CHHapticEngine createAdvancedPlayerWithPattern:error:]", "_player != nil", -4810, outError);
    v9 = 0;
  }

  return v9;
}

- (id)createAdvancedPlayerWithRingtoneData:(id)a3 error:(id *)a4
{
  id v6;
  NSObject *v7;
  id v8;
  AdvancedPatternPlayer *v9;
  int v11;
  const char *v12;
  __int16 v13;
  int v14;
  __int16 v15;
  const char *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (kHAPIScope)
  {
    v7 = *(id *)kHAPIScope;
    if (!v7)
      goto LABEL_8;
  }
  else
  {
    v7 = MEMORY[0x1E0C81028];
    v8 = MEMORY[0x1E0C81028];
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    v11 = 136315650;
    v12 = "CHHapticEngine.mm";
    v13 = 1024;
    v14 = 1542;
    v15 = 2080;
    v16 = "-[CHHapticEngine createAdvancedPlayerWithRingtoneData:error:]";
    _os_log_impl(&dword_1B573F000, v7, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: Creating advanced player from ringtone data", (uint8_t *)&v11, 0x1Cu);
  }

LABEL_8:
  if (self->_player)
  {
    v9 = -[AdvancedPatternPlayer initWithRingtoneData:engine:error:]([AdvancedPatternPlayer alloc], "initWithRingtoneData:engine:error:", v6, self, a4);
  }
  else
  {
    _Haptic_Check((uint64_t)"/Library/Caches/com.apple.xbs/Sources/CoreHaptics/Source/CHHapticEngine.mm", 1543, "-[CHHapticEngine createAdvancedPlayerWithRingtoneData:error:]", "_player != nil", -4810, a4);
    v9 = 0;
  }

  return v9;
}

- (id)createAdvancedPlayerWithVibePatternDictionary:(id)a3 error:(id *)a4
{
  id v6;
  NSObject *v7;
  id v8;
  AdvancedPatternPlayer *v9;
  int v11;
  const char *v12;
  __int16 v13;
  int v14;
  __int16 v15;
  const char *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (kHAPIScope)
  {
    v7 = *(id *)kHAPIScope;
    if (!v7)
      goto LABEL_8;
  }
  else
  {
    v7 = MEMORY[0x1E0C81028];
    v8 = MEMORY[0x1E0C81028];
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    v11 = 136315650;
    v12 = "CHHapticEngine.mm";
    v13 = 1024;
    v14 = 1551;
    v15 = 2080;
    v16 = "-[CHHapticEngine createAdvancedPlayerWithVibePatternDictionary:error:]";
    _os_log_impl(&dword_1B573F000, v7, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: Creating advanced player from vibe pattern dictionary", (uint8_t *)&v11, 0x1Cu);
  }

LABEL_8:
  if (self->_player)
  {
    v9 = -[AdvancedPatternPlayer initWithVibePatternDictionary:engine:error:]([AdvancedPatternPlayer alloc], "initWithVibePatternDictionary:engine:error:", v6, self, a4);
  }
  else
  {
    _Haptic_Check((uint64_t)"/Library/Caches/com.apple.xbs/Sources/CoreHaptics/Source/CHHapticEngine.mm", 1552, "-[CHHapticEngine createAdvancedPlayerWithVibePatternDictionary:error:]", "_player != nil", -4810, a4);
    v9 = 0;
  }

  return v9;
}

- (id)createAdvancedPlayerWithRingtonePattern:(id)a3 error:(id *)a4
{
  id v6;
  NSObject *v7;
  id v8;
  AdvancedPatternPlayer *v9;
  int v11;
  const char *v12;
  __int16 v13;
  int v14;
  __int16 v15;
  const char *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (kHAPIScope)
  {
    v7 = *(id *)kHAPIScope;
    if (!v7)
      goto LABEL_8;
  }
  else
  {
    v7 = MEMORY[0x1E0C81028];
    v8 = MEMORY[0x1E0C81028];
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    v11 = 136315650;
    v12 = "CHHapticEngine.mm";
    v13 = 1024;
    v14 = 1559;
    v15 = 2080;
    v16 = "-[CHHapticEngine createAdvancedPlayerWithRingtonePattern:error:]";
    _os_log_impl(&dword_1B573F000, v7, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: Creating advanced player from ringtone pattern", (uint8_t *)&v11, 0x1Cu);
  }

LABEL_8:
  if (self->_player)
  {
    v9 = -[AdvancedPatternPlayer initWithPattern:engine:privileged:error:]([AdvancedPatternPlayer alloc], "initWithPattern:engine:privileged:error:", v6, self, 1, a4);
  }
  else
  {
    _Haptic_Check((uint64_t)"/Library/Caches/com.apple.xbs/Sources/CoreHaptics/Source/CHHapticEngine.mm", 1560, "-[CHHapticEngine createAdvancedPlayerWithRingtonePattern:error:]", "_player != nil", -4810, a4);
    v9 = 0;
  }

  return v9;
}

- (BOOL)resourceIsRegistered:(unint64_t)a3
{
  return +[CHHapticEngine resourceIsRegistered:](CHHapticEngine, "resourceIsRegistered:", a3);
}

- (double)getDurationForResource:(unint64_t)a3
{
  std::mutex *v4;
  _QWORD *v5;
  _QWORD *v6;
  unint64_t v7;
  BOOL v8;
  _QWORD *v9;
  NSObject *v10;
  id v11;
  double v12;
  uint64_t v14;
  std::__shared_weak_count *v15;
  unint64_t *p_shared_owners;
  unint64_t v17;
  unint64_t v18;
  int v19;
  const char *v20;
  __int16 v21;
  int v22;
  __int16 v23;
  const char *v24;
  __int16 v25;
  int v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v4 = (std::mutex *)_sResourceMutex;
  std::mutex::lock((std::mutex *)_sResourceMutex);
  v5 = *(_QWORD **)(_sResourceEntries + 8);
  if (!v5)
    goto LABEL_12;
  v6 = (_QWORD *)(_sResourceEntries + 8);
  do
  {
    v7 = v5[4];
    v8 = v7 >= a3;
    if (v7 >= a3)
      v9 = v5;
    else
      v9 = v5 + 1;
    if (v8)
      v6 = v5;
    v5 = (_QWORD *)*v9;
  }
  while (*v9);
  if (v6 == (_QWORD *)(_sResourceEntries + 8) || v6[4] > a3)
  {
LABEL_12:
    if (kHAPIScope)
    {
      v10 = *(id *)kHAPIScope;
      if (!v10)
      {
LABEL_19:
        v12 = 0.0;
        goto LABEL_20;
      }
    }
    else
    {
      v10 = MEMORY[0x1E0C81028];
      v11 = MEMORY[0x1E0C81028];
    }
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v19 = 136315906;
      v20 = "CHHapticEngine.mm";
      v21 = 1024;
      v22 = 1583;
      v23 = 2080;
      v24 = "-[CHHapticEngine getDurationForResource:]";
      v25 = 1024;
      v26 = a3;
      _os_log_impl(&dword_1B573F000, v10, OS_LOG_TYPE_ERROR, "%25s:%-5d %s: Cannot find resource referenced by ID %u. Returning 0.0", (uint8_t *)&v19, 0x22u);
    }

    goto LABEL_19;
  }
  v14 = v6[5];
  v15 = (std::__shared_weak_count *)v6[6];
  if (v15)
  {
    p_shared_owners = (unint64_t *)&v15->__shared_owners_;
    do
      v17 = __ldxr(p_shared_owners);
    while (__stxr(v17 + 1, p_shared_owners));
    v12 = (double)*(unint64_t *)(v14 + 16) / *(double *)(v14 + 24);
    do
      v18 = __ldaxr(p_shared_owners);
    while (__stlxr(v18 - 1, p_shared_owners));
    if (!v18)
    {
      ((void (*)(std::__shared_weak_count *))v15->__on_zero_shared)(v15);
      std::__shared_weak_count::__release_weak(v15);
    }
  }
  else
  {
    v12 = (double)*(unint64_t *)(v14 + 16) / *(double *)(v14 + 24);
  }
LABEL_20:
  std::mutex::unlock(v4);
  return v12;
}

- (BOOL)isResourceLoopEnabled:(unint64_t)a3
{
  std::mutex *v4;
  _QWORD *v5;
  uint64_t v6;
  unint64_t v7;
  BOOL v8;
  _QWORD *v9;
  NSObject *v10;
  id v11;
  void *v12;
  void *v13;
  int v15;
  const char *v16;
  __int16 v17;
  int v18;
  __int16 v19;
  const char *v20;
  __int16 v21;
  int v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = (std::mutex *)_sResourceMutex;
  std::mutex::lock((std::mutex *)_sResourceMutex);
  v5 = *(_QWORD **)(_sResourceEntries + 8);
  if (!v5)
    goto LABEL_12;
  v6 = _sResourceEntries + 8;
  do
  {
    v7 = v5[4];
    v8 = v7 >= a3;
    if (v7 >= a3)
      v9 = v5;
    else
      v9 = v5 + 1;
    if (v8)
      v6 = (uint64_t)v5;
    v5 = (_QWORD *)*v9;
  }
  while (*v9);
  if (v6 != _sResourceEntries + 8 && *(_QWORD *)(v6 + 32) <= a3)
  {
    objc_msgSend(*(id *)(v6 + 56), "objectForKeyedSubscript:", CHHapticAudioResourceKeyLoopEnabled);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v12;
    if (v12)
      LOBYTE(v10) = objc_msgSend(v12, "BOOLValue");
    else
      LOBYTE(v10) = 0;

  }
  else
  {
LABEL_12:
    if (kHAPIScope)
    {
      v10 = *(id *)kHAPIScope;
      if (!v10)
        goto LABEL_23;
    }
    else
    {
      v10 = MEMORY[0x1E0C81028];
      v11 = MEMORY[0x1E0C81028];
    }
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v15 = 136315906;
      v16 = "CHHapticEngine.mm";
      v17 = 1024;
      v18 = 1595;
      v19 = 2080;
      v20 = "-[CHHapticEngine isResourceLoopEnabled:]";
      v21 = 1024;
      v22 = a3;
      _os_log_impl(&dword_1B573F000, v10, OS_LOG_TYPE_ERROR, "%25s:%-5d %s: Cannot find resource referenced by ID %u. Returning FALSE", (uint8_t *)&v15, 0x22u);
    }

    LOBYTE(v10) = 0;
  }
LABEL_23:
  std::mutex::unlock(v4);
  return (char)v10;
}

- (id)getMetricsForPlayer:(id)a3
{
  -[CHMetrics getMetricsForPlayer:](self->_metrics, "getMetricsForPlayer:", a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)setMetricsTestModeEnabled
{
  -[CHMetrics setMetricsTestModeEnabled](self->_metrics, "setMetricsTestModeEnabled");
}

- (__map_iterator<std::__tree_iterator<std::__value_type<unsigned)doFindPublicAudioResourceID:(unint64_t)a3
{
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned long, std::pair<NSURL *, NSDictionary *>>, void *>>> *p_pair1;
  _QWORD *v4;
  _QWORD *left;
  __map_iterator<std::__tree_iterator<std::__value_type<unsigned long, std::pair<NSURL *, NSDictionary *>>, std::__tree_node<std::__value_type<unsigned long, std::pair<NSURL *, NSDictionary *>>, void *> *, long>> v6;
  unint64_t v7;
  BOOL v8;
  _QWORD *v9;

  left = self->_publicAudioResources.__tree_.__pair1_.__value_.__left_;
  p_pair1 = &self->_publicAudioResources.__tree_.__pair1_;
  v4 = left;
  if (!left)
    return (__map_iterator<std::__tree_iterator<std::__value_type<unsigned long, std::pair<NSURL *, NSDictionary *>>, std::__tree_node<std::__value_type<unsigned long, std::pair<NSURL *, NSDictionary *>>, void *> *, long>>)p_pair1;
  v6.var0.var0 = p_pair1;
  do
  {
    v7 = v4[4];
    v8 = v7 >= a3;
    if (v7 >= a3)
      v9 = v4;
    else
      v9 = v4 + 1;
    if (v8)
      v6.var0.var0 = v4;
    v4 = (_QWORD *)*v9;
  }
  while (*v9);
  if (v6.var0.var0 == p_pair1 || *((_QWORD *)v6.var0.var0 + 4) > a3)
    return (__map_iterator<std::__tree_iterator<std::__value_type<unsigned long, std::pair<NSURL *, NSDictionary *>>, std::__tree_node<std::__value_type<unsigned long, std::pair<NSURL *, NSDictionary *>>, void *> *, long>>)p_pair1;
  return v6;
}

- (void)addPublicAudioResourceID:(unint64_t)a3 withURL:(id)a4 options:(id)a5
{
  int v6;
  id v8;
  id v9;
  NSObject *v10;
  id v11;
  uint64_t **p_publicAudioResources;
  id v13;
  id v14;
  unint64_t v15;
  _BYTE buf[18];
  __int16 v17;
  const char *v18;
  __int16 v19;
  CHHapticEngine *v20;
  __int16 v21;
  int v22;
  uint64_t v23;

  v6 = a3;
  v23 = *MEMORY[0x1E0C80C00];
  v15 = a3;
  v8 = a4;
  v9 = a5;
  if (kHAPIScope)
  {
    v10 = *(id *)kHAPIScope;
    if (!v10)
      goto LABEL_8;
  }
  else
  {
    v10 = MEMORY[0x1E0C81028];
    v11 = MEMORY[0x1E0C81028];
  }
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136316162;
    *(_QWORD *)&buf[4] = "CHHapticEngine.mm";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = 1636;
    v17 = 2080;
    v18 = "-[CHHapticEngine addPublicAudioResourceID:withURL:options:]";
    v19 = 2048;
    v20 = self;
    v21 = 1024;
    v22 = v6;
    _os_log_impl(&dword_1B573F000, v10, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: Engine %p adding resID %u to public resource list", buf, 0x2Cu);
  }

LABEL_8:
  if (&self->_publicAudioResources.__tree_.__pair1_ != (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned long, std::pair<NSURL *, NSDictionary *>>, void *>>> *)-[CHHapticEngine doFindPublicAudioResourceID:](self, "doFindPublicAudioResourceID:", v15))
    -[CHHapticEngine addPublicAudioResourceID:withURL:options:].cold.1();
  p_publicAudioResources = (uint64_t **)&self->_publicAudioResources;
  v13 = v8;
  *(_QWORD *)buf = v13;
  v14 = v9;
  *(_QWORD *)&buf[8] = v14;
  std::__tree<std::__value_type<unsigned long,std::pair<NSURL * {__strong},NSDictionary * {__strong}>>,std::__map_value_compare<unsigned long,std::__value_type<unsigned long,std::pair<NSURL * {__strong},NSDictionary * {__strong}>>,std::less<unsigned long>,true>,std::allocator<std::__value_type<unsigned long,std::pair<NSURL * {__strong},NSDictionary * {__strong}>>>>::__emplace_unique_key_args<unsigned long,unsigned long &,std::tuple<NSURL * {__strong},NSDictionary * {__strong}>>(p_publicAudioResources, &v15, &v15, (__int128 *)buf);

}

- (BOOL)hasPublicAudioResourceID:(unint64_t)a3
{
  int v3;
  __map_iterator<std::__tree_iterator<std::__value_type<unsigned long, std::pair<NSURL *, NSDictionary *>>, std::__tree_node<std::__value_type<unsigned long, std::pair<NSURL *, NSDictionary *>>, void *> *, long>> v5;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned long, std::pair<NSURL *, NSDictionary *>>, void *>>> *p_pair1;
  NSObject *v7;
  id v8;
  const char *v9;
  int v11;
  const char *v12;
  __int16 v13;
  int v14;
  __int16 v15;
  const char *v16;
  __int16 v17;
  CHHapticEngine *v18;
  __int16 v19;
  const char *v20;
  __int16 v21;
  int v22;
  uint64_t v23;

  v3 = a3;
  v23 = *MEMORY[0x1E0C80C00];
  v5.var0.var0 = (void *)-[CHHapticEngine doFindPublicAudioResourceID:](self, "doFindPublicAudioResourceID:");
  p_pair1 = &self->_publicAudioResources.__tree_.__pair1_;
  if (kHAPIScope)
  {
    v7 = *(id *)kHAPIScope;
    if (!v7)
      return p_pair1 != v5.var0.var0;
  }
  else
  {
    v7 = MEMORY[0x1E0C81028];
    v8 = MEMORY[0x1E0C81028];
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    v9 = "did not find";
    v11 = 136316418;
    v12 = "CHHapticEngine.mm";
    v13 = 1024;
    v14 = 1645;
    v16 = "-[CHHapticEngine hasPublicAudioResourceID:]";
    v15 = 2080;
    if (p_pair1 != v5.var0.var0)
      v9 = "found";
    v17 = 2048;
    v18 = self;
    v19 = 2080;
    v20 = v9;
    v21 = 1024;
    v22 = v3;
    _os_log_impl(&dword_1B573F000, v7, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: Engine %p %s resID %u", (uint8_t *)&v11, 0x36u);
  }

  return p_pair1 != v5.var0.var0;
}

- (unint64_t)idForPublicAudioResourceURL:(id)a3 withOptions:(id)a4
{
  id v6;
  id v7;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned long, std::pair<NSURL *, NSDictionary *>>, void *>>> *begin_node;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned long, std::pair<NSURL *, NSDictionary *>>, void *>>> *p_pair1;
  unint64_t left;
  id v11;
  id v12;
  void *v13;
  void *v14;
  char v15;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned long, std::pair<NSURL *, NSDictionary *>>, void *>>> *v16;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned long, std::pair<NSURL *, NSDictionary *>>, void *>>> *v17;
  BOOL v18;

  v6 = a3;
  v7 = a4;
  begin_node = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned long, std::pair<NSURL *, NSDictionary *>>, void *>>> *)self->_publicAudioResources.__tree_.__begin_node_;
  p_pair1 = &self->_publicAudioResources.__tree_.__pair1_;
  if (begin_node != &self->_publicAudioResources.__tree_.__pair1_)
  {
    do
    {
      left = (unint64_t)begin_node[4].__value_.__left_;
      v11 = begin_node[5].__value_.__left_;
      v12 = begin_node[6].__value_.__left_;
      objc_msgSend(v11, "absoluteString");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "absoluteString");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v13, "isEqualToString:", v14))
      {
        v15 = objc_msgSend(v12, "isEqualToDictionary:", v7);

        if ((v15 & 1) != 0)
          goto LABEL_13;
      }
      else
      {

      }
      v16 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned long, std::pair<NSURL *, NSDictionary *>>, void *>>> *)begin_node[1].__value_.__left_;
      if (v16)
      {
        do
        {
          v17 = v16;
          v16 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned long, std::pair<NSURL *, NSDictionary *>>, void *>>> *)v16->__value_.__left_;
        }
        while (v16);
      }
      else
      {
        do
        {
          v17 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned long, std::pair<NSURL *, NSDictionary *>>, void *>>> *)begin_node[2].__value_.__left_;
          v18 = v17->__value_.__left_ == begin_node;
          begin_node = v17;
        }
        while (!v18);
      }
      begin_node = v17;
    }
    while (v17 != p_pair1);
  }
  left = 0;
LABEL_13:

  return left;
}

- (void)removePublicAudioResourceID:(unint64_t)a3
{
  NSObject *v5;
  id v6;
  CHHapticEngine *v7;
  int v8;
  const char *v9;
  __int16 v10;
  int v11;
  __int16 v12;
  const char *v13;
  __int16 v14;
  CHHapticEngine *v15;
  __int16 v16;
  int v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  if (kHAPIScope)
  {
    v5 = *(id *)kHAPIScope;
    if (!v5)
      goto LABEL_8;
  }
  else
  {
    v5 = MEMORY[0x1E0C81028];
    v6 = MEMORY[0x1E0C81028];
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    v8 = 136316162;
    v9 = "CHHapticEngine.mm";
    v10 = 1024;
    v11 = 1661;
    v12 = 2080;
    v13 = "-[CHHapticEngine removePublicAudioResourceID:]";
    v14 = 2048;
    v15 = self;
    v16 = 1024;
    v17 = a3;
    _os_log_impl(&dword_1B573F000, v5, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: Engine %p removing resID %u from public resource list", (uint8_t *)&v8, 0x2Cu);
  }

LABEL_8:
  v7 = -[CHHapticEngine doFindPublicAudioResourceID:](self, "doFindPublicAudioResourceID:", a3);
  if (&self->_publicAudioResources.__tree_.__pair1_ == (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned long, std::pair<NSURL *, NSDictionary *>>, void *>>> *)v7)
    -[CHHapticEngine removePublicAudioResourceID:].cold.1();
  std::__tree<std::__value_type<unsigned long,std::pair<NSURL * {__strong},NSDictionary * {__strong}>>,std::__map_value_compare<unsigned long,std::__value_type<unsigned long,std::pair<NSURL * {__strong},NSDictionary * {__strong}>>,std::less<unsigned long>,true>,std::allocator<std::__value_type<unsigned long,std::pair<NSURL * {__strong},NSDictionary * {__strong}>>>>::erase((uint64_t **)&self->_publicAudioResources, (uint64_t)v7);
}

- (CHHapticAudioResourceID)registerAudioResource:(NSURL *)resourceURL options:(NSDictionary *)options error:(NSError *)outError
{
  NSURL *v8;
  NSDictionary *v9;
  void *v10;
  NSObject *v11;
  os_signpost_id_t v12;
  NSObject *v13;
  NSObject *v14;
  CHHapticEngine *v15;
  NSDictionary *v16;
  NSDictionary *v17;
  CHHapticAudioResourceID v18;
  void *v19;
  id v20;
  NSObject *v21;
  NSObject *v22;
  uint8_t v24[8];
  id v25;
  uint8_t buf[16];

  v8 = resourceURL;
  v9 = options;
  -[CHHapticEngine player](self, "player");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    CALog::Scope::oslog((id *)kHAPIScope);
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = os_signpost_id_make_with_pointer(v11, self);

    CALog::Scope::oslog((id *)kHAPIScope);
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = v13;
    if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1B573F000, v14, OS_SIGNPOST_INTERVAL_BEGIN, v12, "HapticEngine_registerAudioResource", " enableTelemetry=YES ", buf, 2u);
    }

    v15 = self;
    objc_sync_enter(v15);
    v16 = (NSDictionary *)MEMORY[0x1E0C9AA70];
    if (v9)
      v16 = v9;
    v17 = v16;

    v18 = -[CHHapticEngine idForPublicAudioResourceURL:withOptions:](v15, "idForPublicAudioResourceURL:withOptions:", v8, v17);
    if (!v18)
    {
      -[CHHapticEngine player](v15, "player");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = 0;
      v18 = +[CHHapticEngine doRegisterAudioResource:options:fromPattern:player:error:](CHHapticEngine, "doRegisterAudioResource:options:fromPattern:player:error:", v8, v17, 0, v19, &v25);
      v20 = v25;

      if (!v20 && v18)
        -[CHHapticEngine addPublicAudioResourceID:withURL:options:](v15, "addPublicAudioResourceID:withURL:options:", v18, v8, v17);
      if (outError)
        *outError = (NSError *)objc_retainAutorelease(v20);

    }
    objc_sync_exit(v15);

    CALog::Scope::oslog((id *)kHAPIScope);
    v21 = objc_claimAutoreleasedReturnValue();
    v22 = v21;
    if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v21))
    {
      *(_WORD *)v24 = 0;
      _os_signpost_emit_with_name_impl(&dword_1B573F000, v22, OS_SIGNPOST_INTERVAL_END, v12, "HapticEngine_registerAudioResource", (const char *)&unk_1B57A456E, v24, 2u);
    }

  }
  else
  {
    _Haptic_Check((uint64_t)"/Library/Caches/com.apple.xbs/Sources/CoreHaptics/Source/CHHapticEngine.mm", 1679, "-[CHHapticEngine registerAudioResource:options:error:]", "self.player != nil", -4810, outError);
    v18 = 0;
    v17 = v9;
  }

  return v18;
}

- (BOOL)unregisterAudioResource:(CHHapticAudioResourceID)resourceID error:(NSError *)outError
{
  void *v7;
  NSObject *v8;
  os_signpost_id_t v9;
  NSObject *v10;
  NSObject *v11;
  CHHapticEngine *v12;
  void *v13;
  _BOOL4 v14;
  BOOL v15;
  NSObject *v16;
  id v17;
  NSObject *v18;
  NSObject *v19;
  int v21;
  const char *v22;
  __int16 v23;
  int v24;
  __int16 v25;
  const char *v26;
  __int16 v27;
  int v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  -[CHHapticEngine player](self, "player");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    _Haptic_Check((uint64_t)"/Library/Caches/com.apple.xbs/Sources/CoreHaptics/Source/CHHapticEngine.mm", 1704, "-[CHHapticEngine unregisterAudioResource:error:]", "self.player != nil", -4810, outError);
    return 0;
  }
  CALog::Scope::oslog((id *)kHAPIScope);
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = os_signpost_id_make_with_pointer(v8, self);

  CALog::Scope::oslog((id *)kHAPIScope);
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    LOWORD(v21) = 0;
    _os_signpost_emit_with_name_impl(&dword_1B573F000, v11, OS_SIGNPOST_INTERVAL_BEGIN, v9, "HapticEngine_unregisterAudioResource", " enableTelemetry=YES ", (uint8_t *)&v21, 2u);
  }

  v12 = self;
  objc_sync_enter(v12);
  if (-[CHHapticEngine hasPublicAudioResourceID:](v12, "hasPublicAudioResourceID:", resourceID))
  {
    -[CHHapticEngine player](v12, "player");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = +[CHHapticEngine doUnregisterAudioResource:fromPattern:player:error:](CHHapticEngine, "doUnregisterAudioResource:fromPattern:player:error:", resourceID, 0, v13, outError);

    if (v14)
    {
      -[CHHapticEngine removePublicAudioResourceID:](v12, "removePublicAudioResourceID:", resourceID);
      v15 = 1;
      goto LABEL_19;
    }
    goto LABEL_18;
  }
  if (kHAPIScope)
  {
    v16 = *(id *)kHAPIScope;
    if (!v16)
      goto LABEL_16;
  }
  else
  {
    v16 = MEMORY[0x1E0C81028];
    v17 = MEMORY[0x1E0C81028];
  }
  if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
  {
    v21 = 136315906;
    v22 = "CHHapticEngine.mm";
    v23 = 1024;
    v24 = 1715;
    v25 = 2080;
    v26 = "-[CHHapticEngine unregisterAudioResource:error:]";
    v27 = 1024;
    v28 = resourceID;
    _os_log_impl(&dword_1B573F000, v16, OS_LOG_TYPE_ERROR, "%25s:%-5d %s: ERROR: audio resource ID %u not registered on this CHHapticEngine", (uint8_t *)&v21, 0x22u);
  }

LABEL_16:
  if (outError)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.CoreHaptics"), -4824, 0);
    v15 = 0;
    *outError = (NSError *)(id)objc_claimAutoreleasedReturnValue();
    goto LABEL_19;
  }
LABEL_18:
  v15 = 0;
LABEL_19:
  objc_sync_exit(v12);

  CALog::Scope::oslog((id *)kHAPIScope);
  v18 = objc_claimAutoreleasedReturnValue();
  v19 = v18;
  if (v9 - 1 < 0xFFFFFFFFFFFFFFFELL && os_signpost_enabled(v18))
  {
    LOWORD(v21) = 0;
    _os_signpost_emit_with_name_impl(&dword_1B573F000, v19, OS_SIGNPOST_INTERVAL_END, v9, "HapticEngine_unregisterAudioResource", (const char *)&unk_1B57A456E, (uint8_t *)&v21, 2u);
  }

  return v15;
}

- (void)doUnregisterAllPublicAudioResources
{
  NSObject *v3;
  id v4;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned long, std::pair<NSURL *, NSDictionary *>>, void *>>> *begin_node;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned long, std::pair<NSURL *, NSDictionary *>>, void *>>> *p_pair1;
  void *left;
  id v8;
  id v9;
  void *v10;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned long, std::pair<NSURL *, NSDictionary *>>, void *>>> *v11;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned long, std::pair<NSURL *, NSDictionary *>>, void *>>> *v12;
  BOOL v13;
  uint64_t v14;
  uint8_t buf[4];
  const char *v16;
  __int16 v17;
  int v18;
  __int16 v19;
  const char *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  if (self->_publicAudioResources.__tree_.__pair3_.__value_)
  {
    if (kHAPIScope)
    {
      v3 = *(id *)kHAPIScope;
      if (!v3)
        goto LABEL_9;
    }
    else
    {
      v3 = MEMORY[0x1E0C81028];
      v4 = MEMORY[0x1E0C81028];
    }
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315650;
      v16 = "CHHapticEngine.mm";
      v17 = 1024;
      v18 = 1725;
      v19 = 2080;
      v20 = "-[CHHapticEngine doUnregisterAllPublicAudioResources]";
      _os_log_impl(&dword_1B573F000, v3, OS_LOG_TYPE_INFO, "%25s:%-5d %s: Attempting to remove all remaining public audio resources for this engine", buf, 0x1Cu);
    }

  }
LABEL_9:
  begin_node = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned long, std::pair<NSURL *, NSDictionary *>>, void *>>> *)self->_publicAudioResources.__tree_.__begin_node_;
  p_pair1 = &self->_publicAudioResources.__tree_.__pair1_;
  if (begin_node != &self->_publicAudioResources.__tree_.__pair1_)
  {
    do
    {
      left = begin_node[4].__value_.__left_;
      v8 = begin_node[5].__value_.__left_;
      v9 = begin_node[6].__value_.__left_;
      -[CHHapticEngine player](self, "player");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 0;
      +[CHHapticEngine doUnregisterAudioResource:fromPattern:player:error:](CHHapticEngine, "doUnregisterAudioResource:fromPattern:player:error:", left, 0, v10, &v14);

      v11 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned long, std::pair<NSURL *, NSDictionary *>>, void *>>> *)begin_node[1].__value_.__left_;
      if (v11)
      {
        do
        {
          v12 = v11;
          v11 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned long, std::pair<NSURL *, NSDictionary *>>, void *>>> *)v11->__value_.__left_;
        }
        while (v11);
      }
      else
      {
        do
        {
          v12 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned long, std::pair<NSURL *, NSDictionary *>>, void *>>> *)begin_node[2].__value_.__left_;
          v13 = v12->__value_.__left_ == begin_node;
          begin_node = v12;
        }
        while (!v13);
      }
      begin_node = v12;
    }
    while (v12 != p_pair1);
  }
  std::__tree<std::__value_type<unsigned long,std::pair<NSURL * {__strong},NSDictionary * {__strong}>>,std::__map_value_compare<unsigned long,std::__value_type<unsigned long,std::pair<NSURL * {__strong},NSDictionary * {__strong}>>,std::less<unsigned long>,true>,std::allocator<std::__value_type<unsigned long,std::pair<NSURL * {__strong},NSDictionary * {__strong}>>>>::destroy((uint64_t)&self->_publicAudioResources, (_QWORD *)self->_publicAudioResources.__tree_.__pair1_.__value_.__left_);
  self->_publicAudioResources.__tree_.__pair1_.__value_.__left_ = 0;
  self->_publicAudioResources.__tree_.__pair3_.__value_ = 0;
  self->_publicAudioResources.__tree_.__begin_node_ = p_pair1;
}

- (BOOL)playPatternFromURL:(NSURL *)fileURL error:(NSError *)outError
{
  NSURL *v6;
  NSObject *v7;
  os_signpost_id_t v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  int v13;
  NSObject *v14;
  BOOL v15;
  NSObject *v16;
  NSObject *v17;
  id v18;
  CHHapticPattern *v19;
  id v20;
  CHHapticPattern *v21;
  id v22;
  id v23;
  void *v24;
  id v25;
  id v26;
  NSObject *v27;
  NSObject *v28;
  id v30;
  id v31;
  id v32;
  id v33;
  uint8_t buf[4];
  const char *v35;
  __int16 v36;
  int v37;
  __int16 v38;
  const char *v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v6 = fileURL;
  if (!self->_player)
  {
    _Haptic_Check((uint64_t)"/Library/Caches/com.apple.xbs/Sources/CoreHaptics/Source/CHHapticEngine.mm", 1736, "-[CHHapticEngine playPatternFromURL:error:]", "_player != nil", -4810, outError);
    v15 = 0;
    goto LABEL_43;
  }
  CALog::Scope::oslog((id *)kHAPIScope);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = os_signpost_id_make_with_pointer(v7, self);

  CALog::Scope::oslog((id *)kHAPIScope);
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1B573F000, v10, OS_SIGNPOST_INTERVAL_BEGIN, v8, "HapticEngine_playPatternFromURL", " enableTelemetry=YES ", buf, 2u);
  }

  if (v6)
  {
    if (-[NSURL isFileURL](v6, "isFileURL"))
    {
      -[NSURL path](v6, "path");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "pathExtension");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "isEqualToString:", CFSTR("plist"));

      if (v13)
      {
        if (kHAPIScope)
        {
          v14 = *(id *)kHAPIScope;
          if (!v14)
          {
LABEL_32:
            v33 = 0;
            v24 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D80]), "initWithContentsOfURL:error:", v6, &v33);
            v25 = v33;
            v32 = v25;
            v21 = -[CHHapticPattern initWithDictionary:error:]([CHHapticPattern alloc], "initWithDictionary:error:", v24, &v32);
            v20 = v32;

            goto LABEL_33;
          }
        }
        else
        {
          v14 = MEMORY[0x1E0C81028];
          v23 = MEMORY[0x1E0C81028];
        }
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 136315650;
          v35 = "CHHapticEngine.mm";
          v36 = 1024;
          v37 = 1743;
          v38 = 2080;
          v39 = "-[CHHapticEngine playPatternFromURL:error:]";
          _os_log_impl(&dword_1B573F000, v14, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: Creating haptic pattern from plist...", buf, 0x1Cu);
        }

        goto LABEL_32;
      }
    }
    if (kHAPIScope)
    {
      v16 = *(id *)kHAPIScope;
      if (!v16)
      {
LABEL_22:
        v31 = 0;
        v19 = -[CHHapticPattern initWithContentsOfURL:error:]([CHHapticPattern alloc], "initWithContentsOfURL:error:", v6, &v31);
        v20 = v31;
        v21 = v19;
LABEL_33:
        if (v21)
        {
          v30 = v20;
          v15 = -[CHHapticEngine doPlayPattern:error:](self, "doPlayPattern:error:", v21, &v30);
          v26 = v30;

          v20 = v26;
        }
        else
        {
          v15 = 0;
        }

        goto LABEL_37;
      }
    }
    else
    {
      v16 = MEMORY[0x1E0C81028];
      v18 = MEMORY[0x1E0C81028];
    }
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315650;
      v35 = "CHHapticEngine.mm";
      v36 = 1024;
      v37 = 1748;
      v38 = 2080;
      v39 = "-[CHHapticEngine playPatternFromURL:error:]";
      _os_log_impl(&dword_1B573F000, v16, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: Creating haptic pattern from JSON or AHAP...", buf, 0x1Cu);
    }

    goto LABEL_22;
  }
  if (!kHAPIScope)
  {
    v17 = MEMORY[0x1E0C81028];
    v22 = MEMORY[0x1E0C81028];
    goto LABEL_24;
  }
  v17 = *(id *)kHAPIScope;
  if (v17)
  {
LABEL_24:
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      v35 = "CHHapticEngine.mm";
      v36 = 1024;
      v37 = 1759;
      v38 = 2080;
      v39 = "-[CHHapticEngine playPatternFromURL:error:]";
      _os_log_impl(&dword_1B573F000, v17, OS_LOG_TYPE_ERROR, "%25s:%-5d %s: Incoming fileURL cannot be nil", buf, 0x1Cu);
    }

  }
  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.CoreHaptics"), -50, 0);
  v20 = (id)objc_claimAutoreleasedReturnValue();
  v15 = 0;
LABEL_37:
  if (outError)
    *outError = (NSError *)objc_retainAutorelease(v20);
  CALog::Scope::oslog((id *)kHAPIScope);
  v27 = objc_claimAutoreleasedReturnValue();
  v28 = v27;
  if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v27))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1B573F000, v28, OS_SIGNPOST_INTERVAL_END, v8, "HapticEngine_playPatternFromURL", (const char *)&unk_1B57A456E, buf, 2u);
  }

LABEL_43:
  return v15;
}

- (BOOL)playPatternFromData:(NSData *)data error:(NSError *)outError
{
  NSData *v6;
  NSObject *v7;
  os_signpost_id_t v8;
  NSObject *v9;
  NSObject *v10;
  unint64_t v11;
  void *v12;
  id v13;
  id v14;
  CHHapticPattern *v15;
  BOOL v16;
  id v17;
  NSObject *v18;
  id v19;
  NSObject *v20;
  NSObject *v21;
  NSObject *v22;
  id v23;
  NSObject *v24;
  id v26;
  id v27;
  id v28;
  id v29;
  uint8_t buf[4];
  const char *v31;
  __int16 v32;
  int v33;
  __int16 v34;
  const char *v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v6 = data;
  if (self->_player)
  {
    CALog::Scope::oslog((id *)kHAPIScope);
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = os_signpost_id_make_with_pointer(v7, self);

    CALog::Scope::oslog((id *)kHAPIScope);
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = v9;
    v11 = v8 - 1;
    if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1B573F000, v10, OS_SIGNPOST_INTERVAL_BEGIN, v8, "HapticEngine_playPatternFromData", " enableTelemetry=YES ", buf, 2u);
    }

    if (v6)
    {
      v29 = 0;
      objc_msgSend(MEMORY[0x1E0CB36D8], "JSONObjectWithData:options:error:", v6, 0, &v29);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = v29;
      if (v12)
        goto LABEL_9;
      v28 = 0;
      objc_msgSend(MEMORY[0x1E0CB38B0], "propertyListWithData:options:format:error:", v6, 0, 0, &v28);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = v28;

      if (v12)
      {
        v13 = v14;
LABEL_9:
        v27 = v13;
        v15 = -[CHHapticPattern initWithDictionary:error:]([CHHapticPattern alloc], "initWithDictionary:error:", v12, &v27);
        v14 = v27;

        if (v15)
        {
          v26 = v14;
          v16 = -[CHHapticEngine doPlayPattern:error:](self, "doPlayPattern:error:", v15, &v26);
          v17 = v26;

          v14 = v17;
        }
        else
        {
          v16 = 0;
        }

        if (!outError)
          goto LABEL_24;
        goto LABEL_23;
      }
      if (kHAPIScope)
      {
        v22 = *(id *)kHAPIScope;
        if (!v22)
        {
LABEL_34:
          if (outError)
          {
            objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.CoreHaptics"), -4814, 0);
            *outError = (NSError *)(id)objc_claimAutoreleasedReturnValue();
          }
          CALog::Scope::oslog((id *)kHAPIScope);
          v24 = objc_claimAutoreleasedReturnValue();
          v21 = v24;
          if (v11 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v24))
          {
            *(_WORD *)buf = 0;
            _os_signpost_emit_with_name_impl(&dword_1B573F000, v21, OS_SIGNPOST_INTERVAL_END, v8, "HapticEngine_playPatternFromData", (const char *)&unk_1B57A456E, buf, 2u);
          }
          v16 = 0;
          goto LABEL_40;
        }
      }
      else
      {
        v22 = MEMORY[0x1E0C81028];
        v23 = MEMORY[0x1E0C81028];
      }
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315650;
        v31 = "CHHapticEngine.mm";
        v32 = 1024;
        v33 = 1784;
        v34 = 2080;
        v35 = "-[CHHapticEngine playPatternFromData:error:]";
        _os_log_impl(&dword_1B573F000, v22, OS_LOG_TYPE_ERROR, "%25s:%-5d %s: Incoming NSData is invalid", buf, 0x1Cu);
      }

      goto LABEL_34;
    }
    if (kHAPIScope)
    {
      v18 = *(id *)kHAPIScope;
      if (!v18)
        goto LABEL_22;
    }
    else
    {
      v18 = MEMORY[0x1E0C81028];
      v19 = MEMORY[0x1E0C81028];
    }
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      v31 = "CHHapticEngine.mm";
      v32 = 1024;
      v33 = 1799;
      v34 = 2080;
      v35 = "-[CHHapticEngine playPatternFromData:error:]";
      _os_log_impl(&dword_1B573F000, v18, OS_LOG_TYPE_ERROR, "%25s:%-5d %s: Incoming NSData cannot be nil", buf, 0x1Cu);
    }

LABEL_22:
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.CoreHaptics"), -50, 0);
    v14 = (id)objc_claimAutoreleasedReturnValue();
    v16 = 0;
    if (!outError)
    {
LABEL_24:
      CALog::Scope::oslog((id *)kHAPIScope);
      v20 = objc_claimAutoreleasedReturnValue();
      v21 = v20;
      if (v11 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v20))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1B573F000, v21, OS_SIGNPOST_INTERVAL_END, v8, "HapticEngine_playPatternFromData", (const char *)&unk_1B57A456E, buf, 2u);
      }
LABEL_40:

      goto LABEL_41;
    }
LABEL_23:
    *outError = (NSError *)objc_retainAutorelease(v14);
    goto LABEL_24;
  }
  _Haptic_Check((uint64_t)"/Library/Caches/com.apple.xbs/Sources/CoreHaptics/Source/CHHapticEngine.mm", 1771, "-[CHHapticEngine playPatternFromData:error:]", "_player != nil", -4810, outError);
  v16 = 0;
LABEL_41:

  return v16;
}

- (BOOL)doPlayPattern:(id)a3 error:(id *)a4
{
  id v6;
  NSObject *v7;
  id v8;
  void *v9;
  NSObject *v10;
  BOOL v11;
  id v12;
  NSObject *v13;
  NSObject *v14;
  dispatch_time_t v15;
  intptr_t v16;
  void *v17;
  id *v18;
  void *v19;
  id v20;
  _QWORD v22[4];
  NSObject *v23;
  id v24;
  _BYTE *v25;
  uint64_t *v26;
  id v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  char v31;
  uint8_t v32[4];
  const char *v33;
  __int16 v34;
  int v35;
  __int16 v36;
  const char *v37;
  _BYTE buf[32];
  void (*v39)(uint64_t);
  id v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (kHAPIScope)
  {
    v7 = *(id *)kHAPIScope;
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
    *(_QWORD *)&buf[4] = "CHHapticEngine.mm";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = 1812;
    *(_WORD *)&buf[18] = 2080;
    *(_QWORD *)&buf[20] = "-[CHHapticEngine doPlayPattern:error:]";
    _os_log_impl(&dword_1B573F000, v7, OS_LOG_TYPE_INFO, "%25s:%-5d %s: Creating Pattern Player", buf, 0x1Cu);
  }

LABEL_8:
  -[CHHapticEngine createPlayerWithPattern:error:](self, "createPlayerWithPattern:error:", v6, a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v9)
  {
    v11 = 0;
    goto LABEL_26;
  }
  v28 = 0;
  v29 = &v28;
  v30 = 0x2020000000;
  v31 = 0;
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x3032000000;
  *(_QWORD *)&buf[24] = __Block_byref_object_copy__3;
  v39 = __Block_byref_object_dispose__3;
  v40 = 0;
  if (!kHAPIScope)
  {
    v10 = MEMORY[0x1E0C81028];
    v12 = MEMORY[0x1E0C81028];
    goto LABEL_14;
  }
  v10 = *(id *)kHAPIScope;
  if (v10)
  {
LABEL_14:
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)v32 = 136315650;
      v33 = "CHHapticEngine.mm";
      v34 = 1024;
      v35 = 1822;
      v36 = 2080;
      v37 = "-[CHHapticEngine doPlayPattern:error:]";
      _os_log_impl(&dword_1B573F000, v10, OS_LOG_TYPE_INFO, "%25s:%-5d %s: Starting CHHapticEngine...", v32, 0x1Cu);
    }

  }
  v13 = dispatch_group_create();
  dispatch_group_enter(v13);
  objc_initWeak((id *)v32, self);
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __38__CHHapticEngine_doPlayPattern_error___block_invoke;
  v22[3] = &unk_1E69609A0;
  v25 = buf;
  v14 = v13;
  v23 = v14;
  objc_copyWeak(&v27, (id *)v32);
  v26 = &v28;
  v24 = v9;
  -[CHHapticEngine startWithCompletionHandler:](self, "startWithCompletionHandler:", v22);
  v15 = dispatch_time(0, 4000000000);
  v16 = dispatch_group_wait(v14, v15);
  v18 = (id *)(*(_QWORD *)&buf[8] + 40);
  v17 = *(void **)(*(_QWORD *)&buf[8] + 40);
  if (a4 && v17)
  {
    v11 = 0;
    *a4 = objc_retainAutorelease(v17);
  }
  else
  {
    if (v16)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.CoreHaptics"), -4808, 0);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = v19;
      objc_storeStrong(v18, v19);
      *((_BYTE *)v29 + 24) = 0;
    }
    if (a4)
      *a4 = objc_retainAutorelease(*(id *)(*(_QWORD *)&buf[8] + 40));
    v11 = *((_BYTE *)v29 + 24) != 0;
  }

  objc_destroyWeak(&v27);
  objc_destroyWeak((id *)v32);

  _Block_object_dispose(buf, 8);
  _Block_object_dispose(&v28, 8);
LABEL_26:

  return v11;
}

void __38__CHHapticEngine_doPlayPattern_error___block_invoke(uint64_t a1, void *a2)
{
  id v4;
  NSObject *v5;
  id WeakRetained;
  id v7;
  uint64_t v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  _BYTE location[12];
  __int16 v17;
  int v18;
  __int16 v19;
  const char *v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  if (v4)
  {
    if (kHAPIScope)
    {
      v5 = *(id *)kHAPIScope;
      if (!v5)
      {
LABEL_10:
        objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), a2);
        dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
        goto LABEL_11;
      }
    }
    else
    {
      v5 = MEMORY[0x1E0C81028];
      v9 = MEMORY[0x1E0C81028];
    }
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)location = 136315906;
      *(_QWORD *)&location[4] = "CHHapticEngine.mm";
      v17 = 1024;
      v18 = 1829;
      v19 = 2080;
      v20 = "-[CHHapticEngine doPlayPattern:error:]_block_invoke";
      v21 = 2112;
      v22 = v4;
      _os_log_impl(&dword_1B573F000, v5, OS_LOG_TYPE_ERROR, "%25s:%-5d %s: Cannot start haptic engine: error %@", location, 0x26u);
    }

    goto LABEL_10;
  }
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  objc_initWeak((id *)location, WeakRetained);
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __38__CHHapticEngine_doPlayPattern_error___block_invoke_176;
  v10[3] = &unk_1E6960978;
  objc_copyWeak(&v15, (id *)location);
  v13 = *(_QWORD *)(a1 + 56);
  v7 = *(id *)(a1 + 40);
  v8 = *(_QWORD *)(a1 + 48);
  v11 = v7;
  v14 = v8;
  v12 = *(id *)(a1 + 32);
  objc_msgSend(WeakRetained, "dispatchOnLocal:", v10);

  objc_destroyWeak(&v15);
  objc_destroyWeak((id *)location);

LABEL_11:
}

void __38__CHHapticEngine_doPlayPattern_error___block_invoke_176(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  double v4;
  double v5;
  NSObject *v6;
  id v7;
  void *v8;
  uint64_t v9;
  char v10;
  id obj;
  uint8_t buf[4];
  const char *v13;
  __int16 v14;
  int v15;
  __int16 v16;
  const char *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "currentTime");
    v5 = v4;
    if (kHAPIScope)
    {
      v6 = *(id *)kHAPIScope;
      if (!v6)
      {
LABEL_9:
        v8 = *(void **)(a1 + 32);
        v9 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
        obj = *(id *)(v9 + 40);
        v10 = objc_msgSend(v8, "startAtTime:error:", &obj, v5);
        objc_storeStrong((id *)(v9 + 40), obj);
        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = v10;
        goto LABEL_10;
      }
    }
    else
    {
      v6 = MEMORY[0x1E0C81028];
      v7 = MEMORY[0x1E0C81028];
    }
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315650;
      v13 = "CHHapticEngine.mm";
      v14 = 1024;
      v15 = 1841;
      v16 = 2080;
      v17 = "-[CHHapticEngine doPlayPattern:error:]_block_invoke";
      _os_log_impl(&dword_1B573F000, v6, OS_LOG_TYPE_INFO, "%25s:%-5d %s: Starting Pattern Player...", buf, 0x1Cu);
    }

    goto LABEL_9;
  }
LABEL_10:
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));

}

- (CHHapticEngineResetHandler)resetHandler
{
  return objc_getProperty(self, a2, 80, 1);
}

- (AVAudioSession)avAudioSession
{
  return (AVAudioSession *)objc_getProperty(self, a2, 16, 1);
}

- (unsigned)audioSessionID
{
  return self->_audioSessionID;
}

- (NSString)usageCategory
{
  return (NSString *)objc_getProperty(self, a2, 152, 1);
}

- (OS_dispatch_source)timer
{
  return (OS_dispatch_source *)objc_getProperty(self, a2, 64, 1);
}

- (void)setTimer:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 64);
}

- (NSString)priority
{
  return (NSString *)objc_getProperty(self, a2, 128, 1);
}

- (NSString)hapticPowerUsage
{
  return (NSString *)objc_getProperty(self, a2, 136, 1);
}

- (NSString)audioPowerUsage
{
  return (NSString *)objc_getProperty(self, a2, 144, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metrics, 0);
  objc_storeStrong((id *)&self->_usageCategory, 0);
  objc_storeStrong((id *)&self->_audioPowerUsage, 0);
  objc_storeStrong((id *)&self->_hapticPowerUsage, 0);
  objc_storeStrong((id *)&self->_priority, 0);
  objc_storeStrong((id *)&self->_serverConfig, 0);
  objc_storeStrong(&self->_clientFinishedHandler, 0);
  objc_storeStrong(&self->_resetHandler, 0);
  objc_storeStrong(&self->_stoppedHandler, 0);
  objc_storeStrong((id *)&self->_timer, 0);
  objc_storeStrong((id *)&self->_player, 0);
  std::__tree<std::__value_type<unsigned long,std::pair<NSURL * {__strong},NSDictionary * {__strong}>>,std::__map_value_compare<unsigned long,std::__value_type<unsigned long,std::pair<NSURL * {__strong},NSDictionary * {__strong}>>,std::less<unsigned long>,true>,std::allocator<std::__value_type<unsigned long,std::pair<NSURL * {__strong},NSDictionary * {__strong}>>>>::destroy((uint64_t)&self->_publicAudioResources, (_QWORD *)self->_publicAudioResources.__tree_.__pair1_.__value_.__left_);
  objc_storeStrong((id *)&self->_avAudioSession, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
}

+ (void)dispatchOnGlobal:(id)a3
{
  id v3;
  NSObject *v4;
  id v5;
  _QWORD block[4];
  id v7;

  v3 = a3;
  dispatch_get_global_queue(0, 0);
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __59__CHHapticEngine_CHHapticEngineInternal__dispatchOnGlobal___block_invoke;
  block[3] = &unk_1E6960150;
  v7 = v3;
  v5 = v3;
  dispatch_async(v4, block);

}

uint64_t __59__CHHapticEngine_CHHapticEngineInternal__dispatchOnGlobal___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (BOOL)activateAudioSessionOnStart
{
  return !-[CHHapticEngine isBehaviorSet:](self, "isBehaviorSet:", 4);
}

- (void)dispatchSyncOnLocal:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  void *v7;
  NSObject *dispatchQueue;
  id v9;
  _QWORD block[4];
  id v11;
  uint8_t buf[4];
  const char *v13;
  __int16 v14;
  int v15;
  __int16 v16;
  const char *v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (kHAPIScope)
  {
    if ((*(_BYTE *)(kHAPIScope + 8) & 1) != 0)
    {
      v5 = *(id *)kHAPIScope;
      if (v5)
      {
        v6 = v5;
        if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
        {
          v7 = (void *)MEMORY[0x1B5E4F2B4](v4);
          *(_DWORD *)buf = 136315906;
          v13 = "CHHapticEngine.mm";
          v14 = 1024;
          v15 = 1915;
          v16 = 2080;
          v17 = "-[CHHapticEngine(CHHapticEngineInternal) dispatchSyncOnLocal:]";
          v18 = 2048;
          v19 = v7;
          _os_log_impl(&dword_1B573F000, v6, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: <Dispatching block %p sync...>", buf, 0x26u);

        }
      }
    }
  }
  in_dispatch_sync = 1;
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __62__CHHapticEngine_CHHapticEngineInternal__dispatchSyncOnLocal___block_invoke;
  block[3] = &unk_1E6960150;
  v11 = v4;
  v9 = v4;
  dispatch_sync(dispatchQueue, block);
  in_dispatch_sync = 0;

}

void __62__CHHapticEngine_CHHapticEngineInternal__dispatchSyncOnLocal___block_invoke(uint64_t a1)
{
  NSObject *v1;
  NSObject *v2;
  int v3;
  const char *v4;
  __int16 v5;
  int v6;
  __int16 v7;
  const char *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  if (kHAPIScope)
  {
    if ((*(_BYTE *)(kHAPIScope + 8) & 1) != 0)
    {
      v1 = *(id *)kHAPIScope;
      if (v1)
      {
        v2 = v1;
        if (os_log_type_enabled(v1, OS_LOG_TYPE_DEBUG))
        {
          v3 = 136315650;
          v4 = "CHHapticEngine.mm";
          v5 = 1024;
          v6 = 1919;
          v7 = 2080;
          v8 = "-[CHHapticEngine(CHHapticEngineInternal) dispatchSyncOnLocal:]_block_invoke";
          _os_log_impl(&dword_1B573F000, v2, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: <Block sync dispatch complete>", (uint8_t *)&v3, 0x1Cu);
        }

      }
    }
  }
}

- (BOOL)checkEngineRunning:(id *)a3
{
  BOOL v4;

  v4 = -[CHHapticEngine running](self, "running");
  if (!v4)
    _Haptic_Check((uint64_t)"/Library/Caches/com.apple.xbs/Sources/CoreHaptics/Source/CHHapticEngine.mm", 1938, "-[CHHapticEngine(CHHapticEngineInternal) checkEngineRunning:]", "self.running", -4805, a3);
  return v4;
}

void __69__CHHapticEngine_CHHapticEngineInternal__notifyPlayerStarted_atTime___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id v5;
  id WeakRetained;
  NSObject *v7;
  id v8;
  NSObject *v9;
  id v10;
  int v11;
  const char *v12;
  __int16 v13;
  int v14;
  __int16 v15;
  const char *v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (kHAPIScope)
  {
    v4 = *(id *)kHAPIScope;
    if (!v4)
      goto LABEL_8;
  }
  else
  {
    v4 = MEMORY[0x1E0C81028];
    v5 = MEMORY[0x1E0C81028];
  }
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    v11 = 136315650;
    v12 = "CHHapticEngine.mm";
    v13 = 1024;
    v14 = 1954;
    v15 = 2080;
    v16 = "-[CHHapticEngine(CHHapticEngineInternal) notifyPlayerStarted:atTime:]_block_invoke_2";
    _os_log_impl(&dword_1B573F000, v4, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: <Top of AV finishWithCompletionHandler block>", (uint8_t *)&v11, 0x1Cu);
  }

LABEL_8:
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (!v3)
    goto LABEL_16;
  if (kHAPIScope)
  {
    v7 = *(id *)kHAPIScope;
    if (!v7)
      goto LABEL_16;
  }
  else
  {
    v7 = MEMORY[0x1E0C81028];
    v8 = MEMORY[0x1E0C81028];
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    v11 = 136315906;
    v12 = "CHHapticEngine.mm";
    v13 = 1024;
    v14 = 1956;
    v15 = 2080;
    v16 = "-[CHHapticEngine(CHHapticEngineInternal) notifyPlayerStarted:atTime:]_block_invoke";
    v17 = 2112;
    v18 = v3;
    _os_log_impl(&dword_1B573F000, v7, OS_LOG_TYPE_ERROR, "%25s:%-5d %s: finishWithCompletionHandler callback returned error: %@", (uint8_t *)&v11, 0x26u);
  }

LABEL_16:
  if (WeakRetained)
    objc_msgSend(WeakRetained, "handleFinish:", v3);
  if (kHAPIScope)
  {
    v9 = *(id *)kHAPIScope;
    if (!v9)
      goto LABEL_25;
  }
  else
  {
    v9 = MEMORY[0x1E0C81028];
    v10 = MEMORY[0x1E0C81028];
  }
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    v11 = 136315650;
    v12 = "CHHapticEngine.mm";
    v13 = 1024;
    v14 = 1960;
    v15 = 2080;
    v16 = "-[CHHapticEngine(CHHapticEngineInternal) notifyPlayerStarted:atTime:]_block_invoke";
    _os_log_impl(&dword_1B573F000, v9, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: <Bottom of AV finishWithCompletionHandler block>", (uint8_t *)&v11, 0x1Cu);
  }

LABEL_25:
}

- (void)notifyPlayerStopped:(id)a3 atTime:(double)a4
{
  id v5;
  NSObject *v6;
  id v7;
  int v8;
  const char *v9;
  __int16 v10;
  int v11;
  __int16 v12;
  const char *v13;
  __int16 v14;
  id v15;
  __int16 v16;
  double v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (kHAPIScope)
  {
    v6 = *(id *)kHAPIScope;
    if (!v6)
      goto LABEL_8;
  }
  else
  {
    v6 = MEMORY[0x1E0C81028];
    v7 = MEMORY[0x1E0C81028];
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    v8 = 136316162;
    v9 = "CHHapticEngine.mm";
    v10 = 1024;
    v11 = 1968;
    v12 = 2080;
    v13 = "-[CHHapticEngine(CHHapticEngineInternal) notifyPlayerStopped:atTime:]";
    v14 = 2048;
    v15 = v5;
    v16 = 2048;
    v17 = a4;
    _os_log_impl(&dword_1B573F000, v6, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: player %p notified engine it will be stopping at time %.3f", (uint8_t *)&v8, 0x30u);
  }

LABEL_8:
}

- (BOOL)doReferenceAudioResourceByID:(unint64_t)a3
{
  NSObject *v4;
  id v5;
  std::mutex *v6;
  _QWORD *v7;
  _QWORD *v8;
  _QWORD *v9;
  BOOL v10;
  NSObject *v11;
  BOOL v12;
  id v13;
  id v15;
  int v16;
  int v17;
  const char *v18;
  __int16 v19;
  int v20;
  __int16 v21;
  const char *v22;
  __int16 v23;
  int v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  +[CHHapticEngine lazyInitResourceMap](CHHapticEngine, "lazyInitResourceMap");
  if (kHAPIScope)
  {
    v4 = *(id *)kHAPIScope;
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
    v17 = 136315906;
    v18 = "CHHapticEngine.mm";
    v19 = 1024;
    v20 = 1993;
    v21 = 2080;
    v22 = "-[CHHapticEngine(CHHapticEngineInternal) doReferenceAudioResourceByID:]";
    v23 = 1024;
    v24 = a3;
    _os_log_impl(&dword_1B573F000, v4, OS_LOG_TYPE_INFO, "%25s:%-5d %s: Adding reference to audio resource ID %u from pattern", (uint8_t *)&v17, 0x22u);
  }

LABEL_8:
  v6 = (std::mutex *)_sResourceMutex;
  std::mutex::lock((std::mutex *)_sResourceMutex);
  v7 = *(_QWORD **)_sResourceEntries;
  if (*(_QWORD *)_sResourceEntries != _sResourceEntries + 8)
  {
    while (v7[4] != a3)
    {
      v8 = (_QWORD *)v7[1];
      if (v8)
      {
        do
        {
          v9 = v8;
          v8 = (_QWORD *)*v8;
        }
        while (v8);
      }
      else
      {
        do
        {
          v9 = (_QWORD *)v7[2];
          v10 = *v9 == (_QWORD)v7;
          v7 = v9;
        }
        while (!v10);
      }
      v7 = v9;
      if (v9 == (_QWORD *)(_sResourceEntries + 8))
        goto LABEL_16;
    }
    ++*((_DWORD *)v7 + 16);
    if (kHAPIScope)
    {
      v11 = *(id *)kHAPIScope;
      if (!v11)
      {
        v12 = 1;
        goto LABEL_27;
      }
    }
    else
    {
      v11 = MEMORY[0x1E0C81028];
      v15 = MEMORY[0x1E0C81028];
    }
    v12 = 1;
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      v16 = *((_DWORD *)v7 + 16);
      v17 = 136315906;
      v18 = "CHHapticEngine.mm";
      v19 = 1024;
      v20 = 1998;
      v21 = 2080;
      v22 = "-[CHHapticEngine(CHHapticEngineInternal) doReferenceAudioResourceByID:]";
      v23 = 1024;
      v24 = v16;
      _os_log_impl(&dword_1B573F000, v11, OS_LOG_TYPE_INFO, "%25s:%-5d %s:    found it - reference count now %u", (uint8_t *)&v17, 0x22u);
    }
LABEL_26:

    goto LABEL_27;
  }
LABEL_16:
  if (!kHAPIScope)
  {
    v11 = MEMORY[0x1E0C81028];
    v13 = MEMORY[0x1E0C81028];
    goto LABEL_23;
  }
  v11 = *(id *)kHAPIScope;
  if (v11)
  {
LABEL_23:
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      v17 = 136315906;
      v18 = "CHHapticEngine.mm";
      v19 = 1024;
      v20 = 2002;
      v21 = 2080;
      v22 = "-[CHHapticEngine(CHHapticEngineInternal) doReferenceAudioResourceByID:]";
      v23 = 1024;
      v24 = a3;
      _os_log_impl(&dword_1B573F000, v11, OS_LOG_TYPE_INFO, "%25s:%-5d %s: Resource ID %u not previously registered!", (uint8_t *)&v17, 0x22u);
    }
    v12 = 0;
    goto LABEL_26;
  }
  v12 = 0;
LABEL_27:
  std::mutex::unlock(v6);
  return v12;
}

+ (unint64_t)doRegisterAudioResource:(id)a3 options:(id)a4 fromPattern:(BOOL)a5 player:(id)a6 error:(id *)a7
{
  unint64_t v7;
  NSURL *v10;
  NSObject *v11;
  id v12;
  const char *v13;
  _QWORD *v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t *v17;
  unint64_t v18;
  id v19;
  id v20;
  void *v21;
  id v22;
  NSObject *v23;
  id v24;
  void *v25;
  uint64_t v26;
  int v27;
  id v28;
  void *v29;
  void *v30;
  int v31;
  NSObject *v32;
  NSObject *v33;
  id v34;
  uint64_t v35;
  id v36;
  id v37;
  uint64_t v38;
  uint64_t v39;
  NSObject *v40;
  NSObject *v41;
  id v42;
  void *v43;
  id v44;
  NSObject *v45;
  void *v46;
  NSObject *v47;
  id v48;
  id v49;
  uint64_t v50;
  uint64_t **v51;
  uint64_t v52;
  unint64_t *v53;
  unint64_t v54;
  unint64_t *v55;
  char v56;
  char v57;
  std::__shared_weak_count *v58;
  unint64_t *v59;
  unint64_t v60;
  std::__shared_weak_count *v61;
  unint64_t *v62;
  unint64_t v63;
  _QWORD *v64;
  _QWORD *v65;
  BOOL v66;
  NSObject *v67;
  id v68;
  __int128 v69;
  std::__shared_weak_count *v70;
  unint64_t *p_shared_owners;
  unint64_t v72;
  std::__shared_weak_count *v73;
  unint64_t *v74;
  unint64_t v75;
  int v76;
  int v77;
  AVFASoftLink *v78;
  int v79;
  void *v80;
  uint64_t v81;
  NSObject *v82;
  id v83;
  const char *v84;
  id *v85;
  uint64_t **v86;
  unint64_t *v87;
  unint64_t *v88;
  unint64_t v89;
  char v90;
  char v91;
  std::__shared_weak_count *v92;
  unint64_t *v93;
  unint64_t v94;
  std::__shared_weak_count *v95;
  unint64_t *v96;
  unint64_t v97;
  _BOOL4 v99;
  std::mutex *v100;
  id v101;
  id v103;
  _QWORD v104[6];
  id *v105;
  id **v106;
  uint64_t v107;
  uint64_t v108;
  __int128 v109;
  __int128 v110;
  uint64_t v111;
  char *v112;
  _QWORD v113[6];
  _QWORD v114[5];
  AudioResource *v115[2];
  NSURL *v116;
  _BYTE buf[54];
  _BYTE v118[48];
  uint64_t v119;

  v99 = a5;
  v119 = *MEMORY[0x1E0C80C00];
  v10 = (NSURL *)a3;
  v116 = v10;
  v103 = a4;
  v101 = a6;
  +[CHHapticEngine lazyInitResourceMap](CHHapticEngine, "lazyInitResourceMap");
  if (kHAPIScope)
  {
    v11 = *(id *)kHAPIScope;
    if (!v11)
      goto LABEL_10;
  }
  else
  {
    v11 = MEMORY[0x1E0C81028];
    v12 = MEMORY[0x1E0C81028];
  }
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    v13 = "Public";
    *(_DWORD *)buf = 136316162;
    *(_QWORD *)&buf[4] = "CHHapticEngine.mm";
    if (v99)
      v13 = "Pattern";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = 2010;
    *(_WORD *)&buf[18] = 2080;
    *(_QWORD *)&buf[20] = "+[CHHapticEngine(CHHapticEngineInternal) doRegisterAudioResource:options:fromPattern:player:error:]";
    *(_WORD *)&buf[28] = 2080;
    *(_QWORD *)&buf[30] = v13;
    *(_WORD *)&buf[38] = 2112;
    *(_QWORD *)&buf[40] = v10;
    _os_log_impl(&dword_1B573F000, v11, OS_LOG_TYPE_INFO, "%25s:%-5d %s: Registering %s audio resource '%@'", buf, 0x30u);
  }

LABEL_10:
  v100 = (std::mutex *)_sResourceMutex;
  std::mutex::lock((std::mutex *)_sResourceMutex);
  v115[0] = 0;
  v115[1] = 0;
  v15 = _sResourceEntries + 8;
  v14 = *(_QWORD **)_sResourceEntries;
  if (*(_QWORD *)_sResourceEntries != _sResourceEntries + 8)
  {
    do
    {
      v16 = v14[6];
      v105 = (id *)v14[5];
      v106 = (id **)v16;
      if (v16)
      {
        v17 = (unint64_t *)(v16 + 8);
        do
          v18 = __ldxr(v17);
        while (__stxr(v18 + 1, v17));
      }
      v19 = (id)v14[7];
      if (kHAPIScope)
      {
        v20 = *(id *)kHAPIScope;
        if (!v20)
          goto LABEL_21;
      }
      else
      {
        v21 = (void *)MEMORY[0x1E0C81028];
        v22 = MEMORY[0x1E0C81028];
        v20 = v21;
      }
      v23 = v20;
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
      {
        v24 = *v105;
        objc_msgSend(v24, "absoluteString");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = v14[4];
        v27 = *((_DWORD *)v14 + 16);
        *(_DWORD *)buf = 136316418;
        *(_QWORD *)&buf[4] = "CHHapticEngine.mm";
        *(_WORD *)&buf[12] = 1024;
        *(_DWORD *)&buf[14] = 2018;
        *(_WORD *)&buf[18] = 2080;
        *(_QWORD *)&buf[20] = "+[CHHapticEngine(CHHapticEngineInternal) doRegisterAudioResource:options:fromPattern:player:error:]";
        *(_WORD *)&buf[28] = 2112;
        *(_QWORD *)&buf[30] = v25;
        *(_WORD *)&buf[38] = 1024;
        *(_DWORD *)&buf[40] = v26;
        *(_WORD *)&buf[44] = 1024;
        *(_DWORD *)&buf[46] = v27;
        _os_log_impl(&dword_1B573F000, v23, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: -- Entry list has '%@' with ID %u, and count %u", buf, 0x32u);

      }
LABEL_21:
      v28 = *v105;
      objc_msgSend(v28, "absoluteString");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSURL absoluteString](v116, "absoluteString");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = objc_msgSend(v29, "isEqualToString:", v30);

      if (v31)
      {
        std::shared_ptr<AudioResource>::operator=[abi:ne180100](v115, (uint64_t *)&v105);
        if (!objc_msgSend(v103, "isEqualToDictionary:", v19))
        {
          if (kHAPIScope)
          {
            v33 = *(id *)kHAPIScope;
            if (!v33)
              goto LABEL_41;
          }
          else
          {
            v33 = MEMORY[0x1E0C81028];
            v37 = MEMORY[0x1E0C81028];
          }
          if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
          {
            v38 = v14[4];
            *(_DWORD *)buf = 136315906;
            *(_QWORD *)&buf[4] = "CHHapticEngine.mm";
            *(_WORD *)&buf[12] = 1024;
            *(_DWORD *)&buf[14] = 2043;
            *(_WORD *)&buf[18] = 2080;
            *(_QWORD *)&buf[20] = "+[CHHapticEngine(CHHapticEngineInternal) doRegisterAudioResource:options:fromPattern:player:error:]";
            *(_WORD *)&buf[28] = 1024;
            *(_DWORD *)&buf[30] = v38;
            _os_log_impl(&dword_1B573F000, v33, OS_LOG_TYPE_INFO, "%25s:%-5d %s: Resource already registered but request uses options - copy existing ID (%u) as new ID", buf, 0x22u);
          }

LABEL_41:
          *(_QWORD *)&v109 = 0;
          *((_QWORD *)&v109 + 1) = &v109;
          v110 = 0x2020000000uLL;
          *(_QWORD *)buf = 0;
          *(_QWORD *)&buf[8] = buf;
          *(_QWORD *)&buf[16] = 0x3032000000;
          *(_QWORD *)&buf[24] = __Block_byref_object_copy__3;
          *(_QWORD *)&buf[32] = __Block_byref_object_dispose__3;
          *(_QWORD *)&buf[40] = 0;
          v39 = v14[4];
          v113[0] = MEMORY[0x1E0C809B0];
          v113[1] = 3221225472;
          v113[2] = __99__CHHapticEngine_CHHapticEngineInternal__doRegisterAudioResource_options_fromPattern_player_error___block_invoke_401;
          v113[3] = &unk_1E69602F0;
          v113[4] = &v109;
          v113[5] = buf;
          objc_msgSend(v101, "copyCustomAudioEvent:options:reply:", v39, v103, v113);
          if (*(_QWORD *)(*(_QWORD *)&buf[8] + 40))
          {
            if (kHAPIScope)
            {
              v40 = *(id *)kHAPIScope;
              if (!v40)
                goto LABEL_52;
            }
            else
            {
              v40 = MEMORY[0x1E0C81028];
              v42 = MEMORY[0x1E0C81028];
            }
            if (os_log_type_enabled(v40, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)v118 = 136315650;
              *(_QWORD *)&v118[4] = "CHHapticEngine.mm";
              *(_WORD *)&v118[12] = 1024;
              *(_DWORD *)&v118[14] = 2069;
              *(_WORD *)&v118[18] = 2080;
              *(_QWORD *)&v118[20] = "+[CHHapticEngine(CHHapticEngineInternal) doRegisterAudioResource:options:fromPatter"
                                     "n:player:error:]";
              _os_log_impl(&dword_1B573F000, v40, OS_LOG_TYPE_INFO, "%25s:%-5d %s: Returning ID 0 due to error", v118, 0x1Cu);
            }

LABEL_52:
            v7 = 0;
            if (a7)
              *a7 = objc_retainAutorelease(*(id *)(*(_QWORD *)&buf[8] + 40));
LABEL_85:
            _Block_object_dispose(buf, 8);

            _Block_object_dispose(&v109, 8);
            goto LABEL_86;
          }
          if (kHAPIScope)
          {
            v41 = *(id *)kHAPIScope;
            if (!v41)
            {
LABEL_75:
              v51 = (uint64_t **)_sResourceEntries;
              v52 = *((_QWORD *)&v109 + 1);
              *(AudioResource **)v118 = v115[0];
              *(AudioResource **)&v118[8] = v115[1];
              if (v115[1])
              {
                v53 = (unint64_t *)((char *)v115[1] + 8);
                do
                  v54 = __ldxr(v53);
                while (__stxr(v54 + 1, v53));
              }
              v55 = (unint64_t *)(v52 + 24);
              *(_QWORD *)&v118[16] = v103;
              *(_DWORD *)&v118[24] = 1;
              std::__tree<std::__value_type<unsigned long,std::tuple<std::shared_ptr<AudioResource>,NSDictionary * {__strong},unsigned int>>,std::__map_value_compare<unsigned long,std::__value_type<unsigned long,std::tuple<std::shared_ptr<AudioResource>,NSDictionary * {__strong},unsigned int>>,std::less<unsigned long>,true>,std::allocator<std::__value_type<unsigned long,std::tuple<std::shared_ptr<AudioResource>,NSDictionary * {__strong},unsigned int>>>>::__emplace_unique_key_args<unsigned long,unsigned long &,std::tuple<std::shared_ptr<AudioResource>,NSDictionary * {__strong},unsigned int>>(v51, v55, v55, (uint64_t)v118);
              v57 = v56;

              v58 = *(std::__shared_weak_count **)&v118[8];
              if (*(_QWORD *)&v118[8])
              {
                v59 = (unint64_t *)(*(_QWORD *)&v118[8] + 8);
                do
                  v60 = __ldaxr(v59);
                while (__stlxr(v60 - 1, v59));
                if (!v60)
                {
                  ((void (*)(std::__shared_weak_count *))v58->__on_zero_shared)(v58);
                  std::__shared_weak_count::__release_weak(v58);
                }
              }
              if ((v57 & 1) == 0)
                +[CHHapticEngine(CHHapticEngineInternal) doRegisterAudioResource:options:fromPattern:player:error:].cold.2();
              v7 = *(_QWORD *)(*((_QWORD *)&v109 + 1) + 24);
              goto LABEL_85;
            }
          }
          else
          {
            v41 = MEMORY[0x1E0C81028];
            v49 = MEMORY[0x1E0C81028];
          }
          if (os_log_type_enabled(v41, OS_LOG_TYPE_INFO))
          {
            v50 = *(_QWORD *)(*((_QWORD *)&v109 + 1) + 24);
            *(_DWORD *)v118 = 136316162;
            *(_QWORD *)&v118[4] = "CHHapticEngine.mm";
            *(_WORD *)&v118[12] = 1024;
            *(_DWORD *)&v118[14] = 2056;
            *(_WORD *)&v118[18] = 2080;
            *(_QWORD *)&v118[20] = "+[CHHapticEngine(CHHapticEngineInternal) doRegisterAudioResource:options:fromPattern:player:error:]";
            *(_WORD *)&v118[28] = 1024;
            *(_DWORD *)&v118[30] = v50;
            *(_WORD *)&v118[34] = 2112;
            *(_QWORD *)&v118[36] = v116;
            _os_log_impl(&dword_1B573F000, v41, OS_LOG_TYPE_INFO, "%25s:%-5d %s: Returning ID %u for copied resource '%@'", v118, 0x2Cu);
          }

          goto LABEL_75;
        }
        if (kHAPIScope)
        {
          v32 = *(id *)kHAPIScope;
          if (!v32)
            goto LABEL_33;
        }
        else
        {
          v32 = MEMORY[0x1E0C81028];
          v34 = MEMORY[0x1E0C81028];
        }
        if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
        {
          v35 = v14[4];
          *(_DWORD *)buf = 136315906;
          *(_QWORD *)&buf[4] = "CHHapticEngine.mm";
          *(_WORD *)&buf[12] = 1024;
          *(_DWORD *)&buf[14] = 2023;
          *(_WORD *)&buf[18] = 2080;
          *(_QWORD *)&buf[20] = "+[CHHapticEngine(CHHapticEngineInternal) doRegisterAudioResource:options:fromPattern:player:error:]";
          *(_WORD *)&buf[28] = 1024;
          *(_DWORD *)&buf[30] = v35;
          _os_log_impl(&dword_1B573F000, v32, OS_LOG_TYPE_INFO, "%25s:%-5d %s: Resource already registered and request uses matching options - referencing existing ID (%u)", buf, 0x22u);
        }

LABEL_33:
        v7 = v14[4];
        *(_QWORD *)buf = 0;
        *(_QWORD *)&buf[8] = buf;
        *(_QWORD *)&buf[16] = 0x3032000000;
        *(_QWORD *)&buf[24] = __Block_byref_object_copy__3;
        *(_QWORD *)&buf[32] = __Block_byref_object_dispose__3;
        *(_QWORD *)&buf[40] = 0;
        v114[0] = MEMORY[0x1E0C809B0];
        v114[1] = 3221225472;
        v114[2] = __99__CHHapticEngine_CHHapticEngineInternal__doRegisterAudioResource_options_fromPattern_player_error___block_invoke;
        v114[3] = &unk_1E6960358;
        v114[4] = buf;
        if ((objc_msgSend(v101, "referenceCustomAudioEvent:reply:", v7, v114) & 1) == 0)
        {
          if (kHAPIScope)
          {
            v36 = *(id *)kHAPIScope;
            if (!v36)
              goto LABEL_59;
          }
          else
          {
            v43 = (void *)MEMORY[0x1E0C81028];
            v44 = MEMORY[0x1E0C81028];
            v36 = v43;
          }
          v45 = v36;
          if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
          {
            objc_msgSend(*(id *)(*(_QWORD *)&buf[8] + 40), "localizedDescription");
            v46 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)v118 = 136316162;
            *(_QWORD *)&v118[4] = "CHHapticEngine.mm";
            *(_WORD *)&v118[12] = 1024;
            *(_DWORD *)&v118[14] = 2027;
            *(_WORD *)&v118[18] = 2080;
            *(_QWORD *)&v118[20] = "+[CHHapticEngine(CHHapticEngineInternal) doRegisterAudioResource:options:fromPattern:player:error:]";
            *(_WORD *)&v118[28] = 1024;
            *(_DWORD *)&v118[30] = v7;
            *(_WORD *)&v118[34] = 2112;
            *(_QWORD *)&v118[36] = v46;
            _os_log_impl(&dword_1B573F000, v45, OS_LOG_TYPE_ERROR, "%25s:%-5d %s: ERROR: unable to reference server-side audio resource with ID %u: %@", v118, 0x2Cu);

          }
        }
LABEL_59:
        if (*(_QWORD *)(*(_QWORD *)&buf[8] + 40))
        {
          if (kHAPIScope)
          {
            v47 = *(id *)kHAPIScope;
            if (!v47)
              goto LABEL_68;
          }
          else
          {
            v47 = MEMORY[0x1E0C81028];
            v48 = MEMORY[0x1E0C81028];
          }
          if (os_log_type_enabled(v47, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)v118 = 136315650;
            *(_QWORD *)&v118[4] = "CHHapticEngine.mm";
            *(_WORD *)&v118[12] = 1024;
            *(_DWORD *)&v118[14] = 2029;
            *(_WORD *)&v118[18] = 2080;
            *(_QWORD *)&v118[20] = "+[CHHapticEngine(CHHapticEngineInternal) doRegisterAudioResource:options:fromPattern:player:error:]";
            _os_log_impl(&dword_1B573F000, v47, OS_LOG_TYPE_INFO, "%25s:%-5d %s: Returning ID 0 due to error", v118, 0x1Cu);
          }

LABEL_68:
          v7 = 0;
          if (a7)
            *a7 = objc_retainAutorelease(*(id *)(*(_QWORD *)&buf[8] + 40));
        }
        else
        {
          ++*((_DWORD *)v14 + 16);
        }
        _Block_object_dispose(buf, 8);

      }
LABEL_86:

      v61 = (std::__shared_weak_count *)v106;
      if (v106)
      {
        v62 = (unint64_t *)(v106 + 1);
        do
          v63 = __ldaxr(v62);
        while (__stlxr(v63 - 1, v62));
        if (!v63)
        {
          ((void (*)(std::__shared_weak_count *))v61->__on_zero_shared)(v61);
          std::__shared_weak_count::__release_weak(v61);
        }
      }
      if ((v31 & 1) != 0)
        goto LABEL_144;
      v64 = (_QWORD *)v14[1];
      if (v64)
      {
        do
        {
          v65 = v64;
          v64 = (_QWORD *)*v64;
        }
        while (v64);
      }
      else
      {
        do
        {
          v65 = (_QWORD *)v14[2];
          v66 = *v65 == (_QWORD)v14;
          v14 = v65;
        }
        while (!v66);
      }
      v14 = v65;
    }
    while (v65 != (_QWORD *)v15);
  }
  if (kHAPIScope)
  {
    v67 = *(id *)kHAPIScope;
    if (!v67)
      goto LABEL_105;
  }
  else
  {
    v67 = MEMORY[0x1E0C81028];
    v68 = MEMORY[0x1E0C81028];
  }
  if (os_log_type_enabled(v67, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315650;
    *(_QWORD *)&buf[4] = "CHHapticEngine.mm";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = 2079;
    *(_WORD *)&buf[18] = 2080;
    *(_QWORD *)&buf[20] = "+[CHHapticEngine(CHHapticEngineInternal) doRegisterAudioResource:options:fromPattern:player:error:]";
    _os_log_impl(&dword_1B573F000, v67, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: Resource not already registered - creating new entry", buf, 0x1Cu);
  }

LABEL_105:
  std::allocate_shared[abi:ne180100]<AudioResource,std::allocator<AudioResource>,NSURL * {__strong}&,void>(&v116, buf);
  v69 = *(_OWORD *)buf;
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = 0;
  v70 = (std::__shared_weak_count *)v115[1];
  *(_OWORD *)v115 = v69;
  if (v70)
  {
    p_shared_owners = (unint64_t *)&v70->__shared_owners_;
    do
      v72 = __ldaxr(p_shared_owners);
    while (__stlxr(v72 - 1, p_shared_owners));
    if (!v72)
    {
      ((void (*)(std::__shared_weak_count *))v70->__on_zero_shared)(v70);
      std::__shared_weak_count::__release_weak(v70);
    }
  }
  v73 = *(std::__shared_weak_count **)&buf[8];
  if (*(_QWORD *)&buf[8])
  {
    v74 = (unint64_t *)(*(_QWORD *)&buf[8] + 8);
    do
      v75 = __ldaxr(v74);
    while (__stlxr(v75 - 1, v74));
    if (!v75)
    {
      ((void (*)(std::__shared_weak_count *))v73->__on_zero_shared)(v73);
      std::__shared_weak_count::__release_weak(v73);
    }
  }
  v76 = AudioResource::verifyAudioFile((ExtAudioFileRef *)v115[0], 0);
  if (_Haptic_Check((uint64_t)"/Library/Caches/com.apple.xbs/Sources/CoreHaptics/Source/CHHapticEngine.mm", 2083, "+[CHHapticEngine(CHHapticEngineInternal) doRegisterAudioResource:options:fromPattern:player:error:]", "resource->verifyAudioFile(false)", v76, a7))
  {
    v112 = 0;
    v77 = AudioResource::readAndAllocateRawBuffer(v115[0], &v112);
    if (_Haptic_Check((uint64_t)"/Library/Caches/com.apple.xbs/Sources/CoreHaptics/Source/CHHapticEngine.mm", 2090, "+[CHHapticEngine(CHHapticEngineInternal) doRegisterAudioResource:options:fromPattern:player:error:]", "status", v77, a7))
    {
      objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytesNoCopy:length:freeWhenDone:", v112, (4 * *((_DWORD *)v115[0] + 4) * *((_DWORD *)v115[0] + 13)), 0);
      v78 = (AVFASoftLink *)objc_claimAutoreleasedReturnValue();
      v111 = 0;
      v109 = 0u;
      v110 = 0u;
      v79 = *((_DWORD *)v115[0] + 13);
      *(_QWORD *)&v109 = *((_QWORD *)v115[0] + 3);
      *((_QWORD *)&v109 + 1) = 0x96C70636DLL;
      LODWORD(v110) = 4 * v79;
      DWORD1(v110) = 1;
      DWORD2(v110) = 4 * v79;
      HIDWORD(v110) = v79;
      LODWORD(v111) = 32;
      v80 = (void *)objc_msgSend(objc_alloc((Class)AVFASoftLink::getAVAudioFormat(v78)), "initWithStreamDescription:channelLayout:", &v109, 0);
      v105 = 0;
      v106 = &v105;
      v107 = 0x2020000000;
      v108 = 0;
      *(_QWORD *)v118 = 0;
      *(_QWORD *)&v118[8] = v118;
      *(_QWORD *)&v118[16] = 0x3032000000;
      *(_QWORD *)&v118[24] = __Block_byref_object_copy__3;
      *(_QWORD *)&v118[32] = __Block_byref_object_dispose__3;
      *(_QWORD *)&v118[40] = 0;
      v81 = *((unsigned int *)v115[0] + 4);
      v104[0] = MEMORY[0x1E0C809B0];
      v104[1] = 3221225472;
      v104[2] = __99__CHHapticEngine_CHHapticEngineInternal__doRegisterAudioResource_options_fromPattern_player_error___block_invoke_406;
      v104[3] = &unk_1E69602F0;
      v104[4] = &v105;
      v104[5] = v118;
      objc_msgSend(v101, "createCustomAudioEvent:format:frames:options:reply:", v78, v80, v81, v103, v104);
      if (a7)
        *a7 = objc_retainAutorelease(*(id *)(*(_QWORD *)&v118[8] + 40));
      if (v112)
        MEMORY[0x1B5E4EEAC](v112, 0x1000C8077774924);
      v7 = (unint64_t)v106[3];
      if (!v7 || *a7)
        goto LABEL_143;
      if (kHAPIScope)
      {
        v82 = *(id *)kHAPIScope;
        if (!v82)
        {
LABEL_133:
          v86 = (uint64_t **)_sResourceEntries;
          v87 = (unint64_t *)(v106 + 3);
          *(AudioResource **)buf = v115[0];
          *(AudioResource **)&buf[8] = v115[1];
          if (v115[1])
          {
            v88 = (unint64_t *)((char *)v115[1] + 8);
            do
              v89 = __ldxr(v88);
            while (__stxr(v89 + 1, v88));
          }
          *(_QWORD *)&buf[16] = v103;
          *(_DWORD *)&buf[24] = 1;
          std::__tree<std::__value_type<unsigned long,std::tuple<std::shared_ptr<AudioResource>,NSDictionary * {__strong},unsigned int>>,std::__map_value_compare<unsigned long,std::__value_type<unsigned long,std::tuple<std::shared_ptr<AudioResource>,NSDictionary * {__strong},unsigned int>>,std::less<unsigned long>,true>,std::allocator<std::__value_type<unsigned long,std::tuple<std::shared_ptr<AudioResource>,NSDictionary * {__strong},unsigned int>>>>::__emplace_unique_key_args<unsigned long,unsigned long &,std::tuple<std::shared_ptr<AudioResource>,NSDictionary * {__strong},unsigned int>>(v86, v87, v87, (uint64_t)buf);
          v91 = v90;

          v92 = *(std::__shared_weak_count **)&buf[8];
          if (*(_QWORD *)&buf[8])
          {
            v93 = (unint64_t *)(*(_QWORD *)&buf[8] + 8);
            do
              v94 = __ldaxr(v93);
            while (__stlxr(v94 - 1, v93));
            if (!v94)
            {
              ((void (*)(std::__shared_weak_count *))v92->__on_zero_shared)(v92);
              std::__shared_weak_count::__release_weak(v92);
            }
          }
          if ((v91 & 1) == 0)
            +[CHHapticEngine(CHHapticEngineInternal) doRegisterAudioResource:options:fromPattern:player:error:].cold.1();
          v7 = (unint64_t)v106[3];
LABEL_143:
          _Block_object_dispose(v118, 8);

          _Block_object_dispose(&v105, 8);
          goto LABEL_144;
        }
      }
      else
      {
        v82 = MEMORY[0x1E0C81028];
        v83 = MEMORY[0x1E0C81028];
      }
      if (os_log_type_enabled(v82, OS_LOG_TYPE_INFO))
      {
        v84 = "Public";
        v85 = v106[3];
        if (v99)
          v84 = "Pattern";
        *(_DWORD *)buf = 136316418;
        *(_QWORD *)&buf[4] = "CHHapticEngine.mm";
        *(_WORD *)&buf[12] = 1024;
        *(_DWORD *)&buf[14] = 2116;
        *(_WORD *)&buf[18] = 2080;
        *(_QWORD *)&buf[20] = "+[CHHapticEngine(CHHapticEngineInternal) doRegisterAudioResource:options:fromPattern:player:error:]";
        *(_WORD *)&buf[28] = 1024;
        *(_DWORD *)&buf[30] = (_DWORD)v85;
        *(_WORD *)&buf[34] = 2080;
        *(_QWORD *)&buf[36] = v84;
        *(_WORD *)&buf[44] = 2112;
        *(_QWORD *)&buf[46] = v116;
        _os_log_impl(&dword_1B573F000, v82, OS_LOG_TYPE_INFO, "%25s:%-5d %s: Adding new ID %u for %s resource '%@'", buf, 0x36u);
      }

      goto LABEL_133;
    }
  }
  v7 = 0;
LABEL_144:
  v95 = (std::__shared_weak_count *)v115[1];
  if (v115[1])
  {
    v96 = (unint64_t *)((char *)v115[1] + 8);
    do
      v97 = __ldaxr(v96);
    while (__stlxr(v97 - 1, v96));
    if (!v97)
    {
      ((void (*)(std::__shared_weak_count *))v95->__on_zero_shared)(v95);
      std::__shared_weak_count::__release_weak(v95);
    }
  }
  std::mutex::unlock(v100);

  return v7;
}

void __99__CHHapticEngine_CHHapticEngineInternal__doRegisterAudioResource_options_fromPattern_player_error___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __99__CHHapticEngine_CHHapticEngineInternal__doRegisterAudioResource_options_fromPattern_player_error___block_invoke_401(uint64_t a1, uint64_t a2, void *a3)
{
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
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = a2;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a3);
  if (v6)
  {
    if (kHAPIScope)
    {
      v7 = *(id *)kHAPIScope;
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
      objc_msgSend(v6, "localizedDescription");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 136315906;
      v12 = "CHHapticEngine.mm";
      v13 = 1024;
      v14 = 2052;
      v15 = 2080;
      v16 = "+[CHHapticEngine(CHHapticEngineInternal) doRegisterAudioResource:options:fromPattern:player:error:]_block_invoke";
      v17 = 2112;
      v18 = v10;
      _os_log_impl(&dword_1B573F000, v9, OS_LOG_TYPE_ERROR, "%25s:%-5d %s: ERROR: Server failed to copy custom audio event: %@", (uint8_t *)&v11, 0x26u);

    }
  }
LABEL_9:

}

void __99__CHHapticEngine_CHHapticEngineInternal__doRegisterAudioResource_options_fromPattern_player_error___block_invoke_406(uint64_t a1, uint64_t a2, void *a3)
{
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
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = a2;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a3);
  if (v6)
  {
    if (kHAPIScope)
    {
      v7 = *(id *)kHAPIScope;
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
      objc_msgSend(v6, "localizedDescription");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 136315906;
      v12 = "CHHapticEngine.mm";
      v13 = 1024;
      v14 = 2108;
      v15 = 2080;
      v16 = "+[CHHapticEngine(CHHapticEngineInternal) doRegisterAudioResource:options:fromPattern:player:error:]_block_invoke";
      v17 = 2112;
      v18 = v10;
      _os_log_impl(&dword_1B573F000, v9, OS_LOG_TYPE_ERROR, "%25s:%-5d %s: ERROR: Server failed to create custom audio event: %@", (uint8_t *)&v11, 0x26u);

    }
  }
LABEL_9:

}

+ (BOOL)doUnregisterAudioResource:(unint64_t)a3 fromPattern:(BOOL)a4 player:(id)a5 error:(id *)a6
{
  _BOOL4 v7;
  id v9;
  NSObject *v10;
  id v11;
  const char *v12;
  std::mutex *v13;
  id v14;
  _QWORD *v15;
  _QWORD *v16;
  BOOL v17;
  NSObject *v18;
  std::__shared_weak_count *v19;
  id *v20;
  unint64_t *p_shared_owners;
  unint64_t v22;
  id v23;
  id v24;
  id v25;
  NSObject *v26;
  id v27;
  void *v28;
  uint64_t v29;
  int v30;
  int v31;
  BOOL v32;
  NSObject *v33;
  id v34;
  id v35;
  char v36;
  char v37;
  id v38;
  void *v39;
  std::__shared_weak_count *v40;
  unint64_t *v41;
  unint64_t v42;
  _QWORD v44[6];
  std::__shared_weak_count *v45;
  uint64_t v46;
  uint64_t *v47;
  uint64_t v48;
  uint64_t (*v49)(uint64_t, uint64_t);
  void (*v50)(uint64_t);
  id v51;
  uint8_t buf[4];
  const char *v53;
  __int16 v54;
  int v55;
  __int16 v56;
  const char *v57;
  __int16 v58;
  _BYTE v59[14];
  __int16 v60;
  int v61;
  uint64_t v62;

  v7 = a4;
  v62 = *MEMORY[0x1E0C80C00];
  v9 = a5;
  v46 = 0;
  v47 = &v46;
  v48 = 0x3032000000;
  v49 = __Block_byref_object_copy__3;
  v50 = __Block_byref_object_dispose__3;
  v51 = 0;
  if (kHAPIScope)
  {
    v10 = *(id *)kHAPIScope;
    if (!v10)
      goto LABEL_10;
  }
  else
  {
    v10 = MEMORY[0x1E0C81028];
    v11 = MEMORY[0x1E0C81028];
  }
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    v12 = "public-loaded";
    *(_DWORD *)buf = 136316162;
    v53 = "CHHapticEngine.mm";
    v55 = 2133;
    v57 = "+[CHHapticEngine(CHHapticEngineInternal) doUnregisterAudioResource:fromPattern:player:error:]";
    v54 = 1024;
    v56 = 2080;
    if (v7)
      v12 = "pattern-loaded";
    v58 = 2080;
    *(_QWORD *)v59 = v12;
    *(_WORD *)&v59[8] = 1024;
    *(_DWORD *)&v59[10] = a3;
    _os_log_impl(&dword_1B573F000, v10, OS_LOG_TYPE_INFO, "%25s:%-5d %s: Attempting to remove %s ID %u", buf, 0x2Cu);
  }

LABEL_10:
  v13 = (std::mutex *)_sResourceMutex;
  std::mutex::lock((std::mutex *)_sResourceMutex);
  v14 = *(id *)_sResourceEntries;
  if (*(_QWORD *)_sResourceEntries != _sResourceEntries + 8)
  {
    while (*((_QWORD *)v14 + 4) != a3)
    {
      v15 = (_QWORD *)*((_QWORD *)v14 + 1);
      if (v15)
      {
        do
        {
          v16 = v15;
          v15 = (_QWORD *)*v15;
        }
        while (v15);
      }
      else
      {
        do
        {
          v16 = (_QWORD *)*((_QWORD *)v14 + 2);
          v17 = *v16 == (_QWORD)v14;
          v14 = v16;
        }
        while (!v17);
      }
      v14 = v16;
      if (v16 == (_QWORD *)(_sResourceEntries + 8))
        goto LABEL_18;
    }
    v20 = (id *)*((_QWORD *)v14 + 5);
    v19 = (std::__shared_weak_count *)*((_QWORD *)v14 + 6);
    v44[5] = v20;
    v45 = v19;
    if (v19)
    {
      p_shared_owners = (unint64_t *)&v19->__shared_owners_;
      do
        v22 = __ldxr(p_shared_owners);
      while (__stxr(v22 + 1, p_shared_owners));
    }
    if (kHAPIScope)
    {
      v23 = *(id *)kHAPIScope;
      if (!v23)
        goto LABEL_38;
    }
    else
    {
      v23 = (id)MEMORY[0x1E0C81028];
      v25 = MEMORY[0x1E0C81028];
    }
    v26 = v23;
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
    {
      v27 = *v20;
      objc_msgSend(v27, "absoluteString");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = *((_QWORD *)v14 + 4);
      v30 = *((_DWORD *)v14 + 16);
      *(_DWORD *)buf = 136316418;
      v53 = "CHHapticEngine.mm";
      v54 = 1024;
      v55 = 2140;
      v56 = 2080;
      v57 = "+[CHHapticEngine(CHHapticEngineInternal) doUnregisterAudioResource:fromPattern:player:error:]";
      v58 = 2112;
      *(_QWORD *)v59 = v28;
      *(_WORD *)&v59[8] = 1024;
      *(_DWORD *)&v59[10] = v29;
      v60 = 1024;
      v61 = v30;
      _os_log_impl(&dword_1B573F000, v26, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: -- Entry list has '%@' with ID %u, and count %u", buf, 0x32u);

    }
LABEL_38:
    v31 = *((_DWORD *)v14 + 16);
    *((_DWORD *)v14 + 16) = v31 - 1;
    v32 = v31 != 1;
    if (v31 != 1)
    {
      if (kHAPIScope)
      {
        v14 = *(id *)kHAPIScope;
        if (!v14)
        {
          LOBYTE(v14) = 1;
          goto LABEL_64;
        }
      }
      else
      {
        v14 = (id)MEMORY[0x1E0C81028];
        v34 = MEMORY[0x1E0C81028];
      }
      if (os_log_type_enabled((os_log_t)v14, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315650;
        v53 = "CHHapticEngine.mm";
        v54 = 1024;
        v55 = 2150;
        v56 = 2080;
        v57 = "+[CHHapticEngine(CHHapticEngineInternal) doUnregisterAudioResource:fromPattern:player:error:]";
        _os_log_impl(&dword_1B573F000, (os_log_t)v14, OS_LOG_TYPE_INFO, "%25s:%-5d %s:    found it and decrementing refcount", buf, 0x1Cu);
      }
      goto LABEL_63;
    }
    if (kHAPIScope)
    {
      v33 = *(id *)kHAPIScope;
      if (!v33)
      {
LABEL_52:
        std::__tree<std::__value_type<unsigned long,std::tuple<std::shared_ptr<AudioResource>,NSDictionary * {__strong},unsigned int>>,std::__map_value_compare<unsigned long,std::__value_type<unsigned long,std::tuple<std::shared_ptr<AudioResource>,NSDictionary * {__strong},unsigned int>>,std::less<unsigned long>,true>,std::allocator<std::__value_type<unsigned long,std::tuple<std::shared_ptr<AudioResource>,NSDictionary * {__strong},unsigned int>>>>::erase((uint64_t **)_sResourceEntries, (uint64_t)v14);
        v44[0] = MEMORY[0x1E0C809B0];
        v44[1] = 3221225472;
        v44[2] = __93__CHHapticEngine_CHHapticEngineInternal__doUnregisterAudioResource_fromPattern_player_error___block_invoke;
        v44[3] = &unk_1E6960358;
        v44[4] = &v46;
        v36 = objc_msgSend(v9, "releaseCustomAudioEvent:reply:", a3, v44);
        LOBYTE(v14) = v36;
        if (v9)
          v37 = v36;
        else
          v37 = 1;
        if ((v37 & 1) != 0)
        {
LABEL_64:
          v40 = v45;
          if (v45)
          {
            v41 = (unint64_t *)&v45->__shared_owners_;
            do
              v42 = __ldaxr(v41);
            while (__stlxr(v42 - 1, v41));
            if (!v42)
            {
              ((void (*)(std::__shared_weak_count *))v40->__on_zero_shared)(v40);
              std::__shared_weak_count::__release_weak(v40);
            }
          }
          if (a6)
            goto LABEL_70;
          goto LABEL_71;
        }
        if (kHAPIScope)
        {
          v14 = *(id *)kHAPIScope;
          if (!v14)
            goto LABEL_64;
        }
        else
        {
          v14 = (id)MEMORY[0x1E0C81028];
          v38 = MEMORY[0x1E0C81028];
        }
        v14 = v14;
        if (os_log_type_enabled((os_log_t)v14, OS_LOG_TYPE_ERROR))
        {
          objc_msgSend((id)v47[5], "localizedDescription");
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 136316162;
          v53 = "CHHapticEngine.mm";
          v54 = 1024;
          v55 = 2146;
          v56 = 2080;
          v57 = "+[CHHapticEngine(CHHapticEngineInternal) doUnregisterAudioResource:fromPattern:player:error:]";
          v58 = 1024;
          *(_DWORD *)v59 = a3;
          *(_WORD *)&v59[4] = 2112;
          *(_QWORD *)&v59[6] = v39;
          _os_log_impl(&dword_1B573F000, (os_log_t)v14, OS_LOG_TYPE_ERROR, "%25s:%-5d %s: ERROR: unable to release server-side audio resource with ID %u: %@", buf, 0x2Cu);

        }
LABEL_63:

        LOBYTE(v14) = v32;
        goto LABEL_64;
      }
    }
    else
    {
      v33 = MEMORY[0x1E0C81028];
      v35 = MEMORY[0x1E0C81028];
    }
    if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315650;
      v53 = "CHHapticEngine.mm";
      v54 = 1024;
      v55 = 2142;
      v56 = 2080;
      v57 = "+[CHHapticEngine(CHHapticEngineInternal) doUnregisterAudioResource:fromPattern:player:error:]";
      _os_log_impl(&dword_1B573F000, v33, OS_LOG_TYPE_INFO, "%25s:%-5d %s:    found it and refcount is at zero - erasing and releasing on server", buf, 0x1Cu);
    }

    goto LABEL_52;
  }
LABEL_18:
  if (!kHAPIScope)
  {
    v18 = MEMORY[0x1E0C81028];
    v24 = MEMORY[0x1E0C81028];
    goto LABEL_28;
  }
  v18 = *(id *)kHAPIScope;
  if (v18)
  {
LABEL_28:
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315906;
      v53 = "CHHapticEngine.mm";
      v54 = 1024;
      v55 = 2161;
      v56 = 2080;
      v57 = "+[CHHapticEngine(CHHapticEngineInternal) doUnregisterAudioResource:fromPattern:player:error:]";
      v58 = 1024;
      *(_DWORD *)v59 = a3;
      _os_log_impl(&dword_1B573F000, v18, OS_LOG_TYPE_ERROR, "%25s:%-5d %s: ERROR: could not find audio resource with ID %u", buf, 0x22u);
    }

  }
  if (a6)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.CoreHaptics"), -4824, 0);
    LOBYTE(v14) = 0;
    *a6 = (id)objc_claimAutoreleasedReturnValue();
LABEL_70:
    *a6 = objc_retainAutorelease((id)v47[5]);
    goto LABEL_71;
  }
  LOBYTE(v14) = 0;
LABEL_71:
  std::mutex::unlock(v13);
  _Block_object_dispose(&v46, 8);

  return (char)v14;
}

void __93__CHHapticEngine_CHHapticEngineInternal__doUnregisterAudioResource_fromPattern_player_error___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

- (void)addPublicAudioResourceID:withURL:options:.cold.1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  if (OUTLINED_FUNCTION_1(MEMORY[0x1E0C81028]))
    OUTLINED_FUNCTION_0(&dword_1B573F000, MEMORY[0x1E0C81028], v0, "%25s:%-5d ASSERTION FAILURE [([self doFindPublicAudioResourceID:resourceID] == std::end(_publicAudioResources)) != 0 is false]: ", v1, v2, v3, v4, 2u);
  __break(1u);
}

- (void)removePublicAudioResourceID:.cold.1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  if (OUTLINED_FUNCTION_1(MEMORY[0x1E0C81028]))
    OUTLINED_FUNCTION_0(&dword_1B573F000, MEMORY[0x1E0C81028], v0, "%25s:%-5d ASSERTION FAILURE [(result != std::end(_publicAudioResources)) != 0 is false]: ", v1, v2, v3, v4, 2u);
  __break(1u);
}

@end
