@implementation CSXPCConnection

- (BOOL)handleMessage:(id)a3 type:(_xpc_type_s *)a4 connection:(id)a5
{
  id v8;
  _xpc_connection_s *v9;
  const char *string;
  const char *v11;
  NSObject *v12;
  _BOOL4 v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  _xpc_connection_s *v18;
  xpc_object_t v19;
  void *v20;
  id v21;
  _xpc_connection_s *v22;
  xpc_object_t v23;
  void *v24;
  BOOL v25;
  _xpc_connection_s *v27;
  xpc_object_t reply;

  v8 = a3;
  v9 = (_xpc_connection_s *)a5;
  if (a4 == (_xpc_type_s *)MEMORY[0x1E0C812F8])
  {
    string = xpc_dictionary_get_string(v8, "command");
    if (!string)
      goto LABEL_20;
    v11 = string;
    logForCSLogCategoryDefault();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      -[CSXPCConnection handleMessage:type:connection:].cold.1((int)v11, v9);

    v13 = -[CSXPCConnection handleCommand:info:connection:](self, "handleCommand:info:connection:", v11, v8, v9);
    if (!v13 && !strncmp(v11, "test", 4uLL))
    {
      xpc_dictionary_get_remote_connection(v8);
      v27 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
      reply = xpc_dictionary_create_reply(v8);
      xpc_connection_send_message(v27, reply);

    }
    else if (!strncmp(v11, "checkin", 7uLL))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v11);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "componentsSeparatedByString:", CFSTR(":"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v15, "firstObject");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v16, "isEqualToString:", CFSTR("checkin"));

      if (v17)
      {
        xpc_dictionary_get_remote_connection(v8);
        v18 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
        v19 = xpc_dictionary_create_reply(v8);
        v20 = v19;
        if (v18 && v19)
        {
          if ((unint64_t)objc_msgSend(v15, "count") >= 2)
          {
            objc_msgSend(v15, "objectAtIndexedSubscript:", 1);
            v21 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
            xpc_dictionary_set_string(v20, "reply_string", (const char *)objc_msgSend(v21, "UTF8String"));

          }
          xpc_dictionary_set_int64(v20, "status", 0);
          xpc_connection_send_message(v18, v20);
        }

        v13 = 1;
      }

      if (!v13)
        goto LABEL_20;
    }
    else if (!v13)
    {
LABEL_20:
      xpc_dictionary_get_remote_connection(v8);
      v22 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
      v23 = xpc_dictionary_create_reply(v8);
      v24 = v23;
      if (v22 && v23)
      {
        xpc_dictionary_set_int64(v23, "status", -1);
        xpc_connection_send_message(v22, v24);
      }

      goto LABEL_24;
    }
    v25 = 1;
    goto LABEL_25;
  }
  if (a4 == (_xpc_type_s *)MEMORY[0x1E0C81310])
    -[CSXPCConnection _lostClientConnection:error:](self, "_lostClientConnection:error:", v9, v8);
LABEL_24:
  v25 = 0;
LABEL_25:

  return v25;
}

+ (id)copyNSStringArrayFromXPCArray:(id)a3
{
  id v3;
  void *v4;
  size_t count;
  void *v6;
  id v7;
  _QWORD applier[4];
  id v10;

  v3 = a3;
  v4 = v3;
  if (v3 && (count = xpc_array_get_count(v3)) != 0)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", count);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    applier[0] = MEMORY[0x1E0C809B0];
    applier[1] = 3221225472;
    applier[2] = __49__CSXPCConnection_copyNSStringArrayFromXPCArray___block_invoke;
    applier[3] = &unk_1E2404798;
    v7 = v6;
    v10 = v7;
    xpc_array_apply(v4, applier);

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

+ (id)copyNSStringForKey:(const char *)a3 fromXPCDictionary:(id)a4
{
  id result;

  result = (id)xpc_dictionary_get_string(a4, a3);
  if (result)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", result);
    return (id)objc_claimAutoreleasedReturnValue();
  }
  return result;
}

+ (id)copyNSStringOrDictArrayFromXPCArray:(id)a3
{
  id v4;
  void *v5;
  size_t count;
  void *v7;
  id v8;
  _QWORD v10[4];
  id v11;
  id v12;

  v4 = a3;
  v5 = v4;
  if (v4 && (count = xpc_array_get_count(v4)) != 0)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", count);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __55__CSXPCConnection_copyNSStringOrDictArrayFromXPCArray___block_invoke;
    v10[3] = &unk_1E24047E8;
    v8 = v7;
    v11 = v8;
    v12 = a1;
    xpc_array_apply(v5, v10);

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

+ (id)copyNSDataForKey:(const char *)a3 fromXPCDictionary:(id)a4
{
  id result;
  size_t length;

  length = 0;
  result = (id)xpc_dictionary_get_data(a4, a3, &length);
  if (result)
  {
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", result, length);
    return (id)objc_claimAutoreleasedReturnValue();
  }
  return result;
}

+ (void)dictionary:(id)a3 setStringArray:(id)a4 forKey:(const char *)a5
{
  id v7;
  id v8;
  xpc_object_t v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  const char *v16;
  xpc_object_t v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  if (objc_msgSend(v8, "count"))
  {
    v9 = xpc_array_create(0, 0);
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    v10 = v8;
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v19;
      do
      {
        v14 = 0;
        do
        {
          if (*(_QWORD *)v19 != v13)
            objc_enumerationMutation(v10);
          v15 = objc_retainAutorelease(*(id *)(*((_QWORD *)&v18 + 1) + 8 * v14));
          v16 = (const char *)objc_msgSend(v15, "UTF8String", (_QWORD)v18);
          if (v16)
          {
            v17 = xpc_string_create(v16);
            xpc_array_append_value(v9, v17);

          }
          ++v14;
        }
        while (v12 != v14);
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      }
      while (v12);
    }

    xpc_dictionary_set_value(v7, a5, v9);
  }

}

uint64_t __49__CSXPCConnection_copyNSStringArrayFromXPCArray___block_invoke(uint64_t a1, int a2, xpc_object_t xstring)
{
  const char *string_ptr;
  void *v5;
  void *v6;

  string_ptr = xpc_string_get_string_ptr(xstring);
  if (string_ptr)
  {
    v5 = *(void **)(a1 + 32);
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", string_ptr);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v6);

  }
  return 1;
}

