@implementation TVRIntentExtensionDeviceManager

+ (id)sharedInstance
{
  if (sharedInstance_onceToken != -1)
    dispatch_once(&sharedInstance_onceToken, &__block_literal_global_0);
  return (id)sharedInstance_sharedInstance;
}

void __49__TVRIntentExtensionDeviceManager_sharedInstance__block_invoke(id a1)
{
  TVRIntentExtensionDeviceManager *v1;
  void *v2;

  v1 = objc_alloc_init(TVRIntentExtensionDeviceManager);
  v2 = (void *)sharedInstance_sharedInstance;
  sharedInstance_sharedInstance = (uint64_t)v1;

}

- (TVRIntentExtensionDeviceManager)init
{
  TVRIntentExtensionDeviceManager *v2;
  TVRIntentExtensionDeviceManager *v3;
  NSMutableDictionary *v4;
  NSMutableDictionary *attemptedConnectionDict;
  NSMutableSet *v6;
  NSMutableSet *cachedDevices;
  uint64_t v8;
  NSMapTable *identifierToHandlerMapping;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)TVRIntentExtensionDeviceManager;
  v2 = -[TVRIntentExtensionDeviceManager init](&v11, "init");
  v3 = v2;
  if (v2)
  {
    v2->_defaultTimeout = 8.0;
    v4 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    attemptedConnectionDict = v3->_attemptedConnectionDict;
    v3->_attemptedConnectionDict = v4;

    v6 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
    cachedDevices = v3->_cachedDevices;
    v3->_cachedDevices = v6;

    v8 = objc_claimAutoreleasedReturnValue(+[NSMapTable mapTableWithKeyOptions:valueOptions:](NSMapTable, "mapTableWithKeyOptions:valueOptions:", 0x10000, 0x10000));
    identifierToHandlerMapping = v3->_identifierToHandlerMapping;
    v3->_identifierToHandlerMapping = (NSMapTable *)v8;

  }
  return v3;
}

- (void)dealloc
{
  id v3;
  NSObject *v4;
  NSMutableSet *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *i;
  void *v10;
  objc_super v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  uint8_t v16[128];
  uint8_t buf[4];
  const char *v18;

  v3 = _TVRIntentExtensionLog();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v18 = "-[TVRIntentExtensionDeviceManager dealloc]";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  +[NSObject cancelPreviousPerformRequestsWithTarget:](NSObject, "cancelPreviousPerformRequestsWithTarget:", self);
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v5 = self->_cachedDevices;
  v6 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v10, "setDelegate:", 0);
        objc_msgSend(v10, "disconnectWithType:", 0);
      }
      v7 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v7);
  }

  v11.receiver = self;
  v11.super_class = (Class)TVRIntentExtensionDeviceManager;
  -[TVRIntentExtensionDeviceManager dealloc](&v11, "dealloc");
}

- (void)resolveDeviceWithIdentifier:(id)a3 handler:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  id v10;
  NSObject *v11;
  _QWORD block[5];
  id v13;
  id v14;

  v6 = a3;
  v7 = a4;
  if (v6)
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = __71__TVRIntentExtensionDeviceManager_resolveDeviceWithIdentifier_handler___block_invoke;
    block[3] = &unk_100010578;
    block[4] = self;
    v13 = v6;
    v14 = v7;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

  }
  else
  {
    v8 = TVRCMakeError(103, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    v10 = _TVRIntentExtensionLog();
    v11 = objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      -[TVRIntentExtensionDeviceManager resolveDeviceWithIdentifier:handler:].cold.1((uint64_t)v9, v11);

    (*((void (**)(id, _QWORD, void *))v7 + 2))(v7, 0, v9);
  }

}

