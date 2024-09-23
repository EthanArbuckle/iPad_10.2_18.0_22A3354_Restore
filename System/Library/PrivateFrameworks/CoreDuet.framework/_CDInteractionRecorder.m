@implementation _CDInteractionRecorder

+ (id)interactionRecorder
{
  if (interactionRecorder_onceToken != -1)
    dispatch_once(&interactionRecorder_onceToken, &__block_literal_global_69);
  return (id)interactionRecorder_recorder;
}

- (_CDInteractionRecorder)initWithServiceName:(id)a3
{
  id v4;
  _CDInteractionRecorder *v5;
  _CDInteractionRecorder *v6;
  uint64_t v7;
  _CDInteractionPolicies *policies;
  uint64_t v9;
  NSXPCConnection *connection;
  void *v11;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)_CDInteractionRecorder;
  v5 = -[_CDInteractionRecorder init](&v13, sel_init);
  v6 = v5;
  if (v5)
  {
    *(_WORD *)&v5->_enforceDataLimits = 257;
    +[_CDInteractionPolicies interactionPolicies](_CDInteractionPolicies, "interactionPolicies");
    v7 = objc_claimAutoreleasedReturnValue();
    policies = v6->_policies;
    v6->_policies = (_CDInteractionPolicies *)v7;

    v9 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B38]), "initWithMachServiceName:options:", v4, 4096);
    connection = v6->_connection;
    v6->_connection = (NSXPCConnection *)v9;

    _CDInteractionNSXPCInterface();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSXPCConnection setRemoteObjectInterface:](v6->_connection, "setRemoteObjectInterface:", v11);

    -[NSXPCConnection resume](v6->_connection, "resume");
  }

  return v6;
}

- (void)dealloc
{
  objc_super v3;

  -[NSXPCConnection invalidate](self->_connection, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)_CDInteractionRecorder;
  -[_CDInteractionRecorder dealloc](&v3, sel_dealloc);
}

- (BOOL)recordInteractions:(id)a3 synchronous:(BOOL)a4 completionHandler:(id)a5
{
  _BOOL4 v6;
  id v8;
  unsigned __int8 v9;
  NSObject *v10;
  unsigned __int8 v11;
  NSObject *v12;
  uint64_t v13;
  NSObject *v14;
  NSObject *v15;
  uint64_t v16;
  BOOL v17;
  uint64_t v18;
  void *v19;
  id v20;
  void (**v21)(void);
  void *v23;
  void (**v24)(void);
  void *v25;
  _QWORD v26[4];
  id v27;
  _CDInteractionRecorder *v28;
  id v29;
  __int128 *p_buf;
  _QWORD v31[4];
  void (**v32)(void);
  _QWORD block[5];
  id v34;
  __int128 *v35;
  uint64_t *v36;
  uint64_t v37;
  uint64_t *v38;
  uint64_t v39;
  char v40;
  uint8_t v41[4];
  uint64_t v42;
  __int128 buf;
  uint64_t v44;
  uint64_t (*v45)(uint64_t, uint64_t);
  void (*v46)(uint64_t);
  id v47;
  uint64_t v48;

  v6 = a4;
  v48 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v24 = (void (**)(void))a5;
  v25 = v8;
  -[_CDInteractionPolicies filterAndModifyInteractionsWithPolicies:enforceDataLimits:enforcePrivacy:](self->_policies, "filterAndModifyInteractionsWithPolicies:enforceDataLimits:enforcePrivacy:", v8, -[_CDInteractionRecorder enforceDataLimits](self, "enforceDataLimits"), -[_CDInteractionRecorder enforcePrivacy](self, "enforcePrivacy"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  if (recordInteractions_synchronous_completionHandler___pasOnceToken5 != -1)
  {
    dispatch_once(&recordInteractions_synchronous_completionHandler___pasOnceToken5, &__block_literal_global_8_0);
    if (v6)
      goto LABEL_3;
LABEL_21:
    v18 = MEMORY[0x1E0C809B0];
    v31[0] = MEMORY[0x1E0C809B0];
    v31[1] = 3221225472;
    v31[2] = __75___CDInteractionRecorder_recordInteractions_synchronous_completionHandler___block_invoke_16;
    v31[3] = &unk_1E26E67E8;
    v32 = v24;
    v19 = (void *)objc_msgSend(v31, "copy", v23);
    *(_QWORD *)&buf = 0;
    *((_QWORD *)&buf + 1) = &buf;
    v44 = 0x2050000000;
    v45 = 0;
    v26[0] = v18;
    v26[1] = 3221225472;
    v26[2] = __75___CDInteractionRecorder_recordInteractions_synchronous_completionHandler___block_invoke_2_18;
    v26[3] = &unk_1E26E6810;
    p_buf = &buf;
    v27 = v25;
    v20 = v19;
    v28 = self;
    v29 = v20;
    v21 = (void (**)(void))objc_msgSend(v26, "copy");
    *(_QWORD *)(*((_QWORD *)&buf + 1) + 24) = v21;
    v21[2]();

    _Block_object_dispose(&buf, 8);
    v17 = 1;
    goto LABEL_22;
  }
  if (!v6)
    goto LABEL_21;
  do
LABEL_3:
    v9 = __ldaxr(recordInteractions_synchronous_completionHandler__flag);
  while (__stlxr(1u, recordInteractions_synchronous_completionHandler__flag));
  if ((v9 & 1) != 0)
  {
    do
    {
      +[_CDLogging interactionChannel](_CDLogging, "interactionChannel", v23);
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(buf) = 0;
        _os_log_impl(&dword_18DDBE000, v10, OS_LOG_TYPE_DEFAULT, "[sync path] It's not our turn yet...", (uint8_t *)&buf, 2u);
      }

      dispatch_sync((dispatch_queue_t)recordInteractions_synchronous_completionHandler__queue, &__block_literal_global_12_0);
      dispatch_group_wait((dispatch_group_t)recordInteractions_synchronous_completionHandler__group, 0xFFFFFFFFFFFFFFFFLL);
      do
        v11 = __ldaxr(recordInteractions_synchronous_completionHandler__flag);
      while (__stlxr(1u, recordInteractions_synchronous_completionHandler__flag));
    }
    while ((v11 & 1) != 0);
  }
  dispatch_group_enter((dispatch_group_t)recordInteractions_synchronous_completionHandler__group);
  +[_CDLogging interactionChannel](_CDLogging, "interactionChannel");
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    v13 = objc_msgSend(v8, "count");
    LODWORD(buf) = 134217984;
    *(_QWORD *)((char *)&buf + 4) = v13;
    _os_log_impl(&dword_18DDBE000, v12, OS_LOG_TYPE_DEFAULT, "[sync path] beginning recordInteractions (%tu interactions)", (uint8_t *)&buf, 0xCu);
  }

  v37 = 0;
  v38 = &v37;
  v39 = 0x2020000000;
  v40 = 0;
  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v44 = 0x3032000000;
  v45 = __Block_byref_object_copy__23;
  v46 = __Block_byref_object_dispose__23;
  v47 = 0;
  v14 = recordInteractions_synchronous_completionHandler__queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __75___CDInteractionRecorder_recordInteractions_synchronous_completionHandler___block_invoke_13;
  block[3] = &unk_1E26E67C0;
  block[4] = self;
  v35 = &buf;
  v34 = v23;
  v36 = &v37;
  dispatch_sync(v14, block);
  if (*((_BYTE *)v38 + 24))
  {
    +[_CDLogging interactionChannel](_CDLogging, "interactionChannel");
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      v16 = objc_msgSend(v8, "count");
      *(_DWORD *)v41 = 134217984;
      v42 = v16;
      _os_log_impl(&dword_18DDBE000, v15, OS_LOG_TYPE_DEFAULT, "[sync path] successfully sent %tu interactions to coreduet daemon", v41, 0xCu);
    }
  }
  else
  {
    +[_CDLogging interactionChannel](_CDLogging, "interactionChannel");
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      -[_CDInteractionRecorder recordInteractions:synchronous:completionHandler:].cold.1((uint64_t)&buf + 8, (uint64_t)v41, objc_msgSend(v8, "count"), v15);
  }

  if (v24)
    v24[2]();
  v17 = *((_BYTE *)v38 + 24) != 0;

  _Block_object_dispose(&buf, 8);
  _Block_object_dispose(&v37, 8);
