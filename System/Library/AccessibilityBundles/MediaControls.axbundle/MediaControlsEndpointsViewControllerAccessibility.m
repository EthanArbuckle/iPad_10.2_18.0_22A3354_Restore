@implementation MediaControlsEndpointsViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("MediaControlsEndpointsViewController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MediaControlsEndpointsViewController"), CFSTR("viewWillAppear:"), "v", "B", 0);
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("MediaControlsEndpointsViewController"), CFSTR("UIViewController"));
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("MediaControlsEndpointsViewController"), CFSTR("MediaControlsCollectionViewController"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MediaControlsCollectionViewController"), CFSTR("scrollView"), "@", 0);

}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MediaControlsEndpointsViewControllerAccessibility;
  -[MediaControlsEndpointsViewControllerAccessibility _accessibilityLoadAccessibilityInformation](&v6, sel__accessibilityLoadAccessibilityInformation);
  -[MediaControlsEndpointsViewControllerAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("view"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAccessibilityContainerType:", 4);
  accessibilityLocalizedString(CFSTR("media.controls.container.label"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAccessibilityLabel:", v4);

  objc_msgSend(v3, "setAccessibilityNavigationStyle:", 2);
  -[MediaControlsEndpointsViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("scrollView"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "accessibilitySetIdentification:", CFSTR("AXMediaControlsScrollViewIdentifier"));

}

- (void)viewWillAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)MediaControlsEndpointsViewControllerAccessibility;
  -[MediaControlsEndpointsViewControllerAccessibility viewWillAppear:](&v4, sel_viewWillAppear_, a3);
  -[MediaControlsEndpointsViewControllerAccessibility _accessibilityLoadAccessibilityInformation](self, "_accessibilityLoadAccessibilityInformation");
}

- (BOOL)accessibilityPerformEscape
{
  BOOL v3;
  objc_super v5;
  uint64_t v6;
  uint64_t v7;
  void (*v8)(uint64_t);
  void *v9;
  MediaControlsEndpointsViewControllerAccessibility *v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  char v15;

  v12 = 0;
  v13 = &v12;
  v14 = 0x2020000000;
  v15 = 0;
  v6 = MEMORY[0x24BDAC760];
  v7 = 3221225472;
  v8 = __79__MediaControlsEndpointsViewControllerAccessibility_accessibilityPerformEscape__block_invoke;
  v9 = &unk_2502725E0;
  v10 = self;
  v11 = &v12;
  AXPerformSafeBlock();
  if (*((_BYTE *)v13 + 24))
  {
    v3 = 1;
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)MediaControlsEndpointsViewControllerAccessibility;
    v3 = -[MediaControlsEndpointsViewControllerAccessibility accessibilityPerformEscape](&v5, sel_accessibilityPerformEscape);
    *((_BYTE *)v13 + 24) = v3;
  }
  _Block_object_dispose(&v12, 8);
  return v3;
}

void __79__MediaControlsEndpointsViewControllerAccessibility_accessibilityPerformEscape__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;

  objc_opt_class();
  __UIAccessibilityCastAsClass();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "parentViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  NSClassFromString(CFSTR("CCUIContentModuleContainerViewController"));
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(v2, "dismissViewControllerAnimated:completion:", 1, 0);
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
  }

}

@end
