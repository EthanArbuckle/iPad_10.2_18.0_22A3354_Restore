@implementation CSAudioRouteChangeMonitorImpl

uint64_t __50__CSAudioRouteChangeMonitorImpl_hearstRouteStatus__block_invoke(uint64_t result)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_QWORD *)(*(_QWORD *)(result + 32) + 40);
  return result;
}

uint64_t __48__CSAudioRouteChangeMonitorImpl_jarvisConnected__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(result + 32) + 32);
  return result;
}

- (void)pickableRoutesDidChange:(id)a3
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __57__CSAudioRouteChangeMonitorImpl_pickableRoutesDidChange___block_invoke;
  block[3] = &unk_1E6881138;
  block[4] = self;
  dispatch_async(queue, block);
}

uint64_t __57__CSAudioRouteChangeMonitorImpl_pickableRoutesDidChange___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  _QWORD v5[5];
  uint8_t buf[4];
  const char *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v2 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v7 = "-[CSAudioRouteChangeMonitorImpl pickableRoutesDidChange:]_block_invoke";
    _os_log_impl(&dword_1B502E000, v2, OS_LOG_TYPE_DEFAULT, "%s Received external pickable route change notification", buf, 0xCu);
  }
  v3 = *(void **)(a1 + 32);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __57__CSAudioRouteChangeMonitorImpl_pickableRoutesDidChange___block_invoke_6;
  v5[3] = &unk_1E687EE78;
  v5[4] = v3;
  return objc_msgSend(v3, "_fetchHearstRouteStatusWithCompletion:", v5);
}

- (void)_fetchHearstRouteStatusWithCompletion:(id)a3
{
  id v4;
  _BOOL4 v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v11[4];
  id v12;
  id v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t v18;

  v4 = a3;
  v5 = -[CSAudioRouteChangeMonitorImpl _fetchHearstConnectionState](self, "_fetchHearstConnectionState");
  v15 = 0;
  v16 = &v15;
  v17 = 0x2020000000;
  v6 = 4;
  if (!v5)
    v6 = 5;
  v18 = v6;
  objc_msgSend(MEMORY[0x1E0D48558], "sharedAVSystemController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "attributeForKey:", *MEMORY[0x1E0D48058]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8
    && (objc_msgSend(v8, "objectForKey:", *MEMORY[0x1E0D481C0]),
        v9 = (void *)objc_claimAutoreleasedReturnValue(),
        v9,
        v9))
  {
    objc_msgSend(v8, "objectForKey:", *MEMORY[0x1E0D481F0]);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __71__CSAudioRouteChangeMonitorImpl__fetchHearstRouteStatusWithCompletion___block_invoke;
    v11[3] = &unk_1E687EEA0;
    v12 = v8;
    v14 = &v15;
    v13 = v4;
    -[CSAudioRouteChangeMonitor routeIsDoAPSupportedWithRouteUID:withCompletion:](self, "routeIsDoAPSupportedWithRouteUID:withCompletion:", v10, v11);

  }
  else if (v4)
  {
    (*((void (**)(id, uint64_t))v4 + 2))(v4, v16[3]);
  }

  _Block_object_dispose(&v15, 8);
}

- (BOOL)_fetchHearstConnectionState
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  _QWORD *v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  _QWORD *v15;
  id v16;
  _QWORD *v17;
  void *v18;
  void *v19;
  char v20;
  BOOL v21;
  int v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D48558], "sharedAVSystemController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "attributeForKey:", *MEMORY[0x1E0D48038]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  v4 = v3;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
  if (!v5)
    goto LABEL_15;
  v6 = v5;
  v7 = *(_QWORD *)v25;
  v8 = (_QWORD *)MEMORY[0x1E0D48178];
  v9 = (_QWORD *)MEMORY[0x1E0D481B0];
  do
  {
    for (i = 0; i != v6; ++i)
    {
      if (*(_QWORD *)v25 != v7)
        objc_enumerationMutation(v4);
      v11 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
      objc_msgSend(v11, "objectForKey:", *v8);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(v12, "BOOLValue"))
        goto LABEL_12;
      objc_msgSend(v11, "objectForKey:", *v9);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v13, "BOOLValue") & 1) == 0)
      {

LABEL_12:
        continue;
      }
      objc_msgSend(v11, "objectForKey:", *MEMORY[0x1E0D481B8]);
      v14 = v7;
      v15 = v8;
      v16 = v4;
      v17 = v9;
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = objc_msgSend(v18, "BOOLValue");

      v9 = v17;
      v4 = v16;
      v8 = v15;
      v7 = v14;

      if (v23)
      {
        objc_msgSend(v11, "objectForKey:", *MEMORY[0x1E0D48150]);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = objc_msgSend(v19, "BOOLValue");

        if ((v20 & 1) != 0)
        {
          v21 = 1;
          goto LABEL_16;
        }
      }
    }
    v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
  }
  while (v6);
