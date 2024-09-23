@implementation SRSecureWindowAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SRSecureWindow");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)_accessibilityShouldIncludeKeyboardInRemoteSubstituteChildren
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SRSecureWindowAccessibility;
  return -[SRSecureWindowAccessibility _accessibilityShouldIncludeKeyboardInRemoteSubstituteChildren](&v3, sel__accessibilityShouldIncludeKeyboardInRemoteSubstituteChildren)|| AXRequestingClient() == 4;
}

@end
