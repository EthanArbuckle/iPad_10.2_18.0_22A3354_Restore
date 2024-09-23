@implementation CKEffectPickerViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("CKEffectPickerView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CKEffectPickerView"), CFSTR("mainLabel"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CKEffectPickerView"), CFSTR("typeSegmentedControl"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CKEffectPickerView"), CFSTR("sendMomentButton"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CKEffectPickerView"), CFSTR("momentTitleLabel"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CKEffectPickerView"), CFSTR("pageControl"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CKEffectPickerView"), CFSTR("momentsCollectionView"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CKEffectPickerView"), CFSTR("momentIdentifiers"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CKEffectPickerView"), CFSTR("initWithFrame:sendButtonFrame:balloonViewOrigin:composition:color:"), "@", "{CGRect={CGPoint=dd}{CGSize=dd}}", "{CGRect={CGPoint=dd}{CGSize=dd}}", "{CGPoint=dd}", "@", "c", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CKEffectPickerView"), CFSTR("closeButton"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CKEffectPickerView"), CFSTR("balloonView"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CKEffectPickerView"), CFSTR("_touchUpInsideDotButton:"), "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CKEffectPickerView"), CFSTR("cancelImpactSelection"), "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CKEffectPickerView"), CFSTR("selectedIndex"), "Q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CKEffectPickerView"), CFSTR("selectedMomentIndex"), "q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CKEffectPickerView"), CFSTR("effectTypeDidChange:"), "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CKEffectPickerView"), CFSTR("scrollViewDidScroll:"), "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CKEffectPickerView"), CFSTR("scrollViewDidEndDecelerating:"), "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CKEffectPickerView"), CFSTR("effectLabels"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CKEffectPickerView"), CFSTR("effectDescriptiveLabels"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CKEffectPickerView"), CFSTR("effectDotButtons"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CKEffectPickerView"), CFSTR("effectSendButtons"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CKEffectPickerView"), CFSTR("effectIdentifiers"), "@", 0);

}

