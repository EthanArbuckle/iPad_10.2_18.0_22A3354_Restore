@implementation SBPictureInPictureWindowAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SBPictureInPictureWindow");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:", CFSTR("PGLayerHostView"));
}

- (BOOL)_accessibilityIsIsolatedWindow
{
  return 1;
}

- (id)_accessibilityElementCommunityIdentifier
{
  return CFSTR("PIPWindow");
}

- (BOOL)_accessibilityUseWindowBoundsForOutOfBoundsChecking
{
  return 1;
}

- (CGRect)accessibilityFrame
{
  Class v3;
  void *v4;
  void *v5;
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
  objc_super v22;
  CGRect result;

  v3 = NSClassFromString(CFSTR("PGLayerHostView"));
  if (v3
    && (-[SBPictureInPictureWindowAccessibility _accessibilityDescendantOfType:](self, "_accessibilityDescendantOfType:", v3), (v4 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    v5 = v4;
    objc_msgSend(v4, "accessibilityFrame");
    v7 = v6;
    v9 = v8;
    v11 = v10;
    v13 = v12;

  }
  else
  {
    v22.receiver = self;
    v22.super_class = (Class)SBPictureInPictureWindowAccessibility;
    -[SBPictureInPictureWindowAccessibility accessibilityFrame](&v22, sel_accessibilityFrame);
    v7 = v14;
    v9 = v15;
    v11 = v16;
    v13 = v17;
  }
  v18 = v7;
  v19 = v9;
  v20 = v11;
  v21 = v13;
  result.size.height = v21;
  result.size.width = v20;
  result.origin.y = v19;
  result.origin.x = v18;
  return result;
}

- (id)accessibilityLabel
{
  return accessibilityLocalizedString(CFSTR("pip.element.community.name"));
}

- (id)accessibilityIdentifier
{
  return CFSTR("PIP-SBInteractionPassThroughView");
}

@end
