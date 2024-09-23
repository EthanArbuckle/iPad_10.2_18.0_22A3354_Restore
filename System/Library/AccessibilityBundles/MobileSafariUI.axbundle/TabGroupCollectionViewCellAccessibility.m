@implementation TabGroupCollectionViewCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("TabGroupCollectionViewCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (unint64_t)accessibilityTraits
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TabGroupCollectionViewCellAccessibility;
  return *MEMORY[0x24BDF73B0] | -[TabGroupCollectionViewCellAccessibility accessibilityTraits](&v3, sel_accessibilityTraits);
}

@end
