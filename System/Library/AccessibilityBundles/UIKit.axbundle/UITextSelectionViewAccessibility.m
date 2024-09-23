@implementation UITextSelectionViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("UITextSelectionView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  const __CFString *v3;
  const __CFString *v4;
  const char *v5;
  id v6;
  id *v7;
  id location[3];

  location[2] = a1;
  location[1] = (id)a2;
  v7 = location;
  v6 = 0;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = CFSTR("UITextSelectionView");
  objc_msgSend(location[0], "validateClass:hasInstanceVariable:withType:");
  v5 = "@";
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("UITextSelectionView"), CFSTR("showCommandsWithReplacements:"), "v", "@", 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v3, CFSTR("menuInteraction"), v5, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("UITextContextMenuInteraction"), CFSTR("editMenuInteraction"), v5, 0);
  v4 = CFSTR("UIEditMenuInteraction");
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v4, CFSTR("activeEditMenuPresentation"), v5, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("_UIEditMenuContentPresentation"), CFSTR("currentListView"), v5, 0);
  objc_storeStrong(v7, v6);
}

- (id)automationElements
{
  void *v3;
  id v4;
  id v5;

  v3 = (void *)MEMORY[0x24BDBCE30];
  v4 = (id)-[UITextSelectionViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("m_rangeView"));
  v5 = (id)objc_msgSend(v3, "axArrayByIgnoringNilElementsWithCount:", 1, v4);

  return v5;
}

- (void)showCommandsWithReplacements:(id)a3
{
  char v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  id obj;
  uint64_t v9;
  BOOL v10;
  id argument;
  id v12;
  _QWORD __b[8];
  uint64_t v14;
  char v15;
  id v16;
  char v17;
  id v18;
  int v19;
  id v20;
  objc_super v21;
  id location[2];
  UITextSelectionViewAccessibility *v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v23 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v21.receiver = v23;
  v21.super_class = (Class)UITextSelectionViewAccessibility;
  -[UITextSelectionViewAccessibility showCommandsWithReplacements:](&v21, sel_showCommandsWithReplacements_, location[0]);
  v20 = (id)-[UITextSelectionViewAccessibility safeValueForKeyPath:](v23, "safeValueForKeyPath:", CFSTR("menuInteraction.editMenuInteraction"));
  if ((objc_msgSend(v20, "safeBoolForKey:", CFSTR("isDisplayingMenu")) & 1) != 0)
  {
    UIAccessibilityPostNotification(*MEMORY[0x24BEBAEB0], 0);
    v3 = objc_msgSend((id)*MEMORY[0x24BDF74F8], "_accessibilitySoftwareKeyboardActive");
    v17 = 0;
    v15 = 0;
    v10 = 0;
    if ((v3 & 1) == 0)
    {
      v18 = (id)objc_msgSend(MEMORY[0x24BDF6B38], "activeInstance");
      v17 = 1;
      v16 = (id)objc_msgSend(v18, "inputDelegate");
      v15 = 1;
      v10 = v16 != 0;
    }
    if ((v15 & 1) != 0)

    if ((v17 & 1) != 0)
    if (v10)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        memset(__b, 0, sizeof(__b));
        obj = location[0];
        v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v24, 16);
        if (v9)
        {
          v5 = *(_QWORD *)__b[2];
          v6 = 0;
          v7 = v9;
          while (1)
          {
            v4 = v6;
            if (*(_QWORD *)__b[2] != v5)
              objc_enumerationMutation(obj);
            v14 = *(_QWORD *)(__b[1] + 8 * v6);
            v12 = (id)objc_msgSend(location[0], "objectForKey:", v14);
            NSClassFromString(CFSTR("UITextReplacement"));
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              argument = (id)objc_msgSend(v20, "safeValueForKeyPath:", CFSTR("activeEditMenuPresentation.currentListView"));
              if (argument)
                UIAccessibilityPostNotification(*MEMORY[0x24BDF7328], argument);
              v19 = 2;
              objc_storeStrong(&argument, 0);
            }
            else
            {
              v19 = 0;
            }
            objc_storeStrong(&v12, 0);
            if (v19)
              break;
            ++v6;
            if (v4 + 1 >= v7)
            {
              v6 = 0;
              v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v24, 16);
              if (!v7)
                goto LABEL_23;
            }
          }
        }
        else
        {
LABEL_23:
          v19 = 0;
        }

      }
    }
    v19 = 0;
  }
  else
  {
    v19 = 1;
  }
  objc_storeStrong(&v20, 0);
  objc_storeStrong(location, 0);
}

@end
