@implementation MPCPlaybackSharedListeningProperties

- (MPCPlaybackSharedListeningProperties)initWithCoder:(id)a3
{
  id v4;
  MPCPlaybackSharedListeningProperties *v5;
  uint64_t v6;
  NSString *sessionIdentifier;
  uint64_t v8;
  NSString *sessionKey;

  v4 = a3;
  v5 = -[MPCPlaybackSharedListeningProperties init](self, "init");
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("sid"));
    v6 = objc_claimAutoreleasedReturnValue();
    sessionIdentifier = v5->_sessionIdentifier;
    v5->_sessionIdentifier = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("skey"));
    v8 = objc_claimAutoreleasedReturnValue();
    sessionKey = v5->_sessionKey;
    v5->_sessionKey = (NSString *)v8;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *sessionIdentifier;
  id v5;

  sessionIdentifier = self->_sessionIdentifier;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", sessionIdentifier, CFSTR("sid"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_sessionKey, CFSTR("skey"));

}

- (NSString)description
{
  return (NSString *)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("<%@ %p: sessionID=%@>"), objc_opt_class(), self, self->_sessionIdentifier);
}

- (NSString)sessionIdentifier
{
  return self->_sessionIdentifier;
}

- (NSString)sessionKey
{
  return self->_sessionKey;
}

- (ICLiveLink)liveLink
{
  return self->_liveLink;
}

- (void)setLiveLink:(id)a3
{
  objc_storeStrong((id *)&self->_liveLink, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_liveLink, 0);
  objc_storeStrong((id *)&self->_sessionKey, 0);
  objc_storeStrong((id *)&self->_sessionIdentifier, 0);
}

+ (MPCPlaybackSharedListeningProperties)propertiesWithSessionIdentifier:(id)a3 sessionKey:(id)a4
{
  id v5;
  id v6;
  MPCPlaybackSharedListeningProperties *v7;
  uint64_t v8;
  NSString *sessionIdentifier;
  uint64_t v10;
  NSString *sessionKey;

  v5 = a4;
  v6 = a3;
  v7 = objc_alloc_init(MPCPlaybackSharedListeningProperties);
  v8 = objc_msgSend(v6, "copy");

  sessionIdentifier = v7->_sessionIdentifier;
  v7->_sessionIdentifier = (NSString *)v8;

  v10 = objc_msgSend(v5, "copy");
  sessionKey = v7->_sessionKey;
  v7->_sessionKey = (NSString *)v10;

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)mpc_jsonValue
{
  void *v3;
  uint64_t v4;
  void *v5;
  const __CFString *v6;
  void *v7;
  _QWORD v9[2];
  _QWORD v10[3];

  v10[2] = *MEMORY[0x24BDAC8D0];
  v9[0] = CFSTR("sessionID");
  -[MPCPlaybackSharedListeningProperties sessionIdentifier](self, "sessionIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v9[1] = CFSTR("sessionKey");
  v10[0] = v3;
  -[MPCPlaybackSharedListeningProperties sessionKey](self, "sessionKey");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)v4;
  v6 = &stru_24CABB5D0;
  if (v4)
    v6 = (const __CFString *)v4;
  v10[1] = v6;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v10, v9, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)payloadValueFromJSONValue:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = a3;
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("sessionID"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("sessionKey"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  +[MPCPlaybackSharedListeningProperties propertiesWithSessionIdentifier:sessionKey:](MPCPlaybackSharedListeningProperties, "propertiesWithSessionIdentifier:sessionKey:", v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

@end
