@implementation NTKWidgetTritiumComplicationProvider

+ (NTKWidgetTritiumComplicationProvider)shared
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __46__NTKWidgetTritiumComplicationProvider_shared__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (shared_onceToken != -1)
    dispatch_once(&shared_onceToken, block);
  return (NTKWidgetTritiumComplicationProvider *)(id)shared_shared;
}

void __46__NTKWidgetTritiumComplicationProvider_shared__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  v1 = objc_msgSend(objc_alloc(*(Class *)(a1 + 32)), "_init");
  v2 = (void *)shared_shared;
  shared_shared = v1;

}

- (id)_init
{
  NTKWidgetTritiumComplicationProvider *v2;
  void *v3;
  uint64_t v4;
  NTKCompanionWidgetComplicationManager *companionManager;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)NTKWidgetTritiumComplicationProvider;
  v2 = -[NTKWidgetTritiumComplicationProvider init](&v7, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0C944B0], "currentDevice");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    +[NTKCompanionWidgetComplicationManager instanceForDevice:](NTKCompanionWidgetComplicationManager, "instanceForDevice:", v3);
    v4 = objc_claimAutoreleasedReturnValue();
    companionManager = v2->_companionManager;
    v2->_companionManager = (NTKCompanionWidgetComplicationManager *)v4;

  }
  return v2;
}

- (BOOL)vendorExistsWithContainerBundleIdentifier:(id)a3
{
  return -[NTKCompanionWidgetComplicationManager vendorExistsForContainerBundleIdentifier:](self->_companionManager, "vendorExistsForContainerBundleIdentifier:", a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_companionManager, 0);
}

@end
