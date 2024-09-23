@implementation AFMemoryPressureObserver

- (AFMemoryPressureObserver)initWithOptions:(unint64_t)a3
{
  AFMemoryPressureObserver *v4;
  NSObject *v5;
  NSObject *v6;
  dispatch_queue_t v7;
  OS_dispatch_queue *queue;
  NSObject *v9;
  _QWORD v11[4];
  AFMemoryPressureObserver *v12;
  unint64_t v13;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)AFMemoryPressureObserver;
  v4 = -[AFMemoryPressureObserver init](&v14, sel_init);
  if (v4)
  {
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v5 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_attr_make_with_qos_class(v5, QOS_CLASS_UTILITY, 0);
    v6 = objc_claimAutoreleasedReturnValue();

    v7 = dispatch_queue_create("com.apple.assistant.memory-pressure-observer", v6);
    queue = v4->_queue;
    v4->_queue = (OS_dispatch_queue *)v7;

    v9 = v4->_queue;
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __44__AFMemoryPressureObserver_initWithOptions___block_invoke;
    v11[3] = &unk_1E3A353C0;
    v12 = v4;
    v13 = a3;
    dispatch_async(v9, v11);

  }
  return v4;
}

- (void)dealloc
{
  objc_super v3;

  -[AFMemoryPressureObserver _stopObservingMemoryPressure](self, "_stopObservingMemoryPressure");
  v3.receiver = self;
  v3.super_class = (Class)AFMemoryPressureObserver;
  -[AFMemoryPressureObserver dealloc](&v3, sel_dealloc);
}

- (void)addListener:(id)a3
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
    v7[2] = __40__AFMemoryPressureObserver_addListener___block_invoke;
    v7[3] = &unk_1E3A36FC8;
    v7[4] = self;
    v8 = v4;
    dispatch_async(queue, v7);

  }
}

- (void)removeListener:(id)a3
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
    v7[2] = __43__AFMemoryPressureObserver_removeListener___block_invoke;
    v7[3] = &unk_1E3A36FC8;
    v7[4] = self;
    v8 = v4;
    dispatch_async(queue, v7);

  }
}

- (void)removeAllListeners
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __46__AFMemoryPressureObserver_removeAllListeners__block_invoke;
  block[3] = &unk_1E3A36F30;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)getCurrentConditionWithCompletion:(id)a3
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
    v7[2] = __62__AFMemoryPressureObserver_getCurrentConditionWithCompletion___block_invoke;
    v7[3] = &unk_1E3A36FA0;
    v7[4] = self;
    v8 = v4;
    dispatch_async(queue, v7);

  }
}

- (void)invalidate
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __38__AFMemoryPressureObserver_invalidate__block_invoke;
  block[3] = &unk_1E3A36F30;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)_addListener:(id)a3
{
  -[NSHashTable addObject:](self->_listeners, "addObject:", a3);
}

- (void)_removeListener:(id)a3
{
  -[NSHashTable removeObject:](self->_listeners, "removeObject:", a3);
}

- (void)_removeAllListeners
{
  -[NSHashTable removeAllObjects](self->_listeners, "removeAllObjects");
}

- (void)_startObservingMemoryPressureWithOptions:(unint64_t)a3
{
  OS_dispatch_source *v4;
  OS_dispatch_source *memoryPressureSource;
  NSObject *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  _QWORD handler[4];
  id v11;
  _BYTE location[12];
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (!self->_memoryPressureSource)
  {
    v4 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x1E0C80DA8], 0, a3 & 0x30 | (a3 >> 1) & 7, (dispatch_queue_t)self->_queue);
    memoryPressureSource = self->_memoryPressureSource;
    self->_memoryPressureSource = v4;

    objc_initWeak((id *)location, self);
    v6 = self->_memoryPressureSource;
    handler[0] = MEMORY[0x1E0C809B0];
    handler[1] = 3221225472;
    handler[2] = __69__AFMemoryPressureObserver__startObservingMemoryPressureWithOptions___block_invoke;
    handler[3] = &unk_1E3A35AE0;
    objc_copyWeak(&v11, (id *)location);
    dispatch_source_set_event_handler(v6, handler);
    dispatch_resume((dispatch_object_t)self->_memoryPressureSource);
    objc_destroyWeak(&v11);
    objc_destroyWeak((id *)location);
  }
  v7 = (void *)AFSiriLogContextUtility;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextUtility, OS_LOG_TYPE_INFO))
  {
    v8 = v7;
    AFMemoryInfoGetCurrent();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)location = 136315394;
    *(_QWORD *)&location[4] = "-[AFMemoryPressureObserver _startObservingMemoryPressureWithOptions:]";
    v13 = 2112;
    v14 = v9;
    _os_log_impl(&dword_19AF50000, v8, OS_LOG_TYPE_INFO, "%s Current memory info is %@.", location, 0x16u);

  }
}

