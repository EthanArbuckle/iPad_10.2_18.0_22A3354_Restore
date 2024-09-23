@implementation CXVoicemailController

- (CXVoicemailController)init
{
  dispatch_queue_t v3;
  CXVoicemailController *v4;

  v3 = dispatch_queue_create("com.apple.callkit.voicemailcontroller.completion", 0);
  v4 = -[CXVoicemailController initWithQueue:](self, "initWithQueue:", v3);

  return v4;
}

- (CXVoicemailController)initWithQueue:(id)a3
{
  id v5;
  CXVoicemailController *v6;
  CXVoicemailObserver *v7;
  CXVoicemailObserver *voicemailObserver;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CXVoicemailController;
  v6 = -[CXVoicemailController init](&v10, sel_init);
  if (v6)
  {
    if (!v5)
      objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("%s: parameter '%@' cannot be nil"), "-[CXVoicemailController initWithQueue:]", CFSTR("queue"));
    objc_storeStrong((id *)&v6->_completionQueue, a3);
    v7 = objc_alloc_init(CXVoicemailObserver);
    voicemailObserver = v6->_voicemailObserver;
    v6->_voicemailObserver = v7;

  }
  return v6;
}

- (void)requestTransaction:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  _QWORD v10[5];
  id v11;
  uint8_t buf[4];
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  CXDefaultLog();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v13 = v6;
    _os_log_impl(&dword_1A402D000, v8, OS_LOG_TYPE_DEFAULT, "transaction: %@", buf, 0xCu);
  }

  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __55__CXVoicemailController_requestTransaction_completion___block_invoke;
  v10[3] = &unk_1E4B89388;
  v10[4] = self;
  v11 = v7;
  v9 = v7;
  -[CXVoicemailController _requestTransaction:completion:](self, "_requestTransaction:completion:", v6, v10);

}

void __55__CXVoicemailController_requestTransaction_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "completionQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __55__CXVoicemailController_requestTransaction_completion___block_invoke_2;
  v7[3] = &unk_1E4B89360;
  v5 = *(id *)(a1 + 40);
  v8 = v3;
  v9 = v5;
  v6 = v3;
  dispatch_async(v4, v7);

}

uint64_t __55__CXVoicemailController_requestTransaction_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

- (void)requestTransactionWithActions:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  CXTransaction *v9;
  int v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  CXDefaultLog();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v10 = 138412290;
    v11 = v6;
    _os_log_impl(&dword_1A402D000, v8, OS_LOG_TYPE_DEFAULT, "actions: %@", (uint8_t *)&v10, 0xCu);
  }

  v9 = -[CXTransaction initWithActions:]([CXTransaction alloc], "initWithActions:", v6);
  -[CXVoicemailController requestTransaction:completion:](self, "requestTransaction:completion:", v9, v7);

}

- (void)requestTransactionWithAction:(id)a3 completion:(id)a4
{
  void *v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v6 = (void *)MEMORY[0x1E0C99D20];
  v7 = a4;
  v8 = a3;
  objc_msgSend(v6, "arrayWithObjects:count:", &v10, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[CXVoicemailController requestTransactionWithActions:completion:](self, "requestTransactionWithActions:completion:", v9, v7, v10, v11);
}

- (void)_requestTransaction:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  id v10;
  id v11;
  _QWORD block[5];
  id v13;
  id v14;

  v6 = a3;
  v7 = a4;
  -[CXVoicemailController voicemailObserver](self, "voicemailObserver");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "queue");
  v9 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __56__CXVoicemailController__requestTransaction_completion___block_invoke;
  block[3] = &unk_1E4B88B58;
  block[4] = self;
  v13 = v6;
  v14 = v7;
  v10 = v7;
  v11 = v6;
  dispatch_async(v9, block);

}

void __56__CXVoicemailController__requestTransaction_completion___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "voicemailObserver");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dataSource");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "requestTransaction:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

}

- (CXVoicemailObserver)voicemailObserver
{
  return self->_voicemailObserver;
}

- (OS_dispatch_queue)completionQueue
{
  return self->_completionQueue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_completionQueue, 0);
  objc_storeStrong((id *)&self->_voicemailObserver, 0);
}

@end
