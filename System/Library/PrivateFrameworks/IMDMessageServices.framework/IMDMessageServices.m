IMDMessageServicesCenter *sub_21B14008C()
{
  IMDMessageServicesCenter *result;

  result = objc_alloc_init(IMDMessageServicesCenter);
  qword_253E79AC0 = (uint64_t)result;
  return result;
}

uint64_t sub_21B140360(uint64_t a1)
{
  NSObject *v2;
  uint8_t v4[16];

  if (IMOSLoggingEnabled())
  {
    v2 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v4 = 0;
      _os_log_impl(&dword_21B13F000, v2, OS_LOG_TYPE_INFO, "Message Services agent disconnected", v4, 2u);
    }
  }
  return objc_msgSend(*(id *)(a1 + 32), "_disconnected");
}

uint64_t sub_21B1405BC(uint64_t a1, void *a2)
{
  uint64_t v4;
  NSObject *v5;
  const char *v6;
  uint64_t result;
  NSObject *v8;
  const char *string;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  NSObject *v14;
  int v15;
  uint64_t v16;
  __int16 v17;
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v4 = MEMORY[0x22075D6E0](a2);
  if (v4 == MEMORY[0x24BDACFB8])
  {
    if (IMOSLoggingEnabled())
    {
      v8 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        string = xpc_dictionary_get_string(a2, (const char *)*MEMORY[0x24BDACF40]);
        v15 = 136315138;
        v16 = (uint64_t)string;
        _os_log_impl(&dword_21B13F000, v8, OS_LOG_TYPE_INFO, "Error received in message routing reply handler: %s", (uint8_t *)&v15, 0xCu);
      }
    }
    result = *(_QWORD *)(a1 + 32);
    if (result)
      return (*(uint64_t (**)(uint64_t, _QWORD, double))(result + 16))(result, 0, 0.0);
  }
  else if (v4 == MEMORY[0x24BDACFA0])
  {
    v10 = (void *)MEMORY[0x22075D6BC](a2);
    if (IMOSLoggingEnabled())
    {
      v11 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      {
        v15 = 136315138;
        v16 = (uint64_t)v10;
        _os_log_impl(&dword_21B13F000, v11, OS_LOG_TYPE_DEBUG, "received reply: %s", (uint8_t *)&v15, 0xCu);
      }
    }
    free(v10);
    objc_msgSend(CFSTR("__kIMDMessageServicesRoutingDictionaryKey"), "UTF8String");
    v12 = IMGetXPCDictionaryFromDictionary();
    objc_msgSend(CFSTR("__kIMDMessageServicesCallbackIntervalKey"), "UTF8String");
    v13 = IMGetXPCIntFromDictionary();
    if (IMOSLoggingEnabled())
    {
      v14 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        v15 = 134218242;
        v16 = v13;
        v17 = 2112;
        v18 = v12;
        _os_log_impl(&dword_21B13F000, v14, OS_LOG_TYPE_INFO, "Received routing reply (callbackInterval:%lld): %@", (uint8_t *)&v15, 0x16u);
      }
    }
    result = *(_QWORD *)(a1 + 32);
    if (result)
      return (*(uint64_t (**)(uint64_t, uint64_t, double))(result + 16))(result, v12, (double)v13);
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      v5 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        v6 = xpc_dictionary_get_string(a2, (const char *)*MEMORY[0x24BDACF40]);
        v15 = 136315138;
        v16 = (uint64_t)v6;
        _os_log_impl(&dword_21B13F000, v5, OS_LOG_TYPE_INFO, "Error reply type in message routing reply handler: %s", (uint8_t *)&v15, 0xCu);
      }
    }
    result = *(_QWORD *)(a1 + 32);
    if (result)
      return (*(uint64_t (**)(uint64_t, _QWORD, double))(result + 16))(result, 0, 0.0);
  }
  return result;
}

void sub_21B140878(_Unwind_Exception *a1, int a2)
{
  if (a2 == 1)
  {
    objc_begin_catch(a1);
    objc_end_catch();
    JUMPOUT(0x21B140704);
  }
  _Unwind_Resume(a1);
}

