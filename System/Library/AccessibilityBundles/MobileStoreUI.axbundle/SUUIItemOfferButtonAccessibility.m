@implementation SUUIItemOfferButtonAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SUUIItemOfferButton");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SUUIItemOfferButton"), CFSTR("confirmationTitle"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SUUIItemOfferButton"), CFSTR("title"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SUUIItemOfferButton"), CFSTR("progress"), "d", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SUUIItemOfferButton"), CFSTR("isShowingConfirmation"), "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SUUIItemOfferButton"), CFSTR("progressType"), "q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SUUIItemBrowseCellLayout"), CFSTR("title"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("SUUIItemOfferButton"), CFSTR("_cloudImage"), "UIImage");
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SUUIItemOfferButton"), CFSTR("buttonDescriptor"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SUUIItemOfferButton"), CFSTR("_buttonPropertiesForState:"), "@", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SUUIItemOfferButtonProperties"), CFSTR("image"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SUUIItemOfferButton"), CFSTR("element"), "@", 0);
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("SUUIButtonViewElement"), CFSTR("SUUIViewElement"));
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("SUUIViewElement"), CFSTR("IKViewElement"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("IKViewElement"), CFSTR("parent"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("IKViewElement"), CFSTR("attributes"), "@", 0);

}

- (BOOL)_accessibilitySupportsActivateAction
{
  return 0;
}

- (BOOL)accessibilityActivate
{
  return 0;
}

