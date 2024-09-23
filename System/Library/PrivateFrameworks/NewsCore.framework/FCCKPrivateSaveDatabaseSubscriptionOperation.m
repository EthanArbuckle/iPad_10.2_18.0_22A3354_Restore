@implementation FCCKPrivateSaveDatabaseSubscriptionOperation

- (BOOL)validateOperation
{
  BOOL v3;
  void *v4;
  void *v6;
  objc_super v7;
  uint8_t buf[4];
  const char *v9;
  __int16 v10;
  char *v11;
  __int16 v12;
  int v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v7.receiver = self;
  v7.super_class = (Class)FCCKPrivateSaveDatabaseSubscriptionOperation;
  v3 = -[FCCKPrivateDatabaseOperation validateOperation](&v7, sel_validateOperation);
  -[FCCKPrivateSaveDatabaseSubscriptionOperation subscriptionID](self, "subscriptionID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("can't save database subscriptions without a subscription ID"));
    *(_DWORD *)buf = 136315906;
    v9 = "-[FCCKPrivateSaveDatabaseSubscriptionOperation validateOperation]";
    v10 = 2080;
    v11 = "FCCKPrivateSaveDatabaseSubscriptionOperation.m";
    v12 = 1024;
    v13 = 20;
    v14 = 2114;
    v15 = v6;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  return v4 && v3;
}

- (void)performOperation
{
  FCCKPrivateDatabaseCKOperationResults *v3;
  char v4;
  void *v5;
  uint64_t v6;
  FCCKPrivateDatabaseCKOperationResults *v7;
  _QWORD v8[5];
  _QWORD v9[4];
  FCCKPrivateDatabaseCKOperationResults *v10;
  FCCKPrivateSaveDatabaseSubscriptionOperation *v11;

  v3 = objc_alloc_init(FCCKPrivateDatabaseCKOperationResults);
  v4 = -[FCCKPrivateDatabaseOperation skipPreflight](self, "skipPreflight");
  -[FCCKPrivateDatabaseOperation database](self, "database");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = MEMORY[0x1E0C809B0];
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __64__FCCKPrivateSaveDatabaseSubscriptionOperation_performOperation__block_invoke;
  v9[3] = &unk_1E463B3E0;
  v10 = v3;
  v11 = self;
  v7 = v3;
  -[FCCKPrivateDatabase enumerateActiveDestinationsWithOptions:handler:]((uint64_t)v5, v4, v9);

  v8[0] = v6;
  v8[1] = 3221225472;
  v8[2] = __64__FCCKPrivateSaveDatabaseSubscriptionOperation_performOperation__block_invoke_4;
  v8[3] = &unk_1E463B408;
  v8[4] = self;
  -[FCCKPrivateDatabaseCKOperationResults notifyWhenFinishWithQoS:completionHandler:](v7, "notifyWhenFinishWithQoS:completionHandler:", -[FCCKPrivateSaveDatabaseSubscriptionOperation qualityOfService](self, "qualityOfService"), v8);

}

void __64__FCCKPrivateSaveDatabaseSubscriptionOperation_performOperation__block_invoke(uint64_t a1, uint64_t a2)
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  int8x16_t v8;
  _QWORD v9[4];
  int8x16_t v10;
  uint64_t v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "operationWillStart");
  v4 = objc_alloc_init(MEMORY[0x1E0C94E60]);
  objc_msgSend(*(id *)(a1 + 40), "subscriptionID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setSubscriptionIDs:", v6);

  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __64__FCCKPrivateSaveDatabaseSubscriptionOperation_performOperation__block_invoke_2;
  v9[3] = &unk_1E463B3B8;
  v8 = *(int8x16_t *)(a1 + 32);
  v7 = (id)v8.i64[0];
  v10 = vextq_s8(v8, v8, 8uLL);
  v11 = a2;
  objc_msgSend(v4, "setFetchSubscriptionCompletionBlock:", v9);
  objc_msgSend(*(id *)(a1 + 40), "runChildCKOperation:destination:", v4, a2);

}

