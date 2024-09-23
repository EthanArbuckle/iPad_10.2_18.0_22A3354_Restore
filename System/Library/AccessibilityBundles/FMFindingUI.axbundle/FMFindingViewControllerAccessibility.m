@implementation FMFindingViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("FMFindingUI.FMFindingViewController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (id)_axCachedAccessibilityElements
{
  JUMPOUT(0x23490E32CLL);
}

- (void)_axSetCachedAccessibilityElements:(id)a3
{
  __UIAccessibilitySetAssociatedObject();
}

- (id)_axCachedAggregateHeaderElement
{
  JUMPOUT(0x23490E32CLL);
}

- (void)_axSetCachedAggregateHeaderElement:(id)a3
{
  __UIAccessibilitySetAssociatedObject();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("FMFindingUI.FMFindingViewController"), CFSTR("UIViewController"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("FMFindingUI.FMFindingViewController"), CFSTR("accessibilityTitleLabel"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("FMFindingUI.FMFindingViewController"), CFSTR("accessibilityNameLabel"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("FMFindingUI.FMFindingViewController"), CFSTR("foundPlayerView"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("FMFindingUI.FMFindingViewController"), CFSTR("accessibilityR1DistanceView"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("FMFindingUI.FMFindingViewController"), CFSTR("accessibilityModeRawValue"), "I", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("FMFindingUI.FMFindingViewController"), CFSTR("viewDidLoad"), "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("FMFindingUI.FMFindingViewController"), CFSTR("accessibilityDistanceAndDirectionUpdated"), "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("FMFindingUI.FMFindingViewController"), CFSTR("accessibilityDidUpdateWithTopLabelMessage:instruction:"), "v", "@", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("FMFindingUI.FMFindingViewController"), CFSTR("accessibilityShowViewHandler"), "v", 0);

}

- (void)_axLoadHeaderElement
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;

  -[FMFindingViewControllerAccessibility _axCachedAggregateHeaderElement](self, "_axCachedAggregateHeaderElement");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    objc_opt_class();
    __UIAccessibilityCastAsClass();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "view");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    -[FMFindingViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("accessibilityTitleLabel"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[FMFindingViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("accessibilityNameLabel"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_alloc(MEMORY[0x24BEBADA8]);
    objc_msgSend(MEMORY[0x24BDBCE30], "axArrayByIgnoringNilElementsWithCount:", 2, v6, v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v8, "initWithAccessibilityContainer:representedElements:", v5, v9);

    objc_msgSend(v10, "_setAccessibilityServesAsFirstElement:", 1);
    objc_msgSend(v10, "_setAccessibilityTraitsBlock:", &__block_literal_global_0);
    -[FMFindingViewControllerAccessibility _axSetCachedAggregateHeaderElement:](self, "_axSetCachedAggregateHeaderElement:", v10);

  }
}

uint64_t __60__FMFindingViewControllerAccessibility__axLoadHeaderElement__block_invoke()
{
  return *MEMORY[0x24BDF73C0];
}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  void *v4;
  _QWORD v5[4];
  id v6;
  char v7;
  id location;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)FMFindingViewControllerAccessibility;
  -[FMFindingViewControllerAccessibility _accessibilityLoadAccessibilityInformation](&v9, sel__accessibilityLoadAccessibilityInformation);
  -[FMFindingViewControllerAccessibility _axLoadHeaderElement](self, "_axLoadHeaderElement");
  objc_initWeak(&location, self);
  v7 = 0;
  objc_opt_class();
  __UIAccessibilityCastAsClass();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __82__FMFindingViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke;
  v5[3] = &unk_2502065A0;
  objc_copyWeak(&v6, &location);
  objc_msgSend(v4, "_setAccessibilityElementsBlock:", v5);

  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

id __82__FMFindingViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke(uint64_t a1)
{
  id *v1;
  id WeakRetained;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  id v14;
  char v15;
  void *v16;
  id v17;
  uint64_t v18;
  id v19;
  void *v20;
  id v21;
  void *v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t j;
  void *v27;
  void *v28;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  id location;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _BYTE v39[128];
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x24BDAC8D0];
  v1 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_axCachedAccessibilityElements");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    LOBYTE(location) = 0;
    objc_opt_class();
    __UIAccessibilityCastAsClass();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "view");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      objc_msgSend(WeakRetained, "_axCachedAggregateHeaderElement");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "subviews");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = (void *)objc_msgSend(v7, "mutableCopy");

      v37 = 0u;
      v38 = 0u;
      v35 = 0u;
      v36 = 0u;
      objc_msgSend(v6, "representedElements");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v35, v40, 16);
      if (v10)
      {
        v11 = *(_QWORD *)v36;
        do
        {
          for (i = 0; i != v10; ++i)
          {
            if (*(_QWORD *)v36 != v11)
              objc_enumerationMutation(v9);
            objc_msgSend(v8, "removeObject:", *(_QWORD *)(*((_QWORD *)&v35 + 1) + 8 * i));
          }
          v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v35, v40, 16);
        }
        while (v10);
      }

      objc_msgSend(v8, "axSafelyAddObject:", v6);
      objc_msgSend(WeakRetained, "safeUIViewForKey:", CFSTR("foundPlayerView"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_initWeak(&location, v13);

      v14 = objc_loadWeakRetained(&location);
      v15 = objc_msgSend(v14, "_accessibilityViewIsVisible");

      if ((v15 & 1) == 0)
      {
        v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF67A0]), "initWithAccessibilityContainer:", v5);
        v17 = objc_loadWeakRetained(&location);
        objc_msgSend(v17, "accessibilityFrame");
        objc_msgSend(v16, "setAccessibilityFrame:");

        v18 = objc_msgSend(WeakRetained, "safeUnsignedIntForKey:", CFSTR("accessibilityModeRawValue"));
        v19 = objc_loadWeakRetained(v1);
        objc_msgSend(v19, "_accessibilityLabelForModernItemViewWithMode:", v18);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "setAccessibilityLabel:", v20);

        v21 = objc_loadWeakRetained(v1);
        objc_msgSend(v21, "_accessibilityValueForModernItemViewWithMode:", v18);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "setAccessibilityValue:", v22);

        objc_msgSend(v8, "axSafelyAddObject:", v16);
      }
      objc_msgSend(v8, "axFilterObjectsUsingBlock:", &__block_literal_global_210);
      v32 = 0u;
      v33 = 0u;
      v30 = 0u;
      v31 = 0u;
      v23 = (id)objc_claimAutoreleasedReturnValue();
      v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v30, v39, 16);
      if (v24)
      {
        v25 = *(_QWORD *)v31;
        do
        {
          for (j = 0; j != v24; ++j)
          {
            if (*(_QWORD *)v31 != v25)
              objc_enumerationMutation(v23);
            objc_msgSend(v8, "removeObject:", *(_QWORD *)(*((_QWORD *)&v30 + 1) + 8 * j), (_QWORD)v30);
          }
          v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v30, v39, 16);
        }
        while (v24);
      }

      objc_msgSend(v8, "sortedArrayUsingSelector:", sel_accessibilityCompareGeometry_);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(WeakRetained, "_axSetCachedAccessibilityElements:", v27);

      objc_destroyWeak(&location);
    }

  }
  objc_msgSend(WeakRetained, "_axCachedAccessibilityElements", (_QWORD)v30);
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  return v28;
}

