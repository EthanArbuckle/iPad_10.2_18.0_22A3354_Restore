@implementation CXChannelServiceClient

- (CXChannelServiceClient)initWithConnection:(id)a3
{
  id v4;
  CXChannelServiceClient *v5;
  CXChannelServiceClient *v6;
  NSObject *v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CXChannelServiceClient;
  v5 = -[CXServiceClient initWithConnection:](&v9, sel_initWithConnection_, v4);
  v6 = v5;
  if (v5 && !-[CXChannelServiceClient isPermittedToUsePublicAPI](v5, "isPermittedToUsePublicAPI"))
  {
    CXDefaultLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[CXChannelServiceClient initWithConnection:].cold.1((uint64_t)v6, (uint64_t)v4, v7);

    v6 = 0;
  }

  return v6;
}

- (BOOL)isPermittedToUsePublicAPI
{
  _BOOL8 v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CXChannelServiceClient;
  if (-[CXServiceClient isPermittedToUsePublicAPI](&v5, sel_isPermittedToUsePublicAPI))
    LOBYTE(v3) = 1;
  else
    return ((unint64_t)-[CXServiceClient backgroundModeOptions](self, "backgroundModeOptions") >> 1) & 1;
  return v3;
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
    v31 = "-[CXChannelServiceClient actionCompleted:completionHandler:]";
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
    if (-[CXChannelServiceClient isPermittedToUsePublicAPI](self, "isPermittedToUsePublicAPI"))
    {
      if (!-[CXServiceClient isPermittedToUsePrivateAPI](self, "isPermittedToUsePrivateAPI"))
      {
        objc_msgSend(v6, "sanitizedCopy");
        v9 = objc_claimAutoreleasedReturnValue();

        v6 = (id)v9;
      }
      -[CXChannelServiceClient delegate](self, "delegate");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "serviceClient:actionCompleted:", self, v6);

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
      v28[2] = __60__CXChannelServiceClient_actionCompleted_completionHandler___block_invoke_9;
      v28[3] = &unk_1E4B891F8;
      v28[4] = v7;
      __60__CXChannelServiceClient_actionCompleted_completionHandler___block_invoke_9((uint64_t)v28);
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
  v29[2] = __60__CXChannelServiceClient_actionCompleted_completionHandler___block_invoke_8;
  v29[3] = &unk_1E4B891F8;
  v29[4] = v7;
  __60__CXChannelServiceClient_actionCompleted_completionHandler___block_invoke_8((uint64_t)v29);
LABEL_19:

}

void __60__CXChannelServiceClient_actionCompleted_completionHandler___block_invoke_8(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB35C8], "cx_errorWithCode:", 2);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);

}

void __60__CXChannelServiceClient_actionCompleted_completionHandler___block_invoke_9(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB35C8], "cx_errorWithCode:", 1);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);

}

- (void)registerWithConfiguration:(id)a3 completionHandler:(id)a4
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
  _QWORD v27[5];
  uint8_t buf[4];
  const char *v29;
  __int16 v30;
  id v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void (**)(id, _QWORD))a4;
  CXDefaultLog();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v29 = "-[CXChannelServiceClient registerWithConfiguration:completionHandler:]";
    v30 = 2112;
    v31 = v6;
    _os_log_impl(&dword_1A402D000, v8, OS_LOG_TYPE_DEFAULT, "Received %s with configuration: %@", buf, 0x16u);
  }

  if (!v7)
  {
    CXDefaultLog();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      -[CXCallSource requestTransaction:completionHandler:].cold.1(v11, v12, v13, v14, v15, v16, v17, v18);

    goto LABEL_11;
  }
  if (v6)
  {
    if (!-[CXServiceClient isPermittedToUsePrivateAPI](self, "isPermittedToUsePrivateAPI"))
    {
      objc_msgSend(v6, "sanitizedCopy");
      v9 = objc_claimAutoreleasedReturnValue();

      v6 = (id)v9;
    }
    -[CXChannelServiceClient delegate](self, "delegate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "serviceClient:registeredWithConfiguration:", self, v6);

    v7[2](v7, 0);
LABEL_11:

    goto LABEL_15;
  }
  CXDefaultLog();
  v19 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    -[CXChannelServiceClient registerWithConfiguration:completionHandler:].cold.2(v19, v20, v21, v22, v23, v24, v25, v26);

  v27[0] = MEMORY[0x1E0C809B0];
  v27[1] = 3221225472;
  v27[2] = __70__CXChannelServiceClient_registerWithConfiguration_completionHandler___block_invoke_13;
  v27[3] = &unk_1E4B891F8;
  v27[4] = v7;
  __70__CXChannelServiceClient_registerWithConfiguration_completionHandler___block_invoke_13((uint64_t)v27);
LABEL_15:

}

