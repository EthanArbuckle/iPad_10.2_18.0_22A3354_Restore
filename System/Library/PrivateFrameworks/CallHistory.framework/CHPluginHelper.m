@implementation CHPluginHelper

- (CHPluginHelper)init
{
  CHPluginHelper *v2;
  id v3;
  uint64_t v4;
  NSXPCConnection *connection;
  uint64_t v6;
  NSXPCInterface *interface;
  void *v8;
  uint64_t v9;
  void *v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)CHPluginHelper;
  v2 = -[CHPluginHelper init](&v12, sel_init);
  if (v2)
  {
    v3 = objc_alloc(MEMORY[0x1E0CB3B38]);
    v4 = objc_msgSend(v3, "initWithMachServiceName:options:", kPluginHelperServiceIdentifier, 0);
    connection = v2->_connection;
    v2->_connection = (NSXPCConnection *)v4;

    objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EF096FF0);
    v6 = objc_claimAutoreleasedReturnValue();
    interface = v2->_interface;
    v2->_interface = (NSXPCInterface *)v6;

    v8 = (void *)MEMORY[0x1E0C99E60];
    v9 = objc_opt_class();
    objc_msgSend(v8, "setWithObjects:", v9, objc_opt_class(), 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSXPCInterface setClasses:forSelector:argumentIndex:ofReply:](v2->_interface, "setClasses:forSelector:argumentIndex:ofReply:", v10, sel_recentCallsWithCallType_withReply_, 0, 1);
    -[NSXPCConnection setRemoteObjectInterface:](v2->_connection, "setRemoteObjectInterface:", v2->_interface);
    -[NSXPCConnection resume](v2->_connection, "resume");

  }
  return v2;
}

- (id)recentCallsWithLimitingTypes:(unsigned int)a3 error:(id *)a4
{
  uint64_t v5;
  NSXPCConnection *connection;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v12[6];
  _QWORD v13[6];
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

  v5 = *(_QWORD *)&a3;
  v20 = 0;
  v21 = &v20;
  v22 = 0x3032000000;
  v23 = __Block_byref_object_copy__5;
  v24 = __Block_byref_object_dispose__5;
  v25 = 0;
  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__5;
  v18 = __Block_byref_object_dispose__5;
  v19 = 0;
  connection = self->_connection;
  v7 = MEMORY[0x1E0C809B0];
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __53__CHPluginHelper_recentCallsWithLimitingTypes_error___block_invoke;
  v13[3] = &unk_1E67475C8;
  v13[4] = &v20;
  v13[5] = &v14;
  -[NSXPCConnection synchronousRemoteObjectProxyWithErrorHandler:](connection, "synchronousRemoteObjectProxyWithErrorHandler:", v13);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v7;
  v12[1] = 3221225472;
  v12[2] = __53__CHPluginHelper_recentCallsWithLimitingTypes_error___block_invoke_2;
  v12[3] = &unk_1E67475F0;
  v12[4] = &v20;
  v12[5] = &v14;
  objc_msgSend(v8, "recentCallsWithCallType:withReply:", v5, v12);

  if (a4)
  {
    v9 = (void *)v15[5];
    if (v9)
      *a4 = objc_retainAutorelease(v9);
  }
  v10 = (id)v21[5];
  _Block_object_dispose(&v14, 8);

  _Block_object_dispose(&v20, 8);
  return v10;
}

void __53__CHPluginHelper_recentCallsWithLimitingTypes_error___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;

  v3 = a2;
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = 0;

  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v3;

}

void __53__CHPluginHelper_recentCallsWithLimitingTypes_error___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v4;
  void *v5;
  id v6;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
  v6 = a2;
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = 0;

}

