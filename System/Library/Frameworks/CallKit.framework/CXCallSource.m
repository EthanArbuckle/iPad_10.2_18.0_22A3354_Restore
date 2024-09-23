@implementation CXCallSource

- (CXCallSource)initWithIdentifier:(id)a3
{
  id v5;
  CXCallSource *v6;
  CXCallSource *v7;
  dispatch_queue_t v8;
  OS_dispatch_queue *queue;
  CXCallSource *v10;
  objc_super v12;

  v5 = a3;
  if (objc_msgSend(v5, "length"))
  {
    v12.receiver = self;
    v12.super_class = (Class)CXCallSource;
    v6 = -[CXCallSource init](&v12, sel_init);
    v7 = v6;
    if (v6)
    {
      objc_storeStrong((id *)&v6->_identifier, a3);
      v8 = dispatch_queue_create("com.apple.callkit.callsource", 0);
      queue = v7->_queue;
      v7->_queue = (OS_dispatch_queue *)v8;

    }
    self = v7;
    v10 = self;
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (NSString)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[CXCallSource identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ %p identifier=%@ isConnected=%d processIdentifier=%d isPermittedToUsePublicAPI=%d isPermittedToUsePrivateAPI=%d>"), v4, self, v5, -[CXCallSource isConnected](self, "isConnected"), -[CXCallSource processIdentifier](self, "processIdentifier"), -[CXCallSource isPermittedToUsePublicAPI](self, "isPermittedToUsePublicAPI"), -[CXCallSource isPermittedToUsePrivateAPI](self, "isPermittedToUsePrivateAPI"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

- (CXProviderVendorProtocol)vendorProtocolDelegate
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

- (NSString)localizedName
{
  return 0;
}

- (int)processIdentifier
{
  return -1;
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

- (void)setConnected:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  id v6;

  if (self->_connected != a3)
  {
    v3 = a3;
    self->_connected = a3;
    -[CXCallSource delegate](self, "delegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v3)
      objc_msgSend(v5, "callSourceConnectionStarted:", self);
    else
      objc_msgSend(v5, "callSourceConnectionEnded:", self);

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
    v9 = "-[CXCallSource registerWithConfiguration:]";
    v10 = 2112;
    v11 = v4;
    _os_log_impl(&dword_1A402D000, v5, OS_LOG_TYPE_DEFAULT, "Received %s with configuration: %@", (uint8_t *)&v8, 0x16u);
  }

  if (!-[CXCallSource isPermittedToUsePrivateAPI](self, "isPermittedToUsePrivateAPI"))
  {
    objc_msgSend(v4, "sanitizedCopy");
    v6 = objc_claimAutoreleasedReturnValue();

    v4 = (id)v6;
  }
  -[CXCallSource delegate](self, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "callSource:registeredWithConfiguration:", self, v4);

}

- (void)reportNewIncomingCallWithUUID:(id)a3 update:(id)a4 reply:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  NSObject *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  NSObject *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  NSObject *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  NSObject *v39;
  _QWORD v40[5];
  _QWORD v41[5];
  _QWORD v42[5];
  uint8_t buf[4];
  const char *v44;
  __int16 v45;
  void *v46;
  __int16 v47;
  id v48;
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  CXDefaultLog();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v8, "UUIDString");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315650;
    v44 = "-[CXCallSource reportNewIncomingCallWithUUID:update:reply:]";
    v45 = 2112;
    v46 = v12;
    v47 = 2112;
    v48 = v9;
    _os_log_impl(&dword_1A402D000, v11, OS_LOG_TYPE_DEFAULT, "Received %s with UUID: %@ update: %@", buf, 0x20u);

  }
  if (!v10)
  {
    CXDefaultLog();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      -[CXCallSource reportNewIncomingCallWithUUID:update:reply:].cold.1(v15, v16, v17, v18, v19, v20, v21, v22);

    goto LABEL_22;
  }
  if (!v8)
  {
    CXDefaultLog();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      -[CXCallSource reportNewIncomingCallWithUUID:update:reply:].cold.2(v23, v24, v25, v26, v27, v28, v29, v30);

    v42[0] = MEMORY[0x1E0C809B0];
    v42[1] = 3221225472;
    v42[2] = __59__CXCallSource_reportNewIncomingCallWithUUID_update_reply___block_invoke_7;
    v42[3] = &unk_1E4B891F8;
    v42[4] = v10;
    __59__CXCallSource_reportNewIncomingCallWithUUID_update_reply___block_invoke_7((uint64_t)v42);
    goto LABEL_22;
  }
  if (v9)
  {
    if (-[CXCallSource isPermittedToUsePublicAPI](self, "isPermittedToUsePublicAPI"))
    {
      if (!-[CXCallSource isPermittedToUsePrivateAPI](self, "isPermittedToUsePrivateAPI"))
      {
        objc_msgSend(v9, "sanitizedCopy");
        v13 = objc_claimAutoreleasedReturnValue();

        v9 = (id)v13;
      }
      -[CXCallSource delegate](self, "delegate");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "callSource:reportedNewIncomingCallWithUUID:update:completion:", self, v8, v9, v10);

    }
    else
    {
      CXDefaultLog();
      v39 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
        -[CXCallSource reportNewIncomingCallWithUUID:update:reply:].cold.4();

      v40[0] = MEMORY[0x1E0C809B0];
      v40[1] = 3221225472;
      v40[2] = __59__CXCallSource_reportNewIncomingCallWithUUID_update_reply___block_invoke_12;
      v40[3] = &unk_1E4B891F8;
      v40[4] = v10;
      __59__CXCallSource_reportNewIncomingCallWithUUID_update_reply___block_invoke_12((uint64_t)v40);
    }
LABEL_22:

    goto LABEL_23;
  }
  CXDefaultLog();
  v31 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
    -[CXCallSource reportNewIncomingCallWithUUID:update:reply:].cold.3(v31, v32, v33, v34, v35, v36, v37, v38);

  v41[0] = MEMORY[0x1E0C809B0];
  v41[1] = 3221225472;
  v41[2] = __59__CXCallSource_reportNewIncomingCallWithUUID_update_reply___block_invoke_11;
  v41[3] = &unk_1E4B891F8;
  v41[4] = v10;
  __59__CXCallSource_reportNewIncomingCallWithUUID_update_reply___block_invoke_11((uint64_t)v41);
LABEL_23:

}

void __59__CXCallSource_reportNewIncomingCallWithUUID_update_reply___block_invoke_7(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB35C8], "cx_errorWithCode:", 2);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);

}

void __59__CXCallSource_reportNewIncomingCallWithUUID_update_reply___block_invoke_11(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB35C8], "cx_errorWithCode:", 2);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);

}