void __71__TVRIntentExtensionDeviceManager_resolveDeviceWithIdentifier_handler___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  NSObject *v5;
  uint64_t v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  int v13;
  void *v14;
  __int16 v15;
  uint64_t v16;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "_cachedDeviceForIdentifier:", *(_QWORD *)(a1 + 40)));
  v3 = v2;
  if (v2 && objc_msgSend(v2, "connectionState") == (id)2)
  {
    v4 = _TVRIntentExtensionLog();
    v5 = objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = *(_QWORD *)(a1 + 40);
      v13 = 138543618;
      v14 = v3;
      v15 = 2114;
      v16 = v6;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Found connected device=%{public}@,  identifier=%{public}@", (uint8_t *)&v13, 0x16u);
    }

    +[NSObject cancelPreviousPerformRequestsWithTarget:selector:object:](NSObject, "cancelPreviousPerformRequestsWithTarget:selector:object:", *(_QWORD *)(a1 + 32), "_disconnectDeviceWithID:", *(_QWORD *)(a1 + 40));
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
    objc_msgSend(*(id *)(a1 + 32), "performSelector:withObject:afterDelay:", "_disconnectDeviceWithID:", *(_QWORD *)(a1 + 40), *(double *)(*(_QWORD *)(a1 + 32) + 8));
  }
  else
  {
    v7 = _TVRIntentExtensionLog();
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9 = *(void **)(a1 + 40);
      v13 = 138543362;
      v14 = v9;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "No existing device with identifier=%{public}@. Starting search for device...", (uint8_t *)&v13, 0xCu);
    }

    if (v3)
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "removeObject:", v3);
    v10 = *(void **)(*(_QWORD *)(a1 + 32) + 32);
    v11 = objc_retainBlock(*(id *)(a1 + 48));
    objc_msgSend(v10, "setObject:forKey:", v11, *(_QWORD *)(a1 + 40));

    v12 = objc_msgSend(objc_alloc((Class)TVRCDevice), "initWithDeviceIdentifier:", *(_QWORD *)(a1 + 40));
    objc_msgSend(v12, "setDelegate:", *(_QWORD *)(a1 + 32));
    objc_msgSend(v12, "connect");
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "setObject:forKey:", v12, *(_QWORD *)(a1 + 40));

  }
}

- (id)_cachedDeviceForIdentifier:(id)a3
{
  id v4;
  NSMutableSet *v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];

  v4 = a3;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v5 = self->_cachedDevices;
  v6 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v12;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * (_QWORD)i);
        if ((objc_msgSend(v9, "containsIdentifier:", v4, (_QWORD)v11) & 1) != 0)
        {
          v6 = v9;
          goto LABEL_11;
        }
      }
      v6 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_11:

  return v6;
}

- (void)_disconnectDeviceWithID:(id)a3
{
  char *v4;
  id v5;
  NSObject *v6;
  char *v7;
  id v8;
  NSObject *v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  int v17;
  const char *v18;
  __int16 v19;
  char *v20;

  v4 = (char *)a3;
  v5 = _TVRIntentExtensionLog();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v17 = 136315394;
    v18 = "-[TVRIntentExtensionDeviceManager _disconnectDeviceWithID:]";
    v19 = 2114;
    v20 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%s, identifier=%{public}@", (uint8_t *)&v17, 0x16u);
  }

  v7 = (char *)objc_claimAutoreleasedReturnValue(-[TVRIntentExtensionDeviceManager _cachedDeviceForIdentifier:](self, "_cachedDeviceForIdentifier:", v4));
  v8 = _TVRIntentExtensionLog();
  v9 = objc_claimAutoreleasedReturnValue(v8);
  v10 = v9;
  if (v7)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v17 = 138543618;
      v18 = v4;
      v19 = 2114;
      v20 = v7;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Found cached device with identifier=%{public}@,  device=%{public}@. Calling disconnect with type [TVRCDisconnectTypeUserInititated] on the device...", (uint8_t *)&v17, 0x16u);
    }

    objc_msgSend(v7, "setDelegate:", 0);
    objc_msgSend(v7, "disconnectWithType:", 0);
    -[NSMutableSet removeObject:](self->_cachedDevices, "removeObject:", v7);
  }
  else
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[TVRIntentExtensionDeviceManager _disconnectDeviceWithID:].cold.1((uint64_t)v4, v10, v11, v12, v13, v14, v15, v16);

  }
  -[NSMapTable removeObjectForKey:](self->_identifierToHandlerMapping, "removeObjectForKey:", v4);

}

- (void)deviceConnected:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  void *v7;
  void (**v8)(_QWORD, _QWORD, _QWORD);
  NSMutableDictionary *attemptedConnectionDict;
  void *v10;
  id v11;
  NSObject *v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  int v20;
  const char *v21;
  __int16 v22;
  id v23;

  v4 = a3;
  v5 = _TVRIntentExtensionLog();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v20 = 136315394;
    v21 = "-[TVRIntentExtensionDeviceManager deviceConnected:]";
    v22 = 2114;
    v23 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%s, device=%{public}@", (uint8_t *)&v20, 0x16u);
  }

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "identifier"));
  v8 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue(-[NSMapTable objectForKey:](self->_identifierToHandlerMapping, "objectForKey:", v7));
  -[NSMutableSet addObject:](self->_cachedDevices, "addObject:", v4);
  attemptedConnectionDict = self->_attemptedConnectionDict;
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "identifier"));
  -[NSMutableDictionary removeObjectForKey:](attemptedConnectionDict, "removeObjectForKey:", v10);

  v11 = _TVRIntentExtensionLog();
  v12 = objc_claimAutoreleasedReturnValue(v11);
  v13 = v12;
  if (v8)
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v20 = 138543362;
      v21 = (const char *)v4;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Calling handler for device=%{public}@", (uint8_t *)&v20, 0xCu);
    }

    ((void (**)(_QWORD, id, _QWORD))v8)[2](v8, v4, 0);
    -[NSMapTable removeObjectForKey:](self->_identifierToHandlerMapping, "removeObjectForKey:", v7);
    -[TVRIntentExtensionDeviceManager performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", "_disconnectDeviceWithID:", v7, self->_defaultTimeout);
  }
  else
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      -[TVRIntentExtensionDeviceManager deviceConnected:].cold.1((uint64_t)v4, v13, v14, v15, v16, v17, v18, v19);

  }
}

