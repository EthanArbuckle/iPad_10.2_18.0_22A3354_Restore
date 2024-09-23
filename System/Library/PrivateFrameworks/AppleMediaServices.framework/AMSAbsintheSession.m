@implementation AMSAbsintheSession

- (AMSAbsintheSession)init
{
  AMSAbsintheSession *v2;
  AMSPromiseSerialQueue *v3;
  AMSPromiseSerialQueue *queue;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)AMSAbsintheSession;
  v2 = -[AMSAbsintheSession init](&v6, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(AMSPromiseSerialQueue);
    queue = v2->_queue;
    v2->_queue = v3;

    v2->_sessionRef = 0;
  }
  return v2;
}

+ (AMSAbsintheSession)defaultSession
{
  if (_MergedGlobals_74 != -1)
    dispatch_once(&_MergedGlobals_74, &__block_literal_global_1);
  return (AMSAbsintheSession *)(id)qword_1ECEACE78;
}

void __36__AMSAbsintheSession_defaultSession__block_invoke()
{
  AMSAbsintheSession *v0;
  void *v1;

  v0 = objc_alloc_init(AMSAbsintheSession);
  v1 = (void *)qword_1ECEACE78;
  qword_1ECEACE78 = (uint64_t)v0;

}

- (id)asynchronouslyClearSession
{
  void *v3;
  void *v4;
  _QWORD v6[5];

  -[AMSAbsintheSession queue](self, "queue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __48__AMSAbsintheSession_asynchronouslyClearSession__block_invoke;
  v6[3] = &unk_1E253D9C8;
  v6[4] = self;
  objc_msgSend(v3, "runBinaryPromiseBlock:", v6);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

void __48__AMSAbsintheSession_asynchronouslyClearSession__block_invoke(uint64_t a1, void *a2)
{
  void (**v3)(id, uint64_t, _QWORD);
  uint64_t v4;
  void *v5;
  int v6;
  int v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  int v13;
  uint64_t v14;
  __int16 v15;
  void *v16;
  __int16 v17;
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = objc_msgSend(*(id *)(a1 + 32), "sessionRef");
  v5 = *(void **)(a1 + 32);
  if (!v4)
    goto LABEL_9;
  v6 = ZyNF2D9(objc_msgSend(v5, "sessionRef"));
  if (!v6)
  {
    v5 = *(void **)(a1 + 32);
LABEL_9:
    objc_msgSend(v5, "setSessionRef:", 0);
    objc_msgSend(*(id *)(a1 + 32), "setServKey:", 0);
    v3[2](v3, 1, 0);
    goto LABEL_10;
  }
  v7 = v6;
  +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v8, "OSLogObject");
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    v10 = objc_opt_class();
    AMSLogKey();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 138543874;
    v14 = v10;
    v15 = 2114;
    v16 = v11;
    v17 = 2048;
    v18 = v7;
    _os_log_impl(&dword_18C849000, v9, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to clear session with status: %ld", (uint8_t *)&v13, 0x20u);

  }
  objc_msgSend(*(id *)(a1 + 32), "setSessionRef:", 0);
  objc_msgSend(*(id *)(a1 + 32), "setServKey:", 0);
  AMSError(0, CFSTR("Absinthe Session Failure"), CFSTR("Failed to clear session"), 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  ((void (**)(id, uint64_t, void *))v3)[2](v3, 0, v12);

LABEL_10:
}

- (id)signData:(id)a3 bag:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  _QWORD v11[4];
  id v12;
  AMSAbsintheSession *v13;
  id v14;

  v6 = a3;
  v7 = a4;
  if (v7)
  {
    -[AMSAbsintheSession queue](self, "queue");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __35__AMSAbsintheSession_signData_bag___block_invoke;
    v11[3] = &unk_1E253DA40;
    v12 = v6;
    v13 = self;
    v14 = v7;
    objc_msgSend(v8, "runPromiseBlock:", v11);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    AMSError(2, CFSTR("Absinthe Session Failure"), CFSTR("Bag was not provided"), 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    +[AMSPromise promiseWithError:](AMSPromise, "promiseWithError:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v9;
}

void __35__AMSAbsintheSession_signData_bag___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  void *v14;
  id v15;
  void *v16;
  id v17;
  int8x16_t v18;
  _QWORD v19[5];
  id v20;
  _QWORD v21[4];
  int8x16_t v22;
  _QWORD v23[4];
  id v24;
  uint64_t v25;

  v3 = a2;
  AMSLogKey();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(*(id *)(a1 + 32), "length"))
  {
    v5 = 0;
  }
  else
  {
    AMSError(2, CFSTR("Absinthe Session Failure"), CFSTR("Invalid data"), 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    +[AMSBinaryPromise promiseWithError:](AMSBinaryPromise, "promiseWithError:", v6);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  v7 = objc_msgSend(*(id *)(a1 + 40), "sessionRef");
  v8 = MEMORY[0x1E0C809B0];
  if (v7
    && (objc_msgSend(*(id *)(a1 + 40), "servKey"), v9 = (void *)objc_claimAutoreleasedReturnValue(),
                                                   v9,
                                                   v9))
  {
    +[AMSBinaryPromise promiseWithSuccess](AMSBinaryPromise, "promiseWithSuccess");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "_prepareContextWithBag:", *(_QWORD *)(a1 + 48));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v23[0] = v8;
    v23[1] = 3221225472;
    v23[2] = __35__AMSAbsintheSession_signData_bag___block_invoke_2;
    v23[3] = &unk_1E253D9F0;
    v12 = v4;
    v13 = *(_QWORD *)(a1 + 40);
    v24 = v12;
    v25 = v13;
    objc_msgSend(v11, "thenWithBlock:", v23);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(v10, "promiseAdapter");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = v8;
  v21[1] = 3221225472;
  v21[2] = __35__AMSAbsintheSession_signData_bag___block_invoke_3;
  v21[3] = &unk_1E253D688;
  v18 = *(int8x16_t *)(a1 + 32);
  v15 = (id)v18.i64[0];
  v22 = vextq_s8(v18, v18, 8uLL);
  objc_msgSend(v14, "thenWithBlock:", v21);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = v8;
  v19[1] = 3221225472;
  v19[2] = __35__AMSAbsintheSession_signData_bag___block_invoke_45;
  v19[3] = &unk_1E253DA18;
  v19[4] = *(_QWORD *)(a1 + 40);
  v20 = v3;
  v17 = v3;
  objc_msgSend(v16, "addFinishBlock:", v19);

}

id __35__AMSAbsintheSession_signData_bag___block_invoke_2(uint64_t a1)
{
  id v2;
  void *v3;
  void *v4;
  _BOOL8 v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;

  v2 = AMSSetLogKey(*(void **)(a1 + 32));
  if (objc_msgSend(*(id *)(a1 + 40), "sessionRef")
    && (objc_msgSend(*(id *)(a1 + 40), "servKey"), v3 = (void *)objc_claimAutoreleasedReturnValue(),
                                                   v3,
                                                   v3))
  {
    +[AMSBinaryPromise promiseWithSuccess](AMSBinaryPromise, "promiseWithSuccess");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = objc_msgSend(*(id *)(a1 + 40), "sessionRef") != 0;
    objc_msgSend(*(id *)(a1 + 40), "servKey");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "length");
    AMSErrorWithFormat(2, CFSTR("Absinthe Session Failure"), CFSTR("Invalid session and/or servKey. hasSession: %d servKeyLength: %ld"), v7, v8, v9, v10, v11, v5);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    +[AMSBinaryPromise promiseWithError:](AMSBinaryPromise, "promiseWithError:", v12);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v4;
}

id __35__AMSAbsintheSession_signData_bag___block_invoke_3(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  uint64_t v4;
  void *v5;
  int v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  BOOL v12;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  AMSAbsintheSignature *v21;
  uint64_t v22;
  unsigned int v24;
  uint64_t v25;
  unsigned int v26;
  _BYTE buf[12];
  __int16 v28;
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  if (os_variant_has_internal_content())
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v2)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v2 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v2, "OSLogObject");
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      v4 = objc_opt_class();
      objc_msgSend(*(id *)(a1 + 40), "base64EncodedStringWithOptions:", 0);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      *(_QWORD *)&buf[4] = v4;
      v28 = 2112;
      v29 = v5;
      _os_log_impl(&dword_18C849000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@: Signing message: %@", buf, 0x16u);

    }
  }
  *(_QWORD *)buf = 0;
  v26 = 0;
  v25 = 0;
  v24 = 0;
  v6 = qSCskg(objc_msgSend(*(id *)(a1 + 32), "sessionRef"), objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 40)), "bytes"), objc_msgSend(*(id *)(a1 + 40), "length"), (uint64_t)buf, (uint64_t)&v26, (uint64_t)&v25, (uint64_t)&v24);
  if (v6)
    v12 = 1;
  else
    v12 = v26 == 0;
  if (v12 || v24 == 0)
  {
    AMSErrorWithFormat(0, CFSTR("Absinthe Session Failure"), CFSTR("Failed to generate signature. Status: %ld"), v7, v8, v9, v10, v11, v6);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    +[AMSPromise promiseWithError:](AMSPromise, "promiseWithError:", v17);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v15 = objc_alloc(MEMORY[0x1E0C99D50]);
    v16 = (void *)objc_msgSend(v15, "initWithBytes:length:", *(_QWORD *)buf, v26);
    objc_msgSend(v16, "base64EncodedStringWithOptions:", 0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_alloc(MEMORY[0x1E0C99D50]);
    v19 = (void *)objc_msgSend(v18, "initWithBytes:length:", v25, v24);
    objc_msgSend(v19, "base64EncodedStringWithOptions:", 0);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    if (v17
      && v20
      && (v21 = objc_alloc_init(AMSAbsintheSignature),
          -[AMSAbsintheSignature setSignature:](v21, "setSignature:", v17),
          -[AMSAbsintheSignature setServKey:](v21, "setServKey:", v20),
          v21))
    {
      +[AMSPromise promiseWithResult:](AMSPromise, "promiseWithResult:", v21);
      v22 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      AMSError(0, CFSTR("Absinthe Session Failure"), CFSTR("Signing finished without a result or error"), 0);
      v21 = (AMSAbsintheSignature *)objc_claimAutoreleasedReturnValue();
      +[AMSPromise promiseWithError:](AMSPromise, "promiseWithError:", v21);
      v22 = objc_claimAutoreleasedReturnValue();
    }
    v14 = (void *)v22;

  }
  return v14;
}

