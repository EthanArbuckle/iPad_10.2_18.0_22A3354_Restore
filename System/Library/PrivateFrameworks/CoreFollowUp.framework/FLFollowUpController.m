@implementation FLFollowUpController

void __77__FLFollowUpController_clearPendingFollowUpItemsWithUniqueIdentifiers_error___block_invoke_10(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  int v10;
  void *v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  _FLLogSystem();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138412546;
    v11 = v7;
    v12 = 2112;
    v13 = v5;
    _os_log_impl(&dword_1B8D53000, v6, OS_LOG_TYPE_DEFAULT, "Cleared pending follow up item identifiers with success: %@, error: %@", (uint8_t *)&v10, 0x16u);

  }
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = a2;
  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v9 = *(void **)(v8 + 40);
  *(_QWORD *)(v8 + 40) = v5;

}

- (FLFollowUpController)initWithClientIdentifier:(id)a3
{
  id v5;
  FLFollowUpController *v6;
  FLFollowUpController *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)FLFollowUpController;
  v6 = -[FLFollowUpController init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_clientIdentifier, a3);

  return v7;
}

- (BOOL)clearPendingFollowUpItemsWithUniqueIdentifiers:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  NSObject *v10;
  NSString *clientIdentifier;
  NSString *v12;
  BOOL v13;
  _QWORD v15[6];
  _QWORD v16[5];
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
  uint8_t buf[4];
  NSString *v28;
  __int16 v29;
  id v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v23 = 0;
  v24 = &v23;
  v25 = 0x2020000000;
  v26 = 0;
  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = __Block_byref_object_copy_;
  v21 = __Block_byref_object_dispose_;
  v22 = 0;
  +[FLDaemon sharedInstance](FLDaemon, "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x1E0C809B0];
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __77__FLFollowUpController_clearPendingFollowUpItemsWithUniqueIdentifiers_error___block_invoke;
  v16[3] = &unk_1E6F1E358;
  v16[4] = &v17;
  objc_msgSend(v7, "synchronousDaemonWithErrorHandler:", v16);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  _FLLogSystem();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    clientIdentifier = self->_clientIdentifier;
    *(_DWORD *)buf = 138412546;
    v28 = clientIdentifier;
    v29 = 2112;
    v30 = v6;
    _os_log_impl(&dword_1B8D53000, v10, OS_LOG_TYPE_DEFAULT, "Asking daemon server to clear pending items with identifier: %@, uniqueIdentifiers: %@", buf, 0x16u);
  }

  v12 = self->_clientIdentifier;
  v15[0] = v8;
  v15[1] = 3221225472;
  v15[2] = __77__FLFollowUpController_clearPendingFollowUpItemsWithUniqueIdentifiers_error___block_invoke_10;
  v15[3] = &unk_1E6F1E3F8;
  v15[4] = &v23;
  v15[5] = &v17;
  objc_msgSend(v9, "clearPendingFollowUpItemsForClientIdentifier:uniqueIdentifiers:completion:", v12, v6, v15);
  if (a4)
    *a4 = objc_retainAutorelease((id)v18[5]);
  v13 = *((_BYTE *)v24 + 24) != 0;

  _Block_object_dispose(&v17, 8);
  _Block_object_dispose(&v23, 8);

  return v13;
}

void __45__FLFollowUpController_pendingFollowUpItems___block_invoke_7(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  id v10;
  uint64_t v11;
  void *v12;
  int v13;
  id v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  _FLLogSystem();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v13 = 138412546;
    v14 = v5;
    v15 = 2112;
    v16 = v6;
    _os_log_impl(&dword_1B8D53000, v7, OS_LOG_TYPE_DEFAULT, "pendingFollowUpItems: Fetched pending follow up items: %@, error: %@", (uint8_t *)&v13, 0x16u);
  }

  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v9 = *(void **)(v8 + 40);
  *(_QWORD *)(v8 + 40) = v5;
  v10 = v5;

  v11 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v12 = *(void **)(v11 + 40);
  *(_QWORD *)(v11 + 40) = v6;

}

- (id)pendingFollowUpItems:(id *)a3
{
  NSObject *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  NSString *clientIdentifier;
  NSString *v11;
  id v12;
  _QWORD v14[6];
  _QWORD v15[5];
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;
  os_activity_scope_state_s state;
  uint8_t buf[4];
  NSString *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v5 = _os_activity_create(&dword_1B8D53000, "followup/reading-pending-items", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v5, &state);
  v22 = 0;
  v23 = &v22;
  v24 = 0x3032000000;
  v25 = __Block_byref_object_copy_;
  v26 = __Block_byref_object_dispose_;
  v27 = 0;
  v16 = 0;
  v17 = &v16;
  v18 = 0x3032000000;
  v19 = __Block_byref_object_copy_;
  v20 = __Block_byref_object_dispose_;
  v21 = 0;
  +[FLDaemon sharedInstance](FLDaemon, "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = MEMORY[0x1E0C809B0];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __45__FLFollowUpController_pendingFollowUpItems___block_invoke;
  v15[3] = &unk_1E6F1E358;
  v15[4] = &v16;
  objc_msgSend(v6, "synchronousDaemonWithErrorHandler:", v15);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  _FLLogSystem();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    clientIdentifier = self->_clientIdentifier;
    *(_DWORD *)buf = 138412290;
    v30 = clientIdentifier;
    _os_log_impl(&dword_1B8D53000, v9, OS_LOG_TYPE_DEFAULT, "pendingFollowUpItems: Asking daemon server for pending items with identifier: %@", buf, 0xCu);
  }

  v11 = self->_clientIdentifier;
  v14[0] = v7;
  v14[1] = 3221225472;
  v14[2] = __45__FLFollowUpController_pendingFollowUpItems___block_invoke_7;
  v14[3] = &unk_1E6F1E3D0;
  v14[4] = &v22;
  v14[5] = &v16;
  objc_msgSend(v8, "pendingFollowUpItemsForClientIdentifier:completion:", v11, v14);
  if (a3)
    *a3 = objc_retainAutorelease((id)v17[5]);
  v12 = (id)v23[5];

  _Block_object_dispose(&v16, 8);
  _Block_object_dispose(&v22, 8);

  os_activity_scope_leave(&state);
  return v12;
}