void __70__CXChannelServiceClient_registerWithConfiguration_completionHandler___block_invoke_13(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB35C8], "cx_errorWithCode:", 2);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);

}

- (void)reportAudioFinishedForChannelWithUUID:(id)a3 completionHandler:(id)a4
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
    v31 = "-[CXChannelServiceClient reportAudioFinishedForChannelWithUUID:completionHandler:]";
    v32 = 2112;
    v33 = v9;
    _os_log_impl(&dword_1A402D000, v8, OS_LOG_TYPE_DEFAULT, "Received %s with UUID: %@", buf, 0x16u);

  }
  if (v7)
  {
    if (v6)
    {
      if (-[CXServiceClient isPermittedToUsePrivateAPI](self, "isPermittedToUsePrivateAPI"))
      {
        -[CXChannelServiceClient delegate](self, "delegate");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "serviceClient:reportedAudioFinishedForChannelWithUUID:", self, v6);

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
        v28[2] = __82__CXChannelServiceClient_reportAudioFinishedForChannelWithUUID_completionHandler___block_invoke_18;
        v28[3] = &unk_1E4B891F8;
        v28[4] = v7;
        __82__CXChannelServiceClient_reportAudioFinishedForChannelWithUUID_completionHandler___block_invoke_18((uint64_t)v28);
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
      v29[2] = __82__CXChannelServiceClient_reportAudioFinishedForChannelWithUUID_completionHandler___block_invoke_17;
      v29[3] = &unk_1E4B891F8;
      v29[4] = v7;
      __82__CXChannelServiceClient_reportAudioFinishedForChannelWithUUID_completionHandler___block_invoke_17((uint64_t)v29);
    }
  }
  else
  {
    CXDefaultLog();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      -[CXCallSource requestTransaction:completionHandler:].cold.1(v11, v12, v13, v14, v15, v16, v17, v18);

  }
}

void __82__CXChannelServiceClient_reportAudioFinishedForChannelWithUUID_completionHandler___block_invoke_17(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB35C8], "cx_errorWithCode:", 2);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);

}

void __82__CXChannelServiceClient_reportAudioFinishedForChannelWithUUID_completionHandler___block_invoke_18(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB35C8], "cx_errorWithCode:", 1);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);

}

- (void)reportChannelWithUUID:(id)a3 connectedAtDate:(id)a4 completionHandler:(id)a5
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
    v34 = "-[CXChannelServiceClient reportChannelWithUUID:connectedAtDate:completionHandler:]";
    v35 = 2112;
    v36 = v12;
    v37 = 2112;
    v38 = v9;
    _os_log_impl(&dword_1A402D000, v11, OS_LOG_TYPE_DEFAULT, "Received %s with UUID: %@ connectedAtDate: %@", buf, 0x20u);

  }
  if (v10)
  {
    if (v8)
    {
      if (-[CXChannelServiceClient isPermittedToUsePublicAPI](self, "isPermittedToUsePublicAPI"))
      {
        -[CXChannelServiceClient delegate](self, "delegate");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "serviceClient:reportedChannelWithUUID:connectedAtDate:", self, v8, v9);

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
        v31[2] = __82__CXChannelServiceClient_reportChannelWithUUID_connectedAtDate_completionHandler___block_invoke_21;
        v31[3] = &unk_1E4B891F8;
        v31[4] = v10;
        __82__CXChannelServiceClient_reportChannelWithUUID_connectedAtDate_completionHandler___block_invoke_21((uint64_t)v31);
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
      v32[2] = __82__CXChannelServiceClient_reportChannelWithUUID_connectedAtDate_completionHandler___block_invoke_20;
      v32[3] = &unk_1E4B891F8;
      v32[4] = v10;
      __82__CXChannelServiceClient_reportChannelWithUUID_connectedAtDate_completionHandler___block_invoke_20((uint64_t)v32);
    }
  }
  else
  {
    CXDefaultLog();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      -[CXCallSource requestTransaction:completionHandler:].cold.1(v14, v15, v16, v17, v18, v19, v20, v21);

  }
}

