@implementation LNSuggestionsProvider

- (LNSuggestionsProvider)init
{
  LNSuggestionsProvider *v2;
  uint64_t v3;
  NSXPCConnection *connection;
  void *v5;
  LNSuggestionsProvider *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)LNSuggestionsProvider;
  v2 = -[LNSuggestionsProvider init](&v8, sel_init);
  if (v2)
  {
    v3 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B38]), "initWithMachServiceName:options:", CFSTR("com.apple.linkd.suggestions"), 0);
    connection = v2->_connection;
    v2->_connection = (NSXPCConnection *)v3;

    LNDaemonSuggestionsXPCInterface();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSXPCConnection setRemoteObjectInterface:](v2->_connection, "setRemoteObjectInterface:", v5);

    -[NSXPCConnection resume](v2->_connection, "resume");
    v6 = v2;
  }

  return v2;
}

- (void)dealloc
{
  objc_super v3;

  -[NSXPCConnection invalidate](self->_connection, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)LNSuggestionsProvider;
  -[LNSuggestionsProvider dealloc](&v3, sel_dealloc);
}

- (id)suggestedActionsForSuggestionsRequests:(id)a3 error:(id *)a4
{
  id v6;
  uint64_t v7;
  NSXPCConnection *connection;
  void *v9;
  void *v10;
  id v11;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  _QWORD v19[6];
  _QWORD v20[5];
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t (*v30)(uint64_t, uint64_t);
  void (*v31)(uint64_t);
  id v32;
  uint64_t v33;
  _QWORD v34[2];

  v34[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v27 = 0;
  v28 = &v27;
  v29 = 0x3032000000;
  v30 = __Block_byref_object_copy__5272;
  v31 = __Block_byref_object_dispose__5273;
  v32 = 0;
  v21 = 0;
  v22 = &v21;
  v23 = 0x3032000000;
  v24 = __Block_byref_object_copy__5272;
  v25 = __Block_byref_object_dispose__5273;
  v26 = 0;
  v7 = MEMORY[0x1E0C809B0];
  connection = self->_connection;
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __70__LNSuggestionsProvider_suggestedActionsForSuggestionsRequests_error___block_invoke;
  v20[3] = &unk_1E45DE140;
  v20[4] = &v27;
  -[NSXPCConnection synchronousRemoteObjectProxyWithErrorHandler:](connection, "synchronousRemoteObjectProxyWithErrorHandler:", v20);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = v7;
  v19[1] = 3221225472;
  v19[2] = __70__LNSuggestionsProvider_suggestedActionsForSuggestionsRequests_error___block_invoke_2;
  v19[3] = &unk_1E45DCBD8;
  v19[4] = &v21;
  v19[5] = &v27;
  objc_msgSend(v9, "suggestedActionsForSuggestionsRequests:reply:", v6, v19);

  v10 = (void *)v22[5];
  if (v10)
  {
    v11 = v10;
  }
  else if (a4)
  {
    v13 = (void *)v28[5];
    if (v13)
    {
      *a4 = objc_retainAutorelease(v13);
    }
    else
    {
      v33 = *MEMORY[0x1E0CB2D50];
      objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "localizedStringForKey:value:table:", CFSTR("Empty result"), &stru_1E45DFA60, 0);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v34[0] = v15;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v34, &v33, 1);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("LNSuggestionsProviderErrorDomain"), 9003, v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      v18 = objc_retainAutorelease(v17);
      *a4 = v18;

    }
  }
  _Block_object_dispose(&v21, 8);

  _Block_object_dispose(&v27, 8);
  return v10;
}

- (NSXPCConnection)connection
{
  return self->_connection;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connection, 0);
}

void __70__LNSuggestionsProvider_suggestedActionsForSuggestionsRequests_error___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __70__LNSuggestionsProvider_suggestedActionsForSuggestionsRequests_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v5;
  v11 = v5;

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v6;

}

@end
