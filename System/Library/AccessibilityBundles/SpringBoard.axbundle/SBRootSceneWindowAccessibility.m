@implementation SBRootSceneWindowAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SBRootSceneWindow");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("SBRootSceneWindow"), CFSTR("UIView"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBHIconManager"), CFSTR("isEditing"), "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBHIconManager"), CFSTR("hasOpenFolder"), "B", 0);
  objc_msgSend(v3, "validateClass:", CFSTR("SBIconController"));
  objc_msgSend(v3, "validateClass:hasClassMethod:withFullSignature:", CFSTR("SBIconController"), CFSTR("sharedInstance"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBIconController"), CFSTR("iconManager"), "@", 0);

}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SBRootSceneWindowAccessibility;
  -[SBRootSceneWindowAccessibility _accessibilityLoadAccessibilityInformation](&v5, sel__accessibilityLoadAccessibilityInformation);
  -[SBRootSceneWindowAccessibility safeArrayForKey:](self, "safeArrayForKey:", CFSTR("subviews"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "firstObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_setAccessibilityElementsHiddenBlock:", &__block_literal_global_9);

}

uint64_t __76__SBRootSceneWindowAccessibility__accessibilityLoadAccessibilityInformation__block_invoke()
{
  void *v0;
  void *v1;
  int v2;
  uint64_t v3;
  void *v4;

  AXSBHIconManagerFromSharedIconController();
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "safeBoolForKey:", CFSTR("isEditing"));
  if (v2)
  {
    +[AXSpringBoardGlue sharedInstance](AXSpringBoardGlue, "sharedInstance");
    v0 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v0, "_axIsAppLibraryOrTodayViewPresent") & 1) != 0)
    {
      v3 = 1;
LABEL_5:

      goto LABEL_6;
    }
  }
  AXSBHIconManagerFromSharedIconController();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v4, "safeBoolForKey:", CFSTR("hasOpenFolder"));

  if (v2)
    goto LABEL_5;
LABEL_6:

  return v3;
}

@end