LABEL_15:
  v21 = 0;
LABEL_16:

  return v21;
}

uint64_t __71__CSAudioRouteChangeMonitorImpl__fetchHearstRouteStatusWithCompletion___block_invoke(uint64_t a1, int a2)
{
  void *v4;
  uint64_t v5;
  void *v6;
  NSObject *v7;
  uint64_t result;
  int v9;
  const char *v10;
  __int16 v11;
  int v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if (a2)
  {
    objc_msgSend(*(id *)(a1 + 32), "objectForKey:", *MEMORY[0x1E0D48118]);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
    {
      v5 = 1;
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 32), "objectForKey:", *MEMORY[0x1E0D48130]);
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v6)
        goto LABEL_7;
      v5 = 2;
    }
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = v5;
  }
LABEL_7:
  v7 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 136315394;
    v10 = "-[CSAudioRouteChangeMonitorImpl _fetchHearstRouteStatusWithCompletion:]_block_invoke";
    v11 = 1024;
    v12 = a2;
    _os_log_impl(&dword_1B502E000, v7, OS_LOG_TYPE_DEFAULT, "%s Current Picked route supportDoAP: %d", (uint8_t *)&v9, 0x12u);
  }
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24));
  return result;
}

uint64_t __57__CSAudioRouteChangeMonitorImpl_pickableRoutesDidChange___block_invoke_6(uint64_t result, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(result + 32);
  if (*(_QWORD *)(v2 + 40) != a2)
  {
    *(_QWORD *)(v2 + 40) = a2;
    return objc_msgSend(*(id *)(result + 32), "_notifyHearstRouteStatus:", a2);
  }
  return result;
}

- (void)_notifyHearstRouteStatus:(int64_t)a3
{
  NSObject *v5;
  _QWORD v6[6];
  uint8_t buf[4];
  const char *v8;
  __int16 v9;
  int64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v5 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v8 = "-[CSAudioRouteChangeMonitorImpl _notifyHearstRouteStatus:]";
    v9 = 2050;
    v10 = a3;
    _os_log_impl(&dword_1B502E000, v5, OS_LOG_TYPE_DEFAULT, "%s Notifying Hearst Route State: %{public}ld", buf, 0x16u);
  }
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __58__CSAudioRouteChangeMonitorImpl__notifyHearstRouteStatus___block_invoke;
  v6[3] = &unk_1E6880FF8;
  v6[4] = self;
  v6[5] = a3;
  -[CSEventMonitor enumerateObserversInQueue:](self, "enumerateObserversInQueue:", v6);
}

- (BOOL)jarvisConnected
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
  v5[2] = __48__CSAudioRouteChangeMonitorImpl_jarvisConnected__block_invoke;
  v5[3] = &unk_1E6880D18;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (int64_t)hearstRouteStatus
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
  v5[2] = __50__CSAudioRouteChangeMonitorImpl_hearstRouteStatus__block_invoke;
  v5[3] = &unk_1E6880D18;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

void __58__CSAudioRouteChangeMonitorImpl__notifyHearstRouteStatus___block_invoke(uint64_t a1, void *a2)
{
  unint64_t v3;
  id v4;

  v4 = a2;
  objc_msgSend(*(id *)(a1 + 32), "notifyObserver:", v4);
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v3 = *(_QWORD *)(a1 + 40) - 1;
    if (v3 <= 4 && ((0x1Bu >> v3) & 1) != 0)
      objc_msgSend(v4, "CSAudioRouteChangeMonitor:didReceiveAudioRouteChangeEvent:", *(_QWORD *)(a1 + 32), qword_1B50D7508[v3]);
  }

}

- (CSAudioRouteChangeMonitorImpl)init
{
  CSAudioRouteChangeMonitorImpl *v3;
  CSAudioRouteChangeMonitorImpl *v4;
  dispatch_queue_t v5;
  OS_dispatch_queue *queue;
  objc_super v8;

  if (+[CSUtils isDarwinOS](CSUtils, "isDarwinOS"))
  {
    v3 = 0;
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)CSAudioRouteChangeMonitorImpl;
    v4 = -[CSEventMonitor init](&v8, sel_init);
    if (v4)
    {
      v5 = dispatch_queue_create("CSAudioRouteChangeMonitorImpl queue", 0);
      queue = v4->_queue;
      v4->_queue = (OS_dispatch_queue *)v5;

    }
    self = v4;
    v3 = self;
  }

  return v3;
}

