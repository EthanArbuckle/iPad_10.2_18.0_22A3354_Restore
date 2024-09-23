@implementation NPKContactlessPaymentSessionManager

- (NPKContactlessPaymentSessionManager)init
{
  id v2;
  NPKObserverManager *v3;
  void *v4;
  NPKQuickPaymentSessionCleanupDelegate *v5;
  void *v6;
  NSObject *v7;
  dispatch_source_t v8;
  void *v9;
  NSObject *v10;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(uint64_t);
  void *v15;
  id v16;
  id location;
  objc_super v18;

  v18.receiver = self;
  v18.super_class = (Class)NPKContactlessPaymentSessionManager;
  v2 = -[NPKContactlessPaymentSessionManager init](&v18, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(NPKObserverManager);
    v4 = (void *)*((_QWORD *)v2 + 6);
    *((_QWORD *)v2 + 6) = v3;

    v5 = objc_alloc_init(NPKQuickPaymentSessionCleanupDelegate);
    v6 = (void *)*((_QWORD *)v2 + 5);
    *((_QWORD *)v2 + 5) = v5;

    objc_initWeak(&location, v2);
    dispatch_get_global_queue(0, 0);
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = dispatch_source_create(MEMORY[0x24BDACA18], 0, 0, v7);
    v9 = (void *)*((_QWORD *)v2 + 8);
    *((_QWORD *)v2 + 8) = v8;

    v10 = *((_QWORD *)v2 + 8);
    v12 = MEMORY[0x24BDAC760];
    v13 = 3221225472;
    v14 = __43__NPKContactlessPaymentSessionManager_init__block_invoke;
    v15 = &unk_24CFE7970;
    objc_copyWeak(&v16, &location);
    dispatch_source_set_event_handler(v10, &v12);
    dispatch_resume(*((dispatch_object_t *)v2 + 8));
    objc_msgSend(v2, "_registerForServiceModeRequestNotification", v12, v13, v14, v15);
    objc_destroyWeak(&v16);
    objc_destroyWeak(&location);
  }
  return (NPKContactlessPaymentSessionManager *)v2;
}

void __43__NPKContactlessPaymentSessionManager_init__block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  _QWORD block[4];
  id v4;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __43__NPKContactlessPaymentSessionManager_init__block_invoke_2;
    block[3] = &unk_24CFE7998;
    v4 = WeakRetained;
    dispatch_async(MEMORY[0x24BDAC9B8], block);

  }
}

uint64_t __43__NPKContactlessPaymentSessionManager_init__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleSessionTimerFired");
}

- (void)handleContactlessPaymentSession:(id)a3 authenticationExpected:(BOOL)a4
{
  _BOOL8 v4;
  id v7;
  NSObject *v8;
  _BOOL4 v9;
  NSObject *v10;
  NSObject *v11;
  _BOOL4 v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  NPKContactlessPaymentSessionState *lastSessionState;
  NSData *credential;
  PKPass *v21;
  PKPass *userSelectedPass;
  void *v23;
  int v24;
  id v25;
  uint64_t v26;

  v4 = a4;
  v26 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  pk_Payment_log();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);

  if (v9)
  {
    pk_Payment_log();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v24 = 138412290;
      v25 = v7;
      _os_log_impl(&dword_213518000, v10, OS_LOG_TYPE_DEFAULT, "Notice: [PaymentSessionManager] Handling new contactless payment session: %@", (uint8_t *)&v24, 0xCu);
    }

  }
  -[NPKContactlessPaymentSessionManager _cleanupBarcodePaymentSession](self, "_cleanupBarcodePaymentSession");
  -[NPKContactlessPaymentSessionManager _cleanupQuickPaymentSession](self, "_cleanupQuickPaymentSession");
  objc_storeStrong((id *)&self->_quickPaymentSession, a3);
  pk_Payment_log();
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);

  if (v12)
  {
    pk_Payment_log();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      v24 = 138412290;
      v25 = v7;
      _os_log_impl(&dword_213518000, v13, OS_LOG_TYPE_DEFAULT, "Notice: [PaymentSessionManager] did set new quick payment session: %@", (uint8_t *)&v24, 0xCu);
    }

  }
  -[NPKContactlessPaymentSessionState serviceModeRequestedPass](self->_lastSessionState, "serviceModeRequestedPass");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "uniqueID");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "currentPass");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "uniqueID");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v15, "isEqualToString:", v17);

  if (v18)
  {
    -[NPKQuickPaymentSession setInServiceMode:](self->_quickPaymentSession, "setInServiceMode:", 1);
    -[NPKContactlessPaymentSessionManager _handleServiceModeRequestEnded](self, "_handleServiceModeRequestEnded");
  }
  lastSessionState = self->_lastSessionState;
  self->_lastSessionState = 0;

  credential = self->_credential;
  self->_credential = 0;

  objc_msgSend(v7, "setDelegate:", self);
  objc_msgSend(v7, "currentPass");
  v21 = (PKPass *)objc_claimAutoreleasedReturnValue();
  if (!v21)
  {
    userSelectedPass = self->_userSelectedPass;
    if (userSelectedPass)
    {
      v21 = userSelectedPass;
      objc_msgSend(v7, "setCurrentPass:", v21);
    }
    else
    {
      v21 = 0;
    }
  }
  if (!self->_contactlessPaymentInterfaceVisible
    || (-[NPKContactlessPaymentSessionManager _startSessionTimerWithReason:](self, "_startSessionTimerWithReason:", 1),
        objc_msgSend(v7, "confirmSessionExpectingCredential:", v4),
        !self->_contactlessPaymentInterfaceVisible))
  {
    -[NPKContactlessPaymentSessionManager _startSessionTimerWithReason:](self, "_startSessionTimerWithReason:", 0);
  }
  -[NPKContactlessPaymentSessionManager _baseSessionStateForUpdate](self, "_baseSessionStateForUpdate");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setCurrentPass:", v21);
  -[NPKContactlessPaymentSessionManager _sendSessionStateToObservers:](self, "_sendSessionStateToObservers:", v23);

}

- (void)handleDidPresentPasscodeAuthentication
{
  NSObject *v3;
  _BOOL4 v4;
  NSObject *v5;
  uint8_t v6[16];

  pk_Payment_log();
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);

  if (v4)
  {
    pk_Payment_log();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_213518000, v5, OS_LOG_TYPE_DEFAULT, "Notice: [PaymentSessionManager] Handling did present passcode Authentication", v6, 2u);
    }

  }
  -[NPKContactlessPaymentSessionManager _stopSessionTimer](self, "_stopSessionTimer");
}

- (void)handleContactlessPaymentInterfaceDidAppear
{
  NSObject *v3;
  _BOOL4 v4;
  NSObject *v5;
  uint8_t v6[16];

  pk_Payment_log();
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);

  if (v4)
  {
    pk_Payment_log();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_213518000, v5, OS_LOG_TYPE_DEFAULT, "Notice: [PaymentSessionManager] Handling contactless payment interface did appear", v6, 2u);
    }

  }
  self->_contactlessPaymentInterfaceVisible = 1;
  -[NPKContactlessPaymentSessionManager _startSessionTimerWithReason:](self, "_startSessionTimerWithReason:", 1);
  -[NPKQuickPaymentSession confirmSessionExpectingCredential:](self->_quickPaymentSession, "confirmSessionExpectingCredential:", -[NPKContactlessPaymentSessionState doublePressReceived](self->_lastSessionState, "doublePressReceived"));
  if (-[NPKContactlessPaymentSessionState contactlessInterfaceReady](self->_lastSessionState, "contactlessInterfaceReady"))
  {
    kdebug_trace();
  }
}

- (void)handleContactlessPaymentInterfaceDidDisappear
{
  void *v3;
  NSObject *v4;
  _BOOL4 v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  -[NPKContactlessPaymentSessionManager quickPaymentSession](self, "quickPaymentSession");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  pk_Payment_log();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);

  if (v5)
  {
    pk_Payment_log();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v10 = 138412290;
      v11 = v3;
      _os_log_impl(&dword_213518000, v6, OS_LOG_TYPE_DEFAULT, "Notice: [PaymentSessionManager] Handling contactless payment interface did disappear with session: %@", (uint8_t *)&v10, 0xCu);
    }

  }
  self->_contactlessPaymentInterfaceVisible = 0;
  if (v3)
  {
    -[NPKContactlessPaymentSessionManager _cleanupQuickPaymentSession](self, "_cleanupQuickPaymentSession");
    -[NPKContactlessPaymentSessionManager _sessionStateForTransactionContext:](self, "_sessionStateForTransactionContext:", 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setCompletionReason:", 1);
    -[NPKContactlessPaymentSessionManager _sendSessionStateToObservers:](self, "_sendSessionStateToObservers:", v7);

  }
  -[NPKContactlessPaymentSessionManager barcodePaymentSession](self, "barcodePaymentSession");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    -[NPKContactlessPaymentSessionManager _cleanupBarcodePaymentSession](self, "_cleanupBarcodePaymentSession");
    -[NPKContactlessPaymentSessionManager _sessionStateForTransactionContext:](self, "_sessionStateForTransactionContext:", 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setCompletionReason:", 1);
    -[NPKContactlessPaymentSessionManager _sendSessionStateToObservers:](self, "_sendSessionStateToObservers:", v9);

  }
}

- (void)handleCredential:(id)a3
{
  NSData *v4;
  NSObject *v5;
  _BOOL4 v6;
  NSObject *v7;
  NPKQuickPaymentSession *quickPaymentSession;
  NSData *credential;
  NSData *v10;
  int v11;
  NSData *v12;
  __int16 v13;
  NPKQuickPaymentSession *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v4 = (NSData *)a3;
  pk_Payment_log();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);

  if (v6)
  {
    pk_Payment_log();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      quickPaymentSession = self->_quickPaymentSession;
      v11 = 138412546;
      v12 = v4;
      v13 = 2112;
      v14 = quickPaymentSession;
      _os_log_impl(&dword_213518000, v7, OS_LOG_TYPE_DEFAULT, "Notice: [PaymentSessionManager] Handling credential: %@ with quickPaymentSession:%@", (uint8_t *)&v11, 0x16u);
    }

  }
  credential = self->_credential;
  self->_credential = v4;
  v10 = v4;

  -[NPKQuickPaymentSession setCredential:](self->_quickPaymentSession, "setCredential:", v10);
  if (self->_contactlessPaymentInterfaceVisible)
    -[NPKContactlessPaymentSessionManager _startSessionTimerWithReason:](self, "_startSessionTimerWithReason:", 1);
}

- (void)handleUserSelectedPass:(id)a3
{
  id v5;
  NSObject *v6;
  _BOOL4 v7;
  NSObject *v8;
  void *v9;
  PKPass **p_userSelectedPass;
  NSObject *v11;
  _BOOL4 v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  _BOOL4 v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  char v24;
  NSObject *v25;
  _BOOL4 v26;
  NSObject *v27;
  void *v28;
  void *v29;
  int v30;
  void *v31;
  __int16 v32;
  void *v33;
  __int16 v34;
  void *v35;
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  pk_Payment_log();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);

  if (v7)
  {
    pk_Payment_log();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v5, "uniqueID");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = 138412290;
      v31 = v9;
      _os_log_impl(&dword_213518000, v8, OS_LOG_TYPE_DEFAULT, "Notice: [PaymentSessionManager] Handling user selected pass: %@", (uint8_t *)&v30, 0xCu);

    }
  }
  p_userSelectedPass = &self->_userSelectedPass;
  -[PKPass isEqualToPassIncludingMetadata:](self->_userSelectedPass, "isEqualToPassIncludingMetadata:", v5);
  pk_Payment_log();
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);

  if (v12)
  {
    pk_Payment_log();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      -[PKPass uniqueID](*p_userSelectedPass, "uniqueID");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "uniqueID");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromBOOL();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = 138412802;
      v31 = v14;
      v32 = 2112;
      v33 = v15;
      v34 = 2112;
      v35 = v16;
      _os_log_impl(&dword_213518000, v13, OS_LOG_TYPE_DEFAULT, "Notice: [PaymentSessionManager] Is previous user selected pass (%@) equal to new pass (%@)? %@", (uint8_t *)&v30, 0x20u);

    }
  }
  objc_storeStrong((id *)&self->_userSelectedPass, a3);
  if (self->_quickPaymentSession)
  {
    pk_Payment_log();
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT);

    if (v18)
    {
      pk_Payment_log();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v30) = 0;
        _os_log_impl(&dword_213518000, v19, OS_LOG_TYPE_DEFAULT, "Notice: [PaymentSessionManager] Updating payment session with user selected pass", (uint8_t *)&v30, 2u);
      }

    }
    -[NPKQuickPaymentSession setInServiceMode:](self->_quickPaymentSession, "setInServiceMode:", 0);
    -[NPKQuickPaymentSession setCurrentPass:](self->_quickPaymentSession, "setCurrentPass:", v5);
  }
  -[NPKContactlessPaymentSessionState serviceModeRequestedPass](self->_lastSessionState, "serviceModeRequestedPass");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = v20;
  if (v20)
  {
    objc_msgSend(v20, "uniqueID");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPass uniqueID](*p_userSelectedPass, "uniqueID");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(v22, "isEqualToString:", v23);

    if ((v24 & 1) == 0)
    {
      pk_Payment_log();
      v25 = objc_claimAutoreleasedReturnValue();
      v26 = os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT);

      if (v26)
      {
        pk_Payment_log();
        v27 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(v21, "uniqueID");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          v30 = 138412290;
          v31 = v28;
          _os_log_impl(&dword_213518000, v27, OS_LOG_TYPE_DEFAULT, "Notice: [PaymentSessionManager] Clearing service mode requested pass %@", (uint8_t *)&v30, 0xCu);

        }
      }
      -[NPKContactlessPaymentSessionManager _baseSessionStateForUpdate](self, "_baseSessionStateForUpdate");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "setServiceModeRequestedPass:", 0);
      -[NPKContactlessPaymentSessionManager _sendSessionStateToObservers:](self, "_sendSessionStateToObservers:", v29);
      -[NPKContactlessPaymentSessionManager _handleServiceModeRequestEnded](self, "_handleServiceModeRequestEnded");

    }
  }

}

- (void)handleDoublePressReceivedAtDate:(id)a3
{
  id v4;
  NSObject *v5;
  _BOOL4 v6;
  NSObject *v7;
  void *v8;
  int v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
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
      v9 = 138412290;
      v10 = v4;
      _os_log_impl(&dword_213518000, v7, OS_LOG_TYPE_DEFAULT, "Notice: [PaymentSessionManager] handleDoublePressReceivedAtDate:%@", (uint8_t *)&v9, 0xCu);
    }

  }
  -[NPKContactlessPaymentSessionManager _baseSessionStateForUpdate](self, "_baseSessionStateForUpdate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setDoublePressReceived:", 1);
  objc_msgSend(v8, "setDoublePressTimestamp:", v4);
  -[NPKContactlessPaymentSessionManager _sendSessionStateToObservers:](self, "_sendSessionStateToObservers:", v8);

}

- (void)handleServiceModeRequestedForPass:(id)a3
{
  NPKQuickPaymentSession *quickPaymentSession;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  -[NPKContactlessPaymentSessionManager handleUserSelectedPass:](self, "handleUserSelectedPass:");
  quickPaymentSession = self->_quickPaymentSession;
  if (quickPaymentSession)
  {
    -[NPKQuickPaymentSession setInServiceMode:](quickPaymentSession, "setInServiceMode:", 1);
    -[NPKContactlessPaymentSessionManager _handleServiceModeRequestEnded](self, "_handleServiceModeRequestEnded");
  }
  -[NPKContactlessPaymentSessionManager _baseSessionStateForUpdate](self, "_baseSessionStateForUpdate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (!self->_quickPaymentSession)
    objc_msgSend(v5, "setServiceModeRequestedPass:", v7);
  -[NPKContactlessPaymentSessionManager _sendSessionStateToObservers:](self, "_sendSessionStateToObservers:", v6);

}

- (void)handleRKEActionRequestedForTileItem:(id)a3 pass:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, _QWORD);
  NSObject *v11;
  _BOOL4 v12;
  NSObject *v13;
  NSObject *v14;
  void *v15;
  uint64_t v16;
  _BOOL4 v17;
  NSObject *v18;
  id v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  NSObject *v25;
  _BOOL4 v26;
  NSObject *v27;
  NSObject *v28;
  _BOOL4 v29;
  NSObject *v30;
  void *v31;
  void *v32;
  id v33;
  id v34;
  id v35;
  uint8_t buf[4];
  id v37;
  __int16 v38;
  NSObject *v39;
  __int16 v40;
  id v41;
  __int16 v42;
  id v43;
  uint64_t v44;

  v44 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, _QWORD))a5;
  pk_Payment_log();
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);

  if (v12)
  {
    pk_Payment_log();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v9, "uniqueID");
      v14 = objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v37 = v8;
      v38 = 2112;
      v39 = v14;
      _os_log_impl(&dword_213518000, v13, OS_LOG_TYPE_DEFAULT, "Notice: [PaymentSessionManager] Handling tile requested for item: %@ pass: %@", buf, 0x16u);

    }
  }
  objc_msgSend(v8, "action");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "type");

  if (v16 == 4)
  {
    v34 = 0;
    v35 = 0;
    v33 = 0;
    v17 = -[NPKContactlessPaymentSessionManager _canHandleRKEActionForTileItem:pass:outAction:outFunction:outError:](self, "_canHandleRKEActionForTileItem:pass:outAction:outFunction:outError:", v8, v9, &v35, &v34, &v33);
    v18 = v35;
    v19 = v34;
    v20 = v33;
    if (v20 || !v17)
    {
      pk_Payment_log();
      v28 = objc_claimAutoreleasedReturnValue();
      v29 = os_log_type_enabled(v28, OS_LOG_TYPE_ERROR);

      if (v29)
      {
        pk_Payment_log();
        v30 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
        {
          objc_msgSend(v9, "uniqueID");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138413058;
          v37 = v31;
          v38 = 2112;
          v39 = v18;
          v40 = 2112;
          v41 = v19;
          v42 = 2112;
          v43 = v20;
          _os_log_impl(&dword_213518000, v30, OS_LOG_TYPE_ERROR, "Error: [PaymentSessionManager] Unable to handle RKE action for pass: %@ with action: %@ function: %@ error: %@", buf, 0x2Au);

        }
      }
      -[NPKContactlessPaymentSessionManager quickPaymentSession](self, "quickPaymentSession");
      v32 = (void *)objc_claimAutoreleasedReturnValue();

      if (v32)
        -[NPKContactlessPaymentSessionManager _cleanupQuickPaymentSession](self, "_cleanupQuickPaymentSession");
      -[NPKContactlessPaymentSessionManager _sessionStateForTransactionContext:](self, "_sessionStateForTransactionContext:", 0);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "setCompletionReason:", 6);
      -[NPKContactlessPaymentSessionManager _sendSessionStateToObservers:](self, "_sendSessionStateToObservers:", v24);
      if (v10)
        v10[2](v10, 0);
    }
    else
    {
      -[NPKContactlessPaymentSessionManager _cleanupQuickPaymentSession](self, "_cleanupQuickPaymentSession");
      +[NPKQuickPaymentSession sessionWithQueue:](NPKQuickPaymentSession, "sessionWithQueue:", MEMORY[0x24BDAC9B8]);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[NPKContactlessPaymentSessionManager setQuickPaymentSession:](self, "setQuickPaymentSession:", v21);

      -[NPKContactlessPaymentSessionManager quickPaymentSession](self, "quickPaymentSession");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "setCurrentPass:", v9);

      -[NPKContactlessPaymentSessionManager quickPaymentSession](self, "quickPaymentSession");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "setRequireFirstInQueue:", 0);

      -[NPKContactlessPaymentSessionManager quickPaymentSession](self, "quickPaymentSession");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      -[NPKContactlessPaymentSessionManager _handleRKEActionRequestedForPass:action:function:withSession:completion:](self, "_handleRKEActionRequestedForPass:action:function:withSession:completion:", v9, v18, v19, v24, v10);
    }

