@implementation ASCPlatformPublicKeyCredentialLoginChoice

- (id)_initAsRegistrationChoice:(BOOL)a3 withName:(id)a4 displayName:(id)a5 customTitle:(id)a6 identifier:(id)a7 userHandle:(id)a8 relyingPartyIdentifier:(id)a9 publicKeyCredentialOperationUUID:(id)a10 externalCredentialProviderName:(id)a11 externalCredentialProviderBundleID:(id)a12 supportedAlgorithms:(id)a13 excludedCredentials:(id)a14 groupID:(id)a15
{
  id v19;
  id v20;
  id v21;
  id v22;
  void *v23;
  id v24;
  void *v25;
  id v26;
  id v27;
  id v28;
  id v29;
  ASCPlatformPublicKeyCredentialLoginChoice *v30;
  ASCPlatformPublicKeyCredentialLoginChoice *v31;
  uint64_t v32;
  NSString *name;
  uint64_t v34;
  NSString *displayName;
  uint64_t v36;
  WBSPublicKeyCredentialIdentifier *identifier;
  uint64_t v38;
  NSString *userHandle;
  uint64_t v40;
  NSString *relyingPartyIdentifier;
  uint64_t v42;
  NSString *customTitle;
  uint64_t v44;
  NSString *externalCredentialProviderName;
  uint64_t v46;
  NSString *externalCredentialProviderBundleID;
  uint64_t v48;
  NSArray *supportedAlgorithms;
  uint64_t v50;
  NSArray *excludedCredentials;
  uint64_t v52;
  NSString *groupID;
  ASCPlatformPublicKeyCredentialLoginChoice *v54;
  id v58;
  id v59;
  id v60;
  objc_super v61;

  v60 = a4;
  v59 = a5;
  v19 = a6;
  v20 = a7;
  v21 = a8;
  v22 = a9;
  v58 = a10;
  v23 = v19;
  v24 = a11;
  v25 = v20;
  v26 = a12;
  v27 = a13;
  v28 = a14;
  v29 = a15;
  v61.receiver = self;
  v61.super_class = (Class)ASCPlatformPublicKeyCredentialLoginChoice;
  v30 = -[ASCPlatformPublicKeyCredentialLoginChoice init](&v61, sel_init);
  v31 = v30;
  if (v30)
  {
    v30->_isRegistrationRequest = a3;
    v32 = objc_msgSend(v60, "copy");
    name = v31->_name;
    v31->_name = (NSString *)v32;

    v34 = objc_msgSend(v59, "copy");
    displayName = v31->_displayName;
    v31->_displayName = (NSString *)v34;

    v36 = objc_msgSend(v25, "copy");
    identifier = v31->_identifier;
    v31->_identifier = (WBSPublicKeyCredentialIdentifier *)v36;

    v38 = objc_msgSend(v21, "copy");
    userHandle = v31->_userHandle;
    v31->_userHandle = (NSString *)v38;

    v40 = objc_msgSend(v22, "copy");
    relyingPartyIdentifier = v31->_relyingPartyIdentifier;
    v31->_relyingPartyIdentifier = (NSString *)v40;

    objc_storeStrong((id *)&v31->_publicKeyCredentialOperationUUID, a10);
    if (objc_msgSend(v23, "length"))
    {
      v42 = objc_msgSend(v23, "copy");
      customTitle = v31->_customTitle;
      v31->_customTitle = (NSString *)v42;
    }
    else
    {
      customTitle = v31->_customTitle;
      v31->_customTitle = 0;
    }

    v44 = objc_msgSend(v24, "copy");
    externalCredentialProviderName = v31->_externalCredentialProviderName;
    v31->_externalCredentialProviderName = (NSString *)v44;

    v46 = objc_msgSend(v26, "copy");
    externalCredentialProviderBundleID = v31->_externalCredentialProviderBundleID;
    v31->_externalCredentialProviderBundleID = (NSString *)v46;

    v48 = objc_msgSend(v27, "copy");
    supportedAlgorithms = v31->_supportedAlgorithms;
    v31->_supportedAlgorithms = (NSArray *)v48;

    v50 = objc_msgSend(v28, "copy");
    excludedCredentials = v31->_excludedCredentials;
    v31->_excludedCredentials = (NSArray *)v50;

    v52 = objc_msgSend(v29, "copy");
    groupID = v31->_groupID;
    v31->_groupID = (NSString *)v52;

    v54 = v31;
  }

  return v31;
}

