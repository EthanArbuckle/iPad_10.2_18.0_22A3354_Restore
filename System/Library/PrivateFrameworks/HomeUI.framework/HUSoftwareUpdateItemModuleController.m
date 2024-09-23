@implementation HUSoftwareUpdateItemModuleController

- (HUSoftwareUpdateItemModuleController)initWithModule:(id)a3
{
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_initWithModule_);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HUSoftwareUpdateItemModuleController.m"), 33, CFSTR("%s is unavailable; use %@ instead"),
    "-[HUSoftwareUpdateItemModuleController initWithModule:]",
    v6);

  return 0;
}

- (HUSoftwareUpdateItemModuleController)initWithModule:(id)a3 delegate:(id)a4 expandableTextViewCellDelegate:(id)a5
{
  id v8;
  id v9;
  HUSoftwareUpdateItemModuleController *v10;
  HUSoftwareUpdateItemModuleController *v11;
  uint64_t v12;
  NSMapTable *serviceGridViewControllersByItems;
  uint64_t v14;
  NSMapTable *expandedStateByItems;
  objc_super v17;

  v8 = a4;
  v9 = a5;
  v17.receiver = self;
  v17.super_class = (Class)HUSoftwareUpdateItemModuleController;
  v10 = -[HUItemModuleController initWithModule:](&v17, sel_initWithModule_, a3);
  v11 = v10;
  if (v10)
  {
    objc_storeWeak((id *)&v10->_delegate, v8);
    objc_storeWeak((id *)&v11->_expandableTextViewCellDelegate, v9);
    objc_msgSend(MEMORY[0x1E0CB3748], "weakToStrongObjectsMapTable");
    v12 = objc_claimAutoreleasedReturnValue();
    serviceGridViewControllersByItems = v11->_serviceGridViewControllersByItems;
    v11->_serviceGridViewControllersByItems = (NSMapTable *)v12;

    objc_msgSend(MEMORY[0x1E0CB3748], "weakToStrongObjectsMapTable");
    v14 = objc_claimAutoreleasedReturnValue();
    expandedStateByItems = v11->_expandedStateByItems;
    v11->_expandedStateByItems = (NSMapTable *)v14;

  }
  return v11;
}

- (Class)cellClassForItem:(id)a3
{
  id v5;
  void *v6;
  void *v7;

  v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_opt_class();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HUSoftwareUpdateItemModuleController.m"), 55, CFSTR("Unknown item %@"), v5);

    v6 = 0;
  }

  return (Class)v6;
}

- (void)setupCell:(id)a3 forItem:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  HUInformationalAccessoryGridViewController *v21;
  HUInformationalAccessoryGridViewController *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  objc_super v30;

  v6 = a3;
  v7 = a4;
  v30.receiver = self;
  v30.super_class = (Class)HUSoftwareUpdateItemModuleController;
  -[HUItemModuleController setupCell:forItem:](&v30, sel_setupCell_forItem_, v6, v7);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v8 = v6;
    -[HUSoftwareUpdateItemModuleController expandedStateByItems](self, "expandedStateByItems");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectForKey:", v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "BOOLValue");

    objc_msgSend(v8, "lockupView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "descriptionExpandableTextView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setDelegate:", 0);

    objc_msgSend(v8, "lockupView");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "descriptionExpandableTextView");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setExpanded:", v11);

    objc_msgSend(v8, "lockupView");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "lockupView");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "descriptionExpandableTextView");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setDelegate:", v16);

    -[HUSoftwareUpdateItemModuleController serviceGridViewControllersByItems](self, "serviceGridViewControllersByItems");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "objectForKey:", v7);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    v21 = v20;
    v22 = v21;
    if (!v21)
    {
      v22 = objc_alloc_init(HUInformationalAccessoryGridViewController);
      -[HUInformationalAccessoryGridViewController view](v22, "view");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

      -[HUInformationalAccessoryGridViewController collectionView](v22, "collectionView");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "setScrollEnabled:", 0);

      -[HUItemCollectionViewController setWantsPreferredContentSize:](v22, "setWantsPreferredContentSize:", 1);
      -[HUInformationalAccessoryGridViewController collectionView](v22, "collectionView");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "setClipsToBounds:", 1);

      -[HUSoftwareUpdateItemModuleController serviceGridViewControllersByItems](self, "serviceGridViewControllersByItems");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "setObject:forKey:", v22, v7);

    }
    objc_opt_class();
    objc_msgSend(v8, "lockupView");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v28 = v27;
    else
      v28 = 0;
    v29 = v28;

    objc_msgSend(v29, "setGridViewController:", v22);
  }

}

