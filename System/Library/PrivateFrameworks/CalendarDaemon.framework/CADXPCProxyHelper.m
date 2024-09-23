@implementation CADXPCProxyHelper

- (void)setInitializationOptions:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

void __97__CADXPCProxyHelper__replaceReplyBlockInInvocation_retryingAfterInitializationWithContextHolder___block_invoke_21(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setDatabaseRestoreGeneration:", a3);

  objc_msgSend(*(id *)(a1 + 40), "proxy");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    objc_msgSend(*(id *)(a1 + 32), "_tryInvokeWithGenerationValidation:target:replyBlock:contextHolder:", *(_QWORD *)(a1 + 64), v6, *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 40));
  }
  else
  {
    getCADXPCProxyHelperLogHandle();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __39__CADXPCProxyHelper_forwardInvocation___block_invoke_cold_3(v7, v8, v9, v10, v11, v12, v13, v14);

    objc_msgSend(*(id *)(a1 + 40), "clear");
    objc_msgSend(*(id *)(a1 + 48), "setTarget:", *(_QWORD *)(a1 + 56));
    objc_msgSend(*(id *)(a1 + 48), "invoke");
  }

}

void __97__CADXPCProxyHelper__replaceReplyBlockInInvocation_retryingAfterInitializationWithContextHolder___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  int8x16_t v15;
  _QWORD v16[4];
  int8x16_t v17;
  id v18;
  id v19;
  id v20;
  _QWORD v21[4];
  id v22;
  uint64_t v23;
  id v24;
  id v25;
  int v26;

  v3 = a2;
  v26 = 0;
  objc_msgSend(v3, "getArgument:atIndex:", &v26, 1);
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
  if (*(_BYTE *)(v4 + 24) || v26 != 1019)
  {
    objc_msgSend(*(id *)(a1 + 32), "clear");
    objc_msgSend(v3, "setTarget:", *(_QWORD *)(a1 + 48));
    objc_msgSend(v3, "invoke");
  }
  else
  {
    v5 = MEMORY[0x1E0C809B0];
    *(_BYTE *)(v4 + 24) = 1;
    v21[0] = v5;
    v21[1] = 3221225472;
    v21[2] = __97__CADXPCProxyHelper__replaceReplyBlockInInvocation_retryingAfterInitializationWithContextHolder___block_invoke_3;
    v21[3] = &unk_1E6A37718;
    v6 = *(id *)(a1 + 32);
    v7 = *(_QWORD *)(a1 + 40);
    v8 = *(void **)(a1 + 48);
    v22 = v6;
    v23 = v7;
    v24 = v8;
    v25 = *(id *)(a1 + 56);
    v9 = (void *)MEMORY[0x1BCC9D8DC](v21);
    v10 = *(_QWORD *)(a1 + 40);
    v11 = *(void **)(v10 + 8);
    if (*(_BYTE *)(v10 + 24))
      objc_msgSend(v11, "synchronousRemoteObjectProxyWithErrorHandler:", v9);
    else
      objc_msgSend(v11, "remoteObjectProxyWithErrorHandler:", v9);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "initializationOptions");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = v5;
    v16[1] = 3221225472;
    v16[2] = __97__CADXPCProxyHelper__replaceReplyBlockInInvocation_retryingAfterInitializationWithContextHolder___block_invoke_21;
    v16[3] = &unk_1E6A37740;
    v15 = *(int8x16_t *)(a1 + 32);
    v14 = (id)v15.i64[0];
    v17 = vextq_s8(v15, v15, 8uLL);
    v18 = v3;
    v19 = *(id *)(a1 + 48);
    v20 = *(id *)(a1 + 56);
    objc_msgSend(v12, "CADDatabaseSetInitializationOptions:reply:", v13, v16);

  }
}

- (CADDatabaseInitializationOptions)initializationOptions
{
  return (CADDatabaseInitializationOptions *)objc_getProperty(self, a2, 32, 1);
}

- (id)methodSignatureForSelector:(SEL)a3
{
  void *v5;
  void *v6;
  id v7;
  Protocol *protocol;
  char *types;
  objc_method_description MethodDescription;
  objc_method_description v11;
  void *v12;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)CADXPCProxyHelper;
  -[CADXPCProxyHelper methodSignatureForSelector:](&v14, sel_methodSignatureForSelector_);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    v7 = v5;
  }
  else
  {
    protocol = self->_protocol;
    if (!protocol
      || (MethodDescription = protocol_getMethodDescription(protocol, a3, 1, 1),
          types = MethodDescription.types,
          !MethodDescription.name)
      && (v11 = protocol_getMethodDescription(self->_protocol, a3, 0, 1), types = v11.types, !v11.name))
    {
      v12 = 0;
      goto LABEL_8;
    }
    objc_msgSend(MEMORY[0x1E0C99DD8], "signatureWithObjCTypes:", types);
    v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  v12 = v7;
LABEL_8:

  return v12;
}