- (void)getHearstRouteStatus:(id)a3
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
    v7[2] = __54__CSAudioRouteChangeMonitorImpl_getHearstRouteStatus___block_invoke;
    v7[3] = &unk_1E6881160;
    v7[4] = self;
    v8 = v4;
    dispatch_async(queue, v7);

  }
}

- (void)getJarvisConnected:(id)a3
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
    v7[2] = __52__CSAudioRouteChangeMonitorImpl_getJarvisConnected___block_invoke;
    v7[3] = &unk_1E6881160;
    v7[4] = self;
    v8 = v4;
    dispatch_async(queue, v7);

  }
}

- (BOOL)carPlayConnected
{
  void *v2;
  void *v3;
  void *v4;
  char v5;
  void *v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  int v11;
  const char *v12;
  __int16 v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D48558], "sharedAVSystemController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "attributeForKey:", *MEMORY[0x1E0D47F20]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "BOOLValue");

  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    v8 = v7;
    objc_msgSend(v6, "timeIntervalSinceDate:", v2);
    v11 = 136315394;
    v12 = "-[CSAudioRouteChangeMonitorImpl carPlayConnected]";
    v13 = 2050;
    v14 = v9;
    _os_log_impl(&dword_1B502E000, v8, OS_LOG_TYPE_DEFAULT, "%s fetch CarPlay connection attribute elapsed time = %{public}lf", (uint8_t *)&v11, 0x16u);

  }
  return v5;
}

- (void)getHearstOwnershipStatus:(id)a3
{
  id v4;
  void *v5;
  NSObject *queue;
  _QWORD block[4];
  id v8;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    queue = self->_queue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __58__CSAudioRouteChangeMonitorImpl_getHearstOwnershipStatus___block_invoke;
    block[3] = &unk_1E687EE50;
    v8 = v4;
    dispatch_async(queue, block);

  }
}

- (int64_t)hearstOwnership
{
  return 0;
}

- (void)preferredExternalRouteDidChange:(id)a3
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __65__CSAudioRouteChangeMonitorImpl_preferredExternalRouteDidChange___block_invoke;
  block[3] = &unk_1E6881138;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)carPlayAuxStreamSupportDidChange:(id)a3
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __66__CSAudioRouteChangeMonitorImpl_carPlayAuxStreamSupportDidChange___block_invoke;
  block[3] = &unk_1E6881138;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)carPlayIsConnectedDidChange:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  _QWORD v7[5];
  uint8_t buf[4];
  const char *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v9 = "-[CSAudioRouteChangeMonitorImpl carPlayIsConnectedDidChange:]";
    _os_log_impl(&dword_1B502E000, v5, OS_LOG_TYPE_DEFAULT, "%s Received CarPlay connection change notification", buf, 0xCu);
  }
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __61__CSAudioRouteChangeMonitorImpl_carPlayIsConnectedDidChange___block_invoke;
  v7[3] = &unk_1E68810D0;
  v7[4] = self;
  -[CSEventMonitor enumerateObserversInQueue:](self, "enumerateObserversInQueue:", v7);
  if (-[CSAudioRouteChangeMonitorImpl carPlayConnected](self, "carPlayConnected")
    || -[CSAudioRouteChangeMonitorImpl jarvisConnected](self, "jarvisConnected"))
  {
    +[CSCarKitUtils sharedInstance](CSCarKitUtils, "sharedInstance");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleHeadUnitConnectedWithAsyncCompletion:", 0);

  }
}

