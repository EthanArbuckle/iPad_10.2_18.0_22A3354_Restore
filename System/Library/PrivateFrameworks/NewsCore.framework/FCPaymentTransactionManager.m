@implementation FCPaymentTransactionManager

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->delegate, a3);
}

- (FCPaymentTransactionManager)init
{
  FCPaymentTransactionManager *v2;
  FCPaymentTransactionObserver *v3;
  FCPaymentTransactionObserver *paymentTransactionObserver;
  uint64_t v5;
  NSMutableDictionary *paymentQueueByProductID;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)FCPaymentTransactionManager;
  v2 = -[FCPaymentTransactionManager init](&v8, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(FCPaymentTransactionObserver);
    paymentTransactionObserver = v2->_paymentTransactionObserver;
    v2->_paymentTransactionObserver = v3;

    -[FCPaymentTransactionObserver setDelegate:](v2->_paymentTransactionObserver, "setDelegate:", v2);
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v5 = objc_claimAutoreleasedReturnValue();
    paymentQueueByProductID = v2->_paymentQueueByProductID;
    v2->_paymentQueueByProductID = (NSMutableDictionary *)v5;

  }
  return v2;
}

- (BOOL)canMakePayments
{
  return objc_msgSend(getSKPaymentQueueClass(), "canMakePayments");
}

- (void)registerOngoingPurchaseTransactionsWithEntry:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v4 = a3;
  objc_msgSend(v4, "productID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "purchaseID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bundleID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v4, "webAccessOptIn");
  objc_msgSend(v4, "appAdamID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "storeExternalVersion");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[FCPaymentTransactionManager createPaymentQueueWithProductID:purchaseID:bundleID:webAccessOptIn:appAdamID:storeExternalVersion:](self, "createPaymentQueueWithProductID:purchaseID:bundleID:webAccessOptIn:appAdamID:storeExternalVersion:", v5, v6, v7, v8, v9, v10);
  v14 = (id)objc_claimAutoreleasedReturnValue();

  -[FCPaymentTransactionManager paymentTransactionObserver](self, "paymentTransactionObserver");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "addTransactionObserver:", v11);

  -[FCPaymentTransactionManager paymentQueueByProductID](self, "paymentQueueByProductID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "productID");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "setObject:forKey:", v14, v13);
}

- (void)startPurchaseWithTagID:(id)a3 productID:(id)a4 purchaseID:(id)a5 bundleID:(id)a6 appAdamID:(id)a7 storeExternalVersion:(id)a8 price:(id)a9 webAccessOptIn:(BOOL)a10 payment:(id)a11
{
  __CFString *v16;
  void *v17;
  __CFString *v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  _QWORD v32[2];
  _QWORD v33[3];

  v33[2] = *MEMORY[0x1E0C80C00];
  if (a10)
    v16 = CFSTR("true");
  else
    v16 = CFSTR("false");
  v32[0] = CFSTR("hasWebOptIn");
  v32[1] = CFSTR("mtApp");
  v33[0] = v16;
  v17 = (void *)MEMORY[0x1E0CB34D0];
  v18 = v16;
  v19 = a11;
  v20 = a8;
  v21 = a7;
  v22 = a6;
  v23 = a5;
  v24 = a4;
  objc_msgSend(v17, "mainBundle");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "bundleIdentifier");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v33[1] = v26;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v33, v32, 2);
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v19, "setRequestParameters:", v27);
  -[FCPaymentTransactionManager createPaymentQueueWithProductID:purchaseID:bundleID:webAccessOptIn:appAdamID:storeExternalVersion:](self, "createPaymentQueueWithProductID:purchaseID:bundleID:webAccessOptIn:appAdamID:storeExternalVersion:", v24, v23, v22, a10, v21, v20);
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  -[FCPaymentTransactionManager paymentTransactionObserver](self, "paymentTransactionObserver");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "addTransactionObserver:", v29);

  objc_msgSend(v28, "addPayment:", v19);
  -[FCPaymentTransactionManager paymentQueueByProductID](self, "paymentQueueByProductID");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "setObject:forKey:", v28, v24);

}

- (id)createPaymentQueueWithProductID:(id)a3 purchaseID:(id)a4 bundleID:(id)a5 webAccessOptIn:(BOOL)a6 appAdamID:(id)a7 storeExternalVersion:(id)a8
{
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  objc_class *v22;
  id v23;
  void *v24;
  void *v25;
  _QWORD v27[5];
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t v31;

  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a7;
  v17 = a8;
  -[FCPaymentTransactionManager paymentQueueByProductID](self, "paymentQueueByProductID");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "objectForKey:", v13);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v19)
  {
    FCDeviceIdentifierForVendor();
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = 0;
    v29 = &v28;
    v30 = 0x2050000000;
    v21 = (void *)getSKPaymentQueueClientClass_softClass;
    v31 = getSKPaymentQueueClientClass_softClass;
    if (!getSKPaymentQueueClientClass_softClass)
    {
      v27[0] = MEMORY[0x1E0C809B0];
      v27[1] = 3221225472;
      v27[2] = __getSKPaymentQueueClientClass_block_invoke;
      v27[3] = &unk_1E46406D0;
      v27[4] = &v28;
      __getSKPaymentQueueClientClass_block_invoke((uint64_t)v27);
      v21 = (void *)v29[3];
    }
    v22 = objc_retainAutorelease(v21);
    _Block_object_dispose(&v28, 8);
    v23 = objc_alloc_init(v22);
    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "bundleIdentifier");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setBundleIdentifier:", v25);

    objc_msgSend(v23, "setBundleVersion:", CFSTR("1.0"));
    objc_msgSend(v23, "setStoreItemIdentifier:", v16);
    objc_msgSend(v23, "setStoreExternalVersion:", v17);
    objc_msgSend(v23, "setVendorIdentifier:", v20);
    v19 = (void *)objc_msgSend(objc_alloc((Class)getSKPaymentQueueClass()), "initWithPaymentQueueClient:", v23);

  }
  return v19;
}

