@implementation SocialProfileArtworkEditorLockupViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("MusicApplication.SocialProfileArtworkEditorLockupView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  return accessibilityMusicLocalizedString(CFSTR("add.profile.photo"));
}

- (unint64_t)accessibilityTraits
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SocialProfileArtworkEditorLockupViewAccessibility;
  return *MEMORY[0x24BDF73B0] | -[SocialProfileArtworkEditorLockupViewAccessibility accessibilityTraits](&v3, sel_accessibilityTraits);
}

@end
