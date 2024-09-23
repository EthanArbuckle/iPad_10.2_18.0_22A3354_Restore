@implementation CSLPRFAppViewChoiceCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("CSLPRFAppViewChoiceCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (id)accessibilityLabel
{
  return accessibilityLocalizedString(CFSTR("APP_LAYOUT_CHOICES"));
}

@end
