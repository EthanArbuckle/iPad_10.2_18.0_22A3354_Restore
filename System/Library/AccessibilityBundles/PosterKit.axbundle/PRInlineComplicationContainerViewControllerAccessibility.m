@implementation PRInlineComplicationContainerViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("PRInlineComplicationContainerViewController");
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

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("PRInlineComplicationContainerViewController"), CFSTR("UIViewController"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PRInlineComplicationContainerViewController"), CFSTR("setComplicationDescriptor:"), "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PRInlineComplicationContainerViewController"), CFSTR("invalidate"), "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PRInlineComplicationContainerViewController"), CFSTR("complicationDescriptor"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PRComplicationDescriptor"), CFSTR("widgetDescriptor"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("UIScene"), CFSTR("_FBSScene"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("FBSScene"), CFSTR("hostProcess"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("FBSProcess"), CFSTR("pid"), "i", 0);

}

- (void)_accessibilityLoadAccessibilityInformation
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PRInlineComplicationContainerViewControllerAccessibility;
  -[PRInlineComplicationContainerViewControllerAccessibility _accessibilityLoadAccessibilityInformation](&v3, sel__accessibilityLoadAccessibilityInformation);
  -[PRInlineComplicationContainerViewControllerAccessibility _axSetWidgetView](self, "_axSetWidgetView");
  -[PRInlineComplicationContainerViewControllerAccessibility _axSetRemoteView](self, "_axSetRemoteView");
}

- (void)setComplicationDescriptor:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PRInlineComplicationContainerViewControllerAccessibility;
  -[PRInlineComplicationContainerViewControllerAccessibility setComplicationDescriptor:](&v4, sel_setComplicationDescriptor_, a3);
  -[PRInlineComplicationContainerViewControllerAccessibility _accessibilityLoadAccessibilityInformation](self, "_accessibilityLoadAccessibilityInformation");
}

- (void)viewDidAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PRInlineComplicationContainerViewControllerAccessibility;
  -[PRInlineComplicationContainerViewControllerAccessibility viewDidAppear:](&v4, sel_viewDidAppear_, a3);
  -[PRInlineComplicationContainerViewControllerAccessibility _accessibilityLoadAccessibilityInformation](self, "_accessibilityLoadAccessibilityInformation");
}

- (void)viewDidDisappear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PRInlineComplicationContainerViewControllerAccessibility;
  -[PRInlineComplicationContainerViewControllerAccessibility viewDidDisappear:](&v4, sel_viewDidDisappear_, a3);
  -[PRInlineComplicationContainerViewControllerAccessibility _axResetRemoteView](self, "_axResetRemoteView");
}

- (void)invalidate
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PRInlineComplicationContainerViewControllerAccessibility;
  -[PRInlineComplicationContainerViewControllerAccessibility invalidate](&v3, sel_invalidate);
  -[PRInlineComplicationContainerViewControllerAccessibility _axResetRemoteView](self, "_axResetRemoteView");
}

- (void)_axSetWidgetView
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;

  -[PRInlineComplicationContainerViewControllerAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("view"));
  v8 = (id)objc_claimAutoreleasedReturnValue();
  accessibilityLocalizedString(CFSTR("default.calendar.widget"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PRInlineComplicationContainerViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("complicationDescriptor"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "safeValueForKey:", CFSTR("widgetDescriptor"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    AXWidgetAndAppName(v6, 1);
    v7 = objc_claimAutoreleasedReturnValue();

    v3 = (void *)v7;
  }
  objc_msgSend(v8, "setAccessibilityLabel:", v3);
  objc_msgSend(v8, "setIsAccessibilityElement:", 1);

}

- (void)_axSetRemoteView
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;

  -[PRInlineComplicationContainerViewControllerAccessibility _accessibilityGetRemoteElement](self, "_accessibilityGetRemoteElement");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    -[PRInlineComplicationContainerViewControllerAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("view"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "_accessibilityWindowScene");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "safeValueForKeyPath:", CFSTR("_FBSScene.hostProcess"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "safeIntForKey:", CFSTR("pid"));

    v8 = objc_msgSend(v4, "_accessibilityContextId");
    if ((_DWORD)v7 && (_DWORD)v8)
    {
      v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDFEA78]), "initWithUUID:andRemotePid:andContextId:", CFSTR("posterboard.posterkit.top.widget"), v7, v8);
      objc_msgSend(v9, "setRemoteChildrenDelegate:", self);
      -[PRInlineComplicationContainerViewControllerAccessibility _accessibilitySetRemoteElement:](self, "_accessibilitySetRemoteElement:", v9);

    }
    v3 = 0;
  }

}

- (void)_axResetRemoteView
{
  void *v3;
  void *v4;
  id v5;

  -[PRInlineComplicationContainerViewControllerAccessibility _accessibilityGetRemoteElement](self, "_accessibilityGetRemoteElement");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v5 = v3;
    -[PRInlineComplicationContainerViewControllerAccessibility _accessibilityGetRemoteElement](self, "_accessibilityGetRemoteElement");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "unregister");

    -[PRInlineComplicationContainerViewControllerAccessibility _accessibilitySetRemoteElement:](self, "_accessibilitySetRemoteElement:", 0);
    v3 = v5;
  }

}

- (id)accessibilityRemoteSubstituteChildren:(id)a3
{
  void *v3;
  void *v4;

  -[PRInlineComplicationContainerViewControllerAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("view"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCE30], "axArrayByIgnoringNilElementsWithCount:", 1, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

@end
