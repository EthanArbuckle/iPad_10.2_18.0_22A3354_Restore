@implementation AKInkSignatureViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("AKInkSignatureView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:conformsToProtocol:", CFSTR("AKInkSignatureView"), CFSTR("PKCanvasViewDelegate"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("AKInkSignatureView"), CFSTR("canvasViewDrawingDidChange:"), "v", "@", 0);

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

  -[AKInkSignatureViewAccessibility _axDirectTouchTimer](self, "_axDirectTouchTimer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    v4 = objc_alloc(MEMORY[0x24BE005F0]);
    v5 = (void *)objc_msgSend(v4, "initWithTargetSerialQueue:", MEMORY[0x24BDAC9B8]);
    objc_msgSend(v5, "setAutomaticallyCancelPendingBlockUponSchedulingNewBlock:", 1);
    -[AKInkSignatureViewAccessibility _setAXDirectTouchTimer:](self, "_setAXDirectTouchTimer:", v5);

  }
  -[AKInkSignatureViewAccessibility setAccessibilityTraits:](self, "setAccessibilityTraits:", *MEMORY[0x24BDF73A8]);
  UIAccessibilityPostNotification(*MEMORY[0x24BDF72C8], self);
  -[AKInkSignatureViewAccessibility _axDirectTouchTimer](self, "_axDirectTouchTimer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __56__AKInkSignatureViewAccessibility_accessibilityActivate__block_invoke;
  v8[3] = &unk_25014EE00;
  v8[4] = self;
  objc_msgSend(v6, "afterDelay:processBlock:", v8, 3.0);

  return 1;
}

uint64_t __56__AKInkSignatureViewAccessibility_accessibilityActivate__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_axStopDirectTouch");
}

- (void)_axStopDirectTouch
{
  AKInkSignatureViewAccessibility *v2;
  id v3;

  v2 = self;
  -[AKInkSignatureViewAccessibility setAccessibilityTraits:](self, "setAccessibilityTraits:", *MEMORY[0x24BDF73E0]);
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

- (void)canvasViewDidStartNewStroke:(id)a3
{
  UIAccessibilityNotifications v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)AKInkSignatureViewAccessibility;
  -[AKInkSignatureViewAccessibility canvasViewDidStartNewStroke:](&v5, sel_canvasViewDidStartNewStroke_, a3);
  v3 = *MEMORY[0x24BDF71E8];
  accessibilityLocalizedString(CFSTR("signature.drawing.began"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  UIAccessibilityPostNotification(v3, v4);

}

- (void)canvasViewDrawingDidChange:(id)a3
{
  void *v4;
  _QWORD v5[5];
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)AKInkSignatureViewAccessibility;
  -[AKInkSignatureViewAccessibility canvasViewDrawingDidChange:](&v6, sel_canvasViewDrawingDidChange_, a3);
  -[AKInkSignatureViewAccessibility _axDirectTouchTimer](self, "_axDirectTouchTimer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __62__AKInkSignatureViewAccessibility_canvasViewDrawingDidChange___block_invoke;
  v5[3] = &unk_25014EE00;
  v5[4] = self;
  objc_msgSend(v4, "afterDelay:processBlock:", v5, 3.0);

}

uint64_t __62__AKInkSignatureViewAccessibility_canvasViewDrawingDidChange___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_axStopDirectTouch");
}

@end
