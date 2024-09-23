@implementation CCSetChangeXPCNotifier

+ (id)sharedInstance
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __40__CCSetChangeXPCNotifier_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance__pasOnceToken2_0 != -1)
    dispatch_once(&sharedInstance__pasOnceToken2_0, block);
  return (id)sharedInstance__pasExprOnceResult_0;
}

void __40__CCSetChangeXPCNotifier_sharedInstance__block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;

  v0 = (void *)MEMORY[0x23B82079C]();
  objc_opt_class();
  v1 = objc_opt_new();
  v2 = (void *)sharedInstance__pasExprOnceResult_0;
  sharedInstance__pasExprOnceResult_0 = v1;

  objc_autoreleasePoolPop(v0);
}

- (CCSetChangeXPCNotifier)init
{
  CCSetChangeXPCNotifier *v2;
  uint64_t v3;
  NSMutableArray *tokens;
  NSObject *v5;
  dispatch_queue_t v6;
  OS_dispatch_queue *queue;
  NSObject *v8;
  uint64_t v9;
  OS_xpc_event_publisher *publisher;
  id v12;
  id buf[2];
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)CCSetChangeXPCNotifier;
  v2 = -[CCSetChangeXPCNotifier init](&v14, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    tokens = v2->_tokens;
    v2->_tokens = (NSMutableArray *)v3;

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = dispatch_queue_create("com.apple.cascade.setChange.xpc.notifier", v5);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v6;

    __biome_log_for_category();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl(&dword_237B25000, v8, OS_LOG_TYPE_DEFAULT, "CCSetChangeXPCNotifier setting up XPC event publisher", (uint8_t *)buf, 2u);
    }

    CCSetChangeXPCEventStream();
    xpc_event_publisher_create();
    v9 = objc_claimAutoreleasedReturnValue();
    publisher = v2->_publisher;
    v2->_publisher = (OS_xpc_event_publisher *)v9;

    objc_initWeak(buf, v2);
    objc_copyWeak(&v12, buf);
    xpc_event_publisher_set_handler();
    xpc_event_publisher_set_error_handler();
    xpc_event_publisher_activate();
    objc_destroyWeak(&v12);
    objc_destroyWeak(buf);
  }
  return v2;
}

void __30__CCSetChangeXPCNotifier_init__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id *v6;
  id v7;
  id WeakRetained;

  v6 = (id *)(a1 + 32);
  v7 = a4;
  WeakRetained = objc_loadWeakRetained(v6);
  objc_msgSend(WeakRetained, "_handlePublisherAction:token:descriptor:", a2, a3, v7);

}

void __30__CCSetChangeXPCNotifier_init__block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  NSObject *v4;

  v3 = xpc_strerror();
  __biome_log_for_category();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __30__CCSetChangeXPCNotifier_init__block_invoke_2_cold_1(a2, v3, v4);

}

- (void)_handlePublisherAction:(unsigned int)a3 token:(unint64_t)a4 descriptor:(id)a5
{
  NSObject *v8;
  void *v9;
  NSMutableArray *v10;
  NSObject *v11;
  NSObject *v12;
  void *v13;
  NSMutableArray *tokens;
  void *v15;
  NSMutableArray *v16;
  int v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (a3 == 2)
  {
    __biome_log_for_category();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v17) = 0;
      _os_log_impl(&dword_237B25000, v11, OS_LOG_TYPE_DEFAULT, "CCSetChangeXPCNotifier _handlePublisherAction: initial barrier", (uint8_t *)&v17, 2u);
    }
  }
  else if (a3 == 1)
  {
    __biome_log_for_category();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", a4);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = 138412290;
      v18 = v13;
      _os_log_impl(&dword_237B25000, v12, OS_LOG_TYPE_DEFAULT, "CCSetChangeXPCNotifier removing listener with token: %@", (uint8_t *)&v17, 0xCu);

    }
    tokens = self->_tokens;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", a4);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(tokens) = -[NSMutableArray containsObject:](tokens, "containsObject:", v15);

    if ((tokens & 1) != 0)
    {
      v16 = self->_tokens;
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", a4);
      v11 = objc_claimAutoreleasedReturnValue();
      -[NSMutableArray removeObject:](v16, "removeObject:", v11);
    }
    else
    {
      __biome_log_for_category();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        -[CCSetChangeXPCNotifier _handlePublisherAction:token:descriptor:].cold.1(a4, v11);
    }
  }
  else
  {
    if (a3)
      return;
    __biome_log_for_category();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", a4);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = 138412290;
      v18 = v9;
      _os_log_impl(&dword_237B25000, v8, OS_LOG_TYPE_DEFAULT, "CCSetChangeXPCNotifier adding listener with token: %@", (uint8_t *)&v17, 0xCu);

    }
    v10 = self->_tokens;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", a4);
    v11 = objc_claimAutoreleasedReturnValue();
    -[NSMutableArray addObject:](v10, "addObject:", v11);
  }

}

- (void)notifyChangeToSet:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __44__CCSetChangeXPCNotifier_notifyChangeToSet___block_invoke;
  block[3] = &unk_250990570;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(queue, block);

}

void __44__CCSetChangeXPCNotifier_notifyChangeToSet___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v11 = 0u;
  v12 = 0u;
  v9 = 0u;
  v10 = 0u;
  v2 = *(id *)(*(_QWORD *)(a1 + 32) + 24);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v10;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v10 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v9 + 1) + 8 * v6);
        CCSetChangeXPCEventEncode(*(void **)(a1 + 40));
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "unsignedLongValue", (_QWORD)v9);
        xpc_event_publisher_fire();

        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v4);
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tokens, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_publisher, 0);
}

void __30__CCSetChangeXPCNotifier_init__block_invoke_2_cold_1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  void *v5;
  void *v6;
  int v7;
  void *v8;
  __int16 v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", a1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", a2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 138412546;
  v8 = v5;
  v9 = 2112;
  v10 = v6;
  _os_log_error_impl(&dword_237B25000, a3, OS_LOG_TYPE_ERROR, "CCSetChangeXPCNotifier XPC event publisher error: %@ %@", (uint8_t *)&v7, 0x16u);

}

- (void)_handlePublisherAction:(uint64_t)a1 token:(NSObject *)a2 descriptor:.cold.1(uint64_t a1, NSObject *a2)
{
  void *v3;
  int v4;
  void *v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", a1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = 138412290;
  v5 = v3;
  _os_log_error_impl(&dword_237B25000, a2, OS_LOG_TYPE_ERROR, "Unknown token to remove: %@", (uint8_t *)&v4, 0xCu);

}

@end
