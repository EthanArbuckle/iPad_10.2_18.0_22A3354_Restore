@implementation NEVPNProtocolIPSec

- (NEVPNProtocolIPSec)init
{
  return -[NEVPNProtocolIPSec initWithType:](self, "initWithType:", 1);
}

- (NEVPNProtocolIPSec)initWithType:(int64_t)a3
{
  NEVPNProtocolIPSec *v3;
  NEVPNProtocolIPSec *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)NEVPNProtocolIPSec;
  v3 = -[NEVPNProtocol initWithType:](&v6, sel_initWithType_, a3);
  v4 = v3;
  if (v3)
  {
    v3->super._keychainDomain = 0;
    -[NEVPNProtocol setDisconnectOnWake:](v3, "setDisconnectOnWake:", 1);
    v4->_authenticationMethod = 0;
    v4->_useExtendedAuthentication = 1;
    v4->_extendedAuthPasswordPrompt = 0;
  }
  return v4;
}

- (NEVPNProtocolIPSec)initWithCoder:(id)a3
{
  id v4;
  NEVPNProtocolIPSec *v5;
  uint64_t v6;
  NEKeychainItem *sharedSecretKeychainItem;
  uint64_t v8;
  NSData *sharedSecretReference;
  uint64_t v10;
  NSString *localIdentifier;
  uint64_t v12;
  NSString *remoteIdentifier;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  NSArray *legacyProposals;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  NSArray *legacyExchangeMode;
  objc_super v25;

  v4 = a3;
  v25.receiver = self;
  v25.super_class = (Class)NEVPNProtocolIPSec;
  v5 = -[NEVPNProtocol initWithCoder:](&v25, sel_initWithCoder_, v4);
  if (v5)
  {
    v5->_authenticationMethod = (int)objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("AuthenticationMethod"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("SharedSecret"));
    v6 = objc_claimAutoreleasedReturnValue();
    sharedSecretKeychainItem = v5->_sharedSecretKeychainItem;
    v5->_sharedSecretKeychainItem = (NEKeychainItem *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("SharedSecretReference"));
    v8 = objc_claimAutoreleasedReturnValue();
    sharedSecretReference = v5->_sharedSecretReference;
    v5->_sharedSecretReference = (NSData *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("LocalIdentifier"));
    v10 = objc_claimAutoreleasedReturnValue();
    localIdentifier = v5->_localIdentifier;
    v5->_localIdentifier = (NSString *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("RemoteIdentifier"));
    v12 = objc_claimAutoreleasedReturnValue();
    remoteIdentifier = v5->_remoteIdentifier;
    v5->_remoteIdentifier = (NSString *)v12;

    v5->_useExtendedAuthentication = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("UseExtendedAuthentication"));
    v14 = (void *)MEMORY[0x1E0C99E60];
    v15 = objc_opt_class();
    objc_msgSend(v14, "setWithObjects:", v15, objc_opt_class(), 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v16, CFSTR("LegacyProposals"));
    v17 = objc_claimAutoreleasedReturnValue();
    legacyProposals = v5->_legacyProposals;
    v5->_legacyProposals = (NSArray *)v17;

    v19 = (void *)MEMORY[0x1E0C99E60];
    v20 = objc_opt_class();
    objc_msgSend(v19, "setWithObjects:", v20, objc_opt_class(), 0);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v21, CFSTR("LegacyExchangeMode"));
    v22 = objc_claimAutoreleasedReturnValue();
    legacyExchangeMode = v5->_legacyExchangeMode;
    v5->_legacyExchangeMode = (NSArray *)v22;

    v5->_extendedAuthPasswordPrompt = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("ExtendedAuthPasswordPrompt"));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)NEVPNProtocolIPSec;
  v4 = a3;
  -[NEVPNProtocol encodeWithCoder:](&v11, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeInt32:forKey:", -[NEVPNProtocolIPSec authenticationMethod](self, "authenticationMethod", v11.receiver, v11.super_class), CFSTR("AuthenticationMethod"));
  -[NEVPNProtocolIPSec sharedSecretKeychainItem](self, "sharedSecretKeychainItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("SharedSecret"));

  -[NEVPNProtocolIPSec sharedSecretReference](self, "sharedSecretReference");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("SharedSecretReference"));

  -[NEVPNProtocolIPSec localIdentifier](self, "localIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("LocalIdentifier"));

  -[NEVPNProtocolIPSec remoteIdentifier](self, "remoteIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("RemoteIdentifier"));

  objc_msgSend(v4, "encodeBool:forKey:", -[NEVPNProtocolIPSec useExtendedAuthentication](self, "useExtendedAuthentication"), CFSTR("UseExtendedAuthentication"));
  -[NEVPNProtocolIPSec legacyProposals](self, "legacyProposals");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v9, CFSTR("LegacyProposals"));

  -[NEVPNProtocolIPSec legacyExchangeMode](self, "legacyExchangeMode");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v10, CFSTR("LegacyExchangeMode"));

  objc_msgSend(v4, "encodeBool:forKey:", -[NEVPNProtocolIPSec extendedAuthPasswordPrompt](self, "extendedAuthPasswordPrompt"), CFSTR("ExtendedAuthPasswordPrompt"));
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)NEVPNProtocolIPSec;
  v4 = -[NEVPNProtocol copyWithZone:](&v12, sel_copyWithZone_, a3);
  objc_msgSend(v4, "setAuthenticationMethod:", -[NEVPNProtocolIPSec authenticationMethod](self, "authenticationMethod"));
  -[NEVPNProtocolIPSec sharedSecretKeychainItem](self, "sharedSecretKeychainItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setSharedSecretKeychainItem:", v5);

  -[NEVPNProtocolIPSec sharedSecretReference](self, "sharedSecretReference");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setSharedSecretReference:", v6);

  -[NEVPNProtocolIPSec localIdentifier](self, "localIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setLocalIdentifier:", v7);

  -[NEVPNProtocolIPSec remoteIdentifier](self, "remoteIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setRemoteIdentifier:", v8);

  objc_msgSend(v4, "setUseExtendedAuthentication:", -[NEVPNProtocolIPSec useExtendedAuthentication](self, "useExtendedAuthentication"));
  -[NEVPNProtocolIPSec legacyProposals](self, "legacyProposals");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setLegacyProposals:", v9);

  -[NEVPNProtocolIPSec legacyExchangeMode](self, "legacyExchangeMode");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setLegacyExchangeMode:", v10);

  objc_msgSend(v4, "setExtendedAuthPasswordPrompt:", -[NEVPNProtocolIPSec extendedAuthPasswordPrompt](self, "extendedAuthPasswordPrompt"));
  return v4;
}

