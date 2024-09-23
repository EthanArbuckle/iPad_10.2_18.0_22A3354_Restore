@implementation NSPServerClient

void __78__NSPServerClient_setPrivacyProxyTrafficState_proxyTraffic_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  void *v5;

  +[NSPServerClient getErrorFromDict:]((uint64_t)NSPServerClient, a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(a1 + 32);
  if (v4)
  {
    v5 = v3;
    (*(void (**)(void))(v4 + 16))();
    v3 = v5;
  }

}

- (void)setPrivacyProxyTrafficState:(unint64_t)a3 proxyTraffic:(unint64_t)a4 completionHandler:(id)a5
{
  id v8;
  NSObject *v9;
  _xpc_connection_s *v10;
  xpc_object_t v11;
  const char *v12;
  NSObject *v13;
  id v14;
  void *v15;
  _QWORD handler[4];
  id v17;
  uint64_t v18;
  const __CFString *v19;
  uint8_t buf[4];
  unint64_t v21;
  __int16 v22;
  unint64_t v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v8 = a5;
  nplog_obj();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134218240;
    v21 = a3;
    v22 = 2048;
    v23 = a4;
    _os_log_debug_impl(&dword_19E8FE000, v9, OS_LOG_TYPE_DEBUG, "Setting privacy proxy traffic state for traffic type %llx: %llx", buf, 0x16u);
  }

  -[NSPServerClient getConnection]((uint64_t)self);
  v10 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    v11 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_int64(v11, "NSPServerCommandType", 21);
    xpc_dictionary_set_uint64(v11, "NSPServerPrivacyProxyTrafficMask", a3);
    xpc_dictionary_set_uint64(v11, "NSPServerPrivacyProxyTraffic", a4);
    if (self)
      self = (NSPServerClient *)objc_getProperty(self, v12, 16, 1);
    handler[0] = MEMORY[0x1E0C809B0];
    handler[1] = 3221225472;
    handler[2] = __78__NSPServerClient_setPrivacyProxyTrafficState_proxyTraffic_completionHandler___block_invoke;
    handler[3] = &unk_1E41377F0;
    v17 = v8;
    xpc_connection_send_message_with_reply(v10, v11, &self->super, handler);

  }
  else
  {
    nplog_obj();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_19E8FE000, v13, OS_LOG_TYPE_ERROR, "Failed to get XPC connection", buf, 2u);
    }

    v14 = objc_alloc(MEMORY[0x1E0CB35C8]);
    v18 = *MEMORY[0x1E0CB2D68];
    v19 = CFSTR("IPC failed");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v19, &v18, 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (xpc_object_t)objc_msgSend(v14, "initWithDomain:code:userInfo:", CFSTR("privacyProxyErrorDomain"), 1002, v15);

    (*((void (**)(id, xpc_object_t))v8 + 2))(v8, v11);
  }

}

- (id)initWithCallbackQueue:(id)a1
{
  id v3;
  dispatch_queue_t v4;
  void *v5;
  objc_super v7;

  v3 = a2;
  if (a1)
  {
    v7.receiver = a1;
    v7.super_class = (Class)NSPServerClient;
    a1 = objc_msgSendSuper2(&v7, sel_init);
    if (a1)
    {
      if (v3)
        v4 = (dispatch_queue_t)v3;
      else
        v4 = dispatch_queue_create("NSPServerClient queue", 0);
      v5 = (void *)*((_QWORD *)a1 + 2);
      *((_QWORD *)a1 + 2) = v4;

      *((_DWORD *)a1 + 2) = 0;
    }
  }

  return a1;
}

void __67__NSPServerClient_getPrivacyProxyAccountTypeWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t uint64;
  _BOOL4 v5;
  uint64_t v6;
  id v7;

  v3 = a2;
  uint64 = xpc_dictionary_get_uint64(v3, "NSPServerPrivacyProxyAccountType");
  v5 = xpc_dictionary_get_BOOL(v3, "NSPServerPrivacyProxyAccountUnlimited");
  +[NSPServerClient getErrorFromDict:]((uint64_t)NSPServerClient, v3);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  v6 = *(_QWORD *)(a1 + 32);
  if (v6)
    (*(void (**)(uint64_t, uint64_t, _BOOL4, id))(v6 + 16))(v6, uint64, v5, v7);

}

void __68__NSPServerClient_getPrivacyProxyTrafficStateWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t uint64;
  uint64_t v5;
  xpc_object_t xdict;

  xdict = a2;
  +[NSPServerClient getErrorFromDict:]((uint64_t)NSPServerClient, xdict);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (xdict && MEMORY[0x1A1AEADA0]() == MEMORY[0x1E0C812F8])
    uint64 = xpc_dictionary_get_uint64(xdict, "NSPServerPrivacyProxyTraffic");
  else
    uint64 = 0;
  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
    (*(void (**)(uint64_t, uint64_t, void *))(v5 + 16))(v5, uint64, v3);

}

void __64__NSPServerClient_getPrivacyProxyUserTierWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t uint64;
  _BOOL8 v5;
  uint64_t v6;
  xpc_object_t xdict;

  xdict = a2;
  +[NSPServerClient getErrorFromDict:]((uint64_t)NSPServerClient, xdict);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (xdict && MEMORY[0x1A1AEADA0](xdict) == MEMORY[0x1E0C812F8])
  {
    uint64 = xpc_dictionary_get_uint64(xdict, "NSPServerPrivacyProxyUserTier");
    v5 = xpc_dictionary_get_BOOL(xdict, "NSPServerPrivacyProxySetUntilTomorrow");
  }
  else
  {
    uint64 = 0;
    v5 = 0;
  }
  v6 = *(_QWORD *)(a1 + 32);
  if (v6)
    (*(void (**)(uint64_t, uint64_t, _BOOL8, void *))(v6 + 16))(v6, uint64, v5, v3);

}

- (void)getPrivacyProxyServiceStatusWithCompletionHandler:(id)a3
{
  id v4;
  NSObject *v5;
  _xpc_connection_s *v6;
  xpc_object_t v7;
  const char *v8;
  NSObject *v9;
  id v10;
  void *v11;
  _QWORD handler[4];
  id v13;
  uint8_t buf[8];
  uint64_t v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  nplog_obj();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_debug_impl(&dword_19E8FE000, v5, OS_LOG_TYPE_DEBUG, "Requesting get privacy proxy service status", buf, 2u);
  }

  -[NSPServerClient getConnection]((uint64_t)self);
  v6 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v7 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_int64(v7, "NSPServerCommandType", 33);
    if (self)
      self = (NSPServerClient *)objc_getProperty(self, v8, 16, 1);
    handler[0] = MEMORY[0x1E0C809B0];
    handler[1] = 3221225472;
    handler[2] = __69__NSPServerClient_getPrivacyProxyServiceStatusWithCompletionHandler___block_invoke;
    handler[3] = &unk_1E41377F0;
    v13 = v4;
    xpc_connection_send_message_with_reply(v6, v7, &self->super, handler);

  }
  else
  {
    nplog_obj();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_19E8FE000, v9, OS_LOG_TYPE_ERROR, "Failed to get XPC connection", buf, 2u);
    }

    v10 = objc_alloc(MEMORY[0x1E0CB35C8]);
    v15 = *MEMORY[0x1E0CB2D68];
    v16[0] = CFSTR("IPC failed");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, &v15, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (xpc_object_t)objc_msgSend(v10, "initWithDomain:code:userInfo:", CFSTR("privacyProxyErrorDomain"), 1002, v11);

    (*((void (**)(id, _QWORD, xpc_object_t))v4 + 2))(v4, 0, v7);
  }

}

- (void)getPrivacyProxyUserTierWithCompletionHandler:(id)a3
{
  id v4;
  NSObject *v5;
  _xpc_connection_s *v6;
  xpc_object_t v7;
  const char *v8;
  NSObject *v9;
  id v10;
  void *v11;
  _QWORD handler[4];
  id v13;
  uint8_t buf[8];
  uint64_t v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  nplog_obj();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_debug_impl(&dword_19E8FE000, v5, OS_LOG_TYPE_DEBUG, "Get user tier", buf, 2u);
  }

  -[NSPServerClient getConnection]((uint64_t)self);
  v6 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v7 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_int64(v7, "NSPServerCommandType", 20);
    if (self)
      self = (NSPServerClient *)objc_getProperty(self, v8, 16, 1);
    handler[0] = MEMORY[0x1E0C809B0];
    handler[1] = 3221225472;
    handler[2] = __64__NSPServerClient_getPrivacyProxyUserTierWithCompletionHandler___block_invoke;
    handler[3] = &unk_1E41377F0;
    v13 = v4;
    xpc_connection_send_message_with_reply(v6, v7, &self->super, handler);

  }
  else
  {
    nplog_obj();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_19E8FE000, v9, OS_LOG_TYPE_ERROR, "Failed to get XPC connection", buf, 2u);
    }

    v10 = objc_alloc(MEMORY[0x1E0CB35C8]);
    v15 = *MEMORY[0x1E0CB2D68];
    v16[0] = CFSTR("IPC failed");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, &v15, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (xpc_object_t)objc_msgSend(v10, "initWithDomain:code:userInfo:", CFSTR("privacyProxyErrorDomain"), 1002, v11);

    (*((void (**)(id, _QWORD, _QWORD, xpc_object_t))v4 + 2))(v4, 0, 0, v7);
  }

}

- (void)getPrivacyProxyTrafficStateWithCompletionHandler:(id)a3
{
  id v4;
  NSObject *v5;
  _xpc_connection_s *v6;
  xpc_object_t v7;
  const char *v8;
  NSObject *v9;
  id v10;
  void *v11;
  _QWORD handler[4];
  id v13;
  uint8_t buf[8];
  uint64_t v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  nplog_obj();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_debug_impl(&dword_19E8FE000, v5, OS_LOG_TYPE_DEBUG, "Get privacy proxy traffic state", buf, 2u);
  }

  -[NSPServerClient getConnection]((uint64_t)self);
  v6 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v7 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_int64(v7, "NSPServerCommandType", 22);
    if (self)
      self = (NSPServerClient *)objc_getProperty(self, v8, 16, 1);
    handler[0] = MEMORY[0x1E0C809B0];
    handler[1] = 3221225472;
    handler[2] = __68__NSPServerClient_getPrivacyProxyTrafficStateWithCompletionHandler___block_invoke;
    handler[3] = &unk_1E41377F0;
    v13 = v4;
    xpc_connection_send_message_with_reply(v6, v7, &self->super, handler);

  }
  else
  {
    nplog_obj();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_19E8FE000, v9, OS_LOG_TYPE_ERROR, "Failed to get XPC connection", buf, 2u);
    }

    v10 = objc_alloc(MEMORY[0x1E0CB35C8]);
    v15 = *MEMORY[0x1E0CB2D68];
    v16[0] = CFSTR("IPC failed");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, &v15, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (xpc_object_t)objc_msgSend(v10, "initWithDomain:code:userInfo:", CFSTR("privacyProxyErrorDomain"), 1002, v11);

    (*((void (**)(id, _QWORD, xpc_object_t))v4 + 2))(v4, 0, v7);
  }

}

void __69__NSPServerClient_getPrivacyProxyServiceStatusWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  const void *data;
  PrivacyProxyServiceStatus *v6;
  void *v7;
  uint64_t v8;
  size_t length;

  v3 = a2;
  +[NSPServerClient getErrorFromDict:]((uint64_t)NSPServerClient, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  length = 0;
  data = xpc_dictionary_get_data(v3, "NSPServerPrivacyProxyServiceStatus", &length);

  v6 = 0;
  if (data && length)
  {
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", data);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[PrivacyProxyServiceStatus initWithData:]([PrivacyProxyServiceStatus alloc], "initWithData:", v7);

  }
  v8 = *(_QWORD *)(a1 + 32);
  if (v8)
    (*(void (**)(uint64_t, PrivacyProxyServiceStatus *, void *))(v8 + 16))(v8, v6, v4);

}

- (void)getPrivacyProxyAccountTypeWithCompletionHandler:(id)a3
{
  id v4;
  NSObject *v5;
  _xpc_connection_s *v6;
  xpc_object_t v7;
  const char *v8;
  NSObject *v9;
  id v10;
  void *v11;
  _QWORD handler[4];
  id v13;
  uint8_t buf[8];
  uint64_t v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  nplog_obj();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_debug_impl(&dword_19E8FE000, v5, OS_LOG_TYPE_DEBUG, "Get Privacy Proxy account type", buf, 2u);
  }

  -[NSPServerClient getConnection]((uint64_t)self);
  v6 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v7 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_int64(v7, "NSPServerCommandType", 41);
    if (self)
      self = (NSPServerClient *)objc_getProperty(self, v8, 16, 1);
    handler[0] = MEMORY[0x1E0C809B0];
    handler[1] = 3221225472;
    handler[2] = __67__NSPServerClient_getPrivacyProxyAccountTypeWithCompletionHandler___block_invoke;
    handler[3] = &unk_1E41377F0;
    v13 = v4;
    xpc_connection_send_message_with_reply(v6, v7, &self->super, handler);

  }
  else
  {
    nplog_obj();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_19E8FE000, v9, OS_LOG_TYPE_ERROR, "Failed to get XPC connection", buf, 2u);
    }

    v10 = objc_alloc(MEMORY[0x1E0CB35C8]);
    v15 = *MEMORY[0x1E0CB2D68];
    v16[0] = CFSTR("IPC failed");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, &v15, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (xpc_object_t)objc_msgSend(v10, "initWithDomain:code:userInfo:", CFSTR("privacyProxyErrorDomain"), 1002, v11);

    (*((void (**)(id, _QWORD, _QWORD, xpc_object_t))v4 + 2))(v4, 0, 0, v7);
  }

}

+ (id)getErrorFromDict:(uint64_t)a1
{
  id v2;
  void *int64;
  char *string;
  id v5;
  void *v6;
  NSObject *v8;
  uint64_t v9;
  char *v10;
  uint8_t buf[4];
  const char *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  objc_opt_self();
  if (!v2)
  {
    nplog_obj();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315138;
      v12 = "+[NSPServerClient getErrorFromDict:]";
      _os_log_fault_impl(&dword_19E8FE000, v8, OS_LOG_TYPE_FAULT, "%s called with null dict", buf, 0xCu);
    }

    goto LABEL_3;
  }
  if (MEMORY[0x1A1AEADA0](v2) != MEMORY[0x1E0C812F8])
  {
LABEL_3:
    int64 = 0;
    goto LABEL_9;
  }
  int64 = (void *)xpc_dictionary_get_int64(v2, "NSPServerErrorCode");
  string = (char *)xpc_dictionary_get_string(v2, "NSPServerErrorString");
  if (string)
    string = (char *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithUTF8String:", string);
  if (int64)
  {
    v5 = objc_alloc(MEMORY[0x1E0CB35C8]);
    v9 = *MEMORY[0x1E0CB2D68];
    v10 = string;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v10, &v9, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    int64 = (void *)objc_msgSend(v5, "initWithDomain:code:userInfo:", CFSTR("privacyProxyErrorDomain"), int64, v6);

  }
LABEL_9:

  return int64;
}

- (id)getConnection
{
  os_unfair_lock_s *v2;
  id v3;
  id *v4;
  const char *v5;
  SEL v6;
  NSObject *Property;
  xpc_connection_t mach_service;
  xpc_connection_t v9;
  _xpc_connection_s *v10;
  NSObject *v11;
  id v12;
  _QWORD v14[5];
  _xpc_connection_s *v15;
  uint8_t buf[4];
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  v2 = (os_unfair_lock_s *)(a1 + 8);
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 8));
  v4 = (id *)(a1 + 24);
  v3 = *(id *)(a1 + 24);
  if (!v3)
  {
    v5 = (const char *)objc_msgSend(CFSTR("com.apple.networkserviceproxy"), "UTF8String");
    Property = objc_getProperty((id)a1, v6, 16, 1);
    mach_service = xpc_connection_create_mach_service(v5, Property, 0);
    v9 = mach_service;
    if (mach_service)
    {
      v14[0] = MEMORY[0x1E0C809B0];
      v14[1] = 3221225472;
      v14[2] = __32__NSPServerClient_getConnection__block_invoke;
      v14[3] = &unk_1E41377C8;
      v14[4] = a1;
      v10 = mach_service;
      v15 = v10;
      xpc_connection_set_event_handler(v10, v14);
      xpc_connection_resume(v10);
      objc_storeStrong(v4, v9);

    }
    else
    {
      nplog_obj();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315138;
        v17 = objc_msgSend(CFSTR("com.apple.networkserviceproxy"), "UTF8String");
        _os_log_error_impl(&dword_19E8FE000, v11, OS_LOG_TYPE_ERROR, "Failed to create an XPC connection to %s", buf, 0xCu);
      }

    }
    v3 = *v4;
  }
  v12 = v3;
  os_unfair_lock_unlock(v2);
  return v12;
}

void __32__NSPServerClient_getConnection__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  const char *string;
  int v9;
  const char *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = v3;
  if (v3 && MEMORY[0x1A1AEADA0](v3) == MEMORY[0x1E0C81310])
  {
    os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 8));
    v5 = *(_QWORD *)(a1 + 32);
    if (v5)
      v6 = *(_QWORD *)(v5 + 24);
    else
      v6 = 0;
    if (v6 == *(_QWORD *)(a1 + 40))
    {
      nplog_obj();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        string = xpc_dictionary_get_string(v4, (const char *)*MEMORY[0x1E0C81270]);
        v9 = 136315138;
        v10 = string;
        _os_log_impl(&dword_19E8FE000, v7, OS_LOG_TYPE_INFO, "Got an error on the XPC connection: %s", (uint8_t *)&v9, 0xCu);
      }

      v5 = *(_QWORD *)(a1 + 32);
      if (v5)
      {
        objc_storeStrong((id *)(v5 + 24), 0);
        v5 = *(_QWORD *)(a1 + 32);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(v5 + 8));
    xpc_connection_cancel(*(xpc_connection_t *)(a1 + 40));
  }

}

uint64_t __50__NSPServerClient_isAllowedToUseFetchTokenService__block_invoke()
{
  uint64_t result;

  getpid();
  result = sandbox_check();
  if (!(_DWORD)result)
    _MergedGlobals_32 = 1;
  return result;
}

- (id)getTokenFetchConnection
{
  os_unfair_lock_s *v2;
  const char *v3;
  id v4;
  id *v5;
  NSObject *Property;
  xpc_connection_t mach_service;
  xpc_connection_t v8;
  _xpc_connection_s *v9;
  NSObject *v10;
  NSObject *v12;
  id v13;
  _QWORD v14[5];
  _xpc_connection_s *v15;
  uint8_t buf[4];
  const char *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  if (qword_1ED062A38 != -1)
    dispatch_once(&qword_1ED062A38, &__block_literal_global_3);
  if ((_MergedGlobals_32 & 1) != 0)
  {
    v2 = (os_unfair_lock_s *)(a1 + 8);
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 8));
    v5 = (id *)(a1 + 32);
    v4 = *(id *)(a1 + 32);
    if (!v4)
    {
      Property = objc_getProperty((id)a1, v3, 16, 1);
      mach_service = xpc_connection_create_mach_service("com.apple.networkserviceproxy.fetch-token", Property, 0);
      v8 = mach_service;
      if (mach_service)
      {
        v14[0] = MEMORY[0x1E0C809B0];
        v14[1] = 3221225472;
        v14[2] = __42__NSPServerClient_getTokenFetchConnection__block_invoke;
        v14[3] = &unk_1E41377C8;
        v14[4] = a1;
        v9 = mach_service;
        v15 = v9;
        xpc_connection_set_event_handler(v9, v14);
        xpc_connection_resume(v9);
        objc_storeStrong(v5, v8);
        nplog_obj();
        v10 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 136315138;
          v17 = "com.apple.networkserviceproxy.fetch-token";
          _os_log_debug_impl(&dword_19E8FE000, v10, OS_LOG_TYPE_DEBUG, "Created an XPC connection to %s", buf, 0xCu);
        }

      }
      else
      {
        nplog_obj();
        v12 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315138;
          v17 = "com.apple.networkserviceproxy.fetch-token";
          _os_log_error_impl(&dword_19E8FE000, v12, OS_LOG_TYPE_ERROR, "Failed to create an XPC connection to %s", buf, 0xCu);
        }

      }
      v4 = *v5;
    }
    v13 = v4;
    os_unfair_lock_unlock(v2);
    return v13;
  }
  else
  {
    -[NSPServerClient getConnection](a1);
    return (id)objc_claimAutoreleasedReturnValue();
  }
}

void __42__NSPServerClient_getTokenFetchConnection__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  const char *string;
  int v9;
  const char *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = v3;
  if (v3 && MEMORY[0x1A1AEADA0](v3) == MEMORY[0x1E0C81310])
  {
    os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 8));
    v5 = *(_QWORD *)(a1 + 32);
    if (v5)
      v6 = *(_QWORD *)(v5 + 32);
    else
      v6 = 0;
    if (v6 == *(_QWORD *)(a1 + 40))
    {
      nplog_obj();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        string = xpc_dictionary_get_string(v4, (const char *)*MEMORY[0x1E0C81270]);
        v9 = 136315138;
        v10 = string;
        _os_log_impl(&dword_19E8FE000, v7, OS_LOG_TYPE_INFO, "Got an error on the XPC connection: %s", (uint8_t *)&v9, 0xCu);
      }

      v5 = *(_QWORD *)(a1 + 32);
      if (v5)
      {
        objc_storeStrong((id *)(v5 + 32), 0);
        v5 = *(_QWORD *)(a1 + 32);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(v5 + 8));
    xpc_connection_cancel(*(xpc_connection_t *)(a1 + 40));
  }

}

- (void)fetchCurrentConfigurationWithCompletionHandler:(id)a3
{
  id v4;
  NSObject *v5;
  _xpc_connection_s *v6;
  xpc_object_t v7;
  const char *v8;
  _QWORD handler[4];
  id v10;
  uint8_t buf[16];

  v4 = a3;
  nplog_obj();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_debug_impl(&dword_19E8FE000, v5, OS_LOG_TYPE_DEBUG, "Requesting fetch configuration", buf, 2u);
  }

  -[NSPServerClient getConnection]((uint64_t)self);
  v6 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v7 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_int64(v7, "NSPServerCommandType", 1);
    if (self)
      self = (NSPServerClient *)objc_getProperty(self, v8, 16, 1);
    handler[0] = MEMORY[0x1E0C809B0];
    handler[1] = 3221225472;
    handler[2] = __66__NSPServerClient_fetchCurrentConfigurationWithCompletionHandler___block_invoke;
    handler[3] = &unk_1E41377F0;
    v10 = v4;
    xpc_connection_send_message_with_reply(v6, v7, &self->super, handler);

  }
  else
  {
    (*((void (**)(id, _QWORD))v4 + 2))(v4, 0);
  }

}

void __66__NSPServerClient_fetchCurrentConfigurationWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  id v7;

  v7 = a2;
  if (v7 && MEMORY[0x1A1AEADA0]() == MEMORY[0x1E0C812F8])
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    get_nsdata_from_xpc_object(v7, "NSPServerConfiguration");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      objc_msgSend(MEMORY[0x1E0CB3710], "unarchivedObjectOfClasses:fromData:error:", v4, v5, 0);
      v3 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v3 = 0;
    }

  }
  else
  {
    v3 = 0;
  }
  v6 = *(_QWORD *)(a1 + 32);
  if (v6)
    (*(void (**)(uint64_t, void *))(v6 + 16))(v6, v3);

}

- (void)setCurrentConfiguration:(id)a3 withCompletionHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  _xpc_connection_s *v9;
  xpc_object_t v10;
  const char *v11;
  _QWORD handler[4];
  id v13;
  uint8_t buf[16];

  v6 = a3;
  v7 = a4;
  nplog_obj();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_debug_impl(&dword_19E8FE000, v8, OS_LOG_TYPE_DEBUG, "Requesting set configuration", buf, 2u);
  }

  -[NSPServerClient getConnection]((uint64_t)self);
  v9 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    v10 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_int64(v10, "NSPServerCommandType", 2);
    set_nsobject_in_xpc_object(v10, "NSPServerConfiguration", (uint64_t)v6);
    if (self)
      self = (NSPServerClient *)objc_getProperty(self, v11, 16, 1);
    handler[0] = MEMORY[0x1E0C809B0];
    handler[1] = 3221225472;
    handler[2] = __65__NSPServerClient_setCurrentConfiguration_withCompletionHandler___block_invoke;
    handler[3] = &unk_1E41377F0;
    v13 = v7;
    xpc_connection_send_message_with_reply(v9, v10, &self->super, handler);

  }
  else
  {
    (*((void (**)(id, const __CFString *))v7 + 2))(v7, CFSTR("IPC failed"));
  }

}

void __65__NSPServerClient_setCurrentConfiguration_withCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  char *string;
  uint64_t v4;
  xpc_object_t xdict;

  xdict = a2;
  if (xdict && MEMORY[0x1A1AEADA0]() == MEMORY[0x1E0C812F8])
  {
    string = (char *)xpc_dictionary_get_string(xdict, "NSPServerErrorString");
    if (string)
      string = (char *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithUTF8String:", string);
  }
  else
  {
    string = 0;
  }
  v4 = *(_QWORD *)(a1 + 32);
  if (v4)
    (*(void (**)(uint64_t, char *))(v4 + 16))(v4, string);

}

- (void)fetchEdgeSetForIdentifier:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  _xpc_connection_s *v9;
  xpc_object_t v10;
  id v11;
  id v12;
  const char *v13;
  _QWORD handler[4];
  id v15;
  uint8_t buf[4];
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  nplog_obj();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    v17 = v6;
    _os_log_debug_impl(&dword_19E8FE000, v8, OS_LOG_TYPE_DEBUG, "Requesting fetch edge set for %@", buf, 0xCu);
  }

  -[NSPServerClient getConnection]((uint64_t)self);
  v9 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    v10 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_int64(v10, "NSPServerCommandType", 3);
    v11 = v6;
    if (v11)
    {
      v12 = v10;
      xpc_dictionary_set_string(v12, "NSPServerEdgeSetIdentifier", (const char *)objc_msgSend(v11, "UTF8String"));

    }
    if (self)
      self = (NSPServerClient *)objc_getProperty(self, v13, 16, 1);
    handler[0] = MEMORY[0x1E0C809B0];
    handler[1] = 3221225472;
    handler[2] = __63__NSPServerClient_fetchEdgeSetForIdentifier_completionHandler___block_invoke;
    handler[3] = &unk_1E41377F0;
    v15 = v7;
    xpc_connection_send_message_with_reply(v9, v10, &self->super, handler);

  }
  else
  {
    (*((void (**)(id, _QWORD))v7 + 2))(v7, 0);
  }

}

void __63__NSPServerClient_fetchEdgeSetForIdentifier_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;

  v9 = a2;
  if (v9 && MEMORY[0x1A1AEADA0]() == MEMORY[0x1E0C812F8])
  {
    v4 = (void *)MEMORY[0x1E0C99E60];
    v5 = objc_opt_class();
    objc_msgSend(v4, "setWithObjects:", v5, objc_opt_class(), 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    get_nsdata_from_xpc_object(v9, "NSPServerWaldoInfos");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      objc_msgSend(MEMORY[0x1E0CB3710], "unarchivedObjectOfClasses:fromData:error:", v6, v7, 0);
      v3 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v3 = 0;
    }

  }
  else
  {
    v3 = 0;
  }
  v8 = *(_QWORD *)(a1 + 32);
  if (v8)
    (*(void (**)(uint64_t, void *))(v8 + 16))(v8, v3);

}

- (void)setEdgeSet:(id)a3 forIdentifier:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  _xpc_connection_s *v12;
  xpc_object_t v13;
  id v14;
  id v15;
  const char *v16;
  _QWORD handler[4];
  id v18;
  uint8_t buf[4];
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  nplog_obj();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    v20 = v9;
    _os_log_debug_impl(&dword_19E8FE000, v11, OS_LOG_TYPE_DEBUG, "Requesting set edge set for %@", buf, 0xCu);
  }

  -[NSPServerClient getConnection]((uint64_t)self);
  v12 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_int64(v13, "NSPServerCommandType", 4);
    v14 = v9;
    if (v14)
    {
      v15 = v13;
      xpc_dictionary_set_string(v15, "NSPServerEdgeSetIdentifier", (const char *)objc_msgSend(v14, "UTF8String"));

    }
    set_nsobject_in_xpc_object(v13, "NSPServerWaldoInfo", (uint64_t)v8);
    if (self)
      self = (NSPServerClient *)objc_getProperty(self, v16, 16, 1);
    handler[0] = MEMORY[0x1E0C809B0];
    handler[1] = 3221225472;
    handler[2] = __62__NSPServerClient_setEdgeSet_forIdentifier_completionHandler___block_invoke;
    handler[3] = &unk_1E41377F0;
    v18 = v10;
    xpc_connection_send_message_with_reply(v12, v13, &self->super, handler);

  }
  else
  {
    (*((void (**)(id, const __CFString *))v10 + 2))(v10, CFSTR("IPC failed"));
  }

}

void __62__NSPServerClient_setEdgeSet_forIdentifier_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  char *string;
  uint64_t v4;
  xpc_object_t xdict;

  xdict = a2;
  if (xdict && MEMORY[0x1A1AEADA0]() == MEMORY[0x1E0C812F8])
  {
    string = (char *)xpc_dictionary_get_string(xdict, "NSPServerErrorString");
    if (string)
      string = (char *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithUTF8String:", string);
  }
  else
  {
    string = 0;
  }
  v4 = *(_QWORD *)(a1 + 32);
  if (v4)
    (*(void (**)(uint64_t, char *))(v4 + 16))(v4, string);

}

- (void)fetchAppRuleForLabel:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  _xpc_connection_s *v9;
  xpc_object_t v10;
  id v11;
  id v12;
  const char *v13;
  _QWORD handler[4];
  id v15;
  uint8_t buf[4];
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  nplog_obj();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    v17 = v6;
    _os_log_debug_impl(&dword_19E8FE000, v8, OS_LOG_TYPE_DEBUG, "Requesting fetch app rule for %@:", buf, 0xCu);
  }

  -[NSPServerClient getConnection]((uint64_t)self);
  v9 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    v10 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_int64(v10, "NSPServerCommandType", 5);
    v11 = v6;
    if (v11)
    {
      v12 = v10;
      xpc_dictionary_set_string(v12, "NSPServerAppLabel", (const char *)objc_msgSend(v11, "UTF8String"));

    }
    if (self)
      self = (NSPServerClient *)objc_getProperty(self, v13, 16, 1);
    handler[0] = MEMORY[0x1E0C809B0];
    handler[1] = 3221225472;
    handler[2] = __58__NSPServerClient_fetchAppRuleForLabel_completionHandler___block_invoke;
    handler[3] = &unk_1E41377F0;
    v15 = v7;
    xpc_connection_send_message_with_reply(v9, v10, &self->super, handler);

  }
  else
  {
    (*((void (**)(id, _QWORD))v7 + 2))(v7, 0);
  }

}

void __58__NSPServerClient_fetchAppRuleForLabel_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;

  v9 = a2;
  if (v9 && MEMORY[0x1A1AEADA0]() == MEMORY[0x1E0C812F8])
  {
    v4 = (void *)MEMORY[0x1E0C99E60];
    v5 = objc_opt_class();
    objc_msgSend(v4, "setWithObjects:", v5, objc_opt_class(), 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    get_nsdata_from_xpc_object(v9, "NSPServerAppRules");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      objc_msgSend(MEMORY[0x1E0CB3710], "unarchivedObjectOfClasses:fromData:error:", v6, v7, 0);
      v3 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v3 = 0;
    }

  }
  else
  {
    v3 = 0;
  }
  v8 = *(_QWORD *)(a1 + 32);
  if (v8)
    (*(void (**)(uint64_t, void *))(v8 + 16))(v8, v3);

}

- (void)setAppRule:(id)a3 forLabel:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  _xpc_connection_s *v12;
  xpc_object_t v13;
  id v14;
  id v15;
  const char *v16;
  _QWORD handler[4];
  id v18;
  uint8_t buf[4];
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  nplog_obj();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    v20 = v9;
    _os_log_debug_impl(&dword_19E8FE000, v11, OS_LOG_TYPE_DEBUG, "Requesting set app rule for %@", buf, 0xCu);
  }

  -[NSPServerClient getConnection]((uint64_t)self);
  v12 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_int64(v13, "NSPServerCommandType", 6);
    v14 = v9;
    if (v14)
    {
      v15 = v13;
      xpc_dictionary_set_string(v15, "NSPServerAppLabel", (const char *)objc_msgSend(v14, "UTF8String"));

    }
    set_nsobject_in_xpc_object(v13, "NSPServerAppRule", (uint64_t)v8);
    if (self)
      self = (NSPServerClient *)objc_getProperty(self, v16, 16, 1);
    handler[0] = MEMORY[0x1E0C809B0];
    handler[1] = 3221225472;
    handler[2] = __57__NSPServerClient_setAppRule_forLabel_completionHandler___block_invoke;
    handler[3] = &unk_1E41377F0;
    v18 = v10;
    xpc_connection_send_message_with_reply(v12, v13, &self->super, handler);

  }
  else
  {
    (*((void (**)(id, const __CFString *))v10 + 2))(v10, CFSTR("IPC failed"));
  }

}

void __57__NSPServerClient_setAppRule_forLabel_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  char *string;
  uint64_t v4;
  xpc_object_t xdict;

  xdict = a2;
  if (xdict && MEMORY[0x1A1AEADA0]() == MEMORY[0x1E0C812F8])
  {
    string = (char *)xpc_dictionary_get_string(xdict, "NSPServerErrorString");
    if (string)
      string = (char *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithUTF8String:", string);
  }
  else
  {
    string = 0;
  }
  v4 = *(_QWORD *)(a1 + 32);
  if (v4)
    (*(void (**)(uint64_t, char *))(v4 + 16))(v4, string);

}

- (void)establishTrustWithEdgeSetForIdentifier:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  _xpc_connection_s *v9;
  xpc_object_t v10;
  id v11;
  id v12;
  const char *v13;
  _QWORD handler[4];
  id v15;
  uint8_t buf[4];
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  nplog_obj();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    v17 = v6;
    _os_log_debug_impl(&dword_19E8FE000, v8, OS_LOG_TYPE_DEBUG, "Requesting establish trust with edge set %@", buf, 0xCu);
  }

  -[NSPServerClient getConnection]((uint64_t)self);
  v9 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    v10 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_int64(v10, "NSPServerCommandType", 7);
    v11 = v6;
    if (v11)
    {
      v12 = v10;
      xpc_dictionary_set_string(v12, "NSPServerEdgeSetIdentifier", (const char *)objc_msgSend(v11, "UTF8String"));

    }
    if (self)
      self = (NSPServerClient *)objc_getProperty(self, v13, 16, 1);
    handler[0] = MEMORY[0x1E0C809B0];
    handler[1] = 3221225472;
    handler[2] = __76__NSPServerClient_establishTrustWithEdgeSetForIdentifier_completionHandler___block_invoke;
    handler[3] = &unk_1E41377F0;
    v15 = v7;
    xpc_connection_send_message_with_reply(v9, v10, &self->super, handler);

  }
  else
  {
    (*((void (**)(id, const __CFString *))v7 + 2))(v7, CFSTR("IPC failed"));
  }

}

void __76__NSPServerClient_establishTrustWithEdgeSetForIdentifier_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  char *string;
  uint64_t v4;
  xpc_object_t xdict;

  xdict = a2;
  if (xdict && MEMORY[0x1A1AEADA0]() == MEMORY[0x1E0C812F8])
  {
    string = (char *)xpc_dictionary_get_string(xdict, "NSPServerErrorString");
    if (string)
      string = (char *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithUTF8String:", string);
  }
  else
  {
    string = 0;
  }
  v4 = *(_QWORD *)(a1 + 32);
  if (v4)
    (*(void (**)(uint64_t, char *))(v4 + 16))(v4, string);

}

