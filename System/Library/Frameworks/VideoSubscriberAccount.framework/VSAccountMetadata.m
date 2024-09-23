@implementation VSAccountMetadata

- (VSAccountMetadata)init
{
  VSAccountMetadata *v2;
  void *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)VSAccountMetadata;
  v2 = -[VSAccountMetadata init](&v5, sel_init);
  if (v2)
  {
    VSAccountMetadataValueType();
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    VSValueTypeInit(v3, v2);

  }
  return v2;
}

- (VSAccountMetadata)initWithCoder:(id)a3
{
  id v4;
  VSAccountMetadata *v5;
  void *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)VSAccountMetadata;
  v5 = -[VSAccountMetadata init](&v8, sel_init);
  if (v5)
  {
    VSAccountMetadataValueType();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    VSValueTypeInitWithCoder(v6, v5, v4);

  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  VSAccountMetadataValueType();
  v5 = (id)objc_claimAutoreleasedReturnValue();
  VSValueTypeEncodeWithCoder(v5, self, v4);

}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v5;
  void *v6;

  VSAccountMetadataValueType();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  VSValueTypeCopyWithZone(v5, self, (uint64_t)a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (unint64_t)hash
{
  void *v3;
  unint64_t v4;

  VSAccountMetadataValueType();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = VSValueTypeHash(v3, self);

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  VSAccountMetadataValueType();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = VSValueTypeIsEqual(v5, self, v4);

  return (char)self;
}

- (id)description
{
  void *v3;
  void *v4;

  VSAccountMetadataValueType();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  VSValueTypeDescription(v3, self);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (NSString)SAMLAttributeQueryResponse
{
  void *v2;
  void *v3;
  int v4;
  void *v5;

  -[VSAccountMetadata accountProviderResponse](self, "accountProviderResponse");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "authenticationScheme");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqual:", CFSTR("SAML"));

  if (v4)
  {
    objc_msgSend(v2, "body");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }

  return (NSString *)v5;
}

- (NSString)accountProviderIdentifier
{
  return self->_accountProviderIdentifier;
}

- (void)setAccountProviderIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSDate)authenticationExpirationDate
{
  return self->_authenticationExpirationDate;
}

- (void)setAuthenticationExpirationDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSData)verificationData
{
  return self->_verificationData;
}

- (void)setVerificationData:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (VSAccountProviderResponse)accountProviderResponse
{
  return self->_accountProviderResponse;
}

- (void)setAccountProviderResponse:(id)a3
{
  objc_storeStrong((id *)&self->_accountProviderResponse, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accountProviderResponse, 0);
  objc_storeStrong((id *)&self->_verificationData, 0);
  objc_storeStrong((id *)&self->_authenticationExpirationDate, 0);
  objc_storeStrong((id *)&self->_accountProviderIdentifier, 0);
}

@end