void __59__CXCallSource_reportNewIncomingCallWithUUID_update_reply___block_invoke_12(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB35C8], "cx_incomingCallErrorWithCode:", 1);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);

}

- (void)reportCallWithUUID:(id)a3 updated:(id)a4
{
  -[CXCallSource reportCallWithUUID:updated:reply:](self, "reportCallWithUUID:updated:reply:", a3, a4, &__block_literal_global_14);
}

- (void)reportCallWithUUID:(id)a3 updated:(id)a4 reply:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, _QWORD);
  NSObject *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  NSObject *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  NSObject *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  NSObject *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  NSObject *v39;
  _QWORD v40[5];
  _QWORD v41[5];
  _QWORD v42[5];
  uint8_t buf[4];
  const char *v44;
  __int16 v45;
  void *v46;
  __int16 v47;
  id v48;
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, _QWORD))a5;
  CXDefaultLog();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v8, "UUIDString");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315650;
    v44 = "-[CXCallSource reportCallWithUUID:updated:reply:]";
    v45 = 2112;
    v46 = v12;
    v47 = 2112;
    v48 = v9;
    _os_log_impl(&dword_1A402D000, v11, OS_LOG_TYPE_DEFAULT, "Received %s with UUID: %@ update: %@", buf, 0x20u);

  }
  if (!v10)
  {
    CXDefaultLog();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      -[CXCallSource reportNewIncomingCallWithUUID:update:reply:].cold.1(v15, v16, v17, v18, v19, v20, v21, v22);

    goto LABEL_22;
  }
  if (!v8)
  {
    CXDefaultLog();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      -[CXCallSource reportNewIncomingCallWithUUID:update:reply:].cold.2(v23, v24, v25, v26, v27, v28, v29, v30);

    v42[0] = MEMORY[0x1E0C809B0];
    v42[1] = 3221225472;
    v42[2] = __49__CXCallSource_reportCallWithUUID_updated_reply___block_invoke_16;
    v42[3] = &unk_1E4B891F8;
    v42[4] = v10;
    __49__CXCallSource_reportCallWithUUID_updated_reply___block_invoke_16((uint64_t)v42);
    goto LABEL_22;
  }
  if (v9)
  {
    if (-[CXCallSource isPermittedToUsePublicAPI](self, "isPermittedToUsePublicAPI"))
    {
      if (!-[CXCallSource isPermittedToUsePrivateAPI](self, "isPermittedToUsePrivateAPI"))
      {
        objc_msgSend(v9, "sanitizedCopy");
        v13 = objc_claimAutoreleasedReturnValue();

        v9 = (id)v13;
      }
      -[CXCallSource delegate](self, "delegate");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "callSource:reportedCallWithUUID:updated:", self, v8, v9);

      v10[2](v10, 0);
    }
    else
    {
      CXDefaultLog();
      v39 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
        -[CXCallSource reportNewIncomingCallWithUUID:update:reply:].cold.4();

      v40[0] = MEMORY[0x1E0C809B0];
      v40[1] = 3221225472;
      v40[2] = __49__CXCallSource_reportCallWithUUID_updated_reply___block_invoke_18;
      v40[3] = &unk_1E4B891F8;
      v40[4] = v10;
      __49__CXCallSource_reportCallWithUUID_updated_reply___block_invoke_18((uint64_t)v40);
    }
LABEL_22:

    goto LABEL_23;
  }
  CXDefaultLog();
  v31 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
    -[CXCallSource reportNewIncomingCallWithUUID:update:reply:].cold.3(v31, v32, v33, v34, v35, v36, v37, v38);

  v41[0] = MEMORY[0x1E0C809B0];
  v41[1] = 3221225472;
  v41[2] = __49__CXCallSource_reportCallWithUUID_updated_reply___block_invoke_17;
  v41[3] = &unk_1E4B891F8;
  v41[4] = v10;
  __49__CXCallSource_reportCallWithUUID_updated_reply___block_invoke_17((uint64_t)v41);
LABEL_23:

}

void __49__CXCallSource_reportCallWithUUID_updated_reply___block_invoke_16(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB35C8], "cx_errorWithCode:", 2);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);

}

void __49__CXCallSource_reportCallWithUUID_updated_reply___block_invoke_17(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB35C8], "cx_errorWithCode:", 2);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);

}

void __49__CXCallSource_reportCallWithUUID_updated_reply___block_invoke_18(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB35C8], "cx_errorWithCode:", 1);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);

}

- (void)reportCallWithUUID:(id)a3 receivedDTMFUpdate:(id)a4
{
  -[CXCallSource reportCallWithUUID:receivedDTMFUpdate:reply:](self, "reportCallWithUUID:receivedDTMFUpdate:reply:", a3, a4, &__block_literal_global_19);
}

- (void)reportCallWithUUID:(id)a3 receivedDTMFUpdate:(id)a4 reply:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, _QWORD);
  NSObject *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  NSObject *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  NSObject *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  NSObject *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  NSObject *v39;
  _QWORD v40[5];
  _QWORD v41[5];
  _QWORD v42[5];
  uint8_t buf[4];
  const char *v44;
  __int16 v45;
  void *v46;
  __int16 v47;
  id v48;
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, _QWORD))a5;
  CXDefaultLog();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v8, "UUIDString");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315650;
    v44 = "-[CXCallSource reportCallWithUUID:receivedDTMFUpdate:reply:]";
    v45 = 2112;
    v46 = v12;
    v47 = 2112;
    v48 = v9;
    _os_log_impl(&dword_1A402D000, v11, OS_LOG_TYPE_DEFAULT, "Received %s with UUID: %@ dtmfUpdate: %@", buf, 0x20u);

  }
  if (!v10)
  {
    CXDefaultLog();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      -[CXCallSource reportNewIncomingCallWithUUID:update:reply:].cold.1(v15, v16, v17, v18, v19, v20, v21, v22);

    goto LABEL_22;
  }
  if (!v8)
  {
    CXDefaultLog();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      -[CXCallSource reportNewIncomingCallWithUUID:update:reply:].cold.2(v23, v24, v25, v26, v27, v28, v29, v30);

    v42[0] = MEMORY[0x1E0C809B0];
    v42[1] = 3221225472;
    v42[2] = __60__CXCallSource_reportCallWithUUID_receivedDTMFUpdate_reply___block_invoke_21;
    v42[3] = &unk_1E4B891F8;
    v42[4] = v10;
    __60__CXCallSource_reportCallWithUUID_receivedDTMFUpdate_reply___block_invoke_21((uint64_t)v42);
    goto LABEL_22;
  }
  if (v9)
  {
    if (-[CXCallSource isPermittedToUsePublicAPI](self, "isPermittedToUsePublicAPI"))
    {
      if (!-[CXCallSource isPermittedToUsePrivateAPI](self, "isPermittedToUsePrivateAPI"))
      {
        objc_msgSend(v9, "sanitizedCopy");
        v13 = objc_claimAutoreleasedReturnValue();

        v9 = (id)v13;
      }
      -[CXCallSource delegate](self, "delegate");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "callSource:reportedCallWithUUID:receivedDTMFUpdate:", self, v8, v9);

      v10[2](v10, 0);
    }
    else
    {
      CXDefaultLog();
      v39 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
        -[CXCallSource reportNewIncomingCallWithUUID:update:reply:].cold.4();

      v40[0] = MEMORY[0x1E0C809B0];
      v40[1] = 3221225472;
      v40[2] = __60__CXCallSource_reportCallWithUUID_receivedDTMFUpdate_reply___block_invoke_25;
      v40[3] = &unk_1E4B891F8;
      v40[4] = v10;
      __60__CXCallSource_reportCallWithUUID_receivedDTMFUpdate_reply___block_invoke_25((uint64_t)v40);
    }
