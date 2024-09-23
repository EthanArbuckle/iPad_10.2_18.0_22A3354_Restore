@implementation NPKBarcodePaymentSession

- (NPKBarcodePaymentSession)initWithPaymentPass:(id)a3 authorizationCredential:(id)a4
{
  id v7;
  id v8;
  NPKBarcodePaymentSession *v9;
  NSObject *v10;
  _BOOL4 v11;
  NSObject *v12;
  void *v13;
  NSObject *v14;
  dispatch_queue_t v15;
  OS_dispatch_queue *serialQueue;
  objc_super v18;
  uint8_t buf[4];
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  v18.receiver = self;
  v18.super_class = (Class)NPKBarcodePaymentSession;
  v9 = -[NPKBarcodePaymentSession init](&v18, sel_init);
  if (v9)
  {
    pk_Payment_log();
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);

    if (v11)
    {
      pk_Payment_log();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v7, "uniqueID");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v20 = v13;
        _os_log_impl(&dword_213518000, v12, OS_LOG_TYPE_DEFAULT, "Notice: [BarcodePayment] New barcode session created for pass: %@", buf, 0xCu);

      }
    }
    objc_storeStrong((id *)&v9->_paymentPass, a3);
    objc_storeStrong((id *)&v9->_authorizationCredential, a4);
    v9->_currentTransactionStatus = 0;
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = dispatch_queue_create("com.apple.NanoPassKit.BarcodePaymentSession", v14);
    serialQueue = v9->_serialQueue;
    v9->_serialQueue = (OS_dispatch_queue *)v15;

  }
  return v9;
}

- (void)startSession
{
  NSObject *v3;
  _BOOL4 v4;
  NSObject *v5;
  void *v6;
  void *v7;
  int v8;
  NPKBarcodePaymentSession *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  pk_Payment_log();
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);

  if (v4)
  {
    pk_Payment_log();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v8 = 138412290;
      v9 = self;
      _os_log_impl(&dword_213518000, v5, OS_LOG_TYPE_DEFAULT, "Notice: [BarcodePayment] %@ session started!", (uint8_t *)&v8, 0xCu);
    }

  }
  -[NPKBarcodePaymentSession setSessionStarted:](self, "setSessionStarted:", 1);
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE6ED30]), "initWithDelegate:", self);
  -[NPKBarcodePaymentSession setPaymentService:](self, "setPaymentService:", v6);

  -[NPKBarcodePaymentSession _startSessionTimeoutTimer](self, "_startSessionTimeoutTimer");
  -[NPKBarcodePaymentSession _updateCurrentPaymentBarcodeWithBarcodeIdentifier:decryptedBarcodeCredential:error:](self, "_updateCurrentPaymentBarcodeWithBarcodeIdentifier:decryptedBarcodeCredential:error:", 0, 0, 0);
  -[NPKBarcodePaymentSession authorizationCredential](self, "authorizationCredential");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPKBarcodePaymentSession _fetchDecryptedBarcodeWithCredential:](self, "_fetchDecryptedBarcodeWithCredential:", v7);

  -[NPKBarcodePaymentSession _acquireNotificationSuppressionAssertion](self, "_acquireNotificationSuppressionAssertion");
  -[NPKBarcodePaymentSession _acquireExpressTransactionSuppressAssertion](self, "_acquireExpressTransactionSuppressAssertion");
}

- (void)retryFetchingBarcode
{
  NSObject *v3;
  _BOOL4 v4;
  NSObject *v5;
  void *v6;
  int v7;
  NPKBarcodePaymentSession *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  pk_Payment_log();
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);

  if (v4)
  {
    pk_Payment_log();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v7 = 138412290;
      v8 = self;
      _os_log_impl(&dword_213518000, v5, OS_LOG_TYPE_DEFAULT, "Notice: [BarcodePayment] %@ session retried!", (uint8_t *)&v7, 0xCu);
    }

  }
  -[NPKBarcodePaymentSession _extendSessionTimeoutTimer](self, "_extendSessionTimeoutTimer");
  -[NPKBarcodePaymentSession _updateCurrentPaymentBarcodeWithBarcodeIdentifier:decryptedBarcodeCredential:error:](self, "_updateCurrentPaymentBarcodeWithBarcodeIdentifier:decryptedBarcodeCredential:error:", 0, 0, 0);
  -[NPKBarcodePaymentSession authorizationCredential](self, "authorizationCredential");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPKBarcodePaymentSession _fetchDecryptedBarcodeWithCredential:](self, "_fetchDecryptedBarcodeWithCredential:", v6);

}

- (void)invalidateSession
{
  NSObject *v3;
  _BOOL4 v4;
  NSObject *v5;
  void *v6;
  int v7;
  NPKBarcodePaymentSession *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  pk_Payment_log();
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);

  if (v4)
  {
    pk_Payment_log();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v7 = 138412290;
      v8 = self;
      _os_log_impl(&dword_213518000, v5, OS_LOG_TYPE_DEFAULT, "Notice: [BarcodePayment] %@ session invalidated!", (uint8_t *)&v7, 0xCu);
    }

  }
  -[NPKBarcodePaymentSession setSessionStarted:](self, "setSessionStarted:", 0);
  -[NPKBarcodePaymentSession paymentService](self, "paymentService");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setDelegate:", 0);

  -[NPKBarcodePaymentSession setPaymentService:](self, "setPaymentService:", 0);
  -[NPKBarcodePaymentSession _stopSessionTimeoutTimer](self, "_stopSessionTimeoutTimer");
  -[NPKBarcodePaymentSession _releaseNotificationSuppressionAssertion](self, "_releaseNotificationSuppressionAssertion");
  -[NPKBarcodePaymentSession _releaseExpressTransactionSuppressionAssertion](self, "_releaseExpressTransactionSuppressionAssertion");
}

- (void)submitUserIntentionConfirmation:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v8[5];

  if (a3)
  {
    -[NPKBarcodePaymentSession setSubmittingAuthenticationResult:](self, "setSubmittingAuthenticationResult:", 1);
    -[NPKBarcodePaymentSession paymentService](self, "paymentService");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[NPKBarcodePaymentSession currentTransaction](self, "currentTransaction");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "identifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __60__NPKBarcodePaymentSession_submitUserIntentionConfirmation___block_invoke;
    v8[3] = &unk_24CFEE860;
    v8[4] = self;
    objc_msgSend(v4, "submitUserConfirmation:forTransactionIdentifier:completion:", 1, v6, v8);

    -[NPKBarcodePaymentSession _extendSessionTimeoutTimer](self, "_extendSessionTimeoutTimer");
  }
  else
  {
    -[NPKBarcodePaymentSession currentTransaction](self, "currentTransaction");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[NPKBarcodePaymentSession _completedAuthenticationForTransaction:](self, "_completedAuthenticationForTransaction:", v7);

    -[NPKBarcodePaymentSession _handleUpdatedTransactionStatus:](self, "_handleUpdatedTransactionStatus:", 2);
  }
}

void __60__NPKBarcodePaymentSession_submitUserIntentionConfirmation___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  id v8;
  _QWORD block[4];
  id v10;
  id v11;
  uint64_t v12;

  v5 = a2;
  v6 = a3;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __60__NPKBarcodePaymentSession_submitUserIntentionConfirmation___block_invoke_2;
  block[3] = &unk_24CFE8288;
  v10 = v5;
  v11 = v6;
  v12 = *(_QWORD *)(a1 + 32);
  v7 = v6;
  v8 = v5;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

}

uint64_t __60__NPKBarcodePaymentSession_submitUserIntentionConfirmation___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  _BOOL4 v3;
  NSObject *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  int v9;
  void *v10;
  __int16 v11;
  void *v12;
  __int16 v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  pk_Payment_log();
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT);

  if (v3)
  {
    pk_Payment_log();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5 = *(void **)(a1 + 32);
      objc_msgSend(v5, "transactionStatus");
      PKPaymentTransactionStatusToString();
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = *(_QWORD *)(a1 + 40);
      v9 = 138412802;
      v10 = v5;
      v11 = 2112;
      v12 = v6;
      v13 = 2112;
      v14 = v7;
      _os_log_impl(&dword_213518000, v4, OS_LOG_TYPE_DEFAULT, "Notice: [BarcodePayment] PKPaymentTransaction %@ user intention confirmation step up result: %@, error: %@", (uint8_t *)&v9, 0x20u);

    }
  }
  objc_msgSend(*(id *)(a1 + 48), "_handleUpdatedPaymentTransaction:", *(_QWORD *)(a1 + 32));
  return objc_msgSend(*(id *)(a1 + 48), "setSubmittingAuthenticationResult:", 0);
}

- (void)submitPinCode:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(id *);
  void *v15;
  id v16;
  id v17;
  id v18;
  NPKBarcodePaymentSession *v19;

  v4 = a3;
  if (v4)
  {
    -[NPKBarcodePaymentSession setSubmittingAuthenticationResult:](self, "setSubmittingAuthenticationResult:", 1);
    -[NPKBarcodePaymentSession paymentPass](self, "paymentPass");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "uniqueID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    -[NPKBarcodePaymentSession currentTransaction](self, "currentTransaction");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[NPKBarcodePaymentSession paymentService](self, "paymentService");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = MEMORY[0x24BDAC760];
    v13 = 3221225472;
    v14 = __42__NPKBarcodePaymentSession_submitPinCode___block_invoke;
    v15 = &unk_24CFEE888;
    v16 = v4;
    v17 = v7;
    v18 = v6;
    v19 = self;
    v9 = v6;
    v10 = v7;
    objc_msgSend(v8, "retrievePINEncryptionCertificateForPassUniqueIdentifier:withCompletion:", v9, &v12);

    -[NPKBarcodePaymentSession _extendSessionTimeoutTimer](self, "_extendSessionTimeoutTimer", v12, v13, v14, v15);
  }
  else
  {
    -[NPKBarcodePaymentSession currentTransaction](self, "currentTransaction");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[NPKBarcodePaymentSession _completedAuthenticationForTransaction:](self, "_completedAuthenticationForTransaction:", v11);

    -[NPKBarcodePaymentSession _handleUpdatedTransactionStatus:](self, "_handleUpdatedTransactionStatus:", 2);
  }

}

