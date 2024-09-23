@implementation HUMediaServiceDefaultAccountsItemModuleController

- (HUMediaServiceDefaultAccountsItemModuleController)initWithModule:(id)a3 delegate:(id)a4 host:(id)a5
{
  id v8;
  id v9;
  HUMediaServiceDefaultAccountsItemModuleController *v10;
  HUMediaServiceDefaultAccountsItemModuleController *v11;
  objc_super v13;

  v8 = a4;
  v9 = a5;
  v13.receiver = self;
  v13.super_class = (Class)HUMediaServiceDefaultAccountsItemModuleController;
  v10 = -[HUItemModuleController initWithModule:](&v13, sel_initWithModule_, a3);
  v11 = v10;
  if (v10)
  {
    objc_storeWeak((id *)&v10->_delegate, v8);
    objc_storeWeak((id *)&v11->_host, v9);
    v11->_selectedMediaServiceIndex = 0x7FFFFFFFFFFFFFFFLL;
    v11->_shouldClearSpinnerOnNextUpdate = 0;
  }

  return v11;
}

- (id)updateDefaultAccount:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  _QWORD v10[4];
  id v11;
  id v12;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  -[HUItemModuleController module](self, "module");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "updateDefaultAccount:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __74__HUMediaServiceDefaultAccountsItemModuleController_updateDefaultAccount___block_invoke;
  v10[3] = &unk_1E6F4DB40;
  objc_copyWeak(&v12, &location);
  v7 = v4;
  v11 = v7;
  objc_msgSend(v6, "addCompletionBlock:", v10);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);

  return v8;
}

void __74__HUMediaServiceDefaultAccountsItemModuleController_updateDefaultAccount___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  id WeakRetained;
  id v6;
  _QWORD block[4];
  id v8;
  id v9;
  id v10;

  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __74__HUMediaServiceDefaultAccountsItemModuleController_updateDefaultAccount___block_invoke_2;
  block[3] = &unk_1E6F4E020;
  v8 = v4;
  v9 = WeakRetained;
  v10 = *(id *)(a1 + 32);
  v6 = v4;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

void __74__HUMediaServiceDefaultAccountsItemModuleController_updateDefaultAccount___block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  char v5;
  id v6;

  v3 = *(_QWORD *)(a1 + 32);
  v2 = *(void **)(a1 + 40);
  if (v3)
  {
    objc_msgSend(v2, "_clearSpinner");
    objc_msgSend(MEMORY[0x1E0D313A0], "sharedHandler");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleError:", *(_QWORD *)(a1 + 32));
  }
  else
  {
    objc_msgSend(v2, "delegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_opt_respondsToSelector();

    if ((v5 & 1) == 0)
      return;
    objc_msgSend(*(id *)(a1 + 40), "setShouldClearSpinnerOnNextUpdate:", 1);
    objc_msgSend(*(id *)(a1 + 40), "delegate");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "mediaServiceDefaultAccountsItemModuleController:didUpdateDefaultAccount:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  }

}

- (Class)cellClassForItem:(id)a3
{
  return (Class)objc_opt_class();
}

- (void)updateCell:(id)a3 forItem:(id)a4 animated:(BOOL)a5
{
  id v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  id v21;

  v7 = a3;
  v8 = a4;
  if (-[HUMediaServiceDefaultAccountsItemModuleController shouldClearSpinnerOnNextUpdate](self, "shouldClearSpinnerOnNextUpdate"))
  {
    -[HUMediaServiceDefaultAccountsItemModuleController setShouldClearSpinnerOnNextUpdate:](self, "setShouldClearSpinnerOnNextUpdate:", 0);
    -[HUMediaServiceDefaultAccountsItemModuleController _clearSpinner](self, "_clearSpinner");
  }
  objc_opt_class();
  v21 = v7;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v9 = v21;
  else
    v9 = 0;
  v10 = v9;

  objc_msgSend(v8, "latestResults");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForKeyedSubscript:", *MEMORY[0x1E0D30D18]);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setTitleText:", v12);

  objc_msgSend(v8, "latestResults");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "objectForKeyedSubscript:", *MEMORY[0x1E0D30DA0]);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "BOOLValue");

  if (v15)
    v16 = 3;
  else
    v16 = 0;
  objc_msgSend(v10, "setAccessoryType:", v16);
  -[HUMediaServiceDefaultAccountsItemModuleController _indexPathForItem:](self, "_indexPathForItem:", v8);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v17;
  if (v17
    && (v19 = objc_msgSend(v17, "row") - 1,
        v19 == -[HUMediaServiceDefaultAccountsItemModuleController selectedMediaServiceIndex](self, "selectedMediaServiceIndex")))
  {
    v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA2C8]), "initWithActivityIndicatorStyle:", 100);
    objc_msgSend(v20, "startAnimating");
    objc_msgSend(v21, "setAccessoryView:", v20);

  }
  else
  {
    objc_msgSend(v21, "setAccessoryView:", 0);
  }

}

