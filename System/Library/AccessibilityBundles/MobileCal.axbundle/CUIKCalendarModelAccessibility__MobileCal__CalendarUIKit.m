@implementation CUIKCalendarModelAccessibility__MobileCal__CalendarUIKit

+ (id)safeCategoryTargetClassName
{
  return CFSTR("CUIKCalendarModel");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("EKCalendarDate"), CFSTR("date"), "@", 0);
  objc_msgSend(v3, "validateClass:hasClassMethod:withFullSignature:", CFSTR("NSLocale"), CFSTR("currentLocale"), "@", 0);

}

- (void)setSelectedDate:(id)a3
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)CUIKCalendarModelAccessibility__MobileCal__CalendarUIKit;
  -[CUIKCalendarModelAccessibility__MobileCal__CalendarUIKit setSelectedDate:](&v12, sel_setSelectedDate_, v4);
  -[CUIKCalendarModelAccessibility__MobileCal__CalendarUIKit _accessibilityValueForKey:](self, "_accessibilityValueForKey:", CFSTR("ShouldOutputChange"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "BOOLValue");

  if (v6)
  {
    v7 = (void *)MEMORY[0x24BDFEA60];
    objc_msgSend(v4, "date");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    AXDateStringForFormat();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "axAttributedStringWithString:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "setAttribute:forKey:", *MEMORY[0x24BDBD270], *MEMORY[0x24BDFEB10]);
    v11 = *MEMORY[0x24BDF72E0];
    UIAccessibilityPostNotification(*MEMORY[0x24BDF72E0], v10);
    MEMORY[0x234914960](v11);
    -[CUIKCalendarModelAccessibility__MobileCal__CalendarUIKit _accessibilityRemoveValueForKey:](self, "_accessibilityRemoveValueForKey:", CFSTR("ShouldOutputChange"));

  }
}

@end
