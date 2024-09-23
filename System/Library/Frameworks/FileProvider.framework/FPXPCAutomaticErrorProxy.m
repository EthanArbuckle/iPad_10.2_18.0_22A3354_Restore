@implementation FPXPCAutomaticErrorProxy

- (void).cxx_destruct
{
  objc_storeStrong(&self->_retainSelfWhileMessageIsPending, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong(&self->_requestDidBeginBlock, 0);
  objc_storeStrong(&self->_requestWillBeginBlock, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_protocol, 0);
  objc_storeStrong((id *)&self->_target, 0);
}

- (id)methodSignatureForSelector:(SEL)a3
{
  NSXPCProxyCreating *target;

  target = self->_target;
  if (target)
    -[NSXPCProxyCreating methodSignatureForSelector:](target, "methodSignatureForSelector:", a3);
  else
    objc_msgSend(MEMORY[0x1E0C99DD8], "signatureWithObjCTypes:", protocol_getMethodDescription((Protocol *)self[16], a3, 1, 1).types);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)synchronousRemoteObjectProxy
{
  _BYTE *v3;

  if (self->_isSynchronous)
    return self;
  v3 = (_BYTE *)-[FPXPCAutomaticErrorProxy copy](self, "copy");
  v3[64] = 1;
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;

  v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  objc_storeStrong((id *)(v4 + 8), self->_target);
  objc_storeStrong((id *)(v4 + 16), self->_protocol);
  objc_storeStrong((id *)(v4 + 24), self->_error);
  objc_storeStrong((id *)(v4 + 48), self->_name);
  *(_DWORD *)(v4 + 84) = self->_pid;
  v5 = objc_msgSend(self->_requestWillBeginBlock, "copy");
  v6 = *(void **)(v4 + 32);
  *(_QWORD *)(v4 + 32) = v5;

  v7 = objc_msgSend(self->_requestDidBeginBlock, "copy");
  v8 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v7;

  *(_BYTE *)(v4 + 64) = self->_isSynchronous;
  *(_BYTE *)(v4 + 80) = self->_sanitizeErrors;
  return (id)v4;
}

- (void)setSanitizeErrors:(BOOL)a3
{
  self->_sanitizeErrors = a3;
}

- (FPXPCAutomaticErrorProxy)initWithConnection:(id)a3 protocol:(id)a4 orError:(id)a5 name:(id)a6 requestPid:(int)a7
{
  uint64_t v7;
  id v12;
  id v13;
  id v14;
  void *v15;
  FPXPCAutomaticErrorProxy *v16;

  v7 = *(_QWORD *)&a7;
  v12 = a6;
  v13 = a5;
  v14 = a4;
  objc_msgSend(a3, "remoteObjectProxy");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = -[FPXPCAutomaticErrorProxy initWithRemoteObjectProxy:protocol:orError:name:requestPid:requestWillBegin:requestDidBegin:](self, "initWithRemoteObjectProxy:protocol:orError:name:requestPid:requestWillBegin:requestDidBegin:", v15, v14, v13, v12, v7, 0, 0);

  return v16;
}

void __46__FPXPCAutomaticErrorProxy_forwardInvocation___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id WeakRetained;
  int v6;
  void *v7;
  id v8;
  uint64_t v9;

  v3 = a2;
  v9 = *(_QWORD *)(a1 + 80);
  fp_current_or_default_log();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    __46__FPXPCAutomaticErrorProxy_forwardInvocation___block_invoke_cold_1(&v9, a1, v4);

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
  v6 = objc_msgSend(WeakRetained, "sanitizeErrors");

  if (v6)
    objc_msgSend(v3, "fp_sanitizeError");
  v7 = (void *)MEMORY[0x1A1B00850](*(_QWORD *)(a1 + 56));
  objc_msgSend(v3, "setTarget:", v7);

  objc_msgSend(v3, "invoke");
  if (!*(_BYTE *)(a1 + 88))
  {
    v8 = objc_loadWeakRetained((id *)(a1 + 72));
    objc_msgSend(v8, "_requestDidFinish:requestDidFinishBlock:", *(_QWORD *)(a1 + 48), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40));

  }
  __fp_leave_section_Debug((uint64_t)&v9);

}

