@implementation STUIStatusBarIndicatorRingerSilenceItemAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("STUIStatusBarIndicatorRingerSilenceItem");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("STUIStatusBarIndicatorRingerSilenceItem"), CFSTR("STUIStatusBarIndicatorItem"));
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("STUIStatusBarIndicatorItem"), CFSTR("_imageView"), "STUIStatusBarImageView");
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("STUIStatusBarImageView"), CFSTR("UIImageView"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("UIImageAsset"), CFSTR("assetName"), "@", 0);

}

- (id)accessibilityLabel
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  __CFString *v8;
  void *v9;
  objc_super v11;
  char v12;

  v12 = 0;
  objc_opt_class();
  -[STUIStatusBarIndicatorRingerSilenceItemAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("imageView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "image");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!objc_msgSend(v5, "isSymbolImage"))
    goto LABEL_8;
  objc_msgSend(v5, "imageAsset");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "safeStringForKey:", CFSTR("assetName"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v7, "isEqualToString:", CFSTR("bell.slash.fill")) & 1) == 0)
  {
    if (objc_msgSend(v7, "isEqualToString:", CFSTR("bell.fill")))
    {
      v8 = CFSTR("status.bar.item.ringer.ring.mode.label");
      goto LABEL_6;
    }

LABEL_8:
    v11.receiver = self;
    v11.super_class = (Class)STUIStatusBarIndicatorRingerSilenceItemAccessibility;
    -[STUIStatusBarIndicatorRingerSilenceItemAccessibility accessibilityLabel](&v11, sel_accessibilityLabel);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_9;
  }
  v8 = CFSTR("status.bar.item.ringer.silent.mode.label");
LABEL_6:
  accessibilityLocalizedString(v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_9:
  return v9;
}

@end
