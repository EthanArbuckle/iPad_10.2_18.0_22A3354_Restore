@implementation UITextViewAccessibility__Social__UIKit

+ (id)safeCategoryTargetClassName
{
  return CFSTR("UITextView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (unint64_t)accessibilityTraits
{
  id v3;
  void *v4;
  int v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)UITextViewAccessibility__Social__UIKit;
  v3 = -[UITextViewAccessibility__Social__UIKit accessibilityTraits](&v7, sel_accessibilityTraits);
  -[UITextViewAccessibility__Social__UIKit accessibilityIdentification](self, "accessibilityIdentification");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqualToString:", CFSTR("FacebookTextView"));

  if (v5)
    return _AXTraitsRemoveTrait();
  return (unint64_t)v3;
}

- (id)accessibilityLabel
{
  void *v3;
  int v4;
  void *v5;
  objc_super v7;

  -[UITextViewAccessibility__Social__UIKit accessibilityIdentification](self, "accessibilityIdentification");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("FacebookTextView"));

  if (v4)
  {
    accessibilityLocalizedString(CFSTR("post.composition"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)UITextViewAccessibility__Social__UIKit;
    -[UITextViewAccessibility__Social__UIKit accessibilityLabel](&v7, sel_accessibilityLabel);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v5;
}

@end