- (void)paymentTransactionObserver:(id)a3 didFailPurchaseTransactionWithTransaction:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  uint64_t v25;
  const __CFString *v26;
  uint8_t buf[4];
  const char *v28;
  __int16 v29;
  char *v30;
  __int16 v31;
  _QWORD v32[3];

  v32[2] = *MEMORY[0x1E0C80C00];
  v5 = a4;
  objc_msgSend(v5, "payment");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "productIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("invalid nil value for '%s'"), "transaction.payment.productIdentifier");
    *(_DWORD *)buf = 136315906;
    v28 = "-[FCPaymentTransactionManager paymentTransactionObserver:didFailPurchaseTransactionWithTransaction:]";
    v29 = 2080;
    v30 = "FCPaymentTransactionManager.m";
    v31 = 1024;
    LODWORD(v32[0]) = 151;
    WORD2(v32[0]) = 2114;
    *(_QWORD *)((char *)v32 + 6) = v23;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  objc_msgSend(v5, "error");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v24 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("invalid nil value for '%s'"), "transaction.error");
    *(_DWORD *)buf = 136315906;
    v28 = "-[FCPaymentTransactionManager paymentTransactionObserver:didFailPurchaseTransactionWithTransaction:]";
    v29 = 2080;
    v30 = "FCPaymentTransactionManager.m";
    v31 = 1024;
    LODWORD(v32[0]) = 152;
    WORD2(v32[0]) = 2114;
    *(_QWORD *)((char *)v32 + 6) = v24;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  objc_msgSend(v5, "payment");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "productIdentifier");
  v10 = (char *)objc_claimAutoreleasedReturnValue();

  v11 = objc_msgSend(v5, "transactionState");
  objc_msgSend(v5, "error");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v12)
  {
    v14 = v12;
  }
  else
  {
    v15 = (void *)MEMORY[0x1E0CB35C8];
    v16 = FCPurchaseTransactionGenericErrorCode;
    v25 = *MEMORY[0x1E0CB2D50];
    v26 = CFSTR("The transaction returned with no error");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v26, &v25, 1);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "errorWithDomain:code:userInfo:", CFSTR("com.apple.news.purchase"), v16, v17);
    v14 = (id)objc_claimAutoreleasedReturnValue();

  }
  v18 = (void *)FCPurchaseLog;
  if (os_log_type_enabled((os_log_t)FCPurchaseLog, OS_LOG_TYPE_ERROR))
  {
    v21 = v18;
    v22 = objc_opt_class();
    *(_DWORD *)buf = 138543874;
    v28 = (const char *)v22;
    v29 = 2114;
    v30 = v10;
    v31 = 2114;
    v32[0] = v14;
    _os_log_error_impl(&dword_1A1B90000, v21, OS_LOG_TYPE_ERROR, "%{public}@ didFailPurchaseTransaction with productID: %{public}@ failed with error: %{public}@", buf, 0x20u);

  }
  if ((unint64_t)(v11 - 1) >= 4)
    v11 = 0;
  -[FCPaymentTransactionManager paymentQueueByProductID](self, "paymentQueueByProductID");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "removeObjectForKey:", v10);

  -[FCPaymentTransactionManager delegate](self, "delegate");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "transactionFailedWithProductID:transactionState:transactionError:", v10, v11, v14);

}