void __35__AMSAbsintheSession_signData_bag___block_invoke_45(uint64_t a1, void *a2, void *a3)
{
  uint64_t v3;
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint8_t buf[4];
  void *v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v6 = a2;
  v7 = a3;
  if (v7)
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v8)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v8, "OSLogObject");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      AMSLogKey();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = (void *)MEMORY[0x1E0CB3940];
      v12 = objc_opt_class();
      v13 = v12;
      if (v10)
      {
        AMSLogKey();
        v3 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "stringWithFormat:", CFSTR("%@: [%@] "), v13, v3);
      }
      else
      {
        objc_msgSend(v11, "stringWithFormat:", CFSTR("%@: "), v12);
      }
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      AMSLogableError(v7);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v17 = v14;
      v18 = 2114;
      v19 = v15;
      _os_log_impl(&dword_18C849000, v9, OS_LOG_TYPE_ERROR, "%{public}@Failed to sign data. error = %{public}@", buf, 0x16u);
      if (v10)
      {

        v14 = (void *)v3;
      }

    }
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (BOOL)verifyData:(id)a3 bag:(id)a4 error:(id *)a5
{
  return 0;
}

- (id)_prepareContextWithBag:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v18[6];
  _QWORD v19[5];
  id v20;
  _BYTE *v21;
  _BYTE buf[24];
  uint64_t v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v5, "OSLogObject");
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = objc_opt_class();
    AMSLogKey();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    *(_QWORD *)&buf[4] = v7;
    *(_WORD *)&buf[12] = 2114;
    *(_QWORD *)&buf[14] = v8;
    _os_log_impl(&dword_18C849000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Provisioning session", buf, 0x16u);

  }
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x2020000000;
  v23 = 0;
  objc_msgSend(v4, "URLForKey:", 0x1E254C320);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "valuePromise");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = MEMORY[0x1E0C809B0];
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __45__AMSAbsintheSession__prepareContextWithBag___block_invoke;
  v19[3] = &unk_1E253DA68;
  v19[4] = self;
  v21 = buf;
  v12 = v4;
  v20 = v12;
  objc_msgSend(v10, "thenWithBlock:", v19);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "thenWithBlock:", &__block_literal_global_66);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = v11;
  v18[1] = 3221225472;
  v18[2] = __45__AMSAbsintheSession__prepareContextWithBag___block_invoke_2;
  v18[3] = &unk_1E253DAB0;
  v18[4] = self;
  v18[5] = buf;
  objc_msgSend(v14, "thenWithBlock:", v18);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "binaryPromiseAdapter");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  _Block_object_dispose(buf, 8);
  return v16;
}

