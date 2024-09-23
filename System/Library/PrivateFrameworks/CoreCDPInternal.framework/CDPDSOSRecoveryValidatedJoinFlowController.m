@implementation CDPDSOSRecoveryValidatedJoinFlowController

- (id)recoveryValidatorWithDevices:(id)a3 forMultipleICSC:(BOOL)a4 withCompletionHandler:(id)a5
{
  _BOOL8 v6;
  id v8;
  id v9;
  CDPDSOSRecoveryValidatedJoinFlowController *v10;
  CDPDRemoteDeviceSecretValidator *v11;
  void *v12;
  void *v13;
  CDPDRemoteDeviceSecretValidator *v14;
  id v15;
  void *v16;
  uint64_t v18;
  uint64_t v19;
  void (*v20)(uint64_t);
  void *v21;
  id v22;
  _QWORD *v23;
  _QWORD v24[5];
  CDPDSOSRecoveryValidatedJoinFlowController *v25;

  v6 = a4;
  v8 = a3;
  v9 = a5;
  v24[0] = 0;
  v24[1] = v24;
  v24[2] = 0x3032000000;
  v24[3] = __Block_byref_object_copy__8;
  v24[4] = __Block_byref_object_dispose__8;
  v10 = self;
  v25 = v10;
  v11 = [CDPDRemoteDeviceSecretValidator alloc];
  -[CDPDRecoveryFlowController recoveryContext](v10, "recoveryContext");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "context");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = -[CDPDDeviceSecretValidator initWithContext:delegate:](v11, "initWithContext:delegate:", v13, v10);

  -[CDPDDeviceSecretValidator setIsUsingMultipleICSC:](v14, "setIsUsingMultipleICSC:", v6);
  v18 = MEMORY[0x24BDAC760];
  v19 = 3221225472;
  v20 = __113__CDPDSOSRecoveryValidatedJoinFlowController_recoveryValidatorWithDevices_forMultipleICSC_withCompletionHandler___block_invoke;
  v21 = &unk_24C81C0A8;
  v15 = v9;
  v22 = v15;
  v23 = v24;
  -[CDPDRemoteDeviceSecretValidator setValidSecretHandler:](v14, "setValidSecretHandler:", &v18);
  -[CDPDRecoveryFlowController recoveryContext](v10, "recoveryContext", v18, v19, v20, v21);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[CDPDDeviceSecretValidator setSupportedEscapeOfferMask:](v14, "setSupportedEscapeOfferMask:", -[CDPDSOSRecoveryValidatedJoinFlowController _escapeOfferForDevices:remoteApproval:forMultipleICSC:](v10, "_escapeOfferForDevices:remoteApproval:forMultipleICSC:", v8, objc_msgSend(v16, "hasPeersForRemoteApproval") | !v6, v6));

  _Block_object_dispose(v24, 8);
  return v14;
}

void __113__CDPDSOSRecoveryValidatedJoinFlowController_recoveryValidatorWithDevices_forMultipleICSC_withCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
    (*(void (**)(void))(v2 + 16))();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = 0;

}

- (unint64_t)_escapeOfferForDevices:(id)a3 remoteApproval:(BOOL)a4 forMultipleICSC:(BOOL)a5
{
  _BOOL4 v5;
  id v7;
  NSObject *v8;
  unint64_t v9;
  NSObject *v10;
  unint64_t v11;
  NSObject *v12;
  uint8_t v14[16];
  uint8_t buf[16];

  v5 = a4;
  v7 = a3;
  _CDPLogSystem();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    -[CDPDSOSRecoveryValidatedJoinFlowController _escapeOfferForDevices:remoteApproval:forMultipleICSC:].cold.1(self, v8);

  v9 = objc_msgSend(v7, "count");
  if (v9 < 2)
  {
    v11 = 1;
    if (!v5)
      return v11;
    goto LABEL_9;
  }
  _CDPLogSystem();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_20DB2C000, v10, OS_LOG_TYPE_DEFAULT, "\"Escape available: other devices\", buf, 2u);
  }

  v11 = 3;
  if (v5)
  {
LABEL_9:
    _CDPLogSystem();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v14 = 0;
      _os_log_impl(&dword_20DB2C000, v12, OS_LOG_TYPE_DEFAULT, "\"Escape available: remote approval\", v14, 2u);
    }

    v11 |= 4uLL;
  }
  return v11;
}

