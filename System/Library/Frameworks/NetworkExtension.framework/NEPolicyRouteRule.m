@implementation NEPolicyRouteRule

- (NEPolicyRouteRule)init
{
  NSObject *v3;
  uint8_t v5[16];

  ne_log_obj();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v5 = 0;
    _os_log_error_impl(&dword_19BD16000, v3, OS_LOG_TYPE_ERROR, "Calling init on NEPolicyRouteRule is not valid", v5, 2u);
  }

  return 0;
}

- (id)descriptionWithIndent:(int)a3 options:(unint64_t)a4
{
  uint64_t v5;
  id v7;
  void *v8;
  unint64_t v9;
  const __CFString *v10;
  unint64_t v11;
  uint64_t v12;
  SEL v13;
  void *v14;

  v5 = *(_QWORD *)&a3;
  v7 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  v8 = v7;
  if (self)
  {
    v9 = self->_action - 1;
    if (v9 > 6)
      v10 = CFSTR("unknown");
    else
      v10 = (const __CFString *)*((_QWORD *)&off_1E3CC33B8 + v9);
    objc_msgSend(v7, "appendPrettyObject:withName:andIndent:options:", v10, CFSTR("action"), v5, a4);
    v11 = self->_type - 1;
    if (v11 < 7)
    {
      v12 = *((_QWORD *)&off_1E3CC33F0 + v11);
      goto LABEL_9;
    }
  }
  else
  {
    objc_msgSend(v7, "appendPrettyObject:withName:andIndent:options:", 0, CFSTR("action"), v5, a4);
  }
  v12 = 0;
LABEL_9:
  objc_msgSend(v8, "appendPrettyObject:withName:andIndent:options:", v12, CFSTR("type"), v5, a4);
  objc_msgSend(v8, "appendPrettyObject:withName:andIndent:options:", self->_interfaceName, CFSTR("interface"), v5, a4);
  objc_msgSend(v8, "appendPrettyObject:withName:andIndent:options:", objc_getProperty(self, v13, 40, 1), CFSTR("matchNetworkAgent"), v5, a4);
  -[NEPolicyRouteRule networkAgentUUID](self, "networkAgentUUID");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "appendPrettyObject:withName:andIndent:options:", v14, CFSTR("networkAgentUUID"), v5, a4);

  if (-[NEPolicyRouteRule controlUnit](self, "controlUnit"))
    objc_msgSend(v8, "appendPrettyInt:withName:andIndent:options:", -[NEPolicyRouteRule controlUnit](self, "controlUnit"), CFSTR("controlUnit"), v5, a4);
  if (-[NEPolicyRouteRule effectiveType](self, "effectiveType"))
    objc_msgSend(v8, "appendPrettyInt:withName:andIndent:options:", -[NEPolicyRouteRule effectiveType](self, "effectiveType"), CFSTR("effectiveType"), v5, a4);
  return v8;
}

- (id)description
{
  return -[NEPolicyRouteRule descriptionWithIndent:options:](self, "descriptionWithIndent:options:", 0, 0);
}

- (NSUUID)networkAgentUUID
{
  return (NSUUID *)objc_getProperty(self, a2, 16, 1);
}

- (void)setNetworkAgentUUID:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (unsigned)controlUnit
{
  return self->_controlUnit;
}

- (void)setControlUnit:(unsigned int)a3
{
  self->_controlUnit = a3;
}

- (unsigned)effectiveType
{
  return self->_effectiveType;
}

- (void)setEffectiveType:(unsigned int)a3
{
  self->_effectiveType = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_matchNetworkAgent, 0);
  objc_storeStrong((id *)&self->_interfaceName, 0);
  objc_storeStrong((id *)&self->_networkAgentUUID, 0);
}

+ (id)routeRuleWithAction:(int64_t)a3 forInterfaceName:(id)a4
{
  id v5;
  NEPolicyRouteRule *v6;
  _QWORD *v7;
  const char *v8;
  void *v9;
  objc_super v11;

  v5 = a4;
  v6 = [NEPolicyRouteRule alloc];
  if (v6)
  {
    v11.receiver = v6;
    v11.super_class = (Class)NEPolicyRouteRule;
    v7 = objc_msgSendSuper2(&v11, sel_init);
    v9 = v7;
    if (v7)
    {
      v7[3] = a3;
      objc_setProperty_atomic_copy(v7, v8, v5, 32);
    }
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

+ (id)routeRuleWithAction:(int64_t)a3 forType:(int64_t)a4
{
  NEPolicyRouteRule *v6;
  objc_super v8;

  v6 = [NEPolicyRouteRule alloc];
  if (v6)
  {
    v8.receiver = v6;
    v8.super_class = (Class)NEPolicyRouteRule;
    v6 = objc_msgSendSuper2(&v8, sel_init);
    if (v6)
    {
      v6->_action = a3;
      v6->_type = a4;
    }
  }
  return v6;
}

+ (id)routeRuleWithAction:(int64_t)a3 forNetworkAgent:(id)a4
{
  id v5;
  NEPolicyRouteRule *v6;
  _QWORD *v7;
  const char *v8;
  void *v9;
  objc_super v11;

  v5 = a4;
  v6 = [NEPolicyRouteRule alloc];
  if (v6)
  {
    v11.receiver = v6;
    v11.super_class = (Class)NEPolicyRouteRule;
    v7 = objc_msgSendSuper2(&v11, sel_init);
    v9 = v7;
    if (v7)
    {
      v7[3] = a3;
      objc_setProperty_atomic_copy(v7, v8, v5, 40);
    }
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

+ (id)routeRuleWithAction:(int64_t)a3 forNetworkAgent:(id)a4 forInterfaceName:(id)a5
{
  id v7;
  id v8;
  NEPolicyRouteRule *v9;
  _QWORD *v10;
  const char *v11;
  void *v12;
  SEL v13;
  objc_super v15;

  v7 = a4;
  v8 = a5;
  v9 = [NEPolicyRouteRule alloc];
  if (v9)
  {
    v15.receiver = v9;
    v15.super_class = (Class)NEPolicyRouteRule;
    v10 = objc_msgSendSuper2(&v15, sel_init);
    v12 = v10;
    if (v10)
    {
      v10[3] = a3;
      objc_setProperty_atomic_copy(v10, v11, v7, 40);
      objc_setProperty_atomic_copy(v12, v13, v8, 32);
    }
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

@end
