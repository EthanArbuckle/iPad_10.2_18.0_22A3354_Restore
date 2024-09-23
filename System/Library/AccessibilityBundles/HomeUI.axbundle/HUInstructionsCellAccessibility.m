@implementation HUInstructionsCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("HUInstructionsCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)canBecomeFocused
{
  return 0;
}

@end
