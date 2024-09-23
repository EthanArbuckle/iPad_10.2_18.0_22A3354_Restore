@implementation NEProxyConfigurationNetworkAgent

- (id)agentDescription
{
  return (id)objc_msgSend((id)objc_opt_class(), "agentType");
}

- (NEProxyConfigurationNetworkAgent)initWithProxyConfiguration:(id)a3
{
  id v4;
  NEProxyConfigurationNetworkAgent *v5;
  uint64_t ProxyAgentData;
  NSData *agentData;
  NEProxyConfigurationNetworkAgent *v8;
  NSObject *v9;
  objc_super v11;
  uint8_t buf[4];
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)NEProxyConfigurationNetworkAgent;
  v5 = -[NEProxyConfigurationNetworkAgent init](&v11, sel_init);
  if (!v5)
  {
LABEL_7:
    v8 = 0;
    goto LABEL_8;
  }
  ProxyAgentData = SCNetworkProxiesCreateProxyAgentData();
  if (!ProxyAgentData)
  {
    ne_log_obj();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v13 = v4;
      _os_log_error_impl(&dword_19BD16000, v9, OS_LOG_TYPE_ERROR, "Failed to turn proxy configuration into agent data: %@", buf, 0xCu);
    }

    goto LABEL_7;
  }
  agentData = v5->_agentData;
  v5->_agentData = (NSData *)ProxyAgentData;

  v8 = v5;
LABEL_8:

  return v8;
}

- (id)copyAgentData
{
  if (self)
    self = (NEProxyConfigurationNetworkAgent *)objc_getProperty(self, a2, 80, 1);
  return (id)-[NEProxyConfigurationNetworkAgent copy](self, "copy");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_agentData, 0);
}

+ (id)agentDomain
{
  return CFSTR("SystemConfig");
}

+ (id)agentType
{
  return CFSTR("ProxyAgent");
}

+ (id)agentFromData:(id)a3
{
  id v3;
  NEProxyConfigurationNetworkAgent *v4;
  const char *v5;
  NEProxyConfigurationNetworkAgent *v6;

  v3 = a3;
  v4 = objc_alloc_init(NEProxyConfigurationNetworkAgent);
  v6 = v4;
  if (v4)
    objc_setProperty_atomic(v4, v5, v3, 80);

  return v6;
}

@end
