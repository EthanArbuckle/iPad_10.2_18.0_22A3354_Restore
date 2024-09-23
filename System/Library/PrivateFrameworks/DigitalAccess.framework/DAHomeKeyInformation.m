@implementation DAHomeKeyInformation

+ (id)withEndpoint:(id)a3
{
  id v3;
  _QWORD *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;

  v3 = a3;
  v4 = (_QWORD *)objc_opt_new();
  objc_msgSend(v3, "appletIdentifier");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v4[1];
  v4[1] = v5;

  objc_msgSend(v3, "publicKey");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v4[2];
  v4[2] = v7;

  objc_msgSend(v3, "readerIdentifier");
  v9 = objc_claimAutoreleasedReturnValue();

  v10 = (void *)v4[3];
  v4[3] = v9;

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  NSData *appletIdentifier;
  id v5;

  appletIdentifier = self->_appletIdentifier;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", appletIdentifier, CFSTR("appletIdentifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_publicKey, CFSTR("publicKey"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_readerIdentifier, CFSTR("readerIdentifier"));

}

- (DAHomeKeyInformation)initWithCoder:(id)a3
{
  id v4;
  DAHomeKeyInformation *v5;
  uint64_t v6;
  NSData *appletIdentifier;
  uint64_t v8;
  NSData *publicKey;
  uint64_t v10;
  NSData *readerIdentifier;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)DAHomeKeyInformation;
  v5 = -[DAHomeKeyInformation init](&v13, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("appletIdentifier"));
    v6 = objc_claimAutoreleasedReturnValue();
    appletIdentifier = v5->_appletIdentifier;
    v5->_appletIdentifier = (NSData *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("publicKey"));
    v8 = objc_claimAutoreleasedReturnValue();
    publicKey = v5->_publicKey;
    v5->_publicKey = (NSData *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("readerIdentifier"));
    v10 = objc_claimAutoreleasedReturnValue();
    readerIdentifier = v5->_readerIdentifier;
    v5->_readerIdentifier = (NSData *)v10;

  }
  return v5;
}

- (NSData)appletIdentifier
{
  return (NSData *)objc_getProperty(self, a2, 8, 1);
}

- (NSData)publicKey
{
  return (NSData *)objc_getProperty(self, a2, 16, 1);
}

- (NSData)readerIdentifier
{
  return (NSData *)objc_getProperty(self, a2, 24, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_readerIdentifier, 0);
  objc_storeStrong((id *)&self->_publicKey, 0);
  objc_storeStrong((id *)&self->_appletIdentifier, 0);
}

@end
