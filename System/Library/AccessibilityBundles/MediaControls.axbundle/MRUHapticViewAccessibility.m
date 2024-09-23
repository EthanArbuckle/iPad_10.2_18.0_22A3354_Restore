@implementation MRUHapticViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("MRUHapticView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (unint64_t)accessibilityTraits
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MRUHapticViewAccessibility;
  return *MEMORY[0x24BDF7428] | -[MRUHapticViewAccessibility accessibilityTraits](&v3, sel_accessibilityTraits);
}

- (id)accessibilityLabel
{
  return accessibilityLocalizedString(CFSTR("music.haptics"));
}

- (id)accessibilityValue
{
  void *v2;
  __CFString *v3;
  void *v4;

  objc_msgSend(MEMORY[0x24BE006C0], "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "hapticMusicActive"))
    v3 = CFSTR("music.haptics.active.value");
  else
    v3 = CFSTR("music.haptics.inactive.value");
  accessibilityLocalizedString(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

@end
