@implementation DKInkViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("DKInkView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)_axIsDirectTouchable
{
  return __UIAccessibilityGetAssociatedBool();
}

- (void)_axSetIsDirectTouchable:(BOOL)a3
{
  __UIAccessibilitySetAssociatedBool();
}

- (id)_axDirectTouchTimer
{
  JUMPOUT(0x23490DAE0);
}

- (void)_axSetDirectTouchTimer:(id)a3
{
  __UIAccessibilitySetAssociatedObject();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("DKInkView"), CFSTR("UIView"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("UIView"), CFSTR("superview"), "@", 0);

}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (CGRect)accessibilityFrame
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  CGRect result;

  -[DKInkViewAccessibility superview](self, "superview");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accessibilityFrame");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;

  v11 = v4;
  v12 = v6;
  v13 = v8;
  v14 = v10;
  result.size.height = v14;
  result.size.width = v13;
  result.origin.y = v12;
  result.origin.x = v11;
  return result;
}

- (id)accessibilityLabel
{
  if (-[DKInkViewAccessibility _axIsDirectTouchable](self, "_axIsDirectTouchable"))
    return 0;
  accessibilityLocalizedString(CFSTR("writeboard.input.label"));
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)accessibilityHint
{
  if (-[DKInkViewAccessibility _axIsDirectTouchable](self, "_axIsDirectTouchable"))
    return 0;
  accessibilityLocalizedString(CFSTR("writeboard.input.hint"));
  return (id)objc_claimAutoreleasedReturnValue();
}

- (unint64_t)accessibilityTraits
{
  unint64_t v3;
  _BOOL4 v4;
  uint64_t v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)DKInkViewAccessibility;
  v3 = -[DKInkViewAccessibility accessibilityTraits](&v7, sel_accessibilityTraits);
  v4 = -[DKInkViewAccessibility _axIsDirectTouchable](self, "_axIsDirectTouchable");
  v5 = *MEMORY[0x24BDF73A8];
  if (!v4)
    v5 = 0;
  return v5 | v3;
}

- (BOOL)accessibilityActivate
{
  BOOL v3;
  void *v4;
  objc_super v6;

  if (-[DKInkViewAccessibility _axIsDirectTouchable](self, "_axIsDirectTouchable"))
  {
    v6.receiver = self;
    v6.super_class = (Class)DKInkViewAccessibility;
    return -[DKInkViewAccessibility accessibilityActivate](&v6, sel_accessibilityActivate);
  }
  else
  {
    v3 = 1;
    -[DKInkViewAccessibility _axSetIsDirectTouchable:](self, "_axSetIsDirectTouchable:", 1);
    -[DKInkViewAccessibility _axInvalidateTimerAndReschedule:](self, "_axInvalidateTimerAndReschedule:", 1);
    UIAccessibilityPostNotification(*MEMORY[0x24BDF72C8], self);
    accessibilityLocalizedString(CFSTR("writeboard.start.writing"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    UIAccessibilitySpeak();

  }
  return v3;
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)DKInkViewAccessibility;
  -[DKInkViewAccessibility touchesBegan:withEvent:](&v5, sel_touchesBegan_withEvent_, a3, a4);
  -[DKInkViewAccessibility _axInvalidateTimerAndReschedule:](self, "_axInvalidateTimerAndReschedule:", 0);
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)DKInkViewAccessibility;
  -[DKInkViewAccessibility touchesEnded:withEvent:](&v5, sel_touchesEnded_withEvent_, a3, a4);
  -[DKInkViewAccessibility _axInvalidateTimerAndReschedule:](self, "_axInvalidateTimerAndReschedule:", 1);
}

- (void)_axInvalidateTimerAndReschedule:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  _QWORD v7[5];

  v3 = a3;
  -[DKInkViewAccessibility _axDirectTouchTimer](self, "_axDirectTouchTimer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "invalidate");

  if (v3)
  {
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __58__DKInkViewAccessibility__axInvalidateTimerAndReschedule___block_invoke;
    v7[3] = &unk_2501FB888;
    v7[4] = self;
    objc_msgSend(MEMORY[0x24BDBCF40], "scheduledTimerWithTimeInterval:repeats:block:", 0, v7, 2.0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }
  -[DKInkViewAccessibility _axSetDirectTouchTimer:](self, "_axSetDirectTouchTimer:", v6);

}

void __58__DKInkViewAccessibility__axInvalidateTimerAndReschedule___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "_axSetIsDirectTouchable:", 0);
  UIAccessibilityPostNotification(*MEMORY[0x24BDF72C8], *(id *)(a1 + 32));
  accessibilityLocalizedString(CFSTR("writeboard.stop.writing"));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  UIAccessibilitySpeak();

}

@end
