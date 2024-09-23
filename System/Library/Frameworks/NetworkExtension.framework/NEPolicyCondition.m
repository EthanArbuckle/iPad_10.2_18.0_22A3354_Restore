@implementation NEPolicyCondition

- (NEPolicyCondition)init
{
  NSObject *v3;
  uint8_t v5[16];

  ne_log_obj();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v5 = 0;
    _os_log_error_impl(&dword_19BD16000, v3, OS_LOG_TYPE_ERROR, "Calling init on NEPolicyCondition is not valid", v5, 2u);
  }

  return 0;
}

- (id)descriptionWithIndent:(int)a3 options:(unint64_t)a4
{
  uint64_t v5;
  id v7;
  unint64_t v8;
  __CFString *v9;
  __CFString *v10;
  const char *v11;
  const char *v12;
  BOOL v13;
  const char *v14;
  uint64_t domainFilter;
  uint64_t pid;
  uint64_t pid_version;
  uint64_t uid;
  uint64_t interfaceFlags;
  uint64_t interfaceEflags;
  uint64_t interfaceXflags;

  v5 = *(_QWORD *)&a3;
  v7 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  if (self)
  {
    v8 = self->_conditionType - 1;
    if (v8 > 0x2A)
      v9 = CFSTR("unknown");
    else
      v9 = (__CFString *)*((_QWORD *)&off_1E3CC3260 + v8);
    if (self->_negative || self->_exactMatch)
    {
      v10 = (__CFString *)-[__CFString mutableCopy](v9, "mutableCopy");
      v9 = v10;
      v11 = "";
      v12 = "exact";
      if (self->_exactMatch)
      {
        v13 = !self->_negative;
      }
      else
      {
        v12 = "";
        v13 = 1;
      }
      v14 = ", ";
      if (v13)
        v14 = "";
      if (self->_negative)
        v11 = "not";
      -[__CFString appendFormat:](v10, "appendFormat:", CFSTR(" (%s%s%s)"), v11, v14, v12);
    }
  }
  else
  {
    v9 = 0;
  }
  objc_msgSend(v7, "appendPrettyObject:withName:andIndent:options:", v9, CFSTR("condition-type"), v5, a4);

  objc_msgSend(v7, "appendPrettyObject:withName:andIndent:options:", self->_applicationUUID, CFSTR("application-uuid"), v5, a4);
  objc_msgSend(v7, "appendPrettyObject:withName:andIndent:options:", self->_startAddress, CFSTR("address"), v5, a4 | 1);
  objc_msgSend(v7, "appendPrettyObject:withName:andIndent:options:", self->_endAddress, CFSTR("end-address"), v5, a4 | 1);
  objc_msgSend(v7, "appendPrettyObject:withName:andIndent:options:", self->_domain, CFSTR("domain"), v5, a4 | 1);
  domainFilter = (int)self->_domainFilter;
  if ((_DWORD)domainFilter)
    objc_msgSend(v7, "appendPrettyInt:withName:andIndent:options:", domainFilter, CFSTR("domain-filter"), v5, a4);
  objc_msgSend(v7, "appendPrettyObject:withName:andIndent:options:", self->_accountIdentifier, CFSTR("account-identifier"), v5, a4);
  objc_msgSend(v7, "appendPrettyObject:withName:andIndent:options:", self->_interfaceName, CFSTR("interface-name"), v5, a4);
  objc_msgSend(v7, "appendPrettyObject:withName:andIndent:options:", self->_customEntitlement, CFSTR("custom-entitlement"), v5, a4);
  objc_msgSend(v7, "appendPrettyObject:withName:andIndent:options:", self->_agentDomain, CFSTR("agent-domain"), v5, a4);
  objc_msgSend(v7, "appendPrettyObject:withName:andIndent:options:", self->_agentType, CFSTR("agent-type"), v5, a4);
  objc_msgSend(v7, "appendPrettyObject:withName:andIndent:options:", self->_signingIdentifier, CFSTR("signing-identifier"), v5, a4);
  if (self->_trafficClassStart || self->_trafficClassEnd)
  {
    objc_msgSend(v7, "appendPrettyInt:withName:andIndent:options:");
    objc_msgSend(v7, "appendPrettyInt:withName:andIndent:options:", (int)self->_trafficClassEnd, CFSTR("traffic-class-end"), v5, a4);
  }
  pid = self->_pid;
  if ((_DWORD)pid)
    objc_msgSend(v7, "appendPrettyInt:withName:andIndent:options:", pid, CFSTR("pid"), v5, a4);
  pid_version = self->_pid_version;
  if ((_DWORD)pid_version)
    objc_msgSend(v7, "appendPrettyInt:withName:andIndent:options:", pid_version, CFSTR("version"), v5, a4);
  uid = (int)self->_uid;
  if ((_DWORD)uid)
    objc_msgSend(v7, "appendPrettyInt:withName:andIndent:options:", uid, CFSTR("uid"), v5, a4);
  if (self->_ipProtocol)
    objc_msgSend(v7, "appendPrettyInt:withName:andIndent:options:");
  if (self->_prefix)
    objc_msgSend(v7, "appendPrettyInt:withName:andIndent:options:");
  interfaceFlags = (int)self->_interfaceFlags;
  if ((_DWORD)interfaceFlags)
    objc_msgSend(v7, "appendPrettyHex:withName:andIndent:options:", interfaceFlags, CFSTR("flags"), v5, a4);
  interfaceEflags = (int)self->_interfaceEflags;
  if ((_DWORD)interfaceEflags)
    objc_msgSend(v7, "appendPrettyHex:withName:andIndent:options:", interfaceEflags, CFSTR("eflags"), v5, a4);
  interfaceXflags = (int)self->_interfaceXflags;
  if ((_DWORD)interfaceXflags)
    objc_msgSend(v7, "appendPrettyHex:withName:andIndent:options:", interfaceXflags, CFSTR("flags"), v5, a4);
  return v7;
}

