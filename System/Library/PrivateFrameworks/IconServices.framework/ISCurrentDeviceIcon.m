@implementation ISCurrentDeviceIcon

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_49 != -1)
    dispatch_once(&sharedInstance_onceToken_49, &__block_literal_global_50);
  return (id)sharedInstance_sharedInstance_48;
}

void __37__ISCurrentDeviceIcon_sharedInstance__block_invoke()
{
  ISCurrentDeviceIcon *v0;
  void *v1;

  v0 = objc_alloc_init(ISCurrentDeviceIcon);
  v1 = (void *)sharedInstance_sharedInstance_48;
  sharedInstance_sharedInstance_48 = (uint64_t)v0;

}

- (ISCurrentDeviceIcon)init
{
  void *v3;
  ISCurrentDeviceIcon *v4;
  objc_super v6;

  v3 = (void *)_LSCreateDeviceTypeIdentifierWithModelCode();
  v6.receiver = self;
  v6.super_class = (Class)ISCurrentDeviceIcon;
  v4 = -[ISTypeIcon initWithType:](&v6, sel_initWithType_, v3);

  return v4;
}

@end
