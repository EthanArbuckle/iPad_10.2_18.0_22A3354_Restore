@implementation AMSDeprecatedBagContract

- (AMSDeprecatedBagContract)initWithBag:(id)a3
{
  id v5;
  AMSDeprecatedBagContract *v6;
  AMSDeprecatedBagContract *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AMSDeprecatedBagContract;
  v6 = -[AMSDeprecatedBagContract init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_bag, a3);

  return v7;
}

- (AMSBagValue)appleMusicDeviceOfferDeepLink
{
  return (AMSBagValue *)-[AMSBagProtocol URLForKey:](self->_bag, "URLForKey:", 0x1E254C840);
}

- (AMSBagValue)iCloudDeviceOfferDeepLink
{
  return (AMSBagValue *)-[AMSBagProtocol URLForKey:](self->_bag, "URLForKey:", 0x1E254C860);
}

- (AMSBagValue)personalizedLookupURL
{
  return (AMSBagValue *)-[AMSBagProtocol URLForKey:](self->_bag, "URLForKey:", 0x1E254D320);
}

- (AMSBagValue)unpersonalizedLookupURL
{
  return (AMSBagValue *)-[AMSBagProtocol URLForKey:](self->_bag, "URLForKey:", 0x1E254D340);
}

- (AMSBagValue)metricsDictionary
{
  return (AMSBagValue *)-[AMSBagProtocol dictionaryForKey:](self->_bag, "dictionaryForKey:", 0x1E254BA80);
}

- (AMSBagValue)metricsUrl
{
  return (AMSBagValue *)-[AMSBagProtocol URLForKey:](self->_bag, "URLForKey:", 0x1E254CD60);
}

- (AMSBagValue)metricsURL
{
  return (AMSBagValue *)-[AMSBagProtocol URLForKey:](self->_bag, "URLForKey:", 0x1E254CD60);
}

- (AMSBagValue)mescalCertificateURL
{
  return (AMSBagValue *)-[AMSBagProtocol URLForKey:](self->_bag, "URLForKey:", CFSTR("sign-sap-setup-cert"));
}

- (AMSBagValue)mescalSetupURL
{
  return (AMSBagValue *)-[AMSBagProtocol URLForKey:](self->_bag, "URLForKey:", CFSTR("sign-sap-setup"));
}

- (AMSBagValue)mescalSignedActions
{
  return (AMSBagValue *)-[AMSBagProtocol dictionaryForKey:](self->_bag, "dictionaryForKey:", 0x1E254CCE0);
}

- (AMSBagValue)mescalSignSapRequests
{
  return (AMSBagValue *)-[AMSBagProtocol dictionaryForKey:](self->_bag, "dictionaryForKey:", 0x1E254CD00);
}

- (AMSBagValue)mescalSignSapResponses
{
  return (AMSBagValue *)-[AMSBagProtocol dictionaryForKey:](self->_bag, "dictionaryForKey:", 0x1E254CD20);
}

- (AMSBagValue)apsEnabledPatterns
{
  return (AMSBagValue *)-[AMSBagProtocol arrayForKey:](self->_bag, "arrayForKey:", 0x1E254C460);
}

- (AMSBagValue)apsSamplingPercent
{
  return (AMSBagValue *)-[AMSBagProtocol doubleForKey:](self->_bag, "doubleForKey:", 0x1E254C480);
}

- (AMSBagValue)apsAllowedProductTypes
{
  return (AMSBagValue *)-[AMSBagProtocol arrayForKey:](self->_bag, "arrayForKey:", 0x1E254C4A0);
}

- (AMSBagValue)guidRegexes
{
  return (AMSBagValue *)-[AMSBagProtocol arrayForKey:](self->_bag, "arrayForKey:", 0x1E254D240);
}

- (AMSBagValue)guidSchemes
{
  return (AMSBagValue *)-[AMSBagProtocol arrayForKey:](self->_bag, "arrayForKey:", 0x1E254D280);
}

- (AMSBagValue)storefrontSuffix
{
  return (AMSBagValue *)-[AMSBagProtocol stringForKey:](self->_bag, "stringForKey:", CFSTR("storefront-header-suffix"));
}

- (AMSBagValue)TLSSamplingPercentage
{
  return (AMSBagValue *)-[AMSBagProtocol doubleForKey:](self->_bag, "doubleForKey:", 0x1E254D360);
}

- (AMSBagValue)TLSSamplingSessionDuration
{
  return (AMSBagValue *)-[AMSBagProtocol integerForKey:](self->_bag, "integerForKey:", 0x1E254D380);
}

- (AMSBagValue)TFOSamplingPercentage
{
  return (AMSBagValue *)-[AMSBagProtocol doubleForKey:](self->_bag, "doubleForKey:", 0x1E254D3A0);
}

- (AMSBagValue)TFOSamplingSessionDuration
{
  return (AMSBagValue *)-[AMSBagProtocol integerForKey:](self->_bag, "integerForKey:", 0x1E254D3C0);
}

- (AMSBagValue)trustedDomains
{
  return (AMSBagValue *)-[AMSBagProtocol arrayForKey:](self->_bag, "arrayForKey:", 0x1E254D400);
}

- (AMSBagProtocol)bag
{
  return self->_bag;
}

- (void)setBag:(id)a3
{
  objc_storeStrong((id *)&self->_bag, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bag, 0);
}

@end
