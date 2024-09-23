@implementation UIDropShadowViewAccessibility_Maps_AppKit

+ (id)safeCategoryTargetClassName
{
  return CFSTR("UIDropShadowView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("UIDropShadowView"), CFSTR("_topGrabber"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("UIDropShadowView"), CFSTR("contentView"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("ContainerViewController"), CFSTR("setLayoutIfSupported: animated:"), "v", "Q", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("ModalContaineeViewController"), CFSTR("_dismissContainee"), "v", 0);
  objc_msgSend(v3, "validateClass:", CFSTR("ContainerViewController"));
  objc_msgSend(v3, "validateClass:", CFSTR("ModalContaineeViewController"));
  objc_msgSend(v3, "validateClass:", CFSTR("CollectionCreateViewController"));
  objc_msgSend(v3, "validateClass:", CFSTR("ControlContaineeViewController"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("ContainerViewController"), CFSTR("currentViewController"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CardPresentationController"), CFSTR("containeeLayout"), "Q", 0);

}

- (void)setLayoutIfSupported:(unint64_t)a3 animated:(BOOL)a4
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)UIDropShadowViewAccessibility_Maps_AppKit;
  -[UIDropShadowViewAccessibility_Maps_AppKit setLayoutIfSupported:animated:](&v4, sel_setLayoutIfSupported_animated_, a3, a4);
}

- (BOOL)_axExpandCard
{
  void *v3;
  unint64_t v4;
  uint64_t (*v5)(uint64_t);
  uint64_t *v6;
  BOOL v7;
  uint64_t v9;
  uint64_t v10;

  -[UIDropShadowViewAccessibility_Maps_AppKit _accessibilityContainerViewController](self, "_accessibilityContainerViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[UIDropShadowViewAccessibility_Maps_AppKit _accessibilityContaineeLayout](self, "_accessibilityContaineeLayout");
  if (v4 == 2)
  {
    v9 = MEMORY[0x24BDAC760];
    v5 = __58__UIDropShadowViewAccessibility_Maps_AppKit__axExpandCard__block_invoke_2;
    v6 = &v9;
  }
  else
  {
    if (v4 != 1)
    {
      v7 = 0;
      goto LABEL_7;
    }
    v10 = MEMORY[0x24BDAC760];
    v5 = __58__UIDropShadowViewAccessibility_Maps_AppKit__axExpandCard__block_invoke;
    v6 = &v10;
  }
  v6[1] = 3221225472;
  v6[2] = (uint64_t)v5;
  v6[3] = (uint64_t)&unk_250258E30;
  v6[4] = (uint64_t)v3;
  AXPerformSafeBlock();

  v7 = 1;
LABEL_7:

  return v7;
}

- (BOOL)_axCollapseCard
{
  void *v3;
  unint64_t v4;
  uint64_t (*v5)(uint64_t);
  uint64_t *v6;
  BOOL v7;
  uint64_t v9;
  uint64_t v10;

  -[UIDropShadowViewAccessibility_Maps_AppKit _accessibilityContainerViewController](self, "_accessibilityContainerViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[UIDropShadowViewAccessibility_Maps_AppKit _accessibilityContaineeLayout](self, "_accessibilityContaineeLayout");
  if (v4 - 3 >= 2)
  {
    if (v4 != 2)
    {
      v7 = 0;
      goto LABEL_7;
    }
    v10 = MEMORY[0x24BDAC760];
    v5 = __60__UIDropShadowViewAccessibility_Maps_AppKit__axCollapseCard__block_invoke;
    v6 = &v10;
  }
  else
  {
    v9 = MEMORY[0x24BDAC760];
    v5 = __60__UIDropShadowViewAccessibility_Maps_AppKit__axCollapseCard__block_invoke_2;
    v6 = &v9;
  }
  v6[1] = 3221225472;
  v6[2] = (uint64_t)v5;
  v6[3] = (uint64_t)&unk_250258E30;
  v6[4] = (uint64_t)v3;
  AXPerformSafeBlock();

  v7 = 1;
LABEL_7:

  return v7;
}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  void *v4;
  _BOOL4 v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v16[4];
  id v17;
  id location;
  objc_super v19;
  _QWORD v20[3];

  v20[2] = *MEMORY[0x24BDAC8D0];
  v19.receiver = self;
  v19.super_class = (Class)UIDropShadowViewAccessibility_Maps_AppKit;
  -[UIDropShadowViewAccessibility_Maps_AppKit _accessibilityLoadAccessibilityInformation](&v19, sel__accessibilityLoadAccessibilityInformation);
  -[UIDropShadowViewAccessibility_Maps_AppKit safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("_topGrabber"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_accessibilitySetFrameExpansion:", 20.0, 10.0);
  objc_msgSend(v3, "setIsAccessibilityElement:", 1);
  objc_msgSend(v3, "setAccessibilityRespondsToUserInteraction:", 1);
  objc_msgSend(v3, "setAccessibilityIdentifier:", CFSTR("Card grabber"));
  objc_msgSend(v3, "accessibilityCustomActions");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4 == 0;

  if (v5)
  {
    objc_initWeak(&location, self);
    v6 = objc_alloc(MEMORY[0x24BDF6788]);
    AXMapsLocString(CFSTR("EXPAND_CARD"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v6, "initWithName:target:selector:", v7, self, sel__axExpandCard);

    v9 = objc_alloc(MEMORY[0x24BDF6788]);
    AXMapsLocString(CFSTR("COLLAPSE_CARD"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(v9, "initWithName:target:selector:", v10, self, sel__axCollapseCard);

    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addObserver:selector:name:object:", self, sel__axCollapseCard, CFSTR("AXCollapseMapsChromeNotification"), 0);

    v20[0] = v8;
    v20[1] = v11;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v20, 2);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setAccessibilityCustomActions:", v13);

    AXMapsLocString(CFSTR("CARD_GRABBER_VIEW"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setAccessibilityLabel:", v14);

    AXMapsLocString(CFSTR("CARD_GRABBER_VIEW_HINT"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setAccessibilityHint:", v15);

    v16[0] = MEMORY[0x24BDAC760];
    v16[1] = 3221225472;
    v16[2] = __87__UIDropShadowViewAccessibility_Maps_AppKit__accessibilityLoadAccessibilityInformation__block_invoke;
    v16[3] = &unk_250258DB8;
    objc_copyWeak(&v17, &location);
    objc_msgSend(v3, "_setAccessibilityValueBlock:", v16);
    objc_destroyWeak(&v17);

    objc_destroyWeak(&location);
  }

}

- (void)layoutSubviews
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)UIDropShadowViewAccessibility_Maps_AppKit;
  -[UIDropShadowViewAccessibility_Maps_AppKit layoutSubviews](&v4, sel_layoutSubviews);
  -[UIDropShadowViewAccessibility_Maps_AppKit _accessibilityLoadAccessibilityInformation](self, "_accessibilityLoadAccessibilityInformation");
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "postNotificationName:object:", CFSTR("AXMapVisibleRegionDidChange"), 0);

}

- (int64_t)accessibilityContainerType
{
  return 4;
}

- (BOOL)shouldGroupAccessibilityChildren
{
  return 1;
}

- (id)_accessibilityContainerViewController
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v2 = (void *)MEMORY[0x24BDF6F98];
  -[UIDropShadowViewAccessibility_Maps_AppKit safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("contentView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "viewControllerForView:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  MEMORY[0x2349135AC](CFSTR("ControlContaineeViewController"));
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_4;
  objc_msgSend(v4, "safeValueForKey:", CFSTR("cardPresentationController"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "safeValueForKey:", CFSTR("containerViewController"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  MEMORY[0x2349135AC](CFSTR("ContainerViewController"));
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

LABEL_4:
    v6 = 0;
  }

  return v6;
}

- (id)_accessibilityContaineeViewController
{
  void *v2;
  void *v3;

  -[UIDropShadowViewAccessibility_Maps_AppKit _accessibilityContainerViewController](self, "_accessibilityContainerViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "safeValueForKey:", CFSTR("currentViewController"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (unint64_t)_accessibilityContaineeLayout
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  unint64_t v7;

  v2 = (void *)MEMORY[0x24BDF6F98];
  -[UIDropShadowViewAccessibility_Maps_AppKit safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("contentView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "viewControllerForView:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  MEMORY[0x2349135AC](CFSTR("ControlContaineeViewController"));
  if ((objc_opt_isKindOfClass() & 1) != 0
    && (objc_msgSend(v4, "safeValueForKey:", CFSTR("cardPresentationController")),
        (v5 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    v6 = v5;
    v7 = objc_msgSend(v5, "safeUnsignedIntegerForKey:", CFSTR("containeeLayout"));

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (BOOL)accessibilityPerformEscape
{
  void *v2;
  char isKindOfClass;
  id v5;

  objc_msgSend(MEMORY[0x24BDF6F98], "viewControllerForView:", self);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  MEMORY[0x2349135AC](CFSTR("ModalContaineeViewController"));
  isKindOfClass = objc_opt_isKindOfClass();
  if ((isKindOfClass & 1) != 0)
  {
    v5 = v2;
    AXPerformSafeBlock();

  }
  return isKindOfClass & 1;
}

- (BOOL)accessibilityViewIsModal
{
  void *v3;
  BOOL v4;

  -[UIDropShadowViewAccessibility_Maps_AppKit _accessibilityContaineeViewController](self, "_accessibilityContaineeViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  MEMORY[0x2349135AC](CFSTR("CollectionCreateViewController"));
  v4 = (objc_opt_isKindOfClass() & 1) != 0
    || -[UIDropShadowViewAccessibility_Maps_AppKit _accessibilityContaineeLayout](self, "_accessibilityContaineeLayout") == 3;

  return v4;
}

@end
