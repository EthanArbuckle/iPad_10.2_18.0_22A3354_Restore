@implementation CXAbstractProviderSource

- (CXAbstractProviderSource)initWithIdentifier:(id)a3
{
  id v5;
  CXAbstractProviderSource *v6;
  CXAbstractProviderSource *v7;
  NSObject *v8;
  dispatch_queue_t v9;
  OS_dispatch_queue *queue;
  CXAbstractProviderSource *v11;
  objc_super v13;

  v5 = a3;
  if (objc_msgSend(v5, "length"))
  {
    v13.receiver = self;
    v13.super_class = (Class)CXAbstractProviderSource;
    v6 = -[CXAbstractProviderSource init](&v13, sel_init);
    v7 = v6;
    if (v6)
    {
      objc_storeStrong((id *)&v6->_identifier, a3);
      dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      v8 = objc_claimAutoreleasedReturnValue();
      v9 = dispatch_queue_create("com.apple.callkit.providersource", v8);
      queue = v7->_queue;
      v7->_queue = (OS_dispatch_queue *)v9;

    }
    self = v7;
    v11 = self;
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- ($115C4C562B26FF47E01F9F4EA65B5887)auditToken
{
  __int128 v3;

  *(_QWORD *)&v3 = -1;
  *((_QWORD *)&v3 + 1) = -1;
  *(_OWORD *)retstr->var0 = v3;
  *(_OWORD *)&retstr->var0[4] = v3;
  return self;
}

- (NSString)bundleIdentifier
{
  return 0;
}

- (NSURL)bundleURL
{
  return 0;
}

- (CXAbstractProviderSourceDelegateInternal)internalDelegate
{
  void *v3;
  void *v4;

  -[CXAbstractProviderSource delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "conformsToProtocol:", &unk_1EE715F88))
  {
    -[CXAbstractProviderSource delegate](self, "delegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  return (CXAbstractProviderSourceDelegateInternal *)v4;
}

- (NSString)localizedName
{
  return 0;
}

- (int)processIdentifier
{
  return -1;
}

- (BOOL)isPermittedToUsePublicAPI
{
  return 0;
}

- (BOOL)isPermittedToUsePrivateAPI
{
  return 0;
}

- (BOOL)isPermittedToUseBluetoothAccessories
{
  return 0;
}

- (CXAbstractProviderVendorProtocol)vendorProtocolDelegate
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
    -[CXAbstractProviderSource internalDelegate](self, "internalDelegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v3)
      objc_msgSend(v5, "providerSourceConnectionStarted:", self);
    else
      objc_msgSend(v5, "providerSourceConnectionEnded:", self);

  }
}

- (void)beginWithCompletionHandler:(id)a3
{
  if (a3)
    (*((void (**)(id, _QWORD))a3 + 2))(a3, 0);
}

- (void)actionCompleted:(id)a3 completionHandler:(id)a4
{
  id v6;
  void (**v7)(id, _QWORD);
  NSObject *v8;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  NSObject *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  NSObject *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  _QWORD v34[5];
  _QWORD v35[5];
  uint8_t buf[4];
  const char *v37;
  __int16 v38;
  id v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void (**)(id, _QWORD))a4;
  CXDefaultLog();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v37 = "-[CXAbstractProviderSource actionCompleted:completionHandler:]";
    v38 = 2112;
    v39 = v6;
    _os_log_impl(&dword_1A402D000, v8, OS_LOG_TYPE_DEFAULT, "Received %s with action: %@", buf, 0x16u);
  }

  if (!v7)
  {
    CXDefaultLog();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      -[CXCallSource requestTransaction:completionHandler:].cold.1(v11, v12, v13, v14, v15, v16, v17, v18);

    goto LABEL_18;
  }
  if (v6)
  {
    if (-[CXAbstractProviderSource isPermittedToUsePublicAPI](self, "isPermittedToUsePublicAPI"))
    {
      if (!-[CXAbstractProviderSource isPermittedToUsePrivateAPI](self, "isPermittedToUsePrivateAPI"))
      {
        objc_msgSend(v6, "sanitizedCopy");
        v9 = objc_claimAutoreleasedReturnValue();

        v6 = (id)v9;
      }
      -[CXAbstractProviderSource internalDelegate](self, "internalDelegate");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "providerSource:actionCompleted:", self, v6);

      v7[2](v7, 0);
    }
    else
    {
      CXDefaultLog();
      v27 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
        -[CXAbstractProviderSource actionCompleted:completionHandler:].cold.3((uint64_t)self, v27, v28, v29, v30, v31, v32, v33);

      v34[0] = MEMORY[0x1E0C809B0];
      v34[1] = 3221225472;
      v34[2] = __62__CXAbstractProviderSource_actionCompleted_completionHandler___block_invoke_59;
      v34[3] = &unk_1E4B891F8;
      v34[4] = v7;
      __62__CXAbstractProviderSource_actionCompleted_completionHandler___block_invoke_59((uint64_t)v34);
    }
LABEL_18:

    goto LABEL_19;
  }
  CXDefaultLog();
  v19 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    -[CXCallSource actionCompleted:completionHandler:].cold.2(v19, v20, v21, v22, v23, v24, v25, v26);

  v35[0] = MEMORY[0x1E0C809B0];
  v35[1] = 3221225472;
  v35[2] = __62__CXAbstractProviderSource_actionCompleted_completionHandler___block_invoke_58;
  v35[3] = &unk_1E4B891F8;
  v35[4] = v7;
  __62__CXAbstractProviderSource_actionCompleted_completionHandler___block_invoke_58((uint64_t)v35);
