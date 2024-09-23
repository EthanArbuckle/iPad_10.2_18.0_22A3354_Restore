@implementation MyLibraryEntryCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SeymourUI.MyLibraryEntryCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (id)accessibilityValue
{
  return 0;
}

- (unint64_t)accessibilityTraits
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MyLibraryEntryCellAccessibility;
  return *MEMORY[0x24BDF73B0] | -[MyLibraryEntryCellAccessibility accessibilityTraits](&v3, sel_accessibilityTraits);
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

@end
