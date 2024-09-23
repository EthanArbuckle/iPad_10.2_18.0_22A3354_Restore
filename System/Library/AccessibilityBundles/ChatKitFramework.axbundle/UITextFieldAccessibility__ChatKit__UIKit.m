@implementation UITextFieldAccessibility__ChatKit__UIKit

+ (id)safeCategoryTargetClassName
{
  return CFSTR("UITextField");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)_accessibilityOverridesInvalidFrames
{
  void *v3;
  char v4;
  objc_super v6;

  -[UITextFieldAccessibility__ChatKit__UIKit accessibilityIdentification](self, "accessibilityIdentification");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("GroupNameField"));

  if ((v4 & 1) != 0)
    return 1;
  v6.receiver = self;
  v6.super_class = (Class)UITextFieldAccessibility__ChatKit__UIKit;
  return -[UITextFieldAccessibility__ChatKit__UIKit _accessibilityOverridesInvalidFrames](&v6, sel__accessibilityOverridesInvalidFrames);
}

@end
