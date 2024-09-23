@implementation AFSiriAnnounceWorkoutVoiceFeedbackRequest

- (AFSiriAnnounceWorkoutVoiceFeedbackRequest)initWithVoiceFeedbackData:(id)a3
{
  id v4;
  AFSiriAnnounceWorkoutVoiceFeedbackRequest *v5;
  uint64_t v6;
  NSDictionary *data;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AFSiriAnnounceWorkoutVoiceFeedbackRequest;
  v5 = -[AFSiriAnnounceWorkoutVoiceFeedbackRequest init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    data = v5->_data;
    v5->_data = (NSDictionary *)v6;

  }
  return v5;
}

- (void)performRequestWithCompletion:(id)a3
{
  void (**v4)(id, _QWORD);
  NSObject *v5;
  NSDictionary *v6;
  void *v7;
  id v8;
  NSObject *v9;
  id v10;
  id v11;
  xpc_object_t v12;
  xpc_object_t v13;
  uint64_t v14;
  void *v15;
  NSObject *v16;
  uint64_t i;
  NSDictionary *data;
  NSDictionary *v19;
  NSDictionary *v20;
  NSDictionary *v21;
  _QWORD handler[4];
  _xpc_connection_s *v23;
  void (**v24)(id, _QWORD);
  id v25;
  xpc_object_t values[2];
  char *keys[2];
  uint8_t buf[4];
  const char *v29;
  __int16 v30;
  NSDictionary *v31;
  __int16 v32;
  id v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, _QWORD))a3;
  v5 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_DEBUG))
  {
    data = self->_data;
    *(_DWORD *)buf = 136315394;
    v29 = "-[AFSiriAnnounceWorkoutVoiceFeedbackRequest performRequestWithCompletion:]";
    v30 = 2112;
    v31 = data;
    _os_log_debug_impl(&dword_19AF50000, v5, OS_LOG_TYPE_DEBUG, "%s Creating xpc for workout voice feedback announcement:%@", buf, 0x16u);
    if (!v4)
      goto LABEL_20;
  }
  else if (!v4)
  {
    goto LABEL_20;
  }
  v6 = self->_data;
  v25 = 0;
  objc_msgSend(MEMORY[0x1E0CB38B0], "dataWithPropertyList:format:options:error:", v6, 200, 0, &v25);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v25;
  if (v8 || !self->_data)
  {
    v9 = AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
    {
      v19 = self->_data;
      *(_DWORD *)buf = 136315650;
      v29 = "-[AFSiriAnnounceWorkoutVoiceFeedbackRequest performRequestWithCompletion:]";
      v30 = 2112;
      v31 = v19;
      v32 = 2112;
      v33 = v8;
      _os_log_error_impl(&dword_19AF50000, v9, OS_LOG_TYPE_ERROR, "%s Failed to serialize workoutvoice feedback data %@: %@", buf, 0x20u);
    }
    v4[2](v4, 0);
    v10 = 0;
  }
  else
  {
    v11 = objc_retainAutorelease(v7);
    v12 = xpc_data_create((const void *)objc_msgSend(v11, "bytes"), objc_msgSend(v11, "length"));
    keys[0] = "type";
    keys[1] = "workout_voice_feedback_announcement";
    values[0] = xpc_int64_create(14);
    v10 = v12;
    values[1] = v10;
    v13 = xpc_dictionary_create((const char *const *)keys, values, 2uLL);
    _ExternalRequestConnectionWithContext(0);
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = (void *)v14;
    v16 = AFSiriLogContextConnection;
    if (v13 && v14)
    {
      if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_DEBUG))
      {
        v20 = self->_data;
        *(_DWORD *)buf = 136315394;
        v29 = "-[AFSiriAnnounceWorkoutVoiceFeedbackRequest performRequestWithCompletion:]";
        v30 = 2112;
        v31 = v20;
        _os_log_debug_impl(&dword_19AF50000, v16, OS_LOG_TYPE_DEBUG, "%s Sending workout voice feedback announcement xpc message for %@", buf, 0x16u);
      }
      handler[0] = MEMORY[0x1E0C809B0];
      handler[1] = 3221225472;
      handler[2] = __74__AFSiriAnnounceWorkoutVoiceFeedbackRequest_performRequestWithCompletion___block_invoke;
      handler[3] = &unk_1E3A35578;
      v24 = v4;
      v23 = v15;
      xpc_connection_send_message_with_reply(v23, v13, 0, handler);

    }
    else
    {
      if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
      {
        v21 = self->_data;
        *(_DWORD *)buf = 136315394;
        v29 = "-[AFSiriAnnounceWorkoutVoiceFeedbackRequest performRequestWithCompletion:]";
        v30 = 2112;
        v31 = v21;
        _os_log_error_impl(&dword_19AF50000, v16, OS_LOG_TYPE_ERROR, "%s Unable to send workout voice feedback annoucement xpc message for %@", buf, 0x16u);
      }
      v4[2](v4, 0);
      if (v15)
        xpc_connection_cancel((xpc_connection_t)v15);
    }

    for (i = 1; i != -1; --i)
  }

