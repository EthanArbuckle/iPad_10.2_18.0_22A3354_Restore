@implementation AWAttentionAwarenessClientConfig

- (id)tagForIndex:(unint64_t)a3
{
  NSObject *queue;
  id v4;
  _QWORD block[7];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  if (!a3)
    return 0;
  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__1903;
  v11 = __Block_byref_object_dispose__1904;
  v12 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __48__AWAttentionAwarenessClientConfig_tagForIndex___block_invoke;
  block[3] = &unk_1E5F8E878;
  block[4] = self;
  block[5] = &v7;
  block[6] = a3;
  dispatch_sync(queue, block);
  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

+ (id)sharedClientConfig
{
  if (sharedClientConfig_onceToken != -1)
    dispatch_once(&sharedClientConfig_onceToken, &__block_literal_global_1920);
  return (id)sharedClientConfig_clientConfig;
}

- (void)incrementTagIndexRefCount:(unint64_t)a3
{
  NSObject *queue;
  _QWORD v4[6];

  if (a3)
  {
    queue = self->_queue;
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __62__AWAttentionAwarenessClientConfig_incrementTagIndexRefCount___block_invoke;
    v4[3] = &unk_1E5F8EB10;
    v4[4] = self;
    v4[5] = a3;
    dispatch_sync(queue, v4);
  }
}

- (AWAttentionAwarenessClientConfig)init
{
  AWAttentionAwarenessClientConfig *v2;
  uint64_t v3;
  OS_dispatch_queue *queue;
  NSMutableDictionary *v5;
  NSMutableDictionary *notifyQueues;
  NSMutableDictionary *v7;
  NSMutableDictionary *notifyBlocks;
  NSMutableDictionary *v9;
  NSMutableDictionary *tagMap;
  NSMutableDictionary *v11;
  NSMutableDictionary *tagRefCount;
  NSObject *v13;
  uint64_t v14;
  NSObject *v15;
  _QWORD block[4];
  AWAttentionAwarenessClientConfig *v18;
  _QWORD handler[4];
  id v20;
  id location;
  objc_super v22;

  v22.receiver = self;
  v22.super_class = (Class)AWAttentionAwarenessClientConfig;
  v2 = -[AWAttentionAwarenessClientConfig init](&v22, sel_init);
  if (v2)
  {
    awQueue(1);
    v3 = objc_claimAutoreleasedReturnValue();
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v3;

    v5 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    notifyQueues = v2->_notifyQueues;
    v2->_notifyQueues = v5;

    v7 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    notifyBlocks = v2->_notifyBlocks;
    v2->_notifyBlocks = v7;

    v9 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    tagMap = v2->_tagMap;
    v2->_tagMap = v9;

    v11 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    tagRefCount = v2->_tagRefCount;
    v2->_tagRefCount = v11;

    v2->_nextTagIndex = 1;
    objc_initWeak(&location, v2);
    v13 = v2->_queue;
    v14 = MEMORY[0x1E0C809B0];
    handler[0] = MEMORY[0x1E0C809B0];
    handler[1] = 3221225472;
    handler[2] = __40__AWAttentionAwarenessClientConfig_init__block_invoke;
    handler[3] = &unk_1E5F8E7D8;
    objc_copyWeak(&v20, &location);
    notify_register_dispatch("com.apple.AttentionAwareness.SupportedEventsChanged", &v2->_notifyToken, v13, handler);
    v15 = v2->_queue;
    block[0] = v14;
    block[1] = 3221225472;
    block[2] = __40__AWAttentionAwarenessClientConfig_init__block_invoke_2;
    block[3] = &unk_1E5F8EC18;
    v18 = v2;
    dispatch_sync(v15, block);

    objc_destroyWeak(&v20);
    objc_destroyWeak(&location);
  }
  return v2;
}

- (void)dealloc
{
  objc_super v3;

  notify_cancel(self->_notifyToken);
  v3.receiver = self;
  v3.super_class = (Class)AWAttentionAwarenessClientConfig;
  -[AWAttentionAwarenessClientConfig dealloc](&v3, sel_dealloc);
}

- (unint64_t)supportedEvents
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
  v5[2] = __51__AWAttentionAwarenessClientConfig_supportedEvents__block_invoke;
  v5[3] = &unk_1E5F8EAC0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)updateState:(BOOL)a3
{
  void *v5;
  NSObject *v6;
  NSMutableDictionary *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  NSObject *v13;
  void *v14;
  unint64_t v15;
  double v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _QWORD v21[5];
  BOOL v22;
  uint8_t v23[128];
  uint8_t buf[4];
  double v25;
  __int16 v26;
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  self->_supportedEventsValid = 0;
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __48__AWAttentionAwarenessClientConfig_updateState___block_invoke;
  v21[3] = &unk_1E5F8EA98;
  v22 = a3;
  v21[4] = self;
  +[AWServiceManager invokeWithService:](AWServiceManager, "invokeWithService:", v21);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    if (currentLogLevel >= 3)
    {
      _AALog();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        v15 = absTimeNS();
        if (v15 == -1)
          v16 = INFINITY;
        else
          v16 = (double)v15 / 1000000000.0;
        *(_DWORD *)buf = 134218242;
        v25 = v16;
        v26 = 2112;
        v27 = v5;
        _os_log_error_impl(&dword_1AF589000, v6, OS_LOG_TYPE_ERROR, "%13.5f: failed get supported events: %@", buf, 0x16u);
      }

    }
    self->_supportedEventsValid = 0;
  }
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v7 = self->_notifyQueues;
  v8 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v17, v23, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v18 != v10)
          objc_enumerationMutation(v7);
        v12 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * i);
        -[NSMutableDictionary objectForKeyedSubscript:](self->_notifyQueues, "objectForKeyedSubscript:", v12, (_QWORD)v17);
        v13 = objc_claimAutoreleasedReturnValue();
        -[NSMutableDictionary objectForKeyedSubscript:](self->_notifyBlocks, "objectForKeyedSubscript:", v12);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        dispatch_async(v13, v14);

      }
      v9 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v17, v23, 16);
    }
    while (v9);
  }

}

