@implementation FPUIAuthenticationVolumeMountViewController

- (FPUIAuthenticationVolumeMountViewController)initWithVolumes:(id)a3 mountedVolumeIdentifiers:(id)a4
{
  id v6;
  id v7;
  FPUIAuthenticationVolumeMountViewController *v8;
  uint64_t v9;
  NSArray *allVolumeRepresentations;
  uint64_t v11;
  NSArray *mountedVolumeIdentifiers;
  uint64_t v13;
  NSMutableIndexSet *selectedVolumesIndexes;
  objc_super v16;

  v6 = a3;
  v7 = a4;
  v16.receiver = self;
  v16.super_class = (Class)FPUIAuthenticationVolumeMountViewController;
  v8 = -[FPUIAuthenticationTableViewController init](&v16, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    allVolumeRepresentations = v8->_allVolumeRepresentations;
    v8->_allVolumeRepresentations = (NSArray *)v9;

    v11 = objc_msgSend(v7, "copy");
    mountedVolumeIdentifiers = v8->_mountedVolumeIdentifiers;
    v8->_mountedVolumeIdentifiers = (NSArray *)v11;

    v13 = objc_opt_new();
    selectedVolumesIndexes = v8->_selectedVolumesIndexes;
    v8->_selectedVolumesIndexes = (NSMutableIndexSet *)v13;

  }
  return v8;
}

- (id)defaultRightBarButtonItem
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v14;

  v3 = objc_alloc(MEMORY[0x24BDF6860]);
  FPUILoc(CFSTR("DONE_NAV_BAR_BUTTON_TITLE"), v4, v5, v6, v7, v8, v9, v10, v14);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v3, "initWithTitle:style:target:action:", v11, 2, self, sel__done_);

  return v12;
}

- (void)viewDidLoad
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)FPUIAuthenticationVolumeMountViewController;
  -[FPUIAuthenticationTableViewController viewDidLoad](&v3, sel_viewDidLoad);
  -[FPUIAuthenticationTableViewController setCanTransitionToNextStep:](self, "setCanTransitionToNextStep:", -[FPUIAuthenticationVolumeMountViewController _canMoveToNextStep](self, "_canMoveToNextStep"));
}

- (void)_done:(id)a3
{
  void *v4;
  NSMutableIndexSet *selectedVolumesIndexes;
  void *v6;
  id v7;
  _QWORD v8[5];
  id v9;

  -[FPUIAuthenticationTableViewController setNavBarActivityIndicatorHidden:](self, "setNavBarActivityIndicatorHidden:", 0);
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  selectedVolumesIndexes = self->_selectedVolumesIndexes;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __53__FPUIAuthenticationVolumeMountViewController__done___block_invoke;
  v8[3] = &unk_24EFEDFF0;
  v8[4] = self;
  v9 = v4;
  v7 = v4;
  -[NSMutableIndexSet enumerateIndexesUsingBlock:](selectedVolumesIndexes, "enumerateIndexesUsingBlock:", v8);
  -[FPUIAuthenticationTableViewController setTransitioning:](self, "setTransitioning:", 1);
  -[FPUIAuthenticationTableViewController authenticationDelegate](self, "authenticationDelegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "connectionFlowDelegate:didPickVolumeMountIdentifiers:", self, v7);

}

void __53__FPUIAuthenticationVolumeMountViewController__done___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1048), "objectAtIndexedSubscript:", a2);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v3 = *(void **)(a1 + 40);
  objc_msgSend(v5, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v4);

}

- (void)setupTableViewSections
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  NSArray *obj;
  _QWORD v23[5];
  id v24;
  id location;
  _QWORD v26[6];
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  void *v31;
  void *v32;
  void *v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v21 = (void *)objc_opt_new();
  FPUILoc(CFSTR("SELECT_VOLUMES_TO_MOUNT"), v3, v4, v5, v6, v7, v8, v9, v20);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setHeaderTitle:", v10);

  objc_msgSend(v21, "setHeaderHeight:", *MEMORY[0x24BDF7DE0]);
  v11 = (void *)objc_opt_new();
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  obj = self->_allVolumeRepresentations;
  v12 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v27, v34, 16);
  if (v12)
  {
    v13 = *(_QWORD *)v28;
    v14 = MEMORY[0x24BDAC760];
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v28 != v13)
          objc_enumerationMutation(obj);
        v16 = *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * v15);
        v17 = (void *)objc_opt_new();
        v26[0] = v14;
        v26[1] = 3221225472;
        v26[2] = __69__FPUIAuthenticationVolumeMountViewController_setupTableViewSections__block_invoke;
        v26[3] = &unk_24EFEE018;
        v26[4] = v16;
        v26[5] = self;
        objc_msgSend(v17, "setCellCustomizationHandler:", v26);
        objc_initWeak(&location, self);
        v23[0] = v14;
        v23[1] = 3221225472;
        v23[2] = __69__FPUIAuthenticationVolumeMountViewController_setupTableViewSections__block_invoke_2;
        v23[3] = &unk_24EFEE040;
        objc_copyWeak(&v24, &location);
        v23[4] = self;
        objc_msgSend(v17, "setSelectionHandler:", v23);
        objc_msgSend(v11, "addObject:", v17);
        objc_destroyWeak(&v24);
        objc_destroyWeak(&location);

        ++v15;
      }
      while (v12 != v15);
      v12 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v27, v34, 16);
    }
    while (v12);
  }

  v33 = v21;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v33, 1);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[FPUIAuthenticationTableViewController setSectionDescriptors:](self, "setSectionDescriptors:", v18);

  v31 = &unk_24EFF2760;
  v32 = v11;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v32, &v31, 1);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[FPUIAuthenticationTableViewController setRowDescriptors:](self, "setRowDescriptors:", v19);

}

