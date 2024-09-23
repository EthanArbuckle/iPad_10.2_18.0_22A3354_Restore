@implementation MRURoutingTableViewCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("MRURoutingTableViewCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MRURoutingTableViewCell"), CFSTR("titleLabel"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MRURoutingTableViewCell"), CFSTR("subtitleView"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MRURoutingTableViewCell"), CFSTR("didTapToExpand"), "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MRURoutingTableViewCell"), CFSTR("routingAccessoryView"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MRURoutingTableViewCell"), CFSTR("volumeController"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MRURoutingAccessoryView"), CFSTR("state"), "q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MRURoutingSubtitleView"), CFSTR("textLabel"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MRURoutingTableViewCell"), CFSTR("volumeSlider"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("MRURoutingTableViewCell"), CFSTR("_iconImageView"), "UIImageView");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("MRURoutingTableViewCell"), CFSTR("_routingAccessoryView"), "MRURoutingAccessoryView");
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MRURoutingTableViewCell"), CFSTR("showChevron"), "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("MRURoutingTableViewCell"), CFSTR("_outlineImageView"), "UIImageView");

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
  void *v7;
  __CFString *v8;
  uint64_t v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v14;

  -[MRURoutingTableViewCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("titleLabel"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[MRURoutingTableViewCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("subtitleView"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "safeValueForKey:", CFSTR("textLabel"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[MRURoutingTableViewCellAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("_iconImageView"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "accessibilityLabel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v7, "isAXAttributedString")
    && objc_msgSend(v7, "hasAttribute:", *MEMORY[0x24BDFEB80]))
  {
    if (objc_msgSend(v7, "isEqualToString:", CFSTR("speaker.wave.2.fill")))
    {
      v8 = CFSTR("speaker.route");
LABEL_7:
      accessibilityLocalizedString(v8);
      v9 = objc_claimAutoreleasedReturnValue();

      v7 = (void *)v9;
      goto LABEL_11;
    }
    if (objc_msgSend(v7, "isEqualToString:", CFSTR("headphones")))
    {
      v8 = CFSTR("headphones.route");
      goto LABEL_7;
    }
    AXLogCommon();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      -[MRURoutingTableViewCellAccessibility accessibilityLabel].cold.1((uint64_t)v7, v10);

    v7 = 0;
  }
LABEL_11:
  objc_msgSend(v3, "accessibilityLabel");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "accessibilityLabel");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAXStringForVariables();
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (id)accessibilityValue
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  if (-[MRURoutingTableViewCellAccessibility _accessibilityRoutingState](self, "_accessibilityRoutingState") == 2)
  {
    accessibilityLocalizedString(CFSTR("route.state.pending.value"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  if (-[MRURoutingTableViewCellAccessibility _accessibilityShowVolumeSlider](self, "_accessibilityShowVolumeSlider"))
  {
    -[MRURoutingTableViewCellAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("volumeSlider"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "accessibilityValue");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = 0;
  }
  __UIAXStringForVariables();
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (unint64_t)accessibilityTraits
{
  unint64_t v3;
  uint64_t v4;
  unint64_t v5;
  _BOOL4 v6;
  uint64_t v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)MRURoutingTableViewCellAccessibility;
  v3 = -[MRURoutingTableViewCellAccessibility accessibilityTraits](&v9, sel_accessibilityTraits);
  if ((unint64_t)(-[MRURoutingTableViewCellAccessibility _accessibilityRoutingState](self, "_accessibilityRoutingState")- 3) >= 2)v4 = 0;
  else
    v4 = *MEMORY[0x24BDF7400];
  v5 = v4 | v3;
  v6 = -[MRURoutingTableViewCellAccessibility _accessibilityShowVolumeSlider](self, "_accessibilityShowVolumeSlider");
  v7 = *MEMORY[0x24BDF73A0];
  if (!v6)
    v7 = 0;
  return v5 | v7;
}

- (id)accessibilityCustomActions
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;
  _QWORD v9[4];
  id v10;
  id location;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x24BDAC8D0];
  if (-[MRURoutingTableViewCellAccessibility safeBoolForKey:](self, "safeBoolForKey:", CFSTR("showChevron")))
  {
    objc_initWeak(&location, self);
    v3 = objc_alloc(MEMORY[0x24BDF6788]);
    accessibilityLocalizedString(CFSTR("expand.group.action"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __66__MRURoutingTableViewCellAccessibility_accessibilityCustomActions__block_invoke;
    v9[3] = &unk_2502727A0;
    objc_copyWeak(&v10, &location);
    v5 = (void *)objc_msgSend(v3, "initWithName:actionHandler:", v4, v9);

    v12[0] = v5;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v12, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_destroyWeak(&v10);
    objc_destroyWeak(&location);
    return v6;
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)MRURoutingTableViewCellAccessibility;
    -[MRURoutingTableViewCellAccessibility accessibilityCustomActions](&v8, sel_accessibilityCustomActions);
    return (id)objc_claimAutoreleasedReturnValue();
  }
}

uint64_t __66__MRURoutingTableViewCellAccessibility_accessibilityCustomActions__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  AXPerformSafeBlock();

  return 1;
}

uint64_t __66__MRURoutingTableViewCellAccessibility_accessibilityCustomActions__block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "didTapToExpand");
  return AXPerformBlockOnMainThreadAfterDelay();
}

void __66__MRURoutingTableViewCellAccessibility_accessibilityCustomActions__block_invoke_3()
{
  UIAccessibilityPostNotification(*MEMORY[0x24BDF72C8], 0);
}

- (int64_t)_accessibilityRoutingState
{
  void *v2;
  int64_t v3;

  -[MRURoutingTableViewCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("routingAccessoryView"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "safeIntegerForKey:", CFSTR("state"));

  return v3;
}

- (BOOL)_accessibilityShowVolumeSlider
{
  void *v3;
  void *v4;
  char v5;

  objc_opt_class();
  -[MRURoutingTableViewCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("volumeController"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = objc_msgSend(v4, "isVolumeControlAvailable");
  return v5;
}

- (CGPoint)accessibilityActivationPoint
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  objc_super v10;
  CGPoint result;

  if (-[MRURoutingTableViewCellAccessibility safeBoolForKey:](self, "safeBoolForKey:", CFSTR("showChevron")))
  {
    -[MRURoutingTableViewCellAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("_outlineImageView"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "accessibilityActivationPoint");
    v5 = v4;
    v7 = v6;

    v8 = v5;
    v9 = v7;
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)MRURoutingTableViewCellAccessibility;
    -[MRURoutingTableViewCellAccessibility accessibilityActivationPoint](&v10, sel_accessibilityActivationPoint);
  }
  result.y = v9;
  result.x = v8;
  return result;
}

- (void)accessibilityIncrement
{
  id v3;

  if (-[MRURoutingTableViewCellAccessibility _accessibilityShowVolumeSlider](self, "_accessibilityShowVolumeSlider"))
  {
    -[MRURoutingTableViewCellAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("_volumeSlider"));
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "accessibilityIncrement");

  }
}

- (void)accessibilityDecrement
{
  id v3;

  if (-[MRURoutingTableViewCellAccessibility _accessibilityShowVolumeSlider](self, "_accessibilityShowVolumeSlider"))
  {
    -[MRURoutingTableViewCellAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("_volumeSlider"));
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "accessibilityDecrement");

  }
}

- (void)accessibilityLabel
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_23273D000, a2, OS_LOG_TYPE_ERROR, "Missing icon type for %@", (uint8_t *)&v2, 0xCu);
}

@end
