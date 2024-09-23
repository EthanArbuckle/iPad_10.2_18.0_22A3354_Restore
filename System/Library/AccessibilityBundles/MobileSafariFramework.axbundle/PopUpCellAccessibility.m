@implementation PopUpCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("_SFBrowsingAssistantPopUpCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x24BEBB150];
}

@end
