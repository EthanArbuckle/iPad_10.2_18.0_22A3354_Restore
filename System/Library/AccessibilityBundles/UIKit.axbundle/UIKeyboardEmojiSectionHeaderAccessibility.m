@implementation UIKeyboardEmojiSectionHeaderAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("UIKeyboardEmojiSectionHeader");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
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
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("UIKeyboardEmojiSectionHeader"), CFSTR("headerName"), "@", 0);
  objc_storeStrong(v4, obj);
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (BOOL)accessibilityElementsHidden
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  id v8;
  id obj;
  uint64_t v10;
  objc_super v11;
  int v12;
  _QWORD __b[8];
  id v14;
  id location;
  id v16;
  id v17;
  uint64_t v18;
  SEL v19;
  UIKeyboardEmojiSectionHeaderAccessibility *v20;
  char v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v20 = self;
  v19 = a2;
  if (UIAccessibilityIsVoiceOverRunning())
  {
    v18 = -[UIKeyboardEmojiSectionHeaderAccessibility _accessibilityIntegerValueForKey:](v20, "_accessibilityIntegerValueForKey:", CFSTR("emojiCategory"));
    v17 = (id)-[UIKeyboardEmojiSectionHeaderAccessibility _accessibilityAncestorIsKindOf:](v20, "_accessibilityAncestorIsKindOf:", NSClassFromString(CFSTR("UIKeyboardEmojiCollectionInputView")));
    v8 = (id)objc_msgSend(v17, "superview");
    v16 = (id)objc_msgSend(v8, "subviews");

    location = 0;
    memset(__b, 0, sizeof(__b));
    obj = v16;
    v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v22, 16);
    if (v10)
    {
      v5 = *(_QWORD *)__b[2];
      v6 = 0;
      v7 = v10;
      while (1)
      {
        v4 = v6;
        if (*(_QWORD *)__b[2] != v5)
          objc_enumerationMutation(obj);
        v14 = *(id *)(__b[1] + 8 * v6);
        NSClassFromString(CFSTR("UIKeyboardEmojiCategoryBar"));
        if ((objc_opt_isKindOfClass() & 1) != 0)
          break;
        ++v6;
        if (v4 + 1 >= v7)
        {
          v6 = 0;
          v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v22, 16);
          if (!v7)
            goto LABEL_10;
        }
      }
      objc_storeStrong(&location, v14);
      v12 = 2;
    }
    else
    {
LABEL_10:
      v12 = 0;
    }

    v2 = objc_msgSend(location, "safeIntegerForKey:", CFSTR("selectedIndex"));
    v21 = v2 != v18;
    v12 = 1;
    objc_storeStrong(&location, 0);
    objc_storeStrong(&v16, 0);
    objc_storeStrong(&v17, 0);
  }
  else
  {
    v11.receiver = v20;
    v11.super_class = (Class)UIKeyboardEmojiSectionHeaderAccessibility;
    v21 = -[UIKeyboardEmojiSectionHeaderAccessibility accessibilityElementsHidden](&v11, sel_accessibilityElementsHidden);
  }
  return v21 & 1;
}

- (id)accessibilityLabel
{
  return (id)-[UIKeyboardEmojiSectionHeaderAccessibility headerName](self, "headerName", a2, self);
}

- (unint64_t)accessibilityTraits
{
  objc_super v3;
  SEL v4;
  UIKeyboardEmojiSectionHeaderAccessibility *v5;

  v5 = self;
  v4 = a2;
  v3.receiver = self;
  v3.super_class = (Class)UIKeyboardEmojiSectionHeaderAccessibility;
  return -[UIKeyboardEmojiSectionHeaderAccessibility accessibilityTraits](&v3, sel_accessibilityTraits) | *MEMORY[0x24BDF73C0];
}

@end
