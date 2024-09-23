@implementation CDPStateUIProviderProxy

- (CDPStateUIProviderProxy)initWithUIProvider:(id)a3
{
  id v5;
  CDPStateUIProviderProxy *v6;
  CDPStateUIProviderProxy *v7;

  v5 = a3;
  v6 = -[CDPStateUIProviderProxy init](self, "init");
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_uiProvider, a3);

  return v7;
}

- (void)cdpContext:(id)a3 promptForAdoptionOfMultipleICSC:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD block[5];
  id v18;
  id v19;

  v6 = a3;
  v7 = a4;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __70__CDPStateUIProviderProxy_cdpContext_promptForAdoptionOfMultipleICSC___block_invoke;
    block[3] = &unk_24C7C13D0;
    v19 = v7;
    block[4] = self;
    v18 = v6;
    dispatch_async(MEMORY[0x24BDAC9B8], block);

    v8 = v19;
LABEL_7:

    goto LABEL_8;
  }
  _CDPLogSystem();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    -[CDPStateUIProviderProxy cdpContext:promptForAdoptionOfMultipleICSC:].cold.1(v9, v10, v11, v12, v13, v14, v15, v16);

  if (v7)
  {
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("CDPStateError"), -5306, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, void *))v7 + 2))(v7, 0, v8);
    goto LABEL_7;
  }
LABEL_8:

}

void __70__CDPStateUIProviderProxy_cdpContext_promptForAdoptionOfMultipleICSC___block_invoke(uint64_t a1)
{
  void *v2;
  _QWORD v3[4];
  id v4;

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __70__CDPStateUIProviderProxy_cdpContext_promptForAdoptionOfMultipleICSC___block_invoke_2;
  v3[3] = &unk_24C7C1228;
  v4 = *(id *)(a1 + 48);
  v2 = (void *)MEMORY[0x212BA9A30](v3);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "cdpContext:promptForAdoptionOfMultipleICSC:", *(_QWORD *)(a1 + 40), v2);

}

uint64_t __70__CDPStateUIProviderProxy_cdpContext_promptForAdoptionOfMultipleICSC___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)cdpContext:(id)a3 promptForICSCWithIsNumeric:(BOOL)a4 numericLength:(id)a5 isRandom:(BOOL)a6 validator:(id)a7
{
  id v12;
  id v13;
  id v14;
  NSObject *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  _QWORD block[4];
  NSObject *v24;
  id v25;
  CDPStateUIProviderProxy *v26;
  id v27;
  BOOL v28;
  BOOL v29;

  v12 = a3;
  v13 = a5;
  v14 = a7;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __98__CDPStateUIProviderProxy_cdpContext_promptForICSCWithIsNumeric_numericLength_isRandom_validator___block_invoke;
    block[3] = &unk_24C7C13F8;
    v24 = v12;
    v25 = v14;
    v26 = self;
    v28 = a4;
    v27 = v13;
    v29 = a6;
    dispatch_async(MEMORY[0x24BDAC9B8], block);

    v15 = v24;
  }
  else
  {
    _CDPLogSystem();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      -[CDPStateUIProviderProxy cdpContext:promptForICSCWithIsNumeric:numericLength:isRandom:validator:].cold.1(v15, v16, v17, v18, v19, v20, v21, v22);
  }

}