id __45__AMSAbsintheSession__prepareContextWithBag___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  int v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  BOOL v10;
  void *v11;
  id v12;
  void *v13;
  uint64_t v14;
  void *v15;
  __CFString *v16;
  __CFString *v17;
  void *v18;
  AMSURLRequestEncoder *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  uint64_t v23;
  void *v24;
  uint64_t v26;
  unsigned int v27;
  _QWORD v28[2];
  _QWORD v29[2];
  uint8_t buf[4];
  uint64_t v31;
  __int16 v32;
  void *v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v27 = 0;
  v26 = 0;
  if (+[AMSUnitTests isRunningUnitTests](AMSUnitTests, "isRunningUnitTests")
    && objc_msgSend(*(id *)(a1 + 32), "PSCHelloV4Override"))
  {
    v4 = ((uint64_t (*)(uint64_t, uint64_t *, unsigned int *, uint64_t))objc_msgSend(*(id *)(a1 + 32), "PSCHelloV4Override"))(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24, &v26, &v27, 2);
  }
  else
  {
    v4 = SwZuQte6Dm(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24, (uint64_t)&v26, (uint64_t)&v27, 2);
  }
  if (v4)
    v10 = 1;
  else
    v10 = v27 == 0;
  if (v10 || !*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
  {
    AMSErrorWithFormat(0, CFSTR("Absinthe Session Failure"), CFSTR("Failed to create hello message. Status: %ld hasSession: %d MsgLength: %ld"), v5, v6, v7, v8, v9, v4);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    +[AMSPromise promiseWithError:](AMSPromise, "promiseWithError:", v11);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    +[AMSDevice deviceGUID](AMSDevice, "deviceGUID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      v12 = objc_alloc(MEMORY[0x1E0C99D50]);
      v13 = (void *)objc_msgSend(v12, "initWithBytes:length:", v26, v27);
      objc_msgSend(v13, "base64EncodedStringWithOptions:", 0);
      v14 = objc_claimAutoreleasedReturnValue();
      v15 = (void *)v14;
      v16 = &stru_1E2548760;
      if (v14)
        v16 = (__CFString *)v14;
      v17 = v16;

      v28[0] = CFSTR("udid");
      v28[1] = CFSTR("request-message");
      v29[0] = v11;
      v29[1] = v17;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v29, v28, 2);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = -[AMSURLRequestEncoder initWithBag:]([AMSURLRequestEncoder alloc], "initWithBag:", *(_QWORD *)(a1 + 40));

      -[AMSURLRequestEncoder setRequestEncoding:](v19, "setRequestEncoding:", 3);
      -[AMSURLRequestEncoder requestWithMethod:URL:parameters:](v19, "requestWithMethod:URL:parameters:", 4, v3, v18);
      v20 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v21)
      {
        +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v21, "OSLogObject");
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        v23 = objc_opt_class();
        AMSLogKey();
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v31 = v23;
        v32 = 2114;
        v33 = v24;
        _os_log_impl(&dword_18C849000, v22, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to detemine unique device identifier", buf, 0x16u);

      }
      AMSError(5, CFSTR("Absinthe Session Failure"), CFSTR("Failed to determine unique device identifier"), 0);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      +[AMSPromise promiseWithError:](AMSPromise, "promiseWithError:", v13);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
    }

  }
  return v20;
}

