@implementation HUCharacteristicEventServicePickerContentViewController

- (HUCharacteristicEventServicePickerContentViewController)initWithTriggerBuilder:(id)a3 eventBuilderItem:(id)a4 source:(unint64_t)a5
{
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  void *v15;
  HUServiceGridItemManager *v16;
  HUCharacteristicEventServicePickerContentViewController *v17;
  HUCharacteristicEventServicePickerContentViewController *v18;
  objc_super v20;
  _QWORD aBlock[4];
  id v22;
  id v23;

  v9 = a3;
  v10 = a4;
  objc_msgSend((id)objc_opt_class(), "transformationSetBlock");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[HUSelectableServiceGridViewController defaultItemProviderCreatorWithOptions:](HUCharacteristicEventServicePickerContentViewController, "defaultItemProviderCreatorWithOptions:", 9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __106__HUCharacteristicEventServicePickerContentViewController_initWithTriggerBuilder_eventBuilderItem_source___block_invoke;
  aBlock[3] = &unk_1E6F51BB8;
  v13 = v12;
  v22 = v13;
  v14 = v11;
  v23 = v14;
  v15 = _Block_copy(aBlock);
  v16 = -[HUServiceGridItemManager initWithDelegate:shouldGroupByRoom:itemProvidersCreator:]([HUServiceGridItemManager alloc], "initWithDelegate:shouldGroupByRoom:itemProvidersCreator:", self, 1, v15);
  v20.receiver = self;
  v20.super_class = (Class)HUCharacteristicEventServicePickerContentViewController;
  v17 = -[HUSelectableServiceGridViewController initWithServiceGridItemManager:](&v20, sel_initWithServiceGridItemManager_, v16);
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_eventBuilderItem, a4);
    objc_storeStrong((id *)&v18->_triggerBuilder, a3);
    v18->_source = a5;
    -[HUSelectableServiceGridViewController setAllowsMultipleSelection:](v18, "setAllowsMultipleSelection:", 0);
  }

  return v18;
}

id __106__HUCharacteristicEventServicePickerContentViewController_initWithTriggerBuilder_eventBuilderItem_source___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  _QWORD v5[4];
  id v6;

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __106__HUCharacteristicEventServicePickerContentViewController_initWithTriggerBuilder_eventBuilderItem_source___block_invoke_2;
  v5[3] = &unk_1E6F51B90;
  v6 = *(id *)(a1 + 40);
  objc_msgSend(v2, "na_map:", v5);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

id __106__HUCharacteristicEventServicePickerContentViewController_initWithTriggerBuilder_eventBuilderItem_source___block_invoke_2(uint64_t a1, void *a2)
{
  objc_class *v3;
  id v4;
  void *v5;

  v3 = (objc_class *)MEMORY[0x1E0D31568];
  v4 = a2;
  v5 = (void *)objc_msgSend([v3 alloc], "initWithSourceProvider:multipleTransformationBlock:", v4, *(_QWORD *)(a1 + 32));

  return v5;
}

- (HUCharacteristicEventServicePickerContentViewController)initWithFlow:(id)a3 stepIdentifier:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  HUCharacteristicEventServicePickerContentViewController *v11;

  v6 = a3;
  v7 = a4;
  v8 = objc_msgSend(v6, "viewController:servicePickerSourceForStep:", self, v7);
  objc_msgSend(v6, "triggerBuilder");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "eventBuilderItem");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[HUCharacteristicEventServicePickerContentViewController initWithTriggerBuilder:eventBuilderItem:source:](self, "initWithTriggerBuilder:eventBuilderItem:source:", v9, v10, v8);

  if (v11)
  {
    -[HUCharacteristicEventServicePickerContentViewController setFlow:](v11, "setFlow:", v6);
    -[HUCharacteristicEventServicePickerContentViewController setStepIdentifier:](v11, "setStepIdentifier:", v7);
  }

  return v11;
}

