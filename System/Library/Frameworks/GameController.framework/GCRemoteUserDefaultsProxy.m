@implementation GCRemoteUserDefaultsProxy

- (GCRemoteUserDefaultsProxy)init
{
  GCRemoteUserDefaultsProxy *v2;
  dispatch_queue_t v3;
  OS_dispatch_queue *queue;
  uint64_t v5;
  NSMutableDictionary *observers;
  uint64_t v7;
  NSMutableDictionary *clients;
  void *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)GCRemoteUserDefaultsProxy;
  v2 = -[GCRemoteUserDefaultsProxy init](&v11, sel_init);
  if (v2)
  {
    v3 = dispatch_queue_create("GCRemoteUserDefaultsProxy", 0);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v3;

    v5 = objc_opt_new();
    observers = v2->_observers;
    v2->_observers = (NSMutableDictionary *)v5;

    v7 = objc_opt_new();
    clients = v2->_clients;
    v2->_clients = (NSMutableDictionary *)v7;

    +[NSNotificationCenter defaultCenter](&off_254DEC7B0, "defaultCenter");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addObserver:selector:name:object:", v2, sel_consoleUserDidChange_, *MEMORY[0x24BE3A328], 0);

  }
  return v2;
}

- (BOOL)agentConnectionEstablished
{
  void *v2;
  BOOL v3;

  -[GCRemoteUserDefaultsProxy activeClient](self, "activeClient");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (id)objectForKey:(id)a3
{
  id v4;
  GCRemoteUserDefaultsProxy *v5;
  _BOOL4 v6;
  void *v7;
  void *v8;
  NSObject *v9;
  id v10;
  NSObject *v12;
  NSObject *v13;
  _QWORD v14[5];
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;

  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  v6 = -[GCRemoteUserDefaultsProxy agentConnectionEstablished](v5, "agentConnectionEstablished");
  objc_sync_exit(v5);

  if (!v6)
    goto LABEL_8;
  if (gc_isInternalBuild())
  {
    getGCLogger();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      -[GCRemoteUserDefaultsProxy objectForKey:].cold.3();

  }
  -[GCRemoteUserDefaultsProxy activeClient](v5, "activeClient");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    if (gc_isInternalBuild())
    {
      getGCLogger();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
        -[GCRemoteUserDefaultsProxy objectForKey:].cold.1();
      v10 = 0;
      goto LABEL_6;
    }
LABEL_8:
    v10 = 0;
    goto LABEL_9;
  }
  -[GCRemoteUserDefaultsProxy activeClient](v5, "activeClient");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_33);
  v9 = objc_claimAutoreleasedReturnValue();

  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__7;
  v19 = __Block_byref_object_dispose__7;
  v20 = 0;
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __42__GCRemoteUserDefaultsProxy_objectForKey___block_invoke_96;
  v14[3] = &unk_24D2B5880;
  v14[4] = &v15;
  -[NSObject objectForKey:withReply:](v9, "objectForKey:withReply:", v4, v14);
  if (gc_isInternalBuild())
  {
    getGCLogger();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      -[GCRemoteUserDefaultsProxy objectForKey:].cold.2();

  }
  v10 = (id)v16[5];
  _Block_object_dispose(&v15, 8);

LABEL_6:
LABEL_9:

  return v10;
}

void __42__GCRemoteUserDefaultsProxy_objectForKey___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  if (gc_isInternalBuild())
  {
    getGCLogger();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
      __42__GCRemoteUserDefaultsProxy_objectForKey___block_invoke_cold_1();

  }
}

void __42__GCRemoteUserDefaultsProxy_objectForKey___block_invoke_96(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

- (id)stringForKey:(id)a3
{
  id v4;
  GCRemoteUserDefaultsProxy *v5;
  _BOOL4 v6;
  void *v7;
  void *v8;
  NSObject *v9;
  id v10;
  NSObject *v12;
  NSObject *v13;
  _QWORD v14[5];
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;

  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  v6 = -[GCRemoteUserDefaultsProxy agentConnectionEstablished](v5, "agentConnectionEstablished");
  objc_sync_exit(v5);

  if (!v6)
    goto LABEL_8;
  if (gc_isInternalBuild())
  {
    getGCLogger();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      -[GCRemoteUserDefaultsProxy stringForKey:].cold.3();

  }
  -[GCRemoteUserDefaultsProxy activeClient](v5, "activeClient");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    if (gc_isInternalBuild())
    {
      getGCLogger();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
        -[GCRemoteUserDefaultsProxy stringForKey:].cold.1();
      v10 = 0;
      goto LABEL_6;
    }
LABEL_8:
    v10 = 0;
    goto LABEL_9;
  }
  -[GCRemoteUserDefaultsProxy activeClient](v5, "activeClient");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_98);
  v9 = objc_claimAutoreleasedReturnValue();

  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__7;
  v19 = __Block_byref_object_dispose__7;
  v20 = 0;
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __42__GCRemoteUserDefaultsProxy_stringForKey___block_invoke_99;
  v14[3] = &unk_24D2B58C8;
  v14[4] = &v15;
  -[NSObject stringForKey:withReply:](v9, "stringForKey:withReply:", v4, v14);
  if (gc_isInternalBuild())
  {
    getGCLogger();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      -[GCRemoteUserDefaultsProxy stringForKey:].cold.2();

  }
  v10 = (id)v16[5];
  _Block_object_dispose(&v15, 8);

LABEL_6:
LABEL_9:

  return v10;
}

void __42__GCRemoteUserDefaultsProxy_stringForKey___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  if (gc_isInternalBuild())
  {
    getGCLogger();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
      __42__GCRemoteUserDefaultsProxy_stringForKey___block_invoke_cold_1();

  }
}

