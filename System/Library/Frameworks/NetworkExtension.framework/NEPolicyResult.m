@implementation NEPolicyResult

- (NEPolicyResult)init
{
  NSObject *v3;
  uint8_t v5[16];

  ne_log_obj();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v5 = 0;
    _os_log_error_impl(&dword_19BD16000, v3, OS_LOG_TYPE_ERROR, "Calling init on NEPolicyResult is not valid", v5, 2u);
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
  unint64_t secondaryResultType;
  __CFString *v12;
  __CFString *v13;
  uint64_t controlUnit;
  uint64_t effectiveType;

  v5 = *(_QWORD *)&a3;
  v7 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  if (self)
  {
    v8 = self->_resultType - 1;
    if (v8 > 0xE)
      v9 = CFSTR("unknown");
    else
      v9 = (__CFString *)*((_QWORD *)&off_1E3CC3428 + v8);
  }
  else
  {
    v9 = 0;
  }
  v10 = v9;
  objc_msgSend(v7, "appendPrettyObject:withName:andIndent:options:", v10, CFSTR("result-type"), v5, a4);

  secondaryResultType = self->_secondaryResultType;
  if (secondaryResultType)
  {
    if (secondaryResultType > 0xF)
      v12 = CFSTR("unknown");
    else
      v12 = (__CFString *)*((_QWORD *)&off_1E3CC3428 + secondaryResultType - 1);
    v13 = v12;
    objc_msgSend(v7, "appendPrettyObject:withName:andIndent:options:", v13, CFSTR("secondary-result"), v5, a4);

  }
  controlUnit = (int)self->_controlUnit;
  if ((_DWORD)controlUnit)
    objc_msgSend(v7, "appendPrettyInt:withName:andIndent:options:", controlUnit, CFSTR("control-unit"), v5, a4);
  effectiveType = (int)self->_effectiveType;
  if ((_DWORD)effectiveType)
    objc_msgSend(v7, "appendPrettyInt:withName:andIndent:options:", effectiveType, CFSTR("effective-type"), v5, a4);
  objc_msgSend(v7, "appendPrettyObject:withName:andIndent:options:", self->_agentUUID, CFSTR("agent-uuid"), v5, a4);
  objc_msgSend(v7, "appendPrettyObject:withName:andIndent:options:", self->_interfaceName, CFSTR("interface"), v5, a4);
  objc_msgSend(v7, "appendPrettyObject:withName:andIndent:options:", self->_routeRules, CFSTR("route-rules"), v5, a4);
  return v7;
}

- (id)description
{
  return -[NEPolicyResult descriptionWithIndent:options:](self, "descriptionWithIndent:options:", 0, 0);
}

- (int64_t)resultType
{
  return self->_resultType;
}

- (void)setResultType:(int64_t)a3
{
  self->_resultType = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_routeRules, 0);
  objc_storeStrong((id *)&self->_agentUUID, 0);
  objc_storeStrong((id *)&self->_interfaceName, 0);
}

+ (id)pass
{
  NEPolicyResult *v2;
  id v3;
  objc_super v5;

  v2 = [NEPolicyResult alloc];
  if (v2)
  {
    v5.receiver = v2;
    v5.super_class = (Class)NEPolicyResult;
    v3 = objc_msgSendSuper2(&v5, sel_init);
  }
  else
  {
    v3 = 0;
  }
  objc_msgSend(v3, "setResultType:", 1);
  return v3;
}

+ (id)passWithFlags:(unsigned int)a3
{
  NEPolicyResult *v4;
  _DWORD *v5;
  objc_super v7;

  v4 = [NEPolicyResult alloc];
  if (v4)
  {
    v7.receiver = v4;
    v7.super_class = (Class)NEPolicyResult;
    v5 = objc_msgSendSuper2(&v7, sel_init);
    objc_msgSend(v5, "setResultType:", 1);
    if (v5)
      v5[3] = a3;
    return v5;
  }
  else
  {
    objc_msgSend(0, "setResultType:", 1);
    return 0;
  }
}