- (id)description
{
  return -[NEPolicyCondition descriptionWithIndent:options:](self, "descriptionWithIndent:options:", 0, 0);
}

- (int64_t)conditionType
{
  return self->_conditionType;
}

- (void)setConditionType:(int64_t)a3
{
  self->_conditionType = a3;
}

- (BOOL)isNegative
{
  return self->_negative;
}

- (void)setNegative:(BOOL)a3
{
  self->_negative = a3;
}

- (BOOL)exactMatch
{
  return self->_exactMatch;
}

- (void)setExactMatch:(BOOL)a3
{
  self->_exactMatch = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_signingIdentifier, 0);
  objc_storeStrong((id *)&self->_agentType, 0);
  objc_storeStrong((id *)&self->_agentDomain, 0);
  objc_storeStrong((id *)&self->_customEntitlement, 0);
  objc_storeStrong((id *)&self->_endAddress, 0);
  objc_storeStrong((id *)&self->_startAddress, 0);
  objc_storeStrong((id *)&self->_interfaceName, 0);
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong((id *)&self->_domain, 0);
  objc_storeStrong((id *)&self->_accountIdentifier, 0);
  objc_storeStrong((id *)&self->_applicationUUID, 0);
}

+ (id)effectiveApplication:(id)a3
{
  id v3;
  NEPolicyCondition *v4;
  id v5;
  const char *v6;
  objc_super v8;

  v3 = a3;
  v4 = [NEPolicyCondition alloc];
  if (v4)
  {
    v8.receiver = v4;
    v8.super_class = (Class)NEPolicyCondition;
    v5 = objc_msgSendSuper2(&v8, sel_init);
    objc_msgSend(v5, "setConditionType:", 1);
    if (v5)
      objc_setProperty_atomic_copy(v5, v6, v3, 80);
  }
  else
  {
    objc_msgSend(0, "setConditionType:", 1);
    v5 = 0;
  }

  return v5;
}

+ (id)realApplication:(id)a3
{
  id v3;
  NEPolicyCondition *v4;
  id v5;
  const char *v6;
  objc_super v8;

  v3 = a3;
  v4 = [NEPolicyCondition alloc];
  if (v4)
  {
    v8.receiver = v4;
    v8.super_class = (Class)NEPolicyCondition;
    v5 = objc_msgSendSuper2(&v8, sel_init);
    objc_msgSend(v5, "setConditionType:", 2);
    if (v5)
      objc_setProperty_atomic_copy(v5, v6, v3, 80);
  }
  else
  {
    objc_msgSend(0, "setConditionType:", 2);
    v5 = 0;
  }

  return v5;
}

