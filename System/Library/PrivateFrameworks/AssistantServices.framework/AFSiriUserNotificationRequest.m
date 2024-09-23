@implementation AFSiriUserNotificationRequest

- (AFSiriUserNotificationRequest)initWithUserNotification:(id)a3 sourceAppId:(id)a4
{
  return -[AFSiriUserNotificationRequest initWithUserNotification:sourceAppId:platform:](self, "initWithUserNotification:sourceAppId:platform:", a3, a4, 1);
}

- (AFSiriUserNotificationRequest)initWithUserNotification:(id)a3 sourceAppId:(id)a4 platform:(int64_t)a5
{
  return -[AFSiriUserNotificationRequest initWithUserNotification:sourceAppId:platform:summaryDecision:summary:](self, "initWithUserNotification:sourceAppId:platform:summaryDecision:summary:", a3, a4, a5, 0, 0);
}

- (AFSiriUserNotificationRequest)initWithUserNotification:(id)a3 sourceAppId:(id)a4 platform:(int64_t)a5 summaryDecision:(int64_t)a6
{
  return -[AFSiriUserNotificationRequest initWithUserNotification:sourceAppId:platform:summaryDecision:summary:](self, "initWithUserNotification:sourceAppId:platform:summaryDecision:summary:", a3, a4, a5, a6, 0);
}

- (AFSiriUserNotificationRequest)initWithUserNotification:(id)a3 sourceAppId:(id)a4 platform:(int64_t)a5 summaryDecision:(int64_t)a6 summary:(id)a7
{
  id v13;
  id v14;
  id v15;
  AFSiriUserNotificationRequest *v16;
  AFSiriUserNotificationRequest *v17;
  objc_super v19;

  v13 = a3;
  v14 = a4;
  v15 = a7;
  v19.receiver = self;
  v19.super_class = (Class)AFSiriUserNotificationRequest;
  v16 = -[AFSiriUserNotificationRequest init](&v19, sel_init);
  v17 = v16;
  if (v16)
  {
    objc_storeStrong((id *)&v16->_notification, a3);
    objc_storeStrong((id *)&v17->_sourceAppId, a4);
    v17->_platform = a5;
    v17->_summaryDecision = a6;
    objc_storeStrong((id *)&v17->_summary, a7);
  }

  return v17;
}

