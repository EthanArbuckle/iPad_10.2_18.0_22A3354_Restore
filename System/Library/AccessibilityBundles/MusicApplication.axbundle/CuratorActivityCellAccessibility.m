@implementation CuratorActivityCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("MusicApplication.CuratorActivityCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MusicApplication.CuratorActivityCell"), CFSTR("title"), "@", 0);
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  return (id)-[CuratorActivityCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("title"));
}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x24BDF73B0];
}

@end
