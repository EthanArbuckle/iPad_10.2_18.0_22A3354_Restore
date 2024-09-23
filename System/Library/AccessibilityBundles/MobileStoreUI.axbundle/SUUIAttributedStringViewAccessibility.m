@implementation SUUIAttributedStringViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SUUIAttributedStringView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("SUUIAttributedStringView"), CFSTR("_layout"), "SUUIAttributedStringLayout");
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SUUIAttributedStringLayout"), CFSTR("attributedString"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SUUIAttributedStringView"), CFSTR("requiredBadges"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SUUIAttributedStringView"), CFSTR("_setupTapLocatorContainer"), "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("SUUIAttributedStringView"), CFSTR("_containsLinks"), "B");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("SUUIAttributedStringView"), CFSTR("_layoutManager"), "NSLayoutManager");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("SUUIAttributedStringView"), CFSTR("_textContainer"), "NSTextContainer");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("SUUIAttributedStringView"), CFSTR("_requiredBadges"), "NSArray");

}

- (BOOL)isAccessibilityElement
{
  void *v2;
  void *v3;
  void *v4;

  -[SUUIAttributedStringViewAccessibility accessibilityLabel](self, "accessibilityLabel");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD14A8], "whitespaceAndNewlineCharacterSet");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringByTrimmingCharactersInSet:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v2) = objc_msgSend(v4, "length") != 0;
  return (char)v2;
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
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  uint64_t v17;
  void *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  char v24;
  char v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  -[SUUIAttributedStringViewAccessibility accessibilityUserDefinedLabel](self, "accessibilityUserDefinedLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[SUUIAttributedStringViewAccessibility accessibilityUserDefinedLabel](self, "accessibilityUserDefinedLabel");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v25 = 0;
    objc_opt_class();
    v24 = 0;
    -[SUUIAttributedStringViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_layout"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    __UIAccessibilitySafeClass();
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "safeValueForKey:", CFSTR("attributedString"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    __UIAccessibilityCastAsClass();
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "string");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  v25 = 0;
  objc_opt_class();
  -[SUUIAttributedStringViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_requiredBadges"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v11 = v10;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v20, v26, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v21 != v14)
          objc_enumerationMutation(v11);
        v16 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
        if (v16)
        {
          objc_msgSend(v16, "accessibilityLabel");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          __UIAXStringForVariables();
          v17 = objc_claimAutoreleasedReturnValue();

          v4 = (void *)v17;
        }
      }
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v20, v26, 16);
    }
    while (v13);
  }

  return v4;
}

- (unint64_t)accessibilityTraits
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  _QWORD v11[6];
  _QWORD v12[4];
  char v13;
  objc_super v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  id v18;

  v15 = 0;
  v16 = &v15;
  v17 = 0x2020000000;
  v18 = 0;
  v14.receiver = self;
  v14.super_class = (Class)SUUIAttributedStringViewAccessibility;
  v18 = -[SUUIAttributedStringViewAccessibility accessibilityTraits](&v14, sel_accessibilityTraits);
  objc_opt_class();
  v13 = 0;
  -[SUUIAttributedStringViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_layout"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilitySafeClass();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "safeValueForKey:", CFSTR("attributedString"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v12[0] = 0;
  v12[1] = v12;
  v12[2] = 0x2020000000;
  v12[3] = 0;
  v7 = objc_msgSend(v6, "length");
  v8 = *MEMORY[0x24BDF65F8];
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __60__SUUIAttributedStringViewAccessibility_accessibilityTraits__block_invoke;
  v11[3] = &unk_2502A69E0;
  v11[4] = v12;
  v11[5] = &v15;
  objc_msgSend(v6, "enumerateAttribute:inRange:options:usingBlock:", v8, 0, v7, 0, v11);
  v9 = v16[3];
  _Block_object_dispose(v12, 8);

  _Block_object_dispose(&v15, 8);
  return v9;
}

uint64_t __60__SUUIAttributedStringViewAccessibility_accessibilityTraits__block_invoke(uint64_t a1, void *a2)
{
  double v3;
  uint64_t result;
  double v5;

  v3 = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  result = objc_msgSend(a2, "lineHeight");
  if (v3 >= v5)
    v5 = v3;
  *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = v5;
  if (*(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) > 20.0)
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) |= *MEMORY[0x24BDF73C0];
  return result;
}

