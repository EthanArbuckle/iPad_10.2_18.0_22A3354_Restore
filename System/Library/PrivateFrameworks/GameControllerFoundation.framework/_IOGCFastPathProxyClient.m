@implementation _IOGCFastPathProxyClient

+ (id)withIncomingConnection:(uint64_t)a1
{
  id v2;
  void *v3;

  v2 = a2;
  v3 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_self()), "initWithIncomingConnection:", v2);

  return v3;
}

- (_IOGCFastPathProxyClient)initWithIncomingConnection:(id)a3
{
  id v4;
  id v5;
  dispatch_queue_t v6;
  void *v7;
  void *v8;
  id v9;
  _xpc_connection_s *v10;
  _IOGCFastPathProxyClient *v11;
  _QWORD handler[4];
  _IOGCFastPathProxyClient *v14;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)_IOGCFastPathProxyClient;
  v5 = -[_IOGCFastPathProxyClient init](&v15, sel_init);
  v6 = dispatch_queue_create("_IOGCFastPathProxyClient", 0);
  v7 = (void *)*((_QWORD *)v5 + 1);
  *((_QWORD *)v5 + 1) = v6;

  v8 = (void *)*((_QWORD *)v5 + 2);
  *((_QWORD *)v5 + 2) = v4;
  v9 = v4;

  xpc_connection_get_audit_token();
  xpc_connection_set_target_queue(*((xpc_connection_t *)v5 + 2), *((dispatch_queue_t *)v5 + 1));
  v10 = (_xpc_connection_s *)*((_QWORD *)v5 + 2);
  handler[0] = MEMORY[0x1E0C809B0];
  handler[1] = 3221225472;
  handler[2] = __55___IOGCFastPathProxyClient_initWithIncomingConnection___block_invoke;
  handler[3] = &unk_1EA4D2B60;
  v11 = (_IOGCFastPathProxyClient *)v5;
  v14 = v11;
  xpc_connection_set_event_handler(v10, handler);
  xpc_connection_activate(*((xpc_connection_t *)v5 + 2));

  return v11;
}

