@implementation CSAutomaticVolumeEnabledMonitor

- (CSAutomaticVolumeEnabledMonitor)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CSAutomaticVolumeEnabledMonitor;
  return -[CSEventMonitor init](&v3, sel_init);
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v7;
  void *v8;
  NSObject *queue;
  _QWORD v10[4];
  id v11;
  CSAutomaticVolumeEnabledMonitor *v12;

  v7 = a3;
  v8 = v7;
  queue = self->_queue;
  if (queue)
  {
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __82__CSAutomaticVolumeEnabledMonitor_observeValueForKeyPath_ofObject_change_context___block_invoke;
    v10[3] = &unk_1E7C292A0;
    v11 = v7;
    v12 = self;
    dispatch_async(queue, v10);

  }
}

- (void)_didReceiveAutomaticVolumeToggled:(BOOL)a3
{
  _QWORD v3[5];
  BOOL v4;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __69__CSAutomaticVolumeEnabledMonitor__didReceiveAutomaticVolumeToggled___block_invoke;
  v3[3] = &unk_1E7C27E50;
  v3[4] = self;
  v4 = a3;
  -[CSEventMonitor enumerateObservers:](self, "enumerateObservers:", v3);
}

- (void)_notifyObserver:(id)a3 withEnabled:(BOOL)a4
{
  _BOOL8 v4;
  id v6;

  v4 = a4;
  v6 = a3;
  -[CSEventMonitor notifyObserver:](self, "notifyObserver:", v6);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v6, "CSAutomaticVolumeEnabledMonitor:didReceiveEnabled:", self, v4);

}

- (void)_startMonitoringWithQueue:(id)a3
{
  OS_dispatch_queue **p_queue;
  id v6;
  NSObject *v7;
  _QWORD block[5];

  p_queue = &self->_queue;
  objc_storeStrong((id *)&self->_queue, a3);
  v6 = a3;
  v7 = *p_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __61__CSAutomaticVolumeEnabledMonitor__startMonitoringWithQueue___block_invoke;
  block[3] = &unk_1E7C292C8;
  block[4] = self;
  dispatch_async(v7, block);

}

- (void)_stopMonitoring
{
  OS_dispatch_queue *queue;

  queue = self->_queue;
  self->_queue = 0;

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_defaults, 0);
}

uint64_t __61__CSAutomaticVolumeEnabledMonitor__startMonitoringWithQueue___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0D19110], "sharedPreferences");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 24) = objc_msgSend(v2, "smartSiriVolumeContextAwareEnabled");

  v3 = objc_alloc(MEMORY[0x1E0C99EA0]);
  v4 = objc_msgSend(v3, "initWithSuiteName:", *MEMORY[0x1E0D193D0]);
  v5 = *(_QWORD *)(a1 + 32);
  v6 = *(void **)(v5 + 32);
  *(_QWORD *)(v5 + 32) = v4;

  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "addObserver:forKeyPath:options:context:", *(_QWORD *)(a1 + 32), CFSTR("Adaptive Siri Volume Disabled"), 1, 0);
}

uint64_t __69__CSAutomaticVolumeEnabledMonitor__didReceiveAutomaticVolumeToggled___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_notifyObserver:withEnabled:", a2, *(unsigned __int8 *)(a1 + 40));
}

void __82__CSAutomaticVolumeEnabledMonitor_observeValueForKeyPath_ofObject_change_context___block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  int v4;
  int v5;
  const char *v6;
  __int16 v7;
  int v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(*(id *)(a1 + 32), "isEqual:", CFSTR("Adaptive Siri Volume Disabled")))
  {
    objc_msgSend(MEMORY[0x1E0D19110], "sharedPreferences");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    *(_BYTE *)(*(_QWORD *)(a1 + 40) + 24) = objc_msgSend(v2, "smartSiriVolumeContextAwareEnabled");

    objc_msgSend(*(id *)(a1 + 40), "_didReceiveAutomaticVolumeToggled:", *(unsigned __int8 *)(*(_QWORD *)(a1 + 40) + 24));
    v3 = *MEMORY[0x1E0D18F60];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
    {
      v4 = *(unsigned __int8 *)(*(_QWORD *)(a1 + 40) + 24);
      v5 = 136315394;
      v6 = "-[CSAutomaticVolumeEnabledMonitor observeValueForKeyPath:ofObject:change:context:]_block_invoke";
      v7 = 1026;
      v8 = v4;
      _os_log_impl(&dword_1C2614000, v3, OS_LOG_TYPE_DEFAULT, "%s Automatic Volume Toggled. Automatic Volume Enabled: %{public}d", (uint8_t *)&v5, 0x12u);
    }
  }
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_16009 != -1)
    dispatch_once(&sharedInstance_onceToken_16009, &__block_literal_global_16010);
  return (id)sharedInstance__sharedInstance_16011;
}

void __49__CSAutomaticVolumeEnabledMonitor_sharedInstance__block_invoke()
{
  CSAutomaticVolumeEnabledMonitor *v0;
  void *v1;

  v0 = objc_alloc_init(CSAutomaticVolumeEnabledMonitor);
  v1 = (void *)sharedInstance__sharedInstance_16011;
  sharedInstance__sharedInstance_16011 = (uint64_t)v0;

}

@end
