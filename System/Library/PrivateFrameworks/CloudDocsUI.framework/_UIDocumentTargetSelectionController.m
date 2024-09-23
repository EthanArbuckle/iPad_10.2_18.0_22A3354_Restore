@implementation _UIDocumentTargetSelectionController

- (_UIDocumentTargetSelectionController)initWithNibName:(id)a3 bundle:(id)a4
{
  return -[_UIDocumentTargetSelectionController initWithItemsToMove:](self, "initWithItemsToMove:", MEMORY[0x24BDBD1A8], a4);
}

- (_UIDocumentTargetSelectionController)initWithCoder:(id)a3
{
  return -[_UIDocumentTargetSelectionController initWithItemsToMove:](self, "initWithItemsToMove:", MEMORY[0x24BDBD1A8]);
}

- (void)_commonInitItems:(id)a3 crossContainer:(BOOL)a4 sourceContainer:(id)a5
{
  _BOOL4 v6;
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t i;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  id v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t k;
  id v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t j;
  _UIDocumentPickerAllContainersModel *v33;
  void *v34;
  _UIDocumentPickerAllContainersModel *v35;
  void *v36;
  NSString *v37;
  NSString *containerName;
  _UIDocumentPickerSubfoldersContainerModel *v39;
  void *v40;
  _UIDocumentPickerContainerViewController *v41;
  id v42;
  id v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  id v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  uint64_t v57;
  _BYTE v58[128];
  id v59;
  _BYTE v60[128];
  _BYTE v61[128];
  uint64_t v62;

  v6 = a4;
  v62 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a5;
  -[_UIDocumentTargetSelectionController setEdgesForExtendedLayout:](self, "setEdgesForExtendedLayout:", 0);
  if (v6)
  {
    v42 = v9;
    v43 = v8;
    v55 = 0u;
    v56 = 0u;
    v53 = 0u;
    v54 = 0u;
    v10 = v8;
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v53, v61, 16);
    if (v11)
    {
      v12 = v11;
      v13 = 0;
      v14 = *(_QWORD *)v54;
      v15 = *MEMORY[0x24BDBCCF0];
      v16 = (void *)*MEMORY[0x24BDC17B8];
      do
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v54 != v14)
            objc_enumerationMutation(v10);
          v18 = *(void **)(*((_QWORD *)&v53 + 1) + 8 * i);
          v52 = 0;
          objc_msgSend(v18, "getPromisedItemResourceValue:forKey:error:", &v52, v15, 0, v42, v43);
          v19 = v52;
          v20 = v19;
          if (v13)
            v21 = v13;
          else
            v21 = v19;
          v22 = v21;

          if ((objc_msgSend(v20, "isEqual:", v22) & 1) != 0)
          {
            v13 = v22;
          }
          else
          {
            v13 = v16;

          }
        }
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v53, v61, 16);
      }
      while (v12);
    }
    else
    {
      v13 = 0;
    }

    v9 = v42;
    v8 = v43;
    if (v42)
    {
      v50 = 0u;
      v51 = 0u;
      v48 = 0u;
      v49 = 0u;
      v28 = v10;
      v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v48, v60, 16);
      if (v29)
      {
        v30 = v29;
        v31 = *(_QWORD *)v49;
        do
        {
          for (j = 0; j != v30; ++j)
          {
            if (*(_QWORD *)v49 != v31)
              objc_enumerationMutation(v28);
            objc_msgSend(*(id *)(*((_QWORD *)&v48 + 1) + 8 * j), "br_cloudDocsContainer", v42, v43);

          }
          v30 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v48, v60, 16);
        }
        while (v30);
      }

    }
    v33 = [_UIDocumentPickerAllContainersModel alloc];
    v59 = v13;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v59, 1);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = -[_UIDocumentPickerAllContainersModel initWithFoldersForPickableTypes:mode:sourceContainer:](v33, "initWithFoldersForPickableTypes:mode:sourceContainer:", v34, 3, v9);
  }
  else
  {
    v46 = 0u;
    v47 = 0u;
    v44 = 0u;
    v45 = 0u;
    v23 = v8;
    v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v44, v58, 16);
    if (v24)
    {
      v25 = v24;
      v13 = 0;
      v26 = *(_QWORD *)v45;
      do
      {
        for (k = 0; k != v25; ++k)
        {
          if (*(_QWORD *)v45 != v26)
            objc_enumerationMutation(v23);
          if (!v13)
          {
            objc_msgSend(*(id *)(*((_QWORD *)&v44 + 1) + 8 * k), "br_containerID");
            v13 = (id)objc_claimAutoreleasedReturnValue();
          }
        }
        v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v44, v58, 16);
      }
      while (v25);
    }
    else
    {
      v13 = 0;
    }

    objc_msgSend(MEMORY[0x24BE175F8], "allContainersByContainerID");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "objectForKey:", v13);
    v34 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v34, "localizedName");
    v37 = (NSString *)objc_claimAutoreleasedReturnValue();
    containerName = self->_containerName;
    self->_containerName = v37;

    v39 = [_UIDocumentPickerSubfoldersContainerModel alloc];
    v57 = *MEMORY[0x24BDC1770];
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v57, 1);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = -[_UIDocumentPickerSubfoldersContainerModel initWithPickableTypes:container:](v39, "initWithPickableTypes:container:", v40, v13);

  }
  -[_UIDocumentPickerAllContainersModel startMonitoringChanges](v35, "startMonitoringChanges");
  v41 = -[_UIDocumentPickerContainerViewController initWithModel:]([_UIDocumentPickerContainerViewController alloc], "initWithModel:", v35);
  -[_UIDocumentPickerContainerViewController setExplicitDisplayMode:](v41, "setExplicitDisplayMode:", 3);
  -[_UIDocumentTargetSelectionController _setContainerViewController:](self, "_setContainerViewController:", v41);
  -[_UIDocumentTargetSelectionController setItemsToMove:](self, "setItemsToMove:", v8);

}

