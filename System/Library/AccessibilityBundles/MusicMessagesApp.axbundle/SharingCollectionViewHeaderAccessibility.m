@implementation SharingCollectionViewHeaderAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("MusicMessagesApp.SharingCollectionViewHeader");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MusicMessagesApp.SharingCollectionViewHeader"), CFSTR("accessibilityAttributionImageView"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MusicMessagesApp.SharingCollectionViewHeader"), CFSTR("accessibilityShareRecentlyPlayedLabel"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MusicMessagesApp.SharingCollectionViewHeader"), CFSTR("layoutSubviews"), "v", 0);

}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v8;
  char v9;

  objc_opt_class();
  -[SharingCollectionViewHeaderAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("accessibilityAttributionImageView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "setIsAccessibilityElement:", 1);
  accessibilityMusicMessagesAppLocalizedString(CFSTR("apple.music.logo"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAccessibilityLabel:", v5);

  v9 = 0;
  objc_opt_class();
  -[SharingCollectionViewHeaderAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("accessibilityShareRecentlyPlayedLabel"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "setAccessibilityTraits:", *MEMORY[0x24BDF73C0]);
  v8.receiver = self;
  v8.super_class = (Class)SharingCollectionViewHeaderAccessibility;
  -[SharingCollectionViewHeaderAccessibility _accessibilityLoadAccessibilityInformation](&v8, sel__accessibilityLoadAccessibilityInformation);

}

- (void)layoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SharingCollectionViewHeaderAccessibility;
  -[SharingCollectionViewHeaderAccessibility layoutSubviews](&v3, sel_layoutSubviews);
  -[SharingCollectionViewHeaderAccessibility _accessibilityLoadAccessibilityInformation](self, "_accessibilityLoadAccessibilityInformation");
}

@end