- (HUCharacteristicEventServicePickerContentViewController)initWithServiceGridItemManager:(id)a3
{
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_initWithFlow_stepIdentifier_);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HUCharacteristicEventServicePickerContentViewController.m"), 91, CFSTR("%s is unavailable; use %@ instead"),
    "-[HUCharacteristicEventServicePickerContentViewController initWithServiceGridItemManager:]",
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
  void *v12;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)HUCharacteristicEventServicePickerContentViewController;
  -[HUServiceGridViewController viewDidLoad](&v13, sel_viewDidLoad);
  -[HUCharacteristicEventServicePickerContentViewController collectionView](self, "collectionView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_setShouldDeriveVisibleBoundsFromContainingScrollView:", 1);

  -[HUCharacteristicEventServicePickerContentViewController collectionView](self, "collectionView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setScrollEnabled:", 0);

  -[HUCharacteristicEventServicePickerContentViewController collectionView](self, "collectionView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setClipsToBounds:", 1);

  objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUCharacteristicEventServicePickerContentViewController collectionView](self, "collectionView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setBackgroundColor:", v6);

  objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUCharacteristicEventServicePickerContentViewController view](self, "view");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setBackgroundColor:", v8);

  -[HUCharacteristicEventServicePickerContentViewController servicePickerDelegate](self, "servicePickerDelegate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUSelectableServiceGridViewController selectedItems](self, "selectedItems");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "toSet");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "characteristicEventServicePickerContentViewController:didChangeNumberOfSelectedItems:", self, objc_msgSend(v12, "count"));

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
  void *v19;
  void *v20;
  void *v21;
  _QWORD v22[6];
  _QWORD v23[5];
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  objc_super v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v28.receiver = self;
  v28.super_class = (Class)HUCharacteristicEventServicePickerContentViewController;
  -[HUSelectableServiceGridViewController itemManagerDidUpdate:](&v28, sel_itemManagerDidUpdate_, a3);
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  -[HUItemCollectionViewController itemManager](self, "itemManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "allDisplayedItems");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v25;
    v9 = MEMORY[0x1E0C809B0];
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v25 != v8)
          objc_enumerationMutation(v5);
        v11 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
        if ((objc_msgSend(v11, "conformsToProtocol:", &unk_1EF2AC378) & 1) == 0)
          NSLog(CFSTR("Our items must vend services, e.g., they should be instances of HFServiceItem HFServiceGroupItem, or something similar"));
        if (objc_msgSend(v11, "conformsToProtocol:", &unk_1EF2AC378))
        {
          v12 = v11;
          objc_msgSend(v12, "services");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v23[0] = v9;
          v23[1] = 3221225472;
          v23[2] = __80__HUCharacteristicEventServicePickerContentViewController_itemManagerDidUpdate___block_invoke;
          v23[3] = &unk_1E6F4EE58;
          v23[4] = self;
          v14 = objc_msgSend(v13, "na_any:", v23);

          if (v14)
          {
            v22[0] = v9;
            v22[1] = 3221225472;
            v22[2] = __80__HUCharacteristicEventServicePickerContentViewController_itemManagerDidUpdate___block_invoke_3;
            v22[3] = &unk_1E6F51BE0;
            v15 = v12;
            v22[4] = v15;
            v22[5] = self;
            if (__80__HUCharacteristicEventServicePickerContentViewController_itemManagerDidUpdate___block_invoke_3((uint64_t)v22))
              objc_msgSend(v21, "addObject:", v15);

          }
        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
    }
    while (v7);
  }

  v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D31580]), "initWithFromSet:", v21);
  v17 = (void *)objc_msgSend(v16, "copy");
  -[HUSelectableServiceGridViewController setSelectedItems:](self, "setSelectedItems:", v17);

  -[HUCharacteristicEventServicePickerContentViewController servicePickerDelegate](self, "servicePickerDelegate");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUSelectableServiceGridViewController selectedItems](self, "selectedItems");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "toSet");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "characteristicEventServicePickerContentViewController:didChangeNumberOfSelectedItems:", self, objc_msgSend(v20, "count"));

}

uint64_t __80__HUCharacteristicEventServicePickerContentViewController_itemManagerDidUpdate___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  _QWORD v6[5];

  objc_msgSend(a2, "characteristics");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __80__HUCharacteristicEventServicePickerContentViewController_itemManagerDidUpdate___block_invoke_2;
  v6[3] = &unk_1E6F4EE30;
  v6[4] = *(_QWORD *)(a1 + 32);
  v4 = objc_msgSend(v3, "na_any:", v6);

  return v4;
}

uint64_t __80__HUCharacteristicEventServicePickerContentViewController_itemManagerDidUpdate___block_invoke_2(uint64_t a1, void *a2)
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