- (BOOL)sanitizeErrors
{
  return self->_sanitizeErrors;
}

- (void)forwardInvocation:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  unint64_t v7;
  void *v8;
  BOOL v9;
  void *section;
  NSObject *v11;
  _BOOL4 v12;
  NSString *v13;
  void *v14;
  int pid;
  void *v16;
  const char *v17;
  NSString *v18;
  void *v19;
  void *v20;
  id v21;
  int v22;
  id v23;
  void (**v24)(_QWORD, _QWORD);
  NSXPCProxyCreating *target;
  void *v26;
  id v27;
  const char *v28;
  id v29;
  NSObject *v30;
  void *v31;
  id v32;
  void *v33;
  NSString *name;
  void *v35;
  void *v36;
  id v37;
  _QWORD v38[5];
  id v39;
  id v40;
  const char *v41;
  int v42;
  BOOL v43;
  uint64_t v44;
  uint64_t v45;
  void (*v46)(uint64_t, void *);
  void *v47;
  NSString *v48;
  id v49;
  id v50;
  id v51;
  _BYTE *v52;
  id v53[2];
  BOOL v54;
  id location;
  id v56;
  uint8_t v57[16];
  _BYTE buf[24];
  uint64_t (*v59)(uint64_t, uint64_t);
  __int128 v60;
  uint64_t v61;

  v61 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "methodSignature");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v36, "fp_indexOfLastArgumentWithType:", "@?");
  v6 = (void *)MEMORY[0x1E0CB37E8];
  do
    v7 = __ldxr(&_requestIDCounter);
  while (__stxr(v7 + 1, &_requestIDCounter));
  objc_msgSend(v6, "numberWithUnsignedLongLong:");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v56 = 0;
  v9 = self->_pid == 0;
  section = (void *)__fp_create_section();
  fp_current_or_default_log();
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG);
  if (v9)
  {
    if (v12)
    {
      NSStringFromSelector((SEL)objc_msgSend(v4, "selector"));
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      name = self->_name;
      *(_DWORD *)buf = 134218498;
      *(_QWORD *)&buf[4] = section;
      *(_WORD *)&buf[12] = 2114;
      *(_QWORD *)&buf[14] = v33;
      *(_WORD *)&buf[22] = 2112;
      v59 = (uint64_t (*)(uint64_t, uint64_t))name;
      _os_log_debug_impl(&dword_1A0A34000, v11, OS_LOG_TYPE_DEBUG, "[DEBUG] ┣%llx sending %{public}@ to %@", buf, 0x20u);

    }
  }
  else if (v12)
  {
    NSStringFromSelector((SEL)objc_msgSend(v4, "selector"));
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = self->_name;
    FPExecutableNameForProcessIdentifier();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    pid = self->_pid;
    *(_DWORD *)buf = 134219010;
    *(_QWORD *)&buf[4] = section;
    *(_WORD *)&buf[12] = 2114;
    *(_QWORD *)&buf[14] = v35;
    *(_WORD *)&buf[22] = 2112;
    v59 = (uint64_t (*)(uint64_t, uint64_t))v13;
    LOWORD(v60) = 2112;
    *(_QWORD *)((char *)&v60 + 2) = v14;
    WORD5(v60) = 1024;
    HIDWORD(v60) = pid;
    _os_log_debug_impl(&dword_1A0A34000, v11, OS_LOG_TYPE_DEBUG, "[DEBUG] ┣%llx sending %{public}@ to %@ on behalf of %@[%d]", buf, 0x30u);

  }
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x3032000000;
  v59 = __Block_byref_object_copy__25;
  *(_QWORD *)&v60 = __Block_byref_object_dispose__25;
  *((_QWORD *)&v60 + 1) = 0;
  -[FPXPCAutomaticErrorProxy _requestWillBegin:requestID:](self, "_requestWillBegin:requestID:", objc_msgSend(v4, "selector"), v8);
  *((_QWORD *)&v60 + 1) = objc_claimAutoreleasedReturnValue();
  if (v5 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v17 = 0;
  }
  else
  {
    *(_QWORD *)v57 = 0;
    objc_msgSend(v4, "getArgument:atIndex:", v57, v5);
    v16 = (void *)MEMORY[0x1A1B00850](*(_QWORD *)v57);
    v17 = _Block_signature(v16);
    v18 = self->_name;
    NSStringFromSelector((SEL)objc_msgSend(v4, "selector"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    location = 0;
    objc_initWeak(&location, self);
    v44 = MEMORY[0x1E0C809B0];
    v45 = 3221225472;
    v46 = __46__FPXPCAutomaticErrorProxy_forwardInvocation___block_invoke;
    v47 = &unk_1E444EC08;
    v53[1] = section;
    v48 = v18;
    v49 = v19;
    objc_copyWeak(v53, &location);
    v51 = v16;
    v54 = v5 == 0x7FFFFFFFFFFFFFFFLL;
    v50 = v8;
    v52 = buf;
    v20 = (void *)__NSMakeSpecialForwardingCaptureBlock();
    v21 = v56;
    v56 = v20;

    objc_msgSend(v4, "_addAttachedObject:", v56);
    objc_msgSend(v4, "_addAttachedObject:", self);
    objc_msgSend(v4, "setArgument:atIndex:", &v56, v5);

    objc_destroyWeak(v53);
    objc_destroyWeak(&location);

  }
  v22 = self->_pid;
  location = 0;
  objc_initWeak(&location, self);
  v38[0] = MEMORY[0x1E0C809B0];
  v38[1] = 3221225472;
  v38[2] = __46__FPXPCAutomaticErrorProxy_forwardInvocation___block_invoke_10;
  v38[3] = &unk_1E444EC30;
  v38[4] = self;
  v23 = v4;
  v43 = v5 != 0x7FFFFFFFFFFFFFFFLL;
  v39 = v23;
  v41 = v17;
  v40 = v56;
  v42 = v22;
  v24 = (void (**)(_QWORD, _QWORD))MEMORY[0x1A1B00850](v38);
  target = self->_target;
  if (target)
  {
    if (self->_isSynchronous)
      -[NSXPCProxyCreating synchronousRemoteObjectProxyWithErrorHandler:](target, "synchronousRemoteObjectProxyWithErrorHandler:", v24);
    else
      -[NSXPCProxyCreating remoteObjectProxyWithErrorHandler:](target, "remoteObjectProxyWithErrorHandler:", v24);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "forwardInvocation:", v23);
    objc_msgSend(v23, "methodSignature");
    v27 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v28 = (const char *)objc_msgSend(v27, "methodReturnType");

    if (!strcmp(v28, "@"))
    {
      v37 = 0;
      objc_msgSend(v23, "getReturnValue:", &v37);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v29 = v37;
        goto LABEL_23;
      }
      fp_current_or_default_log();
      v30 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
      {
        v31 = (void *)objc_opt_class();
        *(_DWORD *)v57 = 138412290;
        *(_QWORD *)&v57[4] = v31;
        v32 = v31;
        _os_log_impl(&dword_1A0A34000, v30, OS_LOG_TYPE_DEFAULT, "[WARNING] Unexpected return type from XPC call: %@", v57, 0xCu);

      }
    }
  }
  else
  {
    ((void (**)(_QWORD, NSError *))v24)[2](v24, self->_error);
    v26 = 0;
  }
  v29 = 0;
