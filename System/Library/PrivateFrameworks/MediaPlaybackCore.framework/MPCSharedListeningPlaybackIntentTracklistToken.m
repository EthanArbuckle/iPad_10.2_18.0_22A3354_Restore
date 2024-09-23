@implementation MPCSharedListeningPlaybackIntentTracklistToken

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (MPCSharedListeningPlaybackIntentTracklistToken)initWithCoder:(id)a3
{
  id v4;
  MPCSharedListeningPlaybackIntentTracklistToken *v5;
  uint64_t v6;
  MPCPlaybackSharedListeningProperties *sharedListeningProperties;
  uint64_t v8;
  ICLiveLinkIdentity *identity;

  v4 = a3;
  v5 = -[MPCSharedListeningPlaybackIntentTracklistToken init](self, "init");
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("tshlp"));
    v6 = objc_claimAutoreleasedReturnValue();
    sharedListeningProperties = v5->_sharedListeningProperties;
    v5->_sharedListeningProperties = (MPCPlaybackSharedListeningProperties *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("tid"));
    v8 = objc_claimAutoreleasedReturnValue();
    identity = v5->_identity;
    v5->_identity = (ICLiveLinkIdentity *)v8;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  MPCPlaybackSharedListeningProperties *sharedListeningProperties;
  id v5;

  sharedListeningProperties = self->_sharedListeningProperties;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", sharedListeningProperties, CFSTR("tshlp"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_identity, CFSTR("tid"));

}

- (MPCPlaybackSharedListeningProperties)sharedListeningProperties
{
  return self->_sharedListeningProperties;
}

- (void)setSharedListeningProperties:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (ICLiveLinkIdentity)identity
{
  return self->_identity;
}

- (void)setIdentity:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identity, 0);
  objc_storeStrong((id *)&self->_sharedListeningProperties, 0);
}

- (id)mpc_jsonValue
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[2];
  _QWORD v10[3];

  v10[2] = *MEMORY[0x24BDAC8D0];
  v9[0] = CFSTR("props");
  -[MPCSharedListeningPlaybackIntentTracklistToken sharedListeningProperties](self, "sharedListeningProperties");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "mpc_jsonValue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9[1] = CFSTR("identity");
  v10[0] = v4;
  -[MPCSharedListeningPlaybackIntentTracklistToken identity](self, "identity");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "mpc_jsonValue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[1] = v6;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v10, v9, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)payloadValueFromJSONValue:(id)a3
{
  id v3;
  MPCSharedListeningPlaybackIntentTracklistToken *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = a3;
  v4 = objc_alloc_init(MPCSharedListeningPlaybackIntentTracklistToken);
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("props"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[MPCPlaybackSharedListeningProperties payloadValueFromJSONValue:](MPCPlaybackSharedListeningProperties, "payloadValueFromJSONValue:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPCSharedListeningPlaybackIntentTracklistToken setSharedListeningProperties:](v4, "setSharedListeningProperties:", v6);

  v7 = (void *)MEMORY[0x24BEC8838];
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("identity"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "payloadValueFromJSONValue:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPCSharedListeningPlaybackIntentTracklistToken setIdentity:](v4, "setIdentity:", v9);

  return v4;
}

@end
