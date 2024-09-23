@implementation VSViewServiceRequest

- (VSViewServiceRequest)init
{
  VSViewServiceRequest *v2;
  void *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)VSViewServiceRequest;
  v2 = -[VSViewServiceRequest init](&v5, sel_init);
  if (v2)
  {
    VSViewServiceRequestValueType();
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    VSValueTypeInit(v3, v2);

  }
  return v2;
}

- (VSViewServiceRequest)initWithCoder:(id)a3
{
  id v4;
  VSViewServiceRequest *v5;
  void *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)VSViewServiceRequest;
  v5 = -[VSViewServiceRequest init](&v8, sel_init);
  if (v5)
  {
    VSViewServiceRequestValueType();
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
  VSViewServiceRequestValueType();
  v5 = (id)objc_claimAutoreleasedReturnValue();
  VSValueTypeEncodeWithCoder(v5, self, v4);

}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v5;
  void *v6;

  VSViewServiceRequestValueType();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  VSValueTypeCopyWithZone(v5, self, (uint64_t)a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (unint64_t)hash
{
  void *v3;
  unint64_t v4;

  VSViewServiceRequestValueType();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = VSValueTypeHash(v3, self);

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  VSViewServiceRequestValueType();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = VSValueTypeIsEqual(v5, self, v4);

  return (char)self;
}

- (id)description
{
  void *v3;
  void *v4;

  VSViewServiceRequestValueType();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  VSValueTypeDescription(v3, self);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BOOL)allowsAuthenticationUI
{
  void *v2;
  char v3;

  -[VSViewServiceRequest accountMetadataRequest](self, "accountMetadataRequest");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isInterruptionAllowed");

  return v3;
}

- (NSArray)supportedIdentityProviderIdentifiers
{
  void *v2;
  void *v3;
  void *v4;

  -[VSViewServiceRequest accountMetadataRequest](self, "accountMetadataRequest");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "supportedAccountProviderIdentifiers");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = (void *)MEMORY[0x1E0C9AA60];
  }

  return (NSArray *)v4;
}

- (NSArray)featuredIdentityProviderIdentifiers
{
  void *v2;
  void *v3;
  void *v4;

  -[VSViewServiceRequest accountMetadataRequest](self, "accountMetadataRequest");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "featuredAccountProviderIdentifiers");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = (void *)MEMORY[0x1E0C9AA60];
  }

  return (NSArray *)v4;
}

- (NSArray)applicationAccountProviders
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;

  -[VSViewServiceRequest accountMetadataRequest](self, "accountMetadataRequest");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "applicationAccountProviders");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    if (v4)
      v6 = v4;
    else
      v6 = (id)MEMORY[0x1E0C9AA60];

  }
  else
  {
    v6 = (id)MEMORY[0x1E0C9AA60];
  }

  return (NSArray *)v6;
}

- (NSArray)supportedAccountProviderAuthenticationSchemes
{
  void *v2;
  void *v3;
  void *v4;

  -[VSViewServiceRequest accountMetadataRequest](self, "accountMetadataRequest");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "supportedAuthenticationSchemes");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = (void *)MEMORY[0x1E0C9AA60];
  }

  return (NSArray *)v4;
}

- (NSString)localizedVideoTitle
{
  void *v2;
  void *v3;
  void *v4;

  -[VSViewServiceRequest accountMetadataRequest](self, "accountMetadataRequest");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "localizedVideoTitle");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  return (NSString *)v4;
}

- (NSString)accountProviderAuthenticationToken
{
  void *v2;
  void *v3;
  void *v4;

  -[VSViewServiceRequest accountMetadataRequest](self, "accountMetadataRequest");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "accountProviderAuthenticationToken");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  return (NSString *)v4;
}

- (BOOL)isPreAuthRequest
{
  void *v2;
  void *v3;
  BOOL v4;

  -[VSViewServiceRequest accountMetadataRequest](self, "accountMetadataRequest");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accountProviderAuthenticationToken");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 != 0;

  return v4;
}

- (BOOL)allowsPrivacyUI
{
  return self->_allowsPrivacyUI;
}

- (void)setAllowsPrivacyUI:(BOOL)a3
{
  self->_allowsPrivacyUI = a3;
}

- (BOOL)requiresPrivacyUI
{
  return self->_requiresPrivacyUI;
}

- (void)setRequiresPrivacyUI:(BOOL)a3
{
  self->_requiresPrivacyUI = a3;
}

- (BOOL)canVetoAuthentication
{
  return self->_canVetoAuthentication;
}

- (void)setCanVetoAuthentication:(BOOL)a3
{
  self->_canVetoAuthentication = a3;
}

- (VSAccountMetadataRequest)accountMetadataRequest
{
  return self->_accountMetadataRequest;
}

- (void)setAccountMetadataRequest:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (BOOL)shouldInferFeaturedProviders
{
  return self->_shouldInferFeaturedProviders;
}

- (void)setShouldInferFeaturedProviders:(BOOL)a3
{
  self->_shouldInferFeaturedProviders = a3;
}

- (BOOL)shouldReturnErrorOnTVProviderFeatureUnsupportedByStorefront
{
  return self->_shouldReturnErrorOnTVProviderFeatureUnsupportedByStorefront;
}

- (void)setShouldReturnErrorOnTVProviderFeatureUnsupportedByStorefront:(BOOL)a3
{
  self->_shouldReturnErrorOnTVProviderFeatureUnsupportedByStorefront = a3;
}

- (VSOptional)requestingAppDisplayName
{
  return self->_requestingAppDisplayName;
}

- (void)setRequestingAppDisplayName:(id)a3
{
  objc_storeStrong((id *)&self->_requestingAppDisplayName, a3);
}

- (NSString)requestingAppAdamID
{
  return self->_requestingAppAdamID;
}

- (void)setRequestingAppAdamID:(id)a3
{
  objc_storeStrong((id *)&self->_requestingAppAdamID, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requestingAppAdamID, 0);
  objc_storeStrong((id *)&self->_requestingAppDisplayName, 0);
  objc_storeStrong((id *)&self->_accountMetadataRequest, 0);
}

@end