- (void)beginInteractiveRecoveryForDevices:(id)a3 isUsingMultipleICSC:(BOOL)a4 usingValidator:(id)a5
{
  _BOOL8 v6;
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  NSObject *v20;
  objc_super v21;
  _QWORD v22[4];
  id v23;
  uint8_t buf[16];

  v6 = a4;
  v8 = a3;
  v9 = a5;
  if (!objc_msgSend(v8, "count"))
  {
    _CDPLogSystem();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_20DB2C000, v10, OS_LOG_TYPE_DEFAULT, "\"User attempted to get into SOS after burning out all recovery options, present remote approval option\", buf, 2u);
    }

    -[CDPDRecoveryFlowController uiProvider](self, "uiProvider");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      -[CDPDRecoveryFlowController recoveryContext](self, "recoveryContext");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "hasPeersForRemoteApproval");

      if (v13)
      {
        -[CDPDRecoveryFlowController recoveryContext](self, "recoveryContext");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "context");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        -[CDPDSOSRecoveryValidatedJoinFlowController sendRemoteApprovalStartedBreadCrumbEventWithContext:](self, "sendRemoteApprovalStartedBreadCrumbEventWithContext:", v15);

        -[CDPDRecoveryFlowController uiProvider](self, "uiProvider");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        -[CDPDRecoveryFlowController recoveryContext](self, "recoveryContext");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "context");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v22[0] = MEMORY[0x24BDAC760];
        v22[1] = 3221225472;
        v22[2] = __116__CDPDSOSRecoveryValidatedJoinFlowController_beginInteractiveRecoveryForDevices_isUsingMultipleICSC_usingValidator___block_invoke;
        v22[3] = &unk_24C81C618;
        v19 = v9;
        v23 = v19;
        objc_msgSend(v16, "cdpContext:presentRemoteApprovalWithCompletion:", v18, v22);

        -[CDPDSOSRecoveryValidatedJoinFlowController beginRemoteApprovalWithValidator:](self, "beginRemoteApprovalWithValidator:", v19);
        goto LABEL_13;
      }
      _CDPLogSystem();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
        -[CDPDSOSRecoveryValidatedJoinFlowController beginInteractiveRecoveryForDevices:isUsingMultipleICSC:usingValidator:].cold.2();
    }
    else
    {
      _CDPLogSystem();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
        -[CDPDSOSRecoveryValidatedJoinFlowController beginInteractiveRecoveryForDevices:isUsingMultipleICSC:usingValidator:].cold.1();
    }

    goto LABEL_13;
  }
  v21.receiver = self;
  v21.super_class = (Class)CDPDSOSRecoveryValidatedJoinFlowController;
  -[CDPDRecoveryFlowController beginInteractiveRecoveryForDevices:isUsingMultipleICSC:usingValidator:](&v21, sel_beginInteractiveRecoveryForDevices_isUsingMultipleICSC_usingValidator_, v8, v6, v9);
LABEL_13:

}

void __116__CDPDSOSRecoveryValidatedJoinFlowController_beginInteractiveRecoveryForDevices_isUsingMultipleICSC_usingValidator___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  _CDPLogSystem();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 138412290;
    v9 = v4;
    _os_log_impl(&dword_20DB2C000, v5, OS_LOG_TYPE_DEFAULT, "\"presentRemoteApprovalWithCompletion completed with error: %@\", (uint8_t *)&v8, 0xCu);
  }

  if (objc_msgSend(v4, "code") == -5307)
  {
    objc_msgSend(*(id *)(a1 + 32), "cancelApproveFromAnotherDevice");
    v6 = *(void **)(a1 + 32);
    _CDPStateError();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "cancelValidationWithError:", v7);

  }
}

- (void)sendRemoteApprovalStartedBreadCrumbEventWithContext:(id)a3
{
  void *v3;
  id v4;

  -[CDPDSOSRecoveryValidatedJoinFlowController _makeRemoteApprovalStartedBreadCrumbEventWithContext:](self, "_makeRemoteApprovalStartedBreadCrumbEventWithContext:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE1A3E0], "rtcAnalyticsReporter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "sendEvent:", v4);

}

- (id)_makeRemoteApprovalStartedBreadCrumbEventWithContext:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x24BDFC2A0], "analyticsEventWithContext:eventName:category:", a3, *MEMORY[0x24BE1A768], *MEMORY[0x24BE1A860]);
}

