@implementation ReactionsButtonAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("_TtCE5MusicO11MusicCoreUI9Reactions7Control");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MusicNowPlayingControlsViewController"), CFSTR("reactionButton"), "@", 0);
  objc_msgSend(v3, "validateClass:hasSwiftField:withSwiftType:", CFSTR("_TtCE5MusicO11MusicCoreUI9Reactions7Control"), CFSTR("context"), "Context");
  objc_msgSend(v3, "validateSwiftEnum:", CFSTR("MusicCoreUI.Reactions"));

}

- (id)accessibilityLabel
{
  return accessibilityMusicLocalizedString(CFSTR("reactions.button.label"));
}

- (id)accessibilityValue
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  objc_opt_class();
  -[ReactionsButtonAccessibility safeSwiftValueForKey:](self, "safeSwiftValueForKey:", CFSTR("context"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safeSwiftArrayForKey:", CFSTR("reactions"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "firstObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "reactionText");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

@end