- (void)refreshWaldoNowWithCompletionHandler:(id)a3
{
  id v4;
  NSObject *v5;
  _xpc_connection_s *v6;
  xpc_object_t v7;
  const char *v8;
  _QWORD handler[4];
  id v10;
  uint8_t buf[16];

  v4 = a3;
  nplog_obj();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_debug_impl(&dword_19E8FE000, v5, OS_LOG_TYPE_DEBUG, "Requesting waldo refresh", buf, 2u);
  }

  -[NSPServerClient getConnection]((uint64_t)self);
  v6 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v7 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_int64(v7, "NSPServerCommandType", 11);
    if (self)
      self = (NSPServerClient *)objc_getProperty(self, v8, 16, 1);
    handler[0] = MEMORY[0x1E0C809B0];
    handler[1] = 3221225472;
    handler[2] = __56__NSPServerClient_refreshWaldoNowWithCompletionHandler___block_invoke;
    handler[3] = &unk_1E41377F0;
    v10 = v4;
    xpc_connection_send_message_with_reply(v6, v7, &self->super, handler);

  }
  else
  {
    (*((void (**)(id, _QWORD, _QWORD))v4 + 2))(v4, 0, 0);
  }

}

void __56__NSPServerClient_refreshWaldoNowWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  const void *data;
  const void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  size_t length;
  uint8_t buf[16];

  v3 = a2;
  nplog_obj();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_debug_impl(&dword_19E8FE000, v4, OS_LOG_TYPE_DEBUG, "got reply for waldo refresh", buf, 2u);
  }

  if (v3 && MEMORY[0x1A1AEADA0](v3) == MEMORY[0x1E0C812F8])
  {
    length = 0;
    data = xpc_dictionary_get_data(v3, "NSPServerResponseData", &length);
    v6 = 0;
    v5 = 0;
    if (data && length)
    {
      v9 = data;
      v10 = objc_alloc(MEMORY[0x1E0C99D50]);
      v11 = (void *)objc_msgSend(v10, "initWithBytesNoCopy:length:freeWhenDone:", v9, length, 0);
      objc_msgSend(MEMORY[0x1E0CB38B0], "propertyListWithData:options:format:error:", v11, 0, 0, 0);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("MessageResult"));
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("RequestLog"));
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v6 = objc_msgSend(v13, "BOOLValue");
        else
          v6 = 0;
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {

          v5 = 0;
        }

      }
      else
      {
        v5 = 0;
        v6 = 0;
      }

    }
  }
  else
  {
    v5 = 0;
    v6 = 0;
  }
  v7 = *(_QWORD *)(a1 + 32);
  if (v7)
    (*(void (**)(uint64_t, uint64_t, void *))(v7 + 16))(v7, v6, v5);

}

- (void)reportUsage:(id)a3 fromClient:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  _xpc_connection_s *v9;
  xpc_object_t v10;
  void *v11;
  id v12;
  NSObject *v13;
  id v14;
  id v15;
  uint8_t v16[8];
  uint64_t v17;
  uint8_t buf[16];

  v6 = a3;
  v7 = a4;
  nplog_obj();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_debug_impl(&dword_19E8FE000, v8, OS_LOG_TYPE_DEBUG, "Reporting usage", buf, 2u);
  }

  -[NSPServerClient getConnection]((uint64_t)self);
  v9 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    v10 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_int64(v10, "NSPServerCommandType", 12);
    v17 = 0;
    objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", v6, 1, &v17);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      v12 = v10;
      v13 = _CFXPCCreateXPCObjectFromCFObject();
      xpc_dictionary_set_value(v12, "NSPServerUsageData", v13);

    }
    else
    {
      nplog_obj();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v16 = 0;
        _os_log_error_impl(&dword_19E8FE000, v13, OS_LOG_TYPE_ERROR, "Failed to serialize the usage report", v16, 2u);
      }
    }

    v14 = v7;
    if (v14)
    {
      v15 = v10;
      xpc_dictionary_set_string(v15, "NSPServerSigningIdentifier", (const char *)objc_msgSend(v14, "UTF8String"));

    }
    xpc_connection_send_message(v9, v10);

  }
}

- (void)setCurrentLatitude:(double)a3 longitude:(double)a4 timestamp:(id)a5 forClient:(id)a6
{
  id v10;
  id v11;
  NSObject *v12;
  _xpc_connection_s *v13;
  xpc_object_t v14;
  double v15;
  id v16;
  id v17;
  uint8_t v18[16];

  v10 = a5;
  v11 = a6;
  nplog_obj();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v18 = 0;
    _os_log_debug_impl(&dword_19E8FE000, v12, OS_LOG_TYPE_DEBUG, "Requesting set latitude and longitude", v18, 2u);
  }

  -[NSPServerClient getConnection]((uint64_t)self);
  v13 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    v14 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_int64(v14, "NSPServerCommandType", 13);
    xpc_dictionary_set_double(v14, "NSPServerLatitude", a3);
    xpc_dictionary_set_double(v14, "NSPServerLongtitude", a4);
    objc_msgSend(v10, "timeIntervalSince1970");
    xpc_dictionary_set_double(v14, "NSPServerTimestamp", v15);
    v16 = v11;
    if (v16)
    {
      v17 = v14;
      xpc_dictionary_set_string(v17, "NSPServerSigningIdentifier", (const char *)objc_msgSend(v16, "UTF8String"));

    }
    xpc_connection_send_message(v13, v14);

  }
}

- (void)fetchStateForClient:(id)a3 withPeerEndpoint:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  _xpc_connection_s *v12;
  xpc_object_t v13;
  id v14;
  id v15;
  id v16;
  id v17;
  const char *v18;
  _QWORD handler[4];
  id v20;
  uint8_t buf[4];
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  nplog_obj();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    v22 = v8;
    _os_log_debug_impl(&dword_19E8FE000, v11, OS_LOG_TYPE_DEBUG, "Requesting current state for %@", buf, 0xCu);
  }

  -[NSPServerClient getConnection]((uint64_t)self);
  v12 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_int64(v13, "NSPServerCommandType", 14);
    v14 = v8;
    if (v14)
    {
      v15 = v13;
      xpc_dictionary_set_string(v15, "NSPServerSigningIdentifier", (const char *)objc_msgSend(v14, "UTF8String"));

    }
    v16 = v9;
    if (v16)
    {
      v17 = v13;
      xpc_dictionary_set_string(v17, "NSPServerEndpoint", (const char *)objc_msgSend(v16, "UTF8String"));

    }
    if (self)
      self = (NSPServerClient *)objc_getProperty(self, v18, 16, 1);
    handler[0] = MEMORY[0x1E0C809B0];
    handler[1] = 3221225472;
    handler[2] = __74__NSPServerClient_fetchStateForClient_withPeerEndpoint_completionHandler___block_invoke;
    handler[3] = &unk_1E41377F0;
    v20 = v10;
    xpc_connection_send_message_with_reply(v12, v13, &self->super, handler);

  }
  else
  {
    (*((void (**)(id, _QWORD, _QWORD, _QWORD))v10 + 2))(v10, 0, 0, 0);
  }

}

void __74__NSPServerClient_fetchStateForClient_withPeerEndpoint_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  BOOL v4;
  void *v5;
  char *string;
  char *v7;
  void *v8;
  uint64_t v9;
  xpc_object_t xdict;

  v3 = a2;
  if (v3)
  {
    xdict = v3;
    v4 = MEMORY[0x1A1AEADA0]() == MEMORY[0x1E0C812F8];
    v3 = xdict;
    if (v4)
    {
      get_nsdictionary_from_xpc_object(xdict, "NSPServerWaldoState");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      string = (char *)xpc_dictionary_get_string(xdict, "NSPServerTelemetryService");
      if (string)
        string = (char *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithUTF8String:", string);
      v7 = (char *)xpc_dictionary_get_string(xdict, "NSPServerTelemetryURL");
      if (v7 && (v7 = (char *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithUTF8String:", v7)) != 0)
        v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E98]), "initWithString:", v7);
      else
        v8 = 0;
      v9 = *(_QWORD *)(a1 + 32);
      if (v9)
        (*(void (**)(uint64_t, void *, char *, void *))(v9 + 16))(v9, v5, string, v8);

      v3 = xdict;
    }
  }

}

- (void)setTestLatencyMap:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  _xpc_connection_s *v9;
  xpc_object_t v10;
  const char *v11;
  id v12;
  void *v13;
  _QWORD handler[4];
  id v15;
  uint8_t buf[16];

  v6 = a3;
  v7 = a4;
  nplog_obj();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_debug_impl(&dword_19E8FE000, v8, OS_LOG_TYPE_DEBUG, "Requesting set test latency map", buf, 2u);
  }

  -[NSPServerClient getConnection]((uint64_t)self);
  v9 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    v10 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_int64(v10, "NSPServerCommandType", 15);
    if (v6)
    {
      v12 = v10;
      v13 = (void *)_CFXPCCreateXPCObjectFromCFObject();
      xpc_dictionary_set_value(v12, "NSPServerTestLatencyMap", v13);

    }
    if (self)
      self = (NSPServerClient *)objc_getProperty(self, v11, 16, 1);
    handler[0] = MEMORY[0x1E0C809B0];
    handler[1] = 3221225472;
    handler[2] = __55__NSPServerClient_setTestLatencyMap_completionHandler___block_invoke;
    handler[3] = &unk_1E41377F0;
    v15 = v7;
    xpc_connection_send_message_with_reply(v9, v10, &self->super, handler);

  }
  else
  {
    (*((void (**)(id, _QWORD))v7 + 2))(v7, 0);
  }

}

void __55__NSPServerClient_setTestLatencyMap_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  _BOOL8 v6;
  _BOOL8 v7;
  uint64_t v8;
  xpc_object_t xdict;

  v3 = a2;
  v4 = v3;
  if (v3)
  {
    xdict = v3;
    v5 = MEMORY[0x1A1AEADA0](v3);
    v4 = xdict;
    if (v5 == MEMORY[0x1E0C812F8])
    {
      v6 = xpc_dictionary_get_BOOL(xdict, "NSPServerCommandResult");
      v4 = xdict;
      v7 = v6;
      v8 = *(_QWORD *)(a1 + 32);
      if (v8)
      {
        (*(void (**)(uint64_t, _BOOL8, xpc_object_t))(v8 + 16))(v8, v7, xdict);
        v4 = xdict;
      }
    }
  }

}

- (void)getPrivacyProxyConfiguration:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  uint8_t buf[16];

  v4 = a3;
  nplog_obj();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_debug_impl(&dword_19E8FE000, v5, OS_LOG_TYPE_DEBUG, "get privacy proxy configuration called", buf, 2u);
  }

  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __48__NSPServerClient_getPrivacyProxyConfiguration___block_invoke;
  v7[3] = &unk_1E4137818;
  v8 = v4;
  v6 = v4;
  -[NSPServerClient fetchCurrentConfigurationWithCompletionHandler:](self, "fetchCurrentConfigurationWithCompletionHandler:", v7);

}

void __48__NSPServerClient_getPrivacyProxyConfiguration___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  __CFString *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  char isKindOfClass;
  void *v23;
  void *v24;
  id v25;

  v3 = a2;
  v25 = v3;
  if (v3)
  {
    objc_msgSend(v3, "proxyConfiguration");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithDictionary:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "enabled");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setValue:forKey:", v7, CFSTR("privacyProxyEnabled"));

    objc_msgSend(v25, "configServerHost");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setValue:forKey:", v8, CFSTR("configServer"));

    objc_msgSend(v25, "configServerEnabled");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setValue:forKey:", v9, CFSTR("configFetchEnabled"));

    objc_msgSend(v25, "userTier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "intValue");
    if (v11 >= 3)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v11);
      v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v12 = off_1E4137838[(int)v11];
    }

    objc_msgSend(v6, "setValue:forKey:", v12, CFSTR("userTier"));
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v25, "ignoreInvalidCerts"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setValue:forKey:", v13, CFSTR("ingoreInvalidCerts"));

    v14 = (void *)MEMORY[0x1E0CB3578];
    objc_msgSend(v25, "configurationFetchDate");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "localizedStringFromDate:dateStyle:timeStyle:", v15, 1, 2);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setValue:forKey:", v16, CFSTR("configFetchDate"));

    objc_msgSend(v25, "proxyTrafficState");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    +[NSPConfiguration proxyTrafficStateToString:](NSPConfiguration, "proxyTrafficStateToString:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setValue:forKey:", v18, CFSTR("proxyTraffic"));

    objc_msgSend(v5, "objectForKey:", CFSTR("trustedNetworkDiscoveredProxies"));
    v19 = objc_claimAutoreleasedReturnValue();
    if (v19)
    {
      v20 = (void *)v19;
      objc_msgSend(v5, "objectForKey:", CFSTR("trustedNetworkDiscoveredProxies"));
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      isKindOfClass = objc_opt_isKindOfClass();

      if ((isKindOfClass & 1) != 0)
      {
        objc_msgSend(v5, "objectForKey:", CFSTR("trustedNetworkDiscoveredProxies"));
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "setValue:forKey:", v23, CFSTR("trustedNetworkDiscoveredProxies"));

      }
    }
    objc_msgSend(v25, "cloudSubscriptionCheckEnabled");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setValue:forKey:", v24, CFSTR("cloudSubscriptionCheckEnabled"));

    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }

}

