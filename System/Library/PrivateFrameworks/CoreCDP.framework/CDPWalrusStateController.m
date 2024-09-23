@implementation CDPWalrusStateController

- (CDPWalrusStateController)initWithContext:(id)a3
{
  id v4;
  CDPWalrusStateController *v5;
  uint64_t v6;
  CDPContext *context;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CDPWalrusStateController;
  v5 = -[CDPWalrusStateController init](&v9, sel_init);
  if (v5)
  {
    +[CDPContext preflightContext:](CDPContext, "preflightContext:", v4);
    v6 = objc_claimAutoreleasedReturnValue();
    context = v5->_context;
    v5->_context = (CDPContext *)v6;

  }
  return v5;
}

- (void)_startObservingWalrusStateChangeNotification
{
  id v2;

  +[CDPWalrusNotificationHandler sharedInstance](CDPWalrusNotificationHandler, "sharedInstance");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "startObservingWalrusStateChangeNotification");

}

- (void)walrusStatusWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  CDPDaemonConnection *v6;
  uint64_t v7;
  id v8;
  void *v9;
  CDPContext *context;
  id v11;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(uint64_t, uint64_t, void *);
  void *v15;
  id v16;
  _QWORD v17[4];
  id v18;
  os_activity_scope_state_s state;

  v4 = a3;
  v5 = _os_activity_create(&dword_20D7E6000, "Walrus: Fetching status.", MEMORY[0x24BDACB08], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v5, &state);
  v6 = objc_alloc_init(CDPDaemonConnection);
  v7 = MEMORY[0x24BDAC760];
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __55__CDPWalrusStateController_walrusStatusWithCompletion___block_invoke;
  v17[3] = &unk_24C7C10E8;
  v8 = v4;
  v18 = v8;
  -[CDPDaemonConnection daemonWithErrorHandler:](v6, "daemonWithErrorHandler:", v17);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  context = self->_context;
  v12 = v7;
  v13 = 3221225472;
  v14 = __55__CDPWalrusStateController_walrusStatusWithCompletion___block_invoke_16;
  v15 = &unk_24C7C1288;
  v11 = v8;
  v16 = v11;
  objc_msgSend(v9, "walrusStatusWithContext:completion:", context, &v12);
  -[CDPWalrusStateController _startObservingWalrusStateChangeNotification](self, "_startObservingWalrusStateChangeNotification", v12, v13, v14, v15);

  os_activity_scope_leave(&state);
}

void __55__CDPWalrusStateController_walrusStatusWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  _CDPLogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __55__CDPWalrusStateController_walrusStatusWithCompletion___block_invoke_cold_1();

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __55__CDPWalrusStateController_walrusStatusWithCompletion___block_invoke_16(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  NSObject *v5;
  NSObject *v6;

  v4 = a3;
  _CDPLogSystem();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v4)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      __55__CDPWalrusStateController_walrusStatusWithCompletion___block_invoke_16_cold_2();
  }
  else if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    __55__CDPWalrusStateController_walrusStatusWithCompletion___block_invoke_16_cold_1();
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (unint64_t)walrusStatus:(id *)a3
{
  NSObject *v5;
  CDPDaemonConnection *v6;
  uint64_t v7;
  void *v8;
  CDPContext *context;
  unint64_t v10;
  _QWORD v12[6];
  _QWORD v13[5];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t v23;
  os_activity_scope_state_s state;

  v5 = _os_activity_create(&dword_20D7E6000, "Walrus: Fetching status.", MEMORY[0x24BDACB08], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v5, &state);
  v20 = 0;
  v21 = &v20;
  v22 = 0x2020000000;
  v23 = 0;
  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy_;
  v18 = __Block_byref_object_dispose_;
  v19 = 0;
  v6 = objc_alloc_init(CDPDaemonConnection);
  v7 = MEMORY[0x24BDAC760];
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __41__CDPWalrusStateController_walrusStatus___block_invoke;
  v13[3] = &unk_24C7C12B0;
  v13[4] = &v14;
  -[CDPDaemonConnection synchronousDaemonWithErrorHandler:](v6, "synchronousDaemonWithErrorHandler:", v13);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  context = self->_context;
  v12[0] = v7;
  v12[1] = 3221225472;
  v12[2] = __41__CDPWalrusStateController_walrusStatus___block_invoke_18;
  v12[3] = &unk_24C7C12D8;
  v12[4] = &v14;
  v12[5] = &v20;
  objc_msgSend(v8, "walrusStatusWithContext:completion:", context, v12);
  if (a3)
    *a3 = objc_retainAutorelease((id)v15[5]);
  -[CDPWalrusStateController _startObservingWalrusStateChangeNotification](self, "_startObservingWalrusStateChangeNotification");
  v10 = v21[3];

  _Block_object_dispose(&v14, 8);
  _Block_object_dispose(&v20, 8);
  os_activity_scope_leave(&state);

  return v10;
}

