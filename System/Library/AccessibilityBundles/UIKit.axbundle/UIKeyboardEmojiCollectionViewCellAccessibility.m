@implementation UIKeyboardEmojiCollectionViewCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("UIKeyboardEmojiCollectionViewCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  const __CFString *v3;
  const __CFString *v4;
  const __CFString *v5;
  const char *v6;
  const char *v7;
  const char *v8;
  const __CFString *v9;
  const __CFString *v10;
  const __CFString *v11;
  id v12;
  id *v13;
  id location[3];

  location[2] = a1;
  location[1] = (id)a2;
  v13 = location;
  v12 = 0;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v4 = CFSTR("UIKeyboardEmojiCollectionViewCell");
  v5 = CFSTR("UICollectionViewCell");
  objc_msgSend(location[0], "validateClass:isKindOfClass:");
  v8 = "@";
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("UIKeyboardEmojiCollectionViewCell"), CFSTR("emoji"), 0);
  v3 = CFSTR("UIKeyboardEmoji");
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", 0);
  v7 = "Q";
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v3, CFSTR("variantMask"), 0);
  v6 = "v";
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v4, CFSTR("setEmoji:"), v8, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceVariable:withType:", CFSTR("UIKeyboardLayoutStar"), CFSTR("_keyplaneView"), "UIKBKeyplaneView");
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("UIKBKeyplaneView"), CFSTR("activeKeyViews"), v8, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("UIKBKeyView"), CFSTR("key"), v8, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v5, CFSTR("prepareForReuse"), v6, 0);
  v9 = CFSTR("UIKeyboardEmojiCollectionView");
  objc_msgSend(location[0], "validateClass:");
  v11 = CFSTR("UIKeyboardEmojiCollectionInputView");
  objc_msgSend(location[0], "validateClass:");
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("UIKeyboardEmojiCategoryBar"), CFSTR("selectedIndex"), v7, 0);
  v10 = CFSTR("UIScrollView");
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", 0);
  objc_msgSend(location[0], "validateClass:isKindOfClass:", v9, v10);
  objc_msgSend(location[0], "validateClass:hasInstanceVariable:withType:", v11, CFSTR("_flowLayout"), "UICollectionViewFlowLayout");
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("UICollectionViewFlowLayout"), CFSTR("scrollDirection"), "q", 0);
  objc_storeStrong(v13, v12);
}

- (unsigned)_accessibilityMediaAnalysisOptions
{
  return 0x80000;
}

- (id)_axEmoji
{
  id v2;
  id v3;
  id v4;
  char v5;
  id v6;
  id v7;

  v6 = a1;
  if (a1)
  {
    v5 = 0;
    v2 = (id)objc_msgSend(v6, "safeValueForKey:", CFSTR("emoji"));
    v4 = (id)__UIAccessibilitySafeClass();

    v3 = v4;
    objc_storeStrong(&v4, 0);
    v7 = v3;
  }
  else
  {
    v7 = 0;
  }
  return v7;
}

- (void)accessibilityElementDidBecomeFocused
{
  id v2[2];
  UIKeyboardEmojiCollectionViewCellAccessibility *v3;

  v3 = self;
  v2[1] = (id)a2;
  v2[0] = (id)-[UIKeyboardEmojiCollectionViewCellAccessibility _accessibilityAncestorIsKindOf:](self, "_accessibilityAncestorIsKindOf:", objc_opt_class());
  objc_msgSend(v2[0], "_accessibilitySetRetainedValue:forKey:", v3, CFSTR("LastEmojiSelected"));
  objc_storeStrong(v2, 0);
}

