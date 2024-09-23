@implementation CKNavigationBarCanvasViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("CKNavigationBarCanvasView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CKNavigationBarCanvasView"), CFSTR("buttonViewFaceTimeAudio"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CKNavigationBarCanvasView"), CFSTR("setTitleView:"), "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CKNavigationBarCanvasView"), CFSTR("isBusinessChat"), "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CKNavigationBarCanvasView"), CFSTR("titleView"), "@", 0);

}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CKNavigationBarCanvasViewAccessibility;
  -[CKNavigationBarCanvasViewAccessibility _accessibilityLoadAccessibilityInformation](&v4, sel__accessibilityLoadAccessibilityInformation);
  -[CKNavigationBarCanvasViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("titleView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKNavigationBarCanvasViewAccessibility setTitleView:](self, "setTitleView:", v3);

}

- (void)setTitleView:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v4 = a3;
  v6.receiver = self;
  v6.super_class = (Class)CKNavigationBarCanvasViewAccessibility;
  -[CKNavigationBarCanvasViewAccessibility setTitleView:](&v6, sel_setTitleView_, v4);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v4, "setAccessibilityRespondsToUserInteraction:", 1);
    if (-[CKNavigationBarCanvasViewAccessibility safeBoolForKey:](self, "safeBoolForKey:", CFSTR("isBusinessChat")))
    {
      accessibilityLocalizedString(CFSTR("conversation.verified"));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setAccessibilityValue:", v5);

    }
    else
    {
      objc_msgSend(v4, "setAccessibilityTraits:", *MEMORY[0x24BDF73B0]);
    }
  }

}

@end
