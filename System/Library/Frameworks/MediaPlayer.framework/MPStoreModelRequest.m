@implementation MPStoreModelRequest

- (MPStoreModelRequest)init
{
  MPStoreModelRequest *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MPStoreModelRequest;
  result = -[MPStoreModelRequest init](&v3, sel_init);
  if (result)
  {
    result->_timeoutInterval = 60.0;
    result->_authenticationOptions = 0;
  }
  return result;
}

- (MPStoreModelRequest)initWithCoder:(id)a3
{
  id v4;
  MPStoreModelRequest *v5;
  double v6;
  uint64_t v7;
  NSString *clientIdentifier;
  uint64_t v9;
  NSString *clientVersion;
  uint64_t v11;
  NSString *clientPlatformIdentifier;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)MPStoreModelRequest;
  v5 = -[MPModelRequest initWithCoder:](&v14, sel_initWithCoder_, v4);
  if (v5)
  {
    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("MPStoreModelRequestTimeoutInterval")))
    {
      objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("MPStoreModelRequestTimeoutInterval"));
      v5->_timeoutInterval = v6;
    }
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("MPStoreModelRequestClientIdentifier"));
    v7 = objc_claimAutoreleasedReturnValue();
    clientIdentifier = v5->_clientIdentifier;
    v5->_clientIdentifier = (NSString *)v7;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("MPStoreModelRequestClientVersion"));
    v9 = objc_claimAutoreleasedReturnValue();
    clientVersion = v5->_clientVersion;
    v5->_clientVersion = (NSString *)v9;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("MPStoreModelRequestClientPlatformIdentifier"));
    v11 = objc_claimAutoreleasedReturnValue();
    clientPlatformIdentifier = v5->_clientPlatformIdentifier;
    v5->_clientPlatformIdentifier = (NSString *)v11;

    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("MPStoreModelRequestAuthenticationOptions")))
      v5->_authenticationOptions = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("MPStoreModelRequestAuthenticationOptions"));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v4 = a3;
  v5.receiver = self;
  v5.super_class = (Class)MPStoreModelRequest;
  -[MPModelRequest encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  if (self->_didSetTimeoutInterval)
    objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("MPStoreModelRequestTimeoutInterval"), self->_timeoutInterval);
  objc_msgSend(v4, "encodeObject:forKey:", self->_clientIdentifier, CFSTR("MPStoreModelRequestClientIdentifier"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_clientVersion, CFSTR("MPStoreModelRequestClientVersion"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_clientPlatformIdentifier, CFSTR("MPStoreModelRequestClientPlatformIdentifier"));
  objc_msgSend(v4, "encodeInteger:forKey:", self->_authenticationOptions, CFSTR("MPStoreModelRequestAuthenticationOptions"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  _QWORD *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)MPStoreModelRequest;
  v5 = -[MPModelRequest copyWithZone:](&v14, sel_copyWithZone_);
  v6 = v5;
  if (v5)
  {
    v5[9] = *(_QWORD *)&self->_timeoutInterval;
    *((_BYTE *)v5 + 64) = self->_didSetTimeoutInterval;
    v7 = -[NSString copyWithZone:](self->_clientIdentifier, "copyWithZone:", a3);
    v8 = (void *)v6[10];
    v6[10] = v7;

    v9 = -[NSString copyWithZone:](self->_clientVersion, "copyWithZone:", a3);
    v10 = (void *)v6[11];
    v6[11] = v9;

    v11 = -[NSString copyWithZone:](self->_clientPlatformIdentifier, "copyWithZone:", a3);
    v12 = (void *)v6[12];
    v6[12] = v11;

    v6[13] = self->_authenticationOptions;
  }
  return v6;
}

- (void)setTimeoutInterval:(double)a3
{
  self->_didSetTimeoutInterval = 1;
  self->_timeoutInterval = a3;
}

- (double)timeoutInterval
{
  return self->_timeoutInterval;
}

- (NSString)clientIdentifier
{
  return self->_clientIdentifier;
}

- (void)setClientIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (NSString)clientVersion
{
  return self->_clientVersion;
}

- (void)setClientVersion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (NSString)clientPlatformIdentifier
{
  return self->_clientPlatformIdentifier;
}

- (void)setClientPlatformIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (unint64_t)authenticationOptions
{
  return self->_authenticationOptions;
}

- (void)setAuthenticationOptions:(unint64_t)a3
{
  self->_authenticationOptions = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clientPlatformIdentifier, 0);
  objc_storeStrong((id *)&self->_clientVersion, 0);
  objc_storeStrong((id *)&self->_clientIdentifier, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (BOOL)requiresNetwork
{
  return 1;
}

@end
