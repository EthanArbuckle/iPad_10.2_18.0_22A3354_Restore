@implementation _MDImportExtensionManager

+ (id)sharedManager
{
  if (sharedManager_onceToken_15 != -1)
    dispatch_once(&sharedManager_onceToken_15, &__block_literal_global_16);
  return (id)sharedManager__sharedManager_14;
}

- (_MDImportExtensionManager)init
{
  _MDImportExtensionManager *v2;
  _MDImportExtensionLoader *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_MDImportExtensionManager;
  v2 = -[_MDExtensionManager initWithQueueName:](&v5, sel_initWithQueueName_, "com.apple.corespotlight.ImportExtensionManager");
  if (v2)
  {
    v3 = objc_alloc_init(_MDImportExtensionLoader);
    -[_MDExtensionManager setExtensionLoader:](v2, "setExtensionLoader:", v3);

  }
  return v2;
}

- (void)loadExtensions
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __43___MDImportExtensionManager_loadExtensions__block_invoke;
  block[3] = &unk_1E2401238;
  block[4] = self;
  if (loadExtensions_onceToken_21 != -1)
    dispatch_once(&loadExtensions_onceToken_21, block);
}

@end
