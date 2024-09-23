@implementation MRRestrictedCommandClientsManager

+ (id)sharedManager
{
  if (sharedManager___once_1 != -1)
    dispatch_once(&sharedManager___once_1, &__block_literal_global_80);
  return (id)sharedManager___sharedManager_0;
}

void __50__MRRestrictedCommandClientsManager_sharedManager__block_invoke()
{
  MRRestrictedCommandClientsManager *v0;
  void *v1;

  v0 = objc_alloc_init(MRRestrictedCommandClientsManager);
  v1 = (void *)sharedManager___sharedManager_0;
  sharedManager___sharedManager_0 = (uint64_t)v0;

}

- (id)restrictCommandClientsTo:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  -[MRRestrictedCommandClientsManager _restrictCommandClientsTo:](self, "_restrictCommandClientsTo:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __62__MRRestrictedCommandClientsManager_restrictCommandClientsTo___block_invoke;
  v9[3] = &unk_1E30CD1E0;
  v10 = v5;
  v6 = v5;
  objc_msgSend(v4, "msv_filter:", v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[MRRestrictedCommandClientsManager setLastAcceptedTokens:](self, "setLastAcceptedTokens:", v7);
  return v7;
}

uint64_t __62__MRRestrictedCommandClientsManager_restrictCommandClientsTo___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  _OWORD v6[2];

  if (a2)
    objc_msgSend(a2, "realToken");
  else
    memset(v6, 0, sizeof(v6));
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", v6, 32);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(*(id *)(a1 + 32), "containsObject:", v3);

  return v4;
}

- (void)republishStateIfNeeded
{
  void *v5;
  int v6;
  void *v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "lastAcceptedTokens");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 138412546;
  v7 = v5;
  v8 = 2112;
  v9 = a2;
  _os_log_error_impl(&dword_193827000, a3, OS_LOG_TYPE_ERROR, "[RestrictedCommandClients Mode] Republish Error: \n Tried to restrict to %@ but %@ was accepted.", (uint8_t *)&v6, 0x16u);

}

- (id)_restrictCommandClientsTo:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  _xpc_connection_s *v6;
  xpc_object_t v7;
  UInt8 *v8;
  void *v9;

  MRCreateDataFromArray(a3, &__block_literal_global_6_5);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  MRGetSharedService();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  MRCreateXPCMessage(0x40000000000000DuLL);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  MRAddDataToXPCMessage(v5, v3, "MRXPC_RESTRICT_COMMANDS_ARRAY_DATA_KEY");
  objc_msgSend(v4, "connection");
  v6 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
  v7 = xpc_connection_send_message_with_reply_sync(v6, v5);

  v8 = (UInt8 *)MRCreateDataFromXPCMessage(v7, "MRXPC_RESTRICT_COMMANDS_ARRAY_DATA_KEY");
  MRCreateArrayFromData(v8, &__block_literal_global_9_2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

id __63__MRRestrictedCommandClientsManager__restrictCommandClientsTo___block_invoke(uint64_t a1, void *a2)
{
  _OWORD v3[2];

  if (a2)
    objc_msgSend(a2, "realToken");
  else
    memset(v3, 0, sizeof(v3));
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", v3, 32);
  return (id)objc_claimAutoreleasedReturnValue();
}

id __63__MRRestrictedCommandClientsManager__restrictCommandClientsTo___block_invoke_2(uint64_t a1, void *a2)
{
  return a2;
}

- (NSArray)lastAcceptedTokens
{
  return self->_lastAcceptedTokens;
}

- (void)setLastAcceptedTokens:(id)a3
{
  objc_storeStrong((id *)&self->_lastAcceptedTokens, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastAcceptedTokens, 0);
}

@end
