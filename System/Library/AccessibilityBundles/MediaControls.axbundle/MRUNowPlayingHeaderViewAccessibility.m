@implementation MRUNowPlayingHeaderViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("MRUNowPlayingHeaderView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MRUNowPlayingHeaderView"), CFSTR("labelView"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MRUNowPlayingHeaderView"), CFSTR("transportButton"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MRUNowPlayingHeaderView"), CFSTR("routingButton"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MRUNowPlayingHeaderView"), CFSTR("layout"), "q", 0);
  objc_msgSend(v3, "validateClass:", CFSTR("MRUControlCenterCollectionViewCell"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MRUNowPlayingLabelView"), CFSTR("routeLabel"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MRUNowPlayingLabelView"), CFSTR("titleMarqueeView"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MRUNowPlayingLabelView"), CFSTR("subtitleMarqueeView"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MRUMarqueeLabel"), CFSTR("text"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MRUNowPlayingLabelView"), CFSTR("placeholder"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MRUNowPlayingHeaderView"), CFSTR("hapticView"), "@", 0);

}

- (id)_axMakeNowPlayingHeaderViewElement
{
  void *v3;
  uint64_t v4;
  _QWORD v6[4];
  id v7;
  _QWORD v8[4];
  id v9;
  id location;

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF67A0]), "initWithAccessibilityContainer:", self);
  objc_initWeak(&location, self);
  v4 = MEMORY[0x24BDAC760];
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __74__MRUNowPlayingHeaderViewAccessibility__axMakeNowPlayingHeaderViewElement__block_invoke;
  v8[3] = &unk_250272648;
  objc_copyWeak(&v9, &location);
  objc_msgSend(v3, "_setAccessibilityLabelBlock:", v8);
  v6[0] = v4;
  v6[1] = 3221225472;
  v6[2] = __74__MRUNowPlayingHeaderViewAccessibility__axMakeNowPlayingHeaderViewElement__block_invoke_2;
  v6[3] = &unk_250272698;
  objc_copyWeak(&v7, &location);
  objc_msgSend(v3, "_setAccessibilityFrameBlock:", v6);
  objc_destroyWeak(&v7);
  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
  return v3;
}

