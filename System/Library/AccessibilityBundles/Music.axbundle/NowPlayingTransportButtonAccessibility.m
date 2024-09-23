@implementation NowPlayingTransportButtonAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("Music.NowPlayingTransportButton");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("UIControl"), CFSTR("isEnabled"), "B", 0);
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("Music.NowPlayingTransportButton"), CFSTR("UIButton"));

}

- (unint64_t)accessibilityTraits
{
  unint64_t v3;
  int v4;
  uint64_t v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)NowPlayingTransportButtonAccessibility;
  v3 = *MEMORY[0x24BDF73B0] | -[NowPlayingTransportButtonAccessibility accessibilityTraits](&v7, sel_accessibilityTraits);
  v4 = -[NowPlayingTransportButtonAccessibility safeBoolForKey:](self, "safeBoolForKey:", CFSTR("isEnabled"));
  v5 = *MEMORY[0x24BDF73E8];
  if (v4)
    v5 = 0;
  return v3 | v5;
}

@end