uint64_t sub_21B140BF8(uint64_t a1, void *a2)
{
  uint64_t v4;
  NSObject *v5;
  const char *v6;
  uint64_t result;
  NSObject *v8;
  const char *string;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  NSObject *v14;
  int v15;
  uint64_t v16;
  __int16 v17;
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v4 = MEMORY[0x22075D6E0](a2);
  if (v4 == MEMORY[0x24BDACFB8])
  {
    if (IMOSLoggingEnabled())
    {
      v8 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        string = xpc_dictionary_get_string(a2, (const char *)*MEMORY[0x24BDACF40]);
        v15 = 136315138;
        v16 = (uint64_t)string;
        _os_log_impl(&dword_21B13F000, v8, OS_LOG_TYPE_INFO, "Error received in message expire state reply handler: %s", (uint8_t *)&v15, 0xCu);
      }
    }
    result = *(_QWORD *)(a1 + 32);
    if (result)
      return (*(uint64_t (**)(uint64_t, _QWORD, double))(result + 16))(result, 0, 0.0);
  }
  else if (v4 == MEMORY[0x24BDACFA0])
  {
    v10 = (void *)MEMORY[0x22075D6BC](a2);
    if (IMOSLoggingEnabled())
    {
      v11 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      {
        v15 = 136315138;
        v16 = (uint64_t)v10;
        _os_log_impl(&dword_21B13F000, v11, OS_LOG_TYPE_DEBUG, "received reply: %s", (uint8_t *)&v15, 0xCu);
      }
    }
    free(v10);
    objc_msgSend(CFSTR("__kIMDMessageServicesExpireStateDictionaryKey"), "UTF8String");
    v12 = IMGetXPCDictionaryFromDictionary();
    objc_msgSend(CFSTR("__kIMDMessageServicesCallbackIntervalKey"), "UTF8String");
    v13 = IMGetXPCIntFromDictionary();
    if (IMOSLoggingEnabled())
    {
      v14 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        v15 = 134218242;
        v16 = v13;
        v17 = 2112;
        v18 = v12;
        _os_log_impl(&dword_21B13F000, v14, OS_LOG_TYPE_INFO, "Received expire state reply (callbackInterval:%lld): %@", (uint8_t *)&v15, 0x16u);
      }
    }
    result = *(_QWORD *)(a1 + 32);
    if (result)
      return (*(uint64_t (**)(uint64_t, uint64_t, double))(result + 16))(result, v12, (double)v13);
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      v5 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        v6 = xpc_dictionary_get_string(a2, (const char *)*MEMORY[0x24BDACF40]);
        v15 = 136315138;
        v16 = (uint64_t)v6;
        _os_log_impl(&dword_21B13F000, v5, OS_LOG_TYPE_INFO, "Error reply type in message expire state reply handler: %s", (uint8_t *)&v15, 0xCu);
      }
    }
    result = *(_QWORD *)(a1 + 32);
    if (result)
      return (*(uint64_t (**)(uint64_t, _QWORD, double))(result + 16))(result, 0, 0.0);
  }
  return result;
}

void sub_21B140EB4(_Unwind_Exception *a1, int a2)
{
  if (a2 == 1)
  {
    objc_begin_catch(a1);
    objc_end_catch();
    JUMPOUT(0x21B140D40);
  }
  _Unwind_Resume(a1);
}

