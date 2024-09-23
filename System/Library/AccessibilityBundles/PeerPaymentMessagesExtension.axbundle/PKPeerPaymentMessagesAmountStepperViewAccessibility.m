@implementation PKPeerPaymentMessagesAmountStepperViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("PKPeerPaymentMessagesAmountStepperView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (id)_axSpeakAmountTimer
{
  JUMPOUT(0x234919068);
}

- (void)_setAXSpeakAmountTimer:(id)a3
{
  __UIAccessibilitySetAssociatedObject();
}

- (BOOL)_axHasInvalidAmount
{
  return __UIAccessibilityGetAssociatedBool();
}

- (void)_setAXHasInvalidAmount:(BOOL)a3
{
  __UIAccessibilitySetAssociatedBool();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PKPeerPaymentMessagesAmountStepperView"), CFSTR("_decrementAmount"), "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PKPeerPaymentMessagesAmountStepperView"), CFSTR("_incrementAmount"), "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("PKPeerPaymentMessagesAmountStepperView"), CFSTR("_amountLabel"), "UILabel");
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PKPeerPaymentMessagesAmountStepperView"), CFSTR("keypadVisible"), "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PKPeerPaymentMessagesAmountStepperView"), CFSTR("handleNumberPadAction:"), "v", "Q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PKPeerPaymentMessagesAmountStepperView"), CFSTR("_shakeAmountLabel"), "v", 0);

}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (unint64_t)accessibilityTraits
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PKPeerPaymentMessagesAmountStepperViewAccessibility;
  return *MEMORY[0x24BDF73A0] | -[PKPeerPaymentMessagesAmountStepperViewAccessibility accessibilityTraits](&v3, sel_accessibilityTraits);
}

- (void)accessibilityIncrement
{
  AXPerformSafeBlock();
}

uint64_t __77__PKPeerPaymentMessagesAmountStepperViewAccessibility_accessibilityIncrement__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_incrementAmount");
}

- (void)accessibilityDecrement
{
  AXPerformSafeBlock();
}

uint64_t __77__PKPeerPaymentMessagesAmountStepperViewAccessibility_accessibilityDecrement__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_decrementAmount");
}

- (id)accessibilityLabel
{
  return accessibilityPeerPaymentLocalizedString(CFSTR("amount.text"));
}

- (id)accessibilityValue
{
  void *v2;
  void *v3;

  -[PKPeerPaymentMessagesAmountStepperViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_amountLabel"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accessibilityLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)accessibilityHint
{
  void *v2;
  void *v3;
  __CFString *v4;
  void *v5;

  -[PKPeerPaymentMessagesAmountStepperViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("keypadVisible"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    if (objc_msgSend(v2, "BOOLValue"))
      v4 = CFSTR("dismiss.keypad.hint");
    else
      v4 = CFSTR("show.keypad.hint");
    accessibilityPeerPaymentLocalizedString(v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (void)dealloc
{
  objc_super v3;

  -[PKPeerPaymentMessagesAmountStepperViewAccessibility _setAXSpeakAmountTimer:](self, "_setAXSpeakAmountTimer:", 0);
  v3.receiver = self;
  v3.super_class = (Class)PKPeerPaymentMessagesAmountStepperViewAccessibility;
  -[PKPeerPaymentMessagesAmountStepperViewAccessibility dealloc](&v3, sel_dealloc);
}

- (void)handleNumberPadAction:(unint64_t)a3
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v10[5];
  objc_super v11;

  -[PKPeerPaymentMessagesAmountStepperViewAccessibility _setAXHasInvalidAmount:](self, "_setAXHasInvalidAmount:", 0);
  v11.receiver = self;
  v11.super_class = (Class)PKPeerPaymentMessagesAmountStepperViewAccessibility;
  -[PKPeerPaymentMessagesAmountStepperViewAccessibility handleNumberPadAction:](&v11, sel_handleNumberPadAction_, a3);
  -[PKPeerPaymentMessagesAmountStepperViewAccessibility _axSpeakAmountTimer](self, "_axSpeakAmountTimer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    v6 = objc_alloc(MEMORY[0x24BE005F0]);
    v7 = (void *)objc_msgSend(v6, "initWithTargetSerialQueue:", MEMORY[0x24BDAC9B8]);
    -[PKPeerPaymentMessagesAmountStepperViewAccessibility _setAXSpeakAmountTimer:](self, "_setAXSpeakAmountTimer:", v7);

    -[PKPeerPaymentMessagesAmountStepperViewAccessibility _axSpeakAmountTimer](self, "_axSpeakAmountTimer");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setAutomaticallyCancelPendingBlockUponSchedulingNewBlock:", 1);

  }
  -[PKPeerPaymentMessagesAmountStepperViewAccessibility _axSpeakAmountTimer](self, "_axSpeakAmountTimer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __77__PKPeerPaymentMessagesAmountStepperViewAccessibility_handleNumberPadAction___block_invoke;
  v10[3] = &unk_2502F3398;
  v10[4] = self;
  objc_msgSend(v9, "afterDelay:processBlock:", v10, 1.0);

}

void __77__PKPeerPaymentMessagesAmountStepperViewAccessibility_handleNumberPadAction___block_invoke(uint64_t a1)
{
  __CFString *v2;
  void *v3;
  void *v4;
  id v5;

  if (objc_msgSend(*(id *)(a1 + 32), "_axHasInvalidAmount"))
    v2 = CFSTR("invalid.amount.text");
  else
    v2 = CFSTR("amount.text");
  accessibilityPeerPaymentLocalizedString(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "accessibilityValue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  __AXStringForVariables();
  v5 = (id)objc_claimAutoreleasedReturnValue();

  UIAccessibilitySpeakOrQueueIfNeeded();
}

- (void)_shakeAmountLabel
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PKPeerPaymentMessagesAmountStepperViewAccessibility;
  -[PKPeerPaymentMessagesAmountStepperViewAccessibility _shakeAmountLabel](&v3, sel__shakeAmountLabel);
  -[PKPeerPaymentMessagesAmountStepperViewAccessibility _setAXHasInvalidAmount:](self, "_setAXHasInvalidAmount:", 1);
}

@end