- (BOOL)previouslyInitialized
{
  return self->_previouslyInitialized;
}

+ (void)dictionary:(id)a3 setStringOrDictionaryArray:(id)a4 forKey:(const char *)a5
{
  id v8;
  id v9;
  xpc_object_t empty;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  void *v18;
  const char *v19;
  void *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  if (objc_msgSend(v9, "count"))
  {
    v19 = a5;
    v20 = v8;
    objc_opt_class();
    objc_opt_class();
    empty = xpc_array_create_empty();
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    v11 = v9;
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v22;
      do
      {
        v15 = 0;
        do
        {
          if (*(_QWORD *)v22 != v14)
            objc_enumerationMutation(v11);
          v16 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * v15);
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v17 = (const char *)objc_msgSend(objc_retainAutorelease(v16), "UTF8String");
            if (v17)
              xpc_array_set_string(empty, 0xFFFFFFFFFFFFFFFFLL, v17);
          }
          else
          {
            if ((objc_opt_isKindOfClass() & 1) == 0)
              +[CSXPCConnection dictionary:setStringOrDictionaryArray:forKey:].cold.1();
            objc_msgSend(a1, "constructDictionary:", v16);
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            xpc_array_set_value(empty, 0xFFFFFFFFFFFFFFFFLL, v18);

          }
          ++v15;
        }
        while (v13 != v15);
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
      }
      while (v13);
    }

    v8 = v20;
    xpc_dictionary_set_value(v20, v19, empty);

  }
}

+ (BOOL)journalEnabled
{
  if (gJournalEnabled)
    return isAppleInternalInstall();
  else
    return 0;
}

void __29__CSXPCConnection_connection__block_invoke(uint64_t a1)
{
  id *v2;
  id *WeakRetained;
  id *v4;
  BOOL v5;
  id v6;
  const char *v7;
  NSObject *v8;
  xpc_connection_t mach_service;
  uint64_t v10;
  void *v11;
  _xpc_connection_s *v12;
  NSObject *v13;
  _xpc_connection_s *v14;
  void *v15;
  _QWORD handler[5];
  id v17;
  _QWORD v18[3];

  v18[2] = *MEMORY[0x1E0C80C00];
  v2 = (id *)(a1 + 40);
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  v4 = WeakRetained;
  if (WeakRetained)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), WeakRetained[5]);
    if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40))
    {
      v5 = *((_BYTE *)v4 + 8) == 0;
      objc_msgSend(v4, "serviceName");
      v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v7 = (const char *)objc_msgSend(v6, "UTF8String");
      objc_msgSend(v4, "queue");
      v8 = objc_claimAutoreleasedReturnValue();
      if (v5)
        mach_service = xpc_connection_create(v7, v8);
      else
        mach_service = xpc_connection_create_mach_service(v7, v8, 0);
      v10 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
      v11 = *(void **)(v10 + 40);
      *(_QWORD *)(v10 + 40) = mach_service;

      v12 = *(_xpc_connection_s **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
      objc_msgSend(v4, "queue");
      v13 = objc_claimAutoreleasedReturnValue();
      xpc_connection_set_target_queue(v12, v13);

      v14 = *(_xpc_connection_s **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
      handler[0] = MEMORY[0x1E0C809B0];
      handler[1] = 3221225472;
      handler[2] = __29__CSXPCConnection_connection__block_invoke_2;
      handler[3] = &unk_1E2404720;
      objc_copyWeak(&v17, v2);
      handler[4] = v4;
      xpc_connection_set_event_handler(v14, handler);
      if (*((_BYTE *)v4 + 8) && v4[3])
      {
        v18[0] = 0;
        v18[1] = 0;
        v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", v4[3]);
        objc_msgSend(v15, "getUUIDBytes:", v18);

        xpc_connection_set_instance();
      }
      if (*((_BYTE *)v4 + 10))
        xpc_connection_set_non_launching();
      objc_storeStrong(v4 + 5, *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40));
      xpc_connection_activate(*(xpc_connection_t *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40));
      objc_destroyWeak(&v17);
    }
  }

}

- (void)sendMessageAsync:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  BOOL v8;
  _xpc_connection_s *v9;
  NSObject *v10;
  id v11;
  _QWORD handler[5];
  id v13;
  BOOL v14;

  v6 = a3;
  v7 = a4;
  v8 = !self->_previouslyInitialized && xpc_dictionary_get_string(v6, "p") == 0;
  -[CSXPCConnection connection](self, "connection");
  v9 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
  -[CSXPCConnection queue](self, "queue");
  v10 = objc_claimAutoreleasedReturnValue();
  handler[0] = MEMORY[0x1E0C809B0];
  handler[1] = 3221225472;
  handler[2] = __47__CSXPCConnection_sendMessageAsync_completion___block_invoke;
  handler[3] = &unk_1E2404770;
  v14 = v8;
  handler[4] = self;
  v13 = v7;
  v11 = v7;
  xpc_connection_send_message_with_reply(v9, v6, v10, handler);

}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (OS_xpc_object)connection
{
  void (**v4)(_QWORD);
  id v5;
  _QWORD aBlock[5];
  id v7;
  id location;
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  id v14;

  if (self->_listener)
    return self->_connection;
  v9 = 0;
  v10 = &v9;
  v11 = 0x3032000000;
  v12 = __Block_byref_object_copy__8;
  v13 = __Block_byref_object_dispose__8;
  v14 = 0;
  location = 0;
  objc_initWeak(&location, self);
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __29__CSXPCConnection_connection__block_invoke;
  aBlock[3] = &unk_1E2404748;
  objc_copyWeak(&v7, &location);
  aBlock[4] = &v9;
  v4 = (void (**)(_QWORD))_Block_copy(aBlock);
  if (dispatch_get_specific("csXPCConnectionQueue") == self)
    v4[2](v4);
  else
    dispatch_sync((dispatch_queue_t)self->_queue, v4);
  v5 = (id)v10[5];

  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
  _Block_object_dispose(&v9, 8);

  return (OS_xpc_object *)v5;
}

- (NSString)serviceName
{
  return self->_serviceName;
}

