@implementation AMSMediaProtocolHandler

- (void)handleResponse:(id)a3 task:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  objc_super v12;
  _QWORD v13[4];
  id v14;
  id v15;
  AMSMediaProtocolHandler *v16;
  id v17;

  v8 = a3;
  v13[1] = 3221225472;
  v13[2] = __65__AMSMediaProtocolHandler_handleResponse_task_completionHandler___block_invoke;
  v13[3] = &unk_1E2542E68;
  v14 = a4;
  v15 = v8;
  v16 = self;
  v17 = a5;
  v12.receiver = self;
  v12.super_class = (Class)AMSMediaProtocolHandler;
  v13[0] = MEMORY[0x1E0C809B0];
  v9 = v17;
  v10 = v8;
  v11 = v14;
  -[AMSURLProtocolHandler handleResponse:task:completionHandler:](&v12, sel_handleResponse_task_completionHandler_, v10, v11, v13);

}

- (AMSMediaTokenServiceProtocol)tokenService
{
  return self->_tokenService;
}

- (AMSMediaProtocolHandler)initWithTokenService:(id)a3
{
  uint64_t v3;
  id v6;
  _BOOL4 v7;
  uint64_t v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  AMSMediaProtocolHandler *v22;
  AMSMediaProtocolHandler *v23;
  objc_super v25;
  uint8_t buf[4];
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (!v6)
  {
    v7 = +[AMSUnitTests isRunningUnitTests](AMSUnitTests, "isRunningUnitTests");
    +[AMSLogConfig sharedMediaConfig](AMSLogConfig, "sharedMediaConfig");
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = (void *)v8;
    if (v7)
    {
      if (!v8)
      {
        +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v9, "OSLogObject");
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        AMSLogKey();
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = (void *)MEMORY[0x1E0CB3940];
        objc_opt_class();
        v13 = objc_opt_class();
        v14 = v13;
        if (v11)
        {
          AMSLogKey();
          v3 = objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "stringWithFormat:", CFSTR("%@: [%@] "), v14, v3);
        }
        else
        {
          objc_msgSend(v12, "stringWithFormat:", CFSTR("%@: "), v13);
        }
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v27 = v15;
        _os_log_impl(&dword_18C849000, v10, OS_LOG_TYPE_ERROR, "%{public}@Expected a token service to be provided. The initialized instance will be unable to fetch media tokens.", buf, 0xCu);
        if (v11)
        {

          v15 = (void *)v3;
        }

      }
      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      +[AMSLogConfig sharedMediaConfig](AMSLogConfig, "sharedMediaConfig");
      v16 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "postNotificationName:object:userInfo:", CFSTR("com.apple.AppleMediaServicesTests.FaultLogged"), v16, 0);
    }
    else
    {
      if (!v8)
      {
        +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v9, "OSLogObject");
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT))
      {
        AMSLogKey();
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = (void *)MEMORY[0x1E0CB3940];
        objc_opt_class();
        v19 = objc_opt_class();
        v20 = v19;
        if (v17)
        {
          AMSLogKey();
          v3 = objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "stringWithFormat:", CFSTR("%@: [%@] "), v20, v3);
        }
        else
        {
          objc_msgSend(v18, "stringWithFormat:", CFSTR("%@: "), v19);
        }
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v27 = v21;
        _os_log_impl(&dword_18C849000, v16, OS_LOG_TYPE_FAULT, "%{public}@Expected a token service to be provided. The initialized instance will be unable to fetch media tokens.", buf, 0xCu);
        if (v17)
        {

          v21 = (void *)v3;
        }

      }
    }

  }
  v25.receiver = self;
  v25.super_class = (Class)AMSMediaProtocolHandler;
  v22 = -[AMSURLProtocolHandler init](&v25, sel_init);
  v23 = v22;
  if (v22)
    objc_storeStrong((id *)&v22->_tokenService, a3);

  return v23;
}

