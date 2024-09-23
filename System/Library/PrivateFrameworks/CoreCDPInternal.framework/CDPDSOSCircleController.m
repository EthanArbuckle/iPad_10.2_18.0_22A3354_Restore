@implementation CDPDSOSCircleController

- (CDPDSOSCircleController)initWithUiProvider:(id)a3 delegate:(id)a4 circleProxy:(id)a5 octagonTrustProxy:(id)a6
{
  id v10;
  id v11;
  id v12;
  CDPDSOSCircleController *v13;
  CDPDSOSCircleController *v14;
  NSObject *v15;
  dispatch_queue_t v16;
  OS_dispatch_queue *requestSynchronizationQueue;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = -[CDPDSOSCircleController init](self, "init");
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_uiProvider, a3);
    objc_storeWeak((id *)&v14->_delegate, v11);
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = dispatch_queue_create("com.apple.cdpd.circleRequestQueue", v15);
    requestSynchronizationQueue = v14->_requestSynchronizationQueue;
    v14->_requestSynchronizationQueue = (OS_dispatch_queue *)v16;

    objc_storeStrong((id *)&v14->_circleProxy, a5);
  }

  return v14;
}

- (void)dealloc
{
  objc_super v3;

  -[CDPDCircleStateObserver stopObservingCircleStatusChange](self->_circleJoinObserver, "stopObservingCircleStatusChange");
  v3.receiver = self;
  v3.super_class = (Class)CDPDSOSCircleController;
  -[CDPDSOSCircleController dealloc](&v3, sel_dealloc);
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
  unint64_t v2;
  NSObject *v3;
  NSObject *v4;
  int v5;
  uint64_t v6;
  NSObject *v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint8_t v15[16];
  uint8_t buf[24];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v2 = -[CDPDSOSCircleController circleStatus](self, "circleStatus");
  _CDPLogSystem();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    *(_QWORD *)&buf[4] = v2;
    _os_log_impl(&dword_20DB2C000, v3, OS_LOG_TYPE_DEFAULT, "\"Circle status before attempting recovery is %lu\", buf, 0xCu);
  }

  if (v2 == 3)
  {
    *(_QWORD *)buf = 0;
    _CDPLogSystem();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v15 = 0;
      _os_log_impl(&dword_20DB2C000, v4, OS_LOG_TYPE_DEFAULT, "\"Attempting to reset to offering in SOS\", v15, 2u);
    }

    v5 = SOSCCResetToOffering();
    v6 = *(_QWORD *)buf;
    _CDPLogSystem();
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (!v5 || v6)
    {
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        -[CDPDCircleController prepareCircleStateForRecovery].cold.1((uint64_t)buf, v8, v9, v10, v11, v12, v13, v14);
    }
    else if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v15 = 0;
      _os_log_impl(&dword_20DB2C000, v8, OS_LOG_TYPE_DEFAULT, "\"Successfully reset SOS circle to offering\", v15, 2u);
    }

  }
}

- (void)joinCircleWithCompletion:(id)a3
{
  -[CDPDSOSCircleController joinCircleIgnoringBackups:completion:](self, "joinCircleIgnoringBackups:completion:", 0, a3);
}

