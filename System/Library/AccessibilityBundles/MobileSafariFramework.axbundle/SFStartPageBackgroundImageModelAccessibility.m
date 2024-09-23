@implementation SFStartPageBackgroundImageModelAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SFStartPageBackgroundImageModel");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SFStartPageBackgroundImageModel"), CFSTR("isCustomImage"), "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SFStartPageBackgroundImageModel"), CFSTR("itemProvider"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SFStartPageBackgroundImageModel"), CFSTR("imageDescription"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("WBSStartPageBackgroundImageDescription"), CFSTR("url"), "@", 0);

}

- (id)accessibilityLabel
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  int v10;
  __CFString *v11;

  -[SFStartPageBackgroundImageModelAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("imageDescription"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_opt_class();
    objc_msgSend(v3, "safeValueForKey:", CFSTR("url"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    __UIAccessibilityCastAsClass();
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "lastPathComponent");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    accessibilityMobileSafariLocalizedString(v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[SFStartPageBackgroundImageModelAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("itemProvider"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[SFStartPageBackgroundImageModelAccessibility safeBoolForKey:](self, "safeBoolForKey:", CFSTR("isCustomImage"));
    if (v8)
      v10 = v9;
    else
      v10 = 0;
    if ((v10 & 1) != 0 || !v9)
    {
      if (v10)
        v11 = CFSTR("image.from.library");
      else
        v11 = CFSTR("select.image.from.library");
      accessibilityMobileSafariLocalizedString(v11);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v7 = 0;
    }

  }
  return v7;
}

@end
