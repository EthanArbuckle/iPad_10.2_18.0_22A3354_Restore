@implementation CSCameraPrewarmingIdentifier

- (CSCameraPrewarmingIdentifier)initWithCameraPrewarmType:(int64_t)a3 applicationBundleIdentifier:(id)a4
{
  id v6;
  CSCameraPrewarmingIdentifier *v7;
  CSCameraPrewarmingIdentifier *v8;
  uint64_t v9;
  NSString *applicationBundleIdentifier;
  objc_super v12;

  v6 = a4;
  v12.receiver = self;
  v12.super_class = (Class)CSCameraPrewarmingIdentifier;
  v7 = -[CSCameraPrewarmingIdentifier init](&v12, sel_init);
  v8 = v7;
  if (v7)
  {
    v7->_prewarmType = a3;
    v9 = objc_msgSend(v6, "copy");
    applicationBundleIdentifier = v8->_applicationBundleIdentifier;
    v8->_applicationBundleIdentifier = (NSString *)v9;

  }
  return v8;
}

- (NSString)applicationBundleIdentifier
{
  return self->_applicationBundleIdentifier;
}

- (int64_t)prewarmType
{
  return self->_prewarmType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_applicationBundleIdentifier, 0);
}

@end
