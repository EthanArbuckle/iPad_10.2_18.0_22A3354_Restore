@implementation NUIContainerStackViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("NUIContainerStackView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (id)_axArrangedSubviews
{
  void *v3;
  void *v4;

  objc_opt_class();
  -[NUIContainerStackViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_arrangedSubviews"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:hasInstanceVariable:withType:", CFSTR("NUIContainerStackView"), CFSTR("_arrangedSubviews"), "NSMutableArray");
}

- (BOOL)isAccessibilityElement
{
  void *v2;
  BOOL v3;

  -[NUIContainerStackViewAccessibility _axArrangedSubviews](self, "_axArrangedSubviews");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count") == 2;

  return v3;
}

- (id)accessibilityLabel
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v10;
  objc_super v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  -[NUIContainerStackViewAccessibility _axArrangedSubviews](self, "_axArrangedSubviews");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v13;
    while (2)
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v13 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * v7);
        MEMORY[0x234917EEC](CFSTR("UILabel"));
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v8, "accessibilityLabel");
          v10 = (void *)objc_claimAutoreleasedReturnValue();

          return v10;
        }
        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v5)
        continue;
      break;
    }
  }

  v11.receiver = self;
  v11.super_class = (Class)NUIContainerStackViewAccessibility;
  -[NUIContainerStackViewAccessibility accessibilityLabel](&v11, sel_accessibilityLabel);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (unint64_t)accessibilityTraits
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)NUIContainerStackViewAccessibility;
  return *MEMORY[0x24BDF73B0] | -[NUIContainerStackViewAccessibility accessibilityTraits](&v3, sel_accessibilityTraits);
}

@end
