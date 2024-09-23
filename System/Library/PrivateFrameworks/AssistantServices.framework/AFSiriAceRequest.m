@implementation AFSiriAceRequest

- (AFSiriAceRequest)initWithStartRequest:(id)a3 requestOptions:(unint64_t)a4
{
  id v6;
  AFSiriAceRequest *v7;
  void *v8;
  void *v9;
  id v10;
  OS_xpc_object *v11;
  OS_xpc_object *startRequestData;
  OS_xpc_object *startLocalRequestData;
  objc_super v15;

  v6 = a3;
  v15.receiver = self;
  v15.super_class = (Class)AFSiriAceRequest;
  v7 = -[AFSiriAceRequest init](&v15, sel_init);
  if (v7)
  {
    objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", v6, 1, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v8)
    {
      v10 = objc_retainAutorelease(v8);
      v11 = (OS_xpc_object *)xpc_data_create((const void *)objc_msgSend(v10, "bytes"), objc_msgSend(v10, "length"));
      startRequestData = v7->_startRequestData;
      v7->_startRequestData = v11;
    }
    else
    {
      startRequestData = v7->_startRequestData;
      v7->_startRequestData = 0;
    }

    startLocalRequestData = v7->_startLocalRequestData;
    v7->_startLocalRequestData = 0;

    v7->_requestOptions = a4;
  }

  return v7;
}

- (AFSiriAceRequest)initWithStartRequest:(id)a3
{
  return -[AFSiriAceRequest initWithStartRequest:requestOptions:](self, "initWithStartRequest:requestOptions:", a3, 0);
}

- (AFSiriAceRequest)initWithStartLocalRequest:(id)a3 requestOptions:(unint64_t)a4
{
  id v6;
  AFSiriAceRequest *v7;
  void *v8;
  void *v9;
  id v10;
  OS_xpc_object *v11;
  OS_xpc_object *startLocalRequestData;
  OS_xpc_object *startRequestData;
  objc_super v15;

  v6 = a3;
  v15.receiver = self;
  v15.super_class = (Class)AFSiriAceRequest;
  v7 = -[AFSiriAceRequest init](&v15, sel_init);
  if (v7)
  {
    objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", v6, 1, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v8)
    {
      v10 = objc_retainAutorelease(v8);
      v11 = (OS_xpc_object *)xpc_data_create((const void *)objc_msgSend(v10, "bytes"), objc_msgSend(v10, "length"));
      startLocalRequestData = v7->_startLocalRequestData;
      v7->_startLocalRequestData = v11;
    }
    else
    {
      startLocalRequestData = v7->_startLocalRequestData;
      v7->_startLocalRequestData = 0;
    }

    startRequestData = v7->_startRequestData;
    v7->_startRequestData = 0;

    v7->_requestOptions = a4;
  }

  return v7;
}

- (void)performRequestWithCompletion:(id)a3
{
  id v4;
  void (**v5)(_QWORD, _QWORD);
  xpc_object_t v6;
  uint64_t i;
  uint64_t j;
  uint64_t v9;
  void *v10;
  _QWORD handler[4];
  _xpc_connection_s *v12;
  void (**v13)(_QWORD, _QWORD);
  xpc_object_t values;
  OS_xpc_object *v15;
  xpc_object_t v16;
  char *keys[2];
  const char *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void (**)(_QWORD, _QWORD))v4;
  if (self->_startRequestData)
  {
    *(_OWORD *)keys = xmmword_1E3A355B8;
    v18 = "request_options";
    values = xpc_int64_create(4);
    v15 = self->_startRequestData;
    v16 = xpc_uint64_create(self->_requestOptions);
    v6 = xpc_dictionary_create((const char *const *)keys, &values, 3uLL);
    for (i = 16; i != -8; i -= 8)

  }
  else
  {
    if (!self->_startLocalRequestData)
    {
      (*((void (**)(id, _QWORD))v4 + 2))(v4, 0);
      goto LABEL_16;
    }
    *(_OWORD *)keys = xmmword_1E3A355D0;
    v18 = "request_options";
    values = xpc_int64_create(5);
    v15 = self->_startLocalRequestData;
    v16 = xpc_uint64_create(self->_requestOptions);
    v6 = xpc_dictionary_create((const char *const *)keys, &values, 3uLL);
    for (j = 16; j != -8; j -= 8)

  }
  _ExternalRequestConnectionWithContext(0);
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)v9;
  if (v6 && v9)
  {
    handler[0] = MEMORY[0x1E0C809B0];
    handler[1] = 3221225472;
    handler[2] = __49__AFSiriAceRequest_performRequestWithCompletion___block_invoke;
    handler[3] = &unk_1E3A35578;
    v13 = v5;
    v12 = v10;
    xpc_connection_send_message_with_reply(v12, v6, 0, handler);

  }
  else
  {
    if (v5)
      v5[2](v5, 0);
    if (v10)
      xpc_connection_cancel((xpc_connection_t)v10);
  }

LABEL_16:
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_startLocalRequestData, 0);
  objc_storeStrong((id *)&self->_startRequestData, 0);
}

void __49__AFSiriAceRequest_performRequestWithCompletion___block_invoke(uint64_t a1, void *a2)
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
