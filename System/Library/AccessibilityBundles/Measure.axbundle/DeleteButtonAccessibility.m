@implementation DeleteButtonAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("Measure.DeleteButton");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("ASVRoundedButton"), CFSTR("ASVButton"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("Measure.DeleteButton"), CFSTR("deleteButton"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("Measure.DeleteButton"), CFSTR("initWithFrame:"), "@", "{CGRect={CGPoint=dd}{CGSize=dd}}", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("Measure.DeleteButton"), CFSTR("tapDeleteFrom:"), "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("ASVButton"), CFSTR("button"), "@", 0);

}

- (void)_axAnnotateActualButton
{
  void *v2;
  id v3;

  -[DeleteButtonAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("deleteButton"));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safeValueForKey:", CFSTR("button"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accessibilitySetIdentification:", CFSTR("AXMeasureDeleteButton"));

}

- (void)_accessibilityLoadAccessibilityInformation
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)DeleteButtonAccessibility;
  -[DeleteButtonAccessibility _accessibilityLoadAccessibilityInformation](&v3, sel__accessibilityLoadAccessibilityInformation);
  -[DeleteButtonAccessibility _axAnnotateActualButton](self, "_axAnnotateActualButton");
}

- (DeleteButtonAccessibility)initWithFrame:(CGRect)a3
{
  DeleteButtonAccessibility *v3;
  DeleteButtonAccessibility *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)DeleteButtonAccessibility;
  v3 = -[DeleteButtonAccessibility initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
    -[DeleteButtonAccessibility _axAnnotateActualButton](v3, "_axAnnotateActualButton");
  return v4;
}

- (void)tapDeleteFrom:(id)a3
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)DeleteButtonAccessibility;
  -[DeleteButtonAccessibility tapDeleteFrom:](&v4, sel_tapDeleteFrom_, a3);
  accessibilityLocalizedString(CFSTR("DID_CLEAR_POINTS"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  AXMeasureSpeakMeasurementAnnouncement(v3);

}

@end