LABEL_22:

    goto LABEL_23;
  }
  CXDefaultLog();
  v31 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
    -[CXCallSource reportCallWithUUID:receivedDTMFUpdate:reply:].cold.3(v31, v32, v33, v34, v35, v36, v37, v38);

  v41[0] = MEMORY[0x1E0C809B0];
  v41[1] = 3221225472;
  v41[2] = __60__CXCallSource_reportCallWithUUID_receivedDTMFUpdate_reply___block_invoke_24;
  v41[3] = &unk_1E4B891F8;
  v41[4] = v10;
  __60__CXCallSource_reportCallWithUUID_receivedDTMFUpdate_reply___block_invoke_24((uint64_t)v41);
LABEL_23:

}

void __60__CXCallSource_reportCallWithUUID_receivedDTMFUpdate_reply___block_invoke_21(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB35C8], "cx_errorWithCode:", 2);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);

}

void __60__CXCallSource_reportCallWithUUID_receivedDTMFUpdate_reply___block_invoke_24(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB35C8], "cx_errorWithCode:", 2);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);

}

void __60__CXCallSource_reportCallWithUUID_receivedDTMFUpdate_reply___block_invoke_25(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB35C8], "cx_errorWithCode:", 1);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);

}

- (void)reportCallWithUUID:(id)a3 endedAtDate:(id)a4 privateReason:(int64_t)a5 failureContext:(id)a6
{
  -[CXCallSource reportCallWithUUID:endedAtDate:privateReason:failureContext:reply:](self, "reportCallWithUUID:endedAtDate:privateReason:failureContext:reply:", a3, a4, a5, a6, &__block_literal_global_26);
}

- (void)reportCallWithUUID:(id)a3 endedAtDate:(id)a4 privateReason:(int64_t)a5 failureContext:(id)a6 reply:(id)a7
{
  id v12;
  id v13;
  id v14;
  void (**v15)(id, _QWORD);
  NSObject *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  NSObject *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  NSObject *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  NSObject *v36;
  _QWORD v37[5];
  _QWORD v38[5];
  uint8_t buf[4];
  const char *v40;
  __int16 v41;
  void *v42;
  __int16 v43;
  id v44;
  __int16 v45;
  int64_t v46;
  __int16 v47;
  id v48;
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v14 = a6;
  v15 = (void (**)(id, _QWORD))a7;
  CXDefaultLog();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v12, "UUIDString");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136316162;
    v40 = "-[CXCallSource reportCallWithUUID:endedAtDate:privateReason:failureContext:reply:]";
    v41 = 2112;
    v42 = v17;
    v43 = 2112;
    v44 = v13;
    v45 = 2048;
    v46 = a5;
    v47 = 2112;
    v48 = v14;
    _os_log_impl(&dword_1A402D000, v16, OS_LOG_TYPE_DEFAULT, "Received %s with UUID: %@ dateEnded: %@ privateEndedReason: %ld failureContext: %@", buf, 0x34u);

  }
  if (v15)
  {
    if (v12)
    {
      if (-[CXCallSource isPermittedToUsePublicAPI](self, "isPermittedToUsePublicAPI"))
      {
        if (!-[CXCallSource isPermittedToUsePrivateAPI](self, "isPermittedToUsePrivateAPI"))
        {
          objc_msgSend(v14, "sanitizedCopy");
          v18 = objc_claimAutoreleasedReturnValue();

          v14 = (id)v18;
        }
        -[CXCallSource delegate](self, "delegate");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "callSource:reportedCallWithUUID:endedAtDate:privateReason:failureContext:", self, v12, v13, a5, v14);

        v15[2](v15, 0);
      }
      else
      {
        CXDefaultLog();
        v36 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
          -[CXCallSource reportNewIncomingCallWithUUID:update:reply:].cold.4();

        v37[0] = MEMORY[0x1E0C809B0];
        v37[1] = 3221225472;
        v37[2] = __82__CXCallSource_reportCallWithUUID_endedAtDate_privateReason_failureContext_reply___block_invoke_29;
        v37[3] = &unk_1E4B891F8;
        v37[4] = v15;
        __82__CXCallSource_reportCallWithUUID_endedAtDate_privateReason_failureContext_reply___block_invoke_29((uint64_t)v37);
      }
    }
    else
    {
      CXDefaultLog();
      v28 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
        -[CXCallSource reportNewIncomingCallWithUUID:update:reply:].cold.2(v28, v29, v30, v31, v32, v33, v34, v35);

      v38[0] = MEMORY[0x1E0C809B0];
      v38[1] = 3221225472;
      v38[2] = __82__CXCallSource_reportCallWithUUID_endedAtDate_privateReason_failureContext_reply___block_invoke_28;
      v38[3] = &unk_1E4B891F8;
      v38[4] = v15;
      __82__CXCallSource_reportCallWithUUID_endedAtDate_privateReason_failureContext_reply___block_invoke_28((uint64_t)v38);
    }
  }
  else
  {
    CXDefaultLog();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      -[CXCallSource reportNewIncomingCallWithUUID:update:reply:].cold.1(v20, v21, v22, v23, v24, v25, v26, v27);

  }
}

void __82__CXCallSource_reportCallWithUUID_endedAtDate_privateReason_failureContext_reply___block_invoke_28(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB35C8], "cx_errorWithCode:", 2);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);

}

void __82__CXCallSource_reportCallWithUUID_endedAtDate_privateReason_failureContext_reply___block_invoke_29(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB35C8], "cx_errorWithCode:", 1);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);

}