- (FLFollowUpController)initWithClientIdentifier:(id)a3 xpcEndpoint:(id)a4
{
  id v6;
  FLFollowUpController *v7;
  void *v8;

  v6 = a4;
  v7 = -[FLFollowUpController initWithClientIdentifier:](self, "initWithClientIdentifier:", a3);
  if (v7)
  {
    +[FLDaemon sharedInstance](FLDaemon, "sharedInstance");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setDaemonXPCEndpoint:", v6);

  }
  return v7;
}

- (FLFollowUpController)initWithClientIdentifier:(id)a3 machServiceName:(id)a4 delegate:(id)a5
{
  id v9;
  id v10;
  FLFollowUpController *v11;
  FLFollowUpController *v12;
  NSString **p_machServiceName;
  uint64_t v14;
  NSXPCListener *listener;

  v9 = a4;
  v10 = a5;
  v11 = -[FLFollowUpController initWithClientIdentifier:](self, "initWithClientIdentifier:", a3);
  v12 = v11;
  if (v11)
  {
    p_machServiceName = &v11->_machServiceName;
    objc_storeStrong((id *)&v11->_machServiceName, a4);
    objc_storeWeak((id *)&v12->_delegate, v10);
    if (v10)
    {
      if (*p_machServiceName)
      {
        v14 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B58]), "initWithMachServiceName:", v12->_machServiceName);
        listener = v12->_listener;
        v12->_listener = (NSXPCListener *)v14;

        -[NSXPCListener setDelegate:](v12->_listener, "setDelegate:", v12);
        -[NSXPCListener resume](v12->_listener, "resume");
      }
    }
  }

  return v12;
}

- (BOOL)postFollowUpItem:(id)a3 error:(id *)a4
{
  id v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  CFAbsoluteTime Current;
  NSObject *v12;
  void *v13;
  _BOOL4 v14;
  NSObject *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  BOOL v23;
  _QWORD v25[7];
  _QWORD v26[5];
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t (*v30)(uint64_t, uint64_t);
  void (*v31)(uint64_t);
  id v32;
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  char v36;
  os_activity_scope_state_s state;
  uint8_t buf[4];
  id v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = _os_activity_create(&dword_1B8D53000, "followup/posting-item", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v7, &state);
  v33 = 0;
  v34 = &v33;
  v35 = 0x2020000000;
  v36 = 0;
  v27 = 0;
  v28 = &v27;
  v29 = 0x3032000000;
  v30 = __Block_byref_object_copy_;
  v31 = __Block_byref_object_dispose_;
  v32 = 0;
  +[FLDaemon sharedInstance](FLDaemon, "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = MEMORY[0x1E0C809B0];
  v26[0] = MEMORY[0x1E0C809B0];
  v26[1] = 3221225472;
  v26[2] = __47__FLFollowUpController_postFollowUpItem_error___block_invoke;
  v26[3] = &unk_1E6F1E358;
  v26[4] = &v27;
  objc_msgSend(v8, "synchronousDaemonWithErrorHandler:", v26);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (self->_clientIdentifier)
    objc_msgSend(v6, "setClientIdentifier:");
  Current = CFAbsoluteTimeGetCurrent();
  _FLLogSystem();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v39 = v6;
    _os_log_impl(&dword_1B8D53000, v12, OS_LOG_TYPE_DEFAULT, "Asking daemon server to post follow up item: %@", buf, 0xCu);
  }

  objc_msgSend(v6, "title");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13 == 0;

  if (v14)
  {
    _FLLogSystem();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      -[FLFollowUpController postFollowUpItem:error:].cold.1(v15, v16, v17, v18, v19, v20, v21, v22);

  }
  v25[0] = v9;
  v25[1] = 3221225472;
  v25[2] = __47__FLFollowUpController_postFollowUpItem_error___block_invoke_2;
  v25[3] = &unk_1E6F1E380;
  *(CFAbsoluteTime *)&v25[6] = Current;
  v25[4] = &v33;
  v25[5] = &v27;
  objc_msgSend(v10, "postFollowUpItem:completion:", v6, v25);
  if (a4)
    *a4 = objc_retainAutorelease((id)v28[5]);
  v23 = *((_BYTE *)v34 + 24) != 0;

  _Block_object_dispose(&v27, 8);
  _Block_object_dispose(&v33, 8);
  os_activity_scope_leave(&state);

  return v23;
}

void __47__FLFollowUpController_postFollowUpItem_error___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;

  v3 = a2;
  _FLLogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __47__FLFollowUpController_postFollowUpItem_error___block_invoke_cold_1();

  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v3;

}

