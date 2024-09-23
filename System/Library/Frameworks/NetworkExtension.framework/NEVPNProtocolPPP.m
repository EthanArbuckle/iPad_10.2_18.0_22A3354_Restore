@implementation NEVPNProtocolPPP

- (NEVPNProtocolPPP)initWithType:(int64_t)a3
{
  NEVPNProtocolPPP *v3;
  NEVPNProtocolPPP *v4;
  NEIPv4Settings *v5;
  NEIPv4Settings *IPv4Settings;
  NEIPv6Settings *v7;
  NEIPv6Settings *IPv6Settings;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)NEVPNProtocolPPP;
  v3 = -[NEVPNProtocol initWithType:](&v10, sel_initWithType_, a3);
  v4 = v3;
  if (v3)
  {
    v3->_authenticationMethod = 1;
    v5 = -[NEIPv4Settings initWithConfigMethod:]([NEIPv4Settings alloc], "initWithConfigMethod:", 2);
    IPv4Settings = v4->_IPv4Settings;
    v4->_IPv4Settings = v5;

    v7 = -[NEIPv6Settings initWithConfigMethod:]([NEIPv6Settings alloc], "initWithConfigMethod:", 1);
    IPv6Settings = v4->_IPv6Settings;
    v4->_IPv6Settings = v7;

  }
  return v4;
}

- (NEVPNProtocolPPP)initWithCoder:(id)a3
{
  id v4;
  NEVPNProtocolPPP *v5;
  uint64_t v6;
  NEIPv4Settings *IPv4Settings;
  uint64_t v8;
  NEIPv6Settings *IPv6Settings;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)NEVPNProtocolPPP;
  v5 = -[NEVPNProtocol initWithCoder:](&v11, sel_initWithCoder_, v4);
  if (v5)
  {
    v5->_authenticationMethod = (int)objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("AuthenticationMethod"));
    v5->_verboseLoggingEnabled = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("VerboseLoggingEnabled"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("IPv4Settings"));
    v6 = objc_claimAutoreleasedReturnValue();
    IPv4Settings = v5->_IPv4Settings;
    v5->_IPv4Settings = (NEIPv4Settings *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("IPv6Settings"));
    v8 = objc_claimAutoreleasedReturnValue();
    IPv6Settings = v5->_IPv6Settings;
    v5->_IPv6Settings = (NEIPv6Settings *)v8;

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
  v7.super_class = (Class)NEVPNProtocolPPP;
  v4 = a3;
  -[NEVPNProtocol encodeWithCoder:](&v7, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeInt32:forKey:", -[NEVPNProtocolPPP authenticationMethod](self, "authenticationMethod", v7.receiver, v7.super_class), CFSTR("AuthenticationMethod"));
  objc_msgSend(v4, "encodeBool:forKey:", -[NEVPNProtocolPPP verboseLoggingEnabled](self, "verboseLoggingEnabled"), CFSTR("VerboseLoggingEnabled"));
  -[NEVPNProtocolPPP IPv4Settings](self, "IPv4Settings");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("IPv4Settings"));

  -[NEVPNProtocolPPP IPv6Settings](self, "IPv6Settings");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("IPv6Settings"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)NEVPNProtocolPPP;
  v4 = -[NEVPNProtocol copyWithZone:](&v8, sel_copyWithZone_, a3);
  objc_msgSend(v4, "setAuthenticationMethod:", -[NEVPNProtocolPPP authenticationMethod](self, "authenticationMethod"));
  objc_msgSend(v4, "setVerboseLoggingEnabled:", -[NEVPNProtocolPPP verboseLoggingEnabled](self, "verboseLoggingEnabled"));
  -[NEVPNProtocolPPP IPv4Settings](self, "IPv4Settings");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setIPv4Settings:", v5);

  -[NEVPNProtocolPPP IPv6Settings](self, "IPv6Settings");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setIPv6Settings:", v6);

  return v4;
}

