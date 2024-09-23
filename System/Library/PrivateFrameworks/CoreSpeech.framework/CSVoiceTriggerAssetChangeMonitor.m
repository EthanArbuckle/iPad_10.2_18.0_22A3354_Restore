@implementation CSVoiceTriggerAssetChangeMonitor

- (CSVoiceTriggerAssetChangeMonitor)init
{
  CSVoiceTriggerAssetChangeMonitor *v2;
  CSVoiceTriggerAssetChangeMonitor *v3;
  dispatch_queue_t v4;
  OS_dispatch_queue *queue;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CSVoiceTriggerAssetChangeMonitor;
  v2 = -[CSVoiceTriggerAssetChangeMonitor init](&v7, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_notifyToken = -1;
    v4 = dispatch_queue_create("VoiceTrigger Asset Change Monitor", 0);
    queue = v3->_queue;
    v3->_queue = (OS_dispatch_queue *)v4;

  }
  return v3;
}

- (void)startMonitoring
{
  NSObject *queue;
  _QWORD v4[4];
  id v5;
  id location;

  objc_initWeak(&location, self);
  if (self->_notifyToken == -1)
  {
    queue = self->_queue;
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __51__CSVoiceTriggerAssetChangeMonitor_startMonitoring__block_invoke;
    v4[3] = &unk_1E7C26F50;
    objc_copyWeak(&v5, &location);
    notify_register_dispatch("com.apple.corespeech.voicetriggerassetchange", &self->_notifyToken, queue, v4);
    objc_destroyWeak(&v5);
  }
  objc_destroyWeak(&location);
}

- (void)notifyVoiceTriggerAssetChanged
{
  notify_post("com.apple.corespeech.voicetriggerassetchange");
}

- (CSVoiceTriggerAssetChangeDelegate)delegate
{
  return (CSVoiceTriggerAssetChangeDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_queue, 0);
}

void __51__CSVoiceTriggerAssetChangeMonitor_startMonitoring__block_invoke(uint64_t a1)
{
  id *v1;
  void *v2;
  id v3;
  id WeakRetained;

  v1 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_loadWeakRetained(v1);
  objc_msgSend(v2, "assetChangeMonitorDidDetectAssetChange:", v3);

}

+ (id)sharedMonitor
{
  if (sharedMonitor_onceToken != -1)
    dispatch_once(&sharedMonitor_onceToken, &__block_literal_global_11911);
  return (id)sharedMonitor_sharedMonitor;
}

void __49__CSVoiceTriggerAssetChangeMonitor_sharedMonitor__block_invoke()
{
  CSVoiceTriggerAssetChangeMonitor *v0;
  void *v1;

  v0 = objc_alloc_init(CSVoiceTriggerAssetChangeMonitor);
  v1 = (void *)sharedMonitor_sharedMonitor;
  sharedMonitor_sharedMonitor = (uint64_t)v0;

}

@end