void __98__CDPStateUIProviderProxy_cdpContext_promptForICSCWithIsNumeric_numericLength_isRandom_validator___block_invoke(uint64_t a1)
{
  CDPRemoteDeviceSecretValidator *v2;

  v2 = -[CDPRemoteDeviceSecretValidator initWithContext:validator:]([CDPRemoteDeviceSecretValidator alloc], "initWithContext:validator:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 8), "cdpContext:promptForICSCWithIsNumeric:numericLength:isRandom:validator:", *(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 64), *(_QWORD *)(a1 + 56), *(unsigned __int8 *)(a1 + 65), v2);

}

- (void)cdpContext:(id)a3 promptForLocalSecretWithCompletion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  _QWORD v19[4];
  id v20;
  CDPStateUIProviderProxy *v21;
  id v22;
  id v23;

  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x24BDFC2A0], "analyticsEventWithContext:eventName:category:", v6, CFSTR("com.apple.corecdp.localSecretCollection"), 0x24C7D2420);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v19[0] = MEMORY[0x24BDAC760];
    v19[1] = 3221225472;
    v19[2] = __73__CDPStateUIProviderProxy_cdpContext_promptForLocalSecretWithCompletion___block_invoke;
    v19[3] = &unk_24C7C1448;
    v20 = v8;
    v23 = v7;
    v21 = self;
    v22 = v6;
    dispatch_async(MEMORY[0x24BDAC9B8], v19);

    v9 = v20;
  }
  else
  {
    _CDPLogSystem();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      -[CDPStateUIProviderProxy cdpContext:promptForLocalSecretWithCompletion:].cold.1(v10, v11, v12, v13, v14, v15, v16, v17);

    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("CDPStateError"), -5306, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKeyedSubscript:", MEMORY[0x24BDBD1C0], CFSTR("didSucceed"));
    objc_msgSend(v8, "populateUnderlyingErrorsStartingWithRootError:", v9);
    +[CDPAnalyticsReporterRTC rtcAnalyticsReporter](CDPAnalyticsReporterRTC, "rtcAnalyticsReporter");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "sendEvent:", v8);

    if (v7)
      (*((void (**)(id, _QWORD, void *))v7 + 2))(v7, 0, v9);
  }

}

void __73__CDPStateUIProviderProxy_cdpContext_promptForLocalSecretWithCompletion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  os_signpost_id_t v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(uint64_t, void *, void *);
  void *v13;
  id v14;
  id v15;
  os_signpost_id_t v16;
  uint64_t v17;
  uint8_t buf[4];
  os_signpost_id_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  _CDPSignpostLogSystem();
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = _CDPSignpostCreate(v2);
  v5 = v4;

  _CDPSignpostLogSystem();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v3 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v6))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_20D7E6000, v7, OS_SIGNPOST_INTERVAL_BEGIN, v3, "LocalSecretCollect", " enableTelemetry=YES ", buf, 2u);
  }

  _CDPSignpostLogSystem();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v19 = v3;
    _os_log_impl(&dword_20D7E6000, v8, OS_LOG_TYPE_DEFAULT, "BEGIN [%lld]: LocalSecretCollect  enableTelemetry=YES ", buf, 0xCu);
  }

  v10 = MEMORY[0x24BDAC760];
  v11 = 3221225472;
  v12 = __73__CDPStateUIProviderProxy_cdpContext_promptForLocalSecretWithCompletion___block_invoke_28;
  v13 = &unk_24C7C1420;
  v16 = v3;
  v17 = v5;
  v14 = *(id *)(a1 + 32);
  v15 = *(id *)(a1 + 56);
  v9 = (void *)MEMORY[0x212BA9A30](&v10);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 8), "cdpContext:promptForLocalSecretWithCompletion:", *(_QWORD *)(a1 + 48), v9, v10, v11, v12, v13);

}

void __73__CDPStateUIProviderProxy_cdpContext_promptForLocalSecretWithCompletion___block_invoke_28(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5;
  uint64_t v6;
  id v7;
  id v8;
  unint64_t Nanoseconds;
  NSObject *v10;
  NSObject *v11;
  os_signpost_id_t v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  int v17;
  uint64_t v18;
  __int16 v19;
  double v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v5 = *(_QWORD *)(a1 + 48);
  v6 = *(_QWORD *)(a1 + 56);
  v7 = a3;
  v8 = a2;
  Nanoseconds = _CDPSignpostGetNanoseconds(v5, v6);
  _CDPSignpostLogSystem();
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = v10;
  v12 = *(_QWORD *)(a1 + 48);
  if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    LOWORD(v17) = 0;
    _os_signpost_emit_with_name_impl(&dword_20D7E6000, v11, OS_SIGNPOST_INTERVAL_END, v12, "LocalSecretCollect", ", (uint8_t *)&v17, 2u);
  }

  _CDPSignpostLogSystem();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    v14 = *(_QWORD *)(a1 + 48);
    v17 = 134218240;
    v18 = v14;
    v19 = 2048;
    v20 = (double)Nanoseconds / 1000000000.0;
    _os_log_impl(&dword_20D7E6000, v13, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs: LocalSecretCollect ", (uint8_t *)&v17, 0x16u);
  }

  if (v8)
    v15 = MEMORY[0x24BDBD1C8];
  else
    v15 = MEMORY[0x24BDBD1C0];
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v15, CFSTR("didSucceed"));
  objc_msgSend(*(id *)(a1 + 32), "populateUnderlyingErrorsStartingWithRootError:", v7);
  +[CDPAnalyticsReporterRTC rtcAnalyticsReporter](CDPAnalyticsReporterRTC, "rtcAnalyticsReporter");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "sendEvent:", *(_QWORD *)(a1 + 32));

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)cdpContext:(id)a3 presentRemoteApprovalWithCompletion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  _QWORD block[5];
  id v18;
  id v19;

  v6 = a3;
  v7 = a4;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __74__CDPStateUIProviderProxy_cdpContext_presentRemoteApprovalWithCompletion___block_invoke;
    block[3] = &unk_24C7C1470;
    block[4] = self;
    v18 = v6;
    v19 = v7;
    dispatch_async(MEMORY[0x24BDAC9B8], block);

  }
  else
  {
    _CDPLogSystem();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[CDPStateUIProviderProxy cdpContext:presentRemoteApprovalWithCompletion:].cold.1(v8, v9, v10, v11, v12, v13, v14, v15);

    if (v7)
    {
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("CDPStateError"), -5306, 0);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      (*((void (**)(id, _QWORD, void *))v7 + 2))(v7, 0, v16);

    }
  }

}

