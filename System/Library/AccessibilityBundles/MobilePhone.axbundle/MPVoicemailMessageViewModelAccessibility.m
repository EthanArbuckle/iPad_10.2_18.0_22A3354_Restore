@implementation MPVoicemailMessageViewModelAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("MPVoicemailMessageViewModel");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (NSString)_axLocalizedSenderIdentityFullName
{
  JUMPOUT(0x234915324);
}

- (void)_axSetLocalizedSenderIdentityFullName:(id)a3
{
  __UIAccessibilitySetAssociatedObject();
}

@end
