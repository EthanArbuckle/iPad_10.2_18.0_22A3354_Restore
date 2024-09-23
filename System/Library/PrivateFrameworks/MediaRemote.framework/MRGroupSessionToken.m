@implementation MRGroupSessionToken

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)tokenForJoinURLString:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  char v9;
  NSObject *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  int v20;
  uint64_t v21;
  void *v22;
  void *v23;
  int v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  int v28;
  void *v29;
  int v30;
  void *v31;
  int v32;
  uint64_t v33;
  uint64_t v34;
  NSObject *v35;
  void *v36;
  MRDiscoveredGroupSession *v37;
  MRGroupSessionToken *v38;
  MRGroupSessionToken *v39;
  NSObject *v40;
  id v42;
  void *v43;
  void *v44;
  uint64_t v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  _BYTE v50[128];
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (!v4)
  {
    v39 = 0;
    goto LABEL_54;
  }
  objc_msgSend(v4, "host");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isEqual:", CFSTR("music.apple.com"));

  if ((v7 & 1) == 0)
  {
    _MRLogForCategory(0xCuLL);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      +[MRGroupSessionToken tokenForJoinURLString:].cold.5();
    goto LABEL_35;
  }
  objc_msgSend(v5, "lastPathComponent");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isEqual:", CFSTR("join"));

  if ((v9 & 1) == 0)
  {
    _MRLogForCategory(0xCuLL);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      +[MRGroupSessionToken tokenForJoinURLString:].cold.4();
LABEL_35:
    v39 = 0;
    goto LABEL_53;
  }
  v10 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3998]), "initWithString:", v3);
  v46 = 0u;
  v47 = 0u;
  v48 = 0u;
  v49 = 0u;
  -[NSObject queryItems](v10, "queryItems");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v46, v50, 16);
  if (!v12)
  {

    v15 = 0;
    v36 = 0;
LABEL_38:
    _MRLogForCategory(0xCuLL);
    v35 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
      +[MRGroupSessionToken tokenForJoinURLString:].cold.1();
    v14 = 0;
    v39 = 0;
    goto LABEL_52;
  }
  v13 = v12;
  v43 = v5;
  v42 = v3;
  v44 = 0;
  v45 = 0;
  v14 = 0;
  v15 = 0;
  v16 = *(_QWORD *)v47;
  do
  {
    v17 = 0;
    do
    {
      if (*(_QWORD *)v47 != v16)
        objc_enumerationMutation(v11);
      v18 = *(void **)(*((_QWORD *)&v46 + 1) + 8 * v17);
      objc_msgSend(v18, "name");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v19, "isEqual:", CFSTR("v"));

      if (v20)
      {
        objc_msgSend(v18, "value");
        v21 = objc_claimAutoreleasedReturnValue();
        v22 = v15;
        v15 = (void *)v21;
LABEL_16:

        goto LABEL_17;
      }
      objc_msgSend(v18, "name");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_msgSend(v23, "isEqualToString:", CFSTR("p"));

      if (v24)
      {
        objc_msgSend(v18, "value");
        v25 = objc_claimAutoreleasedReturnValue();
        v22 = v14;
        v26 = 1;
LABEL_15:
        v45 = v26;
        v14 = (void *)v25;
        goto LABEL_16;
      }
      objc_msgSend(v18, "name");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = objc_msgSend(v27, "isEqualToString:", CFSTR("d"));

      if (v28)
      {
        objc_msgSend(v18, "value");
        v25 = objc_claimAutoreleasedReturnValue();
        v22 = v14;
        v26 = 2;
        goto LABEL_15;
      }
      objc_msgSend(v18, "name");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = objc_msgSend(v29, "isEqualToString:", CFSTR("h"));

      if (v30)
      {
        +[MRSharedSettings currentSettings](MRSharedSettings, "currentSettings");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        v32 = objc_msgSend(v31, "supportGroupSessionHome");

        if (v32)
        {
          objc_msgSend(v18, "value");
          v33 = objc_claimAutoreleasedReturnValue();
          v22 = v44;
          v44 = (void *)v33;
          goto LABEL_16;
        }
      }
LABEL_17:
      ++v17;
    }
    while (v13 != v17);
    v34 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v46, v50, 16);
    v13 = v34;
  }
  while (v34);

  if (!v14)
  {
    v3 = v42;
    v5 = v43;
    v36 = v44;
    goto LABEL_38;
  }
  objc_msgSend(MEMORY[0x1E0C99D50], "tu_dataForURLSafeBase64EncodedString:", v14);
  v35 = objc_claimAutoreleasedReturnValue();
  v5 = v43;
  v36 = v44;
  if (!v35)
  {
    _MRLogForCategory(0xCuLL);
    v37 = (MRDiscoveredGroupSession *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&v37->super, OS_LOG_TYPE_ERROR))
      +[MRGroupSessionToken tokenForJoinURLString:].cold.2();
    goto LABEL_49;
  }
  if (v45 == 2)
  {
    v37 = -[MRDiscoveredGroupSession initWithData:]([MRDiscoveredGroupSession alloc], "initWithData:", v35);
    v38 = -[MRGroupSessionToken initWithDiscoveredSession:]([MRGroupSessionToken alloc], "initWithDiscoveredSession:", v37);
LABEL_44:
    v39 = v38;
    goto LABEL_50;
  }
  if (v45 == 1)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v15, "intValue"));
    v37 = (MRDiscoveredGroupSession *)objc_claimAutoreleasedReturnValue();
    if (v15 && (objc_msgSend(&unk_1E3143CB0, "containsObject:", v37) & 1) != 0)
    {
      MRGroupSessionTokenCreateWithInvitationData(v35, v44, v37);
      v38 = (MRGroupSessionToken *)objc_claimAutoreleasedReturnValue();
      goto LABEL_44;
    }
    _MRLogForCategory(0xCuLL);
    v40 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
      +[MRGroupSessionToken tokenForJoinURLString:].cold.3();

