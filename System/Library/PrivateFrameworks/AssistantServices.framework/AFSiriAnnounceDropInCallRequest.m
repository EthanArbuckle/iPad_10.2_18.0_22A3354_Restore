@implementation AFSiriAnnounceDropInCallRequest

- (AFSiriAnnounceDropInCallRequest)initWithAnnouncementType:(int64_t)a3
{
  AFSiriAnnounceDropInCallRequest *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)AFSiriAnnounceDropInCallRequest;
  result = -[AFSiriAnnounceDropInCallRequest init](&v5, sel_init);
  if (result)
    result->_announcementType = a3;
  return result;
}

- (void)performRequestWithCompletion:(id)a3
{
  id v4;
  void (**v5)(_QWORD, _QWORD);
  xpc_object_t v6;
  uint64_t v7;
  _xpc_connection_s *v8;
  NSObject *v9;
  uint64_t i;
  _QWORD v11[4];
  _xpc_connection_s *v12;
  void (**v13)(_QWORD, _QWORD);
  uint8_t buf[4];
  const char *v15;
  xpc_object_t values[2];
  char *keys[2];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void (**)(_QWORD, _QWORD))v4;
  if (!self->_announcementType)
  {
    (*((void (**)(id, _QWORD))v4 + 2))(v4, 0);
    goto LABEL_13;
  }
  *(_OWORD *)keys = xmmword_1E3A355F8;
  values[0] = xpc_int64_create(11);
  values[1] = xpc_int64_create(self->_announcementType);
  v6 = xpc_dictionary_create((const char *const *)keys, values, 2uLL);
  _ExternalRequestConnectionWithContext(0);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (_xpc_connection_s *)v7;
  if (!v6 || !v7)
  {
    v9 = AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v15 = "-[AFSiriAnnounceDropInCallRequest performRequestWithCompletion:]";
      _os_log_error_impl(&dword_19AF50000, v9, OS_LOG_TYPE_ERROR, "%s Unable to send xpc message.", buf, 0xCu);
      if (!v5)
      {
LABEL_9:
        if (v8)
          xpc_connection_cancel(v8);
        goto LABEL_11;
      }
    }
    else if (!v5)
    {
      goto LABEL_9;
    }
    v5[2](v5, 0);
    goto LABEL_9;
  }
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __64__AFSiriAnnounceDropInCallRequest_performRequestWithCompletion___block_invoke;
  v11[3] = &unk_1E3A35578;
  v13 = v5;
  v12 = v8;
  xpc_connection_send_message_with_reply(v12, v6, 0, v11);

LABEL_11:
  for (i = 1; i != -1; --i)

LABEL_13:
}

void __64__AFSiriAnnounceDropInCallRequest_performRequestWithCompletion___block_invoke(uint64_t a1, void *a2)
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
