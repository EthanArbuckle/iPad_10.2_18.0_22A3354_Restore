@implementation CTLazuliSystemConfiguration

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@"), objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CTLazuliSystemConfiguration messagingCapabilities](self, "messagingCapabilities");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(", messagingCapabilities = %@"), v4);

  -[CTLazuliSystemConfiguration chatCapabilities](self, "chatCapabilities");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(", chatCapabilities = %@"), v5);

  -[CTLazuliSystemConfiguration groupChatCapabilites](self, "groupChatCapabilites");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(", groupChatCapabilites = %@"), v6);

  -[CTLazuliSystemConfiguration fileTransferCapabilities](self, "fileTransferCapabilities");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(", fileTransferCapabilities = %@"), v7);

  -[CTLazuliSystemConfiguration operationStatus](self, "operationStatus");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(", operationStatus = %@"), v8);

  -[CTLazuliSystemConfiguration discoverCapabilities](self, "discoverCapabilities");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(", discoverCapabilities = %@"), v9);

  -[CTLazuliSystemConfiguration identity](self, "identity");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(", identity = %@"), v10);

  objc_msgSend(v3, "appendFormat:", CFSTR(", featureSupported = %d"), -[CTLazuliSystemConfiguration featureSupported](self, "featureSupported"));
  objc_msgSend(v3, "appendFormat:", CFSTR(", featureEnabledByDefault = %d"), -[CTLazuliSystemConfiguration featureEnabledByDefault](self, "featureEnabledByDefault"));
  -[CTLazuliSystemConfiguration bsfPort](self, "bsfPort");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(", bsfPort = %@"), v11);

  objc_msgSend(v3, "appendFormat:", CFSTR(", bsfUsesSecureTransport = %d"), -[CTLazuliSystemConfiguration bsfUsesSecureTransport](self, "bsfUsesSecureTransport"));
  objc_msgSend(v3, "appendString:", CFSTR(">"));
  return v3;
}

