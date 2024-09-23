void HSAAuthenticationRegisterIncomingAuthenticationTokenBlockWithIdentifier(void *a1, void *a2)
{
  id v3;
  CFMutableDictionaryRef Mutable;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  dispatch_queue_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD handler[4];
  id v17;

  v3 = a1;
  if (_IMWillLog())
  {
    v14 = (void *)MEMORY[0x20BD23FA4](v3);
    v15 = a2;
    _IMAlwaysLog();

  }
  sub_20A372D78();
  objc_msgSend((id)qword_2545F9258, "lock");
  if (v3 && objc_msgSend(a2, "length"))
  {
    if (!qword_2545F9250)
    {
      Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
      v5 = (void *)qword_2545F9250;
      qword_2545F9250 = (uint64_t)Mutable;

    }
    v6 = (void *)objc_msgSend(v3, "copy", v14, v15);
    v7 = (void *)qword_2545F9250;
    v8 = (void *)MEMORY[0x20BD23FA4]();
    objc_msgSend(v7, "setObject:forKey:", v8, a2);

    sub_20A372DD8();
    if (_IMWillLog())
      _IMAlwaysLog();
    if (!qword_2545F9268)
    {
      dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      v9 = objc_claimAutoreleasedReturnValue();
      v10 = dispatch_queue_create("com.apple.hsa-authentication_connection_queue", v9);
      v11 = (void *)qword_2545F9268;
      qword_2545F9268 = (uint64_t)v10;

    }
    if (!qword_2545F9260)
    {
      v12 = IMXPCCreateConnectionForServiceWithQueue();
      v13 = (void *)qword_2545F9260;
      qword_2545F9260 = v12;

      if (qword_2545F9260)
      {
        handler[0] = MEMORY[0x24BDAC760];
        handler[1] = 3221225472;
        handler[2] = sub_20A373550;
        handler[3] = &unk_24C304758;
        v17 = &unk_24C304730;
        xpc_connection_set_event_handler((xpc_connection_t)qword_2545F9260, handler);
        xpc_connection_resume((xpc_connection_t)qword_2545F9260);
        if (_IMWillLog())
          _IMAlwaysLog();

      }
      else
      {
        _IMWarn();
      }
    }
    dispatch_sync((dispatch_queue_t)qword_2545F9268, &unk_24C304778);
    objc_msgSend((id)qword_2545F9258, "unlock");

  }
  else
  {
    if (_IMWillLog())
      _IMAlwaysLog();
    objc_msgSend((id)qword_2545F9258, "unlock", v14, v15);
  }

}

void sub_20A372D78()
{
  if (_IMWillLog())
    _IMAlwaysLog();
  if (qword_2545F9270 != -1)
    dispatch_once(&qword_2545F9270, &unk_24C304670);
}

uint64_t sub_20A372DD8()
{
  uint64_t result;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  result = _IMWillLog();
  if ((_DWORD)result)
  {
    if (_IMWillLog())
      _IMAlwaysLog();
    v10 = 0u;
    v11 = 0u;
    v8 = 0u;
    v9 = 0u;
    objc_msgSend((id)qword_2545F9250, "allKeys");
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    v2 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    if (v2)
    {
      v3 = v2;
      v4 = *(_QWORD *)v9;
      do
      {
        v5 = 0;
        do
        {
          if (*(_QWORD *)v9 != v4)
            objc_enumerationMutation(v1);
          v6 = *(_QWORD *)(*((_QWORD *)&v8 + 1) + 8 * v5);
          if (_IMWillLog())
          {
            objc_msgSend((id)qword_2545F9250, "objectForKey:", v6);
            v7 = (void *)objc_claimAutoreleasedReturnValue();
            _IMAlwaysLog();

          }
          ++v5;
        }
        while (v3 != v5);
        v3 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
      }
      while (v3);
    }

    result = _IMWillLog();
    if ((_DWORD)result)
      return _IMAlwaysLog();
  }
  return result;
}