- (AWNotification_s)notifySupportedEventsChangedWithQueue:(id)a3 block:(id)a4
{
  id v6;
  id v7;
  NSObject *queue;
  id v9;
  id v10;
  AWNotification_s *v11;
  _QWORD v13[5];
  id v14;
  id v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t v20;

  v6 = a3;
  v7 = a4;
  v17 = 0;
  v18 = &v17;
  v19 = 0x2020000000;
  v20 = 0;
  queue = self->_queue;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __80__AWAttentionAwarenessClientConfig_notifySupportedEventsChangedWithQueue_block___block_invoke;
  v13[3] = &unk_1E5F8E828;
  v13[4] = self;
  v14 = v6;
  v15 = v7;
  v16 = &v17;
  v9 = v7;
  v10 = v6;
  dispatch_sync(queue, v13);
  v11 = (AWNotification_s *)v18[3];

  _Block_object_dispose(&v17, 8);
  return v11;
}

- (void)cancelNotification:(AWNotification_s *)a3
{
  NSObject *queue;
  _QWORD v4[6];

  queue = self->_queue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __55__AWAttentionAwarenessClientConfig_cancelNotification___block_invoke;
  v4[3] = &unk_1E5F8EB10;
  v4[4] = self;
  v4[5] = a3;
  dispatch_sync(queue, v4);
}

- (unint64_t)addTag:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  unint64_t v7;
  _QWORD block[5];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x2020000000;
  v15 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __43__AWAttentionAwarenessClientConfig_addTag___block_invoke;
  block[3] = &unk_1E5F8E850;
  v10 = v4;
  v11 = &v12;
  block[4] = self;
  v6 = v4;
  dispatch_sync(queue, block);
  v7 = v13[3];

  _Block_object_dispose(&v12, 8);
  return v7;
}

