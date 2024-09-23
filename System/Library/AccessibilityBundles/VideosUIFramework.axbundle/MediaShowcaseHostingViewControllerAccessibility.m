@implementation MediaShowcaseHostingViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("VideosUI.MediaShowcaseHostingViewController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasSwiftField:withSwiftType:", CFSTR("VideosUI.MediaShowcasingTemplateController"), CFSTR("titleView"), "Optional<UIView>");
  objc_msgSend(v3, "validateClass:hasSwiftField:withSwiftType:", CFSTR("VideosUI.MediaShowcaseHostingViewController"), CFSTR("paginatedMediaController"), "PaginatedMediaController");
  objc_msgSend(v3, "validateClass:hasSwiftField:withSwiftType:", CFSTR("VideosUI.MediaShowcaseHostingViewController"), CFSTR("toolBar"), "MediaShowcasingToolbar");
  objc_msgSend(v3, "validateClass:hasSwiftField:withSwiftType:", CFSTR("VideosUI.PaginatedMediaController"), CFSTR("pageControl"), "UIPageControl");

}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  void *v4;
  _QWORD v5[4];
  id v6;
  char v7;
  id location;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)MediaShowcaseHostingViewControllerAccessibility;
  -[MediaShowcaseHostingViewControllerAccessibility _accessibilityLoadAccessibilityInformation](&v9, sel__accessibilityLoadAccessibilityInformation);
  objc_initWeak(&location, self);
  v7 = 0;
  objc_opt_class();
  __UIAccessibilityCastAsClass();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __93__MediaShowcaseHostingViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke;
  v5[3] = &unk_2503D2C88;
  objc_copyWeak(&v6, &location);
  objc_msgSend(v4, "_setAccessibilityElementsBlock:", v5);

  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

id __93__MediaShowcaseHostingViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_opt_class();
  __UIAccessibilityCastAsClass();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "parentViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "safeSwiftValueForKey:", CFSTR("titleView"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "axSafelyAddObject:", v5);

  objc_msgSend(v2, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_accessibilityFindSubviewDescendantsPassingTest:", &__block_literal_global_16);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "axSafelyAddObjectsFromArray:", v7);
  objc_msgSend(v2, "view");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "_accessibilityFindSubviewDescendant:", &__block_literal_global_203);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "axSafelyAddObject:", v9);
  objc_msgSend(v2, "view");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "_accessibilityFindSubviewDescendant:", &__block_literal_global_206);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "axSafelyAddObject:", v11);
  return v3;
}

uint64_t __93__MediaShowcaseHostingViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  char isKindOfClass;

  v2 = a2;
  MEMORY[0x2349244BC](CFSTR("VUIButton"));
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

BOOL __93__MediaShowcaseHostingViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_3()
{
  objc_class *v0;
  void *v1;
  _BOOL8 v2;

  v0 = (objc_class *)objc_opt_class();
  NSStringFromClass(v0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "rangeOfString:", CFSTR("PaginatedMediaMetadataContainerView")) != 0x7FFFFFFFFFFFFFFFLL;

  return v2;
}

uint64_t __93__MediaShowcaseHostingViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_4(uint64_t a1, void *a2)
{
  id v2;
  char isKindOfClass;

  v2 = a2;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (void)viewDidLoad
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MediaShowcaseHostingViewControllerAccessibility;
  -[MediaShowcaseHostingViewControllerAccessibility viewDidLoad](&v3, sel_viewDidLoad);
  -[MediaShowcaseHostingViewControllerAccessibility _accessibilityLoadAccessibilityInformation](self, "_accessibilityLoadAccessibilityInformation");
}

@end
