@implementation CSSpeechUaapXPCClient

- (CSSpeechUaapXPCClient)init
{
  id v2;
  xpc_connection_t mach_service;
  void *v4;
  dispatch_queue_t v5;
  void *v6;
  _xpc_connection_s *v7;
  _QWORD v9[4];
  id v10;
  id location;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)CSSpeechUaapXPCClient;
  v2 = -[CSSpeechUaapXPCClient init](&v12, sel_init);
  if (v2)
  {
    CSLogInitIfNeeded();
    mach_service = xpc_connection_create_mach_service("com.apple.corespeech.corespeechd.uaapservice", 0, 0);
    v4 = (void *)*((_QWORD *)v2 + 1);
    *((_QWORD *)v2 + 1) = mach_service;

    v5 = dispatch_queue_create("CSSpeechUaapXPCClient", 0);
    v6 = (void *)*((_QWORD *)v2 + 2);
    *((_QWORD *)v2 + 2) = v5;

    xpc_connection_set_target_queue(*((xpc_connection_t *)v2 + 1), *((dispatch_queue_t *)v2 + 2));
    objc_initWeak(&location, v2);
    v7 = (_xpc_connection_s *)*((_QWORD *)v2 + 1);
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __29__CSSpeechUaapXPCClient_init__block_invoke;
    v9[3] = &unk_1E7C28B80;
    objc_copyWeak(&v10, &location);
    xpc_connection_set_event_handler(v7, v9);
    xpc_connection_activate(*((xpc_connection_t *)v2 + 1));
    objc_destroyWeak(&v10);
    objc_destroyWeak(&location);
  }
  return (CSSpeechUaapXPCClient *)v2;
}

- (void)_handleConnectionError:(id)a3
{
  id v3;
  id v4;
  NSObject *v5;
  _BOOL4 v6;
  const char *v8;
  NSObject *v9;
  int v10;
  const char *v11;
  __int16 v12;
  const char *string;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (v3)
  {
    v4 = (id)MEMORY[0x1E0C81260];
    v5 = *MEMORY[0x1E0D18F60];
    v6 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_ERROR);
    if (v3 == v4 || v3 == (id)MEMORY[0x1E0C81258])
    {
      if (v6)
      {
        v10 = 136315138;
        v11 = "-[CSSpeechUaapXPCClient _handleConnectionError:]";
        _os_log_error_impl(&dword_1C2614000, v5, OS_LOG_TYPE_ERROR, "%s CSSpeechUaapXPCClient listener disconnected", (uint8_t *)&v10, 0xCu);
      }
    }
    else if (v6)
    {
      v8 = (const char *)*MEMORY[0x1E0C81270];
      v9 = v5;
      v10 = 136315394;
      v11 = "-[CSSpeechUaapXPCClient _handleConnectionError:]";
      v12 = 2080;
      string = xpc_dictionary_get_string(v3, v8);
      _os_log_error_impl(&dword_1C2614000, v9, OS_LOG_TYPE_ERROR, "%s CSSpeechUaapXPCConnection error: %s", (uint8_t *)&v10, 0x16u);

    }
  }

}

- (void)registerUaapApp:(id)a3 withAssetFiles:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  xpc_object_t empty;
  uint64_t v12;
  id v13;
  id v14;
  id v15;
  xpc_object_t v16;
  OS_xpc_object *connection;
  NSObject *queue;
  id v19;
  uint64_t i;
  uint64_t j;
  _QWORD v22[4];
  id v23;
  _QWORD v24[4];
  id v25;
  xpc_object_t v26[2];
  char *v27[2];
  xpc_object_t values[2];
  char *keys[2];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  empty = xpc_array_create_empty();
  v12 = MEMORY[0x1E0C809B0];
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __67__CSSpeechUaapXPCClient_registerUaapApp_withAssetFiles_completion___block_invoke;
  v24[3] = &unk_1E7C25E78;
  v13 = empty;
  v25 = v13;
  objc_msgSend(v9, "enumerateObjectsUsingBlock:", v24);
  *(_OWORD *)keys = xmmword_1E7C25ED8;
  v14 = objc_retainAutorelease(v8);
  values[0] = xpc_string_create((const char *)objc_msgSend(v14, "UTF8String"));
  v15 = v13;
  values[1] = v15;
  *(_OWORD *)v27 = xmmword_1E7C25EE8;
  v26[0] = xpc_uint64_create(1uLL);
  v26[1] = xpc_dictionary_create((const char *const *)keys, values, 2uLL);
  v16 = xpc_dictionary_create((const char *const *)v27, v26, 2uLL);
  connection = self->_connection;
  queue = self->_queue;
  v22[0] = v12;
  v22[1] = 3221225472;
  v22[2] = __67__CSSpeechUaapXPCClient_registerUaapApp_withAssetFiles_completion___block_invoke_2;
  v22[3] = &unk_1E7C28C08;
  v19 = v10;
  v23 = v19;
  xpc_connection_send_message_with_reply(connection, v16, queue, v22);

  for (i = 1; i != -1; --i)
  for (j = 1; j != -1; --j)

}

