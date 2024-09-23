@implementation AccessibilityNodeAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SwiftUI.AccessibilityNode");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("SwiftUI.AccessibilityIncrementalLayoutNode"), CFSTR("SwiftUI.AccessibilityNode"));
  objc_msgSend(v3, "validateClass:hasSwiftField:withSwiftType:", CFSTR("SwiftUI.AccessibilityNode"), CFSTR("viewRendererHost"), "Optional<ViewRendererHost>");
  objc_msgSend(v3, "validateClass:hasSwiftField:withSwiftType:", CFSTR("SwiftUI.AccessibilityNode"), CFSTR("parent"), "Optional<AccessibilityNode>");
  objc_msgSend(v3, "validateClass:hasSwiftField:withSwiftType:", CFSTR("SwiftUI.AccessibilityNode"), CFSTR("children"), "Array<AccessibilityNode>");
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SwiftUI.AccessibilityNode"), CFSTR("_accessibilityIsHostNode"), "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SwiftUI.AccessibilityNode"), CFSTR("_accessibilityNodeRepresentedElement"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SwiftUI.AccessibilityNode"), CFSTR("_accessibilityNodeChildrenUnsorted"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SwiftUI.AccessibilityNode"), CFSTR("accessibilityCustomAttribute:"), "@", "@", 0);

}

- (BOOL)_accessibilityUserTestingIsElementClassAcceptable
{
  return 1;
}

- (BOOL)_accessibilityPrefersNonAttributedAttributeWithOverrideSelector:(SEL)a3 nonAttributedSelector:(SEL)a4 attributedSelector:(SEL)a5
{
  objc_super v10;

  if (AXDoesRequestingClientDeserveAutomation())
    return 1;
  v10.receiver = self;
  v10.super_class = (Class)AccessibilityNodeAccessibility;
  return -[AccessibilityNodeAccessibility _accessibilityPrefersNonAttributedAttributeWithOverrideSelector:nonAttributedSelector:attributedSelector:](&v10, sel__accessibilityPrefersNonAttributedAttributeWithOverrideSelector_nonAttributedSelector_attributedSelector_, a3, a4, a5);
}

- (BOOL)_accessibilityAutomationHitTestReverseOrder
{
  return 1;
}