LABEL_49:
    v39 = 0;
LABEL_50:

  }
  else
  {
    v39 = 0;
  }
  v3 = v42;
LABEL_52:

LABEL_53:
LABEL_54:

  return v39;
}

- (MRGroupSessionToken)initWithProtobuf:(id)a3
{
  id v4;
  MRGroupSessionHostInfo *v5;
  unsigned __int8 v6;
  void *v7;
  MRGroupSessionHostInfo *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  MRGroupSessionToken *v14;

  v4 = a3;
  v5 = [MRGroupSessionHostInfo alloc];
  v6 = objc_msgSend(v4, "routeType");
  objc_msgSend(v4, "displayName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[MRGroupSessionHostInfo initWithRouteType:displayName:](v5, "initWithRouteType:displayName:", v6, v7);

  objc_msgSend(v4, "invitationData");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sharedSecret");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sessionIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "equivalentMediaIdentifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v4, "hasVersion") & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", objc_msgSend(v4, "version"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = -[MRGroupSessionToken initWithHostInfo:invitationData:sharedSecret:sessionIdentifier:equivalentMediaIdentifier:version:](self, "initWithHostInfo:invitationData:sharedSecret:sessionIdentifier:equivalentMediaIdentifier:version:", v8, v9, v10, v11, v12, v13);

  }
  else
  {
    v14 = -[MRGroupSessionToken initWithHostInfo:invitationData:sharedSecret:sessionIdentifier:equivalentMediaIdentifier:version:](self, "initWithHostInfo:invitationData:sharedSecret:sessionIdentifier:equivalentMediaIdentifier:version:", v8, v9, v10, v11, v12, 0);
  }

  return v14;
}

- (MRGroupSessionToken)initWithHostInfo:(id)a3 invitationData:(id)a4 sharedSecret:(id)a5 sessionIdentifier:(id)a6 equivalentMediaIdentifier:(id)a7 version:(id)a8
{
  id v15;
  id v16;
  id v17;
  MRGroupSessionToken *v18;
  MRGroupSessionToken *v19;
  id *p_isa;
  id obj;
  id v23;
  id v24;
  id v25;
  objc_super v26;

  v15 = a3;
  v16 = a4;
  v25 = a5;
  v24 = a6;
  obj = a8;
  v23 = a7;
  v17 = a8;
  v18 = 0;
  if (v15 && v16)
  {
    v26.receiver = self;
    v26.super_class = (Class)MRGroupSessionToken;
    v19 = -[MRGroupSessionToken init](&v26, sel_init);
    p_isa = (id *)&v19->super.isa;
    if (v19)
    {
      objc_storeStrong((id *)&v19->_invitationData, a4);
      objc_storeStrong(p_isa + 2, a3);
      objc_storeStrong(p_isa + 7, a5);
      objc_storeStrong(p_isa + 4, a6);
      objc_storeStrong(p_isa + 5, a7);
      objc_storeStrong(p_isa + 3, obj);
    }
    self = p_isa;
    v18 = self;
  }

  return v18;
}