uint64_t __74__CDPStateUIProviderProxy_cdpContext_presentRemoteApprovalWithCompletion___block_invoke(_QWORD *a1)
{
  return objc_msgSend(*(id *)(a1[4] + 8), "cdpContext:presentRemoteApprovalWithCompletion:", a1[5], a1[6]);
}

- (void)dismissRemoteApprovalWaitingScreenWithAction:(unint64_t)a3
{
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD v13[6];

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v13[0] = MEMORY[0x24BDAC760];
    v13[1] = 3221225472;
    v13[2] = __72__CDPStateUIProviderProxy_dismissRemoteApprovalWaitingScreenWithAction___block_invoke;
    v13[3] = &unk_24C7C1498;
    v13[4] = self;
    v13[5] = a3;
    dispatch_async(MEMORY[0x24BDAC9B8], v13);
  }
  else
  {
    _CDPLogSystem();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      -[CDPStateUIProviderProxy dismissRemoteApprovalWaitingScreenWithAction:].cold.1(v5, v6, v7, v8, v9, v10, v11, v12);

  }
}

uint64_t __72__CDPStateUIProviderProxy_dismissRemoteApprovalWaitingScreenWithAction___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "dismissRemoteApprovalWaitingScreenWithAction:", *(_QWORD *)(a1 + 40));
}

- (void)cdpContext:(id)a3 promptForRemoteSecretWithDevices:(id)a4 offeringRemoteApproval:(BOOL)a5 validator:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  _QWORD block[5];
  id v17;
  id v18;
  id v19;
  BOOL v20;

  v10 = a3;
  v11 = a4;
  v12 = a6;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __104__CDPStateUIProviderProxy_cdpContext_promptForRemoteSecretWithDevices_offeringRemoteApproval_validator___block_invoke;
  block[3] = &unk_24C7C14C0;
  block[4] = self;
  v17 = v10;
  v18 = v12;
  v19 = v11;
  v20 = a5;
  v13 = v11;
  v14 = v12;
  v15 = v10;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

}

void __104__CDPStateUIProviderProxy_cdpContext_promptForRemoteSecretWithDevices_offeringRemoteApproval_validator___block_invoke(uint64_t a1)
{
  NSObject *v2;
  CDPRemoteDeviceSecretValidator *v3;

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v3 = -[CDPRemoteDeviceSecretValidator initWithContext:validator:]([CDPRemoteDeviceSecretValidator alloc], "initWithContext:validator:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "cdpContext:promptForRemoteSecretWithDevices:offeringRemoteApproval:validator:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 56), *(unsigned __int8 *)(a1 + 64), v3);

  }
  else
  {
    _CDPLogSystem();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
      __104__CDPStateUIProviderProxy_cdpContext_promptForRemoteSecretWithDevices_offeringRemoteApproval_validator___block_invoke_cold_1();

  }
}

- (void)cdpRecoveryFlowContext:(id)a3 promptForRemoteSecretWithDevices:(id)a4 validator:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  _QWORD v14[5];
  id v15;
  id v16;
  id v17;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __93__CDPStateUIProviderProxy_cdpRecoveryFlowContext_promptForRemoteSecretWithDevices_validator___block_invoke;
  v14[3] = &unk_24C7C14E8;
  v14[4] = self;
  v15 = v8;
  v16 = v10;
  v17 = v9;
  v11 = v9;
  v12 = v10;
  v13 = v8;
  dispatch_async(MEMORY[0x24BDAC9B8], v14);

}

