@implementation SKUIBrowseHeaderCollectionViewCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SKUIBrowseHeaderCollectionViewCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SKUIBrowseHeaderCollectionViewCell"), CFSTR("title"), "@", 0);
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x24BDF73C0];
}

- (id)accessibilityLabel
{
  return (id)-[SKUIBrowseHeaderCollectionViewCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("title"));
}

@end
