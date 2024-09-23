@implementation SBSystemApertureViewControllerAccessibility

- (BOOL)_collapseExpandedElementIfPossible
{
  BOOL v3;
  id v5;
  BOOL v6;
  id location;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SBSystemApertureViewControllerAccessibility;
  v3 = -[SBSystemApertureViewControllerAccessibility _collapseExpandedElementIfPossible](&v8, sel__collapseExpandedElementIfPossible);
  objc_initWeak(&location, self);
  objc_copyWeak(&v5, &location);
  v6 = v3;
  AXPerformBlockOnMainThreadAfterDelay();
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
  return v3;
}

void __81__SBSystemApertureViewControllerAccessibility__collapseExpandedElementIfPossible__block_invoke(uint64_t a1)
{
  id WeakRetained;
  UIAccessibilityNotifications v3;
  void *v4;
  id v5;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "safeArrayForKey:", CFSTR("_orderedContainerViews"));
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (*(_BYTE *)(a1 + 40) && objc_msgSend(v5, "count"))
  {
    v3 = *MEMORY[0x24BDF72C8];
    objc_msgSend(v5, "firstObject");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    UIAccessibilityPostNotification(v3, v4);

  }
}

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SBSystemApertureViewController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("SBSystemApertureViewController"), CFSTR("_systemApertureContainsAnyContent"), "BOOL");
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("SBSystemApertureViewController"), CFSTR("UIViewController"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBSystemApertureViewController"), CFSTR("_axRevealHiddenElementIfPossible"), "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBSystemApertureViewController"), CFSTR("_collapseExpandedElementIfPossible"), "B", 0);
  objc_msgSend(v3, "validateClass:", CFSTR("SBSystemApertureContainerView"));
  objc_msgSend(v3, "validateClass:", CFSTR("SBLockElementViewProvider"));
  objc_msgSend(v3, "validateClass:", CFSTR("SBFlashlightActivityElement"));

}

- (BOOL)isAccessibilityElement
{
  return -[SBSystemApertureViewControllerAccessibility safeBoolForKey:](self, "safeBoolForKey:", CFSTR("_systemApertureContainsAnyContent")) ^ 1;
}

- (id)accessibilityLabel
{
  return accessibilityLocalizedString(CFSTR("empty.pill"));
}

- (BOOL)accessibilityRespondsToUserInteraction
{
  return 0;
}

- (id)accessibilityPath
{
  void *v3;
  void *v4;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  CGFloat v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  double v16;
  double v17;
  uint64_t v18;
  void *v19;
  double v21;
  double v22;
  double v23;
  objc_super v24;
  CGRect v25;
  CGRect v26;
  CGRect v27;
  CGRect v28;
  CGRect v29;

  -[SBSystemApertureViewControllerAccessibility _accessibilityContainerView](self, "_accessibilityContainerView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "accessibilityFrame");
    x = v25.origin.x;
    y = v25.origin.y;
    width = v25.size.width;
    height = v25.size.height;
    v26 = CGRectInset(v25, -5.0, -5.0);
    v21 = v26.size.height;
    v9 = v26.origin.x;
    v23 = v26.origin.x;
    v10 = v26.origin.y;
    v11 = v26.size.width;
    v12 = CGRectGetWidth(v26);
    v27.origin.x = x;
    v27.origin.y = y;
    v27.size.width = width;
    v27.size.height = height;
    v22 = v12 / CGRectGetWidth(v27);
    v28.origin.x = v9;
    v28.origin.y = v10;
    v28.size.width = v11;
    v28.size.height = v21;
    v13 = CGRectGetHeight(v28);
    v29.origin.x = x;
    v29.origin.y = y;
    v29.size.width = width;
    v29.size.height = height;
    v14 = v13 / CGRectGetHeight(v29);
    objc_msgSend(v4, "layer");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "cornerRadius");
    v17 = fmax(v22, v14) * v16;

    objc_msgSend(MEMORY[0x24BDF6870], "_bezierPathWithArcRoundedRect:cornerRadius:", v23, v10, v11, v21, v17);
    v18 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v24.receiver = self;
    v24.super_class = (Class)SBSystemApertureViewControllerAccessibility;
    -[SBSystemApertureViewControllerAccessibility accessibilityPath](&v24, sel_accessibilityPath);
    v18 = objc_claimAutoreleasedReturnValue();
  }
  v19 = (void *)v18;

  return v19;
}

- (CGRect)accessibilityFrame
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
  objc_super v17;
  CGRect result;

  -[SBSystemApertureViewControllerAccessibility _accessibilityContainerView](self, "_accessibilityContainerView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "accessibilityFrame");
  }
  else
  {
    v17.receiver = self;
    v17.super_class = (Class)SBSystemApertureViewControllerAccessibility;
    -[SBSystemApertureViewControllerAccessibility accessibilityFrame](&v17, sel_accessibilityFrame);
  }
  v9 = v5;
  v10 = v6;
  v11 = v7;
  v12 = v8;

  v13 = v9;
  v14 = v10;
  v15 = v11;
  v16 = v12;
  result.size.height = v16;
  result.size.width = v15;
  result.origin.y = v14;
  result.origin.x = v13;
  return result;
}

- (id)accessibilityCustomActions
{
  void *v3;
  void *v4;
  void *v5;
  char isKindOfClass;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  _QWORD v12[5];
  _QWORD v13[2];

  v13[1] = *MEMORY[0x24BDAC8D0];
  -[SBSystemApertureViewControllerAccessibility safeArrayForKey:](self, "safeArrayForKey:", CFSTR("childViewControllers"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3
    && objc_msgSend(v3, "count")
    && (objc_msgSend(v4, "firstObject"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        NSClassFromString(CFSTR("SBFlashlightActivityElement")),
        isKindOfClass = objc_opt_isKindOfClass(),
        v5,
        (isKindOfClass & 1) != 0))
  {
    v7 = 0;
  }
  else
  {
    v8 = objc_alloc(MEMORY[0x24BDF6788]);
    accessibilityLocalizedString(CFSTR("window.expand"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __73__SBSystemApertureViewControllerAccessibility_accessibilityCustomActions__block_invoke;
    v12[3] = &unk_250367AF8;
    v12[4] = self;
    v10 = (void *)objc_msgSend(v8, "initWithName:actionHandler:", v9, v12);

    v13[0] = v10;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v13, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v7;
}

uint64_t __73__SBSystemApertureViewControllerAccessibility_accessibilityCustomActions__block_invoke()
{
  AXPerformSafeBlock();
  return 1;
}

uint64_t __73__SBSystemApertureViewControllerAccessibility_accessibilityCustomActions__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_axRevealHiddenElementIfPossible");
}

- (id)_accessibilityContainerView
{
  void *v2;
  void *v3;

  -[SBSystemApertureViewControllerAccessibility safeArrayForKey:](self, "safeArrayForKey:", CFSTR("_orderedContainerViews"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "count"))
  {
    objc_msgSend(v2, "firstObject");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

- (BOOL)_accessibilityIsJindo
{
  return 1;
}

@end
