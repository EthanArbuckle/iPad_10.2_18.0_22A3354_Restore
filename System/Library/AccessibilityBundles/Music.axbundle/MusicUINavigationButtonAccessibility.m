@implementation MusicUINavigationButtonAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("UINavigationButton");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (id)accessibilityLabel
{
  void *v3;
  int v4;
  void *v5;
  objc_super v7;

  -[MusicUINavigationButtonAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_accessibilityImagePath"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hasPrefix:", CFSTR("UIButtonBarListIcon"));

  if (v4)
  {
    accessibilityMusicLocalizedString(CFSTR("track.list.button"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)MusicUINavigationButtonAccessibility;
    -[MusicUINavigationButtonAccessibility accessibilityLabel](&v7, sel_accessibilityLabel);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v5;
}

@end