- (void)_joinCircleIgnoringBackups:(BOOL)a3 completion:(id)a4
{
  id v6;
  NSObject *v7;
  unint64_t v8;
  CDPDCircleJoinResult *v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  NSObject *v18;
  NSObject *v19;
  NSObject *v20;
  id WeakRetained;
  void *v22;
  _QWORD v23[4];
  CDPDCircleJoinResult *v24;
  CDPDSOSCircleController *v25;
  id v26;
  unint64_t v27;
  BOOL v28;
  uint8_t buf[16];
  os_activity_scope_state_s state;

  v6 = a4;
  v7 = _os_activity_create(&dword_20DB2C000, "cdp: circle join", MEMORY[0x24BDACB08], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v7, &state);
  v8 = -[CDPDSOSCircleController circleStatus](self, "circleStatus");
  v9 = objc_alloc_init(CDPDCircleJoinResult);
  -[CDPDCircleJoinResult setCircleStatus:](v9, "setCircleStatus:", v8);
  -[CDPDCircleJoinResult setRequiresEscrowRecordsFetch:](v9, "setRequiresEscrowRecordsFetch:", 1);
  -[CDPDCircleJoinResult setRequiresInitialSync:](v9, "setRequiresInitialSync:", 1);
  if (v8 == 1)
  {
    _CDPLogSystem();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      -[CDPDSOSCircleController _joinCircleIgnoringBackups:completion:].cold.1(v10, v11, v12, v13, v14, v15, v16, v17);

    -[CDPDCircleJoinResult setDidJoin:](v9, "setDidJoin:", 1);
    goto LABEL_5;
  }
  if (-[CDPDSOSCircleController _peerCount](self, "_peerCount"))
  {
    _CDPLogSystem();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_20DB2C000, v18, OS_LOG_TYPE_DEFAULT, "\"Circle has peers for remote approval\", buf, 2u);
    }

    -[CDPDCircleJoinResult setHasPeersForRemoteApproval:](v9, "setHasPeersForRemoteApproval:", 1);
  }
  else
  {
    _CDPLogSystem();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_20DB2C000, v19, OS_LOG_TYPE_DEFAULT, "\"Circle does NOT have peers for remote approval\", buf, 2u);
    }

  }
  if (v8 == 2 || v8 == 4)
  {
    _CDPLogSystem();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_20DB2C000, v20, OS_LOG_TYPE_DEFAULT, "\"Falling back to recovery based circle flows...\", buf, 2u);
    }

    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    v23[0] = MEMORY[0x24BDAC760];
    v23[1] = 3221225472;
    v23[2] = __65__CDPDSOSCircleController__joinCircleIgnoringBackups_completion___block_invoke;
    v23[3] = &unk_24C81D528;
    v26 = v6;
    v28 = a3;
    v27 = v8;
    v24 = v9;
    v25 = self;
    objc_msgSend(WeakRetained, "circleController:secureBackupRecordsArePresentWithCompletion:", self, v23);

    v22 = v26;
    goto LABEL_21;
  }
  if (v8 != 3)
  {
    _CDPStateError();
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, void *))v6 + 2))(v6, 0, v22);
LABEL_21:

    goto LABEL_22;
  }
  -[CDPDCircleJoinResult setNeedsBackupRecovery:](v9, "setNeedsBackupRecovery:", 1);
LABEL_5:
  (*((void (**)(id, CDPDCircleJoinResult *, _QWORD))v6 + 2))(v6, v9, 0);
LABEL_22:

  os_activity_scope_leave(&state);
}

void __65__CDPDSOSCircleController__joinCircleIgnoringBackups_completion___block_invoke(uint64_t a1, char a2, uint64_t a3, void *a4)
{
  id v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(void);
  NSObject *v16;
  void *v17;
  _QWORD v18[4];
  id v19;
  id v20;
  uint8_t buf[16];

  v7 = a4;
  if (v7)
  {
    _CDPLogSystem();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      __65__CDPDSOSCircleController__joinCircleIgnoringBackups_completion___block_invoke_cold_1((uint64_t)v7, v8, v9, v10, v11, v12, v13, v14);

    v15 = *(void (**)(void))(*(_QWORD *)(a1 + 48) + 16);
    goto LABEL_10;
  }
  objc_msgSend(*(id *)(a1 + 32), "setHasPeersWithCDPBackupRecords:", a3);
  if (((a2 & 1) != 0 || (_DWORD)a3) && !*(_BYTE *)(a1 + 64) || *(_QWORD *)(a1 + 56) == 1)
  {
    objc_msgSend(*(id *)(a1 + 32), "setNeedsBackupRecovery:", 1);
    v15 = *(void (**)(void))(*(_QWORD *)(a1 + 48) + 16);
LABEL_10:
    v15();
    goto LABEL_11;
  }
  _CDPLogSystem();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_20DB2C000, v16, OS_LOG_TYPE_DEFAULT, "\"Circle status is CDPSyncingStatusAbsent and backups are NOT present... Trying to create and join the circle\", buf, 2u);
  }

  v18[0] = MEMORY[0x24BDAC760];
  v18[1] = 3221225472;
  v18[2] = __65__CDPDSOSCircleController__joinCircleIgnoringBackups_completion___block_invoke_12;
  v18[3] = &unk_24C81CF50;
  v17 = *(void **)(a1 + 40);
  v20 = *(id *)(a1 + 48);
  v19 = *(id *)(a1 + 32);
  objc_msgSend(v17, "_requestToJoinAndWaitForSuccessWithHandler:", v18);

