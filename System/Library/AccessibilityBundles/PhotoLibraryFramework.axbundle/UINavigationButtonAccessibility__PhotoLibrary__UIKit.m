@implementation UINavigationButtonAccessibility__PhotoLibrary__UIKit

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
  void *v4;
  __CFString *v5;
  uint64_t v6;
  void *v7;
  objc_super v9;

  -[UINavigationButtonAccessibility__PhotoLibrary__UIKit safeValueForKey:](self, "safeValueForKey:", CFSTR("_accessibilityImagePath"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    if (objc_msgSend(v3, "rangeOfString:", CFSTR("video_play.png")) != 0x7FFFFFFFFFFFFFFFLL)
    {
      v5 = CFSTR("play.button");
      goto LABEL_9;
    }
    if (objc_msgSend(v4, "rangeOfString:", CFSTR("video_pause.png")) != 0x7FFFFFFFFFFFFFFFLL)
    {
      v5 = CFSTR("pause.button");
      goto LABEL_9;
    }
  }
  if (objc_msgSend(v4, "hasPrefix:", CFSTR("PUEditPluginLarger")))
  {
    v5 = CFSTR("plugin.buttons");
LABEL_9:
    accessibilityLocalizedString(v5);
    v6 = objc_claimAutoreleasedReturnValue();
    goto LABEL_10;
  }
  v9.receiver = self;
  v9.super_class = (Class)UINavigationButtonAccessibility__PhotoLibrary__UIKit;
  -[UINavigationButtonAccessibility__PhotoLibrary__UIKit accessibilityLabel](&v9, sel_accessibilityLabel);
  v6 = objc_claimAutoreleasedReturnValue();
LABEL_10:
  v7 = (void *)v6;

  return v7;
}

@end
