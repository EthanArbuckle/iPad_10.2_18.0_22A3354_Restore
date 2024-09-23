@implementation SFCapsuleInputAccessorySpacerViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SFCapsuleInputAccessorySpacerView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)_accessibilityIsKeyboardPassthroughInputAccessoryView
{
  return 1;
}

@end