- (ASCPlatformPublicKeyCredentialLoginChoice)initWithCredentialIdentity:(id)a3 publicKeyCredentialOperationUUID:(id)a4 clientDataHash:(id)a5 userVerificationPreference:(id)a6 supportedAlgorithms:(id)a7
{
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  ASCPlatformPublicKeyCredentialLoginChoice *v22;
  uint64_t v23;
  SFPasskeyCredentialIdentity *credentialIdentity;
  void *v25;
  void *v26;
  uint64_t v27;
  NSString *externalCredentialProviderName;
  void *v29;
  void *v30;
  uint64_t v31;
  NSString *externalCredentialProviderBundleID;
  uint64_t v33;
  NSData *clientDataHash;
  uint64_t v35;
  NSString *userVerificationPreference;
  uint64_t v37;
  NSArray *supportedAlgorithms;
  ASCPlatformPublicKeyCredentialLoginChoice *v39;
  id v41;
  id v42;

  v12 = a3;
  v42 = a5;
  v41 = a6;
  v13 = a7;
  v14 = a4;
  objc_msgSend(v12, "user");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "user");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_alloc(MEMORY[0x24BE82D78]);
  objc_msgSend(v12, "credentialID");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = (void *)objc_msgSend(v17, "initWithCredentialID:groupID:", v18, &stru_24C985630);
  objc_msgSend(v12, "userHandle");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "serviceIdentifier");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = -[ASCPlatformPublicKeyCredentialLoginChoice initWithName:displayName:customTitle:identifier:userHandle:relyingPartyIdentifier:publicKeyCredentialOperationUUID:groupID:](self, "initWithName:displayName:customTitle:identifier:userHandle:relyingPartyIdentifier:publicKeyCredentialOperationUUID:groupID:", v15, v16, 0, v19, v20, v21, v14, 0);

  if (v22)
  {
    v23 = objc_msgSend(v12, "copy");
    credentialIdentity = v22->_credentialIdentity;
    v22->_credentialIdentity = (SFPasskeyCredentialIdentity *)v23;

    objc_msgSend(v12, "owningExtensionState");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "localizedDisplayName");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = objc_msgSend(v26, "copy");
    externalCredentialProviderName = v22->_externalCredentialProviderName;
    v22->_externalCredentialProviderName = (NSString *)v27;

    objc_msgSend(v12, "owningExtensionState");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "providerBundleID");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = objc_msgSend(v30, "copy");
    externalCredentialProviderBundleID = v22->_externalCredentialProviderBundleID;
    v22->_externalCredentialProviderBundleID = (NSString *)v31;

    v33 = objc_msgSend(v42, "copy");
    clientDataHash = v22->_clientDataHash;
    v22->_clientDataHash = (NSData *)v33;

    v35 = objc_msgSend(v41, "copy");
    userVerificationPreference = v22->_userVerificationPreference;
    v22->_userVerificationPreference = (NSString *)v35;

    v37 = objc_msgSend(v13, "copy");
    supportedAlgorithms = v22->_supportedAlgorithms;
    v22->_supportedAlgorithms = (NSArray *)v37;

    v39 = v22;
  }

  return v22;
}