+ (id)effectivePID:(int)a3
{
  NEPolicyCondition *v4;
  _DWORD *v5;
  objc_super v7;

  v4 = [NEPolicyCondition alloc];
  if (v4)
  {
    v7.receiver = v4;
    v7.super_class = (Class)NEPolicyCondition;
    v5 = objc_msgSendSuper2(&v7, sel_init);
    objc_msgSend(v5, "setConditionType:", 3);
    if (v5)
    {
      v5[5] = a3;
      v5[6] = 0;
    }
    return v5;
  }
  else
  {
    objc_msgSend(0, "setConditionType:", 3);
    return 0;
  }
}

+ (id)effectivePID:(int)a3 version:(int)a4
{
  NEPolicyCondition *v6;
  _DWORD *v7;
  objc_super v9;

  v6 = [NEPolicyCondition alloc];
  if (v6)
  {
    v9.receiver = v6;
    v9.super_class = (Class)NEPolicyCondition;
    v7 = objc_msgSendSuper2(&v9, sel_init);
    objc_msgSend(v7, "setConditionType:", 3);
    if (v7)
    {
      v7[5] = a3;
      v7[6] = a4;
    }
    return v7;
  }
  else
  {
    objc_msgSend(0, "setConditionType:", 3);
    return 0;
  }
}

+ (id)uid:(unsigned int)a3
{
  NEPolicyCondition *v4;
  _DWORD *v5;
  objc_super v7;

  v4 = [NEPolicyCondition alloc];
  if (v4)
  {
    v7.receiver = v4;
    v7.super_class = (Class)NEPolicyCondition;
    v5 = objc_msgSendSuper2(&v7, sel_init);
    objc_msgSend(v5, "setConditionType:", 4);
    if (v5)
      v5[7] = a3;
    return v5;
  }
  else
  {
    objc_msgSend(0, "setConditionType:", 4);
    return 0;
  }
}

+ (id)realUID:(unsigned int)a3
{
  NEPolicyCondition *v4;
  _DWORD *v5;
  objc_super v7;

  v4 = [NEPolicyCondition alloc];
  if (v4)
  {
    v7.receiver = v4;
    v7.super_class = (Class)NEPolicyCondition;
    v5 = objc_msgSendSuper2(&v7, sel_init);
    objc_msgSend(v5, "setConditionType:", 40);
    if (v5)
      v5[7] = a3;
    return v5;
  }
  else
  {
    objc_msgSend(0, "setConditionType:", 40);
    return 0;
  }
}

+ (id)accountIdentifier:(id)a3
{
  id v3;
  NEPolicyCondition *v4;
  id v5;
  const char *v6;
  objc_super v8;

  v3 = a3;
  v4 = [NEPolicyCondition alloc];
  if (v4)
  {
    v8.receiver = v4;
    v8.super_class = (Class)NEPolicyCondition;
    v5 = objc_msgSendSuper2(&v8, sel_init);
    objc_msgSend(v5, "setConditionType:", 5);
    if (v5)
      objc_setProperty_atomic_copy(v5, v6, v3, 88);
  }
  else
  {
    objc_msgSend(0, "setConditionType:", 5);
    v5 = 0;
  }

  return v5;
}

+ (id)domain:(id)a3
{
  id v3;
  NEPolicyCondition *v4;
  id v5;
  const char *v6;
  objc_super v8;

  v3 = a3;
  v4 = [NEPolicyCondition alloc];
  if (v4)
  {
    v8.receiver = v4;
    v8.super_class = (Class)NEPolicyCondition;
    v5 = objc_msgSendSuper2(&v8, sel_init);
    objc_msgSend(v5, "setConditionType:", 6);
    if (v5)
      objc_setProperty_atomic_copy(v5, v6, v3, 96);
  }
  else
  {
    objc_msgSend(0, "setConditionType:", 6);
    v5 = 0;
  }

  return v5;
}

+ (id)domainFilter:(unint64_t)a3
{
  int v3;
  NEPolicyCondition *v4;
  _DWORD *v5;
  objc_super v7;

  v3 = a3;
  v4 = [NEPolicyCondition alloc];
  if (v4)
  {
    v7.receiver = v4;
    v7.super_class = (Class)NEPolicyCondition;
    v5 = objc_msgSendSuper2(&v7, sel_init);
    objc_msgSend(v5, "setConditionType:", 38);
    if (v5)
      v5[8] = v3;
    return v5;
  }
  else
  {
    objc_msgSend(0, "setConditionType:", 38);
    return 0;
  }
}

