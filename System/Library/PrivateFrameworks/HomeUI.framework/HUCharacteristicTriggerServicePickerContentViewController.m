@implementation HUCharacteristicTriggerServicePickerContentViewController

- (HUCharacteristicTriggerServicePickerContentViewController)initWithTriggerBuilder:(id)a3 eventBuilderItem:(id)a4 mode:(unint64_t)a5 source:(unint64_t)a6 effectiveNavigationItem:(id)a7 delegate:(id)a8
{
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  HUServiceGridItemManager *v21;
  HUCharacteristicTriggerServicePickerContentViewController *v22;
  HUCharacteristicTriggerServicePickerContentViewController *v23;
  id obj;
  id v28;
  objc_super v29;
  _QWORD aBlock[4];
  id v31;
  id v32;

  v13 = a3;
  obj = a4;
  v14 = a4;
  v15 = a7;
  v16 = a8;
  objc_msgSend((id)objc_opt_class(), "transformationSetBlock");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  +[HUSelectableServiceGridViewController defaultItemProviderCreatorWithOptions:](HUCharacteristicTriggerServicePickerContentViewController, "defaultItemProviderCreatorWithOptions:", 9);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __146__HUCharacteristicTriggerServicePickerContentViewController_initWithTriggerBuilder_eventBuilderItem_mode_source_effectiveNavigationItem_delegate___block_invoke;
  aBlock[3] = &unk_1E6F51BB8;
  v28 = v18;
  v31 = v28;
  v19 = v17;
  v32 = v19;
  v20 = _Block_copy(aBlock);
  v21 = -[HUServiceGridItemManager initWithDelegate:shouldGroupByRoom:itemProvidersCreator:]([HUServiceGridItemManager alloc], "initWithDelegate:shouldGroupByRoom:itemProvidersCreator:", self, 1, v20);
  v29.receiver = self;
  v29.super_class = (Class)HUCharacteristicTriggerServicePickerContentViewController;
  v22 = -[HUSelectableServiceGridViewController initWithServiceGridItemManager:](&v29, sel_initWithServiceGridItemManager_, v21);
  v23 = v22;
  if (v22)
  {
    -[HUServiceGridViewController setDelegate:](v22, "setDelegate:", v16);
    objc_storeStrong((id *)&v23->_eventBuilderItem, obj);
    objc_storeStrong((id *)&v23->_triggerBuilder, a3);
    v23->_mode = a5;
    v23->_source = a6;
    objc_storeStrong((id *)&v23->_effectiveNavigationItem, a7);
    -[HUSelectableServiceGridViewController setAllowsMultipleSelection:](v23, "setAllowsMultipleSelection:", 0);
  }

  return v23;
}

id __146__HUCharacteristicTriggerServicePickerContentViewController_initWithTriggerBuilder_eventBuilderItem_mode_source_effectiveNavigationItem_delegate___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  _QWORD v5[4];
  id v6;

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __146__HUCharacteristicTriggerServicePickerContentViewController_initWithTriggerBuilder_eventBuilderItem_mode_source_effectiveNavigationItem_delegate___block_invoke_2;
  v5[3] = &unk_1E6F51B90;
  v6 = *(id *)(a1 + 40);
  objc_msgSend(v2, "na_map:", v5);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

id __146__HUCharacteristicTriggerServicePickerContentViewController_initWithTriggerBuilder_eventBuilderItem_mode_source_effectiveNavigationItem_delegate___block_invoke_2(uint64_t a1, void *a2)
{
  objc_class *v3;
  id v4;
  void *v5;

  v3 = (objc_class *)MEMORY[0x1E0D31568];
  v4 = a2;
  v5 = (void *)objc_msgSend([v3 alloc], "initWithSourceProvider:multipleTransformationBlock:", v4, *(_QWORD *)(a1 + 32));

  return v5;
}

- (HUCharacteristicTriggerServicePickerContentViewController)initWithServiceGridItemManager:(id)a3
{
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_initWithTriggerBuilder_eventBuilderItem_mode_source_effectiveNavigationItem_delegate_);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HUCharacteristicTriggerServicePickerContentViewController.m"), 89, CFSTR("%s is unavailable; use %@ instead"),
    "-[HUCharacteristicTriggerServicePickerContentViewController initWithServiceGridItemManager:]",
    v6);

  return 0;
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)HUCharacteristicTriggerServicePickerContentViewController;
  -[HUServiceGridViewController viewDidLoad](&v16, sel_viewDidLoad);
  -[HUCharacteristicTriggerServicePickerContentViewController collectionView](self, "collectionView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_setShouldDeriveVisibleBoundsFromContainingScrollView:", 1);

  -[HUCharacteristicTriggerServicePickerContentViewController collectionView](self, "collectionView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setScrollEnabled:", 0);

  -[HUCharacteristicTriggerServicePickerContentViewController collectionView](self, "collectionView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setClipsToBounds:", 1);

  objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUCharacteristicTriggerServicePickerContentViewController collectionView](self, "collectionView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setBackgroundColor:", v6);

  objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUCharacteristicTriggerServicePickerContentViewController view](self, "view");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setBackgroundColor:", v8);

  _HULocalizedStringWithDefaultValue(CFSTR("HUBackButtonTitle"), CFSTR("HUBackButtonTitle"), 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUCharacteristicTriggerServicePickerContentViewController effectiveNavigationItem](self, "effectiveNavigationItem");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setBackButtonTitle:", v10);

  if (!-[HUCharacteristicTriggerServicePickerContentViewController mode](self, "mode"))
  {
    v12 = objc_alloc(MEMORY[0x1E0CEA380]);
    _HULocalizedStringWithDefaultValue(CFSTR("HUCharacteristicTriggerServicePickerNextButton"), CFSTR("HUCharacteristicTriggerServicePickerNextButton"), 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)objc_msgSend(v12, "initWithTitle:style:target:action:", v13, 2, self, sel__next_);
    -[HUCharacteristicTriggerServicePickerContentViewController effectiveNavigationItem](self, "effectiveNavigationItem");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setRightBarButtonItem:", v14);

  }
  -[HUCharacteristicTriggerServicePickerContentViewController _validateNextButton](self, "_validateNextButton");
}

