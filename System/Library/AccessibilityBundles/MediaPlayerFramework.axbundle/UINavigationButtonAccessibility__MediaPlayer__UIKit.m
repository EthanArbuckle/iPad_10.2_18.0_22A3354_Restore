@implementation UINavigationButtonAccessibility__MediaPlayer__UIKit

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
  uint64_t v4;
  void *v5;
  objc_super v7;

  -[UINavigationButtonAccessibility__MediaPlayer__UIKit accessibilityIdentification](self, "accessibilityIdentification");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "isEqualToString:", CFSTR("scaleButton")))
  {
    accessibilityLocalizedString(CFSTR("scaleButton.text"));
    v4 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)UINavigationButtonAccessibility__MediaPlayer__UIKit;
    -[UINavigationButtonAccessibility__MediaPlayer__UIKit accessibilityLabel](&v7, sel_accessibilityLabel);
    v4 = objc_claimAutoreleasedReturnValue();
  }
  v5 = (void *)v4;

  return v5;
}

- (id)accessibilityValue
{
  void *v3;
  void *v4;
  void *v5;
  __CFString *v6;
  void *v7;
  objc_super v9;

  -[UINavigationButtonAccessibility__MediaPlayer__UIKit accessibilityIdentification](self, "accessibilityIdentification");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v3, "isEqualToString:", CFSTR("scaleButton")))
  {
    v9.receiver = self;
    v9.super_class = (Class)UINavigationButtonAccessibility__MediaPlayer__UIKit;
    -[UINavigationButtonAccessibility__MediaPlayer__UIKit accessibilityValue](&v9, sel_accessibilityValue);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_8;
  }
  -[UINavigationButtonAccessibility__MediaPlayer__UIKit safeValueForKey:](self, "safeValueForKey:", CFSTR("image"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "accessibilityIdentification");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v5, "hasPrefix:", CFSTR("zoomin_icon")) & 1) != 0
    || (objc_msgSend(v5, "hasPrefix:", CFSTR("wildcat-widescreen-mode-icon")) & 1) != 0)
  {
    v6 = CFSTR("sizeToFit.scale.text");
  }
  else
  {
    if ((objc_msgSend(v5, "hasPrefix:", CFSTR("zoomout_icon")) & 1) == 0
      && !objc_msgSend(v5, "hasPrefix:", CFSTR("wildcat-fullscreen-mode-icon")))
    {
      v7 = 0;
      goto LABEL_6;
    }
    v6 = CFSTR("fullScreen.scale.text");
  }
  accessibilityLocalizedString(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_6:

LABEL_8:
  return v7;
}

@end