+ (id)skipWithOrder:(unsigned int)a3
{
  NEPolicyResult *v4;
  _DWORD *v5;
  objc_super v7;

  v4 = [NEPolicyResult alloc];
  if (v4)
  {
    v7.receiver = v4;
    v7.super_class = (Class)NEPolicyResult;
    v5 = objc_msgSendSuper2(&v7, sel_init);
    objc_msgSend(v5, "setResultType:", 2);
    if (v5)
      v5[2] = a3;
    return v5;
  }
  else
  {
    objc_msgSend(0, "setResultType:", 2);
    return 0;
  }
}

+ (id)drop
{
  NEPolicyResult *v2;
  id v3;
  objc_super v5;

  v2 = [NEPolicyResult alloc];
  if (v2)
  {
    v5.receiver = v2;
    v5.super_class = (Class)NEPolicyResult;
    v3 = objc_msgSendSuper2(&v5, sel_init);
  }
  else
  {
    v3 = 0;
  }
  objc_msgSend(v3, "setResultType:", 3);
  return v3;
}

+ (id)dropWithFlags:(unsigned int)a3
{
  NEPolicyResult *v4;
  _DWORD *v5;
  objc_super v7;

  v4 = [NEPolicyResult alloc];
  if (v4)
  {
    v7.receiver = v4;
    v7.super_class = (Class)NEPolicyResult;
    v5 = objc_msgSendSuper2(&v7, sel_init);
    objc_msgSend(v5, "setResultType:", 3);
    if (v5)
      v5[4] = a3;
    return v5;
  }
  else
  {
    objc_msgSend(0, "setResultType:", 3);
    return 0;
  }
}

+ (id)divertSocketToControlUnit:(unsigned int)a3
{
  NEPolicyResult *v4;
  _DWORD *v5;
  objc_super v7;

  v4 = [NEPolicyResult alloc];
  if (v4)
  {
    v7.receiver = v4;
    v7.super_class = (Class)NEPolicyResult;
    v5 = objc_msgSendSuper2(&v7, sel_init);
    objc_msgSend(v5, "setResultType:", 4);
    if (v5)
      v5[5] = a3;
    return v5;
  }
  else
  {
    objc_msgSend(0, "setResultType:", 4);
    return 0;
  }
}

+ (id)scopeSocketToInterfaceName:(id)a3
{
  id v3;
  NEPolicyResult *v4;
  id v5;
  const char *v6;
  objc_super v8;

  v3 = a3;
  v4 = [NEPolicyResult alloc];
  if (v4)
  {
    v8.receiver = v4;
    v8.super_class = (Class)NEPolicyResult;
    v5 = objc_msgSendSuper2(&v8, sel_init);
    objc_msgSend(v5, "setResultType:", 5);
    if (v5)
      objc_setProperty_atomic_copy(v5, v6, v3, 48);
  }
  else
  {
    objc_msgSend(0, "setResultType:", 5);
    v5 = 0;
  }

  return v5;
}

+ (id)scopeToDirectInterface
{
  NEPolicyResult *v2;
  id v3;
  objc_super v5;

  v2 = [NEPolicyResult alloc];
  if (v2)
  {
    v5.receiver = v2;
    v5.super_class = (Class)NEPolicyResult;
    v3 = objc_msgSendSuper2(&v5, sel_init);
  }
  else
  {
    v3 = 0;
  }
  objc_msgSend(v3, "setResultType:", 12);
  return v3;
}

+ (id)tunnelIPToInterfaceName:(id)a3 secondaryResultType:(int64_t)a4
{
  id v5;
  NEPolicyResult *v6;
  _QWORD *v7;
  const char *v8;
  objc_super v10;

  v5 = a3;
  v6 = [NEPolicyResult alloc];
  if (v6)
  {
    v10.receiver = v6;
    v10.super_class = (Class)NEPolicyResult;
    v7 = objc_msgSendSuper2(&v10, sel_init);
    objc_msgSend(v7, "setResultType:", 6);
    if (v7)
    {
      objc_setProperty_atomic_copy(v7, v8, v5, 48);
      v7[5] = a4;
    }
  }
  else
  {
    objc_msgSend(0, "setResultType:", 6);
    v7 = 0;
  }

  return v7;
}

