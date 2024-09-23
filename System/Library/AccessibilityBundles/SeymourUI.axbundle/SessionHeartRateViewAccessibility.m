@implementation SessionHeartRateViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SeymourUI.SessionHeartRateView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SeymourUI.SessionHeartRateView"), CFSTR("accessibilityDidUpdateHeartRate:lastKnownHR:"), "v", "B", "@", 0);
}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SessionHeartRateViewAccessibility;
  -[SessionHeartRateViewAccessibility _accessibilityLoadAccessibilityInformation](&v4, sel__accessibilityLoadAccessibilityInformation);
  accessibilityLocalizedString(CFSTR("waiting.for.heart.rate.data"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SessionHeartRateViewAccessibility setAccessibilityLabel:](self, "setAccessibilityLabel:", v3);

}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (unint64_t)accessibilityTraits
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SessionHeartRateViewAccessibility;
  return *MEMORY[0x24BDF7430] | -[SessionHeartRateViewAccessibility accessibilityTraits](&v3, sel_accessibilityTraits);
}

- (void)accessibilityDidUpdateHeartRate:(BOOL)a3 lastKnownHR:(id)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  void *v8;
  double v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  objc_super v14;
  _QWORD v15[3];

  v4 = a3;
  v15[2] = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  v14.receiver = self;
  v14.super_class = (Class)SessionHeartRateViewAccessibility;
  -[SessionHeartRateViewAccessibility accessibilityDidUpdateHeartRate:lastKnownHR:](&v14, sel_accessibilityDidUpdateHeartRate_lastKnownHR_, v4, v6);
  if (!v6)
  {
    accessibilityLocalizedString(CFSTR("waiting.for.heart.rate.data"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_5;
  }
  v7 = (void *)MEMORY[0x24BDD17C8];
  accessibilityLocalizedString(CFSTR("heartrate.format"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "doubleValue");
  objc_msgSend(v7, "stringWithFormat:", v8, (int)v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
LABEL_5:
    -[SessionHeartRateViewAccessibility setAccessibilityLabel:](self, "setAccessibilityLabel:", v10);
    goto LABEL_6;
  }
  accessibilityLocalizedString(CFSTR("last.known.heart.rate"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v11;
  v15[1] = v10;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v15, 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  AXLabelForElements();
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  -[SessionHeartRateViewAccessibility setAccessibilityLabel:](self, "setAccessibilityLabel:", v13);
LABEL_6:

}

@end
