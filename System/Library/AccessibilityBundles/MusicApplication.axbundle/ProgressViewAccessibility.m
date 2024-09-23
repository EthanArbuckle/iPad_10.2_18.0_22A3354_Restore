@implementation ProgressViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("MusicApplication.ProgressView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MusicApplication.ProgressView"), CFSTR("progress"), "d", 0);
}

- (id)accessibilityValue
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  -[ProgressViewAccessibility safeCGFloatForKey:](self, "safeCGFloatForKey:", CFSTR("progress"));
  v2 = (void *)MEMORY[0x24BDD17C8];
  accessibilityMusicLocalizedString(CFSTR("playback.percentage"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  AXFormatFloatWithPercentage();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

@end
