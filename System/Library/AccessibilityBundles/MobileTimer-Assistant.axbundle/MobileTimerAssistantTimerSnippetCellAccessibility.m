@implementation MobileTimerAssistantTimerSnippetCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("MobileTimerAssistantTimerSnippetCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x24BDF7430];
}

- (id)accessibilityLabel
{
  void *v2;
  void *v3;
  int v4;
  void *v5;
  void *v6;
  void *v8;

  -[MobileTimerAssistantTimerSnippetCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_timeView"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "safeValueForKey:", CFSTR("_running"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLValue");

  objc_msgSend(v2, "accessibilityLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    __UIAXStringForVariables();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    accessibilityLocalizedString(CFSTR("timer.cell.paused"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    __UIAXStringForVariables();
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v6;
}

@end