- (_UIDocumentTargetSelectionController)initWithItemsToMove:(id)a3
{
  id v4;
  _UIDocumentTargetSelectionController *v5;
  _UIDocumentTargetSelectionController *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)_UIDocumentTargetSelectionController;
  v5 = -[_UIDocumentTargetSelectionController initWithNibName:bundle:](&v8, sel_initWithNibName_bundle_, 0, 0);
  v6 = v5;
  if (v5)
  {
    -[_UIDocumentTargetSelectionController _commonInitItems:crossContainer:sourceContainer:](v5, "_commonInitItems:crossContainer:sourceContainer:", v4, 0, 0);
    v6->_targetSelectionType = 1;
  }

  return v6;
}

- (id)initForCrossContainerMoveWithItemsToMove:(id)a3
{
  id v4;
  _UIDocumentTargetSelectionController *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  int v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  id v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  objc_super v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v25.receiver = self;
  v25.super_class = (Class)_UIDocumentTargetSelectionController;
  v5 = -[_UIDocumentTargetSelectionController initWithNibName:bundle:](&v25, sel_initWithNibName_bundle_, 0, 0);
  if (v5)
  {
    v23 = 0u;
    v24 = 0u;
    v21 = 0u;
    v22 = 0u;
    v6 = v4;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v22;
      v10 = *MEMORY[0x24BDBCD20];
      v11 = *MEMORY[0x24BDBCD10];
      while (2)
      {
        v12 = 0;
        do
        {
          if (*(_QWORD *)v22 != v9)
            objc_enumerationMutation(v6);
          v13 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * v12);
          v20 = 0;
          v14 = objc_msgSend(v13, "getPromisedItemResourceValue:forKey:error:", &v20, v10, 0);
          v15 = v20;
          v16 = v15;
          if (v14 && (objc_msgSend(v15, "isEqualToString:", v11) & 1) == 0)
          {

            objc_msgSend(v6, "firstObject");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v18, "br_cloudDocsContainer");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            goto LABEL_13;
          }

          ++v12;
        }
        while (v8 != v12);
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
        if (v8)
          continue;
        break;
      }
    }
    v17 = 0;
    v18 = v6;
LABEL_13:

    -[_UIDocumentTargetSelectionController _commonInitItems:crossContainer:sourceContainer:](v5, "_commonInitItems:crossContainer:sourceContainer:", v6, 1, v17);
    v5->_targetSelectionType = 1;

  }
  return v5;
}

- (id)initForCopyWithItems:(id)a3
{
  id v4;
  _UIDocumentTargetSelectionController *v5;
  _UIDocumentTargetSelectionController *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)_UIDocumentTargetSelectionController;
  v5 = -[_UIDocumentTargetSelectionController initWithNibName:bundle:](&v8, sel_initWithNibName_bundle_, 0, 0);
  v6 = v5;
  if (v5)
  {
    -[_UIDocumentTargetSelectionController _commonInitItems:crossContainer:sourceContainer:](v5, "_commonInitItems:crossContainer:sourceContainer:", v4, 1, 0);
    v6->_targetSelectionType = 2;
  }

  return v6;
}

