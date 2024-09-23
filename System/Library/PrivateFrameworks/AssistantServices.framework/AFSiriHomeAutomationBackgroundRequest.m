@implementation AFSiriHomeAutomationBackgroundRequest

- (AFSiriHomeAutomationBackgroundRequest)initWithRequestInfo:(id)a3
{
  id v4;
  void *v5;
  AFSiriHomeAutomationBackgroundRequest *v6;

  v4 = a3;
  +[AFInstanceContext defaultContext](AFInstanceContext, "defaultContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[AFSiriHomeAutomationBackgroundRequest initWithRequestInfo:instanceContext:](self, "initWithRequestInfo:instanceContext:", v4, v5);

  return v6;
}

- (AFSiriHomeAutomationBackgroundRequest)initWithRequestInfo:(id)a3 instanceContext:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  AFSiriHomeAutomationBackgroundRequest *v9;
  uint64_t v10;
  AFSiriHomeAutomationRequestInfo *requestInfo;
  objc_super v13;
  uint8_t buf[4];
  const char *v15;
  __int16 v16;
  id v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315650;
    v15 = "-[AFSiriHomeAutomationBackgroundRequest initWithRequestInfo:instanceContext:]";
    v16 = 2112;
    v17 = v6;
    v18 = 2112;
    v19 = v7;
    _os_log_debug_impl(&dword_19AF50000, v8, OS_LOG_TYPE_DEBUG, "%s Initializing HomeAutomationBackgroundRequest with requestInfo: %@ and AFInstanceContext: %@", buf, 0x20u);
  }
  v13.receiver = self;
  v13.super_class = (Class)AFSiriHomeAutomationBackgroundRequest;
  v9 = -[AFSiriHomeAutomationBackgroundRequest init](&v13, sel_init);
  if (v9)
  {
    v10 = objc_msgSend(v6, "copy");
    requestInfo = v9->_requestInfo;
    v9->_requestInfo = (AFSiriHomeAutomationRequestInfo *)v10;

    objc_storeStrong((id *)&v9->_instanceContext, a4);
  }

  return v9;
}

- (void)performRequestWithCompletion:(id)a3
{
  void (**v4)(id, _QWORD);
  NSObject *v5;
  AFSiriHomeAutomationRequestInfo *v6;
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
  uint64_t i;
  AFSiriHomeAutomationRequestInfo *requestInfo;
  AFSiriHomeAutomationRequestInfo *v19;
  AFSiriHomeAutomationRequestInfo *v20;
  AFSiriHomeAutomationRequestInfo *v21;
  _QWORD handler[4];
  _xpc_connection_s *v23;
  void (**v24)(id, _QWORD);
  id v25;
  xpc_object_t values[2];
  char *keys[2];
  uint8_t buf[4];
  const char *v29;
  __int16 v30;
  AFSiriHomeAutomationRequestInfo *v31;
  __int16 v32;
  id v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, _QWORD))a3;
  v5 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_DEBUG))
  {
    requestInfo = self->_requestInfo;
    *(_DWORD *)buf = 136315394;
    v29 = "-[AFSiriHomeAutomationBackgroundRequest performRequestWithCompletion:]";
    v30 = 2112;
    v31 = requestInfo;
    _os_log_debug_impl(&dword_19AF50000, v5, OS_LOG_TYPE_DEBUG, "%s Performing request for HomeAutomationBackgroundRequest: %@", buf, 0x16u);
  }
  v6 = self->_requestInfo;
  if (v6)
  {
    v25 = 0;
    objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", v6, 1, &v25);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v25;
    if (v8 || !v7)
    {
      v16 = AFSiriLogContextConnection;
      if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
      {
        v19 = self->_requestInfo;
        *(_DWORD *)buf = 136315650;
        v29 = "-[AFSiriHomeAutomationBackgroundRequest performRequestWithCompletion:]";
        v30 = 2112;
        v31 = v19;
        v32 = 2112;
        v33 = v8;
        _os_log_error_impl(&dword_19AF50000, v16, OS_LOG_TYPE_ERROR, "%s Failed to serialize asyncMessage %@: %@", buf, 0x20u);
      }
      v4[2](v4, 0);
      v11 = 0;
      goto LABEL_22;
    }
    v9 = objc_retainAutorelease(v7);
    v10 = xpc_data_create((const void *)objc_msgSend(v9, "bytes"), objc_msgSend(v9, "length"));
    *(_OWORD *)keys = xmmword_1E3A355E8;
    values[0] = xpc_int64_create(8);
    v11 = v10;
    values[1] = v11;
    v12 = xpc_dictionary_create((const char *const *)keys, values, 2uLL);
    _ExternalRequestConnectionWithContext(self->_instanceContext);
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = (void *)v13;
    v15 = AFSiriLogContextConnection;
    if (v12 && v13)
    {
      if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_DEBUG))
      {
        v20 = self->_requestInfo;
        *(_DWORD *)buf = 136315394;
        v29 = "-[AFSiriHomeAutomationBackgroundRequest performRequestWithCompletion:]";
        v30 = 2112;
        v31 = v20;
        _os_log_debug_impl(&dword_19AF50000, v15, OS_LOG_TYPE_DEBUG, "%s Sending xpc message with requestInfo: %@", buf, 0x16u);
      }
      handler[0] = MEMORY[0x1E0C809B0];
      handler[1] = 3221225472;
      handler[2] = __70__AFSiriHomeAutomationBackgroundRequest_performRequestWithCompletion___block_invoke;
      handler[3] = &unk_1E3A35578;
      v24 = v4;
      v23 = v14;
      xpc_connection_send_message_with_reply(v23, v12, 0, handler);

LABEL_20:
      for (i = 1; i != -1; --i)

LABEL_22:
      goto LABEL_23;
    }
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
    {
      v21 = self->_requestInfo;
      *(_DWORD *)buf = 136315394;
      v29 = "-[AFSiriHomeAutomationBackgroundRequest performRequestWithCompletion:]";
      v30 = 2112;
      v31 = v21;
      _os_log_error_impl(&dword_19AF50000, v15, OS_LOG_TYPE_ERROR, "%s Unable to send xpc message for %@", buf, 0x16u);
      if (!v4)
      {
LABEL_18:
        if (v14)
          xpc_connection_cancel((xpc_connection_t)v14);
        goto LABEL_20;
      }
    }
    else if (!v4)
    {
      goto LABEL_18;
    }
    v4[2](v4, 0);
    goto LABEL_18;
  }
  v4[2](v4, 0);
LABEL_23:

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_instanceContext, 0);
  objc_storeStrong((id *)&self->_requestInfo, 0);
}

void __70__AFSiriHomeAutomationBackgroundRequest_performRequestWithCompletion___block_invoke(uint64_t a1, void *a2)
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
  v5 = *(_QWORD *)(a1 + 40);
  if (v5)
    (*(void (**)(uint64_t, _BOOL8))(v5 + 16))(v5, v4);
  xpc_connection_cancel(*(xpc_connection_t *)(a1 + 32));

}

@end
