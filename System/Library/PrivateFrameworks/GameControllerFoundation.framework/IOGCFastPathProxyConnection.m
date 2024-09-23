@implementation IOGCFastPathProxyConnection

+ (id)connectTo:(unsigned int)a3 withProxyService:(id)a4 error:(int *)a5
{
  id v8;
  xpc_connection_t *v9;

  v8 = a4;
  v9 = -[IOGCFastPathProxyConnection _initWithService:withProxyService:error:](objc_alloc((Class)a1), a3, v8, a5);

  return v9;
}

- (xpc_connection_t)_initWithService:(void *)a3 withProxyService:(_DWORD *)a4 error:
{
  id v7;
  void *v8;
  xpc_connection_t *v9;
  kern_return_t v10;
  xpc_connection_t *v11;
  NSObject *v12;
  xpc_connection_t mach_service;
  xpc_connection_t v14;
  _xpc_connection_s *v15;
  xpc_connection_t *v16;
  NSObject *v17;
  const char *Name;
  xpc_object_t v19;
  xpc_object_t v20;
  uint64_t v21;
  void *v22;
  NSObject *v23;
  NSObject *v24;
  int value;
  NSObject *v26;
  void *v28;
  void *v29;
  _QWORD handler[4];
  xpc_connection_t *v31;
  uint64_t entryID;
  objc_super v33;
  uint8_t buf[4];
  char *v35;
  __int16 v36;
  uint64_t v37;
  __int16 v38;
  xpc_object_t v39;
  xpc_object_t values;
  char *keys;
  char className[136];
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = v7;
  if (!a1)
  {
    v11 = 0;
    goto LABEL_27;
  }
  if (v7)
  {
    if (a2)
      goto LABEL_4;
  }
  else
  {
    unk_1F03A9A20(&off_1F03A9B88, "currentHandler");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "handleFailureInMethod:object:file:lineNumber:description:", sel__initWithService_withProxyService_error_, a1, CFSTR("IOGCFastPathProxyConnection.m"), 32, CFSTR("Invalid parameter not satisfying: %s"), "name");

    if (a2)
      goto LABEL_4;
  }
  unk_1F03A9A20(&off_1F03A9B88, "currentHandler");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "handleFailureInMethod:object:file:lineNumber:description:", sel__initWithService_withProxyService_error_, a1, CFSTR("IOGCFastPathProxyConnection.m"), 33, CFSTR("Invalid parameter not satisfying: %s"), "service != IO_OBJECT_NULL");