- (void)_stopObservingMemoryPressure
{
  NSObject *memoryPressureSource;
  OS_dispatch_source *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  int v8;
  const char *v9;
  __int16 v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  memoryPressureSource = self->_memoryPressureSource;
  if (memoryPressureSource)
  {
    dispatch_source_cancel(memoryPressureSource);
    v4 = self->_memoryPressureSource;
    self->_memoryPressureSource = 0;

  }
  v5 = (void *)AFSiriLogContextUtility;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextUtility, OS_LOG_TYPE_INFO))
  {
    v6 = v5;
    AFMemoryInfoGetCurrent();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 136315394;
    v9 = "-[AFMemoryPressureObserver _stopObservingMemoryPressure]";
    v10 = 2112;
    v11 = v7;
    _os_log_impl(&dword_19AF50000, v6, OS_LOG_TYPE_INFO, "%s Current memory info is %@.", (uint8_t *)&v8, 0x16u);

  }
}

- (void)_handleMemoryPressureWithFlags:(unint64_t)a3
{
  void *v5;
  int64_t memoryPressureFlags;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  void *v10;
  _BOOL4 v11;
  const __CFString *v12;
  const __CFString *v13;
  NSObject *v14;
  const char *v15;
  NSObject *v16;
  uint32_t v17;
  const __CFString *v18;
  void *v19;
  NSObject *v20;
  __CFString *v21;
  void *v22;
  void *v23;
  int v24;
  void *v25;
  void *v26;
  void *v27;
  const __CFString *v28;
  void *v29;
  NSHashTable *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t i;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _BYTE v39[128];
  _QWORD v40[2];
  _QWORD v41[2];
  uint8_t buf[4];
  const char *v43;
  __int16 v44;
  const __CFString *v45;
  __int16 v46;
  const __CFString *v47;
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v5 = (void *)MEMORY[0x1A1AC0A74](self, a2);
  memoryPressureFlags = self->_memoryPressureFlags;
  if (memoryPressureFlags <= 3)
  {
    if (memoryPressureFlags == 2)
      v8 = 2;
    else
      v8 = 0;
    if (memoryPressureFlags == 1)
      v7 = 1;
    else
      v7 = v8;
  }
  else
  {
    switch(memoryPressureFlags)
    {
      case 4:
        v7 = 3;
        break;
      case 16:
        v7 = 4;
        break;
      case 32:
        v7 = 5;
        break;
      default:
        v7 = 0;
        break;
    }
  }
  v9 = 0;
  self->_memoryPressureFlags = a3;
  if ((uint64_t)a3 <= 3)
  {
    if (a3 == 1 || a3 == 2)
      v9 = a3;
  }
  else
  {
    switch(a3)
    {
      case 4uLL:
        v9 = 3;
        break;
      case 0x10uLL:
        v9 = 4;
        break;
      case 0x20uLL:
        v9 = 5;
        break;
    }
  }
  v10 = (void *)AFSiriLogContextUtility;
  v11 = os_log_type_enabled((os_log_t)AFSiriLogContextUtility, OS_LOG_TYPE_INFO);
  if (v7 == v9)
  {
    if (!v11)
      goto LABEL_40;
    if ((unint64_t)(v7 - 1) > 4)
      v12 = CFSTR("unknown");
    else
      v12 = off_1E3A309E8[v7 - 1];
    *(_DWORD *)buf = 136315394;
    v43 = "-[AFMemoryPressureObserver _handleMemoryPressureWithFlags:]";
    v44 = 2112;
    v45 = v12;
    v14 = v10;
    v15 = "%s Memory pressure condition stayed at %@.";
    v16 = v14;
    v17 = 22;
  }
  else
  {
    if (!v11)
      goto LABEL_40;
    if ((unint64_t)(v7 - 1) > 4)
      v13 = CFSTR("unknown");
    else
      v13 = off_1E3A309E8[v7 - 1];
    if (v9 - 1 > 4)
      v18 = CFSTR("unknown");
    else
      v18 = off_1E3A309E8[v9 - 1];
    *(_DWORD *)buf = 136315650;
    v43 = "-[AFMemoryPressureObserver _handleMemoryPressureWithFlags:]";
    v44 = 2112;
    v45 = v13;
    v46 = 2112;
    v47 = v18;
    v14 = v10;
    v15 = "%s Memory pressure condition changed from %@ to %@.";
    v16 = v14;
    v17 = 32;
  }
  _os_log_impl(&dword_19AF50000, v16, OS_LOG_TYPE_INFO, v15, buf, v17);

LABEL_40:
  v19 = (void *)AFSiriLogContextUtility;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextUtility, OS_LOG_TYPE_INFO))
  {
    v20 = v19;
    AFMemoryInfoGetCurrent();
    v21 = (__CFString *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315394;
    v43 = "-[AFMemoryPressureObserver _handleMemoryPressureWithFlags:]";
    v44 = 2112;
    v45 = v21;
    _os_log_impl(&dword_19AF50000, v20, OS_LOG_TYPE_INFO, "%s Current memory info is %@.", buf, 0x16u);

  }
  if (v7 != v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "processName");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(v23, "isEqualToString:", CFSTR("assistantd"));

    if (v24)
    {
      +[AFAnalytics sharedAnalytics](AFAnalytics, "sharedAnalytics");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v40[0] = CFSTR("processName");
      objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "processName");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v40[1] = CFSTR("memoryPressureChange");
      v41[0] = v27;
      if (v9 - 1 > 4)
        v28 = CFSTR("unknown");
      else
        v28 = off_1E3A309E8[v9 - 1];
      v41[1] = v28;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v41, v40, 2);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "logEventWithType:context:", 451, v29);

    }
    v37 = 0u;
    v38 = 0u;
    v35 = 0u;
    v36 = 0u;
    v30 = self->_listeners;
    v31 = -[NSHashTable countByEnumeratingWithState:objects:count:](v30, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
    if (v31)
    {
      v32 = v31;
      v33 = *(_QWORD *)v36;
      do
      {
        for (i = 0; i != v32; ++i)
        {
          if (*(_QWORD *)v36 != v33)
            objc_enumerationMutation(v30);
          objc_msgSend(*(id *)(*((_QWORD *)&v35 + 1) + 8 * i), "memoryPressureObserver:didChangeFromCondition:toCondition:", self, v7, v9, (_QWORD)v35);
        }
        v32 = -[NSHashTable countByEnumeratingWithState:objects:count:](v30, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
      }
      while (v32);
    }

  }
  objc_autoreleasePoolPop(v5);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_listeners, 0);
  objc_storeStrong((id *)&self->_memoryPressureSource, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

void __69__AFMemoryPressureObserver__startObservingMemoryPressureWithOptions___block_invoke(uint64_t a1)
{
  dispatch_source_t *WeakRetained;
  dispatch_source_t *v2;

  WeakRetained = (dispatch_source_t *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    -[dispatch_source_t _handleMemoryPressureWithFlags:](WeakRetained, "_handleMemoryPressureWithFlags:", dispatch_source_get_data(WeakRetained[2]));
    WeakRetained = v2;
  }

}

uint64_t __38__AFMemoryPressureObserver_invalidate__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_stopObservingMemoryPressure");
  return objc_msgSend(*(id *)(a1 + 32), "_removeAllListeners");
}

