@implementation CAMSmartStyleSettingsResourceLoadResult

- (CAMSmartStyleSettingsResourceLoadResult)initWithResourceLoadResult:(id)a3 logIdentifier:(id)a4
{
  id v7;
  id v8;
  CAMSmartStyleSettingsResourceLoadResult *v9;
  CAMSmartStyleSettingsResourceLoadResult *v10;
  CAMSmartStyleSettingsResourceLoadResult *v11;
  objc_super v13;

  v7 = a3;
  v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)CAMSmartStyleSettingsResourceLoadResult;
  v9 = -[CAMSmartStyleSettingsResourceLoadResult init](&v13, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_resourceLoadResult, a3);
    objc_storeStrong((id *)&v10->_logIdentifier, a4);
    v11 = v10;
  }

  return v10;
}

- (PEResourceLoadResult)resourceLoadResult
{
  return self->_resourceLoadResult;
}

- (NSString)logIdentifier
{
  return self->_logIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_logIdentifier, 0);
  objc_storeStrong((id *)&self->_resourceLoadResult, 0);
}

@end