LABEL_4:
  v33.receiver = a1;
  v33.super_class = (Class)IOGCFastPathProxyConnection;
  v9 = (xpc_connection_t *)objc_msgSendSuper2(&v33, sel_init);
  entryID = 0;
  memset(className, 0, 128);
  v10 = IOObjectRetain(a2);
  IORegistryEntryGetRegistryEntryID(a2, &entryID);
  IOObjectGetClass(a2, className);
  v11 = 0;
  if (!v10)
  {
    _gc_log_iokit();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      -[IOGCFastPathProxyConnection _initWithService:withProxyService:error:].cold.2();

    mach_service = xpc_connection_create_mach_service((const char *)objc_msgSend(objc_retainAutorelease(v8), "UTF8String"), 0, 2uLL);
    v14 = v9[2];
    v9[2] = mach_service;

    v15 = v9[2];
    handler[0] = MEMORY[0x1E0C809B0];
    handler[1] = 3221225472;
    handler[2] = __71__IOGCFastPathProxyConnection__initWithService_withProxyService_error___block_invoke;
    handler[3] = &unk_1EA4D2B60;
    v16 = v9;
    v31 = v16;
    xpc_connection_set_event_handler(v15, handler);
    xpc_connection_activate(v9[2]);
    _gc_log_iokit();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
      -[IOGCFastPathProxyConnection _initWithService:withProxyService:error:].cold.1();

    keys = "selector";
    Name = sel_getName(sel_connect_);
    values = xpc_string_create(Name);
    v19 = xpc_dictionary_create((const char *const *)&keys, &values, 1uLL);
    xpc_dictionary_set_mach_send();
    v20 = xpc_connection_send_message_with_reply_sync(v9[2], v19);
    v21 = MEMORY[0x1DF0CE66C]();
    if (v21 == MEMORY[0x1E0C812F8])
    {
      xpc_dictionary_get_value(v20, "status");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      if (MEMORY[0x1DF0CE66C]() == MEMORY[0x1E0C81398])
      {
        value = xpc_uint64_get_value(v22);
        _gc_log_iokit();
        v26 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 136315650;
          v35 = className;
          v36 = 2048;
          v37 = entryID;
          v38 = 1024;
          LODWORD(v39) = value;
          _os_log_debug_impl(&dword_1DC79E000, v26, OS_LOG_TYPE_DEBUG, "Handshake for <%s %#llx> returns %{mach.errno}d", buf, 0x1Cu);
        }

        if (!value)
        {

          goto LABEL_11;
        }
        xpc_connection_cancel(v9[2]);
        *a4 = value;
      }
      else
      {
        _gc_log_iokit();
        v23 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 136315650;
          v35 = className;
          v36 = 2048;
          v37 = entryID;
          v38 = 2112;
          v39 = v20;
          _os_log_debug_impl(&dword_1DC79E000, v23, OS_LOG_TYPE_DEBUG, "Handshake for <%s %#llx> returns bad reply: %@", buf, 0x20u);
        }

      }
    }
    else
    {
      if (v21 != MEMORY[0x1E0C81310])
      {
LABEL_11:

        v11 = v16;
LABEL_25:

        goto LABEL_26;
      }
      _gc_log_iokit();
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315650;
        v35 = className;
        v36 = 2048;
        v37 = entryID;
        v38 = 2112;
        v39 = v20;
        _os_log_impl(&dword_1DC79E000, v24, OS_LOG_TYPE_DEFAULT, "Handshake for <%s %#llx> failed: %@", buf, 0x20u);
      }

      xpc_connection_cancel(v9[2]);
      *a4 = -536870209;
    }

    v11 = 0;
    goto LABEL_25;
  }
LABEL_26:

LABEL_27:
  return v11;
}

void __71__IOGCFastPathProxyConnection__initWithService_withProxyService_error___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  NSObject *v5;
  id v6;
  _BOOL4 v7;
  uint64_t v8;

  v3 = a2;
  v4 = MEMORY[0x1DF0CE66C]();
  if (v4 == MEMORY[0x1E0C812F8])
  {
    _gc_log_iokit();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      __71__IOGCFastPathProxyConnection__initWithService_withProxyService_error___block_invoke_cold_1();
  }
  else if (v4 == MEMORY[0x1E0C81310])
  {
    v6 = (id)MEMORY[0x1E0C81260];
    _gc_log_iokit();
    v5 = objc_claimAutoreleasedReturnValue();
    v7 = os_log_type_enabled(v5, OS_LOG_TYPE_ERROR);
    if (v3 == v6)
    {
      if (v7)
        __71__IOGCFastPathProxyConnection__initWithService_withProxyService_error___block_invoke_cold_2(v5);

      xpc_connection_set_event_handler(*(xpc_connection_t *)(*(_QWORD *)(a1 + 32) + 16), &__block_literal_global_17);
      xpc_connection_cancel(*(xpc_connection_t *)(*(_QWORD *)(a1 + 32) + 16));
      v8 = *(_QWORD *)(a1 + 32);
      v5 = *(NSObject **)(v8 + 16);
      *(_QWORD *)(v8 + 16) = 0;
    }
    else if (v7)
    {
      __71__IOGCFastPathProxyConnection__initWithService_withProxyService_error___block_invoke_cold_3();
    }
  }
  else
  {
    _gc_log_iokit();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      __71__IOGCFastPathProxyConnection__initWithService_withProxyService_error___block_invoke_cold_4();
  }

}

- (IOGCFastPathProxyConnection)init
{
  -[IOGCFastPathProxyConnection doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);

  return 0;
}