- (void)invalidate
{
  -[_UIDocumentPickerContainerViewController invalidate](self->_containerViewController, "invalidate");
}

- (id)navControllerForPalette
{
  UINavigationController *containedNavigationController;

  containedNavigationController = self->_containedNavigationController;
  if (containedNavigationController)
    return containedNavigationController;
  -[_UIDocumentTargetSelectionController navigationController](self, "navigationController");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)_setupNavigationItem
{
  _UIDocumentTargetSelectionController *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  unint64_t targetSelectionType;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  _QWORD v19[2];

  v2 = self;
  v19[1] = *MEMORY[0x24BDAC8D0];
  if (self->_containedNavigationController)
    self = (_UIDocumentTargetSelectionController *)self->_containerViewController;
  -[_UIDocumentTargetSelectionController navigationItem](self, "navigationItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "rightBarButtonItems");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  if (!v5)
  {
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6860]), "initWithBarButtonSystemItem:target:action:", 1, v2, sel_dismiss_);
    v19[0] = v6;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v19, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setRightBarButtonItems:", v7);

  }
  if (v2->_containerName)
  {
    objc_msgSend(v3, "setTitle:");
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1488], "bundleWithIdentifier:", CFSTR("com.apple.CloudDocsUI"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("iCloud Drive"), CFSTR("iCloud Drive"), CFSTR("Localizable"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setTitle:", v9);

  }
  targetSelectionType = v2->_targetSelectionType;
  switch(targetSelectionType)
  {
    case 2uLL:
      goto LABEL_13;
    case 1uLL:
LABEL_12:
      v11 = (void *)MEMORY[0x24BDD17C8];
      objc_msgSend(MEMORY[0x24BDD1488], "bundleWithIdentifier:", CFSTR("com.apple.CloudDocsUI"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("Choose a new location to move these items."), CFSTR("Choose a new location to move these items."), CFSTR("Localizable"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "localizedStringWithFormat:", v13, -[NSArray count](v2->_itemsToMove, "count"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setPrompt:", v14);

LABEL_13:
      v15 = (void *)MEMORY[0x24BDD17C8];
      objc_msgSend(MEMORY[0x24BDD1488], "bundleWithIdentifier:", CFSTR("com.apple.CloudDocsUI"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "localizedStringForKey:value:table:", CFSTR("Choose a location to add these items."), CFSTR("Choose a location to add these items."), CFSTR("Localizable"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "localizedStringWithFormat:", v17, -[NSArray count](v2->_itemsToMove, "count"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setPrompt:", v18);

      break;
    case 0uLL:
      objc_msgSend(v3, "setPrompt:", 0);
      goto LABEL_12;
  }

}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  char isKindOfClass;
  UINavigationController **p_containedNavigationController;
  UINavigationController *containedNavigationController;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *containerViewController;
  UINavigationController *v13;
  UINavigationController *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  _QWORD v19[5];
  objc_super v20;

  self->_completedInitialDisplay = 1;
  v20.receiver = self;
  v20.super_class = (Class)_UIDocumentTargetSelectionController;
  -[_UIDocumentTargetSelectionController viewWillAppear:](&v20, sel_viewWillAppear_, a3);
  -[_UIDocumentTargetSelectionController parentViewController](self, "parentViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    p_containedNavigationController = &self->_containedNavigationController;
    containedNavigationController = self->_containedNavigationController;
    self->_containedNavigationController = 0;

    -[_UIDocumentPickerContainerViewController view](self->_containerViewController, "view");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIDocumentTargetSelectionController view](self, "view");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "bounds");
    objc_msgSend(v8, "setFrame:");

    -[_UIDocumentTargetSelectionController addChildViewController:](self, "addChildViewController:", self->_containerViewController);
    -[_UIDocumentPickerContainerViewController view](self->_containerViewController, "view");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setAutoresizingMask:", 18);

    -[_UIDocumentPickerContainerViewController setServiceViewController:](self->_containerViewController, "setServiceViewController:", self);
    -[_UIDocumentTargetSelectionController view](self, "view");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    containerViewController = self->_containerViewController;
  }
  else
  {
    v13 = (UINavigationController *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6BF8]), "initWithRootViewController:", self->_containerViewController);
    p_containedNavigationController = &self->_containedNavigationController;
    v14 = self->_containedNavigationController;
    self->_containedNavigationController = v13;

    -[UINavigationController view](self->_containedNavigationController, "view");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIDocumentTargetSelectionController view](self, "view");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "bounds");
    objc_msgSend(v15, "setFrame:");

    -[_UIDocumentTargetSelectionController addChildViewController:](self, "addChildViewController:", self->_containedNavigationController);
    -[UINavigationController view](self->_containedNavigationController, "view");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setAutoresizingMask:", 18);

    -[_UIDocumentPickerContainerViewController setServiceViewController:](self->_containerViewController, "setServiceViewController:", self);
    -[_UIDocumentTargetSelectionController view](self, "view");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    containerViewController = self->_containedNavigationController;
  }
  objc_msgSend(containerViewController, "view");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addSubview:", v18);

  -[UINavigationController didMoveToParentViewController:](*p_containedNavigationController, "didMoveToParentViewController:", self);
  v19[0] = MEMORY[0x24BDAC760];
  v19[1] = 3221225472;
  v19[2] = __55___UIDocumentTargetSelectionController_viewWillAppear___block_invoke;
  v19[3] = &unk_24E43A808;
  v19[4] = self;
  objc_msgSend(MEMORY[0x24BDF6F90], "performWithoutAnimation:", v19);
}

- (void)viewDidDisappear:(BOOL)a3
{
  void *v4;
  _UINavigationControllerPalette *palette;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_UIDocumentTargetSelectionController;
  -[_UIDocumentTargetSelectionController viewDidDisappear:](&v6, sel_viewDidDisappear_, a3);
  -[_UINavigationControllerPalette navController](self->_palette, "navController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "detachPalette:", self->_palette);

  palette = self->_palette;
  self->_palette = 0;

}

- (void)_setupPalette
{
  _UINavigationControllerPalette *palette;
  void *v4;
  _UINavigationControllerPalette *v5;
  void *v6;
  void *v7;
  double v8;
  _UINavigationControllerPalette *v9;
  _UINavigationControllerPalette *v10;
  UIImageView *v11;
  UIImageView *iconView;
  void *v13;
  void *v14;
  UILabel *v15;
  UILabel *filesLabel;
  void *v17;
  void *v18;
  double v19;
  void *v20;
  double v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  _QWORD v43[9];

  v43[7] = *MEMORY[0x24BDAC8D0];
  palette = self->_palette;
  if (palette)
  {
    -[_UINavigationControllerPalette navController](palette, "navController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "detachPalette:", self->_palette);

    v5 = self->_palette;
    self->_palette = 0;

  }
  -[_UIDocumentTargetSelectionController navControllerForPalette](self, "navControllerForPalette");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "bounds");
  v42 = v6;
  objc_msgSend(v6, "paletteForEdge:size:", 2, v8, 72.0);
  v9 = (_UINavigationControllerPalette *)objc_claimAutoreleasedReturnValue();
  v10 = self->_palette;
  self->_palette = v9;

  -[_UINavigationControllerPalette setPinningBarShadowIsHidden:](self->_palette, "setPinningBarShadowIsHidden:", 1);
  objc_msgSend(v6, "attachPalette:isPinned:", self->_palette, 1);
  v11 = (UIImageView *)objc_alloc_init(MEMORY[0x24BDF6AE8]);
  iconView = self->_iconView;
  self->_iconView = v11;

  -[NSArray firstObject](self->_itemsToMove, "firstObject");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "ui_resolveOnDiskBookmarkAndPromise");
  v41 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend((id)objc_opt_class(), "_loadDocumentIconForURL:size:", v41, 44.0, 44.0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIDocumentTargetSelectionController _setIconViewImage:border:](self, "_setIconViewImage:border:", v14, 0);

  v15 = (UILabel *)objc_alloc_init(MEMORY[0x24BDF6B68]);
  filesLabel = self->_filesLabel;
  self->_filesLabel = v15;

  -[UIImageView setTranslatesAutoresizingMaskIntoConstraints:](self->_iconView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](self->_filesLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[_UINavigationControllerPalette addSubview:](self->_palette, "addSubview:", self->_iconView);
  -[_UINavigationControllerPalette addSubview:](self->_palette, "addSubview:", self->_filesLabel);
  -[UIImageView widthAnchor](self->_iconView, "widthAnchor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "constraintEqualToConstant:", 0.0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v19) = 1111752704;
  v40 = v18;
  objc_msgSend(v18, "setPriority:", v19);
  -[UIImageView widthAnchor](self->_iconView, "widthAnchor");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "constraintEqualToConstant:", 0.0);
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v21) = 1113325568;
  objc_msgSend(v32, "setPriority:", v21);
  v33 = (void *)MEMORY[0x24BDD1628];
  v43[0] = v18;
  -[UIImageView leadingAnchor](self->_iconView, "leadingAnchor");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UINavigationControllerPalette leadingAnchor](self->_palette, "leadingAnchor");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "constraintEqualToAnchor:constant:", v38, 17.0);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v43[1] = v37;
  -[UILabel leadingAnchor](self->_filesLabel, "leadingAnchor");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIImageView trailingAnchor](self->_iconView, "trailingAnchor");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "constraintEqualToAnchor:constant:", v35, 12.0);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v43[2] = v34;
  -[_UINavigationControllerPalette trailingAnchor](self->_palette, "trailingAnchor");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel trailingAnchor](self->_filesLabel, "trailingAnchor");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "constraintGreaterThanOrEqualToAnchor:constant:", v22, 17.0);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v43[3] = v23;
  -[UIImageView centerYAnchor](self->_iconView, "centerYAnchor");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UINavigationControllerPalette centerYAnchor](self->_palette, "centerYAnchor");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "constraintEqualToAnchor:", v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v43[4] = v26;
  -[UILabel centerYAnchor](self->_filesLabel, "centerYAnchor");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UINavigationControllerPalette centerYAnchor](self->_palette, "centerYAnchor");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "constraintEqualToAnchor:", v28);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v43[5] = v29;
  v43[6] = v32;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v43, 7);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "activateConstraints:", v30);

}

