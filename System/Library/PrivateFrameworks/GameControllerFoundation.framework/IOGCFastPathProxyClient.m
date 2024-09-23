@implementation IOGCFastPathProxyClient

void __55___IOGCFastPathProxyClient_initWithIncomingConnection___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  NSObject *v5;
  const char *v6;
  uint8_t *v7;
  NSObject *v8;
  uint32_t v9;
  NSObject *v10;
  _QWORD *v11;
  id v15;
  NSObject *v16;
  _BOOL4 v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  __int16 v26;
  uint8_t buf[16];
  __int128 v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = MEMORY[0x1DF0CE66C]();
  if (v4 == MEMORY[0x1E0C812F8])
  {
    _gc_log_iokit();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)&buf[4] = v3;
      _os_log_impl(&dword_1DC79E000, v10, OS_LOG_TYPE_DEFAULT, "Client received message: %@", buf, 0xCu);
    }

    *(_OWORD *)buf = 0u;
    v28 = 0u;
    xpc_dictionary_get_audit_token();
    v11 = *(_QWORD **)(a1 + 32);
    if (*(_QWORD *)buf == v11[3]
      && *(_QWORD *)&buf[8] == v11[4]
      && (_QWORD)v28 == v11[5]
      && *((_QWORD *)&v28 + 1) == v11[6])
    {
      -[_IOGCFastPathProxyClient handleMessage:]((uint64_t)v11, v3);
      goto LABEL_21;
    }
    _gc_log_iokit();
    v5 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      goto LABEL_20;
    v26 = 0;
    v6 = "Bad audit token.";
    v7 = (uint8_t *)&v26;
    v8 = v5;
    v9 = 2;
    goto LABEL_19;
  }
  if (v4 != MEMORY[0x1E0C81310])
  {
    _gc_log_iokit();
    v5 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
LABEL_20:

      xpc_connection_cancel(*(xpc_connection_t *)(*(_QWORD *)(a1 + 32) + 16));
      goto LABEL_21;
    }
    *(_DWORD *)buf = 138412290;
    *(_QWORD *)&buf[4] = v3;
    v6 = "Client received unknown event: %@";
    v7 = buf;
    v8 = v5;
    v9 = 12;
LABEL_19:
    _os_log_impl(&dword_1DC79E000, v8, OS_LOG_TYPE_DEFAULT, v6, v7, v9);
    goto LABEL_20;
  }
  v15 = (id)MEMORY[0x1E0C81260];
  _gc_log_iokit();
  v16 = objc_claimAutoreleasedReturnValue();
  v17 = os_log_type_enabled(v16, OS_LOG_TYPE_ERROR);
  if (v3 == v15)
  {
    if (v17)
      __55___IOGCFastPathProxyClient_initWithIncomingConnection___block_invoke_cold_1(v16);

    xpc_connection_set_event_handler(*(xpc_connection_t *)(*(_QWORD *)(a1 + 32) + 16), &__block_literal_global_19);
    xpc_connection_cancel(*(xpc_connection_t *)(*(_QWORD *)(a1 + 32) + 16));
    v24 = *(_QWORD *)(a1 + 32);
    v25 = *(void **)(v24 + 16);
    *(_QWORD *)(v24 + 16) = 0;

  }
  else
  {
    if (v17)
      __55___IOGCFastPathProxyClient_initWithIncomingConnection___block_invoke_cold_2((uint64_t)v3, v16, v18, v19, v20, v21, v22, v23);

  }
LABEL_21:

}

uint64_t __42___IOGCFastPathProxyClient_handleMessage___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v3;
  id v4;
  void *v5;
  const char *string_ptr;
  void *v7;

  v3 = *(void **)(a1 + 32);
  v4 = a3;
  +[NSNull null](&off_1F03A9C88, "null");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  string_ptr = xpc_string_get_string_ptr(v4);

  +[NSString stringWithUTF8String:](NSString_0, "stringWithUTF8String:", string_ptr);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v5, v7);

  return 1;
}

void __42___IOGCFastPathProxyClient_handleMessage___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;

  v6 = a2;
  v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    xpc_dictionary_set_uint64(*(xpc_object_t *)(a1 + 32), (const char *)objc_msgSend(objc_retainAutorelease(v6), "UTF8String"), objc_msgSend(v5, "unsignedLongLongValue"));

}

void __55___IOGCFastPathProxyClient_initWithIncomingConnection___block_invoke_cold_1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1DC79E000, log, OS_LOG_TYPE_ERROR, "Client invalidated!", v1, 2u);
}

void __55___IOGCFastPathProxyClient_initWithIncomingConnection___block_invoke_cold_2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_7(&dword_1DC79E000, a2, a3, "Proxy client received error: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_7();
}

@end
