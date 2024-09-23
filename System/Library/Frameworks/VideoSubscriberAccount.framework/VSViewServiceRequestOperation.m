@implementation VSViewServiceRequestOperation

- (VSViewServiceRequestOperation)init
{
  void *v3;
  uint64_t v4;
  void *v5;

  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99778];
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "raise:format:", v4, CFSTR("The %@ initializer is not available."), v5);

  return 0;
}

- (VSViewServiceRequestOperation)initWithViewServiceRequest:(id)a3
{
  id v4;
  VSViewServiceRequestOperation *v5;
  uint64_t v6;
  VSViewServiceRequest *viewServiceRequest;
  uint64_t v8;
  NSUUID *requestID;
  VSOptional *v10;
  VSOptional *v11;
  objc_super v13;

  v4 = a3;
  if (!v4)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("The viewServiceRequest parameter must not be nil."));
  v13.receiver = self;
  v13.super_class = (Class)VSViewServiceRequestOperation;
  v5 = -[VSViewServiceRequestOperation init](&v13, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    viewServiceRequest = v5->_viewServiceRequest;
    v5->_viewServiceRequest = (VSViewServiceRequest *)v6;

    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v8 = objc_claimAutoreleasedReturnValue();
    requestID = v5->_requestID;
    v5->_requestID = (NSUUID *)v8;

    v10 = objc_alloc_init(VSOptional);
    v11 = v5->_result;
    v5->_result = v10;

  }
  return v5;
}

- (void)_presentViewController
{
  void *v3;
  NSObject *v4;
  void *v5;
  NSObject *v6;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  VSRequireMainThread();
  -[VSViewServiceRequestOperation viewServiceHostViewController](self, "viewServiceHostViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  VSDefaultLogObject();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 138412290;
    v8 = v3;
    _os_log_impl(&dword_1D2419000, v4, OS_LOG_TYPE_DEFAULT, "Will present view controller: %@", (uint8_t *)&v7, 0xCu);
  }

  -[VSViewServiceRequestOperation delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "viewServiceRequestOperation:presentViewController:", self, v3);

  VSDefaultLogObject();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 138412290;
    v8 = v3;
    _os_log_impl(&dword_1D2419000, v6, OS_LOG_TYPE_DEFAULT, "Did present view controller: %@", (uint8_t *)&v7, 0xCu);
  }

}

- (void)_dismissViewController
{
  void *v3;
  NSObject *v4;
  void *v5;
  NSObject *v6;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  VSRequireMainThread();
  -[VSViewServiceRequestOperation viewServiceHostViewController](self, "viewServiceHostViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  VSDefaultLogObject();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 138412290;
    v8 = v3;
    _os_log_impl(&dword_1D2419000, v4, OS_LOG_TYPE_DEFAULT, "Will dismiss view controller: %@", (uint8_t *)&v7, 0xCu);
  }

  -[VSViewServiceRequestOperation delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "viewServiceRequestOperation:dismissViewController:", self, v3);

  VSDefaultLogObject();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 138412290;
    v8 = v3;
    _os_log_impl(&dword_1D2419000, v6, OS_LOG_TYPE_DEFAULT, "Did dismiss view controller: %@", (uint8_t *)&v7, 0xCu);
  }

}

- (void)_dismissViewControllerIfRequired
{
  NSObject *v3;
  uint8_t v4[16];

  if (self->_isPresentingViewController)
  {
    -[VSViewServiceRequestOperation _dismissViewController](self, "_dismissViewController");
    self->_isPresentingViewController = 0;
  }
  else
  {
    VSDefaultLogObject();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v4 = 0;
      _os_log_impl(&dword_1D2419000, v3, OS_LOG_TYPE_DEFAULT, "No view controller to dismiss.", v4, 2u);
    }

  }
}

- (void)presentViewServiceHostViewController:(id)a3
{
  VSRequireMainThread();
  self->_isPresentingViewController = 1;
  -[VSViewServiceRequestOperation _presentViewController](self, "_presentViewController");
}

- (void)dismissViewServiceHostViewController:(id)a3
{
  VSRequireMainThread();
  -[VSViewServiceRequestOperation _dismissViewControllerIfRequired](self, "_dismissViewControllerIfRequired");
}

