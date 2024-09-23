@implementation PXPhotosViewRoundedAccessoryButtonAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("PXPhotosViewRoundedAccessoryButton");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (Class)_axCuratedLibraryUIViewControllerClass
{
  JUMPOUT(0x2348C1804);
}

- (void)_setAxCuratedLibraryUIViewControllerClass:(Class)a3
{
  __UIAccessibilitySetAssociatedObject();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:", CFSTR("PXCuratedLibraryUIViewController"));
  objc_msgSend(v3, "validateClass:", CFSTR("LemonadeCarouselItemCuratedLibraryView_ContainerViewController"));
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("PXPhotosViewRoundedAccessoryButton"), CFSTR("UIButton"));
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("LemonadeCuratedLibraryView_ContainerViewController"), CFSTR("UIViewController"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PXCuratedLibraryUIViewController"), CFSTR("isCollapsed"), "B", 0);
  objc_msgSend(v3, "validateClass:hasSwiftField:withSwiftType:", CFSTR("LemonadeCuratedLibraryView_ContainerViewController"), CFSTR("viewModel"), "LemonadeCarouselViewModel");
  objc_msgSend(v3, "validateClass:hasSwiftField:withSwiftType:", CFSTR("PhotosUICore.LemonadeCarouselViewModel"), CFSTR("allPhotosViewController"), "UIViewController & LemonadeAllPhotosViewController");

}

- (BOOL)isAccessibilityElement
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  -[PXPhotosViewRoundedAccessoryButtonAccessibility _accessibilityLemonadeCuratedLibraryViewController](self, "_accessibilityLemonadeCuratedLibraryViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  objc_msgSend(v2, "safeSwiftValueForKey:", CFSTR("viewModel"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safeSwiftValueForKey:", CFSTR("allPhotosViewController"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v3) = objc_msgSend(v5, "safeBoolForKey:", CFSTR("isCollapsed")) ^ 1;
  return (char)v3;
}

- (id)accessibilityLabel
{
  void *v3;
  void *v4;
  void *v5;
  __CFString *v6;
  uint64_t v7;
  void *v8;
  objc_super v10;

  -[PXPhotosViewRoundedAccessoryButtonAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("configuration"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safeValueForKey:", CFSTR("image"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "accessibilityIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v5, "isEqualToString:", CFSTR("video")))
  {
    v6 = CFSTR("filter.video");
  }
  else if (objc_msgSend(v5, "isEqualToString:", CFSTR("photo")))
  {
    v6 = CFSTR("filter.photo");
  }
  else if (objc_msgSend(v5, "isEqualToString:", CFSTR("heart.fill")))
  {
    v6 = CFSTR("filter.favorites");
  }
  else if (objc_msgSend(v5, "isEqualToString:", CFSTR("slider.horizontal.3")))
  {
    v6 = CFSTR("filter.edited");
  }
  else if (objc_msgSend(v5, "isEqualToString:", CFSTR("camera.viewfinder")))
  {
    v6 = CFSTR("filter.screenshot");
  }
  else if (objc_msgSend(v5, "isEqualToString:", CFSTR("line.horizontal.3.decrease")))
  {
    v6 = CFSTR("filter.multiple.options");
  }
  else
  {
    if ((objc_msgSend(v5, "isEqualToString:", CFSTR("arrow.up.arrow.down")) & 1) == 0
      && !objc_msgSend(v5, "isEqualToString:", CFSTR("line.3.horizontal.decrease")))
    {
      v10.receiver = self;
      v10.super_class = (Class)PXPhotosViewRoundedAccessoryButtonAccessibility;
      -[PXPhotosViewRoundedAccessoryButtonAccessibility accessibilityLabel](&v10, sel_accessibilityLabel);
      v7 = objc_claimAutoreleasedReturnValue();
      goto LABEL_17;
    }
    v6 = CFSTR("filter.sort");
  }
  accessibilityPhotosUICoreLocalizedString(v6);
  v7 = objc_claimAutoreleasedReturnValue();
LABEL_17:
  v8 = (void *)v7;

  return v8;
}

- (unint64_t)accessibilityTraits
{
  unint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  uint64_t v8;
  unint64_t v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)PXPhotosViewRoundedAccessoryButtonAccessibility;
  v3 = -[PXPhotosViewRoundedAccessoryButtonAccessibility accessibilityTraits](&v11, sel_accessibilityTraits);
  -[PXPhotosViewRoundedAccessoryButtonAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("configuration"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "safeValueForKey:", CFSTR("image"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "accessibilityIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v6, "isEqualToString:", CFSTR("line.3.horizontal.decrease"));
  v8 = *MEMORY[0x24BDF73E8];
  if (!v7)
    v8 = 0;
  v9 = v8 | v3;

  return v9;
}

- (id)_accessibilityLemonadeCuratedLibraryViewController
{
  void *v3;
  void *v4;
  _QWORD v6[5];

  if (!-[PXPhotosViewRoundedAccessoryButtonAccessibility _axCuratedLibraryUIViewControllerClass](self, "_axCuratedLibraryUIViewControllerClass"))-[PXPhotosViewRoundedAccessoryButtonAccessibility _setAxCuratedLibraryUIViewControllerClass:](self, "_setAxCuratedLibraryUIViewControllerClass:", MEMORY[0x2348C1678](CFSTR("LemonadeCuratedLibraryView_ContainerViewController")));
  if (!-[PXPhotosViewRoundedAccessoryButtonAccessibility _axCuratedLibraryUIViewControllerClass](self, "_axCuratedLibraryUIViewControllerClass"))return 0;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __101__PXPhotosViewRoundedAccessoryButtonAccessibility__accessibilityLemonadeCuratedLibraryViewController__block_invoke;
  v6[3] = &unk_24FF068F8;
  v6[4] = self;
  -[PXPhotosViewRoundedAccessoryButtonAccessibility _accessibilityFindAncestor:startWithSelf:](self, "_accessibilityFindAncestor:startWithSelf:", v6, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_accessibilityViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

uint64_t __101__PXPhotosViewRoundedAccessoryButtonAccessibility__accessibilityLemonadeCuratedLibraryViewController__block_invoke(uint64_t a1, void *a2)
{
  void *v3;

  objc_msgSend(a2, "_accessibilityViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "_axCuratedLibraryUIViewControllerClass");
  LOBYTE(a1) = objc_opt_isKindOfClass();

  return a1 & 1;
}

@end