- (void)handleMessage:(uint64_t)a1
{
  id v3;
  void *v4;
  const char *string;
  uint64_t v6;
  char *Uid;
  NSObject *v8;
  NSObject *v9;
  io_service_t v10;
  io_service_t v11;
  xpc_object_t v12;
  NSObject *v13;
  uint64_t v14;
  vm_map_t *v15;
  int v16;
  NSObject *v17;
  xpc_object_t v18;
  mach_port_t v19;
  kern_return_t v20;
  NSObject *v21;
  NSObject *v22;
  mach_port_t v23;
  xpc_object_t v24;
  xpc_object_t v25;
  kern_return_t v26;
  NSObject *v27;
  int v28;
  xpc_object_t reply;
  NSObject *v30;
  const char *v31;
  io_registry_entry_t v32;
  NSString *v33;
  void *CFProperty;
  NSObject *v35;
  xpc_object_t v36;
  kern_return_t memory_entry_64;
  NSObject *v38;
  xpc_object_t v39;
  const __CFData *v40;
  const __CFData *v41;
  mach_port_t v42;
  const UInt8 *BytePtr;
  size_t Length;
  kern_return_t v45;
  NSObject *v46;
  xpc_object_t v47;
  xpc_object_t v48;
  NSObject *v49;
  uint64_t v50;
  vm_map_t *v51;
  int v52;
  NSObject *v53;
  xpc_object_t v54;
  NSObject *v55;
  uint64_t uint64;
  void *v57;
  id v58;
  uint64_t v59;
  id v60;
  const __CFData *v61;
  const __CFData *v62;
  mach_port_t v63;
  const UInt8 *v64;
  size_t v65;
  kern_return_t v66;
  void *v67;
  NSObject *v68;
  xpc_object_t v69;
  NSObject *v70;
  NSObject *v71;
  kern_return_t v72;
  NSObject *v73;
  xpc_object_t v74;
  NSObject *v75;
  xpc_object_t v76;
  xpc_object_t v77;
  _QWORD v78[4];
  id v79;
  _QWORD applier[4];
  id v81;
  mach_port_t object_handle[2];
  _BYTE buf[22];
  os_activity_scope_state_s input;
  uint8_t v85[8];
  uint8_t outputStruct[8];
  uint64_t v87;

  v87 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = v3;
  if (!a1)
    goto LABEL_70;
  string = xpc_dictionary_get_string(v3, "selector");
  if (!string)
  {
    _gc_log_iokit();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)&buf[4] = v4;
      _os_log_impl(&dword_1DC79E000, v8, OS_LOG_TYPE_DEFAULT, "Client received message without selector: %@", buf, 0xCu);
    }
    goto LABEL_13;
  }
  v6 = (uint64_t)string;
  Uid = (char *)sel_getUid(string);
  if (Uid == sel_connect_)
  {
    v9 = _os_activity_create(&dword_1DC79E000, "[IOGCFastPathProxyClient] Connect", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = 0;
    os_activity_scope_enter(v9, (os_activity_scope_state_t)buf);
    v10 = xpc_dictionary_copy_mach_send();
    v11 = v10;
    if (v10)
    {
      if (!*(_DWORD *)(a1 + 60))
      {
        v26 = IOServiceOpen(v10, *MEMORY[0x1E0C83DA0], 1u, (io_connect_t *)(a1 + 64));
        if (!v26)
          *(_DWORD *)(a1 + 60) = v11;
        _gc_log_iokit();
        v27 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
        {
          v28 = *(_DWORD *)(a1 + 60);
          LODWORD(input.opaque[0]) = 67109376;
          HIDWORD(input.opaque[0]) = v28;
          LOWORD(input.opaque[1]) = 1024;
          *(_DWORD *)((char *)&input.opaque[1] + 2) = v26;
          _os_log_impl(&dword_1DC79E000, v27, OS_LOG_TYPE_DEFAULT, "IOServiceOpen(%x) returns %{mach.errno}d", (uint8_t *)&input, 0xEu);
        }

        reply = xpc_dictionary_create_reply(v4);
        xpc_dictionary_set_uint64(reply, "status", v26);
        xpc_connection_send_message(*(xpc_connection_t *)(a1 + 16), reply);

        os_activity_scope_leave((os_activity_scope_state_t)buf);
        goto LABEL_70;
      }
      v12 = xpc_dictionary_create_reply(v4);
      xpc_dictionary_set_uint64(v12, "status", 0xFFFFFFFFE00002D5);
      xpc_connection_send_message(*(xpc_connection_t *)(a1 + 16), v12);

    }
    else
    {
      _gc_log_iokit();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        LODWORD(input.opaque[0]) = 136315138;
        *(uint64_t *)((char *)input.opaque + 4) = v6;
        _os_log_impl(&dword_1DC79E000, v22, OS_LOG_TYPE_DEFAULT, "Client received '%s' message with missing 'service' argument", (uint8_t *)&input, 0xCu);
      }

      xpc_connection_cancel(*(xpc_connection_t *)(a1 + 16));
    }
LABEL_59:
    os_activity_scope_leave((os_activity_scope_state_t)buf);

    goto LABEL_70;
  }
  if (Uid == sel_mapSharedMemory)
  {
    v13 = _os_activity_create(&dword_1DC79E000, "[IOGCFastPathProxyClient] mapSharedMemory", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = 0;
    os_activity_scope_enter(v13, (os_activity_scope_state_t)buf);
    v14 = *(unsigned int *)(a1 + 64);
    if ((_DWORD)v14)
    {
      input.opaque[0] = 0;
      *(_QWORD *)outputStruct = 0;
      v15 = (vm_map_t *)MEMORY[0x1E0C83DA0];
      v16 = MEMORY[0x1DF0CD934](v14, 0, *MEMORY[0x1E0C83DA0], &input, outputStruct, 1);
      _gc_log_iokit();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)v85 = 67109120;
        *(_DWORD *)&v85[4] = v16;
        _os_log_impl(&dword_1DC79E000, v17, OS_LOG_TYPE_DEFAULT, "IOConnectMapMemory64() returns %{mach.errno}d", v85, 8u);
      }

      if (v16)
      {
        v18 = xpc_dictionary_create_reply(v4);
        xpc_dictionary_set_uint64(v18, "status", v16);
        xpc_connection_send_message(*(xpc_connection_t *)(a1 + 16), v18);

      }
      else
      {
        object_handle[0] = 0;
        memory_entry_64 = mach_make_memory_entry_64(*v15, (memory_object_size_t *)outputStruct, input.opaque[0], 1, object_handle, 0);
        _gc_log_iokit();
        v38 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)v85 = 67109120;
          *(_DWORD *)&v85[4] = memory_entry_64;
          _os_log_impl(&dword_1DC79E000, v38, OS_LOG_TYPE_DEFAULT, "mach_make_memory_entry_64() returns %{mach.errno}d", v85, 8u);
        }

        v39 = xpc_dictionary_create_reply(v4);
        if (memory_entry_64)
        {
          xpc_dictionary_set_uint64(v39, "status", memory_entry_64);
        }
        else
        {
          xpc_dictionary_set_uint64(v39, "status", 0);
          xpc_dictionary_set_mach_send();
          xpc_dictionary_set_uint64(v39, "memory_size", *(uint64_t *)outputStruct);
        }
        xpc_connection_send_message(*(xpc_connection_t *)(a1 + 16), v39);

      }
      goto LABEL_69;
    }
    goto LABEL_36;
  }
  if (Uid == sel_open)
  {
    v9 = _os_activity_create(&dword_1DC79E000, "[IOGCFastPathProxyClient] open", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = 0;
    os_activity_scope_enter(v9, (os_activity_scope_state_t)buf);
    v19 = *(_DWORD *)(a1 + 64);
    if (v19)
    {
      input.opaque[0] = 0;
      v20 = IOConnectCallMethod(v19, 0, input.opaque, 1u, 0, 0, 0, 0, 0, 0);
      _gc_log_iokit();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)outputStruct = 67109120;
        *(_DWORD *)&outputStruct[4] = v20;
        _os_log_impl(&dword_1DC79E000, v21, OS_LOG_TYPE_DEFAULT, "IOConnectCallMethod() returns %{mach.errno}d", outputStruct, 8u);
      }
      goto LABEL_35;
    }
