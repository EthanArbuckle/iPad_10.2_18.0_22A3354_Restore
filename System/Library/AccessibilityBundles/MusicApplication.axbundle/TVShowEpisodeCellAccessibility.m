@implementation TVShowEpisodeCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("MusicApplication.TVShowEpisodeCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (id)_accessibilityTVShowEpisodeCellElements
{
  JUMPOUT(0x234917684);
}

- (void)_setAccessibilityTVShowEpisodeCellElements:(id)a3
{
  __UIAccessibilitySetAssociatedObject();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MusicApplication.TVShowEpisodeCell"), CFSTR("accessibilityHeaderLockupView"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MusicApplication.TVShowEpisodeCell"), CFSTR("accessibilityHeadlineTextStackView"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MusicApplication.TVShowEpisodeCell"), CFSTR("accessibilityTextStackView"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MusicApplication.TVShowEpisodeCell"), CFSTR("accessibilityDescriptionTextStackView"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MusicApplication.TVShowEpisodeCell"), CFSTR("accessibilityChevronImageView"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MusicApplication.TVShowEpisodeCell"), CFSTR("layoutSubviews"), "v", 0);

}

- (BOOL)isAccessibilityElement
{
  return 0;
}

- (id)accessibilityElements
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  -[TVShowEpisodeCellAccessibility _accessibilityTVShowEpisodeCellElements](self, "_accessibilityTVShowEpisodeCellElements");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[TVShowEpisodeCellAccessibility _accessibilityStringForLabelKeyValues:](self, "_accessibilityStringForLabelKeyValues:", CFSTR("headline, title"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    -[TVShowEpisodeCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("accessibilityHeaderLockupView"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    __UIAccessibilityCastAsSafeCategory();
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "_accessibilitySetVideoLabel:", v4);
    objc_msgSend(v3, "axSafelyAddObject:", v6);
    v7 = (void *)MEMORY[0x24BDBCE30];
    -[TVShowEpisodeCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("accessibilityHeadlineTextStackView"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[TVShowEpisodeCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("accessibilityTextStackView"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[TVShowEpisodeCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("accessibilityDescriptionTextStackView"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[TVShowEpisodeCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("accessibilityChevronImageView"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "axArrayByIgnoringNilElementsWithCount:", 4, v8, v9, v10, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBADA8]), "initWithAccessibilityContainer:representedElements:", self, v12);
    -[TVShowEpisodeCellAccessibility _accessibilityStringForLabelKeyValues:](self, "_accessibilityStringForLabelKeyValues:", CFSTR("headline, title, descriptionText"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setAccessibilityLabel:", v14);
    objc_msgSend(v3, "axSafelyAddObject:", v13);
    -[TVShowEpisodeCellAccessibility _setAccessibilityTVShowEpisodeCellElements:](self, "_setAccessibilityTVShowEpisodeCellElements:", v3);

  }
  return v3;
}

- (void)layoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TVShowEpisodeCellAccessibility;
  -[TVShowEpisodeCellAccessibility layoutSubviews](&v3, sel_layoutSubviews);
  -[TVShowEpisodeCellAccessibility _setAccessibilityTVShowEpisodeCellElements:](self, "_setAccessibilityTVShowEpisodeCellElements:", 0);
}

@end