void __47__FLFollowUpController_postFollowUpItem_error___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  int v11;
  void *v12;
  __int16 v13;
  id v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  _FLLogSystem();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", CFAbsoluteTimeGetCurrent() - *(double *)(a1 + 48));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 138412802;
    v12 = v7;
    v13 = 2112;
    v14 = v5;
    v15 = 2112;
    v16 = v8;
    _os_log_impl(&dword_1B8D53000, v6, OS_LOG_TYPE_DEFAULT, "Posted follow up item with success: %@, error: %@, took: %@", (uint8_t *)&v11, 0x20u);

  }
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = a2;
  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v5;

}

- (unint64_t)countOfPendingFollowUpItems:(id *)a3
{
  NSObject *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  NSString *clientIdentifier;
  NSString *v11;
  unint64_t v12;
  _QWORD v14[6];
  _QWORD v15[5];
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t v25;
  os_activity_scope_state_s state;
  uint8_t buf[4];
  NSString *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v5 = _os_activity_create(&dword_1B8D53000, "followup/counting-pending-items", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v5, &state);
  v22 = 0;
  v23 = &v22;
  v24 = 0x2020000000;
  v25 = 0;
  v16 = 0;
  v17 = &v16;
  v18 = 0x3032000000;
  v19 = __Block_byref_object_copy_;
  v20 = __Block_byref_object_dispose_;
  v21 = 0;
  +[FLDaemon sharedInstance](FLDaemon, "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = MEMORY[0x1E0C809B0];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __52__FLFollowUpController_countOfPendingFollowUpItems___block_invoke;
  v15[3] = &unk_1E6F1E358;
  v15[4] = &v16;
  objc_msgSend(v6, "synchronousDaemonWithErrorHandler:", v15);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  _FLLogSystem();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    clientIdentifier = self->_clientIdentifier;
    *(_DWORD *)buf = 138412290;
    v28 = clientIdentifier;
    _os_log_impl(&dword_1B8D53000, v9, OS_LOG_TYPE_DEFAULT, "Asking daemon server for count of items with identifier: %@", buf, 0xCu);
  }

  v11 = self->_clientIdentifier;
  v14[0] = v7;
  v14[1] = 3221225472;
  v14[2] = __52__FLFollowUpController_countOfPendingFollowUpItems___block_invoke_5;
  v14[3] = &unk_1E6F1E3A8;
  v14[4] = &v22;
  v14[5] = &v16;
  objc_msgSend(v8, "countOfPendingFollowUpItemsForClientIdentifier:completion:", v11, v14);
  if (a3)
    *a3 = objc_retainAutorelease((id)v17[5]);
  v12 = v23[3];

  _Block_object_dispose(&v16, 8);
  _Block_object_dispose(&v22, 8);
  os_activity_scope_leave(&state);

  return v12;
}

void __52__FLFollowUpController_countOfPendingFollowUpItems___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;

  v3 = a2;
  _FLLogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __47__FLFollowUpController_postFollowUpItem_error___block_invoke_cold_1();

  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v3;

}

void __52__FLFollowUpController_countOfPendingFollowUpItems___block_invoke_5(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  int v10;
  void *v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  _FLLogSystem();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138412546;
    v11 = v7;
    v12 = 2112;
    v13 = v5;
    _os_log_impl(&dword_1B8D53000, v6, OS_LOG_TYPE_DEFAULT, "Received count of follow up items for client: %@, error: %@", (uint8_t *)&v10, 0x16u);

  }
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = a2;
  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v9 = *(void **)(v8 + 40);
  *(_QWORD *)(v8 + 40) = v5;

}

void __45__FLFollowUpController_pendingFollowUpItems___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;

  v3 = a2;
  _FLLogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __47__FLFollowUpController_postFollowUpItem_error___block_invoke_cold_1();

  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v3;

}

- (BOOL)clearPendingFollowUpItems:(id *)a3
{
  NSObject *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  NSString *clientIdentifier;
  NSString *v11;
  BOOL v12;
  _QWORD v14[6];
  _QWORD v15[5];
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  char v25;
  os_activity_scope_state_s state;
  uint8_t buf[4];
  NSString *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v5 = _os_activity_create(&dword_1B8D53000, "followup/clearing-pending-items", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v5, &state);
  v22 = 0;
  v23 = &v22;
  v24 = 0x2020000000;
  v25 = 0;
  v16 = 0;
  v17 = &v16;
  v18 = 0x3032000000;
  v19 = __Block_byref_object_copy_;
  v20 = __Block_byref_object_dispose_;
  v21 = 0;
  +[FLDaemon sharedInstance](FLDaemon, "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = MEMORY[0x1E0C809B0];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __50__FLFollowUpController_clearPendingFollowUpItems___block_invoke;
  v15[3] = &unk_1E6F1E358;
  v15[4] = &v16;
  objc_msgSend(v6, "synchronousDaemonWithErrorHandler:", v15);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  _FLLogSystem();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    clientIdentifier = self->_clientIdentifier;
    *(_DWORD *)buf = 138412290;
    v28 = clientIdentifier;
    _os_log_impl(&dword_1B8D53000, v9, OS_LOG_TYPE_DEFAULT, "Asking daemon server to clear pending items with identifier: %@", buf, 0xCu);
  }

  v11 = self->_clientIdentifier;
  v14[0] = v7;
  v14[1] = 3221225472;
  v14[2] = __50__FLFollowUpController_clearPendingFollowUpItems___block_invoke_9;
  v14[3] = &unk_1E6F1E3F8;
  v14[4] = &v22;
  v14[5] = &v16;
  objc_msgSend(v8, "clearPendingFollowUpItemsForClientIdentifier:completion:", v11, v14);
  if (a3)
    *a3 = objc_retainAutorelease((id)v17[5]);
  v12 = *((_BYTE *)v23 + 24) != 0;

  _Block_object_dispose(&v16, 8);
  _Block_object_dispose(&v22, 8);
  os_activity_scope_leave(&state);

  return v12;
}