- (BOOL)checkValidityAndCollectErrors:(id)a3
{
  id v4;
  unsigned __int8 v5;
  uint64_t v6;
  void *v7;
  void *v8;
  char v9;
  uint64_t v10;
  void *v11;
  void *v12;
  char v13;
  void *v14;
  objc_super v16;
  objc_super v17;

  v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)NEVPNProtocolPPP;
  if (objc_msgSend(-[NEVPNProtocolPPP class](&v17, sel_class), "instancesRespondToSelector:", sel_checkValidityAndCollectErrors_))
  {
    v16.receiver = self;
    v16.super_class = (Class)NEVPNProtocolPPP;
    v5 = -[NEVPNProtocol checkValidityAndCollectErrors:](&v16, sel_checkValidityAndCollectErrors_, v4);
  }
  else
  {
    v5 = 1;
  }
  -[NEVPNProtocolPPP IPv4Settings](self, "IPv4Settings");
  v6 = objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v7 = (void *)v6;
    -[NEVPNProtocolPPP IPv4Settings](self, "IPv4Settings");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "checkValidityAndCollectErrors:", v4);

    v5 &= v9;
  }
  -[NEVPNProtocolPPP IPv6Settings](self, "IPv6Settings");
  v10 = objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    v11 = (void *)v10;
    -[NEVPNProtocolPPP IPv6Settings](self, "IPv6Settings");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "checkValidityAndCollectErrors:", v4);

    v5 &= v13;
  }
  if (-[NEVPNProtocolPPP authenticationMethod](self, "authenticationMethod") == 3)
  {
    -[NEVPNProtocol identityReferenceInternal](self, "identityReferenceInternal");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v14)
    {
      +[NEConfiguration addError:toList:]((uint64_t)NEConfiguration, CFSTR("Missing identity"), v4);
      v5 = 0;
    }
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
  v13.super_class = (Class)NEVPNProtocolPPP;
  -[NEVPNProtocol descriptionWithIndent:options:](&v13, sel_descriptionWithIndent_options_, v5, a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v7, "initWithString:", v8);

  objc_msgSend(v9, "appendPrettyInt:withName:andIndent:options:", -[NEVPNProtocolPPP authenticationMethod](self, "authenticationMethod"), CFSTR("authenticationMethod"), v5, a4);
  objc_msgSend(v9, "appendPrettyBOOL:withName:andIndent:options:", -[NEVPNProtocolPPP verboseLoggingEnabled](self, "verboseLoggingEnabled"), CFSTR("verboseLoggingEnabled"), v5, a4);
  -[NEVPNProtocolPPP IPv4Settings](self, "IPv4Settings");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "appendPrettyObject:withName:andIndent:options:", v10, CFSTR("IPv4Settings"), v5, a4);

  -[NEVPNProtocolPPP IPv6Settings](self, "IPv6Settings");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "appendPrettyObject:withName:andIndent:options:", v11, CFSTR("IPv6Settings"), v5, a4);

  return v9;
}

- (id)copyLegacyDictionary
{
  return -[NEVPNProtocolPPP copyLegacyDictionaryComplete:](self, "copyLegacyDictionaryComplete:", 1);
}

