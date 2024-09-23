@implementation OTATaskingAgentClient

+ (id)sharedClient
{
  if (sharedClient_onceToken != -1)
    dispatch_once(&sharedClient_onceToken, &__block_literal_global_1);
  return (id)sharedClient__sharedInstance;
}

void __37__OTATaskingAgentClient_sharedClient__block_invoke()
{
  OTATaskingAgentClient *v0;
  void *v1;

  v0 = objc_alloc_init(OTATaskingAgentClient);
  v1 = (void *)sharedClient__sharedInstance;
  sharedClient__sharedInstance = (uint64_t)v0;

}

- (OTATaskingAgentClient)init
{
  OTATaskingAgentClient *v2;
  uint64_t v3;
  NSXPCConnection *connection;
  void *v5;
  uint64_t v6;
  OTATaskingAgent *synchRemoteObjectProxy;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)OTATaskingAgentClient;
  v2 = -[OTATaskingAgentClient init](&v9, sel_init);
  if (v2)
  {
    v3 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B38]), "initWithMachServiceName:options:", CFSTR("com.apple.OTATaskingAgent"), 4096);
    connection = v2->_connection;
    v2->_connection = (NSXPCConnection *)v3;

    objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EEB8AC08);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSXPCConnection setRemoteObjectInterface:](v2->_connection, "setRemoteObjectInterface:", v5);

    -[NSXPCConnection resume](v2->_connection, "resume");
    -[NSXPCConnection synchronousRemoteObjectProxyWithErrorHandler:](v2->_connection, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_56);
    v6 = objc_claimAutoreleasedReturnValue();
    synchRemoteObjectProxy = v2->_synchRemoteObjectProxy;
    v2->_synchRemoteObjectProxy = (OTATaskingAgent *)v6;

  }
  return v2;
}

void __29__OTATaskingAgentClient_init__block_invoke(uint64_t a1, uint64_t a2)
{
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    v3 = 138412290;
    v4 = a2;
    _os_log_impl(&dword_1AA8D9000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Connection error to OTATaskingAgent. Error: %@", (uint8_t *)&v3, 0xCu);
  }
}

- (BOOL)setPreference:(id)a3 forUser:(id)a4 inDomain:(id)a5 toValue:(void *)a6
{
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  OTATaskingAgent *synchRemoteObjectProxy;
  char v15;
  _QWORD v17[5];
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  char v21;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v18 = 0;
  v19 = &v18;
  v20 = 0x2020000000;
  v21 = 0;
  v13 = -[OTATaskingAgentClient uidForUser:](self, "uidForUser:", v11);
  if ((_DWORD)v13)
  {
    synchRemoteObjectProxy = self->_synchRemoteObjectProxy;
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __64__OTATaskingAgentClient_setPreference_forUser_inDomain_toValue___block_invoke;
    v17[3] = &unk_1E57ED058;
    v17[4] = &v18;
    -[OTATaskingAgent setPreferenceForDomain:preference:value:UID:withReply:](synchRemoteObjectProxy, "setPreferenceForDomain:preference:value:UID:withReply:", v12, v10, a6, v13, v17);
  }
  v15 = *((_BYTE *)v19 + 24);
  _Block_object_dispose(&v18, 8);

  return v15;
}

uint64_t __64__OTATaskingAgentClient_setPreference_forUser_inDomain_toValue___block_invoke(uint64_t result, char a2)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = a2;
  return result;
}

- (BOOL)deletePreference:(id)a3 forUser:(id)a4 inDomain:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  OTATaskingAgent *synchRemoteObjectProxy;
  char v13;
  _QWORD v15[5];
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  char v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v16 = 0;
  v17 = &v16;
  v18 = 0x2020000000;
  v19 = 0;
  v11 = -[OTATaskingAgentClient uidForUser:](self, "uidForUser:", v9);
  if ((_DWORD)v11)
  {
    synchRemoteObjectProxy = self->_synchRemoteObjectProxy;
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __59__OTATaskingAgentClient_deletePreference_forUser_inDomain___block_invoke;
    v15[3] = &unk_1E57ED058;
    v15[4] = &v16;
    -[OTATaskingAgent deletePreferenceForDomain:preference:UID:withReply:](synchRemoteObjectProxy, "deletePreferenceForDomain:preference:UID:withReply:", v10, v8, v11, v15);
  }
  v13 = *((_BYTE *)v17 + 24);
  _Block_object_dispose(&v16, 8);

  return v13;
}

uint64_t __59__OTATaskingAgentClient_deletePreference_forUser_inDomain___block_invoke(uint64_t result, char a2)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = a2;
  return result;
}

