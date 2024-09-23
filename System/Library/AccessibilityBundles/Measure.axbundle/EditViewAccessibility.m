@implementation EditViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("Measure.EditView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("Measure.EditView"), CFSTR("UIView"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("Measure.EditView"), CFSTR("didTapEditButton"), "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("UIView"), CFSTR("setAlpha:"), "v", "d", 0);

}

- (void)setAlpha:(double)a3
{
  void *v5;
  double v6;
  double v7;
  double v8;
  objc_super v9;
  char v10;

  v10 = 0;
  objc_opt_class();
  __UIAccessibilityCastAsClass();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "alpha");
  v7 = v6;
  v9.receiver = self;
  v9.super_class = (Class)EditViewAccessibility;
  -[EditViewAccessibility setAlpha:](&v9, sel_setAlpha_, a3);
  objc_msgSend(v5, "alpha");
  if (vabdd_f64(v7, v8) >= 2.22044605e-16)
    UIAccessibilityPostNotification(*MEMORY[0x24BDF72C8], 0);

}

- (void)didTapEditButton
{
  void *v3;
  void *v4;
  objc_super v5;

  AXMeasureAccessibilityStateObserver();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "axHasConfirmedRectangle");

  v5.receiver = self;
  v5.super_class = (Class)EditViewAccessibility;
  -[EditViewAccessibility didTapEditButton](&v5, sel_didTapEditButton);
  accessibilityLocalizedString(CFSTR("DID_ADD_FIRST_POINT"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  AXMeasureAnnounceUpdatedMeasurement(v4, 0);

}

@end