- (BOOL)checkValidityAndCollectErrors:(id)a3
{
  id v4;
  BOOL v5;
  void *v6;
  __CFString *v7;
  void *v8;
  uint64_t v10;
  void *v11;
  int64_t v12;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)NEVPNProtocolIPSec;
  v5 = -[NEVPNProtocol checkValidityAndCollectErrors:](&v13, sel_checkValidityAndCollectErrors_, v4);
  if (-[NEVPNProtocolIPSec authenticationMethod](self, "authenticationMethod"))
  {
    if (-[NEVPNProtocolIPSec authenticationMethod](self, "authenticationMethod") == NEVPNIKEAuthenticationMethodCertificate)
    {
      -[NEVPNProtocol identityReferenceInternal](self, "identityReferenceInternal");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (v6)
      {

        goto LABEL_12;
      }
      -[NEVPNProtocol identityDataInternal](self, "identityDataInternal");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (v8
        || -[NEVPNProtocolIPSec useExtendedAuthentication](self, "useExtendedAuthentication")
        && -[NEVPNProtocol type](self, "type") == 5)
      {

        goto LABEL_12;
      }
      -[NEVPNProtocol extensibleSSOProvider](self, "extensibleSSOProvider");
      v10 = objc_claimAutoreleasedReturnValue();
      if (!v10 || (v11 = (void *)v10, v12 = -[NEVPNProtocol type](self, "type"), v11, v12 != 5))
      {
        v7 = CFSTR("Missing identity");
        goto LABEL_9;
      }
    }
  }
  else if (-[NEVPNProtocol type](self, "type") == 1
         || -[NEVPNProtocol type](self, "type") == 5
         && !-[NEVPNProtocolIPSec useExtendedAuthentication](self, "useExtendedAuthentication"))
  {
    v7 = CFSTR("Unsupported authenticationMethod");
LABEL_9:
    +[NEConfiguration addError:toList:]((uint64_t)NEConfiguration, v7, v4);
    v5 = 0;
  }
LABEL_12:

  return v5;
}

