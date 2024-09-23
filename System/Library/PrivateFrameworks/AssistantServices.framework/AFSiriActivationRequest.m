@implementation AFSiriActivationRequest

- (AFSiriActivationRequest)initWithContext:(id)a3
{
  id v4;
  AFSiriActivationRequest *v5;
  uint64_t v6;
  AFSiriActivationContext *context;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AFSiriActivationRequest;
  v5 = -[AFSiriActivationRequest init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    context = v5->_context;
    v5->_context = (AFSiriActivationContext *)v6;

  }
  return v5;
}

- (void)performRequestWithResultHandler:(id)a3
{
  id v4;
  xpc_object_t v5;
  uint64_t v6;
  void *v7;
  id v8;
  uint64_t i;
  _QWORD v10[4];
  _xpc_connection_s *v11;
  id v12;
  xpc_object_t values[2];
  char *keys[2];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  *(_OWORD *)keys = xmmword_1E3A35608;
  values[0] = xpc_int64_create(6);
  AFSiriActivationCreateXPCDictionaryFromContext(self->_context);
  values[1] = (xpc_object_t)objc_claimAutoreleasedReturnValue();
  v5 = xpc_dictionary_create((const char *const *)keys, values, 2uLL);
  _ExternalRequestConnectionWithContext(0);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  if (v5 && v6)
  {
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __59__AFSiriActivationRequest_performRequestWithResultHandler___block_invoke;
    v10[3] = &unk_1E3A35578;
    v12 = v4;
    v11 = v7;
    xpc_connection_send_message_with_reply(v11, v5, 0, v10);

  }
  else
  {
    if (v4)
    {
      v8 = +[AFSiriActivationResult newWithBuilder:](AFSiriActivationResult, "newWithBuilder:", &__block_literal_global_70_38035);
      (*((void (**)(id, id))v4 + 2))(v4, v8);

    }
    if (v7)
      xpc_connection_cancel((xpc_connection_t)v7);
  }

  for (i = 1; i != -1; --i)
}

- (void)performRequestWithCompletion:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __56__AFSiriActivationRequest_performRequestWithCompletion___block_invoke;
  v6[3] = &unk_1E3A35680;
  v7 = v4;
  v5 = v4;
  -[AFSiriActivationRequest performRequestWithResultHandler:](self, "performRequestWithResultHandler:", v6);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_context, 0);
}

void __56__AFSiriActivationRequest_performRequestWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  id v3;

  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
  {
    objc_msgSend(a2, "error");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, BOOL))(v2 + 16))(v2, v3 == 0);

  }
}

void __59__AFSiriActivationRequest_performRequestWithResultHandler___block_invoke(uint64_t a1, xpc_object_t xdict)
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  id v6;
  id v7;

  xpc_dictionary_get_dictionary(xdict, "activation_result");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)v3;
  if (v3)
  {
    if (MEMORY[0x1A1AC0F84](v3) == MEMORY[0x1E0C812F8])
    {
      AFSiriActivationCreateResultFromXPCDictionary(v4);
      v3 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v3 = 0;
    }
  }
  v7 = (id)v3;
  v5 = *(_QWORD *)(a1 + 40);
  if (v5)
  {
    if (v3)
    {
      (*(void (**)(_QWORD))(v5 + 16))(*(_QWORD *)(a1 + 40));
    }
    else
    {
      v6 = +[AFSiriActivationResult newWithBuilder:](AFSiriActivationResult, "newWithBuilder:", &__block_literal_global_68_38037);
      (*(void (**)(uint64_t, id))(v5 + 16))(v5, v6);

    }
  }
  xpc_connection_cancel(*(xpc_connection_t *)(a1 + 32));

}

void __59__AFSiriActivationRequest_performRequestWithResultHandler___block_invoke_3(uint64_t a1, void *a2)
{
  id v2;
  id v3;

  v2 = a2;
  +[AFError errorWithCode:](AFError, "errorWithCode:", 2504);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setError:", v3);

}

void __59__AFSiriActivationRequest_performRequestWithResultHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  id v3;

  v2 = a2;
  +[AFError errorWithCode:](AFError, "errorWithCode:", 2505);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setError:", v3);

}

@end
