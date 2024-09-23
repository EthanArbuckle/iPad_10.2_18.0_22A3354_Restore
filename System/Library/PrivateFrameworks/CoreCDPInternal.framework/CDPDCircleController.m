@implementation CDPDCircleController

- (CDPDCircleController)initWithUiProvider:(id)a3 delegate:(id)a4 circleProxy:(id)a5 octagonTrustProxy:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  CDPDCircleController *v15;
  CDPDCircleController *v16;
  NSObject *v17;
  dispatch_queue_t v18;
  OS_dispatch_queue *requestSynchronizationQueue;
  NSArray *retryIntervals;
  NSObject *v21;
  NSObject *v22;
  dispatch_queue_t v23;
  OS_dispatch_queue *cdpdCircleDefaultQueue;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v15 = -[CDPDCircleController init](self, "init");
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_uiProvider, a3);
    objc_storeWeak((id *)&v16->_delegate, v12);
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = dispatch_queue_create("com.apple.cdpd.circleRequestQueue", v17);
    requestSynchronizationQueue = v16->_requestSynchronizationQueue;
    v16->_requestSynchronizationQueue = (OS_dispatch_queue *)v18;

    objc_storeStrong((id *)&v16->_circleProxy, a5);
    objc_storeStrong((id *)&v16->_octagonProxy, a6);
    retryIntervals = v16->_retryIntervals;
    v16->_retryIntervals = (NSArray *)&unk_24C836810;

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v21 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_attr_make_with_qos_class(v21, QOS_CLASS_DEFAULT, 0);
    v22 = objc_claimAutoreleasedReturnValue();

    v23 = dispatch_queue_create("com.apple.cdpd.circleControllerDefaultQueue", v22);
    cdpdCircleDefaultQueue = v16->_cdpdCircleDefaultQueue;
    v16->_cdpdCircleDefaultQueue = (OS_dispatch_queue *)v23;

  }
  return v16;
}

- (void)dealloc
{
  objc_super v3;

  -[CDPDCircleStateObserver stopObservingCircleStatusChange](self->_circleJoinObserver, "stopObservingCircleStatusChange");
  v3.receiver = self;
  v3.super_class = (Class)CDPDCircleController;
  -[CDPDCircleController dealloc](&v3, sel_dealloc);
}

- (unint64_t)circleStatus
{
  return -[CDPDCircleProxy combinedCircleStatus:](self->_circleProxy, "combinedCircleStatus:", 0);
}

- (int)circleSyncingStatus
{
  return -[CDPDCircleProxy cachedSOSCircleStatus:](self->_circleProxy, "cachedSOSCircleStatus:", 0);
}

- (int64_t)cliqueStatus
{
  return -[CDPDCircleProxy cliqueStatus:](self->_circleProxy, "cliqueStatus:", 0);
}

- (id)peerID
{
  return (id)-[CDPDCircleProxy peerId](self->_circleProxy, "peerId");
}

- (BOOL)synchronizeCircleViews
{
  return -[CDPDCircleProxy synchronizeCircleViews](self->_circleProxy, "synchronizeCircleViews");
}

- (void)prepareCircleStateForRecovery
{
  OUTLINED_FUNCTION_0(&dword_20DB2C000, a2, a3, "\"Failed to reset to offering: %@\", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_4();
}

intptr_t __53__CDPDCircleController_prepareCircleStateForRecovery__block_invoke(intptr_t result, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  intptr_t v4;
  NSObject *v5;
  uint8_t v6[16];
  uint64_t v7;
  uint64_t v8;

  if (a2 != 3)
  {
    v7 = v2;
    v8 = v3;
    v4 = result;
    _CDPLogSystem();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_20DB2C000, v5, OS_LOG_TYPE_DEFAULT, "\"Circle state changed to a state other than pending, proceeding with recovery\", v6, 2u);
    }

    objc_msgSend(*(id *)(v4 + 32), "stopObservingCircleStatusChange");
    return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(v4 + 40));
  }
  return result;
}

- (void)joinCircleWithContext:(id)a3 completion:(id)a4
{
  -[CDPDCircleController _joinCircleIgnoringBackups:context:completion:](self, "_joinCircleIgnoringBackups:context:completion:", 0, a3, a4);
}

- (void)joinCircleWithCompletion:(id)a3
{
  -[CDPDCircleController joinCircleIgnoringBackups:completion:](self, "joinCircleIgnoringBackups:completion:", 0, a3);
}

- (void)joinCircleIgnoringBackups:(BOOL)a3 completion:(id)a4
{
  -[CDPDCircleController _joinCircleIgnoringBackups:context:completion:](self, "_joinCircleIgnoringBackups:context:completion:", a3, 0, a4);
}