void __93__CDPStateUIProviderProxy_cdpRecoveryFlowContext_promptForRemoteSecretWithDevices_validator___block_invoke(uint64_t a1)
{
  CDPRemoteDeviceSecretValidator *v2;
  void *v3;
  CDPRemoteDeviceSecretValidator *v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  CDPRemoteDeviceSecretValidator *v9;

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v2 = [CDPRemoteDeviceSecretValidator alloc];
    objc_msgSend(*(id *)(a1 + 40), "context");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[CDPRemoteDeviceSecretValidator initWithContext:validator:](v2, "initWithContext:validator:", v3, *(_QWORD *)(a1 + 48));

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "cdpRecoveryFlowContext:promptForRemoteSecretWithDevices:validator:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 56), v9);
LABEL_5:

    return;
  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v4 = [CDPRemoteDeviceSecretValidator alloc];
    objc_msgSend(*(id *)(a1 + 40), "context");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[CDPRemoteDeviceSecretValidator initWithContext:validator:](v4, "initWithContext:validator:", v5, *(_QWORD *)(a1 + 48));

    v6 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
    objc_msgSend(*(id *)(a1 + 40), "context");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "cdpContext:promptForRemoteSecretWithDevices:offeringRemoteApproval:validator:", v7, *(_QWORD *)(a1 + 56), objc_msgSend(*(id *)(a1 + 40), "hasPeersForRemoteApproval"), v9);

    goto LABEL_5;
  }
  _CDPLogSystem();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    __93__CDPStateUIProviderProxy_cdpRecoveryFlowContext_promptForRemoteSecretWithDevices_validator___block_invoke_cold_1();

}

- (void)cdpContext:(id)a3 promptForInteractiveAuthenticationWithCompletion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  NSObject *v18;
  _QWORD block[5];
  id v20;
  id v21;

  v6 = a3;
  v7 = a4;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BE18E20], "reachabilityForInternetConnection");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v8, "currentReachabilityStatus"))
    {
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __87__CDPStateUIProviderProxy_cdpContext_promptForInteractiveAuthenticationWithCompletion___block_invoke;
      block[3] = &unk_24C7C13D0;
      v21 = v7;
      block[4] = self;
      v20 = v6;
      dispatch_async(MEMORY[0x24BDAC9B8], block);

      v9 = v21;
    }
    else
    {
      _CDPLogSystem();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        -[CDPStateUIProviderProxy cdpContext:promptForInteractiveAuthenticationWithCompletion:].cold.1(v18);

      if (!v7)
        goto LABEL_13;
      _CDPStateError(-5311, 0);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      (*((void (**)(id, _QWORD, void *))v7 + 2))(v7, 0, v9);
    }

LABEL_13:
    goto LABEL_14;
  }
  _CDPLogSystem();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    -[CDPStateUIProviderProxy cdpContext:promptForInteractiveAuthenticationWithCompletion:].cold.2(v10, v11, v12, v13, v14, v15, v16, v17);

  if (v7)
  {
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("CDPStateError"), -5306, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, void *))v7 + 2))(v7, 0, v8);
    goto LABEL_13;
  }
LABEL_14:

}

void __87__CDPStateUIProviderProxy_cdpContext_promptForInteractiveAuthenticationWithCompletion___block_invoke(uint64_t a1)
{
  void *v2;
  _QWORD v3[4];
  id v4;

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __87__CDPStateUIProviderProxy_cdpContext_promptForInteractiveAuthenticationWithCompletion___block_invoke_2;
  v3[3] = &unk_24C7C1188;
  v4 = *(id *)(a1 + 48);
  v2 = (void *)MEMORY[0x212BA9A30](v3);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "cdpContext:promptForInteractiveAuthenticationWithCompletion:", *(_QWORD *)(a1 + 40), v2);

}

