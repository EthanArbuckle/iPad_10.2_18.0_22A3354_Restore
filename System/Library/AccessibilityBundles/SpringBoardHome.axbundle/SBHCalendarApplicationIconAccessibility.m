@implementation SBHCalendarApplicationIconAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SBHCalendarApplicationIcon");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (id)accessibilityValue
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v8;

  if (accessibilityValue_didSet != 1
    || CFAbsoluteTimeGetCurrent() - *(double *)&accessibilityValue_LastSetTime > 300.0
    || (accessibilityValue_didSet & 1) == 0)
  {
    accessibilityValue_didSet = 1;
    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    AXDateStringForFormat();
    v4 = objc_claimAutoreleasedReturnValue();

    v5 = (void *)accessibilityValue_Value;
    accessibilityValue_Value = v4;

    accessibilityValue_LastSetTime = CFAbsoluteTimeGetCurrent();
  }
  -[SBHCalendarApplicationIconAccessibility safeStringForKey:](self, "safeStringForKey:", CFSTR("_axIconValue"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAXStringForVariables();
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

@end
