@implementation _CDInteractionAdvisor

- (id)adviseInteractionsUsingSettings:(id)a3
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  NSXPCConnection *connection;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  id v15;
  _QWORD v17[5];
  _QWORD v18[5];
  os_activity_scope_state_s state;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;
  uint8_t buf[24];
  uint64_t v25;
  _QWORD v26[2];

  v26[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = _os_activity_create(&dword_18DDBE000, "Duet: adviseInteractionsUsingSettings", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v5, &state);
  os_activity_scope_leave(&state);

  state.opaque[0] = 0;
  state.opaque[1] = (uint64_t)&state;
  v20 = 0x3032000000;
  v21 = __Block_byref_object_copy__2;
  v22 = __Block_byref_object_dispose__2;
  v23 = 0;
  -[_CDInteractionAdvisor setError:](self, "setError:", 0);
  v6 = MEMORY[0x1E0C809B0];
  connection = self->_connection;
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __57___CDInteractionAdvisor_adviseInteractionsUsingSettings___block_invoke;
  v18[3] = &unk_1E26E3118;
  v18[4] = self;
  -[NSXPCConnection synchronousRemoteObjectProxyWithErrorHandler:](connection, "synchronousRemoteObjectProxyWithErrorHandler:", v18);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v4)
  {
    v17[0] = v6;
    v17[1] = 3221225472;
    v17[2] = __57___CDInteractionAdvisor_adviseInteractionsUsingSettings___block_invoke_9;
    v17[3] = &unk_1E26E32A0;
    v17[4] = &state;
    objc_msgSend(v8, "adviseInteractionsUsingSettings:reply:", v4, v17);
  }
  else
  {
    v10 = (void *)MEMORY[0x1E0CB35C8];
    v25 = *MEMORY[0x1E0CB2D50];
    v26[0] = CFSTR("Settings cannot be nil");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v26, &v25, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "errorWithDomain:code:userInfo:", CFSTR("_CDInteractionAdvisor"), 1, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    +[_CDLogging interactionChannel](_CDLogging, "interactionChannel");
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v12, "localizedDescription");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[_CDInteractionAdvisor adviseInteractionsUsingSettings:].cold.1(v14, buf, v13);
    }

    -[_CDInteractionAdvisor setError:](self, "setError:", v12);
  }
  v15 = *(id *)(state.opaque[1] + 40);

  _Block_object_dispose(&state, 8);
  return v15;
}

- (void)setError:(id)a3
{
  objc_storeStrong((id *)&self->_error, a3);
}

- (_CDInteractionAdvisor)initWithServiceName:(id)a3
{
  id v4;
  _CDInteractionAdvisor *v5;
  uint64_t v6;
  NSXPCConnection *connection;
  void *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)_CDInteractionAdvisor;
  v5 = -[_CDInteractionAdvisor init](&v10, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B38]), "initWithMachServiceName:options:", v4, 4096);
    connection = v5->_connection;
    v5->_connection = (NSXPCConnection *)v6;

    _CDInteractionNSXPCInterface();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSXPCConnection setRemoteObjectInterface:](v5->_connection, "setRemoteObjectInterface:", v8);

    -[NSXPCConnection resume](v5->_connection, "resume");
  }

  return v5;
}

+ (id)sharedInteractionAdvisor
{
  if (sharedInteractionAdvisor_onceToken != -1)
    dispatch_once(&sharedInteractionAdvisor_onceToken, &__block_literal_global_5);
  return (id)sharedInteractionAdvisor_advisor;
}

- (void)dealloc
{
  objc_super v3;

  -[NSXPCConnection invalidate](self->_connection, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)_CDInteractionAdvisor;
  -[_CDInteractionAdvisor dealloc](&v3, sel_dealloc);
}

