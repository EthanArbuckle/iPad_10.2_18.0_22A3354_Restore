@implementation ATSession

- (ATSession)init
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)ATSession;
  -[ATSession doesNotRecognizeSelector:](&v4, sel_doesNotRecognizeSelector_, a2);

  return 0;
}

- (ATSession)initWithSessionIdentifier:(id)a3 sessionTypeIdentifier:(id)a4
{
  id v6;
  id v7;
  ATSession *v8;
  uint64_t v9;
  void *sessionIdentifier;
  uint64_t v11;
  NSString *v12;
  uint64_t v13;
  NSString *sessionTypeIdentifier;
  uint64_t v15;
  NSMutableDictionary *sessionTasksByIdentifier;
  uint64_t v17;
  NSMutableArray *sessionTasks;
  uint64_t v19;
  NSMutableSet *observing;
  uint64_t v21;
  NSHashTable *observers;
  dispatch_queue_t v23;
  OS_dispatch_queue *queue;
  dispatch_queue_t v25;
  OS_dispatch_queue *callbackQueue;
  dispatch_group_t v27;
  OS_dispatch_group *group;
  id v29;
  objc_super v31;

  v6 = a3;
  v7 = a4;
  v31.receiver = self;
  v31.super_class = (Class)ATSession;
  v8 = -[ATSession init](&v31, sel_init);
  if (v8)
  {
    if (v6)
    {
      v9 = objc_msgSend(v6, "copy");
      sessionIdentifier = v8->_sessionIdentifier;
      v8->_sessionIdentifier = (NSString *)v9;
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD1880], "UUID");
      sessionIdentifier = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(sessionIdentifier, "UUIDString");
      v11 = objc_claimAutoreleasedReturnValue();
      v12 = v8->_sessionIdentifier;
      v8->_sessionIdentifier = (NSString *)v11;

    }
    v13 = objc_msgSend(v7, "copy");
    sessionTypeIdentifier = v8->_sessionTypeIdentifier;
    v8->_sessionTypeIdentifier = (NSString *)v13;

    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v15 = objc_claimAutoreleasedReturnValue();
    sessionTasksByIdentifier = v8->_sessionTasksByIdentifier;
    v8->_sessionTasksByIdentifier = (NSMutableDictionary *)v15;

    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v17 = objc_claimAutoreleasedReturnValue();
    sessionTasks = v8->_sessionTasks;
    v8->_sessionTasks = (NSMutableArray *)v17;

    objc_msgSend(MEMORY[0x24BDBCEF0], "set");
    v19 = objc_claimAutoreleasedReturnValue();
    observing = v8->_observing;
    v8->_observing = (NSMutableSet *)v19;

    objc_msgSend(MEMORY[0x24BDD15C0], "weakObjectsHashTable");
    v21 = objc_claimAutoreleasedReturnValue();
    observers = v8->_observers;
    v8->_observers = (NSHashTable *)v21;

    v23 = dispatch_queue_create("com.apple.AirTraffic.ATSession.accessQueue", 0);
    queue = v8->_queue;
    v8->_queue = (OS_dispatch_queue *)v23;

    v25 = dispatch_queue_create("com.apple.AirTraffic.ATSession.callbackQueue", 0);
    callbackQueue = v8->_callbackQueue;
    v8->_callbackQueue = (OS_dispatch_queue *)v25;

    v27 = dispatch_group_create();
    group = v8->_group;
    v8->_group = (OS_dispatch_group *)v27;

    if (__sessionHost)
    {
      v29 = (id)__allSessionsList;
      objc_sync_enter(v29);
      objc_msgSend((id)__allSessionsList, "addObject:", v8);
      objc_sync_exit(v29);

    }
  }

  return v8;
}

- (ATSession)initWithSessionTypeIdentifier:(id)a3
{
  return -[ATSession initWithSessionIdentifier:sessionTypeIdentifier:](self, "initWithSessionIdentifier:sessionTypeIdentifier:", 0, a3);
}

- (void)start
{
  NSObject *v3;
  NSObject *queue;
  _QWORD block[5];
  uint8_t buf[4];
  ATSession *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v3 = os_log_create("com.apple.amp.AirTraffic", "Framework");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v7 = self;
    _os_log_impl(&dword_20BB5D000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ Starting.", buf, 0xCu);
  }

  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __18__ATSession_start__block_invoke;
  block[3] = &unk_24C4CA300;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)cancel
{
  int v3;
  NSObject *v4;
  _BOOL4 v5;
  void *v6;
  NSObject *queue;
  void *v8;
  _QWORD block[5];
  uint8_t buf[4];
  ATSession *v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v3 = __sessionHost;
  v4 = os_log_create("com.apple.amp.AirTraffic", "Framework");
  v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v5)
    {
      -[ATSession error](self, "error");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v11 = self;
      v12 = 2114;
      v13 = v6;
      _os_log_impl(&dword_20BB5D000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ Cancelling. err=%{public}@", buf, 0x16u);

    }
    queue = self->_queue;
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __19__ATSession_cancel__block_invoke;
    block[3] = &unk_24C4CA300;
    block[4] = self;
    dispatch_async(queue, block);
  }
  else
  {
    if (v5)
    {
      *(_DWORD *)buf = 138543362;
      v11 = self;
      _os_log_impl(&dword_20BB5D000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ Cancelling remote session.", buf, 0xCu);
    }

    -[ATSession sessionIdentifier](self, "sessionIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    +[ATSession _cancelSessionWithIdentifier:](ATSession, "_cancelSessionWithIdentifier:", v8);

  }
}

- (BOOL)isSuspended
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
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __24__ATSession_isSuspended__block_invoke;
  v5[3] = &unk_24C4CA378;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)setSuspended:(BOOL)a3
{
  NSObject *queue;
  _QWORD v4[5];
  BOOL v5;

  queue = self->_queue;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __26__ATSession_setSuspended___block_invoke;
  v4[3] = &unk_24C4C9BF8;
  v4[4] = self;
  v5 = a3;
  dispatch_sync(queue, v4);
}

- (void)addSessionTasks:(id)a3
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
  block[2] = __29__ATSession_addSessionTasks___block_invoke;
  block[3] = &unk_24C4CA350;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(queue, block);

}

- (void)waitToFinish
{
  dispatch_group_wait((dispatch_group_t)self->_group, 0xFFFFFFFFFFFFFFFFLL);
}

- (id)sessionTasks
{
  return (id)-[NSMutableArray copy](self->_sessionTasks, "copy");
}

