@implementation PosterSectionFooterViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("PosterBoard.PosterSectionFooterView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("PosterBoard.PosterSectionFooterView"), CFSTR("UIView"));
  objc_msgSend(v3, "validateClass:hasSwiftField:withSwiftType:", CFSTR("PosterBoard.PosterSectionFooterView"), CFSTR("text"), "Optional<String>");
  objc_msgSend(v3, "validateClass:hasSwiftField:withSwiftType:", CFSTR("PosterBoard.PosterSectionFooterView"), CFSTR("titleLabel"), "Optional<UILabel>");

}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  return (id)-[PosterSectionFooterViewAccessibility safeSwiftStringForKey:](self, "safeSwiftStringForKey:", CFSTR("text"));
}

- (void)_accessibilityLoadAccessibilityInformation
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)PosterSectionFooterViewAccessibility;
  -[PosterSectionFooterViewAccessibility _accessibilityLoadAccessibilityInformation](&v2, sel__accessibilityLoadAccessibilityInformation);
}

- (CGRect)accessibilityFrame
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  CGRect result;

  -[PosterSectionFooterViewAccessibility safeSwiftValueForKey:](self, "safeSwiftValueForKey:", CFSTR("titleLabel"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accessibilityFrame");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;

  v11 = v4;
  v12 = v6;
  v13 = v8;
  v14 = v10;
  result.size.height = v14;
  result.size.width = v13;
  result.origin.y = v12;
  result.origin.x = v11;
  return result;
}

- (void)layoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PosterSectionFooterViewAccessibility;
  -[PosterSectionFooterViewAccessibility layoutSubviews](&v3, sel_layoutSubviews);
  -[PosterSectionFooterViewAccessibility _accessibilityLoadAccessibilityInformation](self, "_accessibilityLoadAccessibilityInformation");
}

@end
