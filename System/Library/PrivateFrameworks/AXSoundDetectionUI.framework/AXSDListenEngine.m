@implementation AXSDListenEngine

+ (AXSDListenEngine)sharedInstance
{
  if (sharedInstance_onceToken_3 != -1)
    dispatch_once(&sharedInstance_onceToken_3, &__block_literal_global_4);
  return (AXSDListenEngine *)(id)sharedInstance___SharedEngine;
}

void __34__AXSDListenEngine_sharedInstance__block_invoke()
{
  AXSDListenEngine *v0;
  void *v1;

  v0 = objc_alloc_init(AXSDListenEngine);
  v1 = (void *)sharedInstance___SharedEngine;
  sharedInstance___SharedEngine = (uint64_t)v0;

}

- (AXSDListenEngine)init
{
  AXSDListenEngine *v2;
  AXSDListenEngine *v3;
  AVAudioEngine *audioEngine;
  AVAudioSession *audioSession;
  uint64_t v6;
  NSPointerArray *delegates;
  NSObject *v8;
  dispatch_queue_t v9;
  OS_dispatch_queue *delegateQueue;
  NSObject *v11;
  dispatch_queue_t v12;
  OS_dispatch_queue *audioProcessingQueue;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)AXSDListenEngine;
  v2 = -[AXSDListenEngine init](&v15, sel_init);
  v3 = v2;
  if (v2)
  {
    audioEngine = v2->_audioEngine;
    v2->_audioEngine = 0;

    audioSession = v3->_audioSession;
    v3->_audioSession = 0;

    objc_msgSend(MEMORY[0x24BDD1748], "weakObjectsPointerArray");
    v6 = objc_claimAutoreleasedReturnValue();
    delegates = v3->_delegates;
    v3->_delegates = (NSPointerArray *)v6;

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = dispatch_queue_create("com.apple.accessibility.axhalistenengine.delegatequeue", v8);
    delegateQueue = v3->_delegateQueue;
    v3->_delegateQueue = (OS_dispatch_queue *)v9;

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = dispatch_queue_create("com.apple.accessibility.axhalistenengine.audio", v11);
    audioProcessingQueue = v3->_audioProcessingQueue;
    v3->_audioProcessingQueue = (OS_dispatch_queue *)v12;

    v3->_state = 0;
    -[AXSDListenEngine _activateNotifications](v3, "_activateNotifications");
  }
  return v3;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  -[AXSDListenEngine audioEngineInputNode](self, "audioEngineInputNode");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeTapOnBus:", 0);

  v4.receiver = self;
  v4.super_class = (Class)AXSDListenEngine;
  -[AXSDListenEngine dealloc](&v4, sel_dealloc);
}

- (BOOL)isListening
{
  return !-[AXSDListenEngine _notListeningForAnyReason](self, "_notListeningForAnyReason");
}

- (AVAudioFormat)audioFormat
{
  NSObject *audioProcessingQueue;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__0;
  v10 = __Block_byref_object_dispose__0;
  v11 = 0;
  audioProcessingQueue = self->_audioProcessingQueue;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __31__AXSDListenEngine_audioFormat__block_invoke;
  v5[3] = &unk_24DDF6D08;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(audioProcessingQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (AVAudioFormat *)v3;
}

void __31__AXSDListenEngine_audioFormat__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "audioEngineInputNode");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    objc_msgSend(*(id *)(a1 + 32), "audioEngineInputNode");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "inputFormatForBus:", 0);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v5 = *(void **)(v4 + 40);
    *(_QWORD *)(v4 + 40) = v3;

  }
}

- (unint64_t)bufferSize
{
  return 4410;
}

- (BOOL)supportsVirtualAudioDevice
{
  int v2;
  NSObject *v3;
  const char *v4;
  const char *v5;
  const char *v6;
  int v8;
  const char *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  if (!_os_feature_enabled_impl())
    goto LABEL_10;
  if (MGGetSInt32Answer() == 1)
  {
    if (MGGetBoolAnswer())
      v2 = MGGetBoolAnswer();
    else
      v2 = 0;
    AXLogUltron();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      v6 = "NO";
      if (v2)
        v6 = "YES";
      v8 = 136315138;
      v9 = v6;
      v5 = "iPhone supports VAD: %s";
LABEL_18:
      _os_log_impl(&dword_21ACD4000, v3, OS_LOG_TYPE_DEFAULT, v5, (uint8_t *)&v8, 0xCu);
      goto LABEL_19;
    }
    goto LABEL_19;
  }
  if (MGGetSInt32Answer() != 3)
  {
LABEL_10:
    AXLogUltron();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v8) = 0;
      _os_log_impl(&dword_21ACD4000, v3, OS_LOG_TYPE_DEFAULT, "Device supports VAD: NO", (uint8_t *)&v8, 2u);
    }
    LOBYTE(v2) = 0;
    goto LABEL_19;
  }
  v2 = MGGetBoolAnswer();
  AXLogUltron();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = "NO";
    if (v2)
      v4 = "YES";
    v8 = 136315138;
    v9 = v4;
    v5 = "iPad supports VAD: %s";
    goto LABEL_18;
  }
LABEL_19:

  return v2;
}

- (BOOL)containsListenDelegate:(id)a3
{
  id v4;
  void *v5;
  unint64_t v6;
  id v7;
  BOOL v8;

  v4 = a3;
  v5 = (void *)-[NSPointerArray copy](self->_delegates, "copy");
  if (objc_msgSend(v5, "count"))
  {
    v6 = 0;
    do
    {
      objc_msgSend(v5, "pointerAtIndex:", v6);
      v7 = (id)objc_claimAutoreleasedReturnValue();

      v8 = v7 == v4;
      if (v8)
        break;
      ++v6;
    }
    while (v6 < objc_msgSend(v5, "count"));
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (void)addListenDelegate:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *delegateQueue;
  id v7;
  _QWORD v8[5];
  id v9;

  v4 = a3;
  AXLogUltron();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[AXSDListenEngine addListenDelegate:].cold.1();

  delegateQueue = self->_delegateQueue;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __38__AXSDListenEngine_addListenDelegate___block_invoke;
  v8[3] = &unk_24DDF6B58;
  v8[4] = self;
  v9 = v4;
  v7 = v4;
  dispatch_async(delegateQueue, v8);

}

void __38__AXSDListenEngine_addListenDelegate___block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  _BOOL4 v7;
  NSObject *v8;
  _QWORD *v9;
  uint64_t v10;
  _QWORD v11[5];
  _QWORD block[5];
  uint8_t buf[4];
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x220756A44]();
  if (objc_msgSend(*(id *)(a1 + 32), "containsListenDelegate:", *(_QWORD *)(a1 + 40)))
  {
    AXLogUltron();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      v4 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 138412290;
      v14 = v4;
      _os_log_impl(&dword_21ACD4000, v3, OS_LOG_TYPE_DEFAULT, "Object %@ is already a delegate of AXHAListenEngine", buf, 0xCu);
    }

  }
  else
  {
    v5 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "count");
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "addPointer:", *(_QWORD *)(a1 + 40));
    AXLogUltron();
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG);
    if (v5)
    {
      if (v7)
        __38__AXSDListenEngine_addListenDelegate___block_invoke_cold_2();

      v11[0] = MEMORY[0x24BDAC760];
      v11[1] = 3221225472;
      v11[2] = __38__AXSDListenEngine_addListenDelegate___block_invoke_18;
      v11[3] = &unk_24DDF6AE0;
      v11[4] = *(_QWORD *)(a1 + 32);
      v8 = MEMORY[0x24BDAC9B8];
      v9 = v11;
    }
    else
    {
      if (v7)
        __38__AXSDListenEngine_addListenDelegate___block_invoke_cold_1();

      v10 = *(_QWORD *)(a1 + 32);
      v8 = *(NSObject **)(v10 + 16);
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __38__AXSDListenEngine_addListenDelegate___block_invoke_17;
      block[3] = &unk_24DDF6AE0;
      block[4] = v10;
      v9 = block;
    }
    dispatch_async(v8, v9);
  }
  objc_autoreleasePoolPop(v2);
}

