@implementation _MDIndexExtensionManager

+ (id)sharedManager
{
  if (sharedManager_onceToken != -1)
    dispatch_once(&sharedManager_onceToken, &__block_literal_global_31);
  return (id)sharedManager__sharedManager;
}

- (void)loadExtensions
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __42___MDIndexExtensionManager_loadExtensions__block_invoke;
  block[3] = &unk_1E2401238;
  block[4] = self;
  if (loadExtensions_onceToken != -1)
    dispatch_once(&loadExtensions_onceToken, block);
}

+ (void)setMemoryPressureStatus:(unint64_t)a3
{
  sUnderMemoryPressure = a3 == 1;
}

- (_MDIndexExtensionManager)init
{
  _MDIndexExtensionManager *v2;
  _MDIndexExtensionLoader *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_MDIndexExtensionManager;
  v2 = -[_MDExtensionManager initWithQueueName:](&v5, sel_initWithQueueName_, "com.apple.corespotlight.IndexExtensionManager");
  if (v2)
  {
    v3 = objc_alloc_init(_MDIndexExtensionLoader);
    -[_MDExtensionManager setExtensionLoader:](v2, "setExtensionLoader:", v3);

  }
  return v2;
}

@end