- (BOOL)_accessibilityIsSingleLeafItemInCell
{
  void *v3;
  void *v4;
  BOOL IsSingleChildInArray;
  void *v6;
  void *v7;

  if (!-[AccessibilityNodeAccessibility isAccessibilityElement](self, "isAccessibilityElement"))
    return 0;
  -[AccessibilityNodeAccessibility safeSwiftValueForKey:](self, "safeSwiftValueForKey:", CFSTR("parent"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "safeBoolForKey:", CFSTR("_accessibilityIsHostNode")))
  {
    objc_msgSend(v3, "safeArrayForKey:", CFSTR("_accessibilityNodeChildrenUnsorted"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    IsSingleChildInArray = _accessibilityNodeIsSingleChildInArray(self, v4);
  }
  else
  {
    objc_msgSend(v3, "safeSwiftValueForKey:", CFSTR("parent"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "safeBoolForKey:", CFSTR("_accessibilityIsHostNode")))
    {
      objc_msgSend(v3, "safeArrayForKey:", CFSTR("_accessibilityNodeChildrenUnsorted"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (_accessibilityNodeIsSingleChildInArray(self, v6))
      {
        objc_msgSend(v4, "safeArrayForKey:", CFSTR("_accessibilityNodeChildrenUnsorted"));
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        IsSingleChildInArray = _accessibilityNodeIsSingleChildInArray(v3, v7);

      }
      else
      {
        IsSingleChildInArray = 0;
      }

    }
    else
    {
      IsSingleChildInArray = 0;
    }
  }

  return IsSingleChildInArray;
}

- (id)_accessibilityVisualExpansionProxy
{
  void *v4;
  void *v5;
  id v6;
  void *v7;

  MEMORY[0x2349212C4](CFSTR("SwiftUI.AccessibilityIncrementalLayoutNode"), a2);
  if ((objc_opt_isKindOfClass() & 1) != 0)
    return 0;
  objc_opt_class();
  -[AccessibilityNodeAccessibility safeSwiftValueForKey:](self, "safeSwiftValueForKey:", CFSTR("viewRendererHost"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5
    && -[AccessibilityNodeAccessibility safeBoolForKey:](self, "safeBoolForKey:", CFSTR("_accessibilityIsHostNode")))
  {
    v6 = v5;
LABEL_6:
    v7 = v6;
    goto LABEL_12;
  }
  if (!objc_msgSend(v5, "safeBoolForKey:", CFSTR("_accessibilityIsSwiftUIHostingCellView"))
    || !-[AccessibilityNodeAccessibility _accessibilityIsSingleLeafItemInCell](self, "_accessibilityIsSingleLeafItemInCell"))
  {
    v7 = 0;
    goto LABEL_12;
  }
  objc_msgSend(v5, "_accessibilityAncestorIsKindOf:", objc_opt_class());
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    objc_msgSend(v5, "_accessibilityAncestorIsKindOf:", objc_opt_class());
    v6 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_6;
  }
LABEL_12:

  return v7;
}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v8.receiver = self;
  v8.super_class = (Class)AccessibilityNodeAccessibility;
  -[AccessibilityNodeAccessibility description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[AccessibilityNodeAccessibility accessibilityLabel](self, "accessibilityLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@: %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

- (BOOL)_accessibilityHitTestShouldFallbackToNearestChild
{
  id v3;
  void *v4;
  char v5;
  objc_super v7;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(uint64_t);
  void *v11;
  AccessibilityNodeAccessibility *v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;
  char v20;

  v20 = 0;
  objc_opt_class();
  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy_;
  v18 = __Block_byref_object_dispose_;
  v19 = 0;
  v8 = MEMORY[0x24BDAC760];
  v9 = 3221225472;
  v10 = __83__AccessibilityNodeAccessibility__accessibilityHitTestShouldFallbackToNearestChild__block_invoke;
  v11 = &unk_25039A430;
  v12 = self;
  v13 = &v14;
  AXPerformSafeBlock();
  v3 = (id)v15[5];
  _Block_object_dispose(&v14, 8);

  __UIAccessibilityCastAsClass();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v20)
    abort();
  v5 = objc_msgSend(v4, "BOOLValue");

  if ((v5 & 1) != 0)
    return 1;
  v7.receiver = self;
  v7.super_class = (Class)AccessibilityNodeAccessibility;
  return -[AccessibilityNodeAccessibility _accessibilityHitTestShouldFallbackToNearestChild](&v7, sel__accessibilityHitTestShouldFallbackToNearestChild);
}

void __83__AccessibilityNodeAccessibility__accessibilityHitTestShouldFallbackToNearestChild__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "accessibilityCustomAttribute:", CFSTR("AXHitTestShouldFallbackToNearestChild"));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (BOOL)_accessibilityShouldIncludeMediaDescriptionsRotor
{
  id v3;
  char v4;
  objc_super v6;
  uint64_t v7;
  uint64_t v8;
  void (*v9)(uint64_t);
  void *v10;
  AccessibilityNodeAccessibility *v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;

  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy_;
  v17 = __Block_byref_object_dispose_;
  v18 = 0;
  v7 = MEMORY[0x24BDAC760];
  v8 = 3221225472;
  v9 = __83__AccessibilityNodeAccessibility__accessibilityShouldIncludeMediaDescriptionsRotor__block_invoke;
  v10 = &unk_25039A430;
  v11 = self;
  v12 = &v13;
  AXPerformSafeBlock();
  v3 = (id)v14[5];
  _Block_object_dispose(&v13, 8);

  v4 = objc_msgSend(v3, "BOOLValue");
  if ((v4 & 1) != 0)
    return 1;
  v6.receiver = self;
  v6.super_class = (Class)AccessibilityNodeAccessibility;
  return -[AccessibilityNodeAccessibility _accessibilityShouldIncludeMediaDescriptionsRotor](&v6, sel__accessibilityShouldIncludeMediaDescriptionsRotor);
}

void __83__AccessibilityNodeAccessibility__accessibilityShouldIncludeMediaDescriptionsRotor__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "accessibilityCustomAttribute:", CFSTR("AXShouldIncludeMediaDescriptionsRotor"));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (BOOL)_accessibilityUseElementAtPositionAfterActivation
{
  id v3;
  char v4;
  objc_super v6;
  uint64_t v7;
  uint64_t v8;
  void (*v9)(uint64_t);
  void *v10;
  AccessibilityNodeAccessibility *v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;

  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy_;
  v17 = __Block_byref_object_dispose_;
  v18 = 0;
  v7 = MEMORY[0x24BDAC760];
  v8 = 3221225472;
  v9 = __83__AccessibilityNodeAccessibility__accessibilityUseElementAtPositionAfterActivation__block_invoke;
  v10 = &unk_25039A430;
  v11 = self;
  v12 = &v13;
  AXPerformSafeBlock();
  v3 = (id)v14[5];
  _Block_object_dispose(&v13, 8);

  v4 = objc_msgSend(v3, "BOOLValue");
  if ((v4 & 1) != 0)
    return 1;
  v6.receiver = self;
  v6.super_class = (Class)AccessibilityNodeAccessibility;
  return -[AccessibilityNodeAccessibility _accessibilityUseElementAtPositionAfterActivation](&v6, sel__accessibilityUseElementAtPositionAfterActivation);
}

void __83__AccessibilityNodeAccessibility__accessibilityUseElementAtPositionAfterActivation__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "accessibilityCustomAttribute:", CFSTR("AXUseElementAtPositionAfterActivationAttribute"));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (id)_accessibilityAXAttributedLabel
{
  void *v3;
  id v4;
  id v5;
  id v6;
  uint64_t v8;
  AccessibilityNodeAccessibility *v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  id v15;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)AccessibilityNodeAccessibility;
  -[AccessibilityNodeAccessibility _accessibilityAXAttributedLabel](&v16, sel__accessibilityAXAttributedLabel);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 0;
  v11 = &v10;
  v12 = 0x3032000000;
  v13 = __Block_byref_object_copy_;
  v14 = __Block_byref_object_dispose_;
  v15 = 0;
  v8 = MEMORY[0x24BDAC760];
  v9 = self;
  AXPerformSafeBlock();
  v4 = (id)v11[5];
  _Block_object_dispose(&v10, 8);

  if (objc_msgSend(v3, "isAXAttributedString", v8, 3221225472, __65__AccessibilityNodeAccessibility__accessibilityAXAttributedLabel__block_invoke, &unk_25039A430, v9, &v10)&& objc_msgSend(v4, "length"))
  {
    v5 = v3;
    objc_msgSend(v5, "addAttribute:forKey:withRange:", v4, *MEMORY[0x24BDFEAF8], 0, objc_msgSend(v5, "length"));
  }
  else
  {
    v6 = v3;
  }

  return v3;
}

void __65__AccessibilityNodeAccessibility__accessibilityAXAttributedLabel__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "accessibilityCustomAttribute:", CFSTR("AXLabelUIAccessibilityTokenBrailleOverride"));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (id)accessibilityMathEquation
{
  id v3;
  id v4;
  void *v5;
  objc_super v7;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(uint64_t);
  void *v11;
  AccessibilityNodeAccessibility *v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;

  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy_;
  v18 = __Block_byref_object_dispose_;
  v19 = 0;
  v8 = MEMORY[0x24BDAC760];
  v9 = 3221225472;
  v10 = __59__AccessibilityNodeAccessibility_accessibilityMathEquation__block_invoke;
  v11 = &unk_25039A430;
  v12 = self;
  v13 = &v14;
  AXPerformSafeBlock();
  v3 = (id)v15[5];
  _Block_object_dispose(&v14, 8);

  if (v3)
  {
    v4 = v3;
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)AccessibilityNodeAccessibility;
    -[AccessibilityNodeAccessibility accessibilityMathEquation](&v7, sel_accessibilityMathEquation);
    v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  v5 = v4;

  return v5;
}