void __42__GCRemoteUserDefaultsProxy_stringForKey___block_invoke_99(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

- (id)dataForKey:(id)a3
{
  id v4;
  GCRemoteUserDefaultsProxy *v5;
  _BOOL4 v6;
  void *v7;
  void *v8;
  NSObject *v9;
  id v10;
  NSObject *v12;
  NSObject *v13;
  _QWORD v14[5];
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;

  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  v6 = -[GCRemoteUserDefaultsProxy agentConnectionEstablished](v5, "agentConnectionEstablished");
  objc_sync_exit(v5);

  if (!v6)
    goto LABEL_8;
  if (gc_isInternalBuild())
  {
    getGCLogger();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      -[GCRemoteUserDefaultsProxy dataForKey:].cold.3();

  }
  -[GCRemoteUserDefaultsProxy activeClient](v5, "activeClient");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    if (gc_isInternalBuild())
    {
      getGCLogger();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
        -[GCRemoteUserDefaultsProxy dataForKey:].cold.1();
      v10 = 0;
      goto LABEL_6;
    }
LABEL_8:
    v10 = 0;
    goto LABEL_9;
  }
  -[GCRemoteUserDefaultsProxy activeClient](v5, "activeClient");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_101);
  v9 = objc_claimAutoreleasedReturnValue();

  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__7;
  v19 = __Block_byref_object_dispose__7;
  v20 = 0;
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __40__GCRemoteUserDefaultsProxy_dataForKey___block_invoke_102;
  v14[3] = &unk_24D2B5910;
  v14[4] = &v15;
  -[NSObject dataForKey:withReply:](v9, "dataForKey:withReply:", v4, v14);
  if (gc_isInternalBuild())
  {
    getGCLogger();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      -[GCRemoteUserDefaultsProxy dataForKey:].cold.2();

  }
  v10 = (id)v16[5];
  _Block_object_dispose(&v15, 8);

LABEL_6:
LABEL_9:

  return v10;
}

void __40__GCRemoteUserDefaultsProxy_dataForKey___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  if (gc_isInternalBuild())
  {
    getGCLogger();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
      __40__GCRemoteUserDefaultsProxy_dataForKey___block_invoke_cold_1();

  }
}

void __40__GCRemoteUserDefaultsProxy_dataForKey___block_invoke_102(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

- (id)dictionaryForKey:(id)a3
{
  id v4;
  GCRemoteUserDefaultsProxy *v5;
  _BOOL4 v6;
  void *v7;
  void *v8;
  NSObject *v9;
  id v10;
  NSObject *v12;
  NSObject *v13;
  _QWORD v14[5];
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;

  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  v6 = -[GCRemoteUserDefaultsProxy agentConnectionEstablished](v5, "agentConnectionEstablished");
  objc_sync_exit(v5);

  if (!v6)
    goto LABEL_8;
  if (gc_isInternalBuild())
  {
    getGCLogger();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      -[GCRemoteUserDefaultsProxy dictionaryForKey:].cold.3();

  }
  -[GCRemoteUserDefaultsProxy activeClient](v5, "activeClient");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    if (gc_isInternalBuild())
    {
      getGCLogger();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
        -[GCRemoteUserDefaultsProxy dictionaryForKey:].cold.1();
      v10 = 0;
      goto LABEL_6;
    }
LABEL_8:
    v10 = 0;
    goto LABEL_9;
  }
  -[GCRemoteUserDefaultsProxy activeClient](v5, "activeClient");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_104);
  v9 = objc_claimAutoreleasedReturnValue();

  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__7;
  v19 = __Block_byref_object_dispose__7;
  v20 = 0;
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __46__GCRemoteUserDefaultsProxy_dictionaryForKey___block_invoke_105;
  v14[3] = &unk_24D2B5958;
  v14[4] = &v15;
  -[NSObject dictionaryForKey:withReply:](v9, "dictionaryForKey:withReply:", v4, v14);
  if (gc_isInternalBuild())
  {
    getGCLogger();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      -[GCRemoteUserDefaultsProxy dictionaryForKey:].cold.2();

  }
  v10 = (id)v16[5];
  _Block_object_dispose(&v15, 8);

LABEL_6:
LABEL_9:

  return v10;
}

void __46__GCRemoteUserDefaultsProxy_dictionaryForKey___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  if (gc_isInternalBuild())
  {
    getGCLogger();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
      __46__GCRemoteUserDefaultsProxy_dictionaryForKey___block_invoke_cold_1();

  }
}

void __46__GCRemoteUserDefaultsProxy_dictionaryForKey___block_invoke_105(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

- (id)arrayForKey:(id)a3
{
  id v4;
  GCRemoteUserDefaultsProxy *v5;
  _BOOL4 v6;
  void *v7;
  void *v8;
  NSObject *v9;
  id v10;
  NSObject *v12;
  NSObject *v13;
  _QWORD v14[5];
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;

  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  v6 = -[GCRemoteUserDefaultsProxy agentConnectionEstablished](v5, "agentConnectionEstablished");
  objc_sync_exit(v5);

  if (!v6)
    goto LABEL_8;
  if (gc_isInternalBuild())
  {
    getGCLogger();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      -[GCRemoteUserDefaultsProxy arrayForKey:].cold.3();

  }
  -[GCRemoteUserDefaultsProxy activeClient](v5, "activeClient");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    if (gc_isInternalBuild())
    {
      getGCLogger();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
        -[GCRemoteUserDefaultsProxy arrayForKey:].cold.1();
      v10 = 0;
      goto LABEL_6;
    }
LABEL_8:
    v10 = 0;
    goto LABEL_9;
  }
  -[GCRemoteUserDefaultsProxy activeClient](v5, "activeClient");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_107);
  v9 = objc_claimAutoreleasedReturnValue();

  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__7;
  v19 = __Block_byref_object_dispose__7;
  v20 = 0;
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __41__GCRemoteUserDefaultsProxy_arrayForKey___block_invoke_108;
  v14[3] = &unk_24D2B59A0;
  v14[4] = &v15;
  -[NSObject arrayForKey:withReply:](v9, "arrayForKey:withReply:", v4, v14);
  if (gc_isInternalBuild())
  {
    getGCLogger();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      -[GCRemoteUserDefaultsProxy arrayForKey:].cold.2();

  }
  v10 = (id)v16[5];
  _Block_object_dispose(&v15, 8);