- (MRGroupSessionToken)initWithDiscoveredSession:(id)a3 autoConnect:(BOOL)a4
{
  id v7;
  MRGroupSessionToken *v8;
  MRGroupSessionToken *v9;
  objc_super v11;

  v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)MRGroupSessionToken;
  v8 = -[MRGroupSessionToken init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_discoveredSession, a3);
    v9->_autoConnect = a4;
  }

  return v9;
}

- (MRGroupSessionToken)initWithDiscoveredSession:(id)a3
{
  return -[MRGroupSessionToken initWithDiscoveredSession:autoConnect:](self, "initWithDiscoveredSession:autoConnect:", a3, 0);
}

- (MRGroupSessionToken)initWithDeviceInfo:(id)a3
{
  id v4;
  MRGroupSessionToken *v5;
  void *v6;
  uint64_t v7;
  MRGroupSessionHostInfo *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  MRGroupSessionHostInfo *hostInfo;
  uint64_t v13;
  NSString *sessionIdentifier;
  uint64_t v15;
  NSString *equivalentMediaIdentifier;
  objc_super v18;

  v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)MRGroupSessionToken;
  v5 = -[MRGroupSessionToken init](&v18, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "modelID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = MRGroupSessionRouteTypeFromModelIdentifier(v6);

    v8 = [MRGroupSessionHostInfo alloc];
    objc_msgSend(v4, "name");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "modelID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[MRGroupSessionHostInfo initWithRouteType:displayName:modelIdentifier:color:](v8, "initWithRouteType:displayName:modelIdentifier:color:", v7, v9, v10, 0);
    hostInfo = v5->_hostInfo;
    v5->_hostInfo = (MRGroupSessionHostInfo *)v11;

    objc_msgSend(v4, "deviceUID");
    v13 = objc_claimAutoreleasedReturnValue();
    sessionIdentifier = v5->_sessionIdentifier;
    v5->_sessionIdentifier = (NSString *)v13;

    objc_msgSend(v4, "deviceUID");
    v15 = objc_claimAutoreleasedReturnValue();
    equivalentMediaIdentifier = v5->_equivalentMediaIdentifier;
    v5->_equivalentMediaIdentifier = (NSString *)v15;

  }
  return v5;
}

- (MRGroupSessionToken)initWithData:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  MRGroupSessionToken *v8;
  id v9;
  NSObject *v10;
  id v12;
  _QWORD v13[4];

  v13[3] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  MSVPropertyListDataClasses();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "mutableCopy");

  v13[0] = objc_opt_class();
  v13[1] = objc_opt_class();
  v13[2] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObjectsFromArray:", v7);

  v12 = 0;
  objc_msgSend(MEMORY[0x1E0CB3710], "unarchivedObjectOfClasses:fromData:error:", v6, v4, &v12);
  v8 = (MRGroupSessionToken *)objc_claimAutoreleasedReturnValue();

  v9 = v12;
  if (v9)
  {
    _MRLogForCategory(0xCuLL);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      -[MRGroupSessionToken initWithData:].cold.1();

  }
  return v8;
}

- (MRGroupSessionToken)initWithCoder:(id)a3
{
  id v4;
  MRGroupSessionToken *v5;
  uint64_t v6;
  MRDiscoveredGroupSession *discoveredSession;
  uint64_t v8;
  NSData *invitationData;
  uint64_t v10;
  MRGroupSessionHostInfo *hostInfo;
  uint64_t v12;
  NSString *sharedSecret;
  uint64_t v14;
  NSString *sessionIdentifier;
  uint64_t v16;
  NSString *equivalentMediaIdentifier;
  uint64_t v18;
  NSNumber *version;
  objc_super v21;

  v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)MRGroupSessionToken;
  v5 = -[MRGroupSessionToken init](&v21, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("ds"));
    v6 = objc_claimAutoreleasedReturnValue();
    discoveredSession = v5->_discoveredSession;
    v5->_discoveredSession = (MRDiscoveredGroupSession *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("inv"));
    v8 = objc_claimAutoreleasedReturnValue();
    invitationData = v5->_invitationData;
    v5->_invitationData = (NSData *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("hi"));
    v10 = objc_claimAutoreleasedReturnValue();
    hostInfo = v5->_hostInfo;
    v5->_hostInfo = (MRGroupSessionHostInfo *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("ss"));
    v12 = objc_claimAutoreleasedReturnValue();
    sharedSecret = v5->_sharedSecret;
    v5->_sharedSecret = (NSString *)v12;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("si"));
    v14 = objc_claimAutoreleasedReturnValue();
    sessionIdentifier = v5->_sessionIdentifier;
    v5->_sessionIdentifier = (NSString *)v14;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("emi"));
    v16 = objc_claimAutoreleasedReturnValue();
    equivalentMediaIdentifier = v5->_equivalentMediaIdentifier;
    v5->_equivalentMediaIdentifier = (NSString *)v16;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("v"));
    v18 = objc_claimAutoreleasedReturnValue();
    version = v5->_version;
    v5->_version = (NSNumber *)v18;

  }
  return v5;
}