void __69__FPUIAuthenticationVolumeMountViewController_setupTableViewSections__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  id v15;

  v15 = a2;
  v5 = a3;
  objc_msgSend(*(id *)(a1 + 32), "displayName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "textLabel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setText:", v6);

  v8 = *(void **)(*(_QWORD *)(a1 + 40) + 1056);
  objc_msgSend(*(id *)(a1 + 32), "identifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v8, "containsObject:", v9) ^ 1;

  objc_msgSend(v15, "textLabel");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setEnabled:", v10);

  objc_msgSend(v15, "setUserInteractionEnabled:", v10);
  if ((v10 & 1) == 0)
  {
    objc_msgSend(v15, "setAccessoryType:", 3);
    v12 = objc_alloc(MEMORY[0x24BDF6AE8]);
    objc_msgSend(*(id *)(a1 + 40), "tableCellCheckmarkImageDisabled");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)objc_msgSend(v12, "initWithImage:", v13);
    objc_msgSend(v15, "setAccessoryView:", v14);

  }
  if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 1064), "containsIndex:", objc_msgSend(v5, "row")))
    objc_msgSend(v15, "setAccessoryType:", 3);

}

void __69__FPUIAuthenticationVolumeMountViewController_setupTableViewSections__block_invoke_2(uint64_t a1, void *a2)
{
  id *v3;
  id v4;
  id WeakRetained;
  void *v6;
  uint64_t v7;
  int v8;
  void *v9;
  uint64_t v10;
  id v11;
  id v12;

  v3 = (id *)(a1 + 40);
  v4 = a2;
  WeakRetained = objc_loadWeakRetained(v3);
  objc_msgSend(WeakRetained, "tableView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "cellForRowAtIndexPath:", v4);
  v12 = (id)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v4, "row");
  v8 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1064), "containsIndex:", v7);
  v9 = *(void **)(*(_QWORD *)(a1 + 32) + 1064);
  if (v8)
  {
    objc_msgSend(v9, "removeIndex:", v7);
    v10 = 0;
  }
  else
  {
    objc_msgSend(v9, "addIndex:", v7);
    v10 = 3;
  }
  objc_msgSend(v12, "setAccessoryType:", v10);
  v11 = objc_loadWeakRetained(v3);
  objc_msgSend(v11, "selectedVolumesIndexesDidChange");

}

- (id)tableCellCheckmarkImageDisabled
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;

  v2 = (void *)tableCellCheckmarkImageDisabled_sTintedImage;
  if (!tableCellCheckmarkImageDisabled_sTintedImage)
  {
    objc_msgSend(MEMORY[0x24BDF6AC8], "kitImageNamed:", CFSTR("UIPreferencesBlueCheck.png"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDF6950], "colorWithRed:green:blue:alpha:", 0.698039216, 0.698039216, 0.698039216, 1.0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "_flatImageWithColor:", v4);
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = (void *)tableCellCheckmarkImageDisabled_sTintedImage;
    tableCellCheckmarkImageDisabled_sTintedImage = v5;

    v2 = (void *)tableCellCheckmarkImageDisabled_sTintedImage;
  }
  return v2;
}

- (void)selectedVolumesIndexesDidChange
{
  -[FPUIAuthenticationTableViewController setCanTransitionToNextStep:](self, "setCanTransitionToNextStep:", -[FPUIAuthenticationVolumeMountViewController _canMoveToNextStep](self, "_canMoveToNextStep"));
}

- (BOOL)_canMoveToNextStep
{
  return -[NSMutableIndexSet count](self->_selectedVolumesIndexes, "count") != 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_selectedVolumesIndexes, 0);
  objc_storeStrong((id *)&self->_mountedVolumeIdentifiers, 0);
  objc_storeStrong((id *)&self->_allVolumeRepresentations, 0);
}

@end