LABEL_21:
    goto LABEL_22;
  }
  pk_Payment_log();
  v25 = objc_claimAutoreleasedReturnValue();
  v26 = os_log_type_enabled(v25, OS_LOG_TYPE_ERROR);

  if (v26)
  {
    pk_Payment_log();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v9, "uniqueID");
      v27 = objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v37 = v8;
      v38 = 2112;
      v39 = v27;
      _os_log_impl(&dword_213518000, v18, OS_LOG_TYPE_ERROR, "Error: [PaymentSessionManager] Asked to handle RKE action for unexpected item: %@ pass: %@; Aborting.",
        buf,
        0x16u);

    }
    goto LABEL_21;
  }
LABEL_22:

}

- (void)handleEndSessionRequestedForReason:(unint64_t)a3
{
  void *v5;
  NSObject *v6;
  _BOOL4 v7;
  NSObject *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  _BOOL4 v12;
  NSObject *v13;
  void *v14;
  int v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  -[NPKContactlessPaymentSessionManager quickPaymentSession](self, "quickPaymentSession");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    pk_Payment_log();
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);

    if (v7)
    {
      pk_Payment_log();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        v15 = 138412290;
        v16 = v5;
        _os_log_impl(&dword_213518000, v8, OS_LOG_TYPE_DEFAULT, "Notice: [PaymentSessionManager] Handling end quick payment session requested with session: %@", (uint8_t *)&v15, 0xCu);
      }

    }
    -[NPKContactlessPaymentSessionManager _cleanupQuickPaymentSession](self, "_cleanupQuickPaymentSession");
    -[NPKContactlessPaymentSessionManager _sessionStateForTransactionContext:](self, "_sessionStateForTransactionContext:", 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setCompletionReason:", a3);
    -[NPKContactlessPaymentSessionManager _sendSessionStateToObservers:](self, "_sendSessionStateToObservers:", v9);

  }
  -[NPKContactlessPaymentSessionManager barcodePaymentSession](self, "barcodePaymentSession");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    pk_Payment_log();
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);

    if (v12)
    {
      pk_Payment_log();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        v15 = 138412290;
        v16 = v10;
        _os_log_impl(&dword_213518000, v13, OS_LOG_TYPE_DEFAULT, "Notice: [PaymentSessionManager] Handling end barcode payment session requested with session: %@", (uint8_t *)&v15, 0xCu);
      }

    }
    -[NPKContactlessPaymentSessionManager _cleanupBarcodePaymentSession](self, "_cleanupBarcodePaymentSession");
    -[NPKContactlessPaymentSessionManager _sessionStateForUserCanceledBarcodeTransaction](self, "_sessionStateForUserCanceledBarcodeTransaction");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[NPKContactlessPaymentSessionManager _sendSessionStateToObservers:](self, "_sendSessionStateToObservers:", v14);

  }
}

- (void)handleAutomaticSelectionValueAddedServicePasses:(id)a3
{
  -[NPKQuickPaymentSession setVasPasses:](self->_quickPaymentSession, "setVasPasses:", a3);
}

- (void)handleStandaloneTransactionWithAction:(unint64_t)a3 forPass:(id)a4
{
  void *v6;
  void *v7;
  id v8;

  -[NPKContactlessPaymentSessionManager _sessionStateForExpressTransactionStatus:pass:paymentApplication:concreteTransactions:ephemeralTransaction:mutatedBalances:appletState:](self, "_sessionStateForExpressTransactionStatus:pass:paymentApplication:concreteTransactions:ephemeralTransaction:mutatedBalances:appletState:", 4, a4, 0, 0, 0, 0, 0);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "transactionContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setAction:", a3);

  objc_msgSend(v8, "transactionContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setTransactionStatus:", 2);

  -[NPKContactlessPaymentSessionManager _sendSessionStateToObservers:](self, "_sendSessionStateToObservers:", v8);
}

- (void)handleRKETransactionForPass:(id)a3 fromTile:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v6 = a4;
  -[NPKContactlessPaymentSessionManager _sessionStateForExpressTransactionStatus:pass:paymentApplication:concreteTransactions:ephemeralTransaction:mutatedBalances:appletState:](self, "_sessionStateForExpressTransactionStatus:pass:paymentApplication:concreteTransactions:ephemeralTransaction:mutatedBalances:appletState:", 4, a3, 0, 0, 0, 0, 0);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "transactionContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setAction:", 5);

  objc_msgSend(v10, "transactionContext");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setPassTile:", v6);

  objc_msgSend(v10, "transactionContext");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setTransactionStatus:", 2);

  -[NPKContactlessPaymentSessionManager _sendSessionStateToObservers:](self, "_sendSessionStateToObservers:", v10);
}

- (void)handleStandaloneTransactionWithAction:(unint64_t)a3 forPass:(id)a4 withAccessory:(id)a5
{
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v8 = a5;
  -[NPKContactlessPaymentSessionManager _sessionStateForExpressTransactionStatus:pass:paymentApplication:concreteTransactions:ephemeralTransaction:mutatedBalances:appletState:](self, "_sessionStateForExpressTransactionStatus:pass:paymentApplication:concreteTransactions:ephemeralTransaction:mutatedBalances:appletState:", 4, a4, 0, 0, 0, 0, 0);
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "transactionContext");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setAction:", a3);

  objc_msgSend(v12, "transactionContext");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setTransactionStatus:", 2);

  objc_msgSend(v12, "transactionContext");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setAccessory:", v8);

  -[NPKContactlessPaymentSessionManager _sendSessionStateToObservers:](self, "_sendSessionStateToObservers:", v12);
}

- (void)handleExpressTransactionStatus:(unint64_t)a3 forPass:(id)a4
{
  -[NPKContactlessPaymentSessionManager handleExpressTransactionStatus:forPass:paymentApplication:concreteTransactions:ephemeralTransaction:mutatedBalances:appletState:](self, "handleExpressTransactionStatus:forPass:paymentApplication:concreteTransactions:ephemeralTransaction:mutatedBalances:appletState:", a3, a4, 0, 0, 0, 0, 0);
}

- (void)handleExpressTransactionStatus:(unint64_t)a3 forPass:(id)a4 paymentApplication:(id)a5 concreteTransactions:(id)a6 ephemeralTransaction:(id)a7 mutatedBalances:(id)a8 appletState:(id)a9
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  NSObject *v21;
  _BOOL4 v22;
  NSObject *v23;
  void *v24;
  void *v25;
  void *v26;
  uint8_t buf[4];
  void *v28;
  __int16 v29;
  uint64_t v30;
  __int16 v31;
  id v32;
  __int16 v33;
  id v34;
  __int16 v35;
  id v36;
  __int16 v37;
  id v38;
  uint64_t v39;

  v39 = *MEMORY[0x24BDAC8D0];
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  v19 = a8;
  v20 = a9;
  pk_Payment_log();
  v21 = objc_claimAutoreleasedReturnValue();
  v22 = os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT);

  if (v22)
  {
    pk_Payment_log();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      NSStringFromNPKExpressTransactionStatus(a3);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "uniqueID");
      *(_DWORD *)buf = 138413570;
      v28 = v26;
      v29 = 2112;
      v30 = objc_claimAutoreleasedReturnValue();
      v24 = (void *)v30;
      v31 = 2112;
      v32 = v17;
      v33 = 2112;
      v34 = v18;
      v35 = 2112;
      v36 = v19;
      v37 = 2112;
      v38 = v20;
      _os_log_impl(&dword_213518000, v23, OS_LOG_TYPE_DEFAULT, "Notice: [PaymentSessionManager] Got express transaction status %@ for pass %@ concrete transactions %@ ephemeral transactions %@ mutatedBalances:%@ applet state %@", buf, 0x3Eu);

    }
  }
  -[NPKContactlessPaymentSessionManager _sessionStateForExpressTransactionStatus:pass:paymentApplication:concreteTransactions:ephemeralTransaction:mutatedBalances:appletState:](self, "_sessionStateForExpressTransactionStatus:pass:paymentApplication:concreteTransactions:ephemeralTransaction:mutatedBalances:appletState:", a3, v15, v16, v17, v18, v19, v20);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPKContactlessPaymentSessionManager _sendSessionStateToObservers:](self, "_sendSessionStateToObservers:", v25);

}

- (void)handleLocalAuthenticationError:(id)a3
{
  id v4;
  NSObject *v5;
  _BOOL4 v6;
  NSObject *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  int v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
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
      v11 = 138412290;
      v12 = v4;
      _os_log_impl(&dword_213518000, v7, OS_LOG_TYPE_DEFAULT, "Notice: [PaymentSessionManager] Handling local authentication error %@", (uint8_t *)&v11, 0xCu);
    }

  }
  -[NPKContactlessPaymentSessionManager _baseSessionStateForUpdate](self, "_baseSessionStateForUpdate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setDoublePressReceived:", 0);
  objc_msgSend(v8, "setSessionAuthorized:", 0);
  objc_msgSend(v4, "domain");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v9, "isEqualToString:", *MEMORY[0x24BDDA908]))
  {

    goto LABEL_10;
  }
  if (objc_msgSend(v4, "code") != -9)
  {
    v10 = objc_msgSend(v4, "code");

    if (v10 == -4)
      goto LABEL_11;
LABEL_10:
    objc_msgSend(v8, "setFailureType:", 1);
    goto LABEL_11;
  }

LABEL_11:
  -[NPKContactlessPaymentSessionManager _sendSessionStateToObservers:](self, "_sendSessionStateToObservers:", v8);

}

- (void)handleEndQuickPaymentSessionRequestedByUI
{
  void *v3;
  NSObject *v4;
  _BOOL4 v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  uint8_t v10[16];

  -[NPKContactlessPaymentSessionManager quickPaymentSession](self, "quickPaymentSession");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    pk_Payment_log();
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);

    if (v5)
    {
      pk_Payment_log();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v10 = 0;
        _os_log_impl(&dword_213518000, v6, OS_LOG_TYPE_DEFAULT, "Notice: [PaymentSessionManager] Handling ending quick payment session requested by UI.", v10, 2u);
      }

    }
    -[NPKContactlessPaymentSessionManager userSelectedPass](self, "userSelectedPass");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "paymentPass");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if ((objc_msgSend(v8, "supportsBarcodePayment") & 1) == 0)
    {
      -[NPKContactlessPaymentSessionManager _cleanupQuickPaymentSession](self, "_cleanupQuickPaymentSession");
      -[NPKContactlessPaymentSessionManager _sessionStateForTransactionContext:](self, "_sessionStateForTransactionContext:", 0);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setCompletionReason:", 7);
      objc_msgSend(v9, "setDoublePressReceived:", 0);
      objc_msgSend(v9, "setSessionAuthorized:", 0);
      -[NPKContactlessPaymentSessionManager _sendSessionStateToObservers:](self, "_sendSessionStateToObservers:", v9);

    }
  }
}

- (void)handlePaymentBarcodeRequested
{
  void *v3;
  void *v4;
  void *v5;
  int IsPersonalized;
  void *v7;
  void *v8;
  NSObject *v9;
  _BOOL4 v10;
  NSObject *v11;
  NPKBarcodePaymentSession *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  _DWORD v17[2];
  __int16 v18;
  _BOOL4 v19;
  __int16 v20;
  _BOOL4 v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  -[NPKContactlessPaymentSessionManager userSelectedPass](self, "userSelectedPass");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "paymentPass");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v4, "supportsBarcodePayment"))
  {
    objc_msgSend(v4, "devicePrimaryBarcodePaymentApplication");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "state");
    IsPersonalized = PKPaymentApplicationStateIsPersonalized();

    -[NPKContactlessPaymentSessionManager quickPaymentSession](self, "quickPaymentSession");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    -[NPKContactlessPaymentSessionManager barcodePaymentSession](self, "barcodePaymentSession");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    pk_Payment_log();
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);

    if (IsPersonalized && v7 && !v8)
    {
      if (v10)
      {
        pk_Payment_log();
        v11 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v17[0]) = 0;
          _os_log_impl(&dword_213518000, v11, OS_LOG_TYPE_DEFAULT, "Notice: [PaymentSessionManager] Transitioning from quickPaymentSession into barcodePaymentSession.", (uint8_t *)v17, 2u);
        }

      }
      -[NPKContactlessPaymentSessionManager _cleanupQuickPaymentSession](self, "_cleanupQuickPaymentSession");
      v12 = [NPKBarcodePaymentSession alloc];
      -[NPKContactlessPaymentSessionManager credential](self, "credential");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = -[NPKBarcodePaymentSession initWithPaymentPass:authorizationCredential:](v12, "initWithPaymentPass:authorizationCredential:", v4, v13);

      -[NSObject setDelegate:](v14, "setDelegate:", self);
      -[NSObject startSession](v14, "startSession");
      -[NPKContactlessPaymentSessionManager setBarcodePaymentSession:](self, "setBarcodePaymentSession:", v14);
      -[NSObject currentPaymentBarcode](v14, "currentPaymentBarcode");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[NPKContactlessPaymentSessionManager _sessionStateForPaymentBarcode:](self, "_sessionStateForPaymentBarcode:", v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      -[NPKContactlessPaymentSessionManager _sendSessionStateToObservers:](self, "_sendSessionStateToObservers:", v16);
LABEL_13:

      goto LABEL_14;
    }
    if (v10)
    {
      pk_Payment_log();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        v17[0] = 67109632;
        v17[1] = IsPersonalized != 0;
        v18 = 1024;
        v19 = v7 != 0;
        v20 = 1024;
        v21 = v8 == 0;
        _os_log_impl(&dword_213518000, v14, OS_LOG_TYPE_DEFAULT, "Notice: [PaymentSessionManager] Skip creating new barcodePaymentSession - isPersonalized: %d, hasQuickPaymentSession: %d, hasNoExistingBarcodePaymentSession: %d", (uint8_t *)v17, 0x14u);
      }
      goto LABEL_13;
    }
  }
LABEL_14:

}

- (void)handleRetryLoadingPaymentBarcodeRequested
{
  void *v3;
  NSObject *v4;
  _BOOL4 v5;
  NSObject *v6;
  void *v7;
  uint8_t v8[16];

  -[NPKContactlessPaymentSessionManager barcodePaymentSession](self, "barcodePaymentSession");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    pk_Payment_log();
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);

    if (v5)
    {
      pk_Payment_log();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v8 = 0;
        _os_log_impl(&dword_213518000, v6, OS_LOG_TYPE_DEFAULT, "Notice: [PaymentSessionManager] Handling retry loading paymentBarcode", v8, 2u);
      }

    }
    -[NPKContactlessPaymentSessionManager barcodePaymentSession](self, "barcodePaymentSession");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "retryFetchingBarcode");

  }
}

- (void)handleBarcodePaymentUserIntentionConfirmation:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[NPKContactlessPaymentSessionManager barcodePaymentSession](self, "barcodePaymentSession");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "submitUserIntentionConfirmation:", v3);

}

- (void)handleBarcodePaymentPinCodeEntry:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[NPKContactlessPaymentSessionManager barcodePaymentSession](self, "barcodePaymentSession");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "submitPinCode:", v4);

}

- (void)handleEndBarcodePaymentSessionRequestedByUI
{
  void *v3;
  NSObject *v4;
  _BOOL4 v5;
  NSObject *v6;
  void *v7;
  void *v8;
  uint8_t v9[16];

  -[NPKContactlessPaymentSessionManager barcodePaymentSession](self, "barcodePaymentSession");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    pk_Payment_log();
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);

    if (v5)
    {
      pk_Payment_log();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v9 = 0;
        _os_log_impl(&dword_213518000, v6, OS_LOG_TYPE_DEFAULT, "Notice: [PaymentSessionManager] Handling ending barcode payment session requested by UI.", v9, 2u);
      }

    }
    -[NPKContactlessPaymentSessionManager _cleanupBarcodePaymentSession](self, "_cleanupBarcodePaymentSession");
    -[NPKContactlessPaymentSessionManager _baseSessionStateForUpdate](self, "_baseSessionStateForUpdate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setCompletionReason:", 7);
    objc_msgSend(v7, "transactionContext");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setTransactionStatus:", 2);

    objc_msgSend(v7, "setDoublePressReceived:", 0);
    objc_msgSend(v7, "setSessionAuthorized:", 0);
    -[NPKContactlessPaymentSessionManager _sendSessionStateToObservers:](self, "_sendSessionStateToObservers:", v7);

  }
}

- (void)handleTransactionStarted
{
  id v3;

  -[NPKContactlessPaymentSessionManager _baseSessionStateForUpdate](self, "_baseSessionStateForUpdate");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setCanChangePass:", 0);
  -[NPKContactlessPaymentSessionManager _sendSessionStateToObservers:](self, "_sendSessionStateToObservers:", v3);

}

- (BOOL)_handleIfPossibleIdentityUnavailablePassWithSession:(id)a3
{
  return 0;
}

- (void)handleISO18013TransactionStarted
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NPKContactlessPaymentSessionManagerTransactionContext *v8;

  v8 = objc_alloc_init(NPKContactlessPaymentSessionManagerTransactionContext);
  -[NPKContactlessPaymentSessionManagerTransactionContext setTransactionType:](v8, "setTransactionType:", 5);
  -[NPKContactlessPaymentSessionManagerTransactionContext setReleaseDataStatus:](v8, "setReleaseDataStatus:", 1);
  -[NPKContactlessPaymentSessionManagerTransactionContext setTransactionStatus:](v8, "setTransactionStatus:", 1);
  -[NPKContactlessPaymentSessionManager quickPaymentSession](self, "quickPaymentSession");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "currentPass");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPKContactlessPaymentSessionManagerTransactionContext setTransactionPass:](v8, "setTransactionPass:", v4);

  -[NPKContactlessPaymentSessionManager _baseSessionStateForUpdate](self, "_baseSessionStateForUpdate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPKContactlessPaymentSessionManager quickPaymentSession](self, "quickPaymentSession");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "currentPass");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setCurrentPass:", v7);

  objc_msgSend(v5, "setSessionAuthorized:", 0);
  objc_msgSend(v5, "setDoublePressReceived:", 0);
  objc_msgSend(v5, "setContactlessInterfaceReady:", 0);
  objc_msgSend(v5, "setCanChangePass:", 0);
  objc_msgSend(v5, "setCompletionReason:", 0);
  objc_msgSend(v5, "setTransactionContext:", v8);
  -[NPKContactlessPaymentSessionManager _sendSessionStateToObservers:](self, "_sendSessionStateToObservers:", v5);

}

