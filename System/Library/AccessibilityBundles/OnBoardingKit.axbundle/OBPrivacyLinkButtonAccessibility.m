@implementation OBPrivacyLinkButtonAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("OBPrivacyLinkButton");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("OBPrivacyLinkButton"), CFSTR("UIButton"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("OBPrivacyLinkButton"), CFSTR("textView"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("OBPrivacyLinkButton"), CFSTR("_iconView"), "UIImageView");

}

- (BOOL)accessibilityActivate
{
  void *v3;
  void *v4;
  BOOL v5;
  objc_super v7;
  char v8;

  v8 = 0;
  objc_opt_class();
  __UIAccessibilityCastAsClass();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "sendActionsForControlEvents:", 0x2000);
    v5 = 1;
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)OBPrivacyLinkButtonAccessibility;
    v5 = -[OBPrivacyLinkButtonAccessibility accessibilityActivate](&v7, sel_accessibilityActivate);
  }

  return v5;
}

- (void)layoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)OBPrivacyLinkButtonAccessibility;
  -[OBPrivacyLinkButtonAccessibility layoutSubviews](&v3, sel_layoutSubviews);
  -[OBPrivacyLinkButtonAccessibility _accessibilityLoadAccessibilityInformation](self, "_accessibilityLoadAccessibilityInformation");
}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)OBPrivacyLinkButtonAccessibility;
  -[OBPrivacyLinkButtonAccessibility _accessibilityLoadAccessibilityInformation](&v7, sel__accessibilityLoadAccessibilityInformation);
  -[OBPrivacyLinkButtonAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("_iconView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  __UIAccessibilityCastAsClass();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "image");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    accessibilityLocalizedString(CFSTR("privacy.icon"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setAccessibilityLabel:", v6);

    objc_msgSend(v4, "setIsAccessibilityElement:", 1);
    objc_msgSend(v4, "setAccessibilityTraits:", *MEMORY[0x24BDFEF30]);
  }

}

- (id)automationElements
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x24BDBCE30];
  -[OBPrivacyLinkButtonAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("_iconView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "axArrayByIgnoringNilElementsWithCount:", 1, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)accessibilityElements
{
  return 0;
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  objc_super v8;

  -[OBPrivacyLinkButtonAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("textView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "accessibilityValue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v4, "length"))
  {
    v5 = v4;
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)OBPrivacyLinkButtonAccessibility;
    -[OBPrivacyLinkButtonAccessibility accessibilityLabel](&v8, sel_accessibilityLabel);
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;

  return v6;
}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x24BDF73B0];
}

- (id)_accessibilitySupplementaryFooterViews
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x24BDBCEB8];
  v8.receiver = self;
  v8.super_class = (Class)OBPrivacyLinkButtonAccessibility;
  -[OBPrivacyLinkButtonAccessibility _accessibilitySupplementaryFooterViews](&v8, sel__accessibilitySupplementaryFooterViews);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "arrayWithArray:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[OBPrivacyLinkButtonAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("iconView"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
    objc_msgSend(v5, "axSafelyAddObject:", v6);

  return v5;
}

@end
