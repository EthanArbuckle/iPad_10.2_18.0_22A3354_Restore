@implementation AMSDaemonConnectionErrorForwardingProxy

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_proxy, 0);
  objc_storeStrong((id *)&self->_interface, 0);
}

- (id)methodSignatureForSelector:(SEL)a3
{
  void *v4;
  void *v5;

  -[AMSDaemonConnectionErrorForwardingProxy proxy](self, "proxy");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "methodSignatureForSelector:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)forwardInvocation:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  _BOOL4 v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void (*v18)(uint64_t, void *);
  void *v19;
  id v20;
  id v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;

  v4 = a3;
  v25 = 0;
  -[AMSDaemonConnectionErrorForwardingProxy _blockToInvokeWithErrorForwardingForInvocation:errorArgumentIndex:](self, "_blockToInvokeWithErrorForwardingForInvocation:errorArgumentIndex:", v4, &v25);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = objc_msgSend(v4, "selector");
    -[AMSDaemonConnectionErrorForwardingProxy interface](self, "interface");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    AMSLogKey();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = MEMORY[0x1E0C809B0];
    v17 = 3221225472;
    v18 = __61__AMSDaemonConnectionErrorForwardingProxy_forwardInvocation___block_invoke;
    v19 = &unk_1E2540918;
    v20 = v8;
    v21 = v7;
    v23 = v6;
    v24 = v25;
    v22 = v5;
    v9 = v7;
    v10 = v8;
    v11 = _Block_copy(&v16);
    v12 = -[AMSDaemonConnectionErrorForwardingProxy isSync](self, "isSync", v16, v17, v18, v19);
    -[AMSDaemonConnectionErrorForwardingProxy proxy](self, "proxy");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v13;
    if (v12)
      objc_msgSend(v13, "synchronousRemoteObjectProxyWithErrorHandler:", v11);
    else
      objc_msgSend(v13, "remoteObjectProxyWithErrorHandler:", v11);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "invokeWithTarget:", v15);
  }
  else
  {
    -[AMSDaemonConnectionErrorForwardingProxy proxy](self, "proxy");
    v10 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "invokeWithTarget:", v10);
  }

}

- (NSXPCProxyCreating)proxy
{
  return self->_proxy;
}

- (BOOL)isSync
{
  return self->_isSync;
}

