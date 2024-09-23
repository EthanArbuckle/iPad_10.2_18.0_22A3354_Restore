@implementation UITextFieldAccessibility__HealthKit__UIKit

+ (id)safeCategoryTargetClassName
{
  return CFSTR("UITextField");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (id)accessibilityValue
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  objc_super v9;

  -[UITextFieldAccessibility__HealthKit__UIKit text](self, "text");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  AXBloodTypeStringFromString(v3, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    v6 = v4;
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)UITextFieldAccessibility__HealthKit__UIKit;
    -[UITextFieldAccessibility__HealthKit__UIKit accessibilityValue](&v9, sel_accessibilityValue);
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  v7 = v6;

  return v7;
}

@end
