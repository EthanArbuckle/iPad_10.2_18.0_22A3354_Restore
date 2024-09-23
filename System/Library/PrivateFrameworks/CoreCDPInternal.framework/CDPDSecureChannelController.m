@implementation CDPDSecureChannelController

- (CDPDSecureChannelController)initWithContext:(id)a3
{
  id v5;
  CDPDSecureChannelController *v6;
  CDPDSecureChannelController *v7;
  NSObject *v8;
  NSObject *v9;
  dispatch_queue_t v10;
  OS_dispatch_queue *secureChannelProcessingQueue;

  v5 = a3;
  v6 = -[CDPDSecureChannelController init](self, "init");
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_secureChannelContext, a3);
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v8 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_attr_make_with_qos_class(v8, QOS_CLASS_USER_INITIATED, 0);
    v9 = objc_claimAutoreleasedReturnValue();

    v10 = dispatch_queue_create("com.apple.cdpd.secureChannelProcessingQueue", v9);
    secureChannelProcessingQueue = v7->_secureChannelProcessingQueue;
    v7->_secureChannelProcessingQueue = (OS_dispatch_queue *)v10;

  }
  return v7;
}

- (void)enforceQOS:(id)a3
{
  id v3;
  id v4;

  v4 = a3;
  v3 = v4;
  cdp_dispatch_sync_with_qos();

}

uint64_t __42__CDPDSecureChannelController_enforceQOS___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)joinCircle:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  _CDPLogSystem();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[CDPDSecureChannelController joinCircle:].cold.1();

  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __42__CDPDSecureChannelController_joinCircle___block_invoke;
  v7[3] = &unk_24C81C1E8;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  -[CDPDSecureChannelController enforceQOS:](self, "enforceQOS:", v7);

}

uint64_t __42__CDPDSecureChannelController_joinCircle___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_joinCircle:", *(_QWORD *)(a1 + 40));
}

