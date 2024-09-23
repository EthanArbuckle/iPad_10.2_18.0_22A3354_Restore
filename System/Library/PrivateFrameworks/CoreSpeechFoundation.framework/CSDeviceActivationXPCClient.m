@implementation CSDeviceActivationXPCClient

- (CSDeviceActivationXPCClient)initWithMachServiceName:(const char *)a3
{
  CSDeviceActivationXPCClient *v4;
  xpc_connection_t mach_service;
  OS_xpc_object *xpcConnection;
  NSObject *v7;
  objc_super v9;
  uint8_t buf[4];
  const char *v11;
  __int16 v12;
  const char *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v9.receiver = self;
  v9.super_class = (Class)CSDeviceActivationXPCClient;
  v4 = -[CSDeviceActivationXPCClient init](&v9, sel_init);
  if (v4)
  {
    CSLogInitIfNeededWithSubsystemType(0);
    mach_service = xpc_connection_create_mach_service(a3, 0, 0);
    xpcConnection = v4->_xpcConnection;
    v4->_xpcConnection = mach_service;

    v7 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v11 = "-[CSDeviceActivationXPCClient initWithMachServiceName:]";
      v12 = 2080;
      v13 = a3;
      _os_log_impl(&dword_1B502E000, v7, OS_LOG_TYPE_DEFAULT, "%s machServiceName : %s", buf, 0x16u);
    }
  }
  return v4;
}

- (CSDeviceActivationXPCClient)init
{
  return -[CSDeviceActivationXPCClient initWithMachServiceName:](self, "initWithMachServiceName:", "com.apple.corespeech.corespeechd.activation.xpc");
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
  v4[2] = __38__CSDeviceActivationXPCClient_connect__block_invoke;
  v4[3] = &unk_1E6881020;
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
    v4 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v8 = "-[CSDeviceActivationXPCClient dealloc]";
      _os_log_impl(&dword_1B502E000, v4, OS_LOG_TYPE_DEFAULT, "%s disconnect activationXPCClient", buf, 0xCu);
      xpcConnection = self->_xpcConnection;
    }
    xpc_connection_cancel(xpcConnection);
    v5 = self->_xpcConnection;
    self->_xpcConnection = 0;

  }
  v6.receiver = self;
  v6.super_class = (Class)CSDeviceActivationXPCClient;
  -[CSDeviceActivationXPCClient dealloc](&v6, sel_dealloc);
}

- (void)_handleListenerEvent:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  const char *v7;
  NSObject *v8;
  uint32_t v9;
  uint64_t v10;
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
    if (MEMORY[0x1B5E46F84](v4) == MEMORY[0x1E0C81310])
    {
      -[CSDeviceActivationXPCClient _handleListenerError:](self, "_handleListenerError:", v5);
      goto LABEL_9;
    }
    v6 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
    {
      v11 = 136315138;
      v12 = "-[CSDeviceActivationXPCClient _handleListenerEvent:]";
      v7 = "%s ignore unknown types of message ";
      v8 = v6;
      v9 = 12;
LABEL_7:
      _os_log_error_impl(&dword_1B502E000, v8, OS_LOG_TYPE_ERROR, v7, (uint8_t *)&v11, v9);
    }
  }
  else
  {
    v10 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
    {
      v11 = 136315394;
      v12 = "-[CSDeviceActivationXPCClient _handleListenerEvent:]";
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
  id v3;
  void *v4;
  void *v5;
  NSObject *v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  const char *v11;
  const char *string;
  NSObject *v13;
  int v15;
  const char *v16;
  __int16 v17;
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = v3;
  if (!v3)
  {
    v13 = CSLogContextFacilityCoreSpeech;
    if (!os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
      goto LABEL_15;
    v15 = 136315394;
    v16 = "-[CSDeviceActivationXPCClient _handleListenerError:]";
    v17 = 2050;
    v18 = 0;
    v11 = "%s cannot handle error : error = %{public}p";
    goto LABEL_17;
  }
  v5 = (void *)MEMORY[0x1E0C81260];
  if (v3 != (id)MEMORY[0x1E0C81260] && v3 != (id)MEMORY[0x1E0C81258])
  {
    string = xpc_dictionary_get_string(v3, (const char *)*MEMORY[0x1E0C81270]);
    v13 = CSLogContextFacilityCoreSpeech;
    if (!os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
      goto LABEL_15;
    v15 = 136315394;
    v16 = "-[CSDeviceActivationXPCClient _handleListenerError:]";
    v17 = 2082;
    v18 = (uint64_t)string;
    v11 = "%s connection error: %{public}s";
LABEL_17:
    _os_log_error_impl(&dword_1B502E000, v13, OS_LOG_TYPE_ERROR, v11, (uint8_t *)&v15, 0x16u);
    goto LABEL_15;
  }
  v7 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    v15 = 136315138;
    v16 = "-[CSDeviceActivationXPCClient _handleListenerError:]";
    _os_log_impl(&dword_1B502E000, v7, OS_LOG_TYPE_DEFAULT, "%s Listener connection disconnected", (uint8_t *)&v15, 0xCu);
  }
  if (v4 == v5)
  {
    v8 = (void *)CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
    {
      v9 = v8;
      v10 = xpc_connection_copy_invalidation_reason();
      v15 = 136315394;
      v16 = "-[CSDeviceActivationXPCClient _handleListenerError:]";
      v17 = 2080;
      v18 = v10;
      _os_log_impl(&dword_1B502E000, v9, OS_LOG_TYPE_DEFAULT, "%s XPC Connection Invalidated for reason: %s", (uint8_t *)&v15, 0x16u);

    }
  }
LABEL_15:

}

- (void)notifyActivationEvent:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  void *v10;
  xpc_object_t v11;
  uint64_t i;
  _QWORD v13[4];
  id v14;
  xpc_object_t values[2];
  uint8_t buf[16];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    *(_QWORD *)&buf[4] = "-[CSDeviceActivationXPCClient notifyActivationEvent:completion:]";
    _os_log_impl(&dword_1B502E000, v8, OS_LOG_TYPE_DEFAULT, "%s ", buf, 0xCu);
  }
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __64__CSDeviceActivationXPCClient_notifyActivationEvent_completion___block_invoke;
  v13[3] = &unk_1E6881048;
  v9 = v7;
  v14 = v9;
  v10 = (void *)MEMORY[0x1B5E468D0](v13);
  *(_OWORD *)buf = xmmword_1E6881068;
  values[0] = xpc_int64_create(2);
  objc_msgSend(v6, "xpcObject");
  values[1] = (xpc_object_t)objc_claimAutoreleasedReturnValue();
  v11 = xpc_dictionary_create((const char *const *)buf, values, 2uLL);
  -[CSDeviceActivationXPCClient _sendMessage:connection:completion:](self, "_sendMessage:connection:completion:", v11, self->_xpcConnection, v10);

  for (i = 1; i != -1; --i)
}