- (void)performRequestWithCompletion:(id)a3
{
  void (**v4)(id, _QWORD);
  NSObject *v5;
  UNNotification *v6;
  void *v7;
  char *v8;
  BOOL v9;
  NSObject *v10;
  id v11;
  xpc_object_t v12;
  AFSiriUserNotificationSummary *summary;
  void *v14;
  char *v15;
  char *v16;
  id v17;
  xpc_object_t v18;
  id v19;
  xpc_object_t v20;
  uint64_t v21;
  void *v22;
  NSObject *v23;
  NSObject *v24;
  uint64_t i;
  UNNotification *notification;
  UNNotification *v27;
  AFSiriUserNotificationSummary *v28;
  UNNotification *v29;
  UNNotification *v30;
  void *v31;
  _QWORD handler[4];
  _xpc_connection_s *v33;
  void (**v34)(id, _QWORD);
  id v35;
  id v36;
  uint8_t buf[4];
  const char *v38;
  __int16 v39;
  UNNotification *v40;
  xpc_object_t values[6];
  _BYTE keys[24];
  const char *v43;
  const char *v44;
  const char *v45;
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, _QWORD))a3;
  v5 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_DEBUG))
  {
    notification = self->_notification;
    *(_DWORD *)keys = 136315394;
    *(_QWORD *)&keys[4] = "-[AFSiriUserNotificationRequest performRequestWithCompletion:]";
    *(_WORD *)&keys[12] = 2112;
    *(_QWORD *)&keys[14] = notification;
    _os_log_debug_impl(&dword_19AF50000, v5, OS_LOG_TYPE_DEBUG, "%s %@", keys, 0x16u);
  }
  v6 = self->_notification;
  v36 = 0;
  objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", v6, 1, &v36);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (char *)v36;
  if (v8)
    v9 = 1;
  else
    v9 = v7 == 0;
  if (!v9)
  {
    v11 = objc_retainAutorelease(v7);
    v12 = xpc_data_create((const void *)objc_msgSend(v11, "bytes"), objc_msgSend(v11, "length"));
    summary = self->_summary;
    v35 = 0;
    objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", summary, 1, &v35);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (char *)v35;
    v16 = v15;
    if (v15 || !v14)
    {
      v24 = AFSiriLogContextConnection;
      if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
      {
        v28 = self->_summary;
        *(_DWORD *)keys = 136315650;
        *(_QWORD *)&keys[4] = "-[AFSiriUserNotificationRequest performRequestWithCompletion:]";
        *(_WORD *)&keys[12] = 2112;
        *(_QWORD *)&keys[14] = v28;
        *(_WORD *)&keys[22] = 2112;
        v43 = v16;
        _os_log_error_impl(&dword_19AF50000, v24, OS_LOG_TYPE_ERROR, "%s Failed to serialize summary %@: %@", keys, 0x20u);
      }
      v4[2](v4, 0);
      v19 = 0;
      goto LABEL_29;
    }
    v31 = v14;
    v17 = objc_retainAutorelease(v14);
    v18 = xpc_data_create((const void *)objc_msgSend(v17, "bytes"), objc_msgSend(v17, "length"));
    *(_QWORD *)keys = "type";
    *(_QWORD *)&keys[8] = "notification";
    *(_QWORD *)&keys[16] = "source_app_id";
    v43 = "announcement_platform";
    v44 = "summary_decision";
    v45 = "summary";
    values[0] = xpc_int64_create(2);
    values[1] = v12;
    values[2] = xpc_string_create(-[NSString UTF8String](self->_sourceAppId, "UTF8String"));
    values[3] = xpc_int64_create(self->_platform);
    values[4] = xpc_int64_create(self->_summaryDecision);
    v19 = v18;
    values[5] = v19;
    v20 = xpc_dictionary_create((const char *const *)keys, values, 6uLL);
    _ExternalRequestConnectionWithContext(0);
    v21 = objc_claimAutoreleasedReturnValue();
    v22 = (void *)v21;
    v23 = AFSiriLogContextConnection;
    if (v20 && v21)
    {
      if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_DEBUG))
      {
        v29 = self->_notification;
        *(_DWORD *)buf = 136315394;
        v38 = "-[AFSiriUserNotificationRequest performRequestWithCompletion:]";
        v39 = 2112;
        v40 = v29;
        _os_log_debug_impl(&dword_19AF50000, v23, OS_LOG_TYPE_DEBUG, "%s Sending xpc message for %@", buf, 0x16u);
      }
      handler[0] = MEMORY[0x1E0C809B0];
      handler[1] = 3221225472;
      handler[2] = __62__AFSiriUserNotificationRequest_performRequestWithCompletion___block_invoke;
      handler[3] = &unk_1E3A35578;
      v34 = v4;
      v33 = v22;
      xpc_connection_send_message_with_reply(v33, v20, 0, handler);

LABEL_26:
      for (i = 5; i != -1; --i)

      v16 = 0;
      v14 = v31;
LABEL_29:

      goto LABEL_30;
    }
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
    {
      v30 = self->_notification;
      *(_DWORD *)buf = 136315394;
      v38 = "-[AFSiriUserNotificationRequest performRequestWithCompletion:]";
      v39 = 2112;
      v40 = v30;
      _os_log_error_impl(&dword_19AF50000, v23, OS_LOG_TYPE_ERROR, "%s Unable to send xpc message for %@", buf, 0x16u);
      if (!v4)
      {
LABEL_24:
        if (v22)
          xpc_connection_cancel((xpc_connection_t)v22);
        goto LABEL_26;
      }
    }
    else if (!v4)
    {
      goto LABEL_24;
    }
    v4[2](v4, 0);
    goto LABEL_24;
  }
  v10 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
  {
    v27 = self->_notification;
    *(_DWORD *)keys = 136315650;
    *(_QWORD *)&keys[4] = "-[AFSiriUserNotificationRequest performRequestWithCompletion:]";
    *(_WORD *)&keys[12] = 2112;
    *(_QWORD *)&keys[14] = v27;
    *(_WORD *)&keys[22] = 2112;
    v43 = v8;
    _os_log_error_impl(&dword_19AF50000, v10, OS_LOG_TYPE_ERROR, "%s Failed to serialize notification %@: %@", keys, 0x20u);
  }
  v4[2](v4, 0);
  v12 = 0;
