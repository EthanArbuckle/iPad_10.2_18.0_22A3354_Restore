@implementation AMSAuthorizeMachineProtocolHandler

- (void)reconfigureNewRequest:(id)a3 originalTask:(id)a4 redirect:(BOOL)a5 error:(id *)a6
{
  _BOOL8 v7;
  id v10;
  id v11;
  void *v12;
  NSObject *v13;
  id *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void (**v19)(_QWORD, _QWORD);
  void *v20;
  id v21;
  void *v22;
  NSObject *v23;
  id *v24;
  void *v25;
  id v26;
  void *v27;
  objc_super v28;
  uint8_t buf[4];
  void *v30;
  __int16 v31;
  void *v32;
  uint64_t v33;

  v7 = a5;
  v33 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v12)
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v12, "OSLogObject");
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    v14 = a6;
    v15 = (void *)objc_opt_class();
    v16 = v15;
    AMSLogKey();
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v30 = v15;
    a6 = v14;
    v31 = 2114;
    v32 = v17;
    _os_log_impl(&dword_18C849000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Reconfiguring request for authorization/deauthorization", buf, 0x16u);

  }
  -[AMSAuthorizeMachineProtocolHandler reconfigureRequestHandler](self, "reconfigureRequestHandler");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v18)
  {
    -[AMSAuthorizeMachineProtocolHandler reconfigureRequestHandler](self, "reconfigureRequestHandler");
    v19 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, id))v19)[2](v19, v10);

  }
  objc_msgSend(v11, "response");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v21 = v20;
  else
    v21 = 0;

  if (objc_msgSend(v21, "statusCode") < 300 || objc_msgSend(v21, "statusCode") >= 400)
  {
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
      v24 = a6;
      v25 = (void *)objc_opt_class();
      v26 = v25;
      AMSLogKey();
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v30 = v25;
      a6 = v24;
      v31 = 2114;
      v32 = v27;
      _os_log_impl(&dword_18C849000, v23, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Overriding redirect on reconfigured request for authorization/deauthorization", buf, 0x16u);

    }
    v7 = 0;
  }
  v28.receiver = self;
  v28.super_class = (Class)AMSAuthorizeMachineProtocolHandler;
  -[AMSURLProtocolHandler reconfigureNewRequest:originalTask:redirect:error:](&v28, sel_reconfigureNewRequest_originalTask_redirect_error_, v10, v11, v7, a6);

}

- (id)reconfigureRequestHandler
{
  return self->_reconfigureRequestHandler;
}

- (void)setReconfigureRequestHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_reconfigureRequestHandler, 0);
}

@end