- (id)sessionTasksWithGroupingKey:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  id v7;
  _QWORD block[5];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__264;
  v16 = __Block_byref_object_dispose__265;
  v17 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __41__ATSession_sessionTasksWithGroupingKey___block_invoke;
  block[3] = &unk_24C4CA238;
  v10 = v4;
  v11 = &v12;
  block[4] = self;
  v6 = v4;
  dispatch_sync(queue, block);
  v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

- (void)addObserver:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __25__ATSession_addObserver___block_invoke;
  v7[3] = &unk_24C4CA350;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

- (void)removeObserver:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __28__ATSession_removeObserver___block_invoke;
  v7[3] = &unk_24C4CA350;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

- (double)duration
{
  double finishTime;

  if (-[ATSession isFinished](self, "isFinished"))
    finishTime = self->_finishTime;
  else
    finishTime = CFAbsoluteTimeGetCurrent();
  return finishTime - self->_startTime;
}

- (NSString)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = objc_opt_class();
  -[ATSession sessionIdentifier](self, "sessionIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATSession sessionTypeIdentifier](self, "sessionTypeIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATSession dataClass](self, "dataClass");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ %@ %@/%@: running=%d finished=%d cancelled=%d>"), v4, v5, v6, v7, -[ATSession isRunning](self, "isRunning"), -[ATSession isFinished](self, "isFinished"), -[ATSession isCancelled](self, "isCancelled"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v8;
}

- (NSString)debugDescription
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v3 = objc_alloc(MEMORY[0x24BDD16A8]);
  -[ATSession description](self, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithString:", v4);

  objc_msgSend(v5, "appendString:", CFSTR("\n"));
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  -[ATSession sessionTasks](self, "sessionTasks", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v15;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v15 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * v10);
        objc_msgSend(v5, "appendString:", CFSTR("  "));
        objc_msgSend(v11, "debugDescription");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "appendString:", v12);

        objc_msgSend(v5, "appendString:", CFSTR("\n"));
        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v8);
  }

  return (NSString *)v5;
}

- (ATSession)initWithCoder:(id)a3
{
  id v4;
  ATSession *v5;
  uint64_t v6;
  NSString *sessionIdentifier;
  uint64_t v8;
  NSString *sessionTypeIdentifier;
  uint64_t v10;
  NSString *dataClass;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  void *v21;
  NSMutableDictionary *sessionTasksByIdentifier;
  void *v23;
  uint64_t v24;
  NSString *localizedDescription;
  double v26;
  uint64_t v27;
  NSError *error;
  void *v29;
  uint64_t v30;
  NSXPCConnection *connection;
  void *v32;
  void *v33;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = -[ATSession initWithSessionTypeIdentifier:](self, "initWithSessionTypeIdentifier:", 0);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("sessionIdentifier"));
    v6 = objc_claimAutoreleasedReturnValue();
    sessionIdentifier = v5->_sessionIdentifier;
    v5->_sessionIdentifier = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("sessionTypeIdentifier"));
    v8 = objc_claimAutoreleasedReturnValue();
    sessionTypeIdentifier = v5->_sessionTypeIdentifier;
    v5->_sessionTypeIdentifier = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("dataClass"));
    v10 = objc_claimAutoreleasedReturnValue();
    dataClass = v5->_dataClass;
    v5->_dataClass = (NSString *)v10;

    v12 = (void *)MEMORY[0x24BDBCF20];
    v13 = objc_opt_class();
    objc_msgSend(v12, "setWithObjects:", v13, objc_opt_class(), 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v14, CFSTR("sessionTasks"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    v37 = 0u;
    v38 = 0u;
    v35 = 0u;
    v36 = 0u;
    v16 = v15;
    v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
    if (v17)
    {
      v18 = v17;
      v19 = *(_QWORD *)v36;
      do
      {
        for (i = 0; i != v18; ++i)
        {
          if (*(_QWORD *)v36 != v19)
            objc_enumerationMutation(v16);
          v21 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * i);
          -[NSMutableArray addObject:](v5->_sessionTasks, "addObject:", v21);
          if ((objc_msgSend(v21, "isFinished") & 1) == 0)
          {
            sessionTasksByIdentifier = v5->_sessionTasksByIdentifier;
            objc_msgSend(v21, "sessionTaskIdentifier");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSMutableDictionary setObject:forKeyedSubscript:](sessionTasksByIdentifier, "setObject:forKeyedSubscript:", v21, v23);

          }
        }
        v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
      }
      while (v18);
    }

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("localizedDescription"));
    v24 = objc_claimAutoreleasedReturnValue();
    localizedDescription = v5->_localizedDescription;
    v5->_localizedDescription = (NSString *)v24;

    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("progress"));
    v5->_progress = v26;
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("error"));
    v27 = objc_claimAutoreleasedReturnValue();
    error = v5->_error;
    v5->_error = (NSError *)v27;

    v5->_running = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("running"));
    v5->_cancelled = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("cancelled"));
    v5->_finished = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("finished"));
    dispatch_group_enter((dispatch_group_t)v5->_group);
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("endpoint"));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    if (v29)
    {
      v30 = objc_msgSend(objc_alloc(MEMORY[0x24BDD1988]), "initWithListenerEndpoint:", v29);
      connection = v5->_connection;
      v5->_connection = (NSXPCConnection *)v30;

      -[NSXPCConnection setExportedObject:](v5->_connection, "setExportedObject:", v5);
      objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_254736518);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSXPCConnection setExportedInterface:](v5->_connection, "setExportedInterface:", v32);

      objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_25473AC98);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSXPCConnection setRemoteObjectInterface:](v5->_connection, "setRemoteObjectInterface:", v33);

      -[NSXPCConnection resume](v5->_connection, "resume");
    }

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[ATSession sessionIdentifier](self, "sessionIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("sessionIdentifier"));

  -[ATSession sessionTypeIdentifier](self, "sessionTypeIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("sessionTypeIdentifier"));

  -[ATSession localizedDescription](self, "localizedDescription");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("localizedDescription"));

  -[ATSession dataClass](self, "dataClass");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("dataClass"));

  -[ATSession error](self, "error");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "msv_errorByRemovingUnsafeUserInfo");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v10, CFSTR("error"));

  -[ATSession progress](self, "progress");
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("progress"));
  objc_msgSend(v4, "encodeBool:forKey:", -[ATSession isRunning](self, "isRunning"), CFSTR("running"));
  objc_msgSend(v4, "encodeBool:forKey:", -[ATSession isFinished](self, "isFinished"), CFSTR("finished"));
  objc_msgSend(v4, "encodeBool:forKey:", -[ATSession isCancelled](self, "isCancelled"), CFSTR("cancelled"));
  v11 = (void *)objc_opt_new();
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  -[ATSession sessionTasks](self, "sessionTasks", 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v20;
    do
    {
      v16 = 0;
      do
      {
        if (*(_QWORD *)v20 != v15)
          objc_enumerationMutation(v12);
        objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * v16), "baseClassRepresentation");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "addObject:", v17);

        ++v16;
      }
      while (v14 != v16);
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v14);
  }

  objc_msgSend(v4, "encodeObject:forKey:", v11, CFSTR("sessionTasks"));
  -[ATSession endpoint](self, "endpoint");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v18, CFSTR("endpoint"));

}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v9;
  id v10;
  id v11;
  NSObject *queue;
  id v13;
  id v14;
  id v15;
  _QWORD v16[5];
  id v17;
  id v18;
  id v19;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  queue = self->_queue;
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __60__ATSession_observeValueForKeyPath_ofObject_change_context___block_invoke;
  v16[3] = &unk_24C4C9C20;
  v16[4] = self;
  v17 = v10;
  v18 = v9;
  v19 = v11;
  v13 = v11;
  v14 = v9;
  v15 = v10;
  dispatch_async(queue, v16);

}

