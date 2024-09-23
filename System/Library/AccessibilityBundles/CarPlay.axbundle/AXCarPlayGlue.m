@implementation AXCarPlayGlue

+ (void)accessibilityInitializeBundle
{
  void *v2;
  uint64_t v3;
  void *v4;

  if (!_Failover)
  {
    objc_msgSend(MEMORY[0x24BE00758], "sharedInstance");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "performValidations:withPreValidationHandler:postValidationHandler:safeCategoryInstallationHandler:", &__block_literal_global, &__block_literal_global_176, 0, &__block_literal_global_182);

    v3 = objc_msgSend(objc_allocWithZone((Class)AXCarPlayGlue), "init");
    v4 = (void *)_Failover;
    _Failover = v3;

  }
}

uint64_t __46__AXCarPlayGlue_accessibilityInitializeBundle__block_invoke()
{
  return 1;
}

uint64_t __46__AXCarPlayGlue_accessibilityInitializeBundle__block_invoke_2(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  objc_msgSend(v2, "setValidationTargetName:", CFSTR("CarPlay AX"));
  objc_msgSend(v2, "setOverrideProcessName:", CFSTR("CarPlay"));
  objc_msgSend(v2, "setDebugBuild:", 0);

  return AXPerformValidationChecks();
}

void __46__AXCarPlayGlue_accessibilityInitializeBundle__block_invoke_3(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("CARFolderViewAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("CarZoomButtonViewAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("CARApplicationAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("CARIconScrollViewAccessibility"), 1);

}

- (AXCarPlayGlue)init
{
  AXCarPlayGlue *v2;
  void *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)AXCarPlayGlue;
  v2 = -[AXCarPlayGlue init](&v5, sel_init);
  v3 = (void *)objc_opt_new();
  -[AXCarPlayGlue setWatcher:](v2, "setWatcher:", v3);

  return v2;
}

- (AXFrontBoardProcessWatcher)watcher
{
  return self->_watcher;
}

- (void)setWatcher:(id)a3
{
  objc_storeStrong((id *)&self->_watcher, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_watcher, 0);
}

@end