- (id)descriptionWithIndent:(int)a3 options:(unint64_t)a4
{
  uint64_t v5;
  id v7;
  void *v8;
  void *v9;
  unint64_t v10;
  const __CFString *v11;
  unint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  unint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  objc_super v21;

  v5 = *(_QWORD *)&a3;
  v7 = objc_alloc(MEMORY[0x1E0CB37A0]);
  v21.receiver = self;
  v21.super_class = (Class)NEVPNProtocolIPSec;
  -[NEVPNProtocol descriptionWithIndent:options:](&v21, sel_descriptionWithIndent_options_, v5, a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v7, "initWithString:", v8);

  if (-[NEVPNProtocolIPSec authenticationMethod](self, "authenticationMethod") == NEVPNIKEAuthenticationMethodNone)
  {
    v10 = a4 | 8;
    v11 = CFSTR("none");
    goto LABEL_7;
  }
  if (-[NEVPNProtocolIPSec authenticationMethod](self, "authenticationMethod") == NEVPNIKEAuthenticationMethodCertificate)
  {
    v10 = a4 | 8;
    v11 = CFSTR("certificate");
LABEL_7:
    objc_msgSend(v9, "appendPrettyObject:withName:andIndent:options:", v11, CFSTR("authenticationMethod"), v5, v10);
    goto LABEL_8;
  }
  v10 = a4 | 8;
  if (-[NEVPNProtocolIPSec authenticationMethod](self, "authenticationMethod") == NEVPNIKEAuthenticationMethodSharedSecret)
  {
    v11 = CFSTR("shared-secret");
    goto LABEL_7;
  }
LABEL_8:
  v12 = a4 & 0xFFFFFFFFFFFFFFF7;
  -[NEVPNProtocolIPSec sharedSecretKeychainItem](self, "sharedSecretKeychainItem");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "appendPrettyObject:withName:andIndent:options:", v13, CFSTR("sharedSecret"), v5, a4 & 0xFFFFFFFFFFFFFFF7);

  -[NEVPNProtocolIPSec sharedSecretReference](self, "sharedSecretReference");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "appendPrettyObject:withName:andIndent:options:", v14, CFSTR("sharedSecretReference"), v5, v10);

  -[NEVPNProtocolIPSec localIdentifier](self, "localIdentifier");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = a4 | 9;
  objc_msgSend(v9, "appendPrettyObject:withName:andIndent:options:", v15, CFSTR("localIdentifier"), v5, v16);

  -[NEVPNProtocolIPSec remoteIdentifier](self, "remoteIdentifier");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "appendPrettyObject:withName:andIndent:options:", v17, CFSTR("remoteIdentifier"), v5, v16);

  objc_msgSend(v9, "appendPrettyBOOL:withName:andIndent:options:", -[NEVPNProtocolIPSec useExtendedAuthentication](self, "useExtendedAuthentication"), CFSTR("useExtendedAuthentication"), v5, v10);
  -[NEVPNProtocolIPSec legacyProposals](self, "legacyProposals");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "appendPrettyObject:withName:andIndent:options:", v18, CFSTR("legacyProposalParameters"), v5, v12);

  -[NEVPNProtocolIPSec legacyExchangeMode](self, "legacyExchangeMode");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "appendPrettyObject:withName:andIndent:options:", v19, CFSTR("legacyExchangeMode"), v5, v12);

  objc_msgSend(v9, "appendPrettyBOOL:withName:andIndent:options:", -[NEVPNProtocolIPSec extendedAuthPasswordPrompt](self, "extendedAuthPasswordPrompt"), CFSTR("extendedAuthPasswordPrompt"), v5, v12);
  return v9;
}

- (id)copyLegacyDictionary
{
  id v3;
  void *v4;
  void *v5;
  _QWORD *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  int v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t i;
  void *v54;
  void *v56;
  void *v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  _BYTE v62[128];
  uint64_t v63;

  v63 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  -[NEVPNProtocol serverAddress](self, "serverAddress");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[NEVPNProtocol serverAddress](self, "serverAddress");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, *MEMORY[0x1E0CE8C78]);

  }
  if (-[NEVPNProtocolIPSec authenticationMethod](self, "authenticationMethod") == NEVPNIKEAuthenticationMethodCertificate)
  {
    v6 = (_QWORD *)MEMORY[0x1E0CE90B8];
  }
  else
  {
    if (-[NEVPNProtocolIPSec authenticationMethod](self, "authenticationMethod") != NEVPNIKEAuthenticationMethodSharedSecret)
      goto LABEL_8;
    v6 = (_QWORD *)MEMORY[0x1E0CE90C0];
  }
  objc_msgSend(v3, "setObject:forKeyedSubscript:", *v6, *MEMORY[0x1E0CE8C58]);
LABEL_8:
  -[NEVPNProtocol username](self, "username");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[NEVPNProtocol username](self, "username");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, *MEMORY[0x1E0CE8C98]);

  }
  -[NEVPNProtocol passwordKeychainItem](self, "passwordKeychainItem");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    -[NEVPNProtocol passwordKeychainItem](self, "passwordKeychainItem");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "password");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    -[NEVPNProtocol passwordKeychainItem](self, "passwordKeychainItem");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v12;
    if (v11)
    {
      objc_msgSend(v12, "password");
      v14 = objc_claimAutoreleasedReturnValue();

      v13 = (void *)v14;
      if (!v14)
        goto LABEL_19;
      goto LABEL_13;
    }
    objc_msgSend(v12, "identifier");
    v15 = objc_claimAutoreleasedReturnValue();
    if (!v15)
      goto LABEL_18;
    v16 = (void *)v15;
    -[NEVPNProtocol passwordKeychainItem](self, "passwordKeychainItem");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "persistentReference");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (v18)
    {
      -[NEVPNProtocol passwordKeychainItem](self, "passwordKeychainItem");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "identifier");
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v3, "setObject:forKeyedSubscript:", *MEMORY[0x1E0CE90D8], *MEMORY[0x1E0CE8CA8]);
      if (v13)
      {
LABEL_13:
        objc_msgSend(v3, "setObject:forKeyedSubscript:", v13, *MEMORY[0x1E0CE8CA0]);
LABEL_18:

      }
    }
  }
