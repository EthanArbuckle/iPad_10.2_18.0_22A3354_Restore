@implementation FCEmbedProxyConfiguration

- (FCEmbedProxyConfiguration)initWithDictionary:(id)a3
{
  id v4;
  FCEmbedProxyConfiguration *v5;
  uint64_t v6;
  NSString *proxyHost;
  uint64_t v8;
  NSString *proxyAutoConfig;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)FCEmbedProxyConfiguration;
  v5 = -[FCEmbedProxyConfiguration init](&v11, sel_init);
  if (v5)
  {
    FCAppConfigurationStringValue(v4, (uint64_t)CFSTR("proxyHost"), 0);
    v6 = objc_claimAutoreleasedReturnValue();
    proxyHost = v5->_proxyHost;
    v5->_proxyHost = (NSString *)v6;

    FCAppConfigurationStringValue(v4, (uint64_t)CFSTR("proxyAutoConfig"), 0);
    v8 = objc_claimAutoreleasedReturnValue();
    proxyAutoConfig = v5->_proxyAutoConfig;
    v5->_proxyAutoConfig = (NSString *)v8;

    v5->_usePrivateRelay = +[FCFeatureEnablementChecker enabledForCurrentLevel:](FCFeatureEnablementChecker, "enabledForCurrentLevel:", FCAppConfigurationIntegerValue(v4, (uint64_t)CFSTR("usePrivateRelay"), 0));
  }

  return v5;
}

- (NSString)proxyHost
{
  return self->_proxyHost;
}

- (NSString)proxyAutoConfig
{
  return self->_proxyAutoConfig;
}

- (BOOL)usePrivateRelay
{
  return self->_usePrivateRelay;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_proxyAutoConfig, 0);
  objc_storeStrong((id *)&self->_proxyHost, 0);
}

@end