- (void)_cancel:(id)a3
{
  id v4;

  -[HUServiceGridViewController delegate](self, "delegate", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "triggerEditor:didFinishWithTriggerBuilder:", self, 0);

}

- (void)_next:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  _QWORD v9[5];

  -[HUCharacteristicTriggerServicePickerContentViewController characteristicReadFuture](self, "characteristicReadFuture", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    v6 = v4;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D519C0], "futureWithNoResult");
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  v7 = v6;

  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __67__HUCharacteristicTriggerServicePickerContentViewController__next___block_invoke;
  v9[3] = &unk_1E6F4C610;
  v9[4] = self;
  v8 = (id)objc_msgSend(v7, "addCompletionBlock:", v9);

}

void __67__HUCharacteristicTriggerServicePickerContentViewController__next___block_invoke(uint64_t a1)
{
  HUCharacteristicTriggerEventViewController *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;
  HUCharacteristicTriggerEventViewController *v9;

  v2 = [HUCharacteristicTriggerEventViewController alloc];
  objc_msgSend(*(id *)(a1 + 32), "eventBuilderItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "triggerBuilder");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(*(id *)(a1 + 32), "mode");
  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[HUCharacteristicTriggerEventViewController initWithCharacteristicEventBuilderItem:triggerBuilder:mode:delegate:](v2, "initWithCharacteristicEventBuilderItem:triggerBuilder:mode:delegate:", v3, v4, v5, v6);

  objc_msgSend(*(id *)(a1 + 32), "navigationController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (id)objc_msgSend(v7, "hu_pushPreloadableViewController:animated:", v9, 1);

}

- (void)itemManagerDidUpdate:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  id v12;
  void *v13;
  int v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  _QWORD v19[6];
  _QWORD v20[5];
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  objc_super v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v25.receiver = self;
  v25.super_class = (Class)HUCharacteristicTriggerServicePickerContentViewController;
  -[HUSelectableServiceGridViewController itemManagerDidUpdate:](&v25, sel_itemManagerDidUpdate_, a3);
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  -[HUItemCollectionViewController itemManager](self, "itemManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "allDisplayedItems");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v22;
    v9 = MEMORY[0x1E0C809B0];
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v22 != v8)
          objc_enumerationMutation(v5);
        v11 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
        if ((objc_msgSend(v11, "conformsToProtocol:", &unk_1EF2AC378) & 1) == 0)
          NSLog(CFSTR("Our items must vend services, e.g., they should be instances of HFServiceItem HFServiceGroupItem, or something similar"));
        if (objc_msgSend(v11, "conformsToProtocol:", &unk_1EF2AC378))
        {
          v12 = v11;
          objc_msgSend(v12, "services");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v20[0] = v9;
          v20[1] = 3221225472;
          v20[2] = __82__HUCharacteristicTriggerServicePickerContentViewController_itemManagerDidUpdate___block_invoke;
          v20[3] = &unk_1E6F4EE58;
          v20[4] = self;
          v14 = objc_msgSend(v13, "na_any:", v20);

          if (v14)
          {
            v19[0] = v9;
            v19[1] = 3221225472;
            v19[2] = __82__HUCharacteristicTriggerServicePickerContentViewController_itemManagerDidUpdate___block_invoke_3;
            v19[3] = &unk_1E6F51BE0;
            v15 = v12;
            v19[4] = v15;
            v19[5] = self;
            if (__82__HUCharacteristicTriggerServicePickerContentViewController_itemManagerDidUpdate___block_invoke_3((uint64_t)v19))
              objc_msgSend(v18, "addObject:", v15);

          }
        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
    }
    while (v7);
  }

  v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D31580]), "initWithFromSet:", v18);
  v17 = (void *)objc_msgSend(v16, "copy");
  -[HUSelectableServiceGridViewController setSelectedItems:](self, "setSelectedItems:", v17);

  -[HUCharacteristicTriggerServicePickerContentViewController _validateNextButton](self, "_validateNextButton");
}

uint64_t __82__HUCharacteristicTriggerServicePickerContentViewController_itemManagerDidUpdate___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  _QWORD v6[5];

  objc_msgSend(a2, "characteristics");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __82__HUCharacteristicTriggerServicePickerContentViewController_itemManagerDidUpdate___block_invoke_2;
  v6[3] = &unk_1E6F4EE30;
  v6[4] = *(_QWORD *)(a1 + 32);
  v4 = objc_msgSend(v3, "na_any:", v6);

  return v4;
}

uint64_t __82__HUCharacteristicTriggerServicePickerContentViewController_itemManagerDidUpdate___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "eventBuilderItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "characteristics");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "containsObject:", v3);

  return v6;
}

uint64_t __82__HUCharacteristicTriggerServicePickerContentViewController_itemManagerDidUpdate___block_invoke_3(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;

  objc_opt_class();
  objc_msgSend(*(id *)(a1 + 32), "latestResults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("HUCharacteristicTriggerServiceRepresentativeCharacteristicKey"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;
  v5 = v4;

  if (v5)
  {
    objc_msgSend(*(id *)(a1 + 40), "eventBuilderItem");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "characteristics");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "containsObject:", v5);

  }
  else
  {
    v8 = 1;
  }

  return v8;
}