void __82__CXChannelServiceClient_reportChannelWithUUID_connectedAtDate_completionHandler___block_invoke_20(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB35C8], "cx_errorWithCode:", 2);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);

}

void __82__CXChannelServiceClient_reportChannelWithUUID_connectedAtDate_completionHandler___block_invoke_21(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB35C8], "cx_errorWithCode:", 1);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);

}

- (void)reportChannelWithUUID:(id)a3 disconnectedAtDate:(id)a4 disconnectedReason:(id)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  void (**v13)(id, _QWORD);
  NSObject *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  NSObject *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  NSObject *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  NSObject *v41;
  _QWORD v42[5];
  _QWORD v43[5];
  _QWORD v44[5];
  uint8_t buf[4];
  const char *v46;
  __int16 v47;
  void *v48;
  __int16 v49;
  id v50;
  __int16 v51;
  id v52;
  uint64_t v53;

  v53 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = (void (**)(id, _QWORD))a6;
  CXDefaultLog();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v10, "UUIDString");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315906;
    v46 = "-[CXChannelServiceClient reportChannelWithUUID:disconnectedAtDate:disconnectedReason:completionHandler:]";
    v47 = 2112;
    v48 = v15;
    v49 = 2112;
    v50 = v11;
    v51 = 2112;
    v52 = v12;
    _os_log_impl(&dword_1A402D000, v14, OS_LOG_TYPE_DEFAULT, "Received %s with UUID: %@ disconnectedAtDate: %@ disconnectedReason: %@", buf, 0x2Au);

  }
  if (v13)
  {
    if (v10)
    {
      if (v12)
      {
        if (-[CXChannelServiceClient isPermittedToUsePublicAPI](self, "isPermittedToUsePublicAPI"))
        {
          -[CXChannelServiceClient delegate](self, "delegate");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "serviceClient:reportedChannelWithUUID:disconnectedAtDate:disconnectedReason:", self, v10, v11, objc_msgSend(v12, "integerValue"));

          v13[2](v13, 0);
        }
        else
        {
          CXDefaultLog();
          v41 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
            -[CXCallSource reportNewIncomingCallWithUUID:update:reply:].cold.4();

          v42[0] = MEMORY[0x1E0C809B0];
          v42[1] = 3221225472;
          v42[2] = __104__CXChannelServiceClient_reportChannelWithUUID_disconnectedAtDate_disconnectedReason_completionHandler___block_invoke_27;
          v42[3] = &unk_1E4B891F8;
          v42[4] = v13;
          __104__CXChannelServiceClient_reportChannelWithUUID_disconnectedAtDate_disconnectedReason_completionHandler___block_invoke_27((uint64_t)v42);
        }
      }
      else
      {
        CXDefaultLog();
        v33 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
          -[CXChannelServiceClient reportChannelWithUUID:disconnectedAtDate:disconnectedReason:completionHandler:].cold.3(v33, v34, v35, v36, v37, v38, v39, v40);

        v43[0] = MEMORY[0x1E0C809B0];
        v43[1] = 3221225472;
        v43[2] = __104__CXChannelServiceClient_reportChannelWithUUID_disconnectedAtDate_disconnectedReason_completionHandler___block_invoke_26;
        v43[3] = &unk_1E4B891F8;
        v43[4] = v13;
        __104__CXChannelServiceClient_reportChannelWithUUID_disconnectedAtDate_disconnectedReason_completionHandler___block_invoke_26((uint64_t)v43);
      }
    }
    else
    {
      CXDefaultLog();
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
        -[CXCallSource reportNewIncomingCallWithUUID:update:reply:].cold.2(v25, v26, v27, v28, v29, v30, v31, v32);

      v44[0] = MEMORY[0x1E0C809B0];
      v44[1] = 3221225472;
      v44[2] = __104__CXChannelServiceClient_reportChannelWithUUID_disconnectedAtDate_disconnectedReason_completionHandler___block_invoke_23;
      v44[3] = &unk_1E4B891F8;
      v44[4] = v13;
      __104__CXChannelServiceClient_reportChannelWithUUID_disconnectedAtDate_disconnectedReason_completionHandler___block_invoke_23((uint64_t)v44);
    }
  }
  else
  {
    CXDefaultLog();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      -[CXCallSource requestTransaction:completionHandler:].cold.1(v17, v18, v19, v20, v21, v22, v23, v24);

  }
}

