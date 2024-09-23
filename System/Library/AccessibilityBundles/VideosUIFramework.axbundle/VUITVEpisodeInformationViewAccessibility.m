@implementation VUITVEpisodeInformationViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("VUITVEpisodeInformationView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("VUITVEpisodeInformationView"), CFSTR("episodeLabel"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("VUITVEpisodeInformationView"), CFSTR("titleLabel"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("VUITVEpisodeInformationView"), CFSTR("descriptionLabel"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("VUITVEpisodeInformationView"), CFSTR("metadataView"), "@", 0);

}

- (id)accessibilityLabel
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v12;

  -[VUITVEpisodeInformationViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("episodeLabel"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[VUITVEpisodeInformationViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("titleLabel"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[VUITVEpisodeInformationViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("descriptionLabel"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[VUITVEpisodeInformationViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("metadataView"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "accessibilityLabel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "accessibilityLabel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "accessibilityLabel");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "accessibilityLabel");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAXStringForVariables();
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

@end
