@implementation NFRemoteAdminCardIngestionRequest

- (NFRemoteAdminCardIngestionRequest)initWithCoder:(id)a3
{
  id v4;
  NFRemoteAdminCardIngestionRequest *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  NSString *serverIdentifier;
  uint64_t v13;
  NSString *uri;
  uint64_t v15;
  NSString *sessionToken;
  uint64_t v17;
  NSDictionary *cardServiceInfo;
  objc_super v20;

  v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)NFRemoteAdminCardIngestionRequest;
  v5 = -[NFRemoteAdminCardIngestionRequest init](&v20, sel_init);
  if (v5)
  {
    v6 = objc_alloc(MEMORY[0x1E0C99E60]);
    v7 = objc_opt_class();
    v8 = objc_opt_class();
    v9 = objc_opt_class();
    v10 = (void *)objc_msgSend(v6, "initWithObjects:", v7, v8, v9, objc_opt_class(), 0);
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("serverIdentifier"));
    v11 = objc_claimAutoreleasedReturnValue();
    serverIdentifier = v5->_serverIdentifier;
    v5->_serverIdentifier = (NSString *)v11;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("uri"));
    v13 = objc_claimAutoreleasedReturnValue();
    uri = v5->_uri;
    v5->_uri = (NSString *)v13;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("sessionToken"));
    v15 = objc_claimAutoreleasedReturnValue();
    sessionToken = v5->_sessionToken;
    v5->_sessionToken = (NSString *)v15;

    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v10, CFSTR("cardServiceInfo"));
    v17 = objc_claimAutoreleasedReturnValue();
    cardServiceInfo = v5->_cardServiceInfo;
    v5->_cardServiceInfo = (NSDictionary *)v17;

    v5->_maxDetectionTimeout = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("maxDetectionTimeout"));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *serverIdentifier;
  id v5;

  serverIdentifier = self->_serverIdentifier;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", serverIdentifier, CFSTR("serverIdentifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_uri, CFSTR("uri"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_sessionToken, CFSTR("sessionToken"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_cardServiceInfo, CFSTR("cardServiceInfo"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_maxDetectionTimeout, CFSTR("maxDetectionTimeout"));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)cardIngestionRequestWithServerIdentifier:(id)a3 sessionToken:(id)a4 readerModeMetadata:(id)a5 maxDetectionTimeout:(unint64_t)a6
{
  id v9;
  id v10;
  id v11;
  NFRemoteAdminCardIngestionRequest *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  v9 = a5;
  v10 = a4;
  v11 = a3;
  v12 = objc_alloc_init(NFRemoteAdminCardIngestionRequest);
  -[NFRemoteAdminCardIngestionRequest setServerIdentifier:](v12, "setServerIdentifier:", v11);

  -[NFRemoteAdminCardIngestionRequest setSessionToken:](v12, "setSessionToken:", v10);
  -[NFRemoteAdminCardIngestionRequest setMaxDetectionTimeout:](v12, "setMaxDetectionTimeout:", a6);
  objc_msgSend(v9, "NF_stringForKey:", CFSTR("redirectURI"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v14)
  {
    v16 = (void *)objc_opt_new();
    -[NFRemoteAdminCardIngestionRequest setUri:](v12, "setUri:", v16);

    if (v9)
      goto LABEL_3;
LABEL_5:
    v15 = (void *)objc_opt_new();
    goto LABEL_6;
  }
  -[NFRemoteAdminCardIngestionRequest setUri:](v12, "setUri:", v13);
  if (!v9)
    goto LABEL_5;
LABEL_3:
  v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithDictionary:", v9);
  objc_msgSend(v15, "removeObjectForKey:", CFSTR("redirectURI"));
LABEL_6:
  -[NFRemoteAdminCardIngestionRequest setCardServiceInfo:](v12, "setCardServiceInfo:", v15);

  return v12;
}

- (NSString)serverIdentifier
{
  return self->_serverIdentifier;
}

- (void)setServerIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_serverIdentifier, a3);
}

- (NSString)uri
{
  return self->_uri;
}

- (void)setUri:(id)a3
{
  objc_storeStrong((id *)&self->_uri, a3);
}

- (NSString)sessionToken
{
  return self->_sessionToken;
}

- (void)setSessionToken:(id)a3
{
  objc_storeStrong((id *)&self->_sessionToken, a3);
}

- (NSDictionary)cardServiceInfo
{
  return self->_cardServiceInfo;
}

- (void)setCardServiceInfo:(id)a3
{
  objc_storeStrong((id *)&self->_cardServiceInfo, a3);
}

- (unint64_t)maxDetectionTimeout
{
  return self->_maxDetectionTimeout;
}

- (void)setMaxDetectionTimeout:(unint64_t)a3
{
  self->_maxDetectionTimeout = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cardServiceInfo, 0);
  objc_storeStrong((id *)&self->_sessionToken, 0);
  objc_storeStrong((id *)&self->_uri, 0);
  objc_storeStrong((id *)&self->_serverIdentifier, 0);
}

@end