- (void)setPrivacyProxyConfiguration:(id)a3 completionHandler:(id)a4
{
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  id v9;
  NSObject *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  char isKindOfClass;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  char v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  char v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  char v29;
  void *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  char v34;
  void *v35;
  uint64_t v36;
  void *v37;
  void *v38;
  char v39;
  void *v40;
  uint64_t v41;
  void *v42;
  void *v43;
  char v44;
  id v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t i;
  void *v50;
  uint64_t v51;
  void *v52;
  void *v53;
  char v54;
  id v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t j;
  uint64_t v60;
  uint64_t v61;
  void *v62;
  void *v63;
  char v64;
  id v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t k;
  uint64_t v70;
  uint64_t v71;
  void *v72;
  void *v73;
  char v74;
  id v75;
  uint64_t v76;
  NSObject *v77;
  uint64_t v78;
  void *v79;
  void *v80;
  char v81;
  id v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  void *v86;
  uint64_t v87;
  void *v88;
  void *v89;
  char v90;
  id v91;
  uint64_t v92;
  uint64_t v93;
  void *v94;
  void *v95;
  char v96;
  void *v97;
  uint64_t v98;
  void *v99;
  void *v100;
  char v101;
  void *v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  void *v107;
  uint64_t v108;
  void *v109;
  void *v110;
  char v111;
  void *v112;
  uint64_t v113;
  void *v114;
  void *v115;
  char v116;
  void *v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t m;
  void *v122;
  NSPPrivacyProxyTokenKey *v123;
  uint64_t v124;
  void *v125;
  void *v126;
  char v127;
  void *v128;
  uint64_t v129;
  void *v130;
  void *v131;
  char v132;
  void *v133;
  uint64_t v134;
  void *v135;
  void *v136;
  char v137;
  void *v138;
  uint64_t v139;
  void *v140;
  void *v141;
  char v142;
  void *v143;
  uint64_t v144;
  void *v145;
  void *v146;
  char v147;
  void *v148;
  uint64_t v149;
  void *v150;
  void *v151;
  char v152;
  void *v153;
  uint64_t v154;
  void *v155;
  void *v156;
  char v157;
  id v158;
  uint64_t v159;
  uint64_t v160;
  uint64_t v161;
  uint64_t v162;
  void *v163;
  uint64_t v164;
  void *v165;
  void *v166;
  char v167;
  id v168;
  uint64_t v169;
  uint64_t v170;
  void *v171;
  void *v172;
  char v173;
  void *v174;
  uint64_t v175;
  void *v176;
  void *v177;
  char v178;
  NSPPrivacyProxyPolicy *v179;
  void *v180;
  uint64_t v181;
  uint64_t v182;
  uint64_t v183;
  uint64_t n;
  id v185;
  uint64_t v186;
  uint64_t v187;
  void *v188;
  void *v189;
  char v190;
  void *v191;
  uint64_t v192;
  uint64_t v193;
  uint64_t v194;
  uint64_t v195;
  void *v196;
  NSPPrivacyProxyProxyInfo *v197;
  uint64_t v198;
  void *v199;
  void *v200;
  char v201;
  id v202;
  uint64_t v203;
  uint64_t v204;
  void *v205;
  void *v206;
  char v207;
  void *v208;
  uint64_t v209;
  void *v210;
  void *v211;
  char v212;
  void *v213;
  id v214;
  uint64_t v215;
  uint64_t v216;
  uint64_t v217;
  uint64_t ii;
  uint64_t v219;
  uint64_t v220;
  void *v221;
  void *v222;
  char v223;
  void *v224;
  uint64_t v225;
  void *v226;
  void *v227;
  char v228;
  void *v229;
  uint64_t v230;
  void *v231;
  void *v232;
  char v233;
  void *v234;
  uint64_t v235;
  void *v236;
  void *v237;
  char v238;
  void *v239;
  uint64_t v240;
  void *v241;
  void *v242;
  char v243;
  void *v244;
  uint64_t v245;
  void *v246;
  void *v247;
  char v248;
  void *v249;
  uint64_t v250;
  void *v251;
  void *v252;
  char v253;
  void *v254;
  uint64_t v255;
  void *v256;
  void *v257;
  char v258;
  void *v259;
  uint64_t v260;
  void *v261;
  void *v262;
  char v263;
  void *v264;
  id v265;
  uint64_t v266;
  uint64_t v267;
  uint64_t v268;
  uint64_t jj;
  uint64_t v270;
  uint64_t v271;
  void *v272;
  void *v273;
  char v274;
  void *v275;
  id v276;
  uint64_t v277;
  uint64_t v278;
  uint64_t v279;
  uint64_t kk;
  uint64_t v281;
  uint64_t v282;
  void *v283;
  void *v284;
  char v285;
  void *v286;
  uint64_t v287;
  void *v288;
  void *v289;
  char v290;
  void *v291;
  id v292;
  uint64_t v293;
  uint64_t v294;
  uint64_t v295;
  uint64_t mm;
  uint64_t v297;
  uint64_t v298;
  void *v299;
  void *v300;
  char v301;
  id v302;
  uint64_t v303;
  uint64_t v304;
  void *v305;
  void *v306;
  char v307;
  void *v308;
  id v309;
  uint64_t v310;
  uint64_t v311;
  uint64_t v312;
  uint64_t nn;
  void *v314;
  NSPPrivacyProxyProxyPathWeight *v315;
  uint64_t v316;
  void *v317;
  void *v318;
  char v319;
  void *v320;
  uint64_t v321;
  void *v322;
  void *v323;
  char v324;
  void *v325;
  id v326;
  uint64_t v327;
  uint64_t v328;
  uint64_t v329;
  uint64_t i1;
  uint64_t v331;
  void *v332;
  void *v333;
  char v334;
  void *v335;
  uint64_t v336;
  uint64_t v337;
  uint64_t v338;
  uint64_t v339;
  void *v340;
  NSPPrivacyProxyResolverInfo *v341;
  uint64_t v342;
  void *v343;
  void *v344;
  char v345;
  void *v346;
  uint64_t v347;
  void *v348;
  void *v349;
  char v350;
  void *v351;
  uint64_t v352;
  void *v353;
  void *v354;
  char v355;
  void *v356;
  uint64_t v357;
  void *v358;
  void *v359;
  char v360;
  void *v361;
  uint64_t v362;
  void *v363;
  void *v364;
  char v365;
  void *v366;
  NSPPrivacyProxyResolverInfo *v367;
  uint64_t v368;
  void *v369;
  void *v370;
  char v371;
  void *v372;
  uint64_t v373;
  void *v374;
  void *v375;
  char v376;
  void *v377;
  uint64_t v378;
  void *v379;
  void *v380;
  char v381;
  void *v382;
  uint64_t v383;
  void *v384;
  void *v385;
  char v386;
  void *v387;
  uint64_t v388;
  void *v389;
  void *v390;
  char v391;
  void *v392;
  uint64_t v393;
  void *v394;
  void *v395;
  char v396;
  void *v397;
  id v398;
  uint64_t v399;
  uint64_t v400;
  unint64_t v401;
  uint64_t v402;
  uint64_t v403;
  void *v404;
  uint64_t v405;
  void *v406;
  void *v407;
  char v408;
  void *v409;
  uint64_t v410;
  void *v411;
  void *v412;
  char v413;
  id v414;
  uint64_t v415;
  uint64_t v416;
  void *v417;
  void *v418;
  char v419;
  void *v420;
  uint64_t v421;
  void *v422;
  void *v423;
  char v424;
  void *v425;
  uint64_t v426;
  void *v427;
  void *v428;
  char v429;
  void *v430;
  uint64_t v431;
  void *v432;
  void *v433;
  char v434;
  void *v435;
  uint64_t v436;
  uint64_t v437;
  uint64_t v438;
  uint64_t v439;
  void *v440;
  NSPPrivacyProxyObliviousTargetInfo *v441;
  uint64_t v442;
  void *v443;
  void *v444;
  char v445;
  void *v446;
  uint64_t v447;
  void *v448;
  void *v449;
  char v450;
  void *v451;
  uint64_t v452;
  void *v453;
  void *v454;
  char v455;
  void *v456;
  uint64_t v457;
  void *v458;
  void *v459;
  char v460;
  void *v461;
  uint64_t v462;
  void *v463;
  void *v464;
  char v465;
  void *v466;
  id v467;
  uint64_t v468;
  uint64_t v469;
  uint64_t v470;
  uint64_t i2;
  uint64_t v472;
  uint64_t v473;
  void *v474;
  void *v475;
  char v476;
  void *v477;
  uint64_t v478;
  void *v479;
  void *v480;
  char v481;
  void *v482;
  uint64_t v483;
  uint64_t v484;
  const __CFString *v485;
  uint64_t v486;
  uint64_t v487;
  void *v488;
  NSPPrivacyProxyProxiedContentMap *v489;
  uint64_t v490;
  const __CFString *v491;
  void *v492;
  void *v493;
  char v494;
  void *v495;
  uint64_t v496;
  void *v497;
  void *v498;
  char v499;
  void *v500;
  uint64_t v501;
  void *v502;
  void *v503;
  char v504;
  void *v505;
  uint64_t v506;
  void *v507;
  void *v508;
  char v509;
  void *v510;
  uint64_t v511;
  void *v512;
  void *v513;
  char v514;
  void *v515;
  uint64_t v516;
  void *v517;
  void *v518;
  char v519;
  void *v520;
  uint64_t v521;
  void *v522;
  void *v523;
  char v524;
  void *v525;
  id v526;
  uint64_t v527;
  uint64_t v528;
  uint64_t v529;
  uint64_t i3;
  void *v531;
  uint64_t v532;
  void *v533;
  void *v534;
  char v535;
  void *v536;
  id v537;
  uint64_t v538;
  uint64_t v539;
  uint64_t v540;
  uint64_t i4;
  uint64_t v542;
  uint64_t v543;
  void *v544;
  void *v545;
  char v546;
  void *v547;
  id v548;
  uint64_t v549;
  uint64_t v550;
  uint64_t v551;
  uint64_t i5;
  uint64_t v553;
  uint64_t v554;
  void *v555;
  void *v556;
  char v557;
  void *v558;
  id v559;
  uint64_t v560;
  uint64_t v561;
  uint64_t v562;
  uint64_t i6;
  uint64_t v564;
  uint64_t v565;
  void *v566;
  void *v567;
  char v568;
  void *v569;
  uint64_t v570;
  void *v571;
  void *v572;
  char v573;
  void *v574;
  uint64_t v575;
  void *v576;
  void *v577;
  char v578;
  void *v579;
  uint64_t v580;
  void *v581;
  void *v582;
  char v583;
  void *v584;
  uint64_t v585;
  void *v586;
  void *v587;
  char v588;
  void *v589;
  id v590;
  uint64_t v591;
  uint64_t v592;
  uint64_t v593;
  uint64_t i7;
  void *v595;
  NSPPrivacyProxyProxyPathWeight *v596;
  uint64_t v597;
  void *v598;
  void *v599;
  char v600;
  void *v601;
  uint64_t v602;
  void *v603;
  void *v604;
  char v605;
  void *v606;
  id v607;
  uint64_t v608;
  uint64_t v609;
  uint64_t v610;
  uint64_t i8;
  uint64_t v612;
  void *v613;
  void *v614;
  char v615;
  id v616;
  uint64_t v617;
  uint64_t v618;
  uint64_t v619;
  uint64_t i9;
  void *v621;
  _xpc_connection_s *v622;
  xpc_object_t v623;
  const char *v624;
  id v625;
  void *v626;
  id Property;
  NSObject *v628;
  NSObject *v629;
  void *v630;
  void (**v631)(_QWORD, _QWORD);
  id selfa;
  id v633;
  uint64_t v634;
  id v635;
  uint64_t v636;
  uint64_t v637;
  NSPPrivacyProxyAuthenticationInfo *v638;
  NSPPrivacyProxyConfiguration *v639;
  uint64_t v640;
  NSPPrivacyProxyTokenAttester *v641;
  uint64_t v642;
  uint64_t v643;
  id v644;
  id obj;
  id obja;
  id objb;
  uint64_t v648;
  void *v649;
  uint64_t v650;
  void *v651;
  uint64_t v652;
  uint64_t v653;
  id v654;
  uint64_t v655;
  NSPPrivacyProxyTokenIssuer *v656;
  uint64_t v657;
  uint64_t v658;
  uint64_t v659;
  uint64_t v660;
  uint64_t v661;
  id v662;
  NSPPrivacyProxyPolicyTierMap *v663;
  id v664;
  id v665;
  id v666;
  id v667;
  _QWORD handler[4];
  void (**v669)(_QWORD, _QWORD);
  __int128 v670;
  __int128 v671;
  __int128 v672;
  __int128 v673;
  __int128 v674;
  __int128 v675;
  __int128 v676;
  __int128 v677;
  __int128 v678;
  __int128 v679;
  __int128 v680;
  __int128 v681;
  __int128 v682;
  __int128 v683;
  __int128 v684;
  __int128 v685;
  __int128 v686;
  __int128 v687;
  __int128 v688;
  __int128 v689;
  __int128 v690;
  __int128 v691;
  __int128 v692;
  __int128 v693;
  __int128 v694;
  __int128 v695;
  __int128 v696;
  __int128 v697;
  __int128 v698;
  __int128 v699;
  __int128 v700;
  __int128 v701;
  __int128 v702;
  __int128 v703;
  __int128 v704;
  __int128 v705;
  __int128 v706;
  __int128 v707;
  __int128 v708;
  __int128 v709;
  __int128 v710;
  __int128 v711;
  __int128 v712;
  __int128 v713;
  __int128 v714;
  __int128 v715;
  __int128 v716;
  __int128 v717;
  __int128 v718;
  __int128 v719;
  __int128 v720;
  __int128 v721;
  __int128 v722;
  __int128 v723;
  __int128 v724;
  __int128 v725;
  __int128 v726;
  __int128 v727;
  __int128 v728;
  __int128 v729;
  __int128 v730;
  __int128 v731;
  __int128 v732;
  __int128 v733;
  __int128 v734;
  __int128 v735;
  __int128 v736;
  __int128 v737;
  __int128 v738;
  __int128 v739;
  __int128 v740;
  __int128 v741;
  __int128 v742;
  __int128 v743;
  __int128 v744;
  __int128 v745;
  __int128 v746;
  __int128 v747;
  __int128 v748;
  __int128 v749;
  __int128 v750;
  __int128 v751;
  __int128 v752;
  __int128 v753;
  __int128 v754;
  __int128 v755;
  __int128 v756;
  __int128 v757;
  __int128 v758;
  __int128 v759;
  __int128 v760;
  __int128 v761;
  __int128 v762;
  __int128 v763;
  __int128 v764;
  __int128 v765;
  __int128 v766;
  __int128 v767;
  __int128 v768;
  __int128 v769;
  __int128 v770;
  __int128 v771;
  __int128 v772;
  __int128 v773;
  __int128 v774;
  __int128 v775;
  __int128 v776;
  __int128 v777;
  uint8_t buf[8];
  _BYTE v779[128];
  _BYTE v780[128];
  _BYTE v781[128];
  _BYTE v782[128];
  _BYTE v783[128];
  _BYTE v784[128];
  _BYTE v785[128];
  _BYTE v786[128];
  _BYTE v787[128];
  _BYTE v788[128];
  _BYTE v789[128];
  _BYTE v790[128];
  _BYTE v791[128];
  _BYTE v792[128];
  _BYTE v793[128];
  _BYTE v794[128];
  _BYTE v795[128];
  _BYTE v796[128];
  _BYTE v797[128];
  _BYTE v798[128];
  _BYTE v799[128];
  _BYTE v800[128];
  _BYTE v801[128];
  _BYTE v802[128];
  _BYTE v803[128];
  _BYTE v804[128];
  _BYTE v805[128];
  uint64_t v806;

  v4 = MEMORY[0x1E0C80A78](self, a2, a3, a4);
  v6 = v5;
  selfa = (id)v4;
  v806 = *MEMORY[0x1E0C80C00];
  v8 = v7;
  v9 = v6;
  nplog_obj();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_debug_impl(&dword_19E8FE000, v10, OS_LOG_TYPE_DEBUG, "Requesting set proxy configuration", buf, 2u);
  }

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v631 = (void (**)(_QWORD, _QWORD))v9;
    v639 = objc_alloc_init(NSPPrivacyProxyConfiguration);
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("version"));
    v11 = objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      v12 = (void *)v11;
      objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("version"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      isKindOfClass = objc_opt_isKindOfClass();

      if ((isKindOfClass & 1) != 0)
      {
        objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("version"));
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSPPrivacyProxyConfiguration setVersion:](v639, "setVersion:", objc_msgSend(v15, "unsignedIntValue"));

      }
    }
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("enabled"));
    v16 = objc_claimAutoreleasedReturnValue();
    if (v16)
    {
      v17 = (void *)v16;
      objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("enabled"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      v19 = objc_opt_isKindOfClass();

      if ((v19 & 1) != 0)
      {
        objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("enabled"));
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSPPrivacyProxyConfiguration setEnabled:](v639, "setEnabled:", objc_msgSend(v20, "BOOLValue"));

      }
    }
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("disableUntil"));
    v21 = objc_claimAutoreleasedReturnValue();
    if (v21)
    {
      v22 = (void *)v21;
      objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("disableUntil"));
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      v24 = objc_opt_isKindOfClass();

      if ((v24 & 1) != 0)
      {
        objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("disableUntil"));
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSPPrivacyProxyConfiguration setDisableUntil:](v639, "setDisableUntil:", objc_msgSend(v25, "unsignedLongValue"));

      }
    }
    v638 = objc_alloc_init(NSPPrivacyProxyAuthenticationInfo);
    -[NSPPrivacyProxyConfiguration setAuthInfo:](v639, "setAuthInfo:");
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("authInfo"));
    v26 = objc_claimAutoreleasedReturnValue();
    v635 = v8;
    if (v26)
    {
      v27 = (void *)v26;
      objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("authInfo"));
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      v29 = objc_opt_isKindOfClass();

      if ((v29 & 1) != 0)
      {
        objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("authInfo"));
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "objectForKeyedSubscript:", CFSTR("authURL"));
        v31 = objc_claimAutoreleasedReturnValue();
        if (v31)
        {
          v32 = (void *)v31;
          objc_msgSend(v30, "objectForKeyedSubscript:", CFSTR("authURL"));
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          v34 = objc_opt_isKindOfClass();

          if ((v34 & 1) != 0)
          {
            objc_msgSend(v30, "objectForKeyedSubscript:", CFSTR("authURL"));
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSPPrivacyProxyAuthenticationInfo setAuthURL:](v638, "setAuthURL:", v35);

          }
        }
        objc_msgSend(v30, "objectForKeyedSubscript:", CFSTR("accessTokenURL"));
        v36 = objc_claimAutoreleasedReturnValue();
        if (v36)
        {
          v37 = (void *)v36;
          objc_msgSend(v30, "objectForKeyedSubscript:", CFSTR("accessTokenURL"));
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          v39 = objc_opt_isKindOfClass();

          if ((v39 & 1) != 0)
          {
            objc_msgSend(v30, "objectForKeyedSubscript:", CFSTR("accessTokenURL"));
            v40 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSPPrivacyProxyAuthenticationInfo setAccessTokenURL:](v638, "setAccessTokenURL:", v40);

          }
        }
        objc_msgSend(v30, "objectForKeyedSubscript:", CFSTR("accessTokenTypes"));
        v41 = objc_claimAutoreleasedReturnValue();
        v630 = v30;
        if (v41)
        {
          v42 = (void *)v41;
          objc_msgSend(v30, "objectForKeyedSubscript:", CFSTR("accessTokenTypes"));
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          v44 = objc_opt_isKindOfClass();

          if ((v44 & 1) != 0)
          {
            objc_msgSend(v30, "objectForKeyedSubscript:", CFSTR("accessTokenTypes"));
            v774 = 0u;
            v775 = 0u;
            v776 = 0u;
            v777 = 0u;
            v45 = (id)objc_claimAutoreleasedReturnValue();
            v46 = objc_msgSend(v45, "countByEnumeratingWithState:objects:count:", &v774, v805, 16);
            if (v46)
            {
              v47 = v46;
              v48 = *(_QWORD *)v775;
              do
              {
                for (i = 0; i != v47; ++i)
                {
                  if (*(_QWORD *)v775 != v48)
                    objc_enumerationMutation(v45);
                  v50 = *(void **)(*((_QWORD *)&v774 + 1) + 8 * i);
                  objc_opt_class();
                  if ((objc_opt_isKindOfClass() & 1) != 0)
                    -[NSPPrivacyProxyAuthenticationInfo addAccessTokenTypes:](v638, "addAccessTokenTypes:", objc_msgSend(v50, "unsignedIntValue"));
                }
                v47 = objc_msgSend(v45, "countByEnumeratingWithState:objects:count:", &v774, v805, 16);
              }
              while (v47);
            }

            v30 = v630;
          }
        }
        objc_msgSend(v30, "objectForKeyedSubscript:", CFSTR("accessTokenKnownOrigins"));
        v51 = objc_claimAutoreleasedReturnValue();
        if (v51)
        {
          v52 = (void *)v51;
          objc_msgSend(v30, "objectForKeyedSubscript:", CFSTR("accessTokenKnownOrigins"));
          v53 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          v54 = objc_opt_isKindOfClass();

          if ((v54 & 1) != 0)
          {
            objc_msgSend(v30, "objectForKeyedSubscript:", CFSTR("accessTokenKnownOrigins"));
            v770 = 0u;
            v771 = 0u;
            v772 = 0u;
            v773 = 0u;
            v55 = (id)objc_claimAutoreleasedReturnValue();
            v56 = objc_msgSend(v55, "countByEnumeratingWithState:objects:count:", &v770, v804, 16);
            if (v56)
            {
              v57 = v56;
              v58 = *(_QWORD *)v771;
              do
              {
                for (j = 0; j != v57; ++j)
                {
                  if (*(_QWORD *)v771 != v58)
                    objc_enumerationMutation(v55);
                  v60 = *(_QWORD *)(*((_QWORD *)&v770 + 1) + 8 * j);
                  objc_opt_class();
                  if ((objc_opt_isKindOfClass() & 1) != 0)
                    -[NSPPrivacyProxyAuthenticationInfo addAccessTokenKnownOrigins:](v638, "addAccessTokenKnownOrigins:", v60);
                }
                v57 = objc_msgSend(v55, "countByEnumeratingWithState:objects:count:", &v770, v804, 16);
              }
              while (v57);
            }

            v30 = v630;
          }
        }
        objc_msgSend(v30, "objectForKeyedSubscript:", CFSTR("accessTokenBlockedIssuers"));
        v61 = objc_claimAutoreleasedReturnValue();
        if (v61)
        {
          v62 = (void *)v61;
          objc_msgSend(v30, "objectForKeyedSubscript:", CFSTR("accessTokenBlockedIssuers"));
          v63 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          v64 = objc_opt_isKindOfClass();

          if ((v64 & 1) != 0)
          {
            objc_msgSend(v30, "objectForKeyedSubscript:", CFSTR("accessTokenBlockedIssuers"));
            v766 = 0u;
            v767 = 0u;
            v768 = 0u;
            v769 = 0u;
            v65 = (id)objc_claimAutoreleasedReturnValue();
            v66 = objc_msgSend(v65, "countByEnumeratingWithState:objects:count:", &v766, v803, 16);
            if (v66)
            {
              v67 = v66;
              v68 = *(_QWORD *)v767;
              do
              {
                for (k = 0; k != v67; ++k)
                {
                  if (*(_QWORD *)v767 != v68)
                    objc_enumerationMutation(v65);
                  v70 = *(_QWORD *)(*((_QWORD *)&v766 + 1) + 8 * k);
                  objc_opt_class();
                  if ((objc_opt_isKindOfClass() & 1) != 0)
                    -[NSPPrivacyProxyAuthenticationInfo addAccessTokenBlockedIssuers:](v638, "addAccessTokenBlockedIssuers:", v70);
                }
                v67 = objc_msgSend(v65, "countByEnumeratingWithState:objects:count:", &v766, v803, 16);
              }
              while (v67);
            }

            v30 = v630;
          }
        }
        objc_msgSend(v30, "objectForKeyedSubscript:", CFSTR("authType"));
        v71 = objc_claimAutoreleasedReturnValue();
        if (v71)
        {
          v72 = (void *)v71;
          objc_msgSend(v30, "objectForKeyedSubscript:", CFSTR("authType"));
          v73 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          v74 = objc_opt_isKindOfClass();

          if ((v74 & 1) != 0)
          {
            objc_msgSend(v30, "objectForKeyedSubscript:", CFSTR("authType"));
            v75 = (id)objc_claimAutoreleasedReturnValue();
            if ((objc_msgSend(v75, "isEqualToString:", CFSTR("UNKNOWN")) & 1) != 0)
            {
              v76 = 0;
            }
            else if ((objc_msgSend(v75, "isEqualToString:", CFSTR("BAA")) & 1) != 0)
            {
              v76 = 1;
            }
            else if ((objc_msgSend(v75, "isEqualToString:", CFSTR("ANISETTE")) & 1) != 0)
            {
              v76 = 2;
            }
            else if ((objc_msgSend(v75, "isEqualToString:", CFSTR("BAA_ANISETTE")) & 1) != 0)
            {
              v76 = 3;
            }
            else if (objc_msgSend(v75, "isEqualToString:", CFSTR("TOKEN")))
            {
              v76 = 4;
            }
            else
            {
              v76 = 0;
            }

            -[NSPPrivacyProxyAuthenticationInfo setAuthType:](v638, "setAuthType:", v76);
            v30 = v630;
          }
        }
        objc_msgSend(v30, "objectForKeyedSubscript:", CFSTR("nonDefaultAttesters"));
        v78 = objc_claimAutoreleasedReturnValue();
        if (v78)
        {
          v79 = (void *)v78;
          objc_msgSend(v30, "objectForKeyedSubscript:", CFSTR("nonDefaultAttesters"));
          v80 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          v81 = objc_opt_isKindOfClass();

          if ((v81 & 1) != 0)
          {
            objc_msgSend(v30, "objectForKeyedSubscript:", CFSTR("nonDefaultAttesters"));
            v762 = 0u;
            v763 = 0u;
            v764 = 0u;
            v765 = 0u;
            v82 = (id)objc_claimAutoreleasedReturnValue();
            v83 = objc_msgSend(v82, "countByEnumeratingWithState:objects:count:", &v762, v802, 16);
            if (v83)
            {
              v84 = v83;
              v636 = *(_QWORD *)v763;
              v633 = v82;
              do
              {
                v85 = 0;
                v634 = v84;
                do
                {
                  if (*(_QWORD *)v763 != v636)
                    objc_enumerationMutation(v82);
                  v637 = v85;
                  v86 = *(void **)(*((_QWORD *)&v762 + 1) + 8 * v85);
                  objc_opt_class();
                  if ((objc_opt_isKindOfClass() & 1) != 0)
                  {
                    v641 = objc_alloc_init(NSPPrivacyProxyTokenAttester);
                    -[NSPPrivacyProxyAuthenticationInfo addNonDefaultAttesters:](v638, "addNonDefaultAttesters:");
                    objc_msgSend(v86, "objectForKeyedSubscript:", CFSTR("authType"));
                    v87 = objc_claimAutoreleasedReturnValue();
                    if (v87)
                    {
                      v88 = (void *)v87;
                      objc_msgSend(v86, "objectForKeyedSubscript:", CFSTR("authType"));
                      v89 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_opt_class();
                      v90 = objc_opt_isKindOfClass();

                      if ((v90 & 1) != 0)
                      {
                        objc_msgSend(v86, "objectForKeyedSubscript:", CFSTR("authType"));
                        v91 = (id)objc_claimAutoreleasedReturnValue();
                        if ((objc_msgSend(v91, "isEqualToString:", CFSTR("UNKNOWN")) & 1) != 0)
                        {
                          v92 = 0;
                        }
                        else if ((objc_msgSend(v91, "isEqualToString:", CFSTR("BAA")) & 1) != 0)
                        {
                          v92 = 1;
                        }
                        else if ((objc_msgSend(v91, "isEqualToString:", CFSTR("ANISETTE")) & 1) != 0)
                        {
                          v92 = 2;
                        }
                        else if ((objc_msgSend(v91, "isEqualToString:", CFSTR("BAA_ANISETTE")) & 1) != 0)
                        {
                          v92 = 3;
                        }
                        else if (objc_msgSend(v91, "isEqualToString:", CFSTR("TOKEN")))
                        {
                          v92 = 4;
                        }
                        else
                        {
                          v92 = 0;
                        }

                        -[NSPPrivacyProxyTokenAttester setAuthType:](v641, "setAuthType:", v92);
                      }
                    }
                    objc_msgSend(v86, "objectForKeyedSubscript:", CFSTR("attesterURL"));
                    v93 = objc_claimAutoreleasedReturnValue();
                    if (v93)
                    {
                      v94 = (void *)v93;
                      objc_msgSend(v86, "objectForKeyedSubscript:", CFSTR("attesterURL"));
                      v95 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_opt_class();
                      v96 = objc_opt_isKindOfClass();

                      if ((v96 & 1) != 0)
                      {
                        objc_msgSend(v86, "objectForKeyedSubscript:", CFSTR("attesterURL"));
                        v97 = (void *)objc_claimAutoreleasedReturnValue();
                        -[NSPPrivacyProxyTokenAttester setAttesterURL:](v641, "setAttesterURL:", v97);

                      }
                    }
                    objc_msgSend(v86, "objectForKeyedSubscript:", CFSTR("associatedIssuers"));
                    v98 = objc_claimAutoreleasedReturnValue();
                    if (v98)
                    {
                      v99 = (void *)v98;
                      objc_msgSend(v86, "objectForKeyedSubscript:", CFSTR("associatedIssuers"));
                      v100 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_opt_class();
                      v101 = objc_opt_isKindOfClass();

                      if ((v101 & 1) != 0)
                      {
                        objc_msgSend(v86, "objectForKeyedSubscript:", CFSTR("associatedIssuers"));
                        v102 = (void *)objc_claimAutoreleasedReturnValue();
                        v758 = 0u;
                        v759 = 0u;
                        v760 = 0u;
                        v761 = 0u;
                        obj = v102;
                        v103 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v758, v801, 16);
                        if (v103)
                        {
                          v104 = v103;
                          v105 = *(_QWORD *)v759;
                          v640 = *(_QWORD *)v759;
                          do
                          {
                            v106 = 0;
                            v643 = v104;
                            do
                            {
                              if (*(_QWORD *)v759 != v105)
                                objc_enumerationMutation(obj);
                              v107 = *(void **)(*((_QWORD *)&v758 + 1) + 8 * v106);
                              objc_opt_class();
                              if ((objc_opt_isKindOfClass() & 1) != 0)
                              {
                                v648 = v106;
                                v656 = objc_alloc_init(NSPPrivacyProxyTokenIssuer);
                                -[NSPPrivacyProxyTokenAttester addAssociatedIssuers:](v641, "addAssociatedIssuers:");
                                objc_msgSend(v107, "objectForKeyedSubscript:", CFSTR("issuerName"));
                                v108 = objc_claimAutoreleasedReturnValue();
                                v651 = v107;
                                if (v108)
                                {
                                  v109 = (void *)v108;
                                  objc_msgSend(v107, "objectForKeyedSubscript:", CFSTR("issuerName"));
                                  v110 = (void *)objc_claimAutoreleasedReturnValue();
                                  objc_opt_class();
                                  v111 = objc_opt_isKindOfClass();

                                  if ((v111 & 1) != 0)
                                  {
                                    objc_msgSend(v107, "objectForKeyedSubscript:", CFSTR("issuerName"));
                                    v112 = (void *)objc_claimAutoreleasedReturnValue();
                                    -[NSPPrivacyProxyTokenIssuer setIssuerName:](v656, "setIssuerName:", v112);

                                  }
                                }
                                objc_msgSend(v107, "objectForKeyedSubscript:", CFSTR("tokenKeys"));
                                v113 = objc_claimAutoreleasedReturnValue();
                                if (v113)
                                {
                                  v114 = (void *)v113;
                                  objc_msgSend(v107, "objectForKeyedSubscript:", CFSTR("tokenKeys"));
                                  v115 = (void *)objc_claimAutoreleasedReturnValue();
                                  objc_opt_class();
                                  v116 = objc_opt_isKindOfClass();

                                  if ((v116 & 1) != 0)
                                  {
                                    objc_msgSend(v107, "objectForKeyedSubscript:", CFSTR("tokenKeys"));
                                    v117 = (void *)objc_claimAutoreleasedReturnValue();
                                    v754 = 0u;
                                    v755 = 0u;
                                    v756 = 0u;
                                    v757 = 0u;
                                    v662 = v117;
                                    v118 = objc_msgSend(v662, "countByEnumeratingWithState:objects:count:", &v754, v800, 16);
                                    if (v118)
                                    {
                                      v119 = v118;
                                      v120 = *(_QWORD *)v755;
                                      do
                                      {
                                        for (m = 0; m != v119; ++m)
                                        {
                                          if (*(_QWORD *)v755 != v120)
                                            objc_enumerationMutation(v662);
                                          v122 = *(void **)(*((_QWORD *)&v754 + 1) + 8 * m);
                                          objc_opt_class();
                                          if ((objc_opt_isKindOfClass() & 1) != 0)
                                          {
                                            v123 = objc_alloc_init(NSPPrivacyProxyTokenKey);
                                            -[NSPPrivacyProxyTokenIssuer addTokenKeys:](v656, "addTokenKeys:", v123);
                                            objc_msgSend(v122, "objectForKeyedSubscript:", CFSTR("key"));
                                            v124 = objc_claimAutoreleasedReturnValue();
                                            if (v124)
                                            {
                                              v125 = (void *)v124;
                                              objc_msgSend(v122, "objectForKeyedSubscript:", CFSTR("key"));
                                              v126 = (void *)objc_claimAutoreleasedReturnValue();
                                              objc_opt_class();
                                              v127 = objc_opt_isKindOfClass();

                                              if ((v127 & 1) != 0)
                                              {
                                                objc_msgSend(v122, "objectForKeyedSubscript:", CFSTR("key"));
                                                v128 = (void *)objc_claimAutoreleasedReturnValue();
                                                -[NSPPrivacyProxyTokenKey setKey:](v123, "setKey:", v128);

                                              }
                                            }
                                            objc_msgSend(v122, "objectForKeyedSubscript:", CFSTR("expiration"));
                                            v129 = objc_claimAutoreleasedReturnValue();
                                            if (v129)
                                            {
                                              v130 = (void *)v129;
                                              objc_msgSend(v122, "objectForKeyedSubscript:", CFSTR("expiration"));
                                              v131 = (void *)objc_claimAutoreleasedReturnValue();
                                              objc_opt_class();
                                              v132 = objc_opt_isKindOfClass();

                                              if ((v132 & 1) != 0)
                                              {
                                                objc_msgSend(v122, "objectForKeyedSubscript:", CFSTR("expiration"));
                                                v133 = (void *)objc_claimAutoreleasedReturnValue();
                                                -[NSPPrivacyProxyTokenKey setExpiration:](v123, "setExpiration:", objc_msgSend(v133, "unsignedLongLongValue"));

                                              }
                                            }
                                            objc_msgSend(v122, "objectForKeyedSubscript:", CFSTR("rotation"));
                                            v134 = objc_claimAutoreleasedReturnValue();
                                            if (v134)
                                            {
                                              v135 = (void *)v134;
                                              objc_msgSend(v122, "objectForKeyedSubscript:", CFSTR("rotation"));
                                              v136 = (void *)objc_claimAutoreleasedReturnValue();
                                              objc_opt_class();
                                              v137 = objc_opt_isKindOfClass();

                                              if ((v137 & 1) != 0)
                                              {
                                                objc_msgSend(v122, "objectForKeyedSubscript:", CFSTR("rotation"));
                                                v138 = (void *)objc_claimAutoreleasedReturnValue();
                                                -[NSPPrivacyProxyTokenKey setRotation:](v123, "setRotation:", objc_msgSend(v138, "unsignedLongLongValue"));

                                              }
                                            }

                                          }
                                        }
                                        v119 = objc_msgSend(v662, "countByEnumeratingWithState:objects:count:", &v754, v800, 16);
                                      }
                                      while (v119);
                                    }

                                    v107 = v651;
                                  }
                                }
                                objc_msgSend(v107, "objectForKeyedSubscript:", CFSTR("transparencyKeyBundle"));
                                v139 = objc_claimAutoreleasedReturnValue();
                                if (v139)
                                {
                                  v140 = (void *)v139;
                                  objc_msgSend(v107, "objectForKeyedSubscript:", CFSTR("transparencyKeyBundle"));
                                  v141 = (void *)objc_claimAutoreleasedReturnValue();
                                  objc_opt_class();
                                  v142 = objc_opt_isKindOfClass();

                                  v107 = v651;
                                  if ((v142 & 1) != 0)
                                  {
                                    objc_msgSend(v651, "objectForKeyedSubscript:", CFSTR("transparencyKeyBundle"));
                                    v143 = (void *)objc_claimAutoreleasedReturnValue();
                                    -[NSPPrivacyProxyTokenIssuer setTransparencyKeyBundle:](v656, "setTransparencyKeyBundle:", v143);

                                  }
                                }
                                objc_msgSend(v107, "objectForKeyedSubscript:", CFSTR("transparencyProof"));
                                v144 = objc_claimAutoreleasedReturnValue();
                                if (v144)
                                {
                                  v145 = (void *)v144;
                                  objc_msgSend(v107, "objectForKeyedSubscript:", CFSTR("transparencyProof"));
                                  v146 = (void *)objc_claimAutoreleasedReturnValue();
                                  objc_opt_class();
                                  v147 = objc_opt_isKindOfClass();

                                  v107 = v651;
                                  if ((v147 & 1) != 0)
                                  {
                                    objc_msgSend(v651, "objectForKeyedSubscript:", CFSTR("transparencyProof"));
                                    v148 = (void *)objc_claimAutoreleasedReturnValue();
                                    -[NSPPrivacyProxyTokenIssuer setTransparencyProof:](v656, "setTransparencyProof:", v148);

                                  }
                                }
                                objc_msgSend(v107, "objectForKeyedSubscript:", CFSTR("transparencyInternalProof"));
                                v149 = objc_claimAutoreleasedReturnValue();
                                if (v149)
                                {
                                  v150 = (void *)v149;
                                  objc_msgSend(v107, "objectForKeyedSubscript:", CFSTR("transparencyInternalProof"));
                                  v151 = (void *)objc_claimAutoreleasedReturnValue();
                                  objc_opt_class();
                                  v152 = objc_opt_isKindOfClass();

                                  if ((v152 & 1) != 0)
                                  {
                                    objc_msgSend(v651, "objectForKeyedSubscript:", CFSTR("transparencyInternalProof"));
                                    v153 = (void *)objc_claimAutoreleasedReturnValue();
                                    -[NSPPrivacyProxyTokenIssuer setTransparencyInternalProof:](v656, "setTransparencyInternalProof:", v153);

                                  }
                                }

                                v105 = v640;
                                v104 = v643;
                                v106 = v648;
                              }
                              ++v106;
                            }
                            while (v106 != v104);
                            v104 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v758, v801, 16);
                          }
                          while (v104);
                        }

                        v82 = v633;
                      }
                    }

                    v84 = v634;
                    v8 = v635;
                  }
                  v85 = v637 + 1;
                }
                while (v637 + 1 != v84);
                v84 = objc_msgSend(v82, "countByEnumeratingWithState:objects:count:", &v762, v802, 16);
              }
              while (v84);
            }

            v30 = v630;
          }
        }

      }
    }
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("policyTierMap"));
    v154 = objc_claimAutoreleasedReturnValue();
    if (v154)
    {
      v155 = (void *)v154;
      objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("policyTierMap"));
      v156 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      v157 = objc_opt_isKindOfClass();

      if ((v157 & 1) != 0)
      {
        objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("policyTierMap"));
        v750 = 0u;
        v751 = 0u;
        v752 = 0u;
        v753 = 0u;
        v158 = (id)objc_claimAutoreleasedReturnValue();
        v159 = objc_msgSend(v158, "countByEnumeratingWithState:objects:count:", &v750, v799, 16);
        if (v159)
        {
          v160 = v159;
          v161 = *(_QWORD *)v751;
          obja = v158;
          v652 = *(_QWORD *)v751;
          do
          {
            v162 = 0;
            v657 = v160;
            do
            {
              if (*(_QWORD *)v751 != v161)
                objc_enumerationMutation(v158);
              v163 = *(void **)(*((_QWORD *)&v750 + 1) + 8 * v162);
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v663 = objc_alloc_init(NSPPrivacyProxyPolicyTierMap);
                -[NSPPrivacyProxyConfiguration addPolicyTierMap:](v639, "addPolicyTierMap:");
                objc_msgSend(v163, "objectForKeyedSubscript:", CFSTR("tier"));
                v164 = objc_claimAutoreleasedReturnValue();
                if (v164)
                {
                  v165 = (void *)v164;
                  objc_msgSend(v163, "objectForKeyedSubscript:", CFSTR("tier"));
                  v166 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_opt_class();
                  v167 = objc_opt_isKindOfClass();

                  if ((v167 & 1) != 0)
                  {
                    objc_msgSend(v163, "objectForKeyedSubscript:", CFSTR("tier"));
                    v168 = (id)objc_claimAutoreleasedReturnValue();
                    if ((objc_msgSend(v168, "isEqualToString:", CFSTR("UNKNOWN")) & 1) != 0)
                    {
                      v169 = 0;
                    }
                    else if ((objc_msgSend(v168, "isEqualToString:", CFSTR("FREE")) & 1) != 0)
                    {
                      v169 = 1;
                    }
                    else if (objc_msgSend(v168, "isEqualToString:", CFSTR("SUBSCRIBER")))
                    {
                      v169 = 2;
                    }
                    else
                    {
                      v169 = 0;
                    }

                    -[NSPPrivacyProxyPolicyTierMap setTier:](v663, "setTier:", v169);
                  }
                }
                objc_msgSend(v163, "objectForKeyedSubscript:", CFSTR("policy"));
                v170 = objc_claimAutoreleasedReturnValue();
                if (v170)
                {
                  v171 = (void *)v170;
                  objc_msgSend(v163, "objectForKeyedSubscript:", CFSTR("policy"));
                  v172 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_opt_class();
                  v173 = objc_opt_isKindOfClass();

                  if ((v173 & 1) != 0)
                  {
                    objc_msgSend(v163, "objectForKeyedSubscript:", CFSTR("policy"));
                    v174 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v174, "objectForKeyedSubscript:", CFSTR("conditions"));
                    v175 = objc_claimAutoreleasedReturnValue();
                    if (v175)
                    {
                      v176 = (void *)v175;
                      objc_msgSend(v174, "objectForKeyedSubscript:", CFSTR("conditions"));
                      v649 = v174;
                      v177 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_opt_class();
                      v178 = objc_opt_isKindOfClass();

                      v174 = v649;
                      if ((v178 & 1) != 0)
                      {
                        v179 = objc_alloc_init(NSPPrivacyProxyPolicy);
                        -[NSPPrivacyProxyPolicyTierMap setPolicy:](v663, "setPolicy:", v179);
                        v749 = 0u;
                        v748 = 0u;
                        v747 = 0u;
                        v746 = 0u;
                        objc_msgSend(v649, "objectForKeyedSubscript:", CFSTR("conditions"));
                        v180 = (void *)objc_claimAutoreleasedReturnValue();
                        v181 = objc_msgSend(v180, "countByEnumeratingWithState:objects:count:", &v746, v798, 16);
                        if (v181)
                        {
                          v182 = v181;
                          v183 = *(_QWORD *)v747;
                          do
                          {
                            for (n = 0; n != v182; ++n)
                            {
                              if (*(_QWORD *)v747 != v183)
                                objc_enumerationMutation(v180);
                              v185 = *(id *)(*((_QWORD *)&v746 + 1) + 8 * n);
                              if ((objc_msgSend(v185, "isEqualToString:", CFSTR("UNKNOWN")) & 1) != 0)
                              {
                                v186 = 0;
                              }
                              else if ((objc_msgSend(v185, "isEqualToString:", CFSTR("SAFARI_UNENCRYPTED")) & 1) != 0)
                              {
                                v186 = 1;
                              }
                              else if ((objc_msgSend(v185, "isEqualToString:", CFSTR("SAFARI_DNS")) & 1) != 0)
                              {
                                v186 = 2;
                              }
                              else if ((objc_msgSend(v185, "isEqualToString:", CFSTR("SAFARI_TRACKER")) & 1) != 0)
                              {
                                v186 = 3;
                              }
                              else if ((objc_msgSend(v185, "isEqualToString:", CFSTR("MAIL_TRACKER")) & 1) != 0)
                              {
                                v186 = 4;
                              }
                              else if ((objc_msgSend(v185, "isEqualToString:", CFSTR("SAFARI_ALL")) & 1) != 0)
                              {
                                v186 = 5;
                              }
                              else if ((objc_msgSend(v185, "isEqualToString:", CFSTR("SAFARI_HTTP")) & 1) != 0)
                              {
                                v186 = 6;
                              }
                              else if ((objc_msgSend(v185, "isEqualToString:", CFSTR("ANY_UNENCRYPTED")) & 1) != 0)
                              {
                                v186 = 7;
                              }
                              else if ((objc_msgSend(v185, "isEqualToString:", CFSTR("ANY_DNS")) & 1) != 0)
                              {
                                v186 = 8;
                              }
                              else if ((objc_msgSend(v185, "isEqualToString:", CFSTR("ANY_KNOWN_TRACKER")) & 1) != 0)
                              {
                                v186 = 9;
                              }
                              else if ((objc_msgSend(v185, "isEqualToString:", CFSTR("ANY_APP_TRACKER")) & 1) != 0)
                              {
                                v186 = 10;
                              }
                              else if ((objc_msgSend(v185, "isEqualToString:", CFSTR("NEWS_URL_RESOLUTION")) & 1) != 0)
                              {
                                v186 = 11;
                              }
                              else if ((objc_msgSend(v185, "isEqualToString:", CFSTR("EXPOSURE_NOTIFICATIONS")) & 1) != 0)
                              {
                                v186 = 12;
                              }
                              else if ((objc_msgSend(v185, "isEqualToString:", CFSTR("APPLE_CERTIFICATES")) & 1) != 0)
                              {
                                v186 = 13;
                              }
                              else if ((objc_msgSend(v185, "isEqualToString:", CFSTR("NETWORK_TOOLS")) & 1) != 0)
                              {
                                v186 = 14;
                              }
                              else if ((objc_msgSend(v185, "isEqualToString:", CFSTR("METRICS_UPLOAD")) & 1) != 0)
                              {
                                v186 = 15;
                              }
                              else if ((objc_msgSend(v185, "isEqualToString:", CFSTR("BRANDED_CALLING")) & 1) != 0)
                              {
                                v186 = 16;
                              }
                              else if ((objc_msgSend(v185, "isEqualToString:", CFSTR("NEWS_EMBEDDED_CONTENT")) & 1) != 0)
                              {
                                v186 = 17;
                              }
                              else if ((objc_msgSend(v185, "isEqualToString:", CFSTR("APP_METRICS")) & 1) != 0)
                              {
                                v186 = 18;
                              }
                              else if ((objc_msgSend(v185, "isEqualToString:", CFSTR("SAFARI_PRIVATE_UNENCRYPTED")) & 1) != 0)
                              {
                                v186 = 19;
                              }
                              else if ((objc_msgSend(v185, "isEqualToString:", CFSTR("SAFARI_PRIVATE_DNS")) & 1) != 0)
                              {
                                v186 = 20;
                              }
                              else if ((objc_msgSend(v185, "isEqualToString:", CFSTR("SAFARI_PRIVATE_ALL")) & 1) != 0)
                              {
                                v186 = 21;
                              }
                              else if ((objc_msgSend(v185, "isEqualToString:", CFSTR("SAFARI_METRICS")) & 1) != 0)
                              {
                                v186 = 22;
                              }
                              else if ((objc_msgSend(v185, "isEqualToString:", CFSTR("PROMOTED_CONTENT")) & 1) != 0)
                              {
                                v186 = 23;
                              }
                              else if ((objc_msgSend(v185, "isEqualToString:", CFSTR("POSTBACK_FETCH")) & 1) != 0)
                              {
                                v186 = 24;
                              }
                              else if ((objc_msgSend(v185, "isEqualToString:", CFSTR("PM_PR_ICON_FETCHING")) & 1) != 0)
                              {
                                v186 = 25;
                              }
                              else if (objc_msgSend(v185, "isEqualToString:", CFSTR("LAUNCH_WARNING_DETAILS")))
                              {
                                v186 = 26;
                              }
                              else
                              {
                                v186 = 0;
                              }

                              -[NSPPrivacyProxyPolicy addConditions:](v179, "addConditions:", v186);
                            }
                            v182 = objc_msgSend(v180, "countByEnumeratingWithState:objects:count:", &v746, v798, 16);
                          }
                          while (v182);
                        }

                        v8 = v635;
                        v158 = obja;
                        v174 = v649;
                      }
                    }

                  }
                }

                v161 = v652;
                v160 = v657;
              }
              ++v162;
            }
            while (v162 != v160);
            v160 = objc_msgSend(v158, "countByEnumeratingWithState:objects:count:", &v750, v799, 16);
          }
          while (v160);
        }

      }
    }
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("proxies"));
    v187 = objc_claimAutoreleasedReturnValue();
    if (v187)
    {
      v188 = (void *)v187;
      objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("proxies"));
      v189 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      v190 = objc_opt_isKindOfClass();

      if ((v190 & 1) != 0)
      {
        objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("proxies"));
        v191 = (void *)objc_claimAutoreleasedReturnValue();
        v742 = 0u;
        v743 = 0u;
        v744 = 0u;
        v745 = 0u;
        v664 = v191;
        v192 = objc_msgSend(v664, "countByEnumeratingWithState:objects:count:", &v742, v797, 16);
        if (v192)
        {
          v193 = v192;
          v194 = *(_QWORD *)v743;
          v653 = *(_QWORD *)v743;
          do
          {
            v195 = 0;
            v658 = v193;
            do
            {
              if (*(_QWORD *)v743 != v194)
                objc_enumerationMutation(v664);
              v196 = *(void **)(*((_QWORD *)&v742 + 1) + 8 * v195);
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v197 = objc_alloc_init(NSPPrivacyProxyProxyInfo);
                -[NSPPrivacyProxyConfiguration addProxies:](v639, "addProxies:", v197);
                objc_msgSend(v196, "objectForKeyedSubscript:", CFSTR("proxyHop"));
                v198 = objc_claimAutoreleasedReturnValue();
                if (v198)
                {
                  v199 = (void *)v198;
                  objc_msgSend(v196, "objectForKeyedSubscript:", CFSTR("proxyHop"));
                  v200 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_opt_class();
                  v201 = objc_opt_isKindOfClass();

                  if ((v201 & 1) != 0)
                  {
                    objc_msgSend(v196, "objectForKeyedSubscript:", CFSTR("proxyHop"));
                    v202 = (id)objc_claimAutoreleasedReturnValue();
                    if ((objc_msgSend(v202, "isEqualToString:", CFSTR("UNKNOWN")) & 1) != 0)
                    {
                      v203 = 0;
                    }
                    else if ((objc_msgSend(v202, "isEqualToString:", CFSTR("INGRESS_ONLY")) & 1) != 0)
                    {
                      v203 = 1;
                    }
                    else if ((objc_msgSend(v202, "isEqualToString:", CFSTR("EGRESS_ONLY")) & 1) != 0)
                    {
                      v203 = 2;
                    }
                    else if (objc_msgSend(v202, "isEqualToString:", CFSTR("ANY")))
                    {
                      v203 = 3;
                    }
                    else
                    {
                      v203 = 0;
                    }

                    -[NSPPrivacyProxyProxyInfo setProxyHop:](v197, "setProxyHop:", v203);
                  }
                }
                objc_msgSend(v196, "objectForKeyedSubscript:", CFSTR("proxyURL"));
                v204 = objc_claimAutoreleasedReturnValue();
                if (v204)
                {
                  v205 = (void *)v204;
                  objc_msgSend(v196, "objectForKeyedSubscript:", CFSTR("proxyURL"));
                  v206 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_opt_class();
                  v207 = objc_opt_isKindOfClass();

                  if ((v207 & 1) != 0)
                  {
                    objc_msgSend(v196, "objectForKeyedSubscript:", CFSTR("proxyURL"));
                    v208 = (void *)objc_claimAutoreleasedReturnValue();
                    -[NSPPrivacyProxyProxyInfo setProxyURL:](v197, "setProxyURL:", v208);

                  }
                }
                objc_msgSend(v196, "objectForKeyedSubscript:", CFSTR("proxyKeyInfo"));
                v209 = objc_claimAutoreleasedReturnValue();
                if (v209)
                {
                  v210 = (void *)v209;
                  objc_msgSend(v196, "objectForKeyedSubscript:", CFSTR("proxyKeyInfo"));
                  v211 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_opt_class();
                  v212 = objc_opt_isKindOfClass();

                  if ((v212 & 1) != 0)
                  {
                    objc_msgSend(v196, "objectForKeyedSubscript:", CFSTR("proxyKeyInfo"));
                    v213 = (void *)objc_claimAutoreleasedReturnValue();
                    v738 = 0u;
                    v739 = 0u;
                    v740 = 0u;
                    v741 = 0u;
                    v214 = v213;
                    v215 = objc_msgSend(v214, "countByEnumeratingWithState:objects:count:", &v738, v796, 16);
                    if (v215)
                    {
                      v216 = v215;
                      v217 = *(_QWORD *)v739;
                      do
                      {
                        for (ii = 0; ii != v216; ++ii)
                        {
                          if (*(_QWORD *)v739 != v217)
                            objc_enumerationMutation(v214);
                          v219 = *(_QWORD *)(*((_QWORD *)&v738 + 1) + 8 * ii);
                          objc_opt_class();
                          if ((objc_opt_isKindOfClass() & 1) != 0)
                            -[NSPPrivacyProxyProxyInfo addProxyKeyInfo:](v197, "addProxyKeyInfo:", v219);
                        }
                        v216 = objc_msgSend(v214, "countByEnumeratingWithState:objects:count:", &v738, v796, 16);
                      }
                      while (v216);
                    }

                  }
                }
                objc_msgSend(v196, "objectForKeyedSubscript:", CFSTR("tokenKeyInfo"));
                v220 = objc_claimAutoreleasedReturnValue();
                if (v220)
                {
                  v221 = (void *)v220;
                  objc_msgSend(v196, "objectForKeyedSubscript:", CFSTR("tokenKeyInfo"));
                  v222 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_opt_class();
                  v223 = objc_opt_isKindOfClass();

                  if ((v223 & 1) != 0)
                  {
                    objc_msgSend(v196, "objectForKeyedSubscript:", CFSTR("tokenKeyInfo"));
                    v224 = (void *)objc_claimAutoreleasedReturnValue();
                    -[NSPPrivacyProxyProxyInfo setTokenKeyInfo:](v197, "setTokenKeyInfo:", v224);

                  }
                }
                objc_msgSend(v196, "objectForKeyedSubscript:", CFSTR("supportsFallback"));
                v225 = objc_claimAutoreleasedReturnValue();
                if (v225)
                {
                  v226 = (void *)v225;
                  objc_msgSend(v196, "objectForKeyedSubscript:", CFSTR("supportsFallback"));
                  v227 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_opt_class();
                  v228 = objc_opt_isKindOfClass();

                  if ((v228 & 1) != 0)
                  {
                    objc_msgSend(v196, "objectForKeyedSubscript:", CFSTR("supportsFallback"));
                    v229 = (void *)objc_claimAutoreleasedReturnValue();
                    -[NSPPrivacyProxyProxyInfo setSupportsFallback:](v197, "setSupportsFallback:", objc_msgSend(v229, "BOOLValue"));

                  }
                }
                objc_msgSend(v196, "objectForKeyedSubscript:", CFSTR("vendor"));
                v230 = objc_claimAutoreleasedReturnValue();
                if (v230)
                {
                  v231 = (void *)v230;
                  objc_msgSend(v196, "objectForKeyedSubscript:", CFSTR("vendor"));
                  v232 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_opt_class();
                  v233 = objc_opt_isKindOfClass();

                  if ((v233 & 1) != 0)
                  {
                    objc_msgSend(v196, "objectForKeyedSubscript:", CFSTR("vendor"));
                    v234 = (void *)objc_claimAutoreleasedReturnValue();
                    -[NSPPrivacyProxyProxyInfo setVendor:](v197, "setVendor:", v234);

                  }
                }
                objc_msgSend(v196, "objectForKeyedSubscript:", CFSTR("tcpProxyFqdn"));
                v235 = objc_claimAutoreleasedReturnValue();
                if (v235)
                {
                  v236 = (void *)v235;
                  objc_msgSend(v196, "objectForKeyedSubscript:", CFSTR("tcpProxyFqdn"));
                  v237 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_opt_class();
                  v238 = objc_opt_isKindOfClass();

                  if ((v238 & 1) != 0)
                  {
                    objc_msgSend(v196, "objectForKeyedSubscript:", CFSTR("tcpProxyFqdn"));
                    v239 = (void *)objc_claimAutoreleasedReturnValue();
                    -[NSPPrivacyProxyProxyInfo setTcpProxyFqdn:](v197, "setTcpProxyFqdn:", v239);

                  }
                }
                objc_msgSend(v196, "objectForKeyedSubscript:", CFSTR("preferredPathConfigUri"));
                v240 = objc_claimAutoreleasedReturnValue();
                if (v240)
                {
                  v241 = (void *)v240;
                  objc_msgSend(v196, "objectForKeyedSubscript:", CFSTR("preferredPathConfigUri"));
                  v242 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_opt_class();
                  v243 = objc_opt_isKindOfClass();

                  if ((v243 & 1) != 0)
                  {
                    objc_msgSend(v196, "objectForKeyedSubscript:", CFSTR("preferredPathConfigUri"));
                    v244 = (void *)objc_claimAutoreleasedReturnValue();
                    -[NSPPrivacyProxyProxyInfo setPreferredPathConfigUri:](v197, "setPreferredPathConfigUri:", v244);

                  }
                }
                objc_msgSend(v196, "objectForKeyedSubscript:", CFSTR("proxyVersion"));
                v245 = objc_claimAutoreleasedReturnValue();
                if (v245)
                {
                  v246 = (void *)v245;
                  objc_msgSend(v196, "objectForKeyedSubscript:", CFSTR("proxyVersion"));
                  v247 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_opt_class();
                  v248 = objc_opt_isKindOfClass();

                  if ((v248 & 1) != 0)
                  {
                    objc_msgSend(v196, "objectForKeyedSubscript:", CFSTR("proxyVersion"));
                    v249 = (void *)objc_claimAutoreleasedReturnValue();
                    -[NSPPrivacyProxyProxyInfo setProxyVersion:](v197, "setProxyVersion:", v249);

                  }
                }
                objc_msgSend(v196, "objectForKeyedSubscript:", CFSTR("supportsResumption"));
                v250 = objc_claimAutoreleasedReturnValue();
                if (v250)
                {
                  v251 = (void *)v250;
                  objc_msgSend(v196, "objectForKeyedSubscript:", CFSTR("supportsResumption"));
                  v252 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_opt_class();
                  v253 = objc_opt_isKindOfClass();

                  if ((v253 & 1) != 0)
                  {
                    objc_msgSend(v196, "objectForKeyedSubscript:", CFSTR("supportsResumption"));
                    v254 = (void *)objc_claimAutoreleasedReturnValue();
                    -[NSPPrivacyProxyProxyInfo setSupportsResumption:](v197, "setSupportsResumption:", objc_msgSend(v254, "BOOLValue"));

                  }
                }
                objc_msgSend(v196, "objectForKeyedSubscript:", CFSTR("fallbackSupportsUDPProxying"));
                v255 = objc_claimAutoreleasedReturnValue();
                if (v255)
                {
                  v256 = (void *)v255;
                  objc_msgSend(v196, "objectForKeyedSubscript:", CFSTR("fallbackSupportsUDPProxying"));
                  v257 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_opt_class();
                  v258 = objc_opt_isKindOfClass();

                  if ((v258 & 1) != 0)
                  {
                    objc_msgSend(v196, "objectForKeyedSubscript:", CFSTR("fallbackSupportsUDPProxying"));
                    v259 = (void *)objc_claimAutoreleasedReturnValue();
                    -[NSPPrivacyProxyProxyInfo setFallbackSupportsUDPProxying:](v197, "setFallbackSupportsUDPProxying:", objc_msgSend(v259, "BOOLValue"));

                  }
                }
                objc_msgSend(v196, "objectForKeyedSubscript:", CFSTR("bootstrapAddresses"));
                v260 = objc_claimAutoreleasedReturnValue();
                if (v260)
                {
                  v261 = (void *)v260;
                  objc_msgSend(v196, "objectForKeyedSubscript:", CFSTR("bootstrapAddresses"));
                  v262 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_opt_class();
                  v263 = objc_opt_isKindOfClass();

                  if ((v263 & 1) != 0)
                  {
                    objc_msgSend(v196, "objectForKeyedSubscript:", CFSTR("bootstrapAddresses"));
                    v264 = (void *)objc_claimAutoreleasedReturnValue();
                    v734 = 0u;
                    v735 = 0u;
                    v736 = 0u;
                    v737 = 0u;
                    v265 = v264;
                    v266 = objc_msgSend(v265, "countByEnumeratingWithState:objects:count:", &v734, v795, 16);
                    if (v266)
                    {
                      v267 = v266;
                      v268 = *(_QWORD *)v735;
                      do
                      {
                        for (jj = 0; jj != v267; ++jj)
                        {
                          if (*(_QWORD *)v735 != v268)
                            objc_enumerationMutation(v265);
                          v270 = *(_QWORD *)(*((_QWORD *)&v734 + 1) + 8 * jj);
                          objc_opt_class();
                          if ((objc_opt_isKindOfClass() & 1) != 0)
                            -[NSPPrivacyProxyProxyInfo addBootstrapAddresses:](v197, "addBootstrapAddresses:", v270);
                        }
                        v267 = objc_msgSend(v265, "countByEnumeratingWithState:objects:count:", &v734, v795, 16);
                      }
                      while (v267);
                    }

                  }
                }
                objc_msgSend(v196, "objectForKeyedSubscript:", CFSTR("allowedNextHops"));
                v271 = objc_claimAutoreleasedReturnValue();
                if (v271)
                {
                  v272 = (void *)v271;
                  objc_msgSend(v196, "objectForKeyedSubscript:", CFSTR("allowedNextHops"));
                  v273 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_opt_class();
                  v274 = objc_opt_isKindOfClass();

                  if ((v274 & 1) != 0)
                  {
                    objc_msgSend(v196, "objectForKeyedSubscript:", CFSTR("allowedNextHops"));
                    v275 = (void *)objc_claimAutoreleasedReturnValue();
                    v730 = 0u;
                    v731 = 0u;
                    v732 = 0u;
                    v733 = 0u;
                    v276 = v275;
                    v277 = objc_msgSend(v276, "countByEnumeratingWithState:objects:count:", &v730, v794, 16);
                    if (v277)
                    {
                      v278 = v277;
                      v279 = *(_QWORD *)v731;
                      do
                      {
                        for (kk = 0; kk != v278; ++kk)
                        {
                          if (*(_QWORD *)v731 != v279)
                            objc_enumerationMutation(v276);
                          v281 = *(_QWORD *)(*((_QWORD *)&v730 + 1) + 8 * kk);
                          objc_opt_class();
                          if ((objc_opt_isKindOfClass() & 1) != 0)
                            -[NSPPrivacyProxyProxyInfo addAllowedNextHops:](v197, "addAllowedNextHops:", v281);
                        }
                        v278 = objc_msgSend(v276, "countByEnumeratingWithState:objects:count:", &v730, v794, 16);
                      }
                      while (v278);
                    }

                  }
                }
                objc_msgSend(v196, "objectForKeyedSubscript:", CFSTR("tokenChallenge"));
                v282 = objc_claimAutoreleasedReturnValue();
                if (v282)
                {
                  v283 = (void *)v282;
                  objc_msgSend(v196, "objectForKeyedSubscript:", CFSTR("tokenChallenge"));
                  v284 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_opt_class();
                  v285 = objc_opt_isKindOfClass();

                  if ((v285 & 1) != 0)
                  {
                    objc_msgSend(v196, "objectForKeyedSubscript:", CFSTR("tokenChallenge"));
                    v286 = (void *)objc_claimAutoreleasedReturnValue();
                    -[NSPPrivacyProxyProxyInfo setTokenChallenge:](v197, "setTokenChallenge:", v286);

                  }
                }
                objc_msgSend(v196, "objectForKeyedSubscript:", CFSTR("preferredPathPatterns"));
                v287 = objc_claimAutoreleasedReturnValue();
                if (v287)
                {
                  v288 = (void *)v287;
                  objc_msgSend(v196, "objectForKeyedSubscript:", CFSTR("preferredPathPatterns"));
                  v289 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_opt_class();
                  v290 = objc_opt_isKindOfClass();

                  if ((v290 & 1) != 0)
                  {
                    objc_msgSend(v196, "objectForKeyedSubscript:", CFSTR("preferredPathPatterns"));
                    v291 = (void *)objc_claimAutoreleasedReturnValue();
                    v726 = 0u;
                    v727 = 0u;
                    v728 = 0u;
                    v729 = 0u;
                    v292 = v291;
                    v293 = objc_msgSend(v292, "countByEnumeratingWithState:objects:count:", &v726, v793, 16);
                    if (v293)
                    {
                      v294 = v293;
                      v295 = *(_QWORD *)v727;
                      do
                      {
                        for (mm = 0; mm != v294; ++mm)
                        {
                          if (*(_QWORD *)v727 != v295)
                            objc_enumerationMutation(v292);
                          v297 = *(_QWORD *)(*((_QWORD *)&v726 + 1) + 8 * mm);
                          objc_opt_class();
                          if ((objc_opt_isKindOfClass() & 1) != 0)
                            -[NSPPrivacyProxyProxyInfo addPreferredPathPatterns:](v197, "addPreferredPathPatterns:", v297);
                        }
                        v294 = objc_msgSend(v292, "countByEnumeratingWithState:objects:count:", &v726, v793, 16);
                      }
                      while (v294);
                    }

                  }
                }
                objc_msgSend(v196, "objectForKeyedSubscript:", CFSTR("algorithm"));
                v298 = objc_claimAutoreleasedReturnValue();
                if (v298)
                {
                  v299 = (void *)v298;
                  objc_msgSend(v196, "objectForKeyedSubscript:", CFSTR("algorithm"));
                  v300 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_opt_class();
                  v301 = objc_opt_isKindOfClass();

                  if ((v301 & 1) != 0)
                  {
                    objc_msgSend(v196, "objectForKeyedSubscript:", CFSTR("algorithm"));
                    v302 = (id)objc_claimAutoreleasedReturnValue();
                    if ((objc_msgSend(v302, "isEqualToString:", CFSTR("NOT_SET")) & 1) != 0)
                    {
                      v303 = 0;
                    }
                    else if ((objc_msgSend(v302, "isEqualToString:", CFSTR("P384")) & 1) != 0)
                    {
                      v303 = 1;
                    }
                    else if (objc_msgSend(v302, "isEqualToString:", CFSTR("X25519")))
                    {
                      v303 = 2;
                    }
                    else
                    {
                      v303 = 0;
                    }

                    -[NSPPrivacyProxyProxyInfo setAlgorithm:](v197, "setAlgorithm:", v303);
                  }
                }

                v194 = v653;
                v193 = v658;
              }
              ++v195;
            }
            while (v195 != v193);
            v193 = objc_msgSend(v664, "countByEnumeratingWithState:objects:count:", &v742, v797, 16);
          }
          while (v193);
        }

        v8 = v635;
      }
    }
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("pathWeights"));
    v304 = objc_claimAutoreleasedReturnValue();
    if (v304)
    {
      v305 = (void *)v304;
      objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("pathWeights"));
      v306 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      v307 = objc_opt_isKindOfClass();

      if ((v307 & 1) != 0)
      {
        objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("pathWeights"));
        v308 = (void *)objc_claimAutoreleasedReturnValue();
        v722 = 0u;
        v723 = 0u;
        v724 = 0u;
        v725 = 0u;
        v309 = v308;
        v310 = objc_msgSend(v309, "countByEnumeratingWithState:objects:count:", &v722, v792, 16);
        if (v310)
        {
          v311 = v310;
          v312 = *(_QWORD *)v723;
          do
          {
            for (nn = 0; nn != v311; ++nn)
            {
              if (*(_QWORD *)v723 != v312)
                objc_enumerationMutation(v309);
              v314 = *(void **)(*((_QWORD *)&v722 + 1) + 8 * nn);
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v315 = objc_alloc_init(NSPPrivacyProxyProxyPathWeight);
                -[NSPPrivacyProxyConfiguration addPathWeights:](v639, "addPathWeights:", v315);
                objc_msgSend(v314, "objectForKeyedSubscript:", CFSTR("weight"));
                v316 = objc_claimAutoreleasedReturnValue();
                if (v316)
                {
                  v317 = (void *)v316;
                  objc_msgSend(v314, "objectForKeyedSubscript:", CFSTR("weight"));
                  v318 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_opt_class();
                  v319 = objc_opt_isKindOfClass();

                  if ((v319 & 1) != 0)
                  {
                    objc_msgSend(v314, "objectForKeyedSubscript:", CFSTR("weight"));
                    v320 = (void *)objc_claimAutoreleasedReturnValue();
                    -[NSPPrivacyProxyProxyPathWeight setWeight:](v315, "setWeight:", objc_msgSend(v320, "unsignedIntValue"));

                  }
                }
                objc_msgSend(v314, "objectForKeyedSubscript:", CFSTR("proxies"));
                v321 = objc_claimAutoreleasedReturnValue();
                if (v321)
                {
                  v322 = (void *)v321;
                  objc_msgSend(v314, "objectForKeyedSubscript:", CFSTR("proxies"));
                  v323 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_opt_class();
                  v324 = objc_opt_isKindOfClass();

                  if ((v324 & 1) != 0)
                  {
                    objc_msgSend(v314, "objectForKeyedSubscript:", CFSTR("proxies"));
                    v325 = (void *)objc_claimAutoreleasedReturnValue();
                    v718 = 0u;
                    v719 = 0u;
                    v720 = 0u;
                    v721 = 0u;
                    v326 = v325;
                    v327 = objc_msgSend(v326, "countByEnumeratingWithState:objects:count:", &v718, v791, 16);
                    if (v327)
                    {
                      v328 = v327;
                      v329 = *(_QWORD *)v719;
                      do
                      {
                        for (i1 = 0; i1 != v328; ++i1)
                        {
                          if (*(_QWORD *)v719 != v329)
                            objc_enumerationMutation(v326);
                          -[NSPPrivacyProxyProxyPathWeight addProxies:](v315, "addProxies:", objc_msgSend(*(id *)(*((_QWORD *)&v718 + 1) + 8 * i1), "unsignedIntValue"));
                        }
                        v328 = objc_msgSend(v326, "countByEnumeratingWithState:objects:count:", &v718, v791, 16);
                      }
                      while (v328);
                    }

                  }
                }

              }
            }
            v311 = objc_msgSend(v309, "countByEnumeratingWithState:objects:count:", &v722, v792, 16);
          }
          while (v311);
        }

        v8 = v635;
      }
    }
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("resolvers"));
    v331 = objc_claimAutoreleasedReturnValue();
    if (v331)
    {
      v332 = (void *)v331;
      objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("resolvers"));
      v333 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      v334 = objc_opt_isKindOfClass();

      if ((v334 & 1) != 0)
      {
        objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("resolvers"));
        v335 = (void *)objc_claimAutoreleasedReturnValue();
        v714 = 0u;
        v715 = 0u;
        v716 = 0u;
        v717 = 0u;
        v665 = v335;
        v336 = objc_msgSend(v665, "countByEnumeratingWithState:objects:count:", &v714, v790, 16);
        if (v336)
        {
          v337 = v336;
          v338 = *(_QWORD *)v715;
          do
          {
            v339 = 0;
            v659 = v337;
            do
            {
              if (*(_QWORD *)v715 != v338)
                objc_enumerationMutation(v665);
              v340 = *(void **)(*((_QWORD *)&v714 + 1) + 8 * v339);
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v341 = objc_alloc_init(NSPPrivacyProxyResolverInfo);
                -[NSPPrivacyProxyConfiguration addResolvers:](v639, "addResolvers:", v341);
                objc_msgSend(v340, "objectForKeyedSubscript:", CFSTR("dohURL"));
                v342 = objc_claimAutoreleasedReturnValue();
                if (v342)
                {
                  v343 = (void *)v342;
                  objc_msgSend(v340, "objectForKeyedSubscript:", CFSTR("dohURL"));
                  v344 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_opt_class();
                  v345 = objc_opt_isKindOfClass();

                  if ((v345 & 1) != 0)
                  {
                    objc_msgSend(v340, "objectForKeyedSubscript:", CFSTR("dohURL"));
                    v346 = (void *)objc_claimAutoreleasedReturnValue();
                    -[NSPPrivacyProxyResolverInfo setDohURL:](v341, "setDohURL:", v346);

                  }
                }
                objc_msgSend(v340, "objectForKeyedSubscript:", CFSTR("obliviousDoHConfig"));
                v347 = objc_claimAutoreleasedReturnValue();
                if (v347)
                {
                  v348 = (void *)v347;
                  objc_msgSend(v340, "objectForKeyedSubscript:", CFSTR("obliviousDoHConfig"));
                  v349 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_opt_class();
                  v350 = objc_opt_isKindOfClass();

                  if ((v350 & 1) != 0)
                  {
                    objc_msgSend(v340, "objectForKeyedSubscript:", CFSTR("obliviousDoHConfig"));
                    v351 = (void *)objc_claimAutoreleasedReturnValue();
                    -[NSPPrivacyProxyResolverInfo setObliviousDoHConfig:](v341, "setObliviousDoHConfig:", v351);

                  }
                }
                objc_msgSend(v340, "objectForKeyedSubscript:", CFSTR("weight"));
                v352 = objc_claimAutoreleasedReturnValue();
                if (v352)
                {
                  v353 = (void *)v352;
                  objc_msgSend(v340, "objectForKeyedSubscript:", CFSTR("weight"));
                  v354 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_opt_class();
                  v355 = objc_opt_isKindOfClass();

                  if ((v355 & 1) != 0)
                  {
                    objc_msgSend(v340, "objectForKeyedSubscript:", CFSTR("weight"));
                    v356 = (void *)objc_claimAutoreleasedReturnValue();
                    -[NSPPrivacyProxyResolverInfo setWeight:](v341, "setWeight:", objc_msgSend(v356, "unsignedIntValue"));

                  }
                }
                objc_msgSend(v340, "objectForKeyedSubscript:", CFSTR("proxyIndex"));
                v357 = objc_claimAutoreleasedReturnValue();
                v337 = v659;
                if (v357)
                {
                  v358 = (void *)v357;
                  objc_msgSend(v340, "objectForKeyedSubscript:", CFSTR("proxyIndex"));
                  v359 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_opt_class();
                  v360 = objc_opt_isKindOfClass();

                  if ((v360 & 1) != 0)
                  {
                    objc_msgSend(v340, "objectForKeyedSubscript:", CFSTR("proxyIndex"));
                    v361 = (void *)objc_claimAutoreleasedReturnValue();
                    -[NSPPrivacyProxyResolverInfo setProxyIndex:](v341, "setProxyIndex:", objc_msgSend(v361, "unsignedIntValue"));

                  }
                }

              }
              ++v339;
            }
            while (v337 != v339);
            v337 = objc_msgSend(v665, "countByEnumeratingWithState:objects:count:", &v714, v790, 16);
          }
          while (v337);
        }

        v8 = v635;
      }
    }
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("bootstrapResolver"));
    v362 = objc_claimAutoreleasedReturnValue();
    if (v362)
    {
      v363 = (void *)v362;
      objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("bootstrapResolver"));
      v364 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      v365 = objc_opt_isKindOfClass();

      if ((v365 & 1) != 0)
      {
        objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("bootstrapResolver"));
        v366 = (void *)objc_claimAutoreleasedReturnValue();
        v367 = objc_alloc_init(NSPPrivacyProxyResolverInfo);
        objc_msgSend(v366, "objectForKeyedSubscript:", CFSTR("dohURL"));
        v368 = objc_claimAutoreleasedReturnValue();
        if (v368)
        {
          v369 = (void *)v368;
          objc_msgSend(v366, "objectForKeyedSubscript:", CFSTR("dohURL"));
          v370 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          v371 = objc_opt_isKindOfClass();

          if ((v371 & 1) != 0)
          {
            objc_msgSend(v366, "objectForKeyedSubscript:", CFSTR("dohURL"));
            v372 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSPPrivacyProxyResolverInfo setDohURL:](v367, "setDohURL:", v372);

          }
        }
        objc_msgSend(v366, "objectForKeyedSubscript:", CFSTR("obliviousDoHConfig"));
        v373 = objc_claimAutoreleasedReturnValue();
        if (v373)
        {
          v374 = (void *)v373;
          objc_msgSend(v366, "objectForKeyedSubscript:", CFSTR("obliviousDoHConfig"));
          v375 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          v376 = objc_opt_isKindOfClass();

          if ((v376 & 1) != 0)
          {
            objc_msgSend(v366, "objectForKeyedSubscript:", CFSTR("obliviousDoHConfig"));
            v377 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSPPrivacyProxyResolverInfo setObliviousDoHConfig:](v367, "setObliviousDoHConfig:", v377);

          }
        }
        objc_msgSend(v366, "objectForKeyedSubscript:", CFSTR("weight"));
        v378 = objc_claimAutoreleasedReturnValue();
        if (v378)
        {
          v379 = (void *)v378;
          objc_msgSend(v366, "objectForKeyedSubscript:", CFSTR("weight"));
          v380 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          v381 = objc_opt_isKindOfClass();

          if ((v381 & 1) != 0)
          {
            objc_msgSend(v366, "objectForKeyedSubscript:", CFSTR("weight"));
            v382 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSPPrivacyProxyResolverInfo setWeight:](v367, "setWeight:", objc_msgSend(v382, "unsignedIntValue"));

          }
        }
        objc_msgSend(v366, "objectForKeyedSubscript:", CFSTR("proxyIndex"));
        v383 = objc_claimAutoreleasedReturnValue();
        if (v383)
        {
          v384 = (void *)v383;
          objc_msgSend(v366, "objectForKeyedSubscript:", CFSTR("proxyIndex"));
          v385 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          v386 = objc_opt_isKindOfClass();

          if ((v386 & 1) != 0)
          {
            objc_msgSend(v366, "objectForKeyedSubscript:", CFSTR("proxyIndex"));
            v387 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSPPrivacyProxyResolverInfo setProxyIndex:](v367, "setProxyIndex:", objc_msgSend(v387, "unsignedIntValue"));

          }
        }
        -[NSPPrivacyProxyConfiguration setBootstrapResolver:](v639, "setBootstrapResolver:", v367);

      }
    }
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("dnsProbe"));
    v388 = objc_claimAutoreleasedReturnValue();
    if (v388)
    {
      v389 = (void *)v388;
      objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("dnsProbe"));
      v390 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      v391 = objc_opt_isKindOfClass();

      if ((v391 & 1) != 0)
      {
        objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("dnsProbe"));
        v392 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSPPrivacyProxyConfiguration setDnsProbe:](v639, "setDnsProbe:", v392);

      }
    }
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("obliviousConfigs"));
    v393 = objc_claimAutoreleasedReturnValue();
    if (v393)
    {
      v394 = (void *)v393;
      objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("obliviousConfigs"));
      v395 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      v396 = objc_opt_isKindOfClass();

      if ((v396 & 1) != 0)
      {
        objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("obliviousConfigs"));
        v397 = (void *)objc_claimAutoreleasedReturnValue();
        v710 = 0u;
        v711 = 0u;
        v712 = 0u;
        v713 = 0u;
        v398 = v397;
        v399 = objc_msgSend(v398, "countByEnumeratingWithState:objects:count:", &v710, v789, 16);
        if (v399)
        {
          v400 = v399;
          v401 = 0x1E4135000uLL;
          v402 = *(_QWORD *)v711;
          v642 = *(_QWORD *)v711;
          v644 = v398;
          do
          {
            v403 = 0;
            objb = (id)v400;
            do
            {
              if (*(_QWORD *)v711 != v402)
                objc_enumerationMutation(v398);
              v404 = *(void **)(*((_QWORD *)&v710 + 1) + 8 * v403);
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v650 = v403;
                v654 = objc_alloc_init(*(Class *)(v401 + 1048));
                -[NSPPrivacyProxyConfiguration addObliviousConfigs:](v639, "addObliviousConfigs:");
                objc_msgSend(v404, "objectForKeyedSubscript:", CFSTR("obliviousHTTPConfig"));
                v405 = objc_claimAutoreleasedReturnValue();
                if (v405)
                {
                  v406 = (void *)v405;
                  objc_msgSend(v404, "objectForKeyedSubscript:", CFSTR("obliviousHTTPConfig"));
                  v407 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_opt_class();
                  v408 = objc_opt_isKindOfClass();

                  if ((v408 & 1) != 0)
                  {
                    objc_msgSend(v404, "objectForKeyedSubscript:", CFSTR("obliviousHTTPConfig"));
                    v409 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v654, "setObliviousHTTPConfig:", v409);

                  }
                }
                objc_msgSend(v404, "objectForKeyedSubscript:", CFSTR("obliviousHTTPType"));
                v410 = objc_claimAutoreleasedReturnValue();
                if (v410)
                {
                  v411 = (void *)v410;
                  objc_msgSend(v404, "objectForKeyedSubscript:", CFSTR("obliviousHTTPType"));
                  v412 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_opt_class();
                  v413 = objc_opt_isKindOfClass();

                  if ((v413 & 1) != 0)
                  {
                    objc_msgSend(v404, "objectForKeyedSubscript:", CFSTR("obliviousHTTPType"));
                    v414 = (id)objc_claimAutoreleasedReturnValue();
                    if ((objc_msgSend(v414, "isEqualToString:", CFSTR("DEFAULT")) & 1) != 0)
                    {
                      v415 = 0;
                    }
                    else if ((objc_msgSend(v414, "isEqualToString:", CFSTR("CHUNKED")) & 1) != 0)
                    {
                      v415 = 1;
                    }
                    else if (objc_msgSend(v414, "isEqualToString:", CFSTR("CONTEXT")))
                    {
                      v415 = 2;
                    }
                    else
                    {
                      v415 = 0;
                    }

                    objc_msgSend(v654, "setObliviousHTTPType:", v415);
                  }
                }
                objc_msgSend(v404, "objectForKeyedSubscript:", CFSTR("transparencyKeyBundle"));
                v416 = objc_claimAutoreleasedReturnValue();
                if (v416)
                {
                  v417 = (void *)v416;
                  objc_msgSend(v404, "objectForKeyedSubscript:", CFSTR("transparencyKeyBundle"));
                  v418 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_opt_class();
                  v419 = objc_opt_isKindOfClass();

                  if ((v419 & 1) != 0)
                  {
                    objc_msgSend(v404, "objectForKeyedSubscript:", CFSTR("transparencyKeyBundle"));
                    v420 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v654, "setTransparencyKeyBundle:", v420);

                  }
                }
                objc_msgSend(v404, "objectForKeyedSubscript:", CFSTR("transparencyProof"));
                v421 = objc_claimAutoreleasedReturnValue();
                if (v421)
                {
                  v422 = (void *)v421;
                  objc_msgSend(v404, "objectForKeyedSubscript:", CFSTR("transparencyProof"));
                  v423 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_opt_class();
                  v424 = objc_opt_isKindOfClass();

                  if ((v424 & 1) != 0)
                  {
                    objc_msgSend(v404, "objectForKeyedSubscript:", CFSTR("transparencyProof"));
                    v425 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v654, "setTransparencyProof:", v425);

                  }
                }
                objc_msgSend(v404, "objectForKeyedSubscript:", CFSTR("transparencyInternalProof"));
                v426 = objc_claimAutoreleasedReturnValue();
                if (v426)
                {
                  v427 = (void *)v426;
                  objc_msgSend(v404, "objectForKeyedSubscript:", CFSTR("transparencyInternalProof"));
                  v428 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_opt_class();
                  v429 = objc_opt_isKindOfClass();

                  if ((v429 & 1) != 0)
                  {
                    objc_msgSend(v404, "objectForKeyedSubscript:", CFSTR("transparencyInternalProof"));
                    v430 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v654, "setTransparencyInternalProof:", v430);

                  }
                }
                objc_msgSend(v404, "objectForKeyedSubscript:", CFSTR("obliviousTargets"));
                v431 = objc_claimAutoreleasedReturnValue();
                if (v431)
                {
                  v432 = (void *)v431;
                  objc_msgSend(v404, "objectForKeyedSubscript:", CFSTR("obliviousTargets"));
                  v433 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_opt_class();
                  v434 = objc_opt_isKindOfClass();

                  if ((v434 & 1) != 0)
                  {
                    objc_msgSend(v404, "objectForKeyedSubscript:", CFSTR("obliviousTargets"));
                    v435 = (void *)objc_claimAutoreleasedReturnValue();
                    v706 = 0u;
                    v707 = 0u;
                    v708 = 0u;
                    v709 = 0u;
                    v666 = v435;
                    v436 = objc_msgSend(v666, "countByEnumeratingWithState:objects:count:", &v706, v788, 16);
                    if (v436)
                    {
                      v437 = v436;
                      v438 = *(_QWORD *)v707;
                      do
                      {
                        v439 = 0;
                        v660 = v437;
                        do
                        {
                          if (*(_QWORD *)v707 != v438)
                            objc_enumerationMutation(v666);
                          v440 = *(void **)(*((_QWORD *)&v706 + 1) + 8 * v439);
                          objc_opt_class();
                          if ((objc_opt_isKindOfClass() & 1) != 0)
                          {
                            v441 = objc_alloc_init(NSPPrivacyProxyObliviousTargetInfo);
                            objc_msgSend(v654, "addObliviousTargets:", v441);
                            objc_msgSend(v440, "objectForKeyedSubscript:", CFSTR("targetHost"));
                            v442 = objc_claimAutoreleasedReturnValue();
                            if (v442)
                            {
                              v443 = (void *)v442;
                              objc_msgSend(v440, "objectForKeyedSubscript:", CFSTR("targetHost"));
                              v444 = (void *)objc_claimAutoreleasedReturnValue();
                              objc_opt_class();
                              v445 = objc_opt_isKindOfClass();

                              if ((v445 & 1) != 0)
                              {
                                objc_msgSend(v440, "objectForKeyedSubscript:", CFSTR("targetHost"));
                                v446 = (void *)objc_claimAutoreleasedReturnValue();
                                -[NSPPrivacyProxyObliviousTargetInfo setTargetHost:](v441, "setTargetHost:", v446);

                              }
                            }
                            objc_msgSend(v440, "objectForKeyedSubscript:", CFSTR("proxyURLPath"));
                            v447 = objc_claimAutoreleasedReturnValue();
                            if (v447)
                            {
                              v448 = (void *)v447;
                              objc_msgSend(v440, "objectForKeyedSubscript:", CFSTR("proxyURLPath"));
                              v449 = (void *)objc_claimAutoreleasedReturnValue();
                              objc_opt_class();
                              v450 = objc_opt_isKindOfClass();

                              if ((v450 & 1) != 0)
                              {
                                objc_msgSend(v440, "objectForKeyedSubscript:", CFSTR("proxyURLPath"));
                                v451 = (void *)objc_claimAutoreleasedReturnValue();
                                -[NSPPrivacyProxyObliviousTargetInfo setProxyURLPath:](v441, "setProxyURLPath:", v451);

                              }
                            }
                            objc_msgSend(v440, "objectForKeyedSubscript:", CFSTR("proxyIndex"));
                            v452 = objc_claimAutoreleasedReturnValue();
                            if (v452)
                            {
                              v453 = (void *)v452;
                              objc_msgSend(v440, "objectForKeyedSubscript:", CFSTR("proxyIndex"));
                              v454 = (void *)objc_claimAutoreleasedReturnValue();
                              objc_opt_class();
                              v455 = objc_opt_isKindOfClass();

                              if ((v455 & 1) != 0)
                              {
                                objc_msgSend(v440, "objectForKeyedSubscript:", CFSTR("proxyIndex"));
                                v456 = (void *)objc_claimAutoreleasedReturnValue();
                                -[NSPPrivacyProxyObliviousTargetInfo setProxyIndex:](v441, "setProxyIndex:", objc_msgSend(v456, "unsignedIntValue"));

                              }
                            }
                            objc_msgSend(v440, "objectForKeyedSubscript:", CFSTR("weight"));
                            v457 = objc_claimAutoreleasedReturnValue();
                            if (v457)
                            {
                              v458 = (void *)v457;
                              objc_msgSend(v440, "objectForKeyedSubscript:", CFSTR("weight"));
                              v459 = (void *)objc_claimAutoreleasedReturnValue();
                              objc_opt_class();
                              v460 = objc_opt_isKindOfClass();

                              if ((v460 & 1) != 0)
                              {
                                objc_msgSend(v440, "objectForKeyedSubscript:", CFSTR("weight"));
                                v461 = (void *)objc_claimAutoreleasedReturnValue();
                                -[NSPPrivacyProxyObliviousTargetInfo setWeight:](v441, "setWeight:", objc_msgSend(v461, "unsignedIntValue"));

                              }
                            }
                            objc_msgSend(v440, "objectForKeyedSubscript:", CFSTR("processes"));
                            v462 = objc_claimAutoreleasedReturnValue();
                            if (v462)
                            {
                              v463 = (void *)v462;
                              objc_msgSend(v440, "objectForKeyedSubscript:", CFSTR("processes"));
                              v464 = (void *)objc_claimAutoreleasedReturnValue();
                              objc_opt_class();
                              v465 = objc_opt_isKindOfClass();

                              if ((v465 & 1) != 0)
                              {
                                objc_msgSend(v440, "objectForKeyedSubscript:", CFSTR("processes"));
                                v466 = (void *)objc_claimAutoreleasedReturnValue();
                                v702 = 0u;
                                v703 = 0u;
                                v704 = 0u;
                                v705 = 0u;
                                v467 = v466;
                                v468 = objc_msgSend(v467, "countByEnumeratingWithState:objects:count:", &v702, v787, 16);
                                if (v468)
                                {
                                  v469 = v468;
                                  v470 = *(_QWORD *)v703;
                                  do
                                  {
                                    for (i2 = 0; i2 != v469; ++i2)
                                    {
                                      if (*(_QWORD *)v703 != v470)
                                        objc_enumerationMutation(v467);
                                      v472 = *(_QWORD *)(*((_QWORD *)&v702 + 1) + 8 * i2);
                                      objc_opt_class();
                                      if ((objc_opt_isKindOfClass() & 1) != 0)
                                        -[NSPPrivacyProxyObliviousTargetInfo addProcesses:](v441, "addProcesses:", v472);
                                    }
                                    v469 = objc_msgSend(v467, "countByEnumeratingWithState:objects:count:", &v702, v787, 16);
                                  }
                                  while (v469);
                                }

                              }
                            }

                            v437 = v660;
                          }
                          ++v439;
                        }
                        while (v439 != v437);
                        v437 = objc_msgSend(v666, "countByEnumeratingWithState:objects:count:", &v706, v788, 16);
                      }
                      while (v437);
                    }

                    v402 = v642;
                    v398 = v644;
                    v401 = 0x1E4135000;
                  }
                }

                v400 = (uint64_t)objb;
                v403 = v650;
              }
              ++v403;
            }
            while (v403 != v400);
            v400 = objc_msgSend(v398, "countByEnumeratingWithState:objects:count:", &v710, v789, 16);
          }
          while (v400);
        }

        v8 = v635;
      }
    }
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("preferredPathEnabledPercentage"));
    v473 = objc_claimAutoreleasedReturnValue();
    if (v473)
    {
      v474 = (void *)v473;
      objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("preferredPathEnabledPercentage"));
      v475 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      v476 = objc_opt_isKindOfClass();

      if ((v476 & 1) != 0)
      {
        objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("preferredPathEnabledPercentage"));
        v477 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSPPrivacyProxyConfiguration setPreferredPathEnabledPercentage:](v639, "setPreferredPathEnabledPercentage:", objc_msgSend(v477, "unsignedIntValue"));

      }
    }
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("proxiedContentMaps"));
    v478 = objc_claimAutoreleasedReturnValue();
    if (v478)
    {
      v479 = (void *)v478;
      objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("proxiedContentMaps"));
      v480 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      v481 = objc_opt_isKindOfClass();

      if ((v481 & 1) != 0)
      {
        objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("proxiedContentMaps"));
        v482 = (void *)objc_claimAutoreleasedReturnValue();
        v698 = 0u;
        v699 = 0u;
        v700 = 0u;
        v701 = 0u;
        v667 = v482;
        v483 = objc_msgSend(v667, "countByEnumeratingWithState:objects:count:", &v698, v786, 16);
        if (v483)
        {
          v484 = v483;
          v485 = CFSTR("enabled");
          v486 = *(_QWORD *)v699;
          v655 = *(_QWORD *)v699;
          do
          {
            v487 = 0;
            v661 = v484;
            do
            {
              if (*(_QWORD *)v699 != v486)
                objc_enumerationMutation(v667);
              v488 = *(void **)(*((_QWORD *)&v698 + 1) + 8 * v487);
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v489 = objc_alloc_init(NSPPrivacyProxyProxiedContentMap);
                -[NSPPrivacyProxyConfiguration addProxiedContentMaps:](v639, "addProxiedContentMaps:", v489);
                objc_msgSend(v488, "objectForKeyedSubscript:", v485);
                v490 = objc_claimAutoreleasedReturnValue();
                v491 = v485;
                if (v490)
                {
                  v492 = (void *)v490;
                  objc_msgSend(v488, "objectForKeyedSubscript:", v485);
                  v493 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_opt_class();
                  v494 = objc_opt_isKindOfClass();

                  if ((v494 & 1) != 0)
                  {
                    objc_msgSend(v488, "objectForKeyedSubscript:", v485);
                    v495 = (void *)objc_claimAutoreleasedReturnValue();
                    -[NSPPrivacyProxyProxiedContentMap setEnabled:](v489, "setEnabled:", objc_msgSend(v495, "BOOLValue"));

                  }
                }
                objc_msgSend(v488, "objectForKeyedSubscript:", CFSTR("systemProcessOnly"));
                v496 = objc_claimAutoreleasedReturnValue();
                if (v496)
                {
                  v497 = (void *)v496;
                  objc_msgSend(v488, "objectForKeyedSubscript:", CFSTR("systemProcessOnly"));
                  v498 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_opt_class();
                  v499 = objc_opt_isKindOfClass();

                  if ((v499 & 1) != 0)
                  {
                    objc_msgSend(v488, "objectForKeyedSubscript:", CFSTR("systemProcessOnly"));
                    v500 = (void *)objc_claimAutoreleasedReturnValue();
                    -[NSPPrivacyProxyProxiedContentMap setSystemProcessOnly:](v489, "setSystemProcessOnly:", objc_msgSend(v500, "BOOLValue"));

                  }
                }
                objc_msgSend(v488, "objectForKeyedSubscript:", CFSTR("supportsReverseProxying"));
                v501 = objc_claimAutoreleasedReturnValue();
                if (v501)
                {
                  v502 = (void *)v501;
                  objc_msgSend(v488, "objectForKeyedSubscript:", CFSTR("supportsReverseProxying"));
                  v503 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_opt_class();
                  v504 = objc_opt_isKindOfClass();

                  if ((v504 & 1) != 0)
                  {
                    objc_msgSend(v488, "objectForKeyedSubscript:", CFSTR("supportsReverseProxying"));
                    v505 = (void *)objc_claimAutoreleasedReturnValue();
                    -[NSPPrivacyProxyProxiedContentMap setSupportsReverseProxying:](v489, "setSupportsReverseProxying:", objc_msgSend(v505, "BOOLValue"));

                  }
                }
                objc_msgSend(v488, "objectForKeyedSubscript:", CFSTR("percentEnabled"));
                v506 = objc_claimAutoreleasedReturnValue();
                if (v506)
                {
                  v507 = (void *)v506;
                  objc_msgSend(v488, "objectForKeyedSubscript:", CFSTR("percentEnabled"));
                  v508 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_opt_class();
                  v509 = objc_opt_isKindOfClass();

                  if ((v509 & 1) != 0)
                  {
                    objc_msgSend(v488, "objectForKeyedSubscript:", CFSTR("percentEnabled"));
                    v510 = (void *)objc_claimAutoreleasedReturnValue();
                    -[NSPPrivacyProxyProxiedContentMap setPercentEnabled:](v489, "setPercentEnabled:", objc_msgSend(v510, "unsignedIntValue"));

                  }
                }
                objc_msgSend(v488, "objectForKeyedSubscript:", CFSTR("resolver"));
                v511 = objc_claimAutoreleasedReturnValue();
                if (v511)
                {
                  v512 = (void *)v511;
                  objc_msgSend(v488, "objectForKeyedSubscript:", CFSTR("resolver"));
                  v513 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_opt_class();
                  v514 = objc_opt_isKindOfClass();

                  if ((v514 & 1) != 0)
                  {
                    objc_msgSend(v488, "objectForKeyedSubscript:", CFSTR("resolver"));
                    v515 = (void *)objc_claimAutoreleasedReturnValue();
                    -[NSPPrivacyProxyProxiedContentMap setResolver:](v489, "setResolver:", objc_msgSend(v515, "unsignedIntValue"));

                  }
                }
                objc_msgSend(v488, "objectForKeyedSubscript:", CFSTR("identifier"));
                v516 = objc_claimAutoreleasedReturnValue();
                if (v516)
                {
                  v517 = (void *)v516;
                  objc_msgSend(v488, "objectForKeyedSubscript:", CFSTR("identifier"));
                  v518 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_opt_class();
                  v519 = objc_opt_isKindOfClass();

                  if ((v519 & 1) != 0)
                  {
                    objc_msgSend(v488, "objectForKeyedSubscript:", CFSTR("identifier"));
                    v520 = (void *)objc_claimAutoreleasedReturnValue();
                    -[NSPPrivacyProxyProxiedContentMap setIdentifier:](v489, "setIdentifier:", v520);

                  }
                }
                objc_msgSend(v488, "objectForKeyedSubscript:", CFSTR("proxies"));
                v521 = objc_claimAutoreleasedReturnValue();
                if (v521)
                {
                  v522 = (void *)v521;
                  objc_msgSend(v488, "objectForKeyedSubscript:", CFSTR("proxies"));
                  v523 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_opt_class();
                  v524 = objc_opt_isKindOfClass();

                  if ((v524 & 1) != 0)
                  {
                    objc_msgSend(v488, "objectForKeyedSubscript:", CFSTR("proxies"));
                    v525 = (void *)objc_claimAutoreleasedReturnValue();
                    v694 = 0u;
                    v695 = 0u;
                    v696 = 0u;
                    v697 = 0u;
                    v526 = v525;
                    v527 = objc_msgSend(v526, "countByEnumeratingWithState:objects:count:", &v694, v785, 16);
                    if (v527)
                    {
                      v528 = v527;
                      v529 = *(_QWORD *)v695;
                      do
                      {
                        for (i3 = 0; i3 != v528; ++i3)
                        {
                          if (*(_QWORD *)v695 != v529)
                            objc_enumerationMutation(v526);
                          v531 = *(void **)(*((_QWORD *)&v694 + 1) + 8 * i3);
                          objc_opt_class();
                          if ((objc_opt_isKindOfClass() & 1) != 0)
                            -[NSPPrivacyProxyProxiedContentMap addProxies:](v489, "addProxies:", objc_msgSend(v531, "unsignedIntValue"));
                        }
                        v528 = objc_msgSend(v526, "countByEnumeratingWithState:objects:count:", &v694, v785, 16);
                      }
                      while (v528);
                    }

                  }
                }
                objc_msgSend(v488, "objectForKeyedSubscript:", CFSTR("hostnames"));
                v532 = objc_claimAutoreleasedReturnValue();
                if (v532)
                {
                  v533 = (void *)v532;
                  objc_msgSend(v488, "objectForKeyedSubscript:", CFSTR("hostnames"));
                  v534 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_opt_class();
                  v535 = objc_opt_isKindOfClass();

                  if ((v535 & 1) != 0)
                  {
                    objc_msgSend(v488, "objectForKeyedSubscript:", CFSTR("hostnames"));
                    v536 = (void *)objc_claimAutoreleasedReturnValue();
                    v690 = 0u;
                    v691 = 0u;
                    v692 = 0u;
                    v693 = 0u;
                    v537 = v536;
                    v538 = objc_msgSend(v537, "countByEnumeratingWithState:objects:count:", &v690, v784, 16);
                    if (v538)
                    {
                      v539 = v538;
                      v540 = *(_QWORD *)v691;
                      do
                      {
                        for (i4 = 0; i4 != v539; ++i4)
                        {
                          if (*(_QWORD *)v691 != v540)
                            objc_enumerationMutation(v537);
                          v542 = *(_QWORD *)(*((_QWORD *)&v690 + 1) + 8 * i4);
                          objc_opt_class();
                          if ((objc_opt_isKindOfClass() & 1) != 0)
                            -[NSPPrivacyProxyProxiedContentMap addHostnames:](v489, "addHostnames:", v542);
                        }
                        v539 = objc_msgSend(v537, "countByEnumeratingWithState:objects:count:", &v690, v784, 16);
                      }
                      while (v539);
                    }

                  }
                }
                objc_msgSend(v488, "objectForKeyedSubscript:", CFSTR("processes"));
                v543 = objc_claimAutoreleasedReturnValue();
                if (v543)
                {
                  v544 = (void *)v543;
                  objc_msgSend(v488, "objectForKeyedSubscript:", CFSTR("processes"));
                  v545 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_opt_class();
                  v546 = objc_opt_isKindOfClass();

                  if ((v546 & 1) != 0)
                  {
                    objc_msgSend(v488, "objectForKeyedSubscript:", CFSTR("processes"));
                    v547 = (void *)objc_claimAutoreleasedReturnValue();
                    v686 = 0u;
                    v687 = 0u;
                    v688 = 0u;
                    v689 = 0u;
                    v548 = v547;
                    v549 = objc_msgSend(v548, "countByEnumeratingWithState:objects:count:", &v686, v783, 16);
                    if (v549)
                    {
                      v550 = v549;
                      v551 = *(_QWORD *)v687;
                      do
                      {
                        for (i5 = 0; i5 != v550; ++i5)
                        {
                          if (*(_QWORD *)v687 != v551)
                            objc_enumerationMutation(v548);
                          v553 = *(_QWORD *)(*((_QWORD *)&v686 + 1) + 8 * i5);
                          objc_opt_class();
                          if ((objc_opt_isKindOfClass() & 1) != 0)
                            -[NSPPrivacyProxyProxiedContentMap addProcesses:](v489, "addProcesses:", v553);
                        }
                        v550 = objc_msgSend(v548, "countByEnumeratingWithState:objects:count:", &v686, v783, 16);
                      }
                      while (v550);
                    }

                  }
                }
                objc_msgSend(v488, "objectForKeyedSubscript:", CFSTR("urls"));
                v554 = objc_claimAutoreleasedReturnValue();
                if (v554)
                {
                  v555 = (void *)v554;
                  objc_msgSend(v488, "objectForKeyedSubscript:", CFSTR("urls"));
                  v556 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_opt_class();
                  v557 = objc_opt_isKindOfClass();

                  if ((v557 & 1) != 0)
                  {
                    objc_msgSend(v488, "objectForKeyedSubscript:", CFSTR("urls"));
                    v558 = (void *)objc_claimAutoreleasedReturnValue();
                    v682 = 0u;
                    v683 = 0u;
                    v684 = 0u;
                    v685 = 0u;
                    v559 = v558;
                    v560 = objc_msgSend(v559, "countByEnumeratingWithState:objects:count:", &v682, v782, 16);
                    if (v560)
                    {
                      v561 = v560;
                      v562 = *(_QWORD *)v683;
                      do
                      {
                        for (i6 = 0; i6 != v561; ++i6)
                        {
                          if (*(_QWORD *)v683 != v562)
                            objc_enumerationMutation(v559);
                          v564 = *(_QWORD *)(*((_QWORD *)&v682 + 1) + 8 * i6);
                          objc_opt_class();
                          if ((objc_opt_isKindOfClass() & 1) != 0)
                            -[NSPPrivacyProxyProxiedContentMap addUrls:](v489, "addUrls:", v564);
                        }
                        v561 = objc_msgSend(v559, "countByEnumeratingWithState:objects:count:", &v682, v782, 16);
                      }
                      while (v561);
                    }

                  }
                }
                objc_msgSend(v488, "objectForKeyedSubscript:", CFSTR("matchExactHostnames"));
                v565 = objc_claimAutoreleasedReturnValue();
                if (v565)
                {
                  v566 = (void *)v565;
                  objc_msgSend(v488, "objectForKeyedSubscript:", CFSTR("matchExactHostnames"));
                  v567 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_opt_class();
                  v568 = objc_opt_isKindOfClass();

                  if ((v568 & 1) != 0)
                  {
                    objc_msgSend(v488, "objectForKeyedSubscript:", CFSTR("matchExactHostnames"));
                    v569 = (void *)objc_claimAutoreleasedReturnValue();
                    -[NSPPrivacyProxyProxiedContentMap setMatchExactHostnames:](v489, "setMatchExactHostnames:", objc_msgSend(v569, "BOOLValue"));

                  }
                }
                objc_msgSend(v488, "objectForKeyedSubscript:", CFSTR("isPrivacyProxy"));
                v570 = objc_claimAutoreleasedReturnValue();
                if (v570)
                {
                  v571 = (void *)v570;
                  objc_msgSend(v488, "objectForKeyedSubscript:", CFSTR("isPrivacyProxy"));
                  v572 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_opt_class();
                  v573 = objc_opt_isKindOfClass();

                  if ((v573 & 1) != 0)
                  {
                    objc_msgSend(v488, "objectForKeyedSubscript:", CFSTR("isPrivacyProxy"));
                    v574 = (void *)objc_claimAutoreleasedReturnValue();
                    -[NSPPrivacyProxyProxiedContentMap setIsPrivacyProxy:](v489, "setIsPrivacyProxy:", objc_msgSend(v574, "BOOLValue"));

                  }
                }

                v485 = v491;
                v486 = v655;
                v484 = v661;
              }
              ++v487;
            }
            while (v487 != v484);
            v484 = objc_msgSend(v667, "countByEnumeratingWithState:objects:count:", &v698, v786, 16);
          }
          while (v484);
        }

        v8 = v635;
      }
    }
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("maxTokenNum"));
    v575 = objc_claimAutoreleasedReturnValue();
    if (v575)
    {
      v576 = (void *)v575;
      objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("maxTokenNum"));
      v577 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      v578 = objc_opt_isKindOfClass();

      if ((v578 & 1) != 0)
      {
        objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("maxTokenNum"));
        v579 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSPPrivacyProxyConfiguration setMaxTokenNum:](v639, "setMaxTokenNum:", objc_msgSend(v579, "unsignedIntValue"));

      }
    }
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("regionId"));
    v580 = objc_claimAutoreleasedReturnValue();
    if (v580)
    {
      v581 = (void *)v580;
      objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("regionId"));
      v582 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      v583 = objc_opt_isKindOfClass();

      if ((v583 & 1) != 0)
      {
        objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("regionId"));
        v584 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSPPrivacyProxyConfiguration setRegionId:](v639, "setRegionId:", v584);

      }
    }
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("fallbackPathWeights"));
    v585 = objc_claimAutoreleasedReturnValue();
    if (v585)
    {
      v586 = (void *)v585;
      objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("fallbackPathWeights"));
      v587 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      v588 = objc_opt_isKindOfClass();

      if ((v588 & 1) != 0)
      {
        objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("fallbackPathWeights"));
        v589 = (void *)objc_claimAutoreleasedReturnValue();
        v678 = 0u;
        v679 = 0u;
        v680 = 0u;
        v681 = 0u;
        v590 = v589;
        v591 = objc_msgSend(v590, "countByEnumeratingWithState:objects:count:", &v678, v781, 16);
        if (v591)
        {
          v592 = v591;
          v593 = *(_QWORD *)v679;
          do
          {
            for (i7 = 0; i7 != v592; ++i7)
            {
              if (*(_QWORD *)v679 != v593)
                objc_enumerationMutation(v590);
              v595 = *(void **)(*((_QWORD *)&v678 + 1) + 8 * i7);
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v596 = objc_alloc_init(NSPPrivacyProxyProxyPathWeight);
                -[NSPPrivacyProxyConfiguration addFallbackPathWeights:](v639, "addFallbackPathWeights:", v596);
                objc_msgSend(v595, "objectForKeyedSubscript:", CFSTR("weight"));
                v597 = objc_claimAutoreleasedReturnValue();
                if (v597)
                {
                  v598 = (void *)v597;
                  objc_msgSend(v595, "objectForKeyedSubscript:", CFSTR("weight"));
                  v599 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_opt_class();
                  v600 = objc_opt_isKindOfClass();

                  if ((v600 & 1) != 0)
                  {
                    objc_msgSend(v595, "objectForKeyedSubscript:", CFSTR("weight"));
                    v601 = (void *)objc_claimAutoreleasedReturnValue();
                    -[NSPPrivacyProxyProxyPathWeight setWeight:](v596, "setWeight:", objc_msgSend(v601, "unsignedIntValue"));

                  }
                }
                objc_msgSend(v595, "objectForKeyedSubscript:", CFSTR("proxies"));
                v602 = objc_claimAutoreleasedReturnValue();
                if (v602)
                {
                  v603 = (void *)v602;
                  objc_msgSend(v595, "objectForKeyedSubscript:", CFSTR("proxies"));
                  v604 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_opt_class();
                  v605 = objc_opt_isKindOfClass();

                  if ((v605 & 1) != 0)
                  {
                    objc_msgSend(v595, "objectForKeyedSubscript:", CFSTR("proxies"));
                    v606 = (void *)objc_claimAutoreleasedReturnValue();
                    v674 = 0u;
                    v675 = 0u;
                    v676 = 0u;
                    v677 = 0u;
                    v607 = v606;
                    v608 = objc_msgSend(v607, "countByEnumeratingWithState:objects:count:", &v674, v780, 16);
                    if (v608)
                    {
                      v609 = v608;
                      v610 = *(_QWORD *)v675;
                      do
                      {
                        for (i8 = 0; i8 != v609; ++i8)
                        {
                          if (*(_QWORD *)v675 != v610)
                            objc_enumerationMutation(v607);
                          -[NSPPrivacyProxyProxyPathWeight addProxies:](v596, "addProxies:", objc_msgSend(*(id *)(*((_QWORD *)&v674 + 1) + 8 * i8), "unsignedIntValue"));
                        }
                        v609 = objc_msgSend(v607, "countByEnumeratingWithState:objects:count:", &v674, v780, 16);
                      }
                      while (v609);
                    }

                  }
                }

              }
            }
            v592 = objc_msgSend(v590, "countByEnumeratingWithState:objects:count:", &v678, v781, 16);
          }
          while (v592);
        }

        v8 = v635;
      }
    }
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("trustedNetworkDiscoveredProxies"));
    v612 = objc_claimAutoreleasedReturnValue();
    if (v612)
    {
      v613 = (void *)v612;
      objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("trustedNetworkDiscoveredProxies"));
      v614 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      v615 = objc_opt_isKindOfClass();

      if ((v615 & 1) != 0)
      {
        objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("trustedNetworkDiscoveredProxies"));
        v670 = 0u;
        v671 = 0u;
        v672 = 0u;
        v673 = 0u;
        v616 = (id)objc_claimAutoreleasedReturnValue();
        v617 = objc_msgSend(v616, "countByEnumeratingWithState:objects:count:", &v670, v779, 16);
        if (v617)
        {
          v618 = v617;
          v619 = *(_QWORD *)v671;
          do
          {
            for (i9 = 0; i9 != v618; ++i9)
            {
              if (*(_QWORD *)v671 != v619)
                objc_enumerationMutation(v616);
              -[NSPPrivacyProxyConfiguration addTrustedNetworkDiscoveredProxies:](v639, "addTrustedNetworkDiscoveredProxies:", *(_QWORD *)(*((_QWORD *)&v670 + 1) + 8 * i9));
            }
            v618 = objc_msgSend(v616, "countByEnumeratingWithState:objects:count:", &v670, v779, 16);
          }
          while (v618);
        }

      }
    }
    -[NSPPrivacyProxyConfiguration data](v639, "data");
    v621 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSPServerClient getConnection]((uint64_t)selfa);
    v622 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
    if (v622)
    {
      v623 = xpc_dictionary_create(0, 0, 0);
      xpc_dictionary_set_int64(v623, "NSPServerCommandType", 16);
      if (v621)
      {
        v625 = v623;
        v626 = (void *)_CFXPCCreateXPCObjectFromCFObject();
        xpc_dictionary_set_value(v625, "NSPServerConfiguration", v626);

      }
      Property = selfa;
      if (selfa)
        Property = objc_getProperty(selfa, v624, 16, 1);
      v628 = Property;
      handler[0] = MEMORY[0x1E0C809B0];
      handler[1] = 3221225472;
      handler[2] = __66__NSPServerClient_setPrivacyProxyConfiguration_completionHandler___block_invoke;
      handler[3] = &unk_1E41377F0;
      v669 = v631;
      xpc_connection_send_message_with_reply(v622, v623, v628, handler);

      v9 = v631;
    }
    else
    {
      nplog_obj();
      v629 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v629, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_19E8FE000, v629, OS_LOG_TYPE_ERROR, "Failed to get XPC connection", buf, 2u);
      }

      v9 = v631;
      ((void (**)(_QWORD, const __CFString *))v631)[2](v631, CFSTR("IPC failed"));
    }

  }
  else
  {
    nplog_obj();
    v77 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v77, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_19E8FE000, v77, OS_LOG_TYPE_ERROR, "Failed to set the NSP configuration: configuration parameter is invalid", buf, 2u);
    }

    (*((void (**)(id, const __CFString *))v9 + 2))(v9, CFSTR("invalid config dictionary"));
  }

}