- (void)device:(id)a3 disconnectedForReason:(int64_t)a4 error:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  NSMapTable *identifierToHandlerMapping;
  void *v13;
  void (**v14)(_QWORD, _QWORD, _QWORD);
  id v15;
  NSObject *v16;
  NSObject *v17;
  NSMapTable *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  void *v26;
  int v27;
  const char *v28;
  __int16 v29;
  id v30;
  __int16 v31;
  int64_t v32;
  __int16 v33;
  id v34;

  v8 = a3;
  v9 = a5;
  v10 = _TVRIntentExtensionLog();
  v11 = objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v27 = 136315906;
    v28 = "-[TVRIntentExtensionDeviceManager device:disconnectedForReason:error:]";
    v29 = 2114;
    v30 = v8;
    v31 = 2048;
    v32 = a4;
    v33 = 2114;
    v34 = v9;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%s, device=%{public}@, reason=%ld, error=%{public}@", (uint8_t *)&v27, 0x2Au);
  }

  identifierToHandlerMapping = self->_identifierToHandlerMapping;
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "identifier"));
  v14 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue(-[NSMapTable objectForKey:](identifierToHandlerMapping, "objectForKey:", v13));

  v15 = _TVRIntentExtensionLog();
  v16 = objc_claimAutoreleasedReturnValue(v15);
  v17 = v16;
  if (v14)
  {
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      v27 = 138543618;
      v28 = (const char *)v8;
      v29 = 2114;
      v30 = v9;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Calling handler for device=%{public}@, error=%{public}@", (uint8_t *)&v27, 0x16u);
    }

    ((void (**)(_QWORD, _QWORD, id))v14)[2](v14, 0, v9);
    v18 = self->_identifierToHandlerMapping;
    v17 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "identifier"));
    -[NSMapTable removeObjectForKey:](v18, "removeObjectForKey:", v17);
  }
  else if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
  {
    -[TVRIntentExtensionDeviceManager deviceConnected:].cold.1((uint64_t)v8, v17, v19, v20, v21, v22, v23, v24);
  }

  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "identifier"));
  v26 = (void *)objc_claimAutoreleasedReturnValue(-[TVRIntentExtensionDeviceManager _cachedDeviceForIdentifier:](self, "_cachedDeviceForIdentifier:", v25));

  if (v26)
    -[NSMutableSet removeObject:](self->_cachedDevices, "removeObject:", v26);

}

- (double)defaultTimeout
{
  return self->_defaultTimeout;
}

- (void)setDefaultTimeout:(double)a3
{
  self->_defaultTimeout = a3;
}

- (NSMutableSet)cachedDevices
{
  return self->_cachedDevices;
}

- (void)setCachedDevices:(id)a3
{
  objc_storeStrong((id *)&self->_cachedDevices, a3);
}

- (NSMutableDictionary)attemptedConnectionDict
{
  return self->_attemptedConnectionDict;
}

- (void)setAttemptedConnectionDict:(id)a3
{
  objc_storeStrong((id *)&self->_attemptedConnectionDict, a3);
}

- (NSMapTable)identifierToHandlerMapping
{
  return self->_identifierToHandlerMapping;
}

- (void)setIdentifierToHandlerMapping:(id)a3
{
  objc_storeStrong((id *)&self->_identifierToHandlerMapping, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifierToHandlerMapping, 0);
  objc_storeStrong((id *)&self->_attemptedConnectionDict, 0);
  objc_storeStrong((id *)&self->_cachedDevices, 0);
}

- (void)resolveDeviceWithIdentifier:(uint64_t)a1 handler:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  const char *v3;
  __int16 v4;
  uint64_t v5;

  v2 = 136315394;
  v3 = "-[TVRIntentExtensionDeviceManager resolveDeviceWithIdentifier:handler:]";
  v4 = 2114;
  v5 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Invalid identifier passed into %s, error=%{public}@", (uint8_t *)&v2, 0x16u);
  OUTLINED_FUNCTION_3();
}

- (void)_disconnectDeviceWithID:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_2((void *)&_mh_execute_header, a2, a3, "No cached device found with identifier=%{public}@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_3();
}

- (void)deviceConnected:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_2((void *)&_mh_execute_header, a2, a3, "No handler found for device=%{public}@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_3();
}

@end
