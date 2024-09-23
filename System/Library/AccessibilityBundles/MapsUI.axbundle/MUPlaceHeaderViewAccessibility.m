@implementation MUPlaceHeaderViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("MUPlaceHeaderView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("MUPlaceHeaderView"), CFSTR("_titleLabel"), "UILabel");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("MUPlaceHeaderView"), CFSTR("_secondaryTitleLabel"), "UILabel");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("MUPlaceHeaderView"), CFSTR("_verifiedLabel"), "UILabel");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("MUPlaceHeaderView"), CFSTR("_containmentLabel"), "MULinkView");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("MUPlaceHeaderView"), CFSTR("_heroImageView"), "MUImageView");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("MUPlaceHeaderView"), CFSTR("_transitInfoLabelView"), "MKTransitInfoLabelView");

}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (unint64_t)accessibilityTraits
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MUPlaceHeaderViewAccessibility;
  return *MEMORY[0x24BDF73C0] | -[MUPlaceHeaderViewAccessibility accessibilityTraits](&v3, sel_accessibilityTraits);
}

- (id)automationElements
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = (void *)MEMORY[0x24BDBCE30];
  -[MUPlaceHeaderViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_titleLabel"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[MUPlaceHeaderViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_secondaryTitleLabel"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MUPlaceHeaderViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_verifiedLabel"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[MUPlaceHeaderViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_containmentLabel"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[MUPlaceHeaderViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_heroImageView"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[MUPlaceHeaderViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_transitInfoLabelView"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "axArrayByIgnoringNilElementsWithCount:", 6, v4, v5, v6, v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

@end