uint64_t __87__CDPStateUIProviderProxy_cdpContext_promptForInteractiveAuthenticationWithCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)cdpContext:(id)a3 showError:(id)a4 withCompletion:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  id v18;
  id v19;
  id v20;
  _QWORD v21[5];
  id v22;
  id v23;
  id v24;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  _CDPLogSystem();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    -[CDPStateUIProviderProxy cdpContext:showError:withCompletion:].cold.1((uint64_t)v9, v11, v12, v13, v14, v15, v16, v17);

  v21[0] = MEMORY[0x24BDAC760];
  v21[1] = 3221225472;
  v21[2] = __63__CDPStateUIProviderProxy_cdpContext_showError_withCompletion___block_invoke;
  v21[3] = &unk_24C7C1448;
  v21[4] = self;
  v22 = v8;
  v23 = v9;
  v24 = v10;
  v18 = v9;
  v19 = v8;
  v20 = v10;
  dispatch_async(MEMORY[0x24BDAC9B8], v21);

}

void __63__CDPStateUIProviderProxy_cdpContext_showError_withCompletion___block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  _QWORD v4[4];
  id v5;

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v4[0] = MEMORY[0x24BDAC760];
    v4[1] = 3221225472;
    v4[2] = __63__CDPStateUIProviderProxy_cdpContext_showError_withCompletion___block_invoke_2;
    v4[3] = &unk_24C7C1510;
    v5 = *(id *)(a1 + 56);
    v2 = (void *)MEMORY[0x212BA9A30](v4);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "cdpContext:showError:withCompletion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), v2);

  }
  else
  {
    _CDPLogSystem();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      __63__CDPStateUIProviderProxy_cdpContext_showError_withCompletion___block_invoke_cold_1();

    objc_msgSend(*(id *)(a1 + 32), "cdpContext:showError:withDefaultIndex:withCompletion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), 0, *(_QWORD *)(a1 + 56));
  }
}

uint64_t __63__CDPStateUIProviderProxy_cdpContext_showError_withCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)cdpContext:(id)a3 showError:(id)a4 withDefaultIndex:(int64_t)a5 withCompletion:(id)a6
{
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  id v20;
  id v21;
  id v22;
  _QWORD block[5];
  id v24;
  id v25;
  id v26;
  int64_t v27;

  v10 = a3;
  v11 = a4;
  v12 = a6;
  _CDPLogSystem();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    -[CDPStateUIProviderProxy cdpContext:showError:withCompletion:].cold.1((uint64_t)v11, v13, v14, v15, v16, v17, v18, v19);

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __80__CDPStateUIProviderProxy_cdpContext_showError_withDefaultIndex_withCompletion___block_invoke;
  block[3] = &unk_24C7C1538;
  block[4] = self;
  v24 = v10;
  v25 = v11;
  v26 = v12;
  v27 = a5;
  v20 = v11;
  v21 = v10;
  v22 = v12;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

}

void __80__CDPStateUIProviderProxy_cdpContext_showError_withDefaultIndex_withCompletion___block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  uint64_t v4;
  _QWORD v5[4];
  id v6;

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v5[0] = MEMORY[0x24BDAC760];
    v5[1] = 3221225472;
    v5[2] = __80__CDPStateUIProviderProxy_cdpContext_showError_withDefaultIndex_withCompletion___block_invoke_2;
    v5[3] = &unk_24C7C1510;
    v6 = *(id *)(a1 + 56);
    v2 = (void *)MEMORY[0x212BA9A30](v5);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "cdpContext:showError:withDefaultIndex:withCompletion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 64), v2);

  }
  else
  {
    _CDPLogSystem();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      __80__CDPStateUIProviderProxy_cdpContext_showError_withDefaultIndex_withCompletion___block_invoke_cold_1();

    v4 = *(_QWORD *)(a1 + 56);
    if (v4)
      (*(void (**)(uint64_t, uint64_t))(v4 + 16))(v4, -1);
  }
}

uint64_t __80__CDPStateUIProviderProxy_cdpContext_showError_withDefaultIndex_withCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)cdpContext:(id)a3 presentRecoveryKeyWithValidator:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  _QWORD v14[5];
  id v15;
  id v16;
  id v17;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __81__CDPStateUIProviderProxy_cdpContext_presentRecoveryKeyWithValidator_completion___block_invoke;
  v14[3] = &unk_24C7C1448;
  v14[4] = self;
  v15 = v8;
  v16 = v9;
  v17 = v10;
  v11 = v9;
  v12 = v8;
  v13 = v10;
  dispatch_async(MEMORY[0x24BDAC9B8], v14);

}