- (void)_joinCircle:(id)a3
{
  void (**v4)(id, _QWORD, id);
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  CDPDCircleJoinResult *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  id v22;
  uint64_t v23;
  void *v24;
  NSObject *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  id v31;
  void *v32;
  void *v33;
  id v34;
  NSObject *v35;
  void *v36;
  _QWORD v37[5];
  id v38;
  _QWORD aBlock[4];
  id v40;
  CDPDSecureChannelController *v41;
  CDPDCircleJoinResult *v42;
  void (**v43)(id, _QWORD, id);
  id v44;
  uint8_t buf[4];
  id v46;
  uint64_t v47;

  v47 = *MEMORY[0x24BDAC8D0];
  v4 = (void (**)(id, _QWORD, id))a3;
  _CDPLogSystem();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[CDPDSecureChannelController _joinCircle:].cold.1(v5, v6, v7, v8, v9, v10, v11, v12);

  v13 = objc_alloc_init(CDPDCircleJoinResult);
  -[CDPDCircleJoinResult setRequiresEscrowRecordsFetch:](v13, "setRequiresEscrowRecordsFetch:", 1);
  -[CDPDCircleJoinResult setRequiresInitialSync:](v13, "setRequiresInitialSync:", 1);
  v14 = (void *)MEMORY[0x24BDFC2A0];
  -[CDPDSecureChannelContext context](self->_secureChannelContext, "context");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = *MEMORY[0x24BE1A860];
  objc_msgSend(v14, "analyticsEventWithContext:eventName:category:", v15, *MEMORY[0x24BE1A7A0], *MEMORY[0x24BE1A860]);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -[CDPDSecureChannelContext secureChannelType](self->_secureChannelContext, "secureChannelType"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = *MEMORY[0x24BE1A7C0];
  objc_msgSend(v17, "setObject:forKeyedSubscript:", v18, *MEMORY[0x24BE1A7C0]);

  -[CDPDSecureChannelContext keychainCircleProxy](self->_secureChannelContext, "keychainCircleProxy");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v44 = 0;
  objc_msgSend(v20, "initiatingPayload:", &v44);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = v44;

  v23 = *MEMORY[0x24BE1A640];
  if (!v21 || v22)
  {
    objc_msgSend(v17, "setObject:forKeyedSubscript:", MEMORY[0x24BDBD1C0], v23);
    _CDPLogSystem();
    v35 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v46 = v22;
      _os_log_impl(&dword_20DB2C000, v35, OS_LOG_TYPE_DEFAULT, "\"Secure Channel Init failed with error: %@\", buf, 0xCu);
    }

    objc_msgSend(v17, "populateUnderlyingErrorsStartingWithRootError:", v22);
    objc_msgSend(MEMORY[0x24BE1A3E0], "rtcAnalyticsReporter");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "sendEvent:", v17);

    v4[2](v4, 0, v22);
  }
  else
  {
    objc_msgSend(v17, "setObject:forKeyedSubscript:", MEMORY[0x24BDBD1C8], v23);
    objc_msgSend(MEMORY[0x24BE1A3E0], "rtcAnalyticsReporter");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "sendEvent:", v17);

    _CDPLogSystem();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v46 = v21;
      _os_log_impl(&dword_20DB2C000, v25, OS_LOG_TYPE_DEFAULT, "\"Sending initiating payload: %@\", buf, 0xCu);
    }

    v26 = (void *)MEMORY[0x24BDFC2A0];
    -[CDPDSecureChannelContext context](self->_secureChannelContext, "context");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "analyticsEventWithContext:eventName:category:", v27, *MEMORY[0x24BE1A7B8], v16);
    v28 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -[CDPDSecureChannelContext secureChannelType](self->_secureChannelContext, "secureChannelType"));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "setObject:forKeyedSubscript:", v29, v19);

    v30 = MEMORY[0x24BDAC760];
    aBlock[0] = MEMORY[0x24BDAC760];
    aBlock[1] = 3221225472;
    aBlock[2] = __43__CDPDSecureChannelController__joinCircle___block_invoke;
    aBlock[3] = &unk_24C81DC80;
    v40 = v28;
    v41 = self;
    v42 = v13;
    v43 = v4;
    v31 = v28;
    v32 = _Block_copy(aBlock);
    -[CDPDSecureChannelContext secureChannelProxy](self->_secureChannelContext, "secureChannelProxy");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v37[0] = v30;
    v37[1] = 3221225472;
    v37[2] = __43__CDPDSecureChannelController__joinCircle___block_invoke_20;
    v37[3] = &unk_24C81DCD0;
    v37[4] = self;
    v38 = v32;
    v34 = v32;
    objc_msgSend(v33, "sendPayload:completion:", v21, v37);

  }
}

void __43__CDPDSecureChannelController__joinCircle___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  NSObject *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  _QWORD v12[4];
  id v13;
  id v14;
  id v15;
  uint8_t buf[4];
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  if (v5)
  {
    v7 = MEMORY[0x24BDBD1C8];
  }
  else
  {
    _CDPLogSystem();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v17 = v6;
      _os_log_impl(&dword_20DB2C000, v8, OS_LOG_TYPE_DEFAULT, "\"Secure Channel send failed with error: %@\", buf, 0xCu);
    }

    v7 = MEMORY[0x24BDBD1C0];
  }
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v7, *MEMORY[0x24BE1A640]);
  objc_msgSend(*(id *)(a1 + 32), "populateUnderlyingErrorsStartingWithRootError:", v6);
  objc_msgSend(MEMORY[0x24BE1A3E0], "rtcAnalyticsReporter");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "sendEvent:", *(_QWORD *)(a1 + 32));

  if (v5)
  {
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __43__CDPDSecureChannelController__joinCircle___block_invoke_17;
    v12[3] = &unk_24C81CDE8;
    v10 = *(void **)(a1 + 48);
    v13 = *(id *)(a1 + 40);
    v14 = v10;
    v15 = *(id *)(a1 + 56);
    objc_msgSend(v13, "_processAndReplyWithMessage:completion:", v5, v12);

  }
  else
  {
    _CDPLogSystem();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      __43__CDPDSecureChannelController__joinCircle___block_invoke_cold_1();

    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }

}

