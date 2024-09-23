@implementation DOMRegisterForMatching

void __DOMRegisterForMatching_block_invoke(uint64_t a1)
{
  xpc_connection_t mach_service;
  void *v3;
  _xpc_connection_s *v4;
  _QWORD handler[4];
  id v6;
  id v7;
  char buffer[256];
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  CFStringGetCString(*(CFStringRef *)(a1 + 56), buffer, 256, 0x8000100u);
  mach_service = xpc_connection_create_mach_service(buffer, *(dispatch_queue_t *)(a1 + 32), 1uLL);
  v3 = (void *)DOMRegisterForMatching_listener;
  DOMRegisterForMatching_listener = (uint64_t)mach_service;

  v4 = (_xpc_connection_s *)DOMRegisterForMatching_listener;
  handler[0] = MEMORY[0x24BDAC760];
  handler[1] = 3221225472;
  handler[2] = __DOMRegisterForMatching_block_invoke_2;
  handler[3] = &unk_24E6AAFA0;
  v6 = *(id *)(a1 + 40);
  v7 = *(id *)(a1 + 48);
  xpc_connection_set_event_handler(v4, handler);
  xpc_connection_resume((xpc_connection_t)DOMRegisterForMatching_listener);

}

void __DOMRegisterForMatching_block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  id v6;
  _QWORD handler[4];
  id v8;
  id v9;
  id v10;

  v3 = a2;
  logEvent(v3, (uint64_t)"Plugin Main:");
  v4 = MEMORY[0x227665CF0](v3);
  if (v4 == MEMORY[0x24BDACF88])
  {
    v6 = v3;
    handler[0] = MEMORY[0x24BDAC760];
    handler[1] = 3221225472;
    handler[2] = __DOMRegisterForMatching_block_invoke_3;
    handler[3] = &unk_24E6AAF78;
    v9 = *(id *)(a1 + 32);
    v10 = *(id *)(a1 + 40);
    v8 = v6;
    xpc_connection_set_event_handler((xpc_connection_t)v6, handler);
    xpc_connection_resume((xpc_connection_t)v6);

    v5 = v9;
    goto LABEL_5;
  }
  if (v4 == MEMORY[0x24BDACFB8])
  {
    errorEvent(v3, (uint64_t)"listener error");
    xpc_connection_cancel((xpc_connection_t)DOMRegisterForMatching_listener);
    v5 = (void *)DOMRegisterForMatching_listener;
    DOMRegisterForMatching_listener = 0;
LABEL_5:

  }
}