void __81__CDPStateUIProviderProxy_cdpContext_presentRecoveryKeyWithValidator_completion___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  CDPRecoveryKeyValidatorProxyImpl *v5;
  uint64_t v6;
  id v7;
  _QWORD v8[4];
  id v9;

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __81__CDPStateUIProviderProxy_cdpContext_presentRecoveryKeyWithValidator_completion___block_invoke_2;
    v8[3] = &unk_24C7C1228;
    v9 = *(id *)(a1 + 56);
    v2 = (void *)MEMORY[0x212BA9A30](v8);
    v3 = *(_QWORD *)(a1 + 40);
    v4 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
    v5 = -[CDPRecoveryKeyValidatorProxyImpl initWithRemoteObject:]([CDPRecoveryKeyValidatorProxyImpl alloc], "initWithRemoteObject:", *(_QWORD *)(a1 + 48));
    objc_msgSend(v4, "cdpContext:presentRecoveryKeyWithValidator:completion:", v3, v5, v2);

  }
  else
  {
    v6 = *(_QWORD *)(a1 + 56);
    if (v6)
    {
      _CDPStateError(-5306, 0);
      v7 = (id)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, _QWORD, id))(v6 + 16))(v6, 0, v7);

    }
  }
}

uint64_t __81__CDPStateUIProviderProxy_cdpContext_presentRecoveryKeyWithValidator_completion___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)cdpContext:(id)a3 promptForRecoveryKeyWithValidator:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  _QWORD v14[5];
  id v15;
  id v16;
  id v17;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __83__CDPStateUIProviderProxy_cdpContext_promptForRecoveryKeyWithValidator_completion___block_invoke;
  v14[3] = &unk_24C7C1448;
  v14[4] = self;
  v15 = v8;
  v16 = v9;
  v17 = v10;
  v11 = v9;
  v12 = v8;
  v13 = v10;
  dispatch_async(MEMORY[0x24BDAC9B8], v14);

}

void __83__CDPStateUIProviderProxy_cdpContext_promptForRecoveryKeyWithValidator_completion___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  CDPRecoveryKeyValidatorProxyImpl *v5;
  uint64_t v6;
  id v7;
  _QWORD v8[4];
  id v9;

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __83__CDPStateUIProviderProxy_cdpContext_promptForRecoveryKeyWithValidator_completion___block_invoke_2;
    v8[3] = &unk_24C7C1228;
    v9 = *(id *)(a1 + 56);
    v2 = (void *)MEMORY[0x212BA9A30](v8);
    v3 = *(_QWORD *)(a1 + 40);
    v4 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
    v5 = -[CDPRecoveryKeyValidatorProxyImpl initWithRemoteObject:]([CDPRecoveryKeyValidatorProxyImpl alloc], "initWithRemoteObject:", *(_QWORD *)(a1 + 48));
    objc_msgSend(v4, "cdpContext:promptForRecoveryKeyWithValidator:completion:", v3, v5, v2);

  }
  else
  {
    v6 = *(_QWORD *)(a1 + 56);
    if (v6)
    {
      _CDPStateError(-5306, 0);
      v7 = (id)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, _QWORD, id))(v6 + 16))(v6, 0, v7);

    }
  }
}

uint64_t __83__CDPStateUIProviderProxy_cdpContext_promptForRecoveryKeyWithValidator_completion___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)cdpContext:(id)a3 promptForRecoveryKeyWithSecretValidator:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  _QWORD v14[5];
  id v15;
  id v16;
  id v17;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __89__CDPStateUIProviderProxy_cdpContext_promptForRecoveryKeyWithSecretValidator_completion___block_invoke;
  v14[3] = &unk_24C7C1560;
  v14[4] = self;
  v15 = v8;
  v16 = v9;
  v17 = v10;
  v11 = v10;
  v12 = v9;
  v13 = v8;
  dispatch_async(MEMORY[0x24BDAC9B8], v14);

}

void __89__CDPStateUIProviderProxy_cdpContext_promptForRecoveryKeyWithSecretValidator_completion___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  CDPRecoveryKeySecretValidatorProxyImpl *v5;
  id v6;

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v2 = a1[5];
    v3 = *(void **)(a1[4] + 8);
    v5 = -[CDPRecoveryKeySecretValidatorProxyImpl initWithRemoteObject:]([CDPRecoveryKeySecretValidatorProxyImpl alloc], "initWithRemoteObject:", a1[6]);
    objc_msgSend(v3, "cdpContext:promptForRecoveryKeyWithSecretValidator:completion:", v2);

  }
  else
  {
    v4 = a1[7];
    if (v4)
    {
      _CDPStateError(-5306, 0);
      v6 = (id)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, _QWORD))(v4 + 16))(v4, 0);

    }
  }
}