void __43__CDPDSecureChannelController__joinCircle___block_invoke_17(uint64_t a1, int a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  NSObject *v19;
  NSObject *v20;
  id v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  id v25;

  v5 = a3;
  v6 = (void *)MEMORY[0x24BDFC2A0];
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "context");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "analyticsEventWithContext:eventName:category:", v7, *MEMORY[0x24BE1A790], *MEMORY[0x24BE1A860]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "secureChannelType"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v9, *MEMORY[0x24BE1A7C0]);

  if (a2)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "circleProxy");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = 0;
    v11 = objc_msgSend(v10, "cachedCliqueStatus:", &v25);
    v12 = v25;

    if (v12 || v11 != 1)
    {
      _CDPLogSystem();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        __43__CDPDSecureChannelController__joinCircle___block_invoke_17_cold_1();

      v18 = 0;
      v17 = v12;
      v16 = v12;
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 40), "setDidJoin:", 1);
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "secureChannelProxy");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "setHasPeersWithCDPBackupRecords:", objc_msgSend(v13, "approverBackupRecordsExist"));

      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "secureChannelProxy");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "setRemotePeeriCKState:", objc_msgSend(v14, "approveriCloudKeychainState"));

      objc_msgSend(*(id *)(a1 + 40), "setRequiresEscrowRecordsFetch:", 0);
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "keychainCircleProxy");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "setRequiresInitialSync:", objc_msgSend(v15, "requiresInitialSync"));

      v16 = 0;
      v17 = *(void **)(a1 + 40);
      v18 = v17;
    }
    v21 = v17;

  }
  else
  {
    _CDPLogSystem();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      __43__CDPDSecureChannelController__joinCircle___block_invoke_17_cold_2();

    v16 = v5;
    v18 = 0;
  }
  if (objc_msgSend(v18, "didJoin"))
    v22 = MEMORY[0x24BDBD1C8];
  else
    v22 = MEMORY[0x24BDBD1C0];
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v22, *MEMORY[0x24BE1A640]);
  objc_msgSend(v8, "populateUnderlyingErrorsStartingWithRootError:", v16);
  objc_msgSend(MEMORY[0x24BE1A3E0], "rtcAnalyticsReporter");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "sendEvent:", v8);

  v24 = *(_QWORD *)(a1 + 48);
  if (v24)
    (*(void (**)(uint64_t, void *, id))(v24 + 16))(v24, v18, v16);

}

void __43__CDPDSecureChannelController__joinCircle___block_invoke_20(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;

  v5 = a2;
  v6 = a3;
  _CDPLogSystem();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    __43__CDPDSecureChannelController__joinCircle___block_invoke_20_cold_1();

  v11 = v6;
  v12 = *(id *)(a1 + 40);
  v10 = v5;
  v8 = v6;
  v9 = v5;
  cdp_dispatch_async_with_qos();

}

