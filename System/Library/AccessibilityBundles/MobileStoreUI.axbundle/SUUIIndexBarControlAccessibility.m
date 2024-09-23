@implementation SUUIIndexBarControlAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SUUIIndexBarControl");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SUUIIndexBarControl"), CFSTR("_visibleBounds"), "{CGRect={CGPoint=dd}{CGSize=dd}}", 0);
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("SUUIIndexBarControl"), CFSTR("_totalEntryCount"), "NSInteger");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("SUUIAttributedStringIndexBarEntry"), CFSTR("_synthesizedAttributedString"), "NSAttributedString");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("SUUIIndexBarControl"), CFSTR("_lastSelectedIndexPath"), "NSIndexPath");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("SUUIIndexBarControl"), CFSTR("_delegate"), "<SUUIIndexBarControlDelegate>");
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SUUIIndexBarControl"), CFSTR("_entryAtIndexPath:"), "@", 0);
  objc_msgSend(v3, "validateProtocol:hasOptionalInstanceMethod:", CFSTR("SUUIIndexBarControlDelegate"), CFSTR("indexBarControl:didSelectEntryAtIndexPath:"));

}

- (int64_t)_accessibilityTableIndexAdjustment
{
  void *v2;
  void *v3;
  char v4;
  void *v5;
  void *v6;
  int64_t v7;

  -[SUUIIndexBarControlAccessibility _accessibilityViewAncestorIsKindOf:](self, "_accessibilityViewAncestorIsKindOf:", objc_opt_class());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0)
  {
    objc_msgSend(v2, "safeValueForKey:", CFSTR("delegate"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "safeValueForKey:", CFSTR("_accessibilityTableViewIndexAdjustment"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "integerValue");

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  return accessibilityLocalizedString(CFSTR("index.bar.control"));
}

- (void)accessibilityDecrement
{
  -[SUUIIndexBarControlAccessibility _accessibilityBumpValue:](self, "_accessibilityBumpValue:", 1);
}

- (void)accessibilityIncrement
{
  -[SUUIIndexBarControlAccessibility _accessibilityBumpValue:](self, "_accessibilityBumpValue:", 0);
}

- (void)_accessibilityBumpValue:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  BOOL v10;

  v3 = a3;
  objc_opt_class();
  -[SUUIIndexBarControlAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_lastSelectedIndexPath"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v6, "row");
  if (v3)
    v8 = v7 + 1;
  else
    v8 = v7 - 1;
  objc_msgSend(MEMORY[0x24BDD15D8], "indexPathForRow:inSection:", v8, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[SUUIIndexBarControlAccessibility _accessibilityMoveToIndexPath:](self, "_accessibilityMoveToIndexPath:", v9);

  if (!v10)
    UIAccessibilityPostNotification(*MEMORY[0x24BEBB010], 0);

}

- (BOOL)_accessibilityMoveToIndexPath:(id)a3
{
  id v5;
  void *v6;
  uint64_t v7;
  BOOL v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  __CFString *v16;
  void *v17;
  id *v18;
  void *v19;
  char v20;
  void *v21;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t (*v26)(uint64_t, uint64_t);
  void (*v27)(uint64_t);
  id v28;

  v5 = a3;
  -[SUUIIndexBarControlAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_totalEntryCount"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "integerValue");

  if (objc_msgSend(v5, "row") < 0 || objc_msgSend(v5, "row") > v7)
  {
    v8 = 0;
    goto LABEL_20;
  }
  v23 = 0;
  v24 = &v23;
  v25 = 0x3032000000;
  v26 = __Block_byref_object_copy__3;
  v27 = __Block_byref_object_dispose__3;
  v28 = 0;
  v9 = v5;
  AXPerformSafeBlock();
  v10 = (id)v24[5];

  _Block_object_dispose(&v23, 8);
  objc_msgSend(MEMORY[0x24BDD17C8], "string");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  NSClassFromString(CFSTR("SUUIAttributedStringIndexBarEntry"));
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    LOBYTE(v23) = 0;
    objc_opt_class();
    objc_msgSend(v10, "safeValueForKey:", CFSTR("_synthesizedAttributedString"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    __UIAccessibilityCastAsClass();
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if ((_BYTE)v23)
      abort();
    objc_msgSend(v13, "string");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "lowercaseString");
    v15 = objc_claimAutoreleasedReturnValue();

    v11 = v13;
    goto LABEL_14;
  }
  NSClassFromString(CFSTR("SUUIImageIndexBarEntry"));
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v16 = CFSTR("recently.added");
LABEL_13:
    accessibilityLocalizedString(v16);
    v15 = objc_claimAutoreleasedReturnValue();
LABEL_14:

    v11 = (void *)v15;
    goto LABEL_15;
  }
  NSClassFromString(CFSTR("SUUIPlaceholderIndexBarEntry"));
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v16 = CFSTR("placeholder");
    goto LABEL_13;
  }
  NSClassFromString(CFSTR("SUUISystemCombinedIndexBarEntry"));
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v16 = CFSTR("combined");
    goto LABEL_13;
  }
LABEL_15:
  objc_msgSend(MEMORY[0x24BDFEA60], "axAttributedStringWithString:", v11);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = (id *)-[SUUIIndexBarControlAccessibility safeIvarForKey:](self, "safeIvarForKey:", CFSTR("_lastSelectedIndexPath"));
  if (v18)
    objc_storeStrong(v18, a3);
  -[SUUIIndexBarControlAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_delegate"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_opt_respondsToSelector();

  if ((v20 & 1) != 0)
  {
    -[SUUIIndexBarControlAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_delegate"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "indexBarControl:didSelectEntryAtIndexPath:", self, v9);

  }
  objc_msgSend(v17, "setAttribute:forKey:", MEMORY[0x24BDBD1C8], *MEMORY[0x24BDFEAC0]);
  UIAccessibilityPostNotification(*MEMORY[0x24BEBB010], v17);

  v8 = 1;
LABEL_20:

  return v8;
}

void __66__SUUIIndexBarControlAccessibility__accessibilityMoveToIndexPath___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "_entryAtIndexPath:", *(_QWORD *)(a1 + 40));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (void)_sendSelectionForTouch:(id)a3 withEvent:(id)a4
{
  id v6;
  id v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  double v18;
  CGFloat v19;
  void *v20;
  uint64_t v21;
  double v22;
  CGFloat Height;
  uint64_t v24;
  int64_t v25;
  uint64_t v26;
  void *v27;
  id v28;
  char v29;
  void *v30;
  _QWORD v31[7];
  _QWORD v32[4];
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  uint64_t (*v36)(uint64_t, uint64_t);
  void (*v37)(uint64_t);
  id v38;
  objc_super v39;
  CGRect v40;
  CGRect v41;
  CGRect v42;
  CGRect v43;

  v6 = a3;
  v7 = a4;
  v39.receiver = self;
  v39.super_class = (Class)SUUIIndexBarControlAccessibility;
  -[SUUIIndexBarControlAccessibility _sendSelectionForTouch:withEvent:](&v39, sel__sendSelectionForTouch_withEvent_, v6, v7);
  if (UIAccessibilityIsVoiceOverRunning())
  {
    -[SUUIIndexBarControlAccessibility _accessibilityValueForKey:](self, "_accessibilityValueForKey:", CFSTR("AXLastIndexPath"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "locationInView:", self);
    v10 = v9;
    -[SUUIIndexBarControlAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_visibleBounds"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "rectValue");
    v13 = v12;
    v15 = v14;
    v17 = v16;
    v19 = v18;

    -[SUUIIndexBarControlAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_totalEntryCount"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v20, "integerValue");

    v40.origin.x = v13;
    v40.origin.y = v15;
    v40.size.width = v17;
    v40.size.height = v19;
    if (v10 < CGRectGetMinY(v40))
      goto LABEL_11;
    v41.origin.x = v13;
    v41.origin.y = v15;
    v41.size.width = v17;
    v41.size.height = v19;
    if (v10 > CGRectGetMaxY(v41))
      goto LABEL_11;
    v42.origin.x = v13;
    v42.origin.y = v15;
    v42.size.width = v17;
    v42.size.height = v19;
    v22 = v10 - CGRectGetMinY(v42);
    v43.origin.x = v13;
    v43.origin.y = v15;
    v43.size.width = v17;
    v43.size.height = v19;
    Height = CGRectGetHeight(v43);
    v24 = v21 - 1;
    v25 = llround(v22 / Height * (double)(v21 - 1));
    if (v21 - 1 >= v25)
      v24 = v25;
    v26 = v24 & ~(v24 >> 63);
    v33 = 0;
    v34 = &v33;
    v35 = 0x3032000000;
    v36 = __Block_byref_object_copy__3;
    v37 = __Block_byref_object_dispose__3;
    v38 = 0;
    if (v26 >= v21)
      goto LABEL_9;
    v32[0] = 0;
    v32[1] = v32;
    v32[2] = 0x2020000000;
    v32[3] = 0;
    v31[0] = MEMORY[0x24BDAC760];
    v31[1] = 3221225472;
    v31[2] = __69__SUUIIndexBarControlAccessibility__sendSelectionForTouch_withEvent___block_invoke;
    v31[3] = &unk_2502A6D70;
    v31[5] = &v33;
    v31[6] = v26;
    v31[4] = v32;
    -[SUUIIndexBarControlAccessibility _enumerateEntryIndexPathsUsingBlock:](self, "_enumerateEntryIndexPathsUsingBlock:", v31);
    _Block_object_dispose(v32, 8);
    v27 = (void *)v34[5];
    if (v27)
    {
      v28 = v27;
      v29 = 0;
    }
    else
    {
LABEL_9:
      v28 = 0;
      v29 = 1;
    }
    _Block_object_dispose(&v33, 8);

    if ((v29 & 1) != 0)
    {
LABEL_11:
      v28 = 0;
    }
    else if ((objc_msgSend(v28, "isEqual:", v8) & 1) == 0)
    {
      -[SUUIIndexBarControlAccessibility _accessibilityMoveToIndexPath:](self, "_accessibilityMoveToIndexPath:", v28);
    }
    -[SUUIIndexBarControlAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_lastSelectedIndexPath"));
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUUIIndexBarControlAccessibility _accessibilitySetRetainedValue:forKey:](self, "_accessibilitySetRetainedValue:forKey:", v30, CFSTR("AXLastIndexPath"));

  }
}

void __69__SUUIIndexBarControlAccessibility__sendSelectionForTouch_withEvent___block_invoke(_QWORD *a1, void *a2, _BYTE *a3)
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  id v9;

  v6 = a2;
  v7 = *(_QWORD *)(a1[4] + 8);
  v8 = *(_QWORD *)(v7 + 24);
  if (v8 == a1[6])
  {
    v9 = v6;
    objc_storeStrong((id *)(*(_QWORD *)(a1[5] + 8) + 40), a2);
    v6 = v9;
    *a3 = 1;
    v7 = *(_QWORD *)(a1[4] + 8);
    v8 = *(_QWORD *)(v7 + 24);
  }
  *(_QWORD *)(v7 + 24) = v8 + 1;

}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x24BDF73A0] | *MEMORY[0x24BEBB190];
}

- (CGRect)accessibilityFrame
{
  double v3;
  double v4;
  double v5;
  double v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  objc_super v18;
  CGRect result;

  v18.receiver = self;
  v18.super_class = (Class)SUUIIndexBarControlAccessibility;
  -[SUUIIndexBarControlAccessibility accessibilityFrame](&v18, sel_accessibilityFrame);
  v4 = v3;
  v6 = v5;
  -[SUUIIndexBarControlAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_visibleBounds"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "rectValue");
  v9 = v8;
  v11 = v10;
  v13 = v12;

  v14 = v6 + v9;
  v15 = v4;
  v16 = v11;
  v17 = v13;
  result.size.height = v17;
  result.size.width = v16;
  result.origin.y = v14;
  result.origin.x = v15;
  return result;
}

- (CGPoint)accessibilityActivationPoint
{
  double v2;
  double v3;
  CGPoint result;

  -[SUUIIndexBarControlAccessibility accessibilityFrame](self, "accessibilityFrame");
  UIAccessibilityPointForPoint();
  result.y = v3;
  result.x = v2;
  return result;
}

- (id)accessibilityFlowToElements
{
  return (id)-[SUUIIndexBarControlAccessibility _accessibilityValueForKey:](self, "_accessibilityValueForKey:", CFSTR("kAXSUUIToElements"));
}

@end
