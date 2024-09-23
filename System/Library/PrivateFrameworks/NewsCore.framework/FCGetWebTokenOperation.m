@implementation FCGetWebTokenOperation

- (FCGetWebTokenOperation)initWithEndpointConnection:(id)a3 completion:(id)a4
{
  id v7;
  id v8;
  FCGetWebTokenOperation *v9;
  FCGetWebTokenOperation *v10;
  void *v11;
  id completion;
  objc_super v14;

  v7 = a3;
  v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)FCGetWebTokenOperation;
  v9 = -[FCOperation init](&v14, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_endpointConnection, a3);
    v11 = _Block_copy(v8);
    completion = v10->_completion;
    v10->_completion = v11;

  }
  return v10;
}

- (void)performOperation
{
  FCNewsletterEndpointConnection *endpointConnection;
  void *v4;
  _QWORD v5[5];

  endpointConnection = self->_endpointConnection;
  dispatch_get_global_queue(-2, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __42__FCGetWebTokenOperation_performOperation__block_invoke;
  v5[3] = &unk_1E4644F18;
  v5[4] = self;
  -[FCNewsletterEndpointConnection getWebTokenWithCallbackQueue:completion:](endpointConnection, "getWebTokenWithCallbackQueue:completion:", v4, v5);

}

void __42__FCGetWebTokenOperation_performOperation__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  _QWORD *v6;
  uint64_t v7;
  id v8;

  v5 = a3;
  v6 = *(_QWORD **)(a1 + 32);
  v7 = v6[47];
  v8 = v5;
  if (v7)
  {
    (*(void (**)(uint64_t, uint64_t, id))(v7 + 16))(v7, a2, v5);
    v5 = v8;
    v6 = *(_QWORD **)(a1 + 32);
  }
  objc_msgSend(v6, "finishedPerformingOperationWithError:", v5);

}

- (FCNewsletterEndpointConnection)endpointConnection
{
  return self->_endpointConnection;
}

- (void)setEndpointConnection:(id)a3
{
  objc_storeStrong((id *)&self->_endpointConnection, a3);
}

- (id)completion
{
  return self->_completion;
}

- (void)setCompletion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 376);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completion, 0);
  objc_storeStrong((id *)&self->_endpointConnection, 0);
}

@end
