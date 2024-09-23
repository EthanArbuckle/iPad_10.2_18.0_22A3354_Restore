@implementation IOGCFastPathProxyQueue

- (id)_initWithConnection:(id)a3 queue:(unint64_t)a4
{
  IOGCFastPathProxyConnection *v6;
  IOGCFastPathProxyQueue *v7;
  IOGCFastPathProxyConnection *parent;
  objc_super v10;

  v6 = (IOGCFastPathProxyConnection *)a3;
  v10.receiver = self;
  v10.super_class = (Class)IOGCFastPathProxyQueue;
  v7 = -[IOGCFastPathProxyQueue init](&v10, sel_init);
  parent = v7->_parent;
  v7->_parent = v6;

  v7->_queue = a4;
  return v7;
}

- (int)mapMemoryAt:(unint64_t *)a3 ofSize:(unint64_t *)a4 options:(unsigned int)a5
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
  uint64_t i;
  uint8_t buf[4];
  IOGCFastPathProxyQueue *v32;
  __int16 v33;
  xpc_object_t v34;
  xpc_object_t values[2];
  char *keys[2];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  _gc_log_iokit();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    -[IOGCFastPathProxyQueue mapMemoryAt:ofSize:options:].cold.3();

  *(_OWORD *)keys = xmmword_1EA4D46B0;
  Name = sel_getName(sel_mapMemoryForQueue_);
  values[0] = xpc_string_create(Name);
  values[1] = xpc_uint64_create(self->_queue);
  v10 = xpc_dictionary_create((const char *const *)keys, values, 2uLL);
  v11 = xpc_connection_send_message_with_reply_sync(self->_parent->_connection, v10);
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
        -[IOGCFastPathProxyQueue mapMemoryAt:ofSize:options:].cold.2();
      value = -536870209;

      goto LABEL_31;
    }
    value = xpc_uint64_get_value(v18);
    _gc_log_iokit();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
      -[IOGCFastPathProxyQueue mapMemoryAt:ofSize:options:].cold.1();

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
        value = mach_vm_map(*MEMORY[0x1E0C83DA0], a3, uint64, 0, 1, v23, 0, 0, 1, 1, 2u);
        if (value)
        {
          _gc_log_iokit();
          v26 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 67109120;
            LODWORD(v32) = value;
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
      v32 = self;
      v28 = "mapMemory reply for %@ missing 'memory_size' argument";
    }
    else
    {
      _gc_log_iokit();
      v27 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
      {
LABEL_30:
        value = -536870209;

        xpc_connection_cancel(self->_parent->_connection);
LABEL_31:

        goto LABEL_32;
      }
      *(_DWORD *)buf = 138412290;
      v32 = self;
      v28 = "mapMemory reply for %@ missing 'memory' argument";
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
      v32 = self;
      v33 = 2112;
      v34 = v11;
      v17 = "mapMemory for %@ failed: %@";
      goto LABEL_13;
    }
  }
  else if (v16)
  {
    *(_DWORD *)buf = 138412546;
    v32 = self;
    v33 = 2112;
    v34 = v11;
    v17 = "mapMemory for %@ unknown response: %@";
LABEL_13:
    _os_log_impl(&dword_1DC79E000, v15, OS_LOG_TYPE_DEFAULT, v17, buf, 0x16u);
  }
  value = -536870209;

  xpc_connection_cancel(self->_parent->_connection);
LABEL_32:

  for (i = 1; i != -1; --i)
  return value;
}

- (int)unmapMemoryAt:(unint64_t)a3
{
  return 0;
}

