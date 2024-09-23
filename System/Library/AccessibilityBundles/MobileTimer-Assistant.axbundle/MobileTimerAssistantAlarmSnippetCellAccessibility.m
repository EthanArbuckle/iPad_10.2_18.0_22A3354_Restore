@implementation MobileTimerAssistantAlarmSnippetCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("MobileTimerAssistantAlarmSnippetCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v20;

  -[MobileTimerAssistantAlarmSnippetCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_alarmView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safeValueForKey:", CFSTR("repeatText"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[MobileTimerAssistantAlarmSnippetCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("alarm"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "safeValueForKey:", CFSTR("hour"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "integerValue");

  objc_msgSend(v5, "safeValueForKey:", CFSTR("minute"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "integerValue");

  objc_msgSend(MEMORY[0x24BDBCE48], "currentCalendar");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "components:fromDate:", 28, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "setHour:", v7);
  objc_msgSend(v12, "setMinute:", v9);
  objc_msgSend(v10, "dateFromComponents:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1500], "localizedStringFromDate:dateStyle:timeStyle:", v13, 0, 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDFEA60], "axAttributedStringWithString:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setAttribute:forKey:", *MEMORY[0x24BDBD270], *MEMORY[0x24BDFEB00]);
  if (objc_msgSend(v4, "length"))
  {
    v16 = (void *)MEMORY[0x24BDD17C8];
    accessibilityLocalizedString(CFSTR("alarm.cell.repeat.text"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "stringWithFormat:", v17, v4);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    __UIAXStringForVariables();
    v18 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v18 = v15;
  }

  return v18;
}

- (unint64_t)accessibilityTraits
{
  unint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)MobileTimerAssistantAlarmSnippetCellAccessibility;
  v3 = -[MobileTimerAssistantAlarmSnippetCellAccessibility accessibilityTraits](&v8, sel_accessibilityTraits);
  -[MobileTimerAssistantAlarmSnippetCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_alarmView"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "safeValueForKey:", CFSTR("enabledSwitch"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "accessibilityTraits") | v3;

  return *MEMORY[0x24BDF73B0] ^ v6;
}

- (id)accessibilityValue
{
  void *v2;
  void *v3;
  void *v4;

  -[MobileTimerAssistantAlarmSnippetCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_alarmView"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "safeValueForKey:", CFSTR("enabledSwitch"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "accessibilityValue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (CGPoint)accessibilityActivationPoint
{
  void *v2;
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  CGPoint result;

  -[MobileTimerAssistantAlarmSnippetCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_alarmView"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "safeValueForKey:", CFSTR("enabledSwitch"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "accessibilityActivationPoint");
  v5 = v4;
  v7 = v6;

  v8 = v5;
  v9 = v7;
  result.y = v9;
  result.x = v8;
  return result;
}

- (MobileTimerAssistantAlarmSnippetCellAccessibility)init
{
  MobileTimerAssistantAlarmSnippetCellAccessibility *v2;
  MobileTimerAssistantAlarmSnippetCellAccessibility *v3;
  void *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)MobileTimerAssistantAlarmSnippetCellAccessibility;
  v2 = -[MobileTimerAssistantAlarmSnippetCellAccessibility init](&v7, sel_init);
  v3 = v2;
  if (v2)
  {
    -[MobileTimerAssistantAlarmSnippetCellAccessibility safeValueForKey:](v2, "safeValueForKey:", CFSTR("_alarmView"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "safeValueForKey:", CFSTR("enabledSwitch"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setIsAccessibilityElement:", 0);

  }
  return v3;
}

@end