uint64_t __38__AXSDListenEngine_addListenDelegate___block_invoke_17(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_startIfPossibleAndNotify");
}

uint64_t __38__AXSDListenEngine_addListenDelegate___block_invoke_18(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "notifyListeningStartedWithError:", 0);
}

- (void)notifyListeningStartedWithError:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *delegateQueue;
  id v7;
  _QWORD v8[5];
  id v9;

  v4 = a3;
  AXLogUltron();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[AXSDListenEngine notifyListeningStartedWithError:].cold.1((uint64_t)v4, v5);

  delegateQueue = self->_delegateQueue;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __52__AXSDListenEngine_notifyListeningStartedWithError___block_invoke;
  v8[3] = &unk_24DDF6B58;
  v8[4] = self;
  v9 = v4;
  v7 = v4;
  dispatch_async(delegateQueue, v8);

}

uint64_t __52__AXSDListenEngine_notifyListeningStartedWithError___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_notifyListeningStartedWithError:", *(_QWORD *)(a1 + 40));
}

- (void)_notifyListeningStartedWithError:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  NSObject *audioProcessingQueue;
  _QWORD v15[6];
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (void *)-[NSPointerArray copy](self->_delegates, "copy");
  v6 = (void *)MEMORY[0x220756A44]();
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v7 = v5;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v17;
    v11 = MEMORY[0x24BDAC760];
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v17 != v10)
          objc_enumerationMutation(v7);
        v13 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * v12);
        if (v4)
        {
          objc_msgSend(v13, "listenEngineFailedToStartWithError:", v4);
        }
        else
        {
          audioProcessingQueue = self->_audioProcessingQueue;
          v15[0] = v11;
          v15[1] = 3221225472;
          v15[2] = __53__AXSDListenEngine__notifyListeningStartedWithError___block_invoke;
          v15[3] = &unk_24DDF6B58;
          v15[4] = v13;
          v15[5] = self;
          dispatch_async(audioProcessingQueue, v15);
        }
        ++v12;
      }
      while (v9 != v12);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v9);
  }

  objc_autoreleasePoolPop(v6);
}

void __53__AXSDListenEngine__notifyListeningStartedWithError___block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  id v3;

  v1 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "audioEngineInputNode");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "inputFormatForBus:", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "listenEngineDidStartWithInputFormat:", v2);

}

- (void)notifyListeningEncounteredError:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  NSObject *delegateQueue;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;

  v4 = a3;
  AXLogUltron();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[AXSDListenEngine notifyListeningEncounteredError:].cold.1();

  v6 = (void *)-[NSPointerArray copy](self->_delegates, "copy");
  delegateQueue = self->_delegateQueue;
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __52__AXSDListenEngine_notifyListeningEncounteredError___block_invoke;
  v10[3] = &unk_24DDF6B58;
  v11 = v6;
  v12 = v4;
  v8 = v4;
  v9 = v6;
  dispatch_async(delegateQueue, v10);

}

void __52__AXSDListenEngine_notifyListeningEncounteredError___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x220756A44]();
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v3 = *(id *)(a1 + 32);
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v10;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v9 + 1) + 8 * v7);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v8, "listenEngineEncounteredError:", *(_QWORD *)(a1 + 40), (_QWORD)v9);
        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v5);
  }

  objc_autoreleasePoolPop(v2);
}

- (void)notifyListeningReceivedAudioFile:(id)a3
{
  id v4;
  NSObject *v5;
  NSPointerArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  AXLogUltron();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[AXSDListenEngine notifyListeningReceivedAudioFile:].cold.1();

  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v6 = self->_delegates;
  v7 = -[NSPointerArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v13;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v13 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * v10);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v11, "listenEngineReceivedAudioFile:", v4, (_QWORD)v12);
        ++v10;
      }
      while (v8 != v10);
      v8 = -[NSPointerArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v8);
  }

}

- (void)notifyListeningFinishedAudioFile:(id)a3
{
  id v4;
  NSObject *v5;
  NSPointerArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  AXLogUltron();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[AXSDListenEngine notifyListeningFinishedAudioFile:].cold.1();

  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v6 = self->_delegates;
  v7 = -[NSPointerArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v13;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v13 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * v10);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v11, "listenEngineFinishedAudioFile:", v4, (_QWORD)v12);
        ++v10;
      }
      while (v8 != v10);
      v8 = -[NSPointerArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v8);
  }

}

- (void)removeListenDelegate:(id)a3
{
  id v4;
  NSObject *delegateQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  delegateQueue = self->_delegateQueue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __41__AXSDListenEngine_removeListenDelegate___block_invoke;
  v7[3] = &unk_24DDF6B58;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(delegateQueue, v7);

}

void __41__AXSDListenEngine_removeListenDelegate___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  NSObject *v8;
  _QWORD block[5];

  v2 = (void *)MEMORY[0x220756A44]();
  if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "count"))
  {
    v3 = 0;
    while (1)
    {
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "pointerAtIndex:", v3);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = *(void **)(a1 + 40);

      if (v4 == v5)
        break;
      if (++v3 >= (unint64_t)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "count"))
        goto LABEL_10;
    }
    AXLogUltron();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      __41__AXSDListenEngine_removeListenDelegate___block_invoke_cold_1();

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "removePointerAtIndex:", v3);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "compact");
    if (!objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "count"))
    {
      v7 = *(_QWORD *)(a1 + 32);
      v8 = *(NSObject **)(v7 + 16);
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __41__AXSDListenEngine_removeListenDelegate___block_invoke_25;
      block[3] = &unk_24DDF6AE0;
      block[4] = v7;
      dispatch_async(v8, block);
    }
  }
LABEL_10:
  objc_autoreleasePoolPop(v2);
}

uint64_t __41__AXSDListenEngine_removeListenDelegate___block_invoke_25(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_stopListeningAndTransitionToState:", 0);
}

- (int64_t)state
{
  return self->_state;
}

- (void)_setState:(int64_t)a3
{
  NSObject *v5;

  AXLogUltron();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[AXSDListenEngine _setState:].cold.1((uint64_t)self, a3, v5);

  self->_state = a3;
}

+ (id)_stringForState:(int64_t)a3
{
  if ((unint64_t)a3 > 6)
    return CFSTR("StartingUp");
  else
    return off_24DDF6DF0[a3];
}

- (void)_handleBuffer:(id)a3 atTime:(id)a4
{
  -[AXSDListenEngine _handleBuffer:atTime:isFile:](self, "_handleBuffer:atTime:isFile:", a3, a4, 0);
}

- (void)_handleBuffer:(id)a3 atTime:(id)a4 isFile:(BOOL)a5
{
  id v8;
  id v9;
  uint64_t v10;
  NSObject *delegateQueue;
  id v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  _QWORD block[5];
  id v18;
  id v19;
  BOOL v20;

  v8 = a3;
  v9 = a4;
  v10 = MEMORY[0x24BDAC760];
  delegateQueue = self->_delegateQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __48__AXSDListenEngine__handleBuffer_atTime_isFile___block_invoke;
  block[3] = &unk_24DDF6D58;
  block[4] = self;
  v12 = v8;
  v18 = v12;
  v19 = v9;
  v20 = a5;
  v13 = v9;
  dispatch_async(delegateQueue, block);
  v15[0] = v10;
  v15[1] = 3221225472;
  v15[2] = __48__AXSDListenEngine__handleBuffer_atTime_isFile___block_invoke_3;
  v15[3] = &unk_24DDF6AE0;
  v16 = v12;
  v14 = v12;
  dispatch_async(MEMORY[0x24BDAC9B8], v15);

}

