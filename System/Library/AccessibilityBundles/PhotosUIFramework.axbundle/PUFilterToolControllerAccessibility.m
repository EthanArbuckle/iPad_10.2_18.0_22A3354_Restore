@implementation PUFilterToolControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("PUFilterToolController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PUFilterToolController"), CFSTR("centerToolbarView"), "@", 0);
}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PUFilterToolControllerAccessibility;
  -[PUFilterToolControllerAccessibility _accessibilityLoadAccessibilityInformation](&v4, sel__accessibilityLoadAccessibilityInformation);
  -[PUFilterToolControllerAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("centerToolbarView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_setAccessibilityTraitsBlock:", &__block_literal_global_8);

}

uint64_t __81__PUFilterToolControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke()
{
  return *MEMORY[0x24BDF73C0];
}

- (id)centerToolbarView
{
  void *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PUFilterToolControllerAccessibility;
  -[PUFilterToolControllerAccessibility centerToolbarView](&v4, sel_centerToolbarView);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_setAccessibilityTraitsBlock:", &__block_literal_global_205_1);
  return v2;
}

uint64_t __56__PUFilterToolControllerAccessibility_centerToolbarView__block_invoke()
{
  return *MEMORY[0x24BDF73C0];
}

@end