LABEL_11:
}

uint64_t __65__CDPDSOSCircleController__joinCircleIgnoringBackups_completion___block_invoke_12(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t (*v4)(void);

  if (a3)
  {
    v4 = *(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "setDidJoin:", a2);
    v4 = *(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16);
  }
  return v4();
}

- (unint64_t)_peerCount
{
  return -[CDPDCircleProxy peerCount](self->_circleProxy, "peerCount");
}

- (void)joinCircleAfterRecoveryWithCompletion:(id)a3
{
  void (**v4)(id, _QWORD, id);
  CDPDCircleProxy *circleProxy;
  int v6;
  id v7;
  NSObject *v8;
  NSObject *v9;
  unint64_t v10;
  NSObject *v11;
  id v12;
  void *v13;
  void *v14;
  CDPDCircleStateObserver *v15;
  id v16;
  CDPDCircleProxy *v17;
  int v18;
  NSObject *v19;
  NSObject *v20;
  _BOOL4 v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  CDPDCircleProxy *v29;
  CDPDCircleStateObserver *v30;
  CDPDCircleProxy *v31;
  _BOOL4 v32;
  CDPDCircleProxy *v33;
  int v34;
  _BOOL4 v35;
  NSObject *v36;
  uint32_t v37;
  _QWORD v38[4];
  CDPDCircleStateObserver *v39;
  CDPDSOSCircleController *v40;
  void (**v41)(id, _QWORD, id);
  unint64_t v42;
  id v43;
  id v44;
  id v45;
  id v46;
  id v47;
  uint8_t buf[4];
  unint64_t v49;
  uint64_t v50;

  v50 = *MEMORY[0x24BDAC8D0];
  v4 = (void (**)(id, _QWORD, id))a3;
  circleProxy = self->_circleProxy;
  v47 = 0;
  v6 = -[CDPDCircleProxy requestToJoinCircleAfterRestore:](circleProxy, "requestToJoinCircleAfterRestore:", &v47);
  v7 = v47;
  _CDPLogSystem();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v6)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_20DB2C000, v9, OS_LOG_TYPE_DEFAULT, "\"Circle join request succeeded after backup recovery\", buf, 2u);
    }

    v10 = -[CDPDSOSCircleController circleStatus](self, "circleStatus");
    _CDPLogSystem();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      v49 = v10;
      _os_log_impl(&dword_20DB2C000, v11, OS_LOG_TYPE_DEFAULT, "\"Circle status after successful request to join is %lu\", buf, 0xCu);
    }

    if (v10 == 3)
    {
      v29 = self->_circleProxy;
      v43 = 0;
      -[CDPDCircleProxy resetToOffering:](v29, "resetToOffering:", &v43);
      v15 = (CDPDCircleStateObserver *)v43;
      if (v4)
        v4[2](v4, 0, v15);
      goto LABEL_38;
    }
    if (v10 != 1)
    {
      v30 = objc_alloc_init(CDPDCircleStateObserver);
      v31 = self->_circleProxy;
      v38[0] = MEMORY[0x24BDAC760];
      v38[1] = 3221225472;
      v38[2] = __65__CDPDSOSCircleController_joinCircleAfterRecoveryWithCompletion___block_invoke;
      v38[3] = &unk_24C81D550;
      v39 = v30;
      v40 = self;
      v41 = v4;
      v42 = v10;
      v15 = v30;
      -[CDPDCircleStateObserver observeCircleStateWithCircleProxy:changeHandler:](v15, "observeCircleStateWithCircleProxy:changeHandler:", v31, v38);

LABEL_38:
      goto LABEL_39;
    }
    v12 = objc_alloc(MEMORY[0x24BDE84B0]);
    -[CDPDCircleProxy cdpContext](self->_circleProxy, "cdpContext");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "cliqueConfiguration");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (CDPDCircleStateObserver *)objc_msgSend(v12, "initWithContextData:", v14);

    v46 = 0;
    LODWORD(v14) = -[CDPDCircleStateObserver fetchUserControllableViewsSyncingEnabled:](v15, "fetchUserControllableViewsSyncingEnabled:", &v46);
    v16 = v46;
    if ((_DWORD)v14)
    {
      v17 = self->_circleProxy;
      v45 = 0;
      v18 = -[CDPDCircleProxy setUserControllableViewsSyncStatus:error:](v17, "setUserControllableViewsSyncStatus:error:", 1, &v45);
      v19 = v45;
      _CDPLogSystem();
      v20 = objc_claimAutoreleasedReturnValue();
      v21 = os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT);
      if (v18)
      {
        if (v21)
        {
          *(_WORD *)buf = 0;
          v22 = "\"Successfully enabled SOS views\";
LABEL_29:
          v36 = v20;
          v37 = 2;
LABEL_33:
          _os_log_impl(&dword_20DB2C000, v36, OS_LOG_TYPE_DEFAULT, v22, buf, v37);
          goto LABEL_34;
        }
        goto LABEL_34;
      }
      if (!v21)
        goto LABEL_34;
      *(_DWORD *)buf = 138412290;
      v49 = (unint64_t)v19;
      v22 = "\"Failed to enable SOS views: %@\";
    }
    else
    {
      _CDPLogSystem();
      v19 = objc_claimAutoreleasedReturnValue();
      v32 = os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT);
      if (v16)
      {
        if (v32)
        {
          *(_DWORD *)buf = 138412290;
          v49 = (unint64_t)v16;
          _os_log_impl(&dword_20DB2C000, v19, OS_LOG_TYPE_DEFAULT, "\"Failed to fetch user controllable views from clique, error: %@\", buf, 0xCu);
        }
        goto LABEL_35;
      }
      if (v32)
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_20DB2C000, v19, OS_LOG_TYPE_DEFAULT, "\"Octagon reports user controllable views are not enabled! disabling for SOS\", buf, 2u);
      }

      v33 = self->_circleProxy;
      v44 = 0;
      v34 = -[CDPDCircleProxy setUserControllableViewsSyncStatus:error:](v33, "setUserControllableViewsSyncStatus:error:", 0, &v44);
      v19 = v44;
      _CDPLogSystem();
      v20 = objc_claimAutoreleasedReturnValue();
      v35 = os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT);
      if (v34)
      {
        if (v35)
        {
          *(_WORD *)buf = 0;
          v22 = "\"Successfully disabled SOS views\";
          goto LABEL_29;
        }
LABEL_34:

LABEL_35:
        if (v4)
          v4[2](v4, 1, 0);

        goto LABEL_38;
      }
      if (!v35)
        goto LABEL_34;
      *(_DWORD *)buf = 138412290;
      v49 = (unint64_t)v19;
      v22 = "\"Failed to disable SOS views: %@\";
    }
    v36 = v20;
    v37 = 12;
    goto LABEL_33;
  }
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    -[CDPDSOSCircleController joinCircleAfterRecoveryWithCompletion:].cold.1((uint64_t)v7, v9, v23, v24, v25, v26, v27, v28);

  if (v4)
    v4[2](v4, 0, v7);