- (void)handleISO18013DataReleaseCanceled
{
  NPKContactlessPaymentSessionManagerTransactionContext *v3;
  void *v4;
  NSObject *v5;
  _BOOL4 v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  uint8_t v11[16];

  v3 = objc_alloc_init(NPKContactlessPaymentSessionManagerTransactionContext);
  -[NPKContactlessPaymentSessionManagerTransactionContext setTransactionType:](v3, "setTransactionType:", 5);
  -[NPKContactlessPaymentSessionManagerTransactionContext setReleaseDataStatus:](v3, "setReleaseDataStatus:", 6);
  -[NPKContactlessPaymentSessionManagerTransactionContext setTransactionStatus:](v3, "setTransactionStatus:", 2);
  -[NPKContactlessPaymentSessionManager quickPaymentSession](self, "quickPaymentSession");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    pk_Payment_log();
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);

    if (v6)
    {
      pk_Payment_log();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v11 = 0;
        _os_log_impl(&dword_213518000, v7, OS_LOG_TYPE_DEFAULT, "Notice: [PaymentSessionManager] Handling ending quick payment session requested by UI.", v11, 2u);
      }

    }
    -[NPKContactlessPaymentSessionManager userSelectedPass](self, "userSelectedPass");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "paymentPass");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if ((objc_msgSend(v9, "supportsBarcodePayment") & 1) == 0)
    {
      -[NPKContactlessPaymentSessionManager _cleanupQuickPaymentSession](self, "_cleanupQuickPaymentSession");
      -[NPKContactlessPaymentSessionManager _sessionStateForTransactionContext:](self, "_sessionStateForTransactionContext:", 0);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setTransactionContext:", v3);
      objc_msgSend(v10, "setCompletionReason:", 7);
      objc_msgSend(v10, "setFailureType:", 7);
      objc_msgSend(v10, "setDoublePressReceived:", 0);
      objc_msgSend(v10, "setSessionAuthorized:", 0);
      -[NPKContactlessPaymentSessionManager _sendSessionStateToObservers:](self, "_sendSessionStateToObservers:", v10);

    }
  }

}

- (void)handleISO18013Request:(id)a3 withReaderAuthInfo:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  NPKContactlessPaymentSessionManagerTransactionContext *v11;

  v6 = a4;
  v7 = a3;
  v11 = objc_alloc_init(NPKContactlessPaymentSessionManagerTransactionContext);
  -[NPKContactlessPaymentSessionManagerTransactionContext setTransactionType:](v11, "setTransactionType:", 5);
  -[NPKContactlessPaymentSessionManagerTransactionContext setReleaseDataStatus:](v11, "setReleaseDataStatus:", 2);
  -[NPKContactlessPaymentSessionManagerTransactionContext setTransactionStatus:](v11, "setTransactionStatus:", 1);
  -[NPKContactlessPaymentSessionManager userSelectedPass](self, "userSelectedPass");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPKContactlessPaymentSessionManagerTransactionContext setTransactionPass:](v11, "setTransactionPass:", v8);

  -[NPKContactlessPaymentSessionManagerTransactionContext setReleaseDataRequest:](v11, "setReleaseDataRequest:", v7);
  -[NPKContactlessPaymentSessionManagerTransactionContext setReaderAuthInfo:](v11, "setReaderAuthInfo:", v6);

  -[NPKContactlessPaymentSessionManager _baseSessionStateForUpdate](self, "_baseSessionStateForUpdate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPKContactlessPaymentSessionManager userSelectedPass](self, "userSelectedPass");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setCurrentPass:", v10);

  objc_msgSend(v9, "setSessionAuthorized:", 0);
  objc_msgSend(v9, "setDoublePressReceived:", 0);
  objc_msgSend(v9, "setContactlessInterfaceReady:", 0);
  objc_msgSend(v9, "setCanChangePass:", 0);
  objc_msgSend(v9, "setCompletionReason:", 0);
  objc_msgSend(v9, "setTransactionContext:", v11);
  -[NPKContactlessPaymentSessionManager _sendSessionStateToObservers:](self, "_sendSessionStateToObservers:", v9);

}

- (void)handleAuthorize18013RequestWithDataToRelease:(id)a3 credential:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NPKContactlessPaymentSessionManagerTransactionContext *v16;

  v6 = a4;
  v7 = a3;
  -[NPKContactlessPaymentSessionManager quickPaymentSession](self, "quickPaymentSession");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "authorize18013RequestWithDataToRelease:credential:", v7, v6);

  v16 = objc_alloc_init(NPKContactlessPaymentSessionManagerTransactionContext);
  -[NPKContactlessPaymentSessionManagerTransactionContext setTransactionType:](v16, "setTransactionType:", 5);
  -[NPKContactlessPaymentSessionManagerTransactionContext setReleaseDataStatus:](v16, "setReleaseDataStatus:", 3);
  -[NPKContactlessPaymentSessionManagerTransactionContext setTransactionStatus:](v16, "setTransactionStatus:", 1);
  -[NPKContactlessPaymentSessionManager userSelectedPass](self, "userSelectedPass");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPKContactlessPaymentSessionManagerTransactionContext setTransactionPass:](v16, "setTransactionPass:", v9);

  -[NPKContactlessPaymentSessionManager lastSessionState](self, "lastSessionState");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "transactionContext");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "releaseDataRequest");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPKContactlessPaymentSessionManagerTransactionContext setReleaseDataRequest:](v16, "setReleaseDataRequest:", v12);

  -[NPKContactlessPaymentSessionManager _baseSessionStateForUpdate](self, "_baseSessionStateForUpdate");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPKContactlessPaymentSessionManager userSelectedPass](self, "userSelectedPass");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setCurrentPass:", v14);

  objc_msgSend(v13, "setSessionAuthorized:", 1);
  objc_msgSend(v13, "setDoublePressReceived:", 1);
  objc_msgSend(MEMORY[0x24BDBCE60], "now");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setDoublePressTimestamp:", v15);

  objc_msgSend(v13, "setContactlessInterfaceReady:", 1);
  objc_msgSend(v13, "setCanChangePass:", 0);
  objc_msgSend(v13, "setCompletionReason:", 0);
  objc_msgSend(v13, "setTransactionContext:", v16);
  -[NPKContactlessPaymentSessionManager _sendSessionStateToObservers:](self, "_sendSessionStateToObservers:", v13);

}

- (void)handleFailureToReleaseDataWithError:(id)a3
{
  void *v4;
  void *v5;
  NPKContactlessPaymentSessionManagerTransactionContext *v6;

  v6 = objc_alloc_init(NPKContactlessPaymentSessionManagerTransactionContext);
  -[NPKContactlessPaymentSessionManagerTransactionContext setTransactionType:](v6, "setTransactionType:", 5);
  -[NPKContactlessPaymentSessionManagerTransactionContext setReleaseDataStatus:](v6, "setReleaseDataStatus:", 5);
  -[NPKContactlessPaymentSessionManagerTransactionContext setTransactionStatus:](v6, "setTransactionStatus:", 2);
  -[NPKContactlessPaymentSessionManager _baseSessionStateForUpdate](self, "_baseSessionStateForUpdate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPKContactlessPaymentSessionManager userSelectedPass](self, "userSelectedPass");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setCurrentPass:", v5);

  objc_msgSend(v4, "setTransactionContext:", v6);
  objc_msgSend(v4, "setDoublePressReceived:", 0);
  objc_msgSend(v4, "setSessionAuthorized:", 0);
  objc_msgSend(v4, "setCompletionReason:", 5);
  objc_msgSend(v4, "setFailureType:", 2);
  -[NPKContactlessPaymentSessionManager _sendSessionStateToObservers:](self, "_sendSessionStateToObservers:", v4);

}

- (void)barcodePaymentSession:(id)a3 didReceivePaymentBarcode:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;

  v9 = a4;
  v6 = a3;
  -[NPKContactlessPaymentSessionManager barcodePaymentSession](self, "barcodePaymentSession");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  if (v7 == v6)
  {
    -[NPKContactlessPaymentSessionManager _sessionStateForPaymentBarcode:](self, "_sessionStateForPaymentBarcode:", v9);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[NPKContactlessPaymentSessionManager _sendSessionStateToObservers:](self, "_sendSessionStateToObservers:", v8);

  }
}

- (void)barcodePaymentSession:(id)a3 didUpdateTransactionStatus:(unint64_t)a4 withTransaction:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  id v15;

  v15 = a3;
  v8 = a5;
  -[NPKContactlessPaymentSessionManager barcodePaymentSession](self, "barcodePaymentSession");
  v9 = (id)objc_claimAutoreleasedReturnValue();

  if (v9 == v15)
  {
    objc_msgSend(v15, "currentPaymentBarcode");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[NPKContactlessPaymentSessionManager _sessionStateForBarcodeTransactionStatus:paymentBarcode:transaction:](self, "_sessionStateForBarcodeTransactionStatus:paymentBarcode:transaction:", a4, v10, v8);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    -[NPKContactlessPaymentSessionManager _sendSessionStateToObservers:](self, "_sendSessionStateToObservers:", v11);
    objc_msgSend(v11, "transactionContext");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "transactionStatus");

    if (v13 == 2)
    {
      -[NPKContactlessPaymentSessionManager _cleanupBarcodePaymentSession](self, "_cleanupBarcodePaymentSession");
      -[NPKContactlessPaymentSessionManager _baseSessionStateForUpdate](self, "_baseSessionStateForUpdate");
      v14 = objc_claimAutoreleasedReturnValue();

      -[NPKContactlessPaymentSessionManager _sendSessionStateToObservers:](self, "_sendSessionStateToObservers:", v14);
      v11 = (void *)v14;
    }

  }
}

- (void)_cleanupBarcodePaymentSession
{
  void *v3;
  id v4;

  -[NPKContactlessPaymentSessionManager barcodePaymentSession](self, "barcodePaymentSession");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = v3;
    objc_msgSend(v3, "invalidateSession");
    -[NPKContactlessPaymentSessionManager setBarcodePaymentSession:](self, "setBarcodePaymentSession:", 0);
    v3 = v4;
  }

}

- (void)passesDataSource:(id)a3 didRemovePasses:(id)a4
{
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  _BOOL4 v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  NSObject *v17;
  NSObject *v18;
  _BOOL4 v19;
  NSObject *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  NSObject *v25;
  NSObject *v26;
  NSObject *v27;
  _BOOL4 v28;
  NSObject *v29;
  int v30;
  void *v31;
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v5 = (void *)MEMORY[0x24BDBCF20];
  objc_msgSend(a4, "pk_arrayByApplyingBlock:", &__block_literal_global_463);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setWithArray:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  pk_Payment_log();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);

  if (v9)
  {
    pk_Payment_log();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v7, "allObjects");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "componentsJoinedByString:", CFSTR(", "));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = 138412290;
      v31 = v12;
      _os_log_impl(&dword_213518000, v10, OS_LOG_TYPE_DEFAULT, "Notice: [PaymentSessionManager] Got removed unique IDs: %@", (uint8_t *)&v30, 0xCu);

    }
  }
  -[NPKContactlessPaymentSessionManager quickPaymentSession](self, "quickPaymentSession");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "currentPass");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "uniqueID");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  pk_Payment_log();
  v16 = objc_claimAutoreleasedReturnValue();
  LODWORD(v14) = os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT);

  if ((_DWORD)v14)
  {
    pk_Payment_log();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      v30 = 138412290;
      v31 = v15;
      _os_log_impl(&dword_213518000, v17, OS_LOG_TYPE_DEFAULT, "Notice: [PaymentSessionManager] Quick payment session pass unique ID is %@", (uint8_t *)&v30, 0xCu);
    }

  }
  if (v15 && objc_msgSend(v7, "containsObject:", v15))
  {
    pk_Payment_log();
    v18 = objc_claimAutoreleasedReturnValue();
    v19 = os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT);

    if (v19)
    {
      pk_Payment_log();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v30) = 0;
        _os_log_impl(&dword_213518000, v20, OS_LOG_TYPE_DEFAULT, "Notice: [PaymentSessionManager] Clearing quick payment session current pass because it has been removed", (uint8_t *)&v30, 2u);
      }

    }
    -[NPKContactlessPaymentSessionManager _cleanupQuickPaymentSession](self, "_cleanupQuickPaymentSession");
    -[NPKContactlessPaymentSessionManager _sessionStateForTransactionContext:](self, "_sessionStateForTransactionContext:", 0);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setCompletionReason:", 7);
    -[NPKContactlessPaymentSessionManager _sendSessionStateToObservers:](self, "_sendSessionStateToObservers:", v21);

  }
  -[NPKContactlessPaymentSessionManager barcodePaymentSession](self, "barcodePaymentSession");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "paymentPass");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "uniqueID");
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  pk_Payment_log();
  v25 = objc_claimAutoreleasedReturnValue();
  LODWORD(v23) = os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT);

  if ((_DWORD)v23)
  {
    pk_Payment_log();
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      v30 = 138412290;
      v31 = v24;
      _os_log_impl(&dword_213518000, v26, OS_LOG_TYPE_DEFAULT, "Notice: [PaymentSessionManager] Barcode payment session pass unique ID is %@", (uint8_t *)&v30, 0xCu);
    }

  }
  if (v24 && objc_msgSend(v7, "containsObject:", v24))
  {
    pk_Payment_log();
    v27 = objc_claimAutoreleasedReturnValue();
    v28 = os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT);

    if (v28)
    {
      pk_Payment_log();
      v29 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v30) = 0;
        _os_log_impl(&dword_213518000, v29, OS_LOG_TYPE_DEFAULT, "Notice: [PaymentSessionManager] Tearing down barcode payment session because pass has been removed", (uint8_t *)&v30, 2u);
      }

    }
    -[NPKContactlessPaymentSessionManager _cleanupBarcodePaymentSession](self, "_cleanupBarcodePaymentSession");
  }

}

uint64_t __72__NPKContactlessPaymentSessionManager_passesDataSource_didRemovePasses___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "uniqueID");
}

- (void)passesDataSource:(id)a3 didUpdatePasses:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  _BOOL4 v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  _BOOL4 v22;
  NSObject *v23;
  void *v24;
  void *v25;
  void *v26;
  NSObject *v27;
  _BOOL4 v28;
  NSObject *v29;
  void *v30;
  void *v31;
  NSObject *v32;
  _BOOL4 v33;
  NSObject *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  NSObject *v39;
  NSObject *v40;
  void *v41;
  void *v42;
  void *v43;
  uint64_t v44;
  NSObject *v45;
  _BOOL4 v46;
  NSObject *v47;
  _QWORD v48[4];
  id v49;
  _QWORD v50[5];
  _QWORD v51[4];
  id v52;
  uint8_t buf[4];
  uint64_t v54;
  uint64_t v55;

  v55 = *MEMORY[0x24BDAC8D0];
  v5 = a4;
  v6 = (void *)MEMORY[0x24BDBCF20];
  objc_msgSend(v5, "pk_arrayByApplyingBlock:", &__block_literal_global_466);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setWithArray:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  pk_Payment_log();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);

  if (v10)
  {
    pk_Payment_log();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v8, "allObjects");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "componentsJoinedByString:", CFSTR(", "));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v54 = (uint64_t)v13;
      _os_log_impl(&dword_213518000, v11, OS_LOG_TYPE_DEFAULT, "Notice: [PaymentSessionManager] Got updated unique IDs: %@", buf, 0xCu);

    }
  }
  -[NPKContactlessPaymentSessionManager quickPaymentSession](self, "quickPaymentSession");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "currentPass");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "uniqueID");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  pk_Payment_log();
  v17 = objc_claimAutoreleasedReturnValue();
  LODWORD(v15) = os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT);

  if ((_DWORD)v15)
  {
    pk_Payment_log();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v54 = (uint64_t)v16;
      _os_log_impl(&dword_213518000, v18, OS_LOG_TYPE_DEFAULT, "Notice: [PaymentSessionManager] Quick payment session pass unique ID is %@", buf, 0xCu);
    }

  }
  if (v16 && objc_msgSend(v8, "containsObject:", v16))
  {
    v51[0] = MEMORY[0x24BDAC760];
    v51[1] = 3221225472;
    v51[2] = __72__NPKContactlessPaymentSessionManager_passesDataSource_didUpdatePasses___block_invoke_467;
    v51[3] = &unk_24CFE9A68;
    v52 = v16;
    objc_msgSend(v5, "pk_objectsPassingTest:", v51);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "firstObject");
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    if (v20)
    {
      pk_Payment_log();
      v21 = objc_claimAutoreleasedReturnValue();
      v22 = os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT);

      if (v22)
      {
        pk_Payment_log();
        v23 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(v20, "uniqueID");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          v54 = (uint64_t)v24;
          _os_log_impl(&dword_213518000, v23, OS_LOG_TYPE_DEFAULT, "Notice: [PaymentSessionManager] Setting updated payment session pass with unique ID %@", buf, 0xCu);

        }
      }
      -[NPKContactlessPaymentSessionManager quickPaymentSession](self, "quickPaymentSession");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "setCurrentPass:", v20);

    }
  }
  -[PKPass uniqueID](self->_userSelectedPass, "uniqueID");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  pk_Payment_log();
  v27 = objc_claimAutoreleasedReturnValue();
  v28 = os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT);

  if (v28)
  {
    pk_Payment_log();
    v29 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v54 = (uint64_t)v26;
      _os_log_impl(&dword_213518000, v29, OS_LOG_TYPE_DEFAULT, "Notice: [PaymentSessionManager] User selected pass unique ID is %@", buf, 0xCu);
    }

  }
  if (v26 && objc_msgSend(v8, "containsObject:", v26))
  {
    v50[0] = MEMORY[0x24BDAC760];
    v50[1] = 3221225472;
    v50[2] = __72__NPKContactlessPaymentSessionManager_passesDataSource_didUpdatePasses___block_invoke_469;
    v50[3] = &unk_24CFE9A68;
    v50[4] = self;
    objc_msgSend(v5, "pk_objectsPassingTest:", v50);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "firstObject");
    v31 = (void *)objc_claimAutoreleasedReturnValue();

    if (v31)
    {
      pk_Payment_log();
      v32 = objc_claimAutoreleasedReturnValue();
      v33 = os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT);

      if (v33)
      {
        pk_Payment_log();
        v34 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(v31, "uniqueID");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          v54 = (uint64_t)v35;
          _os_log_impl(&dword_213518000, v34, OS_LOG_TYPE_DEFAULT, "Notice: [PaymentSessionManager] Setting updated user selected pass with unique ID %@", buf, 0xCu);

        }
      }
      objc_storeStrong((id *)&self->_userSelectedPass, v31);
    }

  }
  -[NPKContactlessPaymentSessionManager barcodePaymentSession](self, "barcodePaymentSession");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "paymentPass");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "uniqueID");
  v38 = (void *)objc_claimAutoreleasedReturnValue();

  pk_Payment_log();
  v39 = objc_claimAutoreleasedReturnValue();
  LODWORD(v37) = os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT);

  if ((_DWORD)v37)
  {
    pk_Payment_log();
    v40 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v54 = (uint64_t)v38;
      _os_log_impl(&dword_213518000, v40, OS_LOG_TYPE_DEFAULT, "Notice: [PaymentSessionManager] Barcode payment session pass unique ID is %@", buf, 0xCu);
    }

  }
  if (v38 && objc_msgSend(v8, "containsObject:", v38))
  {
    v48[0] = MEMORY[0x24BDAC760];
    v48[1] = 3221225472;
    v48[2] = __72__NPKContactlessPaymentSessionManager_passesDataSource_didUpdatePasses___block_invoke_470;
    v48[3] = &unk_24CFE9A68;
    v49 = v16;
    objc_msgSend(v5, "pk_objectsPassingTest:", v48);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "firstObject");
    v42 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v42, "secureElementPass");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v44 = objc_msgSend(v43, "passActivationState");

    if (v44)
    {
      pk_Payment_log();
      v45 = objc_claimAutoreleasedReturnValue();
      v46 = os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT);

      if (v46)
      {
        pk_Payment_log();
        v47 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134217984;
          v54 = v44;
          _os_log_impl(&dword_213518000, v47, OS_LOG_TYPE_DEFAULT, "Notice: [PaymentSessionManager] Tearing down barcode payment session because updated pass is not activated (state %lu)", buf, 0xCu);
        }

      }
      -[NPKContactlessPaymentSessionManager _cleanupBarcodePaymentSession](self, "_cleanupBarcodePaymentSession");
    }

  }
}

