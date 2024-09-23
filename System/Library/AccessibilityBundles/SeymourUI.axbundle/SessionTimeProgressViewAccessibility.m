@implementation SessionTimeProgressViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SeymourUI.SessionTimeProgressView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SeymourUI.SessionTimeProgressView"), CFSTR("accessibilityDidUpdateTimer:percentage:"), "v", "d", "f", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SeymourUI.SessionTimeProgressView"), CFSTR("accessibilityShowRemaining"), "B", 0);

}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (unint64_t)accessibilityTraits
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SessionTimeProgressViewAccessibility;
  return *MEMORY[0x24BDF7430] | -[SessionTimeProgressViewAccessibility accessibilityTraits](&v3, sel_accessibilityTraits);
}

- (void)accessibilityDidUpdateTimer:(double)a3 percentage:(float)a4
{
  uint64_t v6;
  uint64_t v7;
  int v8;
  void *v9;
  __CFString *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;

  v6 = ((int)a3 / 60);
  v7 = ((int)a3 % 60);
  v8 = -[SessionTimeProgressViewAccessibility safeBoolForKey:](self, "safeBoolForKey:", CFSTR("accessibilityShowRemaining"));
  v9 = (void *)MEMORY[0x24BDD17C8];
  if (v8)
    v10 = CFSTR("timer.remaining.format");
  else
    v10 = CFSTR("timer.format");
  accessibilityLocalizedString(v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "stringWithFormat:", v11, v6, v7);
  v17 = (id)objc_claimAutoreleasedReturnValue();

  v12 = (void *)MEMORY[0x24BDD17C8];
  accessibilityLocalizedString(CFSTR("percent.complete.format"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "stringWithFormat:", v13, (int)(float)(a4 * 100.0));
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDBCE30], "axArrayByIgnoringNilElementsWithCount:", 2, v17, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v15)
  {
    AXLabelForElements();
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[SessionTimeProgressViewAccessibility setAccessibilityLabel:](self, "setAccessibilityLabel:", v16);

  }
}

@end