void __59__AccessibilityNodeAccessibility_accessibilityMathEquation__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "accessibilityCustomAttribute:", CFSTR("AXMathEquation"));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (BOOL)_accessibilityShouldSpeakMathEquationTrait
{
  id v3;
  unsigned __int8 v4;
  BOOL v5;
  objc_super v7;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(uint64_t);
  void *v11;
  AccessibilityNodeAccessibility *v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;

  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy_;
  v18 = __Block_byref_object_dispose_;
  v19 = 0;
  v8 = MEMORY[0x24BDAC760];
  v9 = 3221225472;
  v10 = __76__AccessibilityNodeAccessibility__accessibilityShouldSpeakMathEquationTrait__block_invoke;
  v11 = &unk_25039A430;
  v12 = self;
  v13 = &v14;
  AXPerformSafeBlock();
  v3 = (id)v15[5];
  _Block_object_dispose(&v14, 8);

  if (v3)
  {
    v4 = objc_msgSend(v3, "BOOLValue");
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)AccessibilityNodeAccessibility;
    v4 = -[AccessibilityNodeAccessibility _accessibilityShouldSpeakMathEquationTrait](&v7, sel__accessibilityShouldSpeakMathEquationTrait);
  }
  v5 = v4;

  return v5;
}

void __76__AccessibilityNodeAccessibility__accessibilityShouldSpeakMathEquationTrait__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "accessibilityCustomAttribute:", CFSTR("AXShouldSpeakMathEquationTrait"));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (BOOL)_accessibilityShouldExpandMathEquation
{
  id v3;
  unsigned __int8 v4;
  BOOL v5;
  objc_super v7;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(uint64_t);
  void *v11;
  AccessibilityNodeAccessibility *v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;

  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy_;
  v18 = __Block_byref_object_dispose_;
  v19 = 0;
  v8 = MEMORY[0x24BDAC760];
  v9 = 3221225472;
  v10 = __72__AccessibilityNodeAccessibility__accessibilityShouldExpandMathEquation__block_invoke;
  v11 = &unk_25039A430;
  v12 = self;
  v13 = &v14;
  AXPerformSafeBlock();
  v3 = (id)v15[5];
  _Block_object_dispose(&v14, 8);

  if (v3)
  {
    v4 = objc_msgSend(v3, "BOOLValue");
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)AccessibilityNodeAccessibility;
    v4 = -[AccessibilityNodeAccessibility _accessibilityShouldExpandMathEquation](&v7, sel__accessibilityShouldExpandMathEquation);
  }
  v5 = v4;

  return v5;
}

