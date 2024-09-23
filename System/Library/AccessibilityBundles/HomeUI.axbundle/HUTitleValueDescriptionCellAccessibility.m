@implementation HUTitleValueDescriptionCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("HUTitleValueDescriptionCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

@end
