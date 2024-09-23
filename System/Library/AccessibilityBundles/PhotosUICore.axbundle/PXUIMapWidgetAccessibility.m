@implementation PXUIMapWidgetAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("PXUIMapWidget");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:", CFSTR("PXImageUIView"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PXUIMapWidget"), CFSTR("_imageView"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PXImageUIView"), CFSTR("_imageView"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PXUIMapWidget"), CFSTR("_loadContainerView"), "v", 0);

}

- (void)_axUpdateMapImageView
{
  void *v2;
  void *v3;
  id v4;

  -[PXUIMapWidgetAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_imageView"));
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "safeValueForKey:", CFSTR("_imageView"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  accessibilityPhotosUICoreLocalizedString(CFSTR("widget.map.summaryimage.label"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setAccessibilityLabel:", v3);

  objc_msgSend(v2, "setAccessibilityTraits:", *MEMORY[0x24BDF73B0]);
  objc_msgSend(v2, "accessibilitySetIdentification:", CFSTR("AXMemoryTileImageView"));

}

- (void)_accessibilityLoadAccessibilityInformation
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PXUIMapWidgetAccessibility;
  -[PXUIMapWidgetAccessibility _accessibilityLoadAccessibilityInformation](&v3, sel__accessibilityLoadAccessibilityInformation);
  -[PXUIMapWidgetAccessibility _axUpdateMapImageView](self, "_axUpdateMapImageView");
}

- (void)_loadContainerView
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PXUIMapWidgetAccessibility;
  -[PXUIMapWidgetAccessibility _loadContainerView](&v3, sel__loadContainerView);
  -[PXUIMapWidgetAccessibility _axUpdateMapImageView](self, "_axUpdateMapImageView");
}

@end
