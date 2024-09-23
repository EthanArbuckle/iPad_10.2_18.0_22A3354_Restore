@implementation NLXPCSpellServerClient

- (NLXPCSpellServerClient)initWithServerName:(id)a3
{
  id v4;
  NLXPCSpellServerClient *v5;
  void *v6;
  uint64_t v7;
  NSString *serverName;
  uint64_t v9;
  NSXPCConnection *connection;
  _QWORD v12[4];
  NLXPCSpellServerClient *v13;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)NLXPCSpellServerClient;
  v5 = -[NLXPCSpellServerClient init](&v14, sel_init);
  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE6CDD68);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v4, "copy");
    serverName = v5->_serverName;
    v5->_serverName = (NSString *)v7;

    v9 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B38]), "initWithMachServiceName:options:", v5->_serverName, 0);
    connection = v5->_connection;
    v5->_connection = (NSXPCConnection *)v9;

    -[NSXPCConnection setRemoteObjectInterface:](v5->_connection, "setRemoteObjectInterface:", v6);
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __45__NLXPCSpellServerClient_initWithServerName___block_invoke;
    v12[3] = &unk_1E4A3A680;
    v13 = v5;
    -[NSXPCConnection setInvalidationHandler:](v5->_connection, "setInvalidationHandler:", v12);
    -[NSXPCConnection resume](v5->_connection, "resume");

  }
  return v5;
}

void __45__NLXPCSpellServerClient_initWithServerName___block_invoke(uint64_t a1)
{
  NSLog(CFSTR("NLXPCSpellServerClient connection invalidated"));
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 24) = 1;
}

- (void)dealloc
{
  objc_super v3;

  -[NSXPCConnection invalidate](self->_connection, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)NLXPCSpellServerClient;
  -[NLXPCSpellServerClient dealloc](&v3, sel_dealloc);
}

- (id)serverName
{
  return self->_serverName;
}

- (id)connection
{
  return self->_connection;
}

- (BOOL)isValid
{
  return !self->_invalidated;
}

- (void)sendCommand:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  objc_msgSend(MEMORY[0x1E0CB38B0], "dataWithPropertyList:format:options:error:", a3, 100, 0, 0);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithData:encoding:", v8, 4);
  -[NSXPCConnection remoteObjectProxyWithErrorHandler:](self->_connection, "remoteObjectProxyWithErrorHandler:", &__block_literal_global_8);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringByReplacingOccurrencesOfString:withString:", CFSTR("\n"), CFSTR(" "));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(CFSTR("!!!command!!!"), "stringByAppendingString:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "_xpc_checkString:offset:types:options:orthography:learnedDictionaries:completionHandler:", v7, 0, 2, &unk_1E4A47E38, 0, 0, &__block_literal_global_24);
}

void __38__NLXPCSpellServerClient_sendCommand___block_invoke(uint64_t a1, uint64_t a2)
{
  NSLog(CFSTR("NLXPCSpellServerClient received error %@"), a2);
}

+ (id)spellServerClient
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __43__NLXPCSpellServerClient_spellServerClient__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (spellServerClient_onceToken != -1)
    dispatch_once(&spellServerClient_onceToken, block);
  return (id)spellServerClient__xpcServer;
}

void __43__NLXPCSpellServerClient_spellServerClient__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  v1 = objc_msgSend(objc_alloc(*(Class *)(a1 + 32)), "initWithServerName:", CFSTR("mul-xpc (Apple)_OpenStep"));
  v2 = (void *)spellServerClient__xpcServer;
  spellServerClient__xpcServer = v1;

}

+ (void)requestAssetsForLanguage:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  _QWORD v7[2];
  _QWORD v8[3];

  v8[2] = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    v4 = a3;
    objc_msgSend(a1, "spellServerClient");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v7[0] = CFSTR("Command");
    v7[1] = CFSTR("Language");
    v8[0] = CFSTR("RequestAssets");
    v8[1] = v4;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, v7, 2);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "sendCommand:", v6);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_serverName, 0);
}

@end
