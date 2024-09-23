@implementation VideosUI_SportsCanonicalBannerCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("VideosUI.SportsCanonicalBannerCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:hasSwiftField:withSwiftType:", CFSTR("VideosUI.SportsCanonicalBannerCell"), CFSTR("newBannerAccessoryView"), "Optional<UIView>");
}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  void *v4;
  _QWORD v5[4];
  id v6[2];
  id location;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)VideosUI_SportsCanonicalBannerCellAccessibility;
  -[VideosUI_SportsCanonicalBannerCellAccessibility _accessibilityLoadAccessibilityInformation](&v8, sel__accessibilityLoadAccessibilityInformation);
  -[VideosUI_SportsCanonicalBannerCellAccessibility safeSwiftValueForKey:](self, "safeSwiftValueForKey:", CFSTR("newBannerAccessoryView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x2349244BC](CFSTR("SwiftUI.AccessibilityNode"));
  objc_initWeak(&location, self);
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __93__VideosUI_SportsCanonicalBannerCellAccessibility__accessibilityLoadAccessibilityInformation__block_invoke;
  v5[3] = &unk_2503D2908;
  objc_copyWeak(v6, &location);
  v6[1] = v4;
  objc_msgSend(v3, "_setAccessibilityElementsHiddenBlock:", v5);
  objc_destroyWeak(v6);
  objc_destroyWeak(&location);

}

@end
