@implementation CPSLaunchContentViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("CPSLaunchContentViewController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CPSLaunchContentViewController"), CFSTR("viewDidLoad"), "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CPSLaunchContentViewController"), CFSTR("_updateContent"), "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("CPSLaunchContentViewController"), CFSTR("_clipNameVibrantLabel"), "CPSVibrantLabel");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("CPSLaunchContentViewController"), CFSTR("_clipDescriptionVibrantLabel"), "CPSVibrantLabel");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("CPSLaunchContentViewController"), CFSTR("_openButton"), "UIButton");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("CPSLaunchContentViewController"), CFSTR("_closeButton"), "CPSVibrantButton");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("CPSLaunchContentViewController"), CFSTR("_clipInformationContainerView"), "UIView");
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CPSLaunchContentViewController"), CFSTR("_openAppClip:"), "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CPSLaunchContentViewController"), CFSTR("dismiss:"), "v", "@", 0);
  objc_msgSend(v3, "validateClass:", CFSTR("UITransitionView"));
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("CPSLaunchContentViewController"), CFSTR("UIViewController"));

}

- (CGRect)_axFrameForInformationContainerView
{
  void *v3;
  double v4;
  CGFloat v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  void *v12;
  double v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  double v17;
  CGFloat v18;
  double v19;
  CGFloat v20;
  CGRect v21;
  CGRect v23;

  -[CPSLaunchContentViewControllerAccessibility _axNameLabel](self, "_axNameLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "accessibilityFrame");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  -[CPSLaunchContentViewControllerAccessibility _axDescriptionLabel](self, "_axDescriptionLabel");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "accessibilityFrame");
  v14 = v13;
  v16 = v15;
  v18 = v17;
  v20 = v19;

  v21.origin.x = v5;
  v21.origin.y = v7;
  v21.size.width = v9;
  v21.size.height = v11;
  v23.origin.x = v14;
  v23.origin.y = v16;
  v23.size.width = v18;
  v23.size.height = v20;
  return CGRectUnion(v21, v23);
}

- (id)_axNameLabel
{
  return (id)-[CPSLaunchContentViewControllerAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("_clipNameVibrantLabel"));
}

- (id)_axDescriptionLabel
{
  return (id)-[CPSLaunchContentViewControllerAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("_clipDescriptionVibrantLabel"));
}

- (id)_axLabels
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x24BDBCE30];
  -[CPSLaunchContentViewControllerAccessibility _axNameLabel](self, "_axNameLabel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CPSLaunchContentViewControllerAccessibility _axDescriptionLabel](self, "_axDescriptionLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "axArrayByIgnoringNilElementsWithCount:", 2, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)_axInformationContainerView
{
  return (id)-[CPSLaunchContentViewControllerAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("_clipInformationContainerView"));
}

