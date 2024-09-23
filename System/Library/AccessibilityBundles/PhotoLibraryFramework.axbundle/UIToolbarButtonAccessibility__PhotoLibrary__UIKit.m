@implementation UIToolbarButtonAccessibility__PhotoLibrary__UIKit

+ (id)safeCategoryTargetClassName
{
  return CFSTR("UIToolbarButton");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)isAccessibilityElement
{
  void *v3;
  void *v4;
  int v5;

  -[UIToolbarButtonAccessibility__PhotoLibrary__UIKit isAccessibilityUserDefinedElement](self, "isAccessibilityUserDefinedElement");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[UIToolbarButtonAccessibility__PhotoLibrary__UIKit isAccessibilityUserDefinedElement](self, "isAccessibilityUserDefinedElement");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v5) = objc_msgSend(v4, "BOOLValue");
  }
  else
  {
    -[UIToolbarButtonAccessibility__PhotoLibrary__UIKit safeValueForKey:](self, "safeValueForKey:", CFSTR("isHidden"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "BOOLValue") ^ 1;
  }

  return v5;
}

- (id)accessibilityLabel
{
  void *v3;
  void *v4;
  void *v5;
  int v6;
  objc_super v8;

  -[UIToolbarButtonAccessibility__PhotoLibrary__UIKit accessibilityUserDefinedLabel](self, "accessibilityUserDefinedLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[UIToolbarButtonAccessibility__PhotoLibrary__UIKit accessibilityUserDefinedLabel](self, "accessibilityUserDefinedLabel");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[UIToolbarButtonAccessibility__PhotoLibrary__UIKit accessibilityIdentification](self, "accessibilityIdentification");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "isEqualToString:", CFSTR("playButton"));

    if (v6)
    {
      accessibilityLocalizedString(CFSTR("play.slideshow.button.text"));
      v4 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v8.receiver = self;
      v8.super_class = (Class)UIToolbarButtonAccessibility__PhotoLibrary__UIKit;
      -[UIToolbarButtonAccessibility__PhotoLibrary__UIKit accessibilityLabel](&v8, sel_accessibilityLabel);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }
  return v4;
}

@end
