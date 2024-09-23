@implementation AKSignatureViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("AKSignatureView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("AKSignatureView"), CFSTR("touchesBegan: withEvent:"), "v", "@", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("AKSignatureView"), CFSTR("touchesMoved: withEvent:"), "v", "@", "@", 0);

}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  return accessibilityLocalizedString(CFSTR("signature.label"));
}

- (id)accessibilityHint
{
  return accessibilityLocalizedString(CFSTR("signature.hint"));
}

- (id)_axDirectTouchTimer
{
  JUMPOUT(0x234905984);
}

- (void)_setAXDirectTouchTimer:(id)a3
{
  __UIAccessibilitySetAssociatedObject();
}

- (BOOL)accessibilityActivate
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  _QWORD v8[5];

  -[AKSignatureViewAccessibility _axDirectTouchTimer](self, "_axDirectTouchTimer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    v4 = objc_alloc(MEMORY[0x24BE005F0]);
    v5 = (void *)objc_msgSend(v4, "initWithTargetSerialQueue:", MEMORY[0x24BDAC9B8]);
    objc_msgSend(v5, "setAutomaticallyCancelPendingBlockUponSchedulingNewBlock:", 1);
    -[AKSignatureViewAccessibility _setAXDirectTouchTimer:](self, "_setAXDirectTouchTimer:", v5);

  }
  -[AKSignatureViewAccessibility setAccessibilityTraits:](self, "setAccessibilityTraits:", *MEMORY[0x24BDF73A8]);
  UIAccessibilityPostNotification(*MEMORY[0x24BDF72C8], self);
  -[AKSignatureViewAccessibility _axDirectTouchTimer](self, "_axDirectTouchTimer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __53__AKSignatureViewAccessibility_accessibilityActivate__block_invoke;
  v8[3] = &unk_25014EE00;
  v8[4] = self;
  objc_msgSend(v6, "afterDelay:processBlock:", v8, 3.0);

  return 1;
}

uint64_t __53__AKSignatureViewAccessibility_accessibilityActivate__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_axStopDirectTouch");
}

- (void)_axStopDirectTouch
{
  AKSignatureViewAccessibility *v2;
  id v3;

  v2 = self;
  -[AKSignatureViewAccessibility setAccessibilityTraits:](self, "setAccessibilityTraits:", *MEMORY[0x24BDF73E0]);
  UIAccessibilityPostNotification(*MEMORY[0x24BDF72C8], v2);
  LODWORD(v2) = *MEMORY[0x24BDF71E8];
  accessibilityLocalizedString(CFSTR("signature.drawing.ended"));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  UIAccessibilityPostNotification((UIAccessibilityNotifications)v2, v3);

}

- (CGPoint)accessibilityActivationPoint
{
  double v2;
  double v3;
  CGPoint result;

  v2 = -1.0;
  v3 = -1.0;
  result.y = v3;
  result.x = v2;
  return result;
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  UIAccessibilityNotifications v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)AKSignatureViewAccessibility;
  -[AKSignatureViewAccessibility touchesBegan:withEvent:](&v6, sel_touchesBegan_withEvent_, a3, a4);
  v4 = *MEMORY[0x24BDF71E8];
  accessibilityLocalizedString(CFSTR("signature.drawing.began"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  UIAccessibilityPostNotification(v4, v5);

}

- (void)touchesMoved:(id)a3 withEvent:(id)a4
{
  void *v5;
  _QWORD v6[5];
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)AKSignatureViewAccessibility;
  -[AKSignatureViewAccessibility touchesMoved:withEvent:](&v7, sel_touchesMoved_withEvent_, a3, a4);
  -[AKSignatureViewAccessibility _axDirectTouchTimer](self, "_axDirectTouchTimer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __55__AKSignatureViewAccessibility_touchesMoved_withEvent___block_invoke;
  v6[3] = &unk_25014EE00;
  v6[4] = self;
  objc_msgSend(v5, "afterDelay:processBlock:", v6, 3.0);

}

uint64_t __55__AKSignatureViewAccessibility_touchesMoved_withEvent___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_axStopDirectTouch");
}

@end
