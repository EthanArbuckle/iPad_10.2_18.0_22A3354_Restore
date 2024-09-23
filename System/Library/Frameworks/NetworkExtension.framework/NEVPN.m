@implementation NEVPN

- (NEVPN)init
{
  NEVPN *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)NEVPN;
  result = -[NEVPN init](&v3, sel_init);
  if (result)
    result->_tunnelType = 1;
  return result;
}

- (NEVPN)initWithCoder:(id)a3
{
  id v4;
  NEVPN *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  NSArray *onDemandRules;
  uint64_t v11;
  NEVPNProtocol *protocol;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  NSArray *exceptionApps;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;

  v4 = a3;
  v5 = -[NEVPN init](self, "init");
  if (v5)
  {
    v5->_enabled = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("Enabled"));
    v5->_onDemandEnabled = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("OnDemandEnabled"));
    v5->_disconnectOnDemandEnabled = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("DisconnectOnDemandEnabled"));
    v5->_onDemandUserOverrideDisabled = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("OnDemandUserOverrideDisabled"));
    v6 = (void *)MEMORY[0x1E0C99E60];
    v7 = objc_opt_class();
    objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("OnDemandRules"));
    v9 = objc_claimAutoreleasedReturnValue();
    onDemandRules = v5->_onDemandRules;
    v5->_onDemandRules = (NSArray *)v9;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("Protocol"));
    v11 = objc_claimAutoreleasedReturnValue();
    protocol = v5->_protocol;
    v5->_protocol = (NEVPNProtocol *)v11;

    v13 = (void *)MEMORY[0x1E0C99E60];
    v14 = objc_opt_class();
    objc_msgSend(v13, "setWithObjects:", v14, objc_opt_class(), 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v15, CFSTR("ExceptionApps"));
    v16 = objc_claimAutoreleasedReturnValue();
    exceptionApps = v5->_exceptionApps;
    v5->_exceptionApps = (NSArray *)v16;

    v18 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("TunnelType"));
    v5->_tunnelType = v18;
    if (!v18)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0
        && (-[NEVPN protocol](v5, "protocol"),
            v19 = (void *)objc_claimAutoreleasedReturnValue(),
            v20 = objc_msgSend(v19, "type"),
            v19,
            v20 == 4))
      {
        v21 = 2;
      }
      else
      {
        v21 = 1;
      }
      v5->_tunnelType = v21;
    }
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  objc_msgSend(v7, "encodeBool:forKey:", -[NEVPN isEnabled](self, "isEnabled"), CFSTR("Enabled"));
  objc_msgSend(v7, "encodeBool:forKey:", -[NEVPN isOnDemandEnabled](self, "isOnDemandEnabled"), CFSTR("OnDemandEnabled"));
  objc_msgSend(v7, "encodeBool:forKey:", -[NEVPN isDisconnectOnDemandEnabled](self, "isDisconnectOnDemandEnabled"), CFSTR("DisconnectOnDemandEnabled"));
  objc_msgSend(v7, "encodeBool:forKey:", -[NEVPN isOnDemandUserOverrideDisabled](self, "isOnDemandUserOverrideDisabled"), CFSTR("OnDemandUserOverrideDisabled"));
  -[NEVPN onDemandRules](self, "onDemandRules");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "encodeObject:forKey:", v4, CFSTR("OnDemandRules"));

  -[NEVPN protocol](self, "protocol");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "encodeObject:forKey:", v5, CFSTR("Protocol"));

  -[NEVPN exceptionApps](self, "exceptionApps");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "encodeObject:forKey:", v6, CFSTR("ExceptionApps"));

  objc_msgSend(v7, "encodeInteger:forKey:", -[NEVPN tunnelType](self, "tunnelType"), CFSTR("TunnelType"));
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;

  v4 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  objc_msgSend(v4, "setEnabled:", -[NEVPN isEnabled](self, "isEnabled"));
  objc_msgSend(v4, "setOnDemandEnabled:", -[NEVPN isOnDemandEnabled](self, "isOnDemandEnabled"));
  objc_msgSend(v4, "setDisconnectOnDemandEnabled:", -[NEVPN isDisconnectOnDemandEnabled](self, "isDisconnectOnDemandEnabled"));
  objc_msgSend(v4, "setOnDemandUserOverrideDisabled:", -[NEVPN isOnDemandUserOverrideDisabled](self, "isOnDemandUserOverrideDisabled"));
  -[NEVPN onDemandRules](self, "onDemandRules");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v6 = objc_alloc(MEMORY[0x1E0C99D20]);
    -[NEVPN onDemandRules](self, "onDemandRules");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v6, "initWithArray:copyItems:", v7, 1);
    objc_msgSend(v4, "setOnDemandRules:", v8);

  }
  -[NEVPN protocol](self, "protocol");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setProtocol:", v9);

  -[NEVPN exceptionApps](self, "exceptionApps");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    v11 = objc_alloc(MEMORY[0x1E0C99D20]);
    -[NEVPN exceptionApps](self, "exceptionApps");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)objc_msgSend(v11, "initWithArray:copyItems:", v12, 1);
    objc_msgSend(v4, "setExceptionApps:", v13);

  }
  objc_msgSend(v4, "setTunnelType:", -[NEVPN tunnelType](self, "tunnelType"));
  return v4;
}

