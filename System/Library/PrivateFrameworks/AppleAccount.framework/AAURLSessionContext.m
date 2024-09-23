@implementation AAURLSessionContext

- (id)_initRequiringSigning:(BOOL)a3 appleIDSession:(id)a4
{
  id v7;
  AAURLSessionContext *v8;
  AAURLSessionContext *v9;
  NSObject *v10;
  AAURLSessionContext *v11;
  dispatch_queue_t v12;
  OS_dispatch_queue *signingQueue;
  objc_super v15;

  v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)AAURLSessionContext;
  v8 = -[AAURLSessionContext init](&v15, sel_init);
  v9 = v8;
  if (v8)
  {
    v8->_requiresSigning = a3;
    objc_storeStrong((id *)&v8->_appleIDSession, a4);
    v9->_signerLock._os_unfair_lock_opaque = 0;
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = v9;
    v12 = dispatch_queue_create("com.apple.appleaccount.URLSigningQ", v10);
    signingQueue = v11->_signingQueue;
    v11->_signingQueue = (OS_dispatch_queue *)v12;

  }
  return v9;
}

void __86__AAURLSessionContext_URLSession_task_getAppleIDHeadersForResponse_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;

  v11 = a2;
  v5 = a3;
  v6 = v11;
  v7 = v5;
  v8 = *(void **)(a1 + 32);
  v9 = *(_QWORD *)(a1 + 40);
  if (v11 && v8)
  {
    objc_msgSend(v8, "aaf_dictionaryByAddingEntriesFromDictionary:");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, uint64_t, void *))(v9 + 16))(v9, 1, v10);

  }
  else
  {
    if (v8)
      v6 = v8;
    (*(void (**)(uint64_t, uint64_t, id))(v9 + 16))(v9, 1, v6);
  }

}

void __86__AAURLSessionContext_URLSession_task_getAppleIDHeadersForResponse_completionHandler___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  _QWORD v8[4];
  id v9;
  id v10;

  v5 = a3;
  objc_msgSend(*(id *)(a1 + 32), "cancel");
  if (a2)
  {
    v6 = *(void **)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 48), "currentRequest");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __86__AAURLSessionContext_URLSession_task_getAppleIDHeadersForResponse_completionHandler___block_invoke_2;
    v8[3] = &unk_1E416E7C8;
    v9 = v5;
    v10 = *(id *)(a1 + 56);
    objc_msgSend(v6, "_additionalHeadersForRequest:completion:", v7, v8);

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }

}

void __47__AAURLSessionContext__relevantHTTPStatusCodes__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0C99E60], "set");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_relevantHTTPStatusCodes_relevantStatusCodes;
  _relevantHTTPStatusCodes_relevantStatusCodes = v0;

}

- (BOOL)requiresSigning
{
  return self->_requiresSigning;
}

- (id)relevantHTTPStatusCodes
{
  void *v2;
  void *v3;
  uint64_t v4;

  -[AKAppleIDSession relevantHTTPStatusCodes](self->_appleIDSession, "relevantHTTPStatusCodes");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "_relevantHTTPStatusCodes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    objc_msgSend(v2, "setByAddingObjectsFromSet:", v3);
    v4 = objc_claimAutoreleasedReturnValue();

    v3 = (void *)v4;
  }

  return v3;
}

- (id)initRequiringSigning:(BOOL)a3
{
  _BOOL8 v3;
  id v5;
  objc_class *v6;
  void *v7;
  void *v8;
  id v9;

  v3 = a3;
  v5 = objc_alloc(MEMORY[0x1E0D00140]);
  v6 = (objc_class *)objc_opt_class();
  NSStringFromClass(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v5, "initWithIdentifier:", v7);

  v9 = -[AAURLSessionContext _initRequiringSigning:appleIDSession:](self, "_initRequiringSigning:appleIDSession:", v3, v8);
  return v9;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v5;
  void *v6;

  v5 = (void *)-[AKAppleIDSession copyWithZone:](self->_appleIDSession, "copyWithZone:");
  v6 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "_initRequiringSigning:appleIDSession:", self->_requiresSigning, v5);

  return v6;
}