- (id)copyLegacyDictionaryComplete:(BOOL)a3
{
  _BOOL4 v3;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  const __CFString *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v25;
  uint64_t v26;
  _QWORD v27[2];

  v3 = a3;
  v27[1] = *MEMORY[0x1E0C80C00];
  v5 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  -[NEVPNProtocol serverAddress](self, "serverAddress");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[NEVPNProtocol serverAddress](self, "serverAddress");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v7, *MEMORY[0x1E0CE8E00]);

  }
  -[NEVPNProtocol username](self, "username");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[NEVPNProtocol username](self, "username");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v9, *MEMORY[0x1E0CE8DC0]);

  }
  if (-[NEVPNProtocolPPP authenticationMethod](self, "authenticationMethod") == 1
    && (-[NEVPNProtocol passwordKeychainItem](self, "passwordKeychainItem"),
        v10 = (void *)objc_claimAutoreleasedReturnValue(),
        v10,
        v10))
  {
    -[NEVPNProtocol passwordKeychainItem](self, "passwordKeychainItem");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "password");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    -[NEVPNProtocol passwordKeychainItem](self, "passwordKeychainItem");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v13;
    if (v12)
    {
      objc_msgSend(v13, "password");
      v15 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(v13, "identifier");
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v21)
        goto LABEL_22;
      -[NEVPNProtocol passwordKeychainItem](self, "passwordKeychainItem");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "identifier");
      v15 = objc_claimAutoreleasedReturnValue();
    }
    v22 = (void *)v15;

    if (v22)
    {
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v22, *MEMORY[0x1E0CE8DC8]);
      objc_msgSend(v5, "setObject:forKeyedSubscript:", *MEMORY[0x1E0CE9148], *MEMORY[0x1E0CE8DD0]);

    }
  }
  else
  {
    if (-[NEVPNProtocolPPP authenticationMethod](self, "authenticationMethod") == 2)
    {
      v27[0] = *MEMORY[0x1E0CE9150];
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v27, 1);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v16, *MEMORY[0x1E0CE8DD8]);

      v17 = (const __CFString *)*MEMORY[0x1E0CE8DB8];
      v18 = &unk_1E3D03AE8;
    }
    else if (-[NEVPNProtocolPPP authenticationMethod](self, "authenticationMethod") == 3)
    {
      v26 = *MEMORY[0x1E0CE9150];
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v26, 1);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v19, *MEMORY[0x1E0CE8DD8]);

      v17 = (const __CFString *)*MEMORY[0x1E0CE8DB8];
      v18 = &unk_1E3D03B00;
    }
    else if (-[NEVPNProtocolPPP authenticationMethod](self, "authenticationMethod") == 4)
    {
      v25 = *MEMORY[0x1E0CE9150];
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v25, 1);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v20, *MEMORY[0x1E0CE8DD8]);

      v17 = (const __CFString *)*MEMORY[0x1E0CE8DB8];
      v18 = &unk_1E3D03B18;
    }
    else
    {
      if (-[NEVPNProtocolPPP authenticationMethod](self, "authenticationMethod") != 5)
        goto LABEL_22;
      v18 = &unk_1E3D03880;
      v17 = CFSTR("TokenCard");
    }
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v18, v17);
  }
LABEL_22:
  if (v3)
  {
    if (-[NEVPNProtocolPPP verboseLoggingEnabled](self, "verboseLoggingEnabled"))
      v23 = &unk_1E3D03880;
    else
      v23 = &unk_1E3D03898;
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v23, *MEMORY[0x1E0CE8E48]);
    -[NEVPNProtocol addDisconnectOptions:](self, "addDisconnectOptions:", v5);
    objc_msgSend(v5, "setObject:forKeyedSubscript:", &unk_1E3D03880, *MEMORY[0x1E0CE8DB0]);
    objc_msgSend(v5, "setObject:forKeyedSubscript:", &unk_1E3D03898, *MEMORY[0x1E0CE8DE0]);
    objc_msgSend(v5, "setObject:forKeyedSubscript:", &unk_1E3D03880, *MEMORY[0x1E0CE8DE8]);
    objc_msgSend(v5, "setObject:forKeyedSubscript:", &unk_1E3D03898, *MEMORY[0x1E0CE8DF0]);
    objc_msgSend(v5, "setObject:forKeyedSubscript:", &unk_1E3D038B0, *MEMORY[0x1E0CE8DF8]);
    objc_msgSend(v5, "setObject:forKeyedSubscript:", &unk_1E3D03898, *MEMORY[0x1E0CE8E08]);
    objc_msgSend(v5, "setObject:forKeyedSubscript:", &unk_1E3D03898, *MEMORY[0x1E0CE8E10]);
    objc_msgSend(v5, "setObject:forKeyedSubscript:", &unk_1E3D03898, *MEMORY[0x1E0CE8E18]);
    objc_msgSend(v5, "setObject:forKeyedSubscript:", &unk_1E3D03898, *MEMORY[0x1E0CE8E20]);
    objc_msgSend(v5, "setObject:forKeyedSubscript:", &unk_1E3D038C8, *MEMORY[0x1E0CE8E28]);
    objc_msgSend(v5, "setObject:forKeyedSubscript:", &unk_1E3D03880, *MEMORY[0x1E0CE8E30]);
    objc_msgSend(v5, "setObject:forKeyedSubscript:", &unk_1E3D038E0, *MEMORY[0x1E0CE8E38]);
    objc_msgSend(v5, "setObject:forKeyedSubscript:", &unk_1E3D038F8, *MEMORY[0x1E0CE8E40]);
    objc_msgSend(v5, "setObject:forKeyedSubscript:", CFSTR("/var/log/ppp.log"), CFSTR("Logfile"));
  }
  return v5;
}

