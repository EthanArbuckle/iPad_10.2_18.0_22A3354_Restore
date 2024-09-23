@implementation AudioMessageRecordingAppendButtonAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("ChatKit.AudioMessageRecordingAppendButton");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:hasSwiftField:withSwiftType:", CFSTR("ChatKit.AudioMessageRecordingAppendButton"), CFSTR("duration"), "Double");
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  -[AudioMessageRecordingAppendButtonAccessibility safeSwiftValueForKey:](self, "safeSwiftValueForKey:", CFSTR("duration"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "doubleValue");
  AXDurationStringForDuration();
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  accessibilityLocalizedString(CFSTR("continue.recording"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  __AXStringForVariables();
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

@end
