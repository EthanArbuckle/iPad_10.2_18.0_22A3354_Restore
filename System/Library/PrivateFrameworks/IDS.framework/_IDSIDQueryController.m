@implementation _IDSIDQueryController

- (void)addDelegate:(id)a3 forService:(id)a4 listenerID:(id)a5 queue:(id)a6
{
  NSString *v10;
  id v11;
  id v12;
  id v13;
  NSObject *v14;
  NSMutableDictionary *listeners;
  NSMutableDictionary *Mutable;
  NSMutableDictionary *v17;
  void *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  void *v30;
  NSObject *v31;
  NSString *v32;
  void *v33;
  NSString *listenerGUID;
  void *v35;
  NSObject *v36;
  NSString *v37;
  void *v38;
  uint8_t buf[4];
  NSString *v40;
  __int16 v41;
  id v42;
  __int16 v43;
  id v44;
  __int16 v45;
  id v46;
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v10 = (NSString *)a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  +[IDSLogging IDQuery](IDSLogging, "IDQuery");
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218754;
    v40 = v10;
    v41 = 2112;
    v42 = v11;
    v43 = 2112;
    v44 = v12;
    v45 = 2048;
    v46 = v13;
    _os_log_impl(&dword_1906E0000, v14, OS_LOG_TYPE_DEFAULT, "addDelegate:forService:listenerID:queue:  (delegate: %p)   (service: %@)   (listenerID: %@)   (queue: %p)", buf, 0x2Au);
  }

  if (v10 && v13 && objc_msgSend(v11, "length") && objc_msgSend(v12, "length"))
  {
    listeners = self->_listeners;
    if (!listeners)
    {
      Mutable = (NSMutableDictionary *)CFDictionaryCreateMutable(0, 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
      v17 = self->_listeners;
      self->_listeners = Mutable;

      listeners = self->_listeners;
    }
    -[NSMutableDictionary objectForKey:](listeners, "objectForKey:", v12);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = (void *)objc_msgSend(v18, "mutableCopy");
    v20 = v19;
    if (v19)
      v21 = v19;
    else
      v21 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v22 = v21;

    -[NSObject objectForKey:](v22, "objectForKey:", v11);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = v23;
    if (v23)
    {
      v25 = v23;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3748], "weakToStrongObjectsMapTable");
      v25 = (id)objc_claimAutoreleasedReturnValue();
    }
    v26 = v25;

    objc_msgSend(v26, "objectForKey:", v10);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = v27;
    if (v27)
      v29 = v27;
    else
      v29 = objc_alloc_init(MEMORY[0x1E0D34D00]);
    v30 = v29;

    objc_msgSend(v30, "setQueue:", v13);
    objc_msgSend(v26, "setObject:forKey:", v30, v10);
    -[NSObject setObject:forKey:](v22, "setObject:forKey:", v26, v11);
    -[NSMutableDictionary setObject:forKey:](self->_listeners, "setObject:forKey:", v22, v12);
    +[IDSLogging IDQuery](IDSLogging, "IDQuery");
    v31 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
    {
      -[NSMutableDictionary allKeys](self->_listeners, "allKeys");
      v32 = (NSString *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v40 = v32;
      _os_log_impl(&dword_1906E0000, v31, OS_LOG_TYPE_DEFAULT, "Listeners after ADD %@", buf, 0xCu);

    }
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      v38 = v30;
      +[IDSDaemonController sharedInstance](IDSDaemonController, "sharedInstance");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      listenerGUID = self->_listenerGUID;
      objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v11);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "addListenerID:services:", listenerGUID, v35);

      +[IDSLogging IDQuery](IDSLogging, "IDQuery");
      v36 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
      {
        v37 = self->_listenerGUID;
        *(_DWORD *)buf = 138412290;
        v40 = v37;
        _os_log_impl(&dword_1906E0000, v36, OS_LOG_TYPE_DEFAULT, "Adding listener for KT Peer Verification Results notification: %@", buf, 0xCu);
      }

      v30 = v38;
    }

  }
  else
  {
    +[IDSLogging IDQuery](IDSLogging, "IDQuery");
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1906E0000, v22, OS_LOG_TYPE_DEFAULT, "Invalid add delegate params -- bailing...", buf, 2u);
    }
  }

}

- (void)daemonDisconnected
{
  MEMORY[0x1E0DE7D20](self, sel__purgeIDStatusCache);
}

- (_IDSIDQueryController)init
{
  _IDSIDQueryController *v2;
  _IDSIDQueryController *v3;
  OS_xpc_object *connection;
  id delegateContext;
  NSString *serviceToken;
  NSMutableDictionary *listenerIDToServicesMap;
  NSMapTable *delegateToInfo;
  NSObject *v9;
  dispatch_queue_t v10;
  OS_dispatch_queue *connectionQueue;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)_IDSIDQueryController;
  v2 = -[_IDSIDQueryController init](&v13, sel_init);
  v3 = v2;
  if (v2)
  {
    connection = v2->_connection;
    v2->_connection = 0;

    delegateContext = v3->_delegateContext;
    v3->_delegateContext = 0;

    serviceToken = v3->_serviceToken;
    v3->_serviceToken = 0;

    listenerIDToServicesMap = v3->_listenerIDToServicesMap;
    v3->_listenerIDToServicesMap = 0;

    delegateToInfo = v3->_delegateToInfo;
    v3->_delegateToInfo = 0;

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = dispatch_queue_create("_IDSIDQueryControllerConnectionQueue", v9);
    connectionQueue = v3->_connectionQueue;
    v3->_connectionQueue = (OS_dispatch_queue *)v10;

  }
  return v3;
}

- (_IDSIDQueryController)initWithDelegateContext:(id)a3 queueController:(id)a4
{
  id v5;
  _IDSIDQueryController *v6;
  uint64_t v7;
  id delegateContext;
  OS_xpc_object *connection;
  uint64_t v10;
  OS_dispatch_queue *queue;
  NSObject *v12;
  dispatch_queue_t v13;
  OS_dispatch_queue *v14;
  uint64_t v15;
  NSString *serviceToken;
  uint64_t v17;
  NSString *listenerGUID;
  void *v19;
  void *v20;

  v5 = a4;
  v6 = -[_IDSIDQueryController init](self, "init");
  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0D13238], "weakRefWithObject:", v6->_delegateContext);
    v7 = objc_claimAutoreleasedReturnValue();
    delegateContext = v6->_delegateContext;
    v6->_delegateContext = (id)v7;

    connection = v6->_connection;
    v6->_connection = 0;

    objc_msgSend(v5, "queue");
    v10 = objc_claimAutoreleasedReturnValue();
    queue = v6->_queue;
    v6->_queue = (OS_dispatch_queue *)v10;

    if (!v6->_queue)
    {
      dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      v12 = objc_claimAutoreleasedReturnValue();
      v13 = dispatch_queue_create("_IDSIDQueryControllerQueue", v12);
      v14 = v6->_queue;
      v6->_queue = (OS_dispatch_queue *)v13;

    }
    objc_msgSend(MEMORY[0x1E0CB3940], "stringGUID");
    v15 = objc_claimAutoreleasedReturnValue();
    serviceToken = v6->_serviceToken;
    v6->_serviceToken = (NSString *)v15;

    objc_msgSend(MEMORY[0x1E0CB3940], "stringGUID");
    v17 = objc_claimAutoreleasedReturnValue();
    listenerGUID = v6->_listenerGUID;
    v6->_listenerGUID = (NSString *)v17;

    +[IDSDaemonController sharedInstance](IDSDaemonController, "sharedInstance");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "listener");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "addHandler:", v6);

  }
  return v6;
}

- (void)_purgeIDStatusCache
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_1906EE4A0;
  block[3] = &unk_1E2C60550;
  block[4] = self;
  dispatch_async(queue, block);
}

+ (void)initialize
{
  uint64_t v2;

  v2 = objc_opt_class();
  if (v2 == objc_opt_class() && qword_1ECDD6608 != -1)
    dispatch_once(&qword_1ECDD6608, &unk_1E2C5FC90);
}

- (void)___oldDealloc
{
  NSString *serviceToken;
  NSMutableDictionary *listenerIDToServicesMap;
  NSMapTable *delegateToInfo;

  serviceToken = self->_serviceToken;
  self->_serviceToken = 0;

  listenerIDToServicesMap = self->_listenerIDToServicesMap;
  self->_listenerIDToServicesMap = 0;

  delegateToInfo = self->_delegateToInfo;
  self->_delegateToInfo = 0;

}

- (void)addDelegate:(id)a3 queue:(id)a4
{
  id v6;
  void *v7;
  NSMapTable *v8;
  NSMapTable *delegateToInfo;
  id v10;
  id v11;

  v11 = a3;
  v6 = a4;
  if (v11)
  {
    if (v6)
    {
      -[NSMapTable objectForKey:](self->_delegateToInfo, "objectForKey:", v11);
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v7)
      {
        if (!self->_delegateToInfo)
        {
          objc_msgSend(MEMORY[0x1E0CB3748], "weakToStrongObjectsMapTable");
          v8 = (NSMapTable *)objc_claimAutoreleasedReturnValue();
          delegateToInfo = self->_delegateToInfo;
          self->_delegateToInfo = v8;

        }
        v10 = objc_alloc_init(MEMORY[0x1E0D34D00]);
        objc_msgSend(v10, "setQueue:", v6);
        -[NSMapTable setObject:forKey:](self->_delegateToInfo, "setObject:forKey:", v10, v11);

      }
    }
  }

}

- (void)removeDelegate:(id)a3
{
  id v4;
  NSUInteger v5;
  NSMapTable *delegateToInfo;
  id v7;

  v4 = a3;
  if (v4)
  {
    v7 = v4;
    -[NSMapTable removeObjectForKey:](self->_delegateToInfo, "removeObjectForKey:", v4);
    v5 = -[NSMapTable count](self->_delegateToInfo, "count");
    v4 = v7;
    if (!v5)
    {
      delegateToInfo = self->_delegateToInfo;
      self->_delegateToInfo = 0;

      v4 = v7;
    }
  }

}

- (void)_callDelegatesWithBlock:(id)a3
{
  id v4;
  NSMapTable *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  void *v11;
  NSObject *v12;
  id v13;
  _QWORD v14[5];
  id v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    v5 = self->_delegateToInfo;
    v6 = -[NSMapTable countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v17;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v17 != v8)
            objc_enumerationMutation(v5);
          v10 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * i);
          -[NSMapTable objectForKey:](self->_delegateToInfo, "objectForKey:", v10);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "queue");
          v12 = objc_claimAutoreleasedReturnValue();
          if (v12)
          {
            v14[0] = MEMORY[0x1E0C809B0];
            v14[1] = 3221225472;
            v14[2] = sub_1907215A0;
            v14[3] = &unk_1E2C60E00;
            v13 = v4;
            v14[4] = v10;
            v15 = v13;
            dispatch_async(v12, v14);

          }
        }
        v7 = -[NSMapTable countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      }
      while (v7);
    }

  }
}

- (void)_connect
{
  NSString *v3;
  NSString *serviceToken;

  if (!self->_serviceToken)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringGUID");
    v3 = (NSString *)objc_claimAutoreleasedReturnValue();
    serviceToken = self->_serviceToken;
    self->_serviceToken = v3;

  }
}

