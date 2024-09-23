@implementation UIKeyboardEmojiAndStickerCollectionViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("UIKeyboardEmojiAndStickerCollectionView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  const __CFString *v3;
  const char *v4;
  const __CFString *v5;
  const __CFString *v6;
  const char *v7;
  id v8;
  id *v9;
  id location[3];

  location[2] = a1;
  location[1] = (id)a2;
  v9 = location;
  v8 = 0;
  location[0] = 0;
  objc_storeStrong(location, a3);
  objc_msgSend(location[0], "validateClass:", CFSTR("UIKeyboardEmojiSplitCharacterPicker"));
  v5 = CFSTR("UIKeyboardEmojiAndStickerCollectionView");
  objc_msgSend(location[0], "validateClass:isKindOfClass:");
  v3 = CFSTR("UIKeyboardEmojiCategory");
  v7 = "q";
  objc_msgSend(location[0], "validateClass:hasClassMethod:withFullSignature:", "Q", 0);
  v4 = "@";
  objc_msgSend(location[0], "validateClass:hasClassMethod:withFullSignature:", v3, CFSTR("displayName:"), v7, 0);
  v6 = CFSTR("UIScrollView");
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", 0);
  objc_msgSend(location[0], "validateClass:isKindOfClass:", v5, v6);
  objc_msgSend(location[0], "validateClass:hasInstanceVariable:withType:", CFSTR("UIKeyboardEmojiCollectionInputView"), CFSTR("_flowLayout"), "UICollectionViewFlowLayout");
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("UICollectionViewFlowLayout"), CFSTR("scrollDirection"), v7, 0);
  objc_storeStrong(v9, v8);
}

- (id)_accessibilitySortedElementsWithin
{
  id v3;
  id v4;
  uint64_t v5;
  id v6;
  id v7;
  objc_super v8;
  uint64_t v9;
  SEL v10;
  UIKeyboardEmojiAndStickerCollectionViewAccessibility *v11;
  id v12;

  v11 = self;
  v10 = a2;
  v4 = (id)-[UIKeyboardEmojiAndStickerCollectionViewAccessibility safeValueForKeyPath:](self, "safeValueForKeyPath:", CFSTR("delegate._flowLayout"));
  v5 = objc_msgSend(v4, "safeIntegerForKey:", CFSTR("scrollDirection"));

  v9 = v5;
  if (v5)
  {
    v3 = (id)-[UIKeyboardEmojiAndStickerCollectionViewAccessibility subviews](v11, "subviews");
    v7 = (id)objc_msgSend(v3, "ax_filteredArrayUsingBlock:", &__block_literal_global_1);

    v6 = (id)objc_msgSend(v7, "sortedArrayUsingSelector:", sel__emojiCompare_);
    v12 = v6;
    objc_storeStrong(&v6, 0);
    objc_storeStrong(&v7, 0);
  }
  else
  {
    v8.receiver = v11;
    v8.super_class = (Class)UIKeyboardEmojiAndStickerCollectionViewAccessibility;
    v12 = -[UIKeyboardEmojiAndStickerCollectionViewAccessibility _accessibilitySortedElementsWithin](&v8, sel__accessibilitySortedElementsWithin);
  }
  return v12;
}

uint64_t __90__UIKeyboardEmojiAndStickerCollectionViewAccessibility__accessibilitySortedElementsWithin__block_invoke(void *a1, void *a2)
{
  int v3;
  id location[2];

  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  v3 = objc_msgSend(location[0], "accessibilityElementsHidden") ^ 1;
  objc_storeStrong(location, 0);
  return v3 & 1;
}