- (void)decrementTagIndexRefCount:(unint64_t)a3
{
  NSObject *queue;
  _QWORD v4[6];

  if (a3)
  {
    queue = self->_queue;
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __62__AWAttentionAwarenessClientConfig_decrementTagIndexRefCount___block_invoke;
    v4[3] = &unk_1E5F8EB10;
    v4[4] = self;
    v4[5] = a3;
    dispatch_sync(queue, v4);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tagRefCount, 0);
  objc_storeStrong((id *)&self->_tagMap, 0);
  objc_storeStrong((id *)&self->_notifyBlocks, 0);
  objc_storeStrong((id *)&self->_notifyQueues, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

void __62__AWAttentionAwarenessClientConfig_decrementTagIndexRefCount___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  unint64_t v11;
  double v12;
  unint64_t v13;
  double v14;
  NSObject *v15;
  unint64_t v16;
  double v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  int v33;
  double v34;
  __int16 v35;
  void *v36;
  __int16 v37;
  uint64_t v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 72);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", *(_QWORD *)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v5 = objc_msgSend(v4, "unsignedLongLongValue");
    v6 = v5 - 1;
    if (v5 == 1)
    {
      if (currentLogLevel >= 7)
      {
        _AALog();
        v15 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          v16 = absTimeNS();
          if (v16 == -1)
            v17 = INFINITY;
          else
            v17 = (double)v16 / 1000000000.0;
          v23 = *(_QWORD *)(a1 + 40);
          v24 = *(void **)(*(_QWORD *)(a1 + 32) + 64);
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v23);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "objectForKeyedSubscript:", v25);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          tagDescription(v23, v26);
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          v33 = 134218242;
          v34 = v17;
          v35 = 2112;
          v36 = v27;
          _os_log_impl(&dword_1AF589000, v15, OS_LOG_TYPE_DEFAULT, "%13.5f: removed %@ from tag map", (uint8_t *)&v33, 0x16u);

        }
      }
      v28 = *(void **)(*(_QWORD *)(a1 + 32) + 64);
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", *(_QWORD *)(a1 + 40));
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "removeObjectForKey:", v29);

      v30 = *(_QWORD *)(a1 + 40);
      v31 = *(void **)(*(_QWORD *)(a1 + 32) + 72);
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v30);
      v10 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "removeObjectForKey:", v10);
      goto LABEL_21;
    }
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = *(void **)(*(_QWORD *)(a1 + 32) + 72);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", *(_QWORD *)(a1 + 40));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v7, v9);

    if (currentLogLevel >= 7)
    {
      _AALog();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        v11 = absTimeNS();
        if (v11 == -1)
          v12 = INFINITY;
        else
          v12 = (double)v11 / 1000000000.0;
        v18 = *(_QWORD *)(a1 + 40);
        v19 = *(void **)(*(_QWORD *)(a1 + 32) + 64);
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v18);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "objectForKeyedSubscript:", v20);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        tagDescription(v18, v21);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v33 = 134218498;
        v34 = v12;
        v35 = 2112;
        v36 = v22;
        v37 = 2048;
        v38 = v6;
        _os_log_impl(&dword_1AF589000, v10, OS_LOG_TYPE_DEFAULT, "%13.5f: decremented ref count of %@ to %llu", (uint8_t *)&v33, 0x20u);

      }
LABEL_21:

    }
  }
  else if (currentLogLevel >= 3)
  {
    _AALog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v13 = absTimeNS();
      if (v13 == -1)
        v14 = INFINITY;
      else
        v14 = (double)v13 / 1000000000.0;
      tagDescription(*(_QWORD *)(a1 + 40), 0);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = 134218242;
      v34 = v14;
      v35 = 2112;
      v36 = v32;
      _os_log_error_impl(&dword_1AF589000, v10, OS_LOG_TYPE_ERROR, "%13.5f: trying to decrement ref for non-existent %@", (uint8_t *)&v33, 0x16u);

    }
    goto LABEL_21;
  }

}