void __104__CXChannelServiceClient_reportChannelWithUUID_disconnectedAtDate_disconnectedReason_completionHandler___block_invoke_23(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB35C8], "cx_errorWithCode:", 2);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);

}

void __104__CXChannelServiceClient_reportChannelWithUUID_disconnectedAtDate_disconnectedReason_completionHandler___block_invoke_26(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB35C8], "cx_errorWithCode:", 2);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);

}

void __104__CXChannelServiceClient_reportChannelWithUUID_disconnectedAtDate_disconnectedReason_completionHandler___block_invoke_27(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB35C8], "cx_errorWithCode:", 1);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);

}

- (void)reportChannelWithUUID:(id)a3 startedConnectingAtDate:(id)a4 completionHandler:(id)a5
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
    v34 = "-[CXChannelServiceClient reportChannelWithUUID:startedConnectingAtDate:completionHandler:]";
    v35 = 2112;
    v36 = v12;
    v37 = 2112;
    v38 = v9;
    _os_log_impl(&dword_1A402D000, v11, OS_LOG_TYPE_DEFAULT, "Received %s with UUID: %@ startedConnectingAtDate: %@", buf, 0x20u);

  }
  if (v10)
  {
    if (v8)
    {
      if (-[CXChannelServiceClient isPermittedToUsePublicAPI](self, "isPermittedToUsePublicAPI"))
      {
        -[CXChannelServiceClient delegate](self, "delegate");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "serviceClient:reportedChannelWithUUID:startedConnectingAtDate:", self, v8, v9);

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
        v31[2] = __90__CXChannelServiceClient_reportChannelWithUUID_startedConnectingAtDate_completionHandler___block_invoke_30;
        v31[3] = &unk_1E4B891F8;
        v31[4] = v10;
        __90__CXChannelServiceClient_reportChannelWithUUID_startedConnectingAtDate_completionHandler___block_invoke_30((uint64_t)v31);
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
      v32[2] = __90__CXChannelServiceClient_reportChannelWithUUID_startedConnectingAtDate_completionHandler___block_invoke_29;
      v32[3] = &unk_1E4B891F8;
      v32[4] = v10;
      __90__CXChannelServiceClient_reportChannelWithUUID_startedConnectingAtDate_completionHandler___block_invoke_29((uint64_t)v32);
    }
  }
  else
  {
    CXDefaultLog();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      -[CXCallSource requestTransaction:completionHandler:].cold.1(v14, v15, v16, v17, v18, v19, v20, v21);

  }
}

void __90__CXChannelServiceClient_reportChannelWithUUID_startedConnectingAtDate_completionHandler___block_invoke_29(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB35C8], "cx_errorWithCode:", 2);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);

}

void __90__CXChannelServiceClient_reportChannelWithUUID_startedConnectingAtDate_completionHandler___block_invoke_30(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB35C8], "cx_errorWithCode:", 1);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);

}

- (void)reportChannelWithUUID:(id)a3 updated:(id)a4 completionHandler:(id)a5
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
    v44 = "-[CXChannelServiceClient reportChannelWithUUID:updated:completionHandler:]";
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
      -[CXCallSource requestTransaction:completionHandler:].cold.1(v15, v16, v17, v18, v19, v20, v21, v22);

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
    v42[2] = __74__CXChannelServiceClient_reportChannelWithUUID_updated_completionHandler___block_invoke_32;
    v42[3] = &unk_1E4B891F8;
    v42[4] = v10;
    __74__CXChannelServiceClient_reportChannelWithUUID_updated_completionHandler___block_invoke_32((uint64_t)v42);
    goto LABEL_22;
  }
  if (v9)
  {
    if (-[CXChannelServiceClient isPermittedToUsePublicAPI](self, "isPermittedToUsePublicAPI"))
    {
      if (!-[CXServiceClient isPermittedToUsePrivateAPI](self, "isPermittedToUsePrivateAPI"))
      {
        objc_msgSend(v9, "sanitizedCopy");
        v13 = objc_claimAutoreleasedReturnValue();

        v9 = (id)v13;
      }
      -[CXChannelServiceClient delegate](self, "delegate");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "serviceClient:reportedChannelWithUUID:updated:", self, v8, v9);

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
      v40[2] = __74__CXChannelServiceClient_reportChannelWithUUID_updated_completionHandler___block_invoke_36;
      v40[3] = &unk_1E4B891F8;
      v40[4] = v10;
      __74__CXChannelServiceClient_reportChannelWithUUID_updated_completionHandler___block_invoke_36((uint64_t)v40);
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
  v41[2] = __74__CXChannelServiceClient_reportChannelWithUUID_updated_completionHandler___block_invoke_35;
  v41[3] = &unk_1E4B891F8;
  v41[4] = v10;
  __74__CXChannelServiceClient_reportChannelWithUUID_updated_completionHandler___block_invoke_35((uint64_t)v41);
LABEL_23:

}

