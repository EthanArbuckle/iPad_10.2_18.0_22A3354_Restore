@implementation CXVoicemailSource

- (CXVoicemailSource)init
{
  CXVoicemailSource *v2;
  dispatch_queue_t v3;
  OS_dispatch_queue *queue;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CXVoicemailSource;
  v2 = -[CXVoicemailSource init](&v6, sel_init);
  if (v2)
  {
    v3 = dispatch_queue_create("com.apple.callkit.voicemailsource", 0);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v3;

  }
  return v2;
}

- (NSString)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[CXVoicemailSource identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ %p identifier=%@ isConnected=%d processIdentifier=%d isPermittedToUsePrivateAPI=%d>"), v4, self, v5, -[CXVoicemailSource isConnected](self, "isConnected"), -[CXVoicemailSource processIdentifier](self, "processIdentifier"), -[CXVoicemailSource isPermittedToUsePrivateAPI](self, "isPermittedToUsePrivateAPI"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

- (CXVoicemailProviderVendorProtocol)vendorProtocolDelegate
{
  return 0;
}

- (NSString)identifier
{
  return 0;
}

- (NSString)bundleIdentifier
{
  return 0;
}

- (NSURL)bundleURL
{
  return 0;
}

- (id)bundle
{
  return 0;
}

- (int)processIdentifier
{
  return -1;
}

- (BOOL)isPermittedToUsePrivateAPI
{
  return 0;
}

- (void)setConnected:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  id v6;

  if (self->_connected != a3)
  {
    v3 = a3;
    self->_connected = a3;
    -[CXVoicemailSource delegate](self, "delegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v3)
      objc_msgSend(v5, "voicemailSourceConnectionStarted:", self);
    else
      objc_msgSend(v5, "voicemailSourceConnectionEnded:", self);

  }
}

- (void)beginWithCompletionHandler:(id)a3
{
  if (a3)
    (*((void (**)(id, _QWORD))a3 + 2))(a3, 0);
}

- (void)registerWithConfiguration:(id)a3
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  int v8;
  const char *v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  CXDefaultLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 136315394;
    v9 = "-[CXVoicemailSource registerWithConfiguration:]";
    v10 = 2112;
    v11 = v4;
    _os_log_impl(&dword_1A402D000, v5, OS_LOG_TYPE_DEFAULT, "Received %s with configuration: %@", (uint8_t *)&v8, 0x16u);
  }

  if (!-[CXVoicemailSource isPermittedToUsePrivateAPI](self, "isPermittedToUsePrivateAPI"))
  {
    objc_msgSend(v4, "sanitizedCopy");
    v6 = objc_claimAutoreleasedReturnValue();

    v4 = (id)v6;
  }
  -[CXVoicemailSource delegate](self, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "voicemailSource:registeredWithConfiguration:", self, v4);

}

- (void)requestTransaction:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  NSObject *v10;
  _QWORD v11[5];
  uint8_t buf[4];
  const char *v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  CXDefaultLog();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v13 = "-[CXVoicemailSource requestTransaction:completionHandler:]";
    v14 = 2112;
    v15 = v6;
    _os_log_impl(&dword_1A402D000, v8, OS_LOG_TYPE_DEFAULT, "Received %s with transaction: %@", buf, 0x16u);
  }

  if (-[CXVoicemailSource isPermittedToUsePrivateAPI](self, "isPermittedToUsePrivateAPI"))
  {
    -[CXVoicemailSource delegate](self, "delegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "voicemailSource:requestedTransaction:completion:", self, v6, v7);

  }
  else
  {
    CXDefaultLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      -[CXVoicemailSource requestTransaction:completionHandler:].cold.1((uint64_t)self, v10);

    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __58__CXVoicemailSource_requestTransaction_completionHandler___block_invoke;
    v11[3] = &unk_1E4B891F8;
    v11[4] = v7;
    __58__CXVoicemailSource_requestTransaction_completionHandler___block_invoke((uint64_t)v11);
  }

}

void __58__CXVoicemailSource_requestTransaction_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB35C8], "cx_requestTransactionErrorWithCode:", 1);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);

}

- (void)reportNewVoicemailsWithUpdates:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  int v7;
  const char *v8;
  __int16 v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  CXDefaultLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 136315394;
    v8 = "-[CXVoicemailSource reportNewVoicemailsWithUpdates:]";
    v9 = 2112;
    v10 = v4;
    _os_log_impl(&dword_1A402D000, v5, OS_LOG_TYPE_DEFAULT, "Received %s with updates: %@", (uint8_t *)&v7, 0x16u);
  }

  -[CXVoicemailSource delegate](self, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "voicemailSource:reportNewVoicemailsWithUpdates:", self, v4);

}