- (id)layoutOptionsForSection:(int64_t)a3
{
  void *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)HUCharacteristicTriggerServicePickerContentViewController;
  -[HUServiceGridViewController layoutOptionsForSection:](&v7, sel_layoutOptionsForSection_);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "copy");

  if (!a3)
  {
    objc_msgSend(v5, "sectionTitleMargin");
    objc_msgSend(v5, "setSectionTitleMargin:", 9.0);
  }
  return v5;
}

- (void)configureCell:(id)a3 forItem:(id)a4
{
  id v6;
  objc_super v7;

  v6 = a3;
  v7.receiver = self;
  v7.super_class = (Class)HUCharacteristicTriggerServicePickerContentViewController;
  -[HUSelectableServiceGridViewController configureCell:forItem:](&v7, sel_configureCell_forItem_, v6, a4);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v6, "setShouldColorDescription:", 0);

}

- (BOOL)serviceGridItemManager:(id)a3 shouldHideItem:(id)a4
{
  id v6;
  id v7;
  int v8;
  id v9;
  unint64_t v10;
  BOOL v11;
  id v12;
  void *v13;
  void *v14;
  char v15;
  void *v16;
  void *v17;
  id v18;
  int v19;
  void *v20;
  id v22;
  _QWORD v23[4];
  id v24;
  objc_super v25;

  v6 = a3;
  v7 = a4;
  if (objc_msgSend((id)objc_opt_class(), "instancesRespondToSelector:", sel_serviceGridItemManager_shouldHideItem_))
  {
    v25.receiver = self;
    v25.super_class = (Class)HUCharacteristicTriggerServicePickerContentViewController;
    if (-[HUSelectableServiceGridViewController serviceGridItemManager:shouldHideItem:](&v25, sel_serviceGridItemManager_shouldHideItem_, v6, v7))
    {
      goto LABEL_3;
    }
  }
  if (!objc_msgSend(v7, "conformsToProtocol:", &unk_1EF2AC378))
    goto LABEL_13;
  v9 = v7;
  v10 = -[HUCharacteristicTriggerServicePickerContentViewController source](self, "source");
  if (v10)
  {
    if (v10 != 1)
    {

      goto LABEL_13;
    }
    v22 = 0;
    v11 = +[HUCharacteristicEventOptionProvider hasOptionsForServiceVendingItem:outCharacteristicType:](HUCharacteristicEventOptionProvider, "hasOptionsForServiceVendingItem:outCharacteristicType:", v9, &v22);
    v12 = v22;
    v13 = v12;
    if (!v11)
    {

      LOBYTE(v8) = 1;
LABEL_15:

      goto LABEL_17;
    }
    objc_msgSend(MEMORY[0x1E0CBA458], "hf_sensingCharacteristicTypes");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "containsObject:", v13);

    if ((v15 & 1) == 0)
    {
LABEL_13:
      -[HUCharacteristicTriggerServicePickerContentViewController filter](self, "filter");
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v20)
      {
        LOBYTE(v8) = 0;
        goto LABEL_17;
      }
      -[HUCharacteristicTriggerServicePickerContentViewController filter](self, "filter");
      v9 = (id)objc_claimAutoreleasedReturnValue();
      v8 = (*((uint64_t (**)(id, id))v9 + 2))(v9, v7) ^ 1;
      goto LABEL_15;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CBA458], "hf_sensingCharacteristicTypes");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "services");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v23[0] = MEMORY[0x1E0C809B0];
    v23[1] = 3221225472;
    v23[2] = __99__HUCharacteristicTriggerServicePickerContentViewController_serviceGridItemManager_shouldHideItem___block_invoke;
    v23[3] = &unk_1E6F4EE58;
    v24 = v16;
    v18 = v16;
    v19 = objc_msgSend(v17, "na_any:", v23);

    if (v19)
      goto LABEL_13;
  }
LABEL_3:
  LOBYTE(v8) = 1;
LABEL_17:

  return v8;
}

uint64_t __99__HUCharacteristicTriggerServicePickerContentViewController_serviceGridItemManager_shouldHideItem___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  _QWORD v6[4];
  id v7;

  objc_msgSend(a2, "characteristics");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __99__HUCharacteristicTriggerServicePickerContentViewController_serviceGridItemManager_shouldHideItem___block_invoke_2;
  v6[3] = &unk_1E6F4EE30;
  v7 = *(id *)(a1 + 32);
  v4 = objc_msgSend(v3, "na_any:", v6);

  return v4;
}

uint64_t __99__HUCharacteristicTriggerServicePickerContentViewController_serviceGridItemManager_shouldHideItem___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  uint64_t v4;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "characteristicType");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "containsObject:", v3);

  return v4;
}

- (BOOL)collectionView:(id)a3 shouldHighlightItemAtIndexPath:(id)a4
{
  void *v4;
  void *v5;
  char v6;

  -[HUCharacteristicTriggerServicePickerContentViewController triggerBuilder](self, "triggerBuilder", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "home");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hf_currentUserIsAdministrator");

  return v6;
}