uint64_t sub_21B1411F0(uint64_t a1, void *a2)
{
  uint64_t v4;
  NSObject *v5;
  const char *v6;
  uint64_t result;
  NSObject *v8;
  const char *string;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  NSObject *v14;
  int v15;
  uint64_t v16;
  __int16 v17;
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v4 = MEMORY[0x22075D6E0](a2);
  if (v4 == MEMORY[0x24BDACFB8])
  {
    if (IMOSLoggingEnabled())
    {
      v8 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        string = xpc_dictionary_get_string(a2, (const char *)*MEMORY[0x24BDACF40]);
        v15 = 136315138;
        v16 = (uint64_t)string;
        _os_log_impl(&dword_21B13F000, v8, OS_LOG_TYPE_INFO, "Error received in message watchdog reply handler: %s", (uint8_t *)&v15, 0xCu);
      }
    }
    result = *(_QWORD *)(a1 + 32);
    if (result)
      return (*(uint64_t (**)(uint64_t, _QWORD, double))(result + 16))(result, 0, 0.0);
  }
  else if (v4 == MEMORY[0x24BDACFA0])
  {
    v10 = (void *)MEMORY[0x22075D6BC](a2);
    if (IMOSLoggingEnabled())
    {
      v11 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      {
        v15 = 136315138;
        v16 = (uint64_t)v10;
        _os_log_impl(&dword_21B13F000, v11, OS_LOG_TYPE_DEBUG, "received reply: %s", (uint8_t *)&v15, 0xCu);
      }
    }
    free(v10);
    objc_msgSend(CFSTR("__kIMDMessageServicesWatchdogDictionaryKey"), "UTF8String");
    v12 = IMGetXPCDictionaryFromDictionary();
    objc_msgSend(CFSTR("__kIMDMessageServicesCallbackIntervalKey"), "UTF8String");
    v13 = IMGetXPCIntFromDictionary();
    if (IMOSLoggingEnabled())
    {
      v14 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        v15 = 134218242;
        v16 = v13;
        v17 = 2112;
        v18 = v12;
        _os_log_impl(&dword_21B13F000, v14, OS_LOG_TYPE_INFO, "Received watchdog reply (callbackInterval:%lld): %@", (uint8_t *)&v15, 0x16u);
      }
    }
    result = *(_QWORD *)(a1 + 32);
    if (result)
      return (*(uint64_t (**)(uint64_t, uint64_t, double))(result + 16))(result, v12, (double)v13);
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      v5 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        v6 = xpc_dictionary_get_string(a2, (const char *)*MEMORY[0x24BDACF40]);
        v15 = 136315138;
        v16 = (uint64_t)v6;
        _os_log_impl(&dword_21B13F000, v5, OS_LOG_TYPE_INFO, "Error reply type in message watchdog reply handler: %s", (uint8_t *)&v15, 0xCu);
      }
    }
    result = *(_QWORD *)(a1 + 32);
    if (result)
      return (*(uint64_t (**)(uint64_t, _QWORD, double))(result + 16))(result, 0, 0.0);
  }
  return result;
}

void sub_21B1414AC(_Unwind_Exception *a1, int a2)
{
  if (a2 == 1)
  {
    objc_begin_catch(a1);
    objc_end_catch();
    JUMPOUT(0x21B141338);
  }
  _Unwind_Resume(a1);
}

uint64_t sub_21B1417EC(uint64_t a1, void *a2)
{
  uint64_t v4;
  NSObject *v5;
  const char *v6;
  uint64_t result;
  NSObject *v8;
  const char *string;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  NSObject *v14;
  int v15;
  uint64_t v16;
  __int16 v17;
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v4 = MEMORY[0x22075D6E0](a2);
  if (v4 == MEMORY[0x24BDACFB8])
  {
    if (IMOSLoggingEnabled())
    {
      v8 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        string = xpc_dictionary_get_string(a2, (const char *)*MEMORY[0x24BDACF40]);
        v15 = 136315138;
        v16 = (uint64_t)string;
        _os_log_impl(&dword_21B13F000, v8, OS_LOG_TYPE_INFO, "Error received in message scheduled type reply handler: %s", (uint8_t *)&v15, 0xCu);
      }
    }
    result = *(_QWORD *)(a1 + 32);
    if (result)
      return (*(uint64_t (**)(uint64_t, _QWORD, double))(result + 16))(result, 0, 0.0);
  }
  else if (v4 == MEMORY[0x24BDACFA0])
  {
    v10 = (void *)MEMORY[0x22075D6BC](a2);
    if (IMOSLoggingEnabled())
    {
      v11 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      {
        v15 = 136315138;
        v16 = (uint64_t)v10;
        _os_log_impl(&dword_21B13F000, v11, OS_LOG_TYPE_DEBUG, "received reply: %s", (uint8_t *)&v15, 0xCu);
      }
    }
    free(v10);
    objc_msgSend(CFSTR("__kIMDMessageServicesScheduledMessagesDictionaryKey"), "UTF8String");
    v12 = IMGetXPCDictionaryFromDictionary();
    objc_msgSend(CFSTR("__kIMDMessageServicesCallbackIntervalKey"), "UTF8String");
    v13 = IMGetXPCIntFromDictionary();
    if (IMOSLoggingEnabled())
    {
      v14 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        v15 = 134218242;
        v16 = v13;
        v17 = 2112;
        v18 = v12;
        _os_log_impl(&dword_21B13F000, v14, OS_LOG_TYPE_INFO, "Received schedule type reply (callbackInterval:%lld): %@", (uint8_t *)&v15, 0x16u);
      }
    }
    result = *(_QWORD *)(a1 + 32);
    if (result)
      return (*(uint64_t (**)(uint64_t, uint64_t, double))(result + 16))(result, v12, (double)v13);
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      v5 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        v6 = xpc_dictionary_get_string(a2, (const char *)*MEMORY[0x24BDACF40]);
        v15 = 136315138;
        v16 = (uint64_t)v6;
        _os_log_impl(&dword_21B13F000, v5, OS_LOG_TYPE_INFO, "Error reply type in message schedule type reply handler: %s", (uint8_t *)&v15, 0xCu);
      }
    }
    result = *(_QWORD *)(a1 + 32);
    if (result)
      return (*(uint64_t (**)(uint64_t, _QWORD, double))(result + 16))(result, 0, 0.0);
  }
  return result;
}