- (id)_accessibilityLinks
{
  void *v3;
  void *v4;
  int v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id v12;
  id v13;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(uint64_t, uint64_t, uint64_t, uint64_t);
  void *v18;
  id v19;
  id v20;
  SUUIAttributedStringViewAccessibility *v21;
  id v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t (*v26)(uint64_t);
  void *v27;
  SUUIAttributedStringViewAccessibility *v28;

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUUIAttributedStringViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_containsLinks"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "BOOLValue");

  if (v5)
  {
    -[SUUIAttributedStringViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("layout"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "safeValueForKey:", CFSTR("attributedString"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = objc_msgSend(v7, "length");
    if (v8 >= 1)
    {
      v9 = v8;
      v10 = MEMORY[0x24BDAC760];
      v24 = MEMORY[0x24BDAC760];
      v25 = 3221225472;
      v26 = __60__SUUIAttributedStringViewAccessibility__accessibilityLinks__block_invoke;
      v27 = &unk_2502A6990;
      v28 = self;
      AXPerformSafeBlock();
      -[SUUIAttributedStringViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_layoutManager"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[SUUIAttributedStringViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_textContainer"));
      v15 = v10;
      v16 = 3221225472;
      v17 = __60__SUUIAttributedStringViewAccessibility__accessibilityLinks__block_invoke_2;
      v18 = &unk_2502A6A08;
      v19 = v11;
      v20 = (id)objc_claimAutoreleasedReturnValue();
      v21 = self;
      v22 = v7;
      v23 = v3;
      v12 = v20;
      v13 = v11;
      objc_msgSend(v22, "enumerateAttribute:inRange:options:usingBlock:", CFSTR("SUUILinkAttributeName"), 0, v9, 0, &v15);

    }
    -[SUUIAttributedStringViewAccessibility _accessibilitySetRetainedValue:forKey:](self, "_accessibilitySetRetainedValue:forKey:", v3, CFSTR("kAXLinks"), v15, v16, v17, v18);

  }
  return v3;
}

uint64_t __60__SUUIAttributedStringViewAccessibility__accessibilityLinks__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_setupTapLocatorContainer");
}

void __60__SUUIAttributedStringViewAccessibility__accessibilityLinks__block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  void *v7;
  void *v8;
  id v9;

  if (a2)
  {
    objc_msgSend(*(id *)(a1 + 32), "boundingRectForGlyphRange:inTextContainer:", a3, a4, *(_QWORD *)(a1 + 40));
    v9 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDF67A0]), "initWithAccessibilityContainer:", *(_QWORD *)(a1 + 48));
    objc_msgSend(*(id *)(a1 + 56), "attributedSubstringFromRange:", a3, a4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "string");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setAccessibilityLabel:", v8);

    UIAccessibilityFrameForBounds();
    objc_msgSend(v9, "setAccessibilityFrame:");
    objc_msgSend(v9, "setAccessibilityTraits:", *MEMORY[0x24BDF73D8]);
    objc_msgSend(*(id *)(a1 + 64), "addObject:", v9);

  }
}

- (id)accessibilityCustomRotors
{
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;
  void *v7;
  uint64_t v9;
  uint64_t v10;
  id (*v11)(uint64_t, void *);
  void *v12;
  id v13;
  id location;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x24BDAC8D0];
  -[SUUIAttributedStringViewAccessibility _accessibilityLinks](self, "_accessibilityLinks");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  if (!v4)
    return 0;
  -[SUUIAttributedStringViewAccessibility _accessibilityValueForKey:](self, "_accessibilityValueForKey:", CFSTR("AXCustomRotor"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    objc_initWeak(&location, self);
    v6 = objc_alloc(MEMORY[0x24BDF6790]);
    v9 = MEMORY[0x24BDAC760];
    v10 = 3221225472;
    v11 = __66__SUUIAttributedStringViewAccessibility_accessibilityCustomRotors__block_invoke;
    v12 = &unk_2502A6A30;
    objc_copyWeak(&v13, &location);
    v5 = (void *)objc_msgSend(v6, "initWithSystemType:itemSearchBlock:", 1, &v9);
    -[SUUIAttributedStringViewAccessibility _accessibilitySetRetainedValue:forKey:](self, "_accessibilitySetRetainedValue:forKey:", v5, CFSTR("AXCustomRotor"), v9, v10, v11, v12);
    objc_destroyWeak(&v13);
    objc_destroyWeak(&location);
  }
  v15[0] = v5;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v15, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

id __66__SUUIAttributedStringViewAccessibility_accessibilityCustomRotors__block_invoke(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;
  void *v5;
  id v6;
  void *v7;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "_accessibilityLinks");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_loadWeakRetained(v2);
  objc_msgSend(v6, "_accessibilityCustomRotorResultHelper:array:", v3, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)accessibilityCustomRotorTitles
{
  return (id)MEMORY[0x24BDBD1A8];
}

- (id)accessibilityCustomRotorItemsAtIndex:(int64_t)a3
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  if (a3)
  {
    v5 = 0;
  }
  else
  {
    -[SUUIAttributedStringViewAccessibility _accessibilityLinks](self, "_accessibilityLinks", v3, v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v5;
}

@end