void __50__FLFollowUpController_clearPendingFollowUpItems___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;

  v3 = a2;
  _FLLogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __47__FLFollowUpController_postFollowUpItem_error___block_invoke_cold_1();

  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v3;

}

void __50__FLFollowUpController_clearPendingFollowUpItems___block_invoke_9(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  int v10;
  void *v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  _FLLogSystem();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138412546;
    v11 = v7;
    v12 = 2112;
    v13 = v5;
    _os_log_impl(&dword_1B8D53000, v6, OS_LOG_TYPE_DEFAULT, "Cleared pending follow up items with success: %@, error: %@", (uint8_t *)&v10, 0x16u);

  }
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = a2;
  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v9 = *(void **)(v8 + 40);
  *(_QWORD *)(v8 + 40) = v5;

}

void __77__FLFollowUpController_clearPendingFollowUpItemsWithUniqueIdentifiers_error___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;

  v3 = a2;
  _FLLogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __47__FLFollowUpController_postFollowUpItem_error___block_invoke_cold_1();

  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v3;

}

- (BOOL)clearNotificationForItem:(id)a3 error:(id *)a4
{
  id v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  NSObject *v10;
  BOOL v11;
  _QWORD v13[6];
  _QWORD v14[5];
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  char v24;
  os_activity_scope_state_s state;
  uint8_t buf[4];
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = _os_activity_create(&dword_1B8D53000, "followup/clearing-notification", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v6, &state);
  v21 = 0;
  v22 = &v21;
  v23 = 0x2020000000;
  v24 = 0;
  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = __Block_byref_object_copy_;
  v19 = __Block_byref_object_dispose_;
  v20 = 0;
  +[FLDaemon sharedInstance](FLDaemon, "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x1E0C809B0];
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __55__FLFollowUpController_clearNotificationForItem_error___block_invoke;
  v14[3] = &unk_1E6F1E358;
  v14[4] = &v15;
  objc_msgSend(v7, "synchronousDaemonWithErrorHandler:", v14);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  _FLLogSystem();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v27 = v5;
    _os_log_impl(&dword_1B8D53000, v10, OS_LOG_TYPE_DEFAULT, "Asking daemon server to clear notifications for item: %@", buf, 0xCu);
  }

  v13[0] = v8;
  v13[1] = 3221225472;
  v13[2] = __55__FLFollowUpController_clearNotificationForItem_error___block_invoke_11;
  v13[3] = &unk_1E6F1E3F8;
  v13[4] = &v21;
  v13[5] = &v15;
  objc_msgSend(v9, "clearNotificationForItem:completion:", v5, v13);
  if (a4)
    *a4 = objc_retainAutorelease((id)v16[5]);
  v11 = *((_BYTE *)v22 + 24) != 0;

  _Block_object_dispose(&v15, 8);
  _Block_object_dispose(&v21, 8);
  os_activity_scope_leave(&state);

  return v11;
}

void __55__FLFollowUpController_clearNotificationForItem_error___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;

  v3 = a2;
  _FLLogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __47__FLFollowUpController_postFollowUpItem_error___block_invoke_cold_1();

  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v3;

}

void __55__FLFollowUpController_clearNotificationForItem_error___block_invoke_11(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  int v10;
  void *v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  _FLLogSystem();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138412546;
    v11 = v7;
    v12 = 2112;
    v13 = v5;
    _os_log_impl(&dword_1B8D53000, v6, OS_LOG_TYPE_DEFAULT, "Cleared notification with success: %@, error: %@", (uint8_t *)&v10, 0x16u);

  }
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = a2;
  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v9 = *(void **)(v8 + 40);
  *(_QWORD *)(v8 + 40) = v5;

}

- (void)postFollowUpItem:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;
  NSObject *v12;
  void *v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  id v22;
  _QWORD v23[4];
  id v24;
  _QWORD v25[4];
  id v26;
  uint8_t buf[4];
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  +[FLDaemon sharedInstance](FLDaemon, "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = MEMORY[0x1E0C809B0];
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __52__FLFollowUpController_postFollowUpItem_completion___block_invoke;
  v25[3] = &unk_1E6F1E420;
  v10 = v7;
  v26 = v10;
  objc_msgSend(v8, "daemonWithErrorHandler:", v25);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (self->_clientIdentifier)
    objc_msgSend(v6, "setClientIdentifier:");
  _FLLogSystem();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v28 = v6;
    _os_log_impl(&dword_1B8D53000, v12, OS_LOG_TYPE_DEFAULT, "Asking daemon server to post follow up item: %@", buf, 0xCu);
  }

  objc_msgSend(v6, "title");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v13)
  {
    _FLLogSystem();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      -[FLFollowUpController postFollowUpItem:error:].cold.1(v14, v15, v16, v17, v18, v19, v20, v21);

  }
  v23[0] = v9;
  v23[1] = 3221225472;
  v23[2] = __52__FLFollowUpController_postFollowUpItem_completion___block_invoke_12;
  v23[3] = &unk_1E6F1E448;
  v24 = v10;
  v22 = v10;
  objc_msgSend(v11, "postFollowUpItem:completion:", v6, v23);

}

