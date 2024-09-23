@implementation AFAccount

- (id)description
{
  void *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)AFAccount;
  -[AFAccount description](&v6, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByAppendingFormat:", CFSTR(": %@ { Assistant: %@, Host: %@, Ace Host: %@, Group: %@ }"), self->_identifier, self->_assistantIdentifier, self->_hostname, self->_aceHost, self->_group);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (AFAccount)initWithMessageDictionary:(id)a3
{
  id v4;
  AFAccount *v5;
  void *v6;
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
  void *v24;
  void *v25;
  void *v26;
  void *v27;

  v4 = a3;
  v5 = -[AFAccount init](self, "init");
  if (v5)
  {
    objc_msgSend(v4, "objectForKey:", CFSTR("kAFAccountInfoIdentifierKey"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[AFAccount setIdentifier:](v5, "setIdentifier:", v6);

    objc_msgSend(v4, "objectForKey:", CFSTR("kAFAccountInfoLabelKey"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[AFAccount setLabel:](v5, "setLabel:", v7);

    objc_msgSend(v4, "objectForKey:", CFSTR("kAFAccountInfoAssistantIdentifierKey"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[AFAccount setAssistantIdentifier:](v5, "setAssistantIdentifier:", v8);

    objc_msgSend(v4, "objectForKey:", CFSTR("kAFAccountInfoLoggingAssistantIdentifierKey"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[AFAccount setLoggingAssistantIdentifier:](v5, "setLoggingAssistantIdentifier:", v9);

    objc_msgSend(v4, "objectForKey:", CFSTR("kAFAccountInfoSpeechIdentifierKey"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[AFAccount setSpeechIdentifier:](v5, "setSpeechIdentifier:", v10);

    objc_msgSend(v4, "objectForKey:", CFSTR("kAFAccountInfoHostnameKey"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[AFAccount setHostname:](v5, "setHostname:", v11);

    objc_msgSend(v4, "objectForKey:", CFSTR("kAFAccountInfoPeerAssistantIdentifierKey"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[AFAccount setPeerAssistantIdentifier:](v5, "setPeerAssistantIdentifier:", v12);

    objc_msgSend(v4, "objectForKey:", CFSTR("kAFAccountInfoPeerLoggingAssistantIdentifierKey"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[AFAccount setPeerLoggingAssistantIdentifier:](v5, "setPeerLoggingAssistantIdentifier:", v13);

    objc_msgSend(v4, "objectForKey:", CFSTR("kAFAccountInfoPeerSpeechIdentifierKey"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[AFAccount setPeerSpeechIdentifier:](v5, "setPeerSpeechIdentifier:", v14);

    objc_msgSend(v4, "objectForKey:", CFSTR("kAFAccountInfoPeerUserAgentStringKey"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[AFAccount setPeerUserAgentString:](v5, "setPeerUserAgentString:", v15);

    objc_msgSend(v4, "objectForKey:", CFSTR("kAFAccountInfoPeerLanguageCodeKey"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[AFAccount setPeerLanguageCode:](v5, "setPeerLanguageCode:", v16);

    objc_msgSend(v4, "objectForKey:", CFSTR("kAFAccountInfoPeerSiriEnabledKey"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[AFAccount setPeerSiriEnabled:](v5, "setPeerSiriEnabled:", objc_msgSend(v17, "BOOLValue"));

    objc_msgSend(v4, "objectForKey:", CFSTR("kAFAccountInfoPeerHostnameKey"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[AFAccount setPeerHostname:](v5, "setPeerHostname:", v18);

    objc_msgSend(v4, "objectForKey:", CFSTR("kAFAccountInfoPredefinedServerKey"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[AFAccount setPredefinedServer:](v5, "setPredefinedServer:", v19);

    objc_msgSend(v4, "objectForKey:", CFSTR("kAFAccountInfoAceHostKey"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[AFAccount setAceHost:](v5, "setAceHost:", v20);

    objc_msgSend(v4, "objectForKey:", CFSTR("kAFAccountInfoConnectionPolicyKey"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[AFAccount setConnectionPolicy:](v5, "setConnectionPolicy:", v21);

    objc_msgSend(v4, "objectForKey:", CFSTR("kAFAccountInfoConnectionPolicyDateKey"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[AFAccount setConnectionPolicyDate:](v5, "setConnectionPolicyDate:", v22);

    objc_msgSend(v4, "objectForKey:", CFSTR("kAFAccountConnectionPolicyFirstFailureDate"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[AFAccount setConnectionPolicyFirstFailureDate:](v5, "setConnectionPolicyFirstFailureDate:", v23);

    objc_msgSend(v4, "objectForKey:", CFSTR("kAFAccountInfoConnectionPolicyHostnameKey"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[AFAccount setConnectionPolicyHostname:](v5, "setConnectionPolicyHostname:", v24);

    objc_msgSend(v4, "objectForKey:", CFSTR("kAFAccountInfoGroupKey"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[AFAccount setGroup:](v5, "setGroup:", v25);

    objc_msgSend(v4, "objectForKey:", CFSTR("kAFAccountInfoLocaleIdentifierKey"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[AFAccount setLocaleIdentifier:](v5, "setLocaleIdentifier:", v26);

    objc_msgSend(v4, "objectForKey:", CFSTR("kAFAccountInfoIsActiveKey"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_isActive = objc_msgSend(v27, "BOOLValue");

  }
  return v5;
}

- (id)messageDictionary
{
  void *v3;
  void *v4;
  NSString *identifier;
  NSString *label;
  NSString *hostname;
  NSString *predefinedServer;
  NSString *assistantIdentifier;
  NSString *loggingAssistantIdentifier;
  NSString *speechIdentifier;
  NSString *aceHost;
  NSString *peerAssistantIdentifier;
  NSString *peerLoggingAssistantIdentifier;
  NSString *peerSpeechIdentifier;
  NSString *peerUserAgentString;
  NSString *peerLanguageCode;
  void *v18;
  NSString *peerHostname;
  NSDictionary *connectionPolicy;
  NSDate *connectionPolicyDate;
  NSDate *connectionPolicyFirstFailureDate;
  NSString *connectionPolicyHostname;
  NSString *group;
  NSString *localeIdentifier;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", 8);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  identifier = self->_identifier;
  if (identifier)
    objc_msgSend(v3, "setObject:forKey:", identifier, CFSTR("kAFAccountInfoIdentifierKey"));
  label = self->_label;
  if (label)
    objc_msgSend(v4, "setObject:forKey:", label, CFSTR("kAFAccountInfoLabelKey"));
  hostname = self->_hostname;
  if (hostname)
    objc_msgSend(v4, "setObject:forKey:", hostname, CFSTR("kAFAccountInfoHostnameKey"));
  predefinedServer = self->_predefinedServer;
  if (predefinedServer)
    objc_msgSend(v4, "setObject:forKey:", predefinedServer, CFSTR("kAFAccountInfoPredefinedServerKey"));
  assistantIdentifier = self->_assistantIdentifier;
  if (assistantIdentifier)
    objc_msgSend(v4, "setObject:forKey:", assistantIdentifier, CFSTR("kAFAccountInfoAssistantIdentifierKey"));
  loggingAssistantIdentifier = self->_loggingAssistantIdentifier;
  if (loggingAssistantIdentifier)
    objc_msgSend(v4, "setObject:forKey:", loggingAssistantIdentifier, CFSTR("kAFAccountInfoLoggingAssistantIdentifierKey"));
  speechIdentifier = self->_speechIdentifier;
  if (speechIdentifier)
    objc_msgSend(v4, "setObject:forKey:", speechIdentifier, CFSTR("kAFAccountInfoSpeechIdentifierKey"));
  aceHost = self->_aceHost;
  if (aceHost)
    objc_msgSend(v4, "setObject:forKey:", aceHost, CFSTR("kAFAccountInfoAceHostKey"));
  peerAssistantIdentifier = self->_peerAssistantIdentifier;
  if (peerAssistantIdentifier)
    objc_msgSend(v4, "setObject:forKey:", peerAssistantIdentifier, CFSTR("kAFAccountInfoPeerAssistantIdentifierKey"));
  peerLoggingAssistantIdentifier = self->_peerLoggingAssistantIdentifier;
  if (peerLoggingAssistantIdentifier)
    objc_msgSend(v4, "setObject:forKey:", peerLoggingAssistantIdentifier, CFSTR("kAFAccountInfoPeerLoggingAssistantIdentifierKey"));
  peerSpeechIdentifier = self->_peerSpeechIdentifier;
  if (peerSpeechIdentifier)
    objc_msgSend(v4, "setObject:forKey:", peerSpeechIdentifier, CFSTR("kAFAccountInfoPeerSpeechIdentifierKey"));
  peerUserAgentString = self->_peerUserAgentString;
  if (peerUserAgentString)
    objc_msgSend(v4, "setObject:forKey:", peerUserAgentString, CFSTR("kAFAccountInfoPeerUserAgentStringKey"));
  peerLanguageCode = self->_peerLanguageCode;
  if (peerLanguageCode)
    objc_msgSend(v4, "setObject:forKey:", peerLanguageCode, CFSTR("kAFAccountInfoPeerLanguageCodeKey"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_peerSiriEnabled);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v18, CFSTR("kAFAccountInfoPeerSiriEnabledKey"));

  peerHostname = self->_peerHostname;
  if (peerHostname)
    objc_msgSend(v4, "setObject:forKey:", peerHostname, CFSTR("kAFAccountInfoPeerHostnameKey"));
  connectionPolicy = self->_connectionPolicy;
  if (connectionPolicy)
    objc_msgSend(v4, "setObject:forKey:", connectionPolicy, CFSTR("kAFAccountInfoConnectionPolicyKey"));
  connectionPolicyDate = self->_connectionPolicyDate;
  if (connectionPolicyDate)
    objc_msgSend(v4, "setObject:forKey:", connectionPolicyDate, CFSTR("kAFAccountInfoConnectionPolicyDateKey"));
  connectionPolicyFirstFailureDate = self->_connectionPolicyFirstFailureDate;
  if (connectionPolicyFirstFailureDate)
    objc_msgSend(v4, "setObject:forKey:", connectionPolicyFirstFailureDate, CFSTR("kAFAccountConnectionPolicyFirstFailureDate"));
  connectionPolicyHostname = self->_connectionPolicyHostname;
  if (connectionPolicyHostname)
    objc_msgSend(v4, "setObject:forKey:", connectionPolicyHostname, CFSTR("kAFAccountInfoConnectionPolicyHostnameKey"));
  group = self->_group;
  if (group)
    objc_msgSend(v4, "setObject:forKey:", group, CFSTR("kAFAccountInfoGroupKey"));
  localeIdentifier = self->_localeIdentifier;
  if (localeIdentifier)
    objc_msgSend(v4, "setObject:forKey:", localeIdentifier, CFSTR("kAFAccountInfoLocaleIdentifierKey"));
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *identifier;
  id v5;

  identifier = self->_identifier;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", identifier, CFSTR("_identifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_label, CFSTR("_label"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_assistantIdentifier, CFSTR("_assistantIdentifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_loggingAssistantIdentifier, CFSTR("_loggingAssistantIdentifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_speechIdentifier, CFSTR("_speechIdentifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_hostname, CFSTR("_hostname"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_peerAssistantIdentifier, CFSTR("_peerAssistantIdentifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_peerLoggingAssistantIdentifier, CFSTR("_peerLoggingAssistantIdentifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_peerSpeechIdentifier, CFSTR("_peerSpeechIdentifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_peerUserAgentString, CFSTR("_peerUserAgentString"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_predefinedServer, CFSTR("_predefinedServer"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_aceHost, CFSTR("_aceHost"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_connectionPolicy, CFSTR("_connectionPolicy"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_connectionPolicyDate, CFSTR("_connectionPolicyDate"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_connectionPolicyHostname, CFSTR("_connectionPolicyHostname"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_connectionPolicyFirstFailureDate, CFSTR("_connectionPolicyFirstFailureDate"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_group, CFSTR("_group"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_lastSyncDates, CFSTR("_lastSyncDates"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_localeIdentifier, CFSTR("_localeIdentifier"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_isActive, CFSTR("_isActive"));

}

- (AFAccount)initWithCoder:(id)a3
{
  id v4;
  AFAccount *v5;
  uint64_t v6;
  NSString *identifier;
  uint64_t v8;
  NSString *label;
  uint64_t v10;
  NSString *assistantIdentifier;
  uint64_t v12;
  NSString *loggingAssistantIdentifier;
  uint64_t v14;
  NSString *speechIdentifier;
  uint64_t v16;
  NSString *hostname;
  uint64_t v18;
  NSString *peerAssistantIdentifier;
  uint64_t v20;
  NSString *peerLoggingAssistantIdentifier;
  uint64_t v22;
  NSString *peerSpeechIdentifier;
  uint64_t v24;
  NSString *peerUserAgentString;
  uint64_t v26;
  NSString *predefinedServer;
  uint64_t v28;
  NSString *aceHost;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  NSDictionary *connectionPolicy;
  uint64_t v35;
  NSDate *connectionPolicyDate;
  uint64_t v37;
  NSString *connectionPolicyHostname;
  uint64_t v39;
  NSDate *connectionPolicyFirstFailureDate;
  uint64_t v41;
  NSString *group;
  uint64_t v43;
  NSDictionary *lastSyncDates;
  uint64_t v45;
  NSString *localeIdentifier;
  objc_super v48;
  _QWORD v49[6];

  v49[5] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v48.receiver = self;
  v48.super_class = (Class)AFAccount;
  v5 = -[AFAccount init](&v48, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_identifier"));
    v6 = objc_claimAutoreleasedReturnValue();
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_label"));
    v8 = objc_claimAutoreleasedReturnValue();
    label = v5->_label;
    v5->_label = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_assistantIdentifier"));
    v10 = objc_claimAutoreleasedReturnValue();
    assistantIdentifier = v5->_assistantIdentifier;
    v5->_assistantIdentifier = (NSString *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_loggingAssistantIdentifier"));
    v12 = objc_claimAutoreleasedReturnValue();
    loggingAssistantIdentifier = v5->_loggingAssistantIdentifier;
    v5->_loggingAssistantIdentifier = (NSString *)v12;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_speechIdentifier"));
    v14 = objc_claimAutoreleasedReturnValue();
    speechIdentifier = v5->_speechIdentifier;
    v5->_speechIdentifier = (NSString *)v14;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_hostname"));
    v16 = objc_claimAutoreleasedReturnValue();
    hostname = v5->_hostname;
    v5->_hostname = (NSString *)v16;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_peerAssistantIdentifier"));
    v18 = objc_claimAutoreleasedReturnValue();
    peerAssistantIdentifier = v5->_peerAssistantIdentifier;
    v5->_peerAssistantIdentifier = (NSString *)v18;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_peerLoggingAssistantIdentifier"));
    v20 = objc_claimAutoreleasedReturnValue();
    peerLoggingAssistantIdentifier = v5->_peerLoggingAssistantIdentifier;
    v5->_peerLoggingAssistantIdentifier = (NSString *)v20;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_peerSpeechIdentifier"));
    v22 = objc_claimAutoreleasedReturnValue();
    peerSpeechIdentifier = v5->_peerSpeechIdentifier;
    v5->_peerSpeechIdentifier = (NSString *)v22;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_peerUserAgentString"));
    v24 = objc_claimAutoreleasedReturnValue();
    peerUserAgentString = v5->_peerUserAgentString;
    v5->_peerUserAgentString = (NSString *)v24;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_predefinedServer"));
    v26 = objc_claimAutoreleasedReturnValue();
    predefinedServer = v5->_predefinedServer;
    v5->_predefinedServer = (NSString *)v26;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_aceHost"));
    v28 = objc_claimAutoreleasedReturnValue();
    aceHost = v5->_aceHost;
    v5->_aceHost = (NSString *)v28;

    v30 = (void *)MEMORY[0x1E0C99E60];
    v49[0] = objc_opt_class();
    v49[1] = objc_opt_class();
    v49[2] = objc_opt_class();
    v49[3] = objc_opt_class();
    v49[4] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v49, 5);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "setWithArray:", v31);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v32, CFSTR("kAFAccountInfoConnectionPolicyKey"));
    v33 = objc_claimAutoreleasedReturnValue();
    connectionPolicy = v5->_connectionPolicy;
    v5->_connectionPolicy = (NSDictionary *)v33;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_connectionPolicyDate"));
    v35 = objc_claimAutoreleasedReturnValue();
    connectionPolicyDate = v5->_connectionPolicyDate;
    v5->_connectionPolicyDate = (NSDate *)v35;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_connectionPolicyHostname"));
    v37 = objc_claimAutoreleasedReturnValue();
    connectionPolicyHostname = v5->_connectionPolicyHostname;
    v5->_connectionPolicyHostname = (NSString *)v37;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_connectionPolicyFirstFailureDate"));
    v39 = objc_claimAutoreleasedReturnValue();
    connectionPolicyFirstFailureDate = v5->_connectionPolicyFirstFailureDate;
    v5->_connectionPolicyFirstFailureDate = (NSDate *)v39;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_group"));
    v41 = objc_claimAutoreleasedReturnValue();
    group = v5->_group;
    v5->_group = (NSString *)v41;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_lastSyncDates"));
    v43 = objc_claimAutoreleasedReturnValue();
    lastSyncDates = v5->_lastSyncDates;
    v5->_lastSyncDates = (NSDictionary *)v43;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_localeIdentifier"));
    v45 = objc_claimAutoreleasedReturnValue();
    localeIdentifier = v5->_localeIdentifier;
    v5->_localeIdentifier = (NSString *)v45;

    v5->_isActive = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("_isActive"));
  }

  return v5;
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

  v4 = objc_alloc_init((Class)objc_opt_class());
  -[AFAccount identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setIdentifier:", v5);

  -[AFAccount label](self, "label");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setLabel:", v6);

  -[AFAccount assistantIdentifier](self, "assistantIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAssistantIdentifier:", v7);

  -[AFAccount loggingAssistantIdentifier](self, "loggingAssistantIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setLoggingAssistantIdentifier:", v8);

  -[AFAccount speechIdentifier](self, "speechIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setSpeechIdentifier:", v9);

  -[AFAccount hostname](self, "hostname");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setHostname:", v10);

  -[AFAccount peerAssistantIdentifier](self, "peerAssistantIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setPeerAssistantIdentifier:", v11);

  -[AFAccount peerLoggingAssistantIdentifier](self, "peerLoggingAssistantIdentifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setPeerLoggingAssistantIdentifier:", v12);

  -[AFAccount peerSpeechIdentifier](self, "peerSpeechIdentifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setPeerSpeechIdentifier:", v13);

  -[AFAccount peerUserAgentString](self, "peerUserAgentString");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setPeerUserAgentString:", v14);

  -[AFAccount predefinedServer](self, "predefinedServer");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setPredefinedServer:", v15);

  -[AFAccount aceHost](self, "aceHost");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAceHost:", v16);

  -[AFAccount connectionPolicy](self, "connectionPolicy");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setConnectionPolicy:", v17);

  -[AFAccount connectionPolicyDate](self, "connectionPolicyDate");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setConnectionPolicyDate:", v18);

  -[AFAccount connectionPolicyHostname](self, "connectionPolicyHostname");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setConnectionPolicyHostname:", v19);

  -[AFAccount connectionPolicyFirstFailureDate](self, "connectionPolicyFirstFailureDate");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setConnectionPolicyFirstFailureDate:", v20);

  -[AFAccount group](self, "group");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setGroup:", v21);

  -[AFAccount lastSyncDates](self, "lastSyncDates");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setLastSyncDates:", v22);

  -[AFAccount localeIdentifier](self, "localeIdentifier");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setLocaleIdentifier:", v23);

  objc_msgSend(v4, "setIsActive:", -[AFAccount isActive](self, "isActive"));
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  void *v39;
  int v40;
  int v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    objc_msgSend(v5, "identifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[AFAccount identifier](self, "identifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "isEqualToString:", v7))
    {
      objc_msgSend(v5, "label");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[AFAccount label](self, "label");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v8, "isEqualToString:", v9))
      {
        objc_msgSend(v5, "assistantIdentifier");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        -[AFAccount assistantIdentifier](self, "assistantIdentifier");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v10, "isEqualToString:", v11))
        {
          objc_msgSend(v5, "loggingAssistantIdentifier");
          v12 = objc_claimAutoreleasedReturnValue();
          -[AFAccount loggingAssistantIdentifier](self, "loggingAssistantIdentifier");
          v13 = objc_claimAutoreleasedReturnValue();
          v69 = (void *)v12;
          v14 = (void *)v12;
          v15 = (void *)v13;
          if (objc_msgSend(v14, "isEqualToString:", v13))
          {
            v66 = v15;
            objc_msgSend(v5, "speechIdentifier");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            -[AFAccount speechIdentifier](self, "speechIdentifier");
            v67 = (void *)objc_claimAutoreleasedReturnValue();
            v68 = v16;
            if (objc_msgSend(v16, "isEqualToString:", v67))
            {
              objc_msgSend(v5, "hostname");
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              -[AFAccount hostname](self, "hostname");
              v64 = (void *)objc_claimAutoreleasedReturnValue();
              v65 = v17;
              if (objc_msgSend(v17, "isEqualToString:", v64))
              {
                objc_msgSend(v5, "peerAssistantIdentifier");
                v18 = (void *)objc_claimAutoreleasedReturnValue();
                -[AFAccount peerAssistantIdentifier](self, "peerAssistantIdentifier");
                v62 = (void *)objc_claimAutoreleasedReturnValue();
                v63 = v18;
                if (objc_msgSend(v18, "isEqualToString:", v62))
                {
                  objc_msgSend(v5, "peerLoggingAssistantIdentifier");
                  v19 = objc_claimAutoreleasedReturnValue();
                  -[AFAccount peerLoggingAssistantIdentifier](self, "peerLoggingAssistantIdentifier");
                  v20 = objc_claimAutoreleasedReturnValue();
                  v61 = (void *)v19;
                  v21 = (void *)v19;
                  v22 = (void *)v20;
                  if (objc_msgSend(v21, "isEqualToString:", v20))
                  {
                    v58 = v22;
                    objc_msgSend(v5, "peerSpeechIdentifier");
                    v23 = (void *)objc_claimAutoreleasedReturnValue();
                    -[AFAccount peerSpeechIdentifier](self, "peerSpeechIdentifier");
                    v59 = (void *)objc_claimAutoreleasedReturnValue();
                    v60 = v23;
                    if (objc_msgSend(v23, "isEqualToString:", v59))
                    {
                      objc_msgSend(v5, "peerUserAgentString");
                      v24 = objc_claimAutoreleasedReturnValue();
                      -[AFAccount peerUserAgentString](self, "peerUserAgentString");
                      v25 = objc_claimAutoreleasedReturnValue();
                      v57 = (void *)v24;
                      v26 = (void *)v24;
                      v27 = (void *)v25;
                      if (objc_msgSend(v26, "isEqualToString:", v25))
                      {
                        v55 = v27;
                        objc_msgSend(v5, "predefinedServer");
                        v28 = objc_claimAutoreleasedReturnValue();
                        -[AFAccount predefinedServer](self, "predefinedServer");
                        v29 = objc_claimAutoreleasedReturnValue();
                        v56 = (void *)v28;
                        v30 = (void *)v28;
                        v31 = (void *)v29;
                        if (objc_msgSend(v30, "isEqualToString:", v29))
                        {
                          objc_msgSend(v5, "aceHost");
                          v54 = (void *)objc_claimAutoreleasedReturnValue();
                          -[AFAccount aceHost](self, "aceHost");
                          v53 = (void *)objc_claimAutoreleasedReturnValue();
                          if (objc_msgSend(v54, "isEqualToString:"))
                          {
                            v52 = v31;
                            objc_msgSend(v5, "connectionPolicy");
                            v32 = (void *)objc_claimAutoreleasedReturnValue();
                            -[AFAccount connectionPolicy](self, "connectionPolicy");
                            v50 = (void *)objc_claimAutoreleasedReturnValue();
                            v51 = v32;
                            if (objc_msgSend(v32, "isEqual:"))
                            {
                              objc_msgSend(v5, "connectionPolicyDate");
                              v33 = (void *)objc_claimAutoreleasedReturnValue();
                              -[AFAccount connectionPolicyDate](self, "connectionPolicyDate");
                              v48 = (void *)objc_claimAutoreleasedReturnValue();
                              v49 = v33;
                              if (objc_msgSend(v33, "isEqual:"))
                              {
                                objc_msgSend(v5, "connectionPolicyHostname");
                                v34 = (void *)objc_claimAutoreleasedReturnValue();
                                -[AFAccount connectionPolicyHostname](self, "connectionPolicyHostname");
                                v46 = (void *)objc_claimAutoreleasedReturnValue();
                                v47 = v34;
                                if (objc_msgSend(v34, "isEqualToString:"))
                                {
                                  objc_msgSend(v5, "group");
                                  v35 = (void *)objc_claimAutoreleasedReturnValue();
                                  -[AFAccount group](self, "group");
                                  v44 = (void *)objc_claimAutoreleasedReturnValue();
                                  v45 = v35;
                                  if (objc_msgSend(v35, "isEqualToString:"))
                                  {
                                    objc_msgSend(v5, "lastSyncDates");
                                    v36 = objc_claimAutoreleasedReturnValue();
                                    -[AFAccount lastSyncDates](self, "lastSyncDates");
                                    v37 = objc_claimAutoreleasedReturnValue();
                                    v43 = (void *)v36;
                                    v38 = (void *)v36;
                                    v39 = (void *)v37;
                                    if (objc_msgSend(v38, "isEqual:"))
                                    {
                                      v42 = objc_msgSend(v5, "isActive");
                                      v40 = v42 ^ -[AFAccount isActive](self, "isActive") ^ 1;
                                    }
                                    else
                                    {
                                      LOBYTE(v40) = 0;
                                    }

                                  }
                                  else
                                  {
                                    LOBYTE(v40) = 0;
                                  }

                                }
                                else
                                {
                                  LOBYTE(v40) = 0;
                                }

                              }
                              else
                              {
                                LOBYTE(v40) = 0;
                              }

                            }
                            else
                            {
                              LOBYTE(v40) = 0;
                            }

                            v31 = v52;
                          }
                          else
                          {
                            LOBYTE(v40) = 0;
                          }

                        }
                        else
                        {
                          LOBYTE(v40) = 0;
                        }

                        v27 = v55;
                      }
                      else
                      {
                        LOBYTE(v40) = 0;
                      }

                    }
                    else
                    {
                      LOBYTE(v40) = 0;
                    }
                    v22 = v58;

                  }
                  else
                  {
                    LOBYTE(v40) = 0;
                  }

                }
                else
                {
                  LOBYTE(v40) = 0;
                }
                v15 = v66;

              }
              else
              {
                LOBYTE(v40) = 0;
                v15 = v66;
              }

            }
            else
            {
              LOBYTE(v40) = 0;
              v15 = v66;
            }

          }
          else
          {
            LOBYTE(v40) = 0;
          }

        }
        else
        {
          LOBYTE(v40) = 0;
        }

      }
      else
      {
        LOBYTE(v40) = 0;
      }

    }
    else
    {
      LOBYTE(v40) = 0;
    }

  }
  else
  {
    LOBYTE(v40) = 0;
  }

  return v40;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)label
{
  return self->_label;
}

- (void)setLabel:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)assistantIdentifier
{
  return self->_assistantIdentifier;
}

- (void)setAssistantIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSString)loggingAssistantIdentifier
{
  return self->_loggingAssistantIdentifier;
}

- (void)setLoggingAssistantIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSString)speechIdentifier
{
  return self->_speechIdentifier;
}

- (void)setSpeechIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSString)hostname
{
  return self->_hostname;
}

- (void)setHostname:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSString)peerAssistantIdentifier
{
  return self->_peerAssistantIdentifier;
}

- (void)setPeerAssistantIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (NSString)peerLoggingAssistantIdentifier
{
  return self->_peerLoggingAssistantIdentifier;
}

- (void)setPeerLoggingAssistantIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (NSString)peerSpeechIdentifier
{
  return self->_peerSpeechIdentifier;
}

- (void)setPeerSpeechIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (NSString)peerUserAgentString
{
  return self->_peerUserAgentString;
}

- (void)setPeerUserAgentString:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (NSString)peerLanguageCode
{
  return self->_peerLanguageCode;
}

- (void)setPeerLanguageCode:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (BOOL)peerSiriEnabled
{
  return self->_peerSiriEnabled;
}

- (void)setPeerSiriEnabled:(BOOL)a3
{
  self->_peerSiriEnabled = a3;
}

- (NSString)peerHostname
{
  return self->_peerHostname;
}

- (void)setPeerHostname:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (NSString)predefinedServer
{
  return self->_predefinedServer;
}

- (void)setPredefinedServer:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (NSString)aceHost
{
  return self->_aceHost;
}

- (void)setAceHost:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 120);
}

- (NSDictionary)connectionPolicy
{
  return self->_connectionPolicy;
}

- (void)setConnectionPolicy:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 128);
}

- (NSDate)connectionPolicyDate
{
  return self->_connectionPolicyDate;
}

- (void)setConnectionPolicyDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 136);
}

- (NSString)connectionPolicyHostname
{
  return self->_connectionPolicyHostname;
}

- (void)setConnectionPolicyHostname:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 144);
}

- (NSString)group
{
  return self->_group;
}

- (void)setGroup:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 152);
}

- (NSDictionary)lastSyncDates
{
  return self->_lastSyncDates;
}

- (void)setLastSyncDates:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 160);
}

- (NSString)localeIdentifier
{
  return self->_localeIdentifier;
}

- (void)setLocaleIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 168);
}

- (BOOL)isActive
{
  return self->_isActive;
}

- (void)setIsActive:(BOOL)a3
{
  self->_isActive = a3;
}

- (NSDate)connectionPolicyFirstFailureDate
{
  return self->_connectionPolicyFirstFailureDate;
}

- (void)setConnectionPolicyFirstFailureDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 176);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connectionPolicyFirstFailureDate, 0);
  objc_storeStrong((id *)&self->_localeIdentifier, 0);
  objc_storeStrong((id *)&self->_lastSyncDates, 0);
  objc_storeStrong((id *)&self->_group, 0);
  objc_storeStrong((id *)&self->_connectionPolicyHostname, 0);
  objc_storeStrong((id *)&self->_connectionPolicyDate, 0);
  objc_storeStrong((id *)&self->_connectionPolicy, 0);
  objc_storeStrong((id *)&self->_aceHost, 0);
  objc_storeStrong((id *)&self->_predefinedServer, 0);
  objc_storeStrong((id *)&self->_peerHostname, 0);
  objc_storeStrong((id *)&self->_peerLanguageCode, 0);
  objc_storeStrong((id *)&self->_peerUserAgentString, 0);
  objc_storeStrong((id *)&self->_peerSpeechIdentifier, 0);
  objc_storeStrong((id *)&self->_peerLoggingAssistantIdentifier, 0);
  objc_storeStrong((id *)&self->_peerAssistantIdentifier, 0);
  objc_storeStrong((id *)&self->_hostname, 0);
  objc_storeStrong((id *)&self->_speechIdentifier, 0);
  objc_storeStrong((id *)&self->_loggingAssistantIdentifier, 0);
  objc_storeStrong((id *)&self->_assistantIdentifier, 0);
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
