@implementation UIResponderAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("UIResponder");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (BOOL)_isSerializableAccessibilityElement
{
  return 1;
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id obj;
  id *v4;
  id location[3];

  location[2] = a1;
  location[1] = (id)a2;
  v4 = location;
  obj = 0;
  location[0] = 0;
  objc_storeStrong(location, a3);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("UIResponder"), CFSTR("_keyCommands"), "@", 0);
  objc_storeStrong(v4, obj);
}

- (id)_accessibilityFKAArrowKeysHandled
{
  id v2;
  id v3;
  id v4;
  id v5;
  id v7;
  id v8;
  char v9;
  id v10;
  char v11;
  id v12;
  char v13;
  id v14;
  char v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  id obj;
  uint64_t v21;
  _QWORD __b[8];
  id v23;
  id v24;
  id v25;
  id v26;
  char v27;
  id v28;
  id v29[3];
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v29[2] = self;
  v29[1] = (id)a2;
  v29[0] = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v27 = 0;
  objc_opt_class();
  v26 = (id)__UIAccessibilityCastAsClass();
  v25 = v26;
  objc_storeStrong(&v26, 0);
  v28 = v25;
  while (v28)
  {
    v24 = 0;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v2 = (id)objc_msgSend(v28, "safeArrayForKey:", CFSTR("_keyCommands"));
    else
      v2 = (id)objc_msgSend(v28, "_accessibilityKeyCommands");
    v3 = v24;
    v24 = v2;

    memset(__b, 0, sizeof(__b));
    obj = v24;
    v21 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v30, 16);
    if (v21)
    {
      v17 = *(_QWORD *)__b[2];
      v18 = 0;
      v19 = v21;
      while (1)
      {
        v16 = v18;
        if (*(_QWORD *)__b[2] != v17)
          objc_enumerationMutation(obj);
        v23 = *(id *)(__b[1] + 8 * v18);
        if (!objc_msgSend(v23, "modifierFlags"))
        {
          v14 = (id)objc_msgSend(v23, "input");
          v15 = objc_msgSend(v14, "isEqualToString:", *MEMORY[0x24BDF79B0]);

          if ((v15 & 1) != 0)
          {
            objc_msgSend(v29[0], "addObject:", CFSTR("↑"));
          }
          else
          {
            v12 = (id)objc_msgSend(v23, "input");
            v13 = objc_msgSend(v12, "isEqualToString:", *MEMORY[0x24BDF7990]);

            if ((v13 & 1) != 0)
            {
              objc_msgSend(v29[0], "addObject:", CFSTR("↓"));
            }
            else
            {
              v10 = (id)objc_msgSend(v23, "input");
              v11 = objc_msgSend(v10, "isEqualToString:", *MEMORY[0x24BDF79A0]);

              if ((v11 & 1) != 0)
              {
                objc_msgSend(v29[0], "addObject:", CFSTR("←"));
              }
              else
              {
                v8 = (id)objc_msgSend(v23, "input");
                v9 = objc_msgSend(v8, "isEqualToString:", *MEMORY[0x24BDF79A8]);

                if ((v9 & 1) != 0)
                  objc_msgSend(v29[0], "addObject:", CFSTR("→"));
              }
            }
          }
        }
        ++v18;
        if (v16 + 1 >= v19)
        {
          v18 = 0;
          v19 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v30, 16);
          if (!v19)
            break;
        }
      }
    }

    v4 = (id)objc_msgSend(v28, "nextResponder");
    v5 = v28;
    v28 = v4;

    objc_storeStrong(&v24, 0);
  }
  v7 = v29[0];
  objc_storeStrong(&v28, 0);
  objc_storeStrong(v29, 0);
  return v7;
}

- (id)_keyCommands
{
  uint64_t v2;
  id v4;
  id v5;
  char v6;
  id v7;
  char v8;
  id v9;
  id v10;
  char v11;
  id v12;
  id v13;
  id v14;
  char v15;
  id v16;
  int v17;
  id v18;
  objc_super v19;
  id v20[2];
  UIResponderAccessibility *v21;
  id v22;

  v21 = self;
  v20[1] = (id)a2;
  v19.receiver = self;
  v19.super_class = (Class)UIResponderAccessibility;
  v20[0] = -[UIResponderAccessibility _keyCommands](&v19, sel__keyCommands);
  if ((-[UIResponderAccessibility _accessibilityIsFKARunningForFocusItem](v21, "_accessibilityIsFKARunningForFocusItem") & 1) == 0|| _AXSFullKeyboardAccessPassthroughModeEnabled())
  {
    goto LABEL_23;
  }
  v18 = (id)objc_msgSend((id)*MEMORY[0x24BDF74F8], "_accessibilityNativeFocusElement");
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v15 = 0;
    objc_opt_class();
    v5 = (id)objc_msgSend((id)*MEMORY[0x24BDF74F8], "_accessibilityNativeFocusElement");
    v14 = (id)__UIAccessibilityCastAsClass();

    v13 = v14;
    objc_storeStrong(&v14, 0);
    v16 = v13;
    if ((objc_msgSend(v13, "isFirstResponder") & 1) == 0
      || (v2 = objc_msgSend(v16, "accessibilityTraits"), (v2 & (*MEMORY[0x24BDFF008] | *MEMORY[0x24BDFEED8])) == 0))
    {
      v11 = 0;
      if (v20[0])
      {
        objc_storeStrong(v20, v20[0]);
      }
      else
      {
        v12 = (id)objc_msgSend(MEMORY[0x24BDBCE30], "array");
        v11 = 1;
        objc_storeStrong(v20, v12);
      }
      if ((v11 & 1) != 0)

      v4 = (id)-[UIResponderAccessibility _accessibilityKeyCommands](v21, "_accessibilityKeyCommands");
      v10 = (id)objc_msgSend(v4, "mutableCopy");

      objc_msgSend(v10, "enumerateObjectsUsingBlock:", &__block_literal_global_29);
      if (objc_msgSend(v10, "count"))
      {
        v8 = 0;
        v6 = 0;
        if ((-[UIResponderAccessibility _accessibilityKeyCommandsShouldOverrideKeyCommands](v21, "_accessibilityKeyCommandsShouldOverrideKeyCommands") & 1) != 0)
        {
          v9 = (id)objc_msgSend(v10, "arrayByAddingObjectsFromArray:", v20[0]);
          v8 = 1;
          objc_storeStrong(v20, v9);
        }
        else
        {
          v7 = (id)objc_msgSend(v20[0], "arrayByAddingObjectsFromArray:", v10);
          v6 = 1;
          objc_storeStrong(v20, v7);
        }
        if ((v6 & 1) != 0)

        if ((v8 & 1) != 0)
      }
      objc_storeStrong(&v10, 0);
    }
    objc_storeStrong(&v16, 0);
    v17 = 0;
  }
  else
  {
    v22 = v20[0];
    v17 = 1;
  }
  objc_storeStrong(&v18, 0);
  if (!v17)
  {
LABEL_23:
    v22 = v20[0];
    v17 = 1;
  }
  objc_storeStrong(v20, 0);
  return v22;
}

void __40__UIResponderAccessibility__keyCommands__block_invoke(void *a1, void *a2)
{
  id location[2];

  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  objc_msgSend(location[0], "setWantsPriorityOverSystemBehavior:", 1);
  objc_storeStrong(location, 0);
}

@end