uint64_t HSAAuthenticationUnregisterIncomingAuthenticationTokenBlockWithIdentifier(void *a1)
{
  void *v2;
  void *v3;

  if (_IMWillLog())
    _IMAlwaysLog();
  sub_20A372D78();
  objc_msgSend((id)qword_2545F9258, "lock");
  if (!objc_msgSend(a1, "length"))
  {
    if (!_IMWillLog())
      return objc_msgSend((id)qword_2545F9258, "unlock");
LABEL_18:
    _IMAlwaysLog();
    return objc_msgSend((id)qword_2545F9258, "unlock");
  }
  if (!qword_2545F9250)
  {
    if (!_IMWillLog())
      return objc_msgSend((id)qword_2545F9258, "unlock");
    goto LABEL_18;
  }
  objc_msgSend((id)qword_2545F9250, "objectForKey:", a1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v2)
  {
    if (!_IMWillLog())
      return objc_msgSend((id)qword_2545F9258, "unlock");
    goto LABEL_18;
  }
  objc_msgSend((id)qword_2545F9250, "removeObjectForKey:", a1);
  sub_20A372DD8();
  if (!objc_msgSend((id)qword_2545F9250, "count"))
  {
    v3 = (void *)qword_2545F9250;
    qword_2545F9250 = 0;

    if (_IMWillLog())
      _IMAlwaysLog();
    if (qword_2545F9260)
    {
      if (_IMWillLog())
        _IMAlwaysLog();
      xpc_connection_cancel((xpc_connection_t)qword_2545F9260);
    }
  }
  return objc_msgSend((id)qword_2545F9258, "unlock");
}

void sub_20A373118()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x24BDD1648]);
  v1 = (void *)qword_2545F9258;
  qword_2545F9258 = (uint64_t)v0;

}

void sub_20A373140()
{
  void *v0;

  _IMWarn();
  v0 = (void *)qword_2545F9260;
  qword_2545F9260 = 0;

}

void sub_20A373168(uint64_t a1, void *a2, void *a3)
{
  _xpc_connection_s *v4;
  id v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  int v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  uint64_t v20;
  void *v21;
  void *pid;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  _xpc_connection_s *v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v4 = a2;
  v5 = a3;
  if (MEMORY[0x20BD240A0]() == MEMORY[0x24BDACFB8])
  {
    if (v5 != (id)MEMORY[0x24BDACF38])
    {
      if (v5 == (id)MEMORY[0x24BDACF30])
      {
        if (!_IMWillLog())
          goto LABEL_2;
      }
      else if (v5 != (id)MEMORY[0x24BDACF48] || !_IMWillLog())
      {
        goto LABEL_2;
      }
      pid = (void *)xpc_connection_get_pid(v4);
      _IMAlwaysLog();
      goto LABEL_2;
    }
    if (_IMWillLog())
    {
      pid = (void *)xpc_connection_get_pid(v4);
      _IMAlwaysLog();
    }
    xpc_connection_cancel(v4);
    if (_IMWillLog())
      _IMAlwaysLog();
    v21 = (void *)qword_2545F9260;
    qword_2545F9260 = 0;

  }
LABEL_2:
  v6 = v5;
  if (_IMWillLog())
  {
    v7 = (void *)MEMORY[0x20BD24070](v6);
    if (_IMWillLog())
    {
      pid = (void *)xpc_connection_get_pid(v4);
      v23 = v7;
      _IMAlwaysLog();
    }
    free(v7);
  }
  v8 = v6;
  IMGetXPCStringFromDictionary();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  IMGetXPCStringFromDictionary();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  IMGetXPCStringFromDictionary();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  IMGetXPCStringFromDictionary();
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "length");
  v14 = _IMWillLog();
  if (v13)
  {
    v26 = v8;
    v27 = v4;
    if (v14)
    {
      v24 = v10;
      v25 = v11;
      pid = v12;
      v23 = v9;
      _IMAlwaysLog();
    }
    objc_msgSend((id)qword_2545F9258, "lock", pid, v23, v24, v25);
    v30 = 0u;
    v31 = 0u;
    v28 = 0u;
    v29 = 0u;
    objc_msgSend((id)qword_2545F9250, "allValues");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
    if (v16)
    {
      v17 = v16;
      v18 = *(_QWORD *)v29;
      do
      {
        for (i = 0; i != v17; ++i)
        {
          if (*(_QWORD *)v29 != v18)
            objc_enumerationMutation(v15);
          v20 = *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * i);
          if (_IMWillLog())
            _IMAlwaysLog();
          (*(void (**)(uint64_t, void *, void *, void *, void *))(v20 + 16))(v20, v9, v10, v11, v12);
        }
        v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
      }
      while (v17);
    }

    objc_msgSend((id)qword_2545F9258, "unlock");
    v8 = v26;
    v4 = v27;
  }
  else if (v14)
  {
    _IMAlwaysLog();
  }

}

