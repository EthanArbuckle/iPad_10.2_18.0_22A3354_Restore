@implementation PREditingReticleViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("PREditingReticleView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (id)_accessibilityGetRemoteElement
{
  JUMPOUT(0x23491A3CCLL);
}

- (void)_accessibilitySetRemoteElement:(id)a3
{
  __UIAccessibilitySetAssociatedObject();
}

- (id)_axPosterEditorViewController
{
  JUMPOUT(0x23491A3CCLL);
}

- (void)_axSetPosterEditorViewController:(id)a3
{
  __UIAccessibilitySetAssociatedObject();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("UIScene"), CFSTR("_FBSScene"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("FBSScene"), CFSTR("hostProcess"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("FBSProcess"), CFSTR("pid"), "i", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PREditorRootViewController"), CFSTR("isComplicationsRowConfigured"), "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PREditorRootViewController"), CFSTR("isComplicationSidebarConfigured"), "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PREditorRootViewController"), CFSTR("complicationHostViewController"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PREditorRootViewController"), CFSTR("complicationRowEmptyStateView"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PREditorRootViewController"), CFSTR("complicationSidebarEmptyStateView"), "@", 0);

}

- (id)_accessibilityAXAttributedLabel
{
  void *v3;
  __CFString *v4;
  uint64_t v5;
  void *v6;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  objc_super v13;

  -[PREditingReticleViewAccessibility accessibilityIdentifier](self, "accessibilityIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("grouped-widgets-reticle-view")) & 1) != 0
    || objc_msgSend(v3, "isEqualToString:", CFSTR("grouped-widgets-reticle-sidebar-view")))
  {
    v4 = CFSTR("reticle.view.add.widget.button.label");
LABEL_4:
    accessibilityLocalizedString(v4);
    v5 = objc_claimAutoreleasedReturnValue();
LABEL_5:
    v6 = (void *)v5;
    goto LABEL_6;
  }
  if (objc_msgSend(v3, "isEqualToString:", CFSTR("clock-reticle-view")))
  {
    v4 = CFSTR("clock.complication.label");
    goto LABEL_4;
  }
  if (objc_msgSend(v3, "isEqualToString:", CFSTR("contact-reticle-view")))
  {
    v4 = CFSTR("contact.complication.label");
    goto LABEL_4;
  }
  if (!objc_msgSend(v3, "isEqualToString:", CFSTR("inline-widget-reticle-view")))
  {
    v13.receiver = self;
    v13.super_class = (Class)PREditingReticleViewAccessibility;
    -[PREditingReticleViewAccessibility _accessibilityAXAttributedLabel](&v13, sel__accessibilityAXAttributedLabel);
    v5 = objc_claimAutoreleasedReturnValue();
    goto LABEL_5;
  }
  -[PREditingReticleViewAccessibility _axSetRemoteViews](self, "_axSetRemoteViews");
  -[PREditingReticleViewAccessibility _accessibilityGetRemoteElement](self, "_accessibilityGetRemoteElement");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_alloc(MEMORY[0x24BDFEA60]);
  accessibilityLocalizedString(CFSTR("inline.complication.label"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v9, "initWithString:", v10);

  if (v8)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", objc_msgSend(v8, "remotePid"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setAttribute:forKey:", v11, *MEMORY[0x24BDFEAB0]);

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", objc_msgSend(v8, "uuidHash"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setAttribute:forKey:", v12, *MEMORY[0x24BDFEAB8]);

  }
LABEL_6:

  return v6;
}

- (id)accessibilityHint
{
  void *v3;
  uint64_t v4;
  __CFString *v5;
  void *v6;
  objc_super v8;

  -[PREditingReticleViewAccessibility accessibilityIdentifier](self, "accessibilityIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "isEqualToString:", CFSTR("grouped-widgets-reticle-view")))
  {
    v8.receiver = self;
    v8.super_class = (Class)PREditingReticleViewAccessibility;
    -[PREditingReticleViewAccessibility accessibilityHint](&v8, sel_accessibilityHint);
    v4 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if ((objc_msgSend(v3, "isEqualToString:", CFSTR("clock-reticle-view")) & 1) != 0
      || objc_msgSend(v3, "isEqualToString:", CFSTR("contact-reticle-view")))
    {
      v5 = CFSTR("font.reticle.view.hint");
    }
    else
    {
      v5 = CFSTR("reticle.view.hint");
    }
    accessibilityLocalizedString(v5);
    v4 = objc_claimAutoreleasedReturnValue();
  }
  v6 = (void *)v4;

  return v6;
}

- (BOOL)isAccessibilityElement
{
  void *v3;
  char v4;
  char v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  void *v11;
  int v12;
  double v13;
  char v14;

  -[PREditingReticleViewAccessibility _axPosterEditorViewController](self, "_axPosterEditorViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "safeBoolForKey:", CFSTR("isComplicationsRowConfigured"));
  v5 = objc_msgSend(v3, "safeBoolForKey:", CFSTR("isComplicationSidebarConfigured"));
  objc_msgSend(v3, "safeUIViewForKey:", CFSTR("complicationRowEmptyStateView"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safeUIViewForKey:", CFSTR("complicationSidebarEmptyStateView"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PREditingReticleViewAccessibility accessibilityIdentifier](self, "accessibilityIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isEqualToString:", CFSTR("grouped-widgets-reticle-view"));

  if ((v9 & 1) != 0)
  {
    v10 = v6;
    v5 = v4;
  }
  else
  {
    -[PREditingReticleViewAccessibility accessibilityIdentifier](self, "accessibilityIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "isEqualToString:", CFSTR("grouped-widgets-reticle-sidebar-view"));

    v10 = v7;
    if (!v12)
    {
      v14 = 1;
      goto LABEL_8;
    }
  }
  objc_msgSend(v10, "alpha");
  if (v13 == 1.0)
    v14 = v5 ^ 1;
  else
    v14 = 0;
LABEL_8:

  return v14;
}

- (unint64_t)accessibilityTraits
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PREditingReticleViewAccessibility;
  return *MEMORY[0x24BDF73B0] | -[PREditingReticleViewAccessibility accessibilityTraits](&v3, sel_accessibilityTraits);
}

- (BOOL)_accessibilityShouldUseHostContextIDForPress
{
  void *v2;
  int v3;

  -[PREditingReticleViewAccessibility accessibilityIdentifier](self, "accessibilityIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v2, "isEqualToString:", CFSTR("clock-reticle-view")) & 1) != 0)
    LOBYTE(v3) = 0;
  else
    v3 = objc_msgSend(v2, "isEqualToString:", CFSTR("contact-reticle-view")) ^ 1;

  return v3;
}

- (id)accessibilityElements
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  int v8;
  void *v9;
  int v10;
  BOOL v11;
  void *v12;
  int v13;
  void **v14;
  void *v15;
  void *v17;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x24BDAC8D0];
  -[PREditingReticleViewAccessibility _axPosterEditorViewController](self, "_axPosterEditorViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  objc_msgSend(v3, "safeValueForKeyPath:", CFSTR("complicationHostViewController"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v3, "safeBoolForKey:", CFSTR("isComplicationsRowConfigured"));
  v8 = objc_msgSend(v3, "safeBoolForKey:", CFSTR("isComplicationSidebarConfigured"));
  -[PREditingReticleViewAccessibility accessibilityIdentifier](self, "accessibilityIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "isEqualToString:", CFSTR("grouped-widgets-reticle-view"));

  if (v10)
    v11 = v7 == 0;
  else
    v11 = 1;
  if (v11)
  {
    -[PREditingReticleViewAccessibility accessibilityIdentifier](self, "accessibilityIdentifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "isEqualToString:", CFSTR("grouped-widgets-reticle-sidebar-view")) & v8;

    if (v13 != 1)
    {
      v15 = 0;
      goto LABEL_10;
    }
    v17 = v6;
    v14 = &v17;
  }
  else
  {
    v18[0] = v6;
    v14 = (void **)v18;
  }
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v14, 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_10:

  return v15;
}

- (BOOL)accessibilityElementsHidden
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  BOOL v8;
  unint64_t v9;
  void *v10;
  char v11;
  BOOL v12;

  objc_opt_class();
  __UIAccessibilityCastAsClass();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "window");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "windowScene");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "interfaceOrientation");

  -[PREditingReticleViewAccessibility accessibilityIdentifier](self, "accessibilityIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "isEqualToString:", CFSTR("grouped-widgets-reticle-view")))
    v8 = (unint64_t)(v6 - 3) >= 2;
  else
    v8 = 1;
  if (v8)
  {
    v9 = v6 - 1;
    -[PREditingReticleViewAccessibility accessibilityIdentifier](self, "accessibilityIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "isEqualToString:", CFSTR("grouped-widgets-reticle-sidebar-view"));
    if (v9 < 2)
      v12 = v11;
    else
      v12 = 0;

  }
  else
  {
    v12 = 1;
  }

  return v12;
}

- (void)_axSetRemoteViews
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;

  -[PREditingReticleViewAccessibility _accessibilityGetRemoteElement](self, "_accessibilityGetRemoteElement");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    -[PREditingReticleViewAccessibility _accessibilityWindowScene](self, "_accessibilityWindowScene");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "safeValueForKeyPath:", CFSTR("_FBSScene.hostProcess"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "safeIntForKey:", CFSTR("pid"));

    v7 = -[PREditingReticleViewAccessibility _accessibilityContextId](self, "_accessibilityContextId");
    v3 = 0;
    if ((_DWORD)v6)
    {
      if ((_DWORD)v7)
      {
        v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDFEA78]), "initWithUUID:andRemotePid:andContextId:", CFSTR("posterboard.posterkit.top.widget"), v6, v7);
        objc_msgSend(v8, "setOnClientSide:", 1);
        -[PREditingReticleViewAccessibility _accessibilitySetRemoteElement:](self, "_accessibilitySetRemoteElement:", v8);

        v3 = 0;
      }
    }
  }

}

@end