LABEL_23:
  -[FPXPCAutomaticErrorProxy _requestDidBegin:progress:requestID:](self, "_requestDidBegin:progress:requestID:", objc_msgSend(v23, "selector"), v29, v8);
  if (v5 == 0x7FFFFFFFFFFFFFFFLL)
    -[FPXPCAutomaticErrorProxy _requestDidFinish:requestDidFinishBlock:](self, "_requestDidFinish:requestDidFinishBlock:", v8, *(_QWORD *)(*(_QWORD *)&buf[8] + 40));

  objc_destroyWeak(&location);
  _Block_object_dispose(buf, 8);

}

- (void)_requestDidBegin:(SEL)a3 progress:(id)a4 requestID:(id)a5
{
  void (**requestDidBeginBlock)(id, FPXPCAutomaticErrorProxy *, SEL, id, id);

  requestDidBeginBlock = (void (**)(id, FPXPCAutomaticErrorProxy *, SEL, id, id))self->_requestDidBeginBlock;
  if (requestDidBeginBlock)
    requestDidBeginBlock[2](requestDidBeginBlock, self, a3, a5, a4);
}

- (id)_requestWillBegin:(SEL)a3 requestID:(id)a4
{
  id v6;
  void (**requestWillBeginBlock)(id, FPXPCAutomaticErrorProxy *, SEL, id);
  void *v8;
  void *v9;
  unint64_t *p_retainCounter;
  unint64_t v11;
  void *v12;

  v6 = a4;
  requestWillBeginBlock = (void (**)(id, FPXPCAutomaticErrorProxy *, SEL, id))self->_requestWillBeginBlock;
  if (requestWillBeginBlock)
  {
    requestWillBeginBlock[2](requestWillBeginBlock, self, a3, v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v8, "copy");

  }
  else
  {
    v9 = 0;
  }
  p_retainCounter = &self->_retainCounter;
  do
    v11 = __ldaxr(p_retainCounter);
  while (__stlxr(v11 + 1, p_retainCounter));
  if (!v11)
    objc_storeStrong(&self->_retainSelfWhileMessageIsPending, self);
  v12 = (void *)MEMORY[0x1A1B00850](v9);

  return v12;
}