- (id)initRegistrationChoiceWithOptions:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v4 = a3;
  objc_msgSend(v4, "userName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "userDisplayName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "userIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "base64EncodedStringWithOptions:", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "relyingPartyIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "supportedAlgorithmIdentifiers");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "excludedCredentials");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = -[ASCPlatformPublicKeyCredentialLoginChoice _initAsRegistrationChoice:withName:displayName:customTitle:identifier:userHandle:relyingPartyIdentifier:publicKeyCredentialOperationUUID:externalCredentialProviderName:externalCredentialProviderBundleID:supportedAlgorithms:excludedCredentials:groupID:](self, "_initAsRegistrationChoice:withName:displayName:customTitle:identifier:userHandle:relyingPartyIdentifier:publicKeyCredentialOperationUUID:externalCredentialProviderName:externalCredentialProviderBundleID:supportedAlgorithms:excludedCredentials:groupID:", 1, v5, v6, 0, 0, v8, v9, 0, 0, 0, v10, v11, 0);
  return v12;
}

- (id)initRegistrationChoiceWithOptions:(id)a3 externalCredentialProviderName:(id)a4 externalCredentialProviderBundleID:(id)a5
{
  id v8;
  id v9;
  id v10;
  _QWORD *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  _QWORD *v28;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = -[ASCPlatformPublicKeyCredentialLoginChoice initRegistrationChoiceWithOptions:](self, "initRegistrationChoiceWithOptions:", v8);
  if (v11)
  {
    v12 = objc_msgSend(v9, "copy");
    v13 = (void *)v11[10];
    v11[10] = v12;

    v14 = objc_msgSend(v10, "copy");
    v15 = (void *)v11[11];
    v11[11] = v14;

    objc_msgSend(v8, "clientDataHash");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "copy");
    v18 = (void *)v11[12];
    v11[12] = v17;

    objc_msgSend(v8, "userVerificationPreference");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "copy");
    v21 = (void *)v11[13];
    v11[13] = v20;

    objc_msgSend(v8, "supportedAlgorithmIdentifiers");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v22, "copy");
    v24 = (void *)v11[14];
    v11[14] = v23;

    objc_msgSend(v8, "excludedCredentials");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v25, "copy");
    v27 = (void *)v11[15];
    v11[15] = v26;

    v28 = v11;
  }

  return v11;
}

- (ASCPlatformPublicKeyCredentialLoginChoice)initWithName:(id)a3 displayName:(id)a4 customTitle:(id)a5 identifier:(id)a6 userHandle:(id)a7 relyingPartyIdentifier:(id)a8 publicKeyCredentialOperationUUID:(id)a9 groupID:(id)a10
{
  return (ASCPlatformPublicKeyCredentialLoginChoice *)-[ASCPlatformPublicKeyCredentialLoginChoice _initAsRegistrationChoice:withName:displayName:customTitle:identifier:userHandle:relyingPartyIdentifier:publicKeyCredentialOperationUUID:externalCredentialProviderName:externalCredentialProviderBundleID:supportedAlgorithms:excludedCredentials:groupID:](self, "_initAsRegistrationChoice:withName:displayName:customTitle:identifier:userHandle:relyingPartyIdentifier:publicKeyCredentialOperationUUID:externalCredentialProviderName:externalCredentialProviderBundleID:supportedAlgorithms:excludedCredentials:groupID:", 0, a3, a4, a5, a6, a7, a8, a9, 0, 0, MEMORY[0x24BDBD1A8], 0, a10);
}

- (NSString)userVisibleName
{
  return self->_name;
}

- (unint64_t)loginChoiceKind
{
  return 2;
}