- (void)_setContainerViewController:(id)a3
{
  _UIDocumentPickerContainerViewController **p_containerViewController;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;

  p_containerViewController = &self->_containerViewController;
  objc_storeStrong((id *)&self->_containerViewController, a3);
  v6 = a3;
  -[_UIDocumentTargetSelectionController navigationController](self, "navigationController");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "semanticContentAttribute");
  -[_UIDocumentPickerContainerViewController view](*p_containerViewController, "view");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "setSemanticContentAttribute:", v8);
}

- (int)sortOrder
{
  return 1;
}

- (int64_t)displayMode
{
  return 3;
}

- (id)pickableTypes
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x24BDAC8D0];
  v3[0] = *MEMORY[0x24BDC17B8];
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v3, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (unint64_t)pickerMode
{
  return 3;
}

- (void)didSelectItem:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  if (objc_msgSend(v6, "type") == 1 || objc_msgSend(v6, "type") == 2)
  {
    -[_UIDocumentTargetSelectionController delegate](self, "delegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "url");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "documentTargetSelectionController:didSelectItemAtURL:", self, v5);

  }
}

- (void)dismiss:(id)a3
{
  void *v4;
  _QWORD v5[5];

  -[_UIDocumentTargetSelectionController presentingViewController](self, "presentingViewController", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __48___UIDocumentTargetSelectionController_dismiss___block_invoke;
  v5[3] = &unk_24E43A808;
  v5[4] = self;
  objc_msgSend(v4, "dismissViewControllerAnimated:completion:", 1, v5);

}

- (void)_updatePalette
{
  void *v3;
  double v4;
  double v5;
  uint64_t v6;
  void (**v7)(_QWORD, _QWORD);
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  NSUInteger v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  void *v34;
  id firstFileThumbnailObservation;
  uint64_t v36;
  _QWORD v37[4];
  id v38;
  id v39;
  int64x2_t v40;
  uint64_t v41;
  id location;
  _QWORD v43[7];

  -[_UIDocumentTargetSelectionController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4 + -44.0 + -34.0 + -12.0;

  v6 = MEMORY[0x24BDAC760];
  v43[0] = MEMORY[0x24BDAC760];
  v43[1] = 3221225472;
  v43[2] = __54___UIDocumentTargetSelectionController__updatePalette__block_invoke_2;
  v43[3] = &unk_24E43AF98;
  v43[4] = self;
  *(double *)&v43[5] = v5;
  v7 = (void (**)(_QWORD, _QWORD))MEMORY[0x2207C9E60](v43);
  -[UILabel setLineBreakMode:](self->_filesLabel, "setLineBreakMode:", 4);
  if (-[NSArray count](self->_itemsToMove, "count") < 2)
  {
    -[UILabel setLineBreakMode:](self->_filesLabel, "setLineBreakMode:", 5);
    -[NSArray firstObject](self->_itemsToMove, "firstObject");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    __54___UIDocumentTargetSelectionController__updatePalette__block_invoke((uint64_t)v19, v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setText:](self->_filesLabel, "setText:", v20);
  }
  else
  {
    v8 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(MEMORY[0x24BDD1488], "bundleWithIdentifier:", CFSTR("com.apple.CloudDocsUI"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("%lu items"), CFSTR("%lu items"), CFSTR("Localizable"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "localizedStringWithFormat:", v10, -[NSArray count](self->_itemsToMove, "count"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setText:](self->_filesLabel, "setText:", v11);

    v12 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(MEMORY[0x24BDD1488], "bundleWithIdentifier:", CFSTR("com.apple.CloudDocsUI"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("%@ & %lu more…"), CFSTR("%@ & %lu more…"), CFSTR("Localizable"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSArray objectAtIndex:](self->_itemsToMove, "objectAtIndex:", 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    __54___UIDocumentTargetSelectionController__updatePalette__block_invoke((uint64_t)v15, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "localizedStringWithFormat:", v14, v16, -[NSArray count](self->_itemsToMove, "count") - 1);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *))v7)[2](v7, v17);

    if (-[NSArray count](self->_itemsToMove, "count") == 2)
    {
      v18 = (void *)MEMORY[0x24BDD17C8];
      objc_msgSend(MEMORY[0x24BDD1488], "bundleWithIdentifier:", CFSTR("com.apple.CloudDocsUI"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "localizedStringForKey:value:table:", CFSTR("%@, %@"), CFSTR("%@, %@"), CFSTR("Localizable"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSArray objectAtIndex:](self->_itemsToMove, "objectAtIndex:", 0);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      __54___UIDocumentTargetSelectionController__updatePalette__block_invoke((uint64_t)v21, v21);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSArray objectAtIndex:](self->_itemsToMove, "objectAtIndex:", 1);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      __54___UIDocumentTargetSelectionController__updatePalette__block_invoke((uint64_t)v23, v23);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "localizedStringWithFormat:", v20, v22, v24, v36);
    }
    else
    {
      v25 = -[NSArray count](self->_itemsToMove, "count");
      v6 = MEMORY[0x24BDAC760];
      if (v25 < 3)
        goto LABEL_9;
      v26 = (void *)MEMORY[0x24BDD17C8];
      objc_msgSend(MEMORY[0x24BDD1488], "bundleWithIdentifier:", CFSTR("com.apple.CloudDocsUI"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "localizedStringForKey:value:table:", CFSTR("%@, %@ & %lu more…"), CFSTR("%@, %@ & %lu more…"), CFSTR("Localizable"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSArray objectAtIndex:](self->_itemsToMove, "objectAtIndex:", 0);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      __54___UIDocumentTargetSelectionController__updatePalette__block_invoke((uint64_t)v21, v21);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSArray objectAtIndex:](self->_itemsToMove, "objectAtIndex:", 1);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      __54___UIDocumentTargetSelectionController__updatePalette__block_invoke((uint64_t)v23, v23);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "localizedStringWithFormat:", v20, v22, v24, -[NSArray count](self->_itemsToMove, "count") - 2);
    }
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *))v7)[2](v7, v27);

    v6 = MEMORY[0x24BDAC760];
  }

LABEL_9:
  objc_initWeak(&location, self);
  -[NSArray firstObject](self->_itemsToMove, "firstObject");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "ui_resolveOnDiskBookmarkAndPromise");
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  -[_UIDocumentTargetSelectionController traitCollection](self, "traitCollection");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "displayScale");
  v32 = v31;

  if (!self->_firstFileThumbnailObservation)
  {
    +[BRObservableFile observerForKey:onFileURL:](BRObservableFile, "observerForKey:onFileURL:", 0, v29);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v37[0] = v6;
    v37[1] = 3221225472;
    v37[2] = __54___UIDocumentTargetSelectionController__updatePalette__block_invoke_3;
    v37[3] = &unk_24E43B010;
    v38 = v29;
    v40 = vdupq_n_s64(0x4046000000000000uLL);
    v41 = v32;
    objc_copyWeak(&v39, &location);
    objc_msgSend(v33, "addObserverBlock:", v37);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    firstFileThumbnailObservation = self->_firstFileThumbnailObservation;
    self->_firstFileThumbnailObservation = v34;

    objc_destroyWeak(&v39);
  }

  objc_destroyWeak(&location);
}