- (void)_requestDidFinish:(id)a3 requestDidFinishBlock:(id)a4
{
  id v6;
  void *v7;
  unint64_t *p_retainCounter;
  unint64_t v9;
  unint64_t v10;
  id retainSelfWhileMessageIsPending;
  id v12;

  v12 = a3;
  v6 = a4;
  v7 = v6;
  if (v6)
    (*((void (**)(id, FPXPCAutomaticErrorProxy *, id))v6 + 2))(v6, self, v12);
  p_retainCounter = &self->_retainCounter;
  do
  {
    v9 = __ldaxr(p_retainCounter);
    v10 = v9 - 1;
  }
  while (__stlxr(v10, p_retainCounter));
  if (!v10)
  {
    retainSelfWhileMessageIsPending = self->_retainSelfWhileMessageIsPending;
    self->_retainSelfWhileMessageIsPending = 0;

  }
}

- (FPXPCAutomaticErrorProxy)initWithRemoteObjectProxy:(id)a3 protocol:(id)a4 orError:(id)a5 name:(id)a6 requestPid:(int)a7 requestWillBegin:(id)a8 requestDidBegin:(id)a9
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  FPXPCAutomaticErrorProxy *v20;
  FPXPCAutomaticErrorProxy *v21;
  NSError *v22;
  void *error;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  NSError *v27;
  uint64_t v28;
  id requestWillBeginBlock;
  uint64_t v30;
  id requestDidBeginBlock;
  id v34;
  objc_super v35;
  uint64_t v36;
  _QWORD v37[2];

  v37[1] = *MEMORY[0x1E0C80C00];
  v34 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a8;
  v19 = a9;
  v35.receiver = self;
  v35.super_class = (Class)FPXPCAutomaticErrorProxy;
  v20 = -[FPXPCAutomaticErrorProxy init](&v35, sel_init);
  v21 = v20;
  if (v20)
  {
    objc_storeStrong((id *)&v20->_target, a3);
    objc_storeStrong((id *)&v21->_protocol, a4);
    if (v16)
    {
      v22 = (NSError *)v16;
      error = v21->_error;
      v21->_error = v22;
    }
    else
    {
      v24 = (void *)MEMORY[0x1E0CB35C8];
      v25 = *MEMORY[0x1E0CB28A8];
      v36 = *MEMORY[0x1E0CB2938];
      v37[0] = CFSTR("FPXPCAutomaticErrorProxy started out with invalid object");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v37, &v36, 1);
      error = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "errorWithDomain:code:userInfo:", v25, 4099, error);
      v26 = objc_claimAutoreleasedReturnValue();
      v27 = v21->_error;
      v21->_error = (NSError *)v26;

    }
    objc_storeStrong((id *)&v21->_name, a6);
    v21->_pid = a7;
    v28 = objc_msgSend(v18, "copy");
    requestWillBeginBlock = v21->_requestWillBeginBlock;
    v21->_requestWillBeginBlock = (id)v28;

    v30 = objc_msgSend(v19, "copy");
    requestDidBeginBlock = v21->_requestDidBeginBlock;
    v21->_requestDidBeginBlock = (id)v30;

    v21->_sanitizeErrors = objc_msgSend((id)objc_opt_class(), "sanitizeErrors");
  }

  return v21;
}

