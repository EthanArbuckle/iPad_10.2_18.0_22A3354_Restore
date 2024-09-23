@implementation UIDOMHTMLOptionSelectedItemAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("UIDOMHTMLOptionSelectedItem");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (id)accessibilityLanguage
{
  objc_super v3;
  SEL v4;
  UIDOMHTMLOptionSelectedItemAccessibility *v5;

  v5 = self;
  v4 = a2;
  v3.receiver = self;
  v3.super_class = (Class)UIDOMHTMLOptionSelectedItemAccessibility;
  return -[UIDOMHTMLOptionSelectedItemAccessibility accessibilityLanguage](&v3, sel_accessibilityLanguage);
}

- (id)accessibilityLabel
{
  objc_super v3;
  SEL v4;
  UIDOMHTMLOptionSelectedItemAccessibility *v5;

  v5 = self;
  v4 = a2;
  v3.receiver = self;
  v3.super_class = (Class)UIDOMHTMLOptionSelectedItemAccessibility;
  return -[UIDOMHTMLOptionSelectedItemAccessibility accessibilityLabel](&v3, sel_accessibilityLabel);
}

@end