+ (id)_loadDocumentIconForURL:(id)a3 size:(CGSize)a4
{
  return +[_UIDocumentPickerContainerItem _blockingIconForURL:withSize:](_UIDocumentPickerContainerItem, "_blockingIconForURL:withSize:", a3, a4.width, a4.height);
}

+ (id)_loadThumbnailForURL:(id)a3 size:(CGSize)a4 scale:(double)a5 wantsBorder:(BOOL *)a6 generatedThumbnail:(BOOL *)a7
{
  double height;
  double width;
  uint64_t v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  id v18;

  height = a4.height;
  width = a4.width;
  v18 = 0;
  v12 = *MEMORY[0x24BDBCCF0];
  v13 = a3;
  objc_msgSend(v13, "getPromisedItemResourceValue:forKey:error:", &v18, v12, 0);
  v14 = v18;
  objc_msgSend(MEMORY[0x24BDC1570], "documentProxyForName:type:MIMEType:", 0, v14, 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  +[_UIDocumentPickerContainerItem _blockingThumbnailForItem:documentProxy:withSize:scale:wantsBorder:generatedThumbnail:](_UIDocumentPickerContainerItem, "_blockingThumbnailForItem:documentProxy:withSize:scale:wantsBorder:generatedThumbnail:", v13, v15, a6, a7, width, height, a5);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

- (void)_setIconViewImage:(id)a3 border:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  uint64_t v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  id v12;

  v4 = a4;
  -[UIImageView setImage:](self->_iconView, "setImage:", a3);
  if (v4)
  {
    objc_msgSend(MEMORY[0x24BDF6950], "separatorColor");
    v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v7 = objc_msgSend(v6, "CGColor");
    -[UIImageView layer](self->_iconView, "layer");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setBorderColor:", v7);

    -[_UIDocumentTargetSelectionController traitCollection](self, "traitCollection");
    v12 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "displayScale");
    v10 = 1.0 / v9;
    -[UIImageView layer](self->_iconView, "layer");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setBorderWidth:", v10);

  }
  else
  {
    -[UIImageView layer](self->_iconView, "layer");
    v12 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setBorderWidth:", 0.0);
  }

}