- (id)_replaceReplyBlockInInvocation:(id)a3 retryingAfterInitializationWithContextHolder:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  void *v13;
  id v14;
  int v15;
  NSObject *v16;
  uint64_t v18;
  uint64_t v19;
  void (*v20)(uint64_t, void *);
  void *v21;
  id v22;
  id v23;
  id v24;
  _QWORD v25[3];
  char v26;
  uint64_t v27;
  uint64_t v28;
  void (*v29)(uint64_t, void *);
  void *v30;
  id v31;
  id v32;
  id v33;

  v6 = a3;
  v7 = a4;
  v8 = objc_msgSend(MEMORY[0x1E0D0C370], "replyBlockArgumentIndex:", v6);
  if (v8 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v10 = v8;
    v11 = (void *)objc_msgSend(MEMORY[0x1E0D0C370], "copyReplyBlockFromInvocation:", v6);
    v12 = _Block_signature(v11);
    if (v12 && *v12)
    {
      objc_msgSend(MEMORY[0x1E0C99DD8], "signatureWithObjCTypes:", v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if ((unint64_t)objc_msgSend(v13, "numberOfArguments") > 1)
      {
        v14 = objc_retainAutorelease(v13);
        v15 = strcmp((const char *)objc_msgSend(v14, "getArgumentTypeAtIndex:", 1), "i");

        if (!v15)
        {
          if (-[CADXPCProxyHelper _shouldResendInitializationOptionsForInvocation:](self, "_shouldResendInitializationOptionsForInvocation:", v6))
          {
            v25[0] = 0;
            v25[1] = v25;
            v25[2] = 0x2020000000;
            v26 = 0;
            v18 = MEMORY[0x1E0C809B0];
            v19 = 3221225472;
            v20 = __97__CADXPCProxyHelper__replaceReplyBlockInInvocation_retryingAfterInitializationWithContextHolder___block_invoke_2;
            v21 = &unk_1E6A37768;
            v22 = v7;
            v23 = v11;
            v24 = v6;
            v33 = (id)__NSMakeSpecialForwardingCaptureBlock();

            _Block_object_dispose(v25, 8);
          }
          else
          {
            v27 = MEMORY[0x1E0C809B0];
            v28 = 3221225472;
            v29 = __97__CADXPCProxyHelper__replaceReplyBlockInInvocation_retryingAfterInitializationWithContextHolder___block_invoke;
            v30 = &unk_1E6A376F0;
            v31 = v7;
            v32 = v11;
            v33 = (id)__NSMakeSpecialForwardingCaptureBlock();

          }
          objc_msgSend(v6, "setArgument:atIndex:", &v33, v10, v18, v19, v20, v21);
          v9 = v33;

LABEL_11:
          goto LABEL_12;
        }
      }
      else
      {

      }
    }
    getCADXPCProxyHelperLogHandle();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
      -[CADXPCProxyHelper _replaceReplyBlockInInvocation:retryingAfterInitializationWithContextHolder:].cold.1(v6, v16);

    v9 = 0;
    goto LABEL_11;
  }
  v9 = 0;
LABEL_12:

  return v9;
}