- (void)didChangeSelection
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  unint64_t v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)HUCharacteristicTriggerServicePickerContentViewController;
  -[HUSelectableServiceGridViewController didChangeSelection](&v10, sel_didChangeSelection);
  -[HUSelectableServiceGridViewController selectedItems](self, "selectedItems");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "toSet");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "anyObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = v5;
  if (objc_msgSend(v6, "conformsToProtocol:", &unk_1EF2AC378))
    v7 = v6;
  else
    v7 = 0;
  v8 = v7;

  if (!v6 || v8)
  {
    if (v8)
    {
      v9 = -[HUCharacteristicTriggerServicePickerContentViewController source](self, "source");
      if (v9 == 1)
      {
        -[HUCharacteristicTriggerServicePickerContentViewController _addCharacteristicEventsForOtherDeviceItem:](self, "_addCharacteristicEventsForOtherDeviceItem:", v8);
      }
      else if (!v9)
      {
        -[HUCharacteristicTriggerServicePickerContentViewController _addCharacteristicEventsForAlarmItem:](self, "_addCharacteristicEventsForAlarmItem:", v8);
      }
    }
  }
  else
  {
    NSLog(CFSTR("Our items must vend services, e.g., they should be instances of HFServiceItem HFServiceGroupItem, or something similar"));
  }
  -[HUCharacteristicTriggerServicePickerContentViewController _validateNextButton](self, "_validateNextButton");

}

- (BOOL)canSelectItem:(id)a3 indexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  char isKindOfClass;
  _BOOL4 v15;
  void *v16;
  void *v17;
  void *v18;
  objc_super v20;

  v6 = a3;
  v20.receiver = self;
  v20.super_class = (Class)HUCharacteristicTriggerServicePickerContentViewController;
  if (-[HUSelectableServiceGridViewController canSelectItem:indexPath:](&v20, sel_canSelectItem_indexPath_, v6, a4))
  {
    v7 = v6;
    if (objc_msgSend(v7, "conformsToProtocol:", &unk_1EF2AC378))
      v8 = v7;
    else
      v8 = 0;
    v9 = v8;

    objc_opt_class();
    v10 = v7;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v11 = v10;
    else
      v11 = 0;
    v12 = v11;

    objc_msgSend(v12, "sourceItem");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) != 0)
    {
      LOBYTE(v15) = 0;
    }
    else if (v9)
    {
      objc_msgSend(v9, "services");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[HUCharacteristicTriggerServicePickerContentViewController triggerBuilder](self, "triggerBuilder");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "home");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = !+[HUCharacteristicEventOptionProvider homeHubUpdateRequiredForServices:forHome:](HUCharacteristicEventOptionProvider, "homeHubUpdateRequiredForServices:forHome:", v16, v18);

    }
    else
    {
      LOBYTE(v15) = 1;
    }

  }
  else
  {
    LOBYTE(v15) = 0;
  }

  return v15;
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  char isKindOfClass;
  void *v18;
  void *v19;
  __CFString *v20;
  void *v21;
  void *v22;
  void *v23;
  _BOOL4 v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  objc_super v30;

  v6 = a3;
  v7 = a4;
  -[HUItemCollectionViewController itemManager](self, "itemManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "displayedItemAtIndexPath:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = v9;
  if (objc_msgSend(v10, "conformsToProtocol:", &unk_1EF2AC378))
    v11 = v10;
  else
    v11 = 0;
  v12 = v11;

  objc_opt_class();
  v13 = v10;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v14 = v13;
  else
    v14 = 0;
  v15 = v14;

  objc_msgSend(v15, "sourceItem");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    v18 = (void *)MEMORY[0x1E0CEA2E8];
    _HULocalizedStringWithDefaultValue(CFSTR("HUDontSetupProgrammableSwitchInAutomationTitle"), CFSTR("HUDontSetupProgrammableSwitchInAutomationTitle"), 1);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = CFSTR("HUDontSetupProgrammableSwitchInAutomationMessage");
LABEL_12:
    _HULocalizedStringWithDefaultValue(v20, v20, 1);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "alertControllerWithTitle:message:preferredStyle:", v19, v25, 1);
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    v27 = (void *)MEMORY[0x1E0CEA2E0];
    _HULocalizedStringWithDefaultValue(CFSTR("HUOkTitle"), CFSTR("HUOkTitle"), 1);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "actionWithTitle:style:handler:", v28, 0, 0);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "addAction:", v29);

    -[HUControllableItemCollectionViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v26, 1, 0);
    goto LABEL_13;
  }
  if (v12)
  {
    objc_msgSend(v12, "services");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUCharacteristicTriggerServicePickerContentViewController triggerBuilder](self, "triggerBuilder");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "home");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = +[HUCharacteristicEventOptionProvider homeHubUpdateRequiredForServices:forHome:](HUCharacteristicEventOptionProvider, "homeHubUpdateRequiredForServices:forHome:", v21, v23);

    if (v24)
    {
      v18 = (void *)MEMORY[0x1E0CEA2E8];
      _HULocalizedStringWithDefaultValue(CFSTR("HUAlertSoftwareUpdateRequired"), CFSTR("HUAlertSoftwareUpdateRequired"), 1);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = CFSTR("HUCharacteristicTriggerRequireHomeHubUpdateMessage");
      goto LABEL_12;
    }
  }
LABEL_13:
  v30.receiver = self;
  v30.super_class = (Class)HUCharacteristicTriggerServicePickerContentViewController;
  -[HUSelectableServiceGridViewController collectionView:didSelectItemAtIndexPath:](&v30, sel_collectionView_didSelectItemAtIndexPath_, v6, v7);

}