uint64_t __80__HUCharacteristicEventServicePickerContentViewController_itemManagerDidUpdate___block_invoke_3(uint64_t a1)
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
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("HUCharacteristicEventServiceRepresentativeCharacteristicKey"));
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
  v7.super_class = (Class)HUCharacteristicEventServicePickerContentViewController;
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
  v7.super_class = (Class)HUCharacteristicEventServicePickerContentViewController;
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
    v25.super_class = (Class)HUCharacteristicEventServicePickerContentViewController;
    if (-[HUSelectableServiceGridViewController serviceGridItemManager:shouldHideItem:](&v25, sel_serviceGridItemManager_shouldHideItem_, v6, v7))
    {
      goto LABEL_3;
    }
  }
  if (!objc_msgSend(v7, "conformsToProtocol:", &unk_1EF2AC378))
    goto LABEL_13;
  v9 = v7;
  v10 = -[HUCharacteristicEventServicePickerContentViewController source](self, "source");
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
      -[HUCharacteristicEventServicePickerContentViewController filter](self, "filter");
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v20)
      {
        LOBYTE(v8) = 0;
        goto LABEL_17;
      }
      -[HUCharacteristicEventServicePickerContentViewController filter](self, "filter");
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
    v23[2] = __97__HUCharacteristicEventServicePickerContentViewController_serviceGridItemManager_shouldHideItem___block_invoke;
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

uint64_t __97__HUCharacteristicEventServicePickerContentViewController_serviceGridItemManager_shouldHideItem___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  _QWORD v6[4];
  id v7;

  objc_msgSend(a2, "characteristics");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __97__HUCharacteristicEventServicePickerContentViewController_serviceGridItemManager_shouldHideItem___block_invoke_2;
  v6[3] = &unk_1E6F4EE30;
  v7 = *(id *)(a1 + 32);
  v4 = objc_msgSend(v3, "na_any:", v6);

  return v4;
}

uint64_t __97__HUCharacteristicEventServicePickerContentViewController_serviceGridItemManager_shouldHideItem___block_invoke_2(uint64_t a1, void *a2)
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

  -[HUCharacteristicEventServicePickerContentViewController triggerBuilder](self, "triggerBuilder", a3, a4);
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
  unint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)HUCharacteristicEventServicePickerContentViewController;
  -[HUSelectableServiceGridViewController didChangeSelection](&v11, sel_didChangeSelection);
  -[HUSelectableServiceGridViewController selectedItems](self, "selectedItems");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "toSet");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "anyObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5 && (objc_msgSend(v5, "conformsToProtocol:", &unk_1EF2AC378) & 1) == 0)
    NSLog(CFSTR("Our items must vend services, e.g., they should be instances of HFServiceItem HFServiceGroupItem, or something similar"));
  if (objc_msgSend(v5, "conformsToProtocol:", &unk_1EF2AC378))
  {
    v6 = v5;
    v7 = -[HUCharacteristicEventServicePickerContentViewController source](self, "source");
    if (v7 == 1)
    {
      -[HUCharacteristicEventServicePickerContentViewController _addCharacteristicEventsForOtherDeviceItem:](self, "_addCharacteristicEventsForOtherDeviceItem:", v6);
    }
    else if (!v7)
    {
      -[HUCharacteristicEventServicePickerContentViewController _addCharacteristicEventsForAlarmItem:](self, "_addCharacteristicEventsForAlarmItem:", v6);
    }

  }
  -[HUCharacteristicEventServicePickerContentViewController servicePickerDelegate](self, "servicePickerDelegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUSelectableServiceGridViewController selectedItems](self, "selectedItems");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "toSet");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "characteristicEventServicePickerContentViewController:didChangeNumberOfSelectedItems:", self, objc_msgSend(v10, "count"));

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
  v20.super_class = (Class)HUCharacteristicEventServicePickerContentViewController;
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
      -[HUCharacteristicEventServicePickerContentViewController triggerBuilder](self, "triggerBuilder");
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
    -[HUCharacteristicEventServicePickerContentViewController triggerBuilder](self, "triggerBuilder");
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
  v30.super_class = (Class)HUCharacteristicEventServicePickerContentViewController;
  -[HUSelectableServiceGridViewController collectionView:didSelectItemAtIndexPath:](&v30, sel_collectionView_didSelectItemAtIndexPath_, v6, v7);

}