- (void)_sendMessage:(id)a3 connection:(id)a4 completion:(id)a5
{
  id v8;
  _xpc_connection_s *v9;
  id v10;
  void (**v11)(_QWORD, _QWORD, _QWORD);
  void *v12;
  _QWORD v13[5];
  id v14;

  v8 = a3;
  v9 = (_xpc_connection_s *)a4;
  v10 = a5;
  v11 = (void (**)(_QWORD, _QWORD, _QWORD))v10;
  if (v8 && v9)
  {
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __66__CSDeviceActivationXPCClient__sendMessage_connection_completion___block_invoke;
    v13[3] = &unk_1E6881088;
    v13[4] = self;
    v14 = v10;
    xpc_connection_send_message_with_reply(v9, v8, 0, v13);

  }
  else if (v10)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.corespeech"), 1252, 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, _QWORD, void *))v11)[2](v11, 0, v12);

  }
}

- (id)_decodeError:(id)a3
{
  id v3;
  void *v4;
  void *string;
  int64_t int64;
  void *v7;
  void *v8;

  v3 = a3;
  v4 = v3;
  if (v3)
  {
    string = (void *)xpc_dictionary_get_string(v3, "resultErrorDomain");
    if (string)
    {
      int64 = xpc_dictionary_get_int64(v4, "resultErrorCode");
      v7 = (void *)MEMORY[0x1E0CB35C8];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", string);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "errorWithDomain:code:userInfo:", v8, int64, 0);
      string = (void *)objc_claimAutoreleasedReturnValue();

    }
  }
  else
  {
    string = 0;
  }

  return string;
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
}

void __66__CSDeviceActivationXPCClient__sendMessage_connection_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  _BOOL8 v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  id v8;

  v3 = a2;
  if (v3)
  {
    v8 = v3;
    v4 = xpc_dictionary_get_BOOL(v3, "result");
    objc_msgSend(*(id *)(a1 + 32), "_decodeError:", v8);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = *(_QWORD *)(a1 + 40);
    if (v6)
      (*(void (**)(uint64_t, _BOOL8, void *))(v6 + 16))(v6, v4, v5);
    goto LABEL_6;
  }
  v7 = *(_QWORD *)(a1 + 40);
  if (v7)
  {
    v8 = 0;
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.corespeech"), 1251, 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, void *))(v7 + 16))(v7, 0, v5);
LABEL_6:

    v3 = v8;
  }

}

uint64_t __64__CSDeviceActivationXPCClient_notifyActivationEvent_completion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __38__CSDeviceActivationXPCClient_connect__block_invoke(uint64_t a1, void *a2)
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
