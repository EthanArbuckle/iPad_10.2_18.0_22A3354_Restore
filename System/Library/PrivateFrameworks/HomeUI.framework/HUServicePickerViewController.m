@implementation HUServicePickerViewController

- (HUServicePickerViewController)initWithHome:(id)a3 isPresentedModally:(BOOL)a4 delegate:(id)a5
{
  return -[HUServicePickerViewController initWithHome:selectedServices:isPresentedModally:delegate:](self, "initWithHome:selectedServices:isPresentedModally:delegate:", a3, 0, a4, a5);
}

- (HUServicePickerViewController)initWithHome:(id)a3 selectedServices:(id)a4 isPresentedModally:(BOOL)a5 delegate:(id)a6
{
  id v10;
  id v11;
  id v12;
  HUServiceGridItemManager *v13;
  void *v14;
  HUServiceGridItemManager *v15;
  HUServicePickerViewController *v16;
  HUServicePickerViewController *v17;
  void *v18;
  objc_super v20;

  v10 = a3;
  v11 = a4;
  v12 = a6;
  v13 = [HUServiceGridItemManager alloc];
  +[HUSelectableServiceGridViewController defaultItemProviderCreatorWithOptions:](HUServicePickerViewController, "defaultItemProviderCreatorWithOptions:", 11);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = -[HUServiceGridItemManager initWithDelegate:shouldGroupByRoom:itemProvidersCreator:](v13, "initWithDelegate:shouldGroupByRoom:itemProvidersCreator:", self, 1, v14);

  -[HFItemManager setHome:](v15, "setHome:", v10);
  v20.receiver = self;
  v20.super_class = (Class)HUServicePickerViewController;
  v16 = -[HUSelectableServiceGridViewController initWithServiceGridItemManager:](&v20, sel_initWithServiceGridItemManager_, v15);
  v17 = v16;
  if (v16)
  {
    -[HUServiceGridViewController setDelegate:](v16, "setDelegate:", v12);
    v17->_isPresentedModally = a5;
    objc_storeStrong((id *)&v17->_preselectedServices, a4);
    objc_msgSend(MEMORY[0x1E0D31430], "sharedDispatcher");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setOverrideHome:", v10);

  }
  return v17;
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)HUServicePickerViewController;
  -[HUServiceGridViewController viewDidLoad](&v8, sel_viewDidLoad);
  -[HUItemCollectionViewController itemManager](self, "itemManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "home");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "hf_displayName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUServicePickerViewController setTitle:](self, "setTitle:", v5);

  -[HUServicePickerViewController _setUpNavButtons](self, "_setUpNavButtons");
  objc_msgSend(MEMORY[0x1E0CEA478], "systemGroupedBackgroundColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUServicePickerViewController collectionView](self, "collectionView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setBackgroundColor:", v6);

}

- (void)_setUpNavButtons
{
  _BOOL4 v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v3 = -[HUServicePickerViewController isPresentedModally](self, "isPresentedModally");
  v4 = objc_alloc(MEMORY[0x1E0CEA380]);
  v5 = v4;
  if (v3)
  {
    v6 = (void *)objc_msgSend(v4, "initWithBarButtonSystemItem:target:action:", 1, self, sel__cancel_);
    -[HUServicePickerViewController navigationItem](self, "navigationItem");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setLeftBarButtonItem:", v6);

    v10 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA380]), "initWithBarButtonSystemItem:target:action:", 0, self, sel__done_);
    -[HUServicePickerViewController navigationItem](self, "navigationItem");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setRightBarButtonItem:", v10);
  }
  else
  {
    _HULocalizedStringWithDefaultValue(CFSTR("HUNextTitle"), CFSTR("HUNextTitle"), 1);
    v10 = (id)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v5, "initWithTitle:style:target:action:");
    -[HUServicePickerViewController navigationItem](self, "navigationItem");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setRightBarButtonItem:", v8);

  }
}

- (void)_cancel:(id)a3
{
  id v4;

  -[HUServiceGridViewController delegate](self, "delegate", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "servicePickerDidCancel:", self);

}

- (void)_done:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  -[HUSelectableServiceGridViewController selectedItems](self, "selectedItems", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "toSet");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUServicePickerViewController _servicesForItems:](self, "_servicesForItems:", v5);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  -[HUServiceGridViewController delegate](self, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "servicePickerDidFinish:selectedServices:", self, v7);

}