LABEL_6:
LABEL_9:

  return v10;
}

void __41__GCRemoteUserDefaultsProxy_arrayForKey___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  if (gc_isInternalBuild())
  {
    getGCLogger();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
      __41__GCRemoteUserDefaultsProxy_arrayForKey___block_invoke_cold_1();

  }
}

void __41__GCRemoteUserDefaultsProxy_arrayForKey___block_invoke_108(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

- (void)setObject:(id)a3 forKey:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[GCRemoteUserDefaultsProxy activeClient](self, "activeClient");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKey:", v7, v6);

}

- (BOOL)BOOLForKey:(id)a3
{
  id v4;
  GCRemoteUserDefaultsProxy *v5;
  _BOOL4 v6;
  void *v7;
  void *v8;
  NSObject *v9;
  NSObject *v11;
  NSObject *v12;
  _QWORD v13[5];
  uint64_t v14;
  _QWORD v15[2];
  char v16;

  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  v6 = -[GCRemoteUserDefaultsProxy agentConnectionEstablished](v5, "agentConnectionEstablished");
  objc_sync_exit(v5);

  if (v6)
  {
    if (gc_isInternalBuild())
    {
      getGCLogger();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
        -[GCRemoteUserDefaultsProxy BOOLForKey:].cold.3();

    }
    -[GCRemoteUserDefaultsProxy activeClient](v5, "activeClient");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      -[GCRemoteUserDefaultsProxy activeClient](v5, "activeClient");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_110);
      v9 = objc_claimAutoreleasedReturnValue();

      v14 = 0;
      v15[0] = &v14;
      v15[1] = 0x2020000000;
      v16 = 0;
      v13[0] = MEMORY[0x24BDAC760];
      v13[1] = 3221225472;
      v13[2] = __40__GCRemoteUserDefaultsProxy_BOOLForKey___block_invoke_111;
      v13[3] = &unk_24D2B59E8;
      v13[4] = &v14;
      -[NSObject BOOLForKey:withReply:](v9, "BOOLForKey:withReply:", v4, v13);
      if (gc_isInternalBuild())
      {
        getGCLogger();
        v12 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
          -[GCRemoteUserDefaultsProxy BOOLForKey:].cold.2((uint64_t)v15, v12);

      }
      LOBYTE(v6) = *(_BYTE *)(v15[0] + 24) != 0;
      _Block_object_dispose(&v14, 8);
    }
    else
    {
      if (!gc_isInternalBuild())
      {
        LOBYTE(v6) = 0;
        goto LABEL_9;
      }
      getGCLogger();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
        -[GCRemoteUserDefaultsProxy BOOLForKey:].cold.1();
      LOBYTE(v6) = 0;
    }

  }
LABEL_9:

  return v6;
}

void __40__GCRemoteUserDefaultsProxy_BOOLForKey___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  if (gc_isInternalBuild())
  {
    getGCLogger();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
      __40__GCRemoteUserDefaultsProxy_BOOLForKey___block_invoke_cold_1();

  }
}

uint64_t __40__GCRemoteUserDefaultsProxy_BOOLForKey___block_invoke_111(uint64_t result, char a2)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = a2;
  return result;
}

- (void)setBool:(BOOL)a3 forKey:(id)a4
{
  _BOOL8 v4;
  id v6;
  id v7;

  v4 = a3;
  v6 = a4;
  -[GCRemoteUserDefaultsProxy activeClient](self, "activeClient");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setBool:forKey:", v4, v6);

}

- (double)doubleForKey:(id)a3
{
  id v4;
  GCRemoteUserDefaultsProxy *v5;
  _BOOL4 v6;
  double v7;
  void *v8;
  void *v9;
  NSObject *v10;
  NSObject *v12;
  NSObject *v13;
  _QWORD v14[5];
  uint64_t v15;
  double *v16;
  uint64_t v17;
  uint64_t v18;

  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  v6 = -[GCRemoteUserDefaultsProxy agentConnectionEstablished](v5, "agentConnectionEstablished");
  objc_sync_exit(v5);

  v7 = 0.0;
  if (v6)
  {
    if (gc_isInternalBuild())
    {
      getGCLogger();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
        -[GCRemoteUserDefaultsProxy doubleForKey:].cold.3();

    }
    -[GCRemoteUserDefaultsProxy activeClient](v5, "activeClient");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      -[GCRemoteUserDefaultsProxy activeClient](v5, "activeClient");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_113);
      v10 = objc_claimAutoreleasedReturnValue();

      v15 = 0;
      v16 = (double *)&v15;
      v17 = 0x2020000000;
      v18 = 0;
      v14[0] = MEMORY[0x24BDAC760];
      v14[1] = 3221225472;
      v14[2] = __42__GCRemoteUserDefaultsProxy_doubleForKey___block_invoke_114;
      v14[3] = &unk_24D2B5A30;
      v14[4] = &v15;
      -[NSObject doubleForKey:withReply:](v10, "doubleForKey:withReply:", v4, v14);
      if (gc_isInternalBuild())
      {
        getGCLogger();
        v13 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
          -[GCRemoteUserDefaultsProxy doubleForKey:].cold.2();

      }
      v7 = v16[3];
      _Block_object_dispose(&v15, 8);
    }
    else
    {
      if (!gc_isInternalBuild())
        goto LABEL_8;
      getGCLogger();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
        -[GCRemoteUserDefaultsProxy doubleForKey:].cold.1();
    }

  }