- (void)forwardInvocation:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  id v9;
  void *v10;
  CADXPCConnection *connection;
  void *v12;
  void *v13;
  _QWORD v14[4];
  id v15;
  id v16;
  CADXPCProxyHelper *v17;
  id v18;
  _QWORD *v19;
  _QWORD v20[3];
  int v21;

  v4 = a3;
  v5 = (void *)objc_msgSend(MEMORY[0x1E0D0C370], "copyReplyBlockFromInvocation:", v4);
  if (self->_connection)
  {
    v20[0] = 0;
    v20[1] = v20;
    v20[2] = 0x2020000000;
    v21 = 1;
    v6 = (void *)objc_opt_new();
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __39__CADXPCProxyHelper_forwardInvocation___block_invoke;
    v14[3] = &unk_1E6A376C8;
    v7 = v5;
    v15 = v7;
    v19 = v20;
    v8 = v6;
    v16 = v8;
    v17 = self;
    v9 = v4;
    v18 = v9;
    v10 = (void *)MEMORY[0x1BCC9D8DC](v14);
    connection = self->_connection;
    if (self->_synchronous)
      -[CADXPCConnection synchronousRemoteObjectProxyWithErrorHandler:](connection, "synchronousRemoteObjectProxyWithErrorHandler:", v10);
    else
      -[CADXPCConnection remoteObjectProxyWithErrorHandler:](connection, "remoteObjectProxyWithErrorHandler:", v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      -[CADXPCProxyHelper _replaceReplyBlockInInvocation:retryingAfterInitializationWithContextHolder:](self, "_replaceReplyBlockInInvocation:retryingAfterInitializationWithContextHolder:", v9, v8);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (v13)
        objc_msgSend(v8, "retainProxy:andArgumentsInInvocation:", v12, v9);
      -[CADXPCProxyHelper _tryInvokeWithGenerationValidation:target:replyBlock:contextHolder:](self, "_tryInvokeWithGenerationValidation:target:replyBlock:contextHolder:", v9, v12, v7, v8);

    }
    _Block_object_dispose(v20, 8);
  }
  else
  {
    -[CADXPCProxyHelper _callReplyHandler:ofInvocation:withErrorCode:](self, "_callReplyHandler:ofInvocation:withErrorCode:", v5, v4, 1021);
  }

}

- (void)_tryInvokeWithGenerationValidation:(id)a3 target:(id)a4 replyBlock:(id)a5 contextHolder:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;

  v13 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  if (v11
    && !-[CADXPCProxyHelper _validateCADObjectIDsInInvocationArguments:](self, "_validateCADObjectIDsInInvocationArguments:", v13))
  {
    objc_msgSend(v12, "clear");
    -[CADXPCProxyHelper _callReplyHandler:ofInvocation:withErrorCode:](self, "_callReplyHandler:ofInvocation:withErrorCode:", v11, v13, 1010);
  }
  else
  {
    objc_msgSend(v13, "invokeWithTarget:", v10);
  }

}

- (BOOL)_validateCADObjectIDsInInvocationArguments:(id)a3
{
  id v4;
  void *v5;
  int v6;
  int v7;
  void *v8;
  uint64_t v9;
  unint64_t v10;
  id v11;
  NSObject *v12;
  unint64_t v13;
  void *v14;
  BOOL v15;
  NSObject *v17;
  NSObject *v19;
  const char *Name;
  int v21;
  const char *v22;
  int v23;
  NSObject *v24;
  int v25;
  id v26;
  uint8_t buf[4];
  const char *v28;
  __int16 v29;
  int v30;
  __int16 v31;
  NSObject *v32;
  __int16 v33;
  int v34;
  __int16 v35;
  int v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[CADXPCProxyHelper delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v5, "shouldValidateObjectIDs")
    || (v6 = objc_msgSend(v5, "databaseRestoreGeneration"), v6 == -1))
  {
    v15 = 1;
    goto LABEL_23;
  }
  v7 = v6;
  objc_msgSend(v4, "methodSignature");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v8, "numberOfArguments"))
  {
LABEL_20:
    v15 = 1;
    goto LABEL_21;
  }
  v9 = 0;
  v10 = 0x1E0C99000uLL;
  v25 = v7;
  while (1)
  {
    v11 = objc_retainAutorelease(v8);
    if (strcmp((const char *)objc_msgSend(v11, "getArgumentTypeAtIndex:", v9), "@"))
      goto LABEL_19;
    v26 = 0;
    objc_msgSend(v4, "getArgument:atIndex:", &v26, v9);
    if (!v26)
      goto LABEL_19;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v12 = v26;
      if (-[NSObject restoreGeneration](v12, "restoreGeneration") != -1
        && -[NSObject restoreGeneration](v12, "restoreGeneration") != v7)
      {
        getCADXPCProxyHelperLogHandle();
        v17 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
        {
          Name = sel_getName((SEL)objc_msgSend(v4, "selector"));
          v21 = -[NSObject restoreGeneration](v12, "restoreGeneration");
          *(_DWORD *)buf = 136447234;
          v28 = Name;
          v29 = 1024;
          v30 = v9;
          v31 = 2112;
          v32 = v12;
          v33 = 1024;
          v34 = v21;
          v35 = 1024;
          v36 = v7;
          _os_log_debug_impl(&dword_1B6A18000, v17, OS_LOG_TYPE_DEBUG, "Found CADObjectID argument with unexpected restore generation in call to selector %{public}s. index = %d, objectID = %@, generation = %d, expected = %d", buf, 0x28u);
        }
        goto LABEL_26;
      }
      goto LABEL_18;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      break;
LABEL_19:
    if (++v9 == objc_msgSend(v11, "numberOfArguments"))
      goto LABEL_20;
  }
  v13 = v10;
  v12 = v26;
  -[NSObject firstObject](v12, "firstObject");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v14 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
