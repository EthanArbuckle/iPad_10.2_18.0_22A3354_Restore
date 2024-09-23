@implementation SUItemCellConfigurationAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SUItemCellConfiguration");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (id)_accessibilityVideoIconString
{
  void *v2;
  int v3;
  __CFString *v4;
  void *v5;

  -[SUItemCellConfigurationAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("mediaIconType"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "intValue");

  if (v3 == 2)
  {
    v4 = CFSTR("video");
  }
  else
  {
    if (v3 != 1)
    {
      v5 = 0;
      return v5;
    }
    v4 = CFSTR("ringtone");
  }
  accessibilityLocalizedString(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  return v5;
}

@end
