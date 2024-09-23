@implementation SFUnifiedTabBarItemTitleContainerViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SFUnifiedTabBarItemTitleContainerView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:", CFSTR("SFCapsuleNavigationBar"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SFCapsuleNavigationBar"), CFSTR("isMinimized"), "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SFUnifiedTabBarItemTitleContainerView"), CFSTR("showsLockIcon"), "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SFUnifiedTabBarItemTitleContainerView"), CFSTR("securityAnnotation"), "q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SFUnifiedTabBarItemTitleContainerView"), CFSTR("showsPrivateAnnotation"), "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SFUnifiedTabBarItemTitleContainerView"), CFSTR("_showsPlaceholder"), "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SFUnifiedTabBarItemTitleContainerView"), CFSTR("showsSearchIcon"), "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SFUnifiedTabBarItemTitleContainerView"), CFSTR("showsSearchField"), "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("SFUnifiedTabBarItemTitleContainerView"), CFSTR("_titleLabel"), "SFURLLabel");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("SFUnifiedTabBarItemTitleContainerView"), CFSTR("_lockView"), "UIImageView");

}

- (BOOL)_axShowingLockIcon
{
  void *v4;
  char v5;

  if ((-[SFUnifiedTabBarItemTitleContainerViewAccessibility safeBoolForKey:](self, "safeBoolForKey:", CFSTR("_showsLockIcon")) & 1) != 0)return 1;
  -[SFUnifiedTabBarItemTitleContainerViewAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("_lockView"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "_accessibilityViewIsVisible");

  return v5;
}

- (id)accessibilityValue
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  if (-[SFUnifiedTabBarItemTitleContainerViewAccessibility _axShowingLockIcon](self, "_axShowingLockIcon"))
  {
    accessibilitySafariServicesLocalizedString(CFSTR("secure.icon"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  if (-[SFUnifiedTabBarItemTitleContainerViewAccessibility safeIntegerForKey:](self, "safeIntegerForKey:", CFSTR("securityAnnotation")) == 1)
  {
    accessibilitySafariServicesLocalizedString(CFSTR("not.secure.icon"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }
  if (-[SFUnifiedTabBarItemTitleContainerViewAccessibility safeBoolForKey:](self, "safeBoolForKey:", CFSTR("showsPrivateAnnotation")))
  {
    accessibilitySafariServicesLocalizedString(CFSTR("private.icon"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }
  -[SFUnifiedTabBarItemTitleContainerViewAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("_titleLabel"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "accessibilityLabel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (-[SFUnifiedTabBarItemTitleContainerViewAccessibility safeBoolForKey:](self, "safeBoolForKey:", CFSTR("_showsPlaceholder")))
  {
    objc_msgSend(MEMORY[0x24BDFEA60], "axAttributedStringWithString:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setAttribute:forKey:", MEMORY[0x24BDBD1C8], *MEMORY[0x24BDFEC10]);

    v7 = v8;
  }
  __UIAXStringForVariables();
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (BOOL)isAccessibilityElement
{
  return -[SFUnifiedTabBarItemTitleContainerViewAccessibility safeBoolForKey:](self, "safeBoolForKey:", CFSTR("showsSearchField")) ^ 1;
}

- (unint64_t)accessibilityTraits
{
  unint64_t v3;
  _BOOL4 v4;
  uint64_t v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SFUnifiedTabBarItemTitleContainerViewAccessibility;
  v3 = -[SFUnifiedTabBarItemTitleContainerViewAccessibility accessibilityTraits](&v7, sel_accessibilityTraits);
  v4 = -[SFUnifiedTabBarItemTitleContainerViewAccessibility _accessibilityIsMinimized](self, "_accessibilityIsMinimized");
  v5 = *MEMORY[0x24BEBB198];
  if (v4)
    v5 = 0;
  return v5 | v3;
}

- (id)accessibilityLabel
{
  return accessibilityMobileSafariLocalizedString(CFSTR("address.text"));
}

- (int64_t)_accessibilityExpandedStatus
{
  if (-[SFUnifiedTabBarItemTitleContainerViewAccessibility _accessibilityIsMinimized](self, "_accessibilityIsMinimized"))
  {
    return 2;
  }
  else
  {
    return 0;
  }
}

- (BOOL)_accessibilityIsMinimized
{
  void *v2;
  char v3;

  -[SFUnifiedTabBarItemTitleContainerViewAccessibility _accessibilityNavBarParent](self, "_accessibilityNavBarParent");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "safeBoolForKey:", CFSTR("isMinimized"));

  return v3;
}

- (id)_accessibilityNavBarParent
{
  return (id)-[SFUnifiedTabBarItemTitleContainerViewAccessibility _accessibilityAncestorIsKindOf:](self, "_accessibilityAncestorIsKindOf:", MEMORY[0x23491571C](CFSTR("SFCapsuleNavigationBar"), a2));
}

@end
