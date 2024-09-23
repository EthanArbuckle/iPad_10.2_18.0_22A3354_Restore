@implementation CCSetChangeXPCEventHandler

+ (id)sharedInstance
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __44__CCSetChangeXPCEventHandler_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance__pasOnceToken2_1 != -1)
    dispatch_once(&sharedInstance__pasOnceToken2_1, block);
  return (id)sharedInstance__pasExprOnceResult_1;
}

void __44__CCSetChangeXPCEventHandler_sharedInstance__block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;

  v0 = (void *)MEMORY[0x23B82079C]();
  objc_opt_class();
  v1 = objc_opt_new();
  v2 = (void *)sharedInstance__pasExprOnceResult_1;
  sharedInstance__pasExprOnceResult_1 = v1;

  objc_autoreleasePoolPop(v0);
}

- (CCSetChangeXPCEventHandler)init
{
  CCSetChangeXPCEventHandler *v2;
  uint64_t v3;
  NSMutableArray *listeners;
  NSObject *v5;
  dispatch_queue_t v6;
  OS_dispatch_queue *queue;
  NSObject *v8;
  NSObject *v9;
  _QWORD handler[4];
  id v12;
  id buf[2];
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)CCSetChangeXPCEventHandler;
  v2 = -[CCSetChangeXPCEventHandler init](&v14, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    listeners = v2->_listeners;
    v2->_listeners = (NSMutableArray *)v3;

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = dispatch_queue_create("com.apple.cascade.setChange.xpc.eventHandler", v5);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v6;

    __biome_log_for_category();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl(&dword_237B25000, v8, OS_LOG_TYPE_DEFAULT, "CCSetChangeXPCEventHandler setting up XPC event handler", (uint8_t *)buf, 2u);
    }

    objc_initWeak(buf, v2);
    v9 = v2->_queue;
    handler[0] = MEMORY[0x24BDAC760];
    handler[1] = 3221225472;
    handler[2] = __34__CCSetChangeXPCEventHandler_init__block_invoke;
    handler[3] = &unk_2509911A0;
    objc_copyWeak(&v12, buf);
    xpc_set_event_stream_handler("com.apple.cascade.xpc_event.setChange", v9, handler);
    objc_destroyWeak(&v12);
    objc_destroyWeak(buf);
  }
  return v2;
}

void __34__CCSetChangeXPCEventHandler_init__block_invoke(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "_handleXPCEvent:", v3);

}