+ (id)getThresholdRangeValueForCharacteristics:(id)a3 inHome:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  _QWORD v21[4];
  id v22;
  _QWORD v23[4];
  id v24;
  id v25;
  id v26;

  v5 = a3;
  v6 = a4;
  objc_msgSend(v6, "hf_characteristicValueManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "readValuesForCharacteristics:", v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D519E8], "globalAsyncScheduler");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "reschedule:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "flatMap:", &__block_literal_global_66);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D519E8], "globalAsyncScheduler");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = MEMORY[0x1E0C809B0];
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __109__HUCharacteristicTriggerServicePickerContentViewController_getThresholdRangeValueForCharacteristics_inHome___block_invoke_3;
  v23[3] = &unk_1E6F4E020;
  v24 = v6;
  v14 = v5;
  v25 = v14;
  v26 = v11;
  v15 = v11;
  v16 = v6;
  v17 = (id)objc_msgSend(v12, "afterDelay:performBlock:", v23, 0.5);

  v21[0] = v13;
  v21[1] = 3221225472;
  v21[2] = __109__HUCharacteristicTriggerServicePickerContentViewController_getThresholdRangeValueForCharacteristics_inHome___block_invoke_4;
  v21[3] = &unk_1E6F4CD58;
  v22 = v14;
  v18 = v14;
  objc_msgSend(v15, "flatMap:", v21);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  return v19;
}

id __109__HUCharacteristicTriggerServicePickerContentViewController_getThresholdRangeValueForCharacteristics_inHome___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v2 = a2;
  objc_opt_class();
  objc_msgSend(v2, "allReadResponses");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "anyObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "value");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v6 = v5;
  else
    v6 = 0;
  v7 = v6;

  if (v7)
  {
    objc_msgSend(MEMORY[0x1E0D519C0], "futureWithResult:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v2, "allReadResponses");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "na_firstObjectPassingTest:", &__block_literal_global_122);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "error");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0D519C0], "futureWithError:", v11);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v8;
}

BOOL __109__HUCharacteristicTriggerServicePickerContentViewController_getThresholdRangeValueForCharacteristics_inHome___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  _BOOL8 v3;

  objc_msgSend(a2, "error");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

void __109__HUCharacteristicTriggerServicePickerContentViewController_getThresholdRangeValueForCharacteristics_inHome___block_invoke_3(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "hf_characteristicValueManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "anyObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "cachedValueForCharacteristic:", v3);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  v4 = *(void **)(a1 + 48);
  if (v6)
  {
    objc_msgSend(v4, "finishWithResult:", v6);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hf_errorWithCode:", 39);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "finishWithError:", v5);

  }
}

id __109__HUCharacteristicTriggerServicePickerContentViewController_getThresholdRangeValueForCharacteristics_inHome___block_invoke_4(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  void *v36;
  void *v37;
  void *v38;
  uint64_t v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  _BYTE v45[128];
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "anyObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "characteristicType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqualToString:", *MEMORY[0x1E0CB8860]);

  if (v6)
  {
    objc_msgSend(*(id *)(a1 + 32), "anyObject");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "hf_visibleTriggerValues");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "objectAtIndexedSubscript:", objc_msgSend(MEMORY[0x1E0CBA458], "hf_indexOfSortedValues:closestToValue:", v8, v3));
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = (void *)v9;
    if (v9)
      v11 = (void *)v9;
    else
      v11 = v3;
    v12 = v11;

    v3 = v12;
  }
  v43 = 0u;
  v44 = 0u;
  v41 = 0u;
  v42 = 0u;
  v40 = a1;
  v13 = *(id *)(a1 + 32);
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v41, v45, 16);
  if (!v14)
  {
    v16 = 0;
    v17 = 0;
    goto LABEL_22;
  }
  v15 = v14;
  v16 = 0;
  v17 = 0;
  v18 = *(_QWORD *)v42;
  do
  {
    for (i = 0; i != v15; ++i)
    {
      if (*(_QWORD *)v42 != v18)
        objc_enumerationMutation(v13);
      v20 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * i);
      objc_msgSend(v20, "hf_maximumTriggerValue");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "hf_minimumTriggerValue");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v17 || objc_msgSend(v21, "compare:", v17) == -1)
      {
        v23 = v21;

        v17 = v23;
        if (v16)
        {
LABEL_16:
          if (objc_msgSend(v22, "compare:", v16) != 1)
            goto LABEL_18;
        }
      }
      else if (v16)
      {
        goto LABEL_16;
      }
      v24 = v22;

      v16 = v24;
LABEL_18:

    }
    v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v41, v45, 16);
  }
  while (v15);
LABEL_22:

  if (objc_msgSend(v3, "compare:", v17) == 1)
  {
    v25 = (void *)MEMORY[0x1E0CBA718];
    objc_msgSend(*(id *)(v40 + 32), "anyObject");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "hf_valueBeforeTriggerValue:", v17);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "numberRangeWithMaxValue:", v27);
    v28 = objc_claimAutoreleasedReturnValue();
    goto LABEL_28;
  }
  if (objc_msgSend(v3, "compare:", v16) == -1)
  {
    v36 = (void *)MEMORY[0x1E0CBA718];
    objc_msgSend(*(id *)(v40 + 32), "anyObject");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "hf_valueAfterTriggerValue:", v16);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "numberRangeWithMinValue:", v27);
    v28 = objc_claimAutoreleasedReturnValue();
LABEL_28:
    v37 = (void *)v28;

  }
  else
  {
    objc_msgSend(v3, "doubleValue");
    v30 = v29;
    objc_msgSend(v16, "doubleValue");
    v32 = vabdd_f64(v30, v31);
    objc_msgSend(v3, "doubleValue");
    v34 = v33;
    objc_msgSend(v17, "doubleValue");
    if (v32 >= vabdd_f64(v34, v35))
      objc_msgSend(MEMORY[0x1E0CBA718], "numberRangeWithMaxValue:", v3);
    else
      objc_msgSend(MEMORY[0x1E0CBA718], "numberRangeWithMinValue:", v3);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(MEMORY[0x1E0D519C0], "futureWithResult:", v37);
  v38 = (void *)objc_claimAutoreleasedReturnValue();

  return v38;
}

