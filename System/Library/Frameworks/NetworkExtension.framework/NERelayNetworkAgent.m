@implementation NERelayNetworkAgent

- (id)agentDescription
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)NERelayNetworkAgent;
  -[NENetworkAgent agentDescription](&v3, sel_agentDescription);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)copyAgentData
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[3];

  v9[2] = *MEMORY[0x1E0C80C00];
  -[NERelayNetworkAgent proxyConfig](self, "proxyConfig");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
    return 0;
  v9[0] = 0;
  v9[1] = 0;
  -[NENetworkAgent configurationUUID](self, "configurationUUID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "getUUIDBytes:", v9);

  -[NERelayNetworkAgent proxyConfig](self, "proxyConfig");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  nw_proxy_config_set_identifier();

  -[NERelayNetworkAgent proxyConfig](self, "proxyConfig");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)nw_proxy_config_copy_agent_data();

  return v7;
}

- (OS_nw_proxy_config)proxyConfig
{
  return (OS_nw_proxy_config *)objc_getProperty(self, a2, 80, 1);
}

- (void)setProxyConfig:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 80);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_proxyConfig, 0);
}

+ (id)agentDomain
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", nw_proxy_config_get_agent_domain());
}

+ (id)agentType
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", nw_proxy_config_get_agent_type());
}

+ (id)agentFromData:(id)a3
{
  return 0;
}

@end