- (void)sendRemoteApprovalCompletedEventWithContext:(id)a3 didApprove:(BOOL)a4 error:(id)a5
{
  void *v5;
  id v6;

  -[CDPDSOSRecoveryValidatedJoinFlowController _makeRemoteApprovalCompletedEventWithContext:didApprove:error:](self, "_makeRemoteApprovalCompletedEventWithContext:didApprove:error:", a3, a4, a5);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE1A3E0], "rtcAnalyticsReporter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sendEvent:", v6);

}

- (id)_makeRemoteApprovalCompletedEventWithContext:(id)a3 didApprove:(BOOL)a4 error:(id)a5
{
  _BOOL4 v5;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;

  v5 = a4;
  v7 = (void *)MEMORY[0x24BDFC2A0];
  v8 = *MEMORY[0x24BE1A760];
  v9 = *MEMORY[0x24BE1A860];
  v10 = a5;
  objc_msgSend(v7, "analyticsEventWithContext:eventName:category:", a3, v8, v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v5)
    v13 = MEMORY[0x24BDBD1C8];
  else
    v13 = MEMORY[0x24BDBD1C0];
  objc_msgSend(v11, "setObject:forKeyedSubscript:", v13, *MEMORY[0x24BE1A640]);
  objc_msgSend(v12, "populateUnderlyingErrorsStartingWithRootError:", v10);

  return v12;
}

- (void)remoteSecretValidator:(id)a3 applyToJoinCircleWithJoinHandler:(id)a4
{
  id v5;
  NSObject *v6;
  void *v7;

  v5 = a4;
  _CDPLogSystem();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    -[CDPDSOSRecoveryValidatedJoinFlowController remoteSecretValidator:applyToJoinCircleWithJoinHandler:].cold.1();

  -[CDPDRecoveryFlowController circleController](self, "circleController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "applyToJoinCircleWithJoinHandler:", v5);

}

- (void)cancelRemoteSecretValidatorApplicationToJoinCircle:(id)a3
{
  NSObject *v4;
  void *v5;

  _CDPLogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    -[CDPDSOSRecoveryValidatedJoinFlowController cancelRemoteSecretValidatorApplicationToJoinCircle:].cold.1();

  -[CDPDRecoveryFlowController circleController](self, "circleController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "cancelApplicationToJoinCircle");

}

- (void)secretValidatorWillAttemptRecovery
{
  id v2;

  -[CDPDRecoveryFlowController circleController](self, "circleController");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "prepareCircleStateForRecovery");

}

- (BOOL)secretValidator:(id)a3 shouldAcceptRecoveryError:(id *)a4
{
  id v6;
  NSObject *v7;
  dispatch_semaphore_t v8;
  void *v9;
  NSObject *v10;
  char v11;
  _QWORD v13[4];
  NSObject *v14;
  uint64_t *v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  char v26;
  os_activity_scope_state_s state;

  v6 = a3;
  v7 = _os_activity_create(&dword_20DB2C000, "cdp: Post Recovery Circle Join", MEMORY[0x24BDACB08], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v7, &state);
  v23 = 0;
  v24 = &v23;
  v25 = 0x2020000000;
  v26 = 0;
  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__8;
  v21 = __Block_byref_object_dispose__8;
  v22 = 0;
  v8 = dispatch_semaphore_create(0);
  -[CDPDRecoveryFlowController circleController](self, "circleController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __88__CDPDSOSRecoveryValidatedJoinFlowController_secretValidator_shouldAcceptRecoveryError___block_invoke;
  v13[3] = &unk_24C81DC58;
  v15 = &v23;
  v16 = &v17;
  v10 = v8;
  v14 = v10;
  objc_msgSend(v9, "joinCircleAfterRecoveryWithCompletion:", v13);

  dispatch_semaphore_wait(v10, 0xFFFFFFFFFFFFFFFFLL);
  if (a4)
    *a4 = objc_retainAutorelease((id)v18[5]);
  v11 = *((_BYTE *)v24 + 24);

  _Block_object_dispose(&v17, 8);
  _Block_object_dispose(&v23, 8);
  os_activity_scope_leave(&state);

  return v11;
}

void __88__CDPDSOSRecoveryValidatedJoinFlowController_secretValidator_shouldAcceptRecoveryError___block_invoke(uint64_t a1, char a2, id obj)
{
  id v5;

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a2;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), obj);
  v5 = obj;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

- (void)secretValidator:(id)a3 didFailRecovery:(id)a4 withError:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void (**v14)(_QWORD, _QWORD, _QWORD);
  void *v15;
  _BOOL8 v16;
  NSObject *v17;
  _QWORD v18[5];
  id v19;
  id v20;
  void (**v21)(_QWORD, _QWORD, _QWORD);
  uint8_t buf[4];
  _BOOL4 v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  if (!v13)
    -[CDPDSOSRecoveryValidatedJoinFlowController secretValidator:didFailRecovery:withError:completion:].cold.1();
  v14 = (void (**)(_QWORD, _QWORD, _QWORD))v13;
  if (objc_msgSend(v12, "isLoginHardLimit"))
  {
    v18[0] = MEMORY[0x24BDAC760];
    v18[1] = 3221225472;
    v18[2] = __99__CDPDSOSRecoveryValidatedJoinFlowController_secretValidator_didFailRecovery_withError_completion___block_invoke;
    v18[3] = &unk_24C81D780;
    v18[4] = self;
    v19 = v12;
    v20 = v10;
    v21 = v14;
    -[CDPDSOSRecoveryValidatedJoinFlowController _handleHardLimitErrorForCurrentContextWithDevice:completion:](self, "_handleHardLimitErrorForCurrentContextWithDevice:completion:", v11, v18);

  }
  else if (objc_msgSend(v12, "isLoginSoftLimit"))
  {
    -[CDPDSOSRecoveryValidatedJoinFlowController _handleSoftLimitErrorForCurrentContextWithDevice:completion:](self, "_handleSoftLimitErrorForCurrentContextWithDevice:completion:", v11, v14);
  }
  else
  {
    objc_msgSend(v12, "domain");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v15, "isEqualToString:", *MEMORY[0x24BE1A368]))
      v16 = objc_msgSend(v12, "code") != -5206;
    else
      v16 = 1;

    _CDPLogSystem();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      v23 = v16;
      _os_log_impl(&dword_20DB2C000, v17, OS_LOG_TYPE_DEFAULT, "\"Non-terminating error detected, with retry option: %{BOOL}d\", buf, 8u);
    }

    ((void (**)(_QWORD, _BOOL8, id))v14)[2](v14, v16, v12);
  }

}

