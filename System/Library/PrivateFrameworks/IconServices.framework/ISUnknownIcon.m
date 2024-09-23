@implementation ISUnknownIcon

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_29 != -1)
    dispatch_once(&sharedInstance_onceToken_29, &__block_literal_global_30);
  return (id)sharedInstance_sharedInstance_28;
}

void __31__ISUnknownIcon_sharedInstance__block_invoke()
{
  ISUnknownIcon *v0;
  void *v1;

  v0 = objc_alloc_init(ISUnknownIcon);
  v1 = (void *)sharedInstance_sharedInstance_28;
  sharedInstance_sharedInstance_28 = (uint64_t)v0;

}

- (ISUnknownIcon)init
{
  uint64_t v2;
  objc_super v4;

  v2 = *MEMORY[0x1E0CA5BA0];
  v4.receiver = self;
  v4.super_class = (Class)ISUnknownIcon;
  return -[ISTypeIcon initWithType:](&v4, sel_initWithType_, v2);
}

@end
