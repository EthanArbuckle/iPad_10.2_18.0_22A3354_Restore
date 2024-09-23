@implementation UIButtonAccessibility__MusicApplication__UIKit

+ (id)safeCategoryTargetClassName
{
  return CFSTR("UIButton");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("UIButton"), CFSTR("titleLabel"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("UIButton"), CFSTR("currentImage"), "@", 0);

}

- (BOOL)isAccessibilityElement
{
  void *v3;
  int v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  BOOL v10;
  objc_super v12;

  -[UIButtonAccessibility__MusicApplication__UIKit accessibilityIdentifier](self, "accessibilityIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("AXNowPlayingSubtitleButton"));

  if (v4)
  {
    -[UIButtonAccessibility__MusicApplication__UIKit safeValueForKey:](self, "safeValueForKey:", CFSTR("titleLabel"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "accessibilityLabel");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD14A8], "whitespaceAndNewlineCharacterSet");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stringByTrimmingCharactersInSet:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "length");
    v10 = v9 != 0;

    if (!v9)
      objc_msgSend(v5, "setAccessibilityIdentifier:", CFSTR("AXUIButtonLabelEmptyLabel"));

  }
  else
  {
    v12.receiver = self;
    v12.super_class = (Class)UIButtonAccessibility__MusicApplication__UIKit;
    return -[UIButtonAccessibility__MusicApplication__UIKit isAccessibilityElement](&v12, sel_isAccessibilityElement);
  }
  return v10;
}

- (id)accessibilityLabel
{
  void *v3;
  void *v4;
  __CFString *v5;
  uint64_t v6;
  void *v7;
  objc_super v9;

  -[UIButtonAccessibility__MusicApplication__UIKit safeValueForKey:](self, "safeValueForKey:", CFSTR("currentImage"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "accessibilityIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isEqualToString:", CFSTR("Context-Love")))
  {
    v5 = CFSTR("love");
  }
  else
  {
    if (!objc_msgSend(v4, "isEqualToString:", CFSTR("Context-Hate")))
    {
      v9.receiver = self;
      v9.super_class = (Class)UIButtonAccessibility__MusicApplication__UIKit;
      -[UIButtonAccessibility__MusicApplication__UIKit accessibilityLabel](&v9, sel_accessibilityLabel);
      v6 = objc_claimAutoreleasedReturnValue();
      goto LABEL_7;
    }
    v5 = CFSTR("dislike");
  }
  accessibilityMusicLocalizedString(v5);
  v6 = objc_claimAutoreleasedReturnValue();
LABEL_7:
  v7 = (void *)v6;

  return v7;
}

@end
