@implementation CSPlaybackVolumeStatusMonitor

- (CSPlaybackVolumeStatusMonitor)init
{
  CSPlaybackVolumeStatusMonitor *v2;
  dispatch_queue_t v3;
  OS_dispatch_queue *queue;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CSPlaybackVolumeStatusMonitor;
  v2 = -[CSEventMonitor init](&v6, sel_init);
  if (v2)
  {
    v3 = dispatch_queue_create("CSPlaybackVolumeStatusMonitor queue", 0);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v3;

  }
  return v2;
}

- (unint64_t)playbackVolumeStatus
{
  NSObject *queue;
  unint64_t v3;
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
  v5[2] = __53__CSPlaybackVolumeStatusMonitor_playbackVolumeStatus__block_invoke;
  v5[3] = &unk_1E6880D18;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)_startMonitoringWithQueue:(id)a3
{
  NSObject *queue;
  void *v5;
  NSObject *v6;
  _QWORD block[5];
  uint8_t buf[4];
  const char *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __59__CSPlaybackVolumeStatusMonitor__startMonitoringWithQueue___block_invoke;
  block[3] = &unk_1E6881138;
  block[4] = self;
  dispatch_async(queue, block);
  +[CSVolumeMonitor sharedInstance](CSVolumeMonitor, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObserver:", self);

  v6 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v9 = "-[CSPlaybackVolumeStatusMonitor _startMonitoringWithQueue:]";
    _os_log_impl(&dword_1B502E000, v6, OS_LOG_TYPE_DEFAULT, "%s Start monitor: playback volume status", buf, 0xCu);
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
  +[CSVolumeMonitor sharedInstance](CSVolumeMonitor, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 136315138;
    v6 = "-[CSPlaybackVolumeStatusMonitor _stopMonitoring]";
    _os_log_impl(&dword_1B502E000, v4, OS_LOG_TYPE_DEFAULT, "%s Stop monitor: playback volume status", (uint8_t *)&v5, 0xCu);
  }
}

- (void)CSVolumeMonitor:(id)a3 systemVolumeDidChange:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  NSObject *queue;
  _QWORD v9[5];
  id v10;

  v5 = a4;
  objc_msgSend(v5, "userInfo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", *MEMORY[0x1E0D47E38]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    queue = self->_queue;
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __71__CSPlaybackVolumeStatusMonitor_CSVolumeMonitor_systemVolumeDidChange___block_invoke;
    v9[3] = &unk_1E6880E88;
    v9[4] = self;
    v10 = v5;
    dispatch_async(queue, v9);

  }
}

- (void)_updatePlaybackVolumeStatusWithNotification:(id)a3
{
  void *v4;
  void *v5;
  float v6;
  float v7;
  double v8;
  float v9;
  unint64_t v10;
  unint64_t v11;
  NSObject *v12;
  _QWORD v13[5];
  uint8_t buf[4];
  const char *v15;
  __int16 v16;
  double v17;
  __int16 v18;
  unint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", *MEMORY[0x1E0D47ED0]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "floatValue");
  v7 = v6;

  LODWORD(v8) = 1.0;
  if (v7 <= 1.0)
    *(float *)&v8 = v7;
  v9 = fmaxf(*(float *)&v8, 0.0);
  *(float *)&v8 = v9;
  v10 = -[CSPlaybackVolumeStatusMonitor _volumeStatusFromLevel:](self, "_volumeStatusFromLevel:", v8);
  if (v10 != self->_volumeStatus)
  {
    v11 = v10;
    self->_volumeStatus = v10;
    v12 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      v15 = "-[CSPlaybackVolumeStatusMonitor _updatePlaybackVolumeStatusWithNotification:]";
      v16 = 2048;
      v17 = v9;
      v18 = 2048;
      v19 = v11;
      _os_log_impl(&dword_1B502E000, v12, OS_LOG_TYPE_DEFAULT, "%s Updated audio volume = %f, volumeStatus = %lu", buf, 0x20u);
    }
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __77__CSPlaybackVolumeStatusMonitor__updatePlaybackVolumeStatusWithNotification___block_invoke;
    v13[3] = &unk_1E68810D0;
    v13[4] = self;
    -[CSEventMonitor enumerateObserversInQueue:](self, "enumerateObserversInQueue:", v13);
  }
}

