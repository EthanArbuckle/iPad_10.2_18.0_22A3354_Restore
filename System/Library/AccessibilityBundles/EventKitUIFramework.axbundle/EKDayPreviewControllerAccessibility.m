@implementation EKDayPreviewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("EKDayPreviewController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("EKDayPreviewController"), CFSTR("_dayView"), "EKDayView");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("EKDayView"), CFSTR("_dayContent"), "EKDayViewContent");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("EKDayViewContent"), CFSTR("_grid"), "EKDayGridView");

}

- (void)_axAnnotateDayView
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  objc_opt_class();
  -[EKDayPreviewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_dayView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsSafeCategory();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  objc_msgSend(v4, "accessibilityScrollView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsSafeCategory();
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setAccessibilityIsPreviewDayGridScroller:", 1);
  objc_opt_class();
  objc_msgSend(v4, "safeValueForKey:", CFSTR("_dayContent"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "safeValueForKey:", CFSTR("_grid"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsSafeCategory();
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "setAccessibilityIsPreviewGridView:", 1);
}

- (void)_accessibilityLoadAccessibilityInformation
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)EKDayPreviewControllerAccessibility;
  -[EKDayPreviewControllerAccessibility _accessibilityLoadAccessibilityInformation](&v3, sel__accessibilityLoadAccessibilityInformation);
  -[EKDayPreviewControllerAccessibility _axAnnotateDayView](self, "_axAnnotateDayView");
}

- (void)viewWillAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)EKDayPreviewControllerAccessibility;
  -[EKDayPreviewControllerAccessibility viewWillAppear:](&v4, sel_viewWillAppear_, a3);
  -[EKDayPreviewControllerAccessibility _axAnnotateDayView](self, "_axAnnotateDayView");
}

@end