LABEL_19:
  -[NEVPNProtocol passwordReference](self, "passwordReference");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (v20)
  {
    -[NEVPNProtocol passwordReference](self, "passwordReference");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v21, CFSTR("PasswordReference"));

  }
  -[NEVPNProtocolIPSec sharedSecretReference](self, "sharedSecretReference");
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  if (v22)
  {
    -[NEVPNProtocolIPSec sharedSecretReference](self, "sharedSecretReference");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v23, CFSTR("SharedSecretReference"));

  }
  -[NEVPNProtocol identityReferenceInternal](self, "identityReferenceInternal");
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  if (v24)
  {
    -[NEVPNProtocol identityReferenceInternal](self, "identityReferenceInternal");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v25, *MEMORY[0x1E0CE8C60]);

  }
  -[NEVPNProtocolIPSec sharedSecretKeychainItem](self, "sharedSecretKeychainItem");
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  if (v26)
  {
    -[NEVPNProtocolIPSec sharedSecretKeychainItem](self, "sharedSecretKeychainItem");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "password");
    v28 = (void *)objc_claimAutoreleasedReturnValue();

    -[NEVPNProtocolIPSec sharedSecretKeychainItem](self, "sharedSecretKeychainItem");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = v29;
    if (v28)
    {
      objc_msgSend(v29, "password");
      v31 = objc_claimAutoreleasedReturnValue();

      v30 = (void *)v31;
      if (!v31)
        goto LABEL_34;
      goto LABEL_28;
    }
    objc_msgSend(v29, "identifier");
    v32 = objc_claimAutoreleasedReturnValue();
    if (!v32)
      goto LABEL_33;
    v33 = (void *)v32;
    -[NEVPNProtocolIPSec sharedSecretKeychainItem](self, "sharedSecretKeychainItem");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "persistentReference");
    v35 = (void *)objc_claimAutoreleasedReturnValue();

    if (v35)
    {
      -[NEVPNProtocolIPSec sharedSecretKeychainItem](self, "sharedSecretKeychainItem");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "identifier");
      v30 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v3, "setObject:forKeyedSubscript:", *MEMORY[0x1E0CE90D0], *MEMORY[0x1E0CE8C88]);
      if (v30)
      {
LABEL_28:
        objc_msgSend(v3, "setObject:forKeyedSubscript:", v30, *MEMORY[0x1E0CE8C80]);
LABEL_33:

      }
    }
  }
LABEL_34:
  -[NEVPNProtocol identityDataPassword](self, "identityDataPassword");
  v37 = (void *)objc_claimAutoreleasedReturnValue();

  if (v37)
  {
    -[NEVPNProtocol identityDataPassword](self, "identityDataPassword");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_36:
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v38, CFSTR("IdentityDataPasswordKeyStr"));
LABEL_37:

    goto LABEL_38;
  }
  -[NEVPNProtocol identityDataPasswordKeychainItem](self, "identityDataPasswordKeychainItem");
  v56 = (void *)objc_claimAutoreleasedReturnValue();

  if (v56)
  {
    -[NEVPNProtocol identityDataPasswordKeychainItem](self, "identityDataPasswordKeychainItem");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v57, "password");
    v38 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v38)
      goto LABEL_37;
    goto LABEL_36;
  }
LABEL_38:
  -[NEVPNProtocolIPSec localIdentifier](self, "localIdentifier");
  v39 = (void *)objc_claimAutoreleasedReturnValue();

  if (v39)
  {
    -[NEVPNProtocolIPSec localIdentifier](self, "localIdentifier");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v40, *MEMORY[0x1E0CE8C68]);

    objc_msgSend(v3, "setObject:forKeyedSubscript:", *MEMORY[0x1E0CE90C8], *MEMORY[0x1E0CE8C70]);
  }
  -[NEVPNProtocolIPSec remoteIdentifier](self, "remoteIdentifier");
  v41 = (void *)objc_claimAutoreleasedReturnValue();

  if (v41)
  {
    -[NEVPNProtocolIPSec remoteIdentifier](self, "remoteIdentifier");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v42, CFSTR("RemoteIdentifier"));

  }
  if (-[NEVPNProtocolIPSec useExtendedAuthentication](self, "useExtendedAuthentication"))
    v43 = &unk_1E3D03850;
  else
    v43 = &unk_1E3D03868;
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v43, *MEMORY[0x1E0CE8C90]);
  -[NEVPNProtocolIPSec legacyExchangeMode](self, "legacyExchangeMode");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v45 = isa_nsarray(v44);

  if (v45)
  {
    -[NEVPNProtocolIPSec legacyExchangeMode](self, "legacyExchangeMode");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v46, CFSTR("ExchangeMode"));

  }
  -[NEVPNProtocolIPSec legacyProposals](self, "legacyProposals");
  v47 = (void *)objc_claimAutoreleasedReturnValue();

  if (v47)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    v58 = 0u;
    v59 = 0u;
    v60 = 0u;
    v61 = 0u;
    -[NEVPNProtocolIPSec legacyProposals](self, "legacyProposals", 0);
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    v50 = objc_msgSend(v49, "countByEnumeratingWithState:objects:count:", &v58, v62, 16);
    if (v50)
    {
      v51 = v50;
      v52 = *(_QWORD *)v59;
      do
      {
        for (i = 0; i != v51; ++i)
        {
          if (*(_QWORD *)v59 != v52)
            objc_enumerationMutation(v49);
          v54 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v58 + 1) + 8 * i), "copyLegacyDictionary");
          if (v54)
            objc_msgSend(v48, "addObject:", v54);

        }
        v51 = objc_msgSend(v49, "countByEnumeratingWithState:objects:count:", &v58, v62, 16);
      }
      while (v51);
    }

    objc_msgSend(v3, "setObject:forKeyedSubscript:", v48, CFSTR("Proposals"));
  }
  if (-[NEVPNProtocolIPSec extendedAuthPasswordPrompt](self, "extendedAuthPasswordPrompt"))
    objc_msgSend(v3, "setObject:forKeyedSubscript:", *MEMORY[0x1E0CE90E0], *MEMORY[0x1E0CE8CA8]);
  -[NEVPNProtocol addDisconnectOptions:](self, "addDisconnectOptions:", v3);
  return v3;
}

