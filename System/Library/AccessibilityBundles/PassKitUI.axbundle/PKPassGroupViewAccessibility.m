@implementation PKPassGroupViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("PKPassGroupView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateProtocol:hasMethod:isInstanceMethod:isRequired:", CFSTR("PKPassGroupStackViewDatasource"), CFSTR("indexOfGroup:"), 1, 1);
  objc_msgSend(v3, "validateProtocol:hasMethod:isInstanceMethod:isRequired:", CFSTR("PKPassGroupStackViewDatasource"), CFSTR("numberOfGroups"), 1, 1);
  objc_msgSend(v3, "validateProtocol:hasMethod:isInstanceMethod:isRequired:", CFSTR("PKPassGroupStackViewDatasource"), CFSTR("indexOfSeparationGroup"), 1, 1);
  objc_msgSend(v3, "validateClass:", CFSTR("PKPassGroupStackView"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PKPassGroupStackView"), CFSTR("groupViewPanDidBegin:"), "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PKPassGroupStackView"), CFSTR("groupViewPanDidEnd:"), "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PKPassGroupStackView"), CFSTR("reloadData"), "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PKGroup"), CFSTR("passAtIndex:"), "@", "Q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PKPassGroupView"), CFSTR("pageControl"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PKPassGroupStackView"), CFSTR("_groupCellHeight"), "d", 0);
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("PKPassGroupStackView"), CFSTR("_passPileViews"), "NSMutableArray");
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("UIScrollView"), CFSTR("delegate"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PKPassGroupStackView"), CFSTR("datasource"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("PKPassGroupStackView"), CFSTR("_headerContainerView"), "PKPassthroughView");
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("PKPassGroupStackView"), CFSTR("UIScrollView"));

}

