@implementation NUAdSettings

- (NUAdSettings)initWithDebugAdvertisementSettings:(id)a3
{
  id v5;
  NUAdSettings *v6;
  NUAdSettings *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)NUAdSettings;
  v6 = -[NUAdSettings init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_debugAdvertisementSettings, a3);

  return v7;
}

- (SXAdvertisingSettings)debugAdvertisementSettings
{
  return self->_debugAdvertisementSettings;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_debugAdvertisementSettings, 0);
}

@end
