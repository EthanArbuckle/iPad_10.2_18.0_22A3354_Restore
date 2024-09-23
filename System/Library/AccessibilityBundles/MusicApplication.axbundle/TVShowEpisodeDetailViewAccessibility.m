@implementation TVShowEpisodeDetailViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("MusicApplication.TVShowEpisodeDetailView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MusicApplication.TVShowEpisodeDetailView"), CFSTR("accessibilityContextualActionsButton"), "@", 0);
}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v6;
  char v7;

  v7 = 0;
  objc_opt_class();
  -[TVShowEpisodeDetailViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("accessibilityContextualActionsButton"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  accessibilityMusicLocalizedString(CFSTR("more.button"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAccessibilityLabel:", v5);

  v6.receiver = self;
  v6.super_class = (Class)TVShowEpisodeDetailViewAccessibility;
  -[TVShowEpisodeDetailViewAccessibility _accessibilityLoadAccessibilityInformation](&v6, sel__accessibilityLoadAccessibilityInformation);

}

- (void)layoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TVShowEpisodeDetailViewAccessibility;
  -[TVShowEpisodeDetailViewAccessibility layoutSubviews](&v3, sel_layoutSubviews);
  -[TVShowEpisodeDetailViewAccessibility _accessibilityLoadAccessibilityInformation](self, "_accessibilityLoadAccessibilityInformation");
}

@end