unint64_t __48__AXSDListenEngine__handleBuffer_atTime_isFile___block_invoke(uint64_t a1)
{
  unint64_t result;
  unint64_t v3;
  uint64_t v4;
  NSObject *v5;
  _QWORD block[4];
  id v7;
  id v8;
  id v9;
  char v10;
  id location;

  result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "count");
  if (result)
  {
    v3 = 0;
    v4 = MEMORY[0x24BDAC760];
    v5 = MEMORY[0x24BDAC9B8];
    do
    {
      objc_initWeak(&location, (id)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "pointerAtIndex:", v3));
      block[0] = v4;
      block[1] = 3221225472;
      block[2] = __48__AXSDListenEngine__handleBuffer_atTime_isFile___block_invoke_2;
      block[3] = &unk_24DDF6D30;
      objc_copyWeak(&v9, &location);
      v7 = *(id *)(a1 + 40);
      v8 = *(id *)(a1 + 48);
      v10 = *(_BYTE *)(a1 + 56);
      dispatch_async(v5, block);

      objc_destroyWeak(&v9);
      objc_destroyWeak(&location);
      ++v3;
      result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "count");
    }
    while (v3 < result);
  }
  return result;
}

void __48__AXSDListenEngine__handleBuffer_atTime_isFile___block_invoke_2(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  char v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  id v8;

  v2 = (id *)(a1 + 48);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v4 = objc_opt_respondsToSelector();

  v5 = objc_loadWeakRetained(v2);
  v6 = *(_QWORD *)(a1 + 32);
  v7 = *(_QWORD *)(a1 + 40);
  v8 = v5;
  if ((v4 & 1) != 0)
    objc_msgSend(v5, "receivedBuffer:atTime:isFile:", v6, v7, *(unsigned __int8 *)(a1 + 56));
  else
    objc_msgSend(v5, "receivedBuffer:atTime:", v6, v7);

}

void __48__AXSDListenEngine__handleBuffer_atTime_isFile___block_invoke_3(uint64_t a1)
{
  id v2;

  +[AXSDAudioLevelsHelper sharedInstance](AXSDAudioLevelsHelper, "sharedInstance");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "updateListenersWithBuffer:", *(_QWORD *)(a1 + 32));

}

- (id)audioEngineInputNode
{
  AVAudioEngine *audioEngine;
  void *v3;
  NSObject *v4;

  audioEngine = self->_audioEngine;
  if (audioEngine)
  {
    -[AVAudioEngine inputNode](audioEngine, "inputNode");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    AXLogUltron();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      -[AXSDListenEngine audioEngineInputNode].cold.1();

    v3 = 0;
  }
  return v3;
}

- (BOOL)_startListeningWithError:(id *)a3
{
  void *v5;
  int v6;
  NSObject *v7;
  int64_t state;
  NSObject *v9;
  BOOL v10;
  NSObject *v11;
  AVAudioEngine *audioEngine;
  AVAudioEngine *v13;
  AVAudioEngine *v14;
  NSObject *v15;
  AVAudioSession *audioSession;
  AVAudioSession *v17;
  AVAudioSession *v18;
  void *v19;
  void *v20;
  int v21;
  void *v22;
  void *v23;
  uint64_t v24;
  NSObject *v25;
  NSObject *v26;
  NSObject *v27;
  void *v28;
  BOOL v29;
  void *v30;
  void *v31;
  void *v32;
  int v33;
  NSObject *v34;
  NSObject *v35;
  void *v37;
  void *v38;
  double v39;
  NSObject *v40;
  void *v41;
  NSObject *v42;
  uint8_t v43[8];
  _QWORD v44[4];
  id v45;
  uint8_t buf[4];
  void *v47;
  uint64_t v48;

  v48 = *MEMORY[0x24BDAC8D0];
  if (objc_msgSend(MEMORY[0x24BE4BD98], "isInternalInstall"))
  {
    objc_msgSend(MEMORY[0x24BDFF278], "sharedInstance");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "micDisabled");

    if (v6)
    {
      -[AXSDListenEngine _setState:](self, "_setState:", 6);
      return 1;
    }
  }
  AXLogUltron();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21ACD4000, v7, OS_LOG_TYPE_DEFAULT, "AXHAListenEngine will start listening", buf, 2u);
  }

  state = self->_state;
  if ((state & 0xFFFFFFFFFFFFFFFELL) == 4)
  {
    if (state == 4)
    {
      AXLogUltron();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        -[AXSDListenEngine _startListeningWithError:].cold.1();

    }
    return 1;
  }
  if (!self->_audioEngine)
  {
    AXLogUltron();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      audioEngine = self->_audioEngine;
      *(_DWORD *)buf = 138412290;
      v47 = audioEngine;
      _os_log_impl(&dword_21ACD4000, v11, OS_LOG_TYPE_INFO, "Setting up a new audio engine: %@", buf, 0xCu);
    }

    v13 = (AVAudioEngine *)objc_alloc_init(MEMORY[0x24BDB1800]);
    v14 = self->_audioEngine;
    self->_audioEngine = v13;

  }
  if (!self->_audioSession)
  {
    AXLogUltron();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      audioSession = self->_audioSession;
      *(_DWORD *)buf = 138412290;
      v47 = audioSession;
      _os_log_impl(&dword_21ACD4000, v15, OS_LOG_TYPE_INFO, "Getting a new audio session: %@", buf, 0xCu);
    }

    objc_msgSend(MEMORY[0x24BDB1858], "sharedInstance");
    v17 = (AVAudioSession *)objc_claimAutoreleasedReturnValue();
    v18 = self->_audioSession;
    self->_audioSession = v17;

  }
  objc_msgSend(MEMORY[0x24BE64988], "sharedAVSystemController");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "attributeForKey:", *MEMORY[0x24BE64808]);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v20, "BOOLValue");

  if (v21)
  {
    if (a3)
    {
      objc_msgSend(MEMORY[0x24BDD1540], "ax_errorWithDomain:description:", CFSTR("Ultron.CarPlay"), CFSTR("_startListeningWithError called while CarPlay running - going into paused state and will resume when CarPlay disconnects"));
      v10 = 0;
      *a3 = (id)objc_claimAutoreleasedReturnValue();
      return v10;
    }
    return 0;
  }
  -[AXSDListenEngine _setState:](self, "_setState:", 4);
  objc_msgSend(MEMORY[0x24BE64988], "sharedAVSystemController");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "attributeForKey:", *MEMORY[0x24BE64868]);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = objc_msgSend(v23, "BOOLValue");

  if ((_DWORD)v24)
  {
    AXLogUltron();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21ACD4000, v25, OS_LOG_TYPE_DEFAULT, "Something is NOW PLAYING; SR must interrupt to startup.",
        buf,
        2u);
    }

  }
  -[AXSDListenEngine _setupAudioInputWithError:shouldInterrupt:](self, "_setupAudioInputWithError:shouldInterrupt:", a3, v24);
  if (a3)
  {
    if (*a3)
    {
      AXLogUltron();
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
        -[AXSDListenEngine _startListeningWithError:].cold.8(v24, (uint64_t *)a3, v26);
LABEL_60:

      return 0;
    }
    -[AVAudioSession setParticipatesInVolumePolicy:error:](self->_audioSession, "setParticipatesInVolumePolicy:error:", 0, a3);
    if (*a3)
    {
      AXLogUltron();
      v34 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
        -[AXSDListenEngine _startListeningWithError:].cold.7();

      *a3 = 0;
    }
    -[AVAudioSession setEligibleForBTSmartRoutingConsideration:error:](self->_audioSession, "setEligibleForBTSmartRoutingConsideration:error:", 0, a3);
    if (*a3)
    {
      AXLogUltron();
      v35 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
        -[AXSDListenEngine _startListeningWithError:].cold.6();

      *a3 = 0;
    }
    -[AVAudioSession setActive:error:](self->_audioSession, "setActive:error:", 1, a3);
    if (*a3)
    {
      AXLogUltron();
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
        -[AXSDListenEngine _startListeningWithError:].cold.5();
      goto LABEL_60;
    }
  }
  else
  {
    -[AVAudioSession setParticipatesInVolumePolicy:error:](self->_audioSession, "setParticipatesInVolumePolicy:error:", 0, 0);
    -[AVAudioSession setEligibleForBTSmartRoutingConsideration:error:](self->_audioSession, "setEligibleForBTSmartRoutingConsideration:error:", 0, 0);
    -[AVAudioSession setActive:error:](self->_audioSession, "setActive:error:", 1, 0);
  }
  if ((_DWORD)v24)
  {
    AXLogUltron();
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21ACD4000, v27, OS_LOG_TYPE_DEFAULT, "Reconfiguring audio session to be mixable.", buf, 2u);
    }

    -[AXSDListenEngine _setupAudioInputWithError:shouldInterrupt:](self, "_setupAudioInputWithError:shouldInterrupt:", a3, 0);
    if (a3)
    {
      if (*a3)
      {
        AXLogUltron();
        v26 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
          -[AXSDListenEngine _startListeningWithError:].cold.4();
        goto LABEL_60;
      }
    }
  }
  -[AVAudioEngine attachedNodes](self->_audioEngine, "attachedNodes");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = objc_msgSend(v28, "count") == 0;

  if (!v29)
  {
    -[AXSDListenEngine audioEngineInputNode](self, "audioEngineInputNode");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "removeTapOnBus:", 0);

  }
  -[AXSDListenEngine audioEngineInputNode](self, "audioEngineInputNode");

  -[AXSDListenEngine audioEngine](self, "audioEngine");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "prepare");

  -[AXSDListenEngine audioEngine](self, "audioEngine");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = objc_msgSend(v32, "startAndReturnError:", a3);

  if (!v33 || a3 && *a3)
  {
    AXLogUltron();
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      -[AXSDListenEngine _startListeningWithError:].cold.3();
    goto LABEL_60;
  }
  -[AXSDListenEngine audioEngineInputNode](self, "audioEngineInputNode");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "inputFormatForBus:", 0);
  v38 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v38, "channelCount") && (objc_msgSend(v38, "sampleRate"), v39 != 0.0))
  {
    objc_initWeak((id *)buf, self);
    -[AXSDListenEngine audioEngineInputNode](self, "audioEngineInputNode");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v44[0] = MEMORY[0x24BDAC760];
    v44[1] = 3221225472;
    v44[2] = __45__AXSDListenEngine__startListeningWithError___block_invoke;
    v44[3] = &unk_24DDF6D80;
    objc_copyWeak(&v45, (id *)buf);
    objc_msgSend(v41, "installTapOnBus:bufferSize:format:block:", 0, 4410, v38, v44);

    -[AXSDListenEngine _setState:](self, "_setState:", 5);
    AXLogUltron();
    v42 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v43 = 0;
      _os_log_impl(&dword_21ACD4000, v42, OS_LOG_TYPE_DEFAULT, "AXHAListenEngine did start listening", v43, 2u);
    }

    objc_destroyWeak(&v45);
    objc_destroyWeak((id *)buf);
    v10 = 1;
  }
  else
  {
    AXLogUltron();
    v40 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
      -[AXSDListenEngine _startListeningWithError:].cold.2();

    if (a3)
    {
      objc_msgSend(MEMORY[0x24BDD1540], "ax_errorWithDomain:description:", CFSTR("com.apple.accessibility.ultron"), CFSTR("Invalid input format: %@"), v38);
      v10 = 0;
      *a3 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v10 = 0;
    }
  }

  return v10;
}

