@implementation NETransparentProxyNetworkSettings

- (NETransparentProxyNetworkSettings)initWithCoder:(id)a3
{
  id v4;
  NETransparentProxyNetworkSettings *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  NSArray *includedNetworkRules;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  NSArray *excludedNetworkRules;
  objc_super v17;

  v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)NETransparentProxyNetworkSettings;
  v5 = -[NETunnelNetworkSettings initWithCoder:](&v17, sel_initWithCoder_, v4);
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0C99E60];
    v7 = objc_opt_class();
    objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("included-rules"));
    v9 = objc_claimAutoreleasedReturnValue();
    includedNetworkRules = v5->_includedNetworkRules;
    v5->_includedNetworkRules = (NSArray *)v9;

    v11 = (void *)MEMORY[0x1E0C99E60];
    v12 = objc_opt_class();
    objc_msgSend(v11, "setWithObjects:", v12, objc_opt_class(), 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v13, CFSTR("excluded-rules"));
    v14 = objc_claimAutoreleasedReturnValue();
    excludedNetworkRules = v5->_excludedNetworkRules;
    v5->_excludedNetworkRules = (NSArray *)v14;

    v5->_isFullyTransparent = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("is-fully-transparent"));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)NETransparentProxyNetworkSettings;
  v4 = a3;
  -[NETunnelNetworkSettings encodeWithCoder:](&v7, sel_encodeWithCoder_, v4);
  -[NETransparentProxyNetworkSettings includedNetworkRules](self, "includedNetworkRules", v7.receiver, v7.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("included-rules"));

  -[NETransparentProxyNetworkSettings excludedNetworkRules](self, "excludedNetworkRules");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("excluded-rules"));

  objc_msgSend(v4, "encodeBool:forKey:", -[NETransparentProxyNetworkSettings isFullyTransparent](self, "isFullyTransparent"), CFSTR("is-fully-transparent"));
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)NETransparentProxyNetworkSettings;
  v4 = -[NETunnelNetworkSettings copyWithZone:](&v8, sel_copyWithZone_, a3);
  -[NETransparentProxyNetworkSettings includedNetworkRules](self, "includedNetworkRules");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setIncludedNetworkRules:", v5);

  -[NETransparentProxyNetworkSettings excludedNetworkRules](self, "excludedNetworkRules");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setExcludedNetworkRules:", v6);

  objc_msgSend(v4, "setIsFullyTransparent:", -[NETransparentProxyNetworkSettings isFullyTransparent](self, "isFullyTransparent"));
  return v4;
}

- (BOOL)checkValidityAndCollectErrors:(id)a3
{
  id v4;
  unsigned int v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t j;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  objc_super v25;
  _BYTE v26[128];
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v25.receiver = self;
  v25.super_class = (Class)NETransparentProxyNetworkSettings;
  v5 = -[NETunnelNetworkSettings checkValidityAndCollectErrors:](&v25, sel_checkValidityAndCollectErrors_, v4);
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  -[NETransparentProxyNetworkSettings includedNetworkRules](self, "includedNetworkRules");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v21, v27, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v22;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v22 != v9)
          objc_enumerationMutation(v6);
        v5 &= -[NETransparentProxyNetworkSettings validateNetworkRule:collectErrors:]((uint64_t)self, *(void **)(*((_QWORD *)&v21 + 1) + 8 * i), v4);
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v21, v27, 16);
    }
    while (v8);
  }

  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  -[NETransparentProxyNetworkSettings excludedNetworkRules](self, "excludedNetworkRules", 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v17, v26, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v18;
    do
    {
      for (j = 0; j != v13; ++j)
      {
        if (*(_QWORD *)v18 != v14)
          objc_enumerationMutation(v11);
        v5 &= -[NETransparentProxyNetworkSettings validateNetworkRule:collectErrors:]((uint64_t)self, *(void **)(*((_QWORD *)&v17 + 1) + 8 * j), v4);
      }
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v17, v26, 16);
    }
    while (v13);
  }

  return v5;
}

