@implementation UIKeyboardEmojiCategoryBarAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("UIKeyboardEmojiCategoryBar");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  const char *v3;
  const char *v4;
  const __CFString *v5;
  const char *v6;
  id v7;
  id *v8;
  id location[3];

  location[2] = a1;
  location[1] = (id)a2;
  v8 = location;
  v7 = 0;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v5 = CFSTR("UIKeyboardEmojiCategory");
  v4 = "q";
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", 0);
  v3 = "@";
  objc_msgSend(location[0], "validateClass:hasClassMethod:withFullSignature:", v5, CFSTR("displayName:"), v4, 0);
  objc_msgSend(location[0], "validateClass:hasClassMethod:withFullSignature:", v5, CFSTR("enabledCategoryIndexes"), v3, 0);
  v6 = "Q";
  objc_msgSend(location[0], "validateClass:hasClassMethod:withFullSignature:", v5, CFSTR("categoryTypeForCategoryIndex:"), v4, "Q", 0);
  objc_msgSend(location[0], "validateClass:hasClassMethod:withFullSignature:", v5, CFSTR("categoryForType:"), v3, v4, 0);
  objc_msgSend(location[0], "validateClass:hasClassMethod:withFullSignature:", v5, CFSTR("categoryIndexForCategoryType:"), v6, v4, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceVariable:withType:", CFSTR("UIKeyboardEmojiCategoryBar"), CFSTR("_selectedIndex"), v6);
  objc_storeStrong(v8, v7);
}

- (id)accessibilityElements
{
  id v3;
  id v4;
  id v5;
  uint64_t v6;
  int v7;
  int v8;
  void (*v9)(uint64_t, void *, uint64_t, void *);
  void *v10;
  UIKeyboardEmojiCategoryBarAccessibility *v11;
  id v12;
  id v13[2];
  Class v14;
  id v15;
  id v16;
  char v17;
  id v18;
  id v19[2];
  UIKeyboardEmojiCategoryBarAccessibility *v20;

  v20 = self;
  v19[1] = (id)a2;
  v19[0] = (id)-[UIKeyboardEmojiCategoryBarAccessibility _accessibilityValueForKey:](self, "_accessibilityValueForKey:", *MEMORY[0x24BEBB308]);
  if (!v19[0])
  {
    v19[0] = objc_alloc_init(MEMORY[0x24BDBCEB8]);

    -[UIKeyboardEmojiCategoryBarAccessibility _accessibilitySetRetainedValue:forKey:](v20, "_accessibilitySetRetainedValue:forKey:", v19[0], *MEMORY[0x24BEBB308]);
    v17 = 0;
    objc_opt_class();
    v5 = (id)-[objc_class safeValueForKey:](NSClassFromString(CFSTR("UIKeyboardEmojiCategory")), "safeValueForKey:", CFSTR("enabledCategoryIndexes"));
    v16 = (id)__UIAccessibilityCastAsClass();

    v15 = v16;
    objc_storeStrong(&v16, 0);
    v18 = v15;
    v14 = NSClassFromString(CFSTR("UIKeyboardEmojiCategory"));
    v4 = v18;
    v6 = MEMORY[0x24BDAC760];
    v7 = -1073741824;
    v8 = 0;
    v9 = __64__UIKeyboardEmojiCategoryBarAccessibility_accessibilityElements__block_invoke;
    v10 = &unk_24FF3EE28;
    v13[1] = v14;
    v11 = v20;
    v12 = v18;
    v13[0] = v19[0];
    objc_msgSend(v4, "enumerateObjectsUsingBlock:", &v6);
    objc_storeStrong(v13, 0);
    objc_storeStrong(&v12, 0);
    objc_storeStrong((id *)&v11, 0);
    objc_storeStrong(&v18, 0);
  }
  v3 = v19[0];
  objc_storeStrong(v19, 0);
  return v3;
}

