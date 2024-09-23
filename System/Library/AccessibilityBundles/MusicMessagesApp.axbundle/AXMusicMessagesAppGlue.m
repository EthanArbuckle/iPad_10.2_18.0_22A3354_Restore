@implementation AXMusicMessagesAppGlue

+ (id)accessibilityBundles
{
  return 0;
}

+ (void)accessibilityInitializeBundle
{
  uint64_t v2;
  void *v3;
  id v4;

  if (!_Failover)
  {
    v2 = objc_msgSend(objc_allocWithZone((Class)AXMusicMessagesAppGlue), "init");
    v3 = (void *)_Failover;
    _Failover = v2;

    objc_msgSend(MEMORY[0x24BE00758], "sharedInstance");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "performValidations:withPreValidationHandler:postValidationHandler:safeCategoryInstallationHandler:", &__block_literal_global, &__block_literal_global_182, 0, &__block_literal_global_188);

  }
}

uint64_t __55__AXMusicMessagesAppGlue_accessibilityInitializeBundle__block_invoke()
{
  return 1;
}

uint64_t __55__AXMusicMessagesAppGlue_accessibilityInitializeBundle__block_invoke_2(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  objc_msgSend(v2, "setValidationTargetName:", CFSTR("MusicMessagesApp Bundle"));
  objc_msgSend(v2, "setOverrideProcessName:", CFSTR("MusicMessagesApp"));

  return AXPerformValidationChecks();
}

void __55__AXMusicMessagesAppGlue_accessibilityInitializeBundle__block_invoke_3(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("LaunchMusicCellViewAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("TrackCellViewAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("SharingCollectionViewHeaderAccessibility"), 1);

}

@end