- (void)dealloc
{
  NSObject *v3;
  OS_xpc_object *connection;
  OS_xpc_object *v5;
  io_object_t service;
  objc_super v7;
  uint8_t buf[4];
  IOGCFastPathProxyConnection *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  _gc_log_iokit();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v9 = self;
    _os_log_impl(&dword_1DC79E000, v3, OS_LOG_TYPE_DEFAULT, "%@::dealloc", buf, 0xCu);
  }

  connection = self->_connection;
  if (connection)
  {
    xpc_connection_cancel(connection);
    v5 = self->_connection;
    self->_connection = 0;

  }
  service = self->_service;
  if (service)
  {
    IOObjectRelease(service);
    self->_service = 0;
  }
  v7.receiver = self;
  v7.super_class = (Class)IOGCFastPathProxyConnection;
  -[IOGCFastPathProxyConnection dealloc](&v7, sel_dealloc);
}

- (void)invalidate
{
  xpc_connection_cancel(self->_connection);
}

- (int)mapSharedMemoryAt:(unint64_t *)a3 ofSize:(unint64_t *)a4 options:(unsigned int)a5
{
  NSObject *v8;
  const char *Name;
  xpc_object_t v10;
  xpc_object_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  NSObject *v15;
  _BOOL4 v16;
  const char *v17;
  void *v18;
  NSObject *v19;
  int value;
  NSObject *v21;
  mem_entry_name_port_t v22;
  mem_entry_name_port_t v23;
  uint64_t uint64;
  unint64_t v25;
  NSObject *v26;
  NSObject *v27;
  const char *v28;
  uint8_t buf[4];
  IOGCFastPathProxyConnection *v31;
  __int16 v32;
  xpc_object_t v33;
  xpc_object_t values;
  char *keys[2];

  keys[1] = *(char **)MEMORY[0x1E0C80C00];
  _gc_log_iokit();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    -[IOGCFastPathProxyConnection mapSharedMemoryAt:ofSize:options:].cold.3();

  keys[0] = "selector";
  Name = sel_getName(sel_mapSharedMemory);
  values = xpc_string_create(Name);
  v10 = xpc_dictionary_create((const char *const *)keys, &values, 1uLL);
  v11 = xpc_connection_send_message_with_reply_sync(self->_connection, v10);
  v12 = MEMORY[0x1DF0CE66C]();
  if (v12 == MEMORY[0x1E0C812F8])
  {
    xpc_dictionary_get_value(v11, "status");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (MEMORY[0x1DF0CE66C]() != MEMORY[0x1E0C81398])
    {
      _gc_log_iokit();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
        -[IOGCFastPathProxyConnection mapSharedMemoryAt:ofSize:options:].cold.2();
      value = -536870209;

      goto LABEL_31;
    }
    value = xpc_uint64_get_value(v18);
    _gc_log_iokit();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
      -[IOGCFastPathProxyConnection mapSharedMemoryAt:ofSize:options:].cold.1();

    if (value)
      goto LABEL_31;
    v22 = xpc_dictionary_copy_mach_send();
    if (v22)
    {
      v23 = v22;
      uint64 = xpc_dictionary_get_uint64(v11, "memory_size");
      if (uint64)
      {
        v25 = uint64;
        value = mach_vm_map(*MEMORY[0x1E0C83DA0], a3, uint64, 0, 1, v23, 0, 0, 1, 1, 0);
        if (value)
        {
          _gc_log_iokit();
          v26 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 67109120;
            LODWORD(v31) = value;
            _os_log_impl(&dword_1DC79E000, v26, OS_LOG_TYPE_DEFAULT, "vm_map returns %{mach.errno}d", buf, 8u);
          }

        }
        *a4 = v25;
        goto LABEL_31;
      }
      _gc_log_iokit();
      v27 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
        goto LABEL_30;
      *(_DWORD *)buf = 138412290;
      v31 = self;
      v28 = "mapSharedMemory reply for %@ missing 'memory_size' argument";
    }
    else
    {
      _gc_log_iokit();
      v27 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
      {
LABEL_30:
        value = -536870209;

        xpc_connection_cancel(self->_connection);
LABEL_31:

        goto LABEL_32;
      }
      *(_DWORD *)buf = 138412290;
      v31 = self;
      v28 = "mapSharedMemory reply for %@ missing 'memory' argument";
    }
    _os_log_impl(&dword_1DC79E000, v27, OS_LOG_TYPE_DEFAULT, v28, buf, 0xCu);
    goto LABEL_30;
  }
  v13 = v12;
  v14 = MEMORY[0x1E0C81310];
  _gc_log_iokit();
  v15 = objc_claimAutoreleasedReturnValue();
  v16 = os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT);
  if (v13 == v14)
  {
    if (v16)
    {
      *(_DWORD *)buf = 138412546;
      v31 = self;
      v32 = 2112;
      v33 = v11;
      v17 = "Handshake for %@ failed: %@";
      goto LABEL_13;
    }
  }
  else if (v16)
  {
    *(_DWORD *)buf = 138412546;
    v31 = self;
    v32 = 2112;
    v33 = v11;
    v17 = "Handshake for %@ unknown response: %@";
LABEL_13:
    _os_log_impl(&dword_1DC79E000, v15, OS_LOG_TYPE_DEFAULT, v17, buf, 0x16u);
  }
  value = -536870209;

  xpc_connection_cancel(self->_connection);
