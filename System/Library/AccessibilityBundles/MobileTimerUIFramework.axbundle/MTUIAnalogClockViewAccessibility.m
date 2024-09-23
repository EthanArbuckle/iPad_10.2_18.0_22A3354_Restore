@implementation MTUIAnalogClockViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("MTUIAnalogClockView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (id)accessibilityLabel
{
  void *v2;
  __CFString *v3;
  void *v4;

  -[MTUIAnalogClockViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("isNighttime"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "BOOLValue"))
    v3 = CFSTR("clock.nighttime");
  else
    v3 = CFSTR("clock.daytime");
  accessibilityLocalizedString(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)accessibilityValue
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  -[MTUIAnalogClockViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("hour"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "integerValue");

  -[MTUIAnalogClockViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("minute"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "integerValue");

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%ld:%ld"), v4, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  AXDateFromStringWithFormat();
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD1500], "localizedStringFromDate:dateStyle:timeStyle:", v8, 0, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDFEA60], "axAttributedStringWithString:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setAttribute:forKey:", *MEMORY[0x24BDBD270], *MEMORY[0x24BDFEB00]);

  return v10;
}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x24BDF7430];
}

- (BOOL)isAccessibilityElement
{
  void *v2;
  BOOL v3;

  objc_msgSend(MEMORY[0x24BDF69C8], "currentDevice");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "userInterfaceIdiom") != 0;

  return v3;
}

@end
