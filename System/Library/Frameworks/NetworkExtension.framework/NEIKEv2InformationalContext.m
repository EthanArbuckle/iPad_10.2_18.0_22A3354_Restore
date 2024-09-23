@implementation NEIKEv2InformationalContext

- (id)initWithPrivateNotifies:(int)a3 maxRetries:(void *)a4 retryIntervalMilliseconds:(void *)a5 callbackQueue:(void *)a6 callback:
{
  id v12;
  id v13;
  id v14;
  id *v15;
  SEL v16;
  objc_super v18;

  v12 = a2;
  v13 = a5;
  v14 = a6;
  if (a1)
  {
    v18.receiver = a1;
    v18.super_class = (Class)NEIKEv2InformationalContext;
    v15 = (id *)objc_msgSendSuper2(&v18, sel_initWithRequestType_, 3);
    a1 = v15;
    if (v15)
    {
      objc_storeStrong(v15 + 4, a2);
      *((_DWORD *)a1 + 6) = a3;
      a1[5] = a4;
      objc_storeStrong(a1 + 6, a5);
      objc_setProperty_nonatomic_copy(a1, v16, v14, 56);
    }
  }

  return a1;
}

- (id)description
{
  NEIKEv2InformationalContext *v2;
  uint64_t v3;
  id v4;
  uint64_t v5;
  uint64_t maxRetries;
  unint64_t retryIntervalInMilliseconds;
  void *v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v12;

  v2 = self;
  if (self)
    self = (NEIKEv2InformationalContext *)self->_privateNotifies;
  v3 = -[NEIKEv2InformationalContext count](self, "count");
  v4 = objc_alloc(MEMORY[0x1E0CB3940]);
  if (v3)
  {
    if (v2)
    {
      v5 = -[NSArray count](v2->_privateNotifies, "count");
      maxRetries = v2->_maxRetries;
      retryIntervalInMilliseconds = v2->_retryIntervalInMilliseconds;
    }
    else
    {
      v5 = objc_msgSend(0, "count");
      maxRetries = 0;
      retryIntervalInMilliseconds = 0;
    }
    v8 = (void *)objc_msgSend(v4, "initWithFormat:", CFSTR("%llu private notifies with %u retries at %llums"), v5, maxRetries, retryIntervalInMilliseconds);
  }
  else
  {
    if (v2)
    {
      v9 = v2->_maxRetries;
      v10 = v2->_retryIntervalInMilliseconds;
    }
    else
    {
      v9 = 0;
      v10 = 0;
    }
    v8 = (void *)objc_msgSend(v4, "initWithFormat:", CFSTR("keepalive with %u retries at %llums"), v9, v10, v12);
  }
  return v8;
}

- (void)sendCallbackSuccess:(BOOL)a3 session:(id)a4
{
  _BOOL8 v4;
  _BYTE *v6;
  id v7;
  id v8;
  OS_dispatch_queue *v9;
  char v10;
  id v11;
  SEL v12;
  NSObject *callbackQueue;
  _QWORD block[4];
  _BYTE *v15;
  id v16;
  BOOL v17;
  objc_super v18;

  v4 = a3;
  v6 = a4;
  v18.receiver = self;
  v18.super_class = (Class)NEIKEv2InformationalContext;
  -[NEIKEv2RequestContext sendCallbackSuccess:session:](&v18, sel_sendCallbackSuccess_session_, v4, v6);
  if (self)
  {
    v7 = self->_callback;
    if (v7)
    {
      v8 = v7;
      v9 = self->_callbackQueue;
      if (!v9)
      {
LABEL_7:

        goto LABEL_8;
      }
      if (!v6)
      {

        goto LABEL_6;
      }
      v10 = v6[12];

      if ((v10 & 1) == 0)
      {
LABEL_6:
        v11 = self->_callback;
        objc_setProperty_nonatomic_copy(self, v12, 0, 56);
        callbackQueue = self->_callbackQueue;
        block[0] = MEMORY[0x1E0C809B0];
        block[1] = 3221225472;
        block[2] = __59__NEIKEv2InformationalContext_sendCallbackSuccess_session___block_invoke;
        block[3] = &unk_1E3CC2F48;
        v15 = v6;
        v16 = v11;
        v17 = v4;
        v8 = v11;
        dispatch_async(callbackQueue, block);

        goto LABEL_7;
      }
    }
  }
LABEL_8:

}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_callback, 0);
  objc_storeStrong((id *)&self->_callbackQueue, 0);
  objc_storeStrong((id *)&self->_privateNotifies, 0);
}

uint64_t __59__NEIKEv2InformationalContext_sendCallbackSuccess_session___block_invoke(uint64_t result)
{
  uint64_t v1;

  v1 = *(_QWORD *)(result + 32);
  if (!v1 || (*(_BYTE *)(v1 + 12) & 1) == 0)
    return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(result + 40) + 16))(*(_QWORD *)(result + 40), *(unsigned __int8 *)(result + 48));
  return result;
}

@end