- (id)rankCandidateContacts:(id)a3 usingSettings:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  uint64_t v9;
  NSXPCConnection *connection;
  void *v11;
  id v12;
  _QWORD v14[5];
  _QWORD v15[5];
  os_activity_scope_state_s state;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;

  v6 = a3;
  v7 = a4;
  v8 = _os_activity_create(&dword_18DDBE000, "Duet: rankCandidateContacts", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v8, &state);
  os_activity_scope_leave(&state);

  state.opaque[0] = 0;
  state.opaque[1] = (uint64_t)&state;
  v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__2;
  v19 = __Block_byref_object_dispose__2;
  v20 = 0;
  -[_CDInteractionAdvisor setError:](self, "setError:", 0);
  v9 = MEMORY[0x1E0C809B0];
  connection = self->_connection;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __61___CDInteractionAdvisor_rankCandidateContacts_usingSettings___block_invoke;
  v15[3] = &unk_1E26E3118;
  v15[4] = self;
  -[NSXPCConnection synchronousRemoteObjectProxyWithErrorHandler:](connection, "synchronousRemoteObjectProxyWithErrorHandler:", v15);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v9;
  v14[1] = 3221225472;
  v14[2] = __61___CDInteractionAdvisor_rankCandidateContacts_usingSettings___block_invoke_7;
  v14[3] = &unk_1E26E32A0;
  v14[4] = &state;
  objc_msgSend(v11, "rankCandidateContacts:usingSettings:reply:", v6, v7, v14);
  v12 = *(id *)(state.opaque[1] + 40);

  _Block_object_dispose(&state, 8);
  return v12;
}

- (id)adviseInteractionsForDate:(id)a3 usingSettings:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  uint64_t v9;
  NSXPCConnection *connection;
  void *v11;
  id v12;
  _QWORD v14[5];
  _QWORD v15[5];
  os_activity_scope_state_s state;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;

  v6 = a3;
  v7 = a4;
  v8 = _os_activity_create(&dword_18DDBE000, "Duet: adviseInteractionsForDate", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v8, &state);
  os_activity_scope_leave(&state);

  state.opaque[0] = 0;
  state.opaque[1] = (uint64_t)&state;
  v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__2;
  v19 = __Block_byref_object_dispose__2;
  v20 = 0;
  -[_CDInteractionAdvisor setError:](self, "setError:", 0);
  v9 = MEMORY[0x1E0C809B0];
  connection = self->_connection;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __65___CDInteractionAdvisor_adviseInteractionsForDate_usingSettings___block_invoke;
  v15[3] = &unk_1E26E3118;
  v15[4] = self;
  -[NSXPCConnection synchronousRemoteObjectProxyWithErrorHandler:](connection, "synchronousRemoteObjectProxyWithErrorHandler:", v15);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v9;
  v14[1] = 3221225472;
  v14[2] = __65___CDInteractionAdvisor_adviseInteractionsForDate_usingSettings___block_invoke_16;
  v14[3] = &unk_1E26E32A0;
  v14[4] = &state;
  objc_msgSend(v11, "adviseInteractionsForDate:usingSettings:reply:", v6, v7, v14);
  v12 = *(id *)(state.opaque[1] + 40);

  _Block_object_dispose(&state, 8);
  return v12;
}

- (id)adviseSocialInteractionsForDate:(id)a3 andSeedContacts:(id)a4 usingSettings:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  uint64_t v12;
  NSXPCConnection *connection;
  void *v14;
  id v15;
  _QWORD v17[5];
  _QWORD v18[5];
  os_activity_scope_state_s state;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = _os_activity_create(&dword_18DDBE000, "Duet: adviseSocialInteractionsForDate", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v11, &state);
  os_activity_scope_leave(&state);

  state.opaque[0] = 0;
  state.opaque[1] = (uint64_t)&state;
  v20 = 0x3032000000;
  v21 = __Block_byref_object_copy__2;
  v22 = __Block_byref_object_dispose__2;
  v23 = 0;
  -[_CDInteractionAdvisor setError:](self, "setError:", 0);
  v12 = MEMORY[0x1E0C809B0];
  connection = self->_connection;
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __87___CDInteractionAdvisor_adviseSocialInteractionsForDate_andSeedContacts_usingSettings___block_invoke;
  v18[3] = &unk_1E26E3118;
  v18[4] = self;
  -[NSXPCConnection synchronousRemoteObjectProxyWithErrorHandler:](connection, "synchronousRemoteObjectProxyWithErrorHandler:", v18);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v12;
  v17[1] = 3221225472;
  v17[2] = __87___CDInteractionAdvisor_adviseSocialInteractionsForDate_andSeedContacts_usingSettings___block_invoke_17;
  v17[3] = &unk_1E26E32A0;
  v17[4] = &state;
  objc_msgSend(v14, "adviseSocialInteractionsForDate:andSeedContacts:usingSettings:reply:", v8, v9, v10, v17);
  v15 = *(id *)(state.opaque[1] + 40);

  _Block_object_dispose(&state, 8);
  return v15;
}

