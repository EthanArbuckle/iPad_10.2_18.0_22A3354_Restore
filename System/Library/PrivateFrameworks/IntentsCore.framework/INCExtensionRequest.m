@implementation INCExtensionRequest

- (INCExtensionRequest)initWithIdentifier:(id)a3
{
  id v5;
  INCExtensionRequest *v6;
  NSObject *v7;
  dispatch_queue_t v8;
  OS_dispatch_queue *queue;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)INCExtensionRequest;
  v6 = -[INCExtensionRequest init](&v11, sel_init);
  if (v6)
  {
    INLogInitIfNeeded();
    dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = dispatch_queue_create("INCExtensionRequestQueue", v7);
    queue = v6->_queue;
    v6->_queue = (OS_dispatch_queue *)v8;

    objc_storeStrong((id *)&v6->_identifier, a3);
    *(_WORD *)&v6->_requiresTCC = 257;

  }
  return v6;
}

- (NSArray)extensionInputItems
{
  return self->_extensionInputItems;
}

- (void)setExtensionInputItems:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __46__INCExtensionRequest_setExtensionInputItems___block_invoke;
  v7[3] = &unk_1E6BC41E0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

- (void)startRequestForIntent:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *queue;
  _QWORD block[5];
  id v11;
  id v12;

  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (v7)
  {
    queue = self->_queue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __56__INCExtensionRequest_startRequestForIntent_completion___block_invoke;
    block[3] = &unk_1E6BC4BA8;
    block[4] = self;
    v12 = v7;
    v11 = v6;
    dispatch_async(queue, block);

  }
}

uint64_t __46__INCExtensionRequest_setExtensionInputItems___block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 72), *(id *)(a1 + 40));
  return objc_msgSend(*(id *)(a1 + 32), "_resetExtensionContextHostWithCompletion:", 0);
}

- (void)_resetExtensionContextHostWithCompletion:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  -[INCExtensionRequest _resetContextTimer](self, "_resetContextTimer");
  -[INCExtensionRequest _extensionContextHost](self, "_extensionContextHost");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_auxiliaryConnection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "remoteObjectProxy");
  v8 = (id)objc_claimAutoreleasedReturnValue();

  if (v4)
    v7 = v4;
  else
    v7 = &__block_literal_global;
  objc_msgSend(v8, "completeTransactionWithIntentIdentifier:completion:", self->_identifier, v7);

}

- (void)_resetContextTimer
{
  INWatchdogTimer *contextTimer;

  -[INWatchdogTimer cancel](self->_contextTimer, "cancel");
  contextTimer = self->_contextTimer;
  self->_contextTimer = 0;

}

- (id)_extensionContextHost
{
  NSExtension *extension;
  void *v4;
  void *v5;
  NSObject *v7;
  objc_class *v8;
  void *v9;
  int v10;
  const char *v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  extension = self->_extension;
  if (!extension || !self->_requestIdentifier)
  {
LABEL_7:
    v4 = 0;
    return v4;
  }
  -[NSExtension _extensionContextForUUID:](extension, "_extensionContextForUUID:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v5 = (void *)*MEMORY[0x1E0CBD670];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CBD670], OS_LOG_TYPE_ERROR))
    {
      v7 = v5;
      v8 = (objc_class *)objc_opt_class();
      NSStringFromClass(v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 136315394;
      v11 = "-[INCExtensionRequest _extensionContextHost]";
      v12 = 2112;
      v13 = v9;
      _os_log_error_impl(&dword_1B727D000, v7, OS_LOG_TYPE_ERROR, "%s Unexpected extension context class %@", (uint8_t *)&v10, 0x16u);

    }
    goto LABEL_7;
  }
  return v4;
}

void __56__INCExtensionRequest_startRequestForIntent_completion___block_invoke(id *a1)
{
  uint64_t v2;
  void (**v3)(_QWORD);
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void (**v8)(id, void *, void *, _QWORD);
  void *v9;
  id v10;
  _QWORD v11[4];
  void (**v12)(_QWORD);
  _QWORD v13[5];
  id v14;
  id v15;

  v2 = MEMORY[0x1E0C809B0];
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __56__INCExtensionRequest_startRequestForIntent_completion___block_invoke_2;
  v13[3] = &unk_1E6BC4BA8;
  v13[4] = a1[4];
  v15 = a1[6];
  v14 = a1[5];
  v3 = (void (**)(_QWORD))MEMORY[0x1BCCA5FB8](v13);
  objc_msgSend(a1[4], "_extensionContextHost");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "_auxiliaryConnection");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "remoteObjectProxy");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      v8 = (void (**)(id, void *, void *, _QWORD))a1[6];
      objc_msgSend(a1[4], "_extension");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v8[2](v8, v9, v5, 0);

      objc_msgSend(a1[4], "_scheduleContextTimer");
    }
    else
    {
      v10 = a1[4];
      v11[0] = v2;
      v11[1] = 3221225472;
      v11[2] = __56__INCExtensionRequest_startRequestForIntent_completion___block_invoke_6;
      v11[3] = &unk_1E6BC4A40;
      v12 = v3;
      objc_msgSend(v10, "_resetExtensionContextHostWithCompletion:", v11);

    }
  }
  else
  {
    v3[2](v3);
  }

}