- (id)initFromLegacyDictionary:(id)a3
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  NEVPNProtocolPPP *v8;
  void *v9;
  int v10;
  void *v11;
  uint64_t v12;
  void *v13;
  int v14;
  void *v15;
  uint64_t v16;
  void *v17;
  int v18;
  void *v19;
  uint64_t v20;
  void *v21;
  int v22;
  NEKeychainItem *v23;
  void *v24;
  int64_t keychainDomain;
  SEL v26;
  id v27;
  NEKeychainItem *v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  int v32;
  void *v33;

  v4 = a3;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("__NEVPNProtocolIdentifier"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = isa_nsuuid(v5);

  if (v6)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("__NEVPNProtocolIdentifier"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[NEVPNProtocol initWithProtocolIdentifier:](self, "initWithProtocolIdentifier:", v7);

    if (!v8)
      goto LABEL_25;
  }
  else
  {
    v8 = -[NEVPNProtocolPPP init](self, "init");
    if (!v8)
      goto LABEL_25;
  }
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("__NEVPNKeychainDomain"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = isa_nsnumber(v9);

  if (v10)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("__NEVPNKeychainDomain"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v8->super._keychainDomain = (int)objc_msgSend(v11, "intValue");

  }
  v12 = *MEMORY[0x1E0CE8E00];
  objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0CE8E00]);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = isa_nsstring(v13);

  if (v14)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", v12);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[NEVPNProtocol setServerAddress:](v8, "setServerAddress:", v15);

  }
  v16 = *MEMORY[0x1E0CE8DC0];
  objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0CE8DC0]);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = isa_nsstring(v17);

  if (v18)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", v16);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[NEVPNProtocol setUsername:](v8, "setUsername:", v19);

  }
  v8->_authenticationMethod = 1;
  v20 = *MEMORY[0x1E0CE8DC8];
  objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0CE8DC8]);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = isa_nsstring(v21);

  if (v22)
  {
    v23 = [NEKeychainItem alloc];
    objc_msgSend(v4, "objectForKeyedSubscript:", v20);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    keychainDomain = v8->super._keychainDomain;
    v27 = objc_getProperty(v8, v26, 88, 1);
    v28 = -[NEKeychainItem initWithLegacyIdentifier:domain:accessGroup:](v23, "initWithLegacyIdentifier:domain:accessGroup:", v24, keychainDomain, v27);
    -[NEVPNProtocol setPasswordKeychainItem:](v8, "setPasswordKeychainItem:", v28);
    goto LABEL_13;
  }
  objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0CE8DD8]);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  if (!isa_nsarray(v24) || !objc_msgSend(v24, "containsObject:", *MEMORY[0x1E0CE9150]))
    goto LABEL_22;
  objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0CE8DB8]);
  v27 = (id)objc_claimAutoreleasedReturnValue();
  if (isa_nsarray(v27) && objc_msgSend(v27, "count"))
  {
    objc_msgSend(v27, "objectAtIndexedSubscript:", 0);
    v28 = (NEKeychainItem *)objc_claimAutoreleasedReturnValue();
    if (isa_nsstring(v28))
    {
      if ((-[NEKeychainItem isEqualToString:](v28, "isEqualToString:", CFSTR("EAP-RSA")) & 1) != 0)
      {
        v29 = 2;
      }
      else if ((-[NEKeychainItem isEqualToString:](v28, "isEqualToString:", CFSTR("EAP-TLS")) & 1) != 0)
      {
        v29 = 3;
      }
      else
      {
        if (!-[NEKeychainItem isEqualToString:](v28, "isEqualToString:", CFSTR("EAP-KRB")))
          goto LABEL_13;
        v29 = 4;
      }
      v8->_authenticationMethod = v29;
    }
LABEL_13:

  }