- (id)crashreporterKey
{
  OTATaskingAgent *synchRemoteObjectProxy;
  void *v3;
  id v4;
  uint8_t v6[8];
  _QWORD v7[5];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  id v13;

  v8 = 0;
  v9 = &v8;
  v10 = 0x3032000000;
  v11 = __Block_byref_object_copy__0;
  v12 = __Block_byref_object_dispose__0;
  v13 = 0;
  synchRemoteObjectProxy = self->_synchRemoteObjectProxy;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __41__OTATaskingAgentClient_crashreporterKey__block_invoke;
  v7[3] = &unk_1E57ED080;
  v7[4] = &v8;
  -[OTATaskingAgent crashreporterKeyWithReply:](synchRemoteObjectProxy, "crashreporterKeyWithReply:", v7);
  if (objc_msgSend((id)v9[5], "isEqualToString:", CFSTR("<no_entitlement>")))
  {
    v3 = (void *)v9[5];
    v9[5] = 0;

    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_1AA8D9000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Error while retrieving crashreporterKey. Does this process have the entitlement - com.apple.osanalytics.otatasking-service-access ?", v6, 2u);
    }
    if (crashreporterKey_onceToken != -1)
      dispatch_once(&crashreporterKey_onceToken, &__block_literal_global_62);
  }
  v4 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return v4;
}

void __41__OTATaskingAgentClient_crashreporterKey__block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __41__OTATaskingAgentClient_crashreporterKey__block_invoke_61()
{
  _BOOL8 v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v0 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
  if (v0)
    __41__OTATaskingAgentClient_crashreporterKey__block_invoke_61_cold_1(v0, v1, v2, v3, v4, v5, v6, v7);
}

- (id)awdKey
{
  OTATaskingAgent *synchRemoteObjectProxy;
  void *v3;
  id v4;
  uint8_t v6[8];
  _QWORD v7[5];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  id v13;

  v8 = 0;
  v9 = &v8;
  v10 = 0x3032000000;
  v11 = __Block_byref_object_copy__0;
  v12 = __Block_byref_object_dispose__0;
  v13 = 0;
  synchRemoteObjectProxy = self->_synchRemoteObjectProxy;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __31__OTATaskingAgentClient_awdKey__block_invoke;
  v7[3] = &unk_1E57ED080;
  v7[4] = &v8;
  -[OTATaskingAgent awdKeyWithReply:](synchRemoteObjectProxy, "awdKeyWithReply:", v7);
  if (objc_msgSend((id)v9[5], "isEqualToString:", CFSTR("<no_entitlement>")))
  {
    v3 = (void *)v9[5];
    v9[5] = 0;

    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_1AA8D9000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Error while retrieving awdKey. Does this process have the entitlement - com.apple.osanalytics.otatasking-service-access ?", v6, 2u);
    }
    if (awdKey_onceToken != -1)
      dispatch_once(&awdKey_onceToken, &__block_literal_global_64);
  }
  v4 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return v4;
}

void __31__OTATaskingAgentClient_awdKey__block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __31__OTATaskingAgentClient_awdKey__block_invoke_63()
{
  _BOOL8 v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v0 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
  if (v0)
    __41__OTATaskingAgentClient_crashreporterKey__block_invoke_61_cold_1(v0, v1, v2, v3, v4, v5, v6, v7);
}

- (unsigned)uidForUser:(id)a3
{
  id v3;
  passwd *v4;
  unsigned int pw_uid;
  NSObject *v6;
  const char *v7;
  uint32_t v8;
  int v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = objc_retainAutorelease(a3);
  v4 = getpwnam((const char *)objc_msgSend(v3, "UTF8String"));
  if (v4)
  {
    pw_uid = v4->pw_uid;
    if (!pw_uid && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v10) = 0;
      v6 = MEMORY[0x1E0C81028];
      v7 = "Modifying defaults as root is not allowed, skipping request";
      v8 = 2;
LABEL_7:
      _os_log_impl(&dword_1AA8D9000, v6, OS_LOG_TYPE_DEFAULT, v7, (uint8_t *)&v10, v8);
      pw_uid = 0;
    }
  }
  else
  {
    pw_uid = 0;
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      v10 = 138412290;
      v11 = v3;
      v6 = MEMORY[0x1E0C81028];
      v7 = "Unknown user '%@', skipping request";
      v8 = 12;
      goto LABEL_7;
    }
  }

  return pw_uid;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_synchRemoteObjectProxy, 0);
  objc_storeStrong((id *)&self->_connection, 0);
}

void __41__OTATaskingAgentClient_crashreporterKey__block_invoke_61_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_1AA8D9000, MEMORY[0x1E0C81028], a3, "Querying crashreporterKey/awdKey now requires the entitlement - com.apple.osanalytics.otatasking-service-access. Please add that to your process.", a5, a6, a7, a8, 0);
}

@end
