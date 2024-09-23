@implementation BuddyPosedDeviceSelectionViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("BuddyPosedDeviceSelectionView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("BuddyPosedDeviceSelectionView"), CFSTR("leftContainer"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("BuddyPosedDeviceSelectionView"), CFSTR("centerContainer"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("BuddyPosedDeviceSelectionView"), CFSTR("rightContainer"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("BuddyPosedDeviceSelectionView"), CFSTR("leftPosedView"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("BuddyPosedDeviceSelectionView"), CFSTR("centerPosedView"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("BuddyPosedDeviceSelectionView"), CFSTR("rightPosedView"), "@", 0);

}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  _QWORD v15[4];
  id v16;
  _QWORD v17[4];
  id v18;
  objc_super v19;

  v19.receiver = self;
  v19.super_class = (Class)BuddyPosedDeviceSelectionViewAccessibility;
  -[BuddyPosedDeviceSelectionViewAccessibility _accessibilityLoadAccessibilityInformation](&v19, sel__accessibilityLoadAccessibilityInformation);
  -[BuddyPosedDeviceSelectionViewAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("leftContainer"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[BuddyPosedDeviceSelectionViewAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("centerContainer"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[BuddyPosedDeviceSelectionViewAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("rightContainer"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[BuddyPosedDeviceSelectionViewAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("leftPosedView"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[BuddyPosedDeviceSelectionViewAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("centerPosedView"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[BuddyPosedDeviceSelectionViewAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("rightPosedView"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_accessibilitySetUserDefinedMediaAnalysisOptions:", &unk_2503479F0);
  objc_msgSend(v4, "_accessibilitySetUserDefinedMediaAnalysisOptions:", &unk_2503479F0);
  objc_msgSend(v5, "_accessibilitySetUserDefinedMediaAnalysisOptions:", &unk_2503479F0);
  v9 = MEMORY[0x24BDAC760];
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __88__BuddyPosedDeviceSelectionViewAccessibility__accessibilityLoadAccessibilityInformation__block_invoke;
  v17[3] = &unk_250343FB0;
  v18 = v6;
  v10 = v6;
  objc_msgSend(v3, "setAccessibilityActivationPointBlock:", v17);
  v15[0] = v9;
  v15[1] = 3221225472;
  v15[2] = __88__BuddyPosedDeviceSelectionViewAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_2;
  v15[3] = &unk_250343FB0;
  v16 = v7;
  v11 = v7;
  objc_msgSend(v4, "setAccessibilityActivationPointBlock:", v15);
  v13[0] = v9;
  v13[1] = 3221225472;
  v13[2] = __88__BuddyPosedDeviceSelectionViewAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_3;
  v13[3] = &unk_250343FB0;
  v14 = v8;
  v12 = v8;
  objc_msgSend(v5, "setAccessibilityActivationPointBlock:", v13);

}

uint64_t __88__BuddyPosedDeviceSelectionViewAccessibility__accessibilityLoadAccessibilityInformation__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "accessibilityActivationPoint");
}

uint64_t __88__BuddyPosedDeviceSelectionViewAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "accessibilityActivationPoint");
}

uint64_t __88__BuddyPosedDeviceSelectionViewAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "accessibilityActivationPoint");
}

@end
