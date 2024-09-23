@implementation CSSimpleQueryHasResultsForQuery

void __CSSimpleQueryHasResultsForQuery_block_invoke(uint64_t a1)
{
  xpc_object_t v2;
  xpc_object_t v3;
  const __CFString *v4;
  const __CFArray *v5;
  xpc_object_t v6;
  CFIndex Count;
  CFIndex v8;
  CFIndex v9;
  const __CFString *ValueAtIndex;
  const __CFArray *v11;
  CFIndex v12;
  CFIndex v13;
  CFIndex v14;
  const __CFString *v15;
  const __CFArray *v16;
  CFIndex v17;
  CFIndex v18;
  CFIndex v19;
  const __CFString *v20;
  const void *v21;
  const void *v22;
  const void *v23;
  const void *v24;
  const void *v25;
  const void *v26;
  _QWORD handler[5];
  uint8_t v28[4];
  xpc_object_t v29;
  uint8_t buf[1032];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_18C42F000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Async CSSimpleQueryHasResultsForQuery", buf, 2u);
  }
  if (!sConnection)
  {
    sConnection = (uint64_t)xpc_connection_create_mach_service("com.apple.spotlight.SearchAgent", (dispatch_queue_t)sConnectionQueue, 0);
    xpc_connection_set_target_queue((xpc_connection_t)sConnection, (dispatch_queue_t)sConnectionQueue);
    xpc_connection_set_event_handler((xpc_connection_t)sConnection, &__block_literal_global_23);
    xpc_connection_resume((xpc_connection_t)sConnection);
  }
  v2 = xpc_dictionary_create(0, 0, 0);
  v3 = xpc_dictionary_create(0, 0, 0);
  bzero(buf, 0x400uLL);
  if (!CFStringGetCString(*(CFStringRef *)(a1 + 40), (char *)buf, 1024, 0x8000100u))
    goto LABEL_33;
  xpc_dictionary_set_string(v3, "query", (const char *)buf);
  v4 = *(const __CFString **)(a1 + 48);
  if (v4)
  {
    if (CFStringGetCString(v4, (char *)buf, 1024, 0x8000100u))
    {
      xpc_dictionary_set_string(v2, "kl", (const char *)buf);
      goto LABEL_9;
    }
LABEL_33:
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
    goto LABEL_35;
  }