- (void)_addCharacteristicEventsForAlarmItem:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  HUCharacteristicEventServicePickerContentViewController *v22;
  void *v23;
  id v24;
  void *v25;
  int v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  _QWORD v34[5];
  _QWORD v35[5];
  _QWORD v36[4];
  id v37;
  _QWORD v38[4];
  id v39;

  v33 = a3;
  objc_msgSend(v33, "services");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "na_map:", &__block_literal_global_169);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "na_setByFlattening");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v33, "latestResults");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("HUCharacteristicEventServiceRepresentativeCharacteristicKey"));
  v7 = objc_claimAutoreleasedReturnValue();

  v31 = (void *)v7;
  if (v7 && objc_msgSend(v5, "containsObject:", v7))
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v7);
    v8 = objc_claimAutoreleasedReturnValue();

    v5 = (void *)v8;
  }
  objc_msgSend(MEMORY[0x1E0CBA458], "hf_sensingCharacteristicTypes");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = MEMORY[0x1E0C809B0];
  v38[0] = MEMORY[0x1E0C809B0];
  v38[1] = 3221225472;
  v38[2] = __96__HUCharacteristicEventServicePickerContentViewController__addCharacteristicEventsForAlarmItem___block_invoke_2;
  v38[3] = &unk_1E6F4EE30;
  v11 = v9;
  v39 = v11;
  objc_msgSend(v5, "na_firstObjectPassingTest:", v38);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "characteristicType");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v36[0] = v10;
  v36[1] = 3221225472;
  v36[2] = __96__HUCharacteristicEventServicePickerContentViewController__addCharacteristicEventsForAlarmItem___block_invoke_3;
  v36[3] = &unk_1E6F4EE30;
  v14 = v13;
  v37 = v14;
  objc_msgSend(v5, "na_filter:", v36);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CBA458], "hf_abnormalValueForSensorCharacteristicType:", v14);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v15, "count"))
  {
    NSLog(CFSTR("No alarm characteristics found for alarm item: %@"), v33);
    if (v16)
      goto LABEL_7;
    goto LABEL_6;
  }
  if (!v16)
LABEL_6:
    NSLog(CFSTR("No abnormal value found for alarm characteristic type: %@"), v14);
LABEL_7:
  v30 = v14;
  -[HUCharacteristicEventServicePickerContentViewController eventBuilderItem](self, "eventBuilderItem");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setCharacteristics:triggerValue:", v15, v16);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  -[HUCharacteristicEventServicePickerContentViewController flow](self, "flow");
  v19 = objc_claimAutoreleasedReturnValue();
  if (!v19)
    goto LABEL_9;
  v20 = (void *)v19;
  -[HUCharacteristicEventServicePickerContentViewController flow](self, "flow");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUCharacteristicEventServicePickerContentViewController stepIdentifier](self, "stepIdentifier");
  v22 = self;
  v23 = v5;
  v24 = v11;
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = objc_msgSend(v21, "shouldSaveEventBuildersToTriggerBuilderForStep:", v25);

  v11 = v24;
  v5 = v23;
  self = v22;

  if (v26)
  {
LABEL_9:
    objc_msgSend(v18, "deletions");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = MEMORY[0x1E0C809B0];
    v35[0] = MEMORY[0x1E0C809B0];
    v35[1] = 3221225472;
    v35[2] = __96__HUCharacteristicEventServicePickerContentViewController__addCharacteristicEventsForAlarmItem___block_invoke_4;
    v35[3] = &unk_1E6F51CF0;
    v35[4] = self;
    objc_msgSend(v27, "na_each:", v35);

    objc_msgSend(v18, "additions");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v34[0] = v28;
    v34[1] = 3221225472;
    v34[2] = __96__HUCharacteristicEventServicePickerContentViewController__addCharacteristicEventsForAlarmItem___block_invoke_5;
    v34[3] = &unk_1E6F51CF0;
    v34[4] = self;
    objc_msgSend(v29, "na_each:", v34);

  }
}

id __96__HUCharacteristicEventServicePickerContentViewController__addCharacteristicEventsForAlarmItem___block_invoke(uint64_t a1, void *a2)
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

uint64_t __96__HUCharacteristicEventServicePickerContentViewController__addCharacteristicEventsForAlarmItem___block_invoke_2(uint64_t a1, void *a2)
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

uint64_t __96__HUCharacteristicEventServicePickerContentViewController__addCharacteristicEventsForAlarmItem___block_invoke_3(uint64_t a1, void *a2)
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

void __96__HUCharacteristicEventServicePickerContentViewController__addCharacteristicEventsForAlarmItem___block_invoke_4(uint64_t a1, void *a2)
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

