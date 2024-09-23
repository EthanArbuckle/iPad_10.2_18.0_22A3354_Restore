@implementation UIKeyboardDockItemAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("UIKeyboardDockItem");
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
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("UIKeyboardDockItem"), CFSTR("button"), "@", 0);
  objc_storeStrong(v4, obj);
}

- (id)button
{
  id v3;
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  int v10;
  int v11;
  uint64_t (*v12)(uint64_t);
  void *v13;
  id v14;
  id v15;
  uint64_t v16;
  int v17;
  int v18;
  id (*v19)(uint64_t);
  void *v20;
  id v21;
  uint64_t v22;
  int v23;
  int v24;
  id (*v25)(uint64_t);
  void *v26;
  id v27;
  uint64_t v28;
  int v29;
  int v30;
  id (*v31)(uint64_t);
  void *v32;
  id v33[3];
  uint64_t v34;
  int v35;
  int v36;
  id (*v37)(uint64_t);
  void *v38;
  id v39;
  id location;
  objc_super v41;
  id v42[2];
  UIKeyboardDockItemAccessibility *v43;

  v43 = self;
  v42[1] = (id)a2;
  v41.receiver = self;
  v41.super_class = (Class)UIKeyboardDockItemAccessibility;
  v42[0] = -[UIKeyboardDockItemAccessibility button](&v41, sel_button);
  objc_initWeak(&location, v43);
  v8 = v42[0];
  v34 = MEMORY[0x24BDAC760];
  v35 = -1073741824;
  v36 = 0;
  v37 = __41__UIKeyboardDockItemAccessibility_button__block_invoke;
  v38 = &unk_24FF3DC00;
  objc_copyWeak(&v39, &location);
  objc_msgSend(v8, "_setAccessibilityValueBlock:", &v34);
  v7 = v42[0];
  v28 = MEMORY[0x24BDAC760];
  v29 = -1073741824;
  v30 = 0;
  v31 = __41__UIKeyboardDockItemAccessibility_button__block_invoke_2;
  v32 = &unk_24FF3DC00;
  objc_copyWeak(v33, &location);
  objc_msgSend(v7, "_setAccessibilityLabelBlock:", &v28);
  v6 = v42[0];
  v22 = MEMORY[0x24BDAC760];
  v23 = -1073741824;
  v24 = 0;
  v25 = __41__UIKeyboardDockItemAccessibility_button__block_invoke_3;
  v26 = &unk_24FF3DC00;
  objc_copyWeak(&v27, &location);
  objc_msgSend(v6, "_setAccessibilityHintBlock:", &v22);
  v5 = v42[0];
  v16 = MEMORY[0x24BDAC760];
  v17 = -1073741824;
  v18 = 0;
  v19 = __41__UIKeyboardDockItemAccessibility_button__block_invoke_4;
  v20 = &unk_24FF3DC00;
  objc_copyWeak(&v21, &location);
  objc_msgSend(v5, "_setAccessibilityIdentifierBlock:", &v16);
  objc_initWeak(&v15, v42[0]);
  v4 = v42[0];
  v9 = MEMORY[0x24BDAC760];
  v10 = -1073741824;
  v11 = 0;
  v12 = __41__UIKeyboardDockItemAccessibility_button__block_invoke_5;
  v13 = &unk_24FF3DA88;
  objc_copyWeak(&v14, &v15);
  objc_msgSend(v4, "_setIsAccessibilityElementBlock:", &v9);
  v3 = v42[0];
  objc_destroyWeak(&v14);
  objc_destroyWeak(&v15);
  objc_destroyWeak(&v21);
  objc_destroyWeak(&v27);
  objc_destroyWeak(v33);
  objc_destroyWeak(&v39);
  objc_destroyWeak(&location);
  objc_storeStrong(v42, 0);
  return v3;
}

id __41__UIKeyboardDockItemAccessibility_button__block_invoke(uint64_t a1)
{
  id WeakRetained;
  id v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v3 = (id)objc_msgSend(WeakRetained, "accessibilityValue");

  return v3;
}

id __41__UIKeyboardDockItemAccessibility_button__block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  id v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v3 = (id)objc_msgSend(WeakRetained, "accessibilityLabel");

  return v3;
}

id __41__UIKeyboardDockItemAccessibility_button__block_invoke_3(uint64_t a1)
{
  id WeakRetained;
  id v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v3 = (id)objc_msgSend(WeakRetained, "accessibilityHint");

  return v3;
}

id __41__UIKeyboardDockItemAccessibility_button__block_invoke_4(uint64_t a1)
{
  id WeakRetained;
  id v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v3 = (id)objc_msgSend(WeakRetained, "accessibilityIdentifier");

  return v3;
}

uint64_t __41__UIKeyboardDockItemAccessibility_button__block_invoke_5(uint64_t a1)
{
  id WeakRetained;
  char v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v3 = objc_msgSend(WeakRetained, "_accessibilityViewIsVisible");

  return v3 & 1;
}

@end