void __52__FLFollowUpController_postFollowUpItem_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  _FLLogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __47__FLFollowUpController_postFollowUpItem_error___block_invoke_cold_1();

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __52__FLFollowUpController_postFollowUpItem_completion___block_invoke_12(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  int v9;
  void *v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  _FLLogSystem();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138412546;
    v10 = v7;
    v11 = 2112;
    v12 = v5;
    _os_log_impl(&dword_1B8D53000, v6, OS_LOG_TYPE_DEFAULT, "Posted follow up item with success: %@, error: %@", (uint8_t *)&v9, 0x16u);

  }
  v8 = *(_QWORD *)(a1 + 32);
  if (v8)
    (*(void (**)(uint64_t, uint64_t, id))(v8 + 16))(v8, a2, v5);

}

- (void)countOfPendingFollowUpItemsWithCompletion:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;
  NSObject *v9;
  NSString *clientIdentifier;
  NSString *v11;
  id v12;
  _QWORD v13[4];
  id v14;
  _QWORD v15[4];
  id v16;
  uint8_t buf[4];
  NSString *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  +[FLDaemon sharedInstance](FLDaemon, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = MEMORY[0x1E0C809B0];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __66__FLFollowUpController_countOfPendingFollowUpItemsWithCompletion___block_invoke;
  v15[3] = &unk_1E6F1E420;
  v7 = v4;
  v16 = v7;
  objc_msgSend(v5, "daemonWithErrorHandler:", v15);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  _FLLogSystem();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    clientIdentifier = self->_clientIdentifier;
    *(_DWORD *)buf = 138412290;
    v18 = clientIdentifier;
    _os_log_impl(&dword_1B8D53000, v9, OS_LOG_TYPE_DEFAULT, "Asking daemon server for count of items with identifier: %@", buf, 0xCu);
  }

  v11 = self->_clientIdentifier;
  v13[0] = v6;
  v13[1] = 3221225472;
  v13[2] = __66__FLFollowUpController_countOfPendingFollowUpItemsWithCompletion___block_invoke_13;
  v13[3] = &unk_1E6F1E470;
  v14 = v7;
  v12 = v7;
  objc_msgSend(v8, "countOfPendingFollowUpItemsForClientIdentifier:completion:", v11, v13);

}

void __66__FLFollowUpController_countOfPendingFollowUpItemsWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  _FLLogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __47__FLFollowUpController_postFollowUpItem_error___block_invoke_cold_1();

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __66__FLFollowUpController_countOfPendingFollowUpItemsWithCompletion___block_invoke_13(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  int v9;
  void *v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  _FLLogSystem();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138412546;
    v10 = v7;
    v11 = 2112;
    v12 = v5;
    _os_log_impl(&dword_1B8D53000, v6, OS_LOG_TYPE_DEFAULT, "Received count of follow up items for client: %@, error: %@", (uint8_t *)&v9, 0x16u);

  }
  v8 = *(_QWORD *)(a1 + 32);
  if (v8)
    (*(void (**)(uint64_t, uint64_t, id))(v8 + 16))(v8, a2, v5);

}

- (void)pendingFollowUpItemsWithCompletion:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;
  NSObject *v9;
  NSString *clientIdentifier;
  NSString *v11;
  id v12;
  _QWORD v13[4];
  id v14;
  _QWORD v15[4];
  id v16;
  uint8_t buf[4];
  NSString *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  +[FLDaemon sharedInstance](FLDaemon, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = MEMORY[0x1E0C809B0];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __59__FLFollowUpController_pendingFollowUpItemsWithCompletion___block_invoke;
  v15[3] = &unk_1E6F1E420;
  v7 = v4;
  v16 = v7;
  objc_msgSend(v5, "daemonWithErrorHandler:", v15);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  _FLLogSystem();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    clientIdentifier = self->_clientIdentifier;
    *(_DWORD *)buf = 138412290;
    v18 = clientIdentifier;
    _os_log_impl(&dword_1B8D53000, v9, OS_LOG_TYPE_DEFAULT, "pendingFollowUpItemsWithCompletion: Asking daemon server for pending items with identifier: %@", buf, 0xCu);
  }

  v11 = self->_clientIdentifier;
  v13[0] = v6;
  v13[1] = 3221225472;
  v13[2] = __59__FLFollowUpController_pendingFollowUpItemsWithCompletion___block_invoke_14;
  v13[3] = &unk_1E6F1E498;
  v14 = v7;
  v12 = v7;
  objc_msgSend(v8, "pendingFollowUpItemsForClientIdentifier:completion:", v11, v13);

}

void __59__FLFollowUpController_pendingFollowUpItemsWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  _FLLogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __47__FLFollowUpController_postFollowUpItem_error___block_invoke_cold_1();

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __59__FLFollowUpController_pendingFollowUpItemsWithCompletion___block_invoke_14(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  int v9;
  id v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  _FLLogSystem();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 138412546;
    v10 = v5;
    v11 = 2112;
    v12 = v6;
    _os_log_impl(&dword_1B8D53000, v7, OS_LOG_TYPE_DEFAULT, "pendingFollowUpItemsWithCompletion: Fetched pending follow up items: %@, error: %@", (uint8_t *)&v9, 0x16u);
  }

  v8 = *(_QWORD *)(a1 + 32);
  if (v8)
    (*(void (**)(uint64_t, id, id))(v8 + 16))(v8, v5, v6);

}