void __74__CXChannelServiceClient_reportChannelWithUUID_updated_completionHandler___block_invoke_32(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB35C8], "cx_errorWithCode:", 2);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);

}

void __74__CXChannelServiceClient_reportChannelWithUUID_updated_completionHandler___block_invoke_35(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB35C8], "cx_errorWithCode:", 2);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);

}

void __74__CXChannelServiceClient_reportChannelWithUUID_updated_completionHandler___block_invoke_36(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB35C8], "cx_errorWithCode:", 1);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);

}

- (void)reportIncomingTransmissionEndedForChannelWithUUID:(id)a3 reason:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
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
  _QWORD v39[5];

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (v10)
  {
    if (v8)
    {
      if (v9)
      {
        if (-[CXChannelServiceClient isPermittedToUsePublicAPI](self, "isPermittedToUsePublicAPI"))
        {
          -[CXChannelServiceClient delegate](self, "delegate");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "serviceClient:reportedIncomingTransmissionEndedForChannelWithUUID:reason:completionHandler:", self, v8, objc_msgSend(v9, "integerValue"), v10);

        }
        else
        {
          CXDefaultLog();
          v36 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
            -[CXCallSource reportNewIncomingCallWithUUID:update:reply:].cold.4();

          v37[0] = MEMORY[0x1E0C809B0];
          v37[1] = 3221225472;
          v37[2] = __101__CXChannelServiceClient_reportIncomingTransmissionEndedForChannelWithUUID_reason_completionHandler___block_invoke_42;
          v37[3] = &unk_1E4B891F8;
          v37[4] = v10;
          __101__CXChannelServiceClient_reportIncomingTransmissionEndedForChannelWithUUID_reason_completionHandler___block_invoke_42((uint64_t)v37);
        }
      }
      else
      {
        CXDefaultLog();
        v28 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
          -[CXChannelServiceClient reportIncomingTransmissionEndedForChannelWithUUID:reason:completionHandler:].cold.3(v28, v29, v30, v31, v32, v33, v34, v35);

        v38[0] = MEMORY[0x1E0C809B0];
        v38[1] = 3221225472;
        v38[2] = __101__CXChannelServiceClient_reportIncomingTransmissionEndedForChannelWithUUID_reason_completionHandler___block_invoke_41;
        v38[3] = &unk_1E4B891F8;
        v38[4] = v10;
        __101__CXChannelServiceClient_reportIncomingTransmissionEndedForChannelWithUUID_reason_completionHandler___block_invoke_41((uint64_t)v38);
      }
    }
    else
    {
      CXDefaultLog();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        -[CXCallSource reportNewIncomingCallWithUUID:update:reply:].cold.2(v20, v21, v22, v23, v24, v25, v26, v27);

      v39[0] = MEMORY[0x1E0C809B0];
      v39[1] = 3221225472;
      v39[2] = __101__CXChannelServiceClient_reportIncomingTransmissionEndedForChannelWithUUID_reason_completionHandler___block_invoke_38;
      v39[3] = &unk_1E4B891F8;
      v39[4] = v10;
      __101__CXChannelServiceClient_reportIncomingTransmissionEndedForChannelWithUUID_reason_completionHandler___block_invoke_38((uint64_t)v39);
    }
  }
  else
  {
    CXDefaultLog();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      -[CXCallSource requestTransaction:completionHandler:].cold.1(v12, v13, v14, v15, v16, v17, v18, v19);

  }
}

void __101__CXChannelServiceClient_reportIncomingTransmissionEndedForChannelWithUUID_reason_completionHandler___block_invoke_38(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB35C8], "cx_errorWithCode:", 2);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);

}

