@implementation MediaControlsRoutingButtonViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("MediaControlsRoutingButtonView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MediaControlsRoutingButtonView"), CFSTR("currentMode"), "q", 0);
}

- (id)accessibilityLabel
{
  unint64_t v2;
  __CFString *v3;
  void *v4;

  v2 = -[MediaControlsRoutingButtonViewAccessibility safeIntegerForKey:](self, "safeIntegerForKey:", CFSTR("currentMode"));
  if (v2 >= 2)
  {
    if (v2 != 2)
    {
      v4 = 0;
      return v4;
    }
    v3 = CFSTR("media.controls.container.label");
  }
  else
  {
    v3 = CFSTR("playback.destination.button.label");
  }
  accessibilityLocalizedString(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  return v4;
}

@end
