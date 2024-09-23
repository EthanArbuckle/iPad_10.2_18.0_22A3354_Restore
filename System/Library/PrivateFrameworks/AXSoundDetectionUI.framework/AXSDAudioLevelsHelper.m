@implementation AXSDAudioLevelsHelper

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_4 != -1)
    dispatch_once(&sharedInstance_onceToken_4, &__block_literal_global_5);
  return (id)sharedInstance___SharedHelper;
}

void __39__AXSDAudioLevelsHelper_sharedInstance__block_invoke()
{
  AXSDAudioLevelsHelper *v0;
  void *v1;

  v0 = objc_alloc_init(AXSDAudioLevelsHelper);
  v1 = (void *)sharedInstance___SharedHelper;
  sharedInstance___SharedHelper = (uint64_t)v0;

}

- (AXSDAudioLevelsHelper)init
{
  AXSDAudioLevelsHelper *v2;
  uint64_t v3;
  NSMutableDictionary *listenerHanders;
  uint64_t v5;
  NSMutableDictionary *listenerBucketCounts;
  dispatch_queue_t v7;
  OS_dispatch_queue *listenerQueue;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)AXSDAudioLevelsHelper;
  v2 = -[AXSDAudioLevelsHelper init](&v10, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    listenerHanders = v2->_listenerHanders;
    v2->_listenerHanders = (NSMutableDictionary *)v3;

    v5 = objc_opt_new();
    listenerBucketCounts = v2->_listenerBucketCounts;
    v2->_listenerBucketCounts = (NSMutableDictionary *)v5;

    v7 = dispatch_queue_create("com.apple.accessibility.sounddetection.update_listeners", 0);
    listenerQueue = v2->_listenerQueue;
    v2->_listenerQueue = (OS_dispatch_queue *)v7;

  }
  return v2;
}

- (void)registerListener:(id)a3 forAudioLevelUpdates:(id)a4 withBucketCount:(int)a5
{
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  NSObject *listenerQueue;
  id v13;
  id v14;
  _QWORD v15[5];
  id v16;
  id v17;
  int v18;
  uint8_t buf[4];
  id v20;
  __int16 v21;
  int v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  AXLogUltron();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412546;
    v20 = v8;
    v21 = 1024;
    v22 = a5;
    _os_log_debug_impl(&dword_21ACD4000, v10, OS_LOG_TYPE_DEBUG, "Register audio listener: %@ with bucket count: %d", buf, 0x12u);
  }

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  listenerQueue = self->_listenerQueue;
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __79__AXSDAudioLevelsHelper_registerListener_forAudioLevelUpdates_withBucketCount___block_invoke;
  v15[3] = &unk_24DDF6E50;
  v16 = v11;
  v17 = v9;
  v15[4] = self;
  v18 = a5;
  v13 = v11;
  v14 = v9;
  dispatch_async(listenerQueue, v15);

}

void __79__AXSDAudioLevelsHelper_registerListener_forAudioLevelUpdates_withBucketCount___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
  v3 = (void *)objc_msgSend(*(id *)(a1 + 48), "copy");
  objc_msgSend(v2, "setObject:forKey:", v3, *(_QWORD *)(a1 + 40));

  v4 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", *(unsigned int *)(a1 + 56));
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v5, *(_QWORD *)(a1 + 40));

}

- (void)deregisterListener:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  NSObject *listenerQueue;
  id v8;
  _QWORD v9[5];
  id v10;
  uint8_t buf[4];
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  AXLogUltron();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    v12 = v4;
    _os_log_debug_impl(&dword_21ACD4000, v5, OS_LOG_TYPE_DEBUG, "Deregister audio listener: %@", buf, 0xCu);
  }

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  listenerQueue = self->_listenerQueue;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __44__AXSDAudioLevelsHelper_deregisterListener___block_invoke;
  v9[3] = &unk_24DDF6B58;
  v9[4] = self;
  v10 = v6;
  v8 = v6;
  dispatch_async(listenerQueue, v9);

}

uint64_t __44__AXSDAudioLevelsHelper_deregisterListener___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "removeObjectForKey:", *(_QWORD *)(a1 + 40));
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "removeObjectForKey:", *(_QWORD *)(a1 + 40));
}

- (void)updateListenersWithBuffer:(id)a3
{
  id v4;
  NSObject *listenerQueue;
  id v6;
  _QWORD v7[5];
  id v8;
  _QWORD *v9;
  _QWORD *v10;
  _QWORD v11[5];
  id v12;
  _QWORD v13[3];
  int v14;

  v4 = a3;
  v13[0] = 0;
  v13[1] = v13;
  v13[2] = 0x2020000000;
  v14 = 0;
  v11[0] = 0;
  v11[1] = v11;
  v11[2] = 0x3032000000;
  v11[3] = __Block_byref_object_copy__1;
  v11[4] = __Block_byref_object_dispose__1;
  v12 = 0;
  listenerQueue = self->_listenerQueue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __51__AXSDAudioLevelsHelper_updateListenersWithBuffer___block_invoke;
  v7[3] = &unk_24DDF6EA0;
  v9 = v13;
  v10 = v11;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(listenerQueue, v7);

  _Block_object_dispose(v11, 8);
  _Block_object_dispose(v13, 8);
}

void __51__AXSDAudioLevelsHelper_updateListenersWithBuffer___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  uint64_t v7;
  void *v8;
  int v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t);
  void *v19;
  id v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "allKeys");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v22;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v22 != v5)
          objc_enumerationMutation(v2);
        v7 = *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * i);
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "objectForKey:", v7, v16, v17, v18, v19);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = objc_msgSend(v8, "intValue");

        if (v9 != *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
        {
          objc_msgSend(*(id *)(a1 + 40), "magnitudesWithLevelMultiplier:count:", v9, 10.0);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v11 = objc_msgSend(v10, "mutableCopy");
          v12 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
          v13 = *(void **)(v12 + 40);
          *(_QWORD *)(v12 + 40) = v11;

          *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = v9;
        }
        if ((unint64_t)objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "count") >= 3)
          objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "removeObjectsInRange:", 0, 2);
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "objectForKey:", v7);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = v14;
        if (v14 && *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40))
        {
          v16 = MEMORY[0x24BDAC760];
          v17 = 3221225472;
          v18 = __51__AXSDAudioLevelsHelper_updateListenersWithBuffer___block_invoke_2;
          v19 = &unk_24DDF6E78;
          v20 = v14;
          AXPerformBlockOnMainThread();

        }
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v4);
  }

}

uint64_t __51__AXSDAudioLevelsHelper_updateListenersWithBuffer___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_listenerQueue, 0);
  objc_storeStrong((id *)&self->_listenerBucketCounts, 0);
  objc_storeStrong((id *)&self->_listenerHanders, 0);
}

@end
