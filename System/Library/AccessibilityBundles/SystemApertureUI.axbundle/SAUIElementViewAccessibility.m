@implementation SAUIElementViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SAUIElementView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SAUIElementView"), CFSTR("elementViewProvider"), "@", 0);
  objc_msgSend(v3, "validateProtocol:hasRequiredInstanceMethod:", CFSTR("SAUIElementViewProviding"), CFSTR("leadingView"));
  objc_msgSend(v3, "validateProtocol:hasRequiredInstanceMethod:", CFSTR("SAUIElementViewProviding"), CFSTR("trailingView"));
  objc_msgSend(v3, "validateProtocol:hasRequiredInstanceMethod:", CFSTR("SAUIElementViewProviding"), CFSTR("minimalView"));
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("SAUIElementView"), CFSTR("UIView"));
  objc_msgSend(v3, "validateClass:conformsToProtocol:", CFSTR("UIView"), CFSTR("_UIFocusItemInternal"));
  objc_msgSend(v3, "validateProtocol:hasOptionalInstanceMethod:", CFSTR("_UIFocusItemInternal"), CFSTR("_viewToAddFocusLayer"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SAUILayoutSpecifyingElementViewController"), CFSTR("_expandToCustomLayoutModeFromUserActionIfPossible"), "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SAUILayoutSpecifyingElementViewController"), CFSTR("_axCollapseIfExpandedByUserInteraction"), "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SAUILayoutSpecifyingElementViewController"), CFSTR("_containerView"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SAUILayoutSpecifyingElementViewController"), CFSTR("layoutMode"), "q", 0);

}

- (BOOL)isAccessibilityElement
{
  void *v2;
  void *v3;
  BOOL v4;

  -[SAUIElementViewAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("superview"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_accessibilityViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = objc_msgSend(v3, "safeIntForKey:", CFSTR("layoutMode")) == 1
    || objc_msgSend(v3, "safeIntForKey:", CFSTR("layoutMode")) == 2;

  return v4;
}

- (id)_accessibilityRemoteElementDescendant
{
  return (id)-[SAUIElementViewAccessibility _accessibilityFindDescendant:](self, "_accessibilityFindDescendant:", &__block_literal_global);
}

uint64_t __69__SAUIElementViewAccessibility__accessibilityRemoteElementDescendant__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  uint64_t v3;

  v2 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = objc_msgSend(v2, "onClientSide");
  else
    v3 = 0;

  return v3;
}

- (void)_accessibilityPrefetchPropertiesIfNecessary
{
  void *v3;
  NSObject *v4;
  _QWORD v5[4];
  id v6;
  SAUIElementViewAccessibility *v7;

  -[SAUIElementViewAccessibility _accessibilityRemoteElementDescendant](self, "_accessibilityRemoteElementDescendant");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3
    && !-[SAUIElementViewAccessibility _axRemoteContentIsGettingElements](self, "_axRemoteContentIsGettingElements"))
  {
    -[SAUIElementViewAccessibility _axSetRemoteContentIsGettingElements:](self, "_axSetRemoteContentIsGettingElements:", 1);
    _AXShouldDispatchNonMainThreadCallbacksOnMainThreadPushReason();
    dispatch_get_global_queue(21, 0);
    v4 = objc_claimAutoreleasedReturnValue();
    v5[0] = MEMORY[0x24BDAC760];
    v5[1] = 3221225472;
    v5[2] = __75__SAUIElementViewAccessibility__accessibilityPrefetchPropertiesIfNecessary__block_invoke;
    v5[3] = &unk_25039C810;
    v6 = v3;
    v7 = self;
    dispatch_async(v4, v5);

  }
}

uint64_t __75__SAUIElementViewAccessibility__accessibilityPrefetchPropertiesIfNecessary__block_invoke(uint64_t a1)
{
  void *v1;
  _QWORD v3[5];

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __75__SAUIElementViewAccessibility__accessibilityPrefetchPropertiesIfNecessary__block_invoke_2;
  v3[3] = &unk_25039C838;
  v1 = *(void **)(a1 + 32);
  v3[4] = *(_QWORD *)(a1 + 40);
  return objc_msgSend(v1, "getLeafElementsFromRemoteSide:", v3);
}

