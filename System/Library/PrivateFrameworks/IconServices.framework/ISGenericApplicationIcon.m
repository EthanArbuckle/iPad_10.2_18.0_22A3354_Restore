@implementation ISGenericApplicationIcon

void __42__ISGenericApplicationIcon_sharedInstance__block_invoke()
{
  ISGenericApplicationIcon *v0;
  void *v1;

  v0 = objc_alloc_init(ISGenericApplicationIcon);
  v1 = (void *)sharedInstance_sharedInstance_20;
  sharedInstance_sharedInstance_20 = (uint64_t)v0;

}

- (ISGenericApplicationIcon)init
{
  uint64_t v2;
  objc_super v4;

  v2 = *MEMORY[0x1E0CA5AB8];
  v4.receiver = self;
  v4.super_class = (Class)ISGenericApplicationIcon;
  return -[ISTypeIcon initWithType:](&v4, sel_initWithType_, v2);
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_21 != -1)
    dispatch_once(&sharedInstance_onceToken_21, &__block_literal_global_22);
  return (id)sharedInstance_sharedInstance_20;
}

- (ISResourceProvider)resourceProvider
{
  ISResourceProvider *resourceProvider;
  ISResourceProvider *v4;
  ISResourceProvider *v5;

  resourceProvider = self->_resourceProvider;
  if (!resourceProvider)
  {
    +[ISResourceProvider defaultAppIconResourceProvider](ISResourceProvider, "defaultAppIconResourceProvider");
    v4 = (ISResourceProvider *)objc_claimAutoreleasedReturnValue();
    v5 = self->_resourceProvider;
    self->_resourceProvider = v4;

    resourceProvider = self->_resourceProvider;
  }
  return resourceProvider;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resourceProvider, 0);
}

@end