uint64_t __43__CDPDSecureChannelController__joinCircle___block_invoke_21(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (void)startCircleApplicationApprovalServerWithContext:(id)a3 completion:(id)a4
{
  id v6;
  CDPDSecureChannelContext *secureChannelContext;
  void (**v8)(id, uint64_t, _QWORD);
  void *v9;
  int v10;
  void *v11;
  NSObject *v12;
  void *v13;
  uint64_t v14;
  int v15;
  id v16;
  NSObject *v17;
  _BOOL4 v18;
  void *v19;
  void *v20;
  CDPDSecureBackupController *v21;
  uint64_t v22;
  _QWORD v23[4];
  id v24;
  CDPDSecureChannelController *v25;
  id v26;
  id v27;
  uint8_t buf[4];
  id v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  secureChannelContext = self->_secureChannelContext;
  v8 = (void (**)(id, uint64_t, _QWORD))a4;
  -[CDPDSecureChannelContext setSecureChannelType:](secureChannelContext, "setSecureChannelType:", 2);
  -[CDPDSecureChannelContext secureChannelProxy](self->_secureChannelContext, "secureChannelProxy");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "conformsToProtocol:", &unk_2549E26E0);

  if (v10)
  {
    -[CDPDSecureChannelContext secureChannelProxy](self->_secureChannelContext, "secureChannelProxy");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    _CDPLogSystem();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_20DB2C000, v12, OS_LOG_TYPE_DEFAULT, "\"Starting a CDP accepting server...\", buf, 2u);
    }

    objc_msgSend(MEMORY[0x24BE1A3D0], "sharedInstance");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "primaryAccountSecurityLevel");

    if (objc_msgSend(v6, "managedAccountsAllowedInCDP"))
    {
      v27 = 0;
      v15 = objc_msgSend(v6, "isiCDPEligibleWithError:", &v27);
      v16 = v27;
    }
    else
    {
      v16 = 0;
      v15 = 0;
    }
    _CDPLogSystem();
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT);
    if (v14 == 4 || v15)
    {
      if (v18)
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_20DB2C000, v17, OS_LOG_TYPE_DEFAULT, "\"CDPDSecureChannelController: We are iCDP Eligible, checking for escrow records.\", buf, 2u);
      }

      if (objc_msgSend(v6, "_skipEscrowFetches"))
      {
        objc_msgSend(v11, "setApproverBackupRecordsExist:", 1);
        -[CDPDSecureChannelContext circleProxy](self->_secureChannelContext, "circleProxy");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE1A488]), "initWithContext:", v6);
        +[CDPDKeychainSync keyChainSyncWithProxy:sosCircleProxy:context:](CDPDKeychainSync, "keyChainSyncWithProxy:sosCircleProxy:context:", v19, v20, v6);
        v21 = (CDPDSecureBackupController *)objc_claimAutoreleasedReturnValue();

        if (-[CDPDSecureBackupController isUserVisibleKeychainSyncEnabled](v21, "isUserVisibleKeychainSyncEnabled"))v22 = 2;
        else
          v22 = 1;
        objc_msgSend(v11, "setApproveriCloudKeychainState:", v22);
        -[CDPDSecureChannelController _startListeningWithProxy:](self, "_startListeningWithProxy:", v11);
      }
      else
      {
        v21 = -[CDPDSecureBackupController initWithContext:uiProvider:delegate:]([CDPDSecureBackupController alloc], "initWithContext:uiProvider:delegate:", v6, 0, 0);
        v23[0] = MEMORY[0x24BDAC760];
        v23[1] = 3221225472;
        v23[2] = __90__CDPDSecureChannelController_startCircleApplicationApprovalServerWithContext_completion___block_invoke;
        v23[3] = &unk_24C81DB90;
        v24 = v11;
        v25 = self;
        v26 = v6;
        -[CDPDSecureBackupController backupRecordsArePresentWithCompletion:](v21, "backupRecordsArePresentWithCompletion:", v23);

      }
    }
    else
    {
      if (v18)
      {
        *(_DWORD *)buf = 138412290;
        v29 = v16;
        _os_log_impl(&dword_20DB2C000, v17, OS_LOG_TYPE_DEFAULT, "\"Starting server in dry move, we are not iCDP eligible (error: %@)\", buf, 0xCu);
      }

      -[CDPDSecureChannelController _startListeningWithProxy:](self, "_startListeningWithProxy:", v11);
    }
    v8[2](v8, 1, 0);

  }
  else
  {
    _CDPStateError();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(id, uint64_t, void *))v8)[2](v8, 0, v11);

  }
}

