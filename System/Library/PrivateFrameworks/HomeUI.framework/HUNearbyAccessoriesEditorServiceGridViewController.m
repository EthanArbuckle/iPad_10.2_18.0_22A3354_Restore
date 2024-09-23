@implementation HUNearbyAccessoriesEditorServiceGridViewController

- (HUNearbyAccessoriesEditorServiceGridViewController)initWithAccessoryProfileSourceItem:(id)a3
{
  id v4;
  void *v5;
  HUServiceGridItemManager *v6;
  void *v7;
  HUServiceGridItemManager *v8;
  HUNearbyAccessoriesEditorServiceGridViewController *v9;
  uint64_t v10;
  HMAccessory *primaryAccessory;
  objc_super v13;

  v4 = a3;
  objc_msgSend((id)objc_opt_class(), "defaultItemProviderCreatorWithOptions:accessoryProfileItem:", 11, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = [HUServiceGridItemManager alloc];
  v7 = (void *)objc_msgSend(v4, "copy");
  v8 = -[HUServiceGridItemManager initWithDelegate:sourceItem:shouldGroupByRoom:shouldShowSectionHeaders:itemProvidersCreator:](v6, "initWithDelegate:sourceItem:shouldGroupByRoom:shouldShowSectionHeaders:itemProvidersCreator:", self, v7, 1, 1, v5);

  v13.receiver = self;
  v13.super_class = (Class)HUNearbyAccessoriesEditorServiceGridViewController;
  v9 = -[HUSelectableServiceGridViewController initWithServiceGridItemManager:](&v13, sel_initWithServiceGridItemManager_, v8);
  if (v9)
  {
    objc_msgSend(v4, "accessory");
    v10 = objc_claimAutoreleasedReturnValue();
    primaryAccessory = v9->_primaryAccessory;
    v9->_primaryAccessory = (HMAccessory *)v10;

  }
  return v9;
}

- (BOOL)serviceGridItemManager:(id)a3 shouldHideItem:(id)a4
{
  id v5;
  char v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  void *v17;
  id v18;
  void *v19;
  uint64_t v20;
  void *v21;

  v5 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    v7 = v5;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v8 = v7;
    else
      v8 = 0;
    v9 = v8;

    objc_opt_class();
    objc_msgSend(v9, "sourceHomeKitItem");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v11 = v10;
    else
      v11 = 0;
    v12 = v11;

    objc_opt_class();
    objc_msgSend(v9, "homeKitObject");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v14 = v13;
    else
      v14 = 0;
    v15 = v14;

    objc_opt_class();
    v16 = v7;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v17 = v16;
    else
      v17 = 0;
    v18 = v17;

    if (v12)
    {
      objc_msgSend(v12, "accessory");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "hf_primaryService");
      v20 = objc_claimAutoreleasedReturnValue();

      v15 = v19;
    }
    else
    {
      if (!v18)
      {
LABEL_20:
        -[HUNearbyAccessoriesEditorServiceGridViewController primaryAccessory](self, "primaryAccessory");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v6 = objc_msgSend(v21, "hf_shouldHideNearbyAccessoryService:", v15);

        goto LABEL_21;
      }
      objc_msgSend(v18, "service");
      v20 = objc_claimAutoreleasedReturnValue();
    }

    v15 = (id)v20;
    goto LABEL_20;
  }
  v6 = 1;
LABEL_21:

  return v6;
}

+ (id)defaultItemProviderCreatorWithOptions:(unint64_t)a3 accessoryProfileItem:(id)a4
{
  id v5;
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;
  unint64_t v11;

  v5 = a4;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __113__HUNearbyAccessoriesEditorServiceGridViewController_defaultItemProviderCreatorWithOptions_accessoryProfileItem___block_invoke;
  v9[3] = &unk_1E6F5BF28;
  v10 = v5;
  v11 = a3;
  v6 = v5;
  v7 = _Block_copy(v9);

  return v7;
}

id __113__HUNearbyAccessoriesEditorServiceGridViewController_defaultItemProviderCreatorWithOptions_accessoryProfileItem___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  _QWORD v13[4];
  id v14;
  id v15;

  v3 = a2;
  objc_msgSend((id)objc_opt_class(), "transformationBlockWithOptions:", *(_QWORD *)(a1 + 40));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "accessory");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[HUNearbyAccessoriesItemManager itemProvidersForPrimaryAccessory:inHome:](HUNearbyAccessoriesItemManager, "itemProvidersForPrimaryAccessory:inHome:", v6, v3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __113__HUNearbyAccessoriesEditorServiceGridViewController_defaultItemProviderCreatorWithOptions_accessoryProfileItem___block_invoke_2;
  v13[3] = &unk_1E6F5BF00;
  v15 = v4;
  v8 = v5;
  v14 = v8;
  v9 = v4;
  objc_msgSend(v7, "enumerateObjectsUsingBlock:", v13);
  v10 = v14;
  v11 = v8;

  return v11;
}

void __113__HUNearbyAccessoriesEditorServiceGridViewController_defaultItemProviderCreatorWithOptions_accessoryProfileItem___block_invoke_2(uint64_t a1, void *a2)
{
  objc_class *v3;
  id v4;
  id v5;

  v3 = (objc_class *)MEMORY[0x1E0D31928];
  v4 = a2;
  v5 = (id)objc_msgSend([v3 alloc], "initWithSourceProvider:transformationBlock:", v4, *(_QWORD *)(a1 + 40));

  objc_msgSend(*(id *)(a1 + 32), "addObject:", v5);
}

- (HMAccessory)primaryAccessory
{
  return self->_primaryAccessory;
}

- (void)setPrimaryAccessory:(id)a3
{
  objc_storeStrong((id *)&self->_primaryAccessory, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_primaryAccessory, 0);
}

@end