- (id)_blockToInvokeWithErrorForwardingForInvocation:(id)a3 errorArgumentIndex:(unint64_t *)a4
{
  id v6;
  void *v7;
  unint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  unsigned __int8 v15;
  unint64_t v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  _BOOL4 v23;
  uint64_t v24;
  void *v25;
  NSObject *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  NSObject *v31;
  uint64_t v32;
  void *v33;
  _BOOL4 v34;
  uint64_t v35;
  void *v36;
  NSObject *v37;
  uint64_t v38;
  void *v39;
  void *v40;
  void *v41;
  _BOOL4 v42;
  uint64_t v43;
  uint64_t v44;
  void *v45;
  void *v46;
  NSObject *v47;
  uint64_t v48;
  void *v49;
  uint64_t v50;
  void *v51;
  void *v52;
  id v54;
  void *v55;
  void *v56;
  uint8_t buf[4];
  uint64_t v58;
  __int16 v59;
  void *v60;
  __int16 v61;
  void *v62;
  uint64_t v63;

  v63 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(v6, "methodSignature");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "numberOfArguments");

  if (v8 >= 3
    && (-[AMSDaemonConnectionErrorForwardingProxy interface](self, "interface"),
        v9 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v9, "replyBlockSignatureForSelector:", objc_msgSend(v6, "selector")),
        v10 = (void *)objc_claimAutoreleasedReturnValue(),
        v9,
        v10))
  {
    v11 = (void *)MEMORY[0x1E0C99DD8];
    v54 = objc_retainAutorelease(v10);
    objc_msgSend(v11, "signatureWithObjCTypes:", objc_msgSend(v54, "UTF8String"));
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v55, "numberOfArguments");
    v13 = v12 - 1;
    if (v12 != 1)
    {
      v14 = 0;
      v15 = 0;
      v16 = 0;
      do
      {
        -[AMSDaemonConnectionErrorForwardingProxy interface](self, "interface");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = objc_msgSend(v17, "classForSelector:argumentIndex:ofReply:", objc_msgSend(v6, "selector"), v16, 1);

        v19 = objc_opt_class();
        if (((v18 == v19) & v15) == 1)
        {
          v23 = +[AMSUnitTests isRunningUnitTests](AMSUnitTests, "isRunningUnitTests");
          +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
          v24 = objc_claimAutoreleasedReturnValue();
          v25 = (void *)v24;
          if (v23)
          {
            if (!v24)
            {
              +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
              v25 = (void *)objc_claimAutoreleasedReturnValue();
            }
            objc_msgSend(v25, "OSLogObject");
            v26 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
            {
              v27 = objc_opt_class();
              AMSLogKey();
              v28 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543618;
              v58 = v27;
              v59 = 2114;
              v60 = v28;
              _os_log_impl(&dword_18C849000, v26, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Multiple NSError arguments found in reply handler. Only one was expected.", buf, 0x16u);

            }
            objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v29, "postNotificationName:object:userInfo:", CFSTR("com.apple.AppleMediaServicesTests.FaultLogged"), v30, 0);

          }
          else
          {
            if (!v24)
            {
              +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
              v25 = (void *)objc_claimAutoreleasedReturnValue();
            }
            objc_msgSend(v25, "OSLogObject");
            v31 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v31, OS_LOG_TYPE_FAULT))
            {
              v32 = objc_opt_class();
              AMSLogKey();
              v33 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543618;
              v58 = v32;
              v59 = 2114;
              v60 = v33;
              _os_log_impl(&dword_18C849000, v31, OS_LOG_TYPE_FAULT, "%{public}@: [%{public}@] Multiple NSError arguments found in reply handler. Only one was expected.", buf, 0x16u);

            }
          }
          goto LABEL_24;
        }
        if (v18 == v19)
          v14 = v16;
        v15 |= v18 == v19;
        ++v16;
      }
      while (v13 != v16);
      if ((v15 & 1) == 0)
        goto LABEL_24;
      v56 = 0;
      objc_msgSend(v6, "methodSignature");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(v20, "numberOfArguments") - 1;

      objc_msgSend(v6, "getArgument:atIndex:", &v56, v21);
      if (v56)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          *a4 = v14;
          v22 = (void *)objc_msgSend(v56, "copy");
          goto LABEL_25;
        }
        v42 = +[AMSUnitTests isRunningUnitTests](AMSUnitTests, "isRunningUnitTests");
        +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
        v43 = objc_claimAutoreleasedReturnValue();
        v36 = (void *)v43;
        if (v42)
        {
          if (!v43)
          {
            +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
            v36 = (void *)objc_claimAutoreleasedReturnValue();
          }
          objc_msgSend(v36, "OSLogObject");
          v37 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
          {
            v44 = objc_opt_class();
            AMSLogKey();
            v45 = (void *)objc_claimAutoreleasedReturnValue();
            AMSHashIfNeeded(v56);
            v46 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543874;
            v58 = v44;
            v59 = 2114;
            v60 = v45;
            v61 = 2114;
            v62 = v46;
            _os_log_impl(&dword_18C849000, v37, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Reply handler object isn't a block. object = %{public}@", buf, 0x20u);

          }
LABEL_31:

          objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v40, "postNotificationName:object:userInfo:", CFSTR("com.apple.AppleMediaServicesTests.FaultLogged"), v41, 0);

          goto LABEL_24;
        }
        if (!v43)
        {
          +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
        }
        objc_msgSend(v36, "OSLogObject");
        v47 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v47, OS_LOG_TYPE_FAULT))
        {
          v50 = objc_opt_class();
          AMSLogKey();
          v51 = (void *)objc_claimAutoreleasedReturnValue();
          AMSHashIfNeeded(v56);
          v52 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          v58 = v50;
          v59 = 2114;
          v60 = v51;
          v61 = 2114;
          v62 = v52;
          _os_log_impl(&dword_18C849000, v47, OS_LOG_TYPE_FAULT, "%{public}@: [%{public}@] Reply handler object isn't a block. object = %{public}@", buf, 0x20u);

        }
      }
      else
      {
        v34 = +[AMSUnitTests isRunningUnitTests](AMSUnitTests, "isRunningUnitTests");
        +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
        v35 = objc_claimAutoreleasedReturnValue();
        v36 = (void *)v35;
        if (v34)
        {
          if (!v35)
          {
            +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
            v36 = (void *)objc_claimAutoreleasedReturnValue();
          }
          objc_msgSend(v36, "OSLogObject");
          v37 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
          {
            v38 = objc_opt_class();
            AMSLogKey();
            v39 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v58 = v38;
            v59 = 2114;
            v60 = v39;
            _os_log_impl(&dword_18C849000, v37, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Reply handler block unexpectedly nil.", buf, 0x16u);

          }
          goto LABEL_31;
        }
        if (!v35)
        {
          +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
        }
        objc_msgSend(v36, "OSLogObject");
        v47 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v47, OS_LOG_TYPE_FAULT))
        {
          v48 = objc_opt_class();
          AMSLogKey();
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v58 = v48;
          v59 = 2114;
          v60 = v49;
          _os_log_impl(&dword_18C849000, v47, OS_LOG_TYPE_FAULT, "%{public}@: [%{public}@] Reply handler block unexpectedly nil.", buf, 0x16u);

        }
      }

    }
