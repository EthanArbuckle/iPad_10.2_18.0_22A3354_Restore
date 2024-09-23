@implementation FigPluginViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("FigPluginView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (void)setAllowPlayback:(BOOL)a3
{
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)FigPluginViewAccessibility;
  -[FigPluginViewAccessibility setAllowPlayback:](&v6, sel_setAllowPlayback_, a3);
  -[FigPluginViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_playButton"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  accessibilityLocalizedString(CFSTR("quicktime.play.button"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAccessibilityLabel:", v5);

}

- (void)webPlugInStart
{
  UIAccessibilityNotifications v2;
  double v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)FigPluginViewAccessibility;
  -[FigPluginViewAccessibility webPlugInStart](&v5, sel_webPlugInStart);
  v2 = *MEMORY[0x24BEBB1F8];
  LODWORD(v3) = 1.0;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  UIAccessibilityPostNotification(v2, v4);

}

- (BOOL)isAccessibilityElement
{
  return 0;
}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x24BDF73B0];
}

@end
