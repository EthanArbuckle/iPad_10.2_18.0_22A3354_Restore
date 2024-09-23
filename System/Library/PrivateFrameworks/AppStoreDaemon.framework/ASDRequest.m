@implementation ASDRequest

- (void)_callErrorHandler:(void *)a3 withError:
{
  id v5;
  id v6;
  NSObject *v7;
  _QWORD v8[4];
  id v9;
  id v10;

  v5 = a2;
  v6 = a3;
  if (a1 && v5)
  {
    dispatch_get_global_queue(21, 0);
    v7 = objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __42__ASDRequest__callErrorHandler_withError___block_invoke;
    v8[3] = &unk_1E37BDCC0;
    v10 = v5;
    v9 = v6;
    dispatch_async(v7, v8);

  }
}

+ (id)_sharedBroker
{
  if (_MergedGlobals_49 != -1)
    dispatch_once(&_MergedGlobals_49, &__block_literal_global_22);
  return (id)qword_1ECFFAB58;
}

- (void)_startWithErrorHandler:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  uint64_t *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(uint64_t, void *);
  void *v12;
  ASDRequest *v13;
  id v14;
  _QWORD v15[5];
  uint64_t *v16;

  v4 = a3;
  v5 = MEMORY[0x1E0C809B0];
  v9 = MEMORY[0x1E0C809B0];
  v10 = 3221225472;
  v11 = __37__ASDRequest__startWithErrorHandler___block_invoke;
  v12 = &unk_1E37BDEE8;
  v13 = self;
  v14 = v4;
  v6 = v4;
  v7 = &v9;
  if (self)
  {
    +[ASDRequest _sharedBroker](ASDRequest, "_sharedBroker", v9, v10, v11, v12, v13, v14);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = v5;
    v15[1] = 3221225472;
    v15[2] = __45__ASDRequest__submitRequestWithErrorHandler___block_invoke;
    v15[3] = &unk_1E37BF938;
    v15[4] = self;
    v16 = v7;
    objc_msgSend(v8, "submitRequest:withReplyHandler:", self, v15);

  }
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v9;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v9.receiver = self;
  v9.super_class = (Class)ASDRequest;
  -[ASDRequest description](&v9, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASDRequest requestID](self, "requestID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "UUIDString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@: %@"), v4, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (NSUUID)requestID
{
  return self->_requestID;
}

uint64_t __42__ASDRequest__callErrorHandler_withError___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_proxy, 0);
  objc_storeStrong((id *)&self->_requestID, 0);
  objc_destroyWeak((id *)&self->_observer);
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:forKey:", self->_requestID, CFSTR("requestID"));
}

- (ASDRequest)init
{
  ASDRequest *v2;
  uint64_t v3;
  NSUUID *requestID;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)ASDRequest;
  v2 = -[ASDRequest init](&v6, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v3 = objc_claimAutoreleasedReturnValue();
    requestID = v2->_requestID;
    v2->_requestID = (NSUUID *)v3;

  }
  return v2;
}

void __45__ASDRequest__submitRequestWithErrorHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  int v14;
  id v15;
  __int16 v16;
  id v17;
  __int16 v18;
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a2;
  ASDLogHandleForCategory(12);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (!a2 || v5)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v14 = 138543618;
      v15 = (id)objc_opt_class();
      v16 = 2114;
      v17 = v5;
      v11 = v15;
      _os_log_error_impl(&dword_19A03B000, v8, OS_LOG_TYPE_ERROR, "[%{public}@]: Request could not be submitted: %{public}@", (uint8_t *)&v14, 0x16u);
      goto LABEL_8;
    }
  }
  else if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    v9 = (void *)objc_opt_class();
    v10 = *(void **)(a1 + 32);
    v14 = 138543874;
    v15 = v9;
    v16 = 2114;
    v17 = v10;
    v18 = 2114;
    v19 = 0;
    v11 = v9;
    _os_log_debug_impl(&dword_19A03B000, v8, OS_LOG_TYPE_DEBUG, "[%{public}@]: Request submitted successfully: %{public}@ error: %{public}@", (uint8_t *)&v14, 0x20u);
LABEL_8:

  }
  objc_msgSend(*(id *)(a1 + 32), "setProxy:", v6);

  (*(void (**)(_QWORD, id, uint64_t, uint64_t))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), v5, v12, v13);
}

- (void)setProxy:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