LABEL_30:

}

- (void)deactivateRequestForReason:(int64_t)a3 completion:(id)a4
{
  id v6;
  void *v7;
  UNNotification *notification;
  void *v9;
  char *v10;
  id v11;
  xpc_object_t v12;
  id v13;
  xpc_object_t v14;
  uint64_t v15;
  void *v16;
  NSObject *v17;
  NSObject *v18;
  NSObject *v19;
  NSObject *v20;
  uint64_t i;
  NSObject *v22;
  __CFString *v23;
  __CFString *v24;
  UNNotification *v25;
  _QWORD handler[4];
  _xpc_connection_s *v27;
  id v28;
  id v29;
  uint8_t buf[4];
  const char *v31;
  xpc_object_t values[5];
  _BYTE keys[24];
  const char *v34;
  const char *v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = (void *)AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_DEBUG))
  {
    v22 = v7;
    if ((unint64_t)a3 > 0x14)
      v23 = CFSTR("(unknown)");
    else
      v23 = off_1E3A31D98[a3];
    v24 = v23;
    *(_DWORD *)keys = 136315394;
    *(_QWORD *)&keys[4] = "-[AFSiriUserNotificationRequest deactivateRequestForReason:completion:]";
    *(_WORD *)&keys[12] = 2112;
    *(_QWORD *)&keys[14] = v24;
    _os_log_debug_impl(&dword_19AF50000, v22, OS_LOG_TYPE_DEBUG, "%s reason: %@", keys, 0x16u);

  }
  if (self->_platform == 2)
  {
    if ((unint64_t)(a3 - 1) < 0x14)
    {
      notification = self->_notification;
      v29 = 0;
      objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", notification, 1, &v29);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = (char *)v29;
      if (!v10 && v9)
      {
        v11 = objc_retainAutorelease(v9);
        v12 = xpc_data_create((const void *)objc_msgSend(v11, "bytes"), objc_msgSend(v11, "length"));
        *(_QWORD *)keys = "type";
        *(_QWORD *)&keys[8] = "notification";
        *(_QWORD *)&keys[16] = "source_app_id";
        v34 = "announcement_platform";
        v35 = "deactivation_reason";
        values[0] = xpc_int64_create(9);
        v13 = v12;
        values[1] = v13;
        values[2] = xpc_string_create(-[NSString UTF8String](self->_sourceAppId, "UTF8String"));
        values[3] = xpc_int64_create(self->_platform);
        values[4] = xpc_int64_create(a3);
        v14 = xpc_dictionary_create((const char *const *)keys, values, 5uLL);
        _ExternalRequestConnectionWithContext(0);
        v15 = objc_claimAutoreleasedReturnValue();
        v16 = (void *)v15;
        v17 = AFSiriLogContextConnection;
        if (v14 && v15)
        {
          if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 136315138;
            v31 = "-[AFSiriUserNotificationRequest deactivateRequestForReason:completion:]";
            _os_log_debug_impl(&dword_19AF50000, v17, OS_LOG_TYPE_DEBUG, "%s Sending xpc message for request deactivation.", buf, 0xCu);
          }
          handler[0] = MEMORY[0x1E0C809B0];
          handler[1] = 3221225472;
          handler[2] = __71__AFSiriUserNotificationRequest_deactivateRequestForReason_completion___block_invoke;
          handler[3] = &unk_1E3A35578;
          v28 = v6;
          v27 = v16;
          xpc_connection_send_message_with_reply(v27, v14, 0, handler);

LABEL_26:
          for (i = 4; i != -1; --i)

          goto LABEL_28;
        }
        if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315138;
          v31 = "-[AFSiriUserNotificationRequest deactivateRequestForReason:completion:]";
          _os_log_error_impl(&dword_19AF50000, v17, OS_LOG_TYPE_ERROR, "%s Unable to send xpc message for request deactivation.", buf, 0xCu);
          if (!v6)
          {
LABEL_24:
            if (v16)
              xpc_connection_cancel((xpc_connection_t)v16);
            goto LABEL_26;
          }
        }
        else if (!v6)
        {
          goto LABEL_24;
        }
        (*((void (**)(id, _QWORD))v6 + 2))(v6, 0);
        goto LABEL_24;
      }
      v20 = AFSiriLogContextConnection;
      if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
      {
        v25 = self->_notification;
        *(_DWORD *)keys = 136315650;
        *(_QWORD *)&keys[4] = "-[AFSiriUserNotificationRequest deactivateRequestForReason:completion:]";
        *(_WORD *)&keys[12] = 2112;
        *(_QWORD *)&keys[14] = v25;
        *(_WORD *)&keys[22] = 2112;
        v34 = v10;
        _os_log_error_impl(&dword_19AF50000, v20, OS_LOG_TYPE_ERROR, "%s Failed to serialize notification %@: %@", keys, 0x20u);
        if (!v6)
          goto LABEL_20;
      }
      else if (!v6)
      {
LABEL_20:
        v13 = 0;
LABEL_28:

        goto LABEL_29;
      }
      (*((void (**)(id, _QWORD))v6 + 2))(v6, 0);
      goto LABEL_20;
    }
    v19 = AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)keys = 136315394;
      *(_QWORD *)&keys[4] = "-[AFSiriUserNotificationRequest deactivateRequestForReason:completion:]";
      *(_WORD *)&keys[12] = 2048;
      *(_QWORD *)&keys[14] = a3;
      _os_log_debug_impl(&dword_19AF50000, v19, OS_LOG_TYPE_DEBUG, "%s unspecified deactivation reason %li. Ignoring.", keys, 0x16u);
      if (!v6)
        goto LABEL_29;
      goto LABEL_16;
    }
  }
  else
  {
    v18 = AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)keys = 136315138;
      *(_QWORD *)&keys[4] = "-[AFSiriUserNotificationRequest deactivateRequestForReason:completion:]";
      _os_log_error_impl(&dword_19AF50000, v18, OS_LOG_TYPE_ERROR, "%s deactivation requests are currently only supported for CarPlay.", keys, 0xCu);
      if (!v6)
        goto LABEL_29;
      goto LABEL_16;
    }
  }
  if (v6)