void __41__CDPWalrusStateController_walrusStatus___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;

  v3 = a2;
  _CDPLogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __55__CDPWalrusStateController_walrusStatusWithCompletion___block_invoke_cold_1();

  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v3;

}

void __41__CDPWalrusStateController_walrusStatus___block_invoke_18(uint64_t a1, uint64_t a2, void *a3)
{
  id v6;
  NSObject *v7;

  v6 = a3;
  if (v6)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a3);
    _CDPLogSystem();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __41__CDPWalrusStateController_walrusStatus___block_invoke_18_cold_2();
  }
  else
  {
    _CDPLogSystem();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      __55__CDPWalrusStateController_walrusStatusWithCompletion___block_invoke_16_cold_1();
  }

  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a2;
}

- (void)combinedWalrusStatusWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  CDPDaemonConnection *v6;
  uint64_t v7;
  id v8;
  void *v9;
  CDPContext *context;
  id v11;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(uint64_t, void *, void *);
  void *v15;
  id v16;
  _QWORD v17[4];
  id v18;
  os_activity_scope_state_s state;

  v4 = a3;
  v5 = _os_activity_create(&dword_20D7E6000, "Walrus: Fetching combined status.", MEMORY[0x24BDACB08], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v5, &state);
  v6 = objc_alloc_init(CDPDaemonConnection);
  v7 = MEMORY[0x24BDAC760];
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __63__CDPWalrusStateController_combinedWalrusStatusWithCompletion___block_invoke;
  v17[3] = &unk_24C7C10E8;
  v8 = v4;
  v18 = v8;
  -[CDPDaemonConnection daemonWithErrorHandler:](v6, "daemonWithErrorHandler:", v17);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  context = self->_context;
  v12 = v7;
  v13 = 3221225472;
  v14 = __63__CDPWalrusStateController_combinedWalrusStatusWithCompletion___block_invoke_20;
  v15 = &unk_24C7C1300;
  v11 = v8;
  v16 = v11;
  objc_msgSend(v9, "combinedWalrusStatusWithContext:completion:", context, &v12);
  -[CDPWalrusStateController _startObservingWalrusStateChangeNotification](self, "_startObservingWalrusStateChangeNotification", v12, v13, v14, v15);

  os_activity_scope_leave(&state);
}

