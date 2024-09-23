@implementation MFComposeRecipientAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("MFComposeRecipient");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (id)accessibilityLabel
{
  return (id)-[MFComposeRecipientAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("displayString"));
}

@end
