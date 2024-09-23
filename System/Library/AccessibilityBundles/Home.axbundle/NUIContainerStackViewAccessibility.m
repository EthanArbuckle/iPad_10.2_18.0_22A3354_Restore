@implementation NUIContainerStackViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("NUIContainerStackView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("NUIContainerStackView"), CFSTR("UIView"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("NUIContainerView"), CFSTR("visibleArrangedSubviews"), "@", 0);

}

- (id)accessibilityLabel
{
  void *v2;
  void *v3;

  -[NUIContainerStackViewAccessibility _axVisibleViews](self, "_axVisibleViews");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  MEMORY[0x2349114CC]();
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)_axVisibleViews
{
  void *v3;
  void *v4;

  objc_opt_class();
  -[NUIContainerStackViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("visibleArrangedSubviews"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BOOL)canBecomeFocused
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  objc_opt_class();
  __UIAccessibilityCastAsClass();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "gestureRecognizers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v9;
    while (2)
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v9 != v5)
          objc_enumerationMutation(v3);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          LOBYTE(v4) = 1;
          goto LABEL_11;
        }
      }
      v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
      if (v4)
        continue;
      break;
    }
  }
LABEL_11:

  return v4;
}

@end