void __72__AccessibilityNodeAccessibility__accessibilityShouldExpandMathEquation__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "accessibilityCustomAttribute:", CFSTR("AXShouldExpandMathEquation"));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (id)_accessibilitySoftwareMimicKeyboard
{
  id v3;
  AccessibilityNodeAccessibility *v4;
  AccessibilityNodeAccessibility *v5;
  objc_super v7;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(uint64_t);
  void *v11;
  AccessibilityNodeAccessibility *v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;

  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy_;
  v18 = __Block_byref_object_dispose_;
  v19 = 0;
  v8 = MEMORY[0x24BDAC760];
  v9 = 3221225472;
  v10 = __69__AccessibilityNodeAccessibility__accessibilitySoftwareMimicKeyboard__block_invoke;
  v11 = &unk_25039A430;
  v12 = self;
  v13 = &v14;
  AXPerformSafeBlock();
  v3 = (id)v15[5];
  _Block_object_dispose(&v14, 8);

  if (v3 && objc_msgSend(v3, "BOOLValue"))
  {
    v4 = self;
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)AccessibilityNodeAccessibility;
    -[AccessibilityNodeAccessibility _accessibilitySoftwareMimicKeyboard](&v7, sel__accessibilitySoftwareMimicKeyboard);
    v4 = (AccessibilityNodeAccessibility *)objc_claimAutoreleasedReturnValue();
  }
  v5 = v4;

  return v5;
}

