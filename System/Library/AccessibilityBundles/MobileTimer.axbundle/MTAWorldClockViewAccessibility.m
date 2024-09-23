@implementation MTAWorldClockViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("MTAWorldClockView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MTAWorldClockView"), CFSTR("cityNameLabel"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MTAWorldClockView"), CFSTR("timeZoneOffsetLabel"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MTAWorldClockView"), CFSTR("sunriseLabel"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MTAWorldClockView"), CFSTR("sunsetLabel"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MTAWorldClockCollectionCell"), CFSTR("deleteTapped:"), "v", "@", 0);

}

- (id)accessibilityLabel
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  -[MTAWorldClockViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("cityNameLabel"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "accessibilityLabel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[MTAWorldClockViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("analogClock"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "accessibilityLabel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[MTAWorldClockViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("timeZoneOffsetLabel"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "accessibilityLabel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[MTAWorldClockViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("sunriseLabel"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "accessibilityLabel");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[MTAWorldClockViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("sunsetLabel"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "accessibilityLabel");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  __UIAXStringForVariables();
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (BOOL)isAccessibilityElement
{
  BOOL v3;
  void *v4;

  v3 = -[MTAWorldClockViewAccessibility _accessibilityElementShouldBeInvalid](self, "_accessibilityElementShouldBeInvalid");
  -[MTAWorldClockViewAccessibility _accessibilityAncestorIsKindOf:](self, "_accessibilityAncestorIsKindOf:", MEMORY[0x234916758](CFSTR("FullScreenWorldClockCollectionCell")));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return !v4 && !v3;
}

- (BOOL)_accessibilityElementShouldBeInvalid
{
  void *v3;
  void *v4;
  void *v5;
  float v6;
  void *v7;
  char v8;

  MEMORY[0x234916758](CFSTR("MTAWorldClockCollectionCell"), a2);
  -[MTAWorldClockViewAccessibility _accessibilityAncestorIsKindOf:](self, "_accessibilityAncestorIsKindOf:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "safeValueForKey:", CFSTR("alpha"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "floatValue");
    if (v6 <= 0.0)
    {
      v8 = 1;
    }
    else
    {
      -[MTAWorldClockViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("isHidden"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "BOOLValue");

    }
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)_accessibilityFuzzyHitTestElements
{
  return (id)-[MTAWorldClockViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("subviews"));
}

- (BOOL)_accessibilityHitTestShouldFallbackToNearestChild
{
  return 1;
}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x24BEBB110];
}

- (id)accessibilityCustomActions
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  objc_super v10;

  v3 = (void *)MEMORY[0x24BDBCEB8];
  v10.receiver = self;
  v10.super_class = (Class)MTAWorldClockViewAccessibility;
  -[MTAWorldClockViewAccessibility accessibilityCustomActions](&v10, sel_accessibilityCustomActions);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "arrayWithArray:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_alloc(MEMORY[0x24BDF6788]);
  accessibilityLocalizedString(CFSTR("clock.delete"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v6, "initWithName:target:selector:", v7, self, sel__axDeleteClock);

  objc_msgSend(v8, "setSortPriority:", *MEMORY[0x24BEBAD58]);
  objc_msgSend(v5, "addObject:", v8);

  return v5;
}

- (BOOL)_axDeleteClock
{
  void *v2;
  void *v3;
  char v4;
  id v6;
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  char v10;

  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 0;
  -[MTAWorldClockViewAccessibility _accessibilityAncestorIsKindOf:](self, "_accessibilityAncestorIsKindOf:", MEMORY[0x234916758](CFSTR("MTAWorldClockCollectionCell"), a2));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    v6 = v2;
    AXPerformSafeBlock();

  }
  v4 = *((_BYTE *)v8 + 24);

  _Block_object_dispose(&v7, 8);
  return v4;
}

uint64_t __48__MTAWorldClockViewAccessibility__axDeleteClock__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "deleteTapped:", 0);
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
  return result;
}

@end
