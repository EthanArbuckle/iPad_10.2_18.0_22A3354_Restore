@implementation MiroSmartMusicMenuCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("MiroSmartMusicMenuCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MiroSmartMusicMenuCell"), CFSTR("cloudStatus"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MiroSmartMusicMenuCell"), CFSTR("songName"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MiroSmartMusicMenuCell"), CFSTR("artistName"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MiroSmartMusicMenuCell"), CFSTR("progress"), "f", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MiroSmartMusicMenuCell"), CFSTR("prepareForReuse"), "v", 0);

}

- (BOOL)_axRequiresDownload
{
  void *v3;
  void *v4;
  int v5;

  objc_opt_class();
  -[MiroSmartMusicMenuCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("cloudStatus"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = objc_msgSend(v4, "isHidden") ^ 1;
  return v5;
}

- (id)accessibilityLabel
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  objc_opt_class();
  -[MiroSmartMusicMenuCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("songName"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  -[MiroSmartMusicMenuCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("artistName"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  __AXStringForVariables();
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)accessibilityValue
{
  void *v3;
  float v4;

  if (-[MiroSmartMusicMenuCellAccessibility _axRequiresDownload](self, "_axRequiresDownload"))
  {
    accessibilityMemoriesLocalizedString(CFSTR("memory.soundtrack.needsdownload"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[MiroSmartMusicMenuCellAccessibility safeFloatForKey:](self, "safeFloatForKey:", CFSTR("progress"));
    v3 = 0;
    if (v4 > 0.0)
    {
      AXFormatFloatWithPercentage();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }
  return v3;
}

- (id)accessibilityHint
{
  __CFString *v2;

  if (-[MiroSmartMusicMenuCellAccessibility _axRequiresDownload](self, "_axRequiresDownload"))
    v2 = CFSTR("memory.soundtrack.hint.download");
  else
    v2 = CFSTR("memory.soundtrack.hint.playback");
  accessibilityMemoriesLocalizedString(v2);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)awakeFromNib
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MiroSmartMusicMenuCellAccessibility;
  -[MiroSmartMusicMenuCellAccessibility awakeFromNib](&v5, sel_awakeFromNib);
  -[MiroSmartMusicMenuCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("cloudStatus"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setIsAccessibilityElement:", 0);

  -[MiroSmartMusicMenuCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("progressIndicator"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setIsAccessibilityElement:", 0);

}

- (void)prepareForReuse
{
  void *v2;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MiroSmartMusicMenuCellAccessibility;
  -[MiroSmartMusicMenuCellAccessibility prepareForReuse](&v3, sel_prepareForReuse);
  objc_opt_class();
  __UIAccessibilityCastAsClass();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setAccessoryType:", 0);

}

@end