void __56__INCExtensionRequest_startRequestForIntent_completion___block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD v10[5];
  _QWORD v11[5];
  id v12;

  objc_msgSend(*(id *)(a1 + 32), "_requestOperationQueue");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setSuspended:", 1);
  v3 = MEMORY[0x1E0C809B0];
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __56__INCExtensionRequest_startRequestForIntent_completion___block_invoke_3;
  v11[3] = &unk_1E6BC4AB8;
  v4 = *(id *)(a1 + 48);
  v11[4] = *(_QWORD *)(a1 + 32);
  v12 = v4;
  objc_msgSend(v2, "addOperationWithBlock:", v11);
  if ((unint64_t)objc_msgSend(v2, "operationCount") <= 1)
  {
    +[INCExtensionManager sharedManager](INCExtensionManager, "sharedManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = *(_QWORD *)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 32), "extensionInputItems");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(*(id *)(a1 + 32), "requiresTCC");
    v9 = objc_msgSend(*(id *)(a1 + 32), "requiresTrustCheck");
    v10[0] = v3;
    v10[1] = 3221225472;
    v10[2] = __56__INCExtensionRequest_startRequestForIntent_completion___block_invoke_4;
    v10[3] = &unk_1E6BC3F28;
    v10[4] = *(_QWORD *)(a1 + 32);
    objc_msgSend(v5, "fetchExtensionForIntent:extensionInputItems:requiresTCC:requiresTrustCheck:completion:", v6, v7, v8, v9, v10);

  }
}

- (id)_requestOperationQueue
{
  NSOperationQueue *requestOperationQueue;
  NSOperationQueue *v4;
  NSOperationQueue *v5;

  requestOperationQueue = self->_requestOperationQueue;
  if (!requestOperationQueue)
  {
    v4 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x1E0CB3828]);
    v5 = self->_requestOperationQueue;
    self->_requestOperationQueue = v4;

    -[NSOperationQueue setMaxConcurrentOperationCount:](self->_requestOperationQueue, "setMaxConcurrentOperationCount:", 1);
    requestOperationQueue = self->_requestOperationQueue;
  }
  return requestOperationQueue;
}

- (BOOL)requiresTCC
{
  return self->_requiresTCC;
}

void __56__INCExtensionRequest_startRequestForIntent_completion___block_invoke_4(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  NSObject *v14;
  _QWORD block[5];

  v7 = a2;
  v8 = a3;
  v9 = *(void **)(a1 + 32);
  v10 = a4;
  objc_msgSend(v9, "_setExtension:", v7);
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 8), a3);
  objc_msgSend(*(id *)(a1 + 32), "_setError:", v10);

  objc_msgSend(*(id *)(a1 + 32), "_extensionContextHost");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    objc_msgSend(v7, "_extensionBundle");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setExtensionBundle:", v12);

    objc_msgSend(*(id *)(a1 + 32), "_scheduleContextTimer");
  }
  v13 = *(_QWORD *)(a1 + 32);
  v14 = *(NSObject **)(v13 + 24);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __56__INCExtensionRequest_startRequestForIntent_completion___block_invoke_5;
  block[3] = &unk_1E6BC42F8;
  block[4] = v13;
  dispatch_async(v14, block);

}