void __42__NPKBarcodePaymentSession_submitPinCode___block_invoke(id *a1)
{
  void *v2;
  id v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  _QWORD v8[5];
  _QWORD block[4];
  id v10;
  id v11;
  id v12;
  uint64_t v13;

  v13 = 0;
  PKEncryptTransactionAuthenticationPasscode();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = 0;
  if (v3)
  {
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __42__NPKBarcodePaymentSession_submitPinCode___block_invoke_2;
    block[3] = &unk_24CFE8288;
    v10 = a1[6];
    v4 = v3;
    v5 = a1[7];
    v11 = v4;
    v12 = v5;
    dispatch_async(MEMORY[0x24BDAC9B8], block);

  }
  else
  {
    objc_msgSend(a1[7], "paymentService");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1[5], "identifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __42__NPKBarcodePaymentSession_submitPinCode___block_invoke_34;
    v8[3] = &unk_24CFEE860;
    v8[4] = a1[7];
    objc_msgSend(v6, "submitEncryptedPIN:forTransactionIdentifier:completion:", v2, v7, v8);

  }
}

uint64_t __42__NPKBarcodePaymentSession_submitPinCode___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  _BOOL4 v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  int v10;
  uint64_t v11;
  __int16 v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  pk_Payment_log();
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT);

  if (v3)
  {
    pk_Payment_log();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5 = *(_QWORD *)(a1 + 32);
      v6 = *(_QWORD *)(a1 + 40);
      v10 = 138412546;
      v11 = v5;
      v12 = 2112;
      v13 = v6;
      _os_log_impl(&dword_213518000, v4, OS_LOG_TYPE_DEFAULT, "Notice: [BarcodePayment] Failed to encrypt PIN for pass %@ with error %@", (uint8_t *)&v10, 0x16u);
    }

  }
  v7 = *(void **)(a1 + 48);
  objc_msgSend(v7, "currentTransaction");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_completedAuthenticationForTransaction:", v8);

  objc_msgSend(*(id *)(a1 + 48), "_handleUpdatedTransactionStatus:", 3);
  return objc_msgSend(*(id *)(a1 + 48), "setSubmittingAuthenticationResult:", 0);
}

void __42__NPKBarcodePaymentSession_submitPinCode___block_invoke_34(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  id v8;
  _QWORD block[4];
  id v10;
  id v11;
  uint64_t v12;

  v5 = a2;
  v6 = a3;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __42__NPKBarcodePaymentSession_submitPinCode___block_invoke_2_35;
  block[3] = &unk_24CFE8288;
  v10 = v5;
  v11 = v6;
  v12 = *(_QWORD *)(a1 + 32);
  v7 = v6;
  v8 = v5;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

}

uint64_t __42__NPKBarcodePaymentSession_submitPinCode___block_invoke_2_35(uint64_t a1)
{
  NSObject *v2;
  _BOOL4 v3;
  NSObject *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  int v9;
  void *v10;
  __int16 v11;
  void *v12;
  __int16 v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  pk_Payment_log();
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT);

  if (v3)
  {
    pk_Payment_log();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5 = *(void **)(a1 + 32);
      objc_msgSend(v5, "transactionStatus");
      PKPaymentTransactionStatusToString();
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = *(_QWORD *)(a1 + 40);
      v9 = 138412802;
      v10 = v5;
      v11 = 2112;
      v12 = v6;
      v13 = 2112;
      v14 = v7;
      _os_log_impl(&dword_213518000, v4, OS_LOG_TYPE_DEFAULT, "Notice: [BarcodePayment] PKPaymentTransaction %@ pin step up result: %@, error: %@", (uint8_t *)&v9, 0x20u);

    }
  }
  objc_msgSend(*(id *)(a1 + 48), "_handleUpdatedPaymentTransaction:", *(_QWORD *)(a1 + 32));
  return objc_msgSend(*(id *)(a1 + 48), "setSubmittingAuthenticationResult:", 0);
}

- (void)transactionSourceIdentifier:(id)a3 didReceiveTransaction:(id)a4
{
  id v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v5 = a4;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __78__NPKBarcodePaymentSession_transactionSourceIdentifier_didReceiveTransaction___block_invoke;
  v7[3] = &unk_24CFE7E40;
  v7[4] = self;
  v8 = v5;
  v6 = v5;
  dispatch_async(MEMORY[0x24BDAC9B8], v7);

}

void __78__NPKBarcodePaymentSession_transactionSourceIdentifier_didReceiveTransaction___block_invoke(uint64_t a1)
{
  NSObject *v2;
  _BOOL4 v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  int v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  if (objc_msgSend(*(id *)(a1 + 32), "submittingAuthenticationResult"))
  {
    pk_Payment_log();
    v2 = objc_claimAutoreleasedReturnValue();
    v3 = os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT);

    if (v3)
    {
      pk_Payment_log();
      v4 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        v5 = *(_QWORD *)(a1 + 40);
        v10 = 138412290;
        v11 = v5;
        _os_log_impl(&dword_213518000, v4, OS_LOG_TYPE_DEFAULT, "Notice: [BarcodePayment] Ignoring transaction update while submitting authentication result. %@", (uint8_t *)&v10, 0xCu);
      }

    }
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "barcodeIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "currentPaymentBarcode");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "barcodeIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v6, "isEqualToString:", v8);

    if (v9)
      objc_msgSend(*(id *)(a1 + 32), "_handleUpdatedPaymentTransaction:", *(_QWORD *)(a1 + 40));
  }
}

- (void)_fetchDecryptedBarcodeWithCredential:(id)a3
{
  id v4;
  NSObject *v5;
  _BOOL4 v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v11[4];
  id v12;
  uint8_t buf[4];
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  pk_Payment_log();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);

  if (v6)
  {
    pk_Payment_log();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v14 = v4;
      _os_log_impl(&dword_213518000, v7, OS_LOG_TYPE_DEFAULT, "Notice: [BarcodePayment] Start fetching decrypted barcode with credential: %@", buf, 0xCu);
    }

  }
  objc_initWeak((id *)buf, self);
  -[NPKBarcodePaymentSession paymentService](self, "paymentService");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPKBarcodePaymentSession paymentPass](self, "paymentPass");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "uniqueID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __65__NPKBarcodePaymentSession__fetchDecryptedBarcodeWithCredential___block_invoke;
  v11[3] = &unk_24CFEE8D8;
  objc_copyWeak(&v12, (id *)buf);
  objc_msgSend(v8, "retrieveDecryptedBarcodeCredentialForPassUniqueIdentifier:authorization:withCompletion:", v10, v4, v11);

  objc_destroyWeak(&v12);
  objc_destroyWeak((id *)buf);

}

void __65__NPKBarcodePaymentSession__fetchDecryptedBarcodeWithCredential___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  id v19;
  _QWORD block[4];
  id v21;
  id v22;
  id v23;
  id v24;
  _QWORD v25[2];
  _QWORD v26[2];
  _QWORD v27[3];

  v27[2] = *MEMORY[0x24BDAC8D0];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  v10 = (void *)MEMORY[0x24BE6E9C8];
  v11 = *MEMORY[0x24BE6F178];
  v27[0] = *MEMORY[0x24BE6F158];
  v27[1] = v11;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v27, 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = *MEMORY[0x24BE6F018];
  v26[0] = *MEMORY[0x24BE6F050];
  v14 = *MEMORY[0x24BE6EFC0];
  v25[0] = v13;
  v25[1] = v14;
  PKAnalyticsReportBarcodeCredentialRetrivalStatusFromError();
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v26[1] = v15;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v26, v25, 2);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "subjects:sendEvent:", v12, v16);

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __65__NPKBarcodePaymentSession__fetchDecryptedBarcodeWithCredential___block_invoke_2;
  block[3] = &unk_24CFEE8B0;
  v21 = v9;
  v22 = v7;
  v17 = v7;
  v18 = v9;
  objc_copyWeak(&v24, (id *)(a1 + 32));
  v23 = v8;
  v19 = v8;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

  objc_destroyWeak(&v24);
}

void __65__NPKBarcodePaymentSession__fetchDecryptedBarcodeWithCredential___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  NSObject *v4;
  _BOOL4 v5;
  NSObject *v6;
  uint64_t v7;
  const char *v8;
  NSObject *v9;
  os_log_type_t v10;
  _BOOL4 v11;
  uint64_t v12;
  id WeakRetained;
  void *v14;
  int v15;
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v2 = *(_QWORD *)(a1 + 32);
  pk_Payment_log();
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v2)
  {
    v5 = os_log_type_enabled(v3, OS_LOG_TYPE_ERROR);

    if (!v5)
      goto LABEL_10;
    pk_Payment_log();
    v6 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      goto LABEL_9;
    v7 = *(_QWORD *)(a1 + 32);
    v15 = 138412290;
    v16 = v7;
    v8 = "Error: [BarcodePayment] Failed to fetch barcode due to: %@";
    v9 = v6;
    v10 = OS_LOG_TYPE_ERROR;
    goto LABEL_8;
  }
  v11 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);

  if (!v11)
    goto LABEL_10;
  pk_Payment_log();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v12 = *(_QWORD *)(a1 + 40);
    v15 = 138412290;
    v16 = v12;
    v8 = "Notice: [BarcodePayment] Fetched barcode with identifier: %@";
    v9 = v6;
    v10 = OS_LOG_TYPE_DEFAULT;
