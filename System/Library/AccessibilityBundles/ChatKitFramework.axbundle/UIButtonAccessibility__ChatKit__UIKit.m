@implementation UIButtonAccessibility__ChatKit__UIKit

+ (id)safeCategoryTargetClassName
{
  return CFSTR("UIButton");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)isAccessibilityElement
{
  void *v3;
  int v4;
  void *v5;
  uint64_t v6;
  objc_super v8;

  -[UIButtonAccessibility__ChatKit__UIKit accessibilityIdentification](self, "accessibilityIdentification");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("CKTranscriptStatusButton"));

  if (v4)
  {
    -[UIButtonAccessibility__ChatKit__UIKit accessibilityLabel](self, "accessibilityLabel");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "length");

    if (!v6)
      return 0;
  }
  v8.receiver = self;
  v8.super_class = (Class)UIButtonAccessibility__ChatKit__UIKit;
  return -[UIButtonAccessibility__ChatKit__UIKit isAccessibilityElement](&v8, sel_isAccessibilityElement);
}

@end