void __DOMRegisterForMatching_block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  id v8;
  uint64_t uint64;
  uint64_t v10;
  id v11;
  unsigned int (**v12)(id, uint64_t, const void *, _BYTE *);
  uint64_t v13;
  void *v14;
  uint64_t v15;
  const void *v16;
  mach_port_t v17;
  const __CFDictionary *v18;
  uint64_t MatchingService;
  BOOL v20;
  id v21;
  uint64_t v22;
  mach_port_t v23;
  const __CFDictionary *v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  __CFArray *Mutable;
  size_t v29;
  NSObject *v30;
  uint64_t v31;
  const __CFDictionary *v32;
  uint64_t v33;
  void *v34;
  CFIndex v35;
  io_object_t ValueAtIndex;
  int v37;
  xpc_object_t reply;
  _xpc_connection_s *v39;
  void *v40;
  id v41;
  id v42;
  id v43;
  uint64_t v44;
  id v45;
  id v46;
  id v47;
  CFTypeRef cf;
  _BYTE buf[24];
  uint64_t v50;

  v50 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  logEvent(v3, (uint64_t)"Plugin Inner:");
  if (v3 == (id)MEMORY[0x24BDACF38])
    goto LABEL_52;
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_220DB2000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "Handling Message", buf, 2u);
  }
  v4 = *(void **)(a1 + 40);
  v5 = *(void **)(a1 + 48);
  v6 = v3;
  v7 = v4;
  v8 = v5;
  if (MEMORY[0x227665CF0](v6) == MEMORY[0x24BDACFA0])
  {
    uint64 = xpc_dictionary_get_uint64(v6, "_LB_TYPE");
    if (uint64)
    {
      v10 = uint64;
      if (uint64 < 4)
      {
        if (uint64 != 2)
        {
          if (uint64 == 1)
          {
            v46 = v8;
            v11 = v6;
            v12 = (unsigned int (**)(id, uint64_t, const void *, _BYTE *))v7;
            v13 = xpc_dictionary_get_uint64(v11, "_LB_SERVICE_ID");
            *(_QWORD *)buf = xpc_dictionary_get_int64(v11, "_LB_PROBE_SCORE");
            xpc_dictionary_get_value(v11, "_LB_PERSONALITY");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            if (v14 && (v15 = _CFXPCCreateCFObjectFromXPCObject()) != 0)
            {
              v16 = (const void *)v15;
              v42 = v7;
              v17 = *MEMORY[0x24BDD8B18];
              v18 = IORegistryEntryIDMatching(v13);
              MatchingService = IOServiceGetMatchingService(v17, v18);
              if ((_DWORD)MatchingService)
                v20 = v12[2](v12, MatchingService, v16, buf) != 0;
              else
                v20 = 0;
              reply = xpc_dictionary_create_reply(v11);
              xpc_dictionary_set_uint64(reply, "_LB_TYPE", 3uLL);
              xpc_dictionary_set_int64(reply, "_LB_PROBE_SCORE", *(int64_t *)buf);
              xpc_dictionary_set_BOOL(reply, "_LB_SUPPORTS", v20);
              xpc_dictionary_get_remote_connection(reply);
              v39 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
              xpc_connection_send_message(v39, reply);

              if ((_DWORD)MatchingService)
                IOObjectRelease(MatchingService);
              CFRelease(v16);

              v37 = 0;
              v7 = v42;
            }
            else
            {
              v37 = 3;
            }

            v8 = v46;
            goto LABEL_48;
          }
          goto LABEL_47;
        }
        v21 = v6;
        v45 = v8;
        v22 = xpc_dictionary_get_uint64(v21, "_LB_SERVICE_ID");
        v23 = *MEMORY[0x24BDD8B18];
        v24 = IORegistryEntryIDMatching(v22);
        v25 = IOServiceGetMatchingService(v23, v24);
        if (!(_DWORD)v25)
        {
          v40 = 0;
          v27 = 0;
          v37 = 2;
          v34 = v45;
LABEL_44:

          goto LABEL_48;
        }
        v26 = v25;
        xpc_dictionary_get_value(v21, "_LB_PERSONALITY");
        v44 = objc_claimAutoreleasedReturnValue();
        if (v44 && (cf = (CFTypeRef)_CFXPCCreateCFObjectFromXPCObject()) != 0)
        {
          xpc_dictionary_get_value(v21, "_LB_CLAIMED");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          if (v27)
          {
            Mutable = CFArrayCreateMutable(0, 0, 0);
            if (xpc_array_get_count(v27))
            {
              v41 = v21;
              v47 = v8;
              v43 = v7;
              v29 = 0;
              v30 = MEMORY[0x24BDACB70];
              do
              {
                v31 = xpc_array_get_uint64(v27, v29);
                v32 = IORegistryEntryIDMatching(v31);
                v33 = IOServiceGetMatchingService(v23, v32);
                v26 = v33;
                if ((_DWORD)v33)
                {
                  CFArrayAppendValue(Mutable, (const void *)v33);
                }
                else if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 134217984;
                  *(_QWORD *)&buf[4] = v31;
                  _os_log_impl(&dword_220DB2000, v30, OS_LOG_TYPE_DEFAULT, "Couldn't create service for id %llx", buf, 0xCu);
                }
                ++v29;
              }
              while (v29 < xpc_array_get_count(v27));
              v7 = v43;
              v8 = v47;
              v21 = v41;
            }
            v34 = v45;
            (*((void (**)(id, uint64_t, CFTypeRef, __CFArray *))v45 + 2))(v45, v26, cf, Mutable);
            if (Mutable)
            {
              if (CFArrayGetCount(Mutable) >= 1)
              {
                v35 = 0;
                do
                {
                  ValueAtIndex = CFArrayGetValueAtIndex(Mutable, v35);
                  IOObjectRelease(ValueAtIndex);
                  ++v35;
                }
                while (CFArrayGetCount(Mutable) > v35);
              }
              CFRelease(Mutable);
              v34 = v45;
            }
            v37 = 0;
            if (!(_DWORD)v26)
              goto LABEL_41;
          }
          else
          {
            v34 = v45;
            (*((void (**)(id, uint64_t, CFTypeRef, _QWORD))v45 + 2))(v45, v26, cf, 0);
            v37 = 0;
          }
        }
        else
        {
          v27 = 0;
          cf = 0;
          v37 = 3;
          v34 = v45;
        }
        IOObjectRelease(v26);
LABEL_41:
        if (cf)
          CFRelease(cf);
        v40 = (void *)v44;
        goto LABEL_44;
      }
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        *(_QWORD *)&buf[4] = v10;
        _os_log_impl(&dword_220DB2000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "got weird type from LB: %lld", buf, 0xCu);
      }
    }
  }
LABEL_47:
  v37 = 1;
LABEL_48:

  if (v37)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      __DOMRegisterForMatching_block_invoke_3_cold_1(v37);
    xpc_connection_cancel(*(xpc_connection_t *)(a1 + 32));
  }
LABEL_52:

}

void __DOMRegisterForMatching_block_invoke_3_cold_1(int a1)
{
  _DWORD v1[2];
  uint64_t v2;

  v2 = *MEMORY[0x24BDAC8D0];
  v1[0] = 67109120;
  v1[1] = a1;
  _os_log_error_impl(&dword_220DB2000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "Bad juju: %d", (uint8_t *)v1, 8u);
}

@end