void __66__NSPServerClient_setPrivacyProxyConfiguration_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  char *string;
  uint64_t v4;
  xpc_object_t xdict;

  xdict = a2;
  if (xdict && MEMORY[0x1A1AEADA0]() == MEMORY[0x1E0C812F8])
  {
    string = (char *)xpc_dictionary_get_string(xdict, "NSPServerErrorString");
    if (string)
      string = (char *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithUTF8String:", string);
  }
  else
  {
    string = 0;
  }
  v4 = *(_QWORD *)(a1 + 32);
  if (v4)
    (*(void (**)(uint64_t, char *))(v4 + 16))(v4, string);

}

- (void)convertPrivacyProxyConfigurationWithCompletionHandler:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  _xpc_connection_s *v9;
  xpc_object_t v10;
  const char *v11;
  id v12;
  void *v13;
  NSObject *v14;
  id v15;
  void *v16;
  _QWORD handler[4];
  id v18;
  uint8_t buf[8];
  uint64_t v20;
  _QWORD v21[2];

  v21[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  nplog_obj();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_debug_impl(&dword_19E8FE000, v8, OS_LOG_TYPE_DEBUG, "converting privacy proxy configuration data into dictionary", buf, 2u);
  }

  -[NSPServerClient getConnection]((uint64_t)self);
  v9 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    v10 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_int64(v10, "NSPServerCommandType", 30);
    if (v6)
    {
      v12 = v10;
      v13 = (void *)_CFXPCCreateXPCObjectFromCFObject();
      xpc_dictionary_set_value(v12, "NSPServerConfiguration", v13);

    }
    if (self)
      self = (NSPServerClient *)objc_getProperty(self, v11, 16, 1);
    handler[0] = MEMORY[0x1E0C809B0];
    handler[1] = 3221225472;
    handler[2] = __91__NSPServerClient_convertPrivacyProxyConfigurationWithCompletionHandler_completionHandler___block_invoke;
    handler[3] = &unk_1E41377F0;
    v18 = v7;
    xpc_connection_send_message_with_reply(v9, v10, &self->super, handler);

  }
  else
  {
    nplog_obj();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_19E8FE000, v14, OS_LOG_TYPE_ERROR, "Failed to get XPC connection", buf, 2u);
    }

    v15 = objc_alloc(MEMORY[0x1E0CB35C8]);
    v20 = *MEMORY[0x1E0CB2D68];
    v21[0] = CFSTR("IPC failed");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v21, &v20, 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (xpc_object_t)objc_msgSend(v15, "initWithDomain:code:userInfo:", CFSTR("privacyProxyErrorDomain"), 1002, v16);

    (*((void (**)(id, _QWORD, xpc_object_t))v7 + 2))(v7, 0, v10);
  }

}

