@implementation CFXCaptureViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("CFXCaptureViewController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CFXCaptureViewController"), CFSTR("CFX_addEffect:allowImmediateTextEditing:"), "v", "@", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CFXCaptureViewController"), CFSTR("displayEffectEditorForEffect:forMode:"), "v", "@", "Q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CFXCaptureViewController"), CFSTR("removeEffectEditorAnimated:"), "v", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CFXCaptureViewController"), CFSTR("effectEditorView:didRemoveEffect:"), "v", "@", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CFXCaptureViewController"), CFSTR("fullScreenTextEditViewController:didFinishEditingByRemovingEffect:"), "v", "@", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CFXCaptureViewController"), CFSTR("effectEditor"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CFXCaptureViewController"), CFSTR("presentFullScreenTextEditorForEffect:insertingEffect:"), "B", "@", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CFXCaptureViewController"), CFSTR("liveCaptureContainer"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CFXCaptureViewController"), CFSTR("composition"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CFXEffectComposition"), CFSTR("jtEffects"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CFXEffect"), CFSTR("jtEffect"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("JFXEffect"), CFSTR("type"), "i", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("JFXOverlayEffect"), CFSTR("trackingProps"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("JFXEffect"), CFSTR("accessibilityName"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("JFXEffect"), CFSTR("effectParameters"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("JFXTextEffect"), CFSTR("strings"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CFXEffectEditorView"), CFSTR("CFX_scaleEffect:"), "v", "d", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CFXEffectEditorView"), CFSTR("CFX_rotateEffect:"), "v", "d", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CFXEffectEditorView"), CFSTR("CFX_removeEffect"), "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("JFXOverlayEffect"), CFSTR("imageFrameAtTime:forcePosterFrame:includeDropShadow:relativeTo:basisOrigin:"), "{?=qiIq}", "B", "B", "{CGRect={CGPoint=dd}{CGSize=dd}}", "i", 0);
  objc_msgSend(v3, "validateClass:hasClassMethod:withFullSignature:", CFSTR("JFXEffectEditingUtilities"), CFSTR("canEditTextForEffect:"), "B", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("JFXTrackedEffectProperties"), CFSTR("trackingType"), "q", 0);

}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  _QWORD v7[5];
  _QWORD v8[4];
  id v9;
  _QWORD v10[4];
  id v11;
  id location;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)CFXCaptureViewControllerAccessibility;
  -[CFXCaptureViewControllerAccessibility _accessibilityLoadAccessibilityInformation](&v13, sel__accessibilityLoadAccessibilityInformation);
  -[CFXCaptureViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("liveCaptureContainer"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAccessibilityIdentifier:", CFSTR("AXCFXViewFinder"));
  objc_initWeak(&location, self);
  v4 = MEMORY[0x24BDAC760];
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __83__CFXCaptureViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke;
  v10[3] = &unk_2501A9FD8;
  objc_copyWeak(&v11, &location);
  objc_msgSend(v3, "_setIsAccessibilityElementBlock:", v10);
  accessibilityLocalizedString(CFSTR("viewfinder.label"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAccessibilityLabel:", v5);

  v8[0] = v4;
  v8[1] = 3221225472;
  v8[2] = __83__CFXCaptureViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_2;
  v8[3] = &unk_2501A9E08;
  objc_copyWeak(&v9, &location);
  objc_msgSend(v3, "_setAccessibilityValueBlock:", v8);
  -[CFXCaptureViewControllerAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("view"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = v4;
  v7[1] = 3221225472;
  v7[2] = __83__CFXCaptureViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_3;
  v7[3] = &unk_2501AA0B0;
  v7[4] = self;
  objc_msgSend(v6, "_setAccessibilityElementsHiddenBlock:", v7);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);

}

uint64_t __83__CFXCaptureViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke(uint64_t a1)
{
  id WeakRetained;
  uint64_t v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = objc_msgSend(WeakRetained, "_axIsFaceTime") ^ 1;

  return v2;
}

id __83__CFXCaptureViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  __CFString *v32;
  void *v33;
  char v35;
  void *v36;
  void *v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  char v45;
  _BYTE v46[128];
  uint64_t v47;

  v47 = *MEMORY[0x24BDAC8D0];
  v45 = 0;
  objc_opt_class();
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "safeValueForKeyPath:", CFSTR("composition.jtEffects"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v41 = 0u;
  v42 = 0u;
  v43 = 0u;
  v44 = 0u;
  v5 = v4;
  v6 = (void *)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v41, v46, 16);
  v36 = v5;
  if (!v6)
  {
    v26 = v5;
    v25 = 0;
    v9 = 0;
    v27 = 0;
    v24 = 0;
    v28 = 0;
    goto LABEL_36;
  }
  v35 = 0;
  v37 = 0;
  v7 = 0;
  v8 = 0;
  v9 = 0;
  v10 = *(_QWORD *)v42;
LABEL_3:
  v11 = 0;
  while (2)
  {
    if (*(_QWORD *)v42 != v10)
      objc_enumerationMutation(v5);
    v12 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * v11);
    switch(objc_msgSend(v12, "safeIntForKey:", CFSTR("type")))
    {
      case 1u:
      case 8u:
        objc_msgSend(v12, "safeValueForKeyPath:", CFSTR("accessibilityName"));
        v13 = v9;
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_20;
      case 2u:
        v8 = (v8 + 1);
        objc_msgSend(v12, "safeValueForKey:", CFSTR("trackingProps"));
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v13, "safeIntForKey:", CFSTR("trackingType")))
          v7 = (v7 + 1);
        else
          v7 = v7;
        goto LABEL_20;
      case 7u:
        v38 = v8;
        v39 = v7;
        v40 = v9;
        objc_msgSend(v12, "safeValueForKey:", CFSTR("effectID"));
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_alloc_init(MEMORY[0x24BE0B4B0]);
        objc_msgSend(MEMORY[0x24BE0B480], "requestForAvatarWithIdentifier:", v13);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "avatarsForFetchRequest:error:", v15, 0);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "firstObject");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        if (v17)
        {
          objc_msgSend(MEMORY[0x24BE0B4A0], "avatarForRecord:", v17);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v18 = 0;
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(MEMORY[0x24BDFFA88], "descriptionForAnimoji:", v18);
          v19 = objc_claimAutoreleasedReturnValue();
        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
            goto LABEL_19;
          objc_msgSend(MEMORY[0x24BDFFA88], "descriptionForMemoji:", v18);
          v19 = objc_claimAutoreleasedReturnValue();
          v35 = 1;
        }

        v37 = (void *)v19;
        v5 = v36;
LABEL_19:

        v7 = v39;
        v9 = v40;
        v8 = v38;
LABEL_20:

LABEL_21:
        if (v6 != (void *)++v11)
          continue;
        v6 = (void *)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v41, v46, 16);
        if (v6)
          goto LABEL_3;

        if ((int)v8 < 1)
        {
          v6 = 0;
LABEL_29:
          v24 = 0;
          if (!v9)
            goto LABEL_26;
          goto LABEL_30;
        }
        v20 = (void *)MEMORY[0x24BDD17C8];
        accessibilityLocalizedString(CFSTR("stickers.count"));
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "localizedStringWithFormat:", v21, v8);
        v6 = (void *)objc_claimAutoreleasedReturnValue();

        if ((int)v7 < 1)
          goto LABEL_29;
        v22 = (void *)MEMORY[0x24BDD17C8];
        accessibilityLocalizedString(CFSTR("tracked.stickers.count"));
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "localizedStringWithFormat:", v23, v7);
        v24 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v9)
        {
LABEL_26:
          v25 = 0;
          goto LABEL_31;
        }
