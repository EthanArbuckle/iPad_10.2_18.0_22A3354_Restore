@implementation ActionCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("MusicApplication.ActionCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MusicApplication.ActionCell"), CFSTR("title"), "@", 0);
}

- (id)accessibilityLabel
{
  return (id)-[ActionCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("title"));
}

- (unint64_t)accessibilityTraits
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)ActionCellAccessibility;
  return *MEMORY[0x24BDF73B0] | -[ActionCellAccessibility accessibilityTraits](&v3, sel_accessibilityTraits);
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

@end
