@implementation UIButtonAccessibility__Translate__UIKit

+ (id)safeCategoryTargetClassName
{
  return CFSTR("UIButton");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (unint64_t)accessibilityTraits
{
  unint64_t v3;
  void *v4;
  int v5;
  uint64_t v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)UIButtonAccessibility__Translate__UIKit;
  v3 = -[UIButtonAccessibility__Translate__UIKit accessibilityTraits](&v8, sel_accessibilityTraits);
  -[UIButtonAccessibility__Translate__UIKit accessibilityIdentifier](self, "accessibilityIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqualToString:", CFSTR("Play_at_1×"));

  v6 = *MEMORY[0x24BDF7408];
  if (!v5)
    v6 = 0;
  return v6 | v3;
}

@end