void __63__CDPWalrusStateController_combinedWalrusStatusWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  CDPCombinedWalrusStatus *v5;

  v3 = a2;
  _CDPLogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __63__CDPWalrusStateController_combinedWalrusStatusWithCompletion___block_invoke_cold_1();

  v5 = objc_alloc_init(CDPCombinedWalrusStatus);
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void __63__CDPWalrusStateController_combinedWalrusStatusWithCompletion___block_invoke_20(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  NSObject *v8;

  v5 = a2;
  v6 = a3;
  _CDPLogSystem();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __63__CDPWalrusStateController_combinedWalrusStatusWithCompletion___block_invoke_20_cold_2();
  }
  else if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    __63__CDPWalrusStateController_combinedWalrusStatusWithCompletion___block_invoke_20_cold_1();
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (id)combinedWalrusStatus:(id *)a3
{
  NSObject *v5;
  CDPDaemonConnection *v6;
  uint64_t v7;
  void *v8;
  CDPContext *context;
  id v10;
  _QWORD v12[6];
  _QWORD v13[5];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;
  os_activity_scope_state_s state;

  v5 = _os_activity_create(&dword_20D7E6000, "Walrus: Fetching combined status.", MEMORY[0x24BDACB08], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v5, &state);
  v20 = 0;
  v21 = &v20;
  v22 = 0x3032000000;
  v23 = __Block_byref_object_copy_;
  v24 = __Block_byref_object_dispose_;
  v25 = 0;
  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy_;
  v18 = __Block_byref_object_dispose_;
  v19 = 0;
  v6 = objc_alloc_init(CDPDaemonConnection);
  v7 = MEMORY[0x24BDAC760];
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __49__CDPWalrusStateController_combinedWalrusStatus___block_invoke;
  v13[3] = &unk_24C7C12B0;
  v13[4] = &v14;
  -[CDPDaemonConnection synchronousDaemonWithErrorHandler:](v6, "synchronousDaemonWithErrorHandler:", v13);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  context = self->_context;
  v12[0] = v7;
  v12[1] = 3221225472;
  v12[2] = __49__CDPWalrusStateController_combinedWalrusStatus___block_invoke_22;
  v12[3] = &unk_24C7C1328;
  v12[4] = &v14;
  v12[5] = &v20;
  objc_msgSend(v8, "combinedWalrusStatusWithContext:completion:", context, v12);
  if (a3)
    *a3 = objc_retainAutorelease((id)v15[5]);
  v10 = (id)v21[5];

  _Block_object_dispose(&v14, 8);
  _Block_object_dispose(&v20, 8);

  os_activity_scope_leave(&state);
  return v10;
}

void __49__CDPWalrusStateController_combinedWalrusStatus___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;

  v3 = a2;
  _CDPLogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __63__CDPWalrusStateController_combinedWalrusStatusWithCompletion___block_invoke_cold_1();

  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v3;

}

void __49__CDPWalrusStateController_combinedWalrusStatus___block_invoke_22(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;

  v5 = a2;
  v6 = a3;
  if (v6)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a3);
    _CDPLogSystem();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __63__CDPWalrusStateController_combinedWalrusStatusWithCompletion___block_invoke_20_cold_2();
  }
  else
  {
    _CDPLogSystem();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      __49__CDPWalrusStateController_combinedWalrusStatus___block_invoke_22_cold_1(a1, v7, v8, v9, v10, v11, v12, v13);
  }

  v14 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v15 = *(void **)(v14 + 40);
  *(_QWORD *)(v14 + 40) = v5;

}

- (void)repairWalrusStatusWithCompletion:(id)a3
{
  id v3;
  NSObject *v4;
  CDPDaemonConnection *v5;
  uint64_t v6;
  id v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;
  _QWORD v12[4];
  id v13;
  os_activity_scope_state_s state;

  v3 = a3;
  v4 = _os_activity_create(&dword_20D7E6000, "Walrus: Repair walrus status.", MEMORY[0x24BDACB08], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v4, &state);
  v5 = objc_alloc_init(CDPDaemonConnection);
  v6 = MEMORY[0x24BDAC760];
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __61__CDPWalrusStateController_repairWalrusStatusWithCompletion___block_invoke;
  v12[3] = &unk_24C7C10E8;
  v7 = v3;
  v13 = v7;
  -[CDPDaemonConnection daemonWithErrorHandler:](v5, "daemonWithErrorHandler:", v12);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v6;
  v10[1] = 3221225472;
  v10[2] = __61__CDPWalrusStateController_repairWalrusStatusWithCompletion___block_invoke_23;
  v10[3] = &unk_24C7C10E8;
  v9 = v7;
  v11 = v9;
  objc_msgSend(v8, "repairWalrusWithCompletion:", v10);

  os_activity_scope_leave(&state);
}