- (void)_joinCircleIgnoringBackups:(BOOL)a3 context:(id)a4 completion:(id)a5
{
  _BOOL4 v6;
  id v8;
  void (**v9)(id, CDPDCircleJoinResult *, _QWORD);
  id v10;
  CDPDSecureChannelContext *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  CDPDCircleProxy *circleProxy;
  uint64_t v17;
  id v18;
  CDPDCircleJoinResult *v19;
  NSObject *v20;
  _BOOL4 v21;
  NSObject *v22;
  _BOOL4 v23;
  void *v24;
  NSObject *v25;
  NSObject *v26;
  void *v27;
  void *v28;
  int64_t v29;
  NSObject *v30;
  void *v31;
  void *v32;
  os_signpost_id_t v33;
  NSObject *v34;
  NSObject *v35;
  NSObject *v36;
  int v37;
  void *v38;
  _BOOL4 v39;
  int v40;
  int v41;
  id v42;
  CDPDSecureChannelController *v43;
  void *v44;
  void *v45;
  NSObject *v46;
  _BOOL4 v47;
  void *v48;
  id v49;
  void *v50;
  _BOOL4 v51;
  NSObject *v52;
  _BOOL4 v53;
  void *v54;
  void *v55;
  _BOOL4 v56;
  id v57;
  void (**v58)(id, CDPDCircleJoinResult *, _QWORD);
  _QWORD v59[4];
  void (**v60)(id, CDPDCircleJoinResult *, _QWORD);
  _QWORD v61[5];
  CDPDCircleJoinResult *v62;
  void (**v63)(id, CDPDCircleJoinResult *, _QWORD);
  char v64;
  BOOL v65;
  id v66;
  id v67;
  uint8_t buf[4];
  _BYTE v69[20];
  _BYTE v70[10];
  __int16 v71;
  _BOOL4 v72;
  uint64_t v73;

  v6 = a3;
  v73 = *MEMORY[0x24BDAC8D0];
  v8 = a4;
  v9 = (void (**)(id, CDPDCircleJoinResult *, _QWORD))a5;
  if (v8)
  {
    v10 = v8;
    v11 = [CDPDSecureChannelContext alloc];
    -[CDPDCircleController circleProxy](self, "circleProxy");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = -[CDPDSecureChannelContext initWithContext:circleProxy:](v11, "initWithContext:circleProxy:", v10, v12);
  }
  else
  {
    -[CDPDCircleController delegate](self, "delegate");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "contextForController:", self);
    v10 = (id)objc_claimAutoreleasedReturnValue();

    -[CDPDCircleController delegate](self, "delegate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "secureChannelContextForController:", self);
    v13 = objc_claimAutoreleasedReturnValue();
  }
  v15 = (void *)v13;

  objc_msgSend(v10, "populateWalrusStatus");
  circleProxy = self->_circleProxy;
  v67 = 0;
  v17 = -[CDPDCircleProxy combinedCircleStatus:](circleProxy, "combinedCircleStatus:", &v67);
  v18 = v67;
  v19 = objc_alloc_init(CDPDCircleJoinResult);
  -[CDPDCircleJoinResult setCircleStatus:](v19, "setCircleStatus:", v17);
  -[CDPDCircleJoinResult setRequiresEscrowRecordsFetch:](v19, "setRequiresEscrowRecordsFetch:", 1);
  -[CDPDCircleJoinResult setRequiresInitialSync:](v19, "setRequiresInitialSync:", 1);
  if (v17 == 3)
  {
    -[CDPDCircleJoinResult setNeedsBackupRecovery:](v19, "setNeedsBackupRecovery:", 1);
LABEL_10:
    v9[2](v9, v19, 0);
    goto LABEL_11;
  }
  if (v17 == 1)
  {
    _CDPLogSystem();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
      -[CDPDCircleController _joinCircleIgnoringBackups:context:completion:].cold.6();

    -[CDPDCircleJoinResult setDidJoin:](v19, "setDidJoin:", 1);
    goto LABEL_10;
  }
  v56 = v6;
  v57 = v18;
  v21 = -[CDPDCircleController canRetryCliqueStatus](self, "canRetryCliqueStatus");
  _CDPLogSystem();
  v22 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(v10, "sharingChannel");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    v51 = -[CDPDCircleController canRetryCliqueStatus](self, "canRetryCliqueStatus");
    *(_DWORD *)buf = 134218498;
    *(_QWORD *)v69 = v17;
    *(_WORD *)&v69[8] = 2112;
    *(_QWORD *)&v69[10] = v50;
    *(_WORD *)&v69[18] = 1024;
    *(_DWORD *)v70 = v51;
    _os_log_debug_impl(&dword_20DB2C000, v22, OS_LOG_TYPE_DEBUG, "\"CDP join status: %lu, Sharing channel: %@, Retry possible: %{BOOL}d\", buf, 0x1Cu);

  }
  v23 = 1;
  if (v17 != 2 && v17 != 4)
  {
    if (v17 == 5)
    {
      v23 = 0;
    }
    else
    {
      objc_msgSend(v10, "sharingChannel");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = v24 != 0;

    }
  }
  _CDPLogSystem();
  v25 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(v10, "sharingChannel");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 67110146;
    *(_DWORD *)v69 = v23;
    *(_WORD *)&v69[4] = 2048;
    *(_QWORD *)&v69[6] = v17;
    *(_WORD *)&v69[14] = 1024;
    *(_DWORD *)&v69[16] = v17 != 5;
    *(_WORD *)v70 = 2112;
    *(_QWORD *)&v70[2] = v55;
    v71 = 1024;
    v72 = v21;
    _os_log_debug_impl(&dword_20DB2C000, v25, OS_LOG_TYPE_DEBUG, "\"Will attempt circle join: %{BOOL}d; CDP join status: %lu, has CK account: %{BOOL}d, Sharing channel: %@, Retry p"
      "ossible: %{BOOL}d\",
      buf,
      0x28u);

  }
  if (v23)
  {
    _CDPLogSystem();
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v10, "altDSID");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 141558274;
      *(_QWORD *)v69 = 1752392040;
      *(_WORD *)&v69[8] = 2112;
      *(_QWORD *)&v69[10] = v27;
      _os_log_impl(&dword_20DB2C000, v26, OS_LOG_TYPE_DEFAULT, "\"Attempting circle join for %{mask.hash}@\", buf, 0x16u);

    }
    objc_msgSend(MEMORY[0x24BE1A448], "sharedInstance");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v28, "supportsSecureBackupRecovery"))
    {

    }
    else
    {
      v37 = objc_msgSend(v10, "_recoveryMethodAvailable");

      if (!v37)
      {
        v39 = 0;
        v40 = 0;
        if (v15)
        {
LABEL_38:
          v66 = 0;
          v41 = objc_msgSend(v15, "initialize:", &v66);
          v42 = v66;
          if (v41)
          {
            v43 = -[CDPDSecureChannelController initWithContext:]([CDPDSecureChannelController alloc], "initWithContext:", v15);
            v61[0] = MEMORY[0x24BDAC760];
            v61[1] = 3221225472;
            v61[2] = __70__CDPDCircleController__joinCircleIgnoringBackups_context_completion___block_invoke;
            v61[3] = &unk_24C81CC30;
            v64 = v40;
            v61[4] = self;
            v62 = v19;
            v65 = v56;
            v63 = v9;
            -[CDPDSecureChannelController joinCircle:](v43, "joinCircle:", v61);

            goto LABEL_53;
          }
LABEL_45:
          _CDPLogSystem();
          v46 = objc_claimAutoreleasedReturnValue();
          v47 = os_log_type_enabled(v46, OS_LOG_TYPE_ERROR);
          if (v39)
          {
            if (v47)
              -[CDPDCircleController _joinCircleIgnoringBackups:context:completion:].cold.1();

            objc_msgSend(v10, "custodianRecoveryInfo");
            v48 = (void *)objc_claimAutoreleasedReturnValue();
            v59[0] = MEMORY[0x24BDAC760];
            v59[1] = 3221225472;
            v59[2] = __70__CDPDCircleController__joinCircleIgnoringBackups_context_completion___block_invoke_33;
            v59[3] = &unk_24C81C0F8;
            v60 = v9;
            -[CDPDCircleController _attemptCustodianBackupRecoveryWithInfo:result:ignoreBackups:completion:](self, "_attemptCustodianBackupRecoveryWithInfo:result:ignoreBackups:completion:", v48, v19, v56, v59);

          }
          else
          {
            if (!v40)
            {
              if (v47)
                -[CDPDCircleController _joinCircleIgnoringBackups:context:completion:].cold.5();

              v18 = v57;
              if (v42)
              {
                v49 = v42;
              }
              else
              {
                _CDPLogSystem();
                v52 = objc_claimAutoreleasedReturnValue();
                v53 = os_log_type_enabled(v52, OS_LOG_TYPE_ERROR);
                if (v15)
                {
                  if (v53)
                    -[CDPDCircleController _joinCircleIgnoringBackups:context:completion:].cold.4();
                }
                else if (v53)
                {
                  -[CDPDCircleController _joinCircleIgnoringBackups:context:completion:].cold.3();
                }

                _CDPStateError();
                v49 = (id)objc_claimAutoreleasedReturnValue();
              }
              v54 = v49;
              ((void (**)(id, CDPDCircleJoinResult *, id))v9)[2](v9, 0, v49);

              goto LABEL_54;
            }
            if (v47)
              -[CDPDCircleController _joinCircleIgnoringBackups:context:completion:].cold.2();

            -[CDPDCircleController _joinCircleFallbackWithResult:ignoreBackups:completion:](self, "_joinCircleFallbackWithResult:ignoreBackups:completion:", v19, v56, v9);
          }
LABEL_53:
          v18 = v57;
LABEL_54:

          goto LABEL_11;
        }
LABEL_44:
        v42 = 0;
        goto LABEL_45;
      }
    }
    objc_msgSend(v10, "custodianRecoveryInfo");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = v38 != 0;

    v40 = 1;
    if (v15)
      goto LABEL_38;
    goto LABEL_44;
  }
  if (v17 != 5)
  {
    v18 = v57;
    _CDPStateErrorWithUnderlying();
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(id, CDPDCircleJoinResult *, void *))v9)[2](v9, 0, v44);
LABEL_42:

    goto LABEL_11;
  }
  v18 = v57;
  if (!-[CDPDCircleController canRetryCliqueStatus](self, "canRetryCliqueStatus"))
  {
    _CDPStateError();
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    _CDPStateErrorWithUnderlying();
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(id, CDPDCircleJoinResult *, void *))v9)[2](v9, 0, v45);

    goto LABEL_42;
  }
  v29 = -[CDPDCircleController nextRetryInterval](self, "nextRetryInterval");
  _CDPLogSystem();
  v30 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v29);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    *(_QWORD *)v69 = v31;
    _os_log_impl(&dword_20DB2C000, v30, OS_LOG_TYPE_DEFAULT, "\"scheduling join retry after %@ seconds as security says there is no CK account yet\", buf, 0xCu);

  }
  _CDPSignpostLogSystem();
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = _CDPSignpostCreate();

  _CDPSignpostLogSystem();
  v34 = objc_claimAutoreleasedReturnValue();
  v35 = v34;
  if (v33 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v34))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_20DB2C000, v35, OS_SIGNPOST_INTERVAL_BEGIN, v33, "NoCKAccountBackOffRetry", " enableTelemetry=YES ", buf, 2u);
  }

  _CDPSignpostLogSystem();
  v36 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    *(_QWORD *)v69 = v33;
    _os_log_impl(&dword_20DB2C000, v36, OS_LOG_TYPE_DEFAULT, "BEGIN [%lld]: NoCKAccountBackOffRetry  enableTelemetry=YES ", buf, 0xCu);
  }

  dispatch_time(0, 1000000000 * v29);
  v58 = v9;
  cdp_dispatch_after_with_qos();

