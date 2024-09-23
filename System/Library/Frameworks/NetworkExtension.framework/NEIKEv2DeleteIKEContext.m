@implementation NEIKEv2DeleteIKEContext

- (id)initDeleteIKEWithResponse:(void *)a3 callbackQueue:(void *)a4 callback:
{
  id v8;
  id v9;
  id *v10;
  SEL v11;
  objc_super v13;

  v8 = a3;
  v9 = a4;
  if (a1)
  {
    v13.receiver = a1;
    v13.super_class = (Class)NEIKEv2DeleteIKEContext;
    v10 = (id *)objc_msgSendSuper2(&v13, sel_initWithRequestType_, 7);
    a1 = v10;
    if (v10)
    {
      *((_BYTE *)v10 + 24) = a2;
      objc_storeStrong(v10 + 4, a3);
      objc_setProperty_nonatomic_copy(a1, v11, v9, 40);
    }
  }

  return a1;
}

- (id)description
{
  id v3;
  const __CFString *v4;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  v4 = CFSTR("NO");
  if (self && self->_responseNeeded)
    v4 = CFSTR("YES");
  return (id)objc_msgSend(v3, "initWithFormat:", CFSTR("delete IKE, response %@"), v4);
}

- (void)sendCallbackSuccess:(BOOL)a3 session:(id)a4
{
  id v6;
  OS_dispatch_queue *callbackQueue;
  id v8;
  SEL v9;
  NSObject *v10;
  id v11;
  _QWORD v12[4];
  id v13;
  BOOL v14;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)NEIKEv2DeleteIKEContext;
  -[NEIKEv2RequestContext sendCallbackSuccess:session:](&v15, sel_sendCallbackSuccess_session_, a3, a4);
  if (self)
  {
    v6 = self->_callback;
    if (v6)
    {
      callbackQueue = self->_callbackQueue;

      if (callbackQueue)
      {
        v8 = self->_callback;
        objc_setProperty_nonatomic_copy(self, v9, 0, 40);
        v10 = self->_callbackQueue;
        v12[0] = MEMORY[0x1E0C809B0];
        v12[1] = 3221225472;
        v12[2] = __55__NEIKEv2DeleteIKEContext_sendCallbackSuccess_session___block_invoke;
        v12[3] = &unk_1E3CC3B30;
        v13 = v8;
        v14 = a3;
        v11 = v8;
        dispatch_async(v10, v12);

      }
    }
  }
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_callback, 0);
  objc_storeStrong((id *)&self->_callbackQueue, 0);
}

uint64_t __55__NEIKEv2DeleteIKEContext_sendCallbackSuccess_session___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 40));
}

@end