LABEL_8:
    _os_log_impl(&dword_213518000, v9, v10, v8, (uint8_t *)&v15, 0xCu);
  }
LABEL_9:

LABEL_10:
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  v14 = WeakRetained;
  if (WeakRetained)
    objc_msgSend(WeakRetained, "_updateCurrentPaymentBarcodeWithBarcodeIdentifier:decryptedBarcodeCredential:error:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 32));

}

- (void)_invokeExtensionToCollectPaymentInformation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  _BOOL4 v12;
  NSObject *v13;
  uint64_t v14;
  id v15;
  uint64_t v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  _QWORD v31[4];
  id v32;
  NPKBarcodePaymentSession *v33;
  id v34;
  id v35;
  id v36;
  id v37;
  id v38;
  _QWORD v39[4];
  id v40;
  id v41;
  id v42;
  _QWORD *v43;
  id v44;
  id location;
  _QWORD v46[3];
  char v47;
  _QWORD v48[5];
  _QWORD v49[4];
  int v50;
  __int128 buf;
  uint64_t v52;
  uint64_t (*v53)(uint64_t, uint64_t);
  void (*v54)(uint64_t);
  id v55;
  uint64_t v56;

  v56 = *MEMORY[0x24BDAC8D0];
  -[NPKBarcodePaymentSession paymentPass](self, "paymentPass");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "uniqueID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[NPKBarcodePaymentSession currentPaymentBarcode](self, "currentPaymentBarcode");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "barcodeIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[NPKBarcodePaymentSession paymentPass](self, "paymentPass");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "deviceAccountIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[NPKBarcodePaymentSession paymentPass](self, "paymentPass");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "associatedApplicationIdentifiers");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  pk_Payment_log();
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);

  if (v12)
  {
    pk_Payment_log();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf) = 138412290;
      *(_QWORD *)((char *)&buf + 4) = v4;
      _os_log_impl(&dword_213518000, v13, OS_LOG_TYPE_DEFAULT, "Notice: [BarcodePayment] Starting to collect payment information for pass %@", (uint8_t *)&buf, 0xCu);
    }

  }
  v14 = NPKMyPid();
  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v52 = 0x3032000000;
  v53 = __Block_byref_object_copy__25;
  v54 = __Block_byref_object_dispose__25;
  v15 = objc_alloc(MEMORY[0x24BE08A10]);
  v16 = MEMORY[0x24BDAC760];
  v49[0] = MEMORY[0x24BDAC760];
  v49[1] = 3221225472;
  v49[2] = __71__NPKBarcodePaymentSession__invokeExtensionToCollectPaymentInformation__block_invoke;
  v49[3] = &__block_descriptor_36_e8_v12__0B8l;
  v50 = v14;
  v55 = (id)objc_msgSend(v15, "initWithPID:flags:reason:name:withHandler:", v14, 1, 4, CFSTR("Submit Barcode Payment Event"), v49);
  objc_msgSend(*(id *)(*((_QWORD *)&buf + 1) + 40), "setInvalidationHandler:", &__block_literal_global_35);
  v48[0] = v16;
  v48[1] = 3221225472;
  v48[2] = __71__NPKBarcodePaymentSession__invokeExtensionToCollectPaymentInformation__block_invoke_46;
  v48[3] = &unk_24CFE81D0;
  v48[4] = &buf;
  v17 = (void *)MEMORY[0x2199B6780](v48);
  v46[0] = 0;
  v46[1] = v46;
  v46[2] = 0x2020000000;
  v47 = 0;
  -[NPKBarcodePaymentSession paymentService](self, "paymentService");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, v18);

  v39[0] = v16;
  v39[1] = 3221225472;
  v39[2] = __71__NPKBarcodePaymentSession__invokeExtensionToCollectPaymentInformation__block_invoke_2;
  v39[3] = &unk_24CFEE940;
  v43 = v46;
  v19 = v8;
  v40 = v19;
  v20 = v6;
  v41 = v20;
  v21 = v4;
  v42 = v21;
  objc_copyWeak(&v44, &location);
  v22 = (void *)MEMORY[0x2199B6780](v39);
  objc_msgSend(MEMORY[0x24BE6EAF8], "providerForExtensionPoint:", *MEMORY[0x24BE6F338]);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "allObjects");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v31[0] = v16;
  v31[1] = 3221225472;
  v31[2] = __71__NPKBarcodePaymentSession__invokeExtensionToCollectPaymentInformation__block_invoke_51;
  v31[3] = &unk_24CFEEA30;
  v25 = v21;
  v32 = v25;
  v33 = self;
  v26 = v22;
  v37 = v26;
  v27 = v17;
  v38 = v27;
  v28 = v20;
  v34 = v28;
  v29 = v19;
  v35 = v29;
  v30 = v10;
  v36 = v30;
  objc_msgSend(v23, "extensionsWithContainingApplicationIdentifiers:completion:", v24, v31);

  objc_destroyWeak(&v44);
  objc_destroyWeak(&location);
  _Block_object_dispose(v46, 8);

  _Block_object_dispose(&buf, 8);
}

void __71__NPKBarcodePaymentSession__invokeExtensionToCollectPaymentInformation__block_invoke(uint64_t a1, int a2)
{
  NSObject *v4;
  NSObject *v5;
  _BOOL4 v6;
  NSObject *v7;
  int v8;
  const char *v9;
  NSObject *v10;
  os_log_type_t v11;
  _BOOL4 v12;
  int v13;
  int v14;
  int v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  pk_Payment_log();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (a2)
  {
    v6 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);

    if (!v6)
      return;
    pk_Payment_log();
    v7 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      goto LABEL_9;
    v8 = *(_DWORD *)(a1 + 32);
    v14 = 67109120;
    v15 = v8;
    v9 = "Notice: [BarcodePayment] Acquired process assertion for barcode payment event for %d.";
    v10 = v7;
    v11 = OS_LOG_TYPE_DEFAULT;
    goto LABEL_8;
  }
  v12 = os_log_type_enabled(v4, OS_LOG_TYPE_ERROR);

  if (!v12)
    return;
  pk_Payment_log();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    v13 = *(_DWORD *)(a1 + 32);
    v14 = 67109120;
    v15 = v13;
    v9 = "Error: [BarcodePayment] Failed to acquire process assertion for barcode payment event: %d.";
    v10 = v7;
    v11 = OS_LOG_TYPE_ERROR;
LABEL_8:
    _os_log_impl(&dword_213518000, v10, v11, v9, (uint8_t *)&v14, 8u);
  }
LABEL_9:

}

void __71__NPKBarcodePaymentSession__invokeExtensionToCollectPaymentInformation__block_invoke_45()
{
  NSObject *v0;
  _BOOL4 v1;
  NSObject *v2;
  uint8_t v3[16];

  pk_Payment_log();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT);

  if (v1)
  {
    pk_Payment_log();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v3 = 0;
      _os_log_impl(&dword_213518000, v2, OS_LOG_TYPE_DEFAULT, "Notice: [BarcodePayment] Invalidated process assertion for barcode payment event.", v3, 2u);
    }

  }
}

void __71__NPKBarcodePaymentSession__invokeExtensionToCollectPaymentInformation__block_invoke_46(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;

  v2 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
  if (v2)
  {
    objc_msgSend(v2, "invalidate");
    v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v4 = *(void **)(v3 + 40);
    *(_QWORD *)(v3 + 40) = 0;

  }
}