void __101__CXChannelServiceClient_reportIncomingTransmissionEndedForChannelWithUUID_reason_completionHandler___block_invoke_41(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB35C8], "cx_errorWithCode:", 2);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);

}

void __101__CXChannelServiceClient_reportIncomingTransmissionEndedForChannelWithUUID_reason_completionHandler___block_invoke_42(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB35C8], "cx_errorWithCode:", 1);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);

}

- (void)reportIncomingTransmissionStartedForChannelWithUUID:(id)a3 update:(id)a4 shouldReplaceOutgoingTransmission:(id)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
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

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  if (v13)
  {
    if (v10)
    {
      if (v11)
      {
        if (-[CXChannelServiceClient isPermittedToUsePublicAPI](self, "isPermittedToUsePublicAPI"))
        {
          -[CXChannelServiceClient delegate](self, "delegate");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "serviceClient:reportedIncomingTransmissionStartedForChannelWithUUID:update:shouldReplaceOutgoingTransmission:completionHandler:", self, v10, v11, objc_msgSend(v12, "BOOLValue"), v13);

        }
        else
        {
          CXDefaultLog();
          v39 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
            -[CXCallSource reportNewIncomingCallWithUUID:update:reply:].cold.4();

          v40[0] = MEMORY[0x1E0C809B0];
          v40[1] = 3221225472;
          v40[2] = __137__CXChannelServiceClient_reportIncomingTransmissionStartedForChannelWithUUID_update_shouldReplaceOutgoingTransmission_completionHandler___block_invoke_46;
          v40[3] = &unk_1E4B891F8;
          v40[4] = v13;
          __137__CXChannelServiceClient_reportIncomingTransmissionStartedForChannelWithUUID_update_shouldReplaceOutgoingTransmission_completionHandler___block_invoke_46((uint64_t)v40);
        }
      }
      else
      {
        CXDefaultLog();
        v31 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
          -[CXCallSource reportNewIncomingCallWithUUID:update:reply:].cold.3(v31, v32, v33, v34, v35, v36, v37, v38);

        v41[0] = MEMORY[0x1E0C809B0];
        v41[1] = 3221225472;
        v41[2] = __137__CXChannelServiceClient_reportIncomingTransmissionStartedForChannelWithUUID_update_shouldReplaceOutgoingTransmission_completionHandler___block_invoke_45;
        v41[3] = &unk_1E4B891F8;
        v41[4] = v13;
        __137__CXChannelServiceClient_reportIncomingTransmissionStartedForChannelWithUUID_update_shouldReplaceOutgoingTransmission_completionHandler___block_invoke_45((uint64_t)v41);
      }
    }
    else
    {
      CXDefaultLog();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
        -[CXCallSource reportNewIncomingCallWithUUID:update:reply:].cold.2(v23, v24, v25, v26, v27, v28, v29, v30);

      v42[0] = MEMORY[0x1E0C809B0];
      v42[1] = 3221225472;
      v42[2] = __137__CXChannelServiceClient_reportIncomingTransmissionStartedForChannelWithUUID_update_shouldReplaceOutgoingTransmission_completionHandler___block_invoke_44;
      v42[3] = &unk_1E4B891F8;
      v42[4] = v13;
      __137__CXChannelServiceClient_reportIncomingTransmissionStartedForChannelWithUUID_update_shouldReplaceOutgoingTransmission_completionHandler___block_invoke_44((uint64_t)v42);
    }
  }
  else
  {
    CXDefaultLog();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      -[CXCallSource requestTransaction:completionHandler:].cold.1(v15, v16, v17, v18, v19, v20, v21, v22);

  }
}

void __137__CXChannelServiceClient_reportIncomingTransmissionStartedForChannelWithUUID_update_shouldReplaceOutgoingTransmission_completionHandler___block_invoke_44(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB35C8], "cx_errorWithCode:", 2);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);

}

void __137__CXChannelServiceClient_reportIncomingTransmissionStartedForChannelWithUUID_update_shouldReplaceOutgoingTransmission_completionHandler___block_invoke_45(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB35C8], "cx_errorWithCode:", 2);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);

}