- (_MRGroupSessionTokenProtobuf)protobuf
{
  _MRGroupSessionTokenProtobuf *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v3 = objc_alloc_init(_MRGroupSessionTokenProtobuf);
  -[MRGroupSessionToken invitationData](self, "invitationData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[_MRGroupSessionTokenProtobuf setInvitationData:](v3, "setInvitationData:", v4);

  -[MRGroupSessionToken sharedSecret](self, "sharedSecret");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[_MRGroupSessionTokenProtobuf setSharedSecret:](v3, "setSharedSecret:", v5);

  -[MRGroupSessionToken sessionIdentifier](self, "sessionIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[_MRGroupSessionTokenProtobuf setSessionIdentifier:](v3, "setSessionIdentifier:", v6);

  -[MRGroupSessionToken equivalentMediaIdentifier](self, "equivalentMediaIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[_MRGroupSessionTokenProtobuf setEquivalentMediaIdentifier:](v3, "setEquivalentMediaIdentifier:", v7);

  -[MRGroupSessionToken hostInfo](self, "hostInfo");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[_MRGroupSessionTokenProtobuf setRouteType:](v3, "setRouteType:", objc_msgSend(v8, "routeType"));

  -[MRGroupSessionToken hostInfo](self, "hostInfo");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "displayName");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[_MRGroupSessionTokenProtobuf setDisplayName:](v3, "setDisplayName:", v10);

  -[MRGroupSessionToken version](self, "version");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[_MRGroupSessionTokenProtobuf setVersion:](v3, "setVersion:", objc_msgSend(v11, "unsignedIntValue"));

  return v3;
}

- (NSData)data
{
  return (NSData *)objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", self, 1, 0);
}

- (void)encodeWithCoder:(id)a3
{
  MRDiscoveredGroupSession *discoveredSession;
  id v5;

  discoveredSession = self->_discoveredSession;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", discoveredSession, CFSTR("ds"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_invitationData, CFSTR("inv"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_hostInfo, CFSTR("hi"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_sharedSecret, CFSTR("ss"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_sessionIdentifier, CFSTR("si"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_equivalentMediaIdentifier, CFSTR("emi"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_version, CFSTR("v"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  MRDiscoveredGroupSession *discoveredSession;
  MRGroupSessionToken *v5;
  void *v6;
  MRGroupSessionToken *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  discoveredSession = self->_discoveredSession;
  v5 = [MRGroupSessionToken alloc];
  if (discoveredSession)
  {
    v6 = (void *)-[MRDiscoveredGroupSession copy](self->_discoveredSession, "copy");
    v7 = -[MRGroupSessionToken initWithDiscoveredSession:](v5, "initWithDiscoveredSession:", v6);
  }
  else
  {
    v6 = (void *)-[MRGroupSessionHostInfo copy](self->_hostInfo, "copy");
    v8 = (void *)-[NSData copy](self->_invitationData, "copy");
    v9 = (void *)-[NSString copy](self->_sharedSecret, "copy");
    v10 = (void *)-[NSString copy](self->_sessionIdentifier, "copy");
    v11 = (void *)-[NSString copy](self->_equivalentMediaIdentifier, "copy");
    v7 = -[MRGroupSessionToken initWithHostInfo:invitationData:sharedSecret:sessionIdentifier:equivalentMediaIdentifier:version:](v5, "initWithHostInfo:invitationData:sharedSecret:sessionIdentifier:equivalentMediaIdentifier:version:", v6, v8, v9, v10, v11, self->_version);

  }
  return v7;
}

- (NSString)joinURLString
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v25;

  objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", CFSTR("https://music.apple.com"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3998]), "initWithURL:resolvingAgainstBaseURL:", v3, 0);
  if (self->_storefrontCountryCode)
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("/%@/%@"), self->_storefrontCountryCode, CFSTR("join"));
  else
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("/%@"), CFSTR("join"), v25);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setPath:", v5);

  v6 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  -[MRGroupSessionToken equivalentMediaIdentifier](self, "equivalentMediaIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    v8 = (void *)MEMORY[0x1E0CB39D8];
    -[MRGroupSessionToken equivalentMediaIdentifier](self, "equivalentMediaIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "queryItemWithName:value:", CFSTR("h"), v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObject:", v10);

  }
  -[MRGroupSessionToken invitationData](self, "invitationData");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    -[MRGroupSessionToken invitationData](self, "invitationData");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "tu_URLSafeBase64EncodedString");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB39D8], "queryItemWithName:value:", CFSTR("p"), v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObject:", v14);

    v15 = (void *)MEMORY[0x1E0CB39D8];
    -[MRGroupSessionToken version](self, "version");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "stringValue");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "queryItemWithName:value:", CFSTR("v"), v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObject:", v18);

