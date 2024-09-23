@implementation EKEventConferenceInformationDetailItemAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("EKEventConferenceInformationDetailItem");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("EKEventTextDetailItem"), CFSTR("cellForSubitemAtIndex:"), "@", "Q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("EKEventConferenceInformationDetailItem"), CFSTR("_cell"), "EKEventDetailCell");

}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)EKEventConferenceInformationDetailItemAccessibility;
  -[EKEventConferenceInformationDetailItemAccessibility _accessibilityLoadAccessibilityInformation](&v7, sel__accessibilityLoadAccessibilityInformation);
  accessibilityLocalizedString(CFSTR("join.conference"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  -[EKEventConferenceInformationDetailItemAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("_cell"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "accessoryView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setAccessibilityLabel:", v3);

}

- (id)cellForSubitemAtIndex:(unint64_t)a3
{
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)EKEventConferenceInformationDetailItemAccessibility;
  -[EKEventConferenceInformationDetailItemAccessibility cellForSubitemAtIndex:](&v6, sel_cellForSubitemAtIndex_, a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKEventConferenceInformationDetailItemAccessibility _accessibilityLoadAccessibilityInformation](self, "_accessibilityLoadAccessibilityInformation");
  return v4;
}

@end