void __69__AccessibilityNodeAccessibility__accessibilitySoftwareMimicKeyboard__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "accessibilityCustomAttribute:", CFSTR("AXIsSoftwareMimicKeyboardAttribute"));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (BOOL)_accessibilityIsSoftwareKeyboardMimic
{
  id v3;
  unsigned __int8 v4;
  BOOL v5;
  objc_super v7;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(uint64_t);
  void *v11;
  AccessibilityNodeAccessibility *v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;

  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy_;
  v18 = __Block_byref_object_dispose_;
  v19 = 0;
  v8 = MEMORY[0x24BDAC760];
  v9 = 3221225472;
  v10 = __71__AccessibilityNodeAccessibility__accessibilityIsSoftwareKeyboardMimic__block_invoke;
  v11 = &unk_25039A430;
  v12 = self;
  v13 = &v14;
  AXPerformSafeBlock();
  v3 = (id)v15[5];
  _Block_object_dispose(&v14, 8);

  if (v3)
  {
    v4 = objc_msgSend(v3, "BOOLValue");
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)AccessibilityNodeAccessibility;
    v4 = -[AccessibilityNodeAccessibility _accessibilityIsSoftwareKeyboardMimic](&v7, sel__accessibilityIsSoftwareKeyboardMimic);
  }
  v5 = v4;

  return v5;
}

void __71__AccessibilityNodeAccessibility__accessibilityIsSoftwareKeyboardMimic__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "accessibilityCustomAttribute:", CFSTR("AXIsSoftwareMimicKeyboardAttribute"));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

+ (BOOL)_isSerializableAccessibilityElement
{
  return 1;
}

- (BOOL)accessibilityShouldEnumerateContainerElementsArrayDirectly
{
  return 1;
}

- (int64_t)accessibilityElementCount
{
  void *v2;
  int64_t v3;

  -[AccessibilityNodeAccessibility safeArrayForKey:](self, "safeArrayForKey:", CFSTR("_accessibilityNodeChildrenUnsorted"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count");

  return v3;
}

- (BOOL)_accessibilityHasOrderedChildren
{
  return -[AccessibilityNodeAccessibility isAccessibilityElement](self, "isAccessibilityElement") ^ 1;
}

- (id)_accessibilityMediaAnalysisElement
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  AccessibilityNodeAccessibility *v8;
  AccessibilityNodeAccessibility *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  if ((-[AccessibilityNodeAccessibility _accessibilityCanBeConsideredMediaAnalysisElement](self, "_accessibilityCanBeConsideredMediaAnalysisElement") & 1) == 0)
  {
    v13 = 0u;
    v14 = 0u;
    v11 = 0u;
    v12 = 0u;
    -[AccessibilityNodeAccessibility safeSwiftArrayForKey:](self, "safeSwiftArrayForKey:", CFSTR("children"), 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    if (v4)
    {
      v5 = v4;
      v6 = *(_QWORD *)v12;
      while (2)
      {
        v7 = 0;
        do
        {
          if (*(_QWORD *)v12 != v6)
            objc_enumerationMutation(v3);
          v8 = *(AccessibilityNodeAccessibility **)(*((_QWORD *)&v11 + 1) + 8 * v7);
          if (v8 != self
            && (objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v7), "_accessibilityCanBeConsideredMediaAnalysisElement") & 1) != 0)
          {
            v10 = v8;

            return v10;
          }
          ++v7;
        }
        while (v5 != v7);
        v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
        if (v5)
          continue;
        break;
      }
    }

  }
  return self;
}