+ (id)url:(id)a3
{
  id v3;
  NEPolicyCondition *v4;
  id v5;
  const char *v6;
  objc_super v8;

  v3 = a3;
  v4 = [NEPolicyCondition alloc];
  if (v4)
  {
    v8.receiver = v4;
    v8.super_class = (Class)NEPolicyCondition;
    v5 = objc_msgSendSuper2(&v8, sel_init);
    objc_msgSend(v5, "setConditionType:", 42);
    if (v5)
      objc_setProperty_atomic_copy(v5, v6, v3, 104);
  }
  else
  {
    objc_msgSend(0, "setConditionType:", 42);
    v5 = 0;
  }

  return v5;
}

+ (id)allInterfaces
{
  NEPolicyCondition *v2;
  id v3;
  objc_super v5;

  v2 = [NEPolicyCondition alloc];
  if (v2)
  {
    v5.receiver = v2;
    v5.super_class = (Class)NEPolicyCondition;
    v3 = objc_msgSendSuper2(&v5, sel_init);
  }
  else
  {
    v3 = 0;
  }
  objc_msgSend(v3, "setConditionType:", 7);
  return v3;
}

+ (id)scopedInterface:(id)a3
{
  id v3;
  NEPolicyCondition *v4;
  id v5;
  const char *v6;
  objc_super v8;

  v3 = a3;
  v4 = [NEPolicyCondition alloc];
  if (v4)
  {
    v8.receiver = v4;
    v8.super_class = (Class)NEPolicyCondition;
    v5 = objc_msgSendSuper2(&v8, sel_init);
    objc_msgSend(v5, "setConditionType:", 8);
    if (v5)
      objc_setProperty_atomic_copy(v5, v6, v3, 112);
  }
  else
  {
    objc_msgSend(0, "setConditionType:", 8);
    v5 = 0;
  }

  return v5;
}

+ (id)scopedInterfaceFlags:(unsigned int)a3 eflags:(unsigned int)a4 xflags:(unsigned int)a5
{
  NEPolicyCondition *v8;
  _DWORD *v9;
  objc_super v11;

  v8 = [NEPolicyCondition alloc];
  if (v8)
  {
    v11.receiver = v8;
    v11.super_class = (Class)NEPolicyCondition;
    v9 = objc_msgSendSuper2(&v11, sel_init);
    objc_msgSend(v9, "setConditionType:", 43);
    if (v9)
    {
      v9[9] = a3;
      v9[10] = a4;
      v9[11] = a5;
    }
    return v9;
  }
  else
  {
    objc_msgSend(0, "setConditionType:", 43);
    return 0;
  }
}

+ (id)trafficClassStart:(unsigned int)a3 end:(unsigned int)a4
{
  NEPolicyCondition *v6;
  _DWORD *v7;
  objc_super v9;

  v6 = [NEPolicyCondition alloc];
  if (v6)
  {
    v9.receiver = v6;
    v9.super_class = (Class)NEPolicyCondition;
    v7 = objc_msgSendSuper2(&v9, sel_init);
    objc_msgSend(v7, "setConditionType:", 9);
    if (v7)
    {
      v7[12] = a3;
      v7[13] = a4;
    }
    return v7;
  }
  else
  {
    objc_msgSend(0, "setConditionType:", 9);
    return 0;
  }
}

+ (id)ipProtocol:(unsigned __int16)a3
{
  NEPolicyCondition *v4;
  _WORD *v5;
  objc_super v7;

  v4 = [NEPolicyCondition alloc];
  if (v4)
  {
    v7.receiver = v4;
    v7.super_class = (Class)NEPolicyCondition;
    v5 = objc_msgSendSuper2(&v7, sel_init);
    objc_msgSend(v5, "setConditionType:", 10);
    if (v5)
      v5[6] = a3;
    return v5;
  }
  else
  {
    objc_msgSend(0, "setConditionType:", 10);
    return 0;
  }
}

+ (id)flowIPProtocol:(unsigned __int16)a3
{
  NEPolicyCondition *v4;
  _WORD *v5;
  objc_super v7;

  v4 = [NEPolicyCondition alloc];
  if (v4)
  {
    v7.receiver = v4;
    v7.super_class = (Class)NEPolicyCondition;
    v5 = objc_msgSendSuper2(&v7, sel_init);
    objc_msgSend(v5, "setConditionType:", 19);
    if (v5)
      v5[6] = a3;
    return v5;
  }
  else
  {
    objc_msgSend(0, "setConditionType:", 19);
    return 0;
  }
}