- (void)reportOutgoingCallWithUUID:(id)a3 sentInvitationAtDate:(id)a4
{
  -[CXCallSource reportOutgoingCallWithUUID:sentInvitationAtDate:reply:](self, "reportOutgoingCallWithUUID:sentInvitationAtDate:reply:", a3, a4, &__block_literal_global_30);
}

- (void)reportOutgoingCallWithUUID:(id)a3 sentInvitationAtDate:(id)a4 reply:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, _QWORD);
  NSObject *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  NSObject *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  NSObject *v30;
  _QWORD v31[5];
  _QWORD v32[5];
  uint8_t buf[4];
  const char *v34;
  __int16 v35;
  void *v36;
  __int16 v37;
  id v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, _QWORD))a5;
  CXDefaultLog();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v8, "UUIDString");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315650;
    v34 = "-[CXCallSource reportOutgoingCallWithUUID:sentInvitationAtDate:reply:]";
    v35 = 2112;
    v36 = v12;
    v37 = 2112;
    v38 = v9;
    _os_log_impl(&dword_1A402D000, v11, OS_LOG_TYPE_DEFAULT, "Received %s with UUID: %@ dateSentInvitation: %@", buf, 0x20u);

  }
  if (v10)
  {
    if (v8)
    {
      if (-[CXCallSource isPermittedToUsePublicAPI](self, "isPermittedToUsePublicAPI"))
      {
        -[CXCallSource delegate](self, "delegate");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "callSource:reportedOutgoingCallWithUUID:sentInvitationAtDate:", self, v8, v9);

        v10[2](v10, 0);
      }
      else
      {
        CXDefaultLog();
        v30 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
          -[CXCallSource reportNewIncomingCallWithUUID:update:reply:].cold.4();

        v31[0] = MEMORY[0x1E0C809B0];
        v31[1] = 3221225472;
        v31[2] = __70__CXCallSource_reportOutgoingCallWithUUID_sentInvitationAtDate_reply___block_invoke_33;
        v31[3] = &unk_1E4B891F8;
        v31[4] = v10;
        __70__CXCallSource_reportOutgoingCallWithUUID_sentInvitationAtDate_reply___block_invoke_33((uint64_t)v31);
      }
    }
    else
    {
      CXDefaultLog();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
        -[CXCallSource reportNewIncomingCallWithUUID:update:reply:].cold.2(v22, v23, v24, v25, v26, v27, v28, v29);

      v32[0] = MEMORY[0x1E0C809B0];
      v32[1] = 3221225472;
      v32[2] = __70__CXCallSource_reportOutgoingCallWithUUID_sentInvitationAtDate_reply___block_invoke_32;
      v32[3] = &unk_1E4B891F8;
      v32[4] = v10;
      __70__CXCallSource_reportOutgoingCallWithUUID_sentInvitationAtDate_reply___block_invoke_32((uint64_t)v32);
    }
  }
  else
  {
    CXDefaultLog();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      -[CXCallSource reportNewIncomingCallWithUUID:update:reply:].cold.1(v14, v15, v16, v17, v18, v19, v20, v21);

  }
}

void __70__CXCallSource_reportOutgoingCallWithUUID_sentInvitationAtDate_reply___block_invoke_32(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB35C8], "cx_errorWithCode:", 2);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);

}

void __70__CXCallSource_reportOutgoingCallWithUUID_sentInvitationAtDate_reply___block_invoke_33(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB35C8], "cx_errorWithCode:", 1);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);

}

- (void)reportOutgoingCallWithUUID:(id)a3 startedConnectingAtDate:(id)a4
{
  -[CXCallSource reportOutgoingCallWithUUID:startedConnectingAtDate:reply:](self, "reportOutgoingCallWithUUID:startedConnectingAtDate:reply:", a3, a4, &__block_literal_global_34);
}

- (void)reportOutgoingCallWithUUID:(id)a3 startedConnectingAtDate:(id)a4 reply:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, _QWORD);
  NSObject *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  NSObject *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  NSObject *v30;
  _QWORD v31[5];
  _QWORD v32[5];
  uint8_t buf[4];
  const char *v34;
  __int16 v35;
  void *v36;
  __int16 v37;
  id v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, _QWORD))a5;
  CXDefaultLog();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v8, "UUIDString");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315650;
    v34 = "-[CXCallSource reportOutgoingCallWithUUID:startedConnectingAtDate:reply:]";
    v35 = 2112;
    v36 = v12;
    v37 = 2112;
    v38 = v9;
    _os_log_impl(&dword_1A402D000, v11, OS_LOG_TYPE_DEFAULT, "Received %s with UUID: %@ dateStartedConnecting: %@", buf, 0x20u);

  }
  if (v10)
  {
    if (v8)
    {
      if (-[CXCallSource isPermittedToUsePublicAPI](self, "isPermittedToUsePublicAPI"))
      {
        -[CXCallSource delegate](self, "delegate");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "callSource:reportedOutgoingCallWithUUID:startedConnectingAtDate:", self, v8, v9);

        v10[2](v10, 0);
      }
      else
      {
        CXDefaultLog();
        v30 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
          -[CXCallSource reportNewIncomingCallWithUUID:update:reply:].cold.4();

        v31[0] = MEMORY[0x1E0C809B0];
        v31[1] = 3221225472;
        v31[2] = __73__CXCallSource_reportOutgoingCallWithUUID_startedConnectingAtDate_reply___block_invoke_37;
        v31[3] = &unk_1E4B891F8;
        v31[4] = v10;
        __73__CXCallSource_reportOutgoingCallWithUUID_startedConnectingAtDate_reply___block_invoke_37((uint64_t)v31);
      }
    }
    else
    {
      CXDefaultLog();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
        -[CXCallSource reportNewIncomingCallWithUUID:update:reply:].cold.2(v22, v23, v24, v25, v26, v27, v28, v29);

      v32[0] = MEMORY[0x1E0C809B0];
      v32[1] = 3221225472;
      v32[2] = __73__CXCallSource_reportOutgoingCallWithUUID_startedConnectingAtDate_reply___block_invoke_36;
      v32[3] = &unk_1E4B891F8;
      v32[4] = v10;
      __73__CXCallSource_reportOutgoingCallWithUUID_startedConnectingAtDate_reply___block_invoke_36((uint64_t)v32);
    }
  }
  else
  {
    CXDefaultLog();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      -[CXCallSource reportNewIncomingCallWithUUID:update:reply:].cold.1(v14, v15, v16, v17, v18, v19, v20, v21);

  }
}

void __73__CXCallSource_reportOutgoingCallWithUUID_startedConnectingAtDate_reply___block_invoke_36(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB35C8], "cx_errorWithCode:", 2);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);

}

void __73__CXCallSource_reportOutgoingCallWithUUID_startedConnectingAtDate_reply___block_invoke_37(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB35C8], "cx_errorWithCode:", 1);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);

}