void __45__AXSDListenEngine__startListeningWithError___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id *v4;
  id v5;
  id v6;
  id WeakRetained;

  v4 = (id *)(a1 + 32);
  v5 = a3;
  v6 = a2;
  WeakRetained = objc_loadWeakRetained(v4);
  objc_msgSend(WeakRetained, "_handleBuffer:atTime:", v6, v5);

}

- (BOOL)_notListeningForAnyReason
{
  return +[AXSDListenEngine _stateIsNotListening:](AXSDListenEngine, "_stateIsNotListening:", self->_state);
}

+ (BOOL)_stateIsNotListening:(int64_t)a3
{
  return (unint64_t)(a3 - 7) < 0xFFFFFFFFFFFFFFFDLL;
}

- (BOOL)_stopListeningAndTransitionToState:(int64_t)a3
{
  NSObject *v5;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  AVAudioEngine *audioEngine;
  AVAudioSession *audioSession;
  _BOOL4 v12;
  NSObject *v13;
  NSObject *v14;
  AVAudioSession *v15;
  NSObject *v16;
  uint8_t v18[8];
  id v19;
  uint8_t v20[16];
  uint8_t buf[16];

  AXLogUltron();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21ACD4000, v5, OS_LOG_TYPE_DEFAULT, "AXHAListenEngine will stop listening.", buf, 2u);
  }

  if (!+[AXSDListenEngine _stateIsNotListening:](AXSDListenEngine, "_stateIsNotListening:", a3))
  {
    AXLogUltron();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[AXSDListenEngine _stopListeningAndTransitionToState:].cold.2();

    a3 = 1;
  }
  if (-[AXSDListenEngine _notListeningForAnyReason](self, "_notListeningForAnyReason"))
  {
    -[AXSDListenEngine _setState:](self, "_setState:", a3);
    AXLogUltron();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v20 = 0;
      _os_log_impl(&dword_21ACD4000, v7, OS_LOG_TYPE_DEFAULT, "AXHAListenEngine was already stopped", v20, 2u);
    }
  }
  else
  {
    if (self->_audioEngine)
    {
      -[AXSDListenEngine audioEngineInputNode](self, "audioEngineInputNode");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "removeTapOnBus:", 0);

      -[AXSDListenEngine audioEngine](self, "audioEngine");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "stop");

      audioEngine = self->_audioEngine;
      self->_audioEngine = 0;

    }
    audioSession = self->_audioSession;
    v19 = 0;
    v12 = -[AVAudioSession setActive:withOptions:error:](audioSession, "setActive:withOptions:error:", 0, 1, &v19);
    v13 = v19;
    v7 = v13;
    if (!v12 || v13)
    {
      AXLogUltron();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        -[AXSDListenEngine _stopListeningAndTransitionToState:].cold.1();

    }
    v15 = self->_audioSession;
    self->_audioSession = 0;

    -[AXSDListenEngine _setState:](self, "_setState:", a3);
    AXLogUltron();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v18 = 0;
      _os_log_impl(&dword_21ACD4000, v16, OS_LOG_TYPE_DEFAULT, "AXHAListenEngine did stop listening", v18, 2u);
    }

  }
  return 1;
}

- (void)_activateNotifications
{
  NSObject *v3;
  void *v4;
  uint64_t *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  _QWORD v16[4];
  id v17;
  _QWORD v18[4];
  id v19;
  id buf[2];
  _QWORD v21[2];

  v21[1] = *MEMORY[0x24BDAC8D0];
  AXLogUltron();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl(&dword_21ACD4000, v3, OS_LOG_TYPE_INFO, "Activating Notifications", (uint8_t *)buf, 2u);
  }

  objc_msgSend(MEMORY[0x24BE64988], "sharedAVSystemController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (uint64_t *)MEMORY[0x24BE64810];
  v21[0] = *MEMORY[0x24BE64810];
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v21, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAttribute:forKey:error:", v6, *MEMORY[0x24BE64930], 0);

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = *v5;
  objc_msgSend(MEMORY[0x24BE64988], "sharedAVSystemController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addObserver:selector:name:object:", self, sel__carPlayIsConnectedDidChange_, v8, v9);

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addObserver:selector:name:object:", self, sel__handleAudioSessionInterruption_, *MEMORY[0x24BDB15D8], self->_audioSession);

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addObserver:selector:name:object:", self, sel__handleConfigurationChangeNotification_, *MEMORY[0x24BDB1580], self->_audioEngine);

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "addObserver:selector:name:object:", self, sel__mediaServicesWereReset_, *MEMORY[0x24BDB1610], self->_audioSession);

  if (objc_msgSend(MEMORY[0x24BE4BD98], "isInternalInstall"))
  {
    objc_initWeak(buf, self);
    objc_msgSend(MEMORY[0x24BDFF278], "sharedInstance");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = MEMORY[0x24BDAC760];
    v18[0] = MEMORY[0x24BDAC760];
    v18[1] = 3221225472;
    v18[2] = __42__AXSDListenEngine__activateNotifications__block_invoke;
    v18[3] = &unk_24DDF6738;
    objc_copyWeak(&v19, buf);
    objc_msgSend(v13, "registerUpdateBlock:forRetrieveSelector:withListener:", v18, sel_micDisabled, self);

    objc_msgSend(MEMORY[0x24BDFF278], "sharedInstance");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = v14;
    v16[1] = 3221225472;
    v16[2] = __42__AXSDListenEngine__activateNotifications__block_invoke_2;
    v16[3] = &unk_24DDF6738;
    objc_copyWeak(&v17, buf);
    objc_msgSend(v15, "registerUpdateBlock:forRetrieveSelector:withListener:", v16, sel_pipedInFile, self);

    objc_destroyWeak(&v17);
    objc_destroyWeak(&v19);
    objc_destroyWeak(buf);
  }
}