void __75__SAUIElementViewAccessibility__accessibilityPrefetchPropertiesIfNecessary__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v8[5];
  id v9;

  v3 = a2;
  _AXShouldDispatchNonMainThreadCallbacksOnMainThreadPopReason();
  objc_msgSend(v3, "ax_flatMappedArrayUsingBlock:", &__block_literal_global_216);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDBCF00], "orderedSetWithArray:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "array");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __75__SAUIElementViewAccessibility__accessibilityPrefetchPropertiesIfNecessary__block_invoke_4;
  v8[3] = &unk_25039C810;
  v8[4] = *(_QWORD *)(a1 + 32);
  v9 = v6;
  v7 = v6;
  dispatch_async(MEMORY[0x24BDAC9B8], v8);

}

uint64_t __75__SAUIElementViewAccessibility__accessibilityPrefetchPropertiesIfNecessary__block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "stringWithAXAttribute:", 2001);
}

uint64_t __75__SAUIElementViewAccessibility__accessibilityPrefetchPropertiesIfNecessary__block_invoke_4(uint64_t a1)
{
  void *v2;
  void *v3;

  v2 = *(void **)(a1 + 32);
  MEMORY[0x234921554](*(_QWORD *)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_axSetRemoteContentLabel:", v3);

  return objc_msgSend(*(id *)(a1 + 32), "_axSetRemoteContentIsGettingElements:", 0);
}

- (BOOL)_axRemoteContentIsGettingElements
{
  return __UIAccessibilityGetAssociatedBool();
}

- (void)_axSetRemoteContentIsGettingElements:(BOOL)a3
{
  __UIAccessibilitySetAssociatedBool();
}

- (id)_axGetRemoteContentLabel
{
  JUMPOUT(0x2349215F0);
}

- (void)_axSetRemoteContentLabel:(id)a3
{
  __UIAccessibilitySetAssociatedObject();
}

- (id)accessibilityLabel
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v9;
  int v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  const __CFString *v15;

  -[SAUIElementViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("elementViewProvider"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safeUIViewForKey:", CFSTR("leadingView"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safeUIViewForKey:", CFSTR("trailingView"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safeUIViewForKey:", CFSTR("minimalView"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  MEMORY[0x234921524](CFSTR("SBFlashlightActivityElement"));
  if ((objc_opt_isKindOfClass() & 1) != 0
    || (MEMORY[0x234921524](CFSTR("SBDynamicFlashlightActivityElement")), (objc_opt_isKindOfClass() & 1) != 0))
  {
    accessibilityLocalizedString(CFSTR("flashlight.on"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[SAUIElementViewAccessibility accessibilityIdentifier](self, "accessibilityIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "isEqualToString:", CFSTR("minimal.view"));

    if (v10)
    {
      objc_msgSend(v6, "accessibilityLabel");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(v5, "accessibilityLabel");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(v11, "length"))
      {
        UIAXStringForAllChildren();
        v12 = objc_claimAutoreleasedReturnValue();

        v11 = (void *)v12;
      }
      v14 = v11;
      v15 = CFSTR("__AXStringForVariablesSentinel");
      __UIAXStringForVariables();
      v7 = (void *)objc_claimAutoreleasedReturnValue();

    }
    if (!objc_msgSend(v7, "length", v14, v15))
    {
      -[SAUIElementViewAccessibility _axGetRemoteContentLabel](self, "_axGetRemoteContentLabel");
      v13 = objc_claimAutoreleasedReturnValue();

      v7 = (void *)v13;
    }
  }

  return v7;
}

- (id)accessibilityHint
{
  void *v3;
  void *v4;
  __CFString *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;

  -[SAUIElementViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("elementViewProvider"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  MEMORY[0x234921524](CFSTR("SBLockElementViewProvider"));
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    MEMORY[0x234921524](CFSTR("SBFlashlightActivityElement"));
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = CFSTR("system.aperture.flashlight.hint");
LABEL_10:
      accessibilityLocalizedString(v5);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_11;
    }
    objc_msgSend(v3, "safeStringForKey:", CFSTR("elementIdentifier"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v6, "isEqualToString:", CFSTR("systemApertureElementIdentifierUnknown")) & 1) != 0)
    {
      -[SAUIElementViewAccessibility accessibilityLabel](self, "accessibilityLabel");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      accessibilityLocalizedString(CFSTR("system.aperture.detection.label"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v7, "isEqualToString:", v8);

      if ((v9 & 1) != 0)
      {
        v5 = CFSTR("system.aperture.detection.hint");
        goto LABEL_10;
      }
    }
    else
    {

    }
    v5 = CFSTR("system.aperture.actions.hint");
    goto LABEL_10;
  }
  v4 = 0;
LABEL_11:

  return v4;
}

- (id)accessibilityCustomActions
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void **v21;
  uint64_t v22;
  _QWORD v24[4];
  id v25;
  _QWORD v26[4];
  id v27;
  _QWORD v28[4];
  id v29;
  void *v30;
  _QWORD v31[3];

  v31[2] = *MEMORY[0x24BDAC8D0];
  -[SAUIElementViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("elementViewProvider"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  MEMORY[0x234921524](CFSTR("SBLockElementViewProvider"));
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    MEMORY[0x234921524](CFSTR("SBFlashlightActivityElement"));
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      -[SAUIElementViewAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("superview"));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "_accessibilityViewController");
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      v7 = objc_alloc(MEMORY[0x24BDF6788]);
      accessibilityLocalizedString(CFSTR("window.expand"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = MEMORY[0x24BDAC760];
      v28[0] = MEMORY[0x24BDAC760];
      v28[1] = 3221225472;
      v28[2] = __58__SAUIElementViewAccessibility_accessibilityCustomActions__block_invoke;
      v28[3] = &unk_25039C888;
      v10 = v6;
      v29 = v10;
      v11 = (void *)objc_msgSend(v7, "initWithName:actionHandler:", v8, v28);

      v12 = objc_alloc(MEMORY[0x24BDF6788]);
      accessibilityLocalizedString(CFSTR("window.diminish"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v26[0] = v9;
      v26[1] = 3221225472;
      v26[2] = __58__SAUIElementViewAccessibility_accessibilityCustomActions__block_invoke_3;
      v26[3] = &unk_25039C888;
      v14 = v10;
      v27 = v14;
      v15 = (void *)objc_msgSend(v12, "initWithName:actionHandler:", v13, v26);

      v16 = objc_alloc(MEMORY[0x24BDF6788]);
      accessibilityLocalizedString(CFSTR("window.dismiss"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v24[0] = v9;
      v24[1] = 3221225472;
      v24[2] = __58__SAUIElementViewAccessibility_accessibilityCustomActions__block_invoke_6;
      v24[3] = &unk_25039C888;
      v18 = v14;
      v25 = v18;
      v19 = (void *)objc_msgSend(v16, "initWithName:actionHandler:", v17, v24);

      if (objc_msgSend(v18, "safeIntForKey:", CFSTR("layoutMode")) == 1
        || objc_msgSend(v18, "safeIntForKey:", CFSTR("layoutMode")) == 2)
      {
        v31[0] = v11;
        v31[1] = v19;
        v20 = (void *)MEMORY[0x24BDBCE30];
        v21 = (void **)v31;
        v22 = 2;
      }
      else
      {
        if (objc_msgSend(v18, "safeIntForKey:", CFSTR("layoutMode")) != 3)
        {
          v4 = (void *)MEMORY[0x24BDBD1A8];
          goto LABEL_8;
        }
        v30 = v15;
        v20 = (void *)MEMORY[0x24BDBCE30];
        v21 = &v30;
        v22 = 1;
      }
      objc_msgSend(v20, "arrayWithObjects:count:", v21, v22);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_8:

      goto LABEL_9;
    }
  }
  v4 = 0;
LABEL_9:

  return v4;
}

BOOL __58__SAUIElementViewAccessibility_accessibilityCustomActions__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  int v4;
  id v6;
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  char v10;

  v3 = a2;
  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 0;
  v6 = *(id *)(a1 + 32);
  AXPerformSafeBlock();
  v4 = *((unsigned __int8 *)v8 + 24);

  _Block_object_dispose(&v7, 8);
  if (!UIAccessibilityIsVoiceOverRunning())
    UIAccessibilityPostNotification(*MEMORY[0x24BDF7328], 0);

  return v4 != 0;
}

uint64_t __58__SAUIElementViewAccessibility_accessibilityCustomActions__block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "_expandToCustomLayoutModeFromUserActionIfPossible");
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

uint64_t __58__SAUIElementViewAccessibility_accessibilityCustomActions__block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  char v11;

  v3 = a2;
  v8 = 0;
  v9 = &v8;
  v10 = 0x2020000000;
  v11 = 0;
  v7 = *(id *)(a1 + 32);
  AXPerformSafeBlock();
  v4 = *((unsigned __int8 *)v9 + 24);

  _Block_object_dispose(&v8, 8);
  v6 = *(id *)(a1 + 32);
  AXPerformBlockOnMainThreadAfterDelay();

  return v4;
}

uint64_t __58__SAUIElementViewAccessibility_accessibilityCustomActions__block_invoke_4(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "_axCollapseIfExpandedByUserInteraction");
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

void __58__SAUIElementViewAccessibility_accessibilityCustomActions__block_invoke_5(uint64_t a1)
{
  UIAccessibilityNotifications v1;
  id v2;

  v1 = *MEMORY[0x24BDF72C8];
  objc_msgSend(*(id *)(a1 + 32), "safeValueForKey:", CFSTR("_containerView"));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  UIAccessibilityPostNotification(v1, v2);

}

uint64_t __58__SAUIElementViewAccessibility_accessibilityCustomActions__block_invoke_6(uint64_t a1)
{
  id v2;

  v2 = *(id *)(a1 + 32);
  AXPerformSafeBlock();

  return 1;
}

void __58__SAUIElementViewAccessibility_accessibilityCustomActions__block_invoke_7(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "_axRequestDiminishment");
  v2 = *(id *)(a1 + 32);
  AXPerformBlockOnMainThreadAfterDelay();

}

void __58__SAUIElementViewAccessibility_accessibilityCustomActions__block_invoke_8(uint64_t a1)
{
  UIAccessibilityNotifications v1;
  id v2;

  v1 = *MEMORY[0x24BDF72C8];
  objc_msgSend(*(id *)(a1 + 32), "safeValueForKey:", CFSTR("_containerView"));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  UIAccessibilityPostNotification(v1, v2);

}

- (BOOL)accessibilityPerformEscape
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  BOOL v7;
  id v8;
  id v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  char v14;

  -[SAUIElementViewAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("superview"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_accessibilityViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v4, "safeIntForKey:", CFSTR("layoutMode")) == 3)
  {
    -[SAUIElementViewAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("superview"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "_accessibilityViewController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = 0;
    v12 = &v11;
    v13 = 0x2020000000;
    v14 = 0;
    v10 = v6;
    AXPerformSafeBlock();
    v7 = *((_BYTE *)v12 + 24) != 0;

    _Block_object_dispose(&v11, 8);
    v8 = v10;
    AXPerformBlockOnMainThreadAfterDelay();

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

uint64_t __58__SAUIElementViewAccessibility_accessibilityPerformEscape__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "_axCollapseIfExpandedByUserInteraction");
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

void __58__SAUIElementViewAccessibility_accessibilityPerformEscape__block_invoke_2(uint64_t a1)
{
  UIAccessibilityNotifications v1;
  id v2;

  v1 = *MEMORY[0x24BDF72C8];
  objc_msgSend(*(id *)(a1 + 32), "safeValueForKey:", CFSTR("_containerView"));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  UIAccessibilityPostNotification(v1, v2);

}

- (id)accessibilityPath
{
  void *v3;
  void *v4;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  CGFloat v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  double v16;
  double v17;
  uint64_t v18;
  void *v19;
  double v21;
  double v22;
  double v23;
  objc_super v24;
  CGRect v25;
  CGRect v26;
  CGRect v27;
  CGRect v28;
  CGRect v29;

  -[SAUIElementViewAccessibility _accessibilityContainerView](self, "_accessibilityContainerView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "accessibilityFrame");
    x = v25.origin.x;
    y = v25.origin.y;
    width = v25.size.width;
    height = v25.size.height;
    v26 = CGRectInset(v25, -5.0, -5.0);
    v21 = v26.size.height;
    v9 = v26.origin.x;
    v23 = v26.origin.x;
    v10 = v26.origin.y;
    v11 = v26.size.width;
    v12 = CGRectGetWidth(v26);
    v27.origin.x = x;
    v27.origin.y = y;
    v27.size.width = width;
    v27.size.height = height;
    v22 = v12 / CGRectGetWidth(v27);
    v28.origin.x = v9;
    v28.origin.y = v10;
    v28.size.width = v11;
    v28.size.height = v21;
    v13 = CGRectGetHeight(v28);
    v29.origin.x = x;
    v29.origin.y = y;
    v29.size.width = width;
    v29.size.height = height;
    v14 = v13 / CGRectGetHeight(v29);
    objc_msgSend(v4, "layer");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "cornerRadius");
    v17 = fmax(v22, v14) * v16;

    objc_msgSend(MEMORY[0x24BDF6870], "_bezierPathWithArcRoundedRect:cornerRadius:", v23, v10, v11, v21, v17);
    v18 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v24.receiver = self;
    v24.super_class = (Class)SAUIElementViewAccessibility;
    -[SAUIElementViewAccessibility accessibilityPath](&v24, sel_accessibilityPath);
    v18 = objc_claimAutoreleasedReturnValue();
  }
  v19 = (void *)v18;

  return v19;
}

- (id)_viewToAddFocusLayer
{
  void *v2;
  void *v3;

  -[SAUIElementViewAccessibility _accessibilityContainerView](self, "_accessibilityContainerView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "superview");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)_accessibilityContainerView
{
  return (id)-[SAUIElementViewAccessibility _accessibilityViewAncestorIsKindOf:](self, "_accessibilityViewAncestorIsKindOf:", MEMORY[0x234921524](CFSTR("SBSystemApertureContainerView"), a2));
}

- (id)automationElements
{
  void *v2;
  void *v3;

  objc_opt_class();
  __UIAccessibilityCastAsClass();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "subviews");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (int64_t)_accessibilitySortPriority
{
  objc_super v4;

  if (UIAccessibilityIsSwitchControlRunning())
    return 1000;
  v4.receiver = self;
  v4.super_class = (Class)SAUIElementViewAccessibility;
  return -[SAUIElementViewAccessibility _accessibilitySortPriority](&v4, sel__accessibilitySortPriority);
}

- (BOOL)accessibilityActivate
{
  void *v2;

  -[SAUIElementViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("elementViewProvider"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  MEMORY[0x234921524](CFSTR("SBFlashlightActivityElement"));
  if ((objc_opt_isKindOfClass() & 1) != 0)
    UIAccessibilityPostNotification(*MEMORY[0x24BDF7328], 0);

  return 1;
}

- (BOOL)_accessibilityHitTestShouldFallbackToNearestChild
{
  return 1;
}

- (BOOL)_accessibilityIsJindo
{
  return 1;
}

@end