- (void)paymentTransactionObserver:(id)a3 didFinishPurchaseTransaction:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  uint64_t v11;
  void *v12;
  char *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  FCPaymentTransactionAuthorizationResponse *v20;
  void *v21;
  void *v22;
  FCPaymentTransactionAuthorizationResponse *v23;
  void *v24;
  id v25;
  void *v26;
  id v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  FCPaymentTransactionManager *v33;
  void *v34;
  FCAuthKitAuthorizationCredential *v35;
  FCCompletedPaymentTransaction *v36;
  void *v37;
  void *v38;
  FCCompletedPaymentTransaction *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  FCAuthKitAuthorizationCredential *v44;
  void *v45;
  void *v46;
  id v47;
  uint8_t buf[4];
  const char *v49;
  __int16 v50;
  char *v51;
  __int16 v52;
  int v53;
  __int16 v54;
  void *v55;
  uint64_t v56;

  v56 = *MEMORY[0x1E0C80C00];
  v47 = a3;
  v6 = a4;
  if (!v6 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v41 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("invalid nil value for '%s'"), "transaction");
    *(_DWORD *)buf = 136315906;
    v49 = "-[FCPaymentTransactionManager paymentTransactionObserver:didFinishPurchaseTransaction:]";
    v50 = 2080;
    v51 = "FCPaymentTransactionManager.m";
    v52 = 1024;
    v53 = 173;
    v54 = 2114;
    v55 = v41;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  objc_msgSend(v6, "payment");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "productIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v42 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("invalid nil value for '%s'"), "transaction.payment.productIdentifier");
    *(_DWORD *)buf = 136315906;
    v49 = "-[FCPaymentTransactionManager paymentTransactionObserver:didFinishPurchaseTransaction:]";
    v50 = 2080;
    v51 = "FCPaymentTransactionManager.m";
    v52 = 1024;
    v53 = 174;
    v54 = 2114;
    v55 = v42;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  v9 = (void *)FCPurchaseLog;
  if (os_log_type_enabled((os_log_t)FCPurchaseLog, OS_LOG_TYPE_DEFAULT))
  {
    v10 = v9;
    v11 = objc_opt_class();
    objc_msgSend(v6, "payment");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "productIdentifier");
    v13 = (char *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v49 = (const char *)v11;
    v50 = 2114;
    v51 = v13;
    _os_log_impl(&dword_1A1B90000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@ didFinishPurchaseTransaction with productID: %{public}@", buf, 0x16u);

  }
  -[FCPaymentTransactionManager paymentQueueByProductID](self, "paymentQueueByProductID");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "payment");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "productIdentifier");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "removeObjectForKey:", v16);

  objc_msgSend(v6, "appleIDAccountDetails");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17)
  {
    objc_msgSend(v6, "appleIDAccountDetails");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "accountSignupError");
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    if (v19)
    {
      v20 = [FCPaymentTransactionAuthorizationResponse alloc];
      objc_msgSend(v6, "appleIDAccountDetails");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "accountSignupError");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = -[FCPaymentTransactionAuthorizationResponse initWithCredential:accountSignupError:](v20, "initWithCredential:accountSignupError:", 0, v22);
    }
    else
    {
      objc_msgSend(v6, "appleIDAccountDetails");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "authorizationAppleIDCredential");
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      v25 = objc_alloc(MEMORY[0x1E0CB3940]);
      objc_msgSend(v21, "authorizationCode");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = (void *)objc_msgSend(v25, "initWithData:encoding:", v26, 4);

      v27 = objc_alloc(MEMORY[0x1E0CB3940]);
      objc_msgSend(v21, "identityToken");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v46 = (void *)objc_msgSend(v27, "initWithData:encoding:", v28, 4);

      v44 = [FCAuthKitAuthorizationCredential alloc];
      objc_msgSend(v21, "userIdentifier");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "userInformation");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v45, "selectedEmail");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "userInformation");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "familyName");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "userInformation");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "givenName");
      v33 = self;
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = -[FCAuthKitAuthorizationCredential initWithAuthorizationCode:identityToken:userIdentifier:email:familyName:givenName:](v44, "initWithAuthorizationCode:identityToken:userIdentifier:email:familyName:givenName:", v22, v46, v43, v29, v31, v34);

      self = v33;
      v23 = -[FCPaymentTransactionAuthorizationResponse initWithCredential:accountSignupError:]([FCPaymentTransactionAuthorizationResponse alloc], "initWithCredential:accountSignupError:", v35, 0);

    }
  }
  else
  {
    v23 = 0;
  }
  v36 = [FCCompletedPaymentTransaction alloc];
  objc_msgSend(v6, "payment");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "productIdentifier");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = -[FCCompletedPaymentTransaction initWithProductID:receipt:appleIDAccountDetails:](v36, "initWithProductID:receipt:appleIDAccountDetails:", v38, 0, v23);

  -[FCPaymentTransactionManager delegate](self, "delegate");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "transactionPurchased:", v39);

}

- (FCPaymentTransactionManagerDelegate)delegate
{
  return (FCPaymentTransactionManagerDelegate *)objc_loadWeakRetained((id *)&self->delegate);
}

- (FCPaymentTransactionObserver)paymentTransactionObserver
{
  return self->_paymentTransactionObserver;
}

- (void)setPaymentTransactionObserver:(id)a3
{
  objc_storeStrong((id *)&self->_paymentTransactionObserver, a3);
}

- (NSMutableDictionary)paymentQueueByProductID
{
  return self->_paymentQueueByProductID;
}

- (void)setPaymentQueueByProductID:(id)a3
{
  objc_storeStrong((id *)&self->_paymentQueueByProductID, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_paymentQueueByProductID, 0);
  objc_storeStrong((id *)&self->_paymentTransactionObserver, 0);
  objc_destroyWeak((id *)&self->delegate);
}

@end