void __71__NPKBarcodePaymentSession__invokeExtensionToCollectPaymentInformation__block_invoke_2(uint64_t a1, void *a2, int a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  NSObject *v8;
  _BOOL4 v9;
  NSObject *v10;
  void *v11;
  void *v12;
  __CFString **v13;
  __CFString **v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  NSObject *v22;
  NSObject *v23;
  uint64_t v24;
  id WeakRetained;
  void *v26;
  id v27;
  void *v28;
  int v29;
  id v30;
  __int16 v31;
  uint64_t v32;
  uint64_t v33;
  NSObject *v34;
  _QWORD v35[3];

  v35[2] = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = v5;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  if (!*(_BYTE *)(v7 + 24))
  {
    *(_BYTE *)(v7 + 24) = 1;
    objc_msgSend(v5, "paymentInformation");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v13 = NPKAnalyticsReportEventTypeBarcodePaymentTransactionLocalExtensionSucceeded;
    if (!a3)
      v13 = NPKAnalyticsReportEventTypeBarcodePaymentTransactionRemoteExtensionSucceeded;
    v14 = NPKAnalyticsReportEventTypeBarcodePaymentTransactionLocalExtensionFailed;
    if (!a3)
      v14 = NPKAnalyticsReportEventTypeBarcodePaymentTransactionRemoteExtensionFailed;
    if (!v12)
      v13 = v14;
    v10 = *v13;
    v15 = (void *)MEMORY[0x24BE6E9C8];
    v16 = *MEMORY[0x24BE6F178];
    v35[0] = *MEMORY[0x24BE6F158];
    v35[1] = v16;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v35, 2);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = *MEMORY[0x24BE6F018];
    v34 = v10;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v34, &v33, 1);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "subjects:sendEvent:", v17, v18);

    v19 = objc_alloc_init(MEMORY[0x24BE6EA58]);
    objc_msgSend(v19, "setEventType:", 1);
    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setTimestamp:", v20);

    objc_msgSend(v6, "paymentInformation");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setEventMetadata:", v21);

    objc_msgSend(v19, "setDeviceAccountIdentifier:", *(_QWORD *)(a1 + 32));
    objc_msgSend(v19, "setBarcodeIdentifier:", *(_QWORD *)(a1 + 40));
    objc_msgSend(v19, "setAuthenticationType:", 1);
    pk_Payment_log();
    v22 = objc_claimAutoreleasedReturnValue();
    LODWORD(v18) = os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT);

    if ((_DWORD)v18)
    {
      pk_Payment_log();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        v24 = *(_QWORD *)(a1 + 48);
        v29 = 138412546;
        v30 = v19;
        v31 = 2112;
        v32 = v24;
        _os_log_impl(&dword_213518000, v23, OS_LOG_TYPE_DEFAULT, "Notice: [BarcodePayment] Submitting barcodePaymentEvent %@ for %@", (uint8_t *)&v29, 0x16u);
      }

    }
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
    v26 = WeakRetained;
    if (WeakRetained)
      v27 = WeakRetained;
    else
      v27 = objc_alloc_init(MEMORY[0x24BE6ED30]);
    v28 = v27;

    objc_msgSend(v28, "submitBarcodePaymentEvent:forPassUniqueIdentifier:withCompletion:", v19, *(_QWORD *)(a1 + 48), 0);
    goto LABEL_19;
  }
  pk_Payment_log();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);

  if (v9)
  {
    pk_Payment_log();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v11 = *(void **)(a1 + 48);
      v29 = 138412290;
      v30 = v11;
      _os_log_impl(&dword_213518000, v10, OS_LOG_TYPE_DEFAULT, "Notice: [BarcodePayment] BarcodePaymentEvent already submitted for %@. Skipping.", (uint8_t *)&v29, 0xCu);
    }
LABEL_19:

  }
}

void __71__NPKBarcodePaymentSession__invokeExtensionToCollectPaymentInformation__block_invoke_51(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  _BOOL4 v18;
  NSObject *v19;
  uint64_t v20;
  id v21;
  void *v22;
  _BOOL4 v23;
  NSObject *v24;
  _BOOL4 v25;
  NSObject *v26;
  void *v27;
  NPKNanoPassDaemonConnection *v28;
  uint64_t v29;
  uint64_t v30;
  dispatch_time_t v31;
  NSObject *v32;
  NSObject *v33;
  _BOOL4 v34;
  NSObject *v35;
  uint64_t v36;
  _QWORD block[4];
  id v38;
  id v39;
  _QWORD v40[5];
  id v41;
  id v42;
  _QWORD v43[5];
  id v44;
  id v45;
  id v46;
  id v47;
  id v48;
  id v49;
  _BYTE *v50;
  _BYTE buf[24];
  uint64_t (*v52)(uint64_t, uint64_t);
  void (*v53)(uint64_t);
  id v54;
  _QWORD v55[3];
  _QWORD v56[3];
  _QWORD v57[5];

  v57[2] = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  if (v6)
    v7 = 0;
  else
    v7 = objc_msgSend(v5, "count");
  v8 = (void *)MEMORY[0x24BE6E9C8];
  v9 = *MEMORY[0x24BE6F178];
  v57[0] = *MEMORY[0x24BE6F158];
  v57[1] = v9;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v57, 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = *MEMORY[0x24BE6F070];
  v12 = *MEMORY[0x24BE6F0B8];
  v55[0] = *MEMORY[0x24BE6F018];
  v55[1] = v12;
  v13 = *MEMORY[0x24BE6F338];
  v56[0] = v11;
  v56[1] = v13;
  v55[2] = *MEMORY[0x24BE6F0E0];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%lu"), v7);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v56[2] = v14;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v56, v55, 3);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "subjects:sendEvent:", v10, v15);

  if (objc_msgSend(v5, "count"))
  {
    objc_msgSend(v5, "firstObject");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    pk_Payment_log();
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT);

    if (v18)
    {
      pk_Payment_log();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        v20 = *(_QWORD *)(a1 + 32);
        *(_DWORD *)buf = 138412546;
        *(_QWORD *)&buf[4] = v16;
        *(_WORD *)&buf[12] = 2112;
        *(_QWORD *)&buf[14] = v20;
        _os_log_impl(&dword_213518000, v19, OS_LOG_TYPE_DEFAULT, "Notice: [BarcodePayment] Local extension %@ is now collecting payment information for pass %@", buf, 0x16u);
      }

    }
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x3032000000;
    v52 = __Block_byref_object_copy__25;
    v53 = __Block_byref_object_dispose__25;
    v54 = 0;
    v43[0] = MEMORY[0x24BDAC760];
    v43[1] = 3221225472;
    v43[2] = __71__NPKBarcodePaymentSession__invokeExtensionToCollectPaymentInformation__block_invoke_55;
    v43[3] = &unk_24CFEE9B8;
    v43[4] = *(_QWORD *)(a1 + 40);
    v21 = v16;
    v44 = v21;
    v45 = *(id *)(a1 + 32);
    v48 = *(id *)(a1 + 72);
    v49 = *(id *)(a1 + 80);
    v50 = buf;
    v46 = *(id *)(a1 + 48);
    v47 = *(id *)(a1 + 56);
    objc_msgSend(v21, "beginExtensionRequestWithOptions:completion:", 1, v43);

    _Block_object_dispose(buf, 8);
    goto LABEL_23;
  }
  objc_msgSend(v6, "domain");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v22, "isEqualToString:", *MEMORY[0x24BE6F558]))
  {
    v23 = objc_msgSend(v6, "code") == -1001;

    if (v23)
    {
      pk_Payment_log();
      v24 = objc_claimAutoreleasedReturnValue();
      v25 = os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT);

      if (v25)
      {
        pk_Payment_log();
        v26 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_213518000, v26, OS_LOG_TYPE_DEFAULT, "Notice: [BarcodePayment] Extension doesn't exist locally. Invoking remote extension on paired device.", buf, 2u);
        }

      }
      v27 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE6EA50]), "initWithBarcodeIdentifier:deviceAccountIdentifier:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
      v28 = objc_alloc_init(NPKNanoPassDaemonConnection);
      v29 = *(_QWORD *)(a1 + 64);
      v30 = MEMORY[0x24BDAC760];
      v40[0] = MEMORY[0x24BDAC760];
      v40[1] = 3221225472;
      v40[2] = __71__NPKBarcodePaymentSession__invokeExtensionToCollectPaymentInformation__block_invoke_67;
      v40[3] = &unk_24CFEEA08;
      v40[4] = *(_QWORD *)(a1 + 40);
      v41 = *(id *)(a1 + 72);
      v42 = *(id *)(a1 + 80);
      -[NPKNanoPassDaemonConnection handleMetadataRequestOnPairedDevice:withAssociatedApplicationIdentifiers:completion:](v28, "handleMetadataRequestOnPairedDevice:withAssociatedApplicationIdentifiers:completion:", v27, v29, v40);
      v31 = dispatch_time(0, 0x37E11D800);
      objc_msgSend(*(id *)(a1 + 40), "serialQueue");
      v32 = objc_claimAutoreleasedReturnValue();
      block[0] = v30;
      block[1] = 3221225472;
      block[2] = __71__NPKBarcodePaymentSession__invokeExtensionToCollectPaymentInformation__block_invoke_70;
      block[3] = &unk_24CFEB768;
      v38 = *(id *)(a1 + 72);
      v39 = *(id *)(a1 + 80);
      dispatch_after(v31, v32, block);

      goto LABEL_23;
    }
  }
  else
  {

  }
  pk_Payment_log();
  v33 = objc_claimAutoreleasedReturnValue();
  v34 = os_log_type_enabled(v33, OS_LOG_TYPE_ERROR);

  if (v34)
  {
    pk_Payment_log();
    v35 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
    {
      v36 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138412546;
      *(_QWORD *)&buf[4] = v36;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v6;
      _os_log_impl(&dword_213518000, v35, OS_LOG_TYPE_ERROR, "Error: [BarcodePayment] Failed to begin payment information event extension for pass %@ with error %@", buf, 0x16u);
    }

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 72) + 16))();
  (*(void (**)(void))(*(_QWORD *)(a1 + 80) + 16))();
LABEL_23:

}