uint64_t __72__NPKContactlessPaymentSessionManager_passesDataSource_didUpdatePasses___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "uniqueID");
}

uint64_t __72__NPKContactlessPaymentSessionManager_passesDataSource_didUpdatePasses___block_invoke_467(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "uniqueID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", *(_QWORD *)(a1 + 32));

  return v4;
}

uint64_t __72__NPKContactlessPaymentSessionManager_passesDataSource_didUpdatePasses___block_invoke_469(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;

  objc_msgSend(a2, "uniqueID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "uniqueID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "isEqualToString:", v4);

  return v5;
}

uint64_t __72__NPKContactlessPaymentSessionManager_passesDataSource_didUpdatePasses___block_invoke_470(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "uniqueID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", *(_QWORD *)(a1 + 32));

  return v4;
}

- (void)passesDataSourceDidReloadPasses:(id)a3
{
  id v4;
  NSObject *v5;
  _BOOL4 v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  _BOOL4 v12;
  NSObject *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  _BOOL4 v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  int v23;
  PKPass *v24;
  void *userSelectedPass;
  NSObject *v26;
  _BOOL4 v27;
  NSObject *v28;
  void *v29;
  void *v30;
  void *v31;
  NSObject *v32;
  NSObject *v33;
  void *v34;
  NSObject *v35;
  _BOOL4 v36;
  NSObject *v37;
  void *v38;
  uint64_t v39;
  void *v40;
  uint64_t v41;
  NSObject *v42;
  _BOOL4 v43;
  NSObject *v44;
  void *v45;
  int v46;
  void *v47;
  __int16 v48;
  uint64_t v49;
  uint64_t v50;

  v50 = *MEMORY[0x24BDAC8D0];
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
      LOWORD(v46) = 0;
      _os_log_impl(&dword_213518000, v7, OS_LOG_TYPE_DEFAULT, "Notice: [PaymentSessionManager] Got passes reloaded", (uint8_t *)&v46, 2u);
    }

  }
  -[NPKContactlessPaymentSessionManager quickPaymentSession](self, "quickPaymentSession");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "currentPass");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "uniqueID");
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
      v46 = 138412290;
      v47 = v10;
      _os_log_impl(&dword_213518000, v13, OS_LOG_TYPE_DEFAULT, "Notice: [PaymentSessionManager] Quick payment session pass unique ID is %@", (uint8_t *)&v46, 0xCu);
    }

  }
  if (v10)
  {
    objc_msgSend(v4, "passForUniqueID:", v10);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v14;
    if (v14)
    {
      if ((objc_msgSend(v14, "isEqualToPassIncludingMetadata:", v9) & 1) != 0)
        goto LABEL_24;
      pk_Payment_log();
      v16 = objc_claimAutoreleasedReturnValue();
      v17 = os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT);

      if (v17)
      {
        pk_Payment_log();
        v18 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(v15, "uniqueID");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v46 = 138412290;
          v47 = v19;
          _os_log_impl(&dword_213518000, v18, OS_LOG_TYPE_DEFAULT, "Notice: [PaymentSessionManager] Setting reloaded pass for unique ID %@", (uint8_t *)&v46, 0xCu);

        }
      }
      -[NPKContactlessPaymentSessionManager quickPaymentSession](self, "quickPaymentSession");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "setCurrentPass:", v15);

      -[PKPass uniqueID](self->_userSelectedPass, "uniqueID");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "uniqueID");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = objc_msgSend(v21, "isEqualToString:", v22);

      if (!v23)
        goto LABEL_24;
      v24 = v15;
      userSelectedPass = self->_userSelectedPass;
      self->_userSelectedPass = v24;
    }
    else
    {
      pk_Payment_log();
      v26 = objc_claimAutoreleasedReturnValue();
      v27 = os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT);

      if (v27)
      {
        pk_Payment_log();
        v28 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v46) = 0;
          _os_log_impl(&dword_213518000, v28, OS_LOG_TYPE_DEFAULT, "Notice: [PaymentSessionManager] Clearing quick payment session current pass because it has been removed", (uint8_t *)&v46, 2u);
        }

      }
      -[NPKContactlessPaymentSessionManager quickPaymentSession](self, "quickPaymentSession");
      userSelectedPass = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(userSelectedPass, "setCurrentPass:", 0);
    }

LABEL_24:
  }
  -[NPKContactlessPaymentSessionManager barcodePaymentSession](self, "barcodePaymentSession");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "paymentPass");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "uniqueID");
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  pk_Payment_log();
  v32 = objc_claimAutoreleasedReturnValue();
  LODWORD(v30) = os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT);

  if ((_DWORD)v30)
  {
    pk_Payment_log();
    v33 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
    {
      v46 = 138412290;
      v47 = v31;
      _os_log_impl(&dword_213518000, v33, OS_LOG_TYPE_DEFAULT, "Notice: [PaymentSessionManager] Barcode payment session pass unique ID is %@", (uint8_t *)&v46, 0xCu);
    }

  }
  if (v31)
  {
    objc_msgSend(v4, "passForUniqueID:", v31);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    pk_Payment_log();
    v35 = objc_claimAutoreleasedReturnValue();
    v36 = os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT);

    if (v36)
    {
      pk_Payment_log();
      v37 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v34, "secureElementPass");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        v39 = objc_msgSend(v38, "passActivationState");
        v46 = 138412546;
        v47 = v34;
        v48 = 2048;
        v49 = v39;
        _os_log_impl(&dword_213518000, v37, OS_LOG_TYPE_DEFAULT, "Notice: [PaymentSessionManager] Reloaded barcode payment pass is %@ (state %lu)", (uint8_t *)&v46, 0x16u);

      }
    }
    if (!v34
      || (objc_msgSend(v34, "secureElementPass"),
          v40 = (void *)objc_claimAutoreleasedReturnValue(),
          v41 = objc_msgSend(v40, "passActivationState"),
          v40,
          v41))
    {
      pk_Payment_log();
      v42 = objc_claimAutoreleasedReturnValue();
      v43 = os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT);

      if (v43)
      {
        pk_Payment_log();
        v44 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v46) = 0;
          _os_log_impl(&dword_213518000, v44, OS_LOG_TYPE_DEFAULT, "Notice: [PaymentSessionManager] Tearing down barcode payment session because updated pass no longer exists or is not activated", (uint8_t *)&v46, 2u);
        }

      }
      -[NPKContactlessPaymentSessionManager barcodePaymentSession](self, "barcodePaymentSession");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v45, "invalidateSession");

    }
  }

}

- (void)registerObserver:(id)a3 withRelativePriority:(unint64_t)a4
{
  NPKObserverManager *observersManager;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  id v10;

  observersManager = self->_observersManager;
  v10 = a3;
  -[NPKObserverManager registerObserver:withRelativePriority:](observersManager, "registerObserver:withRelativePriority:");
  -[NPKContactlessPaymentSessionManager lastSessionState](self, "lastSessionState");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    v8 = v6;
  }
  else
  {
    -[NPKContactlessPaymentSessionManager _baseSessionStateForUpdate](self, "_baseSessionStateForUpdate");
    v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  v9 = v8;

  -[NPKContactlessPaymentSessionManager _prepareSessionStateForSendingToObservers:](self, "_prepareSessionStateForSendingToObservers:", v9);
  objc_msgSend(v10, "contactlessPaymentSessionManager:didChangeSessionState:", self, v9);

}

- (void)registerObserver:(id)a3
{
  -[NPKContactlessPaymentSessionManager registerObserver:withRelativePriority:](self, "registerObserver:withRelativePriority:", a3, 10);
}

- (void)unregisterObserver:(id)a3
{
  NPKObserverManager *observersManager;
  id v4;

  observersManager = self->_observersManager;
  v4 = a3;
  -[NPKObserverManager unregisterObserver:](observersManager, "unregisterObserver:", v4);

}

- (void)paymentSession:(id)a3 didMakePassCurrent:(id)a4
{
  id v5;
  NSObject *v6;
  _BOOL4 v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  _BOOL8 v12;
  int v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v5 = a4;
  pk_Payment_log();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);

  if (v7)
  {
    pk_Payment_log();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v5, "uniqueID");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 138412290;
      v14 = v9;
      _os_log_impl(&dword_213518000, v8, OS_LOG_TYPE_DEFAULT, "Notice: [PaymentSessionManager] New current pass from payment session: %@", (uint8_t *)&v13, 0xCu);

    }
  }
  -[NPKContactlessPaymentSessionManager _baseSessionStateForUpdate](self, "_baseSessionStateForUpdate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setCurrentPass:", v5);
  v12 = 1;
  if (objc_msgSend(v5, "passType") != 1 || (objc_msgSend(v10, "doublePressReceived") & 1) == 0)
  {
    if (!objc_msgSend(v5, "npkHasValidNFCPayload")
      || (-[NPKContactlessPaymentSessionManager quickPaymentSession](self, "quickPaymentSession"),
          v11 = (void *)objc_claimAutoreleasedReturnValue(),
          v11,
          !v11))
    {
      v12 = 0;
    }
  }
  objc_msgSend(v10, "setPassActivating:", v12);
  objc_msgSend(v10, "setContactlessInterfaceReady:", 0);
  -[NPKContactlessPaymentSessionManager _sendSessionStateToObservers:](self, "_sendSessionStateToObservers:", v10);

}

- (void)paymentSession:(id)a3 willActivatePass:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  _BOOL4 v9;
  NSObject *v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  uint64_t v16;
  id *v17;
  __CFString *v18;
  unint64_t v19;
  __CFString *v20;
  void *v21;
  __CFString *v22;
  id v23;
  void *v24;
  unint64_t v25;
  void *v26;
  uint64_t v27;
  __CFString *v28;
  unint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  id v34;
  void *v35;
  uint64_t v36;
  id v37;
  void *v38;
  uint64_t v39;
  void *v40;
  _QWORD v41[2];
  uint8_t buf[4];
  void *v43;
  uint64_t v44;

  v44 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  pk_Payment_log();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);

  if (v9)
  {
    pk_Payment_log();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v7, "uniqueID");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v43 = v11;
      _os_log_impl(&dword_213518000, v10, OS_LOG_TYPE_DEFAULT, "Notice: [PaymentSessionManager] Payment session will activate pass: %@", buf, 0xCu);

    }
  }
  kdebug_trace();
  if (objc_msgSend(v7, "style") != 8)
  {
    v12 = objc_alloc_init(MEMORY[0x24BDBCED8]);
    objc_msgSend(v12, "setObject:forKeyedSubscript:", *MEMORY[0x24BE6F0A8], *MEMORY[0x24BE6F018]);
    objc_msgSend(v12, "setObject:forKeyedSubscript:", *MEMORY[0x24BE6F0F0], *MEMORY[0x24BE6F0E8]);
    v13 = v12;
    v14 = v7;
    v15 = v14;
    if (!v14 || !v13)
    {
LABEL_32:

      v38 = (void *)MEMORY[0x24BE6E9C8];
      v39 = *MEMORY[0x24BE6F178];
      v41[0] = *MEMORY[0x24BE6F158];
      v41[1] = v39;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v41, 2);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "subjects:sendEvent:", v40, v13);

      goto LABEL_33;
    }
    v16 = objc_msgSend(v14, "passType");
    v17 = (id *)MEMORY[0x24BE6F148];
    if ((unint64_t)(v16 + 1) >= 3)
      v18 = (__CFString *)(id)*MEMORY[0x24BE6F148];
    else
      v18 = off_24CFE9D20[v16 + 1];
    objc_msgSend(v13, "setObject:forKeyedSubscript:", v18, *MEMORY[0x24BE6F118]);

    v19 = objc_msgSend(v15, "style");
    if (v19 < 0xD && ((0x13FFu >> v19) & 1) != 0)
      v20 = off_24CFE9D38[v19];
    else
      v20 = (__CFString *)*v17;
    objc_msgSend(v13, "setObject:forKeyedSubscript:", v20, *MEMORY[0x24BE6F110]);

    objc_msgSend(v15, "nfcPayload");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    PKAnalyticsReportSwitchToggleResultValue();
    v22 = (__CFString *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setObject:forKeyedSubscript:", v22, *MEMORY[0x24BE6F0F8]);

    v23 = v15;
    if (objc_msgSend(v23, "passType") == 1)
    {
      objc_msgSend(v23, "secureElementPass");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = objc_msgSend(v24, "cardType");
      if (v25 <= 4)
        v22 = (__CFString *)**((id **)&unk_24CFE9DA0 + v25);

    }
    else
    {
      v22 = CFSTR("other");
    }

    objc_msgSend(v13, "setObject:forKeyedSubscript:", v22, *MEMORY[0x24BE6F108]);
    objc_msgSend(v23, "secureElementPass");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v26, "isIdentityPass"))
    {
      v27 = objc_msgSend(v26, "identityType");
      if ((unint64_t)(v27 - 1) < 3)
      {
        v28 = off_24CFE9DC8[v27 - 1];
        goto LABEL_27;
      }
    }
    else if (objc_msgSend(v26, "isAccessPass"))
    {
      v29 = objc_msgSend(v26, "accessType");
      if (v29 < 7)
      {
        v28 = off_24CFE9DE0[v29];
        goto LABEL_27;
      }
    }
    v28 = (__CFString *)*v17;
LABEL_27:

    objc_msgSend(v13, "setObject:forKeyedSubscript:", v28, *MEMORY[0x24BE6F100]);
    objc_msgSend(v23, "secureElementPass");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "devicePaymentApplications");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "count");

    PKAnalyticsReportSwitchToggleResultValue();
    v32 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v13, "setObject:forKeyedSubscript:", v32, *MEMORY[0x24BE6EFE0]);
    objc_msgSend(v23, "secureElementPass");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = *v17;
    objc_msgSend(v33, "organizationName");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v35, "length"))
    {
      v36 = objc_msgSend(v33, "cardType");
      if (v36 == 4 || v36 == 2)
      {
        v37 = v35;

        v34 = v37;
      }
    }

    objc_msgSend(v13, "setObject:forKeyedSubscript:", v34, *MEMORY[0x24BE6F0C0]);
    goto LABEL_32;
  }
LABEL_33:
  -[NPKContactlessPaymentSessionManager paymentSession:didMakePassCurrent:](self, "paymentSession:didMakePassCurrent:", v6, v7);

}

- (void)paymentSession:(id)a3 didActivatePass:(id)a4
{
  id v5;
  NSObject *v6;
  _BOOL4 v7;
  NSObject *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v5 = a4;
  pk_Payment_log();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);

  if (v7)
  {
    pk_Payment_log();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v5, "uniqueID");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 138412290;
      v12 = v9;
      _os_log_impl(&dword_213518000, v8, OS_LOG_TYPE_DEFAULT, "Notice: [PaymentSessionManager] Payment session did activate pass: %@", (uint8_t *)&v11, 0xCu);

    }
  }
  kdebug_trace();
  if (self->_contactlessPaymentInterfaceVisible)
    kdebug_trace();
  -[NPKContactlessPaymentSessionManager _baseSessionStateForUpdate](self, "_baseSessionStateForUpdate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setCurrentPass:", v5);
  objc_msgSend(v10, "setPassActivating:", 0);
  objc_msgSend(v10, "setContactlessInterfaceReady:", 1);
  -[NPKContactlessPaymentSessionManager _sendSessionStateToObservers:](self, "_sendSessionStateToObservers:", v10);

}

- (void)paymentSession:(id)a3 didFailTransactionForPass:(id)a4 withValueAddedServiceTransactions:(id)a5 forValueAddedServicePasses:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  NSObject *v14;
  _BOOL4 v15;
  NSObject *v16;
  void *v17;
  id v18;
  NSObject *v19;
  _BOOL4 v20;
  NSObject *v21;
  void *v22;
  void *v23;
  NSObject *v24;
  _BOOL4 v25;
  NSObject *v26;
  int v27;
  void *v28;
  uint64_t v29;
  _QWORD v30[5];
  id v31;
  uint8_t v32[4];
  void *v33;
  __int16 v34;
  int v35;
  _BYTE buf[24];
  id v37;
  uint64_t v38;

  v38 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  pk_Payment_log();
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT);

  if (v15)
  {
    pk_Payment_log();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      -[NPKContactlessPaymentSessionManager quickPaymentSession](self, "quickPaymentSession");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      *(_QWORD *)&buf[4] = v10;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v17;
      *(_WORD *)&buf[22] = 2112;
      v37 = v11;
      _os_log_impl(&dword_213518000, v16, OS_LOG_TYPE_DEFAULT, "Notice: [PaymentSessionManager] Payment session %@ (current %@) failed (VAS) transaction for pass %@", buf, 0x20u);

    }
  }
  if (v12)
  {
    v31 = 0;
    -[NPKContactlessPaymentSessionManager _handleValueAddedServiceTransactions:forValueAddedServicePasses:paymentTransaction:outUserInterventionRequiredPasses:](self, "_handleValueAddedServiceTransactions:forValueAddedServicePasses:paymentTransaction:outUserInterventionRequiredPasses:", v12, v13, 0, &v31);
    v18 = v31;
  }
  else
  {
    v18 = 0;
  }
  if (!objc_msgSend(v18, "count"))
  {
    if (!objc_msgSend(v12, "count"))
      goto LABEL_25;
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x2020000000;
    LOBYTE(v37) = 1;
    v30[0] = MEMORY[0x24BDAC760];
    v30[1] = 3221225472;
    v30[2] = __141__NPKContactlessPaymentSessionManager_paymentSession_didFailTransactionForPass_withValueAddedServiceTransactions_forValueAddedServicePasses___block_invoke;
    v30[3] = &unk_24CFE9A90;
    v30[4] = buf;
    objc_msgSend(v12, "enumerateObjectsUsingBlock:", v30);
    -[NPKContactlessPaymentSessionManager quickPaymentSession](self, "quickPaymentSession");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "currentPass");
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    pk_Payment_log();
    v24 = objc_claimAutoreleasedReturnValue();
    v25 = os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT);

    if (v25)
    {
      pk_Payment_log();
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        v27 = objc_msgSend(v23, "style");
        *(_DWORD *)v32 = 138412546;
        v33 = v23;
        v34 = 1024;
        v35 = v27;
        _os_log_impl(&dword_213518000, v26, OS_LOG_TYPE_DEFAULT, "Notice: [PaymentSessionManager] current pass unique ID is %@ style %d", v32, 0x12u);
      }

    }
    -[NPKContactlessPaymentSessionManager _baseSessionStateForUpdate](self, "_baseSessionStateForUpdate");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "setCurrentPass:", v11);
    objc_msgSend(v28, "setContactlessInterfaceReady:", 1);
    if (objc_msgSend(v23, "passType") == 1 && *(_BYTE *)(*(_QWORD *)&buf[8] + 24))
    {
      v29 = 4;
    }
    else
    {
      if (!objc_msgSend(v23, "npkHasValidNFCPayload"))
      {
LABEL_24:
        -[NPKContactlessPaymentSessionManager _sendSessionStateToObservers:](self, "_sendSessionStateToObservers:", v28);

        _Block_object_dispose(buf, 8);
        goto LABEL_25;
      }
      v29 = 2;
    }
    objc_msgSend(v28, "setFailureType:", v29);
    goto LABEL_24;
  }
  pk_Payment_log();
  v19 = objc_claimAutoreleasedReturnValue();
  v20 = os_log_type_enabled(v19, OS_LOG_TYPE_ERROR);

  if (v20)
  {
    pk_Payment_log();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)&buf[4] = v18;
      _os_log_impl(&dword_213518000, v21, OS_LOG_TYPE_ERROR, "Error: [PaymentSessionManager] Got user intervention required passes %@", buf, 0xCu);
    }

  }