void __42__AXSDListenEngine__activateNotifications__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_micDisabledUpdated");

}

void __42__AXSDListenEngine__activateNotifications__block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_pipedInFileUpdated");

}

- (void)_micDisabledUpdated
{
  void *v3;
  int v4;
  __CFString *v5;
  __CFString *v6;
  NSObject *v7;
  void *v8;
  int v9;
  NSObject *audioProcessingQueue;
  _QWORD *v11;
  _QWORD v12[5];
  _QWORD v13[5];
  uint8_t buf[4];
  __CFString *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  if (objc_msgSend(MEMORY[0x24BE4BD98], "isInternalInstall"))
  {
    objc_msgSend(MEMORY[0x24BDFF278], "sharedInstance");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "micDisabled");
    v5 = CFSTR("enabled");
    if (v4)
      v5 = CFSTR("disabled");
    v6 = v5;

    AXLogUltron();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v15 = v6;
      _os_log_impl(&dword_21ACD4000, v7, OS_LOG_TYPE_DEFAULT, "AUTOMATION: Mic: %@", buf, 0xCu);
    }

    objc_msgSend(MEMORY[0x24BDFF278], "sharedInstance");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "micDisabled");

    if (v9)
    {
      if (!-[AXSDListenEngine isListening](self, "isListening"))
      {
LABEL_11:

        return;
      }
      audioProcessingQueue = self->_audioProcessingQueue;
      v13[0] = MEMORY[0x24BDAC760];
      v13[1] = 3221225472;
      v13[2] = __39__AXSDListenEngine__micDisabledUpdated__block_invoke;
      v13[3] = &unk_24DDF6AE0;
      v13[4] = self;
      v11 = v13;
    }
    else
    {
      audioProcessingQueue = self->_audioProcessingQueue;
      v12[0] = MEMORY[0x24BDAC760];
      v12[1] = 3221225472;
      v12[2] = __39__AXSDListenEngine__micDisabledUpdated__block_invoke_2;
      v12[3] = &unk_24DDF6AE0;
      v12[4] = self;
      v11 = v12;
    }
    dispatch_async(audioProcessingQueue, v11);
    goto LABEL_11;
  }
}

uint64_t __39__AXSDListenEngine__micDisabledUpdated__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_stopListeningAndTransitionToState:", 1);
  return objc_msgSend(*(id *)(a1 + 32), "_startListeningWithError:", 0);
}

uint64_t __39__AXSDListenEngine__micDisabledUpdated__block_invoke_2(uint64_t a1)
{
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "_stopListeningAndTransitionToState:", 1);
  result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "count");
  if (result)
    return objc_msgSend(*(id *)(a1 + 32), "_startIfPossibleAndNotify");
  return result;
}

- (void)_pipedInFileUpdated
{
  void *v2;
  void *v3;
  uint8_t v4[24];
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDFF278], "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "pipedInFile");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_0();
  _os_log_error_impl(&dword_21ACD4000, a1, OS_LOG_TYPE_ERROR, "Not processing piped in file: (%@)", v4, 0xCu);

  OUTLINED_FUNCTION_5();
}

- (void)pipeInFile:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  NSObject *v8;
  BOOL v9;
  NSObject *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  id v19;
  uint64_t v20;
  NSObject *v21;
  NSObject *v22;
  id v23;
  id v24;
  uint8_t buf[4];
  id v26;
  __int16 v27;
  void *v28;
  __int16 v29;
  id v30;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = 0;
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDB1810]), "initForReading:error:", v5, &v24);
  v7 = v24;
  AXLogUltron();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v26 = v6;
    _os_log_impl(&dword_21ACD4000, v8, OS_LOG_TYPE_DEFAULT, "Processing file: %@", buf, 0xCu);
  }

  if (v6)
    v9 = v7 == 0;
  else
    v9 = 0;
  if (v9)
  {
    -[AXSDListenEngine notifyListeningReceivedAudioFile:](self, "notifyListeningReceivedAudioFile:", v6);
    v11 = objc_msgSend(v6, "framePosition");
    if (v11 >= objc_msgSend(v6, "length"))
    {
LABEL_19:
      AXLogUltron();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v26 = v6;
        _os_log_impl(&dword_21ACD4000, v22, OS_LOG_TYPE_DEFAULT, "Finished processing: %@", buf, 0xCu);
      }

      -[AXSDListenEngine notifyListeningFinishedAudioFile:](self, "notifyListeningFinishedAudioFile:", v6);
      CFRunLoopRunInMode((CFRunLoopMode)*MEMORY[0x24BDBD5A0], 1.0, 0);
      v7 = 0;
    }
    else
    {
      while (1)
      {
        v12 = (void *)MEMORY[0x24BDB1880];
        v13 = objc_msgSend(v6, "framePosition");
        objc_msgSend(v6, "processingFormat");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "sampleRate");
        objc_msgSend(v12, "timeWithSampleTime:atRate:", v13);
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        v16 = objc_alloc(MEMORY[0x24BDB1838]);
        objc_msgSend(v6, "processingFormat");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = (void *)objc_msgSend(v16, "initWithPCMFormat:frameCapacity:", v17, 4410);

        v23 = 0;
        objc_msgSend(v6, "readIntoBuffer:error:", v18, &v23);
        v19 = v23;
        if (v19)
          break;
        if (!objc_msgSend(v18, "frameLength"))
        {

          goto LABEL_19;
        }
        -[AXSDListenEngine _handleBuffer:atTime:isFile:](self, "_handleBuffer:atTime:isFile:", v18, v15, 1);

        v20 = objc_msgSend(v6, "framePosition");
        if (v20 >= objc_msgSend(v6, "length"))
          goto LABEL_19;
      }
      v7 = v19;
      AXLogUltron();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        -[AXSDListenEngine pipeInFile:].cold.1();

      -[AXSDListenEngine notifyListeningEncounteredError:](self, "notifyListeningEncounteredError:", v7);
    }
  }
  else
  {
    AXLogUltron();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412802;
      v26 = v4;
      v27 = 2112;
      v28 = v5;
      v29 = 2112;
      v30 = v7;
      _os_log_error_impl(&dword_21ACD4000, v10, OS_LOG_TYPE_ERROR, "AUTOMATION: Unable to open file: %@\n%@\n%@", buf, 0x20u);
    }

    -[AXSDListenEngine notifyListeningEncounteredError:](self, "notifyListeningEncounteredError:", v7);
  }

}

