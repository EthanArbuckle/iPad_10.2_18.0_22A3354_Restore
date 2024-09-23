@implementation SUUIMediaQueryFeature

- (SUUIMediaQueryFeature)initWithFeatureName:(id)a3 value:(id)a4
{
  id v5;
  SUUIMediaQueryFeature *v6;
  uint64_t v7;
  NSString *featureName;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)SUUIMediaQueryFeature;
  v6 = -[SUUIMediaQueryFeature init](&v10, sel_init);
  if (v6)
  {
    v7 = objc_msgSend(v5, "copy");
    featureName = v6->_featureName;
    v6->_featureName = (NSString *)v7;

  }
  return v6;
}

+ (BOOL)supportsFeatureName:(id)a3
{
  return 0;
}

- (BOOL)evaluateWithValues:(id)a3
{
  return 0;
}

- (NSArray)notificationNames
{
  return 0;
}

- (NSArray)requiredKeys
{
  return 0;
}

- (NSString)featureName
{
  return self->_featureName;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_featureName, 0);
}

@end
