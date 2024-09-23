@implementation _TVRMatchPointArtworkViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("_TVRMatchPointArtworkView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("_TVRMatchPointArtworkView"), CFSTR("_selectIndicator"), "UIView");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("_TVRMatchPointArtworkView"), CFSTR("_upImageView"), "UIImageView");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("_TVRMatchPointArtworkView"), CFSTR("_rightImageView"), "UIImageView");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("_TVRMatchPointArtworkView"), CFSTR("_downImageView"), "UIImageView");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("_TVRMatchPointArtworkView"), CFSTR("_leftImageView"), "UIImageView");

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
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  double v14;
  double v15;
  double v16;
  double v17;
  UIView *v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  CGFloat v33;
  double v34;
  objc_super v35;
  CGRect v36;
  CGRect v37;
  CGRect v38;
  CGRect v39;
  CGRect v40;
  CGRect v41;
  CGRect v42;
  CGRect v43;

  v35.receiver = self;
  v35.super_class = (Class)_TVRMatchPointArtworkViewAccessibility;
  -[_TVRMatchPointArtworkViewAccessibility _accessibilityLoadAccessibilityInformation](&v35, sel__accessibilityLoadAccessibilityInformation);
  -[_TVRMatchPointArtworkViewAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("_selectIndicator"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[_TVRMatchPointArtworkViewAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("_upImageView"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[_TVRMatchPointArtworkViewAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("_rightImageView"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[_TVRMatchPointArtworkViewAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("_downImageView"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[_TVRMatchPointArtworkViewAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("_leftImageView"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setIsAccessibilityElement:", 1);
  objc_msgSend(v4, "setIsAccessibilityElement:", 1);
  objc_msgSend(v5, "setIsAccessibilityElement:", 1);
  objc_msgSend(v6, "setIsAccessibilityElement:", 1);
  objc_msgSend(v7, "setIsAccessibilityElement:", 1);
  accessibilityLocalizedString(CFSTR("tv.remote.touchpad.select.button"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAccessibilityLabel:", v8);

  accessibilityLocalizedString(CFSTR("tv.remote.touchpad.up.button"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAccessibilityLabel:", v9);

  accessibilityLocalizedString(CFSTR("tv.remote.touchpad.right.button"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAccessibilityLabel:", v10);

  accessibilityLocalizedString(CFSTR("tv.remote.touchpad.down.button"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setAccessibilityLabel:", v11);

  accessibilityLocalizedString(CFSTR("tv.remote.touchpad.left.button"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setAccessibilityLabel:", v12);

  v13 = *MEMORY[0x24BDF73B0];
  objc_msgSend(v3, "setAccessibilityTraits:", *MEMORY[0x24BDF73B0]);
  objc_msgSend(v4, "setAccessibilityTraits:", v13);
  objc_msgSend(v5, "setAccessibilityTraits:", v13);
  objc_msgSend(v6, "setAccessibilityTraits:", v13);
  objc_msgSend(v7, "setAccessibilityTraits:", v13);
  objc_msgSend(v3, "_accessibilitySetScannerActivateBehavior:", 1);
  objc_msgSend(v4, "_accessibilitySetScannerActivateBehavior:", 1);
  objc_msgSend(v5, "_accessibilitySetScannerActivateBehavior:", 1);
  objc_msgSend(v6, "_accessibilitySetScannerActivateBehavior:", 1);
  objc_msgSend(v7, "_accessibilitySetScannerActivateBehavior:", 1);
  objc_msgSend(v3, "accessibilityFrame");
  v15 = v14;
  v17 = v16;
  objc_opt_class();
  __UIAccessibilityCastAsClass();
  v18 = (UIView *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "center");
  v34 = v19;
  objc_msgSend(v4, "center");
  v21 = v20;
  objc_msgSend(v5, "center");
  v23 = v22;
  objc_msgSend(v5, "center");
  v25 = v24;
  objc_msgSend(v6, "center");
  v27 = v26;
  objc_msgSend(v6, "center");
  v29 = v28;
  objc_msgSend(v7, "center");
  v31 = v30;
  objc_msgSend(v7, "center");
  if (v18)
  {
    v33 = v32 - v17 * 0.5;
    v36.origin.x = v34 - v15 * 0.5;
    v36.origin.y = v21 - v17 * 0.5;
    v36.size.width = v15;
    v36.size.height = v17;
    v37 = UIAccessibilityConvertFrameToScreenCoordinates(v36, v18);
    objc_msgSend(v4, "setAccessibilityFrame:", v37.origin.x, v37.origin.y, v37.size.width, v37.size.height);
    v38.origin.x = v23 - v15 * 0.5;
    v38.origin.y = v25 - v17 * 0.5;
    v38.size.width = v15;
    v38.size.height = v17;
    v39 = UIAccessibilityConvertFrameToScreenCoordinates(v38, v18);
    objc_msgSend(v5, "setAccessibilityFrame:", v39.origin.x, v39.origin.y, v39.size.width, v39.size.height);
    v40.origin.x = v27 - v15 * 0.5;
    v40.origin.y = v29 - v17 * 0.5;
    v40.size.width = v15;
    v40.size.height = v17;
    v41 = UIAccessibilityConvertFrameToScreenCoordinates(v40, v18);
    objc_msgSend(v6, "setAccessibilityFrame:", v41.origin.x, v41.origin.y, v41.size.width, v41.size.height);
    v42.origin.y = v33;
    v42.origin.x = v31 - v15 * 0.5;
    v42.size.width = v15;
    v42.size.height = v17;
    v43 = UIAccessibilityConvertFrameToScreenCoordinates(v42, v18);
    objc_msgSend(v7, "setAccessibilityFrame:", v43.origin.x, v43.origin.y, v43.size.width, v43.size.height);
  }

}

- (void)layoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_TVRMatchPointArtworkViewAccessibility;
  -[_TVRMatchPointArtworkViewAccessibility layoutSubviews](&v3, sel_layoutSubviews);
  -[_TVRMatchPointArtworkViewAccessibility _accessibilityLoadAccessibilityInformation](self, "_accessibilityLoadAccessibilityInformation");
}

@end