- (void)reportVoicemailsUpdated:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  int v7;
  const char *v8;
  __int16 v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  CXDefaultLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 136315394;
    v8 = "-[CXVoicemailSource reportVoicemailsUpdated:]";
    v9 = 2112;
    v10 = v4;
    _os_log_impl(&dword_1A402D000, v5, OS_LOG_TYPE_DEFAULT, "Received %s with updates: %@", (uint8_t *)&v7, 0x16u);
  }

  -[CXVoicemailSource delegate](self, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "voicemailSource:reportVoicemailsUpdated:", self, v4);

}

- (void)reportVoicemailsRemovedWithUUIDs:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  int v7;
  const char *v8;
  __int16 v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  CXDefaultLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 136315394;
    v8 = "-[CXVoicemailSource reportVoicemailsRemovedWithUUIDs:]";
    v9 = 2112;
    v10 = v4;
    _os_log_impl(&dword_1A402D000, v5, OS_LOG_TYPE_DEFAULT, "Received %s with UUIDs: %@", (uint8_t *)&v7, 0x16u);
  }

  -[CXVoicemailSource delegate](self, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "voicemailSource:reportVoicemailsRemovedWithUUIDs:", self, v4);

}

- (void)actionCompleted:(id)a3 completionHandler:(id)a4
{
  id v6;
  void (**v7)(id, _QWORD);
  NSObject *v8;
  uint64_t v9;
  void *v10;
  int v11;
  const char *v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void (**)(id, _QWORD))a4;
  CXDefaultLog();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v11 = 136315394;
    v12 = "-[CXVoicemailSource actionCompleted:completionHandler:]";
    v13 = 2112;
    v14 = v6;
    _os_log_impl(&dword_1A402D000, v8, OS_LOG_TYPE_DEFAULT, "Received %s with action: %@", (uint8_t *)&v11, 0x16u);
  }

  if (!-[CXVoicemailSource isPermittedToUsePrivateAPI](self, "isPermittedToUsePrivateAPI"))
  {
    objc_msgSend(v6, "sanitizedCopy");
    v9 = objc_claimAutoreleasedReturnValue();

    v6 = (id)v9;
  }
  -[CXVoicemailSource delegate](self, "delegate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "voicemailSource:actionCompleted:", self, v6);

  v7[2](v7, 0);
}

- (void)commitTransaction:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  CXVoicemailSource *v9;

  v4 = a3;
  -[CXVoicemailSource queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __39__CXVoicemailSource_commitTransaction___block_invoke;
  v7[3] = &unk_1E4B88A20;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(v5, v7);

}

void __39__CXVoicemailSource_commitTransaction___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  int v6;
  const char *v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  CXDefaultLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v6 = 136315394;
    v7 = "-[CXVoicemailSource commitTransaction:]_block_invoke";
    v8 = 2112;
    v9 = v3;
    _os_log_impl(&dword_1A402D000, v2, OS_LOG_TYPE_DEFAULT, "Sending %s with transaction: %@", (uint8_t *)&v6, 0x16u);
  }

  objc_msgSend(*(id *)(a1 + 40), "vendorProtocolDelegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(*(id *)(a1 + 32), "copy");
  objc_msgSend(v4, "commitTransaction:", v5);

}

- (void)handleActionTimeout:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  CXVoicemailSource *v9;

  v4 = a3;
  -[CXVoicemailSource queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __41__CXVoicemailSource_handleActionTimeout___block_invoke;
  v7[3] = &unk_1E4B88A20;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(v5, v7);

}

void __41__CXVoicemailSource_handleActionTimeout___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  int v6;
  const char *v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  CXDefaultLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v6 = 136315394;
    v7 = "-[CXVoicemailSource handleActionTimeout:]_block_invoke";
    v8 = 2112;
    v9 = v3;
    _os_log_impl(&dword_1A402D000, v2, OS_LOG_TYPE_DEFAULT, "Sending %s with action: %@", (uint8_t *)&v6, 0x16u);
  }

  objc_msgSend(*(id *)(a1 + 40), "vendorProtocolDelegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(*(id *)(a1 + 32), "copy");
  objc_msgSend(v4, "handleActionTimeout:", v5);

}

- (CXVoicemailSourceDelegate)delegate
{
  return (CXVoicemailSourceDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BOOL)isConnected
{
  return self->_connected;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)requestTransaction:(uint64_t)a1 completionHandler:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_1A402D000, a2, OS_LOG_TYPE_ERROR, "Provider source is not entitled to use private API: %@", (uint8_t *)&v2, 0xCu);
}

@end