LABEL_11:
}

void __70__CDPDCircleController__joinCircleIgnoringBackups_context_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  void (*v8)(void);
  int v9;
  NSObject *v10;
  _BOOL4 v11;
  uint8_t v12[16];

  v5 = a2;
  v6 = a3;
  if ((objc_msgSend(v5, "didJoin") & 1) != 0)
  {
    _CDPLogSystem();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v12 = 0;
      _os_log_impl(&dword_20DB2C000, v7, OS_LOG_TYPE_DEFAULT, "\"Secure channel worked, we joined the circle...\", v12, 2u);
    }

    v8 = *(void (**)(void))(*(_QWORD *)(a1 + 48) + 16);
LABEL_12:
    v8();
    goto LABEL_13;
  }
  v9 = *(unsigned __int8 *)(a1 + 56);
  _CDPLogSystem();
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = os_log_type_enabled(v10, OS_LOG_TYPE_ERROR);
  if (!v9)
  {
    if (v11)
      __70__CDPDCircleController__joinCircleIgnoringBackups_context_completion___block_invoke_cold_1();

    v8 = *(void (**)(void))(*(_QWORD *)(a1 + 48) + 16);
    goto LABEL_12;
  }
  if (v11)
    __70__CDPDCircleController__joinCircleIgnoringBackups_context_completion___block_invoke_cold_2();

  objc_msgSend(*(id *)(a1 + 32), "_joinCircleFallbackWithResult:ignoreBackups:completion:", *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 57), *(_QWORD *)(a1 + 48));
LABEL_13:

}

