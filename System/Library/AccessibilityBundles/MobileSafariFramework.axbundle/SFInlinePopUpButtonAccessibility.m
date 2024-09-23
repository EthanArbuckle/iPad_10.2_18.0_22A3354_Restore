@implementation SFInlinePopUpButtonAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("MobileSafari.SFInlinePopUpButton");
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
