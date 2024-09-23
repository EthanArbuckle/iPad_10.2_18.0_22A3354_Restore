@implementation HUFirmwareUpdateItemModuleController

- (HUFirmwareUpdateItemModuleController)initWithModule:(id)a3 expandableTextViewCellDelegate:(id)a4
{
  id v6;
  HUFirmwareUpdateItemModuleController *v7;
  uint64_t v8;
  NSMapTable *expandedStateByItems;
  objc_super v11;

  v6 = a4;
  v11.receiver = self;
  v11.super_class = (Class)HUFirmwareUpdateItemModuleController;
  v7 = -[HUItemModuleController initWithModule:](&v11, sel_initWithModule_, a3);
  if (v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3748], "weakToStrongObjectsMapTable");
    v8 = objc_claimAutoreleasedReturnValue();
    expandedStateByItems = v7->_expandedStateByItems;
    v7->_expandedStateByItems = (NSMapTable *)v8;

    objc_storeWeak((id *)&v7->_expandableTextViewCellDelegate, v6);
  }

  return v7;
}

- (Class)cellClassForItem:(id)a3
{
  id v5;
  void *v6;
  char isKindOfClass;
  void *v8;
  void *v9;

  v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && (objc_msgSend(v5, "sourceItem"),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_opt_class(),
        isKindOfClass = objc_opt_isKindOfClass(),
        v6,
        (isKindOfClass & 1) != 0))
  {
    objc_opt_class();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HUFirmwareUpdateItemModuleController.m"), 46, CFSTR("Unknown item %@"), v5);

    v8 = 0;
  }

  return (Class)v8;
}

- (BOOL)canSelectItem:(id)a3
{
  return 0;
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
  objc_super v19;

  v6 = a3;
  v7 = a4;
  v19.receiver = self;
  v19.super_class = (Class)HUFirmwareUpdateItemModuleController;
  -[HUItemModuleController setupCell:forItem:](&v19, sel_setupCell_forItem_, v6, v7);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v8 = v6;
    -[HUFirmwareUpdateItemModuleController expandedStateByItems](self, "expandedStateByItems");
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

  }
}

- (void)updateCell:(id)a3 forItem:(id)a4 animated:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  void *v10;
  char isKindOfClass;
  id v12;
  void *v13;
  id v14;
  void *v15;
  objc_super v16;

  v5 = a5;
  v8 = a3;
  v9 = a4;
  v16.receiver = self;
  v16.super_class = (Class)HUFirmwareUpdateItemModuleController;
  -[HUItemModuleController updateCell:forItem:animated:](&v16, sel_updateCell_forItem_animated_, v8, v9, v5);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v9, "sourceItem");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) != 0)
    {
      objc_opt_class();
      v12 = v8;
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v13 = v12;
      else
        v13 = 0;
      v14 = v13;

      objc_msgSend(v14, "lockupView");
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v15, "setDelegate:", self);
    }
  }

}

- (void)lockupView:(id)a3 downloadControlTapped:(id)a4
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;

  objc_msgSend(a3, "item");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "latestResults");
  v11 = (id)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    v5 = objc_alloc(MEMORY[0x1E0D31178]);
    objc_msgSend(v11, "objectForKeyedSubscript:", *MEMORY[0x1E0D30D18]);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("HFResultApplicationBundleIdentifier"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("HFResultApplicationStoreURL"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v5, "initWithName:bundleID:payloadURL:storeURL:", v6, v7, 0, v8);

    v10 = (id)objc_msgSend(MEMORY[0x1E0D31178], "handleRequest:", v9);
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
  -[HUFirmwareUpdateItemModuleController expandedStateByItems](self, "expandedStateByItems");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "item");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "setObject:forKey:", MEMORY[0x1E0C9AAB0], v9);
  -[HUFirmwareUpdateItemModuleController expandableTextViewCellDelegate](self, "expandableTextViewCellDelegate");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "expandableTextViewCellStateDidChange:", v6);

}

- (HUExpandableTextViewCellDelegate)expandableTextViewCellDelegate
{
  return (HUExpandableTextViewCellDelegate *)objc_loadWeakRetained((id *)&self->_expandableTextViewCellDelegate);
}

- (void)setExpandableTextViewCellDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_expandableTextViewCellDelegate, a3);
}

- (NSMapTable)expandedStateByItems
{
  return self->_expandedStateByItems;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_expandedStateByItems, 0);
  objc_destroyWeak((id *)&self->_expandableTextViewCellDelegate);
}

@end