- (void)IDQueryCompletedWithFromURI:(id)a3 idStatusUpdates:(id)a4 service:(id)a5 success:(BOOL)a6 error:(id)a7
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  NSObject *v24;
  const __CFString *v25;
  NSObject *queue;
  id v27;
  uint64_t v28;
  _BOOL4 v29;
  void *context;
  _QWORD block[5];
  id v33;
  id v34;
  uint8_t buf[4];
  id v36;
  __int16 v37;
  void *v38;
  __int16 v39;
  id v40;
  __int16 v41;
  const __CFString *v42;
  __int16 v43;
  id v44;
  __int16 v45;
  id v46;
  uint64_t v47;

  v29 = a6;
  v47 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a7;
  context = (void *)MEMORY[0x19400FC60]();
  v14 = (void *)MEMORY[0x1E0CB3710];
  v15 = (void *)MEMORY[0x1E0C99E60];
  v16 = objc_opt_class();
  v17 = objc_opt_class();
  v18 = objc_opt_class();
  v19 = objc_opt_class();
  v28 = v18;
  v20 = v10;
  objc_msgSend(v15, "setWithObjects:", v16, v17, v28, v19, objc_opt_class(), 0);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = 0;
  objc_msgSend(v14, "_strictlyUnarchivedObjectOfClasses:fromData:error:", v21, v11, &v34);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = v34;

  +[IDSLogging IDQuery](IDSLogging, "IDQuery");
  v24 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
  {
    v25 = CFSTR("NO");
    *(_DWORD *)buf = 138413570;
    v36 = v10;
    v37 = 2112;
    if (v29)
      v25 = CFSTR("YES");
    v38 = v22;
    v39 = 2112;
    v40 = v12;
    v41 = 2112;
    v42 = v25;
    v43 = 2112;
    v44 = v13;
    v45 = 2112;
    v46 = v23;
    _os_log_impl(&dword_1906E0000, v24, OS_LOG_TYPE_DEFAULT, "Received IDQueryCompletedWithFromURI %@ idStatusUpdates %@ service %@ success %@ error %@ decodeError %@", buf, 0x3Eu);
  }

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_19072187C;
  block[3] = &unk_1E2C607A8;
  block[4] = self;
  v33 = v22;
  v27 = v22;
  dispatch_async(queue, block);

  objc_autoreleasePoolPop(context);
}

- (void)addListenerID:(id)a3 forService:(id)a4
{
  NSMutableDictionary *v6;
  id v7;
  NSObject *v8;
  NSMutableDictionary *listenerIDToServicesMap;
  NSMutableDictionary *Mutable;
  NSMutableDictionary *v11;
  void *v12;
  NSObject *v13;
  NSObject *v14;
  NSObject *v15;
  NSMutableDictionary *v16;
  const char *v17;
  int v18;
  NSMutableDictionary *v19;
  __int16 v20;
  NSObject *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v6 = (NSMutableDictionary *)a3;
  v7 = a4;
  +[IDSLogging IDQuery](IDSLogging, "IDQuery");
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v18) = 0;
    _os_log_impl(&dword_1906E0000, v8, OS_LOG_TYPE_DEFAULT, "addListener:forService:", (uint8_t *)&v18, 2u);
  }

  if (!-[NSMutableDictionary length](v6, "length"))
  {
    +[IDSLogging IDQuery](IDSLogging, "IDQuery");
    v13 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      goto LABEL_21;
    LOWORD(v18) = 0;
    v17 = "ListenerID is empty, bailing...";
LABEL_20:
    _os_log_impl(&dword_1906E0000, v13, OS_LOG_TYPE_DEFAULT, v17, (uint8_t *)&v18, 2u);
    goto LABEL_21;
  }
  if (!objc_msgSend(v7, "length"))
  {
    +[IDSLogging IDQuery](IDSLogging, "IDQuery");
    v13 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      goto LABEL_21;
    LOWORD(v18) = 0;
    v17 = "Service name is empty, bailing...";
    goto LABEL_20;
  }
  listenerIDToServicesMap = self->_listenerIDToServicesMap;
  if (!listenerIDToServicesMap)
  {
    Mutable = (NSMutableDictionary *)CFDictionaryCreateMutable(0, 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
    v11 = self->_listenerIDToServicesMap;
    self->_listenerIDToServicesMap = Mutable;

    listenerIDToServicesMap = self->_listenerIDToServicesMap;
  }
  -[NSMutableDictionary objectForKey:](listenerIDToServicesMap, "objectForKey:", v6);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "mutableCopy");

  if (!v13)
    v13 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  if ((-[NSObject containsObject:](v13, "containsObject:", v7) & 1) == 0)
  {
    -[NSObject addObject:](v13, "addObject:", v7);
    +[IDSLogging IDQuery](IDSLogging, "IDQuery");
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      v18 = 138412546;
      v19 = v6;
      v20 = 2112;
      v21 = v13;
      _os_log_impl(&dword_1906E0000, v14, OS_LOG_TYPE_DEFAULT, "%@ -> %@", (uint8_t *)&v18, 0x16u);
    }

  }
  -[NSMutableDictionary setObject:forKey:](self->_listenerIDToServicesMap, "setObject:forKey:", v13, v6);
  +[IDSLogging IDQuery](IDSLogging, "IDQuery");
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    v16 = self->_listenerIDToServicesMap;
    v18 = 138412290;
    v19 = v16;
    _os_log_impl(&dword_1906E0000, v15, OS_LOG_TYPE_DEFAULT, "Final map after add %@", (uint8_t *)&v18, 0xCu);
  }

LABEL_21:
}

- (BOOL)removeListenerID:(id)a3 forService:(id)a4
{
  NSMutableDictionary *v6;
  id v7;
  NSObject *v8;
  void *v9;
  NSObject *v10;
  NSObject *v11;
  uint64_t v12;
  NSMutableDictionary *listenerIDToServicesMap;
  const char *v14;
  BOOL v15;
  NSObject *v16;
  NSMutableDictionary *v17;
  NSMutableDictionary *v18;
  int v20;
  NSMutableDictionary *v21;
  __int16 v22;
  NSObject *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v6 = (NSMutableDictionary *)a3;
  v7 = a4;
  +[IDSLogging IDQuery](IDSLogging, "IDQuery");
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v20) = 0;
    _os_log_impl(&dword_1906E0000, v8, OS_LOG_TYPE_DEFAULT, "removeListenerID:forService:", (uint8_t *)&v20, 2u);
  }

  if (!-[NSMutableDictionary length](v6, "length"))
  {
    +[IDSLogging IDQuery](IDSLogging, "IDQuery");
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v20) = 0;
      v14 = "ListenerID is empty, bailing...";
LABEL_14:
      _os_log_impl(&dword_1906E0000, v10, OS_LOG_TYPE_DEFAULT, v14, (uint8_t *)&v20, 2u);
    }
LABEL_15:
    v15 = 0;
    goto LABEL_22;
  }
  if (!objc_msgSend(v7, "length"))
  {
    +[IDSLogging IDQuery](IDSLogging, "IDQuery");
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v20) = 0;
      v14 = "Service name is empty, bailing...";
      goto LABEL_14;
    }
    goto LABEL_15;
  }
  -[NSMutableDictionary objectForKey:](self->_listenerIDToServicesMap, "objectForKey:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "mutableCopy");

  if (v10)
  {
    -[NSObject removeObject:](v10, "removeObject:", v7);
    +[IDSLogging IDQuery](IDSLogging, "IDQuery");
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v20 = 138412546;
      v21 = v6;
      v22 = 2112;
      v23 = v10;
      _os_log_impl(&dword_1906E0000, v11, OS_LOG_TYPE_DEFAULT, "%@ -> %@", (uint8_t *)&v20, 0x16u);
    }

    v12 = -[NSObject count](v10, "count");
    listenerIDToServicesMap = self->_listenerIDToServicesMap;
    if (v12)
      -[NSMutableDictionary setObject:forKey:](listenerIDToServicesMap, "setObject:forKey:", v10, v6);
    else
      -[NSMutableDictionary removeObjectForKey:](listenerIDToServicesMap, "removeObjectForKey:", v6);
  }
  +[IDSLogging IDQuery](IDSLogging, "IDQuery");
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    v17 = self->_listenerIDToServicesMap;
    v20 = 138412290;
    v21 = v17;
    _os_log_impl(&dword_1906E0000, v16, OS_LOG_TYPE_DEFAULT, "Final map after remove %@", (uint8_t *)&v20, 0xCu);
  }

  if (!-[NSMutableDictionary count](self->_listenerIDToServicesMap, "count"))
  {
    v18 = self->_listenerIDToServicesMap;
    self->_listenerIDToServicesMap = 0;

  }
  v15 = 1;
LABEL_22:

  return v15;
}

- (void)_disconnectFromQueryService
{
  NSObject *v3;
  NSObject *v4;
  OS_xpc_object *connection;
  uint8_t v6[16];
  uint8_t buf[16];

  +[IDSLogging IDQuery](IDSLogging, "IDQuery");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1906E0000, v3, OS_LOG_TYPE_DEFAULT, "Clearing out _connection, we're disconnecting", buf, 2u);
  }

  if (self->_connection)
  {
    +[IDSLogging IDQuery](IDSLogging, "IDQuery");
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_1906E0000, v4, OS_LOG_TYPE_DEFAULT, "Forcing a disconnect, terminating connection", v6, 2u);
    }

    xpc_connection_cancel(self->_connection);
    connection = self->_connection;
    self->_connection = 0;

  }
}

- (void)_requestCacheForService:(id)a3 completionBlock:(id)a4
{
  NSMutableDictionary *v6;
  id v7;
  NSObject *v8;
  _BOOL4 v9;
  void *v10;
  void *v11;
  NSMutableDictionary *transactionIDToBlockMap;
  NSMutableDictionary *Mutable;
  NSMutableDictionary *v14;
  void *v15;
  NSObject *v16;
  NSMutableDictionary *v17;
  NSMutableDictionary *v18;
  void (**v19)(_QWORD, _QWORD);
  xpc_object_t v20;
  void *v21;
  NSObject *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void (**v29)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD);
  void *v30;
  NSObject *v31;
  NSMutableDictionary *v32;
  const char *v33;
  NSObject *v34;
  void (**v35)(_QWORD, _QWORD);
  id v36;
  uint64_t v37;
  _QWORD v38[5];
  NSObject *v39;
  NSMutableDictionary *v40;
  uint8_t buf[4];
  NSMutableDictionary *v42;
  __int16 v43;
  NSObject *v44;
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v6 = (NSMutableDictionary *)a3;
  v7 = a4;
  if (-[NSMutableDictionary length](v6, "length"))
  {
    +[IDSLogging IDQuery](IDSLogging, "IDQuery");
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
    if (v7)
    {
      if (v9)
      {
        *(_DWORD *)buf = 138412290;
        v42 = v6;
        _os_log_impl(&dword_1906E0000, v8, OS_LOG_TYPE_DEFAULT, "Cache request for service %@", buf, 0xCu);
      }

      objc_msgSend(MEMORY[0x1E0CB3940], "stringGUID");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = (void *)objc_msgSend(v7, "copy");
      transactionIDToBlockMap = self->_transactionIDToBlockMap;
      if (!transactionIDToBlockMap)
      {
        Mutable = (NSMutableDictionary *)CFDictionaryCreateMutable(0, 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
        v14 = self->_transactionIDToBlockMap;
        self->_transactionIDToBlockMap = Mutable;

        transactionIDToBlockMap = self->_transactionIDToBlockMap;
      }
      v15 = (void *)MEMORY[0x19400FE1C](v11);
      -[NSMutableDictionary setObject:forKey:](transactionIDToBlockMap, "setObject:forKey:", v15, v10);

      +[IDSLogging IDQuery](IDSLogging, "IDQuery");
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        v17 = self->_transactionIDToBlockMap;
        *(_DWORD *)buf = 138412290;
        v42 = v17;
        _os_log_impl(&dword_1906E0000, v16, OS_LOG_TYPE_DEFAULT, "transactionID map after ADD %@", buf, 0xCu);
      }

      v38[0] = MEMORY[0x1E0C809B0];
      v38[1] = 3221225472;
      v38[2] = sub_19079E490;
      v38[3] = &unk_1E2C641C8;
      v38[4] = self;
      v8 = v10;
      v39 = v8;
      v18 = v6;
      v40 = v18;
      v19 = (void (**)(_QWORD, _QWORD))MEMORY[0x19400FE1C](v38);
      v20 = xpc_dictionary_create(0, 0, 0);
      v21 = v20;
      if (v20)
      {
        xpc_dictionary_set_BOOL(v20, "service-cache-request", 1);
        IMInsertNSStringsToXPCDictionary();
        IMInsertNSStringsToXPCDictionary();
        if (byte_1ECDD6568)
          xpc_dictionary_set_BOOL(v21, "is-springboard", 1);
        +[IDSLogging IDQuery](IDSLogging, "IDQuery", v8, 0);
        v22 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412546;
          v42 = v18;
          v43 = 2112;
          v44 = v8;
          _os_log_impl(&dword_1906E0000, v22, OS_LOG_TYPE_DEFAULT, "Sending cache request for service %@ transactionID %@", buf, 0x16u);
        }

        -[_IDSIDQueryController __sendMessage:queue:reply:failBlock:waitForReply:](self, "__sendMessage:queue:reply:failBlock:waitForReply:", v21, 0, 0, v19, 1);
        v23 = objc_claimAutoreleasedReturnValue();
        if (!v23)
          goto LABEL_31;
        v24 = (void *)v23;
        v35 = v19;
        v36 = v7;
        IMGetXPCStringFromDictionary();
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        IMGetXPCDictionaryFromDictionary();
        v37 = objc_claimAutoreleasedReturnValue();
        IMGetXPCStringFromDictionary();
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        IMGetXPCKeyedCodableFromDictionaryWithSecureCoding();
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableDictionary objectForKey:](self->_transactionIDToBlockMap, "objectForKey:", v26);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))objc_msgSend(v28, "copy");

        v30 = (void *)v37;
        if (v29)
          ((void (**)(_QWORD, uint64_t, void *, _QWORD, void *))v29)[2](v29, v37, v25, 0, v27);
        if (v26)
        {
          -[NSMutableDictionary removeObjectForKey:](self->_transactionIDToBlockMap, "removeObjectForKey:", v26);
          +[IDSLogging IDQuery](IDSLogging, "IDQuery");
          v31 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
          {
            v32 = self->_transactionIDToBlockMap;
            *(_DWORD *)buf = 138412290;
            v42 = v32;
            _os_log_impl(&dword_1906E0000, v31, OS_LOG_TYPE_DEFAULT, "transactionID map after REMOVE %@", buf, 0xCu);
          }

          v30 = (void *)v37;
        }

        v19 = v35;
        v7 = v36;
      }
      else
      {
        +[IDSLogging IDQuery](IDSLogging, "IDQuery");
        v34 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1906E0000, v34, OS_LOG_TYPE_DEFAULT, "Could not create message for cache query", buf, 2u);
        }

        objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("IDSIDQueryControllerErrorDomain"), -1000, 0);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        ((void (**)(_QWORD, void *))v19)[2](v19, v25);
      }

