@implementation EditorialCollectionBrickRowCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SeymourUI.EditorialCollectionBrickRowCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:isKindOfClass:", CFSTR("SeymourUI.EditorialCollectionBrickRowCell"), CFSTR("UICollectionViewCell"));
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x24BDF73B0];
}

@end