LABEL_58:
    v48 = xpc_dictionary_create_reply(v4);
    xpc_dictionary_set_uint64(v48, "status", 0xFFFFFFFFE00002D8);
    xpc_connection_send_message(*(xpc_connection_t *)(a1 + 16), v48);

    goto LABEL_59;
  }
  if (Uid == sel_close)
  {
    v9 = _os_activity_create(&dword_1DC79E000, "[IOGCFastPathProxyClient] Close", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = 0;
    os_activity_scope_enter(v9, (os_activity_scope_state_t)buf);
    v23 = *(_DWORD *)(a1 + 64);
    if (v23)
    {
      input.opaque[0] = 0;
      v20 = IOConnectCallMethod(v23, 1u, input.opaque, 1u, 0, 0, 0, 0, 0, 0);
      _gc_log_iokit();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)outputStruct = 67109120;
        *(_DWORD *)&outputStruct[4] = v20;
        _os_log_impl(&dword_1DC79E000, v21, OS_LOG_TYPE_DEFAULT, "IOConnectCallMethod() returns %{mach.errno}d", outputStruct, 8u);
      }
LABEL_35:

      v24 = xpc_dictionary_create_reply(v4);
      xpc_dictionary_set_uint64(v24, "status", v20);
      xpc_connection_send_message(*(xpc_connection_t *)(a1 + 16), v24);

      goto LABEL_59;
    }
    goto LABEL_58;
  }
  if (Uid == sel_getProperty_)
  {
    v30 = _os_activity_create(&dword_1DC79E000, "[IOGCFastPathProxyClient] GetProperty", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
    input.opaque[0] = 0;
    input.opaque[1] = 0;
    os_activity_scope_enter(v30, &input);
    if (*(_DWORD *)(a1 + 64))
    {
      v31 = xpc_dictionary_get_string(v4, "key");
      if (!v31)
      {
        _gc_log_iokit();
        v68 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v68, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315138;
          *(_QWORD *)&buf[4] = v6;
          _os_log_impl(&dword_1DC79E000, v68, OS_LOG_TYPE_DEFAULT, "Client received '%s' message with missing 'key' argument", buf, 0xCu);
        }

        xpc_connection_cancel(*(xpc_connection_t *)(a1 + 16));
        goto LABEL_90;
      }
      v32 = *(_DWORD *)(a1 + 60);
      v33 = +[NSString stringWithUTF8String:](NSString_0, "stringWithUTF8String:", v31);
      CFProperty = (void *)IORegistryEntryCreateCFProperty(v32, (CFStringRef)v33, (CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0);
      _gc_log_iokit();
      v35 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315394;
        *(_QWORD *)&buf[4] = v31;
        *(_WORD *)&buf[12] = 2112;
        *(_QWORD *)&buf[14] = CFProperty;
        _os_log_impl(&dword_1DC79E000, v35, OS_LOG_TYPE_DEFAULT, "IORegistryEntryCreateCFProperty(%s) returns %@", buf, 0x16u);
      }

      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v36 = xpc_dictionary_create_reply(v4);
        xpc_dictionary_set_uint64(v36, "value", objc_msgSend(CFProperty, "unsignedIntegerValue"));
        xpc_connection_send_message(*(xpc_connection_t *)(a1 + 16), v36);
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v36 = xpc_dictionary_create_reply(v4);
          xpc_dictionary_set_string(v36, "value", (const char *)objc_msgSend(objc_retainAutorelease(CFProperty), "UTF8String"));
        }
        else
        {
          v36 = xpc_dictionary_create_reply(v4);
        }
        xpc_connection_send_message(*(xpc_connection_t *)(a1 + 16), v36);
      }

    }
    else
    {
      CFProperty = xpc_dictionary_create_reply(v4);
      xpc_dictionary_set_uint64(CFProperty, "status", 0xFFFFFFFFE00002D8);
      xpc_connection_send_message(*(xpc_connection_t *)(a1 + 16), CFProperty);
    }