LABEL_32:

  return value;
}

- (int)unmapSharedMemoryAt:(unint64_t)a3
{
  return 0;
}

- (int)open
{
  const char *Name;
  xpc_object_t v4;
  xpc_object_t v5;
  uint64_t v6;
  uint64_t v7;
  int value;
  uint64_t v9;
  NSObject *v10;
  _BOOL4 v11;
  const char *v12;
  void *v13;
  NSObject *v14;
  int v16;
  IOGCFastPathProxyConnection *v17;
  __int16 v18;
  xpc_object_t v19;
  xpc_object_t values;
  char *keys[2];

  keys[1] = *(char **)MEMORY[0x1E0C80C00];
  keys[0] = "selector";
  Name = sel_getName(sel_open);
  values = xpc_string_create(Name);
  v4 = xpc_dictionary_create((const char *const *)keys, &values, 1uLL);
  v5 = xpc_connection_send_message_with_reply_sync(self->_connection, v4);
  v6 = MEMORY[0x1DF0CE66C]();
  if (v6 != MEMORY[0x1E0C812F8])
  {
    v7 = v6;
    value = -536870209;
    v9 = MEMORY[0x1E0C81310];
    _gc_log_iokit();
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
    if (v7 == v9)
    {
      if (v11)
      {
        v16 = 138412546;
        v17 = self;
        v18 = 2112;
        v19 = v5;
        v12 = "Open for %@ failed: %@";
        goto LABEL_11;
      }
    }
    else if (v11)
    {
      v16 = 138412546;
      v17 = self;
      v18 = 2112;
      v19 = v5;
      v12 = "Open for %@ unknown response: %@";
LABEL_11:
      _os_log_impl(&dword_1DC79E000, v10, OS_LOG_TYPE_DEFAULT, v12, (uint8_t *)&v16, 0x16u);
    }

    xpc_connection_cancel(self->_connection);
    goto LABEL_15;
  }
  xpc_dictionary_get_value(v5, "status");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (MEMORY[0x1DF0CE66C]() == MEMORY[0x1E0C81398])
  {
    value = xpc_uint64_get_value(v13);
  }
  else
  {
    _gc_log_iokit();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      -[IOGCFastPathProxyConnection open].cold.1();
    value = -536870209;

  }
LABEL_15:

  return value;
}