void __29__CSXPCConnection_connection__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  id WeakRetained;
  void *v7;

  v3 = a2;
  logForCSLogCategoryQuery();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    __29__CSXPCConnection_connection__block_invoke_2_cold_1();

  v5 = MEMORY[0x18D7829C8](v3);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v7 = WeakRetained;
  if (v5 == MEMORY[0x1E0C812F8])
  {
    objc_msgSend(WeakRetained, "handleReply:", v3);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "setPreviouslyInitialized:", 0);
    objc_msgSend(v7, "handleError:", v3);
  }

}

+ (id)dataWrapperForKey:(const char *)a3 sizeKey:(const char *)a4 fromXPCDictionary:(id)a5 allowWritableSharedMemory:(BOOL)a6
{
  _BOOL8 v6;
  id v9;
  void *v10;
  CSDataWrapper *v11;
  void *v12;
  CSDataWrapper *data;
  uint64_t uint64;
  CSDataWrapper *v15;
  void *v16;
  size_t length;

  v6 = a6;
  v9 = a5;
  xpc_dictionary_get_value(v9, a3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    v11 = [CSDataWrapper alloc];
    xpc_dictionary_get_value(v9, a3);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    data = -[CSDataWrapper initWithXPCValue:allowWritableSharedMemory:](v11, "initWithXPCValue:allowWritableSharedMemory:", v12, v6);

    if (a4)
    {
      if (data)
      {
        uint64 = xpc_dictionary_get_uint64(v9, a4);
        if (uint64)
          -[CSDataWrapper setDataSize:](data, "setDataSize:", uint64);
      }
    }
  }
  else
  {
    length = 0;
    data = (CSDataWrapper *)xpc_dictionary_get_data(v9, a3, &length);
    if (data)
    {
      v15 = [CSDataWrapper alloc];
      objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", data, length);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      data = -[CSDataWrapper initWithData:](v15, "initWithData:", v16);

    }
  }

  return data;
}

+ (id)dataWrapperForKey:(const char *)a3 sizeKey:(const char *)a4 fromXPCDictionary:(id)a5
{
  return +[CSXPCConnection dataWrapperForKey:sizeKey:fromXPCDictionary:allowWritableSharedMemory:](CSXPCConnection, "dataWrapperForKey:sizeKey:fromXPCDictionary:allowWritableSharedMemory:", a3, a4, a5, 0);
}

- (void)sendMessageAsync:(id)a3
{
  id v4;
  _xpc_connection_s *v5;

  v4 = a3;
  -[CSXPCConnection connection](self, "connection");
  v5 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
  xpc_connection_send_message(v5, v4);

}

- (void)setPrivateDaemon:(BOOL)a3
{
  self->_privateDaemon = a3;
}

- (void)setUser:(unsigned int)a3
{
  self->_user = a3;
}

- (CSXPCConnection)initWithMachServiceName:(id)a3
{
  return -[CSXPCConnection initWithServiceName:machService:](self, "initWithServiceName:machService:", a3, 1);
}

- (CSXPCConnection)initWithServiceName:(id)a3 machService:(BOOL)a4
{
  return -[CSXPCConnection initWithServiceName:machService:uuid:](self, "initWithServiceName:machService:uuid:", a3, a4, 0);
}

- (void)setNonLaunching:(BOOL)a3
{
  if (a3)
  {
    self->_nonLaunching = 1;
    if (self->_connection)
      xpc_connection_set_non_launching();
  }
}

- (CSXPCConnection)initWithServiceName:(id)a3 machService:(BOOL)a4 uuid:(id)a5
{
  id v9;
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  id v14;
  const char *v15;
  NSObject *v16;
  NSObject *v17;
  dispatch_queue_t v18;
  void *v19;
  objc_super v21;
  uint8_t buf[4];
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a5;
  v21.receiver = self;
  v21.super_class = (Class)CSXPCConnection;
  v11 = -[CSXPCConnection init](&v21, sel_init);
  if (v11)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v23 = v9;
      _os_log_impl(&dword_18C42F000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Start service name %@", buf, 0xCu);
    }
    *((_BYTE *)v11 + 8) = a4;
    objc_storeStrong((id *)v11 + 4, a3);
    objc_storeStrong((id *)v11 + 3, a5);
    objc_msgSend(v9, "stringByAppendingString:", CFSTR(".workloop"));
    v12 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v13 = dispatch_workloop_create((const char *)objc_msgSend(v12, "UTF8String"));

    objc_msgSend(v9, "stringByAppendingString:", CFSTR(".queue"));
    v14 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v15 = (const char *)objc_msgSend(v14, "UTF8String");
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v16 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_attr_make_with_qos_class(v16, QOS_CLASS_UNSPECIFIED, 0);
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = dispatch_queue_create_with_target_V2(v15, v17, v13);
    v19 = (void *)*((_QWORD *)v11 + 6);
    *((_QWORD *)v11 + 6) = v18;

    dispatch_queue_set_specific(*((dispatch_queue_t *)v11 + 6), "csXPCConnectionQueue", v11, 0);
  }

  return (CSXPCConnection *)v11;
}

void __47__CSXPCConnection_sendMessageAsync_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  int64_t v5;
  id xdict;
  id xdicta;

  xdict = a2;
  if (MEMORY[0x18D7829C8]() == MEMORY[0x1E0C812F8])
  {
    if (*(_BYTE *)(a1 + 48) && !xpc_dictionary_get_int64(xdict, "status"))
      objc_msgSend(*(id *)(a1 + 32), "setPreviouslyInitialized:", 1);
    goto LABEL_11;
  }
  if (xdict == (id)MEMORY[0x1E0C81258])
  {
    xdict = xpc_dictionary_create(0, 0, 0);

    v4 = xdict;
    v5 = 4097;
LABEL_10:
    xpc_dictionary_set_int64(v4, "status", v5);
    xpc_dictionary_set_string(xdict, "ed", (const char *)objc_msgSend((id)*MEMORY[0x1E0CB28A8], "UTF8String"));
LABEL_11:
    v3 = xdict;
    goto LABEL_12;
  }
  if (xdict == (id)MEMORY[0x1E0C81260])
  {
    xdict = xpc_dictionary_create(0, 0, 0);

    v4 = xdict;
    v5 = 4099;
    goto LABEL_10;
  }

  v3 = 0;