LABEL_8:

  return v7;
}

void __42__GCRemoteUserDefaultsProxy_doubleForKey___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  if (gc_isInternalBuild())
  {
    getGCLogger();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
      __42__GCRemoteUserDefaultsProxy_doubleForKey___block_invoke_cold_1();

  }
}

uint64_t __42__GCRemoteUserDefaultsProxy_doubleForKey___block_invoke_114(uint64_t result, double a2)
{
  *(double *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = a2;
  return result;
}

- (void)setDouble:(double)a3 forKey:(id)a4
{
  id v6;
  id v7;

  v6 = a4;
  -[GCRemoteUserDefaultsProxy activeClient](self, "activeClient");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setDouble:forKey:", v6, a3);

}

- (float)floatForKey:(id)a3
{
  id v4;
  GCRemoteUserDefaultsProxy *v5;
  _BOOL4 v6;
  float v7;
  void *v8;
  void *v9;
  NSObject *v10;
  NSObject *v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  _QWORD v20[5];
  uint64_t v21;
  _QWORD v22[2];
  int v23;

  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  v6 = -[GCRemoteUserDefaultsProxy agentConnectionEstablished](v5, "agentConnectionEstablished");
  objc_sync_exit(v5);

  v7 = 0.0;
  if (v6)
  {
    if (gc_isInternalBuild())
    {
      getGCLogger();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
        -[GCRemoteUserDefaultsProxy floatForKey:].cold.3();

    }
    -[GCRemoteUserDefaultsProxy activeClient](v5, "activeClient");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      -[GCRemoteUserDefaultsProxy activeClient](v5, "activeClient");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_116);
      v10 = objc_claimAutoreleasedReturnValue();

      v21 = 0;
      v22[0] = &v21;
      v22[1] = 0x2020000000;
      v23 = 0;
      v20[0] = MEMORY[0x24BDAC760];
      v20[1] = 3221225472;
      v20[2] = __41__GCRemoteUserDefaultsProxy_floatForKey___block_invoke_117;
      v20[3] = &unk_24D2B5A78;
      v20[4] = &v21;
      -[NSObject floatForKey:withReply:](v10, "floatForKey:withReply:", v4, v20);
      if (gc_isInternalBuild())
      {
        getGCLogger();
        v13 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
          -[GCRemoteUserDefaultsProxy floatForKey:].cold.2((uint64_t)v22, v13, v14, v15, v16, v17, v18, v19);

      }
      v7 = *(float *)(v22[0] + 24);
      _Block_object_dispose(&v21, 8);
    }
    else
    {
      if (!gc_isInternalBuild())
        goto LABEL_8;
      getGCLogger();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
        -[GCRemoteUserDefaultsProxy floatForKey:].cold.1();
    }

  }
LABEL_8:

  return v7;
}

void __41__GCRemoteUserDefaultsProxy_floatForKey___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  if (gc_isInternalBuild())
  {
    getGCLogger();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
      __41__GCRemoteUserDefaultsProxy_floatForKey___block_invoke_cold_1();

  }
}

uint64_t __41__GCRemoteUserDefaultsProxy_floatForKey___block_invoke_117(uint64_t result, float a2)
{
  *(float *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = a2;
  return result;
}

- (void)setFloat:(float)a3 forKey:(id)a4
{
  id v6;
  double v7;
  id v8;

  v6 = a4;
  -[GCRemoteUserDefaultsProxy activeClient](self, "activeClient");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  *(float *)&v7 = a3;
  objc_msgSend(v8, "setFloat:forKey:", v6, v7);

}

- (int64_t)integerForKey:(id)a3
{
  id v4;
  GCRemoteUserDefaultsProxy *v5;
  _BOOL4 v6;
  void *v7;
  void *v8;
  NSObject *v9;
  int64_t v10;
  NSObject *v12;
  NSObject *v13;
  _QWORD v14[5];
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t v18;

  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  v6 = -[GCRemoteUserDefaultsProxy agentConnectionEstablished](v5, "agentConnectionEstablished");
  objc_sync_exit(v5);

  if (!v6)
    goto LABEL_8;
  if (gc_isInternalBuild())
  {
    getGCLogger();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      -[GCRemoteUserDefaultsProxy integerForKey:].cold.3();

  }
  -[GCRemoteUserDefaultsProxy activeClient](v5, "activeClient");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    if (gc_isInternalBuild())
    {
      getGCLogger();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
        -[GCRemoteUserDefaultsProxy integerForKey:].cold.1();
      v10 = 0;
      goto LABEL_6;
    }
LABEL_8:
    v10 = 0;
    goto LABEL_9;
  }
  -[GCRemoteUserDefaultsProxy activeClient](v5, "activeClient");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_119);
  v9 = objc_claimAutoreleasedReturnValue();

  v15 = 0;
  v16 = &v15;
  v17 = 0x2020000000;
  v18 = 0;
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __43__GCRemoteUserDefaultsProxy_integerForKey___block_invoke_120;
  v14[3] = &unk_24D2B5AC0;
  v14[4] = &v15;
  -[NSObject integerForKey:withReply:](v9, "integerForKey:withReply:", v4, v14);
  if (gc_isInternalBuild())
  {
    getGCLogger();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      -[GCRemoteUserDefaultsProxy integerForKey:].cold.2();

  }
  v10 = v16[3];
  _Block_object_dispose(&v15, 8);