uint64_t __82__FMFindingViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "_accessibilityViewIsVisible") ^ 1;
}

- (void)viewDidLoad
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)FMFindingViewControllerAccessibility;
  -[FMFindingViewControllerAccessibility viewDidLoad](&v3, sel_viewDidLoad);
  -[FMFindingViewControllerAccessibility _accessibilityLoadAccessibilityInformation](self, "_accessibilityLoadAccessibilityInformation");
}

- (void)accessibilityShowViewHandler
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)FMFindingViewControllerAccessibility;
  -[FMFindingViewControllerAccessibility accessibilityShowViewHandler](&v3, sel_accessibilityShowViewHandler);
  -[FMFindingViewControllerAccessibility _axSetCachedAccessibilityElements:](self, "_axSetCachedAccessibilityElements:", 0);
}

- (void)accessibilityDidUpdateWithTopLabelMessage:(id)a3 instruction:(id)a4
{
  id v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)FMFindingViewControllerAccessibility;
  v5 = a4;
  -[FMFindingViewControllerAccessibility accessibilityDidUpdateWithTopLabelMessage:instruction:](&v6, sel_accessibilityDidUpdateWithTopLabelMessage_instruction_, a3, v5);
  UIAccessibilitySpeakIfNotSpeaking();

}

- (void)accessibilityDistanceAndDirectionUpdated
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)FMFindingViewControllerAccessibility;
  -[FMFindingViewControllerAccessibility accessibilityDistanceAndDirectionUpdated](&v6, sel_accessibilityDistanceAndDirectionUpdated);
  -[FMFindingViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("accessibilityR1DistanceView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "accessibilityLabel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4
    && objc_msgSend(v4, "length")
    && (objc_msgSend((id)accessibilityDistanceAndDirectionUpdated_previousDistance, "isEqualToString:", v5) & 1) == 0)
  {
    UIAccessibilitySpeakIfNotSpeaking();
    objc_storeStrong((id *)&accessibilityDistanceAndDirectionUpdated_previousDistance, v5);
  }

}

- (id)_accessibilityLabelForModernItemViewWithMode:(unsigned int)a3
{
  signed int v3;
  void *v4;

  v3 = a3 - 1;
  if (a3 - 1 <= 7 && ((0x8Bu >> v3) & 1) != 0)
  {
    accessibilityLocalizedString(*(&off_2502065C0 + v3));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (id)_accessibilityValueForModernItemViewWithMode:(unsigned int)a3
{
  __CFString *v3;

  if (a3 == 4)
  {
    v3 = CFSTR("item.in.field.of.vision.mode");
  }
  else
  {
    if (a3 != 2)
      return 0;
    v3 = CFSTR("item.out.field.of.vision.mode");
  }
  accessibilityLocalizedString(v3);
  return (id)objc_claimAutoreleasedReturnValue();
}

@end