- (id)_accessibilityScrollStatus
{
  id v3;
  id v4;
  id v5;
  id v6;
  id v7;
  objc_super v8;
  id v9[2];
  UIKeyboardEmojiAndStickerCollectionViewAccessibility *v10;
  id v11;

  v10 = self;
  v9[1] = (id)a2;
  v8.receiver = self;
  v8.super_class = (Class)UIKeyboardEmojiAndStickerCollectionViewAccessibility;
  v9[0] = -[UIKeyboardEmojiAndStickerCollectionViewAccessibility _accessibilityScrollStatus](&v8, sel__accessibilityScrollStatus);
  v7 = -[UIKeyboardEmojiAndStickerCollectionViewAccessibility _accessibilityLocalizedVisibleSectionNames](v10);
  v6 = 0;
  if (objc_msgSend(v7, "count"))
  {
    v3 = -[UIKeyboardEmojiAndStickerCollectionViewAccessibility _accessibilityLocalizedVisibleSectionNames](v10);
    v5 = (id)MEMORY[0x2348C3584]();

    v4 = accessibilityLocalizedString(CFSTR("emoji.keyboard.pages_and_visible_categories"));
    v11 = (id)AXCFormattedString();

    objc_storeStrong(&v5, 0);
  }
  else
  {
    objc_storeStrong(&v6, v9[0]);
    v11 = v6;
  }
  objc_storeStrong(&v6, 0);
  objc_storeStrong(&v7, 0);
  objc_storeStrong(v9, 0);
  return v11;
}

- (id)_accessibilityLocalizedVisibleSectionNames
{
  CGFloat v1;
  CGFloat v2;
  CGFloat v3;
  CGFloat v4;
  CGFloat v5;
  CGFloat v6;
  CGFloat v7;
  CGFloat v8;
  id v10;
  uint64_t v11;
  id v12;
  id v13;
  id v14;
  int v15;
  id v16;
  uint64_t v17;
  uint64_t *v18;
  int v19;
  int v20;
  void (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  int v27;
  int v28;
  uint64_t (*v29)(uint64_t);
  void *v30;
  uint64_t *v31;
  int v32;
  uint64_t v33;
  uint64_t *v34;
  int v35;
  int v36;
  uint64_t v37;
  uint64_t v38;
  CGRect v39;
  id v40;
  int i;
  uint64_t v42;
  CGRect v43;
  char v44;
  id v45;
  id v46;
  id v47;
  char v48;
  id v49;
  id v50[2];
  id v51;

  v50[1] = a1;
  if (a1)
  {
    v50[0] = (id)objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v48 = 0;
    objc_opt_class();
    v47 = (id)__UIAccessibilityCastAsClass();
    v46 = v47;
    objc_storeStrong(&v47, 0);
    v49 = v46;
    v14 = (id)objc_msgSend(v46, "dataSource");
    v44 = 0;
    LOBYTE(v15) = 0;
    if (v14)
    {
      v45 = (id)objc_msgSend(v49, "dataSource");
      v44 = 1;
      NSClassFromString(CFSTR("UIKeyboardEmojiSplitCharacterPicker"));
      v15 = objc_opt_isKindOfClass() ^ 1;
    }
    if ((v44 & 1) != 0)

    if ((v15 & 1) != 0)
    {
      objc_msgSend(v49, "visibleBounds");
      v43.origin.x = v1;
      v43.origin.y = v2;
      v43.size.width = v3;
      v43.size.height = v4;
      v42 = objc_msgSend(v49, "numberOfSections");
      for (i = 0; i < v42; ++i)
      {
        v12 = v49;
        v11 = *MEMORY[0x24BDF7630];
        v13 = (id)objc_msgSend(MEMORY[0x24BDD15D8], "indexPathForItem:inSection:", 0, i);
        v40 = (id)objc_msgSend(v12, "layoutAttributesForSupplementaryElementOfKind:atIndexPath:", v11);

        objc_msgSend(v40, "frame");
        v39.origin.x = v5;
        v39.origin.y = v6;
        v39.size.width = v7;
        v39.size.height = v8;
        if (CGRectIntersectsRect(v43, v39))
        {
          v38 = 0;
          v33 = 0;
          v34 = &v33;
          v35 = 0x20000000;
          v36 = 32;
          v37 = 0;
          v26 = MEMORY[0x24BDAC760];
          v27 = -1073741824;
          v28 = 0;
          v29 = __98__UIKeyboardEmojiAndStickerCollectionViewAccessibility__accessibilityLocalizedVisibleSectionNames__block_invoke;
          v30 = &unk_24FF3DAF8;
          v31 = &v33;
          v32 = i;
          AXPerformSafeBlock();
          v25 = v34[3];
          _Block_object_dispose(&v33, 8);
          v38 = v25;
          v10 = accessibilityLocalizedString(CFSTR("emoji.category"));
          v17 = 0;
          v18 = &v17;
          v19 = 838860800;
          v20 = 48;
          v21 = __Block_byref_object_copy__0;
          v22 = __Block_byref_object_dispose__0;
          v23 = 0;
          AXPerformSafeBlock();
          v16 = (id)v18[5];
          _Block_object_dispose(&v17, 8);
          objc_storeStrong(&v23, 0);
          v24 = (id)AXCFormattedString();

          if (v24)
            objc_msgSend(v50[0], "addObject:", v24, v16);
          objc_storeStrong(&v24, 0);
        }
        objc_storeStrong(&v40, 0);
      }
    }
    v51 = v50[0];
    objc_storeStrong(&v49, 0);
    objc_storeStrong(v50, 0);
  }
  else
  {
    v51 = 0;
  }
  return v51;
}

- (BOOL)_accessibilityHitTestShouldFallbackToNearestChild
{
  return 1;
}

- (double)_accessibilityMaxFuzzyHitTestDistance
{
  return 30.0;
}

uint64_t __98__UIKeyboardEmojiAndStickerCollectionViewAccessibility__accessibilityLocalizedVisibleSectionNames__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = -[objc_class categoryTypeForCategoryIndex:](NSClassFromString(CFSTR("UIKeyboardEmojiCategory")), "categoryTypeForCategoryIndex:", *(int *)(a1 + 40));
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  return result;
}

