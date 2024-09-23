@implementation HomeWallpaperScrollViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("UIScrollView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("HUWallpaperEditingViewController"), CFSTR("imageView"), "@", 0);
}

- (id)accessibilityLabel
{
  void *v3;
  int v4;
  void *v5;
  objc_super v7;

  -[HomeWallpaperScrollViewAccessibility accessibilityIdentifier](self, "accessibilityIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", AXWallpaperScrollViewIdentifier);

  if (v4)
  {
    accessibilityHomeUILocalizedString(CFSTR("wallpaper.viewfinder.label"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)HomeWallpaperScrollViewAccessibility;
    -[HomeWallpaperScrollViewAccessibility accessibilityLabel](&v7, sel_accessibilityLabel);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v5;
}

- (id)accessibilityValue
{
  void *v3;
  int v4;
  void *v5;
  objc_super v7;

  -[HomeWallpaperScrollViewAccessibility accessibilityIdentifier](self, "accessibilityIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", AXWallpaperScrollViewIdentifier);

  if (v4)
  {
    -[HomeWallpaperScrollViewAccessibility _accessibilityZoomedString](self, "_accessibilityZoomedString");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)HomeWallpaperScrollViewAccessibility;
    -[HomeWallpaperScrollViewAccessibility accessibilityValue](&v7, sel_accessibilityValue);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v5;
}

- (id)accessibilityHint
{
  void *v3;
  _BOOL4 v4;
  void *v5;
  objc_super v7;

  -[HomeWallpaperScrollViewAccessibility accessibilityIdentifier](self, "accessibilityIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v3, "isEqualToString:", AXWallpaperScrollViewIdentifier))
  {

    goto LABEL_5;
  }
  v4 = -[HomeWallpaperScrollViewAccessibility _accessibilityIsWallpaperEditable](self, "_accessibilityIsWallpaperEditable");

  if (!v4)
  {
LABEL_5:
    v7.receiver = self;
    v7.super_class = (Class)HomeWallpaperScrollViewAccessibility;
    -[HomeWallpaperScrollViewAccessibility accessibilityHint](&v7, sel_accessibilityHint);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    return v5;
  }
  accessibilityHomeUILocalizedString(CFSTR("wallpaper.viewfinder.hint"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  return v5;
}

- (BOOL)isAccessibilityElement
{
  void *v3;
  char v4;
  objc_super v6;

  -[HomeWallpaperScrollViewAccessibility accessibilityIdentifier](self, "accessibilityIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", AXWallpaperScrollViewIdentifier);

  if ((v4 & 1) != 0)
    return 1;
  v6.receiver = self;
  v6.super_class = (Class)HomeWallpaperScrollViewAccessibility;
  return -[HomeWallpaperScrollViewAccessibility isAccessibilityElement](&v6, sel_isAccessibilityElement);
}

- (void)accessibilityIncrement
{
  void *v3;
  int v4;
  void *v5;
  double v6;
  objc_super v7;

  -[HomeWallpaperScrollViewAccessibility accessibilityIdentifier](self, "accessibilityIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", AXWallpaperScrollViewIdentifier);

  if (v4)
  {
    objc_opt_class();
    __UIAccessibilityCastAsClass();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "zoomScale");
    objc_msgSend(v5, "setZoomScale:", v6 + 0.1);

  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)HomeWallpaperScrollViewAccessibility;
    -[HomeWallpaperScrollViewAccessibility accessibilityIncrement](&v7, sel_accessibilityIncrement);
  }
}

- (void)accessibilityDecrement
{
  void *v3;
  int v4;
  void *v5;
  double v6;
  objc_super v7;

  -[HomeWallpaperScrollViewAccessibility accessibilityIdentifier](self, "accessibilityIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", AXWallpaperScrollViewIdentifier);

  if (v4)
  {
    objc_opt_class();
    __UIAccessibilityCastAsClass();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "zoomScale");
    objc_msgSend(v5, "setZoomScale:", v6 + -0.1);

  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)HomeWallpaperScrollViewAccessibility;
    -[HomeWallpaperScrollViewAccessibility accessibilityDecrement](&v7, sel_accessibilityDecrement);
  }
}

- (id)_accessibilityScrollStatusFormatString
{
  void *v3;
  int v4;
  void *v5;
  objc_super v7;

  -[HomeWallpaperScrollViewAccessibility accessibilityIdentifier](self, "accessibilityIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", AXWallpaperScrollViewIdentifier);

  if (v4)
  {
    accessibilityHomeUILocalizedString(CFSTR("wallpaper.viewfinder.position"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)HomeWallpaperScrollViewAccessibility;
    -[HomeWallpaperScrollViewAccessibility _accessibilityScrollStatusFormatString](&v7, sel__accessibilityScrollStatusFormatString);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v5;
}

- (unint64_t)accessibilityTraits
{
  void *v3;
  _BOOL4 v4;
  objc_super v6;
  objc_super v7;

  -[HomeWallpaperScrollViewAccessibility accessibilityIdentifier](self, "accessibilityIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "isEqualToString:", AXWallpaperScrollViewIdentifier))
  {
    v4 = -[HomeWallpaperScrollViewAccessibility _accessibilityIsWallpaperEditable](self, "_accessibilityIsWallpaperEditable");

    if (v4)
    {
      v7.receiver = self;
      v7.super_class = (Class)HomeWallpaperScrollViewAccessibility;
      return *MEMORY[0x24BDF73A0] | -[HomeWallpaperScrollViewAccessibility accessibilityTraits](&v7, sel_accessibilityTraits);
    }
  }
  else
  {

  }
  v6.receiver = self;
  v6.super_class = (Class)HomeWallpaperScrollViewAccessibility;
  return -[HomeWallpaperScrollViewAccessibility accessibilityTraits](&v6, sel_accessibilityTraits);
}

- (BOOL)_accessibilityIsWallpaperEditable
{
  void *v2;
  double v3;
  double v4;
  double v5;
  BOOL v6;

  objc_opt_class();
  __UIAccessibilityCastAsClass();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "maximumZoomScale");
  v4 = v3;
  objc_msgSend(v2, "minimumZoomScale");
  v6 = v4 != v5;

  return v6;
}

- (id)_accessibilityZoomedString
{
  void *v3;
  void *v4;

  objc_opt_class();
  __UIAccessibilityCastAsClass();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "zoomScale");
  -[HomeWallpaperScrollViewAccessibility aspectFillScale](self, "aspectFillScale");
  AXFormatMagnificationFactor();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (double)aspectFillScale
{
  void *v3;
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

  objc_opt_class();
  -[HomeWallpaperScrollViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("delegate"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safeValueForKey:", CFSTR("imageView"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "bounds");
  if (v6 == 0.0
    || (v8 = v7, v7 == 0.0)
    || ((v9 = v6,
         -[HomeWallpaperScrollViewAccessibility bounds](self, "bounds"),
         v11 = v10 / v9,
         -[HomeWallpaperScrollViewAccessibility bounds](self, "bounds"),
         v11 >= v12 / v8)
      ? (v13 = v11)
      : (v13 = v12 / v8),
        v13 == 0.0))
  {
    v13 = 1.0;
  }

  return v13;
}

@end
