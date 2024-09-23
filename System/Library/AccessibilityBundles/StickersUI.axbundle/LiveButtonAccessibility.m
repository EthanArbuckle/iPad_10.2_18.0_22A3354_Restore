@implementation LiveButtonAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("StickersUI.LiveButton");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:isKindOfClass:", CFSTR("StickersUI.LiveButton"), CFSTR("UIButton"));
}

- (id)accessibilityLabel
{
  return accessibilityLocalizedString(CFSTR("Live Photo"));
}

- (id)accessibilityValue
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  __CFString *v7;
  void *v8;

  -[LiveButtonAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("imageView"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    objc_opt_class();
    __UIAccessibilityCastAsClass();
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "image");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "imageAsset");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "safeStringForKey:", CFSTR("assetName"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if ((objc_msgSend(v6, "isEqualToString:", CFSTR("livephoto.play")) & 1) != 0)
    {
      v7 = CFSTR("On");
    }
    else
    {
      if (!objc_msgSend(v6, "isEqualToString:", CFSTR("livephoto.slash")))
      {
        v8 = 0;
        goto LABEL_9;
      }
      v7 = CFSTR("Off");
    }
    accessibilityLocalizedString(v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_9:

    goto LABEL_10;
  }
  v8 = 0;
LABEL_10:

  return v8;
}

@end
