@implementation NSObject(AccessibilityAccessors)

+ (void)_accessibilityCalGetHourDesignatorsForAM:()AccessibilityAccessors andPM:
{
  CUIKGetHourDesignators(a3, a4);
}

+ (id)_accessibilityStringForDayOfWeek:()AccessibilityAccessors
{
  return CUIKStringForDayOfWeek(a3);
}

+ (id)_accessibilityStringForDate:()AccessibilityAccessors
{
  const void *v6;
  double v7;
  void *v8;
  void *v9;

  v6 = (const void *)CalCopyTimeZone();
  v7 = MEMORY[0x1BCCB7070](a3, a4, v6);
  CFRelease(v6);
  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  CUIKStringForDate(v8, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

@end
