@implementation TrackCellViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("MusicMessagesApp.TrackCellView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MusicMessagesApp.TrackCellView"), CFSTR("isNowPlaying"), "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MusicMessagesApp.TrackCellView"), CFSTR("title"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MusicMessagesApp.TrackCellView"), CFSTR("artist"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MusicMessagesApp.TrackCellView"), CFSTR("isExplicit"), "B", 0);

}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  int v3;
  void *v4;
  void *v5;
  char v6;
  char v7;
  void *v8;
  void *v9;
  void *v11;

  v3 = -[TrackCellViewAccessibility safeBoolForKey:](self, "safeBoolForKey:", CFSTR("isNowPlaying"));
  -[TrackCellViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("title"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[TrackCellViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("artist"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[TrackCellViewAccessibility safeBoolForKey:](self, "safeBoolForKey:", CFSTR("isExplicit"));
  v7 = v6;
  if (v3)
  {
    accessibilityMusicMessagesAppLocalizedString(CFSTR("now.playing"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if ((v7 & 1) == 0)
      goto LABEL_3;
  }
  else
  {
    v8 = 0;
    if ((v6 & 1) == 0)
    {
LABEL_3:
      __UIAXStringForVariables();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v3)
        goto LABEL_8;
      goto LABEL_7;
    }
  }
  accessibilityMusicMessagesAppLocalizedString(CFSTR("explicit"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAXStringForVariables();
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
LABEL_7:

LABEL_8:
  return v9;
}

- (unint64_t)accessibilityTraits
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TrackCellViewAccessibility;
  return *MEMORY[0x24BDF73B0] | -[TrackCellViewAccessibility accessibilityTraits](&v3, sel_accessibilityTraits);
}

@end