- (void)beginSessionTask:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __30__ATSession_beginSessionTask___block_invoke;
  v7[3] = &unk_24C4CA350;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

- (void)updateSessionTask:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __31__ATSession_updateSessionTask___block_invoke;
  v7[3] = &unk_24C4CA350;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

- (id)_keysToObserve
{
  return &unk_24C4D1E28;
}

- (void)_observeKeysForTask:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[NSMutableSet addObject:](self->_observing, "addObject:", v4);
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  -[ATSession _keysToObserve](self, "_keysToObserve", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(v4, "addObserver:forKeyPath:options:context:", self, *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v9++), 1, 0);
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

}

- (void)_stopObservingKeysForTask:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (-[NSMutableSet containsObject:](self->_observing, "containsObject:", v4))
  {
    v12 = 0u;
    v13 = 0u;
    v10 = 0u;
    v11 = 0u;
    -[ATSession _keysToObserve](self, "_keysToObserve", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v11;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v11 != v8)
            objc_enumerationMutation(v5);
          objc_msgSend(v4, "removeObserver:forKeyPath:context:", self, *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v9++), 0);
        }
        while (v7 != v9);
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      }
      while (v7);
    }

    -[NSMutableSet removeObject:](self->_observing, "removeObject:", v4);
  }

}

- (void)_beginTasks:(id)a3
{
  uint64_t v4;
  __int128 v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  NSObject *v10;
  __int128 v11;
  id obj;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  uint8_t buf[4];
  ATSession *v18;
  __int16 v19;
  void *v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  obj = a3;
  v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v13, v21, 16);
  if (v4)
  {
    v6 = v4;
    v7 = *(_QWORD *)v14;
    *(_QWORD *)&v5 = 138543618;
    v11 = v5;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(obj);
        v9 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        -[ATSession _performSelectorOnObservers:object:object:](self, "_performSelectorOnObservers:object:object:", sel_session_willBeginSessionTask_, self, v9, v11);
        v10 = os_log_create("com.apple.amp.AirTraffic", "Framework");
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = v11;
          v18 = self;
          v19 = 2114;
          v20 = v9;
          _os_log_impl(&dword_20BB5D000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@ Starting %{public}@", buf, 0x16u);
        }

        objc_msgSend(v9, "_start");
        -[ATSession _performSelectorOnObservers:object:object:](self, "_performSelectorOnObservers:object:object:", sel_session_didBeginSessionTask_, self, v9);
      }
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v13, v21, 16);
    }
    while (v6);
  }

}

- (void)_performSelectorOnObservers:(SEL)a3 object:(id)a4
{
  id v6;
  NSHashTable *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *callbackQueue;
  _QWORD block[5];
  id v15;
  SEL v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v7 = self->_observers;
  v8 = -[NSHashTable countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v18;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v18 != v10)
          objc_enumerationMutation(v7);
        v12 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * v11);
        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          callbackQueue = self->_callbackQueue;
          block[0] = MEMORY[0x24BDAC760];
          block[1] = 3221225472;
          block[2] = __48__ATSession__performSelectorOnObservers_object___block_invoke;
          block[3] = &unk_24C4C9C48;
          block[4] = v12;
          v16 = a3;
          v15 = v6;
          dispatch_async(callbackQueue, block);

        }
        ++v11;
      }
      while (v9 != v11);
      v9 = -[NSHashTable countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v9);
  }

}

- (void)_performSelectorOnObservers:(SEL)a3 object:(id)a4 object:(id)a5
{
  id v8;
  id v9;
  NSHashTable *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  NSObject *callbackQueue;
  _QWORD v17[5];
  id v18;
  id v19;
  SEL v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v8 = a4;
  v9 = a5;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v10 = self->_observers;
  v11 = -[NSHashTable countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v22;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v22 != v13)
          objc_enumerationMutation(v10);
        v15 = *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * v14);
        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          callbackQueue = self->_callbackQueue;
          v17[0] = MEMORY[0x24BDAC760];
          v17[1] = 3221225472;
          v17[2] = __55__ATSession__performSelectorOnObservers_object_object___block_invoke;
          v17[3] = &unk_24C4C9C70;
          v17[4] = v15;
          v20 = a3;
          v18 = v8;
          v19 = v9;
          dispatch_async(callbackQueue, v17);

        }
        ++v14;
      }
      while (v12 != v14);
      v12 = -[NSHashTable countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v12);
  }

}

- (void)_finishWithError:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  int v7;
  ATSession *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = os_log_create("com.apple.amp.AirTraffic", "Framework");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 138543362;
    v8 = self;
    _os_log_impl(&dword_20BB5D000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ Finishing.", (uint8_t *)&v7, 0xCu);
  }

  -[ATSession setFinished:](self, "setFinished:", 1);
  -[ATSession setRunning:](self, "setRunning:", 0);
  -[ATSession setError:](self, "setError:", v4);
  self->_finishTime = CFAbsoluteTimeGetCurrent();
  if (__sessionHost)
  {
    v6 = (id)__allSessionsList;
    objc_sync_enter(v6);
    objc_msgSend((id)__allSessionsList, "removeObject:", self);
    objc_sync_exit(v6);

  }
  -[ATSession _performSelectorOnObservers:object:](self, "_performSelectorOnObservers:object:", sel_sessionDidFinish_, self);
  dispatch_group_leave((dispatch_group_t)self->_group);

}