uint64_t sub_20A373550(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void sub_20A373568()
{
  xpc_object_t v0;
  xpc_object_t message;

  v0 = xpc_dictionary_create(0, 0, 0);
  if (v0 && qword_2545F9260)
  {
    message = v0;
    IMInsertBoolsToXPCDictionary();
    if (_IMWillLog())
      _IMAlwaysLog();
    xpc_connection_send_message((xpc_connection_t)qword_2545F9260, message);

  }
  else if (v0)
  {

  }
}

void sub_20A373650()
{
  HSAAuthenticationServer *v0;
  void *v1;

  v0 = objc_alloc_init(HSAAuthenticationServer);
  v1 = (void *)qword_253E79B20;
  qword_253E79B20 = (uint64_t)v0;

}

uint64_t sub_20A373794(uint64_t a1)
{
  if (_IMWillLog())
    _IMAlwaysLog();
  return objc_msgSend(*(id *)(a1 + 32), "_cleanup");
}

void sub_20A3737DC(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  _xpc_connection_s *v6;
  id v7;
  uint64_t v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  _BOOL4 v13;
  int v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t pid;
  void *v19;
  void *v20;

  v4 = a2;
  v5 = a3;
  xpc_connection_get_audit_token();
  if (IMDAuditTokenTaskHasEntitlement())
  {
    v6 = (_xpc_connection_s *)v4;
    v7 = v5;
    if (_IMWillLog())
    {
      pid = xpc_connection_get_pid(v6);
      _IMAlwaysLog();
    }
    v8 = MEMORY[0x20BD240A0](v7);
    if (v8 == MEMORY[0x24BDACFB8])
    {
      if (v7 == (id)MEMORY[0x24BDACF38])
      {
        if (_IMWillLog())
        {
          pid = xpc_connection_get_pid(v6);
          _IMAlwaysLog();
        }
        +[HSAAuthenticationServer sharedInstance](HSAAuthenticationServer, "sharedInstance", pid);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "_cleanupClient:", v6);

        xpc_connection_cancel(v6);
        goto LABEL_34;
      }
      if (v7 != (id)MEMORY[0x24BDACF30])
      {
        if (v7 == (id)MEMORY[0x24BDACF48] && _IMWillLog())
        {
          xpc_connection_get_pid(v6);
          _IMAlwaysLog();
        }
        goto LABEL_34;
      }
      if (_IMWillLog())
      {
        pid = xpc_connection_get_pid(v6);
        _IMAlwaysLog();
      }
      +[HSAAuthenticationServer sharedInstance](HSAAuthenticationServer, "sharedInstance", pid);
      v9 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "_cleanupClient:", v6);
      goto LABEL_33;
    }
    if (v8 != MEMORY[0x24BDACFA0])
    {
LABEL_34:

      goto LABEL_35;
    }
    v9 = v7;
    if (_IMWillLog())
    {
      v10 = (void *)MEMORY[0x20BD24070](v9);
      if (_IMWillLog())
      {
        pid = xpc_connection_get_pid(v6);
        v19 = v10;
        _IMAlwaysLog();
      }
      free(v10);
    }
    if (xpc_dictionary_get_BOOL(v9, "setup-request"))
    {
      if (_IMWillLog())
      {
        pid = xpc_connection_get_pid(v6);
        _IMAlwaysLog();
      }
      +[HSAAuthenticationServer sharedInstance](HSAAuthenticationServer, "sharedInstance", pid, v19);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "_configureWithClient:", v6);
    }
    else
    {
      v13 = xpc_dictionary_get_BOOL(v9, "process-incoming-message");
      v14 = _IMWillLog();
      if (!v13)
      {
        if (v14)
        {
          xpc_connection_get_pid(v6);
          _IMAlwaysLog();
        }
        goto LABEL_33;
      }
      if (v14)
      {
        xpc_connection_get_pid(v6);
        _IMAlwaysLog();
      }
      IMGetXPCStringFromDictionary();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      IMGetXPCStringFromDictionary();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      IMGetXPCStringFromDictionary();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      +[HSAAuthenticationServer sharedInstance](HSAAuthenticationServer, "sharedInstance");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "parseIncomingMessageFromNumber:forService:messageBody:", v11, v15, v16);

    }