void __37__ASDRequest__startWithErrorHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  id v10;
  _QWORD v11[5];
  id v12;
  _QWORD v13[5];
  id v14;
  uint8_t buf[4];
  id v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "proxy");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = MEMORY[0x1E0C809B0];
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __37__ASDRequest__startWithErrorHandler___block_invoke_2;
    v13[3] = &unk_1E37BDEE8;
    v6 = *(void **)(a1 + 40);
    v13[4] = *(_QWORD *)(a1 + 32);
    v14 = v6;
    objc_msgSend(v4, "remoteObjectProxyWithErrorHandler:", v13);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = v5;
    v11[1] = 3221225472;
    v11[2] = __37__ASDRequest__startWithErrorHandler___block_invoke_16;
    v11[3] = &unk_1E37BDEE8;
    v8 = *(void **)(a1 + 40);
    v11[4] = *(_QWORD *)(a1 + 32);
    v12 = v8;
    objc_msgSend(v7, "startWithErrorHandler:", v11);

  }
  else
  {
    ASDLogHandleForCategory(12);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      v16 = (id)objc_opt_class();
      v17 = 2114;
      v18 = v3;
      v10 = v16;
      _os_log_error_impl(&dword_19A03B000, v9, OS_LOG_TYPE_ERROR, "[%{public}@]: Cannot start request because submission failed with error: %{public}@", buf, 0x16u);

    }
    -[ASDRequest _callErrorHandler:withError:orDefaultCode:](*(_QWORD *)(a1 + 32), *(void **)(a1 + 40), v3);
    -[ASDRequest _notifyObserverOfCompletionWithError:](*(void **)(a1 + 32), v3);
  }

}

- (ASDRequestProxy)proxy
{
  return (ASDRequestProxy *)objc_getProperty(self, a2, 24, 1);
}

- (ASDRequest)initWithCoder:(id)a3
{
  id v4;
  ASDRequest *v5;
  uint64_t v6;
  NSUUID *requestID;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ASDRequest;
  v5 = -[ASDRequest init](&v9, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("requestID"));
    v6 = objc_claimAutoreleasedReturnValue();
    requestID = v5->_requestID;
    v5->_requestID = (NSUUID *)v6;

  }
  return v5;
}

void __27__ASDRequest__sharedBroker__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)qword_1ECFFAB58;
  qword_1ECFFAB58 = v0;

}

+ (void)cancelAllRequestsWithErrorHandler:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  objc_msgSend(a1, "_sharedBroker");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "cancelAllRequestsWithErrorHandler:", v4);

}

- (void)receiveResponse:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  int v7;
  id v8;
  __int16 v9;
  ASDRequest *v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  ASDLogHandleForCategory(12);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    v7 = 138543874;
    v8 = (id)objc_opt_class();
    v9 = 2114;
    v10 = self;
    v11 = 2114;
    v12 = v4;
    v6 = v8;
    _os_log_error_impl(&dword_19A03B000, v5, OS_LOG_TYPE_ERROR, "[%{public}@]: Request %{public}@ received unhandled response: %{public}@", (uint8_t *)&v7, 0x20u);

  }
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)_callErrorHandler:(uint64_t)a1 withError:(void *)a2 orDefaultCode:(void *)a3
{
  id v5;
  void *v6;
  id v7;

  v7 = a2;
  v5 = a3;
  v6 = v5;
  if (a1)
  {
    if (!v5)
    {
      ASDErrorWithUnderlyingErrorAndInfo(0, CFSTR("ASDErrorDomain"), 508, CFSTR("Could not connect to helper daemon"), 0, 0);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
    }
    -[ASDRequest _callErrorHandler:withError:](a1, v7, v6);
  }

}

- (void)_cancelWithErrorHandler:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;
  NSObject *v9;
  void *v10;
  id v11;
  _QWORD v12[5];
  id v13;
  _QWORD v14[5];
  id v15;
  uint8_t buf[4];
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[ASDRequest proxy](self, "proxy");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = MEMORY[0x1E0C809B0];
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __38__ASDRequest__cancelWithErrorHandler___block_invoke;
    v14[3] = &unk_1E37BDEE8;
    v14[4] = self;
    v7 = v4;
    v15 = v7;
    objc_msgSend(v5, "remoteObjectProxyWithErrorHandler:", v14);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = v6;
    v12[1] = 3221225472;
    v12[2] = __38__ASDRequest__cancelWithErrorHandler___block_invoke_13;
    v12[3] = &unk_1E37BDEE8;
    v12[4] = self;
    v13 = v7;
    objc_msgSend(v8, "cancelWithErrorHandler:", v12);

  }
  else if (v4)
  {
    ASDLogHandleForCategory(12);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v17 = (id)objc_opt_class();
      v11 = v17;
      _os_log_error_impl(&dword_19A03B000, v9, OS_LOG_TYPE_ERROR, "[%{public}@]: Cannot cancel request that has not yet been started", buf, 0xCu);

    }
    ASDErrorWithUnderlyingErrorAndInfo(0, CFSTR("ASDErrorDomain"), 532, CFSTR("Request has not been started"), 0, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void *))v4 + 2))(v4, v10);

  }
}