LABEL_90:
    os_activity_scope_leave(&input);

    goto LABEL_70;
  }
  if (Uid == sel_createInputQueue_)
  {
    v13 = _os_activity_create(&dword_1DC79E000, "[IOGCFastPathProxyClient] CreateInputQueue", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = 0;
    os_activity_scope_enter(v13, (os_activity_scope_state_t)buf);
    if (*(_DWORD *)(a1 + 64))
    {
      input.opaque[0] = 0;
      *(_QWORD *)outputStruct = 0;
      object_handle[0] = 1;
      v40 = IOCFSerialize(&unk_1EA4F1970, 0);
      v41 = v40;
      if (v40)
      {
        v42 = *(_DWORD *)(a1 + 64);
        BytePtr = CFDataGetBytePtr(v40);
        Length = CFDataGetLength(v41);
        v45 = IOConnectCallMethod(v42, 2u, input.opaque, 1u, BytePtr, Length, (uint64_t *)outputStruct, object_handle, 0, 0);
        _gc_log_iokit();
        v46 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)v85 = 67109120;
          *(_DWORD *)&v85[4] = v45;
          _os_log_impl(&dword_1DC79E000, v46, OS_LOG_TYPE_DEFAULT, "IOConnectCallMethod() returns %{mach.errno}d", v85, 8u);
        }

        v47 = xpc_dictionary_create_reply(v4);
        xpc_dictionary_set_uint64(v47, "status", v45);
        xpc_dictionary_set_uint64(v47, "port", *(uint64_t *)outputStruct);
        xpc_connection_send_message(*(xpc_connection_t *)(a1 + 16), v47);
      }
      else
      {
        v47 = xpc_dictionary_create_reply(v4);
        xpc_dictionary_set_uint64(v47, "status", 0xFFFFFFFFE00002C9);
        xpc_connection_send_message(*(xpc_connection_t *)(a1 + 16), v47);
      }

      goto LABEL_69;
    }
LABEL_36:
    v25 = xpc_dictionary_create_reply(v4);
    xpc_dictionary_set_uint64(v25, "status", 0xFFFFFFFFE00002D8);
    xpc_connection_send_message(*(xpc_connection_t *)(a1 + 16), v25);

