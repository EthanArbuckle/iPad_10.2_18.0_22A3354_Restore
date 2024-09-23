@implementation PUCropAspectFlipperViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("PUCropAspectFlipperView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("PUCropAspectFlipperView"), CFSTR("_horizontalAspectButton"), "UIButton");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("PUCropAspectFlipperView"), CFSTR("_verticalAspectButton"), "UIButton");
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PUCropAspectFlipperView"), CFSTR("setAspectRatioOrientation:"), "v", "q", 0);
  objc_msgSend(v3, "validateClass:", CFSTR("PUCropToolController"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PUCropToolController"), CFSTR("cropAspectViewController"), "@", 0);

}

- (id)accessibilityLabel
{
  return accessibilityPULocalizedString(CFSTR("aspect.ratio.flipper"));
}

- (int64_t)accessibilityContainerType
{
  return 4;
}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PUCropAspectFlipperViewAccessibility;
  -[PUCropAspectFlipperViewAccessibility _accessibilityLoadAccessibilityInformation](&v7, sel__accessibilityLoadAccessibilityInformation);
  objc_opt_class();
  -[PUCropAspectFlipperViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_horizontalAspectButton"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "_setAccessibilityLabelBlock:", &__block_literal_global_5);
  objc_opt_class();
  -[PUCropAspectFlipperViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_verticalAspectButton"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "_setAccessibilityLabelBlock:", &__block_literal_global_219);
}

id __82__PUCropAspectFlipperViewAccessibility__accessibilityLoadAccessibilityInformation__block_invoke()
{
  return accessibilityPULocalizedString(CFSTR("horizontal.aspect.button"));
}

id __82__PUCropAspectFlipperViewAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_2()
{
  return accessibilityPULocalizedString(CFSTR("vertical.aspect.button"));
}

- (void)setAspectRatioOrientation:(int64_t)a3
{
  void *v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PUCropAspectFlipperViewAccessibility;
  -[PUCropAspectFlipperViewAccessibility setAspectRatioOrientation:](&v7, sel_setAspectRatioOrientation_, a3);
  -[PUCropAspectFlipperViewAccessibility _accessibilityFindAncestor:startWithSelf:](self, "_accessibilityFindAncestor:startWithSelf:", &__block_literal_global_225, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_accessibilityViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "safeValueForKey:", CFSTR("cropAspectViewController"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUCropAspectFlipperViewAccessibility _accessibilityLoadAccessibilityInformation](self, "_accessibilityLoadAccessibilityInformation");
  objc_msgSend(v6, "_accessibilityLoadAccessibilityInformation");

}

uint64_t __66__PUCropAspectFlipperViewAccessibility_setAspectRatioOrientation___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  char isKindOfClass;

  objc_msgSend(a2, "_accessibilityViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  NSClassFromString(CFSTR("PUCropToolController"));
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

@end
