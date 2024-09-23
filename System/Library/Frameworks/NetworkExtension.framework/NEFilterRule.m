@implementation NEFilterRule

- (NEFilterRule)initWithNetworkRule:(NENetworkRule *)networkRule action:(NEFilterAction)action
{
  NENetworkRule *v6;
  NEFilterRule *v7;
  uint64_t v8;
  NENetworkRule *v9;
  objc_super v11;

  v6 = networkRule;
  v11.receiver = self;
  v11.super_class = (Class)NEFilterRule;
  v7 = -[NEFilterRule init](&v11, sel_init);
  if (v7)
  {
    v8 = -[NENetworkRule copy](v6, "copy");
    v9 = v7->_networkRule;
    v7->_networkRule = (NENetworkRule *)v8;

    v7->_action = action;
  }

  return v7;
}

- (BOOL)checkValidityAndCollectErrors:(id)a3
{
  id v4;
  BOOL v5;
  uint64_t v6;
  void *v7;
  NSObject *v8;
  nw_endpoint_type_t type;
  NSObject *v10;
  int port;
  NSObject *v12;
  sockaddr *address;
  NETrafficDirection v15;

  v4 = a3;
  v5 = -[NENetworkRule checkValidityAndCollectErrors:](self->_networkRule, "checkValidityAndCollectErrors:", v4);
  -[NENetworkRule matchRemoteHostOrNetworkEndpoint](self->_networkRule, "matchRemoteHostOrNetworkEndpoint");
  v6 = objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v7 = (void *)v6;
    -[NENetworkRule matchRemoteHostOrNetworkEndpoint](self->_networkRule, "matchRemoteHostOrNetworkEndpoint");
    v8 = objc_claimAutoreleasedReturnValue();
    type = nw_endpoint_get_type(v8);

    if (type == nw_endpoint_type_address)
    {
      -[NENetworkRule matchRemoteHostOrNetworkEndpoint](self->_networkRule, "matchRemoteHostOrNetworkEndpoint");
      v10 = objc_claimAutoreleasedReturnValue();
      port = nw_endpoint_get_port(v10);

      if (!port)
      {
        -[NENetworkRule matchRemoteHostOrNetworkEndpoint](self->_networkRule, "matchRemoteHostOrNetworkEndpoint");
        v12 = objc_claimAutoreleasedReturnValue();
        address = (sockaddr *)nw_endpoint_get_address(v12);
        if (NEIsWildcardAddress(&address->sa_len)
          && -[NENetworkRule matchProtocol](self->_networkRule, "matchProtocol") == NENetworkRuleProtocolAny)
        {
          v15 = -[NENetworkRule matchDirection](self->_networkRule, "matchDirection");

          if (v15)
            goto LABEL_7;
          NEResourcesCopyLocalizedNSString(CFSTR("FILTER_RULE_INVALID_NETWORK_RULE"), CFSTR("FILTER_RULE_INVALID_NETWORK_RULE"));
          v12 = objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "addObject:", v12);
          v5 = 0;
        }

      }
    }
  }
LABEL_7:

  return v5;
}

- (id)descriptionWithIndent:(int)a3 options:(unint64_t)a4
{
  uint64_t v5;
  id v7;
  void *v8;

  v5 = *(_QWORD *)&a3;
  v7 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  objc_msgSend(v7, "appendPrettyObject:withName:andIndent:options:", self->_networkRule, CFSTR("networkRule"), v5, a4);
  +[NEFilterProvider descriptionForAction:]((uint64_t)NEFilterProvider, self->_action);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "appendPrettyObject:withName:andIndent:options:", v8, CFSTR("action"), v5, a4);

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  NENetworkRule *networkRule;
  id v5;

  networkRule = self->_networkRule;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", networkRule, CFSTR("rule"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_action, CFSTR("action"));

}

- (NEFilterRule)initWithCoder:(id)a3
{
  id v4;
  NEFilterRule *v5;
  uint64_t v6;
  NENetworkRule *networkRule;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)NEFilterRule;
  v5 = -[NEFilterRule init](&v9, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("rule"));
    v6 = objc_claimAutoreleasedReturnValue();
    networkRule = v5->_networkRule;
    v5->_networkRule = (NENetworkRule *)v6;

    v5->_action = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("action"));
  }

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[NEFilterRule initWithNetworkRule:action:](+[NEFilterRule allocWithZone:](NEFilterRule, "allocWithZone:", a3), "initWithNetworkRule:action:", self->_networkRule, self->_action);
}

- (NENetworkRule)networkRule
{
  return (NENetworkRule *)objc_getProperty(self, a2, 8, 1);
}

- (NEFilterAction)action
{
  return self->_action;
}

- (NEAppRule)appRule
{
  return (NEAppRule *)objc_getProperty(self, a2, 24, 1);
}

- (NSUUID)effectiveUUID
{
  return (NSUUID *)objc_getProperty(self, a2, 32, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_effectiveUUID, 0);
  objc_storeStrong((id *)&self->_appRule, 0);
  objc_storeStrong((id *)&self->_networkRule, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
