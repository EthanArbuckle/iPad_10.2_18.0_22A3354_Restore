@implementation TimerSnippetTimeViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("TimerSnippetTimeView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)updateDisplayWithTime:(double)a3
{
  BOOL v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)TimerSnippetTimeViewAccessibility;
  v4 = -[TimerSnippetTimeViewAccessibility updateDisplayWithTime:](&v9, sel_updateDisplayWithTime_);
  -[TimerSnippetTimeViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_fireTime"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "doubleValue");

  UIAXTimeStringForDuration();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDFEA60], "axAttributedStringWithString:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setAttribute:forKey:", *MEMORY[0x24BDBD270], *MEMORY[0x24BDFEB30]);
  -[TimerSnippetTimeViewAccessibility setAccessibilityLabel:](self, "setAccessibilityLabel:", v7);

  return v4;
}

@end