LABEL_31:
      goto LABEL_32;
    }
    if (v9)
    {
      *(_DWORD *)buf = 134217984;
      v42 = 0;
      v33 = "No block %p, bailing...";
      goto LABEL_26;
    }
  }
  else
  {
    +[IDSLogging IDQuery](IDSLogging, "IDQuery");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v42 = v6;
      v33 = "No service %@, bailing...";
LABEL_26:
      _os_log_impl(&dword_1906E0000, v8, OS_LOG_TYPE_DEFAULT, v33, buf, 0xCu);
    }
  }
LABEL_32:

}

- (void)_requestCachedStatusForDestinations:(id)a3 fromID:(id)a4 service:(id)a5 waitForReply:(BOOL)a6 respectExpiry:(BOOL)a7 listenerID:(id)a8 completionBlock:(id)a9
{
  _BOOL4 v10;
  _BOOL4 v11;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  NSObject *v21;
  void *v22;
  NSMutableDictionary *transactionIDToBlockMap;
  NSMutableDictionary *Mutable;
  NSMutableDictionary *v25;
  void *v26;
  NSObject *v27;
  id v28;
  id v29;
  xpc_object_t v30;
  void *v31;
  OS_dispatch_queue *queue;
  _IDSIDQueryController *v33;
  void *v34;
  id v35;
  const char *v36;
  NSObject *v37;
  void *v38;
  _BOOL4 v39;
  _BOOL4 v40;
  uint64_t v41;
  _QWORD v42[5];
  NSObject *v43;
  id v44;
  _QWORD v45[5];
  NSObject *v46;
  id v47;
  id v48;
  uint8_t buf[4];
  id v50;
  __int16 v51;
  id v52;
  __int16 v53;
  id v54;
  __int16 v55;
  void *v56;
  uint64_t v57;

  v10 = a7;
  v11 = a6;
  v57 = *MEMORY[0x1E0C80C00];
  v15 = a3;
  v16 = a4;
  v17 = a5;
  v18 = a8;
  v19 = a9;
  if (!objc_msgSend(v17, "length"))
  {
    +[IDSLogging IDQuery](IDSLogging, "IDQuery");
    v27 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
      goto LABEL_31;
    *(_DWORD *)buf = 138412290;
    v50 = v17;
    v36 = "No service %@, bailing...";
LABEL_23:
    _os_log_impl(&dword_1906E0000, v27, OS_LOG_TYPE_DEFAULT, v36, buf, 0xCu);
    goto LABEL_31;
  }
  if (!objc_msgSend(v18, "length"))
  {
    +[IDSLogging IDQuery](IDSLogging, "IDQuery");
    v27 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
      goto LABEL_31;
    *(_DWORD *)buf = 138412290;
    v50 = v18;
    v36 = "No listenerID %@, bailing...";
    goto LABEL_23;
  }
  if (v19)
  {
    v39 = v10;
    v40 = v11;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringGUID");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    +[IDSLogging IDQuery](IDSLogging, "IDQuery");
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138413058;
      v50 = v15;
      v51 = 2112;
      v52 = v17;
      v53 = 2112;
      v54 = v18;
      v55 = 2112;
      v56 = v20;
      _os_log_impl(&dword_1906E0000, v21, OS_LOG_TYPE_DEFAULT, "Cached ID status request (destinations: %@)  (service: %@)  (listenerID: %@)  (transactionID: %@)", buf, 0x2Au);
    }

    v22 = (void *)objc_msgSend(v19, "copy");
    transactionIDToBlockMap = self->_transactionIDToBlockMap;
    if (!transactionIDToBlockMap)
    {
      Mutable = (NSMutableDictionary *)CFDictionaryCreateMutable(0, 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
      v25 = self->_transactionIDToBlockMap;
      self->_transactionIDToBlockMap = Mutable;

      transactionIDToBlockMap = self->_transactionIDToBlockMap;
    }
    v26 = (void *)MEMORY[0x19400FE1C](v22);
    -[NSMutableDictionary setObject:forKey:](transactionIDToBlockMap, "setObject:forKey:", v26, v20);

    v45[0] = MEMORY[0x1E0C809B0];
    v45[1] = 3221225472;
    v45[2] = sub_19079EA7C;
    v45[3] = &unk_1E2C641F0;
    v45[4] = self;
    v27 = v20;
    v46 = v27;
    v28 = v17;
    v47 = v28;
    v29 = v18;
    v48 = v29;
    v41 = MEMORY[0x19400FE1C](v45);
    if (objc_msgSend(v15, "count"))
    {
      v30 = xpc_dictionary_create(0, 0, 0);
      v31 = v30;
      if (v30)
      {
        xpc_dictionary_set_BOOL(v30, "cached-id-status-query", 1);
        IMInsertNSStringsToXPCDictionary();
        IMInsertArraysToXPCDictionary();
        IMInsertNSStringsToXPCDictionary();
        if (v16)
        {
          objc_msgSend(v16, "unprefixedURI", v28, 0);
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          IMInsertNSStringsToXPCDictionary();

        }
        if (byte_1ECDD6568)
          xpc_dictionary_set_BOOL(v31, "is-springboard", 1);
        if (v39)
          xpc_dictionary_set_BOOL(v31, "respect-expiry", 1);
        queue = self->_queue;
        v42[0] = MEMORY[0x1E0C809B0];
        v42[1] = 3221225472;
        v42[2] = sub_19079EB24;
        v42[3] = &unk_1E2C64218;
        v42[4] = self;
        v43 = v27;
        v44 = v29;
        v33 = self;
        v34 = (void *)v41;
        v35 = -[_IDSIDQueryController __sendMessage:queue:reply:failBlock:waitForReply:](v33, "__sendMessage:queue:reply:failBlock:waitForReply:", v31, queue, v42, v41, v40);

      }
      else
      {
        v34 = (void *)v41;
      }
    }
    else
    {
      +[IDSLogging IDQuery](IDSLogging, "IDQuery");
      v37 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1906E0000, v37, OS_LOG_TYPE_DEFAULT, "No destinations, not issuing query...", buf, 2u);
      }

      v34 = (void *)v41;
      if (!v41)
        goto LABEL_30;
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("IDSIDQueryControllerErrorDomain"), -2000, 0);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, void *))(v41 + 16))(v41, v31);
    }

LABEL_30:
    goto LABEL_31;
  }
  +[IDSLogging IDQuery](IDSLogging, "IDQuery");
  v27 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v50 = 0;
    v36 = "No block %p, bailing...";
    goto LABEL_23;
  }
LABEL_31:

}

