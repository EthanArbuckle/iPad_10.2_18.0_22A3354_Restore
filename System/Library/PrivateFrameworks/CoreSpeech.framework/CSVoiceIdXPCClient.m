@implementation CSVoiceIdXPCClient

- (CSVoiceIdXPCClient)init
{
  CSVoiceIdXPCClient *v2;
  xpc_connection_t mach_service;
  OS_xpc_object *xpcConnection;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CSVoiceIdXPCClient;
  v2 = -[CSVoiceIdXPCClient init](&v6, sel_init);
  if (v2)
  {
    CSLogInitIfNeeded();
    mach_service = xpc_connection_create_mach_service("com.apple.corespeech.corespeechd.voiceid.xpc", 0, 0);
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
  v4[2] = __29__CSVoiceIdXPCClient_connect__block_invoke;
  v4[3] = &unk_1E7C28B80;
  objc_copyWeak(&v5, &location);
  xpc_connection_set_event_handler(xpcConnection, v4);
  xpc_connection_activate(self->_xpcConnection);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (void)disconnect
{
  OS_xpc_object *xpcConnection;
  OS_xpc_object *v4;

  xpcConnection = self->_xpcConnection;
  if (xpcConnection)
  {
    xpc_connection_cancel(xpcConnection);
    v4 = self->_xpcConnection;
    self->_xpcConnection = 0;

  }
}

- (void)dealloc
{
  objc_super v3;

  -[CSVoiceIdXPCClient disconnect](self, "disconnect");
  v3.receiver = self;
  v3.super_class = (Class)CSVoiceIdXPCClient;
  -[CSVoiceIdXPCClient dealloc](&v3, sel_dealloc);
}

- (void)_handleListenerEvent:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  const char *v9;
  NSObject *v10;
  uint32_t v11;
  NSObject *v12;
  int v13;
  const char *v14;
  __int16 v15;
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v6 = MEMORY[0x1C3BC4CBC](v4);
    if (v6 == MEMORY[0x1E0C81310])
    {
      -[CSVoiceIdXPCClient _handleListenerError:](self, "_handleListenerError:", v5);
      goto LABEL_9;
    }
    v7 = v6;
    v8 = *MEMORY[0x1E0D18F60];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_ERROR))
    {
      v13 = 136315394;
      v14 = "-[CSVoiceIdXPCClient _handleListenerEvent:]";
      v15 = 2114;
      v16 = v7;
      v9 = "%s ignore unknown types of message: %{public}@";
      v10 = v8;
      v11 = 22;
LABEL_7:
      _os_log_error_impl(&dword_1C2614000, v10, OS_LOG_TYPE_ERROR, v9, (uint8_t *)&v13, v11);
    }
  }
  else
  {
    v12 = *MEMORY[0x1E0D18F60];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_ERROR))
    {
      v13 = 136315138;
      v14 = "-[CSVoiceIdXPCClient _handleListenerEvent:]";
      v9 = "%s cannot handle nil event ";
      v10 = v12;
      v11 = 12;
      goto LABEL_7;
    }
  }
LABEL_9:

}

- (void)_handleListenerError:(id)a3
{
  id v3;
  void *v4;
  NSObject *v6;
  const char *v7;
  NSObject *v8;
  uint32_t v9;
  const char *string;
  NSObject *v11;
  int v13;
  const char *v14;
  __int16 v15;
  const char *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = v3;
  if (!v3)
  {
    v6 = *MEMORY[0x1E0D18F60];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_ERROR))
      goto LABEL_13;
    v13 = 136315138;
    v14 = "-[CSVoiceIdXPCClient _handleListenerError:]";
    v7 = "%s cannot handle nil error";
LABEL_11:
    v8 = v6;
    v9 = 12;
