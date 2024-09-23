@implementation UITextFieldAccessibility__ContactsUI__UIKit

+ (id)safeCategoryTargetClassName
{
  return CFSTR("UITextField");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (unint64_t)accessibilityTraits
{
  void *v3;
  int v4;
  objc_super v6;

  -[UITextFieldAccessibility__ContactsUI__UIKit accessibilityIdentification](self, "accessibilityIdentification");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", kAXPhotosTextFieldIdentifier);

  if (v4)
    return *MEMORY[0x24BDF73C0];
  v6.receiver = self;
  v6.super_class = (Class)UITextFieldAccessibility__ContactsUI__UIKit;
  return -[UITextFieldAccessibility__ContactsUI__UIKit accessibilityTraits](&v6, sel_accessibilityTraits);
}

- (BOOL)isAccessibilityElement
{
  void *v2;
  void *v3;
  int v4;
  void *v5;
  void *v6;
  objc_super v8;

  v2 = self;
  -[UITextFieldAccessibility__ContactsUI__UIKit accessibilityIdentification](self, "accessibilityIdentification");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", kAXPhotosTextFieldIdentifier);

  if (v4)
  {
    objc_msgSend(v2, "safeStringForKey:", CFSTR("text"));
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    if (v2)
    {
      objc_msgSend(MEMORY[0x24BDD14A8], "whitespaceCharacterSet");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v2, "stringByTrimmingCharactersInSet:", v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      LOBYTE(v2) = objc_msgSend(v6, "length") != 0;
    }
  }
  else
  {
    v8.receiver = v2;
    v8.super_class = (Class)UITextFieldAccessibility__ContactsUI__UIKit;
    LOBYTE(v2) = -[UITextFieldAccessibility__ContactsUI__UIKit isAccessibilityElement](&v8, sel_isAccessibilityElement);
  }
  return (char)v2;
}

@end