LABEL_22:

  return v17;
}

- (BOOL)recordInteraction:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v4 = (void *)MEMORY[0x1E0C99D20];
  v5 = a3;
  objc_msgSend(v4, "arrayWithObjects:count:", &v8, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(self) = -[_CDInteractionRecorder recordInteractions:](self, "recordInteractions:", v6, v8, v9);
  return (char)self;
}

- (BOOL)recordInteractions:(id)a3
{
  id v4;
  NSObject *v5;
  os_activity_scope_state_s v7;

  v4 = a3;
  v5 = _os_activity_create(&dword_18DDBE000, "Duet: recordInteractions sync", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  v7.opaque[0] = 0;
  v7.opaque[1] = 0;
  os_activity_scope_enter(v5, &v7);
  os_activity_scope_leave(&v7);

  LOBYTE(self) = -[_CDInteractionRecorder recordInteractions:synchronous:completionHandler:](self, "recordInteractions:synchronous:completionHandler:", v4, 1, 0);
  return (char)self;
}

- (void)recordInteractions:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  os_activity_scope_state_s v9;

  v6 = a4;
  v7 = a3;
  v8 = _os_activity_create(&dword_18DDBE000, "Duet: recordInteractions async", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  v9.opaque[0] = 0;
  v9.opaque[1] = 0;
  os_activity_scope_enter(v8, &v9);
  os_activity_scope_leave(&v9);

  -[_CDInteractionRecorder recordInteractions:synchronous:completionHandler:](self, "recordInteractions:synchronous:completionHandler:", v7, 0, v6);
}

- (void)queryInteractionsUsingPredicate:(id)a3 synchronous:(BOOL)a4 sortDescriptors:(id)a5 limit:(unint64_t)a6 completionHandler:(id)a7
{
  _BOOL4 v9;
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  NSXPCConnection *connection;
  void *v18;
  _QWORD v19[4];
  id v20;

  v9 = a4;
  v12 = a7;
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __110___CDInteractionRecorder_queryInteractionsUsingPredicate_synchronous_sortDescriptors_limit_completionHandler___block_invoke;
  v19[3] = &unk_1E26E2FE8;
  v13 = v12;
  v20 = v13;
  v14 = a5;
  v15 = a3;
  v16 = (void *)MEMORY[0x193FEEAF4](v19);
  connection = self->_connection;
  if (v9)
    -[NSXPCConnection synchronousRemoteObjectProxyWithErrorHandler:](connection, "synchronousRemoteObjectProxyWithErrorHandler:", v16);
  else
    -[NSXPCConnection remoteObjectProxyWithErrorHandler:](connection, "remoteObjectProxyWithErrorHandler:", v16);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "queryInteractionsUsingPredicate:sortDescriptors:limit:reply:", v15, v14, a6, v13);

}

