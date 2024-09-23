@implementation AKToolbarViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("AKToolbarView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("AKToolbarView"), CFSTR("initWithFrame:"), "@", "{CGRect={CGPoint=dd}{CGSize=dd}}", 0);
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("AKToolbarView"), CFSTR("_toolbar"), "UIToolbar");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("AKToolbarView"), CFSTR("_undoButton"), "UIBarButtonItem");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("AKToolbarView"), CFSTR("_redoButton"), "UIBarButtonItem");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("AKToolbarView"), CFSTR("_shapesPickerButton"), "UIBarButtonItem");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("AKToolbarView"), CFSTR("_attributesPickerButton"), "AKAttributesPickerButton");

}

- (BOOL)_accessibilityUseAccessibilityFrameForHittest
{
  return 1;
}

- (BOOL)_accessibilityOnlyComparesByXAxis
{
  return 1;
}

- (BOOL)shouldGroupAccessibilityChildren
{
  return 1;
}

- (AKToolbarViewAccessibility)initWithFrame:(CGRect)a3
{
  AKToolbarViewAccessibility *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)AKToolbarViewAccessibility;
  v3 = -[AKToolbarViewAccessibility initWithFrame:](&v5, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  -[AKToolbarViewAccessibility _accessibilityLoadAccessibilityInformation](v3, "_accessibilityLoadAccessibilityInformation");

  return v3;
}

- (void)_accessibilityLoadAccessibilityInformation
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
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)AKToolbarViewAccessibility;
  -[AKToolbarViewAccessibility _accessibilityLoadAccessibilityInformation](&v12, sel__accessibilityLoadAccessibilityInformation);
  -[AKToolbarViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_toolbar"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setShouldGroupAccessibilityChildren:", 0);

  -[AKToolbarViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_undoButton"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  accessibilityLocalizedString(CFSTR("undo.button"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAccessibilityLabel:", v5);

  -[AKToolbarViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_redoButton"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  accessibilityLocalizedString(CFSTR("redo.button"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setAccessibilityLabel:", v7);

  -[AKToolbarViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_shapesPickerButton"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  accessibilityLocalizedString(CFSTR("add.shape.button"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setAccessibilityLabel:", v9);

  -[AKToolbarViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_attributesPickerButton"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  accessibilityLocalizedString(CFSTR("shape.attributes"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setAccessibilityLabel:", v11);

}

@end
