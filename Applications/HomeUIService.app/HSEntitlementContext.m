@implementation HSEntitlementContext

- (HSEntitlementContext)initWithSetupAccessoryDescription:(id)a3
{
  id v4;
  HSEntitlementContext *v5;
  uint64_t v6;
  NSString *bundleIdentifier;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HSEntitlementContext;
  v5 = -[HSEntitlementContext init](&v9, "init");
  if (v5)
  {
    v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "appIdentifier"));
    bundleIdentifier = v5->_bundleIdentifier;
    v5->_bundleIdentifier = (NSString *)v6;

    v5->_isEntitledForHomeKitSPI = objc_msgSend(v4, "isEntitledForHomeKitSPI");
    v5->_isEntitledForThirdPartySetupAccessoryPayload = objc_msgSend(v4, "isEntitledForThirdPartySetupAccessoryPayload");
    v5->_isEntitledForThirdPartyMatterSetupPayload = objc_msgSend(v4, "isEntitledForThirdPartyMatterSetupPayload");
    v5->_isEntitledForAll3rdPartyAccessoryTypes = _os_feature_enabled_impl("Home", "ExposeAccessoryTypes");
  }

  return v5;
}

- (HSEntitlementContext)init
{
  void *v4;
  NSString *v5;
  void *v6;

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
  v5 = NSStringFromSelector("initWithSetupAccessoryDescription:");
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HSEntitlementContext.m"), 39, CFSTR("%s is unavailable; use %@ instead"),
    "-[HSEntitlementContext init]",
    v6);

  return 0;
}

- (id)description
{
  void *v3;
  void *v4;
  id v5;
  id v6;
  id v7;
  void *v8;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NADescriptionBuilder builderWithObject:](NADescriptionBuilder, "builderWithObject:", self));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[HSEntitlementContext bundleIdentifier](self, "bundleIdentifier"));
  objc_msgSend(v3, "appendString:withName:", v4, CFSTR("bundleIdentifier"));

  v5 = objc_msgSend(v3, "appendBool:withName:", -[HSEntitlementContext isEntitledForHomeKitSPI](self, "isEntitledForHomeKitSPI"), CFSTR("com.apple.homekit.private-spi-access"));
  v6 = objc_msgSend(v3, "appendBool:withName:", -[HSEntitlementContext isEntitledForThirdPartySetupAccessoryPayload](self, "isEntitledForThirdPartySetupAccessoryPayload"), CFSTR("com.apple.developer.homekit.allow-setup-payload"));
  v7 = objc_msgSend(v3, "appendBool:withName:", -[HSEntitlementContext isEntitledForThirdPartyMatterSetupPayload](self, "isEntitledForThirdPartyMatterSetupPayload"), CFSTR("com.apple.developer.matter.allow-setup-payload"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "build"));

  return v8;
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (BOOL)isEntitledForHomeKitSPI
{
  return self->_isEntitledForHomeKitSPI;
}

- (void)setFirstPartyEntitled:(BOOL)a3
{
  self->_isEntitledForHomeKitSPI = a3;
}

- (BOOL)isEntitledForThirdPartySetupAccessoryPayload
{
  return self->_isEntitledForThirdPartySetupAccessoryPayload;
}

- (BOOL)isEntitledForThirdPartyMatterSetupPayload
{
  return self->_isEntitledForThirdPartyMatterSetupPayload;
}

- (BOOL)isEntitledForAll3rdPartyAccessoryTypes
{
  return self->_isEntitledForAll3rdPartyAccessoryTypes;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
}

@end