LABEL_25:

}

uint64_t __141__NPKContactlessPaymentSessionManager_paymentSession_didFailTransactionForPass_withValueAddedServiceTransactions_forValueAddedServicePasses___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  uint64_t result;

  result = objc_msgSend(a2, "terminalMode");
  if (result != 2)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 0;
    *a4 = 1;
  }
  return result;
}

- (void)paymentSession:(id)a3 didCompleteTransactionForReason:(unint64_t)a4 withTransactionContext:(id)a5 shouldCleanupSession:(BOOL)a6
{
  id v10;
  id v11;
  NSObject *v12;
  _BOOL4 v13;
  NSObject *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  unint64_t v19;
  void *v20;
  _BOOL4 v21;
  NSObject *v22;
  _BOOL4 v23;
  NSObject *v24;
  uint64_t v25;
  int v26;
  id v27;
  __int16 v28;
  void *v29;
  __int16 v30;
  void *v31;
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a5;
  pk_Payment_log();
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);

  if (v13)
  {
    pk_Payment_log();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      -[NPKContactlessPaymentSessionManager quickPaymentSession](self, "quickPaymentSession");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromNPKQuickPaymentSessionCompletionReason(a4);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = 138412802;
      v27 = v10;
      v28 = 2112;
      v29 = v15;
      v30 = 2112;
      v31 = v16;
      _os_log_impl(&dword_213518000, v14, OS_LOG_TYPE_DEFAULT, "Notice: [PaymentSessionManager] Payment session %@ (current %@) completed for reason %@", (uint8_t *)&v26, 0x20u);

    }
  }
  -[NPKContactlessPaymentSessionManager quickPaymentSession](self, "quickPaymentSession");
  v17 = (id)objc_claimAutoreleasedReturnValue();

  if (v17 == v10)
  {
    -[NPKContactlessPaymentSessionManager _sessionStateForTransactionContext:](self, "_sessionStateForTransactionContext:", v11);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setCompletionReason:", a4);
    v19 = a4 - 4;
    if (a4 - 4 <= 6 && ((0x73u >> v19) & 1) != 0)
      objc_msgSend(v18, "setFailureType:", qword_2137720B0[v19]);
    -[NPKContactlessPaymentSessionManager _sendSessionStateToObservers:](self, "_sendSessionStateToObservers:", v18);
    if (objc_msgSend(v18, "hasSession"))
    {
      objc_msgSend(v18, "transactionContext");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(v20, "transactionType") == 5;

      if (a6)
        goto LABEL_14;
    }
    else
    {
      v21 = 0;
      if (a6)
        goto LABEL_14;
    }
    if (!v21)
    {
LABEL_19:

      goto LABEL_20;
    }
LABEL_14:
    pk_Payment_log();
    v22 = objc_claimAutoreleasedReturnValue();
    v23 = os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT);

    if (v23)
    {
      pk_Payment_log();
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v26) = 0;
        _os_log_impl(&dword_213518000, v24, OS_LOG_TYPE_DEFAULT, "Notice: [PaymentSessionManager] Will cleanup payment session", (uint8_t *)&v26, 2u);
      }

    }
    -[NPKContactlessPaymentSessionManager _cleanupQuickPaymentSession](self, "_cleanupQuickPaymentSession");
    -[NPKContactlessPaymentSessionManager _baseSessionStateForUpdate](self, "_baseSessionStateForUpdate");
    v25 = objc_claimAutoreleasedReturnValue();

    -[NPKContactlessPaymentSessionManager _sendSessionStateToObservers:](self, "_sendSessionStateToObservers:", v25);
    v18 = (void *)v25;
    goto LABEL_19;
  }
LABEL_20:

}

- (void)paymentSessionDidEnterField:(id)a3
{
  id v4;
  NSObject *v5;
  _BOOL4 v6;
  NSObject *v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  uint64_t v13;
  id *v14;
  __CFString *v15;
  unint64_t v16;
  __CFString *v17;
  void *v18;
  __CFString *v19;
  id v20;
  void *v21;
  unint64_t v22;
  void *v23;
  uint64_t v24;
  __CFString *v25;
  unint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  void *v32;
  uint64_t v33;
  id v34;
  void *v35;
  uint64_t v36;
  void *v37;
  void *v38;
  void *v39;
  uint64_t v40;
  void *v41;
  uint8_t v42[8];
  _QWORD v43[3];

  v43[2] = *MEMORY[0x24BDAC8D0];
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
      *(_WORD *)v42 = 0;
      _os_log_impl(&dword_213518000, v7, OS_LOG_TYPE_DEFAULT, "Notice: [PaymentSessionManager] Payment session detected field entry", v42, 2u);
    }

  }
  objc_msgSend(v4, "currentPass");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "style") != 8)
  {
    v9 = objc_alloc_init(MEMORY[0x24BDBCED8]);
    objc_msgSend(v9, "setObject:forKeyedSubscript:", *MEMORY[0x24BE6F078], *MEMORY[0x24BE6F018]);
    v10 = v9;
    v11 = v8;
    v12 = v11;
    if (!v11 || !v10)
    {
LABEL_32:

      v35 = (void *)MEMORY[0x24BE6E9C8];
      v36 = *MEMORY[0x24BE6F178];
      v43[0] = *MEMORY[0x24BE6F158];
      v43[1] = v36;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v43, 2);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "subjects:sendEvent:", v37, v10);

      goto LABEL_33;
    }
    v13 = objc_msgSend(v11, "passType");
    v14 = (id *)MEMORY[0x24BE6F148];
    if ((unint64_t)(v13 + 1) >= 3)
      v15 = (__CFString *)(id)*MEMORY[0x24BE6F148];
    else
      v15 = off_24CFE9D20[v13 + 1];
    objc_msgSend(v10, "setObject:forKeyedSubscript:", v15, *MEMORY[0x24BE6F118]);

    v16 = objc_msgSend(v12, "style");
    if (v16 < 0xD && ((0x13FFu >> v16) & 1) != 0)
      v17 = off_24CFE9D38[v16];
    else
      v17 = (__CFString *)*v14;
    objc_msgSend(v10, "setObject:forKeyedSubscript:", v17, *MEMORY[0x24BE6F110]);

    objc_msgSend(v12, "nfcPayload");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    PKAnalyticsReportSwitchToggleResultValue();
    v19 = (__CFString *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setObject:forKeyedSubscript:", v19, *MEMORY[0x24BE6F0F8]);

    v20 = v12;
    if (objc_msgSend(v20, "passType") == 1)
    {
      objc_msgSend(v20, "secureElementPass");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = objc_msgSend(v21, "cardType");
      if (v22 <= 4)
        v19 = (__CFString *)**((id **)&unk_24CFE9DA0 + v22);

    }
    else
    {
      v19 = CFSTR("other");
    }

    objc_msgSend(v10, "setObject:forKeyedSubscript:", v19, *MEMORY[0x24BE6F108]);
    objc_msgSend(v20, "secureElementPass");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v23, "isIdentityPass"))
    {
      v24 = objc_msgSend(v23, "identityType");
      if ((unint64_t)(v24 - 1) < 3)
      {
        v25 = off_24CFE9DC8[v24 - 1];
        goto LABEL_27;
      }
    }
    else if (objc_msgSend(v23, "isAccessPass"))
    {
      v26 = objc_msgSend(v23, "accessType");
      if (v26 < 7)
      {
        v25 = off_24CFE9DE0[v26];
        goto LABEL_27;
      }
    }
    v25 = (__CFString *)*v14;
LABEL_27:

    objc_msgSend(v10, "setObject:forKeyedSubscript:", v25, *MEMORY[0x24BE6F100]);
    objc_msgSend(v20, "secureElementPass");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "devicePaymentApplications");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "count");

    PKAnalyticsReportSwitchToggleResultValue();
    v29 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "setObject:forKeyedSubscript:", v29, *MEMORY[0x24BE6EFE0]);
    objc_msgSend(v20, "secureElementPass");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = *v14;
    objc_msgSend(v30, "organizationName");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v32, "length"))
    {
      v33 = objc_msgSend(v30, "cardType");
      if (v33 == 4 || v33 == 2)
      {
        v34 = v32;

        v31 = v34;
      }
    }

    objc_msgSend(v10, "setObject:forKeyedSubscript:", v31, *MEMORY[0x24BE6F0C0]);
    goto LABEL_32;
  }
LABEL_33:
  objc_msgSend(v4, "currentPass");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "paymentPass");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = objc_msgSend(v39, "effectiveContactlessPaymentApplicationState");
  if (!v38 || v39 && v40 != 1)
  {
    -[NPKContactlessPaymentSessionManager _baseSessionStateForUpdate](self, "_baseSessionStateForUpdate");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "setCurrentPass:", v38);
    objc_msgSend(v41, "setFailureType:", 5);
    -[NPKContactlessPaymentSessionManager _sendSessionStateToObservers:](self, "_sendSessionStateToObservers:", v41);

  }
}

- (void)paymentSessionDidExitField:(id)a3
{
  id v3;
  NSObject *v4;
  _BOOL4 v5;
  NSObject *v6;
  void *v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  id *v13;
  __CFString *v14;
  unint64_t v15;
  __CFString *v16;
  void *v17;
  __CFString *v18;
  id v19;
  void *v20;
  unint64_t v21;
  void *v22;
  uint64_t v23;
  __CFString *v24;
  unint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  void *v31;
  uint64_t v32;
  id v33;
  void *v34;
  uint64_t v35;
  void *v36;
  uint8_t v37[8];
  _QWORD v38[3];

  v38[2] = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  pk_Payment_log();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);

  if (v5)
  {
    pk_Payment_log();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v37 = 0;
      _os_log_impl(&dword_213518000, v6, OS_LOG_TYPE_DEFAULT, "Notice: [PaymentSessionManager] Payment session detected field exit", v37, 2u);
    }

  }
  objc_msgSend(v3, "currentPass");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "style") != 8)
  {
    v8 = objc_alloc_init(MEMORY[0x24BDBCED8]);
    objc_msgSend(v8, "setObject:forKeyedSubscript:", *MEMORY[0x24BE6F080], *MEMORY[0x24BE6F018]);
    v9 = v8;
    v10 = v7;
    v11 = v10;
    if (!v10 || !v9)
    {
LABEL_32:

      v34 = (void *)MEMORY[0x24BE6E9C8];
      v35 = *MEMORY[0x24BE6F178];
      v38[0] = *MEMORY[0x24BE6F158];
      v38[1] = v35;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v38, 2);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "subjects:sendEvent:", v36, v9);

      goto LABEL_33;
    }
    v12 = objc_msgSend(v10, "passType");
    v13 = (id *)MEMORY[0x24BE6F148];
    if ((unint64_t)(v12 + 1) >= 3)
      v14 = (__CFString *)(id)*MEMORY[0x24BE6F148];
    else
      v14 = off_24CFE9D20[v12 + 1];
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v14, *MEMORY[0x24BE6F118]);

    v15 = objc_msgSend(v11, "style");
    if (v15 < 0xD && ((0x13FFu >> v15) & 1) != 0)
      v16 = off_24CFE9D38[v15];
    else
      v16 = (__CFString *)*v13;
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v16, *MEMORY[0x24BE6F110]);

    objc_msgSend(v11, "nfcPayload");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    PKAnalyticsReportSwitchToggleResultValue();
    v18 = (__CFString *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v18, *MEMORY[0x24BE6F0F8]);

    v19 = v11;
    if (objc_msgSend(v19, "passType") == 1)
    {
      objc_msgSend(v19, "secureElementPass");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(v20, "cardType");
      if (v21 <= 4)
        v18 = (__CFString *)**((id **)&unk_24CFE9DA0 + v21);

    }
    else
    {
      v18 = CFSTR("other");
    }

    objc_msgSend(v9, "setObject:forKeyedSubscript:", v18, *MEMORY[0x24BE6F108]);
    objc_msgSend(v19, "secureElementPass");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v22, "isIdentityPass"))
    {
      v23 = objc_msgSend(v22, "identityType");
      if ((unint64_t)(v23 - 1) < 3)
      {
        v24 = off_24CFE9DC8[v23 - 1];
        goto LABEL_27;
      }
    }
    else if (objc_msgSend(v22, "isAccessPass"))
    {
      v25 = objc_msgSend(v22, "accessType");
      if (v25 < 7)
      {
        v24 = off_24CFE9DE0[v25];
        goto LABEL_27;
      }
    }
    v24 = (__CFString *)*v13;
LABEL_27:

    objc_msgSend(v9, "setObject:forKeyedSubscript:", v24, *MEMORY[0x24BE6F100]);
    objc_msgSend(v19, "secureElementPass");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "devicePaymentApplications");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "count");

    PKAnalyticsReportSwitchToggleResultValue();
    v28 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "setObject:forKeyedSubscript:", v28, *MEMORY[0x24BE6EFE0]);
    objc_msgSend(v19, "secureElementPass");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = *v13;
    objc_msgSend(v29, "organizationName");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v31, "length"))
    {
      v32 = objc_msgSend(v29, "cardType");
      if (v32 == 4 || v32 == 2)
      {
        v33 = v31;

        v30 = v33;
      }
    }

    objc_msgSend(v9, "setObject:forKeyedSubscript:", v30, *MEMORY[0x24BE6F0C0]);
    goto LABEL_32;
  }
LABEL_33:

}

- (void)paymentSessionDidSelectPayment:(id)a3
{
  void *v4;
  void *v5;
  NSObject *v6;
  _BOOL4 v7;
  NSObject *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  -[NPKContactlessPaymentSessionManager quickPaymentSession](self, "quickPaymentSession", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "currentPass");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  pk_Payment_log();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);

  if (v7)
  {
    pk_Payment_log();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v5, "uniqueID");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 138412290;
      v12 = v9;
      _os_log_impl(&dword_213518000, v8, OS_LOG_TYPE_DEFAULT, "Notice: [PaymentSessionManager] Payment session did select payment for unique ID: %@", (uint8_t *)&v11, 0xCu);

    }
  }
  if (objc_msgSend(v5, "passType") != 1)
  {
    -[NPKContactlessPaymentSessionManager _baseSessionStateForUpdate](self, "_baseSessionStateForUpdate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setCurrentPass:", v5);
    objc_msgSend(v10, "setFailureType:", 3);
    -[NPKContactlessPaymentSessionManager _sendSessionStateToObservers:](self, "_sendSessionStateToObservers:", v10);

  }
}

- (void)paymentSessionDidSelectValueAddedService:(id)a3
{
  NSObject *v3;
  _BOOL4 v4;
  NSObject *v5;
  uint8_t v6[16];

  pk_Payment_log();
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);

  if (v4)
  {
    pk_Payment_log();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_213518000, v5, OS_LOG_TYPE_DEFAULT, "Notice: [PaymentSessionManager] Payment session selected value added service", v6, 2u);
    }

  }
}

- (void)paymentSessionDidReceiveStartTransaction:(id)a3
{
  NSObject *v3;
  _BOOL4 v4;
  NSObject *v5;
  uint8_t v6[16];

  pk_Payment_log();
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);

  if (v4)
  {
    pk_Payment_log();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_213518000, v5, OS_LOG_TYPE_DEFAULT, "Notice: [PaymentSessionManager] Payment session received start transaction", v6, 2u);
    }

  }
}

- (void)paymentSessionDidReceiveActivityTimeout:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  NSObject *v8;
  _BOOL4 v9;
  NSObject *v10;
  int v11;
  NSObject *v12;
  _BOOL4 v13;
  NSObject *v14;
  void *v15;
  NSObject *v16;
  NPKContactlessPaymentSessionManagerTransactionContext *v17;
  void *v18;
  id v19;
  dispatch_semaphore_t v20;
  void *v21;
  void *v22;
  void *v23;
  NSObject *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  void (*v31)(uint64_t, void *);
  void *v32;
  NSObject *v33;
  __int128 *p_buf;
  __int128 buf;
  uint64_t v36;
  uint64_t (*v37)(uint64_t, uint64_t);
  void (*v38)(uint64_t);
  id v39;
  uint64_t v40;

  v40 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "currentPass");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "paymentPass");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isTransitPass");

  pk_Payment_log();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);

  if (v9)
  {
    pk_Payment_log();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf) = 67109120;
      DWORD1(buf) = v7;
      _os_log_impl(&dword_213518000, v10, OS_LOG_TYPE_DEFAULT, "Notice: [PaymentSessionManager] Payment session received activity timeout isTransit %i", (uint8_t *)&buf, 8u);
    }

  }
  if (v7)
  {
    v11 = NPKIsTruthOnCardTransitPass(v5);
    pk_Payment_log();
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);

    if (v11)
    {
      if (v13)
      {
        pk_Payment_log();
        v14 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(buf) = 0;
          _os_log_impl(&dword_213518000, v14, OS_LOG_TYPE_DEFAULT, "Notice: [PaymentSessionManager] Handling activity timeout in transit pass as completion", (uint8_t *)&buf, 2u);
        }

      }
      -[NPKContactlessPaymentSessionManager quickPaymentSession](self, "quickPaymentSession");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "currentPass");
      v16 = objc_claimAutoreleasedReturnValue();

      v17 = objc_alloc_init(NPKContactlessPaymentSessionManagerTransactionContext);
      -[NPKContactlessPaymentSessionManagerTransactionContext setTransactionStatus:](v17, "setTransactionStatus:", 2);
      objc_msgSend(v4, "currentPass");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[NPKContactlessPaymentSessionManagerTransactionContext setTransactionPass:](v17, "setTransactionPass:", v18);

      if (NPKIsTruthOnCardTransitPass(v16))
      {
        v19 = objc_alloc_init(MEMORY[0x24BE6ED30]);
        v20 = dispatch_semaphore_create(0);
        *(_QWORD *)&buf = 0;
        *((_QWORD *)&buf + 1) = &buf;
        v36 = 0x3032000000;
        v37 = __Block_byref_object_copy__8;
        v38 = __Block_byref_object_dispose__8;
        v39 = 0;
        -[NSObject uniqueID](v16, "uniqueID");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSObject paymentPass](v16, "paymentPass");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "devicePrimaryPaymentApplication");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = MEMORY[0x24BDAC760];
        v30 = 3221225472;
        v31 = __79__NPKContactlessPaymentSessionManager_paymentSessionDidReceiveActivityTimeout___block_invoke;
        v32 = &unk_24CFE9AB8;
        p_buf = &buf;
        v24 = v20;
        v33 = v24;
        objc_msgSend(v19, "transitStateWithPassUniqueIdentifier:paymentApplication:completion:", v21, v23, &v29);

        dispatch_semaphore_wait(v24, 0xFFFFFFFFFFFFFFFFLL);
        -[NSObject paymentPass](v16, "paymentPass", v29, v30, v31, v32);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "npkPreferredContactlessPaymentApplication");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        -[NPKContactlessPaymentSessionManagerTransactionContext updateWithConcreteTransactions:ephemeralTransaction:updatedPassTransitItems:paymentApplication:](v17, "updateWithConcreteTransactions:ephemeralTransaction:updatedPassTransitItems:paymentApplication:", MEMORY[0x24BDBD1A8], 0, MEMORY[0x24BDBD1A8], v26);

        if (*(_QWORD *)(*((_QWORD *)&buf + 1) + 40))
          -[NPKContactlessPaymentSessionManagerTransactionContext forceToTransitTypeTransactionWithTransactionStatus:](v17, "forceToTransitTypeTransactionWithTransactionStatus:", 1);

        _Block_object_dispose(&buf, 8);
      }
      else
      {
        -[NSObject paymentPass](v16, "paymentPass");
        v19 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "npkPreferredContactlessPaymentApplication");
        v24 = objc_claimAutoreleasedReturnValue();
        -[NPKContactlessPaymentSessionManagerTransactionContext updateWithConcreteTransactions:ephemeralTransaction:updatedPassTransitItems:paymentApplication:](v17, "updateWithConcreteTransactions:ephemeralTransaction:updatedPassTransitItems:paymentApplication:", MEMORY[0x24BDBD1A8], 0, MEMORY[0x24BDBD1A8], v24);
      }

      -[NPKContactlessPaymentSessionManager _baseSessionStateForUpdate](self, "_baseSessionStateForUpdate");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "setCurrentPass:", v16);
      objc_msgSend(v28, "setSessionAuthorized:", 0);
      objc_msgSend(v28, "setDoublePressReceived:", 0);
      objc_msgSend(v28, "setContactlessInterfaceReady:", 0);
      objc_msgSend(v28, "setCanChangePass:", 1);
      objc_msgSend(v28, "setCompletionReason:", 0);
      objc_msgSend(v28, "setTransactionContext:", v17);
      -[NPKContactlessPaymentSessionManager _sendSessionStateToObservers:](self, "_sendSessionStateToObservers:", v28);