void __96__HUCharacteristicEventServicePickerContentViewController__addCharacteristicEventsForAlarmItem___block_invoke_5(uint64_t a1, void *a2)
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
  uint64_t v14;
  void *v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  HUCharacteristicEventServicePickerContentViewController *v21;
  void *v22;
  int v23;
  void *v24;
  void *v25;
  void *v26;
  _QWORD v27[5];
  _QWORD v28[5];
  _QWORD v29[4];
  id v30;
  id v31[2];

  v4 = a3;
  objc_msgSend(v4, "services");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "na_map:", &__block_literal_global_115_1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "na_setByFlattening");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v31[0] = 0;
  +[HUCharacteristicEventOptionProvider hasOptionsForServiceVendingItem:outCharacteristicType:](HUCharacteristicEventOptionProvider, "hasOptionsForServiceVendingItem:outCharacteristicType:", v4, v31);
  v8 = v31[0];
  if (!v8)
    NSLog(CFSTR("No supported characteristic types found in service vending item: %@"), v4);
  v9 = MEMORY[0x1E0C809B0];
  v29[0] = MEMORY[0x1E0C809B0];
  v29[1] = 3221225472;
  v29[2] = __102__HUCharacteristicEventServicePickerContentViewController__addCharacteristicEventsForOtherDeviceItem___block_invoke_2;
  v29[3] = &unk_1E6F4EE30;
  v10 = v8;
  v30 = v10;
  objc_msgSend(v7, "na_filter:", v29);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v11, "count"))
    NSLog(CFSTR("No characteristics found of type %@ for item: %@"), v10, v4);
  -[HUCharacteristicEventServicePickerContentViewController eventBuilderItem](self, "eventBuilderItem");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setCharacteristics:triggerValue:", v11, 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  -[HUCharacteristicEventServicePickerContentViewController flow](self, "flow");
  v14 = objc_claimAutoreleasedReturnValue();
  if (!v14)
    goto LABEL_7;
  v15 = (void *)v14;
  -[HUCharacteristicEventServicePickerContentViewController flow](self, "flow");
  v26 = v11;
  v16 = v10;
  v17 = v4;
  v18 = v7;
  v19 = v5;
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUCharacteristicEventServicePickerContentViewController stepIdentifier](self, "stepIdentifier");
  v21 = self;
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v20, "shouldSaveEventBuildersToTriggerBuilderForStep:", v22);

  self = v21;
  v9 = MEMORY[0x1E0C809B0];

  v5 = v19;
  v7 = v18;
  v4 = v17;
  v10 = v16;
  v11 = v26;

  if (v23)
  {
LABEL_7:
    objc_msgSend(v13, "deletions");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v28[0] = v9;
    v28[1] = 3221225472;
    v28[2] = __102__HUCharacteristicEventServicePickerContentViewController__addCharacteristicEventsForOtherDeviceItem___block_invoke_3;
    v28[3] = &unk_1E6F51CF0;
    v28[4] = self;
    objc_msgSend(v24, "na_each:", v28);

    objc_msgSend(v13, "additions");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v27[0] = v9;
    v27[1] = 3221225472;
    v27[2] = __102__HUCharacteristicEventServicePickerContentViewController__addCharacteristicEventsForOtherDeviceItem___block_invoke_4;
    v27[3] = &unk_1E6F51CF0;
    v27[4] = self;
    objc_msgSend(v25, "na_each:", v27);

  }
}

id __102__HUCharacteristicEventServicePickerContentViewController__addCharacteristicEventsForOtherDeviceItem___block_invoke(uint64_t a1, void *a2)
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

uint64_t __102__HUCharacteristicEventServicePickerContentViewController__addCharacteristicEventsForOtherDeviceItem___block_invoke_2(uint64_t a1, void *a2)
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

void __102__HUCharacteristicEventServicePickerContentViewController__addCharacteristicEventsForOtherDeviceItem___block_invoke_3(uint64_t a1, void *a2)
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

void __102__HUCharacteristicEventServicePickerContentViewController__addCharacteristicEventsForOtherDeviceItem___block_invoke_4(uint64_t a1, void *a2)
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

+ (id)transformationSetBlock
{
  _QWORD aBlock[5];

  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __81__HUCharacteristicEventServicePickerContentViewController_transformationSetBlock__block_invoke;
  aBlock[3] = &__block_descriptor_40_e23___NSSet_16__0__HFItem_8l;
  aBlock[4] = a1;
  return _Block_copy(aBlock);
}