- (id)_accessibilityWindow
{
  void *v3;
  void *v4;
  void *v5;

  objc_opt_class();
  -[AccessibilityNodeAccessibility safeSwiftValueForKey:](self, "safeSwiftValueForKey:", CFSTR("viewRendererHost"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "window");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (CGRect)accessibilityFrame
{
  void *v3;
  void *v4;
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
  double v15;
  double v16;
  objc_super v17;
  CGRect result;

  -[AccessibilityNodeAccessibility _accessibilityVisualExpansionProxy](self, "_accessibilityVisualExpansionProxy");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "accessibilityFrame");
  }
  else
  {
    v17.receiver = self;
    v17.super_class = (Class)AccessibilityNodeAccessibility;
    -[AccessibilityNodeAccessibility accessibilityFrame](&v17, sel_accessibilityFrame);
  }
  v9 = v5;
  v10 = v6;
  v11 = v7;
  v12 = v8;

  v13 = v9;
  v14 = v10;
  v15 = v11;
  v16 = v12;
  result.size.height = v16;
  result.size.width = v15;
  result.origin.y = v14;
  result.origin.x = v13;
  return result;
}

- (id)accessibilityPath
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  objc_super v8;

  -[AccessibilityNodeAccessibility _accessibilityVisualExpansionProxy](self, "_accessibilityVisualExpansionProxy");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "accessibilityPath");
    v5 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)AccessibilityNodeAccessibility;
    -[AccessibilityNodeAccessibility accessibilityPath](&v8, sel_accessibilityPath);
    v5 = objc_claimAutoreleasedReturnValue();
  }
  v6 = (void *)v5;

  return v6;
}

- (BOOL)_accessibilityIsMacVisualAppearance
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  AccessibilityNodeAccessibility *v9;
  void *v10;
  char v11;
  BOOL v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v3 = -[AccessibilityNodeAccessibility accessibilityTraits](self, "accessibilityTraits");
  if ((*MEMORY[0x24BEBB1A8] & v3) == 0)
    return 0;
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  -[AccessibilityNodeAccessibility safeSwiftArrayForKey:](self, "safeSwiftArrayForKey:", CFSTR("children"), 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v15;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v15 != v7)
          objc_enumerationMutation(v4);
        v9 = *(AccessibilityNodeAccessibility **)(*((_QWORD *)&v14 + 1) + 8 * i);
        if (v9 != self)
        {
          -[AccessibilityNodeAccessibility safeValueForKey:](v9, "safeValueForKey:", CFSTR("_accessibilityNodeRepresentedElement"));
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v11 = objc_msgSend(v10, "_accessibilityIsMacVisualAppearance");

          if ((v11 & 1) != 0)
          {
            v12 = 1;
            goto LABEL_14;
          }
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      if (v6)
        continue;
      break;
    }
  }
  v12 = 0;
LABEL_14:

  return v12;
}

- (void)dealloc
{
  objc_super v3;

  -[AccessibilityNodeAccessibility _accessibilityUnregister](self, "_accessibilityUnregister");
  v3.receiver = self;
  v3.super_class = (Class)AccessibilityNodeAccessibility;
  -[AccessibilityNodeAccessibility dealloc](&v3, sel_dealloc);
}

- (BOOL)_accessibilityFKAShouldIncludeViewsAsElements
{
  return 1;
}

- (BOOL)isTransparentFocusItem
{
  return 1;
}

- (BOOL)_axAreChildrenFocused
{
  return __UIAccessibilityGetAssociatedBool();
}

- (void)_axSetAreChildrenFocused:(BOOL)a3
{
  __UIAccessibilitySetAssociatedBool();
}

- (NSArray)preferredFocusEnvironments
{
  return (NSArray *)MEMORY[0x24BDBD1A8];
}

- (UIFocusEnvironment)parentFocusEnvironment
{
  return (UIFocusEnvironment *)-[AccessibilityNodeAccessibility _accessibilityFindAncestor:startWithSelf:](self, "_accessibilityFindAncestor:startWithSelf:", &__block_literal_global_1, 0);
}