- (_NSRange)accessibilityRowRange
{
  NSUInteger v2;
  NSUInteger v3;
  uint64_t v4;
  uint64_t i;
  uint64_t v6;
  NSUInteger v7;
  uint64_t v8;
  id location;
  id v10[2];
  UIKeyboardEmojiCollectionViewCellAccessibility *v11;
  NSUInteger v12;
  NSUInteger v13;
  NSUInteger v14;
  uint64_t v15;
  uint64_t v16;
  NSUInteger v17;
  _NSRange result;

  v11 = self;
  v10[1] = (id)a2;
  v10[0] = (id)-[UIKeyboardEmojiCollectionViewCellAccessibility _accessibilityAncestorIsKindOf:](self, "_accessibilityAncestorIsKindOf:", objc_opt_class());
  location = (id)objc_msgSend(v10[0], "indexPathForCell:", v11);
  v8 = objc_msgSend(v10[0], "numberOfSections");
  v7 = 0;
  v6 = objc_msgSend(location, "row");
  for (i = 0; i < v8; ++i)
  {
    v4 = objc_msgSend(v10[0], "numberOfItemsInSection:", i);
    if (i < objc_msgSend(location, "section"))
      v6 += v4;
    v7 += v4;
  }
  v15 = v6;
  v14 = v7;
  v16 = v6;
  v17 = v7;
  v12 = v6;
  v13 = v7;
  objc_storeStrong(&location, 0);
  objc_storeStrong(v10, 0);
  v2 = v12;
  v3 = v13;
  result.length = v3;
  result.location = v2;
  return result;
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  id v2;
  id v3;
  id v5;
  id v6;
  id v7;
  id v8[3];

  v8[2] = self;
  v8[1] = (id)a2;
  v8[0] = -[UIKeyboardEmojiCollectionViewCellAccessibility _axEmoji](self);
  v7 = (id)objc_msgSend(v8[0], "safeValueForKey:", CFSTR("emojiString"));
  if ((objc_msgSend(v8[0], "safeUnsignedIntegerForKey:", CFSTR("variantMask")) & 1) != 0)
  {
    v6 = (id)objc_msgSend(MEMORY[0x24BDD17C8], "_stringWithUnichar:", 65039);
    v2 = (id)objc_msgSend(v7, "stringByAppendingString:");
    v3 = v7;
    v7 = v2;

  }
  v5 = v7;
  objc_storeStrong(&v7, 0);
  objc_storeStrong(v8, 0);
  return v5;
}

- (int64_t)accessibilityContainerType
{
  objc_super v3;
  id v4;
  SEL v5;
  UIKeyboardEmojiCollectionViewCellAccessibility *v6;

  v6 = self;
  v5 = a2;
  v4 = 0;
  v3.receiver = self;
  v3.super_class = (Class)UIKeyboardEmojiCollectionViewCellAccessibility;
  v4 = -[UIKeyboardEmojiCollectionViewCellAccessibility accessibilityContainerType](&v3, sel_accessibilityContainerType);
  if (v4 == (id)4 || v4 == (id)14)
    return 0;
  else
    return (int64_t)v4;
}

- (BOOL)_accessibilityAllowsAlternativeCharacterActivation
{
  return 1;
}

- (id)accessibilityHeaderElements
{
  uint64_t v3;
  id v4;
  id location;
  id v6;
  id v7;
  id v8[2];
  UIKeyboardEmojiCollectionViewCellAccessibility *v9;
  id v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x24BDAC8D0];
  v9 = self;
  v8[1] = (id)a2;
  v8[0] = (id)-[UIKeyboardEmojiCollectionViewCellAccessibility _accessibilityAncestorIsKindOf:](self, "_accessibilityAncestorIsKindOf:", NSClassFromString(CFSTR("UIKeyboardEmojiCollectionView")));
  v7 = (id)objc_msgSend(v8[0], "indexPathForCell:", v9);
  v3 = *MEMORY[0x24BDF7630];
  v4 = (id)objc_msgSend(MEMORY[0x24BDD15D8], "indexPathForRow:inSection:", 0, objc_msgSend(v7, "section"));
  v6 = (id)objc_msgSend(v8[0], "supplementaryViewForElementKind:atIndexPath:", v3);

  location = (id)objc_msgSend(v6, "_accessibilityValueForKey:", CFSTR("emojiCategory"));
  if (location)
  {
    v11[0] = v6;
    v10 = (id)objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v11, 1);
  }
  else
  {
    v10 = 0;
  }
  objc_storeStrong(&location, 0);
  objc_storeStrong(&v6, 0);
  objc_storeStrong(&v7, 0);
  objc_storeStrong(v8, 0);
  return v10;
}