LABEL_39:

}

void __65__CDPDSOSCircleController_joinCircleAfterRecoveryWithCompletion___block_invoke(uint64_t a1, uint64_t a2)
{
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  NSObject *v13;
  uint64_t v14;
  id v15;

  if (a2 == 3)
  {
    v12 = *(void **)(*(_QWORD *)(a1 + 40) + 24);
    v15 = 0;
    objc_msgSend(v12, "resetToOffering:", &v15);
    v13 = v15;
    v14 = *(_QWORD *)(a1 + 48);
    if (v14)
      (*(void (**)(uint64_t, _QWORD, NSObject *))(v14 + 16))(v14, 0, v13);
    goto LABEL_11;
  }
  if (a2 != 1)
  {
    _CDPLogSystem();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      __65__CDPDSOSCircleController_joinCircleAfterRecoveryWithCompletion___block_invoke_cold_1(a1, v13);
LABEL_11:

    return;
  }
  _CDPLogSystem();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    __65__CDPDSOSCircleController_joinCircleAfterRecoveryWithCompletion___block_invoke_cold_2(v3, v4, v5, v6, v7, v8, v9, v10);

  objc_msgSend(*(id *)(a1 + 32), "stopObservingCircleStatusChange");
  v11 = *(_QWORD *)(a1 + 48);
  if (v11)
    (*(void (**)(uint64_t, uint64_t, _QWORD))(v11 + 16))(v11, 1, 0);
}

