@implementation SBSystemApertureStatusBarPillElementAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SBSystemApertureStatusBarPillElement");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBSystemApertureStatusBarPillElement"), CFSTR("leadingView"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBSystemApertureStatusBarPillElement"), CFSTR("minimalView"), "@", 0);

}

- (SBSystemApertureStatusBarPillElementAccessibility)initWithStatusBarStyleOverrides:(unint64_t)a3
{
  SBSystemApertureStatusBarPillElementAccessibility *v4;
  void *v5;
  void *v6;
  void *v7;
  __CFString *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)SBSystemApertureStatusBarPillElementAccessibility;
  v4 = -[SBSystemApertureStatusBarPillElementAccessibility initWithStatusBarStyleOverrides:](&v10, sel_initWithStatusBarStyleOverrides_);
  -[SBSystemApertureStatusBarPillElementAccessibility safeValueForKey:](v4, "safeValueForKey:", CFSTR("leadingView"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBSystemApertureStatusBarPillElementAccessibility safeValueForKey:](v4, "safeValueForKey:", CFSTR("minimalView"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 0;
  if ((uint64_t)a3 > 63)
  {
    if (a3 == 64 || a3 == 128)
    {
      v8 = CFSTR("navigation.in.background");
      goto LABEL_13;
    }
    if (a3 == 2048)
    {
      v8 = CFSTR("application.using.location");
      goto LABEL_13;
    }
  }
  else
  {
    switch(a3)
    {
      case 4uLL:
        v8 = CFSTR("audio.recording");
        goto LABEL_13;
      case 8uLL:
        v8 = CFSTR("personal.hotspot");
        goto LABEL_13;
      case 0x20uLL:
        v8 = CFSTR("airplay.mirroring");
LABEL_13:
        accessibilityLocalizedString(v8);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        break;
    }
  }
  objc_msgSend(v5, "setAccessibilityLabel:", v7);
  objc_msgSend(v6, "setAccessibilityLabel:", v7);

  return v4;
}

@end