id __45__AMSAbsintheSession__prepareContextWithBag___block_invoke_64(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;

  v2 = a2;
  objc_msgSend(v2, "setValue:forHTTPHeaderField:", CFSTR("application/json"), CFSTR("Accept"));
  +[AMSURLSession defaultSession](AMSURLSession, "defaultSession");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dataTaskPromiseWithRequest:", v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

id __45__AMSAbsintheSession__prepareContextWithBag___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  uint64_t v11;
  int v12;
  id v13;
  int v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  NSObject *v23;
  uint64_t v24;
  void *v25;
  _BOOL8 v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  uint64_t v34;
  uint8_t buf[4];
  uint64_t v36;
  __int16 v37;
  void *v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a2, "object");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v4 = v3;

    if (!v4)
    {
      v6 = 0;
      goto LABEL_21;
    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("serv-key"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v6 = v5;

      if (v6)
      {
        v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBase64EncodedString:options:", v6, 0);
        goto LABEL_10;
      }
    }
    else
    {

      v6 = 0;
    }
    v3 = 0;
LABEL_10:
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("response"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v8 = v7;

      if (v8)
      {
        v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBase64EncodedString:options:", v8, 0);
        goto LABEL_15;
      }
    }
    else
    {

      v8 = 0;
    }
    v9 = 0;
LABEL_15:
    if (objc_msgSend(v9, "length"))
    {
      if (objc_msgSend(v3, "length"))
      {
        v34 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
        v10 = objc_retainAutorelease(v9);
        v11 = objc_msgSend(v10, "bytes");
        v12 = objc_msgSend(v10, "length");
        v13 = objc_retainAutorelease(v3);
        v14 = xtiKg(v34, v11, v12, objc_msgSend(v13, "bytes"), objc_msgSend(v13, "length"));
        if (v14)
        {
          AMSErrorWithFormat(0, CFSTR("Absinthe Session Failure"), CFSTR("Failed to setup session. Status: %ld"), v15, v16, v17, v18, v19, v14);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          +[AMSPromise promiseWithError:](AMSPromise, "promiseWithError:", v20);
          v21 = (void *)objc_claimAutoreleasedReturnValue();

          goto LABEL_31;
        }
      }
    }

    goto LABEL_20;
  }
  v4 = 0;
  v6 = 0;