void __99__CDPDSOSRecoveryValidatedJoinFlowController_secretValidator_didFailRecovery_withError_completion___block_invoke(id *a1, char a2, void *a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void (*v16)(uint64_t);
  void *v17;
  id v18;
  id v19;
  id v20;
  char v21;

  v5 = a3;
  objc_msgSend(v5, "domain");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v6, "isEqualToString:", *MEMORY[0x24BE1A368]))
  {

    goto LABEL_5;
  }
  v7 = objc_msgSend(v5, "code");

  if (v7 != -5209)
  {
LABEL_5:
    (*((void (**)(void))a1[7] + 2))();
    goto LABEL_6;
  }
  v8 = a1[4];
  objc_msgSend(v8, "recoveryContext");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "context");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "sendRemoteApprovalStartedBreadCrumbEventWithContext:", v10);

  objc_msgSend(a1[4], "uiProvider");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1[4], "recoveryContext");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "context");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = MEMORY[0x24BDAC760];
  v15 = 3221225472;
  v16 = __99__CDPDSOSRecoveryValidatedJoinFlowController_secretValidator_didFailRecovery_withError_completion___block_invoke_2;
  v17 = &unk_24C81D820;
  v18 = a1[5];
  v19 = a1[6];
  v20 = a1[7];
  v21 = a2;
  objc_msgSend(v11, "cdpContext:presentRemoteApprovalWithCompletion:", v13, &v14);

  objc_msgSend(a1[4], "beginRemoteApprovalWithValidator:", a1[6], v14, v15, v16, v17);
LABEL_6:

}

void __99__CDPDSOSRecoveryValidatedJoinFlowController_secretValidator_didFailRecovery_withError_completion___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;

  _CDPLogSystem();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    __99__CDPDSOSRecoveryValidatedJoinFlowController_secretValidator_didFailRecovery_withError_completion___block_invoke_2_cold_1(a1, v2, v3);

  if (objc_msgSend(*(id *)(a1 + 32), "code") == -5307)
  {
    objc_msgSend(*(id *)(a1 + 40), "cancelApproveFromAnotherDevice");
    v4 = *(void **)(a1 + 40);
    _CDPStateError();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "cancelValidationWithError:", v5);

  }
  v6 = *(_QWORD *)(a1 + 48);
  v7 = *(unsigned __int8 *)(a1 + 56);
  _CDPStateError();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, uint64_t, void *))(v6 + 16))(v6, v7, v8);

}

