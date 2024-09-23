@implementation DAHydraKeyInformation

+ (id)withEndpoint:(id)a3
{
  id v3;
  _QWORD *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;

  v3 = a3;
  v4 = (_QWORD *)objc_opt_new();
  objc_msgSend(v3, "certificates");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v4[1];
  v4[1] = v5;

  objc_msgSend(v3, "appletIdentifier");
  v7 = objc_claimAutoreleasedReturnValue();

  v8 = (void *)v4[2];
  v4[2] = v7;

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  NSArray *certificateChain;
  id v5;

  certificateChain = self->_certificateChain;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", certificateChain, CFSTR("certificateChain"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_appletIdentifier, CFSTR("appletIdentifier"));

}

- (DAHydraKeyInformation)initWithCoder:(id)a3
{
  id v4;
  DAHydraKeyInformation *v5;
  uint64_t v6;
  NSArray *certificateChain;
  uint64_t v8;
  NSData *appletIdentifier;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)DAHydraKeyInformation;
  v5 = -[DAHydraKeyInformation init](&v11, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeArrayOfObjectsOfClass:forKey:", objc_opt_class(), CFSTR("certificateChain"));
    v6 = objc_claimAutoreleasedReturnValue();
    certificateChain = v5->_certificateChain;
    v5->_certificateChain = (NSArray *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("appletIdentifier"));
    v8 = objc_claimAutoreleasedReturnValue();
    appletIdentifier = v5->_appletIdentifier;
    v5->_appletIdentifier = (NSData *)v8;

  }
  return v5;
}

- (NSArray)certificateChain
{
  return (NSArray *)objc_getProperty(self, a2, 8, 1);
}

- (NSData)appletIdentifier
{
  return (NSData *)objc_getProperty(self, a2, 16, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appletIdentifier, 0);
  objc_storeStrong((id *)&self->_certificateChain, 0);
}

@end
