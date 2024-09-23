@implementation CSVoiceTriggerXPCClient

- (CSVoiceTriggerXPCClient)init
{
  CSVoiceTriggerXPCClient *v2;
  xpc_connection_t mach_service;
  OS_xpc_object *xpcConnection;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CSVoiceTriggerXPCClient;
  v2 = -[CSVoiceTriggerXPCClient init](&v6, sel_init);
  if (v2)
  {
    CSLogInitIfNeeded();
    mach_service = xpc_connection_create_mach_service("com.apple.corespeech.voicetriggerservice", 0, 0);
    xpcConnection = v2->_xpcConnection;
    v2->_xpcConnection = mach_service;

  }
  return v2;
}

- (void)connect
{
  OS_xpc_object *xpcConnection;
  _QWORD v4[4];
  id v5;
  id location;

  objc_initWeak(&location, self);
  xpcConnection = self->_xpcConnection;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __34__CSVoiceTriggerXPCClient_connect__block_invoke;
  v4[3] = &unk_1E7C28B80;
  objc_copyWeak(&v5, &location);
  xpc_connection_set_event_handler(xpcConnection, v4);
  xpc_connection_activate(self->_xpcConnection);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (void)dealloc
{
  OS_xpc_object *xpcConnection;
  NSObject *v4;
  OS_xpc_object *v5;
  objc_super v6;
  uint8_t buf[4];
  const char *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  xpcConnection = self->_xpcConnection;
  if (xpcConnection)
  {
    v4 = *MEMORY[0x1E0D18F60];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v8 = "-[CSVoiceTriggerXPCClient dealloc]";
      _os_log_impl(&dword_1C2614000, v4, OS_LOG_TYPE_DEFAULT, "%s disconnect VoiceTriggerXPCClient", buf, 0xCu);
      xpcConnection = self->_xpcConnection;
    }
    xpc_connection_cancel(xpcConnection);
    v5 = self->_xpcConnection;
    self->_xpcConnection = 0;

  }
  v6.receiver = self;
  v6.super_class = (Class)CSVoiceTriggerXPCClient;
  -[CSVoiceTriggerXPCClient dealloc](&v6, sel_dealloc);
}

- (void)_handleListenerEvent:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  const char *v7;
  NSObject *v8;
  uint32_t v9;
  NSObject *v10;
  int v11;
  const char *v12;
  __int16 v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  if (v4)
  {
    if (MEMORY[0x1C3BC4CBC](v4) == MEMORY[0x1E0C81310])
    {
      -[CSVoiceTriggerXPCClient _handleListenerError:](self, "_handleListenerError:", v5);
      goto LABEL_9;
    }
    v6 = *MEMORY[0x1E0D18F60];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_ERROR))
    {
      v11 = 136315138;
      v12 = "-[CSVoiceTriggerXPCClient _handleListenerEvent:]";
      v7 = "%s ignore unknown types of message ";
      v8 = v6;
      v9 = 12;
LABEL_7:
      _os_log_error_impl(&dword_1C2614000, v8, OS_LOG_TYPE_ERROR, v7, (uint8_t *)&v11, v9);
    }
  }
  else
  {
    v10 = *MEMORY[0x1E0D18F60];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_ERROR))
    {
      v11 = 136315394;
      v12 = "-[CSVoiceTriggerXPCClient _handleListenerEvent:]";
      v13 = 2050;
      v14 = 0;
      v7 = "%s cannot handle event : event = %{public}p";
      v8 = v10;
      v9 = 22;
      goto LABEL_7;
    }
  }
LABEL_9:

}

- (void)_handleListenerError:(id)a3
{
  id v4;
  void *v5;
  NSObject *v7;
  const char *v8;
  const char *string;
  NSObject *v10;
  int v12;
  const char *v13;
  __int16 v14;
  const char *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  if (!v4)
  {
    v10 = *MEMORY[0x1E0D18F60];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_ERROR))
      goto LABEL_13;
    v12 = 136315394;
    v13 = "-[CSVoiceTriggerXPCClient _handleListenerError:]";
    v14 = 2050;
    v15 = 0;
    v8 = "%s cannot handle error : error = %{public}p";
    goto LABEL_15;
  }
  if (v4 != (id)MEMORY[0x1E0C81260] && v4 != (id)MEMORY[0x1E0C81258])
  {
    string = xpc_dictionary_get_string(v4, (const char *)*MEMORY[0x1E0C81270]);
    v10 = *MEMORY[0x1E0D18F60];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_ERROR))
      goto LABEL_13;
    v12 = 136315394;
    v13 = "-[CSVoiceTriggerXPCClient _handleListenerError:]";
    v14 = 2082;
    v15 = string;
    v8 = "%s connection error: %{public}s";