- (void)resetCircleIncludingCloudKitData:(BOOL)a3 cloudKitResetReasonDescription:(id)a4 withCompletion:(id)a5
{
  id v6;
  id v7;

  if (a5)
  {
    v6 = a5;
    _CDPStateError();
    v7 = (id)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, id))a5 + 2))(v6, 0, v7);

  }
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
  -[CDPDSOSCircleController _peerDeviceNamesByPeerID](self, "_peerDeviceNamesByPeerID");
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

  -[CDPDSOSCircleController _requestToJoinWithObserver:completion:](self, "_requestToJoinWithObserver:completion:", self->_circleJoinObserver, v6);
}

- (void)_requestToJoinWithObserver:(id)a3 completion:(id)a4
{
  _QWORD v4[5];

  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __65__CDPDSOSCircleController__requestToJoinWithObserver_completion___block_invoke;
  v4[3] = &unk_24C81CD20;
  v4[4] = self;
  -[CDPDSOSCircleController _requestCircleJoinWithObserver:requestBlock:completion:](self, "_requestCircleJoinWithObserver:requestBlock:completion:", a3, v4, a4);
}

uint64_t __65__CDPDSOSCircleController__requestToJoinWithObserver_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "requestToJoinCircle:", a2);
}

- (void)_requestToJoinAndWaitForSuccessWithHandler:(id)a3
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __70__CDPDSOSCircleController__requestToJoinAndWaitForSuccessWithHandler___block_invoke;
  v3[3] = &unk_24C81CD20;
  v3[4] = self;
  -[CDPDSOSCircleController _requestToJoinWithRequestBlock:completion:](self, "_requestToJoinWithRequestBlock:completion:", v3, a3);
}

uint64_t __70__CDPDSOSCircleController__requestToJoinAndWaitForSuccessWithHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "requestToJoinCircle:", a2);
}

- (void)_requestToJoinAfterRestoreAndWaitForSuccessWithHandler:(id)a3
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __82__CDPDSOSCircleController__requestToJoinAfterRestoreAndWaitForSuccessWithHandler___block_invoke;
  v3[3] = &unk_24C81CD20;
  v3[4] = self;
  -[CDPDSOSCircleController _requestToJoinWithRequestBlock:completion:](self, "_requestToJoinWithRequestBlock:completion:", v3, a3);
}

uint64_t __82__CDPDSOSCircleController__requestToJoinAfterRestoreAndWaitForSuccessWithHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "requestToJoinCircleAfterRestore:", a2);
}

- (void)_requestToJoinWithRequestBlock:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  CDPDCircleStateObserver *v8;

  v6 = a4;
  v7 = a3;
  v8 = objc_alloc_init(CDPDCircleStateObserver);
  -[CDPDSOSCircleController _requestCircleJoinWithObserver:requestBlock:completion:](self, "_requestCircleJoinWithObserver:requestBlock:completion:", v8, v7, v6);

}