uint64_t __70__CDPDCircleController__joinCircleIgnoringBackups_context_completion___block_invoke_33(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __70__CDPDCircleController__joinCircleIgnoringBackups_context_completion___block_invoke_34(uint64_t a1)
{
  NSObject *v2;
  uint64_t Nanoseconds;
  NSObject *v4;
  NSObject *v5;
  os_signpost_id_t v6;
  uint64_t v7;
  NSObject *v8;
  uint64_t v9;
  int v11;
  uint64_t v12;
  __int16 v13;
  double v14;
  __int16 v15;
  int v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  _CDPLogSystem();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    __70__CDPDCircleController__joinCircleIgnoringBackups_context_completion___block_invoke_34_cold_1();

  Nanoseconds = _CDPSignpostGetNanoseconds();
  _CDPSignpostLogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  v6 = *(_QWORD *)(a1 + 48);
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    v7 = *(_QWORD *)(a1 + 64);
    v11 = 67240192;
    LODWORD(v12) = v7;
    _os_signpost_emit_with_name_impl(&dword_20DB2C000, v5, OS_SIGNPOST_INTERVAL_END, v6, "NoCKAccountBackOffRetry", " NextRetryInterval=%{public,signpost.telemetry:number1,name=NextRetryInterval}d ", (uint8_t *)&v11, 8u);
  }

  _CDPSignpostLogSystem();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v11 = 134218496;
    v9 = *(_QWORD *)(a1 + 64);
    v12 = *(_QWORD *)(a1 + 48);
    v13 = 2048;
    v14 = (double)(unint64_t)Nanoseconds / 1000000000.0;
    v15 = 1026;
    v16 = v9;
    _os_log_impl(&dword_20DB2C000, v8, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs: NoCKAccountBackOffRetry  NextRetryInterval=%{public,signpost.telemetry:number1,name=NextRetryInterval}d ", (uint8_t *)&v11, 0x1Cu);
  }

  return objc_msgSend(*(id *)(a1 + 32), "_joinCircleIgnoringBackups:context:completion:", *(unsigned __int8 *)(a1 + 72), 0, *(_QWORD *)(a1 + 40));
}

- (void)_joinCircleFallbackWithResult:(id)a3 ignoreBackups:(BOOL)a4 completion:(id)a5
{
  id v8;
  id v9;
  NSObject *v10;
  id WeakRetained;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  CDPDCircleController *v16;
  id v17;
  BOOL v18;
  uint8_t buf[16];

  v8 = a3;
  v9 = a5;
  _CDPLogSystem();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_20DB2C000, v10, OS_LOG_TYPE_DEFAULT, "\"Falling back to recovery based circle flows...\", buf, 2u);
  }

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __79__CDPDCircleController__joinCircleFallbackWithResult_ignoreBackups_completion___block_invoke;
  v14[3] = &unk_24C81CC80;
  v16 = self;
  v17 = v9;
  v18 = a4;
  v15 = v8;
  v12 = v8;
  v13 = v9;
  objc_msgSend(WeakRetained, "circleController:secureBackupRecordsArePresentWithCompletion:", self, v14);

}

void __79__CDPDCircleController__joinCircleFallbackWithResult_ignoreBackups_completion___block_invoke(uint64_t a1, char a2, uint64_t a3, void *a4)
{
  id v7;
  NSObject *v8;
  void (*v9)(void);
  NSObject *v10;
  id WeakRetained;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  _QWORD v17[4];
  id v18;
  void *v19;
  id v20;
  id v21;
  uint8_t buf[16];

  v7 = a4;
  if (v7)
  {
    _CDPLogSystem();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      __79__CDPDCircleController__joinCircleFallbackWithResult_ignoreBackups_completion___block_invoke_cold_1();

    v9 = *(void (**)(void))(*(_QWORD *)(a1 + 48) + 16);
    goto LABEL_10;
  }
  objc_msgSend(*(id *)(a1 + 32), "setHasPeersWithCDPBackupRecords:", a3);
  if (((a2 & 1) != 0 || (_DWORD)a3) && !*(_BYTE *)(a1 + 56) || objc_msgSend(*(id *)(a1 + 32), "circleStatus") == 2)
  {
    objc_msgSend(*(id *)(a1 + 32), "setNeedsBackupRecovery:", 1);
    v9 = *(void (**)(void))(*(_QWORD *)(a1 + 48) + 16);
LABEL_10:
    v9();
    goto LABEL_11;
  }
  _CDPLogSystem();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_20DB2C000, v10, OS_LOG_TYPE_DEFAULT, "\"Circle status is CDPSyncingStatusAbsent and backups are NOT present... Trying to create and join the circle\", buf, 2u);
  }

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 40) + 64));
  objc_msgSend(WeakRetained, "contextForController:", *(_QWORD *)(a1 + 40));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDFC2A0], "analyticsEventWithContext:eventName:category:", v12, *MEMORY[0x24BE1A618], *MEMORY[0x24BE1A860]);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __79__CDPDCircleController__joinCircleFallbackWithResult_ignoreBackups_completion___block_invoke_37;
  v17[3] = &unk_24C81C9E0;
  v15 = *(void **)(a1 + 40);
  v14 = *(void **)(a1 + 48);
  v18 = v13;
  v19 = v15;
  v21 = v14;
  v20 = *(id *)(a1 + 32);
  v16 = v13;
  objc_msgSend(v15, "_requestToJoinAndWaitForSuccessWithHandler:", v17);

LABEL_11:
}

void __79__CDPDCircleController__joinCircleFallbackWithResult_ignoreBackups_completion___block_invoke_37(uint64_t a1, uint64_t a2, void *a3)
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v5, *MEMORY[0x24BE1A640]);

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(*(id *)(a1 + 40), "cliqueStatus"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v6, *MEMORY[0x24BE1A620]);

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", objc_msgSend(*(id *)(a1 + 40), "circleSyncingStatus"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v7, *MEMORY[0x24BE1A610]);

  if (v9)
    objc_msgSend(*(id *)(a1 + 32), "populateUnderlyingErrorsStartingWithRootError:", v9);
  else
    objc_msgSend(*(id *)(a1 + 48), "setDidJoin:", a2);
  objc_msgSend(MEMORY[0x24BE1A3E0], "rtcAnalyticsReporter");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "sendEvent:", *(_QWORD *)(a1 + 32));

  (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
}

- (void)_attemptCustodianBackupRecoveryWithInfo:(id)a3 result:(id)a4 ignoreBackups:(BOOL)a5 completion:(id)a6
{
  id v10;
  id v11;
  CDPDCircleProxy *circleProxy;
  id v13;
  id v14;
  _QWORD v15[5];
  id v16;
  id v17;
  BOOL v18;

  v10 = a4;
  v11 = a6;
  circleProxy = self->_circleProxy;
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __96__CDPDCircleController__attemptCustodianBackupRecoveryWithInfo_result_ignoreBackups_completion___block_invoke;
  v15[3] = &unk_24C81CCA8;
  v15[4] = self;
  v16 = v10;
  v18 = a5;
  v17 = v11;
  v13 = v11;
  v14 = v10;
  -[CDPDCircleProxy recoverOctagonUsingCustodianInfo:completion:](circleProxy, "recoverOctagonUsingCustodianInfo:completion:", a3, v15);

}