- (void)_addCharacteristicEventsForAlarmItem:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  _QWORD v27[5];
  id v28;
  _QWORD v29[4];
  id v30;
  _QWORD v31[4];
  id v32;

  v4 = a3;
  objc_msgSend(v4, "services");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "na_map:", &__block_literal_global_128);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "na_setByFlattening");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "latestResults");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("HUCharacteristicTriggerServiceRepresentativeCharacteristicKey"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8 && objc_msgSend(v6, "containsObject:", v8))
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v8);
    v9 = objc_claimAutoreleasedReturnValue();

    v6 = (void *)v9;
  }
  objc_msgSend(MEMORY[0x1E0CBA458], "hf_sensingCharacteristicTypes");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = MEMORY[0x1E0C809B0];
  v31[0] = MEMORY[0x1E0C809B0];
  v31[1] = 3221225472;
  v31[2] = __98__HUCharacteristicTriggerServicePickerContentViewController__addCharacteristicEventsForAlarmItem___block_invoke_2;
  v31[3] = &unk_1E6F4EE30;
  v24 = v10;
  v32 = v24;
  objc_msgSend(v6, "na_firstObjectPassingTest:", v31);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "characteristicType");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v29[0] = v11;
  v29[1] = 3221225472;
  v29[2] = __98__HUCharacteristicTriggerServicePickerContentViewController__addCharacteristicEventsForAlarmItem___block_invoke_3;
  v29[3] = &unk_1E6F4EE30;
  v14 = v13;
  v30 = v14;
  objc_msgSend(v6, "na_filter:", v29);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CBA458], "hf_abnormalValueForSensorCharacteristicType:", v14);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v15, "count"))
    NSLog(CFSTR("No alarm characteristics found for alarm item: %@"), v4);
  v26 = v4;
  if (!v16)
    NSLog(CFSTR("No abnormal value found for alarm characteristic type: %@"), v14);
  -[HUCharacteristicTriggerServicePickerContentViewController _addTriggerValue:forCharacteristics:](self, "_addTriggerValue:forCharacteristics:", v16, v15);
  objc_msgSend(MEMORY[0x1E0CBA458], "hf_continuousValueRangeCharacteristicTypes");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "containsObject:", v14);

  if (v18)
  {
    v19 = (void *)objc_opt_class();
    -[HUItemCollectionViewController itemManager](self, "itemManager");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "home");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "getThresholdRangeValueForCharacteristics:inHome:", v15, v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v27[0] = v11;
    v27[1] = 3221225472;
    v27[2] = __98__HUCharacteristicTriggerServicePickerContentViewController__addCharacteristicEventsForAlarmItem___block_invoke_4;
    v27[3] = &unk_1E6F51CA8;
    v27[4] = self;
    v28 = v15;
    objc_msgSend(v22, "flatMap:", v27);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUCharacteristicTriggerServicePickerContentViewController setCharacteristicReadFuture:](self, "setCharacteristicReadFuture:", v23);

  }
}

id __98__HUCharacteristicTriggerServicePickerContentViewController__addCharacteristicEventsForAlarmItem___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0C99E60];
  objc_msgSend(a2, "characteristics");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithArray:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

uint64_t __98__HUCharacteristicTriggerServicePickerContentViewController__addCharacteristicEventsForAlarmItem___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v3 = a2;
  objc_msgSend(v3, "characteristicType");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = *(void **)(a1 + 32);
    objc_msgSend(v3, "characteristicType");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v5, "containsObject:", v6);

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

uint64_t __98__HUCharacteristicTriggerServicePickerContentViewController__addCharacteristicEventsForAlarmItem___block_invoke_3(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  uint64_t v4;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "characteristicType");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "isEqualToString:", v3);

  return v4;
}

uint64_t __98__HUCharacteristicTriggerServicePickerContentViewController__addCharacteristicEventsForAlarmItem___block_invoke_4(uint64_t a1, uint64_t a2)
{
  objc_msgSend(*(id *)(a1 + 32), "_addTriggerValue:forCharacteristics:", a2, *(_QWORD *)(a1 + 40));
  return objc_msgSend(MEMORY[0x1E0D519C0], "futureWithNoResult");
}

- (void)_addCharacteristicEventsForOtherDeviceItem:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v16[5];
  _QWORD v17[5];
  _QWORD v18[4];
  id v19;
  id v20[2];

  v4 = a3;
  objc_msgSend(v4, "services");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "na_map:", &__block_literal_global_135_0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "na_setByFlattening");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v20[0] = 0;
  +[HUCharacteristicEventOptionProvider hasOptionsForServiceVendingItem:outCharacteristicType:](HUCharacteristicEventOptionProvider, "hasOptionsForServiceVendingItem:outCharacteristicType:", v4, v20);
  v8 = v20[0];
  if (!v8)
    NSLog(CFSTR("No supported characteristic types found in service vending item: %@"), v4);
  v9 = MEMORY[0x1E0C809B0];
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __104__HUCharacteristicTriggerServicePickerContentViewController__addCharacteristicEventsForOtherDeviceItem___block_invoke_2;
  v18[3] = &unk_1E6F4EE30;
  v10 = v8;
  v19 = v10;
  objc_msgSend(v7, "na_filter:", v18);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v11, "count"))
    NSLog(CFSTR("No characteristics found of type %@ for item: %@"), v10, v4);
  -[HUCharacteristicTriggerServicePickerContentViewController eventBuilderItem](self, "eventBuilderItem");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setCharacteristics:triggerValue:", v11, 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "deletions");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v9;
  v17[1] = 3221225472;
  v17[2] = __104__HUCharacteristicTriggerServicePickerContentViewController__addCharacteristicEventsForOtherDeviceItem___block_invoke_3;
  v17[3] = &unk_1E6F51CF0;
  v17[4] = self;
  objc_msgSend(v14, "na_each:", v17);

  objc_msgSend(v13, "additions");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v9;
  v16[1] = 3221225472;
  v16[2] = __104__HUCharacteristicTriggerServicePickerContentViewController__addCharacteristicEventsForOtherDeviceItem___block_invoke_4;
  v16[3] = &unk_1E6F51CF0;
  v16[4] = self;
  objc_msgSend(v15, "na_each:", v16);

}

