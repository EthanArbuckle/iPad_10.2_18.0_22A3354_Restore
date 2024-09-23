@implementation UIButtonBarButtonAccessibility__Music__UIKit

+ (id)safeCategoryTargetClassName
{
  return CFSTR("_UIButtonBarButton");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("_UIButtonBarButton"), CFSTR("_visualProvider"), "_UIButtonBarButtonVisualProvider");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("_UIButtonBarButtonVisualProviderIOS"), CFSTR("_titleButton"), "_UIModernBarButton");
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("_UIButtonBarButton"), CFSTR("initWithVisualProvider:"), "@", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("_UIButtonBarButton"), CFSTR("visualProvider"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("_UIButtonBarButtonVisualProvider"), CFSTR("contentView"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("UIButton"), CFSTR("imageView"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("UIImageView"), CFSTR("image"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("UIImage"), CFSTR("imageAsset"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("UIImageAsset"), CFSTR("assetName"), "@", 0);

}

- (id)accessibilityLabel
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)UIButtonBarButtonAccessibility__Music__UIKit;
  -[UIButtonBarButtonAccessibility__Music__UIKit accessibilityLabel](&v8, sel_accessibilityLabel);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v3, "length"))
  {
    -[UIButtonBarButtonAccessibility__Music__UIKit safeValueForKeyPath:](self, "safeValueForKeyPath:", CFSTR("visualProvider.contentView.imageView.image.imageAsset"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "safeStringForKey:", CFSTR("assetName"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v5, "isEqualToString:", CFSTR("Artist-Page-Context")))
    {
      accessibilityMusicLocalizedString(CFSTR("more.button"));
      v6 = objc_claimAutoreleasedReturnValue();

      v3 = (void *)v6;
    }

  }
  return v3;
}

- (BOOL)isAccessibilityElement
{
  void *v3;
  BOOL v4;
  objc_super v6;

  -[UIButtonBarButtonAccessibility__Music__UIKit accessibilityLabel](self, "accessibilityLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v6.receiver = self;
    v6.super_class = (Class)UIButtonBarButtonAccessibility__Music__UIKit;
    v4 = -[UIButtonBarButtonAccessibility__Music__UIKit isAccessibilityElement](&v6, sel_isAccessibilityElement);
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)UIButtonBarButtonAccessibility__Music__UIKit;
  -[UIButtonBarButtonAccessibility__Music__UIKit _accessibilityLoadAccessibilityInformation](&v9, sel__accessibilityLoadAccessibilityInformation);
  -[UIButtonBarButtonAccessibility__Music__UIKit safeValueForKey:](self, "safeValueForKey:", CFSTR("_visualProvider"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safeValueForKey:", CFSTR("_titleButton"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "accessibilityLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __90__UIButtonBarButtonAccessibility__Music__UIKit__accessibilityLoadAccessibilityInformation__block_invoke;
  v7[3] = &unk_2502C2920;
  v8 = v5;
  v6 = v5;
  objc_msgSend(v4, "_setIsAccessibilityElementBlock:", v7);

}

- (UIButtonBarButtonAccessibility__Music__UIKit)initWithVisualProvider:(id)a3
{
  UIButtonBarButtonAccessibility__Music__UIKit *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)UIButtonBarButtonAccessibility__Music__UIKit;
  v3 = -[UIButtonBarButtonAccessibility__Music__UIKit initWithVisualProvider:](&v5, sel_initWithVisualProvider_, a3);
  -[UIButtonBarButtonAccessibility__Music__UIKit _accessibilityLoadAccessibilityInformation](v3, "_accessibilityLoadAccessibilityInformation");

  return v3;
}

@end
