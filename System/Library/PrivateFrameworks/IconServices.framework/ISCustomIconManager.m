@implementation ISCustomIconManager

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_2 != -1)
    dispatch_once(&sharedInstance_onceToken_2, &__block_literal_global_23);
  return (id)sharedInstance_sharedInstance_3;
}

void __37__ISCustomIconManager_sharedInstance__block_invoke()
{
  id v0;
  void *v1;

  v0 = -[ISCustomIconManager _init]([ISCustomIconManager alloc], "_init");
  v1 = (void *)sharedInstance_sharedInstance_3;
  sharedInstance_sharedInstance_3 = (uint64_t)v0;

}

- (id)_init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)ISCustomIconManager;
  return -[ISCustomIconManager init](&v3, sel_init);
}

- (id)overrideIconForURL:(id)a3
{
  return 0;
}

- (id)overrideResourceForBundleIdentifier:(id)a3
{
  return 0;
}

- (id)specialFolderTypeForURL:(id)a3
{
  return 0;
}

@end
