@implementation NETunnelProvider

- (void)setTunnelNetworkSettings:(NETunnelNetworkSettings *)tunnelNetworkSettings completionHandler:(void *)completionHandler
{
  NETunnelNetworkSettings *v6;
  void (**v7)(void *, void *);
  id v8;
  void *v9;
  void *v10;
  const __CFString **v11;
  uint64_t *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint8_t buf[4];
  NETunnelProvider *v21;
  uint64_t v22;
  const __CFString *v23;
  uint64_t v24;
  _QWORD v25[2];

  v25[1] = *MEMORY[0x1E0C80C00];
  v6 = tunnelNetworkSettings;
  v7 = completionHandler;
  v8 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  if (!v6)
    goto LABEL_8;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v9 = (void *)MEMORY[0x1E0CB35C8];
      v24 = *MEMORY[0x1E0CB2D50];
      v25[0] = CFSTR("NEPacketTunnelNetworkSettings can only be used with NEPacketTunnelProvider");
      v10 = (void *)MEMORY[0x1E0C99D80];
      v11 = (const __CFString **)v25;
      v12 = &v24;
      goto LABEL_14;
    }
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = (void *)MEMORY[0x1E0CB35C8];
      v22 = *MEMORY[0x1E0CB2D50];
      v23 = CFSTR("NEPacketTunnelNetworkSettings must be used with NEPacketTunnelProvider");
      v10 = (void *)MEMORY[0x1E0C99D80];
      v11 = &v23;
      v12 = &v22;
LABEL_14:
      objc_msgSend(v10, "dictionaryWithObjects:forKeys:count:", v11, v12, 1);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "errorWithDomain:code:userInfo:", CFSTR("NETunnelProviderErrorDomain"), 1, v16);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      v7[2](v7, v13);
      goto LABEL_17;
    }
  }
  if (!-[NETunnelNetworkSettings checkValidityAndCollectErrors:](v6, "checkValidityAndCollectErrors:", v8))
  {
    ne_log_obj();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v21 = self;
      _os_log_impl(&dword_19BD16000, v14, OS_LOG_TYPE_INFO, "%@: setTunnelConfiguration validation failed", buf, 0xCu);
    }

    if (objc_msgSend(v8, "count"))
    {
      objc_msgSend(v8, "componentsJoinedByString:", CFSTR("\n"), *MEMORY[0x1E0CB2D50]);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = v15;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v19, &v18, 1);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v13 = 0;
    }
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("NETunnelProviderErrorDomain"), 1, v13);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v7[2](v7, v17);

  }
  else
  {
LABEL_8:
    -[NEProvider context](self, "context");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setTunnelConfiguration:completionHandler:", v6, v7);
  }
LABEL_17:

}

- (BOOL)reasserting
{
  return self->_reasserting;
}

- (void)setReasserting:(BOOL)reasserting
{
  _BOOL8 v3;
  NSObject *v5;
  void *v6;
  int v7;
  NETunnelProvider *v8;
  __int16 v9;
  _BOOL4 v10;
  uint64_t v11;

  v3 = reasserting;
  v11 = *MEMORY[0x1E0C80C00];
  ne_log_obj();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 138412546;
    v8 = self;
    v9 = 1024;
    v10 = v3;
    _os_log_impl(&dword_19BD16000, v5, OS_LOG_TYPE_DEFAULT, "%@: setting reasserting %d", (uint8_t *)&v7, 0x12u);
  }

  self->_reasserting = v3;
  -[NEProvider context](self, "context");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "didSetReasserting:", v3);

}

- (void)handleAppMessage:(NSData *)messageData completionHandler:(void *)completionHandler
{
  NSData *v6;
  void (**v7)(void *, _QWORD);
  NSObject *v8;
  int v9;
  NETunnelProvider *v10;
  __int16 v11;
  NSData *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v6 = messageData;
  v7 = completionHandler;
  ne_log_obj();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    v9 = 138412546;
    v10 = self;
    v11 = 2112;
    v12 = v6;
    _os_log_impl(&dword_19BD16000, v8, OS_LOG_TYPE_INFO, "%@: Handle App Message with %@", (uint8_t *)&v9, 0x16u);
  }

  v7[2](v7, 0);
}

- (NETunnelProviderRoutingMethod)routingMethod
{
  NETunnelProvider *v2;
  void *v3;
  const char *v4;
  void *v5;
  id Property;
  id v7;
  void *v8;
  NETunnelProviderRoutingMethod v9;
  void *v10;
  const char *v11;
  void *v12;
  id v13;
  id v14;
  void *v15;
  uint64_t v16;

  v2 = self;
  objc_sync_enter(v2);
  -[NEProvider context](v2, "context");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v3;
  if (v3)
    Property = objc_getProperty(v3, v4, 48, 1);
  else
    Property = 0;
  v7 = Property;
  objc_msgSend(v7, "appVPN");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    v9 = NETunnelProviderRoutingMethodSourceApplication;
  }
  else
  {
    -[NEProvider context](v2, "context");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v10;
    if (v10)
      v13 = objc_getProperty(v10, v11, 48, 1);
    else
      v13 = 0;
    v14 = v13;
    objc_msgSend(v14, "VPN");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "tunnelType");

    if (v16 == 2)
      v9 = NETunnelProviderRoutingMethodNetworkRule;
    else
      v9 = NETunnelProviderRoutingMethodDestinationIP;
  }
  objc_sync_exit(v2);

  return v9;
}

- (NEVPNProtocol)protocolConfiguration
{
  return (NEVPNProtocol *)objc_getProperty(self, a2, 48, 1);
}

- (void)setProtocolConfiguration:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (NSArray)appRules
{
  return (NSArray *)objc_getProperty(self, a2, 56, 1);
}

- (void)setAppRules:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appRules, 0);
  objc_storeStrong((id *)&self->_protocolConfiguration, 0);
}

@end