LABEL_15:
    _os_log_error_impl(&dword_1C2614000, v10, OS_LOG_TYPE_ERROR, v8, (uint8_t *)&v12, 0x16u);
    goto LABEL_13;
  }
  v7 = *MEMORY[0x1E0D18F60];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
  {
    v12 = 136315138;
    v13 = "-[CSVoiceTriggerXPCClient _handleListenerError:]";
    _os_log_impl(&dword_1C2614000, v7, OS_LOG_TYPE_DEFAULT, "%s Listener connection disconnected", (uint8_t *)&v12, 0xCu);
  }
  -[CSVoiceTriggerXPCClient _handleListenerDisconnectedError:](self, "_handleListenerDisconnectedError:", v5);
LABEL_13:

}

- (void)_handleListenerDisconnectedError:(id)a3
{
  void *v4;
  char v5;
  id WeakRetained;

  -[CSVoiceTriggerXPCClient delegate](self, "delegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "voiceTriggerXPCClient:didDisconnect:", self, 1);

  }
}

- (void)enableVoiceTrigger:(BOOL)a3 withAssertion:(id)a4 timestamp:(double)a5
{
  id v8;
  id v9;
  xpc_object_t v10;
  id v11;
  xpc_object_t v12;
  uint64_t i;
  uint64_t j;
  xpc_object_t v15[2];
  char *v16[2];
  xpc_object_t values[4];
  char *keys[2];
  __int128 v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v8 = a4;
  *(_OWORD *)keys = xmmword_1E7C28BA0;
  v19 = *(_OWORD *)&off_1E7C28BB0;
  values[0] = xpc_int64_create(3);
  values[1] = xpc_BOOL_create(a3);
  v9 = objc_retainAutorelease(v8);
  values[2] = xpc_string_create((const char *)objc_msgSend(v9, "UTF8String"));
  values[3] = xpc_double_create(a5);
  v10 = xpc_dictionary_create((const char *const *)keys, values, 4uLL);
  *(_OWORD *)v16 = xmmword_1E7C28BF0;
  v15[0] = xpc_int64_create(2);
  v11 = v10;
  v15[1] = v11;
  v12 = xpc_dictionary_create((const char *const *)v16, v15, 2uLL);
  -[CSVoiceTriggerXPCClient _sendMessage:connection:completion:](self, "_sendMessage:connection:completion:", v12, self->_xpcConnection, 0, v15[0]);

  for (i = 1; i != -1; --i)
  for (j = 3; j != -1; --j)

}

- (void)setPhraseSpotterBypassing:(BOOL)a3 timeout:(double)a4
{
  xpc_object_t v7;
  id v8;
  xpc_object_t v9;
  uint64_t i;
  uint64_t j;
  xpc_object_t v12[2];
  char *v13[2];
  xpc_object_t values[3];
  char *keys[2];
  const char *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  *(_OWORD *)keys = xmmword_1E7C28BC0;
  v16 = "bypassTimeout";
  values[0] = xpc_int64_create(1);
  values[1] = xpc_BOOL_create(a3);
  values[2] = xpc_double_create(a4);
  v7 = xpc_dictionary_create((const char *const *)keys, values, 3uLL);
  *(_OWORD *)v13 = xmmword_1E7C28BF0;
  v12[0] = xpc_int64_create(2);
  v8 = v7;
  v12[1] = v8;
  v9 = xpc_dictionary_create((const char *const *)v13, v12, 2uLL);
  -[CSVoiceTriggerXPCClient _sendMessage:connection:completion:](self, "_sendMessage:connection:completion:", v9, self->_xpcConnection, 0, v12[0]);

  for (i = 1; i != -1; --i)
  for (j = 2; j != -1; --j)

}

- (void)notifyVoiceTriggeredSiriSessionCancelled
{
  xpc_object_t v3;
  id v4;
  xpc_object_t v5;
  uint64_t i;
  xpc_object_t v7[2];
  char *v8[2];
  xpc_object_t values;
  char *keys[2];

  keys[1] = *(char **)MEMORY[0x1E0C80C00];
  keys[0] = "type";
  values = xpc_int64_create(2);
  v3 = xpc_dictionary_create((const char *const *)keys, &values, 1uLL);
  *(_OWORD *)v8 = xmmword_1E7C28BF0;
  v7[0] = xpc_int64_create(2);
  v4 = v3;
  v7[1] = v4;
  v5 = xpc_dictionary_create((const char *const *)v8, v7, 2uLL);
  -[CSVoiceTriggerXPCClient _sendMessage:connection:completion:](self, "_sendMessage:connection:completion:", v5, self->_xpcConnection, 0, v7[0]);

  for (i = 1; i != -1; --i)
}

