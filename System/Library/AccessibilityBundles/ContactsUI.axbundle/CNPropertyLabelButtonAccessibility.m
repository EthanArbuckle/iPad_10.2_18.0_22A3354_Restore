@implementation CNPropertyLabelButtonAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("CNPropertyLabelButton");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (id)accessibilityHint
{
  return accessibilityLocalizedString(CFSTR("contact.card.label.chooser.hint"));
}

@end