- (NSString)sessionTypeIdentifier
{
  return self->_sessionTypeIdentifier;
}

- (void)setSessionTypeIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_sessionTypeIdentifier, a3);
}

- (NSString)sessionIdentifier
{
  return self->_sessionIdentifier;
}

- (void)setSessionIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_sessionIdentifier, a3);
}

- (NSString)localizedDescription
{
  return self->_localizedDescription;
}

- (void)setLocalizedDescription:(id)a3
{
  objc_storeStrong((id *)&self->_localizedDescription, a3);
}

- (NSString)dataClass
{
  return self->_dataClass;
}

- (void)setDataClass:(id)a3
{
  objc_storeStrong((id *)&self->_dataClass, a3);
}

- (double)progress
{
  return self->_progress;
}

- (void)setProgress:(double)a3
{
  self->_progress = a3;
}

- (BOOL)isFinished
{
  return self->_finished;
}

- (void)setFinished:(BOOL)a3
{
  self->_finished = a3;
}

- (BOOL)isRunning
{
  return self->_running;
}

- (void)setRunning:(BOOL)a3
{
  self->_running = a3;
}

- (BOOL)isCancelled
{
  return self->_cancelled;
}

- (void)setCancelled:(BOOL)a3
{
  self->_cancelled = a3;
}

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 136);
}

- (NSXPCListenerEndpoint)endpoint
{
  return self->_endpoint;
}

- (void)setEndpoint:(id)a3
{
  objc_storeStrong((id *)&self->_endpoint, a3);
}

- (ATMessageLink)messageLink
{
  return (ATMessageLink *)objc_loadWeakRetained((id *)&self->_messageLink);
}

- (void)setMessageLink:(id)a3
{
  objc_storeWeak((id *)&self->_messageLink, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_messageLink);
  objc_storeStrong((id *)&self->_endpoint, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_dataClass, 0);
  objc_storeStrong((id *)&self->_localizedDescription, 0);
  objc_storeStrong((id *)&self->_sessionIdentifier, 0);
  objc_storeStrong((id *)&self->_sessionTypeIdentifier, 0);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_group, 0);
  objc_storeStrong((id *)&self->_callbackQueue, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_observing, 0);
  objc_storeStrong((id *)&self->_sessionTasksByIdentifier, 0);
  objc_storeStrong((id *)&self->_sessionTasks, 0);
}

uint64_t __55__ATSession__performSelectorOnObservers_object_object___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "performSelector:withObject:withObject:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

uint64_t __48__ATSession__performSelectorOnObservers_object___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "performSelector:withObject:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 40));
}

void __31__ATSession_updateSessionTask___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  NSObject *obj;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _QWORD v31[2];
  _QWORD v32[2];
  uint8_t v33[128];
  uint8_t buf[4];
  uint64_t v35;
  __int16 v36;
  void *v37;
  uint64_t v38;

  v38 = *MEMORY[0x24BDAC8D0];
  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
  objc_msgSend(*(id *)(a1 + 40), "sessionTaskIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v29 = 0u;
    v30 = 0u;
    v27 = 0u;
    v28 = 0u;
    objc_msgSend(*(id *)(a1 + 32), "_keysToObserve");
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = -[NSObject countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v27, v33, 16);
    if (!v6)
      goto LABEL_25;
    v7 = v6;
    v26 = *(_QWORD *)v28;
    v25 = *MEMORY[0x24BDD0E70];
    obj = v5;
    v24 = *MEMORY[0x24BDD0E80];
    while (1)
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v28 != v26)
          objc_enumerationMutation(obj);
        v9 = *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * v8);
        objc_msgSend(*(id *)(a1 + 40), "valueForKey:", v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "valueForKey:", v9);
        v11 = objc_claimAutoreleasedReturnValue();
        v12 = (void *)v11;
        if (v10)
        {
          if ((objc_msgSend(v10, "isEqual:", v11) & 1) != 0)
            goto LABEL_17;
        }
        else if (!v11)
        {
          goto LABEL_17;
        }
        objc_msgSend(v4, "setValue:forKey:", v10, v9);
        v13 = *(void **)(a1 + 32);
        v14 = *(_QWORD *)(a1 + 40);
        v15 = v10;
        v31[0] = v25;
        if (!v10)
        {
          objc_msgSend(MEMORY[0x24BDBCEF8], "null");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = v22;
        }
        v32[0] = v15;
        v31[1] = v24;
        v16 = v12;
        if (!v12)
        {
          objc_msgSend(MEMORY[0x24BDBCEF8], "null");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = v21;
        }
        v32[1] = v16;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v32, v31, 2, v21);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "observeValueForKeyPath:ofObject:change:context:", v9, v14, v17, 0);

        if (v12)
        {
          if (v10)
            goto LABEL_17;
        }
        else
        {

          if (v10)
            goto LABEL_17;
        }

LABEL_17:
        ++v8;
      }
      while (v7 != v8);
      v5 = obj;
      v18 = -[NSObject countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v27, v33, 16);
      v7 = v18;
      if (!v18)
        goto LABEL_25;
    }
  }
  v5 = os_log_create("com.apple.amp.AirTraffic", "Framework");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v19 = *(_QWORD *)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 40), "sessionTaskIdentifier");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v35 = v19;
    v36 = 2114;
    v37 = v20;
    _os_log_impl(&dword_20BB5D000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ Cannot update unknown session task with identifier %{public}@", buf, 0x16u);

  }
LABEL_25:

}

void __30__ATSession_beginSessionTask___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
  objc_msgSend(*(id *)(a1 + 40), "sessionTaskIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", v3);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    v6 = *(id *)(a1 + 40);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "addObject:", v6);
    v4 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
    objc_msgSend(v6, "sessionTaskIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v6, v5);

    objc_msgSend(v6, "setSession:", *(_QWORD *)(a1 + 32));
  }
  objc_msgSend(*(id *)(a1 + 32), "_performSelectorOnObservers:object:object:", sel_session_willBeginSessionTask_, *(_QWORD *)(a1 + 32), v6);
  objc_msgSend(v6, "setRunning:", 1);

}

