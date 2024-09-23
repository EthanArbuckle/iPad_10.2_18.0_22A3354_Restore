@implementation SKUIGiftThemePickerViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SKUIGiftThemePickerViewController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SKUIGiftThemePickerViewController"), CFSTR("loadView"), "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SKUIGiftThemePickerViewController"), CFSTR("collectionView: cellForItemAtIndexPath:"), "@", "@", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("SKUIGiftThemePickerViewController"), CFSTR("_pageControl"), "UIPageControl");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("SKUIGiftThemePickerViewController"), CFSTR("_themes"), "NSArray");
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SKUIGiftTheme"), CFSTR("themeName"), "@", 0);

}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SKUIGiftThemePickerViewControllerAccessibility;
  -[SKUIGiftThemePickerViewControllerAccessibility _accessibilityLoadAccessibilityInformation](&v4, sel__accessibilityLoadAccessibilityInformation);
  -[SKUIGiftThemePickerViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_pageControl"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAccessibilityIdentifier:", CFSTR("GiftThemePageControl"));

}

- (void)loadView
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SKUIGiftThemePickerViewControllerAccessibility;
  -[SKUIGiftThemePickerViewControllerAccessibility loadView](&v3, sel_loadView);
  -[SKUIGiftThemePickerViewControllerAccessibility _accessibilityLoadAccessibilityInformation](self, "_accessibilityLoadAccessibilityInformation");
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  unint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  objc_super v18;

  v6 = a3;
  v7 = a4;
  v18.receiver = self;
  v18.super_class = (Class)SKUIGiftThemePickerViewControllerAccessibility;
  -[SKUIGiftThemePickerViewControllerAccessibility collectionView:cellForItemAtIndexPath:](&v18, sel_collectionView_cellForItemAtIndexPath_, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  -[SKUIGiftThemePickerViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_themes"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = objc_msgSend(v7, "item");
  if (v11 < objc_msgSend(v10, "count"))
  {
    objc_msgSend(v10, "objectAtIndex:", objc_msgSend(v7, "item"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "safeValueForKey:", CFSTR("themeName"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "stringByReplacingOccurrencesOfString:withString:", CFSTR(" "), &stru_24FF2D518);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("gift.theme.%@"), v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    accessibilitySKUILocalizedString(v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setAccessibilityLabel:", v16);

  }
  return v8;
}

@end
