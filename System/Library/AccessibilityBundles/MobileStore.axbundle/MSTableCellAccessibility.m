@implementation MSTableCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("MSTableCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x24BDF7408];
}

@end