void __96__CDPDCircleController__attemptCustodianBackupRecoveryWithInfo_result_ignoreBackups_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  uint8_t v6[16];

  v3 = a2;
  _CDPLogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __96__CDPDCircleController__attemptCustodianBackupRecoveryWithInfo_result_ignoreBackups_completion___block_invoke_cold_1();

    objc_msgSend(*(id *)(a1 + 32), "_joinCircleFallbackWithResult:ignoreBackups:completion:", *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 56), *(_QWORD *)(a1 + 48));
  }
  else
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_20DB2C000, v5, OS_LOG_TYPE_DEFAULT, "\"Custodian CDP Recovery succeeded\", v6, 2u);
    }

    objc_msgSend(*(id *)(a1 + 40), "setDidJoin:", 1);
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }

}

- (BOOL)canRetryCliqueStatus
{
  return self->_cliqueStatusRetryCount < 5;
}

- (int64_t)nextRetryInterval
{
  NSArray *retryIntervals;
  void *v3;
  int64_t v4;

  retryIntervals = self->_retryIntervals;
  ++self->_cliqueStatusRetryCount;
  -[NSArray objectAtIndexedSubscript:](retryIntervals, "objectAtIndexedSubscript:");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "integerValue");

  return v4;
}

- (void)promptForCredentials:(id)a3
{
  id v4;
  id WeakRetained;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  CDPStateUIProviderInternal *uiProvider;
  id v13;
  void *v14;
  void *v15;
  _QWORD v16[4];
  id v17;
  CDPDCircleController *v18;
  id v19;

  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "contextForController:", self);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "password");
  v7 = objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
LABEL_7:
    uiProvider = self->_uiProvider;
    if (uiProvider)
    {
      v13 = objc_loadWeakRetained((id *)&self->_delegate);
      objc_msgSend(v13, "contextForController:", self);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v16[0] = MEMORY[0x24BDAC760];
      v16[1] = 3221225472;
      v16[2] = __45__CDPDCircleController_promptForCredentials___block_invoke;
      v16[3] = &unk_24C81BEA8;
      v17 = v6;
      v18 = self;
      v19 = v4;
      -[CDPStateUIProviderInternal cdpContext:promptForInteractiveAuthenticationWithCompletion:](uiProvider, "cdpContext:promptForInteractiveAuthenticationWithCompletion:", v14, v16);

      goto LABEL_10;
    }
LABEL_9:
    _CDPStateError();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, void *))v4 + 2))(v4, 0, v15);

    goto LABEL_10;
  }
  v8 = (void *)v7;
  objc_msgSend(v6, "appleID");
  v9 = objc_claimAutoreleasedReturnValue();
  if (!v9)
  {

    goto LABEL_7;
  }
  v10 = (void *)v9;
  objc_msgSend(v6, "altDSID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v11)
    goto LABEL_7;
  if (!-[CDPDCircleProxy registerCredentials](self->_circleProxy, "registerCredentials"))
    goto LABEL_9;
  (*((void (**)(id, uint64_t, _QWORD))v4 + 2))(v4, 1, 0);
LABEL_10:

}

void __45__CDPDCircleController_promptForCredentials___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  int v7;
  uint64_t v8;
  NSObject *v9;
  uint64_t v10;
  void *v11;

  v5 = a2;
  v6 = a3;
  if (v5)
  {
    objc_msgSend(*(id *)(a1 + 32), "updateWithAuthenticationResults:", v5);
    v7 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 48), "registerCredentials");
    v8 = *(_QWORD *)(a1 + 48);
    if (v7)
    {
      (*(void (**)(uint64_t, uint64_t, _QWORD))(v8 + 16))(v8, 1, 0);
    }
    else
    {
      _CDPStateError();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, _QWORD, void *))(v8 + 16))(v8, 0, v11);

    }
  }
  else
  {
    _CDPLogSystem();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      __45__CDPDCircleController_promptForCredentials___block_invoke_cold_1();

    v10 = *(_QWORD *)(a1 + 48);
    if (v10)
      (*(void (**)(uint64_t, _QWORD, id))(v10 + 16))(v10, 0, v6);
  }

}

- (void)_silentReauthWithCompletion:(id)a3
{
  id v4;
  id WeakRetained;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "contextForController:", self);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __52__CDPDCircleController__silentReauthWithCompletion___block_invoke;
  v8[3] = &unk_24C81C580;
  v9 = v4;
  v7 = v4;
  objc_msgSend(v6, "reauthenticateUserWithCompletion:", v8);

}

uint64_t __52__CDPDCircleController__silentReauthWithCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)resetCircleIncludingCloudKitData:(BOOL)a3 cloudKitResetReasonDescription:(id)a4 withCompletion:(id)a5
{
  id v6;
  NSObject *v7;
  CDPDCircleProxy *circleProxy;
  id v9;
  uint64_t v10;
  id v11;
  void *v12;
  void (**v13)(_QWORD);
  unint64_t v14;
  NSObject *v15;
  _BOOL4 v16;
  CDPDCircleStateObserver *v17;
  CDPDCircleProxy *v18;
  CDPDCircleStateObserver *v19;
  _QWORD v20[4];
  CDPDCircleStateObserver *v21;
  void (**v22)(_QWORD);
  _QWORD v23[5];
  id v24;
  _QWORD aBlock[4];
  id v26;
  id v27;
  uint8_t buf[16];

  v6 = a5;
  _CDPLogSystem();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_20DB2C000, v7, OS_LOG_TYPE_DEFAULT, "\"Attempting to reset and join new circle after recovery succeeded but resulted in a pending circle join...\", buf, 2u);
  }

  circleProxy = self->_circleProxy;
  v27 = 0;
  -[CDPDCircleProxy removeThisDeviceFromCircle:](circleProxy, "removeThisDeviceFromCircle:", &v27);
  v9 = v27;
  v10 = MEMORY[0x24BDAC760];
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 3221225472;
  aBlock[2] = __103__CDPDCircleController_resetCircleIncludingCloudKitData_cloudKitResetReasonDescription_withCompletion___block_invoke;
  aBlock[3] = &unk_24C81C580;
  v11 = v6;
  v26 = v11;
  v23[0] = v10;
  v23[1] = 3221225472;
  v23[2] = __103__CDPDCircleController_resetCircleIncludingCloudKitData_cloudKitResetReasonDescription_withCompletion___block_invoke_43;
  v23[3] = &unk_24C81C1E8;
  v23[4] = self;
  v12 = _Block_copy(aBlock);
  v24 = v12;
  v13 = (void (**)(_QWORD))_Block_copy(v23);
  v14 = -[CDPDCircleController circleStatus](self, "circleStatus");
  _CDPLogSystem();
  v15 = objc_claimAutoreleasedReturnValue();
  v16 = os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG);
  if (v14 == 3)
  {
    if (v16)
      -[CDPDCircleController resetCircleIncludingCloudKitData:cloudKitResetReasonDescription:withCompletion:].cold.1();

    v17 = objc_alloc_init(CDPDCircleStateObserver);
    v18 = self->_circleProxy;
    v20[0] = v10;
    v20[1] = 3221225472;
    v20[2] = __103__CDPDCircleController_resetCircleIncludingCloudKitData_cloudKitResetReasonDescription_withCompletion___block_invoke_45;
    v20[3] = &unk_24C81CCF8;
    v21 = v17;
    v22 = v13;
    v19 = v17;
    -[CDPDCircleStateObserver observeCircleStateWithCircleProxy:changeHandler:](v19, "observeCircleStateWithCircleProxy:changeHandler:", v18, v20);

  }
  else
  {
    if (v16)
      -[CDPDCircleController resetCircleIncludingCloudKitData:cloudKitResetReasonDescription:withCompletion:].cold.2();

    v13[2](v13);
  }

}