- (void)reportNewOutgoingCallWithUUID:(id)a3 update:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  int v11;
  const char *v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  CXDefaultLog();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v6, "UUIDString");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 136315394;
    v12 = "-[CXCallSource reportNewOutgoingCallWithUUID:update:]";
    v13 = 2112;
    v14 = v9;
    _os_log_impl(&dword_1A402D000, v8, OS_LOG_TYPE_DEFAULT, "Received %s with UUID: %@", (uint8_t *)&v11, 0x16u);

  }
  -[CXCallSource delegate](self, "delegate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "callSource:reportedNewOutgoingCallWithUUID:update:", self, v6, v7);

}

- (void)reportOutgoingCallWithUUID:(id)a3 connectedAtDate:(id)a4
{
  -[CXCallSource reportOutgoingCallWithUUID:connectedAtDate:reply:](self, "reportOutgoingCallWithUUID:connectedAtDate:reply:", a3, a4, &__block_literal_global_38);
}

- (void)reportOutgoingCallWithUUID:(id)a3 connectedAtDate:(id)a4 reply:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, _QWORD);
  NSObject *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  NSObject *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  NSObject *v30;
  _QWORD v31[5];
  _QWORD v32[5];
  uint8_t buf[4];
  const char *v34;
  __int16 v35;
  void *v36;
  __int16 v37;
  id v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, _QWORD))a5;
  CXDefaultLog();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v8, "UUIDString");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315650;
    v34 = "-[CXCallSource reportOutgoingCallWithUUID:connectedAtDate:reply:]";
    v35 = 2112;
    v36 = v12;
    v37 = 2112;
    v38 = v9;
    _os_log_impl(&dword_1A402D000, v11, OS_LOG_TYPE_DEFAULT, "Received %s with UUID: %@ dateConnected: %@", buf, 0x20u);

  }
  if (v10)
  {
    if (v8)
    {
      if (-[CXCallSource isPermittedToUsePublicAPI](self, "isPermittedToUsePublicAPI"))
      {
        -[CXCallSource delegate](self, "delegate");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "callSource:reportedOutgoingCallWithUUID:connectedAtDate:", self, v8, v9);

        v10[2](v10, 0);
      }
      else
      {
        CXDefaultLog();
        v30 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
          -[CXCallSource reportNewIncomingCallWithUUID:update:reply:].cold.4();

        v31[0] = MEMORY[0x1E0C809B0];
        v31[1] = 3221225472;
        v31[2] = __65__CXCallSource_reportOutgoingCallWithUUID_connectedAtDate_reply___block_invoke_41;
        v31[3] = &unk_1E4B891F8;
        v31[4] = v10;
        __65__CXCallSource_reportOutgoingCallWithUUID_connectedAtDate_reply___block_invoke_41((uint64_t)v31);
      }
    }
    else
    {
      CXDefaultLog();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
        -[CXCallSource reportNewIncomingCallWithUUID:update:reply:].cold.2(v22, v23, v24, v25, v26, v27, v28, v29);

      v32[0] = MEMORY[0x1E0C809B0];
      v32[1] = 3221225472;
      v32[2] = __65__CXCallSource_reportOutgoingCallWithUUID_connectedAtDate_reply___block_invoke_40;
      v32[3] = &unk_1E4B891F8;
      v32[4] = v10;
      __65__CXCallSource_reportOutgoingCallWithUUID_connectedAtDate_reply___block_invoke_40((uint64_t)v32);
    }
  }
  else
  {
    CXDefaultLog();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      -[CXCallSource reportNewIncomingCallWithUUID:update:reply:].cold.1(v14, v15, v16, v17, v18, v19, v20, v21);

  }
}

void __65__CXCallSource_reportOutgoingCallWithUUID_connectedAtDate_reply___block_invoke_40(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB35C8], "cx_errorWithCode:", 2);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);

}

void __65__CXCallSource_reportOutgoingCallWithUUID_connectedAtDate_reply___block_invoke_41(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB35C8], "cx_errorWithCode:", 1);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);

}

- (void)reportAudioFinishedForCallWithUUID:(id)a3
{
  -[CXCallSource reportAudioFinishedForCallWithUUID:reply:](self, "reportAudioFinishedForCallWithUUID:reply:", a3, &__block_literal_global_42);
}

- (void)reportAudioFinishedForCallWithUUID:(id)a3 reply:(id)a4
{
  id v6;
  void (**v7)(id, _QWORD);
  NSObject *v8;
  void *v9;
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
  _QWORD v28[5];
  _QWORD v29[5];
  uint8_t buf[4];
  const char *v31;
  __int16 v32;
  void *v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void (**)(id, _QWORD))a4;
  CXDefaultLog();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v6, "UUIDString");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315394;
    v31 = "-[CXCallSource reportAudioFinishedForCallWithUUID:reply:]";
    v32 = 2112;
    v33 = v9;
    _os_log_impl(&dword_1A402D000, v8, OS_LOG_TYPE_DEFAULT, "Received %s with UUID: %@", buf, 0x16u);

  }
  if (v7)
  {
    if (v6)
    {
      if (-[CXCallSource isPermittedToUsePrivateAPI](self, "isPermittedToUsePrivateAPI"))
      {
        -[CXCallSource delegate](self, "delegate");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "callSource:reportedAudioFinishedForCallWithUUID:", self, v6);

        v7[2](v7, 0);
      }
      else
      {
        CXDefaultLog();
        v27 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
          -[CXCallSource reportAudioFinishedForCallWithUUID:reply:].cold.3();

        v28[0] = MEMORY[0x1E0C809B0];
        v28[1] = 3221225472;
        v28[2] = __57__CXCallSource_reportAudioFinishedForCallWithUUID_reply___block_invoke_45;
        v28[3] = &unk_1E4B891F8;
        v28[4] = v7;
        __57__CXCallSource_reportAudioFinishedForCallWithUUID_reply___block_invoke_45((uint64_t)v28);
      }
    }
    else
    {
      CXDefaultLog();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        -[CXCallSource reportNewIncomingCallWithUUID:update:reply:].cold.2(v19, v20, v21, v22, v23, v24, v25, v26);

      v29[0] = MEMORY[0x1E0C809B0];
      v29[1] = 3221225472;
      v29[2] = __57__CXCallSource_reportAudioFinishedForCallWithUUID_reply___block_invoke_44;
      v29[3] = &unk_1E4B891F8;
      v29[4] = v7;
      __57__CXCallSource_reportAudioFinishedForCallWithUUID_reply___block_invoke_44((uint64_t)v29);
    }
  }
  else
  {
    CXDefaultLog();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      -[CXCallSource reportNewIncomingCallWithUUID:update:reply:].cold.1(v11, v12, v13, v14, v15, v16, v17, v18);

  }
}