void __64__FCCKPrivateSaveDatabaseSubscriptionOperation_performOperation__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  int v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  id v18;
  uint64_t v19;
  void *v20;
  _QWORD v21[4];
  id v22;
  uint64_t v23;
  void *v24;
  _QWORD v25[2];

  v25[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(a2, "allValues");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "firstObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(v7, "notificationInfo");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "shouldSendContentAvailable");
    objc_msgSend(*(id *)(a1 + 32), "notificationInfo");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "shouldSendContentAvailable");

    if (v9 == v11)
      goto LABEL_5;
  }
  v12 = objc_alloc(MEMORY[0x1E0C94CB8]);
  objc_msgSend(*(id *)(a1 + 32), "subscriptionID");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v12, "initWithSubscriptionID:", v13);

  objc_msgSend(*(id *)(a1 + 32), "notificationInfo");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setNotificationInfo:", v15);

  if (!v14)
  {
LABEL_5:
    v20 = *(void **)(a1 + 40);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", *(_QWORD *)(a1 + 48));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = v14;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v24, 1);
    v16 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "operationDidFinishWithItemIDs:resultItems:error:", v16, 0, v5);
  }
  else
  {
    v16 = objc_alloc_init(MEMORY[0x1E0C94F28]);
    v25[0] = v14;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v25, 1);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setSubscriptionsToSave:", v17);

    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __64__FCCKPrivateSaveDatabaseSubscriptionOperation_performOperation__block_invoke_3;
    v21[3] = &unk_1E463B390;
    v18 = *(id *)(a1 + 40);
    v19 = *(_QWORD *)(a1 + 48);
    v22 = v18;
    v23 = v19;
    objc_msgSend(v16, "setModifySubscriptionsCompletionBlock:", v21);
    objc_msgSend(*(id *)(a1 + 32), "runChildCKOperation:destination:", v16, *(_QWORD *)(a1 + 48));

  }
}

void __64__FCCKPrivateSaveDatabaseSubscriptionOperation_performOperation__block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  void *v4;
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;
  void *v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  v4 = (void *)MEMORY[0x1E0CB37E8];
  v5 = *(void **)(a1 + 32);
  v6 = *(_QWORD *)(a1 + 40);
  v7 = a4;
  objc_msgSend(v4, "numberWithInteger:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "operationDidFinishWithItemIDs:resultItems:error:", v9, 0, v7);

}

uint64_t __64__FCCKPrivateSaveDatabaseSubscriptionOperation_performOperation__block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "finishedPerformingOperationWithError:");
}

- (void)operationWillFinishWithError:(id)a3
{
  void *v4;
  void (**v5)(_QWORD, _QWORD);
  id v6;

  v6 = a3;
  -[FCCKPrivateSaveDatabaseSubscriptionOperation saveDatabaseSubscriptionCompletionBlock](self, "saveDatabaseSubscriptionCompletionBlock");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[FCCKPrivateSaveDatabaseSubscriptionOperation saveDatabaseSubscriptionCompletionBlock](self, "saveDatabaseSubscriptionCompletionBlock");
    v5 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, id))v5)[2](v5, v6);

  }
}

- (NSString)subscriptionID
{
  return self->_subscriptionID;
}

- (void)setSubscriptionID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 384);
}

- (CKNotificationInfo)notificationInfo
{
  return self->_notificationInfo;
}

- (void)setNotificationInfo:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 392);
}

- (id)saveDatabaseSubscriptionCompletionBlock
{
  return self->_saveDatabaseSubscriptionCompletionBlock;
}

- (void)setSaveDatabaseSubscriptionCompletionBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 400);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_saveDatabaseSubscriptionCompletionBlock, 0);
  objc_storeStrong((id *)&self->_notificationInfo, 0);
  objc_storeStrong((id *)&self->_subscriptionID, 0);
}

@end
