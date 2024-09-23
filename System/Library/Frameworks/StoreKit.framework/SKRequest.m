@implementation SKRequest

- (SKRequest)init
{
  SKRequest *v2;
  SKRequestInternal *v3;
  id requestInternal;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SKRequest;
  v2 = -[SKRequest init](&v6, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(SKRequestInternal);
    requestInternal = v2->_requestInternal;
    v2->_requestInternal = v3;

  }
  return v2;
}

- (void)cancel
{
  _QWORD *requestInternal;
  id *v4;
  xpc_object_t v5;

  requestInternal = self->_requestInternal;
  if (requestInternal[5] == 1)
  {
    v4 = requestInternal;
    v5 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_int64(v5, "0", 10003);
    requestInternal[5] = 2;
    objc_msgSend(v4[3], "sendMessage:", v5);

  }
  -[SKRequest _endBackgroundTask](self, "_endBackgroundTask");
}

- (id)delegate
{
  return objc_loadWeakRetained((id *)self->_requestInternal + 4);
}

- (void)setDelegate:(id)delegate
{
  objc_storeWeak((id *)self->_requestInternal + 4, delegate);
}

- (void)start
{
  _QWORD *requestInternal;

  requestInternal = self->_requestInternal;
  if (requestInternal[5])
  {
    NSLog(CFSTR("%@: Ignoring start after already started"), a2, self);
  }
  else
  {
    requestInternal[5] = 1;
    -[SKRequest _beginBackgroundTask](self, "_beginBackgroundTask");
    -[SKRequest _start](self, "_start");
  }
}

- (SKPaymentQueueClient)paymentQueueClient
{
  return (SKPaymentQueueClient *)(id)objc_msgSend(*((id *)self->_requestInternal + 2), "copy");
}

- (void)setPaymentQueueClient:(id)a3
{
  _QWORD *requestInternal;
  uint64_t v5;
  void *v6;
  _QWORD *v7;

  requestInternal = self->_requestInternal;
  if ((id)requestInternal[2] != a3)
  {
    v7 = requestInternal;
    v5 = objc_msgSend(a3, "copy");
    v6 = (void *)requestInternal[2];
    requestInternal[2] = v5;

  }
}

- (id)errorFromCFObject:(id)a3
{
  id v3;
  uint64_t v4;

  v3 = a3;
  if (v3)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("SKErrorDomain"), 0, 0);
      v4 = objc_claimAutoreleasedReturnValue();

      v3 = (id)v4;
    }
  }
  return v3;
}

- (void)_start
{
  _QWORD *requestInternal;
  _QWORD *v4;
  void *v5;
  char v6;
  void *v7;

  requestInternal = self->_requestInternal;
  requestInternal[5] = 3;
  v4 = requestInternal;
  -[SKRequest delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    -[SKRequest delegate](self, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "requestDidFinish:", self);

  }
  -[SKRequest _endBackgroundTask](self, "_endBackgroundTask");
}

- (void)_shutdownRequest
{
  _QWORD *requestInternal;
  void *v4;
  _QWORD *v5;
  void *v6;

  requestInternal = self->_requestInternal;
  v4 = (void *)requestInternal[3];
  v5 = requestInternal;
  objc_msgSend(v4, "setDisconnectBlock:", 0);
  v6 = (void *)requestInternal[3];
  requestInternal[3] = 0;

  -[SKRequest _endBackgroundTask](self, "_endBackgroundTask");
}

- (void)_startWithMessage:(id)a3 replyBlock:(id)a4
{
  id v6;
  _QWORD *requestInternal;
  _QWORD *v8;
  id v9;
  SKXPCConnection *v10;
  void *v11;
  void *v12;
  _QWORD v13[4];
  id v14;

  v6 = a4;
  requestInternal = self->_requestInternal;
  if (!requestInternal[3])
  {
    v8 = requestInternal;
    v9 = a3;
    v10 = -[SKXPCConnection initWithServiceName:]([SKXPCConnection alloc], "initWithServiceName:", 0x1E5B2FB40);
    v11 = (void *)requestInternal[3];
    requestInternal[3] = v10;

    v12 = (void *)requestInternal[3];
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __42__SKRequest__startWithMessage_replyBlock___block_invoke;
    v13[3] = &unk_1E5B26DB0;
    v14 = v6;
    objc_msgSend(v12, "sendMessage:withReply:", v9, v13);

  }
}

uint64_t __42__SKRequest__startWithMessage_replyBlock___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)_beginBackgroundTask
{
  void *v3;
  _QWORD *v4;
  void *v5;
  objc_class *v6;
  void *v7;
  _QWORD v8[5];

  if (MGGetSInt32Answer() != 4)
  {
    v3 = (void *)MEMORY[0x1E0DC3470];
    v4 = self->_requestInternal;
    objc_msgSend(v3, "sharedApplication");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (objc_class *)objc_opt_class();
    NSStringFromClass(v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __33__SKRequest__beginBackgroundTask__block_invoke;
    v8[3] = &unk_1E5B267D8;
    v8[4] = self;
    v4[1] = objc_msgSend(v5, "beginBackgroundTaskWithName:expirationHandler:", v7, v8);

  }
}

uint64_t __33__SKRequest__beginBackgroundTask__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "cancel");
  return objc_msgSend(*(id *)(a1 + 32), "_endBackgroundTask");
}

- (void)_endBackgroundTask
{
  _QWORD *requestInternal;
  uint64_t v3;
  id v4;

  requestInternal = self->_requestInternal;
  v3 = requestInternal[1];
  if (v3 != *MEMORY[0x1E0DC4878])
  {
    requestInternal[1] = *MEMORY[0x1E0DC4878];
    objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "endBackgroundTask:", v3);

  }
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_requestInternal, 0);
}

@end
