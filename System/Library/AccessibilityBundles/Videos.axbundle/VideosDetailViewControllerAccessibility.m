@implementation VideosDetailViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("VideosDetailViewController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("VideosDetailViewController"), CFSTR("viewDidLoad"), "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("VideosDetailViewController"), CFSTR("artworkView"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("VideosDetailViewController"), CFSTR("_updateContentInsets"), "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("VideosDetailViewController"), CFSTR("shouldFloatHeader"), "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("VideosDetailViewController"), CFSTR("childContentScrollView"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("VideosDetailViewController"), CFSTR("headerContainmentView"), "@", 0);

}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)VideosDetailViewControllerAccessibility;
  -[VideosDetailViewControllerAccessibility _accessibilityLoadAccessibilityInformation](&v7, sel__accessibilityLoadAccessibilityInformation);
  -[VideosDetailViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("artworkView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setIsAccessibilityElement:", 1);
  accessibilityLocalizedString(CFSTR("video.poster"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAccessibilityLabel:", v4);

  -[VideosDetailViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("view"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAccessibilityIdentifier:", CFSTR("VideosDetailView"));

  -[VideosDetailViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("headerContainmentView"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setAccessibilityIdentifier:", CFSTR("AXContainedInCollectionView"));

}

- (void)viewDidLoad
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)VideosDetailViewControllerAccessibility;
  -[VideosDetailViewControllerAccessibility viewDidLoad](&v3, sel_viewDidLoad);
  -[VideosDetailViewControllerAccessibility _accessibilityLoadAccessibilityInformation](self, "_accessibilityLoadAccessibilityInformation");
}

- (void)_updateContentInsets
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double *v26;
  double v27;
  void *v28;
  void *v29;
  void *v30;
  double v31;
  void *v32;
  void *v33;
  double v34;
  double v35;
  void *v36;
  double v37;
  double v38;
  double v39;
  double v40;
  objc_super v41;
  char v42;

  v42 = 0;
  objc_opt_class();
  -[VideosDetailViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("childContentScrollView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "contentInset");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;
  objc_msgSend(v4, "contentOffset");
  v39 = v14;
  v40 = v13;
  v41.receiver = self;
  v41.super_class = (Class)VideosDetailViewControllerAccessibility;
  -[VideosDetailViewControllerAccessibility _updateContentInsets](&v41, sel__updateContentInsets);
  objc_msgSend(v4, "contentInset");
  v16 = v15;
  v18 = v17;
  v20 = v19;
  v22 = v21;
  if (UIAccessibilityIsVoiceOverRunning() && v18 == v8 && v16 == v6 && v22 == v12 && v20 == v10)
    objc_msgSend(v4, "setContentOffset:", v40, v39);
  v26 = (double *)MEMORY[0x24BDF7718];
  if ((-[VideosDetailViewControllerAccessibility safeBoolForKey:](self, "safeBoolForKey:", CFSTR("shouldFloatHeader")) & 1) != 0)
  {
    v27 = *v26;
  }
  else
  {
    v42 = 0;
    objc_opt_class();
    __UIAccessibilityCastAsClass();
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    if (v42)
      goto LABEL_21;
    v29 = v28;
    objc_msgSend(v28, "topLayoutGuide");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "length");
    v27 = v31;

  }
  v42 = 0;
  objc_opt_class();
  __UIAccessibilityCastAsClass();
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  if (v42)
LABEL_21:
    abort();
  v33 = v32;
  v34 = v26[1];
  v35 = v26[3];
  objc_msgSend(v32, "bottomLayoutGuide");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "length");
  v38 = v37;

  objc_msgSend(v4, "_accessibilitySetVisibleContentInset:", v27, v34, v38, v35);
}

@end