- (void)_fetchAndUpdatePlaybackVolumeStatus
{
  void *v3;
  int v4;
  id v5;
  double v6;
  NSObject *v7;
  _QWORD v8[5];
  id v9;
  float v10;
  uint8_t buf[4];
  const char *v12;
  __int16 v13;
  double v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v10 = 0.0;
  objc_msgSend(MEMORY[0x1E0D48558], "sharedAVSystemController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 0;
  v4 = objc_msgSend(v3, "getActiveCategoryVolume:andName:", &v10, &v9);
  v5 = v9;

  if (v4)
  {
    *(float *)&v6 = v10;
    self->_volumeStatus = -[CSPlaybackVolumeStatusMonitor _volumeStatusFromLevel:](self, "_volumeStatusFromLevel:", v6);
    v7 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      v12 = "-[CSPlaybackVolumeStatusMonitor _fetchAndUpdatePlaybackVolumeStatus]";
      v13 = 2048;
      v14 = v10;
      v15 = 2114;
      v16 = v5;
      _os_log_impl(&dword_1B502E000, v7, OS_LOG_TYPE_DEFAULT, "%s activeVolumeLevel = %f, activeAudioCategory = %{public}@", buf, 0x20u);
    }
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __68__CSPlaybackVolumeStatusMonitor__fetchAndUpdatePlaybackVolumeStatus__block_invoke;
    v8[3] = &unk_1E68810D0;
    v8[4] = self;
    -[CSEventMonitor enumerateObserversInQueue:](self, "enumerateObserversInQueue:", v8);
  }

}

- (unint64_t)_volumeStatusFromLevel:(float)a3
{
  void *v4;
  float v5;
  float v6;

  if (a3 > 0.0)
  {
    +[CSFPreferences sharedPreferences](CSFPreferences, "sharedPreferences");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "nearlyMutedPlaybackVolumeLevel");
    v6 = v5;

    if (v6 >= a3)
      return 1;
  }
  if (a3 <= 0.0)
    return 2;
  return 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
}

uint64_t __68__CSPlaybackVolumeStatusMonitor__fetchAndUpdatePlaybackVolumeStatus__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "notifyObserver:", a2);
}

uint64_t __77__CSPlaybackVolumeStatusMonitor__updatePlaybackVolumeStatusWithNotification___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "notifyObserver:", a2);
}

uint64_t __71__CSPlaybackVolumeStatusMonitor_CSVolumeMonitor_systemVolumeDidChange___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updatePlaybackVolumeStatusWithNotification:", *(_QWORD *)(a1 + 40));
}

uint64_t __59__CSPlaybackVolumeStatusMonitor__startMonitoringWithQueue___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_fetchAndUpdatePlaybackVolumeStatus");
}

uint64_t __53__CSPlaybackVolumeStatusMonitor_playbackVolumeStatus__block_invoke(uint64_t result)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_QWORD *)(*(_QWORD *)(result + 32) + 32);
  return result;
}

+ (id)sharedInstance
{
  if (+[CSUtils isDarwinOS](CSUtils, "isDarwinOS"))
    return 0;
  if (sharedInstance_onceToken_9152 != -1)
    dispatch_once(&sharedInstance_onceToken_9152, &__block_literal_global_9153);
  return (id)sharedInstance__sharedInstance_9154;
}

void __47__CSPlaybackVolumeStatusMonitor_sharedInstance__block_invoke()
{
  CSPlaybackVolumeStatusMonitor *v0;
  void *v1;

  v0 = objc_alloc_init(CSPlaybackVolumeStatusMonitor);
  v1 = (void *)sharedInstance__sharedInstance_9154;
  sharedInstance__sharedInstance_9154 = (uint64_t)v0;

}

@end