- (id)queryInteractionsUsingPredicate:(id)a3 sortDescriptors:(id)a4 limit:(unint64_t)a5 error:(id *)a6
{
  id v10;
  id v11;
  NSObject *v12;
  id v13;
  _QWORD v15[6];
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;
  os_activity_scope_state_s state;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;

  v10 = a3;
  v11 = a4;
  v12 = _os_activity_create(&dword_18DDBE000, "Duet: queryInteractionsUsingPredicate sync", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v12, &state);
  os_activity_scope_leave(&state);

  state.opaque[0] = 0;
  state.opaque[1] = (uint64_t)&state;
  v23 = 0x3032000000;
  v24 = __Block_byref_object_copy__23;
  v25 = __Block_byref_object_dispose__23;
  v26 = 0;
  v16 = 0;
  v17 = &v16;
  v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__23;
  v20 = __Block_byref_object_dispose__23;
  v21 = 0;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __86___CDInteractionRecorder_queryInteractionsUsingPredicate_sortDescriptors_limit_error___block_invoke;
  v15[3] = &unk_1E26E6838;
  v15[4] = &state;
  v15[5] = &v16;
  -[_CDInteractionRecorder queryInteractionsUsingPredicate:synchronous:sortDescriptors:limit:completionHandler:](self, "queryInteractionsUsingPredicate:synchronous:sortDescriptors:limit:completionHandler:", v10, 1, v11, a5, v15);
  if (a6)
    *a6 = objc_retainAutorelease((id)v17[5]);
  v13 = *(id *)(state.opaque[1] + 40);
  _Block_object_dispose(&v16, 8);

  _Block_object_dispose(&state, 8);
  return v13;
}

- (void)queryInteractionsUsingPredicate:(id)a3 sortDescriptors:(id)a4 limit:(unint64_t)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  os_activity_scope_state_s v14;

  v10 = a3;
  v11 = a4;
  v12 = a6;
  v13 = _os_activity_create(&dword_18DDBE000, "Duet: queryInteractionsUsingPredicate async", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  v14.opaque[0] = 0;
  v14.opaque[1] = 0;
  os_activity_scope_enter(v13, &v14);
  os_activity_scope_leave(&v14);

  if (v12)
    -[_CDInteractionRecorder queryInteractionsUsingPredicate:synchronous:sortDescriptors:limit:completionHandler:](self, "queryInteractionsUsingPredicate:synchronous:sortDescriptors:limit:completionHandler:", v10, 0, v11, a5, v12);

}

- (void)countInteractionsUsingPredicate:(id)a3 synchronous:(BOOL)a4 completionHandler:(id)a5
{
  _BOOL4 v5;
  id v8;
  id v9;
  id v10;
  void *v11;
  NSXPCConnection *connection;
  void *v13;
  _QWORD v14[4];
  id v15;

  v5 = a4;
  v8 = a5;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __88___CDInteractionRecorder_countInteractionsUsingPredicate_synchronous_completionHandler___block_invoke;
  v14[3] = &unk_1E26E2FE8;
  v9 = v8;
  v15 = v9;
  v10 = a3;
  v11 = (void *)MEMORY[0x193FEEAF4](v14);
  connection = self->_connection;
  if (v5)
    -[NSXPCConnection synchronousRemoteObjectProxyWithErrorHandler:](connection, "synchronousRemoteObjectProxyWithErrorHandler:", v11);
  else
    -[NSXPCConnection remoteObjectProxyWithErrorHandler:](connection, "remoteObjectProxyWithErrorHandler:", v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "countInteractionsUsingPredicate:reply:", v10, v9);

}

- (unint64_t)countInteractionsUsingPredicate:(id)a3 error:(id *)a4
{
  id v6;
  NSObject *v7;
  unint64_t v8;
  _QWORD v10[6];
  os_activity_scope_state_s state;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  id v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;

  v6 = a3;
  v7 = _os_activity_create(&dword_18DDBE000, "Duet: countInteractionsUsingPredicate sync", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v7, &state);
  os_activity_scope_leave(&state);

  v16 = 0;
  v17 = &v16;
  v18 = 0x2020000000;
  v19 = 0;
  state.opaque[0] = 0;
  state.opaque[1] = (uint64_t)&state;
  v12 = 0x3032000000;
  v13 = __Block_byref_object_copy__23;
  v14 = __Block_byref_object_dispose__23;
  v15 = 0;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __64___CDInteractionRecorder_countInteractionsUsingPredicate_error___block_invoke;
  v10[3] = &unk_1E26E6860;
  v10[4] = &v16;
  v10[5] = &state;
  -[_CDInteractionRecorder countInteractionsUsingPredicate:synchronous:completionHandler:](self, "countInteractionsUsingPredicate:synchronous:completionHandler:", v6, 1, v10);
  if (a4)
    *a4 = objc_retainAutorelease(*(id *)(state.opaque[1] + 40));
  v8 = v17[3];
  _Block_object_dispose(&state, 8);

  _Block_object_dispose(&v16, 8);
  return v8;
}

