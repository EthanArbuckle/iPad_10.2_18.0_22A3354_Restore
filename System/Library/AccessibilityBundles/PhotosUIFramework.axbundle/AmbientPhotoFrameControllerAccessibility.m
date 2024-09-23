@implementation AmbientPhotoFrameControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("PhotosUIPrivate.AmbientPhotoFrameController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PhotosUIPrivate.AmbientPhotoFrameController"), CFSTR("accessibilityPresentExtendedMetadataOverlay"), "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PhotosUIPrivate.AmbientPhotoFrameController"), CFSTR("openVisibleAssetInPhotosApp"), "v", 0);
  objc_msgSend(v3, "validateClass:hasSwiftField:withSwiftType:", CFSTR("PhotosUIPrivate.AmbientPhotoFrameController"), CFSTR("extendedMetadataOverlayView"), "Optional<AmbientPhotoFrameExtendedMetadataOverlayView>");
  objc_msgSend(v3, "validateClass:hasSwiftField:withSwiftType:", CFSTR("PhotosUIPrivate.AmbientPhotoFrameExtendedMetadataOverlayView"), CFSTR("openPhotosLabel"), "Optional<UILabel>");

}

- (void)accessibilityPresentExtendedMetadataOverlay
{
  void *v3;
  void *v4;
  _QWORD v5[5];

  -[AmbientPhotoFrameControllerAccessibility safeSwiftValueForKey:](self, "safeSwiftValueForKey:", CFSTR("extendedMetadataOverlayView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safeSwiftValueForKey:", CFSTR("openPhotosLabel"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAccessibilityTraits:", *MEMORY[0x24BDF73B0]);
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __87__AmbientPhotoFrameControllerAccessibility_accessibilityPresentExtendedMetadataOverlay__block_invoke;
  v5[3] = &unk_24FF155B8;
  v5[4] = self;
  objc_msgSend(v4, "setAccessibilityActivateBlock:", v5);

}

uint64_t __87__AmbientPhotoFrameControllerAccessibility_accessibilityPresentExtendedMetadataOverlay__block_invoke()
{
  AXPerformSafeBlock();
  return 1;
}

uint64_t __87__AmbientPhotoFrameControllerAccessibility_accessibilityPresentExtendedMetadataOverlay__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "openVisibleAssetInPhotosApp");
}

@end