- (void)_setExtension:(id)a3
{
  objc_storeStrong((id *)&self->_extension, a3);
}

- (void)_setError:(id)a3
{
  objc_storeStrong((id *)&self->_error, a3);
}

- (void)_scheduleContextTimer
{
  id v3;
  OS_dispatch_queue *queue;
  INWatchdogTimer *v5;
  INWatchdogTimer *contextTimer;
  uint64_t v7;
  uint64_t v8;
  void (*v9)(uint64_t);
  void *v10;
  id v11;
  id location;

  -[INCExtensionRequest _resetContextTimer](self, "_resetContextTimer");
  objc_initWeak(&location, self);
  v3 = objc_alloc(MEMORY[0x1E0CBDD00]);
  queue = self->_queue;
  v7 = MEMORY[0x1E0C809B0];
  v8 = 3221225472;
  v9 = __44__INCExtensionRequest__scheduleContextTimer__block_invoke;
  v10 = &unk_1E6BC43B0;
  objc_copyWeak(&v11, &location);
  v5 = (INWatchdogTimer *)objc_msgSend(v3, "initWithTimeoutInterval:onQueue:timeoutHandler:", queue, &v7, 120.0);
  contextTimer = self->_contextTimer;
  self->_contextTimer = v5;

  -[INWatchdogTimer start](self->_contextTimer, "start", v7, v8, v9, v10);
  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

void __56__INCExtensionRequest_startRequestForIntent_completion___block_invoke_5(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "_requestOperationQueue");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setSuspended:", 0);

}

void __56__INCExtensionRequest_startRequestForIntent_completion___block_invoke_3(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  id v5;

  v2 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "_extension");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "_extensionContextHost");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "_error");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id, void *, void *))(v2 + 16))(v2, v5, v3, v4);

}

- (NSExtension)_extension
{
  return self->_extension;
}

- (NSError)_error
{
  return self->_error;
}

- (void)reset
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __28__INCExtensionRequest_reset__block_invoke;
  block[3] = &unk_1E6BC42F8;
  block[4] = self;
  dispatch_async(queue, block);
}

uint64_t __28__INCExtensionRequest_reset__block_invoke(uint64_t a1)
{
  NSObject *v2;
  int v4;
  const char *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = *MEMORY[0x1E0CBD670];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CBD670], OS_LOG_TYPE_INFO))
  {
    v4 = 136315138;
    v5 = "-[INCExtensionRequest reset]_block_invoke";
    _os_log_impl(&dword_1B727D000, v2, OS_LOG_TYPE_INFO, "%s Reset extension request", (uint8_t *)&v4, 0xCu);
  }
  return objc_msgSend(*(id *)(a1 + 32), "_resetExtensionContextHostWithCompletion:", 0);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_extensionInputItems, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_extension, 0);
  objc_storeStrong((id *)&self->_requestOperationQueue, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_contextTimer, 0);
  objc_storeStrong((id *)&self->_requestIdentifier, 0);
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_identifier, a3);
}

- (void)setRequiresTCC:(BOOL)a3
{
  self->_requiresTCC = a3;
}

- (BOOL)requiresTrustCheck
{
  return self->_requiresTrustCheck;
}

- (void)setRequiresTrustCheck:(BOOL)a3
{
  self->_requiresTrustCheck = a3;
}

void __44__INCExtensionRequest__scheduleContextTimer__block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_extensionContextHost");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = v1;
  if (v1)
  {
    objc_msgSend(v1, "_auxiliaryConnection");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "remoteObjectProxy");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(WeakRetained, "identifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "cancelTransactionDueToTimeoutWithIntentIdentifier:completion:", v5, &__block_literal_global_7);

  }
}

uint64_t __56__INCExtensionRequest_startRequestForIntent_completion___block_invoke_6(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
    INLogInitIfNeeded();
}

@end