LABEL_12:
  xdicta = v3;
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (void)setPreviouslyInitialized:(BOOL)a3
{
  self->_previouslyInitialized = a3;
}

+ (void)dictionary:(id)a3 setPlistContainer:(_MDPlistContainer *)a4 forKey:(const char *)a5 sizeKey:(const char *)a6
{
  id v8;
  NSObject *v9;
  NSObject *v10;
  xpc_object_t v11;

  v8 = a3;
  v9 = _MDPlistContainerCopyDispatchData();
  v10 = v9;
  if (v9)
  {
    v11 = xpc_data_create_with_dispatch_data(v9);
    if (v11)
    {
      xpc_dictionary_set_value(v8, a5, v11);
      if (a6)
        xpc_dictionary_set_uint64(v8, a6, 0);
    }

  }
}

+ (void)dictionary:(id)a3 setPlistBytes:(__MDPlistBytes *)a4 forKey:(const char *)a5 sizeKey:(const char *)a6
{
  id v8;
  NSObject *v9;
  NSObject *v10;
  xpc_object_t v11;

  v8 = a3;
  v9 = _MDPlistBytesCopyDispatchData();
  v10 = v9;
  if (v9)
  {
    v11 = xpc_data_create_with_dispatch_data(v9);
    if (v11)
    {
      xpc_dictionary_set_value(v8, a5, v11);
      if (a6)
        xpc_dictionary_set_uint64(v8, a6, 0);
    }

  }
}

- (void)startListener
{
  xpc_connection_activate(self->_connection);
}

- (CSXPCConnection)initWithServiceName:(id)a3
{
  return -[CSXPCConnection initWithServiceName:machService:](self, "initWithServiceName:machService:", a3, 0);
}

- (id)initListenerWithName:(id)a3
{
  id v4;
  CSXPCConnection *v5;
  xpc_connection_t v6;
  OS_xpc_object *connection;

  v4 = a3;
  v5 = -[CSXPCConnection initWithServiceName:machService:](self, "initWithServiceName:machService:", v4, 0);
  if (v5)
  {
    v6 = xpc_connection_create((const char *)objc_msgSend(objc_retainAutorelease(v4), "UTF8String"), (dispatch_queue_t)v5->_queue);
    connection = v5->_connection;
    v5->_connection = v6;

  }
  return v5;
}

- (id)initMachServiceListenerWithName:(id)a3
{
  return -[CSXPCConnection initMachServiceListenerWithName:enableConnectionLogging:](self, "initMachServiceListenerWithName:enableConnectionLogging:", a3, 1);
}

- (id)initMachServiceListenerWithName:(id)a3 enableConnectionLogging:(BOOL)a4
{
  id v6;
  CSXPCConnection *v7;
  CSXPCConnection *v8;
  xpc_connection_t mach_service;
  OS_xpc_object *connection;
  _xpc_connection_s *v11;
  _QWORD handler[4];
  id v14;
  BOOL v15;
  id location;

  v6 = a3;
  v7 = -[CSXPCConnection initWithServiceName:machService:](self, "initWithServiceName:machService:", v6, 1);
  v8 = v7;
  if (v7)
  {
    v7->_listener = 1;
    mach_service = xpc_connection_create_mach_service((const char *)objc_msgSend(objc_retainAutorelease(v6), "UTF8String"), (dispatch_queue_t)v7->_queue, 1uLL);
    connection = v8->_connection;
    v8->_connection = mach_service;

    if (v8->_connection)
    {
      location = 0;
      objc_initWeak(&location, v8);
      v11 = v8->_connection;
      handler[0] = MEMORY[0x1E0C809B0];
      handler[1] = 3221225472;
      handler[2] = __75__CSXPCConnection_initMachServiceListenerWithName_enableConnectionLogging___block_invoke;
      handler[3] = &unk_1E24046F8;
      objc_copyWeak(&v14, &location);
      v15 = a4;
      xpc_connection_set_event_handler(v11, handler);
      objc_destroyWeak(&v14);
      objc_destroyWeak(&location);
    }
    else
    {

      v8 = 0;
    }
  }

  return v8;
}

void __75__CSXPCConnection_initMachServiceListenerWithName_enableConnectionLogging___block_invoke(uint64_t a1, void *a2)
{
  _xpc_connection_s *v3;
  uint64_t v4;
  _QWORD *WeakRetained;
  NSObject *v6;
  uint64_t v7;
  NSObject *v8;
  _QWORD v9[4];
  id v10;
  id v11;
  char v12;
  id location;
  _BYTE buf[12];
  __int16 v15;
  uint64_t v16;
  __int16 v17;
  pid_t pid;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = MEMORY[0x18D7829C8]();
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (v4 == MEMORY[0x1E0C812E0])
  {
    logForCSLogCategoryDefault();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      v7 = WeakRetained[4];
      *(_DWORD *)buf = 134218498;
      *(_QWORD *)&buf[4] = v3;
      v15 = 2112;
      v16 = v7;
      v17 = 1024;
      pid = xpc_connection_get_pid(v3);
      _os_log_impl(&dword_18C42F000, v6, OS_LOG_TYPE_INFO, "new connection(%p) for service %@ pid: %d", buf, 0x1Cu);
    }

    if ((objc_msgSend(WeakRetained, "addClientConnectionIfAllowedForConnection:", v3) & 1) != 0)
    {
      *(_QWORD *)buf = 0;
      objc_initWeak((id *)buf, v3);
      objc_msgSend(WeakRetained, "queue");
      v8 = objc_claimAutoreleasedReturnValue();
      xpc_connection_set_target_queue(v3, v8);

      location = 0;
      objc_initWeak(&location, WeakRetained);
      v9[0] = MEMORY[0x1E0C809B0];
      v9[1] = 3221225472;
      v9[2] = __75__CSXPCConnection_initMachServiceListenerWithName_enableConnectionLogging___block_invoke_47;
      v9[3] = &unk_1E24046D0;
      objc_copyWeak(&v10, &location);
      objc_copyWeak(&v11, (id *)buf);
      v12 = *(_BYTE *)(a1 + 40);
      xpc_connection_set_event_handler(v3, v9);
      xpc_connection_resume(v3);
      objc_destroyWeak(&v11);
      objc_destroyWeak(&v10);
      objc_destroyWeak(&location);
      objc_destroyWeak((id *)buf);
    }
    else
    {
      xpc_connection_cancel(v3);
    }
  }

}