LABEL_30:
        v29 = (void *)MEMORY[0x24BDD17C8];
        accessibilityLocalizedString(CFSTR("filter.name"));
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "localizedStringWithFormat:", v30, v9);
        v25 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_31:
        if (!v37)
        {
          v27 = 0;
          v28 = 0;
          goto LABEL_38;
        }
        v31 = (void *)MEMORY[0x24BDD17C8];
        if ((v35 & 1) != 0)
          v32 = CFSTR("memoji.name");
        else
          v32 = CFSTR("animoji.name");
        accessibilityLocalizedString(v32);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "localizedStringWithFormat:", v26, v37);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = v37;
LABEL_36:

LABEL_38:
        __UIAXStringForVariables();
        v33 = (void *)objc_claimAutoreleasedReturnValue();

        return v33;
      default:
        goto LABEL_21;
    }
  }
}

uint64_t __83__CFXCaptureViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_axFaceTimeLocalViewExpanded") ^ 1;
}

- (void)viewDidLoad
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CFXCaptureViewControllerAccessibility;
  -[CFXCaptureViewControllerAccessibility viewDidLoad](&v3, sel_viewDidLoad);
  -[CFXCaptureViewControllerAccessibility _accessibilityLoadAccessibilityInformation](self, "_accessibilityLoadAccessibilityInformation");
}

- (id)_axEffectToElement
{
  JUMPOUT(0x234909C58);
}

- (void)_axSetEffectToElement:(id)a3
{
  __UIAccessibilitySetAssociatedObject();
}