- (void)_requestCircleJoinWithObserver:(id)a3 requestBlock:(id)a4 completion:(id)a5
{
  id v8;
  uint64_t (**v9)(id, id *);
  void (**v10)(id, uint64_t, _QWORD);
  NSObject *v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  id v21;
  void *v22;
  CDPDCircleProxy *circleProxy;
  id v24;
  id v25;
  id v26;
  _QWORD v27[4];
  id v28;
  _QWORD aBlock[5];
  id v30;
  void (**v31)(id, uint64_t, _QWORD);
  uint8_t *v32;
  uint8_t buf[8];
  uint8_t *v34;
  uint64_t v35;
  char v36;

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

  if (-[CDPDSOSCircleController circleStatus](self, "circleStatus") == 1)
  {
    _CDPLogSystem();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      -[CDPDSOSCircleController _requestCircleJoinWithObserver:requestBlock:completion:].cold.1(v12, v13, v14, v15, v16, v17, v18, v19);

    if (v10)
      v10[2](v10, 1, 0);
  }
  else
  {
    *(_QWORD *)buf = 0;
    v34 = buf;
    v35 = 0x2020000000;
    v36 = 0;
    v20 = MEMORY[0x24BDAC760];
    aBlock[0] = MEMORY[0x24BDAC760];
    aBlock[1] = 3221225472;
    aBlock[2] = __82__CDPDSOSCircleController__requestCircleJoinWithObserver_requestBlock_completion___block_invoke;
    aBlock[3] = &unk_24C81CD70;
    aBlock[4] = self;
    v32 = buf;
    v21 = v8;
    v30 = v21;
    v31 = v10;
    v22 = _Block_copy(aBlock);
    circleProxy = self->_circleProxy;
    v27[0] = v20;
    v27[1] = 3221225472;
    v27[2] = __82__CDPDSOSCircleController__requestCircleJoinWithObserver_requestBlock_completion___block_invoke_20;
    v27[3] = &unk_24C81C170;
    v24 = v22;
    v28 = v24;
    objc_msgSend(v21, "observeChangeToState:circleProxy:handler:", 1, circleProxy, v27);
    v26 = 0;
    LOBYTE(circleProxy) = v9[2](v9, &v26);
    v25 = v26;
    if ((circleProxy & 1) == 0)
      (*((void (**)(id, _QWORD, id))v24 + 2))(v24, 0, v25);

    _Block_object_dispose(buf, 8);
  }

}

void __82__CDPDSOSCircleController__requestCircleJoinWithObserver_requestBlock_completion___block_invoke(uint64_t a1, char a2, void *a3)
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
  block[2] = __82__CDPDSOSCircleController__requestCircleJoinWithObserver_requestBlock_completion___block_invoke_2;
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

uint64_t __82__CDPDSOSCircleController__requestCircleJoinWithObserver_requestBlock_completion___block_invoke_2(uint64_t result)
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

uint64_t __82__CDPDSOSCircleController__requestCircleJoinWithObserver_requestBlock_completion___block_invoke_20(uint64_t a1)
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

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_uiProvider, 0);
  objc_storeStrong((id *)&self->_circleProxy, 0);
  objc_storeStrong((id *)&self->_requestSynchronizationQueue, 0);
  objc_storeStrong((id *)&self->_circleJoinObserver, 0);
}

- (void)_joinCircleIgnoringBackups:(uint64_t)a3 completion:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3(&dword_20DB2C000, a1, a3, "\"Circle join requested, but we are already in circle!\", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_4_0();
}

void __65__CDPDSOSCircleController__joinCircleIgnoringBackups_completion___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_20DB2C000, a2, a3, "\"Can't join circle, failed to check for presence of secure backup records: %{public}@\", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_4();
}

- (void)joinCircleAfterRecoveryWithCompletion:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_20DB2C000, a2, a3, "\"Failed to request circle join after restore with error %@\", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_4();
}

void __65__CDPDSOSCircleController_joinCircleAfterRecoveryWithCompletion___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v2;
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v2 = *(_QWORD *)(a1 + 56);
  v3 = 134217984;
  v4 = v2;
  _os_log_debug_impl(&dword_20DB2C000, a2, OS_LOG_TYPE_DEBUG, "\"Circle status is now %lu (waiting for CDPSyncingStatusIn or CDPSyncingStatusPending)\", (uint8_t *)&v3, 0xCu);
  OUTLINED_FUNCTION_4();
}

void __65__CDPDSOSCircleController_joinCircleAfterRecoveryWithCompletion___block_invoke_cold_2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3(&dword_20DB2C000, a1, a3, "\"Circle status changed CDPSyncingStatusIn\", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_4_0();
}

- (void)_requestCircleJoinWithObserver:(uint64_t)a3 requestBlock:(uint64_t)a4 completion:(uint64_t)a5 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3(&dword_20DB2C000, a1, a3, "\"Request made, but we were already in circle, completing...\", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_4_0();
}

@end