- (void)viewServiceHostViewController:(id)a3 request:(id)a4 didFinishWithResponse:(id)a5
{
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v6 = a5;
  VSDefaultLogObject();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v11 = 138412290;
    v12 = v6;
    _os_log_impl(&dword_1D2419000, v7, OS_LOG_TYPE_DEFAULT, "View service returned response: %@.", (uint8_t *)&v11, 0xCu);
  }

  VSRequireMainThread();
  -[VSViewServiceRequestOperation _dismissViewControllerIfRequired](self, "_dismissViewControllerIfRequired");
  v8 = (void *)objc_msgSend(v6, "copy");
  +[VSFailable failableWithObject:](VSFailable, "failableWithObject:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[VSOptional optionalWithObject:](VSOptional, "optionalWithObject:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[VSViewServiceRequestOperation setResult:](self, "setResult:", v10);

  -[VSViewServiceRequestOperation finishExecutionIfPossible](self, "finishExecutionIfPossible");
}

- (void)viewServiceHostViewController:(id)a3 request:(id)a4 didFailWithError:(id)a5
{
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;

  v6 = a5;
  VSErrorLogObject();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    -[VSViewServiceRequestOperation viewServiceHostViewController:request:didFailWithError:].cold.1((uint64_t)v6, v7);

  VSRequireMainThread();
  -[VSViewServiceRequestOperation _dismissViewControllerIfRequired](self, "_dismissViewControllerIfRequired");
  +[VSFailable failableWithError:](VSFailable, "failableWithError:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[VSOptional optionalWithObject:](VSOptional, "optionalWithObject:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[VSViewServiceRequestOperation setResult:](self, "setResult:", v9);

  -[VSViewServiceRequestOperation finishExecutionIfPossible](self, "finishExecutionIfPossible");
}

- (void)viewServiceHostViewController:(id)a3 didChooseAdditionalProvidersForRequest:(id)a4
{
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  uint8_t v9[16];

  VSDefaultLogObject();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v9 = 0;
    _os_log_impl(&dword_1D2419000, v5, OS_LOG_TYPE_DEFAULT, "View service chose additional providers.", v9, 2u);
  }

  VSRequireMainThread();
  -[VSViewServiceRequestOperation _dismissViewControllerIfRequired](self, "_dismissViewControllerIfRequired");
  VSPublicUnsupportedProviderError(0, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[VSFailable failableWithError:](VSFailable, "failableWithError:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[VSOptional optionalWithObject:](VSOptional, "optionalWithObject:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[VSViewServiceRequestOperation setResult:](self, "setResult:", v8);

  -[VSViewServiceRequestOperation finishExecutionIfPossible](self, "finishExecutionIfPossible");
}

- (void)viewServiceHostViewController:(id)a3 didCancelRequest:(id)a4
{
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  uint8_t v9[16];

  VSDefaultLogObject();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v9 = 0;
    _os_log_impl(&dword_1D2419000, v5, OS_LOG_TYPE_DEFAULT, "View service cancelled.", v9, 2u);
  }

  VSRequireMainThread();
  -[VSViewServiceRequestOperation _dismissViewControllerIfRequired](self, "_dismissViewControllerIfRequired");
  VSPublicError(0, 2, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[VSFailable failableWithError:](VSFailable, "failableWithError:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[VSOptional optionalWithObject:](VSOptional, "optionalWithObject:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[VSViewServiceRequestOperation setResult:](self, "setResult:", v8);

  -[VSViewServiceRequestOperation finishExecutionIfPossible](self, "finishExecutionIfPossible");
}

- (BOOL)viewServiceHostViewController:(id)a3 shouldAuthenticateAccountProviderWithIdentifier:(id)a4
{
  id v5;
  void *v6;

  v5 = a4;
  VSRequireMainThread();
  -[VSViewServiceRequestOperation delegate](self, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = objc_msgSend(v6, "viewServiceRequestOperation:shouldAuthenticateAccountProviderWithIdentifier:", self, v5);

  return (char)self;
}

- (void)executionDidBegin
{
  int v3;
  id v4;
  void *v5;
  Class v6;
  id v7;
  void *v8;
  void *v9;
  _QWORD v10[6];
  id v11;

  v11 = 0;
  v3 = VSLoadInterfaceFramework((uint64_t)&v11);
  v4 = v11;
  v5 = v4;
  if (v3)
  {
    v6 = NSClassFromString((NSString *)CFSTR("VSViewServiceHostViewController"));
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __50__VSViewServiceRequestOperation_executionDidBegin__block_invoke;
    v10[3] = &unk_1E939FBB0;
    v10[4] = self;
    v10[5] = v6;
    VSPerformBlockOnMainThread(v10);
  }
  else
  {
    if (!v4)
      objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("The errorOrNil parameter must not be nil."));
    v7 = v5;
    +[VSFailable failableWithError:](VSFailable, "failableWithError:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    +[VSOptional optionalWithObject:](VSOptional, "optionalWithObject:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[VSViewServiceRequestOperation setResult:](self, "setResult:", v9);

    -[VSViewServiceRequestOperation finishExecutionIfPossible](self, "finishExecutionIfPossible");
  }

}

void __50__VSViewServiceRequestOperation_executionDidBegin__block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "viewServiceRequest");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "viewServiceHostViewController");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  if (!v2)
  {
    v2 = objc_alloc_init(*(Class *)(a1 + 40));
    objc_msgSend(*(id *)(a1 + 32), "setViewServiceHostViewController:", v2);
  }
  objc_msgSend(v2, "setDelegate:", *(_QWORD *)(a1 + 32));
  objc_msgSend(*(id *)(a1 + 32), "requestID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "enqueueViewServiceRequest:withIdentifier:", v4, v3);

}

- (void)finishExecutionIfPossible
{
  _QWORD v3[5];
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)VSViewServiceRequestOperation;
  -[VSAsyncOperation finishExecutionIfPossible](&v4, sel_finishExecutionIfPossible);
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __58__VSViewServiceRequestOperation_finishExecutionIfPossible__block_invoke;
  v3[3] = &unk_1E939EE88;
  v3[4] = self;
  VSPerformBlockOnMainThread(v3);
}

uint64_t __58__VSViewServiceRequestOperation_finishExecutionIfPossible__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setViewServiceHostViewController:", 0);
}