- (void)_additionalHeadersForRequest:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  _QWORD v12[4];
  id v13;
  AAURLSessionContext *v14;
  id v15;
  id v16;

  v6 = a3;
  v7 = a4;
  if (_AAURLSessionDefaultHeaders_onceToken != -1)
    dispatch_once(&_AAURLSessionDefaultHeaders_onceToken, &__block_literal_global_145);
  v8 = (void *)objc_msgSend((id)_AAURLSessionDefaultHeaders_defaultHeaders, "mutableCopy");
  if (-[AAURLSessionContext requiresSigning](self, "requiresSigning"))
  {
    objc_msgSend(v6, "aa_HTTPBody");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[AAURLSessionContext remoteServer](self, "remoteServer");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __63__AAURLSessionContext__additionalHeadersForRequest_completion___block_invoke;
    v12[3] = &unk_1E416E778;
    v13 = v8;
    v14 = self;
    v15 = v9;
    v16 = v7;
    v11 = v9;
    objc_msgSend(v10, "configurationWithCompletion:", v12);

  }
  else
  {
    v11 = (id)objc_msgSend(v8, "copy");
    (*((void (**)(id, id, _QWORD))v7 + 2))(v7, v11, 0);
  }

}

- (void)URLSession:(id)a3 task:(id)a4 getAppleIDHeadersForResponse:(id)a5 completionHandler:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  AKAppleIDSession *appleIDSession;
  id v19;
  id v20;
  id v21;
  void *v22;
  void *v23;
  _QWORD v24[4];
  id v25;
  AAURLSessionContext *v26;
  id v27;
  id v28;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  if (!v11)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("AAURLSessionContext.m"), 267, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("session"));

    if (v12)
      goto LABEL_3;
LABEL_5:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("AAURLSessionContext.m"), 268, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("task"));

    goto LABEL_3;
  }
  if (!v12)
    goto LABEL_5;
LABEL_3:
  objc_msgSend(MEMORY[0x1E0C92C98], "sharedSession");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "currentRequest");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "dataTaskWithRequest:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  appleIDSession = self->_appleIDSession;
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __86__AAURLSessionContext_URLSession_task_getAppleIDHeadersForResponse_completionHandler___block_invoke;
  v24[3] = &unk_1E416E7F0;
  v25 = v17;
  v26 = self;
  v27 = v12;
  v28 = v14;
  v19 = v14;
  v20 = v12;
  v21 = v17;
  -[AKAppleIDSession URLSession:task:getAppleIDHeadersForResponse:completionHandler:](appleIDSession, "URLSession:task:getAppleIDHeadersForResponse:completionHandler:", v11, v21, v13, v24);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_remoteServer, 0);
  objc_storeStrong((id *)&self->_absintheSigner, 0);
  objc_storeStrong((id *)&self->_signingQueue, 0);
  objc_storeStrong((id *)&self->_appleIDSession, 0);
}

+ (id)_relevantHTTPStatusCodes
{
  if (_relevantHTTPStatusCodes_onceToken != -1)
    dispatch_once(&_relevantHTTPStatusCodes_onceToken, &__block_literal_global_4);
  return (id)_relevantHTTPStatusCodes_relevantStatusCodes;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (AAURLSessionContext)init
{
  return (AAURLSessionContext *)-[AAURLSessionContext initRequiringSigning:](self, "initRequiringSigning:", 0);
}

- (AAURLSessionContext)initWithCoder:(id)a3
{
  id v4;
  AAURLSessionContext *v5;
  uint64_t v6;
  AKAppleIDSession *appleIDSession;
  NSObject *v8;
  AAURLSessionContext *v9;
  dispatch_queue_t v10;
  OS_dispatch_queue *signingQueue;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)AAURLSessionContext;
  v5 = -[AAURLSessionContext init](&v13, sel_init);
  if (v5)
  {
    v5->_requiresSigning = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("RequiresSigning"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("AppleIDSession"));
    v6 = objc_claimAutoreleasedReturnValue();
    appleIDSession = v5->_appleIDSession;
    v5->_appleIDSession = (AKAppleIDSession *)v6;

    v5->_signerLock._os_unfair_lock_opaque = 0;
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = v5;
    v10 = dispatch_queue_create("com.apple.appleaccount.URLSigningQ", v8);
    signingQueue = v9->_signingQueue;
    v9->_signingQueue = (OS_dispatch_queue *)v10;

  }
  return v5;
}