void __91__NSPServerClient_convertPrivacyProxyConfigurationWithCompletionHandler_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  BOOL v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;

  v3 = a2;
  if (v3)
  {
    v8 = v3;
    v4 = MEMORY[0x1A1AEADA0]() == MEMORY[0x1E0C812F8];
    v3 = v8;
    if (v4)
    {
      get_nsdictionary_from_xpc_object(v8, "NSPServerPrivacyProxyConfigDictionary");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      +[NSPServerClient getErrorFromDict:]((uint64_t)NSPServerClient, v8);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = *(_QWORD *)(a1 + 32);
      if (v7)
        (*(void (**)(uint64_t, void *, void *))(v7 + 16))(v7, v5, v6);

      v3 = v8;
    }
  }

}

- (void)overrideProxiedContentMap:(id)a3 enabled:(BOOL)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  NSObject *v10;
  _xpc_connection_s *v11;
  xpc_object_t v12;
  id v13;
  id v14;
  const char *v15;
  NSObject *v16;
  id v17;
  void *v18;
  _QWORD handler[4];
  id v20;
  uint8_t buf[8];
  uint64_t v22;
  _QWORD v23[2];

  v23[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  nplog_obj();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_debug_impl(&dword_19E8FE000, v10, OS_LOG_TYPE_DEBUG, "override proxied content map enabled called", buf, 2u);
  }

  -[NSPServerClient getConnection]((uint64_t)self);
  v11 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    v12 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_int64(v12, "NSPServerCommandType", 61);
    if (v8)
    {
      v13 = v12;
      v14 = v8;
      xpc_dictionary_set_string(v13, "NSPServerProxiedContentMapIdentifier", (const char *)objc_msgSend(v14, "UTF8String"));

    }
    xpc_dictionary_set_BOOL(v12, "NSPServerProxiedContentMapEnabled", a4);
    if (self)
      self = (NSPServerClient *)objc_getProperty(self, v15, 16, 1);
    handler[0] = MEMORY[0x1E0C809B0];
    handler[1] = 3221225472;
    handler[2] = __71__NSPServerClient_overrideProxiedContentMap_enabled_completionHandler___block_invoke;
    handler[3] = &unk_1E41377F0;
    v20 = v9;
    xpc_connection_send_message_with_reply(v11, v12, &self->super, handler);

  }
  else
  {
    nplog_obj();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_19E8FE000, v16, OS_LOG_TYPE_ERROR, "Failed to get XPC connection", buf, 2u);
    }

    v17 = objc_alloc(MEMORY[0x1E0CB35C8]);
    v22 = *MEMORY[0x1E0CB2D68];
    v23[0] = CFSTR("IPC failed");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v23, &v22, 1);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (xpc_object_t)objc_msgSend(v17, "initWithDomain:code:userInfo:", CFSTR("privacyProxyErrorDomain"), 1002, v18);

    (*((void (**)(id, xpc_object_t))v9 + 2))(v9, v12);
  }

}

void __71__NSPServerClient_overrideProxiedContentMap_enabled_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  void *v5;

  +[NSPServerClient getErrorFromDict:]((uint64_t)NSPServerClient, a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(a1 + 32);
  if (v4)
  {
    v5 = v3;
    (*(void (**)(void))(v4 + 16))();
    v3 = v5;
  }

}

- (void)getOverrideProxiedContentMapEnabled:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  _xpc_connection_s *v9;
  xpc_object_t v10;
  const char *v11;
  id v12;
  id v13;
  NSObject *v14;
  id v15;
  void *v16;
  _QWORD handler[4];
  id v18;
  uint8_t buf[8];
  uint64_t v20;
  _QWORD v21[2];

  v21[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  nplog_obj();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_debug_impl(&dword_19E8FE000, v8, OS_LOG_TYPE_DEBUG, "get override proxied content map enabled called", buf, 2u);
  }

  -[NSPServerClient getConnection]((uint64_t)self);
  v9 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    v10 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_int64(v10, "NSPServerCommandType", 62);
    if (v6)
    {
      v12 = v10;
      v13 = v6;
      xpc_dictionary_set_string(v12, "NSPServerProxiedContentMapIdentifier", (const char *)objc_msgSend(v13, "UTF8String"));

    }
    if (self)
      self = (NSPServerClient *)objc_getProperty(self, v11, 16, 1);
    handler[0] = MEMORY[0x1E0C809B0];
    handler[1] = 3221225472;
    handler[2] = __73__NSPServerClient_getOverrideProxiedContentMapEnabled_completionHandler___block_invoke;
    handler[3] = &unk_1E41377F0;
    v18 = v7;
    xpc_connection_send_message_with_reply(v9, v10, &self->super, handler);

  }
  else
  {
    nplog_obj();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_19E8FE000, v14, OS_LOG_TYPE_ERROR, "Failed to get XPC connection", buf, 2u);
    }

    v15 = objc_alloc(MEMORY[0x1E0CB35C8]);
    v20 = *MEMORY[0x1E0CB2D68];
    v21[0] = CFSTR("IPC failed");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v21, &v20, 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (xpc_object_t)objc_msgSend(v15, "initWithDomain:code:userInfo:", CFSTR("privacyProxyErrorDomain"), 1002, v16);

    (*((void (**)(id, _QWORD, xpc_object_t))v7 + 2))(v7, 0, v10);
  }

}

void __73__NSPServerClient_getOverrideProxiedContentMapEnabled_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  _BOOL8 v4;
  uint64_t v5;
  id v6;

  v3 = a2;
  v4 = xpc_dictionary_get_BOOL(v3, "NSPServerProxiedContentMapEnabled");
  +[NSPServerClient getErrorFromDict:]((uint64_t)NSPServerClient, v3);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
    (*(void (**)(uint64_t, _BOOL8, id))(v5 + 16))(v5, v4, v6);

}

- (void)setProxiedContentMapDoHBootstrapEnabled:(BOOL)a3 completionHandler:(id)a4
{
  _BOOL4 v4;
  id v6;
  NSObject *v7;
  _xpc_connection_s *v8;
  xpc_object_t v9;
  const char *v10;
  NSObject *v11;
  id v12;
  void *v13;
  _QWORD handler[4];
  id v15;
  uint64_t v16;
  const __CFString *v17;
  uint8_t buf[4];
  _BOOL4 v19;
  uint64_t v20;

  v4 = a3;
  v20 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  nplog_obj();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 67109120;
    v19 = v4;
    _os_log_debug_impl(&dword_19E8FE000, v7, OS_LOG_TYPE_DEBUG, "Set proxied content map DoH bootstrap enabled to %u", buf, 8u);
  }

  -[NSPServerClient getConnection]((uint64_t)self);
  v8 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_int64(v9, "NSPServerCommandType", 65);
    xpc_dictionary_set_BOOL(v9, "NSPServerPrivacyProxyEnabled", v4);
    if (self)
      self = (NSPServerClient *)objc_getProperty(self, v10, 16, 1);
    handler[0] = MEMORY[0x1E0C809B0];
    handler[1] = 3221225472;
    handler[2] = __77__NSPServerClient_setProxiedContentMapDoHBootstrapEnabled_completionHandler___block_invoke;
    handler[3] = &unk_1E41377F0;
    v15 = v6;
    xpc_connection_send_message_with_reply(v8, v9, &self->super, handler);

  }
  else
  {
    nplog_obj();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_19E8FE000, v11, OS_LOG_TYPE_ERROR, "Failed to get XPC connection", buf, 2u);
    }

    v12 = objc_alloc(MEMORY[0x1E0CB35C8]);
    v16 = *MEMORY[0x1E0CB2D68];
    v17 = CFSTR("IPC failed");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v17, &v16, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (xpc_object_t)objc_msgSend(v12, "initWithDomain:code:userInfo:", CFSTR("privacyProxyErrorDomain"), 1002, v13);

    (*((void (**)(id, xpc_object_t))v6 + 2))(v6, v9);
  }

}

void __77__NSPServerClient_setProxiedContentMapDoHBootstrapEnabled_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  void *v5;

  +[NSPServerClient getErrorFromDict:]((uint64_t)NSPServerClient, a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(a1 + 32);
  if (v4)
  {
    v5 = v3;
    (*(void (**)(void))(v4 + 16))();
    v3 = v5;
  }

}

- (void)overridePreferredProxy:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  _xpc_connection_s *v9;
  xpc_object_t v10;
  const char *v11;
  id v12;
  id v13;
  NSObject *v14;
  id v15;
  void *v16;
  _QWORD handler[4];
  id v18;
  uint8_t buf[8];
  uint64_t v20;
  _QWORD v21[2];

  v21[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  nplog_obj();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_debug_impl(&dword_19E8FE000, v8, OS_LOG_TYPE_DEBUG, "override preferred proxy called", buf, 2u);
  }

  -[NSPServerClient getConnection]((uint64_t)self);
  v9 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    v10 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_int64(v10, "NSPServerCommandType", 37);
    if (v6)
    {
      v12 = v10;
      v13 = v6;
      xpc_dictionary_set_string(v12, "NSPServerPrivacyProxyURL", (const char *)objc_msgSend(v13, "UTF8String"));

    }
    if (self)
      self = (NSPServerClient *)objc_getProperty(self, v11, 16, 1);
    handler[0] = MEMORY[0x1E0C809B0];
    handler[1] = 3221225472;
    handler[2] = __60__NSPServerClient_overridePreferredProxy_completionHandler___block_invoke;
    handler[3] = &unk_1E41377F0;
    v18 = v7;
    xpc_connection_send_message_with_reply(v9, v10, &self->super, handler);

  }
  else
  {
    nplog_obj();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_19E8FE000, v14, OS_LOG_TYPE_ERROR, "Failed to get XPC connection", buf, 2u);
    }

    v15 = objc_alloc(MEMORY[0x1E0CB35C8]);
    v20 = *MEMORY[0x1E0CB2D68];
    v21[0] = CFSTR("IPC failed");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v21, &v20, 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (xpc_object_t)objc_msgSend(v15, "initWithDomain:code:userInfo:", CFSTR("privacyProxyErrorDomain"), 1002, v16);

    (*((void (**)(id, xpc_object_t))v7 + 2))(v7, v10);
  }

}

void __60__NSPServerClient_overridePreferredProxy_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  void *v5;

  +[NSPServerClient getErrorFromDict:]((uint64_t)NSPServerClient, a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(a1 + 32);
  if (v4)
  {
    v5 = v3;
    (*(void (**)(void))(v4 + 16))();
    v3 = v5;
  }

}

- (void)getPreferredProxyWithCompletionHandler:(id)a3
{
  id v4;
  NSObject *v5;
  _xpc_connection_s *v6;
  xpc_object_t v7;
  const char *v8;
  NSObject *v9;
  id v10;
  void *v11;
  _QWORD handler[4];
  id v13;
  uint8_t buf[8];
  uint64_t v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  nplog_obj();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_debug_impl(&dword_19E8FE000, v5, OS_LOG_TYPE_DEBUG, "get preferred proxy called", buf, 2u);
  }

  -[NSPServerClient getConnection]((uint64_t)self);
  v6 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v7 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_int64(v7, "NSPServerCommandType", 38);
    if (self)
      self = (NSPServerClient *)objc_getProperty(self, v8, 16, 1);
    handler[0] = MEMORY[0x1E0C809B0];
    handler[1] = 3221225472;
    handler[2] = __58__NSPServerClient_getPreferredProxyWithCompletionHandler___block_invoke;
    handler[3] = &unk_1E41377F0;
    v13 = v4;
    xpc_connection_send_message_with_reply(v6, v7, &self->super, handler);

  }
  else
  {
    nplog_obj();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_19E8FE000, v9, OS_LOG_TYPE_ERROR, "Failed to get XPC connection", buf, 2u);
    }

    v10 = objc_alloc(MEMORY[0x1E0CB35C8]);
    v15 = *MEMORY[0x1E0CB2D68];
    v16[0] = CFSTR("IPC failed");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, &v15, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (xpc_object_t)objc_msgSend(v10, "initWithDomain:code:userInfo:", CFSTR("privacyProxyErrorDomain"), 1002, v11);

    (*((void (**)(id, _QWORD, xpc_object_t))v4 + 2))(v4, 0, v7);
  }

}

void __58__NSPServerClient_getPreferredProxyWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  char *string;
  void *v4;
  uint64_t v5;
  id v6;

  v6 = a2;
  string = (char *)xpc_dictionary_get_string(v6, "NSPServerPrivacyProxyURL");
  if (string)
    string = (char *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithUTF8String:", string);
  +[NSPServerClient getErrorFromDict:]((uint64_t)NSPServerClient, v6);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
    (*(void (**)(uint64_t, char *, void *))(v5 + 16))(v5, string, v4);

}

