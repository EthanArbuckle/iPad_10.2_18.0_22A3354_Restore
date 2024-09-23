@implementation NENetworkRule

- (NENetworkRule)initWithDestinationNetworkEndpoint:(id)a3 prefix:(unint64_t)a4 protocol:(int64_t)a5
{
  id v9;
  NENetworkRule *v10;
  NENetworkRule *v11;
  NSObject *matchRemoteHostOrNetworkEndpoint;
  sockaddr *address;
  BOOL v14;
  objc_super v16;

  v9 = a3;
  v16.receiver = self;
  v16.super_class = (Class)NENetworkRule;
  v10 = -[NENetworkRule init](&v16, sel_init);
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_matchRemoteHostOrNetworkEndpoint, a3);
    v11->_matchRemotePrefix = a4;
    v11->_matchLocalPrefix = 0x7FFFFFFFFFFFFFFFLL;
    v11->_matchProtocol = a5;
    v11->_matchDirection = 2;
    matchRemoteHostOrNetworkEndpoint = v11->_matchRemoteHostOrNetworkEndpoint;
    if (matchRemoteHostOrNetworkEndpoint)
    {
      if (nw_endpoint_get_type(matchRemoteHostOrNetworkEndpoint) == nw_endpoint_type_address)
      {
        address = (sockaddr *)nw_endpoint_get_address((nw_endpoint_t)v11->_matchRemoteHostOrNetworkEndpoint);
        v14 = NEIsLoopbackAddress(&address->sa_len);
      }
      else
      {
        v14 = 0;
      }
      v11->_appliesToLoopback = v14;
    }
  }

  return v11;
}

- (NENetworkRule)initWithDestinationNetwork:(NWHostEndpoint *)networkEndpoint prefix:(NSUInteger)destinationPrefix protocol:(NENetworkRuleProtocol)protocol
{
  void *v8;
  NENetworkRule *v9;

  v8 = (void *)-[NWHostEndpoint copyCEndpoint](networkEndpoint, "copyCEndpoint");
  v9 = -[NENetworkRule initWithDestinationNetworkEndpoint:prefix:protocol:](self, "initWithDestinationNetworkEndpoint:prefix:protocol:", v8, destinationPrefix, protocol);

  return v9;
}

- (NENetworkRule)initWithDestinationHostEndpoint:(id)a3 protocol:(int64_t)a4
{
  id v7;
  NENetworkRule *v8;
  NENetworkRule *v9;
  NSObject *matchRemoteHostOrNetworkEndpoint;
  sockaddr *address;
  BOOL v12;
  objc_super v14;

  v7 = a3;
  v14.receiver = self;
  v14.super_class = (Class)NENetworkRule;
  v8 = -[NENetworkRule init](&v14, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_matchRemoteHostOrNetworkEndpoint, a3);
    v9->_matchRemotePrefix = 0x7FFFFFFFFFFFFFFFLL;
    v9->_matchLocalPrefix = 0x7FFFFFFFFFFFFFFFLL;
    v9->_matchProtocol = a4;
    v9->_matchDirection = 2;
    matchRemoteHostOrNetworkEndpoint = v9->_matchRemoteHostOrNetworkEndpoint;
    if (matchRemoteHostOrNetworkEndpoint)
    {
      if (nw_endpoint_get_type(matchRemoteHostOrNetworkEndpoint) == nw_endpoint_type_address)
      {
        address = (sockaddr *)nw_endpoint_get_address((nw_endpoint_t)v9->_matchRemoteHostOrNetworkEndpoint);
        v12 = NEIsLoopbackAddress(&address->sa_len);
      }
      else
      {
        v12 = 0;
      }
      v9->_appliesToLoopback = v12;
    }
  }

  return v9;
}

- (NENetworkRule)initWithDestinationHost:(NWHostEndpoint *)hostEndpoint protocol:(NENetworkRuleProtocol)protocol
{
  void *v6;
  NENetworkRule *v7;

  v6 = (void *)-[NWHostEndpoint copyCEndpoint](hostEndpoint, "copyCEndpoint");
  v7 = -[NENetworkRule initWithDestinationHostEndpoint:protocol:](self, "initWithDestinationHostEndpoint:protocol:", v6, protocol);

  return v7;
}