- (int)getProperties:(id)a3 dictionary:(id *)a4
{
  id v6;
  NSObject *v7;
  xpc_object_t empty;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  xpc_object_t v14;
  const char *Name;
  id v16;
  xpc_object_t v17;
  xpc_object_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  int value;
  uint64_t v23;
  NSObject *v24;
  _BOOL4 v25;
  const char *v26;
  void *v27;
  NSObject *v28;
  NSObject *v29;
  uint64_t j;
  NSObject *v32;
  void *v33;
  id v34;
  id v35;
  _QWORD applier[4];
  id v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  uint8_t buf[4];
  IOGCFastPathProxyQueue *v43;
  __int16 v44;
  xpc_object_t v45;
  xpc_object_t values[3];
  char *keys[2];
  const char *v48;
  _BYTE v49[128];
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  _gc_log_iokit();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    -[IOGCFastPathProxyQueue getProperties:dictionary:].cold.4();

  empty = xpc_array_create_empty();
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  v41 = 0u;
  v9 = v6;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v38, v49, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v39;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v39 != v12)
          objc_enumerationMutation(v9);
        v14 = xpc_string_create((const char *)objc_msgSend(objc_retainAutorelease(*(id *)(*((_QWORD *)&v38 + 1) + 8 * i)), "UTF8String"));
        xpc_array_append_value(empty, v14);

      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v38, v49, 16);
    }
    while (v11);
  }

  *(_OWORD *)keys = xmmword_1EA4D46C0;
  v48 = "keys";
  Name = sel_getName(sel_getQueue_properties_);
  values[0] = xpc_string_create(Name);
  values[1] = xpc_uint64_create(self->_queue);
  v16 = empty;
  values[2] = v16;
  v17 = xpc_dictionary_create((const char *const *)keys, values, 3uLL);
  v18 = xpc_connection_send_message_with_reply_sync(self->_parent->_connection, v17);
  v19 = MEMORY[0x1DF0CE66C]();
  v20 = MEMORY[0x1E0C812F8];
  if (v19 == MEMORY[0x1E0C812F8])
  {
    xpc_dictionary_get_value(v18, "status");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    if (MEMORY[0x1DF0CE66C]() == MEMORY[0x1E0C81398])
    {
      value = xpc_uint64_get_value(v27);
      _gc_log_iokit();
      v29 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
        -[IOGCFastPathProxyQueue getProperties:dictionary:].cold.2();

      if (value)
        goto LABEL_25;
      xpc_dictionary_get_value(v18, "properties");
      v28 = objc_claimAutoreleasedReturnValue();
      if (MEMORY[0x1DF0CE66C]() == v20)
      {
        v33 = (void *)objc_opt_new();
        applier[0] = MEMORY[0x1E0C809B0];
        applier[1] = 3221225472;
        applier[2] = __51__IOGCFastPathProxyQueue_getProperties_dictionary___block_invoke;
        applier[3] = &unk_1EA4D46E0;
        v34 = v33;
        v37 = v34;
        xpc_dictionary_apply(v28, applier);
        v35 = *a4;
        *a4 = v34;
        v32 = v34;

        value = 0;
      }
      else
      {
        value = -536870209;
        _gc_log_iokit();
        v32 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
          -[IOGCFastPathProxyQueue getProperties:dictionary:].cold.1();
      }

    }
    else
    {
      value = -536870209;
      _gc_log_iokit();
      v28 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
        -[IOGCFastPathProxyQueue getProperties:dictionary:].cold.3();
    }

LABEL_25:
    goto LABEL_26;
  }
  v21 = v19;
  value = -536870209;
  v23 = MEMORY[0x1E0C81310];
  _gc_log_iokit();
  v24 = objc_claimAutoreleasedReturnValue();
  v25 = os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT);
  if (v21 == v23)
  {
    if (v25)
    {
      *(_DWORD *)buf = 138412546;
      v43 = self;
      v44 = 2112;
      v45 = v18;
      v26 = "getProperties for %@ failed: %@";
      goto LABEL_20;
    }
  }
  else if (v25)
  {
    *(_DWORD *)buf = 138412546;
    v43 = self;
    v44 = 2112;
    v45 = v18;
    v26 = "getProperties for %@ unknown response: %@";
LABEL_20:
    _os_log_impl(&dword_1DC79E000, v24, OS_LOG_TYPE_DEFAULT, v26, buf, 0x16u);
  }

  xpc_connection_cancel(self->_parent->_connection);
LABEL_26:

  for (j = 2; j != -1; --j)
  return value;
}

uint64_t __51__IOGCFastPathProxyQueue_getProperties_dictionary___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v5 = a3;
  if (MEMORY[0x1DF0CE66C]() == MEMORY[0x1E0C81398])
  {
    v6 = *(void **)(a1 + 32);
    +[NSNumber numberWithUnsignedLongLong:](&off_1F03A9E90, "numberWithUnsignedLongLong:", xpc_uint64_get_value(v5));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[NSString stringWithUTF8String:](NSString_0, "stringWithUTF8String:", a2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKey:", v7, v8);

  }
  if (MEMORY[0x1DF0CE66C](v5) == MEMORY[0x1E0C81328])
  {
    v9 = *(void **)(a1 + 32);
    +[NSNumber numberWithLongLong:](&off_1F03A9E90, "numberWithLongLong:", xpc_int64_get_value(v5));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    +[NSString stringWithUTF8String:](NSString_0, "stringWithUTF8String:", a2);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKey:", v10, v11);

  }
  return 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_parent, 0);
}

- (void)mapMemoryAt:ofSize:options:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_4_3();
  OUTLINED_FUNCTION_3_3(&dword_1DC79E000, v0, v1, "mapMemory request for %@ returns %{mach.errno}d");
  OUTLINED_FUNCTION_2_5();
}

- (void)mapMemoryAt:ofSize:options:.cold.2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_5();
  OUTLINED_FUNCTION_0_5(&dword_1DC79E000, v0, v1, "mapMemory for %@ returns bad reply: %@");
  OUTLINED_FUNCTION_2_5();
}

- (void)mapMemoryAt:ofSize:options:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7_0();
  OUTLINED_FUNCTION_6_2(&dword_1DC79E000, v0, v1, "%@::mapMemoryAt", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_5();
}

- (void)getProperties:dictionary:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_5();
  OUTLINED_FUNCTION_0_5(&dword_1DC79E000, v0, v1, "getProperties for %@ returns bad reply: %@");
  OUTLINED_FUNCTION_2_5();
}

- (void)getProperties:dictionary:.cold.2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_4_3();
  OUTLINED_FUNCTION_3_3(&dword_1DC79E000, v0, v1, "getProperties request for %@ returns %{mach.errno}d");
  OUTLINED_FUNCTION_2_5();
}

- (void)getProperties:dictionary:.cold.3()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_5();
  OUTLINED_FUNCTION_0_5(&dword_1DC79E000, v0, v1, "getProperties for %@ returns bad reply: %@");
  OUTLINED_FUNCTION_2_5();
}

- (void)getProperties:dictionary:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7_0();
  OUTLINED_FUNCTION_6_2(&dword_1DC79E000, v0, v1, "%@::getProperties", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_5();
}

@end