LABEL_69:
    os_activity_scope_leave((os_activity_scope_state_t)buf);

    goto LABEL_70;
  }
  if (Uid != sel_mapMemoryForQueue_)
  {
    if (Uid != sel_getQueue_properties_)
    {
      _gc_log_iokit();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        *(_QWORD *)&buf[4] = v6;
        _os_log_impl(&dword_1DC79E000, v8, OS_LOG_TYPE_DEFAULT, "Client received message without unknown selector: %s", buf, 0xCu);
      }
LABEL_13:

      xpc_connection_cancel(*(xpc_connection_t *)(a1 + 16));
      goto LABEL_70;
    }
    v55 = _os_activity_create(&dword_1DC79E000, "[IOGCFastPathProxyClient] GetQueueProperties", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = 0;
    os_activity_scope_enter(v55, (os_activity_scope_state_t)buf);
    if (*(_DWORD *)(a1 + 64))
    {
      uint64 = xpc_dictionary_get_uint64(v4, "queue");
      if (!uint64)
      {
        _gc_log_iokit();
        v71 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v71, OS_LOG_TYPE_DEFAULT))
        {
          LODWORD(input.opaque[0]) = 136315138;
          *(uint64_t *)((char *)input.opaque + 4) = v6;
          _os_log_impl(&dword_1DC79E000, v71, OS_LOG_TYPE_DEFAULT, "Client received '%s' message with missing 'queue' argument", (uint8_t *)&input, 0xCu);
        }

        xpc_connection_cancel(*(xpc_connection_t *)(a1 + 16));
        goto LABEL_116;
      }
      xpc_dictionary_get_array(v4, "keys");
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      if (v57)
      {
        input.opaque[0] = uint64;
        *(_QWORD *)outputStruct = 0;
        *(_QWORD *)v85 = -3;
        *(_QWORD *)object_handle = 0;
        v58 = objc_alloc_init((Class)&off_1F03AA5A0);
        v59 = MEMORY[0x1E0C809B0];
        applier[0] = MEMORY[0x1E0C809B0];
        applier[1] = 3221225472;
        applier[2] = __42___IOGCFastPathProxyClient_handleMessage___block_invoke;
        applier[3] = &unk_1EA4D47E0;
        v60 = v58;
        v81 = v60;
        xpc_array_apply(v57, applier);
        v61 = IOCFSerialize(v60, 0);
        v62 = v61;
        if (v61)
        {
          v63 = *(_DWORD *)(a1 + 64);
          v64 = CFDataGetBytePtr(v61);
          v65 = CFDataGetLength(v62);
          v66 = IOConnectCallMethod(v63, 5u, input.opaque, 1u, v64, v65, 0, 0, outputStruct, (size_t *)v85);
          if (v66)
          {
            v67 = xpc_dictionary_create_reply(v4);
            xpc_dictionary_set_uint64(v67, "status", v66);
            xpc_connection_send_message(*(xpc_connection_t *)(a1 + 16), v67);
          }
          else
          {
            IOCFUnserializeBinary(*(const char **)outputStruct, *(size_t *)v85, (CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, (CFStringRef *)object_handle);
            v67 = (void *)objc_claimAutoreleasedReturnValue();
            if (v67 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
            {
              v76 = xpc_dictionary_create_reply(v4);
              xpc_dictionary_set_uint64(v76, "status", 0);
              v78[0] = v59;
              v78[1] = 3221225472;
              v78[2] = __42___IOGCFastPathProxyClient_handleMessage___block_invoke_2;
              v78[3] = &unk_1EA4D4808;
              v77 = xpc_dictionary_create_empty();
              v79 = v77;
              objc_msgSend(v67, "enumerateKeysAndObjectsUsingBlock:", v78);
              xpc_dictionary_set_value(v76, "properties", v77);
              xpc_connection_send_message(*(xpc_connection_t *)(a1 + 16), v76);

            }
            else
            {
              v76 = xpc_dictionary_create_reply(v4);
              xpc_dictionary_set_uint64(v76, "status", 0xFFFFFFFFE00002C9);
              xpc_connection_send_message(*(xpc_connection_t *)(a1 + 16), v76);
            }

          }
        }
        else
        {
          v67 = xpc_dictionary_create_reply(v4);
          xpc_dictionary_set_uint64(v67, "status", 0xFFFFFFFFE00002C9);
          xpc_connection_send_message(*(xpc_connection_t *)(a1 + 16), v67);
        }

      }
      else
      {
        _gc_log_iokit();
        v75 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v75, OS_LOG_TYPE_DEFAULT))
        {
          LODWORD(input.opaque[0]) = 136315138;
          *(uint64_t *)((char *)input.opaque + 4) = v6;
          _os_log_impl(&dword_1DC79E000, v75, OS_LOG_TYPE_DEFAULT, "Client received '%s' message with missing 'queue' argument", (uint8_t *)&input, 0xCu);
        }

        xpc_connection_cancel(*(xpc_connection_t *)(a1 + 16));
      }
    }
    else
    {
      v57 = xpc_dictionary_create_reply(v4);
      xpc_dictionary_set_uint64(v57, "status", 0xFFFFFFFFE00002D8);
      xpc_connection_send_message(*(xpc_connection_t *)(a1 + 16), v57);
    }