LABEL_16:
    (*((void (**)(id, _QWORD))v6 + 2))(v6, 0);
LABEL_29:

}

- (void)withdrawalRequestWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  UNNotification *v6;
  void *v7;
  id v8;
  BOOL v9;
  NSObject *v10;
  id v11;
  xpc_object_t v12;
  id v13;
  xpc_object_t v14;
  uint64_t v15;
  void *v16;
  NSObject *v17;
  uint64_t i;
  UNNotification *notification;
  UNNotification *v20;
  UNNotification *v21;
  UNNotification *v22;
  _QWORD handler[4];
  _xpc_connection_s *v24;
  id v25;
  id v26;
  xpc_object_t values[2];
  char *keys[2];
  uint8_t buf[4];
  const char *v30;
  __int16 v31;
  UNNotification *v32;
  __int16 v33;
  id v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_DEBUG))
  {
    notification = self->_notification;
    *(_DWORD *)buf = 136315394;
    v30 = "-[AFSiriUserNotificationRequest withdrawalRequestWithCompletion:]";
    v31 = 2112;
    v32 = notification;
    _os_log_debug_impl(&dword_19AF50000, v5, OS_LOG_TYPE_DEBUG, "%s %@", buf, 0x16u);
  }
  v6 = self->_notification;
  v26 = 0;
  objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", v6, 1, &v26);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v26;
  if (v8)
    v9 = 1;
  else
    v9 = v7 == 0;
  if (!v9)
  {
    v11 = objc_retainAutorelease(v7);
    v12 = xpc_data_create((const void *)objc_msgSend(v11, "bytes"), objc_msgSend(v11, "length"));
    keys[0] = "type";
    keys[1] = "notification";
    values[0] = xpc_int64_create(10);
    v13 = v12;
    values[1] = v13;
    v14 = xpc_dictionary_create((const char *const *)keys, values, 2uLL);
    _ExternalRequestConnectionWithContext(0);
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = (void *)v15;
    v17 = AFSiriLogContextConnection;
    if (v14 && v15)
    {
      if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_DEBUG))
      {
        v21 = self->_notification;
        *(_DWORD *)buf = 136315394;
        v30 = "-[AFSiriUserNotificationRequest withdrawalRequestWithCompletion:]";
        v31 = 2112;
        v32 = v21;
        _os_log_debug_impl(&dword_19AF50000, v17, OS_LOG_TYPE_DEBUG, "%s Sending xpc message for %@", buf, 0x16u);
      }
      handler[0] = MEMORY[0x1E0C809B0];
      handler[1] = 3221225472;
      handler[2] = __65__AFSiriUserNotificationRequest_withdrawalRequestWithCompletion___block_invoke;
      handler[3] = &unk_1E3A35578;
      v25 = v4;
      v24 = v16;
      xpc_connection_send_message_with_reply(v24, v14, 0, handler);