void __60__ATSession_observeValueForKeyPath_ofObject_change_context___block_invoke(id *a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  int v6;
  double v7;
  NSObject *v8;
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  int v16;
  id v17;
  __int16 v18;
  id v19;
  __int16 v20;
  uint64_t v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)*((_QWORD *)a1[4] + 2);
  objc_msgSend(a1[5], "sessionTaskIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    if (objc_msgSend(a1[6], "isEqualToString:", CFSTR("finished"))
      && (objc_msgSend(a1[7], "objectForKey:", *MEMORY[0x24BDD0E70]),
          v5 = (void *)objc_claimAutoreleasedReturnValue(),
          v6 = objc_msgSend(v5, "BOOLValue"),
          v5,
          v6))
    {
      objc_msgSend(a1[5], "finishTime");
      if (v7 <= 0.0)
        objc_msgSend(MEMORY[0x24BDBCE60], "timeIntervalSinceReferenceDate");
      else
        objc_msgSend(a1[5], "finishTime");
      objc_msgSend(a1[5], "setFinishTime:");
      v8 = os_log_create("com.apple.amp.AirTraffic", "Framework");
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        v10 = a1[4];
        v9 = a1[5];
        objc_msgSend(v9, "duration");
        v16 = 138543874;
        v17 = v10;
        v18 = 2114;
        v19 = v9;
        v20 = 2048;
        v21 = v11;
        _os_log_impl(&dword_20BB5D000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ Finished task %{public}@ in %.2f seconds", (uint8_t *)&v16, 0x20u);
      }

      v12 = (void *)*((_QWORD *)a1[4] + 2);
      objc_msgSend(a1[5], "sessionTaskIdentifier");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "removeObjectForKey:", v13);

      objc_msgSend(a1[4], "_performSelectorOnObservers:object:object:", sel_session_didFinishSessionTask_, a1[4], a1[5]);
      objc_msgSend(a1[4], "_stopObservingKeysForTask:", a1[5]);
      objc_msgSend(a1[5], "setRunning:", 0);
      if (!objc_msgSend(*((id *)a1[4] + 2), "count"))
      {
        v14 = a1[4];
        if ((objc_msgSend(v14, "isCancelled") & 1) != 0)
        {
          objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("ATError"), 2, 0);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "_finishWithError:", v15);

        }
        else
        {
          objc_msgSend(v14, "_finishWithError:", 0);
        }
      }
    }
    else
    {
      objc_msgSend(a1[4], "_performSelectorOnObservers:object:object:", sel_session_didUpdateSessionTask_, a1[4], a1[5]);
    }
  }
}

uint64_t __28__ATSession_removeObserver___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "removeObject:", *(_QWORD *)(a1 + 40));
}

void __25__ATSession_addObserver___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "addObject:", *(_QWORD *)(a1 + 40));
  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 64);
  if (v2)
  {
    objc_msgSend(v2, "remoteObjectProxy");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "connect");

  }
}

void __41__ATSession_sessionTasksWithGroupingKey___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  int v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(*(id *)(a1[4] + 8), "count"));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1[6] + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v5 = *(id *)(a1[4] + 8);
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        objc_msgSend(v10, "sessionGroupingKey", (_QWORD)v13);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "isEqualToString:", a1[5]);

        if (v12)
          objc_msgSend(*(id *)(*(_QWORD *)(a1[6] + 8) + 40), "addObject:", v10);
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v7);
  }

}

void __29__ATSession_addSessionTasks___block_invoke(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  uint64_t v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  NSObject *v14;
  _QWORD v15[5];
  id v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  uint8_t buf[4];
  uint64_t v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v2 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(v2 + 89) || *(_BYTE *)(v2 + 91))
  {
    v3 = os_log_create("com.apple.amp.AirTraffic", "Framework");
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      v4 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138543362;
      v22 = v4;
      _os_log_impl(&dword_20BB5D000, v3, OS_LOG_TYPE_ERROR, "%{public}@ Can't add tasks to a completed session - ignoring", buf, 0xCu);
    }

  }
  else
  {
    v19 = 0u;
    v20 = 0u;
    v17 = 0u;
    v18 = 0u;
    v5 = *(id *)(a1 + 40);
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v17, v23, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v18;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v18 != v8)
            objc_enumerationMutation(v5);
          v10 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
          objc_msgSend(*(id *)(a1 + 32), "_observeKeysForTask:", v10);
          v11 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
          objc_msgSend(v10, "sessionTaskIdentifier");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "setObject:forKeyedSubscript:", v10, v12);

          objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "addObject:", v10);
          objc_msgSend(v10, "setSession:", *(_QWORD *)(a1 + 32));
        }
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v17, v23, 16);
      }
      while (v7);
    }

    v13 = *(_QWORD *)(a1 + 32);
    if (*(_BYTE *)(v13 + 90) && !*(_BYTE *)(v13 + 88))
    {
      v14 = *(NSObject **)(v13 + 40);
      v15[0] = MEMORY[0x24BDAC760];
      v15[1] = 3221225472;
      v15[2] = __29__ATSession_addSessionTasks___block_invoke_2;
      v15[3] = &unk_24C4CA350;
      v15[4] = v13;
      v16 = *(id *)(a1 + 40);
      dispatch_async(v14, v15);

    }
  }
}

uint64_t __29__ATSession_addSessionTasks___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_beginTasks:", *(_QWORD *)(a1 + 40));
}

void __26__ATSession_setSuspended___block_invoke(uint64_t a1)
{
  int v2;
  NSObject *v3;
  _BOOL4 v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  _QWORD block[5];
  uint8_t buf[4];
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 88) = *(_BYTE *)(a1 + 40);
  v2 = *(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 88);
  v3 = os_log_create("com.apple.amp.AirTraffic", "Framework");
  v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);
  if (v2)
  {
    if (v4)
    {
      v5 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138543362;
      v11 = v5;
      _os_log_impl(&dword_20BB5D000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ Suspending.", buf, 0xCu);
    }

  }
  else
  {
    if (v4)
    {
      v6 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138543362;
      v11 = v6;
      _os_log_impl(&dword_20BB5D000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ Resuming.", buf, 0xCu);
    }

    v7 = *(_QWORD *)(a1 + 32);
    v8 = *(NSObject **)(v7 + 40);
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __26__ATSession_setSuspended___block_invoke_22;
    block[3] = &unk_24C4CA300;
    block[4] = v7;
    dispatch_async(v8, block);
  }
}

void __26__ATSession_setSuspended___block_invoke_22(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v3 = *(id *)(*(_QWORD *)(a1 + 32) + 8);
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v10;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v9 + 1) + 8 * i);
        if ((objc_msgSend(v8, "isRunning", (_QWORD)v9) & 1) == 0
          && (objc_msgSend(v8, "isFinished") & 1) == 0
          && (objc_msgSend(v8, "isCancelled") & 1) == 0)
        {
          objc_msgSend(v2, "addObject:", v8);
        }
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v5);
  }

  objc_msgSend(*(id *)(a1 + 32), "_beginTasks:", v2);
}