- (void)_handleXPCEvent:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  NSObject *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  uint64_t v23;
  void *v24;
  _QWORD v25[5];
  _QWORD block[5];
  id v27;
  id v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  id v33;
  uint8_t buf[4];
  void *v35;
  __int16 v36;
  id v37;
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[CCSetChangeXPCEventHandler queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", xpc_dictionary_get_string(v4, (const char *)*MEMORY[0x24BDACF50]));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = 0;
  v24 = v4;
  CCSetChangeXPCEventDecode(v4, (uint64_t)&v33);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v33;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  -[CCSetChangeXPCEventHandler listeners](self, "listeners");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v29, v38, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v30;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v30 != v12)
          objc_enumerationMutation(v9);
        v14 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * v13);
        objc_msgSend(v14, "identifier");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v15, "isEqual:", v6);

        if (v16)
        {
          if ((objc_msgSend(v14, "handlesUpdateForSet:", v7) & 1) == 0)
          {
            __biome_log_for_category();
            v19 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412290;
              v35 = v7;
              _os_log_debug_impl(&dword_237B25000, v19, OS_LOG_TYPE_DEBUG, "Current process does not have read-only or greater access to set: %@, skipping set change update", buf, 0xCu);
            }
            goto LABEL_12;
          }
          objc_msgSend(v14, "handlerBlock");
          v17 = (void *)objc_claimAutoreleasedReturnValue();

          if (v17)
          {
            objc_msgSend(v14, "queue");
            v18 = objc_claimAutoreleasedReturnValue();
            block[0] = MEMORY[0x24BDAC760];
            block[1] = 3221225472;
            block[2] = __46__CCSetChangeXPCEventHandler__handleXPCEvent___block_invoke;
            block[3] = &unk_2509911C8;
            block[4] = v14;
            v27 = v7;
            v28 = v8;
            dispatch_async(v18, block);

            goto LABEL_13;
          }
          objc_msgSend(v14, "batchHandlerBlock");
          v20 = (void *)objc_claimAutoreleasedReturnValue();

          if (v20)
          {
            if (v8)
            {
              __biome_log_for_category();
              v19 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138412546;
                v35 = v6;
                v36 = 2112;
                v37 = v8;
                _os_log_error_impl(&dword_237B25000, v19, OS_LOG_TYPE_ERROR, "Unable to decode a set from XPC event for listener: %@ with error: %@.", buf, 0x16u);
              }
LABEL_12:

              goto LABEL_13;
            }
            objc_msgSend(v14, "setChangeQueue");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v21, "enqueue:", v7);

            objc_msgSend(v14, "queue");
            v22 = objc_claimAutoreleasedReturnValue();
            v25[0] = MEMORY[0x24BDAC760];
            v25[1] = 3221225472;
            v25[2] = __46__CCSetChangeXPCEventHandler__handleXPCEvent___block_invoke_8;
            v25[3] = &unk_2509911F0;
            v25[4] = v14;
            dispatch_async(v22, v25);

          }
        }
LABEL_13:
        ++v13;
      }
      while (v11 != v13);
      v23 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v29, v38, 16);
      v11 = v23;
    }
    while (v23);
  }

}

void __46__CCSetChangeXPCEventHandler__handleXPCEvent___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "handlerBlock");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, _QWORD, _QWORD))v2 + 2))(v2, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

}

void __46__CCSetChangeXPCEventHandler__handleXPCEvent___block_invoke_8(uint64_t a1)
{
  void *v2;
  void (**v3)(_QWORD, _QWORD);
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "setChangeQueue");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dequeueAll");
  v4 = (id)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v4, "count"))
  {
    objc_msgSend(*(id *)(a1 + 32), "batchHandlerBlock");
    v3 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, id))v3)[2](v3, v4);

  }
}

- (void)addListener:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD block[4];
  id v8;
  CCSetChangeXPCEventHandler *v9;

  v4 = a3;
  -[CCSetChangeXPCEventHandler queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __42__CCSetChangeXPCEventHandler_addListener___block_invoke;
  block[3] = &unk_250990570;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_sync(v5, block);

}

void __42__CCSetChangeXPCEventHandler_addListener___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  int v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  __biome_log_for_category();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v5 = 138412290;
    v6 = v3;
    _os_log_impl(&dword_237B25000, v2, OS_LOG_TYPE_DEFAULT, "CCSetChangeXPCEventHandler adding listener: %@", (uint8_t *)&v5, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 40), "listeners");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObject:", *(_QWORD *)(a1 + 32));

}

- (void)removeListener:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD block[4];
  id v8;
  CCSetChangeXPCEventHandler *v9;

  v4 = a3;
  -[CCSetChangeXPCEventHandler queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __45__CCSetChangeXPCEventHandler_removeListener___block_invoke;
  block[3] = &unk_250990570;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_sync(v5, block);

}

void __45__CCSetChangeXPCEventHandler_removeListener___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  int v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  __biome_log_for_category();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v5 = 138412290;
    v6 = v3;
    _os_log_impl(&dword_237B25000, v2, OS_LOG_TYPE_DEFAULT, "CCSetChangeXPCEventHandler removing listener: %@", (uint8_t *)&v5, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 40), "listeners");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObject:", *(_QWORD *)(a1 + 32));

}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (NSMutableArray)listeners
{
  return self->_listeners;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_listeners, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end
