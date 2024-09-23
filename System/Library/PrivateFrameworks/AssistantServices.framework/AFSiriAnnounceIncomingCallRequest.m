@implementation AFSiriAnnounceIncomingCallRequest

- (AFSiriAnnounceIncomingCallRequest)initWithIncomingCall:(id)a3
{
  id v4;
  AFSiriAnnounceIncomingCallRequest *v5;
  uint64_t v6;
  AFSiriIncomingCall *call;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AFSiriAnnounceIncomingCallRequest;
  v5 = -[AFSiriAnnounceIncomingCallRequest init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    call = v5->_call;
    v5->_call = (AFSiriIncomingCall *)v6;

  }
  return v5;
}

- (void)performRequestWithCompletion:(id)a3
{
  void (**v4)(id, _QWORD);
  NSObject *v5;
  AFSiriIncomingCall *v6;
  void *v7;
  id v8;
  id v9;
  xpc_object_t v10;
  id v11;
  xpc_object_t v12;
  uint64_t v13;
  void *v14;
  NSObject *v15;
  NSObject *v16;
  NSObject *v17;
  uint64_t i;
  AFSiriIncomingCall *call;
  AFSiriIncomingCall *v20;
  AFSiriIncomingCall *v21;
  AFSiriIncomingCall *v22;
  _QWORD handler[4];
  _xpc_connection_s *v24;
  void (**v25)(id, _QWORD);
  id v26;
  xpc_object_t values[2];
  char *keys[2];
  uint8_t buf[4];
  const char *v30;
  __int16 v31;
  AFSiriIncomingCall *v32;
  __int16 v33;
  id v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, _QWORD))a3;
  v5 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_DEBUG))
  {
    call = self->_call;
    *(_DWORD *)buf = 136315394;
    v30 = "-[AFSiriAnnounceIncomingCallRequest performRequestWithCompletion:]";
    v31 = 2112;
    v32 = call;
    _os_log_debug_impl(&dword_19AF50000, v5, OS_LOG_TYPE_DEBUG, "%s %@", buf, 0x16u);
    if (!v4)
      goto LABEL_24;
  }
  else if (!v4)
  {
    goto LABEL_24;
  }
  if (+[AFFeatureFlags isAnnounceTelephonyEnabled](AFFeatureFlags, "isAnnounceTelephonyEnabled"))
  {
    v6 = self->_call;
    v26 = 0;
    objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", v6, 1, &v26);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v26;
    if (v8 || !v7)
    {
      v17 = AFSiriLogContextConnection;
      if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
      {
        v20 = self->_call;
        *(_DWORD *)buf = 136315650;
        v30 = "-[AFSiriAnnounceIncomingCallRequest performRequestWithCompletion:]";
        v31 = 2112;
        v32 = v20;
        v33 = 2112;
        v34 = v8;
        _os_log_error_impl(&dword_19AF50000, v17, OS_LOG_TYPE_ERROR, "%s Failed to serialize call %@: %@", buf, 0x20u);
      }
      v4[2](v4, 0);
      v11 = 0;
    }
    else
    {
      v9 = objc_retainAutorelease(v7);
      v10 = xpc_data_create((const void *)objc_msgSend(v9, "bytes"), objc_msgSend(v9, "length"));
      keys[0] = "type";
      keys[1] = "incoming_call";
      values[0] = xpc_int64_create(7);
      v11 = v10;
      values[1] = v11;
      v12 = xpc_dictionary_create((const char *const *)keys, values, 2uLL);
      _ExternalRequestConnectionWithContext(0);
      v13 = objc_claimAutoreleasedReturnValue();
      v14 = (void *)v13;
      v15 = AFSiriLogContextConnection;
      if (v12 && v13)
      {
        if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_DEBUG))
        {
          v21 = self->_call;
          *(_DWORD *)buf = 136315394;
          v30 = "-[AFSiriAnnounceIncomingCallRequest performRequestWithCompletion:]";
          v31 = 2112;
          v32 = v21;
          _os_log_debug_impl(&dword_19AF50000, v15, OS_LOG_TYPE_DEBUG, "%s Sending xpc message for %@", buf, 0x16u);
        }
        handler[0] = MEMORY[0x1E0C809B0];
        handler[1] = 3221225472;
        handler[2] = __66__AFSiriAnnounceIncomingCallRequest_performRequestWithCompletion___block_invoke;
        handler[3] = &unk_1E3A35578;
        v25 = v4;
        v24 = v14;
        xpc_connection_send_message_with_reply(v24, v12, 0, handler);

      }
      else
      {
        if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
        {
          v22 = self->_call;
          *(_DWORD *)buf = 136315394;
          v30 = "-[AFSiriAnnounceIncomingCallRequest performRequestWithCompletion:]";
          v31 = 2112;
          v32 = v22;
          _os_log_error_impl(&dword_19AF50000, v15, OS_LOG_TYPE_ERROR, "%s Unable to send xpc message for %@", buf, 0x16u);
        }
        v4[2](v4, 0);
        if (v14)
          xpc_connection_cancel((xpc_connection_t)v14);
      }

      for (i = 1; i != -1; --i)
    }

  }
  else
  {
    v16 = AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v30 = "-[AFSiriAnnounceIncomingCallRequest performRequestWithCompletion:]";
      _os_log_error_impl(&dword_19AF50000, v16, OS_LOG_TYPE_ERROR, "%s Announce Telephony is not enabled, rejecting request", buf, 0xCu);
    }
    v4[2](v4, 0);
  }
LABEL_24:

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_call, 0);
}

void __66__AFSiriAnnounceIncomingCallRequest_performRequestWithCompletion___block_invoke(uint64_t a1, xpc_object_t xdict)
{
  if (xdict)
    xpc_dictionary_get_BOOL(xdict, "result");
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  xpc_connection_cancel(*(xpc_connection_t *)(a1 + 32));
}

@end
