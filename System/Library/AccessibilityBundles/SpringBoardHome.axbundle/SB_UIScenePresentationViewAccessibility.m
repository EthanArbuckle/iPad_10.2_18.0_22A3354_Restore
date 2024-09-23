@implementation SB_UIScenePresentationViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("_UIScenePresentationView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:", CFSTR("SBIconView"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("NSObject"), CFSTR("_accessibilityFrameForSorting"), "{CGRect={CGPoint=dd}{CGSize=dd}}", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("NSObject"), CFSTR("_accessibilityCompareFrameForScrollParent:frame:fromOrientation:toOrientation:"), "{CGRect={CGPoint=dd}{CGSize=dd}}", "@", "{CGRect={CGPoint=dd}{CGSize=dd}}", "q", "q", 0);

}

- (CGRect)_accessibilityFrameForSorting
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

  -[SB_UIScenePresentationViewAccessibility _accessibilitySpringBoardIconView](self, "_accessibilitySpringBoardIconView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "_accessibilityFrameForSorting");
  }
  else
  {
    v17.receiver = self;
    v17.super_class = (Class)SB_UIScenePresentationViewAccessibility;
    -[SB_UIScenePresentationViewAccessibility _accessibilityFrameForSorting](&v17, sel__accessibilityFrameForSorting);
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

- (CGRect)_accessibilityCompareFrameForScrollParent:(id)a3 frame:(CGRect)a4 fromOrientation:(int64_t)a5 toOrientation:(int64_t)a6
{
  double height;
  double width;
  double y;
  double x;
  id v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  objc_super v28;
  CGRect result;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v13 = a3;
  -[SB_UIScenePresentationViewAccessibility _accessibilitySpringBoardIconView](self, "_accessibilitySpringBoardIconView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v14;
  if (v14)
  {
    objc_msgSend(v14, "_accessibilityCompareFrameForScrollParent:frame:fromOrientation:toOrientation:", v13, a5, a6, x, y, width, height);
  }
  else
  {
    v28.receiver = self;
    v28.super_class = (Class)SB_UIScenePresentationViewAccessibility;
    -[SB_UIScenePresentationViewAccessibility _accessibilityCompareFrameForScrollParent:frame:fromOrientation:toOrientation:](&v28, sel__accessibilityCompareFrameForScrollParent_frame_fromOrientation_toOrientation_, v13, a5, a6, x, y, width, height);
  }
  v20 = v16;
  v21 = v17;
  v22 = v18;
  v23 = v19;

  v24 = v20;
  v25 = v21;
  v26 = v22;
  v27 = v23;
  result.size.height = v27;
  result.size.width = v26;
  result.origin.y = v25;
  result.origin.x = v24;
  return result;
}

- (id)_accessibilitySpringBoardIconView
{
  return (id)-[SB_UIScenePresentationViewAccessibility _accessibilityFindAncestor:startWithSelf:](self, "_accessibilityFindAncestor:startWithSelf:", &__block_literal_global_6, 0);
}

@end