LABEL_17:

    v10 = v13;
    v7 = v25;
LABEL_18:

    goto LABEL_19;
  }
  v24 = v14;
  if (-[NSObject restoreGeneration](v24, "restoreGeneration") == -1
    || -[NSObject restoreGeneration](v24, "restoreGeneration") == v25)
  {

    goto LABEL_17;
  }
  getCADXPCProxyHelperLogHandle();
  v19 = objc_claimAutoreleasedReturnValue();
  v17 = v24;
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
  {
    v22 = sel_getName((SEL)objc_msgSend(v4, "selector"));
    v23 = -[NSObject restoreGeneration](v24, "restoreGeneration");
    *(_DWORD *)buf = 136447234;
    v28 = v22;
    v29 = 1024;
    v30 = v9;
    v31 = 2112;
    v32 = v24;
    v33 = 1024;
    v34 = v23;
    v35 = 1024;
    v36 = v25;
    _os_log_debug_impl(&dword_1B6A18000, v19, OS_LOG_TYPE_DEBUG, "Found CADObjectID in array argument with unexpected restore generation in call to selector %{public}s. index = %d, objectID = %@, generation = %d, expected = %d", buf, 0x28u);
  }

LABEL_26:
  v15 = 0;
LABEL_21:

LABEL_23:
  return v15;
}

- (CADXPCProxyHelperDelegate)delegate
{
  return (CADXPCProxyHelperDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (BOOL)_shouldResendInitializationOptionsForInvocation:(id)a3
{
  return objc_msgSend(a3, "selector") != (_QWORD)sel_CADDatabaseSetInitializationOptions_reply_;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_initializationOptions, 0);
  objc_storeStrong((id *)&self->_protocol, 0);
  objc_storeStrong((id *)&self->_connection, 0);
}

- (CADXPCProxyHelper)initWithXPCConnection:(id)a3 protocol:(id)a4 synchronous:(BOOL)a5
{
  id v9;
  id v10;
  CADXPCProxyHelper *v11;
  CADXPCProxyHelper *v12;
  objc_super v14;

  v9 = a3;
  v10 = a4;
  v14.receiver = self;
  v14.super_class = (Class)CADXPCProxyHelper;
  v11 = -[CADXPCProxyHelper init](&v14, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_connection, a3);
    objc_storeStrong((id *)&v12->_protocol, a4);
    v12->_synchronous = a5;
  }

  return v12;
}

void __39__CADXPCProxyHelper_forwardInvocation___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  NSObject *v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  NSObject *v19;

  v3 = a2;
  v4 = v3;
  if (*(_QWORD *)(a1 + 32))
  {
    if (objc_msgSend(v3, "code") == 4097)
    {
      v5 = (void *)*MEMORY[0x1E0CB28A8];
      objc_msgSend(v4, "domain");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v5) = objc_msgSend(v5, "isEqualToString:", v6);

      if ((_DWORD)v5)
      {
        if (*(int *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) >= 1)
        {
          getCADXPCProxyHelperLogHandle();
          v7 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
            __39__CADXPCProxyHelper_forwardInvocation___block_invoke_cold_4(v7);

          --*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24);
          objc_msgSend(*(id *)(a1 + 40), "proxy");
          v8 = objc_claimAutoreleasedReturnValue();
          if (v8)
          {
            v9 = (void *)v8;
            objc_msgSend(*(id *)(a1 + 48), "_tryInvokeWithGenerationValidation:target:replyBlock:contextHolder:", *(_QWORD *)(a1 + 56), v8, *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

            goto LABEL_18;
          }
          getCADXPCProxyHelperLogHandle();
          v11 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
            __39__CADXPCProxyHelper_forwardInvocation___block_invoke_cold_3(v11, v12, v13, v14, v15, v16, v17, v18);

        }
      }
    }
    getCADXPCProxyHelperLogHandle();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      __39__CADXPCProxyHelper_forwardInvocation___block_invoke_cold_2();

    objc_msgSend(*(id *)(a1 + 40), "clear");
    objc_msgSend(*(id *)(a1 + 48), "_callReplyHandler:ofInvocation:withErrorCode:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 56), objc_msgSend(v4, "code"));
  }
  else
  {
    getCADXPCProxyHelperLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      __39__CADXPCProxyHelper_forwardInvocation___block_invoke_cold_1();

  }
LABEL_18:

}

