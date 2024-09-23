@implementation _TVCarouselViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("_TVCarouselViewController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("_TVCarouselViewController"), CFSTR("UIViewController"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("UIPageControl"), CFSTR("currentPage"), "q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("_TVCarouselViewController"), CFSTR("_carouselView"), "_TVCarouselView");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("_TVCarouselViewController"), CFSTR("_collectionElement"), "IKCollectionElement");
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("_TVCarouselView"), CFSTR("pageControl"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("_TVCarouselView"), CFSTR("headerView"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("IKCollectionElement"), CFSTR("sections"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("IKDataSourceElement"), CFSTR("elementForItemAtIndex:"), "@", "q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("IKViewElement"), CFSTR("_dataDictionary"), "NSDictionary");

}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  void *v4;
  uint64_t v5;
  _QWORD v6[4];
  id v7;
  _QWORD v8[4];
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id from;
  id v16;
  id location;
  objc_super v18;

  v18.receiver = self;
  v18.super_class = (Class)_TVCarouselViewControllerAccessibility;
  -[_TVCarouselViewControllerAccessibility _accessibilityLoadAccessibilityInformation](&v18, sel__accessibilityLoadAccessibilityInformation);
  -[_TVCarouselViewControllerAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("_carouselView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safeValueForKey:", CFSTR("pageControl"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setIsAccessibilityElement:", 1);
  objc_msgSend(v3, "setAccessibilityTraits:", *MEMORY[0x24BDF73A0] | *MEMORY[0x24BDF73B0] | *MEMORY[0x24BDF7430]);
  objc_initWeak(&location, self);
  objc_initWeak(&v16, v4);
  objc_initWeak(&from, v3);
  v5 = MEMORY[0x24BDAC760];
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __84___TVCarouselViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke;
  v13[3] = &unk_2503A57A8;
  objc_copyWeak(&v14, &from);
  objc_msgSend(v3, "_setAccessibilityLabelBlock:", v13);
  v10[0] = v5;
  v10[1] = 3221225472;
  v10[2] = __84___TVCarouselViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_2;
  v10[3] = &unk_2503A57F8;
  objc_copyWeak(&v11, &location);
  objc_copyWeak(&v12, &v16);
  objc_msgSend(v3, "_setAccessibilityValueBlock:", v10);
  v8[0] = v5;
  v8[1] = 3221225472;
  v8[2] = __84___TVCarouselViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_2_221;
  v8[3] = &unk_2503A5820;
  objc_copyWeak(&v9, &v16);
  objc_msgSend(v3, "_setAccessibilityIncrementBlock:", v8);
  v6[0] = v5;
  v6[1] = 3221225472;
  v6[2] = __84___TVCarouselViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_3;
  v6[3] = &unk_2503A5820;
  objc_copyWeak(&v7, &v16);
  objc_msgSend(v3, "_setAccessibilityDecrementBlock:", v6);
  objc_destroyWeak(&v7);
  objc_destroyWeak(&v9);
  objc_destroyWeak(&v12);
  objc_destroyWeak(&v11);
  objc_destroyWeak(&v14);
  objc_destroyWeak(&from);
  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);

}

- (void)viewDidLoad
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_TVCarouselViewControllerAccessibility;
  -[_TVCarouselViewControllerAccessibility viewDidLoad](&v3, sel_viewDidLoad);
  -[_TVCarouselViewControllerAccessibility _accessibilityLoadAccessibilityInformation](self, "_accessibilityLoadAccessibilityInformation");
}

@end
