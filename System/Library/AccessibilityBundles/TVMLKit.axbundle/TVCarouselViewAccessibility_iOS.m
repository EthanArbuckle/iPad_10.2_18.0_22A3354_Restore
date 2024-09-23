@implementation TVCarouselViewAccessibility_iOS

+ (id)safeCategoryTargetClassName
{
  return CFSTR("_TVCarouselView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("_TVCarouselView"), CFSTR("_updateAutoScrollTimer"), "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("_TVCarouselView"), CFSTR("_stopAutoScrollTimer"), "v", 0);

}

- (void)_updateAutoScrollTimer
{
  objc_super v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t (*v6)(uint64_t);
  void *v7;
  TVCarouselViewAccessibility_iOS *v8;

  if (UIAccessibilityIsVoiceOverRunning())
  {
    v4 = MEMORY[0x24BDAC760];
    v5 = 3221225472;
    v6 = __57__TVCarouselViewAccessibility_iOS__updateAutoScrollTimer__block_invoke;
    v7 = &unk_2503A55C0;
    v8 = self;
    AXPerformSafeBlock();
  }
  else
  {
    v3.receiver = self;
    v3.super_class = (Class)TVCarouselViewAccessibility_iOS;
    -[TVCarouselViewAccessibility_iOS _updateAutoScrollTimer](&v3, sel__updateAutoScrollTimer);
  }
}

@end
