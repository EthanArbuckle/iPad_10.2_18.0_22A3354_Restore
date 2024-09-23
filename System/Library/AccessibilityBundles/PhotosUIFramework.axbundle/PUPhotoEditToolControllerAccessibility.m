@implementation PUPhotoEditToolControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("PUPhotoEditToolController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PUPhotoEditToolController"), CFSTR("centerToolbarView"), "@", 0);
}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PUPhotoEditToolControllerAccessibility;
  -[PUPhotoEditToolControllerAccessibility _accessibilityLoadAccessibilityInformation](&v4, sel__accessibilityLoadAccessibilityInformation);
  -[PUPhotoEditToolControllerAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("centerToolbarView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_setAccessibilityTraitsBlock:", &__block_literal_global_0);

}

uint64_t __84__PUPhotoEditToolControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke()
{
  return *MEMORY[0x24BDF73C0];
}

- (id)centerToolbarView
{
  void *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PUPhotoEditToolControllerAccessibility;
  -[PUPhotoEditToolControllerAccessibility centerToolbarView](&v4, sel_centerToolbarView);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_setAccessibilityTraitsBlock:", &__block_literal_global_205);
  return v2;
}

uint64_t __59__PUPhotoEditToolControllerAccessibility_centerToolbarView__block_invoke()
{
  return *MEMORY[0x24BDF73C0];
}

@end