void __62__AWAttentionAwarenessClientConfig_incrementTagIndexRefCount___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  unint64_t v10;
  double v11;
  unint64_t v12;
  double v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  int v20;
  double v21;
  __int16 v22;
  void *v23;
  __int16 v24;
  uint64_t v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 72);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", *(_QWORD *)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v5 = objc_msgSend(v4, "unsignedLongLongValue") + 1;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = *(void **)(*(_QWORD *)(a1 + 32) + 72);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", *(_QWORD *)(a1 + 40));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v6, v8);

    if (currentLogLevel >= 7)
    {
      _AALog();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        v10 = absTimeNS();
        if (v10 == -1)
          v11 = INFINITY;
        else
          v11 = (double)v10 / 1000000000.0;
        v14 = *(_QWORD *)(a1 + 40);
        v15 = *(void **)(*(_QWORD *)(a1 + 32) + 64);
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v14);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "objectForKeyedSubscript:", v16);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        tagDescription(v14, v17);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = 134218498;
        v21 = v11;
        v22 = 2112;
        v23 = v18;
        v24 = 2048;
        v25 = v5;
        _os_log_impl(&dword_1AF589000, v9, OS_LOG_TYPE_DEFAULT, "%13.5f: incremented ref count of %@ to %llu", (uint8_t *)&v20, 0x20u);

      }
LABEL_12:

    }
  }
  else if (currentLogLevel >= 3)
  {
    _AALog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v12 = absTimeNS();
      if (v12 == -1)
        v13 = INFINITY;
      else
        v13 = (double)v12 / 1000000000.0;
      tagDescription(*(_QWORD *)(a1 + 40), 0);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = 134218242;
      v21 = v13;
      v22 = 2112;
      v23 = v19;
      _os_log_error_impl(&dword_1AF589000, v9, OS_LOG_TYPE_ERROR, "%13.5f: trying to increment ref for non-existent %@", (uint8_t *)&v20, 0x16u);

    }
    goto LABEL_12;
  }

}

void __48__AWAttentionAwarenessClientConfig_tagForIndex___block_invoke(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;

  v2 = *(void **)(a1[4] + 64);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", a1[6]);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", v6);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(a1[5] + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

void __43__AWAttentionAwarenessClientConfig_addTag___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  unint64_t v10;
  double v11;
  void *v12;
  int v13;
  double v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v2 = a1[4];
  v3 = *(_QWORD *)(v2 + 56);
  *(_QWORD *)(v2 + 56) = v3 + 1;
  *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 24) = v3;
  v4 = a1[5];
  v5 = *(void **)(a1[4] + 64);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 24));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v4, v6);

  v7 = *(void **)(a1[4] + 72);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 24));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", &unk_1E5F97A88, v8);

  if (currentLogLevel >= 7)
  {
    _AALog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v10 = absTimeNS();
      if (v10 == -1)
        v11 = INFINITY;
      else
        v11 = (double)v10 / 1000000000.0;
      tagDescription(*(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 24), (void *)a1[5]);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 134218242;
      v14 = v11;
      v15 = 2112;
      v16 = v12;
      _os_log_impl(&dword_1AF589000, v9, OS_LOG_TYPE_DEFAULT, "%13.5f: adding %@ to tag map", (uint8_t *)&v13, 0x16u);

    }
  }
}

void __55__AWAttentionAwarenessClientConfig_cancelNotification___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v2 = *(_QWORD *)(a1 + 40);
  v3 = *(void **)(*(_QWORD *)(a1 + 32) + 24);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObjectForKey:", v4);

  v5 = *(void **)(*(_QWORD *)(a1 + 32) + 32);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v2);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObjectForKey:", v6);

}

void __80__AWAttentionAwarenessClientConfig_notifySupportedEventsChangedWithQueue_block___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v2 = ++CARColorFilterIntensityBlueYellowKey_block_invoke_counter;
  v3 = a1[5];
  v4 = *(void **)(a1[4] + 24);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", CARColorFilterIntensityBlueYellowKey_block_invoke_counter);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v3, v5);

  v6 = (void *)MEMORY[0x1B5DF9110](a1[6]);
  v7 = *(void **)(a1[4] + 32);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v6, v8);

  *(_QWORD *)(*(_QWORD *)(a1[7] + 8) + 24) = v2;
}