LABEL_19:

}

void __62__CXAbstractProviderSource_actionCompleted_completionHandler___block_invoke_58(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB35C8], "cx_errorWithCode:", 2);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);

}

void __62__CXAbstractProviderSource_actionCompleted_completionHandler___block_invoke_59(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB35C8], "cx_errorWithCode:", 1);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);

}

- (void)requestTransaction:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  NSObject *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  NSObject *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  _QWORD v33[5];
  _QWORD v34[5];
  uint8_t buf[4];
  const char *v36;
  __int16 v37;
  id v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  CXDefaultLog();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v36 = "-[CXAbstractProviderSource requestTransaction:completionHandler:]";
    v37 = 2112;
    v38 = v6;
    _os_log_impl(&dword_1A402D000, v8, OS_LOG_TYPE_DEFAULT, "Received %s with transaction: %@", buf, 0x16u);
  }

  if (v7)
  {
    if (v6)
    {
      if (-[CXAbstractProviderSource isPermittedToUsePrivateAPI](self, "isPermittedToUsePrivateAPI"))
      {
        -[CXAbstractProviderSource delegate](self, "delegate");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "providerSource:requestedTransaction:completionHandler:", self, v6, v7);

      }
      else
      {
        CXDefaultLog();
        v26 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
          -[CXAbstractProviderSource requestTransaction:completionHandler:].cold.3((uint64_t)self, v26, v27, v28, v29, v30, v31, v32);

        v33[0] = MEMORY[0x1E0C809B0];
        v33[1] = 3221225472;
        v33[2] = __65__CXAbstractProviderSource_requestTransaction_completionHandler___block_invoke_64;
        v33[3] = &unk_1E4B891F8;
        v33[4] = v7;
        __65__CXAbstractProviderSource_requestTransaction_completionHandler___block_invoke_64((uint64_t)v33);
      }
    }
    else
    {
      CXDefaultLog();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        -[CXCallSource requestTransaction:completionHandler:].cold.2(v18, v19, v20, v21, v22, v23, v24, v25);

      v34[0] = MEMORY[0x1E0C809B0];
      v34[1] = 3221225472;
      v34[2] = __65__CXAbstractProviderSource_requestTransaction_completionHandler___block_invoke_63;
      v34[3] = &unk_1E4B891F8;
      v34[4] = v7;
      __65__CXAbstractProviderSource_requestTransaction_completionHandler___block_invoke_63((uint64_t)v34);
    }
  }
  else
  {
    CXDefaultLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      -[CXCallSource requestTransaction:completionHandler:].cold.1(v10, v11, v12, v13, v14, v15, v16, v17);

  }
}