LABEL_15:
    _os_log_error_impl(&dword_1C2614000, v8, OS_LOG_TYPE_ERROR, v7, (uint8_t *)&v13, v9);
    goto LABEL_13;
  }
  if (v3 == (id)MEMORY[0x1E0C81260] || v3 == (id)MEMORY[0x1E0C81258])
  {
    v6 = *MEMORY[0x1E0D18F60];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_ERROR))
      goto LABEL_13;
    v13 = 136315138;
    v14 = "-[CSVoiceIdXPCClient _handleListenerError:]";
    v7 = "%s Listener connection disconnected";
    goto LABEL_11;
  }
  string = xpc_dictionary_get_string(v3, (const char *)*MEMORY[0x1E0C81270]);
  v11 = *MEMORY[0x1E0D18F60];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_ERROR))
  {
    v13 = 136315394;
    v14 = "-[CSVoiceIdXPCClient _handleListenerError:]";
    v15 = 2082;
    v16 = string;
    v7 = "%s connection error: %{public}s";
    v8 = v11;
    v9 = 22;
    goto LABEL_15;
  }
LABEL_13:

}

- (void)_notifyImplicitUtterance:(id)a3 audioDeviceType:(id)a4 audioRecordType:(id)a5 voiceTriggerEventInfo:(id)a6 otherCtxt:(id)a7 completion:(id)a8
{
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  id v26;
  uint64_t v27;
  void *v28;
  void *v29;
  xpc_object_t v30;
  id v31;
  xpc_object_t v32;
  uint64_t i;
  uint64_t j;
  NSObject *v35;
  void *v36;
  id v37;
  void *v39;
  _QWORD v40[4];
  id v41;
  xpc_object_t v42[2];
  char *v43[2];
  __int128 values;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  char *keys[2];
  __int128 v49;
  const char *v50;
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  v17 = a7;
  v18 = a8;
  v40[0] = MEMORY[0x1E0C809B0];
  v40[1] = 3221225472;
  v40[2] = __122__CSVoiceIdXPCClient__notifyImplicitUtterance_audioDeviceType_audioRecordType_voiceTriggerEventInfo_otherCtxt_completion___block_invoke;
  v40[3] = &unk_1E7C290D8;
  v19 = v18;
  v41 = v19;
  v20 = (void *)MEMORY[0x1C3BC4734](v40);
  v39 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D80]), "initWithDictionary:", v16);
  *(_OWORD *)keys = xmmword_1E7C24650;
  v49 = *(_OWORD *)off_1E7C24660;
  v50 = "audioRecordCtx";
  objc_msgSend(v16, "_cs_xpcObject");
  v21 = objc_claimAutoreleasedReturnValue();
  if (!v21)
  {
LABEL_12:
    v35 = *MEMORY[0x1E0D18F60];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_ERROR))
    {
      LODWORD(values) = 136315138;
      *(_QWORD *)((char *)&values + 4) = "-[CSVoiceIdXPCClient _notifyImplicitUtterance:audioDeviceType:audioRecordType:v"
                                         "oiceTriggerEventInfo:otherCtxt:completion:]";
      _os_log_error_impl(&dword_1C2614000, v35, OS_LOG_TYPE_ERROR, "%s Required values is nil, bailout", (uint8_t *)&values, 0xCu);
      if (!v19)
        goto LABEL_15;
    }
    else if (!v19)
    {
      goto LABEL_15;
    }
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18E80], 1253, 0);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, void *))v19 + 2))(v19, 0, v36);

    goto LABEL_15;
  }
  v22 = (void *)v21;
  objc_msgSend(v17, "_cs_xpcObject");
  v23 = objc_claimAutoreleasedReturnValue();
  if (!v23)
  {
LABEL_11:

    goto LABEL_12;
  }
  v24 = (void *)v23;
  v37 = v16;
  v25 = v20;
  v26 = v13;
  objc_msgSend(v14, "xpcObject");
  v27 = objc_claimAutoreleasedReturnValue();
  if (!v27)
  {

    v20 = v25;
    v16 = v37;
    goto LABEL_11;
  }
  v28 = (void *)v27;
  objc_msgSend(v15, "xpcObject");
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = v26;
  v20 = v25;
  v16 = v37;
  if (!v29)
    goto LABEL_12;
  *(_QWORD *)&values = xpc_string_create((const char *)objc_msgSend(objc_retainAutorelease(v13), "UTF8String"));
  objc_msgSend(v39, "_cs_xpcObject");
  *((_QWORD *)&values + 1) = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "_cs_xpcObject");
  v45 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "xpcObject");
  v46 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "xpcObject");
  v47 = objc_claimAutoreleasedReturnValue();
  v30 = xpc_dictionary_create((const char *const *)keys, (xpc_object_t *)&values, 5uLL);
  *(_OWORD *)v43 = xmmword_1E7C28BF0;
  v42[0] = xpc_int64_create(2);
  v31 = v30;
  v42[1] = v31;
  v32 = xpc_dictionary_create((const char *const *)v43, v42, 2uLL);
  -[CSVoiceIdXPCClient _sendMessage:connection:completion:](self, "_sendMessage:connection:completion:", v32, self->_xpcConnection, v20);

  for (i = 1; i != -1; --i)
  for (j = 32; j != -8; j -= 8)