uint64_t __24__ATSession_isSuspended__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(result + 32) + 88);
  return result;
}

void __19__ATSession_cancel__block_invoke(uint64_t a1)
{
  _BYTE *v2;
  id v3;
  uint64_t v4;
  __int128 v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  NSObject *v10;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  uint8_t buf[4];
  uint64_t v18;
  __int16 v19;
  void *v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v2 = *(_BYTE **)(a1 + 32);
  if (!v2[91])
  {
    objc_msgSend(v2, "setCancelled:", 1);
    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    v3 = *(id *)(*(_QWORD *)(a1 + 32) + 8);
    v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v13, v21, 16);
    if (v4)
    {
      v6 = v4;
      v7 = *(_QWORD *)v14;
      *(_QWORD *)&v5 = 138543618;
      v12 = v5;
      do
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v14 != v7)
            objc_enumerationMutation(v3);
          v9 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
          if ((objc_msgSend(v9, "isFinished", v12, (_QWORD)v13) & 1) == 0 && (objc_msgSend(v9, "isCancelled") & 1) == 0)
          {
            v10 = os_log_create("com.apple.amp.AirTraffic", "Framework");
            if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
            {
              v11 = *(_QWORD *)(a1 + 32);
              *(_DWORD *)buf = v12;
              v18 = v11;
              v19 = 2114;
              v20 = v9;
              _os_log_impl(&dword_20BB5D000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@ Cancelling %{public}@", buf, 0x16u);
            }

            objc_msgSend(v9, "cancel");
          }
        }
        v6 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v13, v21, 16);
      }
      while (v6);
    }

  }
}

_BYTE *__18__ATSession_start__block_invoke(uint64_t a1)
{
  _BYTE *result;
  uint64_t v3;
  void *v4;

  result = *(_BYTE **)(a1 + 32);
  if (!result[90])
  {
    objc_msgSend(result, "setRunning:", 1);
    *(CFAbsoluteTime *)(*(_QWORD *)(a1 + 32) + 72) = CFAbsoluteTimeGetCurrent();
    dispatch_group_enter(*(dispatch_group_t *)(*(_QWORD *)(a1 + 32) + 56));
    v3 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "count");
    v4 = *(void **)(a1 + 32);
    if (v3)
    {
      objc_msgSend(v4, "_performSelectorOnObservers:object:", sel_sessionWillBegin_, *(_QWORD *)(a1 + 32));
      return (_BYTE *)objc_msgSend(*(id *)(a1 + 32), "_beginTasks:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8));
    }
    else
    {
      return (_BYTE *)objc_msgSend(v4, "_finishWithError:", 0);
    }
  }
  return result;
}

+ (void)initialize
{
  uint64_t v2;
  void *v3;
  const char *v4;
  NSObject *v5;

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)__allSessionsList;
  __allSessionsList = v2;

  v4 = (const char *)objc_msgSend(CFSTR("ATSessionsDidChangeNotification"), "UTF8String");
  dispatch_get_global_queue(0, 0);
  v5 = objc_claimAutoreleasedReturnValue();
  notify_register_dispatch(v4, &__dispatchToken, v5, &__block_literal_global_293);

}

+ (void)setSessionHost:(BOOL)a3
{
  __sessionHost = a3;
}

+ (id)allSessions
{
  id v2;
  id v3;

  if (__sessionHost)
  {
    v2 = (id)__allSessionsList;
    objc_sync_enter(v2);
    v3 = (id)__allSessionsList;
    objc_sync_exit(v2);

  }
  else
  {
    objc_msgSend(a1, "_remoteSessionsWithTypeIdentifier:", 0);
    v3 = (id)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

+ (id)sessionsWithSessionTypeIdentifier:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  uint64_t v15;
  NSObject *v16;
  uint64_t v17;
  NSObject *v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  uint8_t buf[4];
  uint64_t v25;
  __int16 v26;
  id v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (void *)objc_opt_new();
  if (__sessionHost)
  {
    v6 = (id)__allSessionsList;
    objc_sync_enter(v6);
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    v7 = (id)__allSessionsList;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
    if (v8)
    {
      v9 = *(_QWORD *)v21;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v21 != v9)
            objc_enumerationMutation(v7);
          v11 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
          objc_msgSend(v11, "sessionTypeIdentifier", (_QWORD)v20);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = objc_msgSend(v12, "isEqualToString:", v4);

          if (v13)
            objc_msgSend(v5, "addObject:", v11);
        }
        v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
      }
      while (v8);
    }

    objc_sync_exit(v6);
  }
  else
  {
    objc_msgSend(a1, "_remoteSessionsWithTypeIdentifier:", v4);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "copy");

    v5 = (void *)v15;
  }
  v16 = os_log_create("com.apple.amp.AirTraffic", "Framework");
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    v17 = objc_msgSend(v5, "count");
    *(_DWORD *)buf = 134218242;
    v25 = v17;
    v26 = 2114;
    v27 = v4;
    _os_log_impl(&dword_20BB5D000, v16, OS_LOG_TYPE_DEFAULT, "Found %lu sessions for identifier %{public}@", buf, 0x16u);
  }

  v18 = os_log_create("com.apple.amp.AirTraffic", "Framework_Oversize");
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v25 = (uint64_t)v5;
    _os_log_impl(&dword_20BB5D000, v18, OS_LOG_TYPE_DEFAULT, "sessions %{public}@:", buf, 0xCu);
  }

  return v5;
}

+ (id)sessionsWithSessionTypeIdentifier:(id)a3 dataClass:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  int v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  v7 = (void *)objc_opt_new();
  +[ATSession sessionsWithSessionTypeIdentifier:](ATSession, "sessionsWithSessionTypeIdentifier:", v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v18;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v18 != v11)
          objc_enumerationMutation(v8);
        v13 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * v12);
        if (!v6
          || (objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * v12), "dataClass"),
              v14 = (void *)objc_claimAutoreleasedReturnValue(),
              v15 = objc_msgSend(v14, "isEqualToString:", v6),
              v14,
              v15))
        {
          objc_msgSend(v7, "addObject:", v13);
        }
        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v10);
  }

  return v7;
}

