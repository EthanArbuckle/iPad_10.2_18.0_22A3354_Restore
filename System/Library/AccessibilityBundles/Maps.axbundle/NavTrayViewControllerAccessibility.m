@implementation NavTrayViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("NavTrayViewController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("NavTrayViewController"), CFSTR("_updateShareETADisclosure"), "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("NavTrayViewController"), CFSTR("pressedHeaderView"), "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("NavTrayViewController"), CFSTR("shareETADisclosureButton"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("NavTrayViewController"), CFSTR("_displayingInitialBanner"), "BOOL");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("NavTrayViewController"), CFSTR("_receivingContacts"), "NSArray");
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("NavTrayViewController"), CFSTR("ContaineeViewController"));
  objc_msgSend(v3, "validateClass:conformsToProtocol:", CFSTR("ContaineeViewController"), CFSTR("ContaineePresentationProtocol"));
  objc_msgSend(v3, "validateProtocol:hasMethod:isInstanceMethod:isRequired:", CFSTR("ContaineePresentationProtocol"), CFSTR("cardPresentationController"), 1, 1);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CardPresentationController"), CFSTR("containeeLayout"), "Q", 0);

}

- (void)_accessibilityLoadAccessibilityInformation
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)NavTrayViewControllerAccessibility;
  -[NavTrayViewControllerAccessibility _accessibilityLoadAccessibilityInformation](&v3, sel__accessibilityLoadAccessibilityInformation);
  -[NavTrayViewControllerAccessibility _accessibilityUpdateETADisclosure](self, "_accessibilityUpdateETADisclosure");
}

- (BOOL)accessibilityPerformEscape
{
  void *v2;
  uint64_t v3;

  -[NavTrayViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("cardPresentationController"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "safeUnsignedIntegerForKey:", CFSTR("containeeLayout"));
  if (v3 == 2)
    AXPerformSafeBlock();

  return v3 == 2;
}

uint64_t __64__NavTrayViewControllerAccessibility_accessibilityPerformEscape__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "pressedHeaderView");
}

- (void)pressedHeaderView
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)NavTrayViewControllerAccessibility;
  -[NavTrayViewControllerAccessibility pressedHeaderView](&v2, sel_pressedHeaderView);
  UIAccessibilityPostNotification(*MEMORY[0x24BEBAEA0], 0);
}

- (void)_updateShareETADisclosure
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)NavTrayViewControllerAccessibility;
  -[NavTrayViewControllerAccessibility _updateShareETADisclosure](&v3, sel__updateShareETADisclosure);
  -[NavTrayViewControllerAccessibility _accessibilityUpdateETADisclosure](self, "_accessibilityUpdateETADisclosure");
}

- (void)_accessibilityUpdateETADisclosure
{
  _BOOL8 v3;
  void *v4;
  id v5;

  if ((-[NavTrayViewControllerAccessibility safeBoolForKey:](self, "safeBoolForKey:", CFSTR("_displayingInitialBanner")) & 1) != 0)
  {
    v3 = 1;
  }
  else
  {
    -[NavTrayViewControllerAccessibility safeArrayForKey:](self, "safeArrayForKey:", CFSTR("_receivingContacts"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v4, "count") != 0;

  }
  -[NavTrayViewControllerAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("shareETADisclosureButton"));
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setIsAccessibilityElement:", v3);

}

@end