+ (BOOL)sanitizeErrors
{
  return 1;
}

- (unint64_t)timeoutState
{
  return self->_timeoutState;
}

- (int)requestEffectivePid
{
  return self->_pid;
}

- (FPXPCAutomaticErrorProxy)initWithConnection:(id)a3 protocol:(id)a4 orError:(id)a5 name:(id)a6 requestPid:(int)a7 requestWillBegin:(id)a8 requestDidBegin:(id)a9
{
  uint64_t v10;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  void *v21;
  FPXPCAutomaticErrorProxy *v22;

  v10 = *(_QWORD *)&a7;
  v16 = a9;
  v17 = a8;
  v18 = a6;
  v19 = a5;
  v20 = a4;
  objc_msgSend(a3, "remoteObjectProxy");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = -[FPXPCAutomaticErrorProxy initWithRemoteObjectProxy:protocol:orError:name:requestPid:requestWillBegin:requestDidBegin:](self, "initWithRemoteObjectProxy:protocol:orError:name:requestPid:requestWillBegin:requestDidBegin:", v21, v20, v19, v18, v10, v17, v16);

  return v22;
}

- (FPXPCAutomaticErrorProxy)initWithConnection:(id)a3 protocol:(id)a4 orError:(id)a5 name:(id)a6 requestPid:(int)a7 requestWillBegin:(id)a8
{
  uint64_t v8;
  id v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  FPXPCAutomaticErrorProxy *v19;

  v8 = *(_QWORD *)&a7;
  v14 = a8;
  v15 = a6;
  v16 = a5;
  v17 = a4;
  objc_msgSend(a3, "remoteObjectProxy");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = -[FPXPCAutomaticErrorProxy initWithRemoteObjectProxy:protocol:orError:name:requestPid:requestWillBegin:requestDidBegin:](self, "initWithRemoteObjectProxy:protocol:orError:name:requestPid:requestWillBegin:requestDidBegin:", v18, v17, v16, v15, v8, v14, 0);

  return v19;
}

- (id)synchronousRemoteObjectProxyWithErrorHandler:(id)a3
{
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("FPXPCAutomaticErrorProxy.m"), 174, CFSTR("Use the methods from FPXPCAutomaticErrorProxy"));

  return 0;
}

- (id)remoteObjectProxyWithErrorHandler:(id)a3
{
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("FPXPCAutomaticErrorProxy.m"), 180, CFSTR("Use the methods from FPXPCAutomaticErrorProxy"));

  return 0;
}

- (id)remoteObjectProxy
{
  _BYTE *v2;
  FPXPCAutomaticErrorProxy *v4;

  if (self->_isSynchronous)
  {
    v2 = (_BYTE *)-[FPXPCAutomaticErrorProxy copy](self, "copy");
    v2[64] = 0;
    return v2;
  }
  else
  {
    v4 = self;
    return v4;
  }
}

