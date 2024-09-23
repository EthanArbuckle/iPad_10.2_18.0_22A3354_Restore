@implementation OSLogCurrentProcessEnumerator

- (OSLogCurrentProcessEnumerator)initWithOptions:(unint64_t)a3 predicate:(id)a4 position:(id)a5
{
  id v7;
  id v8;
  OSLogCurrentProcessEnumerator *v9;
  uint64_t v10;
  NSXPCConnection *connectionToService;
  void *v12;
  void *v13;
  OSLogCurrentProcessEnumerator *v14;
  _QWORD v16[5];
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;
  objc_super v23;

  v7 = a4;
  v8 = a5;
  v23.receiver = self;
  v23.super_class = (Class)OSLogCurrentProcessEnumerator;
  v9 = -[OSLogCurrentProcessEnumerator init](&v23, sel_init);
  if (v9)
  {
    v10 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B38]), "initWithServiceName:", CFSTR("com.apple.OSLogService"));
    connectionToService = v9->_connectionToService;
    v9->_connectionToService = (NSXPCConnection *)v10;

    objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EFE3A788);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSXPCConnection setRemoteObjectInterface:](v9->_connectionToService, "setRemoteObjectInterface:", v12);

    -[NSXPCConnection resume](v9->_connectionToService, "resume");
    v17 = 0;
    v18 = &v17;
    v19 = 0x3032000000;
    v20 = __Block_byref_object_copy_;
    v21 = __Block_byref_object_dispose_;
    v22 = 0;
    -[NSXPCConnection synchronousRemoteObjectProxyWithErrorHandler:](v9->_connectionToService, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_430);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __68__OSLogCurrentProcessEnumerator_initWithOptions_predicate_position___block_invoke_35;
    v16[3] = &unk_1E977B450;
    v16[4] = &v17;
    objc_msgSend(v13, "setUpWithPredicate:reply:", v7, v16);

    if (v18[5])
      v14 = 0;
    else
      v14 = v9;
    _Block_object_dispose(&v17, 8);

  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (void)dealloc
{
  objc_super v3;

  -[NSXPCConnection invalidate](self->_connectionToService, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)OSLogCurrentProcessEnumerator;
  -[OSLogCurrentProcessEnumerator dealloc](&v3, sel_dealloc);
}

- (id)nextObject
{
  void *v2;
  id v3;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy_;
  v10 = __Block_byref_object_dispose_;
  v11 = 0;
  -[NSXPCConnection synchronousRemoteObjectProxyWithErrorHandler:](self->_connectionToService, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_36);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __43__OSLogCurrentProcessEnumerator_nextObject__block_invoke_37;
  v5[3] = &unk_1E977B498;
  v5[4] = &v6;
  objc_msgSend(v2, "getNextOSLogEntryWithReply:", v5);

  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connectionToService, 0);
}

void __43__OSLogCurrentProcessEnumerator_nextObject__block_invoke_37(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __43__OSLogCurrentProcessEnumerator_nextObject__block_invoke(uint64_t a1, uint64_t a2)
{
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v3 = 138412290;
    v4 = a2;
    _os_log_error_impl(&dword_1D418F000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Error %@", (uint8_t *)&v3, 0xCu);
  }
}

void __68__OSLogCurrentProcessEnumerator_initWithOptions_predicate_position___block_invoke_35(uint64_t a1, void *a2)
{
  id v4;
  int v5;
  id v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  if (v4)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      v5 = 138412290;
      v6 = v4;
      _os_log_error_impl(&dword_1D418F000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Caught error: %@", (uint8_t *)&v5, 0xCu);
    }
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
  }

}

void __68__OSLogCurrentProcessEnumerator_initWithOptions_predicate_position___block_invoke(uint64_t a1, uint64_t a2)
{
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v3 = 138412290;
    v4 = a2;
    _os_log_error_impl(&dword_1D418F000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Error %@", (uint8_t *)&v3, 0xCu);
  }
}

@end
