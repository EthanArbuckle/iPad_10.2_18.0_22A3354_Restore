@implementation INStopSendingUpdatesForwardingAction

- (BOOL)executeRemotelyWithVendorRemote:(id)a3 completionHandler:(id)a4
{
  id v6;
  void (**v7)(id, INIntentForwardingActionResponse *);
  void *v8;
  INIntentForwardingActionResponse *v9;
  BOOL v10;
  NSObject *v11;
  objc_super v13;
  uint8_t buf[4];
  const char *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void (**)(id, INIntentForwardingActionResponse *))a4;
  v13.receiver = self;
  v13.super_class = (Class)INStopSendingUpdatesForwardingAction;
  if (-[INIntentForwardingAction executeRemotelyWithVendorRemote:completionHandler:](&v13, sel_executeRemotelyWithVendorRemote_completionHandler_, v6, v7))
  {
    goto LABEL_4;
  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[INIntentForwardingAction intent](self, "intent");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stopSendingUpdatesForIntent:", v8);

    v9 = -[INIntentForwardingActionResponse initWithError:]([INIntentForwardingActionResponse alloc], "initWithError:", 0);
    v7[2](v7, v9);

LABEL_4:
    v10 = 1;
    goto LABEL_8;
  }
  v11 = INSiriLogContextIntents;
  if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315138;
    v15 = "-[INStopSendingUpdatesForwardingAction executeRemotelyWithVendorRemote:completionHandler:]";
    _os_log_error_impl(&dword_18BEBC000, v11, OS_LOG_TYPE_ERROR, "%s The extension context doesn't implement stopSendingUpdatesForIntent:", buf, 0xCu);
  }
  v10 = 0;
LABEL_8:

  return v10;
}

- (void)executeLocallyWithIntentDeliverer:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;

  v6 = a4;
  v7 = a3;
  -[INIntentForwardingAction intent](self, "intent");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __92__INStopSendingUpdatesForwardingAction_executeLocallyWithIntentDeliverer_completionHandler___block_invoke;
  v10[3] = &unk_1E22900A8;
  v11 = v6;
  v9 = v6;
  objc_msgSend(v7, "stopSendingUpdatesForIntent:completionHandler:", v8, v10);

}

void __92__INStopSendingUpdatesForwardingAction_executeLocallyWithIntentDeliverer_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v1;
  INIntentForwardingActionResponse *v2;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = -[INIntentForwardingActionResponse initWithError:]([INIntentForwardingActionResponse alloc], "initWithError:", 0);
  (*(void (**)(uint64_t, INIntentForwardingActionResponse *))(v1 + 16))(v1, v2);

}

+ (Class)responseClass
{
  return (Class)objc_opt_class();
}

@end