- (BOOL)checkValidityAndCollectErrors:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char v10;
  uint64_t i;
  void *v12;
  char v13;
  void *v14;
  char v15;
  uint64_t v16;
  void *v17;
  char v18;
  uint64_t v19;
  void *v20;
  void *v21;
  uint64_t v22;
  NEVPN *v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[NEVPN onDemandRules](self, "onDemandRules");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v27 = 0u;
    v28 = 0u;
    v25 = 0u;
    v26 = 0u;
    v24 = self;
    -[NEVPN onDemandRules](self, "onDemandRules");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v26;
      v10 = 1;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v26 != v9)
            objc_enumerationMutation(v6);
          v12 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            if (!objc_msgSend(v12, "checkValidityAndCollectErrors:", v4))
              v10 = 0;
          }
          else
          {
            +[NEConfiguration addError:toList:]((uint64_t)NEConfiguration, CFSTR("Invalid on demand rule object"), v4);
            v10 = 0;
          }
        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
      }
      while (v8);
    }
    else
    {
      v10 = 1;
    }

    v13 = v10 & 1;
    self = v24;
  }
  else
  {
    v13 = 1;
  }
  -[NEVPN protocol](self, "protocol");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    -[NEVPN protocol](self, "protocol");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "checkValidityAndCollectErrors:", v4);

    LOBYTE(v14) = v15 & v13;
  }
  else
  {
    +[NEConfiguration addError:toList:]((uint64_t)NEConfiguration, CFSTR("Missing protocol"), v4);
  }
  -[NEVPN exceptionApps](self, "exceptionApps");
  v16 = objc_claimAutoreleasedReturnValue();
  if (v16)
  {
    v17 = (void *)v16;
    v18 = ne_session_disable_restrictions();

    if ((v18 & 1) == 0)
    {
      +[NEConfiguration addError:toList:]((uint64_t)NEConfiguration, CFSTR("Exception app rules are not allowed"), v4);
      LOBYTE(v14) = 0;
    }
  }
  if (-[NEVPN tunnelType](self, "tunnelType") == 2)
  {
    -[NEVPN protocol](self, "protocol");
    v19 = objc_claimAutoreleasedReturnValue();
    if (v19)
    {
      v20 = (void *)v19;
      -[NEVPN protocol](self, "protocol");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = objc_msgSend(v21, "type");

      if (v22 != 4)
      {
        +[NEConfiguration addError:toList:]((uint64_t)NEConfiguration, CFSTR("App Proxy tunnel type can only be used with plugin-based configurations"), v4);
        LOBYTE(v14) = 0;
      }
    }
  }

  return (char)v14;
}