LABEL_15:
}

- (void)_sendMessage:(id)a3 connection:(id)a4 completion:(id)a5
{
  _xpc_connection_s *v8;
  void (**v9)(id, _BOOL8, void *);
  xpc_object_t v10;
  void *v11;
  _BOOL8 v12;
  void *v13;
  xpc_object_t message;

  message = a3;
  v8 = (_xpc_connection_s *)a4;
  v9 = (void (**)(id, _BOOL8, void *))a5;
  if (message && v8)
  {
    v10 = xpc_connection_send_message_with_reply_sync(v8, message);
    v11 = v10;
    if (v10)
    {
      v12 = xpc_dictionary_get_BOOL(v10, "result");
      -[CSVoiceIdXPCClient _decodeError:](self, "_decodeError:", v11);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v9)
      {
LABEL_6:

LABEL_9:
        goto LABEL_10;
      }
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18E80], 1251, 0);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 0;
      if (!v9)
        goto LABEL_6;
    }
    v9[2](v9, v12, v13);
    goto LABEL_6;
  }
  if (v9)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18E80], 1252, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v9[2](v9, 0, v11);
    goto LABEL_9;
  }
LABEL_10:

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

uint64_t __122__CSVoiceIdXPCClient__notifyImplicitUtterance_audioDeviceType_audioRecordType_voiceTriggerEventInfo_otherCtxt_completion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __29__CSVoiceIdXPCClient_connect__block_invoke(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "_handleListenerEvent:", v3);

}

+ (void)notifyImplicitUtterance:(id)a3 audioDeviceType:(id)a4 audioRecordType:(id)a5 voiceTriggerEventInfo:(id)a6 otherCtxt:(id)a7 completion:(id)a8
{
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  CSVoiceIdXPCClient *v19;
  id v20;
  CSVoiceIdXPCClient *v21;
  _QWORD v22[4];
  CSVoiceIdXPCClient *v23;
  id v24;

  v13 = a8;
  v14 = a7;
  v15 = a6;
  v16 = a5;
  v17 = a4;
  v18 = a3;
  v19 = objc_alloc_init(CSVoiceIdXPCClient);
  -[CSVoiceIdXPCClient connect](v19, "connect");
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __121__CSVoiceIdXPCClient_notifyImplicitUtterance_audioDeviceType_audioRecordType_voiceTriggerEventInfo_otherCtxt_completion___block_invoke;
  v22[3] = &unk_1E7C29128;
  v23 = v19;
  v24 = v13;
  v20 = v13;
  v21 = v19;
  -[CSVoiceIdXPCClient _notifyImplicitUtterance:audioDeviceType:audioRecordType:voiceTriggerEventInfo:otherCtxt:completion:](v21, "_notifyImplicitUtterance:audioDeviceType:audioRecordType:voiceTriggerEventInfo:otherCtxt:completion:", v18, v17, v16, v15, v14, v22);

}

void __121__CSVoiceIdXPCClient_notifyImplicitUtterance_audioDeviceType_audioRecordType_voiceTriggerEventInfo_otherCtxt_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v5;
  id v6;

  v6 = a3;
  objc_msgSend(*(id *)(a1 + 32), "disconnect");
  v5 = *(_QWORD *)(a1 + 40);
  if (v5)
    (*(void (**)(uint64_t, uint64_t, id))(v5 + 16))(v5, a2, v6);

}

@end