- (id)_servicesForItems:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v8;
  uint64_t v9;
  id (*v10)(uint64_t, void *);
  void *v11;
  id v12;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  v8 = MEMORY[0x1E0C809B0];
  v9 = 3221225472;
  v10 = __51__HUServicePickerViewController__servicesForItems___block_invoke;
  v11 = &unk_1E6F5C4B8;
  objc_copyWeak(&v12, &location);
  objc_msgSend(v4, "na_map:", &v8);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "na_setByFlattening", v8, v9, v10, v11);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);

  return v6;
}

id __51__HUServicePickerViewController__servicesForItems___block_invoke(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;
  void *v5;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "_servicesForItem:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)_servicesForItem:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  if (objc_msgSend(v3, "conformsToProtocol:", &unk_1EF2AC378))
  {
    objc_msgSend(v3, "services");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)itemManagerDidUpdate:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, void *);
  void *v15;
  id v16;
  id location;
  objc_super v18;

  v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)HUServicePickerViewController;
  -[HUSelectableServiceGridViewController itemManagerDidUpdate:](&v18, sel_itemManagerDidUpdate_, v4);
  -[HUServicePickerViewController preselectedServices](self, "preselectedServices");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_initWeak(&location, self);
    -[HUItemCollectionViewController itemManager](self, "itemManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "allItems");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = MEMORY[0x1E0C809B0];
    v13 = 3221225472;
    v14 = __54__HUServicePickerViewController_itemManagerDidUpdate___block_invoke;
    v15 = &unk_1E6F59750;
    objc_copyWeak(&v16, &location);
    objc_msgSend(v7, "na_filter:", &v12);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = objc_alloc(MEMORY[0x1E0D31580]);
    v10 = (void *)objc_msgSend(v9, "initWithFromSet:", v8, v12, v13, v14, v15);
    v11 = (void *)objc_msgSend(v10, "copy");
    -[HUSelectableServiceGridViewController setSelectedItems:](self, "setSelectedItems:", v11);

    objc_destroyWeak(&v16);
    objc_destroyWeak(&location);
  }

}

uint64_t __54__HUServicePickerViewController_itemManagerDidUpdate___block_invoke(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;
  uint64_t v5;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  v5 = objc_msgSend(WeakRetained, "_isItemPreselected:", v3);

  return v5;
}

- (BOOL)_isItemPreselected:(id)a3
{
  id v4;
  void *v5;
  char v6;
  _QWORD v8[4];
  id v9;
  id location;

  v4 = a3;
  -[HUServicePickerViewController _servicesForItem:](self, "_servicesForItem:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_initWeak(&location, self);
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __52__HUServicePickerViewController__isItemPreselected___block_invoke;
    v8[3] = &unk_1E6F5C4E0;
    objc_copyWeak(&v9, &location);
    v6 = objc_msgSend(v5, "na_any:", v8);
    objc_destroyWeak(&v9);
    objc_destroyWeak(&location);
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

uint64_t __52__HUServicePickerViewController__isItemPreselected___block_invoke(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;
  uint64_t v5;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  v5 = objc_msgSend(WeakRetained, "_preselectedServicesContainsService:", v3);

  return v5;
}

- (BOOL)_preselectedServicesContainsService:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  -[HUServicePickerViewController preselectedServices](self, "preselectedServices");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[HUServicePickerViewController preselectedServices](self, "preselectedServices");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __69__HUServicePickerViewController__preselectedServicesContainsService___block_invoke;
    v9[3] = &unk_1E6F4EE58;
    v10 = v4;
    v7 = objc_msgSend(v6, "na_any:", v9);

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

uint64_t __69__HUServicePickerViewController__preselectedServicesContainsService___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;

  objc_msgSend(a2, "uniqueIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "uniqueIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "isEqual:", v4);

  return v5;
}

- (BOOL)serviceGridItemManager:(id)a3 shouldHideItem:(id)a4
{
  void *v4;
  BOOL v5;

  -[HUServicePickerViewController _servicesForItem:](self, "_servicesForItem:", a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4 == 0;

  return v5;
}

- (BOOL)isPresentedModally
{
  return self->_isPresentedModally;
}

- (void)setIsPresentedModally:(BOOL)a3
{
  self->_isPresentedModally = a3;
}

- (NSSet)preselectedServices
{
  return self->_preselectedServices;
}

- (void)setPreselectedServices:(id)a3
{
  objc_storeStrong((id *)&self->_preselectedServices, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_preselectedServices, 0);
}

@end
