@implementation FCPurchaseIntegrityChecker

- (void)isUserEntitledToSubscriptionForPurchaseID:(id)a3 completion:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;

  v5 = a3;
  v6 = a4;
  objc_msgSend(MEMORY[0x1E0CF9DD0], "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __83__FCPurchaseIntegrityChecker_isUserEntitledToSubscriptionForPurchaseID_completion___block_invoke;
  v10[3] = &unk_1E4649470;
  v11 = v5;
  v12 = v6;
  v8 = v6;
  v9 = v5;
  objc_msgSend(v7, "getSubscriptionEntitlementsForSegment:ignoreCaches:withResultHandler:", 0, 1, v10);

}

void __83__FCPurchaseIntegrityChecker_isUserEntitledToSubscriptionForPurchaseID_completion___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6;
  id v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD v11[4];
  id v12;
  __int128 *p_buf;
  __int128 buf;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v6 = a2;
  v7 = a4;
  v8 = FCPurchaseLog;
  if (v7)
  {
    if (os_log_type_enabled((os_log_t)FCPurchaseLog, OS_LOG_TYPE_ERROR))
    {
      LODWORD(buf) = 138543362;
      *(_QWORD *)((char *)&buf + 4) = v7;
      _os_log_error_impl(&dword_1A1B90000, v8, OS_LOG_TYPE_ERROR, "isUserEntitledToSubscriptionForPurchaseID: error:%{public}@", (uint8_t *)&buf, 0xCu);
    }
    v9 = *(_QWORD *)(a1 + 40);
    if (v9)
      (*(void (**)(uint64_t, _QWORD))(v9 + 16))(v9, 0);
  }
  else
  {
    if (os_log_type_enabled((os_log_t)FCPurchaseLog, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf) = 138543362;
      *(_QWORD *)((char *)&buf + 4) = v6;
      _os_log_impl(&dword_1A1B90000, v8, OS_LOG_TYPE_DEFAULT, "isUserEntitledToSubscriptionForPurchaseID: subscriptions: %{public}@", (uint8_t *)&buf, 0xCu);
    }
    *(_QWORD *)&buf = 0;
    *((_QWORD *)&buf + 1) = &buf;
    v15 = 0x3032000000;
    v16 = __Block_byref_object_copy__69;
    v17 = __Block_byref_object_dispose__69;
    v18 = 0;
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __83__FCPurchaseIntegrityChecker_isUserEntitledToSubscriptionForPurchaseID_completion___block_invoke_1;
    v11[3] = &unk_1E4649448;
    v12 = *(id *)(a1 + 32);
    p_buf = &buf;
    objc_msgSend(v6, "enumerateObjectsUsingBlock:", v11);
    v10 = *(_QWORD *)(a1 + 40);
    if (v10)
      (*(void (**)(uint64_t, _QWORD))(v10 + 16))(v10, *(_QWORD *)(*((_QWORD *)&buf + 1) + 40));

    _Block_object_dispose(&buf, 8);
  }

}

void __83__FCPurchaseIntegrityChecker_isUserEntitledToSubscriptionForPurchaseID_completion___block_invoke_1(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  FCSubscriptionEntitlement *v15;
  uint64_t v16;
  void *v17;
  int v18;
  void *v19;
  __int16 v20;
  uint64_t v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v6 = a2;
  objc_msgSend(v6, "inAppAdamID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringValue");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isEqualToString:", *(_QWORD *)(a1 + 32));

  if (v9)
  {
    v10 = (void *)FCPurchaseLog;
    if (os_log_type_enabled((os_log_t)FCPurchaseLog, OS_LOG_TYPE_DEFAULT))
    {
      v11 = v10;
      objc_msgSend(v6, "inAppAdamID");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "stringValue");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = *(_QWORD *)(a1 + 32);
      v18 = 138543618;
      v19 = v13;
      v20 = 2114;
      v21 = v14;
      _os_log_impl(&dword_1A1B90000, v11, OS_LOG_TYPE_DEFAULT, "isUserEntitledToSubscriptionForPurchaseID: subscriptionEntitlement: %{public}@ matched with purchaseID: %{public}@", (uint8_t *)&v18, 0x16u);

    }
    v15 = -[FCSubscriptionEntitlement initWithASDEntitlement:]([FCSubscriptionEntitlement alloc], "initWithASDEntitlement:", v6);
    v16 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v17 = *(void **)(v16 + 40);
    *(_QWORD *)(v16 + 40) = v15;

    *a4 = 1;
  }

}

@end