+ (unint64_t)activeSessionCountWithSessionTypeIdentifier:(id)a3
{
  id v4;
  id v5;
  id v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  int v13;
  NSObject *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  uint8_t buf[4];
  unint64_t v21;
  __int16 v22;
  id v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (__sessionHost)
  {
    v5 = (id)__allSessionsList;
    objc_sync_enter(v5);
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v6 = (id)__allSessionsList;
    v7 = 0;
    v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
    if (v8)
    {
      v9 = *(_QWORD *)v17;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v17 != v9)
            objc_enumerationMutation(v6);
          v11 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
          objc_msgSend(v11, "sessionTypeIdentifier", (_QWORD)v16);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = objc_msgSend(v12, "isEqualToString:", v4);

          if (v13 && (objc_msgSend(v11, "isCancelled") & 1) == 0)
            v7 += objc_msgSend(v11, "isFinished") ^ 1;
        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
      }
      while (v8);
    }

    objc_sync_exit(v5);
  }
  else
  {
    v7 = objc_msgSend(a1, "_remoteActiveSessionCountWithTypeIdentifier:", v4);
  }
  v14 = os_log_create("com.apple.amp.AirTraffic", "Framework");
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218242;
    v21 = v7;
    v22 = 2114;
    v23 = v4;
    _os_log_impl(&dword_20BB5D000, v14, OS_LOG_TYPE_DEFAULT, "Found %lu active sessions for identifier %{public}@", buf, 0x16u);
  }

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)_remoteSessionsWithTypeIdentifier:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  NSObject *v10;
  void *v11;
  NSObject *v12;
  NSObject *v13;
  id v14;
  uint8_t buf[16];
  _QWORD v17[4];
  NSObject *v18;
  uint64_t *v19;
  _QWORD v20[4];
  NSObject *v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;
  _QWORD v28[5];
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  char v32;

  v3 = a3;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1988]), "initWithMachServiceName:options:", CFSTR("com.apple.atc.xpc.sessions"), 0);
  objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_25473AD68);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x24BDBCF20];
  v7 = objc_opt_class();
  objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setClasses:forSelector:argumentIndex:ofReply:", v8, sel_fetchSessionsWithTypeIdentifier_completion_, 0, 1);

  objc_msgSend(v4, "setRemoteObjectInterface:", v5);
  v29 = 0;
  v30 = &v29;
  v31 = 0x2020000000;
  v9 = MEMORY[0x24BDAC760];
  v32 = 1;
  v28[0] = MEMORY[0x24BDAC760];
  v28[1] = 3221225472;
  v28[2] = __47__ATSession__remoteSessionsWithTypeIdentifier___block_invoke;
  v28[3] = &unk_24C4C9C98;
  v28[4] = &v29;
  objc_msgSend(v4, "setInvalidationHandler:", v28);
  objc_msgSend(v4, "resume");
  v22 = 0;
  v23 = &v22;
  v24 = 0x3032000000;
  v25 = __Block_byref_object_copy__264;
  v26 = __Block_byref_object_dispose__265;
  v27 = 0;
  v20[0] = v9;
  v20[1] = 3221225472;
  v20[2] = __47__ATSession__remoteSessionsWithTypeIdentifier___block_invoke_2;
  v20[3] = &unk_24C4C9EE0;
  v10 = dispatch_semaphore_create(0);
  v21 = v10;
  objc_msgSend(v4, "remoteObjectProxyWithErrorHandler:", v20);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v9;
  v17[1] = 3221225472;
  v17[2] = __47__ATSession__remoteSessionsWithTypeIdentifier___block_invoke_145;
  v17[3] = &unk_24C4C9D28;
  v19 = &v22;
  v12 = v10;
  v18 = v12;
  objc_msgSend(v11, "fetchSessionsWithTypeIdentifier:completion:", v3, v17);

  dispatch_semaphore_wait(v12, 0xFFFFFFFFFFFFFFFFLL);
  if (*((_BYTE *)v30 + 24))
  {
    objc_msgSend(v4, "invalidate");
    v13 = os_log_create("com.apple.amp.AirTraffic", "Framework");
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_20BB5D000, v13, OS_LOG_TYPE_DEFAULT, "XPC Connection was still valid - invalidating", buf, 2u);
    }

  }
  v14 = (id)v23[5];

  _Block_object_dispose(&v22, 8);
  _Block_object_dispose(&v29, 8);

  return v14;
}

+ (void)_cancelSessionWithIdentifier:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  NSObject *v10;
  NSObject *v11;
  void *v12;
  NSObject *v13;
  NSObject *v14;
  _QWORD v15[4];
  NSObject *v16;
  _QWORD v17[4];
  NSObject *v18;
  _QWORD v19[5];
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  char v23;
  uint8_t buf[4];
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1988]), "initWithMachServiceName:options:", CFSTR("com.apple.atc.xpc.sessions"), 0);
  objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_25473AD68);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x24BDBCF20];
  v7 = objc_opt_class();
  objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setClasses:forSelector:argumentIndex:ofReply:", v8, sel_fetchSessionsWithTypeIdentifier_completion_, 0, 1);

  objc_msgSend(v4, "setRemoteObjectInterface:", v5);
  objc_msgSend(v4, "resume");
  v20 = 0;
  v21 = &v20;
  v22 = 0x2020000000;
  v9 = MEMORY[0x24BDAC760];
  v23 = 1;
  v19[0] = MEMORY[0x24BDAC760];
  v19[1] = 3221225472;
  v19[2] = __42__ATSession__cancelSessionWithIdentifier___block_invoke;
  v19[3] = &unk_24C4C9C98;
  v19[4] = &v20;
  objc_msgSend(v4, "setInvalidationHandler:", v19);
  v10 = os_log_create("com.apple.amp.AirTraffic", "Framework");
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v25 = v3;
    _os_log_impl(&dword_20BB5D000, v10, OS_LOG_TYPE_DEFAULT, "cancelling session. id=%{public}@", buf, 0xCu);
  }

  v17[0] = v9;
  v17[1] = 3221225472;
  v17[2] = __42__ATSession__cancelSessionWithIdentifier___block_invoke_147;
  v17[3] = &unk_24C4C9EE0;
  v11 = dispatch_semaphore_create(0);
  v18 = v11;
  objc_msgSend(v4, "remoteObjectProxyWithErrorHandler:", v17);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v9;
  v15[1] = 3221225472;
  v15[2] = __42__ATSession__cancelSessionWithIdentifier___block_invoke_148;
  v15[3] = &unk_24C4C9EE0;
  v13 = v11;
  v16 = v13;
  objc_msgSend(v12, "cancelSessionWithIdentifier:completion:", v3, v15);

  dispatch_semaphore_wait(v13, 0xFFFFFFFFFFFFFFFFLL);
  if (*((_BYTE *)v21 + 24))
  {
    objc_msgSend(v4, "invalidate");
    v14 = os_log_create("com.apple.amp.AirTraffic", "Framework");
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_20BB5D000, v14, OS_LOG_TYPE_DEFAULT, "XPC Connection was still valid - invalidating", buf, 2u);
    }

  }
  _Block_object_dispose(&v20, 8);

}