LABEL_20:
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_data, 0);
}

void __74__AFSiriAnnounceWorkoutVoiceFeedbackRequest_performRequestWithCompletion___block_invoke(uint64_t a1, xpc_object_t xdict)
{
  if (xdict)
    xpc_dictionary_get_BOOL(xdict, "result");
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  xpc_connection_cancel(*(xpc_connection_t *)(a1 + 32));
}

+ (void)deactivateOngoingRequestWithCompletion:(id)a3
{
  id v3;
  NSObject *v4;
  xpc_object_t v5;
  uint64_t v6;
  void *v7;
  NSObject *v8;
  _QWORD v9[4];
  _xpc_connection_s *v10;
  id v11;
  xpc_object_t values;
  char *keys;
  uint8_t buf[4];
  const char *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315138;
    v15 = "+[AFSiriAnnounceWorkoutVoiceFeedbackRequest deactivateOngoingRequestWithCompletion:]";
    _os_log_debug_impl(&dword_19AF50000, v4, OS_LOG_TYPE_DEBUG, "%s Creating xpc to deactivate workout voice feedback announcement", buf, 0xCu);
    if (!v3)
      goto LABEL_13;
  }
  else if (!v3)
  {
    goto LABEL_13;
  }
  keys = "type";
  values = xpc_int64_create(15);
  v5 = xpc_dictionary_create((const char *const *)&keys, &values, 1uLL);
  _ExternalRequestConnectionWithContext(0);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  v8 = AFSiriLogContextConnection;
  if (v5 && v6)
  {
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315138;
      v15 = "+[AFSiriAnnounceWorkoutVoiceFeedbackRequest deactivateOngoingRequestWithCompletion:]";
      _os_log_debug_impl(&dword_19AF50000, v8, OS_LOG_TYPE_DEBUG, "%s Sending deactivate workout reminder xpc message for workout voice feedback", buf, 0xCu);
    }
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __84__AFSiriAnnounceWorkoutVoiceFeedbackRequest_deactivateOngoingRequestWithCompletion___block_invoke;
    v9[3] = &unk_1E3A35578;
    v11 = v3;
    v10 = v7;
    xpc_connection_send_message_with_reply(v10, v5, 0, v9);

  }
  else
  {
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v15 = "+[AFSiriAnnounceWorkoutVoiceFeedbackRequest deactivateOngoingRequestWithCompletion:]";
      _os_log_error_impl(&dword_19AF50000, v8, OS_LOG_TYPE_ERROR, "%s Unable to send deactivate request xpc message for workout voice feedback", buf, 0xCu);
    }
    (*((void (**)(id, _QWORD))v3 + 2))(v3, 0);
    if (v7)
      xpc_connection_cancel((xpc_connection_t)v7);
  }

LABEL_13:
}

void __84__AFSiriAnnounceWorkoutVoiceFeedbackRequest_deactivateOngoingRequestWithCompletion___block_invoke(uint64_t a1, xpc_object_t xdict)
{
  if (xdict)
    xpc_dictionary_get_BOOL(xdict, "result");
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  xpc_connection_cancel(*(xpc_connection_t *)(a1 + 32));
}

@end
