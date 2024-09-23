@implementation VSViewServiceRequestCenter

+ (id)sharedViewServiceRequestCenter
{
  if (sharedViewServiceRequestCenter___vs_lazy_init_predicate != -1)
    dispatch_once(&sharedViewServiceRequestCenter___vs_lazy_init_predicate, &__block_literal_global_37);
  return (id)sharedViewServiceRequestCenter___vs_lazy_init_variable;
}

void __60__VSViewServiceRequestCenter_sharedViewServiceRequestCenter__block_invoke()
{
  VSViewServiceRequestCenter *v0;
  void *v1;

  v0 = objc_alloc_init(VSViewServiceRequestCenter);
  v1 = (void *)sharedViewServiceRequestCenter___vs_lazy_init_variable;
  sharedViewServiceRequestCenter___vs_lazy_init_variable = (uint64_t)v0;

}

- (VSViewServiceRequestCenter)init
{
  VSViewServiceRequestCenter *v2;
  NSOperationQueue *v3;
  NSOperationQueue *requestQueue;
  NSOperationQueue *v5;
  NSOperationQueue *completionQueue;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)VSViewServiceRequestCenter;
  v2 = -[VSViewServiceRequestCenter init](&v8, sel_init);
  if (v2)
  {
    v3 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x1E0CB3828]);
    requestQueue = v2->_requestQueue;
    v2->_requestQueue = v3;

    -[NSOperationQueue setName:](v2->_requestQueue, "setName:", CFSTR("VSViewServiceRequestCenter.Request"));
    -[NSOperationQueue setMaxConcurrentOperationCount:](v2->_requestQueue, "setMaxConcurrentOperationCount:", 1);
    v5 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x1E0CB3828]);
    completionQueue = v2->_completionQueue;
    v2->_completionQueue = v5;

    -[NSOperationQueue setName:](v2->_completionQueue, "setName:", CFSTR("VSViewServiceRequestCenter.Completion"));
  }
  return v2;
}

- (id)enqueueCompletionHandlerBlock:(id)a3
{
  void *v4;
  void *v5;
  VSAccountManagerResult *v6;

  objc_msgSend(MEMORY[0x1E0CB34C8], "blockOperationWithBlock:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[VSViewServiceRequestCenter completionQueue](self, "completionQueue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addOperation:", v4);

  v6 = -[VSAccountManagerResult initWithOperation:]([VSAccountManagerResult alloc], "initWithOperation:", v4);
  return v6;
}

- (id)enqueueRequest:(id)a3 withAccountManagerDelegate:(id)a4 operationDelegate:(id)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  int v14;
  uint64_t v15;
  void *v16;
  char v17;
  VSViewServiceRequestOperation *v18;
  void *v19;
  id v20;
  VSViewServiceRequestOperation *v21;
  void *v22;
  void *v23;
  void *v24;
  VSAccountManagerResult *v25;
  uint64_t v27;
  uint64_t v28;
  void (*v29)(uint64_t);
  void *v30;
  VSViewServiceRequestOperation *v31;
  id v32;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  if (!v10)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("The viewServiceRequest parameter must not be nil."));
  v14 = objc_msgSend(v10, "allowsAuthenticationUI");
  if (!v11 && v14)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("This kind of request requires a delegate."));
  objc_msgSend(v10, "localizedVideoTitle");
  v15 = objc_claimAutoreleasedReturnValue();
  if (v15)
  {
    v16 = (void *)v15;
    v17 = objc_msgSend(v10, "allowsAuthenticationUI");

    if ((v17 & 1) == 0)
      objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("A localized video title is not appropriate for this kind of request."));
  }
  v18 = -[VSViewServiceRequestOperation initWithViewServiceRequest:]([VSViewServiceRequestOperation alloc], "initWithViewServiceRequest:", v10);
  -[VSViewServiceRequestOperation setDelegate:](v18, "setDelegate:", v12);
  v19 = (void *)MEMORY[0x1E0CB34C8];
  v27 = MEMORY[0x1E0C809B0];
  v28 = 3221225472;
  v29 = __108__VSViewServiceRequestCenter_enqueueRequest_withAccountManagerDelegate_operationDelegate_completionHandler___block_invoke;
  v30 = &unk_1E939F3B0;
  v31 = v18;
  v32 = v13;
  v20 = v13;
  v21 = v18;
  objc_msgSend(v19, "blockOperationWithBlock:", &v27);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "addDependency:", v21, v27, v28, v29, v30);
  -[VSViewServiceRequestCenter completionQueue](self, "completionQueue");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "addOperation:", v22);

  -[VSViewServiceRequestCenter requestQueue](self, "requestQueue");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "addOperation:", v21);

  v25 = -[VSAccountManagerResult initWithOperation:]([VSAccountManagerResult alloc], "initWithOperation:", v21);
  return v25;
}

void __108__VSViewServiceRequestCenter_enqueueRequest_withAccountManagerDelegate_operationDelegate_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  _QWORD v3[4];
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "result");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __108__VSViewServiceRequestCenter_enqueueRequest_withAccountManagerDelegate_operationDelegate_completionHandler___block_invoke_2;
  v3[3] = &unk_1E939F5E0;
  v4 = *(id *)(a1 + 40);
  objc_msgSend(v2, "conditionallyUnwrapObject:", v3);

}

uint64_t __108__VSViewServiceRequestCenter_enqueueRequest_withAccountManagerDelegate_operationDelegate_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (NSOperationQueue)requestQueue
{
  return self->_requestQueue;
}

- (void)setRequestQueue:(id)a3
{
  objc_storeStrong((id *)&self->_requestQueue, a3);
}

- (NSOperationQueue)completionQueue
{
  return self->_completionQueue;
}

- (void)setCompletionQueue:(id)a3
{
  objc_storeStrong((id *)&self->_completionQueue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_completionQueue, 0);
  objc_storeStrong((id *)&self->_requestQueue, 0);
}

@end
