@implementation AXPosterBoardFrameworkGlue

+ (void)accessibilityInitializeBundle
{
  void *v2;
  uint64_t v3;
  void *v4;

  if (!_Failover)
  {
    objc_msgSend(MEMORY[0x24BE00758], "sharedInstance");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "performValidations:withPreValidationHandler:postValidationHandler:safeCategoryInstallationHandler:", &__block_literal_global, &__block_literal_global_216, 0, &__block_literal_global_222);

    v3 = objc_msgSend(objc_allocWithZone((Class)AXPosterBoardFrameworkGlue), "init");
    v4 = (void *)_Failover;
    _Failover = v3;

  }
}

uint64_t __59__AXPosterBoardFrameworkGlue_accessibilityInitializeBundle__block_invoke(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  objc_msgSend(v2, "validateClass:conformsToProtocol:", CFSTR("PBFGenericPosterPreview"), CFSTR("PBFPosterPreview"));
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PBFGenericPosterPreview"), CFSTR("posterDescriptorLookupInfo"), "@", 0);
  objc_msgSend(v2, "validateClass:conformsToProtocol:", CFSTR("PBFGenericPosterDescriptorLookupInfo"), CFSTR("PBFPosterDescriptorLookupInfo"));
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PBFGenericPosterDescriptorLookupInfo"), CFSTR("posterDescriptorPath"), "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PFServerPosterPath"), CFSTR("identity"), "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PFServerPosterIdentity"), CFSTR("descriptorIdentifier"), "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PFServerPosterIdentity"), CFSTR("provider"), "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceVariable:withType:", CFSTR("PBFPosterGalleryPreviewView"), CFSTR("_posterPreviewContentView"), "PBFPosterGalleryPreviewContentView");
  objc_msgSend(v2, "validateClass:hasProperty:withType:", CFSTR("CHSWidgetDescriptor"), CFSTR("extensionIdentity"), "@");
  objc_msgSend(v2, "validateClass:hasProperty:withType:", CFSTR("CHSExtensionIdentity"), CFSTR("containerBundleIdentifier"), "@");

  return 1;
}

uint64_t __59__AXPosterBoardFrameworkGlue_accessibilityInitializeBundle__block_invoke_2(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  objc_msgSend(v2, "setValidationTargetName:", CFSTR("PosterBoardFramework AX"));
  objc_msgSend(v2, "setOverrideProcessName:", CFSTR("PosterBoardFramework"));
  objc_msgSend(v2, "setDebugBuild:", 0);

  return AXPerformValidationChecks();
}

void __59__AXPosterBoardFrameworkGlue_accessibilityInitializeBundle__block_invoke_3(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("PBFPosterGalleryPreviewCellAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("PBFFocusPosterCellAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("LockScreenPosterCollectionViewCellAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("PosterSectionHeaderViewAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("PosterRackCollectionViewControllerAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("PosterGalleryAffordanceCollectionViewCellAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("HomeScreenConfigurationControlAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("PBFPosterGallerySectionHeaderViewAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("PosterEditingConfirmationViewControllerAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("HomeScreenPosterCollectionViewCellAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("PosterCoupledTitlesViewAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("HomeScreenConfigurationPosterControlContentViewAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("HomeScreenConfigurationBlurControlContentViewAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("PosterRackCollectionViewAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("PosterBoardFrameworkUIButtonAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("PosterSectionRemovalViewAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("AmbientCollectionViewCellAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("PosterSectionFooterViewAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("PBFAmbientEditingCollectionViewControllerAccessibility"), 1);

}

@end
