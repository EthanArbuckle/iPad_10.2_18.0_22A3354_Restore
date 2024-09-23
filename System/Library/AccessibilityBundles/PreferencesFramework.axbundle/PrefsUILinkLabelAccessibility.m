@implementation PrefsUILinkLabelAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("PrefsUILinkLabel");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x24BDF73D8];
}

@end
