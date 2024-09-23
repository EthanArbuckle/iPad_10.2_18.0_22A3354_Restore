@implementation HUNetworkConfigurationItemListModuleController

- (HUNetworkConfigurationItemListModuleController)initWithModule:(id)a3 style:(unint64_t)a4
{
  HUNetworkConfigurationItemListModuleController *result;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)HUNetworkConfigurationItemListModuleController;
  result = -[HUItemModuleController initWithModule:](&v6, sel_initWithModule_, a3);
  if (result)
    result->_style = a4;
  return result;
}

- (HUNetworkConfigurationItemListModuleController)initWithModule:(id)a3
{
  return -[HUNetworkConfigurationItemListModuleController initWithModule:style:](self, "initWithModule:style:", a3, 0);
}

- (id)presentNetworkConfigurationSettingsForItem:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  int v8;
  uint64_t v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;

  v4 = a4;
  v6 = a3;
  -[HUItemModuleController module](self, "module");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isItemNetworkConfigurationGroupItem:", v6);

  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0D519C0], "futureWithNoResult");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_11;
  }
  v9 = objc_opt_class();
  v10 = (id)objc_msgSend(v6, "copy");
  if (v10)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v11 = v10;
    else
      v11 = 0;
    v12 = v10;
    if (v11)
      goto LABEL_9;
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "id  _Nullable NAAssertCast(Class  _Nonnull __unsafe_unretained, id  _Nonnull __strong)");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInFunction:file:lineNumber:description:", v14, CFSTR("NSObject+NAAdditions.h"), 54, CFSTR("Expected class of %@ but was %@"), v9, objc_opt_class());

  }
  v12 = 0;
LABEL_9:

  -[HUNetworkConfigurationItemListModuleController _viewControllerToPresentForNetworkConfigurationGroupItem:](self, "_viewControllerToPresentForNetworkConfigurationGroupItem:", v12);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  +[HUViewControllerPresentationRequest requestWithViewController:](HUViewControllerPresentationRequest, "requestWithViewController:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v16, "setPreferredPresentationType:", 1);
  objc_msgSend(v16, "setAnimated:", v4);
  -[HUItemModuleController host](self, "host");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "moduleController:presentViewControllerForRequest:", self, v16);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_11:
  return v18;
}

- (Class)cellClassForItem:(id)a3
{
  id v4;
  void *v5;
  int v6;
  void *v7;

  v4 = a3;
  -[HUItemModuleController module](self, "module");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isItemNetworkConfigurationGroupItem:", v4);

  if (v6)
  {
    objc_opt_class();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = 0;
  }
  return (Class)v7;
}

- (void)setupCell:(id)a3 forItem:(id)a4
{
  id v6;
  id v7;
  void *v8;
  int v9;
  uint64_t v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  objc_super v17;

  v6 = a3;
  v17.receiver = self;
  v17.super_class = (Class)HUNetworkConfigurationItemListModuleController;
  v7 = a4;
  -[HUItemModuleController setupCell:forItem:](&v17, sel_setupCell_forItem_, v6, v7);
  -[HUItemModuleController module](self, "module");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isItemNetworkConfigurationGroupItem:", v7);

  if (v9)
  {
    v10 = objc_opt_class();
    v11 = v6;
    if (v11)
    {
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v12 = v11;
      else
        v12 = 0;
      v13 = v11;
      if (v12)
        goto LABEL_9;
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "id  _Nullable NAAssertCast(Class  _Nonnull __unsafe_unretained, id  _Nonnull __strong)");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "handleFailureInFunction:file:lineNumber:description:", v15, CFSTR("NSObject+NAAdditions.h"), 54, CFSTR("Expected class of %@ but was %@"), v10, objc_opt_class(), v17.receiver, v17.super_class);

    }
    v13 = 0;
LABEL_9:

    objc_msgSend(v13, "setAccessoryType:", 1);
    +[HUIconCellContentMetrics compactMetrics](HUIconCellContentMetrics, "compactMetrics");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setContentMetrics:", v16);

    objc_msgSend(v13, "setHideIcon:", 1);
  }

}

- (void)updateCell:(id)a3 forItem:(id)a4 animated:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  objc_super v27;

  v5 = a5;
  v8 = a3;
  v9 = a4;
  v27.receiver = self;
  v27.super_class = (Class)HUNetworkConfigurationItemListModuleController;
  -[HUItemModuleController updateCell:forItem:animated:](&v27, sel_updateCell_forItem_animated_, v8, v9, v5);
  -[HUItemModuleController module](self, "module");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(self) = objc_msgSend(v10, "isItemNetworkConfigurationGroupItem:", v9);

  if (!(_DWORD)self)
    goto LABEL_20;
  v11 = objc_opt_class();
  v12 = v8;
  if (!v12)
    goto LABEL_8;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v13 = v12;
  else
    v13 = 0;
  v14 = v12;
  if (!v13)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "id  _Nullable NAAssertCast(Class  _Nonnull __unsafe_unretained, id  _Nonnull __strong)");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInFunction:file:lineNumber:description:", v16, CFSTR("NSObject+NAAdditions.h"), 54, CFSTR("Expected class of %@ but was %@"), v11, objc_opt_class());

LABEL_8:
    v14 = 0;
  }

  v17 = objc_opt_class();
  v18 = v9;
  if (v18)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v19 = v18;
    else
      v19 = 0;
    v20 = v18;
    if (v19)
      goto LABEL_16;
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "id  _Nullable NAAssertCast(Class  _Nonnull __unsafe_unretained, id  _Nonnull __strong)");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "handleFailureInFunction:file:lineNumber:description:", v22, CFSTR("NSObject+NAAdditions.h"), 54, CFSTR("Expected class of %@ but was %@"), v17, objc_opt_class());

  }
  v20 = 0;
LABEL_16:

  objc_msgSend(v20, "latestResults");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "objectForKeyedSubscript:", *MEMORY[0x1E0D30DF0]);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v24, "BOOLValue"))
  {
    objc_msgSend(v14, "setDisabled:", 1);
  }
  else
  {
    objc_msgSend(v20, "latestResults");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "objectForKeyedSubscript:", *MEMORY[0x1E0D30E08]);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setDisabled:", objc_msgSend(v26, "BOOLValue"));

  }
LABEL_20:

}

- (BOOL)canSelectItem:(id)a3
{
  id v4;
  void *v5;
  char v6;

  v4 = a3;
  -[HUItemModuleController module](self, "module");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isItemNetworkConfigurationGroupItem:", v4);

  return v6;
}

- (unint64_t)didSelectItem:(id)a3
{
  id v4;
  void *v5;
  int v6;
  id v7;

  v4 = a3;
  -[HUItemModuleController module](self, "module");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isItemNetworkConfigurationGroupItem:", v4);

  if (v6)
    v7 = -[HUNetworkConfigurationItemListModuleController presentNetworkConfigurationSettingsForItem:animated:](self, "presentNetworkConfigurationSettingsForItem:animated:", v4, 1);

  return 0;
}

- (id)_viewControllerToPresentForNetworkConfigurationGroupItem:(id)a3
{
  id v4;

  v4 = a3;
  if (-[HUNetworkConfigurationItemListModuleController style](self, "style"))
    NSLog(CFSTR("Invalid style %lu"), -[HUNetworkConfigurationItemListModuleController style](self, "style"));
  else
    self = -[HUNetworkConfigurationSettingsViewController initWithNetworkConfigurationGroupItem:]([HUNetworkConfigurationSettingsViewController alloc], "initWithNetworkConfigurationGroupItem:", v4);

  return self;
}

- (unint64_t)style
{
  return self->_style;
}

@end