- (void)_requestStatusForDestinations:(id)a3 fromID:(id)a4 service:(id)a5 waitForReply:(BOOL)a6 forceRefresh:(BOOL)a7 bypassLimit:(BOOL)a8 listenerID:(id)a9 completionBlock:(id)a10
{
  _BOOL4 v10;
  _BOOL4 v11;
  id v15;
  id v16;
  NSMutableDictionary *v17;
  NSMutableDictionary *v18;
  id v19;
  void *v20;
  NSMutableDictionary *v21;
  NSMutableDictionary *v22;
  NSObject *v23;
  void *v24;
  NSMutableDictionary *transactionIDToBlockMap;
  NSMutableDictionary *Mutable;
  NSMutableDictionary *v27;
  void *v28;
  NSObject *v29;
  NSMutableDictionary *v30;
  NSObject *v31;
  NSMutableDictionary *v32;
  NSMutableDictionary *v33;
  void (**v34)(_QWORD, _QWORD);
  xpc_object_t v35;
  void *v36;
  OS_dispatch_queue *queue;
  id v38;
  const char *v39;
  NSObject *v40;
  NSMutableDictionary *v41;
  void *v42;
  _BOOL4 v43;
  _BOOL4 v44;
  void *v45;
  id v46;
  void *v47;
  _BOOL4 v48;
  _QWORD v49[5];
  NSObject *v50;
  NSMutableDictionary *v51;
  _QWORD v52[5];
  NSObject *v53;
  NSMutableDictionary *v54;
  NSMutableDictionary *v55;
  _QWORD v56[4];
  NSMutableDictionary *v57;
  uint8_t buf[4];
  NSMutableDictionary *v59;
  __int16 v60;
  NSMutableDictionary *v61;
  __int16 v62;
  NSMutableDictionary *v63;
  __int16 v64;
  void *v65;
  uint64_t v66;

  v10 = a8;
  v48 = a7;
  v11 = a6;
  v66 = *MEMORY[0x1E0C80C00];
  v15 = a3;
  v16 = a4;
  v17 = (NSMutableDictionary *)a5;
  v18 = (NSMutableDictionary *)a9;
  v19 = a10;
  if (!-[NSMutableDictionary length](v17, "length"))
  {
    +[IDSLogging IDQuery](IDSLogging, "IDQuery");
    v31 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
      goto LABEL_35;
    *(_DWORD *)buf = 138412290;
    v59 = v17;
    v39 = "No service %@, bailing...";
LABEL_27:
    _os_log_impl(&dword_1906E0000, v31, OS_LOG_TYPE_DEFAULT, v39, buf, 0xCu);
    goto LABEL_35;
  }
  if (!-[NSMutableDictionary length](v18, "length"))
  {
    +[IDSLogging IDQuery](IDSLogging, "IDQuery");
    v31 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
      goto LABEL_35;
    *(_DWORD *)buf = 138412290;
    v59 = v18;
    v39 = "No listenerID %@, bailing...";
    goto LABEL_27;
  }
  if (v19)
  {
    v43 = v10;
    v44 = v11;
    v45 = v16;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringGUID");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v56[0] = MEMORY[0x1E0C809B0];
    v56[1] = 3221225472;
    v56[2] = sub_19079F35C;
    v56[3] = &unk_1E2C63500;
    v21 = v17;
    v57 = v21;
    v47 = v15;
    objc_msgSend(v15, "__imArrayByApplyingBlock:", v56);
    v22 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
    +[IDSLogging IDQuery](IDSLogging, "IDQuery");
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138413058;
      v59 = v22;
      v60 = 2112;
      v61 = v21;
      v62 = 2112;
      v63 = v18;
      v64 = 2112;
      v65 = v20;
      _os_log_impl(&dword_1906E0000, v23, OS_LOG_TYPE_DEFAULT, "ID status renewal request (destinations: %@)  (service: %@)  (listenerID: %@)  (transactionID: %@)", buf, 0x2Au);
    }

    v46 = v19;
    v24 = (void *)objc_msgSend(v19, "copy");
    transactionIDToBlockMap = self->_transactionIDToBlockMap;
    if (!transactionIDToBlockMap)
    {
      Mutable = (NSMutableDictionary *)CFDictionaryCreateMutable(0, 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
      v27 = self->_transactionIDToBlockMap;
      self->_transactionIDToBlockMap = Mutable;

      transactionIDToBlockMap = self->_transactionIDToBlockMap;
    }
    v28 = (void *)MEMORY[0x19400FE1C](v24);
    -[NSMutableDictionary setObject:forKey:](transactionIDToBlockMap, "setObject:forKey:", v28, v20);

    +[IDSLogging IDQuery](IDSLogging, "IDQuery");
    v29 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
    {
      v30 = self->_transactionIDToBlockMap;
      *(_DWORD *)buf = 138412290;
      v59 = v30;
      _os_log_impl(&dword_1906E0000, v29, OS_LOG_TYPE_DEFAULT, "transactionID map after ADD %@", buf, 0xCu);
    }

    v52[0] = MEMORY[0x1E0C809B0];
    v52[1] = 3221225472;
    v52[2] = sub_19079F374;
    v52[3] = &unk_1E2C641F0;
    v52[4] = self;
    v31 = v20;
    v53 = v31;
    v32 = v21;
    v54 = v32;
    v33 = v18;
    v55 = v33;
    v34 = (void (**)(_QWORD, _QWORD))MEMORY[0x19400FE1C](v52);
    if (objc_msgSend(v47, "count"))
    {
      v35 = xpc_dictionary_create(0, 0, 0);
      v36 = v35;
      v19 = v46;
      if (v35)
      {
        xpc_dictionary_set_BOOL(v35, "id-status-query", 1);
        IMInsertNSStringsToXPCDictionary();
        IMInsertArraysToXPCDictionary();
        v41 = v32;
        IMInsertNSStringsToXPCDictionary();
        v16 = v45;
        if (v45)
        {
          objc_msgSend(v45, "unprefixedURI", v41, 0);
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          IMInsertNSStringsToXPCDictionary();

        }
        if (v48)
          xpc_dictionary_set_BOOL(v36, "force", 1);
        if (v43)
          xpc_dictionary_set_BOOL(v36, "bypass-limit", 1);
        if (byte_1ECDD6568)
          xpc_dictionary_set_BOOL(v36, "is-springboard", 1);
        queue = self->_queue;
        v49[0] = MEMORY[0x1E0C809B0];
        v49[1] = 3221225472;
        v49[2] = sub_19079F41C;
        v49[3] = &unk_1E2C64218;
        v49[4] = self;
        v50 = v31;
        v51 = v33;
        v38 = -[_IDSIDQueryController __sendMessage:queue:reply:failBlock:waitForReply:](self, "__sendMessage:queue:reply:failBlock:waitForReply:", v36, queue, v49, v34, v44);

        v19 = v46;
        v15 = v47;
      }
      else
      {
        v15 = v47;
        v16 = v45;
      }
    }
    else
    {
      +[IDSLogging IDQuery](IDSLogging, "IDQuery");
      v40 = objc_claimAutoreleasedReturnValue();
      v19 = v46;
      if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1906E0000, v40, OS_LOG_TYPE_DEFAULT, "No destinations, not issuing query...", buf, 2u);
      }

      v15 = v47;
      v16 = v45;
      if (!v34)
        goto LABEL_34;
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("IDSIDQueryControllerErrorDomain"), -2000, 0);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, void *))v34)[2](v34, v36);
    }

LABEL_34:
    goto LABEL_35;
  }
  +[IDSLogging IDQuery](IDSLogging, "IDQuery");
  v31 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v59 = 0;
    v39 = "No block %p, bailing...";
    goto LABEL_27;
  }
LABEL_35:

}

- (void)_requestRemoteDevicesForDestination:(id)a3 fromID:(id)a4 service:(id)a5 listenerID:(id)a6 waitForReply:(BOOL)a7 completionBlock:(id)a8
{
  _BOOL4 v9;
  NSMutableDictionary *v14;
  id v15;
  NSMutableDictionary *v16;
  NSMutableDictionary *v17;
  id v18;
  void *v19;
  NSObject *v20;
  void *v21;
  NSMutableDictionary *transactionIDToBlockMap;
  NSMutableDictionary *Mutable;
  NSMutableDictionary *v24;
  void *v25;
  NSObject *v26;
  NSMutableDictionary *v27;
  NSObject *v28;
  NSMutableDictionary *v29;
  NSMutableDictionary *v30;
  void *v31;
  uint64_t v32;
  xpc_object_t v33;
  void *v34;
  OS_dispatch_queue *queue;
  OS_dispatch_queue *v36;
  void *v37;
  id v38;
  const char *v39;
  NSObject *v40;
  NSMutableDictionary *v41;
  void *v42;
  _BOOL4 v43;
  uint64_t v44;
  void *v45;
  _QWORD v46[5];
  NSObject *v47;
  NSMutableDictionary *v48;
  _QWORD v49[5];
  NSObject *v50;
  NSMutableDictionary *v51;
  NSMutableDictionary *v52;
  uint8_t buf[4];
  NSMutableDictionary *v54;
  __int16 v55;
  NSMutableDictionary *v56;
  __int16 v57;
  NSMutableDictionary *v58;
  __int16 v59;
  void *v60;
  uint64_t v61;

  v9 = a7;
  v61 = *MEMORY[0x1E0C80C00];
  v14 = (NSMutableDictionary *)a3;
  v15 = a4;
  v16 = (NSMutableDictionary *)a5;
  v17 = (NSMutableDictionary *)a6;
  v18 = a8;
  if (!-[NSMutableDictionary length](v16, "length"))
  {
    +[IDSLogging IDQuery](IDSLogging, "IDQuery");
    v28 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
      goto LABEL_33;
    *(_DWORD *)buf = 138412290;
    v54 = v16;
    v39 = "No service %@, bailing...";
LABEL_25:
    _os_log_impl(&dword_1906E0000, v28, OS_LOG_TYPE_DEFAULT, v39, buf, 0xCu);
    goto LABEL_33;
  }
  if (!-[NSMutableDictionary length](v17, "length"))
  {
    +[IDSLogging IDQuery](IDSLogging, "IDQuery");
    v28 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
      goto LABEL_33;
    *(_DWORD *)buf = 138412290;
    v54 = v17;
    v39 = "No listenerID %@, bailing...";
    goto LABEL_25;
  }
  if (v18)
  {
    v43 = v9;
    v45 = v15;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringGUID");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    +[IDSLogging IDQuery](IDSLogging, "IDQuery");
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138413058;
      v54 = v14;
      v55 = 2112;
      v56 = v16;
      v57 = 2112;
      v58 = v17;
      v59 = 2112;
      v60 = v19;
      _os_log_impl(&dword_1906E0000, v20, OS_LOG_TYPE_DEFAULT, "ID remote device request (destination: %@)  (service: %@)  (listenerID: %@)  (transactionID: %@)", buf, 0x2Au);
    }

    v21 = (void *)objc_msgSend(v18, "copy");
    transactionIDToBlockMap = self->_transactionIDToBlockMap;
    if (!transactionIDToBlockMap)
    {
      Mutable = (NSMutableDictionary *)CFDictionaryCreateMutable(0, 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
      v24 = self->_transactionIDToBlockMap;
      self->_transactionIDToBlockMap = Mutable;

      transactionIDToBlockMap = self->_transactionIDToBlockMap;
    }
    v25 = (void *)MEMORY[0x19400FE1C](v21);
    -[NSMutableDictionary setObject:forKey:](transactionIDToBlockMap, "setObject:forKey:", v25, v19);

    +[IDSLogging IDQuery](IDSLogging, "IDQuery");
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      v27 = self->_transactionIDToBlockMap;
      *(_DWORD *)buf = 138412290;
      v54 = v27;
      _os_log_impl(&dword_1906E0000, v26, OS_LOG_TYPE_DEFAULT, "transactionID map after ADD %@", buf, 0xCu);
    }

    v49[0] = MEMORY[0x1E0C809B0];
    v49[1] = 3221225472;
    v49[2] = sub_19079FC74;
    v49[3] = &unk_1E2C641F0;
    v49[4] = self;
    v28 = v19;
    v50 = v28;
    v29 = v16;
    v51 = v29;
    v30 = v17;
    v52 = v30;
    v44 = MEMORY[0x19400FE1C](v49);
    -[NSMutableDictionary destinationURIs](v14, "destinationURIs");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = objc_msgSend(v31, "count");

    if (v32)
    {
      v33 = xpc_dictionary_create(0, 0, 0);
      v34 = v33;
      if (v33)
      {
        xpc_dictionary_set_BOOL(v33, "remote-device-status-query", 1);
        IMInsertNSStringsToXPCDictionary();
        IMInsertKeyedCodableObjectsToXPCDictionary();
        v41 = v29;
        IMInsertNSStringsToXPCDictionary();
        v15 = v45;
        if (v45)
        {
          objc_msgSend(v45, "unprefixedURI", v41, 0);
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          IMInsertNSStringsToXPCDictionary();

        }
        if (byte_1ECDD6568)
          xpc_dictionary_set_BOOL(v34, "is-springboard", 1);
        if (v43)
          xpc_dictionary_set_BOOL(v34, "disallow-query", 1);
        queue = self->_queue;
        v46[0] = MEMORY[0x1E0C809B0];
        v46[1] = 3221225472;
        v46[2] = sub_19079FD1C;
        v46[3] = &unk_1E2C64218;
        v46[4] = self;
        v47 = v28;
        v48 = v30;
        v36 = queue;
        v37 = (void *)v44;
        v38 = -[_IDSIDQueryController __sendMessage:queue:reply:failBlock:waitForReply:](self, "__sendMessage:queue:reply:failBlock:waitForReply:", v34, v36, v46, v44, v43);

      }
      else
      {
        v37 = (void *)v44;
        v15 = v45;
      }
    }
    else
    {
      +[IDSLogging IDQuery](IDSLogging, "IDQuery");
      v40 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1906E0000, v40, OS_LOG_TYPE_DEFAULT, "No destinations, not issuing query...", buf, 2u);
      }

      v37 = (void *)v44;
      v15 = v45;
      if (!v44)
        goto LABEL_32;
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("IDSIDQueryControllerErrorDomain"), -2000, 0);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, void *))(v44 + 16))(v44, v34);
    }

LABEL_32:
    goto LABEL_33;
  }
  +[IDSLogging IDQuery](IDSLogging, "IDQuery");
  v28 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v54 = 0;
    v39 = "No block %p, bailing...";
    goto LABEL_25;
  }
LABEL_33:

}