- (unint64_t)accessibilityTraits
{
  id v3;
  uint64_t v4;
  unint64_t v5;
  id location[3];

  location[2] = self;
  location[1] = (id)a2;
  location[0] = (id)-[UIKeyboardEmojiCollectionViewCellAccessibility accessibilityContainer](self, "accessibilityContainer");
  v3 = (id)objc_msgSend(location[0], "safeValueForKeyPath:", CFSTR("delegate._flowLayout"));
  v4 = objc_msgSend(v3, "safeIntegerForKey:", CFSTR("scrollDirection"));

  v5 = *MEMORY[0x24BDF73F0];
  if (v4)
    v5 |= *MEMORY[0x24BDF73D0];
  objc_storeStrong(location, 0);
  return v5;
}

- (void)setEmoji:(id)a3
{
  objc_super v3;
  id location[2];
  UIKeyboardEmojiCollectionViewCellAccessibility *v5;

  v5 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3.receiver = v5;
  v3.super_class = (Class)UIKeyboardEmojiCollectionViewCellAccessibility;
  -[UIKeyboardEmojiCollectionViewCellAccessibility setEmoji:](&v3, sel_setEmoji_, location[0]);
  -[UIKeyboardEmojiCollectionViewCellAccessibility _accessibilitySetCachedVariantKeys:]((uint64_t)v5, 0);
  objc_storeStrong(location, 0);
}

- (void)_accessibilitySetCachedVariantKeys:(uint64_t)a1
{
  id location;
  uint64_t v3;

  v3 = a1;
  location = 0;
  objc_storeStrong(&location, a2);
  if (v3)
    __UIAccessibilitySetAssociatedObject();
  objc_storeStrong(&location, 0);
}

- (void)prepareForReuse
{
  objc_super v2;
  SEL v3;
  UIKeyboardEmojiCollectionViewCellAccessibility *v4;

  v4 = self;
  v3 = a2;
  v2.receiver = self;
  v2.super_class = (Class)UIKeyboardEmojiCollectionViewCellAccessibility;
  -[UIKeyboardEmojiCollectionViewCellAccessibility prepareForReuse](&v2, sel_prepareForReuse);
  -[UIKeyboardEmojiCollectionViewCellAccessibility _accessibilitySetCachedVariantKeys:]((uint64_t)v4, 0);
}

- (BOOL)_accessibilityHasVariantKeys
{
  BOOL v3;
  id EMFEmojiTokenClass;
  id v5;
  id location;
  id v7;
  BOOL v8;
  SEL v9;
  UIKeyboardEmojiCollectionViewCellAccessibility *v10;

  v10 = self;
  v9 = a2;
  v7 = -[UIKeyboardEmojiCollectionViewCellAccessibility _axEmoji](self);
  EMFEmojiTokenClass = getEMFEmojiTokenClass();
  v5 = (id)objc_msgSend(v7, "safeStringForKey:", CFSTR("emojiString"));
  location = (id)objc_msgSend(EMFEmojiTokenClass, "emojiTokenWithString:localeData:");

  v8 = (objc_msgSend(location, "supportsSkinToneVariants") & 1) != 0;
  v3 = v8;
  objc_storeStrong(&location, 0);
  objc_storeStrong(&v7, 0);
  return v3;
}

- (id)_accessibilityCachedVariantKeys
{
  if (a1)
    return objc_getAssociatedObject(a1, &__UIKeyboardEmojiCollectionViewCellAccessibility___accessibilityCachedVariantKeys);
  else
    return 0;
}