void __75__CSXPCConnection_initMachServiceListenerWithName_enableConnectionLogging___block_invoke_47(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  _xpc_connection_s *v5;
  NSObject *v6;
  NSObject *v7;
  NSObject *v8;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v5 = (_xpc_connection_s *)objc_loadWeakRetained((id *)(a1 + 40));
  if (*(_BYTE *)(a1 + 48))
  {
    logForCSLogCategoryDefault();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      __75__CSXPCConnection_initMachServiceListenerWithName_enableConnectionLogging___block_invoke_47_cold_3(v5);

    logForCSLogCategoryDefault();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      __75__CSXPCConnection_initMachServiceListenerWithName_enableConnectionLogging___block_invoke_47_cold_2((uint64_t)v5, (uint64_t)v3, v7);

  }
  objc_msgSend(WeakRetained, "handleMessage:type:connection:", v3, MEMORY[0x18D7829C8](v3), v5);
  if (*(_BYTE *)(a1 + 48))
  {
    logForCSLogCategoryDefault();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      __75__CSXPCConnection_initMachServiceListenerWithName_enableConnectionLogging___block_invoke_47_cold_1((uint64_t)v5, v8);

  }
}

- (BOOL)handleCommand:(const char *)a3 info:(id)a4 connection:(id)a5
{
  return 0;
}

- (BOOL)addClientConnectionIfAllowedForConfiguration:(id)a3
{
  void *v4;

  objc_msgSend(a3, "connection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = -[CSXPCConnection addClientConnectionIfAllowedForConnection:](self, "addClientConnectionIfAllowedForConnection:", v4);

  return (char)self;
}

- (BOOL)addClientConnectionIfAllowedForConnection:(id)a3
{
  return 1;
}

- (BOOL)lostClientConnection:(id)a3 error:(id)a4
{
  _xpc_connection_s *v5;
  id v6;
  id v7;
  NSObject *v8;
  _BOOL4 v9;
  int v11;
  _xpc_connection_s *v12;
  __int16 v13;
  pid_t pid;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v5 = (_xpc_connection_s *)a3;
  v6 = a4;
  if (v6 == (id)MEMORY[0x1E0C81258])
  {
    logForCSLogCategoryDefault();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v11 = 134218240;
      v12 = v5;
      v13 = 1024;
      pid = xpc_connection_get_pid(v5);
      _os_log_impl(&dword_18C42F000, v8, OS_LOG_TYPE_DEFAULT, "### Connection(%p) interrupted pid: %d", (uint8_t *)&v11, 0x12u);
    }
  }
  else
  {
    v7 = (id)MEMORY[0x1E0C81260];
    logForCSLogCategoryDefault();
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = os_log_type_enabled(v8, OS_LOG_TYPE_ERROR);
    if (v6 == v7)
    {
      if (v9)
        -[CSXPCConnection lostClientConnection:error:].cold.1(v5, v8);
    }
    else if (v9)
    {
      -[CSXPCConnection lostClientConnection:error:].cold.2(v5, v6, v8);
    }
  }

  return 0;
}

- (void)_lostClientConnection:(id)a3 error:(id)a4
{
  _xpc_connection_s *connection;

  connection = (_xpc_connection_s *)a3;
  if (!-[CSXPCConnection lostClientConnection:error:](self, "lostClientConnection:error:"))
    xpc_connection_cancel(connection);

}

- (void)handleError:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v8;
  const char *string;
  void *v10;
  OS_xpc_object *connection;
  int v12;
  CSXPCConnection *v13;
  __int16 v14;
  const char *v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  v6 = (void *)MEMORY[0x1E0C81260];
  if (v4 == (id)MEMORY[0x1E0C81258] || v4 == (id)MEMORY[0x1E0C81260])
  {
    logForCSLogCategoryDefault();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      string = xpc_dictionary_get_string(v5, (const char *)*MEMORY[0x1E0C81270]);
      -[CSXPCConnection serviceName](self, "serviceName");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 134218498;
      v13 = self;
      v14 = 2080;
      v15 = string;
      v16 = 2112;
      v17 = v10;
      _os_log_impl(&dword_18C42F000, v8, OS_LOG_TYPE_DEFAULT, "### Connection error %p %s for %@", (uint8_t *)&v12, 0x20u);

    }
    if (v5 == v6)
    {
      connection = self->_connection;
      self->_connection = 0;

    }
  }

}

- (void)suspend
{
  OS_xpc_object *v3;
  int v4;
  OS_xpc_object *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v3 = self->_connection;
  if (v3)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      v4 = 138412290;
      v5 = v3;
      _os_log_impl(&dword_18C42F000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "### suspending %@", (uint8_t *)&v4, 0xCu);
    }
    xpc_connection_suspend(v3);
    dispatch_suspend((dispatch_object_t)self->_queue);
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      v4 = 138412290;
      v5 = v3;
      _os_log_impl(&dword_18C42F000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "### suspended %@", (uint8_t *)&v4, 0xCu);
    }
  }

}

- (void)resume
{
  OS_xpc_object *v3;
  int v4;
  OS_xpc_object *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v3 = self->_connection;
  if (v3)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      v4 = 138412290;
      v5 = v3;
      _os_log_impl(&dword_18C42F000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "### resuming %@", (uint8_t *)&v4, 0xCu);
    }
    dispatch_resume((dispatch_object_t)self->_queue);
    xpc_connection_resume(v3);
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      v4 = 138412290;
      v5 = v3;
      _os_log_impl(&dword_18C42F000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "### resumed %@", (uint8_t *)&v4, 0xCu);
    }
  }

}

+ (unint64_t)copyUInt64ForKey:(const char *)a3 fromXPCDictionary:(id)a4
{
  return xpc_dictionary_get_uint64(a4, a3);
}

+ (BOOL)copyBoolForKey:(const char *)a3 fromXPCDictionary:(id)a4
{
  return xpc_dictionary_get_BOOL(a4, a3);
}

