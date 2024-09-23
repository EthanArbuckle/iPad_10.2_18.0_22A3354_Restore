@implementation AEExplorerViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("AEExplorerViewController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("AEExplorerViewController"), CFSTR("_scrollViewController"), "@", 0);
  objc_msgSend(v3, "validateClass:", CFSTR("PXScrollViewController"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PXScrollViewController"), CFSTR("scrollView"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("AEExplorerViewController"), CFSTR("_handleAttemptedSelectionToggleOfAssetReference: cancelIfAlreadySelected: suppressLivePhotoContent:"), "v", "@", "B", "B", 0);

}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)AEExplorerViewControllerAccessibility;
  -[AEExplorerViewControllerAccessibility _accessibilityLoadAccessibilityInformation](&v5, sel__accessibilityLoadAccessibilityInformation);
  -[AEExplorerViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_scrollViewController"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  MEMORY[0x2348BF6EC](CFSTR("PXScrollViewController"));
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v3, "accessibilitySetIdentification:", CFSTR("AXExplorerViewControllerScrollViewController"));
    objc_msgSend(v3, "safeValueForKey:", CFSTR("scrollView"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setAccessibilityIdentifier:", CFSTR("AXExplorerViewControllerScrollView"));

  }
}

- (void)_handleAttemptedSelectionToggleOfAssetReference:(id)a3 cancelIfAlreadySelected:(BOOL)a4 suppressLivePhotoContent:(BOOL)a5
{
  _BOOL8 v5;
  _BOOL8 v6;
  id v8;
  void *v9;
  objc_super v10;

  v5 = a5;
  v6 = a4;
  v8 = a3;
  v10.receiver = self;
  v10.super_class = (Class)AEExplorerViewControllerAccessibility;
  -[AEExplorerViewControllerAccessibility _handleAttemptedSelectionToggleOfAssetReference:cancelIfAlreadySelected:suppressLivePhotoContent:](&v10, sel__handleAttemptedSelectionToggleOfAssetReference_cancelIfAlreadySelected_suppressLivePhotoContent_, v8, v6, v5);
  objc_msgSend(v8, "safeValueForKey:", CFSTR("asset"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
    UIAccessibilityPostNotification(*MEMORY[0x24BDF72C8], 0);

}

@end
