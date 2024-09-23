@implementation CSAudioStreamActivityMonitor

- (CSAudioStreamActivityMonitor)init
{
  CSAudioStreamActivityMonitor *v2;
  dispatch_queue_t v3;
  OS_dispatch_queue *queue;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CSAudioStreamActivityMonitor;
  v2 = -[CSEventMonitor init](&v6, sel_init);
  if (v2)
  {
    v3 = dispatch_queue_create("CSAudioStreamActivityMonitor", 0);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v3;

  }
  return v2;
}

- (void)_startMonitoringWithQueue:(id)a3
{
  NSObject *v3;
  int v4;
  const char *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v3 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    v4 = 136315138;
    v5 = "-[CSAudioStreamActivityMonitor _startMonitoringWithQueue:]";
    _os_log_impl(&dword_1B502E000, v3, OS_LOG_TYPE_DEFAULT, "%s Start monitoring : audio stream activity", (uint8_t *)&v4, 0xCu);
  }
}

- (void)_stopMonitoring
{
  NSObject *v2;
  int v3;
  const char *v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v2 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    v3 = 136315138;
    v4 = "-[CSAudioStreamActivityMonitor _stopMonitoring]";
    _os_log_impl(&dword_1B502E000, v2, OS_LOG_TYPE_DEFAULT, "%s Stop monitoring : audio stream activity", (uint8_t *)&v3, 0xCu);
  }
}

- (void)notifyActiveStreamsChanged:(id)a3 streamHolders:(id)a4 streamId:(unint64_t)a5
{
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  uint64_t i;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  char v19;
  void *v20;
  NSObject *v21;
  void *v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t j;
  void *v28;
  void *v29;
  NSObject *v30;
  void *v31;
  NSObject *queue;
  uint64_t v33;
  _QWORD v34[5];
  _QWORD block[5];
  char v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  uint8_t v45[128];
  uint8_t buf[4];
  const char *v47;
  __int16 v48;
  void *v49;
  _BYTE v50[128];
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v41 = 0u;
  v42 = 0u;
  v43 = 0u;
  v44 = 0u;
  v9 = v7;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v41, v50, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v42;
    while (2)
    {
      v13 = v8;
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v42 != v12)
          objc_enumerationMutation(v9);
        v15 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * i);
        objc_msgSend(v15, "streamRequest");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v16, "clientIdentity") == 3)
        {

LABEL_13:
          v20 = (void *)CSLogContextFacilityCoreSpeech;
          v19 = 1;
          v8 = v13;
          if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_INFO))
          {
            v21 = v20;
            objc_msgSend(v15, "name");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 136315394;
            v47 = "-[CSAudioStreamActivityMonitor notifyActiveStreamsChanged:streamHolders:streamId:]";
            v48 = 2112;
            v49 = v22;
            _os_log_impl(&dword_1B502E000, v21, OS_LOG_TYPE_INFO, "%s stream %@ is active", buf, 0x16u);

          }
          goto LABEL_15;
        }
        objc_msgSend(v15, "streamRequest");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = objc_msgSend(v17, "clientIdentity");

        if (v18 == 4)
          goto LABEL_13;
      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v41, v50, 16);
      v19 = 0;
      v8 = v13;
      if (v11)
        continue;
      break;
    }
  }
  else
  {
    v19 = 0;
  }
LABEL_15:

  v40 = 0u;
  v38 = 0u;
  v39 = 0u;
  v37 = 0u;
  v23 = v8;
  v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v37, v45, 16);
  if (v24)
  {
    v25 = v24;
    v26 = *(_QWORD *)v38;
    while (2)
    {
      for (j = 0; j != v25; ++j)
      {
        if (*(_QWORD *)v38 != v26)
          objc_enumerationMutation(v23);
        v28 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * j);
        if (objc_msgSend(v28, "clientIdentity") == 6)
        {
          v29 = (void *)CSLogContextFacilityCoreSpeech;
          v19 = 1;
          if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_INFO))
          {
            v30 = v29;
            objc_msgSend(v28, "name");
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 136315394;
            v47 = "-[CSAudioStreamActivityMonitor notifyActiveStreamsChanged:streamHolders:streamId:]";
            v48 = 2112;
            v49 = v31;
            _os_log_impl(&dword_1B502E000, v30, OS_LOG_TYPE_INFO, "%s streamHolder %@ is active", buf, 0x16u);

          }
          goto LABEL_26;
        }
      }
      v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v37, v45, 16);
      if (v25)
        continue;
      break;
    }
  }
LABEL_26:

  queue = self->_queue;
  v33 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __82__CSAudioStreamActivityMonitor_notifyActiveStreamsChanged_streamHolders_streamId___block_invoke;
  block[3] = &unk_1E687F440;
  block[4] = self;
  v36 = v19;
  dispatch_async(queue, block);
  v34[0] = v33;
  v34[1] = 3221225472;
  v34[2] = __82__CSAudioStreamActivityMonitor_notifyActiveStreamsChanged_streamHolders_streamId___block_invoke_2;
  v34[3] = &unk_1E68810D0;
  v34[4] = self;
  -[CSEventMonitor enumerateObserversInQueue:](self, "enumerateObserversInQueue:", v34);

}

- (BOOL)hasNonVoiceTriggerStreamsOrStreamHoldersActive
{
  NSObject *queue;
  char v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __78__CSAudioStreamActivityMonitor_hasNonVoiceTriggerStreamsOrStreamHoldersActive__block_invoke;
  v5[3] = &unk_1E6880D18;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (BOOL)hasNonVoiceTriggerStreamsActive
{
  return self->_hasNonVoiceTriggerStreamsActive;
}

- (void)setHasNonVoiceTriggerStreamsActive:(BOOL)a3
{
  self->_hasNonVoiceTriggerStreamsActive = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
}

uint64_t __78__CSAudioStreamActivityMonitor_hasNonVoiceTriggerStreamsOrStreamHoldersActive__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(result + 32) + 24);
  return result;
}

uint64_t __82__CSAudioStreamActivityMonitor_notifyActiveStreamsChanged_streamHolders_streamId___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setHasNonVoiceTriggerStreamsActive:", *(unsigned __int8 *)(a1 + 40));
}

uint64_t __82__CSAudioStreamActivityMonitor_notifyActiveStreamsChanged_streamHolders_streamId___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "notifyObserver:", a2);
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_1212 != -1)
    dispatch_once(&sharedInstance_onceToken_1212, &__block_literal_global_1213);
  return (id)sharedInstance_monitor;
}

void __46__CSAudioStreamActivityMonitor_sharedInstance__block_invoke()
{
  CSAudioStreamActivityMonitor *v0;
  void *v1;

  v0 = objc_alloc_init(CSAudioStreamActivityMonitor);
  v1 = (void *)sharedInstance_monitor;
  sharedInstance_monitor = (uint64_t)v0;

}

@end