- (void)_startMonitoringWithQueue:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *queue;
  uint64_t v7;
  CSStateCapture *v8;
  CSStateCapture *stateCapture;
  CSStateCapture *v10;
  _QWORD v11[4];
  id v12;
  _QWORD block[5];
  uint8_t buf[4];
  const char *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[CSAudioRouteChangeMonitorImpl _startObservingSystemControllerLifecycle](self, "_startObservingSystemControllerLifecycle");
  -[CSAudioRouteChangeMonitorImpl _startObservingAudioRouteChange](self, "_startObservingAudioRouteChange");
  v5 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v15 = "-[CSAudioRouteChangeMonitorImpl _startMonitoringWithQueue:]";
    _os_log_impl(&dword_1B502E000, v5, OS_LOG_TYPE_DEFAULT, "%s Start monitoring : AudioRouteChangeMonitor", buf, 0xCu);
  }
  queue = self->_queue;
  v7 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __59__CSAudioRouteChangeMonitorImpl__startMonitoringWithQueue___block_invoke;
  block[3] = &unk_1E6881138;
  block[4] = self;
  dispatch_async(queue, block);
  if (!self->_stateCapture)
  {
    v8 = objc_alloc_init(CSStateCapture);
    stateCapture = self->_stateCapture;
    self->_stateCapture = v8;

    -[CSStateCapture start](self->_stateCapture, "start");
    objc_initWeak((id *)buf, self);
    v10 = self->_stateCapture;
    v11[0] = v7;
    v11[1] = 3221225472;
    v11[2] = __59__CSAudioRouteChangeMonitorImpl__startMonitoringWithQueue___block_invoke_3;
    v11[3] = &unk_1E687F378;
    objc_copyWeak(&v12, (id *)buf);
    -[CSStateCapture setStateCaptureBlock:](v10, "setStateCaptureBlock:", v11);
    objc_destroyWeak(&v12);
    objc_destroyWeak((id *)buf);
  }

}

- (void)_startObservingAudioRouteChange
{
  _QWORD *v3;
  _QWORD *v4;
  _QWORD *v5;
  _QWORD *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  objc_msgSend(MEMORY[0x1E0D48558], "sharedAVSystemController");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  v3 = (_QWORD *)MEMORY[0x1E0D48040];
  v4 = (_QWORD *)MEMORY[0x1E0D48080];
  v5 = (_QWORD *)MEMORY[0x1E0D47F18];
  v6 = (_QWORD *)MEMORY[0x1E0D47F28];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:", *MEMORY[0x1E0D48040], *MEMORY[0x1E0D48080], *MEMORY[0x1E0D47F18], *MEMORY[0x1E0D47F28], 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setAttribute:forKey:error:", v7, *MEMORY[0x1E0D48288], 0);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addObserver:selector:name:object:", self, sel_pickableRoutesDidChange_, *v3, v12);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addObserver:selector:name:object:", self, sel_preferredExternalRouteDidChange_, *v4, v12);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addObserver:selector:name:object:", self, sel_carPlayAuxStreamSupportDidChange_, *v5, v12);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addObserver:selector:name:object:", self, sel_carPlayIsConnectedDidChange_, *v6, v12);

}

- (void)_stopMonitoring
{
  void *v3;
  CSStateCapture *stateCapture;
  CSStateCapture *v5;
  NSObject *v6;
  int v7;
  const char *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  stateCapture = self->_stateCapture;
  if (stateCapture)
  {
    -[CSStateCapture setStateCaptureBlock:](stateCapture, "setStateCaptureBlock:", 0);
    v5 = self->_stateCapture;
    self->_stateCapture = 0;

  }
  v6 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 136315138;
    v8 = "-[CSAudioRouteChangeMonitorImpl _stopMonitoring]";
    _os_log_impl(&dword_1B502E000, v6, OS_LOG_TYPE_DEFAULT, "%s Stop monitoring : AudioRouteChangeMonitor", (uint8_t *)&v7, 0xCu);
  }
}

- (BOOL)_fetchJarvisConnectionState
{
  void *v2;
  void *v3;
  int v4;
  NSObject *v5;
  const __CFString *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  const __CFString *v10;
  int v12;
  const char *v13;
  __int16 v14;
  const __CFString *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D48558], "sharedAVSystemController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "attributeForKey:", *MEMORY[0x1E0D47F20]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLValue");

  v5 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    v6 = CFSTR("NO");
    if (v4)
      v6 = CFSTR("YES");
    v12 = 136315394;
    v13 = "-[CSAudioRouteChangeMonitorImpl _fetchJarvisConnectionState]";
    v14 = 2114;
    v15 = v6;
    _os_log_impl(&dword_1B502E000, v5, OS_LOG_TYPE_DEFAULT, "%s General CarPlay is connected ? %{public}@", (uint8_t *)&v12, 0x16u);
  }
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0D48558], "sharedAVSystemController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "attributeForKey:", *MEMORY[0x1E0D47F10]);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v8, "BOOLValue");

    v9 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
    {
      v10 = CFSTR("NO");
      if (v4)
        v10 = CFSTR("YES");
      v12 = 136315394;
      v13 = "-[CSAudioRouteChangeMonitorImpl _fetchJarvisConnectionState]";
      v14 = 2114;
      v15 = v10;
      _os_log_impl(&dword_1B502E000, v9, OS_LOG_TYPE_DEFAULT, "%s aux stream supported ? %{public}@", (uint8_t *)&v12, 0x16u);
    }
  }
  return v4;
}