void __71__NPKBarcodePaymentSession__invokeExtensionToCollectPaymentInformation__block_invoke_55(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id v13;
  uint64_t v14;
  _QWORD v15[5];
  id v16;
  id v17;
  id v18;
  uint64_t v19;
  _QWORD block[4];
  id v21;
  id v22;
  id v23;
  id v24;

  v3 = a2;
  v4 = v3;
  if (v3 && (objc_msgSend(v3, "isInvalidated") & 1) == 0)
  {
    objc_msgSend(v4, "extensionContext");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v8 = (void *)MEMORY[0x24BDBFA70];
        objc_msgSend(*(id *)(a1 + 40), "identifier");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v8, "newAssertionForBundleIdentifier:withReason:", v9, CFSTR("Barcode Event Metadata"));
        v11 = *(_QWORD *)(*(_QWORD *)(a1 + 88) + 8);
        v12 = *(void **)(v11 + 40);
        *(_QWORD *)(v11 + 40) = v10;

        v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE6EA50]), "initWithBarcodeIdentifier:deviceAccountIdentifier:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64));
        v15[0] = MEMORY[0x24BDAC760];
        v15[1] = 3221225472;
        v15[2] = __71__NPKBarcodePaymentSession__invokeExtensionToCollectPaymentInformation__block_invoke_62;
        v15[3] = &unk_24CFEE990;
        v15[4] = *(_QWORD *)(a1 + 32);
        v13 = *(id *)(a1 + 72);
        v14 = *(_QWORD *)(a1 + 88);
        v17 = v13;
        v19 = v14;
        v16 = v4;
        v18 = *(id *)(a1 + 80);
        objc_msgSend(v5, "handleInformationRequest:completion:", v7, v15);

        goto LABEL_5;
      }
    }
  }
  else
  {
    v5 = 0;
  }
  objc_msgSend(*(id *)(a1 + 32), "serialQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __71__NPKBarcodePaymentSession__invokeExtensionToCollectPaymentInformation__block_invoke_2_57;
  block[3] = &unk_24CFEDAF0;
  v21 = *(id *)(a1 + 40);
  v22 = *(id *)(a1 + 48);
  v23 = *(id *)(a1 + 72);
  v24 = *(id *)(a1 + 80);
  dispatch_async(v6, block);

  v7 = v21;
LABEL_5:

}

uint64_t __71__NPKBarcodePaymentSession__invokeExtensionToCollectPaymentInformation__block_invoke_2_57(_QWORD *a1)
{
  NSObject *v2;
  _BOOL4 v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  int v8;
  uint64_t v9;
  __int16 v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  pk_Payment_log();
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = os_log_type_enabled(v2, OS_LOG_TYPE_ERROR);

  if (v3)
  {
    pk_Payment_log();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v5 = a1[4];
      v6 = a1[5];
      v8 = 138412546;
      v9 = v5;
      v10 = 2112;
      v11 = v6;
      _os_log_impl(&dword_213518000, v4, OS_LOG_TYPE_ERROR, "Error: [BarcodePayment] Local extension %@ for pass %@ failed to collect payment information", (uint8_t *)&v8, 0x16u);
    }

  }
  (*(void (**)(void))(a1[6] + 16))();
  return (*(uint64_t (**)(void))(a1[7] + 16))();
}

void __71__NPKBarcodePaymentSession__invokeExtensionToCollectPaymentInformation__block_invoke_62(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  id v6;
  id v7;
  NSObject *v8;
  _QWORD v9[4];
  id v10;
  _QWORD block[4];
  id v12;
  id v13;
  uint64_t v14;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "serialQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x24BDAC760];
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __71__NPKBarcodePaymentSession__invokeExtensionToCollectPaymentInformation__block_invoke_2_63;
  block[3] = &unk_24CFEE968;
  v6 = *(id *)(a1 + 48);
  v12 = v3;
  v13 = v6;
  v14 = *(_QWORD *)(a1 + 64);
  v7 = v3;
  dispatch_async(v4, block);

  objc_msgSend(*(id *)(a1 + 40), "invalidate");
  objc_msgSend(*(id *)(a1 + 32), "serialQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  v9[0] = v5;
  v9[1] = 3221225472;
  v9[2] = __71__NPKBarcodePaymentSession__invokeExtensionToCollectPaymentInformation__block_invoke_3;
  v9[3] = &unk_24CFE7B00;
  v10 = *(id *)(a1 + 56);
  dispatch_async(v8, v9);

}

uint64_t __71__NPKBarcodePaymentSession__invokeExtensionToCollectPaymentInformation__block_invoke_2_63(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  return objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "invalidate");
}

uint64_t __71__NPKBarcodePaymentSession__invokeExtensionToCollectPaymentInformation__block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __71__NPKBarcodePaymentSession__invokeExtensionToCollectPaymentInformation__block_invoke_67(id *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  id v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  id v14;
  id v15;

  v5 = a2;
  v6 = a3;
  objc_msgSend(a1[4], "serialQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __71__NPKBarcodePaymentSession__invokeExtensionToCollectPaymentInformation__block_invoke_2_68;
  v11[3] = &unk_24CFEE9E0;
  v12 = v6;
  v8 = a1[5];
  v13 = v5;
  v14 = v8;
  v15 = a1[6];
  v9 = v5;
  v10 = v6;
  dispatch_async(v7, v11);

}

uint64_t __71__NPKBarcodePaymentSession__invokeExtensionToCollectPaymentInformation__block_invoke_2_68(_QWORD *a1)
{
  NSObject *v2;
  _BOOL4 v3;
  NSObject *v4;
  uint64_t v5;
  void (*v6)(void);
  int v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  if (a1[4])
  {
    pk_Payment_log();
    v2 = objc_claimAutoreleasedReturnValue();
    v3 = os_log_type_enabled(v2, OS_LOG_TYPE_ERROR);

    if (v3)
    {
      pk_Payment_log();
      v4 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      {
        v5 = a1[4];
        v8 = 138412290;
        v9 = v5;
        _os_log_impl(&dword_213518000, v4, OS_LOG_TYPE_ERROR, "Error: [BarcodePayment] Remote extension failed with error: %@", (uint8_t *)&v8, 0xCu);
      }

    }
    v6 = *(void (**)(void))(a1[6] + 16);
  }
  else
  {
    v6 = *(void (**)(void))(a1[6] + 16);
  }
  v6();
  return (*(uint64_t (**)(void))(a1[7] + 16))();
}

uint64_t __71__NPKBarcodePaymentSession__invokeExtensionToCollectPaymentInformation__block_invoke_70(uint64_t a1)
{
  NSObject *v2;
  _BOOL4 v3;
  NSObject *v4;
  uint8_t v6[16];

  pk_Payment_log();
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = os_log_type_enabled(v2, OS_LOG_TYPE_ERROR);

  if (v3)
  {
    pk_Payment_log();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_213518000, v4, OS_LOG_TYPE_ERROR, "Error: [BarcodePayment] Remote extension timed out.", v6, 2u);
    }

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)_updateCurrentPaymentBarcodeWithBarcodeIdentifier:(id)a3 decryptedBarcodeCredential:(id)a4 error:(id)a5
{
  id v8;
  id v9;
  id v10;
  NPKPaymentBarcode *v11;
  void *v12;
  NSObject *v13;
  _BOOL4 v14;
  NSObject *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  char v19;
  void *v20;
  void *v21;
  int v22;
  void *v23;
  __int16 v24;
  NPKPaymentBarcode *v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v8 = a5;
  v9 = a4;
  v10 = a3;
  dispatch_assert_queue_V2(MEMORY[0x24BDAC9B8]);
  v11 = -[NPKPaymentBarcode initWithBarcodeIdentifier:decryptedBarcodeCredential:error:]([NPKPaymentBarcode alloc], "initWithBarcodeIdentifier:decryptedBarcodeCredential:error:", v10, v9, v8);

  -[NPKBarcodePaymentSession currentPaymentBarcode](self, "currentPaymentBarcode");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v8) = objc_msgSend(v12, "isEqual:", v11);

  pk_Payment_log();
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT);

  if ((v8 & 1) != 0)
  {
    if (v14)
    {
      pk_Payment_log();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v22) = 0;
        _os_log_impl(&dword_213518000, v15, OS_LOG_TYPE_DEFAULT, "Notice: [BarcodePayment] Barcode state didn't change.", (uint8_t *)&v22, 2u);
      }

    }
  }
  else
  {
    if (v14)
    {
      pk_Payment_log();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        -[NPKBarcodePaymentSession currentPaymentBarcode](self, "currentPaymentBarcode");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = 138412546;
        v23 = v17;
        v24 = 2112;
        v25 = v11;
        _os_log_impl(&dword_213518000, v16, OS_LOG_TYPE_DEFAULT, "Notice: [BarcodePayment] Updating barcode state from %@ to %@", (uint8_t *)&v22, 0x16u);

      }
    }
    -[NPKBarcodePaymentSession setCurrentPaymentBarcode:](self, "setCurrentPaymentBarcode:", v11);
    -[NPKBarcodePaymentSession delegate](self, "delegate");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_opt_respondsToSelector();

    if ((v19 & 1) != 0)
    {
      -[NPKBarcodePaymentSession delegate](self, "delegate");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[NPKBarcodePaymentSession currentPaymentBarcode](self, "currentPaymentBarcode");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "barcodePaymentSession:didReceivePaymentBarcode:", self, v21);

    }
    if (-[NPKPaymentBarcode state](v11, "state") == 1)
    {
      -[NPKBarcodePaymentSession _insertPaymentTransactionForActiveBarcode](self, "_insertPaymentTransactionForActiveBarcode");
      -[NPKBarcodePaymentSession _invokeExtensionToCollectPaymentInformation](self, "_invokeExtensionToCollectPaymentInformation");
    }
  }

}

