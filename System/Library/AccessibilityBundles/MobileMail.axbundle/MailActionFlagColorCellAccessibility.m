@implementation MailActionFlagColorCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("MailActionFlagColorCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)isAccessibilityElement
{
  return 0;
}

@end
