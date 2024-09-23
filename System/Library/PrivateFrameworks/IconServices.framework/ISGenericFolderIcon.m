@implementation ISGenericFolderIcon

+ (id)sharedInstance
{
  if (sharedInstance_onceToken != -1)
    dispatch_once(&sharedInstance_onceToken, &__block_literal_global_8);
  return (id)sharedInstance_sharedInstance_0;
}

void __37__ISGenericFolderIcon_sharedInstance__block_invoke()
{
  ISGenericFolderIcon *v0;
  void *v1;

  v0 = objc_alloc_init(ISGenericFolderIcon);
  v1 = (void *)sharedInstance_sharedInstance_0;
  sharedInstance_sharedInstance_0 = (uint64_t)v0;

}

- (ISGenericFolderIcon)init
{
  uint64_t v2;
  objc_super v4;

  v2 = *MEMORY[0x1E0CA5B58];
  v4.receiver = self;
  v4.super_class = (Class)ISGenericFolderIcon;
  return -[ISTypeIcon initWithType:](&v4, sel_initWithType_, v2);
}

- (ISResourceProvider)resourceProvider
{
  ISResourceProvider *resourceProvider;
  void *v4;
  ISRecordResourceProvider *v5;
  ISResourceProvider *v6;
  ISGenericRecipe *v7;

  resourceProvider = self->_resourceProvider;
  if (!resourceProvider)
  {
    objc_msgSend(MEMORY[0x1E0CA5928], "typeRecordWithIdentifier:", *MEMORY[0x1E0CA5B58]);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = -[ISRecordResourceProvider initWithRecord:options:]([ISRecordResourceProvider alloc], "initWithRecord:options:", v4, 0);
    v6 = self->_resourceProvider;
    self->_resourceProvider = &v5->super;

    v7 = objc_alloc_init(ISGenericRecipe);
    -[ISResourceProvider setSuggestedRecipe:](self->_resourceProvider, "setSuggestedRecipe:", v7);

    resourceProvider = self->_resourceProvider;
  }
  return resourceProvider;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resourceProvider, 0);
}

@end