LABEL_21:
      for (i = 1; i != -1; --i)

      goto LABEL_23;
    }
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
    {
      v22 = self->_notification;
      *(_DWORD *)buf = 136315394;
      v30 = "-[AFSiriUserNotificationRequest withdrawalRequestWithCompletion:]";
      v31 = 2112;
      v32 = v22;
      _os_log_error_impl(&dword_19AF50000, v17, OS_LOG_TYPE_ERROR, "%s Unable to send xpc message for %@", buf, 0x16u);
      if (!v4)
      {
LABEL_19:
        if (v16)
          xpc_connection_cancel((xpc_connection_t)v16);
        goto LABEL_21;
      }
    }
    else if (!v4)
    {
      goto LABEL_19;
    }
    (*((void (**)(id, _QWORD))v4 + 2))(v4, 0);
    goto LABEL_19;
  }
  v10 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
  {
    v20 = self->_notification;
    *(_DWORD *)buf = 136315650;
    v30 = "-[AFSiriUserNotificationRequest withdrawalRequestWithCompletion:]";
    v31 = 2112;
    v32 = v20;
    v33 = 2112;
    v34 = v8;
    _os_log_error_impl(&dword_19AF50000, v10, OS_LOG_TYPE_ERROR, "%s Failed to serialize notification %@: %@", buf, 0x20u);
  }
  (*((void (**)(id, _QWORD))v4 + 2))(v4, 0);
  v13 = 0;
LABEL_23:

}

