@implementation PXAssetLoopUIViewTileAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("PXAssetLoopUIViewTile");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:conformsToProtocol:", CFSTR("PXAssetLoopUIViewTile"), CFSTR("PXAssetTile"));
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("PXAssetLoopUIViewTile"), CFSTR("_videoView"), "PXVideoSessionUIView");
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PXImageRequester"), CFSTR("asset"), "@", 0);
  objc_msgSend(v3, "validateProtocol:hasRequiredInstanceMethod:", CFSTR("PXAssetTile"), CFSTR("imageRequester"));

}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PXAssetLoopUIViewTileAccessibility;
  -[PXAssetLoopUIViewTileAccessibility _accessibilityLoadAccessibilityInformation](&v6, sel__accessibilityLoadAccessibilityInformation);
  -[PXAssetLoopUIViewTileAccessibility safeValueForKeyPath:](self, "safeValueForKeyPath:", CFSTR("imageRequester.asset"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXAssetLoopUIViewTileAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_videoView"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
    objc_msgSend(v4, "_accessibilitySetRetainedValue:forKey:", v3, CFSTR("AXVideoAsset"));

}

- (void)_updateLoopingVideoView
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PXAssetLoopUIViewTileAccessibility;
  -[PXAssetLoopUIViewTileAccessibility _updateLoopingVideoView](&v3, sel__updateLoopingVideoView);
  -[PXAssetLoopUIViewTileAccessibility _accessibilityLoadAccessibilityInformation](self, "_accessibilityLoadAccessibilityInformation");
}

@end