- (int)close
{
  const char *Name;
  xpc_object_t v4;
  xpc_object_t v5;
  uint64_t v6;
  uint64_t v7;
  int value;
  uint64_t v9;
  NSObject *v10;
  _BOOL4 v11;
  const char *v12;
  void *v13;
  NSObject *v14;
  int v16;
  IOGCFastPathProxyConnection *v17;
  __int16 v18;
  xpc_object_t v19;
  xpc_object_t values;
  char *keys[2];

  keys[1] = *(char **)MEMORY[0x1E0C80C00];
  keys[0] = "selector";
  Name = sel_getName(sel_close);
  values = xpc_string_create(Name);
  v4 = xpc_dictionary_create((const char *const *)keys, &values, 1uLL);
  v5 = xpc_connection_send_message_with_reply_sync(self->_connection, v4);
  v6 = MEMORY[0x1DF0CE66C]();
  if (v6 != MEMORY[0x1E0C812F8])
  {
    v7 = v6;
    value = -536870209;
    v9 = MEMORY[0x1E0C81310];
    _gc_log_iokit();
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
    if (v7 == v9)
    {
      if (v11)
      {
        v16 = 138412546;
        v17 = self;
        v18 = 2112;
        v19 = v5;
        v12 = "Close for %@ failed: %@";
        goto LABEL_11;
      }
    }
    else if (v11)
    {
      v16 = 138412546;
      v17 = self;
      v18 = 2112;
      v19 = v5;
      v12 = "Close for %@ unknown response: %@";
LABEL_11:
      _os_log_impl(&dword_1DC79E000, v10, OS_LOG_TYPE_DEFAULT, v12, (uint8_t *)&v16, 0x16u);
    }

    xpc_connection_cancel(self->_connection);
    goto LABEL_15;
  }
  xpc_dictionary_get_value(v5, "status");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (MEMORY[0x1DF0CE66C]() == MEMORY[0x1E0C81398])
  {
    value = xpc_uint64_get_value(v13);
  }
  else
  {
    _gc_log_iokit();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      -[IOGCFastPathProxyConnection close].cold.1();
    value = -536870209;

  }
LABEL_15:

  return value;
}

- (id)getProperty:(id)a3
{
  id v4;
  const char *Name;
  id v6;
  xpc_object_t v7;
  xpc_object_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  _BOOL4 v13;
  const char *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  NSObject *v19;
  uint64_t i;
  int v22;
  IOGCFastPathProxyConnection *v23;
  __int16 v24;
  xpc_object_t v25;
  xpc_object_t values[2];
  char *keys[2];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  *(_OWORD *)keys = xmmword_1EA4D46A0;
  Name = sel_getName(sel_getProperty_);
  values[0] = xpc_string_create(Name);
  v6 = objc_retainAutorelease(v4);
  values[1] = xpc_string_create((const char *)objc_msgSend(v6, "UTF8String"));
  v7 = xpc_dictionary_create((const char *const *)keys, values, 2uLL);
  v8 = xpc_connection_send_message_with_reply_sync(self->_connection, v7);
  v9 = MEMORY[0x1DF0CE66C]();
  if (v9 == MEMORY[0x1E0C812F8])
  {
    xpc_dictionary_get_value(v8, "value");
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = (void *)v15;
    if (v15)
    {
      if (MEMORY[0x1DF0CE66C](v15) == MEMORY[0x1E0C81398])
      {
        +[NSNumber numberWithUnsignedLongLong:](&off_1F03A9E90, "numberWithUnsignedLongLong:", xpc_uint64_get_value(v16));
        v17 = objc_claimAutoreleasedReturnValue();
        goto LABEL_20;
      }
      if (MEMORY[0x1DF0CE66C](v16) == MEMORY[0x1E0C81328])
      {
        +[NSNumber numberWithLongLong:](&off_1F03A9E90, "numberWithLongLong:", xpc_int64_get_value(v16));
        v17 = objc_claimAutoreleasedReturnValue();
        goto LABEL_20;
      }
      if (MEMORY[0x1DF0CE66C](v16) == MEMORY[0x1E0C81390])
      {
        +[NSString stringWithUTF8String:](NSString_0, "stringWithUTF8String:", xpc_string_get_string_ptr(v16));
        v17 = objc_claimAutoreleasedReturnValue();
LABEL_20:
        v18 = (void *)v17;
        goto LABEL_21;
      }
    }
    else
    {
      _gc_log_iokit();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
        -[IOGCFastPathProxyConnection getProperty:].cold.1();

    }
    v18 = 0;
LABEL_21:

    goto LABEL_22;
  }
  v10 = v9;
  v11 = MEMORY[0x1E0C81310];
  _gc_log_iokit();
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);
  if (v10 == v11)
  {
    if (v13)
    {
      v22 = 138412546;
      v23 = self;
      v24 = 2112;
      v25 = v8;
      v14 = "getProperty for %@ failed: %@";
      goto LABEL_12;
    }
  }
  else if (v13)
  {
    v22 = 138412546;
    v23 = self;
    v24 = 2112;
    v25 = v8;
    v14 = "getProperty for %@ unknown response: %@";
LABEL_12:
    _os_log_impl(&dword_1DC79E000, v12, OS_LOG_TYPE_DEFAULT, v14, (uint8_t *)&v22, 0x16u);
  }

  xpc_connection_cancel(self->_connection);
  v18 = 0;