- (BOOL)_axIsCardFirstInPile
{
  void *v3;
  int v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  BOOL v9;

  -[PKPassGroupViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("presentationState"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "intValue");

  if (v4 != 2)
    return 0;
  objc_opt_class();
  -[PKPassGroupViewAccessibility _accessibilityAncestorIsKindOf:](self, "_accessibilityAncestorIsKindOf:", NSClassFromString(CFSTR("PKPassGroupStackView")));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "safeValueForKey:", CFSTR("_passPileViews"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_msgSend(v7, "indexOfObject:", self);
  v9 = v8 == objc_msgSend(v7, "count") - 1;

  return v9;
}

- (BOOL)_axIsOnlyCardInPile
{
  void *v3;
  void *v4;
  void *v5;
  BOOL v6;

  objc_opt_class();
  -[PKPassGroupViewAccessibility _accessibilityAncestorIsKindOf:](self, "_accessibilityAncestorIsKindOf:", NSClassFromString(CFSTR("PKPassGroupStackView")));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safeValueForKey:", CFSTR("_passPileViews"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v5, "count") == 1;
  return v6;
}

- (BOOL)isAccessibilityElement
{
  void *v4;
  int v5;

  if (-[PKPassGroupViewAccessibility _axIsOnlyCardInPile](self, "_axIsOnlyCardInPile"))
    return 0;
  -[PKPassGroupViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("presentationState"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "intValue");

  return v5 == 1 || -[PKPassGroupViewAccessibility _axIsCardFirstInPile](self, "_axIsCardFirstInPile");
}

- (BOOL)accessibilityElementsHidden
{
  void *v3;
  int v4;

  if (-[PKPassGroupViewAccessibility _axIsOnlyCardInPile](self, "_axIsOnlyCardInPile"))
    return 0;
  -[PKPassGroupViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("presentationState"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "intValue");

  if (v4 == 3)
    return 0;
  else
    return !-[PKPassGroupViewAccessibility isAccessibilityElement](self, "isAccessibilityElement");
}

- (BOOL)_accessibilityScrollToVisible
{
  void *v3;
  int v4;
  void *v5;
  void *v6;
  void *v7;
  BOOL v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  objc_super v22;
  char v23;

  -[PKPassGroupViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("presentationState"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "intValue");

  if (v4 == 1)
  {
    v23 = 0;
    objc_opt_class();
    -[PKPassGroupViewAccessibility _accessibilityAncestorIsKindOf:](self, "_accessibilityAncestorIsKindOf:", objc_opt_class());
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    __UIAccessibilityCastAsClass();
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      -[PKPassGroupViewAccessibility _accessibilityAncestorIsKindOf:](self, "_accessibilityAncestorIsKindOf:", NSClassFromString(CFSTR("PKPassGroupStackView")));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = v7 != 0;
      if (v7)
      {
        -[PKPassGroupViewAccessibility frame](self, "frame");
        v10 = v9;
        objc_msgSend(v6, "contentOffset");
        v12 = v11;
        v14 = v13;
        objc_msgSend(v7, "safeValueForKey:", CFSTR("_groupCellHeight"));
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "doubleValue");
        v17 = v16;

        v18 = fmax(v17, 120.0);
        if (v10 < v14 || v10 > v14 - v18)
        {
          v19 = v10 + v18 * -1.5;
          v20 = 0.0;
          if (v19 >= 0.0)
            v20 = v19;
          objc_msgSend(v6, "setContentOffset:animated:", 0, v12, v20);
          UIAccessibilityPostNotification(*MEMORY[0x24BDF72C8], 0);
        }
      }

    }
    else
    {
      v8 = 0;
    }

  }
  else
  {
    v22.receiver = self;
    v22.super_class = (Class)PKPassGroupViewAccessibility;
    return -[PKPassGroupViewAccessibility _accessibilityScrollToVisible](&v22, sel__accessibilityScrollToVisible);
  }
  return v8;
}

- (CGRect)_axSuperAccessibilityFrame
{
  double v2;
  double v3;
  double v4;
  double v5;
  objc_super v6;
  CGRect result;

  v6.receiver = self;
  v6.super_class = (Class)PKPassGroupViewAccessibility;
  -[PKPassGroupViewAccessibility accessibilityFrame](&v6, sel_accessibilityFrame);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (CGRect)accessibilityFrame
{
  double v3;
  CGFloat v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  unint64_t v16;
  void *v17;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double MinY;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  objc_super v28;
  CGRect v29;
  CGRect v30;
  CGRect v31;
  CGRect v32;
  CGRect result;

  v28.receiver = self;
  v28.super_class = (Class)PKPassGroupViewAccessibility;
  -[PKPassGroupViewAccessibility accessibilityFrame](&v28, sel_accessibilityFrame);
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[PKPassGroupViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("superview"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "safeValueForKey:", CFSTR("subviews"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "indexesOfObjectsPassingTest:", &__block_literal_global_4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "objectsAtIndexes:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "sortedArrayUsingComparator:", &__block_literal_global_233);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = objc_msgSend(v15, "indexOfObject:", self) + 1;
  if (objc_msgSend(v15, "count") > v16)
  {
    v29.origin.x = v4;
    v29.origin.y = v6;
    v29.size.width = v8;
    v29.size.height = v10;
    if (CGRectGetMaxY(v29) > 0.0)
    {
      objc_msgSend(v15, "objectAtIndex:", v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "accessibilityFrame");
      x = v30.origin.x;
      y = v30.origin.y;
      width = v30.size.width;
      height = v30.size.height;
      if (CGRectGetMaxY(v30) > 0.0)
      {
        v31.origin.x = x;
        v31.origin.y = y;
        v31.size.width = width;
        v31.size.height = height;
        MinY = CGRectGetMinY(v31);
        v32.origin.x = v4;
        v32.origin.y = v6;
        v32.size.width = v8;
        v32.size.height = v10;
        v23 = MinY - CGRectGetMinY(v32);
        if (v23 < v10)
          v10 = v23;
      }

    }
  }

  v24 = v4;
  v25 = v6;
  v26 = v8;
  v27 = v10;
  result.size.height = v27;
  result.size.width = v26;
  result.origin.y = v25;
  result.origin.x = v24;
  return result;
}

uint64_t __50__PKPassGroupViewAccessibility_accessibilityFrame__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  char isKindOfClass;

  v2 = a2;
  NSClassFromString(CFSTR("PKPassGroupView"));
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

uint64_t __50__PKPassGroupViewAccessibility_accessibilityFrame__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  double v6;
  double v7;
  double v8;
  double v9;
  CGFloat v10;
  CGFloat v11;
  CGFloat v12;
  CGFloat v13;
  double v14;
  double v15;
  double v16;
  double v17;
  CGFloat v18;
  CGFloat v19;
  CGFloat v20;
  CGFloat v21;
  CGFloat v22;
  CGFloat v23;
  double MinY;
  uint64_t v25;
  double v26;
  CGFloat rect;
  CGRect v29;
  CGRect v30;
  CGRect v31;
  CGRect v32;

  v4 = a3;
  v5 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v5, "_axSuperAccessibilityFrame");
  else
    objc_msgSend(v5, "accessibilityFrame");
  v10 = v6;
  v11 = v7;
  v12 = v8;
  v13 = v9;

  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v4, "_axSuperAccessibilityFrame");
  else
    objc_msgSend(v4, "accessibilityFrame");
  rect = v14;
  v18 = v15;
  v19 = v16;
  v20 = v17;
  v29.origin.x = v10;
  v29.origin.y = v11;
  v29.size.width = v12;
  v29.size.height = v13;
  v21 = v12;
  v22 = v11;
  v23 = v10;
  MinY = CGRectGetMinY(v29);
  v30.origin.x = rect;
  v30.origin.y = v18;
  v30.size.width = v19;
  v30.size.height = v20;
  if (MinY >= CGRectGetMinY(v30))
  {
    v31.origin.x = v23;
    v31.origin.y = v22;
    v31.size.width = v21;
    v31.size.height = v13;
    v26 = CGRectGetMinY(v31);
    v32.origin.x = rect;
    v32.origin.y = v18;
    v32.size.width = v19;
    v32.size.height = v20;
    v25 = v26 != CGRectGetMinY(v32);
  }
  else
  {
    v25 = -1;
  }

  return v25;
}

- (unint64_t)accessibilityTraits
{
  objc_super v4;

  if (-[PKPassGroupViewAccessibility _axIsCardFirstInPile](self, "_axIsCardFirstInPile")
    && !-[PKPassGroupViewAccessibility _axIsOnlyCardInPile](self, "_axIsOnlyCardInPile"))
  {
    return *MEMORY[0x24BDF73B0];
  }
  v4.receiver = self;
  v4.super_class = (Class)PKPassGroupViewAccessibility;
  return -[PKPassGroupViewAccessibility accessibilityTraits](&v4, sel_accessibilityTraits);
}

- (id)accessibilityHint
{
  __CFString *v3;

  if (-[PKPassGroupViewAccessibility _axIsCardFirstInPile](self, "_axIsCardFirstInPile")
    && !-[PKPassGroupViewAccessibility _axIsOnlyCardInPile](self, "_axIsOnlyCardInPile"))
  {
    v3 = CFSTR("other.cards.pile.hint");
  }
  else
  {
    v3 = CFSTR("stacked.card.hint");
  }
  accessibilityLocalizedString(v3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)accessibilityLabel
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v11;
  id v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;

  -[PKPassGroupViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("group"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safeValueForKey:", CFSTR("passCount"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "integerValue");

  if (v5)
  {
    v13 = 0;
    v14 = &v13;
    v15 = 0x3032000000;
    v16 = __Block_byref_object_copy__0;
    v17 = __Block_byref_object_dispose__0;
    v18 = 0;
    v11 = MEMORY[0x24BDAC760];
    v12 = v3;
    AXPerformSafeBlock();
    if (-[PKPassGroupViewAccessibility _axIsCardFirstInPile](self, "_axIsCardFirstInPile", v11, 3221225472, __50__PKPassGroupViewAccessibility_accessibilityLabel__block_invoke, &unk_2502E3A98)&& !-[PKPassGroupViewAccessibility _axIsOnlyCardInPile](self, "_axIsOnlyCardInPile"))
    {
      accessibilityLocalizedString(CFSTR("other.cards.piled.together"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      -[PKPassGroupViewAccessibility _accessibilityFindSubviewDescendant:](self, "_accessibilityFindSubviewDescendant:", &__block_literal_global_250);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "accessibilityLabel");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "length");

      if (v8)
        objc_msgSend(v6, "accessibilityLabel");
      else
        objc_msgSend((id)v14[5], "safeValueForKey:", CFSTR("organizationName"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();

    }
    _Block_object_dispose(&v13, 8);

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

void __50__PKPassGroupViewAccessibility_accessibilityLabel__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "passAtIndex:", 0);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

uint64_t __50__PKPassGroupViewAccessibility_accessibilityLabel__block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  char isKindOfClass;

  v2 = a2;
  NSClassFromString(CFSTR("PKPassPaymentCardFrontFaceView"));
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (id)accessibilityCustomActions
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  id v7;
  unint64_t v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v21;
  id v22;
  id v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t v27;

  -[PKPassGroupViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("group"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPassGroupViewAccessibility _accessibilityAncestorIsKindOf:](self, "_accessibilityAncestorIsKindOf:", NSClassFromString(CFSTR("PKPassGroupStackView")));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "safeValueForKey:", CFSTR("datasource"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = 0;
  v25 = &v24;
  v26 = 0x2020000000;
  v6 = MEMORY[0x24BDAC760];
  v27 = 0;
  v23 = v5;
  v7 = v3;
  AXPerformSafeBlock();
  v8 = v25[3];

  _Block_object_dispose(&v24, 8);
  v24 = 0;
  v25 = &v24;
  v26 = 0x2020000000;
  v27 = 0;
  v22 = v23;
  AXPerformSafeBlock();
  v9 = v25[3];

  _Block_object_dispose(&v24, 8);
  v24 = 0;
  v25 = &v24;
  v26 = 0x2020000000;
  v27 = 0;
  v21 = v6;
  v10 = v22;
  AXPerformSafeBlock();
  v11 = v25[3];

  _Block_object_dispose(&v24, 8);
  v12 = objc_alloc(MEMORY[0x24BDF6788]);
  accessibilityLocalizedString(CFSTR("move.card.up.action"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v12, "initWithName:target:selector:", v13, self, sel__axMoveCardUp_, v21, 3221225472, __58__PKPassGroupViewAccessibility_accessibilityCustomActions__block_invoke_3, &unk_2502E3A98);

  v15 = objc_alloc(MEMORY[0x24BDF6788]);
  accessibilityLocalizedString(CFSTR("move.card.down.action"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (void *)objc_msgSend(v15, "initWithName:target:selector:", v16, self, sel__axMoveCardDown_);

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v18;
  if (v8 && v8 != v11 + 1)
    objc_msgSend(v18, "addObject:", v14);
  if (v8 < v9 - 1 && v8 != v11)
    objc_msgSend(v19, "addObject:", v17);

  return v19;
}

uint64_t __58__PKPassGroupViewAccessibility_accessibilityCustomActions__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "indexOfGroup:", *(_QWORD *)(a1 + 40));
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = result;
  return result;
}

uint64_t __58__PKPassGroupViewAccessibility_accessibilityCustomActions__block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "numberOfGroups");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

uint64_t __58__PKPassGroupViewAccessibility_accessibilityCustomActions__block_invoke_3(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "indexOfSeparationGroup");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (BOOL)_axMoveCard:(id)a3 up:(BOOL)a4
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  id v10;
  id v11;
  _QWORD v12[4];

  v5 = a3;
  -[PKPassGroupViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("group"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPassGroupViewAccessibility _accessibilityAncestorIsKindOf:](self, "_accessibilityAncestorIsKindOf:", NSClassFromString(CFSTR("PKPassGroupStackView")));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "safeValueForKey:", CFSTR("datasource"));
  v12[0] = 0;
  v12[1] = v12;
  v12[2] = 0x2020000000;
  v12[3] = 0;
  v10 = (id)objc_claimAutoreleasedReturnValue();
  v11 = v6;
  AXPerformSafeBlock();

  _Block_object_dispose(v12, 8);
  v8 = v7;
  AXPerformSafeBlock();

  return 1;
}

uint64_t __47__PKPassGroupViewAccessibility__axMoveCard_up___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "indexOfGroup:", *(_QWORD *)(a1 + 40));
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = result;
  return result;
}

uint64_t __47__PKPassGroupViewAccessibility__axMoveCard_up___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;

  objc_msgSend(*(id *)(a1 + 32), "groupViewPanDidBegin:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "safeValueForKey:", CFSTR("delegate"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  v4 = *(_QWORD *)(a1 + 48);
  if (*(_BYTE *)(a1 + 56))
    v5 = v4 - 1;
  else
    v5 = v4 + 1;
  objc_msgSend(v2, "groupStackView:groupDidMoveFromIndex:toIndex:", *(_QWORD *)(a1 + 32), v4, v5);

  objc_msgSend(*(id *)(a1 + 32), "reloadData");
  return objc_msgSend(*(id *)(a1 + 32), "groupViewPanDidEnd:", *(_QWORD *)(a1 + 40));
}

- (BOOL)_axMoveCardUp:(id)a3
{
  return -[PKPassGroupViewAccessibility _axMoveCard:up:](self, "_axMoveCard:up:", a3, 1);
}

- (BOOL)_axMoveCardDown:(id)a3
{
  return -[PKPassGroupViewAccessibility _axMoveCard:up:](self, "_axMoveCard:up:", a3, 0);
}

- (id)accessibilityValue
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v11;

  -[PKPassGroupViewAccessibility _accessibilityFindSubviewDescendant:](self, "_accessibilityFindSubviewDescendant:", &__block_literal_global_265);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "accessibilityLabel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "length");

  if (v5)
  {
    objc_msgSend(v3, "accessibilityLabel");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "accessibilityValue");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    __AXStringForVariables();
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[PKPassGroupViewAccessibility _accessibilityFindSubviewDescendant:](self, "_accessibilityFindSubviewDescendant:", &__block_literal_global_270);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "accessibilityValue");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "length");

    if (v9)
    {
      objc_msgSend(v6, "accessibilityValue");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v7 = 0;
    }
  }

  return v7;
}

uint64_t __50__PKPassGroupViewAccessibility_accessibilityValue__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  char isKindOfClass;

  v2 = a2;
  NSClassFromString(CFSTR("PKPassFieldView"));
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

uint64_t __50__PKPassGroupViewAccessibility_accessibilityValue__block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  char isKindOfClass;

  v2 = a2;
  NSClassFromString(CFSTR("PKPassPaymentCardFrontFaceView"));
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (BOOL)shouldGroupAccessibilityChildren
{
  return 1;
}

- (BOOL)_accessibilityDismissModalGroup
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  int AppBooleanValue;
  id v9;
  id v11;

  -[PKPassGroupViewAccessibility _accessibilityAncestorIsKindOf:](self, "_accessibilityAncestorIsKindOf:", NSClassFromString(CFSTR("PKPassGroupStackView")));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPassGroupViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("group"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "safeValueForKey:", CFSTR("groupID"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "safeValueForKey:", CFSTR("_animatorsByGroupID"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    AppBooleanValue = CFPreferencesGetAppBooleanValue(CFSTR("allowCardSwiping"), CFSTR("com.apple.wallet"), 0);
    v9 = v3;
    AXPerformSafeBlock();
    if (AppBooleanValue)
    {
      v11 = v9;
      AXPerformSafeBlock();

    }
  }

  return v7 != 0;
}

void __63__PKPassGroupViewAccessibility__accessibilityDismissModalGroup__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  int v4;
  void *v5;
  int v6;
  _QWORD *v7;
  _QWORD v8[5];
  _QWORD v9[5];
  _QWORD v10[5];

  if (!*(_BYTE *)(a1 + 40))
  {
    objc_msgSend(*(id *)(a1 + 32), "safeValueForKey:", CFSTR("datasource"));
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "safeValueForKey:", CFSTR("numberOfGroups"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "intValue");

    if (v4 == 2)
    {
      objc_msgSend(*(id *)(a1 + 32), "safeValueForKey:", CFSTR("_modalGroupIndex"));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v5, "intValue");

      if (v6)
      {
        v9[0] = MEMORY[0x24BDAC760];
        v9[1] = 3221225472;
        v9[2] = __63__PKPassGroupViewAccessibility__accessibilityDismissModalGroup__block_invoke_3;
        v9[3] = &unk_2502E3A70;
        v7 = v9;
      }
      else
      {
        v10[0] = MEMORY[0x24BDAC760];
        v10[1] = 3221225472;
        v10[2] = __63__PKPassGroupViewAccessibility__accessibilityDismissModalGroup__block_invoke_2;
        v10[3] = &unk_2502E3A70;
        v7 = v10;
      }
    }
    else
    {
      v8[0] = MEMORY[0x24BDAC760];
      v8[1] = 3221225472;
      v8[2] = __63__PKPassGroupViewAccessibility__accessibilityDismissModalGroup__block_invoke_4;
      v8[3] = &unk_2502E3A70;
      v7 = v8;
    }
    v7[4] = *(id *)(a1 + 32);
    AXPerformSafeBlock();

  }
}

uint64_t __63__PKPassGroupViewAccessibility__accessibilityDismissModalGroup__block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setModalGroupIndex:", 1);
  return objc_msgSend(*(id *)(a1 + 32), "setPresentationState:animated:", 5, 1);
}

uint64_t __63__PKPassGroupViewAccessibility__accessibilityDismissModalGroup__block_invoke_3(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setModalGroupIndex:", 0);
  return objc_msgSend(*(id *)(a1 + 32), "setPresentationState:animated:", 5, 1);
}

uint64_t __63__PKPassGroupViewAccessibility__accessibilityDismissModalGroup__block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setPresentationState:animated:", 4, 1);
}