void __65__CXAbstractProviderSource_requestTransaction_completionHandler___block_invoke_63(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB35C8], "cx_errorWithCode:", 2);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);

}

void __65__CXAbstractProviderSource_requestTransaction_completionHandler___block_invoke_64(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB35C8], "cx_requestTransactionErrorWithCode:", 1);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);

}

- (void)commitTransaction:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  CXAbstractProviderSource *v9;

  v4 = a3;
  -[CXAbstractProviderSource queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __46__CXAbstractProviderSource_commitTransaction___block_invoke;
  v7[3] = &unk_1E4B88A20;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(v5, v7);

}

void __46__CXAbstractProviderSource_commitTransaction___block_invoke(uint64_t a1)
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
    v7 = "-[CXAbstractProviderSource commitTransaction:]_block_invoke";
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
  CXAbstractProviderSource *v9;

  v4 = a3;
  -[CXAbstractProviderSource queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __48__CXAbstractProviderSource_handleActionTimeout___block_invoke;
  v7[3] = &unk_1E4B88A20;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(v5, v7);

}

void __48__CXAbstractProviderSource_handleActionTimeout___block_invoke(uint64_t a1)
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
    v7 = "-[CXAbstractProviderSource handleActionTimeout:]_block_invoke";
    v8 = 2112;
    v9 = v3;
    _os_log_impl(&dword_1A402D000, v2, OS_LOG_TYPE_DEFAULT, "Sending %s with action: %@", (uint8_t *)&v6, 0x16u);
  }

  objc_msgSend(*(id *)(a1 + 40), "vendorProtocolDelegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(*(id *)(a1 + 32), "copy");
  objc_msgSend(v4, "handleActionTimeout:", v5);

}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@ %p"), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_identifier);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CXAbstractProviderSource identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(" %@=%@"), v4, v5);

  objc_msgSend(v3, "appendFormat:", CFSTR(", "));
  NSStringFromSelector(sel_isConnected);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(" %@=%d"), v6, -[CXAbstractProviderSource isConnected](self, "isConnected"));

  objc_msgSend(v3, "appendFormat:", CFSTR(", "));
  NSStringFromSelector(sel_processIdentifier);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(" %@=%d"), v7, -[CXAbstractProviderSource processIdentifier](self, "processIdentifier"));

  objc_msgSend(v3, "appendFormat:", CFSTR(", "));
  NSStringFromSelector(sel_isPermittedToUsePublicAPI);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(" %@=%d"), v8, -[CXAbstractProviderSource isPermittedToUsePublicAPI](self, "isPermittedToUsePublicAPI"));

  objc_msgSend(v3, "appendFormat:", CFSTR(", "));
  NSStringFromSelector(sel_isPermittedToUsePrivateAPI);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(" %@=%d"), v9, -[CXAbstractProviderSource isPermittedToUsePrivateAPI](self, "isPermittedToUsePrivateAPI"));

  objc_msgSend(v3, "appendString:", CFSTR(">"));
  return (NSString *)v3;
}

- (CXAbstractProviderSourceDelegate)delegate
{
  return (CXAbstractProviderSourceDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSString)identifier
{
  return self->_identifier;
}

- (BOOL)isConnected
{
  return self->_connected;
}

- (void)setInternalDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_internalDelegate, a3);
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
  objc_destroyWeak((id *)&self->_internalDelegate);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)actionCompleted:(uint64_t)a3 completionHandler:(uint64_t)a4 .cold.3(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1A402D000, a2, a3, "Provider source is not entitled to use public API: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)requestTransaction:(uint64_t)a3 completionHandler:(uint64_t)a4 .cold.3(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1A402D000, a2, a3, "Provider source is not entitled to use private API: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

@end