- (void)countInteractionsUsingPredicate:(id)a3 completionHandler:(id)a4
{
  id v6;
  NSObject *v7;
  os_activity_scope_state_s v8;

  v6 = a3;
  v7 = _os_activity_create(&dword_18DDBE000, "Duet: countInteractionsUsingPredicate async", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  v8.opaque[0] = 0;
  v8.opaque[1] = 0;
  os_activity_scope_enter(v7, &v8);
  os_activity_scope_leave(&v8);

  if (a4)
    -[_CDInteractionRecorder countInteractionsUsingPredicate:synchronous:completionHandler:](self, "countInteractionsUsingPredicate:synchronous:completionHandler:", v6, 0, 0);

}

- (id)queryInteractionsUsingPredicate:(id)a3 sortDescriptors:(id)a4 limit:(unint64_t)a5
{
  return -[_CDInteractionRecorder queryInteractionsUsingPredicate:sortDescriptors:limit:error:](self, "queryInteractionsUsingPredicate:sortDescriptors:limit:error:", a3, a4, a5, 0);
}

- (void)queryContactsUsingPredicate:(id)a3 synchronous:(BOOL)a4 sortDescriptors:(id)a5 limit:(unint64_t)a6 completionHandler:(id)a7
{
  _BOOL4 v9;
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  NSXPCConnection *connection;
  void *v18;
  _QWORD v19[4];
  id v20;

  v9 = a4;
  v12 = a7;
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __106___CDInteractionRecorder_queryContactsUsingPredicate_synchronous_sortDescriptors_limit_completionHandler___block_invoke;
  v19[3] = &unk_1E26E2FE8;
  v13 = v12;
  v20 = v13;
  v14 = a5;
  v15 = a3;
  v16 = (void *)MEMORY[0x193FEEAF4](v19);
  connection = self->_connection;
  if (v9)
    -[NSXPCConnection synchronousRemoteObjectProxyWithErrorHandler:](connection, "synchronousRemoteObjectProxyWithErrorHandler:", v16);
  else
    -[NSXPCConnection remoteObjectProxyWithErrorHandler:](connection, "remoteObjectProxyWithErrorHandler:", v16);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "queryContactsUsingPredicate:sortDescriptors:limit:reply:", v15, v14, a6, v13);

}

- (id)queryContactsUsingPredicate:(id)a3 sortDescriptors:(id)a4 limit:(unint64_t)a5 error:(id *)a6
{
  id v10;
  id v11;
  NSObject *v12;
  id v13;
  _QWORD v15[6];
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;
  os_activity_scope_state_s state;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;

  v10 = a3;
  v11 = a4;
  v12 = _os_activity_create(&dword_18DDBE000, "Duet: queryContactsUsingPredicate sync", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v12, &state);
  os_activity_scope_leave(&state);

  state.opaque[0] = 0;
  state.opaque[1] = (uint64_t)&state;
  v23 = 0x3032000000;
  v24 = __Block_byref_object_copy__23;
  v25 = __Block_byref_object_dispose__23;
  v26 = 0;
  v16 = 0;
  v17 = &v16;
  v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__23;
  v20 = __Block_byref_object_dispose__23;
  v21 = 0;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __82___CDInteractionRecorder_queryContactsUsingPredicate_sortDescriptors_limit_error___block_invoke;
  v15[3] = &unk_1E26E6838;
  v15[4] = &state;
  v15[5] = &v16;
  -[_CDInteractionRecorder queryContactsUsingPredicate:synchronous:sortDescriptors:limit:completionHandler:](self, "queryContactsUsingPredicate:synchronous:sortDescriptors:limit:completionHandler:", v10, 1, v11, a5, v15);
  if (a6)
    *a6 = objc_retainAutorelease((id)v17[5]);
  v13 = *(id *)(state.opaque[1] + 40);
  _Block_object_dispose(&v16, 8);

  _Block_object_dispose(&state, 8);
  return v13;
}

- (void)queryContactsUsingPredicate:(id)a3 sortDescriptors:(id)a4 limit:(unint64_t)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  os_activity_scope_state_s v14;

  v10 = a3;
  v11 = a4;
  v12 = a6;
  v13 = _os_activity_create(&dword_18DDBE000, "Duet: queryContactsUsingPredicate async", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  v14.opaque[0] = 0;
  v14.opaque[1] = 0;
  os_activity_scope_enter(v13, &v14);
  os_activity_scope_leave(&v14);

  if (v12)
    -[_CDInteractionRecorder queryContactsUsingPredicate:synchronous:sortDescriptors:limit:completionHandler:](self, "queryContactsUsingPredicate:synchronous:sortDescriptors:limit:completionHandler:", v10, 0, v11, a5, v12);

}

- (void)countContactsUsingPredicate:(id)a3 synchronous:(BOOL)a4 completionHandler:(id)a5
{
  _BOOL4 v5;
  id v8;
  id v9;
  id v10;
  void *v11;
  NSXPCConnection *connection;
  void *v13;
  _QWORD v14[4];
  id v15;

  v5 = a4;
  v8 = a5;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __84___CDInteractionRecorder_countContactsUsingPredicate_synchronous_completionHandler___block_invoke;
  v14[3] = &unk_1E26E2FE8;
  v9 = v8;
  v15 = v9;
  v10 = a3;
  v11 = (void *)MEMORY[0x193FEEAF4](v14);
  connection = self->_connection;
  if (v5)
    -[NSXPCConnection synchronousRemoteObjectProxyWithErrorHandler:](connection, "synchronousRemoteObjectProxyWithErrorHandler:", v11);
  else
    -[NSXPCConnection remoteObjectProxyWithErrorHandler:](connection, "remoteObjectProxyWithErrorHandler:", v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "countContactsUsingPredicate:reply:", v10, v9);

}

