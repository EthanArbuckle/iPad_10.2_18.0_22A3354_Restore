@implementation MTAStopwatchLapCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("MTAStopwatchLapCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MTAStopwatchLapCell"), CFSTR("timeLabel"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MTAStopwatchLapCell"), CFSTR("runningTotalLabel"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MTAStopwatchLapCell"), CFSTR("lap"), "q", 0);

}

- (id)accessibilityLabel
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v16;

  -[MTAStopwatchLapCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("lap"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringValue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[MTAStopwatchLapCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("timeLabel"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "accessibilityLabel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  AXLocalizeDurationTime();
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[MTAStopwatchLapCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("runningTotalLabel"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "accessibilityLabel");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  AXLocalizeDurationTime();
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = objc_msgSend(v10, "length");
  v12 = (void *)MEMORY[0x24BDD17C8];
  if (v11)
  {
    accessibilityLocalizedString(CFSTR("lap.cell.long.text"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "stringWithFormat:", v13, v4, v7, v10);
  }
  else
  {
    accessibilityLocalizedString(CFSTR("lap.cell.short.text"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "stringWithFormat:", v13, v4, v7, v16);
  }
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (id)accessibilityValue
{
  void *v3;
  void *v4;
  void *v5;
  int v6;
  __CFString *v7;
  void *v8;
  int v9;
  uint64_t v10;
  void *v11;
  objc_super v13;
  char v14;

  v14 = 0;
  objc_opt_class();
  -[MTAStopwatchLapCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("color"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDF6950], "systemGreenColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = UIAccessibilityColorEqualToColor();

  if (v6)
  {
    v7 = CFSTR("stopwatch.fastest");
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDF6950], "systemRedColor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = UIAccessibilityColorEqualToColor();

    if (!v9)
    {
      v13.receiver = self;
      v13.super_class = (Class)MTAStopwatchLapCellAccessibility;
      -[MTAStopwatchLapCellAccessibility accessibilityValue](&v13, sel_accessibilityValue);
      v10 = objc_claimAutoreleasedReturnValue();
      goto LABEL_7;
    }
    v7 = CFSTR("stopwatch.slowest");
  }
  accessibilityLocalizedString(v7);
  v10 = objc_claimAutoreleasedReturnValue();
LABEL_7:
  v11 = (void *)v10;

  return v11;
}

- (unint64_t)accessibilityTraits
{
  void *v3;
  uint64_t v4;
  unint64_t v5;
  objc_super v7;

  -[MTAStopwatchLapCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("lap"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "integerValue");

  if (v4 == -1)
  {
    v5 = *MEMORY[0x24BEBB178];
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)MTAStopwatchLapCellAccessibility;
    v5 = -[MTAStopwatchLapCellAccessibility accessibilityTraits](&v7, sel_accessibilityTraits);
  }
  return *MEMORY[0x24BDF7430] | v5;
}

@end
