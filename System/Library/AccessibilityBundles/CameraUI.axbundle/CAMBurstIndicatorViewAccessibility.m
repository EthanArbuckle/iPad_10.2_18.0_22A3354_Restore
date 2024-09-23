@implementation CAMBurstIndicatorViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("CAMBurstIndicatorView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CAMBurstIndicatorView"), CFSTR("_updateCountLabelWithNumberOfPhotos"), "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("CAMBurstIndicatorView"), CFSTR("__numberOfPhotos"), "q");

}

- (void)_updateCountLabelWithNumberOfPhotos
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)CAMBurstIndicatorViewAccessibility;
  -[CAMBurstIndicatorViewAccessibility _updateCountLabelWithNumberOfPhotos](&v11, sel__updateCountLabelWithNumberOfPhotos);
  -[CAMBurstIndicatorViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("__numberOfPhotos"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "integerValue");

  if (v4 >= 5)
  {
    v5 = (void *)MEMORY[0x24BDD17C8];
    accessibilityCameraKitLocalizedString(CFSTR("camera.photo.burst.count"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    AXFormatInteger();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stringWithFormat:", v6, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDFEA60], "axAttributedStringWithString:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", 10);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setAttribute:forKey:", v10, *MEMORY[0x24BDFEAD8]);

    UIAccessibilityPostNotification(*MEMORY[0x24BDF71E8], v9);
  }
}

@end