- (id)_axButtons
{
  void *v2;
  void *v3;

  -[CPSLaunchContentViewControllerAccessibility _axInformationContainerView](self, "_axInformationContainerView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_accessibilityFindSubviewDescendantsPassingTest:", &__block_literal_global_1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

uint64_t __57__CPSLaunchContentViewControllerAccessibility__axButtons__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  char isKindOfClass;

  v2 = a2;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (id)_axBackgroundView
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  char isKindOfClass;
  void *v10;

  objc_opt_class();
  -[CPSLaunchContentViewControllerAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("view"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_accessibilityFindAncestor:startWithSelf:", &__block_literal_global_215, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "subviews");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "count") != 2)
    goto LABEL_6;
  objc_msgSend(v6, "objectAtIndexedSubscript:", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

    goto LABEL_6;
  }
  objc_msgSend(v6, "objectAtIndexedSubscript:", 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  MEMORY[0x23490AD98](CFSTR("PRXCardContainerView"));
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
  {
LABEL_6:
    v10 = 0;
    goto LABEL_7;
  }
  objc_msgSend(v6, "objectAtIndexedSubscript:", 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_7:

  return v10;
}

uint64_t __64__CPSLaunchContentViewControllerAccessibility__axBackgroundView__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  char isKindOfClass;

  v2 = a2;
  MEMORY[0x23490AD98](CFSTR("UITransitionView"));
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (BOOL)accessibilityPerformEscape
{
  char v2;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  char v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2020000000;
  v7 = 0;
  AXPerformSafeBlock();
  v2 = *((_BYTE *)v5 + 24);
  _Block_object_dispose(&v4, 8);
  return v2;
}

void __73__CPSLaunchContentViewControllerAccessibility_accessibilityPerformEscape__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "dismiss:", 0);
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
  UIAccessibilityPostNotification(*MEMORY[0x24BDF7328], 0);
}

- (void)viewDidLoad
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CPSLaunchContentViewControllerAccessibility;
  -[CPSLaunchContentViewControllerAccessibility viewDidLoad](&v3, sel_viewDidLoad);
  -[CPSLaunchContentViewControllerAccessibility _accessibilityLoadAccessibilityInformation](self, "_accessibilityLoadAccessibilityInformation");
}

- (void)viewDidAppear:(BOOL)a3
{
  UIAccessibilityNotifications v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CPSLaunchContentViewControllerAccessibility;
  -[CPSLaunchContentViewControllerAccessibility viewDidAppear:](&v6, sel_viewDidAppear_, a3);
  v4 = *MEMORY[0x24BDF72C8];
  -[CPSLaunchContentViewControllerAccessibility _axNameLabel](self, "_axNameLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  UIAccessibilityPostNotification(v4, v5);

}

- (void)_updateContent
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CPSLaunchContentViewControllerAccessibility;
  -[CPSLaunchContentViewControllerAccessibility _updateContent](&v3, sel__updateContent);
  -[CPSLaunchContentViewControllerAccessibility _accessibilityLoadAccessibilityInformation](self, "_accessibilityLoadAccessibilityInformation");
}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  _QWORD v11[4];
  id v12;
  _QWORD v13[4];
  id v14;
  _QWORD v15[4];
  id v16;
  id location;
  objc_super v18;

  v18.receiver = self;
  v18.super_class = (Class)CPSLaunchContentViewControllerAccessibility;
  -[CPSLaunchContentViewControllerAccessibility _accessibilityLoadAccessibilityInformation](&v18, sel__accessibilityLoadAccessibilityInformation);
  -[CPSLaunchContentViewControllerAccessibility _axBackgroundView](self, "_axBackgroundView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CPSLaunchContentViewControllerAccessibility _axInformationContainerView](self, "_axInformationContainerView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setIsAccessibilityElement:", 1);
  accessibilityLocalizedString(CFSTR("popover.view.dismiss"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAccessibilityLabel:", v5);

  objc_msgSend(v4, "_setAccessibilityServesAsFirstElement:", 1);
  v6 = (void *)MEMORY[0x24BDBCE30];
  -[CPSLaunchContentViewControllerAccessibility _axLabels](self, "_axLabels");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CPSLaunchContentViewControllerAccessibility _axButtons](self, "_axButtons");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "axArrayWithPossiblyNilArrays:", 2, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAccessibilityElements:", v9);

  objc_initWeak(&location, self);
  v10 = MEMORY[0x24BDAC760];
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __89__CPSLaunchContentViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke;
  v15[3] = &unk_2501CF2C0;
  objc_copyWeak(&v16, &location);
  objc_msgSend(v3, "_setAccessibilityActivateBlock:", v15);
  v13[0] = v10;
  v13[1] = 3221225472;
  v13[2] = __89__CPSLaunchContentViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_2;
  v13[3] = &unk_2501CF2E8;
  objc_copyWeak(&v14, &location);
  objc_msgSend(v4, "_setAccessibilityFrameBlock:", v13);
  v11[0] = v10;
  v11[1] = 3221225472;
  v11[2] = __89__CPSLaunchContentViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_3;
  v11[3] = &unk_2501CF2C0;
  objc_copyWeak(&v12, &location);
  objc_msgSend(v4, "_setAccessibilityActivateBlock:", v11);
  objc_destroyWeak(&v12);
  objc_destroyWeak(&v14);
  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);

}

uint64_t __89__CPSLaunchContentViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke(uint64_t a1)
{
  id WeakRetained;
  uint64_t v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = objc_msgSend(WeakRetained, "accessibilityPerformEscape");

  return v2;
}

double __89__CPSLaunchContentViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  double v2;
  double v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_axFrameForInformationContainerView");
  v3 = v2;

  return v3;
}

uint64_t __89__CPSLaunchContentViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_3(uint64_t a1)
{
  id v2;

  objc_copyWeak(&v2, (id *)(a1 + 32));
  AXPerformSafeBlock();
  objc_destroyWeak(&v2);
  return 1;
}

void __89__CPSLaunchContentViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_4(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_openAppClip:", 0);

}

@end