LABEL_20:
      goto LABEL_21;
    }
    if (v13)
    {
      pk_Payment_log();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v5, "uniqueID");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(buf) = 138412290;
        *(_QWORD *)((char *)&buf + 4) = v27;
        _os_log_impl(&dword_213518000, v16, OS_LOG_TYPE_DEFAULT, "Notice: [PaymentSessionManager] unexpected activity timeout event for cEMV pass with uniqueID:%@", (uint8_t *)&buf, 0xCu);

      }
      goto LABEL_20;
    }
  }
LABEL_21:

}

void __79__NPKContactlessPaymentSessionManager_paymentSessionDidReceiveActivityTimeout___block_invoke(uint64_t a1, void *a2)
{
  id v4;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

- (void)paymentSessionDidReceiveCredential:(id)a3
{
  NSObject *v4;
  _BOOL4 v5;
  NSObject *v6;
  void *v7;
  uint8_t v8[16];

  pk_Payment_log();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);

  if (v5)
  {
    pk_Payment_log();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl(&dword_213518000, v6, OS_LOG_TYPE_DEFAULT, "Notice: [PaymentSessionManager] Payment session received credential", v8, 2u);
    }

  }
  -[NPKContactlessPaymentSessionManager _baseSessionStateForUpdate](self, "_baseSessionStateForUpdate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setSessionAuthorized:", 1);
  -[NPKContactlessPaymentSessionManager _sendSessionStateToObservers:](self, "_sendSessionStateToObservers:", v7);

}

- (void)paymentSession:(id)a3 didReceive18013Request:(id)a4 readerAuthInfo:(id)a5
{
  id v7;
  id v8;
  NSObject *v9;
  _BOOL4 v10;
  NSObject *v11;
  uint8_t v12[16];

  v7 = a4;
  v8 = a5;
  pk_Payment_log();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);

  if (v10)
  {
    pk_Payment_log();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v12 = 0;
      _os_log_impl(&dword_213518000, v11, OS_LOG_TYPE_DEFAULT, "Notice: [PaymentSessionManager] Payment session received 18013 Request", v12, 2u);
    }

  }
  -[NPKContactlessPaymentSessionManager handleISO18013Request:withReaderAuthInfo:](self, "handleISO18013Request:withReaderAuthInfo:", v7, v8);

}

- (void)paymentSessionDidReceiveAuthorizationTimeout:(id)a3
{
  NSObject *v4;
  _BOOL4 v5;
  NSObject *v6;
  void *v7;
  uint8_t v8[16];

  pk_Payment_log();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);

  if (v5)
  {
    pk_Payment_log();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl(&dword_213518000, v6, OS_LOG_TYPE_DEFAULT, "Notice: [PaymentSessionManager] Payment session received authorization timeout", v8, 2u);
    }

  }
  -[NPKContactlessPaymentSessionManager _baseSessionStateForUpdate](self, "_baseSessionStateForUpdate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setDoublePressReceived:", 0);
  objc_msgSend(v7, "setSessionAuthorized:", 0);
  if (-[NPKContactlessPaymentSessionState sessionAuthorized](self->_lastSessionState, "sessionAuthorized"))
  {
    objc_msgSend(v7, "setFailureType:", 6);
    -[NPKContactlessPaymentSessionManager _sendSessionStateToObservers:](self, "_sendSessionStateToObservers:", v7);
  }

}

- (void)paymentSessionDidReceiveActivationError:(id)a3
{
  NSObject *v4;
  _BOOL4 v5;
  NSObject *v6;
  void *v7;
  uint8_t v8[16];

  pk_Payment_log();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);

  if (v5)
  {
    pk_Payment_log();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl(&dword_213518000, v6, OS_LOG_TYPE_DEFAULT, "Notice: [PaymentSessionManager] Payment session received activation error", v8, 2u);
    }

  }
  -[NPKContactlessPaymentSessionManager _baseSessionStateForUpdate](self, "_baseSessionStateForUpdate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setDoublePressReceived:", 0);
  objc_msgSend(v7, "setSessionAuthorized:", 0);
  objc_msgSend(v7, "setFailureType:", 1);
  -[NPKContactlessPaymentSessionManager _sendSessionStateToObservers:](self, "_sendSessionStateToObservers:", v7);

}

- (void)paymentSessionDidReceiveTransactionError:(id)a3
{
  NSObject *v4;
  _BOOL4 v5;
  NSObject *v6;
  void *v7;
  uint8_t v8[16];

  pk_Payment_log();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);

  if (v5)
  {
    pk_Payment_log();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl(&dword_213518000, v6, OS_LOG_TYPE_DEFAULT, "Notice: [PaymentSessionManager] Payment session received transaction error", v8, 2u);
    }

  }
  -[NPKContactlessPaymentSessionManager _baseSessionStateForUpdate](self, "_baseSessionStateForUpdate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setDoublePressReceived:", 0);
  objc_msgSend(v7, "setSessionAuthorized:", 0);
  objc_msgSend(v7, "setFailureType:", 2);
  -[NPKContactlessPaymentSessionManager _sendSessionStateToObservers:](self, "_sendSessionStateToObservers:", v7);

}

- (void)paymentSessionIsWaitingToStart:(id)a3
{
  NSObject *v4;
  _BOOL4 v5;
  NSObject *v6;
  void *v7;
  uint8_t v8[16];

  pk_Payment_log();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);

  if (v5)
  {
    pk_Payment_log();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl(&dword_213518000, v6, OS_LOG_TYPE_DEFAULT, "Notice: [PaymentSessionManager] Payment session waiting to start", v8, 2u);
    }

  }
  -[NPKContactlessPaymentSessionManager _baseSessionStateForUpdate](self, "_baseSessionStateForUpdate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setSessionWaitingToStart:", 1);
  -[NPKContactlessPaymentSessionManager _sendSessionStateToObservers:](self, "_sendSessionStateToObservers:", v7);

}

- (void)paymentSessionDidStart:(id)a3
{
  NSObject *v4;
  _BOOL4 v5;
  NSObject *v6;
  void *v7;
  uint8_t v8[16];

  pk_Payment_log();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);

  if (v5)
  {
    pk_Payment_log();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl(&dword_213518000, v6, OS_LOG_TYPE_DEFAULT, "Notice: [PaymentSessionManager] Payment session did start", v8, 2u);
    }

  }
  -[NPKContactlessPaymentSessionManager _baseSessionStateForUpdate](self, "_baseSessionStateForUpdate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPKContactlessPaymentSessionManager _sendSessionStateToObservers:](self, "_sendSessionStateToObservers:", v7);

}

- (void)_cleanupQuickPaymentSession
{
  void *v3;
  NSObject *v4;
  _BOOL4 v5;
  NSObject *v6;
  void *v7;
  int v8;
  const char *v9;
  __int16 v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  -[NPKContactlessPaymentSessionManager quickPaymentSession](self, "quickPaymentSession");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    pk_Payment_log();
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);

    if (v5)
    {
      pk_Payment_log();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        v8 = 136315394;
        v9 = "-[NPKContactlessPaymentSessionManager _cleanupQuickPaymentSession]";
        v10 = 2112;
        v11 = v3;
        _os_log_impl(&dword_213518000, v6, OS_LOG_TYPE_DEFAULT, "Notice: [PaymentSessionManager] %s cleaning payment session:%@", (uint8_t *)&v8, 0x16u);
      }

    }
    objc_msgSend(v3, "deactivateSessionWithCompletion:", 0);
    -[NPKContactlessPaymentSessionManager setQuickPaymentSession:](self, "setQuickPaymentSession:", 0);
    -[NPKContactlessPaymentSessionManager cleanupDelegate](self, "cleanupDelegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setDelegate:", v7);

    -[NPKContactlessPaymentSessionManager _stopSessionTimer](self, "_stopSessionTimer");
  }

}

- (id)_managerContextForContactlessInterfaceTransactionContext:(id)a3
{
  id v4;
  NPKContactlessPaymentSessionManagerTransactionContext *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  id v18;
  NPKContactlessPaymentSessionManagerTransactionContext *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  id v32;
  dispatch_semaphore_t v33;
  void *v34;
  NSObject *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  id v46;
  void *v47;
  void *v48;
  id v49;
  id v50;
  void *v51;
  NPKContactlessPaymentSessionManagerTransactionContext *v52;
  NSObject *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  id v59;
  id v60;
  id v61;
  _QWORD v62[4];
  NSObject *v63;
  uint64_t *v64;
  uint64_t v65;
  uint64_t *v66;
  uint64_t v67;
  uint64_t (*v68)(uint64_t, uint64_t);
  void (*v69)(uint64_t);
  id v70;
  _QWORD v71[4];
  id v72;
  NPKContactlessPaymentSessionManagerTransactionContext *v73;

  v4 = a3;
  v5 = objc_alloc_init(NPKContactlessPaymentSessionManagerTransactionContext);
  objc_msgSend(v4, "paymentPass");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPKContactlessPaymentSessionManagerTransactionContext setTransactionPass:](v5, "setTransactionPass:", v6);

  objc_msgSend(v4, "paymentPass");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPKContactlessPaymentSessionManagerTransactionContext setValueAddedServicePass:](v5, "setValueAddedServicePass:", v7);

  objc_msgSend(v4, "transaction");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPKContactlessPaymentSessionManagerTransactionContext setPaymentTransaction:](v5, "setPaymentTransaction:", v8);

  -[NPKContactlessPaymentSessionManager lastSessionState](self, "lastSessionState");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "transactionContext");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "transactionType");

  if (v11 == 5)
  {
    if (objc_msgSend(v4, "success"))
      v12 = 4;
    else
      v12 = 5;
    -[NPKContactlessPaymentSessionManagerTransactionContext setReleaseDataStatus:](v5, "setReleaseDataStatus:", v12);
    -[NPKContactlessPaymentSessionManagerTransactionContext setTransactionType:](v5, "setTransactionType:", 5);
    -[NPKContactlessPaymentSessionManager lastSessionState](self, "lastSessionState");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "transactionContext");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "releaseDataRequest");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[NPKContactlessPaymentSessionManagerTransactionContext setReleaseDataRequest:](v5, "setReleaseDataRequest:", v15);

  }
  objc_msgSend(v4, "valueAddedServiceTransactions");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = MEMORY[0x24BDAC760];
  v71[0] = MEMORY[0x24BDAC760];
  v71[1] = 3221225472;
  v71[2] = __96__NPKContactlessPaymentSessionManager__managerContextForContactlessInterfaceTransactionContext___block_invoke;
  v71[3] = &unk_24CFE9B08;
  v18 = v4;
  v72 = v18;
  v19 = v5;
  v73 = v19;
  objc_msgSend(v16, "enumerateObjectsUsingBlock:", v71);

  objc_msgSend(v18, "valueAddedServicePasses");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "firstObject");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPKContactlessPaymentSessionManagerTransactionContext setValueAddedServicePass:](v19, "setValueAddedServicePass:", v21);

  -[NPKContactlessPaymentSessionManagerTransactionContext transactionPass](v19, "transactionPass");
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v22)
  {
    -[NPKContactlessPaymentSessionManagerTransactionContext valueAddedServicePass](v19, "valueAddedServicePass");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[NPKContactlessPaymentSessionManagerTransactionContext setTransactionPass:](v19, "setTransactionPass:", v23);

  }
  objc_msgSend(v18, "transaction");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  if (v24)
  {
    v25 = objc_alloc_init(MEMORY[0x24BE6ED30]);
    objc_msgSend(v18, "paymentPass");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "uniqueID");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "paymentApplication");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "insertOrUpdatePaymentTransaction:forPassUniqueIdentifier:paymentApplication:completion:", v24, v27, v28, 0);

  }
  else
  {
    objc_msgSend(v18, "transitHistory");
    v29 = (void *)objc_claimAutoreleasedReturnValue();

    if (v29)
    {
      objc_msgSend(v18, "paymentPass");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "uniqueID");
      v31 = objc_claimAutoreleasedReturnValue();
      v32 = objc_alloc_init(MEMORY[0x24BE6ED30]);
      v33 = dispatch_semaphore_create(0);
      v65 = 0;
      v66 = &v65;
      v67 = 0x3032000000;
      v68 = __Block_byref_object_copy__8;
      v69 = __Block_byref_object_dispose__8;
      v70 = 0;
      v56 = v30;
      objc_msgSend(v30, "devicePrimaryPaymentApplication");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v62[0] = v17;
      v62[1] = 3221225472;
      v62[2] = __96__NPKContactlessPaymentSessionManager__managerContextForContactlessInterfaceTransactionContext___block_invoke_3;
      v62[3] = &unk_24CFE9AB8;
      v64 = &v65;
      v35 = v33;
      v63 = v35;
      objc_msgSend(v32, "transitStateWithPassUniqueIdentifier:paymentApplication:completion:", v31, v34, v62);
      v58 = v32;
      v55 = (void *)v31;

      v54 = v35;
      dispatch_semaphore_wait(v35, 0xFFFFFFFFFFFFFFFFLL);
      v60 = 0;
      v61 = (id)MEMORY[0x24BDBD1A8];
      v59 = 0;
      v36 = (void *)v66[5];
      objc_msgSend(v18, "transitHistory");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      -[NPKContactlessPaymentSessionManagerTransactionContext transactionPass](v19, "transactionPass");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "paymentPass");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "npk_processUpdateWithAppletHistory:concreteTransactions:ephemeralTransaction:mutatedBalances:pass:", v37, &v61, &v60, &v59, v39);
      v57 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v18, "transitHistory");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "date");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "paymentApplication");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "paymentPass");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "uniqueID");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "expressState");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v58, "processTransitTransactionEventWithHistory:transactionDate:forPaymentApplication:withPassUniqueIdentifier:expressTransactionState:", v40, v41, v42, v44, v45);

      v46 = v59;
      objc_msgSend(v18, "paymentApplication");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      -[NPKContactlessPaymentSessionManager _updatedPassItemFieldWithPaymentPass:transitAppletBalances:appletState:paymentApplication:](self, "_updatedPassItemFieldWithPaymentPass:transitAppletBalances:appletState:paymentApplication:", v56, v46, v57, v47);
      v48 = (void *)objc_claimAutoreleasedReturnValue();

      v50 = v60;
      v49 = v61;
      objc_msgSend(v18, "paymentApplication");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      -[NPKContactlessPaymentSessionManagerTransactionContext updateWithConcreteTransactions:ephemeralTransaction:updatedPassTransitItems:paymentApplication:](v19, "updateWithConcreteTransactions:ephemeralTransaction:updatedPassTransitItems:paymentApplication:", v49, v50, v48, v51);

      -[NPKContactlessPaymentSessionManagerTransactionContext forceToTransitTypeTransactionWithTransactionStatus:](v19, "forceToTransitTypeTransactionWithTransactionStatus:", 5);
      _Block_object_dispose(&v65, 8);

    }
  }
  v52 = v19;

  return v52;
}

void __96__NPKContactlessPaymentSessionManager__managerContextForContactlessInterfaceTransactionContext___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v12[4];
  id v13;

  v6 = a2;
  if (objc_msgSend(v6, "didSucceed"))
  {
    objc_msgSend(*(id *)(a1 + 32), "valueAddedServicePasses");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)MEMORY[0x24BDD1758];
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __96__NPKContactlessPaymentSessionManager__managerContextForContactlessInterfaceTransactionContext___block_invoke_2;
    v12[3] = &unk_24CFE9AE0;
    v13 = v6;
    objc_msgSend(v8, "predicateWithBlock:", v12);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "filteredArrayUsingPredicate:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "firstObject");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      objc_msgSend(*(id *)(a1 + 40), "setValueAddedServicePass:", v11);
      *a4 = 1;
    }

  }
}

uint64_t __96__NPKContactlessPaymentSessionManager__managerContextForContactlessInterfaceTransactionContext___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;

  objc_msgSend(a2, "passTypeIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dataUsingEncoding:", 4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "SHA256Hash");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "merchant");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v5, "isEqual:", v7);

  return v8;
}

void __96__NPKContactlessPaymentSessionManager__managerContextForContactlessInterfaceTransactionContext___block_invoke_3(uint64_t a1, void *a2)
{
  id v4;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

- (void)_handleValueAddedServiceTransactions:(id)a3 forValueAddedServicePasses:(id)a4 paymentTransaction:(id)a5 outUserInterventionRequiredPasses:(id *)a6
{
  id v9;
  id v10;
  NSObject *v11;
  _BOOL4 v12;
  NSObject *v13;
  id v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  id v28;
  id v29;
  id v30;
  id v31;
  id v32;
  id v33;
  id v34;
  id v35;
  _QWORD v36[4];
  id v37;
  id v38;
  id v39;
  id v40;
  id v41;
  id v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  uint8_t v47[128];
  uint8_t buf[4];
  id v49;
  uint64_t v50;

  v50 = *MEMORY[0x24BDAC8D0];
  v9 = a3;
  v10 = a4;
  v35 = a5;
  pk_Payment_log();
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);

  if (v12)
  {
    pk_Payment_log();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v49 = v9;
      _os_log_impl(&dword_213518000, v13, OS_LOG_TYPE_DEFAULT, "Notice: [PaymentSessionManager] Handling VAS transactions: %@", buf, 0xCu);
    }

  }
  if (a6)
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v34 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    *a6 = v34;
  }
  else
  {
    v34 = 0;
  }
  v14 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v43 = 0u;
  v44 = 0u;
  v45 = 0u;
  v46 = 0u;
  v15 = v10;
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v43, v47, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v44;
    do
    {
      for (i = 0; i != v17; ++i)
      {
        if (*(_QWORD *)v44 != v18)
          objc_enumerationMutation(v15);
        v20 = *(void **)(*((_QWORD *)&v43 + 1) + 8 * i);
        objc_msgSend(v20, "passTypeIdentifier");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "dataUsingEncoding:", 4);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "SHA256Hash");
        v23 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v14, "objectForKey:", v23);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v24)
        {
          objc_msgSend(MEMORY[0x24BDBCEB8], "array");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "setObject:forKey:", v24, v23);
        }
        objc_msgSend(v24, "addObject:", v20);

      }
      v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v43, v47, 16);
    }
    while (v17);
  }

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = objc_alloc_init(MEMORY[0x24BE6ED30]);
  v36[0] = MEMORY[0x24BDAC760];
  v36[1] = 3221225472;
  v36[2] = __156__NPKContactlessPaymentSessionManager__handleValueAddedServiceTransactions_forValueAddedServicePasses_paymentTransaction_outUserInterventionRequiredPasses___block_invoke;
  v36[3] = &unk_24CFE9B30;
  v37 = v14;
  v38 = v25;
  v39 = v26;
  v40 = v27;
  v41 = v35;
  v42 = v34;
  v28 = v34;
  v29 = v35;
  v30 = v27;
  v31 = v26;
  v32 = v25;
  v33 = v14;
  objc_msgSend(v9, "enumerateObjectsUsingBlock:", v36);

}