- (BOOL)isEqualToCTLazuliSystemConfiguration:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  int v13;
  int v14;
  uint64_t v16;
  _BOOL4 v17;
  void *v18;
  uint64_t v19;
  void *v20;
  int v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  int v26;
  void *v27;
  void *v28;
  int v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  int v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  int v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  int v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  int v49;
  void *v50;
  void *v51;
  int v52;

  v8 = a3;
  -[CTLazuliSystemConfiguration messagingCapabilities](self, "messagingCapabilities");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9 || (objc_msgSend(v8, "messagingCapabilities"), (v51 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    -[CTLazuliSystemConfiguration messagingCapabilities](self, "messagingCapabilities");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "messagingCapabilities");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v3, "isEqualToCTLazuliMessagingCapabilities:", v4))
    {
      LOBYTE(v10) = 0;
      goto LABEL_64;
    }
    v52 = 1;
  }
  else
  {
    v51 = 0;
    v52 = 0;
  }
  -[CTLazuliSystemConfiguration chatCapabilities](self, "chatCapabilities");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11 || (objc_msgSend(v8, "chatCapabilities"), (v47 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    -[CTLazuliSystemConfiguration chatCapabilities](self, "chatCapabilities");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "chatCapabilities");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v5, "isEqualToCTLazuliChatCapabilities:", v6))
    {
      LOBYTE(v10) = 0;
      goto LABEL_61;
    }
    v49 = 1;
  }
  else
  {
    v47 = 0;
    v49 = 0;
  }
  -[CTLazuliSystemConfiguration groupChatCapabilites](self, "groupChatCapabilites");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12 || (objc_msgSend(v8, "groupChatCapabilites"), (v42 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    -[CTLazuliSystemConfiguration groupChatCapabilites](self, "groupChatCapabilites");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "groupChatCapabilites");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v50, "isEqualToCTLazuliGroupChatCapabilities:"))
    {
      LOBYTE(v10) = 0;
      goto LABEL_58;
    }
    v44 = 1;
  }
  else
  {
    v42 = 0;
    v44 = 0;
  }
  -[CTLazuliSystemConfiguration fileTransferCapabilities](self, "fileTransferCapabilities");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  if (v45 || (objc_msgSend(v8, "fileTransferCapabilities"), (v37 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    -[CTLazuliSystemConfiguration fileTransferCapabilities](self, "fileTransferCapabilities");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "fileTransferCapabilities");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v46, "isEqualToCTLazuliFileTransferCapabilities:"))
    {
      LOBYTE(v10) = 0;
      goto LABEL_55;
    }
    v39 = 1;
  }
  else
  {
    v37 = 0;
    v39 = 0;
  }
  -[CTLazuliSystemConfiguration operationStatus](self, "operationStatus");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  if (v40 || (objc_msgSend(v8, "operationStatus"), (v32 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    -[CTLazuliSystemConfiguration operationStatus](self, "operationStatus");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "operationStatus");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v41, "isEqualToCTLazuliOperationStatus:"))
    {
      LOBYTE(v10) = 0;
      goto LABEL_52;
    }
    v34 = 1;
  }
  else
  {
    v32 = 0;
    v34 = 0;
  }
  -[CTLazuliSystemConfiguration discoverCapabilities](self, "discoverCapabilities");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  if (v35 || (objc_msgSend(v8, "discoverCapabilities"), (v27 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    -[CTLazuliSystemConfiguration discoverCapabilities](self, "discoverCapabilities");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "discoverCapabilities");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v36, "isEqualToCTLazuliDiscoveryCapabilities:"))
    {
      LOBYTE(v10) = 0;
      goto LABEL_49;
    }
    v29 = 1;
  }
  else
  {
    v27 = 0;
    v29 = 0;
  }
  -[CTLazuliSystemConfiguration identity](self, "identity");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  if (v30 || (objc_msgSend(v8, "identity"), (v25 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    -[CTLazuliSystemConfiguration identity](self, "identity");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "identity");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v31, "isEqualToCTLazuliUserIdentities:"))
    {
      LOBYTE(v10) = 0;
LABEL_46:

      goto LABEL_47;
    }
    v26 = 1;
  }
  else
  {
    v25 = 0;
    v26 = 0;
  }
  v13 = -[CTLazuliSystemConfiguration featureSupported](self, "featureSupported");
  if (v13 != objc_msgSend(v8, "featureSupported")
    || (v14 = -[CTLazuliSystemConfiguration featureEnabledByDefault](self, "featureEnabledByDefault"),
        v14 != objc_msgSend(v8, "featureEnabledByDefault")))
  {
    LOBYTE(v10) = 0;
    if (!v26)
      goto LABEL_47;
    goto LABEL_46;
  }
  -[CTLazuliSystemConfiguration bsfPort](self, "bsfPort");
  v24 = objc_claimAutoreleasedReturnValue();
  if (!v24)
  {
    objc_msgSend(v8, "bsfPort");
    v19 = objc_claimAutoreleasedReturnValue();
    if (!v19)
    {
      v20 = 0;
      v21 = 0;
LABEL_86:
      v17 = -[CTLazuliSystemConfiguration bsfUsesSecureTransport](self, "bsfUsesSecureTransport", v20);
      v10 = v17 ^ objc_msgSend(v8, "bsfUsesSecureTransport") ^ 1;
      if (!v21)
        goto LABEL_88;
      goto LABEL_87;
    }
  }
  -[CTLazuliSystemConfiguration bsfPort](self, "bsfPort", v19);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v23, "longValue");
  objc_msgSend(v8, "bsfPort");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  if (v16 == objc_msgSend(v22, "longValue"))
  {
    v21 = 1;
    goto LABEL_86;
  }
  LOBYTE(v10) = 0;
LABEL_87:

LABEL_88:
  v18 = (void *)v24;
  if (!v24)
    v18 = v20;

  if ((v26 & 1) != 0)
    goto LABEL_46;
LABEL_47:
  if (v30)
  {

    if (!v29)
      goto LABEL_50;
    goto LABEL_49;
  }

  if ((v29 & 1) != 0)
  {
LABEL_49:

  }
LABEL_50:
  if (v35)
  {

    if (!v34)
      goto LABEL_53;
    goto LABEL_52;
  }

  if ((v34 & 1) != 0)
  {
LABEL_52:

  }
