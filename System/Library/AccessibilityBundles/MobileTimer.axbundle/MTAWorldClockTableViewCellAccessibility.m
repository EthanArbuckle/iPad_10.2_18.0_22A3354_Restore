@implementation MTAWorldClockTableViewCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("MTAWorldClockTableViewCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MTAWorldClockTableViewCell"), CFSTR("city"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("WorldClockCity"), CFSTR("alCity"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("WorldClockCity"), CFSTR("name"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("ALCity"), CFSTR("name"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MTUIWorldClockCellView"), CFSTR("digitalClock"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MTUIWorldClockCellView"), CFSTR("combinedLabel"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("MTAWorldClockTableViewCell"), CFSTR("_clockCellView"), "MTUIWorldClockCellView");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("MTUIAnalogClockView"), CFSTR("_nighttime"), "c");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("MTUIWorldClockCellView"), CFSTR("_timeZone"), "NSTimeZone");

}

- (id)_accessibilityCityName
{
  void *v2;
  void *v3;
  void *v4;

  -[MTAWorldClockTableViewCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("city"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "safeValueForKey:", CFSTR("alCity"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safeValueForKey:", CFSTR("name"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    objc_msgSend(v2, "safeValueForKey:", CFSTR("name"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v4;
}

- (id)accessibilityLabel
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v14;

  -[MTAWorldClockTableViewCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_clockCellView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safeValueForKey:", CFSTR("combinedLabel"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "accessibilityLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[MTAWorldClockTableViewCellAccessibility _accessibilityCityName](self, "_accessibilityCityName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safeValueForKey:", CFSTR("_timeZone"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "secondsFromGMT");
  objc_msgSend(MEMORY[0x24BDBCF38], "systemTimeZone");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v8 - objc_msgSend(v9, "secondsFromGMT");

  objc_msgSend(MEMORY[0x24BDBCE60], "dateWithTimeIntervalSinceNow:", (double)v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  AXDateStringForFormat();
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAXStringForVariables();
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

@end