- (void)_requestIDInfoForDestinations:(id)a3 fromID:(id)a4 service:(id)a5 infoTypes:(unint64_t)a6 options:(id)a7 listenerID:(id)a8 queue:(id)a9 completionBlock:(id)a10
{
  NSMutableDictionary *v15;
  id v16;
  NSMutableDictionary *v17;
  id v18;
  NSMutableDictionary *v19;
  id v20;
  void *v21;
  NSObject *v22;
  void *v23;
  NSMutableDictionary *transactionIDToBlockMap;
  NSMutableDictionary *Mutable;
  NSMutableDictionary *v26;
  void *v27;
  NSObject *v28;
  NSMutableDictionary *v29;
  NSObject *v30;
  NSMutableDictionary *v31;
  void *v32;
  uint64_t v33;
  xpc_object_t v34;
  void *v35;
  OS_dispatch_queue *queue;
  uint64_t v37;
  OS_dispatch_queue *v38;
  void *v39;
  id v40;
  const char *v41;
  NSObject *v42;
  void *v43;
  uint64_t v44;
  void *v45;
  void *v46;
  _QWORD v47[5];
  NSObject *v48;
  NSMutableDictionary *v49;
  _QWORD v50[5];
  NSObject *v51;
  NSMutableDictionary *v52;
  NSMutableDictionary *v53;
  uint8_t buf[4];
  NSMutableDictionary *v55;
  __int16 v56;
  NSMutableDictionary *v57;
  __int16 v58;
  NSMutableDictionary *v59;
  __int16 v60;
  void *v61;
  uint64_t v62;

  v62 = *MEMORY[0x1E0C80C00];
  v15 = (NSMutableDictionary *)a3;
  v16 = a4;
  v17 = (NSMutableDictionary *)a5;
  v18 = a7;
  v19 = (NSMutableDictionary *)a8;
  v20 = a10;
  if (!-[NSMutableDictionary length](v17, "length"))
  {
    +[IDSLogging IDQuery](IDSLogging, "IDQuery");
    v30 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
      goto LABEL_31;
    *(_DWORD *)buf = 138412290;
    v55 = v17;
    v41 = "No service %@, bailing...";
LABEL_23:
    _os_log_impl(&dword_1906E0000, v30, OS_LOG_TYPE_DEFAULT, v41, buf, 0xCu);
    goto LABEL_31;
  }
  if (!-[NSMutableDictionary length](v19, "length"))
  {
    +[IDSLogging IDQuery](IDSLogging, "IDQuery");
    v30 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
      goto LABEL_31;
    *(_DWORD *)buf = 138412290;
    v55 = v19;
    v41 = "No listenerID %@, bailing...";
    goto LABEL_23;
  }
  if (v20)
  {
    v45 = v18;
    v46 = v16;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringGUID");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    +[IDSLogging IDQuery](IDSLogging, "IDQuery");
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138413058;
      v55 = v15;
      v56 = 2112;
      v57 = v17;
      v58 = 2112;
      v59 = v19;
      v60 = 2112;
      v61 = v21;
      _os_log_impl(&dword_1906E0000, v22, OS_LOG_TYPE_DEFAULT, "ID remote device request (destination: %@)  (service: %@)  (listenerID: %@)  (transactionID: %@)", buf, 0x2Au);
    }

    v23 = (void *)objc_msgSend(v20, "copy");
    transactionIDToBlockMap = self->_transactionIDToBlockMap;
    if (!transactionIDToBlockMap)
    {
      Mutable = (NSMutableDictionary *)CFDictionaryCreateMutable(0, 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
      v26 = self->_transactionIDToBlockMap;
      self->_transactionIDToBlockMap = Mutable;

      transactionIDToBlockMap = self->_transactionIDToBlockMap;
    }
    v27 = (void *)MEMORY[0x19400FE1C](v23);
    -[NSMutableDictionary setObject:forKey:](transactionIDToBlockMap, "setObject:forKey:", v27, v21);

    +[IDSLogging IDQuery](IDSLogging, "IDQuery");
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      v29 = self->_transactionIDToBlockMap;
      *(_DWORD *)buf = 138412290;
      v55 = v29;
      _os_log_impl(&dword_1906E0000, v28, OS_LOG_TYPE_DEFAULT, "transactionID map after ADD %@", buf, 0xCu);
    }

    v50[0] = MEMORY[0x1E0C809B0];
    v50[1] = 3221225472;
    v50[2] = sub_1907A05A8;
    v50[3] = &unk_1E2C641F0;
    v50[4] = self;
    v30 = v21;
    v51 = v30;
    v52 = v17;
    v31 = v19;
    v53 = v31;
    v44 = MEMORY[0x19400FE1C](v50);
    -[NSMutableDictionary destinationURIs](v15, "destinationURIs");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = objc_msgSend(v32, "count");

    if (v33)
    {
      v34 = xpc_dictionary_create(0, 0, 0);
      v35 = v34;
      if (v34)
      {
        xpc_dictionary_set_BOOL(v34, "id-status-info-query", 1);
        IMInsertNSStringsToXPCDictionary();
        IMInsertKeyedCodableObjectsToXPCDictionary();
        IMInsertNSStringsToXPCDictionary();
        IMInsertIntsToXPCDictionary();
        v18 = v45;
        IMInsertKeyedCodableObjectsToXPCDictionary();
        if (v46)
        {
          objc_msgSend(v46, "unprefixedURI", v45, 0);
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          IMInsertNSStringsToXPCDictionary();

        }
        if (byte_1ECDD6568)
          xpc_dictionary_set_BOOL(v35, "is-springboard", 1);
        queue = self->_queue;
        v47[0] = MEMORY[0x1E0C809B0];
        v47[1] = 3221225472;
        v47[2] = sub_1907A0650;
        v47[3] = &unk_1E2C64218;
        v47[4] = self;
        v48 = v30;
        v49 = v31;
        v37 = objc_msgSend(v45, "waitForReply");
        v38 = queue;
        v39 = (void *)v44;
        v40 = -[_IDSIDQueryController __sendMessage:queue:reply:failBlock:waitForReply:](self, "__sendMessage:queue:reply:failBlock:waitForReply:", v35, v38, v47, v44, v37);

        v16 = v46;
      }
      else
      {
        v18 = v45;
        v16 = v46;
        v39 = (void *)v44;
      }
    }
    else
    {
      +[IDSLogging IDQuery](IDSLogging, "IDQuery");
      v42 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1906E0000, v42, OS_LOG_TYPE_DEFAULT, "No destinations, not issuing query...", buf, 2u);
      }

      v18 = v45;
      v16 = v46;
      v39 = (void *)v44;
      if (!v44)
        goto LABEL_30;
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("IDSIDQueryControllerErrorDomain"), -2000, 0);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, void *))(v44 + 16))(v44, v35);
    }

LABEL_30:
    goto LABEL_31;
  }
  +[IDSLogging IDQuery](IDSLogging, "IDQuery");
  v30 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v55 = 0;
    v41 = "No block %p, bailing...";
    goto LABEL_23;
  }
LABEL_31:

}

- (id)__sendMessage:(id)a3 queue:(id)a4 reply:(id)a5 failBlock:(id)a6 waitForReply:(BOOL)a7
{
  id v12;
  NSObject *v13;
  id v14;
  id v15;
  OS_xpc_object *connection;
  uint64_t v17;
  _xpc_connection_s *v18;
  xpc_object_t v19;
  OS_xpc_object *v20;
  OS_xpc_object *v21;
  OS_xpc_object *v22;
  void (**v23)(_QWORD, _QWORD);
  void *v24;
  NSObject *v25;
  void *v27;
  _QWORD v28[4];
  NSObject *v29;
  id v30;
  uint64_t v31;
  uint64_t v32;
  void (*v33)(uint64_t);
  void *v34;
  _IDSIDQueryController *v35;
  uint8_t buf[4];
  uint64_t v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  if (v12)
  {
    if (!v13)
    {
      dispatch_get_global_queue(0, 0);
      v13 = objc_claimAutoreleasedReturnValue();
    }
    connection = self->_connection;
    v17 = MEMORY[0x1E0C809B0];
    if (connection)
    {
      v18 = connection;
    }
    else
    {
      objc_msgSend((id)objc_opt_class(), "_createXPCConnectionOnQueue:", self->_connectionQueue);
      v20 = (OS_xpc_object *)objc_claimAutoreleasedReturnValue();
      v21 = self->_connection;
      self->_connection = v20;

      v22 = self->_connection;
      if (!v22)
      {
        +[IDSLogging IDQuery](IDSLogging, "IDQuery");
        v25 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1906E0000, v25, OS_LOG_TYPE_DEFAULT, "No connection to send message on", buf, 2u);
        }
        v18 = 0;
        v19 = 0;
        goto LABEL_16;
      }
      v18 = v22;
      v31 = v17;
      v32 = 3221225472;
      v33 = sub_1907A0C30;
      v34 = &unk_1E2C60550;
      v35 = self;
      IMXPCConfigureConnection();
    }
    v28[0] = v17;
    v28[1] = 3221225472;
    v28[2] = sub_1907A0D08;
    v28[3] = &unk_1E2C64240;
    v29 = v15;
    v30 = v14;
    v23 = (void (**)(_QWORD, _QWORD))MEMORY[0x19400FE1C](v28);
    objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "processName");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    IMInsertNSStringsToXPCDictionary();

    if (a7)
    {
      v19 = xpc_connection_send_message_with_reply_sync(v18, v12);
      if (v23)
        ((void (**)(_QWORD, xpc_object_t))v23)[2](v23, v19);
    }
    else
    {
      xpc_connection_send_message_with_reply(v18, v12, v13, v23);
      v19 = 0;
    }

    v25 = v29;
LABEL_16:

    goto LABEL_17;
  }
  +[IDSLogging IDQuery](IDSLogging, "IDQuery");
  v18 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled((os_log_t)v18, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v37 = 0;
    _os_log_impl(&dword_1906E0000, (os_log_t)v18, OS_LOG_TYPE_DEFAULT, "No message to send %@, ignoring...", buf, 0xCu);
  }
  v19 = 0;
LABEL_17:

  return v19;
}

+ (id)_createXPCConnectionOnQueue:(id)a3
{
  void *v3;
  id v4;
  void *v5;

  v3 = (void *)*MEMORY[0x1E0D35018];
  v4 = a3;
  objc_msgSend(v3, "UTF8String");
  v5 = (void *)IMXPCCreateConnectionForServiceWithQueue();

  return v5;
}

- (void)dealloc
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v6;

  -[_IDSIDQueryController ___oldDealloc](self, "___oldDealloc");
  -[_IDSIDQueryController _disconnectFromQueryService](self, "_disconnectFromQueryService");
  +[IDSDaemonController sharedInstance](IDSDaemonController, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeListenerID:", self->_listenerGUID);

  +[IDSDaemonController sharedInstance](IDSDaemonController, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "listener");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeHandler:", self);

  v6.receiver = self;
  v6.super_class = (Class)_IDSIDQueryController;
  -[_IDSIDQueryController dealloc](&v6, sel_dealloc);
}

- (void)setFromID:(id)a3
{
  NSObject *v3;
  uint8_t v4[16];

  +[IDSLogging IDQuery](IDSLogging, "IDQuery", a3);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1906E0000, v3, OS_LOG_TYPE_DEFAULT, "This has been deprecated, please adopt the preferredFromID query APIs", v4, 2u);
  }

}

