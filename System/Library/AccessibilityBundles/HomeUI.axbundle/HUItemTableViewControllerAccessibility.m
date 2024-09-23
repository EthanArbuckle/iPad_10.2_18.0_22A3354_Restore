@implementation HUItemTableViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("HUItemTableViewController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("HUItemTableViewController"), CFSTR("tableView:cellForRowAtIndexPath:"), "@", "@", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("HUItemTableViewController"), CFSTR("_itemManager"), "HFItemManager");
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("HUStatusAndNotificationsItemManager"), CFSTR("HFItemManager"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("HUStatusAndNotificationsItemManager"), CFSTR("conditionModule"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("HUStatusAndNotificationsItemManager"), CFSTR("_conditionModule"), "HUTriggerConditionEditorItemModule");
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("HUTriggerConditionEditorItemModule"), CFSTR("isShowConditionOptionsItem:"), "B", "@", 0);
  objc_msgSend(v3, "validateClass:", CFSTR("HUEditableTextCell"));
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("HUTitleValueCell"), CFSTR("HUIconCell"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("HUIconCell"), CFSTR("isDisabled"), "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("HUTitleValueCell"), CFSTR("titleText"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("HUTitleValueCell"), CFSTR("valueText"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("HUEditableTextCell"), CFSTR("_textField"), "UITextField");
  objc_msgSend(v3, "validateClass:", CFSTR("HUDynamicAlignmentTitleValueCell"));
  objc_msgSend(v3, "validateClass:", CFSTR("HUServiceDetailsRoomItem"));

}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  uint64_t v13;
  int v14;
  void *v15;
  uint64_t v16;
  _QWORD v18[4];
  id v19[5];
  id v20;
  id v21;
  id *v22;
  id location;
  id *p_location;
  uint64_t v25;
  char v26;
  _QWORD v27[4];
  id v28;
  objc_super v29;

  v6 = a3;
  v7 = a4;
  v29.receiver = self;
  v29.super_class = (Class)HUItemTableViewControllerAccessibility;
  -[HUItemTableViewControllerAccessibility tableView:cellForRowAtIndexPath:](&v29, sel_tableView_cellForRowAtIndexPath_, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  MEMORY[0x234911848](CFSTR("HUEditableTextCell"));
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    LOBYTE(location) = 0;
    objc_opt_class();
    -[HUItemTableViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("itemManager"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    __UIAccessibilityCastAsClass();
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "displayedItemAtIndexPath:", v7);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_opt_respondsToSelector();
    v13 = MEMORY[0x24BDAC760];
    if ((v12 & 1) != 0)
    {
      location = 0;
      p_location = &location;
      v25 = 0x2020000000;
      v26 = 0;
      v19[1] = (id)MEMORY[0x24BDAC760];
      v19[2] = (id)3221225472;
      v19[3] = __74__HUItemTableViewControllerAccessibility_tableView_cellForRowAtIndexPath___block_invoke_3;
      v19[4] = &unk_2502345D0;
      v22 = &location;
      v20 = v10;
      v21 = v11;
      AXPerformSafeBlock();
      v14 = *((unsigned __int8 *)p_location + 24);

      _Block_object_dispose(&location, 8);
      if (!v14)
        goto LABEL_11;
    }
    else
    {
      MEMORY[0x234911848](CFSTR("HUDynamicAlignmentTitleValueCell"));
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        MEMORY[0x234911848](CFSTR("HUServiceDetailsRoomItem"));
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          MEMORY[0x234911848](CFSTR("HUTitleValueCell"));
          if ((objc_opt_isKindOfClass() & 1) == 0)
            goto LABEL_11;
          objc_msgSend(v8, "safeValueForKey:", CFSTR("valueText"));
          v15 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v15)
            goto LABEL_11;
        }
      }
    }
    v16 = objc_msgSend(v8, "accessibilityTraits");
    objc_msgSend(v8, "setAccessibilityTraits:", *MEMORY[0x24BDF73B0] | v16);
    objc_initWeak(&location, v8);
    v18[0] = v13;
    v18[1] = 3221225472;
    v18[2] = __74__HUItemTableViewControllerAccessibility_tableView_cellForRowAtIndexPath___block_invoke_4;
    v18[3] = &unk_250234568;
    objc_copyWeak(v19, &location);
    objc_msgSend(v8, "_setAccessibilityHintBlock:", v18);
    objc_destroyWeak(v19);
    objc_destroyWeak(&location);
LABEL_11:

    goto LABEL_12;
  }
  objc_msgSend(v8, "setIsAccessibilityElement:", 0);
  objc_initWeak(&location, v8);
  v27[0] = MEMORY[0x24BDAC760];
  v27[1] = 3221225472;
  v27[2] = __74__HUItemTableViewControllerAccessibility_tableView_cellForRowAtIndexPath___block_invoke;
  v27[3] = &unk_250234930;
  objc_copyWeak(&v28, &location);
  objc_msgSend(v8, "_setAccessibilityElementsBlock:", v27);
  objc_destroyWeak(&v28);
  objc_destroyWeak(&location);
LABEL_12:

  return v8;
}

id __74__HUItemTableViewControllerAccessibility_tableView_cellForRowAtIndexPath___block_invoke(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v8;
  uint64_t v9;
  id (*v10)(uint64_t);
  void *v11;
  id v12;
  id v13;
  id location;

  LOBYTE(location) = 0;
  objc_opt_class();
  v2 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "safeValueForKey:", CFSTR("_textField"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_initWeak(&location, v5);
  v8 = MEMORY[0x24BDAC760];
  v9 = 3221225472;
  v10 = __74__HUItemTableViewControllerAccessibility_tableView_cellForRowAtIndexPath___block_invoke_2;
  v11 = &unk_250234908;
  objc_copyWeak(&v12, &location);
  objc_copyWeak(&v13, v2);
  objc_msgSend(v5, "_setAccessibilityLabelBlock:", &v8);
  objc_msgSend(MEMORY[0x24BDBCE30], "axArrayByIgnoringNilElementsWithCount:", 1, v5, v8, v9, v10, v11);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_destroyWeak(&v13);
  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);

  return v6;
}

id __74__HUItemTableViewControllerAccessibility_tableView_cellForRowAtIndexPath___block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  char v3;
  void *v4;
  id v5;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v3 = objc_msgSend(WeakRetained, "isEditing");

  if ((v3 & 1) != 0)
  {
    v4 = 0;
  }
  else
  {
    v5 = objc_loadWeakRetained((id *)(a1 + 40));
    objc_msgSend(v5, "safeValueForKey:", CFSTR("titleText"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v4;
}

void __74__HUItemTableViewControllerAccessibility_tableView_cellForRowAtIndexPath___block_invoke_3(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "safeValueForKey:", CFSTR("conditionModule"));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = objc_msgSend(v2, "isShowConditionOptionsItem:", *(_QWORD *)(a1 + 40));

}

id __74__HUItemTableViewControllerAccessibility_tableView_cellForRowAtIndexPath___block_invoke_4(uint64_t a1)
{
  id WeakRetained;
  void *v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if ((objc_msgSend(WeakRetained, "safeBoolForKey:", CFSTR("isDisabled")) & 1) != 0)
  {
    v2 = 0;
  }
  else
  {
    accessibilityHomeUILocalizedString(CFSTR("options.cell.toggle"));
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v2;
}

@end
