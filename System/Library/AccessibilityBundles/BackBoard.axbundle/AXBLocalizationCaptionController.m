@implementation AXBLocalizationCaptionController

+ (id)controller
{
  if (controller_onceToken_1 != -1)
    dispatch_once(&controller_onceToken_1, &__block_literal_global_14);
  return (id)controller_SharedManager;
}

void __46__AXBLocalizationCaptionController_controller__block_invoke()
{
  AXBLocalizationCaptionController *v0;
  void *v1;

  v0 = objc_alloc_init(AXBLocalizationCaptionController);
  v1 = (void *)controller_SharedManager;
  controller_SharedManager = (uint64_t)v0;

}

- (void)initializeMonitor
{
  void *v3;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel__updateFeature, *MEMORY[0x24BED2890], 0);

  -[AXBLocalizationCaptionController _updateFeature](self, "_updateFeature");
}

- (void)_updateFeature
{
  void *v3;
  int v4;

  objc_msgSend(MEMORY[0x24BE006C0], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "localizationQACaptionMode");

  if (v4)
  {
    objc_msgSend(MEMORY[0x24BDFE740], "startService");
    self->_wasEnabled = 1;
  }
  else if (self->_wasEnabled)
  {
    objc_msgSend(MEMORY[0x24BDFE740], "stopService");
  }
}

@end
