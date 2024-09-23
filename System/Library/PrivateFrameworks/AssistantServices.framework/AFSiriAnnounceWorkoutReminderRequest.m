@implementation AFSiriAnnounceWorkoutReminderRequest

- (AFSiriAnnounceWorkoutReminderRequest)initWithWorkoutReminder:(id)a3
{
  id v4;
  AFSiriAnnounceWorkoutReminderRequest *v5;
  uint64_t v6;
  AFSiriWorkoutReminder *workoutReminder;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AFSiriAnnounceWorkoutReminderRequest;
  v5 = -[AFSiriAnnounceWorkoutReminderRequest init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    workoutReminder = v5->_workoutReminder;
    v5->_workoutReminder = (AFSiriWorkoutReminder *)v6;

  }
  return v5;
}

- (void)performRequestWithCompletion:(id)a3
{
  void (**v4)(id, _QWORD);
  NSObject *v5;
  AFSiriWorkoutReminder *v6;
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
  AFSiriWorkoutReminder *workoutReminder;
  AFSiriWorkoutReminder *v19;
  AFSiriWorkoutReminder *v20;
  AFSiriWorkoutReminder *v21;
  _QWORD handler[4];
  _xpc_connection_s *v23;
  void (**v24)(id, _QWORD);
  id v25;
  xpc_object_t values[2];
  char *keys[2];
  uint8_t buf[4];
  const char *v29;
  __int16 v30;
  AFSiriWorkoutReminder *v31;
  __int16 v32;
  id v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, _QWORD))a3;
  v5 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_DEBUG))
  {
    workoutReminder = self->_workoutReminder;
    *(_DWORD *)buf = 136315394;
    v29 = "-[AFSiriAnnounceWorkoutReminderRequest performRequestWithCompletion:]";
    v30 = 2112;
    v31 = workoutReminder;
    _os_log_debug_impl(&dword_19AF50000, v5, OS_LOG_TYPE_DEBUG, "%s Creating xpc for workout reminder announcement:%@", buf, 0x16u);
    if (!v4)
      goto LABEL_20;
  }
  else if (!v4)
  {
    goto LABEL_20;
  }
  v6 = self->_workoutReminder;
  v25 = 0;
  objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", v6, 1, &v25);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v25;
  if (v8 || !v7)
  {
    v16 = AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
    {
      v19 = self->_workoutReminder;
      *(_DWORD *)buf = 136315650;
      v29 = "-[AFSiriAnnounceWorkoutReminderRequest performRequestWithCompletion:]";
      v30 = 2112;
      v31 = v19;
      v32 = 2112;
      v33 = v8;
      _os_log_error_impl(&dword_19AF50000, v16, OS_LOG_TYPE_ERROR, "%s Failed to serialize workoutReminder %@: %@", buf, 0x20u);
    }
    v4[2](v4, 0);
    v11 = 0;
  }
  else
  {
    v9 = objc_retainAutorelease(v7);
    v10 = xpc_data_create((const void *)objc_msgSend(v9, "bytes"), objc_msgSend(v9, "length"));
    keys[0] = "type";
    keys[1] = "workout_reminder_announcement";
    values[0] = xpc_int64_create(12);
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
        v20 = self->_workoutReminder;
        *(_DWORD *)buf = 136315394;
        v29 = "-[AFSiriAnnounceWorkoutReminderRequest performRequestWithCompletion:]";
        v30 = 2112;
        v31 = v20;
        _os_log_debug_impl(&dword_19AF50000, v15, OS_LOG_TYPE_DEBUG, "%s Sending workout reminder announcement xpc message for %@", buf, 0x16u);
      }
      handler[0] = MEMORY[0x1E0C809B0];
      handler[1] = 3221225472;
      handler[2] = __69__AFSiriAnnounceWorkoutReminderRequest_performRequestWithCompletion___block_invoke;
      handler[3] = &unk_1E3A35578;
      v24 = v4;
      v23 = v14;
      xpc_connection_send_message_with_reply(v23, v12, 0, handler);

    }
    else
    {
      if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
      {
        v21 = self->_workoutReminder;
        *(_DWORD *)buf = 136315394;
        v29 = "-[AFSiriAnnounceWorkoutReminderRequest performRequestWithCompletion:]";
        v30 = 2112;
        v31 = v21;
        _os_log_error_impl(&dword_19AF50000, v15, OS_LOG_TYPE_ERROR, "%s Unable to send workout reminder annoucement xpc message for %@", buf, 0x16u);
      }
      v4[2](v4, 0);
      if (v14)
        xpc_connection_cancel((xpc_connection_t)v14);
    }

    for (i = 1; i != -1; --i)
  }

LABEL_20:
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_workoutReminder, 0);
}