- (BOOL)isSharedCredential
{
  void *v2;
  BOOL v3;

  -[ASCPlatformPublicKeyCredentialLoginChoice groupID](self, "groupID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "length") != 0;

  return v3;
}

- (BOOL)isExternal
{
  return self->_externalCredentialProviderName != 0;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  unsigned __int8 *v5;
  void *v6;
  int v7;
  char v8;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = (unsigned __int8 *)v4;
    objc_msgSend(v5, "publicKeyCredentialOperationUUID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = WBSIsEqual();

    if (v7
      && self->_isRegistrationRequest == v5[8]
      && -[NSString isEqualToString:](self->_name, "isEqualToString:", *((_QWORD *)v5 + 2))
      && -[NSString isEqualToString:](self->_displayName, "isEqualToString:", *((_QWORD *)v5 + 3))
      && WBSIsEqual()
      && -[NSString isEqualToString:](self->_relyingPartyIdentifier, "isEqualToString:", *((_QWORD *)v5 + 6))
      && WBSIsEqual()
      && WBSIsEqual()
      && WBSIsEqual()
      && WBSIsEqual()
      && WBSIsEqual()
      && WBSIsEqual()
      && WBSIsEqual())
    {
      v8 = WBSIsEqual();
    }
    else
    {
      v8 = 0;
    }

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (int64_t)compare:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  int64_t v13;
  void *v14;
  uint64_t v15;

  v4 = a3;
  -[ASCPlatformPublicKeyCredentialLoginChoice externalCredentialProviderName](self, "externalCredentialProviderName");
  v5 = objc_claimAutoreleasedReturnValue();
  if (v5
    && (v6 = (void *)v5,
        objc_msgSend(v4, "externalCredentialProviderName"),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        v7,
        v6,
        !v7))
  {
    v13 = -1;
  }
  else
  {
    -[ASCPlatformPublicKeyCredentialLoginChoice externalCredentialProviderName](self, "externalCredentialProviderName");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {

LABEL_5:
      -[ASCPlatformPublicKeyCredentialLoginChoice credentialIdentity](self, "credentialIdentity");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "credentialIdentity");
      v10 = objc_claimAutoreleasedReturnValue();
      v11 = (void *)v10;
      if (v9 && v10)
      {
        v12 = objc_msgSend(v9, "rank");
        if (v12 > objc_msgSend(v11, "rank"))
        {
          v13 = -1;
LABEL_15:

          goto LABEL_16;
        }
        v15 = objc_msgSend(v9, "rank");
        if (v15 < objc_msgSend(v11, "rank"))
        {
          v13 = 1;
          goto LABEL_15;
        }
      }
      v13 = 0;
      goto LABEL_15;
    }
    objc_msgSend(v4, "externalCredentialProviderName");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v14)
      goto LABEL_5;
    v13 = 1;
  }
LABEL_16:

  return v13;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *name;
  void *v5;
  id v6;

  name = self->_name;
  v6 = a3;
  objc_msgSend(v6, "encodeObject:forKey:", name, CFSTR("name"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_displayName, CFSTR("displayName"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_customTitle, CFSTR("customTitle"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_identifier, CFSTR("identifier"));
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_isRegistrationRequest);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v5, CFSTR("registrationRequestIndicator"));

  objc_msgSend(v6, "encodeObject:forKey:", self->_userHandle, CFSTR("userHandle"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_relyingPartyIdentifier, CFSTR("relyingPartyIdentifier"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_publicKeyCredentialOperationUUID, CFSTR("publicKeyCredentialOperationUUID"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_credentialIdentity, CFSTR("credentialIdentity"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_externalCredentialProviderName, CFSTR("externalCredentialProviderName"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_externalCredentialProviderBundleID, CFSTR("externalCredentialProviderBundleID"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_clientDataHash, CFSTR("clientDataHash"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_userVerificationPreference, CFSTR("userVerificationPreference"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_supportedAlgorithms, CFSTR("supportedAlgorithms"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_excludedCredentials, CFSTR("excludedCredentials"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_groupID, CFSTR("groupID"));

}

- (ASCPlatformPublicKeyCredentialLoginChoice)initWithCoder:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  id *v15;
  ASCPlatformPublicKeyCredentialLoginChoice *v16;
  ASCPlatformPublicKeyCredentialLoginChoice *v17;
  void *v19;
  void *v20;
  id v22;
  id v23;
  id obj;
  void *v25;
  void *v26;
  void *v27;

  v3 = a3;
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("name"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("displayName"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("customTitle"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("identifier"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("registrationRequestIndicator"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("userHandle"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("relyingPartyIdentifier"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("publicKeyCredentialOperationUUID"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("credentialIdentity"));
  obj = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("externalCredentialProviderName"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("externalCredentialProviderBundleID"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("clientDataHash"));
  v23 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("userVerificationPreference"));
  v22 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeArrayOfObjectsOfClass:forKey:", objc_opt_class(), CFSTR("supportedAlgorithms"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)MEMORY[0x24BDBCF20];
  v11 = objc_opt_class();
  objc_msgSend(v10, "setWithObjects:", v11, objc_opt_class(), 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClasses:forKey:", v12, CFSTR("excludedCredentials"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("groupID"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = -[ASCPlatformPublicKeyCredentialLoginChoice _initAsRegistrationChoice:withName:displayName:customTitle:identifier:userHandle:relyingPartyIdentifier:publicKeyCredentialOperationUUID:externalCredentialProviderName:externalCredentialProviderBundleID:supportedAlgorithms:excludedCredentials:groupID:](self, "_initAsRegistrationChoice:withName:displayName:customTitle:identifier:userHandle:relyingPartyIdentifier:publicKeyCredentialOperationUUID:externalCredentialProviderName:externalCredentialProviderBundleID:supportedAlgorithms:excludedCredentials:groupID:", objc_msgSend(v5, "BOOLValue"), v4, v26, v27, v25, v19, v6, v7, v8, v9, v13, v14);
  v16 = (ASCPlatformPublicKeyCredentialLoginChoice *)v15;
  if (v15)
  {
    objc_storeStrong(v15 + 9, obj);
    objc_storeStrong((id *)&v16->_clientDataHash, v23);
    objc_storeStrong((id *)&v16->_userVerificationPreference, v22);
    v17 = v16;
  }

  return v16;
}

- (NSString)name
{
  return self->_name;
}

- (NSString)displayName
{
  return self->_displayName;
}

- (NSString)customTitle
{
  return self->_customTitle;
}

- (NSString)userHandle
{
  return self->_userHandle;
}

- (NSString)relyingPartyIdentifier
{
  return self->_relyingPartyIdentifier;
}

- (BOOL)isRegistrationRequest
{
  return self->_isRegistrationRequest;
}

- (WBSPublicKeyCredentialIdentifier)identifier
{
  return self->_identifier;
}

- (NSUUID)publicKeyCredentialOperationUUID
{
  return self->_publicKeyCredentialOperationUUID;
}

- (SFPasskeyCredentialIdentity)credentialIdentity
{
  return self->_credentialIdentity;
}

- (NSString)externalCredentialProviderName
{
  return self->_externalCredentialProviderName;
}

- (NSString)externalCredentialProviderBundleID
{
  return self->_externalCredentialProviderBundleID;
}

- (NSData)clientDataHash
{
  return self->_clientDataHash;
}

- (NSString)userVerificationPreference
{
  return self->_userVerificationPreference;
}

- (NSArray)supportedAlgorithms
{
  return self->_supportedAlgorithms;
}

- (NSArray)excludedCredentials
{
  return self->_excludedCredentials;
}

- (NSString)groupID
{
  return self->_groupID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_groupID, 0);
  objc_storeStrong((id *)&self->_excludedCredentials, 0);
  objc_storeStrong((id *)&self->_supportedAlgorithms, 0);
  objc_storeStrong((id *)&self->_userVerificationPreference, 0);
  objc_storeStrong((id *)&self->_clientDataHash, 0);
  objc_storeStrong((id *)&self->_externalCredentialProviderBundleID, 0);
  objc_storeStrong((id *)&self->_externalCredentialProviderName, 0);
  objc_storeStrong((id *)&self->_credentialIdentity, 0);
  objc_storeStrong((id *)&self->_publicKeyCredentialOperationUUID, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_relyingPartyIdentifier, 0);
  objc_storeStrong((id *)&self->_userHandle, 0);
  objc_storeStrong((id *)&self->_customTitle, 0);
  objc_storeStrong((id *)&self->_displayName, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end