void __64__UIKeyboardEmojiCategoryBarAccessibility_accessibilityElements__block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  int v4;
  void *v5;
  Class v6;
  uint64_t v7;
  void *v8;
  UIAccessibilityElementKBEmojiCategory *v9;
  UIAccessibilityElementKBEmojiCategory *v13;
  id v14;
  id v15;
  uint64_t v16;
  int v17;
  int v18;
  void (*v19)(uint64_t);
  void *v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t *v24;
  int v25;
  int v26;
  void (*v27)(uint64_t, uint64_t);
  void (*v28)(uint64_t);
  id v29;
  id v30;
  char v31;
  id v32;
  int v33;
  id v34;
  uint64_t v35;
  int v36;
  int v37;
  void (*v38)(uint64_t);
  void *v39;
  uint64_t *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t *v44;
  int v45;
  int v46;
  void (*v47)(uint64_t, uint64_t);
  void (*v48)(uint64_t);
  id v49;
  id v50;
  uint64_t v51;
  id v52;
  id v53;
  char v54;
  id v55[3];
  void *v56;
  id location[6];

  location[1] = (id)a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  v56 = (void *)a3;
  v55[2] = a4;
  v55[1] = (id)a1;
  v54 = 0;
  objc_opt_class();
  v53 = (id)__UIAccessibilityCastAsClass();
  v52 = v53;
  objc_storeStrong(&v53, 0);
  v55[0] = v52;
  v4 = objc_msgSend(v52, "intValue");
  v51 = v4;
  v43 = 0;
  v44 = &v43;
  v45 = 838860800;
  v46 = 48;
  v47 = __Block_byref_object_copy__13;
  v48 = __Block_byref_object_dispose__13;
  v49 = 0;
  v35 = MEMORY[0x24BDAC760];
  v36 = -1073741824;
  v37 = 0;
  v38 = __64__UIKeyboardEmojiCategoryBarAccessibility_accessibilityElements__block_invoke_2;
  v39 = &unk_24FF3EE00;
  v40 = &v43;
  v41 = *(_QWORD *)(a1 + 56);
  v42 = v4;
  AXPerformSafeBlock();
  v34 = (id)v44[5];
  _Block_object_dispose(&v43, 8);
  objc_storeStrong(&v49, 0);
  v50 = v34;
  if (v34)
  {
    v31 = 0;
    v23 = 0;
    v24 = &v23;
    v25 = 838860800;
    v26 = 48;
    v27 = __Block_byref_object_copy__13;
    v28 = __Block_byref_object_dispose__13;
    v29 = 0;
    v16 = MEMORY[0x24BDAC760];
    v17 = -1073741824;
    v18 = 0;
    v19 = __64__UIKeyboardEmojiCategoryBarAccessibility_accessibilityElements__block_invoke_3;
    v20 = &unk_24FF3DB20;
    v21 = &v23;
    v22 = v51;
    AXPerformSafeBlock();
    v15 = (id)v24[5];
    _Block_object_dispose(&v23, 8);
    objc_storeStrong(&v29, 0);
    v30 = (id)__UIAccessibilitySafeClass();

    if ((v31 & 1) != 0)
      abort();
    v14 = v30;
    objc_storeStrong(&v30, 0);
    v32 = v14;
    v13 = -[UIAccessibilityElementKBEmojiCategory initWithAccessibilityContainer:]([UIAccessibilityElementKBEmojiCategory alloc], "initWithAccessibilityContainer:", *(_QWORD *)(a1 + 32));
    -[UIAccessibilityElementKBEmojiCategory setAccessibilityTraits:](v13, "setAccessibilityTraits:", -[UIKeyboardEmojiCategoryBarAccessibility _accessibilityTraitsForElementAtIndex:](*(void **)(a1 + 32), (uint64_t)v56));
    v9 = v13;
    v8 = v56;
    v5 = (void *)objc_msgSend(*(id *)(a1 + 40), "count");
    location[3] = v8;
    location[2] = v5;
    location[4] = v8;
    location[5] = v5;
    -[UIAccessibilityElementKBEmojiCategory _accessibilitySetRowRange:](v9, "_accessibilitySetRowRange:", v8, v5);
    -[UIAccessibilityElementKBEmojiCategory setCategory:]((uint64_t)v13, v32);
    v6 = NSClassFromString(CFSTR("UIKeyboardEmojiCategory"));
    v7 = -[objc_class categoryIndexForCategoryType:](v6, "categoryIndexForCategoryType:", v51);
    -[UIAccessibilityElementKBEmojiCategory setCategoryIndex:]((uint64_t)v13, v7);
    objc_msgSend(*(id *)(a1 + 48), "addObject:", v13);
    objc_storeStrong((id *)&v13, 0);
    objc_storeStrong(&v32, 0);
    v33 = 0;
  }
  else
  {
    v33 = 1;
  }
  objc_storeStrong(&v50, 0);
  objc_storeStrong(v55, 0);
  if (!v33)
    v33 = 0;
  objc_storeStrong(location, 0);
}