- (void)beginRemoteApprovalWithValidator:(id)a3
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __79__CDPDSOSRecoveryValidatedJoinFlowController_beginRemoteApprovalWithValidator___block_invoke;
  v3[3] = &unk_24C81C618;
  v3[4] = self;
  objc_msgSend(a3, "approveFromAnotherDeviceWithCompletion:", v3);
}

void __79__CDPDSOSRecoveryValidatedJoinFlowController_beginRemoteApprovalWithValidator___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;

  v5 = *(void **)(a1 + 32);
  v6 = a3;
  objc_msgSend(v5, "recoveryContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "context");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sendRemoteApprovalCompletedEventWithContext:didApprove:error:", v8, a2, v6);

  objc_msgSend(*(id *)(a1 + 32), "uiProvider");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v9;
  if ((_DWORD)a2)
    v10 = 2;
  else
    v10 = 1;
  objc_msgSend(v9, "dismissRemoteApprovalWaitingScreenWithAction:", v10);

}

- (void)_handleHardLimitErrorForCurrentContextWithDevice:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  uint8_t v9[16];

  v6 = a4;
  v7 = a3;
  _CDPLogSystem();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v9 = 0;
    _os_log_impl(&dword_20DB2C000, v8, OS_LOG_TYPE_DEFAULT, "\"Starting handling hard limit error...\", v9, 2u);
  }

  -[CDPDSOSRecoveryValidatedJoinFlowController _handleLimit:forDevice:completion:](self, "_handleLimit:forDevice:completion:", 2, v7, v6);
}

- (void)_handleSoftLimitErrorForCurrentContextWithDevice:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  uint8_t v9[16];

  v6 = a4;
  v7 = a3;
  _CDPLogSystem();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v9 = 0;
    _os_log_impl(&dword_20DB2C000, v8, OS_LOG_TYPE_DEFAULT, "\"Starting handling soft limit error...\", v9, 2u);
  }

  -[CDPDSOSRecoveryValidatedJoinFlowController _handleLimit:forDevice:completion:](self, "_handleLimit:forDevice:completion:", 1, v7, v6);
}