LABEL_6:

LABEL_9:
  return v10;
}

void __43__GCRemoteUserDefaultsProxy_integerForKey___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  if (gc_isInternalBuild())
  {
    getGCLogger();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
      __43__GCRemoteUserDefaultsProxy_integerForKey___block_invoke_cold_1();

  }
}

uint64_t __43__GCRemoteUserDefaultsProxy_integerForKey___block_invoke_120(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = a2;
  return result;
}

- (void)setInteger:(int64_t)a3 forKey:(id)a4
{
  id v6;
  id v7;

  v6 = a4;
  -[GCRemoteUserDefaultsProxy activeClient](self, "activeClient");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setInteger:forKey:", a3, v6);

}

- (void)postInitialKVONotificationForObservation:(id)a3 keyPath:(id)a4
{
  id v6;
  id v7;
  GCRemoteUserDefaultsProxy *v8;
  _BOOL4 v9;
  id v10;
  void *v11;
  void *v12;
  _QWORD *v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  int v18;
  id v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = self;
  objc_sync_enter(v8);
  v9 = -[GCRemoteUserDefaultsProxy agentConnectionEstablished](v8, "agentConnectionEstablished");
  objc_sync_exit(v8);

  if (!v9)
    goto LABEL_16;
  v10 = objc_alloc_init((Class)&off_254DEBD30);
  objc_msgSend(v10, "setObject:forKeyedSubscript:", &unk_24D30EEF0, *MEMORY[0x24BDD0E68]);
  if ((objc_msgSend(v6, "options") & 4) == 0)
  {
    if ((objc_msgSend(v6, "options") & 1) == 0)
      goto LABEL_14;
    -[GCRemoteUserDefaultsProxy objectForKey:](v8, "objectForKey:", v7);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      objc_msgSend(v10, "setObject:forKeyedSubscript:", v11, *MEMORY[0x24BDD0E70]);
    }
    else
    {
      +[NSNull null](&off_254E06A98, "null");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setObject:forKeyedSubscript:", v15, *MEMORY[0x24BDD0E70]);

    }
    if ((objc_msgSend(v6, "options") & 2) == 0)
      goto LABEL_14;
    +[NSNull null](&off_254E06A98, "null");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (_QWORD *)MEMORY[0x24BDD0E80];
    goto LABEL_12;
  }
  -[GCRemoteUserDefaultsProxy objectForKey:](v8, "objectForKey:", v7);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = (_QWORD *)MEMORY[0x24BDD0E70];
LABEL_12:
    objc_msgSend(v10, "setObject:forKeyedSubscript:", v12, *v13);
    goto LABEL_13;
  }
  +[NSNull null](&off_254E06A98, "null");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setObject:forKeyedSubscript:", v14, *MEMORY[0x24BDD0E70]);

LABEL_13:
LABEL_14:
  if (gc_isInternalBuild())
  {
    getGCLogger();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      v18 = 138412546;
      v19 = v6;
      v20 = 2112;
      v21 = v7;
      _os_log_impl(&dword_215181000, v17, OS_LOG_TYPE_INFO, "GCRemoteUserDefaultsProxy - postInitialKVONotificationForObservation:%@ keyPath:%@", (uint8_t *)&v18, 0x16u);
    }

  }
  objc_msgSend(v6, "observer");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "observeValueForKeyPath:ofObject:change:context:", v7, v8, v10, objc_msgSend(v6, "context"));

LABEL_16:
}

- (void)addObserver:(id)a3 forKeyPath:(id)a4 options:(unint64_t)a5 context:(void *)a6
{
  id v10;
  id v11;
  GCRemoteUserDefaultsProxy *v12;
  void *v13;
  void *v14;
  void *v15;
  GCObservation *v16;
  NSObject *v17;
  NSObject *v18;
  NSObject *v19;
  int v20;
  id v21;
  __int16 v22;
  id v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v12 = self;
  objc_sync_enter(v12);
  if (gc_isInternalBuild())
  {
    getGCLogger();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      v20 = 138412802;
      v21 = v10;
      v22 = 2112;
      v23 = v11;
      v24 = 2048;
      v25 = a6;
      _os_log_impl(&dword_215181000, v17, OS_LOG_TYPE_INFO, "GCRemoteUserDefaultsProxy - addObserver:%@ forKeyPath:%@ context:%lu", (uint8_t *)&v20, 0x20u);
    }

  }
  -[NSMutableDictionary objectForKeyedSubscript:](v12->_observers, "objectForKeyedSubscript:", v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v13, "mutableCopy");

  if (!v14)
  {
    v14 = (void *)objc_opt_new();
    if (-[GCRemoteUserDefaultsProxy agentConnectionEstablished](v12, "agentConnectionEstablished"))
    {
      -[GCRemoteUserDefaultsProxy activeClient](v12, "activeClient");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "observeKeyPath:", v11);

    }
    if (gc_isInternalBuild())
    {
      getGCLogger();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      {
        v20 = 138412290;
        v21 = v11;
        _os_log_impl(&dword_215181000, v19, OS_LOG_TYPE_INFO, "GCRemoteUserDefaultsProxy - begin observing key path %@", (uint8_t *)&v20, 0xCu);
      }

    }
  }
  v16 = -[GCObservation initWithObserver:options:context:]([GCObservation alloc], "initWithObserver:options:context:", v10, a5, a6);
  objc_msgSend(v14, "addObject:", v16);
  -[NSMutableDictionary setObject:forKeyedSubscript:](v12->_observers, "setObject:forKeyedSubscript:", v14, v11);
  if ((-[GCObservation options](v16, "options") & 4) != 0)
    -[GCRemoteUserDefaultsProxy postInitialKVONotificationForObservation:keyPath:](v12, "postInitialKVONotificationForObservation:keyPath:", v16, v11);
  if (gc_isInternalBuild())
  {
    getGCLogger();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
      -[GCRemoteUserDefaultsProxy addObserver:forKeyPath:options:context:].cold.1();

  }
  objc_sync_exit(v12);

}

