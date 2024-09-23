@implementation PSSegmentTableCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("PSSegmentTableCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (int64_t)accessibilityContainerType
{
  return 4;
}

- (BOOL)_accessibilityIgnoreInternalLabels
{
  return 1;
}

@end
