@implementation SFCapsuleCollectionViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SFCapsuleCollectionView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SFCapsuleCollectionView"), CFSTR("_shouldToggleMinimizedWithTranslation:velocity:gestureEnded:"), "d", "d", "B", 0);
}

- (BOOL)_shouldToggleMinimizedWithTranslation:(double)a3 velocity:(double)a4 gestureEnded:(BOOL)a5
{
  _BOOL8 v5;
  objc_super v10;

  v5 = a5;
  if (UIAccessibilityIsVoiceOverRunning() || UIAccessibilityIsSwitchControlRunning())
    return 0;
  v10.receiver = self;
  v10.super_class = (Class)SFCapsuleCollectionViewAccessibility;
  return -[SFCapsuleCollectionViewAccessibility _shouldToggleMinimizedWithTranslation:velocity:gestureEnded:](&v10, sel__shouldToggleMinimizedWithTranslation_velocity_gestureEnded_, v5, a3, a4);
}

@end