+ (double)copyDoubleForKey:(const char *)a3 fromXPCDictionary:(id)a4
{
  return xpc_dictionary_get_double(a4, a3);
}

+ (id)copyNSArrayFromXPCArray:(id)a3
{
  id v3;
  void *v4;
  void *v5;

  v3 = a3;
  v4 = v3;
  if (!v3 || !xpc_array_get_count(v3))
    goto LABEL_5;
  plist_xpc_to_ns(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

LABEL_5:
    v5 = 0;
  }

  return v5;
}

+ (id)copyNSString:(id)a3
{
  id result;

  result = (id)xpc_string_get_string_ptr(a3);
  if (result)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", result);
    return (id)objc_claimAutoreleasedReturnValue();
  }
  return result;
}

+ (id)copyNSObject:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;

  v4 = a3;
  v5 = MEMORY[0x18D7829C8]();
  if (v5 == MEMORY[0x1E0C81390])
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", xpc_string_get_string_ptr(v4));
    v7 = objc_claimAutoreleasedReturnValue();
LABEL_10:
    v6 = (void *)v7;
    goto LABEL_11;
  }
  if (v5 == MEMORY[0x1E0C812F8])
  {
    v7 = objc_msgSend(a1, "copyNSDictionaryFromXPCObject:", v4);
    goto LABEL_10;
  }
  if (v5 == MEMORY[0x1E0C812C8])
  {
    v7 = objc_msgSend(a1, "copyNSArrayFromXPCObject:", v4);
    goto LABEL_10;
  }
  if (v5 == MEMORY[0x1E0C81328])
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", xpc_int64_get_value(v4));
    v7 = objc_claimAutoreleasedReturnValue();
    goto LABEL_10;
  }
  v6 = 0;
LABEL_11:

  return v6;
}

+ (id)copyNSDictionaryFromXPCObject:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  id v7;
  _QWORD v9[4];
  id v10;
  id v11;

  v4 = (void *)MEMORY[0x1E0C99E08];
  v5 = a3;
  objc_msgSend(v4, "dictionaryWithCapacity:", xpc_dictionary_get_count(v5));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __49__CSXPCConnection_copyNSDictionaryFromXPCObject___block_invoke;
  v9[3] = &unk_1E24047C0;
  v11 = a1;
  v7 = v6;
  v10 = v7;
  xpc_dictionary_apply(v5, v9);

  return v7;
}

uint64_t __49__CSXPCConnection_copyNSDictionaryFromXPCObject___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;

  v4 = (void *)objc_msgSend(*(id *)(a1 + 40), "copyNSObject:");
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", a2);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
      objc_msgSend(*(id *)(a1 + 32), "setObject:forKey:", v4, v5);

  }
  return 1;
}

+ (id)copyNSArrayFromXPCObject:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  id v7;
  _QWORD v9[4];
  id v10;
  id v11;

  v4 = (void *)MEMORY[0x1E0C99DE8];
  v5 = a3;
  objc_msgSend(v4, "arrayWithCapacity:", xpc_array_get_count(v5));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __44__CSXPCConnection_copyNSArrayFromXPCObject___block_invoke;
  v9[3] = &unk_1E24047E8;
  v11 = a1;
  v7 = v6;
  v10 = v7;
  xpc_array_apply(v5, v9);

  return v7;
}

uint64_t __44__CSXPCConnection_copyNSArrayFromXPCObject___block_invoke(uint64_t a1)
{
  void *v2;

  v2 = (void *)objc_msgSend(*(id *)(a1 + 40), "copyNSObject:");
  if (v2)
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v2);

  return 1;
}

uint64_t __55__CSXPCConnection_copyNSStringOrDictArrayFromXPCArray___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  const char *string_ptr;
  void *v9;

  v4 = a3;
  v5 = MEMORY[0x18D7829C8]();
  if (v5 == MEMORY[0x1E0C81390])
  {
    string_ptr = xpc_string_get_string_ptr(v4);
    if (string_ptr)
    {
      v9 = *(void **)(a1 + 32);
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", string_ptr);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = v9;
      goto LABEL_7;
    }
  }
  else if (v5 == MEMORY[0x1E0C812F8])
  {
    v6 = (void *)objc_msgSend(*(id *)(a1 + 40), "copyNSDictionaryFromXPCObject:", v4);
    if (!v6)
    {
LABEL_8:

      goto LABEL_9;
    }
    v7 = *(void **)(a1 + 32);
LABEL_7:
    objc_msgSend(v7, "addObject:", v6);
    goto LABEL_8;
  }
LABEL_9:

  return 1;
}

+ (id)copyNSNumberArrayFromXPCArray:(id)a3
{
  id v3;
  void *v4;
  size_t count;
  void *v6;
  id v7;
  _QWORD applier[4];
  id v10;

  v3 = a3;
  v4 = v3;
  if (v3 && (count = xpc_array_get_count(v3)) != 0)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", count);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    applier[0] = MEMORY[0x1E0C809B0];
    applier[1] = 3221225472;
    applier[2] = __49__CSXPCConnection_copyNSNumberArrayFromXPCArray___block_invoke;
    applier[3] = &unk_1E2404798;
    v7 = v6;
    v10 = v7;
    xpc_array_apply(v4, applier);

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

uint64_t __49__CSXPCConnection_copyNSNumberArrayFromXPCArray___block_invoke(uint64_t a1, int a2, xpc_object_t xdouble)
{
  double value;
  void *v5;
  void *v6;

  value = xpc_double_get_value(xdouble);
  v5 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", value);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v6);

  return 1;
}

+ (id)copyNSStringSetFromXPCArray:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  _QWORD applier[4];
  id v10;

  v3 = a3;
  v4 = v3;
  if (v3 && xpc_array_get_count(v3))
  {
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    applier[0] = MEMORY[0x1E0C809B0];
    applier[1] = 3221225472;
    applier[2] = __47__CSXPCConnection_copyNSStringSetFromXPCArray___block_invoke;
    applier[3] = &unk_1E2404798;
    v10 = v5;
    v6 = v5;
    xpc_array_apply(v4, applier);
    v7 = (void *)objc_msgSend(v6, "copy");

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

uint64_t __47__CSXPCConnection_copyNSStringSetFromXPCArray___block_invoke(uint64_t a1, int a2, xpc_object_t xstring)
{
  const char *string_ptr;
  void *v5;
  void *v6;

  string_ptr = xpc_string_get_string_ptr(xstring);
  if (string_ptr)
  {
    v5 = *(void **)(a1 + 32);
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", string_ptr);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v6);

  }
  return 1;
}

+ (void)dictionary:(id)a3 setArray:(id)a4 forKey:(const char *)a5
{
  id v7;
  id v8;
  xpc_object_t v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  xpc_object_t v16;
  char *key;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  if (objc_msgSend(v8, "count"))
  {
    key = (char *)a5;
    v9 = xpc_array_create(0, 0);
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    v10 = v8;
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v19;
      do
      {
        v14 = 0;
        do
        {
          if (*(_QWORD *)v19 != v13)
            objc_enumerationMutation(v10);
          objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * v14), 1, 0);
          v15 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
          v16 = xpc_data_create((const void *)objc_msgSend(v15, "bytes"), objc_msgSend(v15, "length"));
          xpc_array_append_value(v9, v16);

          ++v14;
        }
        while (v12 != v14);
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      }
      while (v12);
    }

    xpc_dictionary_set_value(v7, key, v9);
  }

}