- (void)_setupAudioInputWithError:(id *)a3 shouldInterrupt:(BOOL)a4
{
  uint64_t v7;
  NSObject *v8;
  NSObject *v9;
  NSObject *v10;
  _BOOL4 v11;
  NSObject *v12;
  _BOOL4 v13;
  NSObject *v14;
  void *v15;
  void *v16;
  const char *v17;
  void *v18;
  int v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  if (a4)
    v7 = 40;
  else
    v7 = 41;
  if (objc_msgSend(MEMORY[0x24BE4BD98], "currentProcessIsAXUIServer"))
  {
    AXLogUltron();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      LOWORD(v19) = 0;
      _os_log_impl(&dword_21ACD4000, v8, OS_LOG_TYPE_INFO, "Disabling microphone usage indicator for AXSDListenEngine", (uint8_t *)&v19, 2u);
    }

    -[AVAudioSession setPrefersNoMicrophoneUsageIndicator:error:](self->_audioSession, "setPrefersNoMicrophoneUsageIndicator:error:", 1, a3);
    if (a3 && *a3)
    {
      AXLogUltron();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        -[AXSDListenEngine _setupAudioInputWithError:shouldInterrupt:].cold.9();

      *a3 = 0;
    }
  }
  -[AVAudioSession setMXSessionProperty:value:error:](self->_audioSession, "setMXSessionProperty:value:error:", *MEMORY[0x24BE64B18], MEMORY[0x24BDBD1C8], a3);
  if (a3 && *a3)
  {
    AXLogUltron();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      -[AXSDListenEngine _setupAudioInputWithError:shouldInterrupt:].cold.8();

    *a3 = 0;
  }
  v11 = -[AXSDListenEngine supportsVirtualAudioDevice](self, "supportsVirtualAudioDevice");
  AXLogUltron();
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);
  if (!v11)
  {
    if (v13)
    {
      LOWORD(v19) = 0;
      _os_log_impl(&dword_21ACD4000, v12, OS_LOG_TYPE_DEFAULT, "Using legacy Default Audio Session.", (uint8_t *)&v19, 2u);
    }

    -[AVAudioSession setCategory:mode:options:error:](self->_audioSession, "setCategory:mode:options:error:", *MEMORY[0x24BDB15A0], *MEMORY[0x24BDB1618], v7, a3);
    if (a3)
    {
      if (*a3)
      {
        AXLogUltron();
        v14 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
          goto LABEL_54;
        goto LABEL_23;
      }
      if (a4)
        return;
      -[AVAudioSession setAudioHardwareControlFlags:error:](self->_audioSession, "setAudioHardwareControlFlags:error:", 2, a3);
      if (*a3)
      {
        AXLogUltron();
        v14 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
          -[AXSDListenEngine _setupAudioInputWithError:shouldInterrupt:].cold.6();
        goto LABEL_54;
      }
      -[AVAudioSession preferDecoupledIO:error:](self->_audioSession, "preferDecoupledIO:error:", 1, a3);
      if (*a3)
      {
        AXLogUltron();
        v14 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
          -[AXSDListenEngine _setupAudioInputWithError:shouldInterrupt:].cold.5();
        goto LABEL_54;
      }
      -[AVAudioSession setAllowHapticsAndSystemSoundsDuringRecording:error:](self->_audioSession, "setAllowHapticsAndSystemSoundsDuringRecording:error:", 1, a3);
      if (*a3)
      {
        AXLogUltron();
        v14 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
          goto LABEL_54;
LABEL_53:
        -[AXSDListenEngine _setupAudioInputWithError:shouldInterrupt:].cold.3();
        goto LABEL_54;
      }
      -[AVAudioSession setParticipatesInVolumePolicy:error:](self->_audioSession, "setParticipatesInVolumePolicy:error:", 0, a3);
      if (*a3)
      {
        AXLogUltron();
        v14 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
          goto LABEL_54;
        goto LABEL_53;
      }
    }
    else
    {
      if (a4)
        return;
      -[AVAudioSession setAudioHardwareControlFlags:error:](self->_audioSession, "setAudioHardwareControlFlags:error:", 2, 0);
      -[AVAudioSession preferDecoupledIO:error:](self->_audioSession, "preferDecoupledIO:error:", 1, 0);
      -[AVAudioSession setAllowHapticsAndSystemSoundsDuringRecording:error:](self->_audioSession, "setAllowHapticsAndSystemSoundsDuringRecording:error:", 1, 0);
      -[AVAudioSession setParticipatesInVolumePolicy:error:](self->_audioSession, "setParticipatesInVolumePolicy:error:", 0, 0);
    }
    AXLogUltron();
    v14 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      goto LABEL_54;
    v18 = (void *)MEMORY[0x24BDD16E0];
    -[AVAudioSession preferredInputSampleRate](self->_audioSession, "preferredInputSampleRate");
    objc_msgSend(v18, "numberWithDouble:");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = 138412290;
    v20 = v16;
    v17 = "Successfully initialized audio session for listen: Preferred rate: %@";
    goto LABEL_37;
  }
  if (v13)
  {
    LOWORD(v19) = 0;
    _os_log_impl(&dword_21ACD4000, v12, OS_LOG_TYPE_DEFAULT, "Using Sound Recognition Mode for Audio Session.", (uint8_t *)&v19, 2u);
  }

  -[AVAudioSession setCategory:mode:options:error:](self->_audioSession, "setCategory:mode:options:error:", *MEMORY[0x24BDB15A0], *MEMORY[0x24BDB1638], v7, a3);
  if (!a3)
  {
    -[AVAudioSession setAllowHapticsAndSystemSoundsDuringRecording:error:](self->_audioSession, "setAllowHapticsAndSystemSoundsDuringRecording:error:", 1, 0);
LABEL_31:
    AXLogUltron();
    v14 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      goto LABEL_54;
    v15 = (void *)MEMORY[0x24BDD16E0];
    -[AVAudioSession preferredInputSampleRate](self->_audioSession, "preferredInputSampleRate");
    objc_msgSend(v15, "numberWithDouble:");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = 138412290;
    v20 = v16;
    v17 = "Successfully initialized audio session for listen with Sound Recognition Mode: Preferred rate: %@";
LABEL_37:
    _os_log_impl(&dword_21ACD4000, v14, OS_LOG_TYPE_DEFAULT, v17, (uint8_t *)&v19, 0xCu);

    goto LABEL_54;
  }
  if (!*a3)
  {
    -[AVAudioSession setAllowHapticsAndSystemSoundsDuringRecording:error:](self->_audioSession, "setAllowHapticsAndSystemSoundsDuringRecording:error:", 1, a3);
    if (*a3)
    {
      AXLogUltron();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        -[AXSDListenEngine _setupAudioInputWithError:shouldInterrupt:].cold.1();
      goto LABEL_54;
    }
    goto LABEL_31;
  }
  AXLogUltron();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
LABEL_23:
    -[AXSDListenEngine _setupAudioInputWithError:shouldInterrupt:].cold.2();
LABEL_54:

}

- (void)_startIfPossibleAndNotify
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_1(&dword_21ACD4000, v0, v1, "Error starting Sound Recognition: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

uint64_t __45__AXSDListenEngine__startIfPossibleAndNotify__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "notifyListeningStartedWithError:", *(_QWORD *)(a1 + 40));
}

- (void)_handleAudioSessionInterruption:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  NSObject *audioProcessingQueue;
  _QWORD v11[6];
  uint8_t buf[4];
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  AXLogUltron();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v13 = v4;
    _os_log_impl(&dword_21ACD4000, v5, OS_LOG_TYPE_DEFAULT, "Audio Session received Audio Interruption: %@", buf, 0xCu);
  }

  objc_msgSend(v4, "userInfo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", *MEMORY[0x24BDB15F0]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "unsignedIntegerValue");

  objc_msgSend(v6, "objectForKey:", *MEMORY[0x24BDB15E0]);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "unsignedIntegerValue");

  audioProcessingQueue = self->_audioProcessingQueue;
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __52__AXSDListenEngine__handleAudioSessionInterruption___block_invoke;
  v11[3] = &unk_24DDF6DA8;
  v11[4] = self;
  v11[5] = v8;
  dispatch_async(audioProcessingQueue, v11);

}

uint64_t __52__AXSDListenEngine__handleAudioSessionInterruption___block_invoke(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;
  NSObject *v3;
  uint64_t v4;
  uint8_t v5[16];
  uint8_t buf[16];

  v1 = result;
  v2 = *(_QWORD *)(result + 40);
  if (v2)
  {
    if (v2 != 1)
      return result;
    AXLogUltron();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v4 = 2;
      _os_log_impl(&dword_21ACD4000, v3, OS_LOG_TYPE_DEFAULT, "Audio Session interruption started", buf, 2u);
    }
    else
    {
      v4 = 2;
    }
  }
  else
  {
    AXLogUltron();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl(&dword_21ACD4000, v3, OS_LOG_TYPE_DEFAULT, "Audio Session interruption ended", v5, 2u);
    }
    v4 = 5;
  }

  return objc_msgSend(*(id *)(v1 + 32), "_handleInterruptionRequestingState:", v4);
}