void __61__CDPWalrusStateController_repairWalrusStatusWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  _CDPLogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __61__CDPWalrusStateController_repairWalrusStatusWithCompletion___block_invoke_cold_1();

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __61__CDPWalrusStateController_repairWalrusStatusWithCompletion___block_invoke_23(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  if (v3)
  {
    _CDPLogSystem();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __61__CDPWalrusStateController_repairWalrusStatusWithCompletion___block_invoke_23_cold_1();

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (void)broadcastWalrusStateChange
{
  void *v2;
  CDPDaemonConnection *v3;

  v3 = objc_alloc_init(CDPDaemonConnection);
  -[CDPDaemonConnection synchronousDaemonWithErrorHandler:](v3, "synchronousDaemonWithErrorHandler:", &__block_literal_global_2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "broadcastWalrusStateChange");

}

void __54__CDPWalrusStateController_broadcastWalrusStateChange__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  _CDPLogSystem();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __55__CDPWalrusStateController_walrusStatusWithCompletion___block_invoke_cold_1();

}

- (id)_makeAnalyticsEvent:(unint64_t)a3 state:(id)a4 error:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  v8 = a4;
  v9 = a5;
  objc_msgSend(MEMORY[0x24BDFC2A0], "analyticsEventWithContext:eventName:category:", self->_context, CFSTR("com.apple.corecdp.walrusStateChange"), 0x24C7D2420);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  v12 = *MEMORY[0x24BDFC328];
  if (v9)
  {
    objc_msgSend(v10, "setObject:forKeyedSubscript:", MEMORY[0x24BDBD1C0], v12);
    objc_msgSend(v11, "populateUnderlyingErrorsStartingWithRootError:", v9);
  }
  else
  {
    objc_msgSend(v10, "setObject:forKeyedSubscript:", MEMORY[0x24BDBD1C8], v12);
  }
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a3);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setObject:forKeyedSubscript:", v13, CFSTR("targetWalrusStatus"));

  if (v8)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(v8, "escrowWalrusStatus"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setObject:forKeyedSubscript:", v14, CFSTR("escrowWalrusStatus"));

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(v8, "octagonWalrusStatus"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setObject:forKeyedSubscript:", v15, CFSTR("octagonWalrusStatus"));

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(v8, "pcsWalrusStatus"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setObject:forKeyedSubscript:", v16, CFSTR("pcsWalrusStatus"));

  }
  return v11;
}

- (void)updateWalrusStatus:(unint64_t)a3 completion:(id)a4
{
  id v6;
  NSObject *v7;
  CDPDaemonConnection *v8;
  uint64_t v9;
  id v10;
  void *v11;
  id v12;
  _QWORD v13[5];
  id v14;
  unint64_t v15;
  _QWORD v16[5];
  id v17;
  unint64_t v18;
  os_activity_scope_state_s state;

  v6 = a4;
  v7 = _os_activity_create(&dword_20D7E6000, "Walrus: Updating status", MEMORY[0x24BDACB08], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v7, &state);
  v8 = objc_alloc_init(CDPDaemonConnection);
  v9 = MEMORY[0x24BDAC760];
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __58__CDPWalrusStateController_updateWalrusStatus_completion___block_invoke;
  v16[3] = &unk_24C7C1350;
  v16[4] = self;
  v18 = a3;
  v10 = v6;
  v17 = v10;
  -[CDPDaemonConnection daemonWithErrorHandler:](v8, "daemonWithErrorHandler:", v16);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v9;
  v13[1] = 3221225472;
  v13[2] = __58__CDPWalrusStateController_updateWalrusStatus_completion___block_invoke_27;
  v13[3] = &unk_24C7C1378;
  v13[4] = self;
  v15 = a3;
  v12 = v10;
  v14 = v12;
  objc_msgSend(v11, "updateWalrusStatus:completion:", a3, v13);

  os_activity_scope_leave(&state);
}

void __58__CDPWalrusStateController_updateWalrusStatus_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;

  v3 = a2;
  _CDPLogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __58__CDPWalrusStateController_updateWalrusStatus_completion___block_invoke_cold_1();

  objc_msgSend(*(id *)(a1 + 32), "_makeAnalyticsEvent:state:error:", *(_QWORD *)(a1 + 48), 0, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[CDPAnalyticsReporterRTC rtcAnalyticsReporter](CDPAnalyticsReporterRTC, "rtcAnalyticsReporter");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "sendEvent:", v5);

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void __58__CDPWalrusStateController_updateWalrusStatus_completion___block_invoke_27(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  uint8_t v11[16];

  v5 = a3;
  v6 = a2;
  _CDPLogSystem();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v5)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __58__CDPWalrusStateController_updateWalrusStatus_completion___block_invoke_27_cold_1();
  }
  else if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v11 = 0;
    _os_log_impl(&dword_20D7E6000, v8, OS_LOG_TYPE_DEFAULT, "\"Walrus status update has been completed successfully.\", v11, 2u);
  }

  objc_msgSend(*(id *)(a1 + 32), "_makeAnalyticsEvent:state:error:", *(_QWORD *)(a1 + 48), v6, v5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  +[CDPAnalyticsReporterRTC rtcAnalyticsReporter](CDPAnalyticsReporterRTC, "rtcAnalyticsReporter");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "sendEvent:", v9);

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)pcsKeysForServices:(id)a3 completion:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  CDPDaemonConnection *v8;
  uint64_t v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  _QWORD v17[4];
  id v18;
  os_activity_scope_state_s state;

  v5 = a3;
  v6 = a4;
  v7 = _os_activity_create(&dword_20D7E6000, "Walrus: Fetch PCS Identities", MEMORY[0x24BDACB08], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v7, &state);
  v8 = objc_alloc_init(CDPDaemonConnection);
  v9 = MEMORY[0x24BDAC760];
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __58__CDPWalrusStateController_pcsKeysForServices_completion___block_invoke;
  v17[3] = &unk_24C7C10E8;
  v10 = v6;
  v18 = v10;
  -[CDPDaemonConnection daemonWithErrorHandler:](v8, "daemonWithErrorHandler:", v17);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v9;
  v14[1] = 3221225472;
  v14[2] = __58__CDPWalrusStateController_pcsKeysForServices_completion___block_invoke_29;
  v14[3] = &unk_24C7C13A0;
  v12 = v5;
  v15 = v12;
  v13 = v10;
  v16 = v13;
  objc_msgSend(v11, "pcsKeysForServices:completion:", v12, v14);

  os_activity_scope_leave(&state);
}