id __81__HUCharacteristicEventServicePickerContentViewController_transformationSetBlock__block_invoke(uint64_t a1, void *a2)
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
  v19[2] = __81__HUCharacteristicEventServicePickerContentViewController_transformationSetBlock__block_invoke_2;
  v19[3] = &unk_1E6F51D58;
  v8 = v6;
  v9 = *(_QWORD *)(a1 + 32);
  v20 = v8;
  v21 = v9;
  __81__HUCharacteristicEventServicePickerContentViewController_transformationSetBlock__block_invoke_2((uint64_t)v19);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v10 && (unint64_t)objc_msgSend(v10, "count") >= 2)
  {
    v16[0] = v7;
    v16[1] = 3221225472;
    v16[2] = __81__HUCharacteristicEventServicePickerContentViewController_transformationSetBlock__block_invoke_5;
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

id __81__HUCharacteristicEventServicePickerContentViewController_transformationSetBlock__block_invoke_2(uint64_t a1)
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
  v6[2] = __81__HUCharacteristicEventServicePickerContentViewController_transformationSetBlock__block_invoke_3;
  v6[3] = &__block_descriptor_40_e26___NSSet_16__0__HMService_8l;
  v6[4] = *(_QWORD *)(a1 + 40);
  objc_msgSend(v3, "na_flatMap:", v6);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

id __81__HUCharacteristicEventServicePickerContentViewController_transformationSetBlock__block_invoke_3(uint64_t a1, void *a2)
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
  v8[2] = __81__HUCharacteristicEventServicePickerContentViewController_transformationSetBlock__block_invoke_4;
  v8[3] = &__block_descriptor_40_e26_B16__0__HMCharacteristic_8l;
  v8[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(v5, "na_filter:", v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

BOOL __81__HUCharacteristicEventServicePickerContentViewController_transformationSetBlock__block_invoke_4(uint64_t a1, void *a2)
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

id __81__HUCharacteristicEventServicePickerContentViewController_transformationSetBlock__block_invoke_5(uint64_t a1, void *a2)
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
  v10[2] = __81__HUCharacteristicEventServicePickerContentViewController_transformationSetBlock__block_invoke_6;
  v10[3] = &unk_1E6F51D80;
  v6 = *(_QWORD *)(a1 + 32);
  v5 = *(_QWORD *)(a1 + 40);
  v11 = v3;
  v12 = v5;
  v7 = v3;
  v8 = (void *)objc_msgSend(v4, "initWithSourceItem:transformationBlock:", v6, v10);

  return v8;
}

id __81__HUCharacteristicEventServicePickerContentViewController_transformationSetBlock__block_invoke_6(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)objc_msgSend(a2, "mutableCopy");
  objc_msgSend(v3, "setObject:forKeyedSubscript:", *(_QWORD *)(a1 + 32), CFSTR("HUCharacteristicEventServiceRepresentativeCharacteristicKey"));
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
  if (_MergedGlobals_4_4 != -1)
    dispatch_once(&_MergedGlobals_4_4, &__block_literal_global_132_3);
  return (id)qword_1EF226B60;
}

void __85__HUCharacteristicEventServicePickerContentViewController_splitCharacteristicResults__block_invoke_2()
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
  v15 = (void *)qword_1EF226B60;
  qword_1EF226B60 = v14;

}

- (HFEventTriggerBuilder)triggerBuilder
{
  return self->_triggerBuilder;
}

- (HFCharacteristicEventBuilderItem)eventBuilderItem
{
  return self->_eventBuilderItem;
}

- (unint64_t)source
{
  return self->_source;
}

- (HUCharacteristicEventServicePickerContentViewControllerDelegate)servicePickerDelegate
{
  return (HUCharacteristicEventServicePickerContentViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_servicePickerDelegate);
}

- (void)setServicePickerDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_servicePickerDelegate, a3);
}

- (id)filter
{
  return self->_filter;
}

- (void)setFilter:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1288);
}

- (HUEventUIFlow)flow
{
  return self->_flow;
}

- (void)setFlow:(id)a3
{
  objc_storeStrong((id *)&self->_flow, a3);
}

- (NSString)stepIdentifier
{
  return self->_stepIdentifier;
}

- (void)setStepIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_stepIdentifier, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stepIdentifier, 0);
  objc_storeStrong((id *)&self->_flow, 0);
  objc_storeStrong(&self->_filter, 0);
  objc_destroyWeak((id *)&self->_servicePickerDelegate);
  objc_storeStrong((id *)&self->_eventBuilderItem, 0);
  objc_storeStrong((id *)&self->_triggerBuilder, 0);
}

@end
