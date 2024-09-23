@implementation CAMFlashExpandableStatusIndicatorAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("CAMFlashExpandableStatusIndicator");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CAMFlashExpandableStatusIndicator"), CFSTR("flashMode"), "q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CAMFlashExpandableStatusIndicator"), CFSTR("isFlashUnavailable"), "B", 0);

}

- (id)accessibilityLabel
{
  return accessibilityCameraKitLocalizedString(CFSTR("FLASH_MODE_BUTTON_LABEL"));
}

- (id)accessibilityValue
{
  void *v3;
  uint64_t v4;
  void *v5;
  objc_super v7;

  -[CAMFlashExpandableStatusIndicatorAccessibility _axCurrentFlashValue](self, "_axCurrentFlashValue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[CAMFlashExpandableStatusIndicatorAccessibility _axCurrentFlashValue](self, "_axCurrentFlashValue");
    v4 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)CAMFlashExpandableStatusIndicatorAccessibility;
    -[CAMFlashExpandableStatusIndicatorAccessibility accessibilityValue](&v7, sel_accessibilityValue);
    v4 = objc_claimAutoreleasedReturnValue();
  }
  v5 = (void *)v4;

  return v5;
}

- (BOOL)accessibilityActivate
{
  BOOL v3;
  void *v4;
  void *v5;
  id v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CAMFlashExpandableStatusIndicatorAccessibility;
  v3 = -[CAMFlashExpandableStatusIndicatorAccessibility accessibilityActivate](&v8, sel_accessibilityActivate);
  -[CAMFlashExpandableStatusIndicatorAccessibility _axCurrentFlashValue](self, "_axCurrentFlashValue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    v7 = v4;
    AXPerformBlockOnMainThreadAfterDelay();

  }
  return v3;
}

void __71__CAMFlashExpandableStatusIndicatorAccessibility_accessibilityActivate__block_invoke(uint64_t a1)
{
  UIAccessibilityPostNotification(*MEMORY[0x24BDF71E8], *(id *)(a1 + 32));
}

- (id)_axCurrentFlashValue
{
  __CFString *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  NSObject *v8;

  if (-[CAMFlashExpandableStatusIndicatorAccessibility safeBoolForKey:](self, "safeBoolForKey:", CFSTR("isFlashUnavailable")))
  {
    v3 = CFSTR("FLASH_MODE_BUTTON_UNAVAILABLE");
LABEL_9:
    accessibilityCameraKitLocalizedString(v3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    return v6;
  }
  -[CAMFlashExpandableStatusIndicatorAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("flashMode"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "integerValue");

  switch(v5)
  {
    case 2:
      v3 = CFSTR("FLASH_MODE_BUTTON_VALUE_AUTO");
      goto LABEL_9;
    case 1:
      v3 = CFSTR("FLASH_MODE_BUTTON_VALUE_ON");
      goto LABEL_9;
    case 0:
      v3 = CFSTR("FLASH_MODE_BUTTON_VALUE_OFF");
      goto LABEL_9;
  }
  AXLogAppAccessibility();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    -[CAMFlashExpandableStatusIndicatorAccessibility _axCurrentFlashValue].cold.1(v5, v8);

  v6 = 0;
  return v6;
}

- (void)_axCurrentFlashValue
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 134217984;
  v3 = a1;
  _os_log_error_impl(&dword_230B33000, a2, OS_LOG_TYPE_ERROR, "CAMFlashMode unhandled : %lu", (uint8_t *)&v2, 0xCu);
}

@end