- (void)recentCallsWithLimitingTypes:(unsigned int)a3 completionHandler:(id)a4
{
  uint64_t v4;
  id v6;
  NSXPCConnection *connection;
  uint64_t v8;
  id v9;
  void *v10;
  id v11;
  _QWORD v12[4];
  id v13;
  _QWORD v14[4];
  id v15;

  v4 = *(_QWORD *)&a3;
  v6 = a4;
  connection = self->_connection;
  v8 = MEMORY[0x1E0C809B0];
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __65__CHPluginHelper_recentCallsWithLimitingTypes_completionHandler___block_invoke;
  v14[3] = &unk_1E6747618;
  v9 = v6;
  v15 = v9;
  -[NSXPCConnection remoteObjectProxyWithErrorHandler:](connection, "remoteObjectProxyWithErrorHandler:", v14);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v8;
  v12[1] = 3221225472;
  v12[2] = __65__CHPluginHelper_recentCallsWithLimitingTypes_completionHandler___block_invoke_2;
  v12[3] = &unk_1E6747640;
  v13 = v9;
  v11 = v9;
  objc_msgSend(v10, "recentCallsWithCallType:withReply:", v4, v12);

}

uint64_t __65__CHPluginHelper_recentCallsWithLimitingTypes_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __65__CHPluginHelper_recentCallsWithLimitingTypes_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (unint64_t)unreadCallCountWithError:(id *)a3
{
  NSXPCConnection *connection;
  uint64_t v5;
  void *v6;
  void *v7;
  unint64_t v8;
  _QWORD v10[6];
  _QWORD v11[6];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;

  v18 = 0;
  v19 = &v18;
  v20 = 0x2020000000;
  v21 = 0x7FFFFFFFFFFFFFFFLL;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__5;
  v16 = __Block_byref_object_dispose__5;
  v17 = 0;
  connection = self->_connection;
  v5 = MEMORY[0x1E0C809B0];
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __43__CHPluginHelper_unreadCallCountWithError___block_invoke;
  v11[3] = &unk_1E67475C8;
  v11[4] = &v18;
  v11[5] = &v12;
  -[NSXPCConnection synchronousRemoteObjectProxyWithErrorHandler:](connection, "synchronousRemoteObjectProxyWithErrorHandler:", v11);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v5;
  v10[1] = 3221225472;
  v10[2] = __43__CHPluginHelper_unreadCallCountWithError___block_invoke_2;
  v10[3] = &unk_1E6747668;
  v10[4] = &v18;
  v10[5] = &v12;
  objc_msgSend(v6, "unreadCallCount:", v10);

  if (a3)
  {
    v7 = (void *)v13[5];
    if (v7)
      *a3 = objc_retainAutorelease(v7);
  }
  v8 = v19[3];
  _Block_object_dispose(&v12, 8);

  _Block_object_dispose(&v18, 8);
  return v8;
}

void __43__CHPluginHelper_unreadCallCountWithError___block_invoke(uint64_t a1, void *a2)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 0x7FFFFFFFFFFFFFFFLL;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
}

void __43__CHPluginHelper_unreadCallCountWithError___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  void *v3;

  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = a2;
  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v3 = *(void **)(v2 + 40);
  *(_QWORD *)(v2 + 40) = 0;

}

- (void)unreadCallCountWithCompletionHandler:(id)a3
{
  id v4;
  NSXPCConnection *connection;
  uint64_t v6;
  id v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;
  _QWORD v12[4];
  id v13;

  v4 = a3;
  connection = self->_connection;
  v6 = MEMORY[0x1E0C809B0];
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __55__CHPluginHelper_unreadCallCountWithCompletionHandler___block_invoke;
  v12[3] = &unk_1E6747618;
  v7 = v4;
  v13 = v7;
  -[NSXPCConnection remoteObjectProxyWithErrorHandler:](connection, "remoteObjectProxyWithErrorHandler:", v12);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v6;
  v10[1] = 3221225472;
  v10[2] = __55__CHPluginHelper_unreadCallCountWithCompletionHandler___block_invoke_2;
  v10[3] = &unk_1E6747690;
  v11 = v7;
  v9 = v7;
  objc_msgSend(v8, "unreadCallCount:", v10);

}

uint64_t __55__CHPluginHelper_unreadCallCountWithCompletionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __55__CHPluginHelper_unreadCallCountWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_interface, 0);
  objc_storeStrong((id *)&self->_connection, 0);
}

@end
