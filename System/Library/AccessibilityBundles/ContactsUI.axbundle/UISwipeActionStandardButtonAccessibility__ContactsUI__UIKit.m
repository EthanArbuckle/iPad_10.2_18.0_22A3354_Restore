@implementation UISwipeActionStandardButtonAccessibility__ContactsUI__UIKit

+ (id)safeCategoryTargetClassName
{
  return CFSTR("UISwipeActionStandardButton");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("UISwipeActionStandardButton"), CFSTR("UIButton"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("UIButton"), CFSTR("imageView"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("UIImage"), CFSTR("_imageAsset"), "UIImageAsset");
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("UIImageAsset"), CFSTR("assetName"), "@", 0);

}

- (id)accessibilityLabel
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  objc_super v11;
  char v12;

  v12 = 0;
  objc_opt_class();
  -[UISwipeActionStandardButtonAccessibility__ContactsUI__UIKit safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("imageView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "image");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "safeValueForKey:", CFSTR("_imageAsset"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "safeStringForKey:", CFSTR("assetName"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v7, "isEqualToString:", CFSTR("envelope.fill")))
  {
    accessibilityLocalizedString(CFSTR("action.email.all"));
    v8 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v11.receiver = self;
    v11.super_class = (Class)UISwipeActionStandardButtonAccessibility__ContactsUI__UIKit;
    -[UISwipeActionStandardButtonAccessibility__ContactsUI__UIKit accessibilityLabel](&v11, sel_accessibilityLabel);
    v8 = objc_claimAutoreleasedReturnValue();
  }
  v9 = (void *)v8;

  return v9;
}

@end