- (void)viewDidLayoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_UIDocumentTargetSelectionController;
  -[_UIDocumentTargetSelectionController viewDidLayoutSubviews](&v3, sel_viewDidLayoutSubviews);
  if (-[NSArray count](self->_itemsToMove, "count"))
  {
    if (self->_completedInitialDisplay)
      -[_UIDocumentTargetSelectionController _updatePalette](self, "_updatePalette");
  }
}

- (void)setItemsToMove:(id)a3
{
  NSArray *v4;
  NSArray *v5;
  NSArray *itemsToMove;
  NSArray *v7;

  v4 = (NSArray *)a3;
  if (self->_itemsToMove != v4)
  {
    v7 = v4;
    v5 = (NSArray *)-[NSArray copy](v4, "copy");
    itemsToMove = self->_itemsToMove;
    self->_itemsToMove = v5;

    v4 = v7;
    if (self->_completedInitialDisplay)
    {
      -[_UIDocumentTargetSelectionController _setupNavigationItem](self, "_setupNavigationItem");
      v4 = v7;
    }
  }

}

- (_UIDocumentTargetSelectionControllerDelegate)delegate
{
  return (_UIDocumentTargetSelectionControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSArray)itemsToMove
{
  return self->_itemsToMove;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_itemsToMove, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong(&self->_firstFileThumbnailObservation, 0);
  objc_storeStrong((id *)&self->_containerName, 0);
  objc_storeStrong((id *)&self->_filesLabel, 0);
  objc_storeStrong((id *)&self->_iconView, 0);
  objc_storeStrong((id *)&self->_palette, 0);
  objc_storeStrong((id *)&self->_containedNavigationController, 0);
  objc_storeStrong((id *)&self->_containerViewController, 0);
  objc_storeStrong((id *)&self->_weak_delegate, 0);
}

@end
