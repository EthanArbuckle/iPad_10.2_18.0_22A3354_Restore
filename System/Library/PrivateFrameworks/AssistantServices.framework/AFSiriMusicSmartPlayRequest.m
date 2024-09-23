@implementation AFSiriMusicSmartPlayRequest

- (void)performRequestWithCompletion:(id)a3
{
  id v3;
  xpc_object_t v4;
  uint64_t v5;
  void *v6;
  uint64_t i;
  _QWORD v8[4];
  _xpc_connection_s *v9;
  id v10;
  xpc_object_t values[2];
  char *keys[2];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  *(_OWORD *)keys = xmmword_1E3A355A8;
  values[0] = xpc_int64_create(1);
  values[1] = xpc_int64_create(2);
  v4 = xpc_dictionary_create((const char *const *)keys, values, 2uLL);
  _ExternalRequestConnectionWithContext(0);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  if (v4 && v5)
  {
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __60__AFSiriMusicSmartPlayRequest_performRequestWithCompletion___block_invoke;
    v8[3] = &unk_1E3A35578;
    v10 = v3;
    v9 = v6;
    xpc_connection_send_message_with_reply(v9, v4, 0, v8);

  }
  else
  {
    if (v3)
      (*((void (**)(id, _QWORD))v3 + 2))(v3, 0);
    if (v6)
      xpc_connection_cancel((xpc_connection_t)v6);
  }

  for (i = 1; i != -1; --i)
}

void __60__AFSiriMusicSmartPlayRequest_performRequestWithCompletion___block_invoke(uint64_t a1, void *a2)
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
