@implementation CFXPreviewViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("CFXPreviewViewController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CFXPreviewViewController"), CFSTR("CFX_addEffect:"), "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CFXPreviewViewController"), CFSTR("displayEffectEditorForEffect:forMode:"), "v", "@", "Q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CFXPreviewViewController"), CFSTR("removeEffectEditor"), "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CFXPreviewViewController"), CFSTR("effectEditorView:didRemoveEffect:"), "v", "@", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CFXPreviewViewController"), CFSTR("fullScreenTextEditViewController:didFinishEditingByRemovingEffect:"), "v", "@", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CFXPreviewViewController"), CFSTR("effectEditor"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CFXPreviewViewController"), CFSTR("previewClip"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CFXPreviewViewController"), CFSTR("presentFullScreenTextEditorForEffect:insertingEffect:"), "B", "@", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CFXPreviewViewController"), CFSTR("playerContainerView"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CFXClip"), CFSTR("effectStack"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CFXClip"), CFSTR("isVideo"), "B", 0);

}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  void *v4;
  int v5;
  __CFString *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id obj;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  char v31;
  objc_super v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v32.receiver = self;
  v32.super_class = (Class)CFXPreviewViewControllerAccessibility;
  -[CFXPreviewViewControllerAccessibility _accessibilityLoadAccessibilityInformation](&v32, sel__accessibilityLoadAccessibilityInformation);
  -[CFXPreviewViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("playerContainerView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setIsAccessibilityElement:", 1);
  -[CFXPreviewViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("previewClip"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "safeBoolForKey:", CFSTR("isVideo"));

  if (v5)
    v6 = CFSTR("preview.clip.video");
  else
    v6 = CFSTR("preview.clip.image");
  accessibilityLocalizedString(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAccessibilityLabel:", v7);

  v31 = 0;
  objc_opt_class();
  -[CFXPreviewViewControllerAccessibility safeValueForKeyPath:](self, "safeValueForKeyPath:", CFSTR("previewClip.effectStack"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[CFXPreviewViewControllerAccessibility _axEffectToElement](self, "_axEffectToElement");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v10)
  {
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[CFXPreviewViewControllerAccessibility _axSetEffectToElement:](self, "_axSetEffectToElement:", v11);

  }
  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  obj = v9;
  v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v33, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v28;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v28 != v14)
          objc_enumerationMutation(obj);
        v16 = *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * i);
        +[AXCFXElementUtilities sharedInstance](AXCFXElementUtilities, "sharedInstance");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = 0;
        objc_opt_class();
        __UIAccessibilityCastAsClass();
        v18 = objc_claimAutoreleasedReturnValue();
        if (v31)
          abort();
        v19 = (void *)v18;
        objc_msgSend(v17, "axElementForJTEffect:vc:", v16, v18);
        v20 = (void *)objc_claimAutoreleasedReturnValue();

        if (v20)
        {
          objc_msgSend(MEMORY[0x24BDD1968], "valueWithNonretainedObject:", v16);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          -[CFXPreviewViewControllerAccessibility _axEffectToElement](self, "_axEffectToElement");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "setObject:forKey:", v20, v21);

        }
      }
      v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v33, 16);
    }
    while (v13);
  }

  -[CFXPreviewViewControllerAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("view"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[CFXPreviewViewControllerAccessibility _axEffectToElement](self, "_axEffectToElement");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "allValues");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "_accessibilitySetAdditionalElements:", v25);

  UIAccessibilityPostNotification(*MEMORY[0x24BDF72C8], 0);
}

- (void)viewDidLayoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CFXPreviewViewControllerAccessibility;
  -[CFXPreviewViewControllerAccessibility viewDidLayoutSubviews](&v3, sel_viewDidLayoutSubviews);
  -[CFXPreviewViewControllerAccessibility _accessibilityLoadAccessibilityInformation](self, "_accessibilityLoadAccessibilityInformation");
}

- (id)_axEffectToElement
{
  JUMPOUT(0x234909C58);
}

- (void)_axSetEffectToElement:(id)a3
{
  __UIAccessibilitySetAssociatedObject();
}

- (void)CFX_addEffect:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  objc_super v16;

  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)CFXPreviewViewControllerAccessibility;
  -[CFXPreviewViewControllerAccessibility CFX_addEffect:](&v16, sel_CFX_addEffect_, v4);
  -[CFXPreviewViewControllerAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("view"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "safeValueForKey:", CFSTR("jtEffect"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[AXCFXElementUtilities sharedInstance](AXCFXElementUtilities, "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  __UIAccessibilityCastAsClass();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "axElementForJTEffect:vc:", v6, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[CFXPreviewViewControllerAccessibility _axEffectToElement](self, "_axEffectToElement");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v10)
  {
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[CFXPreviewViewControllerAccessibility _axSetEffectToElement:](self, "_axSetEffectToElement:", v11);

  }
  if (v9)
  {
    objc_msgSend(MEMORY[0x24BDD1968], "valueWithNonretainedObject:", v6);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[CFXPreviewViewControllerAccessibility _axEffectToElement](self, "_axEffectToElement");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setObject:forKey:", v9, v12);

  }
  -[CFXPreviewViewControllerAccessibility _axEffectToElement](self, "_axEffectToElement");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "allValues");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_accessibilitySetAdditionalElements:", v15);

  UIAccessibilityPostNotification(*MEMORY[0x24BDF72C8], 0);
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
  -[CFXPreviewViewControllerAccessibility _axEffectToElement](self, "_axEffectToElement");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[CFXPreviewViewControllerAccessibility _axEffectToElement](self, "_axEffectToElement");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "removeObjectForKey:", v4);

    -[CFXPreviewViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("view"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[CFXPreviewViewControllerAccessibility _axEffectToElement](self, "_axEffectToElement");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "allValues");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "_accessibilitySetAdditionalElements:", v10);

  }
  UIAccessibilityPostNotification(*MEMORY[0x24BDF72C8], 0);

}

- (void)effectEditorView:(id)a3 didRemoveEffect:(id)a4
{
  id v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CFXPreviewViewControllerAccessibility;
  v6 = a4;
  -[CFXPreviewViewControllerAccessibility effectEditorView:didRemoveEffect:](&v7, sel_effectEditorView_didRemoveEffect_, a3, v6);
  -[CFXPreviewViewControllerAccessibility _axRemoveEffectFromView:](self, "_axRemoveEffectFromView:", v6, v7.receiver, v7.super_class);

}

- (void)fullScreenTextEditViewController:(id)a3 didFinishEditingByRemovingEffect:(id)a4
{
  id v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CFXPreviewViewControllerAccessibility;
  v6 = a4;
  -[CFXPreviewViewControllerAccessibility fullScreenTextEditViewController:didFinishEditingByRemovingEffect:](&v7, sel_fullScreenTextEditViewController_didFinishEditingByRemovingEffect_, a3, v6);
  -[CFXPreviewViewControllerAccessibility _axRemoveEffectFromView:](self, "_axRemoveEffectFromView:", v6, v7.receiver, v7.super_class);

}

@end
