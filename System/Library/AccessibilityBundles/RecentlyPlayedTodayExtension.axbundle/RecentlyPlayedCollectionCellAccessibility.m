@implementation RecentlyPlayedCollectionCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("RecentlyPlayedTodayExtension.RecentlyPlayedCollectionCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("RecentlyPlayedTodayExtension.RecentlyPlayedCollectionCell"), CFSTR("accessibilityMediaTitle"), "@", 0);
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  return (id)-[RecentlyPlayedCollectionCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("accessibilityMediaTitle"));
}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x24BDF73B0];
}

@end
