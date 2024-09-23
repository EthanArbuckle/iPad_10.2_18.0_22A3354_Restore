@implementation UIBarButtonItemAccessibility__Tips__UIKit

+ (id)safeCategoryTargetClassName
{
  return CFSTR("UIBarButtonItem");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("UIBarButtonItem"), CFSTR("image"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("UIImage"), CFSTR("imageAsset"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("UIImageAsset"), CFSTR("assetName"), "@", 0);

}

- (id)accessibilityLabel
{
  void *v3;
  void *v4;
  void *v5;
  __CFString *v6;
  uint64_t v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)UIBarButtonItemAccessibility__Tips__UIKit;
  -[UIBarButtonItemAccessibility__Tips__UIKit accessibilityLabel](&v9, sel_accessibilityLabel);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIBarButtonItemAccessibility__Tips__UIKit safeValueForKeyPath:](self, "safeValueForKeyPath:", CFSTR("image.imageAsset"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "safeStringForKey:", CFSTR("assetName"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v5, "isEqualToString:", CFSTR("bookmark")) & 1) != 0)
  {
    v6 = CFSTR("Save");
LABEL_5:
    accessibilityLocalizedString(v6);
    v7 = objc_claimAutoreleasedReturnValue();

    v3 = (void *)v7;
    goto LABEL_6;
  }
  if (objc_msgSend(v5, "isEqualToString:", CFSTR("bookmark.fill")))
  {
    v6 = CFSTR("Remove from Saved Tips");
    goto LABEL_5;
  }
LABEL_6:

  return v3;
}

@end