void __90__CDPDSecureChannelController_startCircleApplicationApprovalServerWithContext_completion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "setApproverBackupRecordsExist:");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 8), "circleProxy");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE1A488]), "initWithContext:", *(_QWORD *)(a1 + 48));
  +[CDPDKeychainSync keyChainSyncWithProxy:sosCircleProxy:context:](CDPDKeychainSync, "keyChainSyncWithProxy:sosCircleProxy:context:", v2, v3, *(_QWORD *)(a1 + 48));
  v6 = (id)objc_claimAutoreleasedReturnValue();

  v4 = *(void **)(a1 + 32);
  if (objc_msgSend(v6, "isUserVisibleKeychainSyncEnabled"))
    v5 = 2;
  else
    v5 = 1;
  objc_msgSend(v4, "setApproveriCloudKeychainState:", v5);
  objc_msgSend(*(id *)(a1 + 40), "_startListeningWithProxy:", *(_QWORD *)(a1 + 32));

}

- (void)_startListeningWithProxy:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  _CDPLogSystem();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[CDPDSecureChannelController _startListeningWithProxy:].cold.1();

  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __56__CDPDSecureChannelController__startListeningWithProxy___block_invoke;
  v7[3] = &unk_24C81D8B0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  -[CDPDSecureChannelController enforceQOS:](self, "enforceQOS:", v7);

}

uint64_t __56__CDPDSecureChannelController__startListeningWithProxy___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_startListeningWithProxyWithEnforcedQoS:", *(_QWORD *)(a1 + 40));
}

- (void)_startListeningWithProxyWithEnforcedQoS:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;
  id v9;
  id v10;
  id v11;
  _QWORD v12[5];
  id v13;
  _QWORD aBlock[5];
  id v15;
  id v16;
  id v17;

  v4 = a3;
  v5 = (void *)os_transaction_create();
  +[CDPDLockAssertion lock](CDPDLockAssertion, "lock");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = MEMORY[0x24BDAC760];
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 3221225472;
  aBlock[2] = __71__CDPDSecureChannelController__startListeningWithProxyWithEnforcedQoS___block_invoke;
  aBlock[3] = &unk_24C81DCF8;
  aBlock[4] = self;
  v15 = v4;
  v16 = v6;
  v17 = v5;
  v8 = v5;
  v9 = v6;
  v10 = v4;
  v12[0] = v7;
  v12[1] = 3221225472;
  v12[2] = __71__CDPDSecureChannelController__startListeningWithProxyWithEnforcedQoS___block_invoke_2;
  v12[3] = &unk_24C81DD48;
  v12[4] = self;
  v13 = _Block_copy(aBlock);
  v11 = v13;
  objc_msgSend(v10, "listenForPayloadsWithHandler:", v12);

}