- (void)_handleInterruptionRequestingState:(int64_t)a3
{
  int64_t state;
  unint64_t v4;
  NSObject *v5;

  state = self->_state;
  if (state != a3)
  {
    v4 = state & 0xFFFFFFFFFFFFFFFELL;
    if (a3 == 2 && v4 == 4)
    {
      -[AXSDListenEngine _stopListeningAndTransitionToState:](self, "_stopListeningAndTransitionToState:", 2);
    }
    else if (a3 == 5 && v4 == 2)
    {
      -[AXSDListenEngine _startIfPossibleAndNotify](self, "_startIfPossibleAndNotify");
    }
    else
    {
      AXLogUltron();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
        -[AXSDListenEngine _handleInterruptionRequestingState:].cold.1();

    }
  }
}

- (void)_carPlayIsConnectedDidChange:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  int v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  AXLogUltron();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 138412290;
    v8 = v4;
    _os_log_impl(&dword_21ACD4000, v5, OS_LOG_TYPE_DEFAULT, "CarPlay is Connected Changed: %@", (uint8_t *)&v7, 0xCu);
  }

  if (!-[AXSDListenEngine supportsVirtualAudioDevice](self, "supportsVirtualAudioDevice"))
  {
    AXLogUltron();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v7) = 0;
      _os_log_impl(&dword_21ACD4000, v6, OS_LOG_TYPE_DEFAULT, "CarPlay is not supported on this device. Interrupting audio session.", (uint8_t *)&v7, 2u);
    }

    -[AXSDListenEngine _interruptCarPlay:](self, "_interruptCarPlay:", v4);
  }

}

- (void)_interruptCarPlay:(id)a3
{
  void *v4;
  void *v5;
  char v6;
  NSObject *audioProcessingQueue;
  _QWORD v8[5];
  char v9;

  objc_msgSend(a3, "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x24BE64818]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "BOOLValue");

  audioProcessingQueue = self->_audioProcessingQueue;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __38__AXSDListenEngine__interruptCarPlay___block_invoke;
  v8[3] = &unk_24DDF6DD0;
  v9 = v6;
  v8[4] = self;
  dispatch_async(audioProcessingQueue, v8);
}

void __38__AXSDListenEngine__interruptCarPlay___block_invoke(uint64_t a1)
{
  int v2;
  _QWORD *v3;
  uint64_t v4;
  NSObject *v5;
  dispatch_time_t v6;
  uint64_t v7;
  NSObject *v8;
  NSObject *v9;
  int v10;
  uint64_t v11;
  _QWORD block[5];
  uint8_t buf[4];
  int v14;
  __int16 v15;
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v2 = *(unsigned __int8 *)(a1 + 40);
  v3 = *(_QWORD **)(a1 + 32);
  v4 = v3[4];
  if (v2)
  {
    if ((v4 & 0xFFFFFFFFFFFFFFFELL) == 4)
    {
      objc_msgSend(v3, "_handleInterruptionRequestingState:", 2);
      return;
    }
    goto LABEL_8;
  }
  if (v4 != 2)
  {
LABEL_8:
    AXLogUltron();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      v10 = *(unsigned __int8 *)(a1 + 40);
      v11 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32);
      *(_DWORD *)buf = 67109376;
      v14 = v10;
      v15 = 2048;
      v16 = v11;
      _os_log_impl(&dword_21ACD4000, v9, OS_LOG_TYPE_INFO, "CarPlay changed state connected:%i, but nothing to do b/c SR in state: %ld", buf, 0x12u);
    }

    return;
  }
  AXLogUltron();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21ACD4000, v5, OS_LOG_TYPE_DEFAULT, "CarPlay disconnected - waiting for it to become an unpickable route to restart.", buf, 2u);
  }

  objc_msgSend(*(id *)(a1 + 32), "_setState:", 3);
  v6 = dispatch_time(0, 3000000000);
  v7 = *(_QWORD *)(a1 + 32);
  v8 = *(NSObject **)(v7 + 16);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __38__AXSDListenEngine__interruptCarPlay___block_invoke_85;
  block[3] = &unk_24DDF6AE0;
  block[4] = v7;
  dispatch_after(v6, v8, block);
}

void __38__AXSDListenEngine__interruptCarPlay___block_invoke_85(uint64_t a1)
{
  _QWORD *v1;
  NSObject *v2;
  uint8_t v3[16];

  v1 = *(_QWORD **)(a1 + 32);
  if (v1[4] == 3)
  {
    objc_msgSend(v1, "_handleInterruptionRequestingState:", 5);
  }
  else
  {
    AXLogUltron();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v3 = 0;
      _os_log_impl(&dword_21ACD4000, v2, OS_LOG_TYPE_DEFAULT, "CarPlay disconnect waiting period over, but no longer in AXHAListenEngineNotListening_CarPlayWaitingOnDisconnect state - doing nothing.", v3, 2u);
    }

  }
}

- (void)_handleConfigurationChangeNotification:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  const char *v7;
  NSObject *audioProcessingQueue;
  _QWORD block[5];
  uint8_t buf[4];
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  AXLogUltron();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v11 = v4;
    _os_log_impl(&dword_21ACD4000, v5, OS_LOG_TYPE_DEFAULT, "Audio Config Changed: %@", buf, 0xCu);
  }

  if (self->_state == 2)
  {
    AXLogUltron();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v7 = "AXSDListenEngine state is currently in an interrupt state, so can't handle configuration change";
LABEL_9:
      _os_log_impl(&dword_21ACD4000, v6, OS_LOG_TYPE_DEFAULT, v7, buf, 2u);
    }
  }
  else
  {
    if (!-[AXSDListenEngine supportsVirtualAudioDevice](self, "supportsVirtualAudioDevice"))
    {
      audioProcessingQueue = self->_audioProcessingQueue;
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __59__AXSDListenEngine__handleConfigurationChangeNotification___block_invoke;
      block[3] = &unk_24DDF6AE0;
      block[4] = self;
      dispatch_async(audioProcessingQueue, block);
      goto LABEL_12;
    }
    AXLogUltron();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v7 = "Using new Sound Recognition VAD. Ignoring...";
      goto LABEL_9;
    }
  }

LABEL_12:
}

uint64_t __59__AXSDListenEngine__handleConfigurationChangeNotification___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_restartSoundRecognitionIfNecesary");
}

- (void)_mediaServicesWereReset:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *audioProcessingQueue;
  _QWORD block[5];
  uint8_t buf[4];
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  AXLogUltron();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v9 = v4;
    _os_log_impl(&dword_21ACD4000, v5, OS_LOG_TYPE_DEFAULT, "Media reset: %@", buf, 0xCu);
  }

  audioProcessingQueue = self->_audioProcessingQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __44__AXSDListenEngine__mediaServicesWereReset___block_invoke;
  block[3] = &unk_24DDF6AE0;
  block[4] = self;
  dispatch_async(audioProcessingQueue, block);

}

uint64_t __44__AXSDListenEngine__mediaServicesWereReset___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  int v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  AXLogUltron();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40);
    v11 = 138412290;
    v12 = v3;
    _os_log_impl(&dword_21ACD4000, v2, OS_LOG_TYPE_INFO, "Destroying current audio engine: %@", (uint8_t *)&v11, 0xCu);
  }

  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = 0;

  AXLogUltron();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 48);
    v11 = 138412290;
    v12 = v7;
    _os_log_impl(&dword_21ACD4000, v6, OS_LOG_TYPE_INFO, "Destroying current audio session: %@", (uint8_t *)&v11, 0xCu);
  }

  v8 = *(_QWORD *)(a1 + 32);
  v9 = *(void **)(v8 + 48);
  *(_QWORD *)(v8 + 48) = 0;

  objc_msgSend(*(id *)(a1 + 32), "_setState:", 2);
  return objc_msgSend(*(id *)(a1 + 32), "_restartSoundRecognitionIfNecesary");
}