- (void)_handleUpdatedPaymentTransaction:(id)a3
{
  id v4;
  NSObject *v5;
  _BOOL4 v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  int ShouldAuthenticateForMechanism;
  NSObject *v15;
  _BOOL4 v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  _QWORD v26[2];
  uint64_t v27;
  uint64_t v28;
  _QWORD v29[2];
  uint8_t buf[4];
  id v31;
  __int16 v32;
  void *v33;
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  dispatch_assert_queue_V2(MEMORY[0x24BDAC9B8]);
  switch(objc_msgSend(v4, "transactionStatus"))
  {
    case -1:
    case 8:
      pk_Payment_log();
      v5 = objc_claimAutoreleasedReturnValue();
      v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);

      if (!v6)
        goto LABEL_6;
      pk_Payment_log();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v4, "transactionStatus");
        PKPaymentTransactionStatusToString();
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v31 = v4;
        v32 = 2112;
        v33 = v8;
        _os_log_impl(&dword_213518000, v7, OS_LOG_TYPE_DEFAULT, "Notice: [BarcodePayment] PKPaymentTransaction %@ status %@ is not relevant. Skipping.", buf, 0x16u);

      }
      goto LABEL_5;
    case 0:
      ShouldAuthenticateForMechanism = PKPaymentTransactionShouldAuthenticateForMechanism();
      pk_Payment_log();
      v15 = objc_claimAutoreleasedReturnValue();
      v16 = os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT);

      if (ShouldAuthenticateForMechanism)
      {
        if (v16)
        {
          pk_Payment_log();
          v17 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
          {
            objc_msgSend(v4, "authenticationContext");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v18, "requestedAuthenticationMechanisms");
            PKTransactionAuthenticationMechanismToStrings();
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412546;
            v31 = v4;
            v32 = 2112;
            v33 = v19;
            _os_log_impl(&dword_213518000, v17, OS_LOG_TYPE_DEFAULT, "Notice: [BarcodePayment] PKPaymentTransaction %@ status is pending with authentication request %@.", buf, 0x16u);

          }
        }
        -[NPKBarcodePaymentSession _processedAuthenticationMechanismForTransaction:](self, "_processedAuthenticationMechanismForTransaction:", v4);
        v9 = 1;
      }
      else
      {
        if (v16)
        {
          pk_Payment_log();
          v7 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v31 = v4;
            _os_log_impl(&dword_213518000, v7, OS_LOG_TYPE_DEFAULT, "Notice: [BarcodePayment] PKPaymentTransaction %@ status is pending without valid authentication context. Skipping.", buf, 0xCu);
          }
LABEL_5:

        }
LABEL_6:
        v9 = 0;
      }
LABEL_18:
      -[NPKBarcodePaymentSession _updateCurrentTransactionStatus:transaction:](self, "_updateCurrentTransactionStatus:transaction:", v9, v4);

      return;
    case 1:
      v20 = (void *)MEMORY[0x24BE6E9C8];
      v21 = *MEMORY[0x24BE6F178];
      v29[0] = *MEMORY[0x24BE6F158];
      v29[1] = v21;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v29, 2);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = *MEMORY[0x24BE6F018];
      v28 = *MEMORY[0x24BE6F058];
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v28, &v27, 1);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "subjects:sendEvent:", v22, v23);

      goto LABEL_16;
    case 2:
    case 6:
      v10 = (void *)MEMORY[0x24BE6E9C8];
      v11 = *MEMORY[0x24BE6F178];
      v26[0] = *MEMORY[0x24BE6F158];
      v26[1] = v11;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v26, 2);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = *MEMORY[0x24BE6F018];
      v25 = *MEMORY[0x24BE6F060];
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v25, &v24, 1);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "subjects:sendEvent:", v12, v13);

      goto LABEL_8;
    case 3:
LABEL_16:
      v9 = 4;
      goto LABEL_18;
    case 4:
    case 5:
LABEL_8:
      v9 = 3;
      goto LABEL_18;
    case 7:
      v9 = 5;
      goto LABEL_18;
    default:
      goto LABEL_6;
  }
}

- (void)_handleUpdatedTransactionStatus:(unint64_t)a3
{
  id v5;

  dispatch_assert_queue_V2(MEMORY[0x24BDAC9B8]);
  -[NPKBarcodePaymentSession currentTransaction](self, "currentTransaction");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[NPKBarcodePaymentSession _updateCurrentTransactionStatus:transaction:](self, "_updateCurrentTransactionStatus:transaction:", a3, v5);

}

- (void)_updateCurrentTransactionStatus:(unint64_t)a3 transaction:(id)a4
{
  id v6;
  void *v7;
  char v8;
  NSObject *v9;
  _BOOL4 v10;
  NSObject *v11;
  NSObject *v12;
  _BOOL4 v13;
  NSObject *v14;
  void *v15;
  char v16;
  void *v17;
  int v18;
  unint64_t v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  dispatch_assert_queue_V2(MEMORY[0x24BDAC9B8]);
  if (-[NPKBarcodePaymentSession currentTransactionStatus](self, "currentTransactionStatus") != a3
    || (-[NPKBarcodePaymentSession currentTransaction](self, "currentTransaction"),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        v8 = PKEqualObjects(),
        v7,
        (v8 & 1) == 0))
  {
    pk_Payment_log();
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);

    if (v10)
    {
      pk_Payment_log();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        v18 = 134218242;
        v19 = a3;
        v20 = 2112;
        v21 = v6;
        _os_log_impl(&dword_213518000, v11, OS_LOG_TYPE_DEFAULT, "Notice: [BarcodePayment] Session status is updated to %lu with transaction %@.", (uint8_t *)&v18, 0x16u);
      }

    }
    -[NPKBarcodePaymentSession setCurrentTransactionStatus:](self, "setCurrentTransactionStatus:", a3);
    -[NPKBarcodePaymentSession setCurrentTransaction:](self, "setCurrentTransaction:", v6);
    if (a3 == 1)
    {
      pk_Payment_log();
      v12 = objc_claimAutoreleasedReturnValue();
      v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);

      if (v13)
      {
        pk_Payment_log();
        v14 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v18) = 0;
          _os_log_impl(&dword_213518000, v14, OS_LOG_TYPE_DEFAULT, "Notice: [BarcodePayment] Session timeout timer is extended because transaction authentication is requested.", (uint8_t *)&v18, 2u);
        }

      }
      -[NPKBarcodePaymentSession _extendSessionTimeoutTimer](self, "_extendSessionTimeoutTimer");
    }
    -[NPKBarcodePaymentSession delegate](self, "delegate");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_opt_respondsToSelector();

    if ((v16 & 1) != 0)
    {
      -[NPKBarcodePaymentSession delegate](self, "delegate");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "barcodePaymentSession:didUpdateTransactionStatus:withTransaction:", self, a3, v6);

    }
  }

}

- (void)_insertPaymentTransactionForActiveBarcode
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BE6ED80], "paymentTransactionWithSource:", 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setOriginatedByDevice:", 1);
  -[NPKBarcodePaymentSession currentPaymentBarcode](self, "currentPaymentBarcode");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "barcodeIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  PKTransactionPaymentHashForBarcodeIdentifier();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setPaymentHash:", v6);

  objc_msgSend(v3, "addUpdateReasons:", 0x20000);
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setTransactionDate:", v7);

  pk_Payment_log();
  v8 = objc_claimAutoreleasedReturnValue();
  LODWORD(v5) = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);

  if ((_DWORD)v5)
  {
    pk_Payment_log();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      -[NPKBarcodePaymentSession currentPaymentBarcode](self, "currentPaymentBarcode");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "barcodeIdentifier");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = 138412546;
      v18 = v3;
      v19 = 2112;
      v20 = v11;
      _os_log_impl(&dword_213518000, v9, OS_LOG_TYPE_DEFAULT, "Notice: [BarcodePayment] Inserting transaction %@ for current barcode: %@", (uint8_t *)&v17, 0x16u);

    }
  }
  -[NPKBarcodePaymentSession paymentService](self, "paymentService");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPKBarcodePaymentSession paymentPass](self, "paymentPass");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "uniqueID");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPKBarcodePaymentSession paymentPass](self, "paymentPass");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "devicePrimaryBarcodePaymentApplication");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "insertOrUpdatePaymentTransaction:forPassUniqueIdentifier:paymentApplication:completion:", v3, v14, v16, 0);

}

- (void)_processedAuthenticationMechanismForTransaction:(id)a3
{
  id v4;
  void *v5;
  char v6;
  uint64_t v7;
  void *v8;
  void *v9;
  _QWORD v10[4];
  id v11;
  uint64_t v12;

  v4 = a3;
  objc_msgSend(v4, "authenticationContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "requestedAuthenticationMechanisms");

  if ((v6 & 8) != 0)
  {
    -[NPKBarcodePaymentSession _completedAuthenticationForTransaction:](self, "_completedAuthenticationForTransaction:", v4);
  }
  else
  {
    if ((v6 & 1) != 0)
    {
      v7 = 1;
      goto LABEL_7;
    }
    if ((v6 & 4) != 0)
    {
      v7 = 4;
LABEL_7:
      -[NPKBarcodePaymentSession paymentService](self, "paymentService");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "identifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10[0] = MEMORY[0x24BDAC760];
      v10[1] = 3221225472;
      v10[2] = __76__NPKBarcodePaymentSession__processedAuthenticationMechanismForTransaction___block_invoke;
      v10[3] = &unk_24CFE8238;
      v12 = v7;
      v11 = v4;
      objc_msgSend(v8, "processedAuthenticationMechanism:forTransactionIdentifier:completion:", v7, v9, v10);

    }
  }

}

void __76__NPKBarcodePaymentSession__processedAuthenticationMechanismForTransaction___block_invoke(uint64_t a1)
{
  NSObject *v2;
  _BOOL4 v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  int v7;
  void *v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  pk_Payment_log();
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT);

  if (v3)
  {
    pk_Payment_log();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      PKTransactionAuthenticationMechanismToStrings();
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = *(_QWORD *)(a1 + 32);
      v7 = 138412546;
      v8 = v5;
      v9 = 2112;
      v10 = v6;
      _os_log_impl(&dword_213518000, v4, OS_LOG_TYPE_DEFAULT, "Notice: [BarcodePayment] Marking processed %@ for transaction %@.", (uint8_t *)&v7, 0x16u);

    }
  }
}