void __71__CDPDSecureChannelController__startListeningWithProxyWithEnforcedQoS___block_invoke(uint64_t a1, void *a2, _QWORD *a3, _QWORD *a4)
{
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  uint64_t v31;
  NSObject *v32;
  void *v33;
  id v34;
  id v35;
  NSObject *v36;
  void *v37;
  int v38;
  _QWORD block[4];
  id v40;
  id v41;
  id v42;
  uint8_t buf[4];
  id v44;
  uint64_t v45;

  v45 = *MEMORY[0x24BDAC8D0];
  v7 = (void *)MEMORY[0x24BDFC2A0];
  v8 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
  v9 = a2;
  objc_msgSend(v8, "context");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "analyticsEventWithContext:eventName:category:", v10, *MEMORY[0x24BE1A7A8], *MEMORY[0x24BE1A860]);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "secureChannelType"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setObject:forKeyedSubscript:", v12, *MEMORY[0x24BE1A7C0]);

  v13 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "circleProxy");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "numberWithUnsignedInteger:", objc_msgSend(v14, "cachedCliqueStatus:", 0));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setObject:forKeyedSubscript:", v15, *MEMORY[0x24BE1A620]);

  objc_msgSend(*(id *)(a1 + 40), "telemetryFlowIDFromRequester");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    _CDPLogSystem();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
      __71__CDPDSecureChannelController__startListeningWithProxyWithEnforcedQoS___block_invoke_cold_2(v17, v18, v19, v20, v21, v22, v23, v24);

    objc_msgSend(*(id *)(a1 + 40), "telemetryFlowIDFromRequester");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setObject:forKeyedSubscript:", v25, *MEMORY[0x24BDFC340]);

    v26 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
    objc_msgSend(*(id *)(a1 + 40), "telemetryFlowIDFromRequester");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setFlowIDFromRequester:", v27);

  }
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "keychainCircleProxy");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v42 = 0;
  objc_msgSend(v28, "processIncomingPayload:error:", v9, &v42);
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  v30 = v42;
  if (v29)
  {
    v31 = MEMORY[0x24BDBD1C8];
  }
  else
  {
    _CDPLogSystem();
    v32 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v44 = v30;
      _os_log_impl(&dword_20DB2C000, v32, OS_LOG_TYPE_DEFAULT, "\"Secure Channel process failed with error: %@\", buf, 0xCu);
    }

    v31 = MEMORY[0x24BDBD1C0];
  }
  objc_msgSend(v11, "setObject:forKeyedSubscript:", v31, *MEMORY[0x24BE1A640]);
  objc_msgSend(v11, "populateUnderlyingErrorsStartingWithRootError:", v30);
  objc_msgSend(MEMORY[0x24BE1A3E0], "rtcAnalyticsReporter");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "sendEvent:", v11);

  v34 = objc_retainAutorelease(v29);
  *a3 = v34;
  v35 = objc_retainAutorelease(v30);
  *a4 = v35;
  if (v35)
  {
    _CDPLogSystem();
    v36 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
      __71__CDPDSecureChannelController__startListeningWithProxyWithEnforcedQoS___block_invoke_cold_1();

  }
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "keychainCircleProxy");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = objc_msgSend(v37, "isComplete");

  if (v35 || v38)
  {
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __71__CDPDSecureChannelController__startListeningWithProxyWithEnforcedQoS___block_invoke_79;
    block[3] = &unk_24C81D8B0;
    v40 = *(id *)(a1 + 48);
    v41 = *(id *)(a1 + 56);
    dispatch_async(MEMORY[0x24BDAC9B8], block);

  }
}

uint64_t __71__CDPDSecureChannelController__startListeningWithProxyWithEnforcedQoS___block_invoke_79(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "unlock");
}

void __71__CDPDSecureChannelController__startListeningWithProxyWithEnforcedQoS___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v7;
  NSObject *v8;
  void *v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  uint64_t v15;
  uint64_t v16;

  v7 = a2;
  _CDPLogSystem();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    __71__CDPDSecureChannelController__startListeningWithProxyWithEnforcedQoS___block_invoke_2_cold_1();

  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __71__CDPDSecureChannelController__startListeningWithProxyWithEnforcedQoS___block_invoke_81;
  v12[3] = &unk_24C81DD20;
  v9 = *(void **)(a1 + 32);
  v10 = *(id *)(a1 + 40);
  v13 = v7;
  v14 = v10;
  v15 = a3;
  v16 = a4;
  v11 = v7;
  objc_msgSend(v9, "enforceQOS:", v12);

}

uint64_t __71__CDPDSecureChannelController__startListeningWithProxyWithEnforcedQoS___block_invoke_81(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD))(a1[5] + 16))(a1[5], a1[4], a1[6], a1[7]);
}

