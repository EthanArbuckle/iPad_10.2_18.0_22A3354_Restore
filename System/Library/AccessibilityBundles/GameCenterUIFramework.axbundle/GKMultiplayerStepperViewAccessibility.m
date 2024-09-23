@implementation GKMultiplayerStepperViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("GameCenterUI.GKMultiplayerStepperView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("GameCenterUI.GKMultiplayerStepperView"), CFSTR("accessibilityDownButton"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("GameCenterUI.GKMultiplayerStepperView"), CFSTR("accessibilityUpButton"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("GameCenterUI.GKMultiplayerStepperView"), CFSTR("accessibilityUpdateStepperWithValue:"), "v", "q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("GameCenterUI.GKMultiplayerStepperView"), CFSTR("layoutSubviews"), "v", 0);

}

- (unint64_t)_accessibilityAutomationType
{
  return 79;
}

- (void)layoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)GKMultiplayerStepperViewAccessibility;
  -[GKMultiplayerStepperViewAccessibility layoutSubviews](&v3, sel_layoutSubviews);
  -[GKMultiplayerStepperViewAccessibility _accessibilityLoadAccessibilityInformation](self, "_accessibilityLoadAccessibilityInformation");
}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)GKMultiplayerStepperViewAccessibility;
  -[GKMultiplayerStepperViewAccessibility _accessibilityLoadAccessibilityInformation](&v5, sel__accessibilityLoadAccessibilityInformation);
  -[GKMultiplayerStepperViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("accessibilityDownButton"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_setAccessibilityLabelBlock:", &__block_literal_global_5);
  -[GKMultiplayerStepperViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("accessibilityUpButton"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_setAccessibilityLabelBlock:", &__block_literal_global_197);
  objc_msgSend(v3, "_setAccessibilityAdditionalTraitsBlock:", &__block_literal_global_201);
  objc_msgSend(v4, "_setAccessibilityAdditionalTraitsBlock:", &__block_literal_global_202);

}

id __83__GKMultiplayerStepperViewAccessibility__accessibilityLoadAccessibilityInformation__block_invoke()
{
  return AXGameCenterUIFrameworkLocString(CFSTR("REMOVE_PLAYERS"));
}

id __83__GKMultiplayerStepperViewAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_2()
{
  return AXGameCenterUIFrameworkLocString(CFSTR("ADD_PLAYERS"));
}

uint64_t __83__GKMultiplayerStepperViewAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_3()
{
  return *MEMORY[0x24BDF7408];
}

uint64_t __83__GKMultiplayerStepperViewAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_4()
{
  return *MEMORY[0x24BDF7408];
}

- (void)accessibilityUpdateStepperWithValue:(int64_t)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v4 = (void *)MEMORY[0x24BDFEA60];
  v5 = (void *)MEMORY[0x24BDD17C8];
  AXGameCenterUIFrameworkLocString(CFSTR("PLAYER_COUNT"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localizedStringWithFormat:", v6, a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "axAttributedStringWithString:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "setAttribute:forKey:", MEMORY[0x24BDBD1C8], *MEMORY[0x24BDFEC18]);
  v9 = v8;
  AXPerformBlockOnMainThreadAfterDelay();

}

void __77__GKMultiplayerStepperViewAccessibility_accessibilityUpdateStepperWithValue___block_invoke(uint64_t a1)
{
  UIAccessibilityPostNotification(*MEMORY[0x24BDF71E8], *(id *)(a1 + 32));
}

- (int64_t)accessibilityContainerType
{
  return 4;
}

- (id)accessibilityLabel
{
  return AXGameCenterUIFrameworkLocString(CFSTR("MULTIPLAYER_CONTROL"));
}

@end