- (void)registerUaapApp:(id)a3 forLocale:(id)a4 withAssetFiles:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  xpc_object_t empty;
  id v15;
  id v16;
  id v17;
  id v18;
  xpc_object_t v19;
  OS_xpc_object *connection;
  NSObject *queue;
  id v22;
  uint64_t i;
  uint64_t j;
  _QWORD v25[4];
  id v26;
  _QWORD v27[4];
  id v28;
  xpc_object_t v29[2];
  char *v30[2];
  xpc_object_t values[3];
  char *keys[2];
  const char *v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  empty = xpc_array_create_empty();
  v27[0] = MEMORY[0x1E0C809B0];
  v27[1] = 3221225472;
  v27[2] = __77__CSSpeechUaapXPCClient_registerUaapApp_forLocale_withAssetFiles_completion___block_invoke;
  v27[3] = &unk_1E7C25E78;
  v15 = empty;
  v28 = v15;
  objc_msgSend(v12, "enumerateObjectsUsingBlock:", v27);
  *(_OWORD *)keys = xmmword_1E7C25E98;
  v33 = "locale";
  v16 = objc_retainAutorelease(v10);
  values[0] = xpc_string_create((const char *)objc_msgSend(v16, "UTF8String"));
  v17 = v15;
  values[1] = v17;
  v18 = objc_retainAutorelease(v11);
  values[2] = xpc_string_create((const char *)objc_msgSend(v18, "UTF8String"));
  *(_OWORD *)v30 = xmmword_1E7C25EE8;
  v29[0] = xpc_uint64_create(2uLL);
  v29[1] = xpc_dictionary_create((const char *const *)keys, values, 3uLL);
  v19 = xpc_dictionary_create((const char *const *)v30, v29, 2uLL);
  connection = self->_connection;
  queue = self->_queue;
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __77__CSSpeechUaapXPCClient_registerUaapApp_forLocale_withAssetFiles_completion___block_invoke_2;
  v25[3] = &unk_1E7C28C08;
  v22 = v13;
  v26 = v22;
  xpc_connection_send_message_with_reply(connection, v19, queue, v25);

  for (i = 1; i != -1; --i)
  for (j = 2; j != -1; --j)

}