- (void)_processAndReplyWithMessage:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(id, _QWORD, id);
  NSObject *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  id v17;
  BOOL v18;
  uint64_t v19;
  void *v20;
  NSObject *v21;
  void *v22;
  int v23;
  NSObject *v24;
  _BOOL4 v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  _QWORD v32[4];
  id v33;
  CDPDSecureChannelController *v34;
  void (**v35)(id, _QWORD, id);
  id v36;
  uint8_t buf[4];
  id v38;
  uint64_t v39;

  v39 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = (void (**)(id, _QWORD, id))a4;
  _CDPLogSystem();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v38 = v6;
    _os_log_impl(&dword_20DB2C000, v8, OS_LOG_TYPE_DEFAULT, "\"Processing reply: %@\", buf, 0xCu);
  }

  v9 = (void *)MEMORY[0x24BDFC2A0];
  -[CDPDSecureChannelContext context](self->_secureChannelContext, "context");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = *MEMORY[0x24BE1A860];
  objc_msgSend(v9, "analyticsEventWithContext:eventName:category:", v10, *MEMORY[0x24BE1A7B0], *MEMORY[0x24BE1A860]);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -[CDPDSecureChannelContext secureChannelType](self->_secureChannelContext, "secureChannelType"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = *MEMORY[0x24BE1A7C0];
  objc_msgSend(v12, "setObject:forKeyedSubscript:", v13, *MEMORY[0x24BE1A7C0]);

  -[CDPDSecureChannelContext keychainCircleProxy](self->_secureChannelContext, "keychainCircleProxy");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = 0;
  objc_msgSend(v15, "processIncomingPayload:error:", v6, &v36);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v36;

  if (v17)
    v18 = v16 == 0;
  else
    v18 = 0;
  if (v18)
    v19 = MEMORY[0x24BDBD1C0];
  else
    v19 = MEMORY[0x24BDBD1C8];
  objc_msgSend(v12, "setObject:forKeyedSubscript:", v19, *MEMORY[0x24BE1A640]);
  objc_msgSend(v12, "populateUnderlyingErrorsStartingWithRootError:", v17);
  objc_msgSend(MEMORY[0x24BE1A3E0], "rtcAnalyticsReporter");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "sendEvent:", v12);

  if (v17)
  {
    _CDPLogSystem();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      -[CDPDSecureChannelController _processAndReplyWithMessage:completion:].cold.1();

    v7[2](v7, 0, v17);
  }
  else
  {
    -[CDPDSecureChannelContext keychainCircleProxy](self->_secureChannelContext, "keychainCircleProxy");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v22, "isComplete");

    _CDPLogSystem();
    v24 = objc_claimAutoreleasedReturnValue();
    v25 = os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT);
    if (v23)
    {
      if (v25)
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_20DB2C000, v24, OS_LOG_TYPE_DEFAULT, "\"Secure channel request completed...\", buf, 2u);
      }

      v7[2](v7, 1, 0);
    }
    else
    {
      if (v25)
      {
        *(_DWORD *)buf = 138412290;
        v38 = v16;
        _os_log_impl(&dword_20DB2C000, v24, OS_LOG_TYPE_DEFAULT, "\"Sending response: %@\", buf, 0xCu);
      }

      v26 = (void *)MEMORY[0x24BDFC2A0];
      -[CDPDSecureChannelContext context](self->_secureChannelContext, "context");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "analyticsEventWithContext:eventName:category:", v27, *MEMORY[0x24BE1A7B8], v11);
      v28 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -[CDPDSecureChannelContext secureChannelType](self->_secureChannelContext, "secureChannelType"));
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "setObject:forKeyedSubscript:", v29, v14);

      -[CDPDSecureChannelContext secureChannelProxy](self->_secureChannelContext, "secureChannelProxy");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v32[0] = MEMORY[0x24BDAC760];
      v32[1] = 3221225472;
      v32[2] = __70__CDPDSecureChannelController__processAndReplyWithMessage_completion___block_invoke;
      v32[3] = &unk_24C81DD70;
      v33 = v28;
      v34 = self;
      v35 = v7;
      v31 = v28;
      objc_msgSend(v30, "sendPayload:completion:", v16, v32);

    }
  }

}