- (BOOL)_isListenerWithID:(id)a3 listeningToService:(id)a4
{
  id v6;
  id v7;
  void *v8;
  BOOL v9;
  void *v10;
  void *v11;
  void *v12;

  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v6, "length") && objc_msgSend(v7, "length"))
  {
    -[NSMutableDictionary objectForKey:](self->_listenerIDToServicesMap, "objectForKey:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v8, "containsObject:", v7) & 1) != 0)
    {
      v9 = 1;
    }
    else
    {
      -[NSMutableDictionary objectForKey:](self->_listeners, "objectForKey:", v6);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = v10;
      if (v10)
      {
        objc_msgSend(v10, "objectForKey:", v7);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = v12 != 0;

      }
      else
      {
        v9 = 0;
      }

    }
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)_cacheForService:(id)a3
{
  return (id)-[NSMutableDictionary objectForKey:](self->_idStatusCache, "objectForKey:", a3);
}

- (id)_cachedStatusForDestination:(id)a3 service:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;

  v6 = a3;
  v7 = a4;
  if (self->_idStatusCache && objc_msgSend(v6, "length") && objc_msgSend(v7, "length"))
  {
    -[_IDSIDQueryController _cacheForService:](self, "_cacheForService:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKey:", v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (void)_updateCacheWithDictionary:(id)a3 service:(id)a4
{
  id v6;
  NSMutableDictionary *Mutable;
  NSMutableDictionary *idStatusCache;
  NSMutableDictionary *v9;
  void *v10;
  id v11;
  id v12;
  _QWORD v13[5];

  v11 = a3;
  v6 = a4;
  if (!self->_idStatusCache)
  {
    Mutable = (NSMutableDictionary *)CFDictionaryCreateMutable(0, 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
    idStatusCache = self->_idStatusCache;
    self->_idStatusCache = Mutable;

    -[_IDSIDQueryController _purgeIDStatusCacheAfter:](self, "_purgeIDStatusCacheAfter:", 5.0);
  }
  if (objc_msgSend(v11, "count", v11))
  {
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = sub_1907AD590;
    v13[3] = &unk_1E2C61A10;
    v13[4] = self;
    objc_msgSend(v12, "enumerateKeysAndObjectsUsingBlock:", v13);
  }
  else if (objc_msgSend(v6, "length"))
  {
    v9 = self->_idStatusCache;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionary");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKey:](v9, "setObject:forKey:", v10, v6);

  }
}

- (void)_purgeIDStatusCacheAfter:(double)a3
{
  dispatch_time_t v5;
  NSObject *queue;
  _QWORD block[5];
  id v8;
  id location;

  location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self->_idStatusCache);
  v5 = dispatch_time(0, (uint64_t)(a3 * 1000000000.0));
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_1907AD708;
  block[3] = &unk_1E2C60B38;
  objc_copyWeak(&v8, &location);
  block[4] = self;
  dispatch_after(v5, queue, block);
  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

- (void)_callDelegatesWithBlock:(id)a3 delegateMap:(id)a4
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  void *v13;
  NSObject *v14;
  id v15;
  _QWORD v16[5];
  id v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v7 = v6;
  if (v5)
  {
    if (v6)
    {
      v20 = 0u;
      v21 = 0u;
      v18 = 0u;
      v19 = 0u;
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      if (v8)
      {
        v9 = v8;
        v10 = *(_QWORD *)v19;
        do
        {
          for (i = 0; i != v9; ++i)
          {
            if (*(_QWORD *)v19 != v10)
              objc_enumerationMutation(v7);
            v12 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * i);
            objc_msgSend(v7, "objectForKey:", v12);
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v13, "queue");
            v14 = objc_claimAutoreleasedReturnValue();
            if (v14)
            {
              v16[0] = MEMORY[0x1E0C809B0];
              v16[1] = 3221225472;
              v16[2] = sub_1907AD938;
              v16[3] = &unk_1E2C60E00;
              v15 = v5;
              v16[4] = v12;
              v17 = v15;
              dispatch_async(v14, v16);

            }
          }
          v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
        }
        while (v9);
      }
    }
  }

}

- (id)_delegateMapForListenerID:(id)a3 service:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (v6 && objc_msgSend(v7, "length"))
  {
    -[NSMutableDictionary objectForKey:](self->_listeners, "objectForKey:", v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v9)
    {
      objc_msgSend(v9, "objectForKey:", v8);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v11 = 0;
    }

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (void)_callDelegatesForService:(id)a3 destinationToVerifierResult:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  _QWORD v14[4];
  id v15;
  id v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v6, "length") && objc_msgSend(v7, "count"))
  {
    -[NSMutableDictionary allValues](self->_listeners, "allValues");
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
          objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * v12), "objectForKey:", v6);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          if (v13)
          {
            v14[0] = MEMORY[0x1E0C809B0];
            v14[1] = 3221225472;
            v14[2] = sub_1907ADB88;
            v14[3] = &unk_1E2C646D8;
            v15 = v6;
            v16 = v7;
            -[_IDSIDQueryController _callDelegatesWithBlock:delegateMap:](self, "_callDelegatesWithBlock:delegateMap:", v14, v13);

          }
          ++v12;
        }
        while (v10 != v12);
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      }
      while (v10);
    }

  }
}

- (void)_setCurrentIDStatus:(int64_t)a3 forDestination:(id)a4 service:(id)a5
{
  int v6;
  id v8;
  id v9;
  xpc_object_t v10;
  void *v11;
  NSObject *v12;
  id v13;
  uint8_t buf[4];
  int v15;
  __int16 v16;
  id v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v6 = a3;
  v20 = *MEMORY[0x1E0C80C00];
  v8 = a4;
  v9 = a5;
  if (objc_msgSend(v8, "length") && objc_msgSend(v9, "length"))
  {
    v10 = xpc_dictionary_create(0, 0, 0);
    v11 = v10;
    if (v10)
    {
      xpc_dictionary_set_BOOL(v10, "set-id-status", 1);
      IMInsertIntsToXPCDictionary();
      IMInsertNSStringsToXPCDictionary();
      IMInsertNSStringsToXPCDictionary();
      +[IDSLogging IDQuery](IDSLogging, "IDQuery", v8, 0);
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109634;
        v15 = v6;
        v16 = 2112;
        v17 = v9;
        v18 = 2112;
        v19 = v8;
        _os_log_impl(&dword_1906E0000, v12, OS_LOG_TYPE_DEFAULT, "Sending ID status update (%d) for service %@ destination %@", buf, 0x1Cu);
      }

      v13 = -[_IDSIDQueryController __sendMessage:queue:reply:failBlock:waitForReply:](self, "__sendMessage:queue:reply:failBlock:waitForReply:", v11, 0, 0, 0, 0);
    }

  }
}

- (void)flushQueryCache
{
  xpc_object_t v3;
  void *v4;
  NSObject *v5;
  id v6;
  uint8_t v7[16];

  v3 = xpc_dictionary_create(0, 0, 0);
  v4 = v3;
  if (v3)
  {
    xpc_dictionary_set_BOOL(v3, "flush-query-cache", 1);
    +[IDSLogging IDQuery](IDSLogging, "IDQuery");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_1906E0000, v5, OS_LOG_TYPE_DEFAULT, "Sending query cache flush", v7, 2u);
    }

    v6 = -[_IDSIDQueryController __sendMessage:queue:reply:failBlock:waitForReply:](self, "__sendMessage:queue:reply:failBlock:waitForReply:", v4, 0, 0, 0, 0);
  }

}

- (void)_idStatusForDestinations:(id)a3 service:(id)a4 preferredFromID:(id)a5 listenerID:(id)a6 allowRenew:(BOOL)a7 respectExpiry:(BOOL)a8 waitForReply:(BOOL)a9 forceRefresh:(BOOL)a10 bypassLimit:(BOOL)a11 completionBlock:(id)a12
{
  _BOOL8 v12;
  id v18;
  id v19;
  id v20;
  id v21;
  void (**v22)(_QWORD, void *);
  NSObject *v23;
  id v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t i;
  uint64_t v30;
  void *v31;
  void *v32;
  const char *v33;
  void *v34;
  uint64_t v35;
  void *v36;
  id v37;
  id v38;
  id v39;
  id v40;
  id v41;
  id v42;
  void (**v43)(_QWORD, void *);
  _QWORD v44[5];
  id v45;
  BOOL v46;
  _QWORD v47[5];
  id v48;
  id v49;
  void (**v50)(_QWORD, void *);
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  uint8_t buf[8];
  _BYTE v56[128];
  uint64_t v57;

  v12 = a8;
  v57 = *MEMORY[0x1E0C80C00];
  v18 = a3;
  v19 = a4;
  v20 = a5;
  v21 = a6;
  v22 = (void (**)(_QWORD, void *))a12;
  if (!objc_msgSend(v18, "count"))
  {
    +[IDSLogging IDQuery](IDSLogging, "IDQuery");
    v23 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      goto LABEL_26;
    *(_WORD *)buf = 0;
    v33 = "No destinations, bailing...";
LABEL_25:
    _os_log_impl(&dword_1906E0000, v23, OS_LOG_TYPE_DEFAULT, v33, buf, 2u);
    goto LABEL_26;
  }
  if (!objc_msgSend(v19, "length"))
  {
    +[IDSLogging IDQuery](IDSLogging, "IDQuery");
    v23 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      goto LABEL_26;
    *(_WORD *)buf = 0;
    v33 = "No service, bailing...";
    goto LABEL_25;
  }
  if (!objc_msgSend(v21, "length"))
  {
    +[IDSLogging IDQuery](IDSLogging, "IDQuery");
    v23 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      goto LABEL_26;
    *(_WORD *)buf = 0;
    v33 = "No listenerID, bailing...";
    goto LABEL_25;
  }
  if (!v22)
  {
    +[IDSLogging IDQuery](IDSLogging, "IDQuery");
    v23 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      goto LABEL_26;
    *(_WORD *)buf = 0;
    v33 = "No query complete block, bailing...";
    goto LABEL_25;
  }
  -[_IDSIDQueryController _cacheForService:](self, "_cacheForService:", v19);
  v23 = objc_claimAutoreleasedReturnValue();
  v43 = v22;
  if (!v23 || a7)
  {
    v47[0] = MEMORY[0x1E0C809B0];
    v47[1] = 3221225472;
    v47[2] = sub_1907AE314;
    v47[3] = &unk_1E2C64700;
    v47[4] = self;
    v42 = v19;
    v48 = v42;
    v40 = v21;
    v49 = v40;
    v50 = v22;
    v34 = (void *)MEMORY[0x19400FE1C](v47);
    v44[0] = MEMORY[0x1E0C809B0];
    v44[1] = 3221225472;
    v44[2] = sub_1907AE854;
    v44[3] = &unk_1E2C64728;
    v46 = a9;
    v44[4] = self;
    v45 = v34;
    v37 = v34;
    v35 = MEMORY[0x19400FE1C](v44);
    v36 = (void *)v35;
    if (a7 || a10)
      -[_IDSIDQueryController _requestStatusForDestinations:fromID:service:waitForReply:forceRefresh:bypassLimit:listenerID:completionBlock:](self, "_requestStatusForDestinations:fromID:service:waitForReply:forceRefresh:bypassLimit:listenerID:completionBlock:", v18, v20, v42, a9, a10, a11, v40, v35);
    else
      -[_IDSIDQueryController _requestCachedStatusForDestinations:fromID:service:waitForReply:respectExpiry:listenerID:completionBlock:](self, "_requestCachedStatusForDestinations:fromID:service:waitForReply:respectExpiry:listenerID:completionBlock:", v18, v20, v42, a9, v12, v40, v35);

    v22 = v43;
  }
  else
  {
    v38 = v21;
    v39 = v20;
    v24 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v51 = 0u;
    v52 = 0u;
    v53 = 0u;
    v54 = 0u;
    v41 = v18;
    v25 = v18;
    v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v51, v56, 16);
    if (v26)
    {
      v27 = v26;
      v28 = *(_QWORD *)v52;
      do
      {
        for (i = 0; i != v27; ++i)
        {
          if (*(_QWORD *)v52 != v28)
            objc_enumerationMutation(v25);
          v30 = *(_QWORD *)(*((_QWORD *)&v51 + 1) + 8 * i);
          -[_IDSIDQueryController _cachedStatusForDestination:service:](self, "_cachedStatusForDestination:service:", v30, v19);
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          if (v31)
            objc_msgSend(v24, "setObject:forKey:", v31, v30);

        }
        v27 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v51, v56, 16);
      }
      while (v27);
    }

    v32 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D13220]), "initWithSuccess:", v24);
    v22 = v43;
    v43[2](v43, v32);

    v20 = v39;
    v18 = v41;
    v21 = v38;
  }
