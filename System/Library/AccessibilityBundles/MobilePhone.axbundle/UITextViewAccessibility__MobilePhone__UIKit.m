@implementation UITextViewAccessibility__MobilePhone__UIKit

+ (id)safeCategoryTargetClassName
{
  return CFSTR("UITextView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)_accessibilityActivateTextViewLink:(id)a3
{
  id v4;
  void *v5;
  char v6;

  v4 = a3;
  -[UITextViewAccessibility__MobilePhone__UIKit accessibilityContainer](self, "accessibilityContainer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "_accessibilityActivateTextViewLink:", v4);

  return v6;
}

@end
