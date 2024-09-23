@implementation SBHAddWidgetDetailSheetWidgetDescriptionViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SBHAddWidgetDetailSheetWidgetDescriptionView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBHAddWidgetDetailSheetWidgetDescriptionView"), CFSTR("titleLabel"), "@", 0);
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("SBHAddWidgetDetailSheetWidgetDescriptionView"), CFSTR("UIView"));

}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SBHAddWidgetDetailSheetWidgetDescriptionViewAccessibility;
  -[SBHAddWidgetDetailSheetWidgetDescriptionViewAccessibility _accessibilityLoadAccessibilityInformation](&v4, sel__accessibilityLoadAccessibilityInformation);
  -[SBHAddWidgetDetailSheetWidgetDescriptionViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("titleLabel"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
    UIAccessibilityPostNotification(*MEMORY[0x24BDF7328], v3);

}

- (BOOL)accessibilityElementsHidden
{
  double v3;
  CGFloat v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  void *v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  double v18;
  CGFloat v19;
  CGRect v21;
  CGRect v22;
  CGRect v23;
  CGRect v24;

  -[SBHAddWidgetDetailSheetWidgetDescriptionViewAccessibility accessibilityFrame](self, "accessibilityFrame");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[SBHAddWidgetDetailSheetWidgetDescriptionViewAccessibility _accessibilityAncestorIsKindOf:](self, "_accessibilityAncestorIsKindOf:", objc_opt_class());
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "accessibilityFrame");
  v13 = v12;
  v15 = v14;
  v17 = v16;
  v19 = v18;

  v21.origin.x = v4;
  v21.origin.y = v6;
  v21.size.width = v8;
  v21.size.height = v10;
  v23.origin.x = v13;
  v23.origin.y = v15;
  v23.size.width = v17;
  v23.size.height = v19;
  v22 = CGRectIntersection(v21, v23);
  v24.origin.x = v4;
  v24.origin.y = v6;
  v24.size.width = v8;
  v24.size.height = v10;
  return !CGRectEqualToRect(v22, v24);
}

- (void)layoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SBHAddWidgetDetailSheetWidgetDescriptionViewAccessibility;
  -[SBHAddWidgetDetailSheetWidgetDescriptionViewAccessibility layoutSubviews](&v3, sel_layoutSubviews);
  -[SBHAddWidgetDetailSheetWidgetDescriptionViewAccessibility _accessibilityLoadAccessibilityInformation](self, "_accessibilityLoadAccessibilityInformation");
}

@end
