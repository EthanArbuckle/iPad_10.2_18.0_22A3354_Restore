@implementation PHBottomBarAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("PHBottomBar");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PHBottomBar"), CFSTR("supplementalBottomRightButton"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PHBottomBar"), CFSTR("refreshCustomizedActionTypeTitles"), "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PHBottomBar"), CFSTR("layoutSubviews"), "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PHBottomBar"), CFSTR("buttonPressed:"), "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PHBottomBar"), CFSTR("setAnimating:"), "v", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PHBottomBar"), CFSTR("animating"), "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PHBottomBar"), CFSTR("supplementalBottomLeftButton"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PHBottomBar"), CFSTR("setCurrentState: animated: animationCompletionBlock:"), "v", "q", "B", "@?", 0);

}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)PHBottomBarAccessibility;
  -[PHBottomBarAccessibility _accessibilityLoadAccessibilityInformation](&v9, sel__accessibilityLoadAccessibilityInformation);
  objc_opt_class();
  -[PHBottomBarAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("supplementalBottomRightButton"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "accessibilityLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setIsAccessibilityElement:", objc_msgSend(v5, "length") != 0);

  objc_opt_class();
  -[PHBottomBarAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("supplementalBottomLeftButton"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "accessibilityLabel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setIsAccessibilityElement:", objc_msgSend(v8, "length") != 0);

}

- (void)setAnimating:(BOOL)a3
{
  _BOOL8 v3;
  int v5;
  BOOL v6;
  void *v7;
  objc_super v8;

  v3 = a3;
  v5 = -[PHBottomBarAccessibility safeBoolForKey:](self, "safeBoolForKey:", CFSTR("animating"));
  v8.receiver = self;
  v8.super_class = (Class)PHBottomBarAccessibility;
  -[PHBottomBarAccessibility setAnimating:](&v8, sel_setAnimating_, v3);
  if (v5)
    v6 = !v3;
  else
    v6 = 0;
  if (v6)
  {
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "postNotificationName:object:", CFSTR("AXPHBottomBarStoppedAnimatingNotification"), self);

  }
}

- (BOOL)shouldGroupAccessibilityChildren
{
  return 1;
}

- (BOOL)_accessibilityOnlyComparesByXAxis
{
  return 1;
}

- (void)refreshCustomizedActionTypeTitles
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PHBottomBarAccessibility;
  -[PHBottomBarAccessibility refreshCustomizedActionTypeTitles](&v3, sel_refreshCustomizedActionTypeTitles);
  -[PHBottomBarAccessibility _accessibilityLoadAccessibilityInformation](self, "_accessibilityLoadAccessibilityInformation");
}

- (void)layoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PHBottomBarAccessibility;
  -[PHBottomBarAccessibility layoutSubviews](&v3, sel_layoutSubviews);
  -[PHBottomBarAccessibility _accessibilityLoadAccessibilityInformation](self, "_accessibilityLoadAccessibilityInformation");
}

- (void)setCurrentState:(int64_t)a3 animated:(BOOL)a4 animationCompletionBlock:(id)a5
{
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PHBottomBarAccessibility;
  -[PHBottomBarAccessibility setCurrentState:animated:animationCompletionBlock:](&v6, sel_setCurrentState_animated_animationCompletionBlock_, a3, a4, a5);
  -[PHBottomBarAccessibility _accessibilityLoadAccessibilityInformation](self, "_accessibilityLoadAccessibilityInformation");
}

- (void)buttonPressed:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PHBottomBarAccessibility;
  -[PHBottomBarAccessibility buttonPressed:](&v3, sel_buttonPressed_, a3);
  UIAccessibilityPostNotification(*MEMORY[0x24BDF7328], 0);
}

@end
