@implementation MediaPlaybackButtonAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SFMediaPlaybackButton");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasSwiftField:withSwiftType:", CFSTR("SFMediaPlaybackButton"), CFSTR("isPlaying"), "Bool");
  objc_msgSend(v3, "validateClass:hasSwiftField:withSwiftType:", CFSTR("SFMediaPlaybackButton"), CFSTR("playbackType"), "PlaybackType");

}

- (id)accessibilityLabel
{
  void *v3;
  void *v4;
  __CFString *v5;
  uint64_t v6;
  void *v7;
  objc_super v9;

  -[MediaPlaybackButtonAccessibility safeSwiftValueForKey:](self, "safeSwiftValueForKey:", CFSTR("playbackType"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safeSwiftEnumCase");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v4, "isEqualToString:", CFSTR("back")))
  {
    v5 = CFSTR("playback.back.button");
LABEL_10:
    accessibilityMobileSafariLocalizedString(v5);
    v6 = objc_claimAutoreleasedReturnValue();
    goto LABEL_11;
  }
  if (objc_msgSend(v4, "isEqualToString:", CFSTR("forward")))
  {
    v5 = CFSTR("playback.forward.button");
    goto LABEL_10;
  }
  if (objc_msgSend(v4, "isEqualToString:", CFSTR("play")))
  {
    if ((-[MediaPlaybackButtonAccessibility safeSwiftBoolForKey:](self, "safeSwiftBoolForKey:", CFSTR("isPlaying")) & 1) != 0)
      v5 = CFSTR("playback.pause.button");
    else
      v5 = CFSTR("playback.play.button");
    goto LABEL_10;
  }
  v9.receiver = self;
  v9.super_class = (Class)MediaPlaybackButtonAccessibility;
  -[MediaPlaybackButtonAccessibility accessibilityLabel](&v9, sel_accessibilityLabel);
  v6 = objc_claimAutoreleasedReturnValue();
LABEL_11:
  v7 = (void *)v6;

  return v7;
}

@end