LABEL_10:
    goto LABEL_11;
  }
  -[MRGroupSessionToken discoveredSession](self, "discoveredSession");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "data");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "tu_URLSafeBase64EncodedString");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB39D8], "queryItemWithName:value:", CFSTR("d"), v13);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObject:", v21);

  if (-[MRGroupSessionToken autoConnect](self, "autoConnect"))
  {
    objc_msgSend(MEMORY[0x1E0CB39D8], "queryItemWithName:value:", CFSTR("a"), CFSTR("true"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObject:", v16);
    goto LABEL_10;
  }
LABEL_11:
  objc_msgSend(v4, "setQueryItems:", v6);
  objc_msgSend(v4, "URL");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "absoluteString");
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v23;
}

- (unint64_t)hash
{
  uint64_t v3;
  unint64_t v4;

  v3 = -[NSData hash](self->_invitationData, "hash");
  v4 = -[MRDiscoveredGroupSession hash](self->_discoveredSession, "hash") ^ v3;
  return v4 ^ -[NSString hash](self->_sharedSecret, "hash");
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  id v6;
  id v7;
  int v8;
  char v9;
  MRDiscoveredGroupSession *v10;
  MRDiscoveredGroupSession *v11;
  MRDiscoveredGroupSession *v12;
  _BOOL4 v13;
  void *v14;
  void *v15;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    objc_msgSend(v5, "invitationData");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    -[MRGroupSessionToken invitationData](self, "invitationData");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    if (v6 == v7)
    {

    }
    else
    {
      v8 = objc_msgSend(v6, "isEqual:", v7);

      if (!v8)
      {
        v9 = 0;
LABEL_16:

        goto LABEL_17;
      }
    }
    objc_msgSend(v5, "discoveredSession");
    v10 = (MRDiscoveredGroupSession *)objc_claimAutoreleasedReturnValue();
    v11 = self->_discoveredSession;
    if (v10 == v11)
    {

    }
    else
    {
      v12 = v11;
      v13 = -[MRDiscoveredGroupSession isEqual:](v10, "isEqual:", v11);

      if (!v13)
      {
        v9 = 0;
LABEL_15:

        goto LABEL_16;
      }
    }
    objc_msgSend(v5, "version");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[MRGroupSessionToken version](self, "version");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14 == v15)
      v9 = 1;
    else
      v9 = objc_msgSend(v14, "isEqual:", v15);

    goto LABEL_15;
  }
  v9 = 0;
LABEL_17:

  return v9;
}

- (id)description
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;

  -[MRGroupSessionHostInfo description](self->_hostInfo, "description");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    -[MRDiscoveredGroupSession description](self->_discoveredSession, "description");
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%@:%p %@"), objc_opt_class(), self, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "mutableCopy");

  if (self->_sharedSecret)
    objc_msgSend(v8, "appendFormat:", CFSTR(", secret=%@"), self->_sharedSecret);
  if (self->_sessionIdentifier)
    objc_msgSend(v8, "appendFormat:", CFSTR(", id=%@"), self->_sessionIdentifier);
  if (self->_equivalentMediaIdentifier)
    objc_msgSend(v8, "appendFormat:", CFSTR(", mediaID=%@"), self->_equivalentMediaIdentifier);
  if (self->_version)
    objc_msgSend(v8, "appendFormat:", CFSTR(", version=%@"), self->_version);
  objc_msgSend(v8, "appendString:", CFSTR(">"));

  return v8;
}