- (id)initFromLegacyDictionary:(id)a3
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  NEVPNProtocolIPSec *v8;
  uint64_t v9;
  void *v10;
  int v11;
  void *v12;
  uint64_t v13;
  void *v14;
  int v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  int v20;
  NEKeychainItem *v21;
  void *v22;
  int64_t keychainDomain;
  SEL v24;
  id v25;
  NEKeychainItem *v26;
  void *v27;
  NEKeychainItem *v28;
  void *v29;
  int64_t v30;
  SEL v31;
  id v32;
  NEKeychainItem *v33;
  void *v34;
  int v35;
  void *v36;
  uint64_t v37;
  void *v38;
  int v39;
  void *v40;
  uint64_t v41;
  void *v42;
  int v43;
  void *v44;
  uint64_t v45;
  void *v46;
  int v47;
  NEKeychainItem *v48;
  void *v49;
  int64_t v50;
  SEL v51;
  id v52;
  uint64_t v53;
  NEKeychainItem *sharedSecretKeychainItem;
  uint64_t v55;
  void *v56;
  int v57;
  void *v58;
  uint64_t v59;
  NSString *localIdentifier;
  uint64_t v61;
  void *v62;
  int v63;
  void *v64;
  uint64_t v65;
  void *v66;
  int v67;
  void *v68;
  void *v69;
  int v70;
  void *v71;
  void *v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t i;
  id v77;
  NEVPNProtocolIPSec *v78;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  _BYTE v84[128];
  uint64_t v85;

  v85 = *MEMORY[0x1E0C80C00];
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
      goto LABEL_53;
  }
  else
  {
    v8 = -[NEVPNProtocolIPSec init](self, "init");
    if (!v8)
      goto LABEL_53;
  }
  v9 = *MEMORY[0x1E0CE8C78];
  objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0CE8C78]);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = isa_nsstring(v10);

  if (v11)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", v9);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[NEVPNProtocol setServerAddress:](v8, "setServerAddress:", v12);

  }
  v13 = *MEMORY[0x1E0CE8C98];
  objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0CE8C98]);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = isa_nsstring(v14);

  if (v15)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", v13);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[NEVPNProtocol setUsername:](v8, "setUsername:", v16);

    -[NEVPNProtocolIPSec setUseExtendedAuthentication:](v8, "setUseExtendedAuthentication:", 1);
  }
  objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0CE8CA8]);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (isa_nsstring(v17) && objc_msgSend(v17, "isEqualToString:", *MEMORY[0x1E0CE90E0]))
    -[NEVPNProtocolIPSec setExtendedAuthPasswordPrompt:](v8, "setExtendedAuthPasswordPrompt:", 1);
  v18 = *MEMORY[0x1E0CE8CA0];
  objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0CE8CA0]);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = isa_nsstring(v19);

  if (v20)
  {
    if (isa_nsstring(v17) && objc_msgSend(v17, "isEqualToString:", *MEMORY[0x1E0CE90D8]))
    {
      v21 = [NEKeychainItem alloc];
      objc_msgSend(v4, "objectForKeyedSubscript:", v18);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      keychainDomain = v8->super._keychainDomain;
      v25 = objc_getProperty(v8, v24, 88, 1);
      v26 = -[NEKeychainItem initWithLegacyIdentifier:domain:accessGroup:](v21, "initWithLegacyIdentifier:domain:accessGroup:", v22, keychainDomain, v25);
      -[NEVPNProtocol setPasswordKeychainItem:](v8, "setPasswordKeychainItem:", v26);

    }
    -[NEVPNProtocol passwordKeychainItem](v8, "passwordKeychainItem");
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v27)
    {
      v28 = [NEKeychainItem alloc];
      objc_msgSend(v4, "objectForKeyedSubscript:", v18);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = v8->super._keychainDomain;
      v32 = objc_getProperty(v8, v31, 88, 1);
      v33 = -[NEKeychainItem initWithPassword:domain:accessGroup:](v28, "initWithPassword:domain:accessGroup:", v29, v30, v32);
      -[NEVPNProtocol setPasswordKeychainItem:](v8, "setPasswordKeychainItem:", v33);

    }
    -[NEVPNProtocolIPSec setUseExtendedAuthentication:](v8, "setUseExtendedAuthentication:", 1);
  }
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("PasswordReference"));
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = isa_nsdata(v34);

  if (v35)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("PasswordReference"));
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    -[NEVPNProtocol setPasswordReference:](v8, "setPasswordReference:", v36);

  }
  v37 = *MEMORY[0x1E0CE8C90];
  objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0CE8C90]);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = isa_nsnumber(v38);

  if (v39)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", v37);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    -[NEVPNProtocolIPSec setUseExtendedAuthentication:](v8, "setUseExtendedAuthentication:", objc_msgSend(v40, "BOOLValue"));

  }
  v41 = *MEMORY[0x1E0CE8C60];
  objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0CE8C60]);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v43 = isa_nsdata(v42);

  if (v43)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", v41);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    -[NEVPNProtocol setIdentityReferenceInternal:](v8, "setIdentityReferenceInternal:", v44);

  }
  v45 = *MEMORY[0x1E0CE8C80];
  objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0CE8C80]);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v47 = isa_nsstring(v46);

  if (v47)
  {
    v48 = [NEKeychainItem alloc];
    objc_msgSend(v4, "objectForKeyedSubscript:", v45);
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    v50 = v8->super._keychainDomain;
    v52 = objc_getProperty(v8, v51, 88, 1);
    v53 = -[NEKeychainItem initWithLegacyIdentifier:domain:accessGroup:](v48, "initWithLegacyIdentifier:domain:accessGroup:", v49, v50, v52);
    sharedSecretKeychainItem = v8->_sharedSecretKeychainItem;
    v8->_sharedSecretKeychainItem = (NEKeychainItem *)v53;

  }
  v55 = *MEMORY[0x1E0CE8C68];
  objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0CE8C68]);
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  v57 = isa_nsstring(v56);

  if (v57)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", v55);
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    v59 = objc_msgSend(v58, "copy");
    localIdentifier = v8->_localIdentifier;
    v8->_localIdentifier = (NSString *)v59;

  }
  v61 = *MEMORY[0x1E0CE8C58];
  objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0CE8C58]);
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  v63 = isa_nsstring(v62);

  if (v63)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", v61);
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v64, "isEqualToString:", *MEMORY[0x1E0CE90C0]) & 1) != 0)
    {
      v65 = 2;
    }
    else
    {
      if (!objc_msgSend(v64, "isEqualToString:", *MEMORY[0x1E0CE90B8]))
      {
LABEL_36:

        goto LABEL_37;
      }
      v65 = 1;
    }
    v8->_authenticationMethod = v65;
    goto LABEL_36;
  }
  v8->_authenticationMethod = 0;
