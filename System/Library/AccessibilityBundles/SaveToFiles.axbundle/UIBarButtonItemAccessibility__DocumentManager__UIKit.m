@implementation UIBarButtonItemAccessibility__DocumentManager__UIKit

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
  v9.super_class = (Class)UIBarButtonItemAccessibility__DocumentManager__UIKit;
  -[UIBarButtonItemAccessibility__DocumentManager__UIKit accessibilityLabel](&v9, sel_accessibilityLabel);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIBarButtonItemAccessibility__DocumentManager__UIKit safeValueForKeyPath:](self, "safeValueForKeyPath:", CFSTR("image.imageAsset"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "safeStringForKey:", CFSTR("assetName"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v5, "containsString:", CFSTR("Dots")) & 1) != 0
    || (objc_msgSend(v5, "containsString:", CFSTR("More")) & 1) != 0
    || (objc_msgSend(v5, "containsString:", CFSTR("ellipsis.circle")) & 1) != 0
    || (objc_msgSend(v5, "isEqualToString:", CFSTR("ellipsis")) & 1) != 0)
  {
    v6 = CFSTR("more");
  }
  else if ((objc_msgSend(v5, "containsString:", CFSTR("Duplicate")) & 1) != 0
         || (objc_msgSend(v5, "containsString:", CFSTR("plus.square.on.square")) & 1) != 0)
  {
    v6 = CFSTR("duplicate");
  }
  else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("folder.badge.plus")) & 1) != 0)
  {
    v6 = CFSTR("new.folder");
  }
  else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("square.grid.2x2")) & 1) != 0)
  {
    v6 = CFSTR("display.mode.icons");
  }
  else
  {
    if (!objc_msgSend(v5, "isEqualToString:", CFSTR("list.bullet")))
      goto LABEL_7;
    v6 = CFSTR("display.mode.list");
  }
  accessibilityLocalizedString(v6);
  v7 = objc_claimAutoreleasedReturnValue();

  v3 = (void *)v7;
LABEL_7:

  return v3;
}

@end