- (void)_notifyJarvisConnectionState:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v5;
  _QWORD v6[5];
  BOOL v7;
  uint8_t buf[4];
  const char *v9;
  __int16 v10;
  _BOOL4 v11;
  uint64_t v12;

  v3 = a3;
  v12 = *MEMORY[0x1E0C80C00];
  v5 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v9 = "-[CSAudioRouteChangeMonitorImpl _notifyJarvisConnectionState:]";
    v10 = 1026;
    v11 = v3;
    _os_log_impl(&dword_1B502E000, v5, OS_LOG_TYPE_DEFAULT, "%s Notifying Jarvis Connection State : %{public}d", buf, 0x12u);
  }
  self->_isJarvisConnected = v3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __62__CSAudioRouteChangeMonitorImpl__notifyJarvisConnectionState___block_invoke;
  v6[3] = &unk_1E6880F88;
  v6[4] = self;
  v7 = v3;
  -[CSEventMonitor enumerateObserversInQueue:](self, "enumerateObserversInQueue:", v6);
}

- (void)_systemControllerDied:(id)a3
{
  id v4;
  NSObject *v5;
  int v6;
  const char *v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 136315394;
    v7 = "-[CSAudioRouteChangeMonitorImpl _systemControllerDied:]";
    v8 = 2114;
    v9 = v4;
    _os_log_impl(&dword_1B502E000, v5, OS_LOG_TYPE_DEFAULT, "%s notification = %{public}@", (uint8_t *)&v6, 0x16u);
  }
  -[CSAudioRouteChangeMonitorImpl _startObservingSystemControllerLifecycle](self, "_startObservingSystemControllerLifecycle");
  -[CSAudioRouteChangeMonitorImpl _startObservingAudioRouteChange](self, "_startObservingAudioRouteChange");
  -[CSAudioRouteChangeMonitorImpl preferredExternalRouteDidChange:](self, "preferredExternalRouteDidChange:", 0);
  -[CSAudioRouteChangeMonitorImpl pickableRoutesDidChange:](self, "pickableRoutesDidChange:", 0);
  -[CSAudioRouteChangeMonitorImpl carPlayAuxStreamSupportDidChange:](self, "carPlayAuxStreamSupportDidChange:", 0);
  -[CSAudioRouteChangeMonitorImpl carPlayIsConnectedDidChange:](self, "carPlayIsConnectedDidChange:", 0);

}

- (void)_startObservingSystemControllerLifecycle
{
  void *v3;
  uint64_t *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (uint64_t *)MEMORY[0x1E0D48208];
  objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x1E0D48208], 0);

  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObject:", *v4);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D48558], "sharedAVSystemController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAttribute:forKey:error:", v9, *MEMORY[0x1E0D48288], 0);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = *v4;
  objc_msgSend(MEMORY[0x1E0D48558], "sharedAVSystemController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObserver:selector:name:object:", self, sel__systemControllerDied_, v7, v8);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stateCapture, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

void __62__CSAudioRouteChangeMonitorImpl__notifyJarvisConnectionState___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "notifyObserver:", v3);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "CSAudioRouteChangeMonitor:didReceiveAudioRouteChangeEvent:", *(_QWORD *)(a1 + 32), *(_BYTE *)(a1 + 40) == 0);

}

uint64_t __59__CSAudioRouteChangeMonitorImpl__startMonitoringWithQueue___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t result;
  _QWORD v4[5];

  v2 = *(void **)(a1 + 32);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __59__CSAudioRouteChangeMonitorImpl__startMonitoringWithQueue___block_invoke_2;
  v4[3] = &unk_1E687EE78;
  v4[4] = v2;
  objc_msgSend(v2, "_fetchHearstRouteStatusWithCompletion:", v4);
  result = objc_msgSend(*(id *)(a1 + 32), "_fetchJarvisConnectionState");
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 32) = result;
  return result;
}

