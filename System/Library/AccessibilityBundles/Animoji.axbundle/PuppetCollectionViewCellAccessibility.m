@implementation PuppetCollectionViewCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("PuppetCollectionViewCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PuppetCollectionViewCell"), CFSTR("displaySelection:"), "v", "B", 0);
}

- (void)displaySelection:(BOOL)a3
{
  _BOOL4 v3;
  uint64_t v5;
  objc_super v6;

  v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)PuppetCollectionViewCellAccessibility;
  -[PuppetCollectionViewCellAccessibility displaySelection:](&v6, sel_displaySelection_);
  v5 = *MEMORY[0x24BDF7400];
  if (!v3)
    v5 = 0;
  -[PuppetCollectionViewCellAccessibility setAccessibilityTraits:](self, "setAccessibilityTraits:", *MEMORY[0x24BDF73B0] | v5);
}

@end