LABEL_33:

    goto LABEL_34;
  }
  xpc_connection_get_pid((xpc_connection_t)v4);
  IMProcessNameForPid();
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  _IMWarn();

  xpc_connection_cancel((xpc_connection_t)v4);
LABEL_35:

}

CFPropertyListRef sub_20A37420C(const __CFString *a1)
{
  return (id)CFPreferencesCopyAppValue(a1, CFSTR("com.apple.carrier"));
}

void sub_20A374510()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Messages", "HSA");
  v1 = (void *)qword_2545F9280;
  qword_2545F9280 = (uint64_t)v0;

}

void HSAAuthenticationProcessIncomingMessage()
{
  int v0;
  xpc_object_t v1;
  void *v2;
  _xpc_connection_s *connection;

  if (_IMWillLog())
    _IMAlwaysLog();
  if (qword_253E79B30 != -1)
    dispatch_once(&qword_253E79B30, &unk_24C3046B0);
  connection = (_xpc_connection_s *)IMXPCCreateConnectionForServiceWithQueue();
  v0 = _IMWillLog();
  if (connection)
  {
    if (v0)
      _IMAlwaysLog();
    v1 = xpc_dictionary_create(0, 0, 0);
    if (v1)
    {
      v2 = v1;
      IMInsertNSStringsToXPCDictionary();
      IMInsertNSStringsToXPCDictionary();
      IMInsertNSStringsToXPCDictionary();
      xpc_dictionary_set_BOOL(v2, "process-incoming-message", 1);
      if (_IMWillLog())
        _IMAlwaysLog();
      xpc_connection_send_message(connection, v2);

    }
    else
    {
      xpc_connection_cancel(connection);
    }

  }
  else if (v0)
  {
    _IMAlwaysLog();
  }
}

void sub_20A374718()
{
  dispatch_queue_t v0;
  void *v1;
  NSObject *v2;

  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v2 = objc_claimAutoreleasedReturnValue();
  v0 = dispatch_queue_create("com.apple.HSAAuthenticationMessageQueue", v2);
  v1 = (void *)qword_253E79B28;
  qword_253E79B28 = (uint64_t)v0;

}

uint64_t sub_20A374768()
{
  uint64_t result;

  result = _IMWillLog();
  if ((_DWORD)result)
    return _IMAlwaysLog();
  return result;
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFMutableDictionaryRef)MEMORY[0x24BDBBDF0](allocator, capacity, keyCallBacks, valueCallBacks);
}