LABEL_22:

  for (i = 1; i != -1; --i)
  return v18;
}

- (id)createInputQueueWithOptions:(id)a3 error:(int *)a4
{
  const char *Name;
  xpc_object_t v7;
  xpc_object_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  _BOOL4 v13;
  const char *v14;
  void *v15;
  NSObject *v16;
  id v17;
  int value;
  uint64_t uint64;
  int v21;
  IOGCFastPathProxyConnection *v22;
  __int16 v23;
  xpc_object_t v24;
  xpc_object_t values;
  char *keys[2];

  keys[1] = *(char **)MEMORY[0x1E0C80C00];
  keys[0] = "selector";
  Name = sel_getName(sel_createInputQueue_);
  values = xpc_string_create(Name);
  v7 = xpc_dictionary_create((const char *const *)keys, &values, 1uLL);
  v8 = xpc_connection_send_message_with_reply_sync(self->_connection, v7);
  v9 = MEMORY[0x1DF0CE66C]();
  if (v9 == MEMORY[0x1E0C812F8])
  {
    xpc_dictionary_get_value(v8, "status");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (MEMORY[0x1DF0CE66C]() == MEMORY[0x1E0C81398])
    {
      value = xpc_uint64_get_value(v15);
      if (value)
      {
        v17 = 0;
        *a4 = value;
        goto LABEL_17;
      }
      uint64 = xpc_dictionary_get_uint64(v8, "port");
      if (uint64)
      {
        v17 = -[IOGCFastPathProxyQueue _initWithConnection:queue:]([IOGCFastPathProxyQueue alloc], "_initWithConnection:queue:", self, uint64);
        goto LABEL_17;
      }
      _gc_log_iokit();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
        -[IOGCFastPathProxyConnection createInputQueueWithOptions:error:].cold.1();
    }
    else
    {
      _gc_log_iokit();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
        -[IOGCFastPathProxyConnection createInputQueueWithOptions:error:].cold.2();
    }

    v17 = 0;
    *a4 = -536870209;
LABEL_17:

    goto LABEL_18;
  }
  v10 = v9;
  v11 = MEMORY[0x1E0C81310];
  _gc_log_iokit();
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);
  if (v10 == v11)
  {
    if (v13)
    {
      v21 = 138412546;
      v22 = self;
      v23 = 2112;
      v24 = v8;
      v14 = "createInputQueue for %@ failed: %@";
      goto LABEL_11;
    }
  }
  else if (v13)
  {
    v21 = 138412546;
    v22 = self;
    v23 = 2112;
    v24 = v8;
    v14 = "createInputQueue for %@ unknown response: %@";
LABEL_11:
    _os_log_impl(&dword_1DC79E000, v12, OS_LOG_TYPE_DEFAULT, v14, (uint8_t *)&v21, 0x16u);
  }

  xpc_connection_cancel(self->_connection);
  v17 = 0;
LABEL_18:

  return v17;
}