uint64_t __63__PKPassGroupViewAccessibility__accessibilityDismissModalGroup__block_invoke_5(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(v2, "safeValueForKey:", CFSTR("_modallyPresentedGroupView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "_indexOfGroupView:", v3);

  return objc_msgSend(*(id *)(a1 + 32), "setModalGroupIndex:", v4 - 1);
}

- (BOOL)accessibilityPerformEscape
{
  _BOOL4 v3;

  if (-[PKPassGroupViewAccessibility isAccessibilityElement](self, "isAccessibilityElement"))
  {
    LOBYTE(v3) = 0;
  }
  else
  {
    v3 = -[PKPassGroupViewAccessibility _accessibilityDismissModalGroup](self, "_accessibilityDismissModalGroup");
    if (v3)
    {
      AXPerformBlockOnMainThreadAfterDelay();
      LOBYTE(v3) = 1;
    }
  }
  return v3;
}

void __58__PKPassGroupViewAccessibility_accessibilityPerformEscape__block_invoke()
{
  UIAccessibilityNotifications v0;
  id v1;

  v0 = *MEMORY[0x24BDF7328];
  accessibilityLocalizedString(CFSTR("card.dismissed"));
  v1 = (id)objc_claimAutoreleasedReturnValue();
  UIAccessibilityPostNotification(v0, v1);

}

- (BOOL)_axIsBackFacing
{
  void *v2;
  void *v3;
  void *v4;
  int v5;

  -[PKPassGroupViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("frontmostPassView"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "safeValueForKey:", CFSTR("showingFront"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "BOOLValue") ^ 1;

  }
  else
  {
    LOBYTE(v5) = 0;
  }

  return v5;
}

- (BOOL)accessibilityScroll:(int64_t)a3
{
  void *v5;

  if (-[PKPassGroupViewAccessibility _axIsBackFacing](self, "_axIsBackFacing")
    || -[PKPassGroupViewAccessibility isAccessibilityElement](self, "isAccessibilityElement"))
  {
    return 0;
  }
  if (a3 == 3)
  {
    v5 = 0;
    goto LABEL_8;
  }
  if (a3 != 4)
    return 0;
  -[PKPassGroupViewAccessibility _accessibilityDismissModalGroup](self, "_accessibilityDismissModalGroup");
  accessibilityLocalizedString(CFSTR("card.dismissed"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_8:
  UIAccessibilityPostNotification(*MEMORY[0x24BDF72E0], v5);

  return 1;
}

- (CGPoint)accessibilityActivationPoint
{
  void *v2;
  double MidX;
  double MidY;
  double v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  CGPoint result;
  CGRect v14;
  CGRect v15;

  objc_opt_class();
  __UIAccessibilityCastAsClass();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bounds");
  MidX = CGRectGetMidX(v14);
  objc_msgSend(v2, "bounds");
  MidY = CGRectGetMidY(v15);
  if (MidY <= 10.0)
    v5 = MidY;
  else
    v5 = 10.0;
  objc_msgSend(v2, "window");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "convertPoint:toView:", 0, MidX, v5);
  objc_msgSend(v6, "convertPoint:toWindow:", 0);
  v8 = v7;
  v10 = v9;

  v11 = v8;
  v12 = v10;
  result.y = v12;
  result.x = v11;
  return result;
}

@end