void __156__NPKContactlessPaymentSessionManager__handleValueAddedServiceTransactions_forValueAddedServicePasses_paymentTransaction_outUserInterventionRequiredPasses___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = *(void **)(a1 + 32);
  objc_msgSend(v3, "merchant");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v3, "didSucceed"))
  {
    v22 = 0u;
    v23 = 0u;
    v20 = 0u;
    v21 = 0u;
    v8 = v7;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v21;
      do
      {
        v12 = 0;
        do
        {
          if (*(_QWORD *)v21 != v11)
            objc_enumerationMutation(v8);
          v13 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * v12);
          objc_msgSend(*(id *)(a1 + 40), "addObject:", v3, (_QWORD)v20);
          v14 = *(void **)(a1 + 48);
          objc_msgSend(v13, "uniqueID");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "addObject:", v15);

          v16 = *(void **)(a1 + 56);
          objc_msgSend(v13, "uniqueID");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "insertOrUpdateValueAddedServiceTransaction:forPassUniqueIdentifier:paymentTransaction:completion:", v3, v17, *(_QWORD *)(a1 + 64), 0);

          ++v12;
        }
        while (v10 != v12);
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      }
      while (v10);
    }

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v3);
    objc_msgSend(*(id *)(a1 + 48), "addObject:", &stru_24CFF06D8);
    if (objc_msgSend(v3, "error") == 3)
    {
      objc_msgSend(*(id *)(a1 + 72), "addObjectsFromArray:", v7);
    }
    else if (objc_msgSend(v3, "error") == 1)
    {
      objc_msgSend(v3, "merchantURL");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v18, "length");

      if (v19)
        objc_msgSend(*(id *)(a1 + 56), "insertOrUpdateValueAddedServiceTransaction:forPassUniqueIdentifier:paymentTransaction:completion:", v3, 0, 0, 0);
    }
  }

}

- (id)_baseSessionStateForUpdate
{
  void *v3;
  void *v4;
  NPKContactlessPaymentSessionState *v5;
  NPKContactlessPaymentSessionState *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  v3 = (void *)-[NPKContactlessPaymentSessionState copy](self->_lastSessionState, "copy");
  v4 = v3;
  if (v3)
    v5 = v3;
  else
    v5 = objc_alloc_init(NPKContactlessPaymentSessionState);
  v6 = v5;

  v7 = objc_alloc_init(MEMORY[0x24BDD1880]);
  -[NPKContactlessPaymentSessionState setUniqueID:](v6, "setUniqueID:", v7);

  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPKContactlessPaymentSessionState setTimestamp:](v6, "setTimestamp:", v8);

  -[NPKContactlessPaymentSessionManager quickPaymentSession](self, "quickPaymentSession");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPKContactlessPaymentSessionState setHasSession:](v6, "setHasSession:", v9 != 0);

  -[NPKContactlessPaymentSessionManager quickPaymentSession](self, "quickPaymentSession");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPKContactlessPaymentSessionState setSessionStarted:](v6, "setSessionStarted:", objc_msgSend(v10, "sessionStarted"));

  -[NPKContactlessPaymentSessionManager quickPaymentSession](self, "quickPaymentSession");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPKContactlessPaymentSessionState setIsSwitchingSessionType:](v6, "setIsSwitchingSessionType:", objc_msgSend(v11, "isSwitchingSessionType"));

  -[NPKContactlessPaymentSessionManager quickPaymentSession](self, "quickPaymentSession");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPKContactlessPaymentSessionState setSessionType:](v6, "setSessionType:", objc_msgSend(v12, "sessionType"));

  if (!-[NPKContactlessPaymentSessionState hasSession](v6, "hasSession")
    || -[NPKContactlessPaymentSessionState sessionStarted](v6, "sessionStarted"))
  {
    -[NPKContactlessPaymentSessionState setSessionWaitingToStart:](v6, "setSessionWaitingToStart:", 0);
  }
  -[NPKContactlessPaymentSessionManager quickPaymentSession](self, "quickPaymentSession");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPKContactlessPaymentSessionState setInServiceMode:](v6, "setInServiceMode:", objc_msgSend(v13, "inServiceMode"));

  if (-[NPKContactlessPaymentSessionState inServiceMode](v6, "inServiceMode"))
    -[NPKContactlessPaymentSessionState setServiceModeRequestedPass:](v6, "setServiceModeRequestedPass:", 0);
  -[NPKContactlessPaymentSessionState setTransactionContext:](v6, "setTransactionContext:", 0);
  -[NPKContactlessPaymentSessionManager barcodePaymentSession](self, "barcodePaymentSession");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    -[NPKContactlessPaymentSessionState setHasSession:](v6, "setHasSession:", 1);
    -[NPKContactlessPaymentSessionManager barcodePaymentSession](self, "barcodePaymentSession");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[NPKContactlessPaymentSessionState setSessionStarted:](v6, "setSessionStarted:", objc_msgSend(v15, "sessionStarted"));

    -[NPKContactlessPaymentSessionState setInServiceMode:](v6, "setInServiceMode:", 0);
  }
  -[NPKContactlessPaymentSessionState setExpressTransactionStatus:](v6, "setExpressTransactionStatus:", 0);
  -[NPKContactlessPaymentSessionState setFailureType:](v6, "setFailureType:", 0);
  -[NPKContactlessPaymentSessionState setCompletionReason:](v6, "setCompletionReason:", 0);
  return v6;
}

- (void)_prepareSessionStateForSendingToObservers:(id)a3
{
  uint64_t v4;
  id v5;

  v5 = a3;
  if (objc_msgSend(v5, "inServiceMode"))
    v4 = objc_msgSend(v5, "doublePressReceived") ^ 1;
  else
    v4 = 1;
  objc_msgSend(v5, "setCanChangePass:", v4);
  if ((objc_msgSend(v5, "hasSession") & 1) == 0)
    objc_msgSend(v5, "setCurrentPass:", self->_userSelectedPass);

}

- (void)_sendSessionStateToObservers:(id)a3
{
  id v5;
  NSObject *v6;
  _BOOL4 v7;
  NSObject *v8;
  NPKObserverManager *observersManager;
  id v10;
  _QWORD v11[5];
  id v12;
  uint8_t buf[4];
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  -[NPKContactlessPaymentSessionManager _prepareSessionStateForSendingToObservers:](self, "_prepareSessionStateForSendingToObservers:", v5);
  objc_storeStrong((id *)&self->_lastSessionState, a3);
  pk_Payment_log();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);

  if (v7)
  {
    pk_Payment_log();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v14 = v5;
      _os_log_impl(&dword_213518000, v8, OS_LOG_TYPE_DEFAULT, "Notice: [PaymentSessionManager] sending to observer new session State:%@", buf, 0xCu);
    }

  }
  observersManager = self->_observersManager;
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __68__NPKContactlessPaymentSessionManager__sendSessionStateToObservers___block_invoke;
  v11[3] = &unk_24CFE9B58;
  v11[4] = self;
  v12 = v5;
  v10 = v5;
  -[NPKObserverManager enumerateObserversUsingBlock:](observersManager, "enumerateObserversUsingBlock:", v11);

}

uint64_t __68__NPKContactlessPaymentSessionManager__sendSessionStateToObservers___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "contactlessPaymentSessionManager:didChangeSessionState:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

- (id)_sessionStateForTransactionContext:(id)a3
{
  id v4;
  NSObject *v5;
  _BOOL4 v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  _QWORD v19[5];
  uint8_t buf[8];
  uint8_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;

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
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_213518000, v7, OS_LOG_TYPE_DEFAULT, "Notice: [PaymentSessionManager] Getting session state for transaction completion", buf, 2u);
    }

  }
  objc_msgSend(v4, "valueAddedServicePasses");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "valueAddedServiceTransactions");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)buf = 0;
  v21 = buf;
  v22 = 0x3032000000;
  v23 = __Block_byref_object_copy__8;
  v24 = __Block_byref_object_dispose__8;
  v25 = 0;
  v19[0] = MEMORY[0x24BDAC760];
  v19[1] = 3221225472;
  v19[2] = __74__NPKContactlessPaymentSessionManager__sessionStateForTransactionContext___block_invoke;
  v19[3] = &unk_24CFE9A90;
  v19[4] = buf;
  objc_msgSend(v9, "enumerateObjectsUsingBlock:", v19);
  -[NPKContactlessPaymentSessionManager quickPaymentSession](self, "quickPaymentSession");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "currentPass");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v4, "transaction");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12 || (objc_msgSend(v4, "transitHistory"), (v12 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
    {

    }
    else if (*((_QWORD *)v21 + 5))
    {
      objc_msgSend(v8, "firstObject");
      v15 = objc_claimAutoreleasedReturnValue();

      v13 = 0;
      v11 = (void *)v15;
      if (!v4)
        goto LABEL_17;
LABEL_13:
      -[NPKContactlessPaymentSessionManager _managerContextForContactlessInterfaceTransactionContext:](self, "_managerContextForContactlessInterfaceTransactionContext:", v4);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setValueAddedServicePass:", v13);
      if (!v9)
        goto LABEL_19;
      goto LABEL_18;
    }
  }
  if (!*((_QWORD *)v21 + 5))
  {
    v13 = 0;
    if (!v4)
      goto LABEL_17;
    goto LABEL_13;
  }
  objc_msgSend(v8, "firstObject");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    goto LABEL_13;
LABEL_17:
  v14 = 0;
  if (v9)
  {
LABEL_18:
    objc_msgSend(v4, "transaction");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[NPKContactlessPaymentSessionManager _handleValueAddedServiceTransactions:forValueAddedServicePasses:paymentTransaction:outUserInterventionRequiredPasses:](self, "_handleValueAddedServiceTransactions:forValueAddedServicePasses:paymentTransaction:outUserInterventionRequiredPasses:", v9, v8, v16, 0);

  }
LABEL_19:
  -[NPKContactlessPaymentSessionManager _baseSessionStateForUpdate](self, "_baseSessionStateForUpdate");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setCurrentPass:", v11);
  objc_msgSend(v17, "setSessionAuthorized:", 0);
  objc_msgSend(v17, "setDoublePressReceived:", 0);
  objc_msgSend(v17, "setContactlessInterfaceReady:", 0);
  objc_msgSend(v17, "setCanChangePass:", 1);
  objc_msgSend(v17, "setTransactionContext:", v14);

  _Block_object_dispose(buf, 8);
  return v17;
}

void __74__NPKContactlessPaymentSessionManager__sessionStateForTransactionContext___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v7;

  v7 = a2;
  if (objc_msgSend(v7, "didSucceed"))
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
    *a4 = 1;
  }

}

- (id)_sessionStateForExpressTransactionStatus:(unint64_t)a3 pass:(id)a4 paymentApplication:(id)a5 concreteTransactions:(id)a6 ephemeralTransaction:(id)a7 mutatedBalances:(id)a8 appletState:(id)a9
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  void *v21;
  _BOOL4 IsComplete;
  NPKContactlessPaymentSessionManagerTransactionContext *v23;
  void *v24;
  void *v25;
  id v27;

  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  v19 = a8;
  v20 = a9;
  -[NPKContactlessPaymentSessionManager _baseSessionStateForUpdate](self, "_baseSessionStateForUpdate");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setCurrentPass:", v15);
  objc_msgSend(v21, "setSessionAuthorized:", 1);
  objc_msgSend(v21, "setDoublePressReceived:", 1);
  objc_msgSend(v21, "setContactlessInterfaceReady:", 0);
  objc_msgSend(v21, "setCanChangePass:", 1);
  objc_msgSend(v21, "setExpressTransactionStatus:", a3);
  if (a3 == 1)
  {
    objc_msgSend(v21, "setCanChangePass:", 0);
  }
  else
  {
    IsComplete = NPKExpressTransactionStatusIsComplete(a3);
    if (a3 == 3 || IsComplete)
    {
      v23 = objc_alloc_init(NPKContactlessPaymentSessionManagerTransactionContext);
      -[NPKContactlessPaymentSessionManagerTransactionContext setTransactionPass:](v23, "setTransactionPass:", v15);
      if (NPKIsTruthOnCard(v15))
      {
        objc_msgSend(v15, "paymentPass");
        v27 = v17;
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        -[NPKContactlessPaymentSessionManager _updatedPassItemFieldWithPaymentPass:transitAppletBalances:appletState:paymentApplication:](self, "_updatedPassItemFieldWithPaymentPass:transitAppletBalances:appletState:paymentApplication:", v24, v19, v20, v16);
        v25 = (void *)objc_claimAutoreleasedReturnValue();

        v17 = v27;
        -[NPKContactlessPaymentSessionManagerTransactionContext updateWithConcreteTransactions:ephemeralTransaction:updatedPassTransitItems:paymentApplication:](v23, "updateWithConcreteTransactions:ephemeralTransaction:updatedPassTransitItems:paymentApplication:", v27, v18, v25, v16);
        -[NPKContactlessPaymentSessionManagerTransactionContext forceToTransitTypeTransactionWithTransactionStatus:](v23, "forceToTransitTypeTransactionWithTransactionStatus:", a3);

      }
      objc_msgSend(v21, "setTransactionContext:", v23);
      objc_msgSend(v21, "setCompletionReason:", 3);

    }
    else if (a3 == 2)
    {
      objc_msgSend(v21, "setCompletionReason:", 5);
      objc_msgSend(v21, "setFailureType:", 2);
    }
  }

  return v21;
}

- (void)_startSessionTimerWithReason:(unint64_t)a3
{
  NSObject *v5;
  _BOOL4 v6;
  NSObject *v7;
  __CFString *v8;
  __CFString *v9;
  NSObject *sessionTimer;
  int64_t v11;
  dispatch_time_t v12;
  int v13;
  __CFString *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  pk_ui_log();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);

  if (v6)
  {
    pk_ui_log();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = CFSTR("authTokenInUse");
      if (!a3)
        v8 = CFSTR("sessionCreated");
      v9 = v8;
      v13 = 138412290;
      v14 = v9;
      _os_log_impl(&dword_213518000, v7, OS_LOG_TYPE_DEFAULT, "Notice: Starting contactless session timer for reason: %@", (uint8_t *)&v13, 0xCu);

    }
  }
  sessionTimer = self->_sessionTimer;
  if (a3)
    v11 = 60000000000;
  else
    v11 = 5000000000;
  v12 = dispatch_time(0, v11);
  dispatch_source_set_timer(sessionTimer, v12, 0xFFFFFFFFFFFFFFFFLL, 0);
}

- (void)_stopSessionTimer
{
  NSObject *v3;
  _BOOL4 v4;
  NSObject *v5;
  uint8_t v6[16];

  pk_ui_log();
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);

  if (v4)
  {
    pk_ui_log();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_213518000, v5, OS_LOG_TYPE_DEFAULT, "Notice: Stopping contactless session timer", v6, 2u);
    }

  }
  dispatch_source_set_timer((dispatch_source_t)self->_sessionTimer, 0xFFFFFFFFFFFFFFFFLL, 0xFFFFFFFFFFFFFFFFLL, 0);
}

- (void)_handleSessionTimerFired
{
  NSObject *v3;
  _BOOL4 v4;
  NSObject *v5;
  _BOOL4 contactlessPaymentInterfaceVisible;
  void *v7;
  _DWORD v8[2];
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  pk_ui_log();
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);

  if (v4)
  {
    pk_ui_log();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      contactlessPaymentInterfaceVisible = self->_contactlessPaymentInterfaceVisible;
      v8[0] = 67109120;
      v8[1] = contactlessPaymentInterfaceVisible;
      _os_log_impl(&dword_213518000, v5, OS_LOG_TYPE_DEFAULT, "Notice: contactless session timer fired with visibility %d", (uint8_t *)v8, 8u);
    }

  }
  if (self->_quickPaymentSession)
    -[NPKContactlessPaymentSessionManager handleEndSessionRequestedForReason:](self, "handleEndSessionRequestedForReason:", 2);
  -[NPKContactlessPaymentSessionManager barcodePaymentSession](self, "barcodePaymentSession");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
    -[NPKContactlessPaymentSessionManager _cleanupBarcodePaymentSession](self, "_cleanupBarcodePaymentSession");
}

- (void)_handleServiceModeRequestEnded
{
  notify_post((const char *)objc_msgSend(CFSTR("NPKEndedServiceModeRequestDarwinNotification"), "UTF8String"));
}

- (void)_registerForServiceModeRequestNotification
{
  const char *v3;
  NSObject *v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id location;

  objc_initWeak(&location, self);
  v3 = (const char *)objc_msgSend(CFSTR("NPKCancelledServiceModeRequestDarwinNotification"), "UTF8String");
  v4 = MEMORY[0x24BDAC9B8];
  v5 = MEMORY[0x24BDAC9B8];
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __81__NPKContactlessPaymentSessionManager__registerForServiceModeRequestNotification__block_invoke;
  v6[3] = &unk_24CFE78F0;
  objc_copyWeak(&v7, &location);
  notify_register_dispatch(v3, &self->_serviceModeRequestNotifyToken, v4, v6);

  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

void __81__NPKContactlessPaymentSessionManager__registerForServiceModeRequestNotification__block_invoke(uint64_t a1)
{
  NSObject *v2;
  _BOOL4 v3;
  NSObject *v4;
  id *WeakRetained;
  id *v6;
  void *v7;
  void *v8;
  __int16 v9[8];

  pk_General_log();
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT);

  if (v3)
  {
    pk_General_log();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v9[0] = 0;
      _os_log_impl(&dword_213518000, v4, OS_LOG_TYPE_DEFAULT, "Notice: Got cancel service mode requests notification", (uint8_t *)v9, 2u);
    }

  }
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  v6 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained[2], "serviceModeRequestedPass");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      objc_msgSend(v6, "_baseSessionStateForUpdate");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setServiceModeRequestedPass:", 0);
      objc_msgSend(v6, "_sendSessionStateToObservers:", v8);

    }
  }

}