uint64_t __48__AWAttentionAwarenessClientConfig_updateState___block_invoke(uint64_t a1, void *a2)
{
  _QWORD v3[5];
  char v4;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __48__AWAttentionAwarenessClientConfig_updateState___block_invoke_2;
  v3[3] = &unk_1E5F8E800;
  v4 = *(_BYTE *)(a1 + 40);
  v3[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(a2, "getSupportedEventsWithReply:", v3);
  return 0;
}

void __48__AWAttentionAwarenessClientConfig_updateState___block_invoke_2(uint64_t a1, uint64_t a2)
{
  BOOL v4;
  NSObject *v5;
  unint64_t v6;
  double v7;
  void *v8;
  void *v9;
  int v10;
  double v11;
  __int16 v12;
  void *v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if (*(_BYTE *)(a1 + 40))
    v4 = currentLogLevel < 6;
  else
    v4 = 1;
  if (!v4)
  {
    _AALog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = absTimeNS();
      if (v6 == -1)
        v7 = INFINITY;
      else
        v7 = (double)v6 / 1000000000.0;
      getEventMaskDescription(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 40));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      getEventMaskDescription(a2);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 134218498;
      v11 = v7;
      v12 = 2112;
      v13 = v8;
      v14 = 2112;
      v15 = v9;
      _os_log_impl(&dword_1AF589000, v5, OS_LOG_TYPE_DEFAULT, "%13.5f: supported event mask changed from %@ to %@", (uint8_t *)&v10, 0x20u);

    }
  }
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40) = a2;
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 48) = 1;
}

uint64_t __51__AWAttentionAwarenessClientConfig_supportedEvents__block_invoke(uint64_t a1)
{
  uint64_t result;
  int v3;
  BOOL v4;
  NSObject *v5;
  unint64_t v6;
  double v7;
  void *v8;
  int v9;
  double v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  result = *(_QWORD *)(a1 + 32);
  if (!*(_BYTE *)(result + 48))
  {
    v3 = 5;
    while (1)
    {
      result = *(_QWORD *)(a1 + 32);
      if (*(_BYTE *)(result + 48))
        break;
      objc_msgSend((id)result, "updateState:", 1);
      if (!--v3)
      {
        result = *(_QWORD *)(a1 + 32);
        if (*(_BYTE *)(result + 48))
          v4 = 1;
        else
          v4 = currentLogLevel < 3;
        if (!v4)
        {
          _AALog();
          v5 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
          {
            v6 = absTimeNS();
            if (v6 == -1)
              v7 = INFINITY;
            else
              v7 = (double)v6 / 1000000000.0;
            getEventMaskDescription(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 40));
            v8 = (void *)objc_claimAutoreleasedReturnValue();
            v9 = 134218242;
            v10 = v7;
            v11 = 2112;
            v12 = v8;
            _os_log_error_impl(&dword_1AF589000, v5, OS_LOG_TYPE_ERROR, "%13.5f: returning invalid supportedEvents %@", (uint8_t *)&v9, 0x16u);

          }
          result = *(_QWORD *)(a1 + 32);
        }
        break;
      }
    }
  }
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = *(_QWORD *)(result + 40);
  return result;
}

void __40__AWAttentionAwarenessClientConfig_init__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "updateState:", 1);

}

uint64_t __40__AWAttentionAwarenessClientConfig_init__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "updateState:", 0);
}

void __54__AWAttentionAwarenessClientConfig_sharedClientConfig__block_invoke()
{
  AWAttentionAwarenessClientConfig *v0;
  void *v1;

  v0 = objc_alloc_init(AWAttentionAwarenessClientConfig);
  v1 = (void *)sharedClientConfig_clientConfig;
  sharedClientConfig_clientConfig = (uint64_t)v0;

}

@end