- (void)clearPendingFollowUpItemsWithCompletion:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;
  NSObject *v9;
  NSString *clientIdentifier;
  NSString *v11;
  id v12;
  _QWORD v13[4];
  id v14;
  _QWORD v15[4];
  id v16;
  uint8_t buf[4];
  NSString *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  +[FLDaemon sharedInstance](FLDaemon, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = MEMORY[0x1E0C809B0];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __64__FLFollowUpController_clearPendingFollowUpItemsWithCompletion___block_invoke;
  v15[3] = &unk_1E6F1E420;
  v7 = v4;
  v16 = v7;
  objc_msgSend(v5, "daemonWithErrorHandler:", v15);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  _FLLogSystem();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    clientIdentifier = self->_clientIdentifier;
    *(_DWORD *)buf = 138412290;
    v18 = clientIdentifier;
    _os_log_impl(&dword_1B8D53000, v9, OS_LOG_TYPE_DEFAULT, "Asking daemon server to clear pending items with identifier: %@", buf, 0xCu);
  }

  v11 = self->_clientIdentifier;
  v13[0] = v6;
  v13[1] = 3221225472;
  v13[2] = __64__FLFollowUpController_clearPendingFollowUpItemsWithCompletion___block_invoke_15;
  v13[3] = &unk_1E6F1E448;
  v14 = v7;
  v12 = v7;
  objc_msgSend(v8, "clearPendingFollowUpItemsForClientIdentifier:completion:", v11, v13);

}

void __64__FLFollowUpController_clearPendingFollowUpItemsWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  _FLLogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __47__FLFollowUpController_postFollowUpItem_error___block_invoke_cold_1();

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __64__FLFollowUpController_clearPendingFollowUpItemsWithCompletion___block_invoke_15(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  int v9;
  void *v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  _FLLogSystem();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138412546;
    v10 = v7;
    v11 = 2112;
    v12 = v5;
    _os_log_impl(&dword_1B8D53000, v6, OS_LOG_TYPE_DEFAULT, "Cleared pending follow up items with success: %@, error: %@", (uint8_t *)&v9, 0x16u);

  }
  v8 = *(_QWORD *)(a1 + 32);
  if (v8)
    (*(void (**)(uint64_t, uint64_t, id))(v8 + 16))(v8, a2, v5);

}

- (void)clearPendingFollowUpItemsWithUniqueIdentifiers:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;
  NSObject *v12;
  NSString *clientIdentifier;
  NSString *v14;
  id v15;
  _QWORD v16[4];
  id v17;
  _QWORD v18[4];
  id v19;
  uint8_t buf[4];
  NSString *v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  +[FLDaemon sharedInstance](FLDaemon, "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = MEMORY[0x1E0C809B0];
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __82__FLFollowUpController_clearPendingFollowUpItemsWithUniqueIdentifiers_completion___block_invoke;
  v18[3] = &unk_1E6F1E420;
  v10 = v7;
  v19 = v10;
  objc_msgSend(v8, "daemonWithErrorHandler:", v18);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  _FLLogSystem();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    clientIdentifier = self->_clientIdentifier;
    *(_DWORD *)buf = 138412546;
    v21 = clientIdentifier;
    v22 = 2112;
    v23 = v6;
    _os_log_impl(&dword_1B8D53000, v12, OS_LOG_TYPE_DEFAULT, "Asking daemon server to clear pending items with identifier: %@, uniqueIdentifiers: %@", buf, 0x16u);
  }

  v14 = self->_clientIdentifier;
  v16[0] = v9;
  v16[1] = 3221225472;
  v16[2] = __82__FLFollowUpController_clearPendingFollowUpItemsWithUniqueIdentifiers_completion___block_invoke_16;
  v16[3] = &unk_1E6F1E448;
  v17 = v10;
  v15 = v10;
  objc_msgSend(v11, "clearPendingFollowUpItemsForClientIdentifier:uniqueIdentifiers:completion:", v14, v6, v16);

}

void __82__FLFollowUpController_clearPendingFollowUpItemsWithUniqueIdentifiers_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  _FLLogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __47__FLFollowUpController_postFollowUpItem_error___block_invoke_cold_1();

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __82__FLFollowUpController_clearPendingFollowUpItemsWithUniqueIdentifiers_completion___block_invoke_16(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  int v9;
  void *v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  _FLLogSystem();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138412546;
    v10 = v7;
    v11 = 2112;
    v12 = v5;
    _os_log_impl(&dword_1B8D53000, v6, OS_LOG_TYPE_DEFAULT, "Cleared pending follow up item identifiers with success: %@, error: %@", (uint8_t *)&v9, 0x16u);

  }
  v8 = *(_QWORD *)(a1 + 32);
  if (v8)
    (*(void (**)(uint64_t, uint64_t, id))(v8 + 16))(v8, a2, v5);

}

- (void)updateBadgesForTimer
{
  void *v2;
  void *v3;
  NSObject *v4;
  uint8_t v5[16];

  +[FLDaemon sharedInstance](FLDaemon, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "daemonWithErrorHandler:", &__block_literal_global_4);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  _FLLogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_1B8D53000, v4, OS_LOG_TYPE_DEFAULT, "Asking daemon server to update badge counts", v5, 2u);
  }

  objc_msgSend(v3, "updateBadgesForTimer");
}

void __44__FLFollowUpController_updateBadgesForTimer__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  _FLLogSystem();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __47__FLFollowUpController_postFollowUpItem_error___block_invoke_cold_1();

}