- (AARemoteServer)remoteServer
{
  os_unfair_lock_s *p_signerLock;
  void *v3;
  _QWORD v5[5];

  p_signerLock = &self->_signerLock;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __35__AAURLSessionContext_remoteServer__block_invoke;
  v5[3] = &unk_1E416E6D8;
  v5[4] = self;
  os_unfair_lock_lock(&self->_signerLock);
  __35__AAURLSessionContext_remoteServer__block_invoke((uint64_t)v5);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock(p_signerLock);
  return (AARemoteServer *)v3;
}

id __35__AAURLSessionContext_remoteServer__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 48);
  if (!v2)
  {
    +[AARemoteServer sharedServer](AARemoteServer, "sharedServer");
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(void **)(v4 + 48);
    *(_QWORD *)(v4 + 48) = v3;

    v2 = *(void **)(*(_QWORD *)(a1 + 32) + 48);
  }
  return v2;
}

- (AAAbsintheSigner)absintheSigner
{
  os_unfair_lock_s *p_signerLock;
  void *v3;
  _QWORD v5[5];

  p_signerLock = &self->_signerLock;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __37__AAURLSessionContext_absintheSigner__block_invoke;
  v5[3] = &unk_1E416E6D8;
  v5[4] = self;
  os_unfair_lock_lock(&self->_signerLock);
  __37__AAURLSessionContext_absintheSigner__block_invoke((uint64_t)v5);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock(p_signerLock);
  return (AAAbsintheSigner *)v3;
}

id __37__AAURLSessionContext_absintheSigner__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 40);
  if (!v2)
  {
    +[AAAbsintheSigner sharedSigner](AAAbsintheSigner, "sharedSigner");
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(void **)(v4 + 40);
    *(_QWORD *)(v4 + 40) = v3;

    v2 = *(void **)(*(_QWORD *)(a1 + 32) + 40);
  }
  return v2;
}

void __63__AAURLSessionContext__additionalHeadersForRequest_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  dispatch_group_t v8;
  uint64_t v9;
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  int8x16_t v15;
  _QWORD block[4];
  id v17;
  id v18;
  _QWORD v19[4];
  int8x16_t v20;
  NSObject *v21;

  v5 = a2;
  v6 = a3;
  if (_AAURLSessionAdditionalDeviceHeaders_onceToken != -1)
    dispatch_once(&_AAURLSessionAdditionalDeviceHeaders_onceToken, &__block_literal_global_150);
  v7 = (id)_AAURLSessionAdditionalDeviceHeaders_additionalDeviceHeaders;
  if (v7)
    objc_msgSend(*(id *)(a1 + 32), "addEntriesFromDictionary:", v7);
  v8 = dispatch_group_create();
  v9 = MEMORY[0x1E0C809B0];
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __63__AAURLSessionContext__additionalHeadersForRequest_completion___block_invoke_2;
  v19[3] = &unk_1E416E728;
  v15 = *(int8x16_t *)(a1 + 32);
  v10 = (id)v15.i64[0];
  v20 = vextq_s8(v15, v15, 8uLL);
  v11 = v8;
  v21 = v11;
  v12 = (void *)MEMORY[0x1A1AED7A0](v19);
  objc_msgSend(v5, "absintheEnable");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "unsignedIntegerValue");
  dispatch_group_enter(v11);
  objc_msgSend(*(id *)(a1 + 40), "_additionalAbsintheHeadersForData:completion:", *(_QWORD *)(a1 + 48), v12);
  v14 = *(NSObject **)(*(_QWORD *)(a1 + 40) + 24);
  block[0] = v9;
  block[1] = 3221225472;
  block[2] = __63__AAURLSessionContext__additionalHeadersForRequest_completion___block_invoke_4;
  block[3] = &unk_1E416E750;
  v18 = *(id *)(a1 + 56);
  v17 = *(id *)(a1 + 32);
  dispatch_group_notify(v11, v14, block);

}

