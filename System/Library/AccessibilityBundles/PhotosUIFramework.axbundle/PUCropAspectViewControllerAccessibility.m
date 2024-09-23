@implementation PUCropAspectViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("PUCropAspectViewController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PUCropAspectViewController"), CFSTR("aspectButtons"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PUCropAspectViewController"), CFSTR("allAspectRatios"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PUCropAspectViewController"), CFSTR("buttonContainer"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PUCropAspect"), CFSTR("localizedName"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PUCropAspect"), CFSTR("width"), "d", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PUCropAspect"), CFSTR("height"), "d", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PUCropAspectViewController"), CFSTR("viewDidLoad"), "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PUCropAspectViewController"), CFSTR("aspectButtonPressed:"), "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PUCropAspectViewController"), CFSTR("updateAspectButtons"), "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PUCropAspectViewController"), CFSTR("delegate"), "@", 0);
  objc_msgSend(v3, "validateClass:", CFSTR("PUCropToolController"));

}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  _QWORD v7[4];
  id v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)PUCropAspectViewControllerAccessibility;
  -[PUCropAspectViewControllerAccessibility _accessibilityLoadAccessibilityInformation](&v9, sel__accessibilityLoadAccessibilityInformation);
  -[PUCropAspectViewControllerAccessibility safeArrayForKey:](self, "safeArrayForKey:", CFSTR("aspectButtons"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUCropAspectViewControllerAccessibility safeArrayForKey:](self, "safeArrayForKey:", CFSTR("allAspectRatios"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUCropAspectViewControllerAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("buttonContainer"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_setAccessibilityLabelBlock:", &__block_literal_global_6);
  objc_msgSend(v5, "setAccessibilityContainerType:", 4);
  v6 = objc_msgSend(v3, "count");
  if (v6 == objc_msgSend(v4, "count"))
  {
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __85__PUCropAspectViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_2;
    v7[3] = &unk_24FF152A8;
    v8 = v3;
    objc_msgSend(v4, "enumerateObjectsUsingBlock:", v7);

  }
}

id __85__PUCropAspectViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke()
{
  return accessibilityPULocalizedString(CFSTR("aspect.ratios"));
}

void __85__PUCropAspectViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v5 = a2;
  objc_msgSend(*(id *)(a1 + 32), "objectAtIndex:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __85__PUCropAspectViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_3;
  v8[3] = &unk_24FF15280;
  v9 = v5;
  v7 = v5;
  objc_msgSend(v6, "_setAccessibilityLabelBlock:", v8);

}

id __85__PUCropAspectViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_3(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;

  objc_msgSend(*(id *)(a1 + 32), "safeStringForKey:", CFSTR("localizedName"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD14A8], "decimalDigitCharacterSet");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "rangeOfCharacterFromSet:", v3);

  if (v4 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v5 = v2;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "safeCGFloatForKey:", CFSTR("width"));
    v7 = v6;
    objc_msgSend(*(id *)(a1 + 32), "safeCGFloatForKey:", CFSTR("height"));
    v9 = v8;
    v10 = (void *)MEMORY[0x24BDD17C8];
    accessibilityPULocalizedString(CFSTR("aspect.ratio.value"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "stringWithFormat:", v11, v7, v9);
    v5 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v5;
}

- (void)viewDidLoad
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PUCropAspectViewControllerAccessibility;
  -[PUCropAspectViewControllerAccessibility viewDidLoad](&v3, sel_viewDidLoad);
  -[PUCropAspectViewControllerAccessibility _accessibilityLoadAccessibilityInformation](self, "_accessibilityLoadAccessibilityInformation");
}

- (void)aspectButtonPressed:(id)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PUCropAspectViewControllerAccessibility;
  -[PUCropAspectViewControllerAccessibility aspectButtonPressed:](&v5, sel_aspectButtonPressed_, a3);
  -[PUCropAspectViewControllerAccessibility _accessibilityLoadAccessibilityInformation](self, "_accessibilityLoadAccessibilityInformation");
  -[PUCropAspectViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("delegate"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  NSClassFromString(CFSTR("PUCropToolController"));
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v4, "_accessibilityLoadAccessibilityInformation");

}

- (void)updateAspectButtons
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PUCropAspectViewControllerAccessibility;
  -[PUCropAspectViewControllerAccessibility updateAspectButtons](&v3, sel_updateAspectButtons);
  -[PUCropAspectViewControllerAccessibility _accessibilityLoadAccessibilityInformation](self, "_accessibilityLoadAccessibilityInformation");
}

@end
