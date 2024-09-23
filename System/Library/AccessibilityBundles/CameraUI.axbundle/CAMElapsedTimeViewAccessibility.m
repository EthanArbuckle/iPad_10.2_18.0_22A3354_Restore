@implementation CAMElapsedTimeViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("CAMElapsedTimeView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CAMElapsedTimeView"), CFSTR("_startTime"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CAMElapsedTimeView"), CFSTR("_timeLabel"), "@", 0);

}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  void *v3;
  void *v4;
  double v5;
  void *v6;
  void *v7;

  objc_opt_class();
  -[CAMElapsedTimeViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_startTime"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (UIAccessibilityIsVoiceOverRunning())
  {
    objc_msgSend(v4, "timeIntervalSinceNow");
    MEMORY[0x2348BFAAC](1, 0.0 - v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[CAMElapsedTimeViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_timeLabel"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "accessibilityLabel");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v6;
}

@end