void __103__CDPDCircleController_resetCircleIncludingCloudKitData_cloudKitResetReasonDescription_withCompletion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  _DWORD v8[2];
  __int16 v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  _CDPLogSystem();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v8[0] = 67109378;
    v8[1] = a2;
    v9 = 2114;
    v10 = v5;
    _os_log_impl(&dword_20DB2C000, v6, OS_LOG_TYPE_DEFAULT, "\"Circle reset completed with success: %{BOOL}d, error: %{public}@\", (uint8_t *)v8, 0x12u);
  }

  v7 = *(_QWORD *)(a1 + 32);
  if (v7)
    (*(void (**)(uint64_t, uint64_t, id))(v7 + 16))(v7, a2, v5);

}

void __103__CDPDCircleController_resetCircleIncludingCloudKitData_cloudKitResetReasonDescription_withCompletion___block_invoke_43(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  id v5;
  void (*v6)(void);
  NSObject *v7;
  void *v8;
  _QWORD v9[4];
  id v10;
  id v11;
  id v12;
  id v13;
  uint8_t buf[16];

  _CDPLogSystem();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_20DB2C000, v2, OS_LOG_TYPE_DEFAULT, "\"Resetting circle after join attempt following recovery resulted in pending...\", buf, 2u);
  }

  v3 = *(void **)(*(_QWORD *)(a1 + 32) + 48);
  v13 = 0;
  objc_msgSend(v3, "requestToResetProtectedData:", &v13);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v13;

  if (v4)
  {
    v6 = *(void (**)(void))(*(_QWORD *)(a1 + 40) + 16);
LABEL_10:
    v6();
    goto LABEL_11;
  }
  if (!objc_msgSend(v5, "cdp_isCDPErrorWithCode:", -5109))
  {
    v6 = *(void (**)(void))(*(_QWORD *)(a1 + 40) + 16);
    goto LABEL_10;
  }
  _CDPLogSystem();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    __103__CDPDCircleController_resetCircleIncludingCloudKitData_cloudKitResetReasonDescription_withCompletion___block_invoke_43_cold_1();

  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __103__CDPDCircleController_resetCircleIncludingCloudKitData_cloudKitResetReasonDescription_withCompletion___block_invoke_44;
  v9[3] = &unk_24C81CCD0;
  v8 = *(void **)(a1 + 40);
  v10 = *(id *)(a1 + 32);
  v12 = v8;
  v11 = v5;
  objc_msgSend(v10, "_silentReauthWithCompletion:", v9);

LABEL_11:
}

void __103__CDPDCircleController_resetCircleIncludingCloudKitData_cloudKitResetReasonDescription_withCompletion___block_invoke_44(uint64_t a1, int a2)
{
  void *v3;
  void *v4;
  id v5;
  id v6;

  if (a2)
  {
    v3 = *(void **)(*(_QWORD *)(a1 + 32) + 48);
    v6 = 0;
    objc_msgSend(v3, "requestToResetProtectedData:", &v6);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v6;

    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
}

uint64_t __103__CDPDCircleController_resetCircleIncludingCloudKitData_cloudKitResetReasonDescription_withCompletion___block_invoke_45(uint64_t result, uint64_t a2)
{
  uint64_t v2;
  NSObject *v3;

  if (a2 != 3)
  {
    v2 = result;
    _CDPLogSystem();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
      __103__CDPDCircleController_resetCircleIncludingCloudKitData_cloudKitResetReasonDescription_withCompletion___block_invoke_45_cold_1();

    (*(void (**)(void))(*(_QWORD *)(v2 + 40) + 16))();
    return objc_msgSend(*(id *)(v2 + 32), "stopObservingCircleStatusChange");
  }
  return result;
}

- (void)useCircleInfoToUpdateNameForDevices:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  __int128 v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  uint8_t buf[4];
  void *v23;
  __int16 v24;
  void *v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[CDPDCircleController _peerDeviceNamesByPeerID](self, "_peerDeviceNamesByPeerID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
  if (v7)
  {
    v9 = v7;
    v10 = *(_QWORD *)v19;
    *(_QWORD *)&v8 = 138412546;
    v17 = v8;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v19 != v10)
          objc_enumerationMutation(v6);
        v12 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
        objc_msgSend(v12, "recordID", v17, (_QWORD)v18);
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        if (v13)
        {
          objc_msgSend(v12, "recordID");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "objectForKey:", v14);
          v15 = (void *)objc_claimAutoreleasedReturnValue();

          if (v15)
          {
            _CDPLogSystem();
            v16 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = v17;
              v23 = v12;
              v24 = 2112;
              v25 = v15;
              _os_log_debug_impl(&dword_20DB2C000, v16, OS_LOG_TYPE_DEBUG, "\"Updating device name for %@ to '%@' based on circle info\", buf, 0x16u);
            }

            objc_msgSend(v12, "setLocalizedName:", v15);
          }

        }
      }
      v9 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
    }
    while (v9);
  }

}

- (id)_peerDeviceNamesByPeerID
{
  return (id)-[CDPDCircleProxy peerDeviceNamesByPeerID](self->_circleProxy, "peerDeviceNamesByPeerID");
}