void __38__ASDRequest__cancelWithErrorHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id v5;
  int v6;
  id v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  ASDLogHandleForCategory(12);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    v6 = 138543618;
    v7 = (id)objc_opt_class();
    v8 = 2114;
    v9 = v3;
    v5 = v7;
    _os_log_error_impl(&dword_19A03B000, v4, OS_LOG_TYPE_ERROR, "[%{public}@]: Failed to obtain remote proxy with error: %{public}@", (uint8_t *)&v6, 0x16u);

  }
  -[ASDRequest _callErrorHandler:withError:orDefaultCode:](*(_QWORD *)(a1 + 32), *(void **)(a1 + 40), v3);

}

void __38__ASDRequest__cancelWithErrorHandler___block_invoke_13(uint64_t a1, void *a2)
{
  -[ASDRequest _callErrorHandler:withError:](*(_QWORD *)(a1 + 32), *(void **)(a1 + 40), a2);
}

- (void)_notifyObserverOfCompletionWithError:(void *)a1
{
  id v3;
  void *v4;
  NSObject *v5;
  _QWORD block[4];
  id v7;
  void *v8;
  id v9;

  v3 = a2;
  if (a1)
  {
    objc_msgSend(a1, "observer");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      dispatch_get_global_queue(21, 0);
      v5 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __51__ASDRequest__notifyObserverOfCompletionWithError___block_invoke;
      block[3] = &unk_1E37BDE50;
      v7 = v4;
      v8 = a1;
      v9 = v3;
      dispatch_async(v5, block);

    }
  }

}

uint64_t __51__ASDRequest__notifyObserverOfCompletionWithError___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "request:didCompleteWithError:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

void __37__ASDRequest__startWithErrorHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id v5;
  int v6;
  id v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  ASDLogHandleForCategory(12);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    v6 = 138543618;
    v7 = (id)objc_opt_class();
    v8 = 2114;
    v9 = v3;
    v5 = v7;
    _os_log_error_impl(&dword_19A03B000, v4, OS_LOG_TYPE_ERROR, "[%{public}@]: Failed to obtain remote proxy with error: %{public}@", (uint8_t *)&v6, 0x16u);

  }
  -[ASDRequest _callErrorHandler:withError:orDefaultCode:](*(_QWORD *)(a1 + 32), *(void **)(a1 + 40), v3);
  -[ASDRequest _notifyObserverOfCompletionWithError:](*(void **)(a1 + 32), v3);

}

void __37__ASDRequest__startWithErrorHandler___block_invoke_16(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  id v6;
  int v7;
  id v8;
  __int16 v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  ASDLogHandleForCategory(12);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v7 = 138543618;
      v8 = (id)objc_opt_class();
      v9 = 2114;
      v10 = v3;
      v6 = v8;
      _os_log_error_impl(&dword_19A03B000, v5, OS_LOG_TYPE_ERROR, "[%{public}@]: Failed to start with error: %{public}@", (uint8_t *)&v7, 0x16u);
LABEL_6:

    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v7 = 138543618;
    v8 = (id)objc_opt_class();
    v9 = 2114;
    v10 = 0;
    v6 = v8;
    _os_log_impl(&dword_19A03B000, v5, OS_LOG_TYPE_INFO, "[%{public}@]: Started successfully with error: %{public}@", (uint8_t *)&v7, 0x16u);
    goto LABEL_6;
  }

  -[ASDRequest _callErrorHandler:withError:](*(_QWORD *)(a1 + 32), *(void **)(a1 + 40), v3);
}

- (ASDRequestObserver)observer
{
  return (ASDRequestObserver *)objc_loadWeakRetained((id *)&self->_observer);
}

- (void)setObserver:(id)a3
{
  objc_storeWeak((id *)&self->_observer, a3);
}

@end