void __57__CXCallSource_reportAudioFinishedForCallWithUUID_reply___block_invoke_44(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB35C8], "cx_errorWithCode:", 2);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);

}

void __57__CXCallSource_reportAudioFinishedForCallWithUUID_reply___block_invoke_45(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB35C8], "cx_errorWithCode:", 1);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);

}

- (void)reportCallWithUUID:(id)a3 changedFrequencyData:(id)a4 forDirection:(int64_t)a5
{
  -[CXCallSource reportCallWithUUID:changedFrequencyData:forDirection:reply:](self, "reportCallWithUUID:changedFrequencyData:forDirection:reply:", a3, a4, a5, &__block_literal_global_46);
}

- (void)reportCallWithUUID:(id)a3 changedFrequencyData:(id)a4 forDirection:(int64_t)a5 reply:(id)a6
{
  id v10;
  id v11;
  void (**v12)(id, _QWORD);
  void *v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  NSObject *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  NSObject *v30;
  _QWORD v31[5];
  _QWORD v32[5];

  v10 = a3;
  v11 = a4;
  v12 = (void (**)(id, _QWORD))a6;
  if (v12)
  {
    if (v10)
    {
      if (-[CXCallSource isPermittedToUsePrivateAPI](self, "isPermittedToUsePrivateAPI"))
      {
        -[CXCallSource delegate](self, "delegate");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "callSource:reportedCallWithUUID:changedFrequencyData:forDirection:", self, v10, v11, a5);

        v12[2](v12, 0);
      }
      else
      {
        CXDefaultLog();
        v30 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
          -[CXCallSource reportAudioFinishedForCallWithUUID:reply:].cold.3();

        v31[0] = MEMORY[0x1E0C809B0];
        v31[1] = 3221225472;
        v31[2] = __75__CXCallSource_reportCallWithUUID_changedFrequencyData_forDirection_reply___block_invoke_49;
        v31[3] = &unk_1E4B891F8;
        v31[4] = v12;
        __75__CXCallSource_reportCallWithUUID_changedFrequencyData_forDirection_reply___block_invoke_49((uint64_t)v31);
      }
    }
    else
    {
      CXDefaultLog();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
        -[CXCallSource reportNewIncomingCallWithUUID:update:reply:].cold.2(v22, v23, v24, v25, v26, v27, v28, v29);

      v32[0] = MEMORY[0x1E0C809B0];
      v32[1] = 3221225472;
      v32[2] = __75__CXCallSource_reportCallWithUUID_changedFrequencyData_forDirection_reply___block_invoke_48;
      v32[3] = &unk_1E4B891F8;
      v32[4] = v12;
      __75__CXCallSource_reportCallWithUUID_changedFrequencyData_forDirection_reply___block_invoke_48((uint64_t)v32);
    }
  }
  else
  {
    CXDefaultLog();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      -[CXCallSource reportNewIncomingCallWithUUID:update:reply:].cold.1(v14, v15, v16, v17, v18, v19, v20, v21);

  }
}

void __75__CXCallSource_reportCallWithUUID_changedFrequencyData_forDirection_reply___block_invoke_48(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB35C8], "cx_errorWithCode:", 2);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);

}

void __75__CXCallSource_reportCallWithUUID_changedFrequencyData_forDirection_reply___block_invoke_49(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB35C8], "cx_errorWithCode:", 1);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);

}

- (void)reportCallWithUUID:(id)a3 changedMeterLevel:(float)a4 forDirection:(int64_t)a5
{
  -[CXCallSource reportCallWithUUID:changedMeterLevel:forDirection:reply:](self, "reportCallWithUUID:changedMeterLevel:forDirection:reply:", a3, a5, &__block_literal_global_50);
}

- (void)reportCallWithUUID:(id)a3 changedMeterLevel:(float)a4 forDirection:(int64_t)a5 reply:(id)a6
{
  id v10;
  void (**v11)(id, _QWORD);
  void *v12;
  double v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  NSObject *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  NSObject *v30;
  _QWORD v31[5];
  _QWORD v32[5];

  v10 = a3;
  v11 = (void (**)(id, _QWORD))a6;
  if (v11)
  {
    if (v10)
    {
      if (-[CXCallSource isPermittedToUsePrivateAPI](self, "isPermittedToUsePrivateAPI"))
      {
        -[CXCallSource delegate](self, "delegate");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        *(float *)&v13 = a4;
        objc_msgSend(v12, "callSource:reportedCallWithUUID:changedMeterLevel:forDirection:", self, v10, a5, v13);

        v11[2](v11, 0);
      }
      else
      {
        CXDefaultLog();
        v30 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
          -[CXCallSource reportAudioFinishedForCallWithUUID:reply:].cold.3();

        v31[0] = MEMORY[0x1E0C809B0];
        v31[1] = 3221225472;
        v31[2] = __72__CXCallSource_reportCallWithUUID_changedMeterLevel_forDirection_reply___block_invoke_53;
        v31[3] = &unk_1E4B891F8;
        v31[4] = v11;
        __72__CXCallSource_reportCallWithUUID_changedMeterLevel_forDirection_reply___block_invoke_53((uint64_t)v31);
      }
    }
    else
    {
      CXDefaultLog();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
        -[CXCallSource reportNewIncomingCallWithUUID:update:reply:].cold.2(v22, v23, v24, v25, v26, v27, v28, v29);

      v32[0] = MEMORY[0x1E0C809B0];
      v32[1] = 3221225472;
      v32[2] = __72__CXCallSource_reportCallWithUUID_changedMeterLevel_forDirection_reply___block_invoke_52;
      v32[3] = &unk_1E4B891F8;
      v32[4] = v11;
      __72__CXCallSource_reportCallWithUUID_changedMeterLevel_forDirection_reply___block_invoke_52((uint64_t)v32);
    }
  }
  else
  {
    CXDefaultLog();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      -[CXCallSource reportNewIncomingCallWithUUID:update:reply:].cold.1(v14, v15, v16, v17, v18, v19, v20, v21);

  }
}

void __72__CXCallSource_reportCallWithUUID_changedMeterLevel_forDirection_reply___block_invoke_52(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB35C8], "cx_errorWithCode:", 2);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);

}

void __72__CXCallSource_reportCallWithUUID_changedMeterLevel_forDirection_reply___block_invoke_53(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB35C8], "cx_errorWithCode:", 1);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);

}

- (void)reportCallWithUUID:(id)a3 crossDeviceIdentifier:(id)a4 changedBytesOfDataUsed:(int64_t)a5
{
  -[CXCallSource reportCallWithUUID:crossDeviceIdentifier:changedBytesOfDataUsed:reply:](self, "reportCallWithUUID:crossDeviceIdentifier:changedBytesOfDataUsed:reply:", a3, a4, a5, &__block_literal_global_54);
}