- (BOOL)_canHandleRKEActionForTileItem:(id)a3 pass:(id)a4 outAction:(id *)a5 outFunction:(id *)a6 outError:(id *)a7
{
  id v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  uint64_t v26;
  void *i;
  void *v28;
  uint64_t v29;
  void *v30;
  NSObject *v31;
  _BOOL4 v32;
  void *v33;
  id *v34;
  BOOL v35;
  BOOL v37;
  id v39;
  id v40;
  id *v41;
  void *v43;
  void *v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  id v50;
  uint8_t buf[4];
  void *v52;
  __int16 v53;
  void *v54;
  __int16 v55;
  void *v56;
  __int16 v57;
  id v58;
  _BYTE v59[128];
  uint64_t v60;

  v60 = *MEMORY[0x24BDAC8D0];
  v9 = a3;
  v10 = a4;
  v50 = 0;
  objc_msgSend((id)PKGetClassNFDigitalCarKeySession(), "getVehicleReports:", &v50);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v50;
  objc_msgSend(v10, "secureElementPass");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "devicePrimaryPaymentApplication");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "subcredentials");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "anyObject");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "identifier");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "objectForKeyedSubscript:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v45 = v11;
  v43 = v14;
  if (!v18 || v12)
  {
    pk_Payment_log();
    v31 = objc_claimAutoreleasedReturnValue();
    v32 = os_log_type_enabled(v31, OS_LOG_TYPE_ERROR);

    if (!v32)
    {
      v25 = 0;
      v30 = 0;
      v34 = a6;
      goto LABEL_23;
    }
    pk_Payment_log();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v10, "uniqueID");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138413058;
      v52 = v18;
      v53 = 2112;
      v54 = v33;
      v55 = 2112;
      v56 = v17;
      v57 = 2112;
      v58 = v12;
      _os_log_impl(&dword_213518000, v20, OS_LOG_TYPE_ERROR, "Error: [PaymentSessionManager] Failed to obtain vehicle report (%@) for pass: %@ with subcredential identifier: %@! Error: %@", buf, 0x2Au);

    }
    v25 = 0;
    v30 = 0;
  }
  else
  {
    v41 = a7;
    objc_msgSend(v9, "action");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "vehicleFunctionActions");
    v20 = objc_claimAutoreleasedReturnValue();

    v48 = 0u;
    v49 = 0u;
    v46 = 0u;
    v47 = 0u;
    objc_msgSend(v9, "tile");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "metadata");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "metadataTypeVehicleFunction");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "vehicleFunctions");
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    v25 = (id)objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v46, v59, 16);
    if (v25)
    {
      v39 = v10;
      v40 = v9;
      v26 = *(_QWORD *)v47;
      while (2)
      {
        for (i = 0; i != v25; i = (char *)i + 1)
        {
          if (*(_QWORD *)v47 != v26)
            objc_enumerationMutation(v24);
          v28 = *(void **)(*((_QWORD *)&v46 + 1) + 8 * (_QWORD)i);
          if (objc_msgSend(v18, "isRKEFunctionSupported:", v28))
          {
            -[NSObject objectForKeyedSubscript:](v20, "objectForKeyedSubscript:", v28);
            v29 = objc_claimAutoreleasedReturnValue();
            if (v29)
            {
              v30 = (void *)v29;
              v25 = v28;
              goto LABEL_18;
            }
          }
        }
        v25 = (id)objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v46, v59, 16);
        if (v25)
          continue;
        break;
      }
      v30 = 0;
LABEL_18:
      v10 = v39;
      v9 = v40;
    }
    else
    {
      v30 = 0;
    }

    a7 = v41;
  }
  v34 = a6;

LABEL_23:
  if (a5)
    *a5 = objc_retainAutorelease(v30);
  if (v34)
    *v34 = objc_retainAutorelease(v25);
  if (a7)
    *a7 = objc_retainAutorelease(v12);
  if (v12)
    v35 = 1;
  else
    v35 = v30 == 0;
  v37 = !v35 && v25 != 0;

  return v37;
}

- (void)_handleRKEActionRequestedForPass:(id)a3 action:(id)a4 function:(id)a5 withSession:(id)a6 completion:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  uint64_t v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  void (**v23)(_QWORD, _QWORD, _QWORD);
  NSObject *v24;
  _BOOL4 v25;
  NSObject *v26;
  void *v27;
  _QWORD v28[4];
  id v29;
  id v30;
  id v31;
  id v32;
  void (**v33)(_QWORD, _QWORD, _QWORD);
  _QWORD v34[4];
  id v35;
  id v36;
  id v37;
  id v38;
  NPKContactlessPaymentSessionManager *v39;
  id v40;
  uint8_t buf[4];
  void *v42;
  __int16 v43;
  id v44;
  __int16 v45;
  id v46;
  uint64_t v47;

  v47 = *MEMORY[0x24BDAC8D0];
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v17 = MEMORY[0x24BDAC760];
  v34[0] = MEMORY[0x24BDAC760];
  v34[1] = 3221225472;
  v34[2] = __111__NPKContactlessPaymentSessionManager__handleRKEActionRequestedForPass_action_function_withSession_completion___block_invoke;
  v34[3] = &unk_24CFE9B80;
  v18 = v12;
  v35 = v18;
  v19 = v13;
  v36 = v19;
  v20 = v14;
  v37 = v20;
  v21 = v15;
  v38 = v21;
  v39 = self;
  v22 = v16;
  v40 = v22;
  v23 = (void (**)(_QWORD, _QWORD, _QWORD))MEMORY[0x2199B6780](v34);
  if (v18 && v19 && v20)
  {
    v28[0] = v17;
    v28[1] = 3221225472;
    v28[2] = __111__NPKContactlessPaymentSessionManager__handleRKEActionRequestedForPass_action_function_withSession_completion___block_invoke_484;
    v28[3] = &unk_24CFE9BD0;
    v29 = v18;
    v30 = v20;
    v31 = v19;
    v32 = v21;
    v33 = v23;
    objc_msgSend(v32, "executeRKEActionForPass:function:action:withCompletion:", v29, v30, v31, v28);

  }
  else
  {
    pk_Payment_log();
    v24 = objc_claimAutoreleasedReturnValue();
    v25 = os_log_type_enabled(v24, OS_LOG_TYPE_ERROR);

    if (v25)
    {
      pk_Payment_log();
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v18, "uniqueID");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412802;
        v42 = v27;
        v43 = 2112;
        v44 = v20;
        v45 = 2112;
        v46 = v19;
        _os_log_impl(&dword_213518000, v26, OS_LOG_TYPE_ERROR, "Error: [PaymentSessionManager] Unable to handle RKE action for pass: %@ function: %@ action: %@! Invalid input.", buf, 0x20u);

      }
    }
    v23[2](v23, 0, 6);
  }

}

void __111__NPKContactlessPaymentSessionManager__handleRKEActionRequestedForPass_action_function_withSession_completion___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  NSObject *v6;
  _BOOL4 v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  int v15;
  void *v16;
  __int16 v17;
  uint64_t v18;
  __int16 v19;
  uint64_t v20;
  __int16 v21;
  uint64_t v22;
  __int16 v23;
  uint64_t v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  pk_Payment_log();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);

  if (v7)
  {
    pk_Payment_log();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*(id *)(a1 + 32), "uniqueID");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = *(_QWORD *)(a1 + 40);
      v11 = *(_QWORD *)(a1 + 48);
      v12 = *(_QWORD *)(a1 + 56);
      v15 = 138413314;
      v16 = v9;
      v17 = 2112;
      v18 = v10;
      v19 = 2112;
      v20 = v11;
      v21 = 2048;
      v22 = a3;
      v23 = 2112;
      v24 = v12;
      _os_log_impl(&dword_213518000, v8, OS_LOG_TYPE_DEFAULT, "Notice: [PaymentSessionManager] Invoking RKE action completion handler for pass %@ action %@ function %@ with reason %lu for session %@", (uint8_t *)&v15, 0x34u);

    }
  }
  if (*(_QWORD *)(a1 + 56))
    objc_msgSend(*(id *)(a1 + 64), "_cleanupQuickPaymentSession");
  objc_msgSend(*(id *)(a1 + 64), "_sessionStateForTransactionContext:", 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setCompletionReason:", a3);
  objc_msgSend(*(id *)(a1 + 64), "_sendSessionStateToObservers:", v13);
  v14 = *(_QWORD *)(a1 + 72);
  if (v14)
    (*(void (**)(uint64_t, uint64_t))(v14 + 16))(v14, a2);

}

void __111__NPKContactlessPaymentSessionManager__handleRKEActionRequestedForPass_action_function_withSession_completion___block_invoke_484(uint64_t a1, int a2)
{
  NSObject *v4;
  _BOOL4 v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  const __CFString *v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  _QWORD block[4];
  id v16;
  uint64_t v17;
  char v18;
  uint8_t buf[4];
  uint64_t v20;
  __int16 v21;
  uint64_t v22;
  __int16 v23;
  uint64_t v24;
  __int16 v25;
  const __CFString *v26;
  __int16 v27;
  uint64_t v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  pk_Payment_log();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);

  if (v5)
  {
    pk_Payment_log();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*(id *)(a1 + 32), "uniqueID");
      v7 = objc_claimAutoreleasedReturnValue();
      v8 = (void *)v7;
      v9 = *(_QWORD *)(a1 + 40);
      v10 = *(_QWORD *)(a1 + 48);
      v11 = CFSTR("NO");
      v12 = *(_QWORD *)(a1 + 56);
      if (a2)
        v11 = CFSTR("YES");
      *(_DWORD *)buf = 138413314;
      v20 = v7;
      v21 = 2112;
      v22 = v9;
      v23 = 2112;
      v24 = v10;
      v25 = 2112;
      v26 = v11;
      v27 = 2112;
      v28 = v12;
      _os_log_impl(&dword_213518000, v6, OS_LOG_TYPE_DEFAULT, "Notice: [PaymentSessionManager] RKE action execution for pass: %@ function: %@ action: %@ completed with success: %@ for session: %@", buf, 0x34u);

    }
  }
  if (a2)
    v13 = 0;
  else
    v13 = 5;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __111__NPKContactlessPaymentSessionManager__handleRKEActionRequestedForPass_action_function_withSession_completion___block_invoke_489;
  block[3] = &unk_24CFE9BA8;
  v14 = *(id *)(a1 + 64);
  v18 = a2;
  v16 = v14;
  v17 = v13;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

}

uint64_t __111__NPKContactlessPaymentSessionManager__handleRKEActionRequestedForPass_action_function_withSession_completion___block_invoke_489(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 48), *(_QWORD *)(a1 + 40));
}

- (id)_sessionStateForPaymentBarcode:(id)a3
{
  id v4;
  NPKContactlessPaymentSessionManagerTransactionContext *v5;
  void *v6;
  void *v7;

  v4 = a3;
  v5 = objc_alloc_init(NPKContactlessPaymentSessionManagerTransactionContext);
  -[NPKContactlessPaymentSessionManager userSelectedPass](self, "userSelectedPass");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPKContactlessPaymentSessionManagerTransactionContext setTransactionPass:](v5, "setTransactionPass:", v6);

  -[NPKContactlessPaymentSessionManagerTransactionContext setTransactionType:](v5, "setTransactionType:", 4);
  -[NPKContactlessPaymentSessionManagerTransactionContext setTransactionStatus:](v5, "setTransactionStatus:", 0);
  -[NPKContactlessPaymentSessionManagerTransactionContext setPaymentBarcode:](v5, "setPaymentBarcode:", v4);

  -[NPKContactlessPaymentSessionManager _baseSessionStateForUpdate](self, "_baseSessionStateForUpdate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setTransactionContext:", v5);

  return v7;
}

- (id)_sessionStateForBarcodeTransactionStatus:(unint64_t)a3 paymentBarcode:(id)a4 transaction:(id)a5
{
  id v8;
  id v9;
  NPKContactlessPaymentSessionManagerTransactionContext *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  NPKContactlessPaymentSessionManagerTransactionContext *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;

  v8 = a5;
  v9 = a4;
  v10 = objc_alloc_init(NPKContactlessPaymentSessionManagerTransactionContext);
  -[NPKContactlessPaymentSessionManager userSelectedPass](self, "userSelectedPass");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPKContactlessPaymentSessionManagerTransactionContext setTransactionPass:](v10, "setTransactionPass:", v11);

  -[NPKContactlessPaymentSessionManagerTransactionContext setTransactionType:](v10, "setTransactionType:", 4);
  -[NPKContactlessPaymentSessionManagerTransactionContext setPaymentBarcode:](v10, "setPaymentBarcode:", v9);

  -[NPKContactlessPaymentSessionManagerTransactionContext setPaymentTransaction:](v10, "setPaymentTransaction:", v8);
  -[NPKContactlessPaymentSessionManager _baseSessionStateForUpdate](self, "_baseSessionStateForUpdate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setTransactionContext:", v10);
  switch(a3)
  {
    case 0uLL:
      -[NPKContactlessPaymentSessionManager lastSessionState](self, "lastSessionState");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "transactionContext");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "transactionStatus");

      if (v15 == 1)
        goto LABEL_5;
      v16 = v10;
      v17 = 0;
      goto LABEL_6;
    case 1uLL:
      -[NPKContactlessPaymentSessionManagerTransactionContext setAuthenticationRequested:](v10, "setAuthenticationRequested:", 1);
LABEL_5:
      v16 = v10;
      v17 = 1;
LABEL_6:
      -[NPKContactlessPaymentSessionManagerTransactionContext setTransactionStatus:](v16, "setTransactionStatus:", v17);
      goto LABEL_14;
    case 2uLL:
      objc_msgSend(v12, "setCompletionReason:", 6);
      v18 = v12;
      v19 = 7;
      goto LABEL_11;
    case 3uLL:
      objc_msgSend(v12, "setCompletionReason:", 5);
      v18 = v12;
      v19 = 2;
      goto LABEL_11;
    case 4uLL:
      objc_msgSend(v12, "setCompletionReason:", 3);
      goto LABEL_12;
    case 5uLL:
      objc_msgSend(v12, "setCompletionReason:", 2);
      v18 = v12;
      v19 = 6;
LABEL_11:
      objc_msgSend(v18, "setFailureType:", v19);
LABEL_12:
      -[NPKContactlessPaymentSessionManagerTransactionContext setTransactionStatus:](v10, "setTransactionStatus:", 2);
      break;
    default:
      break;
  }
  -[NPKContactlessPaymentSessionManager userSelectedPass](self, "userSelectedPass");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setCurrentPass:", v20);

  objc_msgSend(v12, "setDoublePressReceived:", 0);
  objc_msgSend(v12, "setContactlessInterfaceReady:", 0);
  objc_msgSend(v12, "setCanChangePass:", 1);
LABEL_14:

  return v12;
}

- (id)_sessionStateForUserCanceledBarcodeTransaction
{
  void *v3;
  void *v4;

  -[NPKContactlessPaymentSessionManager _baseSessionStateForUpdate](self, "_baseSessionStateForUpdate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPKContactlessPaymentSessionManager userSelectedPass](self, "userSelectedPass");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setCurrentPass:", v4);

  objc_msgSend(v3, "setDoublePressReceived:", 0);
  objc_msgSend(v3, "setContactlessInterfaceReady:", 0);
  objc_msgSend(v3, "setCanChangePass:", 1);
  objc_msgSend(v3, "setCompletionReason:", 6);
  objc_msgSend(v3, "setFailureType:", 7);
  return v3;
}

- (id)_paymentBalancesFromTransitAppletBalances:(id)a3
{
  id v3;
  void *v4;
  id v5;
  _QWORD v7[4];
  id v8;

  v3 = a3;
  v4 = v3;
  if (v3)
    v3 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEF0]), "initWithCapacity:", objc_msgSend(v3, "count"));
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __81__NPKContactlessPaymentSessionManager__paymentBalancesFromTransitAppletBalances___block_invoke;
  v7[3] = &unk_24CFE9BF8;
  v5 = v3;
  v8 = v5;
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", v7);

  return v5;
}

void __81__NPKContactlessPaymentSessionManager__paymentBalancesFromTransitAppletBalances___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x24BE6EC40], "NPK_paymentBalanceWithAppletBalance:", a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = v3;
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v3);
    v3 = v4;
  }

}

- (id)_updatedPassItemFieldWithPaymentPass:(id)a3 transitAppletBalances:(id)a4 appletState:(id)a5 paymentApplication:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  NPKPassAssociatedInfoModel *v15;
  void *v16;

  v10 = a6;
  v11 = a5;
  v12 = a3;
  -[NPKContactlessPaymentSessionManager _paymentBalancesFromTransitAppletBalances:](self, "_paymentBalancesFromTransitAppletBalances:", a4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "transitPassPropertiesWithPaymentApplication:pass:", v10, v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = -[NPKPassAssociatedInfoModel initWithPass:transitProperties:balances:commutePlanValueRequired:]([NPKPassAssociatedInfoModel alloc], "initWithPass:transitProperties:balances:commutePlanValueRequired:", v12, v14, v13, 1);
  -[NPKPassAssociatedInfoModel allPassItemsFields](v15, "allPassItemsFields");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

- (NPKContactlessPaymentSessionState)lastSessionState
{
  return self->_lastSessionState;
}

- (void)setLastSessionState:(id)a3
{
  objc_storeStrong((id *)&self->_lastSessionState, a3);
}

- (NSData)credential
{
  return self->_credential;
}

- (void)setCredential:(id)a3
{
  objc_storeStrong((id *)&self->_credential, a3);
}

- (NPKQuickPaymentSession)quickPaymentSession
{
  return self->_quickPaymentSession;
}

- (void)setQuickPaymentSession:(id)a3
{
  objc_storeStrong((id *)&self->_quickPaymentSession, a3);
}

- (NPKQuickPaymentSessionCleanupDelegate)cleanupDelegate
{
  return self->_cleanupDelegate;
}

- (void)setCleanupDelegate:(id)a3
{
  objc_storeStrong((id *)&self->_cleanupDelegate, a3);
}

- (NPKObserverManager)observersManager
{
  return self->_observersManager;
}

- (void)setObserversManager:(id)a3
{
  objc_storeStrong((id *)&self->_observersManager, a3);
}

- (PKPass)userSelectedPass
{
  return self->_userSelectedPass;
}

- (void)setUserSelectedPass:(id)a3
{
  objc_storeStrong((id *)&self->_userSelectedPass, a3);
}

- (BOOL)contactlessPaymentInterfaceVisible
{
  return self->_contactlessPaymentInterfaceVisible;
}

- (void)setContactlessPaymentInterfaceVisible:(BOOL)a3
{
  self->_contactlessPaymentInterfaceVisible = a3;
}

- (OS_dispatch_source)sessionTimer
{
  return self->_sessionTimer;
}

- (void)setSessionTimer:(id)a3
{
  objc_storeStrong((id *)&self->_sessionTimer, a3);
}

- (int)serviceModeRequestNotifyToken
{
  return self->_serviceModeRequestNotifyToken;
}

- (void)setServiceModeRequestNotifyToken:(int)a3
{
  self->_serviceModeRequestNotifyToken = a3;
}

- (NPKBarcodePaymentSession)barcodePaymentSession
{
  return self->_barcodePaymentSession;
}

- (void)setBarcodePaymentSession:(id)a3
{
  objc_storeStrong((id *)&self->_barcodePaymentSession, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_barcodePaymentSession, 0);
  objc_storeStrong((id *)&self->_sessionTimer, 0);
  objc_storeStrong((id *)&self->_userSelectedPass, 0);
  objc_storeStrong((id *)&self->_observersManager, 0);
  objc_storeStrong((id *)&self->_cleanupDelegate, 0);
  objc_storeStrong((id *)&self->_quickPaymentSession, 0);
  objc_storeStrong((id *)&self->_credential, 0);
  objc_storeStrong((id *)&self->_lastSessionState, 0);
}

@end
