@implementation PXAssetUIImageViewTileAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("PXAssetUIImageViewTile");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:conformsToProtocol:", CFSTR("PXAssetUIImageViewTile"), CFSTR("PXAssetTile"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PXImageUIView"), CFSTR("_imageView"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PXAssetUIImageViewTile"), CFSTR("setImageRequester:"), "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PXAssetUIImageViewTile"), CFSTR("_updateImageView"), "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PXImageRequester"), CFSTR("asset"), "@", 0);

}

- (void)_accessibilityLoadAccessibilityInformation
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = 138412546;
  v4 = a1;
  v5 = 2112;
  v6 = a2;
  _os_log_debug_impl(&dword_230BAE000, log, OS_LOG_TYPE_DEBUG, "reloading asset: %@ %@", (uint8_t *)&v3, 0x16u);
}

- (void)_updateImageView
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PXAssetUIImageViewTileAccessibility;
  -[PXAssetUIImageViewTileAccessibility _updateImageView](&v3, sel__updateImageView);
  -[PXAssetUIImageViewTileAccessibility _accessibilityLoadAccessibilityInformation](self, "_accessibilityLoadAccessibilityInformation");
}

@end