void __70__CDPDSecureChannelController__processAndReplyWithMessage_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  NSObject *v8;
  void *v9;
  NSObject *v10;
  int v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  if (v5)
  {
    v7 = MEMORY[0x24BDBD1C8];
  }
  else
  {
    _CDPLogSystem();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v11 = 138412290;
      v12 = v6;
      _os_log_impl(&dword_20DB2C000, v8, OS_LOG_TYPE_DEFAULT, "\"Secure Channel send failed with error: %@\", (uint8_t *)&v11, 0xCu);
    }

    v7 = MEMORY[0x24BDBD1C0];
  }
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v7, *MEMORY[0x24BE1A640]);
  objc_msgSend(*(id *)(a1 + 32), "populateUnderlyingErrorsStartingWithRootError:", v6);
  objc_msgSend(MEMORY[0x24BE1A3E0], "rtcAnalyticsReporter");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "sendEvent:", *(_QWORD *)(a1 + 32));

  if (v5)
  {
    objc_msgSend(*(id *)(a1 + 40), "_processAndReplyWithMessage:completion:", v5, *(_QWORD *)(a1 + 48));
  }
  else
  {
    _CDPLogSystem();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      __70__CDPDSecureChannelController__processAndReplyWithMessage_completion___block_invoke_cold_1();

    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_secureChannelProcessingQueue, 0);
  objc_storeStrong((id *)&self->_secureChannelContext, 0);
}

- (void)joinCircle:.cold.1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  qos_class_self();
  objc_msgSend((id)OUTLINED_FUNCTION_7_1(), "numberWithUnsignedInt:");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_9(&dword_20DB2C000, v1, v2, "\"Attempting to join circle with QOS: %@. %@ will be enforced.\", v3, v4, v5, v6, v7);

  OUTLINED_FUNCTION_6();
}

- (void)_joinCircle:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3(&dword_20DB2C000, a1, a3, "\"Creating initiating payload...\", a5, a6, a7, a8, 0);
}

void __43__CDPDSecureChannelController__joinCircle___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_20DB2C000, v0, v1, "@\"Failed to send initiating message for resume: %@\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

void __43__CDPDSecureChannelController__joinCircle___block_invoke_17_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_20DB2C000, v0, v1, "\"We completed, but ended up with error... %@\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

void __43__CDPDSecureChannelController__joinCircle___block_invoke_17_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_20DB2C000, v0, v1, "@\"Failed to process and reply message with replyError: %@\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

void __43__CDPDSecureChannelController__joinCircle___block_invoke_20_cold_1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  qos_class_self();
  objc_msgSend((id)OUTLINED_FUNCTION_7_1(), "numberWithUnsignedInt:");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_9(&dword_20DB2C000, v1, v2, "\"Processing SecureChannel reply with QOS: %@. %@ will be enforced.\", v3, v4, v5, v6, v7);

  OUTLINED_FUNCTION_6();
}

- (void)_startListeningWithProxy:.cold.1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  qos_class_self();
  objc_msgSend((id)OUTLINED_FUNCTION_7_1(), "numberWithUnsignedInt:");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_9(&dword_20DB2C000, v1, v2, "\"Listening for SecureChannel payloads with QOS: %@. %@ will be enforced.\", v3, v4, v5, v6, v7);

  OUTLINED_FUNCTION_6();
}

void __71__CDPDSecureChannelController__startListeningWithProxyWithEnforcedQoS___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_20DB2C000, v0, v1, "\"Failed to process requestor payload on approver side with error: %@\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

void __71__CDPDSecureChannelController__startListeningWithProxyWithEnforcedQoS___block_invoke_cold_2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3(&dword_20DB2C000, a1, a3, "\"Setting requester's flowID on kCDPAnalyticsSecureChannelProcessApprovalEvent\", a5, a6, a7, a8, 0);
}

void __71__CDPDSecureChannelController__startListeningWithProxyWithEnforcedQoS___block_invoke_2_cold_1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  qos_class_self();
  objc_msgSend((id)OUTLINED_FUNCTION_7_1(), "numberWithUnsignedInt:");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_9(&dword_20DB2C000, v1, v2, "\"Processing SecureChannel approvingProxy payload with QOS: %@. %@ will be enforced.\", v3, v4, v5, v6, v7);

  OUTLINED_FUNCTION_6();
}

- (void)_processAndReplyWithMessage:completion:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_20DB2C000, v0, v1, "\"Failed to process reply with error: %@\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

void __70__CDPDSecureChannelController__processAndReplyWithMessage_completion___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_20DB2C000, v0, v1, "\"Failed to send response with error: %@\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

@end