- (void)_handleLimit:(unint64_t)a3 forDevice:(id)a4 completion:(id)a5
{
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a5;
  -[CDPDSOSRecoveryValidatedJoinFlowController _userInfoForLimit:withDevice:](self, "_userInfoForLimit:withDevice:", a3, a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(MEMORY[0x24BDBD1B8], "mutableCopy");
  -[CDPDSOSRecoveryValidatedJoinFlowController _remoteApprovalRecoveryOptionWithCompletion:](self, "_remoteApprovalRecoveryOptionWithCompletion:", v13);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    -[CDPDSOSRecoveryValidatedJoinFlowController _cancelRecoveryOptionWithCompletion:](self, "_cancelRecoveryOptionWithCompletion:", v13);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[CDPDSOSRecoveryValidatedJoinFlowController _populateUserInfo:recoveryIndexHandlers:withRecoveryOption:](self, "_populateUserInfo:recoveryIndexHandlers:withRecoveryOption:", v8, v9, v10);
  }
  else
  {
    -[CDPDSOSRecoveryValidatedJoinFlowController _okRecoveryOptionWithCompletion:](self, "_okRecoveryOptionWithCompletion:", v13);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  -[CDPDSOSRecoveryValidatedJoinFlowController _populateUserInfo:recoveryIndexHandlers:withRecoveryOption:](self, "_populateUserInfo:recoveryIndexHandlers:withRecoveryOption:", v8, v9, v11);

  _CDPStateError();
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[CDPDSOSRecoveryValidatedJoinFlowController _showEntryLimitError:withRecoveryOptionHandlers:defaultIndex:completion:](self, "_showEntryLimitError:withRecoveryOptionHandlers:defaultIndex:completion:", v12, v9, 0, v13);

}

- (void)_populateUserInfo:(id)a3 recoveryIndexHandlers:(id)a4 withRecoveryOption:(id)a5
{
  id v7;
  uint64_t v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;

  v7 = a3;
  if (a5)
  {
    v8 = *MEMORY[0x24BDD0FE8];
    v18 = v7;
    v9 = a5;
    v10 = a4;
    objc_msgSend(v18, "objectForKeyedSubscript:", v8);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      objc_msgSend(v18, "objectForKeyedSubscript:", v8);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = (void *)objc_msgSend(v12, "mutableCopy");

    }
    else
    {
      objc_msgSend(MEMORY[0x24BDBCEB8], "array");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
    }

    objc_msgSend(v9, "localizedRecoveryOption");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "addObject:", v14);

    objc_msgSend(v9, "recoveryHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    v16 = _Block_copy(v15);
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(v10, "count"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setObject:forKeyedSubscript:", v16, v17);

    objc_msgSend(v18, "setObject:forKeyedSubscript:", v13, v8);
    v7 = v18;
  }

}

- (id)_userInfoForLimit:(unint64_t)a3 withDevice:(id)a4
{
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;

  v6 = a4;
  if (a3 == 2)
  {
    -[CDPDSOSRecoveryValidatedJoinFlowController _hardLimitErrorBodyWithDevice:](self, "_hardLimitErrorBodyWithDevice:", v6);
    v7 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (a3 != 1)
    {
      v8 = 0;
      goto LABEL_7;
    }
    -[CDPDSOSRecoveryValidatedJoinFlowController _softLimitErrorBodyForDevice:](self, "_softLimitErrorBodyForDevice:", v6);
    v7 = objc_claimAutoreleasedReturnValue();
  }
  v8 = (void *)v7;
LABEL_7:
  -[CDPDSOSRecoveryValidatedJoinFlowController _entryLimitTitleForDevice:forLimitType:](self, "_entryLimitTitleForDevice:forLimitType:", v6, a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[CDPDSOSRecoveryValidatedJoinFlowController _infoDictionaryWithTitle:andBody:](self, "_infoDictionaryWithTitle:andBody:", v9, v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)_remoteApprovalRecoveryOptionWithCompletion:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  _QWORD v14[4];
  NSObject *v15;
  uint8_t buf[16];

  v4 = a3;
  -[CDPDRecoveryFlowController validator](self, "validator");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v5, "supportedEscapeOfferMask") & 4) == 0)
  {

LABEL_7:
    _CDPLogSystem();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_20DB2C000, v12, OS_LOG_TYPE_DEFAULT, "\"No fallback available\", buf, 2u);
    }
    v9 = 0;
    goto LABEL_10;
  }
  -[CDPDRecoveryFlowController recoveryContext](self, "recoveryContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "hasPeersForRemoteApproval");

  if (!v7)
    goto LABEL_7;
  _CDPLogSystem();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_20DB2C000, v8, OS_LOG_TYPE_DEFAULT, "\"Creating recovery option: Remote Approval\", buf, 2u);
  }

  v9 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x24BE1A458], "builderForKey:", CFSTR("REMOTE_SECRET_ENTRY_MULTIPLE_INCORRECT_BUTTON_APPROVE"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "localizedString");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setLocalizedRecoveryOption:", v11);

  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __90__CDPDSOSRecoveryValidatedJoinFlowController__remoteApprovalRecoveryOptionWithCompletion___block_invoke;
  v14[3] = &unk_24C81C170;
  v15 = v4;
  objc_msgSend(v9, "setRecoveryHandler:", v14);
  v12 = v15;
LABEL_10:

  return v9;
}

void __90__CDPDSOSRecoveryValidatedJoinFlowController__remoteApprovalRecoveryOptionWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  _CDPStateError();
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, _QWORD, id))(v1 + 16))(v1, 0, v2);

}

- (id)_cancelRecoveryOptionWithCompletion:(id)a3
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  _QWORD v10[4];
  id v11;
  uint8_t buf[16];

  v3 = a3;
  _CDPLogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_20DB2C000, v4, OS_LOG_TYPE_DEFAULT, "\"Creating recovery option: Cancel\", buf, 2u);
  }

  v5 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x24BE1A458], "builderForKey:", CFSTR("GENERIC_CANCEL_BUTTON"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "localizedString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setLocalizedRecoveryOption:", v7);

  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __82__CDPDSOSRecoveryValidatedJoinFlowController__cancelRecoveryOptionWithCompletion___block_invoke;
  v10[3] = &unk_24C81C170;
  v11 = v3;
  v8 = v3;
  objc_msgSend(v5, "setRecoveryHandler:", v10);

  return v5;
}

