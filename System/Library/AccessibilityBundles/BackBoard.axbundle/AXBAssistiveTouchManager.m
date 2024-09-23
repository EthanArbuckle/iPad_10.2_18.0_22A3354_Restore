@implementation AXBAssistiveTouchManager

+ (void)initializeMonitor
{
  if (initializeMonitor_onceToken_12 != -1)
    dispatch_once(&initializeMonitor_onceToken_12, &__block_literal_global_21);
}

void __45__AXBAssistiveTouchManager_initializeMonitor__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)SharedManager_2;
  SharedManager_2 = v0;

}

- (AXBAssistiveTouchManager)init
{
  AXBAssistiveTouchManager *v2;
  AXBAssistiveTouchManager *v3;
  void *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)AXBAssistiveTouchManager;
  v2 = -[AXBAssistiveTouchManager init](&v7, sel_init);
  v3 = v2;
  if (v2)
  {
    -[AXBAssistiveTouchManager _kickstartAssistiveTouchIfNeeded](v2, "_kickstartAssistiveTouchIfNeeded");
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObserver:selector:name:object:", v3, sel__kickstartAssistiveTouchIfNeeded, *MEMORY[0x24BED26F0], 0);

    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObserver:selector:name:object:", v3, sel__kickstartAssistiveTouchIfNeeded, *MEMORY[0x24BED26F8], 0);

  }
  return v3;
}

- (void)_kickstartAssistiveTouchIfNeeded
{
  if (_AXSAssistiveTouchEnabled() || _AXSAssistiveTouchScannerEnabled())
    _AXSAssistiveTouchKickstart();
}

@end
