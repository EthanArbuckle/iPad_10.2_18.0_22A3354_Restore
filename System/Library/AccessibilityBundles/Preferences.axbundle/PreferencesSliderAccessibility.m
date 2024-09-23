@implementation PreferencesSliderAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("UISlider");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (id)accessibilityLabel
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  __CFString *v7;
  uint64_t v8;
  void *v9;
  objc_super v11;

  -[PreferencesSliderAccessibility _accessibilityAncestorIsKindOf:](self, "_accessibilityAncestorIsKindOf:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    -[PreferencesSliderAccessibility _accessibilityAncestorIsKindOf:](self, "_accessibilityAncestorIsKindOf:", NSClassFromString(CFSTR("UITableViewCellAccessibilityElement")));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "safeValueForKey:", CFSTR("tableViewCell"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(v3, "accessibilityIdentification");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "lowercaseString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v6, "isEqualToString:", CFSTR("sound-volume")))
  {
    v7 = CFSTR("sound.volume.control");
  }
  else if (objc_msgSend(v6, "isEqualToString:", CFSTR("brightness")))
  {
    v7 = CFSTR("brightness.control");
  }
  else
  {
    if (!objc_msgSend(v6, "isEqualToString:", CFSTR("speakingRate")))
    {
      v11.receiver = self;
      v11.super_class = (Class)PreferencesSliderAccessibility;
      -[PreferencesSliderAccessibility accessibilityLabel](&v11, sel_accessibilityLabel);
      v8 = objc_claimAutoreleasedReturnValue();
      goto LABEL_10;
    }
    v7 = CFSTR("speakingRate");
  }
  accessibilityLocalizedString(v7);
  v8 = objc_claimAutoreleasedReturnValue();
LABEL_10:
  v9 = (void *)v8;

  return v9;
}

@end
