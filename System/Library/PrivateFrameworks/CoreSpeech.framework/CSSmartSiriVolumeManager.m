@implementation CSSmartSiriVolumeManager

- (CSSmartSiriVolumeManager)initWithSamplingRate:(float)a3
{
  CSSmartSiriVolume *v5;
  CSSmartSiriVolumeProcessor *v6;
  CSSmartSiriVolumeProcessor *smartSiriVolume;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  CSSmartSiriVolumeManager *v12;
  NSObject *v13;
  NSObject *v14;
  objc_super v16;
  uint8_t buf[4];
  const char *v18;
  __int16 v19;
  double v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  if ((objc_msgSend(MEMORY[0x1E0D19260], "supportSmartVolume") & 1) == 0)
  {
    v13 = *MEMORY[0x1E0D18F20];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F20], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v18 = "-[CSSmartSiriVolumeManager initWithSamplingRate:]";
      _os_log_impl(&dword_1C2614000, v13, OS_LOG_TYPE_DEFAULT, "%s Smart Siri Volume not supported on this platform - Bailing out", buf, 0xCu);
    }
    goto LABEL_10;
  }
  v16.receiver = self;
  v16.super_class = (Class)CSSmartSiriVolumeManager;
  self = -[CSSmartSiriVolumeManager init](&v16, sel_init);
  if (self)
  {
    v5 = [CSSmartSiriVolume alloc];
    objc_msgSend(MEMORY[0x1E0D19090], "inputRecordingSampleRate");
    v6 = -[CSSmartSiriVolume initWithSamplingRate:](v5, "initWithSamplingRate:");
    smartSiriVolume = self->_smartSiriVolume;
    self->_smartSiriVolume = v6;

    if (self->_smartSiriVolume)
    {
      +[CSAlarmMonitor sharedInstance](CSAlarmMonitor, "sharedInstance");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "addObserver:", self);

      +[CSTimerMonitor sharedInstance](CSTimerMonitor, "sharedInstance");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "addObserver:", self);

      objc_msgSend(MEMORY[0x1E0D192B0], "sharedInstance");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "addObserver:", self);

      +[CSAutomaticVolumeEnabledMonitor sharedInstance](CSAutomaticVolumeEnabledMonitor, "sharedInstance");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "addObserver:", self);

      goto LABEL_5;
    }
    v14 = *MEMORY[0x1E0D18F20];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F20], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v18 = "-[CSSmartSiriVolumeManager initWithSamplingRate:]";
      v19 = 2050;
      v20 = a3;
      _os_log_error_impl(&dword_1C2614000, v14, OS_LOG_TYPE_ERROR, "%s ERR: Failed to initialize Smart Siri Volume with sampling %{public}f", buf, 0x16u);
    }
LABEL_10:
    v12 = 0;
    goto LABEL_11;
  }
LABEL_5:
  self = self;
  v12 = self;
LABEL_11:

  return v12;
}

- (void)startSmartSiriVolume
{
  -[CSSmartSiriVolumeProcessor startSmartSiriVolume](self->_smartSiriVolume, "startSmartSiriVolume");
}

- (void)setAsset:(id)a3
{
  -[CSSmartSiriVolumeProcessor setAsset:](self->_smartSiriVolume, "setAsset:", a3);
}

- (id)getVolumeForTTSType:(unint64_t)a3 withOverrideMediaVolume:(id)a4 WithRequestTime:(unint64_t)a5
{
  return (id)-[CSSmartSiriVolumeProcessor getVolumeForTTSType:withOverrideMediaVolume:WithRequestTime:](self->_smartSiriVolume, "getVolumeForTTSType:withOverrideMediaVolume:WithRequestTime:", a3, a4, a5);
}

- (void)setSmartSiriVolumePercentage:(float)a3
{
  -[CSSmartSiriVolumeProcessor setSmartSiriVolumePercentage:](self->_smartSiriVolume, "setSmartSiriVolumePercentage:");
}

- (void)setSmartSiriVolumeDirection:(BOOL)a3
{
  -[CSSmartSiriVolumeProcessor setSmartSiriVolumeDirection:](self->_smartSiriVolume, "setSmartSiriVolumeDirection:", a3);
}

- (void)setPermanentVolumeOffsetWithDirection:(BOOL)a3
{
  -[CSSmartSiriVolumeProcessor setPermanentVolumeOffsetWithDirection:](self->_smartSiriVolume, "setPermanentVolumeOffsetWithDirection:", a3);
}