id __104__HUCharacteristicTriggerServicePickerContentViewController__addCharacteristicEventsForOtherDeviceItem___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0C99E60];
  objc_msgSend(a2, "characteristics");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithArray:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

uint64_t __104__HUCharacteristicTriggerServicePickerContentViewController__addCharacteristicEventsForOtherDeviceItem___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  uint64_t v4;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "characteristicType");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "isEqualToString:", v3);

  return v4;
}

void __104__HUCharacteristicTriggerServicePickerContentViewController__addCharacteristicEventsForOtherDeviceItem___block_invoke_3(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  id v4;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "triggerBuilder");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeEventBuilder:", v3);

}

void __104__HUCharacteristicTriggerServicePickerContentViewController__addCharacteristicEventsForOtherDeviceItem___block_invoke_4(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  id v4;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "triggerBuilder");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addEventBuilder:", v3);

}

- (void)_addTriggerValue:(id)a3 forCharacteristics:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;
  _QWORD v13[5];
  _QWORD v14[5];

  v6 = a4;
  v7 = a3;
  -[HUCharacteristicTriggerServicePickerContentViewController eventBuilderItem](self, "eventBuilderItem");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setCharacteristics:triggerValue:", v6, v7);
  v12 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "deletions");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = MEMORY[0x1E0C809B0];
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __97__HUCharacteristicTriggerServicePickerContentViewController__addTriggerValue_forCharacteristics___block_invoke;
  v14[3] = &unk_1E6F51CF0;
  v14[4] = self;
  objc_msgSend(v9, "na_each:", v14);

  objc_msgSend(v12, "additions");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v10;
  v13[1] = 3221225472;
  v13[2] = __97__HUCharacteristicTriggerServicePickerContentViewController__addTriggerValue_forCharacteristics___block_invoke_2;
  v13[3] = &unk_1E6F51CF0;
  v13[4] = self;
  objc_msgSend(v11, "na_each:", v13);

}

void __97__HUCharacteristicTriggerServicePickerContentViewController__addTriggerValue_forCharacteristics___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  id v4;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "triggerBuilder");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeEventBuilder:", v3);

}

void __97__HUCharacteristicTriggerServicePickerContentViewController__addTriggerValue_forCharacteristics___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  id v4;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "triggerBuilder");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addEventBuilder:", v3);

}

- (void)_validateNextButton
{
  void *v3;
  _BOOL8 v4;
  void *v5;
  void *v6;
  id v7;

  -[HUSelectableServiceGridViewController selectedItems](self, "selectedItems");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "toSet");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count") != 0;
  -[HUCharacteristicTriggerServicePickerContentViewController effectiveNavigationItem](self, "effectiveNavigationItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "rightBarButtonItem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setEnabled:", v4);

}

+ (id)transformationSetBlock
{
  _QWORD aBlock[5];

  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __83__HUCharacteristicTriggerServicePickerContentViewController_transformationSetBlock__block_invoke;
  aBlock[3] = &__block_descriptor_40_e23___NSSet_16__0__HFItem_8l;
  aBlock[4] = a1;
  return _Block_copy(aBlock);
}

id __83__HUCharacteristicTriggerServicePickerContentViewController_transformationSetBlock__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  void *v14;
  _QWORD v16[4];
  id v17;
  uint64_t v18;
  _QWORD v19[4];
  id v20;
  uint64_t v21;

  v3 = a2;
  v4 = &unk_1EF2AC378;
  if (objc_msgSend(v3, "conformsToProtocol:", v4))
    v5 = v3;
  else
    v5 = 0;
  v6 = v5;

  v7 = MEMORY[0x1E0C809B0];
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __83__HUCharacteristicTriggerServicePickerContentViewController_transformationSetBlock__block_invoke_2;
  v19[3] = &unk_1E6F51D58;
  v8 = v6;
  v9 = *(_QWORD *)(a1 + 32);
  v20 = v8;
  v21 = v9;
  __83__HUCharacteristicTriggerServicePickerContentViewController_transformationSetBlock__block_invoke_2((uint64_t)v19);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v10 && (unint64_t)objc_msgSend(v10, "count") >= 2)
  {
    v16[0] = v7;
    v16[1] = 3221225472;
    v16[2] = __83__HUCharacteristicTriggerServicePickerContentViewController_transformationSetBlock__block_invoke_5;
    v16[3] = &unk_1E6F51DA8;
    v12 = v3;
    v13 = *(_QWORD *)(a1 + 32);
    v17 = v12;
    v18 = v13;
    objc_msgSend(v11, "na_map:", v16);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "na_setWithSafeObject:", v3);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v14;
}

id __83__HUCharacteristicTriggerServicePickerContentViewController_transformationSetBlock__block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[5];

  v2 = *(void **)(a1 + 32);
  if (!v2)
    return 0;
  objc_msgSend(v2, "services");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __83__HUCharacteristicTriggerServicePickerContentViewController_transformationSetBlock__block_invoke_3;
  v6[3] = &__block_descriptor_40_e26___NSSet_16__0__HMService_8l;
  v6[4] = *(_QWORD *)(a1 + 40);
  objc_msgSend(v3, "na_flatMap:", v6);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

