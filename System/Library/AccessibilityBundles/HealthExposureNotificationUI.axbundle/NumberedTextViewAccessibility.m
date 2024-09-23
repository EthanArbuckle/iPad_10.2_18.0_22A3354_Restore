@implementation NumberedTextViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("HealthExposureNotificationUI.NumberedTextView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("HealthExposureNotificationUI.NumberedTextView"), CFSTR("number"), "q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("HealthExposureNotificationUI.NumberedTextView"), CFSTR("title"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("HealthExposureNotificationUI.NumberedTextView"), CFSTR("details"), "@", 0);

}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = -[NumberedTextViewAccessibility safeIntegerForKey:](self, "safeIntegerForKey:", CFSTR("number"));
  -[NumberedTextViewAccessibility safeStringForKey:](self, "safeStringForKey:", CFSTR("title"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NumberedTextViewAccessibility safeStringForKey:](self, "safeStringForKey:", CFSTR("details"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "localizedStringWithFormat:", CFSTR("%ld"), v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAXStringForVariables();
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

@end
