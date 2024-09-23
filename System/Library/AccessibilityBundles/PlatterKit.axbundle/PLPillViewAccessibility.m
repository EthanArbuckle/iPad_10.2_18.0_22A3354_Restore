@implementation PLPillViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("PLPillView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PLPillView"), CFSTR("centerContentItems"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PLPillView"), CFSTR("leadingAccessoryView"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PLPillView"), CFSTR("trailingAccessoryView"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("PLPillView"), CFSTR("_materialView"), "MTMaterialView");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("PLPillView"), CFSTR("_contentView"), "PLPillContentView");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("PLPillContentView"), CFSTR("_leadingAccessoryView"), "UIView");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("PLPillContentView"), CFSTR("_trailingAccessoryView"), "UIView");
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PLPillContentItem"), CFSTR("text"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PLPillContentItem"), CFSTR("attributedText"), "@", 0);

}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v14;
  const __CFString *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  -[PLPillViewAccessibility safeArrayForKey:](self, "safeArrayForKey:", CFSTR("centerContentItems"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v3)
  {
    v4 = v3;
    v5 = 0;
    v6 = *(_QWORD *)v17;
    do
    {
      v7 = 0;
      v8 = v5;
      do
      {
        if (*(_QWORD *)v17 != v6)
          objc_enumerationMutation(v2);
        v9 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * v7);
        objc_msgSend(v9, "safeStringForKey:", CFSTR("text"), v14, v15);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v10)
        {
          objc_opt_class();
          objc_msgSend(v9, "safeValueForKey:", CFSTR("attributedText"));
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          __UIAccessibilityCastAsClass();
          v12 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v12, "string");
          v10 = (void *)objc_claimAutoreleasedReturnValue();

        }
        v14 = v10;
        v15 = CFSTR("__AXStringForVariablesSentinel");
        __UIAXStringForVariables();
        v5 = (void *)objc_claimAutoreleasedReturnValue();

        ++v7;
        v8 = v5;
      }
      while (v4 != v7);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v16, v20, 16, v10, CFSTR("__AXStringForVariablesSentinel"));
    }
    while (v4);
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)_accessibilitySupplementaryHeaderViews
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  objc_super v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x24BDAC8D0];
  objc_opt_class();
  -[PLPillViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("leadingAccessoryView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v9[0] = v4;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v9, 1);
    v5 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)PLPillViewAccessibility;
    -[PLPillViewAccessibility _accessibilitySupplementaryHeaderViews](&v8, sel__accessibilitySupplementaryHeaderViews);
    v5 = objc_claimAutoreleasedReturnValue();
  }
  v6 = (void *)v5;

  return v6;
}

- (id)_accessibilitySupplementaryFooterViews
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  objc_super v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x24BDAC8D0];
  objc_opt_class();
  -[PLPillViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("trailingAccessoryView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v9[0] = v4;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v9, 1);
    v5 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)PLPillViewAccessibility;
    -[PLPillViewAccessibility _accessibilitySupplementaryFooterViews](&v8, sel__accessibilitySupplementaryFooterViews);
    v5 = objc_claimAutoreleasedReturnValue();
  }
  v6 = (void *)v5;

  return v6;
}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x24BDF7408] | *MEMORY[0x24BDF73B0];
}

- (BOOL)_accessibilitySupportsActivateAction
{
  return 1;
}

- (id)accessibilityPath
{
  void *v2;
  void *v3;

  -[PLPillViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_materialView"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accessibilityPath");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (unsigned)_accessibilityMediaAnalysisOptions
{
  return 0;
}

- (id)automationElements
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[PLPillViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_contentView"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x24BDBCE30];
  objc_msgSend(v2, "safeValueForKey:", CFSTR("_leadingAccessoryView"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "safeValueForKey:", CFSTR("_trailingAccessoryView"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "axArrayByIgnoringNilElementsWithCount:", 2, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

@end
