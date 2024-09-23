@implementation UIKeyboardEmojiCollectionInputViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("UIKeyboardEmojiCollectionInputView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  const __CFString *v3;
  const char *v4;
  id v5;
  id *v6;
  id location[3];

  location[2] = a1;
  location[1] = (id)a2;
  v6 = location;
  v5 = 0;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v4 = "@";
  v3 = CFSTR("UIKeyboardEmojiCollectionInputView");
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", "@", "@", "@?", 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v3, CFSTR("collectionView: viewForSupplementaryElementOfKind: atIndexPath:"), v4, v4, v4, 0);
  objc_storeStrong(v6, v5);
}

- (id)collectionView:(id)a3 viewForSupplementaryElementOfKind:(id)a4 atIndexPath:(id)a5
{
  id v8;
  id v9;
  id v10;
  objc_super v11;
  id v12;
  id v13;
  id v14;
  id location[2];
  UIKeyboardEmojiCollectionInputViewAccessibility *v16;

  v16 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v14 = 0;
  objc_storeStrong(&v14, a4);
  v13 = 0;
  objc_storeStrong(&v13, a5);
  v11.receiver = v16;
  v11.super_class = (Class)UIKeyboardEmojiCollectionInputViewAccessibility;
  v12 = -[UIKeyboardEmojiCollectionInputViewAccessibility collectionView:viewForSupplementaryElementOfKind:atIndexPath:](&v11, sel_collectionView_viewForSupplementaryElementOfKind_atIndexPath_, location[0], v14, v13);
  v8 = v12;
  v9 = (id)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(v13, "section"));
  objc_msgSend(v8, "_accessibilitySetRetainedValue:forKey:");

  v10 = v12;
  objc_storeStrong(&v12, 0);
  objc_storeStrong(&v13, 0);
  objc_storeStrong(&v14, 0);
  objc_storeStrong(location, 0);
  return v10;
}

- (void)willDisplayModalActionView:(id)a3 withSubTreeKeyView:(id)a4 completion:(id)a5
{
  double v5;
  double v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  id v14;
  uint64_t v15;
  _QWORD __b[8];
  void *v17;
  id v18;
  objc_super v19;
  id v20;
  id v21;
  id location[2];
  UIKeyboardEmojiCollectionInputViewAccessibility *v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v23 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v21 = 0;
  objc_storeStrong(&v21, a4);
  v20 = 0;
  objc_storeStrong(&v20, a5);
  v19.receiver = v23;
  v19.super_class = (Class)UIKeyboardEmojiCollectionInputViewAccessibility;
  -[UIKeyboardEmojiCollectionInputViewAccessibility willDisplayModalActionView:withSubTreeKeyView:completion:](&v19, sel_willDisplayModalActionView_withSubTreeKeyView_completion_, location[0], v21, v20);
  v18 = (id)objc_msgSend(location[0], "subviews");
  memset(__b, 0, sizeof(__b));
  v14 = v18;
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", __b, v24, 16);
  if (v15)
  {
    v9 = *(_QWORD *)__b[2];
    v10 = 0;
    v11 = v15;
    while (1)
    {
      v8 = v10;
      if (*(_QWORD *)__b[2] != v9)
        objc_enumerationMutation(v14);
      v17 = *(void **)(__b[1] + 8 * v10);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v7 = v17;
        CGSizeMake_0();
        objc_msgSend(v7, "_accessibilitySetFrameExpansion:", v5, v6);
      }
      ++v10;
      if (v8 + 1 >= v11)
      {
        v10 = 0;
        v11 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", __b, v24, 16);
        if (!v11)
          break;
      }
    }
  }

  UIAccessibilityPostNotification(*MEMORY[0x24BDF72C8], 0);
  objc_storeStrong(&v18, 0);
  objc_storeStrong(&v20, 0);
  objc_storeStrong(&v21, 0);
  objc_storeStrong(location, 0);
}

@end