void __82__CDPDSOSRecoveryValidatedJoinFlowController__cancelRecoveryOptionWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  _CDPStateError();
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, _QWORD, id))(v1 + 16))(v1, 0, v2);

}

- (id)_okRecoveryOptionWithCompletion:(id)a3
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  _QWORD v10[4];
  id v11;
  uint8_t buf[16];

  v3 = a3;
  _CDPLogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_20DB2C000, v4, OS_LOG_TYPE_DEFAULT, "\"Creating recovery option: OK\", buf, 2u);
  }

  v5 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x24BE1A458], "builderForKey:", CFSTR("GENERIC_ERROR_DEFAULT_BUTTON"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "localizedString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setLocalizedRecoveryOption:", v7);

  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __78__CDPDSOSRecoveryValidatedJoinFlowController__okRecoveryOptionWithCompletion___block_invoke;
  v10[3] = &unk_24C81C170;
  v11 = v3;
  v8 = v3;
  objc_msgSend(v5, "setRecoveryHandler:", v10);

  return v5;
}

void __78__CDPDSOSRecoveryValidatedJoinFlowController__okRecoveryOptionWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  _CDPStateError();
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, _QWORD, id))(v1 + 16))(v1, 0, v2);

}

- (void)_showEntryLimitError:(id)a3 withRecoveryOptionHandlers:(id)a4 defaultIndex:(int64_t)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  _QWORD v19[4];
  id v20;
  id v21;
  uint8_t buf[4];
  void *v23;
  __int16 v24;
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v12 = a6;
  _CDPLogSystem();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    -[CDPDRecoveryFlowController uiProvider](self, "uiProvider");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v23 = v14;
    v24 = 2112;
    v25 = v10;
    _os_log_impl(&dword_20DB2C000, v13, OS_LOG_TYPE_DEFAULT, "\"Attempting to preset alert (using: %@) for error: %@\", buf, 0x16u);

  }
  -[CDPDRecoveryFlowController uiProvider](self, "uiProvider");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    -[CDPDRecoveryFlowController uiProvider](self, "uiProvider");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[CDPDRecoveryFlowController recoveryContext](self, "recoveryContext");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "context");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19[0] = MEMORY[0x24BDAC760];
    v19[1] = 3221225472;
    v19[2] = __118__CDPDSOSRecoveryValidatedJoinFlowController__showEntryLimitError_withRecoveryOptionHandlers_defaultIndex_completion___block_invoke;
    v19[3] = &unk_24C81C260;
    v20 = v11;
    v21 = v12;
    objc_msgSend(v16, "cdpContext:showError:withDefaultIndex:withCompletion:", v18, v10, a5, v19);

  }
  else
  {
    (*((void (**)(id, _QWORD, id))v12 + 2))(v12, 0, v10);
  }

}

void __118__CDPDSOSRecoveryValidatedJoinFlowController__showEntryLimitError_withRecoveryOptionHandlers_defaultIndex_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void (**v8)(_QWORD);
  uint64_t v9;
  void *v10;
  int v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  _CDPLogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a2);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 138412290;
    v12 = v5;
    _os_log_impl(&dword_20DB2C000, v4, OS_LOG_TYPE_DEFAULT, "\"User responded to presented alert with option: %@\", (uint8_t *)&v11, 0xCu);

  }
  v6 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", v7);
  v8 = (void (**)(_QWORD))objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    v8[2](v8);
  }
  else
  {
    v9 = *(_QWORD *)(a1 + 40);
    _CDPStateError();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, void *))(v9 + 16))(v9, 0, v10);

  }
}

