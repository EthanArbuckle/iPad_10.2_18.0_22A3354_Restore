@implementation SFScribbleSelectionOverlayAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SFScribbleSelectionOverlay");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:hasInstanceVariable:withType:", CFSTR("SFScribbleSelectionOverlay"), CFSTR("hideButton"), ");
}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SFScribbleSelectionOverlayAccessibility;
  -[SFScribbleSelectionOverlayAccessibility _accessibilityLoadAccessibilityInformation](&v4, sel__accessibilityLoadAccessibilityInformation);
  -[SFScribbleSelectionOverlayAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("hideButton"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAccessibilityElementsHiddenBlock:", &__block_literal_global_5);

}

@end