- (void)setRaiseToSpeakBypassing:(BOOL)a3 timeout:(double)a4
{
  xpc_object_t v7;
  id v8;
  xpc_object_t v9;
  uint64_t i;
  uint64_t j;
  xpc_object_t v12[2];
  char *v13[2];
  xpc_object_t values[3];
  char *keys[2];
  const char *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  *(_OWORD *)keys = xmmword_1E7C28BD8;
  v16 = "bypassTimeout";
  values[0] = xpc_int64_create(4);
  values[1] = xpc_BOOL_create(a3);
  values[2] = xpc_double_create(a4);
  v7 = xpc_dictionary_create((const char *const *)keys, values, 3uLL);
  *(_OWORD *)v13 = xmmword_1E7C28BF0;
  v12[0] = xpc_int64_create(2);
  v8 = v7;
  v12[1] = v8;
  v9 = xpc_dictionary_create((const char *const *)v13, v12, 2uLL);
  -[CSVoiceTriggerXPCClient _sendMessage:connection:completion:](self, "_sendMessage:connection:completion:", v9, self->_xpcConnection, 0, v12[0]);

  for (i = 1; i != -1; --i)
  for (j = 2; j != -1; --j)

}

- (id)fetchVoiceTriggerStats
{
  xpc_object_t v3;
  id v4;
  xpc_object_t v5;
  xpc_object_t v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  NSObject *v11;
  id v12;
  uint64_t i;
  int v15;
  const char *v16;
  xpc_object_t v17[2];
  char *v18[2];
  xpc_object_t values;
  char *keys[2];

  keys[1] = *(char **)MEMORY[0x1E0C80C00];
  keys[0] = "type";
  values = xpc_int64_create(5);
  v3 = xpc_dictionary_create((const char *const *)keys, &values, 1uLL);
  *(_OWORD *)v18 = xmmword_1E7C28BF0;
  v17[0] = xpc_int64_create(2);
  v4 = v3;
  v17[1] = v4;
  v5 = xpc_dictionary_create((const char *const *)v18, v17, 2uLL);
  v6 = xpc_connection_send_message_with_reply_sync(self->_xpcConnection, v5);
  v7 = v6;
  if (!v6)
  {
LABEL_7:
    v10 = 0;
    goto LABEL_10;
  }
  if (!xpc_dictionary_get_BOOL(v6, "result"))
  {
    v11 = *MEMORY[0x1E0D18F60];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_ERROR))
    {
      v15 = 136315138;
      v16 = "-[CSVoiceTriggerXPCClient fetchVoiceTriggerStats]";
      _os_log_error_impl(&dword_1C2614000, v11, OS_LOG_TYPE_ERROR, "%s ERR: failed to get response !", (uint8_t *)&v15, 0xCu);
    }
    goto LABEL_7;
  }
  xpc_dictionary_get_dictionary(v7, "triggerStats");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = objc_alloc(MEMORY[0x1E0C99D80]);
    objc_msgSend(v9, "_cs_initWithXPCObject:", v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v10 = 0;
  }

LABEL_10:
  v12 = v10;

  for (i = 1; i != -1; --i)
  return v12;
}

- (void)_sendMessage:(id)a3 connection:(id)a4 completion:(id)a5
{
  id v7;
  _xpc_connection_s *v8;
  id v9;
  void *v10;
  _QWORD handler[4];
  id v12;

  v7 = a3;
  v8 = (_xpc_connection_s *)a4;
  v9 = a5;
  v10 = v9;
  if (v7 && v8)
  {
    handler[0] = MEMORY[0x1E0C809B0];
    handler[1] = 3221225472;
    handler[2] = __62__CSVoiceTriggerXPCClient__sendMessage_connection_completion___block_invoke;
    handler[3] = &unk_1E7C28C08;
    v12 = v9;
    xpc_connection_send_message_with_reply(v8, v7, 0, handler);

  }
  else if (v9)
  {
    (*((void (**)(id, _QWORD, _QWORD))v9 + 2))(v9, 0, 0);
  }

}

- (CSVoiceTriggerXPCClientDelegate)delegate
{
  return (CSVoiceTriggerXPCClientDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (OS_xpc_object)xpcConnection
{
  return self->_xpcConnection;
}

- (void)setXpcConnection:(id)a3
{
  objc_storeStrong((id *)&self->_xpcConnection, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_xpcConnection, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

void __62__CSVoiceTriggerXPCClient__sendMessage_connection_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  _BOOL8 v4;
  uint64_t v5;
  id v6;

  v3 = a2;
  v6 = v3;
  if (v3)
    v4 = xpc_dictionary_get_BOOL(v3, "result");
  else
    v4 = 0;
  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
    (*(void (**)(uint64_t, _BOOL8, _QWORD))(v5 + 16))(v5, v4, 0);

}

void __34__CSVoiceTriggerXPCClient_connect__block_invoke(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "_handleListenerEvent:", v3);

}

@end