- (void)cdpContext:(id)a3 promptForBeneficiaryAccessKeyWithCompletion:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD block[5];
  id v11;
  id v12;

  v6 = a3;
  v7 = a4;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __82__CDPStateUIProviderProxy_cdpContext_promptForBeneficiaryAccessKeyWithCompletion___block_invoke;
  block[3] = &unk_24C7C1470;
  block[4] = self;
  v11 = v6;
  v12 = v7;
  v8 = v7;
  v9 = v6;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

}

void __82__CDPStateUIProviderProxy_cdpContext_promptForBeneficiaryAccessKeyWithCompletion___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  id v3;

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(*(id *)(a1[4] + 8), "cdpContext:promptForBeneficiaryAccessKeyWithCompletion:", a1[5], a1[6]);
  }
  else
  {
    v2 = a1[6];
    if (v2)
    {
      _CDPStateError(-5306, 0);
      v3 = (id)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, _QWORD, id))(v2 + 16))(v2, 0, v3);

    }
  }
}

- (void)cdpContext:(id)a3 showResetCompletedAlertWithCompletion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;
  uint8_t buf[4];
  const char *v15;
  __int16 v16;
  int v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  _CDPLogSystem();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v15 = "-[CDPStateUIProviderProxy cdpContext:showResetCompletedAlertWithCompletion:]";
    v16 = 1024;
    v17 = 276;
    _os_log_impl(&dword_20D7E6000, v8, OS_LOG_TYPE_DEFAULT, "\"%s (%d) called\", buf, 0x12u);
  }

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __76__CDPStateUIProviderProxy_cdpContext_showResetCompletedAlertWithCompletion___block_invoke;
  block[3] = &unk_24C7C1470;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

}

void __76__CDPStateUIProviderProxy_cdpContext_showResetCompletedAlertWithCompletion___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  id v3;

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(*(id *)(a1[4] + 8), "cdpContext:showResetCompletedAlertWithCompletion:", a1[5], a1[6]);
  }
  else
  {
    v2 = a1[6];
    if (v2)
    {
      _CDPStateError(-5306, 0);
      v3 = (id)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, _QWORD, id))(v2 + 16))(v2, 0, v3);

    }
  }
}

- (void)cdpContext:(id)a3 createLocalSecretWithCompletion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;
  uint8_t buf[4];
  const char *v15;
  __int16 v16;
  int v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  _CDPLogSystem();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v15 = "-[CDPStateUIProviderProxy cdpContext:createLocalSecretWithCompletion:]";
    v16 = 1024;
    v17 = 287;
    _os_log_impl(&dword_20D7E6000, v8, OS_LOG_TYPE_DEFAULT, "\"%s (%d) called\", buf, 0x12u);
  }

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __70__CDPStateUIProviderProxy_cdpContext_createLocalSecretWithCompletion___block_invoke;
  block[3] = &unk_24C7C1470;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

}

void __70__CDPStateUIProviderProxy_cdpContext_createLocalSecretWithCompletion___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  id v3;

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(*(id *)(a1[4] + 8), "cdpContext:createLocalSecretWithCompletion:", a1[5], a1[6]);
  }
  else
  {
    v2 = a1[6];
    if (v2)
    {
      _CDPStateError(-5306, 0);
      v3 = (id)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, _QWORD, id))(v2 + 16))(v2, 0, v3);

    }
  }
}

- (void)presentQuotaScreenWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;
  uint8_t buf[4];
  const char *v10;
  __int16 v11;
  int v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  _CDPLogSystem();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v10 = "-[CDPStateUIProviderProxy presentQuotaScreenWithCompletion:]";
    v11 = 1024;
    v12 = 299;
    _os_log_impl(&dword_20D7E6000, v5, OS_LOG_TYPE_DEFAULT, "\"%s (%d) called\", buf, 0x12u);
  }

  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __60__CDPStateUIProviderProxy_presentQuotaScreenWithCompletion___block_invoke;
  v7[3] = &unk_24C7C1588;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(MEMORY[0x24BDAC9B8], v7);

}