LABEL_37:
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("ExchangeMode"));
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  v67 = isa_nsarray(v66);

  if (v67)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("ExchangeMode"));
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    -[NEVPNProtocolIPSec setLegacyExchangeMode:](v8, "setLegacyExchangeMode:", v68);

  }
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("Proposals"));
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  v70 = isa_nsarray(v69);

  if (v70)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("Proposals"));
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    v80 = 0u;
    v81 = 0u;
    v82 = 0u;
    v83 = 0u;
    v73 = objc_msgSend(v72, "countByEnumeratingWithState:objects:count:", &v80, v84, 16);
    if (v73)
    {
      v74 = v73;
      v75 = *(_QWORD *)v81;
      do
      {
        for (i = 0; i != v74; ++i)
        {
          if (*(_QWORD *)v81 != v75)
            objc_enumerationMutation(v72);
          v77 = -[NEVPNIKEv1ProposalParameters initFromLegacyDictionary:]([NEVPNIKEv1ProposalParameters alloc], "initFromLegacyDictionary:", *(_QWORD *)(*((_QWORD *)&v80 + 1) + 8 * i));
          if (v77)
            objc_msgSend(v71, "addObject:", v77);

        }
        v74 = objc_msgSend(v72, "countByEnumeratingWithState:objects:count:", &v80, v84, 16);
      }
      while (v74);
    }
    if (objc_msgSend(v71, "count"))
      -[NEVPNProtocolIPSec setLegacyProposals:](v8, "setLegacyProposals:", v71);

  }
  -[NEVPNProtocol initDisconnectOptions:](v8, "initDisconnectOptions:", v4);
  v78 = v8;

LABEL_53:
  return v8;
}

- (__SCNetworkInterface)createInterface
{
  return SCNetworkInterfaceCreateWithInterface((SCNetworkInterfaceRef)*MEMORY[0x1E0CE8BB8], (CFStringRef)*MEMORY[0x1E0CE8BC8]);
}