- (void)registerMultilingualUaapApp:(id)a3 withAssetFiles:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  xpc_object_t empty;
  uint64_t v12;
  id v13;
  id v14;
  id v15;
  xpc_object_t v16;
  OS_xpc_object *connection;
  NSObject *queue;
  id v19;
  uint64_t i;
  uint64_t j;
  _QWORD v22[4];
  id v23;
  _QWORD v24[4];
  id v25;
  xpc_object_t v26[2];
  char *v27[2];
  xpc_object_t values[2];
  char *keys[2];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  empty = xpc_dictionary_create_empty();
  v12 = MEMORY[0x1E0C809B0];
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __79__CSSpeechUaapXPCClient_registerMultilingualUaapApp_withAssetFiles_completion___block_invoke;
  v24[3] = &unk_1E7C25EB8;
  v13 = empty;
  v25 = v13;
  objc_msgSend(v9, "enumerateKeysAndObjectsUsingBlock:", v24);
  *(_OWORD *)keys = xmmword_1E7C25ED8;
  v14 = objc_retainAutorelease(v8);
  values[0] = xpc_string_create((const char *)objc_msgSend(v14, "UTF8String"));
  v15 = v13;
  values[1] = v15;
  *(_OWORD *)v27 = xmmword_1E7C25EE8;
  v26[0] = xpc_uint64_create(3uLL);
  v26[1] = xpc_dictionary_create((const char *const *)keys, values, 2uLL);
  v16 = xpc_dictionary_create((const char *const *)v27, v26, 2uLL);
  connection = self->_connection;
  queue = self->_queue;
  v22[0] = v12;
  v22[1] = 3221225472;
  v22[2] = __79__CSSpeechUaapXPCClient_registerMultilingualUaapApp_withAssetFiles_completion___block_invoke_3;
  v22[3] = &unk_1E7C28C08;
  v19 = v10;
  v23 = v19;
  xpc_connection_send_message_with_reply(connection, v16, queue, v22);

  for (i = 1; i != -1; --i)
  for (j = 1; j != -1; --j)

}

- (void)registerDatapackUpdate
{
  xpc_object_t v3;
  xpc_object_t values;
  char *keys[2];

  keys[1] = *(char **)MEMORY[0x1E0C80C00];
  keys[0] = "messageType";
  values = xpc_uint64_create(4uLL);
  v3 = xpc_dictionary_create((const char *const *)keys, &values, 1uLL);
  xpc_connection_send_message(self->_connection, v3);

}

- (void)invalidate
{
  OS_xpc_object *connection;
  NSObject *v4;
  OS_xpc_object *v5;
  int v6;
  const char *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  connection = self->_connection;
  if (connection)
  {
    v4 = *MEMORY[0x1E0D18F60];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
    {
      v6 = 136315138;
      v7 = "-[CSSpeechUaapXPCClient invalidate]";
      _os_log_impl(&dword_1C2614000, v4, OS_LOG_TYPE_DEFAULT, "%s Invalidating CSSpeechUaapXPCClient", (uint8_t *)&v6, 0xCu);
      connection = self->_connection;
    }
    xpc_connection_cancel(connection);
    v5 = self->_connection;
    self->_connection = 0;

  }
}

- (void)dealloc
{
  objc_super v3;

  -[CSSpeechUaapXPCClient invalidate](self, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)CSSpeechUaapXPCClient;
  -[CSSpeechUaapXPCClient dealloc](&v3, sel_dealloc);
}

- (OS_xpc_object)connection
{
  return self->_connection;
}

- (void)setConnection:(id)a3
{
  objc_storeStrong((id *)&self->_connection, a3);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_connection, 0);
}

void __79__CSSpeechUaapXPCClient_registerMultilingualUaapApp_withAssetFiles_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  xpc_object_t empty;
  void *v8;
  id v9;
  const char *v10;
  xpc_object_t value;
  _QWORD v12[4];
  id v13;

  v5 = a3;
  v6 = a2;
  empty = xpc_array_create_empty();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __79__CSSpeechUaapXPCClient_registerMultilingualUaapApp_withAssetFiles_completion___block_invoke_2;
  v12[3] = &unk_1E7C25E78;
  v13 = empty;
  value = empty;
  objc_msgSend(v5, "enumerateObjectsUsingBlock:", v12);

  v8 = *(void **)(a1 + 32);
  v9 = objc_retainAutorelease(v6);
  v10 = (const char *)objc_msgSend(v9, "UTF8String");

  xpc_dictionary_set_value(v8, v10, value);
}

void __79__CSSpeechUaapXPCClient_registerMultilingualUaapApp_withAssetFiles_completion___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  void *string;
  int64_t int64;
  const char *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  string = (void *)xpc_dictionary_get_string(v3, "errorDomain");
  if (string)
  {
    int64 = xpc_dictionary_get_int64(v3, "errorCode");
    v6 = xpc_dictionary_get_string(v3, "errorMessage");
    v7 = (void *)MEMORY[0x1E0CB35C8];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", string);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = *MEMORY[0x1E0CB2D50];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = v9;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, &v12, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "errorWithDomain:code:userInfo:", v8, int64, v10);
    string = (void *)objc_claimAutoreleasedReturnValue();

  }
  v11 = *(_QWORD *)(a1 + 32);
  if (v11)
    (*(void (**)(uint64_t, void *))(v11 + 16))(v11, string);

}