- (NSString)hostDisplayName
{
  MRGroupSessionHostInfo *hostInfo;
  void *v4;
  void *v5;

  hostInfo = self->_hostInfo;
  if (hostInfo)
  {
    -[MRGroupSessionHostInfo displayName](hostInfo, "displayName");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[MRDiscoveredGroupSession hostInfo](self->_discoveredSession, "hostInfo");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "displayName");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return (NSString *)v4;
}

- (unsigned)routeType
{
  MRGroupSessionHostInfo *hostInfo;
  void *v5;
  unsigned __int8 v6;

  hostInfo = self->_hostInfo;
  if (hostInfo)
    return -[MRGroupSessionHostInfo routeType](hostInfo, "routeType");
  -[MRDiscoveredGroupSession hostInfo](self->_discoveredSession, "hostInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "routeType");

  return v6;
}

- (NSString)localizedSessionName
{
  void *v3;
  void *v4;

  -[MRGroupSessionToken hostDisplayName](self, "hostDisplayName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  MRGroupSessionRouteMakeName(v3, -[MRGroupSessionToken routeType](self, "routeType"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v4;
}

- (NSString)effectiveIdentifier
{
  void *v3;
  void *v4;
  id v5;
  void *v6;

  -[MRGroupSessionToken equivalentMediaIdentifier](self, "equivalentMediaIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    -[MRGroupSessionToken sessionIdentifier](self, "sessionIdentifier");
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;

  return (NSString *)v6;
}

- (MRGroupSessionHostInfo)hostInfo
{
  return self->_hostInfo;
}

- (NSNumber)version
{
  return self->_version;
}

- (NSString)sessionIdentifier
{
  return self->_sessionIdentifier;
}

- (NSString)equivalentMediaIdentifier
{
  return self->_equivalentMediaIdentifier;
}

- (NSString)storefrontCountryCode
{
  return self->_storefrontCountryCode;
}

- (void)setStorefrontCountryCode:(id)a3
{
  objc_storeStrong((id *)&self->_storefrontCountryCode, a3);
}

- (NSString)sharedSecret
{
  return self->_sharedSecret;
}

- (MRDiscoveredGroupSession)discoveredSession
{
  return self->_discoveredSession;
}

- (NSData)invitationData
{
  return self->_invitationData;
}

- (BOOL)autoConnect
{
  return self->_autoConnect;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_invitationData, 0);
  objc_storeStrong((id *)&self->_discoveredSession, 0);
  objc_storeStrong((id *)&self->_sharedSecret, 0);
  objc_storeStrong((id *)&self->_storefrontCountryCode, 0);
  objc_storeStrong((id *)&self->_equivalentMediaIdentifier, 0);
  objc_storeStrong((id *)&self->_sessionIdentifier, 0);
  objc_storeStrong((id *)&self->_version, 0);
  objc_storeStrong((id *)&self->_hostInfo, 0);
}

+ (void)tokenForJoinURLString:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_5();
  OUTLINED_FUNCTION_5(&dword_193827000, v0, v1, "[MRGroupSession] [tokenForJoinURLString] No payload encoded in URL: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_8();
}

+ (void)tokenForJoinURLString:.cold.2()
{
  uint64_t v0;
  NSObject *v1;
  uint8_t v2[12];
  __int16 v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_2_5();
  v3 = 2114;
  v4 = v0;
  OUTLINED_FUNCTION_2_4(&dword_193827000, v1, (uint64_t)v1, "[MRGroupSession] [tokenForJoinURLString] Failed to decode payload: %{public}@ from URL: %{public}@", v2);
  OUTLINED_FUNCTION_8();
}

+ (void)tokenForJoinURLString:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_5();
  OUTLINED_FUNCTION_5(&dword_193827000, v0, v1, "[MRGroupSession] [tokenForJoinURLString] Unexpected URL version: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_8();
}

+ (void)tokenForJoinURLString:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_5();
  OUTLINED_FUNCTION_5(&dword_193827000, v0, v1, "[MRGroupSession] [tokenForJoinURLString] URL isn't group session join: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_8();
}

+ (void)tokenForJoinURLString:.cold.5()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_5();
  OUTLINED_FUNCTION_5(&dword_193827000, v0, v1, "[MRGroupSession] [tokenForJoinURLString] URL doesn't have music domain: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_8();
}

- (void)initWithData:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_5();
  OUTLINED_FUNCTION_5(&dword_193827000, v0, v1, "[MRGroupSession] Failed to decode MRGroupSessionToken: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_8();
}

@end