- (void)removeObserver:(id)a3 forKeyPath:(id)a4
{
  -[GCRemoteUserDefaultsProxy removeObserver:forKeyPath:context:](self, "removeObserver:forKeyPath:context:", a3, a4, 0);
}

- (void)removeObserver:(id)a3 forKeyPath:(id)a4 context:(void *)a5
{
  id v8;
  id v9;
  GCRemoteUserDefaultsProxy *v10;
  void *v11;
  void *v12;
  GCObservation *v13;
  uint64_t v14;
  NSMutableDictionary *observers;
  NSObject *v16;
  void *v17;
  NSObject *v18;
  NSObject *v19;
  int v20;
  id v21;
  __int16 v22;
  id v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = self;
  objc_sync_enter(v10);
  -[NSMutableDictionary objectForKeyedSubscript:](v10->_observers, "objectForKeyedSubscript:", v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v11, "mutableCopy");

  if (gc_isInternalBuild())
  {
    getGCLogger();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      v20 = 138412802;
      v21 = v8;
      v22 = 2112;
      v23 = v9;
      v24 = 2048;
      v25 = a5;
      _os_log_impl(&dword_215181000, v18, OS_LOG_TYPE_INFO, "GCRemoteUserDefaultsProxy - removeObserver %@ forKeyPath %@ context %lu", (uint8_t *)&v20, 0x20u);
    }

  }
  if (v12)
  {
    v13 = -[GCObservation initWithObserver:options:context:]([GCObservation alloc], "initWithObserver:options:context:", v8, 0, 0);
    if ((objc_msgSend(v12, "containsObject:", v13) & 1) != 0)
    {
      objc_msgSend(v12, "removeObject:", v13);
      v14 = objc_msgSend(v12, "count");
      observers = v10->_observers;
      if (v14)
      {
        -[NSMutableDictionary setObject:forKeyedSubscript:](observers, "setObject:forKeyedSubscript:", v12, v9);
      }
      else
      {
        -[NSMutableDictionary removeObjectForKey:](observers, "removeObjectForKey:", v9);
        if (-[GCRemoteUserDefaultsProxy agentConnectionEstablished](v10, "agentConnectionEstablished"))
        {
          -[GCRemoteUserDefaultsProxy activeClient](v10, "activeClient");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "stopObservingKeyPath:", v9);

        }
        if (gc_isInternalBuild())
        {
          getGCLogger();
          v19 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
          {
            v20 = 138412290;
            v21 = v9;
            _os_log_impl(&dword_215181000, v19, OS_LOG_TYPE_INFO, "GCRemoteUserDefaultsProxy - stop observing key path %@", (uint8_t *)&v20, 0xCu);
          }

        }
      }
      if (!gc_isInternalBuild())
        goto LABEL_16;
      getGCLogger();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
        -[GCRemoteUserDefaultsProxy removeObserver:forKeyPath:context:].cold.2();
    }
    else
    {
      if (!gc_isInternalBuild())
      {
LABEL_16:

        goto LABEL_17;
      }
      getGCLogger();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        -[GCRemoteUserDefaultsProxy removeObserver:forKeyPath:context:].cold.3();
    }

    goto LABEL_16;
  }
  if (gc_isInternalBuild())
  {
    getGCLogger();
    v13 = (GCObservation *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&v13->super, OS_LOG_TYPE_ERROR))
      -[GCRemoteUserDefaultsProxy removeObserver:forKeyPath:context:].cold.1();
    goto LABEL_16;
  }
LABEL_17:

  objc_sync_exit(v10);
}

- (void)observeUserDefaultsValueForKeyPath:(id)a3 change:(id)a4
{
  id v6;
  id v7;
  GCRemoteUserDefaultsProxy *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = self;
  objc_sync_enter(v8);
  -[NSMutableDictionary objectForKeyedSubscript:](v8->_observers, "objectForKeyedSubscript:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9 && objc_msgSend(v9, "count"))
  {
    v19 = 0u;
    v20 = 0u;
    v17 = 0u;
    v18 = 0u;
    v11 = v10;
    v12 = -[NSObject countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    if (v12)
    {
      v13 = *(_QWORD *)v18;
      do
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v18 != v13)
            objc_enumerationMutation(v11);
          v15 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
          objc_msgSend(v15, "observer", (_QWORD)v17);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "observeValueForKeyPath:ofObject:change:context:", v6, v8, v7, objc_msgSend(v15, "context"));

        }
        v12 = -[NSObject countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      }
      while (v12);
    }
  }
  else
  {
    if (!gc_isInternalBuild())
      goto LABEL_12;
    getGCLogger();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      -[GCRemoteUserDefaultsProxy observeUserDefaultsValueForKeyPath:change:].cold.1();
  }

LABEL_12:
  objc_sync_exit(v8);

}

