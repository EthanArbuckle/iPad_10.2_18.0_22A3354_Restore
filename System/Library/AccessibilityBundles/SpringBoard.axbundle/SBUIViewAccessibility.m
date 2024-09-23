@implementation SBUIViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("UIView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:", CFSTR("SBReusableSnapshotItemContainer"));
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("SBFolderContainerView"), CFSTR("UIView"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("UIView"), CFSTR("_isTransparentFocusRegion"), "B", 0);

}

- (BOOL)_accessibilityOverridesInvalidFrames
{
  void *v3;
  char v4;
  objc_super v6;

  -[SBUIViewAccessibility accessibilityIdentification](self, "accessibilityIdentification");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("UnlockSpringViewWithBadHeight"));

  if ((v4 & 1) != 0)
    return 1;
  v6.receiver = self;
  v6.super_class = (Class)SBUIViewAccessibility;
  return -[SBUIViewAccessibility _accessibilityOverridesInvalidFrames](&v6, sel__accessibilityOverridesInvalidFrames);
}

- (BOOL)_accessibilityPointInside:(CGPoint)a3 withEvent:(id)a4
{
  double y;
  double x;
  id v7;
  void *v8;
  char v9;
  BOOL v10;
  objc_super v12;

  y = a3.y;
  x = a3.x;
  v7 = a4;
  -[SBUIViewAccessibility accessibilityIdentification](self, "accessibilityIdentification");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isEqualToString:", CFSTR("UnlockSpringViewWithBadHeight"));

  if ((v9 & 1) != 0)
  {
    v10 = 1;
  }
  else
  {
    v12.receiver = self;
    v12.super_class = (Class)SBUIViewAccessibility;
    v10 = -[SBUIViewAccessibility _accessibilityPointInside:withEvent:](&v12, sel__accessibilityPointInside_withEvent_, v7, x, y);
  }

  return v10;
}

- (BOOL)_accessibilitySupportsActivateAction
{
  void *v3;
  BOOL v4;
  objc_super v6;

  -[SBUIViewAccessibility accessibilityIdentifier](self, "accessibilityIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CameraButton")) & 1) != 0)
  {
    v4 = 1;
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)SBUIViewAccessibility;
    v4 = -[SBUIViewAccessibility _accessibilitySupportsActivateAction](&v6, sel__accessibilitySupportsActivateAction);
  }

  return v4;
}

- (BOOL)_axPerformGestureForAction:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  uint64_t v6;

  v3 = (void *)MEMORY[0x24BE006F0];
  v4 = a3;
  objc_msgSend(v3, "server");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "gesture");

  LOBYTE(v4) = objc_msgSend(v5, "performMedusaGesture:", v6);
  return (char)v4;
}

- (BOOL)_isTransparentFocusRegion
{
  unsigned int v3;
  void *v4;
  void *v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  CGFloat v14;
  CGFloat v15;
  CGFloat v16;
  CGFloat v17;
  objc_super v19;
  CGRect v20;
  CGRect v21;

  v19.receiver = self;
  v19.super_class = (Class)SBUIViewAccessibility;
  v3 = -[SBUIViewAccessibility _isTransparentFocusRegion](&v19, sel__isTransparentFocusRegion);
  if (-[SBUIViewAccessibility _accessibilityIsFKARunningForFocusItem](self, "_accessibilityIsFKARunningForFocusItem"))
  {
    objc_opt_class();
    __UIAccessibilityCastAsClass();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "superview");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v4, "frame");
      v7 = v6;
      v9 = v8;
      v11 = v10;
      v13 = v12;
      objc_msgSend(v5, "frame");
      v21.origin.x = v14;
      v21.origin.y = v15;
      v21.size.width = v16;
      v21.size.height = v17;
      v20.origin.x = v7;
      v20.origin.y = v9;
      v20.size.width = v11;
      v20.size.height = v13;
      v3 |= CGRectEqualToRect(v20, v21);
    }

  }
  return v3;
}

- (double)_axScaleTransformForFocusLayerLineWidth
{
  void *v3;
  int v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  objc_super v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;

  -[SBUIViewAccessibility accessibilityIdentifier](self, "accessibilityIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("ax-focusLayerView"));

  if (v4)
  {
    objc_opt_class();
    __UIAccessibilityCastAsClass();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    if (v5)
    {
      objc_msgSend(v5, "transform3D");
      v7 = *(double *)&v12 + *((double *)&v14 + 1) + *(double *)&v17;
    }
    else
    {
      v7 = 0.0;
    }
    v9 = 1.0 / (v7 / 3.0);

  }
  else
  {
    v11.receiver = self;
    v11.super_class = (Class)SBUIViewAccessibility;
    -[SBUIViewAccessibility _axScaleTransformForFocusLayerLineWidth](&v11, sel__axScaleTransformForFocusLayerLineWidth);
    return v8;
  }
  return v9;
}

@end