- (void)_postHSA2LoginNotification:(id)a3 completion:(id)a4
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  id v9;
  void *v10;
  NSObject *v11;
  id v12;
  _QWORD v13[4];
  id v14;
  _QWORD v15[4];
  id v16;
  uint8_t buf[4];
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  +[FLDaemon sharedInstance](FLDaemon, "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x1E0C809B0];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __62__FLFollowUpController__postHSA2LoginNotification_completion___block_invoke;
  v15[3] = &unk_1E6F1E420;
  v9 = v6;
  v16 = v9;
  objc_msgSend(v7, "daemonWithErrorHandler:", v15);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  _FLLogSystem();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v18 = v5;
    _os_log_impl(&dword_1B8D53000, v11, OS_LOG_TYPE_DEFAULT, "Asking daemon server to post HSA2 login notification: %@", buf, 0xCu);
  }

  v13[0] = v8;
  v13[1] = 3221225472;
  v13[2] = __62__FLFollowUpController__postHSA2LoginNotification_completion___block_invoke_17;
  v13[3] = &unk_1E6F1E470;
  v14 = v9;
  v12 = v9;
  objc_msgSend(v10, "postHSA2LoginNotification:completion:", v5, v13);

}

void __62__FLFollowUpController__postHSA2LoginNotification_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  _FLLogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __47__FLFollowUpController_postFollowUpItem_error___block_invoke_cold_1();

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __62__FLFollowUpController__postHSA2LoginNotification_completion___block_invoke_17(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  _FLLogSystem();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 134218242;
    v9 = a2;
    v10 = 2112;
    v11 = v5;
    _os_log_impl(&dword_1B8D53000, v6, OS_LOG_TYPE_DEFAULT, "Posted HSA2 login notification with response: %lu, error: %@", (uint8_t *)&v8, 0x16u);
  }

  v7 = *(_QWORD *)(a1 + 32);
  if (v7)
    (*(void (**)(uint64_t, uint64_t, id))(v7 + 16))(v7, a2, v5);

}

- (void)_postHSA2PasswordChangeForAppleID:(id)a3 completion:(id)a4
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  id v9;
  void *v10;
  NSObject *v11;
  id v12;
  _QWORD v13[4];
  id v14;
  _QWORD v15[4];
  id v16;
  uint8_t buf[4];
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  +[FLDaemon sharedInstance](FLDaemon, "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x1E0C809B0];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __69__FLFollowUpController__postHSA2PasswordChangeForAppleID_completion___block_invoke;
  v15[3] = &unk_1E6F1E420;
  v9 = v6;
  v16 = v9;
  objc_msgSend(v7, "daemonWithErrorHandler:", v15);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  _FLLogSystem();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v18 = v5;
    _os_log_impl(&dword_1B8D53000, v11, OS_LOG_TYPE_DEFAULT, "Asking daemon server to post HSA2 password change notification for Apple ID: %@", buf, 0xCu);
  }

  v13[0] = v8;
  v13[1] = 3221225472;
  v13[2] = __69__FLFollowUpController__postHSA2PasswordChangeForAppleID_completion___block_invoke_18;
  v13[3] = &unk_1E6F1E470;
  v14 = v9;
  v12 = v9;
  objc_msgSend(v10, "postHSA2PasswordChangeForAppleID:completion:", v5, v13);

}

void __69__FLFollowUpController__postHSA2PasswordChangeForAppleID_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  _FLLogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __47__FLFollowUpController_postFollowUpItem_error___block_invoke_cold_1();

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __69__FLFollowUpController__postHSA2PasswordChangeForAppleID_completion___block_invoke_18(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  _FLLogSystem();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 134218242;
    v9 = a2;
    v10 = 2112;
    v11 = v5;
    _os_log_impl(&dword_1B8D53000, v6, OS_LOG_TYPE_DEFAULT, "Posted HSA2 password change notification with response: %lu, error: %@", (uint8_t *)&v8, 0x16u);
  }

  v7 = *(_QWORD *)(a1 + 32);
  if (v7)
    (*(void (**)(uint64_t, uint64_t, id))(v7 + 16))(v7, a2, v5);

}

- (void)_postHSA2LoginCode:(id)a3 withNotification:(id)a4 completion:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  NSObject *v12;
  id v13;
  _QWORD v14[4];
  id v15;
  uint8_t buf[4];
  id v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  +[FLDaemon sharedInstance](FLDaemon, "sharedInstance");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "daemonWithErrorHandler:", &__block_literal_global_19);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  _FLLogSystem();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138478083;
    v17 = v7;
    v18 = 2112;
    v19 = v8;
    _os_log_impl(&dword_1B8D53000, v12, OS_LOG_TYPE_DEFAULT, "Asking daemon server to post HSA2 login code notification with number: %{private}@, notification: %@", buf, 0x16u);
  }

  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __71__FLFollowUpController__postHSA2LoginCode_withNotification_completion___block_invoke_20;
  v14[3] = &unk_1E6F1E470;
  v15 = v9;
  v13 = v9;
  objc_msgSend(v11, "postHSA2LoginCode:withNotification:completion:", v7, v8, v14);

}

void __71__FLFollowUpController__postHSA2LoginCode_withNotification_completion___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  _FLLogSystem();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __71__FLFollowUpController__postHSA2LoginCode_withNotification_completion___block_invoke_cold_1();

}

void __71__FLFollowUpController__postHSA2LoginCode_withNotification_completion___block_invoke_20(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  _FLLogSystem();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 134218242;
    v9 = a2;
    v10 = 2112;
    v11 = v5;
    _os_log_impl(&dword_1B8D53000, v6, OS_LOG_TYPE_DEFAULT, "Posted HSA2 login code notification with response: %lu, error: %@", (uint8_t *)&v8, 0x16u);
  }

  v7 = *(_QWORD *)(a1 + 32);
  if (v7)
    (*(void (**)(uint64_t, uint64_t, id))(v7 + 16))(v7, a2, v5);

}