- (id)descriptionWithIndent:(int)a3 options:(unint64_t)a4
{
  uint64_t v5;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  const __CFString *v11;

  v5 = *(_QWORD *)&a3;
  v7 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  objc_msgSend(v7, "appendPrettyBOOL:withName:andIndent:options:", -[NEVPN isEnabled](self, "isEnabled"), CFSTR("enabled"), v5, a4);
  objc_msgSend(v7, "appendPrettyBOOL:withName:andIndent:options:", -[NEVPN isOnDemandEnabled](self, "isOnDemandEnabled"), CFSTR("onDemandEnabled"), v5, a4);
  objc_msgSend(v7, "appendPrettyBOOL:withName:andIndent:options:", -[NEVPN isDisconnectOnDemandEnabled](self, "isDisconnectOnDemandEnabled"), CFSTR("disconnectOnDemandEnabled"), v5, a4);
  objc_msgSend(v7, "appendPrettyBOOL:withName:andIndent:options:", -[NEVPN isOnDemandUserOverrideDisabled](self, "isOnDemandUserOverrideDisabled"), CFSTR("onDemandUserOverrideDisabled"), v5, a4);
  -[NEVPN onDemandRules](self, "onDemandRules");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "appendPrettyObject:withName:andIndent:options:", v8, CFSTR("onDemandRules"), v5, a4);

  -[NEVPN protocol](self, "protocol");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "appendPrettyObject:withName:andIndent:options:", v9, CFSTR("protocol"), v5, a4);

  -[NEVPN exceptionApps](self, "exceptionApps");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "appendPrettyObject:withName:andIndent:options:", v10, CFSTR("exceptionApps"), v5, a4);

  if (-[NEVPN tunnelType](self, "tunnelType") == 2)
    v11 = CFSTR("app-proxy");
  else
    v11 = CFSTR("packet");
  objc_msgSend(v7, "appendPrettyObject:withName:andIndent:options:", v11, CFSTR("tunnelType"), v5, a4);
  return v7;
}

- (id)description
{
  return -[NEVPN descriptionWithIndent:options:](self, "descriptionWithIndent:options:", 0, 0);
}

- (id)copyLegacyDictionary
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t j;
  void *v22;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  -[NEVPN protocol](self, "protocol");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[NEVPN protocol](self, "protocol");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (id)objc_msgSend(v4, "copyLegacyDictionary");

  }
  else
  {
    v5 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[NEVPN isOnDemandEnabled](self, "isOnDemandEnabled"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v6, *MEMORY[0x1E0CE9008]);

  -[NEVPN onDemandRules](self, "onDemandRules");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    v30 = 0u;
    v31 = 0u;
    v28 = 0u;
    v29 = 0u;
    -[NEVPN onDemandRules](self, "onDemandRules");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
    if (!v9)
    {
      v11 = v8;
      goto LABEL_17;
    }
    v10 = v9;
    v11 = 0;
    v12 = *(_QWORD *)v29;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v29 != v12)
          objc_enumerationMutation(v8);
        v14 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v28 + 1) + 8 * i), "copyLegacyDictionary");
        if (!v11)
          v11 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
        objc_msgSend(v11, "addObject:", v14);

      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
    }
    while (v10);

    if (v11)
    {
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v11, *MEMORY[0x1E0CE9088]);
LABEL_17:

    }
  }
  -[NEVPN exceptionApps](self, "exceptionApps");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    v16 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v24 = 0u;
    v25 = 0u;
    v26 = 0u;
    v27 = 0u;
    -[NEVPN exceptionApps](self, "exceptionApps", 0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
    if (v18)
    {
      v19 = v18;
      v20 = *(_QWORD *)v25;
      do
      {
        for (j = 0; j != v19; ++j)
        {
          if (*(_QWORD *)v25 != v20)
            objc_enumerationMutation(v17);
          objc_msgSend(*(id *)(*((_QWORD *)&v24 + 1) + 8 * j), "matchSigningIdentifier");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "addObject:", v22);

        }
        v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
      }
      while (v19);
    }

    objc_msgSend(v5, "setObject:forKeyedSubscript:", v16, CFSTR("ExceptionApps"));
  }
  return v5;
}