- (NENetworkRule)initWithRemoteNetworkEndpoint:(id)a3 remotePrefix:(unint64_t)a4 localNetworkEndpoint:(id)a5 localPrefix:(unint64_t)a6 protocol:(int64_t)a7 direction:(int64_t)a8
{
  id v15;
  NENetworkRule *v16;
  NENetworkRule *v17;
  NSObject *matchLocalNetworkEndpoint;
  sockaddr *address;
  BOOL v20;

  v15 = a5;
  v16 = -[NENetworkRule initWithDestinationNetworkEndpoint:prefix:protocol:](self, "initWithDestinationNetworkEndpoint:prefix:protocol:", a3, a4, a7);
  v17 = v16;
  if (v16)
  {
    objc_storeStrong((id *)&v16->_matchLocalNetworkEndpoint, a5);
    matchLocalNetworkEndpoint = v17->_matchLocalNetworkEndpoint;
    if (matchLocalNetworkEndpoint)
    {
      v17->_matchLocalPrefix = a6;
      if (!v17->_appliesToLoopback)
      {
        if (nw_endpoint_get_type(matchLocalNetworkEndpoint) == nw_endpoint_type_address)
        {
          address = (sockaddr *)nw_endpoint_get_address((nw_endpoint_t)v17->_matchLocalNetworkEndpoint);
          v20 = NEIsLoopbackAddress(&address->sa_len);
        }
        else
        {
          v20 = 0;
        }
        v17->_appliesToLoopback = v20;
      }
    }
    v17->_matchDirection = a8;
  }

  return v17;
}

- (NENetworkRule)initWithRemoteNetwork:(NWHostEndpoint *)remoteNetwork remotePrefix:(NSUInteger)remotePrefix localNetwork:(NWHostEndpoint *)localNetwork localPrefix:(NSUInteger)localPrefix protocol:(NENetworkRuleProtocol)protocol direction:(NETrafficDirection)direction
{
  NWHostEndpoint *v14;
  void *v15;
  void *v16;
  NENetworkRule *v17;

  v14 = localNetwork;
  v15 = (void *)-[NWHostEndpoint copyCEndpoint](remoteNetwork, "copyCEndpoint");
  v16 = (void *)-[NWHostEndpoint copyCEndpoint](v14, "copyCEndpoint");

  v17 = -[NENetworkRule initWithRemoteNetworkEndpoint:remotePrefix:localNetworkEndpoint:localPrefix:protocol:direction:](self, "initWithRemoteNetworkEndpoint:remotePrefix:localNetworkEndpoint:localPrefix:protocol:direction:", v15, remotePrefix, v16, localPrefix, protocol, direction);
  return v17;
}

- (NWHostEndpoint)matchRemoteEndpoint
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[NENetworkRule matchRemoteHostOrNetworkEndpoint](self, "matchRemoteHostOrNetworkEndpoint");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = (void *)MEMORY[0x1E0CCEC78];
    -[NENetworkRule matchRemoteHostOrNetworkEndpoint](self, "matchRemoteHostOrNetworkEndpoint");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "endpointWithCEndpoint:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }

  return (NWHostEndpoint *)v6;
}

- (NWHostEndpoint)matchLocalNetwork
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[NENetworkRule matchLocalNetworkEndpoint](self, "matchLocalNetworkEndpoint");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = (void *)MEMORY[0x1E0CCEC78];
    -[NENetworkRule matchLocalNetworkEndpoint](self, "matchLocalNetworkEndpoint");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "endpointWithCEndpoint:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }

  return (NWHostEndpoint *)v6;
}