+ (id)localAddress:(id)a3 prefix:(unsigned __int8)a4
{
  id v5;
  NEPolicyCondition *v6;
  _BYTE *v7;
  const char *v8;
  objc_super v10;

  v5 = a3;
  v6 = [NEPolicyCondition alloc];
  if (v6)
  {
    v10.receiver = v6;
    v10.super_class = (Class)NEPolicyCondition;
    v7 = objc_msgSendSuper2(&v10, sel_init);
    objc_msgSend(v7, "setConditionType:", 11);
    if (v7)
    {
      objc_setProperty_atomic_copy(v7, v8, v5, 120);
      v7[10] = a4;
    }
  }
  else
  {
    objc_msgSend(0, "setConditionType:", 11);
    v7 = 0;
  }

  return v7;
}

+ (id)flowLocalAddress:(id)a3 prefix:(unsigned __int8)a4
{
  id v5;
  NEPolicyCondition *v6;
  _BYTE *v7;
  const char *v8;
  objc_super v10;

  v5 = a3;
  v6 = [NEPolicyCondition alloc];
  if (v6)
  {
    v10.receiver = v6;
    v10.super_class = (Class)NEPolicyCondition;
    v7 = objc_msgSendSuper2(&v10, sel_init);
    objc_msgSend(v7, "setConditionType:", 20);
    if (v7)
    {
      objc_setProperty_atomic_copy(v7, v8, v5, 120);
      v7[10] = a4;
    }
  }
  else
  {
    objc_msgSend(0, "setConditionType:", 20);
    v7 = 0;
  }

  return v7;
}

+ (id)remoteAddress:(id)a3 prefix:(unsigned __int8)a4
{
  id v5;
  NEPolicyCondition *v6;
  _BYTE *v7;
  const char *v8;
  objc_super v10;

  v5 = a3;
  v6 = [NEPolicyCondition alloc];
  if (v6)
  {
    v10.receiver = v6;
    v10.super_class = (Class)NEPolicyCondition;
    v7 = objc_msgSendSuper2(&v10, sel_init);
    objc_msgSend(v7, "setConditionType:", 13);
    if (v7)
    {
      objc_setProperty_atomic_copy(v7, v8, v5, 120);
      v7[10] = a4;
    }
  }
  else
  {
    objc_msgSend(0, "setConditionType:", 13);
    v7 = 0;
  }

  return v7;
}

+ (id)flowRemoteAddress:(id)a3 prefix:(unsigned __int8)a4
{
  id v5;
  NEPolicyCondition *v6;
  _BYTE *v7;
  const char *v8;
  objc_super v10;

  v5 = a3;
  v6 = [NEPolicyCondition alloc];
  if (v6)
  {
    v10.receiver = v6;
    v10.super_class = (Class)NEPolicyCondition;
    v7 = objc_msgSendSuper2(&v10, sel_init);
    objc_msgSend(v7, "setConditionType:", 22);
    if (v7)
    {
      objc_setProperty_atomic_copy(v7, v8, v5, 120);
      v7[10] = a4;
    }
  }
  else
  {
    objc_msgSend(0, "setConditionType:", 22);
    v7 = 0;
  }

  return v7;
}

+ (id)localAddressStart:(id)a3 end:(id)a4
{
  id v5;
  id v6;
  NEPolicyCondition *v7;
  id v8;
  const char *v9;
  SEL v10;
  objc_super v12;

  v5 = a3;
  v6 = a4;
  v7 = [NEPolicyCondition alloc];
  if (v7)
  {
    v12.receiver = v7;
    v12.super_class = (Class)NEPolicyCondition;
    v8 = objc_msgSendSuper2(&v12, sel_init);
    objc_msgSend(v8, "setConditionType:", 12);
    if (v8)
    {
      objc_setProperty_atomic_copy(v8, v9, v5, 120);
      objc_setProperty_atomic_copy(v8, v10, v6, 128);
    }
  }
  else
  {
    objc_msgSend(0, "setConditionType:", 12);
    v8 = 0;
  }

  return v8;
}