- (void)overridePreferredResolver:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  _xpc_connection_s *v9;
  xpc_object_t v10;
  const char *v11;
  id v12;
  id v13;
  NSObject *v14;
  id v15;
  void *v16;
  _QWORD handler[4];
  id v18;
  uint8_t buf[8];
  uint64_t v20;
  _QWORD v21[2];

  v21[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  nplog_obj();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_debug_impl(&dword_19E8FE000, v8, OS_LOG_TYPE_DEBUG, "override preferred resolver called", buf, 2u);
  }

  -[NSPServerClient getConnection]((uint64_t)self);
  v9 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    v10 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_int64(v10, "NSPServerCommandType", 43);
    if (v6)
    {
      v12 = v10;
      v13 = v6;
      xpc_dictionary_set_string(v12, "NSPServerPrivacyProxyURL", (const char *)objc_msgSend(v13, "UTF8String"));

    }
    if (self)
      self = (NSPServerClient *)objc_getProperty(self, v11, 16, 1);
    handler[0] = MEMORY[0x1E0C809B0];
    handler[1] = 3221225472;
    handler[2] = __63__NSPServerClient_overridePreferredResolver_completionHandler___block_invoke;
    handler[3] = &unk_1E41377F0;
    v18 = v7;
    xpc_connection_send_message_with_reply(v9, v10, &self->super, handler);

  }
  else
  {
    nplog_obj();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_19E8FE000, v14, OS_LOG_TYPE_ERROR, "Failed to get XPC connection", buf, 2u);
    }

    v15 = objc_alloc(MEMORY[0x1E0CB35C8]);
    v20 = *MEMORY[0x1E0CB2D68];
    v21[0] = CFSTR("IPC failed");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v21, &v20, 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (xpc_object_t)objc_msgSend(v15, "initWithDomain:code:userInfo:", CFSTR("privacyProxyErrorDomain"), 1002, v16);

    (*((void (**)(id, xpc_object_t))v7 + 2))(v7, v10);
  }

}

void __63__NSPServerClient_overridePreferredResolver_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  void *v5;

  +[NSPServerClient getErrorFromDict:]((uint64_t)NSPServerClient, a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(a1 + 32);
  if (v4)
  {
    v5 = v3;
    (*(void (**)(void))(v4 + 16))();
    v3 = v5;
  }

}

- (void)getPreferredResolverWithCompletionHandler:(id)a3
{
  id v4;
  NSObject *v5;
  _xpc_connection_s *v6;
  xpc_object_t v7;
  const char *v8;
  NSObject *v9;
  id v10;
  void *v11;
  _QWORD handler[4];
  id v13;
  uint8_t buf[8];
  uint64_t v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  nplog_obj();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_debug_impl(&dword_19E8FE000, v5, OS_LOG_TYPE_DEBUG, "get preferred resolver called", buf, 2u);
  }

  -[NSPServerClient getConnection]((uint64_t)self);
  v6 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v7 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_int64(v7, "NSPServerCommandType", 44);
    if (self)
      self = (NSPServerClient *)objc_getProperty(self, v8, 16, 1);
    handler[0] = MEMORY[0x1E0C809B0];
    handler[1] = 3221225472;
    handler[2] = __61__NSPServerClient_getPreferredResolverWithCompletionHandler___block_invoke;
    handler[3] = &unk_1E41377F0;
    v13 = v4;
    xpc_connection_send_message_with_reply(v6, v7, &self->super, handler);

  }
  else
  {
    nplog_obj();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_19E8FE000, v9, OS_LOG_TYPE_ERROR, "Failed to get XPC connection", buf, 2u);
    }

    v10 = objc_alloc(MEMORY[0x1E0CB35C8]);
    v15 = *MEMORY[0x1E0CB2D68];
    v16[0] = CFSTR("IPC failed");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, &v15, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (xpc_object_t)objc_msgSend(v10, "initWithDomain:code:userInfo:", CFSTR("privacyProxyErrorDomain"), 1002, v11);

    (*((void (**)(id, _QWORD, xpc_object_t))v4 + 2))(v4, 0, v7);
  }

}

void __61__NSPServerClient_getPreferredResolverWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  char *string;
  void *v4;
  uint64_t v5;
  id v6;

  v6 = a2;
  string = (char *)xpc_dictionary_get_string(v6, "NSPServerPrivacyProxyURL");
  if (string)
    string = (char *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithUTF8String:", string);
  +[NSPServerClient getErrorFromDict:]((uint64_t)NSPServerClient, v6);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
    (*(void (**)(uint64_t, char *, void *))(v5 + 16))(v5, string, v4);

}

- (void)overridePreferredObliviousProxy:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  _xpc_connection_s *v9;
  xpc_object_t v10;
  const char *v11;
  id v12;
  id v13;
  NSObject *v14;
  id v15;
  void *v16;
  _QWORD handler[4];
  id v18;
  uint8_t buf[8];
  uint64_t v20;
  _QWORD v21[2];

  v21[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  nplog_obj();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_debug_impl(&dword_19E8FE000, v8, OS_LOG_TYPE_DEBUG, "override preferred oblivious proxy called", buf, 2u);
  }

  -[NSPServerClient getConnection]((uint64_t)self);
  v9 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    v10 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_int64(v10, "NSPServerCommandType", 68);
    if (v6)
    {
      v12 = v10;
      v13 = v6;
      xpc_dictionary_set_string(v12, "NSPServerPrivacyProxyURL", (const char *)objc_msgSend(v13, "UTF8String"));

    }
    if (self)
      self = (NSPServerClient *)objc_getProperty(self, v11, 16, 1);
    handler[0] = MEMORY[0x1E0C809B0];
    handler[1] = 3221225472;
    handler[2] = __69__NSPServerClient_overridePreferredObliviousProxy_completionHandler___block_invoke;
    handler[3] = &unk_1E41377F0;
    v18 = v7;
    xpc_connection_send_message_with_reply(v9, v10, &self->super, handler);

  }
  else
  {
    nplog_obj();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_19E8FE000, v14, OS_LOG_TYPE_ERROR, "Failed to get XPC connection", buf, 2u);
    }

    v15 = objc_alloc(MEMORY[0x1E0CB35C8]);
    v20 = *MEMORY[0x1E0CB2D68];
    v21[0] = CFSTR("IPC failed");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v21, &v20, 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (xpc_object_t)objc_msgSend(v15, "initWithDomain:code:userInfo:", CFSTR("privacyProxyErrorDomain"), 1002, v16);

    (*((void (**)(id, xpc_object_t))v7 + 2))(v7, v10);
  }

}

void __69__NSPServerClient_overridePreferredObliviousProxy_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  void *v5;

  +[NSPServerClient getErrorFromDict:]((uint64_t)NSPServerClient, a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(a1 + 32);
  if (v4)
  {
    v5 = v3;
    (*(void (**)(void))(v4 + 16))();
    v3 = v5;
  }

}

- (void)getPreferredObliviousProxyWithCompletionHandler:(id)a3
{
  id v4;
  NSObject *v5;
  _xpc_connection_s *v6;
  xpc_object_t v7;
  const char *v8;
  NSObject *v9;
  id v10;
  void *v11;
  _QWORD handler[4];
  id v13;
  uint8_t buf[8];
  uint64_t v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  nplog_obj();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_debug_impl(&dword_19E8FE000, v5, OS_LOG_TYPE_DEBUG, "get preferred oblivious proxy called", buf, 2u);
  }

  -[NSPServerClient getConnection]((uint64_t)self);
  v6 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v7 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_int64(v7, "NSPServerCommandType", 69);
    if (self)
      self = (NSPServerClient *)objc_getProperty(self, v8, 16, 1);
    handler[0] = MEMORY[0x1E0C809B0];
    handler[1] = 3221225472;
    handler[2] = __67__NSPServerClient_getPreferredObliviousProxyWithCompletionHandler___block_invoke;
    handler[3] = &unk_1E41377F0;
    v13 = v4;
    xpc_connection_send_message_with_reply(v6, v7, &self->super, handler);

  }
  else
  {
    nplog_obj();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_19E8FE000, v9, OS_LOG_TYPE_ERROR, "Failed to get XPC connection", buf, 2u);
    }

    v10 = objc_alloc(MEMORY[0x1E0CB35C8]);
    v15 = *MEMORY[0x1E0CB2D68];
    v16[0] = CFSTR("IPC failed");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, &v15, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (xpc_object_t)objc_msgSend(v10, "initWithDomain:code:userInfo:", CFSTR("privacyProxyErrorDomain"), 1002, v11);

    (*((void (**)(id, _QWORD, xpc_object_t))v4 + 2))(v4, 0, v7);
  }

}

void __67__NSPServerClient_getPreferredObliviousProxyWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  char *string;
  void *v4;
  uint64_t v5;
  id v6;

  v6 = a2;
  string = (char *)xpc_dictionary_get_string(v6, "NSPServerPrivacyProxyURL");
  if (string)
    string = (char *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithUTF8String:", string);
  +[NSPServerClient getErrorFromDict:]((uint64_t)NSPServerClient, v6);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
    (*(void (**)(uint64_t, char *, void *))(v5 + 16))(v5, string, v4);

}

- (void)overrideIngressProxy:(id)a3 fallbackProxy:(id)a4 key:(id)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  NSObject *v14;
  _xpc_connection_s *v15;
  xpc_object_t v16;
  id v17;
  id v18;
  id v19;
  id v20;
  const char *v21;
  id v22;
  void *v23;
  NSObject *v24;
  id v25;
  void *v26;
  _QWORD handler[4];
  id v28;
  uint8_t buf[8];
  uint64_t v30;
  _QWORD v31[2];

  v31[1] = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  nplog_obj();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_debug_impl(&dword_19E8FE000, v14, OS_LOG_TYPE_DEBUG, "override ingress proxy called", buf, 2u);
  }

  -[NSPServerClient getConnection]((uint64_t)self);
  v15 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
  if (v15)
  {
    v16 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_int64(v16, "NSPServerCommandType", 49);
    v17 = v10;
    if (v17)
    {
      v18 = v16;
      xpc_dictionary_set_string(v18, "NSPServerPrivacyProxyURL", (const char *)objc_msgSend(v17, "UTF8String"));

    }
    v19 = v11;
    if (v19)
    {
      v20 = v16;
      xpc_dictionary_set_string(v20, "NSPServerPrivacyProxyFallbackURL", (const char *)objc_msgSend(v19, "UTF8String"));

    }
    if (v12)
    {
      v22 = v16;
      v23 = (void *)_CFXPCCreateXPCObjectFromCFObject();
      xpc_dictionary_set_value(v22, "NSPServerPrivacyProxyKey", v23);

    }
    if (self)
      self = (NSPServerClient *)objc_getProperty(self, v21, 16, 1);
    handler[0] = MEMORY[0x1E0C809B0];
    handler[1] = 3221225472;
    handler[2] = __76__NSPServerClient_overrideIngressProxy_fallbackProxy_key_completionHandler___block_invoke;
    handler[3] = &unk_1E41377F0;
    v28 = v13;
    xpc_connection_send_message_with_reply(v15, v16, &self->super, handler);

  }
  else
  {
    nplog_obj();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_19E8FE000, v24, OS_LOG_TYPE_ERROR, "Failed to get XPC connection", buf, 2u);
    }

    v25 = objc_alloc(MEMORY[0x1E0CB35C8]);
    v30 = *MEMORY[0x1E0CB2D68];
    v31[0] = CFSTR("IPC failed");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v31, &v30, 1);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (xpc_object_t)objc_msgSend(v25, "initWithDomain:code:userInfo:", CFSTR("privacyProxyErrorDomain"), 1002, v26);

    (*((void (**)(id, xpc_object_t))v13 + 2))(v13, v16);
  }

}

void __76__NSPServerClient_overrideIngressProxy_fallbackProxy_key_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  void *v5;

  +[NSPServerClient getErrorFromDict:]((uint64_t)NSPServerClient, a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(a1 + 32);
  if (v4)
  {
    v5 = v3;
    (*(void (**)(void))(v4 + 16))();
    v3 = v5;
  }

}

- (void)getOverrideIngressProxyWithCompletionHandler:(id)a3
{
  id v4;
  NSObject *v5;
  _xpc_connection_s *v6;
  xpc_object_t v7;
  const char *v8;
  NSObject *v9;
  id v10;
  void *v11;
  _QWORD handler[4];
  id v13;
  uint8_t buf[8];
  uint64_t v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  nplog_obj();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_debug_impl(&dword_19E8FE000, v5, OS_LOG_TYPE_DEBUG, "get override ingress proxy called", buf, 2u);
  }

  -[NSPServerClient getConnection]((uint64_t)self);
  v6 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v7 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_int64(v7, "NSPServerCommandType", 50);
    if (self)
      self = (NSPServerClient *)objc_getProperty(self, v8, 16, 1);
    handler[0] = MEMORY[0x1E0C809B0];
    handler[1] = 3221225472;
    handler[2] = __64__NSPServerClient_getOverrideIngressProxyWithCompletionHandler___block_invoke;
    handler[3] = &unk_1E41377F0;
    v13 = v4;
    xpc_connection_send_message_with_reply(v6, v7, &self->super, handler);

  }
  else
  {
    nplog_obj();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_19E8FE000, v9, OS_LOG_TYPE_ERROR, "Failed to get XPC connection", buf, 2u);
    }

    v10 = objc_alloc(MEMORY[0x1E0CB35C8]);
    v15 = *MEMORY[0x1E0CB2D68];
    v16[0] = CFSTR("IPC failed");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, &v15, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (xpc_object_t)objc_msgSend(v10, "initWithDomain:code:userInfo:", CFSTR("privacyProxyErrorDomain"), 1002, v11);

    (*((void (**)(id, _QWORD, _QWORD, _QWORD, xpc_object_t))v4 + 2))(v4, 0, 0, 0, v7);
  }

}

void __64__NSPServerClient_getOverrideIngressProxyWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  char *string;
  char *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  xpc_object_t xdict;

  xdict = a2;
  string = (char *)xpc_dictionary_get_string(xdict, "NSPServerPrivacyProxyURL");
  if (string)
    string = (char *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithUTF8String:", string);
  v4 = (char *)xpc_dictionary_get_string(xdict, "NSPServerPrivacyProxyFallbackURL");
  if (v4)
    v4 = (char *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithUTF8String:", v4);
  get_nsdata_from_xpc_object(xdict, "NSPServerPrivacyProxyKey");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[NSPServerClient getErrorFromDict:]((uint64_t)NSPServerClient, xdict);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = *(_QWORD *)(a1 + 32);
  if (v7)
    (*(void (**)(uint64_t, char *, char *, void *, void *))(v7 + 16))(v7, string, v4, v5, v6);

}

- (void)setForceFallback:(BOOL)a3 completionHandler:(id)a4
{
  id v6;
  NSObject *v7;
  _xpc_connection_s *v8;
  xpc_object_t v9;
  const char *v10;
  NSObject *v11;
  id v12;
  void *v13;
  _QWORD handler[4];
  id v15;
  uint8_t buf[8];
  uint64_t v17;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x1E0C80C00];
  v6 = a4;
  nplog_obj();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_debug_impl(&dword_19E8FE000, v7, OS_LOG_TYPE_DEBUG, "force fallback called", buf, 2u);
  }

  -[NSPServerClient getConnection]((uint64_t)self);
  v8 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_int64(v9, "NSPServerCommandType", 46);
    xpc_dictionary_set_BOOL(v9, "NSPServerPrivacyProxyForceFallback", a3);
    if (self)
      self = (NSPServerClient *)objc_getProperty(self, v10, 16, 1);
    handler[0] = MEMORY[0x1E0C809B0];
    handler[1] = 3221225472;
    handler[2] = __54__NSPServerClient_setForceFallback_completionHandler___block_invoke;
    handler[3] = &unk_1E41377F0;
    v15 = v6;
    xpc_connection_send_message_with_reply(v8, v9, &self->super, handler);

  }
  else
  {
    nplog_obj();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_19E8FE000, v11, OS_LOG_TYPE_ERROR, "Failed to get XPC connection", buf, 2u);
    }

    v12 = objc_alloc(MEMORY[0x1E0CB35C8]);
    v17 = *MEMORY[0x1E0CB2D68];
    v18[0] = CFSTR("IPC failed");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, &v17, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (xpc_object_t)objc_msgSend(v12, "initWithDomain:code:userInfo:", CFSTR("privacyProxyErrorDomain"), 1002, v13);

    (*((void (**)(id, xpc_object_t))v6 + 2))(v6, v9);
  }

}

void __54__NSPServerClient_setForceFallback_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  void *v5;

  +[NSPServerClient getErrorFromDict:]((uint64_t)NSPServerClient, a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(a1 + 32);
  if (v4)
  {
    v5 = v3;
    (*(void (**)(void))(v4 + 16))();
    v3 = v5;
  }

}

- (void)getForceFallbackWithCompletionHandler:(id)a3
{
  id v4;
  NSObject *v5;
  _xpc_connection_s *v6;
  xpc_object_t v7;
  const char *v8;
  NSObject *v9;
  id v10;
  void *v11;
  _QWORD handler[4];
  id v13;
  uint8_t buf[8];
  uint64_t v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  nplog_obj();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_debug_impl(&dword_19E8FE000, v5, OS_LOG_TYPE_DEBUG, "get force fallback called", buf, 2u);
  }

  -[NSPServerClient getConnection]((uint64_t)self);
  v6 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v7 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_int64(v7, "NSPServerCommandType", 47);
    if (self)
      self = (NSPServerClient *)objc_getProperty(self, v8, 16, 1);
    handler[0] = MEMORY[0x1E0C809B0];
    handler[1] = 3221225472;
    handler[2] = __57__NSPServerClient_getForceFallbackWithCompletionHandler___block_invoke;
    handler[3] = &unk_1E41377F0;
    v13 = v4;
    xpc_connection_send_message_with_reply(v6, v7, &self->super, handler);

  }
  else
  {
    nplog_obj();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_19E8FE000, v9, OS_LOG_TYPE_ERROR, "Failed to get XPC connection", buf, 2u);
    }

    v10 = objc_alloc(MEMORY[0x1E0CB35C8]);
    v15 = *MEMORY[0x1E0CB2D68];
    v16[0] = CFSTR("IPC failed");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, &v15, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (xpc_object_t)objc_msgSend(v10, "initWithDomain:code:userInfo:", CFSTR("privacyProxyErrorDomain"), 1002, v11);

    (*((void (**)(id, _QWORD, xpc_object_t))v4 + 2))(v4, 0, v7);
  }

}

void __57__NSPServerClient_getForceFallbackWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  _BOOL8 v4;
  uint64_t v5;
  id v6;

  v3 = a2;
  v4 = xpc_dictionary_get_BOOL(v3, "NSPServerPrivacyProxyForceFallback");
  +[NSPServerClient getErrorFromDict:]((uint64_t)NSPServerClient, v3);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
    (*(void (**)(uint64_t, _BOOL8, id))(v5 + 16))(v5, v4, v6);

}

- (void)setPrivacyProxyStatus:(BOOL)a3 completionHandler:(id)a4
{
  _BOOL4 v4;
  id v6;
  NSObject *v7;
  _xpc_connection_s *v8;
  xpc_object_t v9;
  const char *v10;
  NSObject *v11;
  id v12;
  void *v13;
  const __CFString *v14;
  _QWORD handler[4];
  id v16;
  uint64_t v17;
  const __CFString *v18;
  uint8_t buf[4];
  const __CFString *v20;
  uint64_t v21;

  v4 = a3;
  v21 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  nplog_obj();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    v14 = CFSTR("Disabled");
    if (v4)
      v14 = CFSTR("Enabled");
    *(_DWORD *)buf = 138412290;
    v20 = v14;
    _os_log_debug_impl(&dword_19E8FE000, v7, OS_LOG_TYPE_DEBUG, "Setting privacy proxy %@", buf, 0xCu);
  }

  -[NSPServerClient getConnection]((uint64_t)self);
  v8 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_int64(v9, "NSPServerCommandType", 17);
    xpc_dictionary_set_BOOL(v9, "NSPServerPrivacyProxyEnabled", v4);
    if (self)
      self = (NSPServerClient *)objc_getProperty(self, v10, 16, 1);
    handler[0] = MEMORY[0x1E0C809B0];
    handler[1] = 3221225472;
    handler[2] = __59__NSPServerClient_setPrivacyProxyStatus_completionHandler___block_invoke;
    handler[3] = &unk_1E41377F0;
    v16 = v6;
    xpc_connection_send_message_with_reply(v8, v9, &self->super, handler);

  }
  else
  {
    nplog_obj();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_19E8FE000, v11, OS_LOG_TYPE_ERROR, "Failed to get XPC connection", buf, 2u);
    }

    v12 = objc_alloc(MEMORY[0x1E0CB35C8]);
    v17 = *MEMORY[0x1E0CB2D68];
    v18 = CFSTR("IPC failed");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v18, &v17, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (xpc_object_t)objc_msgSend(v12, "initWithDomain:code:userInfo:", CFSTR("privacyProxyErrorDomain"), 1002, v13);

    (*((void (**)(id, xpc_object_t))v6 + 2))(v6, v9);
  }

}

void __59__NSPServerClient_setPrivacyProxyStatus_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  void *v5;

  +[NSPServerClient getErrorFromDict:]((uint64_t)NSPServerClient, a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(a1 + 32);
  if (v4)
  {
    v5 = v3;
    (*(void (**)(void))(v4 + 16))();
    v3 = v5;
  }

}

- (void)getPrivacyProxyStatusWithCompletionHandler:(id)a3
{
  id v4;
  NSObject *v5;
  _xpc_connection_s *v6;
  xpc_object_t v7;
  const char *v8;
  NSObject *v9;
  id v10;
  void *v11;
  _QWORD handler[4];
  id v13;
  uint8_t buf[8];
  uint64_t v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  nplog_obj();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_debug_impl(&dword_19E8FE000, v5, OS_LOG_TYPE_DEBUG, "Requesting get privacy proxy status", buf, 2u);
  }

  -[NSPServerClient getConnection]((uint64_t)self);
  v6 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v7 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_int64(v7, "NSPServerCommandType", 18);
    if (self)
      self = (NSPServerClient *)objc_getProperty(self, v8, 16, 1);
    handler[0] = MEMORY[0x1E0C809B0];
    handler[1] = 3221225472;
    handler[2] = __62__NSPServerClient_getPrivacyProxyStatusWithCompletionHandler___block_invoke;
    handler[3] = &unk_1E41377F0;
    v13 = v4;
    xpc_connection_send_message_with_reply(v6, v7, &self->super, handler);

  }
  else
  {
    nplog_obj();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_19E8FE000, v9, OS_LOG_TYPE_ERROR, "Failed to get XPC connection", buf, 2u);
    }

    v10 = objc_alloc(MEMORY[0x1E0CB35C8]);
    v15 = *MEMORY[0x1E0CB2D68];
    v16[0] = CFSTR("IPC failed");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, &v15, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (xpc_object_t)objc_msgSend(v10, "initWithDomain:code:userInfo:", CFSTR("privacyProxyErrorDomain"), 1002, v11);

    (*((void (**)(id, _QWORD, xpc_object_t))v4 + 2))(v4, 0, v7);
  }

}

void __62__NSPServerClient_getPrivacyProxyStatusWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  _BOOL8 v4;
  uint64_t v5;
  id v6;

  v3 = a2;
  v4 = xpc_dictionary_get_BOOL(v3, "NSPServerPrivacyProxyEnabled");
  +[NSPServerClient getErrorFromDict:]((uint64_t)NSPServerClient, v3);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
    (*(void (**)(uint64_t, _BOOL8, id))(v5 + 16))(v5, v4, v6);

}

- (void)getPrivacyProxyServiceStatusTimelineWithCompletionHandler:(id)a3
{
  id v4;
  NSObject *v5;
  _xpc_connection_s *v6;
  xpc_object_t v7;
  const char *v8;
  NSObject *v9;
  id v10;
  void *v11;
  _QWORD handler[4];
  id v13;
  uint8_t buf[8];
  uint64_t v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  nplog_obj();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_debug_impl(&dword_19E8FE000, v5, OS_LOG_TYPE_DEBUG, "Requesting get privacy proxy service status timeline", buf, 2u);
  }

  -[NSPServerClient getConnection]((uint64_t)self);
  v6 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v7 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_int64(v7, "NSPServerCommandType", 36);
    if (self)
      self = (NSPServerClient *)objc_getProperty(self, v8, 16, 1);
    handler[0] = MEMORY[0x1E0C809B0];
    handler[1] = 3221225472;
    handler[2] = __77__NSPServerClient_getPrivacyProxyServiceStatusTimelineWithCompletionHandler___block_invoke;
    handler[3] = &unk_1E41377F0;
    v13 = v4;
    xpc_connection_send_message_with_reply(v6, v7, &self->super, handler);

  }
  else
  {
    nplog_obj();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_19E8FE000, v9, OS_LOG_TYPE_ERROR, "Failed to get XPC connection", buf, 2u);
    }

    v10 = objc_alloc(MEMORY[0x1E0CB35C8]);
    v15 = *MEMORY[0x1E0CB2D68];
    v16[0] = CFSTR("IPC failed");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, &v15, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (xpc_object_t)objc_msgSend(v10, "initWithDomain:code:userInfo:", CFSTR("privacyProxyErrorDomain"), 1002, v11);

    (*((void (**)(id, _QWORD, xpc_object_t))v4 + 2))(v4, 0, v7);
  }

}

void __77__NSPServerClient_getPrivacyProxyServiceStatusTimelineWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;

  v3 = a2;
  +[NSPServerClient getErrorFromDict:]((uint64_t)NSPServerClient, v3);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x1E0C99E60];
  v5 = objc_opt_class();
  objc_msgSend(v4, "setWithObjects:", v5, objc_opt_class(), 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  get_nsdata_from_xpc_object(v3, "NSPServerPrivacyProxyServiceStatusTimeline");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3710], "unarchivedObjectOfClasses:fromData:error:", v6, v7, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = 0;
  }

  v9 = *(_QWORD *)(a1 + 32);
  if (v9)
    (*(void (**)(uint64_t, void *, id))(v9 + 16))(v9, v8, v10);

}

- (void)reportPrivacyProxyServiceStatus:(unint64_t)a3 completionHandler:(id)a4
{
  id v6;
  NSObject *v7;
  _xpc_connection_s *v8;
  xpc_object_t v9;
  const char *v10;
  NSObject *v11;
  id v12;
  void *v13;
  _QWORD handler[4];
  id v15;
  uint8_t buf[8];
  uint64_t v17;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x1E0C80C00];
  v6 = a4;
  nplog_obj();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_debug_impl(&dword_19E8FE000, v7, OS_LOG_TYPE_DEBUG, "Reporting privacy proxy service status", buf, 2u);
  }

  -[NSPServerClient getConnection]((uint64_t)self);
  v8 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_int64(v9, "NSPServerCommandType", 34);
    xpc_dictionary_set_int64(v9, "NSPServerPrivacyProxyServiceStatus", a3);
    if (self)
      self = (NSPServerClient *)objc_getProperty(self, v10, 16, 1);
    handler[0] = MEMORY[0x1E0C809B0];
    handler[1] = 3221225472;
    handler[2] = __69__NSPServerClient_reportPrivacyProxyServiceStatus_completionHandler___block_invoke;
    handler[3] = &unk_1E41377F0;
    v15 = v6;
    xpc_connection_send_message_with_reply(v8, v9, &self->super, handler);

  }
  else
  {
    nplog_obj();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_19E8FE000, v11, OS_LOG_TYPE_ERROR, "Failed to get XPC connection", buf, 2u);
    }

    v12 = objc_alloc(MEMORY[0x1E0CB35C8]);
    v17 = *MEMORY[0x1E0CB2D68];
    v18[0] = CFSTR("IPC failed");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, &v17, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (xpc_object_t)objc_msgSend(v12, "initWithDomain:code:userInfo:", CFSTR("privacyProxyErrorDomain"), 1002, v13);

    (*((void (**)(id, xpc_object_t))v6 + 2))(v6, v9);
  }

}

void __69__NSPServerClient_reportPrivacyProxyServiceStatus_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  void *v5;

  +[NSPServerClient getErrorFromDict:]((uint64_t)NSPServerClient, a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(a1 + 32);
  if (v4)
  {
    v5 = v3;
    (*(void (**)(void))(v4 + 16))();
    v3 = v5;
  }

}

- (void)reportPrivacyProxyNetworkStatus:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  _xpc_connection_s *v9;
  xpc_object_t v10;
  const char *v11;
  void *v12;
  id v13;
  void *v14;
  NSObject *v15;
  id v16;
  void *v17;
  _QWORD handler[4];
  id v19;
  uint8_t buf[8];
  uint64_t v21;
  _QWORD v22[2];

  v22[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  nplog_obj();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_debug_impl(&dword_19E8FE000, v8, OS_LOG_TYPE_DEBUG, "Reporting privacy proxy network status", buf, 2u);
  }

  -[NSPServerClient getConnection]((uint64_t)self);
  v9 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    v10 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_int64(v10, "NSPServerCommandType", 35);
    objc_msgSend(v6, "serialize");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      v13 = v10;
      v14 = (void *)_CFXPCCreateXPCObjectFromCFObject();
      xpc_dictionary_set_value(v13, "NSPServerPrivacyProxyNetworkStatus", v14);

    }
    if (self)
      self = (NSPServerClient *)objc_getProperty(self, v11, 16, 1);
    handler[0] = MEMORY[0x1E0C809B0];
    handler[1] = 3221225472;
    handler[2] = __69__NSPServerClient_reportPrivacyProxyNetworkStatus_completionHandler___block_invoke;
    handler[3] = &unk_1E41377F0;
    v19 = v7;
    xpc_connection_send_message_with_reply(v9, v10, &self->super, handler);

  }
  else
  {
    nplog_obj();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_19E8FE000, v15, OS_LOG_TYPE_ERROR, "Failed to get XPC connection", buf, 2u);
    }

    v16 = objc_alloc(MEMORY[0x1E0CB35C8]);
    v21 = *MEMORY[0x1E0CB2D68];
    v22[0] = CFSTR("IPC failed");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v22, &v21, 1);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (xpc_object_t)objc_msgSend(v16, "initWithDomain:code:userInfo:", CFSTR("privacyProxyErrorDomain"), 1002, v17);

    (*((void (**)(id, xpc_object_t))v7 + 2))(v7, v10);
  }

}

void __69__NSPServerClient_reportPrivacyProxyNetworkStatus_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  void *v5;

  +[NSPServerClient getErrorFromDict:]((uint64_t)NSPServerClient, a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(a1 + 32);
  if (v4)
  {
    v5 = v3;
    (*(void (**)(void))(v4 + 16))();
    v3 = v5;
  }

}

- (void)getPrivacyProxyAppStatusesWithCompletionHandler:(id)a3
{
  id v4;
  NSObject *v5;
  _xpc_connection_s *v6;
  xpc_object_t v7;
  const char *v8;
  NSObject *v9;
  id v10;
  void *v11;
  _QWORD handler[4];
  id v13;
  uint8_t buf[8];
  uint64_t v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  nplog_obj();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_debug_impl(&dword_19E8FE000, v5, OS_LOG_TYPE_DEBUG, "Requesting get privacy proxy app statuses", buf, 2u);
  }

  -[NSPServerClient getConnection]((uint64_t)self);
  v6 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v7 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_int64(v7, "NSPServerCommandType", 63);
    if (self)
      self = (NSPServerClient *)objc_getProperty(self, v8, 16, 1);
    handler[0] = MEMORY[0x1E0C809B0];
    handler[1] = 3221225472;
    handler[2] = __67__NSPServerClient_getPrivacyProxyAppStatusesWithCompletionHandler___block_invoke;
    handler[3] = &unk_1E41377F0;
    v13 = v4;
    xpc_connection_send_message_with_reply(v6, v7, &self->super, handler);

  }
  else
  {
    nplog_obj();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_19E8FE000, v9, OS_LOG_TYPE_ERROR, "Failed to get XPC connection", buf, 2u);
    }

    v10 = objc_alloc(MEMORY[0x1E0CB35C8]);
    v15 = *MEMORY[0x1E0CB2D68];
    v16[0] = CFSTR("IPC failed");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, &v15, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (xpc_object_t)objc_msgSend(v10, "initWithDomain:code:userInfo:", CFSTR("privacyProxyErrorDomain"), 1002, v11);

    (*((void (**)(id, _QWORD, _QWORD, xpc_object_t))v4 + 2))(v4, 0, 0, v7);
  }

}

void __67__NSPServerClient_getPrivacyProxyAppStatusesWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  id v13;

  v13 = a2;
  +[NSPServerClient getErrorFromDict:]((uint64_t)NSPServerClient, v13);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  get_nsdata_from_xpc_object(v13, "NSPServerPrivacyProxyAnyAppEnabledDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3710], "unarchivedObjectOfClasses:fromData:error:", v4, v5, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }

  v7 = (void *)MEMORY[0x1E0C99E60];
  v8 = objc_opt_class();
  objc_msgSend(v7, "setWithObjects:", v8, objc_opt_class(), 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  get_nsdata_from_xpc_object(v13, "NSPServerPrivacyProxyAppStatuses");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    objc_msgSend(MEMORY[0x1E0CB3710], "unarchivedObjectOfClasses:fromData:error:", v9, v10, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v11 = 0;
  }

  v12 = *(_QWORD *)(a1 + 32);
  if (v12)
    (*(void (**)(uint64_t, void *, void *, void *))(v12 + 16))(v12, v11, v6, v3);

}

- (void)setPrivacyProxyAppStatus:(unint64_t)a3 bundleIdentifier:(id)a4 path:(id)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  _xpc_connection_s *v14;
  xpc_object_t v15;
  PrivacyProxyAppStatus *v16;
  const char *v17;
  NSObject *v18;
  id v19;
  void *v20;
  _QWORD handler[4];
  id v22;
  uint8_t buf[8];
  uint64_t v24;
  _QWORD v25[2];

  v25[1] = *MEMORY[0x1E0C80C00];
  v10 = a4;
  v11 = a5;
  v12 = a6;
  nplog_obj();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_debug_impl(&dword_19E8FE000, v13, OS_LOG_TYPE_DEBUG, "Reporting privacy proxy service status", buf, 2u);
  }

  -[NSPServerClient getConnection]((uint64_t)self);
  v14 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
  if (v14)
  {
    v15 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_int64(v15, "NSPServerCommandType", 64);
    v16 = -[PrivacyProxyAppStatus initWithStatus:bundleID:path:activeDate:]([PrivacyProxyAppStatus alloc], "initWithStatus:bundleID:path:activeDate:", a3, v10, v11, 0);
    set_nsobject_in_xpc_object(v15, "NSPServerPrivacyProxyAppStatus", (uint64_t)v16);
    if (self)
      self = (NSPServerClient *)objc_getProperty(self, v17, 16, 1);
    handler[0] = MEMORY[0x1E0C809B0];
    handler[1] = 3221225472;
    handler[2] = __84__NSPServerClient_setPrivacyProxyAppStatus_bundleIdentifier_path_completionHandler___block_invoke;
    handler[3] = &unk_1E41377F0;
    v22 = v12;
    xpc_connection_send_message_with_reply(v14, v15, &self->super, handler);

  }
  else
  {
    nplog_obj();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_19E8FE000, v18, OS_LOG_TYPE_ERROR, "Failed to get XPC connection", buf, 2u);
    }

    v19 = objc_alloc(MEMORY[0x1E0CB35C8]);
    v24 = *MEMORY[0x1E0CB2D68];
    v25[0] = CFSTR("IPC failed");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v25, &v24, 1);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (xpc_object_t)objc_msgSend(v19, "initWithDomain:code:userInfo:", CFSTR("privacyProxyErrorDomain"), 1002, v20);

    (*((void (**)(id, xpc_object_t))v12 + 2))(v12, v15);
  }

}

void __84__NSPServerClient_setPrivacyProxyAppStatus_bundleIdentifier_path_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  void *v5;

  +[NSPServerClient getErrorFromDict:]((uint64_t)NSPServerClient, a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(a1 + 32);
  if (v4)
  {
    v5 = v3;
    (*(void (**)(void))(v4 + 16))();
    v3 = v5;
  }

}