- (BOOL)checkValidityAndCollectErrors:(id)a3
{
  id v4;
  NSObject *matchLocalNetworkEndpoint;
  nw_endpoint_type_t type;
  BOOL v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *matchRemoteHostOrNetworkEndpoint;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  NSObject *v28;
  int sa_family;
  unint64_t v30;
  unint64_t matchRemotePrefix;
  id v32;
  void *v33;
  void *v34;
  id v35;
  void *v36;
  void *v37;

  v4 = a3;
  matchLocalNetworkEndpoint = self->_matchLocalNetworkEndpoint;
  if (matchLocalNetworkEndpoint)
  {
    type = nw_endpoint_get_type(matchLocalNetworkEndpoint);
    v7 = type == nw_endpoint_type_address;
    if (type != nw_endpoint_type_address)
    {
      v8 = objc_alloc(MEMORY[0x1E0CB3940]);
      NEResourcesCopyLocalizedNSString(CFSTR("NETWORK_RULE_ERROR_INVALID_LOCAL_NETWORK_ADDRESS"), CFSTR("NETWORK_RULE_ERROR_INVALID_LOCAL_NETWORK_ADDRESS"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", nw_endpoint_get_hostname((nw_endpoint_t)self->_matchLocalNetworkEndpoint));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = (void *)objc_msgSend(v8, "initWithFormat:", v9, v10);
      objc_msgSend(v4, "addObject:", v11);

    }
    matchRemoteHostOrNetworkEndpoint = self->_matchRemoteHostOrNetworkEndpoint;
    if (matchRemoteHostOrNetworkEndpoint
      && nw_endpoint_get_type(matchRemoteHostOrNetworkEndpoint) != nw_endpoint_type_address)
    {
      v13 = objc_alloc(MEMORY[0x1E0CB3940]);
      NEResourcesCopyLocalizedNSString(CFSTR("NETWORK_RULE_ERROR_INVALID_REMOTE_NETWORK_ADDRESS"), CFSTR("NETWORK_RULE_ERROR_INVALID_REMOTE_NETWORK_ADDRESS"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", nw_endpoint_get_hostname((nw_endpoint_t)self->_matchRemoteHostOrNetworkEndpoint));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = (void *)objc_msgSend(v13, "initWithFormat:", v14, v15);
      objc_msgSend(v4, "addObject:", v16);

      v7 = 0;
    }
  }
  else
  {
    v7 = 1;
  }
  v17 = self->_matchRemoteHostOrNetworkEndpoint;
  if (v17 && nw_endpoint_get_type(v17) == nw_endpoint_type_host)
  {
    objc_msgSend(MEMORY[0x1E0CB3500], "characterSetWithCharactersInString:", CFSTR("*."));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", nw_endpoint_get_hostname((nw_endpoint_t)self->_matchRemoteHostOrNetworkEndpoint));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "stringByTrimmingCharactersInSet:", v18);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    if (!objc_msgSend(v20, "length"))
    {
      v21 = objc_alloc(MEMORY[0x1E0CB3940]);
      NEResourcesCopyLocalizedNSString(CFSTR("NETWORK_RULE_ERROR_INVALID_DOMAIN"), CFSTR("NETWORK_RULE_ERROR_INVALID_DOMAIN"));
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", nw_endpoint_get_hostname((nw_endpoint_t)self->_matchRemoteHostOrNetworkEndpoint));
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = (void *)objc_msgSend(v21, "initWithFormat:", v22, v23);
      objc_msgSend(v4, "addObject:", v24);

      v7 = 0;
    }

  }
  if (self->_matchProtocol >= 3uLL)
  {
    v25 = objc_alloc(MEMORY[0x1E0CB3940]);
    NEResourcesCopyLocalizedNSString(CFSTR("NETWORK_RULE_ERROR_INVALID_PROTOCOL"), CFSTR("NETWORK_RULE_ERROR_INVALID_PROTOCOL"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = (void *)objc_msgSend(v25, "initWithFormat:", v26, self->_matchProtocol);
    objc_msgSend(v4, "addObject:", v27);

    v7 = 0;
  }
  v28 = self->_matchRemoteHostOrNetworkEndpoint;
  if (v28 && nw_endpoint_get_type(v28) == nw_endpoint_type_address)
  {
    sa_family = nw_endpoint_get_address((nw_endpoint_t)self->_matchRemoteHostOrNetworkEndpoint)->sa_family;
    v30 = sa_family == 2 ? 32 : (unint64_t)(sa_family == 30) << 7;
    matchRemotePrefix = self->_matchRemotePrefix;
    if (matchRemotePrefix == 0x7FFFFFFFFFFFFFFFLL || matchRemotePrefix > v30)
    {
      v32 = objc_alloc(MEMORY[0x1E0CB3940]);
      NEResourcesCopyLocalizedNSString(CFSTR("NETWORK_RULE_ERROR_INVALID_PREFIX"), CFSTR("NETWORK_RULE_ERROR_INVALID_PREFIX"));
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = (void *)objc_msgSend(v32, "initWithFormat:", v33, self->_matchRemotePrefix, v30);
      objc_msgSend(v4, "addObject:", v34);

      v7 = 0;
    }
  }
  if (self->_matchDirection >= 3uLL)
  {
    v35 = objc_alloc(MEMORY[0x1E0CB3940]);
    NEResourcesCopyLocalizedNSString(CFSTR("NETWORK_RULE_ERROR_INVALID_DIRECTION"), CFSTR("NETWORK_RULE_ERROR_INVALID_DIRECTION"));
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = (void *)objc_msgSend(v35, "initWithFormat:", v36, self->_matchDirection);
    objc_msgSend(v4, "addObject:", v37);

    v7 = 0;
  }

  return v7;
}

- (id)descriptionWithIndent:(int)a3 options:(unint64_t)a4
{
  uint64_t v5;
  void *v7;
  void *v8;
  unint64_t v9;
  OS_nw_endpoint *matchRemoteHostOrNetworkEndpoint;
  unint64_t matchRemotePrefix;
  OS_nw_endpoint *matchLocalNetworkEndpoint;
  unint64_t matchLocalPrefix;
  unint64_t matchProtocol;
  unint64_t matchDirection;
  __CFString *v16;

  v5 = *(_QWORD *)&a3;
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithCapacity:", 0);
  v8 = v7;
  v9 = a4 & 0xFFFFFFFFFFFFFFF7;
  matchRemoteHostOrNetworkEndpoint = self->_matchRemoteHostOrNetworkEndpoint;
  if (matchRemoteHostOrNetworkEndpoint)
    objc_msgSend(v7, "appendPrettyObject:withName:andIndent:options:", matchRemoteHostOrNetworkEndpoint, CFSTR("matchRemoteEndpoint"), v5, v9);
  matchRemotePrefix = self->_matchRemotePrefix;
  if (matchRemotePrefix != 0x7FFFFFFFFFFFFFFFLL)
    objc_msgSend(v8, "appendPrettyInt:withName:andIndent:options:", matchRemotePrefix, CFSTR("matchRemotePrefix"), v5, v9);
  matchLocalNetworkEndpoint = self->_matchLocalNetworkEndpoint;
  if (matchLocalNetworkEndpoint)
    objc_msgSend(v8, "appendPrettyObject:withName:andIndent:options:", matchLocalNetworkEndpoint, CFSTR("matchLocalNetwork"), v5, v9);
  matchLocalPrefix = self->_matchLocalPrefix;
  if (matchLocalPrefix != 0x7FFFFFFFFFFFFFFFLL)
    objc_msgSend(v8, "appendPrettyInt:withName:andIndent:options:", matchLocalPrefix, CFSTR("matchLocalPrefix"), v5, v9);
  matchProtocol = self->_matchProtocol;
  if (matchProtocol > 2)
    objc_msgSend(v8, "appendPrettyInt:withName:andIndent:options:");
  else
    objc_msgSend(v8, "appendPrettyObject:withName:andIndent:options:", off_1E3CBF3B8[matchProtocol], CFSTR("matchProtocol"), v5, v9);
  matchDirection = self->_matchDirection;
  if (matchDirection > 2)
    v16 = 0;
  else
    v16 = off_1E3CBF3D0[matchDirection];
  objc_msgSend(v8, "appendPrettyObject:withName:andIndent:options:", v16, CFSTR("matchDirection"), v5, v9);
  objc_msgSend(v8, "appendPrettyBOOL:withName:andIndent:options:", self->_appliesToLoopback, CFSTR("appliesToLoopback"), v5, v9);
  return v8;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  if (self->_matchRemoteHostOrNetworkEndpoint)
  {
    objc_msgSend(MEMORY[0x1E0CCEC78], "endpointWithCEndpoint:");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "encodeObject:forKey:", v4, CFSTR("destinationEndpoint"));

  }
  objc_msgSend(v6, "encodeInteger:forKey:", self->_matchRemotePrefix, CFSTR("destinationPrefix"));
  if (self->_matchLocalNetworkEndpoint)
  {
    objc_msgSend(MEMORY[0x1E0CCEC78], "endpointWithCEndpoint:");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "encodeObject:forKey:", v5, CFSTR("localNetwork"));

  }
  objc_msgSend(v6, "encodeInteger:forKey:", self->_matchLocalPrefix, CFSTR("localPrefix"));
  objc_msgSend(v6, "encodeInteger:forKey:", self->_matchProtocol, CFSTR("protocol"));
  objc_msgSend(v6, "encodeInteger:forKey:", self->_matchDirection, CFSTR("direction"));
  objc_msgSend(v6, "encodeBool:forKey:", self->_appliesToLoopback, CFSTR("loopback"));

}

- (NENetworkRule)initWithCoder:(id)a3
{
  id v4;
  NENetworkRule *v5;
  void *v6;
  uint64_t v7;
  OS_nw_endpoint *matchRemoteHostOrNetworkEndpoint;
  void *v9;
  uint64_t v10;
  OS_nw_endpoint *matchLocalNetworkEndpoint;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)NENetworkRule;
  v5 = -[NENetworkRule init](&v13, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("destinationEndpoint"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "copyCEndpoint");
    matchRemoteHostOrNetworkEndpoint = v5->_matchRemoteHostOrNetworkEndpoint;
    v5->_matchRemoteHostOrNetworkEndpoint = (OS_nw_endpoint *)v7;

    v5->_matchRemotePrefix = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("destinationPrefix"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("localNetwork"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "copyCEndpoint");
    matchLocalNetworkEndpoint = v5->_matchLocalNetworkEndpoint;
    v5->_matchLocalNetworkEndpoint = (OS_nw_endpoint *)v10;

    v5->_matchLocalPrefix = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("localPrefix"));
    v5->_matchProtocol = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("protocol"));
    v5->_matchDirection = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("direction"));
    v5->_appliesToLoopback = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("loopback"));
  }

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  NENetworkRule *v4;

  v4 = -[NENetworkRule init](+[NENetworkRule allocWithZone:](NENetworkRule, "allocWithZone:", a3), "init");
  objc_storeStrong((id *)&v4->_matchRemoteHostOrNetworkEndpoint, self->_matchRemoteHostOrNetworkEndpoint);
  v4->_matchRemotePrefix = self->_matchRemotePrefix;
  objc_storeStrong((id *)&v4->_matchLocalNetworkEndpoint, self->_matchLocalNetworkEndpoint);
  v4->_matchLocalPrefix = self->_matchLocalPrefix;
  v4->_matchProtocol = self->_matchProtocol;
  v4->_matchDirection = self->_matchDirection;
  v4->_appliesToLoopback = self->_appliesToLoopback;
  return v4;
}

- (OS_nw_endpoint)matchRemoteHostOrNetworkEndpoint
{
  return (OS_nw_endpoint *)objc_getProperty(self, a2, 16, 1);
}

- (NSUInteger)matchRemotePrefix
{
  return self->_matchRemotePrefix;
}

- (OS_nw_endpoint)matchLocalNetworkEndpoint
{
  return (OS_nw_endpoint *)objc_getProperty(self, a2, 32, 1);
}

- (NSUInteger)matchLocalPrefix
{
  return self->_matchLocalPrefix;
}

- (NENetworkRuleProtocol)matchProtocol
{
  return self->_matchProtocol;
}

- (NETrafficDirection)matchDirection
{
  return self->_matchDirection;
}

- (BOOL)appliesToLoopback
{
  return self->_appliesToLoopback;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_matchLocalNetworkEndpoint, 0);
  objc_storeStrong((id *)&self->_matchRemoteHostOrNetworkEndpoint, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