- (void)reportCallWithUUID:(id)a3 crossDeviceIdentifier:(id)a4 changedBytesOfDataUsed:(int64_t)a5 reply:(id)a6
{
  id v10;
  id v11;
  void (**v12)(id, _QWORD);
  NSObject *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  NSObject *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  NSObject *v32;
  _QWORD v33[5];
  _QWORD v34[5];
  _QWORD v35[5];
  uint8_t buf[4];
  const char *v37;
  __int16 v38;
  void *v39;
  __int16 v40;
  id v41;
  __int16 v42;
  int64_t v43;
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = (void (**)(id, _QWORD))a6;
  CXDefaultLog();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v10, "UUIDString");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315906;
    v37 = "-[CXCallSource reportCallWithUUID:crossDeviceIdentifier:changedBytesOfDataUsed:reply:]";
    v38 = 2112;
    v39 = v14;
    v40 = 2112;
    v41 = v11;
    v42 = 2048;
    v43 = a5;
    _os_log_impl(&dword_1A402D000, v13, OS_LOG_TYPE_DEFAULT, "Received %s with UUID: %@ crossDeviceIdentifier: %@ bytesOfDataUsed: %ld", buf, 0x2Au);

  }
  if (v10)
  {
    if (v11)
    {
      if (-[CXCallSource isPermittedToUsePrivateAPI](self, "isPermittedToUsePrivateAPI"))
      {
        -[CXCallSource delegate](self, "delegate");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "callSource:reportedCallWithUUID:crossDeviceIdentifier:changedBytesOfDataUsed:", self, v10, v11, a5);

        v12[2](v12, 0);
      }
      else
      {
        CXDefaultLog();
        v32 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
          -[CXCallSource reportAudioFinishedForCallWithUUID:reply:].cold.3();

        v33[0] = MEMORY[0x1E0C809B0];
        v33[1] = 3221225472;
        v33[2] = __86__CXCallSource_reportCallWithUUID_crossDeviceIdentifier_changedBytesOfDataUsed_reply___block_invoke_58;
        v33[3] = &unk_1E4B891F8;
        v33[4] = v12;
        __86__CXCallSource_reportCallWithUUID_crossDeviceIdentifier_changedBytesOfDataUsed_reply___block_invoke_58((uint64_t)v33);
      }
    }
    else
    {
      CXDefaultLog();
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
        -[CXCallSource reportCallWithUUID:crossDeviceIdentifier:changedBytesOfDataUsed:reply:].cold.2(v24, v25, v26, v27, v28, v29, v30, v31);

      v34[0] = MEMORY[0x1E0C809B0];
      v34[1] = 3221225472;
      v34[2] = __86__CXCallSource_reportCallWithUUID_crossDeviceIdentifier_changedBytesOfDataUsed_reply___block_invoke_57;
      v34[3] = &unk_1E4B891F8;
      v34[4] = v12;
      __86__CXCallSource_reportCallWithUUID_crossDeviceIdentifier_changedBytesOfDataUsed_reply___block_invoke_57((uint64_t)v34);
    }
  }
  else
  {
    CXDefaultLog();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      -[CXCallSource reportNewIncomingCallWithUUID:update:reply:].cold.2(v16, v17, v18, v19, v20, v21, v22, v23);

    v35[0] = MEMORY[0x1E0C809B0];
    v35[1] = 3221225472;
    v35[2] = __86__CXCallSource_reportCallWithUUID_crossDeviceIdentifier_changedBytesOfDataUsed_reply___block_invoke;
    v35[3] = &unk_1E4B891F8;
    v35[4] = v12;
    __86__CXCallSource_reportCallWithUUID_crossDeviceIdentifier_changedBytesOfDataUsed_reply___block_invoke((uint64_t)v35);
  }

}

void __86__CXCallSource_reportCallWithUUID_crossDeviceIdentifier_changedBytesOfDataUsed_reply___block_invoke(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB35C8], "cx_errorWithCode:", 2);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);

}

void __86__CXCallSource_reportCallWithUUID_crossDeviceIdentifier_changedBytesOfDataUsed_reply___block_invoke_57(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB35C8], "cx_errorWithCode:", 2);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);

}

void __86__CXCallSource_reportCallWithUUID_crossDeviceIdentifier_changedBytesOfDataUsed_reply___block_invoke_58(uint64_t a1)
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
  _QWORD v27[5];
  _QWORD v28[5];
  uint8_t buf[4];
  const char *v30;
  __int16 v31;
  id v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  CXDefaultLog();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v30 = "-[CXCallSource requestTransaction:completionHandler:]";
    v31 = 2112;
    v32 = v6;
    _os_log_impl(&dword_1A402D000, v8, OS_LOG_TYPE_DEFAULT, "Received %s with transaction: %@", buf, 0x16u);
  }

  if (v7)
  {
    if (v6)
    {
      if (-[CXCallSource isPermittedToUsePrivateAPI](self, "isPermittedToUsePrivateAPI"))
      {
        -[CXCallSource delegate](self, "delegate");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "callSource:requestedTransaction:completion:", self, v6, v7);

      }
      else
      {
        CXDefaultLog();
        v26 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
          -[CXCallSource reportAudioFinishedForCallWithUUID:reply:].cold.3();

        v27[0] = MEMORY[0x1E0C809B0];
        v27[1] = 3221225472;
        v27[2] = __53__CXCallSource_requestTransaction_completionHandler___block_invoke_65;
        v27[3] = &unk_1E4B891F8;
        v27[4] = v7;
        __53__CXCallSource_requestTransaction_completionHandler___block_invoke_65((uint64_t)v27);
      }
    }
    else
    {
      CXDefaultLog();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        -[CXCallSource requestTransaction:completionHandler:].cold.2(v18, v19, v20, v21, v22, v23, v24, v25);

      v28[0] = MEMORY[0x1E0C809B0];
      v28[1] = 3221225472;
      v28[2] = __53__CXCallSource_requestTransaction_completionHandler___block_invoke_64;
      v28[3] = &unk_1E4B891F8;
      v28[4] = v7;
      __53__CXCallSource_requestTransaction_completionHandler___block_invoke_64((uint64_t)v28);
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

void __53__CXCallSource_requestTransaction_completionHandler___block_invoke_64(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB35C8], "cx_errorWithCode:", 2);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);

}

