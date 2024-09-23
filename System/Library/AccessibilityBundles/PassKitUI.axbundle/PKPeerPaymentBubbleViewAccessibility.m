@implementation PKPeerPaymentBubbleViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("PKPeerPaymentBubbleView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PKPeerPaymentBubbleView"), CFSTR("actionButton"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("PKPeerPaymentBubbleView"), CFSTR("_messageLabel"), "UILabel");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("PKPeerPaymentBubbleView"), CFSTR("_statusLabel"), "UILabel");
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PKPeerPaymentBubbleView"), CFSTR("state"), "Q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PKPeerPaymentBubbleView"), CFSTR("_actionButtonTapped:"), "v", "@", 0);

}

- (id)accessibilityElements
{
  void *v3;
  void *v4;
  int v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v11;
  _QWORD v12[4];
  id v13;
  id location;
  _QWORD v15[5];
  _QWORD v16[4];
  id v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;

  -[PKPeerPaymentBubbleViewAccessibility _accessibilityValueForKey:](self, "_accessibilityValueForKey:", CFSTR("PKPeerPaymentBubbleElement"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPeerPaymentBubbleViewAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("actionButton"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "_accessibilityViewIsVisible");
  if (!v3)
  {
    v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF67A0]), "initWithAccessibilityContainer:", self);
    -[PKPeerPaymentBubbleViewAccessibility _accessibilitySetRetainedValue:forKey:](self, "_accessibilitySetRetainedValue:forKey:", v3, CFSTR("PKPeerPaymentBubbleElement"));
    v19 = 0;
    v20 = &v19;
    v21 = 0x3032000000;
    v22 = __Block_byref_object_copy__1;
    v23 = __Block_byref_object_dispose__1;
    v24 = 0;
    LOBYTE(location) = 0;
    objc_opt_class();
    __UIAccessibilityCastAsClass();
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = (void *)v20[5];
    v20[5] = v6;

    v8 = MEMORY[0x24BDAC760];
    if (v5)
    {
      v16[0] = MEMORY[0x24BDAC760];
      v16[1] = 3221225472;
      v16[2] = __61__PKPeerPaymentBubbleViewAccessibility_accessibilityElements__block_invoke;
      v16[3] = &unk_2502E3D98;
      v18 = &v19;
      v17 = v4;
      objc_msgSend(v3, "_setAccessibilityFrameBlock:", v16);

    }
    else
    {
      v15[0] = MEMORY[0x24BDAC760];
      v15[1] = 3221225472;
      v15[2] = __61__PKPeerPaymentBubbleViewAccessibility_accessibilityElements__block_invoke_2;
      v15[3] = &unk_2502E3DC0;
      v15[4] = &v19;
      objc_msgSend(v3, "_setAccessibilityFrameBlock:", v15);
    }
    objc_initWeak(&location, self);
    v12[0] = v8;
    v12[1] = 3221225472;
    v12[2] = __61__PKPeerPaymentBubbleViewAccessibility_accessibilityElements__block_invoke_3;
    v12[3] = &unk_2502E3938;
    objc_copyWeak(&v13, &location);
    objc_msgSend(v3, "_setAccessibilityLabelBlock:", v12);
    objc_destroyWeak(&v13);
    objc_destroyWeak(&location);
    _Block_object_dispose(&v19, 8);

  }
  if (v5)
    objc_msgSend(MEMORY[0x24BDBCE30], "axArrayByIgnoringNilElementsWithCount:", 2, v3, v4);
  else
    objc_msgSend(MEMORY[0x24BDBCE30], "axArrayByIgnoringNilElementsWithCount:", 1, v3, v11);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

uint64_t __61__PKPeerPaymentBubbleViewAccessibility_accessibilityElements__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "accessibilityFrame");
  objc_msgSend(*(id *)(a1 + 32), "accessibilityFrame");
  return AX_CGRectBySubtractingRect();
}

uint64_t __61__PKPeerPaymentBubbleViewAccessibility_accessibilityElements__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "accessibilityFrame");
}

id __61__PKPeerPaymentBubbleViewAccessibility_accessibilityElements__block_invoke_3(uint64_t a1)
{
  id WeakRetained;
  void *v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_axBubbleLabel");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (id)_axBubbleLabel
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  __CFString *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;

  v3 = -[PKPeerPaymentBubbleViewAccessibility safeIntegerForKey:](self, "safeIntegerForKey:", CFSTR("state"));
  objc_opt_class();
  -[PKPeerPaymentBubbleViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_messageLabel"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  -[PKPeerPaymentBubbleViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_statusLabel"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    if ((unint64_t)(v3 - 5) > 3)
      v8 = CFSTR("unknown.transfer.format");
    else
      v8 = off_2502E3E08[v3 - 5];
    v10 = (void *)MEMORY[0x24BDD17C8];
    accessibilityLocalizedString(v8);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "text");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "stringWithFormat:", v11, v12);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v3 == 1)
    {
      objc_msgSend(v5, "text");
      v13 = objc_claimAutoreleasedReturnValue();

      v9 = (void *)v13;
    }
  }
  else
  {
    accessibilityLocalizedString(CFSTR("unknown.transfer"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  __UIAXStringForVariables();
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (void)_actionButtonTapped:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  _QWORD v7[4];
  id v8;
  id location;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)PKPeerPaymentBubbleViewAccessibility;
  -[PKPeerPaymentBubbleViewAccessibility _actionButtonTapped:](&v10, sel__actionButtonTapped_, v4);
  -[PKPeerPaymentBubbleViewAccessibility accessibilityElements](self, "accessibilityElements");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "firstObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_initWeak(&location, self);
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __60__PKPeerPaymentBubbleViewAccessibility__actionButtonTapped___block_invoke;
  v7[3] = &unk_2502E3DE8;
  objc_copyWeak(&v8, &location);
  objc_msgSend(v6, "_setAccessibilityFrameBlock:", v7);
  UIAccessibilityPostNotification(*MEMORY[0x24BDF72C8], v6);
  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);

}

double __60__PKPeerPaymentBubbleViewAccessibility__actionButtonTapped___block_invoke(uint64_t a1)
{
  id WeakRetained;
  double v2;
  double v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "accessibilityFrame");
  v3 = v2;

  return v3;
}

@end