CSStateCaptureOptions *__59__CSAudioRouteChangeMonitorImpl__startMonitoringWithQueue___block_invoke_3(uint64_t a1)
{
  id WeakRetained;
  char v2;
  char v3;
  uint64_t v4;
  CSStateCaptureOptions *v5;
  CSStateCaptureOptions *v6;
  _QWORD v8[5];
  char v9;
  char v10;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = objc_msgSend(WeakRetained, "carPlayConnected");
  v3 = objc_msgSend(WeakRetained, "jarvisConnected");
  v4 = objc_msgSend(WeakRetained, "hearstRouteStatus");
  v5 = [CSStateCaptureOptions alloc];
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __59__CSAudioRouteChangeMonitorImpl__startMonitoringWithQueue___block_invoke_4;
  v8[3] = &__block_descriptor_42_e42_v16__0___CSStateCaptureOptionsMutablity__8l;
  v9 = v2;
  v10 = v3;
  v8[4] = v4;
  v6 = -[CSStateCaptureOptions initWithMutableBuilder:](v5, "initWithMutableBuilder:", v8);

  return v6;
}

void __59__CSAudioRouteChangeMonitorImpl__startMonitoringWithQueue___block_invoke_4(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v3 = (void *)MEMORY[0x1E0C99E08];
  v4 = a2;
  objc_msgSend(v3, "dictionary");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 40));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setValue:forKey:", v5, CFSTR("CarPlayConnected"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 41));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setValue:forKey:", v6, CFSTR("JarvisConnected"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", *(_QWORD *)(a1 + 32));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setValue:forKey:", v7, CFSTR("HearstRouteStatus"));

  objc_msgSend(v4, "setStateData:", v8);
  objc_msgSend(v4, "setStateDataTitle:", CFSTR("CoreSpeech-AccessoryDeviceConnectionStateCapture"));

}

uint64_t __59__CSAudioRouteChangeMonitorImpl__startMonitoringWithQueue___block_invoke_2(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(*(_QWORD *)(result + 32) + 40) = a2;
  return result;
}

uint64_t __61__CSAudioRouteChangeMonitorImpl_carPlayIsConnectedDidChange___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "notifyObserver:", a2);
}

unsigned __int8 *__66__CSAudioRouteChangeMonitorImpl_carPlayAuxStreamSupportDidChange___block_invoke(uint64_t a1)
{
  NSObject *v2;
  int v3;
  unsigned __int8 *result;
  int v5;
  const char *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v2 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 136315138;
    v6 = "-[CSAudioRouteChangeMonitorImpl carPlayAuxStreamSupportDidChange:]_block_invoke";
    _os_log_impl(&dword_1B502E000, v2, OS_LOG_TYPE_DEFAULT, "%s Received CarPlay AuxStream support change notification", (uint8_t *)&v5, 0xCu);
  }
  v3 = objc_msgSend(*(id *)(a1 + 32), "_fetchJarvisConnectionState");
  result = *(unsigned __int8 **)(a1 + 32);
  if (result[32] != v3)
    return (unsigned __int8 *)objc_msgSend(result, "_notifyJarvisConnectionState:");
  return result;
}

uint64_t __65__CSAudioRouteChangeMonitorImpl_preferredExternalRouteDidChange___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  _QWORD v5[5];
  uint8_t buf[4];
  const char *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v2 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v7 = "-[CSAudioRouteChangeMonitorImpl preferredExternalRouteDidChange:]_block_invoke";
    _os_log_impl(&dword_1B502E000, v2, OS_LOG_TYPE_DEFAULT, "%s Received external route change notification", buf, 0xCu);
  }
  v3 = *(void **)(a1 + 32);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __65__CSAudioRouteChangeMonitorImpl_preferredExternalRouteDidChange___block_invoke_4;
  v5[3] = &unk_1E687EE78;
  v5[4] = v3;
  return objc_msgSend(v3, "_fetchHearstRouteStatusWithCompletion:", v5);
}

uint64_t __65__CSAudioRouteChangeMonitorImpl_preferredExternalRouteDidChange___block_invoke_4(uint64_t result, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(result + 32);
  if (*(_QWORD *)(v2 + 40) != a2)
  {
    *(_QWORD *)(v2 + 40) = a2;
    return objc_msgSend(*(id *)(result + 32), "_notifyHearstRouteStatus:", a2);
  }
  return result;
}

uint64_t __58__CSAudioRouteChangeMonitorImpl_getHearstOwnershipStatus___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __52__CSAudioRouteChangeMonitorImpl_getJarvisConnected___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 32));
}

uint64_t __54__CSAudioRouteChangeMonitorImpl_getHearstRouteStatus___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40));
}

@end