void __53__CXCallSource_requestTransaction_completionHandler___block_invoke_65(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB35C8], "cx_requestTransactionErrorWithCode:", 1);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);

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
  _QWORD v28[5];
  _QWORD v29[5];
  uint8_t buf[4];
  const char *v31;
  __int16 v32;
  id v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void (**)(id, _QWORD))a4;
  CXDefaultLog();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v31 = "-[CXCallSource actionCompleted:completionHandler:]";
    v32 = 2112;
    v33 = v6;
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
    if (-[CXCallSource isPermittedToUsePublicAPI](self, "isPermittedToUsePublicAPI"))
    {
      if (!-[CXCallSource isPermittedToUsePrivateAPI](self, "isPermittedToUsePrivateAPI"))
      {
        objc_msgSend(v6, "sanitizedCopy");
        v9 = objc_claimAutoreleasedReturnValue();

        v6 = (id)v9;
      }
      -[CXCallSource delegate](self, "delegate");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "callSource:actionCompleted:", self, v6);

      v7[2](v7, 0);
    }
    else
    {
      CXDefaultLog();
      v27 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
        -[CXCallSource reportNewIncomingCallWithUUID:update:reply:].cold.4();

      v28[0] = MEMORY[0x1E0C809B0];
      v28[1] = 3221225472;
      v28[2] = __50__CXCallSource_actionCompleted_completionHandler___block_invoke_70;
      v28[3] = &unk_1E4B891F8;
      v28[4] = v7;
      __50__CXCallSource_actionCompleted_completionHandler___block_invoke_70((uint64_t)v28);
    }
LABEL_18:

    goto LABEL_19;
  }
  CXDefaultLog();
  v19 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    -[CXCallSource actionCompleted:completionHandler:].cold.2(v19, v20, v21, v22, v23, v24, v25, v26);

  v29[0] = MEMORY[0x1E0C809B0];
  v29[1] = 3221225472;
  v29[2] = __50__CXCallSource_actionCompleted_completionHandler___block_invoke_69;
  v29[3] = &unk_1E4B891F8;
  v29[4] = v7;
  __50__CXCallSource_actionCompleted_completionHandler___block_invoke_69((uint64_t)v29);
LABEL_19:

}

void __50__CXCallSource_actionCompleted_completionHandler___block_invoke_69(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB35C8], "cx_errorWithCode:", 2);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);

}

void __50__CXCallSource_actionCompleted_completionHandler___block_invoke_70(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB35C8], "cx_errorWithCode:", 1);
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
  CXCallSource *v9;

  v4 = a3;
  -[CXCallSource queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __34__CXCallSource_commitTransaction___block_invoke;
  v7[3] = &unk_1E4B88A20;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(v5, v7);

}

void __34__CXCallSource_commitTransaction___block_invoke(uint64_t a1)
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
    v7 = "-[CXCallSource commitTransaction:]_block_invoke";
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
  CXCallSource *v9;

  v4 = a3;
  -[CXCallSource queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __36__CXCallSource_handleActionTimeout___block_invoke;
  v7[3] = &unk_1E4B88A20;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(v5, v7);

}

void __36__CXCallSource_handleActionTimeout___block_invoke(uint64_t a1)
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
    v7 = "-[CXCallSource handleActionTimeout:]_block_invoke";
    v8 = 2112;
    v9 = v3;
    _os_log_impl(&dword_1A402D000, v2, OS_LOG_TYPE_DEFAULT, "Sending %s with action: %@", (uint8_t *)&v6, 0x16u);
  }

  objc_msgSend(*(id *)(a1 + 40), "vendorProtocolDelegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(*(id *)(a1 + 32), "copy");
  objc_msgSend(v4, "handleActionTimeout:", v5);

}

- (void)handleAudioSessionActivationStateChangedTo:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  CXCallSource *v9;

  v4 = a3;
  -[CXCallSource queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __59__CXCallSource_handleAudioSessionActivationStateChangedTo___block_invoke;
  v7[3] = &unk_1E4B88A20;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(v5, v7);

}

void __59__CXCallSource_handleAudioSessionActivationStateChangedTo___block_invoke(uint64_t a1)
{
  NSObject *v2;
  int v3;
  void *v4;
  int v5;
  const char *v6;
  __int16 v7;
  int v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  CXDefaultLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = objc_msgSend(*(id *)(a1 + 32), "BOOLValue");
    v5 = 136315394;
    v6 = "-[CXCallSource handleAudioSessionActivationStateChangedTo:]_block_invoke";
    v7 = 1024;
    v8 = v3;
    _os_log_impl(&dword_1A402D000, v2, OS_LOG_TYPE_DEFAULT, "Sending %s with active: %d", (uint8_t *)&v5, 0x12u);
  }

  objc_msgSend(*(id *)(a1 + 40), "vendorProtocolDelegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleAudioSessionActivationStateChangedTo:", *(_QWORD *)(a1 + 32));

}

- (CXCallSourceDelegate)delegate
{
  return (CXCallSourceDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
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
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)reportNewIncomingCallWithUUID:(uint64_t)a3 update:(uint64_t)a4 reply:(uint64_t)a5 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1A402D000, a1, a3, "Invalid argument; '%@' parameter cannot be nil.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)reportNewIncomingCallWithUUID:(uint64_t)a3 update:(uint64_t)a4 reply:(uint64_t)a5 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1A402D000, a1, a3, "Invalid argument; '%@' parameter cannot be nil.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)reportNewIncomingCallWithUUID:(uint64_t)a3 update:(uint64_t)a4 reply:(uint64_t)a5 .cold.3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1A402D000, a1, a3, "Invalid argument; '%@' parameter cannot be nil.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)reportNewIncomingCallWithUUID:update:reply:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_0(&dword_1A402D000, v0, v1, "Provider source is not entitled to use public API: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)reportCallWithUUID:(uint64_t)a3 receivedDTMFUpdate:(uint64_t)a4 reply:(uint64_t)a5 .cold.3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1A402D000, a1, a3, "Invalid argument; '%@' parameter cannot be nil.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)reportAudioFinishedForCallWithUUID:reply:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_0(&dword_1A402D000, v0, v1, "Provider source is not entitled to use private API: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)reportCallWithUUID:(uint64_t)a3 crossDeviceIdentifier:(uint64_t)a4 changedBytesOfDataUsed:(uint64_t)a5 reply:(uint64_t)a6 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1A402D000, a1, a3, "Invalid argument; '%@' parameter cannot be nil.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)requestTransaction:(uint64_t)a3 completionHandler:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1A402D000, a1, a3, "Invalid argument; '%@' parameter cannot be nil.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)requestTransaction:(uint64_t)a3 completionHandler:(uint64_t)a4 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1A402D000, a1, a3, "Invalid argument; '%@' parameter cannot be nil.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)actionCompleted:(uint64_t)a3 completionHandler:(uint64_t)a4 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1A402D000, a1, a3, "Invalid argument; '%@' parameter cannot be nil.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

@end