void __63__AAURLSessionContext__additionalHeadersForRequest_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  id v6;
  _QWORD block[4];
  id v8;
  id v9;
  id v10;

  v3 = a2;
  v4 = *(void **)(a1 + 40);
  v5 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 24);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __63__AAURLSessionContext__additionalHeadersForRequest_completion___block_invoke_3;
  block[3] = &unk_1E416E700;
  v8 = v3;
  v9 = v4;
  v10 = *(id *)(a1 + 48);
  v6 = v3;
  dispatch_sync(v5, block);

}

void __63__AAURLSessionContext__additionalHeadersForRequest_completion___block_invoke_3(uint64_t a1)
{
  if (*(_QWORD *)(a1 + 32))
    objc_msgSend(*(id *)(a1 + 40), "addEntriesFromDictionary:");
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
}

void __63__AAURLSessionContext__additionalHeadersForRequest_completion___block_invoke_4(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 40);
  v2 = (id)objc_msgSend(*(id *)(a1 + 32), "copy");
  (*(void (**)(uint64_t, id, _QWORD))(v1 + 16))(v1, v2, 0);

}

- (void)_additionalAbsintheHeadersForData:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;

  v6 = a4;
  v7 = a3;
  -[AAURLSessionContext absintheSigner](self, "absintheSigner");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __68__AAURLSessionContext__additionalAbsintheHeadersForData_completion___block_invoke;
  v10[3] = &unk_1E416E7A0;
  v11 = v6;
  v9 = v6;
  objc_msgSend(v8, "signatureForData:completion:", v7, v10);

}

void __68__AAURLSessionContext__additionalAbsintheHeadersForData_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  objc_class *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  id v16;

  v16 = a3;
  v5 = (objc_class *)MEMORY[0x1E0C99E08];
  v6 = a2;
  v7 = objc_alloc_init(v5);
  objc_msgSend(v6, "base64EncodedStringWithOptions:", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v8, CFSTR("X-MMe-Nas-Qualify"));
  _AAErrorUnderlyingError(v16);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v9, "code"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "stringValue");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v12, CFSTR("X-MMe-Nas-E"));

  }
  v13 = objc_msgSend(v7, "count");
  v14 = *(_QWORD *)(a1 + 32);
  if (v13)
  {
    v15 = (void *)objc_msgSend(v7, "copy");
    (*(void (**)(uint64_t, void *, id))(v14 + 16))(v14, v15, v16);

  }
  else
  {
    (*(void (**)(uint64_t, _QWORD, id))(v14 + 16))(v14, 0, v16);
  }

}

- (void)encodeWithCoder:(id)a3
{
  _BOOL8 requiresSigning;
  id v5;

  requiresSigning = self->_requiresSigning;
  v5 = a3;
  objc_msgSend(v5, "encodeBool:forKey:", requiresSigning, CFSTR("RequiresSigning"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_appleIDSession, CFSTR("AppleIDSession"));

}

- (void)setAbsintheSigner:(id)a3
{
  objc_storeStrong((id *)&self->_absintheSigner, a3);
}

- (void)setRemoteServer:(id)a3
{
  objc_storeStrong((id *)&self->_remoteServer, a3);
}

@end