LABEL_24:
    v22 = 0;
LABEL_25:

  }
  else
  {
    v22 = 0;
  }

  return v22;
}

- (NSXPCInterface)interface
{
  return self->_interface;
}

- (AMSDaemonConnectionErrorForwardingProxy)initWithProxy:(id)a3 fromInterface:(id)a4 isSync:(BOOL)a5
{
  NSXPCProxyCreating *v8;
  NSXPCInterface *v9;
  NSXPCProxyCreating *proxy;
  NSXPCProxyCreating *v11;
  NSXPCInterface *interface;

  v8 = (NSXPCProxyCreating *)a3;
  v9 = (NSXPCInterface *)a4;
  proxy = self->_proxy;
  self->_proxy = v8;
  v11 = v8;

  interface = self->_interface;
  self->_interface = v9;

  self->_isSync = a5;
  return self;
}

- (AMSDaemonConnectionErrorForwardingProxy)initWithProxy:(id)a3 fromInterface:(id)a4
{
  return -[AMSDaemonConnectionErrorForwardingProxy initWithProxy:fromInterface:isSync:](self, "initWithProxy:fromInterface:isSync:", a3, a4, 0);
}

void __61__AMSDaemonConnectionErrorForwardingProxy_forwardInvocation___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  uint8_t buf[4];
  uint64_t v16;
  __int16 v17;
  uint64_t v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  AMSError(0, CFSTR("AMSDaemonConnectionErrorForwardingProxy received XPC error"), CFSTR("XPC error occurred while waiting for a reply from service proxy."), v3);
  v14 = (id)objc_claimAutoreleasedReturnValue();
  +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v4, "OSLogObject");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    v6 = objc_opt_class();
    v7 = *(_QWORD *)(a1 + 32);
    AMSLogableError(v3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v16 = v6;
    v17 = 2114;
    v18 = v7;
    v19 = 2114;
    v20 = v8;
    _os_log_impl(&dword_18C849000, v5, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] XPC error occurred during proxy call. error = %{public}@", buf, 0x20u);

  }
  objc_msgSend(*(id *)(a1 + 40), "replyBlockSignatureForSelector:", *(_QWORD *)(a1 + 56));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)MEMORY[0x1E0C99DD8];
  v11 = objc_retainAutorelease(v9);
  objc_msgSend(v10, "signatureWithObjCTypes:", objc_msgSend(v11, "UTF8String"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DB8], "invocationWithMethodSignature:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setArgument:atIndex:", &v14, *(_QWORD *)(a1 + 64) + 1);
  objc_msgSend(v13, "invokeWithTarget:", *(_QWORD *)(a1 + 48));

}

@end