uint64_t __76__AccessibilityNodeAccessibility_UIFocusConformance__parentFocusEnvironment__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "conformsToProtocol:", &unk_255FEF050);
}

- (NSString)focusGroupIdentifier
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)AccessibilityNodeAccessibility;
  -[AccessibilityNodeAccessibility focusGroupIdentifier](&v9, sel_focusGroupIdentifier);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3
    || (-[AccessibilityNodeAccessibility _accessibilityParentView](self, "_accessibilityParentView"),
        v4 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v4, "safeValueForKey:", CFSTR("_containingScrollView")),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v5,
        v4,
        v5))
  {
    v6 = v3;
  }
  else
  {
    -[AccessibilityNodeAccessibility _accessibilityDefaultFocusGroupIdentifier](self, "_accessibilityDefaultFocusGroupIdentifier");
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  v7 = v6;

  return (NSString *)v7;
}

- (void)setNeedsFocusUpdate
{
  id v3;

  objc_msgSend(MEMORY[0x24BDF6A68], "focusSystemForEnvironment:", self);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "requestFocusUpdateToEnvironment:", self);
  -[AccessibilityNodeAccessibility _updateFocusLayerFrame](self, "_updateFocusLayerFrame");

}

- (void)updateFocusIfNeeded
{
  id v3;

  objc_msgSend(MEMORY[0x24BDF6A68], "focusSystemForEnvironment:", self);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "updateFocusIfNeeded");
  -[AccessibilityNodeAccessibility _updateFocusLayerFrame](self, "_updateFocusLayerFrame");

}

- (BOOL)shouldUpdateFocusInContext:(id)a3
{
  return 1;
}

- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4
{
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;
  AccessibilityNodeAccessibility *v10;

  v6 = a3;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __103__AccessibilityNodeAccessibility_UIFocusConformance__didUpdateFocusInContext_withAnimationCoordinator___block_invoke;
  v8[3] = &unk_25039A478;
  v9 = v6;
  v10 = self;
  v7 = v6;
  objc_msgSend(a4, "addCoordinatedAnimations:completion:", v8, 0);

}

uint64_t __103__AccessibilityNodeAccessibility_UIFocusConformance__didUpdateFocusInContext_withAnimationCoordinator___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  int v5;

  objc_msgSend(*(id *)(a1 + 32), "nextFocusedItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2 == *(void **)(a1 + 40))
  {
    objc_msgSend(v2, "_accessibilityParentView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "_accessibilityIsFKARunningForFocusItem");

    if (v5)
      return objc_msgSend(MEMORY[0x24BDF6A60], "moveRingToFocusItem:", *(_QWORD *)(a1 + 40));
  }
  else
  {

  }
  return objc_msgSend(MEMORY[0x24BDF6A60], "removeRingFromFocusItem:", *(_QWORD *)(a1 + 40));
}

- (void)_destroyFocusLayer
{
  objc_msgSend(MEMORY[0x24BDF6A60], "removeRingFromFocusItem:", self);
}

- (void)_updateFocusLayerFrame
{
  objc_msgSend(MEMORY[0x24BDF6A60], "updateRingForFocusItem:", self);
}

- (BOOL)canBecomeFocused
{
  int v3;

  v3 = -[AccessibilityNodeAccessibility isAccessibilityElement](self, "isAccessibilityElement");
  if (v3)
    LOBYTE(v3) = -[AccessibilityNodeAccessibility accessibilityRespondsToUserInteraction](self, "accessibilityRespondsToUserInteraction");
  return v3;
}

- (id)_preferredFocusRegionCoordinateSpace
{
  void *v2;
  void *v3;
  void *v4;

  -[AccessibilityNodeAccessibility _accessibilityParentView](self, "_accessibilityParentView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_screen");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "coordinateSpace");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)focusItemsInRect:(CGRect)a3
{
  void *v4;
  void *v5;
  void *v6;
  unint64_t v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v12[5];

  -[AccessibilityNodeAccessibility accessibilityElements](self, "accessibilityElements", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __71__AccessibilityNodeAccessibility_UIFocusConformance__focusItemsInRect___block_invoke;
    v12[3] = &unk_25039A4A0;
    v12[4] = self;
    objc_msgSend(MEMORY[0x24BDD1758], "predicateWithBlock:", v12);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "filteredArrayUsingPredicate:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else if (-[AccessibilityNodeAccessibility accessibilityElementCount](self, "accessibilityElementCount") == 0x7FFFFFFFFFFFFFFFLL)
  {
    v6 = 0;
  }
  else
  {
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", -[AccessibilityNodeAccessibility accessibilityElementCount](self, "accessibilityElementCount"));
    if (-[AccessibilityNodeAccessibility accessibilityElementCount](self, "accessibilityElementCount"))
    {
      v7 = 0;
      do
      {
        -[AccessibilityNodeAccessibility accessibilityElementAtIndex:](self, "accessibilityElementAtIndex:", v7);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v8, "conformsToProtocol:", &unk_255FEF388))
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0
            || -[AccessibilityNodeAccessibility _accessibilityFKAShouldIncludeViewsAsElements](self, "_accessibilityFKAShouldIncludeViewsAsElements"))
          {
            objc_msgSend(v6, "axSafelyAddObject:", v8);
          }
        }

        ++v7;
      }
      while (v7 < -[AccessibilityNodeAccessibility accessibilityElementCount](self, "accessibilityElementCount"));
    }
  }
  if (v6)
    v9 = v6;
  else
    v9 = (void *)MEMORY[0x24BDBD1A8];
  v10 = v9;

  return v10;
}