- (void)setPrivacyProxyUserTier:(unint64_t)a3 completionHandler:(id)a4
{
  id v6;
  NSObject *v7;
  _xpc_connection_s *v8;
  xpc_object_t v9;
  void *v10;
  void *v11;
  const char *v12;
  id v13;
  id v14;
  NSObject *v15;
  id v16;
  void *v17;
  __CFString *v18;
  _QWORD handler[4];
  id v20;
  uint64_t v21;
  const __CFString *v22;
  uint8_t buf[4];
  __CFString *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  nplog_obj();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    if (a3 >= 3)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), a3);
      v18 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v18 = off_1E4137838[(int)a3];
    }
    *(_DWORD *)buf = 138412290;
    v24 = v18;
    _os_log_debug_impl(&dword_19E8FE000, v7, OS_LOG_TYPE_DEBUG, "Setting user tier for privacy proxy %@", buf, 0xCu);

  }
  -[NSPServerClient getConnection]((uint64_t)self);
  v8 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_int64(v9, "NSPServerCommandType", 19);
    xpc_dictionary_set_uint64(v9, "NSPServerPrivacyProxyUserTier", a3);
    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "bundleIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      v13 = v9;
      v14 = v11;
      xpc_dictionary_set_string(v13, "NSPServerSigningIdentifier", (const char *)objc_msgSend(v14, "UTF8String"));

    }
    if (self)
      self = (NSPServerClient *)objc_getProperty(self, v12, 16, 1);
    handler[0] = MEMORY[0x1E0C809B0];
    handler[1] = 3221225472;
    handler[2] = __61__NSPServerClient_setPrivacyProxyUserTier_completionHandler___block_invoke;
    handler[3] = &unk_1E41377F0;
    v20 = v6;
    xpc_connection_send_message_with_reply(v8, v9, &self->super, handler);

  }
  else
  {
    nplog_obj();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_19E8FE000, v15, OS_LOG_TYPE_ERROR, "Failed to get XPC connection", buf, 2u);
    }

    v16 = objc_alloc(MEMORY[0x1E0CB35C8]);
    v21 = *MEMORY[0x1E0CB2D68];
    v22 = CFSTR("IPC failed");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v22, &v21, 1);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (xpc_object_t)objc_msgSend(v16, "initWithDomain:code:userInfo:", CFSTR("privacyProxyErrorDomain"), 1002, v17);

    (*((void (**)(id, xpc_object_t))v6 + 2))(v6, v9);
  }

}

void __61__NSPServerClient_setPrivacyProxyUserTier_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  void *v5;

  +[NSPServerClient getErrorFromDict:]((uint64_t)NSPServerClient, a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(a1 + 32);
  if (v4)
  {
    v5 = v3;
    (*(void (**)(void))(v4 + 16))();
    v3 = v5;
  }

}

- (void)setFreeUserTierUntilTomorrowWithCompletionHandler:(id)a3
{
  id v4;
  NSObject *v5;
  _xpc_connection_s *v6;
  xpc_object_t v7;
  const char *v8;
  NSObject *v9;
  id v10;
  void *v11;
  _QWORD handler[4];
  id v13;
  uint8_t buf[8];
  uint64_t v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  nplog_obj();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_debug_impl(&dword_19E8FE000, v5, OS_LOG_TYPE_DEBUG, "Set user tier to free until tomorrow", buf, 2u);
  }

  -[NSPServerClient getConnection]((uint64_t)self);
  v6 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v7 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_int64(v7, "NSPServerCommandType", 19);
    xpc_dictionary_set_uint64(v7, "NSPServerPrivacyProxyUserTier", 1uLL);
    xpc_dictionary_set_BOOL(v7, "NSPServerPrivacyProxySetUntilTomorrow", 1);
    if (self)
      self = (NSPServerClient *)objc_getProperty(self, v8, 16, 1);
    handler[0] = MEMORY[0x1E0C809B0];
    handler[1] = 3221225472;
    handler[2] = __69__NSPServerClient_setFreeUserTierUntilTomorrowWithCompletionHandler___block_invoke;
    handler[3] = &unk_1E41377F0;
    v13 = v4;
    xpc_connection_send_message_with_reply(v6, v7, &self->super, handler);

  }
  else
  {
    nplog_obj();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_19E8FE000, v9, OS_LOG_TYPE_ERROR, "Failed to get XPC connection", buf, 2u);
    }

    v10 = objc_alloc(MEMORY[0x1E0CB35C8]);
    v15 = *MEMORY[0x1E0CB2D68];
    v16[0] = CFSTR("IPC failed");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, &v15, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (xpc_object_t)objc_msgSend(v10, "initWithDomain:code:userInfo:", CFSTR("privacyProxyErrorDomain"), 1002, v11);

    (*((void (**)(id, xpc_object_t))v4 + 2))(v4, v7);
  }

}

void __69__NSPServerClient_setFreeUserTierUntilTomorrowWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  void *v5;

  +[NSPServerClient getErrorFromDict:]((uint64_t)NSPServerClient, a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(a1 + 32);
  if (v4)
  {
    v5 = v3;
    (*(void (**)(void))(v4 + 16))();
    v3 = v5;
  }

}

- (void)getPrivacyProxyEffectiveUserTierWithCompletionHandler:(id)a3
{
  id v4;
  NSObject *v5;
  _xpc_connection_s *v6;
  xpc_object_t v7;
  const char *v8;
  NSObject *v9;
  id v10;
  void *v11;
  _QWORD handler[4];
  id v13;
  uint8_t buf[8];
  uint64_t v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  nplog_obj();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_debug_impl(&dword_19E8FE000, v5, OS_LOG_TYPE_DEBUG, "Get effective user tier", buf, 2u);
  }

  -[NSPServerClient getConnection]((uint64_t)self);
  v6 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v7 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_int64(v7, "NSPServerCommandType", 42);
    if (self)
      self = (NSPServerClient *)objc_getProperty(self, v8, 16, 1);
    handler[0] = MEMORY[0x1E0C809B0];
    handler[1] = 3221225472;
    handler[2] = __73__NSPServerClient_getPrivacyProxyEffectiveUserTierWithCompletionHandler___block_invoke;
    handler[3] = &unk_1E41377F0;
    v13 = v4;
    xpc_connection_send_message_with_reply(v6, v7, &self->super, handler);

  }
  else
  {
    nplog_obj();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_19E8FE000, v9, OS_LOG_TYPE_ERROR, "Failed to get XPC connection", buf, 2u);
    }

    v10 = objc_alloc(MEMORY[0x1E0CB35C8]);
    v15 = *MEMORY[0x1E0CB2D68];
    v16[0] = CFSTR("IPC failed");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, &v15, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (xpc_object_t)objc_msgSend(v10, "initWithDomain:code:userInfo:", CFSTR("privacyProxyErrorDomain"), 1002, v11);

    (*((void (**)(id, _QWORD, xpc_object_t))v4 + 2))(v4, 0, v7);
  }

}

void __73__NSPServerClient_getPrivacyProxyEffectiveUserTierWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t uint64;
  uint64_t v5;
  xpc_object_t xdict;

  xdict = a2;
  +[NSPServerClient getErrorFromDict:]((uint64_t)NSPServerClient, xdict);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (xdict && MEMORY[0x1A1AEADA0]() == MEMORY[0x1E0C812F8])
    uint64 = xpc_dictionary_get_uint64(xdict, "NSPServerPrivacyProxyEffectiveUserTier");
  else
    uint64 = 0;
  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
    (*(void (**)(uint64_t, uint64_t, void *))(v5 + 16))(v5, uint64, v3);

}

- (void)getPrivacyProxyDomainFilters:(id)a3
{
  id v4;
  NSObject *v5;
  _xpc_connection_s *v6;
  xpc_object_t v7;
  const char *v8;
  NSObject *v9;
  _QWORD handler[4];
  id v11;
  uint8_t buf[16];

  v4 = a3;
  nplog_obj();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_debug_impl(&dword_19E8FE000, v5, OS_LOG_TYPE_DEBUG, "get privacy proxy domain filters called", buf, 2u);
  }

  -[NSPServerClient getConnection]((uint64_t)self);
  v6 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v7 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_int64(v7, "NSPServerCommandType", 58);
    if (self)
      self = (NSPServerClient *)objc_getProperty(self, v8, 16, 1);
    handler[0] = MEMORY[0x1E0C809B0];
    handler[1] = 3221225472;
    handler[2] = __48__NSPServerClient_getPrivacyProxyDomainFilters___block_invoke;
    handler[3] = &unk_1E41377F0;
    v11 = v4;
    xpc_connection_send_message_with_reply(v6, v7, &self->super, handler);

  }
  else
  {
    nplog_obj();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_19E8FE000, v9, OS_LOG_TYPE_ERROR, "Failed to get XPC connection", buf, 2u);
    }

    (*((void (**)(id, _QWORD))v4 + 2))(v4, 0);
  }

}

void __48__NSPServerClient_getPrivacyProxyDomainFilters___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  void *v5;

  get_nsdictionary_from_xpc_object(a2, "NSPServerPrivacyProxyDomainFilters");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(a1 + 32);
  if (v4)
  {
    v5 = v3;
    (*(void (**)(void))(v4 + 16))();
    v3 = v5;
  }

}

- (void)getPrivacyProxyPolicyWithCompletionHandler:(id)a3
{
  id v4;
  NSObject *v5;
  _xpc_connection_s *v6;
  xpc_object_t v7;
  const char *v8;
  _QWORD handler[4];
  id v10;
  uint8_t buf[16];

  v4 = a3;
  nplog_obj();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_debug_impl(&dword_19E8FE000, v5, OS_LOG_TYPE_DEBUG, "fetching privacy proxy policy data", buf, 2u);
  }

  -[NSPServerClient getConnection]((uint64_t)self);
  v6 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v7 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_int64(v7, "NSPServerCommandType", 23);
    if (self)
      self = (NSPServerClient *)objc_getProperty(self, v8, 16, 1);
    handler[0] = MEMORY[0x1E0C809B0];
    handler[1] = 3221225472;
    handler[2] = __62__NSPServerClient_getPrivacyProxyPolicyWithCompletionHandler___block_invoke;
    handler[3] = &unk_1E41377F0;
    v10 = v4;
    xpc_connection_send_message_with_reply(v6, v7, &self->super, handler);

  }
  else
  {
    (*((void (**)(id, _QWORD))v4 + 2))(v4, 0);
  }

}

void __62__NSPServerClient_getPrivacyProxyPolicyWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  BOOL v4;
  void *v5;
  uint64_t v6;
  id v7;

  v3 = a2;
  if (v3)
  {
    v7 = v3;
    v4 = MEMORY[0x1A1AEADA0]() == MEMORY[0x1E0C812F8];
    v3 = v7;
    if (v4)
    {
      get_nsdictionary_from_xpc_object(v7, "NSPServerPrivacyProxyPolicy");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = *(_QWORD *)(a1 + 32);
      if (v6)
        (*(void (**)(uint64_t, void *))(v6 + 16))(v6, v5);

      v3 = v7;
    }
  }

}

- (void)setPrivacyProxyPolicy:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  _xpc_connection_s *v9;
  xpc_object_t v10;
  const char *v11;
  id v12;
  void *v13;
  _QWORD handler[4];
  id v15;
  uint8_t buf[16];

  v6 = a3;
  v7 = a4;
  nplog_obj();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_debug_impl(&dword_19E8FE000, v8, OS_LOG_TYPE_DEBUG, "setting privacy proxy policy", buf, 2u);
  }

  -[NSPServerClient getConnection]((uint64_t)self);
  v9 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    v10 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_int64(v10, "NSPServerCommandType", 24);
    if (v6)
    {
      v12 = v10;
      v13 = (void *)_CFXPCCreateXPCObjectFromCFObject();
      xpc_dictionary_set_value(v12, "NSPServerPrivacyProxyPolicy", v13);

    }
    if (self)
      self = (NSPServerClient *)objc_getProperty(self, v11, 16, 1);
    handler[0] = MEMORY[0x1E0C809B0];
    handler[1] = 3221225472;
    handler[2] = __59__NSPServerClient_setPrivacyProxyPolicy_completionHandler___block_invoke;
    handler[3] = &unk_1E41377F0;
    v15 = v7;
    xpc_connection_send_message_with_reply(v9, v10, &self->super, handler);

  }
  else
  {
    (*((void (**)(id, _QWORD))v7 + 2))(v7, 0);
  }

}

void __59__NSPServerClient_setPrivacyProxyPolicy_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  _BOOL8 v6;
  _BOOL8 v7;
  uint64_t v8;
  xpc_object_t xdict;

  v3 = a2;
  v4 = v3;
  if (v3)
  {
    xdict = v3;
    v5 = MEMORY[0x1A1AEADA0](v3);
    v4 = xdict;
    if (v5 == MEMORY[0x1E0C812F8])
    {
      v6 = xpc_dictionary_get_BOOL(xdict, "NSPServerCommandResult");
      v4 = xdict;
      v7 = v6;
      v8 = *(_QWORD *)(a1 + 32);
      if (v8)
      {
        (*(void (**)(uint64_t, _BOOL8, xpc_object_t))(v8 + 16))(v8, v7, xdict);
        v4 = xdict;
      }
    }
  }

}

- (BOOL)removePrivacyProxyPolicy
{
  NSObject *v3;
  _xpc_connection_s *v4;
  xpc_object_t v5;
  xpc_object_t v6;
  void *v7;
  BOOL v8;
  uint8_t v10[16];

  nplog_obj();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v10 = 0;
    _os_log_debug_impl(&dword_19E8FE000, v3, OS_LOG_TYPE_DEBUG, "removing privacy proxy policy", v10, 2u);
  }

  -[NSPServerClient getConnection]((uint64_t)self);
  v4 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_int64(v5, "NSPServerCommandType", 25);
    v6 = xpc_connection_send_message_with_reply_sync(v4, v5);
    v7 = v6;
    v8 = v6 && MEMORY[0x1A1AEADA0](v6) == MEMORY[0x1E0C812F8] && xpc_dictionary_get_BOOL(v7, "NSPServerCommandResult");

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (void)mergePrivacyProxyPolicy:(id)a3
{
  id v4;
  NSObject *v5;
  _xpc_connection_s *v6;
  xpc_object_t v7;
  const char *v8;
  NSObject *v9;
  id v10;
  void *v11;
  _QWORD handler[4];
  id v13;
  uint8_t buf[8];
  uint64_t v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  nplog_obj();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_debug_impl(&dword_19E8FE000, v5, OS_LOG_TYPE_DEBUG, "merging privacy proxy policy with proxy traffic state", buf, 2u);
  }

  -[NSPServerClient getConnection]((uint64_t)self);
  v6 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v7 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_int64(v7, "NSPServerCommandType", 31);
    if (self)
      self = (NSPServerClient *)objc_getProperty(self, v8, 16, 1);
    handler[0] = MEMORY[0x1E0C809B0];
    handler[1] = 3221225472;
    handler[2] = __43__NSPServerClient_mergePrivacyProxyPolicy___block_invoke;
    handler[3] = &unk_1E41377F0;
    v13 = v4;
    xpc_connection_send_message_with_reply(v6, v7, &self->super, handler);

  }
  else
  {
    nplog_obj();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_19E8FE000, v9, OS_LOG_TYPE_ERROR, "Failed to get XPC connection", buf, 2u);
    }

    v10 = objc_alloc(MEMORY[0x1E0CB35C8]);
    v15 = *MEMORY[0x1E0CB2D68];
    v16[0] = CFSTR("IPC failed");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, &v15, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (xpc_object_t)objc_msgSend(v10, "initWithDomain:code:userInfo:", CFSTR("privacyProxyErrorDomain"), 1002, v11);

    (*((void (**)(id, _QWORD, xpc_object_t))v4 + 2))(v4, 0, v7);
  }

}

void __43__NSPServerClient_mergePrivacyProxyPolicy___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  BOOL v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;

  v3 = a2;
  if (v3)
  {
    v8 = v3;
    v4 = MEMORY[0x1A1AEADA0]() == MEMORY[0x1E0C812F8];
    v3 = v8;
    if (v4)
    {
      get_nsdictionary_from_xpc_object(v8, "NSPServerPrivacyProxyPolicy");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      +[NSPServerClient getErrorFromDict:]((uint64_t)NSPServerClient, v8);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = *(_QWORD *)(a1 + 32);
      if (v7)
        (*(void (**)(uint64_t, void *, void *))(v7 + 16))(v7, v5, v6);

      v3 = v8;
    }
  }

}

- (void)locationAuthorizationStatusWithCompletionHandler:(id)a3
{
  id v4;
  NSObject *v5;
  _xpc_connection_s *v6;
  xpc_object_t v7;
  const char *v8;
  _QWORD handler[4];
  id v10;
  uint8_t buf[16];

  v4 = a3;
  nplog_obj();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_debug_impl(&dword_19E8FE000, v5, OS_LOG_TYPE_DEBUG, "getting location authorization status", buf, 2u);
  }

  -[NSPServerClient getConnection]((uint64_t)self);
  v6 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v7 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_int64(v7, "NSPServerCommandType", 26);
    if (self)
      self = (NSPServerClient *)objc_getProperty(self, v8, 16, 1);
    handler[0] = MEMORY[0x1E0C809B0];
    handler[1] = 3221225472;
    handler[2] = __68__NSPServerClient_locationAuthorizationStatusWithCompletionHandler___block_invoke;
    handler[3] = &unk_1E41377F0;
    v10 = v4;
    xpc_connection_send_message_with_reply(v6, v7, &self->super, handler);

  }
  else
  {
    (*((void (**)(id, _QWORD))v4 + 2))(v4, 0);
  }

}

void __68__NSPServerClient_locationAuthorizationStatusWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void (*v7)(void);
  uint64_t v8;
  xpc_object_t xdict;

  v3 = a2;
  v4 = v3;
  xdict = v3;
  if (v3 && (v5 = MEMORY[0x1A1AEADA0](v3), v4 = xdict, v5 == MEMORY[0x1E0C812F8]))
  {
    xpc_dictionary_get_BOOL(xdict, "NSPServerCommandResult");
    v4 = xdict;
    v8 = *(_QWORD *)(a1 + 32);
    if (v8)
    {
      v7 = *(void (**)(void))(v8 + 16);
      goto LABEL_7;
    }
  }
  else
  {
    v6 = *(_QWORD *)(a1 + 32);
    if (v6)
    {
      v7 = *(void (**)(void))(v6 + 16);
LABEL_7:
      v7();
      v4 = xdict;
    }
  }

}

- (void)setLocationMonitorInterval:(double)a3
{
  NSObject *v5;
  _xpc_connection_s *v6;
  xpc_object_t v7;
  uint8_t v8[16];

  nplog_obj();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v8 = 0;
    _os_log_debug_impl(&dword_19E8FE000, v5, OS_LOG_TYPE_DEBUG, "setting location monitor time interval", v8, 2u);
  }

  -[NSPServerClient getConnection]((uint64_t)self);
  v6 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v7 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_int64(v7, "NSPServerCommandType", 27);
    xpc_dictionary_set_double(v7, "NSPServerLocationMonitorInterval", a3);
    xpc_connection_send_message(v6, v7);

  }
}

- (void)startLocationMonitor
{
  NSObject *v3;
  _xpc_connection_s *v4;
  xpc_object_t v5;
  uint8_t v6[16];

  nplog_obj();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v6 = 0;
    _os_log_debug_impl(&dword_19E8FE000, v3, OS_LOG_TYPE_DEBUG, "starting location monitor", v6, 2u);
  }

  -[NSPServerClient getConnection]((uint64_t)self);
  v4 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_int64(v5, "NSPServerCommandType", 28);
    xpc_connection_send_message(v4, v5);

  }
}

- (void)stopLocationMonitor
{
  NSObject *v3;
  _xpc_connection_s *v4;
  xpc_object_t v5;
  uint8_t v6[16];

  nplog_obj();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v6 = 0;
    _os_log_debug_impl(&dword_19E8FE000, v3, OS_LOG_TYPE_DEBUG, "stopping location monitor", v6, 2u);
  }

  -[NSPServerClient getConnection]((uint64_t)self);
  v4 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_int64(v5, "NSPServerCommandType", 29);
    xpc_connection_send_message(v4, v5);

  }
}

- (void)getPrivacyProxyInfoWithCompletionHandler:(id)a3
{
  id v4;
  NSObject *v5;
  _xpc_connection_s *v6;
  xpc_object_t v7;
  const char *v8;
  NSObject *v9;
  id v10;
  void *v11;
  _QWORD handler[4];
  id v13;
  uint8_t buf[8];
  uint64_t v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  nplog_obj();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_debug_impl(&dword_19E8FE000, v5, OS_LOG_TYPE_DEBUG, "Get privacy proxy info", buf, 2u);
  }

  -[NSPServerClient getConnection]((uint64_t)self);
  v6 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v7 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_int64(v7, "NSPServerCommandType", 32);
    if (self)
      self = (NSPServerClient *)objc_getProperty(self, v8, 16, 1);
    handler[0] = MEMORY[0x1E0C809B0];
    handler[1] = 3221225472;
    handler[2] = __60__NSPServerClient_getPrivacyProxyInfoWithCompletionHandler___block_invoke;
    handler[3] = &unk_1E41377F0;
    v13 = v4;
    xpc_connection_send_message_with_reply(v6, v7, &self->super, handler);

  }
  else
  {
    nplog_obj();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_19E8FE000, v9, OS_LOG_TYPE_ERROR, "Failed to get XPC connection", buf, 2u);
    }

    v10 = objc_alloc(MEMORY[0x1E0CB35C8]);
    v15 = *MEMORY[0x1E0CB2D68];
    v16[0] = CFSTR("IPC failed");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, &v15, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (xpc_object_t)objc_msgSend(v10, "initWithDomain:code:userInfo:", CFSTR("privacyProxyErrorDomain"), 1002, v11);

    (*((void (**)(id, _QWORD, xpc_object_t))v4 + 2))(v4, 0, v7);
  }

}

void __60__NSPServerClient_getPrivacyProxyInfoWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  const void *data;
  PrivacyProxyInfo *v6;
  void *v7;
  uint64_t v8;
  size_t length;

  v3 = a2;
  +[NSPServerClient getErrorFromDict:]((uint64_t)NSPServerClient, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  length = 0;
  data = xpc_dictionary_get_data(v3, "NSPServerPrivacyProxyInfo", &length);

  v6 = 0;
  if (data && length)
  {
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", data);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[PrivacyProxyInfo initWithData:]([PrivacyProxyInfo alloc], "initWithData:", v7);

  }
  v8 = *(_QWORD *)(a1 + 32);
  if (v8)
    (*(void (**)(uint64_t, PrivacyProxyInfo *, void *))(v8 + 16))(v8, v6, v4);

}

- (void)setGeohashSharingPreference:(BOOL)a3 completionHandler:(id)a4
{
  id v6;
  NSObject *v7;
  _xpc_connection_s *v8;
  xpc_object_t v9;
  const char *v10;
  NSObject *v11;
  id v12;
  void *v13;
  _QWORD handler[4];
  id v15;
  uint8_t buf[8];
  uint64_t v17;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x1E0C80C00];
  v6 = a4;
  nplog_obj();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_debug_impl(&dword_19E8FE000, v7, OS_LOG_TYPE_DEBUG, "Set Geohash sharing preference", buf, 2u);
  }

  -[NSPServerClient getConnection]((uint64_t)self);
  v8 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_int64(v9, "NSPServerCommandType", 39);
    xpc_dictionary_set_BOOL(v9, "NSPServerPrivacyProxyGeohashSharingEnabled", a3);
    if (self)
      self = (NSPServerClient *)objc_getProperty(self, v10, 16, 1);
    handler[0] = MEMORY[0x1E0C809B0];
    handler[1] = 3221225472;
    handler[2] = __65__NSPServerClient_setGeohashSharingPreference_completionHandler___block_invoke;
    handler[3] = &unk_1E41377F0;
    v15 = v6;
    xpc_connection_send_message_with_reply(v8, v9, &self->super, handler);

  }
  else
  {
    nplog_obj();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_19E8FE000, v11, OS_LOG_TYPE_ERROR, "Failed to get XPC connection", buf, 2u);
    }

    v12 = objc_alloc(MEMORY[0x1E0CB35C8]);
    v17 = *MEMORY[0x1E0CB2D68];
    v18[0] = CFSTR("IPC failed");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, &v17, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (xpc_object_t)objc_msgSend(v12, "initWithDomain:code:userInfo:", CFSTR("privacyProxyErrorDomain"), 1002, v13);

    (*((void (**)(id, xpc_object_t))v6 + 2))(v6, v9);
  }

}

void __65__NSPServerClient_setGeohashSharingPreference_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  void *v5;

  +[NSPServerClient getErrorFromDict:]((uint64_t)NSPServerClient, a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(a1 + 32);
  if (v4)
  {
    v5 = v3;
    (*(void (**)(void))(v4 + 16))();
    v3 = v5;
  }

}

- (void)getGeohashSharingPreferenceWithCompletionHandler:(id)a3
{
  id v4;
  NSObject *v5;
  _xpc_connection_s *v6;
  xpc_object_t v7;
  const char *v8;
  NSObject *v9;
  id v10;
  void *v11;
  _QWORD handler[4];
  id v13;
  uint8_t buf[8];
  uint64_t v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  nplog_obj();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_debug_impl(&dword_19E8FE000, v5, OS_LOG_TYPE_DEBUG, "Get Geohash sharing preference", buf, 2u);
  }

  -[NSPServerClient getConnection]((uint64_t)self);
  v6 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v7 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_int64(v7, "NSPServerCommandType", 40);
    if (self)
      self = (NSPServerClient *)objc_getProperty(self, v8, 16, 1);
    handler[0] = MEMORY[0x1E0C809B0];
    handler[1] = 3221225472;
    handler[2] = __68__NSPServerClient_getGeohashSharingPreferenceWithCompletionHandler___block_invoke;
    handler[3] = &unk_1E41377F0;
    v13 = v4;
    xpc_connection_send_message_with_reply(v6, v7, &self->super, handler);

  }
  else
  {
    nplog_obj();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_19E8FE000, v9, OS_LOG_TYPE_ERROR, "Failed to get XPC connection", buf, 2u);
    }

    v10 = objc_alloc(MEMORY[0x1E0CB35C8]);
    v15 = *MEMORY[0x1E0CB2D68];
    v16[0] = CFSTR("IPC failed");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, &v15, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (xpc_object_t)objc_msgSend(v10, "initWithDomain:code:userInfo:", CFSTR("privacyProxyErrorDomain"), 1002, v11);

    (*((void (**)(id, _QWORD, xpc_object_t))v4 + 2))(v4, 0, v7);
  }

}

void __68__NSPServerClient_getGeohashSharingPreferenceWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  _BOOL8 v4;
  uint64_t v5;
  id v6;

  v3 = a2;
  v4 = xpc_dictionary_get_BOOL(v3, "NSPServerPrivacyProxyGeohashSharingEnabled");
  +[NSPServerClient getErrorFromDict:]((uint64_t)NSPServerClient, v3);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
    (*(void (**)(uint64_t, _BOOL8, id))(v5 + 16))(v5, v4, v6);

}

- (void)setGeohashOverride:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  _xpc_connection_s *v9;
  xpc_object_t v10;
  const char *v11;
  NSObject *v12;
  id v13;
  void *v14;
  _QWORD handler[4];
  id v16;
  uint64_t v17;
  const __CFString *v18;
  uint8_t buf[4];
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  nplog_obj();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    v20 = v6;
    _os_log_debug_impl(&dword_19E8FE000, v8, OS_LOG_TYPE_DEBUG, "Set Geohash override to %@", buf, 0xCu);
  }

  -[NSPServerClient getConnection]((uint64_t)self);
  v9 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    v10 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_int64(v10, "NSPServerCommandType", 48);
    if (objc_msgSend(v6, "length"))
      xpc_dictionary_set_string(v10, "NSPServerPrivacyProxyGeohash", (const char *)objc_msgSend(v6, "UTF8String"));
    if (self)
      self = (NSPServerClient *)objc_getProperty(self, v11, 16, 1);
    handler[0] = MEMORY[0x1E0C809B0];
    handler[1] = 3221225472;
    handler[2] = __56__NSPServerClient_setGeohashOverride_completionHandler___block_invoke;
    handler[3] = &unk_1E41377F0;
    v16 = v7;
    xpc_connection_send_message_with_reply(v9, v10, &self->super, handler);

  }
  else
  {
    nplog_obj();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_19E8FE000, v12, OS_LOG_TYPE_ERROR, "Failed to get XPC connection", buf, 2u);
    }

    v13 = objc_alloc(MEMORY[0x1E0CB35C8]);
    v17 = *MEMORY[0x1E0CB2D68];
    v18 = CFSTR("IPC failed");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v18, &v17, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (xpc_object_t)objc_msgSend(v13, "initWithDomain:code:userInfo:", CFSTR("privacyProxyErrorDomain"), 1002, v14);

    (*((void (**)(id, xpc_object_t))v7 + 2))(v7, v10);
  }

}

void __56__NSPServerClient_setGeohashOverride_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  void *v5;

  +[NSPServerClient getErrorFromDict:]((uint64_t)NSPServerClient, a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(a1 + 32);
  if (v4)
  {
    v5 = v3;
    (*(void (**)(void))(v4 + 16))();
    v3 = v5;
  }

}

- (void)setPrivateAccessTokensEnabled:(BOOL)a3 completionHandler:(id)a4
{
  _BOOL4 v4;
  id v6;
  NSObject *v7;
  _xpc_connection_s *v8;
  xpc_object_t v9;
  const char *v10;
  NSObject *v11;
  id v12;
  void *v13;
  _QWORD handler[4];
  id v15;
  uint64_t v16;
  const __CFString *v17;
  uint8_t buf[4];
  _BOOL4 v19;
  uint64_t v20;

  v4 = a3;
  v20 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  nplog_obj();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 67109120;
    v19 = v4;
    _os_log_debug_impl(&dword_19E8FE000, v7, OS_LOG_TYPE_DEBUG, "Set private access tokens enabled state to %u", buf, 8u);
  }

  -[NSPServerClient getConnection]((uint64_t)self);
  v8 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_int64(v9, "NSPServerCommandType", 54);
    xpc_dictionary_set_BOOL(v9, "NSPServerPrivacyProxyPrivateAccessTokensEnabled", v4);
    if (self)
      self = (NSPServerClient *)objc_getProperty(self, v10, 16, 1);
    handler[0] = MEMORY[0x1E0C809B0];
    handler[1] = 3221225472;
    handler[2] = __67__NSPServerClient_setPrivateAccessTokensEnabled_completionHandler___block_invoke;
    handler[3] = &unk_1E41377F0;
    v15 = v6;
    xpc_connection_send_message_with_reply(v8, v9, &self->super, handler);

  }
  else
  {
    nplog_obj();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_19E8FE000, v11, OS_LOG_TYPE_ERROR, "Failed to get XPC connection", buf, 2u);
    }

    v12 = objc_alloc(MEMORY[0x1E0CB35C8]);
    v16 = *MEMORY[0x1E0CB2D68];
    v17 = CFSTR("IPC failed");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v17, &v16, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (xpc_object_t)objc_msgSend(v12, "initWithDomain:code:userInfo:", CFSTR("privacyProxyErrorDomain"), 1002, v13);

    (*((void (**)(id, xpc_object_t))v6 + 2))(v6, v9);
  }

}

void __67__NSPServerClient_setPrivateAccessTokensEnabled_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  void *v5;

  +[NSPServerClient getErrorFromDict:]((uint64_t)NSPServerClient, a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(a1 + 32);
  if (v4)
  {
    v5 = v3;
    (*(void (**)(void))(v4 + 16))();
    v3 = v5;
  }

}

- (void)getPrivateAccessTokensEnabledWithCompletionHandler:(id)a3
{
  id v4;
  NSObject *v5;
  _xpc_connection_s *v6;
  xpc_object_t v7;
  const char *v8;
  NSObject *v9;
  id v10;
  void *v11;
  _QWORD handler[4];
  id v13;
  uint8_t buf[8];
  uint64_t v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  nplog_obj();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_debug_impl(&dword_19E8FE000, v5, OS_LOG_TYPE_DEBUG, "Get private access tokens enabled state", buf, 2u);
  }

  -[NSPServerClient getConnection]((uint64_t)self);
  v6 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v7 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_int64(v7, "NSPServerCommandType", 55);
    if (self)
      self = (NSPServerClient *)objc_getProperty(self, v8, 16, 1);
    handler[0] = MEMORY[0x1E0C809B0];
    handler[1] = 3221225472;
    handler[2] = __70__NSPServerClient_getPrivateAccessTokensEnabledWithCompletionHandler___block_invoke;
    handler[3] = &unk_1E41377F0;
    v13 = v4;
    xpc_connection_send_message_with_reply(v6, v7, &self->super, handler);

  }
  else
  {
    nplog_obj();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_19E8FE000, v9, OS_LOG_TYPE_ERROR, "Failed to get XPC connection", buf, 2u);
    }

    v10 = objc_alloc(MEMORY[0x1E0CB35C8]);
    v15 = *MEMORY[0x1E0CB2D68];
    v16[0] = CFSTR("IPC failed");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, &v15, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (xpc_object_t)objc_msgSend(v10, "initWithDomain:code:userInfo:", CFSTR("privacyProxyErrorDomain"), 1002, v11);

    (*((void (**)(id, _QWORD, xpc_object_t))v4 + 2))(v4, 0, v7);
  }

}

void __70__NSPServerClient_getPrivateAccessTokensEnabledWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  _BOOL8 v4;
  uint64_t v5;
  id v6;

  v3 = a2;
  v4 = xpc_dictionary_get_BOOL(v3, "NSPServerPrivacyProxyPrivateAccessTokensEnabled");
  +[NSPServerClient getErrorFromDict:]((uint64_t)NSPServerClient, v3);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
    (*(void (**)(uint64_t, _BOOL8, id))(v5 + 16))(v5, v4, v6);

}

- (void)privateAccessTokensAllowTools:(BOOL)a3 completionHandler:(id)a4
{
  _BOOL4 v4;
  id v6;
  NSObject *v7;
  _xpc_connection_s *v8;
  xpc_object_t v9;
  const char *v10;
  NSObject *v11;
  id v12;
  void *v13;
  _QWORD handler[4];
  id v15;
  uint64_t v16;
  const __CFString *v17;
  uint8_t buf[4];
  _BOOL4 v19;
  uint64_t v20;

  v4 = a3;
  v20 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  nplog_obj();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 67109120;
    v19 = v4;
    _os_log_debug_impl(&dword_19E8FE000, v7, OS_LOG_TYPE_DEBUG, "Set private access tokens allow tools to %u", buf, 8u);
  }

  -[NSPServerClient getConnection]((uint64_t)self);
  v8 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_int64(v9, "NSPServerCommandType", 56);
    xpc_dictionary_set_BOOL(v9, "NSPServerPrivacyProxyPrivateAccessTokensEnabled", v4);
    if (self)
      self = (NSPServerClient *)objc_getProperty(self, v10, 16, 1);
    handler[0] = MEMORY[0x1E0C809B0];
    handler[1] = 3221225472;
    handler[2] = __67__NSPServerClient_privateAccessTokensAllowTools_completionHandler___block_invoke;
    handler[3] = &unk_1E41377F0;
    v15 = v6;
    xpc_connection_send_message_with_reply(v8, v9, &self->super, handler);

  }
  else
  {
    nplog_obj();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_19E8FE000, v11, OS_LOG_TYPE_ERROR, "Failed to get XPC connection", buf, 2u);
    }

    v12 = objc_alloc(MEMORY[0x1E0CB35C8]);
    v16 = *MEMORY[0x1E0CB2D68];
    v17 = CFSTR("IPC failed");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v17, &v16, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (xpc_object_t)objc_msgSend(v12, "initWithDomain:code:userInfo:", CFSTR("privacyProxyErrorDomain"), 1002, v13);

    (*((void (**)(id, xpc_object_t))v6 + 2))(v6, v9);
  }

}