- (void)_tearDownHSA2LoginNotificationWithPushMessageID:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  NSObject *v6;
  int v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  +[FLDaemon sharedInstance](FLDaemon, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "daemonWithErrorHandler:", &__block_literal_global_21);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  _FLLogSystem();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 138412290;
    v8 = v3;
    _os_log_impl(&dword_1B8D53000, v6, OS_LOG_TYPE_DEFAULT, "Tearing down HSA2 login notification with identifier: %@", (uint8_t *)&v7, 0xCu);
  }

  objc_msgSend(v5, "tearDownHSA2LoginNotificationWithPushMessageID:", v3);
}

void __72__FLFollowUpController__tearDownHSA2LoginNotificationWithPushMessageID___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  _FLLogSystem();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __72__FLFollowUpController__tearDownHSA2LoginNotificationWithPushMessageID___block_invoke_cold_1();

}

- (void)_postHSA2PasswordResetNotification:(id)a3 completion:(id)a4
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  id v9;
  void *v10;
  NSObject *v11;
  id v12;
  _QWORD v13[4];
  id v14;
  _QWORD v15[4];
  id v16;
  uint8_t buf[4];
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  +[FLDaemon sharedInstance](FLDaemon, "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x1E0C809B0];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __70__FLFollowUpController__postHSA2PasswordResetNotification_completion___block_invoke;
  v15[3] = &unk_1E6F1E420;
  v9 = v6;
  v16 = v9;
  objc_msgSend(v7, "daemonWithErrorHandler:", v15);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  _FLLogSystem();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v18 = v5;
    _os_log_impl(&dword_1B8D53000, v11, OS_LOG_TYPE_DEFAULT, "Asking daemon server to post HSA2 password reset notification: %@", buf, 0xCu);
  }

  v13[0] = v8;
  v13[1] = 3221225472;
  v13[2] = __70__FLFollowUpController__postHSA2PasswordResetNotification_completion___block_invoke_22;
  v13[3] = &unk_1E6F1E448;
  v14 = v9;
  v12 = v9;
  objc_msgSend(v10, "postHSA2PasswordResetNotification:completion:", v5, v13);

}

void __70__FLFollowUpController__postHSA2PasswordResetNotification_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  _FLLogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __47__FLFollowUpController_postFollowUpItem_error___block_invoke_cold_1();

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __70__FLFollowUpController__postHSA2PasswordResetNotification_completion___block_invoke_22(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  int v9;
  void *v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  _FLLogSystem();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138412546;
    v10 = v7;
    v11 = 2112;
    v12 = v5;
    _os_log_impl(&dword_1B8D53000, v6, OS_LOG_TYPE_DEFAULT, "Posted HSA2 password reset notification with success: %@, error: %@", (uint8_t *)&v9, 0x16u);

  }
  v8 = *(_QWORD *)(a1 + 32);
  if (v8)
    (*(void (**)(uint64_t, uint64_t, id))(v8 + 16))(v8, a2, v5);

}

- (void)_didActivateHSA2LoginNotification:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  NSObject *v6;
  int v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  +[FLDaemon sharedInstance](FLDaemon, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "daemonWithErrorHandler:", &__block_literal_global_23);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  _FLLogSystem();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 138412290;
    v8 = v3;
    _os_log_impl(&dword_1B8D53000, v6, OS_LOG_TYPE_DEFAULT, "Notifying daemon of HSA2 login notification activation: %@", (uint8_t *)&v7, 0xCu);
  }

  objc_msgSend(v5, "didActivateHSA2LoginNotificationNotification:", v3);
}

void __58__FLFollowUpController__didActivateHSA2LoginNotification___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  _FLLogSystem();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __58__FLFollowUpController__didActivateHSA2LoginNotification___block_invoke_cold_1();

}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  void *v5;
  id v6;
  void *v7;
  id WeakRetained;

  v5 = (void *)MEMORY[0x1E0CB3B50];
  v6 = a4;
  objc_msgSend(v5, "interfaceWithProtocol:", &unk_1EF1E5EC0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setExportedInterface:", v7);
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(v6, "setExportedObject:", WeakRetained);

  objc_msgSend(v6, "resume");
  return 1;
}

- (FLFollowUpControllerDelegate)delegate
{
  return (FLFollowUpControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_listener, 0);
  objc_storeStrong((id *)&self->_machServiceName, 0);
  objc_storeStrong((id *)&self->_clientIdentifier, 0);
}

- (void)postFollowUpItem:(uint64_t)a3 error:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_1B8D53000, a1, a3, "nil title on FLFollowUpItem, please ensure your items have a title, even if its a fallback", a5, a6, a7, a8, 0);
}

void __47__FLFollowUpController_postFollowUpItem_error___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_1(&dword_1B8D53000, v0, v1, "Remote daemon server returned an error: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

void __71__FLFollowUpController__postHSA2LoginCode_withNotification_completion___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_1(&dword_1B8D53000, v0, v1, "Failed to post login code: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

void __72__FLFollowUpController__tearDownHSA2LoginNotificationWithPushMessageID___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_1(&dword_1B8D53000, v0, v1, "Error communicating with daemon while tearing down HSA2 login notification: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

void __58__FLFollowUpController__didActivateHSA2LoginNotification___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_1(&dword_1B8D53000, v0, v1, "Error communicating with daemon while activating HSA2 login notification: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

@end
