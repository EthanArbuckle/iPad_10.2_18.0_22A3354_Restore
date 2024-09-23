@implementation UITextFieldAccessibility__PhotoLibrary__UIKit

+ (id)safeCategoryTargetClassName
{
  return CFSTR("UITextField");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (id)accessibilityPlaceholderValue
{
  void *v3;
  void *v4;
  void *v5;
  void *v7;
  uint64_t v8;
  objc_super v9;

  -[UITextFieldAccessibility__PhotoLibrary__UIKit accessibilityIdentification](self, "accessibilityIdentification");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v3, "isEqualToString:", CFSTR("PhotoShareAlbumNameTextField")))
    goto LABEL_4;
  -[UITextFieldAccessibility__PhotoLibrary__UIKit safeValueForKey:](self, "safeValueForKey:", CFSTR("text"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "length"))
  {

LABEL_4:
    goto LABEL_5;
  }
  -[UITextFieldAccessibility__PhotoLibrary__UIKit safeValueForKey:](self, "safeValueForKey:", CFSTR("attributedText"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "length");

  if (!v8)
  {
    -[UITextFieldAccessibility__PhotoLibrary__UIKit _accessibilityValueForKey:](self, "_accessibilityValueForKey:", CFSTR("AXPlaceholder"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    return v5;
  }
LABEL_5:
  v9.receiver = self;
  v9.super_class = (Class)UITextFieldAccessibility__PhotoLibrary__UIKit;
  -[UITextFieldAccessibility__PhotoLibrary__UIKit accessibilityPlaceholderValue](&v9, sel_accessibilityPlaceholderValue);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  return v5;
}

@end