+ (void)dictionary:(id)a3 setValue:(id)a4 forKey:(const char *)a5
{
  id v8;
  void *v9;
  void *v10;
  xpc_object_t xdict;

  xdict = a3;
  v8 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    xpc_dictionary_set_int64(xdict, a5, objc_msgSend(v8, "integerValue"));
    goto LABEL_10;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(a1, "constructDictionary:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_7:
    v10 = v9;
    xpc_dictionary_set_value(xdict, a5, v9);

    goto LABEL_10;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(a1, "constructArray:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_7;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    +[CSXPCConnection dictionary:setValue:forKey:].cold.1();
  xpc_dictionary_set_string(xdict, a5, (const char *)objc_msgSend(objc_retainAutorelease(v8), "UTF8String"));
LABEL_10:

}

+ (void)array:(id)a3 setValue:(id)a4 atIndex:(int64_t)a5
{
  id v8;
  void *v9;
  void *v10;
  xpc_object_t xarray;

  xarray = a3;
  v8 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    xpc_array_set_int64(xarray, a5, objc_msgSend(v8, "integerValue"));
    goto LABEL_10;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(a1, "constructDictionary:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_7:
    v10 = v9;
    xpc_array_set_value(xarray, a5, v9);

    goto LABEL_10;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(a1, "constructArray:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_7;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    +[CSXPCConnection array:setValue:atIndex:].cold.1();
  xpc_array_set_string(xarray, a5, (const char *)objc_msgSend(objc_retainAutorelease(v8), "UTF8String"));
LABEL_10:

}

+ (id)constructArray:(id)a3
{
  id v4;
  xpc_object_t empty;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  empty = xpc_array_create_empty();
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
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
        objc_msgSend(a1, "array:setValue:atIndex:", empty, *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v10++), -1, (_QWORD)v12);
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v8);
  }

  return empty;
}

+ (id)constructDictionary:(id)a3
{
  id v4;
  xpc_object_t empty;
  id v6;
  _QWORD v8[4];
  id v9;
  id v10;

  v4 = a3;
  empty = xpc_dictionary_create_empty();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __39__CSXPCConnection_constructDictionary___block_invoke;
  v8[3] = &unk_1E2404810;
  v10 = a1;
  v6 = empty;
  v9 = v6;
  objc_msgSend(v4, "enumerateKeysAndObjectsUsingBlock:", v8);

  return v6;
}

void __39__CSXPCConnection_constructDictionary___block_invoke(uint64_t a1, id a2, void *a3)
{
  id v5;
  id v6;

  v5 = objc_retainAutorelease(a2);
  v6 = a3;
  objc_msgSend(*(id *)(a1 + 40), "dictionary:setValue:forKey:", *(_QWORD *)(a1 + 32), v6, objc_msgSend(v5, "UTF8String"));

}

+ (void)dictionary:(id)a3 setNumberArray:(id)a4 forKey:(const char *)a5
{
  id v7;
  id v8;
  xpc_object_t v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  double v15;
  xpc_object_t v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  if (objc_msgSend(v8, "count"))
  {
    v9 = xpc_array_create(0, 0);
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    v10 = v8;
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v18;
      do
      {
        v14 = 0;
        do
        {
          if (*(_QWORD *)v18 != v13)
            objc_enumerationMutation(v10);
          objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * v14), "doubleValue", (_QWORD)v17);
          v16 = xpc_double_create(v15);
          xpc_array_append_value(v9, v16);

          ++v14;
        }
        while (v12 != v14);
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      }
      while (v12);
    }

    xpc_dictionary_set_value(v7, a5, v9);
  }

}

+ (BOOL)dictionary:(id)a3 setSharedMemory:(void *)a4 forKey:(const char *)a5 size:(unint64_t)a6 forSizeKey:(const char *)a7
{
  id v11;
  BOOL v12;
  BOOL v13;
  xpc_object_t v14;

  v11 = a3;
  if (a4)
    v12 = a6 == 0;
  else
    v12 = 1;
  v13 = !v12;
  if (!v12)
  {
    v14 = xpc_shmem_create(a4, a6);
    if (v14)
    {
      xpc_dictionary_set_value(v11, a5, v14);
      xpc_dictionary_set_uint64(v11, a7, a6);
    }
    else
    {
      xpc_dictionary_set_data(v11, a5, a4, a6);
    }

  }
  return v13;
}

+ (id)appIdentifierFromTeamAppTuple:(id)a3
{
  id v3;
  uint64_t v4;
  int v5;
  void *v7;

  v3 = a3;
  if ((unint64_t)objc_msgSend(v3, "length") >= 0xC
    && objc_msgSend(v3, "characterAtIndex:", 10) == 46)
  {
    v4 = 0;
    while (1)
    {
      v5 = objc_msgSend(v3, "characterAtIndex:", v4);
      if ((v5 - 48) > 0x2A || (v5 - 65) >= 0xFFFFFFF9)
        break;
      if (++v4 == 10)
      {
        objc_msgSend(v3, "substringFromIndex:", 11);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_11;
      }
    }
  }
  v7 = 0;
LABEL_11:

  return v7;
}