- (void)_restartSoundRecognitionIfNecesary
{
  _BOOL4 v3;
  void *v4;
  int v5;
  NSObject *v6;
  _DWORD v7[2];
  __int16 v8;
  int v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v3 = -[AXSDListenEngine _notListeningForAnyReason](self, "_notListeningForAnyReason");
  if (self->_state == 2)
  {
    objc_msgSend(MEMORY[0x24BDFF278], "sharedInstance");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "soundDetectionEnabled");

  }
  else
  {
    v5 = 0;
  }
  AXLogUltron();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7[0] = 67109376;
    v7[1] = !v3;
    v8 = 1024;
    v9 = v5;
    _os_log_impl(&dword_21ACD4000, v6, OS_LOG_TYPE_DEFAULT, "Restarting SR if necessary. wasListening = %i, shouldRestartAnyway: %i", (uint8_t *)v7, 0xEu);
  }

  if (!v3)
    -[AXSDListenEngine _stopListeningAndTransitionToState:](self, "_stopListeningAndTransitionToState:", 1);
  if (v5)
    -[AXSDListenEngine _startIfPossibleAndNotify](self, "_startIfPossibleAndNotify");
}

- (AVAudioEngine)audioEngine
{
  return (AVAudioEngine *)objc_getProperty(self, a2, 40, 1);
}

- (void)setAudioEngine:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (AVAudioSession)audioSession
{
  return (AVAudioSession *)objc_getProperty(self, a2, 48, 1);
}

- (void)setAudioSession:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_audioSession, 0);
  objc_storeStrong((id *)&self->_audioEngine, 0);
  objc_storeStrong((id *)&self->_delegates, 0);
  objc_storeStrong((id *)&self->_audioProcessingQueue, 0);
  objc_storeStrong((id *)&self->_delegateQueue, 0);
}

- (void)addListenDelegate:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_0_2(&dword_21ACD4000, v0, v1, "Listen Engine: Add Listen Delegate", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

void __38__AXSDListenEngine_addListenDelegate___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_0_2(&dword_21ACD4000, v0, v1, "First delegate added to Listen Engine - starting up", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

void __38__AXSDListenEngine_addListenDelegate___block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_0_2(&dword_21ACD4000, v0, v1, "Delegate added to Listen Engine - already running", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)notifyListeningStartedWithError:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  _DWORD v2[2];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  v2[0] = 67109120;
  v2[1] = a1 == 0;
  _os_log_debug_impl(&dword_21ACD4000, a2, OS_LOG_TYPE_DEBUG, "Listen Engine: Notify Listening Started; success: %d",
    (uint8_t *)v2,
    8u);
  OUTLINED_FUNCTION_1_0();
}

- (void)notifyListeningEncounteredError:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0(&dword_21ACD4000, v0, v1, "Listen Engine: Notify Listening Encountered Error: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)notifyListeningReceivedAudioFile:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0(&dword_21ACD4000, v0, v1, "Listen Engine: Notify Listening Received Audio File: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)notifyListeningFinishedAudioFile:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0(&dword_21ACD4000, v0, v1, "Listen Engine: Notify Listening Finished Audio File: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __41__AXSDListenEngine_removeListenDelegate___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_3(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_0_0(&dword_21ACD4000, v0, v1, "Listen Engine: Remove Listen Delegate: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)_setState:(NSObject *)a3 .cold.1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  void *v5;
  void *v6;
  int v7;
  void *v8;
  __int16 v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  +[AXSDListenEngine _stringForState:](AXSDListenEngine, "_stringForState:", *(_QWORD *)(a1 + 32));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[AXSDListenEngine _stringForState:](AXSDListenEngine, "_stringForState:", a2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 138412546;
  v8 = v5;
  v9 = 2112;
  v10 = v6;
  _os_log_debug_impl(&dword_21ACD4000, a3, OS_LOG_TYPE_DEBUG, "State transitioning from %@ to %@", (uint8_t *)&v7, 0x16u);

  OUTLINED_FUNCTION_5();
}

- (void)audioEngineInputNode
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_1(&dword_21ACD4000, v0, v1, "Input node err: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)_startListeningWithError:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_3_1(&dword_21ACD4000, v0, v1, "_startListeningWithError called during startup - should be impossible if we're on our serial queue!", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)_startListeningWithError:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_1(&dword_21ACD4000, v0, v1, "Invalid input format. %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)_startListeningWithError:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_3(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_0_1(&dword_21ACD4000, v0, v1, "Error starting audio engine: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)_startListeningWithError:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_3(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_0_1(&dword_21ACD4000, v0, v1, "Failed to set up audio session after interruption. %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)_startListeningWithError:.cold.5()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_3(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_0_1(&dword_21ACD4000, v0, v1, "Error activating audio session: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)_startListeningWithError:.cold.6()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_3(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_0_1(&dword_21ACD4000, v0, v1, "Error removing participation BT smart routing: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)_startListeningWithError:.cold.7()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_3(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_0_1(&dword_21ACD4000, v0, v1, "Error removing participation from volume button: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)_startListeningWithError:(os_log_t)log .cold.8(char a1, uint64_t *a2, os_log_t log)
{
  uint64_t v3;
  _DWORD v4[2];
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = *a2;
  v4[0] = 67109378;
  v4[1] = a1 & 1;
  v5 = 2112;
  v6 = v3;
  _os_log_error_impl(&dword_21ACD4000, log, OS_LOG_TYPE_ERROR, "Failed to set up audio session (with interruption: %i). %@", (uint8_t *)v4, 0x12u);
  OUTLINED_FUNCTION_2();
}

- (void)_stopListeningAndTransitionToState:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_1(&dword_21ACD4000, v0, v1, "Error deactivating audio session: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)_stopListeningAndTransitionToState:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_1(&dword_21ACD4000, v0, v1, "Invalid state transition in Stop Listening: %ld - transitioning to AXHAListenEngineNotListening_ErrorState", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)pipeInFile:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_1(&dword_21ACD4000, v0, v1, "AUTOMATION: Unable to read file to buffer: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)_setupAudioInputWithError:shouldInterrupt:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_3(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_0_1(&dword_21ACD4000, v0, v1, "Error allowing system sounds and haptics while recording: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)_setupAudioInputWithError:shouldInterrupt:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_3(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_0_1(&dword_21ACD4000, v0, v1, "Error setting category, mode and options: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)_setupAudioInputWithError:shouldInterrupt:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_3(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_0_1(&dword_21ACD4000, v0, v1, "Error setting allowHapticsAndSystemSoundsDuringRecording: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)_setupAudioInputWithError:shouldInterrupt:.cold.5()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_3(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_0_1(&dword_21ACD4000, v0, v1, "Error setting decoupleIO: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)_setupAudioInputWithError:shouldInterrupt:.cold.6()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_3(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_0_1(&dword_21ACD4000, v0, v1, "Error setting HW control flags %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)_setupAudioInputWithError:shouldInterrupt:.cold.8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_3(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_0_1(&dword_21ACD4000, v0, v1, "Error setting kMXSessionProperty_PrefersNoInterruptionsDuringRemoteDeviceControl: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)_setupAudioInputWithError:shouldInterrupt:.cold.9()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_3(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_0_1(&dword_21ACD4000, v0, v1, "Error setting Mic Indicator Control to Opt Out %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)_handleInterruptionRequestingState:.cold.1()
{
  uint64_t v0;
  os_log_t v1;
  uint8_t v2[12];
  __int16 v3;
  uint64_t v4;

  OUTLINED_FUNCTION_2_3(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_3_2();
  v3 = 2048;
  v4 = v0;
  _os_log_error_impl(&dword_21ACD4000, v1, OS_LOG_TYPE_ERROR, "Invalid interruption state transition from %ld to %ld.", v2, 0x16u);
  OUTLINED_FUNCTION_2();
}

@end