void __65__AMSMediaProtocolHandler_handleResponse_task_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v2;
  id v3;

  v2 = *(_QWORD *)(a1 + 32);
  objc_msgSend(a2, "value");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v2 + 16))(v2, v3);

}

void __65__AMSMediaProtocolHandler_handleResponse_task_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  AMSOptional *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  void *v13;
  _BOOL4 v14;
  AMSOptional *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  _QWORD v19[4];
  id v20;

  v3 = a2;
  +[AMSURLTaskInfo taskInfoForTask:](AMSURLTaskInfo, "taskInfoForTask:", *(_QWORD *)(a1 + 32));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (!v3)
  {
    objc_msgSend(v4, "properties");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "userInfo");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectForKeyedSubscript:", 0x1E2559C80);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      v11 = *(id *)(a1 + 40);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v6 = (AMSOptional *)v11;
      else
        v6 = 0;

      objc_msgSend(*(id *)(a1 + 40), "ams_valueForHTTPHeaderField:", CFSTR("X-Apple-Invoke-Auth"));
      v12 = objc_claimAutoreleasedReturnValue();
      if (v12
        && (v13 = (void *)v12,
            v14 = +[AMSMediaInvokeAuthenticationHandler isInvokeAuthenticationEnabled](AMSMediaInvokeAuthenticationHandler, "isInvokeAuthenticationEnabled"), v13, v14))
      {
        +[AMSMediaInvokeAuthenticationCoordinator sharedInstance](AMSMediaInvokeAuthenticationCoordinator, "sharedInstance");
        v15 = (AMSOptional *)objc_claimAutoreleasedReturnValue();
        -[AMSOptional performAuthFromResponse:taskInfo:](v15, "performAuthFromResponse:taskInfo:", *(_QWORD *)(a1 + 40), v5);
        v16 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        if (-[AMSOptional statusCode](v6, "statusCode") == 401 || -[AMSOptional statusCode](v6, "statusCode") == 403)
        {
          objc_msgSend(*(id *)(a1 + 48), "tokenService");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "invalidateMediaToken");

          +[AMSURLAction retryAction](AMSURLAction, "retryAction");
          v15 = (AMSOptional *)objc_claimAutoreleasedReturnValue();
          +[AMSOptional optionalWithValue:](AMSOptional, "optionalWithValue:", v15);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          +[AMSPromise promiseWithResult:](AMSPromise, "promiseWithResult:", v18);
          v7 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_15:
          goto LABEL_16;
        }
        v15 = -[AMSOptional initWithValue:]([AMSOptional alloc], "initWithValue:", 0);
        +[AMSPromise promiseWithResult:](AMSPromise, "promiseWithResult:", v15);
        v16 = objc_claimAutoreleasedReturnValue();
      }
      v7 = (void *)v16;
      goto LABEL_15;
    }
  }
  v6 = -[AMSOptional initWithValue:]([AMSOptional alloc], "initWithValue:", v3);
  +[AMSPromise promiseWithResult:](AMSPromise, "promiseWithResult:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_16:

  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __65__AMSMediaProtocolHandler_handleResponse_task_completionHandler___block_invoke_2;
  v19[3] = &unk_1E2542E40;
  v20 = *(id *)(a1 + 56);
  objc_msgSend(v7, "addFinishBlock:", v19);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tokenService, 0);
}

- (void)reconfigureNewRequest:(id)a3 originalTask:(id)a4 redirect:(BOOL)a5 completionHandler:(id)a6
{
  _BOOL8 v7;
  id v10;
  id v11;
  objc_super v12;
  _QWORD v13[4];
  id v14;
  AMSMediaProtocolHandler *v15;
  id v16;

  v7 = a5;
  v13[1] = 3221225472;
  v13[2] = __89__AMSMediaProtocolHandler_reconfigureNewRequest_originalTask_redirect_completionHandler___block_invoke;
  v13[3] = &unk_1E2542EB8;
  v14 = a4;
  v15 = self;
  v16 = a6;
  v12.receiver = self;
  v12.super_class = (Class)AMSMediaProtocolHandler;
  v13[0] = MEMORY[0x1E0C809B0];
  v10 = v16;
  v11 = v14;
  -[AMSURLProtocolHandler reconfigureNewRequest:originalTask:redirect:completionHandler:](&v12, sel_reconfigureNewRequest_originalTask_redirect_completionHandler_, a3, v11, v7, v13);

}