uint64_t __60__CDPStateUIProviderProxy_presentQuotaScreenWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t result;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  if ((objc_opt_respondsToSelector() & 1) != 0)
    return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "presentQuotaScreenWithCompletion:", *(_QWORD *)(a1 + 40));
  _CDPLogSystem();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __60__CDPStateUIProviderProxy_presentQuotaScreenWithCompletion___block_invoke_cold_1(v3, v4, v5, v6, v7, v8, v9, v10);

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD))(result + 16))(result, 0, 0);
  return result;
}

- (CDPStateUIProvider)uiProvider
{
  return self->_uiProvider;
}

- (void)setUiProvider:(id)a3
{
  objc_storeStrong((id *)&self->_uiProvider, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uiProvider, 0);
}

- (void)cdpContext:(uint64_t)a3 promptForAdoptionOfMultipleICSC:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_20D7E6000, a1, a3, "\"Attempted to present CDPUI with incomplete uiProvider: %s\", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_5();
}

- (void)cdpContext:(uint64_t)a3 promptForICSCWithIsNumeric:(uint64_t)a4 numericLength:(uint64_t)a5 isRandom:(uint64_t)a6 validator:(uint64_t)a7 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_20D7E6000, a1, a3, "\"Attempted to present CDPUI with incomplete uiProvider: %s\", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_5();
}

- (void)cdpContext:(uint64_t)a3 promptForLocalSecretWithCompletion:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_20D7E6000, a1, a3, "\"Attempted to present CDPUI with incomplete uiProvider: %s\", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_5();
}

- (void)cdpContext:(uint64_t)a3 presentRemoteApprovalWithCompletion:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_20D7E6000, a1, a3, "\"Attempted to present CDPUI with incomplete uiProvider: %s\", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_5();
}

- (void)dismissRemoteApprovalWaitingScreenWithAction:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_20D7E6000, a1, a3, "\"Attempted to present CDPUI with incomplete uiProvider: %s\", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_5();
}

void __104__CDPStateUIProviderProxy_cdpContext_promptForRemoteSecretWithDevices_offeringRemoteApproval_validator___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_3(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_6_1();
  OUTLINED_FUNCTION_7(&dword_20D7E6000, v0, v1, "\"Warning: UI provider %@ does not respond to selector cdpContext:promptForRemoteSecretWithDevices:offeringRemoteApproval:validator:\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

void __93__CDPStateUIProviderProxy_cdpRecoveryFlowContext_promptForRemoteSecretWithDevices_validator___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_3(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_6_1();
  OUTLINED_FUNCTION_7(&dword_20D7E6000, v0, v1, "\"Warning: UI provider %@ does not respond to selectors cdpRecoveryFlowContext:promptForRemoteSecretWithDevices:validator: and cdpContext:promptForRemoteSecretWithDevices:offeringRemoteApproval:validator:\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

- (void)cdpContext:(os_log_t)log promptForInteractiveAuthenticationWithCompletion:.cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_20D7E6000, log, OS_LOG_TYPE_ERROR, "\"Bailed out of interactive authentication. Preventing appearance of prompt because network is unreachable.\", v1, 2u);
}

- (void)cdpContext:(uint64_t)a3 promptForInteractiveAuthenticationWithCompletion:(uint64_t)a4 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_20D7E6000, a1, a3, "\"Attempted to present CDPUI with incomplete uiProvider: %s\", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_5();
}

- (void)cdpContext:(uint64_t)a3 showError:(uint64_t)a4 withCompletion:(uint64_t)a5 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_20D7E6000, a2, a3, "\"Attempting to show error: %@\", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_5();
}

void __63__CDPStateUIProviderProxy_cdpContext_showError_withCompletion___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_3(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_6_1();
  OUTLINED_FUNCTION_0_2(&dword_20D7E6000, v0, v1, "\"Warning: UI provider %@ does not respond to selector cdpContext:showError:withCompletion:\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

void __80__CDPStateUIProviderProxy_cdpContext_showError_withDefaultIndex_withCompletion___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_3(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_6_1();
  OUTLINED_FUNCTION_0_2(&dword_20D7E6000, v0, v1, "\"Warning: UI provider %@ does not respond to selector cdpContext:showError:withDefaultIndex:withCompletion:\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

void __60__CDPStateUIProviderProxy_presentQuotaScreenWithCompletion___block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_20D7E6000, a1, a3, "\"%s: Attempted to present quota screen with incomplete uiProvider\", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_5();
}

@end
