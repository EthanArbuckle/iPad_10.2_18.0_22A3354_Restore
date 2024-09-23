@implementation PXStoryPlayButtonAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("PXStoryPlayButton");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PXStoryPlayButton"), CFSTR("viewModel"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PXStoryViewModel"), CFSTR("isAtPlaybackEnd"), "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PXStoryViewModel"), CFSTR("desiredPlayState"), "q", 0);

}

- (id)accessibilityLabel
{
  void *v3;
  uint64_t v4;
  __CFString *v5;
  void *v6;
  objc_super v8;

  -[PXStoryPlayButtonAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("viewModel"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "safeIntegerForKey:", CFSTR("desiredPlayState"));
  if (v4 == 1)
  {
    v5 = CFSTR("story.pause");
  }
  else
  {
    if (v4)
    {
LABEL_8:
      v8.receiver = self;
      v8.super_class = (Class)PXStoryPlayButtonAccessibility;
      -[PXStoryPlayButtonAccessibility accessibilityLabel](&v8, sel_accessibilityLabel);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_9;
    }
    if (objc_msgSend(v3, "safeBoolForKey:", CFSTR("isAtPlaybackEnd")))
      v5 = CFSTR("story.replay");
    else
      v5 = CFSTR("story.play");
  }
  accessibilityPhotosUICoreLocalizedString(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
    goto LABEL_8;
LABEL_9:

  return v6;
}

@end