void __64__UIKeyboardEmojiCategoryBarAccessibility_accessibilityElements__block_invoke_2(uint64_t a1)
{
  id v1;
  uint64_t v2;
  void *v3;

  v1 = (id)objc_msgSend(*(id *)(a1 + 40), "displayName:", *(_QWORD *)(a1 + 48));
  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v3 = *(void **)(v2 + 40);
  *(_QWORD *)(v2 + 40) = v1;

}

void __64__UIKeyboardEmojiCategoryBarAccessibility_accessibilityElements__block_invoke_3(uint64_t a1)
{
  id v1;
  uint64_t v2;
  void *v3;

  v1 = (id)-[objc_class categoryForType:](NSClassFromString(CFSTR("UIKeyboardEmojiCategory")), "categoryForType:", *(_QWORD *)(a1 + 40));
  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v3 = *(void **)(v2 + 40);
  *(_QWORD *)(v2 + 40) = v1;

}

- (uint64_t)_accessibilityTraitsForElementAtIndex:(void *)a1
{
  uint64_t v3;

  if (!a1)
    return 0;
  v3 = *MEMORY[0x24BDF73F0];
  if (a2 == objc_msgSend(a1, "safeUnsignedIntegerForKey:", CFSTR("_selectedIndex")))
    return v3 | *MEMORY[0x24BDF7400];
  return v3;
}

- (void)setSelectedIndex:(unint64_t)a3
{
  id v3;
  uint64_t v4;
  int v5;
  int v6;
  void (*v7)(void **, void *, uint64_t);
  void *v8;
  UIKeyboardEmojiCategoryBarAccessibility *v9;
  id v10;
  objc_super v11;
  unint64_t v12;
  SEL v13;
  UIKeyboardEmojiCategoryBarAccessibility *v14;

  v14 = self;
  v13 = a2;
  v12 = a3;
  v11.receiver = self;
  v11.super_class = (Class)UIKeyboardEmojiCategoryBarAccessibility;
  -[UIKeyboardEmojiCategoryBarAccessibility setSelectedIndex:](&v11, sel_setSelectedIndex_, a3);
  v10 = (id)-[UIKeyboardEmojiCategoryBarAccessibility _accessibilityValueForKey:](v14, "_accessibilityValueForKey:", *MEMORY[0x24BEBB308]);
  if (v10)
  {
    v3 = v10;
    v4 = MEMORY[0x24BDAC760];
    v5 = -1073741824;
    v6 = 0;
    v7 = __60__UIKeyboardEmojiCategoryBarAccessibility_setSelectedIndex___block_invoke;
    v8 = &unk_24FF3E490;
    v9 = v14;
    objc_msgSend(v3, "enumerateObjectsUsingBlock:", &v4);
    objc_storeStrong((id *)&v9, 0);
  }
  UIAccessibilityPostNotification(*MEMORY[0x24BDF72C8], (id)*MEMORY[0x24BDFEEB0]);
  objc_storeStrong(&v10, 0);
}

void __60__UIKeyboardEmojiCategoryBarAccessibility_setSelectedIndex___block_invoke(void **a1, void *a2, uint64_t a3)
{
  id location[2];

  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  objc_msgSend(location[0], "setAccessibilityTraits:", -[UIKeyboardEmojiCategoryBarAccessibility _accessibilityTraitsForElementAtIndex:](a1[4], a3));
  objc_storeStrong(location, 0);
}

@end