- (void)cancel
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)VSViewServiceRequestOperation;
  -[VSAsyncOperation cancel](&v6, sel_cancel);
  -[VSViewServiceRequestOperation _dismissViewControllerIfRequired](self, "_dismissViewControllerIfRequired");
  VSPublicError(0, 2, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[VSFailable failableWithError:](VSFailable, "failableWithError:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[VSOptional optionalWithObject:](VSOptional, "optionalWithObject:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[VSViewServiceRequestOperation setResult:](self, "setResult:", v5);

  -[VSViewServiceRequestOperation finishExecutionIfPossible](self, "finishExecutionIfPossible");
}

- (VSViewServiceRequest)viewServiceRequest
{
  return self->_viewServiceRequest;
}

- (VSViewServiceRequestOperationDelegate)delegate
{
  return (VSViewServiceRequestOperationDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (VSOptional)result
{
  return self->_result;
}

- (void)setResult:(id)a3
{
  objc_storeStrong((id *)&self->_result, a3);
}

- (VSViewServiceHostViewController)viewServiceHostViewController
{
  return self->_viewServiceHostViewController;
}

- (void)setViewServiceHostViewController:(id)a3
{
  objc_storeStrong((id *)&self->_viewServiceHostViewController, a3);
}

- (NSUUID)requestID
{
  return self->_requestID;
}

- (void)setRequestID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 296);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requestID, 0);
  objc_storeStrong((id *)&self->_viewServiceHostViewController, 0);
  objc_storeStrong((id *)&self->_result, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_viewServiceRequest, 0);
}

- (void)viewServiceHostViewController:(uint64_t)a1 request:(NSObject *)a2 didFailWithError:.cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_1D2419000, a2, OS_LOG_TYPE_ERROR, "View service failed: %@", (uint8_t *)&v2, 0xCu);
}

@end