+ (unint64_t)_remoteActiveSessionCountWithTypeIdentifier:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  dispatch_semaphore_t v7;
  id v8;
  NSObject *v9;
  void *v10;
  NSObject *v11;
  NSObject *v12;
  unint64_t v13;
  __int16 v15;
  _QWORD v16[4];
  NSObject *v17;
  uint64_t *v18;
  _QWORD v19[4];
  id v20;
  NSObject *v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t v25;
  _QWORD v26[5];
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  char v30;

  v3 = a3;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1988]), "initWithMachServiceName:options:", CFSTR("com.apple.atc.xpc.sessions"), 0);
  objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_25473AD68);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setRemoteObjectInterface:", v5);
  v27 = 0;
  v28 = &v27;
  v29 = 0x2020000000;
  v6 = MEMORY[0x24BDAC760];
  v30 = 1;
  v26[0] = MEMORY[0x24BDAC760];
  v26[1] = 3221225472;
  v26[2] = __57__ATSession__remoteActiveSessionCountWithTypeIdentifier___block_invoke;
  v26[3] = &unk_24C4C9C98;
  v26[4] = &v27;
  objc_msgSend(v4, "setInvalidationHandler:", v26);
  objc_msgSend(v4, "resume");
  v22 = 0;
  v23 = &v22;
  v24 = 0x2020000000;
  v25 = 0;
  v7 = dispatch_semaphore_create(0);
  v19[0] = v6;
  v19[1] = 3221225472;
  v19[2] = __57__ATSession__remoteActiveSessionCountWithTypeIdentifier___block_invoke_2;
  v19[3] = &unk_24C4C9DC0;
  v8 = v3;
  v20 = v8;
  v9 = v7;
  v21 = v9;
  objc_msgSend(v4, "remoteObjectProxyWithErrorHandler:", v19);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v6;
  v16[1] = 3221225472;
  v16[2] = __57__ATSession__remoteActiveSessionCountWithTypeIdentifier___block_invoke_149;
  v16[3] = &unk_24C4C9CC0;
  v18 = &v22;
  v11 = v9;
  v17 = v11;
  objc_msgSend(v10, "fetchActiveSessionCountForSessionTypeIdentifier:completion:", v8, v16);

  dispatch_semaphore_wait(v11, 0xFFFFFFFFFFFFFFFFLL);
  if (*((_BYTE *)v28 + 24))
  {
    objc_msgSend(v4, "invalidate");
    v12 = os_log_create("com.apple.amp.AirTraffic", "Framework");
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v15 = 0;
      _os_log_impl(&dword_20BB5D000, v12, OS_LOG_TYPE_DEFAULT, "XPC Connection was still valid - invalidating", (uint8_t *)&v15, 2u);
    }

  }
  v13 = v23[3];

  _Block_object_dispose(&v22, 8);
  _Block_object_dispose(&v27, 8);

  return v13;
}

uint64_t __57__ATSession__remoteActiveSessionCountWithTypeIdentifier___block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = 0;
  return result;
}

void __57__ATSession__remoteActiveSessionCountWithTypeIdentifier___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = os_log_create("com.apple.amp.AirTraffic", "Framework");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    v5 = *(_QWORD *)(a1 + 32);
    v6 = 138543618;
    v7 = v5;
    v8 = 2114;
    v9 = v3;
    _os_log_impl(&dword_20BB5D000, v4, OS_LOG_TYPE_ERROR, "Failed to fetch count of active sessions of type %{public}@ error:%{public}@", (uint8_t *)&v6, 0x16u);
  }

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

intptr_t __57__ATSession__remoteActiveSessionCountWithTypeIdentifier___block_invoke_149(uint64_t a1, uint64_t a2)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a2;
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

uint64_t __42__ATSession__cancelSessionWithIdentifier___block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = 0;
  return result;
}

void __42__ATSession__cancelSessionWithIdentifier___block_invoke_147(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  int v5;
  id v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = os_log_create("com.apple.amp.AirTraffic", "Framework");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    v5 = 138543362;
    v6 = v3;
    _os_log_impl(&dword_20BB5D000, v4, OS_LOG_TYPE_ERROR, "Failed to cancel session. error=%{public}@", (uint8_t *)&v5, 0xCu);
  }

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __42__ATSession__cancelSessionWithIdentifier___block_invoke_148(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  int v5;
  id v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if (v3)
  {
    v4 = os_log_create("com.apple.amp.AirTraffic", "Framework");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v5 = 138543362;
      v6 = v3;
      _os_log_impl(&dword_20BB5D000, v4, OS_LOG_TYPE_ERROR, "Failed to cancel session. error=%{public}@", (uint8_t *)&v5, 0xCu);
    }

  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

uint64_t __47__ATSession__remoteSessionsWithTypeIdentifier___block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = 0;
  return result;
}

void __47__ATSession__remoteSessionsWithTypeIdentifier___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  int v5;
  id v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = os_log_create("com.apple.amp.AirTraffic", "Framework");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    v5 = 138543362;
    v6 = v3;
    _os_log_impl(&dword_20BB5D000, v4, OS_LOG_TYPE_ERROR, "Failed to fetch sessions: %{public}@", (uint8_t *)&v5, 0xCu);
  }

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __47__ATSession__remoteSessionsWithTypeIdentifier___block_invoke_145(uint64_t a1, void *a2, void *a3)
{
  id v6;
  id v7;
  NSObject *v8;
  int v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v6 = a2;
  v7 = a3;
  if (v6)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  }
  else
  {
    v8 = os_log_create("com.apple.amp.AirTraffic", "Framework");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9 = 138543362;
      v10 = v7;
      _os_log_impl(&dword_20BB5D000, v8, OS_LOG_TYPE_DEFAULT, "Failed to fetch sessions: %{public}@", (uint8_t *)&v9, 0xCu);
    }

  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

void __23__ATSession_initialize__block_invoke()
{
  __CFNotificationCenter *LocalCenter;

  LocalCenter = CFNotificationCenterGetLocalCenter();
  CFNotificationCenterPostNotification(LocalCenter, CFSTR("ATSessionsDidChangeNotification"), 0, 0, 1u);
}

@end