void __46__FPXPCAutomaticErrorProxy_forwardInvocation___block_invoke_10(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  int v20;
  NSObject *v21;
  _BOOL4 v22;
  void *v23;
  void *v24;
  void *v25;
  int v26;
  _BYTE buf[22];
  __int16 v28;
  void *v29;
  __int16 v30;
  int v31;
  _QWORD v32[3];

  v32[2] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (!objc_msgSend(*(id *)(a1 + 32), "sanitizeErrors"))
  {
    v17 = v3;
    goto LABEL_11;
  }
  v4 = *(void **)(a1 + 40);
  v5 = v3;
  v6 = v4;
  objc_msgSend(v5, "domain");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = *MEMORY[0x1E0CB28A8];
  if (!objc_msgSend(v7, "isEqualToString:", *MEMORY[0x1E0CB28A8])
    || objc_msgSend(v5, "code") <= 4096
    || objc_msgSend(v5, "code") > 4223)
  {

    goto LABEL_9;
  }
  v9 = objc_msgSend(v6, "selector");

  if (!v9)
  {
LABEL_9:
    v17 = v5;
    goto LABEL_10;
  }
  v10 = (void *)MEMORY[0x1E0CB3940];
  NSStringFromSelector((SEL)objc_msgSend(v6, "selector"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "stringWithFormat:", CFSTR("Error while sending %@"), v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = (void *)MEMORY[0x1E0CB35C8];
  v14 = objc_msgSend(v5, "code");
  v15 = *MEMORY[0x1E0CB2938];
  v32[0] = *MEMORY[0x1E0CB3388];
  v32[1] = v15;
  *(_QWORD *)buf = v5;
  *(_QWORD *)&buf[8] = v12;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", buf, v32, 2);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "errorWithDomain:code:userInfo:", v8, v14, v16);
  v17 = (id)objc_claimAutoreleasedReturnValue();

LABEL_10:
LABEL_11:
  if (*(_BYTE *)(a1 + 68))
  {
    objc_msgSend(MEMORY[0x1E0C99DD8], "signatureWithObjCTypes:", *(_QWORD *)(a1 + 56));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DB8], "invocationWithMethodSignature:", v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "fp_zeroOutReplyBlockArgumentsWithError:", v17);
    objc_msgSend(v19, "setTarget:", *(_QWORD *)(a1 + 48));
    objc_msgSend(v19, "invoke");
    v20 = *(_DWORD *)(a1 + 64);
    fp_current_or_default_log();
    v21 = objc_claimAutoreleasedReturnValue();
    v22 = os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG);
    if (v20)
    {
      if (v22)
      {
        objc_msgSend(v3, "fp_prettyDescription");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        NSStringFromSelector((SEL)objc_msgSend(*(id *)(a1 + 40), "selector"));
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        FPExecutableNameForProcessIdentifier();
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = *(_DWORD *)(a1 + 64);
        *(_DWORD *)buf = 138413058;
        *(_QWORD *)&buf[4] = v23;
        *(_WORD *)&buf[12] = 2114;
        *(_QWORD *)&buf[14] = v24;
        v28 = 2114;
        v29 = v25;
        v30 = 1024;
        v31 = v26;
        _os_log_debug_impl(&dword_1A0A34000, v21, OS_LOG_TYPE_DEBUG, "[DEBUG] Received error %@ while sending %{public}@ on behalf of %{public}@[%d]", buf, 0x26u);

      }
    }
    else if (v22)
    {
      __46__FPXPCAutomaticErrorProxy_forwardInvocation___block_invoke_10_cold_1(v3, a1, v21);
    }

  }
}

- (BOOL)conformsToProtocol:(id)a3
{
  return 1;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%@:%p %@>"), objc_opt_class(), self, self->_name);
}

- (void)setRequestEffectivePid:(int)a3
{
  self->_pid = a3;
}

- (void)setTimeoutState:(unint64_t)a3
{
  self->_timeoutState = a3;
}

void __46__FPXPCAutomaticErrorProxy_forwardInvocation___block_invoke_cold_1(uint64_t *a1, uint64_t a2, os_log_t log)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  uint64_t v9;
  __int16 v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = *a1;
  v4 = *(_QWORD *)(a2 + 32);
  v5 = *(_QWORD *)(a2 + 40);
  v6 = 134218498;
  v7 = v3;
  v8 = 2112;
  v9 = v4;
  v10 = 2114;
  v11 = v5;
  _os_log_debug_impl(&dword_1A0A34000, log, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx received reply from %@ for %{public}@", (uint8_t *)&v6, 0x20u);
}

void __46__FPXPCAutomaticErrorProxy_forwardInvocation___block_invoke_10_cold_1(void *a1, uint64_t a2, NSObject *a3)
{
  void *v5;
  void *v6;
  int v7;
  void *v8;
  __int16 v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "fp_prettyDescription");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector((SEL)objc_msgSend(*(id *)(a2 + 40), "selector"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 138412546;
  v8 = v5;
  v9 = 2114;
  v10 = v6;
  _os_log_debug_impl(&dword_1A0A34000, a3, OS_LOG_TYPE_DEBUG, "[DEBUG] Received error %@ while sending %{public}@", (uint8_t *)&v7, 0x16u);

}

@end