void __89__AMSMediaProtocolHandler_reconfigureNewRequest_originalTask_redirect_completionHandler___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  _QWORD v20[4];
  id v21;
  uint64_t v22;
  id v23;

  v5 = a2;
  +[AMSURLTaskInfo taskInfoForTask:](AMSURLTaskInfo, "taskInfoForTask:", *(_QWORD *)(a1 + 32));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[AMSPromise promiseWithResult:](AMSPromise, "promiseWithResult:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!a3)
  {
    objc_msgSend(v6, "properties");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "userInfo");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectForKeyedSubscript:", 0x1E2559C80);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      objc_msgSend(*(id *)(a1 + 40), "tokenService");
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      if (v11)
      {
        objc_msgSend(*(id *)(a1 + 40), "tokenService");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "fetchMediaToken");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "promiseWithTimeout:", 30.0);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v20[0] = MEMORY[0x1E0C809B0];
        v20[1] = 3221225472;
        v20[2] = __89__AMSMediaProtocolHandler_reconfigureNewRequest_originalTask_redirect_completionHandler___block_invoke_2;
        v20[3] = &unk_1E2542E90;
        v15 = v6;
        v16 = *(_QWORD *)(a1 + 40);
        v21 = v15;
        v22 = v16;
        v23 = v5;
        objc_msgSend(v14, "continueWithBlock:", v20);
        v17 = objc_claimAutoreleasedReturnValue();

        v7 = (void *)v17;
      }
      else
      {
        AMSError(0, CFSTR("Could not fetch media token"), CFSTR("No token service was available"), 0);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        +[AMSPromise promiseWithError:](AMSPromise, "promiseWithError:", v18);
        v19 = objc_claimAutoreleasedReturnValue();

        v7 = (void *)v19;
      }
    }
  }
  objc_msgSend(v7, "addFinishBlock:", *(_QWORD *)(a1 + 48));

}

id __89__AMSMediaProtocolHandler_reconfigureNewRequest_originalTask_redirect_completionHandler___block_invoke_2(id *a1, void *a2, void *a3)
{
  void *v3;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  uint8_t buf[4];
  void *v21;
  __int16 v22;
  uint64_t v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (a2)
  {
    objc_msgSend(a2, "tokenString");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(CFSTR("Bearer "), "stringByAppendingString:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = (void *)objc_msgSend(a1[6], "mutableCopy");
    objc_msgSend(v9, "setValue:forHTTPHeaderField:", v8, 0x1E255A640);
    +[AMSPromise promiseWithResult:](AMSPromise, "promiseWithResult:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    +[AMSLogConfig sharedMediaConfig](AMSLogConfig, "sharedMediaConfig");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v11)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v11, "OSLogObject");
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(a1[4], "properties");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "logUUID");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = (void *)MEMORY[0x1E0CB3940];
      v16 = objc_opt_class();
      v17 = v16;
      if (v14)
      {
        objc_msgSend(a1[4], "properties");
        a1 = (id *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(a1, "logUUID");
        v3 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "stringWithFormat:", CFSTR("%@: [%@] "), v17, v3);
      }
      else
      {
        objc_msgSend(v15, "stringWithFormat:", CFSTR("%@: "), v16);
      }
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v21 = v18;
      v22 = 2048;
      v23 = objc_msgSend(v6, "code");
      _os_log_impl(&dword_18C849000, v12, OS_LOG_TYPE_ERROR, "%{public}@We weren't provided a media token. Error code: %ld.", buf, 0x16u);
      if (v14)
      {

        v18 = a1;
      }

    }
    +[AMSPromise promiseWithError:](AMSPromise, "promiseWithError:", v6);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v10;
}

@end