- (void)deliverSummary:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(id, _QWORD);
  void *v8;
  id v9;
  BOOL v10;
  NSObject *v11;
  id v12;
  UNNotification *notification;
  void *v14;
  id v15;
  void *v16;
  id v17;
  xpc_object_t v18;
  id v19;
  xpc_object_t v20;
  id v21;
  xpc_object_t v22;
  uint64_t v23;
  void *v24;
  NSObject *v25;
  NSObject *v26;
  uint64_t i;
  UNNotification *v28;
  _QWORD handler[4];
  _xpc_connection_s *v30;
  void (**v31)(id, _QWORD);
  id v32;
  id v33;
  uint8_t buf[4];
  const char *v35;
  __int16 v36;
  id v37;
  xpc_object_t values[3];
  _BYTE keys[24];
  id v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void (**)(id, _QWORD))a4;
  v33 = 0;
  objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", v6, 1, &v33);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v33;
  if (v9)
    v10 = 1;
  else
    v10 = v8 == 0;
  if (!v10)
  {
    notification = self->_notification;
    v32 = 0;
    objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", notification, 1, &v32);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v32;
    v16 = v15;
    if (v15 || !v14)
    {
      v26 = AFSiriLogContextConnection;
      if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
      {
        v28 = self->_notification;
        *(_DWORD *)keys = 136315650;
        *(_QWORD *)&keys[4] = "-[AFSiriUserNotificationRequest deliverSummary:completion:]";
        *(_WORD *)&keys[12] = 2112;
        *(_QWORD *)&keys[14] = v28;
        *(_WORD *)&keys[22] = 2112;
        v40 = v16;
        _os_log_error_impl(&dword_19AF50000, v26, OS_LOG_TYPE_ERROR, "%s Failed to serialize notification %@: %@", keys, 0x20u);
      }
      v7[2](v7, 0);
      v21 = 0;
      v12 = 0;
      goto LABEL_27;
    }
    v17 = objc_retainAutorelease(v14);
    v18 = xpc_data_create((const void *)objc_msgSend(v17, "bytes"), objc_msgSend(v17, "length"));
    v19 = objc_retainAutorelease(v8);
    v20 = xpc_data_create((const void *)objc_msgSend(v19, "bytes"), objc_msgSend(v19, "length"));
    *(_QWORD *)keys = "type";
    *(_QWORD *)&keys[8] = "summary";
    *(_QWORD *)&keys[16] = "notification";
    values[0] = xpc_int64_create(16);
    v12 = v20;
    values[1] = v12;
    v21 = v18;
    values[2] = v21;
    v22 = xpc_dictionary_create((const char *const *)keys, values, 3uLL);
    _ExternalRequestConnectionWithContext(0);
    v23 = objc_claimAutoreleasedReturnValue();
    v24 = (void *)v23;
    v25 = AFSiriLogContextConnection;
    if (v22 && v23)
    {
      if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 136315394;
        v35 = "-[AFSiriUserNotificationRequest deliverSummary:completion:]";
        v36 = 2112;
        v37 = v6;
        _os_log_debug_impl(&dword_19AF50000, v25, OS_LOG_TYPE_DEBUG, "%s Sending xpc message for %@", buf, 0x16u);
      }
      handler[0] = MEMORY[0x1E0C809B0];
      handler[1] = 3221225472;
      handler[2] = __59__AFSiriUserNotificationRequest_deliverSummary_completion___block_invoke;
      handler[3] = &unk_1E3A35578;
      v31 = v7;
      v30 = v24;
      xpc_connection_send_message_with_reply(v30, v22, 0, handler);

LABEL_24:
      for (i = 2; i != -1; --i)

      v16 = 0;
LABEL_27:

      goto LABEL_28;
    }
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v35 = "-[AFSiriUserNotificationRequest deliverSummary:completion:]";
      v36 = 2112;
      v37 = v6;
      _os_log_error_impl(&dword_19AF50000, v25, OS_LOG_TYPE_ERROR, "%s Unable to send xpc message for %@", buf, 0x16u);
      if (!v7)
      {
LABEL_22:
        if (v24)
          xpc_connection_cancel((xpc_connection_t)v24);
        goto LABEL_24;
      }
    }
    else if (!v7)
    {
      goto LABEL_22;
    }
    v7[2](v7, 0);
    goto LABEL_22;
  }
  v11 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)keys = 136315650;
    *(_QWORD *)&keys[4] = "-[AFSiriUserNotificationRequest deliverSummary:completion:]";
    *(_WORD *)&keys[12] = 2112;
    *(_QWORD *)&keys[14] = v6;
    *(_WORD *)&keys[22] = 2112;
    v40 = v9;
    _os_log_error_impl(&dword_19AF50000, v11, OS_LOG_TYPE_ERROR, "%s Failed to serialize summary %@: %@", keys, 0x20u);
  }
  v7[2](v7, 0);
  v12 = 0;
LABEL_28:

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_summary, 0);
  objc_storeStrong((id *)&self->_sourceAppId, 0);
  objc_storeStrong((id *)&self->_notification, 0);
}

void __59__AFSiriUserNotificationRequest_deliverSummary_completion___block_invoke(uint64_t a1, void *a2)
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

void __65__AFSiriUserNotificationRequest_withdrawalRequestWithCompletion___block_invoke(uint64_t a1, void *a2)
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

void __71__AFSiriUserNotificationRequest_deactivateRequestForReason_completion___block_invoke(uint64_t a1, void *a2)
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

void __62__AFSiriUserNotificationRequest_performRequestWithCompletion___block_invoke(uint64_t a1, void *a2)
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

+ (BOOL)canBeHandled
{
  void *v2;
  char v3;

  +[AFSiriUserNotificationRequestCapabilityManager sharedManager](AFSiriUserNotificationRequestCapabilityManager, "sharedManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "requestCanBeHandled");

  return v3;
}

+ (BOOL)supportedOnPlatform
{
  void *v2;
  char v3;

  +[AFSiriUserNotificationRequestCapabilityManager sharedManager](AFSiriUserNotificationRequestCapabilityManager, "sharedManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hasEligibleSetup");

  return v3;
}

+ (BOOL)supportedForApplicationWithBundleId:(id)a3
{
  return +[AFSiriUserNotificationRequestCapabilityManager supportedByApplicationWithBundleID:](AFSiriUserNotificationRequestCapabilityManager, "supportedByApplicationWithBundleID:", a3);
}

@end