- (void)userDefaultsCheckIn:(id)a3 effectiveUserIdentifier:(unsigned int)a4
{
  uint64_t v4;
  id v6;
  GCRemoteUserDefaultsProxy *v7;
  NSMutableDictionary *clients;
  void *v9;
  NSObject *v10;
  NSObject *v11;
  NSMutableDictionary *v12;
  int v13;
  _DWORD v14[7];

  v4 = *(_QWORD *)&a4;
  *(_QWORD *)&v14[5] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  if (v6)
  {
    if ((_DWORD)v4)
    {
      v7 = self;
      objc_sync_enter(v7);
      if (gc_isInternalBuild())
      {
        getGCLogger();
        v10 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
        {
          v13 = 67109378;
          v14[0] = v4;
          LOWORD(v14[1]) = 2112;
          *(_QWORD *)((char *)&v14[1] + 2) = v6;
          _os_log_impl(&dword_215181000, v10, OS_LOG_TYPE_INFO, "GCRemoteUserDefaultsProxy - agent connection fully established for user %d /w %@", (uint8_t *)&v13, 0x12u);
        }

      }
      clients = v7->_clients;
      +[NSNumber numberWithUnsignedInt:](&off_254DED908, "numberWithUnsignedInt:", v4);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary setObject:forKey:](clients, "setObject:forKey:", v6, v9);

      if (gc_isInternalBuild())
      {
        getGCLogger();
        v11 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
        {
          v12 = v7->_clients;
          v13 = 138412290;
          *(_QWORD *)v14 = v12;
          _os_log_impl(&dword_215181000, v11, OS_LOG_TYPE_INFO, "Clients is now: %@", (uint8_t *)&v13, 0xCu);
        }

      }
      -[GCRemoteUserDefaultsProxy refreshActiveClient](v7, "refreshActiveClient");
      objc_sync_exit(v7);
    }
    else
    {
      if (!gc_isInternalBuild())
        goto LABEL_11;
      getGCLogger();
      v7 = (GCRemoteUserDefaultsProxy *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(&v7->super, OS_LOG_TYPE_ERROR))
        -[GCRemoteUserDefaultsProxy userDefaultsCheckIn:effectiveUserIdentifier:].cold.2();
    }
  }
  else
  {
    if (!gc_isInternalBuild())
      goto LABEL_11;
    getGCLogger();
    v7 = (GCRemoteUserDefaultsProxy *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&v7->super, OS_LOG_TYPE_ERROR))
      -[GCRemoteUserDefaultsProxy userDefaultsCheckIn:effectiveUserIdentifier:].cold.1();
  }

LABEL_11:
}