- (void)_completedAuthenticationForTransaction:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  -[NPKBarcodePaymentSession paymentService](self, "paymentService");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPKBarcodePaymentSession currentTransaction](self, "currentTransaction");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __67__NPKBarcodePaymentSession__completedAuthenticationForTransaction___block_invoke;
  v9[3] = &unk_24CFE7998;
  v10 = v4;
  v8 = v4;
  objc_msgSend(v5, "markAuthenticationCompleteForTransactionIdentifier:completion:", v7, v9);

}

void __67__NPKBarcodePaymentSession__completedAuthenticationForTransaction___block_invoke(uint64_t a1)
{
  NSObject *v2;
  _BOOL4 v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  pk_Payment_log();
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT);

  if (v3)
  {
    pk_Payment_log();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5 = *(_QWORD *)(a1 + 32);
      v6 = 138412290;
      v7 = v5;
      _os_log_impl(&dword_213518000, v4, OS_LOG_TYPE_DEFAULT, "Notice: [BarcodePayment] Marking completed authentication for transaction %@.", (uint8_t *)&v6, 0xCu);
    }

  }
}

- (void)_acquireNotificationSuppressionAssertion
{
  void *v2;
  _QWORD v3[4];
  id v4;
  id location;

  objc_initWeak(&location, self);
  v2 = (void *)MEMORY[0x24BE6EA10];
  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __68__NPKBarcodePaymentSession__acquireNotificationSuppressionAssertion__block_invoke;
  v3[3] = &unk_24CFEEA58;
  objc_copyWeak(&v4, &location);
  objc_msgSend(v2, "acquireAssertionOfType:withReason:completion:", 4, CFSTR("Barcode Payment"), v3);
  objc_destroyWeak(&v4);
  objc_destroyWeak(&location);
}

void __68__NPKBarcodePaymentSession__acquireNotificationSuppressionAssertion__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  id v8;
  _QWORD block[4];
  id v10;
  id v11;
  id v12;

  v5 = a2;
  v6 = a3;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __68__NPKBarcodePaymentSession__acquireNotificationSuppressionAssertion__block_invoke_2;
  block[3] = &unk_24CFE8650;
  objc_copyWeak(&v12, (id *)(a1 + 32));
  v10 = v5;
  v11 = v6;
  v7 = v6;
  v8 = v5;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

  objc_destroyWeak(&v12);
}

void __68__NPKBarcodePaymentSession__acquireNotificationSuppressionAssertion__block_invoke_2(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  _BOOL4 v4;
  NSObject *v5;
  NSObject *v6;
  _BOOL4 v7;
  NSObject *v8;
  uint64_t v9;
  NSObject *v10;
  _BOOL4 v11;
  NSObject *v12;
  uint64_t v13;
  _BOOL4 v14;
  NSObject *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  _QWORD v20[4];
  id v21;
  uint8_t buf[4];
  uint64_t v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v2 = (id *)(a1 + 48);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (!WeakRetained)
  {
    pk_Payment_log();
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);

    if (v11)
    {
      pk_Payment_log();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        v13 = *(_QWORD *)(a1 + 32);
        *(_DWORD *)buf = 138412290;
        v23 = v13;
        _os_log_impl(&dword_213518000, v12, OS_LOG_TYPE_DEFAULT, "Notice: [BarcodePayment] Session is invalid, releasing assertion %@", buf, 0xCu);
      }

    }
    goto LABEL_7;
  }
  v4 = *(_QWORD *)(a1 + 40) == 0;
  pk_Payment_log();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (!v4)
  {
    v7 = os_log_type_enabled(v5, OS_LOG_TYPE_ERROR);

    if (v7)
    {
      pk_Payment_log();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        v9 = *(_QWORD *)(a1 + 40);
        *(_DWORD *)buf = 138412290;
        v23 = v9;
        _os_log_impl(&dword_213518000, v8, OS_LOG_TYPE_ERROR, "Error: [BarcodePayment] Error acquiring notification suppression assertion: %@", buf, 0xCu);
      }

    }
LABEL_7:
    objc_msgSend(*(id *)(a1 + 32), "invalidate");
    goto LABEL_18;
  }
  v14 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);

  if (v14)
  {
    pk_Payment_log();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      v16 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138412290;
      v23 = v16;
      _os_log_impl(&dword_213518000, v15, OS_LOG_TYPE_DEFAULT, "Notice: [BarcodePayment] Acquired notification suppression assertion: %@", buf, 0xCu);
    }

  }
  objc_msgSend(WeakRetained, "notificationSuppressionAssertion");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setInvalidationHandler:", 0);

  objc_msgSend(WeakRetained, "notificationSuppressionAssertion");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "invalidate");

  objc_msgSend(WeakRetained, "setNotificationSuppressionAssertion:", *(_QWORD *)(a1 + 32));
  v19 = *(void **)(a1 + 32);
  v20[0] = MEMORY[0x24BDAC760];
  v20[1] = 3221225472;
  v20[2] = __68__NPKBarcodePaymentSession__acquireNotificationSuppressionAssertion__block_invoke_81;
  v20[3] = &unk_24CFE7970;
  objc_copyWeak(&v21, v2);
  objc_msgSend(v19, "setInvalidationHandler:", v20);
  objc_destroyWeak(&v21);
LABEL_18:

}

void __68__NPKBarcodePaymentSession__acquireNotificationSuppressionAssertion__block_invoke_81(uint64_t a1)
{
  id WeakRetained;
  id v3;

  dispatch_assert_queue_V2(MEMORY[0x24BDAC9B8]);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    objc_msgSend(WeakRetained, "setNotificationSuppressionAssertion:", 0);
    WeakRetained = v3;
  }

}

- (void)_releaseNotificationSuppressionAssertion
{
  NSObject *v3;
  _BOOL4 v4;
  NSObject *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  pk_Payment_log();
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);

  if (v4)
  {
    pk_Payment_log();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      -[NPKBarcodePaymentSession notificationSuppressionAssertion](self, "notificationSuppressionAssertion");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = 138412290;
      v9 = v6;
      _os_log_impl(&dword_213518000, v5, OS_LOG_TYPE_DEFAULT, "Notice: [BarcodePayment] Released notification suppression assertion: %@", (uint8_t *)&v8, 0xCu);

    }
  }
  -[NPKBarcodePaymentSession notificationSuppressionAssertion](self, "notificationSuppressionAssertion");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "invalidate");

  -[NPKBarcodePaymentSession setNotificationSuppressionAssertion:](self, "setNotificationSuppressionAssertion:", 0);
}

- (void)_acquireExpressTransactionSuppressAssertion
{
  void *v2;
  _QWORD v3[4];
  id v4;
  id location;

  objc_initWeak(&location, self);
  v2 = (void *)MEMORY[0x24BE6EA10];
  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __71__NPKBarcodePaymentSession__acquireExpressTransactionSuppressAssertion__block_invoke;
  v3[3] = &unk_24CFEEA58;
  objc_copyWeak(&v4, &location);
  objc_msgSend(v2, "acquireAssertionOfType:withReason:completion:", 0, CFSTR("Barcode Payment"), v3);
  objc_destroyWeak(&v4);
  objc_destroyWeak(&location);
}

void __71__NPKBarcodePaymentSession__acquireExpressTransactionSuppressAssertion__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  id v8;
  _QWORD block[4];
  id v10;
  id v11;
  id v12;

  v5 = a2;
  v6 = a3;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __71__NPKBarcodePaymentSession__acquireExpressTransactionSuppressAssertion__block_invoke_2;
  block[3] = &unk_24CFE8650;
  objc_copyWeak(&v12, (id *)(a1 + 32));
  v10 = v5;
  v11 = v6;
  v7 = v6;
  v8 = v5;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

  objc_destroyWeak(&v12);
}

void __71__NPKBarcodePaymentSession__acquireExpressTransactionSuppressAssertion__block_invoke_2(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  _BOOL4 v4;
  NSObject *v5;
  NSObject *v6;
  _BOOL4 v7;
  NSObject *v8;
  uint64_t v9;
  NSObject *v10;
  _BOOL4 v11;
  NSObject *v12;
  uint64_t v13;
  _BOOL4 v14;
  NSObject *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  _QWORD v20[4];
  id v21;
  uint8_t buf[4];
  uint64_t v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v2 = (id *)(a1 + 48);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (!WeakRetained)
  {
    pk_Payment_log();
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);

    if (v11)
    {
      pk_Payment_log();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        v13 = *(_QWORD *)(a1 + 32);
        *(_DWORD *)buf = 138412290;
        v23 = v13;
        _os_log_impl(&dword_213518000, v12, OS_LOG_TYPE_DEFAULT, "Notice: [BarcodePayment] Session is invalid, releasing assertion %@", buf, 0xCu);
      }

    }
    goto LABEL_7;
  }
  v4 = *(_QWORD *)(a1 + 40) == 0;
  pk_Payment_log();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (!v4)
  {
    v7 = os_log_type_enabled(v5, OS_LOG_TYPE_ERROR);

    if (v7)
    {
      pk_Payment_log();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        v9 = *(_QWORD *)(a1 + 40);
        *(_DWORD *)buf = 138412290;
        v23 = v9;
        _os_log_impl(&dword_213518000, v8, OS_LOG_TYPE_ERROR, "Error: [BarcodePayment] Error acquiring express transaction suppression assertion: %@", buf, 0xCu);
      }

    }