- (void)CSAlarmMonitor:(id)a3 didReceiveAlarmChanged:(int64_t)a4
{
  id v6;
  NSObject *v7;
  CSConnectionServiceDelegate **p_delegate;
  id WeakRetained;
  char v10;
  id v11;
  int v12;
  const char *v13;
  __int16 v14;
  int v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = *MEMORY[0x1E0D18F20];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F20], OS_LOG_TYPE_DEFAULT))
  {
    v12 = 136315394;
    v13 = "-[CSSmartSiriVolumeManager CSAlarmMonitor:didReceiveAlarmChanged:]";
    v14 = 1026;
    v15 = a4;
    _os_log_impl(&dword_1C2614000, v7, OS_LOG_TYPE_DEFAULT, "%s AlarmState changed to %{public}d", (uint8_t *)&v12, 0x12u);
  }
  -[CSSmartSiriVolumeProcessor didReceiveAlarmChanged:](self->_smartSiriVolume, "didReceiveAlarmChanged:", a4);
  p_delegate = &self->_delegate;
  WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  v10 = objc_opt_respondsToSelector();

  if ((v10 & 1) != 0)
  {
    v11 = objc_loadWeakRetained((id *)p_delegate);
    objc_msgSend(v11, "notifyClientsWithBlock:", &__block_literal_global_14);

  }
}

- (void)CSTimerMonitor:(id)a3 didReceiveTimerChanged:(int64_t)a4
{
  id v6;
  NSObject *v7;
  CSConnectionServiceDelegate **p_delegate;
  id WeakRetained;
  char v10;
  id v11;
  int v12;
  const char *v13;
  __int16 v14;
  int v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = *MEMORY[0x1E0D18F20];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F20], OS_LOG_TYPE_DEFAULT))
  {
    v12 = 136315394;
    v13 = "-[CSSmartSiriVolumeManager CSTimerMonitor:didReceiveTimerChanged:]";
    v14 = 1026;
    v15 = a4;
    _os_log_impl(&dword_1C2614000, v7, OS_LOG_TYPE_DEFAULT, "%s TimerState changed to %{public}d", (uint8_t *)&v12, 0x12u);
  }
  -[CSSmartSiriVolumeProcessor didReceiveTimerChanged:](self->_smartSiriVolume, "didReceiveTimerChanged:", a4);
  p_delegate = &self->_delegate;
  WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  v10 = objc_opt_respondsToSelector();

  if ((v10 & 1) != 0)
  {
    v11 = objc_loadWeakRetained((id *)p_delegate);
    objc_msgSend(v11, "notifyClientsWithBlock:", &__block_literal_global_15);

  }
}

- (void)CSVolumeMonitor:(id)a3 didReceiveMusicVolumeChanged:(float)a4
{
  id v6;
  NSObject *v7;
  double v8;
  CSConnectionServiceDelegate **p_delegate;
  id WeakRetained;
  char v11;
  id v12;
  int v13;
  const char *v14;
  __int16 v15;
  double v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = *MEMORY[0x1E0D18F20];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F20], OS_LOG_TYPE_DEFAULT))
  {
    v13 = 136315394;
    v14 = "-[CSSmartSiriVolumeManager CSVolumeMonitor:didReceiveMusicVolumeChanged:]";
    v15 = 2050;
    v16 = a4;
    _os_log_impl(&dword_1C2614000, v7, OS_LOG_TYPE_DEFAULT, "%s MusicVolume changed to %{public}f", (uint8_t *)&v13, 0x16u);
  }
  *(float *)&v8 = a4;
  -[CSSmartSiriVolumeProcessor didReceiveMusicVolumeChanged:](self->_smartSiriVolume, "didReceiveMusicVolumeChanged:", v8);
  p_delegate = &self->_delegate;
  WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  v11 = objc_opt_respondsToSelector();

  if ((v11 & 1) != 0)
  {
    v12 = objc_loadWeakRetained((id *)p_delegate);
    objc_msgSend(v12, "notifyClientsWithBlock:", &__block_literal_global_16);

  }
}

- (void)CSVolumeMonitor:(id)a3 didReceiveAlarmVolumeChanged:(float)a4
{
  id v6;
  NSObject *v7;
  double v8;
  CSConnectionServiceDelegate **p_delegate;
  id WeakRetained;
  char v11;
  id v12;
  int v13;
  const char *v14;
  __int16 v15;
  double v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = *MEMORY[0x1E0D18F20];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F20], OS_LOG_TYPE_DEFAULT))
  {
    v13 = 136315394;
    v14 = "-[CSSmartSiriVolumeManager CSVolumeMonitor:didReceiveAlarmVolumeChanged:]";
    v15 = 2050;
    v16 = a4;
    _os_log_impl(&dword_1C2614000, v7, OS_LOG_TYPE_DEFAULT, "%s AlarmVolume changed to %{public}f", (uint8_t *)&v13, 0x16u);
  }
  *(float *)&v8 = a4;
  -[CSSmartSiriVolumeProcessor didReceiveAlarmVolumeChanged:](self->_smartSiriVolume, "didReceiveAlarmVolumeChanged:", v8);
  p_delegate = &self->_delegate;
  WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  v11 = objc_opt_respondsToSelector();

  if ((v11 & 1) != 0)
  {
    v12 = objc_loadWeakRetained((id *)p_delegate);
    objc_msgSend(v12, "notifyClientsWithBlock:", &__block_literal_global_17_9884);

  }
}

