@implementation MFComposeSendAccessoryButtonAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("MFComposeSendAccessoryButton");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (id)accessibilityLabel
{
  return accessibilityLocalizedString(CFSTR("send.button"));
}

@end
