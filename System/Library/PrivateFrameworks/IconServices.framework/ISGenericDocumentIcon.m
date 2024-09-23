@implementation ISGenericDocumentIcon

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_15 != -1)
    dispatch_once(&sharedInstance_onceToken_15, &__block_literal_global_16);
  return (id)sharedInstance_sharedInstance_14;
}

void __39__ISGenericDocumentIcon_sharedInstance__block_invoke()
{
  ISGenericDocumentIcon *v0;
  void *v1;

  v0 = objc_alloc_init(ISGenericDocumentIcon);
  v1 = (void *)sharedInstance_sharedInstance_14;
  sharedInstance_sharedInstance_14 = (uint64_t)v0;

}

- (ISGenericDocumentIcon)init
{
  uint64_t v2;
  objc_super v4;

  v2 = *MEMORY[0x1E0CA5B20];
  v4.receiver = self;
  v4.super_class = (Class)ISGenericDocumentIcon;
  return -[ISTypeIcon initWithType:](&v4, sel_initWithType_, v2);
}

@end
