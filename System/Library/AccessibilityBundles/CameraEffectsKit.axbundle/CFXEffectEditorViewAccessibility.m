@implementation CFXEffectEditorViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("CFXEffectEditorView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CFXEffectEditorView"), CFSTR("removeButton"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CFXEffectEditorView"), CFSTR("isTextEditing"), "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CFXEffectEditorView"), CFSTR("CFX_endTextEditing:"), "v", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CFXEffectEditorView"), CFSTR("CFX_beginTextEditing"), "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CFXEffectEditorView"), CFSTR("CFX_removeEffect"), "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CFXEffectEditorView"), CFSTR("endEditingAnimated:withCompletionBlock:"), "v", "B", "@?", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CFXEffectEditorView"), CFSTR("tapRemoveButton:"), "v", "@", 0);
  objc_msgSend(v3, "validateClass:", CFSTR("CFXFullScreenTextEditViewController"));
  objc_msgSend(v3, "validateClass:", CFSTR("CFXCameraViewController"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CFXCameraViewController"), CFSTR("captureViewController"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CFXCameraViewController"), CFSTR("effectBrowserViewController"), "@", 0);

}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CFXEffectEditorViewAccessibility;
  -[CFXEffectEditorViewAccessibility _accessibilityLoadAccessibilityInformation](&v6, sel__accessibilityLoadAccessibilityInformation);
  -[CFXEffectEditorViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("removeButton"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setIsAccessibilityElement:", 0);

  -[CFXEffectEditorViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("removeButton"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  accessibilityLocalizedString(CFSTR("close.button"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAccessibilityLabel:", v5);

}

- (BOOL)accessibilityPerformEscape
{
  UIAccessibilityNotifications v3;
  void *v4;
  objc_super v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t);
  void *v10;
  CFXEffectEditorViewAccessibility *v11;

  if (-[CFXEffectEditorViewAccessibility safeBoolForKey:](self, "safeBoolForKey:", CFSTR("isTextEditing")))
  {
    v3 = *MEMORY[0x24BDF71E8];
    accessibilityLocalizedString(CFSTR("text.inserted"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    UIAccessibilityPostNotification(v3, v4);

    v7 = MEMORY[0x24BDAC760];
    v8 = 3221225472;
    v9 = __62__CFXEffectEditorViewAccessibility_accessibilityPerformEscape__block_invoke;
    v10 = &unk_2501A9EE8;
    v11 = self;
    AXPerformSafeBlock();
    return 1;
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)CFXEffectEditorViewAccessibility;
    return -[CFXEffectEditorViewAccessibility accessibilityPerformEscape](&v6, sel_accessibilityPerformEscape);
  }
}

uint64_t __62__CFXEffectEditorViewAccessibility_accessibilityPerformEscape__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "endEditingAnimated:withCompletionBlock:", 1, 0);
}

- (void)viewDidLoad
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CFXEffectEditorViewAccessibility;
  -[CFXEffectEditorViewAccessibility viewDidLoad](&v3, sel_viewDidLoad);
  -[CFXEffectEditorViewAccessibility _accessibilityLoadAccessibilityInformation](self, "_accessibilityLoadAccessibilityInformation");
}

- (id)_axParentElements
{
  JUMPOUT(0x234909C58);
}

- (void)_axSetParentElements:(id)a3
{
  __UIAccessibilitySetAssociatedObject();
}

- (id)_axParentView
{
  JUMPOUT(0x234909C58);
}

- (void)_axSetParentView:(id)a3
{
  __UIAccessibilitySetAssociatedObject();
}

- (void)CFX_beginTextEditing
{
  id v3;
  void *v4;
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
  CFXEffectEditorViewAccessibility *v17;
  void *v18;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x24BDAC8D0];
  v16.receiver = self;
  v16.super_class = (Class)CFXEffectEditorViewAccessibility;
  -[CFXEffectEditorViewAccessibility CFX_beginTextEditing](&v16, sel_CFX_beginTextEditing);
  if (-[CFXEffectEditorViewAccessibility safeBoolForKey:](self, "safeBoolForKey:", CFSTR("isTextEditing")))
  {
    v3 = objc_alloc(MEMORY[0x24BDF6788]);
    accessibilityLocalizedString(CFSTR("close.button"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(v3, "initWithName:target:selector:", v4, self, sel_tapRemoveButton_);

    v19[0] = v5;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v19, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF67A0]), "initWithAccessibilityContainer:", self);
    -[CFXEffectEditorViewAccessibility accessibilityFrame](self, "accessibilityFrame");
    objc_msgSend(v7, "setAccessibilityFrame:");
    objc_msgSend(v7, "setAccessibilityCustomActions:", v6);
    objc_msgSend(v7, "setAccessibilityTraits:", *MEMORY[0x24BDF73B0]);
    accessibilityLocalizedString(CFSTR("done.editing"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setAccessibilityLabel:", v8);

    accessibilityLocalizedString(CFSTR("done.editing.hint"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setAccessibilityHint:", v9);

    -[CFXEffectEditorViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("removeButton"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setIsAccessibilityElement:", 1);

    v18 = v7;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v18, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[CFXEffectEditorViewAccessibility _accessibilitySetAdditionalElements:](self, "_accessibilitySetAdditionalElements:", v11);

    -[CFXEffectEditorViewAccessibility _accessibilityFindAncestor:startWithSelf:](self, "_accessibilityFindAncestor:startWithSelf:", &__block_literal_global_2, 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v12;
    if (v12)
    {
      objc_msgSend(v12, "_accessibilityAdditionalElements");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[CFXEffectEditorViewAccessibility _axSetParentElements:](self, "_axSetParentElements:", v14);

      -[CFXEffectEditorViewAccessibility _axSetParentView:](self, "_axSetParentView:", v13);
    }
    objc_msgSend(v13, "_accessibilitySetAdditionalElements:", 0);
    v17 = self;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v17, 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setAccessibilityElements:", v15);

    UIAccessibilityPostNotification(*MEMORY[0x24BDF7328], 0);
  }
}

uint64_t __56__CFXEffectEditorViewAccessibility_CFX_beginTextEditing__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  char isKindOfClass;
  void *v5;

  v2 = a2;
  objc_msgSend(v2, "_accessibilityViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  MEMORY[0x234909C04](CFSTR("CFXCaptureViewController"));
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    isKindOfClass = 1;
  }
  else
  {
    objc_msgSend(v2, "_accessibilityViewController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    MEMORY[0x234909C04](CFSTR("CFXPreviewViewController"));
    isKindOfClass = objc_opt_isKindOfClass();

  }
  return isKindOfClass & 1;
}

- (void)CFX_removeEffect
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v7;

  if (-[CFXEffectEditorViewAccessibility safeBoolForKey:](self, "safeBoolForKey:", CFSTR("isTextEditing")))
  {
    -[CFXEffectEditorViewAccessibility _axParentView](self, "_axParentView");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (v3)
    {
      -[CFXEffectEditorViewAccessibility _axParentView](self, "_axParentView");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setAccessibilityElements:", 0);

      -[CFXEffectEditorViewAccessibility _axParentView](self, "_axParentView");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[CFXEffectEditorViewAccessibility _axParentElements](self, "_axParentElements");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "_accessibilitySetAdditionalElements:", v6);

      -[CFXEffectEditorViewAccessibility _axSetParentView:](self, "_axSetParentView:", 0);
    }
  }
  v7.receiver = self;
  v7.super_class = (Class)CFXEffectEditorViewAccessibility;
  -[CFXEffectEditorViewAccessibility CFX_removeEffect](&v7, sel_CFX_removeEffect);
}

- (void)CFX_endTextEditing:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v10;

  v3 = a3;
  if (-[CFXEffectEditorViewAccessibility safeBoolForKey:](self, "safeBoolForKey:", CFSTR("isTextEditing")))
  {
    -[CFXEffectEditorViewAccessibility _accessibilitySetAdditionalElements:](self, "_accessibilitySetAdditionalElements:", 0);
    -[CFXEffectEditorViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("removeButton"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setIsAccessibilityElement:", 0);

    v10.receiver = self;
    v10.super_class = (Class)CFXEffectEditorViewAccessibility;
    -[CFXEffectEditorViewAccessibility CFX_endTextEditing:](&v10, sel_CFX_endTextEditing_, v3);
    -[CFXEffectEditorViewAccessibility _axParentView](self, "_axParentView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      -[CFXEffectEditorViewAccessibility _axParentView](self, "_axParentView");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setAccessibilityElements:", 0);

      -[CFXEffectEditorViewAccessibility _axParentView](self, "_axParentView");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[CFXEffectEditorViewAccessibility _axParentElements](self, "_axParentElements");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "_accessibilitySetAdditionalElements:", v9);

    }
    UIAccessibilityPostNotification(*MEMORY[0x24BDF7328], 0);
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)CFXEffectEditorViewAccessibility;
    -[CFXEffectEditorViewAccessibility CFX_endTextEditing:](&v10, sel_CFX_endTextEditing_, v3);
  }
}

@end