- (void)applyToJoinCircleWithJoinHandler:(id)a3
{
  CDPDCircleStateObserver *v4;
  CDPDCircleStateObserver *circleJoinObserver;
  id v6;

  v6 = a3;
  v4 = objc_alloc_init(CDPDCircleStateObserver);
  circleJoinObserver = self->_circleJoinObserver;
  self->_circleJoinObserver = v4;

  -[CDPDCircleController _requestToJoinWithObserver:completion:](self, "_requestToJoinWithObserver:completion:", self->_circleJoinObserver, v6);
}

- (void)_requestToJoinWithObserver:(id)a3 completion:(id)a4
{
  _QWORD v4[5];

  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __62__CDPDCircleController__requestToJoinWithObserver_completion___block_invoke;
  v4[3] = &unk_24C81CD20;
  v4[4] = self;
  -[CDPDCircleController _requestCircleJoinWithObserver:requestBlock:completion:](self, "_requestCircleJoinWithObserver:requestBlock:completion:", a3, v4, a4);
}

uint64_t __62__CDPDCircleController__requestToJoinWithObserver_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "requestToJoinCircle:", a2);
}

- (void)_requestToJoinAndWaitForSuccessWithHandler:(id)a3
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __67__CDPDCircleController__requestToJoinAndWaitForSuccessWithHandler___block_invoke;
  v3[3] = &unk_24C81CD20;
  v3[4] = self;
  -[CDPDCircleController _requestToJoinWithRequestBlock:completion:](self, "_requestToJoinWithRequestBlock:completion:", v3, a3);
}

uint64_t __67__CDPDCircleController__requestToJoinAndWaitForSuccessWithHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "requestToJoinCircle:", a2);
}

- (void)_requestToJoinAfterRestoreAndWaitForSuccessWithHandler:(id)a3
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __79__CDPDCircleController__requestToJoinAfterRestoreAndWaitForSuccessWithHandler___block_invoke;
  v3[3] = &unk_24C81CD20;
  v3[4] = self;
  -[CDPDCircleController _requestToJoinWithRequestBlock:completion:](self, "_requestToJoinWithRequestBlock:completion:", v3, a3);
}

uint64_t __79__CDPDCircleController__requestToJoinAfterRestoreAndWaitForSuccessWithHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "requestToJoinCircleAfterRestore:", a2);
}

- (void)_requestToJoinWithRequestBlock:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  CDPDCircleStateObserver *v8;

  v6 = a4;
  v7 = a3;
  v8 = objc_alloc_init(CDPDCircleStateObserver);
  -[CDPDCircleController _requestCircleJoinWithObserver:requestBlock:completion:](self, "_requestCircleJoinWithObserver:requestBlock:completion:", v8, v7, v6);

}

- (void)_requestCircleJoinWithObserver:(id)a3 requestBlock:(id)a4 completion:(id)a5
{
  id v8;
  uint64_t (**v9)(id, id *);
  void (**v10)(id, uint64_t, _QWORD);
  NSObject *v11;
  NSObject *v12;
  uint64_t v13;
  id v14;
  void *v15;
  CDPDCircleProxy *circleProxy;
  id v17;
  id v18;
  id v19;
  _QWORD v20[4];
  id v21;
  _QWORD aBlock[5];
  id v23;
  void (**v24)(id, uint64_t, _QWORD);
  uint8_t *v25;
  uint8_t buf[8];
  uint8_t *v27;
  uint64_t v28;
  char v29;

  v8 = a3;
  v9 = (uint64_t (**)(id, id *))a4;
  v10 = (void (**)(id, uint64_t, _QWORD))a5;
  _CDPLogSystem();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_20DB2C000, v11, OS_LOG_TYPE_DEFAULT, "\"Requesting to join circle with handler\", buf, 2u);
  }

  if (-[CDPDCircleController circleStatus](self, "circleStatus") == 1)
  {
    _CDPLogSystem();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      -[CDPDCircleController _requestCircleJoinWithObserver:requestBlock:completion:].cold.1();

    if (v10)
      v10[2](v10, 1, 0);
  }
  else
  {
    *(_QWORD *)buf = 0;
    v27 = buf;
    v28 = 0x2020000000;
    v29 = 0;
    v13 = MEMORY[0x24BDAC760];
    aBlock[0] = MEMORY[0x24BDAC760];
    aBlock[1] = 3221225472;
    aBlock[2] = __79__CDPDCircleController__requestCircleJoinWithObserver_requestBlock_completion___block_invoke;
    aBlock[3] = &unk_24C81CD70;
    aBlock[4] = self;
    v25 = buf;
    v14 = v8;
    v23 = v14;
    v24 = v10;
    v15 = _Block_copy(aBlock);
    circleProxy = self->_circleProxy;
    v20[0] = v13;
    v20[1] = 3221225472;
    v20[2] = __79__CDPDCircleController__requestCircleJoinWithObserver_requestBlock_completion___block_invoke_47;
    v20[3] = &unk_24C81C170;
    v17 = v15;
    v21 = v17;
    objc_msgSend(v14, "observeChangeToState:circleProxy:handler:", 1, circleProxy, v20);
    v19 = 0;
    LOBYTE(circleProxy) = v9[2](v9, &v19);
    v18 = v19;
    if ((circleProxy & 1) == 0)
      (*((void (**)(id, _QWORD, id))v17 + 2))(v17, 0, v18);

    _Block_object_dispose(buf, 8);
  }

}

void __79__CDPDCircleController__requestCircleJoinWithObserver_requestBlock_completion___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5;
  void *v6;
  NSObject *v7;
  id v8;
  _QWORD block[4];
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  char v14;

  v5 = a3;
  block[0] = MEMORY[0x24BDAC760];
  block[2] = __79__CDPDCircleController__requestCircleJoinWithObserver_requestBlock_completion___block_invoke_2;
  block[3] = &unk_24C81CD48;
  v13 = *(_QWORD *)(a1 + 56);
  v6 = *(void **)(a1 + 40);
  v7 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 16);
  block[1] = 3221225472;
  v14 = a2;
  v10 = v6;
  v11 = v5;
  v12 = *(id *)(a1 + 48);
  v8 = v5;
  dispatch_sync(v7, block);

}