- (unint64_t)countContactsUsingPredicate:(id)a3 error:(id *)a4
{
  id v6;
  NSObject *v7;
  unint64_t v8;
  _QWORD v10[6];
  os_activity_scope_state_s state;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  id v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;

  v6 = a3;
  v7 = _os_activity_create(&dword_18DDBE000, "Duet: countContactsUsingPredicate sync", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v7, &state);
  os_activity_scope_leave(&state);

  v16 = 0;
  v17 = &v16;
  v18 = 0x2020000000;
  v19 = 0;
  state.opaque[0] = 0;
  state.opaque[1] = (uint64_t)&state;
  v12 = 0x3032000000;
  v13 = __Block_byref_object_copy__23;
  v14 = __Block_byref_object_dispose__23;
  v15 = 0;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __60___CDInteractionRecorder_countContactsUsingPredicate_error___block_invoke;
  v10[3] = &unk_1E26E6860;
  v10[4] = &v16;
  v10[5] = &state;
  -[_CDInteractionRecorder countContactsUsingPredicate:synchronous:completionHandler:](self, "countContactsUsingPredicate:synchronous:completionHandler:", v6, 1, v10);
  if (a4)
    *a4 = objc_retainAutorelease(*(id *)(state.opaque[1] + 40));
  v8 = v17[3];
  _Block_object_dispose(&state, 8);

  _Block_object_dispose(&v16, 8);
  return v8;
}

- (void)countContactsUsingPredicate:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  os_activity_scope_state_s v9;

  v6 = a3;
  v7 = a4;
  v8 = _os_activity_create(&dword_18DDBE000, "Duet: countContactsUsingPredicate async", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  v9.opaque[0] = 0;
  v9.opaque[1] = 0;
  os_activity_scope_enter(v8, &v9);
  os_activity_scope_leave(&v9);

  if (v7)
    -[_CDInteractionRecorder countContactsUsingPredicate:synchronous:completionHandler:](self, "countContactsUsingPredicate:synchronous:completionHandler:", v6, 0, v7);

}

- (void)deleteInteractionsMatchingPredicate:(id)a3 synchronous:(BOOL)a4 sortDescriptors:(id)a5 limit:(unint64_t)a6 debuggingReason:(id)a7 completionHandler:(id)a8
{
  _BOOL4 v10;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  NSXPCConnection *connection;
  void *v19;
  _QWORD v20[4];
  id v21;

  v10 = a4;
  v13 = a8;
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __130___CDInteractionRecorder_deleteInteractionsMatchingPredicate_synchronous_sortDescriptors_limit_debuggingReason_completionHandler___block_invoke;
  v20[3] = &unk_1E26E2FE8;
  v14 = v13;
  v21 = v14;
  v15 = a5;
  v16 = a3;
  v17 = (void *)MEMORY[0x193FEEAF4](v20);
  connection = self->_connection;
  if (v10)
    -[NSXPCConnection synchronousRemoteObjectProxyWithErrorHandler:](connection, "synchronousRemoteObjectProxyWithErrorHandler:", v17);
  else
    -[NSXPCConnection remoteObjectProxyWithErrorHandler:](connection, "remoteObjectProxyWithErrorHandler:", v17);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "deleteInteractionsMatchingPredicate:sortDescriptors:limit:reply:", v16, v15, a6, v14);

}

- (void)deleteInteractionsMatchingPredicate:(id)a3 sortDescriptors:(id)a4 limit:(unint64_t)a5 completionHandler:(id)a6
{
  -[_CDInteractionRecorder deleteInteractionsMatchingPredicate:sortDescriptors:limit:debuggingReason:completionHandler:](self, "deleteInteractionsMatchingPredicate:sortDescriptors:limit:debuggingReason:completionHandler:", a3, a4, a5, CFSTR("unspecified reason"), a6);
}

- (void)deleteInteractionsMatchingPredicate:(id)a3 sortDescriptors:(id)a4 limit:(unint64_t)a5 debuggingReason:(id)a6 completionHandler:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  NSObject *v16;
  os_activity_scope_state_s v17;

  v12 = a3;
  v13 = a4;
  v14 = a6;
  v15 = a7;
  v16 = _os_activity_create(&dword_18DDBE000, "Duet: deleteInteractionsMatchingPredicate async", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  v17.opaque[0] = 0;
  v17.opaque[1] = 0;
  os_activity_scope_enter(v16, &v17);
  os_activity_scope_leave(&v17);

  if (v15)
    -[_CDInteractionRecorder deleteInteractionsMatchingPredicate:synchronous:sortDescriptors:limit:debuggingReason:completionHandler:](self, "deleteInteractionsMatchingPredicate:synchronous:sortDescriptors:limit:debuggingReason:completionHandler:", v12, 0, v13, a5, v14, v15);

}