LABEL_22:

  v30 = *MEMORY[0x1E0CE8E48];
  objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0CE8E48]);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = isa_nsnumber(v31);

  if (v32)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", v30);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v8->_verboseLoggingEnabled = objc_msgSend(v33, "BOOLValue");

  }
  -[NEVPNProtocol initDisconnectOptions:](v8, "initDisconnectOptions:", v4);
LABEL_25:

  return v8;
}

- (BOOL)setServiceProtocolsInService:(__SCNetworkService *)a3
{
  void *v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  const __CFDictionary *v10;
  char v11;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)NEVPNProtocolPPP;
  if (!-[NEVPNProtocol setServiceProtocolsInService:](&v13, sel_setServiceProtocolsInService_))
    return 0;
  -[NEVPNProtocolPPP IPv4Settings](self, "IPv4Settings");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[NEVPNProtocolPPP IPv4Settings](self, "IPv4Settings");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(v6, "copyLegacyDictionary");

  }
  v7 = +[NEConfiguration setConfiguration:forProtocol:inService:]((uint64_t)NEConfiguration, (const __CFDictionary *)v5, (const __CFString *)*MEMORY[0x1E0CE8BF0], a3);
  if (v5)
    CFRelease(v5);
  if (!v7)
    return 0;
  -[NEVPNProtocolPPP IPv6Settings](self, "IPv6Settings");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[NEVPNProtocolPPP IPv6Settings](self, "IPv6Settings");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (const __CFDictionary *)objc_msgSend(v9, "copyLegacyDictionary");

  }
  else
  {
    v10 = 0;
  }
  v11 = +[NEConfiguration setConfiguration:forProtocol:inService:]((uint64_t)NEConfiguration, v10, (const __CFString *)*MEMORY[0x1E0CE8BF8], a3);
  if (v10)
    CFRelease(v10);
  return v11;
}

- (BOOL)updateWithServiceProtocolsFromService:(__SCNetworkService *)a3
{
  _BOOL4 v5;
  CFDictionaryRef v6;
  CFDictionaryRef v7;
  id v8;
  CFDictionaryRef v9;
  CFDictionaryRef v10;
  id v11;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)NEVPNProtocolPPP;
  v5 = -[NEVPNProtocol updateWithServiceProtocolsFromService:](&v13, sel_updateWithServiceProtocolsFromService_);
  if (v5)
  {
    v6 = +[NEConfiguration copyConfigurationForProtocol:inService:]((uint64_t)NEConfiguration, (const __CFString *)*MEMORY[0x1E0CE8BF0], a3);
    if (v6)
    {
      v7 = v6;
      v8 = -[NEIPv4Settings initFromLegacyDictionary:]([NEIPv4Settings alloc], "initFromLegacyDictionary:", v6);
      -[NEVPNProtocolPPP setIPv4Settings:](self, "setIPv4Settings:", v8);

      CFRelease(v7);
    }
    v9 = +[NEConfiguration copyConfigurationForProtocol:inService:]((uint64_t)NEConfiguration, (const __CFString *)*MEMORY[0x1E0CE8BF8], a3);
    if (v9)
    {
      v10 = v9;
      v11 = -[NEIPv6Settings initFromLegacyDictionary:]([NEIPv6Settings alloc], "initFromLegacyDictionary:", v9);
      -[NEVPNProtocolPPP setIPv6Settings:](self, "setIPv6Settings:", v11);

      CFRelease(v10);
    }
  }
  return v5;
}

- (int64_t)authenticationMethod
{
  return self->_authenticationMethod;
}

- (void)setAuthenticationMethod:(int64_t)a3
{
  self->_authenticationMethod = a3;
}

- (BOOL)verboseLoggingEnabled
{
  return self->_verboseLoggingEnabled;
}

- (void)setVerboseLoggingEnabled:(BOOL)a3
{
  self->_verboseLoggingEnabled = a3;
}

- (NEIPv4Settings)IPv4Settings
{
  return (NEIPv4Settings *)objc_getProperty(self, a2, 192, 1);
}

- (void)setIPv4Settings:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 192);
}

- (NEIPv6Settings)IPv6Settings
{
  return (NEIPv6Settings *)objc_getProperty(self, a2, 200, 1);
}

- (void)setIPv6Settings:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 200);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_IPv6Settings, 0);
  objc_storeStrong((id *)&self->_IPv4Settings, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