LABEL_26:

}

- (BOOL)_refreshIDStatusForDestinations:(id)a3 service:(id)a4 preferredFromID:(id)a5 listenerID:(id)a6 allowRefresh:(BOOL)a7 respectExpiry:(BOOL)a8 waitForReply:(BOOL)a9 forceRefresh:(BOOL)a10 bypassLimit:(BOOL)a11 queue:(id)a12 completionBlock:(id)a13
{
  _BOOL8 v13;
  _BOOL8 v14;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  NSObject *v25;
  const char *v26;
  uint64_t v27;
  _BOOL8 v28;
  id v29;
  id v30;
  id v31;
  id v32;
  void *v33;
  BOOL v34;
  uint64_t v36;
  _QWORD v37[4];
  id v38;
  NSObject *v39;
  BOOL v40;
  uint8_t buf[16];

  v13 = a8;
  v14 = a7;
  v19 = a3;
  v20 = a4;
  v21 = a5;
  v22 = a6;
  v23 = a12;
  v24 = a13;
  if (!v24)
  {
    +[IDSLogging IDQuery](IDSLogging, "IDQuery");
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v26 = "No completion block, bailing...";
      goto LABEL_15;
    }
LABEL_16:
    v34 = 0;
    goto LABEL_17;
  }
  if (!v23 && !a9)
  {
    +[IDSLogging IDQuery](IDSLogging, "IDQuery");
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v26 = "No queue, bailing...";
LABEL_15:
      _os_log_impl(&dword_1906E0000, v25, OS_LOG_TYPE_DEFAULT, v26, buf, 2u);
      goto LABEL_16;
    }
    goto LABEL_16;
  }
  if (!objc_msgSend(v22, "length"))
  {
    +[IDSLogging IDQuery](IDSLogging, "IDQuery");
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v26 = "No listener ID, bailing...";
      goto LABEL_15;
    }
    goto LABEL_16;
  }
  if (!objc_msgSend(v19, "count"))
  {
    +[IDSLogging IDQuery](IDSLogging, "IDQuery");
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v26 = "No destinations, bailing...";
      goto LABEL_15;
    }
    goto LABEL_16;
  }
  v37[0] = MEMORY[0x1E0C809B0];
  v37[1] = 3221225472;
  v37[2] = sub_1907AEC28;
  v37[3] = &unk_1E2C64750;
  v40 = a9;
  v39 = v24;
  v38 = v23;
  v27 = MEMORY[0x19400FE1C](v37);
  v28 = v13;
  v29 = v22;
  v30 = v19;
  v31 = v21;
  v32 = v20;
  v33 = (void *)v27;
  *(_WORD *)((char *)&v36 + 1) = __PAIR16__(a11, a10);
  LOBYTE(v36) = a9;
  -[_IDSIDQueryController _idStatusForDestinations:service:preferredFromID:listenerID:allowRenew:respectExpiry:waitForReply:forceRefresh:bypassLimit:completionBlock:](self, "_idStatusForDestinations:service:preferredFromID:listenerID:allowRenew:respectExpiry:waitForReply:forceRefresh:bypassLimit:completionBlock:", v30, v32, v31, v29, v14, v28, v36, v27);

  v20 = v32;
  v21 = v31;
  v19 = v30;
  v22 = v29;

  v34 = 1;
  v25 = v39;
LABEL_17:

  return v34;
}

- (BOOL)_sync_refreshIDStatusForDestinations:(id)a3 service:(id)a4 preferredFromID:(id)a5 listenerID:(id)a6 completionBlock:(id)a7
{
  uint64_t v8;

  BYTE2(v8) = 0;
  LOWORD(v8) = 1;
  return -[_IDSIDQueryController _refreshIDStatusForDestinations:service:preferredFromID:listenerID:allowRefresh:respectExpiry:waitForReply:forceRefresh:bypassLimit:queue:completionBlock:](self, "_refreshIDStatusForDestinations:service:preferredFromID:listenerID:allowRefresh:respectExpiry:waitForReply:forceRefresh:bypassLimit:queue:completionBlock:", a3, a4, a5, a6, 1, 1, v8, 0, a7);
}

- (BOOL)_sync_currentIDStatusForDestinations:(id)a3 service:(id)a4 preferredFromID:(id)a5 respectExpiry:(BOOL)a6 listenerID:(id)a7 completionBlock:(id)a8
{
  _BOOL8 v9;
  id v14;
  id v15;
  uint64_t v17;
  _QWORD v18[4];
  id v19;

  v9 = a6;
  v14 = a8;
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = sub_1907AEDF0;
  v18[3] = &unk_1E2C628F8;
  v19 = v14;
  v15 = v14;
  BYTE2(v17) = 0;
  LOWORD(v17) = 1;
  LOBYTE(a7) = -[_IDSIDQueryController _refreshIDStatusForDestinations:service:preferredFromID:listenerID:allowRefresh:respectExpiry:waitForReply:forceRefresh:bypassLimit:queue:completionBlock:](self, "_refreshIDStatusForDestinations:service:preferredFromID:listenerID:allowRefresh:respectExpiry:waitForReply:forceRefresh:bypassLimit:queue:completionBlock:", a3, a4, a5, a7, 0, v9, v17, 0, v18);

  return (char)a7;
}

- (BOOL)_sync_currentRemoteDevicesForDestinations:(id)a3 service:(id)a4 preferredFromID:(id)a5 listenerID:(id)a6 completionBlock:(id)a7
{
  return -[_IDSIDQueryController _currentRemoteDevicesForDestinations:service:preferredFromID:listenerID:queue:waitForReply:completionBlock:completionBlockWithError:](self, "_currentRemoteDevicesForDestinations:service:preferredFromID:listenerID:queue:waitForReply:completionBlock:completionBlockWithError:", a3, a4, a5, a6, 0, 1, a7, 0);
}

- (BOOL)refreshIDStatusForDestinations:(id)a3 service:(id)a4 preferredFromID:(id)a5 listenerID:(id)a6 forceRefresh:(BOOL)a7 queue:(id)a8 completionBlock:(id)a9
{
  uint64_t v10;

  BYTE2(v10) = 0;
  BYTE1(v10) = a7;
  LOBYTE(v10) = 0;
  return -[_IDSIDQueryController _refreshIDStatusForDestinations:service:preferredFromID:listenerID:allowRefresh:respectExpiry:waitForReply:forceRefresh:bypassLimit:queue:completionBlock:](self, "_refreshIDStatusForDestinations:service:preferredFromID:listenerID:allowRefresh:respectExpiry:waitForReply:forceRefresh:bypassLimit:queue:completionBlock:", a3, a4, a5, a6, 1, 1, v10, a8, a9);
}

- (BOOL)refreshIDStatusForDestination:(id)a3 service:(id)a4 preferredFromID:(id)a5 listenerID:(id)a6 queue:(id)a7 completionBlock:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  id v21;
  id v22;
  id v23;
  _QWORD v25[4];
  id v26;
  id v27;
  id v28;

  v14 = a3;
  v15 = a4;
  v16 = a8;
  v17 = a7;
  v18 = a6;
  v19 = a5;
  IMSingleObjectArray();
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = sub_1907AF00C;
  v25[3] = &unk_1E2C64778;
  v27 = v15;
  v28 = v16;
  v26 = v14;
  v21 = v15;
  v22 = v14;
  v23 = v16;
  LOBYTE(self) = -[_IDSIDQueryController refreshIDStatusForDestinations:service:preferredFromID:listenerID:forceRefresh:queue:completionBlock:](self, "refreshIDStatusForDestinations:service:preferredFromID:listenerID:forceRefresh:queue:completionBlock:", v20, v21, v19, v18, 0, v17, v25);

  return (char)self;
}

- (BOOL)requiredIDStatusForDestinations:(id)a3 service:(id)a4 preferredFromID:(id)a5 listenerID:(id)a6 queue:(id)a7 completionBlock:(id)a8
{
  uint64_t v9;

  BYTE2(v9) = 1;
  LOWORD(v9) = 0;
  return -[_IDSIDQueryController _refreshIDStatusForDestinations:service:preferredFromID:listenerID:allowRefresh:respectExpiry:waitForReply:forceRefresh:bypassLimit:queue:completionBlock:](self, "_refreshIDStatusForDestinations:service:preferredFromID:listenerID:allowRefresh:respectExpiry:waitForReply:forceRefresh:bypassLimit:queue:completionBlock:", a3, a4, a5, a6, 1, 1, v9, a7, a8);
}

- (BOOL)requiredIDStatusForDestination:(id)a3 service:(id)a4 preferredFromID:(id)a5 listenerID:(id)a6 queue:(id)a7 completionBlock:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  id v21;
  id v22;
  _QWORD v24[4];
  id v25;
  id v26;

  v14 = a3;
  v15 = a8;
  v16 = a7;
  v17 = a6;
  v18 = a5;
  v19 = a4;
  IMSingleObjectArray();
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = sub_1907AF2CC;
  v24[3] = &unk_1E2C647A0;
  v25 = v14;
  v26 = v15;
  v21 = v14;
  v22 = v15;
  LOBYTE(self) = -[_IDSIDQueryController requiredIDStatusForDestinations:service:preferredFromID:listenerID:queue:completionBlock:](self, "requiredIDStatusForDestinations:service:preferredFromID:listenerID:queue:completionBlock:", v20, v19, v18, v17, v16, v24);

  return (char)self;
}

- (BOOL)currentIDStatusForDestinations:(id)a3 service:(id)a4 preferredFromID:(id)a5 respectExpiry:(BOOL)a6 listenerID:(id)a7 queue:(id)a8 completionBlock:(id)a9
{
  _BOOL8 v11;
  id v16;
  id v17;
  uint64_t v19;
  _QWORD v20[4];
  id v21;

  v11 = a6;
  v16 = a9;
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = sub_1907AF484;
  v20[3] = &unk_1E2C628F8;
  v21 = v16;
  v17 = v16;
  BYTE2(v19) = 0;
  LOWORD(v19) = 0;
  LOBYTE(a8) = -[_IDSIDQueryController _refreshIDStatusForDestinations:service:preferredFromID:listenerID:allowRefresh:respectExpiry:waitForReply:forceRefresh:bypassLimit:queue:completionBlock:](self, "_refreshIDStatusForDestinations:service:preferredFromID:listenerID:allowRefresh:respectExpiry:waitForReply:forceRefresh:bypassLimit:queue:completionBlock:", a3, a4, a5, a7, 0, v11, v19, a8, v20);

  return (char)a8;
}

- (BOOL)currentIDStatusForDestination:(id)a3 service:(id)a4 preferredFromID:(id)a5 respectExpiry:(BOOL)a6 listenerID:(id)a7 queue:(id)a8 completionBlock:(id)a9
{
  _BOOL8 v11;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  void *v21;
  id v22;
  id v23;
  _QWORD v25[4];
  id v26;
  id v27;

  v11 = a6;
  v15 = a3;
  v16 = a9;
  v17 = a8;
  v18 = a7;
  v19 = a5;
  v20 = a4;
  IMSingleObjectArray();
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = sub_1907AF638;
  v25[3] = &unk_1E2C647C8;
  v26 = v15;
  v27 = v16;
  v22 = v15;
  v23 = v16;
  LOBYTE(v11) = -[_IDSIDQueryController currentIDStatusForDestinations:service:preferredFromID:respectExpiry:listenerID:queue:completionBlock:](self, "currentIDStatusForDestinations:service:preferredFromID:respectExpiry:listenerID:queue:completionBlock:", v21, v20, v19, v11, v18, v17, v25);

  return v11;
}

