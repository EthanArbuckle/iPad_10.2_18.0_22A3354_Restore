@implementation INHandleIntentForwardingAction

- (BOOL)executeRemotelyWithVendorRemote:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  objc_super v11;

  v6 = a3;
  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)INHandleIntentForwardingAction;
  if (!-[INIntentForwardingAction executeRemotelyWithVendorRemote:completionHandler:](&v11, sel_executeRemotelyWithVendorRemote_completionHandler_, v6, v7))
  {
    -[INIntentForwardingAction intent](self, "intent");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[INHandleIntentForwardingAction _completionHandlerWithActionCompletionHandler:](self, "_completionHandlerWithActionCompletionHandler:", v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleIntent:withCompletion:", v8, v9);

  }
  return 1;
}

- (void)executeLocallyWithIntentDeliverer:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;

  v6 = a4;
  v7 = a3;
  -[INIntentForwardingAction intent](self, "intent");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  -[INHandleIntentForwardingAction _completionHandlerWithActionCompletionHandler:](self, "_completionHandlerWithActionCompletionHandler:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "handleIntent:withCompletion:", v9, v8);
}

- (id)_completionHandlerWithActionCompletionHandler:(id)a3
{
  id v3;
  id v4;
  void *v5;
  _QWORD v7[4];
  id v8;

  v3 = a3;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __80__INHandleIntentForwardingAction__completionHandlerWithActionCompletionHandler___block_invoke;
  v7[3] = &unk_1E2293C78;
  v8 = v3;
  v4 = v3;
  v5 = (void *)MEMORY[0x18D7812C4](v7);

  return v5;
}

void __80__INHandleIntentForwardingAction__completionHandlerWithActionCompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9;
  id v10;
  id v11;
  id v12;
  INHandleIntentForwardingActionResponse *v13;

  v9 = a5;
  v10 = a4;
  v11 = a3;
  v12 = a2;
  v13 = -[INHandleIntentForwardingActionResponse initWithIntentResponse:launchContextActivityData:cacheItems:error:]([INHandleIntentForwardingActionResponse alloc], "initWithIntentResponse:launchContextActivityData:cacheItems:error:", v12, v11, v10, v9);

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

+ (Class)responseClass
{
  return (Class)objc_opt_class();
}

@end