- (id)accessibilityValue
{
  void *v3;
  uint64_t v4;
  double v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  objc_super v12;

  -[SUUIItemOfferButtonAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("progressType"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "integerValue");

  if ((v4 & 0xFFFFFFFFFFFFFFFELL) == 2)
  {
    -[SUUIItemOfferButtonAccessibility safeCGFloatForKey:](self, "safeCGFloatForKey:", CFSTR("progress"));
    if (v5 == 0.0)
    {
      v6 = 0;
    }
    else
    {
      v8 = (void *)MEMORY[0x24BDD17C8];
      accessibilityLocalizedString(CFSTR("item.offer.button.progress"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      AXFormatFloatWithPercentage();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "stringWithFormat:", v9, v10);
      v6 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }
  else
  {
    if (v4 == 4)
    {
      accessibilityLocalizedString(CFSTR("item.download.paused"));
      v7 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v12.receiver = self;
      v12.super_class = (Class)SUUIItemOfferButtonAccessibility;
      -[SUUIItemOfferButtonAccessibility accessibilityValue](&v12, sel_accessibilityValue);
      v7 = objc_claimAutoreleasedReturnValue();
    }
    v6 = (void *)v7;
  }
  return v6;
}

- (id)accessibilityLabel
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v9;
  char v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  uint64_t v20;
  void *v21;
  __CFString *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  int v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  id v34;
  uint64_t v35;
  uint64_t *v36;
  uint64_t v37;
  uint64_t (*v38)(uint64_t, uint64_t);
  void (*v39)(uint64_t);
  id v40;

  -[SUUIItemOfferButtonAccessibility accessibilityUserDefinedLabel](self, "accessibilityUserDefinedLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[SUUIItemOfferButtonAccessibility accessibilityUserDefinedLabel](self, "accessibilityUserDefinedLabel");
    v4 = objc_claimAutoreleasedReturnValue();
LABEL_5:
    v7 = (void *)v4;
    return v7;
  }
  -[SUUIItemOfferButtonAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("progressType"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "integerValue");

  if (v6 == 1)
  {
    accessibilityLocalizedString(CFSTR("item.connecting"));
    v4 = objc_claimAutoreleasedReturnValue();
    goto LABEL_5;
  }
  -[SUUIItemOfferButtonAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("delegate"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_opt_respondsToSelector();

  if ((v10 & 1) != 0)
  {
    -[SUUIItemOfferButtonAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("delegate"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "safeValueForKey:", CFSTR("title"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v12 = 0;
  }
  -[SUUIItemOfferButtonAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("buttonDescriptor"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilitySafeClass();
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v35 = 0;
  v36 = &v35;
  v37 = 0x3032000000;
  v38 = __Block_byref_object_copy__2;
  v39 = __Block_byref_object_dispose__2;
  v40 = 0;
  if (v14)
  {
    v34 = v14;
    AXPerformSafeBlock();

  }
  -[SUUIItemOfferButtonAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_cloudImage"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v15
    && (objc_msgSend((id)v36[5], "safeValueForKey:", CFSTR("image")),
        v16 = (void *)objc_claimAutoreleasedReturnValue(),
        -[SUUIItemOfferButtonAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_cloudImage")),
        v17 = (void *)objc_claimAutoreleasedReturnValue(),
        v17,
        v16,
        v15,
        v16 == v17))
  {
    accessibilityLocalizedString(CFSTR("item.download"));
    v20 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[SUUIItemOfferButtonAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("isShowingConfirmation"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "BOOLValue");

    if (!v19)
    {
      v21 = 0;
      goto LABEL_19;
    }
    -[SUUIItemOfferButtonAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("confirmationTitle"));
    v20 = objc_claimAutoreleasedReturnValue();
  }
  v21 = (void *)v20;
LABEL_19:
  if (!objc_msgSend(v21, "length"))
  {
    if (v6 == 3)
    {
      v22 = CFSTR("item.downloading");
      goto LABEL_24;
    }
    if (v6 == 2)
    {
      v22 = CFSTR("item.downloading.cancelable");
LABEL_24:
      accessibilityLocalizedString(v22);
      v23 = objc_claimAutoreleasedReturnValue();

      v21 = (void *)v23;
    }
  }
  if (!objc_msgSend(v21, "length"))
  {
    -[SUUIItemOfferButtonAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("title"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v24, "length") == 1)
    {
      accessibilityLocalizedString(CFSTR("no.value"));
      v21 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v21 = v24;
    }
  }
  if (!objc_msgSend(v21, "length"))
  {
    objc_opt_class();
    -[SUUIItemOfferButtonAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("element"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "safeValueForKey:", CFSTR("parent"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "safeValueForKey:", CFSTR("attributes"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    __UIAccessibilityCastAsClass();
    v28 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v28, "objectForKey:", CFSTR("supportsPlayButton"));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = objc_msgSend(v29, "BOOLValue");

    if (v30)
    {
      accessibilityLocalizedString(CFSTR("play.button"));
      v31 = objc_claimAutoreleasedReturnValue();

      v21 = (void *)v31;
    }

  }
  if (!objc_msgSend(v21, "length"))
  {
    accessibilityLocalizedString(CFSTR("item.download"));
    v32 = objc_claimAutoreleasedReturnValue();

    v21 = (void *)v32;
  }
  if (UIAccessibilityIsVoiceOverRunning())
  {
    objc_msgSend(v21, "lowercaseString");
    v33 = objc_claimAutoreleasedReturnValue();

    v21 = (void *)v33;
  }
  __UIAXStringForVariables();
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  _Block_object_dispose(&v35, 8);
  return v7;
}

void __54__SUUIItemOfferButtonAccessibility_accessibilityLabel__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;

  objc_msgSend(*(id *)(a1 + 32), "_buttonPropertiesForState:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilitySafeClass();
  v3 = objc_claimAutoreleasedReturnValue();

  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

- (id)accessibilityHint
{
  void *v3;
  int v4;
  void *v5;
  objc_super v7;

  -[SUUIItemOfferButtonAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("isShowingConfirmation"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLValue");

  if (v4)
  {
    accessibilityLocalizedString(CFSTR("item.offer.button.text.confirm.hint"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)SUUIItemOfferButtonAccessibility;
    -[SUUIItemOfferButtonAccessibility accessibilityHint](&v7, sel_accessibilityHint);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v5;
}

- (unint64_t)accessibilityTraits
{
  unint64_t v3;
  void *v4;
  uint64_t v5;
  objc_super v7;

  v3 = *MEMORY[0x24BDF7430];
  -[SUUIItemOfferButtonAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("progressType"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "integerValue");

  if (v5 != 1)
  {
    v7.receiver = self;
    v7.super_class = (Class)SUUIItemOfferButtonAccessibility;
    v3 |= -[SUUIItemOfferButtonAccessibility accessibilityTraits](&v7, sel_accessibilityTraits) | *MEMORY[0x24BDF73B0];
    if (v5 == 5)
      v3 |= *MEMORY[0x24BDF7408];
  }
  return v3;
}

- (id)_accessibilityHitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y;
  double x;
  id v7;
  double v8;
  double v9;
  SUUIItemOfferButtonAccessibility *v10;
  SUUIItemOfferButtonAccessibility *v11;
  objc_super v13;
  CGPoint v14;
  CGRect v15;
  CGRect v16;

  y = a3.y;
  x = a3.x;
  v7 = a4;
  AXDeviceGetMainScreenScaleFactor();
  v9 = v8;
  -[SUUIItemOfferButtonAccessibility bounds](self, "bounds");
  v16 = CGRectInset(v15, v9 * -15.0, v9 * -15.0);
  v14.x = x;
  v14.y = y;
  if (CGRectContainsPoint(v16, v14))
  {
    v10 = self;
  }
  else
  {
    v13.receiver = self;
    v13.super_class = (Class)SUUIItemOfferButtonAccessibility;
    -[SUUIItemOfferButtonAccessibility _accessibilityHitTest:withEvent:](&v13, sel__accessibilityHitTest_withEvent_, v7, x, y);
    v10 = (SUUIItemOfferButtonAccessibility *)objc_claimAutoreleasedReturnValue();
  }
  v11 = v10;

  return v11;
}

- (id)accessibilityIdentifier
{
  void *v3;
  uint64_t v4;
  __CFString *v5;

  -[SUUIItemOfferButtonAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("progressType"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "integerValue");

  if (v4 == 6)
  {
    -[SUUIItemOfferButtonAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("title"));
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = CFSTR("PurchaseButton");
  }
  return v5;
}

@end