- (id)_accessibilityVariantKeys
{
  CGFloat v2;
  CGFloat v3;
  id v4;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  id v12;
  uint64_t v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  id v19;
  id obj;
  uint64_t v21;
  id v22;
  id v23;
  _QWORD v24[8];
  id v25;
  id v26;
  id v27;
  id v28;
  char v29;
  CGRect rect;
  _QWORD __b[8];
  id v32;
  id v33;
  CGPoint point;
  id v35;
  id v36;
  id v37[2];
  UIKeyboardEmojiCollectionViewCellAccessibility *v38;
  _BYTE v39[128];
  _BYTE v40[128];
  uint64_t v41;
  CGRect v42;

  v41 = *MEMORY[0x24BDAC8D0];
  v38 = self;
  v37[1] = (id)a2;
  v37[0] = -[UIKeyboardEmojiCollectionViewCellAccessibility _accessibilityCachedVariantKeys](self);
  if (!objc_msgSend(v37[0], "count"))
  {
    v19 = (id)UIAccessibilityGetKeyboardLayoutStar();
    v36 = (id)objc_msgSend(v19, "safeValueForKey:", CFSTR("_keyplaneView"));

    v35 = (id)objc_msgSend(v36, "safeValueForKey:", CFSTR("activeKeyViews"));
    -[UIKeyboardEmojiCollectionViewCellAccessibility accessibilityActivationPoint](v38, "accessibilityActivationPoint");
    point.x = v2;
    point.y = v3;
    v33 = 0;
    memset(__b, 0, sizeof(__b));
    obj = v35;
    v21 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v40, 16);
    if (v21)
    {
      v16 = *(_QWORD *)__b[2];
      v17 = 0;
      v18 = v21;
      while (1)
      {
        v15 = v17;
        if (*(_QWORD *)__b[2] != v16)
          objc_enumerationMutation(obj);
        v32 = *(id *)(__b[1] + 8 * v17);
        objc_msgSend(v32, "accessibilityFrame");
        rect = v42;
        if (CGRectContainsPoint(v42, point))
        {
          v29 = 0;
          objc_opt_class();
          v14 = (id)objc_msgSend(v32, "safeValueForKey:", CFSTR("key"));
          v28 = (id)__UIAccessibilityCastAsClass();

          if ((v29 & 1) != 0)
            abort();
          v27 = v28;
          objc_storeStrong(&v28, 0);
          v4 = v33;
          v33 = v27;

        }
        ++v17;
        if (v15 + 1 >= v18)
        {
          v17 = 0;
          v18 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v40, 16);
          if (!v18)
            break;
        }
      }
    }

    if (v33)
    {
      v26 = +[UIAccessibilityElementKBKey variantKeysForKey:](UIAccessibilityElementKBKey, v33);
      memset(v24, 0, sizeof(v24));
      v12 = v26;
      v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", v24, v39, 16);
      if (v13)
      {
        v9 = *(_QWORD *)v24[2];
        v10 = 0;
        v11 = v13;
        while (1)
        {
          v8 = v10;
          if (*(_QWORD *)v24[2] != v9)
            objc_enumerationMutation(v12);
          v25 = *(id *)(v24[1] + 8 * v10);
          v7 = (id)-[UIAccessibilityElementKBKey key]((uint64_t)v25);
          v23 = (id)objc_msgSend(v7, "displayString");

          v22 = (id)objc_msgSend(MEMORY[0x24BE00658], "stringByReplacingEmojiCharactersWithEmojiDescriptions:", v23);
          objc_msgSend(v25, "setAccessibilityLabel:", v22);
          objc_storeStrong(&v22, 0);
          objc_storeStrong(&v23, 0);
          ++v10;
          if (v8 + 1 >= v11)
          {
            v10 = 0;
            v11 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", v24, v39, 16);
            if (!v11)
              break;
          }
        }
      }

      -[UIKeyboardEmojiCollectionViewCellAccessibility _accessibilitySetCachedVariantKeys:]((uint64_t)v38, v26);
      objc_storeStrong(v37, v26);
      objc_storeStrong(&v26, 0);
    }
    objc_storeStrong(&v33, 0);
    objc_storeStrong(&v35, 0);
    objc_storeStrong(&v36, 0);
  }
  v6 = v37[0];
  objc_storeStrong(v37, 0);
  return v6;
}

- (BOOL)_accessibilityKeyboardKeyHasSignificantAlternateActions
{
  return 1;
}

@end
