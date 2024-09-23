@implementation MTUIImageAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("UIImage");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (id)nowPlayingIcon
{
  void *v2;
  void *v3;
  objc_super v5;

  v5.receiver = a1;
  v5.super_class = (Class)&OBJC_METACLASS___MTUIImageAccessibility;
  objc_msgSendSuper2(&v5, sel_nowPlayingIcon);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  accessibilityLocalizedString(CFSTR("now.playing.button"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setAccessibilityLabel:", v3);

  return v2;
}

+ (id)unplayedIcon
{
  void *v2;
  void *v3;
  objc_super v5;

  v5.receiver = a1;
  v5.super_class = (Class)&OBJC_METACLASS___MTUIImageAccessibility;
  objc_msgSendSuper2(&v5, sel_unplayedIcon);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  accessibilityLocalizedString(CFSTR("unplayed"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setAccessibilityLabel:", v3);

  return v2;
}

+ (id)halfPlayedIcon
{
  void *v2;
  void *v3;
  objc_super v5;

  v5.receiver = a1;
  v5.super_class = (Class)&OBJC_METACLASS___MTUIImageAccessibility;
  objc_msgSendSuper2(&v5, sel_halfPlayedIcon);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  accessibilityLocalizedString(CFSTR("partial.play"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setAccessibilityLabel:", v3);

  return v2;
}

+ (id)infoIcon
{
  void *v2;
  void *v3;
  objc_super v5;

  v5.receiver = a1;
  v5.super_class = (Class)&OBJC_METACLASS___MTUIImageAccessibility;
  objc_msgSendSuper2(&v5, sel_infoIcon);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  accessibilityLocalizedString(CFSTR("info.button"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setAccessibilityLabel:", v3);

  return v2;
}

@end
