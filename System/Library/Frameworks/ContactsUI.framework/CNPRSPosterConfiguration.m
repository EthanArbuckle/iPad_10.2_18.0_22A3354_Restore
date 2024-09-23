@implementation CNPRSPosterConfiguration

- (CNPRSPosterConfiguration)initWithPosterConfiguration:(id)a3
{
  id v5;
  CNPRSPosterConfiguration *v6;
  CNPRSPosterConfiguration *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CNPRSPosterConfiguration;
  v6 = -[CNPRSPosterConfiguration init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_wrappedPosterConfiguration, a3);

  return v7;
}

- (id)loadUserInfoWithError:(id *)a3
{
  return (id)-[PRSPosterConfiguration loadUserInfoWithError:](self->_wrappedPosterConfiguration, "loadUserInfoWithError:", a3);
}

- (id)serverUUID
{
  return (id)-[PRSPosterConfiguration serverUUID](self->_wrappedPosterConfiguration, "serverUUID");
}

- (NSURL)assetDirectory
{
  return (NSURL *)-[PRSPosterConfiguration assetDirectory](self->_wrappedPosterConfiguration, "assetDirectory");
}

- (NSString)providerBundleIdentifier
{
  return (NSString *)-[PRSPosterConfiguration providerBundleIdentifier](self->_wrappedPosterConfiguration, "providerBundleIdentifier");
}

- (PRSPosterConfiguration)wrappedPosterConfiguration
{
  return self->_wrappedPosterConfiguration;
}

- (void)setAssetDirectory:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assetDirectory, 0);
  objc_storeStrong((id *)&self->_wrappedPosterConfiguration, 0);
}

@end
