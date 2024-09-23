@implementation VideoHeaderLockupViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("MusicApplication.VideoHeaderLockupView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (id)_accessibilityVideoLabel
{
  JUMPOUT(0x234917684);
}

- (void)_accessibilitySetVideoLabel:(id)a3
{
  __UIAccessibilitySetAssociatedObject();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MusicApplication.VideoHeaderLockupView"), CFSTR("accessibilityProgressView"), "@", 0);
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  void *v3;
  void *v4;
  void *v6;

  accessibilityMusicLocalizedString(CFSTR("video.artwork"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[VideoHeaderLockupViewAccessibility _accessibilityVideoLabel](self, "_accessibilityVideoLabel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAXStringForVariables();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)accessibilityValue
{
  void *v2;
  void *v3;

  -[VideoHeaderLockupViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("accessibilityProgressView"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accessibilityValue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (unint64_t)accessibilityTraits
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)VideoHeaderLockupViewAccessibility;
  return *MEMORY[0x24BDF73B0] | -[VideoHeaderLockupViewAccessibility accessibilityTraits](&v3, sel_accessibilityTraits);
}

@end