id __83__HUCharacteristicTriggerServicePickerContentViewController_transformationSetBlock__block_invoke_3(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[5];

  v3 = (void *)MEMORY[0x1E0C99E60];
  objc_msgSend(a2, "characteristics");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setWithArray:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __83__HUCharacteristicTriggerServicePickerContentViewController_transformationSetBlock__block_invoke_4;
  v8[3] = &__block_descriptor_40_e26_B16__0__HMCharacteristic_8l;
  v8[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(v5, "na_filter:", v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

BOOL __83__HUCharacteristicTriggerServicePickerContentViewController_transformationSetBlock__block_invoke_4(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  _BOOL8 v7;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "splitCharacteristicResults");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "characteristicType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "objectForKeyedSubscript:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6 != 0;

  return v7;
}

id __83__HUCharacteristicTriggerServicePickerContentViewController_transformationSetBlock__block_invoke_5(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  void *v8;
  _QWORD v10[4];
  id v11;
  uint64_t v12;

  v3 = a2;
  v4 = objc_alloc(MEMORY[0x1E0D317E0]);
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __83__HUCharacteristicTriggerServicePickerContentViewController_transformationSetBlock__block_invoke_6;
  v10[3] = &unk_1E6F51D80;
  v6 = *(_QWORD *)(a1 + 32);
  v5 = *(_QWORD *)(a1 + 40);
  v11 = v3;
  v12 = v5;
  v7 = v3;
  v8 = (void *)objc_msgSend(v4, "initWithSourceItem:transformationBlock:", v6, v10);

  return v8;
}

id __83__HUCharacteristicTriggerServicePickerContentViewController_transformationSetBlock__block_invoke_6(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)objc_msgSend(a2, "mutableCopy");
  objc_msgSend(v3, "setObject:forKeyedSubscript:", *(_QWORD *)(a1 + 32), CFSTR("HUCharacteristicTriggerServiceRepresentativeCharacteristicKey"));
  objc_msgSend(*(id *)(a1 + 40), "splitCharacteristicResults");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "characteristicType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addEntriesFromDictionary:", v6);

  return v3;
}

+ (id)splitCharacteristicResults
{
  if (_MergedGlobals_4_0 != -1)
    dispatch_once(&_MergedGlobals_4_0, &__block_literal_global_152);
  return (id)qword_1EF2269F0;
}

void __87__HUCharacteristicTriggerServicePickerContentViewController_splitCharacteristicResults__block_invoke_2()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  _QWORD v16[2];
  _QWORD v17[2];
  _QWORD v18[2];
  _QWORD v19[2];
  uint64_t v20;
  uint64_t v21;
  _QWORD v22[2];
  _QWORD v23[3];
  _QWORD v24[5];

  v24[3] = *MEMORY[0x1E0C80C00];
  v23[0] = *MEMORY[0x1E0CB87B0];
  v20 = *MEMORY[0x1E0D30BF8];
  v0 = v20;
  HFLocalizedString();
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = v1;
  v21 = *MEMORY[0x1E0D30C60];
  v2 = v21;
  v3 = objc_alloc(MEMORY[0x1E0D311C8]);
  v4 = (void *)objc_msgSend(v3, "initWithPackageIdentifier:", *MEMORY[0x1E0D304A0]);
  v22[1] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v22, &v20, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = v5;
  v23[1] = *MEMORY[0x1E0CB8880];
  v18[0] = v0;
  HFLocalizedString();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v18[1] = v2;
  v19[0] = v6;
  v7 = objc_alloc(MEMORY[0x1E0D311C8]);
  v8 = (void *)objc_msgSend(v7, "initWithPackageIdentifier:", *MEMORY[0x1E0D304B0]);
  v19[1] = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v19, v18, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v24[1] = v9;
  v23[2] = *MEMORY[0x1E0CB8890];
  v16[0] = v0;
  HFLocalizedString();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v16[1] = v2;
  v17[0] = v10;
  v11 = objc_alloc(MEMORY[0x1E0D311C8]);
  v12 = (void *)objc_msgSend(v11, "initWithPackageIdentifier:", *MEMORY[0x1E0D304C0], v16[0], v2, v10);
  v17[1] = v12;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v17, v16, 2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v24[2] = v13;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v24, v23, 3);
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = (void *)qword_1EF2269F0;
  qword_1EF2269F0 = v14;

}

- (HFCharacteristicEventBuilderItem)eventBuilderItem
{
  return self->_eventBuilderItem;
}

- (HFEventTriggerBuilder)triggerBuilder
{
  return self->_triggerBuilder;
}

- (unint64_t)mode
{
  return self->_mode;
}

- (unint64_t)source
{
  return self->_source;
}

- (UINavigationItem)effectiveNavigationItem
{
  return self->_effectiveNavigationItem;
}

- (id)filter
{
  return self->_filter;
}

- (void)setFilter:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1296);
}

- (NAFuture)characteristicReadFuture
{
  return self->_characteristicReadFuture;
}

- (void)setCharacteristicReadFuture:(id)a3
{
  objc_storeStrong((id *)&self->_characteristicReadFuture, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_characteristicReadFuture, 0);
  objc_storeStrong(&self->_filter, 0);
  objc_storeStrong((id *)&self->_effectiveNavigationItem, 0);
  objc_storeStrong((id *)&self->_triggerBuilder, 0);
  objc_storeStrong((id *)&self->_eventBuilderItem, 0);
}

@end
