@implementation MFQuickReplyExpandButtonAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("MFQuickReplyExpandButton");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  return accessibilityLocalizedString(CFSTR("quick.reply.expand.button"));
}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x24BDF73B0];
}

@end