void __58__CDPWalrusStateController_pcsKeysForServices_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  id v6;

  v3 = a2;
  _CDPLogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __58__CDPWalrusStateController_pcsKeysForServices_completion___block_invoke_cold_1(v3, v4);

  v5 = *(_QWORD *)(a1 + 32);
  v6 = objc_alloc_init(MEMORY[0x24BDBCE70]);
  (*(void (**)(uint64_t, id, id))(v5 + 16))(v5, v6, v3);

}

void __58__CDPWalrusStateController_pcsKeysForServices_completion___block_invoke_29(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;

  v5 = a2;
  v6 = a3;
  if (v6)
  {
    _CDPLogSystem();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __58__CDPWalrusStateController_pcsKeysForServices_completion___block_invoke_29_cold_1(a1, v6, v7);

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (BOOL)shouldOpenGate
{
  return 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_context, 0);
}

void __55__CDPWalrusStateController_walrusStatusWithCompletion___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_19();
  OUTLINED_FUNCTION_0_2(&dword_20D7E6000, v0, v1, "\"XPC Error while fetching walrus status: %{public}@\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

void __55__CDPWalrusStateController_walrusStatusWithCompletion___block_invoke_16_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_19();
  OUTLINED_FUNCTION_7(&dword_20D7E6000, v0, v1, "\"Walrus status - %lu\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

void __55__CDPWalrusStateController_walrusStatusWithCompletion___block_invoke_16_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_19();
  OUTLINED_FUNCTION_0_2(&dword_20D7E6000, v0, v1, "\"Failed to fetch walrus status with error: %@\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

void __41__CDPWalrusStateController_walrusStatus___block_invoke_18_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_19();
  OUTLINED_FUNCTION_0_2(&dword_20D7E6000, v0, v1, "\"Failed to fetch walrus status with error - %@\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

void __63__CDPWalrusStateController_combinedWalrusStatusWithCompletion___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_19();
  OUTLINED_FUNCTION_0_2(&dword_20D7E6000, v0, v1, "\"XPC Error while fetching walrus combined status: %{public}@\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

void __63__CDPWalrusStateController_combinedWalrusStatusWithCompletion___block_invoke_20_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_19();
  OUTLINED_FUNCTION_7(&dword_20D7E6000, v0, v1, "\"Walrus combined status %@\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

void __63__CDPWalrusStateController_combinedWalrusStatusWithCompletion___block_invoke_20_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_19();
  OUTLINED_FUNCTION_0_2(&dword_20D7E6000, v0, v1, "\"Failed to fetch walrus combined status with error: %@\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

void __49__CDPWalrusStateController_combinedWalrusStatus___block_invoke_22_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_7(&dword_20D7E6000, a2, a3, "\"Walrus combined status %@\", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_5();
}

void __61__CDPWalrusStateController_repairWalrusStatusWithCompletion___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_19();
  OUTLINED_FUNCTION_0_2(&dword_20D7E6000, v0, v1, "\"XPC Error while repairing walrus status: %@.\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

void __61__CDPWalrusStateController_repairWalrusStatusWithCompletion___block_invoke_23_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_19();
  OUTLINED_FUNCTION_0_2(&dword_20D7E6000, v0, v1, "\"Failed to repair walrus status with error: %@\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

void __58__CDPWalrusStateController_updateWalrusStatus_completion___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_19();
  OUTLINED_FUNCTION_0_2(&dword_20D7E6000, v0, v1, "\"XPC Error while updating walrus status: %{public}@.\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

void __58__CDPWalrusStateController_updateWalrusStatus_completion___block_invoke_27_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_19();
  OUTLINED_FUNCTION_0_2(&dword_20D7E6000, v0, v1, "\"Failed to update walrus status with error %@\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

void __58__CDPWalrusStateController_pcsKeysForServices_completion___block_invoke_cold_1(void *a1, NSObject *a2)
{
  void *v3;
  uint8_t v4[24];
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "description");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_19();
  _os_log_error_impl(&dword_20D7E6000, a2, OS_LOG_TYPE_ERROR, "\"XPC Error while fetching PCS identities - %@\", v4, 0xCu);

}

void __58__CDPWalrusStateController_pcsKeysForServices_completion___block_invoke_29_cold_1(uint64_t a1, void *a2, NSObject *a3)
{
  uint64_t v4;
  void *v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v4 = *(_QWORD *)(a1 + 32);
  objc_msgSend(a2, "description");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 138412546;
  v7 = v4;
  v8 = 2112;
  v9 = v5;
  _os_log_error_impl(&dword_20D7E6000, a3, OS_LOG_TYPE_ERROR, "\"Failed to fetch PCS identities for services %@ with error: %@\", (uint8_t *)&v6, 0x16u);

}

@end
