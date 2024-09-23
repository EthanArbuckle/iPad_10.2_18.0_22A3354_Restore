@implementation PXUIScrollViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("PXUIScrollViewController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("PXUIScrollViewController"), CFSTR("_scrollView"), "_PXUIScrollView");
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PXUIScrollViewController"), CFSTR("scrollViewActiveRect"), "{CGRect={CGPoint=dd}{CGSize=dd}}", 0);

}

- (void)_axAdjustScrollViewInsetsWithNavController:(id)a3
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  double v18;
  double v19;
  void *v20;
  void *v21;
  void *v22;
  CGRect v23;
  CGRect v24;

  v4 = a3;
  -[PXUIScrollViewControllerAccessibility accessibilityIdentification](self, "accessibilityIdentification");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqualToString:", CFSTR("AXPhotosDetailsUIViewController"));

  if (v6)
  {
    -[PXUIScrollViewControllerAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("_scrollView"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "window");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "windowScene");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "statusBarManager");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "statusBarFrame");
    v12 = v11;

    if (v4)
    {
      objc_msgSend(v4, "navigationBar");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "bounds");
      v12 = v12 + CGRectGetHeight(v23);

    }
    MEMORY[0x2348C1678](CFSTR("PUNavigationController"));
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v4, "safeValueForKey:", CFSTR("_extendedToolbar"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "_accessibilityFindSubviewDescendantsPassingTest:", &__block_literal_global_6);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v15 = 0;
    }
    objc_opt_class();
    objc_msgSend(v15, "firstObject");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    __UIAccessibilityCastAsClass();
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (v17)
    {
      objc_msgSend(v17, "frame");
      v19 = v18;
    }
    else
    {
      v19 = 0.0;
    }
    objc_msgSend(MEMORY[0x24BDF6FF8], "_applicationKeyWindow");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "rootViewController");
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v21, "tabBar");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "bounds");
      v19 = v19 + CGRectGetHeight(v24);

    }
    objc_msgSend(v7, "_accessibilitySetVisibleContentInset:", v12, 0.0, v19, 0.0);

  }
}

uint64_t __84__PXUIScrollViewControllerAccessibility__axAdjustScrollViewInsetsWithNavController___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  char isKindOfClass;

  v2 = a2;
  MEMORY[0x2348C1678](CFSTR("PUScrubberView"));
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (CGRect)scrollViewActiveRect
{
  double v3;
  CGFloat x;
  double v5;
  CGFloat y;
  double v7;
  CGFloat width;
  double v9;
  double height;
  void *v11;
  int v12;
  CGFloat v13;
  double v14;
  void *v15;
  int v16;
  double v17;
  double v18;
  double v19;
  double v20;
  objc_super v21;
  CGRect v22;
  CGRect v23;
  CGRect result;

  v21.receiver = self;
  v21.super_class = (Class)PXUIScrollViewControllerAccessibility;
  -[PXUIScrollViewControllerAccessibility scrollViewActiveRect](&v21, sel_scrollViewActiveRect);
  x = v3;
  y = v5;
  width = v7;
  height = v9;
  -[PXUIScrollViewControllerAccessibility accessibilityIdentification](self, "accessibilityIdentification");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "isEqualToString:", CFSTR("AXExplorerViewControllerScrollViewController"));

  if (v12)
  {
    v13 = -100.0;
    v14 = 0.0;
LABEL_5:
    v22.origin.x = x;
    v22.origin.y = y;
    v22.size.width = width;
    v22.size.height = height;
    v23 = CGRectInset(v22, v13, v14);
    x = v23.origin.x;
    y = v23.origin.y;
    width = v23.size.width;
    height = v23.size.height;
    goto LABEL_6;
  }
  -[PXUIScrollViewControllerAccessibility accessibilityIdentification](self, "accessibilityIdentification");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "isEqualToString:", CFSTR("AXPhotosDetailsUIViewController"));

  if (v16)
  {
    v14 = -height;
    v13 = 0.0;
    goto LABEL_5;
  }
LABEL_6:
  v17 = x;
  v18 = y;
  v19 = width;
  v20 = height;
  result.size.height = v20;
  result.size.width = v19;
  result.origin.y = v18;
  result.origin.x = v17;
  return result;
}

@end
