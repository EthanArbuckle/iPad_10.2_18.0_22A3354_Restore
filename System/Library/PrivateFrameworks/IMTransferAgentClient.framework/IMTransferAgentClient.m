void sub_23EC9A544()
{
  IMTransferAgentClient *v0;
  void *v1;

  v0 = objc_alloc_init(IMTransferAgentClient);
  v1 = (void *)qword_256DCBBC8;
  qword_256DCBBC8 = (uint64_t)v0;

}

uint64_t sub_23EC9A9A0(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_23EC9A9B0(uint64_t a1)
{

}

void sub_23EC9A9B8(uint64_t a1)
{
  NSObject *v2;
  _xpc_connection_s *v3;
  uint64_t v4;
  void *v5;
  uint8_t v6[16];

  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_23EC99000, v2, OS_LOG_TYPE_INFO, "Transfer service disconnected", v6, 2u);
    }

  }
  v3 = *(_xpc_connection_s **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
  if (v3)
  {
    xpc_connection_cancel(v3);
    v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v5 = *(void **)(v4 + 40);
    *(_QWORD *)(v4 + 40) = 0;

  }
}

void sub_23EC9AA74(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  NSObject *v5;
  const char *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  NSObject *v10;
  const char *string;
  unint64_t v12;
  char *v13;
  NSObject *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  _xpc_connection_s *v20;
  uint64_t v21;
  void *v22;
  const __CFString *v23;
  void *v24;
  const __CFString *v25;
  void *v26;
  uint8_t buf[4];
  const char *v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = MEMORY[0x24265D518]();
  if (v4 == MEMORY[0x24BDACFB8])
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        string = xpc_dictionary_get_string(v3, (const char *)*MEMORY[0x24BDACF40]);
        *(_DWORD *)buf = 136315138;
        v28 = string;
        _os_log_impl(&dword_23EC99000, v10, OS_LOG_TYPE_INFO, "Error received in message reply handler: %s", buf, 0xCu);
      }

    }
    v12 = *(_QWORD *)(a1 + 88);
    if (v12 > 2)
    {
      if (*(_QWORD *)(a1 + 72))
      {
        objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("IMTransferAgentClientErrorDomain"), -4, 0);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = *(_QWORD *)(a1 + 72);
        v25 = CFSTR("error");
        v26 = v17;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v26, &v25, 1);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        (*(void (**)(uint64_t, void *))(v18 + 16))(v18, v19);

      }
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 32), "_uploadRCSFileOnSimID:fileURL:thumbURL:isAudioMessage:userInfo:retries:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(unsigned __int8 *)(a1 + 96), *(_QWORD *)(a1 + 64), v12 + 1, *(_QWORD *)(a1 + 72));
    }
  }
  else if (v4 == MEMORY[0x24BDACFA0])
  {
    v13 = (char *)MEMORY[0x24265D4F4](v3);
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315138;
        v28 = v13;
        _os_log_impl(&dword_23EC99000, v14, OS_LOG_TYPE_INFO, "received reply: %s", buf, 0xCu);
      }

    }
    free(v13);
    IMGetXPCDictionaryFromDictionary();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = *(_QWORD *)(a1 + 72);
    if (v16)
      (*(void (**)(uint64_t, void *))(v16 + 16))(v16, v15);

  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        v6 = xpc_dictionary_get_string(v3, (const char *)*MEMORY[0x24BDACF40]);
        *(_DWORD *)buf = 136315138;
        v28 = v6;
        _os_log_impl(&dword_23EC99000, v5, OS_LOG_TYPE_INFO, "Error reply type in message reply handler: %s", buf, 0xCu);
      }

    }
    if (*(_QWORD *)(a1 + 72))
    {
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("IMTransferAgentClientErrorDomain"), -1, 0);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = *(_QWORD *)(a1 + 72);
      v23 = CFSTR("error");
      v24 = v7;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v24, &v23, 1);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, void *))(v8 + 16))(v8, v9);

    }
  }
  v20 = *(_xpc_connection_s **)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40);
  if (v20)
  {
    xpc_connection_cancel(v20);
    v21 = *(_QWORD *)(*(_QWORD *)(a1 + 80) + 8);
    v22 = *(void **)(v21 + 40);
    *(_QWORD *)(v21 + 40) = 0;

  }
}

void sub_23EC9ADDC(_Unwind_Exception *a1, int a2)
{
  if (a2 == 1)
  {
    objc_begin_catch(a1);
    objc_end_catch();
    JUMPOUT(0x23EC9AC30);
  }
  _Unwind_Resume(a1);
}