- (id)initFromLegacyDictionary:(id)a3
{
  id v4;
  NEVPN *v5;
  void *v6;
  __objc2_class *v7;
  NEVPN *v8;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  NEVPNProtocol *protocol;
  uint64_t v13;
  NSArray *onDemandRules;
  void *v15;
  NSObject *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  void *v21;
  NEAppRule *v22;
  void *v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  uint8_t buf[16];
  objc_super v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v30.receiver = self;
  v30.super_class = (Class)NEVPN;
  v5 = -[NEVPN init](&v30, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("__NEVPNProtocolType"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    switch(objc_msgSend(v6, "intValue"))
    {
      case 1u:
        v7 = NEVPNProtocolIPSec;
        goto LABEL_10;
      case 2u:
        v7 = NEVPNProtocolL2TP;
        goto LABEL_10;
      case 3u:
        ne_log_obj();
        v9 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_error_impl(&dword_19BD16000, v9, OS_LOG_TYPE_ERROR, "PPTP is not supported", buf, 2u);
        }
        v8 = 0;
        v10 = v6;
        goto LABEL_28;
      case 4u:
        v7 = NETunnelProviderProtocol;
LABEL_10:
        v11 = objc_msgSend([v7 alloc], "initFromLegacyDictionary:", v4);
        protocol = v5->_protocol;
        v5->_protocol = (NEVPNProtocol *)v11;

        break;
      default:
        break;
    }
    objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0CE9008]);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
      v5->_onDemandEnabled = objc_msgSend(v10, "BOOLValue");
    +[NEOnDemandRule createOnDemandRulesFromLegacyDictionary:]((uint64_t)NEOnDemandRule, v4);
    v13 = objc_claimAutoreleasedReturnValue();
    onDemandRules = v5->_onDemandRules;
    v5->_onDemandRules = (NSArray *)v13;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("ExceptionApps"));
    v9 = objc_claimAutoreleasedReturnValue();
    if (isa_nsarray(v9) && -[NSObject count](v9, "count"))
    {
      v24 = v10;
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = 0u;
      v26 = 0u;
      v27 = 0u;
      v28 = 0u;
      v16 = v9;
      v17 = -[NSObject countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v25, v31, 16);
      if (v17)
      {
        v18 = v17;
        v19 = *(_QWORD *)v26;
        do
        {
          for (i = 0; i != v18; ++i)
          {
            if (*(_QWORD *)v26 != v19)
              objc_enumerationMutation(v16);
            v21 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
            if (isa_nsstring(v21))
            {
              v22 = -[NEAppRule initWithSigningIdentifier:]([NEAppRule alloc], "initWithSigningIdentifier:", v21);
              if (v22)
                objc_msgSend(v15, "addObject:", v22);

            }
          }
          v18 = -[NSObject countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v25, v31, 16);
        }
        while (v18);
      }

      v10 = v24;
    }
    v8 = v5;
LABEL_28:

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (BOOL)isEnabled
{
  return self->_enabled;
}

- (void)setEnabled:(BOOL)a3
{
  self->_enabled = a3;
}

- (BOOL)isOnDemandEnabled
{
  return self->_onDemandEnabled;
}

- (void)setOnDemandEnabled:(BOOL)a3
{
  self->_onDemandEnabled = a3;
}

- (BOOL)isDisconnectOnDemandEnabled
{
  return self->_disconnectOnDemandEnabled;
}

- (void)setDisconnectOnDemandEnabled:(BOOL)a3
{
  self->_disconnectOnDemandEnabled = a3;
}

- (BOOL)isOnDemandUserOverrideDisabled
{
  return self->_onDemandUserOverrideDisabled;
}

- (void)setOnDemandUserOverrideDisabled:(BOOL)a3
{
  self->_onDemandUserOverrideDisabled = a3;
}

- (NSArray)onDemandRules
{
  return (NSArray *)objc_getProperty(self, a2, 16, 1);
}

- (void)setOnDemandRules:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 16);
}

- (NEVPNProtocol)protocol
{
  return (NEVPNProtocol *)objc_getProperty(self, a2, 24, 1);
}

- (void)setProtocol:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 24);
}

- (int64_t)tunnelType
{
  return self->_tunnelType;
}

- (void)setTunnelType:(int64_t)a3
{
  self->_tunnelType = a3;
}

- (NSArray)exceptionApps
{
  return (NSArray *)objc_getProperty(self, a2, 40, 1);
}

- (void)setExceptionApps:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_exceptionApps, 0);
  objc_storeStrong((id *)&self->_protocol, 0);
  objc_storeStrong((id *)&self->_onDemandRules, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
