@implementation CardViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("CardView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("ContainerViewController"), CFSTR("setLayoutIfSupported: animated:"), "v", "Q", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("ModalContaineeViewController"), CFSTR("_dismissContainee"), "v", 0);
  objc_msgSend(v3, "validateClass:", CFSTR("ContaineeViewController"));

}

- (BOOL)_axExpandCard
{
  void *v2;
  uint64_t v3;
  uint64_t (*v4)(uint64_t);
  uint64_t *v5;
  BOOL v6;
  uint64_t v8;
  uint64_t v9;

  -[CardViewAccessibility _accessibilityContainerViewController](self, "_accessibilityContainerViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "safeIntegerForKey:", CFSTR("containeeLayout"));
  if (v3 == 2)
  {
    v8 = MEMORY[0x24BDAC760];
    v4 = __38__CardViewAccessibility__axExpandCard__block_invoke_2;
    v5 = &v8;
  }
  else
  {
    if (v3 != 1)
    {
      v6 = 0;
      goto LABEL_7;
    }
    v9 = MEMORY[0x24BDAC760];
    v4 = __38__CardViewAccessibility__axExpandCard__block_invoke;
    v5 = &v9;
  }
  v5[1] = 3221225472;
  v5[2] = (uint64_t)v4;
  v5[3] = (uint64_t)&unk_250258E30;
  v5[4] = (uint64_t)v2;
  AXPerformSafeBlock();

  v6 = 1;
LABEL_7:

  return v6;
}

uint64_t __38__CardViewAccessibility__axExpandCard__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setLayoutIfSupported:animated:", 2, 1);
}

uint64_t __38__CardViewAccessibility__axExpandCard__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setLayoutIfSupported:animated:", 3, 1);
}

- (BOOL)_axCollapseCard
{
  void *v2;
  uint64_t v3;
  uint64_t (*v4)(uint64_t);
  uint64_t *v5;
  BOOL v6;
  uint64_t v8;
  uint64_t v9;

  -[CardViewAccessibility _accessibilityContainerViewController](self, "_accessibilityContainerViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "safeIntegerForKey:", CFSTR("containeeLayout"));
  if ((unint64_t)(v3 - 3) >= 2)
  {
    if (v3 != 2)
    {
      v6 = 0;
      goto LABEL_7;
    }
    v9 = MEMORY[0x24BDAC760];
    v4 = __40__CardViewAccessibility__axCollapseCard__block_invoke;
    v5 = &v9;
  }
  else
  {
    v8 = MEMORY[0x24BDAC760];
    v4 = __40__CardViewAccessibility__axCollapseCard__block_invoke_2;
    v5 = &v8;
  }
  v5[1] = 3221225472;
  v5[2] = (uint64_t)v4;
  v5[3] = (uint64_t)&unk_250258E30;
  v5[4] = (uint64_t)v2;
  AXPerformSafeBlock();

  v6 = 1;
LABEL_7:

  return v6;
}

uint64_t __40__CardViewAccessibility__axCollapseCard__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setLayoutIfSupported:animated:", 1, 1);
}

uint64_t __40__CardViewAccessibility__axCollapseCard__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setLayoutIfSupported:animated:", 2, 1);
}

- (void)layoutSubviews
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CardViewAccessibility;
  -[CardViewAccessibility layoutSubviews](&v4, sel_layoutSubviews);
  -[CardViewAccessibility _accessibilityLoadAccessibilityInformation](self, "_accessibilityLoadAccessibilityInformation");
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
  uint64_t v5;

  objc_opt_class();
  __UIAccessibilityCastAsClass();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v2)
    return 0;
  while (1)
  {
    objc_msgSend(MEMORY[0x24BDF6F98], "viewControllerForView:", v2);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    __UIAccessibilitySafeClass();
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
    {
      MEMORY[0x2349135AC](CFSTR("ContainerViewController"));
      if ((objc_opt_isKindOfClass() & 1) != 0)
        break;
    }
    objc_msgSend(v2, "superview");
    v5 = objc_claimAutoreleasedReturnValue();

    v2 = (void *)v5;
    if (!v5)
      return 0;
  }

  return v4;
}

- (id)_accessibilityContaineeViewController
{
  void *v2;
  void *v3;

  -[CardViewAccessibility _accessibilityContainerViewController](self, "_accessibilityContainerViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "safeValueForKey:", CFSTR("currentViewController"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (unint64_t)_accessibilityContaineeLayout
{
  void *v2;
  void *v3;
  unint64_t v4;

  -[CardViewAccessibility _accessibilityContainerViewController](self, "_accessibilityContainerViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
    v4 = objc_msgSend(v2, "safeIntegerForKey:", CFSTR("containeeLayout"));
  else
    v4 = 0;

  return v4;
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

uint64_t __51__CardViewAccessibility_accessibilityPerformEscape__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_dismissContainee");
}

- (BOOL)accessibilityViewIsModal
{
  BOOL v3;
  void *v4;

  if ((AXDeviceIsPad() & 1) != 0)
    return 0;
  -[CardViewAccessibility _accessibilityContaineeViewController](self, "_accessibilityContaineeViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  MEMORY[0x2349135AC](CFSTR("CollectionCreateViewController"));
  v3 = (objc_opt_isKindOfClass() & 1) != 0
    || -[CardViewAccessibility _accessibilityContaineeLayout](self, "_accessibilityContaineeLayout") == 3;

  return v3;
}

@end