LABEL_9:
  v5 = *(const __CFArray **)(a1 + 56);
  if (v5 && CFArrayGetCount(v5))
  {
    v6 = xpc_array_create(0, 0);
    Count = CFArrayGetCount(*(CFArrayRef *)(a1 + 56));
    if (Count >= 1)
    {
      v8 = Count;
      v9 = 0;
      do
      {
        ValueAtIndex = (const __CFString *)CFArrayGetValueAtIndex(*(CFArrayRef *)(a1 + 56), v9);
        if (!CFStringGetCString(ValueAtIndex, (char *)buf, 1024, 0x8000100u))
          goto LABEL_34;
        xpc_array_set_string(v6, 0xFFFFFFFFFFFFFFFFLL, (const char *)buf);
      }
      while (v8 != ++v9);
    }
    xpc_dictionary_set_value(v2, "bi", v6);
    xpc_release(v6);
  }
  v11 = *(const __CFArray **)(a1 + 64);
  if (v11 && CFArrayGetCount(v11))
  {
    v6 = xpc_array_create(0, 0);
    v12 = CFArrayGetCount(*(CFArrayRef *)(a1 + 64));
    if (v12 >= 1)
    {
      v13 = v12;
      v14 = 0;
      do
      {
        v15 = (const __CFString *)CFArrayGetValueAtIndex(*(CFArrayRef *)(a1 + 64), v14);
        if (!CFStringGetCString(v15, (char *)buf, 1024, 0x8000100u))
          goto LABEL_34;
        xpc_array_set_string(v6, 0xFFFFFFFFFFFFFFFFLL, (const char *)buf);
      }
      while (v13 != ++v14);
    }
    xpc_dictionary_set_value(v2, "pcs", v6);
    xpc_release(v6);
  }
  v16 = *(const __CFArray **)(a1 + 72);
  if (v16 && CFArrayGetCount(v16))
  {
    v6 = xpc_array_create(0, 0);
    v17 = CFArrayGetCount(*(CFArrayRef *)(a1 + 72));
    if (v17 >= 1)
    {
      v18 = v17;
      v19 = 0;
      while (1)
      {
        v20 = (const __CFString *)CFArrayGetValueAtIndex(*(CFArrayRef *)(a1 + 72), v19);
        if (!CFStringGetCString(v20, (char *)buf, 1024, 0x8000100u))
          break;
        xpc_array_set_string(v6, 0xFFFFFFFFFFFFFFFFLL, (const char *)buf);
        if (v18 == ++v19)
          goto LABEL_29;
      }
LABEL_34:
      (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
      xpc_release(v6);
      goto LABEL_35;
    }
LABEL_29:
    xpc_dictionary_set_value(v2, "pl", v6);
    xpc_release(v6);
  }
  xpc_dictionary_set_uint64(v3, "qid", *(_QWORD *)(a1 + 80));
  xpc_dictionary_set_uint64(v2, "qi", *(_QWORD *)(a1 + 80));
  xpc_dictionary_set_string(v3, "command", "simpleQuery");
  xpc_dictionary_set_value(v3, "context", v2);
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)v28 = 138412290;
    v29 = v3;
    _os_log_impl(&dword_18C42F000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Message %@", v28, 0xCu);
  }
  handler[0] = MEMORY[0x1E0C809B0];
  handler[1] = 0x40000000;
  handler[2] = __CSSimpleQueryHasResultsForQuery_block_invoke_13;
  handler[3] = &unk_1E2404E88;
  handler[4] = *(_QWORD *)(a1 + 32);
  xpc_connection_send_message_with_reply((xpc_connection_t)sConnection, v3, (dispatch_queue_t)sConnectionQueue, handler);
LABEL_35:
  xpc_release(v3);
  xpc_release(v2);
  v21 = *(const void **)(a1 + 40);
  if (v21)
    CFRelease(v21);
  v22 = *(const void **)(a1 + 56);
  if (v22)
    CFRelease(v22);
  v23 = *(const void **)(a1 + 64);
  if (v23)
    CFRelease(v23);
  v24 = *(const void **)(a1 + 48);
  if (v24)
    CFRelease(v24);
  v25 = *(const void **)(a1 + 72);
  if (v25)
    CFRelease(v25);
  v26 = *(const void **)(a1 + 88);
  if (v26)
    CFRelease(v26);
}

void __CSSimpleQueryHasResultsForQuery_block_invoke_1(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  _BOOL4 v5;
  NSObject *v6;
  const char *v7;
  int v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = MEMORY[0x18D7829C8](a2);
  v4 = MEMORY[0x1E0C812F8];
  v5 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT);
  if (v3 == v4)
  {
    if (!v5)
      return;
    v8 = 138412290;
    v9 = a2;
    v6 = MEMORY[0x1E0C81028];
    v7 = "Got dict %@";
  }
  else
  {
    if (!v5)
      return;
    v8 = 138412290;
    v9 = a2;
    v6 = MEMORY[0x1E0C81028];
    v7 = "Got error %@";
  }
  _os_log_impl(&dword_18C42F000, v6, OS_LOG_TYPE_DEFAULT, v7, (uint8_t *)&v8, 0xCu);
}

uint64_t __CSSimpleQueryHasResultsForQuery_block_invoke_13(uint64_t a1, void *a2)
{
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    v5 = 138412290;
    v6 = a2;
    _os_log_impl(&dword_18C42F000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Reply %@", (uint8_t *)&v5, 0xCu);
  }
  if (MEMORY[0x18D7829C8](a2) == MEMORY[0x1E0C812F8])
  {
    xpc_dictionary_get_BOOL(a2, "status");
    xpc_dictionary_get_BOOL(a2, "exists");
  }
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

@end