+ (id)processNameForPID:(int)a3
{
  uint64_t v3;
  size_t v5;
  _BYTE v6[243];
  _BYTE v7[5];
  int v8[2];
  int v9;
  int v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  if (!a3)
    return &stru_1E2406B38;
  v3 = *(_QWORD *)&a3;
  *(_QWORD *)v8 = 0xE00000001;
  v9 = 1;
  v10 = a3;
  bzero(v6, 0x288uLL);
  v5 = 648;
  if (sysctl(v8, 4u, v6, &v5, 0, 0) == -1 || !v5)
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%d"), v3);
  else
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s"), v7);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (void)setJournalEnabled:(BOOL)a3
{
  if (isAppleInternalInstall())
    gJournalEnabled = a3;
}

+ (id)copyPlistFromXPCObject:(id)a3
{
  plist_xpc_to_ns(a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (void)journalDictionary:(id)a3 toFolderPath:(const char *)a4 forPID:(int)a5 withLabel:(const char *)a6 andID:(unint64_t)a7
{
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;

  v15 = a3;
  if (+[CSXPCConnection journalEnabled](CSXPCConnection, "journalEnabled"))
  {
    v11 = getpid();
    if (a5)
      v12 = a5;
    else
      v12 = v11;
    +[CSXPCConnection processNameForPID:](CSXPCConnection, "processNameForPID:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s/%s_%u_%@_%lld.plist"), a4, a6, v11, v13, a7);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "writeToFile:atomically:", v14, 1);

  }
}

- (NSString)uuid
{
  return self->_uuid;
}

- (BOOL)machService
{
  return self->_machService;
}

- (void)setConnection:(id)a3
{
  objc_storeStrong((id *)&self->_connection, a3);
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (BOOL)listener
{
  return self->_listener;
}

- (BOOL)nonLaunching
{
  return self->_nonLaunching;
}

- (BOOL)privateDaemon
{
  return self->_privateDaemon;
}

- (unsigned)user
{
  return self->_user;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_serviceName, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
}

void __75__CSXPCConnection_initMachServiceListenerWithName_enableConnectionLogging___block_invoke_47_cold_1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 134217984;
  v3 = a1;
  _os_log_debug_impl(&dword_18C42F000, a2, OS_LOG_TYPE_DEBUG, "exit connection: %p", (uint8_t *)&v2, 0xCu);
  OUTLINED_FUNCTION_1();
}

void __75__CSXPCConnection_initMachServiceListenerWithName_enableConnectionLogging___block_invoke_47_cold_2(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = 134218240;
  v4 = a1;
  v5 = 2048;
  v6 = a2;
  _os_log_debug_impl(&dword_18C42F000, log, OS_LOG_TYPE_DEBUG, "enter connection: %p message: %p", (uint8_t *)&v3, 0x16u);
  OUTLINED_FUNCTION_1();
}

void __75__CSXPCConnection_initMachServiceListenerWithName_enableConnectionLogging___block_invoke_47_cold_3(_xpc_connection_s *a1)
{
  void *v1;
  os_log_t v2;
  os_log_type_t v3;
  const char *v4;
  uint8_t *v5;

  xpc_connection_get_pid(a1);
  OUTLINED_FUNCTION_1_5();
  OUTLINED_FUNCTION_0_6();
  _os_log_debug_impl(v1, v2, v3, v4, v5, 0x1Cu);
  OUTLINED_FUNCTION_6_0();
}

- (void)handleMessage:(int)a1 type:(xpc_connection_t)connection connection:.cold.1(int a1, xpc_connection_t connection)
{
  void *v2;
  os_log_t v3;
  os_log_type_t v4;
  const char *v5;
  uint8_t *v6;

  xpc_connection_get_pid(connection);
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_0_6();
  _os_log_debug_impl(v2, v3, v4, v5, v6, 0x12u);
  OUTLINED_FUNCTION_2_0();
}

- (void)lostClientConnection:(_xpc_connection_s *)a1 error:(NSObject *)a2 .cold.1(_xpc_connection_s *a1, NSObject *a2)
{
  uint8_t v3[24];
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  xpc_connection_get_pid(a1);
  OUTLINED_FUNCTION_3_1();
  _os_log_error_impl(&dword_18C42F000, a2, OS_LOG_TYPE_ERROR, "### Connection(%p) invalid  pid: %d", v3, 0x12u);
  OUTLINED_FUNCTION_2_0();
}

- (void)lostClientConnection:(NSObject *)a3 error:.cold.2(_xpc_connection_s *a1, xpc_object_t xdict, NSObject *a3)
{
  int v5;
  _xpc_connection_s *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  xpc_dictionary_get_string(xdict, (const char *)*MEMORY[0x1E0C81270]);
  xpc_connection_get_pid(a1);
  v5 = 134218498;
  v6 = a1;
  OUTLINED_FUNCTION_1_5();
  _os_log_error_impl(&dword_18C42F000, a3, OS_LOG_TYPE_ERROR, "### Connection(%p) error %s pid: %d", (uint8_t *)&v5, 0x1Cu);
  OUTLINED_FUNCTION_6_0();
}

void __29__CSXPCConnection_connection__block_invoke_2_cold_1()
{
  void *v0;
  os_log_t v1;
  os_log_type_t v2;
  const char *v3;
  uint8_t *v4;

  qos_class_self();
  OUTLINED_FUNCTION_0_6();
  _os_log_debug_impl(v0, v1, v2, v3, v4, 8u);
  OUTLINED_FUNCTION_1();
}

+ (void)dictionary:setValue:forKey:.cold.1()
{
  __assert_rtn("+[CSXPCConnection dictionary:setValue:forKey:]", "CSXPCConnection.m", 671, "0");
}

+ (void)array:setValue:atIndex:.cold.1()
{
  __assert_rtn("+[CSXPCConnection array:setValue:atIndex:]", "CSXPCConnection.m", 690, "0");
}

+ (void)dictionary:setStringOrDictionaryArray:forKey:.cold.1()
{
  __assert_rtn("+[CSXPCConnection dictionary:setStringOrDictionaryArray:forKey:]", "CSXPCConnection.m", 732, "0");
}

@end