- (BOOL)_currentRemoteDevicesForDestinations:(id)a3 service:(id)a4 preferredFromID:(id)a5 listenerID:(id)a6 queue:(id)a7 waitForReply:(BOOL)a8 completionBlock:(id)a9 completionBlockWithError:(id)a10
{
  _BOOL8 v10;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  id v31;
  id v32;
  id v33;
  _QWORD v34[5];
  id v35;
  BOOL v36;
  _QWORD v37[5];
  id v38;
  id v39;
  id v40;
  id v41;
  BOOL v42;

  v10 = a8;
  v16 = a6;
  v17 = a7;
  v18 = a9;
  v19 = a10;
  v37[0] = MEMORY[0x1E0C809B0];
  v37[1] = 3221225472;
  v37[2] = sub_1907AF894;
  v37[3] = &unk_1E2C64818;
  v37[4] = self;
  v38 = v16;
  v40 = v18;
  v41 = v19;
  v42 = v10;
  v39 = v17;
  v33 = v17;
  v32 = v19;
  v31 = v18;
  v20 = v16;
  v21 = a5;
  v22 = a4;
  v23 = a3;
  v24 = (void *)MEMORY[0x19400FE1C](v37);
  v34[0] = MEMORY[0x1E0C809B0];
  v34[1] = 3221225472;
  v34[2] = sub_1907AFE84;
  v34[3] = &unk_1E2C64728;
  v36 = v10;
  v34[4] = self;
  v35 = v24;
  v25 = v24;
  v26 = (void *)MEMORY[0x19400FE1C](v34);
  v27 = (void *)MEMORY[0x1E0D34D18];
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v23);
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v27, "destinationWithDestinations:", v28);
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  -[_IDSIDQueryController _requestRemoteDevicesForDestination:fromID:service:listenerID:waitForReply:completionBlock:](self, "_requestRemoteDevicesForDestination:fromID:service:listenerID:waitForReply:completionBlock:", v29, v21, v22, v20, v10, v26);
  return 1;
}

- (BOOL)currentRemoteDevicesForDestinations:(id)a3 service:(id)a4 preferredFromID:(id)a5 listenerID:(id)a6 queue:(id)a7 completionBlock:(id)a8
{
  return -[_IDSIDQueryController _currentRemoteDevicesForDestinations:service:preferredFromID:listenerID:queue:waitForReply:completionBlock:completionBlockWithError:](self, "_currentRemoteDevicesForDestinations:service:preferredFromID:listenerID:queue:waitForReply:completionBlock:completionBlockWithError:", a3, a4, a5, a6, a7, 0, a8, 0);
}

- (BOOL)currentRemoteDevicesForDestinations:(id)a3 service:(id)a4 preferredFromID:(id)a5 listenerID:(id)a6 queue:(id)a7 completionBlockWithError:(id)a8
{
  return -[_IDSIDQueryController _currentRemoteDevicesForDestinations:service:preferredFromID:listenerID:queue:waitForReply:completionBlock:completionBlockWithError:](self, "_currentRemoteDevicesForDestinations:service:preferredFromID:listenerID:queue:waitForReply:completionBlock:completionBlockWithError:", a3, a4, a5, a6, a7, 0, 0, a8);
}

- (BOOL)idInfoForDestinations:(id)a3 service:(id)a4 preferredFromID:(id)a5 infoTypes:(unint64_t)a6 options:(id)a7 listenerID:(id)a8 queue:(id)a9 completionBlock:(id)a10
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  id v30;
  _QWORD v32[5];
  id v33;
  id v34;
  id v35;
  id v36;

  v15 = a7;
  v16 = a8;
  v17 = a9;
  v18 = a10;
  v32[0] = MEMORY[0x1E0C809B0];
  v32[1] = 3221225472;
  v32[2] = sub_1907B01AC;
  v32[3] = &unk_1E2C64890;
  v32[4] = self;
  v33 = v16;
  v35 = v17;
  v36 = v18;
  v34 = v15;
  v19 = v17;
  v20 = v15;
  v30 = v18;
  v21 = v16;
  v22 = a5;
  v23 = a4;
  v24 = a3;
  v25 = (void *)MEMORY[0x19400FE1C](v32);
  v26 = (void *)MEMORY[0x1E0D34D18];
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v24);
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v26, "destinationWithDestinations:", v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  -[_IDSIDQueryController _requestIDInfoForDestinations:fromID:service:infoTypes:options:listenerID:queue:completionBlock:](self, "_requestIDInfoForDestinations:fromID:service:infoTypes:options:listenerID:queue:completionBlock:", v28, v22, v23, a6, v20, v21, v19, v25);
  return 1;
}

- (BOOL)_hasCacheForService:(id)a3
{
  return self->_idStatusCache != 0;
}

- (int64_t)_currentCachedIDStatusForDestination:(id)a3 service:(id)a4 listenerID:(id)a5
{
  void *v5;
  int64_t v6;

  -[_IDSIDQueryController _cachedStatusForDestination:service:](self, "_cachedStatusForDestination:service:", a3, a4, a5);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "integerValue");

  return v6;
}

- (BOOL)_warmupQueryCacheForService:(id)a3
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  NSObject *v7;
  _QWORD v9[5];
  id v10;
  uint8_t buf[4];
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  +[IDSLogging IDQuery](IDSLogging, "IDQuery");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v12 = v4;
    _os_log_impl(&dword_1906E0000, v5, OS_LOG_TYPE_DEFAULT, "_warmupQueryCacheForService:  (service: %@)", buf, 0xCu);
  }

  v6 = objc_msgSend(v4, "length");
  if (v6)
  {
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = sub_1907B08A0;
    v9[3] = &unk_1E2C648B8;
    v9[4] = self;
    v10 = v4;
    -[_IDSIDQueryController _requestCacheForService:completionBlock:](self, "_requestCacheForService:completionBlock:", v10, v9);

  }
  else
  {
    +[IDSLogging IDQuery](IDSLogging, "IDQuery");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1906E0000, v7, OS_LOG_TYPE_DEFAULT, "No service name, bailing...", buf, 2u);
    }

  }
  return v6 != 0;
}

- (BOOL)_flushQueryCacheForService:(id)a3
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  NSObject *p_super;
  int v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  +[IDSLogging IDQuery](IDSLogging, "IDQuery");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 138412290;
    v10 = v4;
    _os_log_impl(&dword_1906E0000, v5, OS_LOG_TYPE_DEFAULT, "_flushQueryCacheForService:  (service: %@)", (uint8_t *)&v9, 0xCu);
  }

  v6 = objc_msgSend(v4, "length");
  if (v6)
  {
    p_super = &self->_idStatusCache->super.super;
    self->_idStatusCache = 0;
  }
  else
  {
    +[IDSLogging IDQuery](IDSLogging, "IDQuery");
    p_super = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(p_super, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v9) = 0;
      _os_log_impl(&dword_1906E0000, p_super, OS_LOG_TYPE_DEFAULT, "No service name, bailing...", (uint8_t *)&v9, 2u);
    }
  }

  return v6 != 0;
}

- (void)removeDelegate:(id)a3 forService:(id)a4 listenerID:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  NSMutableDictionary *listeners;
  NSObject *v17;
  void *v18;
  int v19;
  id v20;
  __int16 v21;
  id v22;
  __int16 v23;
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  +[IDSLogging IDQuery](IDSLogging, "IDQuery");
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v19 = 134218498;
    v20 = v8;
    v21 = 2112;
    v22 = v9;
    v23 = 2112;
    v24 = v10;
    _os_log_impl(&dword_1906E0000, v11, OS_LOG_TYPE_DEFAULT, "removeDelegate:forService:listenerID:  (delegate: %p)   (service: %@)   (listenerID: %@)", (uint8_t *)&v19, 0x20u);
  }

  if (v8 && objc_msgSend(v9, "length") && objc_msgSend(v10, "length"))
  {
    -[NSMutableDictionary objectForKey:](self->_listeners, "objectForKey:", v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "mutableCopy");

    -[NSObject objectForKey:](v13, "objectForKey:", v9);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v14;
    if (v13 && v14)
    {
      objc_msgSend(v14, "removeObjectForKey:", v8);
      if (!objc_msgSend(v15, "count"))
        -[NSObject removeObjectForKey:](v13, "removeObjectForKey:", v9);
      if (!-[NSObject count](v13, "count"))
        -[NSMutableDictionary removeObjectForKey:](self->_listeners, "removeObjectForKey:", v10);
      if (!-[NSMutableDictionary count](self->_listeners, "count"))
      {
        listeners = self->_listeners;
        self->_listeners = 0;

      }
      +[IDSLogging IDQuery](IDSLogging, "IDQuery");
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        -[NSMutableDictionary allKeys](self->_listeners, "allKeys");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = 138412290;
        v20 = v18;
        _os_log_impl(&dword_1906E0000, v17, OS_LOG_TYPE_DEFAULT, "Listeners after REMOVE %@", (uint8_t *)&v19, 0xCu);

      }
    }

  }
  else
  {
    +[IDSLogging IDQuery](IDSLogging, "IDQuery");
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v19) = 0;
      _os_log_impl(&dword_1906E0000, v13, OS_LOG_TYPE_DEFAULT, "Invalid remove delegate params -- bailing...", (uint8_t *)&v19, 2u);
    }
  }

}

- (void)ktPeerVerificationResultsUpdated:(id)a3 forService:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  NSObject *v17;
  _BOOL4 v18;
  id v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t v23;
  __int128 buf;
  Class (*v25)(uint64_t);
  void *v26;
  uint64_t *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = (void *)MEMORY[0x1E0CB3710];
  v9 = (void *)MEMORY[0x1E0C99E60];
  v10 = objc_opt_class();
  v11 = objc_opt_class();
  v20 = 0;
  v21 = &v20;
  v22 = 0x2050000000;
  v12 = (void *)qword_1ECDD65A8;
  v23 = qword_1ECDD65A8;
  if (!qword_1ECDD65A8)
  {
    *(_QWORD *)&buf = MEMORY[0x1E0C809B0];
    *((_QWORD *)&buf + 1) = 3221225472;
    v25 = sub_1907B1014;
    v26 = &unk_1E2C602E0;
    v27 = &v20;
    sub_1907B1014((uint64_t)&buf);
    v12 = (void *)v21[3];
  }
  v13 = objc_retainAutorelease(v12);
  _Block_object_dispose(&v20, 8);
  objc_msgSend(v9, "setWithObjects:", v10, v11, v13, 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = 0;
  objc_msgSend(v8, "unarchivedObjectOfClasses:fromData:error:", v14, v6, &v19);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v19;

  +[IDSLogging IDQuery](IDSLogging, "IDQuery");
  v17 = objc_claimAutoreleasedReturnValue();
  v18 = os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT);
  if (v16)
  {
    if (v18)
    {
      LODWORD(buf) = 138412290;
      *(_QWORD *)((char *)&buf + 4) = v16;
      _os_log_impl(&dword_1906E0000, v17, OS_LOG_TYPE_DEFAULT, "Error unarchiving resultData -- dropping { unarchiveError: %@ }", (uint8_t *)&buf, 0xCu);
    }

  }
  else
  {
    if (v18)
    {
      LODWORD(buf) = 138412290;
      *(_QWORD *)((char *)&buf + 4) = v15;
      _os_log_impl(&dword_1906E0000, v17, OS_LOG_TYPE_DEFAULT, "Successfully unarchived results: %@", (uint8_t *)&buf, 0xCu);
    }

    -[_IDSIDQueryController _callDelegatesForService:destinationToVerifierResult:](self, "_callDelegatesForService:destinationToVerifierResult:", v7, v15);
  }

}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_delegateContext, 0);
  objc_storeStrong((id *)&self->_listenerIDToServicesMap, 0);
  objc_storeStrong((id *)&self->_delegateToInfo, 0);
  objc_storeStrong((id *)&self->_serviceToken, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_connectionQueue, 0);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_transactionIDToBlockMap, 0);
  objc_storeStrong((id *)&self->_idStatusCache, 0);
  objc_storeStrong((id *)&self->_listeners, 0);
  objc_storeStrong((id *)&self->_listenerGUID, 0);
}

@end