- (void)CFX_addEffect:(id)a3 allowImmediateTextEditing:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  objc_super v18;

  v4 = a4;
  v6 = a3;
  v18.receiver = self;
  v18.super_class = (Class)CFXCaptureViewControllerAccessibility;
  -[CFXCaptureViewControllerAccessibility CFX_addEffect:allowImmediateTextEditing:](&v18, sel_CFX_addEffect_allowImmediateTextEditing_, v6, v4);
  -[CFXCaptureViewControllerAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("view"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "safeValueForKey:", CFSTR("jtEffect"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[AXCFXElementUtilities sharedInstance](AXCFXElementUtilities, "sharedInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  __UIAccessibilityCastAsClass();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "axElementForJTEffect:vc:", v8, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  -[CFXCaptureViewControllerAccessibility _axEffectToElement](self, "_axEffectToElement");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v12)
  {
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[CFXCaptureViewControllerAccessibility _axSetEffectToElement:](self, "_axSetEffectToElement:", v13);

  }
  if (v11)
  {
    objc_msgSend(MEMORY[0x24BDD1968], "valueWithNonretainedObject:", v8);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[CFXCaptureViewControllerAccessibility _axEffectToElement](self, "_axEffectToElement");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setObject:forKey:", v11, v14);

  }
  -[CFXCaptureViewControllerAccessibility _axEffectToElement](self, "_axEffectToElement");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "allValues");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_accessibilitySetAdditionalElements:", v17);

}

- (void)_axRemoveEffectFromView:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  objc_msgSend(a3, "safeValueForKey:", CFSTR("jtEffect"));
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1968], "valueWithNonretainedObject:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CFXCaptureViewControllerAccessibility _axEffectToElement](self, "_axEffectToElement");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[CFXCaptureViewControllerAccessibility _axEffectToElement](self, "_axEffectToElement");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "removeObjectForKey:", v4);

    -[CFXCaptureViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("view"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[CFXCaptureViewControllerAccessibility _axEffectToElement](self, "_axEffectToElement");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "allValues");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "_accessibilitySetAdditionalElements:", v10);

  }
}

- (void)effectEditorView:(id)a3 didRemoveEffect:(id)a4
{
  id v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CFXCaptureViewControllerAccessibility;
  v6 = a4;
  -[CFXCaptureViewControllerAccessibility effectEditorView:didRemoveEffect:](&v7, sel_effectEditorView_didRemoveEffect_, a3, v6);
  -[CFXCaptureViewControllerAccessibility _axRemoveEffectFromView:](self, "_axRemoveEffectFromView:", v6, v7.receiver, v7.super_class);

}

- (void)fullScreenTextEditViewController:(id)a3 didFinishEditingByRemovingEffect:(id)a4
{
  id v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CFXCaptureViewControllerAccessibility;
  v6 = a4;
  -[CFXCaptureViewControllerAccessibility fullScreenTextEditViewController:didFinishEditingByRemovingEffect:](&v7, sel_fullScreenTextEditViewController_didFinishEditingByRemovingEffect_, a3, v6);
  -[CFXCaptureViewControllerAccessibility _axRemoveEffectFromView:](self, "_axRemoveEffectFromView:", v6, v7.receiver, v7.super_class);

}

- (BOOL)_axIsFaceTime
{
  void *v2;
  void *v3;

  -[CFXCaptureViewControllerAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("view"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_accessibilityFindAncestor:startWithSelf:", &__block_literal_global_3, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3 != 0;
}

uint64_t __54__CFXCaptureViewControllerAccessibility__axIsFaceTime__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  char isKindOfClass;

  v2 = a2;
  MEMORY[0x234909C04](CFSTR("PHInCallRootView"));
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (BOOL)_axFaceTimeLocalViewExpanded
{
  void *v2;
  BOOL v3;
  void *v4;
  void *v5;
  void *v6;

  -[CFXCaptureViewControllerAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("view"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = 1;
  objc_msgSend(v2, "_accessibilityFindAncestor:startWithSelf:", &__block_literal_global_297, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_accessibilityViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "safeValueForKey:", CFSTR("accessibilityConstraintController"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
    v3 = objc_msgSend(v6, "safeIntegerForKey:", CFSTR("localParticipantState")) == 2;

  return v3;
}

uint64_t __69__CFXCaptureViewControllerAccessibility__axFaceTimeLocalViewExpanded__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  char isKindOfClass;

  objc_msgSend(a2, "_accessibilityViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  MEMORY[0x234909C04](CFSTR("CNKFaceTimeMultiwayConversationViewController"));
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

@end