void __79__CSSpeechUaapXPCClient_registerMultilingualUaapApp_withAssetFiles_completion___block_invoke_2(uint64_t a1, id a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  v3 = xpc_string_create((const char *)objc_msgSend(objc_retainAutorelease(a2), "UTF8String"));
  xpc_array_append_value(v2, v3);

}

void __77__CSSpeechUaapXPCClient_registerUaapApp_forLocale_withAssetFiles_completion___block_invoke(uint64_t a1, id a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  v3 = xpc_string_create((const char *)objc_msgSend(objc_retainAutorelease(a2), "UTF8String"));
  xpc_array_append_value(v2, v3);

}

void __77__CSSpeechUaapXPCClient_registerUaapApp_forLocale_withAssetFiles_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *string;
  int64_t int64;
  const char *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  string = (void *)xpc_dictionary_get_string(v3, "errorDomain");
  if (string)
  {
    int64 = xpc_dictionary_get_int64(v3, "errorCode");
    v6 = xpc_dictionary_get_string(v3, "errorMessage");
    v7 = (void *)MEMORY[0x1E0CB35C8];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", string);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = *MEMORY[0x1E0CB2D50];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = v9;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, &v12, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "errorWithDomain:code:userInfo:", v8, int64, v10);
    string = (void *)objc_claimAutoreleasedReturnValue();

  }
  v11 = *(_QWORD *)(a1 + 32);
  if (v11)
    (*(void (**)(uint64_t, void *))(v11 + 16))(v11, string);

}

void __67__CSSpeechUaapXPCClient_registerUaapApp_withAssetFiles_completion___block_invoke(uint64_t a1, id a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  v3 = xpc_string_create((const char *)objc_msgSend(objc_retainAutorelease(a2), "UTF8String"));
  xpc_array_append_value(v2, v3);

}

void __67__CSSpeechUaapXPCClient_registerUaapApp_withAssetFiles_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *string;
  int64_t int64;
  const char *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  string = (void *)xpc_dictionary_get_string(v3, "errorDomain");
  if (string)
  {
    int64 = xpc_dictionary_get_int64(v3, "errorCode");
    v6 = xpc_dictionary_get_string(v3, "errorMessage");
    v7 = (void *)MEMORY[0x1E0CB35C8];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", string);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = *MEMORY[0x1E0CB2D50];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = v9;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, &v12, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "errorWithDomain:code:userInfo:", v8, int64, v10);
    string = (void *)objc_claimAutoreleasedReturnValue();

  }
  v11 = *(_QWORD *)(a1 + 32);
  if (v11)
    (*(void (**)(uint64_t, void *))(v11 + 16))(v11, string);

}

void __29__CSSpeechUaapXPCClient_init__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  const char *v6;
  id WeakRetained;
  int v8;
  const char *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = v3;
  if (v3)
  {
    if (MEMORY[0x1C3BC4CBC](v3) == MEMORY[0x1E0C81310])
    {
      WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
      objc_msgSend(WeakRetained, "_handleConnectionError:", v4);

      goto LABEL_9;
    }
    v5 = *MEMORY[0x1E0D18F60];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
    {
      v8 = 136315138;
      v9 = "-[CSSpeechUaapXPCClient init]_block_invoke";
      v6 = "%s CSSpeechUaapXPCClient got an event it can't handle";
LABEL_7:
      _os_log_impl(&dword_1C2614000, v5, OS_LOG_TYPE_DEFAULT, v6, (uint8_t *)&v8, 0xCu);
    }
  }
  else
  {
    v5 = *MEMORY[0x1E0D18F60];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
    {
      v8 = 136315138;
      v9 = "-[CSSpeechUaapXPCClient init]_block_invoke";
      v6 = "%s CSSpeechUaapXPCClient received an empty connection event";
      goto LABEL_7;
    }
  }
LABEL_9:

}

@end