- (id)descriptionWithIndent:(int)a3 options:(unint64_t)a4
{
  uint64_t v5;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  objc_super v13;

  v5 = *(_QWORD *)&a3;
  v7 = objc_alloc(MEMORY[0x1E0CB37A0]);
  v13.receiver = self;
  v13.super_class = (Class)NETransparentProxyNetworkSettings;
  -[NETunnelNetworkSettings descriptionWithIndent:options:](&v13, sel_descriptionWithIndent_options_, v5, a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v7, "initWithString:", v8);

  -[NETransparentProxyNetworkSettings includedNetworkRules](self, "includedNetworkRules");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "appendPrettyObject:withName:andIndent:options:", v10, CFSTR("includedNetworkRules"), v5, a4 | 1);

  -[NETransparentProxyNetworkSettings excludedNetworkRules](self, "excludedNetworkRules");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "appendPrettyObject:withName:andIndent:options:", v11, CFSTR("excludedNetworkRules"), v5, a4 | 1);

  objc_msgSend(v9, "appendPrettyBOOL:withName:andIndent:options:", -[NETransparentProxyNetworkSettings isFullyTransparent](self, "isFullyTransparent"), CFSTR("isFullyTransparent"), v5, a4 | 8);
  return v9;
}

- (NSArray)includedNetworkRules
{
  return (NSArray *)objc_getProperty(self, a2, 40, 1);
}

- (void)setIncludedNetworkRules:(NSArray *)includedNetworkRules
{
  objc_setProperty_atomic_copy(self, a2, includedNetworkRules, 40);
}

- (NSArray)excludedNetworkRules
{
  return (NSArray *)objc_getProperty(self, a2, 48, 1);
}

- (void)setExcludedNetworkRules:(NSArray *)excludedNetworkRules
{
  objc_setProperty_atomic_copy(self, a2, excludedNetworkRules, 48);
}

- (BOOL)isFullyTransparent
{
  return self->_isFullyTransparent;
}

- (void)setIsFullyTransparent:(BOOL)a3
{
  self->_isFullyTransparent = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_excludedNetworkRules, 0);
  objc_storeStrong((id *)&self->_includedNetworkRules, 0);
}

- (uint64_t)validateNetworkRule:(void *)a3 collectErrors:
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  nw_endpoint_type_t type;
  NSObject *v11;
  int port;
  NSObject *v13;
  sockaddr *address;
  _BOOL4 v15;
  void *v16;
  NSObject *v17;
  int v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;

  v5 = a2;
  v6 = a3;
  if (a1)
  {
    a1 = objc_msgSend(v5, "checkValidityAndCollectErrors:", v6);
    objc_msgSend(v5, "matchRemoteHostOrNetworkEndpoint");
    v7 = objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      v8 = (void *)v7;
      objc_msgSend(v5, "matchRemoteHostOrNetworkEndpoint");
      v9 = objc_claimAutoreleasedReturnValue();
      type = nw_endpoint_get_type(v9);

      if (type == nw_endpoint_type_address)
      {
        objc_msgSend(v5, "matchRemoteHostOrNetworkEndpoint");
        v11 = objc_claimAutoreleasedReturnValue();
        port = nw_endpoint_get_port(v11);

        if (!port)
        {
          objc_msgSend(v5, "matchRemoteHostOrNetworkEndpoint");
          v13 = objc_claimAutoreleasedReturnValue();
          address = (sockaddr *)nw_endpoint_get_address(v13);
          v15 = NEIsWildcardAddress(&address->sa_len);

          if (v15)
          {
            NEResourcesCopyLocalizedNSString(CFSTR("NETWORK_RULE_ERROR_INVALID_ADDRESS"), CFSTR("NETWORK_RULE_ERROR_INVALID_ADDRESS"));
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v6, "addObject:", v16);

            a1 = 0;
          }
        }
        objc_msgSend(v5, "matchRemoteHostOrNetworkEndpoint");
        v17 = objc_claimAutoreleasedReturnValue();
        v18 = nw_endpoint_get_port(v17);

        if (v18 == 53)
        {
          NEResourcesCopyLocalizedNSString(CFSTR("NETWORK_RULE_ERROR_INVALID_PORT"), CFSTR("NETWORK_RULE_ERROR_INVALID_PORT"));
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "addObject:", v19);

          a1 = 0;
        }
      }
    }
    objc_msgSend(v5, "matchLocalNetworkEndpoint");
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    if (v20)
    {
      NEResourcesCopyLocalizedNSString(CFSTR("NETWORK_RULE_ERROR_INVALID_LOCAL_NETWORK"), CFSTR("NETWORK_RULE_ERROR_INVALID_LOCAL_NETWORK"));
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "addObject:", v21);

      a1 = 0;
    }
    if (objc_msgSend(v5, "matchDirection") != 2)
    {
      NEResourcesCopyLocalizedNSString(CFSTR("NETWORK_RULE_ERROR_UNSUPPORTED_DIRECTION"), CFSTR("NETWORK_RULE_ERROR_UNSUPPORTED_DIRECTION"));
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "addObject:", v22);

      a1 = 0;
    }
  }

  return a1;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