void sub_21B141AA8(_Unwind_Exception *a1, int a2)
{
  if (a2 == 1)
  {
    objc_begin_catch(a1);
    objc_end_catch();
    JUMPOUT(0x21B141934);
  }
  _Unwind_Resume(a1);
}

uint64_t IMGetXPCDictionaryFromDictionary()
{
  return MEMORY[0x24BE506F0]();
}

uint64_t IMGetXPCIntFromDictionary()
{
  return MEMORY[0x24BE506F8]();
}

uint64_t IMInsertArraysToXPCDictionary()
{
  return MEMORY[0x24BE50718]();
}

uint64_t IMInsertIntsToXPCDictionary()
{
  return MEMORY[0x24BE50740]();
}

uint64_t IMInsertStringsToXPCDictionary()
{
  return MEMORY[0x24BE50758]();
}

uint64_t IMOSLoggingEnabled()
{
  return MEMORY[0x24BE50790]();
}

uint64_t IMXPCConfigureConnection()
{
  return MEMORY[0x24BE50850]();
}

uint64_t IMXPCCreateConnectionForServiceWithQueue()
{
  return MEMORY[0x24BE50858]();
}

uint64_t OSLogHandleForIMFoundationCategory()
{
  return MEMORY[0x24BE50908]();
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

void free(void *a1)
{
  MEMORY[0x24BDAE450](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x24BEDCF88]();
}

id objc_begin_catch(void *exc_buf)
{
  return (id)MEMORY[0x24BEDCFD8](exc_buf);
}

void objc_end_catch(void)
{
  MEMORY[0x24BEDD050]();
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x24BEDD120](a1, a2);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}

void xpc_connection_cancel(xpc_connection_t connection)
{
  MEMORY[0x24BDB0718](connection);
}

void xpc_connection_send_message_with_reply(xpc_connection_t connection, xpc_object_t message, dispatch_queue_t replyq, xpc_handler_t handler)
{
  MEMORY[0x24BDB07B0](connection, message, replyq, handler);
}

char *__cdecl xpc_copy_description(xpc_object_t object)
{
  return (char *)MEMORY[0x24BDB0820](object);
}

xpc_object_t xpc_dictionary_create(const char *const *keys, xpc_object_t *values, size_t count)
{
  return (xpc_object_t)MEMORY[0x24BDB08C0](keys, values, count);
}

const char *__cdecl xpc_dictionary_get_string(xpc_object_t xdict, const char *key)
{
  return (const char *)MEMORY[0x24BDB0950](xdict, key);
}

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return (xpc_type_t)MEMORY[0x24BDB0A70](object);
}

void xpc_release(xpc_object_t object)
{
  MEMORY[0x24BDB0AE0](object);
}