- (void)voiceTriggerDidDetectKeyword:(id)a3 deviceId:(id)a4
{
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  int v10;
  id v11;

  v11 = a3;
  v6 = a4;
  if (v11)
  {
    v7 = *MEMORY[0x1E0D19660];
    objc_msgSend(v11, "objectForKeyedSubscript:", *MEMORY[0x1E0D19660]);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      objc_msgSend(v11, "objectForKeyedSubscript:", v7);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "isEqualToString:", *MEMORY[0x1E0D19450]);

      if (v10)
        -[CSSmartSiriVolumeProcessor didDetectKeywordWithResult:](self->_smartSiriVolume, "didDetectKeywordWithResult:", v11);
    }
  }

}

- (void)CSAutomaticVolumeEnabledMonitor:(id)a3 didReceiveEnabled:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  NSObject *v7;
  CSConnectionServiceDelegate **p_delegate;
  id WeakRetained;
  char v10;
  id v11;
  int v12;
  const char *v13;
  __int16 v14;
  _BOOL4 v15;
  uint64_t v16;

  v4 = a4;
  v16 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = *MEMORY[0x1E0D18F20];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F20], OS_LOG_TYPE_DEFAULT))
  {
    v12 = 136315394;
    v13 = "-[CSSmartSiriVolumeManager CSAutomaticVolumeEnabledMonitor:didReceiveEnabled:]";
    v14 = 1026;
    v15 = v4;
    _os_log_impl(&dword_1C2614000, v7, OS_LOG_TYPE_DEFAULT, "%s Automatic Volume State changed to %{public}d", (uint8_t *)&v12, 0x12u);
  }
  p_delegate = &self->_delegate;
  WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  v10 = objc_opt_respondsToSelector();

  if ((v10 & 1) != 0)
  {
    v11 = objc_loadWeakRetained((id *)p_delegate);
    objc_msgSend(v11, "notifyClientsWithBlock:", &__block_literal_global_18);

  }
}

- (CSConnectionServiceDelegate)delegate
{
  return (CSConnectionServiceDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (CSSmartSiriVolumeProcessor)smartSiriVolume
{
  return self->_smartSiriVolume;
}

- (void)setSmartSiriVolume:(id)a3
{
  objc_storeStrong((id *)&self->_smartSiriVolume, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_smartSiriVolume, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

uint64_t __78__CSSmartSiriVolumeManager_CSAutomaticVolumeEnabledMonitor_didReceiveEnabled___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "didTTSVolumeChangeForReason:", 5);
}

uint64_t __73__CSSmartSiriVolumeManager_CSVolumeMonitor_didReceiveAlarmVolumeChanged___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "didTTSVolumeChangeForReason:", 0);
}

uint64_t __73__CSSmartSiriVolumeManager_CSVolumeMonitor_didReceiveMusicVolumeChanged___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "didTTSVolumeChangeForReason:", 0);
}

uint64_t __66__CSSmartSiriVolumeManager_CSTimerMonitor_didReceiveTimerChanged___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "didTTSVolumeChangeForReason:", 2);
}

uint64_t __66__CSSmartSiriVolumeManager_CSAlarmMonitor_didReceiveAlarmChanged___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "didTTSVolumeChangeForReason:", 1);
}

+ (CSSmartSiriVolumeManager)sharedInstance
{
  if (sharedInstance_onceToken_9901 != -1)
    dispatch_once(&sharedInstance_onceToken_9901, &__block_literal_global_9902);
  return (CSSmartSiriVolumeManager *)(id)sharedInstance_sharedSSVManager;
}

void __42__CSSmartSiriVolumeManager_sharedInstance__block_invoke()
{
  int v0;
  int v1;
  CSSmartSiriVolumeManager *v2;
  double v3;
  uint64_t v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0D19090], "inputRecordingSampleRate");
  v1 = v0;
  v2 = [CSSmartSiriVolumeManager alloc];
  LODWORD(v3) = v1;
  v4 = -[CSSmartSiriVolumeManager initWithSamplingRate:](v2, "initWithSamplingRate:", v3);
  v5 = (void *)sharedInstance_sharedSSVManager;
  sharedInstance_sharedSSVManager = v4;

}

@end