- (void)updateCell:(id)a3 forItem:(id)a4 animated:(BOOL)a5
{
  uint64_t v5;
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  objc_super v14;

  v5 = a5;
  v8 = a3;
  v14.receiver = self;
  v14.super_class = (Class)HUSoftwareUpdateItemModuleController;
  v9 = a4;
  -[HUItemModuleController updateCell:forItem:animated:](&v14, sel_updateCell_forItem_animated_, v8, v9, v5);
  objc_opt_class();
  LOBYTE(v5) = objc_opt_isKindOfClass();

  if ((v5 & 1) != 0)
  {
    objc_opt_class();
    v10 = v8;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v11 = v10;
    else
      v11 = 0;
    v12 = v11;

    objc_msgSend(v12, "lockupView", v14.receiver, v14.super_class);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setDelegate:", self);

  }
}

- (void)lockupView:(id)a3 downloadControlTapped:(id)a4
{
  void *v5;
  void *v6;
  id v7;
  void *v8;
  id v9;

  objc_msgSend(a3, "item");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v9 = v5;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v6 = v9;
  else
    v6 = 0;
  v7 = v6;

  if (v7)
  {
    objc_msgSend(v7, "accessories");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUSoftwareUpdateItemModuleController _startUpdateOnAccessories:](self, "_startUpdateOnAccessories:", v8);

  }
}

- (void)lockupView:(id)a3 expandableTextViewDidExpand:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;

  v6 = a4;
  v7 = a3;
  -[HUSoftwareUpdateItemModuleController expandedStateByItems](self, "expandedStateByItems");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "item");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "setObject:forKey:", MEMORY[0x1E0C9AAB0], v9);
  -[HUSoftwareUpdateItemModuleController expandableTextViewCellDelegate](self, "expandableTextViewCellDelegate");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "expandableTextViewCellStateDidChange:", v6);

}

- (BOOL)canSelectItem:(id)a3
{
  return 0;
}

- (void)updateAllAccessories
{
  void *v3;
  id v4;

  -[HUItemModuleController module](self, "module");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "accessories");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUSoftwareUpdateItemModuleController _startUpdateOnAccessories:](self, "_startUpdateOnAccessories:", v3);

}

- (void)_startUpdateOnAccessories:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;

  v10 = a3;
  if (objc_msgSend(v10, "count") == 1)
  {
    +[HUSoftwareUpdateUIManager sharedManager](HUSoftwareUpdateUIManager, "sharedManager");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "anyObject");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "startUpdateForAccessory:presentationDelegate:", v5, self);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_6:

    goto LABEL_7;
  }
  +[HUSoftwareUpdateUIManager sharedManager](HUSoftwareUpdateUIManager, "sharedManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v7;
  if (!v10)
  {
    -[HUItemModuleController module](self, "module");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "home");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "startUpdatesForAllAccessoriesInHome:presentationDelegate:", v8, self);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_6;
  }
  objc_msgSend(v7, "startUpdatesForAccessories:presentationDelegate:", v10, self);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_7:

  v9 = (id)objc_msgSend(v6, "addFailureBlock:", &__block_literal_global_218);
}

void __66__HUSoftwareUpdateItemModuleController__startUpdateOnAccessories___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v3 = a2;
  if ((objc_msgSend(v3, "na_isCancelledError") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0D313A0], "sharedHandler");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "handleError:", v3);

  }
}

- (id)softwareUpdateUIManager:(id)a3 presentViewController:(id)a4
{
  id v5;
  void *v6;
  void *v7;

  v5 = a4;
  -[HUSoftwareUpdateItemModuleController delegate](self, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "softwareUpdateModuleController:presentViewController:", self, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)softwareUpdateUIManager:(id)a3 dismissViewController:(id)a4
{
  id v5;
  void *v6;
  void *v7;

  v5 = a4;
  -[HUSoftwareUpdateItemModuleController delegate](self, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "softwareUpdateModuleController:dismissViewController:", self, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (HUSoftwareUpdateItemModuleControllerDelegate)delegate
{
  return (HUSoftwareUpdateItemModuleControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (HUExpandableTextViewCellDelegate)expandableTextViewCellDelegate
{
  return (HUExpandableTextViewCellDelegate *)objc_loadWeakRetained((id *)&self->_expandableTextViewCellDelegate);
}

- (NSMapTable)serviceGridViewControllersByItems
{
  return self->_serviceGridViewControllersByItems;
}

- (NSMapTable)expandedStateByItems
{
  return self->_expandedStateByItems;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_expandedStateByItems, 0);
  objc_storeStrong((id *)&self->_serviceGridViewControllersByItems, 0);
  objc_destroyWeak((id *)&self->_expandableTextViewCellDelegate);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