void __97__CADXPCProxyHelper__replaceReplyBlockInInvocation_retryingAfterInitializationWithContextHolder___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "clear");
  objc_msgSend(v4, "setTarget:", *(_QWORD *)(a1 + 40));
  objc_msgSend(v4, "invoke");

}

void __97__CADXPCProxyHelper__replaceReplyBlockInInvocation_retryingAfterInitializationWithContextHolder___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  getCADXPCProxyHelperLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __97__CADXPCProxyHelper__replaceReplyBlockInInvocation_retryingAfterInitializationWithContextHolder___block_invoke_3_cold_1();

  objc_msgSend(*(id *)(a1 + 32), "clear");
  objc_msgSend(*(id *)(a1 + 40), "_callReplyHandler:ofInvocation:withErrorCode:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), objc_msgSend(v3, "code"));

}

- (void)_callReplyHandler:(id)a3 ofInvocation:(id)a4 withErrorCode:(int64_t)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  void *v13;
  _QWORD v14[4];
  id v15;
  id v16;
  int64_t v17;

  v8 = a3;
  v9 = a4;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __66__CADXPCProxyHelper__callReplyHandler_ofInvocation_withErrorCode___block_invoke;
  v14[3] = &unk_1E6A373F8;
  v10 = v8;
  v15 = v10;
  v11 = v9;
  v16 = v11;
  v17 = a5;
  v12 = MEMORY[0x1BCC9D8DC](v14);
  v13 = (void *)v12;
  if (self->_synchronous)
  {
    (*(void (**)(uint64_t))(v12 + 16))(v12);
  }
  else
  {
    if (_callReplyHandler_ofInvocation_withErrorCode__onceToken != -1)
      dispatch_once(&_callReplyHandler_ofInvocation_withErrorCode__onceToken, &__block_literal_global_12);
    dispatch_async((dispatch_queue_t)_callReplyHandler_ofInvocation_withErrorCode__asyncQueue, v13);
  }

}

uint64_t __66__CADXPCProxyHelper__callReplyHandler_ofInvocation_withErrorCode___block_invoke(_QWORD *a1)
{
  return objc_msgSend(MEMORY[0x1E0D0C370], "callReplyHandler:ofInvocation:withErrorCode:", a1[4], a1[5], a1[6]);
}

void __66__CADXPCProxyHelper__callReplyHandler_ofInvocation_withErrorCode___block_invoke_2()
{
  dispatch_queue_t v0;
  void *v1;
  NSObject *v2;

  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v2 = objc_claimAutoreleasedReturnValue();
  v0 = dispatch_queue_create("EventKitXPCErrorReplyQueue", v2);
  v1 = (void *)_callReplyHandler_ofInvocation_withErrorCode__asyncQueue;
  _callReplyHandler_ofInvocation_withErrorCode__asyncQueue = (uint64_t)v0;

}

void __39__CADXPCProxyHelper_forwardInvocation___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0_1(&dword_1B6A18000, v0, v1, "Received error from calaccessd connection, but there's no pending reply block.\n%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

void __39__CADXPCProxyHelper_forwardInvocation___block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0_1(&dword_1B6A18000, v0, v1, "Received error from calaccessd connection: %@. Attempting to call any reply handler.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

void __39__CADXPCProxyHelper_forwardInvocation___block_invoke_cold_3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1_1(&dword_1B6A18000, a1, a3, "Proxy unexpectedly deallocated; unable to resend message.",
    a5,
    a6,
    a7,
    a8,
    0);
  OUTLINED_FUNCTION_1();
}

void __39__CADXPCProxyHelper_forwardInvocation___block_invoke_cold_4(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_1B6A18000, log, OS_LOG_TYPE_DEBUG, "Received NSXPCConnectionInterrupted from calaccessd connection. Attempting to resend message.", v1, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)_replaceReplyBlockInInvocation:(void *)a1 retryingAfterInitializationWithContextHolder:(NSObject *)a2 .cold.1(void *a1, NSObject *a2)
{
  void *v3;
  uint8_t v4[24];
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  NSStringFromSelector((SEL)objc_msgSend(a1, "selector"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_8();
  _os_log_debug_impl(&dword_1B6A18000, a2, OS_LOG_TYPE_DEBUG, "Reply block does not have take an error as its first argument in method: %@", v4, 0xCu);

}

void __97__CADXPCProxyHelper__replaceReplyBlockInInvocation_retryingAfterInitializationWithContextHolder___block_invoke_3_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0_1(&dword_1B6A18000, v0, v1, "Received error from calaccessd connection while trying to resend initialization options: %@. Attempting to call any reply handler.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

@end