uint64_t __62__AFMemoryPressureObserver_getCurrentConditionWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v1 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24);
  v2 = 3;
  v3 = 4;
  v4 = 5;
  if (v1 != 32)
    v4 = 0;
  if (v1 != 16)
    v3 = v4;
  if (v1 != 4)
    v2 = v3;
  if (v1 == 2)
    v5 = 2;
  else
    v5 = 0;
  if (v1 == 1)
    v5 = 1;
  if (v1 <= 3)
    v6 = v5;
  else
    v6 = v2;
  return (*(uint64_t (**)(_QWORD, uint64_t))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), v6);
}

uint64_t __46__AFMemoryPressureObserver_removeAllListeners__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_removeAllListeners");
}

uint64_t __43__AFMemoryPressureObserver_removeListener___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_removeListener:", *(_QWORD *)(a1 + 40));
}

uint64_t __40__AFMemoryPressureObserver_addListener___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_addListener:", *(_QWORD *)(a1 + 40));
}

uint64_t __44__AFMemoryPressureObserver_initWithOptions___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3690]), "initWithOptions:capacity:", 5, 0);
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 32);
  *(_QWORD *)(v3 + 32) = v2;

  return objc_msgSend(*(id *)(a1 + 32), "_startObservingMemoryPressureWithOptions:", *(_QWORD *)(a1 + 40));
}

+ (id)sharedObserver
{
  if (sharedObserver_onceToken != -1)
    dispatch_once(&sharedObserver_onceToken, &__block_literal_global_16674);
  return (id)sharedObserver_sharedObserver;
}

void __42__AFMemoryPressureObserver_sharedObserver__block_invoke()
{
  AFMemoryPressureObserver *v0;
  void *v1;

  v0 = -[AFMemoryPressureObserver initWithOptions:]([AFMemoryPressureObserver alloc], "initWithOptions:", 62);
  v1 = (void *)sharedObserver_sharedObserver;
  sharedObserver_sharedObserver = (uint64_t)v0;

}

@end
