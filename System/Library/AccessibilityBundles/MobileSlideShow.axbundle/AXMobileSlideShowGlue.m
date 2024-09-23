@implementation AXMobileSlideShowGlue

+ (void)accessibilityInitializeBundle
{
  void *v2;
  uint64_t v3;
  void *v4;

  if (!_Failover)
  {
    objc_msgSend(MEMORY[0x24BE00758], "sharedInstance");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "performValidations:withPreValidationHandler:postValidationHandler:safeCategoryInstallationHandler:", &__block_literal_global, &__block_literal_global_191, 0, &__block_literal_global_197);

    v3 = objc_msgSend(objc_allocWithZone((Class)AXMobileSlideShowGlue), "init");
    v4 = (void *)_Failover;
    _Failover = v3;

  }
}

uint64_t __54__AXMobileSlideShowGlue_accessibilityInitializeBundle__block_invoke(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PLGenericAlbum"), CFSTR("localizedTitle"), "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PLGenericAlbum"), CFSTR("count"), "Q", 0);

  return 1;
}

uint64_t __54__AXMobileSlideShowGlue_accessibilityInitializeBundle__block_invoke_2(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  objc_msgSend(v2, "setValidationTargetName:", CFSTR("MobileSlideShow AX Bundle"));
  objc_msgSend(v2, "setOverrideProcessName:", CFSTR("MobileSlideShow"));

  return AXPerformValidationChecks();
}

uint64_t __54__AXMobileSlideShowGlue_accessibilityInitializeBundle__block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("WAUIDimmingViewAccessibility"), 1);
}

@end