- (unint64_t)deleteInteractionsMatchingPredicate:(id)a3 sortDescriptors:(id)a4 limit:(unint64_t)a5 error:(id *)a6
{
  return -[_CDInteractionRecorder deleteInteractionsMatchingPredicate:sortDescriptors:limit:debuggingReason:error:](self, "deleteInteractionsMatchingPredicate:sortDescriptors:limit:debuggingReason:error:", a3, a4, a5, CFSTR("unspecified reason"), a6);
}

- (unint64_t)deleteInteractionsMatchingPredicate:(id)a3 sortDescriptors:(id)a4 limit:(unint64_t)a5 debuggingReason:(id)a6 error:(id *)a7
{
  id v12;
  id v13;
  id v14;
  NSObject *v15;
  unint64_t v16;
  _QWORD v18[6];
  os_activity_scope_state_s state;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t v27;

  v12 = a3;
  v13 = a4;
  v14 = a6;
  v15 = _os_activity_create(&dword_18DDBE000, "Duet: deleteInteractionsMatchingPredicate sync", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v15, &state);
  os_activity_scope_leave(&state);

  v24 = 0;
  v25 = &v24;
  v26 = 0x2020000000;
  v27 = 0;
  state.opaque[0] = 0;
  state.opaque[1] = (uint64_t)&state;
  v20 = 0x3032000000;
  v21 = __Block_byref_object_copy__23;
  v22 = __Block_byref_object_dispose__23;
  v23 = 0;
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __106___CDInteractionRecorder_deleteInteractionsMatchingPredicate_sortDescriptors_limit_debuggingReason_error___block_invoke;
  v18[3] = &unk_1E26E6860;
  v18[4] = &v24;
  v18[5] = &state;
  -[_CDInteractionRecorder deleteInteractionsMatchingPredicate:synchronous:sortDescriptors:limit:debuggingReason:completionHandler:](self, "deleteInteractionsMatchingPredicate:synchronous:sortDescriptors:limit:debuggingReason:completionHandler:", v12, 1, v13, a5, v14, v18);
  if (a7)
    *a7 = objc_retainAutorelease(*(id *)(state.opaque[1] + 40));
  v16 = v25[3];
  _Block_object_dispose(&state, 8);

  _Block_object_dispose(&v24, 8);
  return v16;
}

- (void)deleteInteractionsWithBundleId:(id)a3 synchronous:(BOOL)a4 completionHandler:(id)a5
{
  _BOOL4 v5;
  id v8;
  id v9;
  id v10;
  void *v11;
  NSXPCConnection *connection;
  void *v13;
  _QWORD v14[4];
  id v15;

  v5 = a4;
  v8 = a5;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __87___CDInteractionRecorder_deleteInteractionsWithBundleId_synchronous_completionHandler___block_invoke;
  v14[3] = &unk_1E26E2FE8;
  v9 = v8;
  v15 = v9;
  v10 = a3;
  v11 = (void *)MEMORY[0x193FEEAF4](v14);
  connection = self->_connection;
  if (v5)
    -[NSXPCConnection synchronousRemoteObjectProxyWithErrorHandler:](connection, "synchronousRemoteObjectProxyWithErrorHandler:", v11);
  else
    -[NSXPCConnection remoteObjectProxyWithErrorHandler:](connection, "remoteObjectProxyWithErrorHandler:", v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "deleteInteractionsWithBundleId:reply:", v10, v9);

}

- (void)deleteInteractionsWithBundleId:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  os_activity_scope_state_s v9;

  v6 = a3;
  v7 = a4;
  v8 = _os_activity_create(&dword_18DDBE000, "Duet: deleteInteractionsWithBundleId async", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  v9.opaque[0] = 0;
  v9.opaque[1] = 0;
  os_activity_scope_enter(v8, &v9);
  os_activity_scope_leave(&v9);

  if (v7)
    -[_CDInteractionRecorder deleteInteractionsWithBundleId:synchronous:completionHandler:](self, "deleteInteractionsWithBundleId:synchronous:completionHandler:", v6, 0, v7);

}

- (unint64_t)deleteInteractionsWithBundleId:(id)a3 error:(id *)a4
{
  id v6;
  NSObject *v7;
  unint64_t v8;
  _QWORD v10[6];
  os_activity_scope_state_s state;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  id v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;

  v6 = a3;
  v7 = _os_activity_create(&dword_18DDBE000, "Duet: deleteInteractionsWithBundleId sync", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v7, &state);
  os_activity_scope_leave(&state);

  v16 = 0;
  v17 = &v16;
  v18 = 0x2020000000;
  v19 = 0;
  state.opaque[0] = 0;
  state.opaque[1] = (uint64_t)&state;
  v12 = 0x3032000000;
  v13 = __Block_byref_object_copy__23;
  v14 = __Block_byref_object_dispose__23;
  v15 = 0;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __63___CDInteractionRecorder_deleteInteractionsWithBundleId_error___block_invoke;
  v10[3] = &unk_1E26E6860;
  v10[4] = &v16;
  v10[5] = &state;
  -[_CDInteractionRecorder deleteInteractionsWithBundleId:synchronous:completionHandler:](self, "deleteInteractionsWithBundleId:synchronous:completionHandler:", v6, 1, v10);
  if (a4)
    *a4 = objc_retainAutorelease(*(id *)(state.opaque[1] + 40));
  v8 = v17[3];
  _Block_object_dispose(&state, 8);

  _Block_object_dispose(&v16, 8);
  return v8;
}

