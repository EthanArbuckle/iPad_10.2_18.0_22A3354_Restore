@implementation BreakoutDetailsViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("Arcade.BreakoutDetailsView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("Arcade.BreakoutDetailsView"), CFSTR("accessibilityBadgeLabel"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("Arcade.BreakoutDetailsView"), CFSTR("accessibilityTitleLabel"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("Arcade.BreakoutDetailsView"), CFSTR("accessibilityDescriptionLabel"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("Arcade.BreakoutDetailsView"), CFSTR("accessibilityCallToActionButton"), "@", 0);

}

- (BOOL)isAccessibilityElement
{
  return 0;
}

- (id)accessibilityLabel
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v9;

  -[BreakoutDetailsViewAccessibility _axDescriptionLabel](self, "_axDescriptionLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "accessibilityLabel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "stringByReplacingOccurrencesOfString:withString:", CFSTR("/"), CFSTR(" / "));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[BreakoutDetailsViewAccessibility _axBadgeLabel](self, "_axBadgeLabel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[BreakoutDetailsViewAccessibility _axTitleLabel](self, "_axTitleLabel");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAXStringForVariables();
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)_axCallToActionButton
{
  return (id)-[BreakoutDetailsViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("accessibilityCallToActionButton"));
}

- (id)_axBadgeLabel
{
  return (id)-[BreakoutDetailsViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("accessibilityBadgeLabel"));
}

- (id)_axTitleLabel
{
  return (id)-[BreakoutDetailsViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("accessibilityTitleLabel"));
}

- (id)_axDescriptionLabel
{
  return (id)-[BreakoutDetailsViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("accessibilityDescriptionLabel"));
}

- (BOOL)_accessibilityPerformCallToAction:(id)a3
{
  void *v3;

  -[BreakoutDetailsViewAccessibility _axCallToActionButton](self, "_axCallToActionButton", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "accessibilityActivate");

  return 1;
}

- (id)accessibilityCustomActions
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v10;

  v3 = (void *)MEMORY[0x24BDBCEB8];
  v10.receiver = self;
  v10.super_class = (Class)BreakoutDetailsViewAccessibility;
  -[BreakoutDetailsViewAccessibility accessibilityCustomActions](&v10, sel_accessibilityCustomActions);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "arrayWithArray:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[BreakoutDetailsViewAccessibility _axCallToActionButton](self, "_axCallToActionButton");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "accessibilityLabel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v7, "length"))
  {
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6788]), "initWithName:target:selector:", v7, self, sel__accessibilityPerformCallToAction_);
    objc_msgSend(v5, "axSafelyAddObject:", v8);

  }
  return v5;
}

- (id)automationElements
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)BreakoutDetailsViewAccessibility;
  -[BreakoutDetailsViewAccessibility automationElements](&v10, sel_automationElements);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");
  v5 = v4;
  if (v4)
  {
    v6 = v4;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  v7 = v6;

  -[BreakoutDetailsViewAccessibility _axCallToActionButton](self, "_axCallToActionButton");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "axSafelyAddObject:", v8);

  return v7;
}

- (id)accessibilityElements
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[BreakoutDetailsViewAccessibility _axBadgeLabel](self, "_axBadgeLabel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setIsAccessibilityElement:", 1);

  -[BreakoutDetailsViewAccessibility _axBadgeLabel](self, "_axBadgeLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "axSafelyAddObject:", v5);

  -[BreakoutDetailsViewAccessibility _axTitleLabel](self, "_axTitleLabel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setIsAccessibilityElement:", 1);

  -[BreakoutDetailsViewAccessibility _axTitleLabel](self, "_axTitleLabel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setAccessibilityTraits:", *MEMORY[0x24BDF73C0]);

  -[BreakoutDetailsViewAccessibility _axTitleLabel](self, "_axTitleLabel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "axSafelyAddObject:", v8);

  -[BreakoutDetailsViewAccessibility _axDescriptionLabel](self, "_axDescriptionLabel");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setIsAccessibilityElement:", 1);

  -[BreakoutDetailsViewAccessibility _axDescriptionLabel](self, "_axDescriptionLabel");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "axSafelyAddObject:", v10);

  -[BreakoutDetailsViewAccessibility _axCallToActionButton](self, "_axCallToActionButton");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setIsAccessibilityElement:", 1);

  -[BreakoutDetailsViewAccessibility _axCallToActionButton](self, "_axCallToActionButton");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setAccessibilityTraits:", *MEMORY[0x24BDF73B0]);

  -[BreakoutDetailsViewAccessibility _axCallToActionButton](self, "_axCallToActionButton");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "axSafelyAddObject:", v13);

  return v3;
}

@end