uint64_t __71__AccessibilityNodeAccessibility_UIFocusConformance__focusItemsInRect___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;

  v3 = a2;
  if (objc_msgSend(v3, "conformsToProtocol:", &unk_255FEF388))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v4 = objc_msgSend(*(id *)(a1 + 32), "_accessibilityFKAShouldIncludeViewsAsElements");
    else
      v4 = 1;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (BOOL)_prefersFocusContainment
{
  if (-[AccessibilityNodeAccessibility conformsToProtocol:](self, "conformsToProtocol:", &unk_255FF09B8)
    || (-[AccessibilityNodeAccessibility _accessibilityIsTouchContainer](self, "_accessibilityIsTouchContainer") & 1) != 0)
  {
    return 1;
  }
  else
  {
    return -[AccessibilityNodeAccessibility shouldGroupAccessibilityChildren](self, "shouldGroupAccessibilityChildren");
  }
}

- (BOOL)conformsToProtocol:(id)a3
{
  objc_super v7;

  if (&unk_255FEF388 == a3 || &unk_255FEF050 == a3 || &unk_255FEF4E8 == a3 || &unk_255FEF9D8 == a3)
    return 1;
  v7.receiver = self;
  v7.super_class = (Class)AccessibilityNodeAccessibility;
  return -[AccessibilityNodeAccessibility conformsToProtocol:](&v7, sel_conformsToProtocol_);
}

- (CGRect)frame
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  CGRect result;

  -[AccessibilityNodeAccessibility accessibilityFrame](self, "accessibilityFrame");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[AccessibilityNodeAccessibility coordinateSpace](self, "coordinateSpace");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[AccessibilityNodeAccessibility _accessibilityWindow](self, "_accessibilityWindow");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "coordinateSpace");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    objc_msgSend(v13, "convertRect:fromCoordinateSpace:", 0, v4, v6, v8, v10);
    objc_msgSend(v11, "convertRect:fromCoordinateSpace:", v13);
    v4 = v14;
    v6 = v15;
    v8 = v16;
    v10 = v17;
  }

  v18 = v4;
  v19 = v6;
  v20 = v8;
  v21 = v10;
  result.size.height = v21;
  result.size.width = v20;
  result.origin.y = v19;
  result.origin.x = v18;
  return result;
}

@end
