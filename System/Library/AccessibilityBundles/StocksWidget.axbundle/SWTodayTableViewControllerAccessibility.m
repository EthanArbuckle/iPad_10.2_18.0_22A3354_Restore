@implementation SWTodayTableViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SWTodayTableViewController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:", CFSTR("SWTodayTableViewCell"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SWTodayTableViewController"), CFSTR("tableView: cellForRowAtIndexPath:"), "@", "@", "@", 0);
  objc_msgSend(v3, "validateClass:", CFSTR("Stock"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("Stock"), CFSTR("companyName"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("Stock"), CFSTR("marketcap"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("Stock"), CFSTR("formattedPrice"), "@", 0);
  objc_msgSend(v3, "validateClass:hasClassMethod:withFullSignature:", CFSTR("Stock"), CFSTR("BlankValueString"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("Stock"), CFSTR("changeIsNegative"), "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("Stock"), CFSTR("isIndex"), "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("Stock"), CFSTR("changeIsZero"), "B", 0);
  objc_msgSend(v3, "validateClass:hasClassMethod:withFullSignature:", CFSTR("Stock"), CFSTR("formattedStringForString: fractionDigits: percentStyle:"), "@", "@", "I", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("Stock"), CFSTR("formattedChangePercent:"), "@", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("Stock"), CFSTR("change"), "@", 0);

}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  id v21;
  void *v22;
  void *v23;
  int v24;
  void *v25;
  void *v26;
  void *v27;
  __CFString *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  id v37;
  id v38;
  uint64_t v39;
  uint64_t *v40;
  uint64_t v41;
  uint64_t (*v42)(uint64_t, uint64_t);
  void (*v43)(uint64_t);
  id v44;
  objc_super v45;

  v6 = a3;
  v7 = a4;
  v45.receiver = self;
  v45.super_class = (Class)SWTodayTableViewControllerAccessibility;
  -[SWTodayTableViewControllerAccessibility tableView:cellForRowAtIndexPath:](&v45, sel_tableView_cellForRowAtIndexPath_, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  MEMORY[0x234920D64](CFSTR("SWTodayTableViewCell"));
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v39 = 0;
    v40 = &v39;
    v41 = 0x3032000000;
    v42 = __Block_byref_object_copy_;
    v43 = __Block_byref_object_dispose_;
    v44 = 0;
    v38 = v7;
    AXPerformSafeBlock();
    v9 = (id)v40[5];

    _Block_object_dispose(&v39, 8);
    objc_msgSend(v9, "safeValueForKey:", CFSTR("companyName"));
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v9, "safeBoolForKey:", CFSTR("isIndex")))
    {
      objc_msgSend(v9, "safeValueForKey:", CFSTR("formattedPrice"));
      v35 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v10 = (void *)MEMORY[0x24BDD17C8];
      accessibilityLocalizedString(CFSTR("stock.price"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "safeValueForKey:", CFSTR("formattedPrice"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "stringWithFormat:", v11, v12);
      v35 = (void *)objc_claimAutoreleasedReturnValue();

    }
    objc_msgSend(v9, "safeValueForKey:", CFSTR("marketcap"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)MEMORY[0x234920D64](CFSTR("Stock")), "safeValueForKey:", CFSTR("BlankValueString"));
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v13, "isEqualToString:") & 1) != 0)
    {
      v33 = 0;
    }
    else
    {
      objc_msgSend(v13, "floatValue");
      AXFormatFloat();
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      v15 = (void *)MEMORY[0x24BDD16F0];
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(v14, "integerValue"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "localizedStringFromNumber:numberStyle:", v16, 5);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      v17 = (void *)MEMORY[0x24BDD17C8];
      accessibilityLocalizedString(CFSTR("marketcap.value"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "stringWithFormat:", v18, v13);
      v33 = (void *)objc_claimAutoreleasedReturnValue();

    }
    v39 = 0;
    v40 = &v39;
    v41 = 0x3032000000;
    v42 = __Block_byref_object_copy_;
    v43 = __Block_byref_object_dispose_;
    v44 = 0;
    v37 = v9;
    AXPerformSafeBlock();
    v19 = (id)v40[5];

    _Block_object_dispose(&v39, 8);
    v39 = 0;
    v40 = &v39;
    v41 = 0x3032000000;
    v42 = __Block_byref_object_copy_;
    v43 = __Block_byref_object_dispose_;
    v44 = 0;
    v20 = v37;
    AXPerformSafeBlock();
    v21 = (id)v40[5];

    _Block_object_dispose(&v39, 8);
    if (objc_msgSend(v20, "safeBoolForKey:", CFSTR("changeIsZero")))
    {
      accessibilityLocalizedString(CFSTR("no.change"));
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      accessibilityLocalizedString(CFSTR("no.change"));
      v23 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v24 = objc_msgSend(v20, "safeBoolForKey:", CFSTR("changeIsNegative"));
      v25 = (void *)MEMORY[0x24BDD17C8];
      if (v24)
      {
        accessibilityLocalizedString(CFSTR("negative.change"));
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "stringWithFormat:", v26, v19);
        v22 = (void *)objc_claimAutoreleasedReturnValue();

        v27 = (void *)MEMORY[0x24BDD17C8];
        v28 = CFSTR("down.value");
      }
      else
      {
        accessibilityLocalizedString(CFSTR("positive.change"));
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "stringWithFormat:", v29, v19);
        v22 = (void *)objc_claimAutoreleasedReturnValue();

        v27 = (void *)MEMORY[0x24BDD17C8];
        v28 = CFSTR("up.value");
      }
      accessibilityLocalizedString(v28);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "stringWithFormat:", v30, v21);
      v23 = (void *)objc_claimAutoreleasedReturnValue();

    }
    __UIAXStringForVariables();
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setAccessibilityLabel:", v31, v35, v23, v22, v33, CFSTR("__AXStringForVariablesSentinel"));

  }
  return v8;
}

void __75__SWTodayTableViewControllerAccessibility_tableView_cellForRowAtIndexPath___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "_stockAtIndexPath:", *(_QWORD *)(a1 + 40));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void __75__SWTodayTableViewControllerAccessibility_tableView_cellForRowAtIndexPath___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "formattedChangePercent:", 1);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void __75__SWTodayTableViewControllerAccessibility_tableView_cellForRowAtIndexPath___block_invoke_3(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;

  v2 = (void *)MEMORY[0x234920D64](CFSTR("Stock"));
  objc_msgSend(*(id *)(a1 + 32), "safeValueForKey:", CFSTR("change"));
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "formattedStringForString:fractionDigits:percentStyle:", v6, 2, 0);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

@end
