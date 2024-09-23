@implementation TKPickerDividerTableViewCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("TKPickerDividerTableViewCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x24BEBB178];
}

@end