- (void)refreshActiveClient
{
  OUTLINED_FUNCTION_0_24(&dword_215181000, a1, a3, "GCRemoteUserDefaultsProxy - refreshActiveClient for user %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2_21();
}

- (GCUserDefaultsXPCProxyServiceRemoteClientInterface)activeClient
{
  return self->_activeClient;
}

- (void)setActiveClient:(id)a3
{
  objc_storeStrong((id *)&self->_activeClient, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activeClient, 0);
  objc_storeStrong((id *)&self->_clients, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

- (void)objectForKey:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5_2();
  OUTLINED_FUNCTION_1_23(&dword_215181000, v0, v1, "  No client", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3_7();
}

- (void)objectForKey:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8_1(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_7_1();
  OUTLINED_FUNCTION_0_24(&dword_215181000, v0, v1, "  %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_21();
}

- (void)objectForKey:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_3();
  OUTLINED_FUNCTION_0_24(&dword_215181000, v0, v1, "-objectForKey: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_21();
}

void __42__GCRemoteUserDefaultsProxy_objectForKey___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_3();
  OUTLINED_FUNCTION_0_24(&dword_215181000, v0, v1, "  %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_21();
}

- (void)stringForKey:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5_2();
  OUTLINED_FUNCTION_1_23(&dword_215181000, v0, v1, "  No client", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3_7();
}

- (void)stringForKey:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8_1(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_7_1();
  OUTLINED_FUNCTION_0_24(&dword_215181000, v0, v1, "  %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_21();
}

- (void)stringForKey:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_3();
  OUTLINED_FUNCTION_0_24(&dword_215181000, v0, v1, "-stringForKey: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_21();
}

void __42__GCRemoteUserDefaultsProxy_stringForKey___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_3();
  OUTLINED_FUNCTION_0_24(&dword_215181000, v0, v1, "  %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_21();
}

- (void)dataForKey:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5_2();
  OUTLINED_FUNCTION_1_23(&dword_215181000, v0, v1, "  No client", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3_7();
}

- (void)dataForKey:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8_1(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_7_1();
  OUTLINED_FUNCTION_0_24(&dword_215181000, v0, v1, "  %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_21();
}

- (void)dataForKey:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_3();
  OUTLINED_FUNCTION_0_24(&dword_215181000, v0, v1, "-dataForKey: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_21();
}

void __40__GCRemoteUserDefaultsProxy_dataForKey___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_3();
  OUTLINED_FUNCTION_0_24(&dword_215181000, v0, v1, "  %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_21();
}

- (void)dictionaryForKey:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5_2();
  OUTLINED_FUNCTION_1_23(&dword_215181000, v0, v1, "  No client", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3_7();
}

- (void)dictionaryForKey:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8_1(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_7_1();
  OUTLINED_FUNCTION_0_24(&dword_215181000, v0, v1, "  %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_21();
}

- (void)dictionaryForKey:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_3();
  OUTLINED_FUNCTION_0_24(&dword_215181000, v0, v1, "-dictionaryForKey: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_21();
}

void __46__GCRemoteUserDefaultsProxy_dictionaryForKey___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_3();
  OUTLINED_FUNCTION_0_24(&dword_215181000, v0, v1, "  %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_21();
}

- (void)arrayForKey:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5_2();
  OUTLINED_FUNCTION_1_23(&dword_215181000, v0, v1, "  No client", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3_7();
}

- (void)arrayForKey:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8_1(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_7_1();
  OUTLINED_FUNCTION_0_24(&dword_215181000, v0, v1, "  %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_21();
}

- (void)arrayForKey:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_3();
  OUTLINED_FUNCTION_0_24(&dword_215181000, v0, v1, "-arrayForKey: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_21();
}

void __41__GCRemoteUserDefaultsProxy_arrayForKey___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_3();
  OUTLINED_FUNCTION_0_24(&dword_215181000, v0, v1, "  %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_21();
}

- (void)BOOLForKey:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5_2();
  OUTLINED_FUNCTION_1_23(&dword_215181000, v0, v1, "  No client", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3_7();
}

- (void)BOOLForKey:(uint64_t)a1 .cold.2(uint64_t a1, NSObject *a2)
{
  int v2;
  _DWORD v3[2];
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = *(unsigned __int8 *)(*(_QWORD *)a1 + 24);
  v3[0] = 67109120;
  v3[1] = v2;
  _os_log_debug_impl(&dword_215181000, a2, OS_LOG_TYPE_DEBUG, "  %d", (uint8_t *)v3, 8u);
  OUTLINED_FUNCTION_3_7();
}

- (void)BOOLForKey:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_3();
  OUTLINED_FUNCTION_0_24(&dword_215181000, v0, v1, "-BOOLForKey: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_21();
}

void __40__GCRemoteUserDefaultsProxy_BOOLForKey___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_3();
  OUTLINED_FUNCTION_0_24(&dword_215181000, v0, v1, "  %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_21();
}

- (void)doubleForKey:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5_2();
  OUTLINED_FUNCTION_1_23(&dword_215181000, v0, v1, "  No client", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3_7();
}

- (void)doubleForKey:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7_1();
  OUTLINED_FUNCTION_0_24(&dword_215181000, v0, v1, "  %f", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_21();
}

- (void)doubleForKey:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_3();
  OUTLINED_FUNCTION_0_24(&dword_215181000, v0, v1, "-doubleForKey: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_21();
}

void __42__GCRemoteUserDefaultsProxy_doubleForKey___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_3();
  OUTLINED_FUNCTION_0_24(&dword_215181000, v0, v1, "  %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_21();
}

- (void)floatForKey:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5_2();
  OUTLINED_FUNCTION_1_23(&dword_215181000, v0, v1, "  No client", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3_7();
}

- (void)floatForKey:(uint64_t)a3 .cold.2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_24(&dword_215181000, a2, a3, "  %f", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_2_21();
}

- (void)floatForKey:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_3();
  OUTLINED_FUNCTION_0_24(&dword_215181000, v0, v1, "-floatForKey: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_21();
}

void __41__GCRemoteUserDefaultsProxy_floatForKey___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_3();
  OUTLINED_FUNCTION_0_24(&dword_215181000, v0, v1, "  %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_21();
}

- (void)integerForKey:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5_2();
  OUTLINED_FUNCTION_1_23(&dword_215181000, v0, v1, "  No client", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3_7();
}

- (void)integerForKey:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7_1();
  OUTLINED_FUNCTION_0_24(&dword_215181000, v0, v1, "  %ld", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_21();
}

- (void)integerForKey:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_3();
  OUTLINED_FUNCTION_0_24(&dword_215181000, v0, v1, "-integerForKey: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_21();
}

void __43__GCRemoteUserDefaultsProxy_integerForKey___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_3();
  OUTLINED_FUNCTION_0_24(&dword_215181000, v0, v1, "  %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_21();
}

- (void)addObserver:forKeyPath:options:context:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7_1();
  OUTLINED_FUNCTION_0_24(&dword_215181000, v0, v1, "GCRemoteUserDefaultsProxy - observers are now %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_21();
}

- (void)removeObserver:forKeyPath:context:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5_2();
  OUTLINED_FUNCTION_6_2(&dword_215181000, v0, v1, "GCRemoteUserDefaultsProxy - trying to remove an observer that doesn't exist.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3_7();
}

- (void)removeObserver:forKeyPath:context:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7_1();
  OUTLINED_FUNCTION_0_24(&dword_215181000, v0, v1, "GCRemoteUserDefaultsProxy - observers are now %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_21();
}

- (void)removeObserver:forKeyPath:context:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5_2();
  OUTLINED_FUNCTION_6_2(&dword_215181000, v0, v1, "GCRemoteUserDefaultsProxy - trying to remove an observer that doesn't exist!", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3_7();
}

- (void)observeUserDefaultsValueForKeyPath:change:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5_2();
  OUTLINED_FUNCTION_6_2(&dword_215181000, v0, v1, "GCRemoteUserDefaultsProxy - observeUserDefaultsValueForKeyPath call for field we're not observing!", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3_7();
}

- (void)userDefaultsCheckIn:effectiveUserIdentifier:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5_2();
  OUTLINED_FUNCTION_6_2(&dword_215181000, v0, v1, "Received nil client in userDefaultsCheckIn!", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3_7();
}

- (void)userDefaultsCheckIn:effectiveUserIdentifier:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5_2();
  OUTLINED_FUNCTION_6_2(&dword_215181000, v0, v1, "Received invalid user identifier in userDefaultsCheckIn!", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3_7();
}

@end