- (id)adviseInteractionsForKeywordsInString:(id)a3 usingSettings:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  uint64_t v9;
  NSXPCConnection *connection;
  void *v11;
  id v12;
  _QWORD v14[5];
  _QWORD v15[5];
  os_activity_scope_state_s state;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;

  v6 = a3;
  v7 = a4;
  v8 = _os_activity_create(&dword_18DDBE000, "Duet: adviseInteractionsForKeywordsInString", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v8, &state);
  os_activity_scope_leave(&state);

  state.opaque[0] = 0;
  state.opaque[1] = (uint64_t)&state;
  v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__2;
  v19 = __Block_byref_object_dispose__2;
  v20 = 0;
  -[_CDInteractionAdvisor setError:](self, "setError:", 0);
  v9 = MEMORY[0x1E0C809B0];
  connection = self->_connection;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __77___CDInteractionAdvisor_adviseInteractionsForKeywordsInString_usingSettings___block_invoke;
  v15[3] = &unk_1E26E3118;
  v15[4] = self;
  -[NSXPCConnection synchronousRemoteObjectProxyWithErrorHandler:](connection, "synchronousRemoteObjectProxyWithErrorHandler:", v15);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v9;
  v14[1] = 3221225472;
  v14[2] = __77___CDInteractionAdvisor_adviseInteractionsForKeywordsInString_usingSettings___block_invoke_18;
  v14[3] = &unk_1E26E32A0;
  v14[4] = &state;
  objc_msgSend(v11, "adviseInteractionsForKeywordsInString:usingSettings:reply:", v6, v7, v14);
  v12 = *(id *)(state.opaque[1] + 40);

  _Block_object_dispose(&state, 8);
  return v12;
}

- (void)tuneSocialAdvisorUsingSettings:(id)a3 heartBeatHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  NSXPCConnection *connection;
  void *v10;
  _QWORD v11[5];
  os_activity_scope_state_s state;

  v6 = a4;
  v7 = a3;
  v8 = _os_activity_create(&dword_18DDBE000, "Duet: tuneSocialAdvisorUsingSettings", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v8, &state);
  os_activity_scope_leave(&state);

  -[_CDInteractionAdvisor setError:](self, "setError:", 0);
  connection = self->_connection;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __73___CDInteractionAdvisor_tuneSocialAdvisorUsingSettings_heartBeatHandler___block_invoke;
  v11[3] = &unk_1E26E3118;
  v11[4] = self;
  -[NSXPCConnection synchronousRemoteObjectProxyWithErrorHandler:](connection, "synchronousRemoteObjectProxyWithErrorHandler:", v11);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "tuneSocialAdvisorUsingSettings:heartBeatHandler:reply:", v7, v6, 0);

}

- (NSError)error
{
  return self->_error;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_connection, 0);
}

- (void)adviseInteractionsUsingSettings:(os_log_t)log .cold.1(void *a1, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138412290;
  *(_QWORD *)(buf + 4) = a1;
  _os_log_error_impl(&dword_18DDBE000, log, OS_LOG_TYPE_ERROR, "Error: %@", buf, 0xCu);

}

@end
