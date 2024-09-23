@implementation GDConfiguration

- (GDConfiguration)init
{
  GDConfiguration *v2;
  GDEntityTagConfigurationInner *v3;
  GDEntityTagConfigurationInner *inner;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GDConfiguration;
  v2 = -[GDConfiguration init](&v6, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(GDEntityTagConfigurationInner);
    inner = v2->inner;
    v2->inner = v3;

  }
  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->inner, 0);
}

@end