- (BOOL)accessibilityViewIsModal
{
  return 1;
}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  char v21;
  objc_super v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v22.receiver = self;
  v22.super_class = (Class)CKEffectPickerViewAccessibility;
  -[CKEffectPickerViewAccessibility _accessibilityLoadAccessibilityInformation](&v22, sel__accessibilityLoadAccessibilityInformation);
  -[CKEffectPickerViewAccessibility _axUpdateCloseButton](self, "_axUpdateCloseButton");
  -[CKEffectPickerViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("balloonView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setIsAccessibilityElement:", 0);

  v4 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v21 = 0;
  objc_opt_class();
  -[CKEffectPickerViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("momentIdentifiers"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v7 = v6;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v23, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v18 != v10)
          objc_enumerationMutation(v7);
        _AXCKFullScreenEffectString(*(void **)(*((_QWORD *)&v17 + 1) + 8 * i), 0);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (v12)
          objc_msgSend(v4, "addObject:", v12, (_QWORD)v17);

      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v23, 16);
    }
    while (v9);
  }

  v21 = 0;
  objc_opt_class();
  -[CKEffectPickerViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("pageControl"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v21)
    goto LABEL_14;
  objc_msgSend(v14, "accessibilitySetIdentification:", CFSTR("AXImpactEffectPageControl"));
  objc_msgSend(v14, "_accessibilitySetRetainedValue:forKey:", v4, CFSTR("AXImpactEffectPageControlValues"));
  v21 = 0;
  objc_opt_class();
  -[CKEffectPickerViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("momentsCollectionView"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v21)
LABEL_14:
    abort();
  objc_msgSend(v16, "accessibilitySetIdentification:", CFSTR("AXImpactEffectCollectionView"));

}

- (id)_axFullScreenEffectElement
{
  JUMPOUT(0x23490A888);
}

- (void)_setAXFullScreenEffectElement:(id)a3
{
  __UIAccessibilitySetAssociatedObject();
}

- (id)accessibilityElements
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  unint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  BOOL v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  void *v30;
  unint64_t v31;
  void *v33;
  _QWORD v34[4];
  id v35;
  id location;

  v3 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  -[CKEffectPickerViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("mainLabel"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v4);
  LOBYTE(location) = 0;
  objc_opt_class();
  -[CKEffectPickerViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("typeSegmentedControl"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "addObject:", v6);
  -[CKEffectPickerViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("closeButton"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "selectedSegmentIndex"))
  {
    -[CKEffectPickerViewAccessibility _axFullScreenEffectElement](self, "_axFullScreenEffectElement");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v8)
    {
      objc_initWeak(&location, self);
      v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF67A0]), "initWithAccessibilityContainer:", self);
      v34[0] = MEMORY[0x24BDAC760];
      v34[1] = 3221225472;
      v34[2] = __56__CKEffectPickerViewAccessibility_accessibilityElements__block_invoke;
      v34[3] = &unk_2501B1CB8;
      objc_copyWeak(&v35, &location);
      objc_msgSend(v8, "_setAccessibilityFrameBlock:", v34);
      -[CKEffectPickerViewAccessibility _setAXFullScreenEffectElement:](self, "_setAXFullScreenEffectElement:", v8);
      objc_destroyWeak(&v35);
      objc_destroyWeak(&location);
    }
    v9 = -[CKEffectPickerViewAccessibility safeIntegerForKey:](self, "safeIntegerForKey:", CFSTR("selectedMomentIndex"));
    LOBYTE(location) = 0;
    objc_opt_class();
    -[CKEffectPickerViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("momentIdentifiers"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    __UIAccessibilityCastAsClass();
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if ((_BYTE)location)
      goto LABEL_22;
    v33 = v4;
    if (v9 < objc_msgSend(v11, "count"))
    {
      objc_msgSend(v11, "objectAtIndex:", v9);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v12, "length"))
      {
        _AXCKFullScreenEffectString(v12, 0);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        _AXCKFullScreenEffectString(v12, 1);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        __UIAXStringForVariables();
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "setAccessibilityLabel:", v15, v14, CFSTR("__AXStringForVariablesSentinel"));

        objc_msgSend(v3, "addObject:", v8);
      }

    }
    -[CKEffectPickerViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("sendMomentButton"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(location) = 0;
    objc_opt_class();
    -[CKEffectPickerViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("momentTitleLabel"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    __UIAccessibilityCastAsClass();
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if ((_BYTE)location)
LABEL_22:
      abort();
    objc_msgSend(v18, "text");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setAccessibilityLabel:", v19);

    objc_msgSend(v3, "addObject:", v16);
    objc_msgSend(v3, "addObject:", v7);
    -[CKEffectPickerViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("pageControl"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v20);

    v4 = v33;
  }
  else
  {
    LOBYTE(location) = 0;
    objc_opt_class();
    -[CKEffectPickerViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("effectDotButtons"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    __UIAccessibilityCastAsClass();
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    LOBYTE(location) = 0;
    objc_opt_class();
    -[CKEffectPickerViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("effectSendButtons"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    __UIAccessibilityCastAsClass();
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v23 = objc_msgSend(v8, "count");
    v24 = -[CKEffectPickerViewAccessibility safeUnsignedIntegerForKey:](self, "safeUnsignedIntegerForKey:", CFSTR("selectedIndex"));
    v25 = v23 < 1;
    v26 = v23 - 1;
    if (!v25)
    {
      v27 = v24;
      do
      {
        if (v27 == v26)
        {
          v28 = v11;
          v29 = v27;
        }
        else
        {
          v28 = v8;
          v29 = v26;
        }
        objc_msgSend(v28, "objectAtIndex:", v29);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "addObject:", v30);

        v31 = v26-- + 1;
      }
      while (v31 > 1);
    }
    objc_msgSend(v3, "addObject:", v7);
  }

  return v3;
}

double __56__CKEffectPickerViewAccessibility_accessibilityElements__block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  double v5;
  double v6;

  objc_opt_class();
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "safeValueForKey:", CFSTR("momentsCollectionView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "accessibilityFrame");
  v6 = v5;

  return v6;
}

- (BOOL)accessibilityScroll:(int64_t)a3
{
  _BOOL4 v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)CKEffectPickerViewAccessibility;
  v5 = -[CKEffectPickerViewAccessibility accessibilityScroll:](&v14, sel_accessibilityScroll_);
  objc_opt_class();
  -[CKEffectPickerViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("momentsCollectionView"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = -[CKEffectPickerViewAccessibility safeIntegerForKey:](self, "safeIntegerForKey:", CFSTR("selectedMomentIndex"));
  if (objc_msgSend(v7, "_accessibilityViewIsVisible"))
  {
    if (a3 == 2)
    {
      objc_opt_class();
      -[CKEffectPickerViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("pageControl"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      __UIAccessibilityCastAsClass();
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      if (v8 < objc_msgSend(v10, "numberOfPages") - 1)
      {
        objc_msgSend(MEMORY[0x24BDD15D8], "indexPathForRow:inSection:", v8 + 1, 0);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v5 = 1;
        objc_msgSend(v7, "scrollToItemAtIndexPath:atScrollPosition:animated:", v11, 16, 1);

      }
    }
    else if (a3 == 1 && v8 >= 1)
    {
      objc_msgSend(MEMORY[0x24BDD15D8], "indexPathForRow:inSection:", v8 - 1, 0);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "scrollToItemAtIndexPath:atScrollPosition:animated:", v12, 16, 1);

LABEL_10:
      -[CKEffectPickerViewAccessibility performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", sel__axUpdateScrollView, 0, 0.3);
      LOBYTE(v5) = 1;
      goto LABEL_12;
    }
    if (!v5)
    {
      LOBYTE(v5) = 0;
      goto LABEL_12;
    }
    goto LABEL_10;
  }
LABEL_12:

  return v5;
}

- (void)_axUpdateScrollView
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  objc_opt_class();
  -[CKEffectPickerViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("momentsCollectionView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[CKEffectPickerViewAccessibility scrollViewDidScroll:](self, "scrollViewDidScroll:", v4);
  -[CKEffectPickerViewAccessibility scrollViewDidEndDecelerating:](self, "scrollViewDidEndDecelerating:", v4);
  objc_opt_class();
  -[CKEffectPickerViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("pageControl"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "accessibilityValue");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  UIAccessibilitySpeak();

}

- (CKEffectPickerViewAccessibility)initWithFrame:(CGRect)a3 sendButtonFrame:(CGRect)a4 balloonViewOrigin:(CGPoint)a5 composition:(id)a6 color:(char)a7
{
  CKEffectPickerViewAccessibility *v7;
  CKEffectPickerViewAccessibility *v8;
  objc_super v10;
  uint64_t v11;
  uint64_t v12;

  v10.receiver = self;
  v10.super_class = (Class)CKEffectPickerViewAccessibility;
  v7 = -[CKEffectPickerViewAccessibility initWithFrame:sendButtonFrame:balloonViewOrigin:composition:color:](&v10, sel_initWithFrame_sendButtonFrame_balloonViewOrigin_composition_color_, *(_QWORD *)&a5.x, *(_QWORD *)&a5.y, a6, a7, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, a4.origin.x, a4.origin.y, a4.size.width, a4.size.height, v11, v12);
  v8 = v7;
  if (v7)
    -[CKEffectPickerViewAccessibility _accessibilityLoadAccessibilityInformation](v7, "_accessibilityLoadAccessibilityInformation");
  return v8;
}

- (void)addEffect:(id)a3 withDescriptiveText:(id)a4 withIdentifier:(id)a5
{
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  objc_super v23;

  v23.receiver = self;
  v23.super_class = (Class)CKEffectPickerViewAccessibility;
  v8 = a3;
  -[CKEffectPickerViewAccessibility addEffect:withDescriptiveText:withIdentifier:](&v23, sel_addEffect_withDescriptiveText_withIdentifier_, v8, a4, a5);
  -[CKEffectPickerViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("effectLabels"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "safeValueForKey:", CFSTR("@lastObject"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setIsAccessibilityElement:", 0);

  -[CKEffectPickerViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("effectDescriptiveLabels"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "safeValueForKey:", CFSTR("@lastObject"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setIsAccessibilityElement:", 0);

  -[CKEffectPickerViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("effectDotButtons"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "safeValueForKey:", CFSTR("@lastObject"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "setAccessibilityLabel:", v8);
  -[CKEffectPickerViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("effectSendButtons"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "safeValueForKey:", CFSTR("@lastObject"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = (void *)MEMORY[0x24BDD17C8];
  accessibilityLocalizedString(CFSTR("impact.effect.send"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "stringWithFormat:", v18, v8);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setAccessibilityLabel:", v19);

  v20 = (void *)MEMORY[0x24BDD17C8];
  accessibilityLocalizedString(CFSTR("impact.effect.send.hint.format"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "stringWithFormat:", v21, v8);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v16, "setAccessibilityHint:", v22);
}

- (void)_touchUpInsideDotButton:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  dispatch_time_t v11;
  id v12;
  _QWORD v13[4];
  id v14;
  char v15;
  objc_super v16;

  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)CKEffectPickerViewAccessibility;
  -[CKEffectPickerViewAccessibility _touchUpInsideDotButton:](&v16, sel__touchUpInsideDotButton_, v4);
  objc_opt_class();
  -[CKEffectPickerViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("effectDotButtons"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v6, "indexOfObject:", v4);
  v15 = 0;
  objc_opt_class();
  -[CKEffectPickerViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("effectSendButtons"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "objectAtIndex:", v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[CKEffectPickerViewAccessibility _axUpdateCloseButton](self, "_axUpdateCloseButton");
  v11 = dispatch_time(0, 160000000);
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __59__CKEffectPickerViewAccessibility__touchUpInsideDotButton___block_invoke;
  v13[3] = &unk_2501B1B50;
  v14 = v10;
  v12 = v10;
  dispatch_after(v11, MEMORY[0x24BDAC9B8], v13);

}

void __59__CKEffectPickerViewAccessibility__touchUpInsideDotButton___block_invoke(uint64_t a1)
{
  UIAccessibilityPostNotification(*MEMORY[0x24BDF72C8], *(id *)(a1 + 32));
}

- (void)cancelImpactSelection
{
  UIAccessibilityNotifications v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CKEffectPickerViewAccessibility;
  -[CKEffectPickerViewAccessibility cancelImpactSelection](&v5, sel_cancelImpactSelection);
  -[CKEffectPickerViewAccessibility _axUpdateCloseButton](self, "_axUpdateCloseButton");
  v3 = *MEMORY[0x24BDF72C8];
  -[CKEffectPickerViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("closeButton"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  UIAccessibilityPostNotification(v3, v4);

}

- (void)effectTypeDidChange:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CKEffectPickerViewAccessibility;
  -[CKEffectPickerViewAccessibility effectTypeDidChange:](&v4, sel_effectTypeDidChange_, a3);
  UIAccessibilityPostNotification(*MEMORY[0x24BDF72C8], self);
}

- (void)_axUpdateCloseButton
{
  __CFString *v3;
  void *v4;
  id v5;

  if (-[CKEffectPickerViewAccessibility safeUnsignedIntegerForKey:](self, "safeUnsignedIntegerForKey:", CFSTR("selectedIndex")) == 0x7FFFFFFFFFFFFFFFLL)v3 = CFSTR("impact.effect.close");
  else
    v3 = CFSTR("impact.effect.cancel");
  accessibilityLocalizedString(v3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[CKEffectPickerViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("closeButton"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAccessibilityLabel:", v5);

}

@end
