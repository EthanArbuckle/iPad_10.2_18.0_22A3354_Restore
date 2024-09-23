@implementation SHShazamCatalog

- (SHShazamCatalog)init
{
  void *v3;
  SHShazamCatalog *v4;
  objc_super v6;

  v3 = (void *)objc_opt_new();
  v6.receiver = self;
  v6.super_class = (Class)SHShazamCatalog;
  v4 = -[SHCatalog initWithConfiguration:error:](&v6, sel_initWithConfiguration_error_, v3, 0);

  return v4;
}

- (id)_createMatcher
{
  SHShazamKitServiceConnection *v2;
  void *v3;
  SHShazamKitServiceConnection *v4;

  v2 = [SHShazamKitServiceConnection alloc];
  v3 = (void *)objc_opt_new();
  v4 = -[SHShazamKitServiceConnection initWithConnectionProvider:](v2, "initWithConnectionProvider:", v3);

  return v4;
}

@end