+ (id)flowLocalAddressStart:(id)a3 end:(id)a4
{
  id v5;
  id v6;
  NEPolicyCondition *v7;
  id v8;
  const char *v9;
  SEL v10;
  objc_super v12;

  v5 = a3;
  v6 = a4;
  v7 = [NEPolicyCondition alloc];
  if (v7)
  {
    v12.receiver = v7;
    v12.super_class = (Class)NEPolicyCondition;
    v8 = objc_msgSendSuper2(&v12, sel_init);
    objc_msgSend(v8, "setConditionType:", 21);
    if (v8)
    {
      objc_setProperty_atomic_copy(v8, v9, v5, 120);
      objc_setProperty_atomic_copy(v8, v10, v6, 128);
    }
  }
  else
  {
    objc_msgSend(0, "setConditionType:", 21);
    v8 = 0;
  }

  return v8;
}

+ (id)remoteAddressStart:(id)a3 end:(id)a4
{
  id v5;
  id v6;
  NEPolicyCondition *v7;
  id v8;
  const char *v9;
  SEL v10;
  objc_super v12;

  v5 = a3;
  v6 = a4;
  v7 = [NEPolicyCondition alloc];
  if (v7)
  {
    v12.receiver = v7;
    v12.super_class = (Class)NEPolicyCondition;
    v8 = objc_msgSendSuper2(&v12, sel_init);
    objc_msgSend(v8, "setConditionType:", 14);
    if (v8)
    {
      objc_setProperty_atomic_copy(v8, v9, v5, 120);
      objc_setProperty_atomic_copy(v8, v10, v6, 128);
    }
  }
  else
  {
    objc_msgSend(0, "setConditionType:", 14);
    v8 = 0;
  }

  return v8;
}

+ (id)localNetworks
{
  NEPolicyCondition *v2;
  id v3;
  objc_super v5;

  v2 = [NEPolicyCondition alloc];
  if (v2)
  {
    v5.receiver = v2;
    v5.super_class = (Class)NEPolicyCondition;
    v3 = objc_msgSendSuper2(&v5, sel_init);
  }
  else
  {
    v3 = 0;
  }
  objc_msgSend(v3, "setConditionType:", 18);
  return v3;
}

+ (id)localNetworksWithFlags:(unsigned __int8)a3
{
  NEPolicyCondition *v4;
  _BYTE *v5;
  objc_super v7;

  v4 = [NEPolicyCondition alloc];
  if (v4)
  {
    v7.receiver = v4;
    v7.super_class = (Class)NEPolicyCondition;
    v5 = objc_msgSendSuper2(&v7, sel_init);
    objc_msgSend(v5, "setConditionType:", 18);
    if (v5)
      v5[11] = a3;
    return v5;
  }
  else
  {
    objc_msgSend(0, "setConditionType:", 18);
    return 0;
  }
}

+ (id)flowRemoteAddressStart:(id)a3 end:(id)a4
{
  id v5;
  id v6;
  NEPolicyCondition *v7;
  id v8;
  const char *v9;
  SEL v10;
  objc_super v12;

  v5 = a3;
  v6 = a4;
  v7 = [NEPolicyCondition alloc];
  if (v7)
  {
    v12.receiver = v7;
    v12.super_class = (Class)NEPolicyCondition;
    v8 = objc_msgSendSuper2(&v12, sel_init);
    objc_msgSend(v8, "setConditionType:", 23);
    if (v8)
    {
      objc_setProperty_atomic_copy(v8, v9, v5, 120);
      objc_setProperty_atomic_copy(v8, v10, v6, 128);
    }
  }
  else
  {
    objc_msgSend(0, "setConditionType:", 23);
    v8 = 0;
  }

  return v8;
}

+ (id)schemeUsingPort:(unsigned __int16)a3
{
  unsigned int v3;
  NEPolicyCondition *v4;
  _WORD *v5;
  objc_super v7;

  v3 = a3;
  v4 = [NEPolicyCondition alloc];
  if (v4)
  {
    v7.receiver = v4;
    v7.super_class = (Class)NEPolicyCondition;
    v5 = objc_msgSendSuper2(&v7, sel_init);
    objc_msgSend(v5, "setConditionType:", 37);
    if (v5)
      v5[8] = __rev16(v3);
    return v5;
  }
  else
  {
    objc_msgSend(0, "setConditionType:", 37);
    return 0;
  }
}

+ (id)entitlement
{
  NEPolicyCondition *v2;
  id v3;
  objc_super v5;

  v2 = [NEPolicyCondition alloc];
  if (v2)
  {
    v5.receiver = v2;
    v5.super_class = (Class)NEPolicyCondition;
    v3 = objc_msgSendSuper2(&v5, sel_init);
  }
  else
  {
    v3 = 0;
  }
  objc_msgSend(v3, "setConditionType:", 15);
  return v3;
}

