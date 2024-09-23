@implementation CRKHostResourcesConfiguration

- (CRKHostResourcesConfiguration)initWithResourceURLs:(id)a3 serverIdentity:(id)a4 trustedCertificates:(id)a5
{
  id v8;
  id v9;
  id v10;
  CRKHostResourcesConfiguration *v11;
  uint64_t v12;
  NSArray *resourceURLs;
  uint64_t v14;
  NSArray *trustedCertificates;
  objc_super v17;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v17.receiver = self;
  v17.super_class = (Class)CRKHostResourcesConfiguration;
  v11 = -[CRKHostResourcesConfiguration init](&v17, sel_init);
  if (v11)
  {
    v12 = objc_msgSend(v8, "copy");
    resourceURLs = v11->_resourceURLs;
    v11->_resourceURLs = (NSArray *)v12;

    objc_storeStrong((id *)&v11->_serverIdentity, a4);
    v14 = objc_msgSend(v10, "copy");
    trustedCertificates = v11->_trustedCertificates;
    v11->_trustedCertificates = (NSArray *)v14;

    v11->_port = 3284;
  }

  return v11;
}

- (CRKIPAddressProviding)IPAddressProvider
{
  CRKIPAddressProviding *IPAddressProvider;
  CRKIPAddressProviding *v4;
  CRKIPAddressProviding *v5;

  IPAddressProvider = self->_IPAddressProvider;
  if (!IPAddressProvider)
  {
    v4 = (CRKIPAddressProviding *)objc_opt_new();
    v5 = self->_IPAddressProvider;
    self->_IPAddressProvider = v4;

    IPAddressProvider = self->_IPAddressProvider;
  }
  return IPAddressProvider;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4;

  v4 = objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithResourceURLs:serverIdentity:trustedCertificates:", self->_resourceURLs, self->_serverIdentity, self->_trustedCertificates);
  *(_QWORD *)(v4 + 40) = self->_maximumAllowedDownloads;
  *(_WORD *)(v4 + 8) = self->_port;
  objc_storeStrong((id *)(v4 + 48), self->_IPAddressProvider);
  return (id)v4;
}

- (CRKHostResourcesConfiguration)initWithResourceURLs:(id)a3 serverIdentity:(id)a4 trustedAnchorCertificates:(id)a5
{
  id v8;
  id v9;
  id v10;
  CRKConcreteIdentity *v11;
  void *v12;
  CRKHostResourcesConfiguration *v13;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = -[CRKConcreteIdentity initWithIdentity:]([CRKConcreteIdentity alloc], "initWithIdentity:", v9);

  objc_msgSend(v8, "crk_mapUsingBlock:", &__block_literal_global_32);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = -[CRKHostResourcesConfiguration initWithResourceURLs:serverIdentity:trustedCertificates:](self, "initWithResourceURLs:serverIdentity:trustedCertificates:", v10, v11, v12);
  return v13;
}

CRKConcreteCertificate *__95__CRKHostResourcesConfiguration_initWithResourceURLs_serverIdentity_trustedAnchorCertificates___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  CRKConcreteCertificate *v3;

  v2 = a2;
  v3 = -[CRKConcreteCertificate initWithCertificate:]([CRKConcreteCertificate alloc], "initWithCertificate:", v2);

  return v3;
}

- (NSArray)resourceURLs
{
  return self->_resourceURLs;
}

- (CRKIdentity)serverIdentity
{
  return self->_serverIdentity;
}

- (NSArray)trustedCertificates
{
  return self->_trustedCertificates;
}

- (unint64_t)maximumAllowedDownloads
{
  return self->_maximumAllowedDownloads;
}

- (void)setMaximumAllowedDownloads:(unint64_t)a3
{
  self->_maximumAllowedDownloads = a3;
}

- (unsigned)port
{
  return self->_port;
}

- (void)setPort:(unsigned __int16)a3
{
  self->_port = a3;
}

- (void)setIPAddressProvider:(id)a3
{
  objc_storeStrong((id *)&self->_IPAddressProvider, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_IPAddressProvider, 0);
  objc_storeStrong((id *)&self->_trustedCertificates, 0);
  objc_storeStrong((id *)&self->_serverIdentity, 0);
  objc_storeStrong((id *)&self->_resourceURLs, 0);
}

@end