void __69__AFSiriAnnounceWorkoutReminderRequest_performRequestWithCompletion___block_invoke(uint64_t a1, xpc_object_t xdict)
{
  if (xdict)
    xpc_dictionary_get_BOOL(xdict, "result");
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  xpc_connection_cancel(*(xpc_connection_t *)(a1 + 32));
}

+ (void)deactivateRequestForPredictionIdentifier:(id)a3 completion:(id)a4
{
  id v5;
  void (**v6)(id, _QWORD);
  NSObject *v7;
  void *v8;
  id v9;
  id v10;
  xpc_object_t v11;
  id v12;
  xpc_object_t v13;
  uint64_t v14;
  void *v15;
  NSObject *v16;
  NSObject *v17;
  uint64_t i;
  _QWORD handler[4];
  _xpc_connection_s *v20;
  void (**v21)(id, _QWORD);
  id v22;
  xpc_object_t values[2];
  char *keys[2];
  uint8_t buf[4];
  const char *v26;
  __int16 v27;
  id v28;
  __int16 v29;
  id v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = (void (**)(id, _QWORD))a4;
  if (AFLogInitIfNeeded_once != -1)
    dispatch_once(&AFLogInitIfNeeded_once, &__block_literal_global_2748);
  v7 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315394;
    v26 = "+[AFSiriAnnounceWorkoutReminderRequest deactivateRequestForPredictionIdentifier:completion:]";
    v27 = 2112;
    v28 = v5;
    _os_log_debug_impl(&dword_19AF50000, v7, OS_LOG_TYPE_DEBUG, "%s Creating xpc to deactivate workout reminder announcement with prediction identifier: %@", buf, 0x16u);
    if (!v6)
      goto LABEL_22;
  }
  else if (!v6)
  {
    goto LABEL_22;
  }
  v22 = 0;
  objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", v5, 1, &v22);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v22;
  if (v9 || !v8)
  {
    v17 = AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      v26 = "+[AFSiriAnnounceWorkoutReminderRequest deactivateRequestForPredictionIdentifier:completion:]";
      v27 = 2112;
      v28 = v5;
      v29 = 2112;
      v30 = v9;
      _os_log_error_impl(&dword_19AF50000, v17, OS_LOG_TYPE_ERROR, "%s Failed to serialize workout reminder prediction identifier %@: %@", buf, 0x20u);
    }
    v6[2](v6, 0);
    v12 = 0;
  }
  else
  {
    v10 = objc_retainAutorelease(v8);
    v11 = xpc_data_create((const void *)objc_msgSend(v10, "bytes"), objc_msgSend(v10, "length"));
    keys[0] = "type";
    keys[1] = "workout_reminder_prediction_identifier";
    values[0] = xpc_int64_create(13);
    v12 = v11;
    values[1] = v12;
    v13 = xpc_dictionary_create((const char *const *)keys, values, 2uLL);
    _ExternalRequestConnectionWithContext(0);
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = (void *)v14;
    v16 = AFSiriLogContextConnection;
    if (v13 && v14)
    {
      if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 136315394;
        v26 = "+[AFSiriAnnounceWorkoutReminderRequest deactivateRequestForPredictionIdentifier:completion:]";
        v27 = 2112;
        v28 = v5;
        _os_log_debug_impl(&dword_19AF50000, v16, OS_LOG_TYPE_DEBUG, "%s Sending deactivate workout reminder xpc message for prediction identifier:%@", buf, 0x16u);
      }
      handler[0] = MEMORY[0x1E0C809B0];
      handler[1] = 3221225472;
      handler[2] = __92__AFSiriAnnounceWorkoutReminderRequest_deactivateRequestForPredictionIdentifier_completion___block_invoke;
      handler[3] = &unk_1E3A35578;
      v21 = v6;
      v20 = v15;
      xpc_connection_send_message_with_reply(v20, v13, 0, handler);

    }
    else
    {
      if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v26 = "+[AFSiriAnnounceWorkoutReminderRequest deactivateRequestForPredictionIdentifier:completion:]";
        v27 = 2112;
        v28 = v5;
        _os_log_error_impl(&dword_19AF50000, v16, OS_LOG_TYPE_ERROR, "%s Unable to send deactivate request xpc message for workout prediction %@", buf, 0x16u);
      }
      v6[2](v6, 0);
      if (v15)
        xpc_connection_cancel((xpc_connection_t)v15);
    }

    for (i = 1; i != -1; --i)
  }

LABEL_22:
}

void __92__AFSiriAnnounceWorkoutReminderRequest_deactivateRequestForPredictionIdentifier_completion___block_invoke(uint64_t a1, xpc_object_t xdict)
{
  if (xdict)
    xpc_dictionary_get_BOOL(xdict, "result");
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  xpc_connection_cancel(*(xpc_connection_t *)(a1 + 32));
}

@end