uint64_t __79__CDPDCircleController__requestCircleJoinWithObserver_requestBlock_completion___block_invoke_2(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;
  int v3;
  NSObject *v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint8_t v12[16];

  v1 = *(_QWORD *)(*(_QWORD *)(result + 56) + 8);
  if (!*(_BYTE *)(v1 + 24))
  {
    v2 = result;
    *(_BYTE *)(v1 + 24) = 1;
    objc_msgSend(*(id *)(result + 32), "stopObservingCircleStatusChange");
    v3 = *(unsigned __int8 *)(v2 + 64);
    _CDPLogSystem();
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = v4;
    if (v3)
    {
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v12 = 0;
        _os_log_impl(&dword_20DB2C000, v5, OS_LOG_TYPE_DEFAULT, "\"Successfully joined the circle\", v12, 2u);
      }
    }
    else if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      __79__CDPDCircleController__requestCircleJoinWithObserver_requestBlock_completion___block_invoke_2_cold_1(v2, v5, v6, v7, v8, v9, v10, v11);
    }

    result = *(_QWORD *)(v2 + 48);
    if (result)
      return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD))(result + 16))(result, *(unsigned __int8 *)(v2 + 64), *(_QWORD *)(v2 + 40));
  }
  return result;
}

uint64_t __79__CDPDCircleController__requestCircleJoinWithObserver_requestBlock_completion___block_invoke_47(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)cancelApplicationToJoinCircle
{
  CDPDCircleStateObserver *circleJoinObserver;

  -[CDPDCircleStateObserver stopObservingCircleStatusChange](self->_circleJoinObserver, "stopObservingCircleStatusChange");
  circleJoinObserver = self->_circleJoinObserver;
  self->_circleJoinObserver = 0;

}

- (CDPDCircleProxy)circleProxy
{
  return self->_circleProxy;
}

- (void)setCircleProxy:(id)a3
{
  objc_storeStrong((id *)&self->_circleProxy, a3);
}

- (CDPStateUIProviderInternal)uiProvider
{
  return self->_uiProvider;
}

- (void)setUiProvider:(id)a3
{
  objc_storeStrong((id *)&self->_uiProvider, a3);
}

- (CDPDCircleDelegate)delegate
{
  return (CDPDCircleDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (CDPDOctagonTrustProxy)octagonProxy
{
  return self->_octagonProxy;
}

- (void)setOctagonProxy:(id)a3
{
  objc_storeStrong((id *)&self->_octagonProxy, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_octagonProxy, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_uiProvider, 0);
  objc_storeStrong((id *)&self->_circleProxy, 0);
  objc_storeStrong((id *)&self->_cdpdCircleDefaultQueue, 0);
  objc_storeStrong((id *)&self->_retryIntervals, 0);
  objc_storeStrong((id *)&self->_requestSynchronizationQueue, 0);
  objc_storeStrong((id *)&self->_circleJoinObserver, 0);
}

- (void)_joinCircleIgnoringBackups:context:completion:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_20DB2C000, v0, v1, "\"Failed to initialized secure channel with error: %@, Custodian keys available attempting recovery\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)_joinCircleIgnoringBackups:context:completion:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_20DB2C000, v0, v1, "\"Failed to initialized secure channel with error: %@, starting to fall back...\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)_joinCircleIgnoringBackups:context:completion:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_0_1(&dword_20DB2C000, v0, v1, "\"No secure channel\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4_0();
}

- (void)_joinCircleIgnoringBackups:context:completion:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_0_1(&dword_20DB2C000, v0, v1, "\"No explicit error, falling back to CDPStateErrorCouldNotApplyToJoinCircleNoFallback\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4_0();
}

- (void)_joinCircleIgnoringBackups:context:completion:.cold.5()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_20DB2C000, v0, v1, "\"Failed to initialized secure channel, no fallback. %@\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)_joinCircleIgnoringBackups:context:completion:.cold.6()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_3(&dword_20DB2C000, v0, v1, "\"Circle join requested, but we are already in circle!\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4_0();
}

void __70__CDPDCircleController__joinCircleIgnoringBackups_context_completion___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_20DB2C000, v0, v1, "\"Failed to resume session, no fallback. %@\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

void __70__CDPDCircleController__joinCircleIgnoringBackups_context_completion___block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_20DB2C000, v0, v1, "\"Failed to resume session: %@, start to fall back...\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

void __70__CDPDCircleController__joinCircleIgnoringBackups_context_completion___block_invoke_34_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_3(&dword_20DB2C000, v0, v1, "\"Retrying circle join now!\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4_0();
}

void __79__CDPDCircleController__joinCircleFallbackWithResult_ignoreBackups_completion___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_20DB2C000, v0, v1, "\"Can't join circle, failed to check for presence of secure backup records: %{public}@\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

void __96__CDPDCircleController__attemptCustodianBackupRecoveryWithInfo_result_ignoreBackups_completion___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_20DB2C000, v0, v1, "\"Custodian CDP Recovery failed with error: %@\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

void __45__CDPDCircleController_promptForCredentials___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_20DB2C000, v0, v1, "\"UI provider failed to perform interactive authentication for repair. Error: %@\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)resetCircleIncludingCloudKitData:cloudKitResetReasonDescription:withCompletion:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_3(&dword_20DB2C000, v0, v1, "\"Pending application state was not resolved immediately after calling remove... waiting to see state != Pending\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4_0();
}

- (void)resetCircleIncludingCloudKitData:cloudKitResetReasonDescription:withCompletion:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_3(&dword_20DB2C000, v0, v1, "\"Pending application state was resolved immediately after calling remove\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4_0();
}

void __103__CDPDCircleController_resetCircleIncludingCloudKitData_cloudKitResetReasonDescription_withCompletion___block_invoke_43_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_20DB2C000, v0, v1, "\"Attempt 1 - Failed to reset due to auth error, will retry: %@\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

void __103__CDPDCircleController_resetCircleIncludingCloudKitData_cloudKitResetReasonDescription_withCompletion___block_invoke_45_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_3(&dword_20DB2C000, v0, v1, "\"Pending application state was resolved!\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4_0();
}

- (void)_requestCircleJoinWithObserver:requestBlock:completion:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_3(&dword_20DB2C000, v0, v1, "\"Request made, but we were already in circle, completing...\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4_0();
}

void __79__CDPDCircleController__requestCircleJoinWithObserver_requestBlock_completion___block_invoke_2_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_20DB2C000, a2, a3, "\"Failed to apply to circle: %@\", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_4();
}

@end
