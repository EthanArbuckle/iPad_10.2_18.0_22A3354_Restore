@implementation SUUIToggleButtonAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SUUIToggleButton");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:", CFSTR("SUUIAttributedStringView"));
  objc_msgSend(v3, "validateClass:", CFSTR("SUUIToggleStateCenter"));
  objc_msgSend(v3, "validateClass:", CFSTR("SUUIToggleStateItem"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SUUIToggleButton"), CFSTR("element"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SUUIToggleButton"), CFSTR("toggledTitle"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SUUIToggleButton"), CFSTR("nonToggledTitle"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SUUIToggleButton"), CFSTR("isToggled"), "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("SUUIToggleButton"), CFSTR("_titleToggleString"), "NSString");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("SUUIToggleButton"), CFSTR("_toggled"), "B");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("SUUIToggleButton"), CFSTR("_autoIncrement"), "B");
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SUUIToggleButton"), CFSTR("toggleItemIdentifier"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("SUUIToggleButton"), CFSTR("_autoIncrementCount"), "q");

}

- (id)accessibilityLabel
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;

  -[SUUIToggleButtonAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("element"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "accessibilityLabel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v4, "length")
    || (-[SUUIToggleButtonAccessibility _accessibilityFindAttributedStringView](self, "_accessibilityFindAttributedStringView"), (v6 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
  {
    v5 = v4;
  }
  else
  {
    v7 = v6;
    objc_msgSend(v6, "accessibilityLabel");
    v5 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v5;
}

- (id)_accessibilityFindAttributedStringView
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  -[SUUIToggleButtonAccessibility subviews](self, "subviews");
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v2 = (id)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v11;
    while (2)
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v11 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * v6);
        NSClassFromString(CFSTR("SUUIAttributedStringView"));
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v8 = v7;
          goto LABEL_11;
        }
        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      if (v4)
        continue;
      break;
    }
  }
  v8 = 0;
LABEL_11:

  return v8;
}

- (id)accessibilityValue
{
  void *v3;
  const __CFString *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  objc_super v12;
  char v13;

  objc_msgSend(MEMORY[0x24BDD17C8], "string");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[SUUIToggleButtonAccessibility safeBoolForKey:](self, "safeBoolForKey:", CFSTR("isToggled")))
    v4 = CFSTR("toggledTitle");
  else
    v4 = CFSTR("nonToggledTitle");
  -[SUUIToggleButtonAccessibility safeValueForKey:](self, "safeValueForKey:", v4);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "length"))
  {
    v5 = v5;

    v3 = v5;
  }

  if (!objc_msgSend(v3, "length"))
  {
    v13 = 0;
    objc_opt_class();
    -[SUUIToggleButtonAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_titleToggleString"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    __UIAccessibilityCastAsClass();
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDD14A8], "whitespaceAndNewlineCharacterSet");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "stringByTrimmingCharactersInSet:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDFEA60], "axAttributedStringWithString:", v10);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setAttribute:forKey:", MEMORY[0x24BDBD1C8], *MEMORY[0x24BDFEC88]);
    if (objc_msgSend(v6, "length"))
    {

      goto LABEL_10;
    }

  }
  v12.receiver = self;
  v12.super_class = (Class)SUUIToggleButtonAccessibility;
  -[SUUIToggleButtonAccessibility accessibilityValue](&v12, sel_accessibilityValue);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_10:

  return v6;
}

- (unint64_t)accessibilityTraits
{
  unint64_t v3;
  int v4;
  uint64_t v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SUUIToggleButtonAccessibility;
  v3 = *MEMORY[0x24BDF73B0] | -[SUUIToggleButtonAccessibility accessibilityTraits](&v7, sel_accessibilityTraits);
  v4 = -[SUUIToggleButtonAccessibility safeBoolForKey:](self, "safeBoolForKey:", CFSTR("isToggled"));
  v5 = *MEMORY[0x24BDF7400];
  if (!v4)
    v5 = 0;
  return v3 | v5;
}

- (BOOL)accessibilityActivate
{
  BOOL v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SUUIToggleButtonAccessibility;
  v3 = -[SUUIToggleButtonAccessibility accessibilityActivate](&v5, sel_accessibilityActivate);
  -[SUUIToggleButtonAccessibility safeBoolForKey:](self, "safeBoolForKey:", CFSTR("_toggled"));
  -[SUUIToggleButtonAccessibility safeBoolForKey:](self, "safeBoolForKey:", CFSTR("_autoIncrement"));
  AXPerformSafeBlock();
  return v3;
}

void __54__SUUIToggleButtonAccessibility_accessibilityActivate__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __CFString *v8;
  id v9;

  objc_msgSend(*(id *)(a1 + 32), "safeValueForKey:", CFSTR("toggleItemIdentifier"));
  v9 = (id)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    -[objc_class defaultCenter](NSClassFromString(CFSTR("SUUIToggleStateCenter")), "defaultCenter");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "itemForIdentifier:", v9);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v3;
    if (*(_BYTE *)(a1 + 40))
    {
      v5 = objc_msgSend(v3, "count");
      if (v5 == -1)
        v5 = objc_msgSend(*(id *)(a1 + 32), "safeIntegerForKey:", CFSTR("_autoIncrementCount"));
      if (*(_BYTE *)(a1 + 41))
        v6 = v5 - 1;
      else
        v6 = v5 + 1;
      v7 = v6 & ~(v6 >> 63);
      if (v6 < 1)
      {
        v8 = CFSTR(" ");
      }
      else
      {
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%li"), v7);
        v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v4, "setToggledString:", v8);
      objc_msgSend(v4, "setCount:", v7);

    }
    objc_msgSend(v4, "setToggled:", *(_BYTE *)(a1 + 41) == 0);
    objc_msgSend(v2, "updateItem:", v4);

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "setToggled:", *(_BYTE *)(a1 + 41) == 0);
  }

}

@end