- (void)deleteInteractionsWithBundleId:(id)a3 synchronous:(BOOL)a4 account:(id)a5 completionHandler:(id)a6
{
  _BOOL4 v7;
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  id v14;
  void *v15;
  NSXPCConnection *connection;
  void *v17;
  _QWORD v18[4];
  id v19;
  os_activity_scope_state_s state;

  v7 = a4;
  v10 = a6;
  v11 = a5;
  v12 = a3;
  v13 = _os_activity_create(&dword_18DDBE000, "Duet: deleteInteractionsWithBundleId account async", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v13, &state);
  os_activity_scope_leave(&state);

  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __95___CDInteractionRecorder_deleteInteractionsWithBundleId_synchronous_account_completionHandler___block_invoke;
  v18[3] = &unk_1E26E2FE8;
  v14 = v10;
  v19 = v14;
  v15 = (void *)MEMORY[0x193FEEAF4](v18);
  connection = self->_connection;
  if (v7)
    -[NSXPCConnection synchronousRemoteObjectProxyWithErrorHandler:](connection, "synchronousRemoteObjectProxyWithErrorHandler:", v15);
  else
    -[NSXPCConnection remoteObjectProxyWithErrorHandler:](connection, "remoteObjectProxyWithErrorHandler:", v15);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "deleteInteractionsWithBundleId:account:reply:", v12, v11, v14);

}

- (void)deleteInteractionsWithBundleId:(id)a3 account:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  os_activity_scope_state_s v12;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = _os_activity_create(&dword_18DDBE000, "Duet: deleteInteractionsWithBundleId account async", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  v12.opaque[0] = 0;
  v12.opaque[1] = 0;
  os_activity_scope_enter(v11, &v12);
  os_activity_scope_leave(&v12);

  if (v10)
    -[_CDInteractionRecorder deleteInteractionsWithBundleId:synchronous:account:completionHandler:](self, "deleteInteractionsWithBundleId:synchronous:account:completionHandler:", v8, 0, v9, v10);

}

- (unint64_t)deleteInteractionsWithBundleId:(id)a3 account:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  unint64_t v10;
  _QWORD v12[6];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t v22;

  v8 = a3;
  v9 = a4;
  v19 = 0;
  v20 = &v19;
  v21 = 0x2020000000;
  v22 = 0;
  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__23;
  v17 = __Block_byref_object_dispose__23;
  v18 = 0;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __71___CDInteractionRecorder_deleteInteractionsWithBundleId_account_error___block_invoke;
  v12[3] = &unk_1E26E6860;
  v12[4] = &v19;
  v12[5] = &v13;
  -[_CDInteractionRecorder deleteInteractionsWithBundleId:synchronous:account:completionHandler:](self, "deleteInteractionsWithBundleId:synchronous:account:completionHandler:", v8, 1, v9, v12);
  if (a5)
    *a5 = objc_retainAutorelease((id)v14[5]);
  v10 = v20[3];
  _Block_object_dispose(&v13, 8);

  _Block_object_dispose(&v19, 8);
  return v10;
}

- (void)deleteInteractionsWithBundleId:(id)a3 synchronous:(BOOL)a4 domainIdentifier:(id)a5 completionHandler:(id)a6
{
  _BOOL4 v7;
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  id v14;
  void *v15;
  NSXPCConnection *connection;
  void *v17;
  _QWORD v18[4];
  id v19;
  os_activity_scope_state_s state;

  v7 = a4;
  v10 = a6;
  v11 = a5;
  v12 = a3;
  v13 = _os_activity_create(&dword_18DDBE000, "Duet: deleteInteractionsWithBundleId domainIdentifier async", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v13, &state);
  os_activity_scope_leave(&state);

  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __104___CDInteractionRecorder_deleteInteractionsWithBundleId_synchronous_domainIdentifier_completionHandler___block_invoke;
  v18[3] = &unk_1E26E2FE8;
  v14 = v10;
  v19 = v14;
  v15 = (void *)MEMORY[0x193FEEAF4](v18);
  connection = self->_connection;
  if (v7)
    -[NSXPCConnection synchronousRemoteObjectProxyWithErrorHandler:](connection, "synchronousRemoteObjectProxyWithErrorHandler:", v15);
  else
    -[NSXPCConnection remoteObjectProxyWithErrorHandler:](connection, "remoteObjectProxyWithErrorHandler:", v15);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "deleteInteractionsWithBundleId:domainIdentifier:reply:", v12, v11, v14);

}

- (void)deleteInteractionsWithBundleId:(id)a3 domainIdentifier:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  os_activity_scope_state_s v12;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = _os_activity_create(&dword_18DDBE000, "Duet: deleteInteractionsWithBundleId domainIdentifier async", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  v12.opaque[0] = 0;
  v12.opaque[1] = 0;
  os_activity_scope_enter(v11, &v12);
  os_activity_scope_leave(&v12);

  if (v10)
    -[_CDInteractionRecorder deleteInteractionsWithBundleId:synchronous:domainIdentifier:completionHandler:](self, "deleteInteractionsWithBundleId:synchronous:domainIdentifier:completionHandler:", v8, 0, v9, v10);

}