- (void)syncWithKeychainInDomain:(int64_t)a3 configuration:(id)a4 suffix:(id)a5
{
  id v8;
  id v9;
  void *v10;
  __CFString *v11;
  __CFString *v12;
  __CFString *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  const char *v21;
  NEKeychainItem *v22;
  int64_t keychainDomain;
  id Property;
  id v25;
  NEKeychainItem *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  const char *v38;
  NEKeychainItem *v39;
  int64_t v40;
  id v41;
  id v42;
  NEKeychainItem *v43;
  uint64_t v44;
  void *v45;
  void *v46;
  uint64_t v47;
  void *v48;
  void *v49;
  uint64_t v50;
  void *v51;
  void *v52;
  uint64_t v53;
  void *v54;
  void *v55;
  __CFString *v56;
  __CFString *v57;
  objc_super v58;

  v8 = a4;
  v9 = a5;
  v10 = v9;
  if (v9)
  {
    objc_msgSend(v9, "stringByAppendingString:", CFSTR(".XAUTH"));
    v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "stringByAppendingString:", CFSTR(".SS"));
    v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "stringByAppendingString:", CFSTR(".IDDATA"));
    v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v12 = CFSTR("SS");
    v11 = CFSTR("XAUTH");
    v13 = CFSTR("IDDATA");
  }
  v58.receiver = self;
  v58.super_class = (Class)NEVPNProtocolIPSec;
  -[NEVPNProtocol syncWithKeychainInDomainCommon:](&v58, sel_syncWithKeychainInDomainCommon_, a3);
  -[NEVPNProtocol username](self, "username");
  v14 = objc_claimAutoreleasedReturnValue();
  if (v14)
  {
    v15 = (void *)v14;
    -[NEVPNProtocol passwordKeychainItem](self, "passwordKeychainItem");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v16)
    {
      v56 = v13;
      v17 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(v8, "identifier");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "UUIDString");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "stringWithFormat:", CFSTR("%@.%@"), v19, v11);
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      v22 = [NEKeychainItem alloc];
      if (self)
      {
        keychainDomain = self->super._keychainDomain;
        Property = objc_getProperty(self, v21, 88, 1);
      }
      else
      {
        keychainDomain = 0;
        Property = 0;
      }
      v25 = Property;
      v26 = -[NEKeychainItem initWithIdentifier:domain:accessGroup:](v22, "initWithIdentifier:domain:accessGroup:", v20, keychainDomain, v25);
      -[NEVPNProtocol setPasswordKeychainItem:](self, "setPasswordKeychainItem:", v26);

      v13 = v56;
    }
  }
  -[NEVPNProtocol passwordKeychainItem](self, "passwordKeychainItem");
  v27 = objc_claimAutoreleasedReturnValue();
  if (v27)
  {
    v28 = (void *)v27;
    -[NEVPNProtocol passwordKeychainItem](self, "passwordKeychainItem");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = objc_msgSend(v29, "domain");

    if (v30 == a3)
    {
      -[NEVPNProtocol passwordKeychainItem](self, "passwordKeychainItem");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      -[NEVPNProtocol username](self, "username");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "syncUsingConfiguration:accountName:passwordType:identifierSuffix:", v8, v32, 1, v11);

    }
  }
  if (-[NEVPNProtocolIPSec authenticationMethod](self, "authenticationMethod") == NEVPNIKEAuthenticationMethodSharedSecret)
  {
    -[NEVPNProtocolIPSec sharedSecretKeychainItem](self, "sharedSecretKeychainItem");
    v33 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v33)
    {
      v57 = v13;
      v34 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(v8, "identifier");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "UUIDString");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "stringWithFormat:", CFSTR("%@.%@"), v36, v12);
      v37 = (void *)objc_claimAutoreleasedReturnValue();

      v39 = [NEKeychainItem alloc];
      if (self)
      {
        v40 = self->super._keychainDomain;
        v41 = objc_getProperty(self, v38, 88, 1);
      }
      else
      {
        v40 = 0;
        v41 = 0;
      }
      v42 = v41;
      v43 = -[NEKeychainItem initWithIdentifier:domain:accessGroup:](v39, "initWithIdentifier:domain:accessGroup:", v37, v40, v42);
      -[NEVPNProtocolIPSec setSharedSecretKeychainItem:](self, "setSharedSecretKeychainItem:", v43);

      v13 = v57;
    }
  }
  -[NEVPNProtocolIPSec sharedSecretKeychainItem](self, "sharedSecretKeychainItem");
  v44 = objc_claimAutoreleasedReturnValue();
  if (v44)
  {
    v45 = (void *)v44;
    -[NEVPNProtocolIPSec sharedSecretKeychainItem](self, "sharedSecretKeychainItem");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v47 = objc_msgSend(v46, "domain");

    if (v47 == a3)
    {
      -[NEVPNProtocolIPSec sharedSecretKeychainItem](self, "sharedSecretKeychainItem");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      -[NEVPNProtocolIPSec localIdentifier](self, "localIdentifier");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v48, "syncUsingConfiguration:accountName:passwordType:identifierSuffix:", v8, v49, 2, v12);

    }
  }
  -[NEVPNProtocol identityDataPasswordKeychainItem](self, "identityDataPasswordKeychainItem");
  v50 = objc_claimAutoreleasedReturnValue();
  if (v50)
  {
    v51 = (void *)v50;
    -[NEVPNProtocol identityDataPasswordKeychainItem](self, "identityDataPasswordKeychainItem");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    v53 = objc_msgSend(v52, "domain");

    if (v53 == a3)
    {
      -[NEVPNProtocol identityDataPasswordKeychainItem](self, "identityDataPasswordKeychainItem");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      -[NEVPNProtocolIPSec localIdentifier](self, "localIdentifier");
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v54, "syncUsingConfiguration:accountName:passwordType:identifierSuffix:", v8, v55, 3, v13);

    }
  }

}

