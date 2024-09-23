@implementation VTUIVoiceSelectionViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("VTUIVoiceSelectionView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)accessibilityViewIsModal
{
  return 1;
}

@end
