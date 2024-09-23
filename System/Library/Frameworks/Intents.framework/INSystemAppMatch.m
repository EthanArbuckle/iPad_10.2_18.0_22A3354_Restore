@implementation INSystemAppMatch

- (INSystemAppMatch)initWithiOSBundleIdentifier:(id)a3 macOSBundleIdentifier:(id)a4 watchOSBundleIdentifier:(id)a5
{
  id v8;
  id v9;
  id v10;
  INSystemAppMatch *v11;
  uint64_t v12;
  NSString *iOSBundleIdentifier;
  uint64_t v14;
  NSString *macOSBundleIdentifier;
  uint64_t v16;
  NSString *watchOSBundleIdentifier;
  INSystemAppMatch *v18;
  objc_super v20;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v20.receiver = self;
  v20.super_class = (Class)INSystemAppMatch;
  v11 = -[INSystemAppMatch init](&v20, sel_init);
  if (v11)
  {
    v12 = objc_msgSend(v8, "copy");
    iOSBundleIdentifier = v11->_iOSBundleIdentifier;
    v11->_iOSBundleIdentifier = (NSString *)v12;

    v14 = objc_msgSend(v9, "copy");
    macOSBundleIdentifier = v11->_macOSBundleIdentifier;
    v11->_macOSBundleIdentifier = (NSString *)v14;

    v16 = objc_msgSend(v10, "copy");
    watchOSBundleIdentifier = v11->_watchOSBundleIdentifier;
    v11->_watchOSBundleIdentifier = (NSString *)v16;

    v18 = v11;
  }

  return v11;
}

- (BOOL)appIsUnavailableOnCurrentPlatform
{
  void *v2;
  BOOL v3;

  -[INSystemAppMatch bundleIdentifierForCurrentPlatform](self, "bundleIdentifierForCurrentPlatform");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 == 0;

  return v3;
}

- (NSString)iOSBundleIdentifier
{
  return self->_iOSBundleIdentifier;
}

- (NSString)macOSBundleIdentifier
{
  return self->_macOSBundleIdentifier;
}

- (NSString)watchOSBundleIdentifier
{
  return self->_watchOSBundleIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_watchOSBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_macOSBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_iOSBundleIdentifier, 0);
}

+ (id)matchWithiOSBundleIdentifier:(id)a3 macOSBundleIdentifier:(id)a4 watchOSBundleIdentifier:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithiOSBundleIdentifier:macOSBundleIdentifier:watchOSBundleIdentifier:", v8, v9, v10);

  return v11;
}

@end