LABEL_20:

LABEL_21:
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
  {
    v26 = 0;
LABEL_30:
    objc_msgSend(v6, "length");
    AMSErrorWithFormat(0, CFSTR("Absinthe Session Failure"), CFSTR("Failed to create session. (sessionExists: %d servKeyLength: %ld)"), v27, v28, v29, v30, v31, v26);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    +[AMSPromise promiseWithError:](AMSPromise, "promiseWithError:", v32);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_31;
  }
  if (!objc_msgSend(v6, "length"))
  {
    v26 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) != 0;
    goto LABEL_30;
  }
  +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v22)
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v22, "OSLogObject");
  v23 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
  {
    v24 = objc_opt_class();
    AMSLogKey();
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v36 = v24;
    v37 = 2114;
    v38 = v25;
    _os_log_impl(&dword_18C849000, v23, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Provisioning succeeded", buf, 0x16u);

  }
  objc_msgSend(*(id *)(a1 + 32), "setSessionRef:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24));
  objc_msgSend(*(id *)(a1 + 32), "setServKey:", v6);
  +[AMSPromise promiseWithResult:](AMSPromise, "promiseWithResult:", MEMORY[0x1E0C9AAB0]);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_31:

  return v21;
}

- (BOOL)clearSession
{
  void *v2;
  char v3;

  -[AMSAbsintheSession asynchronouslyClearSession](self, "asynchronouslyClearSession");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "resultWithError:", 0);

  return v3;
}

- (id)signData:(id)a3 bag:(id)a4 error:(id *)a5
{
  void *v6;
  void *v7;

  -[AMSAbsintheSession signData:bag:](self, "signData:bag:", a3, a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "resultWithError:", a5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)PSCHelloV4Override
{
  return self->_PSCHelloV4Override;
}

- (void)setPSCHelloV4Override:(void *)a3
{
  self->_PSCHelloV4Override = a3;
}

- (AMSPromiseSerialQueue)queue
{
  return self->_queue;
}

- (PSCSessionInternal_)sessionRef
{
  return self->_sessionRef;
}

- (void)setSessionRef:(PSCSessionInternal_ *)a3
{
  self->_sessionRef = a3;
}

- (NSString)servKey
{
  return self->_servKey;
}

- (void)setServKey:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_servKey, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end