LABEL_116:
    os_activity_scope_leave((os_activity_scope_state_t)buf);

    goto LABEL_70;
  }
  v49 = _os_activity_create(&dword_1DC79E000, "[IOGCFastPathProxyClient] MapMemoryForQueue", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  input.opaque[0] = 0;
  input.opaque[1] = 0;
  os_activity_scope_enter(v49, &input);
  if (*(_DWORD *)(a1 + 64))
  {
    v50 = xpc_dictionary_get_uint64(v4, "queue");
    if (v50)
    {
      *(_QWORD *)outputStruct = 0;
      *(_QWORD *)v85 = 0;
      v51 = (vm_map_t *)MEMORY[0x1E0C83DA0];
      v52 = MEMORY[0x1DF0CD934](*(unsigned int *)(a1 + 64), v50, *MEMORY[0x1E0C83DA0], outputStruct, v85, 1);
      _gc_log_iokit();
      v53 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109120;
        *(_DWORD *)&buf[4] = v52;
        _os_log_impl(&dword_1DC79E000, v53, OS_LOG_TYPE_DEFAULT, "IOConnectMapMemory64() returns %{mach.errno}d", buf, 8u);
      }

      if (v52)
      {
        v54 = xpc_dictionary_create_reply(v4);
        xpc_dictionary_set_uint64(v54, "status", v52);
        xpc_connection_send_message(*(xpc_connection_t *)(a1 + 16), v54);

      }
      else
      {
        object_handle[0] = 0;
        v72 = mach_make_memory_entry_64(*v51, (memory_object_size_t *)v85, *(memory_object_offset_t *)outputStruct, 1, object_handle, 0);
        _gc_log_iokit();
        v73 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v73, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134218240;
          *(_QWORD *)&buf[4] = *(_QWORD *)outputStruct;
          *(_WORD *)&buf[12] = 1024;
          *(_DWORD *)&buf[14] = v72;
          _os_log_impl(&dword_1DC79E000, v73, OS_LOG_TYPE_DEFAULT, "mach_make_memory_entry_64(%p) returns %{mach.errno}d", buf, 0x12u);
        }

        v74 = xpc_dictionary_create_reply(v4);
        if (v72)
        {
          xpc_dictionary_set_uint64(v74, "status", v72);
        }
        else
        {
          xpc_dictionary_set_uint64(v74, "status", 0);
          xpc_dictionary_set_mach_send();
          xpc_dictionary_set_uint64(v74, "memory_size", *(uint64_t *)v85);
        }
        xpc_connection_send_message(*(xpc_connection_t *)(a1 + 16), v74);

      }
    }
    else
    {
      _gc_log_iokit();
      v70 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v70, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        *(_QWORD *)&buf[4] = v6;
        _os_log_impl(&dword_1DC79E000, v70, OS_LOG_TYPE_DEFAULT, "Client received '%s' message with missing 'queue' argument", buf, 0xCu);
      }

      xpc_connection_cancel(*(xpc_connection_t *)(a1 + 16));
    }
  }
  else
  {
    v69 = xpc_dictionary_create_reply(v4);
    xpc_dictionary_set_uint64(v69, "status", 0xFFFFFFFFE00002D8);
    xpc_connection_send_message(*(xpc_connection_t *)(a1 + 16), v69);

  }
  os_activity_scope_leave(&input);

LABEL_70:
}

- (_IOGCFastPathProxyClient)init
{
  -[_IOGCFastPathProxyClient doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);

  return 0;
}

- (void)dealloc
{
  NSObject *v3;
  OS_xpc_object *connection;
  OS_xpc_object *v5;
  objc_super v6;
  uint8_t buf[4];
  _IOGCFastPathProxyClient *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  _gc_log_iokit();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v8 = self;
    _os_log_impl(&dword_1DC79E000, v3, OS_LOG_TYPE_DEFAULT, "%@::dealloc", buf, 0xCu);
  }

  connection = self->_connection;
  if (connection)
  {
    xpc_connection_cancel(connection);
    v5 = self->_connection;
    self->_connection = 0;

  }
  v6.receiver = self;
  v6.super_class = (Class)_IOGCFastPathProxyClient;
  -[_IOGCFastPathProxyClient dealloc](&v6, sel_dealloc);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end
