@implementation VSAccountMetadataRequest

- (VSAccountMetadataRequest)init
{
  VSAccountMetadataRequest *v2;
  void *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)VSAccountMetadataRequest;
  v2 = -[VSAccountMetadataRequest init](&v5, sel_init);
  if (v2)
  {
    VSAccountMetadataRequestValueType();
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    VSValueTypeInit(v3, v2);

  }
  return v2;
}

- (VSAccountMetadataRequest)initWithCoder:(id)a3
{
  id v4;
  VSAccountMetadataRequest *v5;
  void *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)VSAccountMetadataRequest;
  v5 = -[VSAccountMetadataRequest init](&v8, sel_init);
  if (v5)
  {
    VSAccountMetadataRequestValueType();
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
  VSAccountMetadataRequestValueType();
  v5 = (id)objc_claimAutoreleasedReturnValue();
  VSValueTypeEncodeWithCoder(v5, self, v4);

}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v5;
  void *v6;

  VSAccountMetadataRequestValueType();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  VSValueTypeCopyWithZone(v5, self, (uint64_t)a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (unint64_t)hash
{
  void *v3;
  unint64_t v4;

  VSAccountMetadataRequestValueType();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = VSValueTypeHash(v3, self);

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  VSAccountMetadataRequestValueType();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = VSValueTypeIsEqual(v5, self, v4);

  return (char)self;
}

- (id)description
{
  void *v3;
  void *v4;

  VSAccountMetadataRequestValueType();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  VSValueTypeDescription(v3, self);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)setAttributeNames:(NSArray *)attributeNames
{
  NSArray *v4;
  NSArray *v5;
  NSArray *v6;
  NSArray *v7;

  v4 = attributeNames;
  v7 = v4;
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("The attributeNames parameter must not be nil."));
    v4 = 0;
  }
  if (self->_attributeNames != v4)
  {
    v5 = (NSArray *)-[NSArray copy](v7, "copy");
    v6 = self->_attributeNames;
    self->_attributeNames = v5;

    v4 = v7;
  }

}

- (void)setSupportedAccountProviderIdentifiers:(NSArray *)supportedAccountProviderIdentifiers
{
  NSArray *v4;
  NSArray *v5;
  NSArray *v6;
  NSArray *v7;

  v4 = supportedAccountProviderIdentifiers;
  v7 = v4;
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("The supportedAccountProviderIdentifiers parameter must not be nil."));
    v4 = 0;
  }
  if (self->_supportedAccountProviderIdentifiers != v4)
  {
    v5 = (NSArray *)-[NSArray copy](v7, "copy");
    v6 = self->_supportedAccountProviderIdentifiers;
    self->_supportedAccountProviderIdentifiers = v5;

    v4 = v7;
  }

}

- (void)setFeaturedAccountProviderIdentifiers:(NSArray *)featuredAccountProviderIdentifiers
{
  NSArray *v4;
  NSArray *v5;
  NSArray *v6;
  NSArray *v7;

  v4 = featuredAccountProviderIdentifiers;
  v7 = v4;
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("The featuredAccountProviderIdentifiers parameter must not be nil."));
    v4 = 0;
  }
  if (self->_featuredAccountProviderIdentifiers != v4)
  {
    v5 = (NSArray *)-[NSArray copy](v7, "copy");
    v6 = self->_featuredAccountProviderIdentifiers;
    self->_featuredAccountProviderIdentifiers = v5;

    v4 = v7;
  }

}

- (NSString)channelIdentifier
{
  return self->_channelIdentifier;
}

- (void)setChannelIdentifier:(NSString *)channelIdentifier
{
  objc_setProperty_nonatomic_copy(self, a2, channelIdentifier, 16);
}

- (NSArray)supportedAccountProviderIdentifiers
{
  return self->_supportedAccountProviderIdentifiers;
}

- (NSArray)featuredAccountProviderIdentifiers
{
  return self->_featuredAccountProviderIdentifiers;
}

- (NSString)verificationToken
{
  return self->_verificationToken;
}

- (void)setVerificationToken:(NSString *)verificationToken
{
  objc_setProperty_nonatomic_copy(self, a2, verificationToken, 40);
}

- (BOOL)includeAccountProviderIdentifier
{
  return self->_includeAccountProviderIdentifier;
}

- (void)setIncludeAccountProviderIdentifier:(BOOL)includeAccountProviderIdentifier
{
  self->_includeAccountProviderIdentifier = includeAccountProviderIdentifier;
}

- (BOOL)includeAuthenticationExpirationDate
{
  return self->_includeAuthenticationExpirationDate;
}

- (void)setIncludeAuthenticationExpirationDate:(BOOL)includeAuthenticationExpirationDate
{
  self->_includeAuthenticationExpirationDate = includeAuthenticationExpirationDate;
}

- (NSString)localizedVideoTitle
{
  return self->_localizedVideoTitle;
}

- (void)setLocalizedVideoTitle:(NSString *)localizedVideoTitle
{
  objc_setProperty_nonatomic_copy(self, a2, localizedVideoTitle, 48);
}

- (BOOL)isInterruptionAllowed
{
  return self->_interruptionAllowed;
}

- (void)setInterruptionAllowed:(BOOL)interruptionAllowed
{
  self->_interruptionAllowed = interruptionAllowed;
}

- (BOOL)forceAuthentication
{
  return self->_forceAuthentication;
}

- (void)setForceAuthentication:(BOOL)forceAuthentication
{
  self->_forceAuthentication = forceAuthentication;
}

- (NSArray)attributeNames
{
  return self->_attributeNames;
}

- (NSArray)supportedAuthenticationSchemes
{
  return self->_supportedAuthenticationSchemes;
}

- (void)setSupportedAuthenticationSchemes:(NSArray *)supportedAuthenticationSchemes
{
  objc_setProperty_nonatomic_copy(self, a2, supportedAuthenticationSchemes, 64);
}

- (NSString)accountProviderAuthenticationToken
{
  return self->_accountProviderAuthenticationToken;
}

- (void)setAccountProviderAuthenticationToken:(NSString *)accountProviderAuthenticationToken
{
  objc_setProperty_nonatomic_copy(self, a2, accountProviderAuthenticationToken, 72);
}

- (NSArray)applicationAccountProviders
{
  return self->_applicationAccountProviders;
}

- (void)setApplicationAccountProviders:(NSArray *)applicationAccountProviders
{
  objc_setProperty_nonatomic_copy(self, a2, applicationAccountProviders, 80);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_applicationAccountProviders, 0);
  objc_storeStrong((id *)&self->_accountProviderAuthenticationToken, 0);
  objc_storeStrong((id *)&self->_supportedAuthenticationSchemes, 0);
  objc_storeStrong((id *)&self->_attributeNames, 0);
  objc_storeStrong((id *)&self->_localizedVideoTitle, 0);
  objc_storeStrong((id *)&self->_verificationToken, 0);
  objc_storeStrong((id *)&self->_featuredAccountProviderIdentifiers, 0);
  objc_storeStrong((id *)&self->_supportedAccountProviderIdentifiers, 0);
  objc_storeStrong((id *)&self->_channelIdentifier, 0);
}

@end