- (BOOL)needToUpdateKeychain
{
  BOOL v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)NEVPNProtocolIPSec;
  if (-[NEVPNProtocol needToUpdateKeychain](&v8, sel_needToUpdateKeychain))
    return 1;
  -[NEVPNProtocolIPSec sharedSecretKeychainItem](self, "sharedSecretKeychainItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[NEVPNProtocolIPSec sharedSecretKeychainItem](self, "sharedSecretKeychainItem");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "password");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v6, "length") != 0;

  }
  else
  {
    v3 = 0;
  }

  return v3;
}

- (void)removeKeychainItemsInDomain:(int64_t)a3 keepIdentity:(BOOL)a4
{
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)NEVPNProtocolIPSec;
  -[NEVPNProtocol removeKeychainItemsInDomain:keepIdentity:](&v11, sel_removeKeychainItemsInDomain_keepIdentity_, a3, a4);
  -[NEVPNProtocolIPSec sharedSecretKeychainItem](self, "sharedSecretKeychainItem");
  v6 = objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v7 = (void *)v6;
    -[NEVPNProtocolIPSec sharedSecretKeychainItem](self, "sharedSecretKeychainItem");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "domain");

    if (v9 == a3)
    {
      -[NEVPNProtocolIPSec sharedSecretKeychainItem](self, "sharedSecretKeychainItem");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setIdentifier:", 0);

    }
  }
}

- (void)migratePasswordsFromPreferences:(__SCPreferences *)a3
{
  void *v5;
  id v6;

  -[NEVPNProtocol passwordKeychainItem](self, "passwordKeychainItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "migrateFromPreferences:", a3);

  -[NEVPNProtocolIPSec sharedSecretKeychainItem](self, "sharedSecretKeychainItem");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "migrateFromPreferences:", a3);

}

- (NEVPNIKEAuthenticationMethod)authenticationMethod
{
  return self->_authenticationMethod;
}

- (void)setAuthenticationMethod:(NEVPNIKEAuthenticationMethod)authenticationMethod
{
  self->_authenticationMethod = authenticationMethod;
}

- (BOOL)useExtendedAuthentication
{
  return self->_useExtendedAuthentication;
}

- (void)setUseExtendedAuthentication:(BOOL)useExtendedAuthentication
{
  self->_useExtendedAuthentication = useExtendedAuthentication;
}

- (NSData)sharedSecretReference
{
  return (NSData *)objc_getProperty(self, a2, 176, 1);
}

- (void)setSharedSecretReference:(NSData *)sharedSecretReference
{
  objc_setProperty_atomic_copy(self, a2, sharedSecretReference, 176);
}

- (NSString)localIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 200, 1);
}

- (void)setLocalIdentifier:(NSString *)localIdentifier
{
  objc_setProperty_atomic_copy(self, a2, localIdentifier, 200);
}

- (NSString)remoteIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 208, 1);
}

- (void)setRemoteIdentifier:(NSString *)remoteIdentifier
{
  objc_setProperty_atomic_copy(self, a2, remoteIdentifier, 208);
}

- (NEKeychainItem)sharedSecretKeychainItem
{
  return (NEKeychainItem *)objc_getProperty(self, a2, 216, 1);
}

- (void)setSharedSecretKeychainItem:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 216);
}

- (NSArray)legacyProposals
{
  return (NSArray *)objc_getProperty(self, a2, 224, 1);
}

- (void)setLegacyProposals:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 224);
}

- (NSArray)legacyExchangeMode
{
  return (NSArray *)objc_getProperty(self, a2, 232, 1);
}

- (void)setLegacyExchangeMode:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 232);
}

- (BOOL)extendedAuthPasswordPrompt
{
  return self->_extendedAuthPasswordPrompt;
}

- (void)setExtendedAuthPasswordPrompt:(BOOL)a3
{
  self->_extendedAuthPasswordPrompt = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_legacyExchangeMode, 0);
  objc_storeStrong((id *)&self->_legacyProposals, 0);
  objc_storeStrong((id *)&self->_sharedSecretKeychainItem, 0);
  objc_storeStrong((id *)&self->_remoteIdentifier, 0);
  objc_storeStrong((id *)&self->_localIdentifier, 0);
  objc_storeStrong((id *)&self->_sharedSecretReference, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