void __137__CXChannelServiceClient_reportIncomingTransmissionStartedForChannelWithUUID_update_shouldReplaceOutgoingTransmission_completionHandler___block_invoke_46(uint64_t a1)
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
    v30 = "-[CXChannelServiceClient requestTransaction:completionHandler:]";
    v31 = 2112;
    v32 = v6;
    _os_log_impl(&dword_1A402D000, v8, OS_LOG_TYPE_DEFAULT, "Received %s with transaction: %@", buf, 0x16u);
  }

  if (v7)
  {
    if (v6)
    {
      if (-[CXServiceClient isPermittedToUsePrivateAPI](self, "isPermittedToUsePrivateAPI"))
      {
        -[CXChannelServiceClient delegate](self, "delegate");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "serviceClient:requestedTransaction:completionHandler:", self, v6, v7);

      }
      else
      {
        CXDefaultLog();
        v26 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
          -[CXCallSource reportAudioFinishedForCallWithUUID:reply:].cold.3();

        v27[0] = MEMORY[0x1E0C809B0];
        v27[1] = 3221225472;
        v27[2] = __63__CXChannelServiceClient_requestTransaction_completionHandler___block_invoke_51;
        v27[3] = &unk_1E4B891F8;
        v27[4] = v7;
        __63__CXChannelServiceClient_requestTransaction_completionHandler___block_invoke_51((uint64_t)v27);
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
      v28[2] = __63__CXChannelServiceClient_requestTransaction_completionHandler___block_invoke_50;
      v28[3] = &unk_1E4B891F8;
      v28[4] = v7;
      __63__CXChannelServiceClient_requestTransaction_completionHandler___block_invoke_50((uint64_t)v28);
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

void __63__CXChannelServiceClient_requestTransaction_completionHandler___block_invoke_50(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB35C8], "cx_errorWithCode:", 2);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);

}

void __63__CXChannelServiceClient_requestTransaction_completionHandler___block_invoke_51(uint64_t a1)
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
  void *v6;
  void *v7;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  CXDefaultLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 138412290;
    v9 = v4;
    _os_log_impl(&dword_1A402D000, v5, OS_LOG_TYPE_DEFAULT, "Sending commit for transaction %@", (uint8_t *)&v8, 0xCu);
  }

  -[CXServiceClient connection](self, "connection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "remoteTarget");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "commitTransaction:", v4);

}

- (void)handleActionTimeout:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  CXDefaultLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 138412290;
    v9 = v4;
    _os_log_impl(&dword_1A402D000, v5, OS_LOG_TYPE_DEFAULT, "Sending handle timeout for action %@", (uint8_t *)&v8, 0xCu);
  }

  -[CXServiceClient connection](self, "connection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "remoteTarget");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "handleActionTimeout:", v4);

}

- (void)handleAudioSessionActivationStateChangedTo:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  _DWORD v8[2];
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  CXDefaultLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v8[0] = 67109120;
    v8[1] = objc_msgSend(v4, "BOOLValue");
    _os_log_impl(&dword_1A402D000, v5, OS_LOG_TYPE_DEFAULT, "Sending handleAudioSessionActivationStateChangedTo %d", (uint8_t *)v8, 8u);
  }

  -[CXServiceClient connection](self, "connection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "remoteTarget");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "handleAudioSessionActivationStateChangedTo:", v4);

}

- (CXChannelServiceClientDelegate)delegate
{
  return (CXChannelServiceClientDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)initWithConnection:(NSObject *)a3 .cold.1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  id v5;
  id v6;
  uint8_t v7[12];
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  objc_opt_class();
  OUTLINED_FUNCTION_3_1();
  v8 = 2112;
  v9 = a2;
  v6 = v5;
  _os_log_error_impl(&dword_1A402D000, a3, OS_LOG_TYPE_ERROR, "Failed to initialize %@; expected background mode not found on connection %@.",
    v7,
    0x16u);

}

- (void)registerWithConfiguration:(uint64_t)a3 completionHandler:(uint64_t)a4 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1A402D000, a1, a3, "Invalid argument; '%@' parameter cannot be nil.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)reportChannelWithUUID:(uint64_t)a3 disconnectedAtDate:(uint64_t)a4 disconnectedReason:(uint64_t)a5 completionHandler:(uint64_t)a6 .cold.3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1A402D000, a1, a3, "Invalid argument; '%@' parameter cannot be nil.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)reportIncomingTransmissionEndedForChannelWithUUID:(uint64_t)a3 reason:(uint64_t)a4 completionHandler:(uint64_t)a5 .cold.3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1A402D000, a1, a3, "Invalid argument; '%@' parameter cannot be nil.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

@end
