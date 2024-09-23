@implementation _SFSettingsAlertController

- (_SFSettingsAlertController)initWithNibName:(id)a3 bundle:(id)a4
{
  _SFSettingsAlertController *v4;
  _SFSettingsAlertContentController *v5;
  uint64_t v6;
  UINavigationController *navigationController;
  _SFSettingsAlertController *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)_SFSettingsAlertController;
  v4 = -[_SFSettingsAlertController initWithNibName:bundle:](&v10, sel_initWithNibName_bundle_, a3, a4);
  if (v4)
  {
    v5 = objc_alloc_init(_SFSettingsAlertContentController);
    -[_SFSettingsAlertContentController setAlertController:](v5, "setAlertController:", v4);
    v6 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3A40]), "initWithRootViewController:", v5);
    navigationController = v4->_navigationController;
    v4->_navigationController = (UINavigationController *)v6;

    v8 = v4;
  }

  return v4;
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  objc_super v18;

  v18.receiver = self;
  v18.super_class = (Class)_SFSettingsAlertController;
  -[_SFSettingsAlertController viewDidLoad](&v18, sel_viewDidLoad);
  -[UINavigationController _setClipUnderlapWhileTransitioning:](self->_navigationController, "_setClipUnderlapWhileTransitioning:", 1);
  objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[UINavigationController navigationBar](self->_navigationController, "navigationBar");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTintColor:", v3);

  -[UINavigationController willMoveToParentViewController:](self->_navigationController, "willMoveToParentViewController:", self);
  -[_SFSettingsAlertController addChildViewController:](self, "addChildViewController:", self->_navigationController);
  -[_SFSettingsAlertController view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bounds");
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;
  -[UINavigationController view](self->_navigationController, "view");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setFrame:", v7, v9, v11, v13);

  -[UINavigationController view](self->_navigationController, "view");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setAutoresizingMask:", 18);

  -[_SFSettingsAlertController view](self, "view");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[UINavigationController view](self->_navigationController, "view");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "addSubview:", v17);

}

- (_SFSettingsAlertContentController)_rootContentController
{
  void *v2;
  void *v3;

  -[UINavigationController viewControllers](self->_navigationController, "viewControllers");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "firstObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (_SFSettingsAlertContentController *)v3;
}

- (id)presentingViewController
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  objc_super v8;

  -[_SFSettingsAlertController delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "presentingViewControllerForAlertController:", self);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v5 = v4;
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)_SFSettingsAlertController;
    -[_SFSettingsAlertController presentingViewController](&v8, sel_presentingViewController);
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;

  return v6;
}

- (void)setUsesReverseOrder:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  if (self->_usesReverseOrder != a3)
  {
    v3 = a3;
    self->_usesReverseOrder = a3;
    -[_SFSettingsAlertController _rootContentController](self, "_rootContentController");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setUsesReverseOrder:", v3);

  }
}

- (void)addItem:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[_SFSettingsAlertController _rootContentController](self, "_rootContentController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addItem:", v4);

  -[_SFSettingsAlertController delegate](self, "delegate");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "alertController:didAddItem:", self, v4);

}

- (void)addDivider
{
  void *v3;
  id v4;

  -[_SFSettingsAlertController _rootContentController](self, "_rootContentController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addDivider");

  -[_SFSettingsAlertController delegate](self, "delegate");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "alertControllerDidAddDivider:", self);

}

- (_SFSettingsAlertItem)focusedItem
{
  void *v2;
  void *v3;

  -[_SFSettingsAlertController _rootContentController](self, "_rootContentController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "focusedItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (_SFSettingsAlertItem *)v3;
}

- (void)setFocusedItem:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[_SFSettingsAlertController _rootContentController](self, "_rootContentController");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setFocusedItem:", v4);

}

- (void)removeAllItems
{
  void *v3;
  id v4;

  -[_SFSettingsAlertController _rootContentController](self, "_rootContentController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeAllItems");

  -[_SFSettingsAlertController delegate](self, "delegate");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "alertControllerResetSections:", self);

}

- (void)resizeMenu
{
  id v2;

  -[_SFSettingsAlertController _rootContentController](self, "_rootContentController");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "resizeMenu");

}

- (NSArray)items
{
  void *v2;
  void *v3;

  -[_SFSettingsAlertController _rootContentController](self, "_rootContentController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "items");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (void)_pushSubItemsForGroup:(id)a3
{
  id v4;
  _SFSettingsAlertContentController *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_alloc_init(_SFSettingsAlertContentController);
  objc_msgSend(v4, "title");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[_SFSettingsAlertContentController navigationItem](v5, "navigationItem");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setTitle:", v6);

  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  objc_msgSend(v4, "subItems", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v14;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v14 != v11)
          objc_enumerationMutation(v8);
        -[_SFSettingsAlertContentController addItem:](v5, "addItem:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v12++));
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v10);
  }

  -[UINavigationController pushViewController:animated:](self->_navigationController, "pushViewController:animated:", v5, objc_msgSend(MEMORY[0x1E0DC3F10], "areAnimationsEnabled"));
}

- (void)pushViewController:(id)a3
{
  void *v4;
  id v5;
  uint64_t v6;
  UINavigationController *navigationController;
  id v8;
  id v9;

  v4 = (void *)MEMORY[0x1E0DC3F10];
  v5 = a3;
  v6 = objc_msgSend(v4, "areAnimationsEnabled");
  -[UINavigationController pushViewController:animated:](self->_navigationController, "pushViewController:animated:", v5, v6);
  navigationController = self->_navigationController;
  -[UINavigationController viewControllers](navigationController, "viewControllers");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "firstObject");
  v8 = (id)objc_claimAutoreleasedReturnValue();

  -[UINavigationController setNavigationBarHidden:animated:](navigationController, "setNavigationBarHidden:animated:", v8 == v5, v6);
}

- (void)setPreferredContentSize:(CGSize)a3
{
  objc_super v4;

  -[UINavigationController _adjustedContentSizeForPopover:](self->_navigationController, "_adjustedContentSizeForPopover:", a3.width, a3.height);
  v4.receiver = self;
  v4.super_class = (Class)_SFSettingsAlertController;
  -[_SFSettingsAlertController setPreferredContentSize:](&v4, sel_setPreferredContentSize_);
}

- (_SFPopoverSourceInfo)safari_popoverSourceInfo
{
  void *v3;
  void *v4;

  -[_SFSettingsAlertController delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "popoverSourceInfoForAlertController:", self);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (_SFPopoverSourceInfo *)v4;
}

- (_SFSettingsAlertControllerDelegate)delegate
{
  return (_SFSettingsAlertControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (int64_t)provenance
{
  return self->_provenance;
}

- (void)setProvenance:(int64_t)a3
{
  self->_provenance = a3;
}

- (BOOL)usesReverseOrder
{
  return self->_usesReverseOrder;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_navigationController, 0);
}

@end