- (id)description
{
  uint64_t entryID;
  char className[136];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  entryID = 0;
  memset(className, 0, 128);
  IORegistryEntryGetRegistryEntryID(self->_service, &entryID);
  IOObjectGetClass(self->_service, className);
  +[NSString stringWithFormat:](NSString_0, "stringWithFormat:", CFSTR("(PROXY) %s %#llx"), className, entryID);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (unsigned)service
{
  return self->_service;
}

- (unint64_t)clientID
{
  return self->_clientID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connection, 0);
}

- (void)_initWithService:withProxyService:error:.cold.1()
{
  uint64_t v0;
  os_log_t v1;
  const char *v2;
  uint64_t v3;

  OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_0_5(&dword_1DC79E000, v0, v1, "Initiate handshake for <%s %#llx>", v2, v3);
  OUTLINED_FUNCTION_2_5();
}

- (void)_initWithService:withProxyService:error:.cold.2()
{
  uint64_t v0;
  os_log_t v1;
  const char *v2;
  uint64_t v3;

  OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_0_5(&dword_1DC79E000, v0, v1, "Opening proxy connection to <%s %#llx>", v2, v3);
  OUTLINED_FUNCTION_2_5();
}

void __71__IOGCFastPathProxyConnection__initWithService_withProxyService_error___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7_0();
  OUTLINED_FUNCTION_5_2(&dword_1DC79E000, v0, v1, "Proxy connection received unexpected message: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_5();
}

void __71__IOGCFastPathProxyConnection__initWithService_withProxyService_error___block_invoke_cold_2(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1DC79E000, log, OS_LOG_TYPE_ERROR, "Proxy connection invalidated!", v1, 2u);
}

void __71__IOGCFastPathProxyConnection__initWithService_withProxyService_error___block_invoke_cold_3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7_0();
  OUTLINED_FUNCTION_5_2(&dword_1DC79E000, v0, v1, "Proxy connection received error: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_5();
}

void __71__IOGCFastPathProxyConnection__initWithService_withProxyService_error___block_invoke_cold_4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7_0();
  OUTLINED_FUNCTION_5_2(&dword_1DC79E000, v0, v1, "Proxy connection received unknown event: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_5();
}

- (void)mapSharedMemoryAt:ofSize:options:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_4_3();
  OUTLINED_FUNCTION_3_3(&dword_1DC79E000, v0, v1, "mapSharedMemory request for %@ returns %{mach.errno}d");
  OUTLINED_FUNCTION_2_5();
}

- (void)mapSharedMemoryAt:ofSize:options:.cold.2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_5();
  OUTLINED_FUNCTION_0_5(&dword_1DC79E000, v0, v1, "Handshake for %@ returns bad reply: %@");
  OUTLINED_FUNCTION_2_5();
}

- (void)mapSharedMemoryAt:ofSize:options:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7_0();
  OUTLINED_FUNCTION_6_2(&dword_1DC79E000, v0, v1, "%@::mapSharedMemory", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_5();
}

- (void)open
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_5();
  OUTLINED_FUNCTION_0_5(&dword_1DC79E000, v0, v1, "Open for %@ returns bad reply: %@");
  OUTLINED_FUNCTION_2_5();
}

- (void)close
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_5();
  OUTLINED_FUNCTION_0_5(&dword_1DC79E000, v0, v1, "Close for %@ returns bad reply: %@");
  OUTLINED_FUNCTION_2_5();
}

- (void)getProperty:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_5();
  OUTLINED_FUNCTION_0_5(&dword_1DC79E000, v0, v1, "getProperty for %@ returns bad reply: %@");
  OUTLINED_FUNCTION_2_5();
}

- (void)createInputQueueWithOptions:error:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_5();
  OUTLINED_FUNCTION_0_5(&dword_1DC79E000, v0, v1, "createInputQueue for %@ returns bad reply: %@");
  OUTLINED_FUNCTION_2_5();
}

- (void)createInputQueueWithOptions:error:.cold.2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_5();
  OUTLINED_FUNCTION_0_5(&dword_1DC79E000, v0, v1, "createInputQueue for %@ returns bad reply: %@");
  OUTLINED_FUNCTION_2_5();
}

@end
