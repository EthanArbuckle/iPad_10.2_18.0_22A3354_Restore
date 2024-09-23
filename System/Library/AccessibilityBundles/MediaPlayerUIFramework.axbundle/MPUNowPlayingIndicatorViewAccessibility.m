@implementation MPUNowPlayingIndicatorViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("MPUNowPlayingIndicatorView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MPUNowPlayingIndicatorView"), CFSTR("setPlaybackState:"), "v", "q", 0);
}

- (void)setPlaybackState:(int64_t)a3
{
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MPUNowPlayingIndicatorViewAccessibility;
  -[MPUNowPlayingIndicatorViewAccessibility setPlaybackState:](&v6, sel_setPlaybackState_);
  if ((unint64_t)a3 <= 2)
  {
    accessibilityMPUILocalizedString(off_24FEF6320[a3]);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[MPUNowPlayingIndicatorViewAccessibility setAccessibilityValue:](self, "setAccessibilityValue:", v5);

  }
}

@end