- (unint64_t)deleteInteractionsWithBundleId:(id)a3 domainIdentifier:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  unint64_t v10;
  _QWORD v12[6];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t v22;

  v8 = a3;
  v9 = a4;
  v19 = 0;
  v20 = &v19;
  v21 = 0x2020000000;
  v22 = 0;
  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__23;
  v17 = __Block_byref_object_dispose__23;
  v18 = 0;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __80___CDInteractionRecorder_deleteInteractionsWithBundleId_domainIdentifier_error___block_invoke;
  v12[3] = &unk_1E26E6860;
  v12[4] = &v19;
  v12[5] = &v13;
  -[_CDInteractionRecorder deleteInteractionsWithBundleId:synchronous:domainIdentifier:completionHandler:](self, "deleteInteractionsWithBundleId:synchronous:domainIdentifier:completionHandler:", v8, 1, v9, v12);
  if (a5)
    *a5 = objc_retainAutorelease((id)v14[5]);
  v10 = v20[3];
  _Block_object_dispose(&v13, 8);

  _Block_object_dispose(&v19, 8);
  return v10;
}

- (void)deleteInteractionsWithBundleId:(id)a3 synchronous:(BOOL)a4 domainIdentifiers:(id)a5 completionHandler:(id)a6
{
  _BOOL4 v7;
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  id v14;
  void *v15;
  NSXPCConnection *connection;
  void *v17;
  _QWORD v18[4];
  id v19;
  os_activity_scope_state_s state;

  v7 = a4;
  v10 = a6;
  v11 = a5;
  v12 = a3;
  v13 = _os_activity_create(&dword_18DDBE000, "Duet: deleteInteractionsWithBundleId domainIdentifiers dispatch", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v13, &state);
  os_activity_scope_leave(&state);

  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __105___CDInteractionRecorder_deleteInteractionsWithBundleId_synchronous_domainIdentifiers_completionHandler___block_invoke;
  v18[3] = &unk_1E26E2FE8;
  v14 = v10;
  v19 = v14;
  v15 = (void *)MEMORY[0x193FEEAF4](v18);
  connection = self->_connection;
  if (v7)
    -[NSXPCConnection synchronousRemoteObjectProxyWithErrorHandler:](connection, "synchronousRemoteObjectProxyWithErrorHandler:", v15);
  else
    -[NSXPCConnection remoteObjectProxyWithErrorHandler:](connection, "remoteObjectProxyWithErrorHandler:", v15);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "deleteInteractionsWithBundleId:domainIdentifiers:reply:", v12, v11, v14);

}

- (void)deleteInteractionsWithBundleId:(id)a3 domainIdentifiers:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  os_activity_scope_state_s v12;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = _os_activity_create(&dword_18DDBE000, "Duet: deleteInteractionsWithBundleId domainIdentifiers async", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  v12.opaque[0] = 0;
  v12.opaque[1] = 0;
  os_activity_scope_enter(v11, &v12);
  os_activity_scope_leave(&v12);

  if (v10)
    -[_CDInteractionRecorder deleteInteractionsWithBundleId:synchronous:domainIdentifiers:completionHandler:](self, "deleteInteractionsWithBundleId:synchronous:domainIdentifiers:completionHandler:", v8, 0, v9, v10);

}

- (unint64_t)deleteInteractionsWithBundleId:(id)a3 domainIdentifiers:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  unint64_t v10;
  _QWORD v12[6];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t v22;

  v8 = a3;
  v9 = a4;
  v19 = 0;
  v20 = &v19;
  v21 = 0x2020000000;
  v22 = 0;
  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__23;
  v17 = __Block_byref_object_dispose__23;
  v18 = 0;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __81___CDInteractionRecorder_deleteInteractionsWithBundleId_domainIdentifiers_error___block_invoke;
  v12[3] = &unk_1E26E6860;
  v12[4] = &v19;
  v12[5] = &v13;
  -[_CDInteractionRecorder deleteInteractionsWithBundleId:synchronous:domainIdentifiers:completionHandler:](self, "deleteInteractionsWithBundleId:synchronous:domainIdentifiers:completionHandler:", v8, 1, v9, v12);
  if (a5)
    *a5 = objc_retainAutorelease((id)v14[5]);
  v10 = v20[3];
  _Block_object_dispose(&v13, 8);

  _Block_object_dispose(&v19, 8);
  return v10;
}

- (BOOL)enforceDataLimits
{
  return self->_enforceDataLimits;
}

- (void)setEnforceDataLimits:(BOOL)a3
{
  self->_enforceDataLimits = a3;
}

- (BOOL)enforcePrivacy
{
  return self->_enforcePrivacy;
}

- (void)setEnforcePrivacy:(BOOL)a3
{
  self->_enforcePrivacy = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_policies, 0);
  objc_storeStrong((id *)&self->_connection, 0);
}

- (void)recordInteractions:(uint64_t)a3 synchronous:(NSObject *)a4 completionHandler:.cold.1(uint64_t a1, uint64_t a2, uint64_t a3, NSObject *a4)
{
  uint64_t v4;

  v4 = *(_QWORD *)(*(_QWORD *)a1 + 40);
  *(_DWORD *)a2 = 134218242;
  *(_QWORD *)(a2 + 4) = a3;
  *(_WORD *)(a2 + 12) = 2114;
  *(_QWORD *)(a2 + 14) = v4;
  OUTLINED_FUNCTION_10(&dword_18DDBE000, a4, a3, "[sync path] stopped sending %tu interactions to coreduet daemon (%{public}@)", (uint8_t *)a2);
}

@end
