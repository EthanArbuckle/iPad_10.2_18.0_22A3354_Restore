@implementation HGMLConfiguration

- (HGMLConfiguration)init
{
  HGMLConfiguration *v2;
  void *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)HGMLConfiguration;
  v2 = -[HGMLConfiguration init](&v5, sel_init);
  if (v2)
  {
    +[HGMLConfigurationInternal defaultMLConfiguration](HGMLConfigurationInternal, "defaultMLConfiguration");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[HGMLConfiguration setInternal:](v2, "setInternal:", v3);

  }
  return v2;
}

- (HGMLConfigurationInternal)internal
{
  return self->_internal;
}

- (void)setInternal:(id)a3
{
  objc_storeStrong((id *)&self->_internal, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_internal, 0);
}

@end