void __67__NSPServerClient_privateAccessTokensAllowTools_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  void *v5;

  +[NSPServerClient getErrorFromDict:]((uint64_t)NSPServerClient, a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(a1 + 32);
  if (v4)
  {
    v5 = v3;
    (*(void (**)(void))(v4 + 16))();
    v3 = v5;
  }

}

- (void)setInProcessFlowDivert:(BOOL)a3 completionHandler:(id)a4
{
  _BOOL4 v4;
  id v6;
  NSObject *v7;
  _xpc_connection_s *v8;
  xpc_object_t v9;
  const char *v10;
  NSObject *v11;
  id v12;
  void *v13;
  _QWORD handler[4];
  id v15;
  uint64_t v16;
  const __CFString *v17;
  uint8_t buf[4];
  _BOOL4 v19;
  uint64_t v20;

  v4 = a3;
  v20 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  nplog_obj();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 67109120;
    v19 = v4;
    _os_log_debug_impl(&dword_19E8FE000, v7, OS_LOG_TYPE_DEBUG, "Set in-process flow divert enabled to %u", buf, 8u);
  }

  -[NSPServerClient getConnection]((uint64_t)self);
  v8 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_int64(v9, "NSPServerCommandType", 59);
    xpc_dictionary_set_BOOL(v9, "NSPServerPrivacyProxyInProcessFlowDivertEnabled", v4);
    if (self)
      self = (NSPServerClient *)objc_getProperty(self, v10, 16, 1);
    handler[0] = MEMORY[0x1E0C809B0];
    handler[1] = 3221225472;
    handler[2] = __60__NSPServerClient_setInProcessFlowDivert_completionHandler___block_invoke;
    handler[3] = &unk_1E41377F0;
    v15 = v6;
    xpc_connection_send_message_with_reply(v8, v9, &self->super, handler);

  }
  else
  {
    nplog_obj();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_19E8FE000, v11, OS_LOG_TYPE_ERROR, "Failed to get XPC connection", buf, 2u);
    }

    v12 = objc_alloc(MEMORY[0x1E0CB35C8]);
    v16 = *MEMORY[0x1E0CB2D68];
    v17 = CFSTR("IPC failed");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v17, &v16, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (xpc_object_t)objc_msgSend(v12, "initWithDomain:code:userInfo:", CFSTR("privacyProxyErrorDomain"), 1002, v13);

    (*((void (**)(id, xpc_object_t))v6 + 2))(v6, v9);
  }

}

void __60__NSPServerClient_setInProcessFlowDivert_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  void *v5;

  +[NSPServerClient getErrorFromDict:]((uint64_t)NSPServerClient, a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(a1 + 32);
  if (v4)
  {
    v5 = v3;
    (*(void (**)(void))(v4 + 16))();
    v3 = v5;
  }

}

- (void)setPreferredPathRoutingEnabled:(BOOL)a3 completionHandler:(id)a4
{
  _BOOL4 v4;
  id v6;
  NSObject *v7;
  _xpc_connection_s *v8;
  xpc_object_t v9;
  const char *v10;
  NSObject *v11;
  id v12;
  void *v13;
  _QWORD handler[4];
  id v15;
  uint64_t v16;
  const __CFString *v17;
  uint8_t buf[4];
  _BOOL4 v19;
  uint64_t v20;

  v4 = a3;
  v20 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  nplog_obj();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 67109120;
    v19 = v4;
    _os_log_debug_impl(&dword_19E8FE000, v7, OS_LOG_TYPE_DEBUG, "Set preferred path routing enabled to %u", buf, 8u);
  }

  -[NSPServerClient getConnection]((uint64_t)self);
  v8 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_int64(v9, "NSPServerCommandType", 57);
    xpc_dictionary_set_BOOL(v9, "NSPServerPrivacyProxyEnabled", v4);
    if (self)
      self = (NSPServerClient *)objc_getProperty(self, v10, 16, 1);
    handler[0] = MEMORY[0x1E0C809B0];
    handler[1] = 3221225472;
    handler[2] = __68__NSPServerClient_setPreferredPathRoutingEnabled_completionHandler___block_invoke;
    handler[3] = &unk_1E41377F0;
    v15 = v6;
    xpc_connection_send_message_with_reply(v8, v9, &self->super, handler);

  }
  else
  {
    nplog_obj();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_19E8FE000, v11, OS_LOG_TYPE_ERROR, "Failed to get XPC connection", buf, 2u);
    }

    v12 = objc_alloc(MEMORY[0x1E0CB35C8]);
    v16 = *MEMORY[0x1E0CB2D68];
    v17 = CFSTR("IPC failed");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v17, &v16, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (xpc_object_t)objc_msgSend(v12, "initWithDomain:code:userInfo:", CFSTR("privacyProxyErrorDomain"), 1002, v13);

    (*((void (**)(id, xpc_object_t))v6 + 2))(v6, v9);
  }

}

void __68__NSPServerClient_setPreferredPathRoutingEnabled_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  void *v5;

  +[NSPServerClient getErrorFromDict:]((uint64_t)NSPServerClient, a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(a1 + 32);
  if (v4)
  {
    v5 = v3;
    (*(void (**)(void))(v4 + 16))();
    v3 = v5;
  }

}

- (void)sendRTCReport:(int64_t)a3 errorCode:(int64_t)a4 url:(id)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  NSObject *v12;
  _xpc_connection_s *v13;
  xpc_object_t v14;
  const char *v15;
  id v16;
  id v17;
  NSObject *v18;
  id v19;
  void *v20;
  _QWORD handler[4];
  id v22;
  uint8_t buf[8];
  uint64_t v24;
  _QWORD v25[2];

  v25[1] = *MEMORY[0x1E0C80C00];
  v10 = a5;
  v11 = a6;
  nplog_obj();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_debug_impl(&dword_19E8FE000, v12, OS_LOG_TYPE_DEBUG, "send RTC report", buf, 2u);
  }

  -[NSPServerClient getConnection]((uint64_t)self);
  v13 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    v14 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_int64(v14, "NSPServerCommandType", 45);
    xpc_dictionary_set_int64(v14, "NSPServerPrivacyProxyRTCReportType", a3);
    xpc_dictionary_set_int64(v14, "NSPServerPrivacyProxyRTCReportErrorCode", a4);
    if (v10)
    {
      v16 = v14;
      v17 = v10;
      xpc_dictionary_set_string(v16, "NSPServerPrivacyProxyRTCReportURL", (const char *)objc_msgSend(v17, "UTF8String"));

    }
    if (self)
      self = (NSPServerClient *)objc_getProperty(self, v15, 16, 1);
    handler[0] = MEMORY[0x1E0C809B0];
    handler[1] = 3221225472;
    handler[2] = __65__NSPServerClient_sendRTCReport_errorCode_url_completionHandler___block_invoke;
    handler[3] = &unk_1E41377F0;
    v22 = v11;
    xpc_connection_send_message_with_reply(v13, v14, &self->super, handler);

  }
  else
  {
    nplog_obj();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_19E8FE000, v18, OS_LOG_TYPE_ERROR, "Failed to get XPC connection", buf, 2u);
    }

    v19 = objc_alloc(MEMORY[0x1E0CB35C8]);
    v24 = *MEMORY[0x1E0CB2D68];
    v25[0] = CFSTR("IPC failed");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v25, &v24, 1);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (xpc_object_t)objc_msgSend(v19, "initWithDomain:code:userInfo:", CFSTR("privacyProxyErrorDomain"), 1002, v20);

    (*((void (**)(id, xpc_object_t))v11 + 2))(v11, v14);
  }

}

void __65__NSPServerClient_sendRTCReport_errorCode_url_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  void *v5;

  +[NSPServerClient getErrorFromDict:]((uint64_t)NSPServerClient, a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(a1 + 32);
  if (v4)
  {
    v5 = v3;
    (*(void (**)(void))(v4 + 16))();
    v3 = v5;
  }

}

- (void)fetchPrivateAccessTokenWithFetcher:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  _xpc_connection_s *v9;
  xpc_object_t v10;
  xpc_object_t v11;
  const char *v12;
  xpc_object_t v13;
  id v14;
  id v15;
  void *v16;
  SEL v17;
  id v18;
  id v19;
  void *v20;
  SEL v21;
  id v22;
  id v23;
  void *v24;
  const char *v25;
  id Property;
  id v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  id v32;
  const char *v33;
  xpc_object_t v34;
  id v35;
  id v36;
  void *v37;
  SEL v38;
  id v39;
  id v40;
  void *v41;
  SEL v42;
  id v43;
  void *v44;
  uint64_t v45;
  void *v46;
  void *v47;
  id v48;
  void *v49;
  id v50;
  BOOL v51;
  BOOL v52;
  void *v54;
  const char *v55;
  void *v56;
  void *v57;
  id v58;
  void *v59;
  id v60;
  void *v61;
  NSObject *v62;
  NSObject *v63;
  id v64;
  void *v65;
  void *v66;
  NSPServerClient *selfa;
  xpc_object_t xdict;
  _xpc_connection_s *v69;
  void *v70;
  _QWORD *v71;
  _QWORD handler[4];
  id v73;
  _OWORD bytes[2];
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  uint64_t v79;
  const __CFString *v80;
  _BYTE v81[128];
  uint64_t v82;

  v82 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  nplog_obj();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    LOWORD(bytes[0]) = 0;
    _os_log_debug_impl(&dword_19E8FE000, v8, OS_LOG_TYPE_DEBUG, "Fetching Private Access Token", (uint8_t *)bytes, 2u);
  }

  -[NSPServerClient getTokenFetchConnection]((uint64_t)self);
  v9 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    selfa = self;
    v10 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_int64(v10, "NSPServerCommandType", 51);
    v11 = xpc_array_create(0, 0);
    v13 = xpc_dictionary_create(0, 0, 0);
    if (v6)
    {
      v14 = objc_getProperty(v6, v12, 48, 1);
      if (v14)
      {
        v15 = v13;
        v16 = (void *)_CFXPCCreateXPCObjectFromCFObject();
        xpc_dictionary_set_value(v15, "NSPServerPrivateAccessTokenChallenge", v16);

      }
      v18 = objc_getProperty(v6, v17, 64, 1);
      if (v18)
      {
        v19 = v13;
        v20 = (void *)_CFXPCCreateXPCObjectFromCFObject();
        xpc_dictionary_set_value(v19, "NSPServerPrivateAccessTokenKey", v20);

      }
      v22 = objc_getProperty(v6, v21, 72, 1);
      if (v22)
      {
        v23 = v13;
        v24 = (void *)_CFXPCCreateXPCObjectFromCFObject();
        xpc_dictionary_set_value(v23, "NSPServerPrivateAccessTokenOriginNameKey", v24);

      }
    }
    else
    {
      v22 = 0;
    }

    xpc_array_append_value(v11, v13);
    v77 = 0u;
    v78 = 0u;
    v75 = 0u;
    v76 = 0u;
    v70 = v7;
    v71 = v6;
    xdict = v10;
    v69 = v9;
    v66 = v13;
    if (v6)
      Property = objc_getProperty(v6, v25, 80, 1);
    else
      Property = 0;
    v27 = Property;
    v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v75, v81, 16);
    if (v28)
    {
      v29 = v28;
      v30 = *(_QWORD *)v76;
      do
      {
        v31 = 0;
        do
        {
          if (*(_QWORD *)v76 != v30)
            objc_enumerationMutation(v27);
          v32 = *(id *)(*((_QWORD *)&v75 + 1) + 8 * v31);
          v34 = xpc_dictionary_create(0, 0, 0);
          if (v32)
          {
            v35 = objc_getProperty(v32, v33, 48, 1);
            if (v35)
            {
              v36 = v34;
              v37 = (void *)_CFXPCCreateXPCObjectFromCFObject();
              xpc_dictionary_set_value(v36, "NSPServerPrivateAccessTokenChallenge", v37);

            }
            v39 = objc_getProperty(v32, v38, 64, 1);
            if (v39)
            {
              v40 = v34;
              v41 = (void *)_CFXPCCreateXPCObjectFromCFObject();
              xpc_dictionary_set_value(v40, "NSPServerPrivateAccessTokenKey", v41);

            }
            v32 = objc_getProperty(v32, v42, 72, 1);
            if (v32)
            {
              v43 = v34;
              v44 = (void *)_CFXPCCreateXPCObjectFromCFObject();
              xpc_dictionary_set_value(v43, "NSPServerPrivateAccessTokenOriginNameKey", v44);

            }
          }

          xpc_array_append_value(v11, v34);
          ++v31;
        }
        while (v29 != v31);
        v45 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v75, v81, 16);
        v29 = v45;
      }
      while (v45);
    }

    v46 = xdict;
    xpc_dictionary_set_value(xdict, "NSPServerPrivateAccessTokenChallenges", v11);
    v6 = v71;
    objc_msgSend(v71, "selectedOrigin");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    if (v47)
    {
      v48 = xdict;
      xpc_dictionary_set_string(v48, "NSPServerPrivateAccessTokenOriginName", (const char *)objc_msgSend(v47, "UTF8String"));

    }
    objc_msgSend(v71, "bundleID");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v69;
    v7 = v70;
    if (v49)
    {
      v50 = xdict;
      xpc_dictionary_set_string(v50, "NSPServerSigningIdentifier", (const char *)objc_msgSend(v49, "UTF8String"));

    }
    if (v71)
    {
      v51 = !v71[11] && v71[12] == 0;
      v52 = v51 && v71[13] == 0;
      if (!v52 || v71[14] != 0)
      {
        memset(bytes, 0, sizeof(bytes));
        objc_msgSend(v71, "auditToken");
        xpc_dictionary_set_data(xdict, "NSPServerEffectiveAuditToken", bytes, 0x20uLL);
      }
    }
    if (objc_msgSend(v71, "systemClient"))
      xpc_dictionary_set_BOOL(xdict, "NSPServerTokenSystemClient", 1);
    objc_msgSend(v71, "customAttester");
    v54 = (void *)objc_claimAutoreleasedReturnValue();

    if (v54)
    {
      objc_msgSend(v71, "customAttester");
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v56, "absoluteString");
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      if (v57)
      {
        v58 = xdict;
        xpc_dictionary_set_string(v58, "NSPServerPrivateAccessTokenCustomAttester", (const char *)objc_msgSend(v57, "UTF8String"));

      }
      objc_msgSend(v71, "customAttesterHeaders");
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      if (v59)
      {
        v60 = xdict;
        v61 = (void *)_CFXPCCreateXPCObjectFromCFObject();
        xpc_dictionary_set_value(v60, "NSPServerPrivateAccessTokenCustomAttesterHeaders", v61);

      }
    }
    if (selfa)
      v62 = objc_getProperty(selfa, v55, 16, 1);
    else
      v62 = 0;
    handler[0] = MEMORY[0x1E0C809B0];
    handler[1] = 3221225472;
    handler[2] = __72__NSPServerClient_fetchPrivateAccessTokenWithFetcher_completionHandler___block_invoke;
    handler[3] = &unk_1E41377F0;
    v73 = v70;
    xpc_connection_send_message_with_reply(v69, xdict, v62, handler);

  }
  else
  {
    nplog_obj();
    v63 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v63, OS_LOG_TYPE_ERROR))
    {
      LOWORD(bytes[0]) = 0;
      _os_log_error_impl(&dword_19E8FE000, v63, OS_LOG_TYPE_ERROR, "Failed to get XPC connection", (uint8_t *)bytes, 2u);
    }

    v64 = objc_alloc(MEMORY[0x1E0CB35C8]);
    v79 = *MEMORY[0x1E0CB2D68];
    v80 = CFSTR("IPC failed");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v80, &v79, 1);
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    v46 = (void *)objc_msgSend(v64, "initWithDomain:code:userInfo:", CFSTR("privacyProxyErrorDomain"), 1002, v65);

    (*((void (**)(id, _QWORD, void *))v7 + 2))(v7, 0, v46);
  }

}

void __72__NSPServerClient_fetchPrivateAccessTokenWithFetcher_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  id v6;

  v3 = a2;
  get_nsdata_from_xpc_object(v3, "NSPServerPrivateAccessToken");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  +[NSPServerClient getErrorFromDict:]((uint64_t)NSPServerClient, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
    (*(void (**)(uint64_t, id, void *))(v5 + 16))(v5, v6, v4);

}

- (void)fetchPrivateAccessTokenPairWithFetcher:(id)a3 completionHandler:(id)a4
{
  _QWORD *v6;
  id v7;
  NSObject *v8;
  const char *v9;
  id v10;
  const char *v11;
  void *v12;
  id v13;
  _xpc_connection_s *v14;
  xpc_object_t v15;
  xpc_object_t v16;
  SEL v17;
  id v18;
  id v19;
  void *v20;
  SEL v21;
  id v22;
  id v23;
  void *v24;
  SEL v25;
  id v26;
  id v27;
  void *v28;
  xpc_object_t v29;
  SEL v30;
  id v31;
  xpc_object_t v32;
  id v33;
  void *v34;
  void *v35;
  id v36;
  void *v37;
  id v38;
  BOOL v39;
  const char *v42;
  NSObject *v43;
  id v44;
  void *v45;
  id v46;
  void *v47;
  xpc_object_t xarray;
  xpc_object_t xarraya;
  _QWORD handler[4];
  id v51;
  _OWORD bytes[2];
  uint64_t v53;
  const __CFString *v54;
  uint64_t v55;
  _QWORD v56[2];

  v56[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  nplog_obj();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    LOWORD(bytes[0]) = 0;
    _os_log_debug_impl(&dword_19E8FE000, v8, OS_LOG_TYPE_DEBUG, "Fetching Private Access Token Pair", (uint8_t *)bytes, 2u);
  }

  if (v6
    && (v10 = objc_getProperty(v6, v9, 48, 1)) != 0
    && (v12 = v10,
        v13 = objc_getProperty(v6, v11, 56, 1),
        v13,
        v12,
        v13))
  {
    -[NSPServerClient getTokenFetchConnection]((uint64_t)self);
    v14 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
    if (v14)
    {
      v15 = xpc_dictionary_create(0, 0, 0);
      xpc_dictionary_set_int64(v15, "NSPServerCommandType", 51);
      xarray = xpc_array_create(0, 0);
      v16 = xpc_dictionary_create(0, 0, 0);
      v18 = objc_getProperty(v6, v17, 48, 1);
      if (v18)
      {
        v19 = v16;
        v20 = (void *)_CFXPCCreateXPCObjectFromCFObject();
        xpc_dictionary_set_value(v19, "NSPServerPrivateAccessTokenChallenge", v20);

      }
      v22 = objc_getProperty(v6, v21, 64, 1);
      if (v22)
      {
        v23 = v16;
        v24 = (void *)_CFXPCCreateXPCObjectFromCFObject();
        xpc_dictionary_set_value(v23, "NSPServerPrivateAccessTokenKey", v24);

      }
      v26 = objc_getProperty(v6, v25, 72, 1);
      if (v26)
      {
        v27 = v16;
        v28 = (void *)_CFXPCCreateXPCObjectFromCFObject();
        xpc_dictionary_set_value(v27, "NSPServerPrivateAccessTokenOriginNameKey", v28);

      }
      xpc_array_append_value(xarray, v16);
      v29 = xpc_dictionary_create(0, 0, 0);
      v31 = objc_getProperty(v6, v30, 56, 1);
      v32 = v16;
      if (v31)
      {
        v33 = v29;
        v34 = (void *)_CFXPCCreateXPCObjectFromCFObject();
        xpc_dictionary_set_value(v33, "NSPServerPrivateAccessPairedTokenChallenge", v34);

        v16 = v32;
      }

      xpc_array_append_value(xarray, v29);
      xpc_dictionary_set_value(v15, "NSPServerPrivateAccessTokenChallenges", xarray);
      objc_msgSend(v6, "selectedOrigin");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      if (v35)
      {
        v36 = v15;
        xpc_dictionary_set_string(v36, "NSPServerPrivateAccessTokenOriginName", (const char *)objc_msgSend(v35, "UTF8String"));

        v16 = v32;
      }

      objc_msgSend(v6, "bundleID");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      if (v37)
      {
        v38 = v15;
        xpc_dictionary_set_string(v38, "NSPServerSigningIdentifier", (const char *)objc_msgSend(v37, "UTF8String"));

        v16 = v32;
      }

      if (v6[11])
        v39 = 0;
      else
        v39 = v6[12] == 0;
      if (!v39 || v6[13] != 0 || v6[14] != 0)
      {
        memset(bytes, 0, sizeof(bytes));
        objc_msgSend(v6, "auditToken");
        xpc_dictionary_set_data(v15, "NSPServerEffectiveAuditToken", bytes, 0x20uLL);
      }
      if (objc_msgSend(v6, "systemClient", xarray))
        xpc_dictionary_set_BOOL(v15, "NSPServerTokenSystemClient", 1);
      xpc_dictionary_set_BOOL(v15, "NSPServerHasPairedTokenChallenges", 1);
      if (self)
        self = (NSPServerClient *)objc_getProperty(self, v42, 16, 1);
      handler[0] = MEMORY[0x1E0C809B0];
      handler[1] = 3221225472;
      handler[2] = __76__NSPServerClient_fetchPrivateAccessTokenPairWithFetcher_completionHandler___block_invoke;
      handler[3] = &unk_1E41377F0;
      v51 = v7;
      xpc_connection_send_message_with_reply(v14, v15, &self->super, handler);

    }
    else
    {
      nplog_obj();
      v43 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
      {
        LOWORD(bytes[0]) = 0;
        _os_log_error_impl(&dword_19E8FE000, v43, OS_LOG_TYPE_ERROR, "Failed to get XPC connection", (uint8_t *)bytes, 2u);
      }

      v44 = objc_alloc(MEMORY[0x1E0CB35C8]);
      v53 = *MEMORY[0x1E0CB2D68];
      v54 = CFSTR("IPC failed");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v54, &v53, 1);
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = (xpc_object_t)objc_msgSend(v44, "initWithDomain:code:userInfo:", CFSTR("privacyProxyErrorDomain"), 1002, v45);

      (*((void (**)(id, _QWORD, _QWORD, _QWORD, xpc_object_t))v7 + 2))(v7, 0, 0, 0, v15);
    }

  }
  else
  {
    v46 = objc_alloc(MEMORY[0x1E0CB35C8]);
    v55 = *MEMORY[0x1E0CB2D68];
    v56[0] = CFSTR("No paired challenges found");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v56, &v55, 1);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (_xpc_connection_s *)objc_msgSend(v46, "initWithDomain:code:userInfo:", CFSTR("privacyProxyErrorDomain"), 1004, v47);

    (*((void (**)(id, _QWORD, _QWORD, _QWORD, _xpc_connection_s *))v7 + 2))(v7, 0, 0, 0, v14);
  }

}

void __76__NSPServerClient_fetchPrivateAccessTokenPairWithFetcher_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;

  v3 = a2;
  get_nsdata_from_xpc_object(v3, "NSPServerPrivateAccessTokenPairLongLived");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  get_nsdata_from_xpc_object(v3, "NSPServerPrivateAccessTokenPairOneTime");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  get_nsdata_from_xpc_object(v3, "NSPServerPrivateAccessTokenPairOneTimeSalt");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[NSPServerClient getErrorFromDict:]((uint64_t)NSPServerClient, v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = *(_QWORD *)(a1 + 32);
  if (v7)
    (*(void (**)(uint64_t, id, void *, void *, void *))(v7 + 16))(v7, v8, v4, v5, v6);

}

- (BOOL)checkOriginAllowedAsThirdParty:(id)a3
{
  id v4;
  NSObject *v5;
  _xpc_connection_s *v6;
  NSObject *v7;
  id v8;
  NSObject *v9;
  xpc_object_t v10;
  BOOL v11;
  uint8_t v13[16];
  uint8_t buf[16];

  v4 = a3;
  nplog_obj();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19E8FE000, v5, OS_LOG_TYPE_INFO, "Checking origin for Private Access Token", buf, 2u);
  }

  -[NSPServerClient getTokenFetchConnection]((uint64_t)self);
  v6 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v7 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_int64(v7, "NSPServerCommandType", 60);
    v8 = v4;
    if (v8)
    {
      v9 = v7;
      xpc_dictionary_set_string(v9, "NSPServerPrivateAccessTokenOriginName", (const char *)objc_msgSend(v8, "UTF8String"));

    }
    v10 = xpc_connection_send_message_with_reply_sync(v6, v7);
    v11 = xpc_dictionary_get_BOOL(v10, "NSPServerPrivateAccessTokenOriginAllowed");

  }
  else
  {
    nplog_obj();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v13 = 0;
      _os_log_error_impl(&dword_19E8FE000, v7, OS_LOG_TYPE_ERROR, "Failed to get XPC connection", v13, 2u);
    }
    v11 = 0;
  }

  return v11;
}

- (void)startProxyToMPTCPConverterProxyWithCompletionHandler:(id)a3
{
  id v4;
  NSObject *v5;
  _xpc_connection_s *v6;
  xpc_object_t v7;
  const char *v8;
  NSObject *v9;
  id v10;
  void *v11;
  _QWORD handler[4];
  id v13;
  uint8_t buf[8];
  uint64_t v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  nplog_obj();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_debug_impl(&dword_19E8FE000, v5, OS_LOG_TYPE_DEBUG, "send start request to proxy socket based TCP connections to MPTCP converter proxy", buf, 2u);
  }

  -[NSPServerClient getConnection]((uint64_t)self);
  v6 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v7 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_int64(v7, "NSPServerCommandType", 52);
    if (self)
      self = (NSPServerClient *)objc_getProperty(self, v8, 16, 1);
    handler[0] = MEMORY[0x1E0C809B0];
    handler[1] = 3221225472;
    handler[2] = __72__NSPServerClient_startProxyToMPTCPConverterProxyWithCompletionHandler___block_invoke;
    handler[3] = &unk_1E41377F0;
    v13 = v4;
    xpc_connection_send_message_with_reply(v6, v7, &self->super, handler);

  }
  else
  {
    nplog_obj();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_19E8FE000, v9, OS_LOG_TYPE_ERROR, "Failed to get XPC connection", buf, 2u);
    }

    v10 = objc_alloc(MEMORY[0x1E0CB35C8]);
    v15 = *MEMORY[0x1E0CB2D68];
    v16[0] = CFSTR("IPC failed");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, &v15, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (xpc_object_t)objc_msgSend(v10, "initWithDomain:code:userInfo:", CFSTR("privacyProxyErrorDomain"), 1002, v11);

    (*((void (**)(id, xpc_object_t))v4 + 2))(v4, v7);
  }

}

void __72__NSPServerClient_startProxyToMPTCPConverterProxyWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  void *v5;

  +[NSPServerClient getErrorFromDict:]((uint64_t)NSPServerClient, a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(a1 + 32);
  if (v4)
  {
    v5 = v3;
    (*(void (**)(void))(v4 + 16))();
    v3 = v5;
  }

}

- (void)stopProxyToMPTCPConverterProxyWithCompletionHandler:(id)a3
{
  id v4;
  NSObject *v5;
  _xpc_connection_s *v6;
  xpc_object_t v7;
  const char *v8;
  NSObject *v9;
  id v10;
  void *v11;
  _QWORD handler[4];
  id v13;
  uint8_t buf[8];
  uint64_t v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  nplog_obj();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_debug_impl(&dword_19E8FE000, v5, OS_LOG_TYPE_DEBUG, "send stop request to proxy socket based TCP connections to MPTCP converter proxy", buf, 2u);
  }

  -[NSPServerClient getConnection]((uint64_t)self);
  v6 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v7 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_int64(v7, "NSPServerCommandType", 53);
    if (self)
      self = (NSPServerClient *)objc_getProperty(self, v8, 16, 1);
    handler[0] = MEMORY[0x1E0C809B0];
    handler[1] = 3221225472;
    handler[2] = __71__NSPServerClient_stopProxyToMPTCPConverterProxyWithCompletionHandler___block_invoke;
    handler[3] = &unk_1E41377F0;
    v13 = v4;
    xpc_connection_send_message_with_reply(v6, v7, &self->super, handler);

  }
  else
  {
    nplog_obj();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_19E8FE000, v9, OS_LOG_TYPE_ERROR, "Failed to get XPC connection", buf, 2u);
    }

    v10 = objc_alloc(MEMORY[0x1E0CB35C8]);
    v15 = *MEMORY[0x1E0CB2D68];
    v16[0] = CFSTR("IPC failed");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, &v15, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (xpc_object_t)objc_msgSend(v10, "initWithDomain:code:userInfo:", CFSTR("privacyProxyErrorDomain"), 1002, v11);

    (*((void (**)(id, xpc_object_t))v4 + 2))(v4, v7);
  }

}

void __71__NSPServerClient_stopProxyToMPTCPConverterProxyWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  void *v5;

  +[NSPServerClient getErrorFromDict:]((uint64_t)NSPServerClient, a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(a1 + 32);
  if (v4)
  {
    v5 = v3;
    (*(void (**)(void))(v4 + 16))();
    v3 = v5;
  }

}

- (void)dumpPrivacyProxyTokenEventsWithCompletionHandler:(id)a3 mostRecent:(BOOL)a4 limit:(unint64_t)a5 dumpStats:(BOOL)a6 completionHandler:(id)a7
{
  id v12;
  id v13;
  _xpc_connection_s *v14;
  xpc_object_t v15;
  id v16;
  id v17;
  const char *v18;
  _QWORD handler[4];
  id v20;

  v12 = a3;
  v13 = a7;
  -[NSPServerClient getConnection]((uint64_t)self);
  v14 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
  if (v14)
  {
    v15 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_int64(v15, "NSPServerCommandType", 66);
    v16 = v12;
    if (v16)
    {
      v17 = v15;
      xpc_dictionary_set_string(v17, "NSPServerPrivacyProxyTokenEventsVendor", (const char *)objc_msgSend(v16, "UTF8String"));

    }
    xpc_dictionary_set_BOOL(v15, "NSPServerPrivacyProxyTokenEventsMostRecent", a4);
    xpc_dictionary_set_uint64(v15, "NSPServerPrivacyProxyTokenEventsLimit", a5);
    xpc_dictionary_set_BOOL(v15, "NSPServerPrivacyProxyTokenEventsStats", a6);
    if (self)
      self = (NSPServerClient *)objc_getProperty(self, v18, 16, 1);
    handler[0] = MEMORY[0x1E0C809B0];
    handler[1] = 3221225472;
    handler[2] = __113__NSPServerClient_dumpPrivacyProxyTokenEventsWithCompletionHandler_mostRecent_limit_dumpStats_completionHandler___block_invoke;
    handler[3] = &unk_1E41377F0;
    v20 = v13;
    xpc_connection_send_message_with_reply(v14, v15, &self->super, handler);

  }
  else
  {
    (*((void (**)(id, _QWORD))v13 + 2))(v13, 0);
  }

}

void __113__NSPServerClient_dumpPrivacyProxyTokenEventsWithCompletionHandler_mostRecent_limit_dumpStats_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  void *v5;

  get_nsarray_from_xpc_object(a2, "NSPServerPrivacyProxyTokenEvents");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(a1 + 32);
  if (v4)
  {
    v5 = v3;
    (*(void (**)(void))(v4 + 16))();
    v3 = v5;
  }

}

- (void)setPrivacyProxyTokenEventsProactiveTokenFetchParams:(id)a3 lowerTokenCountThresholdStr:(id)a4 lowerTokenCountProbabilityStr:(id)a5 statsDurationStr:(id)a6 upperLWMCountThresholdStr:(id)a7 upperLWMCountProbabilityOffsetStr:(id)a8 completionHandler:(id)a9
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  _xpc_connection_s *v20;
  xpc_object_t v21;
  const char *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  int64_t v26;
  void *v27;
  void *v28;
  int64_t v29;
  double v30;
  int64_t v31;
  double v32;
  NSObject *v33;
  id v34;
  void *v35;
  id v36;
  id v37;
  uint8_t buf[16];
  _QWORD handler[4];
  id v40;
  uint64_t v41;
  _QWORD v42[2];

  v42[1] = *MEMORY[0x1E0C80C00];
  v15 = a3;
  v37 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  v36 = a8;
  v19 = a9;
  -[NSPServerClient getConnection]((uint64_t)self);
  v20 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
  if (v20)
  {
    v21 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_int64(v21, "NSPServerCommandType", 67);
    v23 = v15;
    if (v15)
    {
      v24 = objc_msgSend(v15, "caseInsensitiveCompare:", CFSTR("Yes"));
      if (!v24 || !objc_msgSend(v15, "caseInsensitiveCompare:", CFSTR("No")))
        xpc_dictionary_set_BOOL(v21, "NSPServerPrivacyProxyTokenEventsEnableProactiveTokenFetch", v24 == 0);
    }
    v25 = v17;
    if (v17)
    {
      v26 = objc_msgSend(v17, "integerValue");
      if (v26 >= 1)
        xpc_dictionary_set_uint64(v21, "NSPServerPrivacyProxyTokenEventsSetStatsDuration", v26);
    }
    v28 = v36;
    v27 = v37;
    if (v37)
    {
      v29 = objc_msgSend(v37, "integerValue");
      if (v29 >= 1)
        xpc_dictionary_set_uint64(v21, "NSPServerPrivacyProxyTokenEventsSetLowerTokenCountThreshold", v29);
    }
    if (v16)
    {
      objc_msgSend(v16, "doubleValue");
      if (v30 >= 0.0 && v30 <= 1.0)
        xpc_dictionary_set_double(v21, "NSPServerPrivacyProxyTokenEventsSetLowerTokenCountProbability", v30);
    }
    if (v18)
    {
      v31 = objc_msgSend(v18, "integerValue");
      if (v31 >= 1)
        xpc_dictionary_set_uint64(v21, "NSPServerPrivacyProxyTokenEventsSetUpperLWMCountThreshold", v31);
    }
    if (v36)
    {
      objc_msgSend(v36, "doubleValue");
      if (v32 >= 0.0 && v32 <= 1.0)
        xpc_dictionary_set_double(v21, "NSPServerPrivacyProxyTokenEventsSetUpperLWMCountProbabilityOffset", v32);
    }
    if (self)
      self = (NSPServerClient *)objc_getProperty(self, v22, 16, 1);
    handler[0] = MEMORY[0x1E0C809B0];
    handler[1] = 3221225472;
    handler[2] = __224__NSPServerClient_setPrivacyProxyTokenEventsProactiveTokenFetchParams_lowerTokenCountThresholdStr_lowerTokenCountProbabilityStr_statsDurationStr_upperLWMCountThresholdStr_upperLWMCountProbabilityOffsetStr_completionHandler___block_invoke;
    handler[3] = &unk_1E41377F0;
    v40 = v19;
    xpc_connection_send_message_with_reply(v20, v21, &self->super, handler);

  }
  else
  {
    v23 = v15;
    nplog_obj();
    v33 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_19E8FE000, v33, OS_LOG_TYPE_ERROR, "Failed to get XPC connection", buf, 2u);
    }

    v34 = objc_alloc(MEMORY[0x1E0CB35C8]);
    v41 = *MEMORY[0x1E0CB2D68];
    v42[0] = CFSTR("IPC failed");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v42, &v41, 1);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = (xpc_object_t)objc_msgSend(v34, "initWithDomain:code:userInfo:", CFSTR("privacyProxyErrorDomain"), 1002, v35);

    (*((void (**)(id, xpc_object_t))v19 + 2))(v19, v21);
    v25 = v17;
    v28 = v36;
    v27 = v37;
  }

}

void __224__NSPServerClient_setPrivacyProxyTokenEventsProactiveTokenFetchParams_lowerTokenCountThresholdStr_lowerTokenCountProbabilityStr_statsDurationStr_upperLWMCountThresholdStr_upperLWMCountProbabilityOffsetStr_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  void *v5;

  +[NSPServerClient getErrorFromDict:]((uint64_t)NSPServerClient, a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(a1 + 32);
  if (v4)
  {
    v5 = v3;
    (*(void (**)(void))(v4 + 16))();
    v3 = v5;
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fetchTokenConnection, 0);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end
