@implementation LNRelevantIntentProvider

- (LNRelevantIntentProvider)init
{
  LNRelevantIntentProvider *v2;
  uint64_t v3;
  NSXPCConnection *connection;
  void *v5;
  LNRelevantIntentProvider *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)LNRelevantIntentProvider;
  v2 = -[LNRelevantIntentProvider init](&v8, sel_init);
  if (v2)
  {
    v3 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B38]), "initWithMachServiceName:options:", CFSTR("com.apple.linkd.registry"), 0);
    connection = v2->_connection;
    v2->_connection = (NSXPCConnection *)v3;

    LNDaemonRegistryXPCInterface();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSXPCConnection setRemoteObjectInterface:](v2->_connection, "setRemoteObjectInterface:", v5);

    -[NSXPCConnection resume](v2->_connection, "resume");
    v6 = v2;
  }

  return v2;
}

- (void)relevantIntentsForBundleIdentifier:(id)a3 reply:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  NSObject *activity;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  activity = _os_activity_create(&dword_1A18F6000, "appintents:fetch relevant intents for app", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __69__LNRelevantIntentProvider_relevantIntentsForBundleIdentifier_reply___block_invoke;
  block[3] = &unk_1E45DE0A0;
  v12 = v6;
  v13 = v7;
  block[4] = self;
  v8 = v6;
  v9 = v7;
  os_activity_apply(activity, block);

}

- (void)relevantIntentsWithReply:(id)a3
{
  id v4;
  id v5;
  NSObject *activity;
  _QWORD block[5];
  id v8;

  v4 = a3;
  activity = _os_activity_create(&dword_1A18F6000, "appintents:fetch all relevant intents", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __53__LNRelevantIntentProvider_relevantIntentsWithReply___block_invoke;
  block[3] = &unk_1E45DD1E0;
  block[4] = self;
  v8 = v4;
  v5 = v4;
  os_activity_apply(activity, block);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connection, 0);
}

void __53__LNRelevantIntentProvider_relevantIntentsWithReply___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v5[4];
  id v6;

  v2 = *(void **)(a1 + 40);
  v3 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __53__LNRelevantIntentProvider_relevantIntentsWithReply___block_invoke_2;
  v5[3] = &unk_1E45DE2E8;
  v6 = v2;
  objc_msgSend(v3, "remoteObjectProxyWithErrorHandler:", v5);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "relevantIntentsWithReply:", *(_QWORD *)(a1 + 40));

}

uint64_t __53__LNRelevantIntentProvider_relevantIntentsWithReply___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __69__LNRelevantIntentProvider_relevantIntentsForBundleIdentifier_reply___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  _QWORD v4[4];
  id v5;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __69__LNRelevantIntentProvider_relevantIntentsForBundleIdentifier_reply___block_invoke_2;
  v4[3] = &unk_1E45DE2E8;
  v5 = *(id *)(a1 + 48);
  objc_msgSend(v2, "remoteObjectProxyWithErrorHandler:", v4);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "relevantIntentsForBundleIdentifier:reply:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

}

uint64_t __69__LNRelevantIntentProvider_relevantIntentsForBundleIdentifier_reply___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

@end
