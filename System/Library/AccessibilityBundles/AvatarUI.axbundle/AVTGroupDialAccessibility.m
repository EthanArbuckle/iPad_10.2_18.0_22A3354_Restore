@implementation AVTGroupDialAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("AVTGroupDial");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("AVTGroupDial"), CFSTR("currentSelectedItemIndex"), "q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("AVTGroupDial"), CFSTR("delegate"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("AVTGroupDial"), CFSTR("setSelectedGroupIndex:"), "v", "q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("AVTGroupPickerItem"), CFSTR("localizedName"), "@", 0);
  objc_msgSend(v3, "validateProtocol:hasRequiredInstanceMethod:", CFSTR("AVTGroupPickerDelegate"), CFSTR("groupPicker:didSelectGroupAtIndex:tapped:"));
  objc_msgSend(v3, "validateProtocol:hasRequiredInstanceMethod:", CFSTR("AVTGroupPicker"), CFSTR("groupItems"));

}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  return accessibilityLocalizedString(CFSTR("editor.picker"));
}

- (id)accessibilityValue
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v11;

  v3 = -[AVTGroupDialAccessibility safeIntegerForKey:](self, "safeIntegerForKey:", CFSTR("currentSelectedItemIndex"));
  -[AVTGroupDialAccessibility safeArrayForKey:](self, "safeArrayForKey:", CFSTR("groupItems"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectAtIndex:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "safeStringForKey:", CFSTR("localizedName"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x24BDD17C8];
  accessibilityLocalizedString(CFSTR("starfish.number.of"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "localizedStringWithFormat:", v8, v3 + 1, objc_msgSend(v4, "count"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAXStringForVariables();
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (unint64_t)accessibilityTraits
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AVTGroupDialAccessibility;
  return *MEMORY[0x24BDF73A0] | -[AVTGroupDialAccessibility accessibilityTraits](&v3, sel_accessibilityTraits);
}

- (BOOL)_axScrollDial:(BOOL)a3
{
  _BOOL4 v3;
  uint64_t v5;
  unint64_t v6;
  void *v7;
  BOOL v8;

  v3 = a3;
  v5 = -[AVTGroupDialAccessibility safeIntegerForKey:](self, "safeIntegerForKey:", CFSTR("currentSelectedItemIndex"));
  v6 = v5;
  if (v3)
  {
    -[AVTGroupDialAccessibility safeArrayForKey:](self, "safeArrayForKey:", CFSTR("groupItems"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v6 < objc_msgSend(v7, "count") - 1;

  }
  else
  {
    v8 = v5 > 0;
  }
  AXPerformSafeBlock();
  return v8;
}

void __43__AVTGroupDialAccessibility__axScrollDial___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "setSelectedGroupIndex:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "safeValueForKey:", CFSTR("delegate"));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "groupPicker:didSelectGroupAtIndex:tapped:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), 0);

}

- (void)accessibilityIncrement
{
  -[AVTGroupDialAccessibility _axScrollDial:](self, "_axScrollDial:", 1);
}

- (void)accessibilityDecrement
{
  -[AVTGroupDialAccessibility _axScrollDial:](self, "_axScrollDial:", 0);
}

- (BOOL)accessibilityScroll:(int64_t)a3
{
  uint64_t v3;

  if (a3 == 2)
  {
    v3 = 1;
    return -[AVTGroupDialAccessibility _axScrollDial:](self, "_axScrollDial:", v3);
  }
  if (a3 == 1)
  {
    v3 = 0;
    return -[AVTGroupDialAccessibility _axScrollDial:](self, "_axScrollDial:", v3);
  }
  return 0;
}

@end