id __74__MRUNowPlayingHeaderViewAccessibility__axMakeNowPlayingHeaderViewElement__block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  void *v3;
  double v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v11;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "safeValueForKey:", CFSTR("labelView"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "safeUIViewForKey:", CFSTR("routeLabel"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "alpha");
  if (v4 <= 0.01)
  {
    v5 = 0;
  }
  else
  {
    objc_msgSend(v3, "accessibilityLabel");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v2, "safeValueForKey:", CFSTR("titleMarqueeView"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "safeValueForKey:", CFSTR("subtitleMarqueeView"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "safeStringForKey:", CFSTR("text"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "safeStringForKey:", CFSTR("text"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAXStringForVariables();
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

double __74__MRUNowPlayingHeaderViewAccessibility__axMakeNowPlayingHeaderViewElement__block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  double v3;
  double v4;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (objc_msgSend(WeakRetained, "_accessibilityNowPlayingLayout") == 3)
    objc_msgSend(WeakRetained, "_accessibilityContainingMRUControlCenterCollectionViewCell");
  else
    objc_msgSend(WeakRetained, "safeValueForKey:", CFSTR("labelView"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accessibilityFrame");
  v4 = v3;

  return v4;
}

- (id)accessibilityElements
{
  _QWORD *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x24BDAC8D0];
  v3 = (_QWORD *)MEMORY[0x24BEBB308];
  -[MRUNowPlayingHeaderViewAccessibility _accessibilityValueForKey:](self, "_accessibilityValueForKey:", *MEMORY[0x24BEBB308]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    -[MRUNowPlayingHeaderViewAccessibility _axMakeNowPlayingHeaderViewElement](self, "_axMakeNowPlayingHeaderViewElement");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = v5;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v12, 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    -[MRUNowPlayingHeaderViewAccessibility _accessibilitySetRetainedValue:forKey:](self, "_accessibilitySetRetainedValue:forKey:", v4, *v3);
  }
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithArray:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[MRUNowPlayingHeaderViewAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("transportButton"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[MRUNowPlayingHeaderViewAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("routingButton"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "alpha");
  if (v9 > 0.01)
    objc_msgSend(v6, "axSafelyAddObject:", v7);
  objc_msgSend(v8, "alpha");
  if (v10 > 0.01)
    objc_msgSend(v6, "axSafelyAddObject:", v8);

  return v6;
}

- (id)_accessibilityHitTest:(CGPoint)a3 withEvent:(id)a4
{
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)MRUNowPlayingHeaderViewAccessibility;
  -[MRUNowPlayingHeaderViewAccessibility _accessibilityHitTest:withEvent:](&v8, sel__accessibilityHitTest_withEvent_, a4, a3.x, a3.y);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    -[MRUNowPlayingHeaderViewAccessibility _accessibilityValueForKey:](self, "_accessibilityValueForKey:", *MEMORY[0x24BEBB308]);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "firstObject");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v5;
}

- (int64_t)_accessibilityNowPlayingLayout
{
  return -[MRUNowPlayingHeaderViewAccessibility safeIntegerForKey:](self, "safeIntegerForKey:", CFSTR("layout"));
}

- (id)_accessibilityContainingMRUControlCenterCollectionViewCell
{
  void *v3;
  BOOL v4;
  void *v5;

  if (_accessibilityContainingMRUControlCenterCollectionViewCell_onceToken != -1)
    dispatch_once(&_accessibilityContainingMRUControlCenterCollectionViewCell_onceToken, &__block_literal_global_4);
  if (!_accessibilityContainingMRUControlCenterCollectionViewCell_MRUControlCenterCollectionViewCellClass)
    goto LABEL_10;
  -[MRUNowPlayingHeaderViewAccessibility _accessibilityAncestorIsKindOf:](self, "_accessibilityAncestorIsKindOf:");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
    v4 = 1;
  else
    v4 = _accessibilityContainingMRUControlCenterCollectionViewCell_MRUViewServiceEndpointTableViewCellClass == 0;
  if (v4)
  {

LABEL_10:
    v5 = 0;
    return v5;
  }
  -[MRUNowPlayingHeaderViewAccessibility _accessibilityViewAncestorIsKindOf:](self, "_accessibilityViewAncestorIsKindOf:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  return v5;
}

Class __98__MRUNowPlayingHeaderViewAccessibility__accessibilityContainingMRUControlCenterCollectionViewCell__block_invoke()
{
  Class result;

  _accessibilityContainingMRUControlCenterCollectionViewCell_MRUControlCenterCollectionViewCellClass = (uint64_t)NSClassFromString(CFSTR("MRUControlCenterCollectionViewCell"));
  result = NSClassFromString(CFSTR("MRUViewServiceEndpointTableViewCell"));
  _accessibilityContainingMRUControlCenterCollectionViewCell_MRUViewServiceEndpointTableViewCellClass = (uint64_t)result;
  return result;
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v10;

  -[MRUNowPlayingHeaderViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("labelView"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "safeValueForKey:", CFSTR("routeLabel"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "accessibilityLabel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v2, "safeValueForKey:", CFSTR("placeholder"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accessibilityLabel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "length");

  if (v7)
  {
    objc_msgSend(v2, "accessibilityLabel");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    __UIAXStringForVariables();
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    __UIAXStringForVariables();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v8;
}

- (id)_accessibilitySupplementaryFooterViews
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  objc_super v10;

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v10.receiver = self;
  v10.super_class = (Class)MRUNowPlayingHeaderViewAccessibility;
  -[MRUNowPlayingHeaderViewAccessibility _accessibilitySupplementaryFooterViews](&v10, sel__accessibilitySupplementaryFooterViews);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "axSafelyAddObjectsFromArray:", v4);

  -[MRUNowPlayingHeaderViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("hapticView"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(MEMORY[0x24BDDB958], "sharedManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "musicHapticsEnabled");

    if (v7)
      objc_msgSend(v3, "axSafelyAddObject:", v5);
  }
  -[MRUNowPlayingHeaderViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("transportButton"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "axSafelyAddObject:", v8);

  return v3;
}

@end
