@implementation CSMediaPlayingMonitor

- (CSMediaPlayingMonitor)init
{
  CSMediaPlayingMonitor *v2;
  dispatch_queue_t v3;
  OS_dispatch_queue *queue;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CSMediaPlayingMonitor;
  v2 = -[CSEventMonitor init](&v6, sel_init);
  if (v2)
  {
    v3 = dispatch_queue_create("CSMediaPlayingMonitor queue", 0);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v3;

    v2->_mediaIsPlaying = 0;
  }
  return v2;
}

- (void)initializeMediaPlayingState
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __52__CSMediaPlayingMonitor_initializeMediaPlayingState__block_invoke;
  block[3] = &unk_1E7C292C8;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)_startMonitoringWithQueue:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  int v7;
  const char *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[CSMediaPlayingMonitor _stopMonitoring](self, "_stopMonitoring");
  MRMediaRemoteRegisterForNowPlayingNotifications();

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObserver:selector:name:object:", self, sel__notePossiblePlayPausedStateChange_, *MEMORY[0x1E0D4C920], 0);

  v6 = *MEMORY[0x1E0D18F60];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
  {
    v7 = 136315138;
    v8 = "-[CSMediaPlayingMonitor _startMonitoringWithQueue:]";
    _os_log_impl(&dword_1C2614000, v6, OS_LOG_TYPE_DEFAULT, "%s Start monitoring MediaRemote: media playback", (uint8_t *)&v7, 0xCu);
  }
}

- (void)_stopMonitoring
{
  void *v3;
  NSObject *v4;
  int v5;
  const char *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x1E0D4C920], 0);

  v4 = *MEMORY[0x1E0D18F60];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
  {
    v5 = 136315138;
    v6 = "-[CSMediaPlayingMonitor _stopMonitoring]";
    _os_log_impl(&dword_1C2614000, v4, OS_LOG_TYPE_DEFAULT, "%s Stop monitoring MediaRemote: media playback", (uint8_t *)&v5, 0xCu);
  }
}

- (void)_notePossiblePlayPausedStateChange:(id)a3
{
  void *v4;
  void *v5;
  int v6;
  NSObject *v7;
  const char *v8;
  _QWORD v9[5];
  char v10;
  uint8_t buf[4];
  const char *v12;
  __int16 v13;
  const char *v14;
  __int16 v15;
  int v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", *MEMORY[0x1E0D4C928]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "BOOLValue");

  v7 = *MEMORY[0x1E0D18F60];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
  {
    v8 = "NOT PLAYING";
    v12 = "-[CSMediaPlayingMonitor _notePossiblePlayPausedStateChange:]";
    *(_DWORD *)buf = 136315650;
    if (v6)
      v8 = "PLAYING";
    v13 = 2080;
    v14 = v8;
    v15 = 1024;
    v16 = v6;
    _os_log_impl(&dword_1C2614000, v7, OS_LOG_TYPE_DEFAULT, "%s MediaRemote reported the now playing app playback state changed to %s (state %d)", buf, 0x1Cu);
  }
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __60__CSMediaPlayingMonitor__notePossiblePlayPausedStateChange___block_invoke;
  v9[3] = &unk_1E7C27E50;
  v9[4] = self;
  v10 = v6;
  -[CSEventMonitor enumerateObserversInQueue:](self, "enumerateObserversInQueue:", v9);
}

- (void)_notifyObserver:(id)a3 mediaIsPlayingState:(int64_t)a4
{
  id v6;

  v6 = a3;
  -[CSEventMonitor notifyObserver:](self, "notifyObserver:", v6);
  self->_mediaIsPlaying = a4;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v6, "CSMediaPlayingMonitor:didReceiveMediaPlayingChanged:", self, a4);

}

- (int64_t)mediaPlayingState
{
  NSObject *queue;
  int64_t v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __42__CSMediaPlayingMonitor_mediaPlayingState__block_invoke;
  v5[3] = &unk_1E7C29228;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)mediaPlayingStateWithCompletion:(id)a3
{
  id v4;
  void *v5;
  NSObject *queue;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    queue = self->_queue;
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __57__CSMediaPlayingMonitor_mediaPlayingStateWithCompletion___block_invoke;
    v7[3] = &unk_1E7C29150;
    v7[4] = self;
    v8 = v4;
    dispatch_async(queue, v7);

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
}

uint64_t __57__CSMediaPlayingMonitor_mediaPlayingStateWithCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24));
}

uint64_t __42__CSMediaPlayingMonitor_mediaPlayingState__block_invoke(uint64_t result)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_QWORD *)(*(_QWORD *)(result + 32) + 24);
  return result;
}

uint64_t __60__CSMediaPlayingMonitor__notePossiblePlayPausedStateChange___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  if (*(_BYTE *)(a1 + 40))
    v2 = 1;
  else
    v2 = 2;
  return objc_msgSend(*(id *)(a1 + 32), "_notifyObserver:mediaIsPlayingState:", a2, v2);
}

void __52__CSMediaPlayingMonitor_initializeMediaPlayingState__block_invoke(uint64_t a1)
{
  id v1;
  id location;

  objc_initWeak(&location, *(id *)(a1 + 32));
  objc_copyWeak(&v1, &location);
  MRMediaRemoteGetNowPlayingApplicationPlaybackState();
  objc_destroyWeak(&v1);
  objc_destroyWeak(&location);
}

void __52__CSMediaPlayingMonitor_initializeMediaPlayingState__block_invoke_2(uint64_t a1, int a2)
{
  id WeakRetained;
  void *v4;
  uint64_t v5;
  NSObject *v6;
  _QWORD v7[5];
  uint8_t buf[4];
  const char *v9;
  __int16 v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v4 = WeakRetained;
  if (a2 == 1)
    v5 = 1;
  else
    v5 = 2;
  *((_QWORD *)WeakRetained + 3) = v5;
  v6 = *MEMORY[0x1E0D18F60];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v9 = "-[CSMediaPlayingMonitor initializeMediaPlayingState]_block_invoke_2";
    v10 = 2050;
    v11 = v5;
    _os_log_impl(&dword_1C2614000, v6, OS_LOG_TYPE_DEFAULT, "%s Get initial state from MediaRemote: media is on playing state %{public}ld.", buf, 0x16u);
  }
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __52__CSMediaPlayingMonitor_initializeMediaPlayingState__block_invoke_3;
  v7[3] = &unk_1E7C29250;
  v7[4] = v4;
  objc_msgSend(v4, "enumerateObserversInQueue:", v7);

}

uint64_t __52__CSMediaPlayingMonitor_initializeMediaPlayingState__block_invoke_3(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_notifyObserver:mediaIsPlayingState:", a2, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24));
}

+ (id)sharedInstance
{
  if ((objc_msgSend(MEMORY[0x1E0D19260], "isDarwinOS") & 1) != 0)
    return 0;
  if (sharedInstance_onceToken_639 != -1)
    dispatch_once(&sharedInstance_onceToken_639, &__block_literal_global_640);
  return (id)sharedInstance__sharedInstance_641;
}

void __39__CSMediaPlayingMonitor_sharedInstance__block_invoke()
{
  CSMediaPlayingMonitor *v0;
  void *v1;

  v0 = objc_alloc_init(CSMediaPlayingMonitor);
  v1 = (void *)sharedInstance__sharedInstance_641;
  sharedInstance__sharedInstance_641 = (uint64_t)v0;

}

@end