CFPropertyListRef CFPreferencesCopyAppValue(CFStringRef key, CFStringRef applicationID)
{
  return (CFPropertyListRef)MEMORY[0x24BDBC160](key, applicationID);
}

uint64_t IMDAuditTokenTaskHasEntitlement()
{
  return MEMORY[0x24BE50678]();
}

uint64_t IMGetXPCStringFromDictionary()
{
  return MEMORY[0x24BE50708]();
}

uint64_t IMInsertBoolsToXPCDictionary()
{
  return MEMORY[0x24BE50720]();
}

uint64_t IMInsertNSStringsToXPCDictionary()
{
  return MEMORY[0x24BE50750]();
}

uint64_t IMProcessNameForPid()
{
  return MEMORY[0x24BE507A8]();
}

uint64_t IMXPCCreateConnectionForServiceWithQueue()
{
  return MEMORY[0x24BE50858]();
}

uint64_t IMXPCCreateServerConnection()
{
  return MEMORY[0x24BE50860]();
}

uint64_t _IMAlwaysLog()
{
  return MEMORY[0x24BE50920]();
}

uint64_t _IMWarn()
{
  return MEMORY[0x24BE509B0]();
}

uint64_t _IMWillLog()
{
  return MEMORY[0x24BE509C0]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x24BDAC780](exception_object);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB90](dso, log, type, format, buf, *(_QWORD *)&size);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x24BDADE98](predicate, block);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return (dispatch_queue_attr_t)MEMORY[0x24BDADEB8](attr, frequency);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x24BDADED0](label, attr);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADFE8](queue, block);
}

void free(void *a1)
{
  MEMORY[0x24BDAE450](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x24BEDCF88]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDCFD0](a1);
}

id objc_begin_catch(void *exc_buf)
{
  return (id)MEMORY[0x24BEDCFD8](exc_buf);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x24BEDCFE8]();
}

void objc_end_catch(void)
{
  MEMORY[0x24BEDD050]();
}

void objc_enumerationMutation(id obj)
{
  MEMORY[0x24BEDD068](obj);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x24BEDD120](a1, a2);
}

void objc_release(id a1)
{
  MEMORY[0x24BEDD188](a1);
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x24BEDD2A0](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD2B0](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x24BEDD2C0](a1);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x24BEDD410](location, obj);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x24BDAF368](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}

void xpc_connection_cancel(xpc_connection_t connection)
{
  MEMORY[0x24BDB0718](connection);
}

uint64_t xpc_connection_get_audit_token()
{
  return MEMORY[0x24BDB0758]();
}

pid_t xpc_connection_get_pid(xpc_connection_t connection)
{
  return MEMORY[0x24BDB0788](connection);
}

void xpc_connection_resume(xpc_connection_t connection)
{
  MEMORY[0x24BDB0798](connection);
}

void xpc_connection_send_message(xpc_connection_t connection, xpc_object_t message)
{
  MEMORY[0x24BDB07A8](connection, message);
}

void xpc_connection_set_event_handler(xpc_connection_t connection, xpc_handler_t handler)
{
  MEMORY[0x24BDB07C8](connection, handler);
}

char *__cdecl xpc_copy_description(xpc_object_t object)
{
  return (char *)MEMORY[0x24BDB0820](object);
}

xpc_object_t xpc_dictionary_create(const char *const *keys, xpc_object_t *values, size_t count)
{
  return (xpc_object_t)MEMORY[0x24BDB08C0](keys, values, count);
}

BOOL xpc_dictionary_get_BOOL(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x24BDB0908](xdict, key);
}

void xpc_dictionary_set_BOOL(xpc_object_t xdict, const char *key, BOOL value)
{
  MEMORY[0x24BDB0978](xdict, key, value);
}

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return (xpc_type_t)MEMORY[0x24BDB0A70](object);
}