+ (id)customEntitlement:(id)a3
{
  id v3;
  NEPolicyCondition *v4;
  id v5;
  const char *v6;
  objc_super v8;

  v3 = a3;
  v4 = [NEPolicyCondition alloc];
  if (v4)
  {
    v8.receiver = v4;
    v8.super_class = (Class)NEPolicyCondition;
    v5 = objc_msgSendSuper2(&v8, sel_init);
    objc_msgSend(v5, "setConditionType:", 15);
    if (v5)
      objc_setProperty_atomic_copy(v5, v6, v3, 136);
  }
  else
  {
    objc_msgSend(0, "setConditionType:", 15);
    v5 = 0;
  }

  return v5;
}

+ (id)platformBinary
{
  NEPolicyCondition *v2;
  id v3;
  objc_super v5;

  v2 = [NEPolicyCondition alloc];
  if (v2)
  {
    v5.receiver = v2;
    v5.super_class = (Class)NEPolicyCondition;
    v3 = objc_msgSendSuper2(&v5, sel_init);
  }
  else
  {
    v3 = 0;
  }
  objc_msgSend(v3, "setConditionType:", 27);
  return v3;
}

+ (id)sdkVersion:(unsigned int)a3 minSDKVersion:(unsigned int)a4 platform:(unsigned int)a5
{
  NEPolicyCondition *v8;
  _DWORD *v9;
  objc_super v11;

  v8 = [NEPolicyCondition alloc];
  if (v8)
  {
    v11.receiver = v8;
    v11.super_class = (Class)NEPolicyCondition;
    v9 = objc_msgSendSuper2(&v11, sel_init);
    objc_msgSend(v9, "setConditionType:", 28);
    if (v9)
    {
      v9[16] = a3;
      v9[17] = a4;
      v9[15] = a5;
    }
    return v9;
  }
  else
  {
    objc_msgSend(0, "setConditionType:", 28);
    return 0;
  }
}

+ (id)requiredAgentDomain:(id)a3 agentType:(id)a4
{
  id v5;
  id v6;
  NEPolicyCondition *v7;
  id v8;
  const char *v9;
  SEL v10;
  objc_super v12;

  v5 = a3;
  v6 = a4;
  v7 = [NEPolicyCondition alloc];
  if (v7)
  {
    v12.receiver = v7;
    v12.super_class = (Class)NEPolicyCondition;
    v8 = objc_msgSendSuper2(&v12, sel_init);
    objc_msgSend(v8, "setConditionType:", 16);
    if (v8)
    {
      objc_setProperty_atomic_copy(v8, v9, v5, 144);
      objc_setProperty_atomic_copy(v8, v10, v6, 152);
    }
  }
  else
  {
    objc_msgSend(0, "setConditionType:", 16);
    v8 = 0;
  }

  return v8;
}

+ (id)packetFilterTags:(unsigned __int16)a3
{
  NEPolicyCondition *v4;
  _WORD *v5;
  objc_super v7;

  v4 = [NEPolicyCondition alloc];
  if (v4)
  {
    v7.receiver = v4;
    v7.super_class = (Class)NEPolicyCondition;
    v5 = objc_msgSendSuper2(&v7, sel_init);
    objc_msgSend(v5, "setConditionType:", 30);
    if (v5)
      v5[7] = a3;
    return v5;
  }
  else
  {
    objc_msgSend(0, "setConditionType:", 30);
    return 0;
  }
}

+ (id)clientFlags:(unsigned int)a3
{
  NEPolicyCondition *v4;
  _DWORD *v5;
  objc_super v7;

  v4 = [NEPolicyCondition alloc];
  if (v4)
  {
    v7.receiver = v4;
    v7.super_class = (Class)NEPolicyCondition;
    v5 = objc_msgSendSuper2(&v7, sel_init);
    objc_msgSend(v5, "setConditionType:", 24);
    if (v5)
      v5[14] = a3;
    return v5;
  }
  else
  {
    objc_msgSend(0, "setConditionType:", 24);
    return 0;
  }
}