+ (id)filterWithControlUnit:(unsigned int)a3
{
  NEPolicyResult *v4;
  _DWORD *v5;
  objc_super v7;

  v4 = [NEPolicyResult alloc];
  if (v4)
  {
    v7.receiver = v4;
    v7.super_class = (Class)NEPolicyResult;
    v5 = objc_msgSendSuper2(&v7, sel_init);
    objc_msgSend(v5, "setResultType:", 7);
    if (v5)
      v5[5] = a3;
    return v5;
  }
  else
  {
    objc_msgSend(0, "setResultType:", 7);
    return 0;
  }
}

+ (id)prohibitFilters
{
  NEPolicyResult *v2;
  id v3;
  objc_super v5;

  v2 = [NEPolicyResult alloc];
  if (v2)
  {
    v5.receiver = v2;
    v5.super_class = (Class)NEPolicyResult;
    v3 = objc_msgSendSuper2(&v5, sel_init);
  }
  else
  {
    v3 = 0;
  }
  objc_msgSend(v3, "setResultType:", 14);
  return v3;
}

+ (id)netAgentUUID:(id)a3
{
  id v3;
  NEPolicyResult *v4;
  id v5;
  const char *v6;
  objc_super v8;

  v3 = a3;
  v4 = [NEPolicyResult alloc];
  if (v4)
  {
    v8.receiver = v4;
    v8.super_class = (Class)NEPolicyResult;
    v5 = objc_msgSendSuper2(&v8, sel_init);
    objc_msgSend(v5, "setResultType:", 8);
    if (v5)
      objc_setProperty_atomic_copy(v5, v6, v3, 56);
  }
  else
  {
    objc_msgSend(0, "setResultType:", 8);
    v5 = 0;
  }

  return v5;
}

+ (id)removeNetworkAgentUUID:(id)a3
{
  id v3;
  NEPolicyResult *v4;
  id v5;
  const char *v6;
  objc_super v8;

  v3 = a3;
  v4 = [NEPolicyResult alloc];
  if (v4)
  {
    v8.receiver = v4;
    v8.super_class = (Class)NEPolicyResult;
    v5 = objc_msgSendSuper2(&v8, sel_init);
    objc_msgSend(v5, "setResultType:", 15);
    if (v5)
      objc_setProperty_atomic_copy(v5, v6, v3, 56);
  }
  else
  {
    objc_msgSend(0, "setResultType:", 15);
    v5 = 0;
  }

  return v5;
}

+ (id)routeRules:(id)a3
{
  id v3;
  NEPolicyResult *v4;
  id v5;
  const char *v6;
  objc_super v8;

  v3 = a3;
  v4 = [NEPolicyResult alloc];
  if (v4)
  {
    v8.receiver = v4;
    v8.super_class = (Class)NEPolicyResult;
    v5 = objc_msgSendSuper2(&v8, sel_init);
    objc_msgSend(v5, "setResultType:", 9);
    if (v5)
      objc_setProperty_atomic_copy(v5, v6, v3, 64);
  }
  else
  {
    objc_msgSend(0, "setResultType:", 9);
    v5 = 0;
  }

  return v5;
}

+ (id)scopedNetworkAgent:(id)a3
{
  id v3;
  NEPolicyResult *v4;
  id v5;
  const char *v6;
  objc_super v8;

  v3 = a3;
  v4 = [NEPolicyResult alloc];
  if (v4)
  {
    v8.receiver = v4;
    v8.super_class = (Class)NEPolicyResult;
    v5 = objc_msgSendSuper2(&v8, sel_init);
    objc_msgSend(v5, "setResultType:", 11);
    if (v5)
      objc_setProperty_atomic_copy(v5, v6, v3, 56);
  }
  else
  {
    objc_msgSend(0, "setResultType:", 11);
    v5 = 0;
  }

  return v5;
}

+ (id)allowUnentitled
{
  NEPolicyResult *v2;
  id v3;
  objc_super v5;

  v2 = [NEPolicyResult alloc];
  if (v2)
  {
    v5.receiver = v2;
    v5.super_class = (Class)NEPolicyResult;
    v3 = objc_msgSendSuper2(&v5, sel_init);
  }
  else
  {
    v3 = 0;
  }
  objc_msgSend(v3, "setResultType:", 13);
  return v3;
}

@end
