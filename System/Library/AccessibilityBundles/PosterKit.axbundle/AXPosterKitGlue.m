@implementation AXPosterKitGlue

+ (void)accessibilityInitializeBundle
{
  void *v2;
  uint64_t v3;
  void *v4;

  if (!_Failover)
  {
    objc_msgSend(MEMORY[0x24BE00758], "sharedInstance");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "performValidations:withPreValidationHandler:postValidationHandler:safeCategoryInstallationHandler:", &__block_literal_global, &__block_literal_global_248, 0, &__block_literal_global_254);

    v3 = objc_msgSend(objc_allocWithZone((Class)AXPosterKitGlue), "init");
    v4 = (void *)_Failover;
    _Failover = v3;

  }
}

uint64_t __48__AXPosterKitGlue_accessibilityInitializeBundle__block_invoke(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  objc_msgSend(v2, "validateClass:hasProperty:withType:", CFSTR("CHSWidget"), CFSTR("family"), "q");
  objc_msgSend(v2, "validateClass:hasInstanceVariable:withType:", CFSTR("CHSWidgetDescriptor"), CFSTR("_widgetDescription"), "NSString");
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PRComplicationDescriptor"), CFSTR("widget"), "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CHSWidget"), CFSTR("intent"), "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("INIntent"), CFSTR("_codableDescription"), "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("INIntentCodableDescription"), CFSTR("attributes"), "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("INCodableAttribute"), CFSTR("isConfigurable"), "B", 0);
  objc_msgSend(v2, "validateClass:", CFSTR("INAppIntent"));
  objc_msgSend(v2, "validateClass:isKindOfClass:", CFSTR("CHUISWidgetHostViewController"), CFSTR("UIViewController"));
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PRComplicationDescriptor"), CFSTR("widgetDescriptor"), "@", 0);
  objc_msgSend(v2, "validateClass:isKindOfClass:", CFSTR("CHSWidgetDescriptor"), CFSTR("CHSBaseDescriptor"));
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CHSBaseDescriptor"), CFSTR("extensionIdentity"), "@", 0);
  objc_msgSend(v2, "validateClass:hasProperty:withType:", CFSTR("CHSExtensionIdentity"), CFSTR("containerBundleIdentifier"), "@");
  objc_msgSend(v2, "validateClass:hasProperty:withType:", CFSTR("CHSWidgetDescriptor"), CFSTR("displayName"), "@");
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PRWidgetGridViewController"), CFSTR("widgetHostViewControllerForComplicationDescriptor:"), "@", "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PRWidgetGridViewController"), CFSTR("model"), "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PRWidgetGridModel"), CFSTR("complicationDescriptors"), "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PRComplicationDescriptor"), CFSTR("uniqueIdentifier"), "@", 0);

  return 1;
}

uint64_t __48__AXPosterKitGlue_accessibilityInitializeBundle__block_invoke_2(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  objc_msgSend(v2, "setValidationTargetName:", CFSTR("PosterKit AX"));
  objc_msgSend(v2, "setOverrideProcessName:", CFSTR("PosterKit"));
  objc_msgSend(v2, "setDebugBuild:", 0);

  return AXPerformValidationChecks();
}

void __48__AXPosterKitGlue_accessibilityInitializeBundle__block_invoke_3(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("AXRemoteElementAccessibility__PosterKit__AXRuntime"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("PREditingAddButtonAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("PREditingCancelButtonAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("PREditingTimeFontPickerCellViewAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("PREditingReticleViewAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("PREditingDoneButtonAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("PRInlineComplicationGalleryItemCellAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("PREditingColorItemViewAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("PREditingColorSliderAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("PRComplicationGalleryApplicationCellAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("PRAddWidgetDetailSheetWidgetDescriptionViewAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("PREditorRootViewControllerAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("PREditingFontAndColorPickerViewControllerAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("PRComplicationContainerViewControllerAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("PRComplicationGalleryApplicationTitleViewAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("PRComplicationGalleryDetailViewAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("PRComplicationGalleryViewControllerAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("PRInlineComplicationGalleryViewControllerAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("PRInlineComplicationContainerViewControllerAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("PRWidgetIconViewControllerAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("PREditingPickerImageCellViewAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("PRPosterWindowAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("PREditingPlusButtonAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("PREditingContentStyleItemViewAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("PRAmbientEditingTitledViewControllerAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("PREditingAmbientContentStylePickerViewControllerAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("PREditingIncomingCallFontPickerCellViewAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("UIButtonAccessibility__PosterKit__UIKit"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("PRSubviewHitTestingViewAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("PREditingVariationSliderAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("PRQuickActionEditingViewControllerAccessibility"), 1);

}

@end