+ (id)signingIdentifier:(id)a3
{
  id v3;
  NEPolicyCondition *v4;
  id v5;
  const char *v6;
  objc_super v8;

  v3 = a3;
  v4 = [NEPolicyCondition alloc];
  if (v4)
  {
    v8.receiver = v4;
    v8.super_class = (Class)NEPolicyCondition;
    v5 = objc_msgSendSuper2(&v8, sel_init);
    objc_msgSend(v5, "setConditionType:", 29);
    if (v5)
      objc_setProperty_atomic_copy(v5, v6, v3, 160);
  }
  else
  {
    objc_msgSend(0, "setConditionType:", 29);
    v5 = 0;
  }

  return v5;
}

+ (id)fallbackTraffic
{
  return +[NEPolicyCondition clientFlags:](NEPolicyCondition, "clientFlags:", 0x2000);
}

+ (id)clientProhibitsContrained
{
  return +[NEPolicyCondition clientFlags:](NEPolicyCondition, "clientFlags:", 4096);
}

+ (id)clientProhibitsExpensive
{
  return +[NEPolicyCondition clientFlags:](NEPolicyCondition, "clientFlags:", 4);
}

+ (id)isInbound
{
  return +[NEPolicyCondition clientFlags:](NEPolicyCondition, "clientFlags:", 0x4000);
}

+ (id)isListener
{
  return +[NEPolicyCondition clientFlags:](NEPolicyCondition, "clientFlags:", 8);
}

+ (id)isSystemProxyConnection
{
  return +[NEPolicyCondition clientFlags:](NEPolicyCondition, "clientFlags:", 0x8000);
}

+ (id)allowsUnsafeSocketAccess
{
  return +[NEPolicyCondition clientFlags:](NEPolicyCondition, "clientFlags:", 0x20000);
}

+ (id)usesModernNetworkAPI
{
  NEPolicyCondition *v2;
  id v3;
  objc_super v5;

  v2 = [NEPolicyCondition alloc];
  if (v2)
  {
    v5.receiver = v2;
    v5.super_class = (Class)NEPolicyCondition;
    v3 = objc_msgSendSuper2(&v5, sel_init);
  }
  else
  {
    v3 = 0;
  }
  objc_msgSend(v3, "setConditionType:", 17);
  return v3;
}

+ (id)flowLocalAddressEmpty
{
  NEPolicyCondition *v2;
  id v3;
  objc_super v5;

  v2 = [NEPolicyCondition alloc];
  if (v2)
  {
    v5.receiver = v2;
    v5.super_class = (Class)NEPolicyCondition;
    v3 = objc_msgSendSuper2(&v5, sel_init);
  }
  else
  {
    v3 = 0;
  }
  objc_msgSend(v3, "setConditionType:", 25);
  return v3;
}

+ (id)flowRemoteAddressEmpty
{
  NEPolicyCondition *v2;
  id v3;
  objc_super v5;

  v2 = [NEPolicyCondition alloc];
  if (v2)
  {
    v5.receiver = v2;
    v5.super_class = (Class)NEPolicyCondition;
    v3 = objc_msgSendSuper2(&v5, sel_init);
  }
  else
  {
    v3 = 0;
  }
  objc_msgSend(v3, "setConditionType:", 26);
  return v3;
}

+ (id)isLoopback
{
  NEPolicyCondition *v2;
  id v3;
  objc_super v5;

  v2 = [NEPolicyCondition alloc];
  if (v2)
  {
    v5.receiver = v2;
    v5.super_class = (Class)NEPolicyCondition;
    v3 = objc_msgSendSuper2(&v5, sel_init);
  }
  else
  {
    v3 = 0;
  }
  objc_msgSend(v3, "setConditionType:", 31);
  return v3;
}

+ (id)delegateIsPlatformBinary
{
  NEPolicyCondition *v2;
  id v3;
  objc_super v5;

  v2 = [NEPolicyCondition alloc];
  if (v2)
  {
    v5.receiver = v2;
    v5.super_class = (Class)NEPolicyCondition;
    v3 = objc_msgSendSuper2(&v5, sel_init);
  }
  else
  {
    v3 = 0;
  }
  objc_msgSend(v3, "setConditionType:", 32);
  return v3;
}

+ (id)hasSignedResult
{
  NEPolicyCondition *v2;
  id v3;
  objc_super v5;

  v2 = [NEPolicyCondition alloc];
  if (v2)
  {
    v5.receiver = v2;
    v5.super_class = (Class)NEPolicyCondition;
    v3 = objc_msgSendSuper2(&v5, sel_init);
  }
  else
  {
    v3 = 0;
  }
  objc_msgSend(v3, "setConditionType:", 39);
  return v3;
}

@end