- (unint64_t)didSelectItem:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v4 = a3;
  -[HUItemModuleController module](self, "module");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "mediaServiceItemProvider");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "items");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "containsObject:", v4);

  if (v8)
  {
    objc_opt_class();
    v9 = v4;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v10 = v9;
    else
      v10 = 0;
    v11 = v10;

    if (v11)
    {
      -[HUMediaServiceDefaultAccountsItemModuleController _indexPathForItem:](self, "_indexPathForItem:", v9);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = v12;
      if (v12)
      {
        -[HUMediaServiceDefaultAccountsItemModuleController setSelectedMediaServiceIndex:](self, "setSelectedMediaServiceIndex:", objc_msgSend(v12, "row") - 1);
        objc_msgSend(v11, "mediaService");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = -[HUMediaServiceDefaultAccountsItemModuleController updateDefaultAccount:](self, "updateDefaultAccount:", v14);

      }
    }

  }
  return 0;
}

- (void)setSelectedMediaServiceIndex:(int64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  int64_t v8;
  int64_t selectedMediaServiceIndex;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;

  if (self->_selectedMediaServiceIndex != a3)
  {
    v18 = (id)objc_opt_new();
    -[HUItemModuleController module](self, "module");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "mediaServiceItemProvider");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "items");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "count");

    selectedMediaServiceIndex = self->_selectedMediaServiceIndex;
    if (selectedMediaServiceIndex != 0x7FFFFFFFFFFFFFFFLL && selectedMediaServiceIndex + 1 < v8)
    {
      objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForRow:inSection:");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "addObject:", v11);

    }
    if (a3 != 0x7FFFFFFFFFFFFFFFLL && a3 + 1 < v8)
    {
      objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForRow:inSection:");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "addObject:", v12);

    }
    self->_selectedMediaServiceIndex = a3;
    if (objc_msgSend(v18, "count"))
    {
      -[HUMediaServiceDefaultAccountsItemModuleController host](self, "host");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[HUItemModuleController module](self, "module");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "mediaServiceItemProvider");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "items");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "allObjects");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "updateCellForItems:", v17);

    }
  }
}

- (void)_clearSpinner
{
  -[HUMediaServiceDefaultAccountsItemModuleController setSelectedMediaServiceIndex:](self, "setSelectedMediaServiceIndex:", 0x7FFFFFFFFFFFFFFFLL);
}

- (id)_indexPathForItem:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;

  v4 = a3;
  -[HUMediaServiceDefaultAccountsItemModuleController host](self, "host");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "presentingViewControllerForModuleController:", self);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  v7 = v6;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v8 = v7;
  else
    v8 = 0;
  v9 = v8;

  if (v9)
  {
    objc_msgSend(v9, "itemManager");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "indexPathForItem:", v4);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (id)host
{
  return objc_loadWeakRetained((id *)&self->_host);
}

- (void)setHost:(id)a3
{
  objc_storeWeak((id *)&self->_host, a3);
}

- (HUMediaServiceDefaultAccountsItemModuleControllerDelegate)delegate
{
  return (HUMediaServiceDefaultAccountsItemModuleControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (int64_t)selectedMediaServiceIndex
{
  return self->_selectedMediaServiceIndex;
}

- (BOOL)shouldClearSpinnerOnNextUpdate
{
  return self->_shouldClearSpinnerOnNextUpdate;
}

- (void)setShouldClearSpinnerOnNextUpdate:(BOOL)a3
{
  self->_shouldClearSpinnerOnNextUpdate = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_host);
}

@end
