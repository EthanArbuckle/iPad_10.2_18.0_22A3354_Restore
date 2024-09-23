@implementation PXVideoPlayerViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("PXVideoPlayerView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)_axPHAsset
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  -[PXVideoPlayerViewAccessibility _accessibilityValueForKey:](self, "_accessibilityValueForKey:", CFSTR("AXVideoAsset"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    -[PXVideoPlayerViewAccessibility _accessibilityFindViewAncestor:startWithSelf:](self, "_accessibilityFindViewAncestor:startWithSelf:", &__block_literal_global_7, 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "_accessibilityViewController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "safeValueForKey:", CFSTR("_accessoryVisibilityInteractionController"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "safeValueForKey:", CFSTR("_currentAssetViewModel"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "safeValueForKey:", CFSTR("asset"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v3;
}

uint64_t __44__PXVideoPlayerViewAccessibility__axPHAsset__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  char isKindOfClass;

  objc_msgSend(a2, "_accessibilityViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  MEMORY[0x2348C1678](CFSTR("PUOneUpViewController"));
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (id)accessibilityCustomContent
{
  void *v2;
  void *v3;

  -[PXVideoPlayerViewAccessibility _axPHAsset](self, "_axPHAsset");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accessibilityCustomContent");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)accessibilityLabel
{
  void *v2;
  void *v3;

  -[PXVideoPlayerViewAccessibility _axPHAsset](self, "_axPHAsset");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accessibilityLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)accessibilityValue
{
  void *v2;
  void *v3;

  -[PXVideoPlayerViewAccessibility _axPHAsset](self, "_axPHAsset");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accessibilityValue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

@end