void __98__UIKeyboardEmojiAndStickerCollectionViewAccessibility__accessibilityLocalizedVisibleSectionNames__block_invoke_240(uint64_t a1)
{
  id v1;
  uint64_t v2;
  void *v3;

  v1 = (id)-[objc_class displayName:](NSClassFromString(CFSTR("UIKeyboardEmojiCategory")), "displayName:", *(_QWORD *)(a1 + 40));
  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v3 = *(void **)(v2 + 40);
  *(_QWORD *)(v2 + 40) = v1;

}

- (id)_accessibilityFirstOpaqueElement
{
  id v3;
  objc_super v4;
  int v5;
  id v6;
  id v7;
  char v8;
  id v9[2];
  UIKeyboardEmojiAndStickerCollectionViewAccessibility *v10;
  id v11;

  v10 = self;
  v9[1] = (id)a2;
  v8 = 0;
  objc_opt_class();
  v3 = (id)-[UIKeyboardEmojiAndStickerCollectionViewAccessibility _accessibilityValueForKey:](v10, "_accessibilityValueForKey:", CFSTR("LastEmojiSelected"));
  v7 = (id)__UIAccessibilityCastAsClass();

  v6 = v7;
  objc_storeStrong(&v7, 0);
  v9[0] = v6;
  if ((objc_msgSend(v6, "_accessibilityViewIsVisible") & 1) != 0)
  {
    v11 = v9[0];
  }
  else
  {
    v4.receiver = v10;
    v4.super_class = (Class)UIKeyboardEmojiAndStickerCollectionViewAccessibility;
    v11 = -[UIKeyboardEmojiAndStickerCollectionViewAccessibility _accessibilityFirstOpaqueElement](&v4, sel__accessibilityFirstOpaqueElement);
  }
  v5 = 1;
  objc_storeStrong(v9, 0);
  return v11;
}

- (BOOL)_accessibilityOpaqueElementScrollsContentIntoView
{
  return 0;
}

@end
