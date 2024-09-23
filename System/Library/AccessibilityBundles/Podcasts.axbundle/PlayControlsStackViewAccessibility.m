@implementation PlayControlsStackViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("ShelfKitCollectionViews.PlayControlsStackView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("ShelfKitCollectionViews.PlayControlsStackView"), CFSTR("accessibilityPlayButtonState"), "q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("ShelfKitCollectionViews.PlayControlsStackView"), CFSTR("accessibilityPlaybackStatusView"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("ShelfKitCollectionViews.PlayControlsStackView"), CFSTR("accessibilityEpisodeStateControls"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("ShelfKitCollectionViews.PlayControlsStackView"), CFSTR("accessibilityPlayPauseButton"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("ShelfKitCollectionViews.PlayControlsStackView"), CFSTR("accessibilityUpdatePlayButtonState"), "v", 0);

}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v8;

  -[PlayControlsStackViewAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("accessibilityPlaybackStatusView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "_accessibilityViewIsVisible"))
  {
    objc_msgSend(v3, "accessibilityLabel");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }
  -[PlayControlsStackViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("accessibilityEpisodeStateControls"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "accessibilityLabel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAXStringForVariables();
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (unint64_t)accessibilityTraits
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PlayControlsStackViewAccessibility;
  return *MEMORY[0x24BDF73B0] | -[PlayControlsStackViewAccessibility accessibilityTraits](&v3, sel_accessibilityTraits);
}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  unint64_t v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)PlayControlsStackViewAccessibility;
  -[PlayControlsStackViewAccessibility _accessibilityLoadAccessibilityInformation](&v9, sel__accessibilityLoadAccessibilityInformation);
  -[PlayControlsStackViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("accessibilityPlayPauseButton"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[PlayControlsStackViewAccessibility safeIntegerForKey:](self, "safeIntegerForKey:", CFSTR("accessibilityPlayButtonState"));
  if (v4 > 2)
  {
    v5 = 0;
  }
  else
  {
    accessibilityLocalizedString(off_2502FD098[v4]);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __80__PlayControlsStackViewAccessibility__accessibilityLoadAccessibilityInformation__block_invoke;
  v7[3] = &unk_2502FD078;
  v8 = v5;
  v6 = v5;
  objc_msgSend(v3, "_setAccessibilityLabelBlock:", v7);

}

id __80__PlayControlsStackViewAccessibility__accessibilityLoadAccessibilityInformation__block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

- (void)accessibilityUpdatePlayButtonState
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PlayControlsStackViewAccessibility;
  -[PlayControlsStackViewAccessibility accessibilityUpdatePlayButtonState](&v3, sel_accessibilityUpdatePlayButtonState);
  -[PlayControlsStackViewAccessibility _accessibilityLoadAccessibilityInformation](self, "_accessibilityLoadAccessibilityInformation");
}

@end