LABEL_53:
  if (v40)
  {

    if (!v39)
      goto LABEL_56;
    goto LABEL_55;
  }

  if ((v39 & 1) != 0)
  {
LABEL_55:

  }
LABEL_56:
  if (v45)
  {

    if (!v44)
      goto LABEL_59;
    goto LABEL_58;
  }

  if ((v44 & 1) != 0)
  {
LABEL_58:

  }
LABEL_59:
  if (v12)
  {

    if (!v49)
      goto LABEL_62;
    goto LABEL_61;
  }

  if ((v49 & 1) != 0)
  {
LABEL_61:

  }
LABEL_62:
  if (v11)
  {

    if (!v52)
      goto LABEL_65;
    goto LABEL_64;
  }

  if ((v52 & 1) != 0)
  {
LABEL_64:

  }
LABEL_65:
  if (!v9)

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  CTLazuliSystemConfiguration *v4;
  CTLazuliSystemConfiguration *v5;
  BOOL v6;

  v4 = (CTLazuliSystemConfiguration *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[CTLazuliSystemConfiguration isEqualToCTLazuliSystemConfiguration:](self, "isEqualToCTLazuliSystemConfiguration:", v5);

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  CTLazuliSystemConfiguration *v4;

  v4 = +[CTLazuliSystemConfiguration allocWithZone:](CTLazuliSystemConfiguration, "allocWithZone:", a3);
  -[CTLazuliSystemConfiguration setMessagingCapabilities:](v4, "setMessagingCapabilities:", self->_messagingCapabilities);
  -[CTLazuliSystemConfiguration setChatCapabilities:](v4, "setChatCapabilities:", self->_chatCapabilities);
  -[CTLazuliSystemConfiguration setGroupChatCapabilites:](v4, "setGroupChatCapabilites:", self->_groupChatCapabilites);
  -[CTLazuliSystemConfiguration setFileTransferCapabilities:](v4, "setFileTransferCapabilities:", self->_fileTransferCapabilities);
  -[CTLazuliSystemConfiguration setOperationStatus:](v4, "setOperationStatus:", self->_operationStatus);
  -[CTLazuliSystemConfiguration setDiscoverCapabilities:](v4, "setDiscoverCapabilities:", self->_discoverCapabilities);
  -[CTLazuliSystemConfiguration setIdentity:](v4, "setIdentity:", self->_identity);
  -[CTLazuliSystemConfiguration setFeatureSupported:](v4, "setFeatureSupported:", self->_featureSupported);
  -[CTLazuliSystemConfiguration setFeatureEnabledByDefault:](v4, "setFeatureEnabledByDefault:", self->_featureEnabledByDefault);
  -[CTLazuliSystemConfiguration setBsfPort:](v4, "setBsfPort:", self->_bsfPort);
  -[CTLazuliSystemConfiguration setBsfUsesSecureTransport:](v4, "setBsfUsesSecureTransport:", self->_bsfUsesSecureTransport);
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "encodeObject:forKey:", self->_messagingCapabilities, CFSTR("kMessagingCapabilitiesKey"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_chatCapabilities, CFSTR("kChatCapabilitiesKey"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_groupChatCapabilites, CFSTR("kGroupChatCapabilitesKey"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_fileTransferCapabilities, CFSTR("kFileTransferCapabilitiesKey"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_operationStatus, CFSTR("kOperationStatusKey"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_discoverCapabilities, CFSTR("kDiscoverCapabilitiesKey"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_identity, CFSTR("kIdentityKey"));
  objc_msgSend(v4, "encodeBool:forKey:", self->_featureSupported, CFSTR("kFeatureSupportedKey"));
  objc_msgSend(v4, "encodeBool:forKey:", self->_featureEnabledByDefault, CFSTR("kFeatureEnabledByDefaultKey"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_bsfPort, CFSTR("kBsfPortKey"));
  objc_msgSend(v4, "encodeBool:forKey:", self->_bsfUsesSecureTransport, CFSTR("kBsfUsesSecureTransportKey"));

}

- (CTLazuliSystemConfiguration)initWithCoder:(id)a3
{
  id v4;
  CTLazuliSystemConfiguration *v5;
  uint64_t v6;
  CTLazuliMessagingCapabilities *messagingCapabilities;
  uint64_t v8;
  CTLazuliChatCapabilities *chatCapabilities;
  uint64_t v10;
  CTLazuliGroupChatCapabilities *groupChatCapabilites;
  uint64_t v12;
  CTLazuliFileTransferCapabilities *fileTransferCapabilities;
  uint64_t v14;
  CTLazuliOperationStatus *operationStatus;
  uint64_t v16;
  CTLazuliDiscoveryCapabilities *discoverCapabilities;
  uint64_t v18;
  CTLazuliUserIdentities *identity;
  uint64_t v20;
  NSNumber *bsfPort;
  objc_super v23;

  v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)CTLazuliSystemConfiguration;
  v5 = -[CTLazuliSystemConfiguration init](&v23, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kMessagingCapabilitiesKey"));
    v6 = objc_claimAutoreleasedReturnValue();
    messagingCapabilities = v5->_messagingCapabilities;
    v5->_messagingCapabilities = (CTLazuliMessagingCapabilities *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kChatCapabilitiesKey"));
    v8 = objc_claimAutoreleasedReturnValue();
    chatCapabilities = v5->_chatCapabilities;
    v5->_chatCapabilities = (CTLazuliChatCapabilities *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kGroupChatCapabilitesKey"));
    v10 = objc_claimAutoreleasedReturnValue();
    groupChatCapabilites = v5->_groupChatCapabilites;
    v5->_groupChatCapabilites = (CTLazuliGroupChatCapabilities *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kFileTransferCapabilitiesKey"));
    v12 = objc_claimAutoreleasedReturnValue();
    fileTransferCapabilities = v5->_fileTransferCapabilities;
    v5->_fileTransferCapabilities = (CTLazuliFileTransferCapabilities *)v12;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kOperationStatusKey"));
    v14 = objc_claimAutoreleasedReturnValue();
    operationStatus = v5->_operationStatus;
    v5->_operationStatus = (CTLazuliOperationStatus *)v14;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kDiscoverCapabilitiesKey"));
    v16 = objc_claimAutoreleasedReturnValue();
    discoverCapabilities = v5->_discoverCapabilities;
    v5->_discoverCapabilities = (CTLazuliDiscoveryCapabilities *)v16;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kIdentityKey"));
    v18 = objc_claimAutoreleasedReturnValue();
    identity = v5->_identity;
    v5->_identity = (CTLazuliUserIdentities *)v18;

    v5->_featureSupported = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("kFeatureSupportedKey"));
    v5->_featureEnabledByDefault = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("kFeatureEnabledByDefaultKey"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kBsfPortKey"));
    v20 = objc_claimAutoreleasedReturnValue();
    bsfPort = v5->_bsfPort;
    v5->_bsfPort = (NSNumber *)v20;

    v5->_bsfUsesSecureTransport = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("kBsfUsesSecureTransportKey"));
  }

  return v5;
}

- (CTLazuliSystemConfiguration)initWithReflection:(const void *)a3
{
  CTLazuliSystemConfiguration *v4;
  CTLazuliSystemConfiguration *v5;
  CTLazuliMessagingCapabilities *v6;
  uint64_t v7;
  CTLazuliMessagingCapabilities *messagingCapabilities;
  CTLazuliChatCapabilities *v9;
  uint64_t v10;
  CTLazuliChatCapabilities *chatCapabilities;
  CTLazuliGroupChatCapabilities *v12;
  uint64_t v13;
  CTLazuliGroupChatCapabilities *groupChatCapabilites;
  CTLazuliFileTransferCapabilities *v15;
  uint64_t v16;
  CTLazuliFileTransferCapabilities *fileTransferCapabilities;
  CTLazuliOperationStatus *v18;
  uint64_t v19;
  CTLazuliOperationStatus *operationStatus;
  CTLazuliDiscoveryCapabilities *v21;
  uint64_t v22;
  CTLazuliDiscoveryCapabilities *discoverCapabilities;
  CTLazuliUserIdentities *v24;
  uint64_t v25;
  CTLazuliUserIdentities *identity;
  uint64_t v27;
  NSNumber *bsfPort;
  CTLazuliSystemConfiguration *result;
  objc_super v30;

  v30.receiver = self;
  v30.super_class = (Class)CTLazuliSystemConfiguration;
  v4 = -[CTLazuliSystemConfiguration init](&v30, sel_init);
  v5 = v4;
  if (!v4)
    return v5;
  if (*((_BYTE *)a3 + 8))
  {
    v6 = [CTLazuliMessagingCapabilities alloc];
    if (!*((_BYTE *)a3 + 8))
      goto LABEL_35;
    v7 = -[CTLazuliMessagingCapabilities initWithReflection:](v6, "initWithReflection:", a3);
    messagingCapabilities = v5->_messagingCapabilities;
    v5->_messagingCapabilities = (CTLazuliMessagingCapabilities *)v7;
  }
  else
  {
    messagingCapabilities = v4->_messagingCapabilities;
    v4->_messagingCapabilities = 0;
  }

  if (*((_BYTE *)a3 + 56))
  {
    v9 = [CTLazuliChatCapabilities alloc];
    if (!*((_BYTE *)a3 + 56))
      goto LABEL_35;
    v10 = -[CTLazuliChatCapabilities initWithReflection:](v9, "initWithReflection:", (char *)a3 + 16);
    chatCapabilities = v5->_chatCapabilities;
    v5->_chatCapabilities = (CTLazuliChatCapabilities *)v10;
  }
  else
  {
    chatCapabilities = v5->_chatCapabilities;
    v5->_chatCapabilities = 0;
  }

  if (*((_BYTE *)a3 + 96))
  {
    v12 = [CTLazuliGroupChatCapabilities alloc];
    if (!*((_BYTE *)a3 + 96))
      goto LABEL_35;
    v13 = -[CTLazuliGroupChatCapabilities initWithReflection:](v12, "initWithReflection:", (char *)a3 + 64);
    groupChatCapabilites = v5->_groupChatCapabilites;
    v5->_groupChatCapabilites = (CTLazuliGroupChatCapabilities *)v13;
  }
  else
  {
    groupChatCapabilites = v5->_groupChatCapabilites;
    v5->_groupChatCapabilites = 0;
  }

  if (*((_BYTE *)a3 + 320))
  {
    v15 = [CTLazuliFileTransferCapabilities alloc];
    if (!*((_BYTE *)a3 + 320))
      goto LABEL_35;
    v16 = -[CTLazuliFileTransferCapabilities initWithReflection:](v15, "initWithReflection:", (char *)a3 + 104);
    fileTransferCapabilities = v5->_fileTransferCapabilities;
    v5->_fileTransferCapabilities = (CTLazuliFileTransferCapabilities *)v16;
  }
  else
  {
    fileTransferCapabilities = v5->_fileTransferCapabilities;
    v5->_fileTransferCapabilities = 0;
  }

  if (*((_BYTE *)a3 + 340))
  {
    v18 = [CTLazuliOperationStatus alloc];
    if (!*((_BYTE *)a3 + 340))
      goto LABEL_35;
    v19 = -[CTLazuliOperationStatus initWithReflection:](v18, "initWithReflection:", (char *)a3 + 328);
    operationStatus = v5->_operationStatus;
    v5->_operationStatus = (CTLazuliOperationStatus *)v19;
  }
  else
  {
    operationStatus = v5->_operationStatus;
    v5->_operationStatus = 0;
  }

  if (*((_BYTE *)a3 + 348))
  {
    v21 = [CTLazuliDiscoveryCapabilities alloc];
    if (!*((_BYTE *)a3 + 348))
      goto LABEL_35;
    v22 = -[CTLazuliDiscoveryCapabilities initWithReflection:](v21, "initWithReflection:", (char *)a3 + 344);
    discoverCapabilities = v5->_discoverCapabilities;
    v5->_discoverCapabilities = (CTLazuliDiscoveryCapabilities *)v22;
  }
  else
  {
    discoverCapabilities = v5->_discoverCapabilities;
    v5->_discoverCapabilities = 0;
  }

  if (!*((_BYTE *)a3 + 400))
  {
    identity = v5->_identity;
    v5->_identity = 0;
    goto LABEL_30;
  }
  v24 = [CTLazuliUserIdentities alloc];
  if (*((_BYTE *)a3 + 400))
  {
    v25 = -[CTLazuliUserIdentities initWithReflection:](v24, "initWithReflection:", (char *)a3 + 352);
    identity = v5->_identity;
    v5->_identity = (CTLazuliUserIdentities *)v25;
LABEL_30:

    v5->_featureSupported = *((_BYTE *)a3 + 408);
    v5->_featureEnabledByDefault = *((_BYTE *)a3 + 409);
    if (*((_BYTE *)a3 + 424))
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", *((_QWORD *)a3 + 52));
      v27 = objc_claimAutoreleasedReturnValue();
      bsfPort = v5->_bsfPort;
      v5->_bsfPort = (NSNumber *)v27;
    }
    else
    {
      bsfPort = v5->_bsfPort;
      v5->_bsfPort = 0;
    }

    v5->_bsfUsesSecureTransport = *((_BYTE *)a3 + 432);
    return v5;
  }
LABEL_35:
  result = (CTLazuliSystemConfiguration *)std::__throw_bad_optional_access[abi:nn180100]();
  __break(1u);
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CTLazuliMessagingCapabilities)messagingCapabilities
{
  return self->_messagingCapabilities;
}

- (void)setMessagingCapabilities:(id)a3
{
  objc_storeStrong((id *)&self->_messagingCapabilities, a3);
}

- (CTLazuliChatCapabilities)chatCapabilities
{
  return self->_chatCapabilities;
}

- (void)setChatCapabilities:(id)a3
{
  objc_storeStrong((id *)&self->_chatCapabilities, a3);
}

- (CTLazuliGroupChatCapabilities)groupChatCapabilites
{
  return self->_groupChatCapabilites;
}

- (void)setGroupChatCapabilites:(id)a3
{
  objc_storeStrong((id *)&self->_groupChatCapabilites, a3);
}

- (CTLazuliFileTransferCapabilities)fileTransferCapabilities
{
  return self->_fileTransferCapabilities;
}

- (void)setFileTransferCapabilities:(id)a3
{
  objc_storeStrong((id *)&self->_fileTransferCapabilities, a3);
}

- (CTLazuliOperationStatus)operationStatus
{
  return self->_operationStatus;
}

- (void)setOperationStatus:(id)a3
{
  objc_storeStrong((id *)&self->_operationStatus, a3);
}

- (CTLazuliDiscoveryCapabilities)discoverCapabilities
{
  return self->_discoverCapabilities;
}

- (void)setDiscoverCapabilities:(id)a3
{
  objc_storeStrong((id *)&self->_discoverCapabilities, a3);
}

- (CTLazuliUserIdentities)identity
{
  return self->_identity;
}

- (void)setIdentity:(id)a3
{
  objc_storeStrong((id *)&self->_identity, a3);
}

- (BOOL)featureSupported
{
  return self->_featureSupported;
}

- (void)setFeatureSupported:(BOOL)a3
{
  self->_featureSupported = a3;
}

- (BOOL)featureEnabledByDefault
{
  return self->_featureEnabledByDefault;
}

- (void)setFeatureEnabledByDefault:(BOOL)a3
{
  self->_featureEnabledByDefault = a3;
}

- (NSNumber)bsfPort
{
  return self->_bsfPort;
}

- (void)setBsfPort:(id)a3
{
  objc_storeStrong((id *)&self->_bsfPort, a3);
}

- (BOOL)bsfUsesSecureTransport
{
  return self->_bsfUsesSecureTransport;
}

- (void)setBsfUsesSecureTransport:(BOOL)a3
{
  self->_bsfUsesSecureTransport = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bsfPort, 0);
  objc_storeStrong((id *)&self->_identity, 0);
  objc_storeStrong((id *)&self->_discoverCapabilities, 0);
  objc_storeStrong((id *)&self->_operationStatus, 0);
  objc_storeStrong((id *)&self->_fileTransferCapabilities, 0);
  objc_storeStrong((id *)&self->_groupChatCapabilites, 0);
  objc_storeStrong((id *)&self->_chatCapabilities, 0);
  objc_storeStrong((id *)&self->_messagingCapabilities, 0);
}

@end