void sub_23EC9B1C8(uint64_t a1)
{
  NSObject *v2;
  _xpc_connection_s *v3;
  uint64_t v4;
  void *v5;
  uint8_t v6[16];

  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_23EC99000, v2, OS_LOG_TYPE_INFO, "Transfer service disconnected", v6, 2u);
    }

  }
  v3 = *(_xpc_connection_s **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
  if (v3)
  {
    xpc_connection_cancel(v3);
    v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v5 = *(void **)(v4 + 40);
    *(_QWORD *)(v4 + 40) = 0;

  }
}

void sub_23EC9B284(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  NSObject *v5;
  const char *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  NSObject *v10;
  const char *string;
  uint64_t v12;
  char *v13;
  NSObject *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  _xpc_connection_s *v20;
  uint64_t v21;
  void *v22;
  const __CFString *v23;
  void *v24;
  const __CFString *v25;
  void *v26;
  uint8_t buf[4];
  const char *v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = MEMORY[0x24265D518]();
  if (v4 == MEMORY[0x24BDACFB8])
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        string = xpc_dictionary_get_string(v3, (const char *)*MEMORY[0x24BDACF40]);
        *(_DWORD *)buf = 136315138;
        v28 = string;
        _os_log_impl(&dword_23EC99000, v10, OS_LOG_TYPE_INFO, "Error received in message reply handler: %s", buf, 0xCu);
      }

    }
    v12 = *(_QWORD *)(a1 + 80);
    if (v12 > 2)
    {
      if (*(_QWORD *)(a1 + 64))
      {
        objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("IMTransferAgentClientErrorDomain"), -4, 0);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = *(_QWORD *)(a1 + 64);
        v25 = CFSTR("error");
        v26 = v17;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v26, &v25, 1);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        (*(void (**)(uint64_t, void *))(v18 + 16))(v18, v19);

      }
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 32), "_downloadRCSTransferOnSimID:transferURL:destURL:retries:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), v12 + 1, *(_QWORD *)(a1 + 64));
    }
  }
  else if (v4 == MEMORY[0x24BDACFA0])
  {
    v13 = (char *)MEMORY[0x24265D4F4](v3);
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315138;
        v28 = v13;
        _os_log_impl(&dword_23EC99000, v14, OS_LOG_TYPE_INFO, "received reply: %s", buf, 0xCu);
      }

    }
    free(v13);
    IMGetXPCDictionaryFromDictionary();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = *(_QWORD *)(a1 + 64);
    if (v16)
      (*(void (**)(uint64_t, void *))(v16 + 16))(v16, v15);

  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        v6 = xpc_dictionary_get_string(v3, (const char *)*MEMORY[0x24BDACF40]);
        *(_DWORD *)buf = 136315138;
        v28 = v6;
        _os_log_impl(&dword_23EC99000, v5, OS_LOG_TYPE_INFO, "Error reply type in message reply handler: %s", buf, 0xCu);
      }

    }
    if (*(_QWORD *)(a1 + 64))
    {
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("IMTransferAgentClientErrorDomain"), -1, 0);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = *(_QWORD *)(a1 + 64);
      v23 = CFSTR("error");
      v24 = v7;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v24, &v23, 1);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, void *))(v8 + 16))(v8, v9);

    }
  }
  v20 = *(_xpc_connection_s **)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40);
  if (v20)
  {
    xpc_connection_cancel(v20);
    v21 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
    v22 = *(void **)(v21 + 40);
    *(_QWORD *)(v21 + 40) = 0;

  }
}

void sub_23EC9B5E4(_Unwind_Exception *a1, int a2)
{
  if (a2 == 1)
  {
    objc_begin_catch(a1);
    objc_end_catch();
    JUMPOUT(0x23EC9B440);
  }
  _Unwind_Resume(a1);
}

uint64_t IMGetXPCDictionaryFromDictionary()
{
  return MEMORY[0x24BE506F0]();
}

uint64_t IMInsertBoolsToXPCDictionary()
{
  return MEMORY[0x24BE50720]();
}

uint64_t IMInsertDictionariesToXPCDictionary()
{
  return MEMORY[0x24BE50738]();
}

uint64_t IMInsertNSStringsToXPCDictionary()
{
  return MEMORY[0x24BE50750]();
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

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x24BDAC730](a1, *(_QWORD *)&a2);
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

uint64_t im_primary_queue()
{
  return MEMORY[0x24BE509E0]();
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x24BEDCF88]();
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

void objc_release(id a1)
{
  MEMORY[0x24BEDD188](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD2B0](a1);
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