- (id)_entryLimitTitleForDevice:(id)a3 forLimitType:(unint64_t)a4
{
  void *v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;

  v5 = (void *)MEMORY[0x24BE1A458];
  v6 = a3;
  objc_msgSend(v5, "builderForKey:", CFSTR("REMOTE_SECRET_ENTRY_MULTIPLE_INCORRECT_TITLE"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "localSecretType");

  objc_msgSend(v7, "addSecretType:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "localizedString");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (a4 == 2)
  {
    CDPLocalizedString();
    v11 = objc_claimAutoreleasedReturnValue();

    v10 = (void *)v11;
  }
  return v10;
}

- (id)_entryLimitNoResetForRepairForDevice:(id)a3
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  const __CFString *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v4 = a3;
  -[CDPDRecoveryFlowController recoveryContext](self, "recoveryContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hasPeersForRemoteApproval");

  v7 = (void *)MEMORY[0x24BDD17C8];
  if (v6)
    v8 = CFSTR("REMOTE_SECRET_ENTRY_MULTIPLE_INCORRECT_MESSAGE_REMOTE_APPROVAL_NO_RESET");
  else
    v8 = CFSTR("REMOTE_SECRET_ENTRY_MULTIPLE_INCORRECT_MESSAGE_NO_RESET");
  objc_msgSend(MEMORY[0x24BE1A458], "builderForKey:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addSecretType:", objc_msgSend(v4, "localSecretType"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "localizedString");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedName");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "stringWithValidatedFormat:validFormatSpecifiers:error:", v11, CFSTR("%@"), 0, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (id)_entryLimitRemoteApprovalAvailableBodyForDevice:(id)a3
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v4 = a3;
  -[CDPDRecoveryFlowController recoveryContext](self, "recoveryContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hasPeersForRemoteApproval");

  if (v6)
  {
    objc_msgSend(MEMORY[0x24BE1A458], "builderForKey:", CFSTR("REMOTE_SECRET_SOS_ENTRY_MULTIPLE_INCORRECT_MESSAGE_REMOTE_APPROVAL"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v4, "localSecretType");

    objc_msgSend(v7, "addSecretType:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "localizedString");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v11 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(MEMORY[0x24BE1A458], "builderForKey:", CFSTR("REMOTE_SECRET_SOS_ENTRY_MULTIPLE_INCORRECT_MESSAGE_NO_REMOTE_APPROVAL"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addSecretType:", objc_msgSend(v4, "localSecretType"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "localizedString");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "localizedName");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v11, "stringWithValidatedFormat:validFormatSpecifiers:error:", v12, CFSTR("%@"), 0, v13);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v10;
}

- (id)_infoDictionaryWithTitle:(id)a3 andBody:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;

  v5 = a3;
  v6 = a4;
  v7 = (void *)objc_msgSend(MEMORY[0x24BDBD1B8], "mutableCopy");
  v8 = v7;
  if (v5)
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v5, *MEMORY[0x24BDD0FC8]);
  if (v6)
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v6, *MEMORY[0x24BDD0FD8]);

  return v8;
}

- (void)_escapeOfferForDevices:(void *)a1 remoteApproval:(NSObject *)a2 forMultipleICSC:.cold.1(void *a1, NSObject *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend(a1, "recoveryContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "context");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "numberWithInteger:", objc_msgSend(v5, "type"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 138412290;
  v9 = v6;
  OUTLINED_FUNCTION_1_0(&dword_20DB2C000, a2, v7, "\"Context Type: %@\", (uint8_t *)&v8);

}

- (void)beginInteractiveRecoveryForDevices:isUsingMultipleICSC:usingValidator:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_3(&dword_20DB2C000, v0, v1, "\"uiProvider is nil while trying to present remote approval\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4_0();
}

- (void)beginInteractiveRecoveryForDevices:isUsingMultipleICSC:usingValidator:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_3(&dword_20DB2C000, v0, v1, "\"No peers found for remote approval\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4_0();
}

- (void)remoteSecretValidator:applyToJoinCircleWithJoinHandler:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_3(&dword_20DB2C000, v0, v1, "\"CDPDRemoteDeviceSecretValidatorDelegate applying to join circle\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4_0();
}

- (void)cancelRemoteSecretValidatorApplicationToJoinCircle:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_3(&dword_20DB2C000, v0, v1, "\"CDPDRemoteDeviceSecretValidatorDelegate cancelling application to join circle\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4_0();
}

- (void)secretValidator:didFailRecovery:withError:completion:.cold.1()
{
  __assert_rtn("-[CDPDSOSRecoveryValidatedJoinFlowController secretValidator:didFailRecovery:withError:completion:]", "CDPDSOSRecoveryValidatedJoinFlowController.m", 176, "completion");
}

void __99__CDPDSOSRecoveryValidatedJoinFlowController_secretValidator_didFailRecovery_withError_completion___block_invoke_2_cold_1(uint64_t a1, NSObject *a2, uint64_t a3)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v3 = *(_QWORD *)(a1 + 32);
  v4 = 138412290;
  v5 = v3;
  OUTLINED_FUNCTION_1_0(&dword_20DB2C000, a2, a3, "\"presentRemoteApprovalWithCompletion completed with error: %@\", (uint8_t *)&v4);
}

@end