LABEL_7:
    objc_msgSend(*(id *)(a1 + 32), "invalidate");
    goto LABEL_18;
  }
  v14 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);

  if (v14)
  {
    pk_Payment_log();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      v16 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138412290;
      v23 = v16;
      _os_log_impl(&dword_213518000, v15, OS_LOG_TYPE_DEFAULT, "Notice: [BarcodePayment] Acquired express transaction suppression assertion: %@", buf, 0xCu);
    }

  }
  objc_msgSend(WeakRetained, "expressTransactionSuppressionAssertion");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setInvalidationHandler:", 0);

  objc_msgSend(WeakRetained, "expressTransactionSuppressionAssertion");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "invalidate");

  objc_msgSend(WeakRetained, "setExpressTransactionSuppressionAssertion:", *(_QWORD *)(a1 + 32));
  v19 = *(void **)(a1 + 32);
  v20[0] = MEMORY[0x24BDAC760];
  v20[1] = 3221225472;
  v20[2] = __71__NPKBarcodePaymentSession__acquireExpressTransactionSuppressAssertion__block_invoke_83;
  v20[3] = &unk_24CFE7970;
  objc_copyWeak(&v21, v2);
  objc_msgSend(v19, "setInvalidationHandler:", v20);
  objc_destroyWeak(&v21);
LABEL_18:

}

void __71__NPKBarcodePaymentSession__acquireExpressTransactionSuppressAssertion__block_invoke_83(uint64_t a1)
{
  id WeakRetained;
  id v3;

  dispatch_assert_queue_V2(MEMORY[0x24BDAC9B8]);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    objc_msgSend(WeakRetained, "setExpressTransactionSuppressionAssertion:", 0);
    WeakRetained = v3;
  }

}

- (void)_releaseExpressTransactionSuppressionAssertion
{
  NSObject *v3;
  _BOOL4 v4;
  NSObject *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  pk_Payment_log();
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);

  if (v4)
  {
    pk_Payment_log();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      -[NPKBarcodePaymentSession expressTransactionSuppressionAssertion](self, "expressTransactionSuppressionAssertion");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = 138412290;
      v9 = v6;
      _os_log_impl(&dword_213518000, v5, OS_LOG_TYPE_DEFAULT, "Notice: [BarcodePayment] Released express transaction suppression assertion: %@", (uint8_t *)&v8, 0xCu);

    }
  }
  -[NPKBarcodePaymentSession expressTransactionSuppressionAssertion](self, "expressTransactionSuppressionAssertion");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "invalidate");

  -[NPKBarcodePaymentSession setExpressTransactionSuppressionAssertion:](self, "setExpressTransactionSuppressionAssertion:", 0);
}

- (void)_startSessionTimeoutTimer
{
  void *v3;
  NSObject *v4;
  dispatch_source_t v5;
  NSObject *v6;
  dispatch_time_t v7;
  NSObject *v8;
  NSObject *v9;
  _QWORD handler[5];
  id v11;
  id location;

  -[NPKBarcodePaymentSession sessionTimeoutTimer](self, "sessionTimeoutTimer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    objc_initWeak(&location, self);
    dispatch_get_global_queue(21, 0);
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = dispatch_source_create(MEMORY[0x24BDACA18], 0, 0, v4);
    -[NPKBarcodePaymentSession setSessionTimeoutTimer:](self, "setSessionTimeoutTimer:", v5);

    -[NPKBarcodePaymentSession sessionTimeoutTimer](self, "sessionTimeoutTimer");
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = dispatch_time(0, 0xDF8476000);
    dispatch_source_set_timer(v6, v7, 0xFFFFFFFFFFFFFFFFLL, 0);

    -[NPKBarcodePaymentSession sessionTimeoutTimer](self, "sessionTimeoutTimer");
    v8 = objc_claimAutoreleasedReturnValue();
    handler[0] = MEMORY[0x24BDAC760];
    handler[1] = 3221225472;
    handler[2] = __53__NPKBarcodePaymentSession__startSessionTimeoutTimer__block_invoke;
    handler[3] = &unk_24CFE7BA8;
    objc_copyWeak(&v11, &location);
    handler[4] = self;
    dispatch_source_set_event_handler(v8, handler);

    -[NPKBarcodePaymentSession sessionTimeoutTimer](self, "sessionTimeoutTimer");
    v9 = objc_claimAutoreleasedReturnValue();
    dispatch_resume(v9);

    objc_destroyWeak(&v11);
    objc_destroyWeak(&location);
  }
}

void __53__NPKBarcodePaymentSession__startSessionTimeoutTimer__block_invoke(uint64_t a1)
{
  id WeakRetained;
  _QWORD block[5];

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __53__NPKBarcodePaymentSession__startSessionTimeoutTimer__block_invoke_2;
    block[3] = &unk_24CFE7998;
    block[4] = *(_QWORD *)(a1 + 32);
    dispatch_async(MEMORY[0x24BDAC9B8], block);
  }

}

uint64_t __53__NPKBarcodePaymentSession__startSessionTimeoutTimer__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleSessionTimeout");
}

- (void)_stopSessionTimeoutTimer
{
  void *v3;
  NSObject *v4;

  -[NPKBarcodePaymentSession sessionTimeoutTimer](self, "sessionTimeoutTimer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[NPKBarcodePaymentSession sessionTimeoutTimer](self, "sessionTimeoutTimer");
    v4 = objc_claimAutoreleasedReturnValue();
    dispatch_source_cancel(v4);

    -[NPKBarcodePaymentSession setSessionTimeoutTimer:](self, "setSessionTimeoutTimer:", 0);
  }
}

- (void)_extendSessionTimeoutTimer
{
  -[NPKBarcodePaymentSession _stopSessionTimeoutTimer](self, "_stopSessionTimeoutTimer");
  -[NPKBarcodePaymentSession _startSessionTimeoutTimer](self, "_startSessionTimeoutTimer");
}

- (void)_handleSessionTimeout
{
  dispatch_assert_queue_V2(MEMORY[0x24BDAC9B8]);
  -[NPKBarcodePaymentSession _handleUpdatedTransactionStatus:](self, "_handleUpdatedTransactionStatus:", 5);
  -[NPKBarcodePaymentSession invalidateSession](self, "invalidateSession");
}

- (NPKBarcodePaymentSessionDelegate)delegate
{
  return (NPKBarcodePaymentSessionDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BOOL)sessionStarted
{
  return self->_sessionStarted;
}

- (void)setSessionStarted:(BOOL)a3
{
  self->_sessionStarted = a3;
}

- (NPKPaymentBarcode)currentPaymentBarcode
{
  return self->_currentPaymentBarcode;
}

- (void)setCurrentPaymentBarcode:(id)a3
{
  objc_storeStrong((id *)&self->_currentPaymentBarcode, a3);
}

- (unint64_t)currentTransactionStatus
{
  return self->_currentTransactionStatus;
}

- (void)setCurrentTransactionStatus:(unint64_t)a3
{
  self->_currentTransactionStatus = a3;
}

- (PKPaymentTransaction)currentTransaction
{
  return self->_currentTransaction;
}

- (void)setCurrentTransaction:(id)a3
{
  objc_storeStrong((id *)&self->_currentTransaction, a3);
}

- (PKPaymentPass)paymentPass
{
  return self->_paymentPass;
}

- (BOOL)submittingAuthenticationResult
{
  return self->_submittingAuthenticationResult;
}

- (void)setSubmittingAuthenticationResult:(BOOL)a3
{
  self->_submittingAuthenticationResult = a3;
}

- (NSData)authorizationCredential
{
  return self->_authorizationCredential;
}

- (void)setAuthorizationCredential:(id)a3
{
  objc_storeStrong((id *)&self->_authorizationCredential, a3);
}

- (PKPaymentService)paymentService
{
  return self->_paymentService;
}

- (void)setPaymentService:(id)a3
{
  objc_storeStrong((id *)&self->_paymentService, a3);
}

- (OS_dispatch_source)sessionTimeoutTimer
{
  return self->_sessionTimeoutTimer;
}

- (void)setSessionTimeoutTimer:(id)a3
{
  objc_storeStrong((id *)&self->_sessionTimeoutTimer, a3);
}

- (PKAssertion)notificationSuppressionAssertion
{
  return self->_notificationSuppressionAssertion;
}

- (void)setNotificationSuppressionAssertion:(id)a3
{
  objc_storeStrong((id *)&self->_notificationSuppressionAssertion, a3);
}

- (PKAssertion)expressTransactionSuppressionAssertion
{
  return self->_expressTransactionSuppressionAssertion;
}

- (void)setExpressTransactionSuppressionAssertion:(id)a3
{
  objc_storeStrong((id *)&self->_expressTransactionSuppressionAssertion, a3);
}

- (OS_dispatch_queue)serialQueue
{
  return self->_serialQueue;
}

- (void)setSerialQueue:(id)a3
{
  objc_storeStrong((id *)&self->_serialQueue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serialQueue, 0);
  objc_storeStrong((id *)&self->_expressTransactionSuppressionAssertion, 0);
  objc_storeStrong((id *)&self->_notificationSuppressionAssertion, 0);
  objc_storeStrong((id *)&self->_sessionTimeoutTimer, 0);
  objc_storeStrong((id *)&self->_paymentService, 0);
  objc_storeStrong((id *)&self->_authorizationCredential, 0);
  objc_storeStrong((id *)&self->_paymentPass, 0);
  objc_storeStrong((id *)&self->_currentTransaction, 0);
  objc_storeStrong((id *)&self->_currentPaymentBarcode, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
